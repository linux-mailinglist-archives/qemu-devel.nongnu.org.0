Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B02C48605E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 06:44:38 +0100 (CET)
Received: from localhost ([::1]:60846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5LZl-0004Mv-2Q
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 00:44:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n5LNy-0004nM-0q; Thu, 06 Jan 2022 00:32:26 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=48065
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n5LNp-0002Ws-AL; Thu, 06 Jan 2022 00:32:20 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JTw2z6fR7z4xts; Thu,  6 Jan 2022 16:32:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1641447131;
 bh=M1Hkjv5doAgKn6R/upUzRzq29XmAvZ4urYD0aaFXp+k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T8Ph5tg7AWkayRN0tWjlIsWdZXolnk3bO5BLFXmt/5Nioqz1uDQXYDPo7sgZwuWk/
 zuPexwGV6KnocNBFb6dIxycwqOpiku9FieFc3mFG/olS+9jaNbA54xi0BSa2nRMcQB
 SlAa8ErjeabVeBepTpLZTz9brl2pQh6qv5wPaGDA=
Date: Thu, 6 Jan 2022 16:26:26 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v2 2/7] target/ppc: powerpc_excp: Keep 60x soft MMU logs
 active
Message-ID: <YdZ9gpr7VCYywQE6@yekko>
References: <20220105204029.4058500-1-farosas@linux.ibm.com>
 <20220105204029.4058500-3-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qI9ei7R46KD7kRxR"
Content-Disposition: inline
In-Reply-To: <20220105204029.4058500-3-farosas@linux.ibm.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--qI9ei7R46KD7kRxR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 05, 2022 at 05:40:24PM -0300, Fabiano Rosas wrote:
> Remove the compile time definition and make the logging be controlled
> by the `-d mmu` option in the cmdline.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> Reviewed-by: C=E9dric Le Goater <clg@kaod.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

I'm guessing from the text here that this logging is specific to the
60x software TLB implementation rather than (say) the 40x, 44x, 8xx or
freescale implementations.  Changing the function name to reflect that
might be a nice future change.

> ---
>  target/ppc/excp_helper.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 2c5d5470de..ce86b2ae37 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -30,8 +30,6 @@
>  #include "exec/cpu_ldst.h"
>  #endif
> =20
> -/* #define DEBUG_SOFTWARE_TLB */
> -
>  /***********************************************************************=
******/
>  /* Exception processing */
>  #if !defined(CONFIG_USER_ONLY)
> @@ -137,7 +135,6 @@ static void dump_hcall(CPUPPCState *env)
> =20
>  static void ppc_excp_debug_sw_tlb(CPUPPCState *env, int excp)
>  {
> -#if defined(DEBUG_SOFTWARE_TLB)
>      const char *es;
>      target_ulong *miss, *cmp;
>      int en;
> @@ -161,12 +158,12 @@ static void ppc_excp_debug_sw_tlb(CPUPPCState *env,=
 int excp)
>          miss =3D &env->spr[SPR_DMISS];
>          cmp =3D &env->spr[SPR_DCMP];
>      }
> -    qemu_log("6xx %sTLB miss: %cM " TARGET_FMT_lx " %cC "
> -             TARGET_FMT_lx " H1 " TARGET_FMT_lx " H2 "
> -             TARGET_FMT_lx " %08x\n", es, en, *miss, en, *cmp,
> -             env->spr[SPR_HASH1], env->spr[SPR_HASH2],
> -             env->error_code);
> -#endif
> +
> +    qemu_log_mask(CPU_LOG_MMU, "6xx %sTLB miss: %cM " TARGET_FMT_lx " %c=
C "
> +                  TARGET_FMT_lx " H1 " TARGET_FMT_lx " H2 "
> +                  TARGET_FMT_lx " %08x\n", es, en, *miss, en, *cmp,
> +                  env->spr[SPR_HASH1], env->spr[SPR_HASH2],
> +                  env->error_code);
>  }
> =20
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qI9ei7R46KD7kRxR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHWfYAACgkQbDjKyiDZ
s5KY2BAAsc9owutMj+Zg392FUm48TJVgEIOrCajlCbjkBTOtetBa0oZZlxa2EnpH
+LjxN6Mx7rbbfvUaLnL31Pxj5S97CHRQihKSkcIiJMZEU6x7fRrI9JGWV2gifmc4
Aui5E+WONxb2YxpBS7giC4ijw+0CJOGdS58NALBLzff6KeAK4xHkBmj8kdnovDiB
/HvHp8TjhQjsSIWtEoSpQNXBkbT7vXITlFOeTFMGTlWBQBG62LQwcMQi8Z/Gla0i
p/UFwGtKTMIugOLHmwbY7SLNbd+jCBez9c6GIFsqp7kfEkLFfwoF3NO8gCfVCems
nR9DSy6KeFULQ3bZgPJiF1WHUPDp//HgjIkJDXgkz45+Wx0VUWbI+XMMV1A5fUVz
3WLLeg/3o9qL1zw1SQc5cY+7GakJQSxL/hwUunfQVmhKBNra+qXKYKBnz9CqVv33
nz18MJ4pFCUKHzTZp7HTa0p364kcxR027VHsHALaJpFw86AGyeccQ14Uh1MdUhi+
3tuapvPdx2LpTwt+Hy0aeKHy44XmGaa25+gOG2+sP1cI1qhPQI5Ml1wozAWGXgY0
D7dQsWk+czFgDUk6AzlTKOX0JVPM2LDCxaKTl29Uzi8ryyTlMJjVMYuPyYAyTNk1
/9Uui3jEFSXOg8ne4e2UkP5x32P3GlDnZXbA94d5pabTu/JYQDQ=
=aqjd
-----END PGP SIGNATURE-----

--qI9ei7R46KD7kRxR--

