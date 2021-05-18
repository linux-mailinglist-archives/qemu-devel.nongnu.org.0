Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B286386F86
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 03:43:35 +0200 (CEST)
Received: from localhost ([::1]:44290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lioli-0005T4-6u
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 21:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeH-0006vN-IA; Mon, 17 May 2021 21:35:53 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:33673 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeF-00072T-6E; Mon, 17 May 2021 21:35:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fkdqc64wqz9sXh; Tue, 18 May 2021 11:35:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621301740;
 bh=hOlckb1Oi/M/ZiiYTNplboRsIHaU9twB+jcibHTGSS4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MTSkVWHdD0TW0yG64fDHvdyM30xZD3VtV1JAuoNZxAu+j4mN/qCJt3XTvE7BCh3+b
 SFEgd9Cdt2oE9wWlidQu1ZT605BwQPco+jKbujPHyc5qqdjMJY9LyZ31f7lCtFIKNQ
 Ys3shbYZ5L3SeLqUrcHOTmq/k/2OgNTWIZNRhBBA=
Date: Tue, 18 May 2021 10:21:53 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v5 09/23] target/ppc: Introduce macros to check isa
 extensions
Message-ID: <YKMIoVtZ5P8SeGBO@yekko>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-10-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gPEGj+0mYXtlC+lm"
Content-Disposition: inline
In-Reply-To: <20210517205025.3777947-10-matheus.ferst@eldorado.org.br>
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


--gPEGj+0mYXtlC+lm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 05:50:11PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> These will be used by the decodetree trans_* functions
> to early-exit when the instruction set is not enabled.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/translate.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index ea200f9637..dc0f5fafc2 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -7750,6 +7750,32 @@ static inline void set_avr64(int regno, TCGv_i64 s=
rc, bool high)
>      tcg_gen_st_i64(src, cpu_env, avr64_offset(regno, high));
>  }
> =20
> +/*
> + * Helpers for trans_* functions to check for specific insns flags.
> + * Use token pasting to ensure that we use the proper flag with the
> + * proper variable.
> + */
> +#define REQUIRE_INSNS_FLAGS(CTX, NAME) \
> +    do {                                                \
> +        if (((CTX)->insns_flags & PPC_##NAME) =3D=3D 0) {   \
> +            return false;                               \
> +        }                                               \
> +    } while (0)
> +
> +#define REQUIRE_INSNS_FLAGS2(CTX, NAME) \
> +    do {                                                \
> +        if (((CTX)->insns_flags2 & PPC2_##NAME) =3D=3D 0) { \
> +            return false;                               \
> +        }                                               \
> +    } while (0)
> +
> +/* Then special-case the check for 64-bit so that we elide code for ppc3=
2. */
> +#if TARGET_LONG_BITS =3D=3D 32
> +# define REQUIRE_64BIT(CTX)  return false
> +#else
> +# define REQUIRE_64BIT(CTX)  REQUIRE_INSNS_FLAGS(CTX, 64B)
> +#endif
> +
>  #include "translate/fp-impl.c.inc"
> =20
>  #include "translate/vmx-impl.c.inc"

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gPEGj+0mYXtlC+lm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCjCKAACgkQbDjKyiDZ
s5K3qhAAtz+Tf9o3VG8/LACmvG9AFBZvgt2Z5HjRj91qKwjfxSiFO/FoYvFZV/zw
e1M/+b8kWEkShIe95P8L+euSliefjhqNXLNXtULKbKp0ppu5IJy/HlttQ2CeJcYf
Ou0Rs+K066vJDi6XzexG2Tw4SW0v/o9/9pOwYKgGW2eDY0kcK47l9P93M1hSM8gN
CYh1G0JkWlcysDqiu19tyH16Qrw1IMfQdGdMY99G0h/5xV9oVg7sQuXH2nophnCZ
FAzZZmBF3I4HEUhn19zfFzHj3YhFrSHwhMWDEZJsYeVtre27qplamHtDgAeWU4nd
As2+r6x278+lxPqsYctHmca8IM88WEYVJ8Hxk8jH3HwLPj+aBpXo6KpNn36jFTk2
O/V3ytbPz+7kTN1txIw+4VmCYKLIAAFTdTNj8UV02KAYuiUmHsfBP/Rrhi4/k352
DBXe3aCb+jWvPgJKfUtclzAaQbO+m2Msz+X0Dfp1xdCdCDNOFE6eUVRekG7nEG+6
2zUMvwtC91XxFKV7Ex6dmfeU6GWIeeQH8TLRC5heWpuE4IUskKe22pRsx4JMzp+q
cdllHZfV/t22AwD9+FPhSIGDGFjGvPINNW0DwwNerv4+3VyKgOTkHk9AqxPFadyb
jsY1HDEG7JACqFGg/yuD7wfSchztiqKvHR9XoiArTd8HWXHRsnA=
=XQf3
-----END PGP SIGNATURE-----

--gPEGj+0mYXtlC+lm--

