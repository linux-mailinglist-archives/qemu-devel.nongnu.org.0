Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 199204C0666
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 01:51:46 +0100 (CET)
Received: from localhost ([::1]:44538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMfse-0006l9-NB
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 19:51:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMfiL-0004Oc-0W
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 19:41:05 -0500
Received: from [2607:f8b0:4864:20::529] (port=39604
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMfi8-00061r-VQ
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 19:41:01 -0500
Received: by mail-pg1-x529.google.com with SMTP id 195so18425216pgc.6
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 16:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=A4poQZqgt4ITlG9XDbKrko1hNLQ/tcd/a7CuYWb+U34=;
 b=KKdtbdtQZgOj9Cx4qG3zNHudFbSnyO+5WGQwoFJdtrpHlW86NUh6WqSt3Xf0tuJmvl
 44IbRL22QWTomtPRJ6Vj7+O+2jQGVDs3xQv8owv7UtpZ8G6sHQA+86omv9kiPscPlBE6
 rRDrY0OMZlz23ba2So/ATAsvJxbCpYgHj5t0zOwm0nwUXUBT4tdUIfI/m2kJcoPM91cg
 tRoHh1qeNY0+lFdF+mSz1VPHPK1beXEXHTKMcUSRCx/qT37w/vkhPbWFgvkPJulVzHlR
 O2hvPBei3UV2HRjd4F1dOSOjext3utwONeN59I13TaPcRweM1DG6wlhVYTChEIpettF2
 /BjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A4poQZqgt4ITlG9XDbKrko1hNLQ/tcd/a7CuYWb+U34=;
 b=X/20QMcd5/UngMUeQsErXd1wnB+jcmvPj/y4E8XlazW/h4wuWRv2BWmOClMm+NwY00
 NL7QyuUddITDG8Y3nNSIXUKTsN0PhSWJB+AXF+G047FT/loUWWXEtZ9KMDn7Zl2BYTtU
 xID5S2JrXNiIV7OxE9YjMpdvlah/3ctGe5ovGcp94lfUqJPa4GfsMtzLr2ALrelKkdFn
 xqpFwdBAqzfUePzaYcDDcot5ViKYKqten36+6IBT3Q+vrNIOoFXdf7941rLC0dPLvrHz
 UsMHrq08nSzz01A5YLtqpGxDhVAdPBvfTG1F3oQXuCen41kZvLuHydkRSyVCy42SH7Y3
 26tg==
X-Gm-Message-State: AOAM531gSGH5pU08cYtn49Qe59FMeOaGlz6lgT7wYuKvfCoS70VRILC3
 jiUsWNAHcaJYIXABL6rTU1+EWA==
X-Google-Smtp-Source: ABdhPJyd/3DGazNIMU69VeL2K3CpY15sPX2FO4n5n73jL0SktBRlRWuOamS3VmhBJjRt02a4eNFQ1w==
X-Received: by 2002:a65:4845:0:b0:325:c147:146d with SMTP id
 i5-20020a654845000000b00325c147146dmr22177298pgs.140.1645576851565; 
 Tue, 22 Feb 2022 16:40:51 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id d18sm15148100pfl.206.2022.02.22.16.40.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 16:40:51 -0800 (PST)
Message-ID: <17d98bf2-c89f-4820-93ee-3079fc538b40@linaro.org>
Date: Tue, 22 Feb 2022 14:40:47 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 42/47] target/ppc: Refactor VSX_MAX_MINC helper
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-43-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-43-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> -#define VSX_MAX_MINC(name, max)                                               \
> +#define VSX_MAX_MINC(name, op, tp, fld)                                       \
>   void helper_##name(CPUPPCState *env,                                          \
>                      ppc_vsr_t *xt, ppc_vsr_t *xa, ppc_vsr_t *xb)               \
>   {                                                                             \
>       ppc_vsr_t t = { };                                                        \
>       bool vxsnan_flag = false, vex_flag = false;                               \
>                                                                                 \
> -    if (unlikely(float64_is_any_nan(xa->VsrD(0)) ||                           \
> -                 float64_is_any_nan(xb->VsrD(0)))) {                          \
> -        if (float64_is_signaling_nan(xa->VsrD(0), &env->fp_status) ||         \
> -            float64_is_signaling_nan(xb->VsrD(0), &env->fp_status)) {         \
> +    if (unlikely(tp##_is_any_nan(xa->fld) ||                                  \
> +                 tp##_is_any_nan(xb->fld))) {                                 \
> +        if (tp##_is_signaling_nan(xa->fld, &env->fp_status) ||                \
> +            tp##_is_signaling_nan(xb->fld, &env->fp_status)) {                \
>               vxsnan_flag = true;                                               \
>           }                                                                     \
> -        t.VsrD(0) = xb->VsrD(0);                                              \
> -    } else if ((max &&                                                        \
> -               !float64_lt(xa->VsrD(0), xb->VsrD(0), &env->fp_status)) ||     \
> -               (!max &&                                                       \
> -               float64_lt(xa->VsrD(0), xb->VsrD(0), &env->fp_status))) {      \
> -        t.VsrD(0) = xa->VsrD(0);                                              \
> +        t.fld = xb->fld;                                                      \
>       } else {                                                                  \
> -        t.VsrD(0) = xb->VsrD(0);                                              \
> +        t.fld = tp##_##op(xa->fld, xb->fld, &env->fp_status);                 \
>       }                                                                         \
>                                                                                 \
>       vex_flag = fpscr_ve & vxsnan_flag;                                        \

I think this would be simpler to utilize the result of the compare vs nans:

     bool first;

     if (max) {
         first = tp##_le_quiet(xb->fld, xa->fld, status);
     } else {
         first = tp##_lt_quiet(xa->fld, xb->fld, status);
     }
     if (first) {
         t.fld = xa->fld;
     } else {
         t.fld = xb->fld;
         if (flags & float_flag_invalid_snan) {
             float_invalid_op_vxsnan(env, retaddr);
         }
     }
     xt = *t;


r~

