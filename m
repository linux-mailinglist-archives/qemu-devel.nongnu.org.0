Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4794329588
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 02:48:04 +0100 (CET)
Received: from localhost ([::1]:34294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGu8p-0004UH-Oq
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 20:48:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGu4p-0002F5-4z; Mon, 01 Mar 2021 20:43:55 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:36211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGu4Y-000222-SY; Mon, 01 Mar 2021 20:43:53 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id D61C55C0088;
 Mon,  1 Mar 2021 20:43:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Mon, 01 Mar 2021 20:43:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm2; bh=
 AjcWu99zYWM3MFP7FCVoSIVRy3dP2O7AvMfoVzpMjzk=; b=uyJd9ph0vto5JLC5
 Xl736evEsi+0lP/DxHCPdfATYlIKl6rsaclUXZmzJzTqG4BBr+wPu3v7dlzkOJpr
 JWdDxI29yyDREmubySnrxKbKEJ/Sih3e+LR688d3/HfIhoVN8nvIOZ4pl/HzaQN4
 iZGi+2FRb4YYXfOn4Q6RNkVZESO4KY+G0Ii7FfwSP2hTzz7jvv8TgbDt8FZWFNT+
 rQMj4OSeVBwVQU2V07aUEV1mSlB9imS4aXs5hlweseL1M4CWphbaWqbFADoE0pgE
 8QyJzwui/bdmEeOnEN+WMmky7rbUn9x8rFXx5ArSyxIidUYvOhS5M43uUZY8WZLH
 edfuiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=AjcWu99zYWM3MFP7FCVoSIVRy3dP2O7AvMfoVzpMj
 zk=; b=riEPRWoWwvw6Z20BWxy1au+NH9k0tvjAK4b3Oifd/4TBXgVkzHSZ5eUdI
 dImnUalqXVgN13maSoC3eQN9A41rcuf2LdraTn3H/e78ud3M01K2EiO41I2CUlVT
 V5vC/G8xVglebgFyg7GR90XhIAXZXY0WKN9tZoxu+N1l7ebzpmxYOAfZdjMH3zS6
 IJTiMT90/MGIiquUOuQesrH5lHWjqOS9hVDOGS3DYNKjdb5vttU/uMqjuYgHvlIe
 j0n2iOwSyisBridH4OQB+Ul2M+RfWdbnI/PHL5PamxoYGBAlO9CO7w/IHvUHDxxZ
 UMV2GhmXJPWfdLP9pqa6zF2QUqOag==
X-ME-Sender: <xms:SJg9YCF14RXyJ0zrh2nWYysI_mW6_r0BPaFlXcg4g4QSWa9lmHz7_A>
 <xme:SJg9YM83O1Qepcq65FwidOeYLUDaycr4pdkd5IzPFZ3u_14lEIEzxoQURRx_fDvsy
 vX6kcDPIY6LQW9d7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleelgdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfgggtgfesthekre
 dtredtjeenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnheptefhvdethedtgffgvefftedvkeelvd
 fhvddtjeeukeevvdekjefgtdeifeelgfegnecukfhppedugedrvddrledurdefjeenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfi
 esrghjrdhiugdrrghu
X-ME-Proxy: <xmx:SJg9YMK0ALjCl0egd6yjiern_euHcKbgQhhedMZrumOc87PNIp8arA>
 <xmx:SJg9YPZKCQ5u4pQ3ZnIrK8cAAIxAaURaHOyqfKwrvKBYF-aZBWCObA>
 <xmx:SJg9YGJy4KrKfKbdBdJJdIX9JhzhPRJr5HwzHyV2ULIfXMliL7oMpQ>
 <xmx:SZg9YMAXyMiXoUHVnoaHXp9RhcZ2ALDxFc9iEHFfMNjOjaMAwQA_1Q>
Received: from localhost.localdomain
 (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9C91B240065;
 Mon,  1 Mar 2021 20:43:33 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH v3 2/5] hw/arm: ast2600: Set AST2600_MAX_IRQ to value from
 datasheet
Date: Tue,  2 Mar 2021 12:13:14 +1030
Message-Id: <20210302014317.915120-3-andrew@aj.id.au>
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
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The datasheet says we have 197 IRQs allocated, and we need more than 128
to describe IRQs from LPC devices. Raise the value now to allow
modelling of the LPC devices.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_ast2600.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index bc0eeb058b24..22fcb5b0edbe 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -65,7 +65,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
 
 #define ASPEED_A7MPCORE_ADDR 0x40460000
 
-#define AST2600_MAX_IRQ 128
+#define AST2600_MAX_IRQ 197
 
 /* Shared Peripheral Interrupt values below are offset by -32 from datasheet */
 static const int aspeed_soc_ast2600_irqmap[] = {
-- 
2.27.0


