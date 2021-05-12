Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB4437B528
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 06:53:28 +0200 (CEST)
Received: from localhost ([::1]:40342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lggsB-0007Nk-WB
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 00:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lggq1-0004st-3j
 for qemu-devel@nongnu.org; Wed, 12 May 2021 00:51:13 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:53782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lggpu-0002eA-LN
 for qemu-devel@nongnu.org; Wed, 12 May 2021 00:51:12 -0400
Received: by mail-pj1-x1033.google.com with SMTP id p17so12882336pjz.3
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 21:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4usIAaCkpfdAx2B+JxMZsFemzakMrKIC5siJFYMT+jw=;
 b=Ok5J/qCu7Id8rrpt1KCi0PgqHqrBU+lpdwBGImOxJ7wwtnQu0FAqeXwdGIRBydBKPM
 E9dtjcVkzls658r2rZ8EwPdaIKD6mi4UaO66jdj/j+Vx2zpV56DtVXoQsRmPBK7jMqTt
 atHmRe/mxf/n0fLtERBJSrPt4DRTJtTANiQIvXdIpA5w0r3eMmTpeR017lVulx3OZqhq
 h7qIgzvqFK2idx2NgcN5mL8xIoSDlC8IV9vqD1aveGW0fyZbgWoENBxXbTIc7BBMSwR5
 G12LQrbcifX6fCywBXgjWuAiw5iPYE8IwzHYCj/TdF+LhLyiEkpJT2FbOxR6MgPwnIkT
 psCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4usIAaCkpfdAx2B+JxMZsFemzakMrKIC5siJFYMT+jw=;
 b=tcRqed013v5pA4z2VQARqPGJAv6/DxVkwvFOj1r8oAwEk3D78TlnKAMFxqq/KIgTks
 DYTVM4zqWvVN18ktorDeG7sfpGwMjmdY1cdv91wkQVKq+EzKx2JaToa/QxCehrLmjzl/
 CJvlaQdyII9rM6SV9zDwykOE6saMWEMId/YKBzOH+8cB9lAXoUlYH9NYvEOX5euNzfXk
 Hfp+GFvf5jnbdsyONYlt3Vw4zc4thYYRcWZo3DKNZ4rns/3oaxYFov+Syq6bKMwQhhvE
 vZjJZrZOwzn+UZ8pd1bKzKiAdCWnPVBrFe2Z0+U1kWksfHtiGRPv1BvU0dpYad6FeAxk
 hilg==
X-Gm-Message-State: AOAM5306yANstJ6avFHcuDv/o1KOIq3cPo/H+zuGdez3v5HWWOISy5bJ
 JthQ726MtGEwYvlgtCxY0N5ayVM/6fvGWg==
X-Google-Smtp-Source: ABdhPJxEB/rz0UGCirTH70BaRKJJ7v3fsfUoVPanZBzIe2EFYfIPt+hEfe9gZj6T0cO/ZDIga9DGbA==
X-Received: by 2002:a17:90a:d493:: with SMTP id
 s19mr9020334pju.200.1620795063099; 
 Tue, 11 May 2021 21:51:03 -0700 (PDT)
Received: from localhost (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242])
 by smtp.gmail.com with UTF8SMTPSA id 80sm15138483pgc.23.2021.05.11.21.50.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 21:51:02 -0700 (PDT)
Message-ID: <4ef1686e-8b06-9c6d-563c-7977439b0cff@ozlabs.ru>
Date: Wed, 12 May 2021 14:50:57 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH qemu v19] spapr: Implement Open Firmware client interface
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20210422125819.1122661-1-aik@ozlabs.ru>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210422125819.1122661-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=aik@ozlabs.ru; helo=mail-pj1-x1033.google.com
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/22/21 22:58, Alexey Kardashevskiy wrote:
> The PAPR platform describes an OS environment that's presented by
> a combination of a hypervisor and firmware. The features it specifies
> require collaboration between the firmware and the hypervisor.


Ping? Thanks,


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
> -m 8G \
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
> v19:
> * put bootargs in the FDT
> * moved setting properties to a VOF machine hook
> * moved fw_size and claim for it to vof_init()
> * added CROSS to the VOF's makefile
> * simplified phandles assigning
> * pass MachineState to all machine hooks instead of calling
> qdev_get_machine (following QOM)
> * bunch of smaller changes and added comments
> * added simple test to attempt to start with x-vof=on
> 
> v18:
> * fixed top addr (max address for "claim") on radix - it equals to ram_size
> and vof->top_addr was uint32_t
> * fixed "available" property which got broken in v14 but it is only visible
> to clients which care (== grub)
> * reshuffled vof_dt_memory_available() calls, added vof_init() to allow
> vof_claim() before rendering the FDT
> 
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
>   pc-bios/vof/Makefile    |  23 +
>   include/hw/ppc/spapr.h  |  19 +-
>   include/hw/ppc/vof.h    |  43 ++
>   pc-bios/vof/vof.h       |  43 ++
>   hw/ppc/spapr.c          |  68 ++-
>   hw/ppc/spapr_hcall.c    |  21 +-
>   hw/ppc/spapr_vof.c      | 208 +++++++++
>   hw/ppc/vof.c            | 934 ++++++++++++++++++++++++++++++++++++++++
>   pc-bios/vof/bootmem.c   |  14 +
>   pc-bios/vof/ci.c        |  91 ++++
>   pc-bios/vof/libc.c      |  92 ++++
>   pc-bios/vof/main.c      |  21 +
>   tests/qtest/rtas-test.c |  15 +-
>   MAINTAINERS             |  12 +
>   hw/ppc/meson.build      |   2 +
>   hw/ppc/trace-events     |  24 ++
>   pc-bios/README          |   2 +
>   pc-bios/vof-nvram.bin   | Bin 0 -> 16384 bytes
>   pc-bios/vof.bin         | Bin 0 -> 3128 bytes
>   pc-bios/vof/entry.S     |  51 +++
>   pc-bios/vof/l.lds       |  48 +++
>   21 files changed, 1720 insertions(+), 11 deletions(-)
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
> index 000000000000..a32fe6d5f24d
> --- /dev/null
> +++ b/pc-bios/vof/Makefile
> @@ -0,0 +1,23 @@
> +all: build-all
> +
> +build-all: vof.bin
> +
> +CROSS ?=
> +CC = $(CROSS)gcc
> +LD = $(CROSS)ld
> +OBJCOPY = $(CROSS)objcopy
> +
> +%.o: %.S
> +	$(CC) -m32 -mbig-endian -c -o $@ $<
> +
> +%.o: %.c
> +	$(CC) -m32 -mbig-endian -c -fno-stack-protector -o $@ $<
> +
> +vof.elf: entry.o main.o ci.o bootmem.o libc.o
> +	$(LD) -nostdlib -e_start -Tl.lds -EB -o $@ $^
> +
> +%.bin: %.elf
> +	$(OBJCOPY) -O binary -j .text -j .data -j .toc -j .got2 $^ $@
> +
> +clean:
> +	rm -f *.o vof.bin vof.elf *~
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index d2b5a9bdf9f5..13db2c7598f5 100644
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
> @@ -180,6 +181,7 @@ struct SpaprMachineState {
>       uint64_t kernel_addr;
>       uint32_t initrd_base;
>       long initrd_size;
> +    Vof *vof;
>       uint64_t rtc_offset; /* Now used only during incoming migration */
>       struct PPCTimebase tb;
>       bool has_graphics;
> @@ -555,7 +557,9 @@ struct SpaprMachineState {
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
> @@ -946,4 +950,17 @@ bool spapr_check_pagesize(SpaprMachineState *spapr, hwaddr pagesize,
>   void spapr_set_all_lpcrs(target_ulong value, target_ulong mask);
>   hwaddr spapr_get_rtas_addr(void);
>   bool spapr_memory_hot_unplug_supported(SpaprMachineState *spapr);
> +
> +void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
> +                     target_ulong *stack_ptr, Error **errp);
> +void spapr_vof_quiesce(MachineState *ms);
> +bool spapr_vof_setprop(MachineState *ms, const char *path, const char *propname,
> +                       void *val, int vallen);
> +target_ulong spapr_h_vof_client(PowerPCCPU *cpu, SpaprMachineState *spapr,
> +                                target_ulong opcode, target_ulong *args);
> +target_ulong spapr_vof_client_architecture_support(MachineState *ms,
> +                                                   CPUState *cs,
> +                                                   target_ulong ovec_addr);
> +void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt);
> +
>   #endif /* HW_SPAPR_H */
> diff --git a/include/hw/ppc/vof.h b/include/hw/ppc/vof.h
> new file mode 100644
> index 000000000000..bb657116b30c
> --- /dev/null
> +++ b/include/hw/ppc/vof.h
> @@ -0,0 +1,43 @@
> +/*
> + * Virtual Open Firmware
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#ifndef HW_VOF_H
> +#define HW_VOF_H
> +
> +typedef struct Vof {
> +    uint64_t top_addr; /* copied from rma_size */
> +    GArray *claimed; /* array of SpaprOfClaimed */
> +    uint64_t claimed_base;
> +    GHashTable *of_instances; /* ihandle -> SpaprOfInstance */
> +    uint32_t of_instance_last;
> +    char *bootargs;
> +    long fw_size;
> +} Vof;
> +
> +uint32_t vof_client_call(MachineState *ms, void *fdt, Vof *vof,
> +                         const char *service, uint32_t *args, unsigned nargs,
> +                         uint32_t *rets, unsigned nrets);
> +uint64_t vof_claim(Vof *vof, uint64_t virt, uint64_t size, uint64_t align);
> +void vof_init(Vof *vof, uint64_t top_addr, Error **errp);
> +void vof_cleanup(Vof *vof);
> +void vof_build_dt(void *fdt, Vof *vof);
> +uint32_t vof_client_open_store(void *fdt, Vof *vof, const char *nodename,
> +                               const char *prop, const char *path);
> +
> +#define TYPE_VOF_MACHINE_IF "vof-machine-if"
> +
> +typedef struct VofMachineIfClass VofMachineIfClass;
> +DECLARE_CLASS_CHECKERS(VofMachineIfClass, VOF_MACHINE, TYPE_VOF_MACHINE_IF)
> +
> +struct VofMachineIfClass {
> +    InterfaceClass parent;
> +    target_ulong (*client_architecture_support)(MachineState *ms, CPUState *cs,
> +                                                target_ulong vec);
> +    void (*quiesce)(MachineState *ms);
> +    bool (*setprop)(MachineState *ms, const char *path, const char *propname,
> +                    void *val, int vallen);
> +};
> +
> +#endif /* HW_VOF_H */
> diff --git a/pc-bios/vof/vof.h b/pc-bios/vof/vof.h
> new file mode 100644
> index 000000000000..2d8958076907
> --- /dev/null
> +++ b/pc-bios/vof/vof.h
> @@ -0,0 +1,43 @@
> +/*
> + * Virtual Open Firmware
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#include <stdarg.h>
> +
> +typedef unsigned char uint8_t;
> +typedef unsigned short uint16_t;
> +typedef unsigned long uint32_t;
> +typedef unsigned long long uint64_t;
> +#define NULL (0)
> +#define PROM_ERROR (-1u)
> +typedef unsigned long ihandle;
> +typedef unsigned long phandle;
> +typedef int size_t;
> +typedef void client(void);
> +
> +/* globals */
> +extern void _prom_entry(void); /* OF CI entry point (i.e. this firmware) */
> +
> +void do_boot(unsigned long addr, unsigned long r3, unsigned long r4);
> +
> +/* libc */
> +int strlen(const char *s);
> +int strcmp(const char *s1, const char *s2);
> +void *memcpy(void *dest, const void *src, size_t n);
> +int memcmp(const void *ptr1, const void *ptr2, size_t n);
> +void *memmove(void *dest, const void *src, size_t n);
> +void *memset(void *dest, int c, size_t size);
> +
> +/* CI wrappers */
> +void ci_panic(const char *str);
> +phandle ci_finddevice(const char *path);
> +uint32_t ci_getprop(phandle ph, const char *propname, void *prop, int len);
> +
> +/* booting from -kernel */
> +void boot_from_memory(uint64_t initrd, uint64_t initrdsize);
> +
> +/* Entry points for CI and RTAS */
> +extern uint32_t ci_entry(uint32_t params);
> +extern unsigned long hv_rtas(unsigned long params);
> +extern unsigned int hv_rtas_size;
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index ea76f72f1b88..b334934afa5e 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -103,6 +103,7 @@
>   #define FDT_MAX_ADDR            0x80000000 /* FDT must stay below that */
>   #define FW_MAX_SIZE             0x400000
>   #define FW_FILE_NAME            "slof.bin"
> +#define FW_FILE_NAME_VOF        "vof.bin"
>   #define FW_OVERHEAD             0x2800000
>   #define KERNEL_LOAD_ADDR        FW_MAX_SIZE
>   
> @@ -1625,22 +1626,37 @@ static void spapr_machine_reset(MachineState *machine)
>   
>       fdt = spapr_build_fdt(spapr, true, FDT_MAX_SIZE);
>   
> -    rc = fdt_pack(fdt);
> +    if (spapr->vof) {
> +        target_ulong stack_ptr = 0;
>   
> -    /* Should only fail if we've built a corrupted tree */
> -    assert(rc == 0);
> +        spapr_vof_reset(spapr, fdt, &stack_ptr, &error_fatal);
>   
> -    /* Load the fdt */
> +        spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
> +                                  stack_ptr, spapr->initrd_base,
> +                                  spapr->initrd_size);
> +        /* We do not pack the FDT as the client may change properties. */
> +    } else {
> +        rc = fdt_pack(fdt);
> +        /* Should only fail if we've built a corrupted tree */
> +        assert(rc == 0);
> +
> +        spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
> +                                  0, fdt_addr, 0);
> +    }
>       qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
> -    cpu_physical_memory_write(fdt_addr, fdt, fdt_totalsize(fdt));
> +
>       g_free(spapr->fdt_blob);
>       spapr->fdt_size = fdt_totalsize(fdt);
>       spapr->fdt_initial_size = spapr->fdt_size;
>       spapr->fdt_blob = fdt;
>   
>       /* Set up the entry state */
> -    spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT, 0, fdt_addr, 0);
>       first_ppc_cpu->env.gpr[5] = 0;
> +    /* VOF client does not expect the FDT so we do not load it to the VM. */
> +    if (!spapr->vof) {
> +        /* Load the fdt */
> +        cpu_physical_memory_write(fdt_addr, spapr->fdt_blob, spapr->fdt_size);
> +    }
>   
>       spapr->fwnmi_system_reset_addr = -1;
>       spapr->fwnmi_machine_check_addr = -1;
> @@ -2640,7 +2656,8 @@ static void spapr_machine_init(MachineState *machine)
>       SpaprMachineState *spapr = SPAPR_MACHINE(machine);
>       SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(machine);
>       MachineClass *mc = MACHINE_GET_CLASS(machine);
> -    const char *bios_name = machine->firmware ?: FW_FILE_NAME;
> +    const char *bios_default = !!spapr->vof ? FW_FILE_NAME_VOF : FW_FILE_NAME;
> +    const char *bios_name = machine->firmware ?: bios_default;
>       const char *kernel_filename = machine->kernel_filename;
>       const char *initrd_filename = machine->initrd_filename;
>       PCIHostState *phb;
> @@ -2997,6 +3014,11 @@ static void spapr_machine_init(MachineState *machine)
>       }
>   
>       qemu_cond_init(&spapr->fwnmi_machine_check_interlock_cond);
> +
> +    if (spapr->vof) {
> +        spapr->vof->fw_size = fw_size;
> +        spapr_register_hypercall(KVMPPC_H_VOF_CLIENT, spapr_h_vof_client);
> +    }
>   }
>   
>   #define DEFAULT_KVM_TYPE "auto"
> @@ -3187,6 +3209,28 @@ static void spapr_set_resize_hpt(Object *obj, const char *value, Error **errp)
>       }
>   }
>   
> +static bool spapr_get_vof(Object *obj, Error **errp)
> +{
> +    SpaprMachineState *spapr = SPAPR_MACHINE(obj);
> +
> +    return spapr->vof != NULL;
> +}
> +
> +static void spapr_set_vof(Object *obj, bool value, Error **errp)
> +{
> +    SpaprMachineState *spapr = SPAPR_MACHINE(obj);
> +
> +    if (spapr->vof) {
> +        vof_cleanup(spapr->vof);
> +        g_free(spapr->vof);
> +        spapr->vof = NULL;
> +    }
> +    if (!value) {
> +        return;
> +    }
> +    spapr->vof = g_malloc0(sizeof(*spapr->vof));
> +}
> +
>   static char *spapr_get_ic_mode(Object *obj, Error **errp)
>   {
>       SpaprMachineState *spapr = SPAPR_MACHINE(obj);
> @@ -3312,6 +3356,10 @@ static void spapr_instance_init(Object *obj)
>                                       stringify(KERNEL_LOAD_ADDR)
>                                       " for -kernel is the default");
>       spapr->kernel_addr = KERNEL_LOAD_ADDR;
> +    object_property_add_bool(obj, "x-vof", spapr_get_vof, spapr_set_vof);
> +    object_property_set_description(obj, "x-vof",
> +                                    "Enable Virtual Open Firmware (experimental)");
> +
>       /* The machine class defines the default interrupt controller mode */
>       spapr->irq = smc->irq;
>       object_property_add_str(obj, "ic-mode", spapr_get_ic_mode,
> @@ -4475,6 +4523,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
>       XICSFabricClass *xic = XICS_FABRIC_CLASS(oc);
>       InterruptStatsProviderClass *ispc = INTERRUPT_STATS_PROVIDER_CLASS(oc);
>       XiveFabricClass *xfc = XIVE_FABRIC_CLASS(oc);
> +    VofMachineIfClass *vmc = VOF_MACHINE_CLASS(oc);
>   
>       mc->desc = "pSeries Logical Partition (PAPR compliant)";
>       mc->ignore_boot_device_suffixes = true;
> @@ -4554,6 +4603,10 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
>       smc->smp_threads_vsmt = true;
>       smc->nr_xirqs = SPAPR_NR_XIRQS;
>       xfc->match_nvt = spapr_match_nvt;
> +
> +    vmc->client_architecture_support = spapr_vof_client_architecture_support;
> +    vmc->quiesce = spapr_vof_quiesce;
> +    vmc->setprop = spapr_vof_setprop;
>   }
>   
>   static const TypeInfo spapr_machine_info = {
> @@ -4573,6 +4626,7 @@ static const TypeInfo spapr_machine_info = {
>           { TYPE_XICS_FABRIC },
>           { TYPE_INTERRUPT_STATS_PROVIDER },
>           { TYPE_XIVE_FABRIC },
> +        { TYPE_VOF_MACHINE_IF },
>           { }
>       },
>   };
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 7b5cd3553c26..3081b42bedc0 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1806,7 +1806,7 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
>           spapr_setup_hpt(spapr);
>       }
>   
> -    fdt = spapr_build_fdt(spapr, false, fdt_bufsize);
> +    fdt = spapr_build_fdt(spapr, spapr->vof != NULL, fdt_bufsize);
>   
>       g_free(spapr->fdt_blob);
>       spapr->fdt_size = fdt_totalsize(fdt);
> @@ -1850,6 +1850,25 @@ static target_ulong h_client_architecture_support(PowerPCCPU *cpu,
>       return ret;
>   }
>   
> +target_ulong spapr_vof_client_architecture_support(MachineState *ms,
> +                                                   CPUState *cs,
> +                                                   target_ulong ovec_addr)
> +{
> +    SpaprMachineState *spapr = SPAPR_MACHINE(ms);
> +
> +    target_ulong ret = do_client_architecture_support(POWERPC_CPU(cs), spapr,
> +                                                      ovec_addr, FDT_MAX_SIZE);
> +
> +    /*
> +     * This adds stdout and generates phandles for boottime and CAS FDTs.
> +     * It is alright to update the FDT here as do_client_architecture_support()
> +     * does not pack it.
> +     */
> +    spapr_vof_client_dt_finalize(spapr, spapr->fdt_blob);
> +
> +    return ret;
> +}
> +
>   static target_ulong h_get_cpu_characteristics(PowerPCCPU *cpu,
>                                                 SpaprMachineState *spapr,
>                                                 target_ulong opcode,
> diff --git a/hw/ppc/spapr_vof.c b/hw/ppc/spapr_vof.c
> new file mode 100644
> index 000000000000..0d9e0d01c3a2
> --- /dev/null
> +++ b/hw/ppc/spapr_vof.c
> @@ -0,0 +1,208 @@
> +/*
> + * SPAPR machine hooks to Virtual Open Firmware,
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include <sys/ioctl.h>
> +#include "qapi/error.h"
> +#include "hw/ppc/spapr.h"
> +#include "hw/ppc/spapr_vio.h"
> +#include "hw/ppc/fdt.h"
> +#include "sysemu/sysemu.h"
> +#include "qom/qom-qobject.h"
> +#include "trace.h"
> +
> +/* Copied from SLOF, and 4K is definitely not enough for GRUB */
> +#define OF_STACK_SIZE       0x8000
> +
> +/* Defined as Big Endian */
> +struct prom_args {
> +    uint32_t service;
> +    uint32_t nargs;
> +    uint32_t nret;
> +    uint32_t args[10];
> +} QEMU_PACKED;
> +
> +target_ulong spapr_h_vof_client(PowerPCCPU *cpu, SpaprMachineState *spapr,
> +                                target_ulong opcode, target_ulong *_args)
> +{
> +    target_ulong args_real = ppc64_phys_to_real(_args[0]);
> +    struct prom_args args_be;
> +    uint32_t args[ARRAY_SIZE(args_be.args)];
> +    uint32_t rets[ARRAY_SIZE(args_be.args)] = { 0 }, ret;
> +    char service[64];
> +    unsigned nargs, nret, i;
> +
> +    if (address_space_rw(&address_space_memory, args_real,
> +                         MEMTXATTRS_UNSPECIFIED, &args_be, sizeof(args_be),
> +                         false) != MEMTX_OK) {
> +        return H_PARAMETER;
> +    }
> +    nargs = be32_to_cpu(args_be.nargs);
> +    if (nargs >= ARRAY_SIZE(args_be.args)) {
> +        return H_PARAMETER;
> +    }
> +
> +    if (address_space_rw(&address_space_memory, be32_to_cpu(args_be.service),
> +                         MEMTXATTRS_UNSPECIFIED, service, sizeof(service),
> +                         false) != MEMTX_OK) {
> +        return H_PARAMETER;
> +    }
> +    if (strnlen(service, sizeof(service)) == sizeof(service)) {
> +        /* Too long service name */
> +        return H_PARAMETER;
> +    }
> +
> +    for (i = 0; i < nargs; ++i) {
> +        args[i] = be32_to_cpu(args_be.args[i]);
> +    }
> +
> +    nret = be32_to_cpu(args_be.nret);
> +    ret = vof_client_call(MACHINE(spapr), spapr->fdt_blob, spapr->vof, service,
> +                          args, nargs, rets, nret);
> +    if (!nret) {
> +        return H_SUCCESS;
> +    }
> +
> +    args_be.args[nargs] = cpu_to_be32(ret);
> +    for (i = 1; i < nret; ++i) {
> +        args_be.args[nargs + i] = cpu_to_be32(rets[i - 1]);
> +    }
> +
> +    if (address_space_rw(&address_space_memory,
> +                         args_real + offsetof(struct prom_args, args[nargs]),
> +                         MEMTXATTRS_UNSPECIFIED, args_be.args + nargs,
> +                         sizeof(args_be.args[0]) * nret, true) != MEMTX_OK) {
> +        return H_PARAMETER;
> +    }
> +
> +    return H_SUCCESS;
> +}
> +
> +void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt)
> +{
> +    char *stdout_path = spapr_vio_stdout_path(spapr->vio_bus);
> +    int chosen;
> +
> +    vof_build_dt(fdt, spapr->vof);
> +
> +    _FDT(chosen = fdt_path_offset(fdt, "/chosen"));
> +    _FDT(fdt_setprop_string(fdt, chosen, "bootargs",
> +                            spapr->vof->bootargs ? : ""));
> +
> +    /*
> +     * SLOF-less setup requires an open instance of stdout for early
> +     * kernel printk. By now all phandles are settled so we can open
> +     * the default serial console.
> +     */
> +    if (stdout_path) {
> +        _FDT(vof_client_open_store(fdt, spapr->vof, "/chosen", "stdout",
> +                                   stdout_path));
> +    }
> +}
> +
> +void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
> +                     target_ulong *stack_ptr, Error **errp)
> +{
> +    Vof *vof = spapr->vof;
> +
> +    vof_init(vof, spapr->rma_size, errp);
> +
> +    *stack_ptr = vof_claim(vof, 0, OF_STACK_SIZE, OF_STACK_SIZE);
> +    if (*stack_ptr == -1) {
> +        error_setg(errp, "Memory allocation for stack failed");
> +        return;
> +    }
> +    /* Stack grows downwards plus reserve space for the minimum stack frame */
> +    *stack_ptr += OF_STACK_SIZE - 0x20;
> +
> +    if (spapr->kernel_size &&
> +        vof_claim(vof, spapr->kernel_addr, spapr->kernel_size, 0) == -1) {
> +        error_setg(errp, "Memory for kernel is in use");
> +        return;
> +    }
> +
> +    if (spapr->initrd_size &&
> +        vof_claim(vof, spapr->initrd_base, spapr->initrd_size, 0) == -1) {
> +        error_setg(errp, "Memory for initramdisk is in use");
> +        return;
> +    }
> +
> +    spapr_vof_client_dt_finalize(spapr, fdt);
> +
> +    /*
> +     * At this point the expected allocation map is:
> +     *
> +     * 0..c38 - the initial firmware
> +     * 8000..10000 - stack
> +     * 400000.. - kernel
> +     * 3ea0000.. - initramdisk
> +     *
> +     * We skip writing FDT as nothing expects it; OF client interface is
> +     * going to be used for reading the device tree.
> +     */
> +}
> +
> +void spapr_vof_quiesce(MachineState *ms)
> +{
> +    SpaprMachineState *spapr = SPAPR_MACHINE(ms);
> +
> +    spapr->fdt_size = fdt_totalsize(spapr->fdt_blob);
> +    spapr->fdt_initial_size = spapr->fdt_size;
> +}
> +
> +bool spapr_vof_setprop(MachineState *ms, const char *path, const char *propname,
> +                       void *val, int vallen)
> +{
> +    SpaprMachineState *spapr = SPAPR_MACHINE(ms);
> +
> +    /*
> +     * We only allow changing properties which we know how to update in QEMU
> +     * OR
> +     * the ones which we know that they need to survive during "quiesce".
> +     */
> +
> +    if (strcmp(path, "/rtas") == 0) {
> +        if (strcmp(propname, "linux,rtas-base") == 0 ||
> +            strcmp(propname, "linux,rtas-entry") == 0) {
> +            /* These need to survive quiesce so let them store in the FDT */
> +            return true;
> +        }
> +    }
> +
> +    if (strcmp(path, "/chosen") == 0) {
> +        if (strcmp(propname, "bootargs") == 0) {
> +            Vof *vof = spapr->vof;
> +
> +            g_free(vof->bootargs);
> +            vof->bootargs = g_strndup(val, vallen);
> +            return true;
> +        }
> +        if (strcmp(propname, "linux,initrd-start") == 0) {
> +            if (vallen == sizeof(uint32_t)) {
> +                spapr->initrd_base = ldl_be_p(val);
> +                return true;
> +            }
> +            if (vallen == sizeof(uint64_t)) {
> +                spapr->initrd_base = ldq_be_p(val);
> +                return true;
> +            }
> +            return false;
> +        }
> +        if (strcmp(propname, "linux,initrd-end") == 0) {
> +            if (vallen == sizeof(uint32_t)) {
> +                spapr->initrd_size = ldl_be_p(val) - spapr->initrd_base;
> +                return true;
> +            }
> +            if (vallen == sizeof(uint64_t)) {
> +                spapr->initrd_size = ldq_be_p(val) - spapr->initrd_base;
> +                return true;
> +            }
> +            return false;
> +        }
> +    }
> +
> +    return true;
> +}
> diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
> new file mode 100644
> index 000000000000..09f75c179dc2
> --- /dev/null
> +++ b/hw/ppc/vof.c
> @@ -0,0 +1,934 @@
> +/*
> + * QEMU PowerPC Virtual Open Firmware.
> + *
> + * This implements client interface from OpenFirmware IEEE1275 on the QEMU
> + * side to leave only a very basic firmware in the VM.
> + *
> + * Copyright (c) 2021 IBM Corporation.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include "qemu/timer.h"
> +#include "qemu/range.h"
> +#include "qemu/units.h"
> +#include "qapi/error.h"
> +#include <sys/ioctl.h>
> +#include "exec/ram_addr.h"
> +#include "exec/address-spaces.h"
> +#include "hw/ppc/vof.h"
> +#include "hw/ppc/fdt.h"
> +#include "sysemu/runstate.h"
> +#include "qom/qom-qobject.h"
> +#include "trace.h"
> +
> +#include <libfdt.h>
> +
> +/*
> + * OF 1275 "nextprop" description suggests is it 32 bytes max but
> + * LoPAPR defines "ibm,query-interrupt-source-number" which is 33 chars long.
> + */
> +#define OF_PROPNAME_LEN_MAX 64
> +
> +#define VOF_MAX_PATH        256
> +#define VOF_MAX_SETPROPLEN  2048
> +#define VOF_MAX_METHODLEN   256
> +#define VOF_MAX_FORTHCODE   256
> +#define VOF_VTY_BUF_SIZE    256
> +
> +typedef struct {
> +    uint64_t start;
> +    uint64_t size;
> +} OfClaimed;
> +
> +typedef struct {
> +    char *path; /* the path used to open the instance */
> +    uint32_t phandle;
> +} OfInstance;
> +
> +#define VOF_MEM_READ(pa, buf, size) \
> +    address_space_read_full(&address_space_memory, \
> +    (pa), MEMTXATTRS_UNSPECIFIED, (buf), (size))
> +#define VOF_MEM_WRITE(pa, buf, size) \
> +    address_space_write(&address_space_memory, \
> +    (pa), MEMTXATTRS_UNSPECIFIED, (buf), (size))
> +
> +static int readstr(hwaddr pa, char *buf, int size)
> +{
> +    if (VOF_MEM_READ(pa, buf, size) != MEMTX_OK) {
> +        return -1;
> +    }
> +    if (strnlen(buf, size) == size) {
> +        buf[size - 1] = '\0';
> +        trace_vof_error_str_truncated(buf, size);
> +        return -1;
> +    }
> +    return 0;
> +}
> +
> +static bool cmpservice(const char *s, unsigned nargs, unsigned nret,
> +                       const char *s1, unsigned nargscheck, unsigned nretcheck)
> +{
> +    if (strcmp(s, s1)) {
> +        return false;
> +    }
> +    if ((nargscheck && (nargs != nargscheck)) ||
> +        (nretcheck && (nret != nretcheck))) {
> +        trace_vof_error_param(s, nargscheck, nretcheck, nargs, nret);
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +static void prop_format(char *tval, int tlen, const void *prop, int len)
> +{
> +    int i;
> +    const unsigned char *c;
> +    char *t;
> +    const char bin[] = "...";
> +
> +    for (i = 0, c = prop; i < len; ++i, ++c) {
> +        if (*c == '\0' && i == len - 1) {
> +            strncpy(tval, prop, tlen - 1);
> +            return;
> +        }
> +        if (*c < 0x20 || *c >= 0x80) {
> +            break;
> +        }
> +    }
> +
> +    for (i = 0, c = prop, t = tval; i < len; ++i, ++c) {
> +        if (t >= tval + tlen - sizeof(bin) - 1 - 2 - 1) {
> +            strcpy(t, bin);
> +            return;
> +        }
> +        if (i && i % 4 == 0 && i != len - 1) {
> +            strcat(t, " ");
> +            ++t;
> +        }
> +        t += sprintf(t, "%02X", *c & 0xFF);
> +    }
> +}
> +
> +static int get_path(const void *fdt, int offset, char *buf, int len)
> +{
> +    int ret;
> +
> +    ret = fdt_get_path(fdt, offset, buf, len - 1);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    buf[len - 1] = '\0';
> +
> +    return strlen(buf) + 1;
> +}
> +
> +static int phandle_to_path(const void *fdt, uint32_t ph, char *buf, int len)
> +{
> +    int ret;
> +
> +    ret = fdt_node_offset_by_phandle(fdt, ph);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    return get_path(fdt, ret, buf, len);
> +}
> +
> +static uint32_t vof_finddevice(const void *fdt, uint32_t nodeaddr)
> +{
> +    char fullnode[VOF_MAX_PATH];
> +    uint32_t ret = -1;
> +    int offset;
> +
> +    if (readstr(nodeaddr, fullnode, sizeof(fullnode))) {
> +        return (uint32_t) ret;
> +    }
> +
> +    offset = fdt_path_offset(fdt, fullnode);
> +    if (offset >= 0) {
> +        ret = fdt_get_phandle(fdt, offset);
> +    }
> +    trace_vof_finddevice(fullnode, ret);
> +    return (uint32_t) ret;
> +}
> +
> +static const void *getprop(const void *fdt, int nodeoff, const char *propname,
> +                           int *proplen, bool *write0)
> +{
> +    const char *unit, *prop;
> +
> +    /*
> +     * The "name" property is not actually stored as a property in the FDT,
> +     * we emulate it by returning a pointer to the node's name and adjust
> +     * proplen to include only the name but not the unit.
> +     */
> +    if (strcmp(propname, "name") == 0) {
> +        prop = fdt_get_name(fdt, nodeoff, proplen);
> +        if (!prop) {
> +            *proplen = 0;
> +            return NULL;
> +        }
> +
> +        unit = memchr(prop, '@', *proplen);
> +        if (unit) {
> +            *proplen = unit - prop;
> +        }
> +        *proplen += 1;
> +
> +        /*
> +         * Since it might be cut at "@" and there will be no trailing zero
> +         * in the prop buffer, tell the caller to write zero at the end.
> +         */
> +        if (write0) {
> +            *write0 = true;
> +        }
> +        return prop;
> +    }
> +
> +    if (write0) {
> +        *write0 = false;
> +    }
> +    return fdt_getprop(fdt, nodeoff, propname, proplen);
> +}
> +
> +static uint32_t vof_getprop(const void *fdt, uint32_t nodeph, uint32_t pname,
> +                            uint32_t valaddr, uint32_t vallen)
> +{
> +    char propname[OF_PROPNAME_LEN_MAX + 1];
> +    uint32_t ret = 0;
> +    int proplen = 0;
> +    const void *prop;
> +    char trval[64] = "";
> +    int nodeoff = fdt_node_offset_by_phandle(fdt, nodeph);
> +    bool write0;
> +
> +    if (nodeoff < 0) {
> +        return -1;
> +    }
> +    if (readstr(pname, propname, sizeof(propname))) {
> +        return -1;
> +    }
> +    prop = getprop(fdt, nodeoff, propname, &proplen, &write0);
> +    if (prop) {
> +        const char zero = 0;
> +        int cb = MIN(proplen, vallen);
> +
> +        if (VOF_MEM_WRITE(valaddr, prop, cb) != MEMTX_OK ||
> +            /* if that was "name" with a unit address, overwrite '@' with '0' */
> +            (write0 &&
> +             cb == proplen &&
> +             VOF_MEM_WRITE(valaddr + cb - 1, &zero, 1) != MEMTX_OK)) {
> +            ret = -1;
> +        } else {
> +            /*
> +             * OF1275 says:
> +             * "Size is either the actual size of the property, or -1 if name
> +             * does not exist", hence returning proplen instead of cb.
> +             */
> +            ret = proplen;
> +            /* Do not format a value if tracepoint is silent, for performance */
> +            if (trace_event_get_state(TRACE_VOF_GETPROP) &&
> +                qemu_loglevel_mask(LOG_TRACE)) {
> +                prop_format(trval, sizeof(trval), prop, ret);
> +            }
> +        }
> +    } else {
> +        ret = -1;
> +    }
> +    trace_vof_getprop(nodeph, propname, ret, trval);
> +
> +    return ret;
> +}
> +
> +static uint32_t vof_getproplen(const void *fdt, uint32_t nodeph, uint32_t pname)
> +{
> +    char propname[OF_PROPNAME_LEN_MAX + 1];
> +    uint32_t ret = 0;
> +    int proplen = 0;
> +    const void *prop;
> +    int nodeoff = fdt_node_offset_by_phandle(fdt, nodeph);
> +
> +    if (nodeoff < 0) {
> +        return -1;
> +    }
> +    if (readstr(pname, propname, sizeof(propname))) {
> +        return -1;
> +    }
> +    prop = getprop(fdt, nodeoff, propname, &proplen, NULL);
> +    if (prop) {
> +        ret = proplen;
> +    } else {
> +        ret = -1;
> +    }
> +    trace_vof_getproplen(nodeph, propname, ret);
> +
> +    return ret;
> +}
> +
> +static uint32_t vof_setprop(MachineState *ms, void *fdt, Vof *vof,
> +                            uint32_t nodeph, uint32_t pname,
> +                            uint32_t valaddr, uint32_t vallen)
> +{
> +    char propname[OF_PROPNAME_LEN_MAX + 1];
> +    uint32_t ret = -1;
> +    int offset;
> +    char trval[64] = "";
> +    char nodepath[VOF_MAX_PATH] = "";
> +    Object *vmo = object_dynamic_cast(OBJECT(ms), TYPE_VOF_MACHINE_IF);
> +    g_autofree char *val = NULL;
> +
> +    if (vallen > VOF_MAX_SETPROPLEN) {
> +        goto trace_exit;
> +    }
> +    if (readstr(pname, propname, sizeof(propname))) {
> +        goto trace_exit;
> +    }
> +    offset = fdt_node_offset_by_phandle(fdt, nodeph);
> +    if (offset < 0) {
> +        goto trace_exit;
> +    }
> +    ret = get_path(fdt, offset, nodepath, sizeof(nodepath));
> +    if (ret <= 0) {
> +        goto trace_exit;
> +    }
> +
> +    val = g_malloc0(vallen);
> +    if (VOF_MEM_READ(valaddr, val, vallen) != MEMTX_OK) {
> +        goto trace_exit;
> +    }
> +
> +    if (vmo) {
> +        VofMachineIfClass *vmc = VOF_MACHINE_GET_CLASS(vmo);
> +
> +        if (!vmc->setprop(ms, nodepath, propname, val, vallen)) {
> +            goto trace_exit;
> +        }
> +    }
> +
> +    ret = fdt_setprop(fdt, offset, propname, val, vallen);
> +    if (ret) {
> +        goto trace_exit;
> +    }
> +
> +    if (trace_event_get_state(TRACE_VOF_SETPROP) &&
> +        qemu_loglevel_mask(LOG_TRACE)) {
> +        prop_format(trval, sizeof(trval), val, vallen);
> +    }
> +    ret = vallen;
> +
> +trace_exit:
> +    trace_vof_setprop(nodeph, propname, trval, vallen, ret);
> +
> +    return ret;
> +}
> +
> +static uint32_t vof_nextprop(const void *fdt, uint32_t phandle,
> +                             uint32_t prevaddr, uint32_t nameaddr)
> +{
> +    int offset, nodeoff = fdt_node_offset_by_phandle(fdt, phandle);
> +    char prev[OF_PROPNAME_LEN_MAX + 1];
> +    const char *tmp;
> +
> +    if (readstr(prevaddr, prev, sizeof(prev))) {
> +        return -1;
> +    }
> +
> +    fdt_for_each_property_offset(offset, fdt, nodeoff) {
> +        if (!fdt_getprop_by_offset(fdt, offset, &tmp, NULL)) {
> +            return 0;
> +        }
> +        if (prev[0] == '\0' || strcmp(prev, tmp) == 0) {
> +            if (prev[0] != '\0') {
> +                offset = fdt_next_property_offset(fdt, offset);
> +                if (offset < 0) {
> +                    return 0;
> +                }
> +            }
> +            if (!fdt_getprop_by_offset(fdt, offset, &tmp, NULL)) {
> +                return 0;
> +            }
> +
> +            if (VOF_MEM_WRITE(nameaddr, tmp, strlen(tmp) + 1) != MEMTX_OK) {
> +                return -1;
> +            }
> +            return 1;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +static uint32_t vof_peer(const void *fdt, uint32_t phandle)
> +{
> +    int ret;
> +
> +    if (phandle == 0) {
> +        ret = fdt_path_offset(fdt, "/");
> +    } else {
> +        ret = fdt_next_subnode(fdt, fdt_node_offset_by_phandle(fdt, phandle));
> +    }
> +
> +    if (ret < 0) {
> +        ret = 0;
> +    } else {
> +        ret = fdt_get_phandle(fdt, ret);
> +    }
> +
> +    return ret;
> +}
> +
> +static uint32_t vof_child(const void *fdt, uint32_t phandle)
> +{
> +    int ret = fdt_first_subnode(fdt, fdt_node_offset_by_phandle(fdt, phandle));
> +
> +    if (ret < 0) {
> +        ret = 0;
> +    } else {
> +        ret = fdt_get_phandle(fdt, ret);
> +    }
> +
> +    return ret;
> +}
> +
> +static uint32_t vof_parent(const void *fdt, uint32_t phandle)
> +{
> +    int ret = fdt_parent_offset(fdt, fdt_node_offset_by_phandle(fdt, phandle));
> +
> +    if (ret < 0) {
> +        ret = 0;
> +    } else {
> +        ret = fdt_get_phandle(fdt, ret);
> +    }
> +
> +    return ret;
> +}
> +
> +static uint32_t vof_do_open(void *fdt, Vof *vof, const char *path)
> +{
> +    int offset;
> +    uint32_t ret = 0;
> +    OfInstance *inst = NULL;
> +
> +    if (vof->of_instance_last == 0xFFFFFFFF) {
> +        /* We do not recycle ihandles yet */
> +        goto trace_exit;
> +    }
> +
> +    offset = fdt_path_offset(fdt, path);
> +    if (offset < 0) {
> +        trace_vof_error_unknown_path(path);
> +        goto trace_exit;
> +    }
> +
> +    inst = g_new0(OfInstance, 1);
> +    inst->phandle = fdt_get_phandle(fdt, offset);
> +    g_assert(inst->phandle);
> +    ++vof->of_instance_last;
> +
> +    inst->path = g_strdup(path);
> +    g_hash_table_insert(vof->of_instances,
> +                        GINT_TO_POINTER(vof->of_instance_last),
> +                        inst);
> +    ret = vof->of_instance_last;
> +
> +trace_exit:
> +    trace_vof_open(path, inst ? inst->phandle : 0, ret);
> +
> +    return ret;
> +}
> +
> +uint32_t vof_client_open_store(void *fdt, Vof *vof, const char *nodename,
> +                               const char *prop, const char *path)
> +{
> +    int node = fdt_path_offset(fdt, nodename);
> +    uint32_t inst = vof_do_open(fdt, vof, path);
> +
> +    return fdt_setprop_cell(fdt, node, prop, inst);
> +}
> +
> +static uint32_t vof_open(void *fdt, Vof *vof, uint32_t pathaddr)
> +{
> +    char path[VOF_MAX_PATH];
> +
> +    if (readstr(pathaddr, path, sizeof(path))) {
> +        return -1;
> +    }
> +
> +    return vof_do_open(fdt, vof, path);
> +}
> +
> +static void vof_close(Vof *vof, uint32_t ihandle)
> +{
> +    if (!g_hash_table_remove(vof->of_instances, GINT_TO_POINTER(ihandle))) {
> +        trace_vof_error_unknown_ihandle_close(ihandle);
> +    }
> +}
> +
> +static uint32_t vof_instance_to_package(Vof *vof, uint32_t ihandle)
> +{
> +    gpointer instp = g_hash_table_lookup(vof->of_instances,
> +                                         GINT_TO_POINTER(ihandle));
> +    uint32_t ret = -1;
> +
> +    if (instp) {
> +        ret = ((OfInstance *)instp)->phandle;
> +    }
> +    trace_vof_instance_to_package(ihandle, ret);
> +
> +    return ret;
> +}
> +
> +static uint32_t vof_package_to_path(const void *fdt, uint32_t phandle,
> +                                    uint32_t buf, uint32_t len)
> +{
> +    uint32_t ret = -1;
> +    char tmp[VOF_MAX_PATH] = "";
> +
> +    ret = phandle_to_path(fdt, phandle, tmp, sizeof(tmp));
> +    if (ret > 0) {
> +        if (VOF_MEM_WRITE(buf, tmp, ret) != MEMTX_OK) {
> +            ret = -1;
> +        }
> +    }
> +
> +    trace_vof_package_to_path(phandle, tmp, ret);
> +
> +    return ret;
> +}
> +
> +static uint32_t vof_instance_to_path(void *fdt, Vof *vof, uint32_t ihandle,
> +                                     uint32_t buf, uint32_t len)
> +{
> +    uint32_t ret = -1;
> +    uint32_t phandle = vof_instance_to_package(vof, ihandle);
> +    char tmp[VOF_MAX_PATH] = "";
> +
> +    if (phandle != -1) {
> +        ret = phandle_to_path(fdt, phandle, tmp, sizeof(tmp));
> +        if (ret > 0) {
> +            if (VOF_MEM_WRITE(buf, tmp, ret) != MEMTX_OK) {
> +                ret = -1;
> +            }
> +        }
> +    }
> +    trace_vof_instance_to_path(ihandle, phandle, tmp, ret);
> +
> +    return ret;
> +}
> +
> +static uint32_t vof_write(Vof *vof, uint32_t ihandle, uint32_t buf,
> +                          uint32_t len)
> +{
> +    char tmp[VOF_VTY_BUF_SIZE];
> +    unsigned cb;
> +    OfInstance *inst = (OfInstance *)
> +        g_hash_table_lookup(vof->of_instances, GINT_TO_POINTER(ihandle));
> +
> +    if (!inst) {
> +        trace_vof_error_write(ihandle);
> +        return -1;
> +    }
> +
> +    for ( ; len > 0; len -= cb) {
> +        cb = MIN(len, sizeof(tmp) - 1);
> +        if (VOF_MEM_READ(buf, tmp, cb) != MEMTX_OK) {
> +            return -1;
> +        }
> +
> +        /* FIXME: there is no backend(s) yet so just call a trace */
> +        if (trace_event_get_state(TRACE_VOF_WRITE) &&
> +            qemu_loglevel_mask(LOG_TRACE)) {
> +            tmp[cb] = '\0';
> +            trace_vof_write(ihandle, cb, tmp);
> +        }
> +    }
> +
> +    return len;
> +}
> +
> +static void vof_claimed_dump(GArray *claimed)
> +{
> +    int i;
> +    OfClaimed c;
> +
> +    if (trace_event_get_state(TRACE_VOF_CLAIMED) &&
> +        qemu_loglevel_mask(LOG_TRACE)) {
> +
> +        for (i = 0; i < claimed->len; ++i) {
> +            c = g_array_index(claimed, OfClaimed, i);
> +            trace_vof_claimed(c.start, c.start + c.size, c.size);
> +        }
> +    }
> +}
> +
> +static bool vof_claim_avail(GArray *claimed, uint64_t virt, uint64_t size)
> +{
> +    int i;
> +    OfClaimed c;
> +
> +    for (i = 0; i < claimed->len; ++i) {
> +        c = g_array_index(claimed, OfClaimed, i);
> +        if (ranges_overlap(c.start, c.size, virt, size)) {
> +            return false;
> +        }
> +    }
> +
> +    return true;
> +}
> +
> +static void vof_claim_add(GArray *claimed, uint64_t virt, uint64_t size)
> +{
> +    OfClaimed newclaim;
> +
> +    newclaim.start = virt;
> +    newclaim.size = size;
> +    g_array_append_val(claimed, newclaim);
> +}
> +
> +static gint of_claimed_compare_func(gconstpointer a, gconstpointer b)
> +{
> +    return ((OfClaimed *)a)->start - ((OfClaimed *)b)->start;
> +}
> +
> +static void vof_dt_memory_available(void *fdt, GArray *claimed, uint64_t base)
> +{
> +    int i, n, offset, proplen = 0;
> +    uint64_t *mem0_reg;
> +    g_autofree struct { uint64_t start, size; } *avail = NULL;
> +
> +    if (!fdt || !claimed) {
> +        return;
> +    }
> +
> +    offset = fdt_path_offset(fdt, "/memory@0");
> +    _FDT(offset);
> +
> +    mem0_reg = (uint64_t *) fdt_getprop(fdt, offset, "reg", &proplen);
> +    g_assert(mem0_reg && proplen == 2 * sizeof(uint64_t));
> +
> +    g_array_sort(claimed, of_claimed_compare_func);
> +    vof_claimed_dump(claimed);
> +
> +    /*
> +     * VOF resides in the first page so we do not need to check if there is
> +     * available memory before the first claimed block
> +     */
> +    g_assert(claimed->len && (g_array_index(claimed, OfClaimed, 0).start == 0));
> +
> +    avail = g_malloc0(sizeof(avail[0]) * claimed->len);
> +    for (i = 0, n = 0; i < claimed->len; ++i) {
> +        OfClaimed c = g_array_index(claimed, OfClaimed, i);
> +        uint64_t start, size;
> +
> +        start = c.start + c.size;
> +        if (i < claimed->len - 1) {
> +            OfClaimed cn = g_array_index(claimed, OfClaimed, i + 1);
> +
> +            size = cn.start - start;
> +        } else {
> +            size = be64_to_cpu(mem0_reg[1]) - start;
> +        }
> +        avail[n].start = cpu_to_be64(start);
> +        avail[n].size = cpu_to_be64(size);
> +
> +        if (size) {
> +            trace_vof_avail(c.start + c.size, c.start + c.size + size, size);
> +            ++n;
> +        }
> +    }
> +    _FDT((fdt_setprop(fdt, offset, "available", avail, sizeof(avail[0]) * n)));
> +}
> +
> +/*
> + * OF1275:
> + * "Allocates size bytes of memory. If align is zero, the allocated range
> + * begins at the virtual address virt. Otherwise, an aligned address is
> + * automatically chosen and the input argument virt is ignored".
> + *
> + * In other words, exactly one of @virt and @align is non-zero.
> + */
> +uint64_t vof_claim(Vof *vof, uint64_t virt, uint64_t size,
> +                   uint64_t align)
> +{
> +    uint64_t ret;
> +
> +    if (size == 0) {
> +        ret = -1;
> +    } else if (align == 0) {
> +        if (!vof_claim_avail(vof->claimed, virt, size)) {
> +            ret = -1;
> +        } else {
> +            ret = virt;
> +        }
> +    } else {
> +        vof->claimed_base = QEMU_ALIGN_UP(vof->claimed_base, align);
> +        while (1) {
> +            if (vof->claimed_base >= vof->top_addr) {
> +                error_report("Out of RMA memory for the OF client");
> +                return -1;
> +            }
> +            if (vof_claim_avail(vof->claimed, vof->claimed_base, size)) {
> +                break;
> +            }
> +            vof->claimed_base += size;
> +        }
> +        ret = vof->claimed_base;
> +    }
> +
> +    if (ret != -1) {
> +        vof->claimed_base = MAX(vof->claimed_base, ret + size);
> +        vof_claim_add(vof->claimed, ret, size);
> +    }
> +    trace_vof_claim(virt, size, align, ret);
> +
> +    return ret;
> +}
> +
> +static uint32_t vof_release(Vof *vof, uint64_t virt, uint64_t size)
> +{
> +    uint32_t ret = -1;
> +    int i;
> +    GArray *claimed = vof->claimed;
> +    OfClaimed c;
> +
> +    for (i = 0; i < claimed->len; ++i) {
> +        c = g_array_index(claimed, OfClaimed, i);
> +        if (c.start == virt && c.size == size) {
> +            g_array_remove_index(claimed, i);
> +            ret = 0;
> +            break;
> +        }
> +    }
> +
> +    trace_vof_release(virt, size, ret);
> +
> +    return ret;
> +}
> +
> +static void vof_instantiate_rtas(Error **errp)
> +{
> +    error_setg(errp, "The firmware should have instantiated RTAS");
> +}
> +
> +static uint32_t vof_call_method(MachineState *ms, Vof *vof, uint32_t methodaddr,
> +                                uint32_t ihandle, uint32_t param1,
> +                                uint32_t param2, uint32_t param3,
> +                                uint32_t param4, uint32_t *ret2)
> +{
> +    uint32_t ret = -1;
> +    char method[VOF_MAX_METHODLEN] = "";
> +    OfInstance *inst;
> +
> +    if (!ihandle) {
> +        goto trace_exit;
> +    }
> +
> +    inst = (OfInstance *) g_hash_table_lookup(vof->of_instances,
> +                                              GINT_TO_POINTER(ihandle));
> +    if (!inst) {
> +        goto trace_exit;
> +    }
> +
> +    if (readstr(methodaddr, method, sizeof(method))) {
> +        goto trace_exit;
> +    }
> +
> +    if (strcmp(inst->path, "/") == 0) {
> +        if (strcmp(method, "ibm,client-architecture-support") == 0) {
> +            Object *vmo = object_dynamic_cast(OBJECT(ms), TYPE_VOF_MACHINE_IF);
> +
> +            if (vmo) {
> +                VofMachineIfClass *vmc = VOF_MACHINE_GET_CLASS(vmo);
> +
> +                ret = vmc->client_architecture_support(ms, first_cpu, param1);
> +            }
> +
> +            *ret2 = 0;
> +        }
> +    } else if (strcmp(inst->path, "/rtas") == 0) {
> +        if (strcmp(method, "instantiate-rtas") == 0) {
> +            vof_instantiate_rtas(&error_fatal);
> +            ret = 0;
> +            *ret2 = param1; /* rtas-base */
> +        }
> +    } else {
> +        trace_vof_error_unknown_method(method);
> +    }
> +
> +trace_exit:
> +    trace_vof_method(ihandle, method, param1, ret, *ret2);
> +
> +    return ret;
> +}
> +
> +static uint32_t vof_call_interpret(uint32_t cmdaddr, uint32_t param1,
> +                                   uint32_t param2, uint32_t *ret2)
> +{
> +    uint32_t ret = -1;
> +    char cmd[VOF_MAX_FORTHCODE] = "";
> +
> +    /* No interpret implemented so just call a trace */
> +    readstr(cmdaddr, cmd, sizeof(cmd));
> +    trace_vof_interpret(cmd, param1, param2, ret, *ret2);
> +
> +    return ret;
> +}
> +
> +static void vof_quiesce(MachineState *ms, void *fdt, Vof *vof)
> +{
> +    Object *vmo = object_dynamic_cast(OBJECT(ms), TYPE_VOF_MACHINE_IF);
> +    /* After "quiesce", no change is expected to the FDT, pack FDT to ensure */
> +    int rc = fdt_pack(fdt);
> +
> +    assert(rc == 0);
> +
> +    if (vmo) {
> +        VofMachineIfClass *vmc = VOF_MACHINE_GET_CLASS(vmo);
> +
> +        vmc->quiesce(ms);
> +    }
> +
> +    vof_claimed_dump(vof->claimed);
> +}
> +
> +uint32_t vof_client_call(MachineState *ms, void *fdt, Vof *vof,
> +                         const char *service,
> +                         uint32_t *args, unsigned nargs,
> +                         uint32_t *rets, unsigned nrets)
> +{
> +    uint32_t ret = 0;
> +
> +    /* @nrets includes the value which this function returns */
> +#define cmpserv(s, a, r) \
> +    cmpservice(service, nargs, nrets, (s), (a), (r))
> +
> +    if (cmpserv("finddevice", 1, 1)) {
> +        ret = vof_finddevice(fdt, args[0]);
> +    } else if (cmpserv("getprop", 4, 1)) {
> +        ret = vof_getprop(fdt, args[0], args[1], args[2], args[3]);
> +    } else if (cmpserv("getproplen", 2, 1)) {
> +        ret = vof_getproplen(fdt, args[0], args[1]);
> +    } else if (cmpserv("setprop", 4, 1)) {
> +        ret = vof_setprop(ms, fdt, vof, args[0], args[1], args[2], args[3]);
> +    } else if (cmpserv("nextprop", 3, 1)) {
> +        ret = vof_nextprop(fdt, args[0], args[1], args[2]);
> +    } else if (cmpserv("peer", 1, 1)) {
> +        ret = vof_peer(fdt, args[0]);
> +    } else if (cmpserv("child", 1, 1)) {
> +        ret = vof_child(fdt, args[0]);
> +    } else if (cmpserv("parent", 1, 1)) {
> +        ret = vof_parent(fdt, args[0]);
> +    } else if (cmpserv("open", 1, 1)) {
> +        ret = vof_open(fdt, vof, args[0]);
> +    } else if (cmpserv("close", 1, 0)) {
> +        vof_close(vof, args[0]);
> +    } else if (cmpserv("instance-to-package", 1, 1)) {
> +        ret = vof_instance_to_package(vof, args[0]);
> +    } else if (cmpserv("package-to-path", 3, 1)) {
> +        ret = vof_package_to_path(fdt, args[0], args[1], args[2]);
> +    } else if (cmpserv("instance-to-path", 3, 1)) {
> +        ret = vof_instance_to_path(fdt, vof, args[0], args[1], args[2]);
> +    } else if (cmpserv("write", 3, 1)) {
> +        ret = vof_write(vof, args[0], args[1], args[2]);
> +    } else if (cmpserv("claim", 3, 1)) {
> +        ret = vof_claim(vof, args[0], args[1], args[2]);
> +        if (ret != -1) {
> +            vof_dt_memory_available(fdt, vof->claimed, vof->claimed_base);
> +        }
> +    } else if (cmpserv("release", 2, 0)) {
> +        ret = vof_release(vof, args[0], args[1]);
> +        if (ret != -1) {
> +            vof_dt_memory_available(fdt, vof->claimed, vof->claimed_base);
> +        }
> +    } else if (cmpserv("call-method", 0, 0)) {
> +        ret = vof_call_method(ms, vof, args[0], args[1], args[2], args[3],
> +                              args[4], args[5], rets);
> +    } else if (cmpserv("interpret", 0, 0)) {
> +        ret = vof_call_interpret(args[0], args[1], args[2], rets);
> +    } else if (cmpserv("milliseconds", 0, 1)) {
> +        ret = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
> +    } else if (cmpserv("quiesce", 0, 0)) {
> +        vof_quiesce(ms, fdt, vof);
> +    } else if (cmpserv("exit", 0, 0)) {
> +        error_report("Stopped as the VM requested \"exit\"");
> +        vm_stop(RUN_STATE_PAUSED);
> +    } else {
> +        trace_vof_error_unknown_service(service, nargs, nrets);
> +        ret = -1;
> +    }
> +
> +    return ret;
> +}
> +
> +static void vof_instance_free(gpointer data)
> +{
> +    OfInstance *inst = (OfInstance *) data;
> +
> +    g_free(inst->path);
> +    g_free(inst);
> +}
> +
> +void vof_init(Vof *vof, uint64_t top_addr, Error **errp)
> +{
> +    vof_cleanup(vof);
> +
> +    vof->of_instances = g_hash_table_new_full(g_direct_hash, g_direct_equal,
> +                                              NULL, vof_instance_free);
> +    vof->claimed = g_array_new(false, false, sizeof(OfClaimed));
> +
> +    /* Keep allocations in 32bit as CLI ABI can only return cells==32bit */
> +    vof->top_addr = MIN(top_addr, 4 * GiB);
> +    if (vof_claim(vof, 0, vof->fw_size, 0) == -1) {
> +        error_setg(errp, "Memory for firmware is in use");
> +    }
> +}
> +
> +void vof_cleanup(Vof *vof)
> +{
> +    if (vof->claimed) {
> +        g_array_unref(vof->claimed);
> +    }
> +    if (vof->of_instances) {
> +        g_hash_table_unref(vof->of_instances);
> +    }
> +    vof->claimed = NULL;
> +    vof->of_instances = NULL;
> +}
> +
> +void vof_build_dt(void *fdt, Vof *vof)
> +{
> +    uint32_t phandle = fdt_get_max_phandle(fdt);
> +    int offset, proplen = 0;
> +    const void *prop;
> +
> +    /* Assign phandles to nodes without predefined phandles (like XICS/XIVE) */
> +    for (offset = fdt_next_node(fdt, -1, NULL);
> +         offset >= 0;
> +         offset = fdt_next_node(fdt, offset, NULL)) {
> +        prop = fdt_getprop(fdt, offset, "phandle", &proplen);
> +        if (prop) {
> +            continue;
> +        }
> +        ++phandle;
> +        _FDT(fdt_setprop_cell(fdt, offset, "phandle", phandle));
> +    }
> +
> +    vof_dt_memory_available(fdt, vof->claimed, vof->claimed_base);
> +}
> +
> +static const TypeInfo vof_machine_if_info = {
> +    .name = TYPE_VOF_MACHINE_IF,
> +    .parent = TYPE_INTERFACE,
> +    .class_size = sizeof(VofMachineIfClass),
> +};
> +
> +static void vof_machine_if_register_types(void)
> +{
> +    type_register_static(&vof_machine_if_info);
> +}
> +type_init(vof_machine_if_register_types)
> diff --git a/pc-bios/vof/bootmem.c b/pc-bios/vof/bootmem.c
> new file mode 100644
> index 000000000000..771b9e95f95d
> --- /dev/null
> +++ b/pc-bios/vof/bootmem.c
> @@ -0,0 +1,14 @@
> +#include "vof.h"
> +
> +void boot_from_memory(uint64_t initrd, uint64_t initrdsize)
> +{
> +    uint64_t kern[2];
> +    phandle chosen = ci_finddevice("/chosen");
> +
> +    if (ci_getprop(chosen, "qemu,boot-kernel", kern, sizeof(kern)) !=
> +        sizeof(kern)) {
> +        return;
> +    }
> +
> +    do_boot(kern[0], initrd, initrdsize);
> +}
> diff --git a/pc-bios/vof/ci.c b/pc-bios/vof/ci.c
> new file mode 100644
> index 000000000000..a80806580dd0
> --- /dev/null
> +++ b/pc-bios/vof/ci.c
> @@ -0,0 +1,91 @@
> +#include "vof.h"
> +
> +struct prom_args {
> +    uint32_t service;
> +    uint32_t nargs;
> +    uint32_t nret;
> +    uint32_t args[10];
> +};
> +
> +typedef unsigned long prom_arg_t;
> +
> +#define ADDR(x) (uint32_t)(x)
> +
> +static int prom_handle(struct prom_args *pargs)
> +{
> +    void *rtasbase;
> +    uint32_t rtassize = 0;
> +    phandle rtas;
> +
> +    if (strcmp("call-method", (void *)(unsigned long) pargs->service)) {
> +        return -1;
> +    }
> +
> +    if (strcmp("instantiate-rtas", (void *)(unsigned long) pargs->args[0])) {
> +        return -1;
> +    }
> +
> +    rtas = ci_finddevice("/rtas");
> +    /* rtas-size is set by QEMU depending of FWNMI support */
> +    ci_getprop(rtas, "rtas-size", &rtassize, sizeof(rtassize));
> +    if (rtassize < hv_rtas_size) {
> +        return -1;
> +    }
> +
> +    rtasbase = (void *)(unsigned long) pargs->args[2];
> +
> +    memcpy(rtasbase, hv_rtas, hv_rtas_size);
> +    pargs->args[pargs->nargs] = 0;
> +    pargs->args[pargs->nargs + 1] = pargs->args[2];
> +
> +    return 0;
> +}
> +
> +void prom_entry(uint32_t args)
> +{
> +    if (prom_handle((void *)(unsigned long) args)) {
> +        ci_entry(args);
> +    }
> +}
> +
> +static int call_ci(const char *service, int nargs, int nret, ...)
> +{
> +    int i;
> +    struct prom_args args;
> +    va_list list;
> +
> +    args.service = ADDR(service);
> +    args.nargs = nargs;
> +    args.nret = nret;
> +
> +    va_start(list, nret);
> +    for (i = 0; i < nargs; i++) {
> +        args.args[i] = va_arg(list, prom_arg_t);
> +    }
> +    va_end(list);
> +
> +    for (i = 0; i < nret; i++) {
> +        args.args[nargs + i] = 0;
> +    }
> +
> +    if (ci_entry((uint32_t)(&args)) < 0) {
> +        return PROM_ERROR;
> +    }
> +
> +    return (nret > 0) ? args.args[nargs] : 0;
> +}
> +
> +void ci_panic(const char *str)
> +{
> +    call_ci("exit", 0, 0);
> +}
> +
> +phandle ci_finddevice(const char *path)
> +{
> +    return call_ci("finddevice", 1, 1, path);
> +}
> +
> +uint32_t ci_getprop(phandle ph, const char *propname, void *prop, int len)
> +{
> +    return call_ci("getprop", 4, 1, ph, propname, prop, len);
> +}
> diff --git a/pc-bios/vof/libc.c b/pc-bios/vof/libc.c
> new file mode 100644
> index 000000000000..00c10e6e7da1
> --- /dev/null
> +++ b/pc-bios/vof/libc.c
> @@ -0,0 +1,92 @@
> +#include "vof.h"
> +
> +int strlen(const char *s)
> +{
> +    int len = 0;
> +
> +    while (*s != 0) {
> +        len += 1;
> +        s += 1;
> +    }
> +
> +    return len;
> +}
> +
> +int strcmp(const char *s1, const char *s2)
> +{
> +    while (*s1 != 0 && *s2 != 0) {
> +        if (*s1 != *s2) {
> +            break;
> +        }
> +        s1 += 1;
> +        s2 += 1;
> +    }
> +
> +    return *s1 - *s2;
> +}
> +
> +void *memcpy(void *dest, const void *src, size_t n)
> +{
> +    char *cdest;
> +    const char *csrc = src;
> +
> +    cdest = dest;
> +    while (n-- > 0) {
> +        *cdest++ = *csrc++;
> +    }
> +
> +    return dest;
> +}
> +
> +int memcmp(const void *ptr1, const void *ptr2, size_t n)
> +{
> +    const unsigned char *p1 = ptr1;
> +    const unsigned char *p2 = ptr2;
> +
> +    while (n-- > 0) {
> +        if (*p1 != *p2) {
> +            return *p1 - *p2;
> +        }
> +        p1 += 1;
> +        p2 += 1;
> +    }
> +
> +    return 0;
> +}
> +
> +void *memmove(void *dest, const void *src, size_t n)
> +{
> +    char *cdest;
> +    const char *csrc;
> +    int i;
> +
> +    /* Do the buffers overlap in a bad way? */
> +    if (src < dest && src + n >= dest) {
> +        /* Copy from end to start */
> +        cdest = dest + n - 1;
> +        csrc = src + n - 1;
> +        for (i = 0; i < n; i++) {
> +            *cdest-- = *csrc--;
> +        }
> +    } else {
> +        /* Normal copy is possible */
> +        cdest = dest;
> +        csrc = src;
> +        for (i = 0; i < n; i++) {
> +            *cdest++ = *csrc++;
> +        }
> +    }
> +
> +    return dest;
> +}
> +
> +void *memset(void *dest, int c, size_t size)
> +{
> +    unsigned char *d = (unsigned char *)dest;
> +
> +    while (size-- > 0) {
> +        *d++ = (unsigned char)c;
> +    }
> +
> +    return dest;
> +}
> diff --git a/pc-bios/vof/main.c b/pc-bios/vof/main.c
> new file mode 100644
> index 000000000000..9fc30d2d0957
> --- /dev/null
> +++ b/pc-bios/vof/main.c
> @@ -0,0 +1,21 @@
> +#include "vof.h"
> +
> +void do_boot(unsigned long addr, unsigned long _r3, unsigned long _r4)
> +{
> +    register unsigned long r3 __asm__("r3") = _r3;
> +    register unsigned long r4 __asm__("r4") = _r4;
> +    register unsigned long r5 __asm__("r5") = (unsigned long) _prom_entry;
> +
> +    ((client *)(uint32_t)addr)();
> +}
> +
> +void entry_c(void)
> +{
> +    register unsigned long r3 __asm__("r3");
> +    register unsigned long r4 __asm__("r4");
> +    register unsigned long r5 __asm__("r5");
> +    uint64_t initrd = r3, initrdsize = r4;
> +
> +    boot_from_memory(initrd, initrdsize);
> +    ci_panic("*** No boot target ***\n");
> +}
> diff --git a/tests/qtest/rtas-test.c b/tests/qtest/rtas-test.c
> index 16751dbd2f55..5f1194a6eb53 100644
> --- a/tests/qtest/rtas-test.c
> +++ b/tests/qtest/rtas-test.c
> @@ -5,7 +5,7 @@
>   #include "libqos/libqos-spapr.h"
>   #include "libqos/rtas.h"
>   
> -static void test_rtas_get_time_of_day(void)
> +static void run_test_rtas_get_time_of_day(const char *machine)
>   {
>       QOSState *qs;
>       struct tm tm;
> @@ -13,7 +13,7 @@ static void test_rtas_get_time_of_day(void)
>       uint64_t ret;
>       time_t t1, t2;
>   
> -    qs = qtest_spapr_boot("-machine pseries");
> +    qs = qtest_spapr_boot(machine);
>   
>       t1 = time(NULL);
>       ret = qrtas_get_time_of_day(qs->qts, &qs->alloc, &tm, &ns);
> @@ -24,6 +24,16 @@ static void test_rtas_get_time_of_day(void)
>       qtest_shutdown(qs);
>   }
>   
> +static void test_rtas_get_time_of_day(void)
> +{
> +    run_test_rtas_get_time_of_day("-machine pseries");
> +}
> +
> +static void test_rtas_get_time_of_day_vof(void)
> +{
> +    run_test_rtas_get_time_of_day("-machine pseries,x-vof=on");
> +}
> +
>   int main(int argc, char *argv[])
>   {
>       const char *arch = qtest_get_arch();
> @@ -35,6 +45,7 @@ int main(int argc, char *argv[])
>           exit(EXIT_FAILURE);
>       }
>       qtest_add_func("rtas/get-time-of-day", test_rtas_get_time_of_day);
> +    qtest_add_func("rtas/get-time-of-day-vof", test_rtas_get_time_of_day_vof);
>   
>       return g_test_run();
>   }
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cac65855f9e4..ec181c6b113c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1374,6 +1374,18 @@ F: hw/pci-host/mv64361.c
>   F: hw/pci-host/mv643xx.h
>   F: include/hw/pci-host/mv64361.h
>   
> +Virtual Open Firmware (VOF)
> +M: Alexey Kardashevskiy <aik@ozlabs.ru>
> +M: David Gibson <david@gibson.dropbear.id.au>
> +M: Greg Kurz <groug@kaod.org>
> +L: qemu-ppc@nongnu.org
> +S: Maintained
> +F: hw/ppc/spapr_vof*
> +F: hw/ppc/vof*
> +F: include/hw/ppc/vof*
> +F: pc-bios/vof/*
> +F: pc-bios/vof*
> +
>   RISC-V Machines
>   ---------------
>   OpenTitan
> diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
> index 86d6f379d1c3..dcd2e5c80df4 100644
> --- a/hw/ppc/meson.build
> +++ b/hw/ppc/meson.build
> @@ -28,6 +28,8 @@ ppc_ss.add(when: 'CONFIG_PSERIES', if_true: files(
>     'spapr_rtas_ddw.c',
>     'spapr_numa.c',
>     'pef.c',
> +  'spapr_vof.c',
> +  'vof.c',
>   ))
>   ppc_ss.add(when: 'CONFIG_SPAPR_RNG', if_true: files('spapr_rng.c'))
>   ppc_ss.add(when: ['CONFIG_PSERIES', 'CONFIG_LINUX'], if_true: files(
> diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
> index b4bbfbb01348..78fc2b5d39d1 100644
> --- a/hw/ppc/trace-events
> +++ b/hw/ppc/trace-events
> @@ -71,6 +71,30 @@ spapr_rtas_ibm_configure_connector_invalid(uint32_t index) "DRC index: 0x%"PRIx3
>   spapr_vio_h_reg_crq(uint64_t reg, uint64_t queue_addr, uint64_t queue_len) "CRQ for dev 0x%" PRIx64 " registered at 0x%" PRIx64 "/0x%" PRIx64
>   spapr_vio_free_crq(uint32_t reg) "CRQ for dev 0x%" PRIx32 " freed"
>   
> +# vof.c
> +vof_error_str_truncated(const char *s, int len) "%s truncated to %d"
> +vof_error_param(const char *method, int nargscheck, int nretcheck, int nargs, int nret) "%s takes/returns %d/%d, not %d/%d"
> +vof_error_unknown_service(const char *service, int nargs, int nret) "\"%s\" args=%d rets=%d"
> +vof_error_unknown_method(const char *method) "\"%s\""
> +vof_error_unknown_ihandle_close(uint32_t ih) "ih=0x%x"
> +vof_error_unknown_path(const char *path) "\"%s\""
> +vof_error_write(uint32_t ih) "ih=0x%x"
> +vof_finddevice(const char *path, uint32_t ph) "\"%s\" => ph=0x%x"
> +vof_claim(uint32_t virt, uint32_t size, uint32_t align, uint32_t ret) "virt=0x%x size=0x%x align=0x%x => 0x%x"
> +vof_release(uint32_t virt, uint32_t size, uint32_t ret) "virt=0x%x size=0x%x => 0x%x"
> +vof_method(uint32_t ihandle, const char *method, uint32_t param, uint32_t ret, uint32_t ret2) "ih=0x%x \"%s\"(0x%x) => 0x%x 0x%x"
> +vof_getprop(uint32_t ph, const char *prop, uint32_t ret, const char *val) "ph=0x%x \"%s\" => len=%d [%s]"
> +vof_getproplen(uint32_t ph, const char *prop, uint32_t ret) "ph=0x%x \"%s\" => len=%d"
> +vof_setprop(uint32_t ph, const char *prop, const char *val, uint32_t vallen, uint32_t ret) "ph=0x%x \"%s\" [%s] len=%d => ret=%d"
> +vof_open(const char *path, uint32_t ph, uint32_t ih) "%s ph=0x%x => ih=0x%x"
> +vof_interpret(const char *cmd, uint32_t param1, uint32_t param2, uint32_t ret, uint32_t ret2) "[%s] 0x%x 0x%x => 0x%x 0x%x"
> +vof_package_to_path(uint32_t ph, const char *tmp, uint32_t ret) "ph=0x%x => %s len=%d"
> +vof_instance_to_path(uint32_t ih, uint32_t ph, const char *tmp, uint32_t ret) "ih=0x%x ph=0x%x => %s len=%d"
> +vof_instance_to_package(uint32_t ih, uint32_t ph) "ih=0x%x => ph=0x%x"
> +vof_write(uint32_t ih, unsigned cb, const char *msg) "ih=0x%x [%u] \"%s\""
> +vof_avail(uint64_t start, uint64_t end, uint64_t size) "0x%"PRIx64"..0x%"PRIx64" size=0x%"PRIx64
> +vof_claimed(uint64_t start, uint64_t end, uint64_t size) "0x%"PRIx64"..0x%"PRIx64" size=0x%"PRIx64
> +
>   # ppc.c
>   ppc_tb_adjust(uint64_t offs1, uint64_t offs2, int64_t diff, int64_t seconds) "adjusted from 0x%"PRIx64" to 0x%"PRIx64", diff %"PRId64" (%"PRId64"s)"
>   
> diff --git a/pc-bios/README b/pc-bios/README
> index c101c9a04f8f..6e6556e91c92 100644
> --- a/pc-bios/README
> +++ b/pc-bios/README
> @@ -16,6 +16,8 @@
>     https://github.com/aik/SLOF, and the image currently in qemu is
>     built from git tag qemu-slof-20210217.
>   
> +- vof is a minimalistic firmware to work with -machine pseries,x-vof=on.
> +
>   - sgabios (the Serial Graphics Adapter option ROM) provides a means for
>     legacy x86 software to communicate with an attached serial console as
>     if a video card were attached.  The master sources reside in a subversion
> diff --git a/pc-bios/vof-nvram.bin b/pc-bios/vof-nvram.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..d183901cf980a91d81c4348bb20487c7bb62a2ec
> GIT binary patch
> literal 16384
> zcmeI%Jx;?g6bEpZJ8*)oSZeqZi&Z2pKnD)sI4{AHlNb4;RW}a70XPHaW57uo=-#R7
> zKSLBhJJ0sdixY3IuY@hzo0r$OmE%T;XE9uh@s1k=AOHafKmY;|fB*y_009U<00Izz
> z00bZa0SG_<0uX=z1Rwwb2tWV=XCbip6d#B4{{rX#XR%}$Bm^J;0SG|gWP$!?Aq=-I
> zcT+0Ix{{?1q>9J8r+eW^JK1tYYZZMWQCUwW%0S*~w^p@wfkX-<yRFx)H*+YEt0RRd
> zmn}6xtwbP`yp4O=>kxMAEA<~5@*g)@mb%KD5!;O~8c)>8rRQBx55=trhk#+1+T3J_
> zaf*G4vZAduqy$qda{``6Gnc2DQg<Es<GLxL#9<Oj*zP!8ZSnwf@-j7l47!nFXQO$a
> z^Hes6YU^_M<KsM*k~zwOSa+2g3Sx{*Eyu^XrB0FM5IJ-*?8`VvpBc4}vS(+_UKJ;=
> xITAns0uX=z1Rwwb2tWV=5P-nt34DD||Nni|VfbXeJORuY0uX=z1R!vE0>7B^s4f5i
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/pc-bios/vof.bin b/pc-bios/vof.bin
> new file mode 100755
> index 0000000000000000000000000000000000000000..f52e8e6a6da36791cbc97ecc420c7a41fe8e76f0
> GIT binary patch
> literal 3128
> zcmd^AO=ufe5FS}_yQy{9gARhIc-^>QsWx`O2XAYlb?Sg@2V+PLhPp_KrPiXh<=Sf5
> z7O7e_O&X;wNF;>>VmpT*(nBGK9FkL9D8*18e8@q8Hg=!~LoPWcr0MpX-M6tKC#opD
> zRq%ML_h#ptpKrb;`hWkzJ47=kQGUmj7}SVjN4}v5(WdkKu){1rzDKk9-Ihv(TE2^+
> zT=`vh<vz{^I%sj+ASIhPs1M>IHuIo$nCP{-Gjh)Gs_%S<xs{b#DkT^7pZkfr&fTN#
> zY`9H7vPP}>jh0IIF1g;mdsZ*yNh+<8w{(kSBTrsqjpV{%gL1Er>4h*!xuCl;Zg@I4
> z9yL#WMjLsulDl&9SM%Y?`{tjy_<K6X(IlRfO&!$BVe+a95q2qCJjDNf;=gQg9NXkW
> zED~bzM#%HX_`>i+$o<2A6GQP^<m`9wkfXm4B+7M;>A*oxTEFKQdy7Ovs~o3kqEEjG
> zJFl=qJgxK3vAYf*5@LOy>#BxH9#|(2*V0%uyqpu~QHWYKmKisHHlk^lp5kN#j*n}E
> zK3F#5eXa@W(OMQZ9{BN32IaSMp;4b2gbxih9U*e=apq#1!YKI)?ZURpwq-l6LGI9)
> z{ttcK5j^SykNn_KU_Xz}3~;`{mDt~y`PXN)wL#p{nEB+W=%3PnLwy44Hn28;wYeYb
> z>rG%yfwR-#Y^=0Rb0w1&%k7jw&Gd4Vvf63ttcJ;`M(Ip7Po?S_U8vro%hheVS~cm~
> zop!o`Sf{KShiMwSjQ=t0%tQCZFlk&H>_g~b73ag)`930egFaHC2)j3m^zzUOb)wD@
> z{;wV&*QE5);fw90IlX}``yW<E$b<NX3wDnrzE|5(GrK3U=$*uU1C|7zT+?ZAgoZAe
> z=WDS0aW{=SiF<GPfvw<yT*HHUUoqk9XXN9xd-eE7&Yk(Lt&qZa_5PTr$U$O!!I!ND
> zJ#2z6rzPggz-6KVg9tO@KlaO;UxGKT7+E^gh$Bt-KXsM;Lq{0H1q>H30yf5z73QYM
> zqY+LM`guxY97jLFMIY+NvnCrRv~&;O1AIl`zgmOeNKdbcS$G$-5Wy@Q+dm6m{Q>+g
> z;CEvd`hedL96}v`=eW>g)*o5uhsT~nGsyVht*ot5H{zASC0{Obob|pN&;7Zh$92}Z
> zockTj@}ryFd(oGP27TXhzA?ad^p)o%0Ka=Y4CBt`w;$*JBDiI7Z`EXtwe*AasP5ac
> z<LHi4Z}{zJ`=UKdUiM>Y=_+Y;cwT|$wd@5Rw4LL!-V^xOoje`8T*&$cS~j`h#Dv3{
> zy4cnc+aULb^F}WM=mpPF05i;(ex7CcW{vQwA#1j+SXe8dTT*cpT4U#-s3WFXj*`ML
> z4Xv14{Jy}|n#8s69DLwT;CWx2kUz&Laoy_kbZYxlhmc224eMjPQlksa#Td0}?-$>`
> z65>!$n*i$<cIzCP%6wGRplR|M-&vZtcV^jhjfF1Ch`Z0OF=}YnUQ!R>`PmxFA{XX8
> z>#`y=aRcwOran`@{k|La?}fhE@4x9IVzTFF1h`S_n-G{B#rNg;e5t+&Clm@P<7wqY
> zI-OB6@ud%w83jkL&`f-8u4g`(nN24swXmFtFJw~jOtNPw6JLfDQ?Gd7t!Fv)c@k$y
> zJ(c0R4^j(>MDo+r3=ZLNaVfn>y)(1v<>Uf=oSgrpo6&kcN-ixV=h&Xe<tJ)0ur6R-
> Y!McI9j&t0*rtrLpbsK93YZvRm-zr#Zp8x;=
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/pc-bios/vof/entry.S b/pc-bios/vof/entry.S
> new file mode 100644
> index 000000000000..90f4b859a059
> --- /dev/null
> +++ b/pc-bios/vof/entry.S
> @@ -0,0 +1,51 @@
> +#define LOAD32(rn, name)    \
> +	lis     rn,name##@h;    \
> +	ori     rn,rn,name##@l
> +
> +#define ENTRY(func_name)    \
> +	.text;                  \
> +	.align  2;              \
> +	.globl  .func_name;     \
> +	.func_name:             \
> +	.globl  func_name;      \
> +	func_name:
> +
> +#define KVMPPC_HCALL_BASE       0xf000
> +#define KVMPPC_H_RTAS           (KVMPPC_HCALL_BASE + 0x0)
> +#define KVMPPC_H_VOF_CLIENT     (KVMPPC_HCALL_BASE + 0x5)
> +
> +	. = 0x100 /* Do exactly as SLOF does */
> +
> +ENTRY(_start)
> +	LOAD32(%r31, 0) /* Go 32bit mode */
> +	mtmsrd %r31,0
> +	LOAD32(2, __toc_start)
> +	b entry_c
> +
> +ENTRY(_prom_entry)
> +	LOAD32(2, __toc_start)
> +	stdu    %r1,-112(%r1)
> +	std     %r31,104(%r1)
> +	mflr    %r31
> +	bl prom_entry
> +	nop
> +	mtlr    %r31
> +	ld      %r31,104(%r1)
> +	addi    %r1,%r1,112
> +	blr
> +
> +ENTRY(ci_entry)
> +	mr	4,3
> +	LOAD32(3,KVMPPC_H_VOF_CLIENT)
> +	sc	1
> +	blr
> +
> +/* This is the actual RTAS blob copied to the OS at instantiate-rtas */
> +ENTRY(hv_rtas)
> +	mr      %r4,%r3
> +	LOAD32(3,KVMPPC_H_RTAS)
> +	sc	1
> +	blr
> +	.globl hv_rtas_size
> +hv_rtas_size:
> +	.long . - hv_rtas;
> diff --git a/pc-bios/vof/l.lds b/pc-bios/vof/l.lds
> new file mode 100644
> index 000000000000..10b557a81f78
> --- /dev/null
> +++ b/pc-bios/vof/l.lds
> @@ -0,0 +1,48 @@
> +OUTPUT_FORMAT("elf32-powerpc", "elf32-powerpc", "elf32-powerpc")
> +OUTPUT_ARCH(powerpc:common)
> +
> +/* set the entry point */
> +ENTRY ( __start )
> +
> +SECTIONS {
> +	__executable_start = .;
> +
> +	.text : {
> +		*(.text)
> +	}
> +
> +	__etext = .;
> +
> +	. = ALIGN(8);
> +
> +	.data : {
> +		*(.data)
> +		*(.rodata .rodata.*)
> +		*(.got1)
> +		*(.sdata)
> +		*(.opd)
> +	}
> +
> +	/* FIXME bss at end ??? */
> +
> +	. = ALIGN(8);
> +	__bss_start = .;
> +	.bss : {
> +		*(.sbss) *(.scommon)
> +		*(.dynbss)
> +		*(.bss)
> +	}
> +
> +	. = ALIGN(8);
> +	__bss_end = .;
> +	__bss_size = (__bss_end - __bss_start);
> +
> +	. = ALIGN(256);
> +	__toc_start = DEFINED (.TOC.) ? .TOC. : ADDR (.got) + 0x8000;
> +	.got :
> +	{
> +		 *(.toc .got)
> +	}
> +	. = ALIGN(8);
> +	__toc_end = .;
> +}
> 

-- 
Alexey

