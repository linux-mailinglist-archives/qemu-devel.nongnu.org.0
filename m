Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F8C5F716F
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 00:54:44 +0200 (CEST)
Received: from localhost ([::1]:57722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogZlL-0000zk-RX
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 18:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1ogZjO-0007kB-Ce; Thu, 06 Oct 2022 18:52:42 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:47673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1ogZjN-0001HV-0C; Thu, 06 Oct 2022 18:52:42 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 355DC5C00EF;
 Thu,  6 Oct 2022 18:52:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 06 Oct 2022 18:52:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1665096759; x=1665183159; bh=ALJ0NB/PSdOEcTUCf6E43qunL
 S7MEHN+obug10YvKSo=; b=FXnhn6i9dEg5vkugUduQqiVLXTbc4FRoLh5XFw9Z6
 9+WdBwZCecn0Rv/9eqPxyQTcogBUtVvXHwcdeFFdTL6lNh5aR97cVO0psp/cK/m9
 hPIpMCtZ0Gh+4FO9FlIU2+kuknssJMeo/scrtORVVhPcFSurp0z2d8IUXZvcKNcM
 mOcKokBFlcI19BDJ1kEIJ6oV7tnxh7RMEsSx+aJw2U9NHqzg+bZRdunrk3ew2fRP
 XlwPl6L2C3RjmRGbDUV1mWHhv+cu7Dp9GMpgwsIDnHO/CrRkyFqD+XWCkQa4juHL
 OvsLRawUvNo9Jua77cMbIG/hiVe8Sm/+9uFJMHxiC7DvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1665096759; x=1665183159; bh=ALJ0NB/PSdOEcTUCf6E43qunLS7MEHN+obu
 g10YvKSo=; b=i21TUM2woQSxeN0XZT09tvDEBq3T+h/ZZ7WGaKkPZIQDPnK4186
 GYxBKMfeWLl7a3i8QfF0z2cGtM9ftistfmlaCaWySXX4khnlb5lFZ6xqXHI1kjcY
 KVGbzmRS0FeiVABCyuX+iDMpKqqZtISVkpQYAhWw4uHgFjBbpT2N8CyMsTUAvNiH
 Ld/Rvy0HZNfJ9LgEjai2MoL7s/oYNhtqj+S1raEkyHDi10fsvK2v5arZLr0dhMnU
 xgSIA/ple7lks5K/Ye26vajrOqCg/27gDE9mq9wweH+ZJx9xUVYaPrU7TYZ2bQN3
 oknAOaZpvI874rTJdDsYhgFyGGcpyMv/2Yg==
X-ME-Sender: <xms:N1w_Y6U53yipKCCK7cdZnAKy2HHg54MhgCHIrAKxFeHEhto0kSZ1zg>
 <xme:N1w_Y2nl53ahaitVBE67au1LsuWTg_T9a-P3p598O7ZUPx76NnYU2H829mPVHwmA0
 KatUPS8QOCH1JHpunc>
X-ME-Received: <xmr:N1w_Y-ZbBXsizV4jFwdJJsAq80sm4YEnYj6z2is5GX1XrYQxeGya5dZY3zkYWJB6Tx1CpnFDe8yFaOo1x1nJSSOGAH9rTWMy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeiiedgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 hmihhsshhinhhgucfvqfcufhhivghlugculdeftddmnegfrhhlucfvnfffucdljedtmden
 ogetfedtuddqtdduucdludehmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehs
 thiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeevtdevgfdthfefveejudelheeghe
 fhhfdtteetheehudeiueefhfetkeejleefteenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:N1w_YxUxxKJWsmdrXFIjvscBQU-IhR4Ylc_BMS8dMgoOvAmhn_le-A>
 <xmx:N1w_Y0mIQUOhTdV_Q-nqfDiSid5R4BctatKSN23xTBHmB8zU694tDA>
 <xmx:N1w_Y2c5i_XB57URXg1slySedz-ehA19sW2vidRArj_2c7Z6-djvjA>
 <xmx:N1w_Yzvmnd2fILIZb4NtiEu2Op65Dy-lPoQj9AiR0tdl01l73W2FAA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Oct 2022 18:52:38 -0400 (EDT)
From: Patrick Williams <patrick@stwcx.xyz>
To: 
Cc: Patrick Williams <patrick@stwcx.xyz>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org (open list:ASPEED BMCs),
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH] hw/arm/aspeed: increase Bletchley memory size
Date: Thu,  6 Oct 2022 17:52:32 -0500
Message-Id: <20221006225232.3558794-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=patrick@stwcx.xyz;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_SUSPICIOUS_NTLD=0.001, FROM_SUSPICIOUS_NTLD_FP=1.999,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_PDS_OTHER_BAD_TLD=0.01 autolearn=no autolearn_force=no
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

For the PVT-class hardware we have increased the memory size of
this device to 2 GiB.  Adjust the device model accordingly.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 hw/arm/aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 7d2162c6ed..ab5725fff1 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1344,7 +1344,7 @@ static void aspeed_machine_bletchley_class_init(ObjectClass *oc, void *data)
     amc->num_cs    = 2;
     amc->macs_mask = ASPEED_MAC2_ON;
     amc->i2c_init  = bletchley_bmc_i2c_init;
-    mc->default_ram_size = 512 * MiB;
+    mc->default_ram_size = 2 * GiB;
     mc->default_cpus = mc->min_cpus = mc->max_cpus =
         aspeed_soc_num_cpus(amc->soc_name);
 }
-- 
2.35.1


