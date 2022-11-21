Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B1C63309F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 00:16:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxG0C-0006kV-IK; Mon, 21 Nov 2022 18:15:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxG09-0006iM-IE
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 18:14:57 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxG07-0001Rg-Vw
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 18:14:57 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 r205-20020a1c44d6000000b003d0283bf132so234826wma.4
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 15:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rhvso5qt9WAXy17eEaxk7R4qHfUkjk+SBDCcOad9rN8=;
 b=qs3rok+SW8+ae+IWIRIWLieYDHaCThNOybVpPOAPDGLHEp7like279qaDKH4brNj8+
 sBfwjg62igYWHvWl3Q7Epy6BUby+obwGFLq24YMg9ZveAj0C9LygRCVU9SYEPH6x59Y7
 R58NMqAGt4aPZwxGlra0ISscGBG3NlmGVAHnuOzfheXvYz3iKYoRvvutQRjP+XPJOBQk
 jmaTb8GcgLGXsKkIfUcdVZxkzdN1BPip03Robi8MHW8+mBXu0xrYr9fg0+bBCpJfQRn1
 VMfy1+qeVLFeNQJdOFfJqahb70kl8D7fuS7mOqoczHlegNO4L9n0IpK6PiSRs9nzjArd
 Ehng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rhvso5qt9WAXy17eEaxk7R4qHfUkjk+SBDCcOad9rN8=;
 b=TQJkncY1bqPx/2xWtT9SrBxbVpywG6vl9ljU+rMpM+kO7m2iyd5tsPcMWKeOpIzZgD
 2V/JsmxlKMJfrqhuMuNWOKWFHP2tBQxNwAkTin/TqlpdnqJnSLoBogDn4VKLtekePlV0
 HfSjhl9CjPiCj7jfhV/f/JCvH5HJg3fQFpNtNBs8P4+d29kaKoeQos6qNTcnzxMq1EPH
 ZbzGdjo3RiD4Pv20GtRJx3x78in8Z/9UTsmyib8AAsLj8hrQ3S0mKHVvjluxnjU9D9Ol
 Jr6mAMXCSLGUXGCIvWcsUgjylYwXHOvbdRmLPRULZnElscolGgXSxbNmmWTbVWZrNcJ1
 JCSQ==
X-Gm-Message-State: ANoB5pnKDaCTEsW5PcmVK+w4OF9/5R/Zgwh8Yu7FTM2IZWzmkQr+iPi/
 pmStwrpLiqcWV048DPflv+Gabh6k/zdftg==
X-Google-Smtp-Source: AA0mqf5nVogcmQMM4uuyRMIIAxNYuCRw6XCtEld+pw5YKDiQCjR0qYV8LGGAM6N2hXkq3wTAoidgtA==
X-Received: by 2002:a05:600c:54e4:b0:3c6:d39c:fc4b with SMTP id
 jb4-20020a05600c54e400b003c6d39cfc4bmr3197850wmb.14.1669072493751; 
 Mon, 21 Nov 2022 15:14:53 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c444b00b003b95ed78275sm16156095wmn.20.2022.11.21.15.14.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 15:14:53 -0800 (PST)
Message-ID: <7cb6d0ab-c44e-9279-f1e0-db3e449ba595@linaro.org>
Date: Tue, 22 Nov 2022 00:14:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 17/29] tcg/aarch64: Add have_lse, have_lse2
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221118094754.242910-1-richard.henderson@linaro.org>
 <20221118094754.242910-18-richard.henderson@linaro.org>
 <1708fd03-d7ab-99f0-2c7d-25f582dac6ea@linaro.org>
In-Reply-To: <1708fd03-d7ab-99f0-2c7d-25f582dac6ea@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/11/22 00:10, Philippe Mathieu-Daudé wrote:
> On 18/11/22 10:47, Richard Henderson wrote:
>> Notice when the host has additional atomic instructions.
>> The new variables will also be used in generated code.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/aarch64/tcg-target.h     |  3 +++
>>   tcg/aarch64/tcg-target.c.inc | 10 ++++++++++
>>   2 files changed, 13 insertions(+)
> 
> 
>> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
>> index 001a71bbc0..cf5ee6f742 100644
>> --- a/tcg/aarch64/tcg-target.c.inc
>> +++ b/tcg/aarch64/tcg-target.c.inc
>> @@ -13,6 +13,8 @@
>>   #include "../tcg-ldst.c.inc"
>>   #include "../tcg-pool.c.inc"
>>   #include "qemu/bitops.h"
>> +#include <asm/hwcap.h>
> 
> This doesn't build on Darwin:

Project version: 7.1.91
C compiler for the host machine: clang (clang 14.0.0 "Apple clang 
version 14.0.0 (clang-1400.0.29.102)")
C linker for the host machine: clang ld64 819.6
Host machine cpu family: aarch64
Host machine cpu: arm64

> In file included from ../../tcg/tcg.c:426:
> tcg/aarch64/tcg-target.c.inc:16:10: fatal error: 'asm/hwcap.h' file not 
> found
> #include <asm/hwcap.h>
>           ^~~~~~~~~~~~~
> 
> In file included from ../../accel/tcg/cputlb.c:1656:
> ../../accel/tcg/ldst_atomicity.c.inc:269:21: warning: value size does 
> not match register size specified by the constraint and modifier 
> [-Wasm-operand-widths]
>              : "=&r"(r.u), "=&r"(fail) : "Q"(*p));
>                      ^

