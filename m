Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 148093FA292
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Aug 2021 02:48:43 +0200 (CEST)
Received: from localhost ([::1]:49304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJmWS-0003z3-Lg
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 20:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mJmUV-0003JR-MV; Fri, 27 Aug 2021 20:46:35 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:59899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mJmUT-00044x-OU; Fri, 27 Aug 2021 20:46:35 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id E88F65C00D6;
 Fri, 27 Aug 2021 20:46:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 27 Aug 2021 20:46:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ijogH1
 ZPsNoeQRumMw6phMVHhhmlNC+6ocOLzlFLzdQ=; b=IhVAVJ+yqANTj1m/B9gegp
 nGRpOPLOkm8E1Op6AQvpVWvDjy0MjwjlRG+xGR1gKkhHIV4SErA+kNic/07QwMan
 03QAtLuV2Mba2DjDXd5ecyu5RS7t//1ZXGHpU0GNc9LQy6Md0Dp/9Hk0C+JEogvs
 6EcF1LeHlpGaaAJcTwrlriljhkHKKRJpTpWwXnIMINZ5XJkdqx3BZuQRB/ZEyJKI
 NHq9EPK2Bph97v/i6Sqn+ovnBMVVLmd+eJQkenuGmMiiPyzdAKuml7tKKgjRYlmt
 tezMEvEhQqfmmD0PRAtoTOoZf0BQu0nN9PbKv21tPyl9Dn8+nJ9FtpdsC12XO0EQ
 ==
X-ME-Sender: <xms:Y4cpYdW0FPoegQ9ETv6SnKNVsufmzdKx8XKNmBEMxpSb3t3kAk0_SQ>
 <xme:Y4cpYdl4mscC4iPxtSfDs0DK8eo6WKpoBNzKPwhI3F0iyKFev2U5GJA-_KvMI2lPN
 vjYvfLpzEDHsCrAhL8>
X-ME-Received: <xmr:Y4cpYZbCxFI0bDQuBY_sEoTlHVF2alMMFnx0TixXSWl3z-tFKP03ul42x6s7yYuqLOit6uVcq2KNcAr2D6RSqHOSvfQOgsuKxMdAZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddugedgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepiedvieetledvleevvdeiffetieekfffhleetjeeijeelffejudduteeihfff
 kedtnecuffhomhgrihhnpeeihedtvddrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdho
 rhhg
X-ME-Proxy: <xmx:Y4cpYQUKxb-dRbky2PQjXwLSoslnwKD84q10UzThxNsELlThRiwVTQ>
 <xmx:Y4cpYXmGxXwNDLC3f_JTMDB7d3YNiwLk-isb6HR4xstBtj35Ti-L9g>
 <xmx:Y4cpYdeTXf3a4vfgQIXDJdp9eSS56StdWYXfsEmE7wv1e7vaMtN7Wg>
 <xmx:ZYcpYVj9nZTTfFLoSijeyKiodGT480d29OjMVv85bVjyz4DsVRQTHA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Aug 2021 20:46:24 -0400 (EDT)
Date: Sat, 28 Aug 2021 10:46:10 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [RFC 07/10] hw/mos6522: Fix initial timer counter reload
In-Reply-To: <a0042d81-d7ed-ddd1-cf40-254c63ef4843@ilande.co.uk>
Message-ID: <4721eb37-afb5-a55-35cd-f4d585a6c5f1@linux-m68k.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <ae3528be683e131503ea272847a4490d505739ca.1629799776.git.fthain@linux-m68k.org>
 <a0042d81-d7ed-ddd1-cf40-254c63ef4843@ilande.co.uk>
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
> > The first reload of timer 1 is early by half of a clock cycle as it gets
> > measured from a falling edge. By contrast, the succeeding reloads are
> > measured from rising edge to rising edge.
> > 
> > Neglecting that complication, the behaviour of the counter should be the
> > same from one reload to the next. The sequence is always:
> > 
> > N, N-1, N-2, ... 2, 1, 0, -1, N, N-1, N-2, ...
> > 
> > But at the first reload, the present driver does this instead:
> > 
> > N, N-1, N-2, ... 2, 1, 0, -1, N-1, N-2, ...
> > 
> > Fix this deviation for both timer 1 and timer 2, and allow for the fact
> > that on a real 6522 the timer 2 counter is not reloaded when it wraps.
> > 
> > Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> > ---
> >   hw/misc/mos6522.c | 19 +++++++++++--------
> >   1 file changed, 11 insertions(+), 8 deletions(-)
> > 
> > diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> > index 5b1657ac0d..0a241fe9f8 100644
> > --- a/hw/misc/mos6522.c
> > +++ b/hw/misc/mos6522.c
> > @@ -63,15 +63,16 @@ static unsigned int get_counter(MOS6522State *s,
> > MOS6522Timer *ti)
> >       if (ti->index == 0) {
> >           /* the timer goes down from latch to -1 (period of latch + 2) */
> >           if (d <= (ti->counter_value + 1)) {
> > -            counter = (ti->counter_value - d) & 0xffff;
> > +            counter = ti->counter_value - d;
> >           } else {
> > -            counter = (d - (ti->counter_value + 1)) % (ti->latch + 2);
> > -            counter = (ti->latch - counter) & 0xffff;
> > +            int64_t d_post_reload = d - (ti->counter_value + 2);
> > +            /* XXX this calculation assumes that ti->latch has not changed
> > */
> > +            counter = ti->latch - (d_post_reload % (ti->latch + 2));
> >           }
> >       } else {
> > -        counter = (ti->counter_value - d) & 0xffff;
> > +        counter = ti->counter_value - d;
> >       }
> > -    return counter;
> > +    return counter & 0xffff;
> >   }
> >     static void set_counter(MOS6522State *s, MOS6522Timer *ti, unsigned int
> > val)
> > @@ -103,11 +104,13 @@ static int64_t get_next_irq_time(MOS6522State *s,
> > MOS6522Timer *ti,
> >         /* the timer goes down from latch to -1 (period of latch + 2) */
> >       if (d <= (ti->counter_value + 1)) {
> > -        counter = (ti->counter_value - d) & 0xffff;
> > +        counter = ti->counter_value - d;
> >       } else {
> > -        counter = (d - (ti->counter_value + 1)) % (ti->latch + 2);
> > -        counter = (ti->latch - counter) & 0xffff;
> > +        int64_t d_post_reload = d - (ti->counter_value + 2);
> > +        /* XXX this calculation assumes that ti->latch has not changed */
> > +        counter = ti->latch - (d_post_reload % (ti->latch + 2));
> >       }
> > +    counter &= 0xffff;
> >         /* Note: we consider the irq is raised on 0 */
> >       if (counter == 0xffff) {
> 
> I think the code looks right, but I couldn't see an explicit reference to this
> behaviour in
> http://archive.6502.org/datasheets/mos_6522_preliminary_nov_1977.pdf.

Yes, that datasheet is missing a lot of information.

> Presumably this matches what you've observed on real hardware?
> 

Yes.

