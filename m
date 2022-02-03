Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BAE4A7E8F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 05:08:14 +0100 (CET)
Received: from localhost ([::1]:55730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFTPp-0007ZT-CU
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 23:08:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFTNV-0006HC-1D
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 23:06:06 -0500
Received: from [2607:f8b0:4864:20::1034] (port=37756
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFTNS-0003MG-E3
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 23:05:48 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 s2-20020a17090ad48200b001b501977b23so8833019pju.2
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 20:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yP+kFL94y5VaOzwE1oNnpdu4uaDtD7o3RBHfK7xpS7c=;
 b=aXCQxrkqO2NrVzHEIRPrQIOUnpl1UhsWjfJSPeGW/UJhnRHR/yTKGwc32hSe8Kp88z
 31EVGavOiQgTxIsiD8ciDPrBvgPEzukqnW43APlmCtJvOH1EXuhqWMuy7EW0ociHhLqM
 qbpildAtg/LJF+M7lwKUw7OO7SJo/B8w/zC8IwQ3tdHvhVAAKOtYtgaQk9ehqAc4z5pf
 VSm9fWbaZynx4wF2+EPVVGhAmKxqOIsU19uiAXL3f6DhwOR1hOgbj1DmOxexC9Q3fVlx
 7O7+FrZIamRfQ4o7Qp7jdOqgGIy1eJQNnorHjGXzqANqPr+1jU4hkyqTlrB4NrFt1xju
 AmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yP+kFL94y5VaOzwE1oNnpdu4uaDtD7o3RBHfK7xpS7c=;
 b=Hbve+KVJ+N2w2poEG+MTMzlW7aPmx9kRodRgF+aBnfBsjW4LWfBCJ95fiGIhT9FKbA
 rPjzhb5P+/r1wHTA6ti1ekg5eZGDcJKHSzd5CD1cXmx/W4yo839zKM1dnyxAKjo/Uvga
 u3ePSA6ZzvJdsRLJE3TYIFcnxSpzOZQbO0Bx3fn2aGBIRjld06wX/jgO2HP8X1HfzjkI
 b1KMJCI3LptT/HbS550vdGeLEoiXxjIg15X/0e4zyFJoa4/za7lqz+kcmzLykVMwX/Ra
 CECYVlFanyrmZTl1arh6kmKJJxuSkQeyt03m8WLsNc/6rlhOBsCgJn32Z7Z/L6saR7Kj
 RUvg==
X-Gm-Message-State: AOAM533dAjgqzBNILAoG7BG170OloohdjgxZIZW+3YMhWribE5g0rf6C
 ES1jGU3mOlpQtFzr7i5jT9z2IQ==
X-Google-Smtp-Source: ABdhPJxaPSUbwH/WbWbdI9hfsZo+aAHQ4YXF3g03z+PFuEM0ajfOa1lZ9bbDbUTJC2+rEsA83VSRwA==
X-Received: by 2002:a17:903:2451:: with SMTP id
 l17mr34197987pls.84.1643861144617; 
 Wed, 02 Feb 2022 20:05:44 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:801:72a7:386c:deca?
 ([2001:8003:3a49:fd00:801:72a7:386c:deca])
 by smtp.gmail.com with ESMTPSA id rj12sm8119582pjb.41.2022.02.02.20.05.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 20:05:44 -0800 (PST)
Message-ID: <47e7ac52-b5bd-5453-52a7-2b5e88368750@linaro.org>
Date: Thu, 3 Feb 2022 15:05:38 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 08/13] hw/intc/arm_gicv3_its: Pass ITE values back from
 get_ite() via a struct
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201193207.2771604-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/22 06:32, Peter Maydell wrote:
> In get_ite() we currently return the caller some of the fields of an
> Interrupt Table Entry via a set of pointer arguments, and validate
> some of them internally (interrupt type and valid bit) to return a
> simple true/false 'valid' indication. Define a new ITEntry struct
> which has all the fields that the in-memory ITE has, and bring the
> get_ite() function in to line with get_dte() and get_cte().
> 
> This paves the way for handling virtual interrupts, which will want
> a different subset of the fields in the ITE. Handling them under
> the old "lots of pointer arguments" scheme would have meant a
> confusingly large set of arguments for this function.
> 
> The new struct ITEntry is obviously confusably similar to the
> existing IteEntry struct, whose fields are the raw 12 bytes
> of the in-memory ITE. In the next commit we will make update_ite()
> use ITEntry instead of IteEntry, which will allow us to delete
> the IteEntry struct and remove the confusion.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 102 ++++++++++++++++++++++------------------
>   1 file changed, 55 insertions(+), 47 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

