Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C783FA37D
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Aug 2021 06:13:27 +0200 (CEST)
Received: from localhost ([::1]:54630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJpig-0004RB-8j
	for lists+qemu-devel@lfdr.de; Sat, 28 Aug 2021 00:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mJphH-0003kx-FI; Sat, 28 Aug 2021 00:11:59 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:55109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mJphE-0004tq-Ne; Sat, 28 Aug 2021 00:11:59 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 6781F5C00A5;
 Sat, 28 Aug 2021 00:11:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sat, 28 Aug 2021 00:11:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ZRH10c
 eCxhgunztCUG5+t6+hx0Hp7Zgr55XKFhNswsg=; b=YNLB9HTj/eEtcYsfwAbR8p
 4oKg6N42W8Wqd99mc6s+A6r9m0j8aMQA3PM3/kMt6/zpBn5+k3pcCIH0Ifgb2coS
 49ziJhshnZMVQ0HSwpTWsQ89DmS9KpRdNUuqGl1h3i+wRp9ob0CreIJOmAxdvSBK
 /Q/QdPFyOwINBj+H3ueI68a983PgGUDwJ9xNXAwZWbqaPgz/SAYUmWLNakcZKvKK
 uGy4jKUWJTZgHQLSk8wPxUO2BZf1KTAYx/tHMHa+Nt6lTWEvZGP4QFVEIUNmPDiG
 1UGbewHq10X+mbRT1zLRdMxu1Ot/WpHaTfVYRFZixfxNflxV9SD8DolyWbXQrT3g
 ==
X-ME-Sender: <xms:iLcpYQ7JPogqXQg8yQN5FoITR29dKmGZeLbULmfMgH3J_a1_xN7Fzg>
 <xme:iLcpYR5LPDBDugYDqgBktg7mHBLo8yxOsUrERcKZnS0pLdsQ6BfDQKxYPHv7OO3oD
 OPNHMnMIhpB5GIzTwA>
X-ME-Received: <xmr:iLcpYfdHMfDcrkYraoyfFSQ9qvzAKthsZhD1nKsqYt3e6PPHRtJTDFzTtHpjje7PLVxNerkWa9uQwaE21ed5BRJnTZOulDaeiZQI5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddugedgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepffdtieduudfgvdefvefhtddtvdelieevgefgffegvedvveetgfetuefggfeg
 leetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhn
 sehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:iLcpYVL6Olqbfz6LKdbxcPv7h7Q-LD8N5GULf-w1tgaHSc4SaCLi5A>
 <xmx:iLcpYUIF3oMNUrVlhoZ_bSx5HnP5Kh2dMjKttjZMl9xxfUmEhd4uRA>
 <xmx:iLcpYWwlADTVPlbJky60qpCkrfBFIkxcTSMWuaw5doGtuBT5o9WJ2w>
 <xmx:ircpYY1Mhy3WAHCAML0Q6HYI75k-PmP2S2n6412XhBzgfzN9TIGU3w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Aug 2021 00:11:49 -0400 (EDT)
Date: Sat, 28 Aug 2021 14:11:43 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [RFC 00/10] hw/mos6522: VIA timer emulation fixes and improvements
In-Reply-To: <9aec7882-0690-7152-e38e-e4c683c433a2@ilande.co.uk>
Message-ID: <15a15224-313-88b-e196-d7d73b2d46b8@linux-m68k.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <9aec7882-0690-7152-e38e-e4c683c433a2@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=66.111.4.27; envelope-from=fthain@linux-m68k.org;
 helo=out3-smtp.messagingengine.com
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
> > This is a patch series that I started last year. The aim was to try to
> > get a monotonic clocksource for Linux/m68k guests. That aim hasn't been
> > achieved yet (for q800 machines) but I'm submitting the patch series as
> > an RFC because,
> > 
> >   - It does improve 6522 emulation fidelity.
> > 
> >   - It allows Linux/m68k to make use of the additional timer that the
> >     hardware indeed offers but which QEMU omits. This has several
> >     benefits for Linux guests [1].
> > 
> >   - I see that Mark has been working on timer emulation issues in his
> >     github repo [2] and it seems likely that MacOS, NetBSD or A/UX guests
> >     will also require better 6522 emulation.
> > 
> > To make collaboration easier these patches can also be fetched from
> > github [3].
> > 
> > On a real Quadra, accesses to the SY6522 chips are slow because they are
> > synchronous with the 783360 Hz "phase 2" clock. In QEMU, they are slow
> > only because of the division operation in the timer count calculation.
> > 
> > This patch series improves the fidelity of the emulated chip, but the
> > price is more division ops. I haven't tried to measure this yet.
> > 
> > The emulated 6522 still deviates from the behaviour of the real thing,
> > however. For example, two consecutive accesses to a real 6522 timer
> > counter can never yield the same value. This is not true of the 6522 in
> > QEMU 6 wherein two consecutive accesses to a timer count register have
> > been observed to yield the same value.
> > 
> > Linux is not particularly robust in the face of a 6522 that deviates
> > from the usual behaviour. The problem presently affecting a Linux guest
> > is that its 'via' clocksource is prone to monotonicity failure. That is,
> > the clocksource counter can jump backwards. This can be observed by
> > patching Linux like so:
> > 
> > diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
> > --- a/arch/m68k/mac/via.c
> > +++ b/arch/m68k/mac/via.c
> > @@ -606,6 +606,8 @@ void __init via_init_clock(void)
> >   	clocksource_register_hz(&mac_clk, VIA_CLOCK_FREQ);
> >   }
> >   +static u32 prev_ticks;
> > +
> >   static u64 mac_read_clk(struct clocksource *cs)
> >   {
> >   	unsigned long flags;
> > @@ -631,6 +633,8 @@ static u64 mac_read_clk(struct clocksource *cs)
> >   	count = count_high << 8;
> >   	ticks = VIA_TIMER_CYCLES - count;
> >   	ticks += clk_offset + clk_total;
> > +if (ticks < prev_ticks) pr_warn("%s: %u < %u\n", __func__, ticks,
> > prev_ticks);
> > +prev_ticks = ticks;
> >   	local_irq_restore(flags);
> >     	return ticks;
> > 
> > This problem can be partly blamed on a 6522 design limitation, which is
> > that the timer counter has no overflow register. Hence, if a timer
> > counter wraps around and the kernel is late to handle the subsequent
> > interrupt, the kernel can't account for any missed ticks.
> > 
> > On a real Quadra, the kernel mitigates this limitation by minimizing
> > interrupt latency. But on QEMU, interrupt latency is unbounded. This
> > can't be mitigated by the guest kernel at all and leads to clock drift.
> > This can be observed by patching QEMU like so:
> > 
> > diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> > --- a/hw/misc/mos6522.c
> > +++ b/hw/misc/mos6522.c
> > @@ -379,6 +379,12 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t
> > val, unsigned size)
> >           s->pcr = val;
> >           break;
> >       case VIA_REG_IFR:
> > +        if (val & T1_INT) {
> > +            static int64_t last_t1_int_cleared;
> > +            int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +            if (now - last_t1_int_cleared > 20000000) printf("\t%s: t1 int
> > clear is late\n", __func__);
> > +            last_t1_int_cleared = now;
> > +        }
> >           /* reset bits */
> >           s->ifr &= ~val;
> >           mos6522_update_irq(s);
> > 
> > This logic asserts that, given that Linux/m68k sets CONFIG_HZ to 100,
> > the emulator will theoretically see each timer 1 interrupt cleared
> > within 20 ms of the previous one. But that deadline is often missed on
> > my QEMU host [4].
> > 
> > On real Mac hardware you could observe the same scenario if a high
> > priority interrupt were to sufficiently delay the timer interrupt
> > handler. (This is the reason why the VIA1 interrupt priority gets
> > increased from level 1 to level 5 when running on Quadras.)
> > 
> > Anyway, for now, the clocksource monotonicity problem in Linux/mac68k
> > guests is still unresolved. Nonetheless, I think this patch series does
> > improve the situation.
> > 
> > [1] I've also been working on some improvements to Linux/m68k based on
> > Arnd Bergman's clockevent RFC patch,
> > https://lore.kernel.org/linux-m68k/20201008154651.1901126-14-arnd@arndb.de/
> > The idea is to add a oneshot clockevent device by making use of the
> > second VIA1 timer. This approach should help mitigate the clock drift
> > problem as well as assist with GENERIC_CLOCKEVENTS adoption.
> > 
> > [2] https://github.com/mcayland/qemu/commits/q800.upstream
> > 
> > [3] https://github.com/fthain/qemu/commits/via-timer/
> > 
> > [4] This theoretical 20 ms deadline is not missed prior to every
> > backwards jump in the clocksource counter. AFAICT, that's because the
> > true deadline is somewhat shorter than 20 ms.
> > 
> > 
> > Finn Thain (10):
> >    hw/mos6522: Remove get_load_time() methods and functions
> >    hw/mos6522: Remove get_counter_value() methods and functions
> >    hw/mos6522: Remove redundant mos6522_timer1_update() calls
> >    hw/mos6522: Rename timer callback functions
> >    hw/mos6522: Don't clear T1 interrupt flag on latch write
> >    hw/mos6522: Implement oneshot mode
> >    hw/mos6522: Fix initial timer counter reload
> >    hw/mos6522: Call mos6522_update_irq() when appropriate
> >    hw/mos6522: Avoid using discrepant QEMU clock values
> >    hw/mos6522: Synchronize timer interrupt and timer counter
> > 
> >   hw/misc/mos6522.c         | 232 +++++++++++++++++---------------------
> >   hw/misc/trace-events      |   2 +-
> >   include/hw/misc/mos6522.h |   9 ++
> >   3 files changed, 113 insertions(+), 130 deletions(-)
> 
> I just wanted to say that this patchset is obviously the result of a huge
> amount of effort trying to figure out why the clock in Linux/m68k appears to
> jump backwards in QEMU, and certainly references conditions in real hardware
> that is not explained in the datasheet in sufficient detail.
> 
> From my perspective I'd suggest tackling the 2 main issues first: 1) ensuring
> that the clock is monotonic and 2) adding the one shot timer mode. 

Well, that's how I arrived at this series. The oneshot timer mode was 
needed in order to implement a oneshot clockevent device.

> The other fixes/updates can then be layered on top once we're confident 
> that the underlying timing mechanism works not just for Linux/m68k but 
> also for cuda on PPC.
> 

Fixes normally go at the start of the series, new features at the end. 
This helps review, bisection and backporting.

> I'm also slightly suspicious of the if() blocks introduced in mos6522_read()
> introduce via commit cd8843ff25d ("mos6522: fix T1 and T2 timers").
> 

Fair enough... I see that you also raised this in your reply to patch 
6/10; I'll have to take another look at that code and respond in that 
thread. That patch was written some time ago and I've forgotten the 
rationale. Perhaps Laurent will comment on commit cd8843ff25d.

> In your comments above you mention:
> 
> > On real Mac hardware you could observe the same scenario if a high
> > priority interrupt were to sufficiently delay the timer interrupt
> > handler. (This is the reason why the VIA1 interrupt priority gets
> > increased from level 1 to level 5 when running on Quadras.)
> 
> This isn't currently true for QEMU: if you look at hw/m68k/q800.c you can see
> that the VIA interrupts are hard-wired to levels 1 and 2 respectively. You can
> change the VIA1 interrupt so it is routed to level 5 instead of level 1 with
> the following diff:
> 
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index ac0a13060b..dc8dbe5c6f 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -281,7 +281,7 @@ static void q800_init(MachineState *machine)
>      sysbus_realize_and_unref(sysbus, &error_fatal);
>      sysbus_mmio_map(sysbus, 0, VIA_BASE);
>      qdev_connect_gpio_out_named(DEVICE(sysbus), "irq", 0,
> -                                qdev_get_gpio_in(glue, 0));
> +                                qdev_get_gpio_in(glue, 4));
>      qdev_connect_gpio_out_named(DEVICE(sysbus), "irq", 1,
>                                  qdev_get_gpio_in(glue, 1));
> 
> The q800.upstream branch goes further and implements the dynamic interrupt
> routing required by A/UX but the above should be a basic test to see if the
> increased priority helps with your timing issue at all.
> 

That would only help if the handlers for interrupts having greater 
priority (IPL > 1) were slow. But the problem is not that. The root cause 
here is unbounded interrupt latency in general. A real quadra does not 
inflict that on the kernel.

