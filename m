Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA4D31E438
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 03:08:33 +0100 (CET)
Received: from localhost ([::1]:52362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCYk4-0006jv-6z
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 21:08:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYbz-0006WQ-Ip
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:11 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:40590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYbv-0008KW-Ai
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1613613608; x=1645149608;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nf3encxrLUYOC83jW2+99MqD6SE1AQ3VJwRyApkOp9o=;
 b=kNcoRaAB6sH2TnARWi6snd4sypQdiIP5yu++kVNbxadR1V95d3sKzjaj
 M+a9XcRuq6mcGmv3cmS0mSAFYhgLdS+4smo9tAMJrhb3/u4VbswyqdJ9/
 8+fY3WGQJowCJ8hmexMiTafeKTfs6/ld3MoJe+puoeAZV9QbiiQ5jDlAk
 WqqchuZmxTDTTSggZOvTXqi41pzEnzfjK3RTDgDXZ9BFyKgDFBIw61A1b
 CXdJxAJsEfvWqh0hH//lob8PCMKUo2Bsi2E50Y/b/1/f0YpN8Uzr97Oc5
 3Zu9wWlSYddpnH6HEKFeFZA+0Sa1JxPav75lxCVmBYfmo83sYQiFbA//I w==;
IronPort-SDR: q2TyJuPw58BA+HP+v19bMBiWVeWpC0SZKSVXgO7q5oqluQ8JWDAXFt3KK0GIyerefGEzGoXulY
 UZYUb1oCYUzzwE6GkNoERenu1ByMGBfuU7uUSTo2nzmyCdYrt0qLHqd93fszRa5b9FwsmZtnwQ
 VRyR4hy5peIf584RAUX7mOUxWXPjJS68LQjqnl9bPUo8Fo51AJUMyKUlYc7G/ytZy1eLyL/lyz
 1gqcKPJHQDvDEQ+YIpZAuaxyWaEAFXqqC8Knb6WB/ZsoN1t1NUUKGt25+E5t0oe6IOXiFVAjIf
 /Rc=
X-IronPort-AV: E=Sophos;i="5.81,185,1610380800"; d="scan'208";a="161392127"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Feb 2021 09:59:59 +0800
IronPort-SDR: Se01Ku9wQXj7JqbhxFHBRE/28jJVmMXPfBr6tWTtsWjEl7GwOqC9WjMkuXyRbluezZqi/35tn0
 PEvhuVCSFEWxjVMqBE0PVUOybvRZhrv/Q/T3uwJFmZ1XfF6ql9rjjfxLlDNmcDAKPHxUtE6Y3n
 DOphxZrflgsntj2RVTmW35X0Mnen0jhRVSJ2xFsP+kp1KA13D9oFX7+/3GHosS6e5xWsmhQQA3
 ceiNv3x5Ki9H63JImSYg3nxhI/utcJNZqiHtYkMvwZiSnXh1Vw/fsVLOh9bQCtZZ3jS5R7dO+d
 U77SuAn23AQl6Iltg6L7ICb/
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 17:43:29 -0800
IronPort-SDR: gqad62vyFBfZHQsZHmdg/JyUxCuhkI04z1zlLE02x404wdb/NNP+S0MYvAmB6qAroxlE0mDEDg
 +yKGTX4SXhCiANh8xF6GSvKOBTGmlGl7eL7ILtXX7UfY+iZ6QBQwWeEBxWeeDvcza4W6Z1HGki
 Tey/XetW3GXn8a4nIulkfvrbyrdcP4MNchiJ6F0D1kO0X5MmAtA9b0w751TUFAdtdKEqhbwVgz
 Un3n49A3tVGgtSBIy8nCTRAys0LHA1cjeIARI7nZglJ50yQobCXsc5HwUiQyPUYexf0FIGCcp8
 nJ8=
WDCIronportException: Internal
Received: from cn57xfd72.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.43])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Feb 2021 17:59:59 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 08/19] hw/riscv: sifive_u: Add QSPI0 controller and connect a
 flash
Date: Wed, 17 Feb 2021 17:59:23 -0800
Message-Id: <20210218015934.1623959-9-alistair.francis@wdc.com>
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
2.30.0


