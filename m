Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E41164F453A
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 00:41:01 +0200 (CEST)
Received: from localhost ([::1]:56596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbrrA-00075M-Ml
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 18:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3x8RMYggKCpwSQD6KPODCKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--wuhaotsh.bounces.google.com>)
 id 1nbroT-0004EH-15
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 18:38:13 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649]:49690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3x8RMYggKCpwSQD6KPODCKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--wuhaotsh.bounces.google.com>)
 id 1nbroQ-000314-Ou
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 18:38:12 -0400
Received: by mail-pl1-x649.google.com with SMTP id
 r16-20020a170903021000b00155f7af17b6so162333plh.16
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 15:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=6aZplRTy+K7sXAoDpsOlKbdWLpd1ILB1I/VGhAQ+ij4=;
 b=SRo+1BAdfg+KrXuNeHK29LeXKZh4i0Fr9Q56zvOMLOhj4/3FIx33fbLP4m508P5Wen
 CKuXtWHIc2yhTVU/PJa0iE4/3mQq80YQWmuWlFOuFk55d0ORGT2p1hwSRaYJbsfeR67S
 Lne2YQXSFW7giPWcMjkRiv9+CT6wLI7FwiTNgV9Eqhy1/SGdi1ED7GL7sE6TpOEvhE7W
 Z01kILFLvN4xZTY2H+/FN7QPJSWA44dewVieGiJn5BjkA7SVR0yV5BngL1BVRKfDzOFe
 rkDW0Rgnn3hkaQcn0IcwpoeLC3Db8gU54XNu8ZOryk4fJd3KNJKvqgCQS/kjQRS9Z9nH
 MZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=6aZplRTy+K7sXAoDpsOlKbdWLpd1ILB1I/VGhAQ+ij4=;
 b=1xWy+Mz35br3aqR/yWd4vyYxaNQY8HO+xg6GMyhV/D2d3Gp52XIjJChD/HI6Zjx/m/
 nj8aeF+deIm+Av77B4n5G13JF0fqb9Rcah8pXXCI6igFhMh1+jn8XJ9/ZJ0tZuxxKGMv
 7GOpKtxzSLe4QWKYmqMTL+PVA+QK5fmxHb7r5AYV4umsDVsKYopAgEIzG2Cp22phHaSh
 dA6O4kl8mpDzwfuiMwDCeQIyI4AindtpPpBYQXMljdqEgIiC1tFobN01SoNvSqTQ3PYG
 +QT8Hb7k5ip0+mxCnTLOuz7caCpxtf1D0a6cRHcvIZTKzCEKdPeWzYJo13/oFPfv6Rxx
 wNIA==
X-Gm-Message-State: AOAM530DVElzmyv0uDa5N30jKLw1rSuI6cv9pDtqbTRjItegnKvOwsLf
 KB0bkmyVcZrwd1UJKCbQUPZl2eyxX1+gig==
X-Google-Smtp-Source: ABdhPJy299XvW8ybOrlbEodWhirRn6gQ+cmhr9uKhkIWxbdrTufvdTrENxWzBln8rN/B5xZ+90kumc7B7MdsTg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6a00:1683:b0:4f7:e497:6a55 with SMTP
 id k3-20020a056a00168300b004f7e4976a55mr5696577pfc.21.1649198279930; Tue, 05
 Apr 2022 15:37:59 -0700 (PDT)
Date: Tue,  5 Apr 2022 15:36:31 -0700
In-Reply-To: <20220405223640.2595730-1-wuhaotsh@google.com>
Message-Id: <20220405223640.2595730-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH for-7.1 02/11] hw/ssi: Make flash size a property in NPCM7XX
 FIU
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Uri.Trichter@nuvoton.com, Vishal.Soni@microsoft.com, 
 titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3x8RMYggKCpwSQD6KPODCKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

This allows different FIUs to have different flash sizes, useful
in NPCM8XX which has multiple different sized FIU modules.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Patrick Venture <venture@google.com>
---
 hw/arm/npcm7xx.c             | 6 ++++++
 hw/ssi/npcm7xx_fiu.c         | 6 ++----
 include/hw/ssi/npcm7xx_fiu.h | 1 +
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index d85cc02765..9946b94120 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -274,17 +274,21 @@ static const struct {
     hwaddr regs_addr;
     int cs_count;
     const hwaddr *flash_addr;
+    size_t flash_size;
 } npcm7xx_fiu[] = {
     {
         .name = "fiu0",
         .regs_addr = 0xfb000000,
         .cs_count = ARRAY_SIZE(npcm7xx_fiu0_flash_addr),
         .flash_addr = npcm7xx_fiu0_flash_addr,
+        .flash_size = 128 * MiB,
+
     }, {
         .name = "fiu3",
         .regs_addr = 0xc0000000,
         .cs_count = ARRAY_SIZE(npcm7xx_fiu3_flash_addr),
         .flash_addr = npcm7xx_fiu3_flash_addr,
+        .flash_size = 128 * MiB,
     },
 };
 
@@ -686,6 +690,8 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
 
         object_property_set_int(OBJECT(sbd), "cs-count",
                                 npcm7xx_fiu[i].cs_count, &error_abort);
+        object_property_set_int(OBJECT(sbd), "flash-size",
+                                npcm7xx_fiu[i].flash_size, &error_abort);
         sysbus_realize(sbd, &error_abort);
 
         sysbus_mmio_map(sbd, 0, npcm7xx_fiu[i].regs_addr);
diff --git a/hw/ssi/npcm7xx_fiu.c b/hw/ssi/npcm7xx_fiu.c
index 4eedb2927e..ea490f1332 100644
--- a/hw/ssi/npcm7xx_fiu.c
+++ b/hw/ssi/npcm7xx_fiu.c
@@ -28,9 +28,6 @@
 
 #include "trace.h"
 
-/* Up to 128 MiB of flash may be accessed directly as memory. */
-#define NPCM7XX_FIU_FLASH_WINDOW_SIZE (128 * MiB)
-
 /* Each module has 4 KiB of register space. Only a fraction of it is used. */
 #define NPCM7XX_FIU_CTRL_REGS_SIZE (4 * KiB)
 
@@ -525,7 +522,7 @@ static void npcm7xx_fiu_realize(DeviceState *dev, Error **errp)
         flash->fiu = s;
         memory_region_init_io(&flash->direct_access, OBJECT(s),
                               &npcm7xx_fiu_flash_ops, &s->flash[i], "flash",
-                              NPCM7XX_FIU_FLASH_WINDOW_SIZE);
+                              s->flash_size);
         sysbus_init_mmio(sbd, &flash->direct_access);
     }
 }
@@ -543,6 +540,7 @@ static const VMStateDescription vmstate_npcm7xx_fiu = {
 
 static Property npcm7xx_fiu_properties[] = {
     DEFINE_PROP_INT32("cs-count", NPCM7xxFIUState, cs_count, 0),
+    DEFINE_PROP_SIZE("flash-size", NPCM7xxFIUState, flash_size, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/ssi/npcm7xx_fiu.h b/include/hw/ssi/npcm7xx_fiu.h
index a3a1704289..1785ea16f4 100644
--- a/include/hw/ssi/npcm7xx_fiu.h
+++ b/include/hw/ssi/npcm7xx_fiu.h
@@ -60,6 +60,7 @@ struct NPCM7xxFIUState {
     int32_t cs_count;
     int32_t active_cs;
     qemu_irq *cs_lines;
+    size_t flash_size;
     NPCM7xxFIUFlash *flash;
 
     SSIBus *spi;
-- 
2.35.1.1094.g7c7d902a7c-goog


