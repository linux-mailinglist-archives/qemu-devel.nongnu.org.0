Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12D7486012
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 06:08:17 +0100 (CET)
Received: from localhost ([::1]:41220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5L0a-0005rW-AF
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 00:08:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n5Kwa-0004qh-GZ; Thu, 06 Jan 2022 00:04:08 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=55619
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n5KwW-0001la-I0; Thu, 06 Jan 2022 00:04:07 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JTvQD4wJ2z4y46; Thu,  6 Jan 2022 16:03:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1641445428;
 bh=oqfIG3cTErnZhwBnrYx1daamwB/1lbquZ76pgy6go/g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dyDlwRtTohsNy7TuBQnuwFRakprIgOlAGSsTHKbG29OUp+eGGTap6L8aUTYtruy+A
 n+nyrZDPmH5ZAjQ7Qw7bNvNMVQRLQJPLoniDR1D2nNA3E+qmNfiWcxeUw0Q91MM3nW
 UJbMRSzyk84ZyeS2CJswxZ5Lyxe9Ns+8Ld7qgpDE=
Date: Thu, 6 Jan 2022 14:55:27 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v2 1/7] target/ppc: powerpc_excp: Extract software TLB
 logging into a function
Message-ID: <YdZoL21MGr/lB+Es@yekko>
References: <20220105204029.4058500-1-farosas@linux.ibm.com>
 <20220105204029.4058500-2-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wSlxIyW6Dly9Oe6d"
Content-Disposition: inline
In-Reply-To: <20220105204029.4058500-2-farosas@linux.ibm.com>
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


--wSlxIyW6Dly9Oe6d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 05, 2022 at 05:40:23PM -0300, Fabiano Rosas wrote:
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/excp_helper.c | 63 +++++++++++++++++++++++-----------------
>  1 file changed, 36 insertions(+), 27 deletions(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index a779dc936a..2c5d5470de 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -135,6 +135,41 @@ static void dump_hcall(CPUPPCState *env)
>                    env->nip);
>  }
> =20
> +static void ppc_excp_debug_sw_tlb(CPUPPCState *env, int excp)
> +{
> +#if defined(DEBUG_SOFTWARE_TLB)
> +    const char *es;
> +    target_ulong *miss, *cmp;
> +    int en;
> +
> +    if (!qemu_log_enabled()) {
> +        return;
> +    }
> +
> +    if (excp =3D=3D POWERPC_EXCP_IFTLB) {
> +        es =3D "I";
> +        en =3D 'I';
> +        miss =3D &env->spr[SPR_IMISS];
> +        cmp =3D &env->spr[SPR_ICMP];
> +    } else {
> +        if (excp =3D=3D POWERPC_EXCP_DLTLB) {
> +            es =3D "DL";
> +        } else {
> +            es =3D "DS";
> +        }
> +        en =3D 'D';
> +        miss =3D &env->spr[SPR_DMISS];
> +        cmp =3D &env->spr[SPR_DCMP];
> +    }
> +    qemu_log("6xx %sTLB miss: %cM " TARGET_FMT_lx " %cC "
> +             TARGET_FMT_lx " H1 " TARGET_FMT_lx " H2 "
> +             TARGET_FMT_lx " %08x\n", es, en, *miss, en, *cmp,
> +             env->spr[SPR_HASH1], env->spr[SPR_HASH2],
> +             env->error_code);
> +#endif
> +}
> +
> +
>  static int powerpc_reset_wakeup(CPUState *cs, CPUPPCState *env, int excp,
>                                  target_ulong *msr)
>  {
> @@ -777,34 +812,8 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp)
>              }
>              /* fall through */
>          case POWERPC_EXCP_7x5:
> -#if defined(DEBUG_SOFTWARE_TLB)
> -            if (qemu_log_enabled()) {
> -                const char *es;
> -                target_ulong *miss, *cmp;
> -                int en;
> +            ppc_excp_debug_sw_tlb(env, excp);
> =20
> -                if (excp =3D=3D POWERPC_EXCP_IFTLB) {
> -                    es =3D "I";
> -                    en =3D 'I';
> -                    miss =3D &env->spr[SPR_IMISS];
> -                    cmp =3D &env->spr[SPR_ICMP];
> -                } else {
> -                    if (excp =3D=3D POWERPC_EXCP_DLTLB) {
> -                        es =3D "DL";
> -                    } else {
> -                        es =3D "DS";
> -                    }
> -                    en =3D 'D';
> -                    miss =3D &env->spr[SPR_DMISS];
> -                    cmp =3D &env->spr[SPR_DCMP];
> -                }
> -                qemu_log("6xx %sTLB miss: %cM " TARGET_FMT_lx " %cC "
> -                         TARGET_FMT_lx " H1 " TARGET_FMT_lx " H2 "
> -                         TARGET_FMT_lx " %08x\n", es, en, *miss, en, *cm=
p,
> -                         env->spr[SPR_HASH1], env->spr[SPR_HASH2],
> -                         env->error_code);
> -            }
> -#endif
>              msr |=3D env->crf[0] << 28;
>              msr |=3D env->error_code; /* key, D/I, S/L bits */
>              /* Set way using a LRU mechanism */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wSlxIyW6Dly9Oe6d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHWaC0ACgkQbDjKyiDZ
s5IzkQ//QieMwzLWG3nuxflcmeCAF56fDZ+9RmzHOCKphWIbpAsQjEurejDijKzz
/avrA9bM/TvGC9SVbG6HugTTr/b2WGNNHNAjdzRa4O1Tton/NmOV+jblyfgCn+NW
t6lRyiRQoG6ndbZm4l63BPG6UCjoqGl/BKRLYbv7dG9O3Uu3meL0m/YRrIsZoTCU
P7Nm52v8K3SbirPq/iWu1JRiuLMquYJhj6HoibrgGUJuCHqF0+5znrig27rN4DY1
hoZlcrQ67XDG6GlccX+ynUCT0tLTo0ZJIeOG8HiIlDCFRlhnpmqiRh7x2hf/qQCv
yl8yN/DB26N3p75CGv7EkaozGT68jZOlrpsV3Fjm7WcSJ31xwsStk6LWweo7DzGT
OQxq8mxNTBKs7d3PqDmGCAVK4ieQCt7aogL24nt5ng/J+aPYYlEsMQrPvwsLP247
GJozBd3//fvaFxdBFBC5c5VhnbcuceZ5p7/qeJFkM/VRsP9XOv8B10kbAvw8IQ9A
BMTJFTfTJkCsgOxA0nMgjyfDM0O9LwonaE1uRGhL10CrcsKrZS1bFWYFs3eduiz5
DvbcnXwmu3pDnUTjZGaNl7nDcqcZ3zoNUQhTP3V9ZqfRVezOIgl70YMEA6NISULi
pnOUG3wx2ySG7anC9F0l/vW4/8DhLPn1EfCFh7gjHhD+D977k8Y=
=Hs/u
-----END PGP SIGNATURE-----

--wSlxIyW6Dly9Oe6d--

