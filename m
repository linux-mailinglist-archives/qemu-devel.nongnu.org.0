Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA543D1C2B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 05:03:36 +0200 (CEST)
Received: from localhost ([::1]:39346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Ozn-0006yZ-0O
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 23:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m6Orp-000113-5K; Wed, 21 Jul 2021 22:55:21 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39123 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m6Orm-0003Kz-CG; Wed, 21 Jul 2021 22:55:20 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GVcWP4Dzfz9sXN; Thu, 22 Jul 2021 12:55:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626922513;
 bh=IdtVEeAg6kO2ZY2yNfGoSgIhTUEZp3AwWbEgSTBmJu4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bwZ1GAdZwYgEZo7L31QQoEk53gq7HN4hHajipL2QkzrHc0fzS+HcCoiwh1enpeEl+
 Pm2Wsh6AjIIdpLe2KtfZvmu1F0cs2rmtbBF9IIvN8qHkRIFYTmpIZtAapZRHWrRpLW
 kngZ/iXhRuAYVQe8P9jzpPOxhvUFORvOIRogO0jw=
Date: Thu, 22 Jul 2021 12:55:06 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: Re: [PATCH v4 3/3] target/ppc: moved store_40x_sler to helper_regs.c
Message-ID: <YPjeCs9v+MMCZYO5@yekko>
References: <20210721132144.39508-1-lucas.araujo@eldorado.org.br>
 <20210721132144.39508-4-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lgfYztgspqSkxg6M"
Content-Disposition: inline
In-Reply-To: <20210721132144.39508-4-lucas.araujo@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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


--lgfYztgspqSkxg6M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 21, 2021 at 10:21:44AM -0300, Lucas Mateus Castro (alqotel) wro=
te:
> moved store_40x_sler from mmu_common.c to helper_regs.c as it was
> more appropriate

This message needs a rationale to explain why this is more appropriate.

>=20
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.b=
r>
> ---
>  target/ppc/helper_regs.c | 12 ++++++++++++
>  target/ppc/mmu_common.c  | 10 ----------
>  2 files changed, 12 insertions(+), 10 deletions(-)
>=20
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index 3723872aa6..405450d863 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -258,6 +258,18 @@ int hreg_store_msr(CPUPPCState *env, target_ulong va=
lue, int alter_hv)
>      return excp;
>  }
> =20
> +#ifdef CONFIG_SOFTMMU
> +void store_40x_sler(CPUPPCState *env, uint32_t val)
> +{
> +    /* XXX: TO BE FIXED */
> +    if (val !=3D 0x00000000) {
> +        cpu_abort(env_cpu(env),
> +                  "Little-endian regions are not supported by now\n");
> +    }
> +    env->spr[SPR_405_SLER] =3D val;
> +}
> +#endif /* CONFIG_SOFTMMU */
> +
>  #ifndef CONFIG_USER_ONLY
>  void check_tlb_flush(CPUPPCState *env, bool global)
>  {
> diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
> index a8bd418f18..e206be9d05 100644
> --- a/target/ppc/mmu_common.c
> +++ b/target/ppc/mmu_common.c
> @@ -622,16 +622,6 @@ static int mmu40x_get_physical_address(CPUPPCState *=
env, mmu_ctx_t *ctx,
>      return ret;
>  }
> =20
> -void store_40x_sler(CPUPPCState *env, uint32_t val)
> -{
> -    /* XXX: TO BE FIXED */
> -    if (val !=3D 0x00000000) {
> -        cpu_abort(env_cpu(env),
> -                  "Little-endian regions are not supported by now\n");
> -    }
> -    env->spr[SPR_405_SLER] =3D val;
> -}
> -
>  static int mmubooke_check_tlb(CPUPPCState *env, ppcemb_tlb_t *tlb,
>                                hwaddr *raddr, int *prot, target_ulong add=
ress,
>                                MMUAccessType access_type, int i)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--lgfYztgspqSkxg6M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD43goACgkQbDjKyiDZ
s5Ke4BAAmhuUN83rk8JZC3VWvIAMjPWLW0AvLmAnEwhMFrLp9LOvtJx10BC+d+h5
EgC3m3Tmypv2TLYvwAwAMue9T/M1dHEf6efB95J+RpiAhXX7NXsPBHhopVfzWK8V
cELDi87bTYBBTqYldNXNLN3xDs0AfCaeE6MriE+7oEsLaHoH+LlPmI/5BdQZ+PzL
smA7kcHY4PtCnG1M12/mtiIRRWe8THo545AYnY3laXXnHDgzhzbGO3F3Xq7qOInm
RaFf37yyALgi8lDPNPJ3F1ChtcfbYq9H9920OhbL/Ir28bijlWQD6tofus6pO86n
eJjRxPBeGF7zo53+O4+GZjROODWkdOIdAMzipADHCvpinhqFqH9u0/3dcZE2K4jr
mkITBh+8cMy8IoOWi4v0ecZYqo4SBpGF/QxC5VwU6sL8AvI3V9Vaah4xa2t5o6Fp
C8VlJrdOs+f23EfgLtpKqMHUmCSpp3ClSMdtOQKbzcDoV1tZDV7DIQD+W1GOAQPK
2R2FHuY99f71I5TZMsXXQuM8+dj1EwYsoLvUv8KT5Qt7GPuJWnU5HQ8DyBc736S3
hfZY66GvHNplJVmi/myEZi/a4X4p90Eos+C5XlTdX8OQpgbE46SEuTcDyMd5WH2/
gPsS0vrIc07Ae6S3GuZal2uMsnoeMHEwLHqEYMGCMmuBPH6vscE=
=Vem5
-----END PGP SIGNATURE-----

--lgfYztgspqSkxg6M--

