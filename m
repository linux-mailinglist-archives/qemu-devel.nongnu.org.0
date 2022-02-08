Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C864AD863
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 13:37:10 +0100 (CET)
Received: from localhost ([::1]:39488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHPk5-0005Mr-1M
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 07:37:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHOVm-0005Km-56
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:18:18 -0500
Received: from [2607:f8b0:4864:20::431] (port=46842
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHOVe-0006pB-2M
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:18:15 -0500
Received: by mail-pf1-x431.google.com with SMTP id i17so18270452pfq.13
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LJ3pToF2W7O4ZGhlq++wkOZYyz8fYW9xzgXhiZUPGYM=;
 b=EHGtuiNAAwBMFZzLTCUlwascpUiVRY+N5hwwLu1roSsICF9vjgQLukp8Qa9Q3Z/xXp
 e6fnPev1Yvz9xYQm4xiPHxntTdeqoq6LT8/Z9UiKH0TVjWQUxlvQ3Qo02aOcvZ/eIg8t
 /VjBdoHzzCOFta2JoY9/Homhu+PxXRjusVippcYZJfnEnOadteluzDudzpv7aKjtXARr
 rfKf+3HnDMfdEsunAoyYMyRhAjVIMgQPWPb/8NwPLhBfoAUkYl7px0v9epj4+7GB0DL0
 2WqhPxl1Qtvy1kkMdJYAiDLVn0GN4lrq+IZo7eGrTt/9ExWYYfqk7ZIWAHRz7/CvJzdo
 T9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LJ3pToF2W7O4ZGhlq++wkOZYyz8fYW9xzgXhiZUPGYM=;
 b=BnXUQJjm4nMMHlagNT1q3L6GXNlRLO26ve8bK+MEKb4mn/XLbY96Ai1oLFZhzkcBSd
 O+lfd/O/Ci15tEdBkThHmkZZ7cSZQc0O3/ulndCVD42SZQN/kLKhX3QBjrrNOAOqEuN1
 iGm+HTO01LCuZpJBrlIYDqX63Pz/TP2fmz/zPToEkLRGiol59x3J1als1reC8H4kG5kD
 Hl4R9kc7vmlUYnrDxOJ+ieNejFwIiux7bBND4eHTlS7JQsoy+2oTKdW6e6qyDYU/UHhS
 mnmLhbZbHikIOSJ44BunjQq+f2i4zRSfaITbxiHfY9lVWyXi4X6E6+nSJ8Z/S0ZO/Lvn
 M12w==
X-Gm-Message-State: AOAM533Ofda+BcY1RwBnIbgHJ53Sr6H5GLu3I0u0gunZbQVWrOEpbjGV
 uTgG8uT4kQOGrc2ycdXV2S87lg==
X-Google-Smtp-Source: ABdhPJzCDiis5ggBUP5GPuArWxk91YyIhTEAyfxIeUZuQcFNiosGEtah/2F2SGiT9zqVy7y7nyE0Jw==
X-Received: by 2002:a63:d943:: with SMTP id e3mr3104614pgj.427.1644319077268; 
 Tue, 08 Feb 2022 03:17:57 -0800 (PST)
Received: from [192.168.1.118] (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id f3sm16197240pfe.67.2022.02.08.03.17.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 03:17:56 -0800 (PST)
Message-ID: <16d22c7c-a81c-9a65-3d46-12ff19d89229@linaro.org>
Date: Tue, 8 Feb 2022 22:17:52 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/5] linux-user: Introduce host_signal_mask
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220208071237.319844-1-richard.henderson@linaro.org>
 <20220208071237.319844-3-richard.henderson@linaro.org>
 <CAFEAcA-Sy8wvO2h1tjNwPcK6j2Tfz-gGY2YTCeQZQEB_1jd=qg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-Sy8wvO2h1tjNwPcK6j2Tfz-gGY2YTCeQZQEB_1jd=qg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: qemu-devel@nongnu.org, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/22 21:59, Peter Maydell wrote:
> On Tue, 8 Feb 2022 at 08:03, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Do not directly access the uc_sigmask member.
>> This is preparation for a sparc64 fix.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   linux-user/include/host/aarch64/host-signal.h  |  5 +++++
>>   linux-user/include/host/alpha/host-signal.h    |  5 +++++
>>   linux-user/include/host/arm/host-signal.h      |  5 +++++
>>   linux-user/include/host/i386/host-signal.h     |  5 +++++
>>   .../include/host/loongarch64/host-signal.h     |  5 +++++
>>   linux-user/include/host/mips/host-signal.h     |  5 +++++
>>   linux-user/include/host/ppc/host-signal.h      |  5 +++++
>>   linux-user/include/host/riscv/host-signal.h    |  5 +++++
>>   linux-user/include/host/s390/host-signal.h     |  5 +++++
>>   linux-user/include/host/sparc/host-signal.h    |  5 +++++
>>   linux-user/include/host/x86_64/host-signal.h   |  5 +++++
>>   linux-user/signal.c                            | 18 ++++++++----------
>>   12 files changed, 63 insertions(+), 10 deletions(-)
>>
>> diff --git a/linux-user/include/host/aarch64/host-signal.h b/linux-user/include/host/aarch64/host-signal.h
>> index 9770b36dc1..76ab078069 100644
>> --- a/linux-user/include/host/aarch64/host-signal.h
>> +++ b/linux-user/include/host/aarch64/host-signal.h
>> @@ -40,6 +40,11 @@ static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
>>       uc->uc_mcontext.pc = pc;
>>   }
>>
>> +static inline void *host_signal_mask(ucontext_t *uc)
>> +{
>> +    return &uc->uc_sigmask;
>> +}
> 
> Why void* rather than sigset_t* ?

Because it's not really a sigset_t, even when it is in ucontext_t.
It's a kernel_sigset_t, as per the comment in host_signal_handler.

When it comes to sparc64 in the last patch, the glibc type will turn out to be unsigned long.

Got a better suggestion?


r~

