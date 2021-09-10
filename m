Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B66740708F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 19:31:46 +0200 (CEST)
Received: from localhost ([::1]:36316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOkNM-0001qC-Oa
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 13:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mOkLa-0000tO-Ij; Fri, 10 Sep 2021 13:29:54 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:34064
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mOkLY-0007If-PB; Fri, 10 Sep 2021 13:29:54 -0400
Received: from host86-140-11-91.range86-140.btcentralplus.com ([86.140.11.91]
 helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mOkLH-0004YJ-BM; Fri, 10 Sep 2021 18:29:39 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: Finn Thain <fthain@linux-m68k.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <283af572-2157-77c6-2594-8e9e92497346@amsat.org>
 <fb42cb6-117c-c138-c18a-3af7f1d9be6a@linux-m68k.org>
 <4da39536-1acb-05c3-755c-9a30d82d6ace@ilande.co.uk>
 <88a445-398a-7566-171b-c551b61c38b@linux-m68k.org>
 <abc8ceff-8336-b3b1-d5f1-37d412a393ca@ilande.co.uk>
 <f35346db-5246-73a7-d6dc-28492d922ed7@ilande.co.uk>
Message-ID: <39ba85bb-0bba-20b1-ef39-9362bb23bedc@ilande.co.uk>
Date: Fri, 10 Sep 2021 18:29:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f35346db-5246-73a7-d6dc-28492d922ed7@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.140.11.91
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC 00/10] hw/mos6522: VIA timer emulation fixes and improvements
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.349,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/09/2021 09:06, Mark Cave-Ayland wrote:

> I'll have a go at some basic timer measurements using your patch to see what sort of 
> numbers I get for the latency here. Obviously QEMU doesn't guarantee response times 
> but over 20ms does seem high.

I was able to spend some time today looking at this and came up with 
https://github.com/mcayland/qemu/tree/via-hacks with the aim of starting with your 
patches to reduce the calls to the timer update functions (to reduce jitter) and 
fixing up the places where mos6522_update_irq() isn't called.

That seemed okay, but the part I'm struggling with at the moment is removing the 
re-assertion of the timer interrupt if the timer has expired when any of the 
registers are read i.e.

diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index 3c33cbebde..9884d7e178 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -229,16 +229,7 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
  {
      MOS6522State *s = opaque;
      uint32_t val;
-    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);

-    if (now >= s->timers[0].next_irq_time) {
-        mos6522_timer1_update(s, &s->timers[0], now);
-        s->ifr |= T1_INT;
-    }
-    if (now >= s->timers[1].next_irq_time) {
-        mos6522_timer2_update(s, &s->timers[1], now);
-        s->ifr |= T2_INT;
-    }
      switch (addr) {
      case VIA_REG_B:
          val = s->b;

If I apply this then I see a hang in about roughly 1 in 10 boots. Poking it with a 
debugger shows that the VIA1 timer interrupts are constantly being fired as IER and 
IFR have the timer 1 bit set, but it is being filtered out by SR being set to 0x2700 
on the CPU.

The existing code above isn't correct since T1_INT should only be asserted by the 
expiry of the timer 1 via mos6522_timer1(), so I'm wondering if this is tickling a 
CPU bug somewhere? In what circumstances could interrupts be disabled via SR but not 
enabled again?


ATB,

Mark.

