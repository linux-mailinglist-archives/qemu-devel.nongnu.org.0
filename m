Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A6238D3E2
	for <lists+qemu-devel@lfdr.de>; Sat, 22 May 2021 08:23:19 +0200 (CEST)
Received: from localhost ([::1]:44924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkL2c-0004Es-AD
	for lists+qemu-devel@lfdr.de; Sat, 22 May 2021 02:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lkL1f-0003OW-36
 for qemu-devel@nongnu.org; Sat, 22 May 2021 02:22:19 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:35501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lkL1b-0005dQ-RW
 for qemu-devel@nongnu.org; Sat, 22 May 2021 02:22:18 -0400
Received: by mail-pg1-x532.google.com with SMTP id m190so15958575pga.2
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 23:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QcOw7qFyfxbLgpnX7KrYkTQlHJTSG9jur2cbXDYv5t4=;
 b=AICyU65o20ALegKlp1p0YtXevE8c3GOBtDNYQgam+68fOAPUys9cQ5lxpDe+1W+t86
 O0bz7yzbazbjNmCNhj5TOf3gAZsIwOil0fhTsGleO9UmtQXfLwxx+BIcfhL+ArWgD9ef
 406YOcOvMVZ2vf7AgGVvxeLCfnkhe7/vdJYRJEBYnHfDBCyvCa621feY+RYVKAOeDbXW
 IPK1Njg5SfMIMA8HhHaY5a7cwOuhfw2lZG+Dw1rYO97qe4LQtNOLdLu8e5pCflO7tFJ9
 Kvnf8zjvvmFz22ucexvKesFFjTCiZ5EPJWAZAMG8XXkguKpKpS4UpdB/VEyk+FHa+MI1
 /5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QcOw7qFyfxbLgpnX7KrYkTQlHJTSG9jur2cbXDYv5t4=;
 b=P5cDB0ZykGTH9DRxV8LWe05jzghD309gMsCvL8w0s0giYi4aF+0lA+xCzEWHyekGP7
 bSoS3bocWf894GIm6GZ74RZsqpVrP00J7FfpBQQrgCO1wYuGvyAa/8DiS2ApkKhsP9cz
 a+SA+dUkwj7xQFDB4SCZLoBLVFAO5Cv9JzxvXkEu0LM7WsFiHDELdkleFKYFnLFg1mkN
 SPa+MaJCqbIipUgZgGIwOVMrX3MwvO7F3IDoS7/y5DcNyy4GLCC5fGyO5OrcZqOkapKu
 mgKoF5cG4WYaUxFEopm6JTq1/XB04gtmZ7ZhBnagJSsYAD7SvjsHohejdWJ3J6+igdYz
 vfjA==
X-Gm-Message-State: AOAM531kCjuauQ3ihD8qw9Td8YN4WmTHCYlMJ5C7qBBzGI9TUn4BFzHV
 KIdSBDcC/4YMp85UtJQWoQB+Zw==
X-Google-Smtp-Source: ABdhPJzLoPGgrltdAJweHhJtEqiC0SpI/HBBOVV7ke42x3QwHf2W5mJYdC8u2lWC6qkee9iTjDE41Q==
X-Received: by 2002:a63:9612:: with SMTP id c18mr2682860pge.29.1621664532001; 
 Fri, 21 May 2021 23:22:12 -0700 (PDT)
Received: from [192.168.10.23]
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with UTF8SMTPSA id o186sm5625338pfg.170.2021.05.21.23.22.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 23:22:11 -0700 (PDT)
Message-ID: <8527c8d2-c1e7-b3f8-0bda-529ba3864701@ozlabs.ru>
Date: Sat, 22 May 2021 16:22:06 +1000
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
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <ec1742e3-c47-bbee-3a6-ec64442922ab@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=aik@ozlabs.ru; helo=mail-pg1-x532.google.com
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



On 21/05/2021 19:05, BALATON Zoltan wrote:
> On Fri, 21 May 2021, Alexey Kardashevskiy wrote:
>> On 21/05/2021 07:59, BALATON Zoltan wrote:
>>> On Thu, 20 May 2021, Alexey Kardashevskiy wrote:
>>>> The PAPR platform describes an OS environment that's presented by
>>>> a combination of a hypervisor and firmware. The features it specifies
>>>> require collaboration between the firmware and the hypervisor.
>>>>
>>>> Since the beginning, the runtime component of the firmware (RTAS) has
>>>> been implemented as a 20 byte shim which simply forwards it to
>>>> a hypercall implemented in qemu. The boot time firmware component is
>>>> SLOF - but a build that's specific to qemu, and has always needed to be
>>>> updated in sync with it. Even though we've managed to limit the amount
>>>> of runtime communication we need between qemu and SLOF, there's some,
>>>> and it has become increasingly awkward to handle as we've implemented
>>>> new features.
>>>>
>>>> This implements a boot time OF client interface (CI) which is
>>>> enabled by a new "x-vof" pseries machine option (stands for "Virtual 
>>>> Open
>>>> Firmware). When enabled, QEMU implements the custom H_OF_CLIENT hcall
>>>> which implements Open Firmware Client Interface (OF CI). This allows
>>>> using a smaller stateless firmware which does not have to manage
>>>> the device tree.
>>>>
>>>> The new "vof.bin" firmware image is included with source code under
>>>> pc-bios/. It also includes RTAS blob.
>>>>
>>>> This implements a handful of CI methods just to get -kernel/-initrd
>>>> working. In particular, this implements the device tree fetching and
>>>> simple memory allocator - "claim" (an OF CI memory allocator) and 
>>>> updates
>>>> "/memory@0/available" to report the client about available memory.
>>>>
>>>> This implements changing some device tree properties which we know how
>>>> to deal with, the rest is ignored. To allow changes, this skips
>>>> fdt_pack() when x-vof=on as not packing the blob leaves some room for
>>>> appending.
>>>>
>>>> In absence of SLOF, this assigns phandles to device tree nodes to make
>>>> device tree traversing work.
>>>>
>>>> When x-vof=on, this adds "/chosen" every time QEMU (re)builds a tree.
>>>>
>>>> This adds basic instances support which are managed by a hash map
>>>> ihandle -> [phandle].
>>>>
>>>> Before the guest started, the used memory is:
>>>> 0..e60 - the initial firmware
>>>> 8000..10000 - stack
>>>> 400000.. - kernel
>>>> 3ea0000.. - initramdisk
>>>>
>>>> This OF CI does not implement "interpret".
>>>>
>>>> Unlike SLOF, this does not format uninitialized nvram. Instead, this
>>>> includes a disk image with pre-formatted nvram.
>>>>
>>>> With this basic support, this can only boot into kernel directly.
>>>> However this is just enough for the petitboot kernel and 
>>>> initradmdisk to
>>>> boot from any possible source. Note this requires reasonably recent 
>>>> guest
>>>> kernel with:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=df5be5be8735 
>>>>
>>>> The immediate benefit is much faster booting time which especially
>>>> crucial with fully emulated early CPU bring up environments. Also this
>>>> may come handy when/if GRUB-in-the-userspace sees light of the day.
>>>>
>>>> This separates VOF and sPAPR in a hope that VOF bits may be reused by
>>>> other POWERPC boards which do not support pSeries.
>>>>
>>>> This is coded in assumption that later on we might be adding support 
>>>> for
>>>> booting from QEMU backends (blockdev is the first candidate) without
>>>> devices/drivers in between as OF1275 does not require that and
>>>> it is quite easy to so.
>>>>
>>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>>> ---
>>>>
>>>> The example command line is:
>>>>
>>>> /home/aik/pbuild/qemu-killslof-localhost-ppc64/qemu-system-ppc64 \
>>>> -nodefaults \
>>>> -chardev stdio,id=STDIO0,signal=off,mux=on \
>>>> -device spapr-vty,id=svty0,reg=0x71000110,chardev=STDIO0 \
>>>> -mon id=MON0,chardev=STDIO0,mode=readline \
>>>> -nographic \
>>>> -vga none \
>>>> -enable-kvm \
>>>> -m 8G \
>>>> -machine 
>>>> pseries,x-vof=on,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off 
>>>> \
>>>> -kernel pbuild/kernel-le-guest/vmlinux \
>>>> -initrd pb/rootfs.cpio.xz \
>>>> -drive 
>>>> id=DRIVE0,if=none,file=./p/qemu-killslof/pc-bios/vof-nvram.bin,format=raw 
>>>> \
>>>> -global spapr-nvram.drive=DRIVE0 \
>>>> -snapshot \
>>>> -smp 8,threads=8 \
>>>> -L /home/aik/t/qemu-ppc64-bios/ \
>>>> -trace events=qemu_trace_events \
>>>> -d guest_errors \
>>>> -chardev socket,id=SOCKET0,server,nowait,path=qemu.mon.tmux26 \
>>>> -mon chardev=SOCKET0,mode=control
>>>>
>>>> ---
>>>> Changes:
>>>> v20:
>>>> * compile vof.bin with -mcpu=power4 for better compatibility
>>>> * s/std/stw/ in entry.S to make it work on ppc32
>>>> * fixed dt_available property to support both 32 and 64bit
>>>> * shuffled prom_args handling code
>>>> * do not enforce 32bit in MSR (again, to support 32bit platforms)
>>>>
>>>
>>> [...]
>>>
>>>> diff --git a/default-configs/devices/ppc64-softmmu.mak 
>>>> b/default-configs/devices/ppc64-softmmu.mak
>>>> index ae0841fa3a18..9fb201dfacfa 100644
>>>> --- a/default-configs/devices/ppc64-softmmu.mak
>>>> +++ b/default-configs/devices/ppc64-softmmu.mak
>>>> @@ -9,3 +9,4 @@ CONFIG_POWERNV=y
>>>>  # For pSeries
>>>>  CONFIG_PSERIES=y
>>>>  CONFIG_NVDIMM=y
>>>> +CONFIG_VOF=y
>>>> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
>>>> index e51e0e5e5ac6..964510dfc73d 100644
>>>> --- a/hw/ppc/Kconfig
>>>> +++ b/hw/ppc/Kconfig
>>>> @@ -143,3 +143,6 @@ config FW_CFG_PPC
>>>>
>>>>  config FDT_PPC
>>>>      bool
>>>> +
>>>> +config VOF
>>>> +    bool
>>>
>>> I think you should just add "select VOF" to config PSERIES section in 
>>> Kconfig instead of adding it to 
>>> default-configs/devices/ppc64-softmmu.mak. 
>>
>> oh well, can do that too.
> 
> I think most config options should be selected by KConfig and the 
> default config should only include machines, otherwise VOF would be 
> added also when you don't compile PSERIES or PEGASOS2. With select in 
> Kconfig it will be added when needed. That's why it's better to use 
> select in this case.
> 
>>>  That should do it, it works in my updated pegasos2 patch:
>>>
>>> https://osdn.net/projects/qmiga/scm/git/qemu/commits/3c1fad08469b4d3c04def22044e52b2d27774a61 
>>>
>>> [...]
>>>> diff --git a/pc-bios/vof/entry.S b/pc-bios/vof/entry.S
>>>> new file mode 100644
>>>> index 000000000000..569688714c91
>>>> --- /dev/null
>>>> +++ b/pc-bios/vof/entry.S
>>>> @@ -0,0 +1,51 @@
>>>> +#define LOAD32(rn, name)    \
>>>> +    lis     rn,name##@h;    \
>>>> +    ori     rn,rn,name##@l
>>>> +
>>>> +#define ENTRY(func_name)    \
>>>> +    .text;                  \
>>>> +    .align  2;              \
>>>> +    .globl  .func_name;     \
>>>> +    .func_name:             \
>>>> +    .globl  func_name;      \
>>>> +    func_name:
>>>> +
>>>> +#define KVMPPC_HCALL_BASE       0xf000
>>>> +#define KVMPPC_H_RTAS           (KVMPPC_HCALL_BASE + 0x0)
>>>> +#define KVMPPC_H_VOF_CLIENT     (KVMPPC_HCALL_BASE + 0x5)
>>>> +
>>>> +    . = 0x100 /* Do exactly as SLOF does */
>>>> +
>>>> +ENTRY(_start)
>>>> +#    LOAD32(%r31, 0) /* Go 32bit mode */
>>>> +#    mtmsrd %r31,0
>>>> +    LOAD32(2, __toc_start)
>>>> +    b entry_c
>>>> +
>>>> +ENTRY(_prom_entry)
>>>> +    LOAD32(2, __toc_start)
>>>> +    stwu    %r1,-112(%r1)
>>>> +    stw     %r31,104(%r1)
>>>> +    mflr    %r31
>>>> +    bl prom_entry
>>>> +    nop
>>>> +    mtlr    %r31
>>>> +    ld      %r31,104(%r1)
>>>
>>> It's getting there, now I see the first client call from the guest 
>>> boot code but then it crashes on this ld opcode which apparently is 
>>> 64 bit only:
>>
>> Oh right.
>>
>>
>>> Hopefully this is the last such opcode left before I can really test 
>>> this.
>>
>> Make it lwz, and test it?
> 
> Yes, figured that out too after sending this message. Replacing with lwz 
> works but I wonder that now you have stwu lwz do the stack offsets need 
> adjusting too or you just waste 4 bytes now?

Well, this assumes the 64bit client and that ABI. I think ideally the 
firmware is supposed to use its own stack but I did not bother here. I 
do not know 32bit ABI at all so say whether the existing code should 
just work or not :-/


> With lwz here I found no 
> further 64 bit opcodes and the guest boot code could walk the device 
> tree. It failed later but I think that's because I'll need to fill more 
> info about the machine in the device tree. I'll experiment with that but 
> it looks like it could work at least for MorphOS. I'll have to try Linux 
> too.


There are plenty of tracepoints, enable them all.

> 
>>> Do you have some info on how the stdout works in VOF? I think I'll 
>>> need that to test with Linux and get output but I'm not sure what's 
>>> needed on the machine side.
>>
>> VOF opens stsout and stores the ihandle (in fdt) which the client 
>> (==kernel) uses for writing. To make it work properly, you need to 
>> hook up that instance to a device backend similar to what I have for 
>> spapr-vty:
>>
>> https://github.com/aik/qemu/commit/a381a5b50c23c74013e2bd39cc5dad5b6385965d 
>>
>>
>> This is not a part of this patch as I'm trying to keep things simpler 
>> and accessing backends from VOF is still unsettled. But there is a 
>> workaround which  is trace_vof_write, I use this. Thanks,
> 
> The above patch is about stdin but stdout seems to be added by the 
> current vof patch. What is spapr-vty?

It is pseries' paravirtual serial device, pegasos does not have it.

> I don't think I have something 
> similar in pegasos2 where I just have a normal serial port created by 
> ISASuperIO in the vt8231 model.

Correct.

> Can I use that backend somehow or have 
> to create some other serial device to connect to stdout?
> Does 
> trace_vof_write work for stuff output by the guest?
> I guess that's only 
> for things printed by VOF itself

VOF itself does not prints anything in this patch.

> but to see Linux output do I need a 
> stdout in VOF 
> or it will just open the serial with its own driver and 
> use that?
> So I'm not sure what's the stdout parts in the current vof 
> patch does and if I need that for anything. I'll try to experiment with 
> it some more but fixing the ld and Kconfig seems to be enough to get it 
> work for me.

So for the client to print something, /chosen/stdout needs to have a 
valid ihandle.
The only way to get a valid ihandle is having a valid phandle which 
vof_client_open() can open.
A valid phandle is a phandle of any node in the device tree. On spapr we 
pick some spapr-vty, open it and store in /chosen/stdout.

 From this point output from the client can be seen via a tracepoint.

Now if we want proper output without tracepoints - we need to hook it up 
with some chardev backend (not a device such a vt8231 or spapr-vty but 
backend).

https://github.com/aik/qemu/commit/a381a5b50c23c74013e2bd3 does this:
1. when a phandle is open, QEMU will search for DeviceState* for the 
specific FDT node and get a chardev from the device.
2. when write() is called, QEMU calls qemu_chr_fe_write_all() on chardev 
from 1.

 From this point you do not need a tracepoint and the output will 
appears in the console you set up for stdout.

Now if you want input from this console, things get tricky. First, on 
powernv/pseries we only need this for grub as otherwise the kernel has 
all the drivers needed and will not use the client interface. For the 
grub, we need to provide a valid ihandle for /chosen/stdin which is easy 
but implementing read() on this is not as there is no simple 
device-type-independend way of reading from chardev. I hacked it for 
spapr-tvy but other serial devices will need special handling, or we'll 
have to introduce some VOF_SERIAL_READ interface for those which will 
face opposition :)

Makes sense?

-- 
Alexey

