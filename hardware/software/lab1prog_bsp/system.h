/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'cpu' in SOPC Builder design 'RamAndFlash_sopc'
 * SOPC Builder design path: D:/lab1_2_prog/RamAndFlash_sopc.sopcinfo
 *
 * Generated: Fri May 18 10:33:52 CST 2018
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x1804820
#define ALT_CPU_CPU_FREQ 50000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x0
#define ALT_CPU_CPU_IMPLEMENTATION "fast"
#define ALT_CPU_DATA_ADDR_WIDTH 0x19
#define ALT_CPU_DCACHE_LINE_SIZE 32
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_DCACHE_SIZE 2048
#define ALT_CPU_EXCEPTION_ADDR 0x800020
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 50000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 1
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 32
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_ICACHE_SIZE 4096
#define ALT_CPU_INITDA_SUPPORTED
#define ALT_CPU_INST_ADDR_WIDTH 0x19
#define ALT_CPU_NAME "cpu"
#define ALT_CPU_NUM_OF_SHADOW_REG_SETS 0
#define ALT_CPU_RESET_ADDR 0x800000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x1804820
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x0
#define NIOS2_CPU_IMPLEMENTATION "fast"
#define NIOS2_DATA_ADDR_WIDTH 0x19
#define NIOS2_DCACHE_LINE_SIZE 32
#define NIOS2_DCACHE_LINE_SIZE_LOG2 5
#define NIOS2_DCACHE_SIZE 2048
#define NIOS2_EXCEPTION_ADDR 0x800020
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 1
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 32
#define NIOS2_ICACHE_LINE_SIZE_LOG2 5
#define NIOS2_ICACHE_SIZE 4096
#define NIOS2_INITDA_SUPPORTED
#define NIOS2_INST_ADDR_WIDTH 0x19
#define NIOS2_NUM_OF_SHADOW_REG_SETS 0
#define NIOS2_RESET_ADDR 0x800000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_CFI_FLASH
#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_NEW_SDRAM_CONTROLLER
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SYSID
#define __ALTERA_AVALON_TIMER
#define __ALTERA_NIOS2
#define __ALTERA_UP_AVALON_VIDEO_CHARACTER_BUFFER_WITH_DMA
#define __ALTERA_UP_AVALON_VIDEO_PIXEL_BUFFER_DMA
#define __ALTPLL


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "CYCLONEIII"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart"
#define ALT_STDERR_BASE 0x1805080
#define ALT_STDERR_DEV jtag_uart
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart"
#define ALT_STDIN_BASE 0x1805080
#define ALT_STDIN_DEV jtag_uart
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart"
#define ALT_STDOUT_BASE 0x1805080
#define ALT_STDOUT_DEV jtag_uart
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "RamAndFlash_sopc"


/*
 * cfi_flash configuration
 *
 */

#define ALT_MODULE_CLASS_cfi_flash altera_avalon_cfi_flash
#define CFI_FLASH_BASE 0x1400000
#define CFI_FLASH_HOLD_VALUE 50
#define CFI_FLASH_IRQ -1
#define CFI_FLASH_IRQ_INTERRUPT_CONTROLLER_ID -1
#define CFI_FLASH_NAME "/dev/cfi_flash"
#define CFI_FLASH_SETUP_VALUE 50
#define CFI_FLASH_SIZE 4194304u
#define CFI_FLASH_SPAN 4194304
#define CFI_FLASH_TIMING_UNITS "ns"
#define CFI_FLASH_TYPE "altera_avalon_cfi_flash"
#define CFI_FLASH_WAIT_VALUE 100


/*
 * hal configuration
 *
 */

#define ALT_MAX_FD 32
#define ALT_SYS_CLK TIMER
#define ALT_TIMESTAMP_CLK none


/*
 * jtag_uart configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart altera_avalon_jtag_uart
#define JTAG_UART_BASE 0x1805080
#define JTAG_UART_IRQ 0
#define JTAG_UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_NAME "/dev/jtag_uart"
#define JTAG_UART_READ_DEPTH 64
#define JTAG_UART_READ_THRESHOLD 8
#define JTAG_UART_SPAN 8
#define JTAG_UART_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_WRITE_DEPTH 64
#define JTAG_UART_WRITE_THRESHOLD 8


/*
 * onchip_memory configuration
 *
 */

#define ALT_MODULE_CLASS_onchip_memory altera_avalon_onchip_memory2
#define ONCHIP_MEMORY_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define ONCHIP_MEMORY_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define ONCHIP_MEMORY_BASE 0x1800000
#define ONCHIP_MEMORY_CONTENTS_INFO ""
#define ONCHIP_MEMORY_DUAL_PORT 1
#define ONCHIP_MEMORY_GUI_RAM_BLOCK_TYPE "Automatic"
#define ONCHIP_MEMORY_INIT_CONTENTS_FILE "onchip_memory"
#define ONCHIP_MEMORY_INIT_MEM_CONTENT 1
#define ONCHIP_MEMORY_INSTANCE_ID "NONE"
#define ONCHIP_MEMORY_IRQ -1
#define ONCHIP_MEMORY_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ONCHIP_MEMORY_NAME "/dev/onchip_memory"
#define ONCHIP_MEMORY_NON_DEFAULT_INIT_FILE_ENABLED 0
#define ONCHIP_MEMORY_RAM_BLOCK_TYPE "Auto"
#define ONCHIP_MEMORY_READ_DURING_WRITE_MODE "DONT_CARE"
#define ONCHIP_MEMORY_SIZE_MULTIPLE 1
#define ONCHIP_MEMORY_SIZE_VALUE 8192u
#define ONCHIP_MEMORY_SPAN 8192
#define ONCHIP_MEMORY_TYPE "altera_avalon_onchip_memory2"
#define ONCHIP_MEMORY_WRITABLE 1


/*
 * pio_btn0 configuration
 *
 */

#define ALT_MODULE_CLASS_pio_btn0 altera_avalon_pio
#define PIO_BTN0_BASE 0x1805050
#define PIO_BTN0_BIT_CLEARING_EDGE_REGISTER 1
#define PIO_BTN0_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_BTN0_CAPTURE 1
#define PIO_BTN0_DATA_WIDTH 3
#define PIO_BTN0_DO_TEST_BENCH_WIRING 0
#define PIO_BTN0_DRIVEN_SIM_VALUE 0x0
#define PIO_BTN0_EDGE_TYPE "RISING"
#define PIO_BTN0_FREQ 50000000u
#define PIO_BTN0_HAS_IN 1
#define PIO_BTN0_HAS_OUT 0
#define PIO_BTN0_HAS_TRI 0
#define PIO_BTN0_IRQ 2
#define PIO_BTN0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define PIO_BTN0_IRQ_TYPE "EDGE"
#define PIO_BTN0_NAME "/dev/pio_btn0"
#define PIO_BTN0_RESET_VALUE 0x0
#define PIO_BTN0_SPAN 16
#define PIO_BTN0_TYPE "altera_avalon_pio"


/*
 * pio_led configuration
 *
 */

#define ALT_MODULE_CLASS_pio_led altera_avalon_pio
#define PIO_LED_BASE 0x1805030
#define PIO_LED_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_LED_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_LED_CAPTURE 0
#define PIO_LED_DATA_WIDTH 10
#define PIO_LED_DO_TEST_BENCH_WIRING 0
#define PIO_LED_DRIVEN_SIM_VALUE 0x0
#define PIO_LED_EDGE_TYPE "NONE"
#define PIO_LED_FREQ 50000000u
#define PIO_LED_HAS_IN 0
#define PIO_LED_HAS_OUT 1
#define PIO_LED_HAS_TRI 0
#define PIO_LED_IRQ -1
#define PIO_LED_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_LED_IRQ_TYPE "NONE"
#define PIO_LED_NAME "/dev/pio_led"
#define PIO_LED_RESET_VALUE 0x0
#define PIO_LED_SPAN 16
#define PIO_LED_TYPE "altera_avalon_pio"


/*
 * pio_seg7 configuration
 *
 */

#define ALT_MODULE_CLASS_pio_seg7 altera_avalon_pio
#define PIO_SEG7_BASE 0x1805040
#define PIO_SEG7_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_SEG7_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_SEG7_CAPTURE 0
#define PIO_SEG7_DATA_WIDTH 32
#define PIO_SEG7_DO_TEST_BENCH_WIRING 0
#define PIO_SEG7_DRIVEN_SIM_VALUE 0x0
#define PIO_SEG7_EDGE_TYPE "NONE"
#define PIO_SEG7_FREQ 50000000u
#define PIO_SEG7_HAS_IN 0
#define PIO_SEG7_HAS_OUT 1
#define PIO_SEG7_HAS_TRI 0
#define PIO_SEG7_IRQ -1
#define PIO_SEG7_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_SEG7_IRQ_TYPE "NONE"
#define PIO_SEG7_NAME "/dev/pio_seg7"
#define PIO_SEG7_RESET_VALUE 0x0
#define PIO_SEG7_SPAN 16
#define PIO_SEG7_TYPE "altera_avalon_pio"


/*
 * pio_sw configuration
 *
 */

#define ALT_MODULE_CLASS_pio_sw altera_avalon_pio
#define PIO_SW_BASE 0x1805070
#define PIO_SW_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_SW_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_SW_CAPTURE 0
#define PIO_SW_DATA_WIDTH 10
#define PIO_SW_DO_TEST_BENCH_WIRING 0
#define PIO_SW_DRIVEN_SIM_VALUE 0x0
#define PIO_SW_EDGE_TYPE "NONE"
#define PIO_SW_FREQ 50000000u
#define PIO_SW_HAS_IN 1
#define PIO_SW_HAS_OUT 0
#define PIO_SW_HAS_TRI 0
#define PIO_SW_IRQ -1
#define PIO_SW_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_SW_IRQ_TYPE "NONE"
#define PIO_SW_NAME "/dev/pio_sw"
#define PIO_SW_RESET_VALUE 0x0
#define PIO_SW_SPAN 16
#define PIO_SW_TYPE "altera_avalon_pio"


/*
 * pll configuration
 *
 */

#define ALT_MODULE_CLASS_pll altpll
#define PLL_BASE 0x1805020
#define PLL_IRQ -1
#define PLL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PLL_NAME "/dev/pll"
#define PLL_SPAN 16
#define PLL_TYPE "altpll"


/*
 * sdram configuration
 *
 */

#define ALT_MODULE_CLASS_sdram altera_avalon_new_sdram_controller
#define SDRAM_BASE 0x800000
#define SDRAM_CAS_LATENCY 3
#define SDRAM_CONTENTS_INFO ""
#define SDRAM_INIT_NOP_DELAY 0.0
#define SDRAM_INIT_REFRESH_COMMANDS 2
#define SDRAM_IRQ -1
#define SDRAM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SDRAM_IS_INITIALIZED 1
#define SDRAM_NAME "/dev/sdram"
#define SDRAM_POWERUP_DELAY 100.0
#define SDRAM_REFRESH_PERIOD 15.625
#define SDRAM_REGISTER_DATA_IN 1
#define SDRAM_SDRAM_ADDR_WIDTH 0x16
#define SDRAM_SDRAM_BANK_WIDTH 2
#define SDRAM_SDRAM_COL_WIDTH 8
#define SDRAM_SDRAM_DATA_WIDTH 16
#define SDRAM_SDRAM_NUM_BANKS 4
#define SDRAM_SDRAM_NUM_CHIPSELECTS 1
#define SDRAM_SDRAM_ROW_WIDTH 12
#define SDRAM_SHARED_DATA 0
#define SDRAM_SIM_MODEL_BASE 0
#define SDRAM_SPAN 8388608
#define SDRAM_STARVATION_INDICATOR 0
#define SDRAM_TRISTATE_BRIDGE_SLAVE ""
#define SDRAM_TYPE "altera_avalon_new_sdram_controller"
#define SDRAM_T_AC 5.5
#define SDRAM_T_MRD 3
#define SDRAM_T_RCD 20.0
#define SDRAM_T_RFC 70.0
#define SDRAM_T_RP 20.0
#define SDRAM_T_WR 14.0


/*
 * sysid configuration
 *
 */

#define ALT_MODULE_CLASS_sysid altera_avalon_sysid
#define SYSID_BASE 0x1805088
#define SYSID_ID 0u
#define SYSID_IRQ -1
#define SYSID_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_NAME "/dev/sysid"
#define SYSID_SPAN 8
#define SYSID_TIMESTAMP 1526608451u
#define SYSID_TYPE "altera_avalon_sysid"


/*
 * timer configuration
 *
 */

#define ALT_MODULE_CLASS_timer altera_avalon_timer
#define TIMER_ALWAYS_RUN 0
#define TIMER_BASE 0x1805000
#define TIMER_COUNTER_SIZE 32
#define TIMER_FIXED_PERIOD 0
#define TIMER_FREQ 50000000u
#define TIMER_IRQ 1
#define TIMER_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER_LOAD_VALUE 49999ull
#define TIMER_MULT 0.0010
#define TIMER_NAME "/dev/timer"
#define TIMER_PERIOD 1
#define TIMER_PERIOD_UNITS "ms"
#define TIMER_RESET_OUTPUT 0
#define TIMER_SNAPSHOT 1
#define TIMER_SPAN 32
#define TIMER_TICKS_PER_SEC 1000u
#define TIMER_TIMEOUT_PULSE_OUTPUT 0
#define TIMER_TYPE "altera_avalon_timer"


/*
 * video_character_buffer_with_dma_avalon_char_buffer_slave configuration
 *
 */

#define ALT_MODULE_CLASS_video_character_buffer_with_dma_avalon_char_buffer_slave altera_up_avalon_video_character_buffer_with_dma
#define VIDEO_CHARACTER_BUFFER_WITH_DMA_AVALON_CHAR_BUFFER_SLAVE_BASE 0x1802000
#define VIDEO_CHARACTER_BUFFER_WITH_DMA_AVALON_CHAR_BUFFER_SLAVE_IRQ -1
#define VIDEO_CHARACTER_BUFFER_WITH_DMA_AVALON_CHAR_BUFFER_SLAVE_IRQ_INTERRUPT_CONTROLLER_ID -1
#define VIDEO_CHARACTER_BUFFER_WITH_DMA_AVALON_CHAR_BUFFER_SLAVE_NAME "/dev/video_character_buffer_with_dma_avalon_char_buffer_slave"
#define VIDEO_CHARACTER_BUFFER_WITH_DMA_AVALON_CHAR_BUFFER_SLAVE_SPAN 8192
#define VIDEO_CHARACTER_BUFFER_WITH_DMA_AVALON_CHAR_BUFFER_SLAVE_TYPE "altera_up_avalon_video_character_buffer_with_dma"


/*
 * video_character_buffer_with_dma_avalon_char_control_slave configuration
 *
 */

#define ALT_MODULE_CLASS_video_character_buffer_with_dma_avalon_char_control_slave altera_up_avalon_video_character_buffer_with_dma
#define VIDEO_CHARACTER_BUFFER_WITH_DMA_AVALON_CHAR_CONTROL_SLAVE_BASE 0x1805090
#define VIDEO_CHARACTER_BUFFER_WITH_DMA_AVALON_CHAR_CONTROL_SLAVE_IRQ -1
#define VIDEO_CHARACTER_BUFFER_WITH_DMA_AVALON_CHAR_CONTROL_SLAVE_IRQ_INTERRUPT_CONTROLLER_ID -1
#define VIDEO_CHARACTER_BUFFER_WITH_DMA_AVALON_CHAR_CONTROL_SLAVE_NAME "/dev/video_character_buffer_with_dma_avalon_char_control_slave"
#define VIDEO_CHARACTER_BUFFER_WITH_DMA_AVALON_CHAR_CONTROL_SLAVE_SPAN 8
#define VIDEO_CHARACTER_BUFFER_WITH_DMA_AVALON_CHAR_CONTROL_SLAVE_TYPE "altera_up_avalon_video_character_buffer_with_dma"


/*
 * video_pixel_buffer_dma configuration
 *
 */

#define ALT_MODULE_CLASS_video_pixel_buffer_dma altera_up_avalon_video_pixel_buffer_dma
#define VIDEO_PIXEL_BUFFER_DMA_BASE 0x1805060
#define VIDEO_PIXEL_BUFFER_DMA_IRQ -1
#define VIDEO_PIXEL_BUFFER_DMA_IRQ_INTERRUPT_CONTROLLER_ID -1
#define VIDEO_PIXEL_BUFFER_DMA_NAME "/dev/video_pixel_buffer_dma"
#define VIDEO_PIXEL_BUFFER_DMA_SPAN 16
#define VIDEO_PIXEL_BUFFER_DMA_TYPE "altera_up_avalon_video_pixel_buffer_dma"

#endif /* __SYSTEM_H_ */
