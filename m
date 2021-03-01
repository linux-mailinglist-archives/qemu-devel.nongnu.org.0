Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F6B3275B7
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 02:11:44 +0100 (CET)
Received: from localhost ([::1]:35988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGX67-0005Ox-P6
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 20:11:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGX1C-0000Vl-TD; Sun, 28 Feb 2021 20:06:39 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:45835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGX1A-0001jV-5o; Sun, 28 Feb 2021 20:06:38 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 6897E5C00E8;
 Sun, 28 Feb 2021 20:06:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 28 Feb 2021 20:06:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=K1eeLrpe1ZAcH
 2f++WQC2It5GCo/sHwGONfed+MYii4=; b=L7LZn7ZOvMnk4vRP1yMLu5LYF9W+D
 B8jwf0zbkeSKzNdakPU9KecqOpzdRxTFyBreDhLjCAxL2hOU97WpklKIgO6ZCi4r
 r2ZNLN9lK2swown1LBD8t9vmGNah7IfPqgbO05Sew4wVHMt0WKNeH7EizYlqvfYf
 dyaR0xnHg+QPob+ChkkQVQ6oNMWiS/7IgYFLAbhMK7zl3W4ZQK8duKZWH5GIM6WN
 ArAI1BOZZ1oqk/2sOiScoMrmfku+n6dySVAGTRZ5Wm/HUSsAiy2jwQCSVxaf1Pbu
 JD8XRYFtkjbhgBKKbKEH9LS+n+fIFi97v+p6xpMFRVQ20kSNMYu5fDSeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=K1eeLrpe1ZAcH2f++WQC2It5GCo/sHwGONfed+MYii4=; b=TAAniufx
 ksvHLfBJBulAITHohLeX3qXK7cWfrr8jUK7flAidN8IvI0dRJg5lzWjJONwnwt8c
 MtXPkfvVEStUE7albM0/Tzzdgr2N1OzAyCY6AWF7XgcIRhIhJ6N7iyVNlxi1lGDI
 5CCnJVKPIeZhSCyMq1JH29WpcS2OBEKlClBEQXKyQjOSg7OTmkNQM1Sb8xvVh/xT
 lHMIG+/4sK0RjvcVolKSRMySEUYhlDcRXkcTcvSDarmA/HEtJ2+Ti4ze9KGf+ra7
 bUB7b5jKI9HnNgLHmqlslX6PHQGM3C6vKJzpEogkYpSsaBs9JaEeCvx5xAFF+ULE
 UhJx/mlm6DRk8Q==
X-ME-Sender: <xms:Gz48YGPabX5cWbl4NfHM2jR_b64IX4NaPZocJNhXodvgPalIChPJCA>
 <xme:Gz48YE8KNfx2_dJgthZSeYqrJbHfZJtvQPhKqxxSR3W0LxqmMN_3n0SeKvjDjI9AG
 ZDh37o6hJJHA4KQuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleejgdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucfkphepudegrddvrdeluddrfeejnecuvehl
 uhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifse
 grjhdrihgurdgruh
X-ME-Proxy: <xmx:Gz48YNS1DARInja5JzTsEFH7BkJyE_3Hna4DMae-LMou8D67MrLs4w>
 <xmx:Gz48YGtPGeGDzBYm8wQWN39f23sOIz9covRMC0OepjyDrrJVsTr3qw>
 <xmx:Gz48YOe2CNIyoi63IqEZxvW10JOqmLj2V2vCg8T9gnG9FT6Z5-QUQg>
 <xmx:Gz48YLGUXmfyDHMgh9rKcObPA1QSPzsBxSBUs9a0bdVt4i_CACVCSg>
Received: from localhost.localdomain
 (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4C23F240054;
 Sun, 28 Feb 2021 20:06:32 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 3/5] hw/arm: ast2600: Correct the iBT interrupt ID
Date: Mon,  1 Mar 2021 11:36:08 +1030
Message-Id: <20210301010610.355702-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210301010610.355702-1-andrew@aj.id.au>
References: <20210301010610.355702-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=andrew@aj.id.au;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: peter.maydell@linaro.org, ryan_chen@aspeedtech.com, minyard@acm.org,
 qemu-devel@nongnu.org, f4bug@amsat.org, clg@kaod.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AST2600 allocates distinct GIC IRQs for the LPC subdevices such as
the iBT device. Previously on the AST2400 and AST2500 the LPC subdevices
shared a single LPC IRQ.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/aspeed_ast2600.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 22fcb5b0edbe..2125a96ef317 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -98,7 +98,7 @@ static const int aspeed_soc_ast2600_irqmap[] = {
     [ASPEED_DEV_WDT]       = 24,
     [ASPEED_DEV_PWM]       = 44,
     [ASPEED_DEV_LPC]       = 35,
-    [ASPEED_DEV_IBT]       = 35,    /* LPC */
+    [ASPEED_DEV_IBT]       = 143,
     [ASPEED_DEV_I2C]       = 110,   /* 110 -> 125 */
     [ASPEED_DEV_ETH1]      = 2,
     [ASPEED_DEV_ETH2]      = 3,
-- 
2.27.0


