Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CD242C173
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 15:34:33 +0200 (CEST)
Received: from localhost ([::1]:55632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maeOu-0001H7-4Y
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 09:34:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangzq.jn@gmail.com>)
 id 1maYeZ-0005Kf-43; Wed, 13 Oct 2021 03:26:19 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:40700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wangzq.jn@gmail.com>)
 id 1maYeX-00032F-CC; Wed, 13 Oct 2021 03:26:18 -0400
Received: by mail-pf1-x441.google.com with SMTP id o133so1654968pfg.7;
 Wed, 13 Oct 2021 00:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cu71r+msydeNM6iUsua0SVZqSyX3/DBDUuYF5GbaFDA=;
 b=l/FCdsOqX1HsQ0yWQNC5eZ7nGuloDJNSNPeWFZEtYLcIY9Bmqg7wa80xWvXa+psRq8
 nl9+y6yb2BLc4sOhAYDBMU6JQHSS//F2Vd3qgltJg2RtGGamXmBRLg6zpraPAW8hKSbj
 576b2/h1PDXEvbDzte8qHZVWHBsfMrZbm88kl1OoOoIDfihJFwk3cP38emX2mDb3wV4V
 lHUa2WNqodTcj7Cidw8+2OX1+bgQ4iK9xRoa8iq1dLEgTHraEaODME8eGk+5RKqyteZ6
 eh/Ee2WqnVhQmUXCpMfh7BKnZ2g8ZxVOUNK7ouWSvgkW75mpJ9hSVPgyrkbNJC38EGBi
 dY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cu71r+msydeNM6iUsua0SVZqSyX3/DBDUuYF5GbaFDA=;
 b=Svo1/QkswoZDvTmk0DfMhy42v/NoKE1Pm17DjeQ+2BYlINuER1e/zIuIvb4T3dJr+x
 9stm6UEJ+8Byy7tJbgeatt3PN6oY37psRhE/VOhAfOG4XYbXgv8AhEwDoLLuhcPXF3qz
 iYUdqnhh/v5gWI2BBscfgQWSawyJDN7hP83Nf1SFRf019qOYfUoSCkSyfK7m2eWC8JXc
 cyHWXnq424pO5wwHpzMGw3lVgCdUjtO2utjE8OqKsYJi1Vb+zBnVa3qyvdMIa0ws3Goo
 1O0lmY2KDDBsmXGlbZOKR6sH2zV82ZE5qg6AqpjYDviTdXGrol3SM0KlcR361QfSSF4R
 beiQ==
X-Gm-Message-State: AOAM532tYTaylPyUn2JY1yQYPt6Nnnhxj7UCOolmBjQ+0Hf6zF97j14w
 KgUhqGUQBHh/mXRYmk+N1rs=
X-Google-Smtp-Source: ABdhPJx6VV/a2POn/ZlxAXlVXZRolfi4NbxhuSwSjLOIpkW9F6e/Y0cqEM4yMO7R/sw9rYbODzUJog==
X-Received: by 2002:a63:83c7:: with SMTP id
 h190mr11137822pge.440.1634109971024; 
 Wed, 13 Oct 2021 00:26:11 -0700 (PDT)
Received: from localhost (95.169.4.245.16clouds.com. [95.169.4.245])
 by smtp.gmail.com with ESMTPSA id y22sm4915238pjj.33.2021.10.13.00.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 00:26:10 -0700 (PDT)
From: John Wang <wangzq.jn@gmail.com>
X-Google-Original-From: John Wang <wangzhiqiang02@inspur.com>
To: lintao.lc@inspur.com,
	liuxiwei@inspur.com,
	duanzhijia01@inspur.com
Subject: [PATCH] aspeed: Add support for the fp5280g2-bmc board
Date: Wed, 13 Oct 2021 15:26:07 +0800
Message-Id: <20211013072607.783612-1-wangzhiqiang02@inspur.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=wangzq.jn@gmail.com; helo=mail-pf1-x441.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Oct 2021 09:30:48 -0400
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fp5280g2-bmc is supported by OpenBMC, It's
based on the following device tree

https://github.com/openbmc/linux/blob/dev-5.10/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts

Signed-off-by: John Wang <wangzhiqiang02@inspur.com>
---
 hw/arm/aspeed.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 01c1747972..3587788f63 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -141,6 +141,21 @@ struct AspeedMachineState {
         SCU_AST2500_HW_STRAP_ACPI_ENABLE |                              \
         SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
 
+/* FP5280G2 hardware value: 0XF100D286 */
+#define FP5280G2_BMC_HW_STRAP1 (                                      \
+        SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                     \
+        SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE |                        \
+        SCU_AST2500_HW_STRAP_UART_DEBUG |                               \
+        SCU_AST2500_HW_STRAP_RESERVED28 |                               \
+        SCU_AST2500_HW_STRAP_DDR4_ENABLE |                              \
+        SCU_HW_STRAP_VGA_CLASS_CODE |                                   \
+        SCU_HW_STRAP_LPC_RESET_PIN |                                    \
+        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER) |                \
+        SCU_AST2500_HW_STRAP_SET_AXI_AHB_RATIO(AXI_AHB_RATIO_2_1) |     \
+        SCU_HW_STRAP_MAC1_RGMII |                                       \
+        SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       \
+        SCU_AST2500_HW_STRAP_RESERVED1)
+
 /* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) */
 #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
 
@@ -717,6 +732,17 @@ static void g220a_bmc_i2c_init(AspeedMachineState *bmc)
                           eeprom_buf);
 }
 
+static void fp5280g2_bmc_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc = &bmc->soc;
+
+    /* The fp5280g2 expects a TMP112 but a TMP105 is compatible */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), TYPE_TMP105,
+                     0x48);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), TYPE_TMP105,
+                     0x49);
+}
+
 static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
@@ -1082,6 +1108,24 @@ static void aspeed_machine_g220a_class_init(ObjectClass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 };
 
+static void aspeed_machine_fp5280g2_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       = "Inspur FP5280G2 BMC (ARM1176)";
+    amc->soc_name  = "ast2500-a1";
+    amc->hw_strap1 = FP5280G2_BMC_HW_STRAP1;
+    amc->fmc_model = "n25q512a";
+    amc->spi_model = "mx25l25635e";
+    amc->num_cs    = 2;
+    amc->macs_mask  = ASPEED_MAC0_ON | ASPEED_MAC1_ON;
+    amc->i2c_init  = fp5280g2_bmc_i2c_init;
+    mc->default_ram_size = 512 * MiB;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus =
+        aspeed_soc_num_cpus(amc->soc_name);
+};
+
 static void aspeed_machine_rainier_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1146,6 +1190,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name          = MACHINE_TYPE_NAME("g220a-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_g220a_class_init,
+    }, {
+        .name          = MACHINE_TYPE_NAME("fp5280g2-bmc"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_fp5280g2_class_init,
     }, {
         .name          = MACHINE_TYPE_NAME("quanta-q71l-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
-- 
2.30.2


