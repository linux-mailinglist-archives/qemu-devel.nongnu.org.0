Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 883364168D2
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 02:14:09 +0200 (CEST)
Received: from localhost ([::1]:55902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTYqu-0002zT-GW
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 20:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mTYhK-0002SI-7x; Thu, 23 Sep 2021 20:04:14 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:60665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mTYhG-0006Dj-Az; Thu, 23 Sep 2021 20:04:13 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7432A5C0187;
 Thu, 23 Sep 2021 20:04:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 23 Sep 2021 20:04:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=LLhm4CU4AG3iwbguueJg3PtnwMvsB
 b7ZkGRHWxRiyyA=; b=S7KdF1AwiTS4pXtnp5kqw5Am7qWJroY2nrsnMfxqAKPIa
 UTIKRENV5I5HNRxXDHAhby3A8IliFRTFlYuEBnmYODdBxWYnJ4jy3fstmapg1yXS
 4TF5ICUwmISuzYZkciyFKBA3v3VL396+xp0rfx/FVh4zvnzDL457nfAkRy3MsROY
 /Ip6jqnAydEeOq0xOfu+YFpi20ewX0wawxbd4OL7IW5Wr+9shDwtYtz7D3H10xX9
 QOav/Wms7VQzAuF3RklQaanmYHuyXOD61YQXeCqEBzDnkMaznrajMGHDKT+WFzGc
 CfbaPbZkClDfeiANUQUMJC95+isNoK0ZnPMx1z1ZQ==
X-ME-Sender: <xms:-RVNYcde-ev_kD6XNPpzqFcBrP2okshP85IbHaZkqibmEZxDo_ovJw>
 <xme:-RVNYeNAvr2gWny26A-oucJp9yyqXNITVoDZE1oABwsOEvAuo0dCbYnXyL3HlDfw2
 E5N3cVk6lbC2NqY1rE>
X-ME-Received: <xmr:-RVNYdjq8VrxHo0NXjIn74ecPZYw5hTZ8L01taMbISGtbyLT3cgj0RZxNLAnuQr0KLzTkIHqiEP9Td3O-c1-hiYOQG0jwh-bzcMVYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffkjghfhffuffestddtredttddttdenucfhrhhomhephfhinhhnucfvhhgr
 ihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvg
 hrnhephfetledtgeffuedujedvteevgfdtudeufeekvdfhveekkefhgfevtdfhveeuueet
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthh
 grihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:-RVNYR96AiaczeGhcGw-C4BfTygmI6CV2tYeUsy2RGxPI1AP14b5Tg>
 <xmx:-RVNYYudnRuMrFVjmaFSx8k0Ic14N-VON_46DlpyB2RsVbNnU92Kdw>
 <xmx:-RVNYYGSsaTZVtnkUc0XZE259kE7bxFTV08dIr_p6JxyD48FNiPh2A>
 <xmx:-RVNYR6xDEtv8dRTGxRqbVlC5_1yGdRv9voP9FX3Ru-V7XcDcuwFrQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Sep 2021 20:04:07 -0400 (EDT)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Greg Kurz <groug@kaod.org>
Message-Id: <4e16dd5e958c89d2d6c4858c7430836a5f3bd140.1632437396.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1632437396.git.fthain@linux-m68k.org>
References: <cover.1632437396.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v1 8/9] hw/mos6522: Synchronize timer interrupt and timer
 counter
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

We rely on a QEMUTimer callback to set the interrupt flag, and this races
with counter register accesses, such that the guest might see the counter
reloaded but might not see the interrupt flagged.

According to the datasheet, a real 6522 device counts down to FFFF, then
raises the relevant IRQ. After the FFFF count, the counter reloads from
the latch (for timer 1) or continues to decrement thru FFFE (for timer 2).

Therefore, the guest operating system may read zero from T1CH and infer
that the counter has not yet wrapped (given another full count hasn't
yet elapsed.)

Similarly, the guest may find the timer interrupt flag to be set and
infer that the counter is non-zero (given another full count hasn't yet
elapsed).

Synchronize the timer counter and interrupt flag such that the guest will
observe the intended sequence of states. Document the known deviations
from a real 6522 device.

Eliminate the duplication of logic in get_counter() and
get_next_irq_time() by calling the former before the latter.

Call get_counter() prior to clearing interrupt flags so that the flags
remain synchronized with the timer counter.

Call get_counter() prior to changing the latch so that the old latch value
may be used to reload the counter. Every reload must use the value of the
latch as it was at the moment of the reload (not some later value).

Remove excess calls to qemu_clock_get_ns() to help avoid the possiblity
of inconsistency between timer interrupt flags and counters.

Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
Changed since RFC:
 - Improved code commentary and commit log text.
 - Removed qemu_clock_get_ns() call from set_counter() for simplicity.
 - Moved the changes to the QEMUTimer callbacks from the previous patch
   into this one because they relate more to syncronization than to
   register accesses.
---
 hw/misc/mos6522.c         | 171 +++++++++++++++++++++-----------------
 hw/misc/trace-events      |   2 +-
 include/hw/misc/mos6522.h |   7 ++
 3 files changed, 103 insertions(+), 77 deletions(-)

diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index 385ea81b62..8957c5e65c 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -52,33 +52,72 @@ static void mos6522_update_irq(MOS6522State *s)
     }
 }
 
+static void mos6522_timer_raise_irq(MOS6522State *s, MOS6522Timer *ti)
+{
+    if (ti->state == irq) {
+        return;
+    }
+    ti->state = irq;
+    if (ti->index == 0) {
+        s->ifr |= T1_INT;
+    } else {
+        s->ifr |= T2_INT;
+    }
+    mos6522_update_irq(s);
+}
+
 static unsigned int get_counter(MOS6522State *s, MOS6522Timer *ti, int64_t now)
 {
     int64_t d;
     unsigned int counter;
-
+    bool reload;
+
+    /*
+     * Timer 1 counts down from the latch value to -1 (period of latch + 2),
+     * then raises its interrupt and reloads.
+     * Timer 2 counts down from the latch value to -1, then raises its
+     * interrupt and continues to -2 and so on without any further interrupts.
+     *
+     * TODO
+     * This implementation deviates from hardware behaviour because it omits
+     * the phase two clock. On a real 6522, the counter is decremented on a
+     * falling edge and the interrupt is asserted on a rising edge. Register
+     * accesses are synchronous with this clock. That means successive
+     * accesses to T1CL or T2CL can't yield the same value because
+     * they can't happen in the same clock cycle.
+     */
     d = muldiv64(now - ti->load_time, ti->frequency, NANOSECONDS_PER_SECOND);
 
-    if (ti->index == 0) {
-        /* the timer goes down from latch to -1 (period of latch + 2) */
-        if (d <= (ti->counter_value + 1)) {
-            counter = ti->counter_value - d;
-        } else {
-            int64_t d_post_reload = d - (ti->counter_value + 2);
-            /* XXX this calculation assumes that ti->latch has not changed */
-            counter = ti->latch - (d_post_reload % (ti->latch + 2));
-        }
-    } else {
-        counter = ti->counter_value - d;
+    reload = (d >= ti->counter_value + 2);
+
+    if (ti->index == 0 && reload) {
+        int64_t more_reloads;
+
+        d -= ti->counter_value + 2;
+        more_reloads = d / (ti->latch + 2);
+        d -= more_reloads * (ti->latch + 2);
+        ti->load_time += muldiv64(ti->counter_value + 2 +
+                                  more_reloads * (ti->latch + 2),
+                                  NANOSECONDS_PER_SECOND, ti->frequency);
+        ti->counter_value = ti->latch;
+    }
+
+    counter = ti->counter_value - d;
+
+    if (reload) {
+        mos6522_timer_raise_irq(s, ti);
     }
+
     return counter & 0xffff;
 }
 
-static void set_counter(MOS6522State *s, MOS6522Timer *ti, unsigned int val)
+static void set_counter(MOS6522State *s, MOS6522Timer *ti, unsigned int val,
+                        int64_t now)
 {
     trace_mos6522_set_counter(1 + ti->index, val);
-    ti->load_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    ti->load_time = now;
     ti->counter_value = val;
+    ti->state = decrement;
     if (ti->index == 0) {
         mos6522_timer1_update(s, ti, ti->load_time);
     } else {
@@ -89,37 +128,15 @@ static void set_counter(MOS6522State *s, MOS6522Timer *ti, unsigned int val)
 static int64_t get_next_irq_time(MOS6522State *s, MOS6522Timer *ti,
                                  int64_t now)
 {
-    int64_t d, next_time;
-    unsigned int counter;
+    int64_t next_time;
 
     if (ti->frequency == 0) {
         return INT64_MAX;
     }
 
-    /* current counter value */
-    d = muldiv64(now - ti->load_time, ti->frequency, NANOSECONDS_PER_SECOND);
-
-    /* the timer goes down from latch to -1 (period of latch + 2) */
-    if (d <= (ti->counter_value + 1)) {
-        counter = ti->counter_value - d;
-    } else {
-        int64_t d_post_reload = d - (ti->counter_value + 2);
-        /* XXX this calculation assumes that ti->latch has not changed */
-        counter = ti->latch - (d_post_reload % (ti->latch + 2));
-    }
-    counter &= 0xffff;
-
-    /* Note: we consider the irq is raised on 0 */
-    if (counter == 0xffff) {
-        next_time = d + ti->latch + 1;
-    } else if (counter == 0) {
-        next_time = d + ti->latch + 2;
-    } else {
-        next_time = d + counter;
-    }
-    trace_mos6522_get_next_irq_time(ti->latch, d, next_time - d);
-    next_time = muldiv64(next_time, NANOSECONDS_PER_SECOND, ti->frequency) +
-                         ti->load_time;
+    next_time = ti->load_time + muldiv64(ti->counter_value + 2,
+                                         NANOSECONDS_PER_SECOND, ti->frequency);
+    trace_mos6522_get_next_irq_time(ti->latch, ti->load_time, next_time);
     return next_time;
 }
 
@@ -129,10 +146,8 @@ static void mos6522_timer1_update(MOS6522State *s, MOS6522Timer *ti,
     if (!ti->timer) {
         return;
     }
+    get_counter(s, ti, now);
     ti->next_irq_time = get_next_irq_time(s, ti, now);
-    if (ti->next_irq_time <= now) {
-        ti->next_irq_time = now + 1;
-    }
     if ((s->ier & T1_INT) == 0 || (s->acr & T1MODE) != T1MODE_CONT) {
         timer_del(ti->timer);
     } else {
@@ -146,10 +161,8 @@ static void mos6522_timer2_update(MOS6522State *s, MOS6522Timer *ti,
     if (!ti->timer) {
         return;
     }
+    get_counter(s, ti, now);
     ti->next_irq_time = get_next_irq_time(s, ti, now);
-    if (ti->next_irq_time <= now) {
-        ti->next_irq_time = now + 1;
-    }
     if ((s->ier & T2_INT) == 0) {
         timer_del(ti->timer);
     } else {
@@ -161,20 +174,18 @@ static void mos6522_timer1_expired(void *opaque)
 {
     MOS6522State *s = opaque;
     MOS6522Timer *ti = &s->timers[0];
+    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
 
-    mos6522_timer1_update(s, ti, ti->next_irq_time);
-    s->ifr |= T1_INT;
-    mos6522_update_irq(s);
+    mos6522_timer1_update(s, ti, now);
 }
 
 static void mos6522_timer2_expired(void *opaque)
 {
     MOS6522State *s = opaque;
     MOS6522Timer *ti = &s->timers[1];
+    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
 
-    mos6522_timer2_update(s, ti, ti->next_irq_time);
-    s->ifr |= T2_INT;
-    mos6522_update_irq(s);
+    mos6522_timer2_update(s, ti, now);
 }
 
 static void mos6522_set_sr_int(MOS6522State *s)
@@ -200,16 +211,6 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
     uint32_t val;
     int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
 
-    if (now >= s->timers[0].next_irq_time) {
-        mos6522_timer1_update(s, &s->timers[0], now);
-        s->ifr |= T1_INT;
-        mos6522_update_irq(s);
-    }
-    if (now >= s->timers[1].next_irq_time) {
-        mos6522_timer2_update(s, &s->timers[1], now);
-        s->ifr |= T2_INT;
-        mos6522_update_irq(s);
-    }
     switch (addr) {
     case VIA_REG_B:
         val = s->b;
@@ -228,8 +229,11 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
         break;
     case VIA_REG_T1CL:
         val = get_counter(s, &s->timers[0], now) & 0xff;
-        s->ifr &= ~T1_INT;
-        mos6522_update_irq(s);
+        if (s->timers[0].state >= irq) {
+            s->timers[0].state = irq_cleared;
+            s->ifr &= ~T1_INT;
+            mos6522_update_irq(s);
+        }
         break;
     case VIA_REG_T1CH:
         val = get_counter(s, &s->timers[0], now) >> 8;
@@ -242,8 +246,11 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
         break;
     case VIA_REG_T2CL:
         val = get_counter(s, &s->timers[1], now) & 0xff;
-        s->ifr &= ~T2_INT;
-        mos6522_update_irq(s);
+        if (s->timers[1].state >= irq) {
+            s->timers[1].state = irq_cleared;
+            s->ifr &= ~T2_INT;
+            mos6522_update_irq(s);
+        }
         break;
     case VIA_REG_T2CH:
         val = get_counter(s, &s->timers[1], now) >> 8;
@@ -283,6 +290,7 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
 {
     MOS6522State *s = opaque;
     MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(s);
+    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
 
     trace_mos6522_write(addr, val);
 
@@ -305,44 +313,55 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
         s->dira = val;
         break;
     case VIA_REG_T1CL:
+        get_counter(s, &s->timers[0], now);
         s->timers[0].latch = (s->timers[0].latch & 0xff00) | val;
         break;
     case VIA_REG_T1CH:
         s->timers[0].latch = (s->timers[0].latch & 0xff) | (val << 8);
         s->ifr &= ~T1_INT;
-        set_counter(s, &s->timers[0], s->timers[0].latch);
+        set_counter(s, &s->timers[0], s->timers[0].latch, now);
         break;
     case VIA_REG_T1LL:
+        get_counter(s, &s->timers[0], now);
         s->timers[0].latch = (s->timers[0].latch & 0xff00) | val;
         break;
     case VIA_REG_T1LH:
+        get_counter(s, &s->timers[0], now);
         s->timers[0].latch = (s->timers[0].latch & 0xff) | (val << 8);
         s->ifr &= ~T1_INT;
         break;
     case VIA_REG_T2CL:
+        get_counter(s, &s->timers[1], now);
         s->timers[1].latch = (s->timers[1].latch & 0xff00) | val;
         break;
     case VIA_REG_T2CH:
-        /* To ensure T2 generates an interrupt on zero crossing with the
-           common timer code, write the value directly from the latch to
-           the counter */
         s->timers[1].latch = (s->timers[1].latch & 0xff) | (val << 8);
         s->ifr &= ~T2_INT;
-        set_counter(s, &s->timers[1], s->timers[1].latch);
+        set_counter(s, &s->timers[1], s->timers[1].latch, now);
         break;
     case VIA_REG_SR:
         s->sr = val;
         break;
     case VIA_REG_ACR:
         s->acr = val;
-        mos6522_timer1_update(s, &s->timers[0],
-                              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
+        mos6522_timer1_update(s, &s->timers[0], now);
         break;
     case VIA_REG_PCR:
         s->pcr = val;
         break;
     case VIA_REG_IFR:
-        /* reset bits */
+        if (val & T1_INT) {
+            get_counter(s, &s->timers[0], now);
+            if ((s->ifr & T1_INT) && s->timers[0].state == irq) {
+                s->timers[0].state = irq_cleared;
+            }
+        }
+        if (val & T2_INT) {
+            get_counter(s, &s->timers[1], now);
+            if ((s->ifr & T2_INT) && s->timers[1].state == irq) {
+                s->timers[1].state = irq_cleared;
+            }
+        }
         s->ifr &= ~val;
         mos6522_update_irq(s);
         break;
@@ -356,7 +375,6 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
         }
         mos6522_update_irq(s);
         /* if IER is modified starts needed timers */
-        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
         mos6522_timer1_update(s, &s->timers[0], now);
         mos6522_timer2_update(s, &s->timers[1], now);
         break;
@@ -426,7 +444,8 @@ static void mos6522_reset(DeviceState *dev)
 
     s->timers[0].frequency = s->frequency;
     s->timers[0].latch = 0xffff;
-    set_counter(s, &s->timers[0], 0xffff);
+    set_counter(s, &s->timers[0], 0xffff,
+                qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
     timer_del(s->timers[0].timer);
 
     s->timers[1].frequency = s->frequency;
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index ede413965b..bce49ce47c 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -93,7 +93,7 @@ imx7_gpr_write(uint64_t offset, uint64_t value) "addr 0x%08" PRIx64 "value 0x%08
 
 # mos6522.c
 mos6522_set_counter(int index, unsigned int val) "T%d.counter=%d"
-mos6522_get_next_irq_time(uint16_t latch, int64_t d, int64_t delta) "latch=%d counter=0x%"PRId64 " delta_next=0x%"PRId64
+mos6522_get_next_irq_time(uint16_t latch, int64_t load_time, int64_t next_time) "latch=%d counter=%" PRId64 " next_time=%" PRId64
 mos6522_set_sr_int(void) "set sr_int"
 mos6522_write(uint64_t addr, uint64_t val) "reg=0x%"PRIx64 " val=0x%"PRIx64
 mos6522_read(uint64_t addr, unsigned val) "reg=0x%"PRIx64 " val=0x%x"
diff --git a/include/hw/misc/mos6522.h b/include/hw/misc/mos6522.h
index fc95d22b0f..a2df5fa942 100644
--- a/include/hw/misc/mos6522.h
+++ b/include/hw/misc/mos6522.h
@@ -71,6 +71,12 @@
 #define VIA_REG_IER     0x0e
 #define VIA_REG_ANH     0x0f
 
+enum timer_state {
+    decrement,
+    irq,
+    irq_cleared,
+};
+
 /**
  * MOS6522Timer:
  * @counter_value: counter value at load time
@@ -83,6 +89,7 @@ typedef struct MOS6522Timer {
     int64_t next_irq_time;
     uint64_t frequency;
     QEMUTimer *timer;
+    enum timer_state state;
 } MOS6522Timer;
 
 /**
-- 
2.26.3


