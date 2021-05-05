Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DDA373433
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 06:19:45 +0200 (CEST)
Received: from localhost ([::1]:44066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le90i-0005O2-5r
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 00:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1le8yG-0001zM-9V; Wed, 05 May 2021 00:17:12 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:55919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1le8yD-0007Fn-M3; Wed, 05 May 2021 00:17:12 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZk1j0YgTz9sSs; Wed,  5 May 2021 14:16:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620188217;
 bh=BNVmsrnlg5bsdOECNXcgHLuukwjTcWogMFrJvb0xQgk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fiZ3iJjG8/CP+7rx2rLxGKIrSZ+fCBphWAvPXX/j5eBrEqEfTqLbnrYScjF2RZ0od
 lTP17T7mTyISr7ExIuj0222cKTle0aDW/V7yjFLXWbwSpQNQlRXB3ymiGMy0RgSbKO
 SMs1btEnWzJImyfWgHwDQWiQxVR7yVBPLpg4UUVA=
Date: Wed, 5 May 2021 14:10:45 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v4 1/5] target/ppc: Fold gen_*_xer into their callers
Message-ID: <YJIaxQJhhfFLOhb9@yekko>
References: <20210504140157.76066-1-bruno.larsen@eldorado.org.br>
 <20210504140157.76066-2-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EhbtkYys3BlgMPO5"
Content-Disposition: inline
In-Reply-To: <20210504140157.76066-2-bruno.larsen@eldorado.org.br>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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


--EhbtkYys3BlgMPO5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 04, 2021 at 11:01:53AM -0300, Bruno Larsen (billionai) wrote:
> folded gen_{read,write}_xer into their only callers, spr_{read,write}_xer
>=20
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Good cleanup on its own.  Applied to ppc-for-6.1.

> ---
>  target/ppc/translate.c          | 37 ---------------------------------
>  target/ppc/translate_init.c.inc | 33 +++++++++++++++++++++++++++--
>  2 files changed, 31 insertions(+), 39 deletions(-)
>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index b319d409c6..2f10aa2fea 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -4175,43 +4175,6 @@ static void gen_tdi(DisasContext *ctx)
> =20
>  /***                          Processor control                         =
   ***/
> =20
> -static void gen_read_xer(DisasContext *ctx, TCGv dst)
> -{
> -    TCGv t0 =3D tcg_temp_new();
> -    TCGv t1 =3D tcg_temp_new();
> -    TCGv t2 =3D tcg_temp_new();
> -    tcg_gen_mov_tl(dst, cpu_xer);
> -    tcg_gen_shli_tl(t0, cpu_so, XER_SO);
> -    tcg_gen_shli_tl(t1, cpu_ov, XER_OV);
> -    tcg_gen_shli_tl(t2, cpu_ca, XER_CA);
> -    tcg_gen_or_tl(t0, t0, t1);
> -    tcg_gen_or_tl(dst, dst, t2);
> -    tcg_gen_or_tl(dst, dst, t0);
> -    if (is_isa300(ctx)) {
> -        tcg_gen_shli_tl(t0, cpu_ov32, XER_OV32);
> -        tcg_gen_or_tl(dst, dst, t0);
> -        tcg_gen_shli_tl(t0, cpu_ca32, XER_CA32);
> -        tcg_gen_or_tl(dst, dst, t0);
> -    }
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> -    tcg_temp_free(t2);
> -}
> -
> -static void gen_write_xer(TCGv src)
> -{
> -    /* Write all flags, while reading back check for isa300 */
> -    tcg_gen_andi_tl(cpu_xer, src,
> -                    ~((1u << XER_SO) |
> -                      (1u << XER_OV) | (1u << XER_OV32) |
> -                      (1u << XER_CA) | (1u << XER_CA32)));
> -    tcg_gen_extract_tl(cpu_ov32, src, XER_OV32, 1);
> -    tcg_gen_extract_tl(cpu_ca32, src, XER_CA32, 1);
> -    tcg_gen_extract_tl(cpu_so, src, XER_SO, 1);
> -    tcg_gen_extract_tl(cpu_ov, src, XER_OV, 1);
> -    tcg_gen_extract_tl(cpu_ca, src, XER_CA, 1);
> -}
> -
>  /* mcrxr */
>  static void gen_mcrxr(DisasContext *ctx)
>  {
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.=
c.inc
> index d10d7e5bf6..d5527c149f 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/translate_init.c.inc
> @@ -116,12 +116,41 @@ static void spr_access_nop(DisasContext *ctx, int s=
prn, int gprn)
>  /* XER */
>  static void spr_read_xer(DisasContext *ctx, int gprn, int sprn)
>  {
> -    gen_read_xer(ctx, cpu_gpr[gprn]);
> +    TCGv dst =3D cpu_gpr[gprn];
> +    TCGv t0 =3D tcg_temp_new();
> +    TCGv t1 =3D tcg_temp_new();
> +    TCGv t2 =3D tcg_temp_new();
> +    tcg_gen_mov_tl(dst, cpu_xer);
> +    tcg_gen_shli_tl(t0, cpu_so, XER_SO);
> +    tcg_gen_shli_tl(t1, cpu_ov, XER_OV);
> +    tcg_gen_shli_tl(t2, cpu_ca, XER_CA);
> +    tcg_gen_or_tl(t0, t0, t1);
> +    tcg_gen_or_tl(dst, dst, t2);
> +    tcg_gen_or_tl(dst, dst, t0);
> +    if (is_isa300(ctx)) {
> +        tcg_gen_shli_tl(t0, cpu_ov32, XER_OV32);
> +        tcg_gen_or_tl(dst, dst, t0);
> +        tcg_gen_shli_tl(t0, cpu_ca32, XER_CA32);
> +        tcg_gen_or_tl(dst, dst, t0);
> +    }
> +    tcg_temp_free(t0);
> +    tcg_temp_free(t1);
> +    tcg_temp_free(t2);
>  }
> =20
>  static void spr_write_xer(DisasContext *ctx, int sprn, int gprn)
>  {
> -    gen_write_xer(cpu_gpr[gprn]);
> +    TCGv src =3D cpu_gpr[gprn];
> +    /* Write all flags, while reading back check for isa300 */
> +    tcg_gen_andi_tl(cpu_xer, src,
> +                    ~((1u << XER_SO) |
> +                      (1u << XER_OV) | (1u << XER_OV32) |
> +                      (1u << XER_CA) | (1u << XER_CA32)));
> +    tcg_gen_extract_tl(cpu_ov32, src, XER_OV32, 1);
> +    tcg_gen_extract_tl(cpu_ca32, src, XER_CA32, 1);
> +    tcg_gen_extract_tl(cpu_so, src, XER_SO, 1);
> +    tcg_gen_extract_tl(cpu_ov, src, XER_OV, 1);
> +    tcg_gen_extract_tl(cpu_ca, src, XER_CA, 1);
>  }
> =20
>  /* LR */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--EhbtkYys3BlgMPO5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCSGsMACgkQbDjKyiDZ
s5Jp9w/8DaVN9v3+2EhE9B9xh/VLEU23vEMFd0v2HS2zxzY3WY8FxwQEdE1x/1hW
cPHdDHf1m4QP9baxLyFVWmecpbKnQxXuSPWDj/GTBN7Iao7whYmMPaPcuwJVS96c
xEstJQNudp4KE4UteRB+Ssa5amB6+3me9gcqr9QufimHKsh/yrBfC7iaJElESrob
JSkFCC+XOHSD1X7m5HPTqC+4Lp6WH9ndTHuki7LmlzPfOd1ManSlo7A2X/MRmF+U
aAnhWXduxI1wyh65t6DPMvFf1L6An87bWlYVScX+RuP7KXsxbNh564kuR6DZmrAv
ePP0RAcqm0qnzvxp7nnMCG8lPr2esGvBebKQl0JykiXQgXi0DTFz7stWVX7e4oKA
0NIxCHc9/wghBYYPv711Zk3W0LdwDlSY97xpdEFMo4sEt534TMubXIPRp6eSfCBp
ZYw8/mGrc1D1gonHvyHYC4m+/l6O/r0zdh7356BikuDqFK7NGkRgZVZBb3sadaym
PxXqh0xcHYVdozx8WM/jkmdYbzDi8B8PUl4yj55qgidmTSxVyIwddq7VWKz5KViy
6F0Q9qvOFVzzocQWk97505/YXKRsofaY9dHcoPLE2ZIzncDZ5dbNt54Qmac+0t/w
a9nupRsnEyf/LT18mHTWekAemxMZlR+TK6n8NM/BYW+OqD58RKk=
=0qVx
-----END PGP SIGNATURE-----

--EhbtkYys3BlgMPO5--

