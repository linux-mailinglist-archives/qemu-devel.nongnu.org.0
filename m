Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E993F5BC6
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 12:15:36 +0200 (CEST)
Received: from localhost ([::1]:34430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mITSw-0000T7-NF
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 06:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mITRU-0006Vk-3a; Tue, 24 Aug 2021 06:14:04 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:33465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mITRR-0003zJ-Ql; Tue, 24 Aug 2021 06:14:03 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 2C2E33200A03;
 Tue, 24 Aug 2021 06:13:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 24 Aug 2021 06:13:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=lHThZXP+YuukjnZvYCGSbWqijVdDrotYHvxZjcthAfI=; b=ci868bDp
 OfUg8p7Ged8akJgeqiUEsdkmV7dSVy9puWRcR+GdP021peUVZFrivG/OsLv1wviP
 pnbfWMMoGGeUUD3iFICyFOSXT8tIT6CzjVaOevcYKh03gEt2Q7ZQjhS8lQFDB7nF
 xtZ8CWEQpLUE3Q3CTTHhMaOH1n+XHdy/bFyrNPtPCD7SB9t4PVfaNJxFio6J2b+k
 FW2b2PoYpTY5cNt1X2I3RFhWLPxEKNT4hHGbucJDnO2/eJ+u6ZydUPVZF3pfTyoN
 cSlJdiU/yqJGQfbaZToh4HVHHWrp/ZpVSEyqvNDD9YNp11CIN/LpAWSc1fWphUed
 yDRbVOyJOAeZKg==
X-ME-Sender: <xms:YcYkYcUMib-6k9cvF8c-cAT5FV4V0ZqwWkQ2fqZc0r1NeS-OcHK5Ww>
 <xme:YcYkYQmKZZIBCqOWyNlojCJpioUc5HN0-V_HcTavMB9yIPbvBaeleezPUc6uC6udI
 0EFXVzKTLu82Dlm0Qg>
X-ME-Received: <xmr:YcYkYQY07JRRnMXhlKjUC8HXm8lrHdUr8iY8wx0O-YsopWNAMDcEXkg2lN1iOC4ARNfcSmwV92-tPAsTpOZrplhjdsStbxMaoIp7sg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtjedgvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkffhufffvfestddtredttddttdenucfhrhhomhephfhinhhnucfvhhgrihhn
 uceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvghrnh
 epgeffffegjefhueekhffhleeuleehtdehvddtieeufedvtdehjeevvefhgefgleevnecu
 ffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhn
 uhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:YcYkYbX2ug3JyCmn25xBJjNhEluHxAObRweE0CfGLrO2NpUDkJ4nlA>
 <xmx:YcYkYWltYXO5wo3M5bNZJL1w90PUBD0qtbJX78ldAqbNPMLjYhiOKw>
 <xmx:YcYkYQeIehQS9A6FinU2ZyZ77DO7V2Eli6MyCVnMcQ5PORWP8X0_1A>
 <xmx:ZMYkYYhH86WAs6jb08LVShtIdqX9oHf26otiBunEFhomnKwjSqAG8Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Aug 2021 06:13:50 -0400 (EDT)
Message-Id: <cover.1629799776.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [RFC 00/10] hw/mos6522: VIA timer emulation fixes and improvements
Date: Tue, 24 Aug 2021 20:09:36 +1000
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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

This is a patch series that I started last year. The aim was to try to 
get a monotonic clocksource for Linux/m68k guests. That aim hasn't been 
achieved yet (for q800 machines) but I'm submitting the patch series as 
an RFC because,

 - It does improve 6522 emulation fidelity.

 - It allows Linux/m68k to make use of the additional timer that the 
   hardware indeed offers but which QEMU omits. This has several 
   benefits for Linux guests [1].

 - I see that Mark has been working on timer emulation issues in his 
   github repo [2] and it seems likely that MacOS, NetBSD or A/UX guests 
   will also require better 6522 emulation.

To make collaboration easier these patches can also be fetched from 
github [3].

On a real Quadra, accesses to the SY6522 chips are slow because they are 
synchronous with the 783360 Hz "phase 2" clock. In QEMU, they are slow 
only because of the division operation in the timer count calculation.

This patch series improves the fidelity of the emulated chip, but the 
price is more division ops. I haven't tried to measure this yet.

The emulated 6522 still deviates from the behaviour of the real thing, 
however. For example, two consecutive accesses to a real 6522 timer 
counter can never yield the same value. This is not true of the 6522 in 
QEMU 6 wherein two consecutive accesses to a timer count register have 
been observed to yield the same value.

Linux is not particularly robust in the face of a 6522 that deviates 
from the usual behaviour. The problem presently affecting a Linux guest 
is that its 'via' clocksource is prone to monotonicity failure. That is, 
the clocksource counter can jump backwards. This can be observed by 
patching Linux like so:

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
+if (ticks < prev_ticks) pr_warn("%s: %u < %u\n", __func__, ticks, prev_ticks);
+prev_ticks = ticks;
 	local_irq_restore(flags);
 
 	return ticks;

This problem can be partly blamed on a 6522 design limitation, which is 
that the timer counter has no overflow register. Hence, if a timer 
counter wraps around and the kernel is late to handle the subsequent 
interrupt, the kernel can't account for any missed ticks.

On a real Quadra, the kernel mitigates this limitation by minimizing 
interrupt latency. But on QEMU, interrupt latency is unbounded. This 
can't be mitigated by the guest kernel at all and leads to clock drift. 
This can be observed by patching QEMU like so:

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
increased from level 1 to level 5 when running on Quadras.)

Anyway, for now, the clocksource monotonicity problem in Linux/mac68k 
guests is still unresolved. Nonetheless, I think this patch series does 
improve the situation.

[1] I've also been working on some improvements to Linux/m68k based on 
Arnd Bergman's clockevent RFC patch, 
https://lore.kernel.org/linux-m68k/20201008154651.1901126-14-arnd@arndb.de/ 
The idea is to add a oneshot clockevent device by making use of the 
second VIA1 timer. This approach should help mitigate the clock drift 
problem as well as assist with GENERIC_CLOCKEVENTS adoption.

[2] https://github.com/mcayland/qemu/commits/q800.upstream

[3] https://github.com/fthain/qemu/commits/via-timer/

[4] This theoretical 20 ms deadline is not missed prior to every 
backwards jump in the clocksource counter. AFAICT, that's because the 
true deadline is somewhat shorter than 20 ms.


Finn Thain (10):
  hw/mos6522: Remove get_load_time() methods and functions
  hw/mos6522: Remove get_counter_value() methods and functions
  hw/mos6522: Remove redundant mos6522_timer1_update() calls
  hw/mos6522: Rename timer callback functions
  hw/mos6522: Don't clear T1 interrupt flag on latch write
  hw/mos6522: Implement oneshot mode
  hw/mos6522: Fix initial timer counter reload
  hw/mos6522: Call mos6522_update_irq() when appropriate
  hw/mos6522: Avoid using discrepant QEMU clock values
  hw/mos6522: Synchronize timer interrupt and timer counter

 hw/misc/mos6522.c         | 232 +++++++++++++++++---------------------
 hw/misc/trace-events      |   2 +-
 include/hw/misc/mos6522.h |   9 ++
 3 files changed, 113 insertions(+), 130 deletions(-)

-- 
2.26.3


