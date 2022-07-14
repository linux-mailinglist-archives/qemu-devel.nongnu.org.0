Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE115754AF
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 20:11:30 +0200 (CEST)
Received: from localhost ([::1]:52308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC3JB-0005vr-An
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 14:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3xFnQYggKCtUNL81FKJ87FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--wuhaotsh.bounces.google.com>)
 id 1oC38v-0007YB-TQ
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:00:53 -0400
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049]:64130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3xFnQYggKCtUNL81FKJ87FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--wuhaotsh.bounces.google.com>)
 id 1oC38r-0005mZ-SA
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:00:53 -0400
Received: by mail-pj1-x1049.google.com with SMTP id
 a2-20020a17090a740200b001efaae60a57so1753847pjg.8
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 11:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=rH29rTwqC9tPWRe/rtqEAu2r9YLWMWTi3GrHYsUhaSM=;
 b=DkxFmYDncCITpBlyLNBqVxi+i7R/HUXKk2dDC7HKUxv+Dox5ZuKqR7/kRlNXQ3T3w4
 jUWCWTC9xfp6OBj6tRfuETczVY6RCEg4oehcnPbVXqgKb3cPN3dumv3U7lQNGurQ1kws
 R3wQhGrxnzVND1vQ6IbnoYb/Otli1xTEJ1WdXJOTwI0hUw/8MGHh5mVdhM5eHOW8q21g
 t1RMr9HNkbFy1eJMeTu5H/eUhCKBiDIYeVJL/LkC879dEw05UtowvD5Pyq38eKdFKbA5
 dQSJO+yCgPcMUfJay/lEmtKsEEdAnD39NUJBfHVHaSR4sy9iB8ENDUwzv4wOEkCZtzCO
 NxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=rH29rTwqC9tPWRe/rtqEAu2r9YLWMWTi3GrHYsUhaSM=;
 b=NN3Ii+gUrgtO55pFQLIoWv5DUIWRUTrKSw0FDV2G3wazT+OoTYCvw92+eb7wftLzaC
 dsqBA8Nlz1WNKQ7FtOP2cELU19d6T2LrKRTtP3JvEKU6YLAA9M0U076Co8Fo84j2Q+M8
 ApZtALcNyTmzOuroyj+yMBOIeNpjLvAiF4NO9/HiyP2/8ok8htgBtnvQ/E0LZxvX+1Uh
 kfidnIEyIXdCEZehK1GgwhFjVf32Qm4x8BcjJa1j2WdW25mxQox+FhQz/Cm5AxlnnOyy
 +/GKLrfl+xBsMqrhC8a/2ZXU0TYolzKpxpbC4EGqSfXz0h1g3yO1YeqzMhFjvXbwSA4d
 M8eQ==
X-Gm-Message-State: AJIora9WzsZdH1GWkaRWHgxzk2cXouW6D7Z/C9n7CEG9OPOiZeBvuag7
 AQA2uHRb0Kuo3hvDYkVqu/iHlM6fM5BwBw==
X-Google-Smtp-Source: AGRyM1uLPN2R65TSrzFkO0CUfS8LRCH0dTfSZJzURy2j1+zGzoOgaMSl0gUXx2iA9jmmvk661C5n3whZocsLTw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:e54b:b0:16c:38e5:a9b7 with SMTP
 id n11-20020a170902e54b00b0016c38e5a9b7mr9490923plf.66.1657821636109; Thu, 14
 Jul 2022 11:00:36 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:00:05 -0700
In-Reply-To: <20220714180006.77360-1-wuhaotsh@google.com>
Message-Id: <20220714180006.77360-8-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714180006.77360-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH 7/8] hw/arm: Set drive property for at24c eeprom
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3xFnQYggKCtUNL81FKJ87FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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


