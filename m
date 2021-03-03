Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C027A32B568
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 08:15:38 +0100 (CET)
Received: from localhost ([::1]:54108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHLjN-00026J-Ng
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 02:15:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lHLY8-00051r-65; Wed, 03 Mar 2021 02:04:00 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:45293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lHLY6-0007k0-F6; Wed, 03 Mar 2021 02:03:59 -0500
Received: by mail-pf1-x42b.google.com with SMTP id j12so15571265pfj.12;
 Tue, 02 Mar 2021 23:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MPvB8l9zZNaGwNbucMrgacMMV5We0Qj1yiiSvwQOauY=;
 b=fapApfn5IjcjeTUZCsL9dCt6CdOYTHFgyEGUgUqj2VJvfoRHtdbhAcLgkUbxLGaXFP
 Av1OpB5SBlyccXXgtF01hD30WYYFeUciZnHwugpAYYLLoZhQmzKg75GiGSeQXdnLDUSg
 i7yWd9+ZCI1mDVantjBwYhGKl/wNx8p37wBXN4TZafH9OKZHGmVfRP2MX9ji/I0oigcV
 BBm5dpL586rZFsK695B+HLburhO/w98przS7bcyoxAxZ5ILv7X9kCVy58I4as1TswzvJ
 i/b2bubsaplK8QAEX1eXVylrpjnDRj4kzAYbyujqweoSyF4FJtCHRw3TIu2lDIZqvYQr
 8YCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MPvB8l9zZNaGwNbucMrgacMMV5We0Qj1yiiSvwQOauY=;
 b=sLC9e1QHcRxj414u2231MJpVVGQrOHoPIoLmrjOsJQKa6BwZGJPRbmYvwlBMvSNROV
 XPjgLsmEI/Uz/tVAwEtRHa0pu7+31XadZjgf12pjZE43pP4dV4KOTh3MHDFofgUsq9tt
 UdXreBcVqUi000M50JGHv6chLFZL3CA3yZFo1TkbuMvilZkgT4tR1HB61nyNN4mOrKQ+
 DmtBq8FNvaH57gZKgtktGdsWziP0zTcHAOQP3A5w8NqvAVI62YG9syhpH4n6S9joYHeA
 oFXcvBLO3QLHssDAStIHNg/T4zKZSoJ+qUQrR32uifQ5CPQmuOyap+OLaF8O1czLzldT
 h8+g==
X-Gm-Message-State: AOAM532N31DrVV1JP2bdd/OD3jOWaxgdVv4SP3gYML/tVbP/je6/Pbf+
 oqY376y2ABDn1iyPmOu26AE=
X-Google-Smtp-Source: ABdhPJylUdOnTCMy+EVmOQNsc4AL5Pw2hVsrgzEkV0tfZ2+e8gvlRZHcGQmPCX4OvJHVQWosAibd8A==
X-Received: by 2002:a63:1452:: with SMTP id 18mr2596529pgu.269.1614755036934; 
 Tue, 02 Mar 2021 23:03:56 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id bb24sm5855703pjb.5.2021.03.02.23.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 23:03:55 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 2/2] aspeed: Integrate HACE
Date: Wed,  3 Mar 2021 17:33:31 +1030
Message-Id: <20210303070331.70744-3-joel@jms.id.au>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210303070331.70744-1-joel@jms.id.au>
References: <20210303070331.70744-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the hash and crypto engine model to the aspeed socs.

Signed-off-by: Joel Stanley <joel@jms.id.au>
[ clg: documentation update ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 docs/system/arm/aspeed.rst  |  2 +-
 include/hw/arm/aspeed_soc.h |  3 +++
 hw/arm/aspeed_ast2600.c     | 14 ++++++++++++++
 hw/arm/aspeed_soc.c         | 15 +++++++++++++++
 4 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 690bada7842b..ec30cad88a58 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -48,6 +48,7 @@ Supported devices
  * UART
  * Ethernet controllers
  * Front LEDs (PCA9552 on I2C bus)
+ * Hash/Crypto Engine (HACE) - SHA support only, no scatter-gather
 
 
 Missing devices
@@ -59,7 +60,6 @@ Missing devices
  * LPC Bus Controller
  * Slave GPIO Controller
  * Super I/O Controller
- * Hash/Crypto Engine
  * PCI-Express 1 Controller
  * Graphic Display Controller
  * PECI Controller
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 11cfe6e3585b..a8c9a22e5882 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -21,6 +21,7 @@
 #include "hw/rtc/aspeed_rtc.h"
 #include "hw/i2c/aspeed_i2c.h"
 #include "hw/ssi/aspeed_smc.h"
+#include "hw/misc/aspeed_hace.h"
 #include "hw/watchdog/wdt_aspeed.h"
 #include "hw/net/ftgmac100.h"
 #include "target/arm/cpu.h"
@@ -49,6 +50,7 @@ struct AspeedSoCState {
     AspeedTimerCtrlState timerctrl;
     AspeedI2CState i2c;
     AspeedSCUState scu;
+    AspeedHACEState hace;
     AspeedXDMAState xdma;
     AspeedSMCState fmc;
     AspeedSMCState spi[ASPEED_SPIS_NUM];
@@ -130,6 +132,7 @@ enum {
     ASPEED_DEV_SDRAM,
     ASPEED_DEV_XDMA,
     ASPEED_DEV_EMMC,
+    ASPEED_DEV_HACE,
 };
 
 #endif /* ASPEED_SOC_H */
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index bf31ca351feb..7aba3effd7bc 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -42,6 +42,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
     [ASPEED_DEV_ETH2]      = 0x1E680000,
     [ASPEED_DEV_ETH4]      = 0x1E690000,
     [ASPEED_DEV_VIC]       = 0x1E6C0000,
+    [ASPEED_DEV_HACE]      = 0x1E6D0000,
     [ASPEED_DEV_SDMC]      = 0x1E6E0000,
     [ASPEED_DEV_SCU]       = 0x1E6E2000,
     [ASPEED_DEV_XDMA]      = 0x1E6E7000,
@@ -102,6 +103,7 @@ static const int aspeed_soc_ast2600_irqmap[] = {
     [ASPEED_DEV_I2C]       = 110,   /* 110 -> 125 */
     [ASPEED_DEV_ETH1]      = 2,
     [ASPEED_DEV_ETH2]      = 3,
+    [ASPEED_DEV_HACE]      = 4,
     [ASPEED_DEV_ETH3]      = 32,
     [ASPEED_DEV_ETH4]      = 33,
 
@@ -211,6 +213,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
 
     object_initialize_child(obj, "emmc-controller.sdhci", &s->emmc.slots[0],
                             TYPE_SYSBUS_SDHCI);
+
+    object_initialize_child(obj, "hace", &s->hace, TYPE_ASPEED_HACE);
 }
 
 /*
@@ -469,6 +473,16 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->emmc), 0, sc->memmap[ASPEED_DEV_EMMC]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->emmc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_EMMC));
+
+    /* HACE */
+    object_property_set_link(OBJECT(&s->hace), "dram", OBJECT(s->dram_mr),
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->hace), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_HACE]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
 }
 
 static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 7eefd54ac07a..ce9b8f8c5d6f 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -34,6 +34,7 @@ static const hwaddr aspeed_soc_ast2400_memmap[] = {
     [ASPEED_DEV_VIC]    = 0x1E6C0000,
     [ASPEED_DEV_SDMC]   = 0x1E6E0000,
     [ASPEED_DEV_SCU]    = 0x1E6E2000,
+    [ASPEED_DEV_HACE]   = 0x1E6E3000,
     [ASPEED_DEV_XDMA]   = 0x1E6E7000,
     [ASPEED_DEV_VIDEO]  = 0x1E700000,
     [ASPEED_DEV_ADC]    = 0x1E6E9000,
@@ -65,6 +66,7 @@ static const hwaddr aspeed_soc_ast2500_memmap[] = {
     [ASPEED_DEV_VIC]    = 0x1E6C0000,
     [ASPEED_DEV_SDMC]   = 0x1E6E0000,
     [ASPEED_DEV_SCU]    = 0x1E6E2000,
+    [ASPEED_DEV_HACE]   = 0x1E6E3000,
     [ASPEED_DEV_XDMA]   = 0x1E6E7000,
     [ASPEED_DEV_ADC]    = 0x1E6E9000,
     [ASPEED_DEV_VIDEO]  = 0x1E700000,
@@ -118,6 +120,7 @@ static const int aspeed_soc_ast2400_irqmap[] = {
     [ASPEED_DEV_ETH2]   = 3,
     [ASPEED_DEV_XDMA]   = 6,
     [ASPEED_DEV_SDHCI]  = 26,
+    [ASPEED_DEV_HACE]   = 4,
 };
 
 #define aspeed_soc_ast2500_irqmap aspeed_soc_ast2400_irqmap
@@ -211,6 +214,8 @@ static void aspeed_soc_init(Object *obj)
         object_initialize_child(obj, "sdhci[*]", &s->sdhci.slots[i],
                                 TYPE_SYSBUS_SDHCI);
     }
+
+    object_initialize_child(obj, "hace", &s->hace, TYPE_ASPEED_HACE);
 }
 
 static void aspeed_soc_realize(DeviceState *dev, Error **errp)
@@ -393,6 +398,16 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
                     sc->memmap[ASPEED_DEV_SDHCI]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_SDHCI));
+
+    /* HACE */
+    object_property_set_link(OBJECT(&s->hace), "dram", OBJECT(s->dram_mr),
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->hace), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_HACE]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
 }
 static Property aspeed_soc_properties[] = {
     DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION,
-- 
2.30.1


