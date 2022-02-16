Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA70F4B82C3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 09:17:12 +0100 (CET)
Received: from localhost ([::1]:47778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKFUr-0002U3-RZ
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 03:17:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nKFIM-0005lR-EC; Wed, 16 Feb 2022 03:04:17 -0500
Received: from [2607:f8b0:4864:20::1031] (port=46956
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nKFIG-00006m-Ak; Wed, 16 Feb 2022 03:04:10 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 t4-20020a17090a510400b001b8c4a6cd5dso1660678pjh.5; 
 Wed, 16 Feb 2022 00:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eMEPjrP9y57U7J65ci5n/jTlAjdYa97KNo48unGH2+k=;
 b=BM1hsLy6KRbK3NGD0y1nokvxrUK+klP1DV/wTUlLDuUx2Y3b2/TlyDITDOGjdk/9aw
 JKmV3C91EvsdZbKwCNu37mHmLj427hEYNVm0Vjk3Zxp13lKaUJbGqvSllc85Uspg9guE
 1EzJmuBwU0KzzOSC6tgBdY6bneEoqqTWYXaogpzqkfuGZcjuwy7S7f4mCVd2npfAkeDc
 pseaLJ8Ofwt0p5lfrai+P12WQ4CkhxTZwITD5A3xBFvl6YHZ+w3pNLlXsb+7OgQKyq/h
 Sm32uaBP+4Iw/2haP4AFeLHY/+rOCeAKOzGSKgoN5gOcFLSuvXL1LlXdHosifyfvIkKu
 FjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=eMEPjrP9y57U7J65ci5n/jTlAjdYa97KNo48unGH2+k=;
 b=KnybQl7XpPvLnqbvP1qcYAm9Yw0WZ5yDtfjCvUDGHC2O3IdygnRDhQSBFpG06zmVi8
 YEsiUidbm9kHLzjQe5K+7a76Osj9vsQmZ1OhZPsTxR30YowP4nOzNXy73b4dZz+Jr0M5
 g9oOX/fiUHZ46yj8MgArmEceGCgeYNpxY2w4B8PNCedC58G5M1hG262Eh/T1Y3i9TQ2+
 ykLzY3d5oVpFRQexrRduLol8wlGnXaah5zzyuW4tQ1bpSho0tIJzwd3o42cz9iq4cnIo
 yAbd6TfMIluerk2drzs0dASxkpy0pUYOqB2yKaSy9AF7EDzFipRVbKaHcMDfiBvOgblR
 RsaQ==
X-Gm-Message-State: AOAM531HcjTHhmONTYRTTZkt1ALwCmUjAMq3vJGlBMq1scT6UHSK6Ikb
 wW/BC3FM5Y1nWBVS/tUZY4I=
X-Google-Smtp-Source: ABdhPJx0VSrVjuYHLPcQUzlyqNITSkthOxTBOmJRQt/gLx2bWSBF3txTT0QUfRZwmEDFX0CwwTQ9fA==
X-Received: by 2002:a17:902:cecf:b0:149:4c30:6dd2 with SMTP id
 d15-20020a170902cecf00b001494c306dd2mr1379115plg.93.1644998646157; 
 Wed, 16 Feb 2022 00:04:06 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id om1sm20249023pjb.55.2022.02.16.00.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 00:04:05 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] arm: Remove swift-bmc machine
Date: Wed, 16 Feb 2022 18:33:54 +1030
Message-Id: <20220216080354.65257-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It was scheduled for removal in 7.0.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 docs/system/arm/aspeed.rst |  1 -
 hw/arm/aspeed.c            | 53 --------------------------------------
 2 files changed, 54 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index d8b102fa0ad0..60ed94f18759 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -22,7 +22,6 @@ AST2500 SoC based machines :
 - ``romulus-bmc``          OpenPOWER Romulus POWER9 BMC
 - ``witherspoon-bmc``      OpenPOWER Witherspoon POWER9 BMC
 - ``sonorapass-bmc``       OCP SonoraPass BMC
-- ``swift-bmc``            OpenPOWER Swift BMC POWER9 (to be removed in v7.0)
 - ``fp5280g2-bmc``         Inspur FP5280G2 BMC
 - ``g220a-bmc``            Bytedance G220A BMC
 
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index d911dc904fb3..9789a489047b 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -544,35 +544,6 @@ static void romulus_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338", 0x32);
 }
 
-static void swift_bmc_i2c_init(AspeedMachineState *bmc)
-{
-    AspeedSoCState *soc = &bmc->soc;
-
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "pca9552", 0x60);
-
-    /* The swift board expects a TMP275 but a TMP105 is compatible */
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "tmp105", 0x48);
-    /* The swift board expects a pca9551 but a pca9552 is compatible */
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9552", 0x60);
-
-    /* The swift board expects an Epson RX8900 RTC but a ds1338 is compatible */
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "ds1338", 0x32);
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9552", 0x60);
-
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", 0x4c);
-    /* The swift board expects a pca9539 but a pca9552 is compatible */
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "pca9552", 0x74);
-
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423", 0x4c);
-    /* The swift board expects a pca9539 but a pca9552 is compatible */
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "pca9552",
-                     0x74);
-
-    /* The swift board expects a TMP275 but a TMP105 is compatible */
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 12), "tmp105", 0x48);
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 12), "tmp105", 0x4a);
-}
-
 static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
@@ -1102,26 +1073,6 @@ static void aspeed_machine_sonorapass_class_init(ObjectClass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 };
 
-static void aspeed_machine_swift_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
-
-    mc->desc       = "OpenPOWER Swift BMC (ARM1176)";
-    amc->soc_name  = "ast2500-a1";
-    amc->hw_strap1 = SWIFT_BMC_HW_STRAP1;
-    amc->fmc_model = "mx66l1g45g";
-    amc->spi_model = "mx66l1g45g";
-    amc->num_cs    = 2;
-    amc->i2c_init  = swift_bmc_i2c_init;
-    mc->default_ram_size       = 512 * MiB;
-    mc->default_cpus = mc->min_cpus = mc->max_cpus =
-        aspeed_soc_num_cpus(amc->soc_name);
-
-    mc->deprecation_reason = "redundant system. Please use a similar "
-        "OpenPOWER BMC, Witherspoon or Romulus.";
-};
-
 static void aspeed_machine_witherspoon_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1277,10 +1228,6 @@ static const TypeInfo aspeed_machine_types[] = {
         .name          = MACHINE_TYPE_NAME("romulus-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_romulus_class_init,
-    }, {
-        .name          = MACHINE_TYPE_NAME("swift-bmc"),
-        .parent        = TYPE_ASPEED_MACHINE,
-        .class_init    = aspeed_machine_swift_class_init,
     }, {
         .name          = MACHINE_TYPE_NAME("sonorapass-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
-- 
2.34.1


