Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42742436ADF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 20:47:02 +0200 (CEST)
Received: from localhost ([::1]:33586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdd5h-0004MS-CW
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 14:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3GrRxYQgKClsPNA3HMLA9HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--wuhaotsh.bounces.google.com>)
 id 1mdczW-0005Hc-LD
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 14:40:39 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649]:40681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3GrRxYQgKClsPNA3HMLA9HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--wuhaotsh.bounces.google.com>)
 id 1mdczO-0003W5-Rb
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 14:40:37 -0400
Received: by mail-pl1-x649.google.com with SMTP id
 u15-20020a17090341cf00b0013fc1cd9a8fso625847ple.7
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 11:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=8ZPzHXI27eSMyCY5kmkkFOCCpj1SqSSz1aHWQ3TU5qM=;
 b=PIN3Y4IsuqLDwPhrKGcKcNJzlByde4/JFzASID1lJEp8qA/PW/OAHP+2cKc2rXWrLm
 SSKcBO5uD6ZVoy9MQFw566zkozvA8dH+NSpIHSiBZkWrya6ey/BHjnWni+oGx5dvkKJY
 46/d4+hlzqdkCCkrPRIU4WVmB4Ff1SkGjXyMWVVJXszsZL4Noe8YUJLA7uW/CnGszXz9
 8jX78SS36Qq7tT4XE0iMYMjplHKvvHzsIS4kWXtrnEVI+bjLmlAszYbrZGDg4OQ5rPxa
 NvLtRPJf/Gy1rnx8Rd8HrnRj7e4PEnjmj9bX36lyV7xdrWDFfoUq2PGw1xcKIPTgtfFO
 zgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=8ZPzHXI27eSMyCY5kmkkFOCCpj1SqSSz1aHWQ3TU5qM=;
 b=i+wJPn1Qb08QANIwEwUPGaQZmg8jjig2jHSyzAQALxUamqN1JVN00OEvPiU3daYkeZ
 yUJr5dj4lmYBXWt1gUNwli3s7e5tCxoicshLrQqCvxbSOvsS0SGE7ku0PgkYPZoPtO9t
 cItBAiJKjUdvrhQGuCJeQj161nIfKMQLgvRQezDtSRpct6iMxyUaQsVyKMRfmecuEYeL
 V/WCY4tNnww/Nlxc/nIB5lz8F8pqqkfZTIrvJ/czLyn3vpINg1tHIkHRZ9pu2cmY+QeP
 QOalO+RsJd5dJRosnDvzY75FECp6MMfNRAdR0jsN38bZX+wJEr4hRCzeQQ1zqwVevMln
 LSkQ==
X-Gm-Message-State: AOAM530pvion8iGkFAiDsmSTLisRXm7efAC/Dj1hjdrXr3wiGLTo0SRy
 edPd6dt3hah8Oxehz45vgcdCF7aBMZ6F6A==
X-Google-Smtp-Source: ABdhPJwN8vdF2LArxl9aLbluAnmmhK94gu4Wueciur3oQ0CxI9ucXN/PZZ1Q7sXrPMhGN6rFfx4ErAbYPRjuzA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:7ec2:b0:13d:b563:c39 with SMTP id
 p2-20020a1709027ec200b0013db5630c39mr6810418plb.14.1634841626383; Thu, 21 Oct
 2021 11:40:26 -0700 (PDT)
Date: Thu, 21 Oct 2021 11:39:54 -0700
In-Reply-To: <20211021183956.920822-1-wuhaotsh@google.com>
Message-Id: <20211021183956.920822-6-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211021183956.920822-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v2 5/7] hw/nvram: Update at24c EEPROM init function in NPCM7xx
 boards
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3GrRxYQgKClsPNA3HMLA9HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x649.google.com
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
 hw/arm/npcm7xx_boards.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index a656169f61..cdb52b9922 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -107,13 +107,18 @@ static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
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
+    BlockInterfaceType type = IF_NONE;
+    DriveInfo *dinfo;
 
+    dinfo = drive_get(type, bus, unit_number);
+    if (dinfo) {
+        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
+    }
     qdev_prop_set_uint32(dev, "rom-size", rsize);
     i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
 }
@@ -220,8 +225,8 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "tmp105", 0x5c);
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), "tmp105", 0x5c);
 
-    at24c_eeprom_init(soc, 9, 0x55, 8192);
-    at24c_eeprom_init(soc, 10, 0x55, 8192);
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 9), 9, 0x55, 8192, 0);
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 10), 10, 0x55, 8192, 1);
 
     /*
      * i2c-11:
-- 
2.33.0.1079.g6e70778dc9-goog


