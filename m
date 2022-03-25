Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFCA4E725D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 12:38:21 +0100 (CET)
Received: from localhost ([::1]:38568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXiGq-0001y1-1v
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 07:38:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nXiF0-0001FI-Qs; Fri, 25 Mar 2022 07:36:30 -0400
Received: from [2001:4860:4864:20::2d] (port=41881
 helo=mail-oa1-x2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nXiEz-0000Bq-8E; Fri, 25 Mar 2022 07:36:26 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-dd9d3e7901so7810888fac.8; 
 Fri, 25 Mar 2022 04:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=clqUHIpzlop/ql19DRkkBcFw8u+vRNBI79YzaU6tOXk=;
 b=hl+fhhEvWwgjN4xsiMOk6YihORkJmZn0OGCauJ+gc2uV+Nflw90ngIyi81yW+XAbHS
 p830FGHmpYmT+Ry+ZgctpzXIrHl4lmjkTEdX5xO5wk8wxOQwLq/pZaqcV16oNsUoPHPR
 dtCzDEdwJvhYqcQPQYwtKQM8L0Ly2ZxiQnZT2owaC0kpQWRWhpsxShs6ZIQbbevfu4nd
 /hmPvg8YYkI+Sc6W9l7HfjIA6/NROs2gZqaCddYldEJQBKW5OAK/zZL+6MHXalWCz/1/
 +mRissyZfvdUJ2ztH7tEWC2DvvEOQleyQPl01F1b9OONfYdpur5amqioJtFcx9daAs0M
 CAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=clqUHIpzlop/ql19DRkkBcFw8u+vRNBI79YzaU6tOXk=;
 b=AzJ7uRfXkURm2NVP0zURlUKhxeIHrw4PUNugwAJR8q6Oq72FdsOPOEthtCQE0HemAI
 a9TxdU/E/7bXZEgv0uI3h+m+kFGjreW6OWIQZnJszvRXnlAiK2CaSlDB+J51DB+4v7fd
 TcT9r/fSK/e7mvWUQIWZZ5UuvRSTlZeDhtbN0yJt1YGMgMw1wG5cPDI2RB619TOrSgYK
 gRn+Gzgbwu9+vl6CdyBIJXc4Uz7uUG/EyGh7Ed2BPV35Nx3DfwhX8py6isjuHFqF7Bit
 9WXA6X5jYCF2/VPIHC3jsGE1fqFed09xLdSaNP6dl0d1QpUOzFCW2e27z4+Wm0iim+6V
 MJaw==
X-Gm-Message-State: AOAM533474kq/SMw7/Y5YxUdL7iNfT5udR4s/InBDX25S4q9Ebt0UfJR
 On7AfXj2ZjzlTsC1ns7LETk=
X-Google-Smtp-Source: ABdhPJyAek99ftDjIPoFen9GCyyNHq9dHbaq4JMhjmSaMXiVHRQgo68eQi4TJwk/+snMk7hC0P/2Eg==
X-Received: by 2002:a05:6870:1c7:b0:dd:b257:1bb5 with SMTP id
 n7-20020a05687001c700b000ddb2571bb5mr8511911oad.45.1648208183415; 
 Fri, 25 Mar 2022 04:36:23 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:8271:32d5:64c:7754:f033?
 ([2804:431:c7c7:8271:32d5:64c:7754:f033])
 by smtp.gmail.com with ESMTPSA id
 r19-20020acaa813000000b002ed02ca6a3fsm2670474oie.1.2022.03.25.04.36.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 04:36:23 -0700 (PDT)
Message-ID: <322651fb-0230-e894-898f-87bb92d9d11b@gmail.com>
Date: Fri, 25 Mar 2022 08:36:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.0] target/ppc: fix helper_xvmadd* argument order
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220325111851.718966-1-matheus.ferst@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220325111851.718966-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2d
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 groug@kaod.org, richard.henderson@linaro.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/25/22 08:18, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> When the xsmadd* insns were moved to decodetree, the helper arguments
> were reordered to better match the PowerISA description. The same macro
> is used to declare xvmadd* helpers, but the translation macro of these
> insns was not changed accordingly.
> 
> Reported-by: Víctor Colombo <victor.colombo@eldorado.org.br>
> Fixes: e4318ab2e423 ("target/ppc: move xs[n]madd[am][ds]p/xs[n]msub[am][ds]p to decodetree")
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/translate/vsx-impl.c.inc | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
> index e67fbf2bb8..d1f6333314 100644
> --- a/target/ppc/translate/vsx-impl.c.inc
> +++ b/target/ppc/translate/vsx-impl.c.inc
> @@ -1324,31 +1324,31 @@ TRANS(XSNMSUBQP, do_xsmadd_X, gen_helper_XSNMSUBQP, gen_helper_XSNMSUBQPO)
>   #define GEN_VSX_HELPER_VSX_MADD(name, op1, aop, mop, inval, type)             \
>   static void gen_##name(DisasContext *ctx)                                     \
>   {                                                                             \
> -    TCGv_ptr xt, xa, b, c;                                                    \
> +    TCGv_ptr xt, s1, s2, s3;                                                  \
>       if (unlikely(!ctx->vsx_enabled)) {                                        \
>           gen_exception(ctx, POWERPC_EXCP_VSXU);                                \
>           return;                                                               \
>       }                                                                         \
>       xt = gen_vsr_ptr(xT(ctx->opcode));                                        \
> -    xa = gen_vsr_ptr(xA(ctx->opcode));                                        \
> +    s1 = gen_vsr_ptr(xA(ctx->opcode));                                        \
>       if (ctx->opcode & PPC_BIT32(25)) {                                        \
>           /*                                                                    \
>            * AxT + B                                                            \
>            */                                                                   \
> -        b = gen_vsr_ptr(xT(ctx->opcode));                                     \
> -        c = gen_vsr_ptr(xB(ctx->opcode));                                     \
> +        s2 = gen_vsr_ptr(xB(ctx->opcode));                                    \
> +        s3 = gen_vsr_ptr(xT(ctx->opcode));                                    \
>       } else {                                                                  \
>           /*                                                                    \
>            * AxB + T                                                            \
>            */                                                                   \
> -        b = gen_vsr_ptr(xB(ctx->opcode));                                     \
> -        c = gen_vsr_ptr(xT(ctx->opcode));                                     \
> +        s2 = gen_vsr_ptr(xT(ctx->opcode));                                    \
> +        s3 = gen_vsr_ptr(xB(ctx->opcode));                                    \
>       }                                                                         \
> -    gen_helper_##name(cpu_env, xt, xa, b, c);                                 \
> +    gen_helper_##name(cpu_env, xt, s1, s2, s3);                               \
>       tcg_temp_free_ptr(xt);                                                    \
> -    tcg_temp_free_ptr(xa);                                                    \
> -    tcg_temp_free_ptr(b);                                                     \
> -    tcg_temp_free_ptr(c);                                                     \
> +    tcg_temp_free_ptr(s1);                                                    \
> +    tcg_temp_free_ptr(s2);                                                    \
> +    tcg_temp_free_ptr(s3);                                                    \
>   }
>   
>   GEN_VSX_HELPER_VSX_MADD(xvmadddp, 0x04, 0x0C, 0x0D, 0, PPC2_VSX)

