Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C790866ACDC
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 18:03:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGjvB-0005gm-KV; Sat, 14 Jan 2023 12:02:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pGjuu-0005IK-8e; Sat, 14 Jan 2023 12:02:05 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pGjus-0005SL-A1; Sat, 14 Jan 2023 12:02:04 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 7CAF25C005F;
 Sat, 14 Jan 2023 12:02:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sat, 14 Jan 2023 12:02:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1673715721; x=1673802121; bh=L/
 GH9cdnvg0lIU0xfNtMpKNT2uY6POXSKWNeuYP2cNY=; b=hQ6pKwuBCIF+5JfN4S
 bK9iGFIQTlpJE6CdR0Ssil/Ws4c40l/mKBH+/1BU/SGkgFo0Qb+kY534veDhRDyx
 dn9vfTmTmyMvub+wq3bMoG2Qfr57tOOJNaRSGBBJejtXZaMrGQ8hIglNe0kdQfNl
 4kpqlrcrLCUEZzGBcgEpD/wevAWUB/Rsm2WMefTcPS3HQAo7BAZ2roqGUUD4eYbK
 9VZ8zzYEsKK9ZYEzv+MM3KOq+mrBdUSDYmWt0YzU/KOIpLk6XtdjHvOAhRGnx6bI
 KudQQr+dHlYtj5meQW9YosCMy5Ph7eScOwerEo8qInsQ0pD6B9uB68ZIY5PlQIx1
 6FGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673715721; x=1673802121; bh=L/GH9cdnvg0lI
 U0xfNtMpKNT2uY6POXSKWNeuYP2cNY=; b=nynKQ66/LWgh14xVt0aO40S4Ylzgc
 8bKbW/7CLtO75eG6SVHnMq6wRA2h/V9Ev5KbSLGQ7NXlB8mLl9ejfeq4AqJB7YLN
 z9mUshtuoCc22Gxf0KD9fOOR/zufQvSOtD5VTHptnHrsdf3H6Fee3nB9CxRRvull
 DZQxOnCTSJweAKAI5VgC0UrPH3WXU3U7DmigmM/R6ibLQf31s67PWlW3yoytsJY+
 G6bSnGqfYyCHk1KOxHE9AUQwryabTUHGa47aEPZF3AOF1Is1hXcz7yCHG+ys222R
 IaEyrspXNup47VHnPEAc/fNq5BTVSq4ziVXKihwgo7E7H9RV0joALLcSw==
X-ME-Sender: <xms:CeDCY9FKZXKioexzbQhuZb90Py9WyM4EaL_dG97-bJnymDAYQDl7Tw>
 <xme:CeDCYyW9-jQTlzAYZ16YMP3QtEfds9h_gu8FxHkGKJyRo-ORDOkqewh9WstK2bnit
 QB2O0A9tBPv4pKfA10>
X-ME-Received: <xmr:CeDCY_IeLkAFLN-8sUz8X0kWFF_Cqj9lBw5Z6M99pmdEZ4tMTjGMZe2MT7Yf0ydqyVK9ry7Z25-ryVsm1uVWHDY-SkyrbWz8ZWgt0-_7enU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddttddgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhepteelgfeuleeffffffeekiefghfejuefgtdfgteeigeekvdefffevieek
 vdelteevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:CeDCYzEFbGs1jXHAZwRXja0yrbfnB-YXU0ggC5N2O0NB69HJ7pM-Bw>
 <xmx:CeDCYzUAGE16CzENcViD6wNaRbvFCTaSbsTL6EkrVNghqUV8ttjTDA>
 <xmx:CeDCY-NQKgu-XXfxG7j6AiNRqu2Db6Vl2dEzE1vJL1F0wQj0KIE5Jg>
 <xmx:CeDCY_qnSqU2a9yVEswwgSpz46e2627Z_fFuVU-jxckg_R6q2ReTCg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jan 2023 12:02:00 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: patrick@stwcx.xyz, peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joal@jms.id.au, hskinnemoen@google.com,
 kfting@nuvoton.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 3/6] hw/arm/aspeed: Replace aspeed_eeprom_init with
 at24c_eeprom_init
Date: Sat, 14 Jan 2023 09:01:48 -0800
Message-Id: <20230114170151.87833-4-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114170151.87833-1-peter@pjd.dev>
References: <20230114170151.87833-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=peter@pjd.dev;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/arm/aspeed.c | 95 ++++++++++++++++++++++---------------------------
 1 file changed, 43 insertions(+), 52 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 1f9799d4321e..c929c61d582a 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -660,15 +660,6 @@ static void g220a_bmc_i2c_init(AspeedMachineState *bmc)
                           eeprom_buf);
 }
 
-static void aspeed_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
-{
-    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
-    DeviceState *dev = DEVICE(i2c_dev);
-
-    qdev_prop_set_uint32(dev, "rom-size", rsize);
-    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
-}
-
 static void fp5280g2_bmc_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
@@ -701,7 +692,7 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
     AspeedSoCState *soc = &bmc->soc;
     I2CSlave *i2c_mux;
 
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 0), 0x51, 32 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 0), 0x51, 32 * KiB);
 
     create_pca9552(soc, 3, 0x61);
 
@@ -714,9 +705,9 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
                      0x4a);
     i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4),
                                       "pca9546", 0x70);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x52, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x52, 64 * KiB);
     create_pca9552(soc, 4, 0x60);
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), TYPE_TMP105,
@@ -727,8 +718,8 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
     create_pca9552(soc, 5, 0x61);
     i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5),
                                       "pca9546", 0x70);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), TYPE_TMP105,
                      0x48);
@@ -738,10 +729,10 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
                      0x4b);
     i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6),
                                       "pca9546", 0x70);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x50, 64 * KiB);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 3), 0x51, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x50, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 3), 0x51, 64 * KiB);
 
     create_pca9552(soc, 7, 0x30);
     create_pca9552(soc, 7, 0x31);
@@ -754,15 +745,15 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), TYPE_TMP105,
                      0x48);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "max31785", 0x52);
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x50, 64 * KiB);
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x51, 64 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x50, 64 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x51, 64 * KiB);
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), TYPE_TMP105,
                      0x48);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), TYPE_TMP105,
                      0x4a);
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x50, 64 * KiB);
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51, 64 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x50, 64 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51, 64 * KiB);
     create_pca9552(soc, 8, 0x60);
     create_pca9552(soc, 8, 0x61);
     /* Bus 8: ucd90320@11 */
@@ -771,11 +762,11 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", 0x4c);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", 0x4d);
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 9), 0x50, 128 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 9), 0x50, 128 * KiB);
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423", 0x4c);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423", 0x4d);
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 10), 0x50, 128 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 10), 0x50, 128 * KiB);
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), TYPE_TMP105,
                      0x48);
@@ -783,18 +774,18 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
                      0x49);
     i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11),
                                       "pca9546", 0x70);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
     create_pca9552(soc, 11, 0x60);
 
 
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 13), 0x50, 64 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 13), 0x50, 64 * KiB);
     create_pca9552(soc, 13, 0x60);
 
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 14), 0x50, 64 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 14), 0x50, 64 * KiB);
     create_pca9552(soc, 14, 0x60);
 
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x50, 64 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x50, 64 * KiB);
     create_pca9552(soc, 15, 0x60);
 }
 
@@ -838,45 +829,45 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4c);
     i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4d);
 
-    aspeed_eeprom_init(i2c[19], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[20], 0x50, 2 * KiB);
-    aspeed_eeprom_init(i2c[22], 0x52, 2 * KiB);
+    at24c_eeprom_init(i2c[19], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[20], 0x50, 2 * KiB);
+    at24c_eeprom_init(i2c[22], 0x52, 2 * KiB);
 
     i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x48);
     i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x49);
     i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x4a);
     i2c_slave_create_simple(i2c[3], TYPE_TMP422, 0x4c);
 
-    aspeed_eeprom_init(i2c[8], 0x51, 64 * KiB);
+    at24c_eeprom_init(i2c[8], 0x51, 64 * KiB);
     i2c_slave_create_simple(i2c[8], TYPE_LM75, 0x4a);
 
     i2c_slave_create_simple(i2c[50], TYPE_LM75, 0x4c);
-    aspeed_eeprom_init(i2c[50], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[50], 0x52, 64 * KiB);
     i2c_slave_create_simple(i2c[51], TYPE_TMP75, 0x48);
     i2c_slave_create_simple(i2c[52], TYPE_TMP75, 0x49);
 
     i2c_slave_create_simple(i2c[59], TYPE_TMP75, 0x48);
     i2c_slave_create_simple(i2c[60], TYPE_TMP75, 0x49);
 
-    aspeed_eeprom_init(i2c[65], 0x53, 64 * KiB);
+    at24c_eeprom_init(i2c[65], 0x53, 64 * KiB);
     i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x49);
     i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x48);
-    aspeed_eeprom_init(i2c[68], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[69], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[70], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[71], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[68], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[69], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[70], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[71], 0x52, 64 * KiB);
 
-    aspeed_eeprom_init(i2c[73], 0x53, 64 * KiB);
+    at24c_eeprom_init(i2c[73], 0x53, 64 * KiB);
     i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x49);
     i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x48);
-    aspeed_eeprom_init(i2c[76], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[77], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[78], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[79], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[28], 0x50, 2 * KiB);
+    at24c_eeprom_init(i2c[76], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[77], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[78], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[79], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[28], 0x50, 2 * KiB);
 
     for (int i = 0; i < 8; i++) {
-        aspeed_eeprom_init(i2c[81 + i * 8], 0x56, 64 * KiB);
+        at24c_eeprom_init(i2c[81 + i * 8], 0x56, 64 * KiB);
         i2c_slave_create_simple(i2c[82 + i * 8], TYPE_TMP75, 0x48);
         i2c_slave_create_simple(i2c[83 + i * 8], TYPE_TMP75, 0x4b);
         i2c_slave_create_simple(i2c[84 + i * 8], TYPE_TMP75, 0x4a);
@@ -947,11 +938,11 @@ static void fby35_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(i2c[12], TYPE_LM75, 0x4e);
     i2c_slave_create_simple(i2c[12], TYPE_LM75, 0x4f);
 
-    aspeed_eeprom_init(i2c[4], 0x51, 128 * KiB);
-    aspeed_eeprom_init(i2c[6], 0x51, 128 * KiB);
-    aspeed_eeprom_init(i2c[8], 0x50, 32 * KiB);
-    aspeed_eeprom_init(i2c[11], 0x51, 128 * KiB);
-    aspeed_eeprom_init(i2c[11], 0x54, 128 * KiB);
+    at24c_eeprom_init(i2c[4], 0x51, 128 * KiB);
+    at24c_eeprom_init(i2c[6], 0x51, 128 * KiB);
+    at24c_eeprom_init(i2c[8], 0x50, 32 * KiB);
+    at24c_eeprom_init(i2c[11], 0x51, 128 * KiB);
+    at24c_eeprom_init(i2c[11], 0x54, 128 * KiB);
 
     /*
      * TODO: There is a multi-master i2c connection to an AST1030 MiniBMC on
-- 
2.39.0


