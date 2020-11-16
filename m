Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C77E2B5414
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 23:06:45 +0100 (CET)
Received: from localhost ([::1]:43564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keme4-0003hY-I7
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 17:06:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kemcv-0003E4-T4
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 17:05:35 -0500
Received: from mga17.intel.com ([192.55.52.151]:22452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kemcs-0004C2-KZ
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 17:05:33 -0500
IronPort-SDR: EWqlD5JhxmjvJz5UjeoLslHEZ+Oiv1Daad2GCiNCQjs1Y/AMU8nlWFOhHR+oScL9vV26YMOECk
 9gyRrk2R8YBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="150672977"
X-IronPort-AV: E=Sophos;i="5.77,483,1596524400"; d="scan'208";a="150672977"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 14:05:08 -0800
IronPort-SDR: hTRRERWn9jHcUcTD4WiKMF6wWqPZLfESoZw6dw3wSad4VmlS8jbsFJ3T7Ha2zxyEPbIGua7TeN
 /sGIk8dpfeEw==
X-IronPort-AV: E=Sophos;i="5.77,483,1596524400"; d="scan'208";a="400579906"
Received: from vbenjes-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.252.134.15])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 14:05:05 -0800
Date: Mon, 16 Nov 2020 14:05:02 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [RFC PATCH 22/25] acpi/cxl: Create the CEDT (9.14.1)
Message-ID: <20201116220502.yvatqo3vmj6q6cng@intel.com>
References: <20201111054724.794888-1-ben.widawsky@intel.com>
 <20201111054724.794888-23-ben.widawsky@intel.com>
 <20201116171503.00007b4f@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116171503.00007b4f@Huawei.com>
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=ben.widawsky@intel.com; helo=mga17.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 17:05:27
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20-11-16 17:15:03, Jonathan Cameron wrote:
> On Tue, 10 Nov 2020 21:47:21 -0800
> Ben Widawsky <ben.widawsky@intel.com> wrote:
> 
> > The CXL Early Discovery Table is defined in the CXL 2.0 specification as
> > a way for the OS to get CXL specific information from the system
> > firmware.
> > 
> > As of CXL 2.0 spec, only 1 sub structure is defined, the CXL Host Bridge
> > Structure (CHBS) which is primarily useful for telling the OS exactly
> > where the MMIO for the host bridge is.
> > 
> > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> Trivial comments inline.
> 
> Jonathan
> 
> > ---
> >  hw/acpi/cxl.c                       | 72 +++++++++++++++++++++++++++++
> >  hw/i386/acpi-build.c                |  6 ++-
> >  hw/pci-bridge/pci_expander_bridge.c | 21 +--------
> >  include/hw/acpi/cxl.h               |  4 ++
> >  include/hw/pci/pci_bridge.h         | 25 ++++++++++
> >  5 files changed, 107 insertions(+), 21 deletions(-)
> > 
> > diff --git a/hw/acpi/cxl.c b/hw/acpi/cxl.c
> > index 31ceaeecc3..c9631763ad 100644
> > --- a/hw/acpi/cxl.c
> > +++ b/hw/acpi/cxl.c
> > @@ -18,14 +18,86 @@
> >   */
> >  
> >  #include "qemu/osdep.h"
> > +#include "hw/sysbus.h"
> > +#include "hw/pci/pci_bridge.h"
> > +#include "hw/pci/pci_host.h"
> >  #include "hw/cxl/cxl.h"
> > +#include "hw/mem/memory-device.h"
> >  #include "hw/acpi/acpi.h"
> >  #include "hw/acpi/aml-build.h"
> >  #include "hw/acpi/bios-linker-loader.h"
> >  #include "hw/acpi/cxl.h"
> > +#include "hw/acpi/cxl.h"
> >  #include "qapi/error.h"
> >  #include "qemu/uuid.h"
> >  
> > +static void cedt_build_chbs(GArray *table_data, PXBDev *cxl)
> > +{
> > +    SysBusDevice *sbd = SYS_BUS_DEVICE(cxl->cxl.cxl_host_bridge);
> > +    struct MemoryRegion *mr = sbd->mmio[0].memory;
> > +
> > +    /* Type */
> > +    build_append_int_noprefix(table_data, 0, 1);
> > +
> > +    /* Reserved */
> > +    build_append_int_noprefix(table_data, 0xff, 1);
> 
> Why 0xff rather than 0x00?  ACPI uses default of 0 for reserved bits
> (5.2.1 in ACPI 6.3 spec)
> 
> > +
> > +    /* Record Length */
> > +    build_append_int_noprefix(table_data, 32, 2);
> > +
> > +    /* UID */
> > +    build_append_int_noprefix(table_data, cxl->uid, 4);
> > +
> > +    /* Version */
> > +    build_append_int_noprefix(table_data, 1, 4);
> > +
> > +    /* Reserved */
> > +    build_append_int_noprefix(table_data, 0xffffffff, 4);
> > +
> > +    /* Base */
> > +    build_append_int_noprefix(table_data, mr->addr, 8);
> > +
> > +    /* Length */
> > +    build_append_int_noprefix(table_data, memory_region_size(mr), 4);
> 
> Better to just treat this as a 64 bit field as per the spec, even though
> it can only contain 0x10000?
> 

Ah, I based this on a pre-release version where it was 32-bit. I'll fix it.

> > +
> > +    /* Reserved */
> > +    build_append_int_noprefix(table_data, 0xffffffff, 4);
> > +}
> > +
> > +static int cxl_foreach_pxb_hb(Object *obj, void *opaque)
> > +{
> > +    Aml *cedt = opaque;
> > +
> > +    if (object_dynamic_cast(obj, TYPE_PXB_CXL_DEVICE)) {
> > +        PXBDev *pxb = PXB_CXL_DEV(obj);
> > +
> > +        cedt_build_chbs(cedt->buf, pxb);
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +void cxl_build_cedt(GArray *table_offsets, GArray *table_data,
> > +                    BIOSLinker *linker)
> > +{
> > +    const int cedt_start = table_data->len;
> > +    Aml *cedt;
> > +
> > +    cedt = init_aml_allocator();
> > +
> > +    /* reserve space for CEDT header */
> > +    acpi_add_table(table_offsets, table_data);
> > +    acpi_data_push(cedt->buf, sizeof(AcpiTableHeader));
> > +
> > +    object_child_foreach_recursive(object_get_root(), cxl_foreach_pxb_hb, cedt);
> > +
> > +    /* copy AML table into ACPI tables blob and patch header there */
> > +    g_array_append_vals(table_data, cedt->buf->data, cedt->buf->len);
> > +    build_header(linker, table_data, (void *)(table_data->data + cedt_start),
> > +                 "CEDT", table_data->len - cedt_start, 1, NULL, NULL);
> > +    free_aml_allocator();
> > +}
> > +
> >  static Aml *__build_cxl_osc_method(void)
> >  {
> >      Aml *method, *if_uuid, *else_uuid, *if_arg1_not_1, *if_cxl, *if_caps_masked;
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index dd1f8b39d4..eda62dcd6a 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -75,6 +75,8 @@
> >  #include "hw/acpi/ipmi.h"
> >  #include "hw/acpi/hmat.h"
> >  
> > +#include "hw/acpi/cxl.h"
> > +
> >  /* These are used to size the ACPI tables for -M pc-i440fx-1.7 and
> >   * -M pc-i440fx-2.0.  Even if the actual amount of AML generated grows
> >   * a little bit, there should be plenty of free space since the DSDT
> > @@ -1662,7 +1664,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> >  
> >              scope = aml_scope("\\_SB");
> >              if (type == CXL) {
> > -                dev = aml_device("CXL%.01X", pci_bus_uid(bus));
> > +                dev = aml_device("CXL%.01X", uid);
> >              } else {
> >                  dev = aml_device("PC%.02X", bus_num);
> >              }
> > @@ -2568,6 +2570,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
> >                            machine->nvdimms_state, machine->ram_slots);
> >      }
> >  
> > +    cxl_build_cedt(table_offsets, tables_blob, tables->linker);
> > +
> >      acpi_add_table(table_offsets, tables_blob);
> >      build_waet(tables_blob, tables->linker);
> >  
> > diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
> > index 75910f5870..b2c1d9056a 100644
> > --- a/hw/pci-bridge/pci_expander_bridge.c
> > +++ b/hw/pci-bridge/pci_expander_bridge.c
> > @@ -57,26 +57,6 @@ DECLARE_INSTANCE_CHECKER(PXBDev, PXB_DEV,
> >  DECLARE_INSTANCE_CHECKER(PXBDev, PXB_PCIE_DEV,
> >                           TYPE_PXB_PCIE_DEVICE)
> >  
> > -#define TYPE_PXB_CXL_DEVICE "pxb-cxl"
> > -DECLARE_INSTANCE_CHECKER(PXBDev, PXB_CXL_DEV,
> > -                         TYPE_PXB_CXL_DEVICE)
> > -
> > -struct PXBDev {
> > -    /*< private >*/
> > -    PCIDevice parent_obj;
> > -    /*< public >*/
> > -
> > -    uint8_t bus_nr;
> > -    uint16_t numa_node;
> > -    int32_t uid;
> > -    struct cxl_dev {
> > -        HostMemoryBackend *memory_window[CXL_WINDOW_MAX];
> > -
> > -        uint32_t num_windows;
> > -        hwaddr *window_base[CXL_WINDOW_MAX];
> > -    } cxl;
> > -};
> > -
> >  typedef struct CXLHost {
> >      PCIHostState parent_obj;
> >  
> > @@ -351,6 +331,7 @@ static void pxb_dev_realize_common(PCIDevice *dev, enum BusType type,
> >          bus = pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PXB_CXL_BUS);
> >          bus->flags |= PCI_BUS_CXL;
> >          PXB_CXL_HOST(ds)->dev = PXB_CXL_DEV(dev);
> > +        PXB_CXL_DEV(dev)->cxl.cxl_host_bridge = ds;
> >      } else {
> >          bus = pci_root_bus_new(ds, "pxb-internal", NULL, NULL, 0, TYPE_PXB_BUS);
> >          bds = qdev_new("pci-bridge");
> > diff --git a/include/hw/acpi/cxl.h b/include/hw/acpi/cxl.h
> > index 7b8f3b8a2e..db2063f8c9 100644
> > --- a/include/hw/acpi/cxl.h
> > +++ b/include/hw/acpi/cxl.h
> > @@ -18,6 +18,10 @@
> >  #ifndef HW_ACPI_CXL_H
> >  #define HW_ACPI_CXL_H
> >  
> > +#include "hw/acpi/bios-linker-loader.h"
> > +
> > +void cxl_build_cedt(GArray *table_offsets, GArray *table_data,
> > +                    BIOSLinker *linker);
> >  void build_cxl_osc_method(Aml *dev);
> >  
> >  #endif
> > diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
> > index a94d350034..50dd7fdf33 100644
> > --- a/include/hw/pci/pci_bridge.h
> > +++ b/include/hw/pci/pci_bridge.h
> > @@ -28,6 +28,7 @@
> >  
> >  #include "hw/pci/pci.h"
> >  #include "hw/pci/pci_bus.h"
> > +#include "hw/cxl/cxl.h"
> >  #include "qom/object.h"
> >  
> >  typedef struct PCIBridgeWindows PCIBridgeWindows;
> > @@ -81,6 +82,30 @@ struct PCIBridge {
> >  #define PCI_BRIDGE_DEV_PROP_MSI        "msi"
> >  #define PCI_BRIDGE_DEV_PROP_SHPC       "shpc"
> >  
> > +struct PXBDev {
> > +    /*< private >*/
> > +    PCIDevice parent_obj;
> > +    /*< public >*/
> > +
> > +    uint8_t bus_nr;
> > +    uint16_t numa_node;
> > +    int32_t uid;
> > +
> > +    struct cxl_dev {
> > +        HostMemoryBackend *memory_window[CXL_WINDOW_MAX];
> > +
> > +        uint32_t num_windows;
> > +        hwaddr *window_base[CXL_WINDOW_MAX];
> > +
> > +        void *cxl_host_bridge; /* Pointer to a CXLHost */
> > +    } cxl;
> > +};
> > +
> > +typedef struct PXBDev PXBDev;
> > +#define TYPE_PXB_CXL_DEVICE "pxb-cxl"
> > +DECLARE_INSTANCE_CHECKER(PXBDev, PXB_CXL_DEV,
> > +                         TYPE_PXB_CXL_DEVICE)
> > +
> 
> Seems like this could sensibly be on one line?
> Could have been in earlier patch as well of course.
> 

Yeah - this seems to be the convention throughout the code. I didn't follow the
reasoning when it was introduced (which was recently).

> >  int pci_bridge_ssvid_init(PCIDevice *dev, uint8_t offset,
> >                            uint16_t svid, uint16_t ssid,
> >                            Error **errp);
> 

