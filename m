Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A40DA104D06
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 09:00:10 +0100 (CET)
Received: from localhost ([::1]:37336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXhNp-000809-3x
	for lists+qemu-devel@lfdr.de; Thu, 21 Nov 2019 03:00:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51097)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iXhMo-0007Rn-U0
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 02:59:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iXhMn-0000C5-Ga
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 02:59:06 -0500
Received: from 7.mo4.mail-out.ovh.net ([178.33.253.54]:54604)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iXhMn-00006W-85
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 02:59:05 -0500
Received: from player779.ha.ovh.net (unknown [10.108.35.158])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 9CD38213D4D
 for <qemu-devel@nongnu.org>; Thu, 21 Nov 2019 08:59:02 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player779.ha.ovh.net (Postfix) with ESMTPSA id 3D164C40A34A;
 Thu, 21 Nov 2019 07:58:57 +0000 (UTC)
Date: Thu, 21 Nov 2019 08:58:56 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH for-5.0 v5 11/23] ppc/pnv: Introduce a
 pnv_xive_is_cpu_enabled() helper
Message-ID: <20191121085856.0344fac5@bahia.lan>
In-Reply-To: <4549a66b-5db6-5a71-87a2-3c126fa4db6b@kaod.org>
References: <20191115162436.30548-1-clg@kaod.org>
 <20191115162436.30548-12-clg@kaod.org>
 <20191120182612.3069e279@bahia.lan>
 <4549a66b-5db6-5a71-87a2-3c126fa4db6b@kaod.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 4883309374785624459
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudehuddguddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjqdffgfeufgfipdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjeelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.33.253.54
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Nov 2019 22:40:31 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 20/11/2019 18:26, Greg Kurz wrote:
> > On Fri, 15 Nov 2019 17:24:24 +0100
> > C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >=20
> >> and use this helper to exclude CPUs which are not enabled in the XIVE
> >> controller.
> >>
> >> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >> ---
> >>  hw/intc/pnv_xive.c | 18 ++++++++++++++++++
> >>  1 file changed, 18 insertions(+)
> >>
> >> diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
> >> index 71ca4961b6b1..4c8c6e51c20f 100644
> >> --- a/hw/intc/pnv_xive.c
> >> +++ b/hw/intc/pnv_xive.c
> >> @@ -372,6 +372,20 @@ static int pnv_xive_get_eas(XiveRouter *xrtr, uin=
t8_t blk, uint32_t idx,
> >>      return pnv_xive_vst_read(xive, VST_TSEL_IVT, blk, idx, eas);
> >>  }
> >> =20
> >> +static int cpu_pir(PowerPCCPU *cpu)
> >> +{
> >> +    CPUPPCState *env =3D &cpu->env;
> >> +    return env->spr_cb[SPR_PIR].default_value;
> >> +}
> >> +
> >> +static bool pnv_xive_is_cpu_enabled(PnvXive *xive, PowerPCCPU *cpu)
> >> +{
> >> +    int pir =3D cpu_pir(cpu);
> >> +    int thrd_id =3D pir & 0x7f;
> >> +
> >> +    return xive->regs[PC_THREAD_EN_REG0 >> 3] & PPC_BIT(thrd_id);
> >=20
> > A similar check is open-coded in pnv_xive_get_indirect_tctx() :
> >=20
> >     /* Check that HW thread is XIVE enabled */
> >     if (!(xive->regs[PC_THREAD_EN_REG0 >> 3] & PPC_BIT(pir & 0x3f))) {
> >         xive_error(xive, "IC: CPU %x is not enabled", pir);
> >     }
> >=20
> > The thread id is only the 6 lower bits of the PIR there, and so seems to
> > indicate the skiboot sources:
> >=20
> >         /* Get bit in register */
> >         bit =3D c->pir & 0x3f;
>=20
> skiboot uses 0x3f when enabling the TCTXT of a CPU because register
> INT_TCTXT_EN0 covers cores 0-15 (normal) and 0-7 (fused) and=20
> register INT_TCTXT_EN1 covers cores 16-23 (normal) and 8-11 (fused).=20
> The encoding in the registers is a bit different.
>=20
> > Why make it pir & 0x7f here ?=20
>=20
> See pnv_chip_core_pir_p9 comments for some details on the CPU ID=20
> layout.
>=20

*   57:61  Core number
*   62:63  Thread ID

Ok, so the CPU ID within the socket is 7 bits, ie. pir & 0x7f

> > If it should actually be 0x3f,=20
> but yes, we should fix the mask in the register setting.=20
>=20
> > maybe also use the helper in pnv_xive_get_indirect_tctx().
>=20
> This is getting changed later on. So I rather not.
>=20

I don't see any later change there, neither in this series, nor
in your powernv-4.2 on github, but nevermind, this patch is
good enough for the purpose of CAM line matching.

Reviewed-by: Greg Kurz <groug@kaod.org>

> C.
>=20
> >=20
> >> +}
> >> +
> >>  static int pnv_xive_match_nvt(XivePresenter *xptr, uint8_t format,
> >>                                uint8_t nvt_blk, uint32_t nvt_idx,
> >>                                bool cam_ignore, uint8_t priority,
> >> @@ -393,6 +407,10 @@ static int pnv_xive_match_nvt(XivePresenter *xptr=
, uint8_t format,
> >>              XiveTCTX *tctx;
> >>              int ring;
> >> =20
> >> +            if (!pnv_xive_is_cpu_enabled(xive, cpu)) {
> >> +                continue;
> >> +            }
> >> +
> >>              tctx =3D XIVE_TCTX(pnv_cpu_state(cpu)->intc);
> >> =20
> >>              /*
> >=20
>=20


