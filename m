Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 078A53D5296
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 06:48:04 +0200 (CEST)
Received: from localhost ([::1]:32862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7sX5-0001Sj-14
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 00:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m7sTo-0007GO-3r; Mon, 26 Jul 2021 00:44:40 -0400
Received: from ozlabs.org ([203.11.71.1]:56253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m7sTj-0000Hx-Lm; Mon, 26 Jul 2021 00:44:39 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GY6lf2F1rz9sX3; Mon, 26 Jul 2021 14:44:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1627274670;
 bh=lN3a+vCeoj4GhcdkZDonl3CzHC0TK6lU3FaHfEADXpU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iDzqAzDB1NCRJPAVCJ7TXNyGfikEmpzx+HX4tkSqqKFMVqLcWyh9ajyE6iiCmyldz
 J2Xvlfgxt1JUmWUb8X9KEI3LiItiZ9W04A/sNI1fn9eqV+gXwXmdYIUmyKb/Es+F/k
 NbeYqVaoseRKBY8QXHRbnTZNkWuXxuN4rrGgbnGQ=
Date: Mon, 26 Jul 2021 14:29:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: Re: [PATCH v5 2/3] target/ppc: moved ppc_store_sdr1 to mmu_common.c
Message-ID: <YP46KS/su2s1wFg2@yekko>
References: <20210723175627.72847-1-lucas.araujo@eldorado.org.br>
 <20210723175627.72847-3-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1ci1+QySdZ9eZ3dV"
Content-Disposition: inline
In-Reply-To: <20210723175627.72847-3-lucas.araujo@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--1ci1+QySdZ9eZ3dV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 23, 2021 at 02:56:26PM -0300, Lucas Mateus Castro (alqotel) wro=
te:
> ppc_store_sdr1 was at first in mmu_helper.c and was moved as part
> the patches to enable the disable-tcg option, now it's being moved
> back to a file that will be compiled with that option
>=20
> Signed-off-by: Lucas Mateus Castro (alqotel)
> <lucas.araujo@eldorado.org.br>

Applied to ppc-for-6.2, thanks.

> ---
>  target/ppc/cpu.c        | 28 ----------------------------
>  target/ppc/mmu_common.c | 26 ++++++++++++++++++++++++++
>  2 files changed, 26 insertions(+), 28 deletions(-)
>=20
> diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
> index a29299882a..7ad9bd6044 100644
> --- a/target/ppc/cpu.c
> +++ b/target/ppc/cpu.c
> @@ -67,34 +67,6 @@ uint32_t ppc_get_vscr(CPUPPCState *env)
>      return env->vscr | (sat << VSCR_SAT);
>  }
> =20
> -#ifdef CONFIG_SOFTMMU
> -void ppc_store_sdr1(CPUPPCState *env, target_ulong value)
> -{
> -    PowerPCCPU *cpu =3D env_archcpu(env);
> -    qemu_log_mask(CPU_LOG_MMU, "%s: " TARGET_FMT_lx "\n", __func__, valu=
e);
> -    assert(!cpu->env.has_hv_mode || !cpu->vhyp);
> -#if defined(TARGET_PPC64)
> -    if (mmu_is_64bit(env->mmu_model)) {
> -        target_ulong sdr_mask =3D SDR_64_HTABORG | SDR_64_HTABSIZE;
> -        target_ulong htabsize =3D value & SDR_64_HTABSIZE;
> -
> -        if (value & ~sdr_mask) {
> -            qemu_log_mask(LOG_GUEST_ERROR, "Invalid bits 0x"TARGET_FMT_lx
> -                     " set in SDR1", value & ~sdr_mask);
> -            value &=3D sdr_mask;
> -        }
> -        if (htabsize > 28) {
> -            qemu_log_mask(LOG_GUEST_ERROR, "Invalid HTABSIZE 0x" TARGET_=
FMT_lx
> -                     " stored in SDR1", htabsize);
> -            return;
> -        }
> -    }
> -#endif /* defined(TARGET_PPC64) */
> -    /* FIXME: Should check for valid HTABMASK values in 32-bit case */
> -    env->spr[SPR_SDR1] =3D value;
> -}
> -#endif /* CONFIG_SOFTMMU */
> -
>  /* GDBstub can read and write MSR... */
>  void ppc_store_msr(CPUPPCState *env, target_ulong value)
>  {
> diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
> index ec4dce4ddc..a0518f611b 100644
> --- a/target/ppc/mmu_common.c
> +++ b/target/ppc/mmu_common.c
> @@ -58,6 +58,32 @@
>  #  define LOG_BATS(...) do { } while (0)
>  #endif
> =20
> +void ppc_store_sdr1(CPUPPCState *env, target_ulong value)
> +{
> +    PowerPCCPU *cpu =3D env_archcpu(env);
> +    qemu_log_mask(CPU_LOG_MMU, "%s: " TARGET_FMT_lx "\n", __func__, valu=
e);
> +    assert(!cpu->env.has_hv_mode || !cpu->vhyp);
> +#if defined(TARGET_PPC64)
> +    if (mmu_is_64bit(env->mmu_model)) {
> +        target_ulong sdr_mask =3D SDR_64_HTABORG | SDR_64_HTABSIZE;
> +        target_ulong htabsize =3D value & SDR_64_HTABSIZE;
> +
> +        if (value & ~sdr_mask) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "Invalid bits 0x"TARGET_FMT_lx
> +                     " set in SDR1", value & ~sdr_mask);
> +            value &=3D sdr_mask;
> +        }
> +        if (htabsize > 28) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "Invalid HTABSIZE 0x" TARGET_=
FMT_lx
> +                     " stored in SDR1", htabsize);
> +            return;
> +        }
> +    }
> +#endif /* defined(TARGET_PPC64) */
> +    /* FIXME: Should check for valid HTABMASK values in 32-bit case */
> +    env->spr[SPR_SDR1] =3D value;
> +}
> +
>  /***********************************************************************=
******/
>  /* PowerPC MMU emulation */
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1ci1+QySdZ9eZ3dV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD+OikACgkQbDjKyiDZ
s5K78xAAtK1b7CTHopl2GN8+mhh310Hfa2rTpzIKGrJ03yjNQAMOoLKnJhNs+D4O
F+76T65dbrW8Cz45sT9khePZJRm3QNDHpBz6iIrk3AHMQBg9ZVdnCAamrx/MQgYT
Pvix784v9QShdjZcE9xlL9AA0/7tG7GPodXETSDTEcTE1ktQtGTudoGLECaoog4p
0BfIrjC/NWSNfojmdOapsjQJSnRVkBQRif4W8pZh0x1RRM6MxJVmat5XeaRcv0Xg
mQOVolNFuKrdSyQbu+6CsBUUJiQCRCMYeDnZYM9gXF71plbptyAwEYzibL0FP73O
pvqBnZ2i6bGNwohfSQZk6bpZfSvMFqrwn2nn4TwqM2zAYhOYQC8iT1/esFhPrIWJ
G+7akR3X1RVDleNW2lxLBwfwldvSRSkNWw2nnDGTqCg8w3iQj/w3Ty+ve1A5gctV
+FC/feit6Rq4FVGb3q4VbUIiogxBqEzRsKhzz7eImXB2BSfXo6vaxOvnQ36Logtk
kP6Kq1nHuSmD68W9FnarQaYPVZRBd0cPEn66J2OhqrJuPRT0tYtfqxn918nlK1p4
U/F9COVY4zqhIqCehwJT5PJ9e9YoDA82KaRxARC2t67pQFAMzAP7G74KehfKLVvG
uHq3gfmcK+xUwgZXh8wiINQUFBAcGxuBVtrV1/3SOVLxIVsM1QE=
=NpKX
-----END PGP SIGNATURE-----

--1ci1+QySdZ9eZ3dV--

