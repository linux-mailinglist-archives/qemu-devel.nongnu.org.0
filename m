Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C85804F6057
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 15:52:24 +0200 (CEST)
Received: from localhost ([::1]:40236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc659-0005p5-Sp
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 09:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc636-0004DA-Lp
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:50:21 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:36406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc634-0003P9-RZ
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:50:16 -0400
Received: by mail-qt1-x831.google.com with SMTP id s11so4354835qtc.3
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 06:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DyO97QojM5bqB3f4066E6jWu274R0YUfHjpZO941Ng8=;
 b=ZfEvvt8C5VLmcQhUbOKqytNbdZrnaeaKeeeP4Bnvcb6us02FKpSlCd+KdC8ZSqxjWu
 juD+RWdSpzEswyXWPvOJee7eLYHi6leU8r6EV5bQF0kjf6SwjCVxiHNeoNC6Hfg1Kcuj
 2fpWaQrgk2JiC1pa4CHPe6z1m7Hnk08jSJ5bWJi991sJVDO7f4o+ksG8cAEptT+hPgOb
 rwa0j7xoFSakjyNz3k+LWB62EKZ+FFoYjBqh8rd8mJXMDoyVto67r3ffY6l66TQsrkZI
 JNdCHaksETvR5YtH5HogTEQpEaO9olHxaYyHkIvG/BR5B2ZmrTlMSpAccWFYdEf5lubT
 49HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DyO97QojM5bqB3f4066E6jWu274R0YUfHjpZO941Ng8=;
 b=XZNWHGNyeCdBhdyxXxF58CdMmOus5HksdxEEXsxitd/q/y4pr9zEvopHw4O84Kqqyl
 zx1dEsE746PPrKe+RH6KShRChSzOT6Nk3FYTji8lF4ehNQfJoCn1fO4fJKkwPXUGeCyC
 IrTmtQ4ZiGq2ezAYTelQD+L5Lkk2lOBD0xyOQ7yR7Q8yes2riTRaf7v0sgbeEULDjXjM
 gNnyo3dAw/YIN0kikCuxDCBqvLatCuF59Nqtc/9UZdmStVTQdtISgzyeJ3i1b3klSPpe
 ltv3uftKfxIC/9q1tYuAaACjMguoMK9VZ1tXpbFhYK3N1woBQ3c3vFj+ogbz0vSefMPa
 +vQg==
X-Gm-Message-State: AOAM530C5DXYxE23HNA9A8ZblCjkuqdZjZcYC/zPT6RzYfE0jcndBUAe
 XJTofRXSluAKmdKXCqi0J6NvMw==
X-Google-Smtp-Source: ABdhPJxOIHTTUZV8z/efi64pNEYa8DAUL6YlZCYIXZSpsh4/yyAuS3DMShtlZKWyjdpmP8Zzoocn2w==
X-Received: by 2002:a05:622a:107:b0:2e1:d655:cc4c with SMTP id
 u7-20020a05622a010700b002e1d655cc4cmr7497512qtw.669.1649253013864; 
 Wed, 06 Apr 2022 06:50:13 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 o21-20020ac85a55000000b002e16389b501sm13091084qta.96.2022.04.06.06.50.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 06:50:12 -0700 (PDT)
Message-ID: <2de75f4a-c41d-bb9e-c4fc-96987faf7c98@linaro.org>
Date: Wed, 6 Apr 2022 08:50:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 08/18] hw/arm/exynos4210: Put external GIC into
 state struct
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
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
> Switch the creation of the external GIC to the new-style "embedded in
> state struct" approach, so we can easily refer to the object
> elsewhere during realize.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/exynos4210.h      |  2 ++
>   include/hw/intc/exynos4210_gic.h | 43 ++++++++++++++++++++++++++++++++
>   hw/arm/exynos4210.c              | 10 ++++----
>   hw/intc/exynos4210_gic.c         | 17 ++-----------
>   MAINTAINERS                      |  2 +-
>   5 files changed, 53 insertions(+), 21 deletions(-)
>   create mode 100644 include/hw/intc/exynos4210_gic.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

