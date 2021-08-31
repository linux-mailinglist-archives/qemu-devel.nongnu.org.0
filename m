Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD343FCFAB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 00:48:26 +0200 (CEST)
Received: from localhost ([::1]:40236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLCYL-0004q4-Da
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 18:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mLCW4-0003VK-N9; Tue, 31 Aug 2021 18:46:04 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:34939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mLCW2-0006Yb-27; Tue, 31 Aug 2021 18:46:04 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 27E9632005BC;
 Tue, 31 Aug 2021 18:45:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 31 Aug 2021 18:45:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=aRqajF
 HU5v0DXEShda6ICI5iXAJeAvwM1HPRHPkyUlc=; b=LX7Yph8n7X3dULyUZlY6T3
 S8zUK2qSNIAki/NedvaNjklJMh1qfm5a8Ope8wEfW06bpNawwvOSRTAu3Fy69ch4
 gwi+iC88xPSKt8l5EZNg0KBbscZSOnbV3Dz3bEWwpla4CJPvbKyQiocC4dSEj9H1
 LxOudgPIS3hVJhOpeoeiJpK6N4E5rVP1eHc+GGEMHG0qrZX8V2mJ0rNYU9K5nDTr
 1ivtXn2Q8f1V/ySAhM5ChUVxhgBd7sSxXsT0eD5xjFWQiAdwVg984bvPAJKOWdi9
 iMdQ66QAj0xVxMLHEaeREcY79ggXKHMZiM9HJN1TBYsdNrM2jgj42zN9zITwMmUg
 ==
X-ME-Sender: <xms:IbEuYTO0QpllpBHr3go48L0wRnusFCcLj1x1Hp1pirNMxHlSfI44ig>
 <xme:IbEuYd-nRtBMherxpte64fwy7Ag4cQMTqInpulwZ5ICCwjP6Is3NTcuufmaF8gIyZ
 FVGpvbpdkb7pW-A2_I>
X-ME-Received: <xmr:IbEuYSQs3EM28ge41GF1gNXvlowHqEONBm-MdQc5tx9kRrzQSk07UZ0VLcZaQmYv0MCoVJomly1yozkNif4Qn2j-OZDqoxc4p88bhw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvvddgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepffduhfegfedvieetudfgleeugeehkeekfeevfffhieevteelvdfhtdevffet
 uedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
 hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:IbEuYXuPeuJndEl1qGa7bG1nZB1gfROfwOL7GsOzerCP0HGtVy_kUA>
 <xmx:IbEuYbddv7bBbEnNTU0CFrZWqwxYewsj_-5NdbwcV5ChPCr3sY76YA>
 <xmx:IbEuYT3tR1WuVOeT6ti9uJ66B3XU0plvKKNBj3SG0s3FT1XmSep26Q>
 <xmx:IrEuYcHXiDIkXC8U4Vgwlz_CuzKNIqFhu1iqLk1Nh-HYzEyHKGOR2Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Aug 2021 18:45:50 -0400 (EDT)
Date: Wed, 1 Sep 2021 08:44:56 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [RFC 00/10] hw/mos6522: VIA timer emulation fixes and improvements
In-Reply-To: <4da39536-1acb-05c3-755c-9a30d82d6ace@ilande.co.uk>
Message-ID: <88a445-398a-7566-171b-c551b61c38b@linux-m68k.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <283af572-2157-77c6-2594-8e9e92497346@amsat.org>
 <fb42cb6-117c-c138-c18a-3af7f1d9be6a@linux-m68k.org>
 <4da39536-1acb-05c3-755c-9a30d82d6ace@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=64.147.123.20; envelope-from=fthain@linux-m68k.org;
 helo=wout4-smtp.messagingengine.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Laurent Vivier <laurent@vivier.eu>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 31 Aug 2021, Mark Cave-Ayland wrote:

> On 28/08/2021 02:22, Finn Thain wrote:
> 
> > > On 8/24/21 12:09 PM, Finn Thain wrote:
> > > 
> > > > On a real Quadra, accesses to the SY6522 chips are slow because they are
> > > > synchronous with the 783360 Hz "phase 2" clock. In QEMU, they are slow
> > > > only because of the division operation in the timer count calculation.
> > > > 
> > > > This patch series improves the fidelity of the emulated chip, but the
> > > > price is more division ops. I haven't tried to measure this yet.
> > > > 
> > > > The emulated 6522 still deviates from the behaviour of the real thing,
> > > > however. For example, two consecutive accesses to a real 6522 timer
> > > > counter can never yield the same value. This is not true of the 6522 in
> > > > QEMU 6 wherein two consecutive accesses to a timer count register have
> > > > been observed to yield the same value.
> > > > 
> > > > Linux is not particularly robust in the face of a 6522 that deviates
> > > > from the usual behaviour. The problem presently affecting a Linux guest
> > > > is that its 'via' clocksource is prone to monotonicity failure. That is,
> > > > the clocksource counter can jump backwards. This can be observed by
> > > > patching Linux like so:
> > > > 
> > > > diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
> > > > --- a/arch/m68k/mac/via.c
> > > > +++ b/arch/m68k/mac/via.c
> > > > @@ -606,6 +606,8 @@ void __init via_init_clock(void)
> > > >   	clocksource_register_hz(&mac_clk, VIA_CLOCK_FREQ);
> > > >   }
> > > >   +static u32 prev_ticks;
> > > > +
> > > >   static u64 mac_read_clk(struct clocksource *cs)
> > > >   {
> > > >   	unsigned long flags;
> > > > @@ -631,6 +633,8 @@ static u64 mac_read_clk(struct clocksource *cs)
> > > >   	count = count_high << 8;
> > > >   	ticks = VIA_TIMER_CYCLES - count;
> > > >   	ticks += clk_offset + clk_total;
> > > > +if (ticks < prev_ticks) pr_warn("%s: %u < %u\n", __func__, ticks,
> > > > prev_ticks);
> > > > +prev_ticks = ticks;
> > > >   	local_irq_restore(flags);
> > > >     	return ticks;
> > > > 
> > > > This problem can be partly blamed on a 6522 design limitation, which is
> > > > that the timer counter has no overflow register. Hence, if a timer
> > > > counter wraps around and the kernel is late to handle the subsequent
> > > > interrupt, the kernel can't account for any missed ticks.
> > > > 
> > > > On a real Quadra, the kernel mitigates this limitation by minimizing
> > > > interrupt latency. But on QEMU, interrupt latency is unbounded. This
> > > > can't be mitigated by the guest kernel at all and leads to clock drift.
> > > > This can be observed by patching QEMU like so:
> > > > 
> > > > diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> > > > --- a/hw/misc/mos6522.c
> > > > +++ b/hw/misc/mos6522.c
> > > > @@ -379,6 +379,12 @@ void mos6522_write(void *opaque, hwaddr addr,
> > > > uint64_t val, unsigned size)
> > > >           s->pcr = val;
> > > >           break;
> > > >       case VIA_REG_IFR:
> > > > +        if (val & T1_INT) {
> > > > +            static int64_t last_t1_int_cleared;
> > > > +            int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > > > +            if (now - last_t1_int_cleared > 20000000) printf("\t%s: t1
> > > > int clear is late\n", __func__);
> > > > +            last_t1_int_cleared = now;
> > > > +        }
> > > >           /* reset bits */
> > > >           s->ifr &= ~val;
> > > >           mos6522_update_irq(s);
> > > > 
> > > > This logic asserts that, given that Linux/m68k sets CONFIG_HZ to 100,
> > > > the emulator will theoretically see each timer 1 interrupt cleared
> > > > within 20 ms of the previous one. But that deadline is often missed on
> > > > my QEMU host [4].
> > > 
> > > I wonder if using QEMU ptimer wouldn't help here, instead of
> > > calling qemu_clock_get_ns() and doing the math by hand:
> > > 
> > > /* Starting to run with/setting counter to "0" won't trigger immediately,
> > >   * but after a one period for both oneshot and periodic modes.  */
> > > #define PTIMER_POLICY_NO_IMMEDIATE_TRIGGER  (1 << 2)
> > > 
> > > /* Starting to run with/setting counter to "0" won't re-load counter
> > >   * immediately, but after a one period.  */
> > > #define PTIMER_POLICY_NO_IMMEDIATE_RELOAD   (1 << 3)
> > > 
> > > /* Make counter value of the running timer represent the actual value and
> > >   * not the one less.  */
> > > #define PTIMER_POLICY_NO_COUNTER_ROUND_DOWN (1 << 4)
> > > 
> > 
> > It's often the case that a conversion to a new API is trivial for someone
> > who understands that API. But I still haven't got my head around the
> > implementation (hw/core/ptimer.c).
> > 
> > So I agree the ptimer API could simplify mos6522.c but adopting it is not
> > trivial for me.
> > 
> > QEMU's 6522 device does not attempt to model the relationship between the
> > "phase two" clock and timer counters and timer interrupts. I haven't
> > attempted to fix these deviations at all, as that's not trivial either.
> > 
> > But using the ptimer API could potentially make it easier to address those
> > fidelity issues.
> 
> I had another look at the mos6522 code this evening, and certainly whilst
> there are things that could be improved, I'm still puzzled as to how you would
> see time going backwards:
> 

I didn't say time goes backwards, I said the "clocksource counter can jump 
backwards". You can easily observe this for yourself if you apply the 
patch above.

> - qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) eventually ends up calling 
> cpu_get_clock() where the comment for the function is "Return the 
> monotonic time elapsed in VM"
> 

AFAICT, QEMU_CLOCK_VIRTUAL is monotonic. I confirmed last year when 
debugging mos6522.c.

> - get_next_irq_time() calculates the counter value for the current 
> clock, adds the value of the counter (compensating for wraparound) and 
> calculates the clock for the next IRQ
> 
> - Using the current clock instead of ti->next_irq_time in the timer 
> callbacks should compensate for any latency when the callback is invoked
> 

That's the theory. In practice, however, there are known flaws in the 
present implementation which this series addresses.

> You mentioned that the OS may compensate for the fact that the 6522 
> doesn't have an overflow flag: can you explain more as to how this works 
> in Linux? Is the problem here that even if you read the counter value in 
> the interrupt handler to work out the latency, the counter may still 
> have already wrapped?
> 

Unbounded interrupt latency means that the guest kernel can not tell how 
many times the timer counter wrapped between timer interrupts. There will 
always be a race condition in the guest kernel.

It's possible to code around this in the kernel with a ratchet to prevent 
backwards movement in the clocksource counter (I had to do something 
similar for the Atari clocksource driver) but that would address only one 
symptom.

And that kind of hack certainly doesn't help any other guest operating 
system that's adversely affected by QEMU's design limitations (which is 
behavioural simulation rather than gate-level simulation).

This patch series doesn't solve the timer problem but it does improve the 
situation (for the reasons given in the cover letter).

