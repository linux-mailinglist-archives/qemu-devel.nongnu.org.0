Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEA1565F36
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 23:57:09 +0200 (CEST)
Received: from localhost ([::1]:41072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8U44-0006Hj-GQ
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 17:57:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8U24-0003Yh-48; Mon, 04 Jul 2022 17:55:04 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:34867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8U22-00009J-Fp; Mon, 04 Jul 2022 17:55:03 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9978C580FDC;
 Mon,  4 Jul 2022 17:55:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 04 Jul 2022 17:55:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656971701; x=1656975301; bh=SD
 bWD8l4JEHfDcDBn/AoqsCvTO1am6yDlmfK+59RfvY=; b=3AOicbtGFSwu84jr+N
 anelZz6XUU3DiMl+NyhZarGbO829dwuRYc0mdP0RabVEJdjGdDNxrVYITFvtoPwO
 +9Ow+SbCVbTm3eHcMQg2ml2MpMzkp8dbbS5gPwSRRRXxkP8XVhcWUX0iLPLl7jaE
 pFYcYVzl16eE19HHEow7w87pMWZ89VDp4UypdsOeEJOaZ4Eu+l0STjMN0qbFTaH3
 q4plqGDwBuqcRpjU1dV2pyF7hC6/1Gy1+bN1TMPklzzkoWAA+cjWu6Dd10vZaPhm
 vreMoX1NIuyS9afK11E9alueyww2dPRWtOXsIKjTfHTMN0WYaGZnQs4M/ZLiUn/J
 02xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1656971701; x=1656975301; bh=SDb
 WD8l4JEHfDcDBn/AoqsCvTO1am6yDlmfK+59RfvY=; b=kEtmlPibHLCRWDlaYRf
 oe8pL7vmO+mmvzwhQj1XuwxEE90k0nvemprmYHgkexOPJACEeeTdgnw7LWRXBpPN
 Tw9e7T9BmJUV/SMvQ/zt/UvncHhTH/kvuxqg64wUvhI99Q/qYPGNIYRa97/1seZJ
 wtpRZWeUUy6Pgdd4IMjMPZB+A27GwcXsuJ5cKZlpzDbwMHZHqa3FpDziaBu8tEG8
 DJM98kvX+pZMP6XGe4DVxYQvKBoJcgb2Lu+5aL2qNGC4OSrxiovLLxDtUPXUEsA6
 xP/OLCAM+7Yk9NkrGOWTUUOETphYTwk43/J9Ut+zYqHDzrLSRi2ondwWeBfoTjnd
 rVA==
X-ME-Sender: <xms:tWHDYmMmDQmnVHAdTfNiw-Xs6wQFFwhEQtZ9KwjgIjr1YGLDkswdhg>
 <xme:tWHDYk9mUDBPezABHZNRnsfXAQWl_DO_rEgiXw6wmdRNroJZwAjA9YZzd5BNOLPFS
 jU6dRAri1dP56wDbCQ>
X-ME-Received: <xmr:tWHDYtThWpiuFtqrIPUuu_BPZZK14nfOhiyA7T4f5yj3hLrP3pkvBp6oL054QQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeitddgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 hmihhsshhinhhgucfvqfcufhhivghlugculdeftddmnegoteeftdduqddtudculdduhedm
 necujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgvth
 gvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrfgr
 thhtvghrnhepteelgfeuleeffffffeekiefghfejuefgtdfgteeigeekvdefffevieekvd
 elteevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 phgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:tWHDYmsL6tFXt4xfrJ1Ee0VsaomW60DpD5-nZNTU_9x5Pss-gueMuA>
 <xmx:tWHDYufC0DMdnckG-gz5F62p4PGGI5uGhOf_8y5oKlcvXCFywAjkOw>
 <xmx:tWHDYq0i2R7N3y4MeXYdibddc72cZTdN7v4vWVn_-atrwAjZarY1fA>
 <xmx:tWHDYrGQEjhoByOZizqThjaHDkU2TVUswalr7THakcEYSlV_hP9SJw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Jul 2022 17:55:00 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 2/8] aspeed: Create SRAM name from first CPU index
Date: Mon,  4 Jul 2022 14:54:51 -0700
Message-Id: <20220704215457.38332-2-peter@pjd.dev>
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

To support multiple SoC's running simultaneously, we need a unique name for
each RAM region. DRAM is created by the machine, but SRAM is created by the
SoC, since in hardware it is part of the SoC's internals.

We need a way to uniquely identify each SRAM region though, for VM
migration. Since each of the SoC's CPU's has an index which identifies it
uniquely from other CPU's in the machine, we can use the index of any of the
CPU's in the SoC to uniquely identify differentiate the SRAM name from other
SoC SRAM's. In this change, I just elected to use the index of the first CPU
in each SoC.

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/arm/aspeed_ast10x0.c | 5 ++++-
 hw/arm/aspeed_ast2600.c | 5 +++--
 hw/arm/aspeed_soc.c     | 5 +++--
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 33ef331771..677699e54c 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -159,6 +159,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     DeviceState *armv7m;
     Error *err = NULL;
     int i;
+    g_autofree char *sram_name = NULL;
 
     if (!clock_has_source(s->sysclk)) {
         error_setg(errp, "sysclk clock must be wired up by the board code");
@@ -183,7 +184,9 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), &error_abort);
 
     /* Internal SRAM */
-    memory_region_init_ram(&s->sram, NULL, "aspeed.sram", sc->sram_size, &err);
+    sram_name = g_strdup_printf("aspeed.sram.%d",
+                                CPU(s->armv7m.cpu)->cpu_index);
+    memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size, &err);
     if (err != NULL) {
         error_propagate(errp, err);
         return;
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 3f0611ac11..64eb5a7b26 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -276,6 +276,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     Error *err = NULL;
     qemu_irq irq;
+    g_autofree char *sram_name = NULL;
 
     /* IO space */
     aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
@@ -335,8 +336,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     }
 
     /* SRAM */
-    memory_region_init_ram(&s->sram, OBJECT(dev), "aspeed.sram",
-                           sc->sram_size, &err);
+    sram_name = g_strdup_printf("aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);
+    memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size, &err);
     if (err) {
         error_propagate(errp, err);
         return;
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 0f675e7fcd..0bb6a2f092 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -239,6 +239,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     AspeedSoCState *s = ASPEED_SOC(dev);
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     Error *err = NULL;
+    g_autofree char *sram_name = NULL;
 
     /* IO space */
     aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
@@ -259,8 +260,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     }
 
     /* SRAM */
-    memory_region_init_ram(&s->sram, OBJECT(dev), "aspeed.sram",
-                           sc->sram_size, &err);
+    sram_name = g_strdup_printf("aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);
+    memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size, &err);
     if (err) {
         error_propagate(errp, err);
         return;
-- 
2.37.0


