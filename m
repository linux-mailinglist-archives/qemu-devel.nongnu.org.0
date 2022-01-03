Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6B64838A6
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 22:51:43 +0100 (CET)
Received: from localhost ([::1]:34016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4VEz-0001Px-UQ
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 16:51:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4VDi-0000R8-Mt; Mon, 03 Jan 2022 16:50:24 -0500
Received: from [2607:f8b0:4864:20::82c] (port=39555
 helo=mail-qt1-x82c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4VDf-0006bI-RK; Mon, 03 Jan 2022 16:50:22 -0500
Received: by mail-qt1-x82c.google.com with SMTP id bp39so31986721qtb.6;
 Mon, 03 Jan 2022 13:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zL8ZCasVpfR1HFcPDPofy7sus5IHdrje0/+tvS7bOSs=;
 b=GIKhQR5g7prf+5cR6ZGGQi7JBJjUnZl0Jcj2Vu+D8ev7WVPpGa9T6fdC0PW/l9FI7G
 8QP6T2TI1e9s4vzq6S/ydAyMEypYCxCiDL0NJ7ZI9R5EK07L3e3gleawW90LvqV/Hdux
 e/9ykLcSsaO74CHnlVQH/siCEm03xOR5LpnzRAVKZ3djVNElhbEJClIxAzrvOqO7FBmL
 7shffrV4A//EljoXuAJ163NRALTI9aVIAZ9BGXgIjhyU0w2v1of3a8HgrEvpJzc2oJa5
 yG3nuZOnaoleEwIOSla7hiWjRvD9p6H3/b9AuDKuDvDtCo6AagKTji1uUBu9w4J6/9TK
 xLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zL8ZCasVpfR1HFcPDPofy7sus5IHdrje0/+tvS7bOSs=;
 b=n9yWa51Jg1HqG3oBlg1nWQFtCDIsozRXefhBQktDzgkr2rON+SC7RfDgd+A9bxym/f
 ocgpNQpbuiqikNiatjeExSldSL97HovJT/b/10vq94kos/qqoAi+1NpiAsvqRPbWMIBZ
 7+eqmjVX0L7JoMBB1va/5oNCHwSSy9HmNCeQVSXPx5weBlD7wFddVSyQ1jsJFa/Xd2jn
 /dmrTRRIHRkN9232k6wwjeYBogejTT7l1bQg10iZVar5Zx7rJ7112DBicFwLON48fFuu
 6Ysxxon4vLAJ/E4dYDkv1BHDK6l4CvagFfwUfCmwkMNiNWTYAUUIo/jMeYLPKsT3LOYW
 CcYQ==
X-Gm-Message-State: AOAM5327tse2x9GWg3XJrP0jOHtzVDzv7gAPYI8ogjsS7lSWzIbC5XSM
 1isXo0amOMlucRu53HON1eI=
X-Google-Smtp-Source: ABdhPJx1A3Pm3sF898IcJF+cPnwB4NF3bHZ+RUVJ8VLBkNiI+xElxDSnUW3XPN2RO5IFbP+ngIHaaA==
X-Received: by 2002:ac8:580b:: with SMTP id g11mr42365954qtg.542.1641246613171; 
 Mon, 03 Jan 2022 13:50:13 -0800 (PST)
Received: from ?IPV6:2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7?
 ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id j124sm27565555qkd.98.2022.01.03.13.50.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 13:50:12 -0800 (PST)
Message-ID: <25b90f46-befa-3fc9-cdef-e6e999765f33@gmail.com>
Date: Mon, 3 Jan 2022 18:50:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 4/5] target/ppc: keep ins_cnt/cyc_cnt cleared if
 MMCR0_FC is set
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220103185332.117878-1-danielhb413@gmail.com>
 <20220103185332.117878-5-danielhb413@gmail.com>
 <0b9b2a07-4b0c-4095-9365-d95139e182fc@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <0b9b2a07-4b0c-4095-9365-d95139e182fc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.354, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/3/22 18:38, Richard Henderson wrote:
> On 1/3/22 10:53 AM, Daniel Henrique Barboza wrote:
>> pmu_update_summaries() is not considering the case where the PMU can be
>> turned off (i.e. stop counting all events) if MMCR0_FC is set,
>> regardless of the other frozen counter bits state. This use case was
>> covered in the late pmc_get_event(), via the also gone pmc_is_inactive(),
>> that would return an invalid event if MMCR0_FC was set.
>>
>> This use case is exercised by the back_to_back_ebbs_test Linux kernel
>> selftests [1]. As it is today, after enabling EBB exceptions, the test
>> will report an additional event-based branch being taken and will fail.
>> Other tests, such as cycles_test.c, will report additional cycles being
>> calculated in the counters because we're not freezing the PMU quick
>> enough.
>>
>> Fix pmu_update_summaries() by keeping env->ins_cnt and env->cyc_cnt
>> cleared when MMCR0_FC is set.
>>
>> [1] tools/testing/selftests/powerpc/pmu/ebb/back_to_back_ebbs_test.c
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   target/ppc/power8-pmu.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
>> index 7fc7d91109..73713ca2a3 100644
>> --- a/target/ppc/power8-pmu.c
>> +++ b/target/ppc/power8-pmu.c
>> @@ -40,6 +40,10 @@ void pmu_update_summaries(CPUPPCState *env)
>>       int ins_cnt = 0;
>>       int cyc_cnt = 0;
>> +    if (mmcr0 & MMCR0_FC) {
>> +        goto hflags_calc;
>> +    }
>> +
>>       if (!(mmcr0 & MMCR0_FC14) && mmcr1 != 0) {
>>           target_ulong sel;
>> @@ -71,6 +75,7 @@ void pmu_update_summaries(CPUPPCState *env)
>>       ins_cnt |= !(mmcr0 & MMCR0_FC56) << 5;
>>       cyc_cnt |= !(mmcr0 & MMCR0_FC56) << 6;
>> + hflags_calc:
> 
> Good catch, but should be folded into patch 1 to avoid bisection breakage.

Fair point. Given that you have a suggestion in patch 5 as well I'll send a v3.


Thanks,


Daniel



> 
> 
> r~

