Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 164564C521C
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 00:35:31 +0100 (CET)
Received: from localhost ([::1]:46020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNk7V-00022U-Jj
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 18:35:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNinS-0008VT-A6
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 17:10:42 -0500
Received: from [2607:f8b0:4864:20::42d] (port=39757
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNinO-0005NR-Qn
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 17:10:41 -0500
Received: by mail-pf1-x42d.google.com with SMTP id y11so5863268pfa.6
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 14:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yD+4WyRFT2NIkfZgNALBF7TysjbpgXn3DO0cpT5wgO4=;
 b=j/RgyS5Cet3loPjdpQlGrM1mmNcsCG32gmRWndWD4DhEwifhso3dxuqLEXt9wSER7y
 vEoBOExPW6yJ0Ra4SqvYf1eiSwJ9//couWvFRHbdQrvoZrDAlcPhH5Rpb7O+e39J4321
 i9UiYEicqnFqAT8dTShv2gWbO8DaHMrFUBjWSc+q69hfzITJCD+dXHRD2bt/Wxt0+Kz5
 ZxHs+UMfh4MiI8eUWwPa4ZOHdUGZqwO6pmNnan8CJN/5sNqWe9gl6qEVoL/3qia2uhmd
 LOAJa5/hiPYnpBLeDZXpPbCS0FQ1AjB2NHmMz4ksczhUQ2BqROH44cNTVmT6U10BoTpa
 4CgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yD+4WyRFT2NIkfZgNALBF7TysjbpgXn3DO0cpT5wgO4=;
 b=Y8lUZnSRR3yN/oiuwjMvgM2gQW/K6/J+4osAGbM+qC07m1lI6gc2ATvT5LOhBCo8Gx
 xppIqQQ+DFEpcwmDXKmyrHk783kglixsRmMi3tfJZ9swm8CVdFKSkf/3mTTRQo8hk8JO
 auurc2z2MxuvZHnzsFZyaVMT/vDXjabCZW1g9OW14ZD0/LNbIgXn+0gmpzRn68LZ3NGe
 cRR5CmJpS5OQESp09bjqiQX+AvOHmeul0tbmHikPy8aCwGPRonQ4VS4NkiXUNG/PrI9j
 KFMOVqB4VD0oES0CWzam7lb++IE+PRdLsas0Bmb2509+Fn8H4EQj907sKz1iCCaidSQ/
 f06g==
X-Gm-Message-State: AOAM531Ej8Xrjep2PJzvA1U4vdOSfxKcOnEIt2DepQ4mR64rLDBF/SYz
 73OaciFl56lXssTJ66UYMpx7ig==
X-Google-Smtp-Source: ABdhPJzcun23zMaCk789kArmEMSYMiFt62Xq1qbedYauFuheKGGvCFhp8dr85Pws2+SvrPINutyunQ==
X-Received: by 2002:a63:1456:0:b0:373:c08c:124d with SMTP id
 22-20020a631456000000b00373c08c124dmr7877317pgu.363.1645827036392; 
 Fri, 25 Feb 2022 14:10:36 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 q13-20020aa7982d000000b004cb98a2ca35sm4667232pfl.211.2022.02.25.14.10.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 14:10:36 -0800 (PST)
Message-ID: <dcad7f45-098d-edaf-c061-970aa0353603@linaro.org>
Date: Fri, 25 Feb 2022 12:10:31 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 44/49] target/ppc: Refactor VSX_MAX_MINC helper
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
 <20220225210936.1749575-45-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220225210936.1749575-45-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/22 11:09, matheus.ferst@eldorado.org.br wrote:
> From: Víctor Colombo <victor.colombo@eldorado.org.br>
> 
> Refactor xs{max,min}cdp VSX_MAX_MINC helper to prepare for
> xs{max,min}cqp implementation.
> 
> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
> changes for v5:
> - use float_flag_invalid_snan as suggested by Richard Henderson
> ---
>   target/ppc/fpu_helper.c | 41 +++++++++++++++++------------------------
>   1 file changed, 17 insertions(+), 24 deletions(-)
> 
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index 4bfa1c4283..0aaf529ac8 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -2533,40 +2533,33 @@ VSX_MAX_MIN(xsmindp, minnum, 1, float64, VsrD(0))
>   VSX_MAX_MIN(xvmindp, minnum, 2, float64, VsrD(i))
>   VSX_MAX_MIN(xvminsp, minnum, 4, float32, VsrW(i))
>   
> -#define VSX_MAX_MINC(name, max)                                               \
> +#define VSX_MAX_MINC(name, max, tp, fld)                                      \
>   void helper_##name(CPUPPCState *env,                                          \
>                      ppc_vsr_t *xt, ppc_vsr_t *xa, ppc_vsr_t *xb)               \
>   {                                                                             \
>       ppc_vsr_t t = { };                                                        \
> -    bool vxsnan_flag = false, vex_flag = false;                               \
> +    bool first;                                                               \
>                                                                                 \
> -    if (unlikely(float64_is_any_nan(xa->VsrD(0)) ||                           \
> -                 float64_is_any_nan(xb->VsrD(0)))) {                          \
> -        if (float64_is_signaling_nan(xa->VsrD(0), &env->fp_status) ||         \
> -            float64_is_signaling_nan(xb->VsrD(0), &env->fp_status)) {         \
> -            vxsnan_flag = true;                                               \
> -        }                                                                     \
> -        t.VsrD(0) = xb->VsrD(0);                                              \
> -    } else if ((max &&                                                        \
> -               !float64_lt(xa->VsrD(0), xb->VsrD(0), &env->fp_status)) ||     \
> -               (!max &&                                                       \
> -               float64_lt(xa->VsrD(0), xb->VsrD(0), &env->fp_status))) {      \
> -        t.VsrD(0) = xa->VsrD(0);                                              \
> +    if (max) {                                                                \
> +        first = tp##_le_quiet(xb->fld, xa->fld, &env->fp_status);             \
>       } else {                                                                  \
> -        t.VsrD(0) = xb->VsrD(0);                                              \
> +        first = tp##_lt_quiet(xa->fld, xb->fld, &env->fp_status);             \
>       }                                                                         \
>                                                                                 \
> -    vex_flag = fpscr_ve & vxsnan_flag;                                        \
> -    if (vxsnan_flag) {                                                        \
> -        float_invalid_op_vxsnan(env, GETPC());                                \
> +    if (first) {                                                              \
> +        t.fld = xa->fld;                                                      \
> +    } else {                                                                  \
> +        t.fld = xb->fld;                                                      \
> +        if (env->fp_status.float_exception_flags & float_flag_invalid_snan) { \
> +            float_invalid_op_vxsnan(env, GETPC());                            \
> +        }                                                                     \
>       }                                                                         \
> -    if (!vex_flag) {                                                          \
> -        *xt = t;                                                              \
> -    }                                                                         \
> -}                                                                             \
> +                                                                              \
> +    *xt = t;                                                                  \
> +}

I just noticed that we're missing reset_fpstatus at the beginning here.
Since invalid via snan is the only possible exception for min/max, we do not need 
do_float_check_status at the end.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

