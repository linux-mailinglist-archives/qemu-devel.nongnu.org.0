Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7F45A926B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 10:53:52 +0200 (CEST)
Received: from localhost ([::1]:43436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTfxO-0004J1-41
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 04:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTfJC-00062j-Jj
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 04:12:18 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTfIu-0006oF-Dp
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 04:12:17 -0400
Received: by mail-wr1-x434.google.com with SMTP id b5so21237363wrr.5
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 01:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=slJC8cG7qQu1InXqKQbyrKUEGHZ34tS+uFDUFEmOtvc=;
 b=GGkjhFY4OrXxytR1xm9KyKa0nTqXXSUFaQWzzdZxTciXgDj8dQDfQYQI5CYZptDqkK
 upYi0v2sx28BB4FfxXhrjZ6XDC9OwFyQZcV55VeHbTNUCqLnNgbudnSUxOs4igKOe7yo
 hSwmxxZ2c7nRNTVeZCTVdtsAa/MoOSxZ94GmPii71csHMBLjyAo3LPV6YvcfKU0OajMy
 RBYblCdKgpmxrbmMUdT87N1bg1yZDuMQ1KxydqYb2q/IaSMyQiSHiDWVHJRnu3ouTwwp
 PjmiC4QK2abv52ZeWclNelU4PJHwH74WXIXXid64ljAGG7HZohaaTyPdr3i9rHPix2kh
 9CBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=slJC8cG7qQu1InXqKQbyrKUEGHZ34tS+uFDUFEmOtvc=;
 b=G7vxTOzcdpseWeTpCbwHp4q59poXRcA8SQiDsJ31g9ZrcsmBeDkK9tulAE2WhB5+6n
 /ABici9+a7lqhJ/hpecrMcMb6yqwYTpW6OPxcNsh+QaVm8MdjTxc+V9U/0tv0wrjEqkK
 i/NzKBHolRVyeF3185JiiUexqhw932yxAkL3QXimNbGqHu5SKPrUqtjXCHb31Suu2IbE
 qTdD1y9ZnSzkw9hpMC1Zwf0oEP0MPrf2Bt9a5ylxWEbJ9rmFz7PxvSuEhwPykOsT9wAU
 AHEYeKOs6Zy9+NWzpgnJ550vJEJhBNIRDRmFc2KlkrtMDX8H9tSLTUvejdFIVOueS2nJ
 16ZA==
X-Gm-Message-State: ACgBeo3zhOTXbQqmbpg5KNvifd33bQ85GZIV/Ph7FddG6hG+kez9AYRE
 kaC9jzOJW7+S3dzoOVw4+h5Y2A==
X-Google-Smtp-Source: AA6agR5N2u3Z/Dhz5u7pJfD32mx5I8Zjq0XzJVSaULR5+EUfXE8e+VeCssnNov2MgcO7+vKtJALQQg==
X-Received: by 2002:a05:6000:2a8:b0:226:e711:67f5 with SMTP id
 l8-20020a05600002a800b00226e71167f5mr6126101wry.359.1662019917384; 
 Thu, 01 Sep 2022 01:11:57 -0700 (PDT)
Received: from [192.168.45.227] ([87.192.221.83])
 by smtp.gmail.com with ESMTPSA id
 e3-20020a05600c218300b003a2cf1ba9e2sm4401520wme.6.2022.09.01.01.11.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 01:11:56 -0700 (PDT)
Message-ID: <92a9eed5-76f6-b2ff-7f0b-5f313b308701@linaro.org>
Date: Thu, 1 Sep 2022 09:11:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 12/23] i386: Rewrite vector shift helper
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220901074842.57424-1-pbonzini@redhat.com>
 <20220901074842.57424-13-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220901074842.57424-13-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 9/1/22 08:48, Paolo Bonzini wrote:
> From: Paul Brook <paul@nowt.org>
> 
> Rewrite the vector shift helpers in preperation for AVX support (3 operand
> form and 256 bit vectors).
> 
> For now keep the existing two operand interface.
> 
> No functional changes to existing helpers.
> 
> Signed-off-by: Paul Brook <paul@nowt.org>
> Message-Id: <20220424220204.2493824-11-paul@nowt.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target/i386/ops_sse.h | 247 +++++++++++++++++++-----------------------
>   1 file changed, 112 insertions(+), 135 deletions(-)
> 
> diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
> index 2c0090a647..a4a09226e3 100644
> --- a/target/i386/ops_sse.h
> +++ b/target/i386/ops_sse.h
> @@ -40,6 +40,8 @@
>   #define SUFFIX _xmm
>   #endif
>   
> +#define LANE_WIDTH (SHIFT ? 16 : 8)

Much better, thanks.


r~

