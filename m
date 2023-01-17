Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D13670D4D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 00:26:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHvJx-0001yv-Nd; Tue, 17 Jan 2023 18:24:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHvJt-0001y7-RJ; Tue, 17 Jan 2023 18:24:45 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHvJr-0003Jq-P9; Tue, 17 Jan 2023 18:24:45 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id B115B5C0192;
 Tue, 17 Jan 2023 18:24:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 17 Jan 2023 18:24:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1673997876; x=
 1674084276; bh=aTvYK618bdAdxFFQMkEDPzyZk3Psz4ozaHTPo4oCoUk=; b=U
 KIyVUmXsCnxG8/dYYW+RrrTDt5j4iXm7kUaDcqhl8VGYydtp2F9hZ4SDA56akBSR
 e3zwVVHOpJ6SDEzcZqL+Av27k3DHADGuqSkaMm5n8o/9DXgSx4YHuB0KS2V5Dzcv
 jOcqEg0fuA0b1J0lu+dHKFPN3NRJSg9kiRrYH37GF8pgJQkzJsBFVCXiD4o71oGw
 kUMFZxYJYtVG/6WcDddF1TmV9kpjnrjX8CgD1DsP1nLVnTauQKQU6oaoJU0ikrY5
 52ke9SDaN/iowTGJuY7G5+w0JdHDs/6beXHZkF2HNyNWjwnlBLXolmxASFvHMVNo
 xcX5fV/28SbUyh+2K36/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673997876; x=
 1674084276; bh=aTvYK618bdAdxFFQMkEDPzyZk3Psz4ozaHTPo4oCoUk=; b=m
 pB9BKJu17gPRQJFWETY29UgdxzvX9VjpKW51cGaracWaCz+W3zDITa2Dti0L58h+
 sTUWC1eSJ3Ya6pTCzD8Ae5ert6XliinFcFYOE+GPu7ylXnnHRIP3JG9fd8QH1YaV
 1i1n7iZitFxeI5BY4OAHUUCGh66HO0tyrThxPrtLpf+iNg554vh00kJ/n5XHg64c
 g7NuchJQaWdYZRJJ//wjOSz/5ojhV2lWsOBz/dSZ7snvwX2b/XLZzNdw6RrUW0rA
 6HpgpL1h7SCF+ene4RZ3xxVhQOUKHCruW+yRDQcFx3/7BCUSdXbqamUvankeOWni
 C8MmiwdU0TamLEJQ9fBrA==
X-ME-Sender: <xms:NC7HYziI7QQKX3qYzPbFYl3hUCeVK9_23haRn1R3eQ3nStYr2ASFuw>
 <xme:NC7HYwBsG-1W39qGQb6yM0lOuepCkmJPUfKFvhQCjq3I5DxktRrU7bMrIjHsFN1TV
 C_wqkL80RIrU-npZs8>
X-ME-Received: <xmr:NC7HYzFUFR8VP0AhiPdTTOWbIibpTXm_jzBFuiaag2Thj3MNHrR5RM6nJ4E_TGbS4AOKNynKp2yeT2A1a1lHERnvv6zkDi0KWMNLeF2mzXo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtjedguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgjfhggtgfgseht
 keertdertdejnecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigrshcuoehpvghtvg
 hrsehpjhgurdguvghvqeenucggtffrrghtthgvrhhnpedvhfevvefhtddvueevudelvedt
 ieehvdejjeeuvedtudegjeeileetheekgfeggeenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:NC7HYwRLyMWrLwB7TwCP5NkiokylCt9xxEOMttrxB-xL7IlgYJ2Ffg>
 <xmx:NC7HYwxNoQXOhyKXJRS36q4AIOifSPUevJJzo-kOXaFk3Kvl8KoGnQ>
 <xmx:NC7HY24y3UCtyDg_fbZPadIOycgS9pD7iyZCHHKXpc2AUgBUL-GQ0Q>
 <xmx:NC7HY_mq9cwr3dx3nJUxzQNE-D96Doe-LJTwBqo49ON00PhBJl_5_g>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 18:24:35 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, philmd@linaro.org
Subject: [PATCH v3 2/5] hw/arm/aspeed: Replace aspeed_eeprom_init with
 at24c_eeprom_init
Date: Tue, 17 Jan 2023 15:24:24 -0800
Message-Id: <20230117232427.74496-3-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117232427.74496-1-peter@pjd.dev>
References: <20230117232427.74496-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

aspeed_eeprom_init is an exact copy of at24c_eeprom_init, not needed.

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


