Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 321A8386F9B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 03:49:27 +0200 (CEST)
Received: from localhost ([::1]:35096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liorO-0001PU-7U
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 21:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeP-00073d-Tf; Mon, 17 May 2021 21:36:02 -0400
Received: from ozlabs.org ([203.11.71.1]:54159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeM-0007Ay-Eh; Mon, 17 May 2021 21:36:01 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fkdqh0fbdz9sxS; Tue, 18 May 2021 11:35:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621301744;
 bh=1yKxowR20oRy0a5l69ij1qM29iud+COwhdLu5s67iHg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ctHFBEHk1NXgAdYgGC3Fc1f6veNJppjPUynfXTMGnmgEOsot0VW1JdOqKe/Ga5zyx
 tWykv/TB6vYhaZ9nSHfQNAjVxGTYMYmb8lQzy3M8+sR3RUhTRcYq0plUufiqtfJYxM
 L1kRRbZPlGzgbIdD0IwgTfg8ivAzgc7aJ+I/kWwo=
Date: Tue, 18 May 2021 10:47:43 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v5 18/23] target/ppc: Implement prefixed integer store
 instructions
Message-ID: <YKMOrzDYRCSaGLHB@yekko>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-19-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+ue93vukyFoOcbJ4"
Content-Disposition: inline
In-Reply-To: <20210517205025.3777947-19-matheus.ferst@eldorado.org.br>
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
 bruno.larsen@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+ue93vukyFoOcbJ4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 05:50:20PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/insn64.decode                   | 12 ++++++++++++
>  target/ppc/translate/fixedpoint-impl.c.inc |  4 ++++
>  2 files changed, 16 insertions(+)
>=20
> diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
> index 547bd1736f..72c5944a53 100644
> --- a/target/ppc/insn64.decode
> +++ b/target/ppc/insn64.decode
> @@ -39,6 +39,18 @@ PLWA            000001 00 0--.-- .................. \
>  PLD             000001 00 0--.-- .................. \
>                  111001 ..... ..... ................     @PLS_D
> =20
> +### Fixed-Point Store Instructions
> +
> +PSTW            000001 10 0--.-- .................. \
> +                100100 ..... ..... ................     @PLS_D
> +PSTB            000001 10 0--.-- .................. \
> +                100110 ..... ..... ................     @PLS_D
> +PSTH            000001 10 0--.-- .................. \
> +                101100 ..... ..... ................     @PLS_D
> +
> +PSTD            000001 00 0--.-- .................. \
> +                111101 ..... ..... ................     @PLS_D
> +
>  ### Fixed-Point Arithmetic Instructions
> =20
>  PADDI           000001 10 0--.-- ..................     \
> diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/tran=
slate/fixedpoint-impl.c.inc
> index adeee33289..2d2d874146 100644
> --- a/target/ppc/translate/fixedpoint-impl.c.inc
> +++ b/target/ppc/translate/fixedpoint-impl.c.inc
> @@ -142,24 +142,28 @@ TRANS(STB, do_ldst_D, false, true, MO_UB)
>  TRANS(STBX, do_ldst_X, false, true, MO_UB)
>  TRANS(STBU, do_ldst_D, true, true, MO_UB)
>  TRANS(STBUX, do_ldst_X, true, true, MO_UB)
> +TRANS(PSTB, do_ldst_PLS_D, false, true, MO_UB)
> =20
>  /* Store Halfword */
>  TRANS(STH, do_ldst_D, false, true, MO_UW)
>  TRANS(STHX, do_ldst_X, false, true, MO_UW)
>  TRANS(STHU, do_ldst_D, true, true, MO_UW)
>  TRANS(STHUX, do_ldst_X, true, true, MO_UW)
> +TRANS(PSTH, do_ldst_PLS_D, false, true, MO_UW)
> =20
>  /* Store Word */
>  TRANS(STW, do_ldst_D, false, true, MO_UL)
>  TRANS(STWX, do_ldst_X, false, true, MO_UL)
>  TRANS(STWU, do_ldst_D, true, true, MO_UL)
>  TRANS(STWUX, do_ldst_X, true, true, MO_UL)
> +TRANS(PSTW, do_ldst_PLS_D, false, true, MO_UL)
> =20
>  /* Store Doubleword */
>  TRANS64(STD, do_ldst_D, false, true, MO_Q)
>  TRANS64(STDX, do_ldst_X, false, true, MO_Q)
>  TRANS64(STDU, do_ldst_D, true, true, MO_Q)
>  TRANS64(STDUX, do_ldst_X, true, true, MO_Q)
> +TRANS64(PSTD, do_ldst_PLS_D, false, true, MO_Q)
> =20
>  /*
>   * Fixed-Point Arithmetic Instructions

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+ue93vukyFoOcbJ4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCjDq8ACgkQbDjKyiDZ
s5Lbcw//aEf9I0THelrkTUeV35DmJZjKSsHzjJw1ex5S3l7RIt7Ga6B98maIzlWj
W0Ld2g1OtgP9HQJjnMC6jG3DCCYNe7qefT+OdmlZkejji34sb1rotf9eUJpvuQYl
NA156eEGoxeCKPaMZSquU7b+cLkT9y87R8EoVOHowq+q0J3V/vSzTfW4lD9ZOJHe
sGM9igfqVnvSLxxvap7Y9VvN8IUzOEmk7HHVQBB9ktPL1F53cdip+VYypGJjXuNz
yeWOxlcaix+HdAFfcGzQ9Wta1OAvpGiXf6UOyalNMdKBrAAmT+hTXfAnU67/1zhl
Gl3ODMWSx3jNU7PawWuhe6vc5L3nd5PDucFuUtJrL4hdrsIJvKvHAMhJq43bbdqv
B6ACSF69mD5QgfDrjPV3RevaV8Y+k39T0fasSopa0EFuwzCPias4VInsXuzl5wDU
T44CILnaZkOs/i0yPwWKOAqFAYBNVVnsiqnqKZvpJW406icYZLJJ3yn3DpZK9dEV
+Ptv2TR9oIge5bMhxwmtcxnuSAXvUPiZegv827ZAEpbp+IuogOuwOgaW4eJBRmy+
xilw37VxELPSXfxULCOD9/XMKh+3HrvCbm1VIpPDDH5HJBvnVbzgC09LmwtqXKf3
1oIL2ELDAkQ9L7Rnb47WMXyy3ELcd1mb4bqrRciunjXr6aywk+Q=
=0rUY
-----END PGP SIGNATURE-----

--+ue93vukyFoOcbJ4--

