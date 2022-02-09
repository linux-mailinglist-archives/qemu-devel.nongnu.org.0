Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7004B0128
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 00:25:41 +0100 (CET)
Received: from localhost ([::1]:33834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHwLF-0004PG-12
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 18:25:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHwF6-0007ab-0M
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 18:19:20 -0500
Received: from [2607:f8b0:4864:20::62e] (port=47097
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHwF0-0001O6-Hz
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 18:19:17 -0500
Received: by mail-pl1-x62e.google.com with SMTP id u12so260872plf.13
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 15:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RH3KaFrhW+1SooyYRBzl+BsyBPOvSC+FE3b17rKX2rU=;
 b=fN+S9DhrknLo0GBByPfXjRfG9V3sSTWlmZ4PhNO0N28yGLTaGs1OBY8tzKSISiUT1e
 Kxr8K1wbf7eyKIkQH9FcPYaAc/Kow5n7gQ2+TkcWM0RzpRKEizS8Qv+1o+pDHnH5Wzk/
 T8w96bxFgiVeNR91PUWduI7A0KT6G3hNI2TZaQPilFEe+5/+RJ0Tj0Di0vNNfqc1eXEa
 oRfmG6mBsGn4CCffXgbLtqq4oQO95pKSIRmNGIsGZvMpR8TUyAYVcOt310Ihj8hQlMJp
 ZDV9dG8KBVMu/+0gy9PHuTh/MhfL4XBaUT5fEyjvqc89ipU8DGyKXd4MpXCttczZNatM
 ZRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RH3KaFrhW+1SooyYRBzl+BsyBPOvSC+FE3b17rKX2rU=;
 b=8IYQz3Q0yWTN1lZLnUbGEWIVSFk0iF89witPxIR8Zt5+ZeKH4Hm5mgKsObAn00H70D
 PKBFMyR439HooUYNumJcblGfdfdyDa4gYXC9ebSqNetgv1JWX9rv2LD8deTTwyksyLWv
 gKyvsDaxLPmLw2rWJ8gLt5JcFmqLc6Vb/dSm/7NxTz7y8cxwcMoT+WV5ZfHJwBRxH4kF
 1UY4R+hdecc2ZIhwSYwaJ0xZypxcTYTs+4kEUtMQYA8eeQo7vP4rxTx7B/4SALQLeD4L
 h95pqiusxGWHlJOkgN437eeKvOmw+Dp7XAot51uco3vb/sS0tXTsRPbwRyf6OIvJT150
 GIQg==
X-Gm-Message-State: AOAM532hZ7misiyeFH9aw18mA//fMugpixhVM+pmcLDONCM5j6iHyKzT
 IvhlFsF9LU8ogZDUNgaMTRkA+A==
X-Google-Smtp-Source: ABdhPJw5pGIUQFm1V9GyMV2yU2takIGGYfveDD0D5QSd25JwGaC2hl2BtRcQOgBlEzFo3ZeFTo8U/w==
X-Received: by 2002:a17:902:b495:: with SMTP id
 y21mr4472516plr.82.1644448739448; 
 Wed, 09 Feb 2022 15:18:59 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id d15sm20484874pfu.127.2022.02.09.15.18.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 15:18:59 -0800 (PST)
Message-ID: <9e1438f9-59a4-3ce4-7c41-832af93acea2@linaro.org>
Date: Thu, 10 Feb 2022 10:18:50 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 12/15] hw/m68k: Restrict M68kCPU type to target/ code
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220209215446.58402-1-f4bug@amsat.org>
 <20220209215446.58402-13-f4bug@amsat.org>
 <8070b23a-7072-58a2-f3dd-fbf5f626674a@linaro.org>
 <40db7e28-2399-9ff5-6d5c-2c61a95a25cf@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <40db7e28-2399-9ff5-6d5c-2c61a95a25cf@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 10:09, Philippe Mathieu-Daudé wrote:
> On 9/2/22 23:50, Richard Henderson wrote:
>> On 2/10/22 08:54, Philippe Mathieu-Daudé wrote:
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>   include/hw/m68k/mcf.h | 3 +--
>>>   target/m68k/cpu-qom.h | 2 --
>>>   target/m68k/cpu.h     | 4 ++--
>>>   3 files changed, 3 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/include/hw/m68k/mcf.h b/include/hw/m68k/mcf.h
>>> index 8cbd587bbf..e84fcfb4ca 100644
>>> --- a/include/hw/m68k/mcf.h
>>> +++ b/include/hw/m68k/mcf.h
>>> @@ -3,7 +3,6 @@
>>>   /* Motorola ColdFire device prototypes.  */
>>>   #include "exec/hwaddr.h"
>>> -#include "target/m68k/cpu-qom.h"
>>>   /* mcf_uart.c */
>>>   uint64_t mcf_uart_read(void *opaque, hwaddr addr,
>>> @@ -16,7 +15,7 @@ void mcf_uart_mm_init(hwaddr base, qemu_irq irq, Chardev *chr);
>>>   /* mcf_intc.c */
>>>   qemu_irq *mcf_intc_init(struct MemoryRegion *sysmem,
>>>                           hwaddr base,
>>> -                        M68kCPU *cpu);
>>> +                        ArchCPU *cpu);
>>>   /* mcf5206.c */
>>>   #define TYPE_MCF5206_MBAR "mcf5206-mbar"
>>
>> This part is ok.
>>
>>> diff --git a/target/m68k/cpu-qom.h b/target/m68k/cpu-qom.h
>>> index c2c0736b3b..ec75adad69 100644
>>> --- a/target/m68k/cpu-qom.h
>>> +++ b/target/m68k/cpu-qom.h
>>> @@ -25,8 +25,6 @@
>>>   #define TYPE_M68K_CPU "m68k-cpu"
>>> -typedef struct ArchCPU M68kCPU;
>>> -
>>>   OBJECT_DECLARE_TYPE(ArchCPU, M68kCPUClass,
>>>                       M68K_CPU)
>>> diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
>>> index 872e8ce637..90be69e714 100644
>>> --- a/target/m68k/cpu.h
>>> +++ b/target/m68k/cpu.h
>>> @@ -156,14 +156,14 @@ typedef struct CPUArchState {
>>>    *
>>>    * A Motorola 68k CPU.
>>>    */
>>> -struct ArchCPU {
>>> +typedef struct ArchCPU {
>>>       /*< private >*/
>>>       CPUState parent_obj;
>>>       /*< public >*/
>>>       CPUNegativeOffsetState neg;
>>>       CPUM68KState env;
>>> -};
>>> +} M68kCPU;
>>
>> I don't like these.  Rationale?
> 
> Short-term idea: hw/ models only have access to cpu-qom.h declarations
> and opaque pointers to generic CPU objects.
> 
> hw/ should not include cpu.h at all. By restricting FooCPU to target/
> code, hw/ files fail to compile if using FooCPU and not ArchCPU.

Yes, that would be ideal.  If you do want to bring the typedef into cpu.h, please keep it 
separate; it's easier to read.  Especially since one normally expects

typedef struct Foo {
   ...
} Foo;

and that's not what's happening here.

> Long-term idea, each target/ is built as a module, exposing an uniform
> arch-API.

That would be awesome, yes.

> I'm still prototyping to see how to disentangle arch-specific hw which
> access CPU internals (such ARM NVIC or MIPS ITU).

Complicated, yes.  If it comes to it, I would not be opposed to having these tightly 
coupled devices live in target/, but let's see if you can avoid it.


r~

