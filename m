Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3E51A0CBF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 13:19:47 +0200 (CEST)
Received: from localhost ([::1]:45436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLmGg-0004iR-QA
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 07:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50620)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sundeep.lkml@gmail.com>) id 1jLmFW-00038m-Em
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 07:18:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sundeep.lkml@gmail.com>) id 1jLmFU-0002Kf-Kv
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 07:18:34 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:33523)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
 id 1jLmFT-0002Jp-Cz; Tue, 07 Apr 2020 07:18:32 -0400
Received: by mail-pj1-x1042.google.com with SMTP id cp9so1082007pjb.0;
 Tue, 07 Apr 2020 04:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bH/TVrbUH5Ze3DAXFfwxmJ+jVj75XcHyr/YCnr9aWPI=;
 b=s7h3Zq9goAj/R4/ExK3LHWYH+/Hxh+w3faSUN0LdfYt4OJF5A7H7bdf3QFYKEAPHNs
 C+VZrEKFYSV8jjpB5X2THAixfJ9ZnfsJ9F9e1oPWNSa5Y5MIjFBwsNKlpZ/VStlnSQmF
 hs0JzI9KSW+gBacyVXMhTyW8fiP5+zKG793H0mCLQH2XHmSdv5RUIX0bCVaBXKudA4in
 B77g61Z+dUv94gEpQeuKMvHklfU4NgoLeunuGMSAcSLUaSFk3JuYW4IiOjiy3IW7Fx+8
 Uum/gkPd8LlMRys3EV/OA08YJLD9j6rSxSOHTpK8RzVGkNSE9M9f/GxyTG44eX2EdP6U
 OiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bH/TVrbUH5Ze3DAXFfwxmJ+jVj75XcHyr/YCnr9aWPI=;
 b=XzMVISzzK/8+B93nnnMrq1tLL1K8Qr90RVTLm4hY7lEGFgGOdcl1zAwojr8YMumRca
 PlZtx1/S/XtE8gWjBVUmBAhpPJdioZHYoZQutcRCAE1CCdrMZUBmYC1A6xb3RlEhC2fJ
 16rPfAt+jL2l3D2gK43B5N4rNdg93kibxY8ItpjeheMGGGhrKQYHxf26oee8mzunPOUm
 wWysY+v3P1b7PHtWSF7nrq5vzm26q50qHrCaRXT2CImB7Lqpr8+t6r0uqAmUZsCwYklT
 Q+yh5ESWlPjc1maTLjy84PGQy4AE46s8lUBH190a0VFWJ2LRAgdjGxhuNGd0kzv7MFBx
 r3hw==
X-Gm-Message-State: AGi0PuazwO/yuBckE8Ke+9Q1pq2AemOA2EgTC9sktwXmf9hYJKKpR3zO
 Vu9oRlx6OPXCJXbu1Lojfhc=
X-Google-Smtp-Source: APiQypL73Q6rkqLxmcjTbsS/n4x3Rtrz40I8lsz/TSI7WKDX3sV0vurUeaGoStafL5sdVRfFRLy3VA==
X-Received: by 2002:a17:902:d915:: with SMTP id
 c21mr1974623plz.177.1586258310526; 
 Tue, 07 Apr 2020 04:18:30 -0700 (PDT)
Received: from hyd1358.marvell.com ([115.113.156.2])
 by smtp.googlemail.com with ESMTPSA id
 s137sm14357855pfs.45.2020.04.07.04.18.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Apr 2020 04:18:30 -0700 (PDT)
From: sundeep.lkml@gmail.com
To: jasowang@redhat.com, peter.maydell@linaro.org, philmd@redhat.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: [Qemu devel PATCH v3 2/3] msf2: Add EMAC block to SmartFusion2 SoC
Date: Tue,  7 Apr 2020 16:45:33 +0530
Message-Id: <1586258134-6932-3-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586258134-6932-1-git-send-email-sundeep.lkml@gmail.com>
References: <1586258134-6932-1-git-send-email-sundeep.lkml@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
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
Cc: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Subbaraya Sundeep <sundeep.lkml@gmail.com>

With SmartFusion2 Ethernet MAC model in
place this patch adds the same to SoC.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
---
 hw/arm/msf2-soc.c         | 21 ++++++++++++++++++++-
 include/hw/arm/msf2-soc.h |  3 +++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index 588d643..2f2db6d 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -35,6 +35,7 @@
 
 #define MSF2_TIMER_BASE       0x40004000
 #define MSF2_SYSREG_BASE      0x40038000
+#define MSF2_EMAC_BASE        0x40041000
 
 #define ENVM_BASE_ADDRESS     0x60000000
 
@@ -55,6 +56,7 @@ static const uint32_t uart_addr[MSF2_NUM_UARTS] = { 0x40000000 , 0x40010000 };
 static const int spi_irq[MSF2_NUM_SPIS] = { 2, 3 };
 static const int uart_irq[MSF2_NUM_UARTS] = { 10, 11 };
 static const int timer_irq[MSF2_NUM_TIMERS] = { 14, 15 };
+static const int emac_irq[MSF2_NUM_EMACS] = { 12 };
 
 static void do_sys_reset(void *opaque, int n, int level)
 {
@@ -81,6 +83,13 @@ static void m2sxxx_soc_initfn(Object *obj)
         sysbus_init_child_obj(obj, "spi[*]", &s->spi[i], sizeof(s->spi[i]),
                           TYPE_MSS_SPI);
     }
+
+    sysbus_init_child_obj(obj, "eth", &s->emac, sizeof(s->emac),
+                          TYPE_MSS_EMAC);
+    if (nd_table[0].used) {
+        qemu_check_nic_model(&nd_table[0], TYPE_MSS_EMAC);
+        qdev_set_nic_properties(DEVICE(&s->emac), &nd_table[0]);
+    }
 }
 
 static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
@@ -192,6 +201,17 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
         g_free(bus_name);
     }
 
+    dev = DEVICE(&s->emac);
+    object_property_set_bool(OBJECT(&s->emac), true, "realized", &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        return;
+    }
+    busdev = SYS_BUS_DEVICE(dev);
+    sysbus_mmio_map(busdev, 0, MSF2_EMAC_BASE);
+    sysbus_connect_irq(busdev, 0,
+                           qdev_get_gpio_in(armv7m, emac_irq[0]));
+
     /* Below devices are not modelled yet. */
     create_unimplemented_device("i2c_0", 0x40002000, 0x1000);
     create_unimplemented_device("dma", 0x40003000, 0x1000);
@@ -202,7 +222,6 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
     create_unimplemented_device("can", 0x40015000, 0x1000);
     create_unimplemented_device("rtc", 0x40017000, 0x1000);
     create_unimplemented_device("apb_config", 0x40020000, 0x10000);
-    create_unimplemented_device("emac", 0x40041000, 0x1000);
     create_unimplemented_device("usb", 0x40043000, 0x1000);
 }
 
diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h
index 3cfe5c7..296ed03 100644
--- a/include/hw/arm/msf2-soc.h
+++ b/include/hw/arm/msf2-soc.h
@@ -29,12 +29,14 @@
 #include "hw/timer/mss-timer.h"
 #include "hw/misc/msf2-sysreg.h"
 #include "hw/ssi/mss-spi.h"
+#include "hw/net/msf2-emac.h"
 
 #define TYPE_MSF2_SOC     "msf2-soc"
 #define MSF2_SOC(obj)     OBJECT_CHECK(MSF2State, (obj), TYPE_MSF2_SOC)
 
 #define MSF2_NUM_SPIS         2
 #define MSF2_NUM_UARTS        2
+#define MSF2_NUM_EMACS        1
 
 /*
  * System timer consists of two programmable 32-bit
@@ -62,6 +64,7 @@ typedef struct MSF2State {
     MSF2SysregState sysreg;
     MSSTimerState timer;
     MSSSpiState spi[MSF2_NUM_SPIS];
+    MSF2EmacState emac;
 } MSF2State;
 
 #endif
-- 
2.7.4


