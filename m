Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7B13BA7B0
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 09:50:31 +0200 (CEST)
Received: from localhost ([::1]:57500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzaQ2-0006F2-7G
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 03:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lzaIq-00021h-4i; Sat, 03 Jul 2021 03:43:04 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:46291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lzaIm-0001Lp-LA; Sat, 03 Jul 2021 03:43:03 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GH3p63CKKz9sXN; Sat,  3 Jul 2021 17:42:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625298174;
 bh=mxDzta18DSvjxbcQGPPf/KFDi+jt/56B4NysZZPHURY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UxrfxQ86kXWO7fitqjSP2niXgGx2wEVUJXxymADSso2PZO3feFAyd2KGjkUjFRoig
 j5waQBugKZ3miklbQmaCurXzS7WW5QIQP/bA0bp2ez3s/3QWp1IuK50DKnx+0Cd+Ik
 WOSzzSQ+H9GEUmG3AOnqKgVNE8v+sKNfeKujc6mk=
Date: Sat, 3 Jul 2021 17:29:22 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 1/3] target/ppc: Fix compilation with DUMP_PAGE_TABLES
 debug option
Message-ID: <YOAR0mOS6tZCnKZI@yekko>
References: <20210702215235.1941771-1-farosas@linux.ibm.com>
 <20210702215235.1941771-2-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kvnWjvZyClDa3PBs"
Content-Disposition: inline
In-Reply-To: <20210702215235.1941771-2-farosas@linux.ibm.com>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--kvnWjvZyClDa3PBs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 02, 2021 at 06:52:33PM -0300, Fabiano Rosas wrote:
> ../target/ppc/mmu_helper.c: In function 'get_segment_6xx_tlb':
> ../target/ppc/mmu_helper.c:514:46: error: passing argument 1 of
> 'ppc_hash32_hpt_mask' from incompatible pointer type [-Werror=3Dincompati=
ble-pointer-types]
>=20
>   514 |                          ppc_hash32_hpt_mask(env) + 0x80);
>       |                                              ^~~
>       |                                              |
>       |                                              CPUPPCState *
>=20
> Fixes: 36778660d7 ("target/ppc: Eliminate htab_base and htab_mask variabl=
es")
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/mmu_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index 1ecb36e85a..ff2c6bdd8c 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -511,7 +511,7 @@ static int get_segment_6xx_tlb(CPUPPCState *env, mmu_=
ctx_t *ctx,
> =20
>                  qemu_log("Page table: " TARGET_FMT_plx " len " TARGET_FM=
T_plx
>                           "\n", ppc_hash32_hpt_base(cpu),
> -                         ppc_hash32_hpt_mask(env) + 0x80);
> +                         ppc_hash32_hpt_mask(cpu) + 0x80);
>                  for (curaddr =3D ppc_hash32_hpt_base(cpu);
>                       curaddr < (ppc_hash32_hpt_base(cpu)
>                                  + ppc_hash32_hpt_mask(cpu) + 0x80);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kvnWjvZyClDa3PBs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDgEdAACgkQbDjKyiDZ
s5JIIg//XpGGdSahWuZuygT4RV7VRzvphAngWovAHqR0hvZNMxqgJTWivnDUrZV4
CumggDNhbO+EnDuk6ur5JHlU4XJ40Za+Oa0VZlR51niSDdlCtOwBHtFOpfnhGjou
noRS5tLo5IHdAQUI5MkSCPw2oF4JDNCVYaW8o9n5+k7q8czOfNsNnV2rqDhdiZ2L
2kXR3bLTwRUF26GFxlLDzrsnYP/QlK8VdTtA4CmVIGwNUTx67Qoh9QYU7B76Rhuk
oB3vbBkuhNnh95+ZSx0lMfsSb3hpg2gfv3mrCjspq38R5v8Un9HXxqf4epP3xEEq
QOvDkyElXRU0PWftLeWZPNfRONkPJ6e3U903GxtiMTCAOaj9j2IKIG/5smy+QpIA
s48POUcWXGV8VaobjNfWNFG1ZiehI6VVnZDr/1a/kRHVBXpfyMfkMn35U7lh7Q4A
LQmVW80bdkjgeHjo/fdSZH4NFoCbcpR6juCJtmhhqp5fT636twqP2p3+BtY39uIq
6KLkoIVTdcHws0i9Ayay3QdyP4A40g1ud4cxFyAe+OA5gBSxXjhrzA8ZI7usvmR2
WSWA2ocO3vsVzldv3LW2pPzhkutXMt/ig6tygpMqenkvft4TBCejLi92tkXKBtiu
pvPX7cEbVmKsNu7r2ePFXGd9p2A8Lc5Hq8w/su/LZi4vYTFMI7Q=
=ZC+f
-----END PGP SIGNATURE-----

--kvnWjvZyClDa3PBs--

