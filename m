Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD445386FA4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 03:51:57 +0200 (CEST)
Received: from localhost ([::1]:44834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lioto-00081o-VF
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 21:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioep-0007c7-O5; Mon, 17 May 2021 21:36:27 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:52829 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioem-0007Fc-5l; Mon, 17 May 2021 21:36:27 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fkdqj30CZz9t0p; Tue, 18 May 2021 11:35:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621301745;
 bh=lJCycMlbrf+YqMnkL/WbkaMvQ1adckBdLSwQRoUMA/k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B2LGt77QyTIGg277blJgQXYoPhNRGfg4vbbwmf905ZhwqAF1s/ip366ObwdAu0LEC
 0VhBWb5C+SjCvbqF7tTbarG48XMo9wPCtkk3hILf0lU6cBsk0mJeU5plykQlaNgH4F
 z1jEtdX6W8hXvR4Mmeus0mIM3fVXbi9TkNEAPlKY=
Date: Tue, 18 May 2021 10:52:49 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v5 21/23] target/ppc: Implement vcfuged instruction
Message-ID: <YKMP4df+y73DelmY@yekko>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-22-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PNvJm2mAjztaP4q/"
Content-Disposition: inline
In-Reply-To: <20210517205025.3777947-22-matheus.ferst@eldorado.org.br>
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


--PNvJm2mAjztaP4q/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 05:50:23PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>=20
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
> v5:
> - New REQUIRE_ALTIVEC macro;
> - REQUIRE_INSNS_FLAGS2.
> ---
>  target/ppc/insn32.decode               |  7 ++++
>  target/ppc/translate.c                 |  1 +
>  target/ppc/translate/vector-impl.c.inc | 56 ++++++++++++++++++++++++++
>  3 files changed, 64 insertions(+)
>  create mode 100644 target/ppc/translate/vector-impl.c.inc
>=20
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index d4044d9069..77edf407ab 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -23,6 +23,9 @@
>  %ds_si          2:s14  !function=3Dtimes_4
>  @DS             ...... rt:5 ra:5 .............. ..      &D si=3D%ds_si
> =20
> +&VX             vrt vra vrb
> +@VX             ...... vrt:5 vra:5 vrb:5 .......... .   &VX
> +
>  &X              rt ra rb
>  @X              ...... rt:5 ra:5 rb:5 .......... .      &X
> =20
> @@ -97,3 +100,7 @@ SETBC           011111 ..... ..... ----- 0110000000 - =
  @X_bi
>  SETBCR          011111 ..... ..... ----- 0110100000 -   @X_bi
>  SETNBC          011111 ..... ..... ----- 0111000000 -   @X_bi
>  SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
> +
> +## Vector Bit Manipulation Instruction
> +
> +VCFUGED         000100 ..... ..... ..... 10101001101    @VX
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index bf624edba6..f56ed5866e 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -7624,6 +7624,7 @@ static int times_4(DisasContext *ctx, int x)
>  #include "translate/vmx-impl.c.inc"
> =20
>  #include "translate/vsx-impl.c.inc"
> +#include "translate/vector-impl.c.inc"
> =20
>  #include "translate/dfp-impl.c.inc"
> =20
> diff --git a/target/ppc/translate/vector-impl.c.inc b/target/ppc/translat=
e/vector-impl.c.inc
> new file mode 100644
> index 0000000000..4f986cf53f
> --- /dev/null
> +++ b/target/ppc/translate/vector-impl.c.inc
> @@ -0,0 +1,56 @@
> +/*
> + * Power ISA decode for Vector Facility instructions
> + *
> + * Copyright (c) 2021 Instituto de Pesquisas Eldorado (eldorado.org.br)
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
> + */
> +
> +#define REQUIRE_ALTIVEC(CTX) \
> +    do {                                                \
> +        if (unlikely(!(CTX)->altivec_enabled)) {        \
> +            gen_exception((CTX), POWERPC_EXCP_VPU);     \
> +            return true;                                \
> +        }                                               \
> +    } while (0)
> +
> +static bool trans_VCFUGED(DisasContext *ctx, arg_VX *a)
> +{
> +    TCGv_i64 tgt, src, mask;
> +
> +    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
> +    REQUIRE_ALTIVEC(ctx);
> +
> +    tgt =3D tcg_temp_new_i64();
> +    src =3D tcg_temp_new_i64();
> +    mask =3D tcg_temp_new_i64();
> +
> +    // centrifuge lower double word
> +    get_cpu_vsrl(src, a->vra + 32);
> +    get_cpu_vsrl(mask, a->vrb + 32);
> +    gen_helper_cfuged(tgt, src, mask);
> +    set_cpu_vsrl(a->vrt + 32, tgt);
> +
> +    // centrifuge higher double word
> +    get_cpu_vsrh(src, a->vra + 32);
> +    get_cpu_vsrh(mask, a->vrb + 32);
> +    gen_helper_cfuged(tgt, src, mask);
> +    set_cpu_vsrh(a->vrt + 32, tgt);
> +
> +    tcg_temp_free_i64(tgt);
> +    tcg_temp_free_i64(src);
> +    tcg_temp_free_i64(mask);
> +
> +    return true;
> +}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PNvJm2mAjztaP4q/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCjD+EACgkQbDjKyiDZ
s5Ie+w/7B1Bnz75cewPQurkpDfb9wS1mo/eocOkFYgvkZQhpf2oVB/4A2gsdVnE7
vfhBBd5sPZ4N4mKcc31lcMjaUGtZj1JhSYuwJzLCxtr2r4O1M1g+eeV7nTk4ZBLI
mOy5p1EIJGy7WgX1J3H8Vz1Bch2Me0OufsW8mSb3WUBvnB4MI3W0zZqRTbsHwIKY
FgnwECINWlOyTY+XAGb5wpqge9Ju0k7kMdSUaF9CLR8FYk5XZtQsrZyT2t96Ohl5
FCdmi4YfvG+aHnxlM+Qe/mCt9CZT/UGPLuVOOzhRHui6L09QuHQNnKufik4iOL/u
Wl7HLmhsnAeBEQKwEgxjSWYLDadR0QZkmIZkLGBUll3hlCLW27/pW/Kh5dKl2Tdh
3ouZGejMzA+1CaxlxiatI1NUNvkz+M49/vHugOqwJWWpx0f0ZypTvyXqdhfUdhEZ
Onc/KUvGcx3d0en4L2Pa9m8+amWoy8RVAZmVnv5e/13oYHFrQNHJ63cPET/Ys6a3
5ErrSzf4ktBZy6H7VVHoOrlVmi82JkJnmZt19FuWMk3ALbQFHMHHuBY6KBlzZEgA
j0tCPR8y9r910G9YOpsyEe9glPXOfaunG3J9UtLwAwWQWyQ0X4eBlCzWqF8ACxOi
W62F78ycj9Ntxpd6wVaO7s1MljsgTKEkCSjE08wc75TsICXMaP8=
=9uCR
-----END PGP SIGNATURE-----

--PNvJm2mAjztaP4q/--

