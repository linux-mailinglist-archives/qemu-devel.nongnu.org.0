Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4191BC5DF
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Apr 2020 18:55:42 +0200 (CEST)
Received: from localhost ([::1]:39890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTTWH-00031T-2g
	for lists+qemu-devel@lfdr.de; Tue, 28 Apr 2020 12:55:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36136)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frederic.konrad@adacore.com>) id 1jTTQV-0001nz-Qc
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 12:54:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <frederic.konrad@adacore.com>) id 1jTTNT-00035K-Mo
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 12:49:43 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:35085
 helo=smtp.eu.adacore.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frederic.konrad@adacore.com>)
 id 1jTTNT-000352-12
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 12:46:35 -0400
Received: from localhost (localhost [127.0.0.1])
 by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 3A33C81343;
 Tue, 28 Apr 2020 18:46:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
 by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FEMKetqo0yzW; Tue, 28 Apr 2020 18:46:33 +0200 (CEST)
Received: from localhost.localdomain (lfbn-tou-1-1471-22.w90-89.abo.wanadoo.fr
 [90.89.4.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.eu.adacore.com (Postfix) with ESMTPSA id E0EEE81368;
 Tue, 28 Apr 2020 18:46:32 +0200 (CEST)
Subject: Re: [PATCH v1] target/m68k: fix gdb for m68xxx
To: Laurent Vivier <laurent@vivier.eu>
References: <1587391275-12748-1-git-send-email-frederic.konrad@adacore.com>
 <41ff1564-36ee-1028-b377-9bf9a82de689@vivier.eu>
 <99b80245-4109-03c4-4c7c-e562477ec76b@adacore.com>
 <e506659a-6d0b-dc62-2ba4-00a55579b084@vivier.eu>
From: KONRAD Frederic <frederic.konrad@adacore.com>
Message-ID: <be07f5e0-659d-b5c4-b500-974d765392bb@adacore.com>
Date: Tue, 28 Apr 2020 18:46:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e506659a-6d0b-dc62-2ba4-00a55579b084@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=194.98.77.210;
 envelope-from=frederic.konrad@adacore.com; helo=smtp.eu.adacore.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/28 12:46:33
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Received-From: 194.98.77.210
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
Cc: huth@tuxfamily.org, alex.bennee@linaro.org, f4bug@amsat.org,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 pierre@freepascal.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Le 4/28/20 à 4:13 PM, Laurent Vivier a écrit :
> Le 28/04/2020 à 15:19, KONRAD Frederic a écrit :
>>
>>
>> Le 4/27/20 à 9:53 AM, Laurent Vivier a écrit :
>>> Le 20/04/2020 à 16:01, frederic.konrad@adacore.com a écrit :
>>>> From: KONRAD Frederic <frederic.konrad@adacore.com>
> ...
>>> I would prefer to have two macros with no class parameter, something
>>> like DEFINE_M68K_CPU_TYPE_M68K() and DEFINE_M68K_CPU_TYPE_CF().
>>>
>>>>    #define DEFINE_M68K_CPU_TYPE(cpu_model, initfn) \
>>>>        {                                           \
>>>>            .name = M68K_CPU_TYPE_NAME(cpu_model),  \
>>>> @@ -314,11 +329,16 @@ static const TypeInfo m68k_cpus_type_infos[] = {
>>>>            .class_size = sizeof(M68kCPUClass),
>>>>            .class_init = m68k_cpu_class_init,
>>>>        },
>>>> -    DEFINE_M68K_CPU_TYPE("m68000", m68000_cpu_initfn),
>>>> -    DEFINE_M68K_CPU_TYPE("m68020", m68020_cpu_initfn),
>>>> -    DEFINE_M68K_CPU_TYPE("m68030", m68030_cpu_initfn),
>>>> -    DEFINE_M68K_CPU_TYPE("m68040", m68040_cpu_initfn),
>>>> -    DEFINE_M68K_CPU_TYPE("m68060", m68060_cpu_initfn),
>>>> +    DEFINE_M68K_CPU_TYPE_WITH_CLASS("m68000", m68000_cpu_initfn,
>>>> +                                    m68k_cpu_class_init_m68k_core),
>>>> +    DEFINE_M68K_CPU_TYPE_WITH_CLASS("m68020", m68020_cpu_initfn,
>>>> +                                    m68k_cpu_class_init_m68k_core),
>>>> +    DEFINE_M68K_CPU_TYPE_WITH_CLASS("m68030", m68030_cpu_initfn,
>>>> +                                    m68k_cpu_class_init_m68k_core),
>>>> +    DEFINE_M68K_CPU_TYPE_WITH_CLASS("m68040", m68040_cpu_initfn,
>>>> +                                    m68k_cpu_class_init_m68k_core),
>>>> +    DEFINE_M68K_CPU_TYPE_WITH_CLASS("m68060", m68060_cpu_initfn,
>>>> +                                    m68k_cpu_class_init_m68k_core),
>>>>        DEFINE_M68K_CPU_TYPE("m5206", m5206_cpu_initfn),
>>>>        DEFINE_M68K_CPU_TYPE("m5208", m5208_cpu_initfn),
>>>>        DEFINE_M68K_CPU_TYPE("cfv4e", cfv4e_cpu_initfn),
>>
>> But what about the "any" which is out of context here?
>>
>>      DEFINE_M68K_CPU_TYPE("any", any_cpu_initfn),
>>
>> Should it be TYPE_M68K or TYPE_CF in which case which xml will it take?
>> I guess
>> we can take TYPE_CF so it doesn't change from what is done today.
>>
> 
> Yes, "any" has been introduced with coldfire CPUs and defines CF_FPU, so
> it uses 64bit float registers.
> 
> Thanks,
> Laurent
> 

Ok done, will send a v2 with an other fix I've for mc68881.

