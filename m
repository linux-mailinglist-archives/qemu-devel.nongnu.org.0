Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 497C738DB20
	for <lists+qemu-devel@lfdr.de>; Sun, 23 May 2021 14:14:44 +0200 (CEST)
Received: from localhost ([::1]:57208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkn0F-0004RC-1c
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 08:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lkmxs-0003XM-T1; Sun, 23 May 2021 08:12:17 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:44217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lkmxo-0005ky-S1; Sun, 23 May 2021 08:12:16 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4FBA174570D;
 Sun, 23 May 2021 14:12:09 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id F36A4745709; Sun, 23 May 2021 14:12:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id F18847456B4;
 Sun, 23 May 2021 14:12:08 +0200 (CEST)
Date: Sun, 23 May 2021 14:12:08 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
In-Reply-To: <1be4a6c5-3177-ef98-bee8-946938d76060@ozlabs.ru>
Message-ID: <a44c2ff8-3ebc-517-1e9-2de5de2c8a5@eik.bme.hu>
References: <20210520090557.435689-1-aik@ozlabs.ru>
 <eb49cd30-a4f4-d063-d728-521446a671a6@eik.bme.hu>
 <5825cde5-a408-a438-116d-5a9d9113a52a@ozlabs.ru>
 <ec1742e3-c47-bbee-3a6-ec64442922ab@eik.bme.hu>
 <3bfbab31-7c7e-c9c6-f27c-29922f1e3d92@eik.bme.hu>
 <f6810d77-6748-03f3-7aa2-b54f171a5963@ozlabs.ru>
 <b7ae1-77f-c65b-2581-195f30169338@eik.bme.hu>
 <1be4a6c5-3177-ef98-bee8-946938d76060@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1223288471-1621771928=:72420"
X-Spam-Probability: 11%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1223288471-1621771928=:72420
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 23 May 2021, Alexey Kardashevskiy wrote:
> On 22/05/2021 23:08, BALATON Zoltan wrote:
>> On Sat, 22 May 2021, Alexey Kardashevskiy wrote:
>>> On 22/05/2021 05:57, BALATON Zoltan wrote:
>>>> On Fri, 21 May 2021, BALATON Zoltan wrote:
>>>>> On Fri, 21 May 2021, Alexey Kardashevskiy wrote:
>>>>>> On 21/05/2021 07:59, BALATON Zoltan wrote:
>>>>>>> On Thu, 20 May 2021, Alexey Kardashevskiy wrote:
>>>>>>>> The PAPR platform describes an OS environment that's presented by
>>>>>>>> a combination of a hypervisor and firmware. The features it specifies
>>>>>>>> require collaboration between the firmware and the hypervisor.
>>>>>>>> 
>>>>>>>> Since the beginning, the runtime component of the firmware (RTAS) has
>>>>>>>> been implemented as a 20 byte shim which simply forwards it to
>>>>>>>> a hypercall implemented in qemu. The boot time firmware component is
>>>>>>>> SLOF - but a build that's specific to qemu, and has always needed to 
>>>>>>>> be
>>>>>>>> updated in sync with it. Even though we've managed to limit the 
>>>>>>>> amount
>>>>>>>> of runtime communication we need between qemu and SLOF, there's some,
>>>>>>>> and it has become increasingly awkward to handle as we've implemented
>>>>>>>> new features.
>>>>>>>> 
>>>>>>>> This implements a boot time OF client interface (CI) which is
>>>>>>>> enabled by a new "x-vof" pseries machine option (stands for "Virtual 
>>>>>>>> Open
>>>>>>>> Firmware). When enabled, QEMU implements the custom H_OF_CLIENT hcall
>>>>>>>> which implements Open Firmware Client Interface (OF CI). This allows
>>>>>>>> using a smaller stateless firmware which does not have to manage
>>>>>>>> the device tree.
>>>>>>>> 
>>>>>>>> The new "vof.bin" firmware image is included with source code under
>>>>>>>> pc-bios/. It also includes RTAS blob.
>>>>>>>> 
>>>>>>>> This implements a handful of CI methods just to get -kernel/-initrd
>>>>>>>> working. In particular, this implements the device tree fetching and
>>>>>>>> simple memory allocator - "claim" (an OF CI memory allocator) and 
>>>>>>>> updates
>>>>>>>> "/memory@0/available" to report the client about available memory.
>>>>>>>> 
>>>>>>>> This implements changing some device tree properties which we know 
>>>>>>>> how
>>>>>>>> to deal with, the rest is ignored. To allow changes, this skips
>>>>>>>> fdt_pack() when x-vof=on as not packing the blob leaves some room for
>>>>>>>> appending.
>>>>>>>> 
>>>>>>>> In absence of SLOF, this assigns phandles to device tree nodes to 
>>>>>>>> make
>>>>>>>> device tree traversing work.
>>>>>>>> 
>>>>>>>> When x-vof=on, this adds "/chosen" every time QEMU (re)builds a tree.
>>>>>>>> 
>>>>>>>> This adds basic instances support which are managed by a hash map
>>>>>>>> ihandle -> [phandle].
>>>>>>>> 
>>>>>>>> Before the guest started, the used memory is:
>>>>>>>> 0..e60 - the initial firmware
>>>>>>>> 8000..10000 - stack
>>>>>>>> 400000.. - kernel
>>>>>>>> 3ea0000.. - initramdisk
>>>>>>>> 
>>>>>>>> This OF CI does not implement "interpret".
>>>>>>>> 
>>>>>>>> Unlike SLOF, this does not format uninitialized nvram. Instead, this
>>>>>>>> includes a disk image with pre-formatted nvram.
>>>>>>>> 
>>>>>>>> With this basic support, this can only boot into kernel directly.
>>>>>>>> However this is just enough for the petitboot kernel and initradmdisk 
>>>>>>>> to
>>>>>>>> boot from any possible source. Note this requires reasonably recent 
>>>>>>>> guest
>>>>>>>> kernel with:
>>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=df5be5be8735 
>>>>>>>> The immediate benefit is much faster booting time which especially
>>>>>>>> crucial with fully emulated early CPU bring up environments. Also 
>>>>>>>> this
>>>>>>>> may come handy when/if GRUB-in-the-userspace sees light of the day.
>>>>>>>> 
>>>>>>>> This separates VOF and sPAPR in a hope that VOF bits may be reused by
>>>>>>>> other POWERPC boards which do not support pSeries.
>>>>>>>> 
>>>>>>>> This is coded in assumption that later on we might be adding support 
>>>>>>>> for
>>>>>>>> booting from QEMU backends (blockdev is the first candidate) without
>>>>>>>> devices/drivers in between as OF1275 does not require that and
>>>>>>>> it is quite easy to so.
>>>>>>>> 
>>>>>>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>>>>>>> ---
>>>>>>>> 
>>>>>>>> The example command line is:
>>>>>>>> 
>>>>>>>> /home/aik/pbuild/qemu-killslof-localhost-ppc64/qemu-system-ppc64 \
>>>>>>>> -nodefaults \
>>>>>>>> -chardev stdio,id=STDIO0,signal=off,mux=on \
>>>>>>>> -device spapr-vty,id=svty0,reg=0x71000110,chardev=STDIO0 \
>>>>>>>> -mon id=MON0,chardev=STDIO0,mode=readline \
>>>>>>>> -nographic \
>>>>>>>> -vga none \
>>>>>>>> -enable-kvm \
>>>>>>>> -m 8G \
>>>>>>>> -machine 
>>>>>>>> pseries,x-vof=on,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off 
>>>>>>>> \
>>>>>>>> -kernel pbuild/kernel-le-guest/vmlinux \
>>>>>>>> -initrd pb/rootfs.cpio.xz \
>>>>>>>> -drive 
>>>>>>>> id=DRIVE0,if=none,file=./p/qemu-killslof/pc-bios/vof-nvram.bin,format=raw 
>>>>>>>> \
>>>>>>>> -global spapr-nvram.drive=DRIVE0 \
>>>>>>>> -snapshot \
>>>>>>>> -smp 8,threads=8 \
>>>>>>>> -L /home/aik/t/qemu-ppc64-bios/ \
>>>>>>>> -trace events=qemu_trace_events \
>>>>>>>> -d guest_errors \
>>>>>>>> -chardev socket,id=SOCKET0,server,nowait,path=qemu.mon.tmux26 \
>>>>>>>> -mon chardev=SOCKET0,mode=control
>>>>>>>> 
>>>>>>>> ---
>>>>>>>> Changes:
>>>>>>>> v20:
>>>>>>>> * compile vof.bin with -mcpu=power4 for better compatibility
>>>>>>>> * s/std/stw/ in entry.S to make it work on ppc32
>>>>>>>> * fixed dt_available property to support both 32 and 64bit
>>>>>>>> * shuffled prom_args handling code
>>>>>>>> * do not enforce 32bit in MSR (again, to support 32bit platforms)
>>>>>>>> 
>>>>>>> 
>>>>>>> [...]
>>>>>>> 
>>>>>>>> diff --git a/default-configs/devices/ppc64-softmmu.mak 
>>>>>>>> b/default-configs/devices/ppc64-softmmu.mak
>>>>>>>> index ae0841fa3a18..9fb201dfacfa 100644
>>>>>>>> --- a/default-configs/devices/ppc64-softmmu.mak
>>>>>>>> +++ b/default-configs/devices/ppc64-softmmu.mak
>>>>>>>> @@ -9,3 +9,4 @@ CONFIG_POWERNV=y
>>>>>>>>  # For pSeries
>>>>>>>>  CONFIG_PSERIES=y
>>>>>>>>  CONFIG_NVDIMM=y
>>>>>>>> +CONFIG_VOF=y
>>>>>>>> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
>>>>>>>> index e51e0e5e5ac6..964510dfc73d 100644
>>>>>>>> --- a/hw/ppc/Kconfig
>>>>>>>> +++ b/hw/ppc/Kconfig
>>>>>>>> @@ -143,3 +143,6 @@ config FW_CFG_PPC
>>>>>>>> 
>>>>>>>>  config FDT_PPC
>>>>>>>>      bool
>>>>>>>> +
>>>>>>>> +config VOF
>>>>>>>> +    bool
>>>>>>> 
>>>>>>> I think you should just add "select VOF" to config PSERIES section in 
>>>>>>> Kconfig instead of adding it to 
>>>>>>> default-configs/devices/ppc64-softmmu.mak. 
>>>>>> 
>>>>>> oh well, can do that too.
>>>>> 
>>>>> I think most config options should be selected by KConfig and the 
>>>>> default config should only include machines, otherwise VOF would be 
>>>>> added also when you don't compile PSERIES or PEGASOS2. With select in 
>>>>> Kconfig it will be added when needed. That's why it's better to use 
>>>>> select in this case.
>>>>> 
>>>>>>>  That should do it, it works in my updated pegasos2 patch:
>>>>>>> 
>>>>>>> https://osdn.net/projects/qmiga/scm/git/qemu/commits/3c1fad08469b4d3c04def22044e52b2d27774a61 
>>>>>>> [...]
>>>>>>>> diff --git a/pc-bios/vof/entry.S b/pc-bios/vof/entry.S
>>>>>>>> new file mode 100644
>>>>>>>> index 000000000000..569688714c91
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/pc-bios/vof/entry.S
>>>>>>>> @@ -0,0 +1,51 @@
>>>>>>>> +#define LOAD32(rn, name)    \
>>>>>>>> +    lis     rn,name##@h;    \
>>>>>>>> +    ori     rn,rn,name##@l
>>>>>>>> +
>>>>>>>> +#define ENTRY(func_name)    \
>>>>>>>> +    .text;                  \
>>>>>>>> +    .align  2;              \
>>>>>>>> +    .globl  .func_name;     \
>>>>>>>> +    .func_name:             \
>>>>>>>> +    .globl  func_name;      \
>>>>>>>> +    func_name:
>>>>>>>> +
>>>>>>>> +#define KVMPPC_HCALL_BASE       0xf000
>>>>>>>> +#define KVMPPC_H_RTAS           (KVMPPC_HCALL_BASE + 0x0)
>>>>>>>> +#define KVMPPC_H_VOF_CLIENT     (KVMPPC_HCALL_BASE + 0x5)
>>>>>>>> +
>>>>>>>> +    . = 0x100 /* Do exactly as SLOF does */
>>>>>>>> +
>>>>>>>> +ENTRY(_start)
>>>>>>>> +#    LOAD32(%r31, 0) /* Go 32bit mode */
>>>>>>>> +#    mtmsrd %r31,0
>>>>>>>> +    LOAD32(2, __toc_start)
>>>>>>>> +    b entry_c
>>>>>>>> +
>>>>>>>> +ENTRY(_prom_entry)
>>>>>>>> +    LOAD32(2, __toc_start)
>>>>>>>> +    stwu    %r1,-112(%r1)
>>>>>>>> +    stw     %r31,104(%r1)
>>>>>>>> +    mflr    %r31
>>>>>>>> +    bl prom_entry
>>>>>>>> +    nop
>>>>>>>> +    mtlr    %r31
>>>>>>>> +    ld      %r31,104(%r1)
>>>>>>> 
>>>>>>> It's getting there, now I see the first client call from the guest 
>>>>>>> boot code but then it crashes on this ld opcode which apparently is 64 
>>>>>>> bit only:
>>>>>> 
>>>>>> Oh right.
>>>>>> 
>>>>>> 
>>>>>>> Hopefully this is the last such opcode left before I can really test 
>>>>>>> this.
>>>>>> 
>>>>>> Make it lwz, and test it?
>>>>> 
>>>>> Yes, figured that out too after sending this message. Replacing with lwz 
>>>>> works but I wonder that now you have stwu lwz do the stack offsets need 
>>>>> adjusting too or you just waste 4 bytes now? With lwz here I found no 
>>>>> further 64 bit opcodes and the guest boot code could walk the device 
>>>>> tree. It failed later but I think that's because I'll need to fill more 
>>>>> info about the machine in the device tree. I'll experiment with that but 
>>>>> it looks like it could work at least for MorphOS. I'll have to try Linux 
>>>>> too.
>>>> 
>>>> I was trying to get a linux kernel from a debian powerpc iso to do 
>>>> something (debian before 10.0 has Pegasos support) but I've run into the 
>>>> problem that the kernel is loaded at 0x400000 but the start address is at 
>>>> some offset from that. How do I set qemu,boot-kernel in this case?
>>> 
>>> 
>>> The pseries kernel can work from any location (and it relocates itself to 
>>> 0 at some point) even though it is linked at c000.0000.0000.0000, and 
>>> there is no start address offset:
>>> 
>>> ===
>>>> objdump -D ~/pbuild/kernel-le/vmlinux
>>> /home/aik/pbuild/kernel-le/vmlinux:     file format elf64-powerpcle
>>> 
>>> 
>>> Disassembly of section .head.text:
>>> 
>>> c000000000000000 <__start>:
>>> c000000000000000:       48 00 00 08     tdi     0,r0,72
>>> c000000000000004:       2c 00 00 48     b       c000000000000030 
>>> <__start+0x30>
>>> ...
>>> ===
>>> 
>>> Not sure about pegasos2 kernels (or any ppc32 really), sorry.
>> 
>> The kernel from Debian 10.0 powerpc used on pegasos looks like this:
>> 
>> vmlinuz-chrp.initrd:     file format elf32-powerpc
>> vmlinuz-chrp.initrd
>> architecture: powerpc:common, flags 0x00000112:
>> EXEC_P, HAS_SYMS, D_PAGED
>> start address 0x004002fc
>> 
>> Program Header:
>>      LOAD off    0x00010000 vaddr 0x00400000 paddr 0x00400000 align 2**16
>>           filesz 0x0127b72a memsz 0x0127d5d8 flags rwx
>>     STACK off    0x00000000 vaddr 0x00000000 paddr 0x00000000 align 2**4
>>           filesz 0x00000000 memsz 0x00000000 flags rwx
>>      NOTE off    0x000000b4 vaddr 0x00000000 paddr 0x00000000 align 2**0
>>           filesz 0x0000002c memsz 0x00000000 flags ---
>>      NOTE off    0x000000e0 vaddr 0x00000000 paddr 0x00000000 align 2**0
>>           filesz 0x0000002c memsz 0x00000000 flags ---
>> 
>> Sections:
>> Idx Name          Size      VMA       LMA       File off  Algn
>>    0 .text         00008588  00400000  00400000  00010000  2**2
>>                    CONTENTS, ALLOC, LOAD, READONLY, CODE
>>    1 .text.unlikely 00000078  00408588  00408588  00018588  2**2
>>                    CONTENTS, ALLOC, LOAD, READONLY, CODE
>>    2 .data         00001bec  00409000  00409000  00019000  2**2
>>                    CONTENTS, ALLOC, LOAD, DATA
>>    3 .got          0000000c  0040abec  0040abec  0001abec  2**2
>>                    CONTENTS, ALLOC, LOAD, DATA
>>    4 __builtin_cmdline 00000800  0040abf8  0040abf8  0001abf8  2**2
>>                    CONTENTS, ALLOC, LOAD, DATA
>>    5 .kernel:vmlinux.strip 0047658e  0040c000  0040c000  0001c000  2**0
>>                    CONTENTS, ALLOC, LOAD, READONLY, DATA
>>    6 .kernel:initrd 00df872a  00883000  00883000  00493000  2**0
>>                    CONTENTS, ALLOC, LOAD, READONLY, DATA
>>    7 .bss          000015d8  0167c000  0167c000  0128b72a  2**2
>>                    ALLOC
>>    8 .debug_info   0000e7fd  00000000  00000000  0128b72a  2**0
>>                    CONTENTS, READONLY, DEBUGGING
>>    9 .debug_abbrev 00002a4f  00000000  00000000  01299f27  2**0
>>                    CONTENTS, READONLY, DEBUGGING
>>   10 .debug_loc    00009df1  00000000  00000000  0129c976  2**0
>>                    CONTENTS, READONLY, DEBUGGING
>>   11 .debug_aranges 00000250  00000000  00000000  012a6767  2**0
>>                    CONTENTS, READONLY, DEBUGGING
>>   12 .debug_line   000026b8  00000000  00000000  012a69b7  2**0
>>                    CONTENTS, READONLY, DEBUGGING
>>   13 .debug_str    00001d9c  00000000  00000000  012a906f  2**0
>>                    CONTENTS, READONLY, DEBUGGING
>>   14 .comment      0000001d  00000000  00000000  012aae0b  2**0
>>                    CONTENTS, READONLY
>>   15 .gnu.attributes 00000010  00000000  00000000  012aae28  2**0
>>                    CONTENTS, READONLY
>>   16 .debug_frame  00001c88  00000000  00000000  012aae38  2**2
>>                    CONTENTS, READONLY, DEBUGGING
>>   17 .debug_ranges 00000740  00000000  00000000  012acac0  2**0
>>                    CONTENTS, READONLY, DEBUGGING
>> 
>> It even seems to have the initrd embedded in it. If I just use 0x400000 as 
>> start address it does not work, has to jump to the start address for it to 
>> start correctly.
>> 
>>>> Because when I set it to the address/size where the kernel is loaded it 
>>>> jumps to the beginnig not the correct start address. If I set the address 
>>>> to the start address then size will be wrong so I don't know how to set 
>>>> qemu,boot-kernel in this case or is there another property to tell the 
>>>> start address?
>>>> (Vof does not seem to check any other property and seems to assume the 
>>>> entry point is the same as the load address but for this linux kernel 
>>>> it's not.)
>>> 
>>> I guess if you really need an offset, you'll have to add a new property 
>>> ("qemu,boot-kernel-start"?) and look for it in the firmware. Or, say, put 
>>> in gpr5 in your version of spapr_cpu_set_entry_state() and make 
>>> boot_from_memory() use it.
>> 
>> Either way would work but I don't want to recompile vof.bin so if you 
>
> I really do not want to add features with no user for it; and having this 
> added with pegasos2 support make it clear why it is there. Also recompile is 
> really simple :)

Provided you have a cross compiler set up and do not run into problems 
you've mentioned before. So I'd prefer to not increase the source of bugs 
by also modifying VOF. This is not only for pegasos2. An ELF file does not 
necessarily have the entry point equal to its load address so while you 
happen to have a kernel that does that now you could have another later 
that won't so supporting it in some way would be the right thing to do 
anyway. Also I can't decide what is better, using a gpr or a device tree 
property so whatever you prefer. You probably need a respin anyway so 
adding it to that seems to be simpler than for me to try starting 
compiling and testing VOF too (also I can't test with spapr so can't make 
sure the changes I make won't break something). So you seem to be a better 
position for VOF changes. I think I only need these:

1. Get rid of the ld 64 bit opcode in _prom_entry
2. Support ELF with entry point != load address
3. Have a way to disable ci_entry after quiesce so it won't do sc 1 that 
would generate exception in my case otherwise or ignore that exception 
within VOF.

I think other issues have been already resolved with your latest patch 
version unless I forgot something.

Regards,
BALATON Zoltan
--3866299591-1223288471-1621771928=:72420--

