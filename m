Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 838C355C108
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 14:42:33 +0200 (CEST)
Received: from localhost ([::1]:41302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6AY4-0003iR-6K
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 08:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o6ATv-0001YD-PK
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 08:38:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o6ATr-0000tL-AV
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 08:38:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656419888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ys+y5fhchnMH7Gs1GnJ8TLHY+yUQwztbS/Ly0XnzsCg=;
 b=UyGT96VpvDNJCOtXktHV7ulLhyf6Jy3+Q6gFfdPZ4NjlWl3kh6lI/mta8ie9JohpWhCVSS
 7Wrh6kqtehSD5LmjZXB7EvjSra9NSzOWmpiTMqYDeS2uEUC2GD879F33LuRjNI+CQYnlCM
 7tXerXsQLfLsO8c/px14DZdA+oc9Xe4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-9w4tXYIEPCOWETU9Bdhsag-1; Tue, 28 Jun 2022 08:38:06 -0400
X-MC-Unique: 9w4tXYIEPCOWETU9Bdhsag-1
Received: by mail-wm1-f72.google.com with SMTP id
 p22-20020a05600c359600b0039c7b23a1c7so8834538wmq.2
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 05:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ys+y5fhchnMH7Gs1GnJ8TLHY+yUQwztbS/Ly0XnzsCg=;
 b=6QEI3CF3cx1hl7M43C07iaZ+9FX+8b0OhqQ6yjY9L01s35/7WaOp606C/sPk2N57h3
 gAGmbU3RbLKHWUZ7VnR9TBeA6bT6n9mub5bMlpNQb2NJeM32DRPejkxOGi/oL1S7R2It
 O3WCv5fkA6WI7KWMlQGzymWnRy+/Ry6xI0/+gpB9O1cVaTaogd4l+hM66C+mM97Idie/
 y+AW6z7pkmggOI8AJHWE5JN0sQDUIxu79K68qphnoxDhwqwzvYmRmDAyKJ0UejZLEcqX
 cppWvLvhjHyzmKto69YEHrmIFv6s4ZSTxHtJadwqLUyP+GD7S1ZT3rMBgIOAjP0v1tOs
 IdcA==
X-Gm-Message-State: AJIora8tSeMNBAP/MsST1koFvaBjdecs4xssU3OWX9o9nJTnaE0ajYI0
 kAWH4pmzBQ77bQKAYJw92I6hbnsSqtwrJD/1dQi/lENcMyFCt+LAIfcvqFlQTGzSL6QAd+7Leev
 v3+OT4FD1c9KciFU=
X-Received: by 2002:a05:600c:3b9b:b0:3a0:487c:8b5a with SMTP id
 n27-20020a05600c3b9b00b003a0487c8b5amr13798763wms.64.1656419885579; 
 Tue, 28 Jun 2022 05:38:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1unYiRYM5+2+cD9eEnc2IBMWMFsGHLjnuGVh+Yh46GopE7VA/857NPCfzNYC0eGUeF0WJOdcg==
X-Received: by 2002:a05:600c:3b9b:b0:3a0:487c:8b5a with SMTP id
 n27-20020a05600c3b9b00b003a0487c8b5amr13798724wms.64.1656419885243; 
 Tue, 28 Jun 2022 05:38:05 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 n26-20020a7bc5da000000b003a018e43df2sm8739951wmk.34.2022.06.28.05.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 05:38:04 -0700 (PDT)
Date: Tue, 28 Jun 2022 14:38:03 +0200
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
Message-ID: <20220628143803.538bfe74@redhat.com>
In-Reply-To: <5a094bd6-ebc1-c512-e97e-c1edba94f41a@oracle.com>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
 <20220520104532.9816-5-joao.m.martins@oracle.com>
 <20220616162328.64138d4f@redhat.com>
 <bc50bb88-5330-a839-bd50-ca49b0edec9d@oracle.com>
 <20220617143251.5f064694@redhat.com>
 <4f3e051e-fb13-5860-b39f-5ace782cdea0@oracle.com>
 <20220620162720.2ea44444@redhat.com>
 <07368ec5-98bf-20e2-71e6-c258370970fc@oracle.com>
 <5a094bd6-ebc1-c512-e97e-c1edba94f41a@oracle.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Mon, 20 Jun 2022 19:13:46 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 6/20/22 17:36, Joao Martins wrote:
> > On 6/20/22 15:27, Igor Mammedov wrote:  
> >> On Fri, 17 Jun 2022 14:33:02 +0100
> >> Joao Martins <joao.m.martins@oracle.com> wrote:  
> >>> On 6/17/22 13:32, Igor Mammedov wrote:  
> >>>> On Fri, 17 Jun 2022 13:18:38 +0100
> >>>> Joao Martins <joao.m.martins@oracle.com> wrote:    
> >>>>> On 6/16/22 15:23, Igor Mammedov wrote:    
> >>>>>> On Fri, 20 May 2022 11:45:31 +0100
> >>>>>> Joao Martins <joao.m.martins@oracle.com> wrote:    
> >>>>>>> +                                hwaddr above_4g_mem_start,
> >>>>>>> +                                uint64_t pci_hole64_size)
> >>>>>>> +{
> >>>>>>> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
> >>>>>>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
> >>>>>>> +    MachineState *machine = MACHINE(pcms);
> >>>>>>> +    ram_addr_t device_mem_size = 0;
> >>>>>>> +    hwaddr base;
> >>>>>>> +
> >>>>>>> +    if (!x86ms->above_4g_mem_size) {
> >>>>>>> +       /*
> >>>>>>> +        * 32-bit pci hole goes from
> >>>>>>> +        * end-of-low-ram (@below_4g_mem_size) to IOAPIC.
> >>>>>>> +        */
> >>>>>>> +        return IO_APIC_DEFAULT_ADDRESS - 1;      
> >>>>>>
> >>>>>> lack of above_4g_mem, doesn't mean absence of device_mem_size or anything else
> >>>>>> that's located above it.
> >>>>>>       
> >>>>>
> >>>>> True. But the intent is to fix 32-bit boundaries as one of the qtests was failing
> >>>>> otherwise. We won't hit the 1T hole, hence a nop.    
> >>>>
> >>>> I don't get the reasoning, can you clarify it pls?
> >>>>     
> >>>
> >>> I was trying to say that what lead me here was a couple of qtests failures (from v3->v4).
> >>>
> >>> I was doing this before based on pci_hole64. phys-bits=32 was for example one
> >>> of the test failures, and pci-hole64 sits above what 32-bit can reference.  
> >>
> >> if user sets phys-bits=32, then nothing above 4Gb should work (be usable)
> >> (including above-4g-ram, hotplug region or pci64 hole or sgx or cxl)
> >>
> >> and this doesn't look to me as AMD specific issue
> >>
> >> perhaps do a phys-bits check as a separate patch
> >> that will error out if max_used_gpa is above phys-bits limit
> >> (maybe at machine_done time)
> >> (i.e. defining max_gpa and checking if compatible with configured cpu
> >> are 2 different things)
> >>
> >> (it might be possible that tests need to be fixed too to account for it)
> >>  
> > 
> > My old notes (from v3) tell me with such a check these tests were exiting early thanks to
> > that error:
> > 
> >  1/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/qom-test               ERROR           0.07s
> >   killed by signal 6 SIGABRT
> >  4/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/test-hmp               ERROR           0.07s
> >   killed by signal 6 SIGABRT
> >  7/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/boot-serial-test       ERROR           0.07s
> >   killed by signal 6 SIGABRT
> > 44/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/test-x86-cpuid-compat  ERROR           0.09s
> >   killed by signal 6 SIGABRT
> > 45/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/numa-test              ERROR           0.17s
> >   killed by signal 6 SIGABRT
> > 
> > But the real reason these fail is not at all related to CPU phys bits,
> > but because we just don't handle the case where no pci_hole64 is supposed to exist (which
> > is what that other check is trying to do) e.g. A VM with -m 1G would
> > observe the same thing i.e. the computations after that conditional are all for the pci
> > hole64, which acounts for SGX/CXL/hotplug or etc which consequently means it's *errousnly*
> > bigger than phys-bits=32 (by definition). So the error_report is just telling me that
> > pc_max_used_gpa() is just incorrect without the !x86ms->above_4g_mem_size check.
> > 
> > If you're not fond of:
> > 
> > +    if (!x86ms->above_4g_mem_size) {
> > +       /*
> > +        * 32-bit pci hole goes from
> > +        * end-of-low-ram (@below_4g_mem_size) to IOAPIC.
> > +         */
> > +        return IO_APIC_DEFAULT_ADDRESS - 1;
> > +    }
> > 
> > Then what should I use instead of the above?
> > 
> > 'IO_APIC_DEFAULT_ADDRESS - 1' is the size of the 32-bit PCI hole, which is
> > also what is used for i440fx/q35 code. I could move it to a macro (e.g.
> > PCI_HOST_HOLE32_SIZE) to make it a bit readable and less hardcoded. Or
> > perhaps your problem is on !x86ms->above_4g_mem_size and maybe I should check
> > in addition for hotplug/CXL/etc existence?
> >   
> >>>>>  Unless we plan on using
> >>>>> pc_max_used_gpa() for something else other than this.    
> >>>>
> >>>> Even if '!above_4g_mem_sizem', we can still have hotpluggable memory region
> >>>> present and that can  hit 1Tb. The same goes for pci64_hole if it's configured
> >>>> large enough on CLI.
> >>>>     
> >>> So hotpluggable memory seems to assume it sits above 4g mem.
> >>>
> >>> pci_hole64 likewise as it uses similar computations as hotplug.
> >>>
> >>> Unless I am misunderstanding something here.
> >>>  
> >>>> Looks like guesstimate we could use is taking pci64_hole_end as max used GPA
> >>>>     
> >>> I think this was what I had before (v3[0]) and did not work.  
> >>
> >> that had been tied to host's phys-bits directly, all in one patch
> >> and duplicating existing pc_pci_hole64_start().
> >>    
> > 
> > Duplicating was sort of my bad attempt in this patch for pc_max_used_gpa()
> > 
> > I was sort of thinking to something like extracting calls to start + size "tuple" into
> > functions -- e.g. for hotplug it is pc_get_device_memory_range() and for CXL it would be
> > maybe pc_get_cxl_range()) -- rather than assuming those values are already initialized on
> > the memory-region @base and its size.
> > 
> > See snippet below. Note I am missing CXL handling, but gives you the idea.
> > 
> > But it is slightly more complex than what I had in this version :( and would require
> > anyone doing changes in pc_memory_init() and pc_pci_hole64_start() to make sure it follows
> > the similar logic.
> >   
> 
> Ignore previous snippet, here's a slightly cleaner version:

lets go with this version

> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 8eaa32ee2106..1d97c77a5eac 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -803,6 +803,43 @@ void xen_load_linux(PCMachineState *pcms)
>  #define PC_ROM_ALIGN       0x800
>  #define PC_ROM_SIZE        (PC_ROM_MAX - PC_ROM_MIN_VGA)
> 
> +static void pc_get_device_memory_range(PCMachineState *pcms,
> +                                       hwaddr *base,
> +                                       hwaddr *device_mem_size)
> +{
> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
> +    X86MachineState *x86ms = X86_MACHINE(pcms);
> +    MachineState *machine = MACHINE(pcms);
> +    hwaddr addr, size;
> +
> +    if (pcmc->has_reserved_memory &&
> +        machine->device_memory && machine->device_memory->base) {
> +        addr = machine->device_memory->base;
> +        size = memory_region_size(&machine->device_memory->mr);
> +        goto out;
> +    }
> +
> +    /* uninitialized memory region */
> +    size = machine->maxram_size - machine->ram_size;
> +
> +    if (pcms->sgx_epc.size != 0) {
> +        addr = sgx_epc_above_4g_end(&pcms->sgx_epc);
> +    } else {
> +        addr = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
> +    }
> +
> +    if (pcmc->enforce_aligned_dimm) {
> +        /* size device region assuming 1G page max alignment per slot */
> +        size += (1 * GiB) * machine->ram_slots;
> +    }
> +
> +out:
> +    if (base)
> +        *base = addr;
> +    if (device_mem_size)
> +        *device_mem_size = size;
> +}
> +
>  void pc_memory_init(PCMachineState *pcms,
>                      MemoryRegion *system_memory,
>                      MemoryRegion *rom_memory,
> @@ -864,7 +901,7 @@ void pc_memory_init(PCMachineState *pcms,
>      /* initialize device memory address space */
>      if (pcmc->has_reserved_memory &&
>          (machine->ram_size < machine->maxram_size)) {
> -        ram_addr_t device_mem_size = machine->maxram_size - machine->ram_size;
> +        ram_addr_t device_mem_size;
> 
>          if (machine->ram_slots > ACPI_MAX_RAM_SLOTS) {
>              error_report("unsupported amount of memory slots: %"PRIu64,
> @@ -879,20 +916,7 @@ void pc_memory_init(PCMachineState *pcms,
>              exit(EXIT_FAILURE);
>          }
> 
> -        if (pcms->sgx_epc.size != 0) {
> -            machine->device_memory->base = sgx_epc_above_4g_end(&pcms->sgx_epc);
> -        } else {
> -            machine->device_memory->base =
> -                x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
> -        }
> -
> -        machine->device_memory->base =
> -            ROUND_UP(machine->device_memory->base, 1 * GiB);
> -
> -        if (pcmc->enforce_aligned_dimm) {
> -            /* size device region assuming 1G page max alignment per slot */
> -            device_mem_size += (1 * GiB) * machine->ram_slots;
> -        }
> +        pc_get_device_memory_range(pcms, &machine->device_memory->base, &device_mem_size);
> 
>          if ((machine->device_memory->base + device_mem_size) <
>              device_mem_size) {
> @@ -965,12 +989,13 @@ uint64_t pc_pci_hole64_start(void)
>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>      MachineState *ms = MACHINE(pcms);
>      X86MachineState *x86ms = X86_MACHINE(pcms);
> -    uint64_t hole64_start = 0;
> +    uint64_t hole64_start = 0, size = 0;
> 
> -    if (pcmc->has_reserved_memory && ms->device_memory->base) {
> -        hole64_start = ms->device_memory->base;
> +    if (pcmc->has_reserved_memory &&
> +        (ms->ram_size < ms->maxram_size)) {
> +        pc_get_device_memory_range(pcms, &hole64_start, &size);
>          if (!pcmc->broken_reserved_end) {
> -            hole64_start += memory_region_size(&ms->device_memory->mr);
> +            hole64_start += size;
>          }
>      } else if (pcms->sgx_epc.size != 0) {
>              hole64_start = sgx_epc_above_4g_end(&pcms->sgx_epc);
> 


