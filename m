Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD2A386FAB
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 03:54:21 +0200 (CEST)
Received: from localhost ([::1]:52464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liow8-0004hl-Le
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 21:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioel-0007YC-SO; Mon, 17 May 2021 21:36:23 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:59173 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioei-0007D6-FW; Mon, 17 May 2021 21:36:22 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fkdqj09Ycz9t0k; Tue, 18 May 2021 11:35:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621301745;
 bh=RUZr+lkAvURPPZwis1BbtvOQv9V9998iL1AeBjzBtIk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V3yv8eTTTkyCCs4aHkIfRNO46mAnFao40X7euKgjuUe8+agJYzaf4mi+ieghefDoZ
 F6uF8GUF/TSohdFv5QjB+jIQuhiYrzEOhSRgP2/Dg37jLXwEsgerkbzt0ZhdDxsjiH
 XSttKh9Lx+2k86A1NRQeAvfgRaJn8P13LmOTFX5c=
Date: Tue, 18 May 2021 10:51:07 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v5 20/23] target/ppc: Implement cfuged instruction
Message-ID: <YKMPe0n3H5fh/3zl@yekko>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-21-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FUUekE2Blt+2hP6J"
Content-Disposition: inline
In-Reply-To: <20210517205025.3777947-21-matheus.ferst@eldorado.org.br>
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


--FUUekE2Blt+2hP6J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 05:50:22PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>=20
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
> v5:
> - Comments to explain helper_cfuged implementation.
> ---
>  target/ppc/helper.h                        |  1 +
>  target/ppc/insn32.decode                   |  4 ++
>  target/ppc/int_helper.c                    | 62 ++++++++++++++++++++++
>  target/ppc/translate/fixedpoint-impl.c.inc | 12 +++++
>  4 files changed, 79 insertions(+)
>=20
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index ea9f2a236c..c517b9f025 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -46,6 +46,7 @@ DEF_HELPER_4(divwe, tl, env, tl, tl, i32)
>  DEF_HELPER_FLAGS_1(popcntb, TCG_CALL_NO_RWG_SE, tl, tl)
>  DEF_HELPER_FLAGS_2(cmpb, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>  DEF_HELPER_3(sraw, tl, env, tl, tl)
> +DEF_HELPER_FLAGS_2(cfuged, TCG_CALL_NO_RWG_SE, i64, i64, i64)
>  #if defined(TARGET_PPC64)
>  DEF_HELPER_FLAGS_2(cmpeqb, TCG_CALL_NO_RWG_SE, i32, tl, tl)
>  DEF_HELPER_FLAGS_1(popcntw, TCG_CALL_NO_RWG_SE, tl, tl)
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index bc69c70493..d4044d9069 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -87,6 +87,10 @@ STDUX           011111 ..... ..... ..... 0010110101 - =
  @X
>  ADDI            001110 ..... ..... ................     @D
>  ADDIS           001111 ..... ..... ................     @D
> =20
> +## Fixed-Point Logical Instructions
> +
> +CFUGED          011111 ..... ..... ..... 0011011100 -   @X
> +
>  ### Move To/From System Register Instructions
> =20
>  SETBC           011111 ..... ..... ----- 0110000000 -   @X_bi
> diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
> index 41f8477d4b..efa833ef64 100644
> --- a/target/ppc/int_helper.c
> +++ b/target/ppc/int_helper.c
> @@ -320,6 +320,68 @@ target_ulong helper_popcntb(target_ulong val)
>  }
>  #endif
> =20
> +uint64_t helper_cfuged(uint64_t src, uint64_t mask)
> +{
> +    /*
> +     * Instead of processing the mask bit-by-bit from the most significa=
nt to
> +     * the least significant bit, as described in PowerISA, we'll handle=
 it in
> +     * blocks of 'n' zeros/ones from LSB to MSB. To avoid the decision t=
o use
> +     * ctz or cto, we negate the mask at the end of the loop.
> +     */
> +    target_ulong m, left =3D 0, right =3D 0;
> +    unsigned int n, i =3D 64;
> +    bool bit =3D false; /* tracks if we are processing zeros or ones */
> +
> +    if (mask =3D=3D 0 || mask =3D=3D -1) {
> +        return src;
> +    }
> +
> +    /* Processes the mask in blocks, from LSB to MSB */
> +    while (i) {
> +        /* Find how many bits we should take */
> +        n =3D ctz64(mask);
> +        if (n > i) {
> +            n =3D i;
> +        }
> +
> +        /*
> +         * Extracts 'n' trailing bits of src and put them on the leading=
 'n'
> +         * bits of 'right' or 'left', pushing down the previously extrac=
ted
> +         * values.
> +         */
> +        m =3D (1ll << n) - 1;
> +        if (bit) {
> +            right =3D ror64(right | (src & m), n);
> +        } else {
> +            left =3D ror64(left | (src & m), n);
> +        }
> +
> +        /*
> +         * Discards the processed bits from 'src' and 'mask'. Note that =
we are
> +         * removing 'n' trailing zeros from 'mask', but the logical shif=
t will
> +         * add 'n' leading zeros back, so the population count of 'mask'=
 is kept
> +         * the same.
> +         */
> +        src >>=3D n;
> +        mask >>=3D n;
> +        i -=3D n;
> +        bit =3D !bit;
> +        mask =3D ~mask;
> +    }
> +
> +    /*
> +     * At the end, right was ror'ed ctpop(mask) times. To put it back in=
 place,
> +     * we'll shift it more 64-ctpop(mask) times.
> +     */
> +    if (bit) {
> +        n =3D ctpop64(mask);
> +    } else {
> +        n =3D 64 - ctpop64(mask);
> +    }
> +
> +    return left | (right >> n);
> +}
> +
>  /***********************************************************************=
******/
>  /* PowerPC 601 specific instructions (POWER bridge) */
>  target_ulong helper_div(CPUPPCState *env, target_ulong arg1, target_ulon=
g arg2)
> diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/tran=
slate/fixedpoint-impl.c.inc
> index 204848d017..4038143efb 100644
> --- a/target/ppc/translate/fixedpoint-impl.c.inc
> +++ b/target/ppc/translate/fixedpoint-impl.c.inc
> @@ -227,3 +227,15 @@ TRANS(SETBC, do_set_bool_cond, false, false)
>  TRANS(SETBCR, do_set_bool_cond, false, true)
>  TRANS(SETNBC, do_set_bool_cond, true, false)
>  TRANS(SETNBCR, do_set_bool_cond, true, true)
> +
> +static bool trans_CFUGED(DisasContext *ctx, arg_X *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
> +#if defined(TARGET_PPC64)
> +    gen_helper_cfuged(cpu_gpr[a->ra], cpu_gpr[a->rt], cpu_gpr[a->rb]);
> +#else
> +    qemu_build_not_reached();
> +#endif
> +    return true;
> +}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--FUUekE2Blt+2hP6J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCjD3oACgkQbDjKyiDZ
s5JV+RAAsSLpzsqZPt8DitN4GvmAxRfxxcEZGMeG5gC3PARTwLgPLDYon3hMGD2u
B5dCpCtLeJRYISPCIHx3WdoYmJL9CMBb4lszcvJhTkJYgNuFeaPWOui5XrsTYG9w
3/cRltlpy7MNsdKMB/0vNSsWGNJFqznoWJLgZERT+tPz3+G6Qp+rS7WyjZQcVA13
jKYu6ir+0Clzxh6+ajNRdG8/2cPoqG5o5fJKADX4xDUB4NQ3TlBrGMpznEdtGSCX
k0B5WAx3D8Nkm1ZIuhRFLadpLjCEVeCgDbGdhwFsMjb01dIelEvqY6tjnwtJ4E/w
f09Nhmv9+fnEsxiUIjQctNOMqgu9tMhPpY78bweCWiq/w9jWYpJW+tTmAdbZAOcm
Lv95hINvHTPakg9YNyKwwBWw5OdbMFyR0zmkeC/kBxWp6TTfa76AdJwxWKfSw+ni
uo68WyFSe05SNG5MP9m9TIjz5yGEC/0wT+k/SBkUJEKqdFNsCMb3wScmpwfwWP0r
++6+1o+xAcIlsWjePhc5tGFIkCVnhmpC3yFtmC1XxKsdaH6XJDHyL0Cc/IfHxtRg
DhJApJJKO42tqf2XBgyI5O+Vr1rF2ZwvfFyKSXLm7uQAJ9dOedpam4syXOBwYSEr
ds5wAb6PXKpG1tm2dWE5qwNBb/iFzdsndgILNuJz3Im8PTr24B8=
=NqFP
-----END PGP SIGNATURE-----

--FUUekE2Blt+2hP6J--

