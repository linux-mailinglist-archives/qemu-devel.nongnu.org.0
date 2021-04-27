Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FB736BDAC
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 05:15:19 +0200 (CEST)
Received: from localhost ([::1]:52472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbEBy-0000Gw-8w
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 23:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lbEAJ-0008CY-Jw; Mon, 26 Apr 2021 23:13:36 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:33199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lbEAF-0006Xd-Qq; Mon, 26 Apr 2021 23:13:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FTn035SMXz9sXG; Tue, 27 Apr 2021 13:13:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1619493203;
 bh=5peQ19J60vlzK2k9uLtBP3jawIeGO2QXt151YbHYtRA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SLX25B11qCV5XTd8yvUB/oD0Bx+w7u68gmQYzdSGvvPbdCKzQaDRULYUVspXovrah
 iXqb25gZ15dJdeIAKvldu8AULlmZ9vfdPyJGAiHe38H676NggT90T46qBPel8la7lQ
 1dZPgC5acwktrcB/cMQFh5LyvLWtcWed8iIAlT28=
Date: Tue, 27 Apr 2021 12:11:56 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v4] target/ppc: code motion from translate_init.c.inc to
 gdbstub.c
Message-ID: <YIdy7LoJG37+jpKb@yekko.fritz.box>
References: <20210426184706.48040-1-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="44CpfYPn5j29IUvw"
Content-Disposition: inline
In-Reply-To: <20210426184706.48040-1-bruno.larsen@eldorado.org.br>
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


--44CpfYPn5j29IUvw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 26, 2021 at 03:47:06PM -0300, Bruno Larsen (billionai) wrote:
> All the code related to gdb has been moved from translate_init.c.inc
> file to the gdbstub.c file, where it makes more sense.
>=20
> Version 4 fixes the omission of internal.h in gdbstub, mentioned in
> <87sg3d2gf5.fsf@linux.ibm.com>, and the extra blank line.
>=20
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/gdbstub.c            | 258 ++++++++++++++++++++++++++++++++
>  target/ppc/internal.h           |   5 +
>  target/ppc/translate_init.c.inc | 254 +------------------------------
>  3 files changed, 264 insertions(+), 253 deletions(-)
>=20
> diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
> index c28319fb97..94a7273ee0 100644
> --- a/target/ppc/gdbstub.c
> +++ b/target/ppc/gdbstub.c
> @@ -20,6 +20,8 @@
>  #include "qemu/osdep.h"
>  #include "cpu.h"
>  #include "exec/gdbstub.h"
> +#include "exec/helper-proto.h"
> +#include "internal.h"
> =20
>  static int ppc_gdb_register_len_apple(int n)
>  {
> @@ -387,3 +389,259 @@ const char *ppc_gdb_get_dynamic_xml(CPUState *cs, c=
onst char *xml_name)
>      return NULL;
>  }
>  #endif
> +
> +static bool avr_need_swap(CPUPPCState *env)
> +{
> +#ifdef HOST_WORDS_BIGENDIAN
> +    return msr_le;
> +#else
> +    return !msr_le;
> +#endif
> +}
> +
> +#if !defined(CONFIG_USER_ONLY)
> +static int gdb_find_spr_idx(CPUPPCState *env, int n)
> +{
> +    int i;
> +
> +    for (i =3D 0; i < ARRAY_SIZE(env->spr_cb); i++) {
> +        ppc_spr_t *spr =3D &env->spr_cb[i];
> +
> +        if (spr->name && spr->gdb_id =3D=3D n) {
> +            return i;
> +        }
> +    }
> +    return -1;
> +}
> +
> +static int gdb_get_spr_reg(CPUPPCState *env, GByteArray *buf, int n)
> +{
> +    int reg;
> +    int len;
> +
> +    reg =3D gdb_find_spr_idx(env, n);
> +    if (reg < 0) {
> +        return 0;
> +    }
> +
> +    len =3D TARGET_LONG_SIZE;
> +    gdb_get_regl(buf, env->spr[reg]);
> +    ppc_maybe_bswap_register(env, gdb_get_reg_ptr(buf, len), len);
> +    return len;
> +}
> +
> +static int gdb_set_spr_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> +{
> +    int reg;
> +    int len;
> +
> +    reg =3D gdb_find_spr_idx(env, n);
> +    if (reg < 0) {
> +        return 0;
> +    }
> +
> +    len =3D TARGET_LONG_SIZE;
> +    ppc_maybe_bswap_register(env, mem_buf, len);
> +    env->spr[reg] =3D ldn_p(mem_buf, len);
> +
> +    return len;
> +}
> +#endif
> +
> +static int gdb_get_float_reg(CPUPPCState *env, GByteArray *buf, int n)
> +{
> +    uint8_t *mem_buf;
> +    if (n < 32) {
> +        gdb_get_reg64(buf, *cpu_fpr_ptr(env, n));
> +        mem_buf =3D gdb_get_reg_ptr(buf, 8);
> +        ppc_maybe_bswap_register(env, mem_buf, 8);
> +        return 8;
> +    }
> +    if (n =3D=3D 32) {
> +        gdb_get_reg32(buf, env->fpscr);
> +        mem_buf =3D gdb_get_reg_ptr(buf, 4);
> +        ppc_maybe_bswap_register(env, mem_buf, 4);
> +        return 4;
> +    }
> +    return 0;
> +}
> +
> +static int gdb_set_float_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> +{
> +    if (n < 32) {
> +        ppc_maybe_bswap_register(env, mem_buf, 8);
> +        *cpu_fpr_ptr(env, n) =3D ldq_p(mem_buf);
> +        return 8;
> +    }
> +    if (n =3D=3D 32) {
> +        ppc_maybe_bswap_register(env, mem_buf, 4);
> +        store_fpscr(env, ldl_p(mem_buf), 0xffffffff);
> +        return 4;
> +    }
> +    return 0;
> +}
> +
> +static int gdb_get_avr_reg(CPUPPCState *env, GByteArray *buf, int n)
> +{
> +    uint8_t *mem_buf;
> +
> +    if (n < 32) {
> +        ppc_avr_t *avr =3D cpu_avr_ptr(env, n);
> +        if (!avr_need_swap(env)) {
> +            gdb_get_reg128(buf, avr->u64[0] , avr->u64[1]);
> +        } else {
> +            gdb_get_reg128(buf, avr->u64[1] , avr->u64[0]);
> +        }
> +        mem_buf =3D gdb_get_reg_ptr(buf, 16);
> +        ppc_maybe_bswap_register(env, mem_buf, 8);
> +        ppc_maybe_bswap_register(env, mem_buf + 8, 8);
> +        return 16;
> +    }
> +    if (n =3D=3D 32) {
> +        gdb_get_reg32(buf, helper_mfvscr(env));
> +        mem_buf =3D gdb_get_reg_ptr(buf, 4);
> +        ppc_maybe_bswap_register(env, mem_buf, 4);
> +        return 4;
> +    }
> +    if (n =3D=3D 33) {
> +        gdb_get_reg32(buf, (uint32_t)env->spr[SPR_VRSAVE]);
> +        mem_buf =3D gdb_get_reg_ptr(buf, 4);
> +        ppc_maybe_bswap_register(env, mem_buf, 4);
> +        return 4;
> +    }
> +    return 0;
> +}
> +
> +static int gdb_set_avr_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> +{
> +    if (n < 32) {
> +        ppc_avr_t *avr =3D cpu_avr_ptr(env, n);
> +        ppc_maybe_bswap_register(env, mem_buf, 8);
> +        ppc_maybe_bswap_register(env, mem_buf + 8, 8);
> +        if (!avr_need_swap(env)) {
> +            avr->u64[0] =3D ldq_p(mem_buf);
> +            avr->u64[1] =3D ldq_p(mem_buf + 8);
> +        } else {
> +            avr->u64[1] =3D ldq_p(mem_buf);
> +            avr->u64[0] =3D ldq_p(mem_buf + 8);
> +        }
> +        return 16;
> +    }
> +    if (n =3D=3D 32) {
> +        ppc_maybe_bswap_register(env, mem_buf, 4);
> +        helper_mtvscr(env, ldl_p(mem_buf));
> +        return 4;
> +    }
> +    if (n =3D=3D 33) {
> +        ppc_maybe_bswap_register(env, mem_buf, 4);
> +        env->spr[SPR_VRSAVE] =3D (target_ulong)ldl_p(mem_buf);
> +        return 4;
> +    }
> +    return 0;
> +}
> +
> +static int gdb_get_spe_reg(CPUPPCState *env, GByteArray *buf, int n)
> +{
> +    if (n < 32) {
> +#if defined(TARGET_PPC64)
> +        gdb_get_reg32(buf, env->gpr[n] >> 32);
> +        ppc_maybe_bswap_register(env, gdb_get_reg_ptr(buf, 4), 4);
> +#else
> +        gdb_get_reg32(buf, env->gprh[n]);
> +#endif
> +        return 4;
> +    }
> +    if (n =3D=3D 32) {
> +        gdb_get_reg64(buf, env->spe_acc);
> +        ppc_maybe_bswap_register(env, gdb_get_reg_ptr(buf, 8), 8);
> +        return 8;
> +    }
> +    if (n =3D=3D 33) {
> +        gdb_get_reg32(buf, env->spe_fscr);
> +        ppc_maybe_bswap_register(env, gdb_get_reg_ptr(buf, 4), 4);
> +        return 4;
> +    }
> +    return 0;
> +}
> +
> +static int gdb_set_spe_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> +{
> +    if (n < 32) {
> +#if defined(TARGET_PPC64)
> +        target_ulong lo =3D (uint32_t)env->gpr[n];
> +        target_ulong hi;
> +
> +        ppc_maybe_bswap_register(env, mem_buf, 4);
> +
> +        hi =3D (target_ulong)ldl_p(mem_buf) << 32;
> +        env->gpr[n] =3D lo | hi;
> +#else
> +        env->gprh[n] =3D ldl_p(mem_buf);
> +#endif
> +        return 4;
> +    }
> +    if (n =3D=3D 32) {
> +        ppc_maybe_bswap_register(env, mem_buf, 8);
> +        env->spe_acc =3D ldq_p(mem_buf);
> +        return 8;
> +    }
> +    if (n =3D=3D 33) {
> +        ppc_maybe_bswap_register(env, mem_buf, 4);
> +        env->spe_fscr =3D ldl_p(mem_buf);
> +        return 4;
> +    }
> +    return 0;
> +}
> +
> +static int gdb_get_vsx_reg(CPUPPCState *env, GByteArray *buf, int n)
> +{
> +    if (n < 32) {
> +        gdb_get_reg64(buf, *cpu_vsrl_ptr(env, n));
> +        ppc_maybe_bswap_register(env, gdb_get_reg_ptr(buf, 8), 8);
> +        return 8;
> +    }
> +    return 0;
> +}
> +
> +static int gdb_set_vsx_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> +{
> +    if (n < 32) {
> +        ppc_maybe_bswap_register(env, mem_buf, 8);
> +        *cpu_vsrl_ptr(env, n) =3D ldq_p(mem_buf);
> +        return 8;
> +    }
> +    return 0;
> +}
> +
> +gchar *ppc_gdb_arch_name(CPUState *cs)
> +{
> +#if defined(TARGET_PPC64)
> +    return g_strdup("powerpc:common64");
> +#else
> +    return g_strdup("powerpc:common");
> +#endif
> +}
> +
> +void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *pcc)
> +{
> +    if (pcc->insns_flags & PPC_FLOAT) {
> +        gdb_register_coprocessor(cs, gdb_get_float_reg, gdb_set_float_re=
g,
> +                                 33, "power-fpu.xml", 0);
> +    }
> +    if (pcc->insns_flags & PPC_ALTIVEC) {
> +        gdb_register_coprocessor(cs, gdb_get_avr_reg, gdb_set_avr_reg,
> +                                 34, "power-altivec.xml", 0);
> +    }
> +    if (pcc->insns_flags & PPC_SPE) {
> +        gdb_register_coprocessor(cs, gdb_get_spe_reg, gdb_set_spe_reg,
> +                                 34, "power-spe.xml", 0);
> +    }
> +    if (pcc->insns_flags2 & PPC2_VSX) {
> +        gdb_register_coprocessor(cs, gdb_get_vsx_reg, gdb_set_vsx_reg,
> +                                 32, "power-vsx.xml", 0);
> +    }
> +#ifndef CONFIG_USER_ONLY
> +    gdb_register_coprocessor(cs, gdb_get_spr_reg, gdb_set_spr_reg,
> +                             pcc->gdb_num_sprs, "power-spr.xml", 0);
> +#endif
> +}
> diff --git a/target/ppc/internal.h b/target/ppc/internal.h
> index d547448065..c401658e8d 100644
> --- a/target/ppc/internal.h
> +++ b/target/ppc/internal.h
> @@ -215,4 +215,9 @@ void helper_compute_fprf_float128(CPUPPCState *env, f=
loat128 arg);
>  void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>                                   MMUAccessType access_type,
>                                   int mmu_idx, uintptr_t retaddr);
> +
> +/* gdbstub.c */
> +void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *ppc);
> +gchar *ppc_gdb_arch_name(CPUState *cs);
> +
>  #endif /* PPC_INTERNAL_H */
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.=
c.inc
> index c03a7c4f52..80fef0b90d 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/translate_init.c.inc
> @@ -9895,230 +9895,6 @@ static void dump_ppc_insns(CPUPPCState *env)
>      }
>  }
>  #endif
> -
> -static bool avr_need_swap(CPUPPCState *env)
> -{
> -#ifdef HOST_WORDS_BIGENDIAN
> -    return msr_le;
> -#else
> -    return !msr_le;
> -#endif
> -}
> -
> -#if !defined(CONFIG_USER_ONLY)
> -static int gdb_find_spr_idx(CPUPPCState *env, int n)
> -{
> -    int i;
> -
> -    for (i =3D 0; i < ARRAY_SIZE(env->spr_cb); i++) {
> -        ppc_spr_t *spr =3D &env->spr_cb[i];
> -
> -        if (spr->name && spr->gdb_id =3D=3D n) {
> -            return i;
> -        }
> -    }
> -    return -1;
> -}
> -
> -static int gdb_get_spr_reg(CPUPPCState *env, GByteArray *buf, int n)
> -{
> -    int reg;
> -    int len;
> -
> -    reg =3D gdb_find_spr_idx(env, n);
> -    if (reg < 0) {
> -        return 0;
> -    }
> -
> -    len =3D TARGET_LONG_SIZE;
> -    gdb_get_regl(buf, env->spr[reg]);
> -    ppc_maybe_bswap_register(env, gdb_get_reg_ptr(buf, len), len);
> -    return len;
> -}
> -
> -static int gdb_set_spr_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> -{
> -    int reg;
> -    int len;
> -
> -    reg =3D gdb_find_spr_idx(env, n);
> -    if (reg < 0) {
> -        return 0;
> -    }
> -
> -    len =3D TARGET_LONG_SIZE;
> -    ppc_maybe_bswap_register(env, mem_buf, len);
> -    env->spr[reg] =3D ldn_p(mem_buf, len);
> -
> -    return len;
> -}
> -#endif
> -
> -static int gdb_get_float_reg(CPUPPCState *env, GByteArray *buf, int n)
> -{
> -    uint8_t *mem_buf;
> -    if (n < 32) {
> -        gdb_get_reg64(buf, *cpu_fpr_ptr(env, n));
> -        mem_buf =3D gdb_get_reg_ptr(buf, 8);
> -        ppc_maybe_bswap_register(env, mem_buf, 8);
> -        return 8;
> -    }
> -    if (n =3D=3D 32) {
> -        gdb_get_reg32(buf, env->fpscr);
> -        mem_buf =3D gdb_get_reg_ptr(buf, 4);
> -        ppc_maybe_bswap_register(env, mem_buf, 4);
> -        return 4;
> -    }
> -    return 0;
> -}
> -
> -static int gdb_set_float_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> -{
> -    if (n < 32) {
> -        ppc_maybe_bswap_register(env, mem_buf, 8);
> -        *cpu_fpr_ptr(env, n) =3D ldq_p(mem_buf);
> -        return 8;
> -    }
> -    if (n =3D=3D 32) {
> -        ppc_maybe_bswap_register(env, mem_buf, 4);
> -        helper_store_fpscr(env, ldl_p(mem_buf), 0xffffffff);
> -        return 4;
> -    }
> -    return 0;
> -}
> -
> -static int gdb_get_avr_reg(CPUPPCState *env, GByteArray *buf, int n)
> -{
> -    uint8_t *mem_buf;
> -
> -    if (n < 32) {
> -        ppc_avr_t *avr =3D cpu_avr_ptr(env, n);
> -        if (!avr_need_swap(env)) {
> -            gdb_get_reg128(buf, avr->u64[0] , avr->u64[1]);
> -        } else {
> -            gdb_get_reg128(buf, avr->u64[1] , avr->u64[0]);
> -        }
> -        mem_buf =3D gdb_get_reg_ptr(buf, 16);
> -        ppc_maybe_bswap_register(env, mem_buf, 8);
> -        ppc_maybe_bswap_register(env, mem_buf + 8, 8);
> -        return 16;
> -    }
> -    if (n =3D=3D 32) {
> -        gdb_get_reg32(buf, helper_mfvscr(env));
> -        mem_buf =3D gdb_get_reg_ptr(buf, 4);
> -        ppc_maybe_bswap_register(env, mem_buf, 4);
> -        return 4;
> -    }
> -    if (n =3D=3D 33) {
> -        gdb_get_reg32(buf, (uint32_t)env->spr[SPR_VRSAVE]);
> -        mem_buf =3D gdb_get_reg_ptr(buf, 4);
> -        ppc_maybe_bswap_register(env, mem_buf, 4);
> -        return 4;
> -    }
> -    return 0;
> -}
> -
> -static int gdb_set_avr_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> -{
> -    if (n < 32) {
> -        ppc_avr_t *avr =3D cpu_avr_ptr(env, n);
> -        ppc_maybe_bswap_register(env, mem_buf, 8);
> -        ppc_maybe_bswap_register(env, mem_buf + 8, 8);
> -        if (!avr_need_swap(env)) {
> -            avr->u64[0] =3D ldq_p(mem_buf);
> -            avr->u64[1] =3D ldq_p(mem_buf + 8);
> -        } else {
> -            avr->u64[1] =3D ldq_p(mem_buf);
> -            avr->u64[0] =3D ldq_p(mem_buf + 8);
> -        }
> -        return 16;
> -    }
> -    if (n =3D=3D 32) {
> -        ppc_maybe_bswap_register(env, mem_buf, 4);
> -        helper_mtvscr(env, ldl_p(mem_buf));
> -        return 4;
> -    }
> -    if (n =3D=3D 33) {
> -        ppc_maybe_bswap_register(env, mem_buf, 4);
> -        env->spr[SPR_VRSAVE] =3D (target_ulong)ldl_p(mem_buf);
> -        return 4;
> -    }
> -    return 0;
> -}
> -
> -static int gdb_get_spe_reg(CPUPPCState *env, GByteArray *buf, int n)
> -{
> -    if (n < 32) {
> -#if defined(TARGET_PPC64)
> -        gdb_get_reg32(buf, env->gpr[n] >> 32);
> -        ppc_maybe_bswap_register(env, gdb_get_reg_ptr(buf, 4), 4);
> -#else
> -        gdb_get_reg32(buf, env->gprh[n]);
> -#endif
> -        return 4;
> -    }
> -    if (n =3D=3D 32) {
> -        gdb_get_reg64(buf, env->spe_acc);
> -        ppc_maybe_bswap_register(env, gdb_get_reg_ptr(buf, 8), 8);
> -        return 8;
> -    }
> -    if (n =3D=3D 33) {
> -        gdb_get_reg32(buf, env->spe_fscr);
> -        ppc_maybe_bswap_register(env, gdb_get_reg_ptr(buf, 4), 4);
> -        return 4;
> -    }
> -    return 0;
> -}
> -
> -static int gdb_set_spe_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> -{
> -    if (n < 32) {
> -#if defined(TARGET_PPC64)
> -        target_ulong lo =3D (uint32_t)env->gpr[n];
> -        target_ulong hi;
> -
> -        ppc_maybe_bswap_register(env, mem_buf, 4);
> -
> -        hi =3D (target_ulong)ldl_p(mem_buf) << 32;
> -        env->gpr[n] =3D lo | hi;
> -#else
> -        env->gprh[n] =3D ldl_p(mem_buf);
> -#endif
> -        return 4;
> -    }
> -    if (n =3D=3D 32) {
> -        ppc_maybe_bswap_register(env, mem_buf, 8);
> -        env->spe_acc =3D ldq_p(mem_buf);
> -        return 8;
> -    }
> -    if (n =3D=3D 33) {
> -        ppc_maybe_bswap_register(env, mem_buf, 4);
> -        env->spe_fscr =3D ldl_p(mem_buf);
> -        return 4;
> -    }
> -    return 0;
> -}
> -
> -static int gdb_get_vsx_reg(CPUPPCState *env, GByteArray *buf, int n)
> -{
> -    if (n < 32) {
> -        gdb_get_reg64(buf, *cpu_vsrl_ptr(env, n));
> -        ppc_maybe_bswap_register(env, gdb_get_reg_ptr(buf, 8), 8);
> -        return 8;
> -    }
> -    return 0;
> -}
> -
> -static int gdb_set_vsx_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> -{
> -    if (n < 32) {
> -        ppc_maybe_bswap_register(env, mem_buf, 8);
> -        *cpu_vsrl_ptr(env, n) =3D ldq_p(mem_buf);
> -        return 8;
> -    }
> -    return 0;
> -}
> -
>  static int ppc_fixup_cpu(PowerPCCPU *cpu)
>  {
>      CPUPPCState *env =3D &cpu->env;
> @@ -10174,26 +9950,7 @@ static void ppc_cpu_realize(DeviceState *dev, Err=
or **errp)
>      }
>      init_ppc_proc(cpu);
> =20
> -    if (pcc->insns_flags & PPC_FLOAT) {
> -        gdb_register_coprocessor(cs, gdb_get_float_reg, gdb_set_float_re=
g,
> -                                 33, "power-fpu.xml", 0);
> -    }
> -    if (pcc->insns_flags & PPC_ALTIVEC) {
> -        gdb_register_coprocessor(cs, gdb_get_avr_reg, gdb_set_avr_reg,
> -                                 34, "power-altivec.xml", 0);
> -    }
> -    if (pcc->insns_flags & PPC_SPE) {
> -        gdb_register_coprocessor(cs, gdb_get_spe_reg, gdb_set_spe_reg,
> -                                 34, "power-spe.xml", 0);
> -    }
> -    if (pcc->insns_flags2 & PPC2_VSX) {
> -        gdb_register_coprocessor(cs, gdb_get_vsx_reg, gdb_set_vsx_reg,
> -                                 32, "power-vsx.xml", 0);
> -    }
> -#ifndef CONFIG_USER_ONLY
> -    gdb_register_coprocessor(cs, gdb_get_spr_reg, gdb_set_spr_reg,
> -                             pcc->gdb_num_sprs, "power-spr.xml", 0);
> -#endif
> +    ppc_gdb_init(cs, pcc);
>      qemu_init_vcpu(cs);
> =20
>      pcc->parent_realize(dev, errp);
> @@ -10835,15 +10592,6 @@ static bool ppc_pvr_match_default(PowerPCCPUClas=
s *pcc, uint32_t pvr)
>      return pcc->pvr =3D=3D pvr;
>  }
> =20
> -static gchar *ppc_gdb_arch_name(CPUState *cs)
> -{
> -#if defined(TARGET_PPC64)
> -    return g_strdup("powerpc:common64");
> -#else
> -    return g_strdup("powerpc:common");
> -#endif
> -}
> -
>  static void ppc_disas_set_info(CPUState *cs, disassemble_info *info)
>  {
>      PowerPCCPU *cpu =3D POWERPC_CPU(cs);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--44CpfYPn5j29IUvw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCHcuoACgkQbDjKyiDZ
s5LBpg/9G5z/OPNfZHKRQ6OQmLeSjBQgs98y+5vRKqfe0C7OZX0T1GZ0xRUFNjrt
eXd2XPBoSsECLPGxfJMilISKQjXGRlKCU8z9+hfd/7gUTgZHRSHx4YO0bUWfG6gh
WMEvzffieS0g626Nd52QX/AK0VqIlwN6ECYTU3msAzMm2+hW34VO4GQWVKvODRwO
iV1DF5ahvSzXUfEKRf+vg5RqxKEhhaMakZoULLIxLrWjcnNLuO0SXr91L2Pgc+Uj
hs+0iruwn/N2EIQnCVlZ8+vYl0yJDwNIsXd72F3zws8etLBjtvg6haM79IgMZ5OC
pSvhLdfsqbpg+h9j4GPCmrExK0wHTlVwTLUVddKJ5p3HPYTVpTgnKhYz3g0X4c69
AFL80LEqKRts+PSnq9u4n1BIMEExpE3+2N+Y8LHoy0djTyK4uG6qrL1Sy4FMcxFl
i4DNMjwzql1HFLq6BQ8O4y6lNlFFoVotWDGBvuo/xuxceVMwZrn+tw6flXDpqWs+
f0DU73pT76Xj0izVdreg+pP3hFJSGKXcysPwsNZc8yfqZK4ukhPeZ5fHD6g6vjTk
lw6MM1DxO7T6hCmpEXo/fRuZFfK2m0/LQZZUAPBALT7n3SrB2mgdmOD9RZFnVg1L
oqkgMjISn+kFojz6I0nt0UEk38MlnFDsjI2VIQ4fHh7EZIloWTs=
=Thg5
-----END PGP SIGNATURE-----

--44CpfYPn5j29IUvw--

