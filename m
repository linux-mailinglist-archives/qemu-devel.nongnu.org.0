Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D143B3F5BE6
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 12:20:25 +0200 (CEST)
Received: from localhost ([::1]:54924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mITXc-0005lm-LX
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 06:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mITSp-00027b-Bz; Tue, 24 Aug 2021 06:15:27 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:47773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mITSn-00050a-EA; Tue, 24 Aug 2021 06:15:27 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 4425E3200AA2;
 Tue, 24 Aug 2021 06:15:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 24 Aug 2021 06:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=IDkdkDgW+ZxcqEDll+MWlmkAyj43R
 Bd7pKa5IBWvIBU=; b=eBb16zL4ZqOj49/9HNrZABVEwdIJoW7ci7PhtlUlanEQQ
 MEfqwuibP5LKAusXYp19/Z+maUPi6SPwVEl2QeeQvtq6RkO4H5NF+NMFtiTx1Ouy
 chbEtLn2mfA2HoOPGC7tarYecPvbFpMf9guIIYuCPLyX93D6mHL2ajwLukkAavWU
 +ufmAyZ+vaGo2dh1zCXM/XhwktRHtcN2xS4sdiF8W8hEQJX6FkREgIjrG1Xj7BRJ
 ZK0uw1YEg98G61ELqcrJwW4h1p39erEfl0EbqXKn7pQ0khS4REw3NElFYvElvgnY
 IJ53iUWRHvnzbgpH9qyJMoVdC2ehAkYSzBtlxsleQ==
X-ME-Sender: <xms:ucYkYQ8Z57prLkENUuwDYQhIjTEBFh_nrnZuFSIk3gq4nzvTU1kTKg>
 <xme:ucYkYYtBs5hAa1NvjGJOnoMpp4rFlbYUkJbKHoGKaxPHBxPxiRr6uHOWicfjoA7hZ
 -8-t37JFPsEd2-XNRY>
X-ME-Received: <xmr:ucYkYWAiuv6Dz6NN48NdlHDq20gzaCfkiLM1k_iIqu-g8_Zbc5WAw3wXHJk8OTkA2SASkojKJjRW18en7RpIeRjAVGRHV-gYgQDRUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtjedgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffkjghfhffuffestddtredttddttdenucfhrhhomhephfhinhhnucfvhhgr
 ihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvg
 hrnhephfetledtgeffuedujedvteevgfdtudeufeekvdfhveekkefhgfevtdfhveeuueet
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthh
 grihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:ucYkYQdPhuU6oSyfx3XtXmiR-zMRc4-8wbcqUOcWvLGEy685O4EsRg>
 <xmx:ucYkYVO0540d6UAC6DPS3dhziA6hV14xPrc4xLjYJQyLMK0MEL9HLQ>
 <xmx:ucYkYan1FE-S2xRC0j3xNbBoeOO1UGVt-1lhBO293d1UgGuVHlwwHw>
 <xmx:usYkYWoHXZTN6zL-QY49cYcxr7kKEQNn8xMGr3Ttz1StW4sUdDJiwA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Aug 2021 06:15:18 -0400 (EDT)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Message-Id: <21f20ab5a100e4947d840080114f3f0511aade86.1629799776.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1629799776.git.fthain@linux-m68k.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [RFC 09/10] hw/mos6522: Avoid using discrepant QEMU clock values
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

mos6522_read() and mos6522_write() may call various functions to determine
timer irq state, timer counter value and QEMUTimer deadline. All called
functions must use the same value for the present time.

Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
 hw/misc/mos6522.c | 51 +++++++++++++++++++++++++----------------------
 1 file changed, 27 insertions(+), 24 deletions(-)

diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index 0dd3ccf945..23a440b64f 100644
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
@@ -52,12 +52,12 @@ static void mos6522_update_irq(MOS6522State *s)
     }
 }
 
-static unsigned int get_counter(MOS6522State *s, MOS6522Timer *ti)
+static unsigned int get_counter(MOS6522State *s, MOS6522Timer *ti, int64_t now)
 {
     int64_t d;
     unsigned int counter;
 
-    d = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - ti->load_time,
+    d = muldiv64(now - ti->load_time,
                  ti->frequency, NANOSECONDS_PER_SECOND);
 
     if (ti->index == 0) {
@@ -89,7 +89,7 @@ static void set_counter(MOS6522State *s, MOS6522Timer *ti, unsigned int val)
 }
 
 static int64_t get_next_irq_time(MOS6522State *s, MOS6522Timer *ti,
-                                 int64_t current_time)
+                                 int64_t now)
 {
     int64_t d, next_time;
     unsigned int counter;
@@ -99,7 +99,7 @@ static int64_t get_next_irq_time(MOS6522State *s, MOS6522Timer *ti,
     }
 
     /* current counter value */
-    d = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - ti->load_time,
+    d = muldiv64(now - ti->load_time,
                  ti->frequency, NANOSECONDS_PER_SECOND);
 
     /* the timer goes down from latch to -1 (period of latch + 2) */
@@ -123,20 +123,19 @@ static int64_t get_next_irq_time(MOS6522State *s, MOS6522Timer *ti,
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
     if ((s->ier & T1_INT) == 0 ||
         ((s->acr & T1MODE) == T1MODE_ONESHOT && ti->oneshot_fired)) {
         timer_del(ti->timer);
@@ -146,12 +145,15 @@ static void mos6522_timer1_update(MOS6522State *s, MOS6522Timer *ti,
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
     if ((s->ier & T2_INT) == 0 || (s->acr & T2MODE) || ti->oneshot_fired) {
         timer_del(ti->timer);
     } else {
@@ -163,9 +165,10 @@ static void mos6522_timer1_expired(void *opaque)
 {
     MOS6522State *s = opaque;
     MOS6522Timer *ti = &s->timers[0];
+    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
 
     ti->oneshot_fired = true;
-    mos6522_timer1_update(s, ti, ti->next_irq_time);
+    mos6522_timer1_update(s, ti, now);
     s->ifr |= T1_INT;
     mos6522_update_irq(s);
 }
@@ -174,9 +177,10 @@ static void mos6522_timer2_expired(void *opaque)
 {
     MOS6522State *s = opaque;
     MOS6522Timer *ti = &s->timers[1];
+    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
 
     ti->oneshot_fired = true;
-    mos6522_timer2_update(s, ti, ti->next_irq_time);
+    mos6522_timer2_update(s, ti, now);
     s->ifr |= T2_INT;
     mos6522_update_irq(s);
 }
@@ -233,12 +237,12 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
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
@@ -247,12 +251,12 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
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
@@ -360,10 +364,9 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
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


