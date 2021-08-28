Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEAB3FA2AF
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Aug 2021 03:04:37 +0200 (CEST)
Received: from localhost ([::1]:52798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJmll-000781-Mj
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 21:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mJmhx-0005tm-K8; Fri, 27 Aug 2021 21:00:29 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:59737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mJmhv-0004r3-Q8; Fri, 27 Aug 2021 21:00:29 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 792105C012A;
 Fri, 27 Aug 2021 21:00:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 27 Aug 2021 21:00:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=iM8WiK
 ktXoXLW4ZT2Mrqsjc0n62ZYigDOa6MRqGF/cE=; b=nwOUqFyoRrP7E8bAW3McnV
 +uK/hLSFMR6HpKlJSCEdJbFAY4IX/3cPrL8wHCnDMbjJGfJEirq86f1oKByse+IQ
 IXRxBLjRNrueU1Te71ljlPucvA40XdB5BHN47YJK3hsd1K14ctlOdvV4sbYN3bWj
 DBNZHqVZcwrmrQMkPFvkYcEunQYlCgvI/jXQ6UVrof7qvLQnKLikU/t7qrr1N1uH
 O64ef+hG357ICz7pcdWYYDNPkbUji+ohviXKKqOI72rOpdRoUv6ovulsByqwFNaX
 o+nENFpF8924/I96xymDyG6sggn3HlUTkVPhnRZetnLHe25/qzga/yMT3LFmp/dQ
 ==
X-ME-Sender: <xms:poopYUTwjAD1OeYgPdqigcA--GTQewol5yCfWqOZ8yup6F7pBftbAw>
 <xme:poopYRyBhZoZIoP1QjTe8nfuw2gl08WnD2iqJssuvrdEUVEQKmyx7hzK_xXBthPhm
 K1LMQ-_HyVDoOgx3AY>
X-ME-Received: <xmr:poopYR15BwLnnkYJln2m2njVKV3ErU9jp-KZ5tHDkysPZCN_nW2d9TrapnPN7rB7fBY1BuBAZtLHB00DXdT7NeDVDEkk3iDMXEx7fQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddugedggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepteehfffgudevgfehgeetjedvvddttefhtedtgfehleegueevieeileetfeev
 feejnecuffhomhgrihhnpegrphhplhgvrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdr
 ohhrgh
X-ME-Proxy: <xmx:poopYYALnqWHm44JE6YAaXwU3fezeGQIryTt3du_agxAa3nROo5-RQ>
 <xmx:poopYdip41j3oI16urQGe0jofddRKWW0GZcdZTtCjVWRkZQ-ztnzYQ>
 <xmx:poopYUr9jcdnt_ngHkb8jTdAOSc8U_1iQ-WImp_YR5SJ5q4qV1fjmQ>
 <xmx:qYopYSsC-WArqE7scv5z-eZOmz4XIaTfNobfBuQ5Z7-ojMc_dc2RbA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Aug 2021 21:00:19 -0400 (EDT)
Date: Sat, 28 Aug 2021 11:00:14 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [RFC 01/10] hw/mos6522: Remove get_load_time() methods and
 functions
In-Reply-To: <ee403f8a-2fde-56cd-789f-a2ab7f35eb00@ilande.co.uk>
Message-ID: <beda4286-f08d-ca6d-567f-28efa0b8b2f0@linux-m68k.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <9b78e8c6e453feab6275d04bf503051645770d85.1629799776.git.fthain@linux-m68k.org>
 <ee403f8a-2fde-56cd-789f-a2ab7f35eb00@ilande.co.uk>
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
> > This code appears to be unnecessary.
> > 
> > Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> > ---
> >   hw/misc/mos6522.c | 22 +---------------------
> >   1 file changed, 1 insertion(+), 21 deletions(-)
> > 
> > diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> > index 1c57332b40..a478c1ca43 100644
> > --- a/hw/misc/mos6522.c
> > +++ b/hw/misc/mos6522.c
> > @@ -63,17 +63,6 @@ static uint64_t get_counter_value(MOS6522State *s,
> > MOS6522Timer *ti)
> >       }
> >   }
> >   -static uint64_t get_load_time(MOS6522State *s, MOS6522Timer *ti)
> > -{
> > -    MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(s);
> > -
> > -    if (ti->index == 0) {
> > -        return mdc->get_timer1_load_time(s, ti);
> > -    } else {
> > -        return mdc->get_timer2_load_time(s, ti);
> > -    }
> > -}
> > -
> >   static unsigned int get_counter(MOS6522State *s, MOS6522Timer *ti)
> >   {
> >       int64_t d;
> > @@ -98,7 +87,7 @@ static unsigned int get_counter(MOS6522State *s,
> > MOS6522Timer *ti)
> >   static void set_counter(MOS6522State *s, MOS6522Timer *ti, unsigned int
> > val)
> >   {
> >       trace_mos6522_set_counter(1 + ti->index, val);
> > -    ti->load_time = get_load_time(s, ti);
> > +    ti->load_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> >       ti->counter_value = val;
> >       if (ti->index == 0) {
> >           mos6522_timer1_update(s, ti, ti->load_time);
> > @@ -208,13 +197,6 @@ static uint64_t mos6522_get_counter_value(MOS6522State
> > *s, MOS6522Timer *ti)
> >                       ti->frequency, NANOSECONDS_PER_SECOND);
> >   }
> >   -static uint64_t mos6522_get_load_time(MOS6522State *s, MOS6522Timer *ti)
> > -{
> > -    uint64_t load_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > -
> > -    return load_time;
> > -}
> > -
> >   static void mos6522_portA_write(MOS6522State *s)
> >   {
> >       qemu_log_mask(LOG_UNIMP, "portA_write unimplemented\n");
> > @@ -518,8 +500,6 @@ static void mos6522_class_init(ObjectClass *oc, void
> > *data)
> >       mdc->update_irq = mos6522_update_irq;
> >       mdc->get_timer1_counter_value = mos6522_get_counter_value;
> >       mdc->get_timer2_counter_value = mos6522_get_counter_value;
> > -    mdc->get_timer1_load_time = mos6522_get_load_time;
> > -    mdc->get_timer2_load_time = mos6522_get_load_time;
> >   }
> >     static const TypeInfo mos6522_type_info = {
> 
> Both the get_counter_value() and get_load_time() callbacks are used as part of
> the CUDA emulation in hw/misc/macio/cuda.c as per the comment:
> 
> /* MacOS uses timer 1 for calibration on startup, so we use
>  * the timebase frequency and cuda_get_counter_value() with
>  * cuda_get_load_time() to steer MacOS to calculate calibrate its timers
>  * correctly for both TCG and KVM (see commit b981289c49 "PPC: Cuda: Use cuda
>  * timer to expose tbfreq to guest" for more information) */
> 
> Certainly for the 6522 device it is worth configuring with
> --target-list="ppc-softmmu m68k-softmmu" to make sure that you don't
> inadvertently break anything in the PPC world.
> 

No build failure here. Maybe your tree is different?

> A bit of history here: the original mos6522.c was extracted from
> hw/misc/macio/cuda.c when Laurent presented his initial q800 patches since
> they also had their own implementation of the 6522, and it was better to move
> the implementation into a separate QEMU device so that the logic could be
> shared.
> 
> The Darwin kernel timer calibration loop is quite hard to get right: see
> https://opensource.apple.com/source/xnu/xnu-123.5/pexpert/ppc/pe_clock_speed_asm.s.auto.html
> and
> https://opensource.apple.com/source/xnu/xnu-123.5/pexpert/ppc/pe_clock_speed.c.auto.html.
> Ben/Alex came up with the current mechanism to fool the calibration routine,
> and I simply added in those callbacks to allow it to be implemented as part of
> the now-generic 6522 device.
> 

I didn't find any references to these methods (get_timer1_counter_value, 
get_timer2_counter_value, get_timer1_load_time and get_timer2_load_time).
It appears to be dead code, and it adds complexity and harms readability. 
The Linux kernel project has a policy that no code is added if it lacks 
any in-tree usage. Does QEMU have the same policy?

