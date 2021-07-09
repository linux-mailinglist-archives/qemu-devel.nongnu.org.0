Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8BE3C1CF1
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 03:10:26 +0200 (CEST)
Received: from localhost ([::1]:51258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1f29-0000pd-Iq
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 21:10:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1eyz-0006pr-Ea; Thu, 08 Jul 2021 21:07:09 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34367 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1eys-0003Cz-L8; Thu, 08 Jul 2021 21:07:09 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLZkS2xQcz9shx; Fri,  9 Jul 2021 11:06:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625792816;
 bh=u/c83LqVsXtJq1vUnFQHd7jeX2zhAT/YDyBG2WOEcBA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XGAN8PTV6N7B62yVMty18ef/L7rwrtuLnoRk4RrUJa/RXasjc+gGaWc1e0W6G4gAs
 lcsvy4okQyD81Z/tpPM7T/8GX3XWttfm25ko610QaPVYJS12OM5Mfj3ZVSxSgJHiZo
 ely9Q56YVuYbqWUrKHWzmKqiYlhz8f0ZBxfZYtZI=
Date: Fri, 9 Jul 2021 10:44:34 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: Re: [PATCH v3 1/4] target/ppc: Don't compile ppc_tlb_invalid_all
 without TCG
Message-ID: <YOeb8hm9n2HoqoB/@yekko>
References: <20210708164957.28096-1-lucas.araujo@eldorado.org.br>
 <20210708164957.28096-2-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1T/w4x4/IrTV0Ex0"
Content-Disposition: inline
In-Reply-To: <20210708164957.28096-2-lucas.araujo@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--1T/w4x4/IrTV0Ex0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 08, 2021 at 01:49:54PM -0300, Lucas Mateus Castro (alqotel) wro=
te:
> The function ppc_tlb_invalid_all is not compiled anymore in a TCG-less
> environment, and the call to that function has been disabled in this
> situation
>=20
> Signed-off-by: Lucas Mateus Castro (alqotel)
> <lucas.araujo@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/cpu_init.c   | 2 ++
>  target/ppc/mmu_helper.c | 4 ++++
>  2 files changed, 6 insertions(+)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 6f8ce010ba..505a0ed6ac 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -8847,9 +8847,11 @@ static void ppc_cpu_reset(DeviceState *dev)
> =20
>  #if !defined(CONFIG_USER_ONLY)
>      env->nip =3D env->hreset_vector | env->excp_prefix;
> +#if defined(CONFIG_TCG)
>      if (env->mmu_model !=3D POWERPC_MMU_REAL) {
>          ppc_tlb_invalidate_all(env);
>      }
> +#endif /* CONFIG_TCG */
>  #endif
> =20
>      hreg_compute_hflags(env);
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index 47e9f9529e..869d24d301 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -825,6 +825,7 @@ static int mmubooke_get_physical_address(CPUPPCState =
*env, mmu_ctx_t *ctx,
>      return ret;
>  }
> =20
> +#ifdef CONFIG_TCG
>  static void booke206_flush_tlb(CPUPPCState *env, int flags,
>                                 const int check_iprot)
>  {
> @@ -846,6 +847,7 @@ static void booke206_flush_tlb(CPUPPCState *env, int =
flags,
> =20
>      tlb_flush(env_cpu(env));
>  }
> +#endif
> =20
>  static hwaddr booke206_tlb_to_page_size(CPUPPCState *env,
>                                          ppcmas_tlb_t *tlb)
> @@ -1901,6 +1903,7 @@ void helper_store_601_batl(CPUPPCState *env, uint32=
_t nr, target_ulong value)
>  }
>  #endif
> =20
> +#ifdef CONFIG_TCG
>  /***********************************************************************=
******/
>  /* TLB management */
>  void ppc_tlb_invalidate_all(CPUPPCState *env)
> @@ -1944,6 +1947,7 @@ void ppc_tlb_invalidate_all(CPUPPCState *env)
>          break;
>      }
>  }
> +#endif
> =20
>  #ifdef CONFIG_TCG
>  void ppc_tlb_invalidate_one(CPUPPCState *env, target_ulong addr)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1T/w4x4/IrTV0Ex0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDnm/IACgkQbDjKyiDZ
s5KwyxAAjUj561kQRZ5662Tq/7nyvrx3NaawLfCxfo2Wlhs+2drFDmY5MHhg5k0z
YJ4XnHXCEcHvDwZF1LVFJJQW/mxp7wKmylon5jkrWJMyTnZTfBk9aWj+BnfNk4K7
XsnJzGW79cKJrS/NvtSh+DiOVShkIJL4A1WWzJFyB3Hs5Cvj23QtecbRkIsNZlZB
YoeYKvhl49ICjb9TpE5QXlMk3LyrprBRHpjKVqYqoR/0dm/ubOdX9g+39vWFxlNq
PhT6Z7oIVfPx3pzQsstfYpnnIVmMHtHRVFUewZtqFuWDeUFp9+3NFD+1wWgG7hYr
PCVUDVcl0rTwSKgZrjWDLphnkBgG9krHNGFySd2xhn5t0Xy1STtioMHrmtS0jU2u
+f62Q+njT/kwYaYSi4DE6N+srZNpLgji7TayQXyB4cvWhXUulZzgW/DcDSBZxOk9
mjbn2H13/tbwsJmN13J9ebrgK4xXAV3LfeCnZLG10sK+SJ11kb6IybFZpqPSPzm6
XBtgl9OqG1nfSqwpFeNYRN278u3b7T/5JSMfNmrlFTvbR8MdDY+Xd1xTvj/pkooU
bm6j7urXZnb/bnPv/QKwSpeBp04IDFfhoZd4CG7Da7l5RioeUxAwTWD2NsfiQx7E
8VNGXY9VRTxFz3uSac6wRolZdx83NSyxXBRsC9aFyyvEdTi+bNY=
=6N5f
-----END PGP SIGNATURE-----

--1T/w4x4/IrTV0Ex0--

