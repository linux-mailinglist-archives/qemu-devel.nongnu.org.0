Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A841F60AF18
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 17:32:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omzAf-0007zR-Al; Mon, 24 Oct 2022 11:15:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omzAc-0007wI-O6
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 11:15:18 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omzAb-0006ky-4t
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 11:15:18 -0400
Received: by mail-pj1-x102c.google.com with SMTP id b11so2230646pjp.2
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 08:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T1ZD74HQL7Py/+XW+RX24Mqw27wQ/B8Z658k6Acm3aM=;
 b=NQf72qMKABK3QmcFIYpc3lZeTw5s+TCQFaUdzwTQuu4VvzC0WNBzPs6j8e78UKT+mH
 3ISjEGfH0puk69nOLMF5X0MSTxN0qKEoLv/V9eSuJnOH08q2+RKKKC8p6YVmXyAlO5zp
 ZsH8Y2dHCA30heRHUYulDVIMqvt8yHXbvYA758jvSnEbsxZ1s4P1y78mkhCXkR9pE2J8
 ACkJV5sZzI/eYwMyjvMvE1bQUYHwJq9t/QslujERJuIykf7lufyGp3coQUwkyh5Hbi1Y
 XI2WIqyzFwF9NSW/UrIKOeaoijgRelTYoaWT+ynFLp+KNO7vxEHaLaWPz/Tqf/0hHbOv
 kamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T1ZD74HQL7Py/+XW+RX24Mqw27wQ/B8Z658k6Acm3aM=;
 b=e3uaUqGgGC1PzzEpJiyqAeABWdDe8DbRdrBHWMB+V1Vh7YtFpwncwwkqFFDxOJYT4C
 Wxftm+dFhnWW6X69dm5aUoS3Al87uXuu9fwB+fJIY3LWWswMsULvrzaXPEC1Tqhm8DDh
 76al8nP9XVyjbUBhrRzosM/dgv2SObyIuobd0LnZJP3pMLOpDDWmcO5pAZc7cPT0oeM2
 uHD7K0Ax5+7vhkmiNaSW7AQ9U/pWM+eRu5ls416wfn79yyzBCWnWl1j4nVdtNELVDB5x
 er6r4HMNjYs9I0Yodgyp76+YMHlMBE8PKSiGXN2WGZ4ePHWgwdfCrhgz/q7lMmqQvVCH
 BglA==
X-Gm-Message-State: ACrzQf2gu71xq1Biynf+MSW6prW7ZnSoOjSYQQF3LjMnxrkmq9rw8NKQ
 za85WwZPMlqm/OAbdF44W05r8g==
X-Google-Smtp-Source: AMsMyM5A4je5rTmxs/4ueh0ONyhnqVCEAQRqtutSw6BSNfDrXQYP0FuUigbTQXGcGww7oZxrKg0xMQ==
X-Received: by 2002:a17:90b:4d07:b0:1ef:521c:f051 with SMTP id
 mw7-20020a17090b4d0700b001ef521cf051mr76528468pjb.164.1666624514284; 
 Mon, 24 Oct 2022 08:15:14 -0700 (PDT)
Received: from [192.168.136.227] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 a4-20020aa79704000000b0056bb4bbfb9bsm2618205pfg.95.2022.10.24.08.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 08:15:13 -0700 (PDT)
Message-ID: <ab0e8b0f-be77-7947-244c-e542473206a7@linaro.org>
Date: Tue, 25 Oct 2022 01:15:08 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 01/29] accel/tcg: Add restore_state_to_opc to TCGCPUOps
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-2-richard.henderson@linaro.org>
 <e1eb87ed-c43c-6dae-4beb-9d0a9907bce9@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <e1eb87ed-c43c-6dae-4beb-9d0a9907bce9@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/25/22 01:05, Claudio Fontana wrote:
> On 10/24/22 15:24, Richard Henderson wrote:
>> Add a tcg_ops hook to replace the restore_state_to_opc
>> function call.  Because these generic hooks cannot depend
>> on target-specific types, temporarily, copy the current
>> target_ulong data[] into uint64_t d64[].
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/exec/exec-all.h       |  2 +-
>>   include/hw/core/tcg-cpu-ops.h | 11 +++++++++++
>>   accel/tcg/translate-all.c     | 24 ++++++++++++++++++++++--
>>   3 files changed, 34 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>> index e5f8b224a5..a772e8cbdc 100644
>> --- a/include/exec/exec-all.h
>> +++ b/include/exec/exec-all.h
>> @@ -40,7 +40,7 @@ typedef ram_addr_t tb_page_addr_t;
>>   #endif
>>   
>>   void restore_state_to_opc(CPUArchState *env, TranslationBlock *tb,
>> -                          target_ulong *data);
>> +                          target_ulong *data) __attribute__((weak));
> 
> Hi Richard, doesn't matter much since this is removed later on, but I wonder why the need for attribute weak here?
> I don't see you overloading this function in later patches..

So that it can be undefined.  Otherwise I can't remove the existing symbol from each target.


r~


