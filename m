Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEBE6DDAF1
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 14:35:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmDCg-0007ls-Ap; Tue, 11 Apr 2023 08:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmDCb-0007kU-7F
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:34:26 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmDCZ-0000iG-Ih
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:34:24 -0400
Received: by mail-wr1-x432.google.com with SMTP id s2so4120956wra.7
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 05:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681216461;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nkJvNYbaq42pZBefk0CiX+IPTPqIOUA9FYgmszLVwmM=;
 b=bqWkeb2O/AxLktePdrpei2lpOksrMCUlswNUpndL+T4DJV6G33Fa7PstEg+8dV0Iq2
 WLo1ec5sHnVYh1FM1mSuGqz6/ErLHGTmk7wunVCp9tFbsEl/pnIwC0LCvJFPCx0sBwbd
 /8QSIHFbQ927EqQ2HIWpJfkzozzzkdveuvBlECxLuHr5MR8zf64CxcsD3vGzmZSIRguj
 GZZSOrSi6IC1ZMxZjrORTBuCVe8aL8zAX6i1Wdp6rIXZ5qZcCv52tioYZCNbfCrGKDp7
 L75drXSTzsetDK7s8661/tsflxKOrQL01MqyY40t39+8Ich4OILSWDbPdiBKoiNLaT7i
 IX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681216461;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nkJvNYbaq42pZBefk0CiX+IPTPqIOUA9FYgmszLVwmM=;
 b=xmjm4Qo1Z6F89p9cFbOZQGYx9R2sNeW0qEX0msp1TzbmBj30T01t9aq5U+he4qiTtM
 2OP9kIYqMFtX/kqP94FMSxY75GJ4/n68861cKSt/QppZH4yDH9mL4KPRXLxu44lm+165
 nxiPdrsQgVxZkuroF6tLFbayPUUVjBYCxD+w7r8uRw/Ou9/5THAX7NBpo4yHfgqVa1i5
 xQuzi+KSSeYh39i4Y3u6foUXy+HgL8zEtlFLTNH9O1JS3Q4gKri+ZBN4Py1mScA0LUg1
 jAd5HlFi5LyJsykTxQN58XmyHijvASzfSImwopqxqZ6VJO4w2iWxqjvfy0PXGhD1xczE
 dJog==
X-Gm-Message-State: AAQBX9cNWgZWhnVKKc0aCQkES22vtOpd4rClb/ePs6jruHae0MhAzy4w
 BjzClRUNm7GoMj+YsaDl5PgWug==
X-Google-Smtp-Source: AKy350aBpeunT59VJukZbW23kpKFh8LqZsz3zj9zMmGodx8k5qjW8Qyaoretmm0/aQkRkpyz+GHhLA==
X-Received: by 2002:a05:6000:1378:b0:2ef:eb5f:862c with SMTP id
 q24-20020a056000137800b002efeb5f862cmr6359518wrz.59.1681216461451; 
 Tue, 11 Apr 2023 05:34:21 -0700 (PDT)
Received: from [192.168.1.101] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 k8-20020adfd848000000b002f0075ccf7bsm7171016wrl.71.2023.04.11.05.34.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 05:34:21 -0700 (PDT)
Message-ID: <c0b5e268-080a-4262-84f4-e4a5f849bdfb@linaro.org>
Date: Tue, 11 Apr 2023 14:34:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 05/12] tcg/mips: Split out tcg_out_movi_one
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230408030359.3368868-1-richard.henderson@linaro.org>
 <20230408030359.3368868-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408030359.3368868-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
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

On 8/4/23 05:03, Richard Henderson wrote:
> Emit all constants that can be loaded in exactly one insn.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/mips/tcg-target.c.inc | 26 ++++++++++++++++++++------
>   1 file changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
> index c2f8d6550b..f0ae418ba6 100644
> --- a/tcg/mips/tcg-target.c.inc
> +++ b/tcg/mips/tcg-target.c.inc
> @@ -514,20 +514,34 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
>       return true;
>   }
>   
> +static bool tcg_out_movi_one(TCGContext *s, TCGReg ret, tcg_target_long arg)
> +{
> +    if (arg == (int16_t)arg) {
> +        tcg_out_opc_imm(s, OPC_ADDIU, ret, TCG_REG_ZERO, arg);
> +        return true;
> +    }
> +    if (arg == (uint16_t)arg) {
> +        tcg_out_opc_imm(s, OPC_ORI, ret, TCG_REG_ZERO, arg);
> +        return true;
> +    }
> +    if (arg == (int32_t)arg && (arg & 0xffff) == 0) {
> +        tcg_out_opc_imm(s, OPC_LUI, ret, TCG_REG_ZERO, arg >> 16);
> +        return true;
> +    }
> +    return false;
> +}
> +
>   static void tcg_out_movi(TCGContext *s, TCGType type,
>                            TCGReg ret, tcg_target_long arg)
>   {
>       if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I32) {
>           arg = (int32_t)arg;
>       }
> -    if (arg == (int16_t)arg) {
> -        tcg_out_opc_imm(s, OPC_ADDIU, ret, TCG_REG_ZERO, arg);
> -        return;
> -    }
> -    if (arg == (uint16_t)arg) {
> -        tcg_out_opc_imm(s, OPC_ORI, ret, TCG_REG_ZERO, arg);
> +
> +    if (tcg_out_movi_one(s, ret, arg)) {
>           return;
>       }
> +
>       if (TCG_TARGET_REG_BITS == 32 || arg == (int32_t)arg) {
>           tcg_out_opc_imm(s, OPC_LUI, ret, TCG_REG_ZERO, arg >> 16);

Shouldn't this block be removed in this patch?

>       } else {


