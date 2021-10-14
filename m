Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8B642D2E8
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 08:48:44 +0200 (CEST)
Received: from localhost ([::1]:52116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mauXi-0007mP-UD
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 02:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangzq.jn@gmail.com>)
 id 1mauV2-00066J-7Z; Thu, 14 Oct 2021 02:45:56 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:54928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wangzq.jn@gmail.com>)
 id 1mauV0-0003oq-FN; Thu, 14 Oct 2021 02:45:55 -0400
Received: by mail-pj1-x1041.google.com with SMTP id np13so4001831pjb.4;
 Wed, 13 Oct 2021 23:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZU1A7z7GSu62T5DXpbQO3k4fuKL5jrIa8WJwRlfA1GE=;
 b=HhOlq3VRHbICHIMMk52pv/cg9rQEEyOW/lRUe9fFJjn2fnbWoBzktR/X3+n53WzRd3
 tbcoAsklVwCnWpIBb+wBsQh+2xwXmGoAw5f5TEHAExdeuXcgCakbdWIPK159JBipf6I4
 OgcKpPZ0XuUnw16QYMIaXKLQy2y15MY252g0BvC8WKcKYbaY2rdGrIro7iOFFvDW7G5O
 M/Oo1pMe9kAvLKBZhds7oG2dv8xl3PwO8Qniwk/ePEKz5z/iVGMYphZlFsa1dCk+xjty
 pijYTfzBf/Mp+nZRlX9v4KPRBL6i03KRo733hbiC2kXpTtOKJVeDHmx1775RAKQuqe3P
 0KzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZU1A7z7GSu62T5DXpbQO3k4fuKL5jrIa8WJwRlfA1GE=;
 b=sqyN4bUzB6UNQedUJO5NWX/2SnIadKGVTu7rd3y9wvRkwRawVgWifbgtpJt9pzdFrm
 ny/m1ibvUSf985BL3jpyL0UmeEzsseuyvKFIA8HZEe2n7JNA2hJfGV8xpg4/ZvP42yvK
 fJFW7usSPU019wo5X7UthRIrXkMQZH3nlrxklwr88LB1uD/3zMYbMM4ZjkfL7RqhFnQi
 uMwEekQGxWO3mXPtq4p5zqtUy4XwHS32iS72XV6M/SBRBUthD5G46aGZCzVbDthV7CWr
 f8KyDIH//JN4TF3i6zPkwaUzjGAmdVnU+iNJS8k+N66yTC/1EAAINPAqpVJ0ik6nqTDC
 lF4w==
X-Gm-Message-State: AOAM532M3/qepee0iFhyvDPo2xhmUVNsrCzjZTXOKjm6AhABsETt4/Wg
 DGkztUtMNHup2QfWMtu9mK4=
X-Google-Smtp-Source: ABdhPJxcGTnbTuprUeF56aMbgSvOBs1cIUQIl0ViZFWrm4kXzknFKhotA7ApbCYe7L3+GbjLCIBsyQ==
X-Received: by 2002:a17:90a:4812:: with SMTP id
 a18mr18442880pjh.40.1634193952612; 
 Wed, 13 Oct 2021 23:45:52 -0700 (PDT)
Received: from localhost (95.169.4.245.16clouds.com. [95.169.4.245])
 by smtp.gmail.com with ESMTPSA id p4sm1377251pgc.15.2021.10.13.23.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 23:45:52 -0700 (PDT)
From: John Wang <wangzq.jn@gmail.com>
X-Google-Original-From: John Wang <wangzhiqiang02@inspur.com>
To: lintao.lc@inspur.com,
	liuxiwei@inspur.com,
	duanzhijia01@inspur.com
Subject: [PATCH v2] aspeed: Add support for the fp5280g2-bmc board
Date: Thu, 14 Oct 2021 14:45:48 +0800
Message-Id: <20211014064548.934799-1-wangzhiqiang02@inspur.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=wangzq.jn@gmail.com; helo=mail-pj1-x1041.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 hw/arm/aspeed.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 01c1747972..21b690334e 100644
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
 
@@ -456,6 +471,15 @@ static void aspeed_machine_init(MachineState *machine)
     arm_load_kernel(ARM_CPU(first_cpu), machine, &aspeed_board_binfo);
 }
 
+static void at24c_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
+{
+    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
+    DeviceState *dev = DEVICE(i2c_dev);
+
+    qdev_prop_set_uint32(dev, "rom-size", rsize);
+    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
+}
+
 static void palmetto_bmc_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
@@ -717,6 +741,34 @@ static void g220a_bmc_i2c_init(AspeedMachineState *bmc)
                           eeprom_buf);
 }
 
+static void fp5280g2_bmc_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc = &bmc->soc;
+    I2CSlave *i2c_mux;
+
+    /* The at24c256 */
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 1), 0x50, 32768);
+
+    /* The fp5280g2 expects a TMP112 but a TMP105 is compatible */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), TYPE_TMP105,
+                     0x48);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), TYPE_TMP105,
+                     0x49);
+
+    i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2),
+                     "pca9546", 0x70);
+    /* It expects a TMP112 but a TMP105 is compatible */
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 0), TYPE_TMP105,
+                     0x4a);
+
+    /* It expects a ds3232 but a ds1338 is good enough */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), "ds1338", 0x68);
+
+    /* It expects a pca9555 but a pca9552 is compatible */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), TYPE_PCA9552,
+                     0x20);
+}
+
 static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
@@ -1082,6 +1134,24 @@ static void aspeed_machine_g220a_class_init(ObjectClass *oc, void *data)
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
@@ -1146,6 +1216,10 @@ static const TypeInfo aspeed_machine_types[] = {
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


