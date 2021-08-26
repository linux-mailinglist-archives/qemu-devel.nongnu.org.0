Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 618D93F8200
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 07:23:14 +0200 (CEST)
Received: from localhost ([::1]:46600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJ7qw-0007Dy-Ta
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 01:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mJ7pb-0006Mo-AL; Thu, 26 Aug 2021 01:21:39 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:37435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mJ7pZ-00089U-9L; Thu, 26 Aug 2021 01:21:39 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 35AE25C0151;
 Thu, 26 Aug 2021 01:21:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 26 Aug 2021 01:21:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=bskgcM
 C9y26v+u+6Y0yOgGgv5D1EuJiUvIx22z2XyJ0=; b=uyR+NHiZUXA3asaL+p59vj
 D7Ad4DQDa8F5YbCpTyW+LToJnbxqG+rjYqkWwpVrGwAe3IcsPYyKoaj5TV5ya6Jg
 f5y7XMda2udVefBznKYRdoNA9XZBfeeZFkaqKgF6WCqzm/AIne+r4g6VCPcCuD5Q
 n2vRuho350km5PRH/SOatqTOt2qW2YsYC7MzycXHXFU4huLmMqIvqMQnOlfzHTVv
 fRWcdqaYcS3oNYq9qzfCZ5tKNcay4paTzdQZnOaf7mZnaoOnQ2l9KKXq3UrRDoB6
 n5ySMWRnXBMhBXUUdz/yoxHl6fUQqMRUgutNrw6bohSkbayWRp/TdWQEnai+apGg
 ==
X-ME-Sender: <xms:2iQnYb4ZAiJ-sxBj73FIsYARwTLYxRXsr5yccXmN2MTImhxFUEg5eA>
 <xme:2iQnYQ7GIyUjK6iZd-QYRjSqcs5x4E1zD92D0Wj5cVhFvdlimWCJmZvFxgqqGeDRJ
 X33RDmmYSIRzRIOBkE>
X-ME-Received: <xmr:2iQnYSdAdKS4NgG2lh1jYzr_ayqwkSxcZoagyoT2D-Qf-iLTxApEGGz4LKCZv7CIWC4P1t5NQzzWPLofgWxgqWrypuaPME5zdQk9rA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddutddgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepiedvieetledvleevvdeiffetieekfffhleetjeeijeelffejudduteeihfff
 kedtnecuffhomhgrihhnpeeihedtvddrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdho
 rhhg
X-ME-Proxy: <xmx:2yQnYcLG-bFpoevn7o4rRLmVgHKD0w3BhxxDRtOwgTqKuj5hSUrA5g>
 <xmx:2yQnYfKwB-PxaSTspfYfjHyMsxSUXZyX6MOzBFfDDOrW5_R-lBPY8g>
 <xmx:2yQnYVxfPg8u6Qmg78HN9WQ9XNlTxto6WXSjNIKbCs_icUsz2amcwA>
 <xmx:3SQnYX3UOIZORHnmblV_rQe-GBDrvC8DTGt6G2w8F3WC_xhAfe3zEg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Aug 2021 01:21:28 -0400 (EDT)
Date: Thu, 26 Aug 2021 15:21:22 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [RFC 05/10] hw/mos6522: Don't clear T1 interrupt flag on latch
 write
In-Reply-To: <bd94f1e6-4f15-b4d0-ddc8-fa98e2e3d780@ilande.co.uk>
Message-ID: <e18e24e4-c310-4f22-e6ac-f2d7816cdf2@linux-m68k.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <b87cf2a2841d4597cc779df5dfce500c51a172ef.1629799776.git.fthain@linux-m68k.org>
 <bd94f1e6-4f15-b4d0-ddc8-fa98e2e3d780@ilande.co.uk>
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
> > The Synertek datasheet says, "A write to T1L-H loads an 8-bit count value
> > into the latch. A read of T1L-H transfers the contents of the latch to
> > the data bus. Neither operation has an affect [sic] on the interrupt
> > flag."
> > 
> > Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> > ---
> >   hw/misc/mos6522.c | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> > index c0d6bee4cc..ffff8991f4 100644
> > --- a/hw/misc/mos6522.c
> > +++ b/hw/misc/mos6522.c
> > @@ -313,7 +313,6 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t
> > val, unsigned size)
> >           break;
> >       case VIA_REG_T1LH:
> >           s->timers[0].latch = (s->timers[0].latch & 0xff) | (val << 8);
> > -        s->ifr &= ~T1_INT;
> >           break;
> >       case VIA_REG_T2CL:
> >           s->timers[1].latch = (s->timers[1].latch & 0xff00) | val;
> 
> Hmmm. The reference document I used for QEMU's 6522 device is at
> http://archive.6502.org/datasheets/mos_6522_preliminary_nov_1977.pdf and
> according to page 6 and the section "Writing the Timer 1 Registers" writing to
> the high byte of the latch does indeed clear the T1 interrupt flag.
> 
> Side note: there is reference in Gary Davidian's excellent CHM video that
> 6522s obtained from different manufacturers had different behaviours, and
> there are also web pages mentioning that 6522s integrated as part of other
> silicon e.g. IOSB/CUDA also had their own bugs... :/
> 

The MOS document you've cited is much older than the Synertek and Rockwell 
devices. The datasheets for the Synertek and Rockwell parts disagree with 
MOS about T1LH behaviour. Apple certainly used SY6522 devices in my Mac II 
and I'd assumed Apple would have used compatible logic cores in the custom 
ICs found in later models. But I don't really trust assumptions and 
datasheets so I wrote the Linux patch below and ran it on my Quadra 630.

diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
index 3d11d6219cdd..ed41f6ae2bf2 100644
--- a/arch/m68k/mac/via.c
+++ b/arch/m68k/mac/via.c
@@ -634,3 +634,27 @@ static u64 mac_read_clk(struct clocksource *cs)
 
 	return ticks;
 }
+
+static int baz(void)
+{
+	u8 a, b, c;
+
+	local_irq_disable();
+
+	while (!(via1[vIFR] & VIA_TIMER_1_INT))
+		continue;
+	a = via1[vIFR] & VIA_TIMER_1_INT;
+	via1[vT1LH] = via1[vT1LH];
+	b = via1[vIFR] & VIA_TIMER_1_INT;
+	via1[vT1LL] = via1[vT1LL];
+	c = via1[vIFR] & VIA_TIMER_1_INT;
+
+	printk("a == %2x\n", a);
+	printk("b == %2x\n", b);
+	printk("c == %2x\n", c);
+
+	local_irq_enable();
+
+	return 0;
+}
+late_initcall(baz);

Based on the Synertek datasheet* one would expect to see b equal to a but 
I got this result instead:

[   10.450000] a == 40
[   10.450000] b ==  0
[   10.450000] c ==  0

This amounts to a MOS design flaw and I doubt that this result from my 
Quadra 630 would apply to other Mac models. So it would be great to see 
the output from a Quadra 800. But until then, let's disregard this patch.

* http://archive.6502.org/datasheets/synertek_sy6522.pdf

