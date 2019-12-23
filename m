Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 742B81291D2
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Dec 2019 07:14:28 +0100 (CET)
Received: from localhost ([::1]:53784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ijGz5-0000yU-AU
	for lists+qemu-devel@lfdr.de; Mon, 23 Dec 2019 01:14:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54469)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ijGxY-0008AJ-54
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 01:12:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ijGxW-0007PV-Fe
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 01:12:51 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:41855 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ijGxV-000789-Ai; Mon, 23 Dec 2019 01:12:50 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47h8Cc5t77z9sR1; Mon, 23 Dec 2019 17:12:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1577081564;
 bh=Le+jgYsHUYmmNbEqSW/dA0TYp4WwPgU3fuWrhCGD7Q8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qNeFmk1wlQMNRpR4BODbFA+tz/QibnskCT3Hv2Fs3GC3S3hNRXg1UhoYqJs6BqP8t
 z5Jo9+/L7g6bG1AJWT2mxQt4BX++ds9q7lB3ncGaQMoYyxjApU6kGHR+Iqf4CNfQq1
 Ch05kLettsvs2/HKohij3Exso7DuCZu/tRFQzVZU=
Date: Mon, 23 Dec 2019 17:10:16 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2 07/13] spapr, pnv, xive: Add a "xive-fabric" link to
 the XIVE router
Message-ID: <20191223061016.GC38380@umbus.modem>
References: <20191219181155.32530-1-clg@kaod.org>
 <20191219181155.32530-8-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OBd5C1Lgu00Gd/Tn"
Content-Disposition: inline
In-Reply-To: <20191219181155.32530-8-clg@kaod.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--OBd5C1Lgu00Gd/Tn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2019 at 07:11:49PM +0100, C=E9dric Le Goater wrote:
> From: Greg Kurz <groug@kaod.org>
>=20
> In order to get rid of qdev_get_machine(), first add a pointer to the
> XIVE fabric under the XIVE router and make it configurable through a
> QOM link property.
>=20
> Configure it in the spapr and pnv machine. In the case of pnv, the XIVE
> routers are under the chip, so this is done with a QOM alias property of
> the POWER9 pnv chip.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

LGTM, but will need rebase.

> ---
>  include/hw/ppc/xive.h | 5 +++--
>  hw/intc/xive.c        | 8 ++++++++
>  hw/ppc/pnv.c          | 6 ++++++
>  hw/ppc/spapr_irq.c    | 2 ++
>  4 files changed, 19 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
> index 1b7b89098f71..1ded82b1cda8 100644
> --- a/include/hw/ppc/xive.h
> +++ b/include/hw/ppc/xive.h
> @@ -324,9 +324,12 @@ typedef struct XiveTCTX {
>  /*
>   * XIVE Router
>   */
> +typedef struct XiveFabric XiveFabric;
> =20
>  typedef struct XiveRouter {
>      SysBusDevice    parent;
> +
> +    XiveFabric *xfb;
>  } XiveRouter;
> =20
>  #define TYPE_XIVE_ROUTER "xive-router"
> @@ -402,8 +405,6 @@ int xive_presenter_tctx_match(XivePresenter *xptr, Xi=
veTCTX *tctx,
>   * XIVE Fabric (Interface between Interrupt Controller and Machine)
>   */
> =20
> -typedef struct XiveFabric XiveFabric;
> -
>  #define TYPE_XIVE_FABRIC "xive-fabric"
>  #define XIVE_FABRIC(obj)                                     \
>      INTERFACE_CHECK(XiveFabric, (obj), TYPE_XIVE_FABRIC)
> diff --git a/hw/intc/xive.c b/hw/intc/xive.c
> index d4c6e21703b3..6df89b06da38 100644
> --- a/hw/intc/xive.c
> +++ b/hw/intc/xive.c
> @@ -1714,12 +1714,19 @@ void xive_router_notify(XiveNotifier *xn, uint32_=
t lisn)
>                             xive_get_field64(EAS_END_DATA,  eas.w));
>  }
> =20
> +static Property xive_router_properties[] =3D {
> +    DEFINE_PROP_LINK("xive-fabric", XiveRouter, xfb,
> +                     TYPE_XIVE_FABRIC, XiveFabric *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  static void xive_router_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>      XiveNotifierClass *xnc =3D XIVE_NOTIFIER_CLASS(klass);
> =20
>      dc->desc    =3D "XIVE Router Engine";
> +    dc->props   =3D xive_router_properties;
>      xnc->notify =3D xive_router_notify;
>  }
> =20
> @@ -1727,6 +1734,7 @@ static const TypeInfo xive_router_info =3D {
>      .name          =3D TYPE_XIVE_ROUTER,
>      .parent        =3D TYPE_SYS_BUS_DEVICE,
>      .abstract      =3D true,
> +    .instance_size =3D sizeof(XiveRouter),
>      .class_size    =3D sizeof(XiveRouterClass),
>      .class_init    =3D xive_router_class_init,
>      .interfaces    =3D (InterfaceInfo[]) {
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 2a1b15a69aed..915c80a24b3e 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -804,6 +804,10 @@ static void pnv_init(MachineState *machine)
>          if (object_dynamic_cast(OBJECT(pnv), TYPE_XICS_FABRIC)) {
>              object_property_set_link(chip, OBJECT(pnv), "xics", &error_a=
bort);
>          }
> +        if (object_dynamic_cast(OBJECT(pnv), TYPE_XIVE_FABRIC)) {
> +            object_property_set_link(chip, OBJECT(pnv), "xive-fabric",
> +                                     &error_abort);
> +        }
>          object_property_set_bool(chip, true, "realized", &error_fatal);
>      }
>      g_free(chip_typename);
> @@ -1224,6 +1228,8 @@ static void pnv_chip_power9_instance_init(Object *o=
bj)
> =20
>      object_initialize_child(obj, "xive", &chip9->xive, sizeof(chip9->xiv=
e),
>                              TYPE_PNV_XIVE, &error_abort, NULL);
> +    object_property_add_alias(obj, "xive-fabric", OBJECT(&chip9->xive),
> +                              "xive-fabric", &error_abort);
> =20
>      object_initialize_child(obj, "psi",  &chip9->psi, sizeof(chip9->psi),
>                              TYPE_PNV9_PSI, &error_abort, NULL);
> diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
> index 07e08d6544a0..2b656649ad6a 100644
> --- a/hw/ppc/spapr_irq.c
> +++ b/hw/ppc/spapr_irq.c
> @@ -340,6 +340,8 @@ void spapr_irq_init(SpaprMachineState *spapr, Error *=
*errp)
>           * priority
>           */
>          qdev_prop_set_uint32(dev, "nr-ends", nr_servers << 3);
> +        object_property_set_link(OBJECT(dev), OBJECT(spapr), "xive-fabri=
c",
> +                                 &error_abort);
>          qdev_init_nofail(dev);
> =20
>          spapr->xive =3D SPAPR_XIVE(dev);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--OBd5C1Lgu00Gd/Tn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4AWkgACgkQbDjKyiDZ
s5In5xAAkYD4ANcSsqnyRFx2DWP9vzrTAZ8hbsvKUbBwTGiflToIRkqvepiSqZ4T
8bnWVlX8Q8fuJ66ffiKFu7iFSYJUdpkgSqkCbCFBZlvtnWi47UNobhSpVDVECqHK
2fdYCJ8lKpTYEmtJpDdbHLpxSZXrALWYZkK9I4sbw2jRfEkp4WB3c1EKgsPCw/6X
iu+k9HPs2sWbId4FlirX1ecoAQA6aOX7enFSgAaP4FHO9SBovAi6KYSVzyqW8DeR
2YuMDFG5w5DoE9vFA1ZImzwJyaf8c1PLyNY9jlEJ5jIM6MN8tb08G0lqqYU8TwFL
BUwyMD8Cyne9TJ09hUCJ5bEmDffJ23FyEDkn/n8+veBUFy4+LycEeo0/nf9bFqVx
xWJIurxi+UxEufHRo7rLc9Ej8D+T/l3lGNiXlfd/1dCoMSJtPtfr4HxQ7klGVCKA
PIZB/zA2RbEcAVnK9siMizFva4ryHWMDUsBDdxdGpMU8+eVQUqixH2T3wsQmt93H
+h8FmLeapAlMN3GRZida4IEZ21D2kE8LHgRLniRvnbN/RNHvRO3ZhAnmn7db2+i7
a496apcPIxrN57h54x8EYi959XNHKAG2OuhwAn2eVsJfKBMsqnc0XFT1Za7odMQ/
55yQonvIHaTzeLHbXu1j1rXq4phAxg0QsrQPaPSSRRodTuS1/k0=
=tadb
-----END PGP SIGNATURE-----

--OBd5C1Lgu00Gd/Tn--

