Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 843FC380106
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 02:01:07 +0200 (CEST)
Received: from localhost ([::1]:40798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhLGM-0006XH-Cv
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 20:01:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lhLEB-0003r4-GS; Thu, 13 May 2021 19:58:51 -0400
Received: from ozlabs.org ([203.11.71.1]:44313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lhLE9-0007o8-8H; Thu, 13 May 2021 19:58:51 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fh7sd3117z9sX1; Fri, 14 May 2021 09:58:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620950325;
 bh=Dpo1G/G7sAFyYj6n9n3neR0gB48ZfFSUGw5Zjl3m0aM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cFomokIi9OAW8Jy+tJFeOdq2Z1fSQUFXzvfaqSaS9snGnqW+6mGV5mRhsSMTYX3rc
 2/L0MlIX6ecZm+ban8PWoOZMJsSYPprJ+gOqW2GtpFlhofHZNaHtpq8Gnoye5Sw0gi
 Cfi3ub/WCfgeZqplu/sSiQ/YEGoWWQZOxivMxrUI=
Date: Fri, 14 May 2021 09:35:31 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 4/5] hw/ppc/fdt: Drop dependency on libfdt
Message-ID: <YJ23w6xb2HxjWZIE@yekko>
References: <20210511155354.3069141-1-philmd@redhat.com>
 <20210511155354.3069141-5-philmd@redhat.com>
 <YJs938JVdO5SRYSs@yekko>
 <ead2acca-d3da-89e5-52f6-e8ae14f6e85f@redhat.com>
 <YJyg+h7NC2ktmHSx@yekko>
 <6a06ae7d-1010-69bc-8931-364d2655e850@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YNbETgu0hGTVA2xE"
Content-Disposition: inline
In-Reply-To: <6a06ae7d-1010-69bc-8931-364d2655e850@redhat.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--YNbETgu0hGTVA2xE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2021 at 05:26:37PM +0200, Paolo Bonzini wrote:
> On 13/05/21 05:46, David Gibson wrote:
> > > The patch makes sense in general.  The file is only needed for pserie=
s and
> > > powernv, not for e.g. e500 which does need fdt.
> >=20
> > Yes, agreed.
> >=20
> > > I would get rid of FDT_PPC completely.  First, before patch 3, you ca=
n move
> > > fdt.c to PSERIES and POWERNV (it's too small to need its own Kconfig =
symbol)
> > > and only leave
> > >=20
> > >     ppc_ss.add(when: 'CONFIG_FDT_PPC', if_true: fdt)
> >=20
> > Uh... why do we need even this?
>=20
> To tell Meson that a board requires QEMU to be linked with libfdt.  This
> symbol is then renamed to CONFIG_LIBFDT once it can be used with all targ=
ets
> (rather than just hw/ppc).

Oh, I thought CONFIG_LIBFDT already did that.

> > > Since you are at it, remove the silly #ifdef TARGET_PPC64 in the
> > > hw/ppc/fdt.c file.
> > >=20
> > > Then in patch 3:
> > >=20
> > > - add to Kconfig.host
> > >=20
> > >      config FDT
> > >         bool
> > >=20
> > >      config LIBFDT
> > >         bool
> > >         depends on FDT
> >=20
> > Um.. I'm not sure what semantic difference you're envisaging between
> > FDT and LIBFDT.
>=20
> "FDT" is set by meson.build if the library is available, LIBFDT is set by
> the board to link with the library.  In other words CONFIG_FDT is per-bui=
ld,
> while CONFIG_LIBFDT is per-target.

Oof... that's highly non-obvious.  Could we call it HAVE_LIBFDT and
USE_LIBFDT instead?

> If a board selects LIBFDT but the library is not available, minikconf will
> report a contradiction due to "CONFIG_PSERIES=3Dy" -> "config PSERIES sel=
ect
> LIBFDT" -> "config LIBFDT depends on FDT" ->  "CONFIG_FDT=3Dn".
>=20
> > > - for all the boards I listed in my review, add "select LIBFDT" in ad=
dition
> > > to "depends on FDT".
>=20
> This is actually unnecessary---"depends on FDT" is not needed in the boar=
ds
> because LIBFDT already has the dependency.
>=20
> Paolo
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--YNbETgu0hGTVA2xE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCdt8MACgkQbDjKyiDZ
s5JJlRAAzdCXlJdP/yOdcBZlAgljmrBLvAT89lETzLZ6nO4kJSvXt9vSeZhURrrf
slE/nh9ZlYtApkTwzwVOTkpROZoIFug3lTgjv+/zE6wkoJ1Y4+nnUkzbFdy10OaC
3hZbYuyhIhuDgK69oaCyJpGVePZhlTNgOxKWqhDyK7jWTeq5azeEDMiLgw+dDbQQ
slbQLPfLsEd4l9js+LruffbIg/oHjiGqurjn6qiuFlBkohZUMcNK+JjZCOt1aYZ4
y59l/M1mr2xBDO/cGwh8Kop7iLMNda1x6OriTdjJDy5BQO1e2MOFMCHF4D8xayT9
qSvSHiVFfGMqZJtobw0RmtDDFWb/oAYyvQAR3vJUN4MxX67ZiB30VbI+VxHy+eT1
Cfp3fZuVxw11ol5mswOPeVHnUcI3ocQrJQVkuAxo8dEbr9Z+BCptpnImCf+Eh7nk
tfvbjjZtSSatgEzb9RRSeKUtIklSY8st6Q1zGGh5m2zBKUBh22JbWEcHNM/2A+CK
hIKKY/5C0LJe1VJ3UzmRurByTdV3qUPpCi2ECUe1oHfNms1VzATMRtX2wHC54hON
vT/MWd/wEPvUW0YFBOYLx87CD1dOK3tW3+ZYl6sIs6XYKahY85XeReSBVqQAbsSC
Rcwwg8Xpm5hFg6zjRM5487s8ny5j5VcrjdZ0NTfJJ5aLKgh78Mw=
=aa+q
-----END PGP SIGNATURE-----

--YNbETgu0hGTVA2xE--

