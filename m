Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEFC37D4D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 21:37:10 +0200 (CEST)
Received: from localhost ([::1]:56898 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYyCB-0002Wm-H2
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 15:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59373)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mrolnik@gmail.com>) id 1hYy6V-00081l-Tg
 for qemu-devel@nongnu.org; Thu, 06 Jun 2019 15:31:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1hYy6Q-0001v4-NF
 for qemu-devel@nongnu.org; Thu, 06 Jun 2019 15:31:13 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:40061)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1hYy6J-0000gW-83
 for qemu-devel@nongnu.org; Thu, 06 Jun 2019 15:31:04 -0400
Received: by mail-wm1-x342.google.com with SMTP id v19so1076754wmj.5
 for <qemu-devel@nongnu.org>; Thu, 06 Jun 2019 12:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zPuJBjMRjakczshqdQrxRmS9v/XDIrB7G0JeY7XJYag=;
 b=WdNSLHsmm2ucVTr9mIjcZIdgKy4/WgDx0k53qc4Z2+sTZR4WLrvWvl80YoPd1r0Tld
 PmqJ3jAZOEy6kAqFjZWxBOSc9w6Hgmy+QIOvToRJFk7WVmk3krHauXaAA6/EggaQ0VZX
 7Da4w3U2Ft42iNOs7nAPw/WBnwBJ6xP/pkuDkJHlK6Grles2mixJ6uv6JZuyGunaQRtV
 zmBIDqXT4sivxgwkfdEIkn+7Ylhbadd6ZIUMZKY1IZBrTlQ2v9fzl5VbSw+Tw3pJRNV/
 1+rPz2+ueMK96kxshF8jAMj9xoUrdwF57Gf6ETCKhcDN8FFB1EQl++Nx3cxj5pF1GxD2
 kmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zPuJBjMRjakczshqdQrxRmS9v/XDIrB7G0JeY7XJYag=;
 b=R6K5ZZcM56303G+oKBvdp4rNIGxvDSOPZAdzw+4PGv7RhRLPWgLfB7QYafeT92E+6b
 tR+EWeXKbYcymlCAPucoF1N+UnABEdQjNmuYNwQqZIbkUE/qnV7XwygPumiGrBlvvasI
 RL9NNsEdn65SgNSqzRJpqdnOnjvFEZw25tRXtqz/bgeEbjlMSA0Fcq6jaJMwkLqXi1WQ
 CxH9mlIofgdHHlcJtrhdbF+UusowRsWWErQaFV27CcVAGgbF66IJiZe1m5HABTLLIpHc
 Zk93DWKkrRzpNhsyiBDVIAReeHjkOLjlJJ2JE5zouLY3n4ZPOhjX5eooj9XI/g1P3I+z
 x4eQ==
X-Gm-Message-State: APjAAAXdpPhpk6C5keaGiRFuu8Rfnvo/uRvSh39q7xwNDGRD/DbuVUwX
 65cki2oKMLE9JGNLKKajJDFmyQqnwXgbhg==
X-Google-Smtp-Source: APXvYqzfyFrZaq2CpWJ00lS+5McsmeUaaRGrxhLwJVy00JWNBYiO9B9W+Aw7qTOvNfLLowsfDUrCyA==
X-Received: by 2002:a1c:6c08:: with SMTP id h8mr1152482wmc.62.1559849432815;
 Thu, 06 Jun 2019 12:30:32 -0700 (PDT)
Received: from localhost.localdomain (bzq-79-183-55-157.red.bezeqint.net.
 [79.183.55.157])
 by smtp.gmail.com with ESMTPSA id o126sm2942791wmo.31.2019.06.06.12.30.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Jun 2019 12:30:32 -0700 (PDT)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 22:30:11 +0300
Message-Id: <20190606193012.37715-7-mrolnik@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190606193012.37715-1-mrolnik@gmail.com>
References: <20190606193012.37715-1-mrolnik@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-devel] [PATCH v21 6/7] target/avr: Add example board
 configuration
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
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>, Michael Rolnik <mrolnik@gmail.com>,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sarah Harris <S.E.Harris@kent.ac.uk>

A simple board setup that configures an AVR CPU to run a given firmware image.
This is all that's useful to implement without peripheral emulation as AVR CPUs include a lot of on-board peripherals.

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
---
 hw/Kconfig           |   1 +
 hw/avr/Kconfig       |   4 +
 hw/avr/Makefile.objs |   1 +
 hw/avr/sample.c      | 213 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 219 insertions(+)
 create mode 100644 hw/avr/Kconfig
 create mode 100644 hw/avr/Makefile.objs
 create mode 100644 hw/avr/sample.c

diff --git a/hw/Kconfig b/hw/Kconfig
index 195f541e50..1f25636855 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -42,6 +42,7 @@ source watchdog/Kconfig
 # arch Kconfig
 source arm/Kconfig
 source alpha/Kconfig
+source avr/Kconfig
 source cris/Kconfig
 source hppa/Kconfig
 source i386/Kconfig
diff --git a/hw/avr/Kconfig b/hw/avr/Kconfig
new file mode 100644
index 0000000000..c6ca8fe775
--- /dev/null
+++ b/hw/avr/Kconfig
@@ -0,0 +1,4 @@
+config AVR_SAMPLE
+    bool
+    select AVR_TIMER16
+    select AVR_USART
diff --git a/hw/avr/Makefile.objs b/hw/avr/Makefile.objs
new file mode 100644
index 0000000000..626b7064b3
--- /dev/null
+++ b/hw/avr/Makefile.objs
@@ -0,0 +1 @@
+obj-y += sample.o
diff --git a/hw/avr/sample.c b/hw/avr/sample.c
new file mode 100644
index 0000000000..045f7e7be3
--- /dev/null
+++ b/hw/avr/sample.c
@@ -0,0 +1,213 @@
+/*
+ * QEMU AVR CPU
+ *
+ * Copyright (c) 2016 Michael Rolnik
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * <http://www.gnu.org/licenses/lgpl-2.1.html>
+ */
+
+/*
+ *  NOTE:
+ *      This is not a real AVR board, this is an example!
+ *      The CPU is an approximation of an ATmega2560, but is missing various
+ *      built-in peripherals.
+ *
+ *      This example board loads provided binary file into flash memory and
+ *      executes it from 0x00000000 address in the code memory space.
+ *
+ *      Currently used for AVR CPU validation
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu-common.h"
+#include "cpu.h"
+#include "hw/hw.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/qtest.h"
+#include "ui/console.h"
+#include "hw/boards.h"
+#include "hw/loader.h"
+#include "qemu/error-report.h"
+#include "exec/address-spaces.h"
+#include "include/hw/sysbus.h"
+#include "include/hw/char/avr_usart.h"
+#include "include/hw/timer/avr_timer16.h"
+#include "elf.h"
+
+#define SIZE_FLASH 0x00040000
+#define SIZE_SRAM 0x00002200
+/*
+ * Size of additional "external" memory, as if the AVR were configured to use
+ * an external RAM chip.
+ * Note that the configuration registers that normally enable this feature are
+ * unimplemented.
+ */
+#define SIZE_EXMEM 0x00000000
+
+/* Offsets of periphals in emulated memory space (i.e. not host addresses)  */
+#define PRR0 0x64
+#define PRR1 0x65
+#define USART_BASE 0xc0
+#define USART_PRR PRR0
+#define USART_PRR_MASK 0b00000010
+#define TIMER1_BASE 0x80
+#define TIMER1_IMSK_BASE 0x6f
+#define TIMER1_IFR_BASE 0x36
+#define TIMER1_PRR PRR0
+#define TIMER1_PRR_MASK 0b01000000
+
+/* Interrupt numbers used by peripherals */
+#define TIMER1_CAPT_IRQ 15
+#define TIMER1_COMPA_IRQ 16
+#define TIMER1_COMPB_IRQ 17
+#define TIMER1_COMPC_IRQ 18
+#define TIMER1_OVF_IRQ 19
+
+typedef struct {
+    MachineClass parent;
+} SampleMachineClass;
+
+typedef struct {
+    MachineState parent;
+    MemoryRegion *ram;
+    MemoryRegion *flash;
+    AVRUsartState *usart0;
+    AVRTimer16State *timer1;
+} SampleMachineState;
+
+#define TYPE_SAMPLE_MACHINE MACHINE_TYPE_NAME("sample")
+
+#define SAMPLE_MACHINE(obj) \
+    OBJECT_CHECK(SampleMachineState, obj, TYPE_SAMPLE_MACHINE)
+#define SAMPLE_MACHINE_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(SampleMachineClass, obj, TYPE_SAMPLE_MACHINE)
+#define SAMPLE_MACHINE_CLASS(klass) \
+    OBJECT_CLASS_CHECK(SampleMachineClass, klass, TYPE_SAMPLE_MACHINE)
+
+static void sample_init(MachineState *machine)
+{
+    SampleMachineState *sms = SAMPLE_MACHINE(machine);
+    MemoryRegion *system_memory = get_system_memory();
+    AVRCPU *cpu;
+    const char *firmware = NULL;
+    const char *filename;
+    int bytes_loaded;
+    SysBusDevice *busdev;
+    DeviceState *cpudev;
+
+    system_memory = get_system_memory();
+    sms->ram = g_new(MemoryRegion, 1);
+    sms->flash = g_new(MemoryRegion, 1);
+
+    cpu = AVR_CPU(cpu_create(machine->cpu_type));
+
+    memory_region_allocate_system_memory(
+        sms->ram, NULL, "avr.ram", SIZE_SRAM + SIZE_EXMEM);
+    memory_region_add_subregion(system_memory, OFFSET_DATA, sms->ram);
+
+    memory_region_init_rom(sms->flash, NULL, "avr.flash", SIZE_FLASH,
+            &error_fatal);
+    memory_region_add_subregion(system_memory, OFFSET_CODE, sms->flash);
+
+    /* USART 0 built-in peripheral */
+    sms->usart0 = AVR_USART(object_new(TYPE_AVR_USART));
+    busdev = SYS_BUS_DEVICE(sms->usart0);
+    sysbus_mmio_map(busdev, 0, OFFSET_DATA + USART_BASE);
+    /*
+     * These IRQ numbers don't match the datasheet because we're counting from
+     * zero and not including reset.
+     */
+    sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(cpu), 24));
+    sysbus_connect_irq(busdev, 1, qdev_get_gpio_in(DEVICE(cpu), 25));
+    sysbus_connect_irq(busdev, 2, qdev_get_gpio_in(DEVICE(cpu), 26));
+    sms->usart0->prr_address = OFFSET_DATA + PRR0;
+    sms->usart0->prr_mask = USART_PRR_MASK;
+    qdev_prop_set_chr(DEVICE(sms->usart0), "chardev", serial_hd(0));
+    object_property_set_bool(OBJECT(sms->usart0), true, "realized",
+            &error_fatal);
+
+    /* Timer 1 built-in periphal */
+    sms->timer1 = AVR_TIMER16(object_new(TYPE_AVR_TIMER16));
+    busdev = SYS_BUS_DEVICE(sms->timer1);
+    sysbus_mmio_map(busdev, 0, OFFSET_DATA + TIMER1_BASE);
+    sysbus_mmio_map(busdev, 1, OFFSET_DATA + TIMER1_IMSK_BASE);
+    sysbus_mmio_map(busdev, 2, OFFSET_DATA + TIMER1_IFR_BASE);
+    cpudev = DEVICE(cpu);
+    sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(cpudev, TIMER1_CAPT_IRQ));
+    sysbus_connect_irq(busdev, 1, qdev_get_gpio_in(cpudev, TIMER1_COMPA_IRQ));
+    sysbus_connect_irq(busdev, 2, qdev_get_gpio_in(cpudev, TIMER1_COMPB_IRQ));
+    sysbus_connect_irq(busdev, 3, qdev_get_gpio_in(cpudev, TIMER1_COMPC_IRQ));
+    sysbus_connect_irq(busdev, 4, qdev_get_gpio_in(cpudev, TIMER1_OVF_IRQ));
+    sms->timer1->prr_address = OFFSET_DATA + TIMER1_PRR;
+    sms->timer1->prr_mask = TIMER1_PRR_MASK;
+    object_property_set_bool(OBJECT(sms->timer1), true, "realized",
+            &error_fatal);
+
+    /* Load firmware (contents of flash) trying to auto-detect format */
+    firmware = machine->firmware;
+    if (firmware != NULL) {
+        filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, firmware);
+        if (filename == NULL) {
+            error_report("Unable to find %s", firmware);
+            exit(1);
+        }
+
+        bytes_loaded = load_elf(
+            filename, NULL, NULL, NULL, NULL, NULL, NULL, 0, EM_NONE, 0, 0);
+        if (bytes_loaded < 0) {
+            error_report(
+                "Unable to load %s as ELF, trying again as raw binary",
+                firmware);
+            bytes_loaded = load_image_targphys(
+                filename, OFFSET_CODE, SIZE_FLASH);
+        }
+        if (bytes_loaded < 0) {
+            error_report(
+                "Unable to load firmware image %s as ELF or raw binary",
+                firmware);
+            exit(1);
+        }
+    }
+}
+
+static void sample_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->desc = "AVR sample/example board (ATmega2560)";
+    mc->init = sample_init;
+    mc->default_cpus = 1;
+    mc->min_cpus = mc->default_cpus;
+    mc->max_cpus = mc->default_cpus;
+    mc->default_cpu_type = AVR_CPU_TYPE_NAME("avr6"); /* ATmega2560. */
+    mc->is_default = 1;
+}
+
+static const TypeInfo sample_info = {
+    .name = TYPE_SAMPLE_MACHINE,
+    .parent = TYPE_MACHINE,
+    .instance_size = sizeof(SampleMachineState),
+    .class_size = sizeof(SampleMachineClass),
+    .class_init = sample_class_init,
+};
+
+static void sample_machine_init(void)
+{
+    type_register_static(&sample_info);
+}
+
+type_init(sample_machine_init);
-- 
2.18.0


