Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BACF9445E07
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 03:44:12 +0100 (CET)
Received: from localhost ([::1]:45980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mipD9-00063w-9L
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 22:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mip8b-0002hy-R7; Thu, 04 Nov 2021 22:39:33 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:48007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mip8R-0001L8-HK; Thu, 04 Nov 2021 22:39:27 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Hll7t2r6fz4xd8; Fri,  5 Nov 2021 13:39:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636079946;
 bh=MMCqVKxl+Eu3B2OJM4nQyBmedKveBb0/5f4Hshi9rU4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iI3n+LMBcvD2XZJ1I7IZCNlQzgMVT8OhN7/gLfAtNAibbDMnytqyhQrIU+8tjeL8i
 vw9x+Aog408xnjPlTvHPtiGM5Nkewdi3ZO3ailPxY+NRpAbkb8Pg6SMcEOuyk3u26G
 zOLox5Bq42uAtyC21wFYJpZKNUpXZFf6VPw6GXpE=
Date: Fri, 5 Nov 2021 12:26:56 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v3 00/25] PowerISA v3.1 instruction batch
Message-ID: <YYSIYMtkKfX24REY@yekko>
References: <20211104123719.323713-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IevDvjceyaUoCFV+"
Content-Disposition: inline
In-Reply-To: <20211104123719.323713-1-matheus.ferst@eldorado.org.br>
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: lucas.castro@eldorado.org.br, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, groug@kaod.org, luis.pires@eldorado.org.br,
 qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--IevDvjceyaUoCFV+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 04, 2021 at 09:36:54AM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>=20
> This patch series implements 56 new instructions for POWER10, moving 28
> "old" instructions to decodetree along the way. The series is divided by
> facility as follows:
>=20
> - From patch 1 to 9: Vector
> - From patch 10 to 24: Vector-Scalar Extensions
> - From patch 25: Fixed-Point
>=20
> Based-on: ppc-for-6.2

Applied to ppc-for-6.2, thanks.

>=20
> Patches without review: 5, 25
>=20
> v3:
> - Rebase on ppc-for-6.2
> - Fixed endianness issue in vector insert helpers
> - cntlzdm/cnttzdm implementation without brcond
>=20
> v2:
> - do_ea_calc now allocate and returns ea
> - Inline version of cntlzdm/cnttzdm
> - vecop_list removed from GVecGen* without fniv
> - vsldbi/vsrdbi implemented with tcg_gen_extract2_i64
> - memcpy instead of misaligned load/stores on vector insert instructions
> - Simplified helper for Vector Extract
> - Fixed [p]stxv[xp]/[p]lxv[xp] to always access to lowest address first
>   in LE
> - xxsplti32dx implemented with tcg_gen_st_i32
> - valid_values mask removed from lxvkq implementation
>=20
> Bruno Larsen (billionai) (6):
>   target/ppc: Introduce REQUIRE_VSX macro
>   target/ppc: moved XXSPLTW to using decodetree
>   target/ppc: moved XXSPLTIB to using decodetree
>   target/ppc: implemented XXSPLTI32DX
>   target/ppc: Implemented XXSPLTIW using decodetree
>   target/ppc: implemented XXSPLTIDP instruction
>=20
> Lucas Mateus Castro (alqotel) (6):
>   target/ppc: moved stxv and lxv from legacy to decodtree
>   target/ppc: moved stxvx and lxvx from legacy to decodtree
>   target/ppc: added the instructions LXVP and STXVP
>   target/ppc: added the instructions LXVPX and STXVPX
>   target/ppc: added the instructions PLXV and PSTXV
>   target/ppc: added the instructions PLXVP and PSTXVP
>=20
> Matheus Ferst (13):
>   target/ppc: Move vcfuged to vmx-impl.c.inc
>   target/ppc: Implement vclzdm/vctzdm instructions
>   target/ppc: Implement vpdepd/vpextd instruction
>   target/ppc: Implement vsldbi/vsrdbi instructions
>   target/ppc: Implement Vector Insert from GPR using GPR index insns
>   target/ppc: Implement Vector Insert Word from GPR using Immediate
>     insns
>   target/ppc: Implement Vector Insert from VSR using GPR index insns
>   target/ppc: Move vinsertb/vinserth/vinsertw/vinsertd to decodetree
>   target/ppc: Implement Vector Extract Double to VSR using GPR index
>     insns
>   target/ppc: receive high/low as argument in get/set_cpu_vsr
>   target/ppc: Implement xxblendvb/xxblendvh/xxblendvw/xxblendvd
>     instructions
>   target/ppc: Implement lxvkq instruction
>   target/ppc: cntlzdm/cnttzdm implementation without brcond
>=20
>  target/ppc/helper.h                        |  20 +-
>  target/ppc/insn32.decode                   |  93 +++
>  target/ppc/insn64.decode                   |  57 ++
>  target/ppc/int_helper.c                    | 101 ++-
>  target/ppc/translate.c                     |  26 +-
>  target/ppc/translate/fixedpoint-impl.c.inc |  37 +-
>  target/ppc/translate/vector-impl.c.inc     |  48 --
>  target/ppc/translate/vmx-impl.c.inc        | 334 +++++++++-
>  target/ppc/translate/vmx-ops.c.inc         |  10 +-
>  target/ppc/translate/vsx-impl.c.inc        | 704 ++++++++++++---------
>  target/ppc/translate/vsx-ops.c.inc         |   4 -
>  11 files changed, 1006 insertions(+), 428 deletions(-)
>  delete mode 100644 target/ppc/translate/vector-impl.c.inc
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--IevDvjceyaUoCFV+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGEiGAACgkQbDjKyiDZ
s5IRkxAAqoXCRWDbS/QU+0CSLe94qLnCFP6s1VzL0rNvYBZWBgoKZQ9f+ps8KlJf
F+jdNYdakmNii2WWOFX+tAlO/d9ULfEv5pIAs4O4H96v9rwfZ8EK4I5IsXBgAPUE
K+YwYzkQzuobxtu0p9yYY0yaecKn/6eGAEq75+JfEEYQeY8g1W3bOwUf4MgcoDg/
Fk8P3s9gqKeSyCgQ6dCQ3ufhChJb4AYkPu8m28Vbi7ph4Bi+X+mRVBYX6zvQ/m40
bzyawxBIoq4YU7GHOJ8pWxZO6hB/GIOk7M0EiBV6+PsqQEUWPC3DJly/PxPtif62
V2GOai8fJdC7i3NkVtlURrZV4Jv1cNxJKOn1gxLQuND5AEFjXKysc7JeZwlekSce
WnOuAmLZgU3C2ETt5DHT/qgVMcBGA8RW32qeNBbey9rYRv1BLtH9zWADeGnYMh2H
VJyJp6JCfrZbDecSJ+ZRZzlold26P03EMwd8I8iB0O2sHrCVo8ARpJgbEjLWqaAm
t5fmcwBEm18nCSIBHzQrEcqRPBybYINwvGg+GAmMmiV0ImYN1NviadIzGiNWFWJR
WQst6uxp58eTLV/pHpWVIdApN1BsaF8yw9lBueKD9QHOjiVkfkyVspLxAlmWZ095
KgjGIRoDZBEJExe9zgozBA1a6FThwb1FpaPYZBLrfeqb3fS3xG0=
=8jvA
-----END PGP SIGNATURE-----

--IevDvjceyaUoCFV+--

