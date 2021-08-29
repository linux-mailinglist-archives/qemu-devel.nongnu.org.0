Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C3E3FA81E
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Aug 2021 03:22:57 +0200 (CEST)
Received: from localhost ([::1]:56932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mK9X4-0007he-Dl
	for lists+qemu-devel@lfdr.de; Sat, 28 Aug 2021 21:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mK9VV-0006jK-G1; Sat, 28 Aug 2021 21:21:09 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:46533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mK9VR-0008Gp-8F; Sat, 28 Aug 2021 21:21:09 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id A94D432000F9;
 Sat, 28 Aug 2021 21:21:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 28 Aug 2021 21:21:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=rGfqrF
 6C8LrIhkFb9XR4AeWMRFg8JGsRccBpJlIGP+4=; b=jM7QXRgh+FMvILKJdm+r0s
 VcxObbycp2UibsFOu59+O+ebqZxf1dw/wb8Z9HlF4OpIVG1D6xgIbT9wLOWQx8gC
 gHht7CzjRKQEaUbnrqFtrX1MfQL3eNynljAidxjh3+jN6VEOiMKVgfmQt3XxaOLX
 N6aRX+THx6rQveQ4jj/Ccu11Gvm69OpQBzXGGIWTCZLc1Q17cIq/ld7OmsUwAuBt
 nTxbRAt1bVtY5PzgUwLouhJDGgB5ZjAlq0LiVWqLn4tIZecrtt77TYGi8amI45tN
 mAeLNKq9tv459x0tIqgwKft8aYvZT6mqiTtRDFAeuO+Qv+TGXLUU9dk//XqWX+zg
 ==
X-ME-Sender: <xms:-uAqYT6qw4Dy-ph8eUeU6WErr2nkr1KY27DsSZk2R9O7S8MLO2ZvBQ>
 <xme:-uAqYY5MYZvfRGmmN-XLsJfpwqjrHZAf5CLT0kpOeXcB2ppQaqOfnM27h9sUjiGss
 u0haxRAGYy3msGKK2o>
X-ME-Received: <xmr:-uAqYaeEfUF7VhiOSfsGl10yPT7ubJM5PBpqFTGg-klBJW5kkBE5SRhqvU1ubwJrrRKeggX6W0eM-TVW4uQL57YsIQ6pP31-CDw55Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudduiedggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepgfdtgedugfehhefhueegfeefhfevgfejveffgeefudffudegkeekffffjeej
 hedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehk
 rdhorhhg
X-ME-Proxy: <xmx:-uAqYULxdghfPRJZH62S6u0H1vR43w32xgXQdri0pZTjJkdoakB0Aw>
 <xmx:-uAqYXLJgVhUTr7HOA-GURTcbbIrN90vir5qusfnjucN5d4uZszA8g>
 <xmx:-uAqYdzNPVzWgIePoScP00zPgKR4enhYMZ87KsBgVXNeuYsChRSkgg>
 <xmx:_OAqYf2SR5EmLK2D2_v4h_LMrqldOai8n5gKaYHTNElymWgFQe4lXQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Aug 2021 21:20:53 -0400 (EDT)
Date: Sun, 29 Aug 2021 11:20:46 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [RFC 06/10] hw/mos6522: Implement oneshot mode
In-Reply-To: <7ebbd209-b9b5-7f85-1853-620985afcfac@ilande.co.uk>
Message-ID: <7ad81cdf-76e3-bbe-cadc-39e022f6fa20@linux-m68k.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <45c9d15c51076bba431e5593dbfcbcca2e1dc09a.1629799776.git.fthain@linux-m68k.org>
 <7ebbd209-b9b5-7f85-1853-620985afcfac@ilande.co.uk>
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
> > Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> > ---
> >   hw/misc/mos6522.c         | 19 ++++++++++++-------
> >   include/hw/misc/mos6522.h |  3 +++
> >   2 files changed, 15 insertions(+), 7 deletions(-)
> > 
> > diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> > index ffff8991f4..5b1657ac0d 100644
> > --- a/hw/misc/mos6522.c
> > +++ b/hw/misc/mos6522.c
> > @@ -79,6 +79,7 @@ static void set_counter(MOS6522State *s, MOS6522Timer *ti,
> > unsigned int val)
> >       trace_mos6522_set_counter(1 + ti->index, val);
> >       ti->load_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> >       ti->counter_value = val;
> > +    ti->oneshot_fired = false;
> >       if (ti->index == 0) {
> >           mos6522_timer1_update(s, ti, ti->load_time);
> >       } else {
> > @@ -133,7 +134,8 @@ static void mos6522_timer1_update(MOS6522State *s,
> > MOS6522Timer *ti,
> >           return;
> >       }
> >       ti->next_irq_time = get_next_irq_time(s, ti, current_time);
> > -    if ((s->ier & T1_INT) == 0 || (s->acr & T1MODE) != T1MODE_CONT) {
> > +    if ((s->ier & T1_INT) == 0 ||
> > +        ((s->acr & T1MODE) == T1MODE_ONESHOT && ti->oneshot_fired)) {
> >           timer_del(ti->timer);
> >       } else {
> >           timer_mod(ti->timer, ti->next_irq_time);
> > @@ -147,7 +149,7 @@ static void mos6522_timer2_update(MOS6522State *s,
> > MOS6522Timer *ti,
> >           return;
> >       }
> >       ti->next_irq_time = get_next_irq_time(s, ti, current_time);
> > -    if ((s->ier & T2_INT) == 0) {
> > +    if ((s->ier & T2_INT) == 0 || (s->acr & T2MODE) || ti->oneshot_fired) {
> >           timer_del(ti->timer);
> >       } else {
> >           timer_mod(ti->timer, ti->next_irq_time);
> > @@ -159,6 +161,7 @@ static void mos6522_timer1_expired(void *opaque)
> >       MOS6522State *s = opaque;
> >       MOS6522Timer *ti = &s->timers[0];
> >   +    ti->oneshot_fired = true;
> >       mos6522_timer1_update(s, ti, ti->next_irq_time);
> >       s->ifr |= T1_INT;
> >       mos6522_update_irq(s);
> > @@ -169,6 +172,7 @@ static void mos6522_timer2_expired(void *opaque)
> >       MOS6522State *s = opaque;
> >       MOS6522Timer *ti = &s->timers[1];
> >   +    ti->oneshot_fired = true;
> >       mos6522_timer2_update(s, ti, ti->next_irq_time);
> >       s->ifr |= T2_INT;
> >       mos6522_update_irq(s);
> 
> I was trying to understand why you need ti->oneshot_fired here since the 
> mos6522_timer*_update() functions should simply not re-arm the timer if 
> not in continuous mode...
> 

Not so. The timer has to be re-armed with timer_mod() when

(timer interrupt enabled and timer in continuous mode) ||
(timer interrupt enabled and timer in oneshot mode and no interrupt raised)

Conversely, the timer has to be cancelled with timer_del() when

(timer interrupt disabled) ||
(timer in oneshot mode and interrupt has been raised) ||
(timer in pulse-counting mode)

> > @@ -198,10 +202,12 @@ uint64_t mos6522_read(void *opaque, hwaddr addr,
> > unsigned size)
> >       int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> >         if (now >= s->timers[0].next_irq_time) {
> > +        s->timers[0].oneshot_fired = true;
> >           mos6522_timer1_update(s, &s->timers[0], now);
> >           s->ifr |= T1_INT;
> >       }
> >       if (now >= s->timers[1].next_irq_time) {
> > +        s->timers[1].oneshot_fired = true;
> >           mos6522_timer2_update(s, &s->timers[1], now);
> >           s->ifr |= T2_INT;
> >       }
> 
> ...however this block above raises the timer interrupt outside of the 
> timer callback. This block isn't part of your original patch but was 
> introduced as part of cd8843ff25d ("mos6522: fix T1 and T2 timers") but 
> I'm wondering if it is wrong.
> 

Maybe. I think a good answer would make reference to QEMU internals and 
synchronization guarantees between the invocation of the callbacks and 
methods in mos6522.c. I don't have a good answer, but it's moot...

> If you remove both of the above if (now ... ) {} blocks then does 
> one-shot mode work by just adding the (s->acr & T2MODE) check in 
> mos6522_timer2_update()? 
> 

Those blocks got removed in patch 10/10 because they aren't needed as long 
as get_counter() gets called when necessary.

> I'm guessing that Linux/m68k does use one or both of the timers in 
> one-shot mode?
> 

Yes, but it's not in mainline yet. I wrote the code some months ago but 
I can't push it upstream until QEMU supports it:
https://github.com/fthain/linux/commits/clockevent-oneshot

