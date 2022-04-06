Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E1D4F60B8
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 16:03:11 +0200 (CEST)
Received: from localhost ([::1]:59918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc6Fa-0002gj-QU
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 10:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc6Cu-0001MO-J1
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 10:00:26 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:44697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc6Co-0005g2-0v
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 10:00:23 -0400
Received: by mail-qv1-xf31.google.com with SMTP id ke15so2257818qvb.11
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 07:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HZ3d683UcsmgThdLPL+xO3pygbvtLqa3T5cQFRWY6Bc=;
 b=mDTBtsPYIr3wWjtBahQIIRtzhkJeHFYUAYGrb5AF2gawOw2goYhaDeKtVYWoe6HfKJ
 oQfePXtuH8j19hGIBAytVALB21sE4bIRArqFD+kWGzoGuQ/31sEV2iRM85OvvIo/gGBU
 P9GZbXXJ1J3KKVVLdwEljvwB6cNHEdFpde35J43Fax51J1L6DaqdBJsS2B2DgoifCzoV
 UtNPh+n6J8eQGg0VBcudAFkCzVEr6C+aH7rZ1Q2RSyHbGb98mDi2Dy6QssxqKs/GTn1z
 oI17JoLppzuHA4em1IpUcJM9Aw1ffEgswQGIgPHTBBrezEo9u30xPJKw/x5lv21dsjRv
 s62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HZ3d683UcsmgThdLPL+xO3pygbvtLqa3T5cQFRWY6Bc=;
 b=C9Kip2rDb+Cot8BYaWRPy/+AgfXZApbBkPMjh+q3pkswedoEOaO0SXGdIHPBlKUTPX
 JUW9APSh58gA0U6qtn+MKl8qPXUAwVVjrj0V7RWOPwPRK+8akFlVnHrII0vhdHiWrdAK
 nXJiyjq6lazxvKccxJAUaV4hwm+dNJbLc5vpzqIVOvRyeIIGyf4nEnEKHVbI1D8xeIsC
 BsT2RIb8R9SbpS9oAAkomOIIHXeliEgBYOiOgSvPFniu03E9IC0cDcO+DH82mKYCUBq4
 cZYLdAxFf/XqkH+du0gCh+Jnba82WtqtuO7Adphxd0cN60dS2SOF2Dgr9WLlNT5ekvN/
 wesw==
X-Gm-Message-State: AOAM5303uVVv2FzQRdBbKPOP6EouWi3Mh1U1Ub8J5lb6V2HEK9dFHq4O
 S+mtLXUAm0+O+7S7Uk/I/6FsoA==
X-Google-Smtp-Source: ABdhPJy5nfx6fBXoOXcBn/x7DRQ5O1E9YshGxlau7l0BBuEG13YqXXVQEXS4Gj8/0WMG5QtJeWUjbg==
X-Received: by 2002:a05:6214:2409:b0:432:bf34:362f with SMTP id
 fv9-20020a056214240900b00432bf34362fmr7332701qvb.66.1649253614551; 
 Wed, 06 Apr 2022 07:00:14 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 e20-20020ac84e54000000b002e06753cf70sm15274775qtw.6.2022.04.06.07.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 07:00:13 -0700 (PDT)
Message-ID: <49ca71ae-906e-767d-8d12-9cd0a04d5b6a@linaro.org>
Date: Wed, 6 Apr 2022 09:00:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 15/18] hw/arm/exynos4210: Don't connect multiple
 lines to external GIC inputs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf31.google.com
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
> The combiner_grp_to_gic_id[] array includes the EXT_GIC_ID_MCT_G0
> and EXT_GIC_ID_MCT_G1 multiple times. This means that we will
> connect multiple IRQs up to the same external GIC input, which
> is not permitted. We do the same thing in the code in
> exynos4210_init_board_irqs() because the conditionals selecting
> an irq_id in the first loop match multiple interrupt IDs.
> 
> Overall we do this for interrupt IDs
> (1, 4), (12, 4), (35, 4), (51, 4), (53, 4) for EXT_GIC_ID_MCT_G0
> and
> (1, 5), (12, 5), (35, 5), (51, 5), (53, 5) for EXT_GIC_ID_MCT_G1
> 
> These correspond to the cases for the multi-core timer that we are
> wiring up to multiple inputs on the combiner in
> exynos4210_combiner_get_gpioin().  That code already deals with all
> these interrupt IDs being the same input source, so we don't need to
> connect the external GIC interrupt for any of them except the first
> (1, 4) and (1, 5). Remove the array entries and conditionals which
> were incorrectly causing us to wire up extra lines.
> 
> This bug didn't cause any visible effects, because we only connect
> up a device to the "primary" ID values (1, 4) and (1, 5), so the
> extra lines would never be set to a level.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/exynos4210.h |  2 +-
>   hw/arm/exynos4210.c         | 12 +++++-------
>   2 files changed, 6 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

