Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 744F94B83C6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:14:48 +0100 (CET)
Received: from localhost ([::1]:58452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKGOd-0001qV-Bk
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:14:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nKFNy-0000bM-Cv; Wed, 16 Feb 2022 03:10:04 -0500
Received: from [2607:f8b0:4864:20::634] (port=39822
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nKFNw-00010V-7D; Wed, 16 Feb 2022 03:10:02 -0500
Received: by mail-pl1-x634.google.com with SMTP id w1so1422450plb.6;
 Wed, 16 Feb 2022 00:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r2qagDBHZKJijbwXgnAuNREYfndpa40VdxKRujMiZdc=;
 b=D/dA2q0yb/V2oSXCTawu5SJsChtQuxR/iyMnoTL6rgC/IsQLwL+yfZNagM0rV0pMsG
 MUrc2fEkhh4xVnYrNSDWOEHRRrMeLOy08yY/WwRuAyPn5CqbsNpVGR79rs5D4GkTr91f
 Ej/ajgcAoSoBuByqSHfg2+QSxgh9i9xTi1DFNhROfPftSTwJaZbgD9YAYh4KQqZglxzq
 JDIed0eKeN3FuLeMEInXjgXoYrouwTV4s459KKmgB9QxQzDP/Aww06NSJU/pC7Mow2if
 FbztdoQ9c8S/QChQnnc9Ov1tvcJv2PSfjgvCJiP751KQh4qNaQ162g+ePYKnw/j2Dg+q
 ZQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=r2qagDBHZKJijbwXgnAuNREYfndpa40VdxKRujMiZdc=;
 b=25gIYD9schWVxilXuf4iBHMUwhUCaTaBnlv4IzOEPRAJ9Vt0BSPMMPxg2tOvy7NUVz
 MEI5Cs5Mn5RXqs0uhiaY5wL3WH1yOdyPVKErLYgApQObOoqBeftoalu1PcxXbHaKIcQz
 7aG2/a/SoUGQla4fKDmttPChw1WbP8AnYVCPpCftmpVNBmm22DKt8LHsx3izh1zVC629
 ZfTaxmcMD09CtBSvOzh+UZBxlUC0C5TEcSWdDBCb844FH4G3hutKjZWBmCradY3LobnF
 LiVQ7BQfW9cghsjMmipmGSOHqb1p9Pybosy96uubIKvGBlR2BcAoqfVj/URBV7EnMX0a
 /mVg==
X-Gm-Message-State: AOAM530VRf7NicvCaAgah5VFsNWU+JfBQ0LWyu2KTCzcgWMe3k5gIdpg
 4RaAUsXseaN/94ij/SS6fpk=
X-Google-Smtp-Source: ABdhPJyzeAuNbCnzIIlGcPPBzZKVoRmY3E34/tgEfu0Bw4c9wxOKb6PpaX1a+bqvlsxX9SmUCOnUaw==
X-Received: by 2002:a17:90a:b017:b0:1b9:485b:3005 with SMTP id
 x23-20020a17090ab01700b001b9485b3005mr420310pjq.33.1644998997420; 
 Wed, 16 Feb 2022 00:09:57 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id q11sm46371154pfk.149.2022.02.16.00.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 00:09:56 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2] arm: Remove swift-bmc machine
Date: Wed, 16 Feb 2022 18:39:47 +1030
Message-Id: <20220216080947.65955-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=joel.stan@gmail.com; helo=mail-pl1-x634.google.com
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
v2: also remove from docs/about/deprecated.rst

 docs/about/deprecated.rst  |  7 -----
 docs/system/arm/aspeed.rst |  1 -
 hw/arm/aspeed.c            | 53 --------------------------------------
 3 files changed, 61 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 26d00812ba94..85773db631c1 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -315,13 +315,6 @@ Use the more generic event ``DEVICE_UNPLUG_GUEST_ERROR`` instead.
 System emulator machines
 ------------------------
 
-Aspeed ``swift-bmc`` machine (since 6.1)
-''''''''''''''''''''''''''''''''''''''''
-
-This machine is deprecated because we have enough AST2500 based OpenPOWER
-machines. It can be easily replaced by the ``witherspoon-bmc`` or the
-``romulus-bmc`` machines.
-
 PPC 405 ``taihu`` machine (since 7.0)
 '''''''''''''''''''''''''''''''''''''
 
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


