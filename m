Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D2951B763
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 07:11:08 +0200 (CEST)
Received: from localhost ([::1]:50146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmTlb-0000YA-4g
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 01:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1nmThz-0007M2-Tu
 for qemu-devel@nongnu.org; Thu, 05 May 2022 01:07:24 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:33445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1nmThx-00028M-1p
 for qemu-devel@nongnu.org; Thu, 05 May 2022 01:07:23 -0400
Received: by mail-pg1-x536.google.com with SMTP id k14so2841449pga.0
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 22:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hrDEFkW4ZGF2JfXmFTuLo2PDSHYb08nXLIOIGf/Ix54=;
 b=VGZ9Z23tQdINFqVg3ZD33+vRNn4Pp1zzYrgrnXr7EXgeZuVJsTjdvBEyXebTKorj5o
 yei5E2Ww35miM+1bqJRp0P7jZ+oB7a+vGCMHUCcxIEZCgiyq7InUY9J6AeGDwmi7UpiW
 x2aRM+h14b1jotHsNBAUq8uD620RVTT/E5byZWMECTr7dTTo2XnocD+XokdlRKsUsVrx
 ygpLrpc9IfvwQi8eVhDK6N5//KjxkofrfVkJMoVT60FXfGsirD5U7v66HdENOBq1kBV3
 DXo15uTRIJHY7sUe1aNS7GuWJhgCgROBbYHbhRpjioZNSuFiz5kXButFuhYCrJqe2WGh
 6i9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hrDEFkW4ZGF2JfXmFTuLo2PDSHYb08nXLIOIGf/Ix54=;
 b=DaXr8MljMRLO6+w267mlVGxPYua8CWDhPbAxYbRhhiUFiEIMP3VaW/C7BUAPtLC4az
 rV7mphAgD+73h3+lviJNimDRJOSflAvtzXoSTxim/P3rNf8dh341IxalpSH4Zn0/yP97
 LRKD7BWX+6jtSDSpCdYj2dbO9Ycg1WmTstX8keLCx2O7wWAGsalbjzS7Pc1wTIPNYmRf
 WZRjYlvlVWZNmzENrenLZ6qGqzbF5UNaaKqo9OvAmFZN9LIIXUDEZtsGnfF0V3SkuCC0
 UFljkmPLaWEol9LeXFd+HlNUxphCEkzFRxX6ItQQLIAzxtW2B6vcq2bu887nCv50u3Ne
 oRXA==
X-Gm-Message-State: AOAM5330bx0GqjW/Thh8lIxhjIXcq/BaHVhk2S33bTzJCZhJEWT3B31G
 CRXwaFzvqjaLPvgS7WOQykwX8g==
X-Google-Smtp-Source: ABdhPJzNsGsuNnaAN2Yevk8Wur9tSrPnJ7bv1ucHy8LcJpOWKe3GR38YTN7arlc4v+5nx8KYW8Q4LA==
X-Received: by 2002:a63:4a04:0:b0:3c5:e6c2:a111 with SMTP id
 x4-20020a634a04000000b003c5e6c2a111mr5328163pga.432.1651727238274; 
 Wed, 04 May 2022 22:07:18 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242]) by smtp.gmail.com with ESMTPSA id
 cq17-20020a17090af99100b001cd4989fec9sm4263597pjb.21.2022.05.04.22.07.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 22:07:17 -0700 (PDT)
Message-ID: <eb7d4165-d2ad-261b-5132-a000bed34a73@ozlabs.ru>
Date: Thu, 5 May 2022 15:07:13 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:100.0) Gecko/20100101
 Thunderbird/100.0
Subject: Re: [PATCH qemu] spapr: Use address from elf parser for kernel address
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
Cc: Fabiano Rosas <farosas@linux.ibm.com>, qemu-ppc@nongnu.org,
 QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20220504065536.3534488-1-aik@ozlabs.ru>
 <87fslp9khd.fsf@linux.ibm.com>
 <365ad8a7-bfa4-45d5-0fb4-46e295ea75b8@ozlabs.ru>
 <CACPK8Xd15mz0OOnVzqz4RxcjKXcTvp_1GkzeXt5i4Adg-SfcYg@mail.gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <CACPK8Xd15mz0OOnVzqz4RxcjKXcTvp_1GkzeXt5i4Adg-SfcYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=aik@ozlabs.ru; helo=mail-pg1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 5/5/22 14:16, Joel Stanley wrote:
> On Thu, 5 May 2022 at 03:31, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>>
>>
>>
>> On 5/5/22 05:16, Fabiano Rosas wrote:
>>> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>>>
>>>> tl;dr: This allows Big Endian zImage booting via -kernel + x-vof=on.
>>>>
>>>> QEMU loads the kernel at 0x400000 by default which works most of
>>>> the time as Linux kernels are relocatable, 64bit and compiled with "-pie"
>>>> (position independent code). This works for a little endian zImage too.
>>>>
>>>> However a big endian zImage is compiled without -pie, is 32bit, linked to
>>>> 0x4000000 so current QEMU ends up loading it at
>>>> 0x4400000 but keeps spapr->kernel_addr unchanged so booting fails.
>>>>
>>>> This uses the kernel address returned from load_elf().
>>>> If the default kernel_addr is used, there is no change in behavior (as
>>>> translate_kernel_address() takes care of this), which is:
>>>> LE/BE vmlinux and LE zImage boot, BE zImage does not.
>>>> If the VM created with "-machine kernel-addr=0,x-vof=on", then QEMU
>>>> prints a warning and BE zImage boots.
>>>
>>> I think we can fix this without needing a different command line for BE
>>> zImage (apart from x-vof, which is a separate matter).
>>>
>>> If you look at translate_kernel_address, it cannot really work when the
>>> ELF PhysAddr is != 0. We would always hit this sort of 0x4400000 issue,
>>> so if we fix that function like this...
>>>
>>> static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
>>> {
>>>       SpaprMachineState *spapr = opaque;
>>>
>>>       return addr ? addr : spapr->kernel_addr;
>>> }
>>
>>
>> The qemu elf loader is supposed to handle relocations which should be
>> calling this hook more than once, now I wonder why it is not doing so.
>>
>>
>>> ...then we could always use the ELF PhysAddr if it is different from 0
>>> and only use the default load addr if the ELF PhysAddr is 0. If the user
>>> gives kernel_addr on the cmdline, we honor that, even if puts the kernel
>>> over the firmware (we have code to detect that).
>>
>>
>> ELF address is 0 for LE zImage only, vmlinux BE/LE uses
>> 0xc000000000000000. And we are already chopping all these tops bits off
>> in translate_kernel_address() and I do not really know why _exactly_ it
>> is 0x0fffffff and not let's say 0x7fffffff.
>>
>>
>>>
>>>> @@ -2988,6 +2990,12 @@ static void spapr_machine_init(MachineState *machine)
>>>>                exit(1);
>>>>            }
>>>>
>>>> +        if (spapr->kernel_addr != loaded_addr) {
>>>
>>> This could be:
>>>
>>>           if (spapr->kernel_addr == KERNEL_LOAD_ADDR &&
>>>            spapr->kernel_addr != loaded_addr) {
>>>
>>> So the precedence would be:
>>>
>>> 1- ELF PhysAddr, if != 0. After all, that is what it's for. BE zImage
>>>      falls here;
>>>
>>> 2- KERNEL_LOAD_ADDR. Via translate_kernel_address, LE/BE vmlinux fall
>>>      here;
>>>
>>> 3- kernel_addr. The user is probably hacking something, just use what
>>>      they gave us. QEMU will yell if they load the kernel over the fw.
>>
>>
>> imho too complicated.
>>
>> What if the user runs QEMU with kernel-addr=0x400000? (0x400000 is
>> KERNEL_LOAD_ADDR noooow but not necessarily forever). Is it 2) or 3)?
>>
>> I am basically fixing a bug when we ignore where load_elf() loaded the
>> ELF and just assume it is KERNEL_LOAD_ADDR. Now the code checks if the
>> ELF was loaded where we want it to be. Everything else can be done but
>> on top of this.
> 
> It would be good to fix this so we don't need to specify kernel-addr=0.


This means the pseries code in QEMU needs to read the ELF header and 
figure out if it is position independent and what is the base address. 
And because it is Linux which is special, just reading the ELF header is 
not enough, need more heuristics (there is some already in 
translate_kernel_address()).

LE vmlinux is 64bit EXEC type and entry=0xc000000000000000
BE vmlinux is 64bit EXEC type and entry=0xc000000000000000
LE zImage is 64bit DYN type and entry=0x0
BE zImage is 32bit EXEC type and entry=0x4000000

And the default address for these in QEMU is 0x400000. Asking 
kernel-addr=0 and vof=on looks like a small evil :)

And also worth mentioning that with this hack it should be possible to 
boot grub.elf via -kernel which might be interesting for debugging, and 
that thing is linked to 0x200000 or so, and probably also 32bit BE (I do 
not have one handy).



> I only recently learnt the pseries machine doesn't support loading the zImage:
> 
>   https://github.com/linuxppc/issues/issues/402
> 
> So whatever the fix is, writing down what is expected to work and what
> isn't would be useful.
> 
> I tested your patch and it worked with this command line:
> 
>   qemu-system-ppc64 -M pseries,kernel-addr=0,x-vof=on -nographic
> -kernel arch/powerpc/boot/zImage.pseries -serial mon:stdio -nodefaults
> 
> Tested-by: Joel Stanley <joel@jms.id.au>

Cool thanks!

> 
> Cheers,
> 
> Joel
> 
>>
>>
>>>> +            warn_report("spapr: kernel_addr changed from 0x%lx to 0x%lx",
>>>> +                        spapr->kernel_addr, loaded_addr);
>>>> +            spapr->kernel_addr = loaded_addr;
>>>> +        }
>>>> +
>>>>            /* load initrd */
>>>>            if (initrd_filename) {
>>>>                /* Try to locate the initrd in the gap between the kernel
>>

