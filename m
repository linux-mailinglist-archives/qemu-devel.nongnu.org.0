Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2920337F227
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 06:25:22 +0200 (CEST)
Received: from localhost ([::1]:38916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh2uX-0002pi-2r
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 00:25:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sU-0007Eg-Cj; Thu, 13 May 2021 00:23:14 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:42053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sQ-0004Xe-IK; Thu, 13 May 2021 00:23:14 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fgdms3Y0Hz9svs; Thu, 13 May 2021 14:22:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620879773;
 bh=BemONuZHQYyN3KCcUkvxZRT5l7qDyNe28mFaXPI0gJY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T0CW9y6LK54yF+9FviBKIjQA57UeEu6fo8FjfKVmhWK0oR6KXPbs46adLnVgotXao
 LDwW/WGMwKdpl/PAQsLRs/zbrXly8DjO3BRaBKhzag7Sg2viA5Hg0NEfkXtX/ISY95
 3ucp7XYCv3ePDiLtEGFKIURPPekomRA/EauUcOic=
Date: Thu, 13 May 2021 13:53:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH 05/11] target/ppc: moved ppc_store_lpcr to cpu.c
Message-ID: <YJyiuZuWGJFMU0nb@yekko>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-6-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/769adi/e+BNc9sR"
Content-Disposition: inline
In-Reply-To: <20210512140813.112884-6-bruno.larsen@eldorado.org.br>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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


--/769adi/e+BNc9sR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 11:08:07AM -0300, Bruno Larsen (billionai) wrote:
> This function is used in !TCG cases, so it has been moved into a file
> that is compiled when --disable-tcg is selected.
>=20
> Signed-off-by: Bruno Larsen (billionai)
> <bruno.larsen@eldorado.org.br>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu.c         | 11 +++++++++++
>  target/ppc/misc_helper.c | 10 ----------
>  2 files changed, 11 insertions(+), 10 deletions(-)
>=20
> diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
> index 0ab7ac1af1..8a82e2ffa8 100644
> --- a/target/ppc/cpu.c
> +++ b/target/ppc/cpu.c
> @@ -24,6 +24,7 @@
>  #include "exec/log.h"
>  #include "fpu/softfloat-helpers.h"
>  #include "mmu-hash64.h"
> +#include "helper_regs.h"
> =20
>  target_ulong cpu_read_xer(CPUPPCState *env)
>  {
> @@ -90,3 +91,13 @@ void ppc_store_sdr1(CPUPPCState *env, target_ulong val=
ue)
>      /* FIXME: Should check for valid HTABMASK values in 32-bit case */
>      env->spr[SPR_SDR1] =3D value;
>  }
> +
> +void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val)
> +{
> +    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> +    CPUPPCState *env =3D &cpu->env;
> +
> +    env->spr[SPR_LPCR] =3D val & pcc->lpcr_mask;
> +    /* The gtse bit affects hflags */
> +    hreg_compute_hflags(env);
> +}
> diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
> index b910ac6479..442b12652c 100644
> --- a/target/ppc/misc_helper.c
> +++ b/target/ppc/misc_helper.c
> @@ -255,16 +255,6 @@ target_ulong helper_clcs(CPUPPCState *env, uint32_t =
arg)
>  /***********************************************************************=
******/
>  /* Special registers manipulation */
> =20
> -void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val)
> -{
> -    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> -    CPUPPCState *env =3D &cpu->env;
> -
> -    env->spr[SPR_LPCR] =3D val & pcc->lpcr_mask;
> -    /* The gtse bit affects hflags */
> -    hreg_compute_hflags(env);
> -}
> -
>  /*
>   * This code is lifted from MacOnLinux. It is called whenever THRM1,2
>   * or 3 is read an fixes up the values in such a way that will make

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/769adi/e+BNc9sR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCcorkACgkQbDjKyiDZ
s5IDPBAAk5Bt4UV1M8wi3YvdIhabj75WO4Q6iZE1rpg6UpgcFHHtK7bcykT0qqu8
EuGb/zZiHZpF5+deOz4j+o/erNTHQFGZ0vTWlozJEI+7yujyukhiJ6FMasRTbSz5
HZOEX3EcyB+Vp9pSpEhWbIHY+ZiAJT9feDi3bO9zAc4uVx67rTcyUQQUbk99Chvd
+Nq5Fer6RZV2fueRmjILC4FlS0Mompfzubfckvoa12lu+Uuw8ls5xSLgajnQREFF
I6+BdCKZXMYc1xiI+77cGI9gvRflTmnluypuayDXaJZueOjdRGDTMKk3m1LdKIrH
9XA+44ZCtv9uNUCTRIB0OGas3UJPikS8992OmlSuwc+yHwinQri+hIHSCJbXJdU6
ypDxXrKFpgK1YDs0SM0IIv0W281TnK1xmYZAY1cPNaFYDyYqhsBrVCiaLEWcmksG
W9mNUL3kWMYx5cU9KqThEF6DWux8fbb/9pENFFe27fCX9xD8vmknVvwyg9UNnqRO
wqvfTgM4hQgGdcWQZtXeyabElvgBzkC+4I3ReezUsapvzw+gJW1maB9Zjwoy5RJ7
4/4/VGnOrZCR5VmoY1P6wvfSNelWzftAiX9UVkoJiQM6YPplCwl9alfq+wN8Vobn
iOUuyg+sXt6usF+v8fm4sNoIrzOqEgsecIWFKtFeeMx9oN1uZAM=
=WObf
-----END PGP SIGNATURE-----

--/769adi/e+BNc9sR--

