Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 898D54FC6E3
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 23:43:31 +0200 (CEST)
Received: from localhost ([::1]:46520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne1oo-0002SL-6O
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 17:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne1nh-0001XO-Os
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 17:42:21 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:40571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne1nf-0001Va-N8
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 17:42:21 -0400
Received: by mail-pf1-x430.google.com with SMTP id a42so9183887pfx.7
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 14:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NqsKIaMi5XfKg5n63c7gIxAq7yGOfhDRZoR8J7UOhXA=;
 b=FxP/IFcHA/zOCguX2Qesjr5Jg6+oh7Fd+A8WRI+PKPLDCmKlDvcO6/H/kmWwesrcp2
 e5W1ZqcT5q1FnAdxAOAQCKkkRs0RD+Tvbd4UH95zXP2pI6kpGmnKq0imKcFQkY4y93Ny
 mzw3gEnn7R1yst0EphWInPukKiKqDHESjr9MafWISz4uwjnDRYwkAKCl6pPLGHztM1tY
 SzrUNcieXZsmW1pKCWc0otB4rsIrlkqNNGvzAPhKMgZQHclVzuJbnqkLJ/CEBmX4r1ip
 hwiCX8WCwMPa5aZdWO81IsXXWduFrZ6VQREohiB5q1/QjsOfdhf4+TreYexYHquA02Sf
 UkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NqsKIaMi5XfKg5n63c7gIxAq7yGOfhDRZoR8J7UOhXA=;
 b=Bmk4mrkKYb905ZApZxHMnnxUehQ+NmE1px6hil4Yos1N4V48hJc9JuOi3R/dYUDG81
 EM9EZ21JCLjUzZelb+bdxuG3jL8WfNHLPh4W/wm2/KA9FuRztYL9t27mXJhokKxQ5Op/
 btoijfzU4mzZgUNlg87FBCR8i7jBAKqL7mDYJQ1nE94owgBfHRPUUYtQjvtsshV0MDLK
 EsL5QQ4rlcL+ZwNO/Vpz1XzbsamThH+AEo6uhezSYe7kJL78mGWjWcmeJxb9FwNBF9Og
 iNS07wP7B/9jtNdZtUF+SZZ1K2c7mFPap/h0O21v84l8mzidJ+yjq7TjjaRZqakR7Ijd
 yT/Q==
X-Gm-Message-State: AOAM531pItI0WdAQxLBrgddzvkFcooSZ5Dl1ghK6MardllTq16fK42Rm
 7mpZ1jV0zfFwBAN1rYOu0vfJ8g==
X-Google-Smtp-Source: ABdhPJxNyd+vs6ohpirOxBa8qtjrfEfrfi1Zm9p/o8ZN3LQ+EV6qj3qBBvs/eFhiBAET5C5+XTtr8w==
X-Received: by 2002:a63:69c7:0:b0:380:afc8:33be with SMTP id
 e190-20020a6369c7000000b00380afc833bemr27467886pgc.304.1649713338145; 
 Mon, 11 Apr 2022 14:42:18 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 s26-20020a65645a000000b0039cc7a70728sm656468pgv.5.2022.04.11.14.42.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 14:42:17 -0700 (PDT)
Message-ID: <a3846249-5be1-c72d-f871-289964f05754@linaro.org>
Date: Mon, 11 Apr 2022 14:42:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 13/16] target/arm: Implement virtual SError exceptions
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-14-richard.henderson@linaro.org>
 <CAFEAcA_-cbZWF2KxZinSK=z88frNAmiJoj7u-kydtUgQiucFHg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_-cbZWF2KxZinSK=z88frNAmiJoj7u-kydtUgQiucFHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/11/22 09:32, Peter Maydell wrote:
> On Sat, 9 Apr 2022 at 01:11, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Virtual SError exceptions are raised by setting HCR_EL2.VSE,
>> and are routed to EL1 just like other virtual exceptions.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> @@ -10041,6 +10048,20 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
>>           mask = CPSR_A | CPSR_I | CPSR_F;
>>           offset = 4;
>>           break;
>> +    case EXCP_VSERR:
>> +        {
>> +            /* Construct the SError syndrome from AET and ExT fields. */
>> +            ARMMMUFaultInfo fi = { .type = ARMFault_AsyncExternal, };
>> +            env->exception.fsr = arm_fi_to_sfsc(&fi);
>> +            env->exception.fsr |= env->cp15.vsesr_el2 & 0xd000;
>> +            A32_BANKED_CURRENT_REG_SET(env, dfsr, env->exception.fsr);
>> +
>> +            new_mode = ARM_CPU_MODE_ABT;
>> +            addr = 0x10;
>> +            mask = CPSR_A | CPSR_I;
>> +            offset = 8;
>> +        }
>> +        break;
>>       case EXCP_SMC:
> 
> Having looked at the following patch I came back to the AArch32 handling
> of taking an SError in this patch...
> 
> (1) I think you need to look at TTBCR.EAE in the usual way to
> decide whether to report the FSR in long-descriptor or
> short-descriptor format

Yes, I've reread AArch32.TakeVirtualSErrorException() and you're right -- 
AArch32.ReportDataAbort() examines EAE.

> (2) maybe log the FSR value, the way we do for prefetch and
> data aborts ?
> (3) maybe mention that this is reported like a data abort but that
> the DFAR has an unknown value ?

Yes to all.


r~

