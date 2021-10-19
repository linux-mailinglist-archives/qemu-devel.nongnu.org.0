Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1126B433041
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 09:55:37 +0200 (CEST)
Received: from localhost ([::1]:51672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcjyC-0008MJ-5l
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 03:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mcjfP-0001x5-6K
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:36:11 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35048 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mcjfA-0004ZP-AX
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:36:10 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP2s1dW5h3HwcAA--.43474S16; 
 Tue, 19 Oct 2021 15:35:38 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/31] hw/loongarch: Add a virt loongarch 3A5000 board support
Date: Tue, 19 Oct 2021 15:35:00 +0800
Message-Id: <1634628917-10031-15-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9DxP2s1dW5h3HwcAA--.43474S16
X-Coremail-Antispam: 1UD129KBjvAXoW3Zw4xArykJw4xGw43tFW7XFb_yoW8XryxXo
 WavFy7Kw48Gr1avrn5KrnxWrW7Kr1vkF45AayfZa98Ga10yF15JFyDKwn0yFy3JFn5tr45
 uayagFsrJ34xtr95n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 mst@redhat.com, philmd@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 gaosong@loongson.cn, pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

LoongArch is a new RISC ISA, support 32bit mode
or 64bit mode. Now we only add 64bit support.

More detailed info you can see
https://github.com/loongson/LoongArch-Documentation

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 .../devices/loongarch64-softmmu/default.mak   |   3 +
 configs/targets/loongarch64-softmmu.mak       |   2 +
 hw/Kconfig                                    |   1 +
 hw/loongarch/Kconfig                          |   3 +
 hw/loongarch/ls3a5000_virt.c                  | 207 ++++++++++++++++++
 hw/loongarch/meson.build                      |   4 +
 hw/meson.build                                |   1 +
 include/exec/poison.h                         |   2 +
 include/hw/loongarch/loongarch.h              |  47 ++++
 include/sysemu/arch_init.h                    |   1 +
 qapi/machine.json                             |   2 +-
 target/Kconfig                                |   1 +
 target/loongarch/Kconfig                      |   2 +
 target/loongarch/cpu.c                        |   8 +
 target/loongarch/cpu.h                        |   4 +
 15 files changed, 287 insertions(+), 1 deletion(-)
 create mode 100644 configs/devices/loongarch64-softmmu/default.mak
 create mode 100644 configs/targets/loongarch64-softmmu.mak
 create mode 100644 hw/loongarch/Kconfig
 create mode 100644 hw/loongarch/ls3a5000_virt.c
 create mode 100644 hw/loongarch/meson.build
 create mode 100644 include/hw/loongarch/loongarch.h
 create mode 100644 target/loongarch/Kconfig

diff --git a/configs/devices/loongarch64-softmmu/default.mak b/configs/devices/loongarch64-softmmu/default.mak
new file mode 100644
index 0000000000..a6705b9e4a
--- /dev/null
+++ b/configs/devices/loongarch64-softmmu/default.mak
@@ -0,0 +1,3 @@
+# Default configuration for loongarch64-softmmu
+
+CONFIG_LOONGSON_3A5000=y
diff --git a/configs/targets/loongarch64-softmmu.mak b/configs/targets/loongarch64-softmmu.mak
new file mode 100644
index 0000000000..77c266b3b1
--- /dev/null
+++ b/configs/targets/loongarch64-softmmu.mak
@@ -0,0 +1,2 @@
+TARGET_ARCH=loongarch64
+TARGET_BASE_ARCH=loongarch
diff --git a/hw/Kconfig b/hw/Kconfig
index ad20cce0a9..f71b2155ed 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -49,6 +49,7 @@ source avr/Kconfig
 source cris/Kconfig
 source hppa/Kconfig
 source i386/Kconfig
+source loongarch/Kconfig
 source m68k/Kconfig
 source microblaze/Kconfig
 source mips/Kconfig
diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
new file mode 100644
index 0000000000..720822f32c
--- /dev/null
+++ b/hw/loongarch/Kconfig
@@ -0,0 +1,3 @@
+config LOONGSON_3A5000
+    bool
+    select PCI_EXPRESS_7A
diff --git a/hw/loongarch/ls3a5000_virt.c b/hw/loongarch/ls3a5000_virt.c
new file mode 100644
index 0000000000..71ffc2b81f
--- /dev/null
+++ b/hw/loongarch/ls3a5000_virt.c
@@ -0,0 +1,207 @@
+/*
+ * QEMU loongson 3a5000 develop board emulation
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "qemu/units.h"
+#include "qemu/datadir.h"
+#include "qapi/error.h"
+#include "hw/boards.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/qtest.h"
+#include "sysemu/runstate.h"
+#include "sysemu/reset.h"
+#include "hw/loongarch/loongarch.h"
+#include "hw/pci-host/ls7a.h"
+
+CPULoongArchState *cpu_states[LOONGARCH_MAX_VCPUS];
+
+static void main_cpu_reset(void *opaque)
+{
+    LoongArchCPU *cpu = opaque;
+
+    cpu_reset(CPU(cpu));
+}
+
+static uint64_t loongarch_pm_mem_read(void *opaque, hwaddr addr, unsigned size)
+{
+    return 0;
+}
+
+static void loongarch_pm_mem_write(void *opaque, hwaddr addr,
+                                   uint64_t val, unsigned size)
+{
+
+    if (addr != PM_CNT_MODE) {
+        return;
+    }
+
+    switch (val) {
+    case 0x00:
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+        return;
+    case 0xff:
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+        return;
+    default:
+        return;
+    }
+}
+
+static const MemoryRegionOps loongarch_pm_ops = {
+    .read  = loongarch_pm_mem_read,
+    .write = loongarch_pm_mem_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+#define LOONGARCH_SIMPLE_MMIO_OPS(ADDR, NAME, SIZE) \
+({\
+     MemoryRegion *iomem = g_new(MemoryRegion, 1);\
+     memory_region_init_io(iomem, NULL, &loongarch_qemu_ops,\
+                           (void *)ADDR, NAME, SIZE);\
+     memory_region_add_subregion_overlap(address_space_mem, ADDR, iomem, 1);\
+})
+
+static void loongarch_qemu_write(void *opaque, hwaddr addr,
+                                 uint64_t val, unsigned size)
+{
+}
+
+static uint64_t loongarch_qemu_read(void *opaque, hwaddr addr, unsigned size)
+{
+    uint64_t feature = 0UL;
+    addr = ((hwaddr)(long)opaque) + addr;
+    addr = addr & 0xffffffff;
+    switch (addr) {
+    case FEATURE_REG:
+        feature |= 1UL << IOCSRF_MSI | 1UL << IOCSRF_EXTIOI |
+                   1UL << IOCSRF_CSRIPI;
+        return feature ;
+    case VENDOR_REG:
+        return *(uint64_t *)"Loongson-3A5000";
+    case CPUNAME_REG:
+        return *(uint64_t *)"3A5000";
+    }
+    return 0;
+}
+
+static const MemoryRegionOps loongarch_qemu_ops = {
+    .read = loongarch_qemu_read,
+    .write = loongarch_qemu_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
+};
+
+static void ls3a5000_virt_init(MachineState *machine)
+{
+    const char *cpu_model = machine->cpu_type;
+    LoongArchCPU *cpu;
+    CPULoongArchState *env;
+    uint64_t lowram_size = 0, highram_size = 0;
+    MemoryRegion *lowmem = g_new(MemoryRegion, 1);
+    char *ramName = NULL;
+    ram_addr_t ram_size = machine->ram_size;
+    MemoryRegion *address_space_mem = get_system_memory();
+    int i;
+    MemoryRegion *iomem = NULL;
+
+    if (!cpu_model) {
+        cpu_model = LOONGARCH_CPU_TYPE_NAME("Loongson-3A5000");
+    }
+    if (!strstr(cpu_model, "Loongson-3A5000")) {
+        error_report("Loongarch/TCG needs cpu type Loongson-3A5000");
+        exit(1);
+    }
+
+    /* init CPUs */
+    for (i = 0; i < machine->smp.cpus; i++) {
+        Object *cpuobj = NULL;
+        CPUState *cs;
+
+        cpuobj = object_new(machine->cpu_type);
+
+        cs = CPU(cpuobj);
+        cs->cpu_index = i;
+
+        qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
+        object_unref(cpuobj);
+
+        cpu = LOONGARCH_CPU(cs);
+        if (cpu == NULL) {
+            fprintf(stderr, "Unable to find CPU definition\n");
+            exit(1);
+        }
+        env = &cpu->env;
+        cpu_states[i] = env;
+
+        cpu_loongarch_clock_init(cpu);
+        qemu_register_reset(main_cpu_reset, cpu);
+    }
+
+    ramName = g_strdup_printf("loongarch.lowram");
+    lowram_size = MIN(ram_size, 256 * 0x100000);
+    memory_region_init_alias(lowmem, NULL, ramName, machine->ram,
+                             0, lowram_size);
+    memory_region_add_subregion(address_space_mem, 0, lowmem);
+
+    highram_size = ram_size > lowram_size ? ram_size - 256 * 0x100000 : 0;
+    if (highram_size > 0) {
+        MemoryRegion *highmem = g_new(MemoryRegion, 1);
+        ramName = g_strdup_printf("loongarch.highram");
+        memory_region_init_alias(highmem, NULL, ramName, machine->ram,
+                                 lowram_size, highram_size);
+        memory_region_add_subregion(address_space_mem, 0x90000000, highmem);
+    }
+
+    /*Add PM mmio memory for reboot and shutdown*/
+    iomem = g_new(MemoryRegion, 1);
+    memory_region_init_io(iomem, NULL, &loongarch_pm_ops, NULL,
+                          "loongarch_pm", PM_MMIO_SIZE);
+    memory_region_add_subregion(address_space_mem,
+                                PM_MMIO_ADDR, iomem);
+
+    LOONGARCH_SIMPLE_MMIO_OPS(FEATURE_REG, "loongarch_feature", 0x8);
+    LOONGARCH_SIMPLE_MMIO_OPS(VENDOR_REG, "loongarch_vendor", 0x8);
+    LOONGARCH_SIMPLE_MMIO_OPS(CPUNAME_REG, "loongarch_cpuname", 0x8);
+    LOONGARCH_SIMPLE_MMIO_OPS(MISC_FUNC_REG, "loongarch_misc", 0x8);
+    LOONGARCH_SIMPLE_MMIO_OPS(FREQ_REG, "loongarch_freq", 0x8);
+}
+
+static void loongarch_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->desc = "Loongson-5000 LS7A1000 machine";
+    mc->init = ls3a5000_virt_init;
+    mc->default_ram_size = 1 * GiB;
+    mc->default_cpu_type = LOONGARCH_CPU_TYPE_NAME("Loongson-3A5000");
+    mc->default_ram_id = "loongarch.ram";
+    mc->max_cpus = LOONGARCH_MAX_VCPUS;
+    mc->is_default = 1;
+    mc->default_kernel_irqchip_split = false;
+    mc->block_default_type = IF_VIRTIO;
+    mc->default_boot_order = "c";
+    mc->no_cdrom = 1;
+}
+
+static const TypeInfo loongarch_machine_types[] = {
+    {
+        .name           = TYPE_LOONGARCH_MACHINE,
+        .parent         = TYPE_MACHINE,
+        .instance_size  = sizeof(LoongarchMachineState),
+        .class_init     = loongarch_class_init,
+    }
+};
+
+DEFINE_TYPES(loongarch_machine_types)
diff --git a/hw/loongarch/meson.build b/hw/loongarch/meson.build
new file mode 100644
index 0000000000..1e743cadb8
--- /dev/null
+++ b/hw/loongarch/meson.build
@@ -0,0 +1,4 @@
+loongarch_ss = ss.source_set()
+loongarch_ss.add(when: 'CONFIG_LOONGSON_3A5000', if_true: files('ls3a5000_virt.c'))
+
+hw_arch += {'loongarch': loongarch_ss}
diff --git a/hw/meson.build b/hw/meson.build
index b3366c888e..95202649b7 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -49,6 +49,7 @@ subdir('avr')
 subdir('cris')
 subdir('hppa')
 subdir('i386')
+subdir('loongarch')
 subdir('m68k')
 subdir('microblaze')
 subdir('mips')
diff --git a/include/exec/poison.h b/include/exec/poison.h
index 7ad4ad18e8..590bc305c7 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -14,6 +14,7 @@
 #pragma GCC poison TARGET_CRIS
 #pragma GCC poison TARGET_HEXAGON
 #pragma GCC poison TARGET_HPPA
+#pragma GCC poison TARGET_LOONGARCH64
 #pragma GCC poison TARGET_M68K
 #pragma GCC poison TARGET_MICROBLAZE
 #pragma GCC poison TARGET_MIPS
@@ -73,6 +74,7 @@
 #pragma GCC poison CONFIG_HPPA_DIS
 #pragma GCC poison CONFIG_I386_DIS
 #pragma GCC poison CONFIG_HEXAGON_DIS
+#pragma GCC poison CONFIG_LOONGARCH_DIS
 #pragma GCC poison CONFIG_M68K_DIS
 #pragma GCC poison CONFIG_MICROBLAZE_DIS
 #pragma GCC poison CONFIG_MIPS_DIS
diff --git a/include/hw/loongarch/loongarch.h b/include/hw/loongarch/loongarch.h
new file mode 100644
index 0000000000..087a988c34
--- /dev/null
+++ b/include/hw/loongarch/loongarch.h
@@ -0,0 +1,47 @@
+/*
+ * Definitions for loongarch board emulation.
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#ifndef HW_LOONGARCH_H
+#define HW_LOONGARCH_H
+
+#include "target/loongarch/cpu.h"
+#include "qemu-common.h"
+#include "hw/boards.h"
+#include "qemu/queue.h"
+
+#define LOONGARCH_MAX_VCPUS     4
+#define PM_MMIO_ADDR            0x10080000UL
+#define PM_MMIO_SIZE            0x100
+#define PM_CNT_MODE             0x10
+#define FEATURE_REG             0x1fe00008
+#define IOCSRF_TEMP             0
+#define IOCSRF_NODECNT          1
+#define IOCSRF_MSI              2
+#define IOCSRF_EXTIOI           3
+#define IOCSRF_CSRIPI           4
+#define IOCSRF_FREQCSR          5
+#define IOCSRF_FREQSCALE        6
+#define IOCSRF_DVFSV1           7
+#define IOCSRF_GMOD             9
+#define IOCSRF_VM               11
+
+#define VENDOR_REG              0x1fe00010
+#define CPUNAME_REG             0x1fe00020
+#define MISC_FUNC_REG           0x1fe00420
+#define FREQ_REG                0x1fe001d0
+
+typedef struct LoongarchMachineState {
+    /*< private >*/
+    MachineState parent_obj;
+
+} LoongarchMachineState;
+
+#define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("loongson7a")
+DECLARE_INSTANCE_CHECKER(LoongarchMachineState, LOONGARCH_MACHINE,
+                         TYPE_LOONGARCH_MACHINE)
+#endif
diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 70c579560a..3ac3634bbb 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -24,6 +24,7 @@ enum {
     QEMU_ARCH_RX = (1 << 20),
     QEMU_ARCH_AVR = (1 << 21),
     QEMU_ARCH_HEXAGON = (1 << 22),
+    QEMU_ARCH_LOONGARCH = (1 << 23),
 };
 
 extern const uint32_t arch_type;
diff --git a/qapi/machine.json b/qapi/machine.json
index 5db54df298..0ffe84f074 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -30,7 +30,7 @@
 ##
 { 'enum' : 'SysEmuTarget',
   'data' : [ 'aarch64', 'alpha', 'arm', 'avr', 'cris', 'hppa', 'i386',
-             'm68k', 'microblaze', 'microblazeel', 'mips', 'mips64',
+             'loongarch64', 'm68k', 'microblaze', 'microblazeel', 'mips', 'mips64',
              'mips64el', 'mipsel', 'nios2', 'or1k', 'ppc',
              'ppc64', 'riscv32', 'riscv64', 'rx', 's390x', 'sh4',
              'sh4eb', 'sparc', 'sparc64', 'tricore',
diff --git a/target/Kconfig b/target/Kconfig
index ae7f24fc66..83da0bd293 100644
--- a/target/Kconfig
+++ b/target/Kconfig
@@ -4,6 +4,7 @@ source avr/Kconfig
 source cris/Kconfig
 source hppa/Kconfig
 source i386/Kconfig
+source loongarch/Kconfig
 source m68k/Kconfig
 source microblaze/Kconfig
 source mips/Kconfig
diff --git a/target/loongarch/Kconfig b/target/loongarch/Kconfig
new file mode 100644
index 0000000000..46b26b1a85
--- /dev/null
+++ b/target/loongarch/Kconfig
@@ -0,0 +1,2 @@
+config LOONGARCH64
+    bool
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 2886dbd642..532b229c05 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -12,6 +12,7 @@
 #include "qemu/module.h"
 #include "sysemu/qtest.h"
 #include "exec/exec-all.h"
+#include "hw/qdev-properties.h"
 #include "qapi/qapi-commands-machine-target.h"
 #include "migration/vmstate.h"
 #include "cpu.h"
@@ -537,6 +538,12 @@ static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
     return oc;
 }
 
+static Property loongarch_cpu_properties[] = {
+    DEFINE_PROP_INT32("core-id", LoongArchCPU, core_id, -1),
+    DEFINE_PROP_UINT32("id", LoongArchCPU, id, UNASSIGNED_CPU_ID),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     LoongArchCPU *cpu = LOONGARCH_CPU(cs);
@@ -636,6 +643,7 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_parent_realize(dc, loongarch_cpu_realizefn,
                                     &lacc->parent_realize);
     device_class_set_parent_reset(dc, loongarch_cpu_reset, &lacc->parent_reset);
+    device_class_set_props(dc, loongarch_cpu_properties);
 
     cc->class_by_name = loongarch_cpu_class_by_name;
     cc->has_work = loongarch_cpu_has_work;
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index e77517d375..cfdcf1d4a0 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -16,6 +16,8 @@
 
 #define TCG_GUEST_DEFAULT_MO (0)
 
+#define UNASSIGNED_CPU_ID 0xFFFFFFFF
+
 #define FCSR0_M1    0x1f         /* FCSR1 mask, Enables */
 #define FCSR0_M2    0x1f1f0000   /* FCSR2 mask, Cause and Flags */
 #define FCSR0_M3    0x300        /* FCSR3 mask, Round Mode */
@@ -104,6 +106,8 @@ struct LoongArchCPU {
 
     CPUNegativeOffsetState neg;
     CPULoongArchState env;
+    uint32_t id;
+    int32_t core_id;
 };
 
 #define TYPE_LOONGARCH_CPU "loongarch64-cpu"
-- 
2.27.0


