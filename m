Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 202CE3F6E95
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 06:52:18 +0200 (CEST)
Received: from localhost ([::1]:39952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIktd-0003Lk-0D
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 00:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkrU-0001O1-3n; Wed, 25 Aug 2021 00:50:04 -0400
Received: from ozlabs.org ([203.11.71.1]:43481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkrO-0005id-Ri; Wed, 25 Aug 2021 00:50:03 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GvYS172Vbz9sW4; Wed, 25 Aug 2021 14:49:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629866993;
 bh=moSvdt2kFbULZKzN5VBW7CCPqIGUj9Tj6v/Q/C6nKWk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M/EUTkgSFXVT9k3qamXV8DbHV5l+pULVezpHMMtgj8UllpDP8UFYUSPMXBAz3nO8P
 thZJAkJq+klxcx8VvW7EI3RET8thAir89cwFf198rMQ+oeL+ie1KywvNBCs7L/LJYS
 /ox5kE62TIOh5DhgG9RB1qdpT9U1D7sYO8biHh00=
Date: Wed, 25 Aug 2021 14:30:11 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 02/16] target/ppc: add user read functions for MMCR0
 and MMCR2
Message-ID: <YSXHU2NJbJpI6spA@yekko>
References: <20210824163032.394099-1-danielhb413@gmail.com>
 <20210824163032.394099-3-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MkmIZfuHR/BOP5Ox"
Content-Disposition: inline
In-Reply-To: <20210824163032.394099-3-danielhb413@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: gustavo.romero@linaro.org, Gustavo Romero <gromero@linux.ibm.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--MkmIZfuHR/BOP5Ox
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 01:30:18PM -0300, Daniel Henrique Barboza wrote:
> From: Gustavo Romero <gromero@linux.ibm.com>
>=20
> This patch adds handling of UMMCR0 and UMMCR2 user read which,
> according to PowerISA 3.1, has some bits ommited to the

Nit: One 'm' in "omited".

> userspace.
>=20
> CC: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  target/ppc/cpu.h       |  5 +++++
>  target/ppc/cpu_init.c  |  4 ++--
>  target/ppc/spr_tcg.h   |  2 ++
>  target/ppc/translate.c | 37 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 46 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 627fc8d732..739005ba29 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -343,6 +343,11 @@ typedef struct ppc_v3_pate_t {
>  #define MSR_LE   0  /* Little-endian mode                           1 hf=
lags */
> =20
>  /* PMU bits */
> +#define MMCR0_FC    PPC_BIT(32)         /* Freeze Counters  */
> +#define MMCR0_PMAO  PPC_BIT(56)         /* Perf Monitor Alert Ocurred */
> +#define MMCR0_PMAE  PPC_BIT(37)         /* Perf Monitor Alert Enable */
> +#define MMCR0_EBE   PPC_BIT(43)         /* Perf Monitor EBB Enable */
> +#define MMCR0_FCECE PPC_BIT(38)         /* FC on Enabled Cond or Event */
>  #define MMCR0_PMCC  PPC_BITMASK(44, 45) /* PMC Control */
> =20
>  /* LPCR bits */
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index c72c7fabea..5510c3799f 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -6868,7 +6868,7 @@ static void register_book3s_pmu_sup_sprs(CPUPPCStat=
e *env)
>  static void register_book3s_pmu_user_sprs(CPUPPCState *env)
>  {
>      spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
> -                 &spr_read_ureg, &spr_write_PMU_groupA_ureg,
> +                 &spr_read_MMCR0_ureg, &spr_write_PMU_groupA_ureg,

Hrm.. so combined with the previous patch this means that userspace
can write any bit in MMCR0, but only read some of them.  Is that
really correct?

>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
> @@ -6976,7 +6976,7 @@ static void register_power8_pmu_sup_sprs(CPUPPCStat=
e *env)
>  static void register_power8_pmu_user_sprs(CPUPPCState *env)
>  {
>      spr_register(env, SPR_POWER_UMMCR2, "UMMCR2",
> -                 &spr_read_ureg, &spr_write_PMU_groupA_ureg,
> +                 &spr_read_MMCR2_ureg, &spr_write_PMU_groupA_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_USIER, "USIER",
> diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
> index 027ec4c3f7..64ef2cd089 100644
> --- a/target/ppc/spr_tcg.h
> +++ b/target/ppc/spr_tcg.h
> @@ -32,6 +32,8 @@ void spr_write_lr(DisasContext *ctx, int sprn, int gprn=
);
>  void spr_read_ctr(DisasContext *ctx, int gprn, int sprn);
>  void spr_write_ctr(DisasContext *ctx, int sprn, int gprn);
>  void spr_read_ureg(DisasContext *ctx, int gprn, int sprn);
> +void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn);
> +void spr_read_MMCR2_ureg(DisasContext *ctx, int gprn, int sprn);
>  void spr_read_tbl(DisasContext *ctx, int gprn, int sprn);
>  void spr_read_tbu(DisasContext *ctx, int gprn, int sprn);
>  void spr_read_atbl(DisasContext *ctx, int gprn, int sprn);
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 3a1eafbba8..ec4160378d 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -520,6 +520,43 @@ void spr_read_ureg(DisasContext *ctx, int gprn, int =
sprn)
>      gen_load_spr(cpu_gpr[gprn], sprn + 0x10);
>  }
> =20
> +void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn)
> +{
> +    TCGv t0 =3D tcg_temp_new();
> +
> +    /*
> +     * Filter out all bits but FC, PMAO, and PMAE, according
> +     * to ISA v3.1, in 10.4.4 Monitor Mode Control Register 0,
> +     * fourth paragraph.
> +     */
> +    gen_load_spr(t0, SPR_POWER_MMCR0);
> +    tcg_gen_andi_tl(t0, t0, MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE);

I think #defining this mask somewhere would be worthwhile.

> +    tcg_gen_mov_tl(cpu_gpr[gprn], t0);
> +
> +    tcg_temp_free(t0);
> +}
> +
> +void spr_read_MMCR2_ureg(DisasContext *ctx, int gprn, int sprn)
> +{
> +    TCGv t0 =3D tcg_temp_new();
> +
> +    /*
> +     * On read, filter out all bits that are not FCnP0 bits.
> +     * When MMCR0[PMCC] is set to 0b10 or 0b11, providing
> +     * problem state programs read/write access to MMCR2,
> +     * only the FCnP0 bits can be accessed. All other bits are
> +     * not changed when mtspr is executed in problem state, and
> +     * all other bits return 0s when mfspr is executed in problem
> +     * state, according to ISA v3.1, section 10.4.6 Monitor Mode
> +     * Control Register 2, p. 1316, third paragraph.
> +     */
> +    gen_load_spr(t0, SPR_POWER_MMCR2);
> +    tcg_gen_andi_tl(t0, t0, 0x4020100804020000UL);

Even more so here, where it's a big bare literal.

> +    tcg_gen_mov_tl(cpu_gpr[gprn], t0);
> +
> +    tcg_temp_free(t0);
> +}
> +
>  #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
>  void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)
>  {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--MkmIZfuHR/BOP5Ox
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmElx1MACgkQbDjKyiDZ
s5J4vQ//WQjTgDc5kSTvkb5Wq2S3GJi6Nknhy0VuQGmrbqGGa1cUwDAEm+XkQcpy
Bjtn7b1Hx+1KvvOuRCrs2QkpxHtYA7XLKxS5mHNMrdH3O+cEk1buo/df5ggzdS9m
utZH53i/yD7N6fP9xRWB838QLbTvLaYxyPKFCP9+6an9N+0/4DE+TBRt34Vfssvj
HynAB1O3Ywgwwhw4cbEHqo0K35G7HiYRe/e6A/+2Cwp04tD8oU2rM+jPB+l0fV8j
OJ4vDgpx3PHl3/K1Pi/RMcLBGBlNyl6/heMHtHzIM3n/wMRs5pI0PBeO8+zxYaiq
amejmLM7K2roQMsAaqzw/Bn3kwukw7+io1fbNgfQixj+lgAYRQPyvyXfO8JWZP9b
248prBH4akxiXlUXHu2R0a9jSgd7VmUNb/V+zhw37+u/gbTXjFu8NVukWYhnXQKD
DWVS7GRdM2e6R51Y5llW1AxdMx32IvbcfZe4dokptQXkX1URwCcHgO6ZHrqBnqBr
4Yb00AVV/u0B9SnhMRT6nNJ+BeAk2CzttyYcVEWVylxu8DFCwVRE+FICKkS99TNS
JxTp6F4xOMecrCD5spxfq8o46L0FKVt1lagdoj74x6/XF1sHBrlivdauHQ3UXGM/
8YxMwUovip6MiCBzpCvd7AekrMYje2Ae5CBZKCrS0NLvpifYnz4=
=2SAi
-----END PGP SIGNATURE-----

--MkmIZfuHR/BOP5Ox--

