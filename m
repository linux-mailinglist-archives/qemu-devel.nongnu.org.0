Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C88823C6849
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 03:54:50 +0200 (CEST)
Received: from localhost ([::1]:45362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m37dJ-0004Tx-Pi
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 21:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m37Yj-0002KU-Uq; Mon, 12 Jul 2021 21:50:05 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:44047 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m37Yh-000718-1D; Mon, 12 Jul 2021 21:50:05 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GP3VG5bpMz9sXM; Tue, 13 Jul 2021 11:49:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626140998;
 bh=xE3G+RDF2E213NNJPI8DEejDcO6QATEU2UKupxVRFeI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MIoqFjvNEqejyrU1Q3hunTcSZQ1NMSxBayRMXnwzasBpRLy0ZeT+tYIXyoVOKn0o8
 7EOp9HilMG0CGsOQlNszVnE6VCAIlzJtQ4EOPzADU/cvkujiUhqxUcAPnum7nWDHIY
 Yo4PcU8c4oeuCQcmGU4iUm9jPqbu4JZHn88oCIa8=
Date: Tue, 13 Jul 2021 10:06:53 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 07/11] hw/pci-hist/pnv_phb4: Fix typo in
 pnv_phb4_ioda_write
Message-ID: <YOzZHXNGAJvs8RTy@yekko>
References: <20210712215535.1471256-1-richard.henderson@linaro.org>
 <20210712215535.1471256-8-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6uQr25OZZ7v4Mjuj"
Content-Disposition: inline
In-Reply-To: <20210712215535.1471256-8-richard.henderson@linaro.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--6uQr25OZZ7v4Mjuj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 12, 2021 at 02:55:31PM -0700, Richard Henderson wrote:
> >From clang-13:
> hw/pci-host/pnv_phb4.c:375:18: error: variable 'v' set but not used \
>     [-Werror,-Wunused-but-set-variable]
>=20
> It's pretty clear that we meant to write back 'v' after
> all that computation and not 'val'.
>=20
> Cc: qemu-ppc@nongnu.org
> Cc: Greg Kurz <groug@kaod.org>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/pci-host/pnv_phb4.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 54f57c660a..5c375a9f28 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -392,7 +392,7 @@ static void pnv_phb4_ioda_write(PnvPHB4 *phb, uint64_=
t val)
>              v &=3D 0xffffffffffff0000ull;
>              v |=3D 0x000000000000cfffull & val;
>          }
> -        *tptr =3D val;
> +        *tptr =3D v;
>          break;
>      }
>      case IODA3_TBL_MBT:

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6uQr25OZZ7v4Mjuj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDs2R0ACgkQbDjKyiDZ
s5LouQ//Raolw5ohJmkkj/PtuJ7DWQgDj3Q7ed+qFZIBEth8XLVjhlA4f2n2fdB3
RkP44Iple3r7DefgZvKffMCbD58X9KObFq0tahyv7Ee3M9p3/H4afpaQmCqBcrrx
3nCCW8qrlvX9FKJhZqBywXxF9jRCy4he66IMx510AChCSQBXbeXdVAMz3kfKb9tW
vSeC4RM/4CCzqxsMUOXXRgiyfpLLFhsGp06psVboWj626ffpcn84iX0oyZsaCrWM
SCsfQx6IAPzuX/BVRkWiHrPWxU3zKKo0CWNs92xnDI7+8zQzKFs3p5aaFxsvT6ks
m5hyAzJ4KM/QqeklTDqdNVBKal2iPigyqRt7gJTsShGfo0j+K5FGERfsnZZl6Tux
JzE8E2AAHQYYLxXiLPlZXwF/hBQ95dIPIfeB/Q9rf3ETXmRvcBLqI3jQdNP+/+dt
X1vZGVEc+LXyz+RnuVL/IZiciAmaDnL3r78Y3A1MgJWHpPjHezNYjC73AoMe2eGk
8ld0IH38Ma2k5tOCj3N8B+wqoQUzBqjAjV1de/slyrnF1JKydQZfHpAg6SKDFBA8
DwxsprIIKc3fMZmFdczLzTThx/MGjX5ojtSUPPC37+Xa9wP+uA7RkyUy9+4h8kEc
zkxMl7iLJGG4bwUhEwogUCfFn3tnXc6A1Ry8BwXp8TkgSGRKunI=
=iCww
-----END PGP SIGNATURE-----

--6uQr25OZZ7v4Mjuj--

