
#include <FreeRTOS.h>
#include <task.h>

#include <stdio.h>

#include <bl_gpio.h>

#define BUZZER_PIN 1

// Buzzer control constants
#define BUZZER_ON 1
#define BUZZER_OFF 0

// Define pull-up/pull-down constants
#define DISABLE_PULLUP 0
#define ENABLE_PULLUP 1

#define DISABLE_PULLDOWN 0
#define ENABLE_PULLDOWN 1

void task_buzzer(void *pvParameters)
{
    // Initialize GPIO1 for the buzzer
    bl_gpio_enable_output(BUZZER_PIN, DISABLE_PULLUP, DISABLE_PULLDOWN);
    bl_gpio_output_set(BUZZER_PIN, BUZZER_OFF);
    while (1)
    {
        // Turn on the buzzer
        bl_gpio_output_set(BUZZER_PIN, BUZZER_ON);
        vTaskDelay(100);

        // Turn off the buzzer
        bl_gpio_output_set(BUZZER_PIN, BUZZER_OFF);
        vTaskDelay(200);
    }
}
