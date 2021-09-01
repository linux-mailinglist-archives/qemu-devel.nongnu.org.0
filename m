Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 249653FE57C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 00:27:54 +0200 (CEST)
Received: from localhost ([::1]:50796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLYi0-0000NS-LP
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 18:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mLYgd-0007ta-Oo; Wed, 01 Sep 2021 18:26:27 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:39377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mLYgb-0004Zk-Jg; Wed, 01 Sep 2021 18:26:27 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 773353200979;
 Wed,  1 Sep 2021 18:26:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 01 Sep 2021 18:26:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-id:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=lFBFAL7ZAMLvDao8F4H1FJRdT6ZOISe4lLmtbsIo6XE=; b=W9ZtasgK
 ZD8vl30rnrYkuAlnTfrPA30mD1o8Uscz2/0n8rNrIrkFCYrJHmO+k5TWEyTrkt4R
 AEV35x/JK1y4Wjn9r3umt2nQh35y/HuZuVVUeftU8OVXrbu6xy3xuPgQiH/ycdpz
 EIAdU1AxNuJoM/Hm0c1z9cy+sDIbqWF2jOj0mD146XUiJSR5CCyEpemMcedWwiX6
 ndtwsdXl7CSUf+MZ1u+Rw4ugcJADPemdLYrlpf1HUNXxDC5nituwCr41YaixWnyO
 8HnmDQvMGUnMkJCurA30lR9OPr/9S6U5rxvHOPqwqDeAotSH8G0dojoXkidYD9O7
 T7AZGkI0Vwtntw==
X-ME-Sender: <xms:C_4vYSt0Vk-nZMTxNrRRRzCs1e09FpKX-QoD60oY6YS_2_UdClFG1g>
 <xme:C_4vYXc0yB0oTa0L726bvGClrPjyr_nGR89amoOQXU9kroBZAJZWz_LlvV7NqDefE
 tbwDupkGfS4samkc_E>
X-ME-Received: <xmr:C_4vYdyYdRSUm1VJzTcwsDk1-qRhpOVaSHCrxtliGwoDDHTD_PxKFClHwXtAkJD0oUDvRKCpG-FiyqEDMxPzn8u6AU-6n39XmHWgJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvgedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesmhdtreertddtjeenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepjeekueetleefvedtvdelfeeiffdtiedvveelvdeifeejgeeuveeugfdtfeet
 teeinecuffhomhgrihhnpeeihedtvddrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdho
 rhhg
X-ME-Proxy: <xmx:C_4vYdMpG1WBNeei-bFulnU2oZkF7pt8GB_b9junc12IZCqHh05BtA>
 <xmx:C_4vYS8l7GhUHQ3DMrWDEHpenwnGmky3HmqKPjvFOl8f0S7VYWxXwg>
 <xmx:C_4vYVWrLmDFxNgajWb6bwhKWUacr5iLxoUKPy9uN4xwLkBvC-cHCA>
 <xmx:Df4vYZZGX9ZzlHZNVhX2bNBWBNJ1C4CUJneNqclqB7GoAbW6a9btdQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 18:26:16 -0400 (EDT)
Date: Thu, 2 Sep 2021 08:26:10 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [RFC 05/10] hw/mos6522: Don't clear T1 interrupt flag on latch
 write
In-Reply-To: <8ef22032-c120-efe9-e1bc-70a91472c820@vivier.eu>
Message-ID: <c131914-bc48-81d3-9018-f395cb5d251a@linux-m68k.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <b87cf2a2841d4597cc779df5dfce500c51a172ef.1629799776.git.fthain@linux-m68k.org>
 <bd94f1e6-4f15-b4d0-ddc8-fa98e2e3d780@ilande.co.uk>
 <e18e24e4-c310-4f22-e6ac-f2d7816cdf2@linux-m68k.org>
 <8ef22032-c120-efe9-e1bc-70a91472c820@vivier.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="-1463811774-337020819-1630535067=:27"
Content-ID: <968cc48-d24b-8061-4be6-528925925581@nippy.intranet>
Received-SPF: none client-ip=64.147.123.19; envelope-from=fthain@linux-m68k.org;
 helo=wout3-smtp.messagingengine.com
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
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-337020819-1630535067=:27
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <a2b3e89e-90c3-54b6-448a-2c97c784105d@nippy.intranet>

On Wed, 1 Sep 2021, Laurent Vivier wrote:

> Le 26/08/2021 =C3=A0 07:21, Finn Thain a =C3=A9crit=C2=A0:
> > On Wed, 25 Aug 2021, Mark Cave-Ayland wrote:
> >=20
> >> On 24/08/2021 11:09, Finn Thain wrote:
> >>
> >>> The Synertek datasheet says, "A write to T1L-H loads an 8-bit count v=
alue
> >>> into the latch. A read of T1L-H transfers the contents of the latch t=
o
> >>> the data bus. Neither operation has an affect [sic] on the interrupt
> >>> flag."
> >>>
> >>> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> >>> ---
> >>>   hw/misc/mos6522.c | 1 -
> >>>   1 file changed, 1 deletion(-)
> >>>
> >>> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> >>> index c0d6bee4cc..ffff8991f4 100644
> >>> --- a/hw/misc/mos6522.c
> >>> +++ b/hw/misc/mos6522.c
> >>> @@ -313,7 +313,6 @@ void mos6522_write(void *opaque, hwaddr addr, uin=
t64_t
> >>> val, unsigned size)
> >>>           break;
> >>>       case VIA_REG_T1LH:
> >>>           s->timers[0].latch =3D (s->timers[0].latch & 0xff) | (val <=
< 8);
> >>> -        s->ifr &=3D ~T1_INT;
> >>>           break;
> >>>       case VIA_REG_T2CL:
> >>>           s->timers[1].latch =3D (s->timers[1].latch & 0xff00) | val;
> >>
> >> Hmmm. The reference document I used for QEMU's 6522 device is at
> >> http://archive.6502.org/datasheets/mos_6522_preliminary_nov_1977.pdf a=
nd
> >> according to page 6 and the section "Writing the Timer 1 Registers" wr=
iting to
> >> the high byte of the latch does indeed clear the T1 interrupt flag.
> >>
> >> Side note: there is reference in Gary Davidian's excellent CHM video t=
hat
> >> 6522s obtained from different manufacturers had different behaviours, =
and
> >> there are also web pages mentioning that 6522s integrated as part of o=
ther
> >> silicon e.g. IOSB/CUDA also had their own bugs... :/
> >>
> >=20
> > The MOS document you've cited is much older than the Synertek and Rockw=
ell=20
> > devices. The datasheets for the Synertek and Rockwell parts disagree wi=
th=20
> > MOS about T1LH behaviour. Apple certainly used SY6522 devices in my Mac=
 II=20
> > and I'd assumed Apple would have used compatible logic cores in the cus=
tom=20
> > ICs found in later models. But I don't really trust assumptions and=20
> > datasheets so I wrote the Linux patch below and ran it on my Quadra 630=
=2E
> >=20
> > diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
> > index 3d11d6219cdd..ed41f6ae2bf2 100644
> > --- a/arch/m68k/mac/via.c
> > +++ b/arch/m68k/mac/via.c
> > @@ -634,3 +634,27 @@ static u64 mac_read_clk(struct clocksource *cs)
> > =20
> >  =09return ticks;
> >  }
> > +
> > +static int baz(void)
> > +{
> > +=09u8 a, b, c;
> > +
> > +=09local_irq_disable();
> > +
> > +=09while (!(via1[vIFR] & VIA_TIMER_1_INT))
> > +=09=09continue;
> > +=09a =3D via1[vIFR] & VIA_TIMER_1_INT;
> > +=09via1[vT1LH] =3D via1[vT1LH];
> > +=09b =3D via1[vIFR] & VIA_TIMER_1_INT;
> > +=09via1[vT1LL] =3D via1[vT1LL];
> > +=09c =3D via1[vIFR] & VIA_TIMER_1_INT;
> > +
> > +=09printk("a =3D=3D %2x\n", a);
> > +=09printk("b =3D=3D %2x\n", b);
> > +=09printk("c =3D=3D %2x\n", c);
> > +
> > +=09local_irq_enable();
> > +
> > +=09return 0;
> > +}
> > +late_initcall(baz);
> >=20
> > Based on the Synertek datasheet* one would expect to see b equal to a b=
ut=20
> > I got this result instead:
> >=20
> > [   10.450000] a =3D=3D 40
> > [   10.450000] b =3D=3D  0
> > [   10.450000] c =3D=3D  0
> >=20
> > This amounts to a MOS design flaw and I doubt that this result from my=
=20
> > Quadra 630 would apply to other Mac models. So it would be great to see=
=20
> > the output from a Quadra 800. But until then, let's disregard this patc=
h.
> >=20
> > * http://archive.6502.org/datasheets/synertek_sy6522.pdf
> >=20
>=20
> Tested on my Quadra 800:
>=20
> [    4.730000] a =3D=3D 40
> [    4.730000] b =3D=3D  0
> [    4.730000] c =3D=3D  0
>=20

Much appreciated. I will drop this patch.
---1463811774-337020819-1630535067=:27--

