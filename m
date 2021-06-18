Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434473AC89F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 12:14:48 +0200 (CEST)
Received: from localhost ([::1]:60428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luBWR-00008I-BY
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 06:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1luBVe-0007hR-GV; Fri, 18 Jun 2021 06:13:58 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:59121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1luBVW-0007A2-HR; Fri, 18 Jun 2021 06:13:57 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 88F9E7462DB;
 Fri, 18 Jun 2021 12:13:45 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0AD3674581E; Fri, 18 Jun 2021 12:13:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 08ACD7457EF;
 Fri, 18 Jun 2021 12:13:45 +0200 (CEST)
Date: Fri, 18 Jun 2021 12:13:45 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v21] spapr: Implement Open Firmware client interface
In-Reply-To: <5082f436-1e36-05f7-5b7a-0b190351ffbb@ozlabs.ru>
Message-ID: <d673149d-39b-6ecd-875c-d2f1ff6020@eik.bme.hu>
References: <20210615070612.22679-1-aik@ozlabs.ru>
 <8987bd7c-dfe1-cb73-e388-ae26ed5a69@eik.bme.hu>
 <1200c803-a397-78cf-2180-5b21dc0839f1@ozlabs.ru>
 <7c7b75a1-d849-ca66-75d3-f9919366b95d@eik.bme.hu>
 <274ae416-3af0-65f3-c30c-0681ad9716a1@ozlabs.ru>
 <33b662dc-6a97-6e61-c17-c21a4a44d8fb@eik.bme.hu>
 <c680d69c-7dfc-fec5-031c-403a19e7050c@ozlabs.ru>
 <48f4473-3f44-4b6-7bf2-a8381fa8268e@eik.bme.hu>
 <5082f436-1e36-05f7-5b7a-0b190351ffbb@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-831411349-1624011225=:20078"
X-Spam-Probability: 11%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-831411349-1624011225=:20078
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 18 Jun 2021, Alexey Kardashevskiy wrote:
> On 6/17/21 21:29, BALATON Zoltan wrote:
>> On Thu, 17 Jun 2021, Alexey Kardashevskiy wrote:
>>> On 17/06/2021 19:16, BALATON Zoltan wrote:
>>>> On Thu, 17 Jun 2021, Alexey Kardashevskiy wrote:
>>>>> On 16/06/2021 20:34, BALATON Zoltan wrote:
>>>>>> On Wed, 16 Jun 2021, Alexey Kardashevskiy wrote:
>>>>>>> On 6/15/21 20:29, BALATON Zoltan wrote:
>>>>>>>> On Tue, 15 Jun 2021, Alexey Kardashevskiy wrote:
>>>>>>>>> The PAPR platform describes an OS environment that's presented by
>>>>>>>>> a combination of a hypervisor and firmware. The features it 
>>>>>>>>> specifies
>>>>>>>>> require collaboration between the firmware and the hypervisor.
>>>>>>>>> 
>>>>>>>>> Since the beginning, the runtime component of the firmware (RTAS) 
>>>>>>>>> has
>>>>>>>>> been implemented as a 20 byte shim which simply forwards it to
>>>>>>>>> a hypercall implemented in qemu. The boot time firmware component is
>>>>>>>>> SLOF - but a build that's specific to qemu, and has always needed to 
>>>>>>>>> be
>>>>>>>>> updated in sync with it. Even though we've managed to limit the 
>>>>>>>>> amount
>>>>>>>>> of runtime communication we need between qemu and SLOF, there's 
>>>>>>>>> some,
>>>>>>>>> and it has become increasingly awkward to handle as we've 
>>>>>>>>> implemented
>>>>>>>>> new features.
>>>>>>>>> 
>>>>>>>>> This implements a boot time OF client interface (CI) which is
>>>>>>>>> enabled by a new "x-vof" pseries machine option (stands for "Virtual 
>>>>>>>>> Open
>>>>>>>>> Firmware). When enabled, QEMU implements the custom H_OF_CLIENT 
>>>>>>>>> hcall
>>>>>>>>> which implements Open Firmware Client Interface (OF CI). This allows
>>>>>>>>> using a smaller stateless firmware which does not have to manage
>>>>>>>>> the device tree.
>>>>>>>>> 
>>>>>>>>> The new "vof.bin" firmware image is included with source code under
>>>>>>>>> pc-bios/. It also includes RTAS blob.
>>>>>>>>> 
>>>>>>>>> This implements a handful of CI methods just to get -kernel/-initrd
>>>>>>>>> working. In particular, this implements the device tree fetching and
>>>>>>>>> simple memory allocator - "claim" (an OF CI memory allocator) and 
>>>>>>>>> updates
>>>>>>>>> "/memory@0/available" to report the client about available memory.
>>>>>>>>> 
>>>>>>>>> This implements changing some device tree properties which we know 
>>>>>>>>> how
>>>>>>>>> to deal with, the rest is ignored. To allow changes, this skips
>>>>>>>>> fdt_pack() when x-vof=on as not packing the blob leaves some room 
>>>>>>>>> for
>>>>>>>>> appending.
>>>>>>>>> 
>>>>>>>>> In absence of SLOF, this assigns phandles to device tree nodes to 
>>>>>>>>> make
>>>>>>>>> device tree traversing work.
>>>>>>>>> 
>>>>>>>>> When x-vof=on, this adds "/chosen" every time QEMU (re)builds a 
>>>>>>>>> tree.
>>>>>>>>> 
>>>>>>>>> This adds basic instances support which are managed by a hash map
>>>>>>>>> ihandle -> [phandle].
>>>>>>>>> 
>>>>>>>>> Before the guest started, the used memory is:
>>>>>>>>> 0..e60 - the initial firmware
>>>>>>>>> 8000..10000 - stack
>>>>>>>>> 400000.. - kernel
>>>>>>>>> 3ea0000.. - initramdisk
>>>>>>>>> 
>>>>>>>>> This OF CI does not implement "interpret".
>>>>>>>>> 
>>>>>>>>> Unlike SLOF, this does not format uninitialized nvram. Instead, this
>>>>>>>>> includes a disk image with pre-formatted nvram.
>>>>>>>>> 
>>>>>>>>> With this basic support, this can only boot into kernel directly.
>>>>>>>>> However this is just enough for the petitboot kernel and 
>>>>>>>>> initradmdisk to
>>>>>>>>> boot from any possible source. Note this requires reasonably recent 
>>>>>>>>> guest
>>>>>>>>> kernel with:
>>>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=df5be5be8735 
>>>>>>>>> The immediate benefit is much faster booting time which especially
>>>>>>>>> crucial with fully emulated early CPU bring up environments. Also 
>>>>>>>>> this
>>>>>>>>> may come handy when/if GRUB-in-the-userspace sees light of the day.
>>>>>>>>> 
>>>>>>>>> This separates VOF and sPAPR in a hope that VOF bits may be reused 
>>>>>>>>> by
>>>>>>>>> other POWERPC boards which do not support pSeries.
>>>>>>>>> 
>>>>>>>>> This make VOF optional, it is disabled by default, add --enable-vof
>>>>>>>>> to ./configure to enable it.
>>>>>>>>> 
>>>>>>>>> This assumes potential support for booting from QEMU backends
>>>>>>>>> such as blockdev or netdev without devices/drivers used.
>>>>>>>>> 
>>>>>>>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>>>>>>>> ---
>>>>>>>>> 
>>>>>>>>> The example command line is:
>>>>>>>>> 
>>>>>>>>> /home/aik/pbuild/qemu-killslof-localhost-ppc64/qemu-system-ppc64 \
>>>>>>>>> -nodefaults \
>>>>>>>>> -chardev stdio,id=STDIO0,signal=off,mux=on \
>>>>>>>>> -device spapr-vty,id=svty0,reg=0x71000110,chardev=STDIO0 \
>>>>>>>>> -mon id=MON0,chardev=STDIO0,mode=readline \
>>>>>>>>> -nographic \
>>>>>>>>> -vga none \
>>>>>>>>> -enable-kvm \
>>>>>>>>> -m 8G \
>>>>>>>>> -machine 
>>>>>>>>> pseries,x-vof=on,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off 
>>>>>>>>> \
>>>>>>>>> -kernel pbuild/kernel-le-guest/vmlinux \
>>>>>>>>> -initrd pb/rootfs.cpio.xz \
>>>>>>>>> -drive 
>>>>>>>>> id=DRIVE0,if=none,file=./p/qemu-killslof/pc-bios/vof-nvram.bin,format=raw 
>>>>>>>>> \
>>>>>>>>> -global spapr-nvram.drive=DRIVE0 \
>>>>>>>>> -snapshot \
>>>>>>>>> -smp 8,threads=8 \
>>>>>>>>> -L /home/aik/t/qemu-ppc64-bios/ \
>>>>>>>>> -trace events=qemu_trace_events \
>>>>>>>>> -d guest_errors \
>>>>>>>>> -chardev socket,id=SOCKET0,server,nowait,path=qemu.mon.tmux26 \
>>>>>>>>> -mon chardev=SOCKET0,mode=control
>>>>>>>> 
>>>>>>>> I haven't looked at it in detail yet, just some quick comments I have 
>>>>>>>> on first skim through.
>>>>>>>> 
>>>>>>>>> ---
>>>>>>>>> Changes:
>>>>>>>>> v21:
>>>>>>>>> * s/ld/ldz/ in entry.S
>>>>>>>> 
>>>>>>>> Typo? Has this become lwz?
>>>>>>> 
>>>>>>> Yup, lwz.
>>>>>>> 
>>>>>>>> 
>>>>>>>>> * moved CONFIG_VOF from default-configs/devices/ppc64-softmmu.mak to 
>>>>>>>>> Kconfig
>>>>>>>>> * made CONFIG_VOF optional
>>>>>>>> 
>>>>>>>> This won't work for pegasos2, see below.
>>>>>>>> 
>>>>>>>>> * s/l.lds/vof.lds/
>>>>>>>>> * force 32 BE in spapr_machine_reset() instead of the firmware
>>>>>>>>> * added checks for non-null methods of VofMachineIfClass
>>>>>>>>> * moved OF_STACK_SIZE to vof.h, renamed to VOF_..., added a better 
>>>>>>>>> comment
>>>>>>>>> * added  path_offset wrapper for handling mixed case for addresses
>>>>>>>>> after "@" in node names
>>>>>>>>> * changed getprop() to check for actual "name" property in the fdt
>>>>>>>>> * moved VOF_MEM_READ/VOF_MEM_WRITE to vof.h for sharing as (unlike 
>>>>>>>>> similar
>>>>>>>>> rtas_ld/ldl_be_*) they return error codes
>>>>>>>>> * VOF_MEM_READ uses now address_space_read (it was 
>>>>>>>>> address_space_read_full
>>>>>>>>> before, not sure why)
>>>>>>>> [...]
>>>>>>>>> ---
>>>>>>>>> configure               |    9 +
>>>>>>>>> pc-bios/vof/Makefile    |   23 +
>>>>>>>>> include/hw/ppc/spapr.h  |   25 +-
>>>>>>>>> include/hw/ppc/vof.h    |   55 ++
>>>>>>>>> pc-bios/vof/vof.h       |   43 ++
>>>>>>>>> hw/ppc/spapr.c          |   87 +++-
>>>>>>>>> hw/ppc/spapr_hcall.c    |   29 +-
>>>>>>>>> hw/ppc/spapr_vof.c      |  153 ++++++
>>>>>>>>> hw/ppc/vof.c            | 1052 
>>>>>>>>> +++++++++++++++++++++++++++++++++++++++
>>>>>>>>> pc-bios/vof/bootmem.c   |   14 +
>>>>>>>>> pc-bios/vof/ci.c        |   91 ++++
>>>>>>>>> pc-bios/vof/libc.c      |   92 ++++
>>>>>>>>> pc-bios/vof/main.c      |   21 +
>>>>>>>>> tests/qtest/rtas-test.c |   17 +-
>>>>>>>>> MAINTAINERS             |   12 +
>>>>>>>>> hw/ppc/Kconfig          |    3 +
>>>>>>>>> hw/ppc/meson.build      |    3 +
>>>>>>>>> hw/ppc/trace-events     |   24 +
>>>>>>>>> meson.build             |    1 +
>>>>>>>>> pc-bios/README          |    2 +
>>>>>>>>> pc-bios/vof-nvram.bin   |  Bin 0 -> 16384 bytes
>>>>>>>>> pc-bios/vof.bin         |  Bin 0 -> 3784 bytes
>>>>>>>>> pc-bios/vof/entry.S     |   49 ++
>>>>>>>>> pc-bios/vof/vof.lds     |   48 ++
>>>>>>>>> 24 files changed, 1840 insertions(+), 13 deletions(-)
>>>>>>>>> create mode 100644 pc-bios/vof/Makefile
>>>>>>>>> create mode 100644 include/hw/ppc/vof.h
>>>>>>>>> create mode 100644 pc-bios/vof/vof.h
>>>>>>>>> create mode 100644 hw/ppc/spapr_vof.c
>>>>>>>>> create mode 100644 hw/ppc/vof.c
>>>>>>>>> create mode 100644 pc-bios/vof/bootmem.c
>>>>>>>>> create mode 100644 pc-bios/vof/ci.c
>>>>>>>>> create mode 100644 pc-bios/vof/libc.c
>>>>>>>>> create mode 100644 pc-bios/vof/main.c
>>>>>>>>> create mode 100644 pc-bios/vof-nvram.bin
>>>>>>>>> create mode 100755 pc-bios/vof.bin
>>>>>>>>> create mode 100644 pc-bios/vof/entry.S
>>>>>>>>> create mode 100644 pc-bios/vof/vof.lds
>>>>>>>>> 
>>>> [...]
>>>>>>>>> diff --git a/include/hw/ppc/vof.h b/include/hw/ppc/vof.h
>>>>>>>>> new file mode 100644
>>>>>>>>> index 000000000000..65ca2fed0d41
>>>>>>>>> --- /dev/null
>>>>>>>>> +++ b/include/hw/ppc/vof.h
>>>>>>>>> @@ -0,0 +1,55 @@
>>>>>>>>> +/*
>>>>>>>>> + * Virtual Open Firmware
>>>>>>>>> + *
>>>>>>>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>>>>>>>> + */
>>>>>>>>> +#ifndef HW_VOF_H
>>>>>>>>> +#define HW_VOF_H
>>>>>>>>> +
>>>>>>>>> +typedef struct Vof {
>>>>>>>>> +    uint64_t top_addr; /* copied from rma_size */
>>>>>>>>> +    GArray *claimed; /* array of SpaprOfClaimed */
>>>>>>>>> +    uint64_t claimed_base;
>>>>>>>>> +    GHashTable *of_instances; /* ihandle -> SpaprOfInstance */
>>>>>>>>> +    uint32_t of_instance_last;
>>>>>>>>> +    char *bootargs;
>>>>>>>>> +    long fw_size;
>>>>>>>>> +} Vof;
>>>>>>>>> +
>>>>>>>>> +int vof_client_call(MachineState *ms, Vof *vof, void *fdt,
>>>>>>>>> +                    target_ulong args_real);
>>>>>>>>> +uint64_t vof_claim(Vof *vof, uint64_t virt, uint64_t size, uint64_t 
>>>>>>>>> align);
>>>>>>>>> +void vof_init(Vof *vof, uint64_t top_addr, Error **errp);
>>>>>>>>> +void vof_cleanup(Vof *vof);
>>>>>>>>> +void vof_build_dt(void *fdt, Vof *vof);
>>>>>>>>> +uint32_t vof_client_open_store(void *fdt, Vof *vof, const char 
>>>>>>>>> *nodename,
>>>>>>>>> +                               const char *prop, const char *path);
>>>>>>>>> +
>>>>>>>>> +#define TYPE_VOF_MACHINE_IF "vof-machine-if"
>>>>>>>>> +
>>>>>>>>> +typedef struct VofMachineIfClass VofMachineIfClass;
>>>>>>>>> +DECLARE_CLASS_CHECKERS(VofMachineIfClass, VOF_MACHINE, 
>>>>>>>>> TYPE_VOF_MACHINE_IF)
>>>>>>>>> +
>>>>>>>>> +struct VofMachineIfClass {
>>>>>>>>> +    InterfaceClass parent;
>>>>>>>>> +    target_ulong (*client_architecture_support)(MachineState *ms, 
>>>>>>>>> CPUState *cs,
>>>>>>>>> +                                                target_ulong vec);
>>>>>>>>> +    void (*quiesce)(MachineState *ms);
>>>>>>>>> +    bool (*setprop)(MachineState *ms, const char *path, const char 
>>>>>>>>> *propname,
>>>>>>>>> +                    void *val, int vallen);
>>>>>>>>> +};
>>>>>>>>> +
>>>>>>>>> +/*
>>>>>>>>> + * Initial stack size is from
>>>>>>>>> + * 
>>>>>>>>> https://www.devicetree.org/open-firmware/bindings/ppc/release/ppc-2_1.html 
>>>>>>>>> + */
>>>>>>>>> +#define VOF_STACK_SIZE       0x8000
>>>>>>>> 
>>>>>>>> Maybe also add a define for RTAS_SIZE here? We'll need to put that in 
>>>>>>>> the device tree but it depends on the rtas shim size that's part of 
>>>>>>>> VOF so it should be defined here instead of hardcoding it in boards 
>>>>>>>> that use VOF so it can be updated later at one place if needed.
>>>>>>> 
>>>>>>> This is rtas-size for pseries:
>>>>>>> 
>>>>>>> _FDT(fdt_setprop_cell(fdt, rtas, "rtas-size", RTAS_ERROR_LOG_MAX +
>>>>>>>          ms->smp.max_cpus * sizeof(uint64_t)*2 + sizeof(uint64_t)));
>>>>>>> 
>>>>>>> => depends on cpus => depends on the command line.
>>>>>>> 
>>>>>>> 
>>>>>>> RTAS_SIZE is not used by anything in pseries anymore, I'll send a 
>>>>>>> patch to ditch it.
>>>>>> 
>>>>>> I mean you need to have at least the size of code in 
>>>>>> pc-bios/vof/entry.S hv_rtas where also hv_rtas_size is defined but that 
>>>>>> value is not available in QEMU where one needs to add it to the device 
>>>>>> tree. So a define for that should be here in vof.h. Currently I've 
>>>>>> counted instructions and have
>>>>>> 
>>>>>>      qemu_fdt_setprop_cell(fdt, "/rtas", "rtas-size", 20);
>>>>>> 
>>>>>> in pegasos2.c but that 20 should be some VOF_RTAS_SIZE instead that you 
>>>>>> define corresponding to hv_rtas_size. You'll probably need the same 
>>>>>> even after changing above rtas size calculation in spapr because client 
>>>>>> has to allocate memory for instantiate-rtas.
>>>>> 
>>>>> 
>>>>> Ah fair point. I do not like "20" here and I think the right thing will 
>>>>> be adding whatever number of bytes to rtas-size in the firmware itself 
>>>>> and update it in QEMU via "setprop" as we do for "linux,rtas-base". And 
>>>>> then do the same in SLOF.
>>>> 
>>>> This is not the base address but the size of the shim with the hypercall 
>>>> that instantiate-rtas copies. Why does it need to be updated?
>>> 
>>> The vm kernel allocates the space for it.
>>> 
>>>> And why does it need to be more bytes than necessary?
>>> 
>>> What is necessary? It is definitely way more than 20 bytes.
>> 
>> I thought instantiate-rtas only copies the hv_rtas routine as the comment 
>> in qemu/pc-bios/vof/entry.S says
>
> It does only copy the code, correct.
>
>> and that routine is 20 bytes. 
>
>
> There is no "#define XXX 20" anywhere though. QEMU does not know and does not 
> need to know that it is 20, it does not manage the RTAS blob.

But it manages the rtas-size property which has to be at least the RTAS 
blob size so that's why I thought VOF should share this define in vof.h.

>
>> What else is needed? If that's not enough then we even more need a define 
>> for it as boards using VOF have no idea otherwise.
>> 
>>>> I don't know what you do for spapr and why do you need larger rtas-size 
>>>> than this but for pegasos2 this /rtas/rtas-size property is only used by 
>>>> guests to allocate memory for rtas so all I need is how many bytes are 
>>>> needed for hv_rtas in pc-bios/vof/entry.S which is what should be 
>>>> #defined in vof.h. I've found 20 is just enough so you could add that to 
>>>> vof.h.
>>> 
>>> I am thinking now that may be the property should be created by vof.bin 
>>> and not QEMU, QEMU just has to tell how many bytes on top it needs.
>> 
>> Maybe. If it's always in /rtas/rtas-size on every OF implementation (if 
>> that path is kind of standard for rtas) then that could also work or you 
>> could have an vof_init_rtas() function or similar that sets this, maybe 
>> pass it "/rtas" as path argument or even the whole property path 
>> ("/rtas/rtas-size") to avoid hard coding it and let the board tell it where 
>> it expects this property, then the value can be set by this function so 
>> that's within VOF then. But I think just adding a define for it in vof.h is 
>> enough and simple. Then boards can add whatever they need and put that in 
>> the property where they like.
>
>
> My idea is that boards like pegasos put a zero in such property and VOF then 
> adjusts it to whatever it is + 20.

That could work too if VOF knows how to find this property. If it's the 
same on every board then it does not have to look through the whole tree 
for it.

Regards,
BALATON Zoltan
--3866299591-831411349-1624011225=:20078--

