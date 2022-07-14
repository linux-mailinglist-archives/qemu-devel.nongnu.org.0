Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 638C1575565
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 20:52:26 +0200 (CEST)
Received: from localhost ([::1]:34538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC3wn-0003zx-G1
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 14:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Y2DQYggKCoI20nguzynmuumrk.iuswks0-jk1krtutmt0.uxm@flex--wuhaotsh.bounces.google.com>)
 id 1oC3a3-00060O-IV
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:55 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149]:45651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Y2DQYggKCoI20nguzynmuumrk.iuswks0-jk1krtutmt0.uxm@flex--wuhaotsh.bounces.google.com>)
 id 1oC3a0-000867-F7
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:54 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-2eb7d137101so21353367b3.12
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 11:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=ZPy/+0dqgBOB4uWjUnv2kiH/6vyYCxfU19RjpK4Qvr8=;
 b=Ut4AStBjr8MlQaAsJa9lSYqGFU2Es/qTrkneU9bH8Bu9j//US/GJWQFpq5hkRCbDdt
 hhHQA0hmQtLDdfspzD1BmneqCfhtbCmSI6vjEg/pdwZ/LGrAGH8SfLsEe5CjgwGj+CzG
 cuoEQgL+dUOSXfywvrbOg8Xc8t3XjKefranhvG7EA/7roPMwLnSa9wt9YSXMJNoAufIn
 /eh3J3Y6KKzrfZYfcktb4/1OisTI8b+FLppwBNAMyOxgWEk6UwwHh+0iSjelIVu3kOd9
 dxS38HDIr1+TUyy8e0MBMabLeVVZEmRTvVtRQgUue3mnLDjEi7OtpvKdtHVCWuIbKHo0
 sB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ZPy/+0dqgBOB4uWjUnv2kiH/6vyYCxfU19RjpK4Qvr8=;
 b=lr/OV2CpmVklErLwXxCjfs0NWt+3OeWEAChKQecuWcQGsC1sg9KNKLbeZoJ6Ado6G+
 bvCvQGpw7Z5+3Z2a4EEdPL+8sVK95coUaCA7m4yvJXi/QYVZ0m8urqSJab+SoFjph/jh
 rbVvsIvWEaKekpdR6sYZ3OKCWkVdxhyknfA0SJ7VfkE4SXQM1eT+L4V8C8ZhelbJw+Uf
 lkpsrWkjWArQAJUHFPeYsQnWvhrRqGU74sIll+aqwMaYfmLThjZm1sF9pvl0tnJN9pgy
 lLxwej5FhZeKK4G5VFyRMM8wXuRqBPLHTkgV10Dl+7VaFVxT+rYXKXBlBJstnFUsWRum
 MVlw==
X-Gm-Message-State: AJIora/LvE4joFN+BF3a4DpZid4gVjqvACnyzriOiKDh9FFFn7PVGNyi
 SfY1kJWvug0+4vrVxaOBmU5TA/5qwuZ3tQ==
X-Google-Smtp-Source: AGRyM1t3xYLq7RXK1GteiUEi0VgyPxHRvwvoPmes3nmP+aeAMPOxyEmd3zmSPh4ZXG13XXyGiRApRNGpRHZkXQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a25:3b11:0:b0:66e:ccf2:76dc with SMTP id
 i17-20020a253b11000000b0066eccf276dcmr9964429yba.247.1657823331277; Thu, 14
 Jul 2022 11:28:51 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:28:34 -0700
In-Reply-To: <20220714182836.89602-1-wuhaotsh@google.com>
Message-Id: <20220714182836.89602-7-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714182836.89602-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH v5 6/8] hw/arm: npcm8xx_boards: EEPROMs can take bus as
 parameter
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3Y2DQYggKCoI20nguzynmuumrk.iuswks0-jk1krtutmt0.uxm@flex--wuhaotsh.bounces.google.com;
 helo=mail-yw1-x1149.google.com
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

We allow at24c_eeprom_init to take a I2CBus* as parameter. This allows
us to attach an EEPROM device behind an I2C mux which is not
possible with the old method.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx_boards.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 6bc6f5d2fe..b083b0c572 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -140,10 +140,9 @@ static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
     return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]), "i2c-bus"));
 }
 
-static void at24c_eeprom_init(NPCM7xxState *soc, int bus, uint8_t addr,
+static void at24c_eeprom_init(I2CBus *i2c_bus, int bus, uint8_t addr,
                               uint32_t rsize)
 {
-    I2CBus *i2c_bus = npcm7xx_i2c_get_bus(soc, bus);
     I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
     DeviceState *dev = DEVICE(i2c_dev);
 
@@ -253,8 +252,8 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "tmp105", 0x5c);
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), "tmp105", 0x5c);
 
-    at24c_eeprom_init(soc, 9, 0x55, 8192);
-    at24c_eeprom_init(soc, 10, 0x55, 8192);
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 9), 9, 0x55, 8192);
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 10), 10, 0x55, 8192);
 
     /*
      * i2c-11:
@@ -360,7 +359,8 @@ static void kudo_bmc_i2c_init(NPCM7xxState *soc)
 
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), TYPE_PCA9548, 0x77);
 
-    at24c_eeprom_init(soc, 4, 0x50, 8192); /* mbfru */
+    /* mbfru */
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 4), 4, 0x50, 8192);
 
     i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 13),
                                       TYPE_PCA9548, 0x77);
@@ -371,7 +371,8 @@ static void kudo_bmc_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 4), "tmp105", 0x48);
     i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 5), "tmp105", 0x49);
 
-    at24c_eeprom_init(soc, 14, 0x55, 8192); /* bmcfru */
+    /* bmcfru */
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 14), 14, 0x55, 8192);
 
     /* TODO: Add remaining i2c devices. */
 }
-- 
2.37.0.170.g444d1eabd0-goog


