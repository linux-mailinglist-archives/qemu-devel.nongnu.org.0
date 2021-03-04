Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1386232D5B8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 15:57:40 +0100 (CET)
Received: from localhost ([::1]:49706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpQ3-0001ge-4j
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 09:57:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpH9-0001p6-P5
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:48:27 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:44459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpH5-0007sK-C3
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:48:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1614869303; x=1646405303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+Yt+kAcaDbKf2JELN5DhtP5Y53t54HCXxt16Ns7VY/A=;
 b=do6Ybxg4BsZg4ejHCXIU3uvlscnVFebTGtHrx4idUGbbAyUBvbMSFEWx
 xd14rpy09cmpQ8p5SNTNFixyBtqjnVsSNt/w43U+bYS120MkYc5zc1v3W
 mueWI+UavgkPKwSNt13LitIqleBC+gQStjUz0HBtFZggIiiLdqmNLxx+0
 AYvzOTKyw4o/bbMBt8jgfYX88/Txrt1LX3RE6rEASww9Jzw1CggaMscmS
 BfXn7ThhiDgo5psVlyZKI3etWyA52HFKSiy0M/V7B5LjtnieYZTzweoYj
 2MlgV8AtrtetvMIq8WeHyLqnYG9weZN+8QnWZFdjaJRcBjlWiN9kVVccC g==;
IronPort-SDR: GK60BAvn1cUkDunsPIs48aqkvTO07zaE3bawU+Dn1jkHAIcVhAJdxdi1mmTyIqqRbbahNH2CPc
 UaiBoXp9OHRU2z2xaRQBWmRfBjWb40c+eHKzpiB9qGwWwY+gQrdBmO9R5WMzE3tELV0YzZqXa1
 FPgPQHr4+VQf7LLowaTgmuJh7gWRMOhKrO+RLzc5Vg2UFNcWbu/1wXsu6kGcRbMcH6CQtUnwj2
 hHd3IpMZ5RYsnX/s7ptk+4uyz+bWpqRKYKgE9Q0Me6tLAYZMkLGjly85IDgaC/kbJLhm3QRjyu
 Yo8=
X-IronPort-AV: E=Sophos;i="5.81,222,1610380800"; d="scan'208";a="271984416"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Mar 2021 22:48:12 +0800
IronPort-SDR: kDPwQWTLavvMltH347SeClJj2iAacwGWeFEEx3EAzXV22+AwYEbejpKcEelhkNfFfkpViKt9Vr
 Gwav0SxqrBlStA6a3Cu1sYQT5wG9rdW2bY/WQwIXvn5lMjLp93uwU7dAO4jw17roltE8osIWqI
 blgTQFkbvKyrIIHDqyhIqfqCrsZjuZTQCPcUJBXQD0mo9HaTG5EfBg+lM7pno0WCV3sA4bxG18
 dLqQX4yiGcxlkqiV5lNWsFuEJCwMTzVNRnjwS9J4wh8VFZi4uxsg8Ck14j8L2P4gv7sqlLGau2
 0vek96n3NSND6ubdBcHNhKxD
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2021 06:29:25 -0800
IronPort-SDR: GhhldaG8C2ibJ/wxuR8BvC0nNRl4tdn89R88/waADtLwD2Im2oAxwTkEutN4HC94yH/vMyVQ8U
 /nm/gCfxqCyeBlWikI29EaJnwMFQFOovCfHbSMMjCorSCM4LMcmfr6Mo8lzXA6mjo+fkch1uRS
 kyqDynRDRRotzKW5rEqQi9LSFdI0XC3ksnZgK+wyJEkZB+ISKwU7ttmJNgcBh8nFTRIMITi5LE
 eclXigGpgW2i1pXHrJuICLSEpAlA4WsYoYJawPBlustxVC681k7mGrWKUxaGpwrDxTvkHFQ96Q
 Pes=
WDCIronportException: Internal
Received: from cnf008142.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.109])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Mar 2021 06:48:12 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 09/19] hw/riscv: sifive_u: Add QSPI2 controller and connect
 an SD card
Date: Thu,  4 Mar 2021 09:46:41 -0500
Message-Id: <20210304144651.310037-10-alistair.francis@wdc.com>
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

This adds the QSPI2 controller to the SoC, and connects an SD
card to it. The generation of corresponding device tree source
fragment is also added.

Specify machine property `msel` to 11 to boot the same upstream
U-Boot SPL and payload image for the SiFive HiFive Unleashed board.
Note subsequent payload is stored in the SD card image.

$ qemu-system-riscv64 -nographic -M sifive_u,msel=11 -smp 5 -m 8G \
    -bios u-boot-spl.bin -drive file=sdcard.img,if=sd

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210126060007.12904-6-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/sifive_u.h |  3 +++
 hw/riscv/sifive_u.c         | 43 +++++++++++++++++++++++++++++++++++--
 hw/riscv/Kconfig            |  1 +
 3 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 8824b7c031..de1464a2ce 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -47,6 +47,7 @@ typedef struct SiFiveUSoCState {
     SiFiveUOTPState otp;
     SiFivePDMAState dma;
     SiFiveSPIState spi0;
+    SiFiveSPIState spi2;
     CadenceGEMState gem;
 
     uint32_t serial;
@@ -85,6 +86,7 @@ enum {
     SIFIVE_U_DEV_UART1,
     SIFIVE_U_DEV_GPIO,
     SIFIVE_U_DEV_QSPI0,
+    SIFIVE_U_DEV_QSPI2,
     SIFIVE_U_DEV_OTP,
     SIFIVE_U_DEV_DMC,
     SIFIVE_U_DEV_FLASH0,
@@ -99,6 +101,7 @@ enum {
     SIFIVE_U_L2CC_IRQ2 = 3,
     SIFIVE_U_UART0_IRQ = 4,
     SIFIVE_U_UART1_IRQ = 5,
+    SIFIVE_U_QSPI2_IRQ = 6,
     SIFIVE_U_GPIO_IRQ0 = 7,
     SIFIVE_U_GPIO_IRQ1 = 8,
     SIFIVE_U_GPIO_IRQ2 = 9,
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 43a0e983d2..6c1158a848 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -16,6 +16,7 @@
  * 6) GEM (Gigabit Ethernet Controller) and management block
  * 7) DMA (Direct Memory Access Controller)
  * 8) SPI0 connected to an SPI flash
+ * 9) SPI2 connected to an SD card
  *
  * This board currently generates devicetree dynamically that indicates at least
  * two harts and up to five harts.
@@ -77,6 +78,7 @@ static const struct MemmapEntry {
     [SIFIVE_U_DEV_UART0] =    { 0x10010000,     0x1000 },
     [SIFIVE_U_DEV_UART1] =    { 0x10011000,     0x1000 },
     [SIFIVE_U_DEV_QSPI0] =    { 0x10040000,     0x1000 },
+    [SIFIVE_U_DEV_QSPI2] =    { 0x10050000,     0x1000 },
     [SIFIVE_U_DEV_GPIO] =     { 0x10060000,     0x1000 },
     [SIFIVE_U_DEV_OTP] =      { 0x10070000,     0x1000 },
     [SIFIVE_U_DEV_GEM] =      { 0x10090000,     0x2000 },
@@ -345,6 +347,31 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
                             "sifive,fu540-c000-ccache");
     g_free(nodename);
 
+    nodename = g_strdup_printf("/soc/spi@%lx",
+        (long)memmap[SIFIVE_U_DEV_QSPI2].base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_cell(fdt, nodename, "#size-cells", 0);
+    qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", 1);
+    qemu_fdt_setprop_cells(fdt, nodename, "clocks",
+        prci_phandle, PRCI_CLK_TLCLK);
+    qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_QSPI2_IRQ);
+    qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
+    qemu_fdt_setprop_cells(fdt, nodename, "reg",
+        0x0, memmap[SIFIVE_U_DEV_QSPI2].base,
+        0x0, memmap[SIFIVE_U_DEV_QSPI2].size);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,spi0");
+    g_free(nodename);
+
+    nodename = g_strdup_printf("/soc/spi@%lx/mmc@0",
+        (long)memmap[SIFIVE_U_DEV_QSPI2].base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop(fdt, nodename, "disable-wp", NULL, 0);
+    qemu_fdt_setprop_cells(fdt, nodename, "voltage-ranges", 3300, 3300);
+    qemu_fdt_setprop_cell(fdt, nodename, "spi-max-frequency", 20000000);
+    qemu_fdt_setprop_cell(fdt, nodename, "reg", 0);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "mmc-spi-slot");
+    g_free(nodename);
+
     nodename = g_strdup_printf("/soc/spi@%lx",
         (long)memmap[SIFIVE_U_DEV_QSPI0].base);
     qemu_fdt_add_subnode(fdt, nodename);
@@ -469,8 +496,8 @@ static void sifive_u_machine_init(MachineState *machine)
     uint32_t fdt_load_addr;
     uint64_t kernel_entry;
     DriveInfo *dinfo;
-    DeviceState *flash_dev;
-    qemu_irq flash_cs;
+    DeviceState *flash_dev, *sd_dev;
+    qemu_irq flash_cs, sd_cs;
 
     /* Initialize SoC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_RISCV_U_SOC);
@@ -616,6 +643,12 @@ static void sifive_u_machine_init(MachineState *machine)
 
     flash_cs = qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->soc.spi0), 1, flash_cs);
+
+    /* Connect an SD card to SPI2 */
+    sd_dev = ssi_create_peripheral(s->soc.spi2.spi, "ssi-sd");
+
+    sd_cs = qdev_get_gpio_in_named(sd_dev, SSI_GPIO_CS, 0);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->soc.spi2), 1, sd_cs);
 }
 
 static bool sifive_u_machine_get_start_in_flash(Object *obj, Error **errp)
@@ -726,6 +759,7 @@ static void sifive_u_soc_instance_init(Object *obj)
     object_initialize_child(obj, "gpio", &s->gpio, TYPE_SIFIVE_GPIO);
     object_initialize_child(obj, "pdma", &s->dma, TYPE_SIFIVE_PDMA);
     object_initialize_child(obj, "spi0", &s->spi0, TYPE_SIFIVE_SPI);
+    object_initialize_child(obj, "spi2", &s->spi2, TYPE_SIFIVE_SPI);
 }
 
 static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
@@ -879,6 +913,11 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
                     memmap[SIFIVE_U_DEV_QSPI0].base);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi0), 0,
                        qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_QSPI0_IRQ));
+    sysbus_realize(SYS_BUS_DEVICE(&s->spi2), errp);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi2), 0,
+                    memmap[SIFIVE_U_DEV_QSPI2].base);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi2), 0,
+                       qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_QSPI2_IRQ));
 }
 
 static Property sifive_u_soc_props[] = {
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 6330297b4e..d139074b02 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -57,6 +57,7 @@ config SIFIVE_U
     select SIFIVE_U_OTP
     select SIFIVE_U_PRCI
     select SSI_M25P80
+    select SSI_SD
     select UNIMP
 
 config SPIKE
-- 
2.30.1


