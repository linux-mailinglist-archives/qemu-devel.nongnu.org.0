Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAE35B5C38
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 16:31:18 +0200 (CEST)
Received: from localhost ([::1]:39890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXkSz-0003Yf-AZ
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 10:31:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXkRE-000244-SW
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 10:29:28 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXkRC-0001Os-Uy
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 10:29:28 -0400
Received: by mail-wr1-x435.google.com with SMTP id e16so15670915wrx.7
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 07:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Qy5axYqY4gCUOEmAgXghaDCl5zJqRcSzc2Y6yu6uMpU=;
 b=a0DqntRdXfirQzN4K0wSeLkpx5s4+Wvs3KFSrZyXj5Bnh3YH4/qWQuT2CZbakP9I3w
 +1GyV+I7f2qZkwTt7Rm6z9gvF6F8iRVQPp9vNqfAxvqO2CXIDGHozqiHjsVfO/NC9ZXZ
 WE3jFaUpeI3VOq6o4a8nFkrArbFMCN/zTGGiWz3+g4k3MKndTyuNxbUeFMhUFlZpbfoZ
 7lpGx0vklRSRVdqDD34WbuqzsxF93LlwkFwZ8mEzU6WaoL7gbPYCso9QvvFoRy1geWl5
 PEFEHaR1n9bqIXhR0D8JbJhm4wdHX/HxCrt0xNkQZy5w30YehLv9Z3/y8zX29WU44LBh
 C0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Qy5axYqY4gCUOEmAgXghaDCl5zJqRcSzc2Y6yu6uMpU=;
 b=CeWu60RR9ZEOgtuI7yPFLIP8CM81CFlkcIgoNsA5W0eyCRvAybZp+zoLlT8iBdUvcl
 RUCNH4UnM0WIs9N/bwlkTuyNL5oF0TUPqWREW6ZduITIEb4p3Oet3RKftf4QeHt4u6LR
 ABOuc8+VynwOkHhLKyvJFwkUAuBbrW3wu+V/pOcbpDAf/PJ4XXq2WfYR8b1QTuuyy82p
 QqOCmysjfuTM/ad4G/fSjJLwSP/Fp+0hkg5pQXQ4xc/5iwCNkLmVBfIqIgjkloh7A4X/
 jBtzGyqM55ZrqRm67oHw/n5riKI+U0BZtPbxFsqJGZL2dzbIBtNTm/azCWjiFKzSCf/5
 IxtQ==
X-Gm-Message-State: ACgBeo15tFbaZlopLqju19simUf8CxWHoMx1ppe7OFDkeizdh/PCJJud
 5NQ6VyPFfcu73k2VKnNE3m0MQg==
X-Google-Smtp-Source: AA6agR65uzh5ppqw1llappnjUyEFUQZ0tCezeTAMA1SweUZqUjLQv15tWJWPVVTL58kjiDPZ47BV/Q==
X-Received: by 2002:a5d:4492:0:b0:229:4632:d1db with SMTP id
 j18-20020a5d4492000000b002294632d1dbmr15224786wrq.513.1662992965085; 
 Mon, 12 Sep 2022 07:29:25 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.69])
 by smtp.gmail.com with ESMTPSA id
 o37-20020a05600c33a500b003a5bd5ea215sm9350702wmp.37.2022.09.12.07.29.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 07:29:24 -0700 (PDT)
Message-ID: <386714d7-276f-bfd8-5236-cb7ccca5aee0@linaro.org>
Date: Mon, 12 Sep 2022 15:29:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 24/37] target/i386: reimplement 0x0f 0x70-0x77, add AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-25-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-25-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/22 00:04, Paolo Bonzini wrote:
> This includes shifts by immediate, which use bits 3-5 of the ModRM byte
> as an opcode extension.  With the exception of 128-bit shifts, they are
> implemented using gvec.
> 
> This also covers VZEROALL and VZEROUPPER, which use the same opcode
> as EMMS.  If we were wanting to optimize out gen_clear_ymmh then this
> would be one of the starting points.  The implementation of the VZEROALL
> and VZEROUPPER helpers is by Paul Brook.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target/i386/helper.h             |   7 +
>   target/i386/tcg/decode-new.c.inc |  76 ++++++++++
>   target/i386/tcg/emit.c.inc       | 232 +++++++++++++++++++++++++++++++
>   target/i386/tcg/fpu_helper.c     |  46 ++++++
>   target/i386/tcg/translate.c      |   3 +-
>   5 files changed, 362 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/helper.h b/target/i386/helper.h
> index 3da5df98b9..d7e6878263 100644
> --- a/target/i386/helper.h
> +++ b/target/i386/helper.h
> @@ -221,6 +221,13 @@ DEF_HELPER_3(movq, void, env, ptr, ptr)
>   #define SHIFT 2
>   #include "ops_sse_header.h"
>   
> +DEF_HELPER_1(vzeroall, void, env)
> +DEF_HELPER_1(vzeroupper, void, env)
> +#ifdef TARGET_X86_64
> +DEF_HELPER_1(vzeroall_hi8, void, env)
> +DEF_HELPER_1(vzeroupper_hi8, void, env)
> +#endif
> +
>   DEF_HELPER_3(rclb, tl, env, tl, tl)
>   DEF_HELPER_3(rclw, tl, env, tl, tl)
>   DEF_HELPER_3(rcll, tl, env, tl, tl)
> diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
> index 6aa8bac74f..0e2da85934 100644
> --- a/target/i386/tcg/decode-new.c.inc
> +++ b/target/i386/tcg/decode-new.c.inc
> @@ -133,6 +133,19 @@ static uint8_t get_modrm(DisasContext *s, CPUX86State *env)
>       return s->modrm;
>   }
>   
> +static inline const X86OpEntry *decode_by_prefix(DisasContext *s, const X86OpEntry entries[4])
> +{
> +    if (s->prefix & PREFIX_REPNZ) {
> +        return &entries[3];
> +    } else if (s->prefix & PREFIX_REPZ) {
> +        return &entries[2];
> +    } else if (s->prefix & PREFIX_DATA) {
> +        return &entries[1];
> +    } else {
> +        return &entries[0];
> +    }
> +}

This is the sort of thing I would have expected for some of the other insns for which the 
distiction was delayed until generation, like SSE4a_{R,I}.

> +static void decode_group12_13_14(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
> +{
> +    static const X86OpEntry group[3][8] = {
> +        {
> +            /* grp12 */
> +            {},
> +            {},
> +            X86_OP_ENTRY3(PSRLW_i,  H,x, U,x, I,b, vex7 mmx avx2_256 p_00_66),
> +            {},
> +            X86_OP_ENTRY3(PSRAW_i,  H,x, U,x, I,b, vex7 mmx avx2_256 p_00_66),
> +            {},
> +            X86_OP_ENTRY3(PSLLW_i,  H,x, U,x, I,b, vex7 mmx avx2_256 p_00_66),
> +            {},
> +        },

Why combine these 3 groups?

> +    *entry = group[*b - 0x71][op];

Split them and you avoid this magic number.

> +static inline void gen_unary_imm_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
> +                                     SSEFunc_0_ppi xmm, SSEFunc_0_ppi ymm)
> +{
> +    TCGv_i32 imm = tcg_const_i32(decode->immediate);

Use tcg_constant_i32, which need not be freed.

> +static void gen_EMMS_VZERO(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +{
> +    if (!(s->prefix & PREFIX_VEX)) {
> +        gen_helper_emms(cpu_env);
> +        return;
> +    }

Split in decode?  That would make vex8 simpler too.

> +static inline TCGv_ptr make_imm_mmx_vec(uint32_t imm)

Unused?  Please do drop all of the inline markers, and/or do build testing with clang, 
which will Werror on this.

> +static inline TCGv_ptr make_imm_xmm_vec(uint32_t imm, int vec_len)
> +{
> +    MemOp ot = vec_len == 16 ? MO_128 : MO_256;
> +    TCGv_i32 imm_v = tcg_const_i32(imm);

tcg_constant_i32, however I think this use can go away too.

> +static void gen_PSRLDQ_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +{
> +    int vec_len = sse_vec_len(s, decode);
> +    TCGv_ptr imm_vec = make_imm_xmm_vec(decode->immediate, vec_len);
> +
> +    if (s->vex_l) {
> +        gen_helper_psrldq_ymm(cpu_env, s->ptr0, s->ptr1, imm_vec);
> +    } else {
> +        gen_helper_psrldq_xmm(cpu_env, s->ptr0, s->ptr1, imm_vec);
> +    }
> +    tcg_temp_free_ptr(imm_vec);

Let's just do this inline:

     int shift = decode->immediate * 8;

     if (shift >= 128) {
         zero;
         return;
     }

     for (lane = 0; lane <= s->vex_l; lane++) {
         TCGv_i64 q0 = tcg_temp_new_i64();
         TCGv_i64 q1 = tcg_temp_new_i64();

         tcg_gen_ld_i64(q0, cpu_env, offset + lane * 16 + offsetof(XMMReg, MMX_Q(0));
         tcg_gen_ld_i64(q1, ...);

         if (shift >= 64) {
             tcg_gen_shri_i64(q0, q1, shift - 64);
             tcg_gen_movi_i64(q1, 0);
         } else {
             tcg_gen_extract2_i64(q0, q0, q1, shift);
             tcg_gen_shri_i64(q1, q1, shift);
         }

         tcg_gen_st_i64(q0, cpu_env, offset + lane * 16 + offsetof(XMMReg, MMX_Q(0));
         tcg_gen_st_i64(q1, ...);
     }


> +static void gen_PSLLDQ_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +{
> +    int vec_len = sse_vec_len(s, decode);
> +    TCGv_ptr imm_vec = make_imm_xmm_vec(decode->immediate, vec_len);
> +
> +    if (s->vex_l) {
> +        gen_helper_pslldq_ymm(cpu_env, s->ptr0, s->ptr1, imm_vec);
> +    } else {
> +        gen_helper_pslldq_xmm(cpu_env, s->ptr0, s->ptr1, imm_vec);
> +    }
> +    tcg_temp_free_ptr(imm_vec);
> +}

Similar, but the extract2 becomes

     tcg_gen_extract2_i64(q1, q0, q1, 64 - shift);

> +void helper_vzeroall(CPUX86State *env)
> +{
> +    int i;
> +
> +    for (i = 0; i < 8; i++) {
> +        env->xmm_regs[i].ZMM_Q(0) = 0;
> +        env->xmm_regs[i].ZMM_Q(1) = 0;
> +        env->xmm_regs[i].ZMM_Q(2) = 0;
> +        env->xmm_regs[i].ZMM_Q(3) = 0;
> +    }
> +}

Better with memset, I think, available as gen_helper_memset().

> +#ifdef TARGET_X86_64
> +void helper_vzeroall_hi8(CPUX86State *env)
> +{
> +    int i;
> +
> +    for (i = 8; i < 16; i++) {
> +        env->xmm_regs[i].ZMM_Q(0) = 0;
> +        env->xmm_regs[i].ZMM_Q(1) = 0;
> +        env->xmm_regs[i].ZMM_Q(2) = 0;
> +        env->xmm_regs[i].ZMM_Q(3) = 0;
> +    }
> +}

Likewise.


> +
> +void helper_vzeroupper_hi8(CPUX86State *ense_new &&
> -            ((b >= 0x150 && b <= 0x16f) ||
> -             (b >= 0x178 && b <= 0x17f) ||
> +            ((b >= 0x150 && b <= 0x17f) ||
>                (b >= 0x1d8 && b <= 0x1ff && (b & 8)))) {
>               return disas_insn_new(s, cpu, b + 0x100);
>           }

More mailer lossage?


r~

