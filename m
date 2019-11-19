Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26F5101061
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Nov 2019 01:55:17 +0100 (CET)
Received: from localhost ([::1]:40806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWrnZ-0004hN-0N
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 19:55:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60221)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iWrlA-0002B0-K0
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 19:52:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iWrl7-0005qa-HW
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 19:52:48 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:44309)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iWrl6-0005mD-L6; Mon, 18 Nov 2019 19:52:45 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47H6jz3hwQz9sPT; Tue, 19 Nov 2019 11:52:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1574124759;
 bh=dH3/+v8DOywAcQtnl4RiTK+EMh+tknt4BfHGt+eHweI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AzTgXFwrEP3aTziv7Dyru97m08R5dBPfjiHgmTejEb+/OrgSwnTJvmSRSpvwAtp4W
 mt7K1n+cM80RiHb0w07O/NTi+gVtq89oYFxLcWyR4QMsIiQi9577C2oo9nzzSHsv6X
 oYzx2d9h2j6Z3fV2dHzfDSTSwE1aUceONMxKeYoI=
Date: Tue, 19 Nov 2019 11:49:38 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] ppc/pnv: Add a LPC "ranges" property
Message-ID: <20191119004938.GG5582@umbus.fritz.box>
References: <20191118091908.15044-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TdkiTnkLhLQllcMS"
Content-Disposition: inline
In-Reply-To: <20191118091908.15044-1-clg@kaod.org>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--TdkiTnkLhLQllcMS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 10:19:08AM +0100, C=E9dric Le Goater wrote:
> And fix a typo in the MEM address space definition.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-5.0.  AFAICT this is a bugfix (amongst other
things), but I don't think pnv is widely used enough to put this into
4.2 during hard freeze.

> ---
>  hw/ppc/pnv_lpc.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
> index fb9f93032020..c5a85c38c783 100644
> --- a/hw/ppc/pnv_lpc.c
> +++ b/hw/ppc/pnv_lpc.c
> @@ -86,7 +86,7 @@ enum {
>  #define ISA_FW_SIZE             0x10000000
>  #define LPC_IO_OPB_ADDR         0xd0010000
>  #define LPC_IO_OPB_SIZE         0x00010000
> -#define LPC_MEM_OPB_ADDR        0xe0010000
> +#define LPC_MEM_OPB_ADDR        0xe0000000
>  #define LPC_MEM_OPB_SIZE        0x10000000
>  #define LPC_FW_OPB_ADDR         0xf0000000
>  #define LPC_FW_OPB_SIZE         0x10000000
> @@ -143,6 +143,16 @@ int pnv_dt_lpc(PnvChip *chip, void *fdt, int root_of=
fset)
>                              cpu_to_be32(PNV9_LPCM_SIZE >> 32),
>                              cpu_to_be32((uint32_t)PNV9_LPCM_SIZE),
>      };
> +    uint32_t lpc_ranges[12] =3D { 0, 0,
> +                                cpu_to_be32(LPC_MEM_OPB_ADDR),
> +                                cpu_to_be32(LPC_MEM_OPB_SIZE),
> +                                cpu_to_be32(1), 0,
> +                                cpu_to_be32(LPC_IO_OPB_ADDR),
> +                                cpu_to_be32(LPC_IO_OPB_SIZE),
> +                                cpu_to_be32(3), 0,
> +                                cpu_to_be32(LPC_FW_OPB_ADDR),
> +                                cpu_to_be32(LPC_FW_OPB_SIZE),
> +    };
>      uint32_t reg[2];
> =20
>      /*
> @@ -211,6 +221,8 @@ int pnv_dt_lpc(PnvChip *chip, void *fdt, int root_off=
set)
>      _FDT((fdt_setprop_cell(fdt, offset, "#size-cells", 1)));
>      _FDT((fdt_setprop(fdt, offset, "compatible", lpc_compat,
>                        sizeof(lpc_compat))));
> +    _FDT((fdt_setprop(fdt, offset, "ranges", lpc_ranges,
> +                      sizeof(lpc_ranges))));
> =20
>      return 0;
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--TdkiTnkLhLQllcMS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl3TPCIACgkQbDjKyiDZ
s5Ittg//b97R4SLX8Qs4LKVOWesCig5127Ci9Yy+Eu7L4anaQ5A4rThE7GyVNVKp
LSIPddavQhmUz9GmvNqco8G1TidB4/R3HLZnpg1+rPWr2Gued8EadDEkcibZL6sz
A9o8kjcHv60I3Bq7EN8dSdO8UFEK7KScnldINoe9RBEV08OHBIOdfzvut4vftIw0
09+43RyoCUIaWcxI9mgTOp+nyPwMlfXlI44hD449k7hFvQUDpazXjvuWjlLLHf75
G4uVzaK2mTTr1U1UfSbWhhOAfOjHe/CpW2l609Q1sFAUm/SMB/ijZXAYu60eyfqk
5qFCFeULvF5VJVW8EBWjNj3kTfW540tBsbDX8WMCFGtS+/IzHUFJQgFxHzdCe3Rw
JVIIqYb0KdkMQXlnbPjJW6ZlDiqt+Dv1PsCN9XiABmFYjtC7L/xvRR5JZ5MSk+yZ
/QnhvsOCiJrIfdrQ22wio32OS2wWTZZifEdk1jY8vHQ1gkLAdUYjZm4ME4d3HAxV
ARNJRZsdnfmXqrVmok6ZSYa9sg4SQMjvl/RZoflbcMNVXESGQ6+vAre41iWtjRYb
kOO0o+dhRaS0r7GYl4ssIi4es3dVrmmXRv7Lh6V7XId2/QdeeZAxuvK2ig25shky
BFdE4dwcMsE5y6AmDuzHCnrEy2RmcyVxla0D3WBcVRP+GFhUTV0=
=WSqB
-----END PGP SIGNATURE-----

--TdkiTnkLhLQllcMS--

