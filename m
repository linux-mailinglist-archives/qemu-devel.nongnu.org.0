Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC1254E332
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 16:18:28 +0200 (CEST)
Received: from localhost ([::1]:52756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1qKI-0006z2-Hg
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 10:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o1qIn-0006Iq-Jf
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 10:16:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o1qIk-0006Bh-2T
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 10:16:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655389008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ciJhaJVHzVVSK8e5SAx9wCHTslMlO8gXh/PgWXKEbOU=;
 b=aNe/im8IfydOBOpfzGWE/0+x4c3Tm2Dm7bUBcN+7c5Lys6fyeTuV4ht7fB9xioyVgImikO
 dBF2FXLz+yRNUHNfHDG4n6BFooqDdNT7uO9wGryvtc6KDBgoJrj+1lZbgWhi0IKIXAu/8H
 ks8ytpNXPjmUQHTLtwU6bkNx4HNRLvU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-cDh5WuNaNPCIUrW0VXSR8A-1; Thu, 16 Jun 2022 10:16:47 -0400
X-MC-Unique: cDh5WuNaNPCIUrW0VXSR8A-1
Received: by mail-ej1-f69.google.com with SMTP id
 l2-20020a170906078200b006fed42bfeacso667158ejc.16
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 07:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ciJhaJVHzVVSK8e5SAx9wCHTslMlO8gXh/PgWXKEbOU=;
 b=2zP17JzwR0Wjn5ireqPZ51qpxsz62mi76Mw4RIR6DZpU3FxAqxnzNc0n9XOsUNBV+6
 AMl0lfRp9Vo3sbrPg6Sfd6iglWKpm72scR1asrXGIAKEqiHUXYtqwGXi/vT/R5S6SuuE
 ZH1J/y75O9PAQ3r62DDUKPp/X+FwbjE9aNuerz7tGKgiQX9w0KCeXSvEtLawNPNgRSby
 2JTe8GFyOOPrfN6EIlzEAngnaqbh9nZhzExsssaHQdfhkrFMQSB+tU5HStTWTf979Ihh
 VLftezj0uYJnQLdUESTJpQD6Q+9lAtfR/hoCT4s/mjd+zlxvzEG2+VIyM2NlM4hE/lVG
 qCdA==
X-Gm-Message-State: AJIora99JEMI5yE228vw7mRUAR+PbrSXVTcvOYE0vq56ATSaolcjXh/v
 Fk5Lxmgvk3KHJQy2N/kFKduQXvFEBdlV1mwRoGqiADBkdbik/EwlwO985ABDq2aEz91RrcHlSH2
 GwMVXI4fUVXPd09s=
X-Received: by 2002:a17:907:c06:b0:701:eb60:ded with SMTP id
 ga6-20020a1709070c0600b00701eb600dedmr4426407ejc.178.1655389006072; 
 Thu, 16 Jun 2022 07:16:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tZRqCPtHEIvczbbe0FEwuBLHioDeWqOTVBJMM7F0563McpmkJJQoJsgEeKn/Q7lV5Fh9r3+Q==
X-Received: by 2002:a17:907:c06:b0:701:eb60:ded with SMTP id
 ga6-20020a1709070c0600b00701eb600dedmr4426383ejc.178.1655389005807; 
 Thu, 16 Jun 2022 07:16:45 -0700 (PDT)
Received: from redhat.com ([2.53.13.204]) by smtp.gmail.com with ESMTPSA id
 p16-20020a170906839000b00704fa2748ffsm842384ejx.99.2022.06.16.07.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 07:16:45 -0700 (PDT)
Date: Thu, 16 Jun 2022 10:16:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Joao Martins <joao.m.martins@oracle.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v5 3/5] i386/pc: pass pci_hole64_size to pc_memory_init()
Message-ID: <20220616101604-mutt-send-email-mst@kernel.org>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
 <20220520104532.9816-4-joao.m.martins@oracle.com>
 <20220616153014.1aa4d16b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616153014.1aa4d16b@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Thu, Jun 16, 2022 at 03:30:14PM +0200, Igor Mammedov wrote:
> On Fri, 20 May 2022 11:45:30 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
> > Use the pre-initialized pci-host qdev and fetch the
> > pci-hole64-size into pc_memory_init() newly added argument.
> > piix needs a bit of care given all the !pci_enabled()
> > and that the pci_hole64_size is private to i440fx.
> > 
> > This is in preparation to determine that host-phys-bits are
> > enough and for pci-hole64-size to be considered to relocate
> > ram-above-4g to be at 1T (on AMD platforms).
> 
> modulo nit blow
> 
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> 
> > 
> > Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> > ---
> >  hw/i386/pc.c                 | 3 ++-
> >  hw/i386/pc_piix.c            | 5 ++++-
> >  hw/i386/pc_q35.c             | 8 +++++++-
> >  hw/pci-host/i440fx.c         | 7 +++++++
> >  include/hw/i386/pc.h         | 3 ++-
> >  include/hw/pci-host/i440fx.h | 1 +
> >  6 files changed, 23 insertions(+), 4 deletions(-)
> > 
> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > index f7da1d5dd40d..af52d4ff89ef 100644
> > --- a/hw/i386/pc.c
> > +++ b/hw/i386/pc.c
> > @@ -799,7 +799,8 @@ void xen_load_linux(PCMachineState *pcms)
> >  void pc_memory_init(PCMachineState *pcms,
> >                      MemoryRegion *system_memory,
> >                      MemoryRegion *rom_memory,
> > -                    MemoryRegion **ram_memory)
> > +                    MemoryRegion **ram_memory,
> > +                    uint64_t pci_hole64_size)
> >  {
> >      int linux_boot, i;
> >      MemoryRegion *option_rom_mr;
> > diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> > index 12d4a279c793..57bb5b8f2aea 100644
> > --- a/hw/i386/pc_piix.c
> > +++ b/hw/i386/pc_piix.c
> > @@ -91,6 +91,7 @@ static void pc_init1(MachineState *machine,
> >      MemoryRegion *pci_memory;
> >      MemoryRegion *rom_memory;
> >      ram_addr_t lowmem;
> > +    uint64_t hole64_size;
> 
> init it to 0 right here to avoid chance of run amok uninitialized variable?


I don't see why we should, compilers seems to be pretty good about warning
about these things nowdays.

> >      DeviceState *i440fx_dev;
> >  
> >      /*
> > @@ -166,10 +167,12 @@ static void pc_init1(MachineState *machine,
> >          memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
> >          rom_memory = pci_memory;
> >          i440fx_dev = qdev_new(host_type);
> > +        hole64_size = i440fx_pci_hole64_size(i440fx_dev);
> >      } else {
> >          pci_memory = NULL;
> >          rom_memory = system_memory;
> >          i440fx_dev = NULL;
> > +        hole64_size = 0;
> >      }
> >  
> >      pc_guest_info_init(pcms);
> > @@ -186,7 +189,7 @@ static void pc_init1(MachineState *machine,
> >      /* allocate ram and load rom/bios */
> >      if (!xen_enabled()) {
> >          pc_memory_init(pcms, system_memory,
> > -                       rom_memory, &ram_memory);
> > +                       rom_memory, &ram_memory, hole64_size);
> >      } else {
> >          pc_system_flash_cleanup_unused(pcms);
> >          if (machine->kernel_filename != NULL) {
> > diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> > index 8d867bdb274a..4d5c2fbd976b 100644
> > --- a/hw/i386/pc_q35.c
> > +++ b/hw/i386/pc_q35.c
> > @@ -138,6 +138,7 @@ static void pc_q35_init(MachineState *machine)
> >      MachineClass *mc = MACHINE_GET_CLASS(machine);
> >      bool acpi_pcihp;
> >      bool keep_pci_slot_hpc;
> > +    uint64_t pci_hole64_size = 0;
> >  
> >      /* Check whether RAM fits below 4G (leaving 1/2 GByte for IO memory
> >       * and 256 Mbytes for PCI Express Enhanced Configuration Access Mapping
> > @@ -206,8 +207,13 @@ static void pc_q35_init(MachineState *machine)
> >      /* create pci host bus */
> >      q35_host = Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
> >  
> > +    if (pcmc->pci_enabled) {
> > +        pci_hole64_size = q35_host->mch.pci_hole64_size;
> > +    }
> > +
> >      /* allocate ram and load rom/bios */
> > -    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
> > +    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory,
> > +                   pci_hole64_size);
> >  
> >      object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
> >      object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
> > diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
> > index 5c1bab5c58ed..c5cc28250d5c 100644
> > --- a/hw/pci-host/i440fx.c
> > +++ b/hw/pci-host/i440fx.c
> > @@ -237,6 +237,13 @@ static void i440fx_realize(PCIDevice *dev, Error **errp)
> >      }
> >  }
> >  
> > +uint64_t i440fx_pci_hole64_size(DeviceState *i440fx_dev)
> > +{
> > +        I440FXState *i440fx = I440FX_PCI_HOST_BRIDGE(i440fx_dev);
> > +
> > +        return i440fx->pci_hole64_size;
> > +}
> > +
> >  PCIBus *i440fx_init(const char *host_type, const char *pci_type,
> >                      DeviceState *dev,
> >                      PCII440FXState **pi440fx_state,
> > diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> > index ffcac5121ed9..9c847faea2f8 100644
> > --- a/include/hw/i386/pc.h
> > +++ b/include/hw/i386/pc.h
> > @@ -158,7 +158,8 @@ void xen_load_linux(PCMachineState *pcms);
> >  void pc_memory_init(PCMachineState *pcms,
> >                      MemoryRegion *system_memory,
> >                      MemoryRegion *rom_memory,
> > -                    MemoryRegion **ram_memory);
> > +                    MemoryRegion **ram_memory,
> > +                    uint64_t pci_hole64_size);
> >  uint64_t pc_pci_hole64_start(void);
> >  DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
> >  void pc_basic_device_init(struct PCMachineState *pcms,
> > diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
> > index c4710445e30a..1299d6a2b0e4 100644
> > --- a/include/hw/pci-host/i440fx.h
> > +++ b/include/hw/pci-host/i440fx.h
> > @@ -45,5 +45,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
> >                      MemoryRegion *pci_memory,
> >                      MemoryRegion *ram_memory);
> >  
> > +uint64_t i440fx_pci_hole64_size(DeviceState *i440fx_dev);
> >  
> >  #endif


