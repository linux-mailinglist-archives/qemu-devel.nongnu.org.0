Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F36121427
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 19:08:48 +0100 (CET)
Received: from localhost ([::1]:58236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igunX-0001Fn-F0
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 13:08:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42720)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1igumk-0000lW-2M
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 13:07:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1igumi-0004Iv-Ct
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 13:07:57 -0500
Received: from 19.mo7.mail-out.ovh.net ([178.33.251.118]:43264)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1igumi-0004F1-6Q
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 13:07:56 -0500
Received: from player795.ha.ovh.net (unknown [10.109.146.5])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id D0EB2142925
 for <qemu-devel@nongnu.org>; Mon, 16 Dec 2019 19:07:53 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id 8C122D2999E9;
 Mon, 16 Dec 2019 18:07:48 +0000 (UTC)
Date: Mon, 16 Dec 2019 19:07:43 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 04/13] ppc/pnv: Introduce PnvMachineClass and
 PnvMachineClass::compat
Message-ID: <20191216190743.776f1d71@bahia.lan>
In-Reply-To: <5bf40b1e-48cb-5a20-82b2-7cd037003c27@kaod.org>
References: <157623836852.360005.1112241220707384093.stgit@bahia.lan>
 <157623839085.360005.4046508784077843216.stgit@bahia.lan>
 <5bf40b1e-48cb-5a20-82b2-7cd037003c27@kaod.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 14409548485980101003
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvddthedguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.33.251.118
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

On Fri, 13 Dec 2019 13:44:48 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 13/12/2019 12:59, Greg Kurz wrote:
> > The pnv_dt_create() function generates different contents for the
> > "compatible" property of the root node in the DT, depending on the
> > CPU type. This is open coded with multiple ifs using pnv_is_powerXX()
> > helpers.
> >=20
> > It seems cleaner to achieve with QOM. Introduce a base class for the
> > powernv machine and a compat attribute that each child class can use
> > to provide the value for the "compatible" property.
> >=20
> > Signed-off-by: Greg Kurz <groug@kaod.org>
>=20
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
>=20
> > ---
> >  hw/ppc/pnv.c         |   33 +++++++++++++++++++--------------
> >  include/hw/ppc/pnv.h |   13 +++++++++++++
> >  2 files changed, 32 insertions(+), 14 deletions(-)
> >=20
> > diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> > index 0be0b6b411c3..5ac149b149d8 100644
> > --- a/hw/ppc/pnv.c
> > +++ b/hw/ppc/pnv.c
> > @@ -484,9 +484,7 @@ static void pnv_dt_power_mgt(void *fdt)
> > =20
> >  static void *pnv_dt_create(MachineState *machine)
> >  {
> > -    const char plat_compat8[] =3D "qemu,powernv8\0qemu,powernv\0ibm,po=
wernv";
> > -    const char plat_compat9[] =3D "qemu,powernv9\0ibm,powernv";
> > -    const char plat_compat10[] =3D "qemu,powernv10\0ibm,powernv";
> > +    PnvMachineClass *pmc =3D PNV_MACHINE_GET_CLASS(machine);
> >      PnvMachineState *pnv =3D PNV_MACHINE(machine);
> >      void *fdt;
> >      char *buf;
> > @@ -504,17 +502,8 @@ static void *pnv_dt_create(MachineState *machine)
> >      _FDT((fdt_setprop_cell(fdt, 0, "#size-cells", 0x2)));
> >      _FDT((fdt_setprop_string(fdt, 0, "model",
> >                               "IBM PowerNV (emulated by qemu)")));
> > -    if (pnv_is_power10(pnv)) {
> > -        _FDT((fdt_setprop(fdt, 0, "compatible", plat_compat10,
> > -                          sizeof(plat_compat10))));
> > -    } else if (pnv_is_power9(pnv)) {
> > -        _FDT((fdt_setprop(fdt, 0, "compatible", plat_compat9,
> > -                          sizeof(plat_compat9))));
> > -    } else {
> > -        _FDT((fdt_setprop(fdt, 0, "compatible", plat_compat8,
> > -                          sizeof(plat_compat8))));
> > -    }
> > -
> > +    _FDT((fdt_setprop(fdt, 0, "compatible", pmc->compat,
> > +                      sizeof(pmc->compat))));

Of course the size should be pmc->compat_size ... David, can you fix this
in your tree or should I post a v2 ?

> > =20
> >      buf =3D  qemu_uuid_unparse_strdup(&qemu_uuid);
> >      _FDT((fdt_setprop_string(fdt, 0, "vm,uuid", buf)));
> > @@ -1692,6 +1681,8 @@ static void pnv_machine_power8_class_init(ObjectC=
lass *oc, void *data)
> >  {
> >      MachineClass *mc =3D MACHINE_CLASS(oc);
> >      XICSFabricClass *xic =3D XICS_FABRIC_CLASS(oc);
> > +    PnvMachineClass *pmc =3D PNV_MACHINE_CLASS(oc);
> > +    static const char compat[] =3D "qemu,powernv8\0qemu,powernv\0ibm,p=
owernv";
> > =20
> >      mc->desc =3D "IBM PowerNV (Non-Virtualized) POWER8";
> >      mc->default_cpu_type =3D POWERPC_CPU_TYPE_NAME("power8_v2.0");
> > @@ -1699,26 +1690,39 @@ static void pnv_machine_power8_class_init(Objec=
tClass *oc, void *data)
> >      xic->icp_get =3D pnv_icp_get;
> >      xic->ics_get =3D pnv_ics_get;
> >      xic->ics_resend =3D pnv_ics_resend;
> > +
> > +    pmc->compat =3D compat;
> > +    pmc->compat_size =3D sizeof(compat);
> >  }
> > =20
> >  static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
> >  {
> >      MachineClass *mc =3D MACHINE_CLASS(oc);
> >      XiveFabricClass *xfc =3D XIVE_FABRIC_CLASS(oc);
> > +    PnvMachineClass *pmc =3D PNV_MACHINE_CLASS(oc);
> > +    static const char compat[] =3D "qemu,powernv9\0ibm,powernv";
> > =20
> >      mc->desc =3D "IBM PowerNV (Non-Virtualized) POWER9";
> >      mc->default_cpu_type =3D POWERPC_CPU_TYPE_NAME("power9_v2.0");
> >      xfc->match_nvt =3D pnv_match_nvt;
> > =20
> >      mc->alias =3D "powernv";
> > +
> > +    pmc->compat =3D compat;
> > +    pmc->compat_size =3D sizeof(compat);
> >  }
> > =20
> >  static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
> >  {
> >      MachineClass *mc =3D MACHINE_CLASS(oc);
> > +    PnvMachineClass *pmc =3D PNV_MACHINE_CLASS(oc);
> > +    static const char compat[] =3D "qemu,powernv10\0ibm,powernv";
> > =20
> >      mc->desc =3D "IBM PowerNV (Non-Virtualized) POWER10";
> >      mc->default_cpu_type =3D POWERPC_CPU_TYPE_NAME("power10_v1.0");
> > +
> > +    pmc->compat =3D compat;
> > +    pmc->compat_size =3D sizeof(compat);
> >  }
> > =20
> >  static void pnv_machine_class_init(ObjectClass *oc, void *data)
> > @@ -1796,6 +1800,7 @@ static const TypeInfo types[] =3D {
> >          .instance_size =3D sizeof(PnvMachineState),
> >          .instance_init =3D pnv_machine_instance_init,
> >          .class_init    =3D pnv_machine_class_init,
> > +        .class_size    =3D sizeof(PnvMachineClass),
> >          .interfaces =3D (InterfaceInfo[]) {
> >              { TYPE_INTERRUPT_STATS_PROVIDER },
> >              { },
> > diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> > index 92f80b1ccead..d534746bd493 100644
> > --- a/include/hw/ppc/pnv.h
> > +++ b/include/hw/ppc/pnv.h
> > @@ -185,6 +185,19 @@ PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint3=
2_t pir);
> >  #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
> >  #define PNV_MACHINE(obj) \
> >      OBJECT_CHECK(PnvMachineState, (obj), TYPE_PNV_MACHINE)
> > +#define PNV_MACHINE_GET_CLASS(obj) \
> > +    OBJECT_GET_CLASS(PnvMachineClass, obj, TYPE_PNV_MACHINE)
> > +#define PNV_MACHINE_CLASS(klass) \
> > +    OBJECT_CLASS_CHECK(PnvMachineClass, klass, TYPE_PNV_MACHINE)
> > +
> > +typedef struct PnvMachineClass {
> > +    /*< private >*/
> > +    MachineClass parent_class;
> > +
> > +    /*< public >*/
> > +    const char *compat;
> > +    int compat_size;
> > +} PnvMachineClass;
> > =20
> >  typedef struct PnvMachineState {
> >      /*< private >*/
> >=20
>=20
>=20


