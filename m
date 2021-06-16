Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3E13A9328
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 08:52:07 +0200 (CEST)
Received: from localhost ([::1]:45204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltPPC-0001up-1j
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 02:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1ltPMz-0000Ns-NU
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 02:49:49 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:37525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1ltPMu-0007q6-3I
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 02:49:49 -0400
Received: by mail-pg1-x534.google.com with SMTP id t9so1179128pgn.4
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 23:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MFUuwMAagzN3HFNSeFOldoi7kN7PW1AOpo7HUcNxWGo=;
 b=Ew+LSWr7DtKOMu9/Rlbt1OAh+EwFrw9SzMCIJSnEW3VchRydLZrIh7UD88hThG73/h
 JaCGEYtmQU1sNRXLzABI4X5SEdBd2YGNG40HeV7jAvz+uJKOqJ12JoByIB8FhrC4d/sL
 GzgbKgFXrARbful6oyUoB9F+Etu6h4k3ymrIogDe4QtaKd+PsO/xBcsaHdUxzKTVKeSR
 CHCL2oSmNVB9RazlZLP8JgLsgxUvyRSGoBVLw42vbV88PFAbFmiZvVsrmwisA1CdKmwh
 7WziMomBCky3ydY+s1PCR+8zrJQUl2H3IwTSLeG5x5R5L4H9bzQfyvIL0pCE3U8LTiFH
 DdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MFUuwMAagzN3HFNSeFOldoi7kN7PW1AOpo7HUcNxWGo=;
 b=TI4jjxcG/kncHEo1C8hdkxHPb1Ro+mU1Uh3Ld/7n4+p6da5t4lpER0vhP5/AKHy3wI
 EM4nyHZKDu6CULhgOjY9WCsqjkdzA6IONLRaZzHBRf46BKdpqErBpPnh6EwhGDZD5kD+
 xWWw9OvhWJNzuiiNPc2QVng7RpPSruR9rvHbVvDH+8fy3G9Wptd2dSe6zsft0M+VH6Ff
 4X+pBpkVZ+uY4Obd9X1fNXK3An2JmKddDBp1CarkNwMion9bT2Dy50P15fQXElM1D9SL
 /pj0aph3CE0wytbI+XScq0teEaUnlxkzQxddsWurYQwIQ1NH1wmlWblbVRYLrawK4nc0
 rtIQ==
X-Gm-Message-State: AOAM5309ApxmOHCKyXUeBKjQoZKRUqgTFBURWVQDoWW+uKGJ4TCXosX6
 sKTj0KYIKx9Mmwhgf4HmjifkRA==
X-Google-Smtp-Source: ABdhPJyKgDbsD6l/ZCcFhvAoHH7JWt9c018ABEF9CLghPTOy4jaMzLPwSyVeQ+LiKto66B7hrmFKfg==
X-Received: by 2002:a62:6491:0:b029:28e:8c90:6b16 with SMTP id
 y139-20020a6264910000b029028e8c906b16mr7958977pfb.24.1623826180709; 
 Tue, 15 Jun 2021 23:49:40 -0700 (PDT)
Received: from localhost (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242])
 by smtp.gmail.com with UTF8SMTPSA id q4sm1156075pfh.18.2021.06.15.23.49.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 23:49:39 -0700 (PDT)
Message-ID: <119e934c-4921-37b2-591f-d5508fbaf57c@ozlabs.ru>
Date: Wed, 16 Jun 2021 16:49:35 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH qemu v21] spapr: Implement Open Firmware client interface
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210615070612.22679-1-aik@ozlabs.ru>
 <91505219-14f9-dd28-833-943c216ee4a@eik.bme.hu>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <91505219-14f9-dd28-833-943c216ee4a@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=aik@ozlabs.ru; helo=mail-pg1-x534.google.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, NICE_REPLY_A=-0.095,
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/16/21 07:09, BALATON Zoltan wrote:
> On Tue, 15 Jun 2021, Alexey Kardashevskiy wrote:
>> The PAPR platform describes an OS environment that's presented by
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
>>
>> The immediate benefit is much faster booting time which especially
>> crucial with fully emulated early CPU bring up environments. Also this
>> may come handy when/if GRUB-in-the-userspace sees light of the day.
>>
>> This separates VOF and sPAPR in a hope that VOF bits may be reused by
>> other POWERPC boards which do not support pSeries.
>>
>> This make VOF optional, it is disabled by default, add --enable-vof
>> to ./configure to enable it.
>>
>> This assumes potential support for booting from QEMU backends
>> such as blockdev or netdev without devices/drivers used.
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
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
>> -m 8G \
>> -machine 
>> pseries,x-vof=on,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off 
>> \
>> -kernel pbuild/kernel-le-guest/vmlinux \
>> -initrd pb/rootfs.cpio.xz \
>> -drive 
>> id=DRIVE0,if=none,file=./p/qemu-killslof/pc-bios/vof-nvram.bin,format=raw 
>> \
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
>> v21:
>> * s/ld/ldz/ in entry.S
>> * moved CONFIG_VOF from default-configs/devices/ppc64-softmmu.mak to 
>> Kconfig
>> * made CONFIG_VOF optional
>> * s/l.lds/vof.lds/
>> * force 32 BE in spapr_machine_reset() instead of the firmware
>> * added checks for non-null methods of VofMachineIfClass
>> * moved OF_STACK_SIZE to vof.h, renamed to VOF_..., added a better 
>> comment
>> * added  path_offset wrapper for handling mixed case for addresses
>> after "@" in node names
>> * changed getprop() to check for actual "name" property in the fdt
>> * moved VOF_MEM_READ/VOF_MEM_WRITE to vof.h for sharing as (unlike 
>> similar
>> rtas_ld/ldl_be_*) they return error codes
>> * VOF_MEM_READ uses now address_space_read (it was 
>> address_space_read_full
>> before, not sure why)
>>
>> v20:
>> * compile vof.bin with -mcpu=power4 for better compatibility
>> * s/std/stw/ in entry.S to make it work on ppc32
>> * fixed dt_available property to support both 32 and 64bit
>> * shuffled prom_args handling code
>> * do not enforce 32bit in MSR (again, to support 32bit platforms)
>>
>> v19:
>> * put bootargs in the FDT
>> * moved setting properties to a VOF machine hook
>> * moved fw_size and claim for it to vof_init()
>> * added CROSS to the VOF's makefile
>> * simplified phandles assigning
>> * pass MachineState to all machine hooks instead of calling
>> qdev_get_machine (following QOM)
>> * bunch of smaller changes and added comments
>> * added simple test to attempt to start with x-vof=on
>>
>> v18:
>> * fixed top addr (max address for "claim") on radix - it equals to 
>> ram_size
>> and vof->top_addr was uint32_t
>> * fixed "available" property which got broken in v14 but it is only 
>> visible
>> to clients which care (== grub)
>> * reshuffled vof_dt_memory_available() calls, added vof_init() to allow
>> vof_claim() before rendering the FDT
>>
>> v17:
>> * mv hw/ppc/vof.h include/hw/ppc/vof.h
>> * VofMachineIfClass -> VofMachineClass; it is not VofMachineInterface as
>> nobody used this scheme, usually "Interface" is dropped, a couple of 
>> times
>> it is "xxxInterfaceClass" or "xxxIfClass", as used the latter as it is
>> used by include/hw/vmstate-if.h
>> * added SPDX
>> * other fixes from v16 review
>>
>> v16:
>> * rebased on dwg/ppc-for-6.1
>> * s/SpaprVofInterface/VofMachineInterface/
>>
>> v15:
>> * bugfix: claimed memory for the VOF itself
>> * ditched OF_STACK_ADDR and allocate one instead, now it starts from 
>> 0x8000
>> because it is aligned to its size (no particular reason though)
>> * coding style
>> * moved nvram.bin up one level
>> * ditched bool in the firmware
>> * made debugging code conditional using trace_event_get_state() + 
>> qemu_loglevel_mask()
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
>> Note that contrary to  MIN_NVRAM_SIZE (8 * KiB), the actual minimum size
>> is 16K, or it just does not work (empty output from "nvram")
>>
>> v10:
>> * now rebased to compile with meson
>>
>> v9:
>> * remove special handling of /rtas/rtas-size as now we always add it 
>> in QEMU
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
>> * disabled  translate_kernel_address() hack so grub can load (work in
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
>> * no more packing FDT when bios=off - nobody needs it and getprop does 
>> not
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
>>
>> v20
>>
>> v20!
>> ---
>> configure               |    9 +
>> pc-bios/vof/Makefile    |   23 +
>> include/hw/ppc/spapr.h  |   25 +-
>> include/hw/ppc/vof.h    |   55 ++
>> pc-bios/vof/vof.h       |   43 ++
>> hw/ppc/spapr.c          |   87 +++-
>> hw/ppc/spapr_hcall.c    |   29 +-
>> hw/ppc/spapr_vof.c      |  153 ++++++
>> hw/ppc/vof.c            | 1052 +++++++++++++++++++++++++++++++++++++++
>> pc-bios/vof/bootmem.c   |   14 +
>> pc-bios/vof/ci.c        |   91 ++++
>> pc-bios/vof/libc.c      |   92 ++++
>> pc-bios/vof/main.c      |   21 +
>> tests/qtest/rtas-test.c |   17 +-
>> MAINTAINERS             |   12 +
>> hw/ppc/Kconfig          |    3 +
>> hw/ppc/meson.build      |    3 +
>> hw/ppc/trace-events     |   24 +
>> meson.build             |    1 +
>> pc-bios/README          |    2 +
>> pc-bios/vof-nvram.bin   |  Bin 0 -> 16384 bytes
>> pc-bios/vof.bin         |  Bin 0 -> 3784 bytes
>> pc-bios/vof/entry.S     |   49 ++
>> pc-bios/vof/vof.lds     |   48 ++
>> 24 files changed, 1840 insertions(+), 13 deletions(-)
>> create mode 100644 pc-bios/vof/Makefile
>> create mode 100644 include/hw/ppc/vof.h
>> create mode 100644 pc-bios/vof/vof.h
>> create mode 100644 hw/ppc/spapr_vof.c
>> create mode 100644 hw/ppc/vof.c
>> create mode 100644 pc-bios/vof/bootmem.c
>> create mode 100644 pc-bios/vof/ci.c
>> create mode 100644 pc-bios/vof/libc.c
>> create mode 100644 pc-bios/vof/main.c
>> create mode 100644 pc-bios/vof-nvram.bin
>> create mode 100755 pc-bios/vof.bin
>> create mode 100644 pc-bios/vof/entry.S
>> create mode 100644 pc-bios/vof/vof.lds
>>
>> diff --git a/configure b/configure
>> index 8dcb9965b24e..00dc29c027fa 100755
>> --- a/configure
>> +++ b/configure
>> @@ -445,6 +445,7 @@ fuse="auto"
>> fuse_lseek="auto"
>> multiprocess="auto"
>> slirp_smbd="$default_feature"
>> +vof="no"
>>
>> malloc_trim="auto"
>> gio="$default_feature"
>> @@ -1561,6 +1562,10 @@ for opt do
>>   ;;
>>   --disable-slirp-smbd) slirp_smbd=no
>>   ;;
>> +  --enable-vof) vof=yes
>> +  ;;
>> +  --disable-vof) vof=no
>> +  ;;
>>   *)
>>       echo "ERROR: unknown option $opt"
>>       echo "Try '$0 --help' for more information"
>> @@ -1940,6 +1945,7 @@ disabled with --disable-FEATURE, default is 
>> enabled if available
>>   multiprocess    Out of process device emulation support
>>   gio             libgio support
>>   slirp-smbd      use smbd (at path --smbd=*) in slirp networking
>> +  vof             Virtual Open Firmware support (powerpc/pseries, 
>> experimental)
>>
>> NOTE: The object files are built at the place where configure is launched
>> EOF
>> @@ -5555,6 +5561,9 @@ if test "$slirp_smbd" = "yes" ; then
>>   echo "CONFIG_SLIRP_SMBD=y" >> $config_host_mak
>>   echo "CONFIG_SMBD_COMMAND=\"$smbd\"" >> $config_host_mak
>> fi
>> +if test "$vof" = "yes" ; then
>> +  echo "CONFIG_VOF=y" >> $config_host_mak
>> +fi
>> if test "$vde" = "yes" ; then
>>   echo "CONFIG_VDE=y" >> $config_host_mak
>>   echo "VDE_LIBS=$vde_libs" >> $config_host_mak
> 
> In case I could not explain it clearly in my previous message I think 
> the solution we want here is to drop these configure changes and let 
> Kconfig configure this. The CONFIG_VOF option decides if vof itself is 
> built (adds vof.c) and pegasos2 will select this so it will usually be 
> yes by default. Your problem is that you're trying to use this variable 
> in spapr to make it off by default but that does not work. You need to 
> add another option for that (e.g. CONFIG_VOF_SPAPR or CONFIG_SPAPR_VOF 
> whichever makes more sense) then you can set that to no despite 
> CONFIG_VOF is yes and use that variable in spapr files and to add 
> spapr_vof.c. Then no configure option is needed which does not even work 
> for me: I get compile errors saying 'poisoning existing macro 
> "CONFIG_VOF"' if I try with --enable-vof or spapr fails to build if I 
> try without --enable-vof but select CONFIG_VOF from pegasos2. I hope 
> this makes sense now.


My problem is that I do not understand when we want VOF to be compiled 
in by default and when we do not. For a moment I thought we do not want 
it in by default but now it sounds like we do. If that is so, then 
CONFIG_VOF + selecting it from PSERIES and PEGASOS should do. Or I am 
missing the point again?



>> diff --git a/pc-bios/vof/Makefile b/pc-bios/vof/Makefile
>> new file mode 100644
>> index 000000000000..aa1678c4d889
>> --- /dev/null
>> +++ b/pc-bios/vof/Makefile
>> @@ -0,0 +1,23 @@
>> +all: build-all
>> +
>> +build-all: vof.bin
>> +
>> +CROSS ?=
>> +CC = $(CROSS)gcc
>> +LD = $(CROSS)ld
>> +OBJCOPY = $(CROSS)objcopy
>> +
>> +%.o: %.S
>> +    $(CC) -m32 -mbig-endian -mcpu=power4 -c -o $@ $<
>> +
>> +%.o: %.c
>> +    $(CC) -m32 -mbig-endian -mcpu=power4 -c -fno-stack-protector -o 
>> $@ $<
>> +
>> +vof.elf: entry.o main.o ci.o bootmem.o libc.o
>> +    $(LD) -nostdlib -e_start -Tvof.lds -EB -o $@ $^
>> +
>> +%.bin: %.elf
>> +    $(OBJCOPY) -O binary -j .text -j .data -j .toc -j .got2 $^ $@
>> +
>> +clean:
>> +    rm -f *.o vof.bin vof.elf *~
>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>> index f05219f75ef6..39b5581ae650 100644
>> --- a/include/hw/ppc/spapr.h
>> +++ b/include/hw/ppc/spapr.h
>> @@ -12,6 +12,9 @@
>> #include "hw/ppc/spapr_xive.h"  /* For SpaprXive */
>> #include "hw/ppc/xics.h"        /* For ICSState */
>> #include "hw/ppc/spapr_tpm_proxy.h"
>> +#ifdef CONFIG_VOF
>> +#include "hw/ppc/vof.h"
>> +#endif
>>
>> struct SpaprVioBus;
>> struct SpaprPhbState;
>> @@ -180,6 +183,9 @@ struct SpaprMachineState {
>>     uint64_t kernel_addr;
>>     uint32_t initrd_base;
>>     long initrd_size;
>> +#ifdef CONFIG_VOF
> 
> So this can't be CONFIG_VOF here if you want to be able to set it to no 
> despite pegasos2 pulling in VOF so you need another SPAPR specific 

If VOF is compiled it, why would I want it to be still disabled for 
PSERIES? The code is in, let it work.


> option for that in spapr specific parts with CONFIG_VOF selecting if vof 
> itself is built it any board uses it. So CONFIG_PEGASOS2 has to select 
> CONFIG_VOF and your SPAPR_VOF option should too if it's enabled that way 
> vof.c will be added if either board is built but for SPAPR only if its 
> VOF option is on.
> 
>> +    Vof *vof;
>> +#endif
>>     uint64_t rtc_offset; /* Now used only during incoming migration */
>>     struct PPCTimebase tb;
>>     bool has_graphics;
>> @@ -558,7 +564,9 @@ struct SpaprMachineState {
>> /* Client Architecture support */
>> #define KVMPPC_H_CAS            (KVMPPC_HCALL_BASE + 0x2)
>> #define KVMPPC_H_UPDATE_DT      (KVMPPC_HCALL_BASE + 0x3)
>> -#define KVMPPC_HCALL_MAX        KVMPPC_H_UPDATE_DT
>> +/* 0x4 was used for KVMPPC_H_UPDATE_PHANDLE in SLOF */
>> +#define KVMPPC_H_VOF_CLIENT     (KVMPPC_HCALL_BASE + 0x5)
>> +#define KVMPPC_HCALL_MAX        KVMPPC_H_VOF_CLIENT
>>
>> /*
>>  * The hcall range 0xEF00 to 0xEF80 is reserved for use in facilitating
>> @@ -956,4 +964,19 @@ bool spapr_check_pagesize(SpaprMachineState 
>> *spapr, hwaddr pagesize,
>> void spapr_set_all_lpcrs(target_ulong value, target_ulong mask);
>> hwaddr spapr_get_rtas_addr(void);
>> bool spapr_memory_hot_unplug_supported(SpaprMachineState *spapr);
>> +
>> +#ifdef CONFIG_VOF
>> +void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
>> +                     target_ulong *stack_ptr, Error **errp);
>> +void spapr_vof_quiesce(MachineState *ms);
>> +bool spapr_vof_setprop(MachineState *ms, const char *path, const char 
>> *propname,
>> +                       void *val, int vallen);
>> +target_ulong spapr_h_vof_client(PowerPCCPU *cpu, SpaprMachineState 
>> *spapr,
>> +                                target_ulong opcode, target_ulong 
>> *args);
>> +target_ulong spapr_vof_client_architecture_support(MachineState *ms,
>> +                                                   CPUState *cs,
>> +                                                   target_ulong 
>> ovec_addr);
>> +void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt);
>> +#endif
>> +
>> #endif /* HW_SPAPR_H */
>> diff --git a/include/hw/ppc/vof.h b/include/hw/ppc/vof.h
>> new file mode 100644
>> index 000000000000..65ca2fed0d41
>> --- /dev/null
>> +++ b/include/hw/ppc/vof.h
>> @@ -0,0 +1,55 @@
>> +/*
>> + * Virtual Open Firmware
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +#ifndef HW_VOF_H
>> +#define HW_VOF_H
>> +
>> +typedef struct Vof {
>> +    uint64_t top_addr; /* copied from rma_size */
>> +    GArray *claimed; /* array of SpaprOfClaimed */
>> +    uint64_t claimed_base;
>> +    GHashTable *of_instances; /* ihandle -> SpaprOfInstance */
>> +    uint32_t of_instance_last;
>> +    char *bootargs;
>> +    long fw_size;
>> +} Vof;
>> +
>> +int vof_client_call(MachineState *ms, Vof *vof, void *fdt,
>> +                    target_ulong args_real);
>> +uint64_t vof_claim(Vof *vof, uint64_t virt, uint64_t size, uint64_t 
>> align);
>> +void vof_init(Vof *vof, uint64_t top_addr, Error **errp);
>> +void vof_cleanup(Vof *vof);
>> +void vof_build_dt(void *fdt, Vof *vof);
>> +uint32_t vof_client_open_store(void *fdt, Vof *vof, const char 
>> *nodename,
>> +                               const char *prop, const char *path);
>> +
>> +#define TYPE_VOF_MACHINE_IF "vof-machine-if"
>> +
>> +typedef struct VofMachineIfClass VofMachineIfClass;
>> +DECLARE_CLASS_CHECKERS(VofMachineIfClass, VOF_MACHINE, 
>> TYPE_VOF_MACHINE_IF)
>> +
>> +struct VofMachineIfClass {
>> +    InterfaceClass parent;
>> +    target_ulong (*client_architecture_support)(MachineState *ms, 
>> CPUState *cs,
>> +                                                target_ulong vec);
>> +    void (*quiesce)(MachineState *ms);
>> +    bool (*setprop)(MachineState *ms, const char *path, const char 
>> *propname,
>> +                    void *val, int vallen);
>> +};
>> +
>> +/*
>> + * Initial stack size is from
>> + * 
>> https://www.devicetree.org/open-firmware/bindings/ppc/release/ppc-2_1.html 
>>
> 
> I wonder if it's better to quote the section number and the title of the 
> doc in case the URL here goes away in the future.


The binding (the URL clearly suggests it is a "binding") says 32K is the 
minimum, what else is here to quote? The doc does not explain why anyway.


>> + */
>> +#define VOF_STACK_SIZE       0x8000
>> +
>> +#define VOF_MEM_READ(pa, buf, size) \
>> +    address_space_read(&address_space_memory, \
>> +    (pa), MEMTXATTRS_UNSPECIFIED, (buf), (size))
>> +#define VOF_MEM_WRITE(pa, buf, size) \
>> +    address_space_write(&address_space_memory, \
>> +    (pa), MEMTXATTRS_UNSPECIFIED, (buf), (size))
>> +
>> +#endif /* HW_VOF_H */
>> diff --git a/pc-bios/vof/vof.h b/pc-bios/vof/vof.h
>> new file mode 100644
>> index 000000000000..2d8958076907
>> --- /dev/null
>> +++ b/pc-bios/vof/vof.h
>> @@ -0,0 +1,43 @@
>> +/*
>> + * Virtual Open Firmware
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
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
>> +extern void _prom_entry(void); /* OF CI entry point (i.e. this 
>> firmware) */
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
>> +uint32_t ci_getprop(phandle ph, const char *propname, void *prop, int 
>> len);
>> +
>> +/* booting from -kernel */
>> +void boot_from_memory(uint64_t initrd, uint64_t initrdsize);
>> +
>> +/* Entry points for CI and RTAS */
>> +extern uint32_t ci_entry(uint32_t params);
>> +extern unsigned long hv_rtas(unsigned long params);
>> +extern unsigned int hv_rtas_size;
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index 4dd90b75cc52..6d747d72c614 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -101,6 +101,7 @@
>> #define FDT_MAX_ADDR            0x80000000 /* FDT must stay below that */
>> #define FW_MAX_SIZE             0x400000
>> #define FW_FILE_NAME            "slof.bin"
>> +#define FW_FILE_NAME_VOF        "vof.bin"
>> #define FW_OVERHEAD             0x2800000
>> #define KERNEL_LOAD_ADDR        FW_MAX_SIZE
>>
>> @@ -1639,22 +1640,40 @@ static void spapr_machine_reset(MachineState 
>> *machine)
>>     fdt_addr = MIN(spapr->rma_size, FDT_MAX_ADDR) - FDT_MAX_SIZE;
>>
>>     fdt = spapr_build_fdt(spapr, true, FDT_MAX_SIZE);
>> +#ifdef CONFIG_VOF
>> +    if (spapr->vof) {
>> +        target_ulong stack_ptr = 0;
>>
>> -    rc = fdt_pack(fdt);
>> +        spapr_vof_reset(spapr, fdt, &stack_ptr, &error_fatal);
>>
>> -    /* Should only fail if we've built a corrupted tree */
>> -    assert(rc == 0);
>> +        spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
>> +                                  stack_ptr, spapr->initrd_base,
>> +                                  spapr->initrd_size);
>> +        /* VOF is 32bit BE so enforce MSR here */
>> +        first_ppc_cpu->env.msr &= ~((1ULL << MSR_SF) | (1ULL << 
>> MSR_LE));
>> +        /*
>> +         * Do not pack the FDT as the client may change properties.
>> +         * VOF client does not expect the FDT so we do not load it to 
>> the VM.
>> +         */
>> +    } else
>> +#endif
>> +    {
>> +        rc = fdt_pack(fdt);
>> +        /* Should only fail if we've built a corrupted tree */
>> +        assert(rc == 0);
>>
>> -    /* Load the fdt */
>> +        spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
>> +                                  0, fdt_addr, 0);
>> +        cpu_physical_memory_write(fdt_addr, fdt, fdt_totalsize(fdt));
>> +    }
>>     qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
>> -    cpu_physical_memory_write(fdt_addr, fdt, fdt_totalsize(fdt));
>> +
>>     g_free(spapr->fdt_blob);
>>     spapr->fdt_size = fdt_totalsize(fdt);
>>     spapr->fdt_initial_size = spapr->fdt_size;
>>     spapr->fdt_blob = fdt;
>>
>>     /* Set up the entry state */
>> -    spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT, 0, 
>> fdt_addr, 0);
>>     first_ppc_cpu->env.gpr[5] = 0;
>>
>>     spapr->fwnmi_system_reset_addr = -1;
>> @@ -2657,7 +2676,12 @@ static void spapr_machine_init(MachineState 
>> *machine)
>>     SpaprMachineState *spapr = SPAPR_MACHINE(machine);
>>     SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(machine);
>>     MachineClass *mc = MACHINE_GET_CLASS(machine);
>> -    const char *bios_name = machine->firmware ?: FW_FILE_NAME;
>> +    const char *bios_default =
>> +#ifdef CONFIG_VOF
>> +        !!spapr->vof ? FW_FILE_NAME_VOF :
> 
> Does !! make sense here? I think testing for non-0 does not need it so 
> you could just write spapr->vof without !!.


I find c operator precedence confusing at times. Unary operators like 
"!" are easy to read though.


> 
>> +#endif
>> +        FW_FILE_NAME;
>> +    const char *bios_name = machine->firmware ?: bios_default;
>>     const char *kernel_filename = machine->kernel_filename;
>>     const char *initrd_filename = machine->initrd_filename;
>>     PCIHostState *phb;
>> @@ -3014,6 +3038,12 @@ static void spapr_machine_init(MachineState 
>> *machine)
>>     }
>>
>>     qemu_cond_init(&spapr->fwnmi_machine_check_interlock_cond);
>> +#ifdef CONFIG_VOF
>> +    if (spapr->vof) {
>> +        spapr->vof->fw_size = fw_size; /* for claim() on itself */
>> +        spapr_register_hypercall(KVMPPC_H_VOF_CLIENT, 
>> spapr_h_vof_client);
>> +    }
>> +#endif
>> }
>>
>> #define DEFAULT_KVM_TYPE "auto"
>> @@ -3204,6 +3234,30 @@ static void spapr_set_resize_hpt(Object *obj, 
>> const char *value, Error **errp)
>>     }
>> }
>>
>> +#ifdef CONFIG_VOF
>> +static bool spapr_get_vof(Object *obj, Error **errp)
>> +{
>> +    SpaprMachineState *spapr = SPAPR_MACHINE(obj);
>> +
>> +    return spapr->vof != NULL;
>> +}
>> +
>> +static void spapr_set_vof(Object *obj, bool value, Error **errp)
>> +{
>> +    SpaprMachineState *spapr = SPAPR_MACHINE(obj);
>> +
>> +    if (spapr->vof) {
>> +        vof_cleanup(spapr->vof);
>> +        g_free(spapr->vof);
>> +        spapr->vof = NULL;
>> +    }
>> +    if (!value) {
>> +        return;
>> +    }
>> +    spapr->vof = g_malloc0(sizeof(*spapr->vof));
>> +}
>> +#endif
>> +
>> static char *spapr_get_ic_mode(Object *obj, Error **errp)
>> {
>>     SpaprMachineState *spapr = SPAPR_MACHINE(obj);
>> @@ -3329,6 +3383,12 @@ static void spapr_instance_init(Object *obj)
>>                                     stringify(KERNEL_LOAD_ADDR)
>>                                     " for -kernel is the default");
>>     spapr->kernel_addr = KERNEL_LOAD_ADDR;
>> +#ifdef CONFIG_VOF
>> +    object_property_add_bool(obj, "x-vof", spapr_get_vof, 
>> spapr_set_vof);
>> +    object_property_set_description(obj, "x-vof",
>> +                                    "Enable Virtual Open Firmware 
>> (experimental)");
>> +#endif
>> +
>>     /* The machine class defines the default interrupt controller mode */
>>     spapr->irq = smc->irq;
>>     object_property_add_str(obj, "ic-mode", spapr_get_ic_mode,
>> @@ -4580,6 +4640,16 @@ static void 
>> spapr_machine_class_init(ObjectClass *oc, void *data)
>>     smc->smp_threads_vsmt = true;
>>     smc->nr_xirqs = SPAPR_NR_XIRQS;
>>     xfc->match_nvt = spapr_match_nvt;
>> +
>> +#ifdef CONFIG_VOF
>> +    {
>> +        VofMachineIfClass *vmc = VOF_MACHINE_CLASS(oc);
>> +        vmc->client_architecture_support =
>> +            spapr_vof_client_architecture_support;
>> +        vmc->quiesce = spapr_vof_quiesce;
>> +        vmc->setprop = spapr_vof_setprop;
>> +    }
>> +#endif
>> }
>>
>> static const TypeInfo spapr_machine_info = {
>> @@ -4599,6 +4669,9 @@ static const TypeInfo spapr_machine_info = {
>>         { TYPE_XICS_FABRIC },
>>         { TYPE_INTERRUPT_STATS_PROVIDER },
>>         { TYPE_XIVE_FABRIC },
>> +#ifdef CONFIG_VOF
>> +        { TYPE_VOF_MACHINE_IF },
>> +#endif
>>         { }
>>     },
>> };
>> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>> index f25014afda40..986a4de34128 100644
>> --- a/hw/ppc/spapr_hcall.c
>> +++ b/hw/ppc/spapr_hcall.c
>> @@ -1080,7 +1080,7 @@ target_ulong 
>> do_client_architecture_support(PowerPCCPU *cpu,
>>     SpaprOptionVector *ov1_guest, *ov5_guest;
>>     bool guest_radix;
>>     bool raw_mode_supported = false;
>> -    bool guest_xive;
>> +    bool guest_xive, reset_fdt = false;
>>     CPUState *cs;
>>     void *fdt;
>>     uint32_t max_compat = spapr->max_compat_pvr;
>> @@ -1233,8 +1233,10 @@ target_ulong 
>> do_client_architecture_support(PowerPCCPU *cpu,
>>         spapr_setup_hpt(spapr);
>>     }
>>
>> -    fdt = spapr_build_fdt(spapr, false, fdt_bufsize);
>> -
>> +#ifdef CONFIG_VOF
>> +    reset_fdt = spapr->vof != NULL;
> 
> (Here when storing to a bool !! could make sense but what you have is 
> better as it's clearer so I'm not suggesting to use !! here either.

I prefer this way and I would rather do this that "!!" but again 
precedence confuses me some times so up there I'd need braces for the 
condition and then folks start asking "why you need braces" :)
I do not need braces here as "=" has the priority (although the fact 
that it returns a value is just bizzarre).

> It's 
> rarely useful, maybe only if you need a bool but does not have space to 
> write the condition or it would be more confusing that way.)



> 
>> +#endif
>> +    fdt = spapr_build_fdt(spapr, reset_fdt, fdt_bufsize);
>>     g_free(spapr->fdt_blob);
>>     spapr->fdt_size = fdt_totalsize(fdt);
>>     spapr->fdt_initial_size = spapr->fdt_size;
>> @@ -1277,6 +1279,27 @@ static target_ulong 
>> h_client_architecture_support(PowerPCCPU *cpu,
>>     return ret;
>> }
>>
>> +#ifdef CONFIG_VOF
>> +target_ulong spapr_vof_client_architecture_support(MachineState *ms,
>> +                                                   CPUState *cs,
>> +                                                   target_ulong 
>> ovec_addr)
>> +{
>> +    SpaprMachineState *spapr = SPAPR_MACHINE(ms);
>> +
>> +    target_ulong ret = 
>> do_client_architecture_support(POWERPC_CPU(cs), spapr,
>> +                                                      ovec_addr, 
>> FDT_MAX_SIZE);
>> +
>> +    /*
>> +     * This adds stdout and generates phandles for boottime and CAS 
>> FDTs.
>> +     * It is alright to update the FDT here as 
>> do_client_architecture_support()
>> +     * does not pack it.
>> +     */
>> +    spapr_vof_client_dt_finalize(spapr, spapr->fdt_blob);
>> +
>> +    return ret;
>> +}
>> +#endif
>> +
>> static target_ulong h_get_cpu_characteristics(PowerPCCPU *cpu,
>>                                               SpaprMachineState *spapr,
>>                                               target_ulong opcode,
>> diff --git a/hw/ppc/spapr_vof.c b/hw/ppc/spapr_vof.c
>> new file mode 100644
>> index 000000000000..653d376f38aa
>> --- /dev/null
>> +++ b/hw/ppc/spapr_vof.c
>> @@ -0,0 +1,153 @@
>> +/*
>> + * SPAPR machine hooks to Virtual Open Firmware,
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
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
>> +target_ulong spapr_h_vof_client(PowerPCCPU *cpu, SpaprMachineState 
>> *spapr,
>> +                                target_ulong opcode, target_ulong 
>> *_args)
>> +{
>> +    int ret = vof_client_call(MACHINE(spapr), spapr->vof, 
>> spapr->fdt_blob,
>> +                              ppc64_phys_to_real(_args[0]));
>> +
>> +    if (ret) {
>> +        return H_PARAMETER;
>> +    }
>> +    return H_SUCCESS;
>> +}
>> +
>> +void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt)
>> +{
>> +    char *stdout_path = spapr_vio_stdout_path(spapr->vio_bus);
>> +    int chosen;
>> +
>> +    vof_build_dt(fdt, spapr->vof);
>> +
>> +    _FDT(chosen = fdt_path_offset(fdt, "/chosen"));
>> +    _FDT(fdt_setprop_string(fdt, chosen, "bootargs",
>> +                            spapr->vof->bootargs ? : ""));
>> +
>> +    /*
>> +     * SLOF-less setup requires an open instance of stdout for early
>> +     * kernel printk. By now all phandles are settled so we can open
>> +     * the default serial console.
>> +     */
>> +    if (stdout_path) {
>> +        _FDT(vof_client_open_store(fdt, spapr->vof, "/chosen", "stdout",
>> +                                   stdout_path));
>> +    }
>> +}
>> +
>> +void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
>> +                     target_ulong *stack_ptr, Error **errp)
>> +{
>> +    Vof *vof = spapr->vof;
>> +
>> +    vof_init(vof, spapr->rma_size, errp);
>> +
>> +    *stack_ptr = vof_claim(vof, 0, VOF_STACK_SIZE, VOF_STACK_SIZE);
>> +    if (*stack_ptr == -1) {
>> +        error_setg(errp, "Memory allocation for stack failed");
>> +        return;
>> +    }
>> +    /* Stack grows downwards plus reserve space for the minimum stack 
>> frame */
>> +    *stack_ptr += VOF_STACK_SIZE - 0x20;
>> +
>> +    if (spapr->kernel_size &&
>> +        vof_claim(vof, spapr->kernel_addr, spapr->kernel_size, 0) == 
>> -1) {
>> +        error_setg(errp, "Memory for kernel is in use");
>> +        return;
>> +    }
>> +
>> +    if (spapr->initrd_size &&
>> +        vof_claim(vof, spapr->initrd_base, spapr->initrd_size, 0) == 
>> -1) {
>> +        error_setg(errp, "Memory for initramdisk is in use");
>> +        return;
>> +    }
>> +
>> +    spapr_vof_client_dt_finalize(spapr, fdt);
>> +
>> +    /*
>> +     * At this point the expected allocation map is:
>> +     *
>> +     * 0..c38 - the initial firmware
>> +     * 8000..10000 - stack
>> +     * 400000.. - kernel
>> +     * 3ea0000.. - initramdisk
>> +     *
>> +     * We skip writing FDT as nothing expects it; OF client interface is
>> +     * going to be used for reading the device tree.
>> +     */
>> +}
>> +
>> +void spapr_vof_quiesce(MachineState *ms)
>> +{
>> +    SpaprMachineState *spapr = SPAPR_MACHINE(ms);
>> +
>> +    spapr->fdt_size = fdt_totalsize(spapr->fdt_blob);
>> +    spapr->fdt_initial_size = spapr->fdt_size;
>> +}
>> +
>> +bool spapr_vof_setprop(MachineState *ms, const char *path, const char 
>> *propname,
>> +                       void *val, int vallen)
>> +{
>> +    SpaprMachineState *spapr = SPAPR_MACHINE(ms);
>> +
>> +    /*
>> +     * We only allow changing properties which we know how to update 
>> in QEMU
>> +     * OR
>> +     * the ones which we know that they need to survive during 
>> "quiesce".
>> +     */
>> +
>> +    if (strcmp(path, "/rtas") == 0) {
>> +        if (strcmp(propname, "linux,rtas-base") == 0 ||
>> +            strcmp(propname, "linux,rtas-entry") == 0) {
>> +            /* These need to survive quiesce so let them store in the 
>> FDT */
>> +            return true;
>> +        }
>> +    }
>> +
>> +    if (strcmp(path, "/chosen") == 0) {
>> +        if (strcmp(propname, "bootargs") == 0) {
>> +            Vof *vof = spapr->vof;
>> +
>> +            g_free(vof->bootargs);
>> +            vof->bootargs = g_strndup(val, vallen);
>> +            return true;
>> +        }
>> +        if (strcmp(propname, "linux,initrd-start") == 0) {
>> +            if (vallen == sizeof(uint32_t)) {
>> +                spapr->initrd_base = ldl_be_p(val);
>> +                return true;
>> +            }
>> +            if (vallen == sizeof(uint64_t)) {
>> +                spapr->initrd_base = ldq_be_p(val);
>> +                return true;
>> +            }
>> +            return false;
>> +        }
>> +        if (strcmp(propname, "linux,initrd-end") == 0) {
>> +            if (vallen == sizeof(uint32_t)) {
>> +                spapr->initrd_size = ldl_be_p(val) - spapr->initrd_base;
>> +                return true;
>> +            }
>> +            if (vallen == sizeof(uint64_t)) {
>> +                spapr->initrd_size = ldq_be_p(val) - spapr->initrd_base;
>> +                return true;
>> +            }
>> +            return false;
>> +        }
>> +    }
>> +
>> +    return true;
>> +}
>> diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
>> new file mode 100644
>> index 000000000000..1068a1e58388
>> --- /dev/null
>> +++ b/hw/ppc/vof.c
>> @@ -0,0 +1,1052 @@
>> +/*
>> + * QEMU PowerPC Virtual Open Firmware.
>> + *
>> + * This implements client interface from OpenFirmware IEEE1275 on the 
>> QEMU
>> + * side to leave only a very basic firmware in the VM.
>> + *
>> + * Copyright (c) 2021 IBM Corporation.
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qemu-common.h"
>> +#include "qemu/timer.h"
>> +#include "qemu/range.h"
>> +#include "qemu/units.h"
>> +#include "qapi/error.h"
>> +#include <sys/ioctl.h>
>> +#include "exec/ram_addr.h"
>> +#include "exec/address-spaces.h"
>> +#include "hw/ppc/vof.h"
>> +#include "hw/ppc/fdt.h"
>> +#include "sysemu/runstate.h"
>> +#include "qom/qom-qobject.h"
>> +#include "trace.h"
>> +
>> +#include <libfdt.h>
>> +
>> +/*
>> + * OF 1275 "nextprop" description suggests is it 32 bytes max but
>> + * LoPAPR defines "ibm,query-interrupt-source-number" which is 33 
>> chars long.
>> + */
>> +#define OF_PROPNAME_LEN_MAX 64
>> +
>> +#define VOF_MAX_PATH        256
>> +#define VOF_MAX_SETPROPLEN  2048
>> +#define VOF_MAX_METHODLEN   256
>> +#define VOF_MAX_FORTHCODE   256
>> +#define VOF_VTY_BUF_SIZE    256
>> +
>> +typedef struct {
>> +    uint64_t start;
>> +    uint64_t size;
>> +} OfClaimed;
>> +
>> +typedef struct {
>> +    char *path; /* the path used to open the instance */
>> +    uint32_t phandle;
>> +} OfInstance;
>> +
>> +static int readstr(hwaddr pa, char *buf, int size)
>> +{
>> +    if (VOF_MEM_READ(pa, buf, size) != MEMTX_OK) {
>> +        return -1;
>> +    }
>> +    if (strnlen(buf, size) == size) {
>> +        buf[size - 1] = '\0';
>> +        trace_vof_error_str_truncated(buf, size);
>> +        return -1;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static bool cmpservice(const char *s, unsigned nargs, unsigned nret,
>> +                       const char *s1, unsigned nargscheck, unsigned 
>> nretcheck)
>> +{
>> +    if (strcmp(s, s1)) {
>> +        return false;
>> +    }
>> +    if ((nargscheck && (nargs != nargscheck)) ||
>> +        (nretcheck && (nret != nretcheck))) {
>> +        trace_vof_error_param(s, nargscheck, nretcheck, nargs, nret);
>> +        return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>> +static void prop_format(char *tval, int tlen, const void *prop, int len)
>> +{
>> +    int i;
>> +    const unsigned char *c;
>> +    char *t;
>> +    const char bin[] = "...";
>> +
>> +    for (i = 0, c = prop; i < len; ++i, ++c) {
>> +        if (*c == '\0' && i == len - 1) {
>> +            strncpy(tval, prop, tlen - 1);
>> +            return;
>> +        }
>> +        if (*c < 0x20 || *c >= 0x80) {
>> +            break;
>> +        }
>> +    }
>> +
>> +    for (i = 0, c = prop, t = tval; i < len; ++i, ++c) {
>> +        if (t >= tval + tlen - sizeof(bin) - 1 - 2 - 1) {
>> +            strcpy(t, bin);
>> +            return;
>> +        }
>> +        if (i && i % 4 == 0 && i != len - 1) {
>> +            strcat(t, " ");
>> +            ++t;
>> +        }
>> +        t += sprintf(t, "%02X", *c & 0xFF);
>> +    }
>> +}
>> +
>> +static int get_path(const void *fdt, int offset, char *buf, int len)
>> +{
>> +    int ret;
>> +
>> +    ret = fdt_get_path(fdt, offset, buf, len - 1);
>> +    if (ret < 0) {
>> +        return ret;
>> +    }
>> +
>> +    buf[len - 1] = '\0';
>> +
>> +    return strlen(buf) + 1;
>> +}
>> +
>> +static int phandle_to_path(const void *fdt, uint32_t ph, char *buf, 
>> int len)
>> +{
>> +    int ret;
>> +
>> +    ret = fdt_node_offset_by_phandle(fdt, ph);
>> +    if (ret < 0) {
>> +        return ret;
>> +    }
>> +
>> +    return get_path(fdt, ret, buf, len);
>> +}
>> +
>> +static int path_offset(const void *fdt, const char *path)
>> +{
>> +    g_autofree char *p = NULL;
>> +    char *at;
>> +
>> +    /*
>> +     * The addresses in node names are expected to in the lower case 
>> as per
> 
> There's some grammar problem with this sentence. I think it should be 
> "are expected to be in lower case" but ask a native speaker.

Definitely missed "be". Thanks for spotting.


> 
>> +     * 
>> https://www.devicetree.org/open-firmware/bindings/ppc/release/ppc-2_1.html 
>>
>> +     */
>> +    at = strchr(path, '@');
>> +    if (!at) {
>> +        return fdt_path_offset(fdt, path);
>> +    }
>> +
>> +    p = g_strdup(path);
>> +    for (at = at - path + p + 1; *at; ++at) {
>> +        *at = tolower(*at);
>> +    }
>> +    return fdt_path_offset(fdt, p);
>> +}
>> +
>> +static uint32_t vof_finddevice(const void *fdt, uint32_t nodeaddr)
>> +{
>> +    char fullnode[VOF_MAX_PATH];
>> +    uint32_t ret = -1;
>> +    int offset;
>> +
>> +    if (readstr(nodeaddr, fullnode, sizeof(fullnode))) {
>> +        return (uint32_t) ret;
>> +    }
>> +
>> +    offset = path_offset(fdt, fullnode);
>> +    if (offset >= 0) {
>> +        ret = fdt_get_phandle(fdt, offset);
>> +    }
>> +    trace_vof_finddevice(fullnode, ret);
>> +    return (uint32_t) ret;
>> +}
>> +
>> +static const void *getprop(const void *fdt, int nodeoff, const char 
>> *propname,
>> +                           int *proplen, bool *write0)
>> +{
>> +    const char *unit, *prop;
>> +    const void *ret = fdt_getprop(fdt, nodeoff, propname, proplen);
>> +
>> +    if (ret) {
>> +        if (write0) {
>> +            *write0 = false;
>> +        }
>> +        return ret;
>> +    }
>> +
>> +    /*
>> +     * The "name" property is not actually expected as a property in 
>> the FDT
>> +     * (although some platform may create those in "/" so we try 
>> getprop first),
> 
> Not only in "/" but anywhere. MorphOS walks the tree with nextprop and 
> expects to get a name property for most nodes without ever explicitely 
> querying "name". I've tested this with both the board firmware and VOF 
> and with the board firmware a name property appears in most nodes but 
> not all so I think at least SmartFirmware does the same and explicitely 
> sets name on some nodes and otherwise returns the name from path if such 
> property does not existbut queried. With this in VOF I can do the same 
> and get same results so the change should be OK but the comment may be 
> misleading now. Better to just say we return a value for "name" from 
> path if queried but property does not exist which seems to be what OF 
> does too.


Fair point, after checking with o1275 and 
devicetree-specification-v0.2.pdf, I'll do what you said.



>> +     * we emulate it by returning a pointer to the node's name and 
>> adjust
>> +     * proplen to include only the name but not the unit.
>> +     */
>> +    if (strcmp(propname, "name")) {
>> +        return NULL;
>> +    }
>> +    prop = fdt_get_name(fdt, nodeoff, proplen);
>> +    if (!prop) {
>> +        *proplen = 0;
>> +        return NULL;
>> +    }
>> +
>> +    unit = memchr(prop, '@', *proplen);
>> +    if (unit) {
>> +        *proplen = unit - prop;
>> +    }
>> +    *proplen += 1;
>> +
>> +    /*
>> +     * Since it might be cut at "@" and there will be no trailing zero
>> +     * in the prop buffer, tell the caller to write zero at the end.
>> +     */
>> +    if (write0) {
>> +        *write0 = true;
>> +    }
>> +    return prop;
>> +}
>> +
>> +static uint32_t vof_getprop(const void *fdt, uint32_t nodeph, 
>> uint32_t pname,
>> +                            uint32_t valaddr, uint32_t vallen)
>> +{
>> +    char propname[OF_PROPNAME_LEN_MAX + 1];
>> +    uint32_t ret = 0;
>> +    int proplen = 0;
>> +    const void *prop;
>> +    char trval[64] = "";
>> +    int nodeoff = fdt_node_offset_by_phandle(fdt, nodeph);
>> +    bool write0;
>> +
>> +    if (nodeoff < 0) {
>> +        return -1;
>> +    }
>> +    if (readstr(pname, propname, sizeof(propname))) {
>> +        return -1;
>> +    }
>> +    prop = getprop(fdt, nodeoff, propname, &proplen, &write0);
>> +    if (prop) {
>> +        const char zero = 0;
>> +        int cb = MIN(proplen, vallen);
>> +
>> +        if (VOF_MEM_WRITE(valaddr, prop, cb) != MEMTX_OK ||
>> +            /* if that was "name" with a unit address, overwrite '@' 
>> with '0' */
>> +            (write0 &&
>> +             cb == proplen &&
>> +             VOF_MEM_WRITE(valaddr + cb - 1, &zero, 1) != MEMTX_OK)) {
>> +            ret = -1;
>> +        } else {
>> +            /*
>> +             * OF1275 says:
>> +             * "Size is either the actual size of the property, or -1 
>> if name
>> +             * does not exist", hence returning proplen instead of cb.
>> +             */
>> +            ret = proplen;
>> +            /* Do not format a value if tracepoint is silent, for 
>> performance */
>> +            if (trace_event_get_state(TRACE_VOF_GETPROP) &&
>> +                qemu_loglevel_mask(LOG_TRACE)) {
>> +                prop_format(trval, sizeof(trval), prop, ret);
>> +            }
>> +        }
>> +    } else {
>> +        ret = -1;
>> +    }
>> +    trace_vof_getprop(nodeph, propname, ret, trval);
>> +
>> +    return ret;
>> +}
>> +
>> +static uint32_t vof_getproplen(const void *fdt, uint32_t nodeph, 
>> uint32_t pname)
>> +{
>> +    char propname[OF_PROPNAME_LEN_MAX + 1];
>> +    uint32_t ret = 0;
>> +    int proplen = 0;
>> +    const void *prop;
>> +    int nodeoff = fdt_node_offset_by_phandle(fdt, nodeph);
>> +
>> +    if (nodeoff < 0) {
>> +        return -1;
>> +    }
>> +    if (readstr(pname, propname, sizeof(propname))) {
>> +        return -1;
>> +    }
>> +    prop = getprop(fdt, nodeoff, propname, &proplen, NULL);
>> +    if (prop) {
>> +        ret = proplen;
>> +    } else {
>> +        ret = -1;
>> +    }
>> +    trace_vof_getproplen(nodeph, propname, ret);
>> +
>> +    return ret;
>> +}
>> +
>> +static uint32_t vof_setprop(MachineState *ms, void *fdt, Vof *vof,
>> +                            uint32_t nodeph, uint32_t pname,
>> +                            uint32_t valaddr, uint32_t vallen)
>> +{
>> +    char propname[OF_PROPNAME_LEN_MAX + 1];
>> +    uint32_t ret = -1;
>> +    int offset;
>> +    char trval[64] = "";
>> +    char nodepath[VOF_MAX_PATH] = "";
>> +    Object *vmo = object_dynamic_cast(OBJECT(ms), TYPE_VOF_MACHINE_IF);
>> +    g_autofree char *val = NULL;
>> +
>> +    if (vallen > VOF_MAX_SETPROPLEN) {
>> +        goto trace_exit;
>> +    }
>> +    if (readstr(pname, propname, sizeof(propname))) {
>> +        goto trace_exit;
>> +    }
>> +    offset = fdt_node_offset_by_phandle(fdt, nodeph);
>> +    if (offset < 0) {
>> +        goto trace_exit;
>> +    }
>> +    ret = get_path(fdt, offset, nodepath, sizeof(nodepath));
>> +    if (ret <= 0) {
>> +        goto trace_exit;
>> +    }
>> +
>> +    val = g_malloc0(vallen);
>> +    if (VOF_MEM_READ(valaddr, val, vallen) != MEMTX_OK) {
>> +        goto trace_exit;
>> +    }
>> +
>> +    if (vmo) {
>> +        VofMachineIfClass *vmc = VOF_MACHINE_GET_CLASS(vmo);
>> +
>> +        if (vmc->setprop &&
>> +            !vmc->setprop(ms, nodepath, propname, val, vallen)) {
>> +            goto trace_exit;
>> +        }
>> +    }
>> +
>> +    ret = fdt_setprop(fdt, offset, propname, val, vallen);
>> +    if (ret) {
>> +        goto trace_exit;
>> +    }
>> +
>> +    if (trace_event_get_state(TRACE_VOF_SETPROP) &&
>> +        qemu_loglevel_mask(LOG_TRACE)) {
>> +        prop_format(trval, sizeof(trval), val, vallen);
>> +    }
>> +    ret = vallen;
>> +
>> +trace_exit:
>> +    trace_vof_setprop(nodeph, propname, trval, vallen, ret);
>> +
>> +    return ret;
>> +}
>> +
>> +static uint32_t vof_nextprop(const void *fdt, uint32_t phandle,
>> +                             uint32_t prevaddr, uint32_t nameaddr)
>> +{
>> +    int offset, nodeoff = fdt_node_offset_by_phandle(fdt, phandle);
>> +    char prev[OF_PROPNAME_LEN_MAX + 1];
>> +    const char *tmp;
>> +
>> +    if (readstr(prevaddr, prev, sizeof(prev))) {
>> +        return -1;
>> +    }
>> +
>> +    fdt_for_each_property_offset(offset, fdt, nodeoff) {
>> +        if (!fdt_getprop_by_offset(fdt, offset, &tmp, NULL)) {
>> +            return 0;
>> +        }
>> +        if (prev[0] == '\0' || strcmp(prev, tmp) == 0) {
>> +            if (prev[0] != '\0') {
>> +                offset = fdt_next_property_offset(fdt, offset);
>> +                if (offset < 0) {
>> +                    return 0;
>> +                }
>> +            }
>> +            if (!fdt_getprop_by_offset(fdt, offset, &tmp, NULL)) {
>> +                return 0;
>> +            }
>> +
>> +            if (VOF_MEM_WRITE(nameaddr, tmp, strlen(tmp) + 1) != 
>> MEMTX_OK) {
>> +                return -1;
>> +            }
>> +            return 1;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static uint32_t vof_peer(const void *fdt, uint32_t phandle)
>> +{
>> +    int ret;
>> +
>> +    if (phandle == 0) {
>> +        ret = fdt_path_offset(fdt, "/");
>> +    } else {
>> +        ret = fdt_next_subnode(fdt, fdt_node_offset_by_phandle(fdt, 
>> phandle));
>> +    }
>> +
>> +    if (ret < 0) {
>> +        ret = 0;
>> +    } else {
>> +        ret = fdt_get_phandle(fdt, ret);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static uint32_t vof_child(const void *fdt, uint32_t phandle)
>> +{
>> +    int ret = fdt_first_subnode(fdt, fdt_node_offset_by_phandle(fdt, 
>> phandle));
>> +
>> +    if (ret < 0) {
>> +        ret = 0;
>> +    } else {
>> +        ret = fdt_get_phandle(fdt, ret);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static uint32_t vof_parent(const void *fdt, uint32_t phandle)
>> +{
>> +    int ret = fdt_parent_offset(fdt, fdt_node_offset_by_phandle(fdt, 
>> phandle));
>> +
>> +    if (ret < 0) {
>> +        ret = 0;
>> +    } else {
>> +        ret = fdt_get_phandle(fdt, ret);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static uint32_t vof_do_open(void *fdt, Vof *vof, int offset, const 
>> char *path)
>> +{
>> +    uint32_t ret = -1;
>> +    OfInstance *inst = NULL;
>> +
>> +    if (vof->of_instance_last == 0xFFFFFFFF) {
>> +        /* We do not recycle ihandles yet */
>> +        goto trace_exit;
>> +    }
>> +
>> +    inst = g_new0(OfInstance, 1);
>> +    inst->phandle = fdt_get_phandle(fdt, offset);
>> +    g_assert(inst->phandle);
>> +    ++vof->of_instance_last;
>> +
>> +    inst->path = g_strdup(path);
>> +    g_hash_table_insert(vof->of_instances,
>> +                        GINT_TO_POINTER(vof->of_instance_last),
>> +                        inst);
>> +    ret = vof->of_instance_last;
>> +
>> +trace_exit:
>> +    trace_vof_open(path, inst ? inst->phandle : 0, ret);
>> +
>> +    return ret;
>> +}
>> +
>> +uint32_t vof_client_open_store(void *fdt, Vof *vof, const char 
>> *nodename,
>> +                               const char *prop, const char *path)
>> +{
>> +    int node = fdt_path_offset(fdt, nodename);
>> +    int inst, offset;
>> +
>> +    offset = fdt_path_offset(fdt, path);
>> +    if (offset < 0) {
>> +        trace_vof_error_unknown_path(path);
>> +        return offset;
>> +    }
>> +
>> +    inst = vof_do_open(fdt, vof, offset, path);
>> +
>> +    return fdt_setprop_cell(fdt, node, prop, inst);
>> +}
>> +
>> +static uint32_t vof_open(void *fdt, Vof *vof, uint32_t pathaddr)
>> +{
>> +    char path[VOF_MAX_PATH];
>> +    int offset;
>> +
>> +    if (readstr(pathaddr, path, sizeof(path))) {
>> +        return -1;
>> +    }
>> +
>> +    offset = path_offset(fdt, path);
>> +    if (offset < 0) {
>> +        trace_vof_error_unknown_path(path);
>> +        return offset;
>> +    }
>> +
>> +    return vof_do_open(fdt, vof, offset, path);
>> +}
>> +
>> +static void vof_close(Vof *vof, uint32_t ihandle)
>> +{
>> +    if (!g_hash_table_remove(vof->of_instances, 
>> GINT_TO_POINTER(ihandle))) {
>> +        trace_vof_error_unknown_ihandle_close(ihandle);
>> +    }
>> +}
>> +
>> +static uint32_t vof_instance_to_package(Vof *vof, uint32_t ihandle)
>> +{
>> +    gpointer instp = g_hash_table_lookup(vof->of_instances,
>> +                                         GINT_TO_POINTER(ihandle));
>> +    uint32_t ret = -1;
>> +
>> +    if (instp) {
>> +        ret = ((OfInstance *)instp)->phandle;
>> +    }
>> +    trace_vof_instance_to_package(ihandle, ret);
>> +
>> +    return ret;
>> +}
>> +
>> +static uint32_t vof_package_to_path(const void *fdt, uint32_t phandle,
>> +                                    uint32_t buf, uint32_t len)
>> +{
>> +    uint32_t ret = -1;
>> +    char tmp[VOF_MAX_PATH] = "";
>> +
>> +    ret = phandle_to_path(fdt, phandle, tmp, sizeof(tmp));
>> +    if (ret > 0) {
>> +        if (VOF_MEM_WRITE(buf, tmp, ret) != MEMTX_OK) {
>> +            ret = -1;
>> +        }
>> +    }
>> +
>> +    trace_vof_package_to_path(phandle, tmp, ret);
>> +
>> +    return ret;
>> +}
>> +
>> +static uint32_t vof_instance_to_path(void *fdt, Vof *vof, uint32_t 
>> ihandle,
>> +                                     uint32_t buf, uint32_t len)
>> +{
>> +    uint32_t ret = -1;
>> +    uint32_t phandle = vof_instance_to_package(vof, ihandle);
>> +    char tmp[VOF_MAX_PATH] = "";
>> +
>> +    if (phandle != -1) {
>> +        ret = phandle_to_path(fdt, phandle, tmp, sizeof(tmp));
>> +        if (ret > 0) {
>> +            if (VOF_MEM_WRITE(buf, tmp, ret) != MEMTX_OK) {
>> +                ret = -1;
>> +            }
>> +        }
>> +    }
>> +    trace_vof_instance_to_path(ihandle, phandle, tmp, ret);
>> +
>> +    return ret;
>> +}
>> +
>> +static uint32_t vof_write(Vof *vof, uint32_t ihandle, uint32_t buf,
>> +                          uint32_t len)
>> +{
>> +    char tmp[VOF_VTY_BUF_SIZE];
>> +    unsigned cb;
>> +    OfInstance *inst = (OfInstance *)
>> +        g_hash_table_lookup(vof->of_instances, 
>> GINT_TO_POINTER(ihandle));
>> +
>> +    if (!inst) {
>> +        trace_vof_error_write(ihandle);
>> +        return -1;
>> +    }
>> +
>> +    for ( ; len > 0; len -= cb) {
>> +        cb = MIN(len, sizeof(tmp) - 1);
>> +        if (VOF_MEM_READ(buf, tmp, cb) != MEMTX_OK) {
>> +            return -1;
>> +        }
>> +
>> +        /* FIXME: there is no backend(s) yet so just call a trace */
>> +        if (trace_event_get_state(TRACE_VOF_WRITE) &&
>> +            qemu_loglevel_mask(LOG_TRACE)) {
>> +            tmp[cb] = '\0';
>> +            trace_vof_write(ihandle, cb, tmp);
>> +        }
>> +    }
>> +
>> +    return len;
>> +}
>> +
>> +static void vof_claimed_dump(GArray *claimed)
>> +{
>> +    int i;
>> +    OfClaimed c;
>> +
>> +    if (trace_event_get_state(TRACE_VOF_CLAIMED) &&
>> +        qemu_loglevel_mask(LOG_TRACE)) {
>> +
>> +        for (i = 0; i < claimed->len; ++i) {
>> +            c = g_array_index(claimed, OfClaimed, i);
>> +            trace_vof_claimed(c.start, c.start + c.size, c.size);
>> +        }
>> +    }
>> +}
>> +
>> +static bool vof_claim_avail(GArray *claimed, uint64_t virt, uint64_t 
>> size)
>> +{
>> +    int i;
>> +    OfClaimed c;
>> +
>> +    for (i = 0; i < claimed->len; ++i) {
>> +        c = g_array_index(claimed, OfClaimed, i);
>> +        if (ranges_overlap(c.start, c.size, virt, size)) {
>> +            return false;
>> +        }
>> +    }
>> +
>> +    return true;
>> +}
>> +
>> +static void vof_claim_add(GArray *claimed, uint64_t virt, uint64_t size)
>> +{
>> +    OfClaimed newclaim;
>> +
>> +    newclaim.start = virt;
>> +    newclaim.size = size;
>> +    g_array_append_val(claimed, newclaim);
>> +}
>> +
>> +static gint of_claimed_compare_func(gconstpointer a, gconstpointer b)
>> +{
>> +    return ((OfClaimed *)a)->start - ((OfClaimed *)b)->start;
>> +}
>> +
>> +static void vof_dt_memory_available(void *fdt, GArray *claimed, 
>> uint64_t base)
>> +{
>> +    int i, n, offset, proplen = 0, sc, ac;
>> +    target_ulong mem0_end;
>> +    const uint8_t *mem0_reg;
>> +    g_autofree uint8_t *avail = NULL;
>> +    uint8_t *availcur;
>> +
>> +    if (!fdt || !claimed) {
>> +        return;
>> +    }
>> +
>> +    offset = fdt_path_offset(fdt, "/");
>> +    _FDT(offset);
>> +    ac = fdt_address_cells(fdt, offset);
>> +    g_assert(ac == 1 || ac == 2);
>> +    sc = fdt_size_cells(fdt, offset);
>> +    g_assert(sc == 1 || sc == 2);
>> +
>> +    offset = fdt_path_offset(fdt, "/memory@0");
>> +    _FDT(offset);
>> +
>> +    mem0_reg = fdt_getprop(fdt, offset, "reg", &proplen);
>> +    g_assert(mem0_reg && proplen == sizeof(uint32_t) * (ac + sc));
>> +    if (sc == 2) {
>> +        mem0_end = be64_to_cpu(*(uint64_t *)(mem0_reg + 
>> sizeof(uint32_t) * ac));
>> +    } else {
>> +        mem0_end = be32_to_cpu(*(uint32_t *)(mem0_reg + 
>> sizeof(uint32_t) * ac));
>> +    }
>> +
>> +    g_array_sort(claimed, of_claimed_compare_func);
>> +    vof_claimed_dump(claimed);
>> +
>> +    /*
>> +     * VOF resides in the first page so we do not need to check if 
>> there is
>> +     * available memory before the first claimed block
>> +     */
>> +    g_assert(claimed->len && (g_array_index(claimed, OfClaimed, 
>> 0).start == 0));
>> +
>> +    avail = g_malloc0(sizeof(uint32_t) * (ac + sc) * claimed->len);
>> +    for (i = 0, n = 0, availcur = avail; i < claimed->len; ++i) {
>> +        OfClaimed c = g_array_index(claimed, OfClaimed, i);
>> +        uint64_t start, size;
>> +
>> +        start = c.start + c.size;
>> +        if (i < claimed->len - 1) {
>> +            OfClaimed cn = g_array_index(claimed, OfClaimed, i + 1);
>> +
>> +            size = cn.start - start;
>> +        } else {
>> +            size = mem0_end - start;
>> +        }
>> +
>> +        if (ac == 2) {
>> +            *(uint64_t *) availcur = cpu_to_be64(start);
>> +        } else {
>> +            *(uint32_t *) availcur = cpu_to_be32(start);
>> +        }
>> +        availcur += sizeof(uint32_t) * ac;
>> +        if (sc == 2) {
>> +            *(uint64_t *) availcur = cpu_to_be64(size);
>> +        } else {
>> +            *(uint32_t *) availcur = cpu_to_be32(size);
>> +        }
>> +        availcur += sizeof(uint32_t) * sc;
>> +
>> +        if (size) {
>> +            trace_vof_avail(c.start + c.size, c.start + c.size + 
>> size, size);
>> +            ++n;
>> +        }
>> +    }
>> +    _FDT((fdt_setprop(fdt, offset, "available", avail, availcur - 
>> avail)));
>> +}
>> +
>> +/*
>> + * OF1275:
>> + * "Allocates size bytes of memory. If align is zero, the allocated 
>> range
>> + * begins at the virtual address virt. Otherwise, an aligned address is
>> + * automatically chosen and the input argument virt is ignored".
>> + *
>> + * In other words, exactly one of @virt and @align is non-zero.
>> + */
>> +uint64_t vof_claim(Vof *vof, uint64_t virt, uint64_t size,
>> +                   uint64_t align)
>> +{
>> +    uint64_t ret;
>> +
>> +    if (size == 0) {
>> +        ret = -1;
>> +    } else if (align == 0) {
>> +        if (!vof_claim_avail(vof->claimed, virt, size)) {
>> +            ret = -1;
>> +        } else {
>> +            ret = virt;
>> +        }
>> +    } else {
>> +        vof->claimed_base = QEMU_ALIGN_UP(vof->claimed_base, align);
>> +        while (1) {
>> +            if (vof->claimed_base >= vof->top_addr) {
>> +                error_report("Out of RMA memory for the OF client");
>> +                return -1;
>> +            }
>> +            if (vof_claim_avail(vof->claimed, vof->claimed_base, 
>> size)) {
>> +                break;
>> +            }
>> +            vof->claimed_base += size;
>> +        }
>> +        ret = vof->claimed_base;
>> +    }
>> +
>> +    if (ret != -1) {
>> +        vof->claimed_base = MAX(vof->claimed_base, ret + size);
>> +        vof_claim_add(vof->claimed, ret, size);
>> +    }
>> +    trace_vof_claim(virt, size, align, ret);
>> +
>> +    return ret;
>> +}
>> +
>> +static uint32_t vof_release(Vof *vof, uint64_t virt, uint64_t size)
>> +{
>> +    uint32_t ret = -1;
>> +    int i;
>> +    GArray *claimed = vof->claimed;
>> +    OfClaimed c;
>> +
>> +    for (i = 0; i < claimed->len; ++i) {
>> +        c = g_array_index(claimed, OfClaimed, i);
>> +        if (c.start == virt && c.size == size) {
>> +            g_array_remove_index(claimed, i);
>> +            ret = 0;
>> +            break;
>> +        }
>> +    }
>> +
>> +    trace_vof_release(virt, size, ret);
>> +
>> +    return ret;
>> +}
>> +
>> +static void vof_instantiate_rtas(Error **errp)
>> +{
>> +    error_setg(errp, "The firmware should have instantiated RTAS");
>> +}
>> +
>> +static uint32_t vof_call_method(MachineState *ms, Vof *vof, uint32_t 
>> methodaddr,
>> +                                uint32_t ihandle, uint32_t param1,
>> +                                uint32_t param2, uint32_t param3,
>> +                                uint32_t param4, uint32_t *ret2)
>> +{
>> +    uint32_t ret = -1;
>> +    char method[VOF_MAX_METHODLEN] = "";
>> +    OfInstance *inst;
>> +
>> +    if (!ihandle) {
>> +        goto trace_exit;
>> +    }
>> +
>> +    inst = (OfInstance *) g_hash_table_lookup(vof->of_instances,
>> +                                              GINT_TO_POINTER(ihandle));
> 
> I think you should not have space in type casts but checkpatch does not 
> seem to mind. You have this at several places.


checkpatch does mind because it is truly ugly. I tried:


ERROR: "(foo*)" should be "(foo *)"
#2029: FILE: pc-bios/vof/ci.c:46:
+    if (prom_handle((void*)(unsigned long) args)) {

total: 1 errors, 0 warnings, 2030 lines checked



-- 
Alexey

