Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B700E386F94
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 03:47:00 +0200 (CEST)
Received: from localhost ([::1]:54038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liop1-0003e8-O2
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 21:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeK-000715-HC; Mon, 17 May 2021 21:35:56 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:34151 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeH-00075J-R9; Mon, 17 May 2021 21:35:55 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fkdqd5b1hz9sfR; Tue, 18 May 2021 11:35:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621301741;
 bh=W/omS1iGupesz5U7izyx78ox/mlaHrFmt9oTWQwfXwk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M+8Pg91vUUGFTZXuM81ywe9xE7ao0jqDsVTVzdjx59KVp8D/ImPbTc3BOkxifi1Kc
 B5VdrwMfZaYwKqZqxh6YrGcZK2JCyTe2ejB9/bsrgsfXurBsgLNuI8Eou12wj+dbEO
 ftbOWF2Kzu1JXFOkwuuPd6A0zzqu4ZIa9+lTkOhs=
Date: Tue, 18 May 2021 10:35:40 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v5 12/23] target/ppc: Move ADDI, ADDIS to decodetree,
 implement PADDI
Message-ID: <YKML3O36xDPRlER3@yekko>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-13-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9zuFZm4HKVcW/hHr"
Content-Disposition: inline
In-Reply-To: <20210517205025.3777947-13-matheus.ferst@eldorado.org.br>
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


--9zuFZm4HKVcW/hHr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 05:50:14PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/insn32.decode                   |  8 ++++
>  target/ppc/insn64.decode                   | 12 ++++++
>  target/ppc/translate.c                     | 29 --------------
>  target/ppc/translate/fixedpoint-impl.c.inc | 44 ++++++++++++++++++++++
>  4 files changed, 64 insertions(+), 29 deletions(-)
>=20
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index a3a8ae06bf..e7c062d8b4 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -16,3 +16,11 @@
>  # You should have received a copy of the GNU Lesser General Public
>  # License along with this library; if not, see <http://www.gnu.org/licen=
ses/>.
>  #
> +
> +&D              rt ra si:int64_t
> +@D              ...... rt:5 ra:5 si:s16                 &D
> +
> +### Fixed-Point Arithmetic Instructions
> +
> +ADDI            001110 ..... ..... ................     @D
> +ADDIS           001111 ..... ..... ................     @D
> diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
> index a38b1f84dc..1965088915 100644
> --- a/target/ppc/insn64.decode
> +++ b/target/ppc/insn64.decode
> @@ -16,3 +16,15 @@
>  # You should have received a copy of the GNU Lesser General Public
>  # License along with this library; if not, see <http://www.gnu.org/licen=
ses/>.
>  #
> +
> +# Format MLS:D and 8LS:D
> +&PLS_D          rt ra si:int64_t r:bool
> +%pls_si         32:s18 0:16
> +@PLS_D          ...... .. ... r:1 .. .................. \
> +                ...... rt:5 ra:5 ................       \
> +                &PLS_D si=3D%pls_si
> +
> +### Fixed-Point Arithmetic Instructions
> +
> +PADDI           000001 10 0--.-- ..................     \
> +                001110 ..... ..... ................     @PLS_D
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 64d6acb078..5bf9001141 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -1846,19 +1846,6 @@ GEN_INT_ARITH_ADD(addex, 0x05, cpu_ov, 1, 1, 0);
>  /* addze  addze.  addzeo  addzeo.*/
>  GEN_INT_ARITH_ADD_CONST(addze, 0x06, 0, cpu_ca, 1, 1, 0)
>  GEN_INT_ARITH_ADD_CONST(addzeo, 0x16, 0, cpu_ca, 1, 1, 1)
> -/* addi */
> -static void gen_addi(DisasContext *ctx)
> -{
> -    target_long simm =3D SIMM(ctx->opcode);
> -
> -    if (rA(ctx->opcode) =3D=3D 0) {
> -        /* li case */
> -        tcg_gen_movi_tl(cpu_gpr[rD(ctx->opcode)], simm);
> -    } else {
> -        tcg_gen_addi_tl(cpu_gpr[rD(ctx->opcode)],
> -                        cpu_gpr[rA(ctx->opcode)], simm);
> -    }
> -}
>  /* addic  addic.*/
>  static inline void gen_op_addic(DisasContext *ctx, bool compute_rc0)
>  {
> @@ -1878,20 +1865,6 @@ static void gen_addic_(DisasContext *ctx)
>      gen_op_addic(ctx, 1);
>  }
> =20
> -/* addis */
> -static void gen_addis(DisasContext *ctx)
> -{
> -    target_long simm =3D SIMM(ctx->opcode);
> -
> -    if (rA(ctx->opcode) =3D=3D 0) {
> -        /* lis case */
> -        tcg_gen_movi_tl(cpu_gpr[rD(ctx->opcode)], simm << 16);
> -    } else {
> -        tcg_gen_addi_tl(cpu_gpr[rD(ctx->opcode)],
> -                        cpu_gpr[rA(ctx->opcode)], simm << 16);
> -    }
> -}
> -
>  /* addpcis */
>  static void gen_addpcis(DisasContext *ctx)
>  {
> @@ -7903,10 +7876,8 @@ GEN_HANDLER_E(cmpeqb, 0x1F, 0x00, 0x07, 0x00600000=
, PPC_NONE, PPC2_ISA300),
>  GEN_HANDLER_E(cmpb, 0x1F, 0x1C, 0x0F, 0x00000001, PPC_NONE, PPC2_ISA205),
>  GEN_HANDLER_E(cmprb, 0x1F, 0x00, 0x06, 0x00400001, PPC_NONE, PPC2_ISA300=
),
>  GEN_HANDLER(isel, 0x1F, 0x0F, 0xFF, 0x00000001, PPC_ISEL),
> -GEN_HANDLER(addi, 0x0E, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
>  GEN_HANDLER(addic, 0x0C, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
>  GEN_HANDLER2(addic_, "addic.", 0x0D, 0xFF, 0xFF, 0x00000000, PPC_INTEGER=
),
> -GEN_HANDLER(addis, 0x0F, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
>  GEN_HANDLER_E(addpcis, 0x13, 0x2, 0xFF, 0x00000000, PPC_NONE, PPC2_ISA30=
0),
>  GEN_HANDLER(mulhw, 0x1F, 0x0B, 0x02, 0x00000400, PPC_INTEGER),
>  GEN_HANDLER(mulhwu, 0x1F, 0x0B, 0x00, 0x00000400, PPC_INTEGER),
> diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/tran=
slate/fixedpoint-impl.c.inc
> index be75085cee..344a3ed54b 100644
> --- a/target/ppc/translate/fixedpoint-impl.c.inc
> +++ b/target/ppc/translate/fixedpoint-impl.c.inc
> @@ -16,3 +16,47 @@
>   * You should have received a copy of the GNU Lesser General Public
>   * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
>   */
> +
> +/*
> + * Incorporate CIA into the constant when R=3D1.
> + * Validate that when R=3D1, RA=3D0.
> + */
> +static bool resolve_PLS_D(DisasContext *ctx, arg_D *d, arg_PLS_D *a)
> +{
> +    d->rt =3D a->rt;
> +    d->ra =3D a->ra;
> +    d->si =3D a->si;
> +    if (a->r) {
> +        if (unlikely(a->ra !=3D 0)) {
> +            gen_invalid(ctx);
> +            return false;
> +        }
> +        d->si +=3D ctx->cia;
> +    }
> +    return true;
> +}
> +
> +static bool trans_ADDI(DisasContext *ctx, arg_D *a)
> +{
> +    if (a->ra) {
> +        tcg_gen_addi_tl(cpu_gpr[a->rt], cpu_gpr[a->ra], a->si);
> +    } else {
> +        tcg_gen_movi_tl(cpu_gpr[a->rt], a->si);
> +    }
> +    return true;
> +}
> +
> +static bool trans_PADDI(DisasContext *ctx, arg_PLS_D *a)
> +{
> +    arg_D d;
> +    if (!resolve_PLS_D(ctx, &d, a)) {
> +        return true;
> +    }
> +    return trans_ADDI(ctx, &d);
> +}
> +
> +static bool trans_ADDIS(DisasContext *ctx, arg_D *a)
> +{
> +    a->si <<=3D 16;
> +    return trans_ADDI(ctx, a);
> +}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9zuFZm4HKVcW/hHr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCjC9oACgkQbDjKyiDZ
s5IdNQ/9FHAa0yl/qLjPZTm6naB8hzLdJvQcTunu3ORpHbGBrzthKPtjBeLsfKQ6
l73ffuHSREp3wTw9aPhkO7k7p0PBK1VUXd2heL6dEXsIVCFzkrO/cw6I4AE55sU/
q0djZnh+Xq0fuyZKyNumwJdMRx57JCqdSL9pAuJnJ+li66mQUis4DTeWQleeVW+y
3t3/8sEzN7o/neHD4cv0x7PrN4IZd5jIE9eFtpCjTjGOBmb9KXm7lPXnbb9Vbae4
tnRlKG5A5fI8w+3dd/+yjbD+x2le3yVERFCbevssOlgsdvJTCpzos1Tc7IUncQ7c
edcQnG40+mqRuL4nIhfdqSlYhTMpBrgnkbMiKcZD5EH/OR2RvdOoSqTlOdxUswZM
aK1HStqFazxjElHD01Wao3dwUoVFdAFZACEe1A31ZSyxm1dwwrSTul+Ua/nKc7rv
W7Ivz1w1fqscHvuQKuy5p/AbmP+sVJzM5I6khIZdDIOnjMsXbV43SadV5mDYs1bT
e56Xi65O8n1uFrVuUwu/D64Ne+gxT6flSCgNfZDkZg4tYlSbC/04+nSBqsa+UdQ/
lH0tk0c4XKV7IYODVH0U4f+Vxcn7jFW+dMz4nlPMtS+aG0TTMq6Lz8jtuC2/fSoc
lwdYZ0gs/LMh3+OrhUqgCsOswU+xIC6s696cNCNR/CxHFRMan08=
=UEES
-----END PGP SIGNATURE-----

--9zuFZm4HKVcW/hHr--

