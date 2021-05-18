Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE531386F93
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 03:46:54 +0200 (CEST)
Received: from localhost ([::1]:53724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lioov-0003Le-TG
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 21:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeQ-00073f-2C; Mon, 17 May 2021 21:36:02 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:43313 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeN-0007D5-CK; Mon, 17 May 2021 21:36:01 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fkdqh3lF8z9t0Y; Tue, 18 May 2021 11:35:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621301744;
 bh=tKYnTvCz+7foIxgFoB5GZIZwXwRf6yir+iGUuTorkt8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jUetS4dyoUBEEj0xAT9t8NwPr9ctJkKK9V4pVfjOzZPN2Wq+/5JqGNs4sCbs89aDW
 NQuGGzm2bbvsp2sfDmo5UB9x37MMhzJFDwjzQcM6EL2MOrcaPlEBlJRMURhMpvVb0Q
 YT9LrTfdMV9MdOymR90WqglKUKr/Q07nkW8ex8s8=
Date: Tue, 18 May 2021 10:49:07 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v5 19/23] target/ppc: Implement
 setbc/setbcr/stnbc/setnbcr instructions
Message-ID: <YKMPA0+w7RKDhUHE@yekko>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-20-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gIXbgaw1Nl5VZqSZ"
Content-Disposition: inline
In-Reply-To: <20210517205025.3777947-20-matheus.ferst@eldorado.org.br>
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


--gIXbgaw1Nl5VZqSZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 05:50:21PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>=20
> Implements the following PowerISA v3.1 instructions:
> setbc: Set Boolean Condition
> setbcr: Set Boolean Condition Reverse
> setnbc: Set Negative Boolean Condition
> setnbcr: Set Negative Boolean Condition Reverse
>=20
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
> v5:
> - Style fix;
> - Use tcg_gen_setcondi_tl instead of tcg_gen_movcond_tl.
> ---
>  target/ppc/insn32.decode                   | 10 ++++++++++
>  target/ppc/translate/fixedpoint-impl.c.inc | 23 ++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>=20
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index 00ec0f4328..bc69c70493 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -26,6 +26,9 @@
>  &X              rt ra rb
>  @X              ...... rt:5 ra:5 rb:5 .......... .      &X
> =20
> +&X_bi           rt bi
> +@X_bi           ...... rt:5 bi:5 ----- .......... -     &X_bi
> +
>  ### Fixed-Point Load Instructions
> =20
>  LBZ             100010 ..... ..... ................     @D
> @@ -83,3 +86,10 @@ STDUX           011111 ..... ..... ..... 0010110101 - =
  @X
> =20
>  ADDI            001110 ..... ..... ................     @D
>  ADDIS           001111 ..... ..... ................     @D
> +
> +### Move To/From System Register Instructions
> +
> +SETBC           011111 ..... ..... ----- 0110000000 -   @X_bi
> +SETBCR          011111 ..... ..... ----- 0110100000 -   @X_bi
> +SETNBC          011111 ..... ..... ----- 0111000000 -   @X_bi
> +SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
> diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/tran=
slate/fixedpoint-impl.c.inc
> index 2d2d874146..204848d017 100644
> --- a/target/ppc/translate/fixedpoint-impl.c.inc
> +++ b/target/ppc/translate/fixedpoint-impl.c.inc
> @@ -204,3 +204,26 @@ static bool trans_PNOP(DisasContext *ctx, arg_PNOP *=
a)
>  {
>      return true;
>  }
> +
> +static bool do_set_bool_cond(DisasContext *ctx, arg_X_bi *a, bool neg, b=
ool rev)
> +{
> +    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
> +    uint32_t mask =3D 0x08 >> (a->bi & 0x03);
> +    TCGCond cond =3D rev ? TCG_COND_EQ : TCG_COND_NE;
> +    TCGv temp =3D tcg_temp_new();
> +
> +    tcg_gen_extu_i32_tl(temp, cpu_crf[a->bi >> 2]);
> +    tcg_gen_andi_tl(temp, temp, mask);
> +    tcg_gen_setcondi_tl(cond, cpu_gpr[a->rt], temp, 0);
> +    if(neg) {
> +        tcg_gen_neg_tl(cpu_gpr[a->rt], cpu_gpr[a->rt]);
> +    }
> +    tcg_temp_free(temp);
> +
> +    return true;
> +}
> +
> +TRANS(SETBC, do_set_bool_cond, false, false)
> +TRANS(SETBCR, do_set_bool_cond, false, true)
> +TRANS(SETNBC, do_set_bool_cond, true, false)
> +TRANS(SETNBCR, do_set_bool_cond, true, true)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gIXbgaw1Nl5VZqSZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCjDwMACgkQbDjKyiDZ
s5JJWw/+JJCEWDZ0cLfAmfoU730sIn5N44CJ/Pz+1CUYgpXtJN//oMvuzpPnBzfn
cViyi7njDGayYpg/EDmXwxVMaM1nFkx7Ih24nhNYqgkfig/QyYf2mTQtpQD9CBBY
bRW9HpAQjb8d7pfcAj05kdRoDQIf4cPrbcCd0GRjr16uS9MjhSGhbV4u1EkMMLim
R6Rwlgd4pS++aWjR638cDuG/wS5hlqAbmgHSvg7kTR8/U00RBM/kw8hNpVhDQgjD
33fc7lIS/Qng5QmZFUumOP4btIlTWpZoIT+LPK+cX/U+CwgeV8iXUmSlfwnUz+JI
LR91E1fp681Olfv2GefTARgdeF0qmLAaUEBrZOuggGCV5KaQKZ1IXB6znxItB1R1
0ZoOeNc/1zUiyd0RW+FVRuFhxIdn0eU9sYTZkibICKaebhkJYBq6XhSSIg9JFFdy
EMng1zNH9OD4zFPOC6wfIqTYAoAT5pab1MBwFVDusgQdXFuJQSBX4lGEGC6UT+D5
6hCktR4unzW0haIV9rZn6JuXXe+ams0rIGoUFC81EcMPIZ25jv/AGiB3puYWmof7
WCHYK25xTVhQeAlb0pHjFKpjnL3G93lvpu+GQ19C0+4Qot7cEMGdSitI7s+sl7P/
WRPZWdQIoFzYk4CmO3L0sAi4n8mqofLYeXYqzKMTodj3pcwu7l8=
=Raov
-----END PGP SIGNATURE-----

--gIXbgaw1Nl5VZqSZ--

