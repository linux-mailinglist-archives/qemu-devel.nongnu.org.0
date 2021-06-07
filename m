Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916DA39D3B4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 05:57:19 +0200 (CEST)
Received: from localhost ([::1]:51696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq6O6-0001hL-JV
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 23:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6Hz-0003rL-0d; Sun, 06 Jun 2021 23:51:00 -0400
Received: from ozlabs.org ([203.11.71.1]:34261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6Ht-0002mS-Sx; Sun, 06 Jun 2021 23:50:58 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fyzt23WqPz9sXL; Mon,  7 Jun 2021 13:50:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623037834;
 bh=pNEc0SoGn3GBLDe4s7R8HOZYLaxXxNuww0rlGoEtlEs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YuoAT8fQeA3krLIH86gP6e07NZVEIlAfvAbC2WFVzhBVia7m5xYlC/fFGg3HliLic
 hrS12PXrBlg8LLdEuQ3H9ro4SgNrMu8GhFkTTvytkqdgma3tLf6VOPmz/vWcrx3e1j
 cKGbB1Z0Rsh5RVMSvucYYCV9u+VJ3Oc9aAZoKaZ4=
Date: Mon, 7 Jun 2021 12:32:31 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: Re: [RFC PATCH 3/4] target/ppc: moved ppc_store_sdr1 to mmu_common.c
Message-ID: <YL2FP1cOKdzLuygK@yekko>
References: <20210602192604.90846-1-lucas.araujo@eldorado.org.br>
 <20210602192604.90846-4-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iYv/v4a9j4uVcn7G"
Content-Disposition: inline
In-Reply-To: <20210602192604.90846-4-lucas.araujo@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: qemu-devel@nongnu.org, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--iYv/v4a9j4uVcn7G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 02, 2021 at 04:26:03PM -0300, Lucas Mateus Castro (alqotel) wro=
te:
> Moved ppc_store_sdr1 to mmu_common.c as it was originally in
> mmu_helper.c.
>=20
> Signed-off-by: Lucas Mateus Castro (alqotel)
> <lucas.araujo@eldorado.org.br>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Though it will need a rebase for comments on the earlier patches in
the series.

> ---
> Talking to billionai he commented that ppc_store_sdr1 was at first in
> mmu_helper.c and was moved as part of the patches to enable the
> disable-tcg option, now it's being moved back to a file that will be
> compiled in a !TCG build.
> ---
>  target/ppc/cpu.c        | 28 ----------------------------
>  target/ppc/mmu_common.c | 28 ++++++++++++++++++++++++++++
>  2 files changed, 28 insertions(+), 28 deletions(-)
>=20
> diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
> index c8e87e30f1..5ff00a6c01 100644
> --- a/target/ppc/cpu.c
> +++ b/target/ppc/cpu.c
> @@ -66,34 +66,6 @@ uint32_t ppc_get_vscr(CPUPPCState *env)
>      return env->vscr | (sat << VSCR_SAT);
>  }
> =20
> -#ifdef CONFIG_SOFTMMU
> -void ppc_store_sdr1(CPUPPCState *env, target_ulong value)
> -{
> -    PowerPCCPU *cpu =3D env_archcpu(env);
> -    qemu_log_mask(CPU_LOG_MMU, "%s: " TARGET_FMT_lx "\n", __func__, valu=
e);
> -    assert(!cpu->vhyp);
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
> index d95399d67f..50b8799d71 100644
> --- a/target/ppc/mmu_common.c
> +++ b/target/ppc/mmu_common.c
> @@ -58,6 +58,34 @@
>  #  define LOG_BATS(...) do { } while (0)
>  #endif
> =20
> +#ifdef CONFIG_SOFTMMU
> +void ppc_store_sdr1(CPUPPCState *env, target_ulong value)
> +{
> +    PowerPCCPU *cpu =3D env_archcpu(env);
> +    qemu_log_mask(CPU_LOG_MMU, "%s: " TARGET_FMT_lx "\n", __func__, valu=
e);
> +    assert(!cpu->vhyp);
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
> +#endif /* CONFIG_SOFTMMU */
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

--iYv/v4a9j4uVcn7G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC9hT8ACgkQbDjKyiDZ
s5I3vw/+PNKn07yOAcymzWZIDj6Uc8djPYmJrRtVkKIfXF8AIkmh5tA7IdMqV08S
TzFFB+xIxJLmkAN6ulTv72K3XyqsssmtCuBMLrDiiA0AiAueutRtkhLVYBl6Uw0R
SNbRchB3BS65YihRDWfga1qxEO01D/Ma4svFmwnqYXtZQVIGAX7XJtp1dvWuhT0V
1hAwVHQaPclE+BNJo99C/KP49+0yEv//Mr8Pa4JnnwNcCaa04ZrFtiOiRNxgjueF
ktu2GlRnj0Oc8DoC3V8i8xcVuLwTEJ5xCQ+7NpOrRNY6K8jzrinkt0KRNv1sQk24
zvCAozC4YWOIFL8SYxOl7MSE78+FP9qWoyIReAtrfvlMnifp3Fe+iSodYofUTciC
nrreUqwrLqwBlzbhJK6Hpa6fyJxl4xJk5+iuYzGBWePkRLfI3v6nnkTCIDD45ZFb
Zkj/vrwQ6UeGtzUYwUspbAkKJMfvrasSsU8dgfK2pp6Y48dH1+usV69NARoYkoJr
8w0vc0hwWgDM3N2AdYQeUPZR09XmYu9yRc0WnXhh5M0wl/SLYzge5MgHcd4bEAbb
PwnBwH1LLoSkIyFVwuW1Q/P5xC4qhGOuW0otjBGO0wkz+nHYD8DySe3mLkRzqPcW
STS1bXWsN5t9OapOgOLQ/oZhvhgVQQqMnywu1AvtKndJXbC0LBM=
=6UNY
-----END PGP SIGNATURE-----

--iYv/v4a9j4uVcn7G--

