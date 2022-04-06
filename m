Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82704F6021
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 15:49:55 +0200 (CEST)
Received: from localhost ([::1]:36558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc62k-0003DR-Vg
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 09:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc61L-0001Vz-FF
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:48:27 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:34317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc61I-0002mg-H4
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:48:25 -0400
Received: by mail-qt1-x82e.google.com with SMTP id c4so4370672qtx.1
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 06:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CAjr5UyPClVVB9rHitcgjPuLfDMBN3rhab7fTyWNZTM=;
 b=OIvQ1gCypCsNtvI8e9btBTwwqymORL3G9mPKRHeQVc6fEGXwFsQZqnUwFD52rQW+BP
 m+TBCt2BbYjohBDuOiSjQGoyzrK7bJgXR7ohnxdbGOrgwDKmU8yI6/q44jXvn5ohyxLL
 LERpdbH7HPXwKZ/liElzPyEhQ2uq3o8qkfTp3ixSQMcKEd1dOKQBVgFPgaSYfQ068/yz
 eDP/fkUEAfIxCMAeDyvhey8HkJ+EoBG2uC4rPsHQPaQBIADTx4QnT0QhPAG7r0IFutNz
 w7oubGlPRcGR7JVhUu7r/VD2QbmQ3f8iklvSSy+3TTm8dNUXCet/8/b8e2ecmS830/Du
 /wZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CAjr5UyPClVVB9rHitcgjPuLfDMBN3rhab7fTyWNZTM=;
 b=ppmjB3VEYEnU26nEOXBhYmhBm4aA3rok8WJwDAkLsJ0Ma20Sa3zn5yfL3Fidbl19kU
 aiYZGSsQi5Yrtl2XQbjtBjFD6TuFV1QrNW/hlqqDS3Zgu+nVIoYBwZxUjAa3rNVW3XEn
 UBE4GoGoaZgEdj0GpLha+25AahLLMkJ/kWYW0vBFET3JcHLV7PCbt1fu8TIE9qaPg09A
 Cq4ZI9YM7G/V9gUzARImL/WLi5cb0yFad3V910eOuTAsJ6IRjN0kFRTmE0iLaczNfIbb
 etUIEkyeyV4uNsPRcJeR6FAzgI64V5QP+Ste+nNd/DT7d5Iw773Zm7hun+UVdlagj13e
 k6ag==
X-Gm-Message-State: AOAM532R8oaJIM2MdFr4oohxA6aHGTI+n2LhoJbReKgTJmvqKYTdIl+V
 vs/krNgXFNSt9qkujZO0E89HKCZyrx9SiRCivCA=
X-Google-Smtp-Source: ABdhPJwKsWwu3rpIgzqK+P7MMXshve3OyDoTF36v5sjHd1IVnDFRC73Ff4hogGQoghmSjokcKKXg8Q==
X-Received: by 2002:a05:622a:4d3:b0:2e1:bc11:3b97 with SMTP id
 q19-20020a05622a04d300b002e1bc113b97mr7434584qtx.189.1649252901933; 
 Wed, 06 Apr 2022 06:48:21 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 z19-20020a05622a029300b002e1a763dac1sm13559734qtw.9.2022.04.06.06.48.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 06:48:20 -0700 (PDT)
Message-ID: <22fc9253-794a-3822-36fb-0c2a6b9a66fd@linaro.org>
Date: Wed, 6 Apr 2022 08:48:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 07/18] hw/arm/exynos4210: Move
 exynos4210_init_board_irqs() into exynos4210.c
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
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
> The function exynos4210_init_board_irqs() currently lives in
> exynos4210_gic.c, but it isn't really part of the exynos4210.gic
> device -- it is a function that implements (some of) the wiring up of
> interrupts between the SoC's GIC and combiner components.  This means
> it fits better in exynos4210.c, which is the SoC-level code.  Move it
> there. Similarly, exynos4210_git_irq() is used almost only in the
> SoC-level code, so move it too.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/exynos4210.h |   4 -
>   hw/arm/exynos4210.c         | 202 +++++++++++++++++++++++++++++++++++
>   hw/intc/exynos4210_gic.c    | 204 ------------------------------------
>   3 files changed, 202 insertions(+), 208 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

