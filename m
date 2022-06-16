Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5757A54E243
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 15:43:11 +0200 (CEST)
Received: from localhost ([::1]:33760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1pmA-0006RO-Cd
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 09:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o1pZx-0007sv-BL
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 09:30:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o1pZt-0001Xf-TT
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 09:30:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655386228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EwKkFuIUqtrkUkMCFDmnhpt3F8SeXl6JPq1spdZ6un8=;
 b=gge/ri8jC0p+PjlAGABQOV+vnp3ldPjMw5Og1RYf5L5rixwdNFvTyv3KfEIWNEj367EP/u
 90dg7uGMWfS5cZmfSNQu6sOnpfv7Gs1u0dM9wk6K9Z7WFJ4kRla37GHLFinC2+1BvG6GY8
 UXDnFE3SQbuur5qZB83WlqCSMQjh+dY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-3wnwRdYPMRSEJrULq2xUnQ-1; Thu, 16 Jun 2022 09:30:18 -0400
X-MC-Unique: 3wnwRdYPMRSEJrULq2xUnQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 c7-20020adfa707000000b002184d715e69so255943wrd.10
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 06:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EwKkFuIUqtrkUkMCFDmnhpt3F8SeXl6JPq1spdZ6un8=;
 b=R4Y//PnVYT709v9uT2aIq/dRl/qXHBxW0Eq8HSuikJDiG8QJmzNXdEwZrUiRkfKdqT
 Qk7myoS47C/f1C6GX5NpT51j3cpdLX7TLQvm9pUglr9CKNsXh79H3CnaHMNHxO3IlySx
 2MtFt785B7N1C6HaqPGsX94jEFIgMozUbgn856D16p02NhPiP1CiRiQjL9Qm0RBzzMTV
 +ynGHGnBtORwI700hXWvNZOWzrJWZWEpRKqXcZE20VSGw17FIBs442c2R+tMmA4+sFOI
 Pd+JIfgrzf6e5qsQ2ChKphw8ZRO0xwah2g8RZfiBxF5k9AWx8wRUgz3lm6IR89qzoT+U
 gPQQ==
X-Gm-Message-State: AOAM532h/g5s1WE4CNYFTp+Qyou+DWfZwiQHrBQtuK7hXPVJsx2xfY0I
 84Do/y9btx57wrXyhvzUDaIXgCrqPBmfGD6p99/dbrQmZkU5PQE76dKGbECLGvizuev09cKQaIK
 hZ1GmSzxD2q5zewo=
X-Received: by 2002:a1c:4c0d:0:b0:39c:5233:1873 with SMTP id
 z13-20020a1c4c0d000000b0039c52331873mr15913909wmf.28.1655386216671; 
 Thu, 16 Jun 2022 06:30:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6oScpxaEJDX/QVs3VZAk3EqHgw30udFvtLxZH2C7Q8cKKmvk+qJ6OdAlNfFVkXSbWahyg3A==
X-Received: by 2002:a1c:4c0d:0:b0:39c:5233:1873 with SMTP id
 z13-20020a1c4c0d000000b0039c52331873mr15913878wmf.28.1655386216454; 
 Thu, 16 Jun 2022 06:30:16 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a1c4d0a000000b003942a244ee6sm2298977wmh.43.2022.06.16.06.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 06:30:15 -0700 (PDT)
Date: Thu, 16 Jun 2022 15:30:14 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>, Alex Williamson
 <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v5 3/5] i386/pc: pass pci_hole64_size to pc_memory_init()
Message-ID: <20220616153014.1aa4d16b@redhat.com>
In-Reply-To: <20220520104532.9816-4-joao.m.martins@oracle.com>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
 <20220520104532.9816-4-joao.m.martins@oracle.com>
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

On Fri, 20 May 2022 11:45:30 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> Use the pre-initialized pci-host qdev and fetch the
> pci-hole64-size into pc_memory_init() newly added argument.
> piix needs a bit of care given all the !pci_enabled()
> and that the pci_hole64_size is private to i440fx.
> 
> This is in preparation to determine that host-phys-bits are
> enough and for pci-hole64-size to be considered to relocate
> ram-above-4g to be at 1T (on AMD platforms).

modulo nit blow

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>  hw/i386/pc.c                 | 3 ++-
>  hw/i386/pc_piix.c            | 5 ++++-
>  hw/i386/pc_q35.c             | 8 +++++++-
>  hw/pci-host/i440fx.c         | 7 +++++++
>  include/hw/i386/pc.h         | 3 ++-
>  include/hw/pci-host/i440fx.h | 1 +
>  6 files changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index f7da1d5dd40d..af52d4ff89ef 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -799,7 +799,8 @@ void xen_load_linux(PCMachineState *pcms)
>  void pc_memory_init(PCMachineState *pcms,
>                      MemoryRegion *system_memory,
>                      MemoryRegion *rom_memory,
> -                    MemoryRegion **ram_memory)
> +                    MemoryRegion **ram_memory,
> +                    uint64_t pci_hole64_size)
>  {
>      int linux_boot, i;
>      MemoryRegion *option_rom_mr;
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 12d4a279c793..57bb5b8f2aea 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -91,6 +91,7 @@ static void pc_init1(MachineState *machine,
>      MemoryRegion *pci_memory;
>      MemoryRegion *rom_memory;
>      ram_addr_t lowmem;
> +    uint64_t hole64_size;

init it to 0 right here to avoid chance of run amok uninitialized variable?

>      DeviceState *i440fx_dev;
>  
>      /*
> @@ -166,10 +167,12 @@ static void pc_init1(MachineState *machine,
>          memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
>          rom_memory = pci_memory;
>          i440fx_dev = qdev_new(host_type);
> +        hole64_size = i440fx_pci_hole64_size(i440fx_dev);
>      } else {
>          pci_memory = NULL;
>          rom_memory = system_memory;
>          i440fx_dev = NULL;
> +        hole64_size = 0;
>      }
>  
>      pc_guest_info_init(pcms);
> @@ -186,7 +189,7 @@ static void pc_init1(MachineState *machine,
>      /* allocate ram and load rom/bios */
>      if (!xen_enabled()) {
>          pc_memory_init(pcms, system_memory,
> -                       rom_memory, &ram_memory);
> +                       rom_memory, &ram_memory, hole64_size);
>      } else {
>          pc_system_flash_cleanup_unused(pcms);
>          if (machine->kernel_filename != NULL) {
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 8d867bdb274a..4d5c2fbd976b 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -138,6 +138,7 @@ static void pc_q35_init(MachineState *machine)
>      MachineClass *mc = MACHINE_GET_CLASS(machine);
>      bool acpi_pcihp;
>      bool keep_pci_slot_hpc;
> +    uint64_t pci_hole64_size = 0;
>  
>      /* Check whether RAM fits below 4G (leaving 1/2 GByte for IO memory
>       * and 256 Mbytes for PCI Express Enhanced Configuration Access Mapping
> @@ -206,8 +207,13 @@ static void pc_q35_init(MachineState *machine)
>      /* create pci host bus */
>      q35_host = Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
>  
> +    if (pcmc->pci_enabled) {
> +        pci_hole64_size = q35_host->mch.pci_hole64_size;
> +    }
> +
>      /* allocate ram and load rom/bios */
> -    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
> +    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory,
> +                   pci_hole64_size);
>  
>      object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
>      object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
> index 5c1bab5c58ed..c5cc28250d5c 100644
> --- a/hw/pci-host/i440fx.c
> +++ b/hw/pci-host/i440fx.c
> @@ -237,6 +237,13 @@ static void i440fx_realize(PCIDevice *dev, Error **errp)
>      }
>  }
>  
> +uint64_t i440fx_pci_hole64_size(DeviceState *i440fx_dev)
> +{
> +        I440FXState *i440fx = I440FX_PCI_HOST_BRIDGE(i440fx_dev);
> +
> +        return i440fx->pci_hole64_size;
> +}
> +
>  PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>                      DeviceState *dev,
>                      PCII440FXState **pi440fx_state,
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index ffcac5121ed9..9c847faea2f8 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -158,7 +158,8 @@ void xen_load_linux(PCMachineState *pcms);
>  void pc_memory_init(PCMachineState *pcms,
>                      MemoryRegion *system_memory,
>                      MemoryRegion *rom_memory,
> -                    MemoryRegion **ram_memory);
> +                    MemoryRegion **ram_memory,
> +                    uint64_t pci_hole64_size);
>  uint64_t pc_pci_hole64_start(void);
>  DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
>  void pc_basic_device_init(struct PCMachineState *pcms,
> diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
> index c4710445e30a..1299d6a2b0e4 100644
> --- a/include/hw/pci-host/i440fx.h
> +++ b/include/hw/pci-host/i440fx.h
> @@ -45,5 +45,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>                      MemoryRegion *pci_memory,
>                      MemoryRegion *ram_memory);
>  
> +uint64_t i440fx_pci_hole64_size(DeviceState *i440fx_dev);
>  
>  #endif


