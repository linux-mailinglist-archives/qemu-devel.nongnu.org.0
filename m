Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D232AC166
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 17:52:49 +0100 (CET)
Received: from localhost ([::1]:36486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcAPQ-0004pJ-Ma
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 11:52:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.brenken@efs-auto.org>)
 id 1kcANM-0002A3-Gc
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 11:50:40 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:56949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.brenken@efs-auto.org>)
 id 1kcANH-0000pA-UI
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 11:50:40 -0500
Received: from localhost.localdomain ([178.239.76.114]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1McH1O-1k21HD1Yw0-00chEg; Mon, 09 Nov 2020 17:50:27 +0100
From: David Brenken <david.brenken@efs-auto.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/1] tricore: added triboard with tc27x_soc
Date: Mon,  9 Nov 2020 17:50:55 +0100
Message-Id: <20201109165055.10508-2-david.brenken@efs-auto.org>
X-Mailer: git-send-email 2.16.1.windows.4
In-Reply-To: <20201109165055.10508-1-david.brenken@efs-auto.org>
References: <20201109165055.10508-1-david.brenken@efs-auto.org>
X-Provags-ID: V03:K1:PH6ltvHzR56MeSYmEYXujel/01eIfusRZLbe6NSujTz7VNyqHaT
 F66E3gd6vjAEdM9FEz5bfQ6BpfDxTWgC/rqOnyKnYuIpQ3jMEe0ybrqcETvE+65I2q9ZKen
 jFCAo03L1aZSuOZSS6DF5TKNgpBZZZl6iU+02nKwqapoUPmo7aDYARuEvwB0tjcieE4xEIU
 Ft5tbwuICPVEPqCDbx6qQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KhZB9OvHnSo=:5m9E1AKMcp7hQWIzcpATy8
 8dkNn55Kp+QPRVVK1AJmBJnQzNdL8MYC3QGGI27ko7+GyencM5CxJeep3FQiJMRQlF0fZ7QGd
 RVI895kpXOyCcSD+9nF1o/Kh7NRidPtdm8eLRWz++UaPcjsYsXwY1LxEzwqpLow2j+OcIx8Eg
 wxZJ7Yr4fkmcOYf2eUheFDftqXGnsXpc227OJNelPDwrRWpPwB3Qd2ZKRNSdMuVrI8Yiu5l7o
 LDHcHLt/OV3Z6opLU/uWOdL24GFWua8Wreamgith5wp4/5Mo28nnZmboq0fXtwcg0q/U8H/+G
 GxYfE/jlOVQb2416PNiG9C4034y9bcI+h7B5041021e3U2jp1u1SND4JfDXQ2RX3YSn3dAalO
 dWkXwwSXGm8+zuXRY77PfJmEhTVnqTOfsoULUkD0kjcnouavFPC40wC/MSQ0fB7AOrtw9hBjK
 u/oVxWJULQ==
Received-SPF: none client-ip=217.72.192.74;
 envelope-from=david.brenken@efs-auto.org; helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 11:50:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: kbastian@mail.uni-paderborn.de,
 Lars Biermanski <lars.biermanski@efs-auto.de>,
 Georg Hofstetter <georg.hofstetter@efs-auto.de>,
 David Brenken <david.brenken@efs-auto.de>,
 Robert Rasche <robert.rasche@efs-auto.de>,
 Andreas Konopik <andreas.konopik@efs-auto.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andreas Konopik <andreas.konopik@efs-auto.de>

Signed-off-by: Andreas Konopik <andreas.konopik@efs-auto.de>
Signed-off-by: David Brenken <david.brenken@efs-auto.de>
Signed-off-by: Georg Hofstetter <georg.hofstetter@efs-auto.de>
Signed-off-by: Robert Rasche <robert.rasche@efs-auto.de>
Signed-off-by: Lars Biermanski <lars.biermanski@efs-auto.de>
---
 default-configs/devices/tricore-softmmu.mak |   2 +-
 hw/tricore/Kconfig                          |   8 +
 hw/tricore/meson.build                      |   2 +
 hw/tricore/tc27x_soc.c                      | 246 ++++++++++++++++++++
 hw/tricore/triboard.c                       |  98 ++++++++
 include/hw/tricore/tc27x_soc.h              | 129 ++++++++++
 include/hw/tricore/triboard.h               |  50 ++++
 7 files changed, 534 insertions(+), 1 deletion(-)
 create mode 100644 hw/tricore/tc27x_soc.c
 create mode 100644 hw/tricore/triboard.c
 create mode 100644 include/hw/tricore/tc27x_soc.h
 create mode 100644 include/hw/tricore/triboard.h

diff --git a/default-configs/devices/tricore-softmmu.mak b/default-configs/devices/tricore-softmmu.mak
index c397cff38a..5cc91cebce 100644
--- a/default-configs/devices/tricore-softmmu.mak
+++ b/default-configs/devices/tricore-softmmu.mak
@@ -1 +1 @@
-CONFIG_TRICORE=y
+CONFIG_TRIBOARD=y
diff --git a/hw/tricore/Kconfig b/hw/tricore/Kconfig
index 9313409309..506e6183c1 100644
--- a/hw/tricore/Kconfig
+++ b/hw/tricore/Kconfig
@@ -1,2 +1,10 @@
 config TRICORE
     bool
+
+config TRIBOARD
+    bool
+    select TRICORE
+    select TC27X_SOC
+
+config TC27X_SOC
+    bool
diff --git a/hw/tricore/meson.build b/hw/tricore/meson.build
index 579aa13c78..77ff6fd137 100644
--- a/hw/tricore/meson.build
+++ b/hw/tricore/meson.build
@@ -1,4 +1,6 @@
 tricore_ss = ss.source_set()
 tricore_ss.add(when: 'CONFIG_TRICORE', if_true: files('tricore_testboard.c'))
+tricore_ss.add(when: 'CONFIG_TRIBOARD', if_true: files('triboard.c'))
+tricore_ss.add(when: 'CONFIG_TC27X_SOC', if_true: files('tc27x_soc.c'))
 
 hw_arch += {'tricore': tricore_ss}
diff --git a/hw/tricore/tc27x_soc.c b/hw/tricore/tc27x_soc.c
new file mode 100644
index 0000000000..8af079e6b2
--- /dev/null
+++ b/hw/tricore/tc27x_soc.c
@@ -0,0 +1,246 @@
+/*
+ * Infineon tc27x SoC System emulation.
+ *
+ * Copyright (c) 2020 Andreas Konopik <andreas.konopik@efs-auto.de>
+ * Copyright (c) 2020 David Brenken <david.brenken@efs-auto.de>
+ *
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
+#include "hw/sysbus.h"
+#include "hw/boards.h"
+#include "hw/loader.h"
+#include "qemu/units.h"
+#include "hw/misc/unimp.h"
+#include "exec/address-spaces.h"
+#include "qemu/log.h"
+#include "cpu.h"
+
+#include "hw/tricore/tc27x_soc.h"
+#include "hw/tricore/triboard.h"
+
+const MemmapEntry tc27x_soc_memmap[] = {
+    [TC27XD_DSPR2]     = { 0x50000000,            120 * KiB },
+    [TC27XD_DCACHE2]   = { 0x5001E000,              8 * KiB },
+    [TC27XD_DTAG2]     = { 0x500C0000,                0xC00 },
+    [TC27XD_PSPR2]     = { 0x50100000,             32 * KiB },
+    [TC27XD_PCACHE2]   = { 0x50108000,             16 * KiB },
+    [TC27XD_PTAG2]     = { 0x501C0000,               0x1800 },
+    [TC27XD_DSPR1]     = { 0x60000000,            120 * KiB },
+    [TC27XD_DCACHE1]   = { 0x6001E000,              8 * KiB },
+    [TC27XD_DTAG1]     = { 0x600C0000,                0xC00 },
+    [TC27XD_PSPR1]     = { 0x60100000,             32 * KiB },
+    [TC27XD_PCACHE1]   = { 0x60108000,             16 * KiB },
+    [TC27XD_PTAG1]     = { 0x601C0000,               0x1800 },
+    [TC27XD_DSPR0]     = { 0x70000000,            112 * KiB },
+    [TC27XD_PSPR0]     = { 0x70100000,             24 * KiB },
+    [TC27XD_PCACHE0]   = { 0x70106000,              8 * KiB },
+    [TC27XD_PTAG0]     = { 0x701C0000,                0xC00 },
+    [TC27XD_PFLASH0_C] = { 0x80000000,              2 * MiB },
+    [TC27XD_PFLASH1_C] = { 0x80200000,              2 * MiB },
+    [TC27XD_OLDA_C]    = { 0x8FE70000,             32 * KiB },
+    [TC27XD_BROM_C]    = { 0x8FFF8000,             32 * KiB },
+    [TC27XD_LMURAM_C]  = { 0x90000000,             32 * KiB },
+    [TC27XD_EMEM_C]    = { 0x9F000000,              1 * MiB },
+    [TC27XD_PFLASH0_U] = { 0xA0000000,                  0x0 },
+    [TC27XD_PFLASH1_U] = { 0xA0200000,                  0x0 },
+    [TC27XD_DFLASH0]   = { 0xAF000000,   1 * MiB + 16 * KiB },
+    [TC27XD_DFLASH1]   = { 0xAF110000,             64 * KiB },
+    [TC27XD_OLDA_U]    = { 0xAFE70000,                  0x0 },
+    [TC27XD_BROM_U]    = { 0xAFFF8000,                  0x0 },
+    [TC27XD_LMURAM_U]  = { 0xB0000000,                  0x0 },
+    [TC27XD_EMEM_U]    = { 0xBF000000,                  0x0 },
+    [TC27XD_PSPRX]     = { 0xC0000000,                  0x0 },
+    [TC27XD_DSPRX]     = { 0xD0000000,                  0x0 },
+};
+
+/*
+ * Initialize the auxiliary ROM region @mr and map it into
+ * the memory map at @base.
+ */
+static void make_rom(MemoryRegion *mr, const char *name,
+                     hwaddr base, hwaddr size)
+{
+    memory_region_init_rom(mr, NULL, name, size, &error_fatal);
+    memory_region_add_subregion(get_system_memory(), base, mr);
+}
+
+/*
+ * Initialize the auxiliary RAM region @mr and map it into
+ * the memory map at @base.
+ */
+static void make_ram(MemoryRegion *mr, const char *name,
+                     hwaddr base, hwaddr size)
+{
+    memory_region_init_ram(mr, NULL, name, size, &error_fatal);
+    memory_region_add_subregion(get_system_memory(), base, mr);
+}
+
+/*
+ * Create an alias of an entire original MemoryRegion @orig
+ * located at @base in the memory map.
+ */
+static void make_alias(MemoryRegion *mr, const char *name,
+                           MemoryRegion *orig, hwaddr base)
+{
+    memory_region_init_alias(mr, NULL, name, orig, 0,
+                             memory_region_size(orig));
+    memory_region_add_subregion(get_system_memory(), base, mr);
+}
+
+static void tc27x_soc_init_memory_mapping(DeviceState *dev_soc)
+{
+    TC27XSoCState *s = TC27X_SOC(dev_soc);
+    TC27XSoCClass *sc = TC27X_SOC_GET_CLASS(s);
+
+    make_ram(&s->cpu0mem.dspr, "CPU0.DSPR",
+        sc->memmap[TC27XD_DSPR0].base, sc->memmap[TC27XD_DSPR0].size);
+    make_ram(&s->cpu0mem.pspr, "CPU0.PSPR",
+        sc->memmap[TC27XD_PSPR0].base, sc->memmap[TC27XD_PSPR0].size);
+    make_ram(&s->cpu1mem.dspr, "CPU1.DSPR",
+        sc->memmap[TC27XD_DSPR1].base, sc->memmap[TC27XD_DSPR1].size);
+    make_ram(&s->cpu1mem.pspr, "CPU1.PSPR",
+        sc->memmap[TC27XD_PSPR1].base, sc->memmap[TC27XD_PSPR1].size);
+    make_ram(&s->cpu2mem.dspr, "CPU2.DSPR",
+        sc->memmap[TC27XD_DSPR2].base, sc->memmap[TC27XD_DSPR2].size);
+    make_ram(&s->cpu2mem.pspr, "CPU2.PSPR",
+        sc->memmap[TC27XD_PSPR2].base, sc->memmap[TC27XD_PSPR2].size);
+
+    /* TODO: Control Cache mapping with Memory Test Unit (MTU) */
+    make_ram(&s->cpu2mem.dcache, "CPU2.DCACHE",
+        sc->memmap[TC27XD_DCACHE2].base, sc->memmap[TC27XD_DCACHE2].size);
+    make_ram(&s->cpu2mem.dtag,   "CPU2.DTAG",
+        sc->memmap[TC27XD_DTAG2].base, sc->memmap[TC27XD_DTAG2].size);
+    make_ram(&s->cpu2mem.pcache, "CPU2.PCACHE",
+        sc->memmap[TC27XD_PCACHE2].base, sc->memmap[TC27XD_PCACHE2].size);
+    make_ram(&s->cpu2mem.ptag,   "CPU2.PTAG",
+        sc->memmap[TC27XD_PTAG2].base, sc->memmap[TC27XD_PTAG2].size);
+
+    make_ram(&s->cpu1mem.dcache, "CPU1.DCACHE",
+        sc->memmap[TC27XD_DCACHE1].base, sc->memmap[TC27XD_DCACHE1].size);
+    make_ram(&s->cpu1mem.dtag,   "CPU1.DTAG",
+        sc->memmap[TC27XD_DTAG1].base, sc->memmap[TC27XD_DTAG1].size);
+    make_ram(&s->cpu1mem.pcache, "CPU1.PCACHE",
+        sc->memmap[TC27XD_PCACHE1].base, sc->memmap[TC27XD_PCACHE1].size);
+    make_ram(&s->cpu1mem.ptag,   "CPU1.PTAG",
+        sc->memmap[TC27XD_PTAG1].base, sc->memmap[TC27XD_PTAG1].size);
+
+    make_ram(&s->cpu0mem.pcache, "CPU0.PCACHE",
+        sc->memmap[TC27XD_PCACHE0].base, sc->memmap[TC27XD_PCACHE0].size);
+    make_ram(&s->cpu0mem.ptag,   "CPU0.PTAG",
+        sc->memmap[TC27XD_PTAG0].base, sc->memmap[TC27XD_PTAG0].size);
+
+    /*
+     * TriCore QEMU executes CPU0 only, thus it is sufficient to map
+     * LOCAL.PSPR/LOCAL.DSPR exclusively onto PSPR0/DSPR0.
+     */
+    make_alias(&s->psprX, "LOCAL.PSPR", &s->cpu0mem.pspr,
+        sc->memmap[TC27XD_PSPRX].base);
+    make_alias(&s->dsprX, "LOCAL.DSPR", &s->cpu0mem.dspr,
+        sc->memmap[TC27XD_DSPRX].base);
+
+    make_ram(&s->flashmem.pflash0_c, "PF0",
+        sc->memmap[TC27XD_PFLASH0_C].base, sc->memmap[TC27XD_PFLASH0_C].size);
+    make_ram(&s->flashmem.pflash1_c, "PF1",
+        sc->memmap[TC27XD_PFLASH1_C].base, sc->memmap[TC27XD_PFLASH1_C].size);
+    make_ram(&s->flashmem.dflash0,   "DF0",
+        sc->memmap[TC27XD_DFLASH0].base, sc->memmap[TC27XD_DFLASH0].size);
+    make_ram(&s->flashmem.dflash1,   "DF1",
+        sc->memmap[TC27XD_DFLASH1].base, sc->memmap[TC27XD_DFLASH1].size);
+    make_ram(&s->flashmem.olda_c,    "OLDA",
+        sc->memmap[TC27XD_OLDA_C].base, sc->memmap[TC27XD_OLDA_C].size);
+    make_rom(&s->flashmem.brom_c,    "BROM",
+        sc->memmap[TC27XD_BROM_C].base, sc->memmap[TC27XD_BROM_C].size);
+    make_ram(&s->flashmem.lmuram_c,  "LMURAM",
+        sc->memmap[TC27XD_LMURAM_C].base, sc->memmap[TC27XD_LMURAM_C].size);
+    make_ram(&s->flashmem.emem_c,    "EMEM",
+        sc->memmap[TC27XD_EMEM_C].base, sc->memmap[TC27XD_EMEM_C].size);
+
+    make_alias(&s->flashmem.pflash0_u, "PF0.U",    &s->flashmem.pflash0_c,
+        sc->memmap[TC27XD_PFLASH0_U].base);
+    make_alias(&s->flashmem.pflash1_u, "PF1.U",    &s->flashmem.pflash1_c,
+        sc->memmap[TC27XD_PFLASH1_U].base);
+    make_alias(&s->flashmem.olda_u,    "OLDA.U",   &s->flashmem.olda_c,
+        sc->memmap[TC27XD_OLDA_U].base);
+    make_alias(&s->flashmem.brom_u,    "BROM.U",   &s->flashmem.brom_c,
+        sc->memmap[TC27XD_BROM_U].base);
+    make_alias(&s->flashmem.lmuram_u,  "LMURAM.U", &s->flashmem.lmuram_c,
+        sc->memmap[TC27XD_LMURAM_U].base);
+    make_alias(&s->flashmem.emem_u,    "EMEM.U",   &s->flashmem.emem_c,
+        sc->memmap[TC27XD_EMEM_U].base);
+}
+
+static void tc27x_soc_realize(DeviceState *dev_soc, Error **errp)
+{
+    TC27XSoCState *s = TC27X_SOC(dev_soc);
+    Error *err = NULL;
+
+    qdev_realize(DEVICE(&s->cpu), NULL, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    tc27x_soc_init_memory_mapping(dev_soc);
+}
+
+static void tc27x_soc_init(Object *obj)
+{
+    TC27XSoCState *s = TC27X_SOC(obj);
+    TC27XSoCClass *sc = TC27X_SOC_GET_CLASS(s);
+
+    object_initialize_child(obj, "tc27x", &s->cpu, sc->cpu_type);
+}
+
+static Property tc27x_soc_properties[] = {
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void tc27x_soc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = tc27x_soc_realize;
+    device_class_set_props(dc, tc27x_soc_properties);
+}
+
+static void tc277d_soc_class_init(ObjectClass *oc, void *data)
+{
+    TC27XSoCClass *sc = TC27X_SOC_CLASS(oc);
+
+    sc->name         = "tc277d-soc";
+    sc->cpu_type     = TRICORE_CPU_TYPE_NAME("tc27x");
+    sc->memmap       = tc27x_soc_memmap;
+    sc->num_cpus     = 1;
+}
+
+static const TypeInfo tc27x_soc_types[] = {
+    {
+        .name          = "tc277d-soc",
+        .parent        = TYPE_TC27X_SOC,
+        .class_init    = tc277d_soc_class_init,
+    }, {
+        .name          = TYPE_TC27X_SOC,
+        .parent        = TYPE_SYS_BUS_DEVICE,
+        .instance_size = sizeof(TC27XSoCState),
+        .instance_init = tc27x_soc_init,
+        .class_size    = sizeof(TC27XSoCClass),
+        .class_init    = tc27x_soc_class_init,
+        .abstract      = true,
+    },
+};
+
+DEFINE_TYPES(tc27x_soc_types)
diff --git a/hw/tricore/triboard.c b/hw/tricore/triboard.c
new file mode 100644
index 0000000000..16e2fd7e27
--- /dev/null
+++ b/hw/tricore/triboard.c
@@ -0,0 +1,98 @@
+/*
+ * Infineon TriBoard System emulation.
+ *
+ * Copyright (c) 2020 Andreas Konopik <andreas.konopik@efs-auto.de>
+ * Copyright (c) 2020 David Brenken <david.brenken@efs-auto.de>
+ *
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
+#include "qemu/units.h"
+#include "qapi/error.h"
+#include "hw/qdev-properties.h"
+#include "cpu.h"
+#include "net/net.h"
+#include "hw/boards.h"
+#include "hw/loader.h"
+#include "exec/address-spaces.h"
+#include "elf.h"
+#include "hw/tricore/tricore.h"
+#include "qemu/error-report.h"
+
+#include "hw/tricore/triboard.h"
+#include "hw/tricore/tc27x_soc.h"
+
+static void tricore_load_kernel(const char *kernel_filename)
+{
+    uint64_t entry;
+    long kernel_size;
+    TriCoreCPU *cpu;
+    CPUTriCoreState *env;
+
+    kernel_size = load_elf(kernel_filename, NULL,
+                           NULL, NULL, &entry, NULL,
+                           NULL, NULL, 0,
+                           EM_TRICORE, 1, 0);
+    if (kernel_size <= 0) {
+        error_report("no kernel file '%s'", kernel_filename);
+        exit(1);
+    }
+    cpu = TRICORE_CPU(first_cpu);
+    env = &cpu->env;
+    env->PC = entry;
+}
+
+
+static void triboard_machine_init(MachineState *machine)
+{
+    TriBoardMachineState *ms = TRIBOARD_MACHINE(machine);
+    TriBoardMachineClass *amc = TRIBOARD_MACHINE_GET_CLASS(machine);
+
+    object_initialize_child(OBJECT(machine), "soc", &ms->tc27x_soc,
+            amc->soc_name);
+    sysbus_realize(SYS_BUS_DEVICE(&ms->tc27x_soc), &error_fatal);
+
+    if (machine->kernel_filename) {
+        tricore_load_kernel(machine->kernel_filename);
+    }
+}
+
+static void triboard_machine_tc277d_class_init(ObjectClass *oc,
+        void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    TriBoardMachineClass *amc = TRIBOARD_MACHINE_CLASS(oc);
+
+    mc->init        = triboard_machine_init;
+    mc->desc        = "Infineon AURIX TriBoard TC277 (D-Step)";
+    mc->max_cpus    = 1;
+    amc->soc_name   = "tc277d-soc";
+};
+
+static const TypeInfo triboard_machine_types[] = {
+    {
+        .name           = MACHINE_TYPE_NAME("KIT_AURIX_TC277_TRB"),
+        .parent         = TYPE_TRIBOARD_MACHINE,
+        .class_init     = triboard_machine_tc277d_class_init,
+    }, {
+        .name           = TYPE_TRIBOARD_MACHINE,
+        .parent         = TYPE_MACHINE,
+        .instance_size  = sizeof(TriBoardMachineState),
+        .class_size     = sizeof(TriBoardMachineClass),
+        .abstract       = true,
+    },
+};
+
+DEFINE_TYPES(triboard_machine_types)
diff --git a/include/hw/tricore/tc27x_soc.h b/include/hw/tricore/tc27x_soc.h
new file mode 100644
index 0000000000..6a7e5b54f5
--- /dev/null
+++ b/include/hw/tricore/tc27x_soc.h
@@ -0,0 +1,129 @@
+/*
+ * Infineon tc27x SoC System emulation.
+ *
+ * Copyright (c) 2020 Andreas Konopik <andreas.konopik@efs-auto.de>
+ * Copyright (c) 2020 David Brenken <david.brenken@efs-auto.de>
+ *
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
+#ifndef TC27X_SoC_H
+#define TC27X_SoC_H
+
+#include "hw/sysbus.h"
+#include "target/tricore/cpu.h"
+#include "qom/object.h"
+
+#define TYPE_TC27X_SOC ("tc27x-soc")
+OBJECT_DECLARE_TYPE(TC27XSoCState, TC27XSoCClass, TC27X_SOC)
+
+typedef struct TC27XSoCCPUMemState {
+
+    MemoryRegion dspr;
+    MemoryRegion pspr;
+
+    MemoryRegion dcache;
+    MemoryRegion dtag;
+    MemoryRegion pcache;
+    MemoryRegion ptag;
+
+} TC27XSoCCPUMemState;
+
+typedef struct TC27XSoCFlashMemState {
+
+    MemoryRegion pflash0_c;
+    MemoryRegion pflash1_c;
+    MemoryRegion pflash0_u;
+    MemoryRegion pflash1_u;
+    MemoryRegion dflash0;
+    MemoryRegion dflash1;
+    MemoryRegion olda_c;
+    MemoryRegion olda_u;
+    MemoryRegion brom_c;
+    MemoryRegion brom_u;
+    MemoryRegion lmuram_c;
+    MemoryRegion lmuram_u;
+    MemoryRegion emem_c;
+    MemoryRegion emem_u;
+
+} TC27XSoCFlashMemState;
+
+typedef struct TC27XSoCState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    TriCoreCPU cpu;
+
+    MemoryRegion dsprX;
+    MemoryRegion psprX;
+
+    TC27XSoCCPUMemState cpu0mem;
+    TC27XSoCCPUMemState cpu1mem;
+    TC27XSoCCPUMemState cpu2mem;
+
+    TC27XSoCFlashMemState flashmem;
+
+} TC27XSoCState;
+
+typedef struct MemmapEntry {
+    hwaddr base;
+    hwaddr size;
+} MemmapEntry;
+
+typedef struct TC27XSoCClass {
+    DeviceClass parent_class;
+
+    const char *name;
+    const char *cpu_type;
+    const MemmapEntry *memmap;
+    uint32_t num_cpus;
+} TC27XSoCClass;
+
+enum {
+    TC27XD_DSPR2,
+    TC27XD_DCACHE2,
+    TC27XD_DTAG2,
+    TC27XD_PSPR2,
+    TC27XD_PCACHE2,
+    TC27XD_PTAG2,
+    TC27XD_DSPR1,
+    TC27XD_DCACHE1,
+    TC27XD_DTAG1,
+    TC27XD_PSPR1,
+    TC27XD_PCACHE1,
+    TC27XD_PTAG1,
+    TC27XD_DSPR0,
+    TC27XD_PSPR0,
+    TC27XD_PCACHE0,
+    TC27XD_PTAG0,
+    TC27XD_PFLASH0_C,
+    TC27XD_PFLASH1_C,
+    TC27XD_OLDA_C,
+    TC27XD_BROM_C,
+    TC27XD_LMURAM_C,
+    TC27XD_EMEM_C,
+    TC27XD_PFLASH0_U,
+    TC27XD_PFLASH1_U,
+    TC27XD_DFLASH0,
+    TC27XD_DFLASH1,
+    TC27XD_OLDA_U,
+    TC27XD_BROM_U,
+    TC27XD_LMURAM_U,
+    TC27XD_EMEM_U,
+    TC27XD_PSPRX,
+    TC27XD_DSPRX,
+};
+
+#endif
diff --git a/include/hw/tricore/triboard.h b/include/hw/tricore/triboard.h
new file mode 100644
index 0000000000..f3844be447
--- /dev/null
+++ b/include/hw/tricore/triboard.h
@@ -0,0 +1,50 @@
+/*
+ * Infineon TriBoard System emulation.
+ *
+ * Copyright (c) 2020 Andreas Konopik <andreas.konopik@efs-auto.de>
+ * Copyright (c) 2020 David Brenken <david.brenken@efs-auto.de>
+ *
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
+#include "hw/boards.h"
+#include "hw/arm/boot.h"
+#include "sysemu/sysemu.h"
+#include "exec/address-spaces.h"
+#include "qom/object.h"
+
+#include "hw/tricore/tc27x_soc.h"
+
+#define TYPE_TRIBOARD_MACHINE MACHINE_TYPE_NAME("triboard")
+typedef struct TriBoardMachineState TriBoardMachineState;
+typedef struct TriBoardMachineClass TriBoardMachineClass;
+DECLARE_OBJ_CHECKERS(TriBoardMachineState, TriBoardMachineClass,
+                     TRIBOARD_MACHINE, TYPE_TRIBOARD_MACHINE)
+
+
+struct TriBoardMachineState {
+    MachineState parent;
+
+    TC27XSoCState tc27x_soc;
+};
+
+struct TriBoardMachineClass {
+    MachineClass parent_obj;
+
+    const char *name;
+    const char *desc;
+    const char *soc_name;
+};
-- 
2.28.0


