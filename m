Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7A16055C2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 05:05:50 +0200 (CEST)
Received: from localhost ([::1]:48476 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olLsR-0001C4-FX
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 23:05:47 -0400
Received: from [::1] (port=51160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olLrm-0000BI-O3
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 23:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLpd-0005vS-Um
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 23:02:54 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:37457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLpb-00082d-Q5
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 23:02:53 -0400
Received: by mail-pl1-x633.google.com with SMTP id d24so19065419pls.4
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 20:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OFp+YcBLplq+sW5ZLZa8zyrmmT+3glK5gS1NcK/HNrg=;
 b=K7F3gXnCTldyuvAkuTALg4VQLXv4ruYI/5OGyWCRYnX12YaDGhl8vbSesh9YXmLzJ+
 niGRyzbrb2oywy/ON1YsOu6rhM8yfYwK+8xXfPIFjNQEjiUn0o10yOZMeNV5EBTp+GJ0
 qqG8px3Qm58TGkoC1oMpVgj4B5TIkIOyTly7GzndUgjpHt6dQZFxxzBhnERNUnCAcDsC
 OPoyqKQ6yPDgbq9L5mydi9fTDG39l0jcMTxq806eQy1tdMmayBmClqxVoqx+eBQD/z28
 sswsUfP2cgaIRd3mCSe7x3UkeHwKA5uM4sDnypt7IVRMWh8PeeGCM2uJJc6RhCNuvSRt
 ZRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OFp+YcBLplq+sW5ZLZa8zyrmmT+3glK5gS1NcK/HNrg=;
 b=mXejqt2rMm8xB0zb80NH7gmub3+AvZ/0cz/XYZXOiRLM9U/FVukFfsnwx/KD+gB7aT
 6NUEcIV5LB+7i2uk2pNMWV7McFRcn9xi0riZQzEuHcX7wviDfsF4J0ALRk6n6dexgpzT
 2vPe/CMv6DFs6wYTRs6TDoPV4MdRIt8KgHq9sA4JrVovX7pXqLjTyuqsXE5a2qYTvCoy
 TpBW8MoQ9wkaUMON8HeaOudpTQAydjAGRD2G9+wOBSyLHtXaXFZhd+Ag3Sz87q1F/H3s
 4B/6P39ulWQy5NxZPn+asJGxG0aRgwKERQ7GLI9vydIQudEJ+Mq+j2FRp0QYSGsF9TuE
 FHqw==
X-Gm-Message-State: ACrzQf2+Zm15NvqAuV82bJe75Y9RJgd4cfz0J4zQ2zchzUz2aTP33UOS
 mz4fJqGiaLNRj0V3XrrZjoHP/Q==
X-Google-Smtp-Source: AMsMyM7TdfdduLudO18JO2iVuB2QCxuQK+gyoy4d+Bl5ethAWdbMhHnjYHiAZFaZwV6pmQ5zb5g5jQ==
X-Received: by 2002:a17:90b:38d1:b0:210:99f9:9712 with SMTP id
 nn17-20020a17090b38d100b0021099f99712mr4553943pjb.57.1666234968972; 
 Wed, 19 Oct 2022 20:02:48 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 e24-20020a656798000000b00454f8a8cc24sm10560429pgr.12.2022.10.19.20.02.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 20:02:48 -0700 (PDT)
Message-ID: <ce91008a-d9d3-853f-fed1-e064e5d49d9a@linaro.org>
Date: Thu, 20 Oct 2022 13:02:16 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 4/4] target/i386: implement FMA instructions
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221019150616.929463-1-pbonzini@redhat.com>
 <20221019150616.929463-5-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221019150616.929463-5-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/22 01:06, Paolo Bonzini wrote:
> The only issue with FMA instructions is that there are _a lot_ of them
> (30 opcodes, each of which comes in up to 4 versions depending on VEX.W
> and VEX.L).
> 
> We can reduce the number of helpers to one third by passing four operands
> (one output and three inputs); the reordering of which operands go to
> the multiply and which go to the add is done in emit.c.
> 
> Scalar versions do not do any merging; they only affect the bottom 32
> or 64 bits of the output operand.  Therefore, there is no separate XMM
> and YMM of the scalar helpers.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target/i386/cpu.c                |  5 ++-
>   target/i386/ops_sse.h            | 63 ++++++++++++++++++++++++++++++++
>   target/i386/ops_sse_header.h     | 28 ++++++++++++++
>   target/i386/tcg/decode-new.c.inc | 38 +++++++++++++++++++
>   target/i386/tcg/decode-new.h     |  1 +
>   target/i386/tcg/emit.c.inc       | 43 ++++++++++++++++++++++
>   tests/tcg/i386/test-avx.py       |  2 +-
>   7 files changed, 177 insertions(+), 3 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 6292b7e12f..22b681ca37 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -625,10 +625,11 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
>             CPUID_EXT_SSE41 | CPUID_EXT_SSE42 | CPUID_EXT_POPCNT | \
>             CPUID_EXT_XSAVE | /* CPUID_EXT_OSXSAVE is dynamic */   \
>             CPUID_EXT_MOVBE | CPUID_EXT_AES | CPUID_EXT_HYPERVISOR | \
> -          CPUID_EXT_RDRAND | CPUID_EXT_AVX | CPUID_EXT_F16C)
> +          CPUID_EXT_RDRAND | CPUID_EXT_AVX | CPUID_EXT_F16C | \
> +          CPUID_EXT_FMA)
>             /* missing:
>             CPUID_EXT_DTES64, CPUID_EXT_DSCPL, CPUID_EXT_VMX, CPUID_EXT_SMX,
> -          CPUID_EXT_EST, CPUID_EXT_TM2, CPUID_EXT_CID, CPUID_EXT_FMA,
> +          CPUID_EXT_EST, CPUID_EXT_TM2, CPUID_EXT_CID,
>             CPUID_EXT_XTPR, CPUID_EXT_PDCM, CPUID_EXT_PCID, CPUID_EXT_DCA,
>             CPUID_EXT_X2APIC, CPUID_EXT_TSC_DEADLINE_TIMER */
>   
> diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
> index 33c61896ee..041a048a70 100644
> --- a/target/i386/ops_sse.h
> +++ b/target/i386/ops_sse.h
> @@ -2522,6 +2522,69 @@ void helper_vpermd_ymm(Reg *d, Reg *v, Reg *s)
>   }
>   #endif
>   
> +/* FMA3 op helpers */
> +#if SHIFT == 1
> +#define SSE_HELPER_FMAS(name, elem, F)                                         \
> +    void name(CPUX86State *env, Reg *d, Reg *a, Reg *b, Reg *c)                \
> +    {                                                                          \
> +        d->elem(0) = F(a->elem(0), b->elem(0), c->elem(0));                    \
> +    }
> +#define SSE_HELPER_FMAP(name, elem, num, F)                                    \
> +    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *a, Reg *b, Reg *c)  \
> +    {                                                                          \
> +        int i;                                                                 \
> +        for (i = 0; i < num; i++) {                                            \
> +            d->elem(i) = F(a->elem(i), b->elem(i), c->elem(i));                \
> +        }                                                                      \
> +    }
> +
> +#define FMADD32(a, b, c) float32_muladd(a, b, c, 0, &env->sse_status)
> +#define FMADD64(a, b, c) float64_muladd(a, b, c, 0, &env->sse_status)
> +
> +#define FMNADD32(a, b, c) float32_muladd(a, b, c, float_muladd_negate_product, &env->sse_status)
> +#define FMNADD64(a, b, c) float64_muladd(a, b, c, float_muladd_negate_product, &env->sse_status)
> +
> +#define FMSUB32(a, b, c) float32_muladd(a, b, c, float_muladd_negate_c, &env->sse_status)
> +#define FMSUB64(a, b, c) float64_muladd(a, b, c, float_muladd_negate_c, &env->sse_status)
> +
> +#define FMNSUB32(a, b, c) float32_muladd(a, b, c, float_muladd_negate_c|float_muladd_negate_product, &env->sse_status)
> +#define FMNSUB64(a, b, c) float64_muladd(a, b, c, float_muladd_negate_c|float_muladd_negate_product, &env->sse_status)
> +
> +#define FMADDSUB32(a, b, c) float32_muladd(a, b, c, (i & 1) ? 0 : float_muladd_negate_c, &env->sse_status)
> +#define FMADDSUB64(a, b, c) float64_muladd(a, b, c, (i & 1) ? 0 : float_muladd_negate_c, &env->sse_status)
> +
> +#define FMSUBADD32(a, b, c) float32_muladd(a, b, c, (i & 1) ? float_muladd_negate_c : 0, &env->sse_status)
> +#define FMSUBADD64(a, b, c) float64_muladd(a, b, c, (i & 1) ? float_muladd_negate_c : 0, &env->sse_status)
> +
> +SSE_HELPER_FMAS(helper_fmaddss,  ZMM_S,             FMADD32)
> +SSE_HELPER_FMAS(helper_fmaddsd,  ZMM_D,             FMADD64)
> +SSE_HELPER_FMAS(helper_fmnaddss, ZMM_S,             FMNADD32)
> +SSE_HELPER_FMAS(helper_fmnaddsd, ZMM_D,             FMNADD64)
> +SSE_HELPER_FMAS(helper_fmsubss,  ZMM_S,             FMSUB32)
> +SSE_HELPER_FMAS(helper_fmsubsd,  ZMM_D,             FMSUB64)
> +SSE_HELPER_FMAS(helper_fmnsubss, ZMM_S,             FMNSUB32)
> +SSE_HELPER_FMAS(helper_fmnsubsd, ZMM_D,             FMNSUB64)

Would it be worth passing the muladd constant(s) as a parameter to a reduced number of 
helper functions?

E.g.

void fmas_name(..., int flags)
{
     d = type_muladd(a, b, c, flags, status);
}

void fmap_name(..., int flags2)
{
     int f_even = flags2 & 0xf;
     int f_odd = flags2 >> 4;
     for (int i = 0; i < num; ) {
        d(i) = type_muladd(a(i), b(i), c(i), f_even, status);
        i++;
        d(i) = type_muladd(a(i), b(i), c(i), f_odd, status);
        i++;
     }

> +#define FMA_SSE_PACKED(uname, lname, ptr0, ptr1, ptr2)                             \
> +static void gen_##uname##Px(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
> +{                                                                                  \
> +    SSEFunc_0_epppp xmm = s->vex_w ? gen_helper_##lname##pd_xmm : gen_helper_##lname##ps_xmm; \
> +    SSEFunc_0_epppp ymm = s->vex_w ? gen_helper_##lname##pd_ymm : gen_helper_##lname##ps_ymm; \
> +    SSEFunc_0_epppp fn = s->vex_l ? ymm : xmm;                                     \
> +                                                                                   \
> +    fn(cpu_env, OP_PTR0, ptr0, ptr1, ptr2);                                        \
> +}
> +
> +#define FMA_SSE(uname, lname, ptr0, ptr1, ptr2)                                    \
> +FMA_SSE_PACKED(uname, lname, ptr0, ptr1, ptr2)                                     \
> +static void gen_##uname##Sx(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
> +{                                                                                  \
> +    SSEFunc_0_epppp fn = s->vex_w ? gen_helper_##lname##sd : gen_helper_##lname##ss; \
> +                                                                                   \
> +    fn(cpu_env, OP_PTR0, ptr0, ptr1, ptr2);                                        \
> +}                                                                                  \
> +
> +FMA_SSE(VFMADD231,    fmadd,    OP_PTR1, OP_PTR2, OP_PTR0)
> +FMA_SSE(VFMADD213,    fmadd,    OP_PTR1, OP_PTR0, OP_PTR2)
> +FMA_SSE(VFMADD132,    fmadd,    OP_PTR0, OP_PTR2, OP_PTR1)
> +
> +FMA_SSE(VFNMADD231,   fmnadd,   OP_PTR1, OP_PTR2, OP_PTR0)
> +FMA_SSE(VFNMADD213,   fmnadd,   OP_PTR1, OP_PTR0, OP_PTR2)
> +FMA_SSE(VFNMADD132,   fmnadd,   OP_PTR0, OP_PTR2, OP_PTR1)
> +
> +FMA_SSE(VFMSUB231,    fmsub,    OP_PTR1, OP_PTR2, OP_PTR0)
> +FMA_SSE(VFMSUB213,    fmsub,    OP_PTR1, OP_PTR0, OP_PTR2)
> +FMA_SSE(VFMSUB132,    fmsub,    OP_PTR0, OP_PTR2, OP_PTR1)
> +
> +FMA_SSE(VFNMSUB231,   fmnsub,   OP_PTR1, OP_PTR2, OP_PTR0)
> +FMA_SSE(VFNMSUB213,   fmnsub,   OP_PTR1, OP_PTR0, OP_PTR2)
> +FMA_SSE(VFNMSUB132,   fmnsub,   OP_PTR0, OP_PTR2, OP_PTR1)
> +
> +FMA_SSE_PACKED(VFMADDSUB231, fmaddsub, OP_PTR1, OP_PTR2, OP_PTR0)
> +FMA_SSE_PACKED(VFMADDSUB213, fmaddsub, OP_PTR1, OP_PTR0, OP_PTR2)
> +FMA_SSE_PACKED(VFMADDSUB132, fmaddsub, OP_PTR0, OP_PTR2, OP_PTR1)
> +
> +FMA_SSE_PACKED(VFMSUBADD231, fmsubadd, OP_PTR1, OP_PTR2, OP_PTR0)
> +FMA_SSE_PACKED(VFMSUBADD213, fmsubadd, OP_PTR1, OP_PTR0, OP_PTR2)
> +FMA_SSE_PACKED(VFMSUBADD132, fmsubadd, OP_PTR0, OP_PTR2, OP_PTR1)

Is it more or less confusing to macroize this further?

#define MULADD_S_VFMADD  0
#define MULADD_S_VFMSUB  float_muladd_negate_c
...
#define MULADD_P_VFMADD  (MULADD_S_VFMADD * 0x11)
#define MULADD_P_VFMSUB  (MULADD_S_VFMSUB * 0x11)
...
#define MULADD_P_VFMADDSUB (MULADD_S_VFMADD * 0x10 + MULADD_S_VFMSUB)
#define MULADD_P_VFMSUBADD (MULADD_S_VFMSUB * 0x10 + MULADD_S_VFMADD)

#define OP_PTR1   OP_PTR1
#define OP_PTR2_231   OP_PTR2
#define OP_PTR3_231   OP_PTR0
...

#define FMA_SSE_PACKED(uname, lname, order)     \
static void name(args) {                        \
    fn = select;                                 \
    fn(cpu_env, OP_PTR0,                         \
       glue(OP_PTR_1_,order),                    \
       glue(OP_PTR_2_,order),                    \
       glue(OP_PTR_3_,order),                    \
       tcg_constant_i32(glue(MULADD_P_,UNAME))); \
}

#define FMA_SSE(uname, lname, order)            \
FMA_SSE_PACKED(uname, lname, order)             \
static void name(args) {                        \
    fn = select;                                 \
    fn(cpu_env, OP_PTR0,                         \
       glue(OP_PTR_1_,order),                    \
       glue(OP_PTR_2_,order),                    \
       glue(OP_PTR_3_,order),                    \
       tcg_constant_i32(glue(MULADD_S_,UNAME))); \
}

FMA_SSE(VFMADD, fmadd, 231)
FMA_SSE(VFMADD, fmadd, 213)
FMA_SSE(VFMADD, fmadd, 132)

etc.


r~

