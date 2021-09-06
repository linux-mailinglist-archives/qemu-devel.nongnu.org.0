Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CD5401528
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 05:05:58 +0200 (CEST)
Received: from localhost ([::1]:40694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mN4xJ-00075T-B9
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 23:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mN4rk-0004E7-NL; Sun, 05 Sep 2021 23:00:12 -0400
Received: from ozlabs.org ([203.11.71.1]:52453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mN4rh-0007sq-DF; Sun, 05 Sep 2021 23:00:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630897197;
 bh=sU+mDtDOrNeGbE7HxE9QdUvDu/tdpayTOL8azhMKxos=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XxKfHshVliZFBoJLcRa1bsCfHQG0UU7SS0GrjZjL5cByApCQfJ+16VpJWfwsj5IgC
 MM3zKGJ/m7/RGnJ/x8jL81ZfMSCb8LJWsJ7bM1v9YVTWt/L5tlUFFPH9tkGyCdGc5k
 wiI7pj5w042c7FqMkIAufuMrjHqCIf2ZogYZLetc=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H2tRd5TMqz9sRf; Mon,  6 Sep 2021 12:59:57 +1000 (AEST)
Date: Mon, 6 Sep 2021 10:59:54 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2 02/20] ppc/pnv: Add an assert when calculating the RAM
 distribution on chips
Message-ID: <YTVoClNf2FsZbqBS@yekko>
References: <20210902130928.528803-1-clg@kaod.org>
 <20210902130928.528803-3-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ksknFjzTxFZbssZA"
Content-Disposition: inline
In-Reply-To: <20210902130928.528803-3-clg@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ksknFjzTxFZbssZA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 02, 2021 at 03:09:10PM +0200, C=E9dric Le Goater wrote:
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-6.2, thanks.

> ---
>=20
>  v2: fixed assert value ...
>=20
>  hw/ppc/pnv.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 03c86508d2f7..71e45515f136 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -723,6 +723,8 @@ static uint64_t pnv_chip_get_ram_size(PnvMachineState=
 *pnv, int chip_id)
>          return QEMU_ALIGN_DOWN(ram_per_chip, 1 * MiB);
>      }
> =20
> +    assert(pnv->num_chips > 1);
> +
>      ram_per_chip =3D (machine->ram_size - 1 * GiB) / (pnv->num_chips - 1=
);
>      return chip_id =3D=3D 0 ? 1 * GiB : QEMU_ALIGN_DOWN(ram_per_chip, 1 =
* MiB);
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ksknFjzTxFZbssZA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmE1aAoACgkQbDjKyiDZ
s5KPMQ/+Iez54CpVYacEBRy3AWhToIU1P9aP7/dk/Fg57TZLP2oWBsNBK8pUMzQR
HWKu0os2SPzSunm3AwBOPaBY44jRj8QcYmGqV8q+uB7j0xxKDH442r2qfyv16j1h
D5f0rWltwNJqF/NQlEVLiPDDUJeElEObr5w0/fkL1mi548ArWjb2Kmj6i9XoG2F3
OIJC+L/AVJlK17jQHlLT56zox3Y0sp2pjrUtmm7H2riK64SPDolprVs5j182WOOT
bAc0Mr5mrTSy4vex6AMlweFU7c74TSckdm65AocXpvZIyFNisGLS2PYPnekNroLQ
uw8IDDa/+GeKVQGPXXrWfOrWGnsVcIP/nJhnr6zjMGOw2R0MPCXevQHl5wbSvKPv
7AQBfSwRpHcQ40bMl5dRP59A5R2DiJ0eZU1g/7TqQ+6okbNRtMhWwgdHYF7MSbM7
VWIQU+mV41H7Ac8tc/9h5vthS9pTNqvarlUjmW1DO8SYgcqAxmLxX+u6gNEsXEqp
YqWL9y6VGvJRxjZ+o7p+6M8MA9c1dNn5AjeXjipA3gRROpl0hUUls5NwxjEloS7M
/Bzb9OWTE9v0dlp6mLCnJQ+GFPGzbdGkNFg+zEq7f7g82DfBCVx/0m8bJ9smaOhb
mAwMS4IzYbKvNDJvxzWRVe3Amq6x3HfDw1Doaea+Y9HTm0mUV3U=
=We+F
-----END PGP SIGNATURE-----

--ksknFjzTxFZbssZA--

