Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 708824B0102
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 00:13:51 +0100 (CET)
Received: from localhost ([::1]:41466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHw9m-0006ST-G3
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 18:13:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHw5b-0003Z9-Ix
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 18:09:31 -0500
Received: from [2607:f8b0:4864:20::431] (port=37654
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHw5Z-0006kS-P9
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 18:09:31 -0500
Received: by mail-pf1-x431.google.com with SMTP id y5so7023507pfe.4
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 15:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0bIvywIdJe4bd1+hl3180jG9jgVY2i1goeACG3MBV3M=;
 b=CsQVRSW9Mv32wFkUi06RV5Q5C6Bddti1km3ItIvWYmQ8IG+nLsVLo9nOAxYyZTKmeb
 NgQ9UERQcwK99x9/4g8Kz/ZYL8FNWwGniDjf0Umncz9lOtY06y/wb89M4oAnXpsGtTce
 5ReXjObzbgKB/Sd3REsSDMtVMJdBgSlqRUcnRR+Q2AIgpQgsXyYXXNagEefAapPXIJSG
 paT/EDDsd9ZRd5tdsF/gSCJms8mhSC61JI91OitWn44EVaEAzm2hhwvhmXcmHi6s7gyQ
 qtRSkQcTxjyIikavrEcuZt0Ak05GiWyHj/WIDMYaomXWPqfZpUhngVSm+FPJlUwmmOS0
 UsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0bIvywIdJe4bd1+hl3180jG9jgVY2i1goeACG3MBV3M=;
 b=59VDr5tbKFW+rmofPdFkwbN8dVMDktkUTeZuPQZFMqdHeJMmB0W34+y4HhKcq2K1US
 GzhHi3iIyMYZBoQDyNGeYqT542YwAT+BW8yZCiTktqT8hgOG8jNeQGQWTXjYARgTWsMV
 B0oOO9xNke3Avf3esWw980NEqP7ytQxYll62dp0uGHvuI80uyAchuTBh2S9xZfY60W6Q
 dfGf8FMq30hWQlvEl9C04igEicBmSsxAcV91t8Mt4c/c0Y5TfOE+KbRFxb/M7sw3fZzI
 p5vM1c8Y/AfIfyPJkmoIvfpL1ekzRw17I1J8/YzKmzm23gAUZAfhxZpFK0lHOPqenNAE
 AmzA==
X-Gm-Message-State: AOAM533GrNDdWnrLx96uGvZiDc+9vjwXpSa8AI0x5sEUkfGv3y/BAF+0
 i6J5bkKSF91zudwtKztT7ZU=
X-Google-Smtp-Source: ABdhPJzmS1B6dniQNX29EIvPEr9+DbBl4DPqzBMmTbl0mBk/GcCT3Yyj/rRPqIXTi1W3NAAUhpoABg==
X-Received: by 2002:a63:e70b:: with SMTP id b11mr3747733pgi.161.1644448157083; 
 Wed, 09 Feb 2022 15:09:17 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id 38sm14934837pgm.37.2022.02.09.15.09.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 15:09:16 -0800 (PST)
Message-ID: <40db7e28-2399-9ff5-6d5c-2c61a95a25cf@amsat.org>
Date: Thu, 10 Feb 2022 00:09:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [RFC PATCH 12/15] hw/m68k: Restrict M68kCPU type to target/ code
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220209215446.58402-1-f4bug@amsat.org>
 <20220209215446.58402-13-f4bug@amsat.org>
 <8070b23a-7072-58a2-f3dd-fbf5f626674a@linaro.org>
In-Reply-To: <8070b23a-7072-58a2-f3dd-fbf5f626674a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 9/2/22 23:50, Richard Henderson wrote:
> On 2/10/22 08:54, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   include/hw/m68k/mcf.h | 3 +--
>>   target/m68k/cpu-qom.h | 2 --
>>   target/m68k/cpu.h     | 4 ++--
>>   3 files changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/hw/m68k/mcf.h b/include/hw/m68k/mcf.h
>> index 8cbd587bbf..e84fcfb4ca 100644
>> --- a/include/hw/m68k/mcf.h
>> +++ b/include/hw/m68k/mcf.h
>> @@ -3,7 +3,6 @@
>>   /* Motorola ColdFire device prototypes.  */
>>   #include "exec/hwaddr.h"
>> -#include "target/m68k/cpu-qom.h"
>>   /* mcf_uart.c */
>>   uint64_t mcf_uart_read(void *opaque, hwaddr addr,
>> @@ -16,7 +15,7 @@ void mcf_uart_mm_init(hwaddr base, qemu_irq irq, 
>> Chardev *chr);
>>   /* mcf_intc.c */
>>   qemu_irq *mcf_intc_init(struct MemoryRegion *sysmem,
>>                           hwaddr base,
>> -                        M68kCPU *cpu);
>> +                        ArchCPU *cpu);
>>   /* mcf5206.c */
>>   #define TYPE_MCF5206_MBAR "mcf5206-mbar"
> 
> This part is ok.
> 
>> diff --git a/target/m68k/cpu-qom.h b/target/m68k/cpu-qom.h
>> index c2c0736b3b..ec75adad69 100644
>> --- a/target/m68k/cpu-qom.h
>> +++ b/target/m68k/cpu-qom.h
>> @@ -25,8 +25,6 @@
>>   #define TYPE_M68K_CPU "m68k-cpu"
>> -typedef struct ArchCPU M68kCPU;
>> -
>>   OBJECT_DECLARE_TYPE(ArchCPU, M68kCPUClass,
>>                       M68K_CPU)
>> diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
>> index 872e8ce637..90be69e714 100644
>> --- a/target/m68k/cpu.h
>> +++ b/target/m68k/cpu.h
>> @@ -156,14 +156,14 @@ typedef struct CPUArchState {
>>    *
>>    * A Motorola 68k CPU.
>>    */
>> -struct ArchCPU {
>> +typedef struct ArchCPU {
>>       /*< private >*/
>>       CPUState parent_obj;
>>       /*< public >*/
>>       CPUNegativeOffsetState neg;
>>       CPUM68KState env;
>> -};
>> +} M68kCPU;
> 
> I don't like these.  Rationale?

Short-term idea: hw/ models only have access to cpu-qom.h declarations
and opaque pointers to generic CPU objects.

hw/ should not include cpu.h at all. By restricting FooCPU to target/
code, hw/ files fail to compile if using FooCPU and not ArchCPU.


Long-term idea, each target/ is built as a module, exposing an uniform
arch-API.

I'm still prototyping to see how to disentangle arch-specific hw which
access CPU internals (such ARM NVIC or MIPS ITU).

