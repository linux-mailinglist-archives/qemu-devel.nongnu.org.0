Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C43C6325DC8
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 08:00:48 +0100 (CET)
Received: from localhost ([::1]:46778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFX7H-0006Bz-Nx
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 02:00:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lFX4x-0004Rs-MT; Fri, 26 Feb 2021 01:58:23 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:54039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lFX4w-0007fP-4g; Fri, 26 Feb 2021 01:58:23 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 621555C0121;
 Fri, 26 Feb 2021 01:58:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 26 Feb 2021 01:58:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Fb93Bzjb5/DBK
 A8OsJQQHo/9F+tmDht50gOp/EQCHyQ=; b=aYvFJxFJbn3owyg+V35UAlMBx0Qfw
 J69xf6j8QanvD2z9WtghfLcSoBWDqhBWQadWcyzkBttOzLO5NoYvZ1ZGScnkv3At
 TmSgT+lA25tAy2lPpTQTMOB1hDU7fLJszFxSXPxYc0wfIFCokJfLf8LdReNt8TRb
 7fSj0bH+KhLyEgnvhW8TaQumpLYy2pwrlRToHoQPFQW/3FQmk2fVXvM1E9//DrJV
 V3ardECi36DYlsAGpipm4vHxn84scSujTmC+DbB2ARtmz+Ln21woSpt65C2mtnO0
 2PiL0A2agyqXtpXGARZhUOuhSC0a6AG4fAOe9hhJ4x5+k7OhdWgZy6KXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Fb93Bzjb5/DBKA8OsJQQHo/9F+tmDht50gOp/EQCHyQ=; b=h6o031Pj
 Tp3QG5V1wQn4wsADrBe64X9EuBg9EV0G9jFWhnUNY7ww1TGfdNfuIHMCHOy+sTp3
 hzBr+Ijv9na1dRM/o5wLdxeK0ZqC+5Goim2/RsZGxeiWUktzCXHr711AqNhWlkwn
 bA7AGmxFtWmS47HygeOtbl7FkpiMmrRCb7gji5t1B2PQJNeSQTKDSeibVjxg/N41
 shdRV6TLmvn+Koj8w9UUxGbjEM7ZrkqgzK8sqQ5Z+Z+fDhe35AXckNKIHUfiIjro
 0DO+isHEi3nPeZchhXIl+0Pr9O7euBJwf0XDGd7jslTqMqTV1e/a/dMUCT0MaU7k
 90S8Uev7Hh56/Q==
X-ME-Sender: <xms:DZw4YHupVMsl84br0c-0xQ09FxIduYwTxZn5UcOf6knG67r9A-NRxQ>
 <xme:DZw4YIfHqtIMROYvp-sTM8RPHmswZ7HUNUzByylrD09hD9BCTLLI35055qfYsrt-l
 h78zV_nSxbY5ztEAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrledtgddutdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppedugedrvddrledurdefjeenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfi
 esrghjrdhiugdrrghu
X-ME-Proxy: <xmx:DZw4YKyWzhsii1WY74Z8WukQypKkNs64QoWi2_ut1k5V_hJYopdcKA>
 <xmx:DZw4YGMbyMUfwMazbAHikSF7PGzov66q6IYi3pDA10LrkABWa2M39Q>
 <xmx:DZw4YH9fVlQ_ZXEF_zg3cxRqIrJBh35C84g_UkXk3NVJ7QK1KUpE0g>
 <xmx:DZw4YDYGmZrXq6QhCkHrTRYBcIuM5xzzCZBNfvSdNkL4gDPtVn6MQA>
Received: from localhost.localdomain
 (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id ACC9B240054;
 Fri, 26 Feb 2021 01:58:17 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH 2/4] arm: ast2600: Fix iBT IRQ ID
Date: Fri, 26 Feb 2021 17:27:56 +1030
Message-Id: <20210226065758.547824-3-andrew@aj.id.au>
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

The AST2600 allocates individual GIC IRQ lines for the LPC sub-devices.
This is a contrast to the AST2400 and AST2500 which use one shared VIC
IRQ line for the LPC sub-devices. Switch the iBT device to use the
GIC IRQ ID documented in the datasheet.

While we're here, set the number of IRQs to the allocated number of IRQs
in the datasheet.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/aspeed_ast2600.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index bc0eeb058b24..2125a96ef317 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -65,7 +65,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
 
 #define ASPEED_A7MPCORE_ADDR 0x40460000
 
-#define AST2600_MAX_IRQ 128
+#define AST2600_MAX_IRQ 197
 
 /* Shared Peripheral Interrupt values below are offset by -32 from datasheet */
 static const int aspeed_soc_ast2600_irqmap[] = {
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


