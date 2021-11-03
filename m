Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2568D444AA4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 23:08:46 +0100 (CET)
Received: from localhost ([::1]:39608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miOR3-00061K-9b
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 18:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3xwaDYQgKCvIqobUinmbaiiafY.WigkYgo-XYpYfhihaho.ila@flex--wuhaotsh.bounces.google.com>)
 id 1miOKR-0003Eo-O3
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 18:01:58 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:34562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3xwaDYQgKCvIqobUinmbaiiafY.WigkYgo-XYpYfhihaho.ila@flex--wuhaotsh.bounces.google.com>)
 id 1miOKM-0002bm-04
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 18:01:54 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 x25-20020aa79199000000b0044caf0d1ba8so2155677pfa.1
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 15:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=DofkSRTXRKtEMsEmkHJldcRscNyPS9ZKqUEISxFiUzc=;
 b=Ir/f1gSbLy9cLdndt/s2yFMzleVVnjUGZlYAjIpJyjKSVbCL+zQIxFrSO20Yn9jv6e
 pBHGwuHaSczYjjkroQcQIW9H/WhUBlugYMbtfW/+udprAskcGv1IfqvgQ5xgKZjWdPaY
 j7yobWBylCM+ZEeHP9PhAf/VGu6gX/6NPPCKuK+XE4Vef/xZLLUFmpvL+URkRF6ba6iC
 XnLRDGC7OvdYzaCFVOJTXvsq7hn/RT55E6E+/6CIT+XdAdRx9L+c4euzhEbKkLSk0hc4
 bgcpoOTnoxxR7e2MsAP5Z0nS/0CtpqC9/lfHtmCo+JKwcecuPMt1MwJ3KyTZpefrE/UH
 /mDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=DofkSRTXRKtEMsEmkHJldcRscNyPS9ZKqUEISxFiUzc=;
 b=tDuQQNHYFlfhcu8ZhG8HriQUyjdODdb56YBnvkWwk4X5DFFUlam6lfucytsi/aPA9/
 O+W6LRE0AZacxQXwLIDESkd3838QQJVWsLVIVu34gciSPjZjrI6odHtTQVGwzLixEmiX
 fkbfzoRjnnl2fGmQa22C9Uts/GgXbdXrs6CBLxAPjNGQd3lRnc9rSlYxLh2UqeSuxnZw
 IOgnxRdJc8u9cfRHUUu2BAPCW4hHvQh2QmPZL+K4cEoa/zFdgnFDU+VpbjBi1Ha7fdim
 PNdOGbUC4trFrxSz/e0zP6DYF5yDO8XVnAXOQXnKsDbM9KzTNPPnpR0DrbzD62WAUT93
 /J+A==
X-Gm-Message-State: AOAM5325ioLSDrFuMAaQykVbBcfSwr8hvMduK4gE9tge9k0WMo4Zjx01
 9F12dKYTtGBJy0o/wemiO2bvoOg1/0eccw==
X-Google-Smtp-Source: ABdhPJyeAWGrglgE32IfnWZDuwyZaX4inqjW1ka6u7wNh9KAzyxAxtexjF4rqZm1qR6i6V9afzpJBQU0ZJVd5w==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:ce8c:b0:141:d411:7e25 with SMTP
 id f12-20020a170902ce8c00b00141d4117e25mr26691523plg.85.1635976903943; Wed,
 03 Nov 2021 15:01:43 -0700 (PDT)
Date: Wed,  3 Nov 2021 15:01:32 -0700
In-Reply-To: <20211103220133.1422879-1-wuhaotsh@google.com>
Message-Id: <20211103220133.1422879-4-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211103220133.1422879-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v4 6/7] hw/nvram: Update at24c EEPROM init function in NPCM7xx
 boards
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3xwaDYQgKCvIqobUinmbaiiafY.WigkYgo-XYpYfhihaho.ila@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

We made 3 changes to the at24c_eeprom_init function in
npcm7xx_boards.c:

1. We allow the function to take a I2CBus* as parameter. This allows
   us to attach an EEPROM device behind an I2C mux which is not
   possible with the old method.

2. We make at24c EEPROMs are backed by drives so that we can
   specify the content of the EEPROMs.

3. Instead of using i2c address as unit number, This patch assigns
   unique unit numbers for each eeproms in each board. This avoids
   conflict in providing multiple eeprom contents with the same address.
   In the old method if we specify two drives with the same unit number,
   the following error will occur: `Device with id 'none85' exists`.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx_boards.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index dec7d16ae5..9121e081fa 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -126,13 +126,17 @@ static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
     return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]), "i2c-bus"));
 }
 
-static void at24c_eeprom_init(NPCM7xxState *soc, int bus, uint8_t addr,
-                              uint32_t rsize)
+static void at24c_eeprom_init(I2CBus *i2c_bus, int bus, uint8_t addr,
+                              uint32_t rsize, int unit_number)
 {
-    I2CBus *i2c_bus = npcm7xx_i2c_get_bus(soc, bus);
     I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
     DeviceState *dev = DEVICE(i2c_dev);
+    DriveInfo *dinfo;
 
+    dinfo = drive_get(IF_OTHER, bus, unit_number);
+    if (dinfo) {
+        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
+    }
     qdev_prop_set_uint32(dev, "rom-size", rsize);
     i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
 }
@@ -239,8 +243,8 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "tmp105", 0x5c);
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), "tmp105", 0x5c);
 
-    at24c_eeprom_init(soc, 9, 0x55, 8192);
-    at24c_eeprom_init(soc, 10, 0x55, 8192);
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 9), 9, 0x55, 8192, 0);
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 10), 10, 0x55, 8192, 1);
 
     /*
      * i2c-11:
-- 
2.33.1.1089.g2158813163f-goog


