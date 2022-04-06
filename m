Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6617D4F60B3
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 15:59:16 +0200 (CEST)
Received: from localhost ([::1]:53668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc6Bn-0006dt-GV
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 09:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc69d-00052V-Gk
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:57:05 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:40122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc69X-0004x3-0t
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:56:58 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so2950961fac.7
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 06:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nl63IwxSb36AsL1HSm1GHnum+45yU/tgvjzAoQ79UC0=;
 b=bAcVzby4VbJNuATb8RK7Qn2YSfR0JkWG0xmk9Ib7OTq9amFT3aGZuoJIcT50aaIwII
 ExLPfJSPjhd7Yja1kQNV0kk2BmFzWclfBIwGLy2LtoB+HZ3wft6lQxXjfy8wgemcbpFz
 kaX9UQ3S1EcSh+U/sb7xbKUg8xpbL+FvYPnlw5G40pP3+w6gRQRoVkY8FgbMfVfID8mm
 4bdMSlH+Ra2X4llQHpLddchWX1YQkM6jFA3odM/qdFTHEY41I4i7i08plNnx3a6+wnTZ
 HBCS5HndtswB3VJmSvrynDXnA0FqI+OuRHUKe+1GIa8+Aw3oelher/FNFUfGwmSlBRgf
 XsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nl63IwxSb36AsL1HSm1GHnum+45yU/tgvjzAoQ79UC0=;
 b=bEOBUDuDO7GmLRfUtW0CdQ+Qxj4BiKyuRDZXVO5HSKLMqnwjqNxzfeu4HJ1DqeUaXQ
 oniLj9Yj73inxxZZucimCI73QuGKO1KC1kp4ramnNvOkbS03wqAgZ/2iasFI0v680bH9
 aJPWBcrCItP7UbAK4WAz/IICgWNrQQxRL5nuWC4abFMzcE4fqo4+qM51m90uefFeAFKA
 cWPUPyQv/9t/4fLxhyZFGXxYqv2BG3AUkTWoQfjSRcXDTE5NxV8kM1Q4qa/Bc2QX73H6
 ACATIRDJtH0IriQuH8f/MR+QaP4D9CCPZT0cM2plX0H+7y/O3SCeddjTMtP5R40BzXra
 SSxw==
X-Gm-Message-State: AOAM533ZvPYA+J65tvnFu1DFAoUBXBtlkYg9OFpbFLjhVKz632LNba0P
 ngRQhTfsC1FalKl6/lP7AEOSTg==
X-Google-Smtp-Source: ABdhPJwRn6QVBY7vCjyICROypBuXgRToByVb/ek1udsG1sR9c2TNup2KZUq7ZQgjt03jKM0NnWd/vw==
X-Received: by 2002:a05:6870:611e:b0:de:d210:9d2f with SMTP id
 s30-20020a056870611e00b000ded2109d2fmr4020873oae.141.1649253407878; 
 Wed, 06 Apr 2022 06:56:47 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 o64-20020acad743000000b002ef3b249b9esm6408992oig.58.2022.04.06.06.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 06:56:47 -0700 (PDT)
Message-ID: <df1ba1fe-257a-aa98-cec1-07a6e2554e86@linaro.org>
Date: Wed, 6 Apr 2022 08:56:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 13/18] hw/arm/exynos4210: Fill in irq_table[] for
 internal-combiner-only IRQ lines
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x36.google.com
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
> In exynos4210_init_board_irqs(), the loop that handles IRQ lines that
> are in a range that applies to the internal combiner only creates a
> splitter for those interrupts which go to both the internal combiner
> and to the external GIC, but it does nothing at all for the
> interrupts which don't go to the external GIC, leaving the
> irq_table[] array element empty for those.  (This will result in
> those interrupts simply being lost, not in a QEMU crash.)
> 
> I don't have a reliable datasheet for this SoC, but since we do wire
> up one interrupt line in this category (the HDMI I2C device on
> interrupt 16,1), this seems like it must be a bug in the existing
> QEMU code.  Fill in the irq_table[] entries where we're not splitting
> the IRQ to both the internal combiner and the external GIC with the
> IRQ line of the internal combiner.  (That is, these IRQ lines go to
> just one device, not multiple.)
> 
> This bug didn't have any visible guest effects because the only
> implemented device that was affected was the HDMI I2C controller,
> and we never connect any I2C devices to that bus.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/exynos4210.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

