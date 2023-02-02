Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F02687F75
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 15:00:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNa84-0000hp-FE; Thu, 02 Feb 2023 08:59:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pNa80-0000hA-V0
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:59:52 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pNa7y-0000W2-1g
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:59:51 -0500
Received: by mail-ed1-x532.google.com with SMTP id cw4so2044894edb.13
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 05:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zkMNL+kRpt0Zn2pJ+rCwwz97utSU2iggLFUmWWm0ckY=;
 b=muHaMeX2r1LUchnDfPO3NJMRQMWk15Y3QVEXk3fvwRbhLqOG/JNffh8zYGZBR3dv6K
 TsokH+phAT3+0Gv7xNujIe6TE7S4nzBdac+/10jaXYpnj6Tz5zgSxS+lADrlgX4lEce3
 Ga8uCtbOTFFrTT0afl3sPHjO1PATPw8/0aypfEY4p3cmXLt6zhWCE6MK0TUl8DVe5wPL
 771ITPVh6+enjuJMkYCjZ/rkG6XlXD2QJv0OCueGbnHnF66Fi623kdo/cleevt7Kyy17
 Cu4Z/jR/ZcaIJKMe8fDQYIM7rc6csDTvHOxLgGP2mqpn7RqxF6YMq6mKU2S58Sg0j3ZR
 4uEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zkMNL+kRpt0Zn2pJ+rCwwz97utSU2iggLFUmWWm0ckY=;
 b=zP4M7zFi35vNDCBcE6hgGfGudFF1yZ6Whv8xuIqkbqWXJLUaD1SNmR9AlA8roKlF+K
 ADGy8iSlyR7fx1r4cUy67e/Upk/KEXtiMcksYPd9LgDS8Tb+1QufIf3tRAm3QsYzYuLU
 0+YbIXDZ9M4z6/43v9Rcf+UXlfxCwBeHDx4bUbsj3s6Kk/OkrGfJ3dACLzkLWhHb7K3G
 5D5uXfA2iZg4J9jzTl9QoLIoFukdlWrEsza0v0iV83C+pvKsLSdH13+CmItnllyW569n
 wW4qMRyoI6FEu+4o172r6hfGqxT1CgMAf8cmrwmVZYGmH861B629PL4gXLWLbzjgab5K
 VTZg==
X-Gm-Message-State: AO0yUKX5IYfaLRYOKx5V5b4a7AXftkotH4KiAoVUm5DttDUyhwSnPiiu
 HGnoDF26opxW1p07zp8u81dt/pSUoyNFrjUrsiMZ7A==
X-Google-Smtp-Source: AK7set+3fl/RCKAikzpag4uGNJ5zQW6ILWkxqgdbJDDGArolDbb1LfUQyzF7bYr2xrSKtHZ+nXtlHL34+oaGVXj58Pc=
X-Received: by 2002:a05:6402:294f:b0:499:b60f:5741 with SMTP id
 ed15-20020a056402294f00b00499b60f5741mr1937347edb.80.1675346388016; Thu, 02
 Feb 2023 05:59:48 -0800 (PST)
MIME-Version: 1.0
References: <20230202124230.295997-1-lawrence.hunter@codethink.co.uk>
 <20230202124230.295997-4-lawrence.hunter@codethink.co.uk>
In-Reply-To: <20230202124230.295997-4-lawrence.hunter@codethink.co.uk>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Thu, 2 Feb 2023 14:59:36 +0100
Message-ID: <CAAeLtUAZG9DmPL7r8vmhbwoJ9_JQBZBez1jb-xMGXj5iVQ4P=g@mail.gmail.com>
Subject: Re: [PATCH 03/39] target/riscv: Add vclmul.vx decoding, translation
 and execution support
To: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Cc: qemu-devel@nongnu.org, dickon.hood@codethink.co.uk, 
 nazar.kazakov@codethink.co.uk, kiran.ostrolenk@codethink.co.uk, 
 frank.chang@sifive.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, pbonzini@redhat.com, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 2 Feb 2023 at 13:42, Lawrence Hunter
<lawrence.hunter@codethink.co.uk> wrote:
>

Please split off the refactoring.
See below for more comments.

> Co-authored-by: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
> Co-authored-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
> Signed-off-by: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
> Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
> Signed-off-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
> ---
>  target/riscv/helper.h                      |  1 +
>  target/riscv/insn32.decode                 |  1 +
>  target/riscv/insn_trans/trans_rvzvkb.c.inc | 54 ++++++++++++++++++++++
>  target/riscv/vcrypto_helper.c              | 12 +++++
>  target/riscv/vector_helper.c               | 36 ---------------
>  target/riscv/vector_internals.c            | 24 ++++++++++
>  target/riscv/vector_internals.h            | 16 +++++++
>  7 files changed, 108 insertions(+), 36 deletions(-)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index e9127c9ccb..6c786ef6f3 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1139,3 +1139,4 @@ DEF_HELPER_FLAGS_3(sm4ks, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
>
>  /* Vector crypto functions */
>  DEF_HELPER_6(vclmul_vv, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vclmul_vx, void, ptr, ptr, tl, ptr, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 5ddee69d60..4a7421354d 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -893,3 +893,4 @@ sm4ks       .. 11010 ..... ..... 000 ..... 0110011 @k_aes
>
>  # *** RV64 Zvkb vector crypto extension ***
>  vclmul_vv       001100 . ..... ..... 010 ..... 1010111 @r_vm
> +vclmul_vx       001100 . ..... ..... 110 ..... 1010111 @r_vm
> diff --git a/target/riscv/insn_trans/trans_rvzvkb.c.inc b/target/riscv/insn_trans/trans_rvzvkb.c.inc
> index fb1995f737..6e8b81136c 100644
> --- a/target/riscv/insn_trans/trans_rvzvkb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzvkb.c.inc
> @@ -39,3 +39,57 @@ static bool vclmul_vv_check(DisasContext *s, arg_rmrr *a)
>  }
>
>  GEN_VV_MASKED_TRANS(vclmul_vv, vclmul_vv_check)
> +
> +#define GEN_VX_MASKED_TRANS(NAME, CHECK)                                \
> +static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                  \
> +{                                                                       \
> +    if (CHECK(s, a)) {                                                  \
> +        TCGv_ptr rd_v, v0_v, rs2_v;                                     \
> +        TCGv rs1;                                                       \
> +        TCGv_i32 desc;                                                  \
> +        uint32_t data = 0;                                              \
> +                                                                        \
> +        TCGLabel *over = gen_new_label();                               \
> +        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);               \
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);      \
> +                                                                        \
> +        data = FIELD_DP32(data, VDATA, VM, a->vm);                      \
> +        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);                  \
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);                    \
> +        data = FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);  \
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);                    \
> +                                                                        \
> +        rd_v = tcg_temp_new_ptr();                                      \
> +        v0_v = tcg_temp_new_ptr();                                      \
> +        rs1 = get_gpr(s, a->rs1, EXT_ZERO);                             \
> +        rs2_v = tcg_temp_new_ptr();                                     \
> +        desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,         \
> +                                          s->cfg_ptr->vlen / 8, data)); \
> +        tcg_gen_addi_ptr(rd_v, cpu_env, vreg_ofs(s, a->rd));            \
> +        tcg_gen_addi_ptr(v0_v, cpu_env, vreg_ofs(s, 0));                \
> +        tcg_gen_addi_ptr(rs2_v, cpu_env, vreg_ofs(s, a->rs2));          \
> +        gen_helper_##NAME(rd_v, v0_v, rs1, rs2_v, cpu_env, desc);       \
> +        tcg_temp_free_ptr(rd_v);                                        \
> +        tcg_temp_free_ptr(v0_v);                                        \
> +        tcg_temp_free_ptr(rs2_v);                                       \
> +                                                                        \
> +        mark_vs_dirty(s);                                               \
> +        gen_set_label(over);                                            \
> +        return true;                                                    \
> +    }                                                                   \
> +    return false;                                                       \
> +}

Why not reuse the opivx_trans() function that is already present and
call that from this macro?

> +
> +static bool zvkb_vx_check(DisasContext *s, arg_rmrr *a)
> +{
> +    return opivx_check(s, a) &&
> +           s->cfg_ptr->ext_zvkb == true;
> +}
> +
> +static bool vclmul_vx_check(DisasContext *s, arg_rmrr *a)
> +{
> +    return zvkb_vx_check(s, a) &&
> +           s->sew == MO_64;
> +}
> +
> +GEN_VX_MASKED_TRANS(vclmul_vx, vclmul_vx_check)
> diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
> index 8a11e56754..c453d348ad 100644
> --- a/target/riscv/vcrypto_helper.c
> +++ b/target/riscv/vcrypto_helper.c
> @@ -20,4 +20,16 @@ static void do_vclmul_vv(void *vd, void *vs1, void *vs2, int i)
>      ((uint64_t *)vd)[i] = result;
>  }
>
> +static void do_vclmul_vx(void *vd, target_long rs1, void *vs2, int i)
> +{
> +    uint64_t result = 0;
> +    for (int j = 63; j >= 0; j--) {
> +        if ((rs1 >> j) & 1) {
> +            result ^= (((uint64_t *)vs2)[i] << j);
> +        }
> +    }
> +    ((uint64_t *)vd)[i] = result;
> +}

This can be dropped, if you use the clmul64() I had proposed in the
previous patch review.
You can then use the existing generator macros:

RVVCALL(OPIVV2, vclmul_vv_d, OP_UUU_D, H8, H8, H8, clmul64)
RVVCALL(OPIVX2, vclmul_vx_d, OP_UUU_D, H8, H8, clmul64)
GEN_VEXT_VV(vclmul_vv_d, 8)
GEN_VEXT_VX(vclmul_vx_d, 8)

> +
>  GEN_VEXT_VV(vclmul_vv, 8)
> +GEN_VEXT_VX(vclmul_vx, 8)
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index def1b21414..ab470092f6 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -747,8 +747,6 @@ GEN_VEXT_VV(vsub_vv_h, 2)
>  GEN_VEXT_VV(vsub_vv_w, 4)
>  GEN_VEXT_VV(vsub_vv_d, 8)
>
> -typedef void opivx2_fn(void *vd, target_long s1, void *vs2, int i);
> -
>  /*
>   * (T1)s1 gives the real operator type.
>   * (TX1)(T1)s1 expands the operator type of widen or narrow operations.
> @@ -773,40 +771,6 @@ RVVCALL(OPIVX2, vrsub_vx_h, OP_SSS_H, H2, H2, DO_RSUB)
>  RVVCALL(OPIVX2, vrsub_vx_w, OP_SSS_W, H4, H4, DO_RSUB)
>  RVVCALL(OPIVX2, vrsub_vx_d, OP_SSS_D, H8, H8, DO_RSUB)
>
> -static void do_vext_vx(void *vd, void *v0, target_long s1, void *vs2,
> -                       CPURISCVState *env, uint32_t desc,
> -                       opivx2_fn fn, uint32_t esz)
> -{
> -    uint32_t vm = vext_vm(desc);
> -    uint32_t vl = env->vl;
> -    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> -    uint32_t vta = vext_vta(desc);
> -    uint32_t vma = vext_vma(desc);
> -    uint32_t i;
> -
> -    for (i = env->vstart; i < vl; i++) {
> -        if (!vm && !vext_elem_mask(v0, i)) {
> -            /* set masked-off elements to 1s */
> -            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);
> -            continue;
> -        }
> -        fn(vd, s1, vs2, i);
> -    }
> -    env->vstart = 0;
> -    /* set tail elements to 1s */
> -    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);
> -}
> -
> -/* generate the helpers for OPIVX */
> -#define GEN_VEXT_VX(NAME, ESZ)                            \
> -void HELPER(NAME)(void *vd, void *v0, target_ulong s1,    \
> -                  void *vs2, CPURISCVState *env,          \
> -                  uint32_t desc)                          \
> -{                                                         \
> -    do_vext_vx(vd, v0, s1, vs2, env, desc,                \
> -               do_##NAME, ESZ);                           \
> -}
> -
>  GEN_VEXT_VX(vadd_vx_b, 1)
>  GEN_VEXT_VX(vadd_vx_h, 2)
>  GEN_VEXT_VX(vadd_vx_w, 4)
> diff --git a/target/riscv/vector_internals.c b/target/riscv/vector_internals.c
> index a264797882..b23fa4dd74 100644
> --- a/target/riscv/vector_internals.c
> +++ b/target/riscv/vector_internals.c
> @@ -37,3 +37,27 @@ void do_vext_vv(void *vd, void *v0, void *vs1, void *vs2,
>      /* set tail elements to 1s */
>      vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);
>  }
> +
> +void do_vext_vx(void *vd, void *v0, target_long s1, void *vs2,
> +                CPURISCVState *env, uint32_t desc,
> +                opivx2_fn fn, uint32_t esz)
> +{
> +    uint32_t vm = vext_vm(desc);
> +    uint32_t vl = env->vl;
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> +    uint32_t vta = vext_vta(desc);
> +    uint32_t vma = vext_vma(desc);
> +    uint32_t i;
> +
> +    for (i = env->vstart; i < vl; i++) {
> +        if (!vm && !vext_elem_mask(v0, i)) {
> +            /* set masked-off elements to 1s */
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);
> +            continue;
> +        }
> +        fn(vd, s1, vs2, i);
> +    }
> +    env->vstart = 0;
> +    /* set tail elements to 1s */
> +    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);
> +}
> diff --git a/target/riscv/vector_internals.h b/target/riscv/vector_internals.h
> index f61803acc0..49529d2379 100644
> --- a/target/riscv/vector_internals.h
> +++ b/target/riscv/vector_internals.h
> @@ -113,4 +113,20 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
>                 do_##NAME, ESZ);                           \
>  }
>
> +typedef void opivx2_fn(void *vd, target_long s1, void *vs2, int i);
> +
> +void do_vext_vx(void *vd, void *v0, target_long s1, void *vs2,
> +                CPURISCVState *env, uint32_t desc,
> +                opivx2_fn fn, uint32_t esz);
> +
> +/* generate the helpers for OPIVX */
> +#define GEN_VEXT_VX(NAME, ESZ)                            \
> +void HELPER(NAME)(void *vd, void *v0, target_ulong s1,    \
> +                  void *vs2, CPURISCVState *env,          \
> +                  uint32_t desc)                          \
> +{                                                         \
> +    do_vext_vx(vd, v0, s1, vs2, env, desc,                \
> +               do_##NAME, ESZ);                           \
> +}
> +
>  #endif /* TARGET_RISCV_VECTOR_INTERNAL_H */
> --
> 2.39.1
>

