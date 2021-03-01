Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8353275B2
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 02:09:01 +0100 (CET)
Received: from localhost ([::1]:56660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGX3T-0002Bp-Mm
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 20:08:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGX18-0000QP-M3; Sun, 28 Feb 2021 20:06:34 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:45593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGX12-0001hX-VS; Sun, 28 Feb 2021 20:06:34 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 20C8B5C00B6;
 Sun, 28 Feb 2021 20:06:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 28 Feb 2021 20:06:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=s/Zs3H8nldIyS
 rORoqBVGAgKfQMLJ9+BZWTfSlhljkQ=; b=G6iGRQ3NEFCtk9iF8zjzRYA0ymTJe
 Bn0eO+VLzC3svlObRqnXDk9jS12fZhec44djR0JcK+505yO76bhf+x5uxd/ymvzB
 SibLA8ZlGOMXVPLSXvnYVZwob5GcCIXOKYKHn0Es7LVG+WWud87ZxtrXyXnsbgUT
 XKz8ZxXSCI7ebEixZStfrKyPmbO8Ywwr6EbAlxyEnhccEpdK3EKNyepj3T9N9Uv6
 tW8ud1TwWM7LrdjcVh7RtiC9hvc//o1B1g3l7YSPd08N/rONDquCMM7IylcpYF3l
 dGpxSQC4ryWi/rVehMiAodE6wL7HcCZZgYvf+ZdS1slKWys015SHIRSWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=s/Zs3H8nldIySrORoqBVGAgKfQMLJ9+BZWTfSlhljkQ=; b=v1CSPO2Y
 ZZ8C4zbINjP2ZJpM6EIVdC7LTTmP2X9aePDnXyiuTx/LTxLhD9ONfcIhp9AQgTbI
 br//gIezhWgmIXrxgl+wyPh2MStxdDDws5ewgV1poTBTolkPn+6FMrUP924JBFP3
 CueAOYBiiYgMC0Fmb3+B42iLO+KJDESVVH6lBHHSEQ9cGN0I6aatYayfUYflevoB
 boyGZLR/dkY1HGiwzxjUjYQi3XB07vejGZOfmFDCqxDRsfXKGIJpQtoBiFhF/bJE
 IHLO9htg1Iu/yZm8wyDQr7VQBzjTUxc/DTc740OsDzxAiUC23u389Pi799tMR1YR
 K4VhEtQlk52o8Q==
X-ME-Sender: <xms:FD48YNOK7KQ74zhY5gBhkHMstW9o2qca_yNZg5Zh93IX6d99PQgTBQ>
 <xme:FD48YP_J6vlN1cWhQot5nNfPIAq78L7vPhD2ULvtavqEJLbX2Ft8CiwYZCdTyiLZc
 ZaU-ImB1mpCXNtRLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleejgdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucfkphepudegrddvrdeluddrfeejnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifse
 grjhdrihgurdgruh
X-ME-Proxy: <xmx:FD48YMRz56qkqCfy94P8Bx8BgMvSLHTKHS-vtT7z3Do5097CY7Mtpw>
 <xmx:FD48YJvOIazKD5JueIMnJPmqt78kKblzAJclM8GYjmJXWkIF9AEIYw>
 <xmx:FD48YFf-K8fdaWxhhK626-mTX4z98v_IV6VGyhk3nOOO9P2ZequzGg>
 <xmx:FD48YOHs1X2KobNUtSrp3_7pbtuPRJZqYup0uMPWPdC64kvcQU_aag>
Received: from localhost.localdomain
 (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0DAE1240057;
 Sun, 28 Feb 2021 20:06:24 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 1/5] arm: ast2600: Force a multiple of 32 of IRQs for the
 GIC
Date: Mon,  1 Mar 2021 11:36:06 +1030
Message-Id: <20210301010610.355702-2-andrew@aj.id.au>
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


