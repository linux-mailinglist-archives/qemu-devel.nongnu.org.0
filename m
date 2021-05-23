Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5804F38D87C
	for <lists+qemu-devel@lfdr.de>; Sun, 23 May 2021 05:21:39 +0200 (CEST)
Received: from localhost ([::1]:54856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkegL-0001b1-NU
	for lists+qemu-devel@lfdr.de; Sat, 22 May 2021 23:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lkefA-0000pD-LM
 for qemu-devel@nongnu.org; Sat, 22 May 2021 23:20:25 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:41829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lkef6-0008IL-At
 for qemu-devel@nongnu.org; Sat, 22 May 2021 23:20:24 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 b15-20020a17090a550fb029015dad75163dso9253583pji.0
 for <qemu-devel@nongnu.org>; Sat, 22 May 2021 20:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ubkpXnNp6oHY0glNBSKgmOKo0+6ILOc0K4/Rizc3q8E=;
 b=O3wcRQDYyVuSWMWu00OvLFN0mOJbKCBcI2zY+sdtavyqzEhnPravYIrdwFDe5OpkiF
 ga3mQPKd6VaK41n0c2iRurQrzCNq2BKfH0Arx9m/Sc+XspqYiTVPWCFUo8MHJnEyPzpf
 oiZa3/RwZH87peq8Eb+A0acdi69byw1cu2gdzgYHANnpZy/WTcE+wAIV0ygiC6+JpK5o
 OlJ2u69liLkKtUsyZR1xG/L2G3J6tg7HR8b7CTFyOi6l8kgwujIYBHXxD7kPaEq2DB2m
 uTPkEa6WMereZhwYG7932YRyAiloKGNibwoZVvJNVA/rMt4zIA6RhSiMlpmR8gQTWdT3
 fJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ubkpXnNp6oHY0glNBSKgmOKo0+6ILOc0K4/Rizc3q8E=;
 b=g4rjI+JyzRTGqOgUQbd7d4D+HdRHDiAuQf514sHabfIlWRNlLVbsnIysyyCIHX/GPy
 7D3oaKorTye5MCSBphgKgRj8J+qH1ihwRgXyfLTmd/iRcQSUhtrOz5l0F8Z7/IZ13hWH
 NNdyG9XhliOB/iclssD/pPHMTvzywDQo54wXgwXWqlABRqkaUor58hzyjSFMzqa2ieUL
 wKcsGP9civoJmh6Q+1pURBck1vSUMF2p5s+0s7SRlPg6t6+cBaHmQXOtqXMrkZGLxwEx
 oDe9/1UHMi8t3Qoj9oEC8UySRE2W2RxJvyV1qvo4PqlYDeBouzLVjdZ3F16JBrk95kk2
 xy8Q==
X-Gm-Message-State: AOAM530a4WbagxSaOMpNmendU+kaHXe7xLZT7uQqCD7Hn5dp0GTSQwUu
 7CF9VAlZT7f16uELU96wcusiAg==
X-Google-Smtp-Source: ABdhPJxoMgevX1B3lGapMzv9cX816Fej/Au4DDQ7uzE7CaIyBFmIJYr+PZuitYv+CEX4pWvXnVi8Ww==
X-Received: by 2002:a17:90a:e388:: with SMTP id
 b8mr17580106pjz.128.1621740017349; 
 Sat, 22 May 2021 20:20:17 -0700 (PDT)
Received: from [192.168.10.23]
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with UTF8SMTPSA id o17sm1877721pgj.25.2021.05.22.20.20.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 May 2021 20:20:16 -0700 (PDT)
Message-ID: <4f6ceca3-5f18-fe70-18f9-4efde8feb1ed@ozlabs.ru>
Date: Sun, 23 May 2021 13:20:11 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:89.0) Gecko/20100101
 Thunderbird/89.0
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210520090557.435689-1-aik@ozlabs.ru>
 <eb49cd30-a4f4-d063-d728-521446a671a6@eik.bme.hu>
 <5825cde5-a408-a438-116d-5a9d9113a52a@ozlabs.ru>
 <ec1742e3-c47-bbee-3a6-ec64442922ab@eik.bme.hu>
 <8527c8d2-c1e7-b3f8-0bda-529ba3864701@ozlabs.ru>
 <babe39af-fd34-8c5-de99-a0f485bfbce@eik.bme.hu>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <babe39af-fd34-8c5-de99-a0f485bfbce@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=aik@ozlabs.ru; helo=mail-pj1-x1036.google.com
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 22/05/2021 23:01, BALATON Zoltan wrote:
> On Sat, 22 May 2021, Alexey Kardashevskiy wrote:
>> On 21/05/2021 19:05, BALATON Zoltan wrote:
>>> On Fri, 21 May 2021, Alexey Kardashevskiy wrote:
>>>> On 21/05/2021 07:59, BALATON Zoltan wrote:
>>>>> On Thu, 20 May 2021, Alexey Kardashevskiy wrote:
>>>>>> The PAPR platform describes an OS environment that's presented by
>>>>>> a combination of a hypervisor and firmware. The features it specifies
>>>>>> require collaboration between the firmware and the hypervisor.
>>>>>>
>>>>>> Since the beginning, the runtime component of the firmware (RTAS) has
>>>>>> been implemented as a 20 byte shim which simply forwards it to
>>>>>> a hypercall implemented in qemu. The boot time firmware component is
>>>>>> SLOF - but a build that's specific to qemu, and has always needed 
>>>>>> to be
>>>>>> updated in sync with it. Even though we've managed to limit the 
>>>>>> amount
>>>>>> of runtime communication we need between qemu and SLOF, there's some,
>>>>>> and it has become increasingly awkward to handle as we've implemented
>>>>>> new features.
>>>>>>
>>>>>> This implements a boot time OF client interface (CI) which is
>>>>>> enabled by a new "x-vof" pseries machine option (stands for 
>>>>>> "Virtual Open
>>>>>> Firmware). When enabled, QEMU implements the custom H_OF_CLIENT hcall
>>>>>> which implements Open Firmware Client Interface (OF CI). This allows
>>>>>> using a smaller stateless firmware which does not have to manage
>>>>>> the device tree.
>>>>>>
>>>>>> The new "vof.bin" firmware image is included with source code under
>>>>>> pc-bios/. It also includes RTAS blob.
>>>>>>
>>>>>> This implements a handful of CI methods just to get -kernel/-initrd
>>>>>> working. In particular, this implements the device tree fetching and
>>>>>> simple memory allocator - "claim" (an OF CI memory allocator) and 
>>>>>> updates
>>>>>> "/memory@0/available" to report the client about available memory.
>>>>>>
>>>>>> This implements changing some device tree properties which we know 
>>>>>> how
>>>>>> to deal with, the rest is ignored. To allow changes, this skips
>>>>>> fdt_pack() when x-vof=on as not packing the blob leaves some room for
>>>>>> appending.
>>>>>>
>>>>>> In absence of SLOF, this assigns phandles to device tree nodes to 
>>>>>> make
>>>>>> device tree traversing work.
>>>>>>
>>>>>> When x-vof=on, this adds "/chosen" every time QEMU (re)builds a tree.
>>>>>>
>>>>>> This adds basic instances support which are managed by a hash map
>>>>>> ihandle -> [phandle].
>>>>>>
>>>>>> Before the guest started, the used memory is:
>>>>>> 0..e60 - the initial firmware
>>>>>> 8000..10000 - stack
>>>>>> 400000.. - kernel
>>>>>> 3ea0000.. - initramdisk
>>>>>>
>>>>>> This OF CI does not implement "interpret".
>>>>>>
>>>>>> Unlike SLOF, this does not format uninitialized nvram. Instead, this
>>>>>> includes a disk image with pre-formatted nvram.
>>>>>>
>>>>>> With this basic support, this can only boot into kernel directly.
>>>>>> However this is just enough for the petitboot kernel and 
>>>>>> initradmdisk to
>>>>>> boot from any possible source. Note this requires reasonably 
>>>>>> recent guest
>>>>>> kernel with:
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=df5be5be8735 
>>>>>> The immediate benefit is much faster booting time which especially
>>>>>> crucial with fully emulated early CPU bring up environments. Also 
>>>>>> this
>>>>>> may come handy when/if GRUB-in-the-userspace sees light of the day.
>>>>>>
>>>>>> This separates VOF and sPAPR in a hope that VOF bits may be reused by
>>>>>> other POWERPC boards which do not support pSeries.
>>>>>>
>>>>>> This is coded in assumption that later on we might be adding 
>>>>>> support for
>>>>>> booting from QEMU backends (blockdev is the first candidate) without
>>>>>> devices/drivers in between as OF1275 does not require that and
>>>>>> it is quite easy to so.
>>>>>>
>>>>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>>>>> ---
>>>>>>
>>>>>> The example command line is:
>>>>>>
>>>>>> /home/aik/pbuild/qemu-killslof-localhost-ppc64/qemu-system-ppc64 \
>>>>>> -nodefaults \
>>>>>> -chardev stdio,id=STDIO0,signal=off,mux=on \
>>>>>> -device spapr-vty,id=svty0,reg=0x71000110,chardev=STDIO0 \
>>>>>> -mon id=MON0,chardev=STDIO0,mode=readline \
>>>>>> -nographic \
>>>>>> -vga none \
>>>>>> -enable-kvm \
>>>>>> -m 8G \
>>>>>> -machine 
>>>>>> pseries,x-vof=on,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off 
>>>>>> \
>>>>>> -kernel pbuild/kernel-le-guest/vmlinux \
>>>>>> -initrd pb/rootfs.cpio.xz \
>>>>>> -drive 
>>>>>> id=DRIVE0,if=none,file=./p/qemu-killslof/pc-bios/vof-nvram.bin,format=raw 
>>>>>> \
>>>>>> -global spapr-nvram.drive=DRIVE0 \
>>>>>> -snapshot \
>>>>>> -smp 8,threads=8 \
>>>>>> -L /home/aik/t/qemu-ppc64-bios/ \
>>>>>> -trace events=qemu_trace_events \
>>>>>> -d guest_errors \
>>>>>> -chardev socket,id=SOCKET0,server,nowait,path=qemu.mon.tmux26 \
>>>>>> -mon chardev=SOCKET0,mode=control
>>>>>>
>>>>>> ---
>>>>>> Changes:
>>>>>> v20:
>>>>>> * compile vof.bin with -mcpu=power4 for better compatibility
>>>>>> * s/std/stw/ in entry.S to make it work on ppc32
>>>>>> * fixed dt_available property to support both 32 and 64bit
>>>>>> * shuffled prom_args handling code
>>>>>> * do not enforce 32bit in MSR (again, to support 32bit platforms)
>>>>>>
>>>>>
>>>>> [...]
>>>>>
>>>>>> diff --git a/default-configs/devices/ppc64-softmmu.mak 
>>>>>> b/default-configs/devices/ppc64-softmmu.mak
>>>>>> index ae0841fa3a18..9fb201dfacfa 100644
>>>>>> --- a/default-configs/devices/ppc64-softmmu.mak
>>>>>> +++ b/default-configs/devices/ppc64-softmmu.mak
>>>>>> @@ -9,3 +9,4 @@ CONFIG_POWERNV=y
>>>>>>  # For pSeries
>>>>>>  CONFIG_PSERIES=y
>>>>>>  CONFIG_NVDIMM=y
>>>>>> +CONFIG_VOF=y
>>>>>> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
>>>>>> index e51e0e5e5ac6..964510dfc73d 100644
>>>>>> --- a/hw/ppc/Kconfig
>>>>>> +++ b/hw/ppc/Kconfig
>>>>>> @@ -143,3 +143,6 @@ config FW_CFG_PPC
>>>>>>
>>>>>>  config FDT_PPC
>>>>>>      bool
>>>>>> +
>>>>>> +config VOF
>>>>>> +    bool
>>>>>
>>>>> I think you should just add "select VOF" to config PSERIES section 
>>>>> in Kconfig instead of adding it to 
>>>>> default-configs/devices/ppc64-softmmu.mak. 
>>>>
>>>> oh well, can do that too.
>>>
>>> I think most config options should be selected by KConfig and the 
>>> default config should only include machines, otherwise VOF would be 
>>> added also when you don't compile PSERIES or PEGASOS2. With select in 
>>> Kconfig it will be added when needed. That's why it's better to use 
>>> select in this case.
>>>
>>>>>  That should do it, it works in my updated pegasos2 patch:
>>>>>
>>>>> https://osdn.net/projects/qmiga/scm/git/qemu/commits/3c1fad08469b4d3c04def22044e52b2d27774a61 
>>>>> [...]
>>>>>> diff --git a/pc-bios/vof/entry.S b/pc-bios/vof/entry.S
>>>>>> new file mode 100644
>>>>>> index 000000000000..569688714c91
>>>>>> --- /dev/null
>>>>>> +++ b/pc-bios/vof/entry.S
>>>>>> @@ -0,0 +1,51 @@
>>>>>> +#define LOAD32(rn, name)    \
>>>>>> +    lis     rn,name##@h;    \
>>>>>> +    ori     rn,rn,name##@l
>>>>>> +
>>>>>> +#define ENTRY(func_name)    \
>>>>>> +    .text;                  \
>>>>>> +    .align  2;              \
>>>>>> +    .globl  .func_name;     \
>>>>>> +    .func_name:             \
>>>>>> +    .globl  func_name;      \
>>>>>> +    func_name:
>>>>>> +
>>>>>> +#define KVMPPC_HCALL_BASE       0xf000
>>>>>> +#define KVMPPC_H_RTAS           (KVMPPC_HCALL_BASE + 0x0)
>>>>>> +#define KVMPPC_H_VOF_CLIENT     (KVMPPC_HCALL_BASE + 0x5)
>>>>>> +
>>>>>> +    . = 0x100 /* Do exactly as SLOF does */
>>>>>> +
>>>>>> +ENTRY(_start)
>>>>>> +#    LOAD32(%r31, 0) /* Go 32bit mode */
>>>>>> +#    mtmsrd %r31,0
>>>>>> +    LOAD32(2, __toc_start)
>>>>>> +    b entry_c
>>>>>> +
>>>>>> +ENTRY(_prom_entry)
>>>>>> +    LOAD32(2, __toc_start)
>>>>>> +    stwu    %r1,-112(%r1)
>>>>>> +    stw     %r31,104(%r1)
>>>>>> +    mflr    %r31
>>>>>> +    bl prom_entry
>>>>>> +    nop
>>>>>> +    mtlr    %r31
>>>>>> +    ld      %r31,104(%r1)
>>>>>
>>>>> It's getting there, now I see the first client call from the guest 
>>>>> boot code but then it crashes on this ld opcode which apparently is 
>>>>> 64 bit only:
>>>>
>>>> Oh right.
>>>>
>>>>
>>>>> Hopefully this is the last such opcode left before I can really 
>>>>> test this.
>>>>
>>>> Make it lwz, and test it?
>>>
>>> Yes, figured that out too after sending this message. Replacing with 
>>> lwz works but I wonder that now you have stwu lwz do the stack 
>>> offsets need adjusting too or you just waste 4 bytes now?
>>
>> Well, this assumes the 64bit client and that ABI. I think ideally the 
>> firmware is supposed to use its own stack but I did not bother here. I 
>> do not know 32bit ABI at all so say whether the existing code should 
>> just work or not :-/
> 
> It seems to work so that's OK, just thought if the firmware is 32 bit it 
> does not need 64 bit values on stack but if that's also potentially used 
> by a 64 bit kernel then it may be better to keep it that way to avoid 
> confusion. With the 64 bit opcodes replaced it seems to work on pegasos2 
> and the guest can call CI functions and get a reply so maybe it's just a 
> few wasted bytes that's not a big deal.
> 
>>> With lwz here I found no further 64 bit opcodes and the guest boot 
>>> code could walk the device tree. It failed later but I think that's 
>>> because I'll need to fill more info about the machine in the device 
>>> tree. I'll experiment with that but it looks like it could work at 
>>> least for MorphOS. I'll have to try Linux too.
>>
>> There are plenty of tracepoints, enable them all.
> 
> I'm running with -trace enable="vof*" but it does not give me too much 
> info as a lot of calls (such as peer, child, etc.) don't log anything 
> other than there was a hypercall so only get info about opening paths 
> and querying some props. The MorphOS boot.img just walks the device tree 
> gathering some data about the machine then calls quiesce and boot into 
> the OS that later tries to use the gathered info at which point it 
> crashes without any logs if some info is not as expected. This does not 
> make it easy to debug but I think once I fill the device tree enough 
> with all needed info it should work. Currently I'm missing info about 
> PCI devices that it may need.


One thing to note about PCI is that normally I think the client expects 
the firmware to do PCI probing and SLOF does it. But VOF does not and 
Linux scans PCI bus(es) itself. Might be a problem for you kernel.


> 
>>>>> Do you have some info on how the stdout works in VOF? I think I'll 
>>>>> need that to test with Linux and get output but I'm not sure what's 
>>>>> needed on the machine side.
>>>>
>>>> VOF opens stsout and stores the ihandle (in fdt) which the client 
>>>> (==kernel) uses for writing. To make it work properly, you need to 
>>>> hook up that instance to a device backend similar to what I have for 
>>>> spapr-vty:
>>>>
>>>> https://github.com/aik/qemu/commit/a381a5b50c23c74013e2bd39cc5dad5b6385965d 
>>>>
>>>> This is not a part of this patch as I'm trying to keep things 
>>>> simpler and accessing backends from VOF is still unsettled. But 
>>>> there is a workaround which  is trace_vof_write, I use this. Thanks,
>>>
>>> The above patch is about stdin but stdout seems to be added by the 
>>> current vof patch. What is spapr-vty?
>>
>> It is pseries' paravirtual serial device, pegasos does not have it.
>>
>>> I don't think I have something similar in pegasos2 where I just have 
>>> a normal serial port created by ISASuperIO in the vt8231 model.
>>
>> Correct.
>>
>>> Can I use that backend somehow or have to create some other serial 
>>> device to connect to stdout?
>>> Does trace_vof_write work for stuff output by the guest?
>>> I guess that's only for things printed by VOF itself
>>
>> VOF itself does not prints anything in this patch.
> 
> However it seems to be needed for linux as the first thing it does seems 
> to be getting /chosen/stdout and calls exit if it returns nothing. So 

Right, Linux does but VOF (==vof.bin) does not.

> I'll need this at least for linux. (I think MorphOS may also query it to 
> print a banner or some messages but not sure it needs it, at least it 
> does not abort right away if not found.)

Tracepoints print this :)

>>> but to see Linux output do I need a stdout in VOF or it will just 
>>> open the serial with its own driver and use that?
>>> So I'm not sure what's the stdout parts in the current vof patch does 
>>> and if I need that for anything. I'll try to experiment with it some 
>>> more but fixing the ld and Kconfig seems to be enough to get it work 
>>> for me.
>>
>> So for the client to print something, /chosen/stdout needs to have a 
>> valid ihandle.
>> The only way to get a valid ihandle is having a valid phandle which 
>> vof_client_open() can open.
>> A valid phandle is a phandle of any node in the device tree. On spapr 
>> we pick some spapr-vty, open it and store in /chosen/stdout.
>>
>> From this point output from the client can be seen via a tracepoint.
>>
>> Now if we want proper output without tracepoints - we need to hook it 
>> up with some chardev backend (not a device such a vt8231 or spapr-vty 
>> but backend).
> 
> I don't know much about it but devices are also connected to some 
> backend so is it possible to use the same backend for VOF as used for 
> the normal serial port?

Yes but with this initial patch there is no backend support, you only 
get tracepoints.

> But I need a way to find that and connect it to 
> VOF and I'm not qure how to do that yet.

Pick some device in the machine reset code (or you can open the root - 
"/"), resolve its FW (==FDT) path, call vof_client_open_store() on it, 
it will store ihandle in the FDT. This will enable stdout and the output 
can be seen via tracepoint.


> Or do I need to create a 
> separate serial backend and connect that to VOF? I'll try to look at 
> spapr-vty to see what it does.

No additional devices needed.


> 
>> https://github.com/aik/qemu/commit/a381a5b50c23c74013e2bd3 does this:
>> 1. when a phandle is open, QEMU will search for DeviceState* for the 
>> specific FDT node and get a chardev from the device.
>> 2. when write() is called, QEMU calls qemu_chr_fe_write_all() on 
>> chardev from 1.
>>
>> From this point you do not need a tracepoint and the output will 
>> appears in the console you set up for stdout.
>>
>> Now if you want input from this console, things get tricky. First, on 
>> powernv/pseries we only need this for grub as otherwise the kernel has 
>> all the drivers needed and will not use the client interface. For the 
>> grub, we need to provide a valid ihandle for /chosen/stdin which is 
>> easy but implementing read() on this is not as there is no simple 
>> device-type-independend way of reading from chardev. I hacked it for 
>> spapr-tvy but other serial devices will need special handling, or 
>> we'll have to introduce some VOF_SERIAL_READ interface for those which 
>> will face opposition :)
>>
>> Makes sense?
> 
> It explains things a bit but still not entirely clear how can I get 
> something to add as a stdout. With the pegasos2 firmware it puts the 
> serial device there normally that it inits and opens. Without that 
> firmware we have to somehow do that from QEMU so find the serial backend 
> used by the serial device within the vt8231 model (or use a different 
> backend just for this?) then open it and put it in the device tree. If 
> that's correct or how to do it is not clear yet.

spapr looks through all spapr-vty and picks one with the lowest @reg. 
You can do a similar thing. Or add a machine option with a serial device 
id which you want to be the default console. So many options :)



-- 
Alexey

