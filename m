Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8466F10C218
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Nov 2019 03:03:01 +0100 (CET)
Received: from localhost ([::1]:44736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ia992-0000zf-J6
	for lists+qemu-devel@lfdr.de; Wed, 27 Nov 2019 21:03:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52890)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ia8xK-0006E8-A5
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 20:50:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ia8xH-0004Zi-Vt
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 20:50:54 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42681)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ia8xF-0004Wi-OY
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 20:50:49 -0500
Received: by mail-wr1-x442.google.com with SMTP id a15so29093021wrf.9
 for <qemu-devel@nongnu.org>; Wed, 27 Nov 2019 17:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=18J1QKv1JXyfly4F+sWQAX57l7kF5m0Ye34ys/P39T8=;
 b=AkJRcSa11WFkMYf3ndj1ADMeIJTvzQA9nfDFFpW292RNs+YpV0k59JpclY6MXgLgqk
 c5L+7pnLA7Qz7In7SM9lhUrxOMvt3rxYnI6J798wnOIaXJJY3z4OmHLcjb/zMzhjSzT1
 xDL4EIuDADPznVHqnXlWDtxQlqo/BmiQz63LTPR7IIw2QVc9Ws1vGSGYPoIK9W0Y83r6
 YIXWk6SOPPH5nkFmCCSPzjebcsdbUcuENV+MpymBesBpFxGiXJIz7hJYmCd3kjpl5+BG
 HWU5WJoSbe1roIgWEXe+HAOmYHM2QbFs5TqTDScjtMMAdD/YbVyxYnWSPJIjOErm+0dn
 gL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=18J1QKv1JXyfly4F+sWQAX57l7kF5m0Ye34ys/P39T8=;
 b=ktDbfIv+6AS7MOsJd1Qc+912qseMfLxR9peJFfTkyVmKnN5CXqbdLI+h94sY8ncqWO
 g6XY69Pvt+jrAk4k2jj4EhS3PSjB7yiTrDIkqD3AmgVtSdzijbL8SgFVGYf6AU6WHcrn
 rNyxJGFKdL5U1A60HDcqDsMdiB5udTFGG/+6svzjpLTucuT0qOZLCcFQ7W+7dqO/qnv2
 ya3lI5SJGgiY/LbDhBYoOdxQHOmpHeHGjzQwGRtYTB1zN3SWrpVW0SMe9wOJwdi9DkC+
 nGaFcvw1VmfmDezuInBb4DdbtE5YQm3l3yTJ52I0May3wNTuFOGQdsZGH9YMXcZkHb2B
 TjHg==
X-Gm-Message-State: APjAAAXPym3ZXY4qnob+ouNCblbLZCRBGWQxcPA/5o8eXjaOhrupfZtQ
 +L5UAJTpI1IIqr0S7P/HngYMsQVs
X-Google-Smtp-Source: APXvYqzE25plzXjoOSBYkp6rUraaQ2cTbG8R8zPqXSNhUTPwL/7hEFSwKDGFnZOR4pl36WaTJe+SnQ==
X-Received: by 2002:a5d:40d0:: with SMTP id b16mr48628297wrq.232.1574905847966; 
 Wed, 27 Nov 2019 17:50:47 -0800 (PST)
Received: from x1w.redhat.com (182.red-88-21-103.staticip.rima-tde.net.
 [88.21.103.182])
 by smtp.gmail.com with ESMTPSA id k16sm8738061wru.0.2019.11.27.17.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 17:50:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Michael Rolnik <mrolnik@gmail.com>
Subject: [NOTFORMERGE PATCH 10/10] hw/avr: Remove the 'sample' board
Date: Thu, 28 Nov 2019 02:50:30 +0100
Message-Id: <20191128015030.27543-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191128015030.27543-1-f4bug@amsat.org>
References: <20191128015030.27543-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Joaquin de Andres <me@xcancerberox.com.ar>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Pavel Dovgalyuk <dovgaluk@ispras.ru>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We introduce real world boards with proper schematics,
let's remove this.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Patch meant to squash on 'target/avr: Add example board configuration'
---
 hw/avr/sample.c      | 282 -------------------------------------------
 hw/avr/Makefile.objs |   1 -
 2 files changed, 283 deletions(-)
 delete mode 100644 hw/avr/sample.c

diff --git a/hw/avr/sample.c b/hw/avr/sample.c
deleted file mode 100644
index 2295ec1b79..0000000000
--- a/hw/avr/sample.c
+++ /dev/null
@@ -1,282 +0,0 @@
-/*
- * QEMU AVR CPU
- *
- * Copyright (c) 2019 Michael Rolnik
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see
- * <http://www.gnu.org/licenses/lgpl-2.1.html>
- */
-
-/*
- *  NOTE:
- *      This is not a real AVR board, this is an example!
- *      The CPU is an approximation of an ATmega2560, but is missing various
- *      built-in peripherals.
- *
- *      This example board loads provided binary file into flash memory and
- *      executes it from 0x00000000 address in the code memory space.
- *
- *      Currently used for AVR CPU validation
- *
- */
-
-#include "qemu/osdep.h"
-#include "qapi/error.h"
-#include "qemu-common.h"
-#include "cpu.h"
-#include "hw/hw.h"
-#include "sysemu/sysemu.h"
-#include "sysemu/qtest.h"
-#include "ui/console.h"
-#include "hw/boards.h"
-#include "hw/loader.h"
-#include "qemu/error-report.h"
-#include "exec/address-spaces.h"
-#include "include/hw/sysbus.h"
-#include "include/hw/char/avr_usart.h"
-#include "include/hw/timer/avr_timer16.h"
-#include "include/hw/misc/avr_mask.h"
-#include "elf.h"
-#include "hw/misc/unimp.h"
-
-#define SIZE_FLASH 0x00040000
-#define SIZE_SRAM 0x00002000
-/*
- * Size of additional "external" memory, as if the AVR were configured to use
- * an external RAM chip.
- * Note that the configuration registers that normally enable this feature are
- * unimplemented.
- */
-#define SIZE_EXMEM 0x00000000
-
-/* Offsets of peripherals in emulated memory space (i.e. not host addresses)  */
-#define PRR0_BASE 0x64
-#define PRR1_BASE 0x65
-#define USART_BASE 0xc0
-#define TIMER1_BASE 0x80
-#define TIMER1_IMSK_BASE 0x6f
-#define TIMER1_IFR_BASE 0x36
-
-/* Interrupt numbers used by peripherals */
-#define USART_RXC_IRQ 24
-#define USART_DRE_IRQ 25
-#define USART_TXC_IRQ 26
-
-#define TIMER1_CAPT_IRQ 15
-#define TIMER1_COMPA_IRQ 16
-#define TIMER1_COMPB_IRQ 17
-#define TIMER1_COMPC_IRQ 18
-#define TIMER1_OVF_IRQ 19
-
-/*  Power reduction     */
-#define PRR1_BIT_PRTIM5     0x05    /*  Timer/Counter5  */
-#define PRR1_BIT_PRTIM4     0x04    /*  Timer/Counter4  */
-#define PRR1_BIT_PRTIM3     0x03    /*  Timer/Counter3  */
-#define PRR1_BIT_PRUSART3   0x02    /*  USART3  */
-#define PRR1_BIT_PRUSART2   0x01    /*  USART2  */
-#define PRR1_BIT_PRUSART1   0x00    /*  USART1  */
-
-#define PRR0_BIT_PRTWI      0x06    /*  TWI */
-#define PRR0_BIT_PRTIM2     0x05    /*  Timer/Counter2  */
-#define PRR0_BIT_PRTIM0     0x04    /*  Timer/Counter0  */
-#define PRR0_BIT_PRTIM1     0x03    /*  Timer/Counter1  */
-#define PRR0_BIT_PRSPI      0x02    /*  Serial Peripheral Interface */
-#define PRR0_BIT_PRUSART0   0x01    /*  USART0  */
-#define PRR0_BIT_PRADC      0x00    /*  ADC */
-
-typedef struct {
-    MachineClass parent;
-} SampleMachineClass;
-
-typedef struct {
-    MachineState parent;
-    MemoryRegion *ram;
-    MemoryRegion *flash;
-    AVRUsartState *usart0;
-    AVRTimer16State *timer1;
-    AVRMaskState *prr[2];
-} SampleMachineState;
-
-#define TYPE_SAMPLE_MACHINE MACHINE_TYPE_NAME("sample")
-
-#define SAMPLE_MACHINE(obj) \
-    OBJECT_CHECK(SampleMachineState, obj, TYPE_SAMPLE_MACHINE)
-#define SAMPLE_MACHINE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(SampleMachineClass, obj, TYPE_SAMPLE_MACHINE)
-#define SAMPLE_MACHINE_CLASS(klass) \
-    OBJECT_CLASS_CHECK(SampleMachineClass, klass, TYPE_SAMPLE_MACHINE)
-
-static void sample_init(MachineState *machine)
-{
-    SampleMachineState *sms = SAMPLE_MACHINE(machine);
-    MemoryRegion *system_memory = get_system_memory();
-    AVRCPU *cpu;
-    const char *firmware = NULL;
-    const char *filename;
-    int bytes_loaded;
-    SysBusDevice *busdev;
-    DeviceState *cpudev;
-
-    system_memory = get_system_memory();
-    sms->ram = g_new(MemoryRegion, 1);
-    sms->flash = g_new(MemoryRegion, 1);
-
-    cpu = AVR_CPU(cpu_create(machine->cpu_type));
-    cpudev = DEVICE(cpu);
-
-
-    memory_region_init_rom(sms->flash, NULL, "avr.flash", SIZE_FLASH,
-            &error_fatal);
-    memory_region_add_subregion(system_memory, OFFSET_CODE, sms->flash);
-
-    /* following are atmel2560 device */
-    create_unimplemented_device("usart 3", OFFSET_DATA + 0x0130, 0x0007);
-    create_unimplemented_device("timer-counter-16bit 5",
-            OFFSET_DATA + 0x0120, 0x000e);
-    create_unimplemented_device("gpio L", OFFSET_DATA + 0x0109, 0x0003);
-    create_unimplemented_device("gpio K", OFFSET_DATA + 0x0106, 0x0003);
-    create_unimplemented_device("gpio J", OFFSET_DATA + 0x0103, 0x0003);
-    create_unimplemented_device("gpio H", OFFSET_DATA + 0x0100, 0x0003);
-    create_unimplemented_device("usart 2", OFFSET_DATA + 0x00d0, 0x0007);
-    create_unimplemented_device("usart 1", OFFSET_DATA + 0x00c8, 0x0007);
-    create_unimplemented_device("usart 0", OFFSET_DATA + 0x00c0, 0x0007);
-    create_unimplemented_device("twi", OFFSET_DATA + 0x00b8, 0x0006);
-    create_unimplemented_device("timer-counter-async-8bit 2",
-            OFFSET_DATA + 0x00b0, 0x0007);
-    create_unimplemented_device("timer-counter-16bit 4",
-            OFFSET_DATA + 0x00a0, 0x000e);
-    create_unimplemented_device("timer-counter-16bit 3",
-            OFFSET_DATA + 0x0090, 0x000e);
-    create_unimplemented_device("timer-counter-16bit 1",
-            OFFSET_DATA + 0x0080, 0x000e);
-    create_unimplemented_device("ac / adc",
-            OFFSET_DATA + 0x0078, 0x0008);
-    create_unimplemented_device("ext-mem-iface",
-            OFFSET_DATA + 0x0074, 0x0002);
-    create_unimplemented_device("int-controller",
-            OFFSET_DATA + 0x0068, 0x000c);
-    create_unimplemented_device("sys",
-            OFFSET_DATA + 0x0060, 0x0007);
-    create_unimplemented_device("spi",
-            OFFSET_DATA + 0x004c, 0x0003);
-    create_unimplemented_device("ext-mem-iface",
-            OFFSET_DATA + 0x004a, 0x0002);
-    create_unimplemented_device("timer-counter-pwm-8bit 0",
-            OFFSET_DATA + 0x0043, 0x0006);
-    create_unimplemented_device("ext-mem-iface",
-            OFFSET_DATA + 0x003e, 0x0005);
-    create_unimplemented_device("int-controller",
-            OFFSET_DATA + 0x0035, 0x0009);
-    create_unimplemented_device("gpio G", OFFSET_DATA + 0x0032, 0x0003);
-    create_unimplemented_device("gpio F", OFFSET_DATA + 0x002f, 0x0003);
-    create_unimplemented_device("gpio E", OFFSET_DATA + 0x002c, 0x0003);
-    create_unimplemented_device("gpio D", OFFSET_DATA + 0x0029, 0x0003);
-    create_unimplemented_device("gpio C", OFFSET_DATA + 0x0026, 0x0003);
-    create_unimplemented_device("gpio B", OFFSET_DATA + 0x0023, 0x0003);
-    create_unimplemented_device("gpio A", OFFSET_DATA + 0x0020, 0x0003);
-
-    memory_region_allocate_system_memory(
-        sms->ram, NULL, "avr.ram", SIZE_SRAM + SIZE_EXMEM);
-    memory_region_add_subregion(system_memory, OFFSET_DATA + 0x200, sms->ram);
-
-    /* Power Reduction built-in peripheral */
-    sms->prr[0] = AVR_MASK(sysbus_create_simple(TYPE_AVR_MASK,
-                    OFFSET_DATA + PRR0_BASE, NULL));
-    sms->prr[1] = AVR_MASK(sysbus_create_simple(TYPE_AVR_MASK,
-                    OFFSET_DATA + PRR1_BASE, NULL));
-
-    /* USART 0 built-in peripheral */
-    sms->usart0 = AVR_USART(object_new(TYPE_AVR_USART));
-    busdev = SYS_BUS_DEVICE(sms->usart0);
-    qdev_prop_set_chr(DEVICE(sms->usart0), "chardev", serial_hd(0));
-    object_property_set_bool(OBJECT(sms->usart0), true, "realized",
-            &error_fatal);
-    sysbus_mmio_map(busdev, 0, OFFSET_DATA + USART_BASE);
-    /*
-     * These IRQ numbers don't match the datasheet because we're counting from
-     * zero and not including reset.
-     */
-    sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(cpudev, USART_RXC_IRQ));
-    sysbus_connect_irq(busdev, 1, qdev_get_gpio_in(cpudev, USART_DRE_IRQ));
-    sysbus_connect_irq(busdev, 2, qdev_get_gpio_in(cpudev, USART_TXC_IRQ));
-    sysbus_connect_irq(SYS_BUS_DEVICE(sms->prr[1]), PRR1_BIT_PRUSART1,
-            qdev_get_gpio_in(DEVICE(sms->usart0), 0));
-
-    /* Timer 1 built-in periphal */
-    sms->timer1 = AVR_TIMER16(object_new(TYPE_AVR_TIMER16));
-    object_property_set_bool(OBJECT(sms->timer1), true, "realized",
-            &error_fatal);
-    busdev = SYS_BUS_DEVICE(sms->timer1);
-    sysbus_mmio_map(busdev, 0, OFFSET_DATA + TIMER1_BASE);
-    sysbus_mmio_map(busdev, 1, OFFSET_DATA + TIMER1_IMSK_BASE);
-    sysbus_mmio_map(busdev, 2, OFFSET_DATA + TIMER1_IFR_BASE);
-    sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(cpudev, TIMER1_CAPT_IRQ));
-    sysbus_connect_irq(busdev, 1, qdev_get_gpio_in(cpudev, TIMER1_COMPA_IRQ));
-    sysbus_connect_irq(busdev, 2, qdev_get_gpio_in(cpudev, TIMER1_COMPB_IRQ));
-    sysbus_connect_irq(busdev, 3, qdev_get_gpio_in(cpudev, TIMER1_COMPC_IRQ));
-    sysbus_connect_irq(busdev, 4, qdev_get_gpio_in(cpudev, TIMER1_OVF_IRQ));
-    sysbus_connect_irq(SYS_BUS_DEVICE(sms->prr[0]), PRR0_BIT_PRTIM1,
-            qdev_get_gpio_in(DEVICE(sms->timer1), 0));
-
-    /* Load firmware (contents of flash) trying to auto-detect format */
-    firmware = machine->firmware;
-    if (firmware != NULL) {
-        filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, firmware);
-        if (filename == NULL) {
-            error_report("Unable to find %s", firmware);
-            exit(1);
-        }
-
-        bytes_loaded = load_elf(
-            filename, NULL, NULL, NULL, NULL, NULL, NULL, 0, EM_NONE, 0, 0);
-        if (bytes_loaded < 0) {
-            bytes_loaded = load_image_targphys(
-                filename, OFFSET_CODE, SIZE_FLASH);
-        }
-        if (bytes_loaded < 0) {
-            error_report(
-                "Unable to load firmware image %s as ELF or raw binary",
-                firmware);
-            exit(1);
-        }
-    }
-}
-
-static void sample_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-
-    mc->desc = "AVR sample/example board (ATmega2560)";
-    mc->init = sample_init;
-    mc->default_cpus = 1;
-    mc->min_cpus = mc->default_cpus;
-    mc->max_cpus = mc->default_cpus;
-    mc->default_cpu_type = "avr6-avr-cpu"; /* ATmega2560. */
-    mc->is_default = 1;
-}
-
-static const TypeInfo sample_info = {
-    .name = TYPE_SAMPLE_MACHINE,
-    .parent = TYPE_MACHINE,
-    .instance_size = sizeof(SampleMachineState),
-    .class_size = sizeof(SampleMachineClass),
-    .class_init = sample_class_init,
-};
-
-static void sample_machine_init(void)
-{
-    type_register_static(&sample_info);
-}
-
-type_init(sample_machine_init);
diff --git a/hw/avr/Makefile.objs b/hw/avr/Makefile.objs
index 39ee3c32b2..f2de4a066d 100644
--- a/hw/avr/Makefile.objs
+++ b/hw/avr/Makefile.objs
@@ -1,3 +1,2 @@
-obj-y += sample.o
 obj-y += atmega.o
 obj-y += arduino.o
-- 
2.21.0


