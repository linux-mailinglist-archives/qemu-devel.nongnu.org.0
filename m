Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C4F102ED9
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Nov 2019 23:08:11 +0100 (CET)
Received: from localhost ([::1]:52022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXBfO-0005xF-5x
	for lists+qemu-devel@lfdr.de; Tue, 19 Nov 2019 17:08:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35810)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iXBb3-0002Ir-4E
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 17:03:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iXBb1-0007pg-Lq
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 17:03:41 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:37607 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iXBb0-0007nK-Po; Tue, 19 Nov 2019 17:03:39 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47HfwP1nhZz9sPc; Wed, 20 Nov 2019 09:03:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1574201013;
 bh=Tojo64dPA2SvIoKbijRP+76sK9wLqGOCNQE0G/AlgZo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n8a6v3ExDocbkNv5Zp5fLgYgzo4BPJgl+ohhfbJ9Y1cyEEavHd+0QVNUl51ccRH2l
 7kBviV3cGU/hu5TtZiLgxB4cZg9RGDpCm/7a8OgfJvlWN9PprJxcNrvERkvI4ISXRb
 zjoruxTz5E2ISapppJsPY4jsKIRN10ZKcTQz2uas=
Date: Wed, 20 Nov 2019 08:56:18 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Balamuruhan S <bala24@linux.ibm.com>
Subject: Re: [PATCH 2/5] hw/ppc/pnv_xscom: PBA bar mask values are incorrect
 with homer/occ sizes
Message-ID: <20191119215618.GU5582@umbus.fritz.box>
References: <20191119175056.32518-1-bala24@linux.ibm.com>
 <20191119175056.32518-3-bala24@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+Yg8W10oK6rlW0RR"
Content-Disposition: inline
In-Reply-To: <20191119175056.32518-3-bala24@linux.ibm.com>
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
Cc: groug@kaod.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+Yg8W10oK6rlW0RR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2019 at 11:20:53PM +0530, Balamuruhan S wrote:
> homer/occ sizes are calculated in skiboot with `(mask | 0xfffff) + 1`,
> and from xscom access should return correct mask values instead of actual
> sizes.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
> ---
>  hw/ppc/pnv_xscom.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/ppc/pnv_xscom.c b/hw/ppc/pnv_xscom.c
> index f01d788a65..cdd5fa356e 100644
> --- a/hw/ppc/pnv_xscom.c
> +++ b/hw/ppc/pnv_xscom.c
> @@ -46,6 +46,10 @@
>  #define P9_PBA_BARMASK0                 0x5012b04
>  #define P9_PBA_BARMASK2                 0x5012b06
> =20
> +/* Mask to calculate Homer/Occ size */
> +#define HOMER_SIZE_MASK                 0x0000000000300000ull
> +#define OCC_SIZE_MASK                   0x0000000000700000ull

Uuuhhhhh... AFAICT these defines have identical values to
PNV_HOMER_SIZE and PNV_OCC_COMMON_AREA_SIZE, so I don't see what this
patch is actually changing.


>  static void xscom_complete(CPUState *cs, uint64_t hmer_bits)
>  {
>      /*
> @@ -90,9 +94,8 @@ static uint64_t xscom_read_default(PnvChip *chip, uint3=
2_t pcba)
>          return PNV_HOMER_BASE(chip);
> =20
>      case P9_PBA_BARMASK0: /* P9 homer region size */
> -        return PNV9_HOMER_SIZE;
>      case P8_PBA_BARMASK0: /* P8 homer region size */
> -        return PNV_HOMER_SIZE;
> +        return HOMER_SIZE_MASK;
> =20
>      case P9_PBA_BAR2: /* P9 occ common area */
>          return PNV9_OCC_COMMON_AREA(chip);
> @@ -100,9 +103,8 @@ static uint64_t xscom_read_default(PnvChip *chip, uin=
t32_t pcba)
>          return PNV_OCC_COMMON_AREA(chip);
> =20
>      case P9_PBA_BARMASK2: /* P9 occ common area size */
> -        return PNV9_OCC_COMMON_AREA_SIZE;
>      case P8_PBA_BARMASK2: /* P8 occ common area size */
> -        return PNV_OCC_COMMON_AREA_SIZE;
> +        return OCC_SIZE_MASK;
> =20
>      case 0x1010c00:     /* PIBAM FIR */
>      case 0x1010c03:     /* PIBAM FIR MASK */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+Yg8W10oK6rlW0RR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl3UZQIACgkQbDjKyiDZ
s5I8cRAAu2agxtgFtUOgKF2Ye9xyAdtfqQQJeVupYzpo8ou7KjESQobKrqzTRj3M
YmRzWaDqlydWI5GkYFwJVQKDuxgKUfyncNWitDH3qHwccdLeQ0Q563T0phtumG/z
VJK2Ul6UMLk3f26xumbcDfvxy3WqrGfZLYiUh4Lw1Ho+hHsdYV1NF7ULGH3np2sI
hsIUhD5NmgcOh68qZSX+1jtid7Jp5piJ72zwdBV2gXbxJVsNX6JSeJmc7ySsckkD
cDXTBbK1Mb8UTj6bJnDiupd5+0ESl2lI6pP7OOht11CgMwpHKqs67ebvszmAbRL6
5UetTqMzUZwZZcLHc9dQk4Hj6F40o02QbfJ77ZrnaDoeIC+YWOK5Ohy4VgTGPcrq
Za2VzYmMDtca6zSdAk33fxsKEpnkYORbRETwUj+xUJcg0pwaVM7/Zn6tbRppPU6x
zMcI/QWPgej6EqGv0dP4+mVjmA15IXkIDLfQ/WeI8LcAns8UJ/L4ddom6mfy5HbC
1R0jqAniJm8/tXzWtioIH9p43xUExF1Rid4O75ijPj2K/Nvqiqfsmh906Uh/MYbD
Qsr4/6eL+IWBcU8CzfMt4Ncuaw/8R7UamJ9Hua7f+bUx9VPR2y7nokZcmd4TsabX
yIAZDl/JNsgpOqsEn9AQOwywMT7X7sOmVB0OwKgK/qcUwj2HDUI=
=bgs/
-----END PGP SIGNATURE-----

--+Yg8W10oK6rlW0RR--

