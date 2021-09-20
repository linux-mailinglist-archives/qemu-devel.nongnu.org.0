Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 170AF4119DB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:33:41 +0200 (CEST)
Received: from localhost ([::1]:42192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSMEe-0005YS-0L
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSM4n-0005xM-Q6
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:23:31 -0400
Received: from smtpout2.3005.mail-out.ovh.net ([46.105.54.81]:45917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSM4e-0004EN-Th
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:23:29 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.35])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 7F74C13ECEE;
 Mon, 20 Sep 2021 16:23:15 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 20 Sep
 2021 18:23:14 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0054674aa11-8963-4cbe-8d7c-77a3068bc233,
 C584E5EC745A9DFF7B561FC81DF43D5934FDEC9F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 09/12] aspeed/smc: Add default reset values
Date: Mon, 20 Sep 2021 18:23:06 +0200
Message-ID: <20210920162309.1091711-10-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920162309.1091711-1-clg@kaod.org>
References: <20210920162309.1091711-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 57a89890-66ce-4aac-9a31-0945ccc3f0ef
X-Ovh-Tracer-Id: 13074512669166373670
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeivddgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This simplifies the reset handler and has the benefit to remove some
"bad" use of the segments array as an identifier of the controller model.

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
index c534e9bf87ee..8cc7ccf45591 100644
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
@@ -1352,6 +1332,14 @@ static const TypeInfo aspeed_2400_smc_info = {
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
@@ -1374,6 +1362,7 @@ static void aspeed_2400_fmc_class_init(ObjectClass *klass, void *data)
     asc->conf_enable_w0    = CONF_ENABLE_W0;
     asc->max_peripherals   = 5;
     asc->segments          = aspeed_2400_fmc_segments;
+    asc->resets            = aspeed_2400_fmc_resets;
     asc->flash_window_base = 0x20000000;
     asc->flash_window_size = 0x10000000;
     asc->features          = ASPEED_SMC_FEATURE_DMA;
@@ -1424,6 +1413,11 @@ static const TypeInfo aspeed_2400_spi1_info = {
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
@@ -1444,6 +1438,7 @@ static void aspeed_2500_fmc_class_init(ObjectClass *klass, void *data)
     asc->conf_enable_w0    = CONF_ENABLE_W0;
     asc->max_peripherals   = 3;
     asc->segments          = aspeed_2500_fmc_segments;
+    asc->resets            = aspeed_2500_fmc_resets;
     asc->flash_window_base = 0x20000000;
     asc->flash_window_size = 0x10000000;
     asc->features          = ASPEED_SMC_FEATURE_DMA;
@@ -1569,6 +1564,12 @@ static void aspeed_2600_smc_reg_to_segment(const AspeedSMCState *s,
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
@@ -1589,6 +1590,7 @@ static void aspeed_2600_fmc_class_init(ObjectClass *klass, void *data)
     asc->conf_enable_w0    = CONF_ENABLE_W0;
     asc->max_peripherals   = 3;
     asc->segments          = aspeed_2600_fmc_segments;
+    asc->resets            = aspeed_2600_fmc_resets;
     asc->flash_window_base = 0x20000000;
     asc->flash_window_size = 0x10000000;
     asc->features          = ASPEED_SMC_FEATURE_DMA |
-- 
2.31.1


