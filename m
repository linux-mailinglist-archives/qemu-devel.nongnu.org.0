Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA6854E284
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 15:52:58 +0200 (CEST)
Received: from localhost ([::1]:51818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1pvd-0002Mw-TA
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 09:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o1pRg-0002S5-Gq
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 09:22:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o1pRe-0008Fc-NF
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 09:22:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655385718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OT0a4G5BpwHD4I40u6I4AcxmqxtVp2rBcaFIU3/Ub40=;
 b=GgE+137AbskFx9jEr8oyf0a2SyXUCZJyZhkCtZ9ffa5XbsJGFggQyb1rxVrWMZzYFTZdxs
 ibvBt3ZsUPGdePckXKtYtwB6VQi4/Xe1zxPRv7pkRMlmpf0RIhWvE/5gGDg0lhJh8yPdR1
 QvFbdzhEEfDUt//eXv+KCUeQhBqmL5s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516--ZYNiSxYPAm89AIHkuETuA-1; Thu, 16 Jun 2022 09:21:55 -0400
X-MC-Unique: -ZYNiSxYPAm89AIHkuETuA-1
Received: by mail-wm1-f71.google.com with SMTP id
 v125-20020a1cac83000000b0039c832fbd02so1144713wme.4
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 06:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OT0a4G5BpwHD4I40u6I4AcxmqxtVp2rBcaFIU3/Ub40=;
 b=z7E+lhYJe7rWZZEGssREfsrDVGvbosUlQgCMzdAVYkdBjrK0avafkfZ//d+mz/vPWX
 QUu8gN4cTwp341LK8GFZ/RSbkS1vAOopgYdELdkD5ByJejWw5mUYHgU4uruwcBCeryVh
 IqkyitlsMLSzHOS0oNfS9dEosunlz5rp4h632jtU+VgF6ul7AH2904ueGDIeKVjjzTq9
 /Q40abj+RJAnd67EaDzQ8JA8FWAWFKKWob4YW2SGPHV8wr37FSLhkZUoiPqOVTMZWLOu
 MiETdcTIfntuqHgWGzIYbUH44AQijXQptpdms+2WPScMmf7Ix6Th4HD5CZVN8N1ZKIIe
 rkag==
X-Gm-Message-State: AJIora+nb2dxWDjl+O9M9UvSxUeLTD96rLwMEdxtwifJ8NgDQ/pPMawc
 sTc8Ls1n3+ZGFsHPtV+zimHsUjRjmJJ3jl46RPi0avUKxFHszSU33kKVUOGKvit40vIIyDPvt8e
 vhtAHpEtZppCAfWg=
X-Received: by 2002:a5d:56d0:0:b0:21a:3101:93d8 with SMTP id
 m16-20020a5d56d0000000b0021a310193d8mr3962405wrw.406.1655385713839; 
 Thu, 16 Jun 2022 06:21:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vlAvSIJLCgwPdapgYHSLhmva8qCBN4Db1N3cJP0iCm2t2XULJgnZqIft+YN5BPehHh3EBLjA==
X-Received: by 2002:a5d:56d0:0:b0:21a:3101:93d8 with SMTP id
 m16-20020a5d56d0000000b0021a310193d8mr3962375wrw.406.1655385713562; 
 Thu, 16 Jun 2022 06:21:53 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 x1-20020adff0c1000000b002103cfd2fbasm1879253wro.65.2022.06.16.06.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 06:21:52 -0700 (PDT)
Date: Thu, 16 Jun 2022 15:21:51 +0200
From: "Reviewed-by: Igor Mammedov" <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>, Alex Williamson
 <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v5 2/5] i386/pc: create pci-host qdev prior to
 pc_memory_init()
Message-ID: <20220616152151.42d6140a@redhat.com>
In-Reply-To: <20220520104532.9816-3-joao.m.martins@oracle.com>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
 <20220520104532.9816-3-joao.m.martins@oracle.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Fri, 20 May 2022 11:45:29 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> At the start of pc_memory_init() we usually pass a range of
> 0..UINT64_MAX as pci_memory, when really its 2G (i440fx) or
> 32G (q35). To get the real user value, we need to get pci-host
> passed property for default pci_hole64_size. Thus to get that,
> create the qdev prior to memory init to better make estimations
> on max used/phys addr.
> 
> This is in preparation to determine that host-phys-bits are
> enough and also for pci-hole64-size to be considered to relocate
> ram-above-4g to be at 1T (on AMD platforms).

with comments below fixed
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>  hw/i386/pc_piix.c            | 5 ++++-
>  hw/i386/pc_q35.c             | 6 +++---
>  hw/pci-host/i440fx.c         | 3 +--
>  include/hw/pci-host/i440fx.h | 2 +-
>  4 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 578e537b3525..12d4a279c793 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -91,6 +91,7 @@ static void pc_init1(MachineState *machine,
>      MemoryRegion *pci_memory;
>      MemoryRegion *rom_memory;
>      ram_addr_t lowmem;
> +    DeviceState *i440fx_dev;
>  
>      /*
>       * Calculate ram split, for memory below and above 4G.  It's a bit
> @@ -164,9 +165,11 @@ static void pc_init1(MachineState *machine,
>          pci_memory = g_new(MemoryRegion, 1);
>          memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
>          rom_memory = pci_memory;
> +        i440fx_dev = qdev_new(host_type);
>      } else {
>          pci_memory = NULL;
>          rom_memory = system_memory;
> +        i440fx_dev = NULL;
>      }
>  
>      pc_guest_info_init(pcms);
> @@ -199,7 +202,7 @@ static void pc_init1(MachineState *machine,
>  
>          pci_bus = i440fx_init(host_type,
>                                pci_type,
> -                              &i440fx_state,
> +                              i440fx_dev, &i440fx_state,
confusing names, suggest to rename i440fx_state -> pci_i440fx and i440fx_dev -> i440fx_host
or something like this

>                                system_memory, system_io, machine->ram_size,
>                                x86ms->below_4g_mem_size,
>                                x86ms->above_4g_mem_size,
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 42eb8b97079a..8d867bdb274a 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -203,12 +203,12 @@ static void pc_q35_init(MachineState *machine)
>                              pcms->smbios_entry_point_type);
>      }
>  
> -    /* allocate ram and load rom/bios */
> -    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
> -
>      /* create pci host bus */
>      q35_host = Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
>  
> +    /* allocate ram and load rom/bios */
> +    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
> +
>      object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
>      object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
>                               OBJECT(ram_memory), NULL);
> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
> index e08716142b6e..5c1bab5c58ed 100644
> --- a/hw/pci-host/i440fx.c
> +++ b/hw/pci-host/i440fx.c
> @@ -238,6 +238,7 @@ static void i440fx_realize(PCIDevice *dev, Error **errp)
>  }
>  
>  PCIBus *i440fx_init(const char *host_type, const char *pci_type,

does it still need 'host_type'?

> +                    DeviceState *dev,
>                      PCII440FXState **pi440fx_state,
>                      MemoryRegion *address_space_mem,
>                      MemoryRegion *address_space_io,
> @@ -247,7 +248,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>                      MemoryRegion *pci_address_space,
>                      MemoryRegion *ram_memory)
>  {
> -    DeviceState *dev;
>      PCIBus *b;
>      PCIDevice *d;
>      PCIHostState *s;
> @@ -255,7 +255,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>      unsigned i;
>      I440FXState *i440fx;
>  
> -    dev = qdev_new(host_type);
>      s = PCI_HOST_BRIDGE(dev);
>      b = pci_root_bus_new(dev, NULL, pci_address_space,
>                           address_space_io, 0, TYPE_PCI_BUS);
> diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
> index f068aaba8fda..c4710445e30a 100644
> --- a/include/hw/pci-host/i440fx.h
> +++ b/include/hw/pci-host/i440fx.h
> @@ -36,7 +36,7 @@ struct PCII440FXState {
>  #define TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE "igd-passthrough-i440FX"
>  
>  PCIBus *i440fx_init(const char *host_type, const char *pci_type,
> -                    PCII440FXState **pi440fx_state,
> +                    DeviceState *dev, PCII440FXState **pi440fx_state,
>                      MemoryRegion *address_space_mem,
>                      MemoryRegion *address_space_io,
>                      ram_addr_t ram_size,


