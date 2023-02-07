Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB5568D3D3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 11:14:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPKuH-0000qW-Ud; Tue, 07 Feb 2023 05:08:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKu8-0000bP-Vr; Tue, 07 Feb 2023 05:08:49 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKu6-0002Uw-2z; Tue, 07 Feb 2023 05:08:48 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4P9zNq62vNz4xyf;
 Tue,  7 Feb 2023 21:08:43 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4P9zNn47TXz4xyB;
 Tue,  7 Feb 2023 21:08:41 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Subject: [PULL 19/25] hw/arm/aspeed_ast10x0: Add various unimplemented
 peripherals
Date: Tue,  7 Feb 2023 11:07:38 +0100
Message-Id: <20230207100744.698694-20-clg@kaod.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207100744.698694-1-clg@kaod.org>
References: <20230207100744.698694-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=a43c=6D=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Based on booting Zephyr demo from [1] running QEMU with
'-d unimp' and checking missing devices in [2].

[1] https://github.com/AspeedTech-BMC/zephyr/releases/tag/v00.01.07
[2] https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/dts/arm/aspeed/ast10x0.dtsi

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h | 11 +++++++++++
 hw/arm/aspeed_ast10x0.c     | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 8389200b2d..9a5e3c0bac 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -44,6 +44,7 @@
 #define ASPEED_CPUS_NUM  2
 #define ASPEED_MACS_NUM  4
 #define ASPEED_UARTS_NUM 13
+#define ASPEED_JTAG_NUM  2
 
 struct AspeedSoCState {
     /*< private >*/
@@ -87,6 +88,11 @@ struct AspeedSoCState {
     UnimplementedDeviceState video;
     UnimplementedDeviceState emmc_boot_controller;
     UnimplementedDeviceState dpmcu;
+    UnimplementedDeviceState pwm;
+    UnimplementedDeviceState espi;
+    UnimplementedDeviceState udc;
+    UnimplementedDeviceState sgpiom;
+    UnimplementedDeviceState jtag[ASPEED_JTAG_NUM];
 };
 
 #define TYPE_ASPEED_SOC "aspeed-soc"
@@ -174,6 +180,11 @@ enum {
     ASPEED_DEV_DPMCU,
     ASPEED_DEV_DP,
     ASPEED_DEV_I3C,
+    ASPEED_DEV_ESPI,
+    ASPEED_DEV_UDC,
+    ASPEED_DEV_SGPIOM,
+    ASPEED_DEV_JTAG0,
+    ASPEED_DEV_JTAG1,
 };
 
 qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index b483735dc2..b970a5ea58 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -27,10 +27,15 @@ static const hwaddr aspeed_soc_ast1030_memmap[] = {
     [ASPEED_DEV_FMC]       = 0x7E620000,
     [ASPEED_DEV_SPI1]      = 0x7E630000,
     [ASPEED_DEV_SPI2]      = 0x7E640000,
+    [ASPEED_DEV_UDC]       = 0x7E6A2000,
     [ASPEED_DEV_SCU]       = 0x7E6E2000,
+    [ASPEED_DEV_JTAG0]     = 0x7E6E4000,
+    [ASPEED_DEV_JTAG1]     = 0x7E6E4100,
     [ASPEED_DEV_ADC]       = 0x7E6E9000,
+    [ASPEED_DEV_ESPI]      = 0x7E6EE000,
     [ASPEED_DEV_SBC]       = 0x7E6F2000,
     [ASPEED_DEV_GPIO]      = 0x7E780000,
+    [ASPEED_DEV_SGPIOM]    = 0x7E780500,
     [ASPEED_DEV_TIMER1]    = 0x7E782000,
     [ASPEED_DEV_UART1]     = 0x7E783000,
     [ASPEED_DEV_UART2]     = 0x7E78D000,
@@ -78,12 +83,17 @@ static const int aspeed_soc_ast1030_irqmap[] = {
     [ASPEED_DEV_LPC]       = 35,
     [ASPEED_DEV_PECI]      = 38,
     [ASPEED_DEV_FMC]       = 39,
+    [ASPEED_DEV_ESPI]      = 42,
     [ASPEED_DEV_PWM]       = 44,
     [ASPEED_DEV_ADC]       = 46,
     [ASPEED_DEV_SPI1]      = 65,
     [ASPEED_DEV_SPI2]      = 66,
     [ASPEED_DEV_I2C]       = 110, /* 110 ~ 123 */
     [ASPEED_DEV_KCS]       = 138, /* 138 -> 142 */
+    [ASPEED_DEV_UDC]       = 9,
+    [ASPEED_DEV_SGPIOM]    = 51,
+    [ASPEED_DEV_JTAG0]     = 27,
+    [ASPEED_DEV_JTAG1]     = 53,
 };
 
 static qemu_irq aspeed_soc_ast1030_get_irq(AspeedSoCState *s, int dev)
@@ -154,6 +164,15 @@ static void aspeed_soc_ast1030_init(Object *obj)
     object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
     object_initialize_child(obj, "sbc-unimplemented", &s->sbc_unimplemented,
                             TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "pwm", &s->pwm, TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "espi", &s->espi, TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "udc", &s->udc, TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "sgpiom", &s->sgpiom,
+                            TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "jtag[0]", &s->jtag[0],
+                            TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "jtag[1]", &s->jtag[1],
+                            TYPE_UNIMPLEMENTED_DEVICE);
 }
 
 static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
@@ -336,6 +355,22 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
                     sc->memmap[ASPEED_DEV_GPIO]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_GPIO));
+
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->pwm), "aspeed.pwm",
+                                  sc->memmap[ASPEED_DEV_PWM], 0x100);
+
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->espi), "aspeed.espi",
+                                  sc->memmap[ASPEED_DEV_ESPI], 0x800);
+
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->udc), "aspeed.udc",
+                                  sc->memmap[ASPEED_DEV_UDC], 0x1000);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->sgpiom), "aspeed.sgpiom",
+                                  sc->memmap[ASPEED_DEV_SGPIOM], 0x100);
+
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->jtag[0]), "aspeed.jtag",
+                                  sc->memmap[ASPEED_DEV_JTAG0], 0x20);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->jtag[1]), "aspeed.jtag",
+                                  sc->memmap[ASPEED_DEV_JTAG1], 0x20);
 }
 
 static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
-- 
2.39.1


