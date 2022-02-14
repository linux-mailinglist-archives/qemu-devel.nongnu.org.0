Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED194B5564
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 16:55:00 +0100 (CET)
Received: from localhost ([::1]:39216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJdgp-0002aT-B9
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 10:54:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nJdKi-0002aH-W7
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 10:32:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nJdKf-0004mp-4M
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 10:32:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644852722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ZTBgJ2yrsgU5QRIGYhGk+g/c4Dy7lR3MYn0YNY9PII=;
 b=EKgNJIkYX7CLS2ZMbxTpKcZtA1dVfp2OrkyKqmlAogHyPcwhiIJE29FH3QzENgmCM28dld
 l9n+xgrKsfcYgRLvIeC33Bdp0ylpKAbw4YO/yTBmK4RZXtSqcd/6QO28ba9352SPal22hy
 yWRwpp433GVmYvAEiPufdItEqth+cNI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-kZWSTaX6MyyDTX-N9pUeWQ-1; Mon, 14 Feb 2022 10:32:01 -0500
X-MC-Unique: kZWSTaX6MyyDTX-N9pUeWQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 gn20-20020a1709070d1400b006cf1fcb4c8dso818524ejc.12
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 07:32:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1ZTBgJ2yrsgU5QRIGYhGk+g/c4Dy7lR3MYn0YNY9PII=;
 b=c+Lw84QO2uPgFzWKejw+jXyzdrACAug2PLbQp9lBGy4DSsYGqJ42RT/QZX8E5UwyZn
 C6PdMR0YoQvt5tKyAlvMpavZ6hJ22xXlMpuypGcG2yJt545KIu2Ivtn8azCQsq+4Zk/9
 ZrjscM/wRQCfQVQeH3608TBrYaGw60yZFLxKckL0aUCNn+1hKIycN/JjcbE2VgOYX9cv
 vgt+xVs9YdEHSwtBGJkY/teI/xq80KeFg1CzHq9ugD7eeCg1iEe+WC4tX8DmIe2qCeYl
 CTJ64WvWKw3c5PqCmT3K5/raGGLCUEqKlZ3oauhHPSJu1Q/Nq7ZaT3qeqAB8bATqUWfT
 gJWw==
X-Gm-Message-State: AOAM53090CfV0dYIfAxLepuCHz4llmSGB8t5ETCFtvlGeE/ijvybSQXf
 B7YzstPO8+nvJ1RMAJbf0iyEUA+1LHZLIV3Ab34b2YXfEmBwrp0hJaePFtqCi9+x0vSFn6TDbCc
 sWBKPzYaYoCnEJPw=
X-Received: by 2002:a17:906:8a4b:: with SMTP id
 gx11mr136173ejc.48.1644852720419; 
 Mon, 14 Feb 2022 07:32:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5nP3LrNsyB33QeWLqV8hDWdtlOH4ugNJGlWUKKajwjZe2ArJ3c/R7Hf2HykjfOF/ddz0AGA==
X-Received: by 2002:a17:906:8a4b:: with SMTP id
 gx11mr136137ejc.48.1644852720139; 
 Mon, 14 Feb 2022 07:32:00 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id s8sm3806514edd.72.2022.02.14.07.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 07:31:59 -0800 (PST)
Date: Mon, 14 Feb 2022 16:31:58 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH RFCv2 2/4] i386/pc: relocate 4g start to 1T where
 applicable
Message-ID: <20220214163158.4c4b210b@redhat.com>
In-Reply-To: <fa172a19-5db6-a844-27d7-8497d306024e@oracle.com>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
 <20220207202422.31582-3-joao.m.martins@oracle.com>
 <20220214155318.3ce80da0@redhat.com>
 <fa172a19-5db6-a844-27d7-8497d306024e@oracle.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 15:05:00 +0000
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 2/14/22 14:53, Igor Mammedov wrote:
> > On Mon,  7 Feb 2022 20:24:20 +0000
> > Joao Martins <joao.m.martins@oracle.com> wrote:
> >   
> >> It is assumed that the whole GPA space is available to be DMA
> >> addressable, within a given address space limit, expect for a
> >> tiny region before the 4G. Since Linux v5.4, VFIO validates
> >> whether the selected GPA is indeed valid i.e. not reserved by
> >> IOMMU on behalf of some specific devices or platform-defined
> >> restrictions, and thus failing the ioctl(VFIO_DMA_MAP) with
> >>  -EINVAL.
> >>
> >> AMD systems with an IOMMU are examples of such platforms and
> >> particularly may only have these ranges as allowed:
> >>
> >> 	0000000000000000 - 00000000fedfffff (0      .. 3.982G)
> >> 	00000000fef00000 - 000000fcffffffff (3.983G .. 1011.9G)
> >> 	0000010000000000 - ffffffffffffffff (1Tb    .. 16Pb[*])
> >>
> >> We already account for the 4G hole, albeit if the guest is big
> >> enough we will fail to allocate a guest with  >1010G due to the
> >> ~12G hole at the 1Tb boundary, reserved for HyperTransport (HT).
> >>
> >> [*] there is another reserved region unrelated to HT that exists
> >> in the 256T boundaru in Fam 17h according to Errata #1286,
> >> documeted also in "Open-Source Register Reference for AMD Family
> >> 17h Processors (PUB)"
> >>
> >> When creating the region above 4G, take into account that on AMD
> >> platforms the HyperTransport range is reserved and hence it
> >> cannot be used either as GPAs. On those cases rather than
> >> establishing the start of ram-above-4g to be 4G, relocate instead
> >> to 1Tb. See AMD IOMMU spec, section 2.1.2 "IOMMU Logical
> >> Topology", for more information on the underlying restriction of
> >> IOVAs.
> >>
> >> After accounting for the 1Tb hole on AMD hosts, mtree should
> >> look like:
> >>
> >> 0000000000000000-000000007fffffff (prio 0, i/o):
> >> 	 alias ram-below-4g @pc.ram 0000000000000000-000000007fffffff
> >> 0000010000000000-000001ff7fffffff (prio 0, i/o):
> >> 	alias ram-above-4g @pc.ram 0000000080000000-000000ffffffffff
> >>
> >> If the relocation is done, we also add the the reserved HT
> >> e820 range as reserved.
> >>
> >> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> >> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> >> ---
> >>  hw/i386/pc.c      | 66 +++++++++++++++++++++++++++++++++++++++++++++++
> >>  target/i386/cpu.h |  4 +++
> >>  2 files changed, 70 insertions(+)
> >>
> >> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> >> index 7de0e87f4a3f..b060aedd38f3 100644
> >> --- a/hw/i386/pc.c
> >> +++ b/hw/i386/pc.c
> >> @@ -802,6 +802,65 @@ void xen_load_linux(PCMachineState *pcms)
> >>  #define PC_ROM_ALIGN       0x800
> >>  #define PC_ROM_SIZE        (PC_ROM_MAX - PC_ROM_MIN_VGA)
> >>  
> >> +/*
> >> + * AMD systems with an IOMMU have an additional hole close to the
> >> + * 1Tb, which are special GPAs that cannot be DMA mapped. Depending
> >> + * on kernel version, VFIO may or may not let you DMA map those ranges.
> >> + * Starting Linux v5.4 we validate it, and can't create guests on AMD machines
> >> + * with certain memory sizes. It's also wrong to use those IOVA ranges
> >> + * in detriment of leading to IOMMU INVALID_DEVICE_REQUEST or worse.
> >> + * The ranges reserved for Hyper-Transport are:
> >> + *
> >> + * FD_0000_0000h - FF_FFFF_FFFFh
> >> + *
> >> + * The ranges represent the following:
> >> + *
> >> + * Base Address   Top Address  Use
> >> + *
> >> + * FD_0000_0000h FD_F7FF_FFFFh Reserved interrupt address space
> >> + * FD_F800_0000h FD_F8FF_FFFFh Interrupt/EOI IntCtl
> >> + * FD_F900_0000h FD_F90F_FFFFh Legacy PIC IACK
> >> + * FD_F910_0000h FD_F91F_FFFFh System Management
> >> + * FD_F920_0000h FD_FAFF_FFFFh Reserved Page Tables
> >> + * FD_FB00_0000h FD_FBFF_FFFFh Address Translation
> >> + * FD_FC00_0000h FD_FDFF_FFFFh I/O Space
> >> + * FD_FE00_0000h FD_FFFF_FFFFh Configuration
> >> + * FE_0000_0000h FE_1FFF_FFFFh Extended Configuration/Device Messages
> >> + * FE_2000_0000h FF_FFFF_FFFFh Reserved
> >> + *
> >> + * See AMD IOMMU spec, section 2.1.2 "IOMMU Logical Topology",
> >> + * Table 3: Special Address Controls (GPA) for more information.
> >> + */
> >> +#define AMD_HT_START         0xfd00000000UL
> >> +#define AMD_HT_END           0xffffffffffUL
> >> +#define AMD_ABOVE_1TB_START  (AMD_HT_END + 1)
> >> +#define AMD_HT_SIZE          (AMD_ABOVE_1TB_START - AMD_HT_START)
> >> +
> >> +static void relocate_4g(MachineState *machine, PCMachineState *pcms)  
> > 
> > perhaps rename it to x86_update_above_4g_mem_start() ?
> >   
> Yeap.
> 
> >> +{
> >> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
> >> +    X86MachineState *x86ms = X86_MACHINE(pcms);
> >> +    ram_addr_t device_mem_size = 0;
> >> +    uint32_t eax, vendor[3];
> >> +
> >> +    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
> >> +    if (!IS_AMD_VENDOR(vendor)) {
> >> +        return;
> >> +    }
> >> +
> >> +    if (pcmc->has_reserved_memory &&
> >> +       (machine->ram_size < machine->maxram_size)) {
> >> +        device_mem_size = machine->maxram_size - machine->ram_size;
> >> +    }
> >> +
> >> +    if ((x86ms->above_4g_mem_start + x86ms->above_4g_mem_size +
> >> +         device_mem_size) < AMD_HT_START) {  
> > should it account for sgx as well?
> >   
> Yes, I missed that one.
> 
> > what if above sum ends up right before AMD_HT_START,
> > and exit without adjusting above_4g_mem_start, but
> > pci64 hole eventually will fall into HT range?
> > Is it expected behaviour?
> >   
> No -- it should not be any reserved range really.
> 
> And I was at two minds on this one, whether to advertise *always*
> the 1T hole, regardless of relocation. Or account the size
> we advertise for the pci64 hole and make that part of the equation
> above. Although that has the flaw that the firmware at admin request
> may pick some ludricous number (limited by maxphysaddr).

it this point we have only pci64 hole size (machine property),
so I'd include that in equation to make firmware assign
pci64 aperture above HT range.

as for checking maxphysaddr, we can only check 'default' PCI hole
range at this stage (i.e. 1Gb aligned hole size after all possible RAM)
and hard error on it.

I don't know what behavior should be if firmware tries to program
PCI64 hole beyond supported phys-bits.

Michael, Gerd
  perhaps you can suggest something here

 
> >> +        return;
> >> +    }
> >> +
> >> +    x86ms->above_4g_mem_start = AMD_ABOVE_1TB_START;
> >> +}
> >> +
> >>  void pc_memory_init(PCMachineState *pcms,
> >>                      MemoryRegion *system_memory,
> >>                      MemoryRegion *rom_memory,
> >> @@ -821,6 +880,8 @@ void pc_memory_init(PCMachineState *pcms,
> >>  
> >>      linux_boot = (machine->kernel_filename != NULL);
> >>  
> >> +    relocate_4g(machine, pcms);
> >> +
> >>      /*
> >>       * Split single memory region and use aliases to address portions of it,
> >>       * done for backwards compatibility with older qemus.
> >> @@ -831,6 +892,11 @@ void pc_memory_init(PCMachineState *pcms,
> >>                               0, x86ms->below_4g_mem_size);
> >>      memory_region_add_subregion(system_memory, 0, ram_below_4g);
> >>      e820_add_entry(0, x86ms->below_4g_mem_size, E820_RAM);
> >> +
> >> +    if (x86ms->above_4g_mem_start == AMD_ABOVE_1TB_START) {
> >> +        e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
> >> +    }  
> > 
> > btw: do we have to add reservation record for HT zone, why?
> >   
> 
> This is what real hardware does fwiw :D
> 
> I understand that we you do the relocation, firmware /should/
> pick the first address after RAM as start of pci64 hole, and hence
> past the HT range.
> 
> But if felt that for correctness we would tell the guest that this
> range cannot be used regardless. I take that perhaps you're thinking
> that you omit the E820_RESERVED just like the 4G hole?

It's fine to advertise region as reserved, for completeness wit real HW
and in case if we ever allow guest OS to reconfigure PCI64
hole aperture it should prevent guest picking reserved range
(theoretically, whether it actually would work or not I'm not sure)

> 
> >>      if (x86ms->above_4g_mem_size > 0) {
> >>          ram_above_4g = g_malloc(sizeof(*ram_above_4g));
> >>          memory_region_init_alias(ram_above_4g, NULL, "ram-above-4g",
> >> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> >> index 9911d7c8711b..1acebc569b02 100644
> >> --- a/target/i386/cpu.h
> >> +++ b/target/i386/cpu.h
> >> @@ -906,6 +906,10 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
> >>  #define IS_AMD_CPU(env) ((env)->cpuid_vendor1 == CPUID_VENDOR_AMD_1 && \
> >>                           (env)->cpuid_vendor2 == CPUID_VENDOR_AMD_2 && \
> >>                           (env)->cpuid_vendor3 == CPUID_VENDOR_AMD_3)
> >> +#define IS_AMD_VENDOR(vendor) ((vendor[0]) == CPUID_VENDOR_AMD_1 && \
> >> +                         (vendor[1]) == CPUID_VENDOR_AMD_2 && \
> >> +                         (vendor[2]) == CPUID_VENDOR_AMD_3)
> >> +
> >>  
> >>  #define CPUID_MWAIT_IBE     (1U << 1) /* Interrupts can exit capability */
> >>  #define CPUID_MWAIT_EMX     (1U << 0) /* enumeration supported */  
> >   
> 


