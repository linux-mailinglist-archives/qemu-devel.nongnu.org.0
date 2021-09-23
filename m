Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 420D44168CF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 02:13:12 +0200 (CEST)
Received: from localhost ([::1]:51716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTYpz-0000DI-9e
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 20:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mTYhP-0002Zv-HH; Thu, 23 Sep 2021 20:04:19 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:41037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mTYhO-0006LP-0I; Thu, 23 Sep 2021 20:04:19 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id AC0E45C0187;
 Thu, 23 Sep 2021 20:04:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 23 Sep 2021 20:04:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=jyIp5yIMOoTZKmnnLdy3LdOylWpvH
 B2pKLO2BjCdq6k=; b=XPiWvercHhuDcvn/LZhha0XdJC2WD67WpP9H6m+Tigsx4
 75sCfWeEcjD7P99BFaRPtznS0wesUleu97529suAJSEfKiVEBbwIQE9Vav9ml+Yn
 J1QwdTUQKHMCZuYwPLATO75nlpRVhl2NgJ2ZXRIpM5pVJPJ8iZyLNbfBLU0TYM+M
 RDMaRsdGhmXiEVsBNVUNjtgEgyqT5sRzAooT8939FEgWV/HXUIOqefV+Q4iYaa9d
 y8yo7pvgsBCT0Wy1FhC6RjQUB1ThEA21sSFkDs47ZURdWQN1U8CDjMaczRie9qFT
 5l9ZL+h6N7wgQI5wScuFgnnPgh2ftabHVAbe7JQ3g==
X-ME-Sender: <xms:ABZNYTQGIsGlBEACV7vp4YtnzzXNoSPm4wZIHo4CNkZ3UV_qu4beFA>
 <xme:ABZNYUx49eRhhYis4Eq8eQK5StZVaG8xWUakkoyBcApZgHxjpaZRSn-1RJ_M-Gx1a
 nfFUcjrfG9nmQNCVOg>
X-ME-Received: <xmr:ABZNYY3YCMz_Z1p2QSZfzPiH41b1Wd4qaPwBZBHnJ0T0H-EKo-xRhrOYl4TEb2EdK0wy6DtDTWUv6HWHY0UBylC_3MBddonJjHskOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffkjghfhffuffestddtredttddttdenucfhrhhomhephfhinhhnucfvhhgr
 ihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvg
 hrnhephfetledtgeffuedujedvteevgfdtudeufeekvdfhveekkefhgfevtdfhveeuueet
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthh
 grihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:ABZNYTBOMv8zKldsWhbJ12qIZ4mn9cCC3Pv5pNNdrw82ml0k-4MsIg>
 <xmx:ABZNYcguLsu2NqVd8M2swsbtUkwhAGowYEpVvHBcQz7wcGSGTxPubQ>
 <xmx:ABZNYXo3-BEOmfTsIhvTHmgj53QQB_2bJG6Jyf7FuW3Xu_nJB224Sg>
 <xmx:ABZNYftMtZfbaXGsOMZ96deK67We8a5BIDH7vz_volmxYXvDoUmIMA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Sep 2021 20:04:15 -0400 (EDT)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Greg Kurz <groug@kaod.org>
Message-Id: <543f3f17f944ed3c59bf3282f36ca7011dd5da6d.1632437397.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1632437396.git.fthain@linux-m68k.org>
References: <cover.1632437396.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v1 9/9] hw/mos6522: Implement oneshot mode
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

Timer 1 has two modes: continuous interrupt and oneshot.

Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
Changed since RFC:
 - Moved to end of series. This patch is quite a bit shorter here.
---
 hw/misc/mos6522.c         | 6 ++++--
 include/hw/misc/mos6522.h | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index 8957c5e65c..bbed0b84c0 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -148,7 +148,8 @@ static void mos6522_timer1_update(MOS6522State *s, MOS6522Timer *ti,
     }
     get_counter(s, ti, now);
     ti->next_irq_time = get_next_irq_time(s, ti, now);
-    if ((s->ier & T1_INT) == 0 || (s->acr & T1MODE) != T1MODE_CONT) {
+    if ((s->ier & T1_INT) == 0 ||
+        ((s->acr & T1MODE) == T1MODE_ONESHOT && ti->state >= irq)) {
         timer_del(ti->timer);
     } else {
         timer_mod(ti->timer, ti->next_irq_time);
@@ -163,7 +164,7 @@ static void mos6522_timer2_update(MOS6522State *s, MOS6522Timer *ti,
     }
     get_counter(s, ti, now);
     ti->next_irq_time = get_next_irq_time(s, ti, now);
-    if ((s->ier & T2_INT) == 0) {
+    if ((s->ier & T2_INT) == 0 || (s->acr & T2MODE) || ti->state >= irq) {
         timer_del(ti->timer);
     } else {
         timer_mod(ti->timer, ti->next_irq_time);
@@ -345,6 +346,7 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
     case VIA_REG_ACR:
         s->acr = val;
         mos6522_timer1_update(s, &s->timers[0], now);
+        mos6522_timer2_update(s, &s->timers[1], now);
         break;
     case VIA_REG_PCR:
         s->pcr = val;
diff --git a/include/hw/misc/mos6522.h b/include/hw/misc/mos6522.h
index a2df5fa942..4dbba6b273 100644
--- a/include/hw/misc/mos6522.h
+++ b/include/hw/misc/mos6522.h
@@ -50,8 +50,10 @@
 #define T1_INT             0x40    /* Timer 1 interrupt */
 
 /* Bits in ACR */
+#define T2MODE             0x20    /* Timer 2 mode */
 #define T1MODE             0xc0    /* Timer 1 mode */
 #define T1MODE_CONT        0x40    /*  continuous interrupts */
+#define T1MODE_ONESHOT     0x00    /*  timed interrupt */
 
 /* VIA registers */
 #define VIA_REG_B       0x00
-- 
2.26.3


