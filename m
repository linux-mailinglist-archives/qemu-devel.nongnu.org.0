Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E62D619FC20
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Apr 2020 19:57:14 +0200 (CEST)
Received: from localhost ([::1]:36032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLVzl-0001PZ-UI
	for lists+qemu-devel@lfdr.de; Mon, 06 Apr 2020 13:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36068)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVqz-0001qt-Gw
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:48:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVqw-0002Kt-Uu
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:48:09 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:40005)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVqw-0002Ej-NY; Mon, 06 Apr 2020 13:48:06 -0400
Received: by mail-wr1-x443.google.com with SMTP id s8so486238wrt.7;
 Mon, 06 Apr 2020 10:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4j3n0ZN8lrQk9Ox5ZI487lTmFghYMiP7ZCOjQ+gtTO0=;
 b=SpohpnJ0y3OSsXtDpDfzxhrbMiciM6SWsR0qVRmJ4NXnMZ+mIIkT342I+pwRMIbGMi
 s0OWe+ECY8pRRj48PMt5br2rxW0pW/P60MUiVrm9lp3OQ4M/I8BphDXLZfbnaK4OiGD+
 74S27b37UyzkifDE0iDjQIPulAzACig9+qUPbyTbAK0hT5ONCwm88cxIC5sO7dyRAFJS
 a6bOTYEqtgpr4gegBcYPdYUX+BJrGHZJfoZuLjZJoIONAc8lRuB4P6Yq0lpD4e+lYO5X
 nFzQ1uTQJoalTj9zBVsysdRIbaz2eB3NjBguPo/+giR80g0ngGPg7N8f7oodRy3MWIn2
 VhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4j3n0ZN8lrQk9Ox5ZI487lTmFghYMiP7ZCOjQ+gtTO0=;
 b=YuQri13q8P3mRYVfPyUQ2FVjoQyf7asmg0vwkRGCM5m1XxSetI9CWcp02t8Ipv+9Ic
 N3Roc21pfJ5zswB8XVGqHCQ0xNy5E/V+BAYlG2+PwV4j+FmUQOE6abSBlli0nkJHV59r
 bTQ3XsUxbnc6PwtxIxD4W7EG017gX1w2gtxkHUlPX5seXoNSjQdGUzvLn5IN4wUuxq9y
 /kYnZzCPD1ozi2wYtKRKk+rCrLlJPWHAas/H2B/1TzEK9+E3qJPy+W6PlupxpFkysEwe
 mKMlyscnkof/BO3v/hatW497AjrGKJhmYyRprpKcMxGnKzQXZv9+Xt/GGxFDtFpYX3ja
 l6Uw==
X-Gm-Message-State: AGi0Puad0dG3t22Gn50oJo1Q8cYzd9zD6iteVmHqilVqMAbaLuxl0Aex
 u+jp4B6gCOMms4OvoP2VZDdkmq3e5XM=
X-Google-Smtp-Source: APiQypJ30jCeADQZJ2A40sg1vjO5vcrmt1++Wyu2LnDGVX65JNEIdaHuG0UhlCvkCviVfz2vrgV+jQ==
X-Received: by 2002:adf:a347:: with SMTP id d7mr349706wrb.21.1586195285428;
 Mon, 06 Apr 2020 10:48:05 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id a67sm364880wmc.30.2020.04.06.10.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 10:48:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH-for-5.1 v2 14/54] hw/arm/xlnx-zynqmp: Use single
 propagate_error() call
Date: Mon,  6 Apr 2020 19:47:03 +0200
Message-Id: <20200406174743.16956-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406174743.16956-1-f4bug@amsat.org>
References: <20200406174743.16956-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "open list:Xilinx ZynqMP" <qemu-arm@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coccinelle failed at processing this file:

  $ spatch ... --timeout 60 --sp-file \
    scripts/coccinelle/simplify-init-realize-error_propagate.cocci
  HANDLING: ./hw/arm/xlnx-zynqmp.c
  EXN: Coccinelle_modules.Common.Timeout

We are going to manually add the missing propagate_error() calls.
As there are many Error* calls used, simplify by using an unique
call to propagate_error().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/xlnx-zynqmp.c | 61 +++++++++++++++++---------------------------
 1 file changed, 23 insertions(+), 38 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index b84d153d56..43d57fa7de 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -385,15 +385,13 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         object_property_set_bool(OBJECT(&s->apu_cpu[i]), true, "realized",
                                  &err);
         if (err) {
-            error_propagate(errp, err);
-            return;
+            goto out_propagate_error;
         }
     }
 
     object_property_set_bool(OBJECT(&s->gic), true, "realized", &err);
     if (err) {
-        error_propagate(errp, err);
-        return;
+        goto out_propagate_error;
     }
 
     assert(ARRAY_SIZE(xlnx_zynqmp_gic_regions) == XLNX_ZYNQMP_GIC_REGIONS);
@@ -462,8 +460,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
     xlnx_zynqmp_create_rpu(ms, s, boot_cpu, &err);
     if (err) {
-        error_propagate(errp, err);
-        return;
+        goto out_propagate_error;
     }
 
     if (!s->boot_cpu_ptr) {
@@ -488,8 +485,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
                                 &error_abort);
         object_property_set_bool(OBJECT(&s->gem[i]), true, "realized", &err);
         if (err) {
-            error_propagate(errp, err);
-            return;
+            goto out_propagate_error;
         }
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->gem[i]), 0, gem_addr[i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gem[i]), 0,
@@ -500,8 +496,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         qdev_prop_set_chr(DEVICE(&s->uart[i]), "chardev", serial_hd(i));
         object_property_set_bool(OBJECT(&s->uart[i]), true, "realized", &err);
         if (err) {
-            error_propagate(errp, err);
-            return;
+            goto out_propagate_error;
         }
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->uart[i]), 0, uart_addr[i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart[i]), 0,
@@ -512,8 +507,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
                             &error_abort);
     object_property_set_bool(OBJECT(&s->sata), true, "realized", &err);
     if (err) {
-        error_propagate(errp, err);
-        return;
+        goto out_propagate_error;
     }
 
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->sata), 0, SATA_ADDR);
@@ -531,23 +525,19 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
          */
         object_property_set_uint(sdhci, 3, "sd-spec-version", &err);
         if (err) {
-            error_propagate(errp, err);
-            return;
+            goto out_propagate_error;
         }
         object_property_set_uint(sdhci, SDHCI_CAPABILITIES, "capareg", &err);
         if (err) {
-            error_propagate(errp, err);
-            return;
+            goto out_propagate_error;
         }
         object_property_set_uint(sdhci, UHS_I, "uhs", &err);
         if (err) {
-            error_propagate(errp, err);
-            return;
+            goto out_propagate_error;
         }
         object_property_set_bool(sdhci, true, "realized", &err);
         if (err) {
-            error_propagate(errp, err);
-            return;
+            goto out_propagate_error;
         }
         sysbus_mmio_map(sbd, 0, sdhci_addr[i]);
         sysbus_connect_irq(sbd, 0, gic_spi[sdhci_intr[i]]);
@@ -564,8 +554,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
         object_property_set_bool(OBJECT(&s->spi[i]), true, "realized", &err);
         if (err) {
-            error_propagate(errp, err);
-            return;
+            goto out_propagate_error;
         }
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0, spi_addr[i]);
@@ -582,8 +571,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
     object_property_set_bool(OBJECT(&s->qspi), true, "realized", &err);
     if (err) {
-        error_propagate(errp, err);
-        return;
+        goto out_propagate_error;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 0, QSPI_ADDR);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 1, LQSPI_ADDR);
@@ -605,16 +593,14 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
     object_property_set_bool(OBJECT(&s->dp), true, "realized", &err);
     if (err) {
-        error_propagate(errp, err);
-        return;
+        goto out_propagate_error;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->dp), 0, DP_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->dp), 0, gic_spi[DP_IRQ]);
 
     object_property_set_bool(OBJECT(&s->dpdma), true, "realized", &err);
     if (err) {
-        error_propagate(errp, err);
-        return;
+        goto out_propagate_error;
     }
     object_property_set_link(OBJECT(&s->dp), OBJECT(&s->dpdma), "dpdma",
                              &error_abort);
@@ -623,16 +609,14 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
     object_property_set_bool(OBJECT(&s->ipi), true, "realized", &err);
     if (err) {
-        error_propagate(errp, err);
-        return;
+        goto out_propagate_error;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->ipi), 0, IPI_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->ipi), 0, gic_spi[IPI_IRQ]);
 
     object_property_set_bool(OBJECT(&s->rtc), true, "realized", &err);
     if (err) {
-        error_propagate(errp, err);
-        return;
+        goto out_propagate_error;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->rtc), 0, RTC_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->rtc), 0, gic_spi[RTC_IRQ]);
@@ -640,13 +624,11 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
         object_property_set_uint(OBJECT(&s->gdma[i]), 128, "bus-width", &err);
         if (err) {
-            error_propagate(errp, err);
-            return;
+            goto out_propagate_error;
         }
         object_property_set_bool(OBJECT(&s->gdma[i]), true, "realized", &err);
         if (err) {
-            error_propagate(errp, err);
-            return;
+            goto out_propagate_error;
         }
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->gdma[i]), 0, gdma_ch_addr[i]);
@@ -657,14 +639,17 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < XLNX_ZYNQMP_NUM_ADMA_CH; i++) {
         object_property_set_bool(OBJECT(&s->adma[i]), true, "realized", &err);
         if (err) {
-            error_propagate(errp, err);
-            return;
+            goto out_propagate_error;
         }
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->adma[i]), 0, adma_ch_addr[i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->adma[i]), 0,
                            gic_spi[adma_ch_intr[i]]);
     }
+    return;
+
+out_propagate_error:
+    error_propagate(errp, err);
 }
 
 static Property xlnx_zynqmp_props[] = {
-- 
2.21.1


