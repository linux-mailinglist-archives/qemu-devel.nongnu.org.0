Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EBA4F60C0
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 16:08:34 +0200 (CEST)
Received: from localhost ([::1]:39320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc6Kn-00080U-OC
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 10:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc6Im-0005oq-IH
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 10:06:28 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:37883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc6Il-00072T-15
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 10:06:28 -0400
Received: by mail-qt1-x82f.google.com with SMTP id t19so4429032qtc.4
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 07:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7CN4md7jUqAs80Mf8lxCx2YVe6U6LEiC8G24WE/+bd0=;
 b=M+vlZ26RXN2t7qj7LeMdAk1bDCh0l1F0DQeFtPMyQYmqvgIm8shJlbEH8J/gVju3c6
 jdFlqhRYNVFLqTNxEgoOb1yC35v6t6EaPlKNF4WLJTeonvnn5if5SN8uBgphYGHnZ6WA
 VsvdDuU2E4rkHQk3MhcDSH4kGmudLexzGhxWkBFcyE6/bMkeDWdlUU56IEvCFN5xfA0k
 /KLD0ZKx4NapAfFfk4ip0omXgedtpM8/tIhs0x9LSrC0XLue0z9ZW2+6/5Nm822IgQeB
 RuPGlfcRt/pQVcsMkdvdi7XkHCDxXKDHilnv7AzxjTuAU4DsHv+jCVkmNvE5g1Kk22L7
 Xabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7CN4md7jUqAs80Mf8lxCx2YVe6U6LEiC8G24WE/+bd0=;
 b=S5g2I0YK4lL6glkcvsPdh9VWFHTPG/ORjgJPoAuIt0QdRpZaWJ2N98hfuuq7dAa0Nq
 YpbUtOV8ORpAdrZWbu2/JSjCnmwI4cv0MIMaw1ZR/I7VM7IwmIaKN/aqszZwvQeOETVq
 WGWvLLIT1qH0iWGA4dUd/7euVDFJtzYjvHO2vvAL9CBP+HsGyIHdpV6LkVJR/7apeIKk
 7g2NGY8hRA1J75Wo5UmslO67CzW0CqOEfQ988gqu+WLetxmZUw3PQaZY5/bNCk8MzO1C
 QOSLyevDCsqIz83ZavCtqu8O0hGkynD++9/R8NlLdBUNlKDc2gowgwKobR7xKOaRR86O
 7mhw==
X-Gm-Message-State: AOAM533yxOoDgV4cFSkuHYEXAkLIzr2ivfP+bELI8R725rSicoeVTgUe
 o4WIbr/1r5vbrL6Fgo/rVr8ktB4cYpNOW5BtEtg=
X-Google-Smtp-Source: ABdhPJy7tqiUg2PXGmmxZU6J/a8e8tZMVulIJ9u23aK22+15UinABxFlRc2qLnpbv6wK9zYdfbty9A==
X-Received: by 2002:ac8:5a4f:0:b0:2e1:a7be:2d13 with SMTP id
 o15-20020ac85a4f000000b002e1a7be2d13mr7517958qta.598.1649253984907; 
 Wed, 06 Apr 2022 07:06:24 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 s11-20020a05620a16ab00b0067b3bc3c35bsm9637736qkj.113.2022.04.06.07.06.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 07:06:24 -0700 (PDT)
Message-ID: <f7db2c43-8fa6-490d-cd49-43df3fa55de3@linaro.org>
Date: Wed, 6 Apr 2022 09:06:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 18/18] hw/arm/exynos4210: Drop Exynos4210Irq struct
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
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
> The only time we use the int_combiner_irq[] and ext_combiner_irq[]
> arrays in the Exynos4210Irq struct is during realize of the SoC -- we
> initialize them with the input IRQs of the combiner devices, and then
> connect those to outputs of other devices in
> exynos4210_init_board_irqs().  Now that the combiner objects are
> easily accessible as s->int_combiner and s->ext_combiner we can make
> the connections directly from one device to the other without going
> via these arrays.
> 
> Since these are the only two remaining elements of Exynos4210Irq,
> we can remove that struct entirely.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/exynos4210.h |  6 ------
>   hw/arm/exynos4210.c         | 34 ++++++++--------------------------
>   2 files changed, 8 insertions(+), 32 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

