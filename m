Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FF04411D9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 02:38:45 +0100 (CET)
Received: from localhost ([::1]:47550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhMHc-0002d6-8C
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 21:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mhM7G-0004Vy-W6; Sun, 31 Oct 2021 21:28:03 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:44709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mhM76-0001kF-Hr; Sun, 31 Oct 2021 21:28:02 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HjFlM6FXGz4xbs; Mon,  1 Nov 2021 12:27:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1635730063;
 bh=yj+NTFrqdD7OchQJdE3l3te1lULfJ0B4xyCUMOG42so=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aBoDniG0vDyxGNBztW4kh6mtAc7KCW5h3ELVPmkQ/dyYdZMGiqSZBwoGSo6hZeCND
 oDcgf2T3IBJihpSJ2sjvxv7X/SFGq1FE3l+MkG71Ea/gdzq6EclE63YZYl/vPu2cUd
 SjRxamzzBvJjHfCK7Hr1jQptk+FlvOKvPe4SJAok=
Date: Mon, 1 Nov 2021 11:13:42 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v2 00/34] PowerISA v3.1 instruction batch
Message-ID: <YX8xNoBaxTaFSDSX@yekko>
References: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hmCiBzTqQN/g32OD"
Content-Disposition: inline
In-Reply-To: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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


--hmCiBzTqQN/g32OD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 29, 2021 at 05:23:50PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>=20
> This patch series implements 56 new instructions for POWER10, moving 28
> "old" instructions to decodetree along the way. The series is divided by
> facility as follows:
>=20
> - From patch 1 to 4: Floating-Point
> - From patch 5 to 10: Fixed-Point
> - From patch 11 to 19: Vector
> - From patch 20 to 34: Vector-Scalar Extensions
>=20
> Based-on: <20211029192417.400707-1-luis.pires@eldorado.org.br>
> because of patch 2 ("target/ppc: Move REQUIRE_ALTIVEC/VECTOR to
> translate.c") and patch 3 ("target/ppc: Introduce REQUIRE_FPU"), and
> Based-on: ppc-for-6.2
>=20
> Patches without review: 7-8, 12, 14-16, 19, 21-22, 24, 30

Patches 1..6 applied to ppc-for-6.2.

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
> Fernando Eckhardt Valle (4):
>   target/ppc: introduce do_ea_calc
>   target/ppc: move resolve_PLS_D to translate.c
>   target/ppc: Move load and store floating point instructions to
>     decodetree
>   target/ppc: Implement PLFS, PLFD, PSTFS and PSTFD instructions
>=20
> Lucas Mateus Castro (alqotel) (6):
>   target/ppc: moved stxv and lxv from legacy to decodtree
>   target/ppc: moved stxvx and lxvx from legacy to decodtree
>   target/ppc: added the instructions LXVP and STXVP
>   target/ppc: added the instructions LXVPX and STXVPX
>   target/ppc: added the instructions PLXV and PSTXV
>   target/ppc: added the instructions PLXVP and PSTXVP
>=20
> Luis Pires (2):
>   target/ppc: Implement cntlzdm
>   target/ppc: Implement cnttzdm
>=20
> Matheus Ferst (16):
>   target/ppc: Move LQ and STQ to decodetree
>   target/ppc: Implement PLQ and PSTQ
>   target/ppc: Implement pdepd instruction
>   target/ppc: Implement pextd instruction
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
>=20
>  target/ppc/helper.h                        |  20 +-
>  target/ppc/insn32.decode                   | 132 ++++
>  target/ppc/insn64.decode                   |  72 +++
>  target/ppc/int_helper.c                    | 134 +++-
>  target/ppc/translate.c                     | 215 ++-----
>  target/ppc/translate/fixedpoint-impl.c.inc | 218 ++++++-
>  target/ppc/translate/fp-impl.c.inc         | 261 +++-----
>  target/ppc/translate/fp-ops.c.inc          |  29 -
>  target/ppc/translate/vector-impl.c.inc     |  48 --
>  target/ppc/translate/vmx-impl.c.inc        | 334 +++++++++-
>  target/ppc/translate/vmx-ops.c.inc         |  10 +-
>  target/ppc/translate/vsx-impl.c.inc        | 701 ++++++++++++---------
>  target/ppc/translate/vsx-ops.c.inc         |   4 -
>  13 files changed, 1387 insertions(+), 791 deletions(-)
>  delete mode 100644 target/ppc/translate/vector-impl.c.inc
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hmCiBzTqQN/g32OD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmF/MTQACgkQbDjKyiDZ
s5KsKQ//X+HhZ9rzvnTzn+/2uR+/YiBiMMpl8Jmj3A6paHFvim37RRK4PXXkCcuJ
LMDnIzwo0dCpAcuyJ4AbQIEJS9yq/nKdJnduIJSE+hjPq5guwmGWInDqAwqM7JbM
TpQ++O5dRpL+2CVJk6hajD6R3ae4S4HGoWgjbRoGTJCLC326zSri1nkC++p5e8Ew
tgZP31agb4OcKf7Hcuu9cmGl+JlR06P/0NynkgEuqTtqeYonk6hkHNJGnl7Lb3Ki
3H+F3sGSWyfnOa/u68Hmyns+wiE4DXoQ++PhSioIEN4E0Ai+d+BhytuCP7dLmuPB
J8LWg+kVzzOUVb08IuQMI8ta+Y4NEPxu2rvvpvKY2njKSs5Kk27jMu43lMor+NuM
w6wlVvYGzWMQE+y/b+7zGpSP6UzJlcQWDHqvqKCIZjtMfLUpGXIePFuhTF9ZVUnA
hEZxcv2lT1KIWrGzTLq5xDDNOdsmCfcN4RpgsFow1EraHkljSEz4Ds5POVEJwMOW
XJiHybCzR4bkZGn1499+Go5JdrjwSUg934PaeeVgH5u6Bab9d05PSxIdxYgteFZF
Xjel5mS+D+IGBNZk1sltHTA0c7u84doTKVYi4b94K2VjBzmMYkqrS81lp7/+4IOs
ObcmL3JRDrxeRnKACjrUVuznmywLCXd89UTf10du4+5zEuF2+Bg=
=lwcy
-----END PGP SIGNATURE-----

--hmCiBzTqQN/g32OD--

