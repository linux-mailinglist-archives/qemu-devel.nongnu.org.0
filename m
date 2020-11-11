Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A944F2AF6A2
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 17:35:22 +0100 (CET)
Received: from localhost ([::1]:49076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kct5d-0007CL-Ne
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 11:35:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1kcspK-0000vT-BA
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 11:18:30 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1kcspG-000817-Fk
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 11:18:29 -0500
Received: by mail-wm1-x341.google.com with SMTP id h62so2853993wme.3
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 08:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ClrzfodXCAwAvrOjMBTC1EPJ+AWX84ZQdv3YccrMxnc=;
 b=EEVhcuCFIr/74CwdB8BkE/b6kH07l6pmDKrQ1W3vFxqIaPQYo3rAjBU/J/ofrnWEDy
 a6s1pbOqRA+ICi5Ytqcs56ijTwB+dJ/gGNIqc2UekkyxvBLpt/K2aV1o2CMWqqykgEgz
 +YN7fabq+u0gnbHbyGwyB/VV5a+QTIqs+BYBO6+l+NABLKgwBT+VLaSxZkYH24+Q2bxV
 PPGr/c9DgXvhHs6herUHxNr00HVxh+wuuK7eTVGHMqIv6j7BDI53DEshDpDE62wMtKC+
 3aAzMzc8JcMbPyo1xZ1/gAIp5YM8i7dbtAPrrcbdwA47dW0+UurieIamPohKTDbkvtBh
 tpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ClrzfodXCAwAvrOjMBTC1EPJ+AWX84ZQdv3YccrMxnc=;
 b=mEdDyvpJJk6c3OJk5Rv/uk/IINDMehTG7UsevAw6vK98SyjFQWNKA4dF7iMAkK3USK
 96HedWZTIdPxxObEzriMeB7yRQO3Ulh1BG5VjThxZlp96m78MfYqXmlScbbexjq4gthd
 A/9wARJNWNDikx5O/QIlk0kumuiYH8OXWqaikTrVdIuU7mKViRs0FJdp+1RVkYSL1P/+
 1X89HZ9qD+HxO9QTiPHwhoAebYs6ygNAnmR3L9AGzA1550fO5EHyqjIfei9eHfDo+R/1
 JVnHEA3d6T849KWBGt0lTATb10V2u95FsDxoiOR3TKCTei9slUBjvE605bbuU62YyXmv
 zpjA==
X-Gm-Message-State: AOAM531q0vh+GrdQp7PrZ4Dm+H0sG3WcpPGYJAXKiRYADMp6VjRABTm1
 xxmXAzvpBDWzxWwf+8D5uJlxFKlSUakgWg==
X-Google-Smtp-Source: ABdhPJwzN68yBAdoBDCZLdkKiQpMVRPqGInYw4NJIeRbBltDXDCoCx3bKyFzdW0yNkv727GefBXSFA==
X-Received: by 2002:a7b:ce99:: with SMTP id q25mr5006009wmj.35.1605111501388; 
 Wed, 11 Nov 2020 08:18:21 -0800 (PST)
Received: from cmiranda-laptop.localdomain (bl19-104-46.dsl.telepac.pt.
 [2.80.104.46])
 by smtp.gmail.com with ESMTPSA id s188sm3115178wmf.45.2020.11.11.08.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 08:18:20 -0800 (PST)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 12/15] arc: Add Synopsys ARC emulation boards
Date: Wed, 11 Nov 2020 16:17:55 +0000
Message-Id: <20201111161758.9636-13-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201111161758.9636-1-cupertinomiranda@gmail.com>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=cupertinomiranda@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Claudiu Zissulescu <claziss@gmail.com>,
 Cupertino Miranda <cupertinomiranda@gmail.com>,
 Shahab Vahedi <shahab.vahedi@gmail.com>, Shahab Vahedi <shahab@synopsys.com>,
 Cupertino Miranda <cmiranda@synopsys.com>, linux-snps-arc@lists.infradead.org,
 Claudiu Zissulescu <claziss@synopsys.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudiu Zissulescu <claziss@synopsys.com>

Add the Synopsys ARC boards, arc_sim for testing, sim-hs main emulation
board using standard UART and nsim which includes a Synopsys ARC specific
UART implementation.

Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
---
 hw/arc/Makefile.objs     |  21 +++++++
 hw/arc/arc_sim.c         | 124 +++++++++++++++++++++++++++++++++++++++
 hw/arc/boot.c            | 100 +++++++++++++++++++++++++++++++
 hw/arc/boot.h            |  21 +++++++
 hw/arc/meson.build       |  13 ++++
 hw/arc/pic_cpu.c         | 113 +++++++++++++++++++++++++++++++++++
 hw/arc/virt.c            | 107 +++++++++++++++++++++++++++++++++
 include/hw/arc/cpudevs.h |  30 ++++++++++
 8 files changed, 529 insertions(+)
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
index 0000000000..937a9efc50
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
+    elf_machine = cpu->env.family > 2 ? EM_ARC_COMPACT2 : EM_ARC_COMPACT;
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
index 0000000000..ade0b425f7
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
+                  "[IRQ] level = %d, clear = %d, irq = %d, priority = %d, "
+                  "pending = %08x, pc = %08x\n",
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
index 0000000000..426ceca44d
--- /dev/null
+++ b/hw/arc/virt.c
@@ -0,0 +1,107 @@
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
+static void virt_init(MachineState *machine)
+{
+    static struct arc_boot_info boot_info;
+    unsigned int smp_cpus = machine->smp.cpus;
+    MemoryRegion *system_memory = get_system_memory();
+    MemoryRegion *system_ram;
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


