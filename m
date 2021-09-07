Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CED4023B8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 09:02:03 +0200 (CEST)
Received: from localhost ([::1]:57180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNV7K-00042g-Bb
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 03:02:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mNV3w-0001LS-Vj
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 02:58:32 -0400
Received: from smtpout2.3005.mail-out.ovh.net ([46.105.54.81]:46603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mNV3u-0001MD-PC
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 02:58:32 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.208])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id BE51B13D965;
 Tue,  7 Sep 2021 06:58:27 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 7 Sep
 2021 08:58:27 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00205b91c49-d845-4261-b02f-d04b03168578,
 984F41D2D9692A95DAA6D5E609006558D983FB00) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH 09/10] aspeed/smc: Add default reset values
Date: Tue, 7 Sep 2021 08:58:21 +0200
Message-ID: <20210907065822.1152443-10-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907065822.1152443-1-clg@kaod.org>
References: <20210907065822.1152443-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4ff08ac0-4c0c-4284-bfbd-723739c52946
X-Ovh-Tracer-Id: 978125546031713129
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudefgedgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout2.3005.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This simplifies the reset handler and has the benefit to remove some
bad use of the segments array as an identifier of the controller model.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h |  1 +
 hw/ssi/aspeed_smc.c         | 52 +++++++++++++++++++------------------
 2 files changed, 28 insertions(+), 25 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index ee943228b96f..a1ca0e65c405 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -98,6 +98,7 @@ struct AspeedSMCClass {
     uint8_t nregs_timings;
     uint8_t conf_enable_w0;
     uint8_t max_peripherals;
+    const uint32_t *resets;
     const AspeedSegments *segments;
     hwaddr flash_window_base;
     uint32_t flash_window_size;
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 8e6b326f1fc9..59b62987db21 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -196,12 +196,9 @@
  * controller. These can be changed when board is initialized with the
  * Segment Address Registers.
  */
-static const AspeedSegments aspeed_2400_fmc_segments[];
 static const AspeedSegments aspeed_2400_spi1_segments[];
-static const AspeedSegments aspeed_2500_fmc_segments[];
 static const AspeedSegments aspeed_2500_spi1_segments[];
 static const AspeedSegments aspeed_2500_spi2_segments[];
-static const AspeedSegments aspeed_2600_fmc_segments[];
 
 #define ASPEED_SMC_FEATURE_DMA       0x1
 #define ASPEED_SMC_FEATURE_DMA_GRANT 0x2
@@ -686,7 +683,11 @@ static void aspeed_smc_reset(DeviceState *d)
     AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
     int i;
 
-    memset(s->regs, 0, sizeof s->regs);
+    if (asc->resets) {
+        memcpy(s->regs, asc->resets, sizeof s->regs);
+    } else {
+        memset(s->regs, 0, sizeof s->regs);
+    }
 
     /* Unselect all peripherals */
     for (i = 0; i < s->num_cs; ++i) {
@@ -700,27 +701,6 @@ static void aspeed_smc_reset(DeviceState *d)
                     asc->segment_to_reg(s, &asc->segments[i]));
     }
 
-    /* HW strapping flash type for the AST2600 controllers  */
-    if (asc->segments == aspeed_2600_fmc_segments) {
-        /* flash type is fixed to SPI for all */
-        s->regs[s->r_conf] |= (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE0);
-        s->regs[s->r_conf] |= (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE1);
-        s->regs[s->r_conf] |= (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE2);
-    }
-
-    /* HW strapping flash type for FMC controllers  */
-    if (asc->segments == aspeed_2500_fmc_segments) {
-        /* flash type is fixed to SPI for CE0 and CE1 */
-        s->regs[s->r_conf] |= (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE0);
-        s->regs[s->r_conf] |= (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE1);
-    }
-
-    /* HW strapping for AST2400 FMC controllers (SCU70). Let's use the
-     * configuration of the palmetto-bmc machine */
-    if (asc->segments == aspeed_2400_fmc_segments) {
-        s->regs[s->r_conf] |= (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE0);
-    }
-
     s->snoop_index = SNOOP_OFF;
     s->snoop_dummies = 0;
 }
@@ -1354,6 +1334,14 @@ static const TypeInfo aspeed_2400_smc_info = {
     .class_init = aspeed_2400_smc_class_init,
 };
 
+static const uint32_t aspeed_2400_fmc_resets[ASPEED_SMC_R_MAX] = {
+    /*
+     * CE0 and CE1 types are HW strapped in SCU70. Do it here to
+     * simplify the model.
+     */
+    [R_CONF] = CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE0,
+};
+
 static const AspeedSegments aspeed_2400_fmc_segments[] = {
     { 0x20000000, 64 * MiB }, /* start address is readonly */
     { 0x24000000, 32 * MiB },
@@ -1376,6 +1364,7 @@ static void aspeed_2400_fmc_class_init(ObjectClass *klass, void *data)
     asc->conf_enable_w0    = CONF_ENABLE_W0;
     asc->max_peripherals   = 5;
     asc->segments          = aspeed_2400_fmc_segments;
+    asc->resets            = aspeed_2400_fmc_resets;
     asc->flash_window_base = 0x20000000;
     asc->flash_window_size = 0x10000000;
     asc->features          = ASPEED_SMC_FEATURE_DMA;
@@ -1426,6 +1415,11 @@ static const TypeInfo aspeed_2400_spi1_info = {
     .class_init = aspeed_2400_spi1_class_init,
 };
 
+static const uint32_t aspeed_2500_fmc_resets[ASPEED_SMC_R_MAX] = {
+    [R_CONF] = (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE0 |
+                CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE1),
+};
+
 static const AspeedSegments aspeed_2500_fmc_segments[] = {
     { 0x20000000, 128 * MiB }, /* start address is readonly */
     { 0x28000000,  32 * MiB },
@@ -1446,6 +1440,7 @@ static void aspeed_2500_fmc_class_init(ObjectClass *klass, void *data)
     asc->conf_enable_w0    = CONF_ENABLE_W0;
     asc->max_peripherals   = 3;
     asc->segments          = aspeed_2500_fmc_segments;
+    asc->resets            = aspeed_2500_fmc_resets;
     asc->flash_window_base = 0x20000000;
     asc->flash_window_size = 0x10000000;
     asc->features          = ASPEED_SMC_FEATURE_DMA;
@@ -1571,6 +1566,12 @@ static void aspeed_2600_smc_reg_to_segment(const AspeedSMCState *s,
     }
 }
 
+static const uint32_t aspeed_2600_fmc_resets[ASPEED_SMC_R_MAX] = {
+    [R_CONF] = (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE0 |
+                CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE1 |
+                CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE2),
+};
+
 static const AspeedSegments aspeed_2600_fmc_segments[] = {
     { 0x0, 128 * MiB }, /* start address is readonly */
     { 128 * MiB, 128 * MiB }, /* default is disabled but needed for -kernel */
@@ -1591,6 +1592,7 @@ static void aspeed_2600_fmc_class_init(ObjectClass *klass, void *data)
     asc->conf_enable_w0    = CONF_ENABLE_W0;
     asc->max_peripherals   = 3;
     asc->segments          = aspeed_2600_fmc_segments;
+    asc->resets            = aspeed_2600_fmc_resets;
     asc->flash_window_base = 0x20000000;
     asc->flash_window_size = 0x10000000;
     asc->features          = ASPEED_SMC_FEATURE_DMA;
-- 
2.31.1


