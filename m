Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD493E51FB
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 06:24:59 +0200 (CEST)
Received: from localhost ([::1]:53106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDJJy-0000p6-8O
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 00:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDq-00084w-Ii; Tue, 10 Aug 2021 00:18:38 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44647 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDk-000291-Sy; Tue, 10 Aug 2021 00:18:38 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GkKSQ4zynz9t1r; Tue, 10 Aug 2021 14:18:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628569094;
 bh=LmmPLUTAIu5k4aIuQXdN2JtfS2r97DogovE+CFFOR10=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yf1MVv1Hnd2RDi+WwmMIfIfmKu9ibQIdsSOMZIILYN5s7CR0+ojOkJIj3fgty/Wn8
 ZrTRy8xMmR6V3H7jbXQTTD/oiTc/Jxiv8TeIoAwM/NQLPoSiQ3RG3LXtjSGbIVe3Py
 aURBFIi6yDTqlEG7YturxfrFnK9FXREN64HEf+qw=
Date: Tue, 10 Aug 2021 11:03:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH for-6.2 v6 6/7] spapr: use DEVICE_UNPLUG_ERROR to report
 unplug errors
Message-ID: <YRHQYeYixhhcZFuV@yekko>
References: <20210719200827.1507276-1-danielhb413@gmail.com>
 <20210719200827.1507276-7-danielhb413@gmail.com>
 <87a6ltbb7w.fsf@dusky.pond.sub.org>
 <f0a87e8b-abee-ae02-e0c5-772dd5e08dd3@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nRMGhGqYWXBJ9L5F"
Content-Disposition: inline
In-Reply-To: <f0a87e8b-abee-ae02-e0c5-772dd5e08dd3@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: 17
X-Spam_score: 1.7
X-Spam_bar: +
X-Spam_report: (1.7 / 5.0 requ) DATE_IN_PAST_03_06=1.592, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: groug@kaod.org, qemu-ppc@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--nRMGhGqYWXBJ9L5F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 03:47:14PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 8/7/21 11:06 AM, Markus Armbruster wrote:
> > Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> >=20
> > > Linux Kernel 5.12 is now unisolating CPU DRCs in the device_removal
> > > error path, signalling that the hotunplug process wasn't successful.
> > > This allow us to send a DEVICE_UNPLUG_ERROR in drc_unisolate_logical()
> > > to signal this error to the management layer.
> > >=20
> > > We also have another error path in spapr_memory_unplug_rollback() for
> > > configured LMB DRCs. Kernels older than 5.13 will not unisolate the L=
MBs
> > > in the hotunplug error path, but it will reconfigure them. Let's send
> > > the DEVICE_UNPLUG_ERROR event in that code path as well to cover the
> > > case of older kernels.
> > >=20
> > > Reviewed-by: Greg Kurz <groug@kaod.org>
> > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > ---
> > >   hw/ppc/spapr.c     |  9 ++++++++-
> > >   hw/ppc/spapr_drc.c | 18 ++++++++++++------
> > >   2 files changed, 20 insertions(+), 7 deletions(-)
> > >=20
> > > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > > index 1611d7ab05..5459f9a7e9 100644
> > > --- a/hw/ppc/spapr.c
> > > +++ b/hw/ppc/spapr.c
> > > @@ -29,6 +29,7 @@
> > >   #include "qemu/datadir.h"
> > >   #include "qapi/error.h"
> > >   #include "qapi/qapi-events-machine.h"
> > > +#include "qapi/qapi-events-qdev.h"
> > >   #include "qapi/visitor.h"
> > >   #include "sysemu/sysemu.h"
> > >   #include "sysemu/hostmem.h"
> > > @@ -3686,13 +3687,19 @@ void spapr_memory_unplug_rollback(SpaprMachin=
eState *spapr, DeviceState *dev)
> > >       /*
> > >        * Tell QAPI that something happened and the memory
> > > -     * hotunplug wasn't successful.
> > > +     * hotunplug wasn't successful. Keep sending
> > > +     * MEM_UNPLUG_ERROR even while sending DEVICE_UNPLUG_ERROR
> > > +     * until the deprecation MEM_UNPLUG_ERROR is due.
> > >        */
> > >       if (dev->id) {
> > >           qapi_error =3D g_strdup_printf("Memory hotunplug rejected b=
y the guest "
> > >                                        "for device %s", dev->id);
> > >           qapi_event_send_mem_unplug_error(dev->id, qapi_error);
> > >       }
> > > +
> > > +    qapi_event_send_device_unplug_error(!!dev->id, dev->id,
> > > +                                        dev->canonical_path,
> > > +                                        qapi_error !=3D NULL, qapi_e=
rror);
> > >   }
> >=20
> > When dev->id is null, we send something like
> >=20
> >      {"event": "DEVICE_UNPLUG_ERROR",
> >       "data": {"path": "/machine/..."},
> >       "timestamp": ...}
> >=20
> > Unless I'm missing something, this is all the information the management
> > application really needs.
> >=20
> > When dev->id is non-null, we add to "data":
> >=20
> >                "device": "dev123",
> >                "msg": "Memory hotunplug rejected by the guest for devic=
e dev123",
> >=20
> > I'm fine with emitting the device ID when we have it.
> >=20
> > What's the intended use of "msg"?
> >=20
> > Could DEVICE_UNPLUG_ERROR ever be emitted for this device with a
> > different "msg"?
>=20
>=20
> It won't have a different 'msg' for the current use of the event in both =
ppc64
> and x86. It'll always be the same '<dev> hotunplug rejected by the guest'
> message.
>=20
> The idea is that a future caller might want to insert a more informative
> message, such as "hotunplug failed: memory is being used by kernel space"
> or any other more specific condition. But then I guess we can argue that,
> if that time comes, one can just add this new optional 'msg' member in th=
is
> event, and for now we can live without it.

Right.  We could also consider making the current message more
specific about why we chose to cancel the unplug: e.g. "guest
unisolated DRC after unplug request" for PAPR, and something
appropriate to the ACPI specifics for x86.  Not sure if that's useful
enough to justify it.

> Would you oppose to renaming this new event to "DEVICE_UNPLUG_GUEST_ERROR"
> and then remove the 'msg' member? I guess this rename would make it clear=
er
> for management that we're reporting a guest side error, making any further
> clarifications via 'msg' unneeded.
>=20
>=20
> Thanks,
>=20
>=20
> Daniel
>=20
>=20
>=20
>=20
> >=20
> > If "msg" is useful when dev->id is non-null, then it's likely useful
> > when dev->id is null.  Why not
> >=20
> >                "msg": "Memory hotunplug rejected by the guest",
> >=20
> > always?
> >=20
> > If we do that here, we'll likely do it everywhere, and then member @msg
> > isn't actually optional.
> >=20
> > >   /* Callback to be called during DRC release. */
> > > diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> > > index a4d9496f76..8f0479631f 100644
> > > --- a/hw/ppc/spapr_drc.c
> > > +++ b/hw/ppc/spapr_drc.c
> > > @@ -17,6 +17,8 @@
> > >   #include "hw/ppc/spapr_drc.h"
> > >   #include "qom/object.h"
> > >   #include "migration/vmstate.h"
> > > +#include "qapi/error.h"
> > > +#include "qapi/qapi-events-qdev.h"
> > >   #include "qapi/visitor.h"
> > >   #include "qemu/error-report.h"
> > >   #include "hw/ppc/spapr.h" /* for RTAS return codes */
> > > @@ -160,6 +162,11 @@ static uint32_t drc_unisolate_logical(SpaprDrc *=
drc)
> > >            * means that the kernel is refusing the removal.
> > >            */
> > >           if (drc->unplug_requested && drc->dev) {
> > > +            const char qapi_error_fmt[] =3D \
> >=20
> > Drop the superfluous \
> >=20
> > > +"Device hotunplug rejected by the guest for device %s";
> >=20
> > Unusual indentation.
> >=20
> > > +
> > > +            g_autofree char *qapi_error =3D NULL;
> > > +
> > >               if (spapr_drc_type(drc) =3D=3D SPAPR_DR_CONNECTOR_TYPE_=
LMB) {
> > >                   spapr =3D SPAPR_MACHINE(qdev_get_machine());
> > > @@ -169,14 +176,13 @@ static uint32_t drc_unisolate_logical(SpaprDrc =
*drc)
> > >               drc->unplug_requested =3D false;
> > >               if (drc->dev->id) {
> > > -                error_report("Device hotunplug rejected by the guest=
 "
> > > -                             "for device %s", drc->dev->id);
> > > +                qapi_error =3D g_strdup_printf(qapi_error_fmt, drc->=
dev->id);
> > > +                error_report(qapi_error_fmt, drc->dev->id);
> >=20
> > Simpler:
> >=20
> >                     qapi_error =3D ...
> >                     error_report("%s", qapi_error);
> >=20
> > Matter of taste.  Maintainer decides.
> >=20
> > >               }
> > > -            /*
> > > -             * TODO: send a QAPI DEVICE_UNPLUG_ERROR event when
> > > -             * it is implemented.
> > > -             */
> > > +            qapi_event_send_device_unplug_error(!!drc->dev->id, drc-=
>dev->id,
> > > +                                                drc->dev->canonical_=
path,
> > > +                                                qapi_error !=3D NULL=
, qapi_error);
> >=20
> > My questions on "msg" apply.
> >=20
> > >           }
> > >           return RTAS_OUT_SUCCESS; /* Nothing to do */
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--nRMGhGqYWXBJ9L5F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmER0GEACgkQbDjKyiDZ
s5K5vw//T23RrjKzMdrwm9Lw8KNzReSVFWvFYhbeRMWP1RgXwMV2slQ+CJdU2T/3
aIkKMwxgyqddQtBjiIMgM+uHG2kuXTtzNOLDxLs8rxgZ+9XxtmnTasPiMPYk9f5q
4oDkWO87djuBjDytvMxDUfy7Ve/w8X/gjsDa9w1CDsIHj+6kMQ+lnDKqmX54HXHs
nDOQypAw2nvycYY1IGHkihdS0bZhvfUID2PrXDWdo7dTzdLo7z9n/Lls6a2jrME5
yAE35k6iq813Ibn7V1YI+4/AJM6FM8wCtAPYJx9x8gtPAnyfAE/K23b4zwenEhDE
hawfwjuQilDggmLgxJeU+m2SULL9F2fDp9IJCZU8F9FUqApoTbzVTTdJuTUiwqvb
/pn0MJaAy/doVLno/0ExI0MfTxWk6bLVs65Q9Qj5hq2CSXicUcbEnCROmF1Lvgd4
A0OJ/NZh/jED30YS8/d1heUHTfGtsVrimecHEG8Ioathg3M2q9LMOi2LMemUhtkU
ZGryOD3py+rQOrkitldu9JQcoW+1/5AE2GcSIpe+7Sn63XPzLXSewDReQ9Ai+5bP
GSXlzTvcCS8N2Rr11pysiKUft6xwFg7gsM8+RZX5TFMW7Uzv0NrYj44lol60beqP
daaioWgxLF4B76v064KqNdc2JZistZ3M0D0ieaddm1kgcs8hVCo=
=TTV5
-----END PGP SIGNATURE-----

--nRMGhGqYWXBJ9L5F--

