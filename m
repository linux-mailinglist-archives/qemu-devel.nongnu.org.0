Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6481038D3F6
	for <lists+qemu-devel@lfdr.de>; Sat, 22 May 2021 08:42:23 +0200 (CEST)
Received: from localhost ([::1]:51496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkLL4-0001Mp-0O
	for lists+qemu-devel@lfdr.de; Sat, 22 May 2021 02:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lkLIu-0008I1-08
 for qemu-devel@nongnu.org; Sat, 22 May 2021 02:40:08 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:43524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lkLIr-0003jt-1k
 for qemu-devel@nongnu.org; Sat, 22 May 2021 02:40:07 -0400
Received: by mail-pf1-x434.google.com with SMTP id d78so15672956pfd.10
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 23:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OL8N4dCwKEHk6FyV7YEmYTHgBAUHvZ2qPukr+x2bCUk=;
 b=SXofXR/SZHKv/0RCdr0iccM1eEeOVXr671jMrnnccERBIbbd4stMDWZsbellTljur8
 5ZIF2nCjtqXGQR+WotQQY98TCoROWfdWjKooPq6HHnd8jRZSdS195yqdriJXCGSrustl
 wOi00JUYMZT9h7s5WEbCEmgtvUITeZbnR1ybRKOZRHpmTLORQ5PPOlo5yvy+epkHfGo6
 PZzGhqk2xzvGqp7q8fdhyRN2P5srNqZJjzqxuiwOLDsZka9Hl8hM0MU5SgwgHkgzs1sZ
 d5vKXVxzPtXf6yIURh4YgwxiWrjkg01taR4g95+sviQW+X7ASIewgRAW0QiFKTQ3da5T
 vJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OL8N4dCwKEHk6FyV7YEmYTHgBAUHvZ2qPukr+x2bCUk=;
 b=PuJso17kjMiQln6xEIvCjShCtULh1k1rEh2avy33O+mwIMXMg2PnDVxug2ZCI4ydGr
 dBgFYINNo4eG8NVgLuEyUI0oqnwn/xB+flE5yVBZjBqFJrTT7qir//5kc8txSu4z2d81
 VAXbIDqa2wdCrxqNMGQi0JMta4a6n3pfgRngxUZdfa4ggAxNiG/hGWGyMPNsly05SQuD
 Mb0UtvjRitvNZO37RopFaA6iSgGcczYcBsmOWFhEOhA1V+b3UWcfI4TgV1AErT0miHcr
 qx7pKrYpS+kopp4sD4o5R2j0FTU419KIr2/yf1m6K39z5u628uVAef1rN1CobWqbdtdM
 l9zg==
X-Gm-Message-State: AOAM533g0v7Td28kXW067nXytJTbSEyONCPo0O6tB1QP3hIkXHYh5y7U
 DFEFlyAGoJhJrEdnTQAIbQZqRQ==
X-Google-Smtp-Source: ABdhPJwUMzLk4DyBZMpjoj8582f+OBaKlp1F8GgUESZs8s+huSaa7Iip60T2NhCprveyNFvd8ZClog==
X-Received: by 2002:a65:564c:: with SMTP id m12mr2786299pgs.298.1621665602024; 
 Fri, 21 May 2021 23:40:02 -0700 (PDT)
Received: from [192.168.10.23]
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with UTF8SMTPSA id i14sm5783103pfk.130.2021.05.21.23.39.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 23:40:01 -0700 (PDT)
Message-ID: <f6810d77-6748-03f3-7aa2-b54f171a5963@ozlabs.ru>
Date: Sat, 22 May 2021 16:39:57 +1000
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
 <3bfbab31-7c7e-c9c6-f27c-29922f1e3d92@eik.bme.hu>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <3bfbab31-7c7e-c9c6-f27c-29922f1e3d92@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=aik@ozlabs.ru; helo=mail-pf1-x434.google.com
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



On 22/05/2021 05:57, BALATON Zoltan wrote:
> On Fri, 21 May 2021, BALATON Zoltan wrote:
>> On Fri, 21 May 2021, Alexey Kardashevskiy wrote:
>>> On 21/05/2021 07:59, BALATON Zoltan wrote:
>>>> On Thu, 20 May 2021, Alexey Kardashevskiy wrote:
>>>>> The PAPR platform describes an OS environment that's presented by
>>>>> a combination of a hypervisor and firmware. The features it specifies
>>>>> require collaboration between the firmware and the hypervisor.
>>>>>
>>>>> Since the beginning, the runtime component of the firmware (RTAS) has
>>>>> been implemented as a 20 byte shim which simply forwards it to
>>>>> a hypercall implemented in qemu. The boot time firmware component is
>>>>> SLOF - but a build that's specific to qemu, and has always needed 
>>>>> to be
>>>>> updated in sync with it. Even though we've managed to limit the amount
>>>>> of runtime communication we need between qemu and SLOF, there's some,
>>>>> and it has become increasingly awkward to handle as we've implemented
>>>>> new features.
>>>>>
>>>>> This implements a boot time OF client interface (CI) which is
>>>>> enabled by a new "x-vof" pseries machine option (stands for 
>>>>> "Virtual Open
>>>>> Firmware). When enabled, QEMU implements the custom H_OF_CLIENT hcall
>>>>> which implements Open Firmware Client Interface (OF CI). This allows
>>>>> using a smaller stateless firmware which does not have to manage
>>>>> the device tree.
>>>>>
>>>>> The new "vof.bin" firmware image is included with source code under
>>>>> pc-bios/. It also includes RTAS blob.
>>>>>
>>>>> This implements a handful of CI methods just to get -kernel/-initrd
>>>>> working. In particular, this implements the device tree fetching and
>>>>> simple memory allocator - "claim" (an OF CI memory allocator) and 
>>>>> updates
>>>>> "/memory@0/available" to report the client about available memory.
>>>>>
>>>>> This implements changing some device tree properties which we know how
>>>>> to deal with, the rest is ignored. To allow changes, this skips
>>>>> fdt_pack() when x-vof=on as not packing the blob leaves some room for
>>>>> appending.
>>>>>
>>>>> In absence of SLOF, this assigns phandles to device tree nodes to make
>>>>> device tree traversing work.
>>>>>
>>>>> When x-vof=on, this adds "/chosen" every time QEMU (re)builds a tree.
>>>>>
>>>>> This adds basic instances support which are managed by a hash map
>>>>> ihandle -> [phandle].
>>>>>
>>>>> Before the guest started, the used memory is:
>>>>> 0..e60 - the initial firmware
>>>>> 8000..10000 - stack
>>>>> 400000.. - kernel
>>>>> 3ea0000.. - initramdisk
>>>>>
>>>>> This OF CI does not implement "interpret".
>>>>>
>>>>> Unlike SLOF, this does not format uninitialized nvram. Instead, this
>>>>> includes a disk image with pre-formatted nvram.
>>>>>
>>>>> With this basic support, this can only boot into kernel directly.
>>>>> However this is just enough for the petitboot kernel and 
>>>>> initradmdisk to
>>>>> boot from any possible source. Note this requires reasonably recent 
>>>>> guest
>>>>> kernel with:
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=df5be5be8735 
>>>>> The immediate benefit is much faster booting time which especially
>>>>> crucial with fully emulated early CPU bring up environments. Also this
>>>>> may come handy when/if GRUB-in-the-userspace sees light of the day.
>>>>>
>>>>> This separates VOF and sPAPR in a hope that VOF bits may be reused by
>>>>> other POWERPC boards which do not support pSeries.
>>>>>
>>>>> This is coded in assumption that later on we might be adding 
>>>>> support for
>>>>> booting from QEMU backends (blockdev is the first candidate) without
>>>>> devices/drivers in between as OF1275 does not require that and
>>>>> it is quite easy to so.
>>>>>
>>>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>>>> ---
>>>>>
>>>>> The example command line is:
>>>>>
>>>>> /home/aik/pbuild/qemu-killslof-localhost-ppc64/qemu-system-ppc64 \
>>>>> -nodefaults \
>>>>> -chardev stdio,id=STDIO0,signal=off,mux=on \
>>>>> -device spapr-vty,id=svty0,reg=0x71000110,chardev=STDIO0 \
>>>>> -mon id=MON0,chardev=STDIO0,mode=readline \
>>>>> -nographic \
>>>>> -vga none \
>>>>> -enable-kvm \
>>>>> -m 8G \
>>>>> -machine 
>>>>> pseries,x-vof=on,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off 
>>>>> \
>>>>> -kernel pbuild/kernel-le-guest/vmlinux \
>>>>> -initrd pb/rootfs.cpio.xz \
>>>>> -drive 
>>>>> id=DRIVE0,if=none,file=./p/qemu-killslof/pc-bios/vof-nvram.bin,format=raw 
>>>>> \
>>>>> -global spapr-nvram.drive=DRIVE0 \
>>>>> -snapshot \
>>>>> -smp 8,threads=8 \
>>>>> -L /home/aik/t/qemu-ppc64-bios/ \
>>>>> -trace events=qemu_trace_events \
>>>>> -d guest_errors \
>>>>> -chardev socket,id=SOCKET0,server,nowait,path=qemu.mon.tmux26 \
>>>>> -mon chardev=SOCKET0,mode=control
>>>>>
>>>>> ---
>>>>> Changes:
>>>>> v20:
>>>>> * compile vof.bin with -mcpu=power4 for better compatibility
>>>>> * s/std/stw/ in entry.S to make it work on ppc32
>>>>> * fixed dt_available property to support both 32 and 64bit
>>>>> * shuffled prom_args handling code
>>>>> * do not enforce 32bit in MSR (again, to support 32bit platforms)
>>>>>
>>>>
>>>> [...]
>>>>
>>>>> diff --git a/default-configs/devices/ppc64-softmmu.mak 
>>>>> b/default-configs/devices/ppc64-softmmu.mak
>>>>> index ae0841fa3a18..9fb201dfacfa 100644
>>>>> --- a/default-configs/devices/ppc64-softmmu.mak
>>>>> +++ b/default-configs/devices/ppc64-softmmu.mak
>>>>> @@ -9,3 +9,4 @@ CONFIG_POWERNV=y
>>>>>  # For pSeries
>>>>>  CONFIG_PSERIES=y
>>>>>  CONFIG_NVDIMM=y
>>>>> +CONFIG_VOF=y
>>>>> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
>>>>> index e51e0e5e5ac6..964510dfc73d 100644
>>>>> --- a/hw/ppc/Kconfig
>>>>> +++ b/hw/ppc/Kconfig
>>>>> @@ -143,3 +143,6 @@ config FW_CFG_PPC
>>>>>
>>>>>  config FDT_PPC
>>>>>      bool
>>>>> +
>>>>> +config VOF
>>>>> +    bool
>>>>
>>>> I think you should just add "select VOF" to config PSERIES section 
>>>> in Kconfig instead of adding it to 
>>>> default-configs/devices/ppc64-softmmu.mak. 
>>>
>>> oh well, can do that too.
>>
>> I think most config options should be selected by KConfig and the 
>> default config should only include machines, otherwise VOF would be 
>> added also when you don't compile PSERIES or PEGASOS2. With select in 
>> Kconfig it will be added when needed. That's why it's better to use 
>> select in this case.
>>
>>>>  That should do it, it works in my updated pegasos2 patch:
>>>>
>>>> https://osdn.net/projects/qmiga/scm/git/qemu/commits/3c1fad08469b4d3c04def22044e52b2d27774a61 
>>>> [...]
>>>>> diff --git a/pc-bios/vof/entry.S b/pc-bios/vof/entry.S
>>>>> new file mode 100644
>>>>> index 000000000000..569688714c91
>>>>> --- /dev/null
>>>>> +++ b/pc-bios/vof/entry.S
>>>>> @@ -0,0 +1,51 @@
>>>>> +#define LOAD32(rn, name)    \
>>>>> +    lis     rn,name##@h;    \
>>>>> +    ori     rn,rn,name##@l
>>>>> +
>>>>> +#define ENTRY(func_name)    \
>>>>> +    .text;                  \
>>>>> +    .align  2;              \
>>>>> +    .globl  .func_name;     \
>>>>> +    .func_name:             \
>>>>> +    .globl  func_name;      \
>>>>> +    func_name:
>>>>> +
>>>>> +#define KVMPPC_HCALL_BASE       0xf000
>>>>> +#define KVMPPC_H_RTAS           (KVMPPC_HCALL_BASE + 0x0)
>>>>> +#define KVMPPC_H_VOF_CLIENT     (KVMPPC_HCALL_BASE + 0x5)
>>>>> +
>>>>> +    . = 0x100 /* Do exactly as SLOF does */
>>>>> +
>>>>> +ENTRY(_start)
>>>>> +#    LOAD32(%r31, 0) /* Go 32bit mode */
>>>>> +#    mtmsrd %r31,0
>>>>> +    LOAD32(2, __toc_start)
>>>>> +    b entry_c
>>>>> +
>>>>> +ENTRY(_prom_entry)
>>>>> +    LOAD32(2, __toc_start)
>>>>> +    stwu    %r1,-112(%r1)
>>>>> +    stw     %r31,104(%r1)
>>>>> +    mflr    %r31
>>>>> +    bl prom_entry
>>>>> +    nop
>>>>> +    mtlr    %r31
>>>>> +    ld      %r31,104(%r1)
>>>>
>>>> It's getting there, now I see the first client call from the guest 
>>>> boot code but then it crashes on this ld opcode which apparently is 
>>>> 64 bit only:
>>>
>>> Oh right.
>>>
>>>
>>>> Hopefully this is the last such opcode left before I can really test 
>>>> this.
>>>
>>> Make it lwz, and test it?
>>
>> Yes, figured that out too after sending this message. Replacing with 
>> lwz works but I wonder that now you have stwu lwz do the stack offsets 
>> need adjusting too or you just waste 4 bytes now? With lwz here I 
>> found no further 64 bit opcodes and the guest boot code could walk the 
>> device tree. It failed later but I think that's because I'll need to 
>> fill more info about the machine in the device tree. I'll experiment 
>> with that but it looks like it could work at least for MorphOS. I'll 
>> have to try Linux too.
> 
> I was trying to get a linux kernel from a debian powerpc iso to do 
> something (debian before 10.0 has Pegasos support) but I've run into the 
> problem that the kernel is loaded at 0x400000 but the start address is 
> at some offset from that. How do I set qemu,boot-kernel in this case?


The pseries kernel can work from any location (and it relocates itself 
to 0 at some point) even though it is linked at c000.0000.0000.0000, and 
there is no start address offset:

===
 > objdump -D ~/pbuild/kernel-le/vmlinux
/home/aik/pbuild/kernel-le/vmlinux:     file format elf64-powerpcle


Disassembly of section .head.text:

c000000000000000 <__start>:
c000000000000000:       48 00 00 08     tdi     0,r0,72
c000000000000004:       2c 00 00 48     b       c000000000000030 
<__start+0x30>
...
===

Not sure about pegasos2 kernels (or any ppc32 really), sorry.


> Because when I set it to the address/size where the kernel is loaded it 
> jumps to the beginnig not the correct start address. If I set the 
> address to the start address then size will be wrong so I don't know how 
> to set qemu,boot-kernel in this case or is there another property to 
> tell the start address?
> (Vof does not seem to check any other property 
> and seems to assume the entry point is the same as the load address but 
> for this linux kernel it's not.)

I guess if you really need an offset, you'll have to add a new property 
("qemu,boot-kernel-start"?) and look for it in the firmware. Or, say, 
put in gpr5 in your version of spapr_cpu_set_entry_state() and make 
boot_from_memory() use it.


-- 
Alexey

