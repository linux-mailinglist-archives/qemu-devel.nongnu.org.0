Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B51CE4F60BD
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 16:06:41 +0200 (CEST)
Received: from localhost ([::1]:34514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc6Iy-0004ji-Ao
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 10:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc6Gz-0003mv-Bn
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 10:04:37 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:33348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc6Gx-0006PL-Oy
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 10:04:37 -0400
Received: by mail-qt1-x834.google.com with SMTP id j21so4516522qta.0
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 07:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4h8UMFA4ejdvIM1tKnWcGX2zbAcop0O+0xD5M1/H4tw=;
 b=ew9QzIgiyCO+mg4d88TWjf3+4T0Smyj9ZW41pt1LgNudxuiJahwhk3VzbfCxN8qmoF
 d86ZgWUxY9EBHSlu6DyZ2N300Pdzjk8P5V209Fn31n9N4PJKA+xUZlwlubEvHDEZqZ0C
 ZWOiu+klqcx+CI1vSmW1UEk8x3H3Odnq6cayzYUmsn7u1nip2emr7H6EZq6ArNoOi+ye
 vMOdYEIUH0vzrtoWl4tEmvavbHpUIkaB9D0tUSDnE/7YnQvJMqPqaAUbFo+VPuMSqPyg
 ROqZjilqhRjdU4F4yHOGuWopcvaKNQqZO9ejotqHa7vFl/EwGmZF0YrvHnXdTMSffCye
 +YSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4h8UMFA4ejdvIM1tKnWcGX2zbAcop0O+0xD5M1/H4tw=;
 b=7Vw7Bac/28nYBzD8xS7c0uozHlICcU5iG2kR8tuUEtYIFB8nY+PHA7LgMmaqxnSsPh
 7PPZOwaSLEGnYS/XTVnCLGF++dZ7wDAFLhqx5gZrVWoBhE/bCo9CjCr6A+CllupB3osv
 3xr1M8iPNqPk8IwQriK+rNz5nNQWv1QcX1iOV3sRE0QU+SZS532xWUkcbTJ15biFDZ7V
 2QFqD/MAUBr/AYPMpfoEuv2uhZfFF4K4yCed5T29Za4h2gx88qODgJXpBsEMUnhl8W74
 97Cj71g28XfL0oKFaBt+pZhJt3vL6Y3TRIUTxXBwQY187yHvATev8lFMycGWP75zVE7q
 SIKw==
X-Gm-Message-State: AOAM532bhzuLjwRQBUFQdWJRXjrJLoUbAVkwDRudQgV43kM5Pcx7EvG6
 m3c6dSWTewiogtCHthBEOmTGqg==
X-Google-Smtp-Source: ABdhPJxq58EzTzIrmNYi1ZQSbpo8/Imac0E14WokRyo8Gc1rIvMNneAS919S0X2QX81ZI4kK8+Py1g==
X-Received: by 2002:ac8:7f86:0:b0:2e1:b6b3:2ca4 with SMTP id
 z6-20020ac87f86000000b002e1b6b32ca4mr7575405qtj.127.1649253874603; 
 Wed, 06 Apr 2022 07:04:34 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 e15-20020ac8670f000000b002e22d9c756dsm11846736qtp.30.2022.04.06.07.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 07:04:34 -0700 (PDT)
Message-ID: <6cdaeef1-1f4c-2f0c-23a9-ad3203fa9c75@linaro.org>
Date: Wed, 6 Apr 2022 09:04:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 16/18] hw/arm/exynos4210: Fold combiner splits
 into exynos4210_init_board_irqs()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/4/22 10:46, Peter Maydell wrote:
> At this point, the function exynos4210_init_board_irqs() splits input
> IRQ lines to connect them to the input combiner, output combiner and
> external GIC.  The function exynos4210_combiner_get_gpioin() splits
> some of the combiner input lines further to connect them to multiple
> different inputs on the combiner.
> 
> Because (unlike qemu_irq_split()) the TYPE_SPLIT_IRQ device has a
> configurable number of outputs, we can do all this in one place, by
> making exynos4210_init_board_irqs() add extra outputs to the splitter
> device when it must be connected to more than one input on each
> combiner.
> 
> We do this with a new data structure, the combinermap, which is an
> array each of whose elements is a list of the interrupt IDs on the
> combiner which must be tied together.  As we loop through each
> interrupt ID, if we find that it is the first one in one of these
> lists, we configure the splitter device with eonugh extra outputs and
> wire them up to the other interrupt IDs in the list.
> 
> Conveniently, for all the cases where this is necessary, the
> lowest-numbered interrupt ID in each group is in the range of the
> external combiner, so we only need to code for this in the first of
> the two loops in exynos4210_init_board_irqs().
> 
> The old code in exynos4210_combiner_get_gpioin() which is being
> deleted here had several problems which don't exist in the new code
> in its handling of the multi-core timer interrupts:
>   (1) the case labels specified bits 4 ... 8, but bit '8' doesn't
>       exist; these should have been 4 ... 7
>   (2) it used the input irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]
>       multiple times as the input of several different splitters,
>       which isn't allowed
>   (3) in an apparent cut-and-paste error, the cases for all the
>       multi-core timer inputs used "bit + 4" even though the
>       bit range for the case was (intended to be) 4 ... 7, which
>       meant it was looking at non-existent bits 8 ... 11.
> None of these exist in the new code.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/exynos4210.h |   6 +-
>   hw/arm/exynos4210.c         | 178 +++++++++++++++++++++++-------------
>   2 files changed, 119 insertions(+), 65 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

