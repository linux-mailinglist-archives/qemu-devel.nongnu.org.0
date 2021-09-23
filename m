Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FB04168BD
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 02:10:04 +0200 (CEST)
Received: from localhost ([::1]:41604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTYmx-0001r4-Mg
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 20:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mTYgm-0001e6-TI; Thu, 23 Sep 2021 20:03:41 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:53007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mTYgl-0005rK-Jv; Thu, 23 Sep 2021 20:03:40 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id D0AE05C0187;
 Thu, 23 Sep 2021 20:03:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 23 Sep 2021 20:03:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=9Qo74MPZyYOGlEo0TCbuK9AzuHnBoeMnjVQkyDUEs
 fA=; b=AqxYL8n+IVIsvEVtFaGkfnKdfAMk04chUDLQGO9UzZy3zA/Yz95QrkKD1
 dAWASYIHnndtK3Wk4NaUyBrolX1VSPSjwVHNikyv/7icEbz2q19u3EygBS1TisQl
 dcUfwm+Aq5jBkkz4tD8HhXq3xP8xazFxVLd0W1+qF9DSOZcGrNQuLSAtvc7dE4Nd
 UyrDvtSiXOctDBV4XRh9tcPSThFgxasT3gGWCGoHE+fBrvMQzzkml9ZHv43BJW3z
 76ckHH02UlCjCDj8ROe3k1bOP5F4ETHTKbPKEltxYusrmt/U8NU9pCwakeZbPdsc
 5KTOkj6tz3cj1AU5Hqu2nHhh8Nzug==
X-ME-Sender: <xms:2hVNYeavAIrGRlcY6_GPOE226ogdg-5x2N90fDo4-OAGI9hBwWe5yA>
 <xme:2hVNYRalUUQEZeNrkBV8xAsorP8il0Tg-QsM-Itj_ewJuJMrMOlrYJTp8Z0v1uxpE
 q3W0MU9QwS9_ckM8yQ>
X-ME-Received: <xmr:2hVNYY9mvazyhg_5GHrDePW6hPcrnTewihb-7LAQhZ22nr_NYdjd6P52Fju2u6-EfPPv_FaWepghO_ZBtN6cBN6DG0L0tN17prMBvg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffkjghfhffugggtgfffsehtkeertddttdejnecuhfhrohhmpefhihhnnhcu
 vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
 htthgvrhhnpeeuvdevtdelfeelffdufeefteeukeektdfgieeugffhveetteevhfdvieej
 tdfhleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:2hVNYQqRgIn8dkuXOPj6s698pHJXu4NbkvDmptFuSLSPupA0oTfPJA>
 <xmx:2hVNYZqBiKteZjUMpoVuIsPDX_uyDpYVGipFG7ATGxlsdQQWdSsxmg>
 <xmx:2hVNYeQmbjS8oyAupVIxG-5L-WSIUS6v0ZDmoJtBJzYYKI0Le4OwlQ>
 <xmx:2hVNYQ1oJAPPqtCArE4A8odXx-VNlAPgqm7GjnUfD6ADlk0ajC5X4Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Sep 2021 20:03:37 -0400 (EDT)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Greg Kurz <groug@kaod.org>
Message-Id: <c3b92d7229ffcf954dcdc6e1884660d3325e4f8c.1632437396.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1632437396.git.fthain@linux-m68k.org>
References: <cover.1632437396.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v1 4/9] hw/mos6522: Rename timer callback functions
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Date: Fri, 24 Sep 2021 08:49:56 +1000
Received-SPF: none client-ip=66.111.4.29; envelope-from=fthain@linux-m68k.org;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This improves readability.

Signed-off-by: Finn Thain <fthain@linux-m68k.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/mos6522.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index 1d4a56077e..c0d6bee4cc 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -154,7 +154,7 @@ static void mos6522_timer2_update(MOS6522State *s, MOS6522Timer *ti,
     }
 }
 
-static void mos6522_timer1(void *opaque)
+static void mos6522_timer1_expired(void *opaque)
 {
     MOS6522State *s = opaque;
     MOS6522Timer *ti = &s->timers[0];
@@ -164,7 +164,7 @@ static void mos6522_timer1(void *opaque)
     mos6522_update_irq(s);
 }
 
-static void mos6522_timer2(void *opaque)
+static void mos6522_timer2_expired(void *opaque)
 {
     MOS6522State *s = opaque;
     MOS6522Timer *ti = &s->timers[1];
@@ -445,8 +445,10 @@ static void mos6522_init(Object *obj)
         s->timers[i].index = i;
     }
 
-    s->timers[0].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, mos6522_timer1, s);
-    s->timers[1].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, mos6522_timer2, s);
+    s->timers[0].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                      mos6522_timer1_expired, s);
+    s->timers[1].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                      mos6522_timer2_expired, s);
 }
 
 static void mos6522_finalize(Object *obj)
-- 
2.26.3


