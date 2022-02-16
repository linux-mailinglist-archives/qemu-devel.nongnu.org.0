Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E21A44B803A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 06:33:58 +0100 (CET)
Received: from localhost ([::1]:33166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKCwv-0001mR-Fk
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 00:33:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7g-0001JQ-Cn; Tue, 15 Feb 2022 23:41:00 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:49895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7a-0000Rd-Rc; Tue, 15 Feb 2022 23:41:00 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz4y34Fqhz4y4p; Wed, 16 Feb 2022 15:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644986411;
 bh=f5rH5Ic3nCtogas5y/2/1zL62pjTqLe1HjKtymqNeps=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GegpI1ovALqj7QMFDgp0o9dpKME+162ldW0Hv65H8t3K3kFL/JZaTiXae/Uy1KFFf
 Lq5xCSPJA45piWX5nqRs1xgfxJwRRwKI2+NzOi6WbhdCEygug8BKmbmxVWRhFFT37+
 AEWm2VKdiahWPvq1StZhfFP1h9cxJYCq7GlWDTdI=
Date: Wed, 16 Feb 2022 14:00:28 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 24/27] target/ppc: cpu_init: Expose some SPR registration
 helpers
Message-ID: <YgxozKf7FMg8ED/y@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-25-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kSE07oiwL5p2xoSu"
Content-Disposition: inline
In-Reply-To: <20220215214148.1848266-25-farosas@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--kSE07oiwL5p2xoSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:41:45PM -0300, Fabiano Rosas wrote:
> The following patches will move CPU-specific code into separate files,
> so expose the most used SPR registration functions:
>=20
> register_sdr1_sprs         | 22 callers
> register_low_BATs          | 20 callers
> register_non_embedded_sprs | 19 callers
> register_high_BATs         | 10 callers
> register_thrm_sprs         | 8 callers
> register_usprgh_sprs       | 6 callers
> register_soft_tlb_sprs     | only 3 callers, but it helps to
>                              keep the soft TLB code consistent.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu_init.c | 14 +++++++-------
>  target/ppc/spr_tcg.h  |  8 ++++++++
>  2 files changed, 15 insertions(+), 7 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 3585dc69bc..74e26f60dd 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -241,7 +241,7 @@ static void register_generic_sprs(PowerPCCPU *cpu)
>                   0x00000000);
>  }
> =20
> -static void register_non_embedded_sprs(CPUPPCState *env)
> +void register_non_embedded_sprs(CPUPPCState *env)
>  {
>      /* Exception processing */
>      spr_register_kvm(env, SPR_DSISR, "DSISR",
> @@ -260,7 +260,7 @@ static void register_non_embedded_sprs(CPUPPCState *e=
nv)
>  }
> =20
>  /* Storage Description Register 1 */
> -static void register_sdr1_sprs(CPUPPCState *env)
> +void register_sdr1_sprs(CPUPPCState *env)
>  {
>  #ifndef CONFIG_USER_ONLY
>      if (env->has_hv_mode) {
> @@ -283,7 +283,7 @@ static void register_sdr1_sprs(CPUPPCState *env)
>  }
> =20
>  /* BATs 0-3 */
> -static void register_low_BATs(CPUPPCState *env)
> +void register_low_BATs(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
>      spr_register(env, SPR_IBAT0U, "IBAT0U",
> @@ -355,7 +355,7 @@ static void register_low_BATs(CPUPPCState *env)
>  }
> =20
>  /* BATs 4-7 */
> -static void register_high_BATs(CPUPPCState *env)
> +void register_high_BATs(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
>      spr_register(env, SPR_IBAT4U, "IBAT4U",
> @@ -427,7 +427,7 @@ static void register_high_BATs(CPUPPCState *env)
>  }
> =20
>  /* Softare table search registers */
> -static void register_soft_tlb_sprs(CPUPPCState *env, int nb_tlbs, int nb=
_ways)
> +void register_soft_tlb_sprs(CPUPPCState *env, int nb_tlbs, int nb_ways)
>  {
>  #if !defined(CONFIG_USER_ONLY)
>      env->nb_tlb =3D nb_tlbs;
> @@ -667,7 +667,7 @@ static void register_iamr_sprs(CPUPPCState *env)
>  }
>  #endif /* TARGET_PPC64 */
> =20
> -static void register_thrm_sprs(CPUPPCState *env)
> +void register_thrm_sprs(CPUPPCState *env)
>  {
>      /* Thermal management */
>      spr_register(env, SPR_THRM1, "THRM1",
> @@ -1072,7 +1072,7 @@ static void register_l3_ctrl(CPUPPCState *env)
>                   0x00000000);
>  }
> =20
> -static void register_usprgh_sprs(CPUPPCState *env)
> +void register_usprgh_sprs(CPUPPCState *env)
>  {
>      spr_register(env, SPR_USPRG4, "USPRG4",
>                   &spr_read_ureg, SPR_NOACCESS,
> diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
> index df2abacc64..a4f912faa4 100644
> --- a/target/ppc/spr_tcg.h
> +++ b/target/ppc/spr_tcg.h
> @@ -141,4 +141,12 @@ void spr_write_hmer(DisasContext *ctx, int sprn, int=
 gprn);
>  void spr_write_lpcr(DisasContext *ctx, int sprn, int gprn);
>  #endif
> =20
> +void register_low_BATs(CPUPPCState *env);
> +void register_high_BATs(CPUPPCState *env);
> +void register_sdr1_sprs(CPUPPCState *env);
> +void register_thrm_sprs(CPUPPCState *env);
> +void register_usprgh_sprs(CPUPPCState *env);
> +void register_non_embedded_sprs(CPUPPCState *env);
> +void register_soft_tlb_sprs(CPUPPCState *env, int nb_tlbs, int nb_ways);
> +
>  #endif

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kSE07oiwL5p2xoSu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMaMYACgkQgypY4gEw
YSKadQ/7BYhPhqMwtaL9kiw6cFNyBWjGlBs/yyww8wtu/AvBW3ko0IoXHNhkUX6i
tomIrNMA70gKVh9fkglZF5CIxzZFqyAo0aIaDGm7kBpTo+7VPz56IqsvJ+wOWd3J
MQ4leqBgQesyj3XKWD8eiZFD8K32gkfkV3CK2riaPzPFOFOUrx3W/VznFuVoTElH
NHnyG6TB6x/kOb9tHBdX0x5927+4yQPtdAso6u0+s0H3U/AatFeVyFlJpla6uKpD
nQ/2tFw3+HgZajoRGVpZwhDPKBbh8IX1nGl/sOULNy36JRQSgEZhgBkF/fWLb1HF
yGcYRfkPCmiWACeS0ok4rEotb8t9zPVqTnqrX1XTCAqdxkHSlGHjENHm7icEpIW8
ERyC2Ous05hpv5OwgajGP4IQap5hkVlT2KaRRhOgrsVsuwRY1snPkzjtumQTeR2v
d1bKA09AHlSdME6kvBCGHjwnzTEsA1QhUxN7X5c6xmzGZMEB8YTjOWUuIjyuTgRD
dMXL7KfWBItW95o1/MASdPOXEQCeDjpe7sCgszJJHLl1Vww8lQBPdl8H+7U34vTD
yFnQeN8cZPd96l/mzASiDVFG60/WSbIrFlPIPp2j+hwh3YUyYXcgddbs8jYP+Xw6
gWKLvt6VkS29RIwrjzak9To2Bmcl4Ep24g0kBM9ezldjoPVFY4c=
=gwrm
-----END PGP SIGNATURE-----

--kSE07oiwL5p2xoSu--

