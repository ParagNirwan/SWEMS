// FreeRTOS
#include <FreeRTOS.h>
#include <task.h>

// Input/output
#include <stdio.h>

// Function Declarations
void task_buzzer(void *pvParameters);

void bfl_main(void)
{

  // Set up Buzzer task
  static StackType_t buzzer_stack[configMINIMAL_STACK_SIZE];
  static StaticTask_t buzzer_task;

  // Start Buzzer task
  xTaskCreateStatic(
      task_buzzer,
      (char *)"buzzer",
      configMINIMAL_STACK_SIZE,
      NULL,
      10, // Adjust priority as needed
      buzzer_stack,
      &buzzer_task);

  // Start FreeRTOS scheduler
  vTaskStartScheduler();
}
