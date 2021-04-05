Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92849354308
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 16:55:53 +0200 (CEST)
Received: from localhost ([::1]:47700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTQds-0005DT-JZ
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 10:55:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQHG-0001LZ-3o
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:32:30 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:37805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQH8-0001ir-IU
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:32:29 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so7681153wml.2
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 07:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fw6WluA/tm00Z/1f5+BgUFLzruYO6h/Qkj6bY1W+GOo=;
 b=mz4JBPq+Ct8BmVZFkq+C91GaCKv+m9KZpdgSDSFuraX9AvND9c+CxFCcq9bwKvIwda
 crnkArNJ5LAeI3FC0rYe3hDJ5gdCMmhohkYisSWAtsj1N8H58pJsZf16th/ZbrwYkJGw
 a8w5e8Fwptw+9NxWrDOYHq5aaweRwtmFyiqgbxZaWsBtj5ZvlD98kWW53a7wpEjvcncz
 y8y5Xdour05TgP2xb4whRpPQ6uV2HV+Aoe8HJQxFjuQkbG2WUW58jy7DiqSyxoUem54j
 4EPq4vUN5bW1nfjNmKItKJIoI35ZfpymcRsKblgyCphkpciu7/6wGgu5LQ1FPvm6sHU0
 AIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fw6WluA/tm00Z/1f5+BgUFLzruYO6h/Qkj6bY1W+GOo=;
 b=M7YFcTjlTvGWQybCbRF4AOFseZbik1Bzw+hNg6NsEgs1JJ7O+IRVoiUTV2sXdVrX+p
 QabCenjMlMkaePfFC1N4YSZzwq0SauwCI5bo5l32/NGzs/jQv0tqYq7oi0+OO+VO6wR3
 5OQpRV1neBtUbOfPn25hWr9PkTFqPDo/UgKoLtYnCx7Y2XgSXe3jJJ6RbB7K7FyFlzpq
 Pw1IQM6xzhK9yRWhq3ld4kQzA0OTHIYUxQilSdQOl5IgcshA5RBocPmEuR+8libr0Qg6
 mFQiYK7l0zJx6gZIe4oyF/bKdWuSMxQxtLqBw6ZDXamLynUxBSS0GkM9hmefQx8jAT5f
 nc7Q==
X-Gm-Message-State: AOAM533SqAVCtsPuJrsuzF1XeaL8etd5jL9fXrVPLLZ/zMfAwdwDHxfF
 zxJM4AIJM/Z+WMleeKFEHGtV27yDia6UYQ==
X-Google-Smtp-Source: ABdhPJztDrJkzf1htbDZPC/lsFcolN2acWg5gxvDJnxsPsFhfC5FegVjPzmLzrId+PA0UoQd3sUO5A==
X-Received: by 2002:a05:600c:2215:: with SMTP id
 z21mr25783268wml.86.1617633140971; 
 Mon, 05 Apr 2021 07:32:20 -0700 (PDT)
Received: from cmiranda-laptop.localdomain (bl15-158-218.dsl.telepac.pt.
 [188.80.158.218])
 by smtp.gmail.com with ESMTPSA id k3sm8231552wrc.67.2021.04.05.07.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 07:32:20 -0700 (PDT)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 13/27] arc: Add Synopsys ARC emulation boards
Date: Mon,  5 Apr 2021 15:31:24 +0100
Message-Id: <20210405143138.17016-14-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210405143138.17016-1-cupertinomiranda@gmail.com>
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=cupertinomiranda@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudiu Zissulescu <claziss@synopsys.com>

Add the Synopsys ARC boards, arc_sim for testing, sim-hs main emulation
board using standard UART and nsim which includes a Synopsys ARC specific
UART implementation.

Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
---
 hw/arc/Makefile.objs     |  21 +++++
 hw/arc/arc_sim.c         | 124 +++++++++++++++++++++++++++
 hw/arc/boot.c            | 100 ++++++++++++++++++++++
 hw/arc/boot.h            |  21 +++++
 hw/arc/meson.build       |  13 +++
 hw/arc/pic_cpu.c         | 113 ++++++++++++++++++++++++
 hw/arc/virt.c            | 180 +++++++++++++++++++++++++++++++++++++++
 include/hw/arc/cpudevs.h |  30 +++++++
 8 files changed, 602 insertions(+)
 create mode 100644 hw/arc/Makefile.objs
 create mode 100644 hw/arc/arc_sim.c
 create mode 100644 hw/arc/boot.c
 create mode 100644 hw/arc/boot.h
 create mode 100644 hw/arc/meson.build
 create mode 100644 hw/arc/pic_cpu.c
 create mode 100644 hw/arc/virt.c
 create mode 100644 include/hw/arc/cpudevs.h

diff --git a/hw/arc/Makefile.objs b/hw/arc/Makefile.objs
new file mode 100644
index 0000000000..28d7766cd9
--- /dev/null
+++ b/hw/arc/Makefile.objs
@@ -0,0 +1,21 @@
+#
+#  QEMU ARC CPU
+#
+#  Copyright (c) 2019
+#
+#  This library is free software; you can redistribute it and/or
+#  modify it under the terms of the GNU Lesser General Public
+#  License as published by the Free Software Foundation; either
+#  version 2.1 of the License, or (at your option) any later version.
+#
+#  This library is distributed in the hope that it will be useful,
+#  but WITHOUT ANY WARRANTY; without even the implied warranty of
+#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+#  Lesser General Public License for more details.
+#
+#  You should have received a copy of the GNU Lesser General Public
+#  License along with this library; if not, see
+#  http://www.gnu.org/licenses/lgpl-2.1.html
+#
+
+obj-y   = arc_sim.o arc_uart.o sample.o pic_cpu.o boot.o board-hsdk.o sim-hs.o nsim.o
diff --git a/hw/arc/arc_sim.c b/hw/arc/arc_sim.c
new file mode 100644
index 0000000000..64db440454
--- /dev/null
+++ b/hw/arc/arc_sim.c
@@ -0,0 +1,124 @@
+/*
+ * QEMU ARC CPU
+ *
+ * Copyright (c) 2020 Synppsys Inc.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * http://www.gnu.org/licenses/lgpl-2.1.html
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "cpu.h"
+#include "hw/hw.h"
+#include "hw/boards.h"
+#include "elf.h"
+#include "hw/char/serial.h"
+#include "net/net.h"
+#include "hw/loader.h"
+#include "exec/memory.h"
+#include "exec/address-spaces.h"
+#include "sysemu/reset.h"
+#include "sysemu/runstate.h"
+#include "sysemu/sysemu.h"
+#include "hw/sysbus.h"
+#include "hw/arc/cpudevs.h"
+#include "boot.h"
+
+
+static uint64_t arc_io_read(void *opaque, hwaddr addr, unsigned size)
+{
+    return 0;
+}
+
+static void arc_io_write(void *opaque, hwaddr addr,
+                         uint64_t val, unsigned size)
+{
+    switch (addr) {
+    case 0x08: /* board reset. */
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+        break;
+    default:
+        break;
+    }
+}
+
+static const MemoryRegionOps arc_io_ops = {
+    .read = arc_io_read,
+    .write = arc_io_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void arc_sim_init(MachineState *machine)
+{
+    static struct arc_boot_info boot_info;
+    unsigned int smp_cpus = machine->smp.cpus;
+    ram_addr_t ram_base = 0;
+    ram_addr_t ram_size = machine->ram_size;
+    ARCCPU *cpu = NULL;
+    MemoryRegion *ram, *system_io;
+    int n;
+
+    boot_info.ram_start = ram_base;
+    boot_info.ram_size = ram_size;
+    boot_info.kernel_filename = machine->kernel_filename;
+
+    for (n = 0; n < smp_cpus; n++) {
+        cpu = ARC_CPU(object_new(machine->cpu_type));
+        if (cpu == NULL) {
+            fprintf(stderr, "Unable to find CPU definition!\n");
+            exit(1);
+        }
+
+        /* Set the initial CPU properties. */
+        object_property_set_uint(OBJECT(cpu), "freq_hz", 1000000, &error_fatal);
+        object_property_set_bool(OBJECT(cpu), "rtc-opt", true, &error_fatal);
+        object_property_set_bool(OBJECT(cpu), "realized", true, &error_fatal);
+
+        /* Initialize internal devices. */
+        cpu_arc_pic_init(cpu);
+        cpu_arc_clock_init(cpu);
+
+        qemu_register_reset(arc_cpu_reset, cpu);
+    }
+
+    ram = g_new(MemoryRegion, 1);
+    memory_region_init_ram(ram, NULL, "arc.ram", ram_size, &error_fatal);
+    memory_region_add_subregion(get_system_memory(), ram_base, ram);
+
+    system_io = g_new(MemoryRegion, 1);
+    memory_region_init_io(system_io, NULL, &arc_io_ops, NULL, "arc.io",
+                           1024);
+    memory_region_add_subregion(get_system_memory(), 0xf0000000, system_io);
+
+    serial_mm_init(get_system_memory(), 0x90000000, 2, cpu->env.irq[20],
+                   115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
+
+    arc_load_kernel(cpu, &boot_info);
+}
+
+static void arc_sim_machine_init(MachineClass *mc)
+{
+    mc->desc = "ARCxx simulation";
+    mc->init = arc_sim_init;
+    mc->max_cpus = 1;
+    mc->is_default = false;
+    mc->default_cpu_type = ARC_CPU_TYPE_NAME("archs");
+}
+
+DEFINE_MACHINE("arc-sim", arc_sim_machine_init)
+
+
+/*-*-indent-tabs-mode:nil;tab-width:4;indent-line-function:'insert-tab'-*-*/
+/* vim: set ts=4 sw=4 et: */
diff --git a/hw/arc/boot.c b/hw/arc/boot.c
new file mode 100644
index 0000000000..962fc03b03
--- /dev/null
+++ b/hw/arc/boot.c
@@ -0,0 +1,100 @@
+/*
+ * QEMU ARC CPU
+ *
+ * Copyright (c) 2020 Synppsys Inc.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * http://www.gnu.org/licenses/lgpl-2.1.html
+ */
+
+#include "qemu/osdep.h"
+#include "boot.h"
+#include "elf.h"
+#include "hw/loader.h"
+#include "qemu/error-report.h"
+#include "qemu/units.h"
+
+void arc_cpu_reset(void *opaque)
+{
+    ARCCPU *cpu = opaque;
+    CPUARCState *env = &cpu->env;
+    const struct arc_boot_info *info = env->boot_info;
+
+    cpu_reset(CPU(cpu));
+
+    /*
+     * Right before start CPU gets reset wiping out everything
+     * but PC which we set on Elf load.
+     *
+     * And if we still want to pass something like U-Boot data
+     * via CPU registers we have to do it here.
+     */
+
+    if (info->kernel_cmdline && strlen(info->kernel_cmdline)) {
+        /*
+         * Load "cmdline" far enough from the kernel image.
+         * Round by MAX page size for ARC - 16 KiB.
+         */
+        hwaddr cmdline_addr = info->ram_start +
+            QEMU_ALIGN_UP(info->ram_size / 2, 16 * KiB);
+        cpu_physical_memory_write(cmdline_addr, info->kernel_cmdline,
+                                  strlen(info->kernel_cmdline));
+
+        /* We're passing "cmdline" */
+        cpu->env.r[0] = ARC_UBOOT_CMDLINE;
+        cpu->env.r[2] = cmdline_addr;
+    }
+}
+
+
+void arc_load_kernel(ARCCPU *cpu, struct arc_boot_info *info)
+{
+    hwaddr entry;
+    int elf_machine, kernel_size;
+
+    if (!info->kernel_filename) {
+        error_report("missing kernel file");
+        exit(EXIT_FAILURE);
+    }
+
+    elf_machine = cpu->family > 2 ? EM_ARC_COMPACT2 : EM_ARC_COMPACT;
+    kernel_size = load_elf(info->kernel_filename, NULL, NULL, NULL,
+                           &entry, NULL, NULL, NULL, ARC_ENDIANNESS_LE,
+                           elf_machine, 1, 0);
+
+    if (kernel_size < 0) {
+        int is_linux;
+
+        kernel_size = load_uimage(info->kernel_filename, &entry, NULL,
+                                  &is_linux, NULL, NULL);
+        if (!is_linux) {
+            error_report("Wrong U-Boot image, only Linux kernel is supported");
+            exit(EXIT_FAILURE);
+        }
+    }
+
+    if (kernel_size < 0) {
+        error_report("No kernel image found");
+        exit(EXIT_FAILURE);
+    }
+
+    cpu->env.boot_info = info;
+
+    /* Set CPU's PC to point to the entry-point */
+    cpu->env.pc = entry;
+}
+
+
+/*-*-indent-tabs-mode:nil;tab-width:4;indent-line-function:'insert-tab'-*-*/
+/* vim: set ts=4 sw=4 et: */
diff --git a/hw/arc/boot.h b/hw/arc/boot.h
new file mode 100644
index 0000000000..e46aa16fc6
--- /dev/null
+++ b/hw/arc/boot.h
@@ -0,0 +1,21 @@
+#ifndef ARC_BOOT_H
+#define ARC_BOOT_H
+
+#include "hw/hw.h"
+#include "cpu.h"
+
+struct arc_boot_info {
+    hwaddr ram_start;
+    uint64_t ram_size;
+    const char *kernel_filename;
+    const char *kernel_cmdline;
+};
+
+void arc_cpu_reset(void *opaque);
+void arc_load_kernel(ARCCPU *cpu, struct arc_boot_info *boot_info);
+
+#endif /* ARC_BOOT_H */
+
+
+/*-*-indent-tabs-mode:nil;tab-width:4;indent-line-function:'insert-tab'-*-*/
+/* vim: set ts=4 sw=4 et: */
diff --git a/hw/arc/meson.build b/hw/arc/meson.build
new file mode 100644
index 0000000000..6a587307a4
--- /dev/null
+++ b/hw/arc/meson.build
@@ -0,0 +1,13 @@
+arc_ss = ss.source_set()
+arc_ss.add(files(
+  'arc_sim.c',
+  'arc_uart.c',
+  'sample.c',
+  'pic_cpu.c',
+  'boot.c',
+  'board-hsdk.c',
+  'sim-hs.c',
+  'nsim.c',
+))
+
+hw_arch += {'arc': arc_ss}
diff --git a/hw/arc/pic_cpu.c b/hw/arc/pic_cpu.c
new file mode 100644
index 0000000000..d41fa0fe4b
--- /dev/null
+++ b/hw/arc/pic_cpu.c
@@ -0,0 +1,113 @@
+/*
+ * ARC Programmable Interrupt Controller support.
+ *
+ * Copyright (c) 2020 Synppsys Inc.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * http://www.gnu.org/licenses/lgpl-2.1.html
+ */
+
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "hw/hw.h"
+#include "hw/irq.h"
+#include "qemu/log.h"
+#include "hw/arc/cpudevs.h"
+
+/*
+ * ARC pic handler
+ */
+static void arc_pic_cpu_handler(void *opaque, int irq, int level)
+{
+    ARCCPU *cpu = (ARCCPU *) opaque;
+    CPUState *cs = CPU(cpu);
+    CPUARCState *env = &cpu->env;
+    int i;
+    bool clear = false;
+    uint32_t irq_bit;
+
+    /* Assert if this handler is called in a system without interrupts. */
+    assert(cpu->cfg.has_interrupts);
+
+    /* Assert if the IRQ is not within the cpu configuration bounds. */
+    assert(irq >= 16 && irq < (cpu->cfg.number_of_interrupts + 15));
+
+    irq_bit = 1 << env->irq_bank[irq].priority;
+    if (level) {
+        /*
+         * An interrupt is enabled, update irq_priority_pendig and rise
+         * the qemu interrupt line.
+         */
+        env->irq_bank[irq].pending = 1;
+        qatomic_or(&env->irq_priority_pending, irq_bit);
+        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+    } else {
+        env->irq_bank[irq].pending = 0;
+
+        /*
+         * First, check if we still have any pending interrupt at the
+         * given priority.
+         */
+        clear = true;
+        for (i = 16; i < cpu->cfg.number_of_interrupts; i++) {
+            if (env->irq_bank[i].pending
+                && env->irq_bank[i].priority == env->irq_bank[irq].priority) {
+                clear = false;
+                break;
+            }
+        }
+
+        /* If not, update (clear) irq_priority_pending. */
+        if (clear) {
+            qatomic_and(&env->irq_priority_pending, ~irq_bit);
+        }
+
+        /*
+         * If we don't have any pending priority, lower the qemu irq
+         * line. N.B. we can also check more here like IE bit, but we
+         * need to add a cpu_interrupt call when we enable the
+         * interrupts (e.g., sleep, seti).
+         */
+        if (!env->irq_priority_pending) {
+            cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
+        }
+    }
+    qemu_log_mask(CPU_LOG_INT,
+                  "[IRQ] level = %d, clear = %d, irq = %d, priority = " TARGET_FMT_lu ", "
+                  "pending = %08x, pc = " TARGET_FMT_lx "\n",
+                  level, clear, irq, env->irq_bank[irq].priority,
+                  env->irq_priority_pending, env->pc);
+}
+
+/*
+ * ARC PIC initialization helper
+ */
+void cpu_arc_pic_init(ARCCPU *cpu)
+{
+    CPUARCState *env = &cpu->env;
+    int i;
+    qemu_irq *qi;
+
+    qi = qemu_allocate_irqs(arc_pic_cpu_handler, cpu,
+                            16 + cpu->cfg.number_of_interrupts);
+
+    for (i = 0; i < cpu->cfg.number_of_interrupts; i++) {
+        env->irq[16 + i] = qi[16 + i];
+    }
+}
+
+
+/*-*-indent-tabs-mode:nil;tab-width:4;indent-line-function:'insert-tab'-*-*/
+/* vim: set ts=4 sw=4 et: */
diff --git a/hw/arc/virt.c b/hw/arc/virt.c
new file mode 100644
index 0000000000..8f7d7cbd5d
--- /dev/null
+++ b/hw/arc/virt.c
@@ -0,0 +1,180 @@
+/*
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "boot.h"
+#include "hw/boards.h"
+#include "hw/char/serial.h"
+#include "exec/address-spaces.h"
+#include "sysemu/reset.h"
+#include "sysemu/sysemu.h"
+#include "hw/arc/cpudevs.h"
+#include "hw/pci-host/gpex.h"
+#include "hw/sysbus.h"
+
+#define VIRT_RAM_BASE      0x80000000
+#define VIRT_RAM_SIZE      0x80000000
+#define VIRT_IO_BASE       0xf0000000
+#define VIRT_IO_SIZE       0x10000000
+#define VIRT_UART0_OFFSET  0x0
+#define VIRT_UART0_IRQ     24
+
+/* VirtIO */
+#define VIRT_VIRTIO_NUMBER 5
+#define VIRT_VIRTIO_OFFSET 0x100000
+#define VIRT_VIRTIO_BASE   (VIRT_IO_BASE + VIRT_VIRTIO_OFFSET)
+#define VIRT_VIRTIO_SIZE   0x2000
+#define VIRT_VIRTIO_IRQ    31
+
+/* PCI */
+#define VIRT_PCI_ECAM_BASE 0xe0000000
+#define VIRT_PCI_ECAM_SIZE 0x01000000
+#define VIRT_PCI_MMIO_BASE 0xd0000000
+#define VIRT_PCI_MMIO_SIZE 0x10000000
+#define VIRT_PCI_PIO_BASE  0xc0000000
+#define VIRT_PCI_PIO_SIZE  0x00004000
+#define PCIE_IRQ           40  /* IRQs 40-43 as GPEX_NUM_IRQS=4 */
+
+static void create_pcie(ARCCPU *cpu)
+{
+    hwaddr base_ecam = VIRT_PCI_ECAM_BASE;
+    hwaddr size_ecam = VIRT_PCI_ECAM_SIZE;
+    hwaddr base_pio  = VIRT_PCI_PIO_BASE;
+    hwaddr size_pio  = VIRT_PCI_PIO_SIZE;
+    hwaddr base_mmio = VIRT_PCI_MMIO_BASE;
+    hwaddr size_mmio = VIRT_PCI_MMIO_SIZE;
+
+    MemoryRegion *ecam_alias;
+    MemoryRegion *ecam_reg;
+    MemoryRegion *pio_alias;
+    MemoryRegion *pio_reg;
+    MemoryRegion *mmio_alias;
+    MemoryRegion *mmio_reg;
+
+    DeviceState *dev;
+    int i;
+
+    dev = qdev_new(TYPE_GPEX_HOST);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+    /* Map only the first size_ecam bytes of ECAM space. */
+    ecam_alias = g_new0(MemoryRegion, 1);
+    ecam_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
+    memory_region_init_alias(ecam_alias, OBJECT(dev), "pcie-ecam",
+                             ecam_reg, 0, size_ecam);
+    memory_region_add_subregion(get_system_memory(), base_ecam, ecam_alias);
+
+    /*
+     * Map the MMIO window into system address space so as to expose
+     * the section of PCI MMIO space which starts at the same base address
+     * (ie 1:1 mapping for that part of PCI MMIO space visible through
+     * the window).
+     */
+    mmio_alias = g_new0(MemoryRegion, 1);
+    mmio_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
+    memory_region_init_alias(mmio_alias, OBJECT(dev), "pcie-mmio",
+                             mmio_reg, base_mmio, size_mmio);
+    memory_region_add_subregion(get_system_memory(), base_mmio, mmio_alias);
+
+    /* Map IO port space. */
+    pio_alias = g_new0(MemoryRegion, 1);
+    pio_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 2);
+    memory_region_init_alias(pio_alias, OBJECT(dev), "pcie-pio",
+                             pio_reg, 0, size_pio);
+    memory_region_add_subregion(get_system_memory(), base_pio, pio_alias);
+
+    /* Connect IRQ lines. */
+    for (i = 0; i < GPEX_NUM_IRQS; i++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, cpu->env.irq[PCIE_IRQ + i]);
+        gpex_set_irq_num(GPEX_HOST(dev), i, PCIE_IRQ + i);
+    }
+}
+
+static void virt_init(MachineState *machine)
+{
+    static struct arc_boot_info boot_info;
+    unsigned int smp_cpus = machine->smp.cpus;
+    MemoryRegion *system_memory = get_system_memory();
+    MemoryRegion *system_ram;
+    MemoryRegion *system_ram0;
+    MemoryRegion *system_io;
+    ARCCPU *cpu = NULL;
+    int n;
+
+    boot_info.ram_start = VIRT_RAM_BASE;
+    boot_info.ram_size = VIRT_RAM_SIZE;
+    boot_info.kernel_filename = machine->kernel_filename;
+    boot_info.kernel_cmdline = machine->kernel_cmdline;
+
+    for (n = 0; n < smp_cpus; n++) {
+        cpu = ARC_CPU(cpu_create("archs-" TYPE_ARC_CPU));
+        if (cpu == NULL) {
+            fprintf(stderr, "Unable to find CPU definition!\n");
+            exit(1);
+        }
+
+       /* Initialize internal devices. */
+        cpu_arc_pic_init(cpu);
+        cpu_arc_clock_init(cpu);
+
+        qemu_register_reset(arc_cpu_reset, cpu);
+    }
+
+    /* Init system DDR */
+    system_ram = g_new(MemoryRegion, 1);
+    memory_region_init_ram(system_ram, NULL, "arc.ram", VIRT_RAM_SIZE,
+                           &error_fatal);
+    memory_region_add_subregion(system_memory, VIRT_RAM_BASE, system_ram);
+
+    system_ram0 = g_new(MemoryRegion, 1);
+    memory_region_init_ram(system_ram0, NULL, "arc.ram0", 0x1000000,
+                           &error_fatal);
+    memory_region_add_subregion(system_memory, 0, system_ram0);
+
+    /* Init IO area */
+    system_io = g_new(MemoryRegion, 1);
+    memory_region_init_io(system_io, NULL, NULL, NULL, "arc.io",
+                          VIRT_IO_SIZE);
+    memory_region_add_subregion(system_memory, VIRT_IO_BASE, system_io);
+
+    serial_mm_init(system_io, VIRT_UART0_OFFSET, 2,
+                   cpu->env.irq[VIRT_UART0_IRQ], 115200, serial_hd(0),
+                   DEVICE_NATIVE_ENDIAN);
+
+    for (n = 0; n < VIRT_VIRTIO_NUMBER; n++) {
+        sysbus_create_simple("virtio-mmio",
+                             VIRT_VIRTIO_BASE + VIRT_VIRTIO_SIZE * n,
+                             cpu->env.irq[VIRT_VIRTIO_IRQ + n]);
+    }
+
+    create_pcie(cpu);
+
+    arc_load_kernel(cpu, &boot_info);
+}
+
+static void virt_machine_init(MachineClass *mc)
+{
+    mc->desc = "ARC Virtual Machine";
+    mc->init = virt_init;
+    mc->max_cpus = 1;
+    mc->is_default = true;
+}
+
+DEFINE_MACHINE("virt", virt_machine_init)
+
+
+/*-*-indent-tabs-mode:nil;tab-width:4;indent-line-function:'insert-tab'-*-*/
+/* vim: set ts=4 sw=4 et: */
diff --git a/include/hw/arc/cpudevs.h b/include/hw/arc/cpudevs.h
new file mode 100644
index 0000000000..2e155b6437
--- /dev/null
+++ b/include/hw/arc/cpudevs.h
@@ -0,0 +1,30 @@
+/*
+ * QEMU ARC CPU
+ *
+ * Copyright (c) 2020 Synppsys Inc.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * http://www.gnu.org/licenses/lgpl-2.1.html
+ */
+
+#ifndef HW_ARC_CPUDEVS_H
+#define HW_ARC_CPUDEVS_H
+
+/* Timer service routines.  */
+extern void cpu_arc_clock_init(ARCCPU *);
+
+/* PIC service routines. */
+extern void cpu_arc_pic_init(ARCCPU *);
+
+#endif /* !HW_ARC_CPUDEVS_H */
-- 
2.20.1


