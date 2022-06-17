Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9729154F73C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 14:08:26 +0200 (CEST)
Received: from localhost ([::1]:53046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2Alz-0001QS-RE
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 08:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o2Acx-00047K-5R
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 07:59:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o2Acu-00021V-2M
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 07:59:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655467139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1jRmDBr9CG8QSE6+FDOMMC231GjUO5oum4FprSAqL1k=;
 b=JcxCfc001XP20v8HTOzdlXrKTC4Ve3UCg2gSh3UYq2au9j2LbOgG142B6alCAa+2hUnbZJ
 wM56VQ/foBODadR4fQz51V6jby1ZNSop/llLl6pkvR6gSJK1SP/IASb0bOlhSY1b8lMT/d
 1IEJdemyKcMvQn9pJst3i6CPHT1u3Os=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-BVNWOt4SNnaqJOQwxb9csw-1; Fri, 17 Jun 2022 07:58:57 -0400
X-MC-Unique: BVNWOt4SNnaqJOQwxb9csw-1
Received: by mail-wm1-f71.google.com with SMTP id
 o2-20020a05600c510200b0039747b0216fso2646516wms.0
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 04:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1jRmDBr9CG8QSE6+FDOMMC231GjUO5oum4FprSAqL1k=;
 b=JgGeXiDVX8rDy57AiNk6JX0N+5ZhHdAtvH4GgXNq+/ifEiK00GZ/K6/l2GX0Q5Lqqy
 qMvxVxxDHo1mfv/ASOG8WedqaN2x3OcWyYZnSnWGOlSE3mWNnL2ZiTZP54V/Z6Qd6RsE
 vMWPrlGExWE/Z/ZzzYr6/1HAyJiupQde1BtvBtwa5uKxZKk1J2q5YNBqdkjQC/LEIa8B
 1BSgro2zaYhjNeHahcimY6+iWgp3O+dzvLYVctSR7j/0IPF1WamArawqoOHwkxcGZune
 X25gGm+1rSO6ZCY4JR0T81jNjgTez+t437jU5PwDevkztBie6SvN4+wW9MbKyDhSfPip
 rYhg==
X-Gm-Message-State: AJIora9zkkI6JwOFztCgXt1jNehmrOG6LKfNI73pSB4zWZvedwE2AuoE
 dV6zPhhJAbFW9b6ZZlw+UXFwLKJTKXu8XKEKXKuKsZkAEJZsIdr4w4P77N7O9wnXMAeBR7EGdrw
 rpVhzr2G95PyaDJI=
X-Received: by 2002:a05:6000:170e:b0:218:3fe0:7c72 with SMTP id
 n14-20020a056000170e00b002183fe07c72mr9346247wrc.572.1655467136504; 
 Fri, 17 Jun 2022 04:58:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vroEWqWAWoTmBE1oTSKuIh3zDIYe4vyvl3SUXO+goxHQ7FzmwgTN4U+zEorhaYCVwgkvgbGw==
X-Received: by 2002:a05:6000:170e:b0:218:3fe0:7c72 with SMTP id
 n14-20020a056000170e00b002183fe07c72mr9346228wrc.572.1655467136298; 
 Fri, 17 Jun 2022 04:58:56 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 j27-20020a05600c1c1b00b0039c1396b495sm5596997wms.9.2022.06.17.04.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 04:58:55 -0700 (PDT)
Date: Fri, 17 Jun 2022 13:58:54 +0200
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
Message-ID: <20220617135854.13ec05d7@redhat.com>
In-Reply-To: <1f1cc9dc-a077-0fd8-0ac1-caf38bf8fc66@oracle.com>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
 <20220520104532.9816-4-joao.m.martins@oracle.com>
 <20220616153014.1aa4d16b@redhat.com>
 <1f1cc9dc-a077-0fd8-0ac1-caf38bf8fc66@oracle.com>
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

On Fri, 17 Jun 2022 12:13:45 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 6/16/22 14:30, Igor Mammedov wrote:
> > On Fri, 20 May 2022 11:45:30 +0100
> > Joao Martins <joao.m.martins@oracle.com> wrote:
> >   
> >> Use the pre-initialized pci-host qdev and fetch the
> >> pci-hole64-size into pc_memory_init() newly added argument.
> >> piix needs a bit of care given all the !pci_enabled()
> >> and that the pci_hole64_size is private to i440fx.
> >>
> >> This is in preparation to determine that host-phys-bits are
> >> enough and for pci-hole64-size to be considered to relocate
> >> ram-above-4g to be at 1T (on AMD platforms).  
> > 
> > modulo nit blow
> > 
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> >   
> 
> I haven't tackled the initialization nit below but I would assume
> you agree with the rest of the patch. Let me know if I should still
> add the Rb tag.

My ack still stands
 
> >>
> >> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> >> ---
> >>  hw/i386/pc.c                 | 3 ++-
> >>  hw/i386/pc_piix.c            | 5 ++++-
> >>  hw/i386/pc_q35.c             | 8 +++++++-
> >>  hw/pci-host/i440fx.c         | 7 +++++++
> >>  include/hw/i386/pc.h         | 3 ++-
> >>  include/hw/pci-host/i440fx.h | 1 +
> >>  6 files changed, 23 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> >> index f7da1d5dd40d..af52d4ff89ef 100644
> >> --- a/hw/i386/pc.c
> >> +++ b/hw/i386/pc.c
> >> @@ -799,7 +799,8 @@ void xen_load_linux(PCMachineState *pcms)
> >>  void pc_memory_init(PCMachineState *pcms,
> >>                      MemoryRegion *system_memory,
> >>                      MemoryRegion *rom_memory,
> >> -                    MemoryRegion **ram_memory)
> >> +                    MemoryRegion **ram_memory,
> >> +                    uint64_t pci_hole64_size)
> >>  {
> >>      int linux_boot, i;
> >>      MemoryRegion *option_rom_mr;
> >> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> >> index 12d4a279c793..57bb5b8f2aea 100644
> >> --- a/hw/i386/pc_piix.c
> >> +++ b/hw/i386/pc_piix.c
> >> @@ -91,6 +91,7 @@ static void pc_init1(MachineState *machine,
> >>      MemoryRegion *pci_memory;
> >>      MemoryRegion *rom_memory;
> >>      ram_addr_t lowmem;
> >> +    uint64_t hole64_size;  
> > 
> > init it to 0 right here to avoid chance of run amok uninitialized variable?
> >   
> I haven't done this given that mst disagreed, plus the fact that the code style of
> the function seems to place the NULL initialization mostly left to else conditional
> clause. Part of the reason I haven't inited @i440fx_dev to NULL here as well (now
> i440fx_host. The location we use hole64_size is also the same location we are using
> @i440fx_host.
> 
> >>      DeviceState *i440fx_dev;
> >>  
> >>      /*
> >> @@ -166,10 +167,12 @@ static void pc_init1(MachineState *machine,
> >>          memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
> >>          rom_memory = pci_memory;
> >>          i440fx_dev = qdev_new(host_type);
> >> +        hole64_size = i440fx_pci_hole64_size(i440fx_dev);
> >>      } else {
> >>          pci_memory = NULL;
> >>          rom_memory = system_memory;
> >>          i440fx_dev = NULL;
> >> +        hole64_size = 0;
> >>      }
> >>  
> >>      pc_guest_info_init(pcms);
> >> @@ -186,7 +189,7 @@ static void pc_init1(MachineState *machine,
> >>      /* allocate ram and load rom/bios */
> >>      if (!xen_enabled()) {
> >>          pc_memory_init(pcms, system_memory,
> >> -                       rom_memory, &ram_memory);
> >> +                       rom_memory, &ram_memory, hole64_size);
> >>      } else {
> >>          pc_system_flash_cleanup_unused(pcms);
> >>          if (machine->kernel_filename != NULL) {
> >> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> >> index 8d867bdb274a..4d5c2fbd976b 100644
> >> --- a/hw/i386/pc_q35.c
> >> +++ b/hw/i386/pc_q35.c
> >> @@ -138,6 +138,7 @@ static void pc_q35_init(MachineState *machine)
> >>      MachineClass *mc = MACHINE_GET_CLASS(machine);
> >>      bool acpi_pcihp;
> >>      bool keep_pci_slot_hpc;
> >> +    uint64_t pci_hole64_size = 0;
> >>  
> >>      /* Check whether RAM fits below 4G (leaving 1/2 GByte for IO memory
> >>       * and 256 Mbytes for PCI Express Enhanced Configuration Access Mapping
> >> @@ -206,8 +207,13 @@ static void pc_q35_init(MachineState *machine)
> >>      /* create pci host bus */
> >>      q35_host = Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
> >>  
> >> +    if (pcmc->pci_enabled) {
> >> +        pci_hole64_size = q35_host->mch.pci_hole64_size;
> >> +    }
> >> +
> >>      /* allocate ram and load rom/bios */
> >> -    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
> >> +    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory,
> >> +                   pci_hole64_size);
> >>  
> >>      object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
> >>      object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
> >> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
> >> index 5c1bab5c58ed..c5cc28250d5c 100644
> >> --- a/hw/pci-host/i440fx.c
> >> +++ b/hw/pci-host/i440fx.c
> >> @@ -237,6 +237,13 @@ static void i440fx_realize(PCIDevice *dev, Error **errp)
> >>      }
> >>  }
> >>  
> >> +uint64_t i440fx_pci_hole64_size(DeviceState *i440fx_dev)
> >> +{
> >> +        I440FXState *i440fx = I440FX_PCI_HOST_BRIDGE(i440fx_dev);
> >> +
> >> +        return i440fx->pci_hole64_size;
> >> +}
> >> +
> >>  PCIBus *i440fx_init(const char *host_type, const char *pci_type,
> >>                      DeviceState *dev,
> >>                      PCII440FXState **pi440fx_state,
> >> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> >> index ffcac5121ed9..9c847faea2f8 100644
> >> --- a/include/hw/i386/pc.h
> >> +++ b/include/hw/i386/pc.h
> >> @@ -158,7 +158,8 @@ void xen_load_linux(PCMachineState *pcms);
> >>  void pc_memory_init(PCMachineState *pcms,
> >>                      MemoryRegion *system_memory,
> >>                      MemoryRegion *rom_memory,
> >> -                    MemoryRegion **ram_memory);
> >> +                    MemoryRegion **ram_memory,
> >> +                    uint64_t pci_hole64_size);
> >>  uint64_t pc_pci_hole64_start(void);
> >>  DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
> >>  void pc_basic_device_init(struct PCMachineState *pcms,
> >> diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
> >> index c4710445e30a..1299d6a2b0e4 100644
> >> --- a/include/hw/pci-host/i440fx.h
> >> +++ b/include/hw/pci-host/i440fx.h
> >> @@ -45,5 +45,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
> >>                      MemoryRegion *pci_memory,
> >>                      MemoryRegion *ram_memory);
> >>  
> >> +uint64_t i440fx_pci_hole64_size(DeviceState *i440fx_dev);
> >>  
> >>  #endif  
> >   
> 


