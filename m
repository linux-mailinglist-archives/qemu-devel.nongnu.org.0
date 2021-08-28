Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F183FA2C6
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Aug 2021 03:23:43 +0200 (CEST)
Received: from localhost ([::1]:56634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJn4Q-00026y-ID
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 21:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mJn3d-0001JE-Dp; Fri, 27 Aug 2021 21:22:53 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:55309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mJn3b-0002aA-OI; Fri, 27 Aug 2021 21:22:53 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id EF2A15C0118;
 Fri, 27 Aug 2021 21:22:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 27 Aug 2021 21:22:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-id:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=6PN4PGA+jO+/HGVsow+mRqHKZ12IcuEw+eRm/8dXXeQ=; b=ena9VjkY
 NK3ip5IvlU+ZdOpPdduiGpPaVVOhwR98sXmINTA4oMiRtPlsNXsyxoMq5mQXqkCD
 +eP4vwbixRKbPOgzFwOgZrbnaBi9b8eT3QuNpfvLQcuAVjR7NeIK6ret2n0fif1H
 dCkxPyVQKlOfsrt8ejH7coRayavbwobiexkdeDMi5i5eaTDd8MZCRwA0I3XrSXWu
 9/rPXELbfYeBczrKxB522cphrVBXLXAMao7CGtbuff8ZCc2xAvLt6mxBKyUBjZoc
 1W7D+Ek6MeHjDErF+IJwF6jVzz9nS/YnoPst8e1LrmAoQkDaQSSNM8VOxos8ww1p
 90Ei+6S2RiZZYQ==
X-ME-Sender: <xms:5o8pYeNMEicl2OeScR44jAZAjFSXpYfsg5l2jXx226TfK8wQMG9nQQ>
 <xme:5o8pYc_KGBcEOZb6bqMGEuKXcRRXJKADs9DGv2LMgz1_RgDcGiFbAmgoOYv-KeovF
 ibsfnk7ujLofTp-gSg>
X-ME-Received: <xmr:5o8pYVSs-IscV_PG_zP05S_9czsJdHcPuOkwF8TUJ21iSOm3OU4PLFML7Nbd-idEivWQBodMbc9_YH7pYsxfM5a59AWkY4TXdwtXGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddugedggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesmhdtreertddtjeenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepfeffjeeigfehveehfeevhfetgefgieejieeviefhffffudfgfeekleffhffg
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
 hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:5o8pYetDCP6PENodTm6jDTqyc8APvFsFtAA4Ljlc8-e1_UxFLH-5xw>
 <xmx:5o8pYWfRcTlw4KTqs8A119KktvSdQHjbg0kpmc40h3ftQHvWQpp7jg>
 <xmx:5o8pYS1Pc5WVbdlV9E0GDO3tmn7kY1iqWt8XOWz830uf5-LGUolVnA>
 <xmx:6I8pYTFhw5M_9gTR_LHX284NQWW7Cywh_If9bEq61kZPrwfz-UJrbQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Aug 2021 21:22:43 -0400 (EDT)
Date: Sat, 28 Aug 2021 11:22:37 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC 00/10] hw/mos6522: VIA timer emulation fixes and improvements
In-Reply-To: <283af572-2157-77c6-2594-8e9e92497346@amsat.org>
Message-ID: <fb42cb6-117c-c138-c18a-3af7f1d9be6a@linux-m68k.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <283af572-2157-77c6-2594-8e9e92497346@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="-1463811774-1446952128-1629974846=:34"
Content-ID: <d52a3024-43c8-1039-fa2-ab9ca1b80de@nippy.intranet>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-1446952128-1629974846=:34
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <9db37747-5fc8-154b-447d-c8b5ba992090@nippy.intranet>

On Tue, 24 Aug 2021, Philippe Mathieu-Daud=C3=A9 wrote:

> On 8/24/21 12:09 PM, Finn Thain wrote:
>=20
> > On a real Quadra, accesses to the SY6522 chips are slow because they ar=
e=20
> > synchronous with the 783360 Hz "phase 2" clock. In QEMU, they are slow=
=20
> > only because of the division operation in the timer count calculation.
> >=20
> > This patch series improves the fidelity of the emulated chip, but the=
=20
> > price is more division ops. I haven't tried to measure this yet.
> >=20
> > The emulated 6522 still deviates from the behaviour of the real thing,=
=20
> > however. For example, two consecutive accesses to a real 6522 timer=20
> > counter can never yield the same value. This is not true of the 6522 in=
=20
> > QEMU 6 wherein two consecutive accesses to a timer count register have=
=20
> > been observed to yield the same value.
> >=20
> > Linux is not particularly robust in the face of a 6522 that deviates=20
> > from the usual behaviour. The problem presently affecting a Linux guest=
=20
> > is that its 'via' clocksource is prone to monotonicity failure. That is=
,=20
> > the clocksource counter can jump backwards. This can be observed by=20
> > patching Linux like so:
> >=20
> > diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
> > --- a/arch/m68k/mac/via.c
> > +++ b/arch/m68k/mac/via.c
> > @@ -606,6 +606,8 @@ void __init via_init_clock(void)
> >  =09clocksource_register_hz(&mac_clk, VIA_CLOCK_FREQ);
> >  }
> > =20
> > +static u32 prev_ticks;
> > +
> >  static u64 mac_read_clk(struct clocksource *cs)
> >  {
> >  =09unsigned long flags;
> > @@ -631,6 +633,8 @@ static u64 mac_read_clk(struct clocksource *cs)
> >  =09count =3D count_high << 8;
> >  =09ticks =3D VIA_TIMER_CYCLES - count;
> >  =09ticks +=3D clk_offset + clk_total;
> > +if (ticks < prev_ticks) pr_warn("%s: %u < %u\n", __func__, ticks, prev=
_ticks);
> > +prev_ticks =3D ticks;
> >  =09local_irq_restore(flags);
> > =20
> >  =09return ticks;
> >=20
> > This problem can be partly blamed on a 6522 design limitation, which is=
=20
> > that the timer counter has no overflow register. Hence, if a timer=20
> > counter wraps around and the kernel is late to handle the subsequent=20
> > interrupt, the kernel can't account for any missed ticks.
> >=20
> > On a real Quadra, the kernel mitigates this limitation by minimizing=20
> > interrupt latency. But on QEMU, interrupt latency is unbounded. This=20
> > can't be mitigated by the guest kernel at all and leads to clock drift.=
=20
> > This can be observed by patching QEMU like so:
> >=20
> > diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> > --- a/hw/misc/mos6522.c
> > +++ b/hw/misc/mos6522.c
> > @@ -379,6 +379,12 @@ void mos6522_write(void *opaque, hwaddr addr, uint=
64_t val, unsigned size)
> >          s->pcr =3D val;
> >          break;
> >      case VIA_REG_IFR:
> > +        if (val & T1_INT) {
> > +            static int64_t last_t1_int_cleared;
> > +            int64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +            if (now - last_t1_int_cleared > 20000000) printf("\t%s: t1=
 int clear is late\n", __func__);
> > +            last_t1_int_cleared =3D now;
> > +        }
> >          /* reset bits */
> >          s->ifr &=3D ~val;
> >          mos6522_update_irq(s);
> >=20
> > This logic asserts that, given that Linux/m68k sets CONFIG_HZ to 100,=
=20
> > the emulator will theoretically see each timer 1 interrupt cleared=20
> > within 20 ms of the previous one. But that deadline is often missed on=
=20
> > my QEMU host [4].
>=20
> I wonder if using QEMU ptimer wouldn't help here, instead of
> calling qemu_clock_get_ns() and doing the math by hand:
>=20
> /* Starting to run with/setting counter to "0" won't trigger immediately,
>  * but after a one period for both oneshot and periodic modes.  */
> #define PTIMER_POLICY_NO_IMMEDIATE_TRIGGER  (1 << 2)
>=20
> /* Starting to run with/setting counter to "0" won't re-load counter
>  * immediately, but after a one period.  */
> #define PTIMER_POLICY_NO_IMMEDIATE_RELOAD   (1 << 3)
>=20
> /* Make counter value of the running timer represent the actual value and
>  * not the one less.  */
> #define PTIMER_POLICY_NO_COUNTER_ROUND_DOWN (1 << 4)
>=20

It's often the case that a conversion to a new API is trivial for someone=
=20
who understands that API. But I still haven't got my head around the=20
implementation (hw/core/ptimer.c).

So I agree the ptimer API could simplify mos6522.c but adopting it is not=
=20
trivial for me.

QEMU's 6522 device does not attempt to model the relationship between the=
=20
"phase two" clock and timer counters and timer interrupts. I haven't=20
attempted to fix these deviations at all, as that's not trivial either.

But using the ptimer API could potentially make it easier to address those=
=20
fidelity issues.
---1463811774-1446952128-1629974846=:34--

