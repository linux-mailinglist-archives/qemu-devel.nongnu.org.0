Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0DF314090
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:34:11 +0100 (CET)
Received: from localhost ([::1]:53092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9DEY-0007Au-5U
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:34:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l976N-0005ua-IK
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 09:01:25 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:50445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9764-00021E-LH
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 09:01:19 -0500
Received: by mail-wm1-x333.google.com with SMTP id 190so12712773wmz.0
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 06:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=KfnQ9jhQM8pSkS0FO4KBxiyzFRJpSlgqJHKn/mx6zuk=;
 b=mvhUaxWSOmsIKslqCz/ZWX7IK+CK4S61jNYgWJyIn8snTOOrTlxPS6GYf3DYgidaf6
 tJYlBVDmC0ehZlClOBlpVfirUz8NnETspB6ZNFHRsqzgwo20mX+XgapHTwYzJ7iqWKm+
 VW4AGhjabd9IFQQDBORe2L3n7UtsJDm10Q7ut4qGfA9P0wanZVZtNrafSpLkwgIzMwdQ
 dxhDPvo5sbia5w0Ok+ffEiv2NOLuCJ0sy5fzgZOwKBF66TkKnLeibz2+wL8PPdP4+7w6
 wXtrtza+Oj9FkuRlko3Q+8PPl0wGxE59jKX/UE+zEaqu8QA9kQIt8MYhHYKt8MNBQOtR
 cu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=KfnQ9jhQM8pSkS0FO4KBxiyzFRJpSlgqJHKn/mx6zuk=;
 b=f/759B5nzmZ00ZDfTuc7s6vArAPtrGkV4pcmp77Vn+QxWyugfx2R6y6ApaDrmz013D
 D6Hc5+gzRySPUd8BNLKTwwiavyoeUJyjNEq1tvAkzlDlyG/aeR6T5QH0pZD2LZih1wwW
 W+5sqJBHVLbAEfra39CAGp4V9kqazQIRK18tP7jXtrZjOGW+id91R6Q4gbZHedqbaggH
 eHvczqNQ/Yg7nu8RsCUgXm52ryzyjSYaPQK9SYUBLbFdG2cJ5DoH+Cx89mBOBDpa9/q/
 Ifd5y0zE4PPYa/jAwzPjg1qRrRINplQ0Z733CEVpqA8arZXfIvgJbGxt41QiniXJ8nVS
 B5Mg==
X-Gm-Message-State: AOAM533Aoa8NjWFsu/9zMi+olT8JbAUzZ8b0iTURyZE9La8Dyl08EMCl
 eDhlhgRaJ0bVe7H1NrvQJR2NnA==
X-Google-Smtp-Source: ABdhPJx20sFSUg3de52em0vd/uTVsILZfOK1KEmPzHkl+qnp4ZfHsYbDLotnFZ1waus/l3P6oMcYWg==
X-Received: by 2002:a7b:c5c1:: with SMTP id n1mr14817049wmk.163.1612792847863; 
 Mon, 08 Feb 2021 06:00:47 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h14sm19169554wmq.39.2021.02.08.06.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 06:00:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A75841FF7E;
 Mon,  8 Feb 2021 14:00:45 +0000 (GMT)
References: <20210207232310.2505283-1-f4bug@amsat.org>
 <20210207232310.2505283-2-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH v2 1/6] target: Replace tcg_debug_assert() by assert()
Date: Mon, 08 Feb 2021 13:54:31 +0000
In-reply-to: <20210207232310.2505283-2-f4bug@amsat.org>
Message-ID: <87a6sebqwi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-riscv@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Since commit 262a69f4282 ("osdep.h: Prohibit disabling assert()
> in supported builds") we can not build QEMU with assert() disabled.
>
> tcg_debug_assert() does nothing until QEMU is configured with
> --enable-debug-tcg.
>
> Since there is no obvious logic whether to use tcg_debug_assert()
> or assert() for files under target/, simplify by using plain
> assert() everywhere. Keep tcg_debug_assert() for the tcg/ and
> accel/ directories.

I think generally tcg_debug_asserts are those that:

  - assert the TCG logic is working correctly
  - would impose a cost on the hotpath if run in "production"

Arguably all of these are on the translation front-end side and are
guards against changes being made to the front-end that violate the API
contract with the rest of the code. They are unlikely to be triggered by
running different code.

Usually these mask or zero checks are fairly cheap on modern hardware
but we can hit these checks fairly frequently. Have you measured any
performance change?

>
> Patch created mechanically using:
>
>   $ sed -i s/tcg_debug_assert/assert/ \
>       $(git grep -l tcg_debug_assert target/)
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> If there is a logic, we should document it, and include "tcg/tcg.h"
> in these files.
> ---
>  target/arm/translate.h                  |  4 +--
>  target/arm/mte_helper.c                 |  4 +--
>  target/arm/sve_helper.c                 |  8 +++---
>  target/arm/translate-a64.c              | 12 ++++-----
>  target/arm/translate-sve.c              |  4 +--
>  target/arm/translate.c                  | 36 ++++++++++++-------------
>  target/hppa/translate.c                 |  4 +--
>  target/rx/op_helper.c                   |  6 ++---
>  target/rx/translate.c                   | 14 +++++-----
>  target/sh4/translate.c                  |  4 +--
>  target/riscv/insn_trans/trans_rvv.c.inc |  2 +-
>  11 files changed, 49 insertions(+), 49 deletions(-)
>
> diff --git a/target/arm/translate.h b/target/arm/translate.h
> index 423b0e08df0..e2ddf87629c 100644
> --- a/target/arm/translate.h
> +++ b/target/arm/translate.h
> @@ -220,7 +220,7 @@ static inline void set_pstate_bits(uint32_t bits)
>  {
>      TCGv_i32 p =3D tcg_temp_new_i32();
>=20=20
> -    tcg_debug_assert(!(bits & CACHED_PSTATE_BITS));
> +    assert(!(bits & CACHED_PSTATE_BITS));
>=20=20
>      tcg_gen_ld_i32(p, cpu_env, offsetof(CPUARMState, pstate));
>      tcg_gen_ori_i32(p, p, bits);
> @@ -233,7 +233,7 @@ static inline void clear_pstate_bits(uint32_t bits)
>  {
>      TCGv_i32 p =3D tcg_temp_new_i32();
>=20=20
> -    tcg_debug_assert(!(bits & CACHED_PSTATE_BITS));
> +    assert(!(bits & CACHED_PSTATE_BITS));
>=20=20
>      tcg_gen_ld_i32(p, cpu_env, offsetof(CPUARMState, pstate));
>      tcg_gen_andi_i32(p, p, ~bits);
> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
> index 153bd1e9df8..6cea9d1b506 100644
> --- a/target/arm/mte_helper.c
> +++ b/target/arm/mte_helper.c
> @@ -166,8 +166,8 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, =
int ptr_mmu_idx,
>       * not set in the cputlb lookup above.
>       */
>      mr =3D memory_region_from_host(host, &ptr_ra);
> -    tcg_debug_assert(mr !=3D NULL);
> -    tcg_debug_assert(memory_region_is_ram(mr));
> +    assert(mr !=3D NULL);
> +    assert(memory_region_is_ram(mr));
>      ptr_paddr =3D ptr_ra;
>      do {
>          ptr_paddr +=3D mr->addr;
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 844db08bd57..c8cdf7618eb 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -4030,7 +4030,7 @@ static intptr_t find_next_active(uint64_t *vg, intp=
tr_t reg_off,
>      reg_off +=3D ctz64(pg);
>=20=20
>      /* We should never see an out of range predicate bit set.  */
> -    tcg_debug_assert(reg_off < reg_max);
> +    assert(reg_off < reg_max);
>      return reg_off;
>  }
>=20=20
> @@ -4186,7 +4186,7 @@ static bool sve_cont_ldst_elements(SVEContLdSt *inf=
o, target_ulong addr,
>          /* No active elements, no pages touched. */
>          return false;
>      }
> -    tcg_debug_assert(reg_off_last >=3D 0 && reg_off_last < reg_max);
> +    assert(reg_off_last >=3D 0 && reg_off_last < reg_max);
>=20=20
>      info->reg_off_first[0] =3D reg_off_first;
>      info->mem_off_first[0] =3D (reg_off_first >> esz) * msize;
> @@ -4235,7 +4235,7 @@ static bool sve_cont_ldst_elements(SVEContLdSt *inf=
o, target_ulong addr,
>       * this may affect the address reported in an exception.
>       */
>      reg_off_split =3D find_next_active(vg, reg_off_split, reg_max, esz);
> -    tcg_debug_assert(reg_off_split <=3D reg_off_last);
> +    assert(reg_off_split <=3D reg_off_last);
>      info->reg_off_first[1] =3D reg_off_split;
>      info->mem_off_first[1] =3D (reg_off_split >> esz) * msize;
>      info->reg_off_last[1] =3D reg_off_last;
> @@ -4794,7 +4794,7 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, cons=
t target_ulong addr,
>      /* Probe the page(s). */
>      if (!sve_cont_ldst_pages(&info, fault, env, addr, MMU_DATA_LOAD, ret=
addr)) {
>          /* Fault on first element. */
> -        tcg_debug_assert(fault =3D=3D FAULT_NO);
> +        assert(fault =3D=3D FAULT_NO);
>          memset(vd, 0, reg_max);
>          goto do_fault;
>      }
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index ffc060e5d70..f570506133c 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -144,7 +144,7 @@ static void set_btype(DisasContext *s, int val)
>      TCGv_i32 tcg_val;
>=20=20
>      /* BTYPE is a 2-bit field, and 0 should be done with reset_btype.  */
> -    tcg_debug_assert(val >=3D 1 && val <=3D 3);
> +    assert(val >=3D 1 && val <=3D 3);
>=20=20
>      tcg_val =3D tcg_const_i32(val);
>      tcg_gen_st_i32(tcg_val, cpu_env, offsetof(CPUARMState, btype));
> @@ -10659,7 +10659,7 @@ static void handle_vec_simd_shri(DisasContext *s,=
 bool is_q, bool is_u,
>          unallocated_encoding(s);
>          return;
>      }
> -    tcg_debug_assert(size <=3D 3);
> +    assert(size <=3D 3);
>=20=20
>      if (!fp_access_check(s)) {
>          return;
> @@ -12812,7 +12812,7 @@ static void disas_simd_two_reg_misc(DisasContext =
*s, uint32_t insn)
>          /* Coverity claims (size =3D=3D 3 && !is_q) has been eliminated
>           * from all paths leading to here.
>           */
> -        tcg_debug_assert(is_q);
> +        assert(is_q);
>          for (pass =3D 0; pass < 2; pass++) {
>              TCGv_i64 tcg_op =3D tcg_temp_new_i64();
>              TCGv_i64 tcg_res =3D tcg_temp_new_i64();
> @@ -14615,7 +14615,7 @@ static void disas_a64_insn(CPUARMState *env, Disa=
sContext *s)
>              s->guarded_page =3D is_guarded_page(env, s);
>=20=20
>              /* First insn can have btype set to non-zero.  */
> -            tcg_debug_assert(s->btype >=3D 0);
> +            assert(s->btype >=3D 0);
>=20=20
>              /*
>               * Note that the Branch Target Exception has fairly high
> @@ -14633,7 +14633,7 @@ static void disas_a64_insn(CPUARMState *env, Disa=
sContext *s)
>              }
>          } else {
>              /* Not the first insn: btype must be 0.  */
> -            tcg_debug_assert(s->btype =3D=3D 0);
> +            assert(s->btype =3D=3D 0);
>          }
>      }
>=20=20
> @@ -14733,7 +14733,7 @@ static void aarch64_tr_init_disas_context(DisasCo=
ntextBase *dcbase,
>=20=20
>  #ifdef CONFIG_USER_ONLY
>      /* In sve_probe_page, we assume TBI is enabled. */
> -    tcg_debug_assert(dc->tbid & 1);
> +    assert(dc->tbid & 1);
>  #endif
>=20=20
>      /* Single step state. The code-generation logic here is:
> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index 27402af23c0..a1e327f863e 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -3938,8 +3938,8 @@ static bool trans_FCMLA_zzxz(DisasContext *s, arg_F=
CMLA_zzxz *a)
>          gen_helper_gvec_fcmlas_idx,
>      };
>=20=20
> -    tcg_debug_assert(a->esz =3D=3D 1 || a->esz =3D=3D 2);
> -    tcg_debug_assert(a->rd =3D=3D a->ra);
> +    assert(a->esz =3D=3D 1 || a->esz =3D=3D 2);
> +    assert(a->rd =3D=3D a->ra);
>      if (sve_access_check(s)) {
>          unsigned vsz =3D vec_full_reg_size(s);
>          TCGv_ptr status =3D fpstatus_ptr(a->esz =3D=3D MO_16 ? FPST_FPCR=
_F16 : FPST_FPCR);
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 1653cca1aaa..04ebfcc0d6d 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -2972,7 +2972,7 @@ void gen_gvec_sqrdmlah_qc(unsigned vece, uint32_t r=
d_ofs, uint32_t rn_ofs,
>      static gen_helper_gvec_3_ptr * const fns[2] =3D {
>          gen_helper_gvec_qrdmlah_s16, gen_helper_gvec_qrdmlah_s32
>      };
> -    tcg_debug_assert(vece >=3D 1 && vece <=3D 2);
> +    assert(vece >=3D 1 && vece <=3D 2);
>      gen_gvec_fn3_qc(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, fns[vece - 1=
]);
>  }
>=20=20
> @@ -2982,7 +2982,7 @@ void gen_gvec_sqrdmlsh_qc(unsigned vece, uint32_t r=
d_ofs, uint32_t rn_ofs,
>      static gen_helper_gvec_3_ptr * const fns[2] =3D {
>          gen_helper_gvec_qrdmlsh_s16, gen_helper_gvec_qrdmlsh_s32
>      };
> -    tcg_debug_assert(vece >=3D 1 && vece <=3D 2);
> +    assert(vece >=3D 1 && vece <=3D 2);
>      gen_gvec_fn3_qc(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, fns[vece - 1=
]);
>  }
>=20=20
> @@ -3105,8 +3105,8 @@ void gen_gvec_ssra(unsigned vece, uint32_t rd_ofs, =
uint32_t rm_ofs,
>      };
>=20=20
>      /* tszimm encoding produces immediates in the range [1..esize]. */
> -    tcg_debug_assert(shift > 0);
> -    tcg_debug_assert(shift <=3D (8 << vece));
> +    assert(shift > 0);
> +    assert(shift <=3D (8 << vece));
>=20=20
>      /*
>       * Shifts larger than the element size are architecturally valid.
> @@ -3181,8 +3181,8 @@ void gen_gvec_usra(unsigned vece, uint32_t rd_ofs, =
uint32_t rm_ofs,
>      };
>=20=20
>      /* tszimm encoding produces immediates in the range [1..esize]. */
> -    tcg_debug_assert(shift > 0);
> -    tcg_debug_assert(shift <=3D (8 << vece));
> +    assert(shift > 0);
> +    assert(shift <=3D (8 << vece));
>=20=20
>      /*
>       * Shifts larger than the element size are architecturally valid.
> @@ -3290,8 +3290,8 @@ void gen_gvec_srshr(unsigned vece, uint32_t rd_ofs,=
 uint32_t rm_ofs,
>      };
>=20=20
>      /* tszimm encoding produces immediates in the range [1..esize] */
> -    tcg_debug_assert(shift > 0);
> -    tcg_debug_assert(shift <=3D (8 << vece));
> +    assert(shift > 0);
> +    assert(shift <=3D (8 << vece));
>=20=20
>      if (shift =3D=3D (8 << vece)) {
>          /*
> @@ -3386,8 +3386,8 @@ void gen_gvec_srsra(unsigned vece, uint32_t rd_ofs,=
 uint32_t rm_ofs,
>      };
>=20=20
>      /* tszimm encoding produces immediates in the range [1..esize] */
> -    tcg_debug_assert(shift > 0);
> -    tcg_debug_assert(shift <=3D (8 << vece));
> +    assert(shift > 0);
> +    assert(shift <=3D (8 << vece));
>=20=20
>      /*
>       * Shifts larger than the element size are architecturally valid.
> @@ -3491,8 +3491,8 @@ void gen_gvec_urshr(unsigned vece, uint32_t rd_ofs,=
 uint32_t rm_ofs,
>      };
>=20=20
>      /* tszimm encoding produces immediates in the range [1..esize] */
> -    tcg_debug_assert(shift > 0);
> -    tcg_debug_assert(shift <=3D (8 << vece));
> +    assert(shift > 0);
> +    assert(shift <=3D (8 << vece));
>=20=20
>      if (shift =3D=3D (8 << vece)) {
>          /*
> @@ -3606,8 +3606,8 @@ void gen_gvec_ursra(unsigned vece, uint32_t rd_ofs,=
 uint32_t rm_ofs,
>      };
>=20=20
>      /* tszimm encoding produces immediates in the range [1..esize] */
> -    tcg_debug_assert(shift > 0);
> -    tcg_debug_assert(shift <=3D (8 << vece));
> +    assert(shift > 0);
> +    assert(shift <=3D (8 << vece));
>=20=20
>      tcg_gen_gvec_2i(rd_ofs, rm_ofs, opr_sz, max_sz, shift, &ops[vece]);
>  }
> @@ -3695,8 +3695,8 @@ void gen_gvec_sri(unsigned vece, uint32_t rd_ofs, u=
int32_t rm_ofs,
>      };
>=20=20
>      /* tszimm encoding produces immediates in the range [1..esize]. */
> -    tcg_debug_assert(shift > 0);
> -    tcg_debug_assert(shift <=3D (8 << vece));
> +    assert(shift > 0);
> +    assert(shift <=3D (8 << vece));
>=20=20
>      /* Shift of esize leaves destination unchanged. */
>      if (shift < (8 << vece)) {
> @@ -3788,8 +3788,8 @@ void gen_gvec_sli(unsigned vece, uint32_t rd_ofs, u=
int32_t rm_ofs,
>      };
>=20=20
>      /* tszimm encoding produces immediates in the range [0..esize-1]. */
> -    tcg_debug_assert(shift >=3D 0);
> -    tcg_debug_assert(shift < (8 << vece));
> +    assert(shift >=3D 0);
> +    assert(shift < (8 << vece));
>=20=20
>      if (shift =3D=3D 0) {
>          tcg_gen_gvec_mov(vece, rd_ofs, rm_ofs, opr_sz, max_sz);
> diff --git a/target/hppa/translate.c b/target/hppa/translate.c
> index 64af1e0d5cc..ceb3bacc7dd 100644
> --- a/target/hppa/translate.c
> +++ b/target/hppa/translate.c
> @@ -1945,8 +1945,8 @@ static bool do_ibranch(DisasContext *ctx, TCGv_reg =
dest,
>             for the indirect branch consumes no special resources, we
>             can (conditionally) skip B and continue execution.  */
>          /* The use_nullify_skip test implies we have a known control pat=
h.  */
> -        tcg_debug_assert(ctx->iaoq_b !=3D -1);
> -        tcg_debug_assert(ctx->iaoq_n !=3D -1);
> +        assert(ctx->iaoq_b !=3D -1);
> +        assert(ctx->iaoq_n !=3D -1);
>=20=20
>          /* We do have to handle the non-local temporary, DEST, before
>             branching.  Since IOAQ_F is not really live at this point, we
> diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
> index 4d315b44492..03d285fbafe 100644
> --- a/target/rx/op_helper.c
> +++ b/target/rx/op_helper.c
> @@ -234,7 +234,7 @@ static void (* const cpu_stfn[])(CPUArchState *env,
>=20=20
>  void helper_sstr(CPURXState *env, uint32_t sz)
>  {
> -    tcg_debug_assert(sz < 3);
> +    assert(sz < 3);
>      while (env->regs[3] !=3D 0) {
>          cpu_stfn[sz](env, env->regs[1], env->regs[2], GETPC());
>          env->regs[1] +=3D 1 << sz;
> @@ -283,7 +283,7 @@ void helper_smovb(CPURXState *env)
>  void helper_suntil(CPURXState *env, uint32_t sz)
>  {
>      uint32_t tmp;
> -    tcg_debug_assert(sz < 3);
> +    assert(sz < 3);
>      if (env->regs[3] =3D=3D 0) {
>          return ;
>      }
> @@ -302,7 +302,7 @@ void helper_suntil(CPURXState *env, uint32_t sz)
>  void helper_swhile(CPURXState *env, uint32_t sz)
>  {
>      uint32_t tmp;
> -    tcg_debug_assert(sz < 3);
> +    assert(sz < 3);
>      if (env->regs[3] =3D=3D 0) {
>          return ;
>      }
> diff --git a/target/rx/translate.c b/target/rx/translate.c
> index 9ea941c6302..ff12af4f7f8 100644
> --- a/target/rx/translate.c
> +++ b/target/rx/translate.c
> @@ -87,7 +87,7 @@ static uint32_t li(DisasContext *ctx, int sz)
>      CPURXState *env =3D ctx->env;
>      addr =3D ctx->base.pc_next;
>=20=20
> -    tcg_debug_assert(sz < 4);
> +    assert(sz < 4);
>      switch (sz) {
>      case 1:
>          ctx->base.pc_next +=3D 1;
> @@ -201,7 +201,7 @@ static inline TCGv rx_index_addr(DisasContext *ctx, T=
CGv mem,
>  {
>      uint32_t dsp;
>=20=20
> -    tcg_debug_assert(ld < 3);
> +    assert(ld < 3);
>      switch (ld) {
>      case 0:
>          return cpu_regs[reg];
> @@ -222,7 +222,7 @@ static inline TCGv rx_index_addr(DisasContext *ctx, T=
CGv mem,
>  static inline MemOp mi_to_mop(unsigned mi)
>  {
>      static const MemOp mop[5] =3D { MO_SB, MO_SW, MO_UL, MO_UW, MO_UB };
> -    tcg_debug_assert(mi < 5);
> +    assert(mi < 5);
>      return mop[mi];
>  }
>=20=20
> @@ -258,7 +258,7 @@ static int is_privileged(DisasContext *ctx, int is_ex=
ception)
>  /* generate QEMU condition */
>  static void psw_cond(DisasCompare *dc, uint32_t cond)
>  {
> -    tcg_debug_assert(cond < 16);
> +    assert(cond < 16);
>      switch (cond) {
>      case 0: /* z */
>          dc->cond =3D TCG_COND_EQ;
> @@ -1401,7 +1401,7 @@ static inline void shiftr_imm(uint32_t rd, uint32_t=
 rs, uint32_t imm,
>      static void (* const gen_sXri[])(TCGv ret, TCGv arg1, int arg2) =3D {
>          tcg_gen_shri_i32, tcg_gen_sari_i32,
>      };
> -    tcg_debug_assert(alith < 2);
> +    assert(alith < 2);
>      if (imm) {
>          gen_sXri[alith](cpu_regs[rd], cpu_regs[rs], imm - 1);
>          tcg_gen_andi_i32(cpu_psw_c, cpu_regs[rd], 0x00000001);
> @@ -1425,7 +1425,7 @@ static inline void shiftr_reg(uint32_t rd, uint32_t=
 rs, unsigned int alith)
>      static void (* const gen_sXr[])(TCGv ret, TCGv arg1, TCGv arg2) =3D {
>          tcg_gen_shr_i32, tcg_gen_sar_i32,
>      };
> -    tcg_debug_assert(alith < 2);
> +    assert(alith < 2);
>      noshift =3D gen_new_label();
>      done =3D gen_new_label();
>      count =3D tcg_temp_new();
> @@ -2282,7 +2282,7 @@ static bool trans_INT(DisasContext *ctx, arg_INT *a)
>  {
>      TCGv vec;
>=20=20
> -    tcg_debug_assert(a->imm < 0x100);
> +    assert(a->imm < 0x100);
>      vec =3D tcg_const_i32(a->imm);
>      tcg_gen_movi_i32(cpu_pc, ctx->base.pc_next);
>      gen_helper_rxint(cpu_env, vec);
> diff --git a/target/sh4/translate.c b/target/sh4/translate.c
> index 93127906237..f12cc0830bf 100644
> --- a/target/sh4/translate.c
> +++ b/target/sh4/translate.c
> @@ -339,7 +339,7 @@ static void gen_delayed_conditional_jump(DisasContext=
 * ctx)
>  static inline void gen_load_fpr64(DisasContext *ctx, TCGv_i64 t, int reg)
>  {
>      /* We have already signaled illegal instruction for odd Dr.  */
> -    tcg_debug_assert((reg & 1) =3D=3D 0);
> +    assert((reg & 1) =3D=3D 0);
>      reg ^=3D ctx->fbank;
>      tcg_gen_concat_i32_i64(t, cpu_fregs[reg + 1], cpu_fregs[reg]);
>  }
> @@ -347,7 +347,7 @@ static inline void gen_load_fpr64(DisasContext *ctx, =
TCGv_i64 t, int reg)
>  static inline void gen_store_fpr64(DisasContext *ctx, TCGv_i64 t, int re=
g)
>  {
>      /* We have already signaled illegal instruction for odd Dr.  */
> -    tcg_debug_assert((reg & 1) =3D=3D 0);
> +    assert((reg & 1) =3D=3D 0);
>      reg ^=3D ctx->fbank;
>      tcg_gen_extr_i64_i32(cpu_fregs[reg + 1], cpu_fregs[reg], t);
>  }
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
> index 887c6b88831..f0e6e844f5f 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -992,7 +992,7 @@ static void tcg_gen_gvec_rsubs(unsigned vece, uint32_=
t dofs, uint32_t aofs,
>            .vece =3D MO_64 },
>      };
>=20=20
> -    tcg_debug_assert(vece <=3D MO_64);
> +    assert(vece <=3D MO_64);
>      tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, c, &rsub_op[vece]);
>  }


--=20
Alex Benn=C3=A9e

