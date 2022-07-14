Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C89575569
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 20:52:47 +0200 (CEST)
Received: from localhost ([::1]:36394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC3x8-0005Fs-Ml
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 14:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ZWDQYggKCoQ42piw10powwotm.kwuymu2-lm3mtvwvov2.wzo@flex--wuhaotsh.bounces.google.com>)
 id 1oC3a4-000642-PY
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:56 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649]:41849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ZWDQYggKCoQ42piw10powwotm.kwuymu2-lm3mtvwvov2.wzo@flex--wuhaotsh.bounces.google.com>)
 id 1oC3a3-00086v-A5
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:56 -0400
Received: by mail-pl1-x649.google.com with SMTP id
 u3-20020a17090341c300b0016c3c083636so577157ple.8
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 11:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=rH29rTwqC9tPWRe/rtqEAu2r9YLWMWTi3GrHYsUhaSM=;
 b=av6pX0GSPeUm7dK5eBakaaFXPfH5v67vU2o9ZQmgkdt+ubqU8DWHKEPIGcFpTQYYty
 qVSWOvFOWwefgHscQ2hm9k9cUUAY9rUIRQrpT1EK3T1bnLfG5ZkELCGuM93BWdegsj9N
 wEmrZMITvbQ4t63EBjwJROTORQ9uILGrT66ROp2Pd6vKKe1ipRqqp2F+XgB+Hj+asq1k
 PYVaE7jUSmOkEgKa44aO3NAhTtK+yFsgM2OAaWu9CQeH80NB1ARl5M5OEI6V9PC3Rkrz
 Q4DvRnT3Z+3DKcbASfIGODE0b0B8UPZvlXrCxgvEnM7MyBjAc7DaS5m0sqX0CAFDqV0R
 8ifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=rH29rTwqC9tPWRe/rtqEAu2r9YLWMWTi3GrHYsUhaSM=;
 b=tWFT+tFAWzhaWcMdwNTrF3VtPOln2vzf5UgMOV8/JW/oNkETQUxkS3pmoRT3TeG7OB
 krIcW4gp6/b5weHOgKjJ51pZTYVWU41lgNnV2IfHDA/RJNMqDKg8OvNHUQvL/tcnN2UP
 f8ula4WwbefWPHRxnldyGncYP+iIEe3LakEK2S4fWVBi7BNJ8CIu/S6JWNSeSDqKb1PI
 zA4234nnXA/gZP97azvvUTSX/ZAlDE0HM5i754UYAh0eOQAWNj94/grC7pchSSrzcxQi
 1dcPr6U0zRqbhyAXKgGeUSLwNDAGpNJsmSWmFdq5/62dWteRHuAE6T842z8hiUvFKpFS
 7zPw==
X-Gm-Message-State: AJIora8VGytOpv6LrhMUfKcE2OvzFqDGligiLIJykEND6xhqDssQ4bnO
 u2TWOSytahIetH94+tVyhd75blSjqOIKpw==
X-Google-Smtp-Source: AGRyM1sJ1lFTdctBNdUU+jsIu1MRyUFBaw4ZpdToFuOcaCHE92vmFG3Gaa/TdySWDmRgJTqXg2nFFtVdEHYtbw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:eccf:b0:16b:f555:d42e with SMTP
 id a15-20020a170902eccf00b0016bf555d42emr9455517plh.75.1657823333237; Thu, 14
 Jul 2022 11:28:53 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:28:35 -0700
In-Reply-To: <20220714182836.89602-1-wuhaotsh@google.com>
Message-Id: <20220714182836.89602-8-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714182836.89602-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH v5 7/8] hw/arm: Set drive property for at24c eeprom
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3ZWDQYggKCoQ42piw10powwotm.kwuymu2-lm3mtvwvov2.wzo@flex--wuhaotsh.bounces.google.com;
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

This patch allows the user to attach an external drive as a property
for an onboard at24c eeprom device. It uses an unit number to
distinguish different devices.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx_boards.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index b083b0c572..b8337871ba 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -141,11 +141,16 @@ static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
 }
 
 static void at24c_eeprom_init(I2CBus *i2c_bus, int bus, uint8_t addr,
-                              uint32_t rsize)
+                              uint32_t rsize, int unit)
 {
     I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
     DeviceState *dev = DEVICE(i2c_dev);
+    DriveInfo *dinfo;
 
+    dinfo = drive_get(IF_OTHER, bus, unit);
+    if (dinfo) {
+        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
+    }
     qdev_prop_set_uint32(dev, "rom-size", rsize);
     i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
 }
@@ -252,8 +257,8 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "tmp105", 0x5c);
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), "tmp105", 0x5c);
 
-    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 9), 9, 0x55, 8192);
-    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 10), 10, 0x55, 8192);
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 9), 9, 0x55, 8192, 0);
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 10), 10, 0x55, 8192, 1);
 
     /*
      * i2c-11:
@@ -360,7 +365,7 @@ static void kudo_bmc_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), TYPE_PCA9548, 0x77);
 
     /* mbfru */
-    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 4), 4, 0x50, 8192);
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 4), 4, 0x50, 8192, 0);
 
     i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 13),
                                       TYPE_PCA9548, 0x77);
@@ -372,7 +377,7 @@ static void kudo_bmc_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 5), "tmp105", 0x49);
 
     /* bmcfru */
-    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 14), 14, 0x55, 8192);
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 14), 14, 0x55, 8192, 1);
 
     /* TODO: Add remaining i2c devices. */
 }
-- 
2.37.0.170.g444d1eabd0-goog


