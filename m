Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BEE54E351
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 16:24:46 +0200 (CEST)
Received: from localhost ([::1]:34688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1qQP-0005Yl-Mn
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 10:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o1qPK-0004iB-Jj
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 10:23:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o1qPH-0007Zl-6o
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 10:23:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655389413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0CxYNJV1YmnOk+8gZAisrdYjGZ0ivVQ41VqRFENCZhw=;
 b=B7mdzNSSY3HdeMmPf6jhXPrYsTZLbGpw+COj+iB8ygNToYkm8ZfB3nxZPotiTT7pC5HF3G
 ZQ19u/s8z69iOZO1hIHWNuNKG1V3CR+pWfT+mgndVMMb5HPAEEa1hvAA2WRG7vZKOLLTBb
 cLVcUCj14HwT9OOAQAsRirHgwo85dWU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-CywqWtN5PqCG_2SKQppSVw-1; Thu, 16 Jun 2022 10:23:32 -0400
X-MC-Unique: CywqWtN5PqCG_2SKQppSVw-1
Received: by mail-wr1-f71.google.com with SMTP id
 s3-20020adf9783000000b00219f10a7517so294911wrb.3
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 07:23:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0CxYNJV1YmnOk+8gZAisrdYjGZ0ivVQ41VqRFENCZhw=;
 b=YyhKZ60uwgRga04Ec5/HzvsmXAosXcnfbM4e6EmJqJwrFBjsvgqssm602sIiuDgcyn
 pkXANrEKQ2jt4i2m+SBATJ0wDe+UbliTS7ktKcB0lJKDQKckuzVxI3ETVfoZes0mgi+6
 Wr/KG1J8MDekH1GE3KuFf4/ddnZRBmcd1cmEoHa6Uyjpnxf6wa/kUp75f78WwRfmsbGK
 XvW4zV9EI3ldH7mX8VJWQBxTQNLCQ4sETPF/6OCNl6/9lhssr8Oa95m7i0m1M3YZCciq
 Oxwn9hYzHqlnICqohvKTC3sa0g2d2fjkZ8lFN+qsMc6djW7INYO7wC1Dx1/NC7da3T74
 UwTQ==
X-Gm-Message-State: AJIora9j89K5oDP8QNXv4ZPlJnN6WUAVwjoS/oF96PfzmGKRapvTGalM
 DqazexDSeoiYUzfEAiy2I01xJXK9gOGx0jj3YWSxIKbSvYGCSeG1gcmYrb0NN4rK2As5CzGdUNs
 cB6FS8N20BaSQLFw=
X-Received: by 2002:a05:6000:15c3:b0:216:7c87:9f4f with SMTP id
 y3-20020a05600015c300b002167c879f4fmr4876932wry.160.1655389411053; 
 Thu, 16 Jun 2022 07:23:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vqTS47ipj9MFxfENsd4RXxNbV3Zdqh2oTd6uyO+O4pn1ILL8cshF780gGQqphAVKcUbIhOuQ==
X-Received: by 2002:a05:6000:15c3:b0:216:7c87:9f4f with SMTP id
 y3-20020a05600015c300b002167c879f4fmr4876904wry.160.1655389410776; 
 Thu, 16 Jun 2022 07:23:30 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 h81-20020a1c2154000000b0039c41686421sm5693737wmh.17.2022.06.16.07.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 07:23:30 -0700 (PDT)
Date: Thu, 16 Jun 2022 16:23:28 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>, Alex Williamson
 <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v5 4/5] i386/pc: relocate 4g start to 1T where applicable
Message-ID: <20220616162328.64138d4f@redhat.com>
In-Reply-To: <20220520104532.9816-5-joao.m.martins@oracle.com>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
 <20220520104532.9816-5-joao.m.martins@oracle.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 May 2022 11:45:31 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> It is assumed that the whole GPA space is available to be DMA
> addressable, within a given address space limit, expect for a
                                                   ^^^ typo?

> tiny region before the 4G. Since Linux v5.4, VFIO validates
> whether the selected GPA is indeed valid i.e. not reserved by
> IOMMU on behalf of some specific devices or platform-defined
> restrictions, and thus failing the ioctl(VFIO_DMA_MAP) with
>  -EINVAL.
> 
> AMD systems with an IOMMU are examples of such platforms and
> particularly may only have these ranges as allowed:
> 
> 	0000000000000000 - 00000000fedfffff (0      .. 3.982G)
> 	00000000fef00000 - 000000fcffffffff (3.983G .. 1011.9G)
> 	0000010000000000 - ffffffffffffffff (1Tb    .. 16Pb[*])
> 
> We already account for the 4G hole, albeit if the guest is big
> enough we will fail to allocate a guest with  >1010G due to the
> ~12G hole at the 1Tb boundary, reserved for HyperTransport (HT).
> 
> [*] there is another reserved region unrelated to HT that exists
> in the 256T boundaru in Fam 17h according to Errata #1286,
              ^ ditto

> documeted also in "Open-Source Register Reference for AMD Family
> 17h Processors (PUB)"
> 
> When creating the region above 4G, take into account that on AMD
> platforms the HyperTransport range is reserved and hence it
> cannot be used either as GPAs. On those cases rather than
> establishing the start of ram-above-4g to be 4G, relocate instead
> to 1Tb. See AMD IOMMU spec, section 2.1.2 "IOMMU Logical
> Topology", for more information on the underlying restriction of
> IOVAs.
> 
> After accounting for the 1Tb hole on AMD hosts, mtree should
> look like:
> 
> 0000000000000000-000000007fffffff (prio 0, i/o):
> 	 alias ram-below-4g @pc.ram 0000000000000000-000000007fffffff
> 0000010000000000-000001ff7fffffff (prio 0, i/o):
> 	alias ram-above-4g @pc.ram 0000000080000000-000000ffffffffff
> 
> If the relocation is done, we also add the the reserved HT
> e820 range as reserved.
> 
> Default phys-bits on Qemu is TCG_PHYS_ADDR_BITS (40) which is enough
> to address 1Tb (0xff ffff ffff). On AMD platforms, if a
> ram-above-4g relocation may be desired and the CPU wasn't configured
> with a big enough phys-bits, print an error message to the user
> and do not make the relocation of the above-4g-region if phys-bits
> is too low.
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>  hw/i386/pc.c | 111 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index af52d4ff89ef..652ae8ff9ccf 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -796,6 +796,110 @@ void xen_load_linux(PCMachineState *pcms)
>  #define PC_ROM_ALIGN       0x800
>  #define PC_ROM_SIZE        (PC_ROM_MAX - PC_ROM_MIN_VGA)
>  
> +/*
> + * AMD systems with an IOMMU have an additional hole close to the
> + * 1Tb, which are special GPAs that cannot be DMA mapped. Depending
> + * on kernel version, VFIO may or may not let you DMA map those ranges.
> + * Starting Linux v5.4 we validate it, and can't create guests on AMD machines
> + * with certain memory sizes. It's also wrong to use those IOVA ranges
> + * in detriment of leading to IOMMU INVALID_DEVICE_REQUEST or worse.
> + * The ranges reserved for Hyper-Transport are:
> + *
> + * FD_0000_0000h - FF_FFFF_FFFFh
> + *
> + * The ranges represent the following:
> + *
> + * Base Address   Top Address  Use
> + *
> + * FD_0000_0000h FD_F7FF_FFFFh Reserved interrupt address space
> + * FD_F800_0000h FD_F8FF_FFFFh Interrupt/EOI IntCtl
> + * FD_F900_0000h FD_F90F_FFFFh Legacy PIC IACK
> + * FD_F910_0000h FD_F91F_FFFFh System Management
> + * FD_F920_0000h FD_FAFF_FFFFh Reserved Page Tables
> + * FD_FB00_0000h FD_FBFF_FFFFh Address Translation
> + * FD_FC00_0000h FD_FDFF_FFFFh I/O Space
> + * FD_FE00_0000h FD_FFFF_FFFFh Configuration
> + * FE_0000_0000h FE_1FFF_FFFFh Extended Configuration/Device Messages
> + * FE_2000_0000h FF_FFFF_FFFFh Reserved
> + *
> + * See AMD IOMMU spec, section 2.1.2 "IOMMU Logical Topology",
> + * Table 3: Special Address Controls (GPA) for more information.
> + */
> +#define AMD_HT_START         0xfd00000000UL
> +#define AMD_HT_END           0xffffffffffUL
> +#define AMD_ABOVE_1TB_START  (AMD_HT_END + 1)
> +#define AMD_HT_SIZE          (AMD_ABOVE_1TB_START - AMD_HT_START)
> +
> +static hwaddr x86_max_phys_addr(PCMachineState *pcms,

s/x86_max_phys_addr/pc_max_used_gpa/

> +                                hwaddr above_4g_mem_start,
> +                                uint64_t pci_hole64_size)
> +{
> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
> +    X86MachineState *x86ms = X86_MACHINE(pcms);
> +    MachineState *machine = MACHINE(pcms);
> +    ram_addr_t device_mem_size = 0;
> +    hwaddr base;
> +
> +    if (!x86ms->above_4g_mem_size) {
> +       /*
> +        * 32-bit pci hole goes from
> +        * end-of-low-ram (@below_4g_mem_size) to IOAPIC.
> +        */
> +        return IO_APIC_DEFAULT_ADDRESS - 1;

lack of above_4g_mem, doesn't mean absence of device_mem_size or anything else
that's located above it.

> +    }
> +
> +    if (pcmc->has_reserved_memory &&
> +       (machine->ram_size < machine->maxram_size)) {
> +        device_mem_size = machine->maxram_size - machine->ram_size;
> +    }
> +
> +    base = ROUND_UP(above_4g_mem_start + x86ms->above_4g_mem_size +
> +                    pcms->sgx_epc.size, 1 * GiB);
> +
> +    return base + device_mem_size + pci_hole64_size;

it's not guarantied that pci64 hole starts right away device_mem,
but you are not 1st doing this assumption in code, maybe instead of
all above use existing 
   pc_pci_hole64_start() + pci_hole64_size
to gestimate max address 

> +}
> +
> +static void x86_update_above_4g_mem_start(PCMachineState *pcms,
> +                                          uint64_t pci_hole64_size)

s/x86_update_above_4g_mem_start/pc_set_amd_above_4g_mem_start/

> +{
> +    X86MachineState *x86ms = X86_MACHINE(pcms);
> +    CPUX86State *env = &X86_CPU(first_cpu)->env;
> +    hwaddr start = x86ms->above_4g_mem_start;
> +    hwaddr maxphysaddr, maxusedaddr;


> +    /*
> +     * The HyperTransport range close to the 1T boundary is unique to AMD
> +     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
> +     * to above 1T to AMD vCPUs only.
> +     */
> +    if (!IS_AMD_CPU(env)) {
> +        return;
> +    }

move this to caller

> +    /* Bail out if max possible address does not cross HT range */
> +    if (x86_max_phys_addr(pcms, start, pci_hole64_size) < AMD_HT_START) {
> +        return;
> +    }
> +
> +    /*
> +     * Relocating ram-above-4G requires more than TCG_PHYS_ADDR_BITS (40).
> +     * So make sure phys-bits is required to be appropriately sized in order
> +     * to proceed with the above-4g-region relocation and thus boot.
> +     */
> +    start = AMD_ABOVE_1TB_START;
> +    maxphysaddr = ((hwaddr)1 << X86_CPU(first_cpu)->phys_bits) - 1;
> +    maxusedaddr = x86_max_phys_addr(pcms, start, pci_hole64_size);
> +    if (maxphysaddr < maxusedaddr) {
> +        error_report("Address space limit 0x%"PRIx64" < 0x%"PRIx64
> +                     " phys-bits too low (%u) cannot avoid AMD HT range",
> +                     maxphysaddr, maxusedaddr, X86_CPU(first_cpu)->phys_bits);
> +        exit(EXIT_FAILURE);
> +    }
> +
> +
> +    x86ms->above_4g_mem_start = start;
> +}
> +
>  void pc_memory_init(PCMachineState *pcms,
>                      MemoryRegion *system_memory,
>                      MemoryRegion *rom_memory,
> @@ -817,6 +921,8 @@ void pc_memory_init(PCMachineState *pcms,
>  
>      linux_boot = (machine->kernel_filename != NULL);
>  
> +    x86_update_above_4g_mem_start(pcms, pci_hole64_size);
> +
>      /*
>       * Split single memory region and use aliases to address portions of it,
>       * done for backwards compatibility with older qemus.
> @@ -827,6 +933,11 @@ void pc_memory_init(PCMachineState *pcms,
>                               0, x86ms->below_4g_mem_size);
>      memory_region_add_subregion(system_memory, 0, ram_below_4g);
>      e820_add_entry(0, x86ms->below_4g_mem_size, E820_RAM);
> +
> +    if (x86ms->above_4g_mem_start == AMD_ABOVE_1TB_START) {
> +        e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
> +    }
probably it is not necessary, but it doesn't hurt

>      if (x86ms->above_4g_mem_size > 0) {
>          ram_above_4g = g_malloc(sizeof(*ram_above_4g));
>          memory_region_init_alias(ram_above_4g, NULL, "ram-above-4g",


