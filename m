Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B47E34877C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 04:27:21 +0100 (CET)
Received: from localhost ([::1]:38342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPGeV-0007Uo-Qx
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 23:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lPGd0-0006yL-9x
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 23:25:46 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:35558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lPGcv-0005uI-MM
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 23:25:45 -0400
Received: by mail-pf1-x436.google.com with SMTP id j25so610000pfe.2
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 20:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lFe77CRDhHHbsTULCz0L4NBGWiRFNrco2D1h3diVw1Y=;
 b=IeL9G3hEtSc7u+vNhkdY2WEoMPuD2pixMloSvrntsuwCAPCTYt+/Rj2ffTLqrS5SI7
 yQJPDHMgJvT9DpQZFsL78W+DmiSUlOjf2hLpGXZ5ixYPI+z6pdDwmUONxL6cWrdVSFB5
 jJPfo9srUv/FuhsVXLsWuOmlSajKJq0lVonReCOuaAXS+Nf644ph28mWcmD815KlWKfS
 iBS3xTeCt2rG1eCoV/9qjEN7/5sY6sAcqjYJuAn0eKJuDvYIvF0S5RDg/hCD03U6oedE
 xQbb3FBArSH3dfndvWz7URC30cetb2SDi+AhgDcA0V4xBsaaEcCgIOfPSk4/GQLnZZAC
 5M1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lFe77CRDhHHbsTULCz0L4NBGWiRFNrco2D1h3diVw1Y=;
 b=ZjHSrKeght6VcOD2/ZuBN3C6B9FWlh75CRz1ZK//kOEDjQY4k02+Zxj0S5II3nZE3o
 v+ArhmHeRoiF9Sq0jXH9N16fmxEhVnU8m2kcHaAl11HPR6a+AXNIeXTLuR7FUMh4YRl1
 dieOYOyDxDLvRWyMFmb1x1MCzR1rQY7oHAWMHkJrI+5CdHRFGHJz2K1bpfbP5+kuJ2Dj
 jcfe/tWrpjVS2Y8f8E78lssi2YR4v7e7SsAqYUXAuZHmJrBMRz4EGHAe7qDRc1Jaf8l9
 dOPPd/TAGw5qir3P7jC+fcN+5DhiqB9FzbSQA/8u3N/GonrNiz4JVpl/fmkikqKvOudS
 wRdw==
X-Gm-Message-State: AOAM533f3GDqQoo3OBLJm3zGR06yd9TzKP4npjzLrCelYX5ECOz+jc8y
 cU8N+aTGVEIERr3xFll/Yw34VhnV9bcbng==
X-Google-Smtp-Source: ABdhPJzzXxR1Vkjo+Ec32EAbJeSYXscgIag2IRusW4cGD4rFkCToNqgds/7yX3/1UPQb+KlJTp0gkQ==
X-Received: by 2002:a65:560b:: with SMTP id l11mr5508217pgs.362.1616642738550; 
 Wed, 24 Mar 2021 20:25:38 -0700 (PDT)
Received: from [192.168.10.23]
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with UTF8SMTPSA id j188sm3841481pfd.64.2021.03.24.20.25.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 20:25:37 -0700 (PDT)
Message-ID: <98565b10-debd-be0a-79f7-9f08737a49d1@ozlabs.ru>
Date: Thu, 25 Mar 2021 14:25:33 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:87.0) Gecko/20100101
 Thunderbird/87.0
Subject: Re: [PATCH qemu v16] spapr: Implement Open Firmware client interface
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210323025830.104781-1-aik@ozlabs.ru>
 <YFv69rtZd6yzKAtU@yekko.fritz.box>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <YFv69rtZd6yzKAtU@yekko.fritz.box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=aik@ozlabs.ru; helo=mail-pf1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 25/03/2021 13:52, David Gibson wrote:
> On Tue, Mar 23, 2021 at 01:58:30PM +1100, Alexey Kardashevskiy wrote:
>> The PAPR platform which describes an OS environment that's presented by
>> a combination of a hypervisor and firmware. The features it specifies
>> require collaboration between the firmware and the hypervisor.
>>
>> Since the beginning, the runtime component of the firmware (RTAS) has
>> been implemented as a 20 byte shim which simply forwards it to
>> a hypercall implemented in qemu. The boot time firmware component is
>> SLOF - but a build that's specific to qemu, and has always needed to be
>> updated in sync with it. Even though we've managed to limit the amount
>> of runtime communication we need between qemu and SLOF, there's some,
>> and it has become increasingly awkward to handle as we've implemented
>> new features.
>>
>> This implements a boot time OF client interface (CI) which is
>> enabled by a new "x-vof" pseries machine option (stands for "Virtual Open
>> Firmware). When enabled, QEMU implements the custom H_OF_CLIENT hcall
>> which implements Open Firmware Client Interface (OF CI). This allows
>> using a smaller stateless firmware which does not have to manage
>> the device tree.
>>
>> The new "vof.bin" firmware image is included with source code under
>> pc-bios/. It also includes RTAS blob.
>>
>> This implements a handful of CI methods just to get -kernel/-initrd
>> working. In particular, this implements the device tree fetching and
>> simple memory allocator - "claim" (an OF CI memory allocator) and updates
>> "/memory@0/available" to report the client about available memory.
>>
>> This implements changing some device tree properties which we know how
>> to deal with, the rest is ignored. To allow changes, this skips
>> fdt_pack() when x-vof=on as not packing the blob leaves some room for
>> appending.
>>
>> In absence of SLOF, this assigns phandles to device tree nodes to make
>> device tree traversing work.
>>
>> When x-vof=on, this adds "/chosen" every time QEMU (re)builds a tree.
>>
>> This adds basic instances support which are managed by a hash map
>> ihandle -> [phandle].
>>
>> Before the guest started, the used memory is:
>> 0..e60 - the initial firmware
>> 8000..10000 - stack
>> 400000.. - kernel
>> 3ea0000.. - initramdisk
>>
>> This OF CI does not implement "interpret".
>>
>> Unlike SLOF, this does not format uninitialized nvram. Instead, this
>> includes a disk image with pre-formatted nvram.
>>
>> With this basic support, this can only boot into kernel directly.
>> However this is just enough for the petitboot kernel and initradmdisk to
>> boot from any possible source. Note this requires reasonably recent guest
>> kernel with:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=df5be5be8735
>>
>> The immediate benefit is much faster booting time which especially
>> crucial with fully emulated early CPU bring up environments. Also this
>> may come handy when/if GRUB-in-the-userspace sees light of the day.
>>
>> This separates VOF and sPAPR in a hope that VOF bits may be reused by
>> other POWERPC boards which do not support pSeries.
>>
>> This is coded in assumption that later on we might be adding support for
>> booting from QEMU backends (blockdev is the first candidate) without
>> devices/drivers in between as OF1275 does not require that and
>> it is quite easy to so.
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> 
> I have some comments below, but they're basically all trivial at this
> point.  We've missed qemu-6.0 obviously, but I'm hoping I can merge
> the next spin to my ppc-for-6.1 tree.
> 
>> ---
>>
>> The example command line is:
>>
>> /home/aik/pbuild/qemu-killslof-localhost-ppc64/qemu-system-ppc64 \
>> -nodefaults \
>> -chardev stdio,id=STDIO0,signal=off,mux=on \
>> -device spapr-vty,id=svty0,reg=0x71000110,chardev=STDIO0 \
>> -mon id=MON0,chardev=STDIO0,mode=readline \
>> -nographic \
>> -vga none \
>> -enable-kvm \
>> -m 2G \
>> -machine pseries,x-vof=on,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off \
>> -kernel pbuild/kernel-le-guest/vmlinux \
>> -initrd pb/rootfs.cpio.xz \
>> -drive id=DRIVE0,if=none,file=./p/qemu-killslof/pc-bios/vof-nvram.bin,format=raw \
> 
> Removing the need for a prebuild NVRAM image is something I'd like to
> see as a followup.


We do not _need_ NVRAM in the VM to begin with, or is this a 
requirement? The whole VOF thing is more like a hack and I do not recall 
myself on doing anything useful with NVRAM.

If we really need it, then when to format it - in QEMU or VOF.bin? This 
alone will trigger a (lengthy) discussion :)


>> -global spapr-nvram.drive=DRIVE0 \
>> -snapshot \
>> -smp 8,threads=8 \
>> -L /home/aik/t/qemu-ppc64-bios/ \
>> -trace events=qemu_trace_events \
>> -d guest_errors \
>> -chardev socket,id=SOCKET0,server,nowait,path=qemu.mon.tmux26 \
>> -mon chardev=SOCKET0,mode=control
>>
>> ---
>> Changes:
>> v16:
>> * rebased on dwg/ppc-for-6.1
>> * s/SpaprVofInterface/VofMachineInterface/
>>
>> v15:
>> * bugfix: claimed memory for the VOF itself
>> * ditched OF_STACK_ADDR and allocate one instead, now it starts from 0x8000
>> because it is aligned to its size (no particular reason though)
>> * coding style
>> * moved nvram.bin up one level
>> * ditched bool in the firmware
>> * made debugging code conditional using trace_event_get_state() + qemu_loglevel_mask()
>> * renamed the CAS interface to SpaprVofInterface
>> * added "write" which for now dumps the message and ihandle via
>> trace point for early debug assistance
>> * commented on when we allocate of_instances in vof_build_dt()
>> * store fw_size is SpaprMachine to let spapr_vof_reset() claim it
>> * many small fixes from v14's review
>>
>> v14:
>> * check for truncates in readstr()
>> * ditched a separate vof_reset()
>> * spapr->vof is a pointer now, dropped the "on" field
>> * removed rtas_base from vof and updated comment why we allow setting it
>> * added myself to maintainers
>> * updated commit log about blockdev and other possible platforms
>> * added a note why new hcall is 0x5
>> * no in place endianness convertion in spapr_h_vof_client
>> * converted all cpu_physical_memory_read/write to address_space_rw
>> * git mv hw/ppc/spapr_vof_client.c hw/ppc/spapr_vof.c
>>
>> v13:
>> * rebase on latest ppc-for-6.0
>> * shuffled code around to touch spapr.c less
>>
>> v12:
>> * split VOF and SPAPR
>>
>> v11:
>> * added g_autofree
>> * fixed gcc warnings
>> * fixed few leaks
>> * added nvram image to make "nvram --print-config" not crash;
>> Note that contrary to  MIN_NVRAM_SIZE (8 * KiB), the actual minimum size
>> is 16K, or it just does not work (empty output from "nvram")
>>
>> v10:
>> * now rebased to compile with meson
>>
>> v9:
>> * remove special handling of /rtas/rtas-size as now we always add it in QEMU
>> * removed leftovers from scsi/grub/stdout/stdin/...
>>
>> v8:
>> * no read/write/seek
>> * no @dev in instances
>> * the machine flag is "x-vof" for now
>>
>> v7:
>> * now we have a small firmware which loads at 0 as SLOF and starts from
>> 0x100 as SLOF
>> * no MBR/ELF/GRUB business in QEMU anymore
>> * blockdev is a separate patch
>> * networking is a separate patch
>>
>> v6:
>> * borrowed a big chunk of commit log introduction from David
>> * fixed initial stack pointer (points to the highest address of stack)
>> * traces for "interpret" and others
>> * disabled  translate_kernel_address() hack so grub can load (work in
>> progress)
>> * added "milliseconds" for grub
>> * fixed "claim" allocator again
>> * moved FDT_MAX_SIZE to spapr.h as spapr_of_client.c wants it too for CAS
>> * moved the most code possible from spapr.c to spapr_of_client.c, such as
>> RTAS, prom entry and FDT build/finalize
>> * separated blobs
>> * GRUB now proceeds to its console prompt (there are still other issues)
>> * parse MBR/GPT to find PReP and load GRUB
>>
>> v5:
>> * made instances keep device and chardev pointers
>> * removed VIO dependencies
>> * print error if RTAS memory is not claimed as it should have been
>> * pack FDT as "quiesce"
>>
>> v4:
>> * fixed open
>> * validate ihandles in "call-method"
>>
>> v3:
>> * fixed phandles allocation
>> * s/__be32/uint32_t/ as we do not normally have __be32 type in qemu
>> * fixed size of /chosen/stdout
>> * bunch of renames
>> * do not create rtas properties at all, let the client deal with it;
>> instead setprop allows changing these in the FDT
>> * no more packing FDT when bios=off - nobody needs it and getprop does not
>> work otherwise
>> * allow updating initramdisk device tree properties (for zImage)
>> * added instances
>> * fixed stdout on OF's "write"
>> * removed special handling for stdout in OF client, spapr-vty handles it
>> instead
>>
>> v2:
>> * fixed claim()
>> * added "setprop"
>> * cleaner client interface and RTAS blobs management
>> * boots to petitboot and further to the target system
>> * more trace points
>> ---
>>   pc-bios/vof/Makefile   |  18 +
>>   hw/ppc/vof.h           |  37 ++
>>   include/hw/ppc/spapr.h |  17 +-
>>   pc-bios/vof/vof.h      |  38 ++
>>   hw/ppc/spapr.c         |  83 +++-
>>   hw/ppc/spapr_hcall.c   |  26 +-
>>   hw/ppc/spapr_vof.c     | 148 +++++++
>>   hw/ppc/vof.c           | 982 +++++++++++++++++++++++++++++++++++++++++
>>   pc-bios/vof/bootmem.c  |  14 +
>>   pc-bios/vof/ci.c       |  91 ++++
>>   pc-bios/vof/libc.c     |  92 ++++
>>   pc-bios/vof/main.c     |  21 +
>>   MAINTAINERS            |  11 +
>>   hw/ppc/meson.build     |   2 +
>>   hw/ppc/trace-events    |  24 +
>>   pc-bios/README         |   2 +
>>   pc-bios/vof-nvram.bin  | Bin 0 -> 16384 bytes
>>   pc-bios/vof.bin        | Bin 0 -> 3128 bytes
>>   pc-bios/vof/entry.S    |  51 +++
>>   pc-bios/vof/l.lds      |  48 ++
>>   20 files changed, 1693 insertions(+), 12 deletions(-)
>>   create mode 100644 pc-bios/vof/Makefile
>>   create mode 100644 hw/ppc/vof.h
>>   create mode 100644 pc-bios/vof/vof.h
>>   create mode 100644 hw/ppc/spapr_vof.c
>>   create mode 100644 hw/ppc/vof.c
>>   create mode 100644 pc-bios/vof/bootmem.c
>>   create mode 100644 pc-bios/vof/ci.c
>>   create mode 100644 pc-bios/vof/libc.c
>>   create mode 100644 pc-bios/vof/main.c
>>   create mode 100644 pc-bios/vof-nvram.bin
>>   create mode 100755 pc-bios/vof.bin
>>   create mode 100644 pc-bios/vof/entry.S
>>   create mode 100644 pc-bios/vof/l.lds
>>
>> diff --git a/pc-bios/vof/Makefile b/pc-bios/vof/Makefile
>> new file mode 100644
>> index 000000000000..1451e0551818
>> --- /dev/null
>> +++ b/pc-bios/vof/Makefile
>> @@ -0,0 +1,18 @@
>> +all: build-all
>> +
>> +build-all: vof.bin
>> +
>> +%.o: %.S
>> +	cc -m32 -mbig-endian -c -o $@ $<
>> +
>> +%.o: %.c
>> +	cc -m32 -mbig-endian -c -fno-stack-protector -o $@ $<
>> +
>> +vof.elf: entry.o main.o ci.o bootmem.o libc.o
>> +	ld -nostdlib -e_start -Tl.lds -EB -o $@ $^
>> +
>> +%.bin: %.elf
>> +	objcopy -O binary -j .text -j .data -j .toc -j .got2 $^ $@
>> +
>> +clean:
>> +	rm -f *.o vof.bin vof.elf *~
>> diff --git a/hw/ppc/vof.h b/hw/ppc/vof.h
> 
> Qemu conventions meant this should be in include/hw/ppc/vof.h.
> 
>> new file mode 100644
>> index 000000000000..fc397e4e0c9b
>> --- /dev/null
>> +++ b/hw/ppc/vof.h
>> @@ -0,0 +1,37 @@
>> + /* Virtual Open Firmware */
>> +#ifndef HW_VOF_H
>> +#define HW_VOF_H
> 
> Probably worth adding an SPDX-License-Identifier line, just for
> completeness.
> 
>> +
>> +typedef struct Vof {
>> +    uint32_t top_addr; /* copied from rma_size */
>> +    GArray *claimed; /* array of SpaprOfClaimed */
>> +    uint64_t claimed_base;
>> +    GHashTable *of_instances; /* ihandle -> SpaprOfInstance */
>> +    uint32_t of_instance_last;
>> +    char *bootargs;
>> +    uint32_t initrd_base; /* Updated in spapr at CAS */
>> +    long initrd_size; /* Updated in spapr at CAS */
>> +} Vof;
>> +
>> +uint32_t vof_client_call(void *fdt, Vof *vof, const char *service,
>> +                         uint32_t *args, unsigned nargs,
>> +                         uint32_t *rets, unsigned nrets);
>> +uint64_t vof_claim(void *fdt, Vof *vof, uint64_t virt, uint64_t size,
>> +                   uint64_t align);
>> +void vof_cleanup(Vof *vof);
>> +void vof_build_dt(void *fdt, Vof *vof, uint32_t top_addr);
>> +uint32_t vof_client_open_store(void *fdt, Vof *vof, const char *nodename,
>> +                               const char *prop, const char *path);
>> +
>> +#define TYPE_VOF_MACHINE "vof-machine"
>> +
>> +typedef struct VofMachineClass VofMachineClass;
> 
> Probably call this VofMachineInterface rather than VofMachineClass.
> 
>> +DECLARE_CLASS_CHECKERS(VofMachineClass, VOF_MACHINE, TYPE_VOF_MACHINE)
>> +
>> +struct VofMachineClass {
>> +    InterfaceClass parent;
>> +    target_ulong (*client_architecture_support)(CPUState *cs, target_ulong vec);
>> +    void (*quiesce)(void);
>> +};
>> +
>> +#endif /* HW_VOF_H */
>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>> index bf7cab7a2ce1..3cb121dae707 100644
>> --- a/include/hw/ppc/spapr.h
>> +++ b/include/hw/ppc/spapr.h
>> @@ -12,6 +12,7 @@
>>   #include "hw/ppc/spapr_xive.h"  /* For SpaprXive */
>>   #include "hw/ppc/xics.h"        /* For ICSState */
>>   #include "hw/ppc/spapr_tpm_proxy.h"
>> +#include "hw/ppc/vof.h"
>>   
>>   struct SpaprVioBus;
>>   struct SpaprPhbState;
>> @@ -180,6 +181,8 @@ struct SpaprMachineState {
>>       uint64_t kernel_addr;
>>       uint32_t initrd_base;
>>       long initrd_size;
>> +    long fw_size;
>> +    Vof *vof;
>>       uint64_t rtc_offset; /* Now used only during incoming migration */
>>       struct PPCTimebase tb;
>>       bool has_graphics;
>> @@ -554,7 +557,9 @@ struct SpaprMachineState {
>>   /* Client Architecture support */
>>   #define KVMPPC_H_CAS            (KVMPPC_HCALL_BASE + 0x2)
>>   #define KVMPPC_H_UPDATE_DT      (KVMPPC_HCALL_BASE + 0x3)
>> -#define KVMPPC_HCALL_MAX        KVMPPC_H_UPDATE_DT
>> +/* 0x4 was used for KVMPPC_H_UPDATE_PHANDLE in SLOF */
>> +#define KVMPPC_H_VOF_CLIENT     (KVMPPC_HCALL_BASE + 0x5)
>> +#define KVMPPC_HCALL_MAX        KVMPPC_H_VOF_CLIENT
>>   
>>   /*
>>    * The hcall range 0xEF00 to 0xEF80 is reserved for use in facilitating
>> @@ -945,4 +950,14 @@ bool spapr_check_pagesize(SpaprMachineState *spapr, hwaddr pagesize,
>>   void spapr_set_all_lpcrs(target_ulong value, target_ulong mask);
>>   hwaddr spapr_get_rtas_addr(void);
>>   bool spapr_memory_hot_unplug_supported(SpaprMachineState *spapr);
>> +
>> +void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
>> +                     target_ulong *stack_ptr, Error **errp);
>> +void spapr_vof_quiesce(void);
>> +target_ulong spapr_h_vof_client(PowerPCCPU *cpu, SpaprMachineState *spapr,
>> +                                target_ulong opcode, target_ulong *args);
>> +target_ulong spapr_vof_client_architecture_support(CPUState *cs,
>> +                                                   target_ulong ovec_addr);
>> +void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt);
>> +
>>   #endif /* HW_SPAPR_H */
>> diff --git a/pc-bios/vof/vof.h b/pc-bios/vof/vof.h
>> new file mode 100644
>> index 000000000000..29c80374d6dd
>> --- /dev/null
>> +++ b/pc-bios/vof/vof.h
>> @@ -0,0 +1,38 @@
> 
> Especially as some guest code that's a bit more separated from the
> qemu core, it's probably worth putting an SPDX line here.
> 
>> +#include <stdarg.h>
>> +
>> +typedef unsigned char uint8_t;
>> +typedef unsigned short uint16_t;
>> +typedef unsigned long uint32_t;
>> +typedef unsigned long long uint64_t;
>> +#define NULL (0)
>> +#define PROM_ERROR (-1u)
>> +typedef unsigned long ihandle;
>> +typedef unsigned long phandle;
>> +typedef int size_t;
>> +typedef void client(void);
>> +
>> +/* globals */
>> +extern void _prom_entry(void); /* OF CI entry point (i.e. this firmware) */
>> +
>> +void do_boot(unsigned long addr, unsigned long r3, unsigned long r4);
>> +
>> +/* libc */
>> +int strlen(const char *s);
>> +int strcmp(const char *s1, const char *s2);
>> +void *memcpy(void *dest, const void *src, size_t n);
>> +int memcmp(const void *ptr1, const void *ptr2, size_t n);
>> +void *memmove(void *dest, const void *src, size_t n);
>> +void *memset(void *dest, int c, size_t size);
>> +
>> +/* CI wrappers */
>> +void ci_panic(const char *str);
>> +phandle ci_finddevice(const char *path);
>> +uint32_t ci_getprop(phandle ph, const char *propname, void *prop, int len);
>> +
>> +/* booting from -kernel */
>> +void boot_from_memory(uint64_t initrd, uint64_t initrdsize);
>> +
>> +/* Entry points for CI and RTAS */
>> +extern uint32_t ci_entry(uint32_t params);
>> +extern unsigned long hv_rtas(unsigned long params);
>> +extern unsigned int hv_rtas_size;
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index 73a06df3b1b1..0a41fd893c47 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -103,6 +103,7 @@
>>   #define RTAS_MAX_ADDR           0x80000000 /* RTAS must stay below that */
>>   #define FW_MAX_SIZE             0x400000
>>   #define FW_FILE_NAME            "slof.bin"
>> +#define FW_FILE_NAME_VOF        "vof.bin"
>>   #define FW_OVERHEAD             0x2800000
>>   #define KERNEL_LOAD_ADDR        FW_MAX_SIZE
>>   
>> @@ -1625,22 +1626,41 @@ static void spapr_machine_reset(MachineState *machine)
>>   
>>       fdt = spapr_build_fdt(spapr, true, FDT_MAX_SIZE);
>>   
>> -    rc = fdt_pack(fdt);
>> +    if (spapr->vof) {
>> +        target_ulong stack_ptr = 0;
>>   
>> -    /* Should only fail if we've built a corrupted tree */
>> -    assert(rc == 0);
>> +        /*
>> +         * Claims initramdisk and stack which changes "available" so
>> +         * doing it befofe packing.
>> +         */
>> +        spapr_vof_reset(spapr, fdt, &stack_ptr, &error_fatal);
>>   
>> -    /* Load the fdt */
>> +        spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
>> +                                  stack_ptr, spapr->initrd_base,
>> +                                  spapr->initrd_size);
>> +        /* We do not pack the FDT as the client may change properties. */
>> +    } else {
>> +        rc = fdt_pack(fdt);
>> +        /* Should only fail if we've built a corrupted tree */
>> +        assert(rc == 0);
>> +
>> +        spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
>> +                                  0, fdt_addr, 0);
>> +    }
>>       qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
>> -    cpu_physical_memory_write(fdt_addr, fdt, fdt_totalsize(fdt));
>> +
>>       g_free(spapr->fdt_blob);
>>       spapr->fdt_size = fdt_totalsize(fdt);
>>       spapr->fdt_initial_size = spapr->fdt_size;
>>       spapr->fdt_blob = fdt;
>>   
>>       /* Set up the entry state */
>> -    spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT, 0, fdt_addr, 0);
>>       first_ppc_cpu->env.gpr[5] = 0;
>> +    /* VOF client does not expect the FDT so we do not load it to the VM. */
>> +    if (!spapr->vof) {
>> +        /* Load the fdt */
>> +        cpu_physical_memory_write(fdt_addr, spapr->fdt_blob, spapr->fdt_size);
>> +    }
>>   
>>       spapr->fwnmi_system_reset_addr = -1;
>>       spapr->fwnmi_machine_check_addr = -1;
>> @@ -2640,13 +2660,14 @@ static void spapr_machine_init(MachineState *machine)
>>       SpaprMachineState *spapr = SPAPR_MACHINE(machine);
>>       SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(machine);
>>       MachineClass *mc = MACHINE_GET_CLASS(machine);
>> -    const char *bios_name = machine->firmware ?: FW_FILE_NAME;
>> +    const char *bios_default = !!spapr->vof ? FW_FILE_NAME_VOF : FW_FILE_NAME;
>> +    const char *bios_name = machine->firmware ?: bios_default;
>>       const char *kernel_filename = machine->kernel_filename;
>>       const char *initrd_filename = machine->initrd_filename;
>>       PCIHostState *phb;
>>       int i;
>>       MemoryRegion *sysmem = get_system_memory();
>> -    long load_limit, fw_size;
>> +    long load_limit;
>>       char *filename;
>>       Error *resize_hpt_err = NULL;
>>   
>> @@ -2963,8 +2984,8 @@ static void spapr_machine_init(MachineState *machine)
>>           error_report("Could not find LPAR firmware '%s'", bios_name);
>>           exit(1);
>>       }
>> -    fw_size = load_image_targphys(filename, 0, FW_MAX_SIZE);
>> -    if (fw_size <= 0) {
>> +    spapr->fw_size = load_image_targphys(filename, 0, FW_MAX_SIZE);
>> +    if (spapr->fw_size <= 0) {
>>           error_report("Could not load LPAR firmware '%s'", filename);
>>           exit(1);
>>       }
>> @@ -2997,6 +3018,10 @@ static void spapr_machine_init(MachineState *machine)
>>       }
>>   
>>       qemu_cond_init(&spapr->fwnmi_machine_check_interlock_cond);
>> +
>> +    if (spapr->vof) {
>> +        spapr_register_hypercall(KVMPPC_H_VOF_CLIENT, spapr_h_vof_client);
>> +    }
>>   }
>>   
>>   #define DEFAULT_KVM_TYPE "auto"
>> @@ -3187,6 +3212,28 @@ static void spapr_set_resize_hpt(Object *obj, const char *value, Error **errp)
>>       }
>>   }
>>   
>> +static bool spapr_get_vof(Object *obj, Error **errp)
>> +{
>> +    SpaprMachineState *spapr = SPAPR_MACHINE(obj);
>> +
>> +    return spapr->vof != NULL;
>> +}
>> +
>> +static void spapr_set_vof(Object *obj, bool value, Error **errp)
>> +{
>> +    SpaprMachineState *spapr = SPAPR_MACHINE(obj);
>> +
>> +    if (spapr->vof) {
>> +        vof_cleanup(spapr->vof);
>> +        g_free(spapr->vof);
>> +        spapr->vof = NULL;
>> +    }
>> +    if (!value) {
>> +        return;
>> +    }
>> +    spapr->vof = g_malloc0(sizeof(*spapr->vof));
>> +}
>> +
>>   static char *spapr_get_ic_mode(Object *obj, Error **errp)
>>   {
>>       SpaprMachineState *spapr = SPAPR_MACHINE(obj);
>> @@ -3312,6 +3359,10 @@ static void spapr_instance_init(Object *obj)
>>                                       stringify(KERNEL_LOAD_ADDR)
>>                                       " for -kernel is the default");
>>       spapr->kernel_addr = KERNEL_LOAD_ADDR;
>> +    object_property_add_bool(obj, "x-vof", spapr_get_vof, spapr_set_vof);
>> +    object_property_set_description(obj, "x-vof",
>> +                                    "Enable Virtual Open Firmware");
>> +
>>       /* The machine class defines the default interrupt controller mode */
>>       spapr->irq = smc->irq;
>>       object_property_add_str(obj, "ic-mode", spapr_get_ic_mode,
>> @@ -4470,6 +4521,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
>>       XICSFabricClass *xic = XICS_FABRIC_CLASS(oc);
>>       InterruptStatsProviderClass *ispc = INTERRUPT_STATS_PROVIDER_CLASS(oc);
>>       XiveFabricClass *xfc = XIVE_FABRIC_CLASS(oc);
>> +    VofMachineClass *vmc = VOF_MACHINE_CLASS(oc);
>>   
>>       mc->desc = "pSeries Logical Partition (PAPR compliant)";
>>       mc->ignore_boot_device_suffixes = true;
>> @@ -4549,6 +4601,9 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
>>       smc->smp_threads_vsmt = true;
>>       smc->nr_xirqs = SPAPR_NR_XIRQS;
>>       xfc->match_nvt = spapr_match_nvt;
>> +
>> +    vmc->client_architecture_support = spapr_vof_client_architecture_support;
>> +    vmc->quiesce = spapr_vof_quiesce;
>>   }
>>   
>>   static const TypeInfo spapr_machine_info = {
>> @@ -4568,6 +4623,7 @@ static const TypeInfo spapr_machine_info = {
>>           { TYPE_XICS_FABRIC },
>>           { TYPE_INTERRUPT_STATS_PROVIDER },
>>           { TYPE_XIVE_FABRIC },
>> +        { TYPE_VOF_MACHINE },
>>           { }
>>       },
>>   };
>> @@ -5036,9 +5092,16 @@ static void spapr_machine_2_1_class_options(MachineClass *mc)
>>   }
>>   DEFINE_SPAPR_MACHINE(2_1, "2.1", false);
>>   
>> +static const TypeInfo vof_machine_info = {
>> +    .name = TYPE_VOF_MACHINE,
>> +    .parent = TYPE_INTERFACE,
>> +    .class_size = sizeof(VofMachineClass),
>> +};
> 
> I think this belongs in vof.c rather than spapr.c
> 
>> +
>>   static void spapr_machine_register_types(void)
>>   {
>>       type_register_static(&spapr_machine_info);
>> +    type_register_static(&vof_machine_info);
>>   }
>>   
>>   type_init(spapr_machine_register_types)
>> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>> index 7b5cd3553c26..0cdf90af6afb 100644
>> --- a/hw/ppc/spapr_hcall.c
>> +++ b/hw/ppc/spapr_hcall.c
>> @@ -1806,7 +1806,13 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
>>           spapr_setup_hpt(spapr);
>>       }
>>   
>> -    fdt = spapr_build_fdt(spapr, false, fdt_bufsize);
>> +    if (spapr->vof && spapr->vof->initrd_base && spapr->vof->initrd_size) {
>> +        /* Update initramdisk location so the right area gets reserved below */
>> +        spapr->initrd_base = spapr->vof->initrd_base;
>> +        spapr->initrd_size = spapr->vof->initrd_size;
>> +    }
>> +
>> +    fdt = spapr_build_fdt(spapr, spapr->vof != NULL, fdt_bufsize);
>>   
>>       g_free(spapr->fdt_blob);
>>       spapr->fdt_size = fdt_totalsize(fdt);
>> @@ -1850,6 +1856,24 @@ static target_ulong h_client_architecture_support(PowerPCCPU *cpu,
>>       return ret;
>>   }
>>   
>> +target_ulong spapr_vof_client_architecture_support(CPUState *cs,
>> +                                                  target_ulong ovec_addr)
>> +{
>> +    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
>> +
>> +    target_ulong ret = do_client_architecture_support(POWERPC_CPU(cs), spapr,
>> +                                                      ovec_addr, FDT_MAX_SIZE);
>> +
>> +    /*
>> +     * This adds stdout and generates phandles for boottime and CAS FDTs.
>> +     * It is alright to update the FDT here as do_client_architecture_support()
>> +     * does not pack it.
>> +     */
>> +    spapr_vof_client_dt_finalize(spapr, spapr->fdt_blob);
>> +
>> +    return ret;
>> +}
>> +
>>   static target_ulong h_get_cpu_characteristics(PowerPCCPU *cpu,
>>                                                 SpaprMachineState *spapr,
>>                                                 target_ulong opcode,
>> diff --git a/hw/ppc/spapr_vof.c b/hw/ppc/spapr_vof.c
>> new file mode 100644
>> index 000000000000..8a58364490f4
>> --- /dev/null
>> +++ b/hw/ppc/spapr_vof.c
> 
> SPDX.
> 
>> @@ -0,0 +1,148 @@
>> +#include "qemu/osdep.h"
>> +#include "qemu-common.h"
>> +#include <sys/ioctl.h>
>> +#include "qapi/error.h"
>> +#include "hw/ppc/spapr.h"
>> +#include "hw/ppc/spapr_vio.h"
>> +#include "hw/ppc/fdt.h"
>> +#include "sysemu/sysemu.h"
>> +#include "qom/qom-qobject.h"
>> +#include "trace.h"
>> +
>> +/* Copied from SLOF, and 4K is definitely not enough for GRUB */
>> +#define OF_STACK_SIZE       0x8000
>> +
>> +/* Defined as Big Endian */
>> +struct prom_args {
>> +    uint32_t service;
>> +    uint32_t nargs;
>> +    uint32_t nret;
>> +    uint32_t args[10];
>> +} QEMU_PACKED;
>> +
>> +target_ulong spapr_h_vof_client(PowerPCCPU *cpu, SpaprMachineState *spapr,
>> +                                target_ulong opcode, target_ulong *_args)
>> +{
>> +    target_ulong args_real = ppc64_phys_to_real(_args[0]);
>> +    struct prom_args args_be;
>> +    uint32_t args[ARRAY_SIZE(args_be.args)];
>> +    uint32_t rets[ARRAY_SIZE(args_be.args)] = { 0 }, ret;
>> +    char service[64];
>> +    unsigned nargs, nret, i;
>> +
>> +    if (address_space_rw(&address_space_memory, args_real,
>> +                         MEMTXATTRS_UNSPECIFIED, &args_be, sizeof(args_be),
>> +                         false) != MEMTX_OK) {
>> +        return H_HARDWARE;
> 
> Probably H_PARAMETER rather than H_HARDWARE - the most likely cause
> here is that a bad address was specified for the arguments.
> 
>> +    }
>> +    nargs = be32_to_cpu(args_be.nargs);
>> +    if (nargs >= ARRAY_SIZE(args_be.args)) {
>> +        return H_PARAMETER;
>> +    }
>> +
>> +    if (address_space_rw(&address_space_memory, be32_to_cpu(args_be.service),
>> +                         MEMTXATTRS_UNSPECIFIED, service, sizeof(service),
>> +                         false) != MEMTX_OK) {
>> +        return H_HARDWARE;
> 
> Likewise here and the rest.
> 
>> +    }
>> +    if (strnlen(service, sizeof(service)) == sizeof(service)) {
>> +        /* Too long service name */
>> +        return H_PARAMETER;
>> +    }
>> +
>> +    for (i = 0; i < nargs; ++i) {
>> +        args[i] = be32_to_cpu(args_be.args[i]);
>> +    }
>> +
>> +    nret = be32_to_cpu(args_be.nret);
>> +    ret = vof_client_call(spapr->fdt_blob, spapr->vof, service,
>> +                          args, nargs, rets, nret);
>> +    if (!nret) {
>> +        return H_SUCCESS;
>> +    }
>> +
>> +    args_be.args[nargs] = cpu_to_be32(ret);
>> +    for (i = 1; i < nret; ++i) {
>> +        args_be.args[nargs + i] = cpu_to_be32(rets[i - 1]);
>> +    }
>> +
>> +    if (address_space_rw(&address_space_memory,
>> +                         args_real + offsetof(struct prom_args, args[nargs]),
>> +                         MEMTXATTRS_UNSPECIFIED, args_be.args + nargs,
>> +                         sizeof(args_be.args[0]) * nret, true) != MEMTX_OK) {
>> +        return H_HARDWARE;
>> +    }
>> +
>> +    return H_SUCCESS;
>> +}
>> +
>> +void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt)
>> +{
>> +    char *stdout_path = spapr_vio_stdout_path(spapr->vio_bus);
>> +
>> +    vof_build_dt(fdt, spapr->vof, spapr->rma_size);
>> +
>> +    /*
>> +     * SLOF-less setup requires an open instance of stdout for early
>> +     * kernel printk. By now all phandles are settled so we can open
>> +     * the default serial console.
>> +     */
>> +    if (stdout_path) {
>> +        _FDT(vof_client_open_store(fdt, spapr->vof, "/chosen", "stdout",
>> +                                   stdout_path));
>> +    }
>> +}
>> +
>> +void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
>> +                     target_ulong *stack_ptr, Error **errp)
>> +{
>> +    Vof *vof = spapr->vof;
>> +
>> +    vof_cleanup(vof);
>> +
>> +    spapr_vof_client_dt_finalize(spapr, fdt);
>> +
>> +    if (vof_claim(spapr->fdt_blob, vof, 0, spapr->fw_size, 0) == -1) {
>> +        error_setg(errp, "Memory for firmware is in use");
> 
> This could probably be an assert, yes?  IIUC this the very first
> claim, so if this fails then we've placed things incorrectly in the
> first place, so it's a code error rather than a user error.


Passing &error_fatal as errp is an assert pretty much but more 
informative imho.

In a followup I'd rather shuffle this function to claim kernel/initrd 
first and only then claim space the VOF firmware which can fail so I can 
then try allocating the space for it, return that to 
spapr_machine_reset() to change the entry point. This way I'll be able 
to pass 0 to -machine pseries,kernel-addr= to allow having kernel at 0 
so when debugging via the qemu gdb stub, I could set breakpoints at 
addresses from "objdump vmlinux" without adding the default kernel addr 
0x400000 every time. When I do that - this is definitely going to be not 
an assert.



> 
>> +        return;
>> +    }
>> +
>> +    *stack_ptr = vof_claim(spapr->fdt_blob, vof, 0, OF_STACK_SIZE,
>> +                           OF_STACK_SIZE);
>> +    if (*stack_ptr == -1) {
> 
> Likewise here.

This passes alignment so it is allocating and not claiming and if it 
fails to allocate - it is most likely because the user cafefully 
prepared the vof blob big enough to exhaust the VM memory.


> 
>> +        error_setg(errp, "Memory allocation for stack failed");
>> +        return;
>> +    }
>> +    /*
>> +     * Stack grows downwards and we also reserve here space for
>> +     * the minimum stack frame.
>> +     */
>> +    *stack_ptr += OF_STACK_SIZE - 0x20;
>> +
>> +    if (spapr->kernel_size &&
>> +        vof_claim(spapr->fdt_blob, vof, spapr->kernel_addr, spapr->kernel_size,
>> +                  0) == -1) {
>> +        error_setg(errp, "Memory for kernel is in use");
>> +        return;
>> +    }
>> +
>> +    if (spapr->initrd_size &&
>> +        vof_claim(spapr->fdt_blob, vof, spapr->initrd_base, spapr->initrd_size,
>> +                  0) == -1) {
>> +        error_setg(errp, "Memory for initramdisk is in use");
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * We skip writing FDT as nothing expects it; OF client interface is
>> +     * going to be used for reading the device tree.
>> +     */
>> +}
>> +
>> +void spapr_vof_quiesce(void)
>> +{
>> +    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
>> +
>> +    spapr->fdt_size = fdt_totalsize(spapr->fdt_blob);
>> +    spapr->fdt_initial_size = spapr->fdt_size;
> 
> I suspect this doesn't matter.  AFAICT the only use of
> fdt_initial_size is for the H_UPDATE_DT call, which shouldn't be used
> with VOF.  But, that can be a later cleanup.

It does not (like the whole quiesce thing - I only pack the FDT to get 
errors if the client tries updating it) but I really like having all fdt 
properties in sync.



-- 
Alexey

