Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A71FE3D33C6
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 06:37:55 +0200 (CEST)
Received: from localhost ([::1]:45078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6mwc-0002Uq-8Y
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 00:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1m6mvn-0001eR-F2; Fri, 23 Jul 2021 00:37:03 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:38599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1m6mvl-00080b-QK; Fri, 23 Jul 2021 00:37:03 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id A2FD35C00DB;
 Fri, 23 Jul 2021 00:36:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 23 Jul 2021 00:36:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=REnU9gwaMNcgjImzi20459JDkQ
 4gVCf1GEUhjAFVRtA=; b=fV3N/8q1fuK/Oau0s4Im5erOup3ZXmPr2Ihsfa629P
 NFfzkDVLSB2MufKO5amK3zfJdeIcO4TAYo6Tye/aCBsrKvF/M/xyK7r8kUhhTVf6
 hb7mSX1cnM4YrwRF5Gx/Yhi0bfEuZ1IbZhF63nOuawcctnelqeGV1EIhi35D6E7a
 fryoi/NfjNytkCVu8tCij0mJSDmAZGQUC598zzJIkdJhfPGo032oIDAcswmoo72H
 0DuDsXoh2hzFeh5ofgvcJ9ivSHADsgy2e+GqJ7IfvKkUSQKxAOK5Dda2QDSOB+SL
 egL/UvmIy8jhDDDdsZgfxsCzYeywjsdb0gRTFtfYuNNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=REnU9gwaMNcgjImzi
 20459JDkQ4gVCf1GEUhjAFVRtA=; b=lOqy+zbvPutBjKUfehyMZipaGKxKJRJHF
 V3UtaRmvJ8pWd3Q+otuWf4+z0ir9lE6LfYrhzhQj9YAXl9fTTYdmjI7mHox2v2ry
 EDPoQ3JU7qM6+Ko1Oi3yTYFZCTkkuKeqOwRGJlG3MmHw+9b2HBGwTV3o20BIU0Fa
 aGZjXcD9rSzXE2tGVg5/H6Otqp2SX3ng88EWIkjj/aLqLExd8ujBvAf+kKLETO06
 nIC2n8I1N1emQux6uVLnorD+XABxa6+DcCex/fboKO7/oUh1gb1DTiHWqRRJyW8w
 FEtYgNgW8WkczlG/gSpp/M7kqClzdvQivJv1viymU44GXmqqo+69Q==
X-ME-Sender: <xms:aUf6YHuPjntI__BV7WsMSl8rm5BYrWmz7CDImCeubDEi8WgYQ2d_vQ>
 <xme:aUf6YIe19edB2wcszPHUiDXz_r_UpIceg76UJiK9Q1zucSrku7aTZbNVi7JSkRyyB
 4KXz42roa6s0bBotw>
X-ME-Received: <xmr:aUf6YKzsiebtI_ehNPNdxfPd39rfx0eSKzHGwVncCmC8nKr8_2nytdjI8fxo1UHYG8RFF3q5vWNMPDo2hqob7F5IhxPv8frC4qgn8dYKXrhWGvcF8arzE4PoO22xM9a152xwSA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeejgdektdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucggtffrrghtthgvrhhnpeekhfeiffejveefveehtdeiiefhfedvjeelvd
 dvtdehffetudejtefhueeuleeftdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:aUf6YGO5z67GuzXsHf0KcHgZ_VD96MaJi5jrfJgaI73T8KZq-qfOHw>
 <xmx:aUf6YH-liAx5-juSZ9wVpoMXJnNuHUgbn7qIM5zMMQBAEg2S1QeirQ>
 <xmx:aUf6YGUt2U6JoVt4c441poCJT8N8G7amawp-axSKTSx-63xB82AYQQ>
 <xmx:akf6YKb6cT1HmD5lvFo7kR-nJhhu66Z83xviL-nfW33I8IibECAYMQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Jul 2021 00:36:55 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: clg@kaod.org
Subject: [PATCH] misc/pca9552: Fix LED status register indexing in
 pca955x_get_led()
Date: Fri, 23 Jul 2021 14:06:24 +0930
Message-Id: <20210723043624.348158-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=andrew@aj.id.au;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, joel@jms.id.au,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There was a bit of a thinko in the state calculation where every odd pin
in was reported in e.g. "pwm0" mode rather than "off". This was the
result of an incorrect bit shift for the 2-bit field representing each
LED state.

Fixes: a90d8f84674d ("misc/pca9552: Add qom set and get")
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/misc/pca9552.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
index b7686e27d7fa..fff19e369a39 100644
--- a/hw/misc/pca9552.c
+++ b/hw/misc/pca9552.c
@@ -272,7 +272,7 @@ static void pca955x_get_led(Object *obj, Visitor *v, const char *name,
      * reading the INPUTx reg
      */
     reg = PCA9552_LS0 + led / 4;
-    state = (pca955x_read(s, reg) >> (led % 8)) & 0x3;
+    state = (pca955x_read(s, reg) >> ((led % 4) * 2)) & 0x3;
     visit_type_str(v, name, (char **)&led_state[state], errp);
 }
 
-- 
2.30.2


