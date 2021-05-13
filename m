Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9541837F23A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 06:31:59 +0200 (CEST)
Received: from localhost ([::1]:34710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh30w-0002i3-Jn
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 00:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sc-0007KB-4l; Thu, 13 May 2021 00:23:23 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:60921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sY-0004cy-G9; Thu, 13 May 2021 00:23:21 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fgdms6Dw4z9t1r; Thu, 13 May 2021 14:22:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620879773;
 bh=SU+T1iQwNA9wu57K8JjzdaKtuLfl357BkEa7NE5Yx00=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hb/CW2ktJihGN7FBJqISdvXxToOneKlYFVSdvC5DZ+P9YYqT4tiv3Kzv2naGFdgRy
 pVzmvl+VUdHrgMmxtYnN0Hb4tH7gVgHUEWLC6PaDCPmDTkesMrJXNr+Lq+czkif0bY
 PGLCfa/qL4GpPfch6kCXGthZLk4Voz+OFjahGtRw=
Date: Thu, 13 May 2021 14:08:23 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v4 06/31] target/ppc: Simplify gen_debug_exception
Message-ID: <YJymN7tl24jSOl0T@yekko>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
 <20210512185441.3619828-7-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IsiRBOesn8jab5HM"
Content-Disposition: inline
In-Reply-To: <20210512185441.3619828-7-matheus.ferst@eldorado.org.br>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 luis.pires@eldorado.org.br, qemu-ppc@nongnu.org, lagarcia@br.ibm.com,
 bruno.larsen@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--IsiRBOesn8jab5HM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 03:54:16PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> Two of the call sites that use gen_debug_exception have already
> updated NIP.  Only ppc_tr_breakpoint_check requires the update.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/translate.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 23de04a08e..7b23f85c11 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -326,19 +326,7 @@ static uint32_t gen_prep_dbgex(DisasContext *ctx)
> =20
>  static void gen_debug_exception(DisasContext *ctx)
>  {
> -    TCGv_i32 t0;
> -
> -    /*
> -     * These are all synchronous exceptions, we set the PC back to the
> -     * faulting instruction
> -     */
> -    if ((ctx->exception !=3D POWERPC_EXCP_BRANCH) &&
> -        (ctx->exception !=3D POWERPC_EXCP_SYNC)) {
> -        gen_update_nip(ctx, ctx->base.pc_next);
> -    }
> -    t0 =3D tcg_const_i32(EXCP_DEBUG);
> -    gen_helper_raise_exception(cpu_env, t0);
> -    tcg_temp_free_i32(t0);
> +    gen_helper_raise_exception(cpu_env, tcg_constant_i32(EXCP_DEBUG));
>      ctx->base.is_jmp =3D DISAS_NORETURN;
>  }
> =20
> @@ -9377,6 +9365,7 @@ static bool ppc_tr_breakpoint_check(DisasContextBas=
e *dcbase, CPUState *cs,
>  {
>      DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
> =20
> +    gen_update_nip(ctx, ctx->base.pc_next);
>      gen_debug_exception(ctx);
>      /*
>       * The address covered by the breakpoint must be included in

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--IsiRBOesn8jab5HM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCcpjcACgkQbDjKyiDZ
s5JXcw/8CRFQmWf7XW/cgo2NXiCAnuAxYm91vYZqG5dgfoo+M7Df/JphBaaADHJf
pHR8+LhoAU0NyaZGzpxAOIQJ6CaYmYOOfyGYz+fYU5RF7UPFKWlwUbPHxrAt2gZ3
SdqtoEd1XB6Sc7DR5R9DR3qT1eQH8mPvApbhhNe4hIRIhH+BoBmmBdMn2KVVOfn6
bLg87RvtHGKqAfGtWMLqmAyzRwMm/UK6IeoZMuJxBf8Sk7x7tY4GOVMaXk2jaIcG
sktaCwo/v9V8F5ZKQx59dsauJzCo1XjFJvPlaOjQQG7tTetgr0grvhbrxlQQzDuh
ogvGEO1gQb04UIRt/jNde119ps0s/3nGK798TDQxx+nTzyNWAzUzPApdz4nv230B
qWef2/ndYZYlX4w95WcXXoBoXCfCTlQLzFSJOOMSS45GGyzNlKDv5wI8c+EwSB0w
E1Foz1HtaBrK232RTQPeEuHeiS8QXIHUd+8c0CFRj2+DBkB3wXAWhNZYHlxSkQdP
1loxyxCT2nHE45Zhnj4GWj23fTC4YIpm/5v9i6ltbSjsXIO5XUWSCFkugXiGSRWy
0uEq4gGRBks7xH5vAjneEPIzA0EQ8vX45McBq5V6mrR0LfeSymRKOKzx9dN1bsmp
ZMo32iNpORdHGkHSjVqbx46D1qLzJinBjEsiVhB4R6qUpfc5XOo=
=EMvb
-----END PGP SIGNATURE-----

--IsiRBOesn8jab5HM--

