Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E6A1850F0
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 22:23:33 +0100 (CET)
Received: from localhost ([::1]:37402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCrmF-0007N3-Hy
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 17:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45045)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jCrl5-0006Nq-2A
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 17:22:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jCrl2-0006Iq-PB
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 17:22:18 -0400
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42]:36858)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jCrl2-0006FA-KE; Fri, 13 Mar 2020 17:22:16 -0400
Received: by mail-qv1-xf42.google.com with SMTP id r15so5446756qve.3;
 Fri, 13 Mar 2020 14:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iaPG96cBszrJODIvg1CHPuev3MpsHDmHdZ1W6yx/U/Y=;
 b=WepSAZSPVDMmBKkWU97Mg2Kom8SxuTH4P0rYczVl1zVNjSvlzxN+ExXu2QoD8C6Dro
 NDVYiKK5v1BikQRhTVlYEARwNclbsM07ib8+Gmny7Ym+77IL6nsvjdcuR/Z4UX3yokuJ
 x8Ym/xBnezh64cxVWlyY2Xed3bslJ+y8y4ygELyTuW1qOR4BYNJJ9jpV9JJEnKuGZl8U
 OI7twi063woEjtVAx8PwQpeoZbEQhzDS69pRaQFs+MJMnOB5HSH7GBisAAKpBhIc0IJH
 mv0arxbkELXKF7K5oIXakroG7CzwrlB7HfjEfwj2WmnHLPu8HOR2M5Zdk/BFnMBdocZy
 s7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iaPG96cBszrJODIvg1CHPuev3MpsHDmHdZ1W6yx/U/Y=;
 b=snkQGLpnz4uXr634/JcjnY7i35K+MVbMNsxI7YEdeBvOxdHnHHC1zvNr5QhNLMfNmv
 5DOP8+I7+xKjnbqOzEv/65ADW1HDyPO7SwCeLKV440DSI8Pn6qRmAwZOg9KExf0EJ1OT
 /oR8LKcwDbd99P2VLMH47U8lk+y9iTQ2HKV2utJ6+AY3fb8z9OukYhbC26pqrlAhPbCh
 AnL+gBBIG/xjYZlswTobJfpST1iFGmUlJz9iBSsbfHUTTfDzxAvdUCx4L99GKWPEnWSf
 dJyKAxVMpS9JKzafAIp7iaZ1Qk1tUn3flDcok4JzC3f93fIhAUK3ZidPnWWpdM87tJXj
 RG5g==
X-Gm-Message-State: ANhLgQ3l/9O0esXlBq5bS8OJNwzG2iaz1NgE8IepZtQrA+D5HJndXoNS
 g9+t826nKI7j1U/QOaXeieEK3GPVF1+vbLlqn/g=
X-Google-Smtp-Source: ADFU+vv9f1tNMc/dz8wz6vheBXhDeDWoScubyuVYt/lAnwaERQQkurFmA2nTYgTv+KqcTrMQcDT0RQ5WrvgvHQnVah8=
X-Received: by 2002:a0c:a044:: with SMTP id b62mr14659038qva.15.1584134534456; 
 Fri, 13 Mar 2020 14:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-7-zhiwei_liu@c-sky.com>
In-Reply-To: <20200312145900.2054-7-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 13 Mar 2020 14:21:47 -0700
Message-ID: <CAKmqyKNQ8nJKyBxC=aC_XGTLFCBQytK3Aep1A-j5Q3D8e8vVug@mail.gmail.com>
Subject: Re: [PATCH v5 06/60] target/riscv: add vector index load and store
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::f42
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
Cc: guoren@linux.alibaba.com, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wxy194768@alibaba-inc.com, Chih-Min Chao <chihmin.chao@sifive.com>,
 wenmeng_zhang@c-sky.com, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 12, 2020 at 8:11 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Vector indexed operations add the contents of each element of the
> vector offset operand specified by vs2 to the base effective address
> to give the effective address of each element.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   |  35 +++++++
>  target/riscv/insn32.decode              |  13 +++
>  target/riscv/insn_trans/trans_rvv.inc.c | 124 ++++++++++++++++++++++++
>  target/riscv/vector_helper.c            | 117 ++++++++++++++++++++++
>  4 files changed, 289 insertions(+)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 87dfa90609..f9b3da60ca 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -183,3 +183,38 @@ DEF_HELPER_6(vsse_v_b, void, ptr, ptr, tl, tl, env, i32)
>  DEF_HELPER_6(vsse_v_h, void, ptr, ptr, tl, tl, env, i32)
>  DEF_HELPER_6(vsse_v_w, void, ptr, ptr, tl, tl, env, i32)
>  DEF_HELPER_6(vsse_v_d, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vlxb_v_b, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxb_v_h, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxb_v_w, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxb_v_d, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxh_v_h, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxh_v_w, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxh_v_d, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxw_v_w, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxw_v_d, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxe_v_b, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxe_v_h, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxe_v_w, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxe_v_d, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxbu_v_b, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxbu_v_h, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxbu_v_w, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxbu_v_d, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxhu_v_h, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxhu_v_w, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxhu_v_d, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxwu_v_w, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxwu_v_d, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxb_v_b, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxb_v_h, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxb_v_w, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxb_v_d, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxh_v_h, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxh_v_w, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxh_v_d, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxw_v_w, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxw_v_d, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxe_v_b, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxe_v_h, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxe_v_w, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxe_v_d, void, ptr, ptr, tl, ptr, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index ef521152c5..bc36df33b5 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -241,6 +241,19 @@ vssh_v     ... 010 . ..... ..... 101 ..... 0100111 @r_nfvm
>  vssw_v     ... 010 . ..... ..... 110 ..... 0100111 @r_nfvm
>  vsse_v     ... 010 . ..... ..... 111 ..... 0100111 @r_nfvm
>
> +vlxb_v     ... 111 . ..... ..... 000 ..... 0000111 @r_nfvm
> +vlxh_v     ... 111 . ..... ..... 101 ..... 0000111 @r_nfvm
> +vlxw_v     ... 111 . ..... ..... 110 ..... 0000111 @r_nfvm
> +vlxe_v     ... 011 . ..... ..... 111 ..... 0000111 @r_nfvm
> +vlxbu_v    ... 011 . ..... ..... 000 ..... 0000111 @r_nfvm
> +vlxhu_v    ... 011 . ..... ..... 101 ..... 0000111 @r_nfvm
> +vlxwu_v    ... 011 . ..... ..... 110 ..... 0000111 @r_nfvm
> +# Vector ordered-indexed and unordered-indexed store insns.
> +vsxb_v     ... -11 . ..... ..... 000 ..... 0100111 @r_nfvm
> +vsxh_v     ... -11 . ..... ..... 101 ..... 0100111 @r_nfvm
> +vsxw_v     ... -11 . ..... ..... 110 ..... 0100111 @r_nfvm
> +vsxe_v     ... -11 . ..... ..... 111 ..... 0100111 @r_nfvm
> +
>  # *** new major opcode OP-V ***
>  vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
>  vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
> diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
> index d85f2aec68..5d1eeef323 100644
> --- a/target/riscv/insn_trans/trans_rvv.inc.c
> +++ b/target/riscv/insn_trans/trans_rvv.inc.c
> @@ -407,3 +407,127 @@ GEN_VEXT_TRANS(vssb_v, 0, rnfvm, st_stride_op, st_stride_check)
>  GEN_VEXT_TRANS(vssh_v, 1, rnfvm, st_stride_op, st_stride_check)
>  GEN_VEXT_TRANS(vssw_v, 2, rnfvm, st_stride_op, st_stride_check)
>  GEN_VEXT_TRANS(vsse_v, 3, rnfvm, st_stride_op, st_stride_check)
> +
> +/*
> + *** index load and store
> + */
> +typedef void gen_helper_ldst_index(TCGv_ptr, TCGv_ptr, TCGv,
> +        TCGv_ptr, TCGv_env, TCGv_i32);
> +
> +static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
> +        uint32_t data, gen_helper_ldst_index *fn, DisasContext *s)
> +{
> +    TCGv_ptr dest, mask, index;
> +    TCGv base;
> +    TCGv_i32 desc;
> +
> +    dest = tcg_temp_new_ptr();
> +    mask = tcg_temp_new_ptr();
> +    index = tcg_temp_new_ptr();
> +    base = tcg_temp_new();
> +    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
> +
> +    gen_get_gpr(base, rs1);
> +    tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
> +    tcg_gen_addi_ptr(index, cpu_env, vreg_ofs(s, vs2));
> +    tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
> +
> +    fn(dest, mask, base, index, cpu_env, desc);
> +
> +    tcg_temp_free_ptr(dest);
> +    tcg_temp_free_ptr(mask);
> +    tcg_temp_free_ptr(index);
> +    tcg_temp_free(base);
> +    tcg_temp_free_i32(desc);
> +    return true;
> +}
> +
> +static bool ld_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
> +{
> +    uint32_t data = 0;
> +    gen_helper_ldst_index *fn;
> +    static gen_helper_ldst_index * const fns[7][4] = {
> +        { gen_helper_vlxb_v_b,  gen_helper_vlxb_v_h,
> +          gen_helper_vlxb_v_w,  gen_helper_vlxb_v_d },
> +        { NULL,                 gen_helper_vlxh_v_h,
> +          gen_helper_vlxh_v_w,  gen_helper_vlxh_v_d },
> +        { NULL,                 NULL,
> +          gen_helper_vlxw_v_w,  gen_helper_vlxw_v_d },
> +        { gen_helper_vlxe_v_b,  gen_helper_vlxe_v_h,
> +          gen_helper_vlxe_v_w,  gen_helper_vlxe_v_d },
> +        { gen_helper_vlxbu_v_b, gen_helper_vlxbu_v_h,
> +          gen_helper_vlxbu_v_w, gen_helper_vlxbu_v_d },
> +        { NULL,                 gen_helper_vlxhu_v_h,
> +          gen_helper_vlxhu_v_w, gen_helper_vlxhu_v_d },
> +        { NULL,                 NULL,
> +          gen_helper_vlxwu_v_w, gen_helper_vlxwu_v_d },
> +    };
> +
> +    fn =  fns[seq][s->sew];
> +    if (fn == NULL) {
> +        return false;
> +    }
> +
> +    data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
> +    data = FIELD_DP32(data, VDATA, VM, a->vm);
> +    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +    data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s);
> +}
> +
> +static bool ld_index_check(DisasContext *s, arg_rnfvm* a)
> +{
> +    return (vext_check_isa_ill(s, RVV) &&
> +            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
> +            vext_check_reg(s, a->rd, false) &&
> +            vext_check_reg(s, a->rs2, false) &&
> +            vext_check_nf(s, a->nf));
> +}
> +
> +GEN_VEXT_TRANS(vlxb_v, 0, rnfvm, ld_index_op, ld_index_check)
> +GEN_VEXT_TRANS(vlxh_v, 1, rnfvm, ld_index_op, ld_index_check)
> +GEN_VEXT_TRANS(vlxw_v, 2, rnfvm, ld_index_op, ld_index_check)
> +GEN_VEXT_TRANS(vlxe_v, 3, rnfvm, ld_index_op, ld_index_check)
> +GEN_VEXT_TRANS(vlxbu_v, 4, rnfvm, ld_index_op, ld_index_check)
> +GEN_VEXT_TRANS(vlxhu_v, 5, rnfvm, ld_index_op, ld_index_check)
> +GEN_VEXT_TRANS(vlxwu_v, 6, rnfvm, ld_index_op, ld_index_check)
> +
> +static bool st_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
> +{
> +    uint32_t data = 0;
> +    gen_helper_ldst_index *fn;
> +    static gen_helper_ldst_index * const fns[4][4] = {
> +        { gen_helper_vsxb_v_b,  gen_helper_vsxb_v_h,
> +          gen_helper_vsxb_v_w,  gen_helper_vsxb_v_d },
> +        { NULL,                 gen_helper_vsxh_v_h,
> +          gen_helper_vsxh_v_w,  gen_helper_vsxh_v_d },
> +        { NULL,                 NULL,
> +          gen_helper_vsxw_v_w,  gen_helper_vsxw_v_d },
> +        { gen_helper_vsxe_v_b,  gen_helper_vsxe_v_h,
> +          gen_helper_vsxe_v_w,  gen_helper_vsxe_v_d }
> +    };
> +
> +    fn =  fns[seq][s->sew];
> +    if (fn == NULL) {
> +        return false;
> +    }
> +
> +    data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
> +    data = FIELD_DP32(data, VDATA, VM, a->vm);
> +    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +    data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s);
> +}
> +
> +static bool st_index_check(DisasContext *s, arg_rnfvm* a)
> +{
> +    return (vext_check_isa_ill(s, RVV) &&
> +            vext_check_reg(s, a->rd, false) &&
> +            vext_check_reg(s, a->rs2, false) &&
> +            vext_check_nf(s, a->nf));
> +}
> +
> +GEN_VEXT_TRANS(vsxb_v, 0, rnfvm, st_index_op, st_index_check)
> +GEN_VEXT_TRANS(vsxh_v, 1, rnfvm, st_index_op, st_index_check)
> +GEN_VEXT_TRANS(vsxw_v, 2, rnfvm, st_index_op, st_index_check)
> +GEN_VEXT_TRANS(vsxe_v, 3, rnfvm, st_index_op, st_index_check)
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index ebfabd2946..35cb9f09b4 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -457,3 +457,120 @@ GEN_VEXT_ST_US(vse_v_b, int8_t,  int8_t , ste_b)
>  GEN_VEXT_ST_US(vse_v_h, int16_t, int16_t, ste_h)
>  GEN_VEXT_ST_US(vse_v_w, int32_t, int32_t, ste_w)
>  GEN_VEXT_ST_US(vse_v_d, int64_t, int64_t, ste_d)
> +
> +/*
> + *** index: access vector element from indexed memory
> + */
> +typedef target_ulong (*vext_get_index_addr)(target_ulong base,
> +        uint32_t idx, void *vs2);
> +
> +#define GEN_VEXT_GET_INDEX_ADDR(NAME, ETYPE, H)        \
> +static target_ulong NAME(target_ulong base,            \
> +        uint32_t idx, void *vs2)                       \
> +{                                                      \
> +    return (base + *((ETYPE *)vs2 + H(idx)));          \
> +}
> +
> +GEN_VEXT_GET_INDEX_ADDR(idx_b, int8_t,  H1)
> +GEN_VEXT_GET_INDEX_ADDR(idx_h, int16_t, H2)
> +GEN_VEXT_GET_INDEX_ADDR(idx_w, int32_t, H4)
> +GEN_VEXT_GET_INDEX_ADDR(idx_d, int64_t, H8)
> +
> +static inline void vext_ldst_index(void *vd, void *v0, target_ulong base,
> +        void *vs2, CPURISCVState *env, uint32_t desc,
> +        vext_get_index_addr get_index_addr,
> +        vext_ldst_elem_fn ldst_elem,
> +        vext_ld_clear_elem clear_elem,
> +        uint32_t esz, uint32_t msz, uintptr_t ra,
> +        MMUAccessType access_type)
> +{
> +    uint32_t i, k;
> +    uint32_t nf = vext_nf(desc);
> +    uint32_t vm = vext_vm(desc);
> +    uint32_t mlen = vext_mlen(desc);
> +    uint32_t vlmax = vext_maxsz(desc) / esz;
> +
> +    if (env->vl == 0) {
> +        return;
> +    }
> +    /* probe every access*/
> +    for (i = 0; i < env->vl; i++) {
> +        if (!vm && !vext_elem_mask(v0, mlen, i)) {
> +            continue;
> +        }
> +        probe_pages(env, get_index_addr(base, i, vs2), nf * msz, ra,
> +                access_type);
> +    }
> +    /* load bytes from guest memory */
> +    for (i = 0; i < env->vl; i++) {
> +        k = 0;
> +        if (!vm && !vext_elem_mask(v0, mlen, i)) {
> +            continue;
> +        }
> +        while (k < nf) {
> +            abi_ptr addr = get_index_addr(base, i, vs2) + k * msz;
> +            ldst_elem(env, addr, i + k * vlmax, vd, ra);
> +            k++;
> +        }
> +    }
> +    /* clear tail elements */
> +    if (clear_elem) {
> +        for (k = 0; k < nf; k++) {
> +            clear_elem(vd, env->vl + k * vlmax, env->vl * esz, vlmax * esz);
> +        }
> +    }
> +}
> +
> +#define GEN_VEXT_LD_INDEX(NAME, MTYPE, ETYPE, INDEX_FN, LOAD_FN, CLEAR_FN) \
> +void HELPER(NAME)(void *vd, void *v0, target_ulong base,                   \
> +        void *vs2, CPURISCVState *env, uint32_t desc)                      \
> +{                                                                          \
> +    vext_ldst_index(vd, v0, base, vs2, env, desc, INDEX_FN,                \
> +        LOAD_FN, CLEAR_FN, sizeof(ETYPE), sizeof(MTYPE),                   \
> +        GETPC(), MMU_DATA_LOAD);                                           \
> +}
> +GEN_VEXT_LD_INDEX(vlxb_v_b,  int8_t,   int8_t,   idx_b, ldb_b,  clearb)
> +GEN_VEXT_LD_INDEX(vlxb_v_h,  int8_t,   int16_t,  idx_h, ldb_h,  clearh)
> +GEN_VEXT_LD_INDEX(vlxb_v_w,  int8_t,   int32_t,  idx_w, ldb_w,  clearl)
> +GEN_VEXT_LD_INDEX(vlxb_v_d,  int8_t,   int64_t,  idx_d, ldb_d,  clearq)
> +GEN_VEXT_LD_INDEX(vlxh_v_h,  int16_t,  int16_t,  idx_h, ldh_h,  clearh)
> +GEN_VEXT_LD_INDEX(vlxh_v_w,  int16_t,  int32_t,  idx_w, ldh_w,  clearl)
> +GEN_VEXT_LD_INDEX(vlxh_v_d,  int16_t,  int64_t,  idx_d, ldh_d,  clearq)
> +GEN_VEXT_LD_INDEX(vlxw_v_w,  int32_t,  int32_t,  idx_w, ldw_w,  clearl)
> +GEN_VEXT_LD_INDEX(vlxw_v_d,  int32_t,  int64_t,  idx_d, ldw_d,  clearq)
> +GEN_VEXT_LD_INDEX(vlxe_v_b,  int8_t,   int8_t,   idx_b, lde_b,  clearb)
> +GEN_VEXT_LD_INDEX(vlxe_v_h,  int16_t,  int16_t,  idx_h, lde_h,  clearh)
> +GEN_VEXT_LD_INDEX(vlxe_v_w,  int32_t,  int32_t,  idx_w, lde_w,  clearl)
> +GEN_VEXT_LD_INDEX(vlxe_v_d,  int64_t,  int64_t,  idx_d, lde_d,  clearq)
> +GEN_VEXT_LD_INDEX(vlxbu_v_b, uint8_t,  uint8_t,  idx_b, ldbu_b, clearb)
> +GEN_VEXT_LD_INDEX(vlxbu_v_h, uint8_t,  uint16_t, idx_h, ldbu_h, clearh)
> +GEN_VEXT_LD_INDEX(vlxbu_v_w, uint8_t,  uint32_t, idx_w, ldbu_w, clearl)
> +GEN_VEXT_LD_INDEX(vlxbu_v_d, uint8_t,  uint64_t, idx_d, ldbu_d, clearq)
> +GEN_VEXT_LD_INDEX(vlxhu_v_h, uint16_t, uint16_t, idx_h, ldhu_h, clearh)
> +GEN_VEXT_LD_INDEX(vlxhu_v_w, uint16_t, uint32_t, idx_w, ldhu_w, clearl)
> +GEN_VEXT_LD_INDEX(vlxhu_v_d, uint16_t, uint64_t, idx_d, ldhu_d, clearq)
> +GEN_VEXT_LD_INDEX(vlxwu_v_w, uint32_t, uint32_t, idx_w, ldwu_w, clearl)
> +GEN_VEXT_LD_INDEX(vlxwu_v_d, uint32_t, uint64_t, idx_d, ldwu_d, clearq)
> +
> +#define GEN_VEXT_ST_INDEX(NAME, MTYPE, ETYPE, INDEX_FN, STORE_FN)\
> +void HELPER(NAME)(void *vd, void *v0, target_ulong base,         \
> +        void *vs2, CPURISCVState *env, uint32_t desc)            \
> +{                                                                \
> +    vext_ldst_index(vd, v0, base, vs2, env, desc, INDEX_FN,      \
> +        STORE_FN, NULL, sizeof(ETYPE), sizeof(MTYPE),            \
> +        GETPC(), MMU_DATA_STORE);                                \
> +}
> +
> +GEN_VEXT_ST_INDEX(vsxb_v_b, int8_t,  int8_t,  idx_b, stb_b)
> +GEN_VEXT_ST_INDEX(vsxb_v_h, int8_t,  int16_t, idx_h, stb_h)
> +GEN_VEXT_ST_INDEX(vsxb_v_w, int8_t,  int32_t, idx_w, stb_w)
> +GEN_VEXT_ST_INDEX(vsxb_v_d, int8_t,  int64_t, idx_d, stb_d)
> +GEN_VEXT_ST_INDEX(vsxh_v_h, int16_t, int16_t, idx_h, sth_h)
> +GEN_VEXT_ST_INDEX(vsxh_v_w, int16_t, int32_t, idx_w, sth_w)
> +GEN_VEXT_ST_INDEX(vsxh_v_d, int16_t, int64_t, idx_d, sth_d)
> +GEN_VEXT_ST_INDEX(vsxw_v_w, int32_t, int32_t, idx_w, stw_w)
> +GEN_VEXT_ST_INDEX(vsxw_v_d, int32_t, int64_t, idx_d, stw_d)
> +GEN_VEXT_ST_INDEX(vsxe_v_b, int8_t,  int8_t,  idx_b, ste_b)
> +GEN_VEXT_ST_INDEX(vsxe_v_h, int16_t, int16_t, idx_h, ste_h)
> +GEN_VEXT_ST_INDEX(vsxe_v_w, int32_t, int32_t, idx_w, ste_w)
> +GEN_VEXT_ST_INDEX(vsxe_v_d, int64_t, int64_t, idx_d, ste_d)
> --
> 2.23.0
>

