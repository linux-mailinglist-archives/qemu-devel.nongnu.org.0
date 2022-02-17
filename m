Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A6B4B9D65
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 11:42:04 +0100 (CET)
Received: from localhost ([::1]:38892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKeEd-0007O5-Jh
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 05:42:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nKe4v-0001JF-5H; Thu, 17 Feb 2022 05:32:01 -0500
Received: from [2607:f8b0:4864:20::62d] (port=39672
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nKe4s-0004bZ-5s; Thu, 17 Feb 2022 05:32:00 -0500
Received: by mail-pl1-x62d.google.com with SMTP id w1so4285797plb.6;
 Thu, 17 Feb 2022 02:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q1hFrB3/1Vkn+cfwbERChzPhdXnxcaeuz5jslwTFo7Y=;
 b=HraHczViMI4J3J10KHBs0O8YFAVGiQLrQAdIZ39KPNOqe7NO15/4xJpplKNAxHIirb
 zsP7jGIED6DGZRpxtZ7swqrROpVyvByHGbDMIGxasI7biB1lPSkYPf9C8/A1f7DHbREu
 ykcemlCr+9LXG5FPqH1gRjxz5Ym63lzOryu/VsvsMqkPkJbJNGZp18JgL0yDF5/M9r9v
 5TFC0fFVkAnG1mXsQxbuGCCp9fBcKLLtwzzX5wS493OSbBfBlhy7ANe5rM5pL80ZEJE2
 +1dnNrG/QnGa2X5/zr+hCfr3QvXc9JRcaDHJXHIplFPht4yprCIHYPkq0wGiurtXgtMC
 CZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Q1hFrB3/1Vkn+cfwbERChzPhdXnxcaeuz5jslwTFo7Y=;
 b=zbYY67UZSWvkvOXprJDQWe2dyLn1LPqGzvMt13MC4+h4RHjiWjN5T3Uj++O5hXjpvh
 IZnaFlsGHaOII3kOFcx9voHjvoGW83GB+gIHqUktcDVm0QUoTGsusQfx+uRKiGdEC//y
 QjLB6EqFdrzikSCtIAUOmO0jfUqsqXMQxso1EvLeCjwzfIt4+1GMVF2EOZVGkex48Yvm
 1IfShYE6NvaDbRAgSWf53I9WUBw0kZ9bexsnsph/UdG1KyKNyMpJcI5G5xtoaS84BwcE
 /HAe9Eh/Pz6Z8/I6r0YWr7pjDNIJeMzFnwkanaHpV4AoO/sy9YQ3I5pwl7xeSmAlia/Y
 9E1w==
X-Gm-Message-State: AOAM5334qhfZ2m2G/p34Rcsi7o8xgTqa7Gpz49GwEj/mDM2HSf9S+vMD
 EHjyWpa3Tqq1CJPoIVqiESc=
X-Google-Smtp-Source: ABdhPJyKRo+vi1jMrfTaS5a9UC4ccs9fS+gFH2SN/++7EyXGEJ8kDbKJuE94O2vKwylWGr3Sc/rHyw==
X-Received: by 2002:a17:902:7c13:b0:14f:177b:c51d with SMTP id
 x19-20020a1709027c1300b0014f177bc51dmr2352538pll.116.1645093914547; 
 Thu, 17 Feb 2022 02:31:54 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id k9sm44047933pfi.134.2022.02.17.02.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 02:31:53 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3] arm: Remove swift-bmc machine
Date: Thu, 17 Feb 2022 21:01:41 +1030
Message-Id: <20220217103141.385345-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=joel.stan@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, PDS_HP_HELO_NORDNS=0.978,
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
--
v2: also remove from docs/about/deprecated.rst
v3: remove strap define, add note to removed-features.rst
---
 docs/about/deprecated.rst       |  7 ----
 docs/about/removed-features.rst |  5 +++
 docs/system/arm/aspeed.rst      |  1 -
 hw/arm/aspeed.c                 | 64 ---------------------------------
 4 files changed, 5 insertions(+), 72 deletions(-)

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
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index cb0575fd4975..4b831ea29176 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -588,6 +588,11 @@ The Raspberry Pi machines come in various models (A, A+, B, B+). To be able
 to distinguish which model QEMU is implementing, the ``raspi2`` and ``raspi3``
 machines have been renamed ``raspi2b`` and ``raspi3b``.
 
+Aspeed ``swift-bmc`` machine (removed in 7.0)
+'''''''''''''''''''''''''''''''''''''''''''''
+
+This machine was removed because it was unused. Alternative AST2500 based
+OpenPOWER machines are ``witherspoon-bmc`` and ``romulus-bmc``.
 
 linux-user mode CPUs
 --------------------
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
index d911dc904fb3..faf7a9fd6863 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -106,17 +106,6 @@ struct AspeedMachineState {
         SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       \
         SCU_AST2500_HW_STRAP_RESERVED1)
 
-/* Swift hardware value: 0xF11AD206 */
-#define SWIFT_BMC_HW_STRAP1 (                                           \
-        AST2500_HW_STRAP1_DEFAULTS |                                    \
-        SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                     \
-        SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE |                        \
-        SCU_AST2500_HW_STRAP_UART_DEBUG |                               \
-        SCU_AST2500_HW_STRAP_DDR4_ENABLE |                              \
-        SCU_H_PLL_BYPASS_EN |                                           \
-        SCU_AST2500_HW_STRAP_ACPI_ENABLE |                              \
-        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
-
 #define G220A_BMC_HW_STRAP1 (                                      \
         SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                     \
         SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE |                        \
@@ -544,35 +533,6 @@ static void romulus_bmc_i2c_init(AspeedMachineState *bmc)
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
@@ -1102,26 +1062,6 @@ static void aspeed_machine_sonorapass_class_init(ObjectClass *oc, void *data)
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
@@ -1277,10 +1217,6 @@ static const TypeInfo aspeed_machine_types[] = {
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


