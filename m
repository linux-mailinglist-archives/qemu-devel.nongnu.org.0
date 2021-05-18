Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF46386F95
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 03:47:01 +0200 (CEST)
Received: from localhost ([::1]:54242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liop2-0003me-SO
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 21:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeO-00073I-Fx; Mon, 17 May 2021 21:36:01 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:34739 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeM-00079T-BB; Mon, 17 May 2021 21:36:00 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fkdqg3zxnz9t0T; Tue, 18 May 2021 11:35:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621301743;
 bh=uqfF89kG0CypFvpYGgaxh/uHSJ68CxnlOhqI+mDgAIw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pyt7/qgzD7nW9niVtKdHoFwfVAOB2d8j82jvhcjk0priikg91FsSEmvqeI5XWcxzp
 wz+CwQOPhyAENscWPWN9rMI20nM9tlhiNq4Zmb8i+a4Vi3vuRYjXd6P1tqsFwgpAY+
 JbxQx9S0ksLRB58S2crNPU0JmGoFIHyQFrzeNMBE=
Date: Tue, 18 May 2021 10:45:14 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v5 16/23] target/ppc: Implement prefixed integer load
 instructions
Message-ID: <YKMOGp2pEXYDOYWh@yekko>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-17-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="X+bJRZyy0d6ym/Ii"
Content-Disposition: inline
In-Reply-To: <20210517205025.3777947-17-matheus.ferst@eldorado.org.br>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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


--X+bJRZyy0d6ym/Ii
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 05:50:18PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/insn64.decode                   | 15 +++++++++++++++
>  target/ppc/translate/fixedpoint-impl.c.inc | 16 ++++++++++++++++
>  2 files changed, 31 insertions(+)
>=20
> diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
> index 9aa5097a98..547bd1736f 100644
> --- a/target/ppc/insn64.decode
> +++ b/target/ppc/insn64.decode
> @@ -24,6 +24,21 @@
>                  ...... rt:5 ra:5 ................       \
>                  &PLS_D si=3D%pls_si
> =20
> +### Fixed-Point Load Instructions
> +
> +PLBZ            000001 10 0--.-- .................. \
> +                100010 ..... ..... ................     @PLS_D
> +PLHZ            000001 10 0--.-- .................. \
> +                101000 ..... ..... ................     @PLS_D
> +PLHA            000001 10 0--.-- .................. \
> +                101010 ..... ..... ................     @PLS_D
> +PLWZ            000001 10 0--.-- .................. \
> +                100000 ..... ..... ................     @PLS_D
> +PLWA            000001 00 0--.-- .................. \
> +                101001 ..... ..... ................     @PLS_D
> +PLD             000001 00 0--.-- .................. \
> +                111001 ..... ..... ................     @PLS_D
> +
>  ### Fixed-Point Arithmetic Instructions
> =20
>  PADDI           000001 10 0--.-- ..................     \
> diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/tran=
slate/fixedpoint-impl.c.inc
> index 6140dd41ca..7687f31d6f 100644
> --- a/target/ppc/translate/fixedpoint-impl.c.inc
> +++ b/target/ppc/translate/fixedpoint-impl.c.inc
> @@ -80,6 +80,16 @@ static bool do_ldst_D(DisasContext *ctx, arg_D *a, boo=
l update, bool store,
>      return do_ldst(ctx, a->rt, a->ra, tcg_constant_tl(a->si), update, st=
ore, mop);
>  }
> =20
> +static bool do_ldst_PLS_D(DisasContext *ctx, arg_PLS_D *a, bool update,
> +                          bool store, MemOp mop)
> +{
> +    arg_D d;
> +    if (!resolve_PLS_D(ctx, &d, a)) {
> +        return true;
> +    }
> +    return do_ldst_D(ctx, &d, update, store, mop);
> +}
> +
>  static bool do_ldst_X(DisasContext *ctx, arg_X *a, bool update,
>                        bool store, MemOp mop)
>  {
> @@ -91,35 +101,41 @@ TRANS(LBZ, do_ldst_D, false, false, MO_UB)
>  TRANS(LBZX, do_ldst_X, false, false, MO_UB)
>  TRANS(LBZU, do_ldst_D, true, false, MO_UB)
>  TRANS(LBZUX, do_ldst_X, true, false, MO_UB)
> +TRANS(PLBZ, do_ldst_PLS_D, false, false, MO_UB)
> =20
>  /* Load Halfword and Zero */
>  TRANS(LHZ, do_ldst_D, false, false, MO_UW)
>  TRANS(LHZX, do_ldst_X, false, false, MO_UW)
>  TRANS(LHZU, do_ldst_D, true, false, MO_UW)
>  TRANS(LHZUX, do_ldst_X, true, false, MO_UW)
> +TRANS(PLHZ, do_ldst_PLS_D, false, false, MO_UW)
> =20
>  /* Load Halfword Algebraic */
>  TRANS(LHA, do_ldst_D, false, false, MO_SW)
>  TRANS(LHAX, do_ldst_X, false, false, MO_SW)
>  TRANS(LHAU, do_ldst_D, true, false, MO_SW)
>  TRANS(LHAXU, do_ldst_X, true, false, MO_SW)
> +TRANS(PLHA, do_ldst_PLS_D, false, false, MO_SW)
> =20
>  /* Load Word and Zero */
>  TRANS(LWZ, do_ldst_D, false, false, MO_UL)
>  TRANS(LWZX, do_ldst_X, false, false, MO_UL)
>  TRANS(LWZU, do_ldst_D, true, false, MO_UL)
>  TRANS(LWZUX, do_ldst_X, true, false, MO_UL)
> +TRANS(PLWZ, do_ldst_PLS_D, false, false, MO_UL)
> =20
>  /* Load Word Algebraic */
>  TRANS64(LWA, do_ldst_D, false, false, MO_SL)
>  TRANS64(LWAX, do_ldst_X, false, false, MO_SL)
>  TRANS64(LWAUX, do_ldst_X, true, false, MO_SL)
> +TRANS64(PLWA, do_ldst_PLS_D, false, false, MO_SL)
> =20
>  /* Load Doubleword */
>  TRANS64(LD, do_ldst_D, false, false, MO_Q)
>  TRANS64(LDX, do_ldst_X, false, false, MO_Q)
>  TRANS64(LDU, do_ldst_D, true, false, MO_Q)
>  TRANS64(LDUX, do_ldst_X, true, false, MO_Q)
> +TRANS64(PLD, do_ldst_PLS_D, false, false, MO_Q)
> =20
>  /*
>   * Fixed-Point Arithmetic Instructions

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--X+bJRZyy0d6ym/Ii
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCjDhoACgkQbDjKyiDZ
s5L01xAAxpjZNHWj3JF5bJDzAiQA7FBh/F3zNi2PjDEWh3yPdK/zP+kSUOv1Z9Na
D5M3GQ2O5vnzuPRwVkNFOh3NLFWc8y/An1xcyJFl9gkwWf+ZtbunjDq727FhGJ/w
EMuzRXb91pq+ihOQhnlR+0MRJkK6Y02G1QaX/t6Y62pihCbwDQZHHDSBXjTZ+Va7
u1LoyAtiIeCOwmmpeyN8dvLVxWlcnvaDOiUCebEzgn3mWLMTSDkG075iyItNDDak
3/dFr/dnkXOIKiTtocDkPhp7i61Qymi5GxxQGD9yR606L5ZnQPDL7ZWCFQvA7eTs
+Ri/PoJjCPesTzO/UPDbicSWpm62ejBNdEbdngOgf1MmYlBoD0qZn172yWfTr/iA
05qs+i3H+fhxdZas7d+PczeyG6dlGby6n3oaZ+xN2DniqWw1C9yHqwxsWv8KhdU/
Fqn7/O6pQViwpEUM7yEGFENChl4RCpIECbIAwANnIwbuaxc14NIapuf5dFIm0rF0
33iBGcnWuyhWp24MYbRdWTl0fY2JObfp+vzO37RozM5U5b5o2EQJro1bi5Ketmj4
7cBOENHX98bH3B5FfmYjC3IxkQfk0Uktz4d8wlgeS/ElrWw8OOjeMOJHs7tukLWJ
NmxnDMmPpORruPKYZyEwREZoz6+KwYpbjOQ2q8anxRzjxwBPYZI=
=Ro85
-----END PGP SIGNATURE-----

--X+bJRZyy0d6ym/Ii--

