Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0559B3D86F5
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 06:58:21 +0200 (CEST)
Received: from localhost ([::1]:37566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8be8-00059x-0u
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 00:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1m8bcU-0002Vz-I1
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 00:56:38 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1m8bcR-0003sG-6E
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 00:56:38 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GZLrZ3HPczZtJl;
 Wed, 28 Jul 2021 12:53:02 +0800 (CST)
Received: from dggpeml500005.china.huawei.com (7.185.36.59) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 28 Jul 2021 12:56:27 +0800
Received: from [10.174.186.51] (10.174.186.51) by
 dggpeml500005.china.huawei.com (7.185.36.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 28 Jul 2021 12:56:26 +0800
From: Zheng Chuan <zhengchuan@huawei.com>
Subject: Re: [PATCH V5 16/25] vfio-pci: cpr part 1
To: Steve Sistare <steven.sistare@oracle.com>, <qemu-devel@nongnu.org>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-17-git-send-email-steven.sistare@oracle.com>
Message-ID: <50a6096e-f49d-4dad-970a-0f78ba601259@huawei.com>
Date: Wed, 28 Jul 2021 12:56:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1625678434-240960-17-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.51]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500005.china.huawei.com (7.185.36.59)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=zhengchuan@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.438,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric
 Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alex
 Williamson <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On 2021/7/8 1:20, Steve Sistare wrote:
> Enable vfio-pci devices to be saved and restored across an exec restart
> of qemu.
> 
> At vfio creation time, save the value of vfio container, group, and device
> descriptors in the environment.
> 
> In cprsave and cprexec, suspend the use of virtual addresses in DMA
> mappings with VFIO_DMA_UNMAP_FLAG_VADDR, because guest ram will be remapped
> at a different VA after exec.  DMA to already-mapped pages continues.  Save
> the msi message area as part of vfio-pci vmstate, save the interrupt and
> notifier eventfd's in the environment, and clear the close-on-exec flag
> for the vfio descriptors.  The flag is not cleared earlier because the
> descriptors should not persist across miscellaneous fork and exec calls
> that may be performed during normal operation.
> 
> On qemu restart, vfio_realize() finds the descriptor env vars, uses
> the descriptors, and notes that the device is being reused.  Device and
> iommu state is already configured, so operations in vfio_realize that
> would modify the configuration are skipped for a reused device, including
> vfio ioctl's and writes to PCI configuration space.  The result is that
> vfio_realize constructs qemu data structures that reflect the current
> state of the device.  However, the reconstruction is not complete until
> cprload is called. cprload loads the msi data and finds eventfds in the
> environment.  It rebuilds vector data structures and attaches the
> interrupts to the new KVM instance.  cprload then walks the flattened
> ranges of the vfio_address_spaces and calls VFIO_DMA_MAP_FLAG_VADDR to
> inform the kernel of the new VA's.  Lastly, it starts the VM and suppresses
> vfio device reset.
> 
> This functionality is delivered by 2 patches for clarity.  Part 2 adds
> eventfd and vector support.
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  MAINTAINERS                   |   1 +
>  hw/pci/pci.c                  |   4 ++
>  hw/vfio/common.c              |  69 +++++++++++++++++--
>  hw/vfio/cpr.c                 | 154 ++++++++++++++++++++++++++++++++++++++++++
>  hw/vfio/meson.build           |   1 +
>  hw/vfio/pci.c                 |  66 +++++++++++++++++-
>  hw/vfio/trace-events          |   1 +
>  include/hw/pci/pci.h          |   1 +
>  include/hw/vfio/vfio-common.h |   5 ++
>  include/migration/cpr.h       |   3 +
>  linux-headers/linux/vfio.h    |   6 ++
>  migration/cpr.c               |  20 ++++++
>  12 files changed, 323 insertions(+), 8 deletions(-)
>  create mode 100644 hw/vfio/cpr.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8647a97..58479db 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2862,6 +2862,7 @@ CPR
>  M: Steve Sistare <steven.sistare@oracle.com>
>  M: Mark Kanda <mark.kanda@oracle.com>
>  S: Maintained
> +F: hw/vfio/cpr.c
>  F: include/migration/cpr.h
>  F: migration/cpr.c
>  F: qapi/cpr.json
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 2590898..fa4a439 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -307,6 +307,10 @@ static void pci_do_device_reset(PCIDevice *dev)
>  {
>      int r;
>  
> +    if (dev->reused) {
> +        return;
> +    }
> +
>      pci_device_deassert_intx(dev);
>      assert(dev->irq_state == 0);
>  
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 9220e64..40c882f 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -31,6 +31,7 @@
>  #include "exec/memory.h"
>  #include "exec/ram_addr.h"
>  #include "hw/hw.h"
> +#include "qemu/env.h"
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/range.h"
> @@ -440,6 +441,10 @@ static int vfio_dma_unmap(VFIOContainer *container,
>          return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
>      }
>  
> +    if (container->reused) {
> +        return 0;
> +    }
> +
>      while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
>          /*
>           * The type1 backend has an off-by-one bug in the kernel (71a7d3d78e3c
> @@ -463,6 +468,11 @@ static int vfio_dma_unmap(VFIOContainer *container,
>          return -errno;
>      }
>  
> +    if (unmap.size != size) {
> +        warn_report("VFIO_UNMAP_DMA(0x%lx, 0x%lx) only unmaps 0x%llx",
> +                     iova, size, unmap.size);
> +    }
> +
>      return 0;
>  }
>  
> @@ -477,6 +487,10 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
>          .size = size,
>      };
>  
> +    if (container->reused) {
> +        return 0;
> +    }
> +
>      if (!readonly) {
>          map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
>      }
> @@ -1603,6 +1617,10 @@ static int vfio_init_container(VFIOContainer *container, int group_fd,
>      if (iommu_type < 0) {
>          return iommu_type;
>      }
> +    if (container->reused) {
> +        container->iommu_type = iommu_type;
> +        return 0;
> +    }
>  
>      ret = ioctl(group_fd, VFIO_GROUP_SET_CONTAINER, &container->fd);
>      if (ret) {
> @@ -1703,6 +1721,8 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>  {
>      VFIOContainer *container;
>      int ret, fd;
> +    bool reused;
> +    char name[40];
>      VFIOAddressSpace *space;
>  
>      space = vfio_get_address_space(as);
> @@ -1739,16 +1759,31 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>          return ret;
>      }
>  
> +    snprintf(name, sizeof(name), "vfio_container_for_group_%d", group->groupid);
> +    fd = getenv_fd(name);
> +    reused = (fd >= 0);
> +
>      QLIST_FOREACH(container, &space->containers, next) {
> -        if (!ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &container->fd)) {
> -            group->container = container;
> -            QLIST_INSERT_HEAD(&container->group_list, group, container_next);
> +        if (container->fd == fd ||
> +            !ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &container->fd)) {
> +            break;
> +        }
> +    }
> +
> +    if (container) {
> +        group->container = container;
> +        QLIST_INSERT_HEAD(&container->group_list, group, container_next);
> +        if (!reused) {
>              vfio_kvm_device_add_group(group);
> -            return 0;
> +            setenv_fd(name, container->fd);
>          }
> +        return 0;
> +    }
> +
> +    if (!reused) {
> +        fd = qemu_open_old("/dev/vfio/vfio", O_RDWR);
>      }
>  
> -    fd = qemu_open_old("/dev/vfio/vfio", O_RDWR);
>      if (fd < 0) {
>          error_setg_errno(errp, errno, "failed to open /dev/vfio/vfio");
>          ret = -errno;
> @@ -1766,6 +1801,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>      container = g_malloc0(sizeof(*container));
>      container->space = space;
>      container->fd = fd;
> +    container->reused = reused;
>      container->error = NULL;
>      container->dirty_pages_supported = false;
>      QLIST_INIT(&container->giommu_list);
> @@ -1893,6 +1929,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>      }
>  
>      container->initialized = true;
> +    setenv_fd(name, fd);
>  
>      return 0;
>  listener_release_exit:
> @@ -1920,6 +1957,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
>  
>      QLIST_REMOVE(group, container_next);
>      group->container = NULL;
> +    unsetenv_fdv("vfio_container_for_group_%d", group->groupid);
>  
>      /*
>       * Explicitly release the listener first before unset container,
> @@ -1978,7 +2016,12 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
>      group = g_malloc0(sizeof(*group));
>  
>      snprintf(path, sizeof(path), "/dev/vfio/%d", groupid);
> -    group->fd = qemu_open_old(path, O_RDWR);
> +
> +    group->fd = getenv_fd(path);
> +    if (group->fd < 0) {
> +        group->fd = qemu_open_old(path, O_RDWR);
> +    }
> +
>      if (group->fd < 0) {
>          error_setg_errno(errp, errno, "failed to open %s", path);
>          goto free_group_exit;
> @@ -2012,6 +2055,8 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
>  
>      QLIST_INSERT_HEAD(&vfio_group_list, group, next);
>  
> +    setenv_fd(path, group->fd);
> +
>      return group;
>  
>  close_fd_exit:
> @@ -2036,6 +2081,7 @@ void vfio_put_group(VFIOGroup *group)
>      vfio_disconnect_container(group);
>      QLIST_REMOVE(group, next);
>      trace_vfio_put_group(group->fd);
> +    unsetenv_fdv("/dev/vfio/%d", group->groupid);
>      close(group->fd);
>      g_free(group);
>  
> @@ -2049,8 +2095,14 @@ int vfio_get_device(VFIOGroup *group, const char *name,
>  {
>      struct vfio_device_info dev_info = { .argsz = sizeof(dev_info) };
>      int ret, fd;
> +    bool reused;
> +
> +    fd = getenv_fd(name);
> +    reused = (fd >= 0);
> +    if (!reused) {
> +        fd = ioctl(group->fd, VFIO_GROUP_GET_DEVICE_FD, name);
> +    }
>  
> -    fd = ioctl(group->fd, VFIO_GROUP_GET_DEVICE_FD, name);
>      if (fd < 0) {
>          error_setg_errno(errp, errno, "error getting device from group %d",
>                           group->groupid);
> @@ -2095,6 +2147,8 @@ int vfio_get_device(VFIOGroup *group, const char *name,
>      vbasedev->num_irqs = dev_info.num_irqs;
>      vbasedev->num_regions = dev_info.num_regions;
>      vbasedev->flags = dev_info.flags;
> +    vbasedev->reused = reused;
> +    setenv_fd(name, fd);
>  
>      trace_vfio_get_device(name, dev_info.flags, dev_info.num_regions,
>                            dev_info.num_irqs);
> @@ -2111,6 +2165,7 @@ void vfio_put_base_device(VFIODevice *vbasedev)
>      QLIST_REMOVE(vbasedev, next);
>      vbasedev->group = NULL;
>      trace_vfio_put_base_device(vbasedev->fd);
> +    unsetenv_fd(vbasedev->name);
>      close(vbasedev->fd);
>  }
>  
> diff --git a/hw/vfio/cpr.c b/hw/vfio/cpr.c
> new file mode 100644
> index 0000000..28f8a76
> --- /dev/null
> +++ b/hw/vfio/cpr.c
> @@ -0,0 +1,154 @@
> +/*
> + * Copyright (c) 2021 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include <sys/ioctl.h>
> +#include <linux/vfio.h>
> +#include "hw/vfio/vfio-common.h"
> +#include "sysemu/kvm.h"
> +#include "qapi/error.h"
> +#include "trace.h"
> +
> +static int
> +vfio_dma_unmap_vaddr_all(VFIOContainer *container, Error **errp)
> +{
> +    struct vfio_iommu_type1_dma_unmap unmap = {
> +        .argsz = sizeof(unmap),
> +        .flags = VFIO_DMA_UNMAP_FLAG_VADDR | VFIO_DMA_UNMAP_FLAG_ALL,
> +        .iova = 0,
> +        .size = 0,
> +    };
> +    if (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
> +        error_setg_errno(errp, errno, "vfio_dma_unmap_vaddr_all");
> +        return -errno;
> +    }
> +    return 0;
> +}
> +
> +static int vfio_dma_map_vaddr(VFIOContainer *container, hwaddr iova,
> +                              ram_addr_t size, void *vaddr,
> +                              Error **errp)
> +{
> +    struct vfio_iommu_type1_dma_map map = {
> +        .argsz = sizeof(map),
> +        .flags = VFIO_DMA_MAP_FLAG_VADDR,
> +        .vaddr = (__u64)(uintptr_t)vaddr,
> +        .iova = iova,
> +        .size = size,
> +    };
> +    if (ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map)) {
> +        error_setg_errno(errp, errno,
> +                         "vfio_dma_map_vaddr(iova %lu, size %ld, va %p)",
> +                         iova, size, vaddr);
> +        return -errno;
> +    }
> +    return 0;
> +}
> +
> +static int
> +vfio_region_remap(MemoryRegionSection *section, void *handle, Error **errp)
> +{
> +    MemoryRegion *mr = section->mr;
> +    VFIOContainer *container = handle;
> +    const char *name = memory_region_name(mr);
> +    ram_addr_t size = int128_get64(section->size);
> +    hwaddr offset, iova, roundup;
> +    void *vaddr;
> +
> +    if (vfio_listener_skipped_section(section) || memory_region_is_iommu(mr)) {
> +        return 0;
> +    }
> +
> +    offset = section->offset_within_address_space;
> +    iova = TARGET_PAGE_ALIGN(offset);
> +    roundup = iova - offset;
> +    size = (size - roundup) & TARGET_PAGE_MASK;
> +    vaddr = memory_region_get_ram_ptr(mr) +
> +            section->offset_within_region + roundup;
> +
> +    trace_vfio_region_remap(name, container->fd, iova, iova + size - 1, vaddr);
> +    return vfio_dma_map_vaddr(container, iova, size, vaddr, errp);
> +}
> +
> +bool vfio_cpr_capable(VFIOContainer *container, Error **errp)
> +{
> +    if (!ioctl(container->fd, VFIO_CHECK_EXTENSION, VFIO_UPDATE_VADDR) ||
> +        !ioctl(container->fd, VFIO_CHECK_EXTENSION, VFIO_UNMAP_ALL)) {
> +        error_setg(errp, "VFIO container does not support VFIO_UPDATE_VADDR "
> +                         "or VFIO_UNMAP_ALL");
> +        return false;
> +    } else {
> +        return true;
> +    }
> +}
> +
> +int vfio_cprsave(Error **errp)
> +{
> +    VFIOAddressSpace *space, *last_space;
> +    VFIOContainer *container, *last_container;
> +
> +    QLIST_FOREACH(space, &vfio_address_spaces, list) {
> +        QLIST_FOREACH(container, &space->containers, next) {
> +            if (!vfio_cpr_capable(container, errp)) {
> +                return 1;
> +            }
> +        }
> +    }
> +
> +    QLIST_FOREACH(space, &vfio_address_spaces, list) {
> +        QLIST_FOREACH(container, &space->containers, next) {
> +            if (vfio_dma_unmap_vaddr_all(container, errp)) {
> +                goto unwind;
> +            }
> +        }
> +    }
> +    return 0;
> +
> +unwind:
> +    last_space = space;
> +    last_container = container;
> +    QLIST_FOREACH(space, &vfio_address_spaces, list) {
> +        QLIST_FOREACH(container, &space->containers, next) {
> +            Error *err;
> +
> +            if (space == last_space && container == last_container) {
> +                break;
> +            }
> +            if (as_flat_walk(space->as, vfio_region_remap, container, &err)) {
> +                error_prepend(errp, "%s", error_get_pretty(err));
> +                error_free(err);
> +            }
> +        }
> +    }
> +    return 1;
> +}
> +
> +int vfio_cprload(Error **errp)
> +{
> +    VFIOAddressSpace *space;
> +    VFIOContainer *container;
> +    VFIOGroup *group;
> +    VFIODevice *vbasedev;
> +
> +    QLIST_FOREACH(space, &vfio_address_spaces, list) {
> +        QLIST_FOREACH(container, &space->containers, next) {
> +            if (!vfio_cpr_capable(container, errp)) {
> +                return 1;
> +            }
> +            container->reused = false;
> +            if (as_flat_walk(space->as, vfio_region_remap, container, errp)) {
> +                return 1;
> +            }
> +        }
> +    }
> +    QLIST_FOREACH(group, &vfio_group_list, next) {
> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
> +            vbasedev->reused = false;
> +        }
> +    }
> +    return 0;
> +}
> diff --git a/hw/vfio/meson.build b/hw/vfio/meson.build
> index da9af29..e247b2b 100644
> --- a/hw/vfio/meson.build
> +++ b/hw/vfio/meson.build
> @@ -5,6 +5,7 @@ vfio_ss.add(files(
>    'migration.c',
>  ))
>  vfio_ss.add(when: 'CONFIG_VFIO_PCI', if_true: files(
> +  'cpr.c',
>    'display.c',
>    'pci-quirks.c',
>    'pci.c',
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 9fc12bc..0f5c542 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -29,6 +29,8 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/qdev-properties-system.h"
>  #include "migration/vmstate.h"
> +#include "migration/cpr.h"
> +#include "qemu/env.h"
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/module.h"
> @@ -1656,6 +1658,7 @@ static void vfio_bars_prepare(VFIOPCIDevice *vdev)
>  static void vfio_bar_register(VFIOPCIDevice *vdev, int nr)
>  {
>      VFIOBAR *bar = &vdev->bars[nr];
> +    PCIDevice *pdev = &vdev->pdev;
>      char *name;
>  
>      if (!bar->size) {
> @@ -1676,7 +1679,7 @@ static void vfio_bar_register(VFIOPCIDevice *vdev, int nr)
>          }
>      }
>  
> -    pci_register_bar(&vdev->pdev, nr, bar->type, bar->mr);
> +    pci_register_bar(pdev, nr, bar->type, bar->mr);
>  }
>  
>  static void vfio_bars_register(VFIOPCIDevice *vdev)
> @@ -2888,6 +2891,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
>          vfio_put_group(group);
>          goto error;
>      }
> +    pdev->reused = vdev->vbasedev.reused;
>  
>      vfio_populate_device(vdev, &err);
>      if (err) {
> @@ -3157,6 +3161,10 @@ static void vfio_pci_reset(DeviceState *dev)
>  {
>      VFIOPCIDevice *vdev = VFIO_PCI(dev);
>  
> +    if (vdev->pdev.reused) {
> +        return;
> +    }
> +
>      trace_vfio_pci_reset(vdev->vbasedev.name);
>  
>      vfio_pci_pre_reset(vdev);
> @@ -3264,6 +3272,61 @@ static Property vfio_pci_dev_properties[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> +static void vfio_merge_config(VFIOPCIDevice *vdev)
> +{
> +    PCIDevice *pdev = &vdev->pdev;
> +    int size = MIN(pci_config_size(pdev), vdev->config_size);
> +    uint8_t *phys_config = g_malloc(size);
> +    uint32_t mask;
> +    int ret, i;
> +
> +    ret = pread(vdev->vbasedev.fd, phys_config, size, vdev->config_offset);
> +    if (ret < size) {
> +        ret = ret < 0 ? errno : EFAULT;
> +        error_report("failed to read device config space: %s", strerror(ret));
> +        return;
> +    }
> +
> +    for (i = 0; i < size; i++) {
> +        mask = vdev->emulated_config_bits[i];
> +        pdev->config[i] = (pdev->config[i] & mask) | (phys_config[i] & ~mask);
> +    }
> +
> +    g_free(phys_config);
> +}
> +
> +static int vfio_pci_post_load(void *opaque, int version_id)
> +{
> +    VFIOPCIDevice *vdev = opaque;
> +    PCIDevice *pdev = &vdev->pdev;
> +    bool enabled;
> +
> +    vfio_merge_config(vdev);
> +
> +    pdev->reused = false;
> +    enabled = pci_get_word(pdev->config + PCI_COMMAND) & PCI_COMMAND_MASTER;
> +    memory_region_set_enabled(&pdev->bus_master_enable_region, enabled);
> +
> +    return 0;
> +}
> +
> +static bool vfio_pci_needed(void *opaque)
> +{
> +    return cpr_mode() == CPR_MODE_RESTART;
> +}
> +
> +static const VMStateDescription vfio_pci_vmstate = {
> +    .name = "vfio-pci",
> +    .unmigratable = 1,
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .post_load = vfio_pci_post_load,
> +    .needed = vfio_pci_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -3271,6 +3334,7 @@ static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
>  
>      dc->reset = vfio_pci_reset;
>      device_class_set_props(dc, vfio_pci_dev_properties);
> +    dc->vmsd = &vfio_pci_vmstate;
>      dc->desc = "VFIO-based PCI device assignment";
>      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>      pdc->realize = vfio_realize;
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 0ef1b5f..63dd0fe 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -118,6 +118,7 @@ vfio_region_sparse_mmap_header(const char *name, int index, int nr_areas) "Devic
>  vfio_region_sparse_mmap_entry(int i, unsigned long start, unsigned long end) "sparse entry %d [0x%lx - 0x%lx]"
>  vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t subtype) "%s index %d, %08x/%0x8"
>  vfio_dma_unmap_overflow_workaround(void) ""
> +vfio_region_remap(const char *name, int fd, uint64_t iova_start, uint64_t iova_end, void *vaddr) "%s fd %d 0x%"PRIx64" - 0x%"PRIx64" [%p]"
>  
>  # platform.c
>  vfio_platform_base_device_init(char *name, int groupid) "%s belongs to group #%d"
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index bef3e49..add7f46 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -360,6 +360,7 @@ struct PCIDevice {
>      /* ID of standby device in net_failover pair */
>      char *failover_pair_id;
>      uint32_t acpi_index;
> +    bool reused;
>  };
>  
>  void pci_register_bar(PCIDevice *pci_dev, int region_num,
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 00acb85..b46d850 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -85,6 +85,7 @@ typedef struct VFIOContainer {
>      Error *error;
>      bool initialized;
>      bool dirty_pages_supported;
> +    bool reused;
>      uint64_t dirty_pgsizes;
>      uint64_t max_dirty_bitmap_size;
>      unsigned long pgsizes;
> @@ -124,6 +125,7 @@ typedef struct VFIODevice {
>      bool no_mmap;
>      bool ram_block_discard_allowed;
>      bool enable_migration;
> +    bool reused;
>      VFIODeviceOps *ops;
>      unsigned int num_irqs;
>      unsigned int num_regions;
> @@ -200,6 +202,9 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp);
>  void vfio_put_group(VFIOGroup *group);
>  int vfio_get_device(VFIOGroup *group, const char *name,
>                      VFIODevice *vbasedev, Error **errp);
> +int vfio_cprsave(Error **errp);
> +int vfio_cprload(Error **errp);
> +bool vfio_cpr_capable(VFIOContainer *container, Error **errp);
>  
>  extern const MemoryRegionOps vfio_region_ops;
>  typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
> diff --git a/include/migration/cpr.h b/include/migration/cpr.h
> index bffee19..1ea5046 100644
> --- a/include/migration/cpr.h
> +++ b/include/migration/cpr.h
> @@ -10,6 +10,9 @@
>  
>  #include "qapi/qapi-types-cpr.h"
>  
> +#define CPR_MODE_NONE ((CprMode)(-1))
> +
> +CprMode cpr_mode(void);
>  void cprsave(const char *file, CprMode mode, Error **errp);
>  void cprexec(strList *args, Error **errp);
>  void cprload(const char *file, Error **errp);
> diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
> index e680594..48a02c0 100644
> --- a/linux-headers/linux/vfio.h
> +++ b/linux-headers/linux/vfio.h
> @@ -52,6 +52,12 @@
>  /* Supports the vaddr flag for DMA map and unmap */
>  #define VFIO_UPDATE_VADDR		10
>  
> +/* Supports VFIO_DMA_UNMAP_FLAG_ALL */
> +#define VFIO_UNMAP_ALL                        9
> +
> +/* Supports VFIO DMA map and unmap with the VADDR flag */
> +#define VFIO_UPDATE_VADDR              10
> +
>  /*
>   * The IOCTL interface is designed for extensibility by embedding the
>   * structure length (argsz) and flags into structures passed between
> diff --git a/migration/cpr.c b/migration/cpr.c
> index fb57dec..578466c 100644
> --- a/migration/cpr.c
> +++ b/migration/cpr.c
> @@ -31,6 +31,13 @@
>  #include "hw/virtio/vhost.h"
>  #include "qemu/env.h"
>  
> +static CprMode cpr_active_mode = CPR_MODE_NONE;
> +
> +CprMode cpr_mode(void)
> +{
> +    return cpr_active_mode;
> +}
> +
>  QEMUFile *qf_file_open(const char *path, int flags, int mode,
>                                const char *name, Error **errp)
>  {
> @@ -92,6 +99,7 @@ void cprsave(const char *file, CprMode mode, Error **errp)
>      }
>      vm_stop(RUN_STATE_SAVE_VM);
>  
> +    cpr_active_mode = mode;
>      ret = qemu_save_device_state(f);
>      qemu_fclose(f);
>      if (ret < 0) {
> @@ -105,6 +113,7 @@ err:
>      if (saved_vm_running) {
>          vm_start();
>      }
> +    cpr_active_mode = CPR_MODE_NONE;
>  done:
>      return;
>  }
> @@ -125,6 +134,13 @@ void cprexec(strList *args, Error **errp)
>          error_setg(errp, "runstate is not save-vm");
>          return;
>      }
> +    if (cpr_active_mode != CPR_MODE_RESTART) {
> +        error_setg(errp, "cprexec requires cprsave with restart mode");
> +        return;
> +    }
> +    if (vfio_cprsave(errp)) {
> +        return;
> +    }
>      walkenv(FD_PREFIX, preserve_fd, 0);
>      qemu_system_exec_request(args);
>  }
> @@ -158,6 +174,10 @@ void cprload(const char *file, Error **errp)
>          return;
>      }
>  
> +    if (vfio_cprload(errp)) {
> +        return;
> +    }
> +
It will compile failed in some targets without vfio support such as m68k.
Maybe CONFIG_VFIO should be added for vfio_{save, load}.

>      state = global_state_get_runstate();
>      if (state == RUN_STATE_RUNNING) {
>          vm_start();
> 

-- 
Regards.
Chuan

