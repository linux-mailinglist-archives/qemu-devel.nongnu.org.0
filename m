Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFC14DE06
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 02:20:12 +0200 (CEST)
Received: from localhost ([::1]:53604 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1he7Hi-00025A-8Y
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 20:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36281)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <yan.y.zhao@intel.com>) id 1he7GJ-0001dd-3b
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 20:18:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yan.y.zhao@intel.com>) id 1he7GD-0000Ic-Cc
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 20:18:35 -0400
Received: from mga11.intel.com ([192.55.52.93]:18369)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
 id 1he7GC-0000Ab-Ay
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 20:18:33 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jun 2019 17:18:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,398,1557212400"; d="scan'208";a="183253959"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by fmsmga004.fm.intel.com with ESMTP; 20 Jun 2019 17:18:21 -0700
Date: Thu, 20 Jun 2019 20:12:29 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <20190621001228.GE9303@joy-OptiPlex-7040>
References: <1561041461-22326-1-git-send-email-kwankhede@nvidia.com>
 <1561041461-22326-4-git-send-email-kwankhede@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1561041461-22326-4-git-send-email-kwankhede@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.93
Subject: Re: [Qemu-devel] [PATCH v4 03/13] vfio: Add save and load functions
 for VFIO PCI devices
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: "Zhengxiao.zx@Alibaba-inc.com" <Zhengxiao.zx@Alibaba-inc.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "cjia@nvidia.com" <cjia@nvidia.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "yulei.zhang@intel.com" <yulei.zhang@intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "eauger@redhat.com" <eauger@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "felipe@nutanix.com" <felipe@nutanix.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>, "Liu,
 Changpeng" <changpeng.liu@intel.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 20, 2019 at 10:37:31PM +0800, Kirti Wankhede wrote:
> These functions save and restore PCI device specific data - config
> space of PCI device.
> Tested save and restore with MSI and MSIX type.
> 
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> Reviewed-by: Neo Jia <cjia@nvidia.com>
> ---
>  hw/vfio/pci.c | 112 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  hw/vfio/pci.h |  29 +++++++++++++++
>  2 files changed, 141 insertions(+)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index ce3fe96efe2c..09a0821a5b1c 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -1187,6 +1187,118 @@ void vfio_pci_write_config(PCIDevice *pdev,
>      }
>  }
>  
> +void vfio_pci_save_config(VFIODevice *vbasedev, QEMUFile *f)
> +{
> +    VFIOPCIDevice *vdev = container_of(vbasedev, VFIOPCIDevice, vbasedev);
> +    PCIDevice *pdev = &vdev->pdev;
> +    uint16_t pci_cmd;
> +    int i;
> +
> +    for (i = 0; i < PCI_ROM_SLOT; i++) {
> +        uint32_t bar;
> +
> +        bar = pci_default_read_config(pdev, PCI_BASE_ADDRESS_0 + i * 4, 4);
> +        qemu_put_be32(f, bar);
> +    }
> +
> +    qemu_put_be32(f, vdev->interrupt);
> +    if (vdev->interrupt == VFIO_INT_MSI) {
> +        uint32_t msi_flags, msi_addr_lo, msi_addr_hi = 0, msi_data;
> +        bool msi_64bit;
> +
> +        msi_flags = pci_default_read_config(pdev, pdev->msi_cap + PCI_MSI_FLAGS,
> +                                            2);
> +        msi_64bit = (msi_flags & PCI_MSI_FLAGS_64BIT);
> +
> +        msi_addr_lo = pci_default_read_config(pdev,
> +                                         pdev->msi_cap + PCI_MSI_ADDRESS_LO, 4);
> +        qemu_put_be32(f, msi_addr_lo);
> +
> +        if (msi_64bit) {
> +            msi_addr_hi = pci_default_read_config(pdev,
> +                                             pdev->msi_cap + PCI_MSI_ADDRESS_HI,
> +                                             4);
> +        }
> +        qemu_put_be32(f, msi_addr_hi);
> +
> +        msi_data = pci_default_read_config(pdev,
> +                pdev->msi_cap + (msi_64bit ? PCI_MSI_DATA_64 : PCI_MSI_DATA_32),
> +                2);
> +        qemu_put_be32(f, msi_data);
> +    } else if (vdev->interrupt == VFIO_INT_MSIX) {
> +        uint16_t offset;
> +
> +        /* save enable bit and maskall bit */
> +        offset = pci_default_read_config(pdev,
> +                                       pdev->msix_cap + PCI_MSIX_FLAGS + 1, 2);
> +        qemu_put_be16(f, offset);
> +        msix_save(pdev, f);
> +    }
> +    pci_cmd = pci_default_read_config(pdev, PCI_COMMAND, 2);
> +    qemu_put_be16(f, pci_cmd);
> +}
> +
> +void vfio_pci_load_config(VFIODevice *vbasedev, QEMUFile *f)
> +{
> +    VFIOPCIDevice *vdev = container_of(vbasedev, VFIOPCIDevice, vbasedev);
> +    PCIDevice *pdev = &vdev->pdev;
> +    uint32_t interrupt_type;
> +    uint32_t msi_flags, msi_addr_lo, msi_addr_hi = 0, msi_data;
> +    uint16_t pci_cmd;
> +    bool msi_64bit;
> +    int i;
> +
> +    /* retore pci bar configuration */
> +    pci_cmd = pci_default_read_config(pdev, PCI_COMMAND, 2);
> +    vfio_pci_write_config(pdev, PCI_COMMAND,
> +                        pci_cmd & (!(PCI_COMMAND_IO | PCI_COMMAND_MEMORY)), 2);
> +    for (i = 0; i < PCI_ROM_SLOT; i++) {
> +        uint32_t bar = qemu_get_be32(f);
> +
> +        vfio_pci_write_config(pdev, PCI_BASE_ADDRESS_0 + i * 4, bar, 4);
> +    }
> +    vfio_pci_write_config(pdev, PCI_COMMAND,
> +                          pci_cmd | PCI_COMMAND_IO | PCI_COMMAND_MEMORY, 2);
> +
> +    interrupt_type = qemu_get_be32(f);
> +
> +    if (interrupt_type == VFIO_INT_MSI) {
> +        /* restore msi configuration */
> +        msi_flags = pci_default_read_config(pdev,
> +                                            pdev->msi_cap + PCI_MSI_FLAGS, 2);
> +        msi_64bit = (msi_flags & PCI_MSI_FLAGS_64BIT);
> +
> +        vfio_pci_write_config(pdev, pdev->msi_cap + PCI_MSI_FLAGS,
> +                              msi_flags & (!PCI_MSI_FLAGS_ENABLE), 2);
> +
> +        msi_addr_lo = qemu_get_be32(f);
> +        vfio_pci_write_config(pdev, pdev->msi_cap + PCI_MSI_ADDRESS_LO,
> +                              msi_addr_lo, 4);
> +
> +        msi_addr_hi = qemu_get_be32(f);
> +        if (msi_64bit) {
> +            vfio_pci_write_config(pdev, pdev->msi_cap + PCI_MSI_ADDRESS_HI,
> +                                  msi_addr_hi, 4);
> +        }
> +        msi_data = qemu_get_be32(f);
> +        vfio_pci_write_config(pdev,
> +                pdev->msi_cap + (msi_64bit ? PCI_MSI_DATA_64 : PCI_MSI_DATA_32),
> +                msi_data, 2);
> +
> +        vfio_pci_write_config(pdev, pdev->msi_cap + PCI_MSI_FLAGS,
> +                              msi_flags | PCI_MSI_FLAGS_ENABLE, 2);
> +    } else if (interrupt_type == VFIO_INT_MSIX) {
> +        uint16_t offset = qemu_get_be16(f);
> +
> +        /* load enable bit and maskall bit */
> +        vfio_pci_write_config(pdev, pdev->msix_cap + PCI_MSIX_FLAGS + 1,
> +                              offset, 2);
> +        msix_load(pdev, f);
> +    }
> +    pci_cmd = qemu_get_be16(f);
> +    vfio_pci_write_config(pdev, PCI_COMMAND, pci_cmd, 2);
> +}
> +
per the previous discussion, pci config state save/restore are better
defined in fileds of VMStateDescription.


>  /*
>   * Interrupt setup
>   */
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index 834a90d64686..847be5f56478 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -19,6 +19,7 @@
>  #include "qemu/queue.h"
>  #include "qemu/timer.h"
>  
> +#ifdef CONFIG_LINUX
>  #define PCI_ANY_ID (~0)
>  
>  struct VFIOPCIDevice;
> @@ -202,4 +203,32 @@ void vfio_display_reset(VFIOPCIDevice *vdev);
>  int vfio_display_probe(VFIOPCIDevice *vdev, Error **errp);
>  void vfio_display_finalize(VFIOPCIDevice *vdev);
>  
> +void vfio_pci_save_config(VFIODevice *vbasedev, QEMUFile *f);
> +void vfio_pci_load_config(VFIODevice *vbasedev, QEMUFile *f);
> +
> +static inline Object *vfio_pci_get_object(VFIODevice *vbasedev)
> +{
> +    VFIOPCIDevice *vdev = container_of(vbasedev, VFIOPCIDevice, vbasedev);
> +
> +    return OBJECT(vdev);
> +}
> +
> +#else
> +static inline void vfio_pci_save_config(VFIODevice *vbasedev, QEMUFile *f)
> +{
> +    g_assert(false);
> +}
> +
> +static inline void vfio_pci_load_config(VFIODevice *vbasedev, QEMUFile *f)
> +{
> +    g_assert(false);
> +}
> +
> +static inline Object *vfio_pci_get_object(VFIODevice *vbasedev)
> +{
> +    return NULL;
> +}
> +
> +#endif
> +
>  #endif /* HW_VFIO_VFIO_PCI_H */
> -- 
> 2.7.0
> 

