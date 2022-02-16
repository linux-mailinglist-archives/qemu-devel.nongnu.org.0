Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 613EB4B8044
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 06:38:13 +0100 (CET)
Received: from localhost ([::1]:36488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKD12-00047U-Bk
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 00:38:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7e-0001Hz-NB; Tue, 15 Feb 2022 23:40:59 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:53797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7X-0000Qq-TL; Tue, 15 Feb 2022 23:40:54 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz4y346rhz4y4l; Wed, 16 Feb 2022 15:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644986411;
 bh=KKgD3UwMXFA3TvvFj34cHDQOkqi69rJAtZivMmlbi50=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZchfV3sMIOtHTAdZNs+UzfmgjUY2Kg3ghdZHxwDk6zoICFj5EZgisOlFQ/qr24tRC
 IX2/bOlaSBUIwWhacz2/sjlsVF5Lid5bmviiUj/+conHjQaz9tHP/YlhTczCOnGRel
 5RF66FgSyVc2xMfM4xpiN+/XloPEc8QbtbNnORKo=
Date: Wed, 16 Feb 2022 13:59:15 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 22/27] target/ppc: cpu_init: Rename register_ne_601_sprs
Message-ID: <Ygxog9Ngz0bvn8gO@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-23-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="O5DMT7LxRdSECtrv"
Content-Disposition: inline
In-Reply-To: <20220215214148.1848266-23-farosas@linux.ibm.com>
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


--O5DMT7LxRdSECtrv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:41:43PM -0300, Fabiano Rosas wrote:
> The important part of this function is that it applies to non-embedded
> CPUs, not that it also applies to the 601. We removed support for the
> 601 anyway, so rename this function.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Although, I wonder if "books_common" or something might be a better
name, though.  Admittedly, I don't think the "BookS" terminology
existed at the time of most of these earlier CPUs.  However, these
days the majority of 7xx chips are probably in embedded applications,
even if they weren't designed for an embedded chip line.

> ---
>  target/ppc/cpu_init.c | 41 ++++++++++++++++++++---------------------
>  1 file changed, 20 insertions(+), 21 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 3e687d0301..621812d079 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -241,8 +241,7 @@ static void register_generic_sprs(PowerPCCPU *cpu)
>                   0x00000000);
>  }
> =20
> -/* SPR common to all non-embedded PowerPC, including 601 */
> -static void register_ne_601_sprs(CPUPPCState *env)
> +static void register_non_embedded_sprs(CPUPPCState *env)
>  {
>      /* Exception processing */
>      spr_register_kvm(env, SPR_DSISR, "DSISR",
> @@ -3022,7 +3021,7 @@ POWERPC_FAMILY(MPC8xx)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_G2(CPUPPCState *env)
>  {
> -    register_ne_601_sprs(env);
> +    register_non_embedded_sprs(env);
>      register_sdr1_sprs(env);
>      register_G2_sprs(env);
> =20
> @@ -3732,7 +3731,7 @@ POWERPC_FAMILY(e6500)(ObjectClass *oc, void *data)
>  /* Non-embedded PowerPC                                                 =
     */
>  static void init_proc_603(CPUPPCState *env)
>  {
> -    register_ne_601_sprs(env);
> +    register_non_embedded_sprs(env);
>      register_sdr1_sprs(env);
>      register_603_sprs(env);
> =20
> @@ -3872,7 +3871,7 @@ POWERPC_FAMILY(e300)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_604(CPUPPCState *env)
>  {
> -    register_ne_601_sprs(env);
> +    register_non_embedded_sprs(env);
>      register_sdr1_sprs(env);
>      register_604_sprs(env);
> =20
> @@ -3971,7 +3970,7 @@ POWERPC_FAMILY(604E)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_740(CPUPPCState *env)
>  {
> -    register_ne_601_sprs(env);
> +    register_non_embedded_sprs(env);
>      register_sdr1_sprs(env);
>      register_7xx_sprs(env);
>      /* Thermal management */
> @@ -4027,7 +4026,7 @@ POWERPC_FAMILY(740)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_750(CPUPPCState *env)
>  {
> -    register_ne_601_sprs(env);
> +    register_non_embedded_sprs(env);
>      register_sdr1_sprs(env);
>      register_7xx_sprs(env);
> =20
> @@ -4092,7 +4091,7 @@ POWERPC_FAMILY(750)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_750cl(CPUPPCState *env)
>  {
> -    register_ne_601_sprs(env);
> +    register_non_embedded_sprs(env);
>      register_sdr1_sprs(env);
>      register_7xx_sprs(env);
> =20
> @@ -4277,7 +4276,7 @@ POWERPC_FAMILY(750cl)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_750cx(CPUPPCState *env)
>  {
> -    register_ne_601_sprs(env);
> +    register_non_embedded_sprs(env);
>      register_sdr1_sprs(env);
>      register_7xx_sprs(env);
> =20
> @@ -4345,7 +4344,7 @@ POWERPC_FAMILY(750cx)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_750fx(CPUPPCState *env)
>  {
> -    register_ne_601_sprs(env);
> +    register_non_embedded_sprs(env);
>      register_sdr1_sprs(env);
>      register_7xx_sprs(env);
> =20
> @@ -4417,7 +4416,7 @@ POWERPC_FAMILY(750fx)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_750gx(CPUPPCState *env)
>  {
> -    register_ne_601_sprs(env);
> +    register_non_embedded_sprs(env);
>      register_sdr1_sprs(env);
>      register_7xx_sprs(env);
> =20
> @@ -4489,7 +4488,7 @@ POWERPC_FAMILY(750gx)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_745(CPUPPCState *env)
>  {
> -    register_ne_601_sprs(env);
> +    register_non_embedded_sprs(env);
>      register_sdr1_sprs(env);
>      register_7xx_sprs(env);
>      register_755_sprs(env);
> @@ -4593,7 +4592,7 @@ POWERPC_FAMILY(755)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_7400(CPUPPCState *env)
>  {
> -    register_ne_601_sprs(env);
> +    register_non_embedded_sprs(env);
>      register_sdr1_sprs(env);
>      register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
> @@ -4665,7 +4664,7 @@ POWERPC_FAMILY(7400)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_7410(CPUPPCState *env)
>  {
> -    register_ne_601_sprs(env);
> +    register_non_embedded_sprs(env);
>      register_sdr1_sprs(env);
>      register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
> @@ -4744,7 +4743,7 @@ POWERPC_FAMILY(7410)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_7440(CPUPPCState *env)
>  {
> -    register_ne_601_sprs(env);
> +    register_non_embedded_sprs(env);
>      register_sdr1_sprs(env);
>      register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
> @@ -4844,7 +4843,7 @@ POWERPC_FAMILY(7440)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_7450(CPUPPCState *env)
>  {
> -    register_ne_601_sprs(env);
> +    register_non_embedded_sprs(env);
>      register_sdr1_sprs(env);
>      register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
> @@ -4966,7 +4965,7 @@ POWERPC_FAMILY(7450)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_7445(CPUPPCState *env)
>  {
> -    register_ne_601_sprs(env);
> +    register_non_embedded_sprs(env);
>      register_sdr1_sprs(env);
>      register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
> @@ -5095,7 +5094,7 @@ POWERPC_FAMILY(7445)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_7455(CPUPPCState *env)
>  {
> -    register_ne_601_sprs(env);
> +    register_non_embedded_sprs(env);
>      register_sdr1_sprs(env);
>      register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
> @@ -5226,7 +5225,7 @@ POWERPC_FAMILY(7455)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_7457(CPUPPCState *env)
>  {
> -    register_ne_601_sprs(env);
> +    register_non_embedded_sprs(env);
>      register_sdr1_sprs(env);
>      register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
> @@ -5377,7 +5376,7 @@ POWERPC_FAMILY(7457)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_e600(CPUPPCState *env)
>  {
> -    register_ne_601_sprs(env);
> +    register_non_embedded_sprs(env);
>      register_sdr1_sprs(env);
>      register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
> @@ -6200,7 +6199,7 @@ static void init_tcg_pmu_power8(CPUPPCState *env)
> =20
>  static void init_proc_book3s_common(CPUPPCState *env)
>  {
> -    register_ne_601_sprs(env);
> +    register_non_embedded_sprs(env);
>      register_usprg3_sprs(env);
>      register_book3s_altivec_sprs(env);
>      register_book3s_pmu_sup_sprs(env);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--O5DMT7LxRdSECtrv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMaHwACgkQgypY4gEw
YSJ60A/+JIdWtnsvFH+i4H4w8zsp4lmYiwljuDErEfVMUubVijBDC+hIOzQBs+tR
hbhlq8xIgFPdXsRSiTykNkQs66l1KQyDzzVwdbNLq6+Z261ZKieyAF3kzQhBZI5C
yskjCH9C2tB33kdOJTfw/iHM8BAHRAwAyvt9UwlX5ZnrAaNZpAEDx3u8j+E+v+Ik
prFkmjplzzawvnmCac/deKcNd+SVvXqhLm2Np98a6P5UGcmA4uMoWkxoGLZtehzk
t0uFCVUfHrLpQ43J55KYYj/mAbmlCmlCCeBWl7jCiWFu2SEu1vgH1j1YrbcPI37t
+8gAT8Lp2kH3lJSAsjEooYrV2H+B7OZ8jCSCZgVpppJXi5m1dKDw0fkuAVW543t2
uOiK8d79aKGHWCeRfOhhoLzc1I75V+7GBrZqtgFdY0lpnSEMq/yxxMfTwmRxIXm7
bky6/ZDhgJN3XLoxYB/6CJTxLUv1PJlU2SrO3g5TU+Uc4FL96c25UiVTXTRczHao
qfUTrh+4tp8Sw9QAPSgwfvDAAcqNOk9imVIHBZBDmO6Immx+xFOnvlz4Tsp63DWl
jpSSlijTm8d2BbXO1EphSw5fYz5rvio11n7lkoiD08sjdupeQ1WpN3+qGfQQvBiy
Ohd6/OQmvL9GLqWw7SeklUf3PC0amaPgdiZdlt5RA51E8f0BmRQ=
=XUvR
-----END PGP SIGNATURE-----

--O5DMT7LxRdSECtrv--

