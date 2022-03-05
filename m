Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7C24CE15D
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 01:10:45 +0100 (CET)
Received: from localhost ([::1]:48176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQI0S-0000Da-Vn
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 19:10:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1nQHwx-0003Vx-8N; Fri, 04 Mar 2022 19:07:08 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:57161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1nQHwv-0004id-Gj; Fri, 04 Mar 2022 19:07:06 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id A05A95802D4;
 Fri,  4 Mar 2022 19:07:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 04 Mar 2022 19:07:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=8OwIuxp/tOnAPABR7tGIS5NMsw5NrC
 QqmaDjhe5cBP4=; b=nZ0phIp0MbQBPT1+z5QxOWi0OExj9UJ8sGl9FgZr0Esx5x
 3SCbs9HfmVEhEuLlOa2PmQuVOPMLK9uh6brF9ErxRbBJyy8Mbf2gg/+ciaD7SdWL
 1GT7+peYhCn52IYX/Sn8xCAKiGQAMBdlAcGKo41RQmqAjsoiOcg1L6HzQZBF2mTR
 DwjiLmFA84ccr6qRL8FF6Z0FOXd6/Mm9AeSMW+y9RsvlJkJZeJanJtt4o3l2HiOX
 o1Pmp3BqDshf8zqyWkqZSXqmTtiRcx2LZeyVKwXAV/wYsplAt5xseKZKfQa0VwSS
 zVNu2hNzgeR5QCcpGzeZNmPh8mppdv/Ajh+YhjVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=8OwIux
 p/tOnAPABR7tGIS5NMsw5NrCQqmaDjhe5cBP4=; b=HpuQuV0zPpUUJlHa0dhQFF
 ISv9ppkTHgaQ1uE9/NeI1FIO4hsK4mPnb068emyQe8WbRkHq95nmdZW+1n4Qofvz
 rb9cY3Xqbxq2o0d8vdS77WrAj5cyY78hsKcL0TzK5EjApWs8v7PFD1JOCHt1Eyrg
 +b0qvgJXxa9T1NFKo21Y6qOh1lyesOdqjA/ePPXDa9ME0IIHt4mG998S1ZUbfVDW
 Xg0aiG0vAuLwMoRhy4rPckmRUjb8U7Poi69P2Fm3eNhkZc/Wg3qiEb440gsP9b8r
 vDKXwfFxUnLlJ8s+eWS3lV3Sy0+ai5phRzaXrepLEyPITeZMrGKUsrdqppCH3aNg
 ==
X-ME-Sender: <xms:qKkiYvBLL4z0xSihSarnSW3vQysyXmRcPhVUqZfbr9lO_WbbAqUVAQ>
 <xme:qKkiYlgRk5dkFDpErahszS5FhlmuxDFXaeUG2ubhB_GmBKlkmTsFvfxVjwVaYxbIx
 QlcSvVWL6QoTr5vd6k>
X-ME-Received: <xmr:qKkiYqnKs-_AkDdE3i1hYSXZW1dsNAurEnCZ5dMun7kaoKf2AScAaOtUdBrGV-stF9NWErUBq52r_-cbP63jCcvGnfs86kLXd_okIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtledgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 hmihhsshhinhhgucfvqfcufhhivghlugculdeftddmnegfrhhlucfvnfffucdlvdefmden
 ogetfedtuddqtdduucdludehmdenogevohgrshhtrghlqdfhgeduvddqtddvucdludehtd
 dmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefrrght
 rhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenuc
 ggtffrrghtthgvrhhnpeduvdekueejfffhtddufeejjefhueeuueefhedthfduleevtddt
 keeivedvgefgieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtg
 homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:qKkiYhyMUD6mcDBS3ZIbi-krrfSHEbnm584Ig4RrrAMBvuQZUzrk1Q>
 <xmx:qKkiYkSUQJQ4Gtz8-g2ZeyH562LJrzAeTb0t59PX7BLHl6IUjIgR9g>
 <xmx:qKkiYkbVSkyMlJ95tbMAlUMPN10TRsxrZgpd3CKIPctqX8-Blzk2AA>
 <xmx:qKkiYpIC-R4cwYybesXxkJ90YjYxDEHtVCToEHsui5xlGfiST07ErQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Mar 2022 19:07:03 -0500 (EST)
From: Patrick Williams <patrick@stwcx.xyz>
To: 
Subject: [PATCH 2/2] hw/arm/aspeed: add Bletchley machine type
Date: Fri,  4 Mar 2022 18:06:56 -0600
Message-Id: <20220305000656.1944589-2-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220305000656.1944589-1-patrick@stwcx.xyz>
References: <20220305000656.1944589-1-patrick@stwcx.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.229; envelope-from=patrick@stwcx.xyz;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_SUSPICIOUS_NTLD=0.499, PDS_OTHER_BAD_TLD=1.997, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Patrick Williams <patrick@stwcx.xyz>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the 'bletchley-bmc' machine type based on the kernel DTS[1] and
hardware schematics available to me.  The i2c model is as complete as
the current QEMU models support, but in some cases I substituted devices
that are close enough for present functionality.  Strap registers are
kept the same as the AST2600-EVB until I'm able to confirm correct
values with physical hardware.

This has been tested with an openbmc image built from [2] plus a kernel
patch[3] for the SPI flash module.

1. https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts?id=a8c729e966c4e9d033242d948b0e53c2a62d32e2
2. https://github.com/openbmc/openbmc/commit/b9432b980d7f63f7512ffbcc7124386ba896dfc6
3. https://github.com/openbmc/linux/commit/25b566b9a9d7f5d4f10c1b7304007bdb286eefd7

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 hw/arm/aspeed.c | 77 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 617a1ecbdc..3dc2ede823 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -167,6 +167,11 @@ struct AspeedMachineState {
 #define FUJI_BMC_HW_STRAP1    0x00000000
 #define FUJI_BMC_HW_STRAP2    0x00000000
 
+/* Bletchley hardware value */
+/* TODO: Leave same as EVB for now. */
+#define BLETCHLEY_BMC_HW_STRAP1 AST2600_EVB_HW_STRAP1
+#define BLETCHLEY_BMC_HW_STRAP2 AST2600_EVB_HW_STRAP2
+
 /*
  * The max ram region is for firmwares that scan the address space
  * with load/store to guess how much RAM the SoC has.
@@ -901,6 +906,54 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
     }
 }
 
+#define TYPE_TMP421 "tmp421"
+
+static void bletchley_bmc_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc = &bmc->soc;
+    I2CBus *i2c[13] = {};
+    for (int i = 0; i < 13; i++) {
+        if ((i == 8) || (i == 11)) {
+            continue;
+        }
+        i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
+    }
+
+    /* Bus 0 - 5 all have the same config. */
+    for (int i = 0; i < 6; i++) {
+        /* Missing model: ti,ina230 @ 0x45 */
+        /* Missing model: mps,mp5023 @ 0x40 */
+        i2c_slave_create_simple(i2c[i], TYPE_TMP421, 0x4f);
+        /* Missing model: nxp,pca9539 @ 0x76, but PCA9552 works enough */
+        i2c_slave_create_simple(i2c[i], TYPE_PCA9552, 0x76);
+        i2c_slave_create_simple(i2c[i], TYPE_PCA9552, 0x67);
+        /* Missing model: fsc,fusb302 @ 0x22 */
+    }
+
+    /* Bus 6 */
+    at24c_eeprom_init(i2c[6], 0x56, 65536);
+    /* Missing model: nxp,pcf85263 @ 0x51 , but ds1338 works enough */
+    i2c_slave_create_simple(i2c[6], "ds1338", 0x51);
+
+
+    /* Bus 7 */
+    at24c_eeprom_init(i2c[7], 0x54, 65536);
+
+    /* Bus 9 */
+    i2c_slave_create_simple(i2c[9], TYPE_TMP421, 0x4f);
+
+    /* Bus 10 */
+    i2c_slave_create_simple(i2c[10], TYPE_TMP421, 0x4f);
+    /* Missing model: ti,hdc1080 @ 0x40 */
+    i2c_slave_create_simple(i2c[10], TYPE_PCA9552, 0x67);
+
+    /* Bus 12 */
+    /* Missing model: adi,adm1278 @ 0x11 */
+    i2c_slave_create_simple(i2c[12], TYPE_TMP421, 0x4c);
+    i2c_slave_create_simple(i2c[12], TYPE_TMP421, 0x4d);
+    i2c_slave_create_simple(i2c[12], TYPE_PCA9552, 0x67);
+}
+
 static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
 {
     return ASPEED_MACHINE(obj)->mmio_exec;
@@ -1224,6 +1277,26 @@ static void aspeed_machine_fuji_class_init(ObjectClass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 };
 
+
+static void aspeed_machine_bletchley_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       = "Facebook Bletchley BMC (Cortex-A7)";
+    amc->soc_name  = "ast2600-a3";
+    amc->hw_strap1 = BLETCHLEY_BMC_HW_STRAP1;
+    amc->hw_strap2 = BLETCHLEY_BMC_HW_STRAP2;
+    amc->fmc_model = "w25q01jvq";
+    amc->spi_model = NULL;
+    amc->num_cs    = 1;
+    amc->macs_mask = ASPEED_MAC2_ON;
+    amc->i2c_init  = bletchley_bmc_i2c_init;
+    mc->default_ram_size = 512 * MiB;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus =
+        aspeed_soc_num_cpus(amc->soc_name);
+}
+
 static const TypeInfo aspeed_machine_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
@@ -1277,6 +1350,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name          = MACHINE_TYPE_NAME("fuji-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_fuji_class_init,
+    }, {
+        .name          = MACHINE_TYPE_NAME("bletchley-bmc"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_bletchley_class_init,
     }, {
         .name          = TYPE_ASPEED_MACHINE,
         .parent        = TYPE_MACHINE,
-- 
2.34.1


