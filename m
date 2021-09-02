Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4293FE7FF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 05:30:05 +0200 (CEST)
Received: from localhost ([::1]:49882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLdQS-0004b9-4w
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 23:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mLdLR-0001SS-4I; Wed, 01 Sep 2021 23:24:53 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34447 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mLdLJ-0008N1-Gr; Wed, 01 Sep 2021 23:24:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630553072;
 bh=YfXFmOaKkgFIS61tuqzKP+OKD5nUt2ripCH7WNV7MG0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rzl1s/R8HC4hB7M/BjGuX9SoZ1Og88VRxv75grVUSz7oj3rnYJEdmm21DgaVaYSKa
 DXhIfgGkCtDHHmQsOlvO0p5oFTrsZTegcEdM+qu/okl4+ZrUIT0sSOQrAdrx/0rs4H
 hn9AAxYacGNNqHm8uU4iUEBwAOFbOcrSaAlMXn7Q=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H0R9r1hQgz9t0Y; Thu,  2 Sep 2021 13:24:32 +1000 (AEST)
Date: Thu, 2 Sep 2021 11:37:34 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 5/8] ppc/pnv: Add an assert when calculating the RAM
 distribution on chips
Message-ID: <YTAq3pj2Chwzk6km@yekko>
References: <20210901094153.227671-1-clg@kaod.org>
 <20210901094153.227671-6-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eosHtHyHm4YDa15C"
Content-Disposition: inline
In-Reply-To: <20210901094153.227671-6-clg@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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


--eosHtHyHm4YDa15C
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 01, 2021 at 11:41:50AM +0200, C=E9dric Le Goater wrote:
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Uh.. I thought the proposed assert was about making it clear there
wouldn't be a divide by zero, which would want > 1, not < 2.

> ---
>  hw/ppc/pnv.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index a62e90b15e27..761b82be7401 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -723,6 +723,8 @@ static uint64_t pnv_chip_get_ram_size(PnvMachineState=
 *pnv, int chip_id)
>          return QEMU_ALIGN_DOWN(ram_per_chip, 1 * MiB);
>      }
> =20
> +    assert(pnv->num_chips < 2);
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

--eosHtHyHm4YDa15C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEwKt4ACgkQbDjKyiDZ
s5ItiA/+L56PmVQBUyh7vF+YBUfz4oG51tEokzjGX8n3ukk6VsqOo0TG+wwKfe81
Y2ag7Gf5ZVqzi4JbwqpLQhxVjMtoxqkfxJleLTISrz0F0BimvBGb5CzSASR0Y7BY
2r6HmPNhSoB0rdKzJ2P/3g/229t8pwYNX31KcD8ovhHc60wgj3uBCDs3FuFC7isu
NWCxV0EfTWGv4K+V7JTj+hyfQnkWu48PWlzRIHnaRbpAV4BPhsyXm+uJttOKtWJe
FvIO2py3yzrr6W3ZBRIosQdIY0E7pjpxsScG+E4LzLkIa8IBiNO1AMQx14Tuv+LR
zAZCOPQz9leXVFin4YL1MuEyyyWNtqA2fZJ/pTcHWx+Dw8jp5QNUcubJQOB9O++S
/KiwyhS854SosaEb+p0ERdS6UkQ73oCdwLHPQWiq4a1b3AU3hsEk3OmumJ5OnqVB
P4oBzTzbE7o/nVV/YVeNRyMg+d6oZH3ikt3LbmsSK2Eng4RJed1kMnJrN+RkU0zH
yUve2c5Pbz16qHVlaJea1cORoFjxXr7jlMz9zRirhhDH+ywiaCCDkSC4zZWYcwZi
QPgPmZQwBlJrLtPImC86u/QPqnxGl9wz7hQXM1M8aLoLHq1DbvDUEIHYFS5OR4l4
uKEv5M5uYmvGYnTuFTKDr884oDg3B410wVh6alLCV23Ao6Lv2Mo=
=kwBj
-----END PGP SIGNATURE-----

--eosHtHyHm4YDa15C--

