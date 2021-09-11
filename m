Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 177BC407427
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 02:11:18 +0200 (CEST)
Received: from localhost ([::1]:35794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOqc0-0005iA-L3
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 20:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mOqZZ-0004Lw-BT; Fri, 10 Sep 2021 20:08:45 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:53193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mOqZU-00053e-4E; Fri, 10 Sep 2021 20:08:45 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id BF63D5C01A1;
 Fri, 10 Sep 2021 20:08:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 10 Sep 2021 20:08:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=oaFMqn
 7Dmn15LmZncFTKfNbDHExl5tGbquLHKTbIbZg=; b=PkDHoKmtvK8DdaicCbsV+V
 d5vBx5hwbGgwpCOOx90kDunIzsHvA2ks5YFQdht2inTiCd4UJmJahdj4mJznF7Yx
 1p/jdQCdiO0R5zetjTS0RCYpv+E5f8kye5r8s86ctoik0H/dupMZrMWV5JDGZeIq
 hjMsvYWAsyAOYDQeCuuccy1bgbUCYzZT3r8fFaEWJeZjdsJAmUEwXfVDmiYe3urW
 5kfl064nU4jreVAjESdIg4JZa0EiVGNG2qwDBNx+ODYAD/z/yl2yxm5iK6CQGg0S
 R60+cOTVMWykHQp9YuT/6YSPb0j0x7LQELJ/N/On7m2uCUnPyN5BIGoCHVWxSLjw
 ==
X-ME-Sender: <xms:g_M7YbOThZk45iILeAM-bugxpEBcCG_RNnEXx86MbOUduXAP8EEViA>
 <xme:g_M7YV_RjAt9w-GY6zcYXoRuwRRzjGawi-v0RL0fnHFA_158Cb-jGgb363SOk9RTo
 VB3D0bRgm-Scl0eUTE>
X-ME-Received: <xmr:g_M7YaTXBMxWnDYoOZw95l_eLPx-Sd933gw8ScYYXcFQRE1bkHYmNAXKDONQethGQaDUAXZINO7CyS0edQNVQmjzdCTTNzNYsPyuMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegvddgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepgfdtgedugfehhefhueegfeefhfevgfejveffgeefudffudegkeekffffjeej
 hedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehk
 rdhorhhg
X-ME-Proxy: <xmx:g_M7YfuU4H9m5HezL_uBKUs6Vo0rZePviqoccCW6584VPrJhnXDDLg>
 <xmx:g_M7YTe1IHZ5ovdyRHtYhReGoe-1E62xW_UETECefzl1CCh4rAZFfw>
 <xmx:g_M7Yb0uV_DB7v-Yqe94q1OEcd2n8jYOVBBqkob02IqNTG5Ar3TzuA>
 <xmx:hPM7Ya71BOASxo9t_cE30pJN-hXKwY7EuWlmmV1b1n4lvPySHoCTeA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 20:08:32 -0400 (EDT)
Date: Sat, 11 Sep 2021 10:08:26 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [RFC 00/10] hw/mos6522: VIA timer emulation fixes and improvements
In-Reply-To: <39ba85bb-0bba-20b1-ef39-9362bb23bedc@ilande.co.uk>
Message-ID: <d06666-ce8a-88d5-e47e-d2439241a74@linux-m68k.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <283af572-2157-77c6-2594-8e9e92497346@amsat.org>
 <fb42cb6-117c-c138-c18a-3af7f1d9be6a@linux-m68k.org>
 <4da39536-1acb-05c3-755c-9a30d82d6ace@ilande.co.uk>
 <88a445-398a-7566-171b-c551b61c38b@linux-m68k.org>
 <abc8ceff-8336-b3b1-d5f1-37d412a393ca@ilande.co.uk>
 <f35346db-5246-73a7-d6dc-28492d922ed7@ilande.co.uk>
 <39ba85bb-0bba-20b1-ef39-9362bb23bedc@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=66.111.4.26; envelope-from=fthain@linux-m68k.org;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 10 Sep 2021, Mark Cave-Ayland wrote:

> On 01/09/2021 09:06, Mark Cave-Ayland wrote:
> 
> > I'll have a go at some basic timer measurements using your patch to 
> > see what sort of numbers I get for the latency here. Obviously QEMU 
> > doesn't guarantee response times but over 20ms does seem high.
> 
> I was able to spend some time today looking at this and came up with 
> https://github.com/mcayland/qemu/tree/via-hacks with the aim of starting 
> with your patches to reduce the calls to the timer update functions (to 
> reduce jitter) and fixing up the places where mos6522_update_irq() isn't 
> called.
> 

What kind of guest was that? What impact does jitter have on that guest? 
Was the jitter measurement increased, decreased or unchanged by this patch 
series?

> That seemed okay, but the part I'm struggling with at the moment is 
> removing the re-assertion of the timer interrupt if the timer has 
> expired when any of the registers are read i.e.
> 
> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> index 3c33cbebde..9884d7e178 100644
> --- a/hw/misc/mos6522.c
> +++ b/hw/misc/mos6522.c
> @@ -229,16 +229,7 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned
> size)
>  {
>      MOS6522State *s = opaque;
>      uint32_t val;
> -    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> 
> -    if (now >= s->timers[0].next_irq_time) {
> -        mos6522_timer1_update(s, &s->timers[0], now);
> -        s->ifr |= T1_INT;
> -    }
> -    if (now >= s->timers[1].next_irq_time) {
> -        mos6522_timer2_update(s, &s->timers[1], now);
> -        s->ifr |= T2_INT;
> -    }
>      switch (addr) {
>      case VIA_REG_B:
>          val = s->b;
> 
> If I apply this then I see a hang in about roughly 1 in 10 boots. Poking 
> it with a debugger shows that the VIA1 timer interrupts are constantly 
> being fired as IER and IFR have the timer 1 bit set, but it is being 
> filtered out by SR being set to 0x2700 on the CPU.
> 
> The existing code above isn't correct since T1_INT should only be 
> asserted by the expiry of the timer 1 via mos6522_timer1(), so I'm 
> wondering if this is tickling a CPU bug somewhere? In what circumstances 
> could interrupts be disabled via SR but not enabled again?
> 

The code you're patching here was part of Laurent's commit cd8843ff25 
("mos6522: fix T1 and T2 timers"). You've mentioned that elsewhere in this 
thread. My response is the same as before: this patch series removes that 
code so it's moot.

Please test the patch series I sent, unmodified. If you find a problem 
with my code, please do report it here. I believe that you will see no 
hangs at all.

