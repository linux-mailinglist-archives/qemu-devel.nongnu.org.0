Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 859CF453EC4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 04:05:10 +0100 (CET)
Received: from localhost ([::1]:44612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnBG0-0002g5-TX
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 22:05:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mnBEk-0001Mv-Pn; Tue, 16 Nov 2021 22:03:52 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:45527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mnBEh-0001Ou-Dh; Tue, 16 Nov 2021 22:03:50 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 8858E5C0197;
 Tue, 16 Nov 2021 22:03:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 16 Nov 2021 22:03:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=XM0L9T
 LbyByXdyFwkbEwmHrPEoqrN119IvsVijDzDKw=; b=l3axoOnofV5WHdt+/4SOJG
 6AQ+KmbJJ/QMmhXr3cOHC2gmTk6u6kz1b1K1wqY5QawNGRXXCau+Bac8xTfmjjQ6
 KvqIqCcmFipYQsYHMG79OyNp45i4mfdydA3DXVr29GwLCuch1TamNif1kPSTeJZo
 7tGYVtCZVsd4fjO/UFw6YPshZWrTn+yAfyhHcLZjqxtdLrDuffv33vmOIMGfn6Ia
 M2pstuo4nGt1ypjcfviV/zm9YmlQq18XgzPQKa2r3UpGX6DahaZZ9vSxwGfJlv2G
 xw0BIJ3KD6iKh5x1eOCCigXNJAH6a91BIFe7IxeqffgkU6UMXVfv9fPWMWzTNHFA
 ==
X-ME-Sender: <xms:D3GUYfGR1LDLZbbcO2EP2T0cHE_lVlvcOhPMe7LcWIPXpx4AAK4EJA>
 <xme:D3GUYcXFwhU0rcvieCGVdOwO_5aUO8dujleTvDz2-rrxqdee7kuasSWmNxNXIXPgL
 4d0XKoDwFGTUtHpPWw>
X-ME-Received: <xmr:D3GUYRKLmWD6mbDzyLbLr-Lth8uBVaOQOtwAondq2cbqnZxnxgtcLn0PwtxWjpMasZJD4O3ab07cX3DGQ2VhkxsZspB_xA2LxNI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeefgdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhh
 rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
 gvrhhnpefftdeiuddugfdvfeevhfdttddvleeiveeggfffgeevvdevtefgteeugffggeel
 teenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinhes
 lhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:D3GUYdHOzSmF3m7WXIWDQBzcZGbdQ_ToZhQE9MazotLXjityJTLpjA>
 <xmx:D3GUYVWZYNcwcobaQZarDo_-BScpiAiri5Jv1VnJpfz__rLEMSpLBA>
 <xmx:D3GUYYNDJg9ZkO3l_q4VuisMBwHr-mWqsz67A6ZHHiq8j7J2VhPT3A>
 <xmx:D3GUYYR2dLyXF5Z-qx9B-3d4YB5veL6EkVArjGwdS31xhqKk9UHXcQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Nov 2021 22:03:40 -0500 (EST)
Date: Wed, 17 Nov 2021 14:03:36 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Laurent Vivier <laurent@vivier.eu>, 
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v1 0/9] hw/mos6522: VIA timer emulation fixes and
 improvements
In-Reply-To: <cover.1632437396.git.fthain@linux-m68k.org>
Message-ID: <e0411348-abd7-3db9-b5bd-8f1d52c1226f@linux-m68k.org>
References: <cover.1632437396.git.fthain@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=66.111.4.25; envelope-from=fthain@linux-m68k.org;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On Fri, 24 Sep 2021, I wrote:

> This is a patch series for QEMU that I started last year. The aim was to 
> try to get a monotonic clocksource for Linux/m68k guests. That hasn't 
> been achieved yet (for q800 machines). I'm submitting the patch series 
> because,
> 
>  - it improves 6522 emulation fidelity, although slightly slower, and
> 

I did some more benchmarking to examine the performance implications.

I measured a performance improvement with this patch series. For a 
Linux/m68k guest, the execution time for a gettimeofday syscall dropped 
from 9 us to 5 us. (This is a fairly common syscall.)

The host CPU time consumed by qemu in starting the guest kernel and 
executing a benchmark involving 20 million gettimeofday calls was as 
follows.

qemu-system-m68k mainline (42f6c9179b):
    real     198 s
    sys      123 s
    user     73 s
    sys/user 1.68

qemu-system-m68k patched (0a0bca4711):
    real     112 s
    sys      63 s
    user     47 s
    sys/user 1.34

As with any microbenchmark, this workload is not a real-world one. For 
comparison, here are measurements of the time to fully startup and 
immediately shut down Debian Linux/m68k SID (systemd):

qemu-system-m68k mainline (42f6c9179b)
    real     31.5 s
    sys      1.59 s
    user     27.4 s
    sys/user 0.06

qemu-system-m68k patched (0a0bca4711)
    real     31.2 s
    sys      1.17 s
    user     27.6 s
    sys/user 0.04

The decrease in sys/user ratio reflects the small cost that has to be paid 
for the improvement in 6522 emulation fidelity and timer accuracy. But 
note that in both benchmarks wallclock execution time dropped, meaning 
that the system is faster overall.

The gettimeofday testing revealed that the Linux kernel does not properly 
protect userland from pathological hardware timers, and the gettimeofday 
result was seen to jump backwards (that was unexpected, though Mark did 
predict it).

This backwards jump was often observed in the mainline build during the 
gettimeofday benchmark and is result of bugs in mos6522.c. The patched 
build did not exhibit this problem (as yet).

The two benefits described here are offered in addition to all of the 
other benefits described in the patches themselves. Please consider 
merging this series.

>  - it allows Linux/m68k to make use of the additional timer that the 
>    hardware indeed offers, but which QEMU omits, and which may be of 
>    benefit to Linux guests [1], and
> 
>  - I see that Mark has been working on timer emulation issues in his 
>    github repo [2] and it seems likely that MacOS, NetBSD or A/UX guests 
>    will also require better 6522 emulation.
> 
> To make collaboration easier these patches can also be fetched from 
> github [3].
> 
> On a real Quadra, accesses to the SY6522 chips are slow because they are 
> synchronous with the 783360 Hz "phase 2" clock. In QEMU, they are slow 
> because of the division operation in the timer count calculation. This 
> patch series improves the fidelity of the emulated chip, but the price 
> is more division ops.
> 
> The emulated 6522 still deviates from the behaviour of the real thing, 
> however. For example, two consecutive accesses to a real 6522 timer 
> counter can never yield the same value. This is not true of the emulated 
> 6522 in QEMU 6, wherein two consecutive accesses to a timer count 
> register have been observed to yield the same value.
> 
> Two problems presently affecting a Linux guest are clock drift and 
> monotonicity failure in the 'via' clocksource. That is, the clocksource 
> counter can jump backwards. This can be observed by patching Linux like 
> so,
> 
> diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
> --- a/arch/m68k/mac/via.c
> +++ b/arch/m68k/mac/via.c
> @@ -606,6 +606,8 @@ void __init via_init_clock(void)
>  	clocksource_register_hz(&mac_clk, VIA_CLOCK_FREQ);
>  }
>  
> +static u32 prev_ticks;
> +
>  static u64 mac_read_clk(struct clocksource *cs)
>  {
>  	unsigned long flags;
> @@ -631,6 +633,8 @@ static u64 mac_read_clk(struct clocksource *cs)
>  	count = count_high << 8;
>  	ticks = VIA_TIMER_CYCLES - count;
>  	ticks += clk_offset + clk_total;
> +	if (ticks < prev_ticks) pr_warn("%s: %u < %u\n", __func__, ticks, prev_ticks);
> +	prev_ticks = ticks;
>  	local_irq_restore(flags);
>  
>  	return ticks;
> 
> 
> Or just enable CONFIG_DEBUG_TIMEKEEPING:
> 
> [ 1872.720000] INFO: timekeeping: Cycle offset (4294966426) is larger than the 'via1' clock's 50% safety margin (2147483647)
> [ 1872.720000] timekeeping: Your kernel is still fine, but is feeling a bit nervous 
> [ 1907.510000] INFO: timekeeping: Cycle offset (4294962989) is larger than the 'via1' clock's 50% safety margin (2147483647) 
> [ 1907.510000] timekeeping: Your kernel is still fine, but is feeling a bit nervous 
> [ 1907.900000] INFO: timekeeping: Cycle offset (4294963248) is larger than the 'via1' clock's 50% safety margin (2147483647) 
> [ 1907.900000] timekeeping: Your kernel is still fine, but is feeling a bit nervous
> 
> 
> This problem can be partly blamed on a 6522 design limitation, which is 
> that the timer counter has no overflow register. Hence, if a timer 
> counter wraps around and the kernel is late to handle the subsequent 
> interrupt, the kernel can't account for any missed ticks.
> 
> On a real Quadra, the kernel mitigates this limitation by minimizing 
> interrupt latency. But on QEMU, interrupt latency is unbounded. This 
> can't be mitigated by the guest kernel and leads to clock drift.
> 
> This latency can be observed by patching QEMU like so:
> 
> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> --- a/hw/misc/mos6522.c
> +++ b/hw/misc/mos6522.c
> @@ -379,6 +379,12 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>          s->pcr = val;
>          break;
>      case VIA_REG_IFR:
> +        if (val & T1_INT) {
> +            static int64_t last_t1_int_cleared;
> +            int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +            if (now - last_t1_int_cleared > 20000000) printf("\t%s: t1 int clear is late\n", __func__);
> +            last_t1_int_cleared = now;
> +        }
>          /* reset bits */
>          s->ifr &= ~val;
>          mos6522_update_irq(s);
> 
> 
> This logic asserts that, given that Linux/m68k sets CONFIG_HZ to 100, 
> the emulator will theoretically see each timer 1 interrupt cleared 
> within 20 ms of the previous one. But that deadline is often missed on 
> my QEMU host [4].
> 
> On real Mac hardware you could observe the same scenario if a high 
> priority interrupt were to sufficiently delay the timer interrupt 
> handler. (This is the reason why the VIA1 interrupt priority gets 
> increased from level 1 to level 6 when running on Quadras.)
> 
> Anyway, for now, the clocksource monotonicity problem in Linux/mac68k 
> guests is still unresolved. Nonetheless, I think this patch series does 
> improve the situation.
> 
> [1] I've also been working on some improvements to Linux/m68k based on 
> Arnd Bergman's clockevent RFC patch, 
> https://lore.kernel.org/linux-m68k/20201008154651.1901126-14-arnd@arndb.de/ 
> The idea is to add a oneshot clockevent device by making use of the 
> second VIA1 timer. This approach should help mitigate the clock drift 
> problem as well as assist with CONFIG_GENERIC_CLOCKEVENTS adoption, 
> which would enable CONFIG_NO_HZ_IDLE etc.
> 
> [2] https://github.com/mcayland/qemu/commits/q800.upstream
> 
> [3] https://github.com/fthain/qemu/commits/via-timer
> 
> [4] This theoretical 20 ms deadline is not missed prior to every 
> backwards jump in the clocksource counter. AFAICT, that's because the 
> true deadline is somewhat shorter than 20 ms.
> 
> --- 
> Changed since RFC:
>  - Added Reviewed-by tags.
>  - Re-ordered some patches to make fixes available earlier in the series.
>  - Dropped patch 5/10 "Don't clear T1 interrupt flag on latch write".
>  - Rebased on v6.1.0 release.
> 
> 
> Finn Thain (9):
>   hw/mos6522: Remove get_load_time() methods and functions
>   hw/mos6522: Remove get_counter_value() methods and functions
>   hw/mos6522: Remove redundant mos6522_timer1_update() calls
>   hw/mos6522: Rename timer callback functions
>   hw/mos6522: Fix initial timer counter reload
>   hw/mos6522: Call mos6522_update_irq() when appropriate
>   hw/mos6522: Avoid using discrepant QEMU clock values
>   hw/mos6522: Synchronize timer interrupt and timer counter
>   hw/mos6522: Implement oneshot mode
> 
>  hw/misc/mos6522.c         | 245 ++++++++++++++++++--------------------
>  hw/misc/trace-events      |   2 +-
>  include/hw/misc/mos6522.h |   9 ++
>  3 files changed, 123 insertions(+), 133 deletions(-)
> 
> 

