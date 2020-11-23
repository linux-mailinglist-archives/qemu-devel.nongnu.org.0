Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7FE2C0230
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 10:22:13 +0100 (CET)
Received: from localhost ([::1]:38510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh832-0003YW-C6
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 04:22:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kh81L-0002iP-3t
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 04:20:27 -0500
Received: from 7.mo51.mail-out.ovh.net ([46.105.33.25]:34687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kh81I-00086s-4E
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 04:20:26 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.128])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 3AA652389B7;
 Mon, 23 Nov 2020 10:20:18 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 23 Nov
 2020 10:20:18 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00311ce8fbb-6485-439a-a09e-0d344257bd0b,
 7563B3C8582C4E5C569F12427BEE2CF3FAD9DE82) smtp.auth=groug@kaod.org
Date: Mon, 23 Nov 2020 10:20:17 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH for-6.0 3/8] spapr/xive: Add "nr-servers" property
Message-ID: <20201123102017.1f0d20d7@bahia.lan>
In-Reply-To: <20201123035214.GC521467@yekko.fritz.box>
References: <20201120174646.619395-1-groug@kaod.org>
 <20201120174646.619395-4-groug@kaod.org>
 <20201123035214.GC521467@yekko.fritz.box>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/h7.A+.7Tnvvgz9QMES..UCO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 462e9ab6-6052-4ec8-b259-9657b835e350
X-Ovh-Tracer-Id: 9138366595517946336
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegiedgtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtihesghdtreerredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheplefggfefueegudegkeevieevveejfffhuddvgeffteekieevueefgfeltdfgieetnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.33.25; envelope-from=groug@kaod.org;
 helo=7.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/h7.A+.7Tnvvgz9QMES..UCO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 23 Nov 2020 14:52:14 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Fri, Nov 20, 2020 at 06:46:41PM +0100, Greg Kurz wrote:
> > The sPAPR XIVE object has an "nr-ends" property that is used
> > to size the END table. This property is set by the machine
> > code to a value derived from spapr_max_server_number().
> >=20
> > spapr_max_server_number() is also used to inform the KVM XIVE
> > device about the range of vCPU ids it might be exposed to,
> > in order to optimize resource allocation in the HW.
> >=20
> > This is enough motivation to introduce an "nr-servers" property
> > and to use it for both purposes. The existing "nr-ends" property
> > is now longer used. It is kept around though because it is exposed
> > to -global. It will continue to be ignored as before without
> > causing QEMU to exit.
>=20
> I'm a little dubious about keeping the property around.  It's
> technically a breaking change to remove it, but since IIUC, it's
> *never* had any effect, it seems implausible anyone out there's using
> it.
>=20

Likely. BTW, I find a bit odd that these properties are silently
ignored.

> Can we at least put it straight into the deprecation document?
>=20

Yes we can initiate a formal deprecation. This would allow us
to drop the property in QEMU 6.2. We usually also print out
a warning so that users are aware of the upcoming removal.

I'll look into it.

> > The associated nr_ends field cannot be dropped from SpaprXive
> > because it is explicitly used by vmstate_spapr_xive(). It is
> > thus renamed to nr_ends_vmstate.
> >=20
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  include/hw/ppc/spapr_xive.h | 16 +++++++++++++++-
> >  hw/intc/spapr_xive.c        | 28 ++++++++++++++++++++++------
> >  hw/ppc/spapr_irq.c          |  6 +-----
> >  3 files changed, 38 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
> > index 4b967f13c030..7123ea07ed78 100644
> > --- a/include/hw/ppc/spapr_xive.h
> > +++ b/include/hw/ppc/spapr_xive.h
> > @@ -23,6 +23,16 @@
> >  typedef struct SpaprXive {
> >      XiveRouter    parent;
> > =20
> > +    /*
> > +     * The XIVE device needs to know the highest vCPU id it might
> > +     * be exposed to in order to size the END table. It may also
> > +     * propagate the value to the KVM XIVE device in order to
> > +     * optimize resource allocation in the HW.
> > +     * This must be set to a non-null value using the "nr-servers"
> > +     * property, before realizing the device.
> > +     */
> > +    uint32_t      nr_servers;
> > +
> >      /* Internal interrupt source for IPIs and virtual devices */
> >      XiveSource    source;
> >      hwaddr        vc_base;
> > @@ -38,7 +48,11 @@ typedef struct SpaprXive {
> >      XiveEAS       *eat;
> >      uint32_t      nr_irqs;
> >      XiveEND       *endt;
> > -    uint32_t      nr_ends;
> > +    /*
> > +     * This is derived from nr_servers but it must be kept around beca=
use
> > +     * vmstate_spapr_xive uses it.
> > +     */
> > +    uint32_t      nr_ends_vmstate;
> > =20
> >      /* TIMA mapping address */
> >      hwaddr        tm_base;
> > diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> > index f473ad9cba47..e4dbf9c2c409 100644
> > --- a/hw/intc/spapr_xive.c
> > +++ b/hw/intc/spapr_xive.c
> > @@ -99,6 +99,12 @@ int spapr_xive_end_to_target(uint8_t end_blk, uint32=
_t end_idx,
> >      return 0;
> >  }
> > =20
> > +/*
> > + * 8 XIVE END structures per CPU. One for each available
> > + * priority
> > + */
> > +#define spapr_xive_cpu_end_idx(vcpu, prio) (((vcpu) << 3) + prio)
> > +
> >  static void spapr_xive_cpu_to_end(PowerPCCPU *cpu, uint8_t prio,
> >                                    uint8_t *out_end_blk, uint32_t *out_=
end_idx)
> >  {
> > @@ -109,7 +115,7 @@ static void spapr_xive_cpu_to_end(PowerPCCPU *cpu, =
uint8_t prio,
> >      }
> > =20
> >      if (out_end_idx) {
> > -        *out_end_idx =3D (cpu->vcpu_id << 3) + prio;
> > +        *out_end_idx =3D spapr_xive_cpu_end_idx(cpu->vcpu_id, prio);
> >      }
> >  }
> > =20
> > @@ -290,7 +296,8 @@ static void spapr_xive_instance_init(Object *obj)
> > =20
> >  uint32_t spapr_xive_nr_ends(const SpaprXive *xive)
> >  {
> > -    return xive->nr_ends;
> > +    g_assert(xive->nr_servers);
> > +    return spapr_xive_cpu_end_idx(xive->nr_servers, 0);
> >  }
> > =20
> >  static void spapr_xive_realize(DeviceState *dev, Error **errp)
> > @@ -303,7 +310,7 @@ static void spapr_xive_realize(DeviceState *dev, Er=
ror **errp)
> > =20
> >      /* Set by spapr_irq_init() */
> >      g_assert(xive->nr_irqs);
> > -    g_assert(xive->nr_ends);
> > +    g_assert(xive->nr_servers);
> > =20
> >      sxc->parent_realize(dev, &local_err);
> >      if (local_err) {
> > @@ -360,6 +367,8 @@ static void spapr_xive_realize(DeviceState *dev, Er=
ror **errp)
> >      sysbus_mmio_map(SYS_BUS_DEVICE(xive), 0, xive->vc_base);
> >      sysbus_mmio_map(SYS_BUS_DEVICE(xive), 1, xive->end_base);
> >      sysbus_mmio_map(SYS_BUS_DEVICE(xive), 2, xive->tm_base);
> > +
> > +    xive->nr_ends_vmstate =3D spapr_xive_nr_ends(xive);
> >  }
> > =20
> >  static int spapr_xive_get_eas(XiveRouter *xrtr, uint8_t eas_blk,
> > @@ -547,7 +556,7 @@ static const VMStateDescription vmstate_spapr_xive =
=3D {
> >          VMSTATE_UINT32_EQUAL(nr_irqs, SpaprXive, NULL),
> >          VMSTATE_STRUCT_VARRAY_POINTER_UINT32(eat, SpaprXive, nr_irqs,
> >                                       vmstate_spapr_xive_eas, XiveEAS),
> > -        VMSTATE_STRUCT_VARRAY_POINTER_UINT32(endt, SpaprXive, nr_ends,
> > +        VMSTATE_STRUCT_VARRAY_POINTER_UINT32(endt, SpaprXive, nr_ends_=
vmstate,
> >                                               vmstate_spapr_xive_end, X=
iveEND),
> >          VMSTATE_END_OF_LIST()
> >      },
> > @@ -591,7 +600,14 @@ static void spapr_xive_free_irq(SpaprInterruptCont=
roller *intc, int lisn)
> > =20
> >  static Property spapr_xive_properties[] =3D {
> >      DEFINE_PROP_UINT32("nr-irqs", SpaprXive, nr_irqs, 0),
> > -    DEFINE_PROP_UINT32("nr-ends", SpaprXive, nr_ends, 0),
> > +    /*
> > +     * "nr-ends" is deprecated by "nr-servers" since QEMU 6.0.
> > +     * It is just kept around because it is exposed to the user
> > +     * through -global and we don't want it to fail, even if
> > +     * the value is actually overridden internally.
> > +     */
> > +    DEFINE_PROP_UINT32("nr-ends", SpaprXive, nr_ends_vmstate, 0),
> > +    DEFINE_PROP_UINT32("nr-servers", SpaprXive, nr_servers, 0),
> >      DEFINE_PROP_UINT64("vc-base", SpaprXive, vc_base, SPAPR_XIVE_VC_BA=
SE),
> >      DEFINE_PROP_UINT64("tm-base", SpaprXive, tm_base, SPAPR_XIVE_TM_BA=
SE),
> >      DEFINE_PROP_UINT8("hv-prio", SpaprXive, hv_prio, 7),
> > @@ -742,7 +758,7 @@ static int spapr_xive_activate(SpaprInterruptContro=
ller *intc,
> >      SpaprXive *xive =3D SPAPR_XIVE(intc);
> > =20
> >      if (kvm_enabled()) {
> > -        int rc =3D spapr_irq_init_kvm(kvmppc_xive_connect, intc, nr_se=
rvers,
> > +        int rc =3D spapr_irq_init_kvm(kvmppc_xive_connect, intc, xive-=
>nr_servers,
>=20
> Hmm.  So we're now ignoring the 'nr_servers' parameter to this
> function, which doesn't seem right.  Should we be assert()ing that
> it's equal to xive->nr_servers?
>=20
> >                                      errp);
> >          if (rc < 0) {
> >              return rc;
> > diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
> > index f59960339ec3..8c5627225636 100644
> > --- a/hw/ppc/spapr_irq.c
> > +++ b/hw/ppc/spapr_irq.c
> > @@ -330,11 +330,7 @@ void spapr_irq_init(SpaprMachineState *spapr, Erro=
r **errp)
> > =20
> >          dev =3D qdev_new(TYPE_SPAPR_XIVE);
> >          qdev_prop_set_uint32(dev, "nr-irqs", smc->nr_xirqs + SPAPR_XIR=
Q_BASE);
> > -        /*
> > -         * 8 XIVE END structures per CPU. One for each available
> > -         * priority
> > -         */
> > -        qdev_prop_set_uint32(dev, "nr-ends", nr_servers << 3);
> > +        qdev_prop_set_uint32(dev, "nr-servers", nr_servers);
> >          object_property_set_link(OBJECT(dev), "xive-fabric", OBJECT(sp=
apr),
> >                                   &error_abort);
> >          sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>=20


--Sig_/h7.A+.7Tnvvgz9QMES..UCO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAl+7ftEACgkQcdTV5YIv
c9b8sg/+PRYKyq5WKCZfYsqM7vf20fHG6LhXm/2ibqGTy3l33BttpaxNw4rf+aUf
c7Ehu33MRIod3tDJYi1mqxhsPWTA3GriukRutts6ROmHycVBzdiJqIE1Ppxo1izH
h3007CcAyxkH0ZbENKmA9E/maeIU4cQYWaKfJGK0y5YWnzLdfrsMcWCDkQWA2xqF
QzTl6jRvuC7SFkce3uQZufHKijNkh65vX86CPuwlNOUF1utF2FuNglrlIYao/xcP
b48sIPCIn5b8JmRSEa8sB5iJb9+l0pv7nRLlXuEzjLynbM/GtLq7wqEcVLbzjr3i
OFG1v2Rh+3L7lzwccWaEo8Dk+U07Wk8/uEhtXcb+J/8DkBGYrLVmLFZ609Etc3H0
4j71wcch3ImkMTHr8ASPDHscCju2SyoTay1qdeQaNUQB2ClUB9kLxY7LfxFt1QC9
kEsgB/GCN3xzECjk7Tz2RrEdFmoFPJdD3Bi1SkZ04xp07Scn8m2lN8FoHyUgThi5
FQPUOIZ/bV94HTmI1LdJmBsA9ybcarMckj185tm9QTZMDFMPRjYK30Mhat8okk7r
BH7QtL3CO5esQp4oTeIWo1blt6GH8ub0a2GfsJVGQb021ZzQl0xW6PuADftLy+kN
klwBbnqD5OQwRwvwx+21GDBMb6QKIT+LKS3ns9uiMjVQpMGu5Z8=
=ANm5
-----END PGP SIGNATURE-----

--Sig_/h7.A+.7Tnvvgz9QMES..UCO--

