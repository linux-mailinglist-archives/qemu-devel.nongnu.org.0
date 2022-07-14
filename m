Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CEE5754BA
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 20:13:16 +0200 (CEST)
Received: from localhost ([::1]:56278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC3Ko-00009A-FZ
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 14:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3xVnQYggKCtYOM92GLK98GG8D6.4GEI6EM-56N6DFGF8FM.GJ8@flex--wuhaotsh.bounces.google.com>)
 id 1oC38s-0007Ky-1R
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:00:50 -0400
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a]:51010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3xVnQYggKCtYOM92GLK98GG8D6.4GEI6EM-56N6DFGF8FM.GJ8@flex--wuhaotsh.bounces.google.com>)
 id 1oC38o-0005aq-No
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:00:49 -0400
Received: by mail-pl1-x64a.google.com with SMTP id
 q4-20020a170902dac400b0016becde3dfbso555469plx.17
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 11:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=YlaS2Gn+M7J56MUm3aAdhmb9BSTR0X4xwnRU+8E1xMI=;
 b=CNEJcz1nSfXWGXIBA0teTIkG25KA8uB16ZNsqXOoHxrbNJV8jAQOWJzkwoUj/JVa/i
 KQ+RaD5taVhE0NrSD/A0bFCVJxRwYr4Ek6qcjsu3Eht1gdg6mwusYBLedDwgAEUJzVUd
 PcnWnz90xxTyVNJGPmXLqlLiXALYiN+bnzbz1u5x3DCBPb83E0lLoYAhasd6j1VOAZ6/
 hkPstTSJTMtUTSChO/OHpbtmWt4/RXF2jyuPOD/8Cr2qjFZfyF73nN5vIDoXYaNEIv61
 XRkSJ0/3sbDdaRtTMfdvs+KmrLvheOL+OLBSJaWKKPFABLEJoWXhEzGT4DseJDV7e1WB
 LM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=YlaS2Gn+M7J56MUm3aAdhmb9BSTR0X4xwnRU+8E1xMI=;
 b=PchKwdH0c9JDUJqlC8tHevhGhuOKvFsg2M7pjetlw9Spkmmbm0yXI1RBabv7bn8ngt
 FxYIJHpwqXcv0mgHDh1/VQimMv6DVRA3oQs3xV/AR9sfI8ALZ5w22jL6MZjpdJ5t3RRr
 jKCo17sSsKIYacACwGtKGvcvM5gYeXhZJDKr6zl00U/mMQp5TrWBLbJk48KmGyPf1tHT
 1v3yWmP1gomCpqAa9IBdoQ3qkLZXAcFB4sK1qPBlb1bJnZgIjXnIxWrLlzMke1k9OjLh
 RKGlIi0HDKpBDyEapo5nLUnewoO73D1T1uAlgpEAAVDP9ciPFbUnGepURX35ns4AxIES
 3zag==
X-Gm-Message-State: AJIora+Pdz5T1zwRGoEShJX4YasKVHOeQtk6zY0ph0t8GOg/lPI3eof7
 /nGqBAZc49jFclXj7ZZUIiFmKqcu8iF9tA==
X-Google-Smtp-Source: AGRyM1takRjtsRj9YELKBt6rmz4CQO7nQ0Nayu7Yh81SXM5TjN+LAL0+4Rk96EhjkfwAqEJ8YgRFdy1x4TpPZA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90b:3b43:b0:1ef:d89b:3454 with SMTP
 id ot3-20020a17090b3b4300b001efd89b3454mr17368056pjb.87.1657821637506; Thu,
 14 Jul 2022 11:00:37 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:00:06 -0700
In-Reply-To: <20220714180006.77360-1-wuhaotsh@google.com>
Message-Id: <20220714180006.77360-9-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714180006.77360-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH 8/8] hw/arm: quanta-gbs-bmc add i2c devices
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3xVnQYggKCtYOM92GLK98GG8D6.4GEI6EM-56N6DFGF8FM.GJ8@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
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

From: Patrick Venture <venture@google.com>

Adds supported i2c devices to the quanta-gbc-bmc board.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx_boards.c | 82 ++++++++++++++++++++++++-----------------
 1 file changed, 49 insertions(+), 33 deletions(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index b8337871ba..4bae5589f0 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -290,10 +290,12 @@ static void quanta_gsj_fan_init(NPCM7xxMachine *machine, NPCM7xxState *soc)
 
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
@@ -302,46 +304,60 @@ static void quanta_gbs_i2c_init(NPCM7xxState *soc)
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
2.37.0.170.g444d1eabd0-goog


