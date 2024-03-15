// FreeRTOS includes
#include <FreeRTOS.h>
#include <task.h>
#include "mq4.c"
#include "dht.c"
#include <bl_dma.h>
#include <bl_irq.h>
#include <bl_sec.h>
#include <bl_sys_time.h>
#include <bl_uart.h>
#include <hal_boot2.h>
#include <hal_board.h>
#include <hal_hwtimer.h>

#include <blog.h>
#include <lwip/tcpip.h>

int buzz = 0;
/* Define heap regions */
extern uint8_t _heap_start;
extern uint8_t _heap_size;
extern uint8_t _heap_wifi_start;
extern uint8_t _heap_wifi_size;

static HeapRegion_t xHeapRegions[] =
    {
        {&_heap_start, (unsigned int)&_heap_size},
        {&_heap_wifi_start, (unsigned int)&_heap_wifi_size},
        {NULL, 0},
        {NULL, 0}};

/* Size of the stack for the task */
#define MQ4_STACK_SIZE 512
#define BUZZER_STACK_SIZE 128
#define DHT_STACK_SIZE 768
// #define BUZZER_TRIGGER_STACK_SIZE 768
void bfl_main(void)
{
    /* Initialize UART
     * Ports: 16+7 (TX+RX)
     * Baudrate: 2 million
     */
    /* Set up ADC reading task */
    static StackType_t mq4_stack[MQ4_STACK_SIZE];
    static StaticTask_t mq4_task;
    /* Set up BUZZER reading task */
    static StackType_t buzzer_stack[BUZZER_STACK_SIZE];
    static StaticTask_t buzzer_task;

    /* Set up DHT task */
    static StackType_t dht_stack[DHT_STACK_SIZE];
    static StaticTask_t dht_task;

    static StackType_t wifi_stack[1024];
    static StaticTask_t wifi_task;

    #if WIFI_MODE_PINECONE == WIFI_MODE_STA
    static StackType_t httpc_stack[8192];
    static StaticTask_t httpc_task;
    /*     static StackType_t http_stack[1024];
    static StaticTask_t http_task; */
    #endif

    bl_uart_init(0, 16, 7, 255, 255, 2 * 1000 * 1000);

    /* (Re)define Heap */
    vPortDefineHeapRegions(xHeapRegions);

    /* Initialize DMA */
    blog_init();
    bl_irq_init();
    bl_sec_init();
    bl_dma_init();
    hal_boot2_init();
    hal_board_cfg(0);


    #if WIFI_MODE_PINECONE == WIFI_MODE_STA
    printf("[SYSTEM] Starting httpc task\r\n");
    extern void task_https(void *pvParameters);
    xTaskCreateStatic(task_https, (char*)"httpc", 8192, NULL, 10, httpc_stack, &httpc_task);
    /*   printf("[SYSTEM] Starting http task\r\n"); */
    /*   extern void task_http(void *pvParameters);
    xTaskCreateStatic(task_http, (char*)"http", 1024, NULL, 10, http_stack, &http_task); */
    #endif
    printf("[SYSTEM] Starting WiFi task\r\n");
    extern void task_wifi(void *pvParameters);
    xTaskCreateStatic(task_wifi, (char*)"wifi", 1024, NULL, 16, wifi_stack, &wifi_task);

    xTaskCreateStatic(
        task_mq4,
        (char *)"mq4",
        MQ4_STACK_SIZE,
        NULL,
        15,
        mq4_stack,
        &mq4_task);

    xTaskCreateStatic(
        task_buzzer,
        (char *)"buzzer",
        BUZZER_STACK_SIZE,
        NULL,
        10,
        buzzer_stack,
        &buzzer_task);
    xTaskCreateStatic(
        task_dht,       /* name of the function implementing the task -> defined in led.c */
        (char *)"dht",  /* human readable name of the task */
        DHT_STACK_SIZE, /* Stack size */
        NULL,           /* parameters for the function -> not required here */
        30,             /* Task priority */
        dht_stack,      /* Stack to use for the task */
        &dht_task       /* Task handle (could be referenced in API calls later, e.g. for changing its priority )*/
    );

    /* Also start the task (task creation only creates the task control block) */
    vTaskStartScheduler();
}
