Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25467563FF3
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 13:56:28 +0200 (CEST)
Received: from localhost ([::1]:34346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7bje-0000iD-MJ
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 07:56:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o7SRI-000367-Pd; Fri, 01 Jul 2022 22:00:52 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:37997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o7SRD-00027P-Ic; Fri, 01 Jul 2022 22:00:52 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id E8903580B96;
 Fri,  1 Jul 2022 22:00:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 01 Jul 2022 22:00:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1656727242; x=1656730842; bh=XVh3xclWtEtqU3hNp2ljoRATZ
 LY/YjsvzV22BVS2zG0=; b=37I/r6H+WAQ/0Kht/oSIb/SYEOJ/AnZ/6QrIWck4C
 sLxPFcpBiPwq8LBj5fbZOaoVUYWz8SAp0GgjgvB/AAeXTBh/QqlJA2q2Uq9Y9p0k
 vEXw9BsqEQ9i34UAf7HEh1idasmNew5u4fqm8m6Gm/yGG6+UGSRGR2j+NsEFUkrb
 OJt36/MiAUblqgCWXPHP9Q41v+kRWgFdz0xiqaGQSzq5u6yZFM1ko+osr6VMwyy4
 LDVESgtMt15Q6Xy2G/ay1rWlF+wDKZgYj3YXzOHeRskGxWDdG9pvQjBtwpgGM2iI
 Z/Dp+vDCpvcPm59U1/uuqD2cl0l6kagbDW+hz0l5UPU2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=i9e814621.fm2;
 t=1656727242; x=1656730842; bh=XVh3xclWtEtqU3hNp2ljoRATZLY/Yjsv
 zV22BVS2zG0=; b=IBWO7h+d/H+yzIscaah2bsiPf6tCQ1w6x4iVDizZmfvdZO0L
 7ypJ81fhaPQP0kGxPAtWWBo6f5R6ZpdXIYfFs/uaIcrvQeCak6zeBJ7Y5AIxFl8h
 jKxGUz54rHvWjldKSLc/O/6P9/mCEI4JEJ0xG3nBcKUO2ZnxhYOjbErZMZrhSMjm
 jQ6N/oSF8eaPV5rBKLxb5S3RNvUD9fXC2lvRb88zmsICcE/PIe0RMoId+cfZCAih
 99j5KZ+fRmcPdl59fA6kn2yR1t5EZRvKYnH8RrfKtPovp7KNHoKsj0W6x4GYPm/7
 XQelIm7fQ0VGLP817rob6gMVvI9kNc13fJ4wKA==
X-ME-Sender: <xms:yqa_YtDB3tXRMfRnljmfiG4aX0tZYn0CtkJdlLYDcYy6Rf0It1eLIw>
 <xme:yqa_YriBr4UWIfcLIuqJ3WGdW3LgE4h8BoPJuxOlGPxmMucyDbaNJ0rU2lg_ab1gZ
 jbfxKNxeenZRMNT65A>
X-ME-Received: <xmr:yqa_YonjRbdXXfNZvKW3r8cX2jIwSGBXmIuqISlZ5VbFyJuKMpM6B3mOPLhPcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehgedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheprfgvthgv
 rhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrfgrth
 htvghrnhepieegledthedvleehuedtheeufeegtdfgfefgveetleelteeiiedvfeduudej
 ieeknecuffhomhgrihhnpehgihhthhhusgdrtghomhdpmhgvthgrrdgtohhmnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhj
 ugdruggvvh
X-ME-Proxy: <xmx:yqa_YnxjXqgxjVEPRCB3ws-7gxKKq5q-pz43dMdikPeZjaetNiksYQ>
 <xmx:yqa_YiSIJfgBwaNwIRu4EOEYC2GSyiBcPsuTnO42Q-mQhuv9_bmtXw>
 <xmx:yqa_YqbrYZoqZ6pCoybWEcHjXwmnxHbGJcbq6UOqE1d3ub0VRuR3Bw>
 <xmx:yqa_YgfgocYHoWrL3t8HsHAKdntBN2GhddXQgjD5cSrS4ftdITtmIg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Jul 2022 22:00:41 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, clg@kaod.org,
 venture@google.com, titusr@google.com
Subject: [PATCH] hw/i2c/pca954x: Add method to get channels
Date: Fri,  1 Jul 2022 19:00:40 -0700
Message-Id: <20220702020040.33858-1-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.221; envelope-from=peter@pjd.dev;
 helo=new1-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 02 Jul 2022 07:53:45 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I added this helper in the Aspeed machine file a while ago to help
initialize fuji-bmc i2c devices. This moves it to the official pca954x
file so that other files can use it.

This does something very similar to pca954x_i2c_get_bus, but I think
this is useful when you have a very complicated dts with a lot of
switches, like the fuji dts.

This convenience method lets you write code that produces a flat array
of I2C buses that matches the naming in the dts. After that you can just
add individual sensors using the flat array of I2C buses.

See fuji_bmc_i2c_init to understand this point further.

The fuji dts is here for reference:

https://github.com/torvalds/linux/blob/40cb6373b46/arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/arm/aspeed.c                  | 29 +++++++++--------------------
 hw/i2c/i2c_mux_pca954x.c         | 10 ++++++++++
 include/hw/arm/fby35.h           | 13 +++++++++++++
 include/hw/i2c/i2c_mux_pca954x.h | 13 +++++++++++++
 4 files changed, 45 insertions(+), 20 deletions(-)
 create mode 100644 include/hw/arm/fby35.h

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 6fe9b13548..bee8a748ec 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -793,15 +793,6 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
     create_pca9552(soc, 15, 0x60);
 }
 
-static void get_pca9548_channels(I2CBus *bus, uint8_t mux_addr,
-                                 I2CBus **channels)
-{
-    I2CSlave *mux = i2c_slave_create_simple(bus, "pca9548", mux_addr);
-    for (int i = 0; i < 8; i++) {
-        channels[i] = pca954x_i2c_get_bus(mux, i);
-    }
-}
-
 #define TYPE_LM75 TYPE_TMP105
 #define TYPE_TMP75 TYPE_TMP105
 #define TYPE_TMP422 "tmp422"
@@ -814,20 +805,18 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
     for (int i = 0; i < 16; i++) {
         i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
     }
-    I2CBus *i2c180 = i2c[2];
-    I2CBus *i2c480 = i2c[8];
-    I2CBus *i2c600 = i2c[11];
 
-    get_pca9548_channels(i2c180, 0x70, &i2c[16]);
-    get_pca9548_channels(i2c480, 0x70, &i2c[24]);
+    pca954x_i2c_get_channels(i2c[2], 0x70, "pca9548", &i2c[16]);
+    pca954x_i2c_get_channels(i2c[8], 0x70, "pca9548", &i2c[24]);
     /* NOTE: The device tree skips [32, 40) in the alias numbering */
-    get_pca9548_channels(i2c600, 0x77, &i2c[40]);
-    get_pca9548_channels(i2c[24], 0x71, &i2c[48]);
-    get_pca9548_channels(i2c[25], 0x72, &i2c[56]);
-    get_pca9548_channels(i2c[26], 0x76, &i2c[64]);
-    get_pca9548_channels(i2c[27], 0x76, &i2c[72]);
+    pca954x_i2c_get_channels(i2c[11], 0x77, "pca9548", &i2c[40]);
+    pca954x_i2c_get_channels(i2c[24], 0x71, "pca9548", &i2c[48]);
+    pca954x_i2c_get_channels(i2c[25], 0x72, "pca9548", &i2c[56]);
+    pca954x_i2c_get_channels(i2c[26], 0x76, "pca9548", &i2c[64]);
+    pca954x_i2c_get_channels(i2c[27], 0x76, "pca9548", &i2c[72]);
     for (int i = 0; i < 8; i++) {
-        get_pca9548_channels(i2c[40 + i], 0x76, &i2c[80 + i * 8]);
+        pca954x_i2c_get_channels(i2c[40 + i], 0x76, "pca9548",
+                                 &i2c[80 + i * 8]);
     }
 
     i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4c);
diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
index 3945de795c..6b07804546 100644
--- a/hw/i2c/i2c_mux_pca954x.c
+++ b/hw/i2c/i2c_mux_pca954x.c
@@ -169,6 +169,16 @@ I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_t channel)
     return pca954x->bus[channel];
 }
 
+void pca954x_i2c_get_channels(I2CBus *bus, uint8_t address,
+                              const char *type_name, I2CBus **channels)
+{
+    I2CSlave *mux = i2c_slave_create_simple(bus, type_name, address);
+    Pca954xClass *pc = PCA954X_GET_CLASS(mux);
+    Pca954xState *pca954x = PCA954X(mux);
+
+    memcpy(channels, pca954x->bus, pc->nchans * sizeof(channels[0]));
+}
+
 static void pca9546_class_init(ObjectClass *klass, void *data)
 {
     Pca954xClass *s = PCA954X_CLASS(klass);
diff --git a/include/hw/arm/fby35.h b/include/hw/arm/fby35.h
new file mode 100644
index 0000000000..1be3ae9a38
--- /dev/null
+++ b/include/hw/arm/fby35.h
@@ -0,0 +1,13 @@
+/*
+ * Copyright (c) Meta Platforms, Inc. and affiliates. (http://www.meta.com)
+ *
+ * This code is licensed under the GPL version 2 or later. See the COPYING
+ * file in the top-level directory.
+ */
+
+#ifndef FBY35_H
+#define FBY35_H
+
+void oby35_cl_soc_i2c_init(AspeedSoCState *s);
+
+#endif
diff --git a/include/hw/i2c/i2c_mux_pca954x.h b/include/hw/i2c/i2c_mux_pca954x.h
index 3dd25ec983..3a676a30a9 100644
--- a/include/hw/i2c/i2c_mux_pca954x.h
+++ b/include/hw/i2c/i2c_mux_pca954x.h
@@ -16,4 +16,17 @@
  */
 I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_t channel);
 
+/**
+ * Creates an i2c mux and retrieves all of the channels associated with it.
+ *
+ * @bus: the i2c bus where the i2c mux resides.
+ * @address: the address of the i2c mux on the aforementioned i2c bus.
+ * @type_name: name of the i2c mux type to create.
+ * @channels: an output parameter specifying where to return the channels.
+ *
+ * Returns: None
+ */
+void pca954x_i2c_get_channels(I2CBus *bus, uint8_t address,
+                              const char *type_name, I2CBus **channels);
+
 #endif
-- 
2.37.0


