Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 176EA3D4F72
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 20:20:41 +0200 (CEST)
Received: from localhost ([::1]:35446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7ijw-0008CV-5S
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 14:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7ihe-0006nj-HH
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 14:18:22 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:36727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7ihd-0003sv-4g
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 14:18:18 -0400
Received: by mail-pl1-x632.google.com with SMTP id i10so5862481pla.3
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 11:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=JBKtoajRFqAQmYRHIJJ0fkQH8d+bSUkkequ4cY7/wgI=;
 b=TAkzfKwmBifcXRmyDdqIUJG7bHydT2k2D93tjpOyKfl7+OaC/7kWOa6cqmqiZD8bWc
 lZsSwbO59fGaeKs+rHhM/NUE3JJ8VLKC1CxrXiDngMZeL+S2oVzhmYdTwQNSCuAKBdoz
 HopPo1UbwVtT5E6K8Z6TFV+bQZ63/IboKC6KL0lxqdYw3u/ktP08tl5CZmK/+ldLxnQW
 1Y2/MLZUXwjd5QXmMyJz7wOSfaetcfrF3NlAcjgcfOebO6oF0PC5ckCRHxgD4X8bQCtK
 yThnOBBD+GSP3m0bnPYgV2uKvBwy0s9zIOFkaKDCbJf3twG7OMEKG42nTOM/vb/Qz7Eu
 Yi3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JBKtoajRFqAQmYRHIJJ0fkQH8d+bSUkkequ4cY7/wgI=;
 b=dTOp8B/dDZ5KBFi2te2+5XSGmi6pSdhC5g6M9AzaPfMQQzTCTaiENNQTjJo5Wlu8hK
 p2wG35BVt+QlVdyevlCvZfGqo4ZL9UydVe/7yHFpVILZYciHdqdk0uBnDMn6sK5O3IZq
 wqaJKL4G+8zvW/SgGOqkH5EcRkmnlvOjmureS9JaV1CyFfUmIrT298zHjrpRt7a5Lv6s
 UYHS7Jrq/9EP3UyVuxtT0ehLkY4ne0OEDJE4mX96wU99Uy49YqdIgrwrq4Z8qhhSL7oi
 SuW2rz055aUgGx5t9VKJaTYs7qdQ+IZGwzDb/eXyGAUU68iK7O0b4/Nwwl5ytgL2Lzpb
 MObw==
X-Gm-Message-State: AOAM530FEc+EfcHzzDCm05r6oHxxKBwdbTKlb9TTYEzw51RO/ufEpMJP
 RmLvMC2Q3SHWMLKqkjaxWnOP2ZMVOmaQ8w==
X-Google-Smtp-Source: ABdhPJxxvSY0hLInFlnnAcCEe8fo44sxocVrPbfijCjWaUNOwgwgz2g69Y45wwR38Zv40cW46B3GOA==
X-Received: by 2002:a17:90a:a013:: with SMTP id
 q19mr22288467pjp.224.1627237095792; 
 Sun, 25 Jul 2021 11:18:15 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id f5sm8498143pjo.23.2021.07.25.11.18.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 11:18:15 -0700 (PDT)
Subject: Re: [PATCH for-6.1 4/6] hw/intc/armv7m_nvic: ISCR.ISRPENDING is set
 for non-enabled pending interrupts
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210723162146.5167-1-peter.maydell@linaro.org>
 <20210723162146.5167-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9df91161-c097-81b2-6062-c7961fec3938@linaro.org>
Date: Sun, 25 Jul 2021 08:18:13 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723162146.5167-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On 7/23/21 6:21 AM, Peter Maydell wrote:
> The ISCR.ISRPENDING bit is set when an external interrupt is pending.
> This is true whether that external interrupt is enabled or not.
> This means that we can't use 's->vectpending == 0' as a shortcut to
> "ISRPENDING is zero", because s->vectpending indicates only the
> highest priority pending enabled interrupt.
> 
> Remove the incorrect optimization so that if there is no pending
> enabled interrupt we fall through to scanning through the whole
> interrupt array.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/armv7m_nvic.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

