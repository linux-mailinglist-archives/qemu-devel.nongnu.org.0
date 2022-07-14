Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CC657580A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 01:26:56 +0200 (CEST)
Received: from localhost ([::1]:60800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC8ER-0004rb-Tr
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 19:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oC8D5-0003V3-Pc
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 19:25:31 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:40550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oC8Cu-0008BJ-NN
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 19:25:31 -0400
Received: by mail-io1-xd32.google.com with SMTP id n7so2690381ioo.7
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 16:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DYHA0vS6o2loJ0ayUbzePztWuoDPFLJm7DKTMngrwyw=;
 b=CzD14DgXhuMmnKqXU8CniHR8whVMhWsPZ5Zk1KlkR+/IK0Mbfqzg2tXRZ0GmGEayH6
 IN5ZqxtQINhV2GXUDdEEoebr4o/LhLxImMYs6l56pgpxKEPnlhzicW8W1kolyZ7w4+ZL
 Uj+nbbFr+zP18mpuOR3bwaZi08DD6OtdZBjAe90bku97iM3yJGAzEO9ZVFctCVOYd8e3
 Ql4MJsTTQkHqIQ2O4PHKLnzKegyRuvQ/wOIt2fMT/ihKdCd0jHIspunObE03KYkEm4uj
 AmcINKNo8uiKaji42xoHL5PPLM5bGeFE7Is0ufg9dAVhLw3Y9Yrw0Cnc8NYIPPhVkKrX
 1n/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DYHA0vS6o2loJ0ayUbzePztWuoDPFLJm7DKTMngrwyw=;
 b=UndjndS/Ke9NuzLtcaSLDz1zYYhXkGEBAmSakvhMtsnLxxwqK7Hag6uUYzoXj3dZZp
 3I77kdwVU9jdsea2s7z9TO0PsWz7S81JKNWTC8XlX9t78Mn6rtYOtWeIHdjT7ax9AFjo
 6jHdSkP8BHDhCzmHVKfVP2G8AD6V7af5irM4J7MzPq/HPVHc5aaC0w3rDt8yC5D+Ioqu
 kPvdAOWzokX01YlYD/dWyA2ImCEzb9FpMfPvkHEmq/BTgt382MCwIKPVCRNCwEnRaPMk
 zessujfUVdc+LHjmQJzYQNX7ATnsvWYKJ1IbvuXCwU//zIqlh+b3NrUqCD7e7U0LJlcP
 L4HA==
X-Gm-Message-State: AJIora8G0XLSMSpRAuf+DMa7ykDpfeb41UrD8ci+Cf/uS9Ibpz/mU5n4
 z1zOgooHk2cohBTre7siyjpQAQ==
X-Google-Smtp-Source: AGRyM1vthqkTSxjmdl3J50lFTEftIdAQm4YOBs1uXAQD/F7NWoANhc52M8VUaRD9M1kUiYjAnPnQ0A==
X-Received: by 2002:a05:6638:1483:b0:33f:7944:a30d with SMTP id
 j3-20020a056638148300b0033f7944a30dmr6244596jak.155.1657841119498; 
 Thu, 14 Jul 2022 16:25:19 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.139.185])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a056638001600b0033a29ec646dsm1288831jao.4.2022.07.14.16.25.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 16:25:19 -0700 (PDT)
Message-ID: <23b6b693-be9f-1b22-0397-569988829994@linaro.org>
Date: Fri, 15 Jul 2022 04:55:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 7/7] target/arm: Honour VTCR_EL2 bits in Secure EL2
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Idan Horowitz <idan.horowitz@gmail.com>
References: <20220714132303.1287193-1-peter.maydell@linaro.org>
 <20220714132303.1287193-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220714132303.1287193-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/14/22 18:53, Peter Maydell wrote:
> In regime_tcr() we return the appropriate TCR register for the
> translation regime.  For Secure EL2, we return the VSTCR_EL2 value,
> but in this translation regime some fields that control behaviour are
> in VTCR_EL2.  When this code was originally written (as the comment
> notes), QEMU didn't care about any of those fields, but we have since
> added support for features such as LPA2 which do need the values from
> those fields.
> 
> Synthesize a TCR value by merging in the relevant VTCR_EL2 fields to
> the VSTCR_EL2 value.
> 
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/1103
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h       | 19 +++++++++++++++++++
>   target/arm/internals.h | 22 +++++++++++++++++++---
>   2 files changed, 38 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

