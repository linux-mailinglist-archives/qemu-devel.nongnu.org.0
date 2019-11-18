Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFE6100A33
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 18:27:11 +0100 (CET)
Received: from localhost ([::1]:37500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWknu-0005dN-SK
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 12:27:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56989)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iWkmt-0004np-Uo
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 12:26:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iWkms-0005jP-Jk
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 12:26:07 -0500
Received: from 7.mo2.mail-out.ovh.net ([188.165.48.182]:37218)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iWkms-0005j3-Co
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 12:26:06 -0500
Received: from player774.ha.ovh.net (unknown [10.109.143.209])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 1C0E21B1BA0
 for <qemu-devel@nongnu.org>; Mon, 18 Nov 2019 18:26:03 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player774.ha.ovh.net (Postfix) with ESMTPSA id 97517C3DD884;
 Mon, 18 Nov 2019 17:25:59 +0000 (UTC)
Date: Mon, 18 Nov 2019 18:25:57 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH for-5.0] xive/kvm: Trigger interrupts from userspace
Message-ID: <20191118182557.22d21f06@bahia.lan>
In-Reply-To: <f81b87b2-c6c9-9c12-2929-adbb341cd391@kaod.org>
References: <157408992731.494439.3405812941731584740.stgit@bahia.lan>
 <f81b87b2-c6c9-9c12-2929-adbb341cd391@kaod.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 15288313360058325387
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudegiedgjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeejgedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 188.165.48.182
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

On Mon, 18 Nov 2019 16:37:16 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 18/11/2019 16:12, Greg Kurz wrote:
> > When using the XIVE KVM device, the trigger page is directly accessible
> > in QEMU. Unlike with XICS, no need to ask KVM to fire the interrupt. A
> > simple store on the trigger page does the job.
> >=20
> > Just call xive_esb_trigger().
>=20
> Yes but the KVM XIVE device does a few other checks.=20
>=20
> It checks that the interrupt was correctly initialized at the KVM device
> level. We should be fine in QEMU which has similar checks.
>=20

Yeah, not sure we can do much more than to trust the QEMU irq code to
pass us a valid srcno.

> It caches the LSI assertion level. We should be fine also because it is
> useless in KVM when using the XIVE native exploitation mode.
>=20

Yeah, I see it is set in kvmppc_xive_native_set_source() (why?) but never
used anywhere else in book3s_xive_native.c.

> It checks it is not a passthru interrupt. Any idea on how to check this=20
> condition under QEMU ?=20
>=20

AFAICT passthru interrupts don't go through here either.
=20
> > This may improve performance of emulated devices that go through
> > qemu_set_irq(), eg. virtio devices created with ioeventfd=3Doff or
> > configured by the guest to use LSI interrupts, which aren't really
> > recommended setups.
>=20
> LGTM.
>=20
> Any figures to share ?=20
>=20

No. Since performance critical setups don't go through that path,
I didn't try too much.

> C.
>=20
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  hw/intc/spapr_xive_kvm.c |   16 ++--------------
> >  1 file changed, 2 insertions(+), 14 deletions(-)
> >=20
> > diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
> > index 08012ac7cd76..69e73552f1ef 100644
> > --- a/hw/intc/spapr_xive_kvm.c
> > +++ b/hw/intc/spapr_xive_kvm.c
> > @@ -354,32 +354,20 @@ static void kvmppc_xive_source_get_state(XiveSour=
ce *xsrc)
> >  void kvmppc_xive_source_set_irq(void *opaque, int srcno, int val)
> >  {
> >      XiveSource *xsrc =3D opaque;
> > -    SpaprXive *xive =3D SPAPR_XIVE(xsrc->xive);
> > -    struct kvm_irq_level args;
> > -    int rc;
> > -
> > -    /* The KVM XIVE device should be in use */
> > -    assert(xive->fd !=3D -1);
> > =20
> > -    args.irq =3D srcno;
> >      if (!xive_source_irq_is_lsi(xsrc, srcno)) {
> >          if (!val) {
> >              return;
> >          }
> > -        args.level =3D KVM_INTERRUPT_SET;
> >      } else {
> >          if (val) {
> >              xsrc->status[srcno] |=3D XIVE_STATUS_ASSERTED;
> > -            args.level =3D KVM_INTERRUPT_SET_LEVEL;
> >          } else {
> >              xsrc->status[srcno] &=3D ~XIVE_STATUS_ASSERTED;
> > -            args.level =3D KVM_INTERRUPT_UNSET;
> >          }
> >      }
> > -    rc =3D kvm_vm_ioctl(kvm_state, KVM_IRQ_LINE, &args);
> > -    if (rc < 0) {
> > -        error_report("XIVE: kvm_irq_line() failed : %s", strerror(errn=
o));
> > -    }
> > +
> > +    xive_esb_trigger(xsrc, srcno);
> >  }
>=20
>=20


