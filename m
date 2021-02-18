Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FE331E44A
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 03:19:28 +0100 (CET)
Received: from localhost ([::1]:42784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCYud-0006jA-CY
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 21:19:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYcX-00071w-2S
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:45 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:40586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYcU-0008Jj-Nj
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1613613643; x=1645149643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ESlsRtmXmRlcv7DwXwMr6zsIYO052wH+JMWZmKVCfSU=;
 b=LuWMZQJ7xRCwbyaVsr1YIFWz7KjP8yV3e87ZhKfJO6zxgAigobwNMiOy
 soGFiSVPZboUKYMO5YVFJCuUR9RlSJEBFOq0YYXFALtyteWm4YPvrpWXp
 HBqp3tpth0lP7nmVyfFgmTgx3xt/OyJ+eViBojqNk8hgLMQi01Vlv09Mp
 4JVNh2OSqz3f+FpzRUcO4zaI5lyYnH1FgSuCVMzy6H+PsFv/5GBvYrxTU
 XPe1PnmzFjbm4yPHwCaYZjnmGlTPyUkl1OHMZAZJhRWcnp0TqiTIlk+Wl
 48AURvs1ciayTE8Oye9PLj6sCa8XFOvBUfNBoObli8YOepJSEFAg0Ds4M w==;
IronPort-SDR: msKQ+045Cc6U4GSsbtl2i/tq62VPRuZdbkrBGm3SVqShdzl8UyNhKqfsko+ceSuRNpEYmYkPaR
 TqadqAc31+atKao/7Z6ywGDgQOb9ruojk971wMRKUSxX57GPDhs7BLSV5CHx5nECmS6rDpIzZB
 USvTvMoUpsiyXPfv7hj6K6MZF4HWgQsgsnxxqGrJRb3Ar3UVIlBa/lslsufKwTbWsQmFkcP05G
 aAYfGtpIAk7wGIOi81opp2cCmzyYICe2FSMqxJoCLuOtRNr47j8F01GApE0FRv1tvjr+sH3FD2
 vTw=
X-IronPort-AV: E=Sophos;i="5.81,185,1610380800"; d="scan'208";a="161392146"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Feb 2021 10:00:01 +0800
IronPort-SDR: TaWtFkUl2nrZwC9Yqi3/+JfCHfjaf2QeOOqX2dCBi4nVRzQT+Ra6bBpNx2H1LtrhzQ/UET6ncj
 kQ+OAugSAIuqt7m6v3eqN2gp0XQ59a6VH2tbR9xK4oHjMBg8uPFj1nXp2RpyMSpU8xQ4bkz2LC
 fHiUecV544tOWO+6A0zF4TIWDr5AV7LR2Rm5fjMIWSfRdomQOtUmzP476oHHhFuVSUhSrPZmSg
 r9MqfyDEqfyJ0iWpXV9V4tQSk8SrG5ILL7f9Xu3KB3urNcC0t8rNa1SfBtOr4BXegLAhoTbhgE
 ehYXYf0d/iYiPobs1NfR+Lb3
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 17:43:31 -0800
IronPort-SDR: 9JZF7vWqtZY4TPfz5Y20BV5+f28RWiR3DjY75GFkPv7YtyQpa0TsfK8vq4T1hA0cKYtCHGs2c5
 j5tTO64CkoXSnmLUYYf5aG3fQUecqjGAhY3fxc/3sE2mwGMgoTe0KyxpxzMQHPOKsfE24SWGWi
 zeQX7/Rkr85r07Jkd9CwNxBUeekFp+Tola/JfZ1u1/KByUrUibvtLjghGdGkI8RY1FCPuMqdZX
 lNcT3Y0xt98cCc+wNbAAK3RB9xwOT+AgqTayK4dgQcEtRdqc2P8rfFQQxpNA21y2kMTVPRRBNU
 ULg=
WDCIronportException: Internal
Received: from cn57xfd72.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.43])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Feb 2021 18:00:01 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 16/19] hw/riscv: Drop 'struct MemmapEntry'
Date: Wed, 17 Feb 2021 17:59:31 -0800
Message-Id: <20210218015934.1623959-17-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210218015934.1623959-1-alistair.francis@wdc.com>
References: <20210218015934.1623959-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=6763bdb70=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

There is already a MemMapEntry type defined in hwaddr.h. Let's drop
the RISC-V defined `struct MemmapEntry` and use the existing one.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210122122958.12311-2-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/microchip_pfsoc.c |  9 +++------
 hw/riscv/opentitan.c       |  9 +++------
 hw/riscv/sifive_e.c        |  9 +++------
 hw/riscv/sifive_u.c        | 11 ++++-------
 hw/riscv/spike.c           |  9 +++------
 hw/riscv/virt.c            |  9 +++------
 6 files changed, 19 insertions(+), 37 deletions(-)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index e952b49e8c..266f1c3342 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -86,10 +86,7 @@
  *   - Register Map/PF_SoC_RegMap_V1_1/MPFS250T/mpfs250t_ioscb_memmap_dri.htm
  *     describes the complete IOSCB modules memory maps
  */
-static const struct MemmapEntry {
-    hwaddr base;
-    hwaddr size;
-} microchip_pfsoc_memmap[] = {
+static const MemMapEntry microchip_pfsoc_memmap[] = {
     [MICROCHIP_PFSOC_RSVD0] =           {        0x0,      0x100 },
     [MICROCHIP_PFSOC_DEBUG] =           {      0x100,      0xf00 },
     [MICROCHIP_PFSOC_E51_DTIM] =        {  0x1000000,     0x2000 },
@@ -182,7 +179,7 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
     MicrochipPFSoCState *s = MICROCHIP_PFSOC(dev);
-    const struct MemmapEntry *memmap = microchip_pfsoc_memmap;
+    const MemMapEntry *memmap = microchip_pfsoc_memmap;
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *rsvd0_mem = g_new(MemoryRegion, 1);
     MemoryRegion *e51_dtim_mem = g_new(MemoryRegion, 1);
@@ -451,7 +448,7 @@ type_init(microchip_pfsoc_soc_register_types)
 static void microchip_icicle_kit_machine_init(MachineState *machine)
 {
     MachineClass *mc = MACHINE_GET_CLASS(machine);
-    const struct MemmapEntry *memmap = microchip_pfsoc_memmap;
+    const MemMapEntry *memmap = microchip_pfsoc_memmap;
     MicrochipIcicleKitState *s = MICROCHIP_ICICLE_KIT_MACHINE(machine);
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *mem_low = g_new(MemoryRegion, 1);
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index af3456932f..e168bffe69 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -28,10 +28,7 @@
 #include "qemu/units.h"
 #include "sysemu/sysemu.h"
 
-static const struct MemmapEntry {
-    hwaddr base;
-    hwaddr size;
-} ibex_memmap[] = {
+static const MemMapEntry ibex_memmap[] = {
     [IBEX_DEV_ROM] =            {  0x00008000, 16 * KiB },
     [IBEX_DEV_RAM] =            {  0x10000000,  0x10000 },
     [IBEX_DEV_FLASH] =          {  0x20000000,  0x80000 },
@@ -66,7 +63,7 @@ static const struct MemmapEntry {
 
 static void opentitan_board_init(MachineState *machine)
 {
-    const struct MemmapEntry *memmap = ibex_memmap;
+    const MemMapEntry *memmap = ibex_memmap;
     OpenTitanState *s = g_new0(OpenTitanState, 1);
     MemoryRegion *sys_mem = get_system_memory();
     MemoryRegion *main_mem = g_new(MemoryRegion, 1);
@@ -114,7 +111,7 @@ static void lowrisc_ibex_soc_init(Object *obj)
 
 static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
 {
-    const struct MemmapEntry *memmap = ibex_memmap;
+    const MemMapEntry *memmap = ibex_memmap;
     MachineState *ms = MACHINE(qdev_get_machine());
     LowRISCIbexSoCState *s = RISCV_IBEX_SOC(dev_soc);
     MemoryRegion *sys_mem = get_system_memory();
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 59bac4cc9a..f939bcf9ea 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -50,10 +50,7 @@
 #include "sysemu/sysemu.h"
 #include "exec/address-spaces.h"
 
-static const struct MemmapEntry {
-    hwaddr base;
-    hwaddr size;
-} sifive_e_memmap[] = {
+static MemMapEntry sifive_e_memmap[] = {
     [SIFIVE_E_DEV_DEBUG] =    {        0x0,     0x1000 },
     [SIFIVE_E_DEV_MROM] =     {     0x1000,     0x2000 },
     [SIFIVE_E_DEV_OTP] =      {    0x20000,     0x2000 },
@@ -77,7 +74,7 @@ static const struct MemmapEntry {
 
 static void sifive_e_machine_init(MachineState *machine)
 {
-    const struct MemmapEntry *memmap = sifive_e_memmap;
+    const MemMapEntry *memmap = sifive_e_memmap;
 
     SiFiveEState *s = RISCV_E_MACHINE(machine);
     MemoryRegion *sys_mem = get_system_memory();
@@ -187,7 +184,7 @@ static void sifive_e_soc_init(Object *obj)
 static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
-    const struct MemmapEntry *memmap = sifive_e_memmap;
+    const MemMapEntry *memmap = sifive_e_memmap;
     SiFiveESoCState *s = RISCV_E_SOC(dev);
     MemoryRegion *sys_mem = get_system_memory();
 
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 6c1158a848..7b59942369 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -63,10 +63,7 @@
 
 #include <libfdt.h>
 
-static const struct MemmapEntry {
-    hwaddr base;
-    hwaddr size;
-} sifive_u_memmap[] = {
+static const MemMapEntry sifive_u_memmap[] = {
     [SIFIVE_U_DEV_DEBUG] =    {        0x0,      0x100 },
     [SIFIVE_U_DEV_MROM] =     {     0x1000,     0xf000 },
     [SIFIVE_U_DEV_CLINT] =    {  0x2000000,    0x10000 },
@@ -91,7 +88,7 @@ static const struct MemmapEntry {
 #define OTP_SERIAL          1
 #define GEM_REVISION        0x10070109
 
-static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
+static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
                        uint64_t mem_size, const char *cmdline, bool is_32_bit)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
@@ -484,7 +481,7 @@ static void sifive_u_machine_reset(void *opaque, int n, int level)
 
 static void sifive_u_machine_init(MachineState *machine)
 {
-    const struct MemmapEntry *memmap = sifive_u_memmap;
+    const MemMapEntry *memmap = sifive_u_memmap;
     SiFiveUState *s = RISCV_U_MACHINE(machine);
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *main_mem = g_new(MemoryRegion, 1);
@@ -766,7 +763,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
     SiFiveUSoCState *s = RISCV_U_SOC(dev);
-    const struct MemmapEntry *memmap = sifive_u_memmap;
+    const MemMapEntry *memmap = sifive_u_memmap;
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
     MemoryRegion *l2lim_mem = g_new(MemoryRegion, 1);
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 56986ecfe0..ed4ca9808e 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -43,16 +43,13 @@
 #include "sysemu/qtest.h"
 #include "sysemu/sysemu.h"
 
-static const struct MemmapEntry {
-    hwaddr base;
-    hwaddr size;
-} spike_memmap[] = {
+static const MemMapEntry spike_memmap[] = {
     [SPIKE_MROM] =     {     0x1000,     0xf000 },
     [SPIKE_CLINT] =    {  0x2000000,    0x10000 },
     [SPIKE_DRAM] =     { 0x80000000,        0x0 },
 };
 
-static void create_fdt(SpikeState *s, const struct MemmapEntry *memmap,
+static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
                        uint64_t mem_size, const char *cmdline, bool is_32_bit)
 {
     void *fdt;
@@ -179,7 +176,7 @@ static void create_fdt(SpikeState *s, const struct MemmapEntry *memmap,
 
 static void spike_board_init(MachineState *machine)
 {
-    const struct MemmapEntry *memmap = spike_memmap;
+    const MemMapEntry *memmap = spike_memmap;
     SpikeState *s = SPIKE_MACHINE(machine);
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *main_mem = g_new(MemoryRegion, 1);
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 2299b3a6be..cfd52bc59b 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -43,10 +43,7 @@
 #include "hw/pci/pci.h"
 #include "hw/pci-host/gpex.h"
 
-static const struct MemmapEntry {
-    hwaddr base;
-    hwaddr size;
-} virt_memmap[] = {
+static const MemMapEntry virt_memmap[] = {
     [VIRT_DEBUG] =       {        0x0,         0x100 },
     [VIRT_MROM] =        {     0x1000,        0xf000 },
     [VIRT_TEST] =        {   0x100000,        0x1000 },
@@ -170,7 +167,7 @@ static void create_pcie_irq_map(void *fdt, char *nodename,
                            0x1800, 0, 0, 0x7);
 }
 
-static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
+static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
                        uint64_t mem_size, const char *cmdline, bool is_32_bit)
 {
     void *fdt;
@@ -490,7 +487,7 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
 
 static void virt_machine_init(MachineState *machine)
 {
-    const struct MemmapEntry *memmap = virt_memmap;
+    const MemMapEntry *memmap = virt_memmap;
     RISCVVirtState *s = RISCV_VIRT_MACHINE(machine);
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *main_mem = g_new(MemoryRegion, 1);
-- 
2.30.0


