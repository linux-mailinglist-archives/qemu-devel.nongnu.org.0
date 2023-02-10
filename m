Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A32F7691FC9
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 14:33:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQTWQ-00034d-BQ; Fri, 10 Feb 2023 08:33:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQTWO-00034I-Ex
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:33:00 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQTWM-0006es-Rw
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:33:00 -0500
Received: by mail-pg1-x52f.google.com with SMTP id n2so3716510pgb.2
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 05:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676035977;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+uzsZum9W/Fslcbo+RgotMW/hjV78iD5VQlw4fHoZwY=;
 b=czvrYVmZpsW+115qeYh67rBsZUClzW4VjfubZyiwM/u6uVbmH8pNNScxAamEQ4gVim
 prwxdk+lDBxgKRdVz/QoF7abiB+MfOQUQg0aZM6AJVHmccqJ34SGy0844SDkUF8LsNiQ
 p6E3zsB9kuJ7+Q5c4/cCqsJDtlcQpXXxPsDL5WLk1Ro6skDFxkZl7Z3zID0xeyJcp085
 nO+hJObrMyPgT/beuC9SKQ7hs3WjS/qPlZIbKJWTO37E/IkWI8taZIDIDDjWabDuHkcy
 b5RlLgSp2bHuiXKgBSfG7jQ5mfV/ljqw0BGClCDuSuVPdc1u15cl/BlV3vAGWuBobOfV
 86Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676035977;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+uzsZum9W/Fslcbo+RgotMW/hjV78iD5VQlw4fHoZwY=;
 b=qtPP0WIE2SfJS/7INakmBGxhstpLqmbhogF2iJ7+CrHzBSSC8FTbT1a+HXnHgcxUNi
 YY8kYo594AQBleT3NDHfnRgyr14i9FQc+Qlq9z0+vTfFuOCUkXciVeGqIKSlmFr7vjkI
 XXvFROpoImfXlJ8SLGGJ001cVluleKmGKJvqs8At6lHL/5RYH1xWD6Z8Ah5mpbzQxjmM
 wLEH1sMA8RjKgPFN+SbL76174ybhMMlGIJVwmIhxrp/Igr1/pLEVdjwemD7YUV1iSwni
 GYjaR9LBV1BdjceCiQPEW9qZNSlH28PyUh1phBFN4+kLgF01zPCXcEfMis0Dwet6zcUb
 v3jA==
X-Gm-Message-State: AO0yUKV2Gf8e1rVMzzhe3vnZxHNSlu/AZy9k+2aR/Dq/DbUaUplPhetU
 LI6BU/VqqA4pkhpPW+C5asTdMcCUI79VWu02zpgoRA==
X-Google-Smtp-Source: AK7set/yZZtOEOSjibXNh+obpk3AT+qAeBApwFOyr7xmQSCAbubRJ6GES1T6K+Yu/r7pTJuIt4tfp84CxT8sJlOesqs=
X-Received: by 2002:aa7:9e5a:0:b0:5a8:482f:c328 with SMTP id
 z26-20020aa79e5a000000b005a8482fc328mr1939752pfq.39.1676035977208; Fri, 10
 Feb 2023 05:32:57 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-19-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 13:32:46 +0000
Message-ID: <CAFEAcA_Gqzf6FZbVuPdkk_MvKbaPDY7Aa86CRqwVFDOPfh-o3w@mail.gmail.com>
Subject: Re: [PATCH 18/22] target/arm: Add GPC syndrome
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52f.google.com
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

On Tue, 24 Jan 2023 at 00:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The function takes the fields as filled in by
> the Arm ARM pseudocode for TakeGPCException.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/syndrome.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
> index 73df5e3793..3fa926d115 100644
> --- a/target/arm/syndrome.h
> +++ b/target/arm/syndrome.h
> @@ -49,6 +49,7 @@ enum arm_exception_class {
>      EC_SYSTEMREGISTERTRAP     = 0x18,
>      EC_SVEACCESSTRAP          = 0x19,
>      EC_SMETRAP                = 0x1d,
> +    EC_GPC                    = 0x1e,
>      EC_INSNABORT              = 0x20,
>      EC_INSNABORT_SAME_EL      = 0x21,
>      EC_PCALIGNMENT            = 0x22,
> @@ -237,6 +238,14 @@ static inline uint32_t syn_bxjtrap(int cv, int cond, int rm)
>          (cv << 24) | (cond << 20) | rm;
>  }
>
> +static inline uint32_t syn_gpc(int s2ptw, int ind, int gpcsc,
> +                               int cm, int s1ptw, int wnr, int fsc)
> +{
> +    return (EC_GPC << ARM_EL_EC_SHIFT) | ARM_EL_IL | (s2ptw << 21)
> +            | (ind << 20) | (gpcsc << 14) | (cm << 8) | (s1ptw << 7)
> +            | (wnr << 6) | fsc;
> +}

I guess we can add VNCR (bit 13) when we implement FEAT_NV2...

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

