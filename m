Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFDE563DC6
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 04:34:44 +0200 (CEST)
Received: from localhost ([::1]:53160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7Sy2-0007BG-Rc
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 22:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o7Swi-0006DN-Ti; Fri, 01 Jul 2022 22:33:20 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:58905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o7Swg-00041M-Oh; Fri, 01 Jul 2022 22:33:20 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id E7B3E580BAD;
 Fri,  1 Jul 2022 22:33:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 01 Jul 2022 22:33:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1656729196; x=1656732796; bh=4jntDv6EJmmeMAXB9duP6bLit
 no9LepiBzIdU82xNTc=; b=qK25WMWrlCkO+AVqBmc8Y+578gMLy2zI0Lu3eoeEH
 JDqos7TdMOV3mQbrSrdBE7IttjOcqm110pc2rvCUneP9dPfkbkW1Hvg7wZDmOzaA
 SZFda7kni04pfSO1hKCWL4KEvHdzu3O4zDcwjxa1mS7QjXbbWZs+Uq3jkH8ZUu8R
 32EisqpFlXZ32SOlb8L7O5on9NKCsLvBKXcaqIFbRx6zdtelUNfpo1ULV4b1Z/Lq
 IkECu/izqIW10NuZkNuSem6khQNSrWOsVRkaI9TmBmab/O0gy8p2/bmQRdFhtslz
 67C5a6xzlyV5mxEDss/QsTtMP5eX74ltxCMIEGPfvpCJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=i9e814621.fm2;
 t=1656729196; x=1656732796; bh=4jntDv6EJmmeMAXB9duP6bLitno9Lepi
 BzIdU82xNTc=; b=sczlaCkvgmCnwvWncdVrw43gBKSVsK/3DO+V8KfRSuUDqhZn
 kbas2bS6mq9xp9rhfePjZ0cSe6gIz2F03DP8Yy5vJGYSY8OxlVaYa+fEvBm1DFmI
 Hxf5wASYSjQZlY4tDGcRklsk1Z1jQTcvN+pD23bLjMGJHe0fIuZCNuHIJCZuHgVE
 f/2WFdbQh6DFQqH3APpsPADxHtF+yEb3OpH5mYIoDaghjUBaolJ4HbyBMF1c6Z71
 4RP69J3AffX6vDnVWbSbFYw+bth4eDpd6ifDpOB/UFo8Zq5GWV31+BmiWLioGAy3
 HAVqvYbKMq+XQNjPpoDXGnFRW+szGm+F7gygNQ==
X-ME-Sender: <xms:a66_YpLbLWWbTkBmeX5BX0OsyXYZQyA_d05pg6sjhRMrSH9rwY45XQ>
 <xme:a66_YlLFWZb0XshKTIkk9twaWHnO_wK85aw9-rqMZfSjy_O44sVjHaw-j_jmMRXyW
 MaC4jmKOxg-NHpMbIY>
X-ME-Received: <xmr:a66_YhsIeaYHoYbBFA5kAfqQJ2xA97tzeE5u3uie595r1mJxkJF_Xvr9klk21A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehgedgiedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgggfestdekredt
 redttdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesph
 hjugdruggvvheqnecuggftrfgrthhtvghrnhepieegledthedvleehuedtheeufeegtdfg
 fefgveetleelteeiiedvfeduudejieeknecuffhomhgrihhnpehgihhthhhusgdrtghomh
 dpmhgvthgrrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:a66_YqYhmMabXOA7e-b_e5QrpeDq1BvCR8jRrsTrWcLMYFiJPVNc8A>
 <xmx:a66_YgY8TXJNxmxfRO7RMM7ao6HpnC9CkfrKtcUnb7CAA2B-a8izug>
 <xmx:a66_YuCOPhlAJ71kEuawjXd18DrXgamovSYDWQwNGE-faQW0-y_vYw>
 <xmx:bK6_YnXsqrkMgj74G_1gTPSzgc590U5uPuhyFyG_QUMgpbkmLrPpiw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Jul 2022 22:33:15 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, titusr@google.com, venture@google.com, clg@kaod.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: [PATCH v2] hw/i2c/pca954x: Add method to get channels
Date: Fri,  1 Jul 2022 19:33:13 -0700
Message-Id: <20220702023313.41402-1-peter@pjd.dev>
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

Accidentally included fby35.h in v1 while I was working on some other stuff.

Interdiff against v1:
  diff --git a/include/hw/arm/fby35.h b/include/hw/arm/fby35.h
  deleted file mode 100644
  index 1be3ae9a38..0000000000
  --- a/include/hw/arm/fby35.h
  +++ /dev/null
  @@ -1,13 +0,0 @@
  -/*
  - * Copyright (c) Meta Platforms, Inc. and affiliates. (http://www.meta.com)
  - *
  - * This code is licensed under the GPL version 2 or later. See the COPYING
  - * file in the top-level directory.
  - */
  -
  -#ifndef FBY35_H
  -#define FBY35_H
  -
  -void oby35_cl_soc_i2c_init(AspeedSoCState *s);
  -
  -#endif

 hw/arm/aspeed.c                  | 29 +++++++++--------------------
 hw/i2c/i2c_mux_pca954x.c         | 10 ++++++++++
 include/hw/i2c/i2c_mux_pca954x.h | 13 +++++++++++++
 3 files changed, 32 insertions(+), 20 deletions(-)

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


