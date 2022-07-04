Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AF8565F4B
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 00:01:36 +0200 (CEST)
Received: from localhost ([::1]:50926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8U8N-0004Ow-BU
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 18:01:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8U26-0003as-84; Mon, 04 Jul 2022 17:55:06 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:50285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8U24-0000FH-6H; Mon, 04 Jul 2022 17:55:05 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 57B34580FDB;
 Mon,  4 Jul 2022 17:55:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 04 Jul 2022 17:55:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656971703; x=1656975303; bh=VS
 1KQYXXFvLzCmZIqWAf4o9ftLi+4f6o/PgwWZUCRtE=; b=FaVG0Xbg5GWUKyxO9r
 BV89jd5hUvBxw81bIUF/QxzUaJimYjdDG1rNMBJKvb/lH5NN3x3yq4WpQc+2E2Sx
 N8vBEuXIhlJKpzKUVzQ+PxgUAL1Kkn+Iylj6ZO/5x7yEg6RDuTd7EfYD7xfZBhHz
 nTM5SqJTI8rqL6WwvNsv5dYIQwkSUvErC8/zDNHuIcDVc5fwcK7WxEUszzVBGO+C
 s3z8mtxd1FblDg/NFu2PGCFb4KpHn2hUYUhJ4g/FNiiE+LbI3qjQm4lrHPRCRJeF
 +JxtnSp4odRrsCyJZk2pLQ1+8Gnw9qOzsyH67x1/Ry9LS8xgi9dDYV+e/9CuPa43
 0B0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1656971703; x=1656975303; bh=VS1
 KQYXXFvLzCmZIqWAf4o9ftLi+4f6o/PgwWZUCRtE=; b=VbPaobWnT1Hm/cjoQYP
 0UCd7VmYK3PWxpceIAy5dRHpvh3UhMq5aumKfMyon7j4KtPDYHUQcsPjaZaLeWy6
 GHoYfOnrWBZ8jWDZ3kGdDsTNDbbPxmQxHuNYFR2nZjFOz8SUS2GAjhwgDIVPImAY
 vYBRzxizjmz021kwD5RzKzvzel2EPnefTkV8pxDmCNqduYMxgEw/zUsQO8D2tzaT
 29S0OkOe2cmQIS98qMB7S7yYvF4UyfCp4+n44Bw6EuDVBMfoO1ymFIewp8JB7XDb
 p77PAMgA2DZCIVeWGxGKfyFipn0XAEQIPS8lMYbiAzfkvh5jUHv9kzjeRfk4Xog8
 pNw==
X-ME-Sender: <xms:tmHDYk3Ia66XfyJB4f_1CInwQAdQmGr93neEVeiyKRMH_B2W7lwEcQ>
 <xme:tmHDYvGSy867RNNoVBnm7_SrXX7x0AhBoSP3N6Z9rb5NClsJi3ClIy6rPsFuVl9ZA
 GhwLarzJLZPiZ7R0nM>
X-ME-Received: <xmr:tmHDYs5uPl4BxohX4-swrOHFLqvQM9ozN_Gjw8PXmLrApRm_rT41g_usKFndqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeitddgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 hmihhsshhinhhgucfvqfcufhhivghlugculdeftddmnegoteeftdduqddtudculdduhedm
 necujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgvth
 gvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrfgr
 thhtvghrnhepvdfghffgkeehheeggeeuvdeftefhieefleffgfeuveduueeigfffffdvje
 evfeelnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:t2HDYt2t7UYKxkZIKg6sxFdRQSsWg4DlwtT1mNWTcTkbpTZ0J6ks6g>
 <xmx:t2HDYnFZZ-eGXXLIEmitHNOSUdwMpIXjVfRVsxIA4Q2bdyu_h-TnqA>
 <xmx:t2HDYm83b1SI9RT8IIZfeyXtWhp8t_3ealkVhSW8q8FLcdgyWK8mTQ>
 <xmx:t2HDYoNIsQq4DfGBKdfHbkLhYQpGcEbhVcSpdrYcd0d3VIXrG4GBxg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Jul 2022 17:55:02 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 3/8] aspeed: Refactor UART init for multi-SoC machines
Date: Mon,  4 Jul 2022 14:54:52 -0700
Message-Id: <20220704215457.38332-3-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220704215457.38332-1-peter@pjd.dev>
References: <20220704215457.38332-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.224; envelope-from=peter@pjd.dev;
 helo=new2-smtp.messagingengine.com
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
Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/arm/aspeed.c             | 22 +++++++++++++---
 hw/arm/aspeed_ast10x0.c     |  8 +++++-
 hw/arm/aspeed_ast2600.c     |  8 +++++-
 hw/arm/aspeed_soc.c         | 50 +++++++++++++++++++++++++------------
 include/hw/arm/aspeed_soc.h |  7 ++++--
 5 files changed, 71 insertions(+), 24 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index bee8a748ec..cc395f988c 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -26,6 +26,7 @@
 #include "qemu/error-report.h"
 #include "qemu/units.h"
 #include "hw/qdev-clock.h"
+#include "sysemu/sysemu.h"
 
 static struct arm_boot_info aspeed_board_binfo = {
     .board_id = -1, /* device-tree-only board */
@@ -301,6 +302,21 @@ static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo)
                                &error_fatal);
 }
 
+static void connect_serial_hds_to_uarts(AspeedMachineState *bmc)
+{
+    AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(bmc);
+    AspeedSoCState *s = &bmc->soc;
+    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
+
+    aspeed_soc_uart_set_chr(s, amc->uart_default, serial_hd(0));
+    for (int i = 1, uart = ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart++) {
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
@@ -346,8 +362,7 @@ static void aspeed_machine_init(MachineState *machine)
         object_property_set_int(OBJECT(&bmc->soc), "hw-prot-key",
                                 ASPEED_SCU_PROT_KEY, &error_abort);
     }
-    qdev_prop_set_uint32(DEVICE(&bmc->soc), "uart-default",
-                         amc->uart_default);
+    connect_serial_hds_to_uarts(bmc);
     qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
 
     aspeed_board_init_flashes(&bmc->soc.fmc,
@@ -1372,8 +1387,7 @@ static void aspeed_minibmc_machine_init(MachineState *machine)
 
     object_property_set_link(OBJECT(&bmc->soc), "memory",
                              OBJECT(get_system_memory()), &error_abort);
-    qdev_prop_set_uint32(DEVICE(&bmc->soc), "uart-default",
-                         amc->uart_default);
+    connect_serial_hds_to_uarts(bmc);
     qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
 
     aspeed_board_init_flashes(&bmc->soc.fmc,
diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 677699e54c..4d0b9b115f 100644
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
 
@@ -255,7 +259,9 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
                                 sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_4));
 
     /* UART */
-    aspeed_soc_uart_init(s);
+    if (!aspeed_soc_uart_realize(s, errp)) {
+        return;
+    }
 
     /* Timer */
     object_property_set_link(OBJECT(&s->timerctrl), "scu", OBJECT(&s->scu),
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 64eb5a7b26..aa2cd90bec 100644
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
 
@@ -386,7 +390,9 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
                        aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
 
     /* UART */
-    aspeed_soc_uart_init(s);
+    if (!aspeed_soc_uart_realize(s, errp)) {
+        return;
+    }
 
     /* I2C */
     object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 0bb6a2f092..b05b9dd416 100644
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
 
@@ -315,7 +319,9 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
                        aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
 
     /* UART */
-    aspeed_soc_uart_init(s);
+    if (!aspeed_soc_uart_realize(s, errp)) {
+        return;
+    }
 
     /* I2C */
     object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
@@ -482,8 +488,6 @@ static Property aspeed_soc_properties[] = {
                      MemoryRegion *),
     DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION,
                      MemoryRegion *),
-    DEFINE_PROP_UINT32("uart-default", AspeedSoCState, uart_default,
-                       ASPEED_DEV_UART5),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -573,23 +577,37 @@ qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev)
     return ASPEED_SOC_GET_CLASS(s)->get_irq(s, dev);
 }
 
-void aspeed_soc_uart_init(AspeedSoCState *s)
+bool aspeed_soc_uart_realize(AspeedSoCState *s, Error **errp)
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
+    SerialMM *smm;
+
+    for (int i = 0, uart = ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart++) {
+        smm = &s->uart[i];
+
+        /* Chardev property is set by the machine. */
+        qdev_prop_set_uint8(DEVICE(smm), "regshift", 2);
+        qdev_prop_set_uint32(DEVICE(smm), "baudbase", 38400);
+        qdev_set_legacy_instance_id(DEVICE(smm), sc->memmap[uart], 2);
+        qdev_prop_set_uint8(DEVICE(smm), "endianness", DEVICE_LITTLE_ENDIAN);
+        if (!sysbus_realize(SYS_BUS_DEVICE(smm), errp)) {
+            return false;
         }
-        serial_mm_init(s->memory, sc->memmap[uart], 2,
-                       aspeed_soc_get_irq(s, uart), 38400,
-                       serial_hd(i), DEVICE_LITTLE_ENDIAN);
+
+        sysbus_connect_irq(SYS_BUS_DEVICE(smm), 0, aspeed_soc_get_irq(s, uart));
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(smm), 0, sc->memmap[uart]);
     }
+
+    return true;
+}
+
+void aspeed_soc_uart_set_chr(AspeedSoCState *s, int dev, Chardev *chr)
+{
+    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
+    int i = dev - ASPEED_DEV_UART1;
+
+    g_assert(0 <= i && i < ARRAY_SIZE(s->uart) && i < sc->uarts_num);
+    qdev_prop_set_chr(DEVICE(&s->uart[i]), "chardev", chr);
 }
 
 /*
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index e65926a667..68e907cd64 100644
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
@@ -175,7 +177,8 @@ enum {
 };
 
 qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
-void aspeed_soc_uart_init(AspeedSoCState *s);
+bool aspeed_soc_uart_realize(AspeedSoCState *s, Error **errp);
+void aspeed_soc_uart_set_chr(AspeedSoCState *s, int dev, Chardev *chr);
 bool aspeed_soc_dram_init(AspeedSoCState *s, Error **errp);
 void aspeed_mmio_map(AspeedSoCState *s, SysBusDevice *dev, int n, hwaddr addr);
 void aspeed_mmio_map_unimplemented(AspeedSoCState *s, SysBusDevice *dev,
-- 
2.37.0


