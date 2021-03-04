Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DF432D62D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 16:13:45 +0100 (CET)
Received: from localhost ([::1]:40878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpfc-00053K-Vk
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 10:13:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpHh-0002Wq-SV
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:49:01 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:44460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpHf-0007uj-SG
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:49:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1614869339; x=1646405339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n6WS1GlABXHpI2iXwDvsYBIR1AHLWWW3XNQqiPNgbXE=;
 b=l/qI3/aEO7UwZglmi81jrMT+wP3ODhcnrwUgVqHSpwdTyL/3BP5ozuS0
 3t2gFo8frKswZcUfl9Rn3xhqPcLeHgYDv5f7JLaoPiXsujCDKA9Oq8f+k
 zcuXh8UApV6KqOrTjoM5g+4WZAXvXxHFcFsZ7zGmgnOgc03aW0h6ioGf2
 kODqWJH89GUJGh2BELPthZsuxAT2ho82N44co7lxkKkwgVXuQbp3ojMpL
 EBN/OICFTD9ifiHwG2OhzfiTUmudWqbykFkbbaPNcct9/QBiTBBopRNAp
 fdTf8KJM+cqGc3Q4UM+tUlXNxAUp6MK+NQjJrvICTUDSPpTMvMDxBAGKf A==;
IronPort-SDR: PxUINhAyPDi/pQ4D5CrIS8sJT1/YEj2Ey9COLRIedA/LjsSxN7p6UxyozZyZ6Ba4AURVWe2/S6
 8p7/x3aMgr9ZANMzYYYJWoOJELbKVCZNHc2hZ0v2RSQXQAG9v6nbsoKVtqj4x7j9D3a2M7GPrl
 2iLDn/DGIKObSMqdXMgrN0T6RGpiicZb+2xDMFI8tIwuDmFdg7quK7U06bvOqd0tbrJNzgsRdD
 zVc5O8T47JIv0SqvykdUMmlqoD55ddi/p09bMz9wbtrdt0Kmi2rbuHn+h6cFFH28Li8YSS42DZ
 k+s=
X-IronPort-AV: E=Sophos;i="5.81,222,1610380800"; d="scan'208";a="271984435"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Mar 2021 22:48:29 +0800
IronPort-SDR: 95nts3/wTYXvZf84A7HaEvHma6LUNYBHdz+aj+2ha9894j7VHV4Rki8xyJDFMAP+wMqwiBqvCe
 EuOX9sRBP7k3XJvNypFcV+t+kj8ORlVB5tXJFi4cesfZSIvujY6WvAfHzjdGoHH7IFIBRabojt
 QvUfQpQdXShAFfiri3bk59N5TusMdVXXgeh5EV+FXfsg2sY11IRBBqBfh4b9Y4lp985ZmJP5Rm
 C0injhnUkQdlrTkhyuSXgB7zwXCgmuTgL2iWkpzzRTAxbXMDm3nz20Wcg8UZWVmybPeTGqM/px
 /8vJ8s5StHYHb2MKTejY+jmI
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2021 06:29:43 -0800
IronPort-SDR: KfCtSX7Zn11P3rbripi0KmJT6lZl+iP+mFhOzH/dgf5tKycrRr1Xyt5kvIfbMDk1S/k/DTMYth
 xFfqxe4cPO90JR0vCHkGR0pYmLyy5JdXc944XUKp7PfKV1Y6cAdK4NzDs9l270GZNj+qmL5V40
 KLtDohi6gNj6CkmvthqdsfUBl7TuSy/agWFqutb83yQH0CF6oDWQxDD2IBXJGxpgqF0HSqbfOt
 4pGDgvDN2dmWb0J4mpwAuRPQpmPk/VgBw7TOfOPpyMv47S9x7nt9pAgLLBgwFrFhdxJM7WhDiP
 YF8=
WDCIronportException: Internal
Received: from cnf008142.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.109])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Mar 2021 06:48:29 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 19/19] hw/riscv: virt: Map high mmio for PCIe
Date: Thu,  4 Mar 2021 09:46:51 -0500
Message-Id: <20210304144651.310037-20-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210304144651.310037-1-alistair.francis@wdc.com>
References: <20210304144651.310037-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=690dc056c=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Message-id: 20210220144807.819-5-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index c4b8f455f8..4f0c2fbca0 100644
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
@@ -598,6 +620,13 @@ static void virt_machine_init(MachineState *machine)
             error_report("Limiting RAM size to 10 GiB");
         }
 #endif
+        virt_high_pcie_memmap.base = VIRT32_HIGH_PCIE_MMIO_BASE;
+        virt_high_pcie_memmap.size = VIRT32_HIGH_PCIE_MMIO_SIZE;
+    } else {
+        virt_high_pcie_memmap.size = VIRT64_HIGH_PCIE_MMIO_SIZE;
+        virt_high_pcie_memmap.base = memmap[VIRT_DRAM].base + machine->ram_size;
+        virt_high_pcie_memmap.base =
+            ROUND_UP(virt_high_pcie_memmap.base, virt_high_pcie_memmap.size);
     }
 
     /* register system main memory (actual RAM) */
@@ -683,6 +712,8 @@ static void virt_machine_init(MachineState *machine)
                    memmap[VIRT_PCIE_ECAM].size,
                    memmap[VIRT_PCIE_MMIO].base,
                    memmap[VIRT_PCIE_MMIO].size,
+                   virt_high_pcie_memmap.base,
+                   virt_high_pcie_memmap.size,
                    memmap[VIRT_PCIE_PIO].base,
                    DEVICE(pcie_plic));
 
-- 
2.30.1


