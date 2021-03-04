Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F9D32D5D8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 16:04:06 +0100 (CET)
Received: from localhost ([::1]:35298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpWI-0007rb-0M
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 10:04:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpHA-0001sC-UT
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:48:29 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:44463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpH4-0007up-Ro
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:48:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1614869302; x=1646405302;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nu4UPmrv2b8ouZNTsCStThqvJS+SOCc7zzlePNDmiKo=;
 b=IsJcZJJ9WtYZzVZHGIeVzAkPtN2vr5XEZYDKOrcQGfZ8YDZJ/hQl7ybn
 RnkvuqnzBbHaAmxX8CmUzYVkUGD6fHvPShwl4tc2lqxRLO0wnko056Ipm
 PTWpM8YTs7eYa+VHH/rKFpmeS5+1a2hG9ketFaE+XjbM/K765uJdJY3XW
 WLoBQwZgxTMGwxJnNsLUqZmZEnqurT5vdxoshP3/NoMlL6WEnLcfzcwCN
 gRv+R/9AWwOF8wSDyIdS5cOWoUcUXJwaSOVH16dTpQXLqxnlkO+iDoQ9x
 g0UB146p8SCZRKzWbOYFdjKTkLV7HUlYNX7Mo673gzrK6q25PKm3R9139 g==;
IronPort-SDR: nEzOIMq4imK/x5ePmER02eouBrcQRbI0vqKSWD8Sd7IBCNhWO7+taArJcXFol5WO/HYaVauuGF
 +XENHTgdVjAsa5swEZi5KB2ifzFj5hdxXvoLiPVBYloi0OmeXvHngzx7o+m/BtdJhc8aNyUYl6
 XXEfMG3OElGZyraoaxJ0VI8PuVufdQVZSBHgyEPcdT3aV5/H23AHhd3eropOwj8KY+ZgEYyVNf
 t6BeNCUO+hX8nCfWcghQFz7c8HEaMqUb84iU6U0Be6yD062D5wcwUKkZc388rro9mmSJuIs41g
 iFw=
X-IronPort-AV: E=Sophos;i="5.81,222,1610380800"; d="scan'208";a="271984410"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Mar 2021 22:48:10 +0800
IronPort-SDR: f1LcXywVPt8Yekzz3WaIepiEE/O2QhJ9mUg4uwREe44fxmmuFwLK0eptVKvoBbIaWNJbB0WlYZ
 i4rZ6ShVQheDENeKZ8zy0lHLUBIDotwhBEOE9ny/l8b7brvWvBNfXJWX5FKs2j7t2xGvcelwZM
 zYUMVGNJh+IAlQygCauOLcPl1utg5qWvidimevz7CnSV6LjldF0W6LZjMXEx8XVjWLt9PaW/gg
 jpl3LpCOPTrK9fojIhnkhutPkC1koufod2hXZzCQnV9R3R0VtW1KcZJGXauBLrQGd4VQUtQQ4D
 R61M047kg4s247zEv9DTQCJ6
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2021 06:29:24 -0800
IronPort-SDR: DMO+gXuvz3AfQSaRIeLRNb9LpDEINTiHTXD4QJtxxdJsbZhDW9ylJMnr7U2GLUpq9PSLlwA4yn
 KOR/3lK0yu2ScW5yR0WRGx0PWqZZYtJ6k7dwp0e55LtofWpY/tcNrtwjODzdUCNbWBOE0NtCOz
 Tf25LabGAMwsDwtNBTKwmpTSCwPVqHdyRbY6yZZRJ5ZYW7VY3KyRI5sIDMI6nBU1B9pqNj8LG9
 30Esu4X6BnIbMW4KPYpTFM8FLvmjURtC6h+iPvNWVJHq/f7EuaKTWgyqK6JXftumEekLJd3p+F
 vfk=
WDCIronportException: Internal
Received: from cnf008142.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.109])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Mar 2021 06:48:11 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 08/19] hw/riscv: sifive_u: Add QSPI0 controller and connect
 a flash
Date: Thu,  4 Mar 2021 09:46:40 -0500
Message-Id: <20210304144651.310037-9-alistair.francis@wdc.com>
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

This adds the QSPI0 controller to the SoC, and connects an ISSI
25WP256 flash to it. The generation of corresponding device tree
source fragment is also added.

Since the direct memory-mapped mode is not supported by the SiFive
SPI model, the <reg> property does not populate the second group
which represents the memory mapped address of the SPI flash.

With this commit, upstream U-Boot for the SiFive HiFive Unleashed
board can boot on QEMU 'sifive_u' out of the box. This allows users
to develop and test the recommended RISC-V boot flow with a real
world use case: ZSBL (in QEMU) loads U-Boot SPL from SPI flash to
L2LIM, then U-Boot SPL loads the payload from SPI flash that is
combined with OpenSBI fw_dynamic firmware and U-Boot proper.

Specify machine property `msel` to 6 to allow booting from the SPI
flash. U-Boot spl is directly loaded via `-bios`, and subsequent
payload is stored in the SPI flash image. Example command line:

$ qemu-system-riscv64 -nographic -M sifive_u,msel=6 -smp 5 -m 8G \
    -bios u-boot-spl.bin -drive file=spi-nor.img,if=mtd

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210126060007.12904-5-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/sifive_u.h |  4 +++
 hw/riscv/sifive_u.c         | 52 +++++++++++++++++++++++++++++++++++++
 hw/riscv/Kconfig            |  2 ++
 3 files changed, 58 insertions(+)

diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index a9f7b4a084..8824b7c031 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -26,6 +26,7 @@
 #include "hw/gpio/sifive_gpio.h"
 #include "hw/misc/sifive_u_otp.h"
 #include "hw/misc/sifive_u_prci.h"
+#include "hw/ssi/sifive_spi.h"
 
 #define TYPE_RISCV_U_SOC "riscv.sifive.u.soc"
 #define RISCV_U_SOC(obj) \
@@ -45,6 +46,7 @@ typedef struct SiFiveUSoCState {
     SIFIVEGPIOState gpio;
     SiFiveUOTPState otp;
     SiFivePDMAState dma;
+    SiFiveSPIState spi0;
     CadenceGEMState gem;
 
     uint32_t serial;
@@ -82,6 +84,7 @@ enum {
     SIFIVE_U_DEV_UART0,
     SIFIVE_U_DEV_UART1,
     SIFIVE_U_DEV_GPIO,
+    SIFIVE_U_DEV_QSPI0,
     SIFIVE_U_DEV_OTP,
     SIFIVE_U_DEV_DMC,
     SIFIVE_U_DEV_FLASH0,
@@ -120,6 +123,7 @@ enum {
     SIFIVE_U_PDMA_IRQ5 = 28,
     SIFIVE_U_PDMA_IRQ6 = 29,
     SIFIVE_U_PDMA_IRQ7 = 30,
+    SIFIVE_U_QSPI0_IRQ = 51,
     SIFIVE_U_GEM_IRQ = 0x35
 };
 
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 59b61cea01..43a0e983d2 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -15,6 +15,7 @@
  * 5) OTP (One-Time Programmable) memory with stored serial number
  * 6) GEM (Gigabit Ethernet Controller) and management block
  * 7) DMA (Direct Memory Access Controller)
+ * 8) SPI0 connected to an SPI flash
  *
  * This board currently generates devicetree dynamically that indicates at least
  * two harts and up to five harts.
@@ -44,6 +45,7 @@
 #include "hw/char/serial.h"
 #include "hw/cpu/cluster.h"
 #include "hw/misc/unimp.h"
+#include "hw/ssi/ssi.h"
 #include "target/riscv/cpu.h"
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/sifive_u.h"
@@ -74,6 +76,7 @@ static const struct MemmapEntry {
     [SIFIVE_U_DEV_PRCI] =     { 0x10000000,     0x1000 },
     [SIFIVE_U_DEV_UART0] =    { 0x10010000,     0x1000 },
     [SIFIVE_U_DEV_UART1] =    { 0x10011000,     0x1000 },
+    [SIFIVE_U_DEV_QSPI0] =    { 0x10040000,     0x1000 },
     [SIFIVE_U_DEV_GPIO] =     { 0x10060000,     0x1000 },
     [SIFIVE_U_DEV_OTP] =      { 0x10070000,     0x1000 },
     [SIFIVE_U_DEV_GEM] =      { 0x10090000,     0x2000 },
@@ -342,6 +345,32 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
                             "sifive,fu540-c000-ccache");
     g_free(nodename);
 
+    nodename = g_strdup_printf("/soc/spi@%lx",
+        (long)memmap[SIFIVE_U_DEV_QSPI0].base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_cell(fdt, nodename, "#size-cells", 0);
+    qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", 1);
+    qemu_fdt_setprop_cells(fdt, nodename, "clocks",
+        prci_phandle, PRCI_CLK_TLCLK);
+    qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_QSPI0_IRQ);
+    qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
+    qemu_fdt_setprop_cells(fdt, nodename, "reg",
+        0x0, memmap[SIFIVE_U_DEV_QSPI0].base,
+        0x0, memmap[SIFIVE_U_DEV_QSPI0].size);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,spi0");
+    g_free(nodename);
+
+    nodename = g_strdup_printf("/soc/spi@%lx/flash@0",
+        (long)memmap[SIFIVE_U_DEV_QSPI0].base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_cell(fdt, nodename, "spi-rx-bus-width", 4);
+    qemu_fdt_setprop_cell(fdt, nodename, "spi-tx-bus-width", 4);
+    qemu_fdt_setprop(fdt, nodename, "m25p,fast-read", NULL, 0);
+    qemu_fdt_setprop_cell(fdt, nodename, "spi-max-frequency", 50000000);
+    qemu_fdt_setprop_cell(fdt, nodename, "reg", 0);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "jedec,spi-nor");
+    g_free(nodename);
+
     phy_phandle = phandle++;
     nodename = g_strdup_printf("/soc/ethernet@%lx",
         (long)memmap[SIFIVE_U_DEV_GEM].base);
@@ -439,6 +468,9 @@ static void sifive_u_machine_init(MachineState *machine)
     int i;
     uint32_t fdt_load_addr;
     uint64_t kernel_entry;
+    DriveInfo *dinfo;
+    DeviceState *flash_dev;
+    qemu_irq flash_cs;
 
     /* Initialize SoC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_RISCV_U_SOC);
@@ -571,6 +603,19 @@ static void sifive_u_machine_init(MachineState *machine)
     riscv_rom_copy_firmware_info(machine, memmap[SIFIVE_U_DEV_MROM].base,
                                  memmap[SIFIVE_U_DEV_MROM].size,
                                  sizeof(reset_vec), kernel_entry);
+
+    /* Connect an SPI flash to SPI0 */
+    flash_dev = qdev_new("is25wp256");
+    dinfo = drive_get_next(IF_MTD);
+    if (dinfo) {
+        qdev_prop_set_drive_err(flash_dev, "drive",
+                                blk_by_legacy_dinfo(dinfo),
+                                &error_fatal);
+    }
+    qdev_realize_and_unref(flash_dev, BUS(s->soc.spi0.spi), &error_fatal);
+
+    flash_cs = qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->soc.spi0), 1, flash_cs);
 }
 
 static bool sifive_u_machine_get_start_in_flash(Object *obj, Error **errp)
@@ -680,6 +725,7 @@ static void sifive_u_soc_instance_init(Object *obj)
     object_initialize_child(obj, "gem", &s->gem, TYPE_CADENCE_GEM);
     object_initialize_child(obj, "gpio", &s->gpio, TYPE_SIFIVE_GPIO);
     object_initialize_child(obj, "pdma", &s->dma, TYPE_SIFIVE_PDMA);
+    object_initialize_child(obj, "spi0", &s->spi0, TYPE_SIFIVE_SPI);
 }
 
 static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
@@ -827,6 +873,12 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
 
     create_unimplemented_device("riscv.sifive.u.l2cc",
         memmap[SIFIVE_U_DEV_L2CC].base, memmap[SIFIVE_U_DEV_L2CC].size);
+
+    sysbus_realize(SYS_BUS_DEVICE(&s->spi0), errp);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi0), 0,
+                    memmap[SIFIVE_U_DEV_QSPI0].base);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi0), 0,
+                       qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_QSPI0_IRQ));
 }
 
 static Property sifive_u_soc_props[] = {
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index facb0cbacc..6330297b4e 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -52,9 +52,11 @@ config SIFIVE_U
     select SIFIVE_GPIO
     select SIFIVE_PDMA
     select SIFIVE_PLIC
+    select SIFIVE_SPI
     select SIFIVE_UART
     select SIFIVE_U_OTP
     select SIFIVE_U_PRCI
+    select SSI_M25P80
     select UNIMP
 
 config SPIKE
-- 
2.30.1


