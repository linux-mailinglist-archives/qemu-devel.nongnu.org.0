Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27BB57945A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 09:37:48 +0200 (CEST)
Received: from localhost ([::1]:51050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDhnf-0001im-I6
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 03:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDhmh-0000OH-Ff
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:36:47 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:36473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDhmg-0007yg-0I
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:36:47 -0400
Received: by mail-io1-xd36.google.com with SMTP id q14so11117448iod.3
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 00:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RUTV/R9w0RWZVW6ya911wkSEWymdBjFvCRwvuEpEvnk=;
 b=maD69qlmRsehbtN5OCZp5dstLtcWcog+c+n27v1z1uMIQVNTRURDlrzO8MaT+EpghO
 Ap3iU5G2oHHY/hSR9HIxlwTxLHWlR4Eqv6QOyHcLeN1gWIqKA1y+tFW4SzudrJHg0xrD
 CZYeWsmkGJBVxhwnncJXIX2hO135wMyiR8zWXRN23pDV2AgtcCfrWm7epGVDcUZpv9K/
 wT+dWVe90dUnMVte6Ru/1gOTjHZ9m/jUv+krxzIYTAlRhnBnAZpRTKJ3nD3ka7hFjuQa
 YQYjmzjpI2PF+bZFAepYoWGENV/RpT8QZxulSMi4iKPic/0A1s5/uK8mef6myaE08UB1
 ULcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RUTV/R9w0RWZVW6ya911wkSEWymdBjFvCRwvuEpEvnk=;
 b=PkyP7pJKfMzvaWwjcwixlsARMV7I6S3EqyMAhvfrfllxE3216pSeL4OaMmcVyHFLks
 dZRz/2074o1No/xHCEHztiQ2iPqB2jeutb2l87WE7F7q3jIHVaqAcUoU1JJ2xWhciF09
 OnAmbI72GioqmIrvLirJqlOmDbpEnskMhVAq06TOzY5nvsVUwecSAPY93VQvjTWQs7am
 Q3OKXC/Y30VV95eXIZc4xzQZm51JAn9Ohe1NhmoPYQWnNLonlzbvC+p7gZ9MAdUlJXdv
 pnLUOsK+QOAxit1x8Tj1/fkq/KBEDmQ+FZLkRDaDNzbXYTB3OBQVFXdo6cppZ5k6HVWf
 BdRw==
X-Gm-Message-State: AJIora8RgzznwIBuqndWclAxPhHfNEawsT7/19Tm+BEhsX8kxSR8gUXL
 kFBD2slElR+YL287YJOQI7f4zw==
X-Google-Smtp-Source: AGRyM1vN6Yg+wALsfSplFu7hPXp/ZZ2gOdx3sUjU/zxHljc016XtLI6FngWfnYt4lkaovndWIK6BuQ==
X-Received: by 2002:a05:6638:1349:b0:341:65ee:d153 with SMTP id
 u9-20020a056638134900b0034165eed153mr5451863jad.156.1658216204655; 
 Tue, 19 Jul 2022 00:36:44 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.139.163])
 by smtp.gmail.com with ESMTPSA id
 q20-20020a02a994000000b0032b3a781781sm6456657jam.69.2022.07.19.00.36.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 00:36:43 -0700 (PDT)
Message-ID: <0ad37bfb-0648-95ca-a935-1429a17a035f@linaro.org>
Date: Tue, 19 Jul 2022 13:06:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] qtest/machine-none: Add LoongArch support
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn
References: <20220713020258.601424-1-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220713020258.601424-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 7/13/22 07:32, Song Gao wrote:
> Update the cpu_maps[] to support the LoongArch target.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   tests/qtest/machine-none-test.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/qtest/machine-none-test.c b/tests/qtest/machine-none-test.c
> index d0f8cd9902..f92fab479f 100644
> --- a/tests/qtest/machine-none-test.c
> +++ b/tests/qtest/machine-none-test.c
> @@ -54,6 +54,7 @@ static struct arch2cpu cpus_map[] = {
>       { "riscv64", "rv64" },
>       { "riscv32", "rv32" },
>       { "rx", "rx62n" },
> +    { "loongarch64", "la464"},
>   };
>   
>   static const char *get_cpu_model_by_arch(const char *arch)

Queued.


r~

