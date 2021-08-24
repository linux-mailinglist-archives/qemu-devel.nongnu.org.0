Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B88183F5BDF
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 12:18:27 +0200 (CEST)
Received: from localhost ([::1]:46220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mITVd-0008Qt-FT
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 06:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mITSL-0000yl-UZ; Tue, 24 Aug 2021 06:14:58 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:39067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mITSK-0004bq-BO; Tue, 24 Aug 2021 06:14:57 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 982AB3200ADA;
 Tue, 24 Aug 2021 06:14:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 24 Aug 2021 06:14:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=EoRRq4nXtRnG8Fspog28BIPBWsJFB
 bJh5dPLrc6gacA=; b=HU2HK6sGDR9D7msV0qzPhQ17T7GmTpedHA37WX6iafVAH
 qVSfuizBiFwSX8f1JEyccROQJua/FpKLE7Kq6m7s+JJ91n93T+/fbxPVYtVYt3u9
 sULZQe69EOv+DSuWpytg+ba2XlZ+ocAJcZdokuFKsh0oIfCn7LeBiwgtcvgFjNWn
 OTD7ZuuGtU0xhN2VENph+qKUUJK1a4MredsMQ9JIKLaeEyUPq1yu9Q98flOmM0dy
 DHnWcpD8d29vH/QchcubCBWqysEnv5ZZcl+he/Wyy4OHjM2f6CmnY1REIMHEXGbP
 yn27BDKl+NjKB3vUhuX8Agq8aHw+vaLVuWGb8Ksng==
X-ME-Sender: <xms:nMYkYcwhokUd-VzmdkPyrFlqLgPeK1Z1AX_Zb_A8tPbXdAp4mCI3Vg>
 <xme:nMYkYQTIa6iusNdLf_mpzpo_yXDv0pSb5pkLUTuuyw3ODlzY1VPorTb_dFLCvnnDw
 _BCFZ8HRJI64SieChI>
X-ME-Received: <xmr:nMYkYeUZqF73a1y2Tx-DRgqO3nYHkGCoci_pSZjL7yWsm6bvb6RvCsGuGSsXuSzNSqaQnYZ-5XZjX1LDBFpAQocmUKOKisi_j1is4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtjedgvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffkjghfhffuffestddtredttddttdenucfhrhhomhephfhinhhnucfvhhgr
 ihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvg
 hrnhephfetledtgeffuedujedvteevgfdtudeufeekvdfhveekkefhgfevtdfhveeuueet
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthh
 grihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:nMYkYagw1g7HTYei53FKoaPH0xqqht1vzuE3X-kgghI_bmDhCl9A_A>
 <xmx:nMYkYeBrDYhNW0IoM5zdAlVw4UX0kpaXCD4-pS_QpyTAlPjclv7Fiw>
 <xmx:nMYkYbLKCDALMbROQLFYLS-Dw7oV59II8QQUkcUEGtXd0qSNGjOocg>
 <xmx:nsYkYZMUaWYR3U7bPSqzhk_b0hNuBI922LeFO3vN1bgNu9aVbsOg7w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Aug 2021 06:14:50 -0400 (EDT)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Message-Id: <45c9d15c51076bba431e5593dbfcbcca2e1dc09a.1629799776.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1629799776.git.fthain@linux-m68k.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [RFC 06/10] hw/mos6522: Implement oneshot mode
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

Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
 hw/misc/mos6522.c         | 19 ++++++++++++-------
 include/hw/misc/mos6522.h |  3 +++
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index ffff8991f4..5b1657ac0d 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -79,6 +79,7 @@ static void set_counter(MOS6522State *s, MOS6522Timer *ti, unsigned int val)
     trace_mos6522_set_counter(1 + ti->index, val);
     ti->load_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     ti->counter_value = val;
+    ti->oneshot_fired = false;
     if (ti->index == 0) {
         mos6522_timer1_update(s, ti, ti->load_time);
     } else {
@@ -133,7 +134,8 @@ static void mos6522_timer1_update(MOS6522State *s, MOS6522Timer *ti,
         return;
     }
     ti->next_irq_time = get_next_irq_time(s, ti, current_time);
-    if ((s->ier & T1_INT) == 0 || (s->acr & T1MODE) != T1MODE_CONT) {
+    if ((s->ier & T1_INT) == 0 ||
+        ((s->acr & T1MODE) == T1MODE_ONESHOT && ti->oneshot_fired)) {
         timer_del(ti->timer);
     } else {
         timer_mod(ti->timer, ti->next_irq_time);
@@ -147,7 +149,7 @@ static void mos6522_timer2_update(MOS6522State *s, MOS6522Timer *ti,
         return;
     }
     ti->next_irq_time = get_next_irq_time(s, ti, current_time);
-    if ((s->ier & T2_INT) == 0) {
+    if ((s->ier & T2_INT) == 0 || (s->acr & T2MODE) || ti->oneshot_fired) {
         timer_del(ti->timer);
     } else {
         timer_mod(ti->timer, ti->next_irq_time);
@@ -159,6 +161,7 @@ static void mos6522_timer1_expired(void *opaque)
     MOS6522State *s = opaque;
     MOS6522Timer *ti = &s->timers[0];
 
+    ti->oneshot_fired = true;
     mos6522_timer1_update(s, ti, ti->next_irq_time);
     s->ifr |= T1_INT;
     mos6522_update_irq(s);
@@ -169,6 +172,7 @@ static void mos6522_timer2_expired(void *opaque)
     MOS6522State *s = opaque;
     MOS6522Timer *ti = &s->timers[1];
 
+    ti->oneshot_fired = true;
     mos6522_timer2_update(s, ti, ti->next_irq_time);
     s->ifr |= T2_INT;
     mos6522_update_irq(s);
@@ -198,10 +202,12 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
     int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
 
     if (now >= s->timers[0].next_irq_time) {
+        s->timers[0].oneshot_fired = true;
         mos6522_timer1_update(s, &s->timers[0], now);
         s->ifr |= T1_INT;
     }
     if (now >= s->timers[1].next_irq_time) {
+        s->timers[1].oneshot_fired = true;
         mos6522_timer2_update(s, &s->timers[1], now);
         s->ifr |= T2_INT;
     }
@@ -279,6 +285,7 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
 {
     MOS6522State *s = opaque;
     MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(s);
+    int64_t now;
 
     trace_mos6522_write(addr, val);
 
@@ -318,9 +325,6 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
         s->timers[1].latch = (s->timers[1].latch & 0xff00) | val;
         break;
     case VIA_REG_T2CH:
-        /* To ensure T2 generates an interrupt on zero crossing with the
-           common timer code, write the value directly from the latch to
-           the counter */
         s->timers[1].latch = (s->timers[1].latch & 0xff) | (val << 8);
         s->ifr &= ~T2_INT;
         set_counter(s, &s->timers[1], s->timers[1].latch);
@@ -330,8 +334,9 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
         break;
     case VIA_REG_ACR:
         s->acr = val;
-        mos6522_timer1_update(s, &s->timers[0],
-                              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
+        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        mos6522_timer1_update(s, &s->timers[0], now);
+        mos6522_timer2_update(s, &s->timers[1], now);
         break;
     case VIA_REG_PCR:
         s->pcr = val;
diff --git a/include/hw/misc/mos6522.h b/include/hw/misc/mos6522.h
index fc95d22b0f..94b1dc324c 100644
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
@@ -83,6 +85,7 @@ typedef struct MOS6522Timer {
     int64_t next_irq_time;
     uint64_t frequency;
     QEMUTimer *timer;
+    bool oneshot_fired;
 } MOS6522Timer;
 
 /**
-- 
2.26.3


