Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDAA36259F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 18:26:36 +0200 (CEST)
Received: from localhost ([::1]:60554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXRIh-0007vz-L4
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 12:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Qrp5YAcKCqccLUabYLNVVNSL.JVTXLTb-KLcLSUVUNUb.VYN@flex--venture.bounces.google.com>)
 id 1lXRGp-0006xl-RN
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:24:39 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:50620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Qrp5YAcKCqccLUabYLNVVNSL.JVTXLTb-KLcLSUVUNUb.VYN@flex--venture.bounces.google.com>)
 id 1lXRGn-0007rl-6X
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:24:39 -0400
Received: by mail-yb1-xb49.google.com with SMTP id v2so6730563ybc.17
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 09:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=G5qTrKtWflOMOAHzpRZ3MGKi+kEZJpERJ2RBhE2G/zY=;
 b=YXo0IROMRBoAQ18/O86PVaGAZueeOEALr/AvRltdYYJWvZjjG7z4/2sYDlkqafWsxK
 +KxnhgJtJH7P5h5wN4j8N7Z7BI8A340Hsh5ek3hhsVppSpvwKnmk8M79PqxIAMwgcZB2
 8HOiG6WrcNod+Q2rzhd50Hz937KWhVPAAP0c1PEJ/gPioCqPXHvU0efdwDxC7rmH6jo8
 LjlZGgwJ/HbPtNED8K5O3sMkyyuPFZ126hbTbNVprBqrNC64vmnjh06tihmJnM2HkXv3
 SkOBts7QO9ZVpWO9GEJTAbAROA1LB6uSATff+r+cbOzJ5nMSVJwzveRxd8O3/IgUMoOj
 P/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=G5qTrKtWflOMOAHzpRZ3MGKi+kEZJpERJ2RBhE2G/zY=;
 b=X0AqNgXyuZAA9K9o8VRgpjRJUdagXtE8Srdx6CVIChp1Inb8PDGNW44/z9lFQFVuHx
 hNdGkfXVYK/gtQ111Z6V2E8Tea2yLDEoRuYdw4TQFe15Ed8jHupLchAjO1cZabOPOtoN
 Hk26Ayr8YAA6XyrxqNMwQLo2ZmA3+cn1M8uoIXbHe6tUFy4HoU4LifA+Gbxphw9cvHPY
 LtaHQu/bNxOxhoqSP6+rl/F3nPJYd8Vftp5nvPJTwWFnAc/U7EhaRsVypkbhaXrP6UTr
 1ZLILsVi3rEiXsWT5b5hR4eVfFfKSXFKh7LyBmaTIOwEf8HiscwbB4c+XxZsQYuh5h/z
 rPMg==
X-Gm-Message-State: AOAM532iT2cXpsK7pnYD75KCEJRNGotVSKHRM1kGKF8oLOjATSnzPwk/
 16rSYpB/CcpoyLKe2yWy27IEiXeR631K
X-Google-Smtp-Source: ABdhPJwV6g0aOms7eXQMrAIR4aE6zSNdj+OUe+fJD7ShNh6W5uED7LuBna+XhoMvVB9HZgXSf0nlM5Aouk20
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:87b7:e98a:2eda:186])
 (user=venture job=sendgmr) by 2002:a25:cf08:: with SMTP id
 f8mr12960591ybg.88.1618590274476; Fri, 16 Apr 2021 09:24:34 -0700 (PDT)
Date: Fri, 16 Apr 2021 09:24:25 -0700
Message-Id: <20210416162426.3217033-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
Subject: [PATCH] aspeed: Add support for the quanta-q7l1-bmc board
From: Patrick Venture <venture@google.com>
To: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3Qrp5YAcKCqccLUabYLNVVNSL.JVTXLTb-KLcLSUVUNUb.VYN@flex--venture.bounces.google.com;
 helo=mail-yb1-xb49.google.com
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

The Quanta-Q71l BMC board is a board supported by OpenBMC.

Tested: Booted quanta-q71l firmware.
Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/aspeed.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index a17b75f494..4611996d21 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -138,6 +138,19 @@ struct AspeedMachineState {
 /* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) */
 #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
 
+/* Quanta-Q71l hardware value */
+#define QUANTA_Q71L_BMC_HW_STRAP1 (                                     \
+        SCU_AST2400_HW_STRAP_DRAM_SIZE(DRAM_SIZE_128MB) |               \
+        SCU_AST2400_HW_STRAP_DRAM_CONFIG(2/* DDR3 with CL=6, CWL=5 */) | \
+        SCU_AST2400_HW_STRAP_ACPI_DIS |                                 \
+        SCU_AST2400_HW_STRAP_SET_CLK_SOURCE(AST2400_CLK_24M_IN) |       \
+        SCU_HW_STRAP_VGA_CLASS_CODE |                                   \
+        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_PASS_THROUGH) |          \
+        SCU_AST2400_HW_STRAP_SET_CPU_AHB_RATIO(AST2400_CPU_AHB_RATIO_2_1) | \
+        SCU_HW_STRAP_SPI_WIDTH |                                        \
+        SCU_HW_STRAP_VGA_SIZE_SET(VGA_8M_DRAM) |                        \
+        SCU_AST2400_HW_STRAP_BOOT_MODE(AST2400_SPI_BOOT))
+
 /* AST2600 evb hardware value */
 #define AST2600_EVB_HW_STRAP1 0x000000C0
 #define AST2600_EVB_HW_STRAP2 0x00000003
@@ -433,6 +446,34 @@ static void palmetto_bmc_i2c_init(AspeedMachineState *bmc)
     object_property_set_int(OBJECT(dev), "temperature3", 110000, &error_abort);
 }
 
+static void quanta_q71l_bmc_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc = &bmc->soc;
+
+    /*
+     * The quanta-q71l platform expects tmp75s which are compatible with
+     * tmp105s.
+     */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 1), "tmp105", 0x4c);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 1), "tmp105", 0x4e);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 1), "tmp105", 0x4f);
+
+    /* TODO: i2c-1: Add baseboard FRU eeprom@54 24c64 */
+    /* TODO: i2c-1: Add Frontpanel FRU eeprom@57 24c64 */
+    /* TODO: Add Memory Riser i2c mux and eeproms. */
+
+    /* TODO: i2c-2: pca9546@74 */
+    /* TODO: i2c-2: pca9548@77 */
+    /* TODO: i2c-3: Add BIOS FRU eeprom@56 24c64 */
+    /* TODO: i2c-7: Add pca9546@70 */
+    /*        - i2c@0: pmbus@59 */
+    /*        - i2c@1: pmbus@58 */
+    /*        - i2c@2: pmbus@58 */
+    /*        - i2c@3: pmbus@59 */
+    /* TODO: i2c-7: Add PDB FRU eeprom@52 */
+    /* TODO: i2c-8: Add BMC FRU eeprom@50 */
+}
+
 static void ast2500_evb_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
@@ -728,6 +769,23 @@ static void aspeed_machine_palmetto_class_init(ObjectClass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 };
 
+static void aspeed_machine_quanta_q71l_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       = "Quanta-Q71l BMC (ARM926EJ-S)";
+    amc->soc_name  = "ast2400-a1";
+    amc->hw_strap1 = QUANTA_Q71L_BMC_HW_STRAP1;
+    amc->fmc_model = "n25q256a";
+    amc->spi_model = "mx25l25635e";
+    amc->num_cs    = 1;
+    amc->i2c_init  = quanta_q71l_bmc_i2c_init;
+    mc->default_ram_size       = 128 * MiB;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus =
+        aspeed_soc_num_cpus(amc->soc_name);
+}
+
 static void aspeed_machine_supermicrox11_bmc_class_init(ObjectClass *oc,
                                                         void *data)
 {
@@ -927,6 +985,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name          = MACHINE_TYPE_NAME("g220a-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_g220a_class_init,
+    }, {
+        .name          = MACHINE_TYPE_NAME("quanta-q71l-bmc"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_quanta_q71l_class_init,
     }, {
         .name          = TYPE_ASPEED_MACHINE,
         .parent        = TYPE_MACHINE,
-- 
2.31.1.368.gbe11c130af-goog


