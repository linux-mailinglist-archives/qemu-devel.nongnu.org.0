Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F10C57DC2A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Aug 2019 15:07:05 +0200 (CEST)
Received: from localhost ([::1]:55802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htAnR-0003cw-7y
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 09:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53765)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1htAmj-0002rq-JB
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 09:06:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1htAmh-0002pd-Kn
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 09:06:21 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:45607)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1htAmh-0002ow-GO
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 09:06:19 -0400
Received: by mail-qt1-f193.google.com with SMTP id x22so65160860qtp.12
 for <qemu-devel@nongnu.org>; Thu, 01 Aug 2019 06:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nlQ9MkHwk15BYJd3ELdhLl6PRx2T8iCiDR+8ddX90Jw=;
 b=n78uBVwPzq4OlhHWh/rbUuUmPcctCGvdrSa0uTk4TtdOQq5IGk4AIM+5LuQWOE14Bz
 oTDXEYPjYjn6dYfuTIsaqakLoizG7JnrDzL+pbItrsZphAvuvKNbs6fgKK7besNpZIWG
 459jwB6YgQlP3Gyxkx/Zp+xeZJOp6SFgW++EESgkfffE81+YcwdxsUy4gON5fA4JrvkB
 I8dnbZGtE/EufwbL6ZVdgLVwEvw5NGDW9XE2m72JzZs6PXC8YpzeqBtq8ZBfAnsDcE/d
 BibgMrWRfGEgaLr8m/PwUln1U/ZYacrN711tKJUD9g2ylMZfl+36GoI3DCmyxY+mFe0q
 Zohw==
X-Gm-Message-State: APjAAAXXOFXSj8pExMu7Ni0vIPmOSL5++CJf1RUcF2eRwREZlBSw9XZK
 Q6icHWLNwu9wZ+c3PLsLhc9okw==
X-Google-Smtp-Source: APXvYqwq9aZasiXXOai6U23kbXNhRjdvMwburNQD8lfc7fieBi/DxTx+lsVLBCT5XevTW6EBRsR8Bg==
X-Received: by 2002:aed:3535:: with SMTP id a50mr92966760qte.237.1564664778574; 
 Thu, 01 Aug 2019 06:06:18 -0700 (PDT)
Received: from redhat.com ([147.234.38.1])
 by smtp.gmail.com with ESMTPSA id w62sm28447353qkd.30.2019.08.01.06.06.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 06:06:17 -0700 (PDT)
Date: Thu, 1 Aug 2019 09:06:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20190801090027-mutt-send-email-mst@kernel.org>
References: <20190730172137.23114-1-eric.auger@redhat.com>
 <20190730172137.23114-15-eric.auger@redhat.com>
 <20190730153305-mutt-send-email-mst@kernel.org>
 <a0e88a60-083b-2730-5db8-7bba0299974b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0e88a60-083b-2730-5db8-7bba0299974b@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.160.193
Subject: Re: [Qemu-devel] [PATCH for-4.2 v10 14/15] virtio-iommu-pci: Add
 virtio iommu pci support
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
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, peter.maydell@linaro.org,
 tn@semihalf.com, qemu-devel@nongnu.org, peterx@redhat.com,
 alex.williamson@redhat.com, qemu-arm@nongnu.org, bharat.bhushan@nxp.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 01, 2019 at 02:15:03PM +0200, Auger Eric wrote:
> Hi Michael,
> 
> On 7/30/19 9:35 PM, Michael S. Tsirkin wrote:
> > On Tue, Jul 30, 2019 at 07:21:36PM +0200, Eric Auger wrote:
> >> This patch adds virtio-iommu-pci, which is the pci proxy for
> >> the virtio-iommu device.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > 
> > This part I'm not sure we should merge just yet.  The reason being I
> > think we should limit it to mmio where DT can be used to describe iommu
> > topology. For PCI I don't see why we shouldn't always expose this
> > in the config space, and I think it's preferable not to
> > need to support a mix of DT,ACPI and PCI as options.
> 
> For context, some discussion related to this topic already arose on v7
> revision of the driver:
> 
> [1] Re: [PATCH v7 0/7] Add virtio-iommu driver
> https://lore.kernel.org/linux-pci/87a7ioby9u.fsf@morokweng.localdomain/
> 
> Some additional thoughts.
> 
> First considering DT boot.
> 
> THE DT description features an iommu-map property in the
> pci-host-ecam-generic node that describes which RIDs are handled by the
> virtio-iommu and a possible offset/mask to be applied inbetween the RID
> and the streamID at the input of the IOMMU
> (Documentation/devicetree/bindings/pci/pci-iommu.txt)
> 
> As far as I understand when a DMA capable device is setup, its DMA
> configuration is built using that call chain:
> 
> pci_dma_configure
> |_ of_dma_configure
>    |_ of_iommu_configure
>       |_ of_pci_iommu_init
>          |_ of_map_rid
> 
> I understand you would like the iommu-map/iommu-map-mask info to be
> exposed directly into the config space of the device instead of inside
> the DT or IORT table. Assuming a module is initialized sufficiently
> early to retrieve this info, we would need the resulting info to be
> consolidated to allow pci_dma_configure chain to work seemlessly. This
> sounds a significant impact on above kernel infrastructure.

I don't really know what consolidated means.
It is pretty common for IOMMUs to expose config through
PCI registers. This typically happens as a fixup.

I would write a tiny driver to do exactly that,
and run it from the fixup.


> This comes in addition to the development of the "small module that
> loads early and pokes at the IOMMU sufficiently to get the data about
> which devices use the IOMMU out of it using standard virtio config
> space" evoked in [1] + the definition of the data formats to be put in
> the very cfg space.

That last part is true but that's exactly why I propose we
wait on this patch a bit.

> With ACPI I understand we have the same kind of infrastructure:
> drivers/acpi/arm64/iort.c currently extracts the mapping between RC RIDs
> and IOMMU streamids
> 
> pci_dma_configure(
> |_ acpi_dma_configure
>    |_ iort_iommu_configure
>       |_ iort_pci_iommu_init
>          |_ iort_node_map_id
>             |_ iort_id_map
> 
> Maybe I fail to see the easy and right way to do the integration at
> kernel level but I am a bit frightened by the efforts that would be
> requested to follow your suggestion, whereas the DT infra is ready and
> fully upstreamed to accept the use case.

Did you take a look at drivers/pci/quirks.c and how these run?
I think it's just a question of adding DECLARE_PCI_FIXUP_CLASS_EARLY
and running your hook from there.


> For ACPI I agree AFAIK IORT was primarily defined by ARM, for ARM but we
> prototyped IORT integration with x86 and it worked for pc machine
> without major trouble.
> 
> I sent the kernel and qemu patches prototyping this IORT integration:
> 
> https://github.com/eauger/linux/tree/virtio-iommu-v0.9-iort-x86
> https://github.com/eauger/qemu/tree/v3.1.0-rc3-virtio-iommu-v0.9-x86
> 
> There ACPI IORT was built for PC machine and the integration effort at
> both kernel and QEMU level was low. This work would need to be rebased
> and depends on kernel ACPI related patches that are not yet upstreamed
> though.
> 
> Thanks
> 
> Eric

In the end it might turn out you are right.  But it does us no harm to
delay this just a bit, and for now limit things to ARM where it's
already used and where alternatives exist.


> > 
> >> ---
> >>
> >> v8 -> v9:
> >> - add the msi-bypass property
> >> - create virtio-iommu-pci.c
> >> ---
> >>  hw/virtio/Makefile.objs          |  1 +
> >>  hw/virtio/virtio-iommu-pci.c     | 88 ++++++++++++++++++++++++++++++++
> >>  include/hw/pci/pci.h             |  1 +
> >>  include/hw/virtio/virtio-iommu.h |  1 +
> >>  qdev-monitor.c                   |  1 +
> >>  5 files changed, 92 insertions(+)
> >>  create mode 100644 hw/virtio/virtio-iommu-pci.c
> >>
> >> diff --git a/hw/virtio/Makefile.objs b/hw/virtio/Makefile.objs
> >> index f42e4dd94f..80ca719f1c 100644
> >> --- a/hw/virtio/Makefile.objs
> >> +++ b/hw/virtio/Makefile.objs
> >> @@ -27,6 +27,7 @@ obj-$(CONFIG_VIRTIO_INPUT_HOST) += virtio-input-host-pci.o
> >>  obj-$(CONFIG_VIRTIO_INPUT) += virtio-input-pci.o
> >>  obj-$(CONFIG_VIRTIO_RNG) += virtio-rng-pci.o
> >>  obj-$(CONFIG_VIRTIO_BALLOON) += virtio-balloon-pci.o
> >> +obj-$(CONFIG_VIRTIO_IOMMU) += virtio-iommu-pci.o
> >>  obj-$(CONFIG_VIRTIO_9P) += virtio-9p-pci.o
> >>  obj-$(CONFIG_VIRTIO_SCSI) += virtio-scsi-pci.o
> >>  obj-$(CONFIG_VIRTIO_BLK) += virtio-blk-pci.o
> >> diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
> >> new file mode 100644
> >> index 0000000000..f9977096bd
> >> --- /dev/null
> >> +++ b/hw/virtio/virtio-iommu-pci.c
> >> @@ -0,0 +1,88 @@
> >> +/*
> >> + * Virtio IOMMU PCI Bindings
> >> + *
> >> + * Copyright (c) 2019 Red Hat, Inc.
> >> + * Written by Eric Auger
> >> + *
> >> + *  This program is free software; you can redistribute it and/or modify
> >> + *  it under the terms of the GNU General Public License version 2 or
> >> + *  (at your option) any later version.
> >> + */
> >> +
> >> +#include "qemu/osdep.h"
> >> +
> >> +#include "virtio-pci.h"
> >> +#include "hw/virtio/virtio-iommu.h"
> >> +
> >> +typedef struct VirtIOIOMMUPCI VirtIOIOMMUPCI;
> >> +
> >> +/*
> >> + * virtio-iommu-pci: This extends VirtioPCIProxy.
> >> + *
> >> + */
> >> +#define VIRTIO_IOMMU_PCI(obj) \
> >> +        OBJECT_CHECK(VirtIOIOMMUPCI, (obj), TYPE_VIRTIO_IOMMU_PCI)
> >> +
> >> +struct VirtIOIOMMUPCI {
> >> +    VirtIOPCIProxy parent_obj;
> >> +    VirtIOIOMMU vdev;
> >> +};
> >> +
> >> +static Property virtio_iommu_pci_properties[] = {
> >> +    DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
> >> +    DEFINE_PROP_BOOL("msi-bypass", VirtIOIOMMUPCI, vdev.msi_bypass, true),
> >> +    DEFINE_PROP_END_OF_LIST(),
> >> +};
> >> +
> >> +static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
> >> +{
> >> +    VirtIOIOMMUPCI *dev = VIRTIO_IOMMU_PCI(vpci_dev);
> >> +    DeviceState *vdev = DEVICE(&dev->vdev);
> >> +
> >> +    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
> >> +    object_property_set_link(OBJECT(dev),
> >> +                             OBJECT(pci_get_bus(&vpci_dev->pci_dev)),
> >> +                             "primary-bus", errp);
> >> +    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
> >> +}
> >> +
> >> +static void virtio_iommu_pci_class_init(ObjectClass *klass, void *data)
> >> +{
> >> +    DeviceClass *dc = DEVICE_CLASS(klass);
> >> +    VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
> >> +    PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
> >> +    k->realize = virtio_iommu_pci_realize;
> >> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> >> +    dc->props = virtio_iommu_pci_properties;
> >> +    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
> >> +    pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_IOMMU;
> >> +    pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
> >> +    pcidev_k->class_id = PCI_CLASS_OTHERS;
> >> +}
> >> +
> >> +static void virtio_iommu_pci_instance_init(Object *obj)
> >> +{
> >> +    VirtIOIOMMUPCI *dev = VIRTIO_IOMMU_PCI(obj);
> >> +
> >> +    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
> >> +                                TYPE_VIRTIO_IOMMU);
> >> +}
> >> +
> >> +static const VirtioPCIDeviceTypeInfo virtio_iommu_pci_info = {
> >> +    .base_name             = TYPE_VIRTIO_IOMMU_PCI,
> >> +    .generic_name          = "virtio-iommu-pci",
> >> +    .transitional_name     = "virtio-iommu-pci-transitional",
> >> +    .non_transitional_name = "virtio-iommu-pci-non-transitional",
> >> +    .instance_size = sizeof(VirtIOIOMMUPCI),
> >> +    .instance_init = virtio_iommu_pci_instance_init,
> >> +    .class_init    = virtio_iommu_pci_class_init,
> >> +};
> >> +
> >> +static void virtio_iommu_pci_register(void)
> >> +{
> >> +    virtio_pci_types_register(&virtio_iommu_pci_info);
> >> +}
> >> +
> >> +type_init(virtio_iommu_pci_register)
> >> +
> >> +
> >> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> >> index aaf1b9f70d..492ea7e68d 100644
> >> --- a/include/hw/pci/pci.h
> >> +++ b/include/hw/pci/pci.h
> >> @@ -86,6 +86,7 @@ extern bool pci_available;
> >>  #define PCI_DEVICE_ID_VIRTIO_9P          0x1009
> >>  #define PCI_DEVICE_ID_VIRTIO_VSOCK       0x1012
> >>  #define PCI_DEVICE_ID_VIRTIO_PMEM        0x1013
> >> +#define PCI_DEVICE_ID_VIRTIO_IOMMU       0x1014
> >>  
> >>  #define PCI_VENDOR_ID_REDHAT             0x1b36
> >>  #define PCI_DEVICE_ID_REDHAT_BRIDGE      0x0001
> >> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
> >> index 56c8b4e57f..893ac65c0b 100644
> >> --- a/include/hw/virtio/virtio-iommu.h
> >> +++ b/include/hw/virtio/virtio-iommu.h
> >> @@ -25,6 +25,7 @@
> >>  #include "hw/pci/pci.h"
> >>  
> >>  #define TYPE_VIRTIO_IOMMU "virtio-iommu-device"
> >> +#define TYPE_VIRTIO_IOMMU_PCI "virtio-iommu-device-base"
> >>  #define VIRTIO_IOMMU(obj) \
> >>          OBJECT_CHECK(VirtIOIOMMU, (obj), TYPE_VIRTIO_IOMMU)
> >>  
> >> diff --git a/qdev-monitor.c b/qdev-monitor.c
> >> index 58222c2211..74cf090c61 100644
> >> --- a/qdev-monitor.c
> >> +++ b/qdev-monitor.c
> >> @@ -63,6 +63,7 @@ static const QDevAlias qdev_alias_table[] = {
> >>      { "virtio-input-host-ccw", "virtio-input-host", QEMU_ARCH_S390X },
> >>      { "virtio-input-host-pci", "virtio-input-host",
> >>              QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
> >> +    { "virtio-iommu-pci", "virtio-iommu", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
> >>      { "virtio-keyboard-ccw", "virtio-keyboard", QEMU_ARCH_S390X },
> >>      { "virtio-keyboard-pci", "virtio-keyboard",
> >>              QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
> >> -- 
> >> 2.20.1
> > 

