Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319973D1C23
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 04:58:48 +0200 (CEST)
Received: from localhost ([::1]:33888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Ov8-00035K-Gn
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 22:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m6Orp-000112-1p; Wed, 21 Jul 2021 22:55:21 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:60517 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m6Orm-0003Ky-9D; Wed, 21 Jul 2021 22:55:20 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GVcWP3xBHz9sXJ; Thu, 22 Jul 2021 12:55:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626922513;
 bh=/2lnHKkeRHfxfL+cMr8/3SR7F1Ppx01GU2+MLfzU/G0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MC+lhqb/ZDD3nEems/SdL82uKVm1STrNGyPxhXbnXodQwaM0Yn4z3KOdsTUFQbjXE
 8IKLszFT/2nu/JHPe9Zk+PkjAnjCoaWScmHluOtWujfEc+ztKYvSZwaYNRqvb3MBSy
 9yF8bXPlfiasxqv0+t1lmBM1tjTPYO3+sM0I7cX8=
Date: Thu, 22 Jul 2021 12:53:52 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: Re: [PATCH v4 2/3] target/ppc: moved ppc_store_sdr1 to mmu_common.c
Message-ID: <YPjdwNV3Kd1TAw+6@yekko>
References: <20210721132144.39508-1-lucas.araujo@eldorado.org.br>
 <20210721132144.39508-3-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FnN6PWbZAXtBbX3I"
Content-Disposition: inline
In-Reply-To: <20210721132144.39508-3-lucas.araujo@eldorado.org.br>
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
Cc: matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--FnN6PWbZAXtBbX3I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 21, 2021 at 10:21:43AM -0300, Lucas Mateus Castro (alqotel) wro=
te:
> ppc_store_sdr1 was at first in mmu_helper.c and was moved as part
> the patches to enable the disable-tcg option, now it's being moved
> back to a file that will be compiled with that option
>=20
> Signed-off-by: Lucas Mateus Castro (alqotel)
> <lucas.araujo@eldorado.org.br>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

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
> index 776aedce29..a8bd418f18 100644
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

--FnN6PWbZAXtBbX3I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD43b8ACgkQbDjKyiDZ
s5I1/w//fsPtLDq8NlpLE1yNE0a1oj9c49gXb32xxQadng611B2+sIihStiLUiCr
BBBfUL8XSTm1xOqR1NJxesrWBVh+sgRjEqIwWH26czeLXvw/Fov9Ppflx6TuEyXD
iM5DeLXbe1mdib0/xkNv7DRUyX8CKVoZXW/CgDkLI3udTgkbP8SsSdQZ+Q8Rseym
7J+B4z1+toCl/CVSQyflCgvizL5Put6JjNWido7OkFsfDzpYjvdpL41kfMIdqzCY
YN5EBVR1oW1546lgSRMf0NZxPewe10Z5eQl9Obrs0hAWWRV/MzjoQvMdt3a6d9Qh
jaMP23GNZF8enwZXqNx6UnIk5Tl0vIH//wBZ/HRxXpOluul5XnutpQ1yvqXF42e3
6H/yy1q4lnHAE+wG1rEL31MD0bvqsFny92bytVASaGCqgSmjifwig4wPly+7MWas
GIIJWicvJrD+U736ov99qTOaiwi65E8pa9t4zQFXIh06aOwo1WQEhrSrBMwXAtG1
HLIZh0MG5z2KdksCykJGVCr30pX+8GOPt3NLqtcOh4QueoIdtLxPugemKJrv+dAM
oet/idMHx1HfAXv6JlgrDOaVBFOr4uVh6rceURee7TOjqWxKrlkpWC9Acp+Yytcu
Ip4O7jJTTfWpU2/WfzSWZKdg/Lzvipyp8ZUdtrbzVQlJJ4Zxt/0=
=tZZj
-----END PGP SIGNATURE-----

--FnN6PWbZAXtBbX3I--

