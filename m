Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326AFC1426
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Sep 2019 12:09:15 +0200 (CEST)
Received: from localhost ([::1]:37654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iEW8f-0004UU-KB
	for lists+qemu-devel@lfdr.de; Sun, 29 Sep 2019 06:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37361)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iEW6t-0003SB-DP
 for qemu-devel@nongnu.org; Sun, 29 Sep 2019 06:07:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iEW6q-0006B9-LG
 for qemu-devel@nongnu.org; Sun, 29 Sep 2019 06:07:22 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:56361 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iEW6p-000622-QP; Sun, 29 Sep 2019 06:07:20 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46h1RM65yzz9sDB; Sun, 29 Sep 2019 20:07:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1569751631;
 bh=h//Y46NiPXegcnsQmuiMn+YsBahoo6Q2HdTzPbirrY4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=POymn1P14HqNg4Rh4yQGrOduw/ADVwQ3DM3ZnCihToEhS0Vf/0RghBTGvtDdBRMea
 QtqinY3RCRLRxfGj+t/tIjV6XVQyytwo3pMLY/XT6PXxpce6uAg30jHhYhSYF32a4H
 Ga8eQqS5qvFl8j9DKoygT4j28SUdo+8sLmTlFNos=
Date: Sun, 29 Sep 2019 19:34:38 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 20/20] spapr: Eliminate SpaprIrq::init hook
Message-ID: <20190929093438.GD12116@umbus.fritz.box>
References: <20190925064534.19155-1-david@gibson.dropbear.id.au>
 <20190925064534.19155-21-david@gibson.dropbear.id.au>
 <20190926173937.302ec223@bahia.lan>
 <20190927161240.69f63705@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HWvPVVuAAfuRc6SZ"
Content-Disposition: inline
In-Reply-To: <20190927161240.69f63705@bahia.lan>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: Jason Wang <jasowang@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 clg@kaod.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--HWvPVVuAAfuRc6SZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2019 at 04:12:40PM +0200, Greg Kurz wrote:
> On Thu, 26 Sep 2019 17:39:37 +0200
> Greg Kurz <groug@kaod.org> wrote:
>=20
> > On Wed, 25 Sep 2019 16:45:34 +1000
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >=20
> > > This method is used to set up the interrupt backends for the current
> > > configuration.  However, this means some confusing redirection between
> > > the "dual" mode init and the init hooks for xics only and xive only m=
odes.
> > >=20
> > > Since we now have simple flags indicating whether XICS and/or XIVE are
> > > supported, it's easier to just open code each initialization directly=
 in
> > > spapr_irq_init().  This will also make some future cleanups simpler.
> > >=20
> > > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > > ---
> >=20
> > Reviewed-by: Greg Kurz <groug@kaod.org>
> >=20
>=20
> Just one nit...
>=20
> > >  hw/ppc/spapr_irq.c          | 138 ++++++++++++++++------------------=
--
> > >  include/hw/ppc/spapr_irq.h  |   1 -
> > >  include/hw/ppc/xics_spapr.h |   1 +
> [...]
> > > diff --git a/include/hw/ppc/xics_spapr.h b/include/hw/ppc/xics_spapr.h
> > > index 691a6d00f7..267984a97b 100644
> > > --- a/include/hw/ppc/xics_spapr.h
> > > +++ b/include/hw/ppc/xics_spapr.h
> > > @@ -34,6 +34,7 @@
> > >  #define TYPE_ICS_SPAPR "ics-spapr"
> > >  #define ICS_SPAPR(obj) OBJECT_CHECK(ICSState, (obj), TYPE_ICS_SPAPR)
> > > =20
> > > +void ics_spapr_create(SpaprMachineState *spapr, int nr_xirqs, Error =
**errp);
>=20
> ... this looks like a leftover.

Oops, yes, fixed.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--HWvPVVuAAfuRc6SZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl2Qeq4ACgkQbDjKyiDZ
s5Lk7xAAuScYt02HVD7fhW1h02qE9ICX4v4Mn/7jbgkv4eFuwZs1f1qwAelojJIE
XvNC3naHSTHXiRBe0CVsQhz9gXtLIBmMZqQGNc4FwMOOVDv/COAdmJSBZ+/IzExD
SHRxvu4kjuJDrrdrQOCzYbFl2jddzQ/L1loWH6euaO7TlMO1mFSFzUbAK4f5eY5P
uZfP915OSEGrWCSFFvsUoCX0pPwbmZyzHuhzAjU2tz2GNU9bKuB7ZL9h8+aPC9Jg
AOiH077azb0Ky/SfEA8hCoStbEygPWEUlUwirWP1iF93TzPNF8aVYcWOyaDO+Z+k
nT7CogATZY+uCSPZ1NgC6JBWcenul5pWRN9bFZMEIExRqPN4K/3nBv8WcPpDRa1e
v5UfuiS5ydA1UhY3t8F70fptPqUPpr2WB5lJBK/B9xEeadDipgcB9y07MNYPpux9
v8RksFcn/eeshSuIeFt/1jUVbfIBD05+0m0iU58tOHSjo1iLpWc+YyCTowAbrzEU
DNoE2aJUIS/Xf0uzv48zgPZk43K2eeSth9LPUTmjfCgIOzT+cDYQEyj8MGd0kWER
Naw3ga3T71f6VTnKDbsFahMjXAQilrWpIWRmDIvFukUj2p8kZG3pQKP7ZdMtPhXq
nuVwPSheZc/myLFlIu/yaS2bLvRJkoWiwwP3S5aRYoOsIWhGiEY=
=Whut
-----END PGP SIGNATURE-----

--HWvPVVuAAfuRc6SZ--

