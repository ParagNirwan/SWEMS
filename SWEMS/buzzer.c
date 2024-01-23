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
extern int buzz;
extern uint16_t humidity;
extern int16_t temp;
extern double ppm;
void task_buzzer()
{
    // Initialize GPIO1 for the buzzer
    bl_gpio_enable_output(BUZZER_PIN, DISABLE_PULLUP, DISABLE_PULLDOWN);
    bl_gpio_output_set(BUZZER_PIN, BUZZER_OFF);

    while (1)
    {
        if (ppm >= 300 || (temp / 10) > 40 || (temp / 10) < 10 || (humidity / 10) >= 60)
        {

            // Turn on the buzzer
            bl_gpio_output_set(BUZZER_PIN, BUZZER_ON);
            vTaskDelay(200);

            // // Turn off the buzzer
            bl_gpio_output_set(BUZZER_PIN, BUZZER_OFF);
            vTaskDelay(100);
        }
        else
        {
            bl_gpio_output_set(BUZZER_PIN, BUZZER_OFF);
        }
    }
}
