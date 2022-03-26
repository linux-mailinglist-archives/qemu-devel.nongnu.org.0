Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2254E815F
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 15:15:40 +0100 (CET)
Received: from localhost ([::1]:53608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY7Cd-0002dm-EM
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 10:15:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6do-0005XY-Mk
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:39:40 -0400
Received: from [2001:4860:4864:20::35] (port=39864
 helo=mail-oa1-x35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6dn-0007A4-6R
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:39:40 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-deb9295679so3498192fac.6
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pM2qPAZ8ipi3gSrxAcFlsDxZH77KJ7MD+Yu/W9tg1ho=;
 b=oMcfdaBKr+d6cEZl6mRNbR+8Vzfihw2eYXMOEW1YT9fZfW9H89RMDSMP2XmLZpKR7W
 wnyErEaX7QkPRcu+VuYZuViE/PTTgytSY0m9NzwlJx5v+mrGYOe35D6MPzSpkiv8d4S6
 4/QIu+/UCBYlNBvk0hdCCzC6TedQZIhIOZpDit3r0PrgKJUyM2HCdWYfR1GezzCWQUbp
 xO6fInS5gGEbqLzH+QcjC5KRcYfzBka4/7inccznOkN03DMn9jPM1K0ycUjjLIZ7IP88
 EelHzXoBg9cOtmb3T1mxJFQzYOKHCX1gbL4hs2/fDMMQm2abwhRBylzuVgRBmaWr/G+2
 sINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pM2qPAZ8ipi3gSrxAcFlsDxZH77KJ7MD+Yu/W9tg1ho=;
 b=o71OO+xDqPoMqx6FOFxcnw+Hm6jJnMo5JjCBWBVL05Evd7vfWq4ThAmf+jI8rNSs/E
 SfK7KiYw6YU80HNNaNvwWoSQRKSzWatNGQ52kb7Zr0q+TrJ72lGRLzzH1as+BndhF0yH
 loS4b/WneP18DbiwcO0rZZ37lLX9rqFEWWaUfXAD+HlrK/PaTbURD6IfMJrLQIS40Ok2
 /DDfUUxm4J2agVhZ4p8g7QIAZcmPHaC58mO4pTwMMeBT5iuOWnqYW4vfPsMOe4mvIIMe
 HNqXaUWL3396kGOO1WQB9aBamCPfxK/up86nF7q2kvoEJqLUF/yh2z+AXQe+Zb0IQKp7
 Fykw==
X-Gm-Message-State: AOAM533NYvfmDx2jnWfKyQvx/6fN6tEKLAT74xKK9eHEvblibxgit1sF
 6+Mou+lCDIOMUiPMkD8MvWKa0g==
X-Google-Smtp-Source: ABdhPJxPxlfDtYTnrX1s8qf/Os15930YJ1rpn6rKzXhjQm3EXF/o7RRpFiAiZ7iknYxwn08F4pUDiw==
X-Received: by 2002:a05:6870:611e:b0:de:d210:9d2f with SMTP id
 s30-20020a056870611e00b000ded2109d2fmr1035112oae.141.1648301978123; 
 Sat, 26 Mar 2022 06:39:38 -0700 (PDT)
Received: from [172.24.8.129] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 12-20020a05687012cc00b000de97cc1beesm3044751oam.43.2022.03.26.06.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Mar 2022 06:39:37 -0700 (PDT)
Message-ID: <f0c9e8dd-4291-e3a0-71dd-639c538ff701@linaro.org>
Date: Sat, 26 Mar 2022 07:39:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/8] linux-user/nios2: Hoist pc advance to the top of
 EXCP_TRAP
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220325195250.386071-1-richard.henderson@linaro.org>
 <20220325195250.386071-2-richard.henderson@linaro.org>
 <CAFEAcA8gOoqMqQKMSVJsK5b1LB-5XMWYcyMfLtePK1TGnDkf2g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8gOoqMqQKMSVJsK5b1LB-5XMWYcyMfLtePK1TGnDkf2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::35
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x35.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 3/26/22 06:50, Peter Maydell wrote:
> On Fri, 25 Mar 2022 at 19:52, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Note that this advance *should* be done by the translator, as
>> that's the pc value that's supposed to be generated by hardware.
>> However, that's a much larger change across sysemu as well.
>>
>> In the meantime, produce the correct PC for any signals raised
>> by the trap instruction.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   linux-user/nios2/cpu_loop.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
>> index 1e93ef34e6..2768ae61dd 100644
>> --- a/linux-user/nios2/cpu_loop.c
>> +++ b/linux-user/nios2/cpu_loop.c
>> @@ -40,6 +40,12 @@ void cpu_loop(CPUNios2State *env)
>>               break;
>>
>>           case EXCP_TRAP:
>> +            /*
>> +             * TODO: This advance should be done in the translator, as
>> +             * hardware produces an advanced pc as part of all exceptions.
>> +             */
>> +            env->regs[R_PC] += 4;
>> +
> 
> You need to rewind again for the TRAP_BRKPT case, as the
> kernel does fp->ea -= 4 in breakpoint_c().

Yep, thanks.


r~

