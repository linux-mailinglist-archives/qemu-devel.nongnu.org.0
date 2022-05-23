Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4178531166
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 16:51:23 +0200 (CEST)
Received: from localhost ([::1]:49430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt9P0-0001tc-Pt
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 10:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nt9JU-0005cs-O4; Mon, 23 May 2022 10:45:43 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:33677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nt9JS-0005MY-H8; Mon, 23 May 2022 10:45:40 -0400
Received: by mail-oi1-x232.google.com with SMTP id w130so18116673oig.0;
 Mon, 23 May 2022 07:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Gw2e1P92iH/NMsL54rAh+lwgM3jZeQ3yPORvdkF6kck=;
 b=cN+E8my3U+iJk/++vhFOM0As3kF84JGir50SE1dnaljiHnNnqzug4cyQU0lZOb00gG
 /uvc+wu1EPwjAb5y/ivbR60e0yoH8CJfER3ITr5lQRq6tpM+lDWyAzSCyb1OSz/ON4wa
 Cz8+GWAJMOWye16fbZTSTkiSTexm7lntENrk4CnL9PQRltXpl7j262GtE3SjXRLnlJyE
 CtynjpP+oc68VMD7juAPoNaE3vNQn4Uarn7K3vSInT26BqAXPryubPp1n6RCFNkhu4rC
 SONk0tt3HWbUwDk2GDvE8KITzBL4cej76rNPbNrtNRMb/7eyBCYvT1zzMWpcyaJs+5MG
 uZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Gw2e1P92iH/NMsL54rAh+lwgM3jZeQ3yPORvdkF6kck=;
 b=StBUgIJsIA01HaRB0lOhTY8s1F45+ZX5IQ/4sx4CCOfYGAdMNTcbgOOEdaAFGmj5n7
 qIkpxGJcxh0hlq1F46N6DZEoYFBFeYcogsy4e32BVtyUk1Ql+VVny6hiq/DJHEysaS4h
 CSm97DiB9FRFkZmpUhp/5gmNknw4h4XF7gRA/xLDUXaX17s1fddEC8n8XJiKZyc2Kf9p
 ariGnGkIMZgvJU9hkTBHTwR4VZuqIXJ452VHPqD4sign5Yu8fqY3L32nZuNFRU+ZuQ22
 S0qx4hlc1Ik9X1OcoEBp6EU7SUVfME1x8Kd9s+Lahq9/5QN+C6KuHZGljyCp5ps1nZZy
 f71Q==
X-Gm-Message-State: AOAM531FQlgjIp35yuq5q0xYEnumMGRXtZf60GP4rYVUWNDwUNzasEoy
 se+XIpLiMIFA2vxBH1/ZX5A=
X-Google-Smtp-Source: ABdhPJwH9EGuMbUu5j69e5yfaNnycoALTBq7P4gOMR+r6bwWRD2nem7iorckKLZXxl1+JuNIJwbRkw==
X-Received: by 2002:aca:4154:0:b0:322:7a9c:7daa with SMTP id
 o81-20020aca4154000000b003227a9c7daamr12127995oia.52.1653317136719; 
 Mon, 23 May 2022 07:45:36 -0700 (PDT)
Received: from [192.168.10.102] (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 p13-20020a0568301d4d00b0060603221236sm4025880oth.6.2022.05.23.07.45.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 07:45:36 -0700 (PDT)
Message-ID: <684ce3b0-db0c-7f93-0b39-dd3564231f76@gmail.com>
Date: Mon, 23 May 2022 11:45:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 5/8] target/ppc: Implemented xvf16ger*
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, David Gibson <david@gibson.dropbear.id.au>,
 Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220520195419.109177-1-lucas.araujo@eldorado.org.br>
 <20220520195419.109177-6-lucas.araujo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220520195419.109177-6-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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

checkpatch.pl didn't like this patch:



Checking v5-5-8-target-ppc-Implemented-xvf16ger.patch...
WARNING: line over 80 characters
#177: FILE: target/ppc/fpu_helper.c:3535:
+                va = !(pmsk & 2) ? float64_zero : extract(a->VsrHF(2 * i), excp_ptr);

WARNING: line over 80 characters
#178: FILE: target/ppc/fpu_helper.c:3536:
+                vb = !(pmsk & 2) ? float64_zero : extract(b->VsrHF(2 * j), excp_ptr);

WARNING: line over 80 characters
#179: FILE: target/ppc/fpu_helper.c:3537:
+                vc = !(pmsk & 1) ? float64_zero : extract(a->VsrHF(2 * i + 1), excp_ptr);

WARNING: line over 80 characters
#180: FILE: target/ppc/fpu_helper.c:3538:
+                vd = !(pmsk & 1) ? float64_zero : extract(b->VsrHF(2 * j + 1), excp_ptr);

total: 0 errors, 4 warnings, 165 lines checked

v5-5-8-target-ppc-Implemented-xvf16ger.patch has style problems, please review.  If any of these errors
are false positives report them to the maintainer, see
CHECKPATCH in MAINTAINERS.




Thanks,


Daniel

On 5/20/22 16:54, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> xvf16ger2:   VSX Vector 16-bit Floating-Point GER (rank-2 update)
> xvf16ger2nn: VSX Vector 16-bit Floating-Point GER (rank-2 update) Negative
> multiply, Negative accumulate
> xvf16ger2np: VSX Vector 16-bit Floating-Point GER (rank-2 update) Negative
> multiply, Positive accumulate
> xvf16ger2pn: VSX Vector 16-bit Floating-Point GER (rank-2 update) Positive
> multiply, Negative accumulate
> xvf16ger2pp: VSX Vector 16-bit Floating-Point GER (rank-2 update) Positive
> multiply, Positive accumulate
> 
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/ppc/cpu.h                    |  3 +
>   target/ppc/fpu_helper.c             | 91 +++++++++++++++++++++++++++++
>   target/ppc/helper.h                 |  5 ++
>   target/ppc/insn32.decode            |  6 ++
>   target/ppc/translate/vsx-impl.c.inc |  6 ++
>   5 files changed, 111 insertions(+)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index bdedf4138e..46769a5647 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -227,6 +227,7 @@ typedef union _ppc_vsr_t {
>       int16_t s16[8];
>       int32_t s32[4];
>       int64_t s64[2];
> +    float16 f16[8];
>       float32 f32[4];
>       float64 f64[2];
>       float128 f128;
> @@ -2641,6 +2642,7 @@ static inline bool lsw_reg_in_range(int start, int nregs, int rx)
>   #define VsrSW(i) s32[i]
>   #define VsrD(i) u64[i]
>   #define VsrSD(i) s64[i]
> +#define VsrHF(i) f16[i]
>   #define VsrSF(i) f32[i]
>   #define VsrDF(i) f64[i]
>   #else
> @@ -2652,6 +2654,7 @@ static inline bool lsw_reg_in_range(int start, int nregs, int rx)
>   #define VsrSW(i) s32[3 - (i)]
>   #define VsrD(i) u64[1 - (i)]
>   #define VsrSD(i) s64[1 - (i)]
> +#define VsrHF(i) f16[7 - (i)]
>   #define VsrSF(i) f32[3 - (i)]
>   #define VsrDF(i) f64[1 - (i)]
>   #endif
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index 1766da5bcf..7a7aa03ac4 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -36,6 +36,15 @@ static inline float128 float128_snan_to_qnan(float128 x)
>   #define float32_snan_to_qnan(x) ((x) | 0x00400000)
>   #define float16_snan_to_qnan(x) ((x) | 0x0200)
>   
> +static inline float32 bfp32_neg(float32 a)
> +{
> +    if (unlikely(float32_is_any_nan(a))) {
> +        return a;
> +    } else {
> +        return float32_chs(a);
> +    }
> +}
> +
>   static inline bool fp_exceptions_enabled(CPUPPCState *env)
>   {
>   #ifdef CONFIG_USER_ONLY
> @@ -3502,6 +3511,53 @@ static inline void vsxger_excp(CPUPPCState *env, uintptr_t retaddr)
>       do_fpscr_check_status(env, retaddr);
>   }
>   
> +typedef float64 extract_f16(float16, float_status *);
> +
> +static float64 extract_hf16(float16 in, float_status *fp_status)
> +{
> +    return float16_to_float64(in, true, fp_status);
> +}
> +
> +static void vsxger16(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
> +                     ppc_acc_t  *at, uint32_t mask, bool acc,
> +                     bool neg_mul, bool neg_acc, extract_f16 extract)
> +{
> +    float32 r, aux_acc;
> +    float64 psum, va, vb, vc, vd;
> +    int i, j, xmsk_bit, ymsk_bit;
> +    uint8_t pmsk = FIELD_EX32(mask, GER_MSK, PMSK),
> +            xmsk = FIELD_EX32(mask, GER_MSK, XMSK),
> +            ymsk = FIELD_EX32(mask, GER_MSK, YMSK);
> +    float_status *excp_ptr = &env->fp_status;
> +    for (i = 0, xmsk_bit = 1 << 3; i < 4; i++, xmsk_bit >>= 1) {
> +        for (j = 0, ymsk_bit = 1 << 3; j < 4; j++, ymsk_bit >>= 1) {
> +            if ((xmsk_bit & xmsk) && (ymsk_bit & ymsk)) {
> +                va = !(pmsk & 2) ? float64_zero : extract(a->VsrHF(2 * i), excp_ptr);
> +                vb = !(pmsk & 2) ? float64_zero : extract(b->VsrHF(2 * j), excp_ptr);
> +                vc = !(pmsk & 1) ? float64_zero : extract(a->VsrHF(2 * i + 1), excp_ptr);
> +                vd = !(pmsk & 1) ? float64_zero : extract(b->VsrHF(2 * j + 1), excp_ptr);
> +                psum = float64_mul(va, vb, excp_ptr);
> +                psum = float64r32_muladd(vc, vd, psum, 0, excp_ptr);
> +                r = float64_to_float32(psum, excp_ptr);
> +                if (acc) {
> +                    aux_acc = at[i].VsrSF(j);
> +                    if (neg_mul) {
> +                        r = bfp32_neg(r);
> +                    }
> +                    if (neg_acc) {
> +                        aux_acc = bfp32_neg(aux_acc);
> +                    }
> +                    r = float32_add(r, aux_acc, excp_ptr);
> +                }
> +                at[i].VsrSF(j) = r;
> +            } else {
> +                at[i].VsrSF(j) = float32_zero;
> +            }
> +        }
> +    }
> +    vsxger_excp(env, GETPC());
> +}
> +
>   typedef void vsxger_zero(ppc_vsr_t *at, int, int);
>   
>   typedef void vsxger_muladd_f(ppc_vsr_t *, ppc_vsr_t *, ppc_vsr_t *, int, int,
> @@ -3579,6 +3635,41 @@ static void vsxger(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b, ppc_acc_t  *at,
>       vsxger_excp(env, GETPC());
>   }
>   
> +QEMU_FLATTEN
> +void helper_XVF16GER2(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
> +                     ppc_acc_t *at, uint32_t mask)
> +{
> +    vsxger16(env, a, b, at, mask, false, false, false, extract_hf16);
> +}
> +
> +QEMU_FLATTEN
> +void helper_XVF16GER2PP(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
> +                        ppc_acc_t *at, uint32_t mask)
> +{
> +    vsxger16(env, a, b, at, mask, true, false, false, extract_hf16);
> +}
> +
> +QEMU_FLATTEN
> +void helper_XVF16GER2PN(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
> +                        ppc_acc_t *at, uint32_t mask)
> +{
> +    vsxger16(env, a, b, at, mask, true, false, true, extract_hf16);
> +}
> +
> +QEMU_FLATTEN
> +void helper_XVF16GER2NP(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
> +                        ppc_acc_t *at, uint32_t mask)
> +{
> +    vsxger16(env, a, b, at, mask, true, true, false, extract_hf16);
> +}
> +
> +QEMU_FLATTEN
> +void helper_XVF16GER2NN(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
> +                        ppc_acc_t *at, uint32_t mask)
> +{
> +    vsxger16(env, a, b, at, mask, true, true, true, extract_hf16);
> +}
> +
>   QEMU_FLATTEN
>   void helper_XVF32GER(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
>                        ppc_acc_t *at, uint32_t mask)
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 054d25f3b0..7ab5ac8ee7 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -550,6 +550,11 @@ DEF_HELPER_5(XVI16GER2, void, env, vsr, vsr, acc, i32)
>   DEF_HELPER_5(XVI16GER2S, void, env, vsr, vsr, acc, i32)
>   DEF_HELPER_5(XVI16GER2PP, void, env, vsr, vsr, acc, i32)
>   DEF_HELPER_5(XVI16GER2SPP, void, env, vsr, vsr, acc, i32)
> +DEF_HELPER_5(XVF16GER2, void, env, vsr, vsr, acc, i32)
> +DEF_HELPER_5(XVF16GER2PP, void, env, vsr, vsr, acc, i32)
> +DEF_HELPER_5(XVF16GER2PN, void, env, vsr, vsr, acc, i32)
> +DEF_HELPER_5(XVF16GER2NP, void, env, vsr, vsr, acc, i32)
> +DEF_HELPER_5(XVF16GER2NN, void, env, vsr, vsr, acc, i32)
>   DEF_HELPER_5(XVF32GER, void, env, vsr, vsr, acc, i32)
>   DEF_HELPER_5(XVF32GERPP, void, env, vsr, vsr, acc, i32)
>   DEF_HELPER_5(XVF32GERPN, void, env, vsr, vsr, acc, i32)
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index c561a17c7d..c774227d8c 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -739,6 +739,12 @@ XVI8GER4SPP     111011 ... -- ..... ..... 01100011 ..-  @XX3_at xa=%xx_xa
>   XVI16GER2S      111011 ... -- ..... ..... 00101011 ..-  @XX3_at xa=%xx_xa
>   XVI16GER2SPP    111011 ... -- ..... ..... 00101010 ..-  @XX3_at xa=%xx_xa
>   
> +XVF16GER2       111011 ... -- ..... ..... 00010011 ..-  @XX3_at xa=%xx_xa
> +XVF16GER2PP     111011 ... -- ..... ..... 00010010 ..-  @XX3_at xa=%xx_xa
> +XVF16GER2PN     111011 ... -- ..... ..... 10010010 ..-  @XX3_at xa=%xx_xa
> +XVF16GER2NP     111011 ... -- ..... ..... 01010010 ..-  @XX3_at xa=%xx_xa
> +XVF16GER2NN     111011 ... -- ..... ..... 11010010 ..-  @XX3_at xa=%xx_xa
> +
>   XVF32GER        111011 ... -- ..... ..... 00011011 ..-  @XX3_at xa=%xx_xa
>   XVF32GERPP      111011 ... -- ..... ..... 00011010 ..-  @XX3_at xa=%xx_xa
>   XVF32GERPN      111011 ... -- ..... ..... 10011010 ..-  @XX3_at xa=%xx_xa
> diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
> index 76747956bb..232a4d881e 100644
> --- a/target/ppc/translate/vsx-impl.c.inc
> +++ b/target/ppc/translate/vsx-impl.c.inc
> @@ -2869,6 +2869,12 @@ TRANS64(PMXVI16GER2PP, do_ger, gen_helper_XVI16GER2PP)
>   TRANS64(PMXVI16GER2S, do_ger, gen_helper_XVI16GER2S)
>   TRANS64(PMXVI16GER2SPP, do_ger, gen_helper_XVI16GER2SPP)
>   
> +TRANS(XVF16GER2, do_ger, gen_helper_XVF16GER2)
> +TRANS(XVF16GER2PP, do_ger, gen_helper_XVF16GER2PP)
> +TRANS(XVF16GER2PN, do_ger, gen_helper_XVF16GER2PN)
> +TRANS(XVF16GER2NP, do_ger, gen_helper_XVF16GER2NP)
> +TRANS(XVF16GER2NN, do_ger, gen_helper_XVF16GER2NN)
> +
>   TRANS(XVF32GER, do_ger, gen_helper_XVF32GER)
>   TRANS(XVF32GERPP, do_ger, gen_helper_XVF32GERPP)
>   TRANS(XVF32GERPN, do_ger, gen_helper_XVF32GERPN)

