Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 576B6325DC9
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 08:01:09 +0100 (CET)
Received: from localhost ([::1]:47276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFX7c-0006O7-Br
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 02:01:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lFX4u-0004MJ-DY; Fri, 26 Feb 2021 01:58:20 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:57707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lFX4s-0007cp-Rt; Fri, 26 Feb 2021 01:58:20 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 324095C010A;
 Fri, 26 Feb 2021 01:58:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 26 Feb 2021 01:58:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=s/Zs3H8nldIyS
 rORoqBVGAgKfQMLJ9+BZWTfSlhljkQ=; b=FhrPZ10uuP+nm5/Z1e9NkmmiebobJ
 YsNm1gTUG1EzvaWJn3YVqDuD3czwwcoO+m/7tW4rZuKeuq0vVlYtKMGXoitIfoeu
 aTdtF7sJ4+Jdd3ZaienpGd8e/zT0W8yas2/U95HAT63HCwiUBXMWXbc7GfExO0/d
 BJ709rNi1m7c36grOWMGe/kfsFd1GFdX6itpkLHWcE8pUgQClu1hxuV1dGyXLxT1
 2AU0zpILfr84QTT7eBYbjk1KhFnY1VC8QUEUoEKTdVz+HVQEFbmzF14YPaVSv0kh
 nlgBRuo2luAqlXkUQr9vN2hJYzuepahYqaw1DGtLYfMCIsLOXH9tCqb9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=s/Zs3H8nldIySrORoqBVGAgKfQMLJ9+BZWTfSlhljkQ=; b=YpbHwAJI
 nIoRLXK6HUphd0zH3f4C1pDPS8LzZeFXoPDzsAhCbco75FUOyrao3RkFAgLAOBRS
 7BZMafDUYFjtq6AzumaRxfFdIKGrK3K5LDKWmOrzxER1pUxg7B78cAIV5vr/fnyu
 PWxeCWQM3dC33JTieFPhWMR/XPRItZEpVpzix2Nq9VAd8NYKMtmmnzurX37E6zq7
 8gIOsmLWrbMuCO582T14C51ppg/FUE6KlzHMLB03paXKvAtOHL/DmHwl27zE1MiU
 it7WRBLyWIdxsUsKyVNAf+er7EI8YUYcy9Y6CoBqq3Bu6i8YIYwMBo2FW89ujQ8v
 9Da9VWk/e9jP9w==
X-ME-Sender: <xms:CZw4YAkKk7tEPzkEdyNihUI4v4YG7tSjb5wwsMRE1Y5xXj3yhlWIdw>
 <xme:CZw4YP134U5ggJSELSkHbNRuXJUj03xfH5sXs2Hkg_vhY4ohxasm2Cd9ZdEBvrNzu
 nAMdLm8WP07wUiP-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrledtgddutdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppedugedrvddrledurdefjeenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfi
 esrghjrdhiugdrrghu
X-ME-Proxy: <xmx:CZw4YOq8aSImASWe_sjReWbChYYJef-BHXnBdxfH0qPiwy9RKHO-Rw>
 <xmx:CZw4YMkXW_-F6-OADJr8tfhxCNdIlZ8T-E0QVI-BZ0Z-2UEK5cUN5g>
 <xmx:CZw4YO16twj4IGJhxR25ZcAKtndsIq67txUowvu5_n0xXpc5pIF-WQ>
 <xmx:CZw4YBS47dobbcZyPs0qmnNh-Y9B1WqqphowWp5XRZ_GPjJz4hqp-Q>
Received: from localhost.localdomain
 (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7C90C240054;
 Fri, 26 Feb 2021 01:58:13 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH 1/4] arm: ast2600: Force a multiple of 32 of IRQs for the GIC
Date: Fri, 26 Feb 2021 17:27:55 +1030
Message-Id: <20210226065758.547824-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210226065758.547824-1-andrew@aj.id.au>
References: <20210226065758.547824-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=andrew@aj.id.au;
 helo=out1-smtp.messagingengine.com
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
 qemu-devel@nongnu.org, clg@kaod.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This appears to be a requirement of the GIC model. The AST2600 allocates
197 GIC IRQs, which we will adjust shortly.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/aspeed_ast2600.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index bf31ca351feb..bc0eeb058b24 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -65,7 +65,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
 
 #define ASPEED_A7MPCORE_ADDR 0x40460000
 
-#define ASPEED_SOC_AST2600_MAX_IRQ 128
+#define AST2600_MAX_IRQ 128
 
 /* Shared Peripheral Interrupt values below are offset by -32 from datasheet */
 static const int aspeed_soc_ast2600_irqmap[] = {
@@ -267,7 +267,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     object_property_set_int(OBJECT(&s->a7mpcore), "num-cpu", sc->num_cpus,
                             &error_abort);
     object_property_set_int(OBJECT(&s->a7mpcore), "num-irq",
-                            ASPEED_SOC_AST2600_MAX_IRQ + GIC_INTERNAL,
+                            ROUND_UP(AST2600_MAX_IRQ + GIC_INTERNAL, 32),
                             &error_abort);
 
     sysbus_realize(SYS_BUS_DEVICE(&s->a7mpcore), &error_abort);
-- 
2.27.0


