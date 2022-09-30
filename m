Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DABA25F0BEF
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 14:47:58 +0200 (CEST)
Received: from localhost ([::1]:55448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeFQr-0000Wv-GZ
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 08:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oeFFC-0007aV-00; Fri, 30 Sep 2022 08:36:01 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:59275
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oeFF6-0003uo-Vz; Fri, 30 Sep 2022 08:35:53 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Mf8pB5q8Lz4xGT; Fri, 30 Sep 2022 22:35:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1664541330;
 bh=ee1pBljzWkpbUXWXP7yqiExn3TUmXmcLksMqyumVWBE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P+UDUtpSTd6cjtrwZBqZP0eB+74XIv5dGLvPU3EEUPEd94x6No5oyHNKAzrHqITmk
 rCU1n9VrBnylFYK7Y6u4TWZlkGXFmUQ4sD3jOxuGoYLbs5/qELfvtS5T1okLg/9See
 ae9WvahIZFWQvpB69Dta6NPj+SP9/nEZaY+4dQLg=
Date: Fri, 30 Sep 2022 11:34:35 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] MAINTAINERS: step back from PPC
Message-ID: <YzZHq0mVCW0iTF3P@yekko>
References: <20220929180946.848721-1-clg@kaod.org>
 <20220929201340.76e1096f@bahia>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cvcewmzRYseXGEXY"
Content-Disposition: inline
In-Reply-To: <20220929201340.76e1096f@bahia>
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--cvcewmzRYseXGEXY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2022 at 08:13:40PM +0200, Greg Kurz wrote:
> On Thu, 29 Sep 2022 20:09:46 +0200
> C=E9dric Le Goater <clg@kaod.org> wrote:
>=20
> > I am not active anymore on the PPC maintainership, degrade my self as
> > standard Reviewer. Also degrade PowerNV and XIVE status since I am not
> > funded for this work.
> >=20
> > Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> > ---
>=20
> End of an era. Thank you for all the dedication and accomplishments !

Seconded.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

>=20
> Reviewed-by: Greg Kurz <groug@kaod.org>
>=20
> >  MAINTAINERS | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 1729c0901cea..40f4984b439b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -267,8 +267,8 @@ F: hw/openrisc/
> >  F: tests/tcg/openrisc/
> > =20
> >  PowerPC TCG CPUs
> > -M: C=E9dric Le Goater <clg@kaod.org>
> >  M: Daniel Henrique Barboza <danielhb413@gmail.com>
> > +R: C=E9dric Le Goater <clg@kaod.org>
> >  R: David Gibson <david@gibson.dropbear.id.au>
> >  R: Greg Kurz <groug@kaod.org>
> >  L: qemu-ppc@nongnu.org
> > @@ -392,8 +392,8 @@ F: target/mips/kvm*
> >  F: target/mips/sysemu/
> > =20
> >  PPC KVM CPUs
> > -M: C=E9dric Le Goater <clg@kaod.org>
> >  M: Daniel Henrique Barboza <danielhb413@gmail.com>
> > +R: C=E9dric Le Goater <clg@kaod.org>
> >  R: David Gibson <david@gibson.dropbear.id.au>
> >  R: Greg Kurz <groug@kaod.org>
> >  S: Maintained
> > @@ -1365,8 +1365,8 @@ F: include/hw/rtc/m48t59.h
> >  F: tests/avocado/ppc_prep_40p.py
> > =20
> >  sPAPR (pseries)
> > -M: C=E9dric Le Goater <clg@kaod.org>
> >  M: Daniel Henrique Barboza <danielhb413@gmail.com>
> > +R: C=E9dric Le Goater <clg@kaod.org>
> >  R: David Gibson <david@gibson.dropbear.id.au>
> >  R: Greg Kurz <groug@kaod.org>
> >  L: qemu-ppc@nongnu.org
> > @@ -1387,7 +1387,7 @@ F: tests/avocado/ppc_pseries.py
> >  PowerNV (Non-Virtualized)
> >  M: C=E9dric Le Goater <clg@kaod.org>
> >  L: qemu-ppc@nongnu.org
> > -S: Maintained
> > +S: Odd Fixes
> >  F: docs/system/ppc/powernv.rst
> >  F: hw/ppc/pnv*
> >  F: hw/intc/pnv*
> > @@ -2321,7 +2321,7 @@ T: git https://github.com/philmd/qemu.git fw_cfg-=
next
> >  XIVE
> >  M: C=E9dric Le Goater <clg@kaod.org>
> >  L: qemu-ppc@nongnu.org
> > -S: Supported
> > +S: Odd Fixes
> >  F: hw/*/*xive*
> >  F: include/hw/*/*xive*
> >  F: docs/*/*xive*
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cvcewmzRYseXGEXY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmM2R6IACgkQgypY4gEw
YSIzTg//YGDEUGZmnualCaH3Epj19tobkPOq/Sbf3u+8WuzwMdun7cq2ioKu4iFv
3gvBVM8WEkuKWjb6ddm08NvxegIkIxKjJdGNAC5YJuF7TAEGYvOAdgKMxD6HedH6
5ZYqEe/2vSDOnsYZHzoIyfwiwy85rZf/SCJ/aIa6boaxlWizqUbAKVER9+5d+Vru
s+Z6H7/dSI3/Meh/ekoAhCh08YParOIk7kd06qCMQ4DLFjOmGsSB2X0l2UB9NHBq
ytO2ffLcFxiXpz7FSuWGS4PWD4uowfpWgui+zm08Ux4bHTKepEhogYgpBkA2PboW
it1HgsZGqPu36xdGgr+fLrA9ckyM/Ls1j4yt3+r1/Ns8CcGy5i6OPl3b23cHEs9O
MPsksq2fyItB1t+0rPrZH9WduE2EgdfpxXlQMAuDLkoRC2amuRiEDFxx8ll1gB4c
/5WaT8LfzxhmWsipJny6BxGcWUqVEUh5NL4S1oO4/dwj884F0Ln+aiM1wDbT+X/E
50Uog+Yqe0/Bg7ut4/uWK/3UhMw6UOk+Vaad5bH9i2xKttAFpu7vKBI6vRE16bLg
W0KHjD+GpfZvGGlNK/3YrjlScEKY1zNzq+eXTL8Hm5oe7wrgeRN1mIHK/8atKp2b
rHUSY56oxTN+8b9neMfnar8MsvpCz93m5tjIHDbj64KPZVllA9g=
=hXl6
-----END PGP SIGNATURE-----

--cvcewmzRYseXGEXY--

