Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13F2386F8A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 03:43:50 +0200 (CEST)
Received: from localhost ([::1]:45454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liolx-0006G3-Ty
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 21:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeI-000709-QU; Mon, 17 May 2021 21:35:56 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:34561 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeG-00074V-Pu; Mon, 17 May 2021 21:35:54 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fkdqd3Qprz9shn; Tue, 18 May 2021 11:35:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621301741;
 bh=z4tJq5uWjFhLEYy3BWdA7DrsK/U7ZcNzHiLaYEUfZ6A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FoqPDr2Y7oft18lo5cJWlPwaYqAcnFy2qqKmaAXlGbC8HFmQ56LeHqa3O0g94ym+1
 kSK+PLMvf/C65vGJWwI4fd0lZ0UC2/ZzzK9iwIBq/HZfmxpNpDKhY/3mGHexQe8LnA
 s9Z1KUNVfwXoANq6w+KsM7SPq9FKy+crmkT3/INo=
Date: Tue, 18 May 2021 10:23:07 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v5 10/23] target/ppc: Move page crossing check to
 ppc_tr_translate_insn
Message-ID: <YKMI64ZR2O0/WXFg@yekko>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-11-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="C8QhcWcSVVYK+PMK"
Content-Disposition: inline
In-Reply-To: <20210517205025.3777947-11-matheus.ferst@eldorado.org.br>
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


--C8QhcWcSVVYK+PMK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 05:50:12PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> With prefixed instructions, the number of instructions
> remaining until the page crossing is no longer constant.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/translate.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index dc0f5fafc2..b1873d2dcc 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -9060,9 +9060,6 @@ static void ppc_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
> =20
>      if (ctx->singlestep_enabled & (CPU_SINGLE_STEP | GDBSTUB_SINGLE_STEP=
)) {
>          ctx->base.max_insns =3D 1;
> -    } else {
> -        int bound =3D -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
> -        ctx->base.max_insns =3D MIN(ctx->base.max_insns, bound);
>      }
>  }
> =20
> @@ -9117,6 +9114,11 @@ static void ppc_tr_translate_insn(DisasContextBase=
 *dcbase, CPUState *cs)
>      handler->count++;
>  #endif
> =20
> +    /* End the TB when crossing a page boundary. */
> +    if (ctx->base.is_jmp =3D=3D DISAS_NEXT && !(pc & ~TARGET_PAGE_MASK))=
 {
> +        ctx->base.is_jmp =3D DISAS_TOO_MANY;
> +    }
> +
>      translator_loop_temp_check(&ctx->base);
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--C8QhcWcSVVYK+PMK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCjCOsACgkQbDjKyiDZ
s5J3Tw/+MjGdQspvF4EgZ71GfxBZ82vT//pEZh5aEHwzjZiL9J0opehVku0joctR
bKDqH639wpgm8W+6s4LSPtjlIsznnmXkwUj7ZxcFrWLkC14UVI6vGbMNG/ARaRGT
fIhsyvwEOmq3WoAwX9JW3V81Nvk0FI8B6ZJmY5XQ77FCO8uJQ2GFIVBXKaPfHhYe
lFoygO6TxQQkEvf7Y18B93v4yR/Y4GgPeaoLUMnvPCmmsfE6eOFBUK9s/jdEB7b4
vfjx2q7MtGSojvS0qLK0Ple+2yY41z1m50i2+vErPlQuqWOElpVH1xynskK+ucr/
bwnKtBHcHr+IghiObzHDDr48GOvR4uY+uaUb2J2mpfhTHgLVAS0vaeCEQUvkrmiP
NkVBc8IBAKNvwwXuQRxOPj8lY6GC2vN9mLpPl/giIX3sAuEU3fffB6WJKHTUEVl0
jSS74ScYCLiHqv6g5uJq42mjz4xqjKsrXeA6SIhxzaAlt/QK9OPSJxLxmpLz9YN9
SSoEdNhh+N0n+Lv2G5i/AwgdFXyzF8H96x/04DHQfjqJZxRCESmWP+SSCZZkHPUi
b8I4qyGUMALqVThvBkyJkVSegOwi2MmQVOXVHv03RWDNfe9XnJtRotuoA/Rrxq1+
Qkkjl+aXDA5pHuQ2re0Ttzea1xvkreCWCxoshBXR9MWvS/L1y+A=
=qEJz
-----END PGP SIGNATURE-----

--C8QhcWcSVVYK+PMK--

