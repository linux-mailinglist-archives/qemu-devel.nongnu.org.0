Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C7E2D0B2C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 08:37:32 +0100 (CET)
Received: from localhost ([::1]:59700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmB5P-0003H0-Qy
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 02:37:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1kmB1n-0001cG-C6
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 02:33:50 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:42398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1kmB1i-0004wl-2Z
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 02:33:47 -0500
Received: by mail-pg1-x543.google.com with SMTP id w16so8164709pga.9
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 23:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GOEhdtd2N/IJTOfbv/LVfeS6HzgoCYVdaea9xrdgc6k=;
 b=M3GmLyWox4WwKj4j0cFXunaLv7hdpW9p3DFsR/54JYLl2eoE1LLOKBfhhuBp9QCSZE
 p/RrflCwbxe2Uy0AO24wNEJD5lOlxGLCe/ZVWvEOdiD620QAXRhVy8K7iqzHb4G97j11
 BiKEdv26BwhsWldsSLSEC4mhui6Fzdka7b8s7KJBH2GG5JW+zHA9XXM2WnIvkDMk6pww
 F46w6xirst2b+d0ncsfUK1ZWJKpFGODjk8kxbrv9XJiT/cFXGg1FCdpjZtiw622/OfdU
 Asb5z1k8dLb2XL8owbzPRiBw2FrTIMWSGWBB1yuahojZFBSZ/Ke2Xp+I+Qj5VNEM4Hw2
 35CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GOEhdtd2N/IJTOfbv/LVfeS6HzgoCYVdaea9xrdgc6k=;
 b=ova0bCOQYPj93pgJf8ppfUlyLZ6900Sp15zmbS8K99hsDeuwZMeo3olzRAswvhvAmC
 TzoToJsLpT+Vs/d91zfmRsJYL1zgHfrKZt21C4TAtDbpp2/SZya64dNPX21dTIhFmwD8
 Gm0Jb1U2vir/Kf1IEDa6Evu3fYtBv7H6X+4D0Fk+Zk/MRj9RXJ4Vbdozm06CtaQYheeN
 1/PeSGUiu0/F0cro9BqxOhw0Ix3K1YeCPSommincZxx1HAC7YnXumANrUfSLbHJks+dg
 2oDUTHqWXBfBHjfr7wWQxzqUQGyEr6wKXg0P/5RGVRb1cWZxs5jv/M4krNaIvTkGZUWF
 oJ3Q==
X-Gm-Message-State: AOAM531rn5nbywABACJqKQwECOs94ltJSbpKYk33tpiJcGvKjbiNo+mi
 SiPy+ZXvPR57l/eatPV9ijqByTYYo+UY3g==
X-Google-Smtp-Source: ABdhPJzjSOP9ZguvyVC27emRtEeM1dZOJk/4aeNc5j95pQFRW7GRwAT5W2gse2rQKYceRRZ0ckIBLg==
X-Received: by 2002:aa7:9d81:0:b029:19d:ca64:3c62 with SMTP id
 f1-20020aa79d810000b029019dca643c62mr11653135pfq.16.1607326420099; 
 Sun, 06 Dec 2020 23:33:40 -0800 (PST)
Received: from [192.168.10.23] (124-171-134-245.dyn.iinet.net.au.
 [124.171.134.245])
 by smtp.gmail.com with UTF8SMTPSA id z27sm11405502pfq.70.2020.12.06.23.33.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Dec 2020 23:33:39 -0800 (PST)
Subject: Re: [PATCH qemu v10] spapr: Implement Open Firmware client interface
To: Greg Kurz <groug@kaod.org>
References: <20201013021911.28701-1-aik@ozlabs.ru>
 <20201204193205.45d2a15a@bahia.lan>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <c5cf97dd-d1aa-389a-2bff-5781a6af803e@ozlabs.ru>
Date: Mon, 7 Dec 2020 18:33:34 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:84.0) Gecko/20100101
 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <20201204193205.45d2a15a@bahia.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=aik@ozlabs.ru; helo=mail-pg1-x543.google.com
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 05/12/2020 05:32, Greg Kurz wrote:
> On Tue, 13 Oct 2020 13:19:11 +1100
> Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
> 
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
>> 0..4000 - the initial firmware
>> 10000..180000 - stack
>>
>> This OF CI does not implement "interpret".
>>
>> With this basic support, this can only boot into kernel directly.
> 
> Maybe worth erroring out if -kernel is missing then.


In my working tree, this new small firmware can open a disk, find/load 
grub and jump to it, all using OF and without drivers/kernel. It got 
nak'd straight away though so you may be right :)



> 
> eg.
> 
> void spapr_of_client_machine_init(SpaprMachineState *spapr)
> {
>      if (!spapr->kernel_size) {
>          error_report("The 'x-vof' machine property requires '-kernel'");
>          exit(EXIT_FAILURE);
>      }
>      spapr_register_hypercall(KVMPPC_H_OF_CLIENT, spapr_h_of_client);
> }
> 
>> However this is just enough for the petitboot kernel and initradmdisk to
>> boot from any possible source. Note this requires reasonably recent guest
>> kernel with:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=df5be5be8735
>>
> 
> FWIW it worked flawlessly with the vmlinuz and initramfs of a recent
> rhel8 guest.
> 
> The patch is huge and I never find time to do a full review...  so instead
> of postponing again and again, I post what I have noted so far.

This is a bare minimum really...


> 
> Please find some comments below.
> 
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
> 
> [...]
> 
>> @@ -1646,22 +1650,36 @@ static void spapr_machine_reset(MachineState *machine)
>>   
>>       fdt = spapr_build_fdt(spapr, true, FDT_MAX_SIZE);
>>   
>> -    rc = fdt_pack(fdt);
>> -
>> -    /* Should only fail if we've built a corrupted tree */
>> -    assert(rc == 0);
>> -
>> -    /* Load the fdt */
>>       qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
>> -    cpu_physical_memory_write(fdt_addr, fdt, fdt_totalsize(fdt));
>> +
>>       g_free(spapr->fdt_blob);
>>       spapr->fdt_size = fdt_totalsize(fdt);
>>       spapr->fdt_initial_size = spapr->fdt_size;
>>       spapr->fdt_blob = fdt;
> 
> It is a bit confusing that these are set here and...
> 
>>   
>>       /* Set up the entry state */
>> -    spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT, 0, fdt_addr, 0);
>>       first_ppc_cpu->env.gpr[5] = 0;
>> +    if (spapr->vof) {
>> +        target_ulong stack_ptr = 0;
>> +
>> +        spapr_setup_of_client(spapr, &stack_ptr);
>> +        spapr_of_client_dt_finalize(spapr);
>> +        spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
>> +                                  stack_ptr, spapr->initrd_base,
>> +                                  spapr->initrd_size);
>> +    } else {
>> +        /* Load the fdt */
>> +        rc = fdt_pack(spapr->fdt_blob);
>> +        /* Should only fail if we've built a corrupted tree */
>> +        assert(rc == 0);
>> +
>> +        spapr->fdt_size = fdt_totalsize(spapr->fdt_blob);
>> +        spapr->fdt_initial_size = spapr->fdt_size;
> 
> ... overwritten there. I guess this is because fdt_pack() has an
> impact on fdt_totalsize(), right ? Could this be consolidated
> in an helper that optionally calls fdt_pack() ?
> 
>> +        cpu_physical_memory_write(fdt_addr, spapr->fdt_blob, spapr->fdt_size);
>> +
>> +        spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
>> +                                  0, fdt_addr, 0);
>> +    }

I can set spapr->fdt_initial_size here, once, and simplify other bits 
above as well.


>>   
>>       spapr->fwnmi_system_reset_addr = -1;
>>       spapr->fwnmi_machine_check_addr = -1;
> 
> [...]
> 
>> @@ -3296,6 +3332,11 @@ static void spapr_instance_init(Object *obj)
>>                                       stringify(KERNEL_LOAD_ADDR)
>>                                       " for -kernel is the default");
>>       spapr->kernel_addr = KERNEL_LOAD_ADDR;
>> +    object_property_add_bool(obj, "x-vof", spapr_get_vof, spapr_set_vof);
>> +    object_property_set_description(obj, "x-vof",
>> +                                    "Enable Virtual Open Firmware");
>> +    spapr->vof = false;
> 
> We usually don't initialize to false or 0 since QOM already
> does memset(0) on the instance.


True, this is a leftover, will fix.

> 
>> +
>>       /* The machine class defines the default interrupt controller mode */
>>       spapr->irq = smc->irq;
>>       object_property_add_str(obj, "ic-mode", spapr_get_ic_mode,
> 
> [...]
> 
>> diff --git a/hw/ppc/spapr_of_client.c b/hw/ppc/spapr_of_client.c
>> new file mode 100644
>> index 000000000000..04b1543696b0
>> --- /dev/null
>> +++ b/hw/ppc/spapr_of_client.c
>> @@ -0,0 +1,1011 @@
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
>> +/*
>> + * OF 1275 "nextprop" description suggests is it 32 bytes max but
>> + * LoPAPR defines "ibm,query-interrupt-source-number" which is 33 chars long.
>> + */
>> +#define OF_PROPNAME_LEN_MAX 64
>> +
>> +/* Copied from SLOF, and 4K is definitely not enough for GRUB */
>> +#define OF_STACK_SIZE       0x8000
>> +
>> +/* 0..10000 is reserved for the VOF fw */
>> +#define OF_STACK_ADDR       0x10000
>> +
>> +#define ALIGN(x, a) (((x) + (a) - 1) & ~((a) - 1))
>> +
>> +typedef struct {
>> +    uint64_t start;
>> +    uint64_t size;
>> +} SpaprOfClaimed;
>> +
>> +typedef struct {
>> +    char *params;
>> +    char *path; /* the path used to open the instance */
>> +    uint32_t phandle;
>> +} SpaprOfInstance;
>> +
>> +/* Defined as Big Endian */
>> +struct prom_args {
>> +    uint32_t service;
>> +    uint32_t nargs;
>> +    uint32_t nret;
>> +    uint32_t args[10];
>> +} QEMU_PACKED;
>> +
> 
> The QEMU_PACKED breaks build with gcc-10.2.1-6.fc32.x86_64:
> 
> ../../hw/ppc/spapr_of_client.c: In function ‘spapr_h_of_client’:
> ../../hw/ppc/spapr_of_client.c:793:35: error: taking address of packed member of ‘struct prom_args’ may result in an unaligned pointer value [-Werror=address-of-packed-member]
>    793 |                                   &pargs.args[nargs + 1]);
>        |                                   ^~~~~~~~~~~~~~~~~~~~~~
> ../../hw/ppc/spapr_of_client.c:800:38: error: taking address of packed member of ‘struct prom_args’ may result in an unaligned pointer value [-Werror=address-of-packed-member]
>    800 |                                      &pargs.args[nargs + 1]);
>        |                                      ^~~~~~~~~~~~~~~~~~~~~~
> 
> Fixable by dropping QEMU_PACKED and adding:
> 
> QEMU_BUILD_BUG_ON(sizeof(struct prom_args) != 13 * 4);


or (pargs.args + nargs + 1) and keep QEMU_PACKED.


> 
>> +static void readstr(hwaddr pa, char *buf, int size)
>> +{
>> +    cpu_physical_memory_read(pa, buf, size);
>> +    if (buf[size - 1] != '\0') {
>> +        buf[size - 1] = '\0';
>> +        if (strlen(buf) == size - 1) {
>> +            trace_spapr_of_client_error_str_truncated(buf, size);
>> +        }
>> +    }
>> +}
>> +
>> +static bool cmpservice(const char *s, size_t len,
>> +                       unsigned nargs, unsigned nret,
>> +                       const char *s1, size_t len1,
>> +                       unsigned nargscheck, unsigned nretcheck)
>> +{
>> +    if (strcmp(s, s1)) {
>> +        return false;
>> +    }
>> +    if ((nargscheck && (nargs != nargscheck)) ||
>> +        (nretcheck && (nret != nretcheck))) {
> 
> Parenthesitis : != has precedence over &&.


I love my braces :)

> 
>> +        trace_spapr_of_client_error_param(s, nargscheck, nretcheck, nargs,
>> +                                          nret);
>> +        return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>> +static void split_path(const char *fullpath, char **node, char **unit,
>> +                       char **part)
>> +{
>> +    const char *c, *p = NULL, *u = NULL;
>> +
>> +    *node = *unit = *part = NULL;
>> +
>> +    if (fullpath[0] == '\0') {
>> +        *node = g_strdup(fullpath);
>> +        return;
>> +    }
>> +
>> +    for (c = fullpath + strlen(fullpath) - 1; c > fullpath; --c) {
>> +        if (*c == '/') {
>> +            break;
>> +        }
>> +        if (*c == ':') {
>> +            p = c + 1;
>> +            continue;
>> +        }
>> +        if (*c == '@') {
>> +            u = c + 1;
>> +            continue;
>> +        }
>> +    }
>> +
>> +    if (p && u && p < u) {
>> +        p = NULL;
>> +    }
>> +
>> +    if (u && p) {
>> +        *node = g_strndup(fullpath, u - fullpath - 1);
>> +        *unit = g_strndup(u, p - u - 1);
>> +        *part = g_strdup(p);
>> +    } else if (!u && p) {
>> +        *node = g_strndup(fullpath, p - fullpath - 1);
>> +        *part = g_strdup(p);
>> +    } else if (!p && u) {
>> +        *node = g_strndup(fullpath, u - fullpath - 1);
>> +        *unit = g_strdup(u);
>> +    } else {
>> +        *node = g_strdup(fullpath);
>> +    }
> 
> It looks like this function could be simplified by using g_strsplit_set().


Nah, I want not just split but also know what each part is - a node or a 
unit or a partition.

> 
>> +}
>> +
>> +static void prop_format(char *tval, int tlen, const void *prop, int len)
>> +{
>> +    int i;
>> +    const char *c;
>> +    char *t;
>> +    const char bin[] = "...";
>> +
>> +    for (i = 0, c = prop; i < len; ++i, ++c) {
>> +        if (*c == '\0' && i == len - 1) {
>> +            strncpy(tval, prop, tlen - 1);
>> +            return;
>> +        }
>> +        if (*c < 0x20 || *c >= 0x80) {
> 
> This breaks build with gcc-10.2.1-6.fc32.x86_64:
> 
> ../../hw/ppc/spapr_of_client.c: In function ‘prop_format’:
> ../../hw/ppc/spapr_of_client.c:131:29: error: comparison is always false due to limited range of data type [-Werror=type-limits]
>    131 |         if (*c < 0x20 || *c >= 0x80) {
>        |                             ^~
> 
> Fixable by making 'c' a 'const unsigned char'.


Done.


> 
>> +            break;
>> +        }
>> +    }
>> +
>> +    for (i = 0, c = prop, t = tval; i < len; ++i, ++c) {
>> +        if (t >= tval + tlen - sizeof(bin) - 1 - 2 - 1) {
>> +            strcpy(t, bin);
>> +            return;
>> +        }
>> +        if (i && i % 4 == 0 && i != len - 1) {
>> +            strcat(t, " ");
>> +            ++t;
>> +        }
>> +        t += sprintf(t, "%02X", *c & 0xFF);
>> +    }
>> +}
>> +
>> +static int of_client_fdt_path_offset(const void *fdt, const char *node,
>> +                                     const char *unit)
>> +{
>> +    int offset;
>> +
>> +    offset = fdt_path_offset(fdt, node);
>> +
>> +    if (offset < 0 && unit) {
>> +        char *tmp = g_strdup_printf("%s@%s", node, unit);
>> +
>> +        offset = fdt_path_offset(fdt, tmp);
>> +        g_free(tmp);
> 
> CODING_STYLE advocates the use of g_autofree instead of manually
> calling g_free().

Oh. Ok.


>> +    }
>> +
>> +    return offset;
>> +}
>> +
>> +static uint32_t of_client_finddevice(const void *fdt, uint32_t nodeaddr)
>> +{
>> +    char *node, *unit, *part;
> 
> If you do this:
> 
>      g_autofree *node = NULL, *unit = NULL, *part = NULL;


Did you mean
        g_autofree char *node = NULL, *unit = NULL, *part = NULL;
?

> 
>> +    char fullnode[1024];
>> +    uint32_t ret = -1;
>> +    int offset;
>> +
>> +    readstr(nodeaddr, fullnode, sizeof(fullnode));
>> +
>> +    split_path(fullnode, &node, &unit, &part);
>> +    offset = of_client_fdt_path_offset(fdt, node, unit);
>> +    if (offset >= 0) {
>> +        ret = fdt_get_phandle(fdt, offset);
>> +    }
>> +    trace_spapr_of_client_finddevice(fullnode, ret);
>> +    g_free(node);
>> +    g_free(unit);
>> +    g_free(part);
> 
> You can drop these ^^

Ok.

> You should be able to work out something similar with g_auto(GStrv) if
> you decide to use g_strsplit_set().
> 
>> +    return (uint32_t) ret;
>> +}
>> +
> 
> [...]
> 
>> +static uint32_t of_client_setprop(SpaprMachineState *spapr,
>> +                                  uint32_t nodeph, uint32_t pname,
>> +                                  uint32_t valaddr, uint32_t vallen)
>> +{
>> +    char propname[OF_PROPNAME_LEN_MAX + 1];
>> +    uint32_t ret = -1;
>> +    int offset;
>> +    char trval[64] = "";
>> +
>> +    readstr(pname, propname, sizeof(propname));
>> +    /*
>> +     * We only allow changing properties which we know how to update on
>> +     * the QEMU side.
>> +     */
>> +    if (vallen == sizeof(uint32_t)) {
>> +        uint32_t val32 = ldl_be_phys(first_cpu->as, valaddr);
>> +
>> +        if ((strcmp(propname, "linux,rtas-base") == 0) ||
>> +            (strcmp(propname, "linux,rtas-entry") == 0)) {
> 
> What about :
> 
>          if (!strcmp(propname, "linux,rtas-base") ||
>              !strcmp(propname, "linux,rtas-entry")) {



[fstn1-p1 qemu-killslof]$ git grep 'strcmp.*==.*0' | wc -l
426
[fstn1-p1 qemu-killslof]$ git grep '!strcmp' | wc -l
447

My team is losing but not by much :) I prefer "==" (literally - "equal) 
to  "!" with "cmp" which is "does not compare" (makes little sense).


> 
>> +            spapr->rtas_base = val32;
>> +        } else if (strcmp(propname, "linux,initrd-start") == 0) {
>> +            spapr->initrd_base = val32;
>> +        } else if (strcmp(propname, "linux,initrd-end") == 0) {
>> +            spapr->initrd_size = val32 - spapr->initrd_base;
>> +        } else {
>> +            goto trace_exit;
>> +        }
> 
> [...]
> 
>> +static uint32_t spapr_of_client_open(SpaprMachineState *spapr, const char *path)
>> +{
>> +    int offset;
>> +    uint32_t ret = 0;
>> +    SpaprOfInstance *inst = NULL;
>> +    char *node, *unit, *part;
>> +
>> +    if (spapr->of_instance_last == 0xFFFFFFFF) {
>> +        /* We do not recycle ihandles yet */
>> +        goto trace_exit;
> 
> And g_free() is passed uninitialized pointers.
> 
> A typical use case for the g_auto magic.

g_autofree, you mean?


> 
>> +    }
>> +
>> +    split_path(path, &node, &unit, &part);
>> +
>> +    offset = of_client_fdt_path_offset(spapr->fdt_blob, node, unit);
>> +    if (offset < 0) {
>> +        trace_spapr_of_client_error_unknown_path(path);
>> +        goto trace_exit;
>> +    }
>> +
>> +    inst = g_new0(SpaprOfInstance, 1);
>> +    inst->phandle = fdt_get_phandle(spapr->fdt_blob, offset);
>> +    g_assert(inst->phandle);
>> +    ++spapr->of_instance_last;
>> +
>> +    inst->path = g_strdup(path);
>> +    inst->params = part;
>> +    g_hash_table_insert(spapr->of_instances,
>> +                        GINT_TO_POINTER(spapr->of_instance_last),
>> +                        inst);
>> +    ret = spapr->of_instance_last;
>> +
>> +trace_exit:
>> +    trace_spapr_of_client_open(path, inst ? inst->phandle : 0, ret);
>> +    g_free(node);
>> +    g_free(unit);
> 
> If you don't switch to g_auto, it seems you should at least add:
> 
>      g_free(part);
> 
>> +
>> +    return ret;
>> +}
>> +
>> +static uint32_t of_client_open(SpaprMachineState *spapr, uint32_t pathaddr)
>> +{
>> +    char path[256];
>> +
>> +    readstr(pathaddr, path, sizeof(path));
>> +
>> +    return spapr_of_client_open(spapr, path);
>> +}
>> +
>> +static void of_client_close(SpaprMachineState *spapr, uint32_t ihandle)
>> +{
>> +    if (!g_hash_table_remove(spapr->of_instances, GINT_TO_POINTER(ihandle))) {
>> +        trace_spapr_of_client_error_unknown_ihandle_close(ihandle);
>> +    }
>> +}
>> +
>> +static uint32_t of_client_instance_to_package(SpaprMachineState *spapr,
>> +                                              uint32_t ihandle)
>> +{
>> +    gpointer instp = g_hash_table_lookup(spapr->of_instances,
>> +                                         GINT_TO_POINTER(ihandle));
>> +    uint32_t ret = -1;
>> +
>> +    if (instp) {
>> +        ret = ((SpaprOfInstance *)instp)->phandle;
>> +    }
>> +    trace_spapr_of_client_instance_to_package(ihandle, ret);
>> +
>> +    return ret;
>> +}
>> +
>> +static uint32_t of_client_package_to_path(const void *fdt, uint32_t phandle,
>> +                                          uint32_t buf, uint32_t len)
>> +{
>> +    uint32_t ret = -1;
>> +    char tmp[256] = "";
>> +
>> +    if (0 == fdt_get_path(fdt, fdt_node_offset_by_phandle(fdt, phandle), tmp,
>> +                          sizeof(tmp))) {
> 
> Quite an usual way to check for nullity. Any reason not to
> just s/0 == /!/ and save some indentation ?


Ok.

> 
>> +        tmp[sizeof(tmp) - 1] = 0;
>> +        ret = MIN(len, strlen(tmp) + 1);
>> +        cpu_physical_memory_write(buf, tmp, ret);
>> +    }
>> +
>> +    trace_spapr_of_client_package_to_path(phandle, tmp, ret);
>> +
>> +    return ret;
>> +}
>> +
>> +static uint32_t of_client_instance_to_path(SpaprMachineState *spapr,
>> +                                           uint32_t ihandle, uint32_t buf,
>> +                                           uint32_t len)
>> +{
>> +    uint32_t ret = -1;
>> +    uint32_t phandle = of_client_instance_to_package(spapr, ihandle);
>> +    char tmp[256] = "";
>> +
>> +    if (phandle != -1) {
>> +        if (0 == fdt_get_path(spapr->fdt_blob,
> 
> ditto

ok!


> 
>> +                              fdt_node_offset_by_phandle(spapr->fdt_blob,
>> +                                                         phandle),
>> +                              tmp, sizeof(tmp))) {
>> +            tmp[sizeof(tmp) - 1] = 0;
>> +            ret = MIN(len, strlen(tmp) + 1);
>> +            cpu_physical_memory_write(buf, tmp, ret);
>> +        }
>> +    }
>> +    trace_spapr_of_client_instance_to_path(ihandle, phandle, tmp, ret);
>> +
>> +    return ret;
>> +}
>> +
> 
> [...]
> 
>> +static uint32_t of_client_call_method(SpaprMachineState *spapr,
>> +                                      uint32_t methodaddr, uint32_t ihandle,
>> +                                      uint32_t param1, uint32_t param2,
>> +                                      uint32_t param3, uint32_t param4,
>> +                                      uint32_t *ret2)
>> +{
>> +    uint32_t ret = -1;
>> +    char method[256] = "";
>> +    SpaprOfInstance *inst = NULL;
> 
> It doesn't seem that inst needs to be initialized.

True.

> 
>> +
>> +    if (!ihandle) {
>> +        goto trace_exit;
>> +    }
>> +
>> +    inst = (SpaprOfInstance *) g_hash_table_lookup(spapr->of_instances,
>> +                                                   GINT_TO_POINTER(ihandle));
>> +    if (!inst) {
>> +        goto trace_exit;
>> +    }
>> +
>> +    readstr(methodaddr, method, sizeof(method));
>> +
>> +    if (strcmp(inst->path, "/") == 0) {
>> +        if (strcmp(method, "ibm,client-architecture-support") == 0) {
>> +            ret = do_client_architecture_support(POWERPC_CPU(first_cpu), spapr,
>> +                                                 param1, FDT_MAX_SIZE);
>> +            *ret2 = 0;
>> +        }
>> +    } else if (strcmp(inst->path, "/rtas") == 0) {
>> +        if (strcmp(method, "instantiate-rtas") == 0) {
>> +            of_client_instantiate_rtas(spapr, param1);
>> +            ret = 0;
>> +            *ret2 = param1; /* rtasbase */
> 
> rtas-base ?

Yup.


> 
>> +        }
>> +    } else {
>> +        trace_spapr_of_client_error_unknown_method(method);
>> +    }
>> +
>> +trace_exit:
>> +    trace_spapr_of_client_method(ihandle, method, param1, ret, *ret2);
>> +
>> +    return ret;
>> +}
>> +
>> +static uint32_t of_client_call_interpret(SpaprMachineState *spapr,
>> +                                         uint32_t cmdaddr, uint32_t param1,
>> +                                         uint32_t param2, uint32_t *ret2)
>> +{
>> +    uint32_t ret = -1;
>> +    char cmd[256] = "";
>> +
>> +    readstr(cmdaddr, cmd, sizeof(cmd));
>> +    trace_spapr_of_client_interpret(cmd, param1, param2, ret, *ret2);
>> +
>> +    return ret;
>> +}
>> +
>> +static void of_client_quiesce(SpaprMachineState *spapr)
>> +{
>> +    int rc = fdt_pack(spapr->fdt_blob);
>> +
>> +    assert(rc == 0);
>> +
>> +    spapr->fdt_size = fdt_totalsize(spapr->fdt_blob);
>> +    spapr->fdt_initial_size = spapr->fdt_size;
> 
> Same code pattern  as in spapr_machine_reset(). A helper ?


No, not for 2 lines of code. And I changed the similar chunk above so it 
is not that similar anymore.


> 
>> +    of_client_clamed_dump(spapr->claimed);
>> +}
>> +
>> +static target_ulong spapr_h_of_client(PowerPCCPU *cpu, SpaprMachineState *spapr,
>> +                                      target_ulong opcode, target_ulong *args)
>> +{
>> +    target_ulong of_client_args = ppc64_phys_to_real(args[0]);
>> +    struct prom_args pargs = { 0 };
>> +    char service[64];
>> +    unsigned nargs, nret;
>> +    int i, servicelen;
>> +
>> +    cpu_physical_memory_read(of_client_args, &pargs, sizeof(pargs));
>> +    nargs = be32_to_cpu(pargs.nargs);
>> +    nret = be32_to_cpu(pargs.nret);
>> +    readstr(be32_to_cpu(pargs.service), service, sizeof(service));
>> +    servicelen = strlen(service);
>> +
>> +    if (nargs >= ARRAY_SIZE(pargs.args)) {
>> +        return H_PARAMETER;
>> +    }
>> +
>> +#define cmpserv(s, a, r) \
>> +    cmpservice(service, servicelen, nargs, nret, (s), sizeof(s), (a), (r))
>> +
>> +    if (cmpserv("finddevice", 1, 1)) {
>> +        pargs.args[nargs] =
>> +            of_client_finddevice(spapr->fdt_blob,
>> +                                 be32_to_cpu(pargs.args[0]));
>> +    } else if (cmpserv("getprop", 4, 1)) {
>> +        pargs.args[nargs] =
>> +            of_client_getprop(spapr->fdt_blob,
>> +                              be32_to_cpu(pargs.args[0]),
>> +                              be32_to_cpu(pargs.args[1]),
>> +                              be32_to_cpu(pargs.args[2]),
>> +                              be32_to_cpu(pargs.args[3]));
>> +    } else if (cmpserv("getproplen", 2, 1)) {
>> +        pargs.args[nargs] =
>> +            of_client_getproplen(spapr->fdt_blob,
>> +                                 be32_to_cpu(pargs.args[0]),
>> +                                 be32_to_cpu(pargs.args[1]));
>> +    } else if (cmpserv("setprop", 4, 1)) {
>> +        pargs.args[nargs] =
>> +            of_client_setprop(spapr,
>> +                              be32_to_cpu(pargs.args[0]),
>> +                              be32_to_cpu(pargs.args[1]),
>> +                              be32_to_cpu(pargs.args[2]),
>> +                              be32_to_cpu(pargs.args[3]));
>> +    } else if (cmpserv("nextprop", 3, 1)) {
>> +        pargs.args[nargs] =
>> +            of_client_nextprop(spapr->fdt_blob,
>> +                               be32_to_cpu(pargs.args[0]),
>> +                               be32_to_cpu(pargs.args[1]),
>> +                               be32_to_cpu(pargs.args[2]));
>> +    } else if (cmpserv("peer", 1, 1)) {
>> +        pargs.args[nargs] =
>> +            of_client_peer(spapr->fdt_blob,
>> +                           be32_to_cpu(pargs.args[0]));
>> +    } else if (cmpserv("child", 1, 1)) {
>> +        pargs.args[nargs] =
>> +            of_client_child(spapr->fdt_blob,
>> +                            be32_to_cpu(pargs.args[0]));
>> +    } else if (cmpserv("parent", 1, 1)) {
>> +        pargs.args[nargs] =
>> +            of_client_parent(spapr->fdt_blob,
>> +                             be32_to_cpu(pargs.args[0]));
>> +    } else if (cmpserv("open", 1, 1)) {
>> +        pargs.args[nargs] = of_client_open(spapr, be32_to_cpu(pargs.args[0]));
>> +    } else if (cmpserv("close", 1, 0)) {
>> +        of_client_close(spapr, be32_to_cpu(pargs.args[0]));
>> +    } else if (cmpserv("instance-to-package", 1, 1)) {
>> +        pargs.args[nargs] =
>> +            of_client_instance_to_package(spapr,
>> +                                          be32_to_cpu(pargs.args[0]));
>> +    } else if (cmpserv("package-to-path", 3, 1)) {
>> +        pargs.args[nargs] =
>> +            of_client_package_to_path(spapr->fdt_blob,
>> +                                      be32_to_cpu(pargs.args[0]),
>> +                                      be32_to_cpu(pargs.args[1]),
>> +                                      be32_to_cpu(pargs.args[2]));
>> +    } else if (cmpserv("instance-to-path", 3, 1)) {
>> +        pargs.args[nargs] =
>> +            of_client_instance_to_path(spapr,
>> +                                       be32_to_cpu(pargs.args[0]),
>> +                                       be32_to_cpu(pargs.args[1]),
>> +                                       be32_to_cpu(pargs.args[2]));
>> +    } else if (cmpserv("claim", 3, 1)) {
>> +        pargs.args[nargs] =
>> +            of_client_claim(spapr,
>> +                            be32_to_cpu(pargs.args[0]),
>> +                            be32_to_cpu(pargs.args[1]),
>> +                            be32_to_cpu(pargs.args[2]));
>> +    } else if (cmpserv("release", 2, 0)) {
>> +        pargs.args[nargs] =
>> +            of_client_release(spapr,
>> +                              be32_to_cpu(pargs.args[0]),
>> +                              be32_to_cpu(pargs.args[1]));
>> +    } else if (cmpserv("call-method", 0, 0)) {
>> +        pargs.args[nargs] =
>> +            of_client_call_method(spapr,
>> +                                  be32_to_cpu(pargs.args[0]),
>> +                                  be32_to_cpu(pargs.args[1]),
>> +                                  be32_to_cpu(pargs.args[2]),
>> +                                  be32_to_cpu(pargs.args[3]),
>> +                                  be32_to_cpu(pargs.args[4]),
>> +                                  be32_to_cpu(pargs.args[5]),
>> +                                  &pargs.args[nargs + 1]);
>> +    } else if (cmpserv("interpret", 0, 0)) {
>> +        pargs.args[nargs] =
>> +            of_client_call_interpret(spapr,
>> +                                     be32_to_cpu(pargs.args[0]),
>> +                                     be32_to_cpu(pargs.args[1]),
>> +                                     be32_to_cpu(pargs.args[2]),
>> +                                     &pargs.args[nargs + 1]);
>> +    } else if (cmpserv("milliseconds", 0, 1)) {
>> +        pargs.args[nargs] = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
>> +    } else if (cmpserv("quiesce", 0, 0)) {
>> +        of_client_quiesce(spapr);
>> +    } else if (cmpserv("exit", 0, 0)) {
>> +        error_report("Stopped as the VM requested \"exit\"");
>> +        vm_stop(RUN_STATE_PAUSED); /* Or qemu_system_guest_panicked(NULL); ? */
> 
> qemu_system_guest_panicked(NULL) seems more appropriate IMHO.

Why exactly? The guest did not crash, that tiny firmware or grub just 
came to a logical end of execution when it could not find a next boot 
target.

> 
>> +    } else {
>> +        trace_spapr_of_client_error_unknown_service(service, nargs, nret);
>> +        pargs.args[nargs] = -1;
>> +    }
>> +
>> +    for (i = 0; i < nret; ++i) {
>> +        pargs.args[nargs + i] = be32_to_cpu(pargs.args[nargs + i]);
>> +    }
>> +
>> +    cpu_physical_memory_write(of_client_args, &pargs,
>> +                              sizeof(uint32_t) * (3 + nargs + nret));
>> +
>> +    return H_SUCCESS;
>> +}
>> +
> 
> That's all for now.

Thanks! I'll repost in a sec. But I still wonder on what terms this is 
going to be allowed in the QEMU tree at all.




-- 
Alexey

