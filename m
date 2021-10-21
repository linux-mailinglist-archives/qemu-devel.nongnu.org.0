Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C95E5436AC2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 20:43:49 +0200 (CEST)
Received: from localhost ([::1]:55614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdd2a-0008QP-SZ
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 14:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3HLRxYQgKCl0RPC5JONCBJJBG9.7JHL9HP-89Q9GIJIBIP.JMB@flex--wuhaotsh.bounces.google.com>)
 id 1mdczZ-0005JX-G4
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 14:40:42 -0400
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049]:56050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3HLRxYQgKCl0RPC5JONCBJJBG9.7JHL9HP-89Q9GIJIBIP.JMB@flex--wuhaotsh.bounces.google.com>)
 id 1mdczW-0003af-4L
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 14:40:41 -0400
Received: by mail-pj1-x1049.google.com with SMTP id
 x10-20020a17090abc8a00b001a04877d05bso838361pjr.5
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 11:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=R/BZWfb0tTrWvfD3BOIAavtTgkGZsCPd+KtL4STW4wo=;
 b=AQ1vvUVZoFeBVJQTMY/h8hntqEgEeL9zBU6R9TAC8Py9m3mNT4Tx048lH4q9KZzd4n
 XjAIBKZIFLSBE/HnaWnif6LOc1Sa6EQY7dXM02BabGHnLng/uatVOAXye+4N1+t7ebmM
 +iDBNtJHhpGJXIm06wZlXn43Y4kX7+JFVN5w/7VfobueD7TiQFs6Be+mi5lFMVpT31C6
 Tl+xDHeACTDpJ0+7pGHwU42UaUQ7/CDuNRblPOO9joJH6NwgV4Ojs5iIocr7YB/KMNNo
 iOyeIuHbOZaOCxFQiXOcgvkwDFBuunUZfXAH4gYOgK9dKwD1nmCOW4xMAKwnWf1pqo+9
 XoNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=R/BZWfb0tTrWvfD3BOIAavtTgkGZsCPd+KtL4STW4wo=;
 b=C3On2YPc7on0vfNescRzISkikoGZkLBeVmeFbXCbbimZAGTH8wEE+ieBpu4h+0bS5W
 MYi7HV6loruPj24T54ndWyz8H+xQ5b94hRN0fmCQog0XkvEkeTa3r1kKkth9y7aFJ/WK
 e3xuKopce4V69+rukxyCusWrUT8Ee6YHQvUKsY1Rx0/oplixAVgsGo856AzMxno16tK3
 e/Vf6DBXHKVib4aaOGCrSqPTzTy+/WMI+Gdfk9qiFtvPZiS/S5gtz+ZP6pzbQB4Fvt2v
 dS5qq9VcLAtRJI83SHRvqaX8f62lo8GcpnH2JGJWtUbqCokYoYtCjiHv8YF18BOaF4oa
 0h4A==
X-Gm-Message-State: AOAM5307/Bgp//8fOglxIfazMn+0vHIH0gh96wY9nMC/mpHVxjnCKGYG
 wlxIb9422QDaKXEMcsQkXjmXV/l33EpDJQ==
X-Google-Smtp-Source: ABdhPJzmmBhqBdU2azOXTigKrliUQeMio+7lOMFNDGiugXIh9y0UNjuWpePjykCW+e8HS6xd+9mfpGbUSbNofA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:6a86:b0:13f:f048:9778 with SMTP
 id n6-20020a1709026a8600b0013ff0489778mr6466173plk.27.1634841628027; Thu, 21
 Oct 2021 11:40:28 -0700 (PDT)
Date: Thu, 21 Oct 2021 11:39:55 -0700
In-Reply-To: <20211021183956.920822-1-wuhaotsh@google.com>
Message-Id: <20211021183956.920822-7-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211021183956.920822-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v2 6/7] hw/arm: quanta-gbs-bmc add i2c devices
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3HLRxYQgKCl0RPC5JONCBJJBG9.7JHL9HP-89Q9GIJIBIP.JMB@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
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

From: Patrick Venture <venture@google.com>

Adds supported i2c devices to the quanta-gbc-bmc board.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx_boards.c | 82 ++++++++++++++++++++++++-----------------
 1 file changed, 49 insertions(+), 33 deletions(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index cdb52b9922..b09919df81 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -258,10 +258,12 @@ static void quanta_gsj_fan_init(NPCM7xxMachine *machine, NPCM7xxState *soc)
 
 static void quanta_gbs_i2c_init(NPCM7xxState *soc)
 {
+    I2CSlave *i2c_mux;
+
+    /* i2c-0: */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 0), TYPE_PCA9546, 0x71);
+
     /*
-     * i2c-0:
-     *     pca9546@71
-     *
      * i2c-1:
      *     pca9535@24
      *     pca9535@20
@@ -270,46 +272,60 @@ static void quanta_gbs_i2c_init(NPCM7xxState *soc)
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
+     */
+
+    /* i2c-2: sbtsi@4c */
+
+    /* i2c-5: */
+    /* mb_fru */
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 5), 5, 0x50, 8192, 0);
+    i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 5),
+                                      TYPE_PCA9546, 0x71);
+    /* max31725 is tmp105 compatible. */
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 0), "tmp105", 0x54);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 1), "tmp105", 0x55);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 2), "tmp105", 0x5d);
+    /* fan_fru */
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 5, 0x51, 8192, 1);
+    /* hsbp_fru */
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 3), 5, 0x52, 8192, 2);
+
+    /*
      * i2c-6:
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
-     *         - channel 1: isil,isl68137@61
-     *         - channel 2: isil,isl68137@63
-     *         - channel 3: isil,isl68137@45
-     *
+     */
+
+    /* i2c-8: */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 8), "adm1272", 0x10);
+
+    /* i2c-9: */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 9), TYPE_PCA9546, 0x71);
+    /*
+     * - channel 0: isil,isl68137@60
+     * - channel 1: isil,isl68137@61
+     * - channel 2: isil,isl68137@63
+     * - channel 3: isil,isl68137@45
+     */
+
+    /*
      * i2c-10:
      *     pca9545@71
      *
      * i2c-11:
      *     pca9545@76
-     *
-     * i2c-12:
-     *     maxim,max34451@4e
-     *     isil,isl68137@5d
-     *     isil,isl68137@5e
-     *
+     */
+
+    /* i2c-12: */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 12), "max34451", 0x4e);
+    /*
+     * isil,isl68137@5d
+     * isil,isl68137@5e
+     */
+
+    /*
      * i2c-14:
      *     pca9545@70
      */
-- 
2.33.0.1079.g6e70778dc9-goog


