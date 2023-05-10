Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4626FE0AE
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 16:44:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwl2x-0006JE-ED; Wed, 10 May 2023 10:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwl2v-0006J5-OS
 for qemu-devel@nongnu.org; Wed, 10 May 2023 10:44:01 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwl2u-0004uV-5P
 for qemu-devel@nongnu.org; Wed, 10 May 2023 10:44:01 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f423ac6e2dso28054945e9.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 07:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683729837; x=1686321837;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/KfXN9ZxzYUvhl50mT3seM6ikcKnY/VX92Yhvn3lXTY=;
 b=Czb5nXZT9rqtEU0nce/lRc4evRBzKurvEJD+pSDmLPGwcUlE5O5l2nygCdWxzEhbE3
 fcxoJGdGqzODDi/U41L82HynMUjAFRJFhM7Wx55nkbpUJ97LAKqHClLCllfGXw3osYZU
 PInygA0LbI0vFWuM5nSBlKczhLmSq4MUzdmdaS96YdJraldlPO+sgNU+xcgi+f/60jxR
 Ecw9oi4nNQ9Tnfrufkebqu6jXCoEKQuCq/huTmS9a0yFTsAwjOZnD13CfC5PpwuBG2pU
 YjL23fP3ujO4n+yQDjRmUrtQxnnPVQX7bFaqRpqbdjxeO25UmiM/DaYVoCaeCL5gIut2
 OGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683729837; x=1686321837;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/KfXN9ZxzYUvhl50mT3seM6ikcKnY/VX92Yhvn3lXTY=;
 b=RaYc9nOTXPQSrDCA4NqeG4rEd+wGPNIhomU/x/MLYVJR9vHntXwCVrZ5rZag5++Pwu
 eK3KVGjokhwDKIlXGhDAR65I4QLtmATlpVgHUqWJqO1FBYtbQVnlV3RSIMPU7tvj3Ky9
 kZMcDFKmke9FJ4c6a5pjBC0dbXTSNSD0MyLAc62UVGKNEFM0MH32ui14D/pMFpfO2Nwj
 sI6RLx07ptTBFSFEOQvpJo6AvGN2FHUgGAnRGakBBdaIqi522K6/F5MBrKzajjLBtlan
 76qDmbTInpgCdzKFpFoPq6a7PkPDB94JhI+Rnyf7PwTUWzS7Cab5SYodEUpj77TNhCcr
 yKSg==
X-Gm-Message-State: AC+VfDwOylOklqOdOYoNBeH++G+SVjaGtxfm0T/4RrUkeMu4pwCMBDZv
 r/G+7J6lyWau1cqGS/+bbh6u5A==
X-Google-Smtp-Source: ACHHUZ6EYlzDroqzqoDlm2x1kIWjOZ83etZOEYxeUvG1wTVfCkisnNOOzlUVPn67MTX73RvgGlH0pg==
X-Received: by 2002:a05:600c:2119:b0:3f4:2c71:b9b1 with SMTP id
 u25-20020a05600c211900b003f42c71b9b1mr4099654wml.24.1683729837638; 
 Wed, 10 May 2023 07:43:57 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 a11-20020adfeecb000000b003048477729asm17493935wrp.81.2023.05.10.07.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 07:43:57 -0700 (PDT)
Message-ID: <b0e9ba06-ad37-65ac-da6a-f041e5187660@linaro.org>
Date: Wed, 10 May 2023 16:43:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 16/16] tcg: Remove TARGET_ALIGNED_ONLY
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: jiaxun.yang@flygoat.com, crwulff@gmail.com, marex@denx.de,
 ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk
References: <20230502160846.1289975-1-richard.henderson@linaro.org>
 <20230502160846.1289975-17-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230502160846.1289975-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/5/23 18:08, Richard Henderson wrote:
> All uses have now been expunged.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/memop.h  | 13 ++-----------
>   include/exec/poison.h |  1 -
>   tcg/tcg.c             |  5 -----
>   3 files changed, 2 insertions(+), 17 deletions(-)


> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index cfd3262a4a..2ce9dba25c 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -2071,13 +2071,8 @@ static const char * const ldst_name[] =
>   };
>   
>   static const char * const alignment_name[(MO_AMASK >> MO_ASHIFT) + 1] = {
> -#ifdef TARGET_ALIGNED_ONLY
> -    [MO_UNALN >> MO_ASHIFT]    = "un+",

Maybe we want to keep the "un+" prefix.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> -    [MO_ALIGN >> MO_ASHIFT]    = "",
> -#else
>       [MO_UNALN >> MO_ASHIFT]    = "",
>       [MO_ALIGN >> MO_ASHIFT]    = "al+",
> -#endif
>       [MO_ALIGN_2 >> MO_ASHIFT]  = "al2+",
>       [MO_ALIGN_4 >> MO_ASHIFT]  = "al4+",
>       [MO_ALIGN_8 >> MO_ASHIFT]  = "al8+",


