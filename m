Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 960DF438619
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 03:06:58 +0200 (CEST)
Received: from localhost ([::1]:40538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meRyT-0006JE-Of
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 21:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meRwy-0004mk-D8
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 21:05:26 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:42861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meRwu-0005w6-DE
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 21:05:22 -0400
Received: by mail-pl1-x629.google.com with SMTP id v16so15869ple.9
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 18:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2LPvGM7/1v9RRI/1dw3AEdg48tAwIf2/k0vuNlM4PtQ=;
 b=aXI46LU0uE6MwrqFLP9dPiOraSxhXfxxj5BGCNjTm+/bdHUXQeFdsXngH9dnOi4I1P
 /TMYDlZ6SNeNJ97BsApICeCfcrnW1VGxeK+MBEMaGy09zxfAOg6e74ZqDk22lLfZNEDh
 jz7Y2+tIN6bss6cdbJ9F1WKxjX+uQYr+f1vSRiNvU4HhA9jmeT89J9/l5KcK/3MLJDFQ
 0DdOaeGrLmqRzMZEPPrfJqvkr+B/XDarf+9y5DVSNcTVVSm0IGAbb9ONAiTfNr6Kpe/5
 5N1I028fX/NcRYL5rOcuAi7guz2dv2TFm9qVPMV9tnoNjBSmbjrebkQXONHSEhgBtmZM
 stTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2LPvGM7/1v9RRI/1dw3AEdg48tAwIf2/k0vuNlM4PtQ=;
 b=Kz39X42+EBNpaHzD5YOs/m9SOXozmNQ/2v5pYY+o9AmjAceeMKqfQyXFhgxvjyUo+c
 xM8ZzaeUd9+Tbmti8qKdFw397LE+4f7yKhZ/UAeU06ixzwIcQHs+YVTFBjK2Tf1xpY/v
 8x/I/xot9FulywzDXXAzKBJf1conJH2lThFK808d+Htxc58azFhSV7J3RcAjxAoDS5Og
 2qyKJsL7JVlzxAMCo8XkU9viAjj8bK4HzmmctslzOkJh/brWGV9NbjBDhtjwSvRNR+nd
 SrEw0cDcp/9mfshywt/oHroBzPq1QnmvkEDhBF5GB8dahv9sy4EvRFF6T0WxUMxQ/c71
 MDxA==
X-Gm-Message-State: AOAM5314Pfo0p3oppX66vLjGrV30zMmN5i9B8DZugwwQgvrDIjBpfChN
 kI9o6kYi2Cb7Kx8PVrk0AkAZsQ==
X-Google-Smtp-Source: ABdhPJx7bn4blkpu3nY4AQhnibf4Q/GY7zLX6s/00zmFOeTLLFLQ6R7l55sqQIWltbp0yU9cwnvUXg==
X-Received: by 2002:a17:902:8bc4:b029:12b:8470:e29e with SMTP id
 r4-20020a1709028bc4b029012b8470e29emr8480267plo.2.1635037517599; 
 Sat, 23 Oct 2021 18:05:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id p16sm16449172pfh.97.2021.10.23.18.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 18:05:17 -0700 (PDT)
Subject: Re: [PATCH 07/33] target/mips: Rename sa16 -> sa, bz_df -> bz -> bz_v
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bcc1df7a-d49a-0e01-090d-251bb9ecb849@linaro.org>
Date: Sat, 23 Oct 2021 18:05:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
> This 'shift amount' format is not always 16-bit, so name it
> generically as 'sa'. This will help to unify the various
> arg_msa decodetree generated structures.
> 
> Rename the @bz format -> @bz_v (specific @bz with df=3) and
> @bz_df -> @bz (generic @bz).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/mips/tcg/msa.decode      | 15 +++++++--------
>   target/mips/tcg/msa_translate.c | 20 ++++++++++----------
>   2 files changed, 17 insertions(+), 18 deletions(-)
> 
> diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
> index 74d99f6862c..aa784cf12a9 100644
> --- a/target/mips/tcg/msa.decode
> +++ b/target/mips/tcg/msa.decode
> @@ -13,19 +13,18 @@
>   
>   &r                  rs rt rd sa
>   
> -&msa_bz             df wt s16
> +&msa_bz             df       wt sa

Tab or odd spacing?  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

