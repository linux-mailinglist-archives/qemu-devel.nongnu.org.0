Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA62D49D18E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 19:19:11 +0100 (CET)
Received: from localhost ([::1]:53728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCmsw-0006JL-Jq
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 13:19:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nCmo4-0000bz-Mi
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 13:14:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nCmny-00039i-Ni
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 13:14:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643220839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5C5BCaLc2QSfHpmEIxMBNiAVAiD6mh/SmGq3W+yaXQg=;
 b=IsRBsoTFZypFfqfZZeAWPi/i4AegaSWD/nq07E4OrNBcCagAS4+VuYaZZD2V4paKsO1kIt
 MpGN4K/cJFHeQ0MGAFlUOKaBgG8tcVgSf1x2B+5y7bShRjZOeeD3veV3/SOOMhRZzB4oix
 reRtpbFieGiBzk9gBM2D5Z1U82ePcSM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-2-uV0zdKMxy9l04AJ39XuQ-1; Wed, 26 Jan 2022 13:13:52 -0500
X-MC-Unique: 2-uV0zdKMxy9l04AJ39XuQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 m3-20020a7bcb83000000b0034f75d92f27so255973wmi.2
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 10:13:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=5C5BCaLc2QSfHpmEIxMBNiAVAiD6mh/SmGq3W+yaXQg=;
 b=xSWTxQ5/H4RzpSmzpo9a7p6Wl70qhLxApIDB3NJEHSwEA4yywo6HxQlZkft+kkmSrK
 okUTmFi9wp5fvEck7ID8nyTbjRISttdvW3e2eKdFcAMi7OpaOe0pLMvDvxhcHVmjXLnV
 czl7fGiZBVBHvbFi0yxpwivAr+0aDz/qQQ7HhG/CW4D/nN5gtN5b66FOBfvDRADiNrLd
 B43R06n9jpOxTt7Kuss5AWOddV6iJZVJmGIKPZleg/TGld9AkaLw//c1MobpnQ2coy65
 XN0VBFzTBPmPzec6gAaaiKa796DYv8quS4YDrdhRT1oPgwkGoNt8HBBqf06BzeuP5RWL
 dJ7Q==
X-Gm-Message-State: AOAM533koBrMFm795GpyFPG0VGVQL9KLNvyQ6i4I0DdWCNACevlDqhkH
 mIpHfTMWnpYKkju8QyEQOCqxN2CM1MVeXScf3WaLNFDJB9y6do9WdQq1PbkiA2Xuk36KFCa1nkE
 HuJQtyj74pUrvIkM=
X-Received: by 2002:a05:6000:1569:: with SMTP id
 9mr16213613wrz.484.1643220831196; 
 Wed, 26 Jan 2022 10:13:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1fc6es5bCR6x0uI0uQBNVNrVSilSG7G+VvAANil2jN6m+KyVyx9zIg80fvJhPZSVLLDvzpw==
X-Received: by 2002:a05:6000:1569:: with SMTP id
 9mr16213567wrz.484.1643220830748; 
 Wed, 26 Jan 2022 10:13:50 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id p17sm19707008wrf.112.2022.01.26.10.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 10:13:50 -0800 (PST)
Date: Wed, 26 Jan 2022 18:13:48 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Message-ID: <YfGPXMziljiW7njm@work-vm>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <2971c1bec04acaac4eb3c1f2b104cbeabad01e22.1642626515.git.jag.raman@oracle.com>
 <20220119190742-mutt-send-email-mst@kernel.org>
 <1CACFB08-1BBC-4ECC-9C0B-6F377018D795@oracle.com>
 <YfBDqMuO/l/gWzL8@work-vm>
 <AE47B5D2-6515-4BD3-B541-23E5274174AC@oracle.com>
MIME-Version: 1.0
In-Reply-To: <AE47B5D2-6515-4BD3-B541-23E5274174AC@oracle.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Jag Raman (jag.raman@oracle.com) wrote:
> 
> 
> > On Jan 25, 2022, at 1:38 PM, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> > 
> > * Jag Raman (jag.raman@oracle.com) wrote:
> >> 
> >> 
> >>> On Jan 19, 2022, at 7:12 PM, Michael S. Tsirkin <mst@redhat.com> wrote:
> >>> 
> >>> On Wed, Jan 19, 2022 at 04:41:52PM -0500, Jagannathan Raman wrote:
> >>>> Allow PCI buses to be part of isolated CPU address spaces. This has a
> >>>> niche usage.
> >>>> 
> >>>> TYPE_REMOTE_MACHINE allows multiple VMs to house their PCI devices in
> >>>> the same machine/server. This would cause address space collision as
> >>>> well as be a security vulnerability. Having separate address spaces for
> >>>> each PCI bus would solve this problem.
> >>> 
> >>> Fascinating, but I am not sure I understand. any examples?
> >> 
> >> Hi Michael!
> >> 
> >> multiprocess QEMU and vfio-user implement a client-server model to allow
> >> out-of-process emulation of devices. The client QEMU, which makes ioctls
> >> to the kernel and runs VCPUs, could attach devices running in a server
> >> QEMU. The server QEMU needs access to parts of the client’s RAM to
> >> perform DMA.
> > 
> > Do you ever have the opposite problem? i.e. when an emulated PCI device
> 
> That’s an interesting question.
> 
> > exposes a chunk of RAM-like space (frame buffer, or maybe a mapped file)
> > that the client can see.  What happens if two emulated devices need to
> > access each others emulated address space?
> 
> In this case, the kernel driver would map the destination’s chunk of internal RAM into
> the DMA space of the source device. Then the source device could write to that
> mapped address range, and the IOMMU should direct those writes to the
> destination device.

Are all devices mappable like that?

> I would like to take a closer look at the IOMMU implementation on how to achieve
> this, and get back to you. I think the IOMMU would handle this. Could you please
> point me to the IOMMU implementation you have in mind?

I didn't have one in mind; I was just hitting a similar problem on
Virtiofs DAX.

Dave

> Thank you!
> --
> Jag
> 
> > 
> > Dave
> > 
> >> In the case where multiple clients attach devices that are running on the
> >> same server, we need to ensure that each devices has isolated memory
> >> ranges. This ensures that the memory space of one device is not visible
> >> to other devices in the same server.
> >> 
> >>> 
> >>> I also wonder whether this special type could be modelled like a special
> >>> kind of iommu internally.
> >> 
> >> Could you please provide some more details on the design?
> >> 
> >>> 
> >>>> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> >>>> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> >>>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> >>>> ---
> >>>> include/hw/pci/pci.h     |  2 ++
> >>>> include/hw/pci/pci_bus.h | 17 +++++++++++++++++
> >>>> hw/pci/pci.c             | 17 +++++++++++++++++
> >>>> hw/pci/pci_bridge.c      |  5 +++++
> >>>> 4 files changed, 41 insertions(+)
> >>>> 
> >>>> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> >>>> index 023abc0f79..9bb4472abc 100644
> >>>> --- a/include/hw/pci/pci.h
> >>>> +++ b/include/hw/pci/pci.h
> >>>> @@ -387,6 +387,8 @@ void pci_device_save(PCIDevice *s, QEMUFile *f);
> >>>> int pci_device_load(PCIDevice *s, QEMUFile *f);
> >>>> MemoryRegion *pci_address_space(PCIDevice *dev);
> >>>> MemoryRegion *pci_address_space_io(PCIDevice *dev);
> >>>> +AddressSpace *pci_isol_as_mem(PCIDevice *dev);
> >>>> +AddressSpace *pci_isol_as_io(PCIDevice *dev);
> >>>> 
> >>>> /*
> >>>> * Should not normally be used by devices. For use by sPAPR target
> >>>> diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
> >>>> index 347440d42c..d78258e79e 100644
> >>>> --- a/include/hw/pci/pci_bus.h
> >>>> +++ b/include/hw/pci/pci_bus.h
> >>>> @@ -39,9 +39,26 @@ struct PCIBus {
> >>>>    void *irq_opaque;
> >>>>    PCIDevice *devices[PCI_SLOT_MAX * PCI_FUNC_MAX];
> >>>>    PCIDevice *parent_dev;
> >>>> +
> >>>>    MemoryRegion *address_space_mem;
> >>>>    MemoryRegion *address_space_io;
> >>>> 
> >>>> +    /**
> >>>> +     * Isolated address spaces - these allow the PCI bus to be part
> >>>> +     * of an isolated address space as opposed to the global
> >>>> +     * address_space_memory & address_space_io.
> >>> 
> >>> Are you sure address_space_memory & address_space_io are
> >>> always global? even in the case of an iommu?
> >> 
> >> On the CPU side of the Root Complex, I believe address_space_memory
> >> & address_space_io are global.
> >> 
> >> In the vfio-user case, devices on the same machine (TYPE_REMOTE_MACHINE)
> >> could be attached to different clients VMs. Each client would have their own address
> >> space for their CPUs. With isolated address spaces, we ensure that the devices
> >> see the address space of the CPUs they’re attached to.
> >> 
> >> Not sure if it’s OK to share weblinks in this mailing list, please let me know if that’s
> >> not preferred. But I’m referring to the terminology used in the following block diagram:
> >> https://en.wikipedia.org/wiki/Root_complex#/media/File:Example_PCI_Express_Topology.svg
> >> 
> >>> 
> >>>> This allows the
> >>>> +     * bus to be attached to CPUs from different machines. The
> >>>> +     * following is not used used commonly.
> >>>> +     *
> >>>> +     * TYPE_REMOTE_MACHINE allows emulating devices from multiple
> >>>> +     * VM clients,
> >>> 
> >>> what are VM clients?
> >> 
> >> It’s the client in the client - server model explained above.
> >> 
> >> Thank you!
> >> --
> >> Jag
> >> 
> >>> 
> >>>> as such it needs the PCI buses in the same machine
> >>>> +     * to be part of different CPU address spaces. The following is
> >>>> +     * useful in that scenario.
> >>>> +     *
> >>>> +     */
> >>>> +    AddressSpace *isol_as_mem;
> >>>> +    AddressSpace *isol_as_io;
> >>>> +
> >>>>    QLIST_HEAD(, PCIBus) child; /* this will be replaced by qdev later */
> >>>>    QLIST_ENTRY(PCIBus) sibling;/* this will be replaced by qdev later */
> >>>> 
> >>>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> >>>> index 5d30f9ca60..d5f1c6c421 100644
> >>>> --- a/hw/pci/pci.c
> >>>> +++ b/hw/pci/pci.c
> >>>> @@ -442,6 +442,8 @@ static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
> >>>>    bus->slot_reserved_mask = 0x0;
> >>>>    bus->address_space_mem = address_space_mem;
> >>>>    bus->address_space_io = address_space_io;
> >>>> +    bus->isol_as_mem = NULL;
> >>>> +    bus->isol_as_io = NULL;
> >>>>    bus->flags |= PCI_BUS_IS_ROOT;
> >>>> 
> >>>>    /* host bridge */
> >>>> @@ -2676,6 +2678,16 @@ MemoryRegion *pci_address_space_io(PCIDevice *dev)
> >>>>    return pci_get_bus(dev)->address_space_io;
> >>>> }
> >>>> 
> >>>> +AddressSpace *pci_isol_as_mem(PCIDevice *dev)
> >>>> +{
> >>>> +    return pci_get_bus(dev)->isol_as_mem;
> >>>> +}
> >>>> +
> >>>> +AddressSpace *pci_isol_as_io(PCIDevice *dev)
> >>>> +{
> >>>> +    return pci_get_bus(dev)->isol_as_io;
> >>>> +}
> >>>> +
> >>>> static void pci_device_class_init(ObjectClass *klass, void *data)
> >>>> {
> >>>>    DeviceClass *k = DEVICE_CLASS(klass);
> >>>> @@ -2699,6 +2711,7 @@ static void pci_device_class_base_init(ObjectClass *klass, void *data)
> >>>> 
> >>>> AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
> >>>> {
> >>>> +    AddressSpace *iommu_as = NULL;
> >>>>    PCIBus *bus = pci_get_bus(dev);
> >>>>    PCIBus *iommu_bus = bus;
> >>>>    uint8_t devfn = dev->devfn;
> >>>> @@ -2745,6 +2758,10 @@ AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
> >>>>    if (!pci_bus_bypass_iommu(bus) && iommu_bus && iommu_bus->iommu_fn) {
> >>>>        return iommu_bus->iommu_fn(bus, iommu_bus->iommu_opaque, devfn);
> >>>>    }
> >>>> +    iommu_as = pci_isol_as_mem(dev);
> >>>> +    if (iommu_as) {
> >>>> +        return iommu_as;
> >>>> +    }
> >>>>    return &address_space_memory;
> >>>> }
> >>>> 
> >>>> diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
> >>>> index da34c8ebcd..98366768d2 100644
> >>>> --- a/hw/pci/pci_bridge.c
> >>>> +++ b/hw/pci/pci_bridge.c
> >>>> @@ -383,6 +383,11 @@ void pci_bridge_initfn(PCIDevice *dev, const char *typename)
> >>>>    sec_bus->address_space_io = &br->address_space_io;
> >>>>    memory_region_init(&br->address_space_io, OBJECT(br), "pci_bridge_io",
> >>>>                       4 * GiB);
> >>>> +
> >>>> +    /* This PCI bridge puts the sec_bus in its parent's address space */
> >>>> +    sec_bus->isol_as_mem = pci_isol_as_mem(dev);
> >>>> +    sec_bus->isol_as_io = pci_isol_as_io(dev);
> >>>> +
> >>>>    br->windows = pci_bridge_region_init(br);
> >>>>    QLIST_INIT(&sec_bus->child);
> >>>>    QLIST_INSERT_HEAD(&parent->child, sec_bus, sibling);
> >>>> -- 
> >>>> 2.20.1
> >> 
> > -- 
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


