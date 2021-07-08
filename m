Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 817783BF43F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 05:16:52 +0200 (CEST)
Received: from localhost ([::1]:33020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1KWx-0003xk-BF
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 23:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1m1KVa-00035u-It
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 23:15:26 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:42683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1m1KVS-0007Bw-V8
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 23:15:26 -0400
Received: by mail-pf1-x433.google.com with SMTP id y4so4154314pfi.9
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 20:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3eDzDby27dXJ/RasqLgijIJB2XK06T3OSaRX/XNbaHo=;
 b=rVnEjOVqrlr/tdzW8OQjagAuYIGR1E1TdagHmDf7oYlpK1LbPO6fg9dfc0OXi8ZEVL
 6nM8V55atG+vn6qALP4K+Z5GsAoiRxLp5/lzcAkTeimEsjQZib6lrRgHFY/ptqyFkQCP
 M2lEgXxgW7hfObIwx1KCOfQJDQeaithR57nwBAZjkC8oZ4lz5rsHU2a54cmfQSh0/HOL
 hKquiZsgrgFygophfscSl7wrC36Yx86RbLZNyi3bgyokvv8YTsJ5qZvBXsfjgZhZxBlU
 4CAEk+j5UVOcZbBusvrCTMcGDjZKotu66dgBVdV8+Gsz284p++nKR9wH9bIlHhsxo4Vb
 m30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3eDzDby27dXJ/RasqLgijIJB2XK06T3OSaRX/XNbaHo=;
 b=unptqoTg7Bs34797s3hrb2K2z0bdV91/Ewhtrav6jKgM/8XTNU1r0hhAqXtXjPKWn1
 71QCbkT/1+GTJHzu1uMI9IfL0ElonmIqj7frbY8V54GBFReXnemlq8VONx7wbZBs5MAV
 pMrDrgEdMTn6sThNwDHyAor2+HqNxijwd98kamo63hQbGaVDQRF6pF1u/HSzs/L8jJox
 nm40mJVgobC+Bjm5ksBcwFAtt9KXk5++KXDdTugNOcFwZ2m6qnbSXovREy4OM1ZD6JEj
 wnto109fRuX+SIOJ3icrAP29lhuV41kNK7SSR16+kKI+IBgcIHc8MXBpsHP9JkkKttEY
 t62w==
X-Gm-Message-State: AOAM531FXo6UHRgOV1Nh2gcQFHthcU8pJ9FoSsvveWOug9qVXeJTItBY
 5x+imVgsXsP0RTRW8sDTiOuFdw==
X-Google-Smtp-Source: ABdhPJyQblzVG1XshYQJcQoWPMP7vsyDZ/Ty8/HdC0bBWjQBZ/ri+alWOXve6H896rK9QPsRREETlw==
X-Received: by 2002:a62:154d:0:b029:323:a515:2e43 with SMTP id
 74-20020a62154d0000b0290323a5152e43mr10974140pfv.75.1625714114666; 
 Wed, 07 Jul 2021 20:15:14 -0700 (PDT)
Received: from [192.168.10.23] (219-90-184-65.ip.adam.com.au. [219.90.184.65])
 by smtp.gmail.com with UTF8SMTPSA id
 w123sm646735pfb.109.2021.07.07.20.15.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 20:15:14 -0700 (PDT)
Message-ID: <377380cb-64cb-9bde-82c3-7dfcdf3210c6@ozlabs.ru>
Date: Thu, 8 Jul 2021 13:15:10 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:89.0) Gecko/20100101
 Thunderbird/89.0
Subject: Re: [PATCH qemu v22] spapr: Implement Open Firmware client interface
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210625055155.2252896-1-aik@ozlabs.ru> <YOZlnOiCeeF4mwJO@yekko>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <YOZlnOiCeeF4mwJO@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=aik@ozlabs.ru; helo=mail-pf1-x433.google.com
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



On 08/07/2021 12:40, David Gibson wrote:
> On Fri, Jun 25, 2021 at 03:51:55PM +1000, Alexey Kardashevskiy wrote:
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
>> The immediate benefit is much faster booting time which especially
>> crucial with fully emulated early CPU bring up environments. Also this
>> may come handy when/if GRUB-in-the-userspace sees light of the day.
>>
>> This separates VOF and sPAPR in a hope that VOF bits may be reused by
>> other POWERPC boards which do not support pSeries.
>>
>> This assumes potential support for booting from QEMU backends
>> such as blockdev or netdev without devices/drivers used.
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> 
> Applied to ppc-for-6.1.  However, I'm going to make a number of
> comments on minor nits.  If they can be addressed as follow up
> patches, I'd appreciate it.
> 
> [snip]
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
> 
> AFAICT 'client' is only used in one place, might as well just open
> code it.
> 
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
>> index 9e19c570327e..e9b6d0f58756 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -101,6 +101,7 @@
>>   #define FDT_MAX_ADDR            0x80000000 /* FDT must stay below that */
>>   #define FW_MAX_SIZE             0x400000
>>   #define FW_FILE_NAME            "slof.bin"
>> +#define FW_FILE_NAME_VOF        "vof.bin"
>>   #define FW_OVERHEAD             0x2800000
>>   #define KERNEL_LOAD_ADDR        FW_MAX_SIZE
>>   
>> @@ -1643,22 +1644,37 @@ static void spapr_machine_reset(MachineState *machine)
>>       fdt_addr = MIN(spapr->rma_size, FDT_MAX_ADDR) - FDT_MAX_SIZE;
>>   
>>       fdt = spapr_build_fdt(spapr, true, FDT_MAX_SIZE);
>> +    if (spapr->vof) {
>> +        target_ulong stack_ptr = 0;
>>   
>> -    rc = fdt_pack(fdt);
>> +        spapr_vof_reset(spapr, fdt, &stack_ptr, &error_fatal);
>>   
>> -    /* Should only fail if we've built a corrupted tree */
>> -    assert(rc == 0);
>> +        spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
>> +                                  stack_ptr, spapr->initrd_base,
>> +                                  spapr->initrd_size);
>> +        /* VOF is 32bit BE so enforce MSR here */
>> +        first_ppc_cpu->env.msr &= ~((1ULL << MSR_SF) | (1ULL << MSR_LE));
>> +        /*
>> +         * Do not pack the FDT as the client may change properties.
>> +         * VOF client does not expect the FDT so we do not load it to the VM.
>> +         */
> 
> I think it would be cleaner to fold the rest of this if clause into
> spapr_vof_reset() (adding some parameters as necessary).
> 
> [snip]
>> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>> index f25014afda40..03fc191599fe 100644
>> --- a/hw/ppc/spapr_hcall.c
>> +++ b/hw/ppc/spapr_hcall.c
>> @@ -1080,7 +1080,7 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
>>       SpaprOptionVector *ov1_guest, *ov5_guest;
>>       bool guest_radix;
>>       bool raw_mode_supported = false;
>> -    bool guest_xive;
>> +    bool guest_xive, reset_fdt = false;
> 
> Initialization of reset_fdt is redundant, since you set it
> unconditionally before you use it.
> 
>>       CPUState *cs;
>>       void *fdt;
>>       uint32_t max_compat = spapr->max_compat_pvr;
>> @@ -1233,8 +1233,8 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
>>           spapr_setup_hpt(spapr);
>>       }
>>   
>> -    fdt = spapr_build_fdt(spapr, false, fdt_bufsize);
>> -
>> +    reset_fdt = spapr->vof != NULL;
>> +    fdt = spapr_build_fdt(spapr, reset_fdt, fdt_bufsize);
>>       g_free(spapr->fdt_blob);
>>       spapr->fdt_size = fdt_totalsize(fdt);
>>       spapr->fdt_initial_size = spapr->fdt_size;
> [snip]
>> @@ -1277,6 +1277,25 @@ static target_ulong h_client_architecture_support(PowerPCCPU *cpu,
>>       return ret;
>>   }
>>   
>> +target_ulong spapr_vof_client_architecture_support(MachineState *ms,
>> +                                                   CPUState *cs,
>> +                                                   target_ulong ovec_addr)
>> +{
>> +    SpaprMachineState *spapr = SPAPR_MACHINE(ms);
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
>> index 000000000000..1d5bec146c49
>> --- /dev/null
>> +++ b/hw/ppc/spapr_vof.c
>> @@ -0,0 +1,154 @@
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
>> +#include "hw/ppc/vof.h"
>> +#include "sysemu/sysemu.h"
>> +#include "qom/qom-qobject.h"
>> +#include "trace.h"
>> +
>> +target_ulong spapr_h_vof_client(PowerPCCPU *cpu, SpaprMachineState *spapr,
>> +                                target_ulong opcode, target_ulong *_args)
>> +{
>> +    int ret = vof_client_call(MACHINE(spapr), spapr->vof, spapr->fdt_blob,
>> +                              ppc64_phys_to_real(_args[0]));
>> +
>> +    if (ret) {
>> +        return H_PARAMETER;
>> +    }
>> +    return H_SUCCESS;
>> +}
>> +
>> +void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt)
>> +{
>> +    char *stdout_path = spapr_vio_stdout_path(spapr->vio_bus);
>> +    int chosen;
>> +
>> +    vof_build_dt(fdt, spapr->vof);
>> +
>> +    _FDT(chosen = fdt_path_offset(fdt, "/chosen"));
>> +    _FDT(fdt_setprop_string(fdt, chosen, "bootargs",
>> +                            spapr->vof->bootargs ? : ""));
> 
> You do several things with vof->bootargs, but if you've initialized it
> from machine->kernel_cmdline, I didn't spot it.


GRUB initilizes it and updates via spapr_vof_setprop().


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
> [snip]
>> diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
>> new file mode 100644
>> index 000000000000..a17fd9d2fe94
>> --- /dev/null
>> +++ b/hw/ppc/vof.c
> [snip]
>> +static int path_offset(const void *fdt, const char *path)
>> +{
>> +    g_autofree char *p = NULL;
>> +    char *at;
>> +
>> +    /*
>> +     * https://www.devicetree.org/open-firmware/bindings/ppc/release/ppc-2_1.html#HDR16
>> +     *
>> +     * "Conversion from numeric representation to text representation shall use
>> +     * the lower case forms of the hexadecimal digits in the range a..f,
>> +     * suppressing leading zeros".
> 
> Huh... that suggests that Zoltan's firmware which passes a caps hex
> and expects it to work is doing the wrong thing.  We still need to
> accomodate it, though.
> 
>> +     */
>> +    at = strchr(path, '@');
>> +    if (!at) {
>> +        return fdt_path_offset(fdt, path);
>> +    }
>> +
>> +    p = g_strdup(path);
>> +    for (at = at - path + p + 1; *at; ++at) {
>> +        *at = tolower(*at);
>> +    }
> 
> This isn't quite right, though we might get away with it in practice.
> You're taking a whole path here, and each path component could
> potentially have a unit address.  This will tolower() everything after
> the first @, potentially case mangling the base names of later
> components.


Ah. I need the last "@" here, at least. But I do not think we need to go 
any further than this here.


> 
>> +    return fdt_path_offset(fdt, p);
>> +}
> 
> [snip]
>> +static uint32_t vof_getprop(const void *fdt, uint32_t nodeph, uint32_t pname,
>> +                            uint32_t valaddr, uint32_t vallen)
>> +{
>> +    char propname[OF_PROPNAME_LEN_MAX + 1];
>> +    uint32_t ret = 0;
>> +    int proplen = 0;
>> +    const void *prop;
>> +    char trval[64] = "";
>> +    int nodeoff = fdt_node_offset_by_phandle(fdt, nodeph);
>> +    bool write0;
>> +
>> +    if (nodeoff < 0) {
>> +        return -1;
> 
> Shouldn't many of these explicit -1s be PROM_ERR, since you defined it?
> 
>> +    }
>> +    if (readstr(pname, propname, sizeof(propname))) {
>> +        return -1;
>> +    }
>> +    prop = getprop(fdt, nodeoff, propname, &proplen, &write0);
>> +    if (prop) {
>> +        const char zero = 0;
>> +        int cb = MIN(proplen, vallen);
>> +
>> +        if (VOF_MEM_WRITE(valaddr, prop, cb) != MEMTX_OK ||
>> +            /* if that was "name" with a unit address, overwrite '@' with '0' */
>> +            (write0 &&
>> +             cb == proplen &&
>> +             VOF_MEM_WRITE(valaddr + cb - 1, &zero, 1) != MEMTX_OK)) {
>> +            ret = -1;
>> +        } else {
>> +            /*
>> +             * OF1275 says:
>> +             * "Size is either the actual size of the property, or -1 if name
>> +             * does not exist", hence returning proplen instead of cb.
>> +             */
>> +            ret = proplen;
>> +            /* Do not format a value if tracepoint is silent, for performance */
>> +            if (trace_event_get_state(TRACE_VOF_GETPROP) &&
>> +                qemu_loglevel_mask(LOG_TRACE)) {
>> +                prop_format(trval, sizeof(trval), prop, ret);
>> +            }
>> +        }
>> +    } else {
>> +        ret = -1;
>> +    }
>> +    trace_vof_getprop(nodeph, propname, ret, trval);
>> +
>> +    return ret;
>> +}
> 
> [snip]
>> +static uint32_t vof_setprop(MachineState *ms, void *fdt, Vof *vof,
>> +                            uint32_t nodeph, uint32_t pname,
>> +                            uint32_t valaddr, uint32_t vallen)
>> +{
>> +    char propname[OF_PROPNAME_LEN_MAX + 1];
>> +    uint32_t ret = -1;
>> +    int offset;
>> +    char trval[64] = "";
>> +    char nodepath[VOF_MAX_PATH] = "";
>> +    Object *vmo = object_dynamic_cast(OBJECT(ms), TYPE_VOF_MACHINE_IF);
>> +    g_autofree char *val = NULL;
>> +
>> +    if (vallen > VOF_MAX_SETPROPLEN) {
>> +        goto trace_exit;
>> +    }
>> +    if (readstr(pname, propname, sizeof(propname))) {
>> +        goto trace_exit;
>> +    }
>> +    offset = fdt_node_offset_by_phandle(fdt, nodeph);
>> +    if (offset < 0) {
>> +        goto trace_exit;
>> +    }
>> +    ret = get_path(fdt, offset, nodepath, sizeof(nodepath));
>> +    if (ret <= 0) {
>> +        goto trace_exit;
>> +    }
>> +
>> +    val = g_malloc0(vallen);
>> +    if (VOF_MEM_READ(valaddr, val, vallen) != MEMTX_OK) {
>> +        goto trace_exit;
>> +    }
>> +
>> +    if (vmo) {
>> +        VofMachineIfClass *vmc = VOF_MACHINE_GET_CLASS(vmo);
>> +
>> +        if (vmc->setprop &&
>> +            !vmc->setprop(ms, nodepath, propname, val, vallen)) {
>> +            goto trace_exit;
> 
> This defaults to allowing the setprop if the machine doesn't provide a
> setprop callback.  I think it would be safer to default to prohibiting
> all setprops except those the machine explicitly allows.


Mmmm... I can imagine the client using the device tree as a temporary 
storage. I'd rather add a trace for such cases.


>> +        }
>> +    }
>> +
>> +    ret = fdt_setprop(fdt, offset, propname, val, vallen);
>> +    if (ret) {
>> +        goto trace_exit;
>> +    }
>> +
>> +    if (trace_event_get_state(TRACE_VOF_SETPROP) &&
>> +        qemu_loglevel_mask(LOG_TRACE)) {
>> +        prop_format(trval, sizeof(trval), val, vallen);
>> +    }
>> +    ret = vallen;
>> +
>> +trace_exit:
>> +    trace_vof_setprop(nodeph, propname, trval, vallen, ret);
>> +
>> +    return ret;
>> +}
> 
> [snip]
>> +static uint32_t vof_write(Vof *vof, uint32_t ihandle, uint32_t buf,
>> +                          uint32_t len)
>> +{
>> +    char tmp[VOF_VTY_BUF_SIZE];
>> +    unsigned cb;
>> +    OfInstance *inst = (OfInstance *)
>> +        g_hash_table_lookup(vof->of_instances, GINT_TO_POINTER(ihandle));
>> +
>> +    if (!inst) {
>> +        trace_vof_error_write(ihandle);
>> +        return -1;
>> +    }
>> +
>> +    for ( ; len > 0; len -= cb) {
>> +        cb = MIN(len, sizeof(tmp) - 1);
>> +        if (VOF_MEM_READ(buf, tmp, cb) != MEMTX_OK) {
>> +            return -1;
>> +        }
>> +
>> +        /* FIXME: there is no backend(s) yet so just call a trace */
> 
> Improving that I think should count as a high priority enhancement.

Heh. This is the main point of opposition to the entire approach :-)


> 
>> +        if (trace_event_get_state(TRACE_VOF_WRITE) &&
>> +            qemu_loglevel_mask(LOG_TRACE)) {
>> +            tmp[cb] = '\0';
>> +            trace_vof_write(ihandle, cb, tmp);
>> +        }
>> +    }
>> +
>> +    return len;
>> +}
> 
> [snip]
>> +
>> +static void vof_instantiate_rtas(Error **errp)
>> +{
>> +    error_setg(errp, "The firmware should have instantiated RTAS");
> 
> Since this always fails...
> 
>> +}
>> +
>> +static uint32_t vof_call_method(MachineState *ms, Vof *vof, uint32_t methodaddr,
>> +                                uint32_t ihandle, uint32_t param1,
>> +                                uint32_t param2, uint32_t param3,
>> +                                uint32_t param4, uint32_t *ret2)
>> +{
>> +    uint32_t ret = -1;
>> +    char method[VOF_MAX_METHODLEN] = "";
>> +    OfInstance *inst;
>> +
>> +    if (!ihandle) {
>> +        goto trace_exit;
>> +    }
>> +
>> +    inst = (OfInstance *)g_hash_table_lookup(vof->of_instances,
>> +                                             GINT_TO_POINTER(ihandle));
>> +    if (!inst) {
>> +        goto trace_exit;
>> +    }
>> +
>> +    if (readstr(methodaddr, method, sizeof(method))) {
>> +        goto trace_exit;
>> +    }
>> +
>> +    if (strcmp(inst->path, "/") == 0) {
>> +        if (strcmp(method, "ibm,client-architecture-support") == 0) {
>> +            Object *vmo = object_dynamic_cast(OBJECT(ms), TYPE_VOF_MACHINE_IF);
>> +
>> +            if (vmo) {
>> +                VofMachineIfClass *vmc = VOF_MACHINE_GET_CLASS(vmo);
>> +
>> +                g_assert(vmc->client_architecture_support);
>> +                ret = vmc->client_architecture_support(ms, first_cpu, param1);
>> +            }
>> +
>> +            *ret2 = 0;
>> +        }
>> +    } else if (strcmp(inst->path, "/rtas") == 0) {
>> +        if (strcmp(method, "instantiate-rtas") == 0) {
> 
> ... why do you even need to handle it here?

Well, I do not _need_ it. I was choosing between leaving a comment here 
or adding the code. The same number of lines but the code seemed more 
descriptive. It also helps when I am playing with no-firmware boot when 
I hack the kernel to call H_VOF directly and seeing the error message 
about is better than a weird crash, this is a very minor thing though.



>> +            vof_instantiate_rtas(&error_fatal);
>> +            ret = 0;
>> +            *ret2 = param1; /* rtas-base */
>> +        }
>> +    } else {
>> +        trace_vof_error_unknown_method(method);
>> +    }
>> +
>> +trace_exit:
>> +    trace_vof_method(ihandle, method, param1, ret, *ret2);
>> +
>> +    return ret;
>> +}
> 
> [snip]
>> +static uint32_t vof_client_handle(MachineState *ms, void *fdt, Vof *vof,
>> +                                  const char *service,
>> +                                  uint32_t *args, unsigned nargs,
>> +                                  uint32_t *rets, unsigned nrets)
>> +{
>> +    uint32_t ret = 0;
>> +
>> +    /* @nrets includes the value which this function returns */
>> +#define cmpserv(s, a, r) \
>> +    cmpservice(service, nargs, nrets, (s), (a), (r))
> 
> Since this macro is intended to be purely local, you should #undef it
> at the end of the function.
> 
>> +
>> +    if (cmpserv("finddevice", 1, 1)) {
>> +        ret = vof_finddevice(fdt, args[0]);
>> +    } else if (cmpserv("getprop", 4, 1)) {
>> +        ret = vof_getprop(fdt, args[0], args[1], args[2], args[3]);
>> +    } else if (cmpserv("getproplen", 2, 1)) {
>> +        ret = vof_getproplen(fdt, args[0], args[1]);
>> +    } else if (cmpserv("setprop", 4, 1)) {
>> +        ret = vof_setprop(ms, fdt, vof, args[0], args[1], args[2], args[3]);
>> +    } else if (cmpserv("nextprop", 3, 1)) {
>> +        ret = vof_nextprop(fdt, args[0], args[1], args[2]);
>> +    } else if (cmpserv("peer", 1, 1)) {
>> +        ret = vof_peer(fdt, args[0]);
>> +    } else if (cmpserv("child", 1, 1)) {
>> +        ret = vof_child(fdt, args[0]);
>> +    } else if (cmpserv("parent", 1, 1)) {
>> +        ret = vof_parent(fdt, args[0]);
>> +    } else if (cmpserv("open", 1, 1)) {
>> +        ret = vof_open(fdt, vof, args[0]);
>> +    } else if (cmpserv("close", 1, 0)) {
>> +        vof_close(vof, args[0]);
>> +    } else if (cmpserv("instance-to-package", 1, 1)) {
>> +        ret = vof_instance_to_package(vof, args[0]);
>> +    } else if (cmpserv("package-to-path", 3, 1)) {
>> +        ret = vof_package_to_path(fdt, args[0], args[1], args[2]);
>> +    } else if (cmpserv("instance-to-path", 3, 1)) {
>> +        ret = vof_instance_to_path(fdt, vof, args[0], args[1], args[2]);
>> +    } else if (cmpserv("write", 3, 1)) {
>> +        ret = vof_write(vof, args[0], args[1], args[2]);
>> +    } else if (cmpserv("claim", 3, 1)) {
>> +        ret = vof_claim(vof, args[0], args[1], args[2]);
>> +        if (ret != -1) {
>> +            vof_dt_memory_available(fdt, vof->claimed, vof->claimed_base);
>> +        }
>> +    } else if (cmpserv("release", 2, 0)) {
>> +        ret = vof_release(vof, args[0], args[1]);
>> +        if (ret != -1) {
>> +            vof_dt_memory_available(fdt, vof->claimed, vof->claimed_base);
>> +        }
>> +    } else if (cmpserv("call-method", 0, 0)) {
>> +        ret = vof_call_method(ms, vof, args[0], args[1], args[2], args[3],
>> +                              args[4], args[5], rets);
>> +    } else if (cmpserv("interpret", 0, 0)) {
>> +        ret = vof_call_interpret(args[0], args[1], args[2], rets);
>> +    } else if (cmpserv("milliseconds", 0, 1)) {
>> +        ret = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
>> +    } else if (cmpserv("quiesce", 0, 0)) {
>> +        vof_quiesce(ms, fdt, vof);
>> +    } else if (cmpserv("exit", 0, 0)) {
>> +        error_report("Stopped as the VM requested \"exit\"");
>> +        vm_stop(RUN_STATE_PAUSED);
>> +    } else {
>> +        trace_vof_error_unknown_service(service, nargs, nrets);
>> +        ret = -1;
>> +    }
>> +
>> +    return ret;
>> +}
> 
> 
> [snip]
>> +void *memmove(void *dest, const void *src, size_t n)
>> +{
>> +    char *cdest;
>> +    const char *csrc;
>> +    int i;
>> +
>> +    /* Do the buffers overlap in a bad way? */
>> +    if (src < dest && src + n >= dest) {
>> +        /* Copy from end to start */
>> +        cdest = dest + n - 1;
>> +        csrc = src + n - 1;
>> +        for (i = 0; i < n; i++) {
>> +            *cdest-- = *csrc--;
>> +        }
>> +    } else {
>> +        /* Normal copy is possible */
>> +        cdest = dest;
>> +        csrc = src;
>> +        for (i = 0; i < n; i++) {
>> +            *cdest++ = *csrc++;
>> +        }
>> +    }
>> +
>> +    return dest;
>> +}
> 
> I don't see any callers of your memmove().
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 7d9cd2904264..6fb202f99e90 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1356,6 +1356,18 @@ F: hw/pci-host/mv64361.c
>>   F: hw/pci-host/mv643xx.h
>>   F: include/hw/pci-host/mv64361.h
>>   
>> +Virtual Open Firmware (VOF)
>> +M: Alexey Kardashevskiy <aik@ozlabs.ru>
>> +M: David Gibson <david@gibson.dropbear.id.au>
>> +M: Greg Kurz <groug@kaod.org>
> 
> I think "R" might be more appropriate for me and Greg, rather than "M".

Sure. Thanks for the review, I'll try to post the folloup before Monday.



-- 
Alexey

