Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A8864862E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 17:06:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3fsw-0004yZ-K3; Fri, 09 Dec 2022 11:06:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3fst-0004yH-UO
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 11:06:00 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3fss-0000vi-Dj
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 11:05:59 -0500
Received: by mail-wr1-x429.google.com with SMTP id o5so5681756wrm.1
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 08:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=64DlQqu1aJlALuYGEdu8KZlq4Z8PzM+oiLhCX60kh7I=;
 b=cR39Yqr3QWzRnRf9He6wn5cAsrN6vODhlCuy7bUDfp46eHVYHvPhqASK87UIUkcgIJ
 cPKzmtR6kOA+Y6UGiZ+gr/zq7oqbZUg+UClc4ETX2VVF9LBqaPEwQot8LWAKR0bq1STB
 xhoY+Znln3LFv4XqxW5KkntovQHmyzVM8Kiyd+W8JCpVN+u2PhlGSQUnz5YVl4+3ijn+
 e+azPwxQOjUBEEp1yo4w+xyOWmEw6mMyK1yZHsnzY9yUgJWD4FjxaMnvyTDu5JeFa+s3
 wJDv5UbLn00IrjS1qsuTubE42V+8JDt1mXVi8vXHZ1G7c9lIOkQiCN6dYrB7roq5pNiI
 lQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=64DlQqu1aJlALuYGEdu8KZlq4Z8PzM+oiLhCX60kh7I=;
 b=YOh+IBHHFT5J+tRG/hiipx+xYx3QvhQAodlPmF125lNDZJw4Qr7uDnmFncw8KdAHfR
 XCRPfM/YUsMRH/lEFcPot2d3oc3Sv5QabK4tjs6cm1G6Ou2sBv5wlFAGtKjRd6MCwNXp
 d39V8HDQdk3MHWwSF9osmR7hXq+xb3xrCYAL3oEwM/U2PhgXrWGlz/vdUHXTL8zPnbgg
 iefzW4gr27sFB6bAXX5gex/vX3JCd//xsfefPT2PiC/F7yfGccnFXTK+Tr8YBKyN/dzO
 EFekGjKNxT1vktP4ZIj7rtieXVq31bUXR6TddiOLsV4BoTFy2Fo9hedo4fD/ps524ZYA
 CE8Q==
X-Gm-Message-State: ANoB5pn1fw5D4jiQS7wzpi+8tadWb3QDuonBuw7AEU7jkrJZRZLg+pxw
 SXhnktiTJjUdEYFMjD0G9oQmNA==
X-Google-Smtp-Source: AA0mqf63VZrSCr8xHOsGl2Oo8KWQ/jiWeiTegMvReO+/JM8u2XuWvdhoe7X5PHEUe0U6hzI4w6keRg==
X-Received: by 2002:adf:ec4d:0:b0:242:52b6:9054 with SMTP id
 w13-20020adfec4d000000b0024252b69054mr4355340wrn.58.1670601956726; 
 Fri, 09 Dec 2022 08:05:56 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o19-20020a5d58d3000000b002421a8f4fa6sm1648872wrf.92.2022.12.09.08.05.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 08:05:56 -0800 (PST)
Message-ID: <a11c515a-49a0-c4a5-a0a5-e559170cf7f6@linaro.org>
Date: Fri, 9 Dec 2022 17:05:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [RFC PATCH-for-8.0] target/arm: Keep "internals.h" internal to
 target/arm/
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
References: <20221209111736.59796-1-philmd@linaro.org>
 <5f838c11-765b-72a3-0d40-5dd46994fd8e@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <5f838c11-765b-72a3-0d40-5dd46994fd8e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.288,
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

On 9/12/22 16:19, Richard Henderson wrote:
> On 12/9/22 05:17, Philippe Mathieu-Daudé wrote:
>> +++ b/target/arm/machine.c
>> @@ -6,6 +6,45 @@
>>   #include "internals.h"
>>   #include "migration/cpu.h"
>> +/* This mapping is common between ID_AA64MMFR0.PARANGE and 
>> TCR_ELx.{I}PS. */
>> +static const uint8_t pamax_map[] = {
>> +    [0] = 32,
>> +    [1] = 36,
>> +    [2] = 40,
>> +    [3] = 42,
>> +    [4] = 44,
>> +    [5] = 48,
>> +    [6] = 52,
>> +};
> ...
>> +++ b/target/arm/ptw.c
>> @@ -42,45 +42,6 @@ static bool get_phys_addr_with_struct(CPUARMState 
>> *env, S1Translate *ptw,
>>                                         ARMMMUFaultInfo *fi)
>>       __attribute__((nonnull));
>> -/* This mapping is common between ID_AA64MMFR0.PARANGE and 
>> TCR_ELx.{I}PS. */
>> -static const uint8_t pamax_map[] = {
>> -    [0] = 32,
>> -    [1] = 36,
>> -    [2] = 40,
>> -    [3] = 42,
>> -    [4] = 44,
>> -    [5] = 48,
>> -    [6] = 52,
>> -};
> 
> How does this even compile with the remaining usage of pamax_map in 
> get_phys_addr_lpae?

It does not :( I rebased 62 patches then tried to extract/post unrelated
patches like this one, but didn't build at each step and failed to
realize the broken rebase, *sigh*. Sorry.

