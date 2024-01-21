// FreeRTOS includes
#include <FreeRTOS.h>
#include <task.h>
#include "mq4.c"
#include "dht.c"
// Input/Output
#include <stdio.h>

// UART library
#include <bl_uart.h>

// DMA library
#include <bl_dma.h>

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
  bl_uart_init(0, 16, 7, 255, 255, 2 * 1000 * 1000);

  /* (Re)define Heap */
  vPortDefineHeapRegions(xHeapRegions);

  /* Initialize DMA */
  bl_dma_init();

  /* Set up ADC reading task */
  static StackType_t mq4_stack[MQ4_STACK_SIZE];
  static StaticTask_t mq4_task;
  /* Set up BUZZER reading task */
  static StackType_t buzzer_stack[BUZZER_STACK_SIZE];
  static StaticTask_t buzzer_task;

  /* Set up DHT task */
  static StackType_t dht_stack[DHT_STACK_SIZE];
  static StaticTask_t dht_task;

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
      20,             /* Task priority */
      dht_stack,      /* Stack to use for the task */
      &dht_task       /* Task handle (could be referenced in API calls later, e.g. for changing its priority )*/
  );

  /* Also start the task (task creation only creates the task control block) */
  vTaskStartScheduler();
}
