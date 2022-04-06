Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1A74F60B1
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 15:57:48 +0200 (CEST)
Received: from localhost ([::1]:50910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc6AN-0004lg-EP
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 09:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc68S-0003bT-Rh
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:55:48 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:34308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc68Q-0004ll-K1
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:55:47 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-e1dcc0a327so2982488fac.1
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 06:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uzpK1boCHcQcR5pc8ogFi5sT1PU+IpQ+ZQqdstika2Q=;
 b=UotZuXq9aJNHzadIdnjyScBmVfb+Eu5m2h42ZUb/iUP2hsq4JvjrfybgMQHtiGnQ8+
 AdQDRgacI6FZlSaXTEaKXuAS+qf4oLS/pHVzT3b9DN7YqWki4gEQg3Xeszm/7o2WsSIK
 P/JfvXJ6pNSYe2G3uap5VCpmUepz5Z7Gkf4I9fjd41nG36qwv55CT+ejnHVzhApA/SSL
 Lh3RfBPJ0/6+E5IVTJoED53RkgZ8AJs+6WPGGEvR4NbhXV/KoIQ4rgTcMDArOTPEkPb2
 cp4Ec86ZAXyhSX9Zmd2jvsY4XE7pRLqJBhlA9PA19kXl+wSyy4smhTkp/QHOwttqOS+2
 sq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uzpK1boCHcQcR5pc8ogFi5sT1PU+IpQ+ZQqdstika2Q=;
 b=IYkcKVd4bWmr9vECdHpV9rMnrR9hU1cYIOzfzdlyM/yRIzBkvJkmgU9SjjdHj0FRHC
 485jvolUdTBzjdOr29U/vsQxRcjcPY8SSqHVAz6suV0NDqTQ5C9F2lcqotwAsB5cLj4U
 t+ZB3STdUFxa5P/MOrDa+qLfJCrM455ciRKoVIW86//zwhDXC6GFK/QhR+EjUK3IIoYJ
 qrVWCtGKSqAUycaICGm91cea5A3IyQu3RBEkTopX8ZhMyEyVsIa4Gf9r43V5CftXjQ50
 ahv2ISHUDZt1CU+F92TU7srhS6UHyzY9N7zguhaqESVxLfB76Wa7+kT85jWtbZHz9eem
 J1Jg==
X-Gm-Message-State: AOAM533TjZ9JdoOGw6L1UmqQUovwaL5hwgmW4RE5NOO9uUJ0UoCItbMQ
 Yu8cmhukAhOPuGsObylKEqzKgw==
X-Google-Smtp-Source: ABdhPJytKnH7etKjo5D51qbPo90M0LySr1f6f/8msv8fQJMr1GOdfHzmz7bql0e0yWC+SdvaGBrXpg==
X-Received: by 2002:a05:6870:d5a2:b0:de:f682:6c4d with SMTP id
 u34-20020a056870d5a200b000def6826c4dmr3832950oao.283.1649253342752; 
 Wed, 06 Apr 2022 06:55:42 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 z26-20020a9d62da000000b005b23f5488cdsm6781958otk.52.2022.04.06.06.55.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 06:55:41 -0700 (PDT)
Message-ID: <0556b3d1-56b8-1278-069e-42cdbd94fccb@linaro.org>
Date: Wed, 6 Apr 2022 08:55:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 12/18] hw/arm/exynos4210: Use TYPE_SPLIT_IRQ in
 exynos4210_init_board_irqs()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x31.google.com
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
> In exynos4210_init_board_irqs(), use the TYPE_SPLIT_IRQ device
> instead of qemu_irq_split().
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/exynos4210.h |  9 ++++++++
>   hw/arm/exynos4210.c         | 41 +++++++++++++++++++++++++++++--------
>   2 files changed, 42 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

