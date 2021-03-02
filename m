Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FB3329589
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 02:48:18 +0100 (CET)
Received: from localhost ([::1]:35084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGu93-0004o7-Ib
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 20:48:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGu4q-0002HI-2u; Mon, 01 Mar 2021 20:43:56 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:48637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGu4b-00022J-Je; Mon, 01 Mar 2021 20:43:55 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 6211A5C009C;
 Mon,  1 Mar 2021 20:43:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 01 Mar 2021 20:43:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm2; bh=
 Qwz5vS0eVntfRCjzEGyKDEX/ntnbNpeqXmp68NIOYNQ=; b=DeZaEm05Yae/NDeB
 hg9BUm78tGufR3clBIPFqxHTulmYdPmm2Ky4pcOJ66tUi5XU46RsiRTcchawHsVx
 uU17XN4eKAKUnwLiMnrWTBhcMSKuilYVFp3Fqw/V+VrCENugxUdxcGlzL49Ue2b/
 mAEx8B3DZkwe2ZhBiHBNkdgPbGf5cq2z3ufzY+5NQxHwJTeqaNvGT4YKEWm515Cp
 lwEGLXJca3poKUOua4ygvp1KoSFijW7Mzp86CixnnpYFMxCMVSDxzrr0i6xGTion
 jQYCEHaXSNfVAul588Vl7JPxsUiNEUjpNzJOKCECSXeVAZ7uDkUW3uOW3utcrFrm
 ZFKU3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=Qwz5vS0eVntfRCjzEGyKDEX/ntnbNpeqXmp68NIOY
 NQ=; b=k15XHDtBZBI8v0Yb8UeU970Nz7Uo6xebKsWKS2gmRG/bcB8KgRh6QpFGd
 k28J2UFo0+YSTcplsxS+uqN4dLWxqvwdqYjxPytzxYwi/r/cLE02zWW3JBhm3OnU
 wvcjCvKpbp6BMvknvQiLCiHWDnk8RhX6Lv2Vxg+5/u2Tf5EL6RU7YOE4avlBGu2+
 uLBWuXbIegoOWyXVHjpRxj+cRxekzlZqItsdtkFdr2hcMIScwG5mIwrlfGz8n8Uc
 hP4glVYtliKeAnpdhS5OggeibEQxqFMsbnAF5MAoa/XQqNjB8DNE/fh1cQPLCu0J
 fOcCSkMwJgtdrAn11d4nc/2WnOU+w==
X-ME-Sender: <xms:TJg9YCwe_Zv84gpVaw6m9RFWEo6tfZnyFCORNL10XQRUuQ5LC4yADw>
 <xme:TJg9YOR8ZxRfIgRugtfhL43GTKDwTlgV0y5uvd2HlzfRSqjpN7ffKPgJFCoBDNFXc
 mGnZfJ2QGj9ivBhaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleelgdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfgggtgfesthekre
 dtredtjeenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnheptefhvdethedtgffgvefftedvkeelvd
 fhvddtjeeukeevvdekjefgtdeifeelgfegnecukfhppedugedrvddrledurdefjeenucev
 lhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfi
 esrghjrdhiugdrrghu
X-ME-Proxy: <xmx:TJg9YEVd1XuhI80tGokBSlwfnoRroqoh-T1aO-sQ6MXD3lOOSi2V8g>
 <xmx:TJg9YIggJII2u507Ys2MQJndTWrXi3g1plFF80jRkF3fz_DkwlBlYw>
 <xmx:TJg9YEDOPwjIXi13fBuuMFrTizp7FSopCJ8rpkGISoKGzekr0FaaXw>
 <xmx:TJg9YD4rsBqnYnRyAmsvoaT-BeQhKeBXfqpvnFZV1XG9vMbGvnKTWw>
Received: from localhost.localdomain
 (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id 38758240057;
 Mon,  1 Mar 2021 20:43:36 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH v3 3/5] hw/arm: ast2600: Correct the iBT interrupt ID
Date: Tue,  2 Mar 2021 12:13:15 +1030
Message-Id: <20210302014317.915120-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210302014317.915120-1-andrew@aj.id.au>
References: <20210302014317.915120-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=andrew@aj.id.au;
 helo=out5-smtp.messagingengine.com
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
Cc: peter.maydell@linaro.org, ryan_chen@aspeedtech.com, minyard@acm.org,
 qemu-devel@nongnu.org, f4bug@amsat.org, clg@kaod.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AST2600 allocates distinct GIC IRQs for the LPC subdevices such as
the iBT device. Previously on the AST2400 and AST2500 the LPC subdevices
shared a single LPC IRQ.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
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


