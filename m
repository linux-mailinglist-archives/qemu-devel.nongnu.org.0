Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D211738E6ED
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 14:48:53 +0200 (CEST)
Received: from localhost ([::1]:41392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llA0q-0005n9-O0
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 08:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1ll9yf-00033V-FV
 for qemu-devel@nongnu.org; Mon, 24 May 2021 08:46:37 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:33302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1ll9yc-00074U-A4
 for qemu-devel@nongnu.org; Mon, 24 May 2021 08:46:37 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 v13-20020a17090abb8db029015f9f7d7290so1426839pjr.0
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 05:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xPo2c31k4b99T4D+OPwNQtPjlHXDGtoaLnryyJrUXBE=;
 b=itmgoH2kd/YJ7FbL/dwUqbGQ3qq2zM1ZPB442EWMxFTo5Ajyu2k//wLwOEeT8egDk+
 2JJGLBHct0op6if0rUfHBndBuIhnV/U34qcfN4Wp61F//++ANrBnc66X29aK8GWrW08e
 Pd9ENQDgo+L8w7oUBMx49HQJFKBObp8Dor1a8QxvTitV+gYhIPNhM1gcIJyjz5PBxxIS
 orjUUSkWZ5tvrrdKDIxcO0CMLCvkjOD8TnaFRMOYIlCVHzZRYUtZVmwhUFrh6it3oTid
 cIDAAIlkHJvNwB7DxMdZKKcEro//CmUtn5DWgJUIrD9KKJ2rDC6fVCpH2C2HZXXzIPLF
 TSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xPo2c31k4b99T4D+OPwNQtPjlHXDGtoaLnryyJrUXBE=;
 b=fadS85+tTPQ8g+HkRaL9VWU6Iipl89sq+ze2KWOYJjzbJKBy0+MeweWtMul2gkOMj5
 yN3BQfU0mogoRdO/w3xjH5WKeRO7wbUKJyqSSGSnE0oYfq2Q+Jm5hhmTmKXKwB+30fHH
 GpdonNVboQfQZg56oVnPFJSPXNrNVxLO8IegM1mrqB4Nz+loFzRkZtXL+o3VcWw3jTsn
 lpsaB55NkmJiQUpvxdi2p4mEkRoQewRe1ajThvWwAn44s3DJ9apJxzqTzwZwK+Vcmgwe
 oYiX/obk3mLWq5CdRONUTholI18HnDyUfaVtEn4MJx4/aWzvoV2Op3iDLYjDyBiKNY1Y
 rMPA==
X-Gm-Message-State: AOAM533pra0kMAuoJB0H81ikSF5gogrCk9Nlrbq9a6qwLSmbya8zm4u3
 XsvG/o4K8RJTV2zQIDvn0tJ86Q==
X-Google-Smtp-Source: ABdhPJxS5dynvDwI+WyDRM6HM9UvzFTI0x2uiQWJO/QCJWV4RsMIpEvoxqJK3QQ/UwgSjlhJv6NC+g==
X-Received: by 2002:a17:90a:3948:: with SMTP id
 n8mr25242846pjf.32.1621860391816; 
 Mon, 24 May 2021 05:46:31 -0700 (PDT)
Received: from [192.168.10.23]
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with UTF8SMTPSA id w127sm10856967pfw.4.2021.05.24.05.46.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 05:46:31 -0700 (PDT)
Message-ID: <f4992e6f-0d33-8465-ed4b-90736853ae40@ozlabs.ru>
Date: Mon, 24 May 2021 22:46:26 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:89.0) Gecko/20100101
 Thunderbird/89.0
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210520090557.435689-1-aik@ozlabs.ru>
 <eb49cd30-a4f4-d063-d728-521446a671a6@eik.bme.hu>
 <5825cde5-a408-a438-116d-5a9d9113a52a@ozlabs.ru>
 <ec1742e3-c47-bbee-3a6-ec64442922ab@eik.bme.hu>
 <8527c8d2-c1e7-b3f8-0bda-529ba3864701@ozlabs.ru>
 <babe39af-fd34-8c5-de99-a0f485bfbce@eik.bme.hu>
 <4f6ceca3-5f18-fe70-18f9-4efde8feb1ed@ozlabs.ru>
 <7a4e47e5-59b-9132-eafd-d84d8b73f5c@eik.bme.hu>
 <17fbb016-2e7-d57e-bedd-1ae7814fb860@eik.bme.hu> <YKtBJoQXSrSVENFw@yekko>
 <939a489f-40de-da33-dd7-9fd1f5eb190@eik.bme.hu>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <939a489f-40de-da33-dd7-9fd1f5eb190@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=aik@ozlabs.ru; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.837,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 24/05/2021 20:55, BALATON Zoltan wrote:
> On Mon, 24 May 2021, David Gibson wrote:
>> On Sun, May 23, 2021 at 07:09:26PM +0200, BALATON Zoltan wrote:
>>> On Sun, 23 May 2021, BALATON Zoltan wrote:
>>>> On Sun, 23 May 2021, Alexey Kardashevskiy wrote:
>>>>> One thing to note about PCI is that normally I think the client
>>>>> expects the firmware to do PCI probing and SLOF does it. But VOF
>>>>> does not and Linux scans PCI bus(es) itself. Might be a problem for
>>>>> you kernel.
>>>>
>>>> I'm not sure what info does MorphOS get from the device tree and 
>>>> what it
>>>> probes itself but I think it may at least need device ids and info 
>>>> about
>>>> the PCI bus to be able to access the config regs, after that it should
>>>> set the devices up hopefully. I could add these from the board code to
>>>> device tree so VOF does not need to do anything about it. However I'm
>>>> not getting to that point yet because it crashes on something that it's
>>>> missing and couldn't yet find out what is that.
>>>>
>>>> I'd like to get Linux working now as that would be enough to test this
>>>> and then if for MorphOS we still need a ROM it's not a problem if at
>>>> least we can boot Linux without the original firmware. But I can't make
>>>> Linux open a serial console and I don't know what it needs for that. Do
>>>> you happen to know? I've looked at the sources in Linux/arch/powerpc 
>>>> but
>>>> not sure how it would find and open a serial port on pegasos2. It seems
>>>> to work with the board firmware and now I can get it to boot with VOF
>>>> but then it does not open serial so it probably needs something in the
>>>> device tree or expects the firmware to set something up that we should
>>>> add in pegasos2.c when using VOF.
>>>
>>> I've now found that Linux uses rtas methods read-pci-config and
>>> write-pci-config for PCI access on pegasos2 so this means that we'll
>>> probably need rtas too (I hoped we could get away without it if it 
>>> were only
>>> used for shutdown/reboot or so but seems Linux needs it for PCI as 
>>> well and
>>> does not scan the bus and won't find some devices without it).
>>
>> Yes, definitely sounds like you'll need an RTAS implementation.
> 
> I plan to fix that after managed to get serial working as that seems to 
> not need it. If I delete the rtas-size property from /rtas on the 
> original firmware that makes Linux skip instantiating rtas, but I still 
> get serial output just not accessing PCI devices. So I think it should 
> work and keeps things simpler at first. Then I'll try rtas later.
> 
>>> While VOF can do rtas, this causes a problem with the hypercall 
>>> method using
>>> sc 1 that goes through vhyp but trips the assert in ppc_store_sdr1() so
>>> cannot work after guest is past quiesce.
>>
>>> So the question is why is that
>>> assert there
>>
>> Ah.. right.  So, vhyp was designed for the PAPR use case, where we
>> want to model the CPU when it's in supervisor and user mode, but not
>> when it's in hypervisor mode.  We want qemu to mimic the behaviour of
>> the hypervisor, rather than attempting to actually execute hypervisor
>> code in the virtual CPU.
>>
>> On systems that have a hypervisor mode, SDR1 is hypervisor privileged,
>> so it makes no sense for the guest to attempt to set it.  That should
>> be caught by the general SPR code and turned into a 0x700, hence the
>> assert() if we somehow reach ppc_store_sdr1().
>>
>> So, we are seeing a problem here because you want the 'sc 1'
>> interception of vhyp, but not the rest of the stuff that goes with it.
>>
>>> and would using sc 1 for hypercalls on pegasos2 cause other
>>> problems later even if the assert could be removed?
>>
>> At least in the short term, I think you probably can remove the
>> assert.  In your case the 'sc 1' calls aren't truly to a hypervisor,
>> but a special case escape to qemu for the firmware emulation.  I think
>> it's unlikely to cause problems later, because nothing on a 32-bit
>> system should be attempting an 'sc 1'.  The only thing I can think of
>> that would fail is some test case which explicitly verified that 'sc
>> 1' triggered a 0x700 (SIGILL from userspace).
> 
> OK so the assert should check if the CPU has an HV bit. I think there 
> was a #detine for that somewhere that I can add to the assert then I can 
> try that. What I wasn't sure about is that sc 1 would conflict with the 
> guest's usage of normal sc calls or are these going through different 
> paths and only sc 1 will trigger vhyp callback not affecting notmal sc 
> calls? (Or if this causes an otherwise unnecessary VM exit on KVM even 
> when it works then maybe looking for a different way in the future might 
> be needed. But for now if this works with modifying the assert to allow 
> this on ppc32 then I go for that as that's the simplest way for now.)
> 
>>> Can somebody who knows
>>> more about it explain this please? If this cannot be resolved then we 
>>> may
>>> need a different hypercall method on pegasos2 (I've considered MOL 
>>> OSI or
>>> are there other options? I may use some advice from people who know it
>>> better, especially the possible interaction with KVM later as the 
>>> long term
>>> goal with pegasos2 is to be able to run with KVM on PPC hardware
>>> eventually.)
>>
>> Right, you might need an alternative method eventually.  Really any
>> illegal instruction for your cpu is a possible candidate.  Bear in
>> mind that this is *not* truly a hypercall interface, instead it's
>> something we're special casing for the purposes of faking the
>> firmware.
>>
>> The "attn" instruction used on BookE might be a reasonable candidate
>> (assuming it doesn't conflict with something on 32-bit BookS) - that's
>> often used for things like signalling the attention of hardware
>> debuggers, and this is somewhat akin.
>>
>> Mostly it's just a matter of working out what would be least messy to
>> intercept in the TCG instruction decoding path.
> 
> I'll wait for the current ongoing reorganisations to settle for that. If 
> an alternative is needed I was considering the interface used by Mac on 
> Linux:
> 
> https://lists.nongnu.org/archive/html/qemu-ppc/2021-03/msg00047.html
> 
> becuase there are some paravirtual drivers I think that use these on Mac 
> OS X so this might also be useful for that use case for Mac emulation. 
> But that seems very similar just checking for magic values at a normal 
> syscall which means all syscalls will be intercepted anyway. In that 
> case if sc 1 does not interfere with normal sc instructions then it may 
> be better to keep that as the invalid instruction we trap on.
> 
>>> But this also means that if that assert cannot be dropped or
>>> there may be other problems with sc 1 hypercalls then we maybe cannot 
>>> have
>>> the same vof.bin and we'll need a separate version that I would like to
>>> avoid if possible so if there's a simple way to keep it working or make
>>> vof.bin use alternate hypercall method without needing a separate binary
>>> that would be the direction I'd tend to go. Even if we need a seoarate
>>> version I'd like to keep as much common as possible.
>>>
>>> I've tested that the missing rtas is not the reason for getting no 
>>> output
>>> via serial though, as even when disabling rtas on pegasos2.rom it 
>>> boots and
>>> I still get serial output just some PCI devices are not detected 
>>> (such as
>>> USB, the video card and the not emulated ethernet port but these are not
>>> fatal so it might even work as a first try without rtas, just to boot a
>>> Linux kernel for testing it would be enough if I can fix the serial 
>>> output).
>>> I still don't know why it's not finding serial but I think it may be 
>>> some
>>> missing or wrong info in the device tree I generat. I'll try to focus on
>>> this for now and leave the above rtas question for later.
>>
>> Oh.. another thought on that.  You have an ISA serial port on Pegasos,
>> I believe.  I wonder if the PCI->ISA bridge needs some configuration /
>> initialization that the firmware is expected to do.  If so you'll need
>> to mimic that setup in qemu for the VOF case.
> 
> That's what I begin to think because I've added everything to the device 
> tree that I thought could be needed and I still don't get it working so 
> it may need some config from the firmware. But how do I access device 
> registers from board code? I've tried adding a machine reset method and 
> write to memory mapped device registers but all my attempts failed. I've 
> tried cpu_stl_le_data and even memory_region_dispatch_write but these 
> did not get to the device. What's the way to access guest mmio regs from 
> QEMU?

If we know that that serial is sitting behind PCI->ISA bridge (is it?), 
I think you need to assign a BAR to that bridge, do some ISA setup (no 
idea which) and enable that bridge (write MEMORY to PCI_COMMAND), this 
should enable its registers.

In pseries we add "linux,pci-probe-only"=0 which makes Linux do all the 
above instead of relying on the firmware doing BAR assignment.


-- 
Alexey

