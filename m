Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C10540152A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 05:06:41 +0200 (CEST)
Received: from localhost ([::1]:41990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mN4y0-0007vY-J8
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 23:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mN4rn-0004Ee-QJ; Sun, 05 Sep 2021 23:00:17 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:59745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mN4rh-0007st-D9; Sun, 05 Sep 2021 23:00:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630897197;
 bh=wLFE4EAZek2dfhyM5qrkXZ+D0PngaG+n4cZ50zSqaxc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BtezX/F+Z4hMlEkDc/d9v8SSGe2RSEKorLhpqVdJhTeqGLLOgu0bFmM7N+83c0Cn9
 XXxmLljx+fTjTDPj9CYDTnft2PCp98fAd3VQslo22V7iG7HNhWC+QGK00v1j0FvZSi
 OiV7T/aL5pOhW0JO5KaoaPP6NRlJtzUUnknp7XL0=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H2tRd4tBKz9sW4; Mon,  6 Sep 2021 12:59:57 +1000 (AEST)
Date: Mon, 6 Sep 2021 10:59:14 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2 01/20] docs/system: ppc: Update the URL for OpenPOWER
 firmware images
Message-ID: <YTVn4hvjLSQowKBO@yekko>
References: <20210902130928.528803-1-clg@kaod.org>
 <20210902130928.528803-2-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8vrWCg+1bmolNBFi"
Content-Disposition: inline
In-Reply-To: <20210902130928.528803-2-clg@kaod.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_OTHER_BAD_TLD=1.999,
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--8vrWCg+1bmolNBFi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 02, 2021 at 03:09:09PM +0200, C=E9dric Le Goater wrote:
> This also fixes a small skiboot/skiroot typo and removes the links to
> the specific POWER8 and POWER9 images since the firmware images can be
> used to run all machines.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-6.2, thanks.

> ---
>=20
>  v2: fixed URL
>=20
>  docs/system/ppc/powernv.rst | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/docs/system/ppc/powernv.rst b/docs/system/ppc/powernv.rst
> index 4c4cdea527e2..86186b7d2cb7 100644
> --- a/docs/system/ppc/powernv.rst
> +++ b/docs/system/ppc/powernv.rst
> @@ -53,8 +53,7 @@ initramfs ``skiroot``. Source code can be found on GitH=
ub:
> =20
>    https://github.com/open-power.
> =20
> -Prebuilt images of ``skiboot`` and ``skiboot`` are made available on the=
 `OpenPOWER <https://openpower.xyz/job/openpower/job/openpower-op-build/>`_=
_ site. To boot a POWER9 machine, use the `witherspoon <https://openpower.x=
yz/job/openpower/job/openpower-op-build/label=3Dslave,target=3Dwitherspoon/=
lastSuccessfulBuild/>`__ images. For POWER8, use
> -the `palmetto <https://openpower.xyz/job/openpower/job/openpower-op-buil=
d/label=3Dslave,target=3Dpalmetto/lastSuccessfulBuild/>`__ images.
> +Prebuilt images of ``skiboot`` and ``skiroot`` are made available on the=
 `OpenPOWER <https://github.com/open-power/op-build/releases/>`__ site.
> =20
>  QEMU includes a prebuilt image of ``skiboot`` which is updated when a
>  more recent version is required by the models.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8vrWCg+1bmolNBFi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmE1Z+AACgkQbDjKyiDZ
s5JGzA//U7tF26uzeq4skhbqmUO3biyn++7hP/7UBWPJ7pqZFrMCRKU+OaO+jPry
dzozy8ZbndsQUAVGZ5v4DIs1+cYPF0vYmfDgkPxT5Lmo6tPnCcQe2+8iX+FDSI9M
D2h2BO2t2qCbv7Fm/00wZW2BnzEZY7vt1OeB9SAkz+ypfH7CYa7zvC3MlgJDLzwW
YziBOXtJrGRzRnCXEUyDxTv0Ylu47XDyMLu5WQo3A83ME6oXbbD2bCbknHjWAE7j
63aNo9IHwfKXS6wk6faGB8DlU7f0bSjHOHdIbooMsJVvpHVLPcSxk82d2jUSUTbR
NNZpdqEry76mweeAu6p8O7lvumM6ImiOERMaHQ+2iMeVwGzHR1UA+gvaDSRcEsOW
Z3kgG3kRna2pmEMse6CY5qhHWjBmjaNWnm2eNpol/rDTCkg3bEqPSS9mC3u/vx4V
bPlFjAW8eyOrzON1+FolPMHMrD20iJbo7rVywnBD909YAVnLhV827A4H35kDKEDr
dhr+93KkB2igFW/E5wLgkyKH5twcdfisvL6RtLiB2Lb0Vj+vTtk0sA7PRqCxxQdO
/e2aYRggqhq+UA1q7vGFBwLPL5c2y3qKxJM6urxm/LyiMs76Lugy4BTgm/b5/sGU
QsbR2OTn3WTEdA9HfxiZl2De7vFYsKRpH4UTUpt0TCRtfgc2ojg=
=2Ezo
-----END PGP SIGNATURE-----

--8vrWCg+1bmolNBFi--

