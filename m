Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D50329590
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 02:51:11 +0100 (CET)
Received: from localhost ([::1]:39922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGuBq-00075D-SY
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 20:51:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGu4i-0002Br-RT; Mon, 01 Mar 2021 20:43:48 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:32909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGu4X-00021h-0m; Mon, 01 Mar 2021 20:43:48 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 27CE55C00C6;
 Mon,  1 Mar 2021 20:43:33 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 01 Mar 2021 20:43:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm2; bh=
 kpPFFjA24ZGThZS1GYY5Tvg8kQFh1t9IdgiwXayB5Vw=; b=eILslYBrMcjxjVhx
 AavR0EWix2lDWYbdEpXCg5ji2HhQGNTf9sBzwOJZSHnzgex79FgovP6b6m8Hr/6f
 1Z8QtQkXvxuLkWCruPCl3nS/Bf2ptW5sl1qNujcEexG/ymzQGscCVyfrHUuIbtLE
 QOhUS8JXKEicDIBUzD+vjmEcq6+qm2FiCbFNUDoM7rI9G2KjhzrhI0LUI5SlD2Y/
 IgVtfZaTAigiELHwkiB5rsPbGkdaQugozw3MIFj2sAvzrLlt63yzuAv1sJb0Ionm
 NM5tes/CJI/UR7ZWPAzdd2z9lr9d0Aqa0UWvzU/m7QUV6oFk1tP8unE9vgqDhxA9
 pglt1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=kpPFFjA24ZGThZS1GYY5Tvg8kQFh1t9IdgiwXayB5
 Vw=; b=iNq8nTS7uHcnd8gAP4QzorXgUeNboGnx4AQ3eaGLkrWqNtwK/RCB8IHc6
 WT8IgLVtb3ZxDPW5PvIYH7ApyXltgOa9ghiHE+LGerOWw2CopVOe395mPY65yTcI
 XLsEg2uvk4iJqri8L/IZm1uPPlviwfQrEn5vjRjBsqm8FH7GBgn0zMX4KDX749jr
 I2uQf5NT1oCjYIM92WJfcgQsXDiiLBTpXzJPxVZHBWvhvYR7YL+3/yG8qTaTe3fB
 CfisQ5I5ZIL0vcJK7ePQHd4mdGZ4a7X+YsU8z/xsqY8uOVfMKsFZeGeIJ8hr2oQI
 vfeOM3RjpG8vd2oKD/vS6f4MF82xQ==
X-ME-Sender: <xms:RZg9YHnCrNOw-Jb5gQCL2Fxd0GfbeqY6dnnb10bfKduxwrletFTzbQ>
 <xme:RZg9YK2fydQg-llfrElFpPWDFR_EA7vsRzazZcelhvh2IMyHKdYcymZ8AmMJ_kFB5
 c1pRYeJ0h3b6zLK1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleelgdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfgggtgfesthekre
 dtredtjeenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnheptefhvdethedtgffgvefftedvkeelvd
 fhvddtjeeukeevvdekjefgtdeifeelgfegnecukfhppedugedrvddrledurdefjeenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfi
 esrghjrdhiugdrrghu
X-ME-Proxy: <xmx:RZg9YNrCKvAh8s0SQHMxNW5MuBzIKEQ9ef8V8OZPh7H5bmuUVIGDgw>
 <xmx:RZg9YPk-IJ8ZsBP_7KFApRchvgh8FXhteiMGkiTK1rUipNxtvWhb-g>
 <xmx:RZg9YF1KHvGrH3dzpUVwAArxkPy-iiFmPpUT8IsZ-STzZ2klql2-vA>
 <xmx:RZg9YN_OZeA-D7ysvnh7J2u2uygAyf0YPMbp3nTzmLT2GeX4CW4lmA>
Received: from localhost.localdomain
 (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id EEF8D240065;
 Mon,  1 Mar 2021 20:43:29 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH v3 1/5] hw/arm: ast2600: Force a multiple of 32 of IRQs for
 the GIC
Date: Tue,  2 Mar 2021 12:13:13 +1030
Message-Id: <20210302014317.915120-2-andrew@aj.id.au>
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

This appears to be a requirement of the GIC model. The AST2600 allocates
197 GIC IRQs, which we will adjust shortly.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
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


