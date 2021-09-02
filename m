Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B1A3FE800
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 05:30:09 +0200 (CEST)
Received: from localhost ([::1]:50076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLdQW-0004k3-A0
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 23:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mLdLV-0001Vx-G3; Wed, 01 Sep 2021 23:24:57 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:45157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mLdLJ-0008N6-Hm; Wed, 01 Sep 2021 23:24:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630553072;
 bh=19LHykAV4vy4m0ZwydJDio0l4ncV/WPwoAp6b2X6z4w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HFabUXrDftsUfX0EHrDuOsXcIBsVg1hvX0eToVnrcXBVtI2qrnCRbTYO8KXYmnOJ6
 bwMVd6+i/irKNzyh6K+DlpBj3ndH2shUcty4ii+ezfTzFQG+wk3lHKhf54c+0ItwBe
 lhVy6JmdYUIWfBPVxz0MEiEscz0cRYd4UcC27uRY=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H0R9r0gRzz9sXk; Thu,  2 Sep 2021 13:24:32 +1000 (AEST)
Date: Thu, 2 Sep 2021 11:36:04 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 3/8] ppc/pnv: Add a comment on the
 "primary-topology-index" property
Message-ID: <YTAqhIE2Rrf0IqxO@yekko>
References: <20210901094153.227671-1-clg@kaod.org>
 <20210901094153.227671-4-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aQOxIXzrwcNtYX4K"
Content-Disposition: inline
In-Reply-To: <20210901094153.227671-4-clg@kaod.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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


--aQOxIXzrwcNtYX4K
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 01, 2021 at 11:41:48AM +0200, C=E9dric Le Goater wrote:
> On P10, the chip id is calculated from the "Primary topology table
> index". See skiboot commits for more information [1].
>=20
> This information is extracted from the hdata on real systems which
> QEMU needs to emulate. Add this property for all machines even if it
> is only used on POWER10.
>=20
> [1] https://github.com/open-power/skiboot/commit/2ce3f083f399
>     https://github.com/open-power/skiboot/commit/a2d4d7f9e14a
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-6.2, thanks.

> ---
>  hw/ppc/pnv_xscom.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/hw/ppc/pnv_xscom.c b/hw/ppc/pnv_xscom.c
> index faa488e3117a..9ce018dbc279 100644
> --- a/hw/ppc/pnv_xscom.c
> +++ b/hw/ppc/pnv_xscom.c
> @@ -284,6 +284,10 @@ int pnv_dt_xscom(PnvChip *chip, void *fdt, int root_=
offset,
>      _FDT(xscom_offset);
>      g_free(name);
>      _FDT((fdt_setprop_cell(fdt, xscom_offset, "ibm,chip-id", chip->chip_=
id)));
> +    /*
> +     * On P10, the xscom bus id has been deprecated and the chip id is
> +     * calculated from the "Primary topology table index". See skiboot.
> +     */
>      _FDT((fdt_setprop_cell(fdt, xscom_offset, "ibm,primary-topology-inde=
x",
>                             chip->chip_id)));
>      _FDT((fdt_setprop_cell(fdt, xscom_offset, "#address-cells", 1)));

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--aQOxIXzrwcNtYX4K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEwKoQACgkQbDjKyiDZ
s5L5nw/+NZ6eCIC0GXJVhtmXF6GKyVMmIiEXfC1zB3xDaeWJlk+0RotTEo0kmD1A
dRE5zfzu2VOumlQnywVGImv1EO6yHBiRtSFCJVy58Btyumf9Jfw97OZMWcmsP0nD
OH/epznBxuY0WWRLV4DICn/3GoN818qYYnWG8JvuuNKRpal8l37ywizs5z3UaHa8
qX3R+ezS3rrWJbMufEX74XLoonFpy4Es+MhI0fqMeKp5V5s8WEjCouecDHr59OZd
jFGmI2RAQtY2X3aG2jS+DShvoRTpvuKamw2Ky3q5Ky8WEoJSiPx5nxQeZsVW8CvR
nYrtNXfZJnJCwNMf1lnT0IT0JL6UkRatxq7plu7WWQYw+60/BqoxJMt6R9O3iBHj
h0nIo8SqmOdH/2VUzn5zLT9f3Z5CH1IApuJHzVXT+ujhuEg5DxozUEISZvyyBMDL
t4QMkz7vL9YHjUlIFl6mMqASnd6QbePBsyfZ5T6q/8m3S/J2JA5yI/YweLFIjv45
4DiNZ+sBChpUDeqMYldyMTBGw6AMXfl+fLf0Frn3K2dXjurdyPaS6x6v9JQh5JTL
vvbqBWtSpFypFzH6uoIxoF33BfrGNBey+4zlzx7nDV8cvMwsLbyObZucmyHM3P0M
+2pWqyavvuRtjhxZABZ2h27kP4cOGhQUpSxGvZRUtY+5EocN/TI=
=IFsF
-----END PGP SIGNATURE-----

--aQOxIXzrwcNtYX4K--

