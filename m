Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB2A68AF7E
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 12:22:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOd5l-0004qu-LO; Sun, 05 Feb 2023 06:21:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOd5k-0004qe-C2
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 06:21:52 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOd5i-0001XP-6o
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 06:21:52 -0500
Received: by mail-ej1-x633.google.com with SMTP id ml19so27022587ejb.0
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 03:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GNAEaZLtwAbTkChkEqgBoxVxVosszRWoGfyRiwK5N0w=;
 b=CiMrowlxF/UaKddtAEWqKjccYZXl1lgof8f6ENSCGbZf3tcARsfBHm5sCHzxJDqeyn
 xQU2nxAFkvpHSOqJT6g1X44gXnjSTUEWa+6NL8OMYPdYSig1j5skR2n9OZkCXoqJDahe
 lXDbJ5u8ssqpS0h4mb1e4ke151x2PEtg9ZqOfnoBe21HwTly/vLSxJXk5EOw48GDhVzO
 KaOczsYULa4ABrgegGOqDNlWJmr+ZJIEx7Olo90rDJtDf9NkhNcj7atpFdqFBi4VvcsJ
 cVVmAFUNgiGt4eIhL0/tXcZeCDzWtMQDlsZFGvTINv8yiNM2Eo7DKt63PSbtNDG3oAcR
 QCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GNAEaZLtwAbTkChkEqgBoxVxVosszRWoGfyRiwK5N0w=;
 b=N0eWyXkydS5US7NP2k+QvKDskm92cEAPolUVLie1XYwNGXVjTkYGer/aZggxHYqv/M
 kRt98WjjB6nclN67wA0UNTN8OVPqPf9Z3k7PkwgYktXoTdt2OYR/S8Wa0C9WPfg3OEC3
 otpxtCh5c7TMsiX6h1tNzVJdU8BaOxr6bN90iZLKSkCGDQ0xdFGHI3OlmkkLMGzGTenn
 FhhQeCVglDz+EnKIAmU9Kbnci2VYv7cFkBsKmoOw7ukOwnW9hpGDUE8J1Q4Xrsf9IOZG
 ws93vAQ8jg9ULnJExFS2Y26RUebET+x1hTxLqrScH7m1IrJKz989S1Gnh6rbjd7MIwnb
 BIOA==
X-Gm-Message-State: AO0yUKUhV0/J8Eej/sL+VJVc+ih8Ow7VGWCAhXsC/H3VHlR1dmDD+6sT
 9eiKpbhRjV5xNfZ8kTa/8gypDg==
X-Google-Smtp-Source: AK7set8ih66PcDu7PwDV5Owqe0BkY/hUu9sORqne6saJtf0IZUpP4hQdxkIHoqXOBjg3PCQhMujEZQ==
X-Received: by 2002:a17:907:c20c:b0:883:3661:97e5 with SMTP id
 ti12-20020a170907c20c00b00883366197e5mr16335906ejc.50.1675596108350; 
 Sun, 05 Feb 2023 03:21:48 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a1709060a4a00b00880dbd4b6d4sm3995064ejf.136.2023.02.05.03.21.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 03:21:47 -0800 (PST)
Message-ID: <10bf125e-85a4-72cc-07de-0d6206941f62@linaro.org>
Date: Sun, 5 Feb 2023 12:21:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 8/9] hw/i386/x86: Make TYPE_X86_MACHINE the owner of
 smram
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
References: <20230204151027.39007-1-shentey@gmail.com>
 <20230204151027.39007-9-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230204151027.39007-9-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/2/23 16:10, Bernhard Beschow wrote:
> Treat the smram MemoryRegion analoguous to other memory regions such as
> ram, pci, io, ... , making the used memory regions more explicit when
> instantiating q35 or i440fx.
> 
> Note that the q35 device uses these memory regions only during the
> realize phase which suggests that it shouldn't be the owner of smram.

Few years ago I tried something similar and it wasn't accepted because
the MR owner name is used in the migration stream, so this was breaking
migrating from older machines.

Adding David/Juan for double-checking that.

> i440fx activates/deactivates the whole smram memory region depending on
> the SMRAM_G_SMRAME bit which seems wrong since it should only handle the
> 128kb region. If this got changed, i440fx would also only use smram
> during its realize phase.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/i386/x86.h        |  2 ++
>   include/hw/pci-host/i440fx.h |  7 ++++---
>   include/hw/pci-host/q35.h    |  4 +++-
>   hw/i386/pc_piix.c            |  2 +-
>   hw/i386/pc_q35.c             |  2 ++
>   hw/i386/x86.c                |  4 ++++
>   hw/pci-host/i440fx.c         | 13 +++++--------
>   hw/pci-host/q35.c            | 17 ++++++++---------
>   8 files changed, 29 insertions(+), 22 deletions(-)
> 
> diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
> index 62fa5774f8..ba6912b721 100644
> --- a/include/hw/i386/x86.h
> +++ b/include/hw/i386/x86.h
> @@ -59,6 +59,8 @@ struct X86MachineState {
>       /* Start address of the initial RAM above 4G */
>       uint64_t above_4g_mem_start;
>   
> +    MemoryRegion smram;
> +
>       /* CPU and apic information: */
>       bool apic_xrupt_override;
>       unsigned pci_irq_mask;
> diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
> index bf57216c78..e9efdb3c5f 100644
> --- a/include/hw/pci-host/i440fx.h
> +++ b/include/hw/pci-host/i440fx.h
> @@ -28,9 +28,10 @@ struct PCII440FXState {
>       MemoryRegion *system_memory;
>       MemoryRegion *pci_address_space;
>       MemoryRegion *ram_memory;
> +    MemoryRegion *smram;
>       PAMMemoryRegion pam_regions[PAM_REGIONS_COUNT];
>       MemoryRegion smram_region;
> -    MemoryRegion smram, low_smram;
> +    MemoryRegion low_smram;
>   };
>   
>   #define TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE "igd-passthrough-i440FX"
> @@ -43,7 +44,7 @@ PCIBus *i440fx_init(const char *pci_type,
>                       ram_addr_t below_4g_mem_size,
>                       ram_addr_t above_4g_mem_size,
>                       MemoryRegion *pci_memory,
> -                    MemoryRegion *ram_memory);
> -
> +                    MemoryRegion *ram_memory,
> +                    MemoryRegion *smram);
>   
>   #endif
> diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
> index e89329c51e..fcbe57b42d 100644
> --- a/include/hw/pci-host/q35.h
> +++ b/include/hw/pci-host/q35.h
> @@ -44,9 +44,10 @@ struct MCHPCIState {
>       MemoryRegion *pci_address_space;
>       MemoryRegion *system_memory;
>       MemoryRegion *address_space_io;
> +    MemoryRegion *smram;
>       PAMMemoryRegion pam_regions[PAM_REGIONS_COUNT];
>       MemoryRegion smram_region, open_high_smram;
> -    MemoryRegion smram, low_smram, high_smram;
> +    MemoryRegion low_smram, high_smram;
>       MemoryRegion tseg_blackhole, tseg_window;
>       MemoryRegion smbase_blackhole, smbase_window;
>       bool has_smram_at_smbase;
> @@ -75,6 +76,7 @@ struct Q35PCIHost {
>    */
>   
>   #define MCH_HOST_PROP_RAM_MEM "ram-mem"
> +#define MCH_HOST_PROP_SMRAM_MEM "smram-mem"
>   #define MCH_HOST_PROP_PCI_MEM "pci-mem"
>   #define MCH_HOST_PROP_SYSTEM_MEM "system-mem"
>   #define MCH_HOST_PROP_IO_MEM "io-mem"
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 00ba725656..41aaaa5465 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -228,7 +228,7 @@ static void pc_init1(MachineState *machine,
>                                 system_memory, system_io, machine->ram_size,
>                                 x86ms->below_4g_mem_size,
>                                 x86ms->above_4g_mem_size,
> -                              pci_memory, ram_memory);
> +                              pci_memory, ram_memory, &x86ms->smram);
>           pci_bus_map_irqs(pci_bus,
>                            xen_enabled() ? xen_pci_slot_get_pirq
>                                          : pc_pci_slot_get_pirq);
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 88f0981f50..480226de2c 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -221,6 +221,8 @@ static void pc_q35_init(MachineState *machine)
>       object_property_add_child(OBJECT(machine), "q35", OBJECT(q35_host));
>       object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
>                                OBJECT(ram_memory), NULL);
> +    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_SMRAM_MEM,
> +                             OBJECT(&x86ms->smram), NULL);
>       object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_PCI_MEM,
>                                OBJECT(pci_memory), NULL);
>       object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_SYSTEM_MEM,
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index eaff4227bd..d7e219b1eb 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -1436,6 +1436,10 @@ static void x86_machine_initfn(Object *obj)
>       x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
>       x86ms->bus_lock_ratelimit = 0;
>       x86ms->above_4g_mem_start = 4 * GiB;
> +
> +    memory_region_init(&x86ms->smram, obj, "smram", 4 * GiB);
> +    memory_region_set_enabled(&x86ms->smram, true);
> +    object_property_add_const_link(obj, "smram", OBJECT(&x86ms->smram));
>   }
>   
>   static void x86_machine_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
> index 61e7b97ff4..8f4a4f59a6 100644
> --- a/hw/pci-host/i440fx.c
> +++ b/hw/pci-host/i440fx.c
> @@ -23,7 +23,6 @@
>    */
>   
>   #include "qemu/osdep.h"
> -#include "qemu/units.h"
>   #include "qemu/range.h"
>   #include "hw/i386/pc.h"
>   #include "hw/pci/pci.h"
> @@ -77,7 +76,7 @@ static void i440fx_update_memory_mappings(PCII440FXState *d)
>       }
>       memory_region_set_enabled(&d->smram_region,
>                                 !(pd->config[I440FX_SMRAM] & SMRAM_D_OPEN));
> -    memory_region_set_enabled(&d->smram,
> +    memory_region_set_enabled(d->smram,
>                                 pd->config[I440FX_SMRAM] & SMRAM_G_SMRAME);
>       memory_region_transaction_commit();
>   }
> @@ -246,7 +245,8 @@ PCIBus *i440fx_init(const char *pci_type,
>                       ram_addr_t below_4g_mem_size,
>                       ram_addr_t above_4g_mem_size,
>                       MemoryRegion *pci_address_space,
> -                    MemoryRegion *ram_memory)
> +                    MemoryRegion *ram_memory,
> +                    MemoryRegion *smram)
>   {
>       PCIBus *b;
>       PCIDevice *d;
> @@ -267,6 +267,7 @@ PCIBus *i440fx_init(const char *pci_type,
>       f->system_memory = address_space_mem;
>       f->pci_address_space = pci_address_space;
>       f->ram_memory = ram_memory;
> +    f->smram = smram;
>   
>       i440fx = I440FX_PCI_HOST_BRIDGE(dev);
>       range_set_bounds(&i440fx->pci_hole, below_4g_mem_size,
> @@ -283,14 +284,10 @@ PCIBus *i440fx_init(const char *pci_type,
>       memory_region_set_enabled(&f->smram_region, true);
>   
>       /* smram, as seen by SMM CPUs */
> -    memory_region_init(&f->smram, OBJECT(d), "smram", 4 * GiB);
> -    memory_region_set_enabled(&f->smram, true);
>       memory_region_init_alias(&f->low_smram, OBJECT(d), "smram-low",
>                                f->ram_memory, 0xa0000, 0x20000);
>       memory_region_set_enabled(&f->low_smram, true);
> -    memory_region_add_subregion(&f->smram, 0xa0000, &f->low_smram);
> -    object_property_add_const_link(qdev_get_machine(), "smram",
> -                                   OBJECT(&f->smram));
> +    memory_region_add_subregion(f->smram, 0xa0000, &f->low_smram);
>   
>       init_pam(&f->pam_regions[0], OBJECT(d), f->ram_memory, f->system_memory,
>                f->pci_address_space, PAM_BIOS_BASE, PAM_BIOS_SIZE);
> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
> index fd18920e7f..83f2a98c71 100644
> --- a/hw/pci-host/q35.c
> +++ b/hw/pci-host/q35.c
> @@ -246,6 +246,10 @@ static void q35_host_initfn(Object *obj)
>                                (Object **) &s->mch.ram_memory,
>                                qdev_prop_allow_set_link_before_realize, 0);
>   
> +    object_property_add_link(obj, MCH_HOST_PROP_SMRAM_MEM, TYPE_MEMORY_REGION,
> +                             (Object **) &s->mch.smram,
> +                             qdev_prop_allow_set_link_before_realize, 0);
> +
>       object_property_add_link(obj, MCH_HOST_PROP_PCI_MEM, TYPE_MEMORY_REGION,
>                                (Object **) &s->mch.pci_address_space,
>                                qdev_prop_allow_set_link_before_realize, 0);
> @@ -594,19 +598,17 @@ static void mch_realize(PCIDevice *d, Error **errp)
>       memory_region_set_enabled(&mch->open_high_smram, false);
>   
>       /* smram, as seen by SMM CPUs */
> -    memory_region_init(&mch->smram, OBJECT(mch), "smram", 4 * GiB);
> -    memory_region_set_enabled(&mch->smram, true);
>       memory_region_init_alias(&mch->low_smram, OBJECT(mch), "smram-low",
>                                mch->ram_memory, MCH_HOST_BRIDGE_SMRAM_C_BASE,
>                                MCH_HOST_BRIDGE_SMRAM_C_SIZE);
>       memory_region_set_enabled(&mch->low_smram, true);
> -    memory_region_add_subregion(&mch->smram, MCH_HOST_BRIDGE_SMRAM_C_BASE,
> +    memory_region_add_subregion(mch->smram, MCH_HOST_BRIDGE_SMRAM_C_BASE,
>                                   &mch->low_smram);
>       memory_region_init_alias(&mch->high_smram, OBJECT(mch), "smram-high",
>                                mch->ram_memory, MCH_HOST_BRIDGE_SMRAM_C_BASE,
>                                MCH_HOST_BRIDGE_SMRAM_C_SIZE);
>       memory_region_set_enabled(&mch->high_smram, true);
> -    memory_region_add_subregion(&mch->smram, 0xfeda0000, &mch->high_smram);
> +    memory_region_add_subregion(mch->smram, 0xfeda0000, &mch->high_smram);
>   
>       memory_region_init_io(&mch->tseg_blackhole, OBJECT(mch),
>                             &blackhole_ops, NULL,
> @@ -619,7 +621,7 @@ static void mch_realize(PCIDevice *d, Error **errp)
>       memory_region_init_alias(&mch->tseg_window, OBJECT(mch), "tseg-window",
>                                mch->ram_memory, mch->below_4g_mem_size, 0);
>       memory_region_set_enabled(&mch->tseg_window, false);
> -    memory_region_add_subregion(&mch->smram, mch->below_4g_mem_size,
> +    memory_region_add_subregion(mch->smram, mch->below_4g_mem_size,
>                                   &mch->tseg_window);
>   
>       /*
> @@ -639,12 +641,9 @@ static void mch_realize(PCIDevice *d, Error **errp)
>                                MCH_HOST_BRIDGE_SMBASE_ADDR,
>                                MCH_HOST_BRIDGE_SMBASE_SIZE);
>       memory_region_set_enabled(&mch->smbase_window, false);
> -    memory_region_add_subregion(&mch->smram, MCH_HOST_BRIDGE_SMBASE_ADDR,
> +    memory_region_add_subregion(mch->smram, MCH_HOST_BRIDGE_SMBASE_ADDR,
>                                   &mch->smbase_window);
>   
> -    object_property_add_const_link(qdev_get_machine(), "smram",
> -                                   OBJECT(&mch->smram));
> -
>       init_pam(&mch->pam_regions[0], OBJECT(mch), mch->ram_memory,
>                mch->system_memory, mch->pci_address_space,
>                PAM_BIOS_BASE, PAM_BIOS_SIZE);


