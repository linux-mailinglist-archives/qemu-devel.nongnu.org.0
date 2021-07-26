Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533303D5295
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 06:47:52 +0200 (CEST)
Received: from localhost ([::1]:60544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7sWs-00014u-Qx
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 00:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m7sTm-0007Fw-Os; Mon, 26 Jul 2021 00:44:38 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:58067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m7sTj-0000I1-Re; Mon, 26 Jul 2021 00:44:38 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GY6lf3LlTz9shx; Mon, 26 Jul 2021 14:44:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1627274670;
 bh=G816I3/JgU9rufcltmbICkYIXNCVQyDczu5i57m68xs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ahphxq3KOI2ztPuQB4bTZA/E1al9RaX3Ban+lZ8CYz/19IHsEH4W82druOzYzjYQU
 RSchsy0uH160onp5u+PlF/q+at5197Ozaa0iSZ+smYa5913+AqT73FQ79SZXZBEajD
 bek3FRbr9fqqxiUq3ArColaF3jJGgw1760cMXIH8=
Date: Mon, 26 Jul 2021 14:30:17 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: Re: [PATCH v5 3/3] target/ppc: moved store_40x_sler to helper_regs.c
Message-ID: <YP46Wb7WQ+W32dHd@yekko>
References: <20210723175627.72847-1-lucas.araujo@eldorado.org.br>
 <20210723175627.72847-4-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Bxns6CGmrs1I1goG"
Content-Disposition: inline
In-Reply-To: <20210723175627.72847-4-lucas.araujo@eldorado.org.br>
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
Cc: matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Bxns6CGmrs1I1goG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 23, 2021 at 02:56:27PM -0300, Lucas Mateus Castro (alqotel) wro=
te:
> moved store_40x_sler from mmu_common.c to helper_regs.c as it is
> a function to store a value in a special purpose register, so
> moving it to a file focused in special register manipulation
> is more appropriate.
>=20
> Signed-off-by: Lucas Mateus Castro (alqotel)
> <lucas.araujo@eldorado.org.br>

Applied to ppc-for-6.2, thanks.

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
> index a0518f611b..754509e556 100644
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

--Bxns6CGmrs1I1goG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD+OlkACgkQbDjKyiDZ
s5LL9RAAkfUkLBZkxfRanmLk4WkWAHqfxegL16RzaDBqyeZCg8iGJoow7OXMURlD
FZpOMVvAjwIadxFjbGCj+BANdMvo+NIvM6EZRS+DfEy4aUcYjM+OMAaKC4XjE/CJ
E/4TzRmL9p5Syq6tmygmJtKo7HocQzGVph62WZN2coLb3V57oF6Ge0vnwdaaRylY
TJQhm5J3OOKupKfKqtB1L2z6VL3ckeg6P9cvG8y0cX9QHvuLJVNnnuaMWhix7a2s
TPZmegtWLxMfQ/om073Ohzic8iL97vK82nE5eVf7RoN3J5l66XxN+bu7FBcMP6aq
oD9Q1psQ5MbvAh8EH+d16PJZfWUMWbjzdsuqb6atdydDdLK3M8y7GKGQx9Qvog+K
lDuLih2t3CpdgVrbxujaFwgLEzR2KLaFAwm5WPdaIjS/xXzUmU16AGB1SEVEiVfj
3x0TfEHNxoQfCyFraJuoTac+MZOdFeTFVzcEydTflPFT803AnftXu9brm5E/3/Wd
9XxTGKv+kjfepfvsMXV/MPl+M8BS0fkMQo1iqpLPiNNjGinEe9uite4X5DwdtrMo
FLZWgye2gv7mj1XgQDS+c9QwDKp2MiUG+DDlIAZwZSbqJbqhR5WvJCLc5iJ56Z3Y
Gue3YuyZF9bt8rly6LUR6lHoRovOYKrQt389h2QrJerFyVp4waM=
=xcJW
-----END PGP SIGNATURE-----

--Bxns6CGmrs1I1goG--

