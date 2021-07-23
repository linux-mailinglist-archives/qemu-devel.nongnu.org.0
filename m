Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C75EF3D3160
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 03:47:33 +0200 (CEST)
Received: from localhost ([::1]:46918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6kHk-0000Kr-BU
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 21:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6kG1-0007Td-BI
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 21:45:45 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:43777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6kFx-0006jw-IP
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 21:45:45 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 m2-20020a17090a71c2b0290175cf22899cso1793795pjs.2
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 18:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BRaK121Qr8Kisg2xSSKcUGGR2F6qHZ78u5bqy7/sSfk=;
 b=WfomkOp+SpkMKrUvu6hUACheyFZf58aTwz3ewxuO28ZDmZweO9h2c6eUCZiBjIfruC
 cS45ZedzkVGH8svPF4Y1rTvKBL7srxEBcEYKcavTRTUOA9bfTSfkslIHCFuU0M9vkJgt
 sxXbntLAorxkrimeGX9c+nIiZEe66JIe2UC16cDp1SY9aDwBNgf7W5CikbT42gwdOQ1q
 TUzjWP/Yj4HRT1IkRdvJLnFXnVS6QlbQjZBRyv5uKFPLYS4ALMA1z/vUBZNkfSal/gA9
 BEFRuYC6OIL91w9NPmnzKAtJwyz+D7Dg8562q/EDSPVM58YAjfhm5mUAkeM3ZzXPvX+t
 qHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BRaK121Qr8Kisg2xSSKcUGGR2F6qHZ78u5bqy7/sSfk=;
 b=CmiM4Y59ajpwdV8vIg5OlyLeJ0mcUj4husfnggMXe68i6KxALxIyDKQBgxSUbmvSU1
 ckkME988PumQ54PC6V4KwG6/BsjdhDk1OxcidHDRD69VFNOA78a6F+m7/Bhpw0L2SsBK
 XKI8VSWOdRguabraIr8kCbN33hO9ekKiKCwbKjz7WAFon4+fwvO6yvAQQ47Xy7mwvebM
 /OD+s6LiUn2QJp2QWR/prtQCaVqam2Wamb/YRUeO34Z6jhD9/XlDnPYxIOv/mer+SD8R
 I/MtTlPricafN09r8z0TIG0pYvijHD3c+wPCbjT/k5pfaQmWSq5SqaAw3HkLUP1MISav
 QHrA==
X-Gm-Message-State: AOAM532Qw2DtVJW3Ih8gl7dJf4bANwYBWlhyYTvjGLWpS9OiWrMEL0JZ
 vTdnEHAt1bjBSfSclmUf97jnsQ==
X-Google-Smtp-Source: ABdhPJyHvhf3c+p5ocd4hN5zXS/+r8sMhpR5B8DwiQtvsLu4mEFamqmytTvHVyn1AG2N0Bsi8Zfsqg==
X-Received: by 2002:a17:90b:398:: with SMTP id
 ga24mr11670036pjb.121.1627004739915; 
 Thu, 22 Jul 2021 18:45:39 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id h19sm29616680pfo.161.2021.07.22.18.45.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 18:45:39 -0700 (PDT)
Subject: Re: [PATCH v2 10/22] target/loongarch: Add fixed point load/store
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-11-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <166c1101-fb3c-4e33-9584-121d06200af6@linaro.org>
Date: Thu, 22 Jul 2021 15:45:35 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626861198-6133-11-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.203,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, yangxiaojuan@loongson.cn, laurent@vivier.eu,
 maobibo@loongson.cn, alistair.francis@wdc.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 11:53 PM, Song Gao wrote:
> This patch implement fixed point load/store instruction translation.
> 
> This includes:
> - LD.{B[U]/H[U]/W[U]/D}, ST.{B/H/W/D}
> - LDX.{B[U]/H[U]/W[U]/D}, STX.{B/H/W/D}
> - LDPTR.{W/D}, STPTR.{W/D}
> - PRELD
> - LD{GT/LE}.{B/H/W/D}, ST{GT/LE}.{B/H/W/D}
> - DBAR, IBAR
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   target/loongarch/helper.h     |   3 +
>   target/loongarch/insns.decode |  58 ++++
>   target/loongarch/op_helper.c  |  15 +
>   target/loongarch/trans.inc.c  | 758 ++++++++++++++++++++++++++++++++++++++++++
>   target/loongarch/translate.c  |  29 ++
>   5 files changed, 863 insertions(+)
> 
> diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
> index bbbcc26..5cd38c8 100644
> --- a/target/loongarch/helper.h
> +++ b/target/loongarch/helper.h
> @@ -18,3 +18,6 @@ DEF_HELPER_2(bitrev_d, tl, env, tl)
>   
>   DEF_HELPER_FLAGS_1(loongarch_bitswap, TCG_CALL_NO_RWG_SE, tl, tl)
>   DEF_HELPER_FLAGS_1(loongarch_dbitswap, TCG_CALL_NO_RWG_SE, tl, tl)
> +
> +DEF_HELPER_3(asrtle_d, void, env, tl, tl)
> +DEF_HELPER_3(asrtgt_d, void, env, tl, tl)
> diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
> index ec599a9..08fd232 100644
> --- a/target/loongarch/insns.decode
> +++ b/target/loongarch/insns.decode
> @@ -24,6 +24,9 @@
>   %lsbw    10:5
>   %msbd    16:6
>   %lsbd    10:6
> +%si14    10:s14
> +%hint    0:5
> +%whint   0:15
>   
>   #
>   # Argument sets
> @@ -40,6 +43,9 @@
>   &fmt_rdrjrksa3      rd rj rk sa3
>   &fmt_rdrjmsbwlsbw   rd rj msbw lsbw
>   &fmt_rdrjmsbdlsbd   rd rj msbd lsbd
> +&fmt_rdrjsi14       rd rj si14
> +&fmt_hintrjsi12     hint rj si12
> +&fmt_whint          whint
>   
>   #
>   # Formats
> @@ -56,6 +62,9 @@
>   @fmt_rdrjmsbwlsbw    .... ....... ..... . ..... ..... .....   &fmt_rdrjmsbwlsbw   %rd %rj %msbw %lsbw
>   @fmt_rdrjmsbdlsbd    .... ...... ...... ...... ..... .....    &fmt_rdrjmsbdlsbd   %rd %rj %msbd %lsbd
>   @fmt_rdrjrksa3       .... ........ .. ... ..... ..... .....   &fmt_rdrjrksa3      %rd %rj %rk %sa3
> +@fmt_hintrjsi12      .... ...... ............ ..... .....     &fmt_hintrjsi12     %hint %rj %si12
> +@fmt_whint           .... ........ ..... ...............      &fmt_whint          %whint
> +@fmt_rdrjsi14        .... .... .............. ..... .....     &fmt_rdrjsi14       %rd %rj %si14
>   
>   #
>   # Fixed point arithmetic operation instruction
> @@ -158,3 +167,52 @@ bstrins_w        0000 0000011 ..... 0 ..... ..... .....   @fmt_rdrjmsbwlsbw
>   bstrpick_w       0000 0000011 ..... 1 ..... ..... .....   @fmt_rdrjmsbwlsbw
>   bstrins_d        0000 000010 ...... ...... ..... .....    @fmt_rdrjmsbdlsbd
>   bstrpick_d       0000 000011 ...... ...... ..... .....    @fmt_rdrjmsbdlsbd
> +
> +#
> +# Fixed point load/store instruction
> +#
> +ld_b             0010 100000 ............ ..... .....     @fmt_rdrjsi12
> +ld_h             0010 100001 ............ ..... .....     @fmt_rdrjsi12
> +ld_w             0010 100010 ............ ..... .....     @fmt_rdrjsi12
> +ld_d             0010 100011 ............ ..... .....     @fmt_rdrjsi12
> +st_b             0010 100100 ............ ..... .....     @fmt_rdrjsi12
> +st_h             0010 100101 ............ ..... .....     @fmt_rdrjsi12
> +st_w             0010 100110 ............ ..... .....     @fmt_rdrjsi12
> +st_d             0010 100111 ............ ..... .....     @fmt_rdrjsi12
> +ld_bu            0010 101000 ............ ..... .....     @fmt_rdrjsi12
> +ld_hu            0010 101001 ............ ..... .....     @fmt_rdrjsi12
> +ld_wu            0010 101010 ............ ..... .....     @fmt_rdrjsi12
> +ldx_b            0011 10000000 00000 ..... ..... .....    @fmt_rdrjrk
> +ldx_h            0011 10000000 01000 ..... ..... .....    @fmt_rdrjrk
> +ldx_w            0011 10000000 10000 ..... ..... .....    @fmt_rdrjrk
> +ldx_d            0011 10000000 11000 ..... ..... .....    @fmt_rdrjrk
> +stx_b            0011 10000001 00000 ..... ..... .....    @fmt_rdrjrk
> +stx_h            0011 10000001 01000 ..... ..... .....    @fmt_rdrjrk
> +stx_w            0011 10000001 10000 ..... ..... .....    @fmt_rdrjrk
> +stx_d            0011 10000001 11000 ..... ..... .....    @fmt_rdrjrk
> +ldx_bu           0011 10000010 00000 ..... ..... .....    @fmt_rdrjrk
> +ldx_hu           0011 10000010 01000 ..... ..... .....    @fmt_rdrjrk
> +ldx_wu           0011 10000010 10000 ..... ..... .....    @fmt_rdrjrk
> +preld            0010 101011 ............ ..... .....     @fmt_hintrjsi12
> +dbar             0011 10000111 00100 ...............      @fmt_whint
> +ibar             0011 10000111 00101 ...............      @fmt_whint
> +ldptr_w          0010 0100 .............. ..... .....     @fmt_rdrjsi14
> +stptr_w          0010 0101 .............. ..... .....     @fmt_rdrjsi14
> +ldptr_d          0010 0110 .............. ..... .....     @fmt_rdrjsi14
> +stptr_d          0010 0111 .............. ..... .....     @fmt_rdrjsi14
> +ldgt_b           0011 10000111 10000 ..... ..... .....    @fmt_rdrjrk
> +ldgt_h           0011 10000111 10001 ..... ..... .....    @fmt_rdrjrk
> +ldgt_w           0011 10000111 10010 ..... ..... .....    @fmt_rdrjrk
> +ldgt_d           0011 10000111 10011 ..... ..... .....    @fmt_rdrjrk
> +ldle_b           0011 10000111 10100 ..... ..... .....    @fmt_rdrjrk
> +ldle_h           0011 10000111 10101 ..... ..... .....    @fmt_rdrjrk
> +ldle_w           0011 10000111 10110 ..... ..... .....    @fmt_rdrjrk
> +ldle_d           0011 10000111 10111 ..... ..... .....    @fmt_rdrjrk
> +stgt_b           0011 10000111 11000 ..... ..... .....    @fmt_rdrjrk
> +stgt_h           0011 10000111 11001 ..... ..... .....    @fmt_rdrjrk
> +stgt_w           0011 10000111 11010 ..... ..... .....    @fmt_rdrjrk
> +stgt_d           0011 10000111 11011 ..... ..... .....    @fmt_rdrjrk
> +stle_b           0011 10000111 11100 ..... ..... .....    @fmt_rdrjrk
> +stle_h           0011 10000111 11101 ..... ..... .....    @fmt_rdrjrk
> +stle_w           0011 10000111 11110 ..... ..... .....    @fmt_rdrjrk
> +stle_d           0011 10000111 11111 ..... ..... .....    @fmt_rdrjrk
> diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
> index 07c3d52..738e067 100644
> --- a/target/loongarch/op_helper.c
> +++ b/target/loongarch/op_helper.c
> @@ -144,3 +144,18 @@ target_ulong helper_loongarch_bitswap(target_ulong rt)
>   {
>       return (int32_t)bitswap(rt);
>   }
> +
> +/* loongarch assert op */
> +void helper_asrtle_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
> +{
> +    if (rj > rk) {
> +        do_raise_exception(env, EXCP_ADE, GETPC());
> +    }
> +}
> +
> +void helper_asrtgt_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
> +{
> +    if (rj <= rk) {
> +        do_raise_exception(env, EXCP_ADE, GETPC());
> +    }
> +}
> diff --git a/target/loongarch/trans.inc.c b/target/loongarch/trans.inc.c
> index 8c5ba63..e38001b 100644
> --- a/target/loongarch/trans.inc.c
> +++ b/target/loongarch/trans.inc.c
> @@ -2116,3 +2116,761 @@ static bool trans_bstrpick_w(DisasContext *ctx, arg_bstrpick_w *a)
>   
>       return true;
>   }
> +
> +/* Fixed point load/store instruction translation */
> +static bool trans_ld_b(DisasContext *ctx, arg_ld_b *a)
> +{
> +    TCGv t0;
> +    TCGv Rd = cpu_gpr[a->rd];
> +    int mem_idx = ctx->mem_idx;
> +
> +    if (a->rd == 0) {
> +        /* Nop */
> +        return true;
> +    }

A load into the zero register is not a nop.  It is a load with the result discarded.  One 
should still fault if the load is to an invalid address.

You should be using a common routine, passing in the MO_* operand.

> +#define ASRTGT                                \
> +    do {                                      \
> +        TCGv t1 = get_gpr(a->rj);             \
> +        TCGv t2 = get_gpr(a->rk);             \
> +        gen_helper_asrtgt_d(cpu_env, t1, t2); \
> +    } while (0)
> +
> +#define ASRTLE                                \
> +    do {                                      \
> +        TCGv t1 = get_gpr(a->rj);             \
> +        TCGv t2 = get_gpr(a->rk);             \
> +        gen_helper_asrtle_d(cpu_env, t1, t2); \
> +    } while (0)
> +
> +#define DECL_ARG(name)   \
> +    arg_ ## name arg = { \
> +        .rd = a->rd,     \
> +        .rj = a->rj,     \
> +        .rk = a->rk,     \
> +    };
> +
> +static bool trans_ldgt_b(DisasContext *ctx, arg_ldgt_b *a)
> +{
> +    ASRTGT;
> +    DECL_ARG(ldx_b)
> +    trans_ldx_b(ctx, &arg);
> +    return true;
> +}

Use of a common routine would avoid the macro ugliness.


r~

