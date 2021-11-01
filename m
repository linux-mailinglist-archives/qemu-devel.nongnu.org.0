Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DDC442409
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 00:33:19 +0100 (CET)
Received: from localhost ([::1]:43702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhgnm-0002wf-GG
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 19:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3OHeAYQgKCjstreXlqpedlldib.Zljnbjr-absbiklkdkr.lod@flex--wuhaotsh.bounces.google.com>)
 id 1mhgfV-0002I8-UD
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:24:46 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a]:53069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3OHeAYQgKCjstreXlqpedlldib.Zljnbjr-absbiklkdkr.lod@flex--wuhaotsh.bounces.google.com>)
 id 1mhgfT-00030s-Aq
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:24:45 -0400
Received: by mail-pf1-x44a.google.com with SMTP id
 a127-20020a627f85000000b0047feae4a8d9so4869712pfd.19
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 16:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=vZuuJBScVpwz/n6NghZWtiMoiaQStfl6YzFYf/q2BWQ=;
 b=M6EIbF/mliLkmHyNM9t3oU/YOI6NqNO3kVQiT3Jtp6VQy1J4waNKVjl1v1GFmkIQvK
 WiNq0TtRvOKP8VVVE9+rFBoqVEoE94AFl239u0eH60c6jPMBMLd/Luwc35mHIs99PBxt
 SwNqySxIvTgfx45+IVGo+zXW+zrJubyzn7CIP2rypf1LVERpCuSCLkc/elUrqIqdf7UD
 rhhU35mUZp2GbVnbIAGw/9qWZgDBw+bu2FllB+0P/z47Az151/rsHBUsijb+8SQyBZSg
 RXALg7lO2oZIQmMyYqppN9TUaN/6tthtJNHj4bDeYJbrBUCTIJNoG6qAGZa0qI+eWcYL
 hXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=vZuuJBScVpwz/n6NghZWtiMoiaQStfl6YzFYf/q2BWQ=;
 b=iNRUVAnNPQT3tjbAvsGgpDS4+iDrRqXROsfzXJSumM1EmY3QuXQ807wdX7fjzHLjb7
 uApsq5NOjE5MFm+P12gZWHB2tIOO+6R08yioawmOGBznvMEe52QpjaFClCJHEN9ymmFK
 8/J+uv7Fu0hWUrwt/hm+EzKXqawa1xQ7qjVGVhjiCFTcbKtAQfaVMwH4hvWFyP8oendP
 TXIw625s6fBFcJIw8jXUbuWIWuBtT/UAU5kbf8I2EgYDeQ6JUiVhiAdp03w5Mx4QnWwN
 zIzZ/XaECbTqXEHfWJncAO/d8ImOF8ETvIZk3MzilLuJwyRit8Un3Zk2T1sM16llAJBR
 vMew==
X-Gm-Message-State: AOAM532pcJrMI/J4JqXppozH9oLDdH8/g1l6IdgTkUJEwBVZSLgjUxCm
 RQVYu5WUzd4BQeK/QdoZN/ttQ8jXOwmPow==
X-Google-Smtp-Source: ABdhPJyGBQ2vFx0wHrMaKd5ANfIecrEWBxDNrhXuWui0sUCG44xWXJCYdFx1vNcGqKSojdinDudLiEQfaHT3mw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90b:3144:: with SMTP id
 ip4mr2267169pjb.153.1635809080988; Mon, 01 Nov 2021 16:24:40 -0700 (PDT)
Date: Mon,  1 Nov 2021 16:23:45 -0700
In-Reply-To: <20211101232346.1070813-1-wuhaotsh@google.com>
Message-Id: <20211101232346.1070813-6-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211101232346.1070813-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v3 5/6] hw/nvram: Update at24c EEPROM init function in NPCM7xx
 boards
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3OHeAYQgKCjstreXlqpedlldib.Zljnbjr-absbiklkdkr.lod@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x44a.google.com
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
index a656169f61..8c72024007 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -107,13 +107,17 @@ static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
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
 
+    dinfo = drive_get(IF_NONE, bus, unit_number);
+    if (dinfo) {
+        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
+    }
     qdev_prop_set_uint32(dev, "rom-size", rsize);
     i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
 }
@@ -220,8 +224,8 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
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


