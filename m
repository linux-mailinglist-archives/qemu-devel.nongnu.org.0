Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CF0346EED
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 02:36:51 +0100 (CET)
Received: from localhost ([::1]:57514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOsS1-0005zp-GQ
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 21:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOsPq-0004Fy-HZ; Tue, 23 Mar 2021 21:34:34 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58423 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOsPo-0001hV-04; Tue, 23 Mar 2021 21:34:34 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4rPb3kN2z9sWj; Wed, 24 Mar 2021 12:34:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616549667;
 bh=4qQh60Vd4e1QiJKScMjkgWTcYzRGbXpDDXuR88AEE74=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZH/1NZI8hrJt30FBm2Re+Drho9lnfwqGEdLRgc2tu1ijWjzYnMZTNI7V1RHDHkRgC
 TxbVYckXuU0JXWfK4FwaX5i+8tLo9jV/4ZIA+ZnBRocnzkYvJOv22u8yn0+TAuL6Vz
 vsifD1WJOv2R6x8SmUtHV09LQPrwdKxxevaiV2EM=
Date: Wed, 24 Mar 2021 11:03:31 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 03/10] target/ppc: Reduce env->hflags to uint32_t
Message-ID: <YFqB0w71y0kUCsoE@yekko.fritz.box>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
 <20210323184340.619757-4-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/W2rnZITEamsK9df"
Content-Disposition: inline
In-Reply-To: <20210323184340.619757-4-richard.henderson@linaro.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/W2rnZITEamsK9df
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 12:43:33PM -0600, Richard Henderson wrote:
> It will be stored in tb->flags, which is also uint32_t,
> so let's use the correct size.
>=20
> Reviewed-by: C=E9dric Le Goater <clg@kaod.org>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.0.


> ---
>  target/ppc/cpu.h         | 4 ++--
>  target/ppc/misc_helper.c | 2 +-
>  target/ppc/translate.c   | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index fe6c3f815d..d5f362506a 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1129,8 +1129,8 @@ struct CPUPPCState {
>      bool resume_as_sreset;
>  #endif
> =20
> -    /* These resources are used only in QEMU core */
> -    target_ulong hflags;
> +    /* These resources are used only in TCG */
> +    uint32_t hflags;
>      target_ulong hflags_compat_nmsr; /* for migration compatibility */
>      int immu_idx;     /* precomputed MMU index to speed up insn accesses=
 */
>      int dmmu_idx;     /* precomputed MMU index to speed up data accesses=
 */
> diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
> index 63e3147eb4..b04b4d7c6e 100644
> --- a/target/ppc/misc_helper.c
> +++ b/target/ppc/misc_helper.c
> @@ -199,7 +199,7 @@ void helper_store_hid0_601(CPUPPCState *env, target_u=
long val)
>      if ((val ^ hid0) & 0x00000008) {
>          /* Change current endianness */
>          hreg_compute_hflags(env);
> -        qemu_log("%s: set endianness to %c =3D> " TARGET_FMT_lx "\n", __=
func__,
> +        qemu_log("%s: set endianness to %c =3D> %08x\n", __func__,
>                   val & 0x8 ? 'l' : 'b', env->hflags);
>      }
>  }
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index a9325a12e5..a85b890bb0 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -7657,7 +7657,7 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int =
flags)
>                   env->nip, env->lr, env->ctr, cpu_read_xer(env),
>                   cs->cpu_index);
>      qemu_fprintf(f, "MSR " TARGET_FMT_lx " HID0 " TARGET_FMT_lx "  HF "
> -                 TARGET_FMT_lx " iidx %d didx %d\n",
> +                 "%08x iidx %d didx %d\n",
>                   env->msr, env->spr[SPR_HID0],
>                   env->hflags, env->immu_idx, env->dmmu_idx);
>  #if !defined(NO_TIMER_DUMP)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/W2rnZITEamsK9df
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBagdIACgkQbDjKyiDZ
s5KiCQ//XRlhZ4z1etoJo7SM2bFdsJ2JU+Bd5X5VThHHqWr//qt+eqIXUuL14A8p
wzKIpIw0ZngrqDwSjzUYV6RvZmgeiRHNkWh8dOFCAk+wYnq4Kqd26+GMExb68gSb
wO89rK1XZMAiC5mYrd4IQSNZMvpla8N5GdRyvpbxgJzSEKpxZ358aTttms8Ie+5r
J+LUbx/CCCO8BjQVhC8x+tmL5KOaOiwKvMXOtAX5IvvQNyU16LWOsBUCnzVA3xtm
K6L/D/hNU6G2zhvKD2/2Wcf77vM0j9faXaG9LOr7Lwm4KCRRkGsnahQVCYXwJgNF
RVo07UxNBqDkdNyyIYX3NUP1pYix66J6HUNDRBXLsIzB4ghRx9JgwsTLeaK3faOr
K0Itui6hqwUzh5RXqzpN7CIr+AbgH5sz7q+1Eyx1cxiMY4E1raFmAJ/HsxAeUH9c
2lxyXfOQzURbuo/l/sRfYs5Mvrz4KsQo3einKtiP29gdvh6W0OCy4jKxHchPyIPr
Iwgtsyxf4XIRNZFQ4sReAgt67pEedAXNo0qQgegA3r2qplaOc0ns90EweuTxOVSn
eB4nMvzgdSkxEmYDqJu5tHRMN2hSQZV2ohf3vcNVIpPmlJpmNulxpdue4KneT+MX
B6Oy5JUtlMIN2aIETG5c5htx2SwJ3kMNOkJ+6/p8J9OCtZTtouU=
=3Z7i
-----END PGP SIGNATURE-----

--/W2rnZITEamsK9df--

