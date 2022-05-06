Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 407F551D062
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 06:52:57 +0200 (CEST)
Received: from localhost ([::1]:54980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmpxY-0003ot-BP
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 00:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1nmpto-0001qE-Gn
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:49:06 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:43595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1nmptk-0003aq-Pv
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:49:03 -0400
Received: by mail-pl1-x630.google.com with SMTP id i17so6319547pla.10
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 21:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1gAr61ImKayF7DqsFISBEYbDvkfdcSKTA9l63de6ZMk=;
 b=ptBS9SkjMQ8qzg6mbKF413E1vw9u3POLnH3cWdj72iFhSGh0f1jQnMimwKdWqiFfdm
 qCJuLgqg7VPReh5BIMuA2jrsyfjai/xtrqReM1kr+soxD8WyU8y92WEzM5tXfWzYUa91
 sy8EDE60Wxdx0FOduLBedM2XCbewyWo4Xk0rBRoWQzHfqsEF1iJAM8vToRI3xbaKohPm
 NKbD37QOmOiI0yIlwUnac/MB0IiDRjVRECdJpZdVUNNm05mWnWEl2DcA0xvHhtnlt2gc
 vh1Nk6d8X634p+SmxG+2JsOJ4E5TP+h9yU1hj5LjMzWjIY6nRMUDoMGEkcpjFGZVcZY1
 yuvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1gAr61ImKayF7DqsFISBEYbDvkfdcSKTA9l63de6ZMk=;
 b=hanurezLwuVfd9T76EgyEUynrr9LNQ7D2ZmDNkM+i93l4PV6MrLtp0iv5vHpQucxxt
 /A8m+a0AETFsEQk9SZj4YJpbMBj+nusFCVvpWtPF1JLHDszfMGuz+ngQah7/VLtIZTwP
 mYwSq1tVj8JVe/L7ZSAmSslZgJl+vHzjcdSlTNpKVwoUIQ9R+blwt/8jd0sWjrmT8ttw
 e2i6Mtd+eUSOh8vy3IXaaDi9zalOYdtqggv2aUF7LxBszUhibV5vGeuKp3uDEwS4ZndD
 OfT4jV28A4YMc8t7uO2ZqllfqZU4CunpdhvJfcBC9R0pkLZ/I2qBggtSS+6L8mSdAcMY
 62+w==
X-Gm-Message-State: AOAM530bgn1OcerwcVPdSPGyrlR1Jv5y+/9YQ0StJcjG8qrovrRH95n1
 Ubz1N8xf+tVq1WyJ2FqPZegPFA==
X-Google-Smtp-Source: ABdhPJz38iek9ExTBeBT5qyoaxctP7zSg5foEp/8+g2LZ2nOlrC1w5umQfoMeAcSEswQVWMPc8rSxw==
X-Received: by 2002:a17:90b:4a4f:b0:1dc:79d9:8505 with SMTP id
 lb15-20020a17090b4a4f00b001dc79d98505mr10349450pjb.43.1651812535094; 
 Thu, 05 May 2022 21:48:55 -0700 (PDT)
Received: from [192.168.10.95] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a1709029a9600b0015e8d4eb25csm529975plp.166.2022.05.05.21.48.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 21:48:54 -0700 (PDT)
Message-ID: <1681b697-1ce6-b53c-068a-8728238d3272@ozlabs.ru>
Date: Fri, 6 May 2022 14:49:01 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:100.0) Gecko/20100101
 Thunderbird/100.0
Subject: Re: [PATCH qemu] spapr: Use address from elf parser for kernel address
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20220504065536.3534488-1-aik@ozlabs.ru>
 <87fslp9khd.fsf@linux.ibm.com>
 <365ad8a7-bfa4-45d5-0fb4-46e295ea75b8@ozlabs.ru>
 <87bkwc9dwi.fsf@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <87bkwc9dwi.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=aik@ozlabs.ru; helo=mail-pl1-x630.google.com
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



On 06/05/2022 01:50, Fabiano Rosas wrote:
> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> 
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
> 
> For relocations, it seems to only call translate_fn for s390x.


Agrh. You made me read this :) It is quite weird code and yeah 390-only :-/


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
> 
> Oh, I am not talking about the ELF entry point. And that is not what
> load_elf passes to translate_kernel_address either. It is the ELF
> PhysAddr:
> 
> $ powerpc64le-buildroot-linux-gnu-readelf -We vmlinux | tail
> 
> Program Headers:
>    Type           Offset   VirtAddr           PhysAddr           FileSiz  MemSiz   Flg Align
>    LOAD           0x010000 0xc000000000000000 0x0000000000000000 0x28d84d4 0x2a54ea8 RWE 0x10000
> 
> So it is 0x400000 for BE zImage and 0 for vmlinux.

Ah right. Me wrong.

btw potentially there can be more program sections.

[fstn1-p1 ~]$ readelf -l /home/aik/p/slof/board-qemu/llfw/stage1.elf

Elf file type is EXEC (Executable file)
Entry point 0x100
There are 2 program headers, starting at offset 64

Program Headers:
   Type           Offset             VirtAddr           PhysAddr
                  FileSiz            MemSiz              Flags  Align
   LOAD           0x0000000000000100 0x0000000000000100 0x0000000000000100
                  0x0000000000008110 0x0000000000010290  RWE    0x4000
   LOAD           0x0000000000008210 0x0000000000010400 0x0000000000010400
                  0x0000000000000010 0x0000000000000010  RW     0x8


grub might be similar.


> 
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
>>> 	    spapr->kernel_addr != loaded_addr) {
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
> 
> Good point. It should always be 3. It is a bad user interface to have a
> command line option and arbitrarily ignore it. Be it 0x0 or 0x400000.
> 
>> I am basically fixing a bug when we ignore where load_elf() loaded the
>> ELF and just assume it is KERNEL_LOAD_ADDR. Now the code checks if the
>> ELF was loaded where we want it to be.
> 
> That bug is already accounted for, that is why we have
> translate_kernel_address:
> 
>    /* address_offset is hack for kernel images that are
>       linked at the wrong physical address.  */
>    if (translate_fn) {
>        addr = translate_fn(translate_opaque, ph->p_paddr);
> 
> So we're actively telling load_elf to load the kernel at the wrong place
> when we do:
> 
> (ph->p_addr & 0x0fffffff) + spapr->kernel_addr
> 
> It just happened to work so far because the vmlinux PhysAddr is 0.
> 
> When you set kernel-addr=0 you are simply working around this other bug
> because:
> 
> (ph->p_addr & 0x0fffffff) + 0 == ph->p_addr
> 
> I just want to remove this indirection and use the ELF PhysAddr
> directly.


That's alright but not in translate_kernel_address(). May be I should 
rename kernel-addr to kernel-offset (which it really is)  or  hack 
load_elf() so it would take the desired location and work out the offset 
inside (and ditch the translate_fn hook) but either way we'll need 
heuristics (or the user should know) to know if the image is 
self-relocatable or not as otherwise it just won't boot.



>> Everything else can be done but on top of this.
> 
> If you want to merge this I could send another patch on top of it later,
> no worries. I realise that this a larger change that will need more
> testing.


I want to have some easy-to-explain way of booting BE zImage :)


> 
>>>> +            warn_report("spapr: kernel_addr changed from 0x%lx to 0x%lx",
>>>> +                        spapr->kernel_addr, loaded_addr);
>>>> +            spapr->kernel_addr = loaded_addr;
>>>> +        }
>>>> +
>>>>            /* load initrd */
>>>>            if (initrd_filename) {
>>>>                /* Try to locate the initrd in the gap between the kernel

-- 
Alexey

