Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A102B5411
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 23:04:52 +0100 (CET)
Received: from localhost ([::1]:40628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kemcF-0002IY-CY
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 17:04:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kemZY-0000Mp-Nz
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 17:02:05 -0500
Received: from mga07.intel.com ([134.134.136.100]:19576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kemZV-0003tH-7v
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 17:02:03 -0500
IronPort-SDR: 8F+OdqIBS5wBb9QDYrKT7U8YPudYxs84B5oxsfoZE/W5Yk8unYcXgEeAA6QJho7G10VU0vzOV6
 py7vwrn5ve9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="234974407"
X-IronPort-AV: E=Sophos;i="5.77,483,1596524400"; d="scan'208";a="234974407"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 14:01:49 -0800
IronPort-SDR: M+XA0+a3h+UP+MRv8dHfUWuJdtQ/F8mxAs2OmDZlbZDk+XpW8d1wdnXaEthH/XcuJaAO4Chk86
 bFdrXOAKSuhA==
X-IronPort-AV: E=Sophos;i="5.77,483,1596524400"; d="scan'208";a="430288903"
Received: from vbenjes-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.252.134.15])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 14:01:48 -0800
Date: Mon, 16 Nov 2020 14:01:40 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [RFC PATCH 11/25] hw/pxb: Allow creation of a CXL PXB (host
 bridge)
Message-ID: <20201116220140.axtjp2q6267ne43q@intel.com>
References: <20201111054724.794888-1-ben.widawsky@intel.com>
 <20201111054724.794888-12-ben.widawsky@intel.com>
 <20201116164409.00005f3b@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116164409.00005f3b@Huawei.com>
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=ben.widawsky@intel.com; helo=mga07.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 16:11:26
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Vishal Verma <vishal.l.verma@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20-11-16 16:44:09, Jonathan Cameron wrote:
> On Tue, 10 Nov 2020 21:47:10 -0800
> Ben Widawsky <ben.widawsky@intel.com> wrote:
> 
> > This works like adding a typical pxb device, except the name is
> > 'pxb-cxl' instead of 'pxb-pcie'. An example command line would be as
> > follows:
> >   -device pxb-cxl,id=cxl.0,bus="pcie.0",bus_nr=1
> > 
> > A CXL PXB is backward compatible with PCIe. What this means in practice
> > is that an operating system that is unaware of CXL should still be able
> > to enumerate this topology as if it were PCIe.
> > 
> > One can create multiple CXL PXB host bridges, but a host bridge can only
> > be connected to the main root bus. Host bridges cannot appear elsewhere
> > in the topology.
> > 
> > Note that as of this patch, the ACPI tables needed for the host bridge
> > (specifically, an ACPI object in _SB named ACPI0016 and the CEDT) aren't
> > created. So while this patch internally creates it, it cannot be
> > properly used by an operating system or other system software.
> > 
> > Upcoming patches will allow creating multiple host bridges.
> > 
> > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> Hi Ben,
> 
> Few minor things inline.
> 
> Jonathan
> 
> > ---
> >  hw/pci-bridge/pci_expander_bridge.c | 67 ++++++++++++++++++++++++++++-
> >  hw/pci/pci.c                        |  7 +++
> >  include/hw/pci/pci.h                |  6 +++
> >  3 files changed, 78 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
> > index 88c45dc3b5..3a8d815231 100644
> > --- a/hw/pci-bridge/pci_expander_bridge.c
> > +++ b/hw/pci-bridge/pci_expander_bridge.c
> > @@ -56,6 +56,10 @@ DECLARE_INSTANCE_CHECKER(PXBDev, PXB_DEV,
> >  DECLARE_INSTANCE_CHECKER(PXBDev, PXB_PCIE_DEV,
> >                           TYPE_PXB_PCIE_DEVICE)
> >  
> > +#define TYPE_PXB_CXL_DEVICE "pxb-cxl"
> > +DECLARE_INSTANCE_CHECKER(PXBDev, PXB_CXL_DEV,
> > +                         TYPE_PXB_CXL_DEVICE)
> > +
> >  struct PXBDev {
> >      /*< private >*/
> >      PCIDevice parent_obj;
> > @@ -67,6 +71,11 @@ struct PXBDev {
> >  
> >  static PXBDev *convert_to_pxb(PCIDevice *dev)
> >  {
> > +    /* A CXL PXB's parent bus is PCIe, so the normal check won't work */
> > +    if (object_dynamic_cast(OBJECT(dev), TYPE_PXB_CXL_DEVICE)) {
> > +        return PXB_CXL_DEV(dev);
> > +    }
> > +
> >      return pci_bus_is_express(pci_get_bus(dev))
> >          ? PXB_PCIE_DEV(dev) : PXB_DEV(dev);
> >  }
> > @@ -111,11 +120,20 @@ static const TypeInfo pxb_pcie_bus_info = {
> >      .class_init    = pxb_bus_class_init,
> >  };
> >  
> > +static const TypeInfo pxb_cxl_bus_info = {
> > +    .name          = TYPE_PXB_CXL_BUS,
> > +    .parent        = TYPE_CXL_BUS,
> > +    .instance_size = sizeof(PXBBus),
> > +    .class_init    = pxb_bus_class_init,
> > +};
> > +
> >  static const char *pxb_host_root_bus_path(PCIHostState *host_bridge,
> >                                            PCIBus *rootbus)
> >  {
> > -    PXBBus *bus = pci_bus_is_express(rootbus) ?
> > -                  PXB_PCIE_BUS(rootbus) : PXB_BUS(rootbus);
> > +    PXBBus *bus = pci_bus_is_cxl(rootbus) ?
> > +                      PXB_CXL_BUS(rootbus) :
> > +                      pci_bus_is_express(rootbus) ? PXB_PCIE_BUS(rootbus) :
> > +                                                    PXB_BUS(rootbus);
> 
> There comes a point where if / else is much more readable.
> 
> >  
> >      snprintf(bus->bus_path, 8, "0000:%02x", pxb_bus_num(rootbus));
> >      return bus->bus_path;
> > @@ -380,13 +398,58 @@ static const TypeInfo pxb_pcie_dev_info = {
> >      },
> >  };
> >  
> > +static void pxb_cxl_dev_realize(PCIDevice *dev, Error **errp)
> > +{
> > +    /* A CXL PXB's parent bus is still PCIe */
> > +    if (!pci_bus_is_express(pci_get_bus(dev))) {
> > +        error_setg(errp, "pxb-cxl devices cannot reside on a PCI bus");
> > +        return;
> > +    }
> > +
> > +    pxb_dev_realize_common(dev, CXL, errp);
> > +}
> > +
> > +static void pxb_cxl_dev_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc   = DEVICE_CLASS(klass);
> > +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> > +
> > +    k->realize             = pxb_cxl_dev_realize;
> > +    k->exit                = pxb_dev_exitfn;
> > +    k->vendor_id           = PCI_VENDOR_ID_INTEL;
> > +    k->device_id           = 0xabcd;
> 
> Just to check, is that an officially assigned device_id that we will never
> have a clash with?  Nice ID to get if it is :)

No, not the real ID.

My understanding is that the host bridge won't exist at all in the PCI
hierarchy. So basically all of these can be undeclared. For testing/development
purposes I wanted to see this info.

Awesomely, it appears if I remove vendor, device, class, and subsystem
everything still works and I do not see a bridge device in lspci. So v2 will
have this all gone.

Thanks.

> 
> 
> > +    k->class_id            = PCI_CLASS_BRIDGE_HOST;
> > +    k->subsystem_vendor_id = PCI_VENDOR_ID_INTEL;
> > +
> > +    dc->desc = "CXL Host Bridge";
> > +    device_class_set_props(dc, pxb_dev_properties);
> > +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> > +
> > +    /* Host bridges aren't hotpluggable. FIXME: spec reference */
> > +    dc->hotpluggable = false;
> > +}
> > +
> > +static const TypeInfo pxb_cxl_dev_info = {
> > +    .name          = TYPE_PXB_CXL_DEVICE,
> > +    .parent        = TYPE_PCI_DEVICE,
> > +    .instance_size = sizeof(PXBDev),
> > +    .class_init    = pxb_cxl_dev_class_init,
> > +    .interfaces =
> > +        (InterfaceInfo[]){
> > +            { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> > +            {},
> > +        },
> > +};
> > +
> >  static void pxb_register_types(void)
> >  {
> >      type_register_static(&pxb_bus_info);
> >      type_register_static(&pxb_pcie_bus_info);
> > +    type_register_static(&pxb_cxl_bus_info);
> >      type_register_static(&pxb_host_info);
> >      type_register_static(&pxb_dev_info);
> >      type_register_static(&pxb_pcie_dev_info);
> > +    type_register_static(&pxb_cxl_dev_info);
> >  }
> >  
> >  type_init(pxb_register_types)
> > diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> > index db88788c4b..67eed889a4 100644
> > --- a/hw/pci/pci.c
> > +++ b/hw/pci/pci.c
> > @@ -220,6 +220,12 @@ static const TypeInfo pcie_bus_info = {
> >      .class_init = pcie_bus_class_init,
> >  };
> >  
> > +static const TypeInfo cxl_bus_info = {
> > +    .name       = TYPE_CXL_BUS,
> > +    .parent     = TYPE_PCIE_BUS,
> > +    .class_init = pcie_bus_class_init,
> > +};
> > +
> >  static PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num);
> >  static void pci_update_mappings(PCIDevice *d);
> >  static void pci_irq_handler(void *opaque, int irq_num, int level);
> > @@ -2847,6 +2853,7 @@ static void pci_register_types(void)
> >  {
> >      type_register_static(&pci_bus_info);
> >      type_register_static(&pcie_bus_info);
> > +    type_register_static(&cxl_bus_info);
> >      type_register_static(&conventional_pci_interface_info);
> >      type_register_static(&cxl_interface_info);
> >      type_register_static(&pcie_interface_info);
> > diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > index 4e6fd59fdd..52267ff69e 100644
> > --- a/include/hw/pci/pci.h
> > +++ b/include/hw/pci/pci.h
> > @@ -405,6 +405,7 @@ typedef PCIINTxRoute (*pci_route_irq_fn)(void *opaque, int pin);
> >  #define TYPE_PCI_BUS "PCI"
> >  OBJECT_DECLARE_TYPE(PCIBus, PCIBusClass, PCI_BUS)
> >  #define TYPE_PCIE_BUS "PCIE"
> > +#define TYPE_CXL_BUS "CXL"
> >  
> >  bool pci_bus_is_express(PCIBus *bus);
> >  
> > @@ -753,6 +754,11 @@ static inline void pci_irq_pulse(PCIDevice *pci_dev)
> >      pci_irq_deassert(pci_dev);
> >  }
> >  
> > +static inline int pci_is_cxl(const PCIDevice *d)
> > +{
> > +    return d->cap_present & QEMU_PCIE_CAP_CXL;
> > +}
> > +
> >  static inline int pci_is_express(const PCIDevice *d)
> >  {
> >      return d->cap_present & QEMU_PCI_CAP_EXPRESS;
> 

