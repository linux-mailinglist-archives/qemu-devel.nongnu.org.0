Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D5A380F39
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:48:37 +0200 (CEST)
Received: from localhost ([::1]:55338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbvQ-0001ih-P1
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhbVN-0005yO-Cy
 for qemu-devel@nongnu.org; Fri, 14 May 2021 13:21:42 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:46708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhbVG-0002tD-Cw
 for qemu-devel@nongnu.org; Fri, 14 May 2021 13:21:41 -0400
Received: by mail-qk1-x72b.google.com with SMTP id 76so29389185qkn.13
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 10:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p101JPvnV3TE0rg3qeFEVqnAXcwWkum3wrKOQSta5TA=;
 b=XwqrxWGTRsXCe+LBhw7SUEfuV3ul/XjxxukeXFK2Od5G9ycj79iQ0OUXHcVmltegRx
 /4Zg8BViBgu31RLASyq1aaxrKQISXlyjs8Z1ldXoiQJYMj44oJOrc7jHDKfhQsfc161H
 xvyd0WTKSOHQXKZEvfJ2XSB2qykhn4AexoG2EfXoqQOC7UYaWf7U/61p+4kwrfCZgkgj
 gcDK0vKCC+J1aLRK7AUOJJqo+HVIR7nXshizjvXYXGgNbMvxjatLt4rax8KulKhvQhpY
 vMOQgZpI9MrZN3EZfW6vKGTqsQXJnUfgicyhrjVl5RyDNQ7YnhL84D4Ev0tQ5/xIKuie
 tY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p101JPvnV3TE0rg3qeFEVqnAXcwWkum3wrKOQSta5TA=;
 b=tSaiWAjqOXvNaQ2RyutEuIiXI6H5KuoeDNGCmw9l/OnpK0V8kEj13RS62AX9htLjh2
 reCuq4dLtYxs0r8APBrqAEocbqYDPcyjC6MmHHPIpTMxNyx6/ra7NcsOb7z/3JCKZ3FG
 QLVE1XiOz4nAkjG9grlU3nb5feEsmHZKnumeR5fOCq9HQjUl0R3vMK9VvHFwpCtvRc8r
 FR3qzDgX7jC5RgUv1E9PPAskZdqbN64bGQT4Z7aJs39QXTTUZYrR3xrWpw3k/JEsLO3C
 gclun/P3ljnC6L8PrpEhzyyUzMCb/Ht8rMjMwLkdXB7PYSw0zOWyGf7WzGRAWyAEvryn
 4xzA==
X-Gm-Message-State: AOAM530aqhgkuL4sSQk1qKDv1pF/JD+zUqtXs2tJ1cg3NLLqqwGJn+on
 TuaLY6npc2jspKWxdC6fKdqgXw==
X-Google-Smtp-Source: ABdhPJyih81Ozp4Anvmw/7WmlcJwwtFvhAGOx76m8eEWx/Rn0BxopVmjXlPxdjSiEYials8p3Ot1Ew==
X-Received: by 2002:a37:a5d7:: with SMTP id o206mr8956632qke.360.1621012890985; 
 Fri, 14 May 2021 10:21:30 -0700 (PDT)
Received: from [192.168.183.76] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id r72sm5382166qka.18.2021.05.14.10.21.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 10:21:30 -0700 (PDT)
Subject: Re: [PATCH v6 82/82] target/arm: Enable SVE2 and related extensions
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-83-richard.henderson@linaro.org>
 <CAFEAcA8Fic1AfAmsAavzHzsK7aXkNEC8DfTbsa3Krga66KtAdg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e951d14b-0258-8013-d33b-3bd34588a5b7@linaro.org>
Date: Fri, 14 May 2021 12:21:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Fic1AfAmsAavzHzsK7aXkNEC8DfTbsa3Krga66KtAdg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/21 2:35 PM, Peter Maydell wrote:
> On Fri, 30 Apr 2021 at 22:37, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/cpu.c   |  1 +
>>   target/arm/cpu64.c | 13 +++++++++++++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 0dd623e590..30fd5d5ff7 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -1464,6 +1464,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>>
>>           u = cpu->isar.id_isar6;
>>           u = FIELD_DP32(u, ID_ISAR6, JSCVT, 0);
>> +        u = FIELD_DP32(u, ID_ISAR6, I8MM, 0);
>>           cpu->isar.id_isar6 = u;
>>
>>           u = cpu->isar.mvfr0;
>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>> index f0a9e968c9..379f90fab8 100644
>> --- a/target/arm/cpu64.c
>> +++ b/target/arm/cpu64.c
>> @@ -662,6 +662,7 @@ static void aarch64_max_initfn(Object *obj)
>>           t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
>>           t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
>>           t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2); /* ARMv8.4-RCPC */
>> +        t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);
>>           cpu->isar.id_aa64isar1 = t;
>>
>>           t = cpu->isar.id_aa64pfr0;
>> @@ -702,6 +703,17 @@ static void aarch64_max_initfn(Object *obj)
>>           t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
>>           cpu->isar.id_aa64mmfr2 = t;
>>
>> +        t = cpu->isar.id_aa64zfr0;
>> +        t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
>> +        t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);  /* PMULL */
>> +        t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);
>> +        t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);
>> +        t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);
>> +        t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);
>> +        t = FIELD_DP64(t, ID_AA64ZFR0, F32MM, 1);
>> +        t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);
>> +        cpu->isar.id_aa64zfr0 = t;
>> +
>>           /* Replicate the same data to the 32-bit id registers.  */
>>           u = cpu->isar.id_isar5;
>>           u = FIELD_DP32(u, ID_ISAR5, AES, 2); /* AES + PMULL */
>> @@ -718,6 +730,7 @@ static void aarch64_max_initfn(Object *obj)
>>           u = FIELD_DP32(u, ID_ISAR6, FHM, 1);
>>           u = FIELD_DP32(u, ID_ISAR6, SB, 1);
>>           u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
>> +        u = FIELD_DP32(u, ID_ISAR6, I8MM, 1);
>>           cpu->isar.id_isar6 = u;
>>
>>           u = cpu->isar.id_pfr0;
> 
> Do we need to clear any of these in the "user set has_neon and/or
> has_vfp to false" code in arm_cpu_realizefn() ?

Oh, hmm, yes.  Indeed, I guess we need to disable SVE as well?

I also see that ID_ISAR6.I8MM is currently handled by !has_vfp, but it's really 
an AdvSIMD aka has_neon feature.


r~

