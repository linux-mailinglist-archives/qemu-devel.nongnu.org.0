Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E05D66AC217
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:02:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBP5-0007iS-Lf; Mon, 06 Mar 2023 09:01:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBOh-0007Yv-Po
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:01:05 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBOf-0006Uf-NP
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:01:03 -0500
Received: by mail-wr1-x42b.google.com with SMTP id r18so8932082wrx.1
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 06:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678111259;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G5H00DqeZClDP4eneuHZ7EUSuWlAF3OuS9jWPVr2tG0=;
 b=upXsa5Drzs9gyoD+LWu0kYYLAmGEwXA4iqHXi1GveweyjqkmfSrN58tBjw10L9Rhur
 1ybbfyE6dQ1JSSID7nkS8a7suil2WzOOAZe33uXZ6LfG7KsUQ+xp8XDCxuYWJSBcYd+R
 MVLtN8wUJ7f6oe1yybtJgCUsvCdybOdnEh10n22XWrl/jXy9vzjw7JaNPovJi7sA6jm6
 YHKlNNoCUDpFEvxIo3YtrvHr2gN9OKfeRvPPIm+GU3E2jIY2/uRYyDpUn5CIIxnAU5Qw
 QERZRaaoYDjPorKFlIGvuhLM7cjB56tFf0IWfQzWsg/XeFApD/8yVKA1Q928vKCabZEe
 o35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678111259;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G5H00DqeZClDP4eneuHZ7EUSuWlAF3OuS9jWPVr2tG0=;
 b=PZdKfWEPnfgF70aO3fv0WDk6Ta/hyqgQqSzanq+SdaMzwHxDX9JC8hu5iPHtHTieJV
 BLKu+U0fUcdAyZhVwPN8+cic3xQBrCiA+8dTlmBhJLJeVaxFyjODItGiwp4SNNlrZabr
 +1Z5jIQLlQ3rd/36mqNc4qzxDw8Z+SXGNxWeoBIXDIS7dhFA+bqhW03uNmr6J55XBzA8
 d72NNh0QDN+mYa/XOcr5GTHsisqQk8fC6ASdAHO17cYxODQxMDWScUJ6vylDBR4AiPKH
 BaXvnvqngTpYkwBFAzljifMFEBa/xxOhAHUujZlb1CuX7lD9OADVAqzZHksXfLgI3Z6k
 CdGQ==
X-Gm-Message-State: AO0yUKVbZtJEXpkTCGYRvzGjaiZok9gF2yGyftqMQqm627hjkdhoLSPG
 YWjM5KbAYt7VMK8ASmPChYJ8SQ==
X-Google-Smtp-Source: AK7set+vXMInZL7AwuISLFHNF3hHOPPXlymXHxS03St2UXes3hdBgEFm6INFMy29A10DArCU+Sa4qQ==
X-Received: by 2002:adf:ef81:0:b0:2c5:46d1:69e1 with SMTP id
 d1-20020adfef81000000b002c546d169e1mr8295008wro.36.1678111259261; 
 Mon, 06 Mar 2023 06:00:59 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 z7-20020a5d4407000000b002c5503a8d21sm10136820wrq.70.2023.03.06.06.00.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 06:00:58 -0800 (PST)
Message-ID: <7b1fa1fa-5e00-90eb-29dd-413448167456@linaro.org>
Date: Mon, 6 Mar 2023 15:00:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 03/70] target/arm: Improve arm_rmode_to_sf
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 27/2/23 06:41, Richard Henderson wrote:
> Use proper enumeration types for input and output.
> Use a const array to perform the mapping, with an
> assert that the input is valid.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h     | 12 +++++++++---
>   target/arm/translate-mve.c |  2 +-
>   target/arm/vfp_helper.c    | 33 ++++++++-------------------------
>   3 files changed, 18 insertions(+), 29 deletions(-)


> +extern const FloatRoundMode arm_rmode_to_sf_map[6];
> +
> +static inline FloatRoundMode arm_rmode_to_sf(ARMFPRounding rmode)
> +{
> +    assert((unsigned)rmode < ARRAY_SIZE(arm_rmode_to_sf_map));
> +    return arm_rmode_to_sf_map[rmode];
> +}

Is the inlining justified?

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


