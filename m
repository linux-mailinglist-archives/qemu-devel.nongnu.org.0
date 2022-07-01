Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D19563A50
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 22:04:50 +0200 (CEST)
Received: from localhost ([::1]:40456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7Msj-0007dK-3v
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 16:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o7Mqk-00063p-Du; Fri, 01 Jul 2022 16:02:46 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:40695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o7Mqd-00024o-JI; Fri, 01 Jul 2022 16:02:46 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 7FA102B0590C;
 Fri,  1 Jul 2022 16:02:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 01 Jul 2022 16:02:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1656705757; x=1656709357; bh=B21lQZcIVi0tGVl6aWxJo+B+C
 u462FDA8qCuxST6xkI=; b=5xNTEbx1H+ahsm77pmQ8R1QNCRgXFOqb+0aJTC3qm
 T/9fahdtbCDkDcRNecY4bvYLiu3z0BKtv9etLpM46eLELzijqLGl0H5RD1iSpwP8
 eRcr91356swnXrRMC99ZFx3sywjsE3v+qC+6T5YoI4veTZoxuSJJ2VSHyalSzm5N
 kNwAmPUmyiFSZFR+S4JRYCH9ugOiSfJT2f+QIwlMgv7aSsoH72Xp+BFfWRJAeH73
 TFmCNnIdH+sn1+H/arO6CqHqnid0jK60Eask9KAa5KSxpfLM6hA3X74x8LDBCWO9
 Yye3FkWM2mpaOz+EA6nwAR+i8Nw9HmdVYT3Qtg/r6lshg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=i9e814621.fm2;
 t=1656705757; x=1656709357; bh=B21lQZcIVi0tGVl6aWxJo+B+Cu462FDA
 8qCuxST6xkI=; b=n8N5tYieYXzW+VQRLcUDjDFulLEaE4Zl0IB8ouRXoWurO8rJ
 ZuEhx+phwHaLY4LWdWWH6n7/dQNH5tCnaJ4yCwFZ32qtdwchTDHrTSiObL8lDCco
 klCAkBwPe4iuJGdKIl4IitiKfq1aa6qOHQhTZ7GkR8tPBgDzgW7WMQBwpv7Q6JIt
 xxEvlr2JLU9u8qiLO686MR1/wDAd4KrdFl9YMIJFgi4szOS0/fHdTYhuQSvlWPSz
 JFOxpKW7BTubbvq/eAqiUsj1rD9cGa+kuQ+AamWqDzi7d2mhWVo9DJxaGtTB+/Wc
 sLekqmLxm+AlLN6y3h4Lq4aG2OKYC/aIxJ7K/A==
X-ME-Sender: <xms:3FK_Yktz8z3z_lJDhAU47uKzBgT6Fv_seWBBHB3klVSL3jqouAMpnQ>
 <xme:3FK_YheVV7VGX1Cv-t0Q-L3elGRNivuEaYvkT6viM8z2_oYb-eBVYZkLkalpBYnGZ
 kkrrb3Y6NFHNQfyXq4>
X-ME-Received: <xmr:3FK_Yvx80UBzmwbFNs-R0WdMK6c2nzuq1DxW88JYWKbB5e9U6x2pXPQ8jNKuelJRAR9QZWJ2-eIQFiyAh6bkRsw0CP_VdsGL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehfedgudeggecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecumhhishhsihhnghcuvffquchfihgvlhguucdlfe
 dtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehmvgesphhjugdruggvvheqnecuggftrfgrthhtvg
 hrnhepieeuteejhfffheevteelleegjefhtdevgeevfedulefhieekfedtuddujeegfedv
 necuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmvgesphhjugdruggvvh
X-ME-Proxy: <xmx:3FK_YnMLsNRVj1mzE8SnBJHr53aE9IzVsLN2rIdZqom4PrKH2uprqQ>
 <xmx:3FK_Yk_2hT1VLJlreEAzhjDaeXOm8D8DPb1NAfY7LzGvHudXX-Wzbg>
 <xmx:3FK_YvV1D6Hg2H_dpYO0qx_f4OtrSxZYLb3C9GFu3vwLvPhm0gpLFg>
 <xmx:3FK_YoYbyOx_juwVGuIZV4FNxqWsIdEehEEFH39WJzRxP9GxvSgvQ0JEBWs>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Jul 2022 16:02:36 -0400 (EDT)
From: Peter Delevoryas <me@pjd.dev>
To: 
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, joel@jms.id.au,
 andrew@aj.id.au, peter.maydell@linaro.org, clg@kaod.org
Subject: [PATCH v2] aspeed: Refactor UART init for multi-SoC machines
Date: Fri,  1 Jul 2022 13:02:34 -0700
Message-Id: <20220701200234.68289-1-me@pjd.dev>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18; envelope-from=me@pjd.dev;
 helo=wnew4-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

This change moves the code that connects the SoC UART's to serial_hd's
to the machine.

It makes each UART a proper child member of the SoC, and then allows the
machine to selectively initialize the chardev for each UART with a
serial_hd.

This should preserve backwards compatibility, but also allow multi-SoC
boards to completely change the wiring of serial devices from the
command line to specific SoC UART's.

This also removes the uart-default property from the SoC, since the SoC
doesn't need to know what UART is the "default" on the machine anymore.

I tested this using the images and commands from the previous
refactoring, and another test image for the ast1030:

    wget https://github.com/facebook/openbmc/releases/download/v2021.49.0/fuji.mtd
    wget https://github.com/facebook/openbmc/releases/download/v2021.49.0/wedge100.mtd
    wget https://github.com/peterdelevoryas/OpenBIC/releases/download/oby35-cl-2022.13.01/Y35BCL.elf

Fuji uses UART1:

    qemu-system-arm -machine fuji-bmc \
        -drive file=fuji.mtd,format=raw,if=mtd \
        -nographic

ast2600-evb uses uart-default=UART5:

    qemu-system-arm -machine ast2600-evb \
        -drive file=fuji.mtd,format=raw,if=mtd \
        -serial null -serial mon:stdio -display none

Wedge100 uses UART3:

    qemu-system-arm -machine palmetto-bmc \
        -drive file=wedge100.mtd,format=raw,if=mtd \
        -serial null -serial null -serial null \
        -serial mon:stdio -display none

AST1030 EVB uses UART5:

    qemu-system-arm -machine ast1030-evb \
        -kernel Y35BCL.elf -nographic

Fixes: 6827ff20b2975 ("hw: aspeed: Init all UART's with serial devices")
Signed-off-by: Peter Delevoryas <me@pjd.dev>
---
 hw/arm/aspeed.c             | 23 +++++++++++++++----
 hw/arm/aspeed_ast10x0.c     |  4 ++++
 hw/arm/aspeed_ast2600.c     |  4 ++++
 hw/arm/aspeed_soc.c         | 44 ++++++++++++++++++++++++-------------
 include/hw/arm/aspeed_soc.h |  5 ++++-
 5 files changed, 60 insertions(+), 20 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 6fe9b13548..fdca0abd95 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -26,6 +26,7 @@
 #include "qemu/error-report.h"
 #include "qemu/units.h"
 #include "hw/qdev-clock.h"
+#include "sysemu/sysemu.h"
 
 static struct arm_boot_info aspeed_board_binfo = {
     .board_id = -1, /* device-tree-only board */
@@ -301,6 +302,22 @@ static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo)
                                &error_fatal);
 }
 
+static void connect_serial_hds_to_uarts(AspeedMachineState *bmc)
+{
+    AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(bmc);
+    AspeedSoCState *s = &bmc->soc;
+
+    aspeed_soc_uart_set_chr(s, amc->uart_default, serial_hd(0));
+    for (int i = 1, uart = ASPEED_DEV_UART1;
+         serial_hd(i) && uart <= ASPEED_DEV_UART13; i++, uart++) {
+
+        if (uart == amc->uart_default) {
+            continue;
+        }
+        aspeed_soc_uart_set_chr(s, uart, serial_hd(i));
+    }
+}
+
 static void aspeed_machine_init(MachineState *machine)
 {
     AspeedMachineState *bmc = ASPEED_MACHINE(machine);
@@ -346,8 +363,7 @@ static void aspeed_machine_init(MachineState *machine)
         object_property_set_int(OBJECT(&bmc->soc), "hw-prot-key",
                                 ASPEED_SCU_PROT_KEY, &error_abort);
     }
-    qdev_prop_set_uint32(DEVICE(&bmc->soc), "uart-default",
-                         amc->uart_default);
+    connect_serial_hds_to_uarts(bmc);
     qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
 
     aspeed_board_init_flashes(&bmc->soc.fmc,
@@ -1383,8 +1399,7 @@ static void aspeed_minibmc_machine_init(MachineState *machine)
 
     object_property_set_link(OBJECT(&bmc->soc), "memory",
                              OBJECT(get_system_memory()), &error_abort);
-    qdev_prop_set_uint32(DEVICE(&bmc->soc), "uart-default",
-                         amc->uart_default);
+    connect_serial_hds_to_uarts(bmc);
     qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
 
     aspeed_board_init_flashes(&bmc->soc.fmc,
diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 33ef331771..a221f5d6fe 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -144,6 +144,10 @@ static void aspeed_soc_ast1030_init(Object *obj)
         object_initialize_child(obj, "wdt[*]", &s->wdt[i], typename);
     }
 
+    for (i = 0; i < sc->uarts_num; i++) {
+        object_initialize_child(obj, "uart[*]", &s->uart[i], TYPE_SERIAL_MM);
+    }
+
     snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
     object_initialize_child(obj, "gpio", &s->gpio, typename);
 
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 3f0611ac11..c4ad26a046 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -214,6 +214,10 @@ static void aspeed_soc_ast2600_init(Object *obj)
         object_initialize_child(obj, "mii[*]", &s->mii[i], TYPE_ASPEED_MII);
     }
 
+    for (i = 0; i < sc->uarts_num; i++) {
+        object_initialize_child(obj, "uart[*]", &s->uart[i], TYPE_SERIAL_MM);
+    }
+
     snprintf(typename, sizeof(typename), TYPE_ASPEED_XDMA "-%s", socname);
     object_initialize_child(obj, "xdma", &s->xdma, typename);
 
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 0f675e7fcd..2ac18cbf27 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -208,6 +208,10 @@ static void aspeed_soc_init(Object *obj)
                                 TYPE_FTGMAC100);
     }
 
+    for (i = 0; i < sc->uarts_num; i++) {
+        object_initialize_child(obj, "uart[*]", &s->uart[i], TYPE_SERIAL_MM);
+    }
+
     snprintf(typename, sizeof(typename), TYPE_ASPEED_XDMA "-%s", socname);
     object_initialize_child(obj, "xdma", &s->xdma, typename);
 
@@ -481,8 +485,6 @@ static Property aspeed_soc_properties[] = {
                      MemoryRegion *),
     DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION,
                      MemoryRegion *),
-    DEFINE_PROP_UINT32("uart-default", AspeedSoCState, uart_default,
-                       ASPEED_DEV_UART5),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -575,22 +577,34 @@ qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev)
 void aspeed_soc_uart_init(AspeedSoCState *s)
 {
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
-    int i, uart;
-
-    /* Attach an 8250 to the IO space as our UART */
-    serial_mm_init(s->memory, sc->memmap[s->uart_default], 2,
-                   aspeed_soc_get_irq(s, s->uart_default), 38400,
-                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
-    for (i = 1, uart = ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart++) {
-        if (uart == s->uart_default) {
-            uart++;
-        }
-        serial_mm_init(s->memory, sc->memmap[uart], 2,
-                       aspeed_soc_get_irq(s, uart), 38400,
-                       serial_hd(i), DEVICE_LITTLE_ENDIAN);
+    SerialMM *smm;
+    MemoryRegion *mr;
+
+    for (int i = 0, uart = ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart++) {
+        smm = &s->uart[i];
+
+        /* Chardev property is set by the machine. */
+        qdev_prop_set_uint8(DEVICE(smm), "regshift", 2);
+        qdev_prop_set_uint32(DEVICE(smm), "baudbase", 38400);
+        qdev_set_legacy_instance_id(DEVICE(smm), sc->memmap[uart], 2);
+        qdev_prop_set_uint8(DEVICE(smm), "endianness", DEVICE_LITTLE_ENDIAN);
+        sysbus_realize(SYS_BUS_DEVICE(smm), &error_fatal);
+
+        sysbus_connect_irq(SYS_BUS_DEVICE(smm), 0, aspeed_soc_get_irq(s, uart));
+        mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(smm), 0);
+        memory_region_add_subregion(s->memory, sc->memmap[uart], mr);
     }
 }
 
+void aspeed_soc_uart_set_chr(AspeedSoCState *s, int dev, Chardev *chr)
+{
+    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
+    int i = dev - ASPEED_DEV_UART1;
+
+    g_assert(0 <= i && i < ARRAY_SIZE(s->uart) && i < sc->uarts_num);
+    qdev_prop_set_chr(DEVICE(&s->uart[i]), "chardev", chr);
+}
+
 /*
  * SDMC should be realized first to get correct RAM size and max size
  * values
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index e65926a667..60ee0a84db 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -36,12 +36,14 @@
 #include "hw/misc/aspeed_lpc.h"
 #include "hw/misc/unimp.h"
 #include "hw/misc/aspeed_peci.h"
+#include "hw/char/serial.h"
 
 #define ASPEED_SPIS_NUM  2
 #define ASPEED_EHCIS_NUM 2
 #define ASPEED_WDTS_NUM  4
 #define ASPEED_CPUS_NUM  2
 #define ASPEED_MACS_NUM  4
+#define ASPEED_UARTS_NUM 13
 
 struct AspeedSoCState {
     /*< private >*/
@@ -79,7 +81,7 @@ struct AspeedSoCState {
     AspeedSDHCIState emmc;
     AspeedLPCState lpc;
     AspeedPECIState peci;
-    uint32_t uart_default;
+    SerialMM uart[ASPEED_UARTS_NUM];
     Clock *sysclk;
     UnimplementedDeviceState iomem;
     UnimplementedDeviceState video;
@@ -176,6 +178,7 @@ enum {
 
 qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
 void aspeed_soc_uart_init(AspeedSoCState *s);
+void aspeed_soc_uart_set_chr(AspeedSoCState *s, int dev, Chardev *chr);
 bool aspeed_soc_dram_init(AspeedSoCState *s, Error **errp);
 void aspeed_mmio_map(AspeedSoCState *s, SysBusDevice *dev, int n, hwaddr addr);
 void aspeed_mmio_map_unimplemented(AspeedSoCState *s, SysBusDevice *dev,
-- 
2.37.0


