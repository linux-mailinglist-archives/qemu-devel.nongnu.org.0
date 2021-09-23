Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D534168C5
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 02:11:18 +0200 (CEST)
Received: from localhost ([::1]:43920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTYo9-0003Nu-I0
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 20:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mTYh9-0002MZ-TS; Thu, 23 Sep 2021 20:04:05 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:41315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mTYh8-00065y-7o; Thu, 23 Sep 2021 20:04:03 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 233CD5C018D;
 Thu, 23 Sep 2021 20:04:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 23 Sep 2021 20:04:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=S+oTM3sGKek5uqtfqsiaDi2wP4KeJJgfvke7llKGc
 gU=; b=Nez2UMSOJ/xeYauQSpneIhcp7kNgecXrFwkRPAm7zy0s+1LJhS2bDYK8t
 V7fGJaW0vq9N3Hy1Xvl0toLTfUjQZP2pov1UNtJLNKsMK0kaOPCMDwStX6ryqqzV
 zOQbahTIsXOW7K1tu/LD+dzerO2oaZCBDxcihenonL9Xh3F+xuwI8jgS6x/u4KDd
 KrzP4ybcFDFfJfuI0e8Lrg68GqDwC2hUkddEl3HDOF8/kGDtXg5YaPSou3+H3A9t
 xNwvBTHiHu8eGeUQEm5lT4PJKfV6TX/MOYGb/UKq2eXldIZsBYXnqx+5TLF+DraB
 Vp3fqk5XY+zDlheeTmhMNEEZ0wk0A==
X-ME-Sender: <xms:8RVNYaBZ7Q7c1SDC9bcYvvl5QOJERSI_gkwYmXNA4xXBMDZL9VzRMQ>
 <xme:8RVNYUgFC0EPIzR82AICygPy6j0SE9icfi9mnsjia5pF_965nYm16r5-zCBIHQ0Am
 rgadVynnqPLrDQJi04>
X-ME-Received: <xmr:8RVNYdlHMN651w5XhnkADnTCQ757_GUCXRmTX_O3oOAUuKcbUMQ3lvlPpyiG0F1fPVbRq2C0pFBCJBDupI7jv6z7mW8MImDLyOh4gg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffkjghfhffugggtgfffsehtkeertddttdejnecuhfhrohhmpefhihhnnhcu
 vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
 htthgvrhhnpeeuvdevtdelfeelffdufeefteeukeektdfgieeugffhveetteevhfdvieej
 tdfhleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:8RVNYYz5CqqmTUwoaUtpcjEBssOKq3SUyS-XtXqKp01qUA9h4nJK-w>
 <xmx:8RVNYfTMM_QxtFx3ovMG7Tkhpn6F1OjmJnOdb_RqQ-Ruc__-rZpIsw>
 <xmx:8RVNYTYYCI55_RkBSqR4C69hpTqLzeO0TOHUwIAiwQqhDPUqmBy-7g>
 <xmx:8RVNYacECI-Qqs6eGazQdqEYKa__O7_MBCpPwvMrhI3Sq5qliZqTFw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Sep 2021 20:03:58 -0400 (EDT)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Greg Kurz <groug@kaod.org>
Message-Id: <cf4fc15d3ecdbb1a22a855244348e7225503637a.1632437396.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1632437396.git.fthain@linux-m68k.org>
References: <cover.1632437396.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v1 7/9] hw/mos6522: Avoid using discrepant QEMU clock values
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

mos6522_read() and mos6522_write() may call various functions to determine
timer irq state, timer counter value and QEMUTimer deadline. All called
functions must use the same value for the present time.

Signed-off-by: Finn Thain <fthain@linux-m68k.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Changed since RFC
 - Moved the changes to QEMUTimer callbacks to the next patch.
 - Fix whitespace.
---
 hw/misc/mos6522.c | 47 +++++++++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 24 deletions(-)

diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index bfe1719b18..385ea81b62 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -39,9 +39,9 @@
 /* XXX: implement all timer modes */
 
 static void mos6522_timer1_update(MOS6522State *s, MOS6522Timer *ti,
-                                  int64_t current_time);
+                                  int64_t now);
 static void mos6522_timer2_update(MOS6522State *s, MOS6522Timer *ti,
-                                  int64_t current_time);
+                                  int64_t now);
 
 static void mos6522_update_irq(MOS6522State *s)
 {
@@ -52,13 +52,12 @@ static void mos6522_update_irq(MOS6522State *s)
     }
 }
 
-static unsigned int get_counter(MOS6522State *s, MOS6522Timer *ti)
+static unsigned int get_counter(MOS6522State *s, MOS6522Timer *ti, int64_t now)
 {
     int64_t d;
     unsigned int counter;
 
-    d = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - ti->load_time,
-                 ti->frequency, NANOSECONDS_PER_SECOND);
+    d = muldiv64(now - ti->load_time, ti->frequency, NANOSECONDS_PER_SECOND);
 
     if (ti->index == 0) {
         /* the timer goes down from latch to -1 (period of latch + 2) */
@@ -88,7 +87,7 @@ static void set_counter(MOS6522State *s, MOS6522Timer *ti, unsigned int val)
 }
 
 static int64_t get_next_irq_time(MOS6522State *s, MOS6522Timer *ti,
-                                 int64_t current_time)
+                                 int64_t now)
 {
     int64_t d, next_time;
     unsigned int counter;
@@ -98,8 +97,7 @@ static int64_t get_next_irq_time(MOS6522State *s, MOS6522Timer *ti,
     }
 
     /* current counter value */
-    d = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - ti->load_time,
-                 ti->frequency, NANOSECONDS_PER_SECOND);
+    d = muldiv64(now - ti->load_time, ti->frequency, NANOSECONDS_PER_SECOND);
 
     /* the timer goes down from latch to -1 (period of latch + 2) */
     if (d <= (ti->counter_value + 1)) {
@@ -122,20 +120,19 @@ static int64_t get_next_irq_time(MOS6522State *s, MOS6522Timer *ti,
     trace_mos6522_get_next_irq_time(ti->latch, d, next_time - d);
     next_time = muldiv64(next_time, NANOSECONDS_PER_SECOND, ti->frequency) +
                          ti->load_time;
-
-    if (next_time <= current_time) {
-        next_time = current_time + 1;
-    }
     return next_time;
 }
 
 static void mos6522_timer1_update(MOS6522State *s, MOS6522Timer *ti,
-                                 int64_t current_time)
+                                  int64_t now)
 {
     if (!ti->timer) {
         return;
     }
-    ti->next_irq_time = get_next_irq_time(s, ti, current_time);
+    ti->next_irq_time = get_next_irq_time(s, ti, now);
+    if (ti->next_irq_time <= now) {
+        ti->next_irq_time = now + 1;
+    }
     if ((s->ier & T1_INT) == 0 || (s->acr & T1MODE) != T1MODE_CONT) {
         timer_del(ti->timer);
     } else {
@@ -144,12 +141,15 @@ static void mos6522_timer1_update(MOS6522State *s, MOS6522Timer *ti,
 }
 
 static void mos6522_timer2_update(MOS6522State *s, MOS6522Timer *ti,
-                                 int64_t current_time)
+                                  int64_t now)
 {
     if (!ti->timer) {
         return;
     }
-    ti->next_irq_time = get_next_irq_time(s, ti, current_time);
+    ti->next_irq_time = get_next_irq_time(s, ti, now);
+    if (ti->next_irq_time <= now) {
+        ti->next_irq_time = now + 1;
+    }
     if ((s->ier & T2_INT) == 0) {
         timer_del(ti->timer);
     } else {
@@ -227,12 +227,12 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
         val = s->dira;
         break;
     case VIA_REG_T1CL:
-        val = get_counter(s, &s->timers[0]) & 0xff;
+        val = get_counter(s, &s->timers[0], now) & 0xff;
         s->ifr &= ~T1_INT;
         mos6522_update_irq(s);
         break;
     case VIA_REG_T1CH:
-        val = get_counter(s, &s->timers[0]) >> 8;
+        val = get_counter(s, &s->timers[0], now) >> 8;
         break;
     case VIA_REG_T1LL:
         val = s->timers[0].latch & 0xff;
@@ -241,12 +241,12 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
         val = (s->timers[0].latch >> 8) & 0xff;
         break;
     case VIA_REG_T2CL:
-        val = get_counter(s, &s->timers[1]) & 0xff;
+        val = get_counter(s, &s->timers[1], now) & 0xff;
         s->ifr &= ~T2_INT;
         mos6522_update_irq(s);
         break;
     case VIA_REG_T2CH:
-        val = get_counter(s, &s->timers[1]) >> 8;
+        val = get_counter(s, &s->timers[1], now) >> 8;
         break;
     case VIA_REG_SR:
         val = s->sr;
@@ -356,10 +356,9 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
         }
         mos6522_update_irq(s);
         /* if IER is modified starts needed timers */
-        mos6522_timer1_update(s, &s->timers[0],
-                              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
-        mos6522_timer2_update(s, &s->timers[1],
-                              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
+        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        mos6522_timer1_update(s, &s->timers[0], now);
+        mos6522_timer2_update(s, &s->timers[1], now);
         break;
     default:
         g_assert_not_reached();
-- 
2.26.3


