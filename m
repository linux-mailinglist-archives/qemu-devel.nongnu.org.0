Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C96471417
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 10:39:47 +0200 (CEST)
Received: from localhost ([::1]:40116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpqKn-00085k-TX
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 04:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33365)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <liam.merwick@oracle.com>) id 1hpqKZ-0007Wz-Gp
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 04:39:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liam.merwick@oracle.com>) id 1hpqKX-0003vk-Nw
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 04:39:31 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:57834)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <liam.merwick@oracle.com>)
 id 1hpqKX-0003sL-Dy
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 04:39:29 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6N8cr7L028522;
 Tue, 23 Jul 2019 08:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=IgAEn3cVKYMzN9KCJ1OyBWD7kc0mH6TX6QPB87+/sdk=;
 b=Pc7pOTJf0iZ+Py4akFLtKleKezVCxu6BnbJXM1qwc1FaG/OnfJR07ojuT7SybpwHN0UN
 pyPL0giObEZ4D8RnF3dMwWJZK9tmozaVaii2YrR8doRq/fgcZYVkWAscyhCP2NvhsWgl
 bI19gCccO0VVl1Tabn7LF7iZhjJ5PAtzO/1fSQUU9KCqMyOrprLwg+JEc1o7AJ5p/Mnj
 fXAiFqAijSIkeMr1T/Do2j6AjQUu4NvuxVzv9n8Nk+cEpfYBvITtvFwbWOELAFugIaa5
 5NVno+dfFfqCkBipJMyHZihYe0/+D6oyFiloF8YLUOWZEVi5l5PCQHfD+s1ZTfMFJ8GZ Mg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2tutwpdfxa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Jul 2019 08:39:24 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6N8bR6d142449;
 Tue, 23 Jul 2019 08:39:23 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 2tur2u962g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Jul 2019 08:39:23 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x6N8dMCS003875;
 Tue, 23 Jul 2019 08:39:22 GMT
Received: from dhcp-10-175-168-17.vpn.oracle.com (/10.175.168.17)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 23 Jul 2019 01:39:22 -0700
To: Sergio Lopez <slp@redhat.com>, mst@redhat.com, marcel.apfelbaum@gmail.com, 
 pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com,
 maran.wilson@oracle.com, sgarzare@redhat.com, kraxel@redhat.com
References: <20190702121106.28374-1-slp@redhat.com>
 <20190702121106.28374-4-slp@redhat.com>
From: Liam Merwick <liam.merwick@oracle.com>
Message-ID: <92aae459-a27f-9d3d-313e-ae99f1bbed92@oracle.com>
Date: Tue, 23 Jul 2019 09:39:13 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190702121106.28374-4-slp@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9326
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907230080
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9326
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907230080
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 141.146.126.78
Subject: Re: [Qemu-devel] [PATCH v3 3/4] hw/i386: Factorize PVH related
 functions
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/07/2019 13:11, Sergio Lopez wrote:
> Extract PVH related functions from pc.c, and put them in pvh.c, so
> they can be shared with other components.
> 
> Signed-off-by: Sergio Lopez <slp@redhat.com>


Refactoring LGTM

Reviewed-by: Liam Merwick <liam.merwick@oracle.com>


> ---
>   hw/i386/Makefile.objs |   1 +
>   hw/i386/pc.c          | 120 +++++-------------------------------------
>   hw/i386/pvh.c         | 113 +++++++++++++++++++++++++++++++++++++++
>   hw/i386/pvh.h         |  10 ++++
>   4 files changed, 136 insertions(+), 108 deletions(-)
>   create mode 100644 hw/i386/pvh.c
>   create mode 100644 hw/i386/pvh.h
> 
> diff --git a/hw/i386/Makefile.objs b/hw/i386/Makefile.objs
> index 5d9c9efd5f..c5f20bbd72 100644
> --- a/hw/i386/Makefile.objs
> +++ b/hw/i386/Makefile.objs
> @@ -1,5 +1,6 @@
>   obj-$(CONFIG_KVM) += kvm/
>   obj-y += multiboot.o
> +obj-y += pvh.o
>   obj-y += pc.o
>   obj-$(CONFIG_I440FX) += pc_piix.o
>   obj-$(CONFIG_Q35) += pc_q35.o
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 3983621f1c..325ec2c1c8 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -42,6 +42,7 @@
>   #include "hw/loader.h"
>   #include "elf.h"
>   #include "multiboot.h"
> +#include "pvh.h"
>   #include "hw/timer/mc146818rtc.h"
>   #include "hw/dma/i8257.h"
>   #include "hw/timer/i8254.h"
> @@ -108,9 +109,6 @@ static struct e820_entry *e820_table;
>   static unsigned e820_entries;
>   struct hpet_fw_config hpet_cfg = {.count = UINT8_MAX};
>   
> -/* Physical Address of PVH entry point read from kernel ELF NOTE */
> -static size_t pvh_start_addr;
> -
>   GlobalProperty pc_compat_4_0[] = {};
>   const size_t pc_compat_4_0_len = G_N_ELEMENTS(pc_compat_4_0);
>   
> @@ -1061,109 +1059,6 @@ struct setup_data {
>       uint8_t data[0];
>   } __attribute__((packed));
>   
> -
> -/*
> - * The entry point into the kernel for PVH boot is different from
> - * the native entry point.  The PVH entry is defined by the x86/HVM
> - * direct boot ABI and is available in an ELFNOTE in the kernel binary.
> - *
> - * This function is passed to load_elf() when it is called from
> - * load_elfboot() which then additionally checks for an ELF Note of
> - * type XEN_ELFNOTE_PHYS32_ENTRY and passes it to this function to
> - * parse the PVH entry address from the ELF Note.
> - *
> - * Due to trickery in elf_opts.h, load_elf() is actually available as
> - * load_elf32() or load_elf64() and this routine needs to be able
> - * to deal with being called as 32 or 64 bit.
> - *
> - * The address of the PVH entry point is saved to the 'pvh_start_addr'
> - * global variable.  (although the entry point is 32-bit, the kernel
> - * binary can be either 32-bit or 64-bit).
> - */
> -static uint64_t read_pvh_start_addr(void *arg1, void *arg2, bool is64)
> -{
> -    size_t *elf_note_data_addr;
> -
> -    /* Check if ELF Note header passed in is valid */
> -    if (arg1 == NULL) {
> -        return 0;
> -    }
> -
> -    if (is64) {
> -        struct elf64_note *nhdr64 = (struct elf64_note *)arg1;
> -        uint64_t nhdr_size64 = sizeof(struct elf64_note);
> -        uint64_t phdr_align = *(uint64_t *)arg2;
> -        uint64_t nhdr_namesz = nhdr64->n_namesz;
> -
> -        elf_note_data_addr =
> -            ((void *)nhdr64) + nhdr_size64 +
> -            QEMU_ALIGN_UP(nhdr_namesz, phdr_align);
> -    } else {
> -        struct elf32_note *nhdr32 = (struct elf32_note *)arg1;
> -        uint32_t nhdr_size32 = sizeof(struct elf32_note);
> -        uint32_t phdr_align = *(uint32_t *)arg2;
> -        uint32_t nhdr_namesz = nhdr32->n_namesz;
> -
> -        elf_note_data_addr =
> -            ((void *)nhdr32) + nhdr_size32 +
> -            QEMU_ALIGN_UP(nhdr_namesz, phdr_align);
> -    }
> -
> -    pvh_start_addr = *elf_note_data_addr;
> -
> -    return pvh_start_addr;
> -}
> -
> -static bool load_elfboot(const char *kernel_filename,
> -                   int kernel_file_size,
> -                   uint8_t *header,
> -                   size_t pvh_xen_start_addr,
> -                   FWCfgState *fw_cfg)
> -{
> -    uint32_t flags = 0;
> -    uint32_t mh_load_addr = 0;
> -    uint32_t elf_kernel_size = 0;
> -    uint64_t elf_entry;
> -    uint64_t elf_low, elf_high;
> -    int kernel_size;
> -
> -    if (ldl_p(header) != 0x464c457f) {
> -        return false; /* no elfboot */
> -    }
> -
> -    bool elf_is64 = header[EI_CLASS] == ELFCLASS64;
> -    flags = elf_is64 ?
> -        ((Elf64_Ehdr *)header)->e_flags : ((Elf32_Ehdr *)header)->e_flags;
> -
> -    if (flags & 0x00010004) { /* LOAD_ELF_HEADER_HAS_ADDR */
> -        error_report("elfboot unsupported flags = %x", flags);
> -        exit(1);
> -    }
> -
> -    uint64_t elf_note_type = XEN_ELFNOTE_PHYS32_ENTRY;
> -    kernel_size = load_elf(kernel_filename, read_pvh_start_addr,
> -                           NULL, &elf_note_type, &elf_entry,
> -                           &elf_low, &elf_high, 0, I386_ELF_MACHINE,
> -                           0, 0);
> -
> -    if (kernel_size < 0) {
> -        error_report("Error while loading elf kernel");
> -        exit(1);
> -    }
> -    mh_load_addr = elf_low;
> -    elf_kernel_size = elf_high - elf_low;
> -
> -    if (pvh_start_addr == 0) {
> -        error_report("Error loading uncompressed kernel without PVH ELF Note");
> -        exit(1);
> -    }
> -    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ENTRY, pvh_start_addr);
> -    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, mh_load_addr);
> -    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, elf_kernel_size);
> -
> -    return true;
> -}
> -
>   static void load_linux(PCMachineState *pcms,
>                          FWCfgState *fw_cfg)
>   {
> @@ -1203,6 +1098,9 @@ static void load_linux(PCMachineState *pcms,
>       if (ldl_p(header+0x202) == 0x53726448) {
>           protocol = lduw_p(header+0x206);
>       } else {
> +        size_t pvh_start_addr;
> +        uint32_t mh_load_addr = 0;
> +        uint32_t elf_kernel_size = 0;
>           /*
>            * This could be a multiboot kernel. If it is, let's stop treating it
>            * like a Linux kernel.
> @@ -1220,10 +1118,16 @@ static void load_linux(PCMachineState *pcms,
>            * If load_elfboot() is successful, populate the fw_cfg info.
>            */
>           if (pcmc->pvh_enabled &&
> -            load_elfboot(kernel_filename, kernel_size,
> -                         header, pvh_start_addr, fw_cfg)) {
> +            pvh_load_elfboot(kernel_filename,
> +                             &mh_load_addr, &elf_kernel_size)) {
>               fclose(f);
>   
> +            pvh_start_addr = pvh_get_start_addr();
> +
> +            fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ENTRY, pvh_start_addr);
> +            fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, mh_load_addr);
> +            fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, elf_kernel_size);
> +
>               fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE,
>                   strlen(kernel_cmdline) + 1);
>               fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline);
> diff --git a/hw/i386/pvh.c b/hw/i386/pvh.c
> new file mode 100644
> index 0000000000..61623b4533
> --- /dev/null
> +++ b/hw/i386/pvh.c
> @@ -0,0 +1,113 @@
> +/*
> + * PVH Boot Helper
> + *
> + * Copyright (C) 2019 Oracle
> + * Copyright (C) 2019 Red Hat, Inc
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/units.h"
> +#include "qemu/error-report.h"
> +#include "hw/loader.h"
> +#include "cpu.h"
> +#include "elf.h"
> +#include "pvh.h"
> +
> +static size_t pvh_start_addr = 0;
> +
> +size_t pvh_get_start_addr(void)
> +{
> +    return pvh_start_addr;
> +}
> +
> +/*
> + * The entry point into the kernel for PVH boot is different from
> + * the native entry point.  The PVH entry is defined by the x86/HVM
> + * direct boot ABI and is available in an ELFNOTE in the kernel binary.
> + *
> + * This function is passed to load_elf() when it is called from
> + * load_elfboot() which then additionally checks for an ELF Note of
> + * type XEN_ELFNOTE_PHYS32_ENTRY and passes it to this function to
> + * parse the PVH entry address from the ELF Note.
> + *
> + * Due to trickery in elf_opts.h, load_elf() is actually available as
> + * load_elf32() or load_elf64() and this routine needs to be able
> + * to deal with being called as 32 or 64 bit.
> + *
> + * The address of the PVH entry point is saved to the 'pvh_start_addr'
> + * global variable.  (although the entry point is 32-bit, the kernel
> + * binary can be either 32-bit or 64-bit).
> + */
> +
> +static uint64_t read_pvh_start_addr(void *arg1, void *arg2, bool is64)
> +{
> +    size_t *elf_note_data_addr;
> +
> +    /* Check if ELF Note header passed in is valid */
> +    if (arg1 == NULL) {
> +        return 0;
> +    }
> +
> +    if (is64) {
> +        struct elf64_note *nhdr64 = (struct elf64_note *)arg1;
> +        uint64_t nhdr_size64 = sizeof(struct elf64_note);
> +        uint64_t phdr_align = *(uint64_t *)arg2;
> +        uint64_t nhdr_namesz = nhdr64->n_namesz;
> +
> +        elf_note_data_addr =
> +            ((void *)nhdr64) + nhdr_size64 +
> +            QEMU_ALIGN_UP(nhdr_namesz, phdr_align);
> +    } else {
> +        struct elf32_note *nhdr32 = (struct elf32_note *)arg1;
> +        uint32_t nhdr_size32 = sizeof(struct elf32_note);
> +        uint32_t phdr_align = *(uint32_t *)arg2;
> +        uint32_t nhdr_namesz = nhdr32->n_namesz;
> +
> +        elf_note_data_addr =
> +            ((void *)nhdr32) + nhdr_size32 +
> +            QEMU_ALIGN_UP(nhdr_namesz, phdr_align);
> +    }
> +
> +    pvh_start_addr = *elf_note_data_addr;
> +
> +    return pvh_start_addr;
> +}
> +
> +bool pvh_load_elfboot(const char *kernel_filename,
> +                      uint32_t *mh_load_addr,
> +                      uint32_t *elf_kernel_size)
> +{
> +    uint64_t elf_entry;
> +    uint64_t elf_low, elf_high;
> +    int kernel_size;
> +    uint64_t elf_note_type = XEN_ELFNOTE_PHYS32_ENTRY;
> +
> +    kernel_size = load_elf(kernel_filename, read_pvh_start_addr,
> +                           NULL, &elf_note_type, &elf_entry,
> +                           &elf_low, &elf_high, 0, I386_ELF_MACHINE,
> +                           0, 0);
> +
> +    if (kernel_size < 0) {
> +        error_report("Error while loading elf kernel");
> +        return false;
> +    }
> +
> +    if (pvh_start_addr == 0) {
> +        error_report("Error loading uncompressed kernel without PVH ELF Note");
> +        return false;
> +    }
> +
> +    if (mh_load_addr) {
> +        *mh_load_addr = elf_low;
> +    }
> +
> +    if (elf_kernel_size) {
> +        *elf_kernel_size = elf_high - elf_low;
> +    }
> +
> +    return true;
> +}
> diff --git a/hw/i386/pvh.h b/hw/i386/pvh.h
> new file mode 100644
> index 0000000000..ada67ff6e8
> --- /dev/null
> +++ b/hw/i386/pvh.h
> @@ -0,0 +1,10 @@
> +#ifndef HW_I386_PVH_H
> +#define HW_I386_PVH_H
> +
> +size_t pvh_get_start_addr(void);
> +
> +bool pvh_load_elfboot(const char *kernel_filename,
> +                      uint32_t *mh_load_addr,
> +                      uint32_t *elf_kernel_size);
> +
> +#endif
> 


