Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848023EBED3
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 01:40:55 +0200 (CEST)
Received: from localhost ([::1]:48252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEgnG-000499-H5
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 19:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3jgEXYQgKCvszxkdrwvkjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--wuhaotsh.bounces.google.com>)
 id 1mEghG-00044h-Dk
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 19:34:42 -0400
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a]:44682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3jgEXYQgKCvszxkdrwvkjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--wuhaotsh.bounces.google.com>)
 id 1mEghE-00060q-Ng
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 19:34:42 -0400
Received: by mail-pj1-x104a.google.com with SMTP id
 o23-20020a17090a4217b02901774c248202so11727759pjg.9
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 16:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=HCer6SUjEvJWKpa23gzyoBaF+8xg8ld+2vS1BH0nzD0=;
 b=Ots1skqgoef9hQjYDtOPzzzXqYKeShZ8tuflMa2TGcONsgjdEhV4xOniYbwf62FigP
 wLzOaKav0NhXUsUwYoTq3etQKdlZJnaF98Wh1bmdknE0iQGEWpPieO87TRSkNe1YCMtI
 7oU+4qjMTdtLU7x1PU9XmX7J8ZJUFsTSPIUUHyaykkAJ0Hl+N9wVb9gOVKXefTwu/u+f
 gePVFrcLTcY0IJFYhgkzuAXAr52qlpjHRd5tC9T2WyxGUfTKnY93x77uF7fB5TKVIV8C
 h3Hkqd2SV0IlHg1OKy7EIWWiC2T554N44BC8Y2ukb+ClW0Etjxgb6u705nIjLc+fBbxh
 gz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=HCer6SUjEvJWKpa23gzyoBaF+8xg8ld+2vS1BH0nzD0=;
 b=hDpAFhYUMmOZr9YRIBM3o/o8MB77XMPwXxy5dN48CxmNwbwedGWmrZ7etQRBdhT2o6
 gs1Qtvr9AreCJ7RDjBb4Zde15iy1s8f3bbHK9SWNJBMQg06MPNtAgJlfoPgxWXbP4mop
 IvpvAmqutt6/mINB5TuVktfPwRuqWDrOSLhNv22mCtwtKHKgzjJFPEy5rO9qfQLf+y03
 ceIsZQWo90J0Cp53yJisgEKnOJywRnEdqtwi5fLzKydf3aSvWjN/pZK8N3qi/7E6hhdM
 UPx6wWbp4L+Fz3R8AcdRUdT2PP/qx842LgPu+t8wq3zdW1g4SV3b0v6KxhmjTpCa45QL
 uUgg==
X-Gm-Message-State: AOAM530YKzPNYe7ZrR/ZpAv4dBi8dbEr2P3mwvOhqooLGqs9y6zAMgTR
 rH9OdCa2/Lws6C8C+X0pt5OVBPDw3fO7Ig==
X-Google-Smtp-Source: ABdhPJyH+ajLEzSihvmAfA8Um4m3U8IgLSrXIiMysVhut5QCx0iwX13RxDBiZSEA8hB84fDWPYCzSbdF6P62iA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:aa7:8683:0:b029:3e0:9a61:b505 with SMTP
 id d3-20020aa786830000b02903e09a61b505mr4856689pfo.10.1628897678747; Fri, 13
 Aug 2021 16:34:38 -0700 (PDT)
Date: Fri, 13 Aug 2021 16:33:53 -0700
In-Reply-To: <20210813233353.2099459-1-wuhaotsh@google.com>
Message-Id: <20210813233353.2099459-8-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210813233353.2099459-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH 7/7] hw/arm: Use unit number in quanta-gsj eeprom files
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, minyard@acm.org, 
 wuhaotsh@google.com, titusr@google.com, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3jgEXYQgKCvszxkdrwvkjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x104a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use unique unit numbers in quanta-gsj eeprom files.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Patrick Venture<venture@google.com>
---
 hw/arm/npcm7xx_boards.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 54cf9785ec..be6c81b29d 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -107,17 +107,6 @@ static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
     return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]), "i2c-bus"));
 }
 
-static void at24c_eeprom_init(NPCM7xxState *soc, int bus, uint8_t addr,
-                              uint32_t rsize)
-{
-    I2CBus *i2c_bus = npcm7xx_i2c_get_bus(soc, bus);
-    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
-    DeviceState *dev = DEVICE(i2c_dev);
-
-    qdev_prop_set_uint32(dev, "rom-size", rsize);
-    i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
-}
-
 static void npcm7xx_init_pwm_splitter(NPCM7xxMachine *machine,
                                       NPCM7xxState *soc, const int *fan_counts)
 {
@@ -220,8 +209,8 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "tmp105", 0x5c);
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), "tmp105", 0x5c);
 
-    at24c_eeprom_init(soc, 9, 0x55, 8192);
-    at24c_eeprom_init(soc, 10, 0x55, 8192);
+    at24c_eeprom_init_one(npcm7xx_i2c_get_bus(soc, 9), 9, 0x55, 8192, 0);
+    at24c_eeprom_init_one(npcm7xx_i2c_get_bus(soc, 10), 10, 0x55, 8192, 1);
 
     /*
      * i2c-11:
-- 
2.33.0.rc1.237.g0d66db33f3-goog


