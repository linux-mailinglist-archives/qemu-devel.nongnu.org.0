Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D66905B004F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 11:23:32 +0200 (CEST)
Received: from localhost ([::1]:51430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVrHP-0005j1-LC
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 05:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq4f-0004sw-OC
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:06:21 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq4d-0004Ol-GQ
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:06:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537974; x=1694073974;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cKAOi64l1TV20SaDzPjvZ6sG0aWoDRJ3CUi3tXIhioM=;
 b=K+YEvoVjq1AVWtoAEO2v+A5rgX/qlMrTZbsnBAmM5rbgBM/pomMfNmPr
 OCSxynupREHwaN6XOT83YjBqd1mbE9j+YzOKX2LncA922jtgyuft5yJKt
 vHauaxuZdVitFNg1nurDuBQC0tZ2q9aIEer6txJDh+4ZBHaR09Qz/TEre
 4rgUtEDIL/uTxiFJS3RXlWJBxahMfT5tqI5h+tXsqO6tzOrt+/CzHOhRx
 Pnp9KH/O8nOxMDjkxWD6xrBKozNbJrEjSBcXGAye6h7+ILp4OLHAr2LEy
 HiqBpzBBaSe8t/YKdj533rMMdI5SOC4sP9LESGdA65ZMeFSGLHLzJMF23 Q==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210715077"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:05:07 +0800
IronPort-SDR: /oO0M6IYE5optsdRV28W5IkXp3luSu1FhI9kXGOfNKitPSBA0IK0+kpWiFtqDDU0AYWBVCDkkZ
 sYftDY5poxwT+7TZGSPSUKvT8NXbhukBAj6oyU082rgf+Ys1ceL1qIoTJIlcdz9w4heaN4lslp
 lVRUZBLSiGRYK1ahiF/l1r0zdNDBwDOvT4m9bO7DkVRfSkq8Mqn9/1H4VBb4mfV7pDglyWdq1e
 OoTisIbkZDoywCuVCdZK90dUGTk5YQRTtuzTNzsj6TYfIitI6oflA22dNk4FArH3hfeB7o3kVb
 CdiwlnhUXQl1fwOnemR7umhT
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:20:05 -0700
IronPort-SDR: pDvRC2zEkZtyLUV8lCICtDVu6gKU3+g5TNH+TmEuXbAvqKyH/9SiUTFDQZkl9qxBdJdKLBlc2C
 5t1O4W+U5LE40ot2y+o2JHX2TY2SLlWYUn7S+LOX4ghqnqznKld6TI5adNVBltk8B6zCYLNe5Y
 C3wfMyStV7KTNkjlkhSBPDTT54EJAVZ4GOSmK2m8qjZ8GTW5Cem2rP9rCvttPMnslWhxuXKBmG
 I3NEk/3M8ckur/G4ibcCm8RajvCqgHEJlzTL7WO/qI/UTl5AdJp3oH0Ggg1oq+ltZKo5xwmn6r
 +9Q=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:05:07 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Conor Dooley <conor.dooley@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 29/44] hw/riscv: microchip_pfsoc: fix kernel panics due to
 missing peripherals
Date: Wed,  7 Sep 2022 10:03:38 +0200
Message-Id: <20220907080353.111926-30-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220907080353.111926-1-alistair.francis@wdc.com>
References: <20220907080353.111926-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=242877ce7=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Alistair Francis <alistair.francis@wdc.com>
From:  Alistair Francis via <qemu-devel@nongnu.org>

From: Conor Dooley <conor.dooley@microchip.com>

Booting using "Direct Kernel Boot" for PolarFire SoC & skipping u-boot
entirely is probably not advisable, but it does at least show signs of
life. Recent Linux kernel versions make use of peripherals that are
missing definitions in QEMU and lead to kernel panics. These issues
almost certain rear their head for other methods of booting, but I was
unable to figure out a suitable HSS version that is recent enough to
support these peripherals & works with QEMU.

With these peripherals added, booting a kernel with the following hangs
hangs waiting for the system controller's hwrng, but the kernel no
longer panics. With the Linux driver for hwrng disabled, it boots to
console.

qemu-system-riscv64 -M microchip-icicle-kit \
	-m 2G -smp 5 \
	-kernel $(vmlinux_bin) \
	-dtb  $(dtb)\
	-initrd $(initramfs) \
	-display none -serial null \
	-serial stdio

More peripherals are added than strictly required to fix the panics in
the hopes of avoiding a replication of this problem in the future.
Some of the peripherals which are in the device tree for recent kernels
are implemented in the FPGA fabric. The eMMC/SD mux, which exists as
an unimplemented device is replaced by a wider entry. This updated
entry covers both the mux & the remainder of the FPGA fabric connected
to the MSS using Fabric Interrconnect (FIC) 3.

Link: https://github.com/polarfire-soc/icicle-kit-reference-design#fabric-memory-map
Link: https://ww1.microchip.com/downloads/aemDocuments/documents/FPGA/ProductDocuments/SupportingCollateral/V1_4_Register_Map.zip
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220813135127.2971754-1-mail@conchuod.ie>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/microchip_pfsoc.h | 14 ++++++-
 hw/riscv/microchip_pfsoc.c         | 67 +++++++++++++++++++++++++++---
 2 files changed, 74 insertions(+), 7 deletions(-)

diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
index a0673f5f59..a757b240e0 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -88,8 +88,11 @@ enum {
     MICROCHIP_PFSOC_L2LIM,
     MICROCHIP_PFSOC_PLIC,
     MICROCHIP_PFSOC_MMUART0,
+    MICROCHIP_PFSOC_WDOG0,
     MICROCHIP_PFSOC_SYSREG,
+    MICROCHIP_PFSOC_AXISW,
     MICROCHIP_PFSOC_MPUCFG,
+    MICROCHIP_PFSOC_FMETER,
     MICROCHIP_PFSOC_DDR_SGMII_PHY,
     MICROCHIP_PFSOC_EMMC_SD,
     MICROCHIP_PFSOC_DDR_CFG,
@@ -97,19 +100,28 @@ enum {
     MICROCHIP_PFSOC_MMUART2,
     MICROCHIP_PFSOC_MMUART3,
     MICROCHIP_PFSOC_MMUART4,
+    MICROCHIP_PFSOC_WDOG1,
+    MICROCHIP_PFSOC_WDOG2,
+    MICROCHIP_PFSOC_WDOG3,
+    MICROCHIP_PFSOC_WDOG4,
     MICROCHIP_PFSOC_SPI0,
     MICROCHIP_PFSOC_SPI1,
+    MICROCHIP_PFSOC_I2C0,
     MICROCHIP_PFSOC_I2C1,
+    MICROCHIP_PFSOC_CAN0,
+    MICROCHIP_PFSOC_CAN1,
     MICROCHIP_PFSOC_GEM0,
     MICROCHIP_PFSOC_GEM1,
     MICROCHIP_PFSOC_GPIO0,
     MICROCHIP_PFSOC_GPIO1,
     MICROCHIP_PFSOC_GPIO2,
+    MICROCHIP_PFSOC_RTC,
     MICROCHIP_PFSOC_ENVM_CFG,
     MICROCHIP_PFSOC_ENVM_DATA,
+    MICROCHIP_PFSOC_USB,
     MICROCHIP_PFSOC_QSPI_XIP,
     MICROCHIP_PFSOC_IOSCB,
-    MICROCHIP_PFSOC_EMMC_SD_MUX,
+    MICROCHIP_PFSOC_FABRIC_FIC3,
     MICROCHIP_PFSOC_DRAM_LO,
     MICROCHIP_PFSOC_DRAM_LO_ALIAS,
     MICROCHIP_PFSOC_DRAM_HI,
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 7313153606..a821263d4f 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -100,8 +100,11 @@ static const MemMapEntry microchip_pfsoc_memmap[] = {
     [MICROCHIP_PFSOC_L2LIM] =           {  0x8000000,  0x2000000 },
     [MICROCHIP_PFSOC_PLIC] =            {  0xc000000,  0x4000000 },
     [MICROCHIP_PFSOC_MMUART0] =         { 0x20000000,     0x1000 },
+    [MICROCHIP_PFSOC_WDOG0] =           { 0x20001000,     0x1000 },
     [MICROCHIP_PFSOC_SYSREG] =          { 0x20002000,     0x2000 },
+    [MICROCHIP_PFSOC_AXISW] =           { 0x20004000,     0x1000 },
     [MICROCHIP_PFSOC_MPUCFG] =          { 0x20005000,     0x1000 },
+    [MICROCHIP_PFSOC_FMETER] =          { 0x20006000,     0x1000 },
     [MICROCHIP_PFSOC_DDR_SGMII_PHY] =   { 0x20007000,     0x1000 },
     [MICROCHIP_PFSOC_EMMC_SD] =         { 0x20008000,     0x1000 },
     [MICROCHIP_PFSOC_DDR_CFG] =         { 0x20080000,    0x40000 },
@@ -109,19 +112,28 @@ static const MemMapEntry microchip_pfsoc_memmap[] = {
     [MICROCHIP_PFSOC_MMUART2] =         { 0x20102000,     0x1000 },
     [MICROCHIP_PFSOC_MMUART3] =         { 0x20104000,     0x1000 },
     [MICROCHIP_PFSOC_MMUART4] =         { 0x20106000,     0x1000 },
+    [MICROCHIP_PFSOC_WDOG1] =           { 0x20101000,     0x1000 },
+    [MICROCHIP_PFSOC_WDOG2] =           { 0x20103000,     0x1000 },
+    [MICROCHIP_PFSOC_WDOG3] =           { 0x20105000,     0x1000 },
+    [MICROCHIP_PFSOC_WDOG4] =           { 0x20106000,     0x1000 },
     [MICROCHIP_PFSOC_SPI0] =            { 0x20108000,     0x1000 },
     [MICROCHIP_PFSOC_SPI1] =            { 0x20109000,     0x1000 },
+    [MICROCHIP_PFSOC_I2C0] =            { 0x2010a000,     0x1000 },
     [MICROCHIP_PFSOC_I2C1] =            { 0x2010b000,     0x1000 },
+    [MICROCHIP_PFSOC_CAN0] =            { 0x2010c000,     0x1000 },
+    [MICROCHIP_PFSOC_CAN1] =            { 0x2010d000,     0x1000 },
     [MICROCHIP_PFSOC_GEM0] =            { 0x20110000,     0x2000 },
     [MICROCHIP_PFSOC_GEM1] =            { 0x20112000,     0x2000 },
     [MICROCHIP_PFSOC_GPIO0] =           { 0x20120000,     0x1000 },
     [MICROCHIP_PFSOC_GPIO1] =           { 0x20121000,     0x1000 },
     [MICROCHIP_PFSOC_GPIO2] =           { 0x20122000,     0x1000 },
+    [MICROCHIP_PFSOC_RTC] =             { 0x20124000,     0x1000 },
     [MICROCHIP_PFSOC_ENVM_CFG] =        { 0x20200000,     0x1000 },
     [MICROCHIP_PFSOC_ENVM_DATA] =       { 0x20220000,    0x20000 },
+    [MICROCHIP_PFSOC_USB] =             { 0x20201000,     0x1000 },
     [MICROCHIP_PFSOC_QSPI_XIP] =        { 0x21000000,  0x1000000 },
     [MICROCHIP_PFSOC_IOSCB] =           { 0x30000000, 0x10000000 },
-    [MICROCHIP_PFSOC_EMMC_SD_MUX] =     { 0x4f000000,        0x4 },
+    [MICROCHIP_PFSOC_FABRIC_FIC3] =     { 0x40000000, 0x20000000 },
     [MICROCHIP_PFSOC_DRAM_LO] =         { 0x80000000, 0x40000000 },
     [MICROCHIP_PFSOC_DRAM_LO_ALIAS] =   { 0xc0000000, 0x40000000 },
     [MICROCHIP_PFSOC_DRAM_HI] =       { 0x1000000000,        0x0 },
@@ -292,11 +304,21 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysreg), 0,
                     memmap[MICROCHIP_PFSOC_SYSREG].base);
 
+    /* AXISW */
+    create_unimplemented_device("microchip.pfsoc.axisw",
+        memmap[MICROCHIP_PFSOC_AXISW].base,
+        memmap[MICROCHIP_PFSOC_AXISW].size);
+
     /* MPUCFG */
     create_unimplemented_device("microchip.pfsoc.mpucfg",
         memmap[MICROCHIP_PFSOC_MPUCFG].base,
         memmap[MICROCHIP_PFSOC_MPUCFG].size);
 
+    /* FMETER */
+    create_unimplemented_device("microchip.pfsoc.fmeter",
+        memmap[MICROCHIP_PFSOC_FMETER].base,
+        memmap[MICROCHIP_PFSOC_FMETER].size);
+
     /* DDR SGMII PHY */
     sysbus_realize(SYS_BUS_DEVICE(&s->ddr_sgmii_phy), errp);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->ddr_sgmii_phy), 0,
@@ -336,6 +358,23 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
         qdev_get_gpio_in(DEVICE(s->plic), MICROCHIP_PFSOC_MMUART4_IRQ),
         serial_hd(4));
 
+    /* Watchdogs */
+    create_unimplemented_device("microchip.pfsoc.watchdog0",
+        memmap[MICROCHIP_PFSOC_WDOG0].base,
+        memmap[MICROCHIP_PFSOC_WDOG0].size);
+    create_unimplemented_device("microchip.pfsoc.watchdog1",
+        memmap[MICROCHIP_PFSOC_WDOG1].base,
+        memmap[MICROCHIP_PFSOC_WDOG1].size);
+    create_unimplemented_device("microchip.pfsoc.watchdog2",
+        memmap[MICROCHIP_PFSOC_WDOG2].base,
+        memmap[MICROCHIP_PFSOC_WDOG2].size);
+    create_unimplemented_device("microchip.pfsoc.watchdog3",
+        memmap[MICROCHIP_PFSOC_WDOG3].base,
+        memmap[MICROCHIP_PFSOC_WDOG3].size);
+    create_unimplemented_device("microchip.pfsoc.watchdog4",
+        memmap[MICROCHIP_PFSOC_WDOG4].base,
+        memmap[MICROCHIP_PFSOC_WDOG4].size);
+
     /* SPI */
     create_unimplemented_device("microchip.pfsoc.spi0",
         memmap[MICROCHIP_PFSOC_SPI0].base,
@@ -344,11 +383,27 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
         memmap[MICROCHIP_PFSOC_SPI1].base,
         memmap[MICROCHIP_PFSOC_SPI1].size);
 
-    /* I2C1 */
+    /* I2C */
+    create_unimplemented_device("microchip.pfsoc.i2c0",
+        memmap[MICROCHIP_PFSOC_I2C0].base,
+        memmap[MICROCHIP_PFSOC_I2C0].size);
     create_unimplemented_device("microchip.pfsoc.i2c1",
         memmap[MICROCHIP_PFSOC_I2C1].base,
         memmap[MICROCHIP_PFSOC_I2C1].size);
 
+    /* CAN */
+    create_unimplemented_device("microchip.pfsoc.can0",
+        memmap[MICROCHIP_PFSOC_CAN0].base,
+        memmap[MICROCHIP_PFSOC_CAN0].size);
+    create_unimplemented_device("microchip.pfsoc.can1",
+        memmap[MICROCHIP_PFSOC_CAN1].base,
+        memmap[MICROCHIP_PFSOC_CAN1].size);
+
+    /* USB */
+    create_unimplemented_device("microchip.pfsoc.usb",
+        memmap[MICROCHIP_PFSOC_USB].base,
+        memmap[MICROCHIP_PFSOC_USB].size);
+
     /* GEMs */
 
     nd = &nd_table[0];
@@ -402,10 +457,10 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->ioscb), 0,
                     memmap[MICROCHIP_PFSOC_IOSCB].base);
 
-    /* eMMC/SD mux */
-    create_unimplemented_device("microchip.pfsoc.emmc_sd_mux",
-        memmap[MICROCHIP_PFSOC_EMMC_SD_MUX].base,
-        memmap[MICROCHIP_PFSOC_EMMC_SD_MUX].size);
+    /* FPGA Fabric */
+    create_unimplemented_device("microchip.pfsoc.fabricfic3",
+        memmap[MICROCHIP_PFSOC_FABRIC_FIC3].base,
+        memmap[MICROCHIP_PFSOC_FABRIC_FIC3].size);
 
     /* QSPI Flash */
     memory_region_init_rom(qspi_xip_mem, OBJECT(dev),
-- 
2.37.2


