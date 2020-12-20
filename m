Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502EC2DF53B
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Dec 2020 12:32:32 +0100 (CET)
Received: from localhost ([::1]:52554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqwwx-0001xn-Bb
	for lists+qemu-devel@lfdr.de; Sun, 20 Dec 2020 06:32:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqwr6-0005Aa-C5
 for qemu-devel@nongnu.org; Sun, 20 Dec 2020 06:26:28 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:50859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqwr2-0005Sd-J6
 for qemu-devel@nongnu.org; Sun, 20 Dec 2020 06:26:28 -0500
Received: from localhost.localdomain ([82.252.144.198]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N33V5-1k5YKx37an-013QAu; Sun, 20 Dec 2020 12:26:23 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/7] m68k: add Virtual M68k Machine
Date: Sun, 20 Dec 2020 12:26:15 +0100
Message-Id: <20201220112615.933036-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201220112615.933036-1-laurent@vivier.eu>
References: <20201220112615.933036-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:gBJckY55dpK+SQeiXtVrDDuPOJ8lFgY6urlq2/vqmHnrE9mJ3JY
 yG93xGpLHTa0T/4gd/ppgjjrO/TwEfw9mdcY0xvzph26sxsJ6llu9Sf4V1hRnlWPu4Ogo20
 2UNTTM3vCuRrgSpXNfbfg/RyewHda+qekIPN4Z5PzO1Acq2m8bxZuo720jWNecQb7KGG2hd
 smQXUc3BQOV2nmLhKtV9A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yIy5PzzTbYA=:GVJ5njQdB/qSZosual/K9m
 Gi1yIUrMxxReMk4Axzmx7i8NiRjnS8B4Y6K9aUOWYpkrHepfQLQO7YPDMuq2Fx/5OI7Tn+RCC
 fjydy7c3hkhSmKOltHrRejd2fScLNzQLtThX1dhQ6+aaElUkyIydDC0dqRJgQUDjWU97B76OB
 24vvdU0pqiwnG43cCvlSFxHdchamxSMlD4i7T4MLXI5SYDX788n+VaYmiOq+G6/pwxV3HA8Ms
 en032wENv1vgER29nTESGh7/gyyZ+ACvg/pUWtrtjqxTUV4B/v1fpCulTpTO6L6EzDYl7aDCX
 e/PxYhteiLwoNbuqeLj0HTxR/DIOcNPBP/SFa+aaol7d0un+KWaLDBc+f/4uml5b2jKBCmQiU
 8WGqe6ZtcCrp9dUvYEg6mfJ2l/kMLaDncwfm1dRJ4Fre3GZwP/pJ8J8OKar0b
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The machine is based on Goldfish interfaces defined by Google
for Android simulator. It uses Goldfish-rtc (timer and RTC),
Goldfish-pic (PIC) and Goldfish-tty (for serial port and early tty).

The machine is created with 128 virtio-mmio bus, and they can
be used to use serial console, GPU, disk, NIC, HID, ...

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 default-configs/devices/m68k-softmmu.mak      |   1 +
 .../standard-headers/asm-m68k/bootinfo-virt.h |  18 +
 hw/m68k/virt.c                                | 312 ++++++++++++++++++
 MAINTAINERS                                   |   9 +
 hw/m68k/Kconfig                               |  10 +
 hw/m68k/meson.build                           |   1 +
 6 files changed, 351 insertions(+)
 create mode 100644 include/standard-headers/asm-m68k/bootinfo-virt.h
 create mode 100644 hw/m68k/virt.c

diff --git a/default-configs/devices/m68k-softmmu.mak b/default-configs/devices/m68k-softmmu.mak
index 6629fd2aa330..7f8619e42786 100644
--- a/default-configs/devices/m68k-softmmu.mak
+++ b/default-configs/devices/m68k-softmmu.mak
@@ -8,3 +8,4 @@ CONFIG_AN5206=y
 CONFIG_MCF5208=y
 CONFIG_NEXTCUBE=y
 CONFIG_Q800=y
+CONFIG_M68K_VIRT=y
diff --git a/include/standard-headers/asm-m68k/bootinfo-virt.h b/include/standard-headers/asm-m68k/bootinfo-virt.h
new file mode 100644
index 000000000000..81be1e092497
--- /dev/null
+++ b/include/standard-headers/asm-m68k/bootinfo-virt.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+** asm/bootinfo-virt.h -- Virtual-m68k-specific boot information definitions
+*/
+
+#ifndef _UAPI_ASM_M68K_BOOTINFO_VIRT_H
+#define _UAPI_ASM_M68K_BOOTINFO_VIRT_H
+
+#define BI_VIRT_QEMU_VERSION	0x8000
+#define BI_VIRT_GF_PIC_BASE	0x8001
+#define BI_VIRT_GF_RTC_BASE	0x8002
+#define BI_VIRT_GF_TTY_BASE	0x8003
+#define BI_VIRT_VIRTIO_BASE	0x8004
+#define BI_VIRT_CTRL_BASE	0x8005
+
+#define VIRT_BOOTI_VERSION	MK_BI_VERSION(2, 0)
+
+#endif /* _UAPI_ASM_M68K_BOOTINFO_MAC_H */
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
new file mode 100644
index 000000000000..8d9825a68df6
--- /dev/null
+++ b/hw/m68k/virt.c
@@ -0,0 +1,312 @@
+/*
+ * SPDX-License-Identifer: GPL-2.0-or-later
+ *
+ * QEMU Vitual M68K Machine
+ *
+ * (c) 2020 Laurent Vivier <laurent@vivier.eu>
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qemu-common.h"
+#include "sysemu/sysemu.h"
+#include "cpu.h"
+#include "hw/hw.h"
+#include "hw/boards.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "elf.h"
+#include "hw/loader.h"
+#include "ui/console.h"
+#include "exec/address-spaces.h"
+#include "hw/sysbus.h"
+#include "standard-headers/asm-m68k/bootinfo.h"
+#include "standard-headers/asm-m68k/bootinfo-virt.h"
+#include "bootinfo.h"
+#include "net/net.h"
+#include "qapi/error.h"
+#include "sysemu/qtest.h"
+#include "sysemu/runstate.h"
+#include "sysemu/reset.h"
+
+#include "hw/intc/m68k_irqc.h"
+#include "hw/misc/m68k_virt_ctrl.h"
+#include "hw/char/goldfish_tty.h"
+#include "hw/rtc/goldfish_rtc.h"
+#include "hw/intc/goldfish_pic.h"
+#include "hw/virtio/virtio-mmio.h"
+#include "hw/virtio/virtio-blk.h"
+
+/*
+ * 6 goldfish-pic for CPU IRQ #1 to IRQ #6
+ * CPU IRQ #1 -> PIC #1
+ *               IRQ #1 to IRQ #31 -> unused
+ *               IRQ #32 -> goldfish-tty
+ * CPU IRQ #2 -> PIC #2
+ *               IRQ #1 to IRQ #32 -> virtio-mmio from 1 to 32
+ * CPU IRQ #3 -> PIC #3
+ *               IRQ #1 to IRQ #32 -> virtio-mmio from 33 to 64
+ * CPU IRQ #4 -> PIC #4
+ *               IRQ #1 to IRQ #32 -> virtio-mmio from 65 to 96
+ * CPU IRQ #5 -> PIC #5
+ *               IRQ #1 to IRQ #32 -> virtio-mmio from 97 to 128
+ * CPU IRQ #6 -> PIC #6
+ *               IRQ #1 -> goldfish-rtc
+ *               IRQ #2 to IRQ #32 -> unused
+ * CPU IRQ #7 -> NMI
+ */
+
+#define PIC_IRQ_BASE(num)     (8 + (num - 1) * 32)
+#define PIC_IRQ(num, irq)     (PIC_IRQ_BASE(num) + irq - 1)
+#define PIC_GPIO(pic_irq)     (qdev_get_gpio_in(pic_dev[(pic_irq - 8) / 32], \
+                                                (pic_irq - 8) % 32))
+
+#define VIRT_GF_PIC_MMIO_BASE 0xff000000     /* MMIO: 0xff000000 - 0xff005fff */
+#define VIRT_GF_PIC_IRQ_BASE  1              /* IRQ: #1 -> #6 */
+#define VIRT_GF_PIC_NB        6
+
+/* 2 goldfish-rtc (and timer) */
+#define VIRT_GF_RTC_MMIO_BASE 0xff006000     /* MMIO: 0xff006000 - 0xff007fff */
+#define VIRT_GF_RTC_IRQ_BASE  PIC_IRQ(6, 1)  /* PIC: #6, IRQ: #1 */
+#define VIRT_GF_RTC_NB        2
+
+/* 1 goldfish-tty */
+#define VIRT_GF_TTY_MMIO_BASE 0xff008000     /* MMIO: 0xff008000 - 0xff008fff */
+#define VIRT_GF_TTY_IRQ_BASE  PIC_IRQ(1, 32) /* PIC: #1, IRQ: #32 */
+
+/* 1 m68k-virt-ctrl */
+#define VIRT_M68K_CTRL_MMIO_BASE 0xff009000    /* MMIO: 0xff009000 - 0xff009fff */
+#define VIRT_M68K_CTRL_IRQ_BASE  PIC_IRQ(1, 1) /* PIC: #1, IRQ: #1 */
+
+/*
+ * virtio-mmio size is 0x200 bytes
+ * we use 4 goldfish-pic to attach them,
+ * we can attach 32 virtio devices / goldfish-pic
+ * -> we can manage 32 * 4 = 128 virtio devices
+ */
+#define VIRT_VIRTIO_MMIO_BASE 0xff010000     /* MMIO: 0xff010000 - 0xff01ffff */
+#define VIRT_VIRTIO_IRQ_BASE  PIC_IRQ(2, 1)  /* PIC: 2, 3, 4, 5, IRQ: ALL */
+
+static void main_cpu_reset(void *opaque)
+{
+    M68kCPU *cpu = opaque;
+    CPUState *cs = CPU(cpu);
+
+    cpu_reset(cs);
+    cpu->env.aregs[7] = ldl_phys(cs->as, 0);
+    cpu->env.pc = ldl_phys(cs->as, 4);
+}
+
+static void virt_init(MachineState *machine)
+{
+    M68kCPU *cpu = NULL;
+    int32_t kernel_size;
+    uint64_t elf_entry;
+    ram_addr_t initrd_base;
+    int32_t initrd_size;
+    ram_addr_t ram_size = machine->ram_size;
+    const char *kernel_filename = machine->kernel_filename;
+    const char *initrd_filename = machine->initrd_filename;
+    const char *kernel_cmdline = machine->kernel_cmdline;
+    hwaddr parameters_base;
+    DeviceState *dev;
+    DeviceState *irqc_dev;
+    DeviceState *pic_dev[VIRT_GF_PIC_NB];
+    SysBusDevice *sysbus;
+    hwaddr io_base;
+    int i;
+
+    if (ram_size > 3399672 * KiB) {
+        /*
+         * The physical memory can be up to 4 GiB - 16 MiB, but linux
+         * kernel crashes after this limit (~ 3.2 GiB)
+         */
+        error_report("Too much memory for this machine: %" PRId64 " KiB, "
+                     "maximum 3399672 KiB", ram_size / KiB);
+        exit(1);
+    }
+
+    /* init CPUs */
+    cpu = M68K_CPU(cpu_create(machine->cpu_type));
+    qemu_register_reset(main_cpu_reset, cpu);
+
+    /* RAM */
+    memory_region_add_subregion(get_system_memory(), 0, machine->ram);
+
+    /* IRQ Controller */
+
+    irqc_dev = qdev_new(TYPE_M68K_IRQC);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(irqc_dev), &error_fatal);
+
+    /*
+     * 6 goldfish-pic
+     *
+     * map: 0xff000000 - 0xff006fff = 28 KiB
+     * IRQ: #1 (lower priority) -> #6 (higher priority)
+     *
+     */
+    io_base = VIRT_GF_PIC_MMIO_BASE;
+    for (i = 0; i < VIRT_GF_PIC_NB; i++) {
+        pic_dev[i] = qdev_new(TYPE_GOLDFISH_PIC);
+        sysbus = SYS_BUS_DEVICE(pic_dev[i]);
+        sysbus_realize_and_unref(sysbus, &error_fatal);
+
+        sysbus_mmio_map(sysbus, 0, io_base);
+        sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(irqc_dev, i));
+
+        io_base += 0x1000;
+    }
+
+    /* goldfish-rtc */
+    io_base = VIRT_GF_RTC_MMIO_BASE;
+    for (i = 0; i < VIRT_GF_RTC_NB; i++) {
+        dev = qdev_new(TYPE_GOLDFISH_RTC);
+        sysbus = SYS_BUS_DEVICE(dev);
+        sysbus_realize_and_unref(sysbus, &error_fatal);
+        sysbus_mmio_map(sysbus, 0, io_base);
+        sysbus_connect_irq(sysbus, 0, PIC_GPIO(VIRT_GF_RTC_IRQ_BASE + i));
+
+        io_base += 0x1000;
+    }
+
+    /* goldfish-tty */
+    dev = qdev_new(TYPE_GOLDFISH_TTY);
+    sysbus = SYS_BUS_DEVICE(dev);
+    qdev_prop_set_chr(dev, "chardev", serial_hd(0));
+    sysbus_realize_and_unref(sysbus, &error_fatal);
+    sysbus_mmio_map(sysbus, 0, VIRT_GF_TTY_MMIO_BASE);
+    sysbus_connect_irq(sysbus, 0, PIC_GPIO(VIRT_GF_TTY_IRQ_BASE));
+
+    /* M68K virt controller */
+    dev = qdev_new(TYPE_M68K_VIRT_CTRL);
+    sysbus = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(sysbus, &error_fatal);
+    sysbus_mmio_map(sysbus, 0, VIRT_M68K_CTRL_MMIO_BASE);
+    sysbus_connect_irq(sysbus, 0, PIC_GPIO(VIRT_M68K_CTRL_IRQ_BASE));
+
+    /* virtio-mmio */
+    io_base = VIRT_VIRTIO_MMIO_BASE;
+    for (i = 0; i < 128; i++) {
+        dev = qdev_new(TYPE_VIRTIO_MMIO);
+        qdev_prop_set_bit(dev, "force-legacy", false);
+        sysbus = SYS_BUS_DEVICE(dev);
+        sysbus_realize_and_unref(sysbus, &error_fatal);
+        sysbus_connect_irq(sysbus, 0, PIC_GPIO(VIRT_VIRTIO_IRQ_BASE + i));
+        sysbus_mmio_map(sysbus, 0, io_base);
+        io_base += 0x200;
+    }
+
+    if (kernel_filename) {
+        CPUState *cs = CPU(cpu);
+        uint64_t high;
+
+        kernel_size = load_elf(kernel_filename, NULL, NULL, NULL,
+                               &elf_entry, NULL, &high, NULL, 1,
+                               EM_68K, 0, 0);
+        if (kernel_size < 0) {
+            error_report("could not load kernel '%s'", kernel_filename);
+            exit(1);
+        }
+        stl_phys(cs->as, 4, elf_entry); /* reset initial PC */
+        parameters_base = (high + 1) & ~1;
+
+        BOOTINFO1(cs->as, parameters_base, BI_MACHTYPE, MACH_VIRT);
+        BOOTINFO1(cs->as, parameters_base, BI_FPUTYPE, FPU_68040);
+        BOOTINFO1(cs->as, parameters_base, BI_MMUTYPE, MMU_68040);
+        BOOTINFO1(cs->as, parameters_base, BI_CPUTYPE, CPU_68040);
+        BOOTINFO2(cs->as, parameters_base, BI_MEMCHUNK, 0, ram_size);
+
+        BOOTINFO1(cs->as, parameters_base, BI_VIRT_QEMU_VERSION,
+                  ((QEMU_VERSION_MAJOR << 24) | (QEMU_VERSION_MINOR << 16) |
+                   (QEMU_VERSION_MICRO << 8)));
+        BOOTINFO2(cs->as, parameters_base, BI_VIRT_GF_PIC_BASE,
+                  VIRT_GF_PIC_MMIO_BASE, VIRT_GF_PIC_IRQ_BASE);
+        BOOTINFO2(cs->as, parameters_base, BI_VIRT_GF_RTC_BASE,
+                  VIRT_GF_RTC_MMIO_BASE, VIRT_GF_RTC_IRQ_BASE);
+        BOOTINFO2(cs->as, parameters_base, BI_VIRT_GF_TTY_BASE,
+                  VIRT_GF_TTY_MMIO_BASE, VIRT_GF_TTY_IRQ_BASE);
+        BOOTINFO2(cs->as, parameters_base, BI_VIRT_CTRL_BASE,
+                  VIRT_M68K_CTRL_MMIO_BASE, VIRT_M68K_CTRL_IRQ_BASE);
+        BOOTINFO2(cs->as, parameters_base, BI_VIRT_VIRTIO_BASE,
+                  VIRT_VIRTIO_MMIO_BASE, VIRT_VIRTIO_IRQ_BASE);
+
+        if (kernel_cmdline) {
+            BOOTINFOSTR(cs->as, parameters_base, BI_COMMAND_LINE,
+                        kernel_cmdline);
+        }
+
+        /* load initrd */
+        if (initrd_filename) {
+            initrd_size = get_image_size(initrd_filename);
+            if (initrd_size < 0) {
+                error_report("could not load initial ram disk '%s'",
+                             initrd_filename);
+                exit(1);
+            }
+
+            initrd_base = (ram_size - initrd_size) & TARGET_PAGE_MASK;
+            load_image_targphys(initrd_filename, initrd_base,
+                                ram_size - initrd_base);
+            BOOTINFO2(cs->as, parameters_base, BI_RAMDISK, initrd_base,
+                      initrd_size);
+        } else {
+            initrd_base = 0;
+            initrd_size = 0;
+        }
+        BOOTINFO0(cs->as, parameters_base, BI_LAST);
+    }
+}
+
+static void virt_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    mc->desc = "QEMU M68K Virtual Machine";
+    mc->init = virt_init;
+    mc->default_cpu_type = M68K_CPU_TYPE_NAME("m68040");
+    mc->max_cpus = 1;
+    mc->no_floppy = 1;
+    mc->no_parallel = 1;
+    mc->default_ram_id = "m68k_virt.ram";
+}
+
+static const TypeInfo virt_machine_info = {
+    .name       = MACHINE_TYPE_NAME("virt"),
+    .parent     = TYPE_MACHINE,
+    .abstract   = true,
+    .class_init = virt_machine_class_init,
+};
+
+static void virt_machine_register_types(void)
+{
+    type_register_static(&virt_machine_info);
+}
+
+type_init(virt_machine_register_types)
+
+#define DEFINE_VIRT_MACHINE(major, minor, latest) \
+    static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
+                                                    void *data) \
+    { \
+        MachineClass *mc = MACHINE_CLASS(oc); \
+        virt_machine_##major##_##minor##_options(mc); \
+        mc->desc = "QEMU " # major "." # minor " M68K Virtual Machine"; \
+        if (latest) { \
+            mc->alias = "virt"; \
+        } \
+    } \
+    static const TypeInfo machvirt_##major##_##minor##_info = { \
+        .name = MACHINE_TYPE_NAME("virt-" # major "." # minor), \
+        .parent = MACHINE_TYPE_NAME("virt"), \
+        .class_init = virt_##major##_##minor##_class_init, \
+    }; \
+    static void machvirt_machine_##major##_##minor##_init(void) \
+    { \
+        type_register_static(&machvirt_##major##_##minor##_info); \
+    } \
+    type_init(machvirt_machine_##major##_##minor##_init);
+
+static void virt_machine_5_2_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE(5, 2, true)
diff --git a/MAINTAINERS b/MAINTAINERS
index 7640dfb5f0fc..5a290151cdec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1105,6 +1105,15 @@ F: include/hw/nubus/*
 F: include/hw/display/macfb.h
 F: include/hw/block/swim.h
 
+virt
+M: Laurent Vivier <laurent@vivier.eu>
+S: Maintained
+F: hw/m68k/virt.c
+F: hw/char/goldfish_tty.c
+F: hw/intc/goldfish_pic.c
+F: include/hw/char/goldfish_tty.h
+F: include/hw/intc/goldfish_pic.h
+
 MicroBlaze Machines
 -------------------
 petalogix_s3adsp1800
diff --git a/hw/m68k/Kconfig b/hw/m68k/Kconfig
index 60d7bcfb8f2b..f90d06d1cab7 100644
--- a/hw/m68k/Kconfig
+++ b/hw/m68k/Kconfig
@@ -23,3 +23,13 @@ config Q800
     select ESP
     select DP8393X
     select OR_IRQ
+
+config M68K_VIRT
+    bool
+    select M68K_IRQC
+    select M68K_VIRT_CTRL
+    select GOLDFISH_PIC
+    select GOLDFISH_TTY
+    select GOLDFISH_RTC
+    select VIRTIO
+    select VIRTIO_MMIO
diff --git a/hw/m68k/meson.build b/hw/m68k/meson.build
index ca0044c652d3..31248641d301 100644
--- a/hw/m68k/meson.build
+++ b/hw/m68k/meson.build
@@ -3,5 +3,6 @@ m68k_ss.add(when: 'CONFIG_AN5206', if_true: files('an5206.c', 'mcf5206.c'))
 m68k_ss.add(when: 'CONFIG_MCF5208', if_true: files('mcf5208.c', 'mcf_intc.c'))
 m68k_ss.add(when: 'CONFIG_NEXTCUBE', if_true: files('next-kbd.c', 'next-cube.c'))
 m68k_ss.add(when: 'CONFIG_Q800', if_true: files('q800.c'))
+m68k_ss.add(when: 'CONFIG_M68K_VIRT', if_true: files('virt.c'))
 
 hw_arch += {'m68k': m68k_ss}
-- 
2.29.2


