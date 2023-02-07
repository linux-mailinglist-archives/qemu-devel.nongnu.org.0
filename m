Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2491768D647
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 13:17:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPMsq-00070r-Gq; Tue, 07 Feb 2023 07:15:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPMsn-0006xp-TZ
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 07:15:34 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPMsl-0005ab-SZ
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 07:15:33 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 hn2-20020a05600ca38200b003dc5cb96d46so13005246wmb.4
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 04:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cq2KukWF+KsQeioiqFW997HD/cOMm/FKc4489TXV8W4=;
 b=v6vpMs1fu+bMsZjizlok9idmysYqq+xgNdcsdDycNTgt+QL9+6OsYnNrLO2ZsezmTF
 WJJiOP+6Y5X7bPAYvc0fnuDvSbo+A89zILdZMcOJd9OyZpykhUM+5ia/olnw+k5v3QbB
 iK4S8J3VAzaVFE7NiBSz6szpJEF5trgZn06DDckNG5u5uE5VBKHpdzXgxVTqMA1l+loh
 ANBDctYeLsNHNXXAyGdaetBrrfsPC8yXzwT0n1vGYv/NDavHBqlURJz4a5uOG+rpXgzo
 OXZGKiO/QY7AbeEqAFRGivAAmuPDOiqNWsFvTCkVIEpqmk4epE32L6SxQuu/MkkASOjq
 Qi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cq2KukWF+KsQeioiqFW997HD/cOMm/FKc4489TXV8W4=;
 b=X2IcDYdh8j7XrBtmJtn6Z4X5FnfnKpJiCs8POsZYXvKohcpxKEhSJjbwtTFzGBV7tW
 T7DubY/J1k2dvchY5hiW8+x6PfyQvozbyOgmJDwaE55x5eJlXz4bZepyh0U88vyoeBeD
 atYCMAkO3v2qoCQhXOdZQkoTz9ZZFfd3mTKmRA+yw9EwaL22lzInmbW9lg9JV7A1toCK
 DnjmozwxBWMOdGgwDaej7wN0R5GOdWwSE6dAOcoIfcjW+nM4tEUYLfuFfS/pNUKz9v/Y
 402qMfJTrf1/fMyIv28hX4YjRVmWe6hRwn88OeNurljqteMAMY9vBBfVVsWicubA640R
 nB6g==
X-Gm-Message-State: AO0yUKULEJUeNjzjyhIFJUrrtSAr0w5Agg/CRXJxYEbh/vM8vXVFuZBx
 RZlYiqxMdrcJ4UCtZegX9LvNxA==
X-Google-Smtp-Source: AK7set9RGYME1dUJtLeH+45kUAB/9Ce3INNjklK9zLqJWa94riqfs0Sulh+pSeRSGMXSn+BkVBTDmw==
X-Received: by 2002:a05:600c:1688:b0:3dc:573c:6601 with SMTP id
 k8-20020a05600c168800b003dc573c6601mr3024206wmn.36.1675772130047; 
 Tue, 07 Feb 2023 04:15:30 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p17-20020a05600c205100b003dd1bd0b915sm15662595wmg.22.2023.02.07.04.15.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 04:15:29 -0800 (PST)
Message-ID: <e4eaad79-f545-9eab-5fa3-8e55a045a2ff@linaro.org>
Date: Tue, 7 Feb 2023 13:15:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] target/arm: Add raw_writes ops for register whose write
 induce TLB maintenance
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, richard.henderson@linaro.org,
 pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20230203171657.2867598-1-eric.auger@redhat.com>
 <CAFEAcA8qz8qsZNsrbbnmvVUgRazsxtGVm59enyU1rf2ZHjx+ow@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8qz8qsZNsrbbnmvVUgRazsxtGVm59enyU1rf2ZHjx+ow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/2/23 19:04, Peter Maydell wrote:
> On Fri, 3 Feb 2023 at 17:17, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> Many registers whose 'cooked' writefns induce TLB maintenance do
>> not have raw_writefn ops defined. If only the writefn ops is set
>> (ie. no raw_writefn is provided), it is assumed the cooked also
>> work as the raw one. For those registers it is not obvious the
>> tlb_flush works on KVM mode so better/safer setting the raw write.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> ---
>>
>> I'am not familiar with those callbacks. I have tested in kvm accelerated
>> mode including migration but I fail to test with TCG. It SIGSEVs for
>> me even without my additions. I am not sure whether the .raw_writefn
>> must be set only for registers only doing some TLB maintenance or
>> shall be set safely on other registers doing TLB maintenance + other
>> state settings.
>> ---
>> @@ -718,16 +718,20 @@ static const ARMCPRegInfo not_v7_cp_reginfo[] = {
>>        * the unified TLB ops but also the dside/iside/inner-shareable variants.
>>        */
>>       { .name = "TLBIALL", .cp = 15, .crn = 8, .crm = CP_ANY,
>> -      .opc1 = CP_ANY, .opc2 = 0, .access = PL1_W, .writefn = tlbiall_write,
>> +      .opc1 = CP_ANY, .opc2 = 0, .access = PL1_W,
>> +      .writefn = tlbiall_write, .raw_writefn = raw_write,
>>         .type = ARM_CP_NO_RAW },
> 
> Anything with type ARM_CP_NO_RAW shouldn't need a .raw_writefn, because
> that type indication says that it's a bug if we ever call
> read_raw_cp_reg() or write_raw_cp_reg() on it. (Specifically,
> for KVM, we should never end up trying to do a raw read/write
> for a state sync because write_list_to_cpustate() and
> write_cpustate_to_list() skip NO_RAW cpregs.)

Ah, this is the check added by commit 375421ccae ("target-arm: Add
checks that cpreg raw accesses are handled"). So this patch shouldn't
pass check-qtest, right?

