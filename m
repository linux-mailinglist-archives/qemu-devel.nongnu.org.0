Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98615565F37
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 23:57:13 +0200 (CEST)
Received: from localhost ([::1]:41452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8U48-0006X9-Mj
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 17:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8U27-0003dU-LN; Mon, 04 Jul 2022 17:55:07 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:46425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8U26-0000L0-6Z; Mon, 04 Jul 2022 17:55:07 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id E67BC580FDF;
 Mon,  4 Jul 2022 17:55:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 04 Jul 2022 17:55:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656971704; x=1656975304; bh=Kd
 zNLlPtoOQAR1V/yBPdUewvspHqmLHfngwqSvHO/IY=; b=HDICCo1IpzG+GyR/Is
 232JsYku5x85Nk+SfTKr27dH0R7o3toChpbyn6XdsyASMnZZMywZJ/bfw8jE9KVN
 y3nIhPXzligvZkQmf/L4dOilimONTHTysNHTT0Ffe1WRoJZbYrpWFDnYSPaWzewE
 BrpTpaO94LbFMNUSv6sdmaATukPZoIcxjlpgjfkFDNiP2PI0HvE0/3tuGzMu2/cj
 7u1odk0OmsJps4AErgfINOZlTk2l9J29JIDaQBdMYsOiOSrggDttGCnvbaYiGLot
 4rX6MoIXRgy87f9/JvBjTQSkCHJU0mzOBRRNOO1+xhP2UToW9k//L+eR3hHnqTyE
 myEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1656971704; x=1656975304; bh=Kdz
 NLlPtoOQAR1V/yBPdUewvspHqmLHfngwqSvHO/IY=; b=ZMCUKH8crwlLngpURBZ
 MlDbROqHfaupoX1RTok0UeTf5Fpd58Sy+ZkIHFgNRPPlozl2JSWOJo/G5dMbdeJI
 fH6Qse9BXdD9Q/OYKvsKmQn/XQbYLsDOOG1nGOa6nOg3asIEAXB7g8TXH0UL9i3N
 6ELYiZfhUAN2GaYO8/CYv/fVB+D4bnDqlT9y0dpWYF4jEroOvAGPgToU8FX+hu/5
 MYo/cOQNaOm7cOh+aJA9Vl+judwR1Ea+fXqvilQn28UAEuLeGkykKaZUO7YjoNx/
 xlZHtozc3x5oFWOE+XA7+Uww/0q7zLZaHlhobXDjI3ksQADsbJqi7S6kWJTNbDFE
 qMw==
X-ME-Sender: <xms:uGHDYrZw4Na7JaGEoQKGBjMfCfExmV7vZxn16bURK3lEwSJkxAHDBQ>
 <xme:uGHDYqadkSZ1wjdv3k9TTY2jqcX6puuC8vGJqblJSTeUBVDJp82yzxqMEk9ZvuCjQ
 WNJQTZMtBCUytNBM84>
X-ME-Received: <xmr:uGHDYt-bC4BSFRkKqYezUTLT1Ghp2kZiU7yKOdlSZwm94x9sZhkaDaXlGhgc_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeitddgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 hmihhsshhinhhgucfvqfcufhhivghlugculdeftddmnegoteeftdduqddtudculdduhedm
 necujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgvth
 gvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrfgr
 thhtvghrnhepteelgfeuleeffffffeekiefghfejuefgtdfgteeigeekvdefffevieekvd
 elteevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 phgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:uGHDYhokc0uw8uveC9N-yA1lVfB9txilKU72Cr9WguHVWsDlEvqtOA>
 <xmx:uGHDYmp_saLucO8ekuubLbhnFg9PT5A97MOLw__s0V7lTQ1gWCiofQ>
 <xmx:uGHDYnQYq6BB-b3A_aJ_e5f3haE1_Xq2__2Q1LcxDlWio4AUP3GvhA>
 <xmx:uGHDYjB6po05wzm06MhLJL2RTbfiwmt41PJjYLsvHkEW7jX-0WgESw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Jul 2022 17:55:04 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 4/8] aspeed: Make aspeed_board_init_flashes public
Date: Mon,  4 Jul 2022 14:54:53 -0700
Message-Id: <20220704215457.38332-4-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220704215457.38332-1-peter@pjd.dev>
References: <20220704215457.38332-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.224; envelope-from=peter@pjd.dev;
 helo=new2-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 hw/arm/aspeed.c             | 2 +-
 include/hw/arm/aspeed_soc.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index cc395f988c..b2486a9e78 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -262,7 +262,7 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
     rom_add_blob_fixed("aspeed.boot_rom", storage, rom_size, addr);
 }
 
-static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
+void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
                                       unsigned int count, int unit0)
 {
     int i;
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 68e907cd64..8389200b2d 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -184,5 +184,7 @@ void aspeed_mmio_map(AspeedSoCState *s, SysBusDevice *dev, int n, hwaddr addr);
 void aspeed_mmio_map_unimplemented(AspeedSoCState *s, SysBusDevice *dev,
                                    const char *name, hwaddr addr,
                                    uint64_t size);
+void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
+                               unsigned int count, int unit0);
 
 #endif /* ASPEED_SOC_H */
-- 
2.37.0


