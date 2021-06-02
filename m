Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D933984A9
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 10:55:24 +0200 (CEST)
Received: from localhost ([::1]:42904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loMep-0003MN-4u
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 04:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loMdd-0001HC-JJ; Wed, 02 Jun 2021 04:54:09 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:55199 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loMdb-0003mq-6B; Wed, 02 Jun 2021 04:54:09 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fw2rV1YlRz9sT6; Wed,  2 Jun 2021 18:54:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622624042;
 bh=Qa/Z8fVhEdp+wlD9qMlj0/3fO+SKjG4P1CyA13yg+RU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XiIqrAtgfZCgeTgC9QZdvCqZ/T5IjL8nNbfCdnmYVNhNUF/TvfuMjA5gowKkp2LmJ
 tqGXuXtzxki+1MVV65oJMAhptRVAj1gL7wGpmaNXJCcQ6yRs9xy4dk1Y+RnuYbeO/U
 6dk4zVDzWFwD2gb+YI+jfYelsdcyiivwKoWAS2tM=
Date: Wed, 2 Jun 2021 18:53:54 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v6 00/14] Base for adding PowerPC 64-bit instructions
Message-ID: <YLdHIskiC2UqG09K@yekko>
References: <20210601193528.2533031-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vY38xyfc/CSkCiDP"
Content-Disposition: inline
In-Reply-To: <20210601193528.2533031-1-matheus.ferst@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 luis.pires@eldorado.org.br, qemu-ppc@nongnu.org, lagarcia@br.ibm.com,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--vY38xyfc/CSkCiDP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2021 at 04:35:14PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>=20
> This series provides the basic infrastructure for adding the new 32/64-bit
> instructions in Power ISA 3.1 to target/ppc.

Applied to ppc-for-6.1.
>=20
> v6:
> - Rebase on ppc-for-6.1;
> - Fix rebase error in patch 02/14;
> - Fix style errors;
> - REQUIRE_64BIT when L=3D1 in cmp/cmpi/cmpl/cmpli.
>=20
> v5:
> - Rebase on ppc-for-6.1;
> - Change copyright line from new files;
> - Remove argument set from PNOP;
> - Add comments to explain helper_cfuged implementation;
> - New REQUIRE_ALTIVEC macro;
> - REQUIRE_ALTIVEC and REQUIRE_INSNS_FLAGS2 in trans_CFUGED;
> - cmp/cmpi/cmpl/cmpli moved to decodetree.
>=20
> v4:
> - Rebase on ppc-for-6.1;
> - Fold do_ldst_D and do_ldst_X;
> - Add tcg_const_tl, used to share do_ldst_D and do_ldst_X code;
> - Unfold prefixed and non-prefixed loads/stores/addi to let non-prefixed =
insns use the non-prefixed formats;
> - PNOP invalid suffixes;
> - setbc/setbcr/stnbc/setnbcr implemented;
> - cfuged/vcfuged implemented;
> - addpcis moved to decodetree.
>=20
> v3:
> - More changes for decodetree.
> - Cleanup exception/is_jmp logic to the point exception is removed.
> - Fold in Luis' isa check for prefixed insn support.
> - Share trans_* between prefixed and non-prefixed instructions.
> - Use macros to minimize the trans_* boilerplate.
> - Fix decode mistake for STHX/STHXU.
>=20
> v2:
> - Store current pc in ctx instead of insn_size
> - Use separate decode files for 32- and 64-bit instructions
> - Improvements to the exception/is_jmp logic
> - Use translator_loop_temp_check()
> - Moved logic to prevent translation from crossing page boundaries
> - Additional instructions using decodetree: addis, pnop, loads/stores
> - Added check for prefixed insn support in cpu flags
>=20
>=20
> Matheus Ferst (5):
>   target/ppc: Implement setbc/setbcr/stnbc/setnbcr instructions
>   target/ppc: Implement cfuged instruction
>   target/ppc: Implement vcfuged instruction
>   target/ppc: Move addpcis to decodetree
>   target/ppc: Move cmp/cmpi/cmpl/cmpli to decodetree
>=20
> Richard Henderson (9):
>   target/ppc: Introduce macros to check isa extensions
>   target/ppc: Move page crossing check to ppc_tr_translate_insn
>   target/ppc: Add infrastructure for prefixed insns
>   target/ppc: Move ADDI, ADDIS to decodetree, implement PADDI
>   target/ppc: Implement PNOP
>   target/ppc: Move D/DS/X-form integer loads to decodetree
>   target/ppc: Implement prefixed integer load instructions
>   target/ppc: Move D/DS/X-form integer stores to decodetree
>   target/ppc: Implement prefixed integer store instructions
>=20
>  target/ppc/cpu.h                           |   1 +
>  target/ppc/helper.h                        |   1 +
>  target/ppc/insn32.decode                   | 126 +++++++
>  target/ppc/insn64.decode                   | 124 +++++++
>  target/ppc/int_helper.c                    |  62 ++++
>  target/ppc/meson.build                     |   9 +
>  target/ppc/translate.c                     | 391 +++++----------------
>  target/ppc/translate/fixedpoint-impl.c.inc | 279 +++++++++++++++
>  target/ppc/translate/vector-impl.c.inc     |  56 +++
>  9 files changed, 747 insertions(+), 302 deletions(-)
>  create mode 100644 target/ppc/insn32.decode
>  create mode 100644 target/ppc/insn64.decode
>  create mode 100644 target/ppc/translate/fixedpoint-impl.c.inc
>  create mode 100644 target/ppc/translate/vector-impl.c.inc
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--vY38xyfc/CSkCiDP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC3RyIACgkQbDjKyiDZ
s5InVQ/7BkXVciQ2euyoBqgduUBbbxi8nng9mzDTBXYJp/zBEkBFSjuhpB+rEydp
JSZFidcC8o6OvKSt82Y9DNJSL73TJhiyEfIPI2a2Rg1fEd1lWDVmiW7gzS67NeDu
D8fj4X6g4Hew/4Ejki2i/7P3wmsbdKBP05QBzDM+GXMxPg/nBWwS4Kp/1iTKrNKc
u8gyxyBvZbSwZV7qoho2lpqVk4DzkE41Q9peGR8iElOjb7Oa/YqvAfYqAR97NZZq
lOY64Gm1dtLBx56SZrleLB4cRw5N3b7eE9QwN9eGMXaB3It0x3KdYTuEWqu8o4wK
e5mBxNL9PBW05w0Xtei3K89F+th2peUJ6lOXTmOjK2Yqj4heoiI8pBV20fLCF4gf
hY3IHoICWS72fXhoURH0wV2tUPh1u/Vou5S8M/gqJZYQB2KkqidIW3KSFRh/0L/Z
jU6lONSFBzRzb0suXys14gPQLqRxQZaYTrknLqBQkqQwKTU2oBZHpWdVZ0VpW5nZ
CN3a93Tiy6zYJ/FqIEAuUc9Q/WSTDvHPNU+07/wEEsn15oDRyXSeec4uNantwxNu
Ffb0B3YGCerX7uxmHNx1HW1883ypFZq20MEB3uxT//2YUd+A8FhiBuDa/c4ZYFDl
1ov55Cz8JohXCjmQFFHlFPkOUDmJJtHl29yz4s2cPahH1O7rkRs=
=CFcD
-----END PGP SIGNATURE-----

--vY38xyfc/CSkCiDP--

