Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88213569B79
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 09:23:48 +0200 (CEST)
Received: from localhost ([::1]:59898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9LrX-0007GL-9l
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 03:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o9Llf-0005D9-AS; Thu, 07 Jul 2022 03:17:43 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:46497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o9Lld-0007jn-Pr; Thu, 07 Jul 2022 03:17:43 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id AFB102B0591B;
 Thu,  7 Jul 2022 03:17:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 07 Jul 2022 03:17:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1657178259; x=1657181859; bh=df
 S+hyUoVT89nyu+zCal+hwkpyxuybLV6jRomj1LStk=; b=bGBiRj2EpNrmhCS8wl
 pVrcVwrfNWzn75u88MjPFpm5vEE1/EA84d1oieQFogQg3zs70WSHlo52T3p3mnUi
 gIVka89+sYQx0SOnZJV2PO86l7DzHAB0p5jlHuD5+ghPkAMgXwS0LlwnEM8T3Vgi
 J1+OwdOglicD/TnOVcxAvsgtoPbdF32kQYBTwih4+BkCAoBgYf53Gja7wo/KI9Fo
 Vic1YPM5cJWU0j4LM6Lyl8ZaLmxrdunD/+9toGkCtbi2hDwRv6jX+x/rfU/qcckl
 uvjMaLfi8WIy//1Nz9vSn6s7VwYmYqrqJX+Y03I8I3Lkb2R9E1PihnN+UaPHxaqt
 G1mA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657178259; x=1657181859; bh=dfS+hyUoVT89n
 yu+zCal+hwkpyxuybLV6jRomj1LStk=; b=Va/0Uj/WuD2nirGo7XyrVFWj1MEOk
 0jozqyBObrVixCWRYkQ2ZhRIfVNdIxIwgB3lwlTUszrEOyvzEmqbaJ2fLL3+r4bu
 A8sFst3MgANzITc398v9rgKU5/aYOYfHvudnj4Tv8KkS/QZz4dy1YHrV3HlJKd9F
 JxVcr3Cx3D9T4JAX+/UH7UQd8akq9ONO+rdB8xKDqp3H8Zx6ffusgP5x0JJZrFUN
 YXgFVF6fNKRJFh+zakPoGc5Zmh0KYgWrQVd3HYJE1ZnAxq08RM62CK1uBifKIvrf
 xzgzg1h0S50PvEcU9dAWVRr/YktRlcfFHxQJzA58DOr84BCS7ZZ26sQXw==
X-ME-Sender: <xms:kojGYpnvm6hiMLCtNYFQzRpbx_fysiKVzd9jQlsCjbDVMhAbkenb1g>
 <xme:kojGYk2WqrpDJk97fyvjgt6LhOHA42O8ZIi5QRfHnGe4-QuaJiKB4_Dl7tqkRufmJ
 vp22ROXsqwod1D4sGI>
X-ME-Received: <xmr:kojGYvqEBwrmkQrc54_UFQhP7LOaWNm0RQeVQLPPEgTi4m_igsOg8Nx7yeSWIrvXr_tc4WuzhW9lm1tK6BL4UIOvsoklDMku>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeigedguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enmhhishhsihhnghcuvffquchfihgvlhguucdlfedtmdenogetfedtuddqtdduucdludeh
 mdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefrvg
 htvghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffr
 rghtthgvrhhnpeetlefgueelfeffffefkeeigffhjeeugfdtgfetieegkedvfeffveeike
 dvleetveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:k4jGYpmmB64cVOs9IZFAjRBT5AuH1oMEWIAtxzkv99SZJLEHXWLQ7g>
 <xmx:k4jGYn0pP3gLGSxPRKZvKWSZiEn6Y1f1AtXksZm1Lk_rd7i_oeMvYg>
 <xmx:k4jGYouUTRjzOfmvAyjd4tv_Yh3zamdvXaRUvCmucy4pK5Fnxn1zEg>
 <xmx:k4jGYn-k4mn-_NvOCNIU0tkq1uibCHEXw2_Y4DN1hlIr_1D6jFvZ15rdxo8>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Jul 2022 03:17:38 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 2/2] aspeed: Add fby35-bmc slot GPIO's
Date: Thu,  7 Jul 2022 00:17:31 -0700
Message-Id: <20220707071731.34047-3-peter@pjd.dev>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220707071731.34047-1-peter@pjd.dev>
References: <20220707071731.34047-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.27; envelope-from=peter@pjd.dev;
 helo=wnew2-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM14=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/arm/aspeed.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 6fe9b13548..0ce9a42c2b 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1343,11 +1343,23 @@ static void fby35_reset(MachineState *state)
 
     qemu_devices_reset();
 
-    /* Board ID */
+    /* Board ID: 7 (Class-1, 4 slots) */
     object_property_set_bool(OBJECT(gpio), "gpioV4", true, &error_fatal);
     object_property_set_bool(OBJECT(gpio), "gpioV5", true, &error_fatal);
     object_property_set_bool(OBJECT(gpio), "gpioV6", true, &error_fatal);
     object_property_set_bool(OBJECT(gpio), "gpioV7", false, &error_fatal);
+
+    /* Slot presence pins, inverse polarity. (False means present) */
+    object_property_set_bool(OBJECT(gpio), "gpioH4", false, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioH5", true, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioH6", true, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioH7", true, &error_fatal);
+
+    /* Slot 12v power pins, normal polarity. (True means powered-on) */
+    object_property_set_bool(OBJECT(gpio), "gpioB2", true, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioB3", false, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioB4", false, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioB5", false, &error_fatal);
 }
 
 static void aspeed_machine_fby35_class_init(ObjectClass *oc, void *data)
-- 
2.36.1


