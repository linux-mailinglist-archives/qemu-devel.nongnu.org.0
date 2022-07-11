Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B755703B2
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 14:59:22 +0200 (CEST)
Received: from localhost ([::1]:60588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAt0S-0001WV-R4
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 08:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oAsxo-0005Va-Qj
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 08:56:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oAsxk-0003Wd-OI
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 08:56:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657544191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iMFKuT/enobWbYJ0mRWELQr5C1Lqku/rrTJ/mY0uTtw=;
 b=U+kUvp5XPPyF1QE5FnggUA5vpmXUeRkLrHxXlnZWpiwQB+7HXN4AVuoaXGigHVO89ySAxp
 evytNMY3IXCF9fTBOzzePlERlCJtaCvgWEq4UbERGHzD+alUA+oKisr7gT/hRn+NAuGKUc
 OsuW8pCLsgMf/qnRxmA1XzaQMZ+guPw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-4aXhKcqqM7KDQ5X5MedvBQ-1; Mon, 11 Jul 2022 08:56:30 -0400
X-MC-Unique: 4aXhKcqqM7KDQ5X5MedvBQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 k7-20020a1709062a4700b006fe92440164so1052298eje.23
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 05:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iMFKuT/enobWbYJ0mRWELQr5C1Lqku/rrTJ/mY0uTtw=;
 b=3UpS+sJnGnr5QA6EUt5RAAIOb0hWnCP7Z2dJxDZGBk3figqZ95p0uIP417s2pUJt2P
 Obb2GjdIo7Pzy/Tdou5oCNj9T9DMFrgyLqM4JPHTjNaYi6+mwAuxw+psDHVC0GlbtFjA
 BiRzAfCF4NbQqK4v36rxsvdYRTj50k2IWl2hrFfGl6dy4UaDTs2iw0iaaNKAIQdko8LO
 zfsKF9B1/Atfm/pd843SPx6FXru8p6PDLxNJ6Mz3pYf/zBXg3uQ8oARxbgBXZVI2eZsW
 aBjV3zytQLUvTd5WILQersz/FE6ntkr+sA6lW/P96Cxs1aZHSyTnXWsFQQ0Gv1HFnx7s
 81ZA==
X-Gm-Message-State: AJIora//n33s5UVPUwGxLHBzhBmsaLY86XB8IOpmiBXjEplgIcHSSR/O
 yT8PFH4xGxP3ndq4l5dCq1AeXTIH2gwieiMqCdN5G70R6WY4swvDWMVY6C4K6zI2a8OWpYz8Qut
 m+zfMFHnXm1hFajE=
X-Received: by 2002:a17:906:9bd1:b0:72b:302:2b88 with SMTP id
 de17-20020a1709069bd100b0072b03022b88mr18308022ejc.250.1657544188966; 
 Mon, 11 Jul 2022 05:56:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vTleXPVrBUvYkp368UteoqS9HcipAFGhvecXGpVEbiRa79HERsht1U0O2YwK2rkki3anuxhg==
X-Received: by 2002:a17:906:9bd1:b0:72b:302:2b88 with SMTP id
 de17-20020a1709069bd100b0072b03022b88mr18307995ejc.250.1657544188650; 
 Mon, 11 Jul 2022 05:56:28 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 t23-20020a1709063e5700b00722e31fcf42sm2624985eji.184.2022.07.11.05.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 05:56:28 -0700 (PDT)
Date: Mon, 11 Jul 2022 14:56:27 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Alex Williamson
 <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Suravee Suthikulpanit
 <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v6 09/10] i386/pc: relocate 4g start to 1T where applicable
Message-ID: <20220711145627.2c318ba6@redhat.com>
In-Reply-To: <20220701161014.3850-10-joao.m.martins@oracle.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-10-joao.m.martins@oracle.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri,  1 Jul 2022 17:10:13 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> It is assumed that the whole GPA space is available to be DMA
> addressable, within a given address space limit, except for a
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
> in the 256T boundary in Fam 17h according to Errata #1286,
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
> If the relocation is done or the address space covers it, we
> also add the the reserved HT e820 range as reserved.
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
>  hw/i386/pc.c | 101 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 101 insertions(+)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index a79fa1b6beeb..07025b510540 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -907,6 +907,87 @@ static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
>      return start;
>  }
>  
> +static hwaddr pc_max_used_gpa(PCMachineState *pcms,
> +                                hwaddr above_4g_mem_start,
> +                                uint64_t pci_hole64_size)
> +{
> +    X86MachineState *x86ms = X86_MACHINE(pcms);
> +

> +    if (!x86ms->above_4g_mem_size) {
> +        /*
> +         * 32-bit pci hole goes from
> +         * end-of-low-ram (@below_4g_mem_size) to IOAPIC.
> +          */
> +        return IO_APIC_DEFAULT_ADDRESS - 1;
> +    }
this hunk still bothers me (nothing changed wrt v5 issues around it)
issues recap: (
 1. correctness of it
 2. being limited to AMD only, while it seems pretty generic to me
 3. should be a separate patch
)

> +
> +    return pc_pci_hole64_start() + pci_hole64_size;
> +}
> +
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
> +static void pc_set_amd_above_4g_mem_start(PCMachineState *pcms,
> +                                          uint64_t pci_hole64_size)
> +{
> +    X86MachineState *x86ms = X86_MACHINE(pcms);
> +    hwaddr start = x86ms->above_4g_mem_start;
> +    hwaddr maxphysaddr, maxusedaddr;
> +
> +    /* Bail out if max possible address does not cross HT range */
> +    if (pc_max_used_gpa(pcms, start, pci_hole64_size) < AMD_HT_START) {

move it to the caller?

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
> +    maxusedaddr = pc_max_used_gpa(pcms, start, pci_hole64_size);
> +    if (maxphysaddr < maxusedaddr) {
> +        error_report("Address space limit 0x%"PRIx64" < 0x%"PRIx64
> +                     " phys-bits too low (%u) cannot avoid AMD HT range",
> +                     maxphysaddr, maxusedaddr, X86_CPU(first_cpu)->phys_bits);
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    x86ms->above_4g_mem_start = start;
> +}
> +
>  void pc_memory_init(PCMachineState *pcms,
>                      MemoryRegion *system_memory,
>                      MemoryRegion *rom_memory,
> @@ -922,12 +1003,31 @@ void pc_memory_init(PCMachineState *pcms,
>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>      X86MachineState *x86ms = X86_MACHINE(pcms);
>      hwaddr cxl_base, cxl_resv_end = 0;
> +    X86CPU *cpu = X86_CPU(first_cpu);
>  
>      assert(machine->ram_size == x86ms->below_4g_mem_size +
>                                  x86ms->above_4g_mem_size);
>  
>      linux_boot = (machine->kernel_filename != NULL);
>  
> +    /*
> +     * The HyperTransport range close to the 1T boundary is unique to AMD
> +     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
> +     * to above 1T to AMD vCPUs only.
> +     */
> +    if (IS_AMD_CPU(&cpu->env)) {
> +        pc_set_amd_above_4g_mem_start(pcms, pci_hole64_size);
> +
> +        /*
> +         * Advertise the HT region if address space covers the reserved
> +         * region or if we relocate.
> +         */
> +        if (x86ms->above_4g_mem_start == AMD_ABOVE_1TB_START ||
> +            cpu->phys_bits >= 40) {
> +            e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
> +        }
> +    }
> +
>      /*
>       * Split single memory region and use aliases to address portions of it,
>       * done for backwards compatibility with older qemus.
> @@ -938,6 +1038,7 @@ void pc_memory_init(PCMachineState *pcms,
>                               0, x86ms->below_4g_mem_size);
>      memory_region_add_subregion(system_memory, 0, ram_below_4g);
>      e820_add_entry(0, x86ms->below_4g_mem_size, E820_RAM);
> +

stray newline?

>      if (x86ms->above_4g_mem_size > 0) {
>          ram_above_4g = g_malloc(sizeof(*ram_above_4g));
>          memory_region_init_alias(ram_above_4g, NULL, "ram-above-4g",


