Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C783A371114
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 06:59:11 +0200 (CEST)
Received: from localhost ([::1]:51068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldQfm-0006Wl-Ry
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 00:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldQbj-0001SE-IL; Mon, 03 May 2021 00:54:59 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:49503 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldQbd-00080P-4X; Mon, 03 May 2021 00:54:59 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FYVyJ4RYyz9sW6; Mon,  3 May 2021 14:54:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620017688;
 bh=qbongHlrlwd9f4gkgAgi0Fr/T9Eb8nco1un4oE8hI88=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Eu8MHhdFwF9JJ3IC2BZJEXThTBFEOzD6ixxFgDCYi4NcT7MEtb4u1afI39vwb43lm
 eQXqtZpmarTdz94ywYezWXsKeGShPuEtZlp5aAHk/rxZQ9iFJAHMpgWmI6DFjZiq3N
 sB0RXMNK379plo9RYufdzBkpKXt5CHNdkqlSwyKc=
Date: Mon, 3 May 2021 14:49:32 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v3 6/7] target/ppc: renamed SPR registration functions
Message-ID: <YI+A3I5+viHa9X1Z@yekko>
References: <20210430193533.82136-1-bruno.larsen@eldorado.org.br>
 <20210430193533.82136-7-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+Pjtyfvb3Vt2v1vI"
Content-Disposition: inline
In-Reply-To: <20210430193533.82136-7-bruno.larsen@eldorado.org.br>
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+Pjtyfvb3Vt2v1vI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2021 at 04:35:32PM -0300, Bruno Larsen (billionai) wrote:
> Renamed all gen_spr_* and gen_* functions specifically related to
> registering SPRs to register_*_sprs and register_*, to avoid future
> confusion with other TCG related code.
>=20
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

This one also makes sense to be regardless of the rest.  Can you move
this before the creation of spr_tcg.inc.c, so we can get it merged.

> ---
>  target/ppc/translate_init.c.inc | 860 ++++++++++++++++----------------
>  1 file changed, 430 insertions(+), 430 deletions(-)
>=20
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.=
c.inc
> index b922b04f25..274bd884a1 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/translate_init.c.inc
> @@ -168,7 +168,7 @@ static inline void _spr_register(CPUPPCState *env, in=
t num,
>  }
> =20
>  /* Generic PowerPC SPRs */
> -static void gen_spr_generic(CPUPPCState *env)
> +static void register_generic_sprs(CPUPPCState *env)
>  {
>      /* Integer processing */
>      spr_register(env, SPR_XER, "XER",
> @@ -213,7 +213,7 @@ static void gen_spr_generic(CPUPPCState *env)
>  }
> =20
>  /* SPR common to all non-embedded PowerPC, including 601 */
> -static void gen_spr_ne_601(CPUPPCState *env)
> +static void register_ne_601_sprs(CPUPPCState *env)
>  {
>      /* Exception processing */
>      spr_register_kvm(env, SPR_DSISR, "DSISR",
> @@ -232,7 +232,7 @@ static void gen_spr_ne_601(CPUPPCState *env)
>  }
> =20
>  /* Storage Description Register 1 */
> -static void gen_spr_sdr1(CPUPPCState *env)
> +static void register_sdr1_sprs(CPUPPCState *env)
>  {
>  #ifndef CONFIG_USER_ONLY
>      if (env->has_hv_mode) {
> @@ -255,7 +255,7 @@ static void gen_spr_sdr1(CPUPPCState *env)
>  }
> =20
>  /* BATs 0-3 */
> -static void gen_low_BATs(CPUPPCState *env)
> +static void register_low_BATs(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
>      spr_register(env, SPR_IBAT0U, "IBAT0U",
> @@ -327,7 +327,7 @@ static void gen_low_BATs(CPUPPCState *env)
>  }
> =20
>  /* BATs 4-7 */
> -static void gen_high_BATs(CPUPPCState *env)
> +static void register_high_BATs(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
>      spr_register(env, SPR_IBAT4U, "IBAT4U",
> @@ -399,7 +399,7 @@ static void gen_high_BATs(CPUPPCState *env)
>  }
> =20
>  /* Generic PowerPC time base */
> -static void gen_tbl(CPUPPCState *env)
> +static void register_tbl(CPUPPCState *env)
>  {
>      spr_register(env, SPR_VTBL,  "TBL",
>                   &spr_read_tbl, SPR_NOACCESS,
> @@ -420,7 +420,7 @@ static void gen_tbl(CPUPPCState *env)
>  }
> =20
>  /* Softare table search registers */
> -static void gen_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_w=
ays)
> +static void register_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int=
 nb_ways)
>  {
>  #if !defined(CONFIG_USER_ONLY)
>      env->nb_tlb =3D nb_tlbs;
> @@ -459,7 +459,7 @@ static void gen_6xx_7xx_soft_tlb(CPUPPCState *env, in=
t nb_tlbs, int nb_ways)
>  }
> =20
>  /* SPR common to MPC755 and G2 */
> -static void gen_spr_G2_755(CPUPPCState *env)
> +static void register_G2_755_sprs(CPUPPCState *env)
>  {
>      /* SGPRs */
>      spr_register(env, SPR_SPRG4, "SPRG4",
> @@ -481,7 +481,7 @@ static void gen_spr_G2_755(CPUPPCState *env)
>  }
> =20
>  /* SPR common to all 7xx PowerPC implementations */
> -static void gen_spr_7xx(CPUPPCState *env)
> +static void register_7xx_sprs(CPUPPCState *env)
>  {
>      /* Breakpoints */
>      /* XXX : not implemented */
> @@ -581,7 +581,7 @@ static void gen_spr_7xx(CPUPPCState *env)
> =20
>  #ifdef TARGET_PPC64
> =20
> -static void gen_spr_amr(CPUPPCState *env)
> +static void register_amr_sprs(CPUPPCState *env)
>  {
>  #ifndef CONFIG_USER_ONLY
>      /*
> @@ -613,7 +613,7 @@ static void gen_spr_amr(CPUPPCState *env)
>  #endif /* !CONFIG_USER_ONLY */
>  }
> =20
> -static void gen_spr_iamr(CPUPPCState *env)
> +static void register_iamr_sprs(CPUPPCState *env)
>  {
>  #ifndef CONFIG_USER_ONLY
>      spr_register_kvm_hv(env, SPR_IAMR, "IAMR",
> @@ -625,7 +625,7 @@ static void gen_spr_iamr(CPUPPCState *env)
>  }
>  #endif /* TARGET_PPC64 */
> =20
> -static void gen_spr_thrm(CPUPPCState *env)
> +static void register_thrm_sprs(CPUPPCState *env)
>  {
>      /* Thermal management */
>      /* XXX : not implemented */
> @@ -646,7 +646,7 @@ static void gen_spr_thrm(CPUPPCState *env)
>  }
> =20
>  /* SPR specific to PowerPC 604 implementation */
> -static void gen_spr_604(CPUPPCState *env)
> +static void register_604_sprs(CPUPPCState *env)
>  {
>      /* Processor identification */
>      spr_register(env, SPR_PIR, "PIR",
> @@ -699,7 +699,7 @@ static void gen_spr_604(CPUPPCState *env)
>  }
> =20
>  /* SPR specific to PowerPC 603 implementation */
> -static void gen_spr_603(CPUPPCState *env)
> +static void register_603_sprs(CPUPPCState *env)
>  {
>      /* External access control */
>      /* XXX : not implemented */
> @@ -717,7 +717,7 @@ static void gen_spr_603(CPUPPCState *env)
>  }
> =20
>  /* SPR specific to PowerPC G2 implementation */
> -static void gen_spr_G2(CPUPPCState *env)
> +static void register_G2_sprs(CPUPPCState *env)
>  {
>      /* Memory base address */
>      /* MBAR */
> @@ -769,7 +769,7 @@ static void gen_spr_G2(CPUPPCState *env)
>  }
> =20
>  /* SPR specific to PowerPC 602 implementation */
> -static void gen_spr_602(CPUPPCState *env)
> +static void register_602_sprs(CPUPPCState *env)
>  {
>      /* ESA registers */
>      /* XXX : not implemented */
> @@ -817,7 +817,7 @@ static void gen_spr_602(CPUPPCState *env)
>  }
> =20
>  /* SPR specific to PowerPC 601 implementation */
> -static void gen_spr_601(CPUPPCState *env)
> +static void register_601_sprs(CPUPPCState *env)
>  {
>      /* Multiplication/division register */
>      /* MQ */
> @@ -893,7 +893,7 @@ static void gen_spr_601(CPUPPCState *env)
>  #endif
>  }
> =20
> -static void gen_spr_74xx(CPUPPCState *env)
> +static void register_74xx_sprs(CPUPPCState *env)
>  {
>      /* Processor identification */
>      spr_register(env, SPR_PIR, "PIR",
> @@ -943,7 +943,7 @@ static void gen_spr_74xx(CPUPPCState *env)
>                   0x00000000);
>  }
> =20
> -static void gen_l3_ctrl(CPUPPCState *env)
> +static void register_l3_ctrl(CPUPPCState *env)
>  {
>      /* L3CR */
>      /* XXX : not implemented */
> @@ -965,7 +965,7 @@ static void gen_l3_ctrl(CPUPPCState *env)
>                   0x00000000);
>  }
> =20
> -static void gen_74xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways)
> +static void register_74xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb=
_ways)
>  {
>  #if !defined(CONFIG_USER_ONLY)
>      env->nb_tlb =3D nb_tlbs;
> @@ -990,7 +990,7 @@ static void gen_74xx_soft_tlb(CPUPPCState *env, int n=
b_tlbs, int nb_ways)
>  #endif
>  }
> =20
> -static void gen_spr_usprg3(CPUPPCState *env)
> +static void register_usprg3_sprs(CPUPPCState *env)
>  {
>      spr_register(env, SPR_USPRG3, "USPRG3",
>                   &spr_read_ureg, SPR_NOACCESS,
> @@ -998,7 +998,7 @@ static void gen_spr_usprg3(CPUPPCState *env)
>                   0x00000000);
>  }
> =20
> -static void gen_spr_usprgh(CPUPPCState *env)
> +static void register_usprgh_sprs(CPUPPCState *env)
>  {
>      spr_register(env, SPR_USPRG4, "USPRG4",
>                   &spr_read_ureg, SPR_NOACCESS,
> @@ -1019,7 +1019,7 @@ static void gen_spr_usprgh(CPUPPCState *env)
>  }
> =20
>  /* PowerPC BookE SPR */
> -static void gen_spr_BookE(CPUPPCState *env, uint64_t ivor_mask)
> +static void register_BookE_sprs(CPUPPCState *env, uint64_t ivor_mask)
>  {
>      const char *ivor_names[64] =3D {
>          "IVOR0",  "IVOR1",  "IVOR2",  "IVOR3",
> @@ -1195,7 +1195,7 @@ static void gen_spr_BookE(CPUPPCState *env, uint64_=
t ivor_mask)
>                   0x00000000);
>  }
> =20
> -static inline uint32_t gen_tlbncfg(uint32_t assoc, uint32_t minsize,
> +static inline uint32_t register_tlbncfg(uint32_t assoc, uint32_t minsize,
>                                     uint32_t maxsize, uint32_t flags,
>                                     uint32_t nentries)
>  {
> @@ -1206,7 +1206,7 @@ static inline uint32_t gen_tlbncfg(uint32_t assoc, =
uint32_t minsize,
>  }
> =20
>  /* BookE 2.06 storage control registers */
> -static void gen_spr_BookE206(CPUPPCState *env, uint32_t mas_mask,
> +static void register_BookE206_sprs(CPUPPCState *env, uint32_t mas_mask,
>                               uint32_t *tlbncfg, uint32_t mmucfg)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> @@ -1294,11 +1294,11 @@ static void gen_spr_BookE206(CPUPPCState *env, ui=
nt32_t mas_mask,
>      }
>  #endif
> =20
> -    gen_spr_usprgh(env);
> +    register_usprgh_sprs(env);
>  }
> =20
>  /* SPR specific to PowerPC 440 implementation */
> -static void gen_spr_440(CPUPPCState *env)
> +static void register_440_sprs(CPUPPCState *env)
>  {
>      /* Cache control */
>      /* XXX : not implemented */
> @@ -1439,7 +1439,7 @@ static void gen_spr_440(CPUPPCState *env)
>  }
> =20
>  /* SPR shared between PowerPC 40x implementations */
> -static void gen_spr_40x(CPUPPCState *env)
> +static void register_40x_sprs(CPUPPCState *env)
>  {
>      /* Cache */
>      /* not emulated, as QEMU do not emulate caches */
> @@ -1494,7 +1494,7 @@ static void gen_spr_40x(CPUPPCState *env)
>  }
> =20
>  /* SPR specific to PowerPC 405 implementation */
> -static void gen_spr_405(CPUPPCState *env)
> +static void register_405_sprs(CPUPPCState *env)
>  {
>      /* MMU */
>      spr_register(env, SPR_40x_PID, "PID",
> @@ -1596,11 +1596,11 @@ static void gen_spr_405(CPUPPCState *env)
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   spr_read_generic, &spr_write_generic,
>                   0x00000000);
> -    gen_spr_usprgh(env);
> +    register_usprgh_sprs(env);
>  }
> =20
>  /* SPR shared between PowerPC 401 & 403 implementations */
> -static void gen_spr_401_403(CPUPPCState *env)
> +static void register_401_403_sprs(CPUPPCState *env)
>  {
>      /* Time base */
>      spr_register(env, SPR_403_VTBL,  "TBL",
> @@ -1628,7 +1628,7 @@ static void gen_spr_401_403(CPUPPCState *env)
>  }
> =20
>  /* SPR specific to PowerPC 401 implementation */
> -static void gen_spr_401(CPUPPCState *env)
> +static void register_401_sprs(CPUPPCState *env)
>  {
>      /* Debug interface */
>      /* XXX : not implemented */
> @@ -1670,9 +1670,9 @@ static void gen_spr_401(CPUPPCState *env)
>                   0x00000000);
>  }
> =20
> -static void gen_spr_401x2(CPUPPCState *env)
> +static void register_401x2_sprs(CPUPPCState *env)
>  {
> -    gen_spr_401(env);
> +    register_401_sprs(env);
>      spr_register(env, SPR_40x_PID, "PID",
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   &spr_read_generic, &spr_write_generic,
> @@ -1684,7 +1684,7 @@ static void gen_spr_401x2(CPUPPCState *env)
>  }
> =20
>  /* SPR specific to PowerPC 403 implementation */
> -static void gen_spr_403(CPUPPCState *env)
> +static void register_403_sprs(CPUPPCState *env)
>  {
>      /* Debug interface */
>      /* XXX : not implemented */
> @@ -1720,7 +1720,7 @@ static void gen_spr_403(CPUPPCState *env)
>                   0x00000000);
>  }
> =20
> -static void gen_spr_403_real(CPUPPCState *env)
> +static void register_403_real_sprs(CPUPPCState *env)
>  {
>      spr_register(env, SPR_403_PBL1,  "PBL1",
>                   SPR_NOACCESS, SPR_NOACCESS,
> @@ -1740,7 +1740,7 @@ static void gen_spr_403_real(CPUPPCState *env)
>                   0x00000000);
>  }
> =20
> -static void gen_spr_403_mmu(CPUPPCState *env)
> +static void register_403_mmu_sprs(CPUPPCState *env)
>  {
>      /* MMU */
>      spr_register(env, SPR_40x_PID, "PID",
> @@ -1754,7 +1754,7 @@ static void gen_spr_403_mmu(CPUPPCState *env)
>  }
> =20
>  /* SPR specific to PowerPC compression coprocessor extension */
> -static void gen_spr_compress(CPUPPCState *env)
> +static void register_compress_sprs(CPUPPCState *env)
>  {
>      /* XXX : not implemented */
>      spr_register(env, SPR_401_SKR, "SKR",
> @@ -1763,7 +1763,7 @@ static void gen_spr_compress(CPUPPCState *env)
>                   0x00000000);
>  }
> =20
> -static void gen_spr_5xx_8xx(CPUPPCState *env)
> +static void register_5xx_8xx_sprs(CPUPPCState *env)
>  {
>      /* Exception processing */
>      spr_register_kvm(env, SPR_DSISR, "DSISR",
> @@ -1881,7 +1881,7 @@ static void gen_spr_5xx_8xx(CPUPPCState *env)
>                   0x00000000);
>  }
> =20
> -static void gen_spr_5xx(CPUPPCState *env)
> +static void register_5xx_sprs(CPUPPCState *env)
>  {
>      /* XXX : not implemented */
>      spr_register(env, SPR_RCPU_MI_GRA, "MI_GRA",
> @@ -1990,7 +1990,7 @@ static void gen_spr_5xx(CPUPPCState *env)
>                   0x00000000);
>  }
> =20
> -static void gen_spr_8xx(CPUPPCState *env)
> +static void register_8xx_sprs(CPUPPCState *env)
>  {
>      /* XXX : not implemented */
>      spr_register(env, SPR_MPC_IC_CST, "IC_CST",
> @@ -2725,9 +2725,9 @@ static bool ppc_cpu_interrupts_big_endian_lpcr(Powe=
rPCCPU *cpu)
> =20
>  static void init_proc_401(CPUPPCState *env)
>  {
> -    gen_spr_40x(env);
> -    gen_spr_401_403(env);
> -    gen_spr_401(env);
> +    register_40x_sprs(env);
> +    register_401_403_sprs(env);
> +    register_401_sprs(env);
>      init_excp_4xx_real(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -2771,10 +2771,10 @@ POWERPC_FAMILY(401)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_401x2(CPUPPCState *env)
>  {
> -    gen_spr_40x(env);
> -    gen_spr_401_403(env);
> -    gen_spr_401x2(env);
> -    gen_spr_compress(env);
> +    register_40x_sprs(env);
> +    register_401_403_sprs(env);
> +    register_401x2_sprs(env);
> +    register_compress_sprs(env);
>      /* Memory management */
>  #if !defined(CONFIG_USER_ONLY)
>      env->nb_tlb =3D 64;
> @@ -2829,11 +2829,11 @@ POWERPC_FAMILY(401x2)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_401x3(CPUPPCState *env)
>  {
> -    gen_spr_40x(env);
> -    gen_spr_401_403(env);
> -    gen_spr_401(env);
> -    gen_spr_401x2(env);
> -    gen_spr_compress(env);
> +    register_40x_sprs(env);
> +    register_401_403_sprs(env);
> +    register_401_sprs(env);
> +    register_401x2_sprs(env);
> +    register_compress_sprs(env);
>      init_excp_4xx_softmmu(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -2882,10 +2882,10 @@ POWERPC_FAMILY(401x3)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_IOP480(CPUPPCState *env)
>  {
> -    gen_spr_40x(env);
> -    gen_spr_401_403(env);
> -    gen_spr_401x2(env);
> -    gen_spr_compress(env);
> +    register_40x_sprs(env);
> +    register_401_403_sprs(env);
> +    register_401x2_sprs(env);
> +    register_compress_sprs(env);
>      /* Memory management */
>  #if !defined(CONFIG_USER_ONLY)
>      env->nb_tlb =3D 64;
> @@ -2940,10 +2940,10 @@ POWERPC_FAMILY(IOP480)(ObjectClass *oc, void *dat=
a)
> =20
>  static void init_proc_403(CPUPPCState *env)
>  {
> -    gen_spr_40x(env);
> -    gen_spr_401_403(env);
> -    gen_spr_403(env);
> -    gen_spr_403_real(env);
> +    register_40x_sprs(env);
> +    register_401_403_sprs(env);
> +    register_403_sprs(env);
> +    register_403_real_sprs(env);
>      init_excp_4xx_real(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -2987,11 +2987,11 @@ POWERPC_FAMILY(403)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_403GCX(CPUPPCState *env)
>  {
> -    gen_spr_40x(env);
> -    gen_spr_401_403(env);
> -    gen_spr_403(env);
> -    gen_spr_403_real(env);
> -    gen_spr_403_mmu(env);
> +    register_40x_sprs(env);
> +    register_401_403_sprs(env);
> +    register_403_sprs(env);
> +    register_403_real_sprs(env);
> +    register_403_mmu_sprs(env);
>      /* Bus access control */
>      /* not emulated, as QEMU never does speculative access */
>      spr_register(env, SPR_40x_SGR, "SGR",
> @@ -3055,9 +3055,9 @@ POWERPC_FAMILY(403GCX)(ObjectClass *oc, void *data)
>  static void init_proc_405(CPUPPCState *env)
>  {
>      /* Time base */
> -    gen_tbl(env);
> -    gen_spr_40x(env);
> -    gen_spr_405(env);
> +    register_tbl(env);
> +    register_40x_sprs(env);
> +    register_405_sprs(env);
>      /* Bus access control */
>      /* not emulated, as QEMU never does speculative access */
>      spr_register(env, SPR_40x_SGR, "SGR",
> @@ -3121,10 +3121,10 @@ POWERPC_FAMILY(405)(ObjectClass *oc, void *data)
>  static void init_proc_440EP(CPUPPCState *env)
>  {
>      /* Time base */
> -    gen_tbl(env);
> -    gen_spr_BookE(env, 0x000000000000FFFFULL);
> -    gen_spr_440(env);
> -    gen_spr_usprgh(env);
> +    register_tbl(env);
> +    register_BookE_sprs(env, 0x000000000000FFFFULL);
> +    register_440_sprs(env);
> +    register_usprgh_sprs(env);
>      /* Processor identification */
>      spr_register(env, SPR_BOOKE_PIR, "PIR",
>                   SPR_NOACCESS, SPR_NOACCESS,
> @@ -3263,10 +3263,10 @@ POWERPC_FAMILY(460EX)(ObjectClass *oc, void *data)
>  static void init_proc_440GP(CPUPPCState *env)
>  {
>      /* Time base */
> -    gen_tbl(env);
> -    gen_spr_BookE(env, 0x000000000000FFFFULL);
> -    gen_spr_440(env);
> -    gen_spr_usprgh(env);
> +    register_tbl(env);
> +    register_BookE_sprs(env, 0x000000000000FFFFULL);
> +    register_440_sprs(env);
> +    register_usprgh_sprs(env);
>      /* Processor identification */
>      spr_register(env, SPR_BOOKE_PIR, "PIR",
>                   SPR_NOACCESS, SPR_NOACCESS,
> @@ -3346,10 +3346,10 @@ POWERPC_FAMILY(440GP)(ObjectClass *oc, void *data)
>  static void init_proc_440x4(CPUPPCState *env)
>  {
>      /* Time base */
> -    gen_tbl(env);
> -    gen_spr_BookE(env, 0x000000000000FFFFULL);
> -    gen_spr_440(env);
> -    gen_spr_usprgh(env);
> +    register_tbl(env);
> +    register_BookE_sprs(env, 0x000000000000FFFFULL);
> +    register_440_sprs(env);
> +    register_usprgh_sprs(env);
>      /* Processor identification */
>      spr_register(env, SPR_BOOKE_PIR, "PIR",
>                   SPR_NOACCESS, SPR_NOACCESS,
> @@ -3429,10 +3429,10 @@ POWERPC_FAMILY(440x4)(ObjectClass *oc, void *data)
>  static void init_proc_440x5(CPUPPCState *env)
>  {
>      /* Time base */
> -    gen_tbl(env);
> -    gen_spr_BookE(env, 0x000000000000FFFFULL);
> -    gen_spr_440(env);
> -    gen_spr_usprgh(env);
> +    register_tbl(env);
> +    register_BookE_sprs(env, 0x000000000000FFFFULL);
> +    register_440_sprs(env);
> +    register_usprgh_sprs(env);
>      /* Processor identification */
>      spr_register(env, SPR_BOOKE_PIR, "PIR",
>                   SPR_NOACCESS, SPR_NOACCESS,
> @@ -3568,9 +3568,9 @@ POWERPC_FAMILY(440x5wDFPU)(ObjectClass *oc, void *d=
ata)
>  static void init_proc_MPC5xx(CPUPPCState *env)
>  {
>      /* Time base */
> -    gen_tbl(env);
> -    gen_spr_5xx_8xx(env);
> -    gen_spr_5xx(env);
> +    register_tbl(env);
> +    register_5xx_8xx_sprs(env);
> +    register_5xx_sprs(env);
>      init_excp_MPC5xx(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -3612,9 +3612,9 @@ POWERPC_FAMILY(MPC5xx)(ObjectClass *oc, void *data)
>  static void init_proc_MPC8xx(CPUPPCState *env)
>  {
>      /* Time base */
> -    gen_tbl(env);
> -    gen_spr_5xx_8xx(env);
> -    gen_spr_8xx(env);
> +    register_tbl(env);
> +    register_5xx_8xx_sprs(env);
> +    register_8xx_sprs(env);
>      init_excp_MPC8xx(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -3656,12 +3656,12 @@ POWERPC_FAMILY(MPC8xx)(ObjectClass *oc, void *dat=
a)
> =20
>  static void init_proc_G2(CPUPPCState *env)
>  {
> -    gen_spr_ne_601(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_G2_755(env);
> -    gen_spr_G2(env);
> +    register_ne_601_sprs(env);
> +    register_sdr1_sprs(env);
> +    register_G2_755_sprs(env);
> +    register_G2_sprs(env);
>      /* Time base */
> -    gen_tbl(env);
> +    register_tbl(env);
>      /* External access control */
>      /* XXX : not implemented */
>      spr_register(env, SPR_EAR, "EAR",
> @@ -3685,9 +3685,9 @@ static void init_proc_G2(CPUPPCState *env)
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
>      /* Memory management */
> -    gen_low_BATs(env);
> -    gen_high_BATs(env);
> -    gen_6xx_7xx_soft_tlb(env, 64, 2);
> +    register_low_BATs(env);
> +    register_high_BATs(env);
> +    register_6xx_7xx_soft_tlb(env, 64, 2);
>      init_excp_G2(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -3735,12 +3735,12 @@ POWERPC_FAMILY(G2)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_G2LE(CPUPPCState *env)
>  {
> -    gen_spr_ne_601(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_G2_755(env);
> -    gen_spr_G2(env);
> +    register_ne_601_sprs(env);
> +    register_sdr1_sprs(env);
> +    register_G2_755_sprs(env);
> +    register_G2_sprs(env);
>      /* Time base */
> -    gen_tbl(env);
> +    register_tbl(env);
>      /* External access control */
>      /* XXX : not implemented */
>      spr_register(env, SPR_EAR, "EAR",
> @@ -3765,9 +3765,9 @@ static void init_proc_G2LE(CPUPPCState *env)
>                   0x00000000);
> =20
>      /* Memory management */
> -    gen_low_BATs(env);
> -    gen_high_BATs(env);
> -    gen_6xx_7xx_soft_tlb(env, 64, 2);
> +    register_low_BATs(env);
> +    register_high_BATs(env);
> +    register_6xx_7xx_soft_tlb(env, 64, 2);
>      init_excp_G2(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -3818,15 +3818,15 @@ POWERPC_FAMILY(G2LE)(ObjectClass *oc, void *data)
>  static void init_proc_e200(CPUPPCState *env)
>  {
>      /* Time base */
> -    gen_tbl(env);
> -    gen_spr_BookE(env, 0x000000070000FFFFULL);
> +    register_tbl(env);
> +    register_BookE_sprs(env, 0x000000070000FFFFULL);
>      /* XXX : not implemented */
>      spr_register(env, SPR_BOOKE_SPEFSCR, "SPEFSCR",
>                   &spr_read_spefscr, &spr_write_spefscr,
>                   &spr_read_spefscr, &spr_write_spefscr,
>                   0x00000000);
>      /* Memory management */
> -    gen_spr_BookE206(env, 0x0000005D, NULL, 0);
> +    register_BookE206_sprs(env, 0x0000005D, NULL, 0);
>      /* XXX : not implemented */
>      spr_register(env, SPR_HID0, "HID0",
>                   SPR_NOACCESS, SPR_NOACCESS,
> @@ -3972,11 +3972,11 @@ POWERPC_FAMILY(e200)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_e300(CPUPPCState *env)
>  {
> -    gen_spr_ne_601(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_603(env);
> +    register_ne_601_sprs(env);
> +    register_sdr1_sprs(env);
> +    register_603_sprs(env);
>      /* Time base */
> -    gen_tbl(env);
> +    register_tbl(env);
>      /* hardware implementation registers */
>      /* XXX : not implemented */
>      spr_register(env, SPR_HID0, "HID0",
> @@ -4020,9 +4020,9 @@ static void init_proc_e300(CPUPPCState *env)
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
>      /* Memory management */
> -    gen_low_BATs(env);
> -    gen_high_BATs(env);
> -    gen_6xx_7xx_soft_tlb(env, 64, 2);
> +    register_low_BATs(env);
> +    register_high_BATs(env);
> +    register_6xx_7xx_soft_tlb(env, 64, 2);
>      init_excp_603(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -4093,11 +4093,11 @@ static void init_proc_e500(CPUPPCState *env, int =
version)
>  #endif
> =20
>      /* Time base */
> -    gen_tbl(env);
> +    register_tbl(env);
>      /*
>       * XXX The e500 doesn't implement IVOR7 and IVOR9, but doesn't
>       *     complain when accessing them.
> -     * gen_spr_BookE(env, 0x0000000F0000FD7FULL);
> +     * register_BookE_sprs(env, 0x0000000F0000FD7FULL);
>       */
>      switch (version) {
>      case fsl_e500v1:
> @@ -4113,8 +4113,8 @@ static void init_proc_e500(CPUPPCState *env, int ve=
rsion)
>          ivor_mask =3D 0x000003FF0000FFFFULL;
>          break;
>      }
> -    gen_spr_BookE(env, ivor_mask);
> -    gen_spr_usprg3(env);
> +    register_BookE_sprs(env, ivor_mask);
> +    register_usprg3_sprs(env);
>      /* Processor identification */
>      spr_register(env, SPR_BOOKE_PIR, "PIR",
>                   SPR_NOACCESS, SPR_NOACCESS,
> @@ -4132,17 +4132,17 @@ static void init_proc_e500(CPUPPCState *env, int =
version)
>      env->id_tlbs =3D 0;
>      switch (version) {
>      case fsl_e500v1:
> -        tlbncfg[0] =3D gen_tlbncfg(2, 1, 1, 0, 256);
> -        tlbncfg[1] =3D gen_tlbncfg(16, 1, 9, TLBnCFG_AVAIL | TLBnCFG_IPR=
OT, 16);
> +        tlbncfg[0] =3D register_tlbncfg(2, 1, 1, 0, 256);
> +        tlbncfg[1] =3D register_tlbncfg(16, 1, 9, TLBnCFG_AVAIL | TLBnCF=
G_IPROT, 16);
>          break;
>      case fsl_e500v2:
> -        tlbncfg[0] =3D gen_tlbncfg(4, 1, 1, 0, 512);
> -        tlbncfg[1] =3D gen_tlbncfg(16, 1, 12, TLBnCFG_AVAIL | TLBnCFG_IP=
ROT, 16);
> +        tlbncfg[0] =3D register_tlbncfg(4, 1, 1, 0, 512);
> +        tlbncfg[1] =3D register_tlbncfg(16, 1, 12, TLBnCFG_AVAIL | TLBnC=
FG_IPROT, 16);
>          break;
>      case fsl_e500mc:
>      case fsl_e5500:
> -        tlbncfg[0] =3D gen_tlbncfg(4, 1, 1, 0, 512);
> -        tlbncfg[1] =3D gen_tlbncfg(64, 1, 12, TLBnCFG_AVAIL | TLBnCFG_IP=
ROT, 64);
> +        tlbncfg[0] =3D register_tlbncfg(4, 1, 1, 0, 512);
> +        tlbncfg[1] =3D register_tlbncfg(64, 1, 12, TLBnCFG_AVAIL | TLBnC=
FG_IPROT, 64);
>          break;
>      case fsl_e6500:
>          mmucfg =3D 0x6510B45;
> @@ -4179,7 +4179,7 @@ static void init_proc_e500(CPUPPCState *env, int ve=
rsion)
>          cpu_abort(env_cpu(env), "Unknown CPU: " TARGET_FMT_lx "\n",
>                    env->spr[SPR_PVR]);
>      }
> -    gen_spr_BookE206(env, 0x000000DF, tlbncfg, mmucfg);
> +    register_BookE206_sprs(env, 0x000000DF, tlbncfg, mmucfg);
>      /* XXX : not implemented */
>      spr_register(env, SPR_HID0, "HID0",
>                   SPR_NOACCESS, SPR_NOACCESS,
> @@ -4537,9 +4537,9 @@ POWERPC_FAMILY(e6500)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_601(CPUPPCState *env)
>  {
> -    gen_spr_ne_601(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_601(env);
> +    register_ne_601_sprs(env);
> +    register_sdr1_sprs(env);
> +    register_601_sprs(env);
>      /* Hardware implementation registers */
>      /* XXX : not implemented */
>      spr_register(env, SPR_HID0, "HID0",
> @@ -4653,11 +4653,11 @@ POWERPC_FAMILY(601v)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_602(CPUPPCState *env)
>  {
> -    gen_spr_ne_601(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_602(env);
> +    register_ne_601_sprs(env);
> +    register_sdr1_sprs(env);
> +    register_602_sprs(env);
>      /* Time base */
> -    gen_tbl(env);
> +    register_tbl(env);
>      /* hardware implementation registers */
>      /* XXX : not implemented */
>      spr_register(env, SPR_HID0, "HID0",
> @@ -4670,8 +4670,8 @@ static void init_proc_602(CPUPPCState *env)
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
>      /* Memory management */
> -    gen_low_BATs(env);
> -    gen_6xx_7xx_soft_tlb(env, 64, 2);
> +    register_low_BATs(env);
> +    register_6xx_7xx_soft_tlb(env, 64, 2);
>      init_excp_602(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -4723,11 +4723,11 @@ POWERPC_FAMILY(602)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_603(CPUPPCState *env)
>  {
> -    gen_spr_ne_601(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_603(env);
> +    register_ne_601_sprs(env);
> +    register_sdr1_sprs(env);
> +    register_603_sprs(env);
>      /* Time base */
> -    gen_tbl(env);
> +    register_tbl(env);
>      /* hardware implementation registers */
>      /* XXX : not implemented */
>      spr_register(env, SPR_HID0, "HID0",
> @@ -4740,8 +4740,8 @@ static void init_proc_603(CPUPPCState *env)
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
>      /* Memory management */
> -    gen_low_BATs(env);
> -    gen_6xx_7xx_soft_tlb(env, 64, 2);
> +    register_low_BATs(env);
> +    register_6xx_7xx_soft_tlb(env, 64, 2);
>      init_excp_603(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -4790,11 +4790,11 @@ POWERPC_FAMILY(603)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_603E(CPUPPCState *env)
>  {
> -    gen_spr_ne_601(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_603(env);
> +    register_ne_601_sprs(env);
> +    register_sdr1_sprs(env);
> +    register_603_sprs(env);
>      /* Time base */
> -    gen_tbl(env);
> +    register_tbl(env);
>      /* hardware implementation registers */
>      /* XXX : not implemented */
>      spr_register(env, SPR_HID0, "HID0",
> @@ -4807,8 +4807,8 @@ static void init_proc_603E(CPUPPCState *env)
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
>      /* Memory management */
> -    gen_low_BATs(env);
> -    gen_6xx_7xx_soft_tlb(env, 64, 2);
> +    register_low_BATs(env);
> +    register_6xx_7xx_soft_tlb(env, 64, 2);
>      init_excp_603(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -4857,11 +4857,11 @@ POWERPC_FAMILY(603E)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_604(CPUPPCState *env)
>  {
> -    gen_spr_ne_601(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_604(env);
> +    register_ne_601_sprs(env);
> +    register_sdr1_sprs(env);
> +    register_604_sprs(env);
>      /* Time base */
> -    gen_tbl(env);
> +    register_tbl(env);
>      /* Hardware implementation registers */
>      /* XXX : not implemented */
>      spr_register(env, SPR_HID0, "HID0",
> @@ -4869,7 +4869,7 @@ static void init_proc_604(CPUPPCState *env)
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
>      /* Memory management */
> -    gen_low_BATs(env);
> +    register_low_BATs(env);
>      init_excp_604(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -4921,9 +4921,9 @@ POWERPC_FAMILY(604)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_604E(CPUPPCState *env)
>  {
> -    gen_spr_ne_601(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_604(env);
> +    register_ne_601_sprs(env);
> +    register_sdr1_sprs(env);
> +    register_604_sprs(env);
>      /* XXX : not implemented */
>      spr_register(env, SPR_7XX_MMCR1, "MMCR1",
>                   SPR_NOACCESS, SPR_NOACCESS,
> @@ -4940,7 +4940,7 @@ static void init_proc_604E(CPUPPCState *env)
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
>      /* Time base */
> -    gen_tbl(env);
> +    register_tbl(env);
>      /* Hardware implementation registers */
>      /* XXX : not implemented */
>      spr_register(env, SPR_HID0, "HID0",
> @@ -4953,7 +4953,7 @@ static void init_proc_604E(CPUPPCState *env)
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
>      /* Memory management */
> -    gen_low_BATs(env);
> +    register_low_BATs(env);
>      init_excp_604(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -5005,13 +5005,13 @@ POWERPC_FAMILY(604E)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_740(CPUPPCState *env)
>  {
> -    gen_spr_ne_601(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_7xx(env);
> +    register_ne_601_sprs(env);
> +    register_sdr1_sprs(env);
> +    register_7xx_sprs(env);
>      /* Time base */
> -    gen_tbl(env);
> +    register_tbl(env);
>      /* Thermal management */
> -    gen_spr_thrm(env);
> +    register_thrm_sprs(env);
>      /* Hardware implementation registers */
>      /* XXX : not implemented */
>      spr_register(env, SPR_HID0, "HID0",
> @@ -5024,7 +5024,7 @@ static void init_proc_740(CPUPPCState *env)
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
>      /* Memory management */
> -    gen_low_BATs(env);
> +    register_low_BATs(env);
>      init_excp_7x0(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -5076,18 +5076,18 @@ POWERPC_FAMILY(740)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_750(CPUPPCState *env)
>  {
> -    gen_spr_ne_601(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_7xx(env);
> +    register_ne_601_sprs(env);
> +    register_sdr1_sprs(env);
> +    register_7xx_sprs(env);
>      /* XXX : not implemented */
>      spr_register(env, SPR_L2CR, "L2CR",
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   &spr_read_generic, spr_access_nop,
>                   0x00000000);
>      /* Time base */
> -    gen_tbl(env);
> +    register_tbl(env);
>      /* Thermal management */
> -    gen_spr_thrm(env);
> +    register_thrm_sprs(env);
>      /* Hardware implementation registers */
>      /* XXX : not implemented */
>      spr_register(env, SPR_HID0, "HID0",
> @@ -5100,7 +5100,7 @@ static void init_proc_750(CPUPPCState *env)
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
>      /* Memory management */
> -    gen_low_BATs(env);
> +    register_low_BATs(env);
>      /*
>       * XXX: high BATs are also present but are known to be bugged on
>       *      die version 1.x
> @@ -5156,16 +5156,16 @@ POWERPC_FAMILY(750)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_750cl(CPUPPCState *env)
>  {
> -    gen_spr_ne_601(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_7xx(env);
> +    register_ne_601_sprs(env);
> +    register_sdr1_sprs(env);
> +    register_7xx_sprs(env);
>      /* XXX : not implemented */
>      spr_register(env, SPR_L2CR, "L2CR",
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   &spr_read_generic, spr_access_nop,
>                   0x00000000);
>      /* Time base */
> -    gen_tbl(env);
> +    register_tbl(env);
>      /* Thermal management */
>      /* Those registers are fake on 750CL */
>      spr_register(env, SPR_THRM1, "THRM1",
> @@ -5266,9 +5266,9 @@ static void init_proc_750cl(CPUPPCState *env)
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
>      /* Memory management */
> -    gen_low_BATs(env);
> +    register_low_BATs(env);
>      /* PowerPC 750cl has 8 DBATs and 8 IBATs */
> -    gen_high_BATs(env);
> +    register_high_BATs(env);
>      init_excp_750cl(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -5359,18 +5359,18 @@ POWERPC_FAMILY(750cl)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_750cx(CPUPPCState *env)
>  {
> -    gen_spr_ne_601(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_7xx(env);
> +    register_ne_601_sprs(env);
> +    register_sdr1_sprs(env);
> +    register_7xx_sprs(env);
>      /* XXX : not implemented */
>      spr_register(env, SPR_L2CR, "L2CR",
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   &spr_read_generic, spr_access_nop,
>                   0x00000000);
>      /* Time base */
> -    gen_tbl(env);
> +    register_tbl(env);
>      /* Thermal management */
> -    gen_spr_thrm(env);
> +    register_thrm_sprs(env);
>      /* This register is not implemented but is present for compatibility=
 */
>      spr_register(env, SPR_SDA, "SDA",
>                   SPR_NOACCESS, SPR_NOACCESS,
> @@ -5388,9 +5388,9 @@ static void init_proc_750cx(CPUPPCState *env)
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
>      /* Memory management */
> -    gen_low_BATs(env);
> +    register_low_BATs(env);
>      /* PowerPC 750cx has 8 DBATs and 8 IBATs */
> -    gen_high_BATs(env);
> +    register_high_BATs(env);
>      init_excp_750cx(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -5442,18 +5442,18 @@ POWERPC_FAMILY(750cx)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_750fx(CPUPPCState *env)
>  {
> -    gen_spr_ne_601(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_7xx(env);
> +    register_ne_601_sprs(env);
> +    register_sdr1_sprs(env);
> +    register_7xx_sprs(env);
>      /* XXX : not implemented */
>      spr_register(env, SPR_L2CR, "L2CR",
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   &spr_read_generic, spr_access_nop,
>                   0x00000000);
>      /* Time base */
> -    gen_tbl(env);
> +    register_tbl(env);
>      /* Thermal management */
> -    gen_spr_thrm(env);
> +    register_thrm_sprs(env);
>      /* XXX : not implemented */
>      spr_register(env, SPR_750_THRM4, "THRM4",
>                   SPR_NOACCESS, SPR_NOACCESS,
> @@ -5476,9 +5476,9 @@ static void init_proc_750fx(CPUPPCState *env)
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
>      /* Memory management */
> -    gen_low_BATs(env);
> +    register_low_BATs(env);
>      /* PowerPC 750fx & 750gx has 8 DBATs and 8 IBATs */
> -    gen_high_BATs(env);
> +    register_high_BATs(env);
>      init_excp_7x0(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -5530,18 +5530,18 @@ POWERPC_FAMILY(750fx)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_750gx(CPUPPCState *env)
>  {
> -    gen_spr_ne_601(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_7xx(env);
> +    register_ne_601_sprs(env);
> +    register_sdr1_sprs(env);
> +    register_7xx_sprs(env);
>      /* XXX : not implemented (XXX: different from 750fx) */
>      spr_register(env, SPR_L2CR, "L2CR",
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   &spr_read_generic, spr_access_nop,
>                   0x00000000);
>      /* Time base */
> -    gen_tbl(env);
> +    register_tbl(env);
>      /* Thermal management */
> -    gen_spr_thrm(env);
> +    register_thrm_sprs(env);
>      /* XXX : not implemented */
>      spr_register(env, SPR_750_THRM4, "THRM4",
>                   SPR_NOACCESS, SPR_NOACCESS,
> @@ -5564,9 +5564,9 @@ static void init_proc_750gx(CPUPPCState *env)
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
>      /* Memory management */
> -    gen_low_BATs(env);
> +    register_low_BATs(env);
>      /* PowerPC 750fx & 750gx has 8 DBATs and 8 IBATs */
> -    gen_high_BATs(env);
> +    register_high_BATs(env);
>      init_excp_7x0(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -5618,14 +5618,14 @@ POWERPC_FAMILY(750gx)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_745(CPUPPCState *env)
>  {
> -    gen_spr_ne_601(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_7xx(env);
> -    gen_spr_G2_755(env);
> +    register_ne_601_sprs(env);
> +    register_sdr1_sprs(env);
> +    register_7xx_sprs(env);
> +    register_G2_755_sprs(env);
>      /* Time base */
> -    gen_tbl(env);
> +    register_tbl(env);
>      /* Thermal management */
> -    gen_spr_thrm(env);
> +    register_thrm_sprs(env);
>      /* Hardware implementation registers */
>      /* XXX : not implemented */
>      spr_register(env, SPR_HID0, "HID0",
> @@ -5643,9 +5643,9 @@ static void init_proc_745(CPUPPCState *env)
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
>      /* Memory management */
> -    gen_low_BATs(env);
> -    gen_high_BATs(env);
> -    gen_6xx_7xx_soft_tlb(env, 64, 2);
> +    register_low_BATs(env);
> +    register_high_BATs(env);
> +    register_6xx_7xx_soft_tlb(env, 64, 2);
>      init_excp_7x5(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -5694,12 +5694,12 @@ POWERPC_FAMILY(745)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_755(CPUPPCState *env)
>  {
> -    gen_spr_ne_601(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_7xx(env);
> -    gen_spr_G2_755(env);
> +    register_ne_601_sprs(env);
> +    register_sdr1_sprs(env);
> +    register_7xx_sprs(env);
> +    register_G2_755_sprs(env);
>      /* Time base */
> -    gen_tbl(env);
> +    register_tbl(env);
>      /* L2 cache control */
>      /* XXX : not implemented */
>      spr_register(env, SPR_L2CR, "L2CR",
> @@ -5712,7 +5712,7 @@ static void init_proc_755(CPUPPCState *env)
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
>      /* Thermal management */
> -    gen_spr_thrm(env);
> +    register_thrm_sprs(env);
>      /* Hardware implementation registers */
>      /* XXX : not implemented */
>      spr_register(env, SPR_HID0, "HID0",
> @@ -5730,9 +5730,9 @@ static void init_proc_755(CPUPPCState *env)
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
>      /* Memory management */
> -    gen_low_BATs(env);
> -    gen_high_BATs(env);
> -    gen_6xx_7xx_soft_tlb(env, 64, 2);
> +    register_low_BATs(env);
> +    register_high_BATs(env);
> +    register_6xx_7xx_soft_tlb(env, 64, 2);
>      init_excp_7x5(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -5781,13 +5781,13 @@ POWERPC_FAMILY(755)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_7400(CPUPPCState *env)
>  {
> -    gen_spr_ne_601(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_7xx(env);
> +    register_ne_601_sprs(env);
> +    register_sdr1_sprs(env);
> +    register_7xx_sprs(env);
>      /* Time base */
> -    gen_tbl(env);
> +    register_tbl(env);
>      /* 74xx specific SPR */
> -    gen_spr_74xx(env);
> +    register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
>      /* XXX : not implemented */
>      spr_register(env, SPR_UBAMR, "UBAMR",
> @@ -5801,9 +5801,9 @@ static void init_proc_7400(CPUPPCState *env)
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
>      /* Thermal management */
> -    gen_spr_thrm(env);
> +    register_thrm_sprs(env);
>      /* Memory management */
> -    gen_low_BATs(env);
> +    register_low_BATs(env);
>      init_excp_7400(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -5861,13 +5861,13 @@ POWERPC_FAMILY(7400)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_7410(CPUPPCState *env)
>  {
> -    gen_spr_ne_601(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_7xx(env);
> +    register_ne_601_sprs(env);
> +    register_sdr1_sprs(env);
> +    register_7xx_sprs(env);
>      /* Time base */
> -    gen_tbl(env);
> +    register_tbl(env);
>      /* 74xx specific SPR */
> -    gen_spr_74xx(env);
> +    register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
>      /* XXX : not implemented */
>      spr_register(env, SPR_UBAMR, "UBAMR",
> @@ -5875,7 +5875,7 @@ static void init_proc_7410(CPUPPCState *env)
>                   &spr_read_ureg, SPR_NOACCESS,
>                   0x00000000);
>      /* Thermal management */
> -    gen_spr_thrm(env);
> +    register_thrm_sprs(env);
>      /* L2PMCR */
>      /* XXX : not implemented */
>      spr_register(env, SPR_L2PMCR, "L2PMCR",
> @@ -5889,7 +5889,7 @@ static void init_proc_7410(CPUPPCState *env)
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
>      /* Memory management */
> -    gen_low_BATs(env);
> +    register_low_BATs(env);
>      init_excp_7400(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -5947,13 +5947,13 @@ POWERPC_FAMILY(7410)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_7440(CPUPPCState *env)
>  {
> -    gen_spr_ne_601(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_7xx(env);
> +    register_ne_601_sprs(env);
> +    register_sdr1_sprs(env);
> +    register_7xx_sprs(env);
>      /* Time base */
> -    gen_tbl(env);
> +    register_tbl(env);
>      /* 74xx specific SPR */
> -    gen_spr_74xx(env);
> +    register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
>      /* XXX : not implemented */
>      spr_register(env, SPR_UBAMR, "UBAMR",
> @@ -6000,8 +6000,8 @@ static void init_proc_7440(CPUPPCState *env)
>                   &spr_read_ureg, SPR_NOACCESS,
>                   0x00000000);
>      /* Memory management */
> -    gen_low_BATs(env);
> -    gen_74xx_soft_tlb(env, 128, 2);
> +    register_low_BATs(env);
> +    register_74xx_soft_tlb(env, 128, 2);
>      init_excp_7450(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -6056,16 +6056,16 @@ POWERPC_FAMILY(7440)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_7450(CPUPPCState *env)
>  {
> -    gen_spr_ne_601(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_7xx(env);
> +    register_ne_601_sprs(env);
> +    register_sdr1_sprs(env);
> +    register_7xx_sprs(env);
>      /* Time base */
> -    gen_tbl(env);
> +    register_tbl(env);
>      /* 74xx specific SPR */
> -    gen_spr_74xx(env);
> +    register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
>      /* Level 3 cache control */
> -    gen_l3_ctrl(env);
> +    register_l3_ctrl(env);
>      /* L3ITCR1 */
>      /* XXX : not implemented */
>      spr_register(env, SPR_L3ITCR1, "L3ITCR1",
> @@ -6135,8 +6135,8 @@ static void init_proc_7450(CPUPPCState *env)
>                   &spr_read_ureg, SPR_NOACCESS,
>                   0x00000000);
>      /* Memory management */
> -    gen_low_BATs(env);
> -    gen_74xx_soft_tlb(env, 128, 2);
> +    register_low_BATs(env);
> +    register_74xx_soft_tlb(env, 128, 2);
>      init_excp_7450(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -6191,13 +6191,13 @@ POWERPC_FAMILY(7450)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_7445(CPUPPCState *env)
>  {
> -    gen_spr_ne_601(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_7xx(env);
> +    register_ne_601_sprs(env);
> +    register_sdr1_sprs(env);
> +    register_7xx_sprs(env);
>      /* Time base */
> -    gen_tbl(env);
> +    register_tbl(env);
>      /* 74xx specific SPR */
> -    gen_spr_74xx(env);
> +    register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
>      /* LDSTCR */
>      /* XXX : not implemented */
> @@ -6272,9 +6272,9 @@ static void init_proc_7445(CPUPPCState *env)
>                   &spr_read_ureg, SPR_NOACCESS,
>                   0x00000000);
>      /* Memory management */
> -    gen_low_BATs(env);
> -    gen_high_BATs(env);
> -    gen_74xx_soft_tlb(env, 128, 2);
> +    register_low_BATs(env);
> +    register_high_BATs(env);
> +    register_74xx_soft_tlb(env, 128, 2);
>      init_excp_7450(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -6329,16 +6329,16 @@ POWERPC_FAMILY(7445)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_7455(CPUPPCState *env)
>  {
> -    gen_spr_ne_601(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_7xx(env);
> +    register_ne_601_sprs(env);
> +    register_sdr1_sprs(env);
> +    register_7xx_sprs(env);
>      /* Time base */
> -    gen_tbl(env);
> +    register_tbl(env);
>      /* 74xx specific SPR */
> -    gen_spr_74xx(env);
> +    register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
>      /* Level 3 cache control */
> -    gen_l3_ctrl(env);
> +    register_l3_ctrl(env);
>      /* LDSTCR */
>      /* XXX : not implemented */
>      spr_register(env, SPR_LDSTCR, "LDSTCR",
> @@ -6412,9 +6412,9 @@ static void init_proc_7455(CPUPPCState *env)
>                   &spr_read_ureg, SPR_NOACCESS,
>                   0x00000000);
>      /* Memory management */
> -    gen_low_BATs(env);
> -    gen_high_BATs(env);
> -    gen_74xx_soft_tlb(env, 128, 2);
> +    register_low_BATs(env);
> +    register_high_BATs(env);
> +    register_74xx_soft_tlb(env, 128, 2);
>      init_excp_7450(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -6469,16 +6469,16 @@ POWERPC_FAMILY(7455)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_7457(CPUPPCState *env)
>  {
> -    gen_spr_ne_601(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_7xx(env);
> +    register_ne_601_sprs(env);
> +    register_sdr1_sprs(env);
> +    register_7xx_sprs(env);
>      /* Time base */
> -    gen_tbl(env);
> +    register_tbl(env);
>      /* 74xx specific SPR */
> -    gen_spr_74xx(env);
> +    register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
>      /* Level 3 cache control */
> -    gen_l3_ctrl(env);
> +    register_l3_ctrl(env);
>      /* L3ITCR1 */
>      /* XXX : not implemented */
>      spr_register(env, SPR_L3ITCR1, "L3ITCR1",
> @@ -6576,9 +6576,9 @@ static void init_proc_7457(CPUPPCState *env)
>                   &spr_read_ureg, SPR_NOACCESS,
>                   0x00000000);
>      /* Memory management */
> -    gen_low_BATs(env);
> -    gen_high_BATs(env);
> -    gen_74xx_soft_tlb(env, 128, 2);
> +    register_low_BATs(env);
> +    register_high_BATs(env);
> +    register_74xx_soft_tlb(env, 128, 2);
>      init_excp_7450(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -6633,13 +6633,13 @@ POWERPC_FAMILY(7457)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_e600(CPUPPCState *env)
>  {
> -    gen_spr_ne_601(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_7xx(env);
> +    register_ne_601_sprs(env);
> +    register_sdr1_sprs(env);
> +    register_7xx_sprs(env);
>      /* Time base */
> -    gen_tbl(env);
> +    register_tbl(env);
>      /* 74xx specific SPR */
> -    gen_spr_74xx(env);
> +    register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
>      /* XXX : not implemented */
>      spr_register(env, SPR_UBAMR, "UBAMR",
> @@ -6715,9 +6715,9 @@ static void init_proc_e600(CPUPPCState *env)
>                   &spr_read_ureg, SPR_NOACCESS,
>                   0x00000000);
>      /* Memory management */
> -    gen_low_BATs(env);
> -    gen_high_BATs(env);
> -    gen_74xx_soft_tlb(env, 128, 2);
> +    register_low_BATs(env);
> +    register_high_BATs(env);
> +    register_74xx_soft_tlb(env, 128, 2);
>      init_excp_7450(env);
>      env->dcache_line_size =3D 32;
>      env->icache_line_size =3D 32;
> @@ -6790,7 +6790,7 @@ static int check_pow_970(CPUPPCState *env)
>      return 0;
>  }
> =20
> -static void gen_spr_970_hid(CPUPPCState *env)
> +static void register_970_hid_sprs(CPUPPCState *env)
>  {
>      /* Hardware implementation registers */
>      /* XXX : not implemented */
> @@ -6808,7 +6808,7 @@ static void gen_spr_970_hid(CPUPPCState *env)
>                   POWERPC970_HID5_INIT);
>  }
> =20
> -static void gen_spr_970_hior(CPUPPCState *env)
> +static void register_970_hior_sprs(CPUPPCState *env)
>  {
>      spr_register(env, SPR_HIOR, "SPR_HIOR",
>                   SPR_NOACCESS, SPR_NOACCESS,
> @@ -6816,7 +6816,7 @@ static void gen_spr_970_hior(CPUPPCState *env)
>                   0x00000000);
>  }
> =20
> -static void gen_spr_book3s_ctrl(CPUPPCState *env)
> +static void register_book3s_ctrl_sprs(CPUPPCState *env)
>  {
>      spr_register(env, SPR_CTRL, "SPR_CTRL",
>                   SPR_NOACCESS, SPR_NOACCESS,
> @@ -6828,7 +6828,7 @@ static void gen_spr_book3s_ctrl(CPUPPCState *env)
>                   0x00000000);
>  }
> =20
> -static void gen_spr_book3s_altivec(CPUPPCState *env)
> +static void register_book3s_altivec_sprs(CPUPPCState *env)
>  {
>      if (!(env->insns_flags & PPC_ALTIVEC)) {
>          return;
> @@ -6841,7 +6841,7 @@ static void gen_spr_book3s_altivec(CPUPPCState *env)
> =20
>  }
> =20
> -static void gen_spr_book3s_dbg(CPUPPCState *env)
> +static void register_book3s_dbg_sprs(CPUPPCState *env)
>  {
>      /*
>       * TODO: different specs define different scopes for these,
> @@ -6860,7 +6860,7 @@ static void gen_spr_book3s_dbg(CPUPPCState *env)
>                       KVM_REG_PPC_DABRX, 0x00000000);
>  }
> =20
> -static void gen_spr_book3s_207_dbg(CPUPPCState *env)
> +static void register_book3s_207_dbg_sprs(CPUPPCState *env)
>  {
>      spr_register_kvm_hv(env, SPR_DAWR, "DAWR",
>                          SPR_NOACCESS, SPR_NOACCESS,
> @@ -6879,7 +6879,7 @@ static void gen_spr_book3s_207_dbg(CPUPPCState *env)
>                          KVM_REG_PPC_CIABR, 0x00000000);
>  }
> =20
> -static void gen_spr_970_dbg(CPUPPCState *env)
> +static void register_970_dbg_sprs(CPUPPCState *env)
>  {
>      /* Breakpoints */
>      spr_register(env, SPR_IABR, "IABR",
> @@ -6888,7 +6888,7 @@ static void gen_spr_970_dbg(CPUPPCState *env)
>                   0x00000000);
>  }
> =20
> -static void gen_spr_book3s_pmu_sup(CPUPPCState *env)
> +static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
>  {
>      spr_register_kvm(env, SPR_POWER_MMCR0, "MMCR0",
>                       SPR_NOACCESS, SPR_NOACCESS,
> @@ -6936,7 +6936,7 @@ static void gen_spr_book3s_pmu_sup(CPUPPCState *env)
>                       KVM_REG_PPC_SDAR, 0x00000000);
>  }
> =20
> -static void gen_spr_book3s_pmu_user(CPUPPCState *env)
> +static void register_book3s_pmu_user_sprs(CPUPPCState *env)
>  {
>      spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
>                   &spr_read_ureg, SPR_NOACCESS,
> @@ -6984,7 +6984,7 @@ static void gen_spr_book3s_pmu_user(CPUPPCState *en=
v)
>                   0x00000000);
>  }
> =20
> -static void gen_spr_970_pmu_sup(CPUPPCState *env)
> +static void register_970_pmu_sup_sprs(CPUPPCState *env)
>  {
>      spr_register_kvm(env, SPR_970_PMC7, "PMC7",
>                       SPR_NOACCESS, SPR_NOACCESS,
> @@ -6996,7 +6996,7 @@ static void gen_spr_970_pmu_sup(CPUPPCState *env)
>                       KVM_REG_PPC_PMC8, 0x00000000);
>  }
> =20
> -static void gen_spr_970_pmu_user(CPUPPCState *env)
> +static void register_970_pmu_user_sprs(CPUPPCState *env)
>  {
>      spr_register(env, SPR_970_UPMC7, "UPMC7",
>                   &spr_read_ureg, SPR_NOACCESS,
> @@ -7008,7 +7008,7 @@ static void gen_spr_970_pmu_user(CPUPPCState *env)
>                   0x00000000);
>  }
> =20
> -static void gen_spr_power8_pmu_sup(CPUPPCState *env)
> +static void register_power8_pmu_sup_sprs(CPUPPCState *env)
>  {
>      spr_register_kvm(env, SPR_POWER_MMCR2, "MMCR2",
>                       SPR_NOACCESS, SPR_NOACCESS,
> @@ -7044,7 +7044,7 @@ static void gen_spr_power8_pmu_sup(CPUPPCState *env)
>                       KVM_REG_PPC_CSIGR, 0x00000000);
>  }
> =20
> -static void gen_spr_power8_pmu_user(CPUPPCState *env)
> +static void register_power8_pmu_user_sprs(CPUPPCState *env)
>  {
>      spr_register(env, SPR_POWER_UMMCR2, "UMMCR2",
>                   &spr_read_ureg, SPR_NOACCESS,
> @@ -7056,7 +7056,7 @@ static void gen_spr_power8_pmu_user(CPUPPCState *en=
v)
>                   0x00000000);
>  }
> =20
> -static void gen_spr_power5p_ear(CPUPPCState *env)
> +static void register_power5p_ear_sprs(CPUPPCState *env)
>  {
>      /* External access control */
>      spr_register(env, SPR_EAR, "EAR",
> @@ -7065,7 +7065,7 @@ static void gen_spr_power5p_ear(CPUPPCState *env)
>                   0x00000000);
>  }
> =20
> -static void gen_spr_power5p_tb(CPUPPCState *env)
> +static void register_power5p_tb_sprs(CPUPPCState *env)
>  {
>      /* TBU40 (High 40 bits of the Timebase register */
>      spr_register_hv(env, SPR_TBU40, "TBU40",
> @@ -7075,7 +7075,7 @@ static void gen_spr_power5p_tb(CPUPPCState *env)
>                      0x00000000);
>  }
> =20
> -static void gen_spr_970_lpar(CPUPPCState *env)
> +static void register_970_lpar_sprs(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
>      /*
> @@ -7092,7 +7092,7 @@ static void gen_spr_970_lpar(CPUPPCState *env)
>  #endif
>  }
> =20
> -static void gen_spr_power5p_lpar(CPUPPCState *env)
> +static void register_power5p_lpar_sprs(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
>      /* Logical partitionning */
> @@ -7108,7 +7108,7 @@ static void gen_spr_power5p_lpar(CPUPPCState *env)
>  #endif
>  }
> =20
> -static void gen_spr_book3s_ids(CPUPPCState *env)
> +static void register_book3s_ids_sprs(CPUPPCState *env)
>  {
>      /* FIXME: Will need to deal with thread vs core only SPRs */
> =20
> @@ -7200,7 +7200,7 @@ static void gen_spr_book3s_ids(CPUPPCState *env)
>                   0x00000000);
>  }
> =20
> -static void gen_spr_rmor(CPUPPCState *env)
> +static void register_rmor_sprs(CPUPPCState *env)
>  {
>      spr_register_hv(env, SPR_RMOR, "RMOR",
>                   SPR_NOACCESS, SPR_NOACCESS,
> @@ -7209,7 +7209,7 @@ static void gen_spr_rmor(CPUPPCState *env)
>                   0x00000000);
>  }
> =20
> -static void gen_spr_power8_ids(CPUPPCState *env)
> +static void register_power8_ids_sprs(CPUPPCState *env)
>  {
>      /* Thread identification */
>      spr_register(env, SPR_TIR, "TIR",
> @@ -7218,7 +7218,7 @@ static void gen_spr_power8_ids(CPUPPCState *env)
>                   0x00000000);
>  }
> =20
> -static void gen_spr_book3s_purr(CPUPPCState *env)
> +static void register_book3s_purr_sprs(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
>      /* PURR & SPURR: Hack - treat these as aliases for the TB for now */
> @@ -7235,7 +7235,7 @@ static void gen_spr_book3s_purr(CPUPPCState *env)
>  #endif
>  }
> =20
> -static void gen_spr_power6_dbg(CPUPPCState *env)
> +static void register_power6_dbg_sprs(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
>      spr_register(env, SPR_CFAR, "SPR_CFAR",
> @@ -7245,7 +7245,7 @@ static void gen_spr_power6_dbg(CPUPPCState *env)
>  #endif
>  }
> =20
> -static void gen_spr_power5p_common(CPUPPCState *env)
> +static void register_power5p_common_sprs(CPUPPCState *env)
>  {
>      spr_register_kvm(env, SPR_PPR, "PPR",
>                       &spr_read_generic, &spr_write_generic,
> @@ -7253,7 +7253,7 @@ static void gen_spr_power5p_common(CPUPPCState *env)
>                       KVM_REG_PPC_PPR, 0x00000000);
>  }
> =20
> -static void gen_spr_power6_common(CPUPPCState *env)
> +static void register_power6_common_sprs(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
>      spr_register_kvm(env, SPR_DSCR, "SPR_DSCR",
> @@ -7272,7 +7272,7 @@ static void gen_spr_power6_common(CPUPPCState *env)
>                   0x00000000);
>  }
> =20
> -static void gen_spr_power8_tce_address_control(CPUPPCState *env)
> +static void register_power8_tce_address_control_sprs(CPUPPCState *env)
>  {
>      spr_register_kvm(env, SPR_TAR, "TAR",
>                       &spr_read_tar, &spr_write_tar,
> @@ -7280,7 +7280,7 @@ static void gen_spr_power8_tce_address_control(CPUP=
PCState *env)
>                       KVM_REG_PPC_TAR, 0x00000000);
>  }
> =20
> -static void gen_spr_power8_tm(CPUPPCState *env)
> +static void register_power8_tm_sprs(CPUPPCState *env)
>  {
>      spr_register_kvm(env, SPR_TFHAR, "TFHAR",
>                       &spr_read_tm, &spr_write_tm,
> @@ -7300,7 +7300,7 @@ static void gen_spr_power8_tm(CPUPPCState *env)
>                   0x00000000);
>  }
> =20
> -static void gen_spr_power8_ebb(CPUPPCState *env)
> +static void register_power8_ebb_sprs(CPUPPCState *env)
>  {
>      spr_register(env, SPR_BESCRS, "BESCRS",
>                   &spr_read_ebb, &spr_write_ebb,
> @@ -7333,7 +7333,7 @@ static void gen_spr_power8_ebb(CPUPPCState *env)
>  }
> =20
>  /* Virtual Time Base */
> -static void gen_spr_vtb(CPUPPCState *env)
> +static void register_vtb_sprs(CPUPPCState *env)
>  {
>      spr_register_kvm_hv(env, SPR_VTB, "VTB",
>                          SPR_NOACCESS, SPR_NOACCESS,
> @@ -7342,7 +7342,7 @@ static void gen_spr_vtb(CPUPPCState *env)
>                          KVM_REG_PPC_VTB, 0x00000000);
>  }
> =20
> -static void gen_spr_power8_fscr(CPUPPCState *env)
> +static void register_power8_fscr_sprs(CPUPPCState *env)
>  {
>  #if defined(CONFIG_USER_ONLY)
>      target_ulong initval =3D 1ULL << FSCR_TAR;
> @@ -7355,7 +7355,7 @@ static void gen_spr_power8_fscr(CPUPPCState *env)
>                       KVM_REG_PPC_FSCR, initval);
>  }
> =20
> -static void gen_spr_power8_pspb(CPUPPCState *env)
> +static void register_power8_pspb_sprs(CPUPPCState *env)
>  {
>      spr_register_kvm(env, SPR_PSPB, "PSPB",
>                       SPR_NOACCESS, SPR_NOACCESS,
> @@ -7363,7 +7363,7 @@ static void gen_spr_power8_pspb(CPUPPCState *env)
>                       KVM_REG_PPC_PSPB, 0);
>  }
> =20
> -static void gen_spr_power8_dpdes(CPUPPCState *env)
> +static void register_power8_dpdes_sprs(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
>      /* Directed Privileged Door-bell Exception State, used for IPI */
> @@ -7375,7 +7375,7 @@ static void gen_spr_power8_dpdes(CPUPPCState *env)
>  #endif
>  }
> =20
> -static void gen_spr_power8_ic(CPUPPCState *env)
> +static void register_power8_ic_sprs(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
>      spr_register_hv(env, SPR_IC, "IC",
> @@ -7386,7 +7386,7 @@ static void gen_spr_power8_ic(CPUPPCState *env)
>  #endif
>  }
> =20
> -static void gen_spr_power8_book4(CPUPPCState *env)
> +static void register_power8_book4_sprs(CPUPPCState *env)
>  {
>      /* Add a number of P8 book4 registers */
>  #if !defined(CONFIG_USER_ONLY)
> @@ -7405,7 +7405,7 @@ static void gen_spr_power8_book4(CPUPPCState *env)
>  #endif
>  }
> =20
> -static void gen_spr_power7_book4(CPUPPCState *env)
> +static void register_power7_book4_sprs(CPUPPCState *env)
>  {
>      /* Add a number of P7 book4 registers */
>  #if !defined(CONFIG_USER_ONLY)
> @@ -7420,7 +7420,7 @@ static void gen_spr_power7_book4(CPUPPCState *env)
>  #endif
>  }
> =20
> -static void gen_spr_power8_rpr(CPUPPCState *env)
> +static void register_power8_rpr_sprs(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
>      spr_register_hv(env, SPR_RPR, "RPR",
> @@ -7431,7 +7431,7 @@ static void gen_spr_power8_rpr(CPUPPCState *env)
>  #endif
>  }
> =20
> -static void gen_spr_power9_mmu(CPUPPCState *env)
> +static void register_power9_mmu_sprs(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
>      /* Partition Table Control */
> @@ -7451,13 +7451,13 @@ static void gen_spr_power9_mmu(CPUPPCState *env)
> =20
>  static void init_proc_book3s_common(CPUPPCState *env)
>  {
> -    gen_spr_ne_601(env);
> -    gen_tbl(env);
> -    gen_spr_usprg3(env);
> -    gen_spr_book3s_altivec(env);
> -    gen_spr_book3s_pmu_sup(env);
> -    gen_spr_book3s_pmu_user(env);
> -    gen_spr_book3s_ctrl(env);
> +    register_ne_601_sprs(env);
> +    register_tbl(env);
> +    register_usprg3_sprs(env);
> +    register_book3s_altivec_sprs(env);
> +    register_book3s_pmu_sup_sprs(env);
> +    register_book3s_pmu_user_sprs(env);
> +    register_book3s_ctrl_sprs(env);
>      /*
>       * Can't find information on what this should be on reset.  This
>       * value is the one used by 74xx processors.
> @@ -7469,17 +7469,17 @@ static void init_proc_970(CPUPPCState *env)
>  {
>      /* Common Registers */
>      init_proc_book3s_common(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_book3s_dbg(env);
> +    register_sdr1_sprs(env);
> +    register_book3s_dbg_sprs(env);
> =20
>      /* 970 Specific Registers */
> -    gen_spr_970_hid(env);
> -    gen_spr_970_hior(env);
> -    gen_low_BATs(env);
> -    gen_spr_970_pmu_sup(env);
> -    gen_spr_970_pmu_user(env);
> -    gen_spr_970_lpar(env);
> -    gen_spr_970_dbg(env);
> +    register_970_hid_sprs(env);
> +    register_970_hior_sprs(env);
> +    register_low_BATs(env);
> +    register_970_pmu_sup_sprs(env);
> +    register_970_pmu_user_sprs(env);
> +    register_970_lpar_sprs(env);
> +    register_970_dbg_sprs(env);
> =20
>      /* env variables */
>      env->dcache_line_size =3D 128;
> @@ -7542,19 +7542,19 @@ static void init_proc_power5plus(CPUPPCState *env)
>  {
>      /* Common Registers */
>      init_proc_book3s_common(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_book3s_dbg(env);
> +    register_sdr1_sprs(env);
> +    register_book3s_dbg_sprs(env);
> =20
>      /* POWER5+ Specific Registers */
> -    gen_spr_970_hid(env);
> -    gen_spr_970_hior(env);
> -    gen_low_BATs(env);
> -    gen_spr_970_pmu_sup(env);
> -    gen_spr_970_pmu_user(env);
> -    gen_spr_power5p_common(env);
> -    gen_spr_power5p_lpar(env);
> -    gen_spr_power5p_ear(env);
> -    gen_spr_power5p_tb(env);
> +    register_970_hid_sprs(env);
> +    register_970_hior_sprs(env);
> +    register_low_BATs(env);
> +    register_970_pmu_sup_sprs(env);
> +    register_970_pmu_user_sprs(env);
> +    register_power5p_common_sprs(env);
> +    register_power5p_lpar_sprs(env);
> +    register_power5p_ear_sprs(env);
> +    register_power5p_tb_sprs(env);
> =20
>      /* env variables */
>      env->dcache_line_size =3D 128;
> @@ -7621,21 +7621,21 @@ static void init_proc_POWER7(CPUPPCState *env)
>  {
>      /* Common Registers */
>      init_proc_book3s_common(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_book3s_dbg(env);
> +    register_sdr1_sprs(env);
> +    register_book3s_dbg_sprs(env);
> =20
>      /* POWER7 Specific Registers */
> -    gen_spr_book3s_ids(env);
> -    gen_spr_rmor(env);
> -    gen_spr_amr(env);
> -    gen_spr_book3s_purr(env);
> -    gen_spr_power5p_common(env);
> -    gen_spr_power5p_lpar(env);
> -    gen_spr_power5p_ear(env);
> -    gen_spr_power5p_tb(env);
> -    gen_spr_power6_common(env);
> -    gen_spr_power6_dbg(env);
> -    gen_spr_power7_book4(env);
> +    register_book3s_ids_sprs(env);
> +    register_rmor_sprs(env);
> +    register_amr_sprs(env);
> +    register_book3s_purr_sprs(env);
> +    register_power5p_common_sprs(env);
> +    register_power5p_lpar_sprs(env);
> +    register_power5p_ear_sprs(env);
> +    register_power5p_tb_sprs(env);
> +    register_power6_common_sprs(env);
> +    register_power6_dbg_sprs(env);
> +    register_power7_book4_sprs(env);
> =20
>      /* env variables */
>      env->dcache_line_size =3D 128;
> @@ -7767,34 +7767,34 @@ static void init_proc_POWER8(CPUPPCState *env)
>  {
>      /* Common Registers */
>      init_proc_book3s_common(env);
> -    gen_spr_sdr1(env);
> -    gen_spr_book3s_207_dbg(env);
> +    register_sdr1_sprs(env);
> +    register_book3s_207_dbg_sprs(env);
> =20
>      /* POWER8 Specific Registers */
> -    gen_spr_book3s_ids(env);
> -    gen_spr_rmor(env);
> -    gen_spr_amr(env);
> -    gen_spr_iamr(env);
> -    gen_spr_book3s_purr(env);
> -    gen_spr_power5p_common(env);
> -    gen_spr_power5p_lpar(env);
> -    gen_spr_power5p_ear(env);
> -    gen_spr_power5p_tb(env);
> -    gen_spr_power6_common(env);
> -    gen_spr_power6_dbg(env);
> -    gen_spr_power8_tce_address_control(env);
> -    gen_spr_power8_ids(env);
> -    gen_spr_power8_ebb(env);
> -    gen_spr_power8_fscr(env);
> -    gen_spr_power8_pmu_sup(env);
> -    gen_spr_power8_pmu_user(env);
> -    gen_spr_power8_tm(env);
> -    gen_spr_power8_pspb(env);
> -    gen_spr_power8_dpdes(env);
> -    gen_spr_vtb(env);
> -    gen_spr_power8_ic(env);
> -    gen_spr_power8_book4(env);
> -    gen_spr_power8_rpr(env);
> +    register_book3s_ids_sprs(env);
> +    register_rmor_sprs(env);
> +    register_amr_sprs(env);
> +    register_iamr_sprs(env);
> +    register_book3s_purr_sprs(env);
> +    register_power5p_common_sprs(env);
> +    register_power5p_lpar_sprs(env);
> +    register_power5p_ear_sprs(env);
> +    register_power5p_tb_sprs(env);
> +    register_power6_common_sprs(env);
> +    register_power6_dbg_sprs(env);
> +    register_power8_tce_address_control_sprs(env);
> +    register_power8_ids_sprs(env);
> +    register_power8_ebb_sprs(env);
> +    register_power8_fscr_sprs(env);
> +    register_power8_pmu_sup_sprs(env);
> +    register_power8_pmu_user_sprs(env);
> +    register_power8_tm_sprs(env);
> +    register_power8_pspb_sprs(env);
> +    register_power8_dpdes_sprs(env);
> +    register_vtb_sprs(env);
> +    register_power8_ic_sprs(env);
> +    register_power8_book4_sprs(env);
> +    register_power8_rpr_sprs(env);
> =20
>      /* env variables */
>      env->dcache_line_size =3D 128;
> @@ -7964,33 +7964,33 @@ static void init_proc_POWER9(CPUPPCState *env)
>  {
>      /* Common Registers */
>      init_proc_book3s_common(env);
> -    gen_spr_book3s_207_dbg(env);
> +    register_book3s_207_dbg_sprs(env);
> =20
>      /* POWER8 Specific Registers */
> -    gen_spr_book3s_ids(env);
> -    gen_spr_amr(env);
> -    gen_spr_iamr(env);
> -    gen_spr_book3s_purr(env);
> -    gen_spr_power5p_common(env);
> -    gen_spr_power5p_lpar(env);
> -    gen_spr_power5p_ear(env);
> -    gen_spr_power5p_tb(env);
> -    gen_spr_power6_common(env);
> -    gen_spr_power6_dbg(env);
> -    gen_spr_power8_tce_address_control(env);
> -    gen_spr_power8_ids(env);
> -    gen_spr_power8_ebb(env);
> -    gen_spr_power8_fscr(env);
> -    gen_spr_power8_pmu_sup(env);
> -    gen_spr_power8_pmu_user(env);
> -    gen_spr_power8_tm(env);
> -    gen_spr_power8_pspb(env);
> -    gen_spr_power8_dpdes(env);
> -    gen_spr_vtb(env);
> -    gen_spr_power8_ic(env);
> -    gen_spr_power8_book4(env);
> -    gen_spr_power8_rpr(env);
> -    gen_spr_power9_mmu(env);
> +    register_book3s_ids_sprs(env);
> +    register_amr_sprs(env);
> +    register_iamr_sprs(env);
> +    register_book3s_purr_sprs(env);
> +    register_power5p_common_sprs(env);
> +    register_power5p_lpar_sprs(env);
> +    register_power5p_ear_sprs(env);
> +    register_power5p_tb_sprs(env);
> +    register_power6_common_sprs(env);
> +    register_power6_dbg_sprs(env);
> +    register_power8_tce_address_control_sprs(env);
> +    register_power8_ids_sprs(env);
> +    register_power8_ebb_sprs(env);
> +    register_power8_fscr_sprs(env);
> +    register_power8_pmu_sup_sprs(env);
> +    register_power8_pmu_user_sprs(env);
> +    register_power8_tm_sprs(env);
> +    register_power8_pspb_sprs(env);
> +    register_power8_dpdes_sprs(env);
> +    register_vtb_sprs(env);
> +    register_power8_ic_sprs(env);
> +    register_power8_book4_sprs(env);
> +    register_power8_rpr_sprs(env);
> +    register_power9_mmu_sprs(env);
> =20
>      /* POWER9 Specific registers */
>      spr_register_kvm(env, SPR_TIDR, "TIDR", NULL, NULL,
> @@ -8182,31 +8182,31 @@ static void init_proc_POWER10(CPUPPCState *env)
>  {
>      /* Common Registers */
>      init_proc_book3s_common(env);
> -    gen_spr_book3s_207_dbg(env);
> +    register_book3s_207_dbg_sprs(env);
> =20
>      /* POWER8 Specific Registers */
> -    gen_spr_book3s_ids(env);
> -    gen_spr_amr(env);
> -    gen_spr_iamr(env);
> -    gen_spr_book3s_purr(env);
> -    gen_spr_power5p_common(env);
> -    gen_spr_power5p_lpar(env);
> -    gen_spr_power5p_ear(env);
> -    gen_spr_power6_common(env);
> -    gen_spr_power6_dbg(env);
> -    gen_spr_power8_tce_address_control(env);
> -    gen_spr_power8_ids(env);
> -    gen_spr_power8_ebb(env);
> -    gen_spr_power8_fscr(env);
> -    gen_spr_power8_pmu_sup(env);
> -    gen_spr_power8_pmu_user(env);
> -    gen_spr_power8_tm(env);
> -    gen_spr_power8_pspb(env);
> -    gen_spr_vtb(env);
> -    gen_spr_power8_ic(env);
> -    gen_spr_power8_book4(env);
> -    gen_spr_power8_rpr(env);
> -    gen_spr_power9_mmu(env);
> +    register_book3s_ids_sprs(env);
> +    register_amr_sprs(env);
> +    register_iamr_sprs(env);
> +    register_book3s_purr_sprs(env);
> +    register_power5p_common_sprs(env);
> +    register_power5p_lpar_sprs(env);
> +    register_power5p_ear_sprs(env);
> +    register_power6_common_sprs(env);
> +    register_power6_dbg_sprs(env);
> +    register_power8_tce_address_control_sprs(env);
> +    register_power8_ids_sprs(env);
> +    register_power8_ebb_sprs(env);
> +    register_power8_fscr_sprs(env);
> +    register_power8_pmu_sup_sprs(env);
> +    register_power8_pmu_user_sprs(env);
> +    register_power8_tm_sprs(env);
> +    register_power8_pspb_sprs(env);
> +    register_vtb_sprs(env);
> +    register_power8_ic_sprs(env);
> +    register_power8_book4_sprs(env);
> +    register_power8_rpr_sprs(env);
> +    register_power9_mmu_sprs(env);
> =20
>      /* FIXME: Filter fields properly based on privilege level */
>      spr_register_kvm_hv(env, SPR_PSSCR, "PSSCR", NULL, NULL, NULL, NULL,
> @@ -8411,7 +8411,7 @@ static void init_ppc_proc(PowerPCCPU *cpu)
>      env->tlb_type =3D TLB_NONE;
>  #endif
>      /* Register SPR common to all PowerPC implementations */
> -    gen_spr_generic(env);
> +    register_generic_sprs(env);
>      spr_register(env, SPR_PVR, "PVR",
>                   /* Linux permits userspace to read PVR */
>  #if defined(CONFIG_LINUX_USER)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+Pjtyfvb3Vt2v1vI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCPgNwACgkQbDjKyiDZ
s5K2rQ//Sphsfh9c9/xVWPkIaCHAV49BU50urcOpkDTJsuo+mfbHq2i4luwWdaSC
QyMg1rb8/FNdDD6wY5RaKDiWV60WWqUK7fjlN4exG2f9sNjnzQHOTra3h2/ZvZ0E
5zJPG8YtLfiyMYgxIpIkLC85CNQaihlC0TpwvQuA/773Z049nh2GOmf8PoMQiSIK
CZ8jR3lT2Nd4P3c4wKpGWtINGn+o6TnYNKRHWWBn4/lnumVE11P0SYB4GEA7ednz
vuMXL+27/A1lzAf1ltToiN1rfboZBi1TqeidtrEZJlN6Z4UZcTLdFsQvag1kXh92
FdzRr3W4qNa+inhvFUE3wziW0WDM5ay+rICySmlSrIctPwGH7cayzr/JtZrXoITd
iBHP9hBVw5LG5IWQfjHt77Si0zALA7fnNeaV8/KgIQww3MJGR1rBPQtK7bUo8FXx
Vspzd3YijSqPr3U2IJsy7VHNnMu4H6pi8CHftIhcFdBbDD+mTWMSO5296DWH+R1R
fMNCqoU1mK7HInMDUNFgPVCdNgf2jPc0w5sNFahAzwZZkK+IITZyVsHeuMuWDN0D
3023d+TGBrbQHFQHtM54krRdj7g2XumsLf3xXv2CmAgQhg5DhpviPi13tGvKyrzC
bRWvpHTDrfpXe4Kc+6Zh0QNMrYSqMrwvoSb8eh6iGZLpjKebvtg=
=31o8
-----END PGP SIGNATURE-----

--+Pjtyfvb3Vt2v1vI--

