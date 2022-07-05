Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D06D6566018
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 02:37:28 +0200 (CEST)
Received: from localhost ([::1]:49402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8WZD-000062-KE
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 20:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8WXa-0007J0-Ii
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 20:35:46 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:46721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8WXY-0004WS-Uj
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 20:35:46 -0400
Received: by mail-pf1-x431.google.com with SMTP id a15so10098915pfv.13
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 17:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8MWoba3t3SZd0/Yjzn/MOztMcmXoumB/4ZjpvOS6BK0=;
 b=vl+gtpspKcEWW8SbEbuzfv/Kt+3GPbDI9arZUO3AF99yma8mbzgn8SvqTea9GA7tdx
 urnnfwq24ejkiqDnDNeEJqTGP/lk9GXZzJekmfVba0Xiz4d+4PwivGUn4X1BRFRhtrv8
 FEyXdfMxU14mPAlkZ+egBjwiCavRDLmgTL7TllsI1jTmqrKgvqn1289HKzlGTfvC1m8M
 RLP+AB1siob+qLj/ENuAp67MMAzx5KTCD/gchfqVNkGnqvUByW/Tq+dSt8Ua4ZpGO9w+
 Y3FGYPlg1psZxXTWg+7yo6uZLFAjP1bPCtZq2dW9AQXW+fOH2RlNYKRcKsH+UpYs44uP
 9cpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8MWoba3t3SZd0/Yjzn/MOztMcmXoumB/4ZjpvOS6BK0=;
 b=bDIe4XrztPogYfALCtThmfgIOZLE/NyHR8tkRXGcaXUnwuDSzqGYKkTOUTsD8HfVTX
 AV4glfUs6uDoKCnuo+yXpeMTf5ODb8BQaT3u1d0nY2zIuUiLy6r7FQhICxF8Lck+9eEu
 PEAm2F3jESOiMv5rARl0O8tCFwNI2BjfZ7T4l1fr9Mfa8xMZdbtNS1+AiU0khR8HOlfX
 njNoUYIsNzAyjWT+IAjGyqIWrqWux6pSv06d1wXacrsPYpAxbSpLsT5E5oEP6ub1CviW
 BseTOWx03LgxEFD8Z3OrB+WI2raTWUSEe0nMfKIm2dirh9p1c+5ZRTJn/qGDpRu5B7GQ
 DSHA==
X-Gm-Message-State: AJIora+FQlWYG1KuXpLmMrj714uBTczvFv/uVoz557+IVUyfqSjgx6sC
 1xjA2paK7v2Om/zAR5nf5OhKlA==
X-Google-Smtp-Source: AGRyM1uCO+0A+at/8TjM2zP6bOECZitgTE+uuGHcSPKduTK2GRSkaoYX/DaueHp1I4OJM2dDGE9rhQ==
X-Received: by 2002:a63:4710:0:b0:410:ac39:831b with SMTP id
 u16-20020a634710000000b00410ac39831bmr27424129pga.395.1656981343468; 
 Mon, 04 Jul 2022 17:35:43 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a170903110400b0016bef4a9dadsm615287plh.77.2022.07.04.17.35.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 17:35:43 -0700 (PDT)
Message-ID: <72df2c61-c8ab-8075-2c2f-4a52e9fecec8@linaro.org>
Date: Tue, 5 Jul 2022 06:05:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 01/62] accel/tcg: Introduce PageEntryExtra
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-2-richard.henderson@linaro.org>
 <CAFEAcA-2fsJoHkaq1a_k+_D2V1J2oPkDZ+7Ua=tge--ay5HG7Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-2fsJoHkaq1a_k+_D2V1J2oPkDZ+7Ua=tge--ay5HG7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/4/22 20:58, Peter Maydell wrote:
>> + * Returns a pointer to the iotlb entry, with env_tlb(env)->c.lock
>> + * still locked, for final additions to the iotlb entry.  The caller
>> + * must unlock the lock.
>>    */
>> -void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
>> -                             hwaddr paddr, MemTxAttrs attrs, int prot,
>> -                             int mmu_idx, target_ulong size)
>> +void tlb_set_page_with_extra(CPUState *cpu, target_ulong vaddr, hwaddr paddr,
>> +                             MemTxAttrs attrs, PageEntryExtra extra,
>> +                             int prot, int mmu_idx, target_ulong size)
> 
> The comment claims it returns a pointer to the iotlb entry, but
> the code says it returns void... leftover from a previous design?

Whoops, yes.  In the end I thought that was a bit too much internals exposed.


r~

