Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6FE3EBED6
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 01:41:57 +0200 (CEST)
Received: from localhost ([::1]:50090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEgoG-0005N2-Oa
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 19:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3jQEXYQgKCvoywjcqvujiqqing.eqosgow-fgxgnpqpipw.qti@flex--wuhaotsh.bounces.google.com>)
 id 1mEghE-0003xQ-EM
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 19:34:40 -0400
Received: from mail-qt1-x849.google.com ([2607:f8b0:4864:20::849]:39731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3jQEXYQgKCvoywjcqvujiqqing.eqosgow-fgxgnpqpipw.qti@flex--wuhaotsh.bounces.google.com>)
 id 1mEghC-0005zt-Qt
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 19:34:40 -0400
Received: by mail-qt1-x849.google.com with SMTP id
 7-20020ac856070000b0290292921115ecso7397298qtr.6
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 16:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=zDlCyx2TeLBSOMek5FvXP4ZehYCWTnXcUgj4T5nE1xU=;
 b=CqVEwue/GFnhGfzbL6fpQRHk+JKjRDqEM1H6qrwuVwgmRghEWc4K7UCDB/isclynQb
 SPAzM20LI/hLHrdVvAAtiYX6AQuG+EI918dg7Fy4LgipDxk43hp2mtoJkgyfEeiKspPB
 cAQzydwq4URLGTNOTiCF2zJDx8kIK3WIk5d8WeQ9tzaq/ZnBj0Znw+idt1Ln81immJSh
 qPJ0yli8wH9IxyZeYpJW16su6JTbKK+SeTZ7+h3Rw35kLVg+Sog3dSEHBPctF5OlxjfP
 8+0SPXL0eXv5P0aj0bkHWI5YRBeUikiFpRs8xpveQaIVIcvrTLG6MrHY9aEpsErr35E4
 fSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=zDlCyx2TeLBSOMek5FvXP4ZehYCWTnXcUgj4T5nE1xU=;
 b=g5RrJSATeTTc4+NksM4akS4vukSxjID2VxgUK8Y40nFnOwqghA6plKrb2vkPm3IvHa
 yB8x5kf4ImFbAZLvIHzbuQRe6DgUmQ+AUlxiM3eD1CCtRk4AmHYHAYqiCP/ZkRgzSCju
 EFabKeg8SB7tyejp4dvkxWy2smMPf3EQWuV8gIvnXN/HlpUdbZltvG61tjOUtS9FH86A
 zK+0j80rEiwlEjpp18GZ2ldQF3L1+y57D2kKYM730T19FMuqO93qtvpiSL0JvcbTFsNY
 bgsDwenOGYkWev7+SQMRX7NxCKYS+4GiaMQMZn4mhhda86HtPBfAaVNn0UM38ETnzAlT
 GeOw==
X-Gm-Message-State: AOAM531rKiBfh3w7uLC3416QGBn5fbZee0L8qwneVhM56lHWGSqiwEFY
 765m4h08ZvoLFzploU8V086Lb5mrZQ2hRA==
X-Google-Smtp-Source: ABdhPJx2PVxreIP3tBTQPeYE24FU2iNjiT4rgbssT/8PBRY9C66tZxr8Tj6+ypIWHD/Bqe4PbSZekBj/sPS75g==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6214:5019:: with SMTP id
 jo25mr4882290qvb.23.1628897677104; Fri, 13 Aug 2021 16:34:37 -0700 (PDT)
Date: Fri, 13 Aug 2021 16:33:52 -0700
In-Reply-To: <20210813233353.2099459-1-wuhaotsh@google.com>
Message-Id: <20210813233353.2099459-7-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210813233353.2099459-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH 6/7] hw/arm: quanta-gbs-bmc add i2c devices
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, minyard@acm.org, 
 wuhaotsh@google.com, titusr@google.com, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::849;
 envelope-from=3jQEXYQgKCvoywjcqvujiqqing.eqosgow-fgxgnpqpipw.qti@flex--wuhaotsh.bounces.google.com;
 helo=mail-qt1-x849.google.com
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

From: Patrick Venture <venture@google.com>

Adds supported i2c devices to the quanta-gbc-bmc board.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx_boards.c | 79 +++++++++++++++++++++++------------------
 1 file changed, 45 insertions(+), 34 deletions(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index e5a3243995..54cf9785ec 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -21,6 +21,7 @@
 #include "hw/i2c/i2c_mux_pca954x.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/loader.h"
+#include "hw/nvram/eeprom_at24c.h"
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
@@ -252,11 +253,12 @@ static void quanta_gsj_fan_init(NPCM7xxMachine *machine, NPCM7xxState *soc)
 
 static void quanta_gbs_i2c_init(NPCM7xxState *soc)
 {
-    /*
-     * i2c-0:
-     *     pca9546@71
-     *
-     * i2c-1:
+    I2CSlave *i2c_mux;
+
+    /* i2c-0: */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 0), TYPE_PCA9546, 0x71);
+
+    /* i2c-1:
      *     pca9535@24
      *     pca9535@20
      *     pca9535@21
@@ -264,47 +266,56 @@ static void quanta_gbs_i2c_init(NPCM7xxState *soc)
      *     pca9535@23
      *     pca9535@25
      *     pca9535@26
-     *
-     * i2c-2:
-     *     sbtsi@4c
-     *
-     * i2c-5:
-     *     atmel,24c64@50 mb_fru
-     *     pca9546@71
-     *         - channel 0: max31725@54
-     *         - channel 1: max31725@55
-     *         - channel 2: max31725@5d
-     *                      atmel,24c64@51 fan_fru
-     *         - channel 3: atmel,24c64@52 hsbp_fru
-     *
-     * i2c-6:
+     */
+
+    /* i2c-2: sbtsi@4c */
+
+    /* i2c-5: */
+    /* mb_fru */
+    at24c_eeprom_init_one(npcm7xx_i2c_get_bus(soc, 5), 5, 0x50, 8192, 0);
+    i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 5),
+                                      TYPE_PCA9546, 0x71);
+    /* max31725 is tmp105 compatible. */
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 0), "tmp105", 0x54);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 1), "tmp105", 0x55);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 2), "tmp105", 0x5d);
+    /* fan_fru */
+    at24c_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 2), 5, 0x51, 8192, 1);
+    /* hsbp_fru */
+    at24c_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 3), 5, 0x52, 8192, 2);
+
+    /* i2c-6:
      *     pca9545@73
      *
      * i2c-7:
      *     pca9545@72
-     *
-     * i2c-8:
-     *     adi,adm1272@10
-     *
-     * i2c-9:
-     *     pca9546@71
-     *         - channel 0: isil,isl68137@60
+     */
+
+    /* i2c-8: */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 8), "adm1272", 0x10);
+
+    /* i2c-9: */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 9), TYPE_PCA9546, 0x71);
+    /*         - channel 0: isil,isl68137@60
      *         - channel 1: isil,isl68137@61
      *         - channel 2: isil,isl68137@63
      *         - channel 3: isil,isl68137@45
-     *
-     * i2c-10:
+     */
+
+    /* i2c-10:
      *     pca9545@71
      *
      * i2c-11:
      *     pca9545@76
-     *
-     * i2c-12:
-     *     maxim,max34451@4e
-     *     isil,isl68137@5d
+     */
+
+    /* i2c-12: */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 12), "max34451", 0x4e);
+    /*     isil,isl68137@5d
      *     isil,isl68137@5e
-     *
-     * i2c-14:
+     */
+
+    /* i2c-14:
      *     pca9545@70
      */
 }
-- 
2.33.0.rc1.237.g0d66db33f3-goog


