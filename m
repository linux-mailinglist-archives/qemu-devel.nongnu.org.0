Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD422C2E56
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 18:22:20 +0100 (CET)
Received: from localhost ([::1]:51948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khc1D-0003NQ-6I
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 12:22:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1khby2-0001RW-H3; Tue, 24 Nov 2020 12:19:02 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:34465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1khbxx-0002J7-DB; Tue, 24 Nov 2020 12:19:02 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.137])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 84A786E9A788;
 Tue, 24 Nov 2020 18:18:53 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 24 Nov
 2020 18:18:52 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0057a1b719f-552c-49ac-9f2b-c1e8d12007cc,
 886B3C846F729F79F342FB8F3892F62368E4F687) smtp.auth=groug@kaod.org
Date: Tue, 24 Nov 2020 18:18:51 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH for-6.0 4/8] spapr/xive: Add "nr-ipis" property
Message-ID: <20201124181851.79002ce0@bahia.lan>
In-Reply-To: <0a4a08ab-7c5f-3635-86ac-de5cd536f257@kaod.org>
References: <20201120174646.619395-1-groug@kaod.org>
 <20201120174646.619395-5-groug@kaod.org>
 <0a4a08ab-7c5f-3635-86ac-de5cd536f257@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 7195051e-c719-4b18-952e-1b35f5381d2b
X-Ovh-Tracer-Id: 4646870394798250464
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegkedguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgeffgfekjedugeeuhefgkedvhfekheellefhtddvgfdtvdetleefudfhteetteeknecuffhomhgrihhnpehgnhhurdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Nov 2020 11:13:21 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 11/20/20 6:46 PM, Greg Kurz wrote:
> > The sPAPR XIVE device exposes a range of LISNs that the guest uses
> > for IPIs. This range is currently sized according to the highest
> > vCPU id, ie. spapr_max_server_number(), as obtained from the machine
> > through the "nr_servers" argument of the generic spapr_irq_dt() call.
> >=20
> > This makes sense for the "ibm,interrupt-server-ranges" property of
> > sPAPR XICS, but certainly not for "ibm,xive-lisn-ranges". The range
> > should be sized to the maximum number of possible vCPUs. It happens
> > that spapr_max_server_number() =3D=3D smp.max_cpus in practice with the
> > machine default settings. This might not be the case though when
> > VSMT is in use : we can end up with a much larger range (up to 8
> > times bigger) than needed and waste LISNs.=20
>=20
> will it exceed 4K ? if not, we are fine.
>=20
> The fact that it is so complex to get the number of vCPUs is a=20
> problem by it self to me. Can we simplify that ? or introduce a=20
> spapr_max_server_number_id() ?=20
>=20

"server number" is the XICS wording for vCPU id. The name of the
existing spapr_max_server_number() is perfectly fine from this
perspective: this sizes "ibm,interrupt-server-ranges".

> > But most importantly, this
> > lures people into thinking that IPI numbers are always equal to
> > vCPU ids, which is wrong and bit us recently:
>=20
> do we have a converting routing vcpu_id_to_ipi ? I think we have
> that in KVM.
>=20
> > https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg01476.html
> >=20
> > Introduce an "nr-ipis" property that the machine sets to smp.max_cpus
> > before realizing the deice. Use that instead of "nr_servers" in
> > spapr_xive_dt(). Have the machine to claim the same number of IPIs
> > in spapr_irq_init().
> >=20
> > This doesn't cause any guest visible change when using the machine
> > default settings (ie. VSMT =3D=3D smp.threads).>
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  include/hw/ppc/spapr_xive.h | 8 ++++++++
> >  hw/intc/spapr_xive.c        | 4 +++-
> >  hw/ppc/spapr_irq.c          | 4 +++-
> >  3 files changed, 14 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
> > index 7123ea07ed78..69b9fbc1b9a5 100644
> > --- a/include/hw/ppc/spapr_xive.h
> > +++ b/include/hw/ppc/spapr_xive.h
> > @@ -43,6 +43,14 @@ typedef struct SpaprXive {
> > =20
> >      /* DT */
> >      gchar *nodename;
> > +    /*
> > +     * The sPAPR XIVE device needs to know how many vCPUs it
> > +     * might be exposed to in order to size the IPI range in
> > +     * "ibm,interrupt-server-ranges". It is the purpose of the
>=20
> There is no "ibm,interrupt-server-ranges"  property in XIVE
>=20

Yeah copy/paste error. Read "ibm,xive-lisn-ranges" of course :)

> > +     * "nr-ipis" property which *must* be set to a non-null
> > +     * value before realizing the sPAPR XIVE device.
> > +     */
> > +    uint32_t nr_ipis;
> > =20
> >      /* Routing table */
> >      XiveEAS       *eat;
> > diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> > index e4dbf9c2c409..d13a2955ce9b 100644
> > --- a/hw/intc/spapr_xive.c
> > +++ b/hw/intc/spapr_xive.c
> > @@ -311,6 +311,7 @@ static void spapr_xive_realize(DeviceState *dev, Er=
ror **errp)
> >      /* Set by spapr_irq_init() */
> >      g_assert(xive->nr_irqs);
> >      g_assert(xive->nr_servers);
> > +    g_assert(xive->nr_ipis);
> > =20
> >      sxc->parent_realize(dev, &local_err);
> >      if (local_err) {
> > @@ -608,6 +609,7 @@ static Property spapr_xive_properties[] =3D {
> >       */
> >      DEFINE_PROP_UINT32("nr-ends", SpaprXive, nr_ends_vmstate, 0),
> >      DEFINE_PROP_UINT32("nr-servers", SpaprXive, nr_servers, 0),
> > +    DEFINE_PROP_UINT32("nr-ipis", SpaprXive, nr_ipis, 0),
> >      DEFINE_PROP_UINT64("vc-base", SpaprXive, vc_base, SPAPR_XIVE_VC_BA=
SE),
> >      DEFINE_PROP_UINT64("tm-base", SpaprXive, tm_base, SPAPR_XIVE_TM_BA=
SE),
> >      DEFINE_PROP_UINT8("hv-prio", SpaprXive, hv_prio, 7),
> > @@ -698,7 +700,7 @@ static void spapr_xive_dt(SpaprInterruptController =
*intc, uint32_t nr_servers,
> >      /* Interrupt number ranges for the IPIs */
> >      uint32_t lisn_ranges[] =3D {
> >          cpu_to_be32(SPAPR_IRQ_IPI),
> > -        cpu_to_be32(SPAPR_IRQ_IPI + nr_servers),
> > +        cpu_to_be32(SPAPR_IRQ_IPI + xive->nr_ipis),
>=20
> I don't understand why we need nr_ipis. Can't we pass the same value in=20
> nr_servers from the machine ?
>=20

This is the point of this patch. nr_servers is vCPU id and shouldn't be
used to size the LISN range.

> ( Conceptually, the first 4K are all IPIs. The first range is for=20
>   HW threads )=20
>=20
>=20
> >      };
> >      /*
> >       * EQ size - the sizes of pages supported by the system 4K, 64K,
> > diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
> > index 8c5627225636..a0fc474ecb06 100644
> > --- a/hw/ppc/spapr_irq.c
> > +++ b/hw/ppc/spapr_irq.c
> > @@ -325,12 +325,14 @@ void spapr_irq_init(SpaprMachineState *spapr, Err=
or **errp)
> > =20
> >      if (spapr->irq->xive) {
> >          uint32_t nr_servers =3D spapr_max_server_number(spapr);
> > +        uint32_t max_cpus =3D MACHINE(spapr)->smp.max_cpus;
>=20
> So that's the value we should be using in case of VSMT and not=20
> spapr_max_server_number(). If I am correct, this is a max_cpu_id ?
>=20

This isn't an id, it is what you pass to -smp maxcpus, ie. the total
number of vCPUs that the may run inside the guest. So this is what
we should use everywhere we care for a number of vCPUs.

>=20
> >          DeviceState *dev;
> >          int i;
> > =20
> >          dev =3D qdev_new(TYPE_SPAPR_XIVE);
> >          qdev_prop_set_uint32(dev, "nr-irqs", smc->nr_xirqs + SPAPR_XIR=
Q_BASE);
> >          qdev_prop_set_uint32(dev, "nr-servers", nr_servers);
> > +        qdev_prop_set_uint32(dev, "nr-ipis", max_cpus);
> >          object_property_set_link(OBJECT(dev), "xive-fabric", OBJECT(sp=
apr),
> >                                   &error_abort);
> >          sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> > @@ -338,7 +340,7 @@ void spapr_irq_init(SpaprMachineState *spapr, Error=
 **errp)
> >          spapr->xive =3D SPAPR_XIVE(dev);
> > =20
> >          /* Enable the CPU IPIs */
> > -        for (i =3D 0; i < nr_servers; ++i) {
> > +        for (i =3D 0; i < max_cpus; ++i) {
> >              SpaprInterruptControllerClass *sicc
> >                  =3D SPAPR_INTC_GET_CLASS(spapr->xive);
>=20
>=20
>=20
>=20


