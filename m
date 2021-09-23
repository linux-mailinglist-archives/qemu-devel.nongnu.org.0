Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2A94168BF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 02:10:13 +0200 (CEST)
Received: from localhost ([::1]:42280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTYn6-0002IY-Pc
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 20:10:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mTYgY-0001Yh-VP; Thu, 23 Sep 2021 20:03:27 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:47023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mTYgL-0005Yc-HR; Thu, 23 Sep 2021 20:03:26 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 413935C0187;
 Thu, 23 Sep 2021 20:03:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 23 Sep 2021 20:03:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=j6otoy
 8ugqUz8D2g9GzsCuGBdE+MqAREYWAo8ooYVns=; b=NI4aP5wGfVfhUSZVN690YX
 EqlDlw7Cva1FtZjPB3uy5oWngmyivEvx6x+Zb4InKJKUgSUrzFmq0ivad7iVWAkt
 QHw+exrS1IzDKtqVxQJ6wJUxWnsS51/P9ji07oELc0y+cI1+rxMr7Ngj3BxVSg/Z
 K+iBcc3AVeZGzB69eI6m/SbD+hrveAGmqGBTopce5HFVIi8yHNUTHNS+jSEDqQdK
 KdA928uD+Csj3tqEH8FBuTAtAdu2wgc0jKWiVI5tDjzlN5Rl+wHCNZTYA8MYVIEo
 xt8tOguXlKqstzaE1ifsN1NeasLTozragoYyo9Vz+cCsE5VXhAx7kozyWLCpWAeg
 ==
X-ME-Sender: <xms:vRVNYWAjc5cNko0M102XuqYXI-jRiQJMIO_5CyKuiIgQFKl20j3Kig>
 <xme:vRVNYQhsRBLSaZFRizh-kluiTx8ERPkJ6NPvEMA_XwP1kpfKET0l1VOpWziJlY9X2
 Dk587n_VJXuYycBtCQ>
X-ME-Received: <xmr:vRVNYZmH8b7S-mQohIzgsoAP1ZgqgwFNdA02WDIhSpBwW4XHDi4F4vDj_8rnxYNXtGi-14IjHwzvP0ryxcZFTtOF6dLksvWFfiofZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkffhufggtgfgfffvsehtkeertddttdejnecuhfhrohhmpefhihhnnhcuvfhh
 rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
 gvrhhnpeffhfettdeileeftdehudektdfggeffvdegheehieelheeiteduvefhvdejueej
 jeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinhes
 lhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:vRVNYUyemUACRrHOvtkZparvnGl7rt9Jt5QnOzPLWKUENLF-GHFBow>
 <xmx:vRVNYbRy9JeMTjWWUjyJkf6CJFDaERuqSBfPVXd0AWrUBskj1-kl_g>
 <xmx:vRVNYfYq-ag_qGyX-RkeMd-c6Gh_Rh6H_YZ_uU9QDFwOLZXEe3joTQ>
 <xmx:vhVNYWeij4aS1LLgHObzoeE-Eiym08sHxL-KFrayuQD5-Jt1pRgiuw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Sep 2021 20:03:07 -0400 (EDT)
Message-Id: <cover.1632437396.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v1 0/9] hw/mos6522: VIA timer emulation fixes and improvements
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Date: Fri, 24 Sep 2021 08:49:56 +1000
To: Greg Kurz <groug@kaod.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Received-SPF: none client-ip=66.111.4.29; envelope-from=fthain@linux-m68k.org;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

This is a patch series for QEMU that I started last year. The aim was to 
try to get a monotonic clocksource for Linux/m68k guests. That hasn't 
been achieved yet (for q800 machines). I'm submitting the patch series 
because,

 - it improves 6522 emulation fidelity, although slightly slower, and

 - it allows Linux/m68k to make use of the additional timer that the 
   hardware indeed offers, but which QEMU omits, and which may be of 
   benefit to Linux guests [1], and

 - I see that Mark has been working on timer emulation issues in his 
   github repo [2] and it seems likely that MacOS, NetBSD or A/UX guests 
   will also require better 6522 emulation.

To make collaboration easier these patches can also be fetched from 
github [3].

On a real Quadra, accesses to the SY6522 chips are slow because they are 
synchronous with the 783360 Hz "phase 2" clock. In QEMU, they are slow 
because of the division operation in the timer count calculation. This 
patch series improves the fidelity of the emulated chip, but the price 
is more division ops.

The emulated 6522 still deviates from the behaviour of the real thing, 
however. For example, two consecutive accesses to a real 6522 timer 
counter can never yield the same value. This is not true of the emulated 
6522 in QEMU 6, wherein two consecutive accesses to a timer count 
register have been observed to yield the same value.

Two problems presently affecting a Linux guest are clock drift and 
monotonicity failure in the 'via' clocksource. That is, the clocksource 
counter can jump backwards. This can be observed by patching Linux like 
so,

diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
--- a/arch/m68k/mac/via.c
+++ b/arch/m68k/mac/via.c
@@ -606,6 +606,8 @@ void __init via_init_clock(void)
 	clocksource_register_hz(&mac_clk, VIA_CLOCK_FREQ);
 }
 
+static u32 prev_ticks;
+
 static u64 mac_read_clk(struct clocksource *cs)
 {
 	unsigned long flags;
@@ -631,6 +633,8 @@ static u64 mac_read_clk(struct clocksource *cs)
 	count = count_high << 8;
 	ticks = VIA_TIMER_CYCLES - count;
 	ticks += clk_offset + clk_total;
+	if (ticks < prev_ticks) pr_warn("%s: %u < %u\n", __func__, ticks, prev_ticks);
+	prev_ticks = ticks;
 	local_irq_restore(flags);
 
 	return ticks;


Or just enable CONFIG_DEBUG_TIMEKEEPING:

[ 1872.720000] INFO: timekeeping: Cycle offset (4294966426) is larger than the 'via1' clock's 50% safety margin (2147483647)
[ 1872.720000] timekeeping: Your kernel is still fine, but is feeling a bit nervous 
[ 1907.510000] INFO: timekeeping: Cycle offset (4294962989) is larger than the 'via1' clock's 50% safety margin (2147483647) 
[ 1907.510000] timekeeping: Your kernel is still fine, but is feeling a bit nervous 
[ 1907.900000] INFO: timekeeping: Cycle offset (4294963248) is larger than the 'via1' clock's 50% safety margin (2147483647) 
[ 1907.900000] timekeeping: Your kernel is still fine, but is feeling a bit nervous


This problem can be partly blamed on a 6522 design limitation, which is 
that the timer counter has no overflow register. Hence, if a timer 
counter wraps around and the kernel is late to handle the subsequent 
interrupt, the kernel can't account for any missed ticks.

On a real Quadra, the kernel mitigates this limitation by minimizing 
interrupt latency. But on QEMU, interrupt latency is unbounded. This 
can't be mitigated by the guest kernel and leads to clock drift.

This latency can be observed by patching QEMU like so:

diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -379,6 +379,12 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
         s->pcr = val;
         break;
     case VIA_REG_IFR:
+        if (val & T1_INT) {
+            static int64_t last_t1_int_cleared;
+            int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+            if (now - last_t1_int_cleared > 20000000) printf("\t%s: t1 int clear is late\n", __func__);
+            last_t1_int_cleared = now;
+        }
         /* reset bits */
         s->ifr &= ~val;
         mos6522_update_irq(s);


This logic asserts that, given that Linux/m68k sets CONFIG_HZ to 100, 
the emulator will theoretically see each timer 1 interrupt cleared 
within 20 ms of the previous one. But that deadline is often missed on 
my QEMU host [4].

On real Mac hardware you could observe the same scenario if a high 
priority interrupt were to sufficiently delay the timer interrupt 
handler. (This is the reason why the VIA1 interrupt priority gets 
increased from level 1 to level 6 when running on Quadras.)

Anyway, for now, the clocksource monotonicity problem in Linux/mac68k 
guests is still unresolved. Nonetheless, I think this patch series does 
improve the situation.

[1] I've also been working on some improvements to Linux/m68k based on 
Arnd Bergman's clockevent RFC patch, 
https://lore.kernel.org/linux-m68k/20201008154651.1901126-14-arnd@arndb.de/ 
The idea is to add a oneshot clockevent device by making use of the 
second VIA1 timer. This approach should help mitigate the clock drift 
problem as well as assist with CONFIG_GENERIC_CLOCKEVENTS adoption, 
which would enable CONFIG_NO_HZ_IDLE etc.

[2] https://github.com/mcayland/qemu/commits/q800.upstream

[3] https://github.com/fthain/qemu/commits/via-timer

[4] This theoretical 20 ms deadline is not missed prior to every 
backwards jump in the clocksource counter. AFAICT, that's because the 
true deadline is somewhat shorter than 20 ms.

--- 
Changed since RFC:
 - Added Reviewed-by tags.
 - Re-ordered some patches to make fixes available earlier in the series.
 - Dropped patch 5/10 "Don't clear T1 interrupt flag on latch write".
 - Rebased on v6.1.0 release.


Finn Thain (9):
  hw/mos6522: Remove get_load_time() methods and functions
  hw/mos6522: Remove get_counter_value() methods and functions
  hw/mos6522: Remove redundant mos6522_timer1_update() calls
  hw/mos6522: Rename timer callback functions
  hw/mos6522: Fix initial timer counter reload
  hw/mos6522: Call mos6522_update_irq() when appropriate
  hw/mos6522: Avoid using discrepant QEMU clock values
  hw/mos6522: Synchronize timer interrupt and timer counter
  hw/mos6522: Implement oneshot mode

 hw/misc/mos6522.c         | 245 ++++++++++++++++++--------------------
 hw/misc/trace-events      |   2 +-
 include/hw/misc/mos6522.h |   9 ++
 3 files changed, 123 insertions(+), 133 deletions(-)

-- 
2.26.3


