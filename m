Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE531191F0E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 03:29:58 +0100 (CET)
Received: from localhost ([::1]:58264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGvnp-0004MA-Ru
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 22:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43047)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yan.y.zhao@intel.com>) id 1jGvn0-0003uX-M6
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 22:29:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yan.y.zhao@intel.com>) id 1jGvmy-0002ts-Us
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 22:29:06 -0400
Received: from mga17.intel.com ([192.55.52.151]:21693)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
 id 1jGvmy-0002tI-Kn
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 22:29:04 -0400
IronPort-SDR: YoDvFJqxLwF+inJOZcuEHXQOxaI5YtrKh6FzDTwThwWAlfARvk2DCZA5v7UxBmWlknYhn0n2dB
 VyXuL6YPn87Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2020 19:29:03 -0700
IronPort-SDR: Nm0XexF/m3nlad7W1/Q90ej9x/p61pB0UF5PLK7Af/SIY0kikQ56Nni4FOHYkClvHsbF+T+lFa
 HLFdbE2BdnhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,302,1580803200"; d="scan'208";a="446474735"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by fmsmga005.fm.intel.com with ESMTP; 24 Mar 2020 19:28:59 -0700
Date: Tue, 24 Mar 2020 22:19:28 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH v16 QEMU 14/16] vfio: Add vfio_listener_log_sync to mark
 dirty pages
Message-ID: <20200325021927.GD20109@joy-OptiPlex-7040>
References: <1585084154-29461-1-git-send-email-kwankhede@nvidia.com>
 <1585084154-29461-15-git-send-email-kwankhede@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585084154-29461-15-git-send-email-kwankhede@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 192.55.52.151
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
 Ziye" <ziye.yang@intel.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "eauger@redhat.com" <eauger@redhat.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>, "Liu,
 Changpeng" <changpeng.liu@intel.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 25, 2020 at 05:09:12AM +0800, Kirti Wankhede wrote:
> vfio_listener_log_sync gets list of dirty pages from container using
> VFIO_IOMMU_GET_DIRTY_BITMAP ioctl and mark those pages dirty when all
> devices are stopped and saving state.
> Return early for the RAM block section of mapped MMIO region.
> 
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> Reviewed-by: Neo Jia <cjia@nvidia.com>
> ---
>  hw/vfio/common.c     | 200 +++++++++++++++++++++++++++++++++++++++++++++++++--
>  hw/vfio/trace-events |   1 +
>  2 files changed, 196 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 4a2f0d6a2233..6d41e1ac5c2f 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -29,6 +29,7 @@
>  #include "hw/vfio/vfio.h"
>  #include "exec/address-spaces.h"
>  #include "exec/memory.h"
> +#include "exec/ram_addr.h"
>  #include "hw/hw.h"
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
> @@ -38,6 +39,7 @@
>  #include "sysemu/reset.h"
>  #include "trace.h"
>  #include "qapi/error.h"
> +#include "migration/migration.h"
>  
>  VFIOGroupList vfio_group_list =
>      QLIST_HEAD_INITIALIZER(vfio_group_list);
> @@ -288,6 +290,28 @@ const MemoryRegionOps vfio_region_ops = {
>  };
>  
>  /*
> + * Device state interfaces
> + */
> +
> +static bool vfio_devices_are_stopped_and_saving(void)
> +{
> +    VFIOGroup *group;
> +    VFIODevice *vbasedev;
> +
> +    QLIST_FOREACH(group, &vfio_group_list, next) {
> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
> +            if ((vbasedev->device_state & VFIO_DEVICE_STATE_SAVING) &&
> +                !(vbasedev->device_state & VFIO_DEVICE_STATE_RUNNING)) {
> +                continue;
> +            } else {
> +                return false;
> +            }
> +        }
> +    }
> +    return true;
> +}
> +
> +/*
>   * DMA - Mapping and unmapping for the "type1" IOMMU interface used on x86
>   */
>  static int vfio_dma_unmap(VFIOContainer *container,
> @@ -408,8 +432,8 @@ static bool vfio_listener_skipped_section(MemoryRegionSection *section)
>  }
>  
>  /* Called with rcu_read_lock held.  */
> -static bool vfio_get_vaddr(IOMMUTLBEntry *iotlb, void **vaddr,
> -                           bool *read_only)
> +static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> +                               ram_addr_t *ram_addr, bool *read_only)
>  {
>      MemoryRegion *mr;
>      hwaddr xlat;
> @@ -440,9 +464,17 @@ static bool vfio_get_vaddr(IOMMUTLBEntry *iotlb, void **vaddr,
>          return false;
>      }
>  
> -    *vaddr = memory_region_get_ram_ptr(mr) + xlat;
> -    *read_only = !writable || mr->readonly;
> +    if (vaddr) {
> +        *vaddr = memory_region_get_ram_ptr(mr) + xlat;
> +    }
>  
> +    if (ram_addr) {
> +        *ram_addr = memory_region_get_ram_addr(mr) + xlat;
> +    }
> +
> +    if (read_only) {
> +        *read_only = !writable || mr->readonly;
> +    }
>      return true;
>  }
>  
> @@ -467,7 +499,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
>      rcu_read_lock();
>  
>      if ((iotlb->perm & IOMMU_RW) != IOMMU_NONE) {
> -        if (!vfio_get_vaddr(iotlb, &vaddr, &read_only)) {
> +        if (!vfio_get_xlat_addr(iotlb, &vaddr, NULL, &read_only)) {
>              goto out;
>          }
>          /*
> @@ -813,9 +845,167 @@ static void vfio_listener_region_del(MemoryListener *listener,
>      }
>  }
>  
> +static int vfio_get_dirty_bitmap(MemoryListener *listener,
> +                                 MemoryRegionSection *section)
> +{
> +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> +    VFIOGuestIOMMU *giommu;
> +    IOMMUTLBEntry iotlb;
> +    hwaddr granularity, address_limit, iova;
> +    int ret;
> +
> +    if (memory_region_is_iommu(section->mr)) {
> +        QLIST_FOREACH(giommu, &container->giommu_list, giommu_next) {
> +            if (MEMORY_REGION(giommu->iommu) == section->mr &&
> +                giommu->n.start == section->offset_within_region) {
> +                break;
> +            }
> +        }
> +
> +        if (!giommu) {
> +            return -EINVAL;
> +        }
> +    }
> +
> +    if (memory_region_is_iommu(section->mr)) {
> +        granularity = memory_region_iommu_get_min_page_size(giommu->iommu);
> +
> +        address_limit = MIN(int128_get64(section->size),
> +                            memory_region_iommu_get_address_limit(giommu->iommu,
> +                                                 int128_get64(section->size)));
> +    } else {
> +        granularity = memory_region_size(section->mr);
> +        address_limit = int128_get64(section->size);
> +    }
> +
> +    iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
> +
> +    RCU_READ_LOCK_GUARD();
> +
> +    while (iova < address_limit) {
> +        struct vfio_iommu_type1_dirty_bitmap *dbitmap;
> +        struct vfio_iommu_type1_dirty_bitmap_get *range;
> +        ram_addr_t start, pages;
> +        uint64_t iova_xlat, size;
> +
> +        if (memory_region_is_iommu(section->mr)) {
> +            iotlb = address_space_get_iotlb_entry(container->space->as, iova,
> +                                                 true, MEMTXATTRS_UNSPECIFIED);
> +            if ((iotlb.target_as == NULL) || (iotlb.addr_mask == 0)) {
> +                if ((iova + granularity) < iova) {
> +                    break;
> +                }
> +                iova += granularity;
> +                continue;
> +            }
> +            iova_xlat = iotlb.iova + giommu->iommu_offset;
> +            size = iotlb.addr_mask + 1;
> +        } else {
> +            iova_xlat = iova;
> +            size = address_limit;
> +        }
> +
> +        dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
> +        if (!dbitmap) {
> +            return -ENOMEM;
> +        }
> +
> +        dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
> +        dbitmap->flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP;
> +        range = (struct vfio_iommu_type1_dirty_bitmap_get *)&dbitmap->data;
> +        range->iova = iova_xlat;
> +        range->size = size;
> +
> +        /*
> +         * cpu_physical_memory_set_dirty_lebitmap() expects pages in bitmap of
> +         * TARGET_PAGE_SIZE to mark those dirty. Hence set bitmap's pgsize to
> +         * TARGET_PAGE_SIZE.
> +         */
> +        range->bitmap.pgsize = TARGET_PAGE_SIZE;
> +
> +        /*
> +         * Comment from kvm_physical_sync_dirty_bitmap() since same applies here
> +         * XXX bad kernel interface alert
> +         * For dirty bitmap, kernel allocates array of size aligned to
> +         * bits-per-long.  But for case when the kernel is 64bits and
> +         * the userspace is 32bits, userspace can't align to the same
> +         * bits-per-long, since sizeof(long) is different between kernel
> +         * and user space.  This way, userspace will provide buffer which
> +         * may be 4 bytes less than the kernel will use, resulting in
> +         * userspace memory corruption (which is not detectable by valgrind
> +         * too, in most cases).
> +         * So for now, let's align to 64 instead of HOST_LONG_BITS here, in
> +         * a hope that sizeof(long) won't become >8 any time soon.
> +         */
> +
> +        pages = TARGET_PAGE_ALIGN(range->size) >> TARGET_PAGE_BITS;
> +        range->bitmap.size = ROUND_UP(pages, 64) / 8;
> +        range->bitmap.data = g_malloc0(range->bitmap.size);
> +        if (range->bitmap.data == NULL) {
> +            error_report("Error allocating bitmap of size 0x%llx",
> +                         range->bitmap.size);
> +            ret = -ENOMEM;
> +            goto err_out;
> +        }
> +
> +        ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
> +        if (ret) {
> +            error_report("Failed to get dirty bitmap for iova: 0x%llx "
> +                         "size: 0x%llx err: %d",
> +                         range->iova, range->size, errno);
> +            goto err_out;
> +        }
> +
> +        if (memory_region_is_iommu(section->mr)) {
> +            if (!vfio_get_xlat_addr(&iotlb, NULL, &start, NULL)) {
> +                ret = -EINVAL;
> +                goto err_out;
> +            }
> +        } else {
> +            start = memory_region_get_ram_addr(section->mr) +
> +                    section->offset_within_region + iova -
> +                    TARGET_PAGE_ALIGN(section->offset_within_address_space);
> +        }
> +
> +        cpu_physical_memory_set_dirty_lebitmap((uint64_t *)range->bitmap.data,
> +                                               start, pages);
> +
> +        trace_vfio_get_dirty_bitmap(container->fd, range->iova, range->size,
> +                                    range->bitmap.size, start);
> +err_out:
> +        g_free(range->bitmap.data);
> +        g_free(dbitmap);
> +
> +        if (ret) {
> +            return ret;
> +        }
> +
> +        if ((iova + size) < iova) {
> +            break;
> +        }
> +
> +        iova += size;
> +    }
> +
> +    return 0;
> +}
> +
> +static void vfio_listerner_log_sync(MemoryListener *listener,
> +        MemoryRegionSection *section)
> +{
> +    if (vfio_listener_skipped_section(section)) {
> +        return;
> +    }
> +
> +    if (vfio_devices_are_stopped_and_saving()) {
only get dirty in stopped and saving is not right.

> +        vfio_get_dirty_bitmap(listener, section);
> +    }
> +}
> +
>  static const MemoryListener vfio_memory_listener = {
>      .region_add = vfio_listener_region_add,
>      .region_del = vfio_listener_region_del,
> +    .log_sync = vfio_listerner_log_sync,
>  };
>  
>  static void vfio_listener_release(VFIOContainer *container)
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index ac065b559f4e..bc8f35ee9356 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -160,3 +160,4 @@ vfio_save_complete_precopy(char *name) " (%s)"
>  vfio_load_device_config_state(char *name) " (%s)"
>  vfio_load_state(char *name, uint64_t data) " (%s) data 0x%"PRIx64
>  vfio_load_state_device_data(char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
> +vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
> -- 
> 2.7.0
> 

