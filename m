Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 317E936C0C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 08:07:44 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55189 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYlYt-0003QE-6k
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 02:07:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54635)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hYlXj-0002sg-Or
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 02:06:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hYlXh-0001LE-S4
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 02:06:31 -0400
Received: from 6.mo5.mail-out.ovh.net ([178.32.119.138]:54030)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1hYlXf-0001Gz-TG
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 02:06:29 -0400
Received: from player699.ha.ovh.net (unknown [10.109.159.62])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id DDE4A238828
	for <qemu-devel@nongnu.org>; Thu,  6 Jun 2019 08:06:20 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
	[82.253.208.248]) (Authenticated sender: groug@kaod.org)
	by player699.ha.ovh.net (Postfix) with ESMTPSA id 13D63688A4C8;
	Thu,  6 Jun 2019 06:06:10 +0000 (UTC)
Date: Thu, 6 Jun 2019 08:06:09 +0200
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20190606080609.28b4dd15@bahia.lab.toulouse-stg.fr.ibm.com>
In-Reply-To: <20190606030614.GK10319@umbus.fritz.box>
References: <155910829070.13149.5215948335633966328.stgit@aravinda>
	<155910845769.13149.8097972239187020170.stgit@aravinda>
	<20190606030614.GK10319@umbus.fritz.box>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	boundary="Sig_/Ctw.5U/B2xL9ov7X7UN21b_";
	protocol="application/pgp-signature"
X-Ovh-Tracer-Id: 12491296517749053926
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudegfedguddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.32.119.138
Subject: Re: [Qemu-devel] [PATCH v9 6/6] migration: Include migration
 support for machine check handling
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: aik@au1.ibm.com, qemu-devel@nongnu.org, paulus@ozlabs.org,
	qemu-ppc@nongnu.org, Aravinda Prasad <aravinda@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/Ctw.5U/B2xL9ov7X7UN21b_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Jun 2019 13:06:14 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, May 29, 2019 at 11:10:57AM +0530, Aravinda Prasad wrote:
> > This patch includes migration support for machine check
> > handling. Especially this patch blocks VM migration
> > requests until the machine check error handling is
> > complete as (i) these errors are specific to the source
> > hardware and is irrelevant on the target hardware,
> > (ii) these errors cause data corruption and should
> > be handled before migration.
> >=20
> > Signed-off-by: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
> > ---
> >  hw/ppc/spapr.c         |   20 ++++++++++++++++++++
> >  hw/ppc/spapr_events.c  |   17 +++++++++++++++++
> >  hw/ppc/spapr_rtas.c    |    4 ++++
> >  include/hw/ppc/spapr.h |    2 ++
> >  4 files changed, 43 insertions(+)
> >=20
> > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > index e8a77636..31c4850 100644
> > --- a/hw/ppc/spapr.c
> > +++ b/hw/ppc/spapr.c
> > @@ -2104,6 +2104,25 @@ static const VMStateDescription vmstate_spapr_dt=
b =3D {
> >      },
> >  };
> > =20
> > +static bool spapr_fwnmi_needed(void *opaque)
> > +{
> > +    SpaprMachineState *spapr =3D (SpaprMachineState *)opaque;
> > +
> > +    return (spapr->guest_machine_check_addr =3D=3D -1) ? 0 : 1; =20
>=20
> Since we're introducing a PAPR capability to enable this, it would
> actually be better to check that here, rather than the runtime state.
> That leads to less cases and easier to understand semantics for the
> migration stream.
>=20

Hmmm... the purpose of needed() VMState callbacks is precisely about
runtime state: the subsection should only be migrated if an MCE is
pending, ie. spapr->guest_machine_check_addr !=3D -1.

> > +}
> > +
> > +static const VMStateDescription vmstate_spapr_machine_check =3D {
> > +    .name =3D "spapr_machine_check",
> > +    .version_id =3D 1,
> > +    .minimum_version_id =3D 1,
> > +    .needed =3D spapr_fwnmi_needed,
> > +    .fields =3D (VMStateField[]) {
> > +        VMSTATE_UINT64(guest_machine_check_addr, SpaprMachineState),
> > +        VMSTATE_INT32(mc_status, SpaprMachineState),
> > +        VMSTATE_END_OF_LIST()
> > +    },
> > +};
> > +
> >  static const VMStateDescription vmstate_spapr =3D {
> >      .name =3D "spapr",
> >      .version_id =3D 3,
> > @@ -2137,6 +2156,7 @@ static const VMStateDescription vmstate_spapr =3D=
 {
> >          &vmstate_spapr_dtb,
> >          &vmstate_spapr_cap_large_decr,
> >          &vmstate_spapr_cap_ccf_assist,
> > +        &vmstate_spapr_machine_check,
> >          NULL
> >      }
> >  };
> > diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
> > index 573c0b7..35e21e4 100644
> > --- a/hw/ppc/spapr_events.c
> > +++ b/hw/ppc/spapr_events.c
> > @@ -41,6 +41,7 @@
> >  #include "qemu/bcd.h"
> >  #include "hw/ppc/spapr_ovec.h"
> >  #include <libfdt.h>
> > +#include "migration/blocker.h"
> > =20
> >  #define RTAS_LOG_VERSION_MASK                   0xff000000
> >  #define   RTAS_LOG_VERSION_6                    0x06000000
> > @@ -855,6 +856,22 @@ static void spapr_mce_dispatch_elog(PowerPCCPU *cp=
u, bool recovered)
> >  void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered)
> >  {
> >      SpaprMachineState *spapr =3D SPAPR_MACHINE(qdev_get_machine());
> > +    int ret;
> > +    Error *local_err =3D NULL;
> > +
> > +    error_setg(&spapr->fwnmi_migration_blocker,
> > +            "Live migration not supported during machine check handlin=
g");
> > +    ret =3D migrate_add_blocker(spapr->fwnmi_migration_blocker, &local=
_err);
> > +    if (ret < 0) {
> > +        /*
> > +         * We don't want to abort and let the migration to continue. I=
n a
> > +         * rare case, the machine check handler will run on the target
> > +         * hardware. Though this is not preferable, it is better than =
aborting
> > +         * the migration or killing the VM.
> > +         */
> > +        error_free(spapr->fwnmi_migration_blocker); =20
>=20
> You should set fwnmi_migration_blocker to NULL here as well.
>=20
> As mentioned on an earlier iteration, the migration blocker is the
> same every time.  Couldn't you just create it once and free at final
> teardown, rather than recreating it for every NMI?
>=20
> > +        warn_report_err(local_err);
> > +    }
> > =20
> >      while (spapr->mc_status !=3D -1) {
> >          /*
> > diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> > index 91a7ab9..c849223 100644
> > --- a/hw/ppc/spapr_rtas.c
> > +++ b/hw/ppc/spapr_rtas.c
> > @@ -50,6 +50,7 @@
> >  #include "target/ppc/mmu-hash64.h"
> >  #include "target/ppc/mmu-book3s-v3.h"
> >  #include "kvm_ppc.h"
> > +#include "migration/blocker.h"
> > =20
> >  static void rtas_display_character(PowerPCCPU *cpu, SpaprMachineState =
*spapr,
> >                                     uint32_t token, uint32_t nargs,
> > @@ -404,6 +405,9 @@ static void rtas_ibm_nmi_interlock(PowerPCCPU *cpu,
> >          spapr->mc_status =3D -1;
> >          qemu_cond_signal(&spapr->mc_delivery_cond);
> >          rtas_st(rets, 0, RTAS_OUT_SUCCESS);
> > +        migrate_del_blocker(spapr->fwnmi_migration_blocker);
> > +        error_free(spapr->fwnmi_migration_blocker);
> > +        spapr->fwnmi_migration_blocker =3D NULL;
> >      }
> >  }
> > =20
> > diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> > index bd75d4b..6c0cfd8 100644
> > --- a/include/hw/ppc/spapr.h
> > +++ b/include/hw/ppc/spapr.h
> > @@ -214,6 +214,8 @@ struct SpaprMachineState {
> >      SpaprCapabilities def, eff, mig;
> > =20
> >      unsigned gpu_numa_id;
> > +
> > +    Error *fwnmi_migration_blocker;
> >  };
> > =20
> >  #define H_SUCCESS         0
> >  =20
>=20


--Sig_/Ctw.5U/B2xL9ov7X7UN21b_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAlz4rVEACgkQcdTV5YIv
c9YfRQ/9EzshMV4VlSL+DtSraRJ8RWXSJT/HI2OFKP+r4DjwXCR5zSPouazHNDqK
OQchhlOGA+0lOfaCXVmgRFr+aVNRRPxRHxWrwrVwzCKU0x+MZWX6rr2h0Ol1HDR2
xUY14wKZmvFxuAuEWip9eUeD5K+3DbatQYD+4Y7styeKgh5BZOnENr8QqtElyOUm
HoB12tSxuV49czwU4bzN7lvt5K0GL6cYUOVTmAvL/pXLG25PPgVRVLomupIxFmZA
l3q7Gmp2dtfvxXEs7IxT8tptlGYa1DaEOHBxLWVUSUUBe2fSIq58+YPEMNLOszaP
ZUNnsvRSos+/FnEe4/ZrQ7m08NvqoRVqXNrLA+bHs+0JHUO3al0OBmbwKWViR2N6
aiQlJ6msATI7LLR/rQQq3FbURc/qBW7N1/iU2Ku3vRiLAB9B+8YLWavJP405Jg6b
HKKRLcs+SoIHJrNhSJL3mxdgNFPn4mPgI0yOYQhbJhCi46KqwSCFIFgQKnckSF0/
s3Eolu84BXpzdfK2IcC6vtYZkb58c1ilfmR1dz1L8e7OGNSChb2u9GWu7Ct63pnc
qIVLwQhsKJBj+IPHBdvTDXc8mx0KDzuBLxPywVgA1JiGfMob7rN1MQE5f4hCPxE6
rEu1dvP5AUZ36euxRermIgKyp66Kfr0yRQQyK4nCaE3siFl5DN0=
=GwzS
-----END PGP SIGNATURE-----

--Sig_/Ctw.5U/B2xL9ov7X7UN21b_--

