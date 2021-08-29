Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4EA3FA82B
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Aug 2021 03:57:49 +0200 (CEST)
Received: from localhost ([::1]:39574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKA4t-0008FI-9V
	for lists+qemu-devel@lfdr.de; Sat, 28 Aug 2021 21:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mKA3R-0006dT-6V; Sat, 28 Aug 2021 21:56:13 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:39125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mKA3P-00062h-0m; Sat, 28 Aug 2021 21:56:12 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 98D35320076F;
 Sat, 28 Aug 2021 21:56:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 28 Aug 2021 21:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=WImJ3R
 h4Wmkz03FnFRf0hLO2uSBCfHpUlXXVpXVNPbw=; b=bJzwe9BJ2KftiLoTdmV1rv
 TpfAauwSHaM4eLNeD8zmyVWIuPX8JcJ5Hlm+YZT1qdR/RJM2YtPaCEL3J+H6Ku8y
 9aN8Dx2JgxuW5YV4JET41IdnnxyS2VKupqdfLgJTtE4SNp2w1M1HiyVcmrN2GLmj
 Kw+JybQJ1vX6Oanj+LFRfHwM9ci953Smn24jrtwULETSBtoNxc64f6aHO6noSpK1
 yh9kii6CLXJbxH8AEe4VcX5gWTdcdqtDI5g5pOJdL+eVPAFT65FHbMrwM21tdcvL
 lW/zsHGC+Va2UD7mdmFJPc0Ogz5DVR9DSltzmXK4w6LCYTOzREpeG1dbIh6XU11A
 ==
X-ME-Sender: <xms:NOkqYWC-7PmDXpNj2wnFf2z695IU_PihH87w7C81cPLEresVNI1d3w>
 <xme:NOkqYQhrTSWHF36irzlCSGEKvqpoyZ5wtrTTfEOsezF2JBqgIA_1Id8zW-C5zvVb1
 K-KxQJGyTM8s523JVo>
X-ME-Received: <xmr:NOkqYZka4AI6jeGy4j1TAxIkKbnvf0ZG8YVbK8p8QzbptN9GxBO2dL9W9Fu5BOP5jpX5vgf0WamO4Xp1kKzRZlxCdZIfCx2OqpPhHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudduiedgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepffduhfegfedvieetudfgleeugeehkeekfeevfffhieevteelvdfhtdevffet
 uedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
 hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:NOkqYUw1QAkicKhOkBzqX2yXvW_lEJ6MIR9eaqTTn0slN3cWiVCa_Q>
 <xmx:NOkqYbS9jOY94jeC2fAJkhsoffwAJvnvReG48jaQEcwwvs_N0nT_AQ>
 <xmx:NOkqYfYZMxcvhJOz7ziFFFsE2uG0Fk-4pY8CBoKC4ZxPTHypdVSDHg>
 <xmx:NukqYVeI7Cr-bB9WU9mxGC3IH5IVcUVVt6V095F_K8ixdYx_OOCh2w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Aug 2021 21:55:57 -0400 (EDT)
Date: Sun, 29 Aug 2021 11:55:44 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [RFC 09/10] hw/mos6522: Avoid using discrepant QEMU clock values
In-Reply-To: <157fd841-9a1f-3f8e-1a29-ab79305843c9@ilande.co.uk>
Message-ID: <641b78bd-e62-c0e4-88ce-8e4bf5a4566f@linux-m68k.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <21f20ab5a100e4947d840080114f3f0511aade86.1629799776.git.fthain@linux-m68k.org>
 <157fd841-9a1f-3f8e-1a29-ab79305843c9@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=64.147.123.19; envelope-from=fthain@linux-m68k.org;
 helo=wout3-smtp.messagingengine.com
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
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Aug 2021, Mark Cave-Ayland wrote:

> On 24/08/2021 11:09, Finn Thain wrote:
> 
> > mos6522_read() and mos6522_write() may call various functions to determine
> > timer irq state, timer counter value and QEMUTimer deadline. All called
> > functions must use the same value for the present time.
> > 
> > Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> > ---
> >   hw/misc/mos6522.c | 51 +++++++++++++++++++++++++----------------------
> >   1 file changed, 27 insertions(+), 24 deletions(-)
> > 
> > diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> > index 0dd3ccf945..23a440b64f 100644
> > --- a/hw/misc/mos6522.c
> > +++ b/hw/misc/mos6522.c
> > @@ -39,9 +39,9 @@
> >   /* XXX: implement all timer modes */
> >     static void mos6522_timer1_update(MOS6522State *s, MOS6522Timer *ti,
> > -                                  int64_t current_time);
> > +                                  int64_t now);
> >   static void mos6522_timer2_update(MOS6522State *s, MOS6522Timer *ti,
> > -                                  int64_t current_time);
> > +                                  int64_t now);
> >     static void mos6522_update_irq(MOS6522State *s)
> >   {
> > @@ -52,12 +52,12 @@ static void mos6522_update_irq(MOS6522State *s)
> >       }
> >   }
> >   -static unsigned int get_counter(MOS6522State *s, MOS6522Timer *ti)
> > +static unsigned int get_counter(MOS6522State *s, MOS6522Timer *ti, int64_t
> > now)
> >   {
> >       int64_t d;
> >       unsigned int counter;
> >   -    d = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - ti->load_time,
> > +    d = muldiv64(now - ti->load_time,
> >                    ti->frequency, NANOSECONDS_PER_SECOND);
> >         if (ti->index == 0) {
> > @@ -89,7 +89,7 @@ static void set_counter(MOS6522State *s, MOS6522Timer *ti,
> > unsigned int val)
> >   }
> >     static int64_t get_next_irq_time(MOS6522State *s, MOS6522Timer *ti,
> > -                                 int64_t current_time)
> > +                                 int64_t now)
> >   {
> >       int64_t d, next_time;
> >       unsigned int counter;
> > @@ -99,7 +99,7 @@ static int64_t get_next_irq_time(MOS6522State *s,
> > MOS6522Timer *ti,
> >       }
> >         /* current counter value */
> > -    d = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - ti->load_time,
> > +    d = muldiv64(now - ti->load_time,
> >                    ti->frequency, NANOSECONDS_PER_SECOND);
> >         /* the timer goes down from latch to -1 (period of latch + 2) */
> > @@ -123,20 +123,19 @@ static int64_t get_next_irq_time(MOS6522State *s,
> > MOS6522Timer *ti,
> >       trace_mos6522_get_next_irq_time(ti->latch, d, next_time - d);
> >       next_time = muldiv64(next_time, NANOSECONDS_PER_SECOND, ti->frequency)
> > +
> >                            ti->load_time;
> > -
> > -    if (next_time <= current_time) {
> > -        next_time = current_time + 1;
> > -    }
> >       return next_time;
> >   }
> >     static void mos6522_timer1_update(MOS6522State *s, MOS6522Timer *ti,
> > -                                 int64_t current_time)
> > +                                  int64_t now)
> >   {
> >       if (!ti->timer) {
> >           return;
> >       }
> > -    ti->next_irq_time = get_next_irq_time(s, ti, current_time);
> > +    ti->next_irq_time = get_next_irq_time(s, ti, now);
> > +    if (ti->next_irq_time <= now) {
> > +        ti->next_irq_time = now + 1;
> > +    }
> >       if ((s->ier & T1_INT) == 0 ||
> >           ((s->acr & T1MODE) == T1MODE_ONESHOT && ti->oneshot_fired)) {
> >           timer_del(ti->timer);
> > @@ -146,12 +145,15 @@ static void mos6522_timer1_update(MOS6522State *s,
> > MOS6522Timer *ti,
> >   }
> >     static void mos6522_timer2_update(MOS6522State *s, MOS6522Timer *ti,
> > -                                 int64_t current_time)
> > +                                  int64_t now)
> >   {
> >       if (!ti->timer) {
> >           return;
> >       }
> > -    ti->next_irq_time = get_next_irq_time(s, ti, current_time);
> > +    ti->next_irq_time = get_next_irq_time(s, ti, now);
> > +    if (ti->next_irq_time <= now) {
> > +        ti->next_irq_time = now + 1;
> > +    }
> >       if ((s->ier & T2_INT) == 0 || (s->acr & T2MODE) || ti->oneshot_fired)
> > {
> >           timer_del(ti->timer);
> >       } else {
> > @@ -163,9 +165,10 @@ static void mos6522_timer1_expired(void *opaque)
> >   {
> >       MOS6522State *s = opaque;
> >       MOS6522Timer *ti = &s->timers[0];
> > +    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> >         ti->oneshot_fired = true;
> > -    mos6522_timer1_update(s, ti, ti->next_irq_time);
> > +    mos6522_timer1_update(s, ti, now);
> 
> Presumably using ti->next_irq_time has already fixed the current time to 
> be that at which the timer routine actually expired, rather than the 
> current executing time. Are you seeing large differences in these 
> numbers that can cause timer drift? If so, I'm wondering if this change 
> should be in a separate patch.
> 

You're right. This change has more relevance to the synchronization work 
in the following patch. It's not really covered by the commit log here.

> >       s->ifr |= T1_INT;
> >       mos6522_update_irq(s);
> >   }
> > @@ -174,9 +177,10 @@ static void mos6522_timer2_expired(void *opaque)
> >   {
> >       MOS6522State *s = opaque;
> >       MOS6522Timer *ti = &s->timers[1];
> > +    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> >         ti->oneshot_fired = true;
> > -    mos6522_timer2_update(s, ti, ti->next_irq_time);
> > +    mos6522_timer2_update(s, ti, now);
> 
> And same again here.
> 

I'll find a better way to split up these patches.

> >       s->ifr |= T2_INT;
> >       mos6522_update_irq(s);
> >   }
> > @@ -233,12 +237,12 @@ uint64_t mos6522_read(void *opaque, hwaddr addr,
> > unsigned size)
> >           val = s->dira;
> >           break;
> >       case VIA_REG_T1CL:
> > -        val = get_counter(s, &s->timers[0]) & 0xff;
> > +        val = get_counter(s, &s->timers[0], now) & 0xff;
> >           s->ifr &= ~T1_INT;
> >           mos6522_update_irq(s);
> >           break;
> >       case VIA_REG_T1CH:
> > -        val = get_counter(s, &s->timers[0]) >> 8;
> > +        val = get_counter(s, &s->timers[0], now) >> 8;
> >           break;
> >       case VIA_REG_T1LL:
> >           val = s->timers[0].latch & 0xff;
> > @@ -247,12 +251,12 @@ uint64_t mos6522_read(void *opaque, hwaddr addr,
> > unsigned size)
> >           val = (s->timers[0].latch >> 8) & 0xff;
> >           break;
> >       case VIA_REG_T2CL:
> > -        val = get_counter(s, &s->timers[1]) & 0xff;
> > +        val = get_counter(s, &s->timers[1], now) & 0xff;
> >           s->ifr &= ~T2_INT;
> >           mos6522_update_irq(s);
> >           break;
> >       case VIA_REG_T2CH:
> > -        val = get_counter(s, &s->timers[1]) >> 8;
> > +        val = get_counter(s, &s->timers[1], now) >> 8;
> >           break;
> >       case VIA_REG_SR:
> >           val = s->sr;
> > @@ -360,10 +364,9 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t
> > val, unsigned size)
> >           }
> >           mos6522_update_irq(s);
> >           /* if IER is modified starts needed timers */
> > -        mos6522_timer1_update(s, &s->timers[0],
> > -                              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
> > -        mos6522_timer2_update(s, &s->timers[1],
> > -                              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
> > +        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +        mos6522_timer1_update(s, &s->timers[0], now);
> > +        mos6522_timer2_update(s, &s->timers[1], now);
> >           break;
> >       default:
> >           g_assert_not_reached();
> 
> In terms of functionality it shouldn't really matter (since you have a 
> ns clock compared with a timer that can manage small frequencies in 
> comparison) but I can see how having a constant clock time throughout 
> the entire calculation process could be useful for debugging.
> 

I found it impossible to reason about program behaviour with so many calls 
to qemu_clock_get_ns().

Thanks for your review.

