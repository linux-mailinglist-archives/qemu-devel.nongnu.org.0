Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA403F5BE7
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 12:20:28 +0200 (CEST)
Received: from localhost ([::1]:55134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mITXf-0005u9-14
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 06:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mITSd-0001Yp-QE; Tue, 24 Aug 2021 06:15:15 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:46347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mITSc-0004ok-7i; Tue, 24 Aug 2021 06:15:15 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 85BD33200B40;
 Tue, 24 Aug 2021 06:15:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 24 Aug 2021 06:15:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=GM5HFK0butEDA0VWBBv4WFBZjaN4r
 kb9SNHTzrKjDB0=; b=lF3wsPfXwj/7mPHuhPhqV8UjWZAjv3aOZSX1N7UGn2LIc
 vC/tn1p/MoKlkGA90uLy9iaEAEs4g/SJiiygj3mSUWXGgHuyJBCHSwmLfwY23u0D
 GTReu8i0sbAgiHkhslGGYEfTP46vCX7wT68nzMyPcQGxZdz8XdBlprUPg730OuDX
 rmjboLV9gye0LlvZYncqjU410jh4eKV7LsTlAIwBS98swGc7QNA3hkpMoXCU53tY
 i7m8GoUctPBRvC/O9WaEPHgjj6a9G9pI0rbGa8ku09CUqmHAt3d4qLil1mHDn+kN
 IP3tN3YUWKDUcO8JwgyK9qfShWXUOFbU7dlSptz3w==
X-ME-Sender: <xms:r8YkYc6wpxmYCamrnspujJBaTu2pTEAHm52vCt2ynDsz2LoLWHhqgw>
 <xme:r8YkYd53HX-pG8At5Ei3lXWUJSdKuG3ctAMEVugU-yuiU5jjPVA_ojq_QPXUicxu7
 TUYIPuh_Pd63ipZp8Y>
X-ME-Received: <xmr:r8YkYbfVRZV5rIRU9jTgBDprqvDQNsqpWmKNz24WDCZWxBu_sRup6dsOlga2Iliz-1fj2obj8sCJVtGdXYt_Crx_aa3z8k5u6gJ3yg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtjedgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffkjghfhffuffestddtredttddttdenucfhrhhomhephfhinhhnucfvhhgr
 ihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvg
 hrnhephfetledtgeffuedujedvteevgfdtudeufeekvdfhveekkefhgfevtdfhveeuueet
 necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepfhhthh
 grihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:r8YkYRLVVUh4N3BgzAL4-awl1gc-yIy8y_nEChcR4enxxsGHGmJj_A>
 <xmx:r8YkYQKp1S5NbAH-bQQxjBz9DcbZdLZxoZtfTE-p0PUoXhdHYd7Aug>
 <xmx:r8YkYSxej_FRRz3S3CDsEX7KKZKuKxU8b_3uuQbVb0jzEuxpMM3utA>
 <xmx:sMYkYU3d_ATiQNjMOIjKATEpK_qQhk-W5C4hHU73y8VhR4RYmY5hEw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Aug 2021 06:15:09 -0400 (EDT)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Message-Id: <c886cdc2911f250c3e8e15ceb717124c7044b50b.1629799776.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1629799776.git.fthain@linux-m68k.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [RFC 08/10] hw/mos6522: Call mos6522_update_irq() when appropriate
Date: Tue, 24 Aug 2021 20:09:36 +1000
Received-SPF: none client-ip=64.147.123.25; envelope-from=fthain@linux-m68k.org;
 helo=wout2-smtp.messagingengine.com
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

It necessary to call mos6522_update_irq() when the interrupt flags
change and unnecessary when they haven't.

Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
 hw/misc/mos6522.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index 0a241fe9f8..0dd3ccf945 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -208,11 +208,13 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
         s->timers[0].oneshot_fired = true;
         mos6522_timer1_update(s, &s->timers[0], now);
         s->ifr |= T1_INT;
+        mos6522_update_irq(s);
     }
     if (now >= s->timers[1].next_irq_time) {
         s->timers[1].oneshot_fired = true;
         mos6522_timer2_update(s, &s->timers[1], now);
         s->ifr |= T2_INT;
+        mos6522_update_irq(s);
     }
     switch (addr) {
     case VIA_REG_B:
@@ -237,7 +239,6 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
         break;
     case VIA_REG_T1CH:
         val = get_counter(s, &s->timers[0]) >> 8;
-        mos6522_update_irq(s);
         break;
     case VIA_REG_T1LL:
         val = s->timers[0].latch & 0xff;
-- 
2.26.3


