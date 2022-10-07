Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7145F781B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 14:41:37 +0200 (CEST)
Received: from localhost ([::1]:36212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogmfX-0002y2-GM
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 08:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1oglAg-0000DC-TJ; Fri, 07 Oct 2022 07:05:53 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:35747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1oglAf-000615-0H; Fri, 07 Oct 2022 07:05:38 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7F74C5C00C4;
 Fri,  7 Oct 2022 07:05:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 07 Oct 2022 07:05:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1665140733; x=1665227133; bh=oa
 hjePKX/9AFaZuKtf2PieQ6PORi0jemTR9iFNh3+ow=; b=cTYNQkzvf0MpvcLjxY
 2TnNUUyr25t7IAyLWPKZIuQcWLQtVXvfwvf93J3FjPAcL+sPoRYzPiBdaCcEnimu
 nTDgpDZIPbJVRmQxZl2LgBZsjwtujnh9GsqEIWOZpM70EvhMKxrsYV3P840MhJ/v
 ldirjNGHoSyL2forlwpl6WOIo+Rm1U3t4lhGz5XWTyhFyNsih7lG0Mc/mw7RNVgq
 IqASjaDnu12mlFHSNj6bkFRlpyfcNJF3Or3djZAtE45ZU4eya8bvmw4lVZTMNWeN
 +Fa369Cj/orCGswlIeYQE2i59Sx3rcLPAeHMr4TC3GQIfRXWcd3zTXig9dSLV/GN
 GNZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1665140733; x=1665227133; bh=oahjePKX/9AFa
 ZuKtf2PieQ6PORi0jemTR9iFNh3+ow=; b=FRMUAzQC4B739NE8biC+OCgsWPsfQ
 5NxIdyqIk0qM6kWIw7MseRBXToSy/Ldow6yOCWzOYcYirgzmJCZfe8yD5/uBjQuR
 W+h7+aveYyRriks2DCYVg/NLp4DJp+8/oxB7dj5u7UNjm/7lYQceV22v9aC/txWI
 IU8N36VHn1A8NHdUWKbwkrdO5vo2/YWzPe3m9hHTexARj6Q+QmmRLmq6/FH9PIlV
 kZ9QXj7yZNY0TU8UPvhai18X6Eq7czme80Qi9PfqF4lD0zEn07RMlk+FyfsC/kxq
 vVUyDYfZmOMv3h7ACDPUaySkR7nOjEk6sHMatSQN93WrJiLKZClTs3Gbg==
X-ME-Sender: <xms:_AdAYyf8Qh57hMffkjjnDZ8o9NTRd-80fb9Z8Qoi30V3_duaWxU1BA>
 <xme:_AdAY8OC-p7PNOOL00EtZ6dMN6tDhBJrZGsUEpcSfxO3s7OGrBWkUA_oFgm6KzYFX
 M7dk8Fx_8fAYz5W50A>
X-ME-Received: <xmr:_AdAYzg3SV8pm1Q3JAETx398JGVkvqwdRazcgMMag4p4Ewm9Eh6Ebk95RBf2NwrR8zBsH-ivinOS53zTzd6sozFR7wCpxsv6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeijedgfeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 hmihhsshhinhhgucfvqfcufhhivghlugculdeftddmnegfrhhlucfvnfffucdljedtmden
 ogetfedtuddqtdduucdludehmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghk
 sehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeefveeihfdvgeeguddtveeuud
 euvdelgeetleefhfeukeehteekieeujeehtddtjeenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:_AdAY_8-TBaeG9uAtYau66T_XuRjtTcCmQz5rYSjobJQY3fwkq0gVQ>
 <xmx:_AdAY-uwZ3CnK5VqMxgLEzygVSxOxuRDMB_iOEdiOSkb8MMYGZtbCA>
 <xmx:_AdAY2ESpGg7MBTnDBymSI4q3Pn2YHZT8ByKMWcmZVCiqEE5zfwpLQ>
 <xmx:_QdAYwWwJsHex3ldTXeQXgmfqjwVjJ0baAV5_wpJjlXWe_5btzaYbA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Oct 2022 07:05:32 -0400 (EDT)
From: Patrick Williams <patrick@stwcx.xyz>
To: 
Cc: Patrick Williams <patrick@stwcx.xyz>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org (open list:ASPEED BMCs),
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v2] hw/arm/aspeed: increase Bletchley memory size
Date: Fri,  7 Oct 2022 06:05:29 -0500
Message-Id: <20221007110529.3657749-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221006225232.3558794-1-patrick@stwcx.xyz>
References: <20221006225232.3558794-1-patrick@stwcx.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=patrick@stwcx.xyz;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_SUSPICIOUS_NTLD=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_PDS_OTHER_BAD_TLD=0.01 autolearn=ham autolearn_force=no
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
 hw/arm/aspeed.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 7d2162c6ed..f8bc6d4a14 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1330,6 +1330,13 @@ static void aspeed_machine_fuji_class_init(ObjectClass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 };
 
+/* On 32-bit hosts, lower RAM to 1G because of the 2047 MB limit */
+#if HOST_LONG_BITS == 32
+#define BLETCHLEY_BMC_RAM_SIZE (1 * GiB)
+#else
+#define BLETCHLEY_BMC_RAM_SIZE (2 * GiB)
+#endif
+
 static void aspeed_machine_bletchley_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1344,7 +1351,7 @@ static void aspeed_machine_bletchley_class_init(ObjectClass *oc, void *data)
     amc->num_cs    = 2;
     amc->macs_mask = ASPEED_MAC2_ON;
     amc->i2c_init  = bletchley_bmc_i2c_init;
-    mc->default_ram_size = 512 * MiB;
+    mc->default_ram_size = BLETCHLEY_BMC_RAM_SIZE;
     mc->default_cpus = mc->min_cpus = mc->max_cpus =
         aspeed_soc_num_cpus(amc->soc_name);
 }
-- 
2.35.1


