Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9754634C245
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 05:42:42 +0200 (CEST)
Received: from localhost ([::1]:53472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQinZ-00011g-O8
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 23:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lQimj-0000Kd-JA
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 23:41:49 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:38798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lQimg-0001Kr-3q
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 23:41:49 -0400
Received: by mail-pl1-x62e.google.com with SMTP id y2so3752232plg.5
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 20:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jk2Of2KoNXgHlmgXT5vkNURSJTIBCY/zYe/Sr002+k8=;
 b=WjqOpyPcXSSjMVdf12Dt5BLsjmnayUROZt9oowXfGfSyJC4JlUrr4V5sR+EaDYpBm/
 v3igbhYWOF18URPS7s2WwKy7J6/Hgb823ZSIgFD1OFJqbrZ3xJ6xvRYyWqXYvDlmggoS
 QzhcPhYafXZSbQFj9IpTAHgEpWPAcjKzmFYyBt0oxAIJz/v+9THm9wkqYWGc8Ti7vVNq
 qCgpdlzfK4gsu3aB2jnHGSgUcVZ4t0YAcUpflLwAhx81lh6Ngncp/jssnCKT8Vt+fgXD
 lzuxHbdeZIUrtSzrBGPMKP2OKQ8d2HQVBAso0XVkyEqAbwFp3dN2JBHNArgpnYK+un7d
 kUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jk2Of2KoNXgHlmgXT5vkNURSJTIBCY/zYe/Sr002+k8=;
 b=DK0mHNvnvcrsz9xH6Cp5sFHS2mL/zycnn0RUfOpuPfEHwd0eyDgSdlSlBBBk6bX4+S
 YvTwhcQaTOzU20kvLJAQ+u4NvVHPVyfL/4DuLf34xnIg1VRPqDl/tTV1G4sjitf/uFOq
 bm/3dJmVsySm2qlssD/a+IDjb9Hpmrtf3bktM8JT7H2tILeRmitZhZHQxitR/5kzj+yC
 Y/MgpGOepOF09wN+NgOANGQcwmoFHMKkmJcDPVuflmi1aWsvI2LvvwgTHZkkrGfqFeyl
 YnydwK/xX6XmBh2XGkgv6uTkAGj2Afuyv4YG0K6wFe/FKkBTZ7ddepfp7yQm4wWLOKGw
 XKsA==
X-Gm-Message-State: AOAM531BZ2puNM/H6VgUmrR5+ZhCXI0GZ+Rg422qy9NyGdiBM8DdCdTQ
 IlLRbQ13c348ROoZ1Y5Bd59gCA==
X-Google-Smtp-Source: ABdhPJzGJCYD6qgfUF8XiHVR+T4sEAgYc1uuGFQ33Z/MitQBZegAWD3xTOMg9dwiGZCu3sFfglD18g==
X-Received: by 2002:a17:903:188:b029:e6:52f4:1b2d with SMTP id
 z8-20020a1709030188b02900e652f41b2dmr27369688plg.58.1616989303097; 
 Sun, 28 Mar 2021 20:41:43 -0700 (PDT)
Received: from [192.168.10.23]
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with UTF8SMTPSA id f23sm15298992pfa.85.2021.03.28.20.41.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 20:41:42 -0700 (PDT)
Message-ID: <c6cf58c4-0901-a331-3c75-ae6e0e8305ad@ozlabs.ru>
Date: Mon, 29 Mar 2021 14:41:38 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:87.0) Gecko/20100101
 Thunderbird/87.0
Subject: Re: [PATCH qemu v17] spapr: Implement Open Firmware client interface
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20210325044015.115925-1-aik@ozlabs.ru>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210325044015.115925-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=aik@ozlabs.ru; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 25/03/2021 15:40, Alexey Kardashevskiy wrote:
> The PAPR platform which describes an OS environment that's presented by
> a combination of a hypervisor and firmware. The features it specifies
> require collaboration between the firmware and the hypervisor.
> 
> Since the beginning, the runtime component of the firmware (RTAS) has
> been implemented as a 20 byte shim which simply forwards it to
> a hypercall implemented in qemu. The boot time firmware component is
> SLOF - but a build that's specific to qemu, and has always needed to be
> updated in sync with it. Even though we've managed to limit the amount
> of runtime communication we need between qemu and SLOF, there's some,
> and it has become increasingly awkward to handle as we've implemented
> new features.
> 
> This implements a boot time OF client interface (CI) which is
> enabled by a new "x-vof" pseries machine option (stands for "Virtual Open
> Firmware). When enabled, QEMU implements the custom H_OF_CLIENT hcall
> which implements Open Firmware Client Interface (OF CI). This allows
> using a smaller stateless firmware which does not have to manage
> the device tree.
> 
> The new "vof.bin" firmware image is included with source code under
> pc-bios/. It also includes RTAS blob.
> 
> This implements a handful of CI methods just to get -kernel/-initrd
> working. In particular, this implements the device tree fetching and
> simple memory allocator - "claim" (an OF CI memory allocator) and updates
> "/memory@0/available" to report the client about available memory.
> 
> This implements changing some device tree properties which we know how
> to deal with, the rest is ignored. To allow changes, this skips
> fdt_pack() when x-vof=on as not packing the blob leaves some room for
> appending.
> 
> In absence of SLOF, this assigns phandles to device tree nodes to make
> device tree traversing work.
> 
> When x-vof=on, this adds "/chosen" every time QEMU (re)builds a tree.
> 
> This adds basic instances support which are managed by a hash map
> ihandle -> [phandle].
> 
> Before the guest started, the used memory is:
> 0..e60 - the initial firmware
> 8000..10000 - stack
> 400000.. - kernel
> 3ea0000.. - initramdisk
> 
> This OF CI does not implement "interpret".
> 
> Unlike SLOF, this does not format uninitialized nvram. Instead, this
> includes a disk image with pre-formatted nvram.
> 
> With this basic support, this can only boot into kernel directly.
> However this is just enough for the petitboot kernel and initradmdisk to
> boot from any possible source. Note this requires reasonably recent guest
> kernel with:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=df5be5be8735
> 
> The immediate benefit is much faster booting time which especially
> crucial with fully emulated early CPU bring up environments. Also this
> may come handy when/if GRUB-in-the-userspace sees light of the day.
> 
> This separates VOF and sPAPR in a hope that VOF bits may be reused by
> other POWERPC boards which do not support pSeries.
> 
> This is coded in assumption that later on we might be adding support for
> booting from QEMU backends (blockdev is the first candidate) without
> devices/drivers in between as OF1275 does not require that and
> it is quite easy to so.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
> 
> The example command line is:
> 
> /home/aik/pbuild/qemu-killslof-localhost-ppc64/qemu-system-ppc64 \
> -nodefaults \
> -chardev stdio,id=STDIO0,signal=off,mux=on \
> -device spapr-vty,id=svty0,reg=0x71000110,chardev=STDIO0 \
> -mon id=MON0,chardev=STDIO0,mode=readline \
> -nographic \
> -vga none \
> -enable-kvm \
> -m 2G \
> -machine pseries,x-vof=on,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off \
> -kernel pbuild/kernel-le-guest/vmlinux \
> -initrd pb/rootfs.cpio.xz \
> -drive id=DRIVE0,if=none,file=./p/qemu-killslof/pc-bios/vof-nvram.bin,format=raw \
> -global spapr-nvram.drive=DRIVE0 \
> -snapshot \
> -smp 8,threads=8 \
> -L /home/aik/t/qemu-ppc64-bios/ \
> -trace events=qemu_trace_events \
> -d guest_errors \
> -chardev socket,id=SOCKET0,server,nowait,path=qemu.mon.tmux26 \
> -mon chardev=SOCKET0,mode=control
> 
> ---
> Changes:
> v17:
> * mv hw/ppc/vof.h include/hw/ppc/vof.h
> * VofMachineIfClass -> VofMachineClass; it is not VofMachineInterface as
> nobody used this scheme, usually "Interface" is dropped, a couple of times
> it is "xxxInterfaceClass" or "xxxIfClass", as used the latter as it is
> used by include/hw/vmstate-if.h
> * added SPDX
> * other fixes from v16 review
> 
> v16:
> * rebased on dwg/ppc-for-6.1
> * s/SpaprVofInterface/VofMachineInterface/
> 
> v15:
> * bugfix: claimed memory for the VOF itself
> * ditched OF_STACK_ADDR and allocate one instead, now it starts from 0x8000
> because it is aligned to its size (no particular reason though)
> * coding style
> * moved nvram.bin up one level
> * ditched bool in the firmware
> * made debugging code conditional using trace_event_get_state() + qemu_loglevel_mask()
> * renamed the CAS interface to SpaprVofInterface
> * added "write" which for now dumps the message and ihandle via
> trace point for early debug assistance
> * commented on when we allocate of_instances in vof_build_dt()
> * store fw_size is SpaprMachine to let spapr_vof_reset() claim it
> * many small fixes from v14's review
> 
> v14:
> * check for truncates in readstr()
> * ditched a separate vof_reset()
> * spapr->vof is a pointer now, dropped the "on" field
> * removed rtas_base from vof and updated comment why we allow setting it
> * added myself to maintainers
> * updated commit log about blockdev and other possible platforms
> * added a note why new hcall is 0x5
> * no in place endianness convertion in spapr_h_vof_client
> * converted all cpu_physical_memory_read/write to address_space_rw
> * git mv hw/ppc/spapr_vof_client.c hw/ppc/spapr_vof.c
> 
> v13:
> * rebase on latest ppc-for-6.0
> * shuffled code around to touch spapr.c less
> 
> v12:
> * split VOF and SPAPR
> 
> v11:
> * added g_autofree
> * fixed gcc warnings
> * fixed few leaks
> * added nvram image to make "nvram --print-config" not crash;
> Note that contrary to  MIN_NVRAM_SIZE (8 * KiB), the actual minimum size
> is 16K, or it just does not work (empty output from "nvram")
> 
> v10:
> * now rebased to compile with meson
> 
> v9:
> * remove special handling of /rtas/rtas-size as now we always add it in QEMU
> * removed leftovers from scsi/grub/stdout/stdin/...
> 
> v8:
> * no read/write/seek
> * no @dev in instances
> * the machine flag is "x-vof" for now
> 
> v7:
> * now we have a small firmware which loads at 0 as SLOF and starts from
> 0x100 as SLOF
> * no MBR/ELF/GRUB business in QEMU anymore
> * blockdev is a separate patch
> * networking is a separate patch
> 
> v6:
> * borrowed a big chunk of commit log introduction from David
> * fixed initial stack pointer (points to the highest address of stack)
> * traces for "interpret" and others
> * disabled  translate_kernel_address() hack so grub can load (work in
> progress)
> * added "milliseconds" for grub
> * fixed "claim" allocator again
> * moved FDT_MAX_SIZE to spapr.h as spapr_of_client.c wants it too for CAS
> * moved the most code possible from spapr.c to spapr_of_client.c, such as
> RTAS, prom entry and FDT build/finalize
> * separated blobs
> * GRUB now proceeds to its console prompt (there are still other issues)
> * parse MBR/GPT to find PReP and load GRUB
> 
> v5:
> * made instances keep device and chardev pointers
> * removed VIO dependencies
> * print error if RTAS memory is not claimed as it should have been
> * pack FDT as "quiesce"
> 
> v4:
> * fixed open
> * validate ihandles in "call-method"
> 
> v3:
> * fixed phandles allocation
> * s/__be32/uint32_t/ as we do not normally have __be32 type in qemu
> * fixed size of /chosen/stdout
> * bunch of renames
> * do not create rtas properties at all, let the client deal with it;
> instead setprop allows changing these in the FDT
> * no more packing FDT when bios=off - nobody needs it and getprop does not
> work otherwise
> * allow updating initramdisk device tree properties (for zImage)
> * added instances
> * fixed stdout on OF's "write"
> * removed special handling for stdout in OF client, spapr-vty handles it
> instead
> 
> v2:
> * fixed claim()
> * added "setprop"
> * cleaner client interface and RTAS blobs management
> * boots to petitboot and further to the target system
> * more trace points
> ---
>   pc-bios/vof/Makefile   |  18 +
>   include/hw/ppc/spapr.h |  17 +-
>   include/hw/ppc/vof.h   |  41 ++
>   pc-bios/vof/vof.h      |  43 ++
>   hw/ppc/spapr.c         |  76 +++-
>   hw/ppc/spapr_hcall.c   |  26 +-
>   hw/ppc/spapr_vof.c     | 153 +++++++
>   hw/ppc/vof.c           | 978 +++++++++++++++++++++++++++++++++++++++++
>   pc-bios/vof/bootmem.c  |  14 +
>   pc-bios/vof/ci.c       |  91 ++++
>   pc-bios/vof/libc.c     |  92 ++++
>   pc-bios/vof/main.c     |  21 +
>   MAINTAINERS            |  11 +
>   hw/ppc/meson.build     |   2 +
>   hw/ppc/trace-events    |  24 +
>   pc-bios/README         |   2 +
>   pc-bios/vof-nvram.bin  | Bin 0 -> 16384 bytes
>   pc-bios/vof.bin        | Bin 0 -> 3128 bytes
>   pc-bios/vof/entry.S    |  51 +++
>   pc-bios/vof/l.lds      |  48 ++
>   20 files changed, 1696 insertions(+), 12 deletions(-)
>   create mode 100644 pc-bios/vof/Makefile
>   create mode 100644 include/hw/ppc/vof.h
>   create mode 100644 pc-bios/vof/vof.h
>   create mode 100644 hw/ppc/spapr_vof.c
>   create mode 100644 hw/ppc/vof.c
>   create mode 100644 pc-bios/vof/bootmem.c
>   create mode 100644 pc-bios/vof/ci.c
>   create mode 100644 pc-bios/vof/libc.c
>   create mode 100644 pc-bios/vof/main.c
>   create mode 100644 pc-bios/vof-nvram.bin
>   create mode 100755 pc-bios/vof.bin
>   create mode 100644 pc-bios/vof/entry.S
>   create mode 100644 pc-bios/vof/l.lds
> 
> diff --git a/pc-bios/vof/Makefile b/pc-bios/vof/Makefile
> new file mode 100644
> index 000000000000..1451e0551818
> --- /dev/null
> +++ b/pc-bios/vof/Makefile
> @@ -0,0 +1,18 @@
> +all: build-all
> +
> +build-all: vof.bin
> +
> +%.o: %.S
> +	cc -m32 -mbig-endian -c -o $@ $<
> +
> +%.o: %.c
> +	cc -m32 -mbig-endian -c -fno-stack-protector -o $@ $<
> +
> +vof.elf: entry.o main.o ci.o bootmem.o libc.o
> +	ld -nostdlib -e_start -Tl.lds -EB -o $@ $^
> +
> +%.bin: %.elf
> +	objcopy -O binary -j .text -j .data -j .toc -j .got2 $^ $@
> +
> +clean:
> +	rm -f *.o vof.bin vof.elf *~
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index bf7cab7a2ce1..3cb121dae707 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -12,6 +12,7 @@
>   #include "hw/ppc/spapr_xive.h"  /* For SpaprXive */
>   #include "hw/ppc/xics.h"        /* For ICSState */
>   #include "hw/ppc/spapr_tpm_proxy.h"
> +#include "hw/ppc/vof.h"
>   
>   struct SpaprVioBus;
>   struct SpaprPhbState;
> @@ -180,6 +181,8 @@ struct SpaprMachineState {
>       uint64_t kernel_addr;
>       uint32_t initrd_base;
>       long initrd_size;
> +    long fw_size;
> +    Vof *vof;
>       uint64_t rtc_offset; /* Now used only during incoming migration */
>       struct PPCTimebase tb;
>       bool has_graphics;
> @@ -554,7 +557,9 @@ struct SpaprMachineState {
>   /* Client Architecture support */
>   #define KVMPPC_H_CAS            (KVMPPC_HCALL_BASE + 0x2)
>   #define KVMPPC_H_UPDATE_DT      (KVMPPC_HCALL_BASE + 0x3)
> -#define KVMPPC_HCALL_MAX        KVMPPC_H_UPDATE_DT
> +/* 0x4 was used for KVMPPC_H_UPDATE_PHANDLE in SLOF */
> +#define KVMPPC_H_VOF_CLIENT     (KVMPPC_HCALL_BASE + 0x5)
> +#define KVMPPC_HCALL_MAX        KVMPPC_H_VOF_CLIENT
>   
>   /*
>    * The hcall range 0xEF00 to 0xEF80 is reserved for use in facilitating
> @@ -945,4 +950,14 @@ bool spapr_check_pagesize(SpaprMachineState *spapr, hwaddr pagesize,
>   void spapr_set_all_lpcrs(target_ulong value, target_ulong mask);
>   hwaddr spapr_get_rtas_addr(void);
>   bool spapr_memory_hot_unplug_supported(SpaprMachineState *spapr);
> +
> +void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
> +                     target_ulong *stack_ptr, Error **errp);
> +void spapr_vof_quiesce(void);
> +target_ulong spapr_h_vof_client(PowerPCCPU *cpu, SpaprMachineState *spapr,
> +                                target_ulong opcode, target_ulong *args);
> +target_ulong spapr_vof_client_architecture_support(CPUState *cs,
> +                                                   target_ulong ovec_addr);
> +void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt);
> +
>   #endif /* HW_SPAPR_H */
> diff --git a/include/hw/ppc/vof.h b/include/hw/ppc/vof.h
> new file mode 100644
> index 000000000000..ab61622a59bf
> --- /dev/null
> +++ b/include/hw/ppc/vof.h
> @@ -0,0 +1,41 @@
> +/*
> + * Virtual Open Firmware
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#ifndef HW_VOF_H
> +#define HW_VOF_H
> +
> +typedef struct Vof {
> +    uint32_t top_addr; /* copied from rma_size */


Uff, found a bug here - when -m8G, spapr->rma_size is 0x2.0000.0000 on 
radix but because of uint32_t it becomes 0 and things break so another 
respin is coming in a day or two.




-- 
Alexey

