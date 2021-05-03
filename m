Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B57371111
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 06:57:13 +0200 (CEST)
Received: from localhost ([::1]:44662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldQds-0003y1-5w
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 00:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldQbg-0001Rn-S8; Mon, 03 May 2021 00:54:57 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:52711 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldQbd-000807-5B; Mon, 03 May 2021 00:54:56 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FYVyJ2PzSz9sW5; Mon,  3 May 2021 14:54:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620017688;
 bh=hRINiqGOaUrZ6auQ6zsPgn32fNSFOd+TnkZAIDNIwUQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hJhOhimvpThFShT0ttevydCdFfy8vBkT3sycNO0Is+lIr6ZSvQRJx6X8vKF3prTFL
 lAwGY3mfe+QjahmE7egZ0XRaUchbPOqjCywHwue/PRu21/ZiowoTPtOftMdD8Bqge5
 vIYmUUSl466+AZ/djsOYnPBGtNDCArkj+OrnoHyo=
Date: Mon, 3 May 2021 14:47:35 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v3 5/7] target/ppc: removed VSCR from SPR registration
Message-ID: <YI+AZ6LyfAoTsaOe@yekko>
References: <20210430193533.82136-1-bruno.larsen@eldorado.org.br>
 <20210430193533.82136-6-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Yvq3WjglrDnFq2La"
Content-Disposition: inline
In-Reply-To: <20210430193533.82136-6-bruno.larsen@eldorado.org.br>
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Yvq3WjglrDnFq2La
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2021 at 04:35:31PM -0300, Bruno Larsen (billionai) wrote:
> Since vscr is not an spr, its initialization was removed from the
> spr registration functions, and moved to the relevant init_procs.
>=20
> We may look into adding vscr to the reset path instead of the init
> path (as suggested by David Gibson), but this looked like a good
> enough solution for now.
>=20
> Signed-off-by: Bruno Larsen (billionai)
> <bruno.larsen@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/translate_init.c.inc | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>=20
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.=
c.inc
> index 67529e8648..b922b04f25 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/translate_init.c.inc
> @@ -941,8 +941,6 @@ static void gen_spr_74xx(CPUPPCState *env)
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   &spr_read_generic, spr_access_nop,
>                   0x00000000);
> -    /* Not strictly an SPR */
> -    vscr_init(env, 0x00010000);
>  }
> =20
>  static void gen_l3_ctrl(CPUPPCState *env)
> @@ -5790,6 +5788,7 @@ static void init_proc_7400(CPUPPCState *env)
>      gen_tbl(env);
>      /* 74xx specific SPR */
>      gen_spr_74xx(env);
> +    vscr_init(env, 0x00010000);
>      /* XXX : not implemented */
>      spr_register(env, SPR_UBAMR, "UBAMR",
>                   &spr_read_ureg, SPR_NOACCESS,
> @@ -5869,6 +5868,7 @@ static void init_proc_7410(CPUPPCState *env)
>      gen_tbl(env);
>      /* 74xx specific SPR */
>      gen_spr_74xx(env);
> +    vscr_init(env, 0x00010000);
>      /* XXX : not implemented */
>      spr_register(env, SPR_UBAMR, "UBAMR",
>                   &spr_read_ureg, SPR_NOACCESS,
> @@ -5954,6 +5954,7 @@ static void init_proc_7440(CPUPPCState *env)
>      gen_tbl(env);
>      /* 74xx specific SPR */
>      gen_spr_74xx(env);
> +    vscr_init(env, 0x00010000);
>      /* XXX : not implemented */
>      spr_register(env, SPR_UBAMR, "UBAMR",
>                   &spr_read_ureg, SPR_NOACCESS,
> @@ -6062,6 +6063,7 @@ static void init_proc_7450(CPUPPCState *env)
>      gen_tbl(env);
>      /* 74xx specific SPR */
>      gen_spr_74xx(env);
> +    vscr_init(env, 0x00010000);
>      /* Level 3 cache control */
>      gen_l3_ctrl(env);
>      /* L3ITCR1 */
> @@ -6196,6 +6198,7 @@ static void init_proc_7445(CPUPPCState *env)
>      gen_tbl(env);
>      /* 74xx specific SPR */
>      gen_spr_74xx(env);
> +    vscr_init(env, 0x00010000);
>      /* LDSTCR */
>      /* XXX : not implemented */
>      spr_register(env, SPR_LDSTCR, "LDSTCR",
> @@ -6333,6 +6336,7 @@ static void init_proc_7455(CPUPPCState *env)
>      gen_tbl(env);
>      /* 74xx specific SPR */
>      gen_spr_74xx(env);
> +    vscr_init(env, 0x00010000);
>      /* Level 3 cache control */
>      gen_l3_ctrl(env);
>      /* LDSTCR */
> @@ -6472,6 +6476,7 @@ static void init_proc_7457(CPUPPCState *env)
>      gen_tbl(env);
>      /* 74xx specific SPR */
>      gen_spr_74xx(env);
> +    vscr_init(env, 0x00010000);
>      /* Level 3 cache control */
>      gen_l3_ctrl(env);
>      /* L3ITCR1 */
> @@ -6635,6 +6640,7 @@ static void init_proc_e600(CPUPPCState *env)
>      gen_tbl(env);
>      /* 74xx specific SPR */
>      gen_spr_74xx(env);
> +    vscr_init(env, 0x00010000);
>      /* XXX : not implemented */
>      spr_register(env, SPR_UBAMR, "UBAMR",
>                   &spr_read_ureg, SPR_NOACCESS,
> @@ -6833,11 +6839,6 @@ static void gen_spr_book3s_altivec(CPUPPCState *en=
v)
>                       &spr_read_generic, &spr_write_generic,
>                       KVM_REG_PPC_VRSAVE, 0x00000000);
> =20
> -    /*
> -     * Can't find information on what this should be on reset.  This
> -     * value is the one used by 74xx processors.
> -     */
> -    vscr_init(env, 0x00010000);
>  }
> =20
>  static void gen_spr_book3s_dbg(CPUPPCState *env)
> @@ -7457,6 +7458,11 @@ static void init_proc_book3s_common(CPUPPCState *e=
nv)
>      gen_spr_book3s_pmu_sup(env);
>      gen_spr_book3s_pmu_user(env);
>      gen_spr_book3s_ctrl(env);
> +    /*
> +     * Can't find information on what this should be on reset.  This
> +     * value is the one used by 74xx processors.
> +     */
> +    vscr_init(env, 0x00010000);
>  }
> =20
>  static void init_proc_970(CPUPPCState *env)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Yvq3WjglrDnFq2La
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCPgGcACgkQbDjKyiDZ
s5J2yQ//c8claQyeX/xLuI5DmKMD7p7n/ugArHsMW+n8v/q7DsKl9evesLIbtAL+
w269yPjRm9gLgcRlcWjWOWEecGz2c+39OPtS7sMzoQUvYSeSWLr86a0nuVYfxABk
DIxuAo0kPtOj57ynZT1kGv6nUBOOUULnOs0frqTxEjQdVT4/rTefA//ljxIs2Y67
FP4GNIVwPLC2ddXAiGPEpU8WPTXnywbfwfqpnpkAxLNNBsMKXmMaVKFDp7kHt2Yz
pL84c76ol9doHam7KAU4P3iU8GANwCL1vIP8k6l5nJfwFrhRvjz1u5Tc/a5BVQmx
wbrn1qCIApQ/vZNOCpRf4DEy9R2VUgyCd2W3k+E2my4Xql/rKz5uRsZGeqmH2HP8
6IWmbcahsY2JqrH7Sz3zDszgv+YrZFdV3XxoEQloFrkqa3vBfiOySvEtkUe/bDkw
u7k+bWA0cWgxmC4YB7qM23jarKGk/6aY6/vb72AOZJVMnse+8XENvVg1IIH7dRhF
Rvru40Dz+Ukk/oKUgSbyiyHUPZ2oUViifNGDSZT0kX3fY9m0e1B8r/OSGczffH7v
XXYN/yZfEyJ1TCmKHA8yQe3+HrYndwd2l6Lw+Awm3Hk1XVmmjhgfg7khNZ+Px/GE
qLvqYlnqM/Hs0CyNpEZyxH5DfxYfE7v7eFT+ABhPSTWP3HrkTZE=
=eyeB
-----END PGP SIGNATURE-----

--Yvq3WjglrDnFq2La--

