#include <FreeRTOS.h>
#include <task.h>

#include <stdio.h>
#include <math.h>
#include <inttypes.h>
#include <string.h>
#include "buzzer.c"
#include <bl602_adc.h>
#include <bl_adc.h>
#include <bl_dma.h>
#include "color.h"
#define ADC_GAIN1 ADC_PGA_GAIN_1
#define ADC_GAIN2 ADC_PGA_GAIN_1

#define ADC_FREQUENCY 4096
#define NUMBER_OF_SAMPLES 1024

#define SINGLE_CHANNEL_CONVERSION_MODE 1
#define BUZZER_THRESHOLD 40.0
#define MQ4_SENSOR_PIN 14
double sensor_volt = 0;
double ppm = 1;

void init_adc(uint8_t pin);
uint32_t read_adc();

void task_mq4(void *pvParameters)
{
  printf("MQ4 task started\r\n");

  init_adc(MQ4_SENSOR_PIN);

  printf("MQ4 Sensor initialized\r\n");

  vTaskDelay(2000 / portTICK_PERIOD_MS);

  while (1)
  {
    uint32_t adcValue = read_adc();

    double sensorValue = (double)adcValue / 500.0;

    double sensor_volt = sensorValue * (5.0 / 1023.0);
    /*     if (sensor_volt != 0.0)
    {
      double RS_air = ((5.0 * 1.0) / sensor_volt) - 1.0;           printf("resistance air MQ4 sensor: %f\r\n", RS_air);
      double R0 = RS_air / 4.4;           printf("R0 = %f\r\n", R0);
    } */

    if (sensor_volt != 0.0)
    {
      double m = -0.318;
      double b = 1.133;
      double R0 = 11.80;
      double RS_gas = ((5.0 * 1.0) / sensor_volt) - 1.0;
      double ratio = RS_gas / R0;
      double ppm_log = (log10(ratio) - b) / m;
      ppm = pow(10, ppm_log);

      printf(MAGENTA "Gas ppm = %f\r\n", ppm);
      // double percentage = ppm / 10000;
    }
    vTaskDelay(5000 / portTICK_PERIOD_MS);
    printf("\e[1;1H\e[2J");
  }

  vTaskDelete(NULL);
}

static int set_adc_gain(uint32_t gain1, uint32_t gain2)
{
  uint32_t reg = BL_RD_REG(AON_BASE, AON_GPADC_REG_CONFIG2);

  reg = BL_SET_REG_BITS_VAL(reg, AON_GPADC_PGA1_GAIN, gain1);
  reg = BL_SET_REG_BITS_VAL(reg, AON_GPADC_PGA2_GAIN, gain2);

  if (gain1 != ADC_PGA_GAIN_NONE || gain2 != ADC_PGA_GAIN_NONE)
  {
    reg = BL_SET_REG_BITS_VAL(reg, AON_GPADC_CHOP_MODE, 2);
  }
  else
  {
    reg = BL_SET_REG_BITS_VAL(reg, AON_GPADC_CHOP_MODE, 1);
  }

  reg = BL_CLR_REG_BIT(reg, AON_GPADC_PGA_VCMI_EN);
  if (gain1 != ADC_PGA_GAIN_NONE || gain2 != ADC_PGA_GAIN_NONE)
  {
    reg = BL_SET_REG_BIT(reg, AON_GPADC_PGA_EN);
  }
  else
  {
    reg = BL_CLR_REG_BIT(reg, AON_GPADC_PGA_EN);
  }

  BL_WR_REG(AON_BASE, AON_GPADC_REG_CONFIG2, reg);
  return 0;
}

void init_adc(uint8_t pin)
{
  switch (pin)
  {

  case MQ4_SENSOR_PIN:
    break;

  default:
    printf("Invalid pin selected for ADC\r\n");
    return;
  }

  bl_adc_freq_init(SINGLE_CHANNEL_CONVERSION_MODE, ADC_FREQUENCY);

  bl_adc_init(SINGLE_CHANNEL_CONVERSION_MODE, pin);

  set_adc_gain(ADC_GAIN1, ADC_GAIN2);

  bl_adc_dma_init(SINGLE_CHANNEL_CONVERSION_MODE, NUMBER_OF_SAMPLES);

  bl_adc_gpio_init(pin);

  int channel = bl_adc_get_channel_by_gpio(pin);
  adc_ctx_t *ctx = bl_dma_find_ctx_by_channel(ADC_DMA_CHANNEL);
  ctx->chan_init_table |= (1 << channel);

  bl_adc_start();
}

uint32_t read_adc()
{
  static uint32_t adc_data[NUMBER_OF_SAMPLES];

  adc_ctx_t *ctx = bl_dma_find_ctx_by_channel(ADC_DMA_CHANNEL);

  if (ctx->channel_data == NULL)
  {
    return 0;
  }

  memcpy(
      (uint8_t *)adc_data,
      (uint8_t *)(ctx->channel_data),
      sizeof(adc_data));

  uint32_t sum = 0;
  for (int i = 0; i < NUMBER_OF_SAMPLES; i++)
  {
    uint32_t scaled = ((adc_data[i] & 0xFFFF) * 32000) >> 16;
    sum += scaled;
  }

  return sum / NUMBER_OF_SAMPLES;
}
