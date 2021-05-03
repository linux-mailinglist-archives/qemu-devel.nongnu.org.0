Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC7E3722EF
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:24:33 +0200 (CEST)
Received: from localhost ([::1]:39802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldgzQ-00058T-Ay
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgpJ-0004Y7-FO
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:14:05 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgpF-0008VN-Ew
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:14:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080041; x=1651616041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r0t0XRe0hIarwDfhub54+/rN9KJEE3oj+OYuPq3J2D0=;
 b=gTSPbTsQoKX5ywtVmN/rLsmSXhdgFVic4DsCPWu3MSQ3vi0PH+pSJb3S
 tVnPxC+0dvbT/DqSlOdUMT6GfkEKpXkv8SLLAdKZUaGpyryXv4nE308J+
 tGTa8j3VxaiThyNvJCALV115uMDvbSTmeNgp0jqZew+PiswlOuGEWitvf
 7CAn1hOQAJPfY9C4TI89MMsPNj7zSV3K8BZCAl1HB+taCGjLtlt0IhaZz
 rD1zSD1yOrsFgj6GDjcqVidAN4fAvwmbGyl3SvH7St8+gXWxu/cslG8QA
 VNhBDEiVnAS6erKGWrIs0sqL1Y6ont4JFD4usohJBvJruUgU3uWAyy+si A==;
IronPort-SDR: Fm+Xjnirl0XaqcpNaQlVZYEydTI+BNp04/izZY8XnyZT9Foyo7ewEbazxpKiKPUxNU9yVQgl/i
 WHiJbk3ZHaBkYtf7QsEcCmY6/ltJtwLXmR1Q0imOYy3EpD6RetmKUJ3u7vXIv+PnOkDIRRIFuo
 kobmgjv+U3ci2GpX/IcMA+i55Bh96xSDVH8X12Lw/4LrR2jmOLlERLJYI3k+Nd41WXZENzmRM7
 d+t1eGIga/+Kkyk1WngsrfWMVc/ogMJd/hy0hzYesygqw5iyINRi+hHvu45jCu7hEBu/XcVgz9
 Noo=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114602"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:13:59 +0800
IronPort-SDR: nHUTF5mAt98NOQmX8soc7dRQPq7QaggVnE+nVLMkvPS6tgV06/oQuOW8CQp1hclNn4x2c5+DHb
 mhPXPaTzWxc6VnKIgiQhEEb22iqT8RFhFRuXonGWnh6h4VKKTkOASjeSiGJtbarSfcSQObdaRU
 wZiCUH+oU0ePIIgezpj1zqlLfdFlrow6fmb/J52VlZQ5kOY9VWIXlmLyGRa4Y7sygb/tzGm8z5
 ja1RnnF52cRRLfVCTXQ9gTJ7VdSCIa4D6ZW7jpH2UAX4qIh+sZIbZbrzp/AERrzbrqxcsikZJ8
 30EMJf4yB+t8sv+Jmr/LDi0t
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:54:10 -0700
IronPort-SDR: 28M1EL4x1JJu1zhEdEzI8zISzWoHuTgYaMlNt3GdDWnw15R4XQkcvSY2eqJXAYSezuetDmSsOq
 3okLOjKANQv9Y6GNmXIvu/S6QwrJezsm08QmAloxU6jxJSRqQlYLsNwjQFqfWh1FQZjCqgS7Ga
 5Er+i9eNyUFU/d4bjAsSDkFhcyBk8sXd5aKUIpqywWipElUR+bLJzcl3zLuLW6buTW9/ShlPKK
 uOMYeI+BreLvVZUPlAEBNWzSVL1dx9vKiInhi7rvMKIZ+uekwU79ryj3ayR1RjPNKpdMgKr41f
 qQk=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:13:57 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 06/42] riscv: Add initial support for Shakti C machine
Date: Tue,  4 May 2021 08:12:51 +1000
Message-Id: <20210503221327.3068768-7-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503221327.3068768-1-alistair.francis@wdc.com>
References: <20210503221327.3068768-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=750139ea6=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Vijai Kumar K <vijai@behindbytes.com>, alistair23@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vijai Kumar K <vijai@behindbytes.com>

Add support for emulating Shakti reference platform based on C-class
running on arty-100T board.

https://gitlab.com/shaktiproject/cores/shakti-soc/-/blob/master/README.rst

Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210401181457.73039-3-vijai@behindbytes.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 default-configs/devices/riscv64-softmmu.mak |   1 +
 include/hw/riscv/shakti_c.h                 |  73 +++++++++
 hw/riscv/shakti_c.c                         | 170 ++++++++++++++++++++
 MAINTAINERS                                 |   7 +
 hw/riscv/Kconfig                            |  10 ++
 hw/riscv/meson.build                        |   1 +
 6 files changed, 262 insertions(+)
 create mode 100644 include/hw/riscv/shakti_c.h
 create mode 100644 hw/riscv/shakti_c.c

diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-configs/devices/riscv64-softmmu.mak
index d5eec75f05..bc69301fa4 100644
--- a/default-configs/devices/riscv64-softmmu.mak
+++ b/default-configs/devices/riscv64-softmmu.mak
@@ -13,3 +13,4 @@ CONFIG_SIFIVE_E=y
 CONFIG_SIFIVE_U=y
 CONFIG_RISCV_VIRT=y
 CONFIG_MICROCHIP_PFSOC=y
+CONFIG_SHAKTI_C=y
diff --git a/include/hw/riscv/shakti_c.h b/include/hw/riscv/shakti_c.h
new file mode 100644
index 0000000000..8ffc2b0213
--- /dev/null
+++ b/include/hw/riscv/shakti_c.h
@@ -0,0 +1,73 @@
+/*
+ * Shakti C-class SoC emulation
+ *
+ * Copyright (c) 2021 Vijai Kumar K <vijai@behindbytes.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_SHAKTI_H
+#define HW_SHAKTI_H
+
+#include "hw/riscv/riscv_hart.h"
+#include "hw/boards.h"
+
+#define TYPE_RISCV_SHAKTI_SOC "riscv.shakti.cclass.soc"
+#define RISCV_SHAKTI_SOC(obj) \
+    OBJECT_CHECK(ShaktiCSoCState, (obj), TYPE_RISCV_SHAKTI_SOC)
+
+typedef struct ShaktiCSoCState {
+    /*< private >*/
+    DeviceState parent_obj;
+
+    /*< public >*/
+    RISCVHartArrayState cpus;
+    DeviceState *plic;
+    MemoryRegion rom;
+
+} ShaktiCSoCState;
+
+#define TYPE_RISCV_SHAKTI_MACHINE MACHINE_TYPE_NAME("shakti_c")
+#define RISCV_SHAKTI_MACHINE(obj) \
+    OBJECT_CHECK(ShaktiCMachineState, (obj), TYPE_RISCV_SHAKTI_MACHINE)
+typedef struct ShaktiCMachineState {
+    /*< private >*/
+    MachineState parent_obj;
+
+    /*< public >*/
+    ShaktiCSoCState soc;
+} ShaktiCMachineState;
+
+enum {
+    SHAKTI_C_ROM,
+    SHAKTI_C_RAM,
+    SHAKTI_C_UART,
+    SHAKTI_C_GPIO,
+    SHAKTI_C_PLIC,
+    SHAKTI_C_CLINT,
+    SHAKTI_C_I2C,
+};
+
+#define SHAKTI_C_PLIC_HART_CONFIG "MS"
+/* Including Interrupt ID 0 (no interrupt)*/
+#define SHAKTI_C_PLIC_NUM_SOURCES 28
+/* Excluding Priority 0 */
+#define SHAKTI_C_PLIC_NUM_PRIORITIES 2
+#define SHAKTI_C_PLIC_PRIORITY_BASE 0x04
+#define SHAKTI_C_PLIC_PENDING_BASE 0x1000
+#define SHAKTI_C_PLIC_ENABLE_BASE 0x2000
+#define SHAKTI_C_PLIC_ENABLE_STRIDE 0x80
+#define SHAKTI_C_PLIC_CONTEXT_BASE 0x200000
+#define SHAKTI_C_PLIC_CONTEXT_STRIDE 0x1000
+
+#endif
diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
new file mode 100644
index 0000000000..c8205d3f22
--- /dev/null
+++ b/hw/riscv/shakti_c.c
@@ -0,0 +1,170 @@
+/*
+ * Shakti C-class SoC emulation
+ *
+ * Copyright (c) 2021 Vijai Kumar K <vijai@behindbytes.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/boards.h"
+#include "hw/riscv/shakti_c.h"
+#include "qapi/error.h"
+#include "hw/intc/sifive_plic.h"
+#include "hw/intc/sifive_clint.h"
+#include "sysemu/sysemu.h"
+#include "hw/qdev-properties.h"
+#include "exec/address-spaces.h"
+#include "hw/riscv/boot.h"
+
+
+static const struct MemmapEntry {
+    hwaddr base;
+    hwaddr size;
+} shakti_c_memmap[] = {
+    [SHAKTI_C_ROM]   =  {  0x00001000,  0x2000   },
+    [SHAKTI_C_RAM]   =  {  0x80000000,  0x0      },
+    [SHAKTI_C_UART]  =  {  0x00011300,  0x00040  },
+    [SHAKTI_C_GPIO]  =  {  0x020d0000,  0x00100  },
+    [SHAKTI_C_PLIC]  =  {  0x0c000000,  0x20000  },
+    [SHAKTI_C_CLINT] =  {  0x02000000,  0xc0000  },
+    [SHAKTI_C_I2C]   =  {  0x20c00000,  0x00100  },
+};
+
+static void shakti_c_machine_state_init(MachineState *mstate)
+{
+    ShaktiCMachineState *sms = RISCV_SHAKTI_MACHINE(mstate);
+    MemoryRegion *system_memory = get_system_memory();
+    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
+
+    /* Allow only Shakti C CPU for this platform */
+    if (strcmp(mstate->cpu_type, TYPE_RISCV_CPU_SHAKTI_C) != 0) {
+        error_report("This board can only be used with Shakti C CPU");
+        exit(1);
+    }
+
+    /* Initialize SoC */
+    object_initialize_child(OBJECT(mstate), "soc", &sms->soc,
+                            TYPE_RISCV_SHAKTI_SOC);
+    qdev_realize(DEVICE(&sms->soc), NULL, &error_abort);
+
+    /* register RAM */
+    memory_region_init_ram(main_mem, NULL, "riscv.shakti.c.ram",
+                           mstate->ram_size, &error_fatal);
+    memory_region_add_subregion(system_memory,
+                                shakti_c_memmap[SHAKTI_C_RAM].base,
+                                main_mem);
+
+    /* ROM reset vector */
+    riscv_setup_rom_reset_vec(mstate, &sms->soc.cpus,
+                              shakti_c_memmap[SHAKTI_C_RAM].base,
+                              shakti_c_memmap[SHAKTI_C_ROM].base,
+                              shakti_c_memmap[SHAKTI_C_ROM].size, 0, 0,
+                              NULL);
+    riscv_load_firmware(mstate->firmware, shakti_c_memmap[SHAKTI_C_RAM].base,
+                        NULL);
+}
+
+static void shakti_c_machine_instance_init(Object *obj)
+{
+}
+
+static void shakti_c_machine_class_init(ObjectClass *klass, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(klass);
+    mc->desc = "RISC-V Board compatible with Shakti SDK";
+    mc->init = shakti_c_machine_state_init;
+    mc->default_cpu_type = TYPE_RISCV_CPU_SHAKTI_C;
+}
+
+static const TypeInfo shakti_c_machine_type_info = {
+    .name = TYPE_RISCV_SHAKTI_MACHINE,
+    .parent = TYPE_MACHINE,
+    .class_init = shakti_c_machine_class_init,
+    .instance_init = shakti_c_machine_instance_init,
+    .instance_size = sizeof(ShaktiCMachineState),
+};
+
+static void shakti_c_machine_type_info_register(void)
+{
+    type_register_static(&shakti_c_machine_type_info);
+}
+type_init(shakti_c_machine_type_info_register)
+
+static void shakti_c_soc_state_realize(DeviceState *dev, Error **errp)
+{
+    ShaktiCSoCState *sss = RISCV_SHAKTI_SOC(dev);
+    MemoryRegion *system_memory = get_system_memory();
+
+    sysbus_realize(SYS_BUS_DEVICE(&sss->cpus), &error_abort);
+
+    sss->plic = sifive_plic_create(shakti_c_memmap[SHAKTI_C_PLIC].base,
+        (char *)SHAKTI_C_PLIC_HART_CONFIG, 0,
+        SHAKTI_C_PLIC_NUM_SOURCES,
+        SHAKTI_C_PLIC_NUM_PRIORITIES,
+        SHAKTI_C_PLIC_PRIORITY_BASE,
+        SHAKTI_C_PLIC_PENDING_BASE,
+        SHAKTI_C_PLIC_ENABLE_BASE,
+        SHAKTI_C_PLIC_ENABLE_STRIDE,
+        SHAKTI_C_PLIC_CONTEXT_BASE,
+        SHAKTI_C_PLIC_CONTEXT_STRIDE,
+        shakti_c_memmap[SHAKTI_C_PLIC].size);
+
+    sifive_clint_create(shakti_c_memmap[SHAKTI_C_CLINT].base,
+        shakti_c_memmap[SHAKTI_C_CLINT].size, 0, 1,
+        SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
+        SIFIVE_CLINT_TIMEBASE_FREQ, false);
+
+    /* ROM */
+    memory_region_init_rom(&sss->rom, OBJECT(dev), "riscv.shakti.c.rom",
+                           shakti_c_memmap[SHAKTI_C_ROM].size, &error_fatal);
+    memory_region_add_subregion(system_memory,
+        shakti_c_memmap[SHAKTI_C_ROM].base, &sss->rom);
+}
+
+static void shakti_c_soc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->realize = shakti_c_soc_state_realize;
+}
+
+static void shakti_c_soc_instance_init(Object *obj)
+{
+    ShaktiCSoCState *sss = RISCV_SHAKTI_SOC(obj);
+
+    object_initialize_child(obj, "cpus", &sss->cpus, TYPE_RISCV_HART_ARRAY);
+
+    /*
+     * CPU type is fixed and we are not supporting passing from commandline yet.
+     * So let it be in instance_init. When supported should use ms->cpu_type
+     * instead of TYPE_RISCV_CPU_SHAKTI_C
+     */
+    object_property_set_str(OBJECT(&sss->cpus), "cpu-type",
+                            TYPE_RISCV_CPU_SHAKTI_C, &error_abort);
+    object_property_set_int(OBJECT(&sss->cpus), "num-harts", 1,
+                            &error_abort);
+}
+
+static const TypeInfo shakti_c_type_info = {
+    .name = TYPE_RISCV_SHAKTI_SOC,
+    .parent = TYPE_DEVICE,
+    .class_init = shakti_c_soc_class_init,
+    .instance_init = shakti_c_soc_instance_init,
+    .instance_size = sizeof(ShaktiCSoCState),
+};
+
+static void shakti_c_type_info_register(void)
+{
+    type_register_static(&shakti_c_type_info);
+}
+type_init(shakti_c_type_info_register)
diff --git a/MAINTAINERS b/MAINTAINERS
index 4c05ff8bba..181ea0d76d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1392,6 +1392,13 @@ F: include/hw/misc/mchp_pfsoc_dmc.h
 F: include/hw/misc/mchp_pfsoc_ioscb.h
 F: include/hw/misc/mchp_pfsoc_sysreg.h
 
+Shakti C class SoC
+M: Vijai Kumar K <vijai@behindbytes.com>
+L: qemu-riscv@nongnu.org
+S: Supported
+F: hw/riscv/shakti_c.c
+F: include/hw/riscv/shakti_c.h
+
 SiFive Machines
 M: Alistair Francis <Alistair.Francis@wdc.com>
 M: Bin Meng <bin.meng@windriver.com>
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 1de18cdcf1..a0225716b5 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -19,6 +19,16 @@ config OPENTITAN
     select IBEX
     select UNIMP
 
+config SHAKTI
+    bool
+
+config SHAKTI_C
+    bool
+    select UNIMP
+    select SHAKTI
+    select SIFIVE_CLINT
+    select SIFIVE_PLIC
+
 config RISCV_VIRT
     bool
     imply PCI_DEVICES
diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index 275c0f7eb7..a97454661c 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -4,6 +4,7 @@ riscv_ss.add(files('numa.c'))
 riscv_ss.add(files('riscv_hart.c'))
 riscv_ss.add(when: 'CONFIG_OPENTITAN', if_true: files('opentitan.c'))
 riscv_ss.add(when: 'CONFIG_RISCV_VIRT', if_true: files('virt.c'))
+riscv_ss.add(when: 'CONFIG_SHAKTI_C', if_true: files('shakti_c.c'))
 riscv_ss.add(when: 'CONFIG_SIFIVE_E', if_true: files('sifive_e.c'))
 riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u.c'))
 riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('spike.c'))
-- 
2.31.1


