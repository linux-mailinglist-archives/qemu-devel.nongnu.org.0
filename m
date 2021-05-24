Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 516D238DFB6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 05:10:12 +0200 (CEST)
Received: from localhost ([::1]:51922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll0yp-0003MB-1H
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 23:10:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll0sV-0008BV-RO; Sun, 23 May 2021 23:03:40 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:60143 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll0sS-0000ZX-Dn; Sun, 23 May 2021 23:03:38 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FpMV43ftDz9sRf; Mon, 24 May 2021 13:03:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621825404;
 bh=3rZk/KADpaYCA0BY3oJyDy1gbi+ySeAM74V5G5s/IYE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=npQDZ7bgwCTAiGlbklHuIerV4xsdR9VXIO/Rw1KdscwuPIg7YY27z73eymOEK9Ovc
 qPTH9x33uuNiRBMqKBbvHMOHo/twdPWlvZ6+x8YkXU9Qr3NQ/4K9Wz6SA8wQwoRiG9
 yJPbaoqDqg/MP8PnVC1OcKjbSCZpEuU3qOG/4Ewk=
Date: Mon, 24 May 2021 12:38:33 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v3 3/9] target/ppc: reduce usage of fpscr_set_rounding_mode
Message-ID: <YKsRqZQiTQCmTbsy@yekko>
References: <20210521201759.85475-1-bruno.larsen@eldorado.org.br>
 <20210521201759.85475-4-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eydM/fiQeDRpiiK2"
Content-Disposition: inline
In-Reply-To: <20210521201759.85475-4-bruno.larsen@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--eydM/fiQeDRpiiK2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 21, 2021 at 05:17:53PM -0300, Bruno Larsen (billionai) wrote:
> It is preferable to store the current rounding mode and retore from that
> than recalculating from fpscr, so we changed the behavior of do_fri and
> VSX_ROUND to do it like that.
>=20
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/fpu_helper.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index 44315fca0b..a4a283df2b 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -822,6 +822,7 @@ static inline uint64_t do_fri(CPUPPCState *env, uint6=
4_t arg,
>                                int rounding_mode)
>  {
>      CPU_DoubleU farg;
> +    FloatRoundMode old_rounding_mode =3D get_float_rounding_mode(&env->f=
p_status);
> =20
>      farg.ll =3D arg;
> =20
> @@ -834,8 +835,7 @@ static inline uint64_t do_fri(CPUPPCState *env, uint6=
4_t arg,
>                        float_flag_inexact;
>          set_float_rounding_mode(rounding_mode, &env->fp_status);
>          farg.ll =3D float64_round_to_int(farg.d, &env->fp_status);
> -        /* Restore rounding mode from FPSCR */
> -        fpscr_set_rounding_mode(env);
> +        set_float_rounding_mode(old_rounding_mode, &env->fp_status);
> =20
>          /* fri* does not set FPSCR[XX] */
>          if (!inexact) {
> @@ -3136,8 +3136,10 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, =
ppc_vsr_t *xb)       \
>  {                                                                      \
>      ppc_vsr_t t =3D *xt;                                                =
 \
>      int i;                                                             \
> +    FloatRoundMode curr_rounding_mode;                                 \
>                                                                         \
>      if (rmode !=3D FLOAT_ROUND_CURRENT) {                               =
 \
> +        curr_rounding_mode =3D get_float_rounding_mode(&env->fp_status);=
 \
>          set_float_rounding_mode(rmode, &env->fp_status);               \
>      }                                                                  \
>                                                                         \
> @@ -3160,7 +3162,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, p=
pc_vsr_t *xb)       \
>       * mode from FPSCR                                                 \
>       */                                                                \
>      if (rmode !=3D FLOAT_ROUND_CURRENT) {                               =
 \
> -        fpscr_set_rounding_mode(env);                                  \
> +        set_float_rounding_mode(curr_rounding_mode, &env->fp_status);  \
>          env->fp_status.float_exception_flags &=3D ~float_flag_inexact;  =
 \
>      }                                                                  \
>                                                                         \

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--eydM/fiQeDRpiiK2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCrEagACgkQbDjKyiDZ
s5JOwQ/9G9rwP1ehI83UUGIiQj0DQPQ1ZksQ4Xw5btTTnmit06UtZwYy+FK4yTah
tnZn3pieaMdKXUqqPNUK5kLY4MaEOSOq2eC2g3NicBcaPP6THi5axuV+sMlztmN6
2touH3YUeiQ8xT74L0nqDaMcxv/jKGrCWqvLkmVMMZqqeKgYvA98Vv+MAMarWACj
bJfDuvH+pIyPUN4PKl9ZUPiVDQJ/8uh0nFb/hPh1CYwhnm0c2Y+KhBAruCNLa9ae
wFGxdWYU1n/gCJUFLnI2/Rrp7iXY1gG1nQuq8QzQIcekFTZ2xzTd5fersDxW2ki7
3qUM93KPotRyOMxqe2+pt3QOOteOqGF4j2fbmHLANxMReF3sV+cZbMeVRlM0pOtV
xOMgmSXz4BcwIyIAIjMlpIhWmwYjxERjKB1dE9YI10yB5iFgkG7L1uKf/e0QahPg
sC7dbMNiGll8ZSrshXYSQfcCCIYe2Y0HSoqZiF8C65BaYrCvqVYq99E0SjYjY6jn
h/apSD34tXXjfJ87TP2POLEWXNqLJkXFipr6cvKxMpPtYJ7tKYelTuxwlSR800oX
Fct/mRoscI5WWq3iQEKBBkQE8vOUsxvp0Jr9uzF4cKYcN4iZXDf7OsFFSu6/amjn
9/Wq2xRfx1KXIOMd6UbZkgFPelQ/klhn4uFslYunht1B8fIB3pM=
=DPDO
-----END PGP SIGNATURE-----

--eydM/fiQeDRpiiK2--

