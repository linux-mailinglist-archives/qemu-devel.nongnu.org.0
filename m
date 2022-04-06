Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 979494F6017
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 15:44:42 +0200 (CEST)
Received: from localhost ([::1]:55036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc5xh-00051N-Nd
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 09:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc5wf-00049B-QI
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:43:37 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:36385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc5we-0001kj-5j
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:43:37 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id kc20so2247192qvb.3
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 06:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=z/L5KSTn8cENzzXMrH/98LOK/NOhLWEYpy0sV8oTgow=;
 b=m27HrFBih1nnwUbSyA32ILeuMtXqNesTbmjQ/gYD8trzKnfIoHCC04bKQuAitRjo8s
 7VSLTW+lkEJM5gbFJp+XR10/PZCQ4qjOxNAcLXLmnnZEPo8akC39PdBu7vHr1Bw/Jyjw
 TQ3pNEvPziFYEzMr4aBMLFYN4yEPTeWJs/bkJyjRuPD7qq2cZqBMDLcS4xEPkkuVMUx9
 VJUuHg34RxjKd1EBRpT3p0BijCxSrF/cnWeXSxAlha7bG52A66jVVqlglM3GlTz4AMHe
 Jh80zpvCpIBa8nsCEqbUfIAMqnXFooWUbYN+O5fUOOBV3VxqsYtfiS8ksx1I3H9GnB1y
 EnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z/L5KSTn8cENzzXMrH/98LOK/NOhLWEYpy0sV8oTgow=;
 b=JlUyFyuDYqmqETqP1gNo25oHsCI2L0DacPFxzyVu9ZXRkDgcxkkuVJ/mSgNBje6DUg
 NbmOp3eeolnq0R3MfgGgPsQYAlAc8yAjLDCupY7vgskTugkr6QY/y5mH4nFh+ey8HC16
 wtu2qygiGdJn0ZTzcrFixrSuYs914KUMM3eIcTE14vr8Hz/GiVgqk7KUn/w9txNOw2/X
 Q8TS7b9BFDh54j5oBfV41RhG//ilygSfKqH29RhPEQ/mkWosNuwN1zHkDVovTXo6oNnZ
 a0W2HPfsStM2PhL4NVnfXzMyW9dSwJwr8DvY8qrNMPRCSX8jJClaeFWqlJIgwvSiabYj
 bkjA==
X-Gm-Message-State: AOAM531TeNJXtbMNkiSZDGhltgFOHz+v4GnW4Kb77969kAjtpjPn+SLP
 1rwkqsNL/W5CavDqkT1KdUEwFQ==
X-Google-Smtp-Source: ABdhPJyqeqwRX49FhYrBrmI8JbN6T2E403ekDJ79751yK/ycH4uIyoFFSzMINm0/qWn3GfCWy1T5kQ==
X-Received: by 2002:a05:6214:e45:b0:441:73e0:40f9 with SMTP id
 o5-20020a0562140e4500b0044173e040f9mr7501471qvc.40.1649252615188; 
 Wed, 06 Apr 2022 06:43:35 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 x20-20020ac85f14000000b002e1ee1c56c3sm13638579qta.76.2022.04.06.06.43.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 06:43:34 -0700 (PDT)
Message-ID: <775aad48-03ed-9e27-f6f8-a22999e4d668@linaro.org>
Date: Wed, 6 Apr 2022 08:43:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 04/18] hw/arm/exynos4210: Drop int_gic_irq[] from
 Exynos4210Irq struct
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2c.google.com
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/4/22 10:46, Peter Maydell wrote:
> The only time we use the int_gic_irq[] array in the Exynos4210Irq
> struct is in the exynos4210_realize() function: we initialize it with
> the GPIO inputs of the a9mpcore device, and then a bit later on we
> connect those to the outputs of the internal combiner.  Now that the
> a9mpcore object is easily accessible as s->a9mpcore we can make the
> connection directly from one device to the other without going via
> this array.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/exynos4210.h | 1 -
>   hw/arm/exynos4210.c         | 6 ++----
>   2 files changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

