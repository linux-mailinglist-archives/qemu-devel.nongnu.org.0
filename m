Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 958ED52B698
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 12:08:48 +0200 (CEST)
Received: from localhost ([::1]:33550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrGbn-0007rd-Es
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 06:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nrGaB-0006Pr-TM; Wed, 18 May 2022 06:07:08 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:47064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nrGa9-0005pN-Qe; Wed, 18 May 2022 06:07:07 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 k25-20020a056830169900b00605f215e55dso959480otr.13; 
 Wed, 18 May 2022 03:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ClFtLEoUw6ajVd1ntroMWb+xwjmbralYWwAZ9iPrThg=;
 b=ZFySgRs8kb1x9waY+0uy/m8FJjDbH1yLsLTMk8dUPqrkoBpfBY/+wA5LZ8Q7dET5SX
 i9DeWldL/m0+xz1q/wholT6NSpEOAoxshjkV5u36+4Pq6qHzfQxcDUeNoNLBhtMAYTiz
 Afrrhu2jnmJm18XYa1qjvyokHnFFae3dDijbt5RUDzMpqMBKX+pXq73g/5Ak4eew5Uai
 jvflLdWOUfIchUY1qxftGhrqmo/6yRYyoUgGNm/k3NQm3XC/t0eMgHTrtlHBVqFbX8c9
 njai0Wqw0Nz0uQy4NVJIHhqXNay6DxPPYn0vJG7wSLomC3WJXMd5vZCa6OtzcBprWUDp
 bSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ClFtLEoUw6ajVd1ntroMWb+xwjmbralYWwAZ9iPrThg=;
 b=1qyDKMpl/lrQrKn1SQBWC4ftpHthKBLUIQTObku0u7B0WAOqmqkv3jekElu4vxdD5U
 ZvSS89r5v+3w5xt6Mpuvf9P2mesvBS3v3EyNdttabBlpVMSBc3r3je539RUGMHLjLFZO
 81lSAZ1NEn3GxszPt+Xhu4w1YFcWiFRhP6h6zLWTmvwKm1gRET4SJ3VfICc588688onH
 iLdrAWIA+YXFHHlmouP37YxvzbDEAEeIKElRtM1FHY22NIG3sh+T2rkaLxcnJlFTujIQ
 nBTx27JewAr+tCZzJhJi+s2brl0ycYefgk52aVtL+o3LnoN59PA5OVg93U6Tt7V4g1B2
 WWsg==
X-Gm-Message-State: AOAM532eMpx7/ZLF1RQ3Z9rhbi+JF6Y39SYVGvXeT9c3jQWe+U2s/IPC
 sCiNrCJEqhE6A7NDZ3FdBw/oTKx5VJo=
X-Google-Smtp-Source: ABdhPJyNVgcVgoDCFnBp3xf9XnDCmHMx2MSjfoOv6XKe9Edl/9M8+hhL24hFBn7bwfqQjPXrQ9hkBg==
X-Received: by 2002:a9d:82f:0:b0:605:ed5d:a5b2 with SMTP id
 44-20020a9d082f000000b00605ed5da5b2mr9867231oty.100.1652868424251; 
 Wed, 18 May 2022 03:07:04 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:c5a3:c184:dee5:866b:a35f?
 ([2804:431:c7c7:c5a3:c184:dee5:866b:a35f])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a9d6509000000b0060603221253sm613921otl.35.2022.05.18.03.07.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 03:07:03 -0700 (PDT)
Message-ID: <c22d166f-a865-cc79-9980-71ce96e73182@gmail.com>
Date: Wed, 18 May 2022 07:07:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH qemu] spapr: Use address from elf parser for kernel address
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
References: <20220504065536.3534488-1-aik@ozlabs.ru>
 <a9ac6ca4-d404-485c-f4a7-7712e81864ec@gmail.com>
 <ba5ee018-82a6-db88-ad09-a79b1671493c@ozlabs.ru>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <ba5ee018-82a6-db88-ad09-a79b1671493c@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 5/17/22 23:51, Alexey Kardashevskiy wrote:
> 
> 
> On 5/18/22 04:58, Daniel Henrique Barboza wrote:
>> Alexey,
>>
>> I had to amend your commit due to Gitlab CI complaining about ...
>>
>> On 5/4/22 03:55, Alexey Kardashevskiy wrote:
>>> tl;dr: This allows Big Endian zImage booting via -kernel + x-vof=on.
>>>
>>> QEMU loads the kernel at 0x400000 by default which works most of
>>> the time as Linux kernels are relocatable, 64bit and compiled with "-pie"
>>> (position independent code). This works for a little endian zImage too.
>>>
>>> However a big endian zImage is compiled without -pie, is 32bit, linked to
>>> 0x4000000 so current QEMU ends up loading it at
>>> 0x4400000 but keeps spapr->kernel_addr unchanged so booting fails.
>>>
>>> This uses the kernel address returned from load_elf().
>>> If the default kernel_addr is used, there is no change in behavior (as
>>> translate_kernel_address() takes care of this), which is:
>>> LE/BE vmlinux and LE zImage boot, BE zImage does not.
>>> If the VM created with "-machine kernel-addr=0,x-vof=on", then QEMU
>>> prints a warning and BE zImage boots.
>>>
>>> Note #1: SLOF (x-vof=off) still cannot boot a big endian zImage as
>>> SLOF enables MSR_SF for everything loaded by QEMU and this leads to early
>>> crash of 32bit zImage.
>>>
>>> Note #2: BE/LE vmlinux images set MSR_SF in early boot so these just work;
>>> a LE zImage restores MSR_SF after every CI call and we are lucky enough
>>> not to crash before the first CI call.
>>>
>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>> ---
>>>
>>> We could probably change SLOF to always clear MSR_SF before jumping to
>>> the kernel but this is 1) SLOF fix 2) not quite sure if it brings
>>> lots of value.
>>>
>>>
>>> I really wish I had this when tested this fix:
>>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220406070038.3704604-1-aik@ozlabs.ru/
>>>
>>> ---
>>>   hw/ppc/spapr.c | 12 ++++++++++--
>>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>>> index a4372ba1891e..89f18f6564bd 100644
>>> --- a/hw/ppc/spapr.c
>>> +++ b/hw/ppc/spapr.c
>>> @@ -2971,14 +2971,16 @@ static void spapr_machine_init(MachineState *machine)
>>>       }
>>>       if (kernel_filename) {
>>> +        uint64_t loaded_addr = 0;
>>> +
>>>           spapr->kernel_size = load_elf(kernel_filename, NULL,
>>>                                         translate_kernel_address, spapr,
>>> -                                      NULL, NULL, NULL, NULL, 1,
>>> +                                      NULL, &loaded_addr, NULL, NULL, 1,
>>>                                         PPC_ELF_MACHINE, 0, 0);
>>>           if (spapr->kernel_size == ELF_LOAD_WRONG_ENDIAN) {
>>>               spapr->kernel_size = load_elf(kernel_filename, NULL,
>>>                                             translate_kernel_address, spapr,
>>> -                                          NULL, NULL, NULL, NULL, 0,
>>> +                                          NULL, &loaded_addr, NULL, NULL, 0,
>>>                                             PPC_ELF_MACHINE, 0, 0);
>>>               spapr->kernel_le = spapr->kernel_size > 0;
>>>           }
>>> @@ -2988,6 +2990,12 @@ static void spapr_machine_init(MachineState *machine)
>>>               exit(1);
>>>           }
>>> +        if (spapr->kernel_addr != loaded_addr) {
>>> +            warn_report("spapr: kernel_addr changed from 0x%lx to 0x%lx",
>>> +                        spapr->kernel_addr, loaded_addr);
>>
>>
>> ... this code. This is problematic when compiling in a 32 bit environment because
>> the definition of long (long) unsigned differs from the usual 64 bit env we use:
>>
>>
>>
>> ../hw/ppc/spapr.c: In function 'spapr_machine_init':
>> ../hw/ppc/spapr.c:2998:25: error: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'uint64_t' {aka 'long long unsigned int'} [-Werror=format=]
>>   2998 |             warn_report("spapr: kernel_addr changed from 0x%lx to 0x%lx",
>>        | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>   2999 |                         spapr->kernel_addr, loaded_addr);
>>        |                         ~~~~~~~~~~~~~~~~~~
>>        |                              |
>>        |                              uint64_t {aka long long unsigned int}
>> ../hw/ppc/spapr.c:2998:25: error: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'uint64_t' {aka 'long long unsigned int'} [-Werror=format=]
>>   2998 |             warn_report("spapr: kernel_addr changed from 0x%lx to 0x%lx",
>>        | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>   2999 |                         spapr->kernel_addr, loaded_addr);
>>        |                                             ~~~~~~~~~~~
>>        |                                             |
>>        |                                             uint64_t {aka long long unsigned int}
>> cc1: all warnings being treated as errors
>>
>>
>> I've fixed it by doing the following:
>>
>>
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index 156e799ae9..8d5bdfc20f 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -2995,7 +2995,7 @@ static void spapr_machine_init(MachineState *machine)
>>           }
>>
>>           if (spapr->kernel_addr != loaded_addr) {
>> -            warn_report("spapr: kernel_addr changed from 0x%lx to 0x%lx",
>> +            warn_report("spapr: kernel_addr changed from 0x%"PRIx64
>> +                        " to 0x%"PRIx64,
>>                           spapr->kernel_addr, loaded_addr);
>>               spapr->kernel_addr = loaded_addr;
>>           }
>>
>>
>>
>> If you're ok with this fixup we can keep it as is. Otherwise feel free to send
>> another version.
> 
> 
> I am totally fine with this change, sorry I have not compile tested it, just assumed this cannot fail :-/


Nah it's fine. You would only be able to see this error if you happen
to compile it with a 32 bit environment. Not sure if this is something
you use to do here and there. I sure don't.


Daniel



> 
> 
>>
>>
>> Thanks,
>>
>>
>> Daniel
>>
>>
>>
>>
>>
>>> +            spapr->kernel_addr = loaded_addr;
>>> +        }
>>> +
>>>           /* load initrd */
>>>           if (initrd_filename) {
>>>               /* Try to locate the initrd in the gap between the kernel
> 

