Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E68D14168CE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 02:12:57 +0200 (CEST)
Received: from localhost ([::1]:50718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTYpk-00080i-V6
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 20:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mTYh1-000221-Jz; Thu, 23 Sep 2021 20:03:55 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:54163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mTYgz-00060a-Lk; Thu, 23 Sep 2021 20:03:55 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id E7FEA5C019C;
 Thu, 23 Sep 2021 20:03:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 23 Sep 2021 20:03:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=6FN1Ik0y63ahr7n0epwO3nTzCXi+0u0UuCZ7ekaH/
 RU=; b=uIIitw+w5kX8+JzbP7680+FeE0yFjv0nzqVj0EdFCM+isGrKPUjgDbgvR
 G0MuLAz8tyhSfL8DFDc37dK4GJ1/BEgdRQJOw1Rr2OZLryaEUdpQLI8ar+ieJrQd
 toPSzciaHz57L7n74DEK8x4Kkw5EJUTR8jxj2FIpTVIsOJcmds/uCH5SWngBc2U0
 wThhGqGyyeLqIL7YlHJ4P59zSH5OVkmnj6dLogCmzOuRMEifol9VQF4DRBWQOBkv
 0wKYzUZLUc2OEa32K2yVLzulIbeVr900y2IIZYsT2b5EFVzxnKH07367hu0D3vtc
 oB2PHKBxDHhjIqJxy3HvSJmvKd0KQ==
X-ME-Sender: <xms:6BVNYV-gO-u6LqARvE3n_sUjdIldUftx-9wcC1lQmrcm3GDqKCbHfw>
 <xme:6BVNYZu-Ajy5TsK-Kdmi4g6-3g7yPK-xIP48Sb4WbBC8OFOH9uoCZCqnG7w5Rt89P
 0t925B62pgefLoCDKw>
X-ME-Received: <xmr:6BVNYTDCrhxdXn4fDSk_Q2P0Mut5x4AJPVT8RtU-Lr7o-utnJiEP5bTSwRIsI5JJf5dHxlqxuTKZAfOSXZSDMJIwmIrvD0WLB2al-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffkjghfhffugggtgfffsehtkeertddttdejnecuhfhrohhmpefhihhnnhcu
 vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
 htthgvrhhnpeeuvdevtdelfeelffdufeefteeukeektdfgieeugffhveetteevhfdvieej
 tdfhleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:6BVNYZc6AyK2qFSKjS99-UNXpHhauduBoxle6Gp9WVkcB7xoY1ZkNA>
 <xmx:6BVNYaNge5Pt2StE6dpjtoWIff9101PVku-kVQgFgWouhiecEknv-w>
 <xmx:6BVNYbkzhZXzGYxREjHr29DyTaJ7NKlidMhyTQ5_65tQPUURQVWD8A>
 <xmx:6BVNYTa_RpWibFyDEWh17OKEAKB8Dki86zOqitkBz8vjt8v-cLPqZQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Sep 2021 20:03:51 -0400 (EDT)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Greg Kurz <groug@kaod.org>
Message-Id: <1257e8f12a02c8794e0a8682ef860b569f1d9ce1.1632437396.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1632437396.git.fthain@linux-m68k.org>
References: <cover.1632437396.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v1 6/9] hw/mos6522: Call mos6522_update_irq() when appropriate
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

It necessary to call mos6522_update_irq() when the interrupt flags
change and unnecessary when they haven't.

Signed-off-by: Finn Thain <fthain@linux-m68k.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/mos6522.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index 6bd60f2118..bfe1719b18 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -203,10 +203,12 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
     if (now >= s->timers[0].next_irq_time) {
         mos6522_timer1_update(s, &s->timers[0], now);
         s->ifr |= T1_INT;
+        mos6522_update_irq(s);
     }
     if (now >= s->timers[1].next_irq_time) {
         mos6522_timer2_update(s, &s->timers[1], now);
         s->ifr |= T2_INT;
+        mos6522_update_irq(s);
     }
     switch (addr) {
     case VIA_REG_B:
@@ -231,7 +233,6 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
         break;
     case VIA_REG_T1CH:
         val = get_counter(s, &s->timers[0]) >> 8;
-        mos6522_update_irq(s);
         break;
     case VIA_REG_T1LL:
         val = s->timers[0].latch & 0xff;
-- 
2.26.3


