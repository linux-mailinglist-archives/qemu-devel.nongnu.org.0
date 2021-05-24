Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C48A438DF8B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 05:07:36 +0200 (CEST)
Received: from localhost ([::1]:44142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll0wJ-0006bh-QE
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 23:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll0sV-0008BW-RH; Sun, 23 May 2021 23:03:40 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:49441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll0sS-0000ZZ-1p; Sun, 23 May 2021 23:03:38 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FpMV44bLdz9sW4; Mon, 24 May 2021 13:03:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621825404;
 bh=xMK/wnrj8edsD8vw26yHrlmK+YequV2Gr8IyE5IDAis=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R0MsinKdAlsCeRkFYCBnDBUnALUprI71j5tzHc0NvVXUEaYdDJl+385wlK44md7Mp
 xZLlD61OCNN45ZsDoXv7Whidf22w2SXxekFFVyOJYvEJ0Vge1752LyJ0oLk0gkfLIe
 oqPqQ6AX1oI5bvaT94mooL0rA8ZdPuKyyXuYBESs=
Date: Mon, 24 May 2021 12:37:17 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v3 2/9] target/ppc: moved ppc_store_lpcr and
 ppc_store_msr to cpu.c
Message-ID: <YKsRXVuvDcF40qoB@yekko>
References: <20210521201759.85475-1-bruno.larsen@eldorado.org.br>
 <20210521201759.85475-3-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="t9X/Xunlv2aOd0qC"
Content-Disposition: inline
In-Reply-To: <20210521201759.85475-3-bruno.larsen@eldorado.org.br>
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


--t9X/Xunlv2aOd0qC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 21, 2021 at 05:17:52PM -0300, Bruno Larsen (billionai) wrote:
> These functions are used in hw/ppc logic, during machine startup, which
> means it must be compiled when --disable-tcg is selected, and so it has
> been moved into a common code file
>=20
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/cpu.c         | 17 +++++++++++++++++
>  target/ppc/misc_helper.c | 16 ----------------
>  2 files changed, 17 insertions(+), 16 deletions(-)
>=20
> diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
> index 9cf3288b7a..c8e87e30f1 100644
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
> @@ -92,3 +93,19 @@ void ppc_store_sdr1(CPUPPCState *env, target_ulong val=
ue)
>      env->spr[SPR_SDR1] =3D value;
>  }
>  #endif /* CONFIG_SOFTMMU */
> +
> +/* GDBstub can read and write MSR... */
> +void ppc_store_msr(CPUPPCState *env, target_ulong value)
> +{
> +    hreg_store_msr(env, value, 0);
> +}
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
> index 08a31da289..442b12652c 100644
> --- a/target/ppc/misc_helper.c
> +++ b/target/ppc/misc_helper.c
> @@ -255,22 +255,6 @@ target_ulong helper_clcs(CPUPPCState *env, uint32_t =
arg)
>  /***********************************************************************=
******/
>  /* Special registers manipulation */
> =20
> -/* GDBstub can read and write MSR... */
> -void ppc_store_msr(CPUPPCState *env, target_ulong value)
> -{
> -    hreg_store_msr(env, value, 0);
> -}
> -
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

--t9X/Xunlv2aOd0qC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCrEV0ACgkQbDjKyiDZ
s5KCfhAAlD9HVSODT3kbrGgmw3ZoIfnTGdkexuHXUxkAkKPaTbKVipxveF72jOtm
Y7G1/q1w9u43d5fgJpExe44Pd5fpTyEDfuN7d4w5kI193cgpHsLFYD0/Euv44biB
RY3NfOdCr/F17K8xHoekP5lDuko61ms9S2rT4D0xiCS1nF/y5TO/byf7dlWnJfA5
oVHEkbcOi7C2Pg+hFu1TgGmNkCRrLcLgoSxjeu+pWnhhNFRCHRkn/d1Z79XWL4qI
C382efrhPilEhXyidmQcOwaY4wD5KB4TfMEqLRTf9WsByv9PuF9QvUsRJb7Lvm3U
d/YrBlsBOhIKn0b047gJUknwkBbgDCqgLfzGOBJ5ylhEHs16xzFfzrlygVEl7EHn
0RW/ZcD0UX/wAehd067b6kj211gnrw3xjrssZbbRWG7JVD8gNGxpNJk6MkRTBK4i
/48w5yCs99STRpDdPtl71Ukcom4u6L0fEBRCyyMCVFJ3cnq5iMkvrcty4KK3RY9i
BCOCGo4EVqWgs323NBcUYxJFlLGjH/Rwn7hWIdRSWgDfPZE6d766ke1YcO9bMOwt
e7BoUbgm7eVSoJVDrciyNNGObpgVS6gmwl1rC3lb4+ewHyjE59wrANLEWNBxgYTT
l/2w/Qaagrx458FrN8hgAx+b7rvDMKRORnG90QGyNq8BnJY5uXU=
=FKNG
-----END PGP SIGNATURE-----

--t9X/Xunlv2aOd0qC--

