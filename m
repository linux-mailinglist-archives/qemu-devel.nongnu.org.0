Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8DC2C0262
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 10:41:17 +0100 (CET)
Received: from localhost ([::1]:34252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh8LU-00061l-Rt
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 04:41:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kh8Jz-0005BC-1K; Mon, 23 Nov 2020 04:39:43 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:33201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kh8Jt-0006lQ-VA; Mon, 23 Nov 2020 04:39:42 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.132])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id A94C46E1E88E;
 Mon, 23 Nov 2020 10:39:34 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 23 Nov
 2020 10:39:33 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002c5e2b83e-56ad-41cd-b652-ffc31f46cd78,
 7563B3C8582C4E5C569F12427BEE2CF3FAD9DE82) smtp.auth=groug@kaod.org
Date: Mon, 23 Nov 2020 10:39:31 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH for-6.0 6/8] spapr/xics: Add "nr-servers" property
Message-ID: <20201123103931.0b62713a@bahia.lan>
In-Reply-To: <20201123041809.GF521467@yekko.fritz.box>
References: <20201120174646.619395-1-groug@kaod.org>
 <20201120174646.619395-7-groug@kaod.org>
 <20201123041809.GF521467@yekko.fritz.box>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/an.ELRrkLQoExQ3EP.5y0ew";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 1f4d07f9-c5af-4bfd-a774-1c367fcdbbbd
X-Ovh-Tracer-Id: 9463751668774377952
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegiedgtdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtihesghdtreerredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeegkeelvdeuhfefudeutefgveevgfeuvdduueegffeliefggffgheehieejheegnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/an.ELRrkLQoExQ3EP.5y0ew
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 23 Nov 2020 15:18:09 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Fri, Nov 20, 2020 at 06:46:44PM +0100, Greg Kurz wrote:
> > The sPAPR ICS device exposes the range of vCPU ids it can handle in
> > the "ibm,interrupt-server-ranges" FDT property. The highest vCPU
> > id, ie. spapr_max_server_number(), is obtained from the machine
> > through the "nr_servers" argument of the generic spapr_irq_dt() call.
> >=20
> > We want to drop the "nr_servers" argument from the API because it
> > doesn't make sense for the sPAPR XIVE device actually.
> >=20
> > On POWER9, we also pass the highest vCPU id to the KVM XICS-on-XIVE
> > device, in order to optimize resource allocation in the HW.
> >=20
> > This is enough motivation to introduce an "nr-servers" property
> > and to use it for both purposes.
> >=20
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  include/hw/ppc/spapr.h      |  4 ++--
> >  include/hw/ppc/xics_spapr.h | 21 +++++++++++++++++---
> >  hw/intc/xics_kvm.c          |  2 +-
> >  hw/intc/xics_spapr.c        | 38 ++++++++++++++++++++++++-------------
> >  hw/ppc/spapr.c              |  5 +++--
> >  hw/ppc/spapr_irq.c          |  7 +++++--
> >  6 files changed, 54 insertions(+), 23 deletions(-)
> >=20
> > diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> > index 2e89e36cfbdc..b76c84a2f884 100644
> > --- a/include/hw/ppc/spapr.h
> > +++ b/include/hw/ppc/spapr.h
> > @@ -10,7 +10,7 @@
> >  #include "hw/ppc/spapr_irq.h"
> >  #include "qom/object.h"
> >  #include "hw/ppc/spapr_xive.h"  /* For SpaprXive */
> > -#include "hw/ppc/xics.h"        /* For ICSState */
> > +#include "hw/ppc/xics_spapr.h"  /* For IcsSpaprState */
> >  #include "hw/ppc/spapr_tpm_proxy.h"
> > =20
> >  struct SpaprVioBus;
> > @@ -230,7 +230,7 @@ struct SpaprMachineState {
> >      SpaprIrq *irq;
> >      qemu_irq *qirqs;
> >      SpaprInterruptController *active_intc;
> > -    ICSState *ics;
> > +    IcsSpaprState *ics;
> >      SpaprXive *xive;
> > =20
> >      bool cmd_line_caps[SPAPR_CAP_NUM];
> > diff --git a/include/hw/ppc/xics_spapr.h b/include/hw/ppc/xics_spapr.h
> > index de752c0d2c7e..1a483a873b62 100644
> > --- a/include/hw/ppc/xics_spapr.h
> > +++ b/include/hw/ppc/xics_spapr.h
> > @@ -28,12 +28,27 @@
> >  #define XICS_SPAPR_H
> > =20
> >  #include "hw/ppc/spapr.h"
> > +#include "hw/ppc/xics.h"
> >  #include "qom/object.h"
> > =20
> > +typedef struct IcsSpaprState {
> > +    /*< private >*/
> > +    ICPState parent_obj;
>=20
> It's called "*Ics*SpaprState" and it's replacing an ICSState, but it's
> parent object is an *ICP*State - that doesn't seem right.
>=20

Oops, typo :-\

> > +
> > +    /*
> > +     * The ICS needs to know the upper limit to vCPU ids it
> > +     * might be exposed to in order to size the vCPU id range
> > +     * in "ibm,interrupt-server-ranges" and to optimize HW
> > +     * resource allocation when using the XICS-on-XIVE KVM
> > +     * device. It is the purpose of the "nr-servers" property
> > +     * which *must* be set to a non-null value before realizing
> > +     * the ICS.
> > +     */
> > +    uint32_t nr_servers;
>=20
> That said, I'm a but dubious about attaching the number of servers to
> the ICS side, rather than the ICP side, since server numbers is
> basically an ICP concept.  In fact... things about the overall
> topology are usually done via the XicsFabric, so I'm wondering if we
> should add a callback there for nr_servers.
>=20

I agree this would be the way to go. I sent a patch to do so a year ago
but it didn't reach consensus at the time:

http://patchwork.ozlabs.org/project/qemu-devel/patch/157010405465.246126.77=
60334967989385566.stgit@bahia.lan/

I'll revisit the approach.

> > +} IcsSpaprState;
> > +
> >  #define TYPE_ICS_SPAPR "ics-spapr"
> > -/* This is reusing the ICSState typedef from TYPE_ICS */
> > -DECLARE_INSTANCE_CHECKER(ICSState, ICS_SPAPR,
> > -                         TYPE_ICS_SPAPR)
> > +DECLARE_INSTANCE_CHECKER(IcsSpaprState, ICS_SPAPR, TYPE_ICS_SPAPR)
> > =20
> >  int xics_kvm_connect(SpaprInterruptController *intc, uint32_t nr_serve=
rs,
> >                       Error **errp);
> > diff --git a/hw/intc/xics_kvm.c b/hw/intc/xics_kvm.c
> > index 570d635bcc08..ecbbda0e249b 100644
> > --- a/hw/intc/xics_kvm.c
> > +++ b/hw/intc/xics_kvm.c
> > @@ -350,7 +350,7 @@ void ics_kvm_set_irq(ICSState *ics, int srcno, int =
val)
> >  int xics_kvm_connect(SpaprInterruptController *intc, uint32_t nr_serve=
rs,
> >                       Error **errp)
> >  {
> > -    ICSState *ics =3D ICS_SPAPR(intc);
> > +    ICSState *ics =3D ICS(intc);
> >      int rc;
> >      CPUState *cs;
> >      Error *local_err =3D NULL;
> > diff --git a/hw/intc/xics_spapr.c b/hw/intc/xics_spapr.c
> > index 8ae4f41459c3..ce147e8980ed 100644
> > --- a/hw/intc/xics_spapr.c
> > +++ b/hw/intc/xics_spapr.c
> > @@ -34,6 +34,7 @@
> >  #include "hw/ppc/xics.h"
> >  #include "hw/ppc/xics_spapr.h"
> >  #include "hw/ppc/fdt.h"
> > +#include "hw/qdev-properties.h"
> >  #include "qapi/visitor.h"
> > =20
> >  /*
> > @@ -154,7 +155,7 @@ static void rtas_set_xive(PowerPCCPU *cpu, SpaprMac=
hineState *spapr,
> >                            uint32_t nargs, target_ulong args,
> >                            uint32_t nret, target_ulong rets)
> >  {
> > -    ICSState *ics =3D spapr->ics;
> > +    ICSState *ics =3D ICS(spapr->ics);
> >      uint32_t nr, srcno, server, priority;
> > =20
> >      CHECK_EMULATED_XICS_RTAS(spapr, rets);
> > @@ -189,7 +190,7 @@ static void rtas_get_xive(PowerPCCPU *cpu, SpaprMac=
hineState *spapr,
> >                            uint32_t nargs, target_ulong args,
> >                            uint32_t nret, target_ulong rets)
> >  {
> > -    ICSState *ics =3D spapr->ics;
> > +    ICSState *ics =3D ICS(spapr->ics);
> >      uint32_t nr, srcno;
> > =20
> >      CHECK_EMULATED_XICS_RTAS(spapr, rets);
> > @@ -221,7 +222,7 @@ static void rtas_int_off(PowerPCCPU *cpu, SpaprMach=
ineState *spapr,
> >                           uint32_t nargs, target_ulong args,
> >                           uint32_t nret, target_ulong rets)
> >  {
> > -    ICSState *ics =3D spapr->ics;
> > +    ICSState *ics =3D ICS(spapr->ics);
> >      uint32_t nr, srcno;
> > =20
> >      CHECK_EMULATED_XICS_RTAS(spapr, rets);
> > @@ -254,7 +255,7 @@ static void rtas_int_on(PowerPCCPU *cpu, SpaprMachi=
neState *spapr,
> >                          uint32_t nargs, target_ulong args,
> >                          uint32_t nret, target_ulong rets)
> >  {
> > -    ICSState *ics =3D spapr->ics;
> > +    ICSState *ics =3D ICS(spapr->ics);
> >      uint32_t nr, srcno;
> > =20
> >      CHECK_EMULATED_XICS_RTAS(spapr, rets);
> > @@ -285,10 +286,13 @@ static void rtas_int_on(PowerPCCPU *cpu, SpaprMac=
hineState *spapr,
> > =20
> >  static void ics_spapr_realize(DeviceState *dev, Error **errp)
> >  {
> > -    ICSState *ics =3D ICS_SPAPR(dev);
> > -    ICSStateClass *icsc =3D ICS_GET_CLASS(ics);
> > +    IcsSpaprState *sics =3D ICS_SPAPR(dev);
> > +    ICSStateClass *icsc =3D ICS_GET_CLASS(dev);
> >      Error *local_err =3D NULL;
> > =20
> > +    /* Set by spapr_irq_init() */
> > +    g_assert(sics->nr_servers);
> > +
> >      icsc->parent_realize(dev, &local_err);
> >      if (local_err) {
> >          error_propagate(errp, local_err);
> > @@ -312,7 +316,7 @@ static void xics_spapr_dt(SpaprInterruptController =
*intc, uint32_t nr_servers,
> >                            void *fdt, uint32_t phandle)
> >  {
> >      uint32_t interrupt_server_ranges_prop[] =3D {
> > -        0, cpu_to_be32(nr_servers),
> > +        0, cpu_to_be32(ICS_SPAPR(intc)->nr_servers),
> >      };
> >      int node;
> > =20
> > @@ -333,7 +337,7 @@ static void xics_spapr_dt(SpaprInterruptController =
*intc, uint32_t nr_servers,
> >  static int xics_spapr_cpu_intc_create(SpaprInterruptController *intc,
> >                                         PowerPCCPU *cpu, Error **errp)
> >  {
> > -    ICSState *ics =3D ICS_SPAPR(intc);
> > +    ICSState *ics =3D ICS(intc);
> >      Object *obj;
> >      SpaprCpuState *spapr_cpu =3D spapr_cpu_state(cpu);
> > =20
> > @@ -364,7 +368,7 @@ static void xics_spapr_cpu_intc_destroy(SpaprInterr=
uptController *intc,
> >  static int xics_spapr_claim_irq(SpaprInterruptController *intc, int ir=
q,
> >                                  bool lsi, Error **errp)
> >  {
> > -    ICSState *ics =3D ICS_SPAPR(intc);
> > +    ICSState *ics =3D ICS(intc);
> > =20
> >      assert(ics);
> >      assert(ics_valid_irq(ics, irq));
> > @@ -380,7 +384,7 @@ static int xics_spapr_claim_irq(SpaprInterruptContr=
oller *intc, int irq,
> > =20
> >  static void xics_spapr_free_irq(SpaprInterruptController *intc, int ir=
q)
> >  {
> > -    ICSState *ics =3D ICS_SPAPR(intc);
> > +    ICSState *ics =3D ICS(intc);
> >      uint32_t srcno =3D irq - ics->offset;
> > =20
> >      assert(ics_valid_irq(ics, irq));
> > @@ -390,7 +394,7 @@ static void xics_spapr_free_irq(SpaprInterruptContr=
oller *intc, int irq)
> > =20
> >  static void xics_spapr_set_irq(SpaprInterruptController *intc, int irq=
, int val)
> >  {
> > -    ICSState *ics =3D ICS_SPAPR(intc);
> > +    ICSState *ics =3D ICS(intc);
> >      uint32_t srcno =3D irq - ics->offset;
> > =20
> >      ics_set_irq(ics, srcno, val);
> > @@ -398,7 +402,7 @@ static void xics_spapr_set_irq(SpaprInterruptContro=
ller *intc, int irq, int val)
> > =20
> >  static void xics_spapr_print_info(SpaprInterruptController *intc, Moni=
tor *mon)
> >  {
> > -    ICSState *ics =3D ICS_SPAPR(intc);
> > +    ICSState *ics =3D ICS(intc);
> >      CPUState *cs;
> > =20
> >      CPU_FOREACH(cs) {
> > @@ -426,7 +430,8 @@ static int xics_spapr_activate(SpaprInterruptContro=
ller *intc,
> >                                 uint32_t nr_servers, Error **errp)
> >  {
> >      if (kvm_enabled()) {
> > -        return spapr_irq_init_kvm(xics_kvm_connect, intc, nr_servers, =
errp);
> > +        return spapr_irq_init_kvm(xics_kvm_connect, intc,
> > +                                  ICS_SPAPR(intc)->nr_servers, errp);
> >      }
> >      return 0;
> >  }
> > @@ -438,6 +443,11 @@ static void xics_spapr_deactivate(SpaprInterruptCo=
ntroller *intc)
> >      }
> >  }
> > =20
> > +static Property ics_spapr_properties[] =3D {
> > +    DEFINE_PROP_UINT32("nr-servers", IcsSpaprState, nr_servers, 0),
> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
> > +
> >  static void ics_spapr_class_init(ObjectClass *klass, void *data)
> >  {
> >      DeviceClass *dc =3D DEVICE_CLASS(klass);
> > @@ -446,6 +456,7 @@ static void ics_spapr_class_init(ObjectClass *klass=
, void *data)
> > =20
> >      device_class_set_parent_realize(dc, ics_spapr_realize,
> >                                      &isc->parent_realize);
> > +    device_class_set_props(dc, ics_spapr_properties);
> >      sicc->activate =3D xics_spapr_activate;
> >      sicc->deactivate =3D xics_spapr_deactivate;
> >      sicc->cpu_intc_create =3D xics_spapr_cpu_intc_create;
> > @@ -462,6 +473,7 @@ static void ics_spapr_class_init(ObjectClass *klass=
, void *data)
> >  static const TypeInfo ics_spapr_info =3D {
> >      .name =3D TYPE_ICS_SPAPR,
> >      .parent =3D TYPE_ICS,
> > +    .instance_size =3D sizeof(IcsSpaprState),
> >      .class_init =3D ics_spapr_class_init,
> >      .interfaces =3D (InterfaceInfo[]) {
> >          { TYPE_SPAPR_INTC },
> > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > index 12a012d9dd09..21de0456446b 100644
> > --- a/hw/ppc/spapr.c
> > +++ b/hw/ppc/spapr.c
> > @@ -4218,15 +4218,16 @@ static void spapr_phb_placement(SpaprMachineSta=
te *spapr, uint32_t index,
> >  static ICSState *spapr_ics_get(XICSFabric *dev, int irq)
> >  {
> >      SpaprMachineState *spapr =3D SPAPR_MACHINE(dev);
> > +    ICSState *ics =3D ICS(spapr->ics);
> > =20
> > -    return ics_valid_irq(spapr->ics, irq) ? spapr->ics : NULL;
> > +    return ics_valid_irq(ics, irq) ? ics : NULL;
> >  }
> > =20
> >  static void spapr_ics_resend(XICSFabric *dev)
> >  {
> >      SpaprMachineState *spapr =3D SPAPR_MACHINE(dev);
> > =20
> > -    ics_resend(spapr->ics);
> > +    ics_resend(ICS(spapr->ics));
> >  }
> > =20
> >  static ICPState *spapr_icp_get(XICSFabric *xi, int vcpu_id)
> > diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
> > index 2dacbecfd5fd..be6f4041e433 100644
> > --- a/hw/ppc/spapr_irq.c
> > +++ b/hw/ppc/spapr_irq.c
> > @@ -316,6 +316,9 @@ void spapr_irq_init(SpaprMachineState *spapr, Error=
 **errp)
> >          object_property_set_link(obj, ICS_PROP_XICS, OBJECT(spapr),
> >                                   &error_abort);
> >          object_property_set_int(obj, "nr-irqs", smc->nr_xirqs, &error_=
abort);
> > +        object_property_set_uint(obj, "nr-servers",
> > +                                 spapr_max_server_number(spapr),
> > +                                 &error_abort);
> >          if (!qdev_realize(DEVICE(obj), NULL, errp)) {
> >              return;
> >          }
> > @@ -426,7 +429,7 @@ qemu_irq spapr_qirq(SpaprMachineState *spapr, int i=
rq)
> >      assert(irq < (smc->nr_xirqs + SPAPR_XIRQ_BASE));
> > =20
> >      if (spapr->ics) {
> > -        assert(ics_valid_irq(spapr->ics, irq));
> > +        assert(ics_valid_irq(ICS(spapr->ics), irq));
> >      }
> >      if (spapr->xive) {
> >          assert(irq < spapr->xive->nr_irqs);
> > @@ -556,7 +559,7 @@ static int ics_find_free_block(ICSState *ics, int n=
um, int alignnum)
> > =20
> >  int spapr_irq_find(SpaprMachineState *spapr, int num, bool align, Erro=
r **errp)
> >  {
> > -    ICSState *ics =3D spapr->ics;
> > +    ICSState *ics =3D ICS(spapr->ics);
> >      int first =3D -1;
> > =20
> >      assert(ics);
>=20


--Sig_/an.ELRrkLQoExQ3EP.5y0ew
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAl+7g1MACgkQcdTV5YIv
c9axCQ/+MkXXa5kZhetATZCOXNoRl0TZRpYnXs9JEmaBYxU98GIDIHmwp/9fjZ+4
S9WgVZjNrII7Sxz0QJl6ih9U8wtodWfN7o9vi3Oz4JJTStZ9PGCRSv7ILUwHpmK3
kYA5nbO0zEcIqTIeXzYj05dSWJ+9ZFXDo6mPkZQBm6h42EW1JnhVmQRNWgQf/4PI
Da+KxUl6iUF5BDlRr5cPToNmToc3kd2VjzTdTPRkGN0RoFlybT5Cw+pFpgycXKqX
zPgLKjHiAWkCWMFIrwN0rqMT6ftlnC4BdCdpTjDth6QprepfSwZ3iogY52JFdVYF
hK24l1dxoSAmF6mN8M0o5ccGqBn2hr8m1LkMTpqg/LJNKscbakWKivFYlhz/j8bg
ZRU0zLvFrCDw/CPd+ttboNmaWaJ8Gz2Mw8m7S84UYAiqYEQ/EWeHAPxSSkNMQlXk
PQXcgSKiJYwoowrLogaLaZ/Eb3n2SGOXMrdpYi9Xry9O87B0hImkwRby8gDiMTUx
oG9VHkgK6vWW1lL3xSwVPyeyr+3HaOEjit+ZJdK8miLyOq4W05yVe55PMmJnSYy2
7Q2fEd5wXCCmXN2kJ3PSQbBsE7YDWKdiabvuIhuVbinChXu+9Hn2aZN66o9Qkt58
/vGfNC9224OdYFwghu2cH3Dfrw31PHIeORZt0g7WrK4+BYHg0uw=
=rngJ
-----END PGP SIGNATURE-----

--Sig_/an.ELRrkLQoExQ3EP.5y0ew--

