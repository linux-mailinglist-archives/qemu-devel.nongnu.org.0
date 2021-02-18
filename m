Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD60A31E44E
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 03:23:33 +0100 (CET)
Received: from localhost ([::1]:49834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCYya-0001OP-QN
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 21:23:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYcj-0007Eu-GK
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:57 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:40586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYch-0008Jj-Bv
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1613613656; x=1645149656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pRMx/YwL6d/7Z0OYD8q7BOoWGKazYFBTH2u6ff5k7YM=;
 b=iHAJvuFalwcjeiWxhYOnVekbKEXn1cXskOW+fgVOxUX+9XVodgFpFPsW
 VCAZaYS0K8ujrneWZNRJFjdvJB8ZoOBmmotaLMPkS1hsa7pIDbEPXXIu8
 IxpSJ8aHqvnxbdTmyYJNKe8Xt49nInloWCWWxDAZBX1whHk7FVhyMCx2N
 Uq8ItUcAKvxWYZvTiQXu/44k/50fvFtOsFDTZ5g/j2iJBU4iBg3D9Vn/4
 yVyBT0FFbacHk5M58IAGcaCbh0vt11V0P+Kawvbb+3asqEnoUZbeT4yX+
 33w7ohEi33Ui1Vr/4gMJ7kVIy2leENiA/HXOzYmtQwEJcgAFaJPQV+SxV w==;
IronPort-SDR: gP7AOyMcHNDM27+/oc9/1eyiDQaWyFANEpDlq6Kp9Oo6w1pdoBZIYsO6Ex0pzaRBD7IRYCkv4e
 dF7BL79wu3GEl9lK3h1FVMVbPCOPYcMXRKu7ldiA7EgA1Tqt7F77Y1MiUPGuGJLLH75pMF/ZNE
 Qs8Ik1bs1Al4F+Uu202IkxxZNvPNMZKKGE+Dj2DXsdng3zonCiP70h72rMB5mw8quK+xtHf+g6
 IF2/Hym7Lezf2fpukXg/ltsLAskDVDCHFBFxu1dhToyCoRTy+QZCkimkP+C2ztQY/lCLG+ww1b
 pSo=
X-IronPort-AV: E=Sophos;i="5.81,185,1610380800"; d="scan'208";a="161392152"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Feb 2021 10:00:02 +0800
IronPort-SDR: ruYno8Lz3EtFPkm91GCdk9Vq/epaRFvFxcmYwgFUOqI7uJZRJU0A1lEdLPUxYZ3mfIzJTOUn0z
 H5jZCJR3hQPUP7Xd9DTgH/zKS+AAG0P9LGmClz26zH63xEtwzmSCLodXf8IQN+6AZ6v3df34fP
 znRbUVNizQvtnAKQ5KCbZaNuo0czv7smMgB+knignxMNWyoKRo0vBmuDU4MR0fFIAkLtqNwKH2
 kUzUdbTwWBAkVoKp9GC9QEFhNUpnDXOl2o1FFkunLhrDiIB1jjHT8sMkEegjMxotFEe4AYst1Z
 iF8teB/sHEK+1mI+DNAT6amN
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 17:43:32 -0800
IronPort-SDR: iatBa7P8ufaaK8jHb9vu3y6S70zqODEeI/a3DfhmMkuQ1U5zxh5V3OrHZn2HhvLPZ4oCo0qI7H
 SMbC9zGMlZVRFs2qT+rQThEVbg1FUxWJpsAK7JgxfF2u0LqL5XUGFdfm6297y6rLhTfuNM6eMn
 P35RHbFzyQGzmbnL2z9ol8NvCWkGGcwabwDLrAQUQSCHKHFY7BF/05tsWuTf64KiIa7osXrzbc
 uA9PEEQM8n9fgtp2JxCAF+fCgVLUVQgXLx81EWi9Ke/A10vF+p05uYw8aiwgiKTp4/y1Pz/T5o
 yXA=
WDCIronportException: Internal
Received: from cn57xfd72.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.43])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Feb 2021 18:00:02 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 19/19] hw/riscv: virt: Map high mmio for PCIe
Date: Wed, 17 Feb 2021 17:59:34 -0800
Message-Id: <20210218015934.1623959-20-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210218015934.1623959-1-alistair.francis@wdc.com>
References: <20210218015934.1623959-1-alistair.francis@wdc.com>
MIME-Version: 1.0
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
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Some peripherals require 64-bit PCI address, so let's map the high
mmio space for PCIe.

For RV32, the address is hardcoded to below 4 GiB from the highest
accessible physical address. For RV64, the base address depends on
top of RAM and is aligned to its size which is using 16 GiB for now.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210122122958.12311-5-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4f44509360..4ab3b35cc7 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -59,6 +59,15 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_DRAM] =        { 0x80000000,           0x0 },
 };
 
+/* PCIe high mmio is fixed for RV32 */
+#define VIRT32_HIGH_PCIE_MMIO_BASE  0x300000000ULL
+#define VIRT32_HIGH_PCIE_MMIO_SIZE  (4 * GiB)
+
+/* PCIe high mmio for RV64, size is fixed but base depends on top of RAM */
+#define VIRT64_HIGH_PCIE_MMIO_SIZE  (16 * GiB)
+
+static MemMapEntry virt_high_pcie_memmap;
+
 #define VIRT_FLASH_SECTOR_SIZE (256 * KiB)
 
 static PFlashCFI01 *virt_flash_create1(RISCVVirtState *s,
@@ -371,7 +380,11 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
         2, memmap[VIRT_PCIE_PIO].base, 2, memmap[VIRT_PCIE_PIO].size,
         1, FDT_PCI_RANGE_MMIO,
         2, memmap[VIRT_PCIE_MMIO].base,
-        2, memmap[VIRT_PCIE_MMIO].base, 2, memmap[VIRT_PCIE_MMIO].size);
+        2, memmap[VIRT_PCIE_MMIO].base, 2, memmap[VIRT_PCIE_MMIO].size,
+        1, FDT_PCI_RANGE_MMIO_64BIT,
+        2, virt_high_pcie_memmap.base,
+        2, virt_high_pcie_memmap.base, 2, virt_high_pcie_memmap.size);
+
     create_pcie_irq_map(fdt, name, plic_pcie_phandle);
     g_free(name);
 
@@ -448,12 +461,14 @@ update_bootargs:
 static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
                                           hwaddr ecam_base, hwaddr ecam_size,
                                           hwaddr mmio_base, hwaddr mmio_size,
+                                          hwaddr high_mmio_base,
+                                          hwaddr high_mmio_size,
                                           hwaddr pio_base,
                                           DeviceState *plic)
 {
     DeviceState *dev;
     MemoryRegion *ecam_alias, *ecam_reg;
-    MemoryRegion *mmio_alias, *mmio_reg;
+    MemoryRegion *mmio_alias, *high_mmio_alias, *mmio_reg;
     qemu_irq irq;
     int i;
 
@@ -473,6 +488,13 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
                              mmio_reg, mmio_base, mmio_size);
     memory_region_add_subregion(get_system_memory(), mmio_base, mmio_alias);
 
+    /* Map high MMIO space */
+    high_mmio_alias = g_new0(MemoryRegion, 1);
+    memory_region_init_alias(high_mmio_alias, OBJECT(dev), "pcie-mmio-high",
+                             mmio_reg, high_mmio_base, high_mmio_size);
+    memory_region_add_subregion(get_system_memory(), high_mmio_base,
+                                high_mmio_alias);
+
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, pio_base);
 
     for (i = 0; i < GPEX_NUM_IRQS; i++) {
@@ -601,6 +623,14 @@ static void virt_machine_init(MachineState *machine)
             machine->ram_size = 10 * GiB;
             error_report("Limitting RAM size to 10 GiB");
         }
+
+        virt_high_pcie_memmap.base = VIRT32_HIGH_PCIE_MMIO_BASE;
+        virt_high_pcie_memmap.size = VIRT32_HIGH_PCIE_MMIO_SIZE;
+    } else {
+        virt_high_pcie_memmap.size = VIRT64_HIGH_PCIE_MMIO_SIZE;
+        virt_high_pcie_memmap.base = memmap[VIRT_DRAM].base + machine->ram_size;
+        virt_high_pcie_memmap.base =
+            ROUND_UP(virt_high_pcie_memmap.base, virt_high_pcie_memmap.size);
     }
 
     /* register system main memory (actual RAM) */
@@ -686,6 +716,8 @@ static void virt_machine_init(MachineState *machine)
                    memmap[VIRT_PCIE_ECAM].size,
                    memmap[VIRT_PCIE_MMIO].base,
                    memmap[VIRT_PCIE_MMIO].size,
+                   virt_high_pcie_memmap.base,
+                   virt_high_pcie_memmap.size,
                    memmap[VIRT_PCIE_PIO].base,
                    DEVICE(pcie_plic));
 
-- 
2.30.0


