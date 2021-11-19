Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEBC457921
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 23:53:24 +0100 (CET)
Received: from localhost ([::1]:54318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moCl1-0005u3-Vt
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 17:53:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1moCbD-0006ph-9j
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 17:43:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1moCbA-0002ko-9j
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 17:43:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637361791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0OMKRCcm4UW2G7ssK/6red17Oso+19T74Y1ry0TdtzY=;
 b=KRRlvjWJCa+fRYH97Jaf/7f+WH8Sbdpc+yjlVW0/qjU0UnLOD9a2ukgdLNUTzMrJUYOHMd
 9aDKdU8NaR5p7dm6rx+1N6Xf4hAb7+hlwEfpIo2EEoHTdUnSMz+YWGZ8p2aExOeKEJK53J
 B0ur8Lc/s5pbm/kn1+BRbTb6JGZ2kB0=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-KgnvdVO8PmadNRfc84z8vg-1; Fri, 19 Nov 2021 17:43:10 -0500
X-MC-Unique: KgnvdVO8PmadNRfc84z8vg-1
Received: by mail-oi1-f200.google.com with SMTP id
 y3-20020aca3203000000b002a7bbc6589cso7680533oiy.19
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 14:43:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0OMKRCcm4UW2G7ssK/6red17Oso+19T74Y1ry0TdtzY=;
 b=TtOf4Hq+VeqI3sTFtAG6pEaaBmhsEfSKtrj+G+iSnR5XQXH25XEmkMLzP0k0okpF9k
 GuM6I5ZiuJ7nsRYAczBweB83TLhUHkqbAsvn2XlBxynGiF0+hqDtlgKT4JEgdzNuiV+A
 +sngtNE6XgC3R6U6qBzPxASzD24IYiYDgRgoHxcuVXmlYe8RVbLkDbwYjpfF8fN/qs4Y
 ER7caNUSiKAnz5pPDdw/1rnbjgYP8YPdp1Ny/U0VkU63/4Qs9n2D6crWX+wcT5KR407H
 Ga+/h1L0vQMzfd4LcFZw8s7loxpnNTTIO+/5VkDICoT44C6GddpHAYbtmHmydxRhvzxI
 BYHg==
X-Gm-Message-State: AOAM531BlmPCZUhZ1N7+bF4ByvPxZ45iub4gBB43rvkx141iliSzs2Ps
 cZ1m5/G+jtP/f1GFf1lhUUvOLkbbVNQPRfJy6CISXOeL15p0Axs3wgMMTGgrdgeBEcdvNoq7VVm
 Ik9/JdL7PfEwooqU=
X-Received: by 2002:a05:6830:2053:: with SMTP id
 f19mr7303413otp.295.1637361789002; 
 Fri, 19 Nov 2021 14:43:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztkmv4zcM0buq6bgoK5mhL1sYFzHImzWShUVFflQRnb/mmnYdSXhuXR4V6OI1ENWFyPNWaRA==
X-Received: by 2002:a05:6830:2053:: with SMTP id
 f19mr7303357otp.295.1637361788376; 
 Fri, 19 Nov 2021 14:43:08 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id g26sm239115ots.25.2021.11.19.14.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 14:43:08 -0800 (PST)
Date: Fri, 19 Nov 2021 15:42:31 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [RFC v3 16/19] vfio-user: dma map/unmap operations
Message-ID: <20211119154231.119a8c6e.alex.williamson@redhat.com>
In-Reply-To: <9317e19ef1b2b73864be268b6715fcf53a0704a4.1636057885.git.john.g.johnson@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
 <9317e19ef1b2b73864be268b6715fcf53a0704a4.1636057885.git.john.g.johnson@oracle.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  8 Nov 2021 16:46:44 -0800
John Johnson <john.g.johnson@oracle.com> wrote:

> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> ---
>  hw/vfio/pci.h                 |   1 +
>  hw/vfio/user-protocol.h       |  32 +++++++
>  hw/vfio/user.h                |   1 +
>  include/hw/vfio/vfio-common.h |   4 +
>  hw/vfio/common.c              |  76 +++++++++++++---
>  hw/vfio/pci.c                 |   4 +
>  hw/vfio/user.c                | 206 ++++++++++++++++++++++++++++++++++++++++++
>  7 files changed, 309 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index 643ff75..156fee2 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -193,6 +193,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(VFIOUserPCIDevice, VFIO_USER_PCI)
>  struct VFIOUserPCIDevice {
>      VFIOPCIDevice device;
>      char *sock_name;
> +    bool secure_dma;    /* disable shared mem for DMA */

????????????  It's there, it's gone, it's back.

>      bool send_queued;   /* all sends are queued */
>      bool no_post;       /* all regions write are sync */
>  };
> diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
> index 5614efa..ca53fce 100644
> --- a/hw/vfio/user-protocol.h
> +++ b/hw/vfio/user-protocol.h
> @@ -83,6 +83,31 @@ typedef struct {
>  
>  
>  /*
> + * VFIO_USER_DMA_MAP
> + * imported from struct vfio_iommu_type1_dma_map
> + */
> +typedef struct {
> +    VFIOUserHdr hdr;
> +    uint32_t argsz;
> +    uint32_t flags;
> +    uint64_t offset;    /* FD offset */
> +    uint64_t iova;
> +    uint64_t size;
> +} VFIOUserDMAMap;
> +
> +/*
> + * VFIO_USER_DMA_UNMAP
> + * imported from struct vfio_iommu_type1_dma_unmap
> + */
> +typedef struct {
> +    VFIOUserHdr hdr;
> +    uint32_t argsz;
> +    uint32_t flags;
> +    uint64_t iova;
> +    uint64_t size;
> +} VFIOUserDMAUnmap;
> +
> +/*
>   * VFIO_USER_DEVICE_GET_INFO
>   * imported from struct_device_info
>   */
> @@ -146,4 +171,11 @@ typedef struct {
>      char data[];
>  } VFIOUserRegionRW;
>  
> +/*imported from struct vfio_bitmap */
> +typedef struct {
> +    uint64_t pgsize;
> +    uint64_t size;
> +    char data[];
> +} VFIOUserBitmap;
> +
>  #endif /* VFIO_USER_PROTOCOL_H */
> diff --git a/hw/vfio/user.h b/hw/vfio/user.h
> index 8d03e7c..997f748 100644
> --- a/hw/vfio/user.h
> +++ b/hw/vfio/user.h
> @@ -74,6 +74,7 @@ typedef struct VFIOProxy {
>  
>  /* VFIOProxy flags */
>  #define VFIO_PROXY_CLIENT        0x1
> +#define VFIO_PROXY_SECURE        0x2
>  #define VFIO_PROXY_FORCE_QUEUED  0x4
>  #define VFIO_PROXY_NO_POST       0x8
>  
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index c0e7632..dcfae2c 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -90,6 +90,8 @@ typedef struct VFIOContainer {
>      VFIOContIO *io_ops;
>      bool initialized;
>      bool dirty_pages_supported;
> +    bool will_commit;

The entire will_commit concept hidden in the map and unmap operations
from many patches ago should be introduced here, or later.

> +    bool need_map_fd;
>      uint64_t dirty_pgsizes;
>      uint64_t max_dirty_bitmap_size;
>      unsigned long pgsizes;
> @@ -210,6 +212,7 @@ struct VFIOContIO {
>      int (*dirty_bitmap)(VFIOContainer *container,
>                          struct vfio_iommu_type1_dirty_bitmap *bitmap,
>                          struct vfio_iommu_type1_dirty_bitmap_get *range);
> +    void (*wait_commit)(VFIOContainer *container);
>  };
>  
>  #define CONT_DMA_MAP(cont, map, fd, will_commit) \
> @@ -218,6 +221,7 @@ struct VFIOContIO {
>      ((cont)->io_ops->dma_unmap((cont), (unmap), (bitmap), (will_commit)))
>  #define CONT_DIRTY_BITMAP(cont, bitmap, range) \
>      ((cont)->io_ops->dirty_bitmap((cont), (bitmap), (range)))
> +#define CONT_WAIT_COMMIT(cont) ((cont)->io_ops->wait_commit(cont))
>  
>  extern VFIODevIO vfio_dev_io_ioctl;
>  extern VFIOContIO vfio_cont_io_ioctl;
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index fdd2702..0840c8f 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -411,6 +411,7 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
>      struct vfio_iommu_type1_dma_unmap *unmap;
>      struct vfio_bitmap *bitmap;
>      uint64_t pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size;
> +    bool will_commit = container->will_commit;
>      int ret;
>  
>      unmap = g_malloc0(sizeof(*unmap) + sizeof(*bitmap));
> @@ -444,7 +445,7 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
>          goto unmap_exit;
>      }
>  
> -    ret = CONT_DMA_UNMAP(container, unmap, bitmap, false);
> +    ret = CONT_DMA_UNMAP(container, unmap, bitmap, will_commit);
>      if (!ret) {
>          cpu_physical_memory_set_dirty_lebitmap((unsigned long *)bitmap->data,
>                  iotlb->translated_addr, pages);
> @@ -471,16 +472,17 @@ static int vfio_dma_unmap(VFIOContainer *container,
>          .iova = iova,
>          .size = size,
>      };
> +    bool will_commit = container->will_commit;
>  
>      if (iotlb && container->dirty_pages_supported &&
>          vfio_devices_all_running_and_saving(container)) {
>          return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
>      }
>  
> -    return CONT_DMA_UNMAP(container, &unmap, NULL, false);
> +    return CONT_DMA_UNMAP(container, &unmap, NULL, will_commit);

We're passing the container, why do we need a separate will_commit arg
for these?


>  }
>  
> -static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
> +static int vfio_dma_map(VFIOContainer *container, MemoryRegion *mr, hwaddr iova,
>                          ram_addr_t size, void *vaddr, bool readonly)
>  {
>      struct vfio_iommu_type1_dma_map map = {
> @@ -490,13 +492,23 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
>          .iova = iova,
>          .size = size,
>      };
> -    int ret;
> +    int fd, ret;
> +    bool will_commit = container->will_commit;
>  
>      if (!readonly) {
>          map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
>      }
>  
> -    ret = CONT_DMA_MAP(container, &map, -1, false);
> +    if (container->need_map_fd) {
> +        fd = memory_region_get_fd(mr);
> +        if (fd != -1) {
> +            map.vaddr = qemu_ram_block_host_offset(mr->ram_block, vaddr);
> +        }
> +    } else {
> +        fd = -1;
> +    }
> +
> +    ret = CONT_DMA_MAP(container, &map, fd, will_commit);

Why were we even passing a -1 fd previously?  Would it make more sense
to pass the mr and put this in the user variant .map_dma?  We're going
to the trouble to pass the mr down this far here.  If the map callback
handled the above fd and map.vaddr we could also avoid of the
need_map_fd flag on the container.

>  
>      if (ret < 0) {
>          error_report("VFIO_MAP_DMA failed: %s", strerror(-ret));
> @@ -557,7 +569,8 @@ static bool vfio_listener_skipped_section(MemoryRegionSection *section)
>  
>  /* Called with rcu_read_lock held.  */
>  static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> -                               ram_addr_t *ram_addr, bool *read_only)
> +                               ram_addr_t *ram_addr, bool *read_only,
> +                               MemoryRegion **mrp)
>  {
>      MemoryRegion *mr;
>      hwaddr xlat;
> @@ -638,6 +651,10 @@ static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
>          *read_only = !writable || mr->readonly;
>      }
>  
> +    if (mrp != NULL) {
> +        *mrp = mr;
> +    }
> +
>      return true;
>  }
>  
> @@ -645,6 +662,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
>  {
>      VFIOGuestIOMMU *giommu = container_of(n, VFIOGuestIOMMU, n);
>      VFIOContainer *container = giommu->container;
> +    MemoryRegion *mr;
>      hwaddr iova = iotlb->iova + giommu->iommu_offset;
>      void *vaddr;
>      int ret;
> @@ -663,7 +681,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
>      if ((iotlb->perm & IOMMU_RW) != IOMMU_NONE) {
>          bool read_only;
>  
> -        if (!vfio_get_xlat_addr(iotlb, &vaddr, NULL, &read_only)) {
> +        if (!vfio_get_xlat_addr(iotlb, &vaddr, NULL, &read_only, &mr)) {
>              goto out;
>          }
>          /*
> @@ -673,14 +691,14 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
>           * of vaddr will always be there, even if the memory object is
>           * destroyed and its backing memory munmap-ed.
>           */
> -        ret = vfio_dma_map(container, iova,
> +        ret = vfio_dma_map(container, mr, iova,
>                             iotlb->addr_mask + 1, vaddr,
>                             read_only);
>          if (ret) {
>              error_report("vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
> -                         "0x%"HWADDR_PRIx", %p) = %d (%m)",
> +                         "0x%"HWADDR_PRIx", %p)",
>                           container, iova,
> -                         iotlb->addr_mask + 1, vaddr, ret);
> +                         iotlb->addr_mask + 1, vaddr);
>          }
>      } else {
>          ret = vfio_dma_unmap(container, iova, iotlb->addr_mask + 1, iotlb);
> @@ -735,7 +753,7 @@ static int vfio_ram_discard_notify_populate(RamDiscardListener *rdl,
>                 section->offset_within_address_space;
>          vaddr = memory_region_get_ram_ptr(section->mr) + start;
>  
> -        ret = vfio_dma_map(vrdl->container, iova, next - start,
> +        ret = vfio_dma_map(vrdl->container, section->mr, iova, next - start,
>                             vaddr, section->readonly);
>          if (ret) {
>              /* Rollback */
> @@ -843,6 +861,23 @@ static void vfio_unregister_ram_discard_listener(VFIOContainer *container,
>      g_free(vrdl);
>  }
>  
> +static void vfio_listener_begin(MemoryListener *listener)
> +{
> +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> +
> +    /* cannot drop BQL during the transaction, send maps/demaps async */
> +    container->will_commit = true;
> +}
> +
> +static void vfio_listener_commit(MemoryListener *listener)
> +{
> +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> +
> +    /* wait for any async requests sent during the transaction */
> +    CONT_WAIT_COMMIT(container);
> +    container->will_commit = false;
> +}

Not sure I follow the semantics, when would the map/unmap callbacks get
called when will_commit is false?

Does it really make sense to have macros for ops that we call in one
place?

> +
>  static void vfio_listener_region_add(MemoryListener *listener,
>                                       MemoryRegionSection *section)
>  {
> @@ -1035,12 +1070,12 @@ static void vfio_listener_region_add(MemoryListener *listener,
>          }
>      }
>  
> -    ret = vfio_dma_map(container, iova, int128_get64(llsize),
> +    ret = vfio_dma_map(container, section->mr, iova, int128_get64(llsize),
>                         vaddr, section->readonly);
>      if (ret) {
>          error_setg(&err, "vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
> -                   "0x%"HWADDR_PRIx", %p) = %d (%m)",
> -                   container, iova, int128_get64(llsize), vaddr, ret);
> +                   "0x%"HWADDR_PRIx", %p)",
> +                   container, iova, int128_get64(llsize), vaddr);
>          if (memory_region_is_ram_device(section->mr)) {
>              /* Allow unexpected mappings not to be fatal for RAM devices */
>              error_report_err(err);
> @@ -1301,7 +1336,7 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
>      }
>  
>      rcu_read_lock();
> -    if (vfio_get_xlat_addr(iotlb, NULL, &translated_addr, NULL)) {
> +    if (vfio_get_xlat_addr(iotlb, NULL, &translated_addr, NULL, NULL)) {
>          int ret;
>  
>          ret = vfio_get_dirty_bitmap(container, iova, iotlb->addr_mask + 1,
> @@ -1418,6 +1453,8 @@ static void vfio_listener_log_sync(MemoryListener *listener,
>  }
>  
>  static const MemoryListener vfio_memory_listener = {
> +    .begin = vfio_listener_begin,
> +    .commit = vfio_listener_commit,
>      .region_add = vfio_listener_region_add,
>      .region_del = vfio_listener_region_del,
>      .log_global_start = vfio_listener_log_global_start,
> @@ -1561,6 +1598,7 @@ int vfio_region_setup(Object *obj, VFIODevice *vbasedev, VFIORegion *region,
>      region->size = info->size;
>      region->fd_offset = info->offset;
>      region->nr = index;
> +    region->post_wr = false;

Should this be in a different patch?  It looks unrelated.

>      region->remfd = vfio_get_region_info_remfd(vbasedev, index);
>  
>      if (region->size) {
> @@ -2047,6 +2085,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>      container->dirty_pages_supported = false;
>      container->dma_max_mappings = 0;
>      container->io_ops = &vfio_cont_io_ioctl;
> +    container->need_map_fd = false;
>      QLIST_INIT(&container->giommu_list);
>      QLIST_INIT(&container->hostwin_list);
>      QLIST_INIT(&container->vrdl_list);
> @@ -2230,6 +2269,7 @@ void vfio_connect_proxy(VFIOProxy *proxy, VFIOGroup *group, AddressSpace *as)
>      container->space = space;
>      container->fd = -1;
>      container->io_ops = &vfio_cont_io_sock;
> +    container->need_map_fd = (proxy->flags & VFIO_PROXY_SECURE) == 0;
>      QLIST_INIT(&container->giommu_list);
>      QLIST_INIT(&container->hostwin_list);
>      container->proxy = proxy;
> @@ -2879,8 +2919,14 @@ static int vfio_io_dirty_bitmap(VFIOContainer *container,
>      return ret;
>  }
>  
> +static void vfio_io_wait_commit(VFIOContainer *container)
> +{
> +    /* ioctl()s are synchronous */
> +}
> +

Maybe these should just be "dma_commit" rather than "wait_commit"?  I'd
also tend to suggest "async" rather than "will_commit".

>  VFIOContIO vfio_cont_io_ioctl = {
>      .dma_map = vfio_io_dma_map,
>      .dma_unmap = vfio_io_dma_unmap,
>      .dirty_bitmap = vfio_io_dirty_bitmap,
> +    .wait_commit = vfio_io_wait_commit,
>  };
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index d657b01..ca821da 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3516,6 +3516,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
>      vbasedev->proxy = proxy;
>      vfio_user_set_handler(vbasedev, vfio_user_pci_process_req, vdev);
>  
> +    if (udev->secure_dma) {
> +        proxy->flags |= VFIO_PROXY_SECURE;
> +    }
>      if (udev->send_queued) {
>          proxy->flags |= VFIO_PROXY_FORCE_QUEUED;
>      }
> @@ -3686,6 +3689,7 @@ static void vfio_user_instance_finalize(Object *obj)
>  
>  static Property vfio_user_pci_dev_properties[] = {
>      DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
> +    DEFINE_PROP_BOOL("secure-dma", VFIOUserPCIDevice, secure_dma, false),

"secure_dma" looks entirely compartmentalized that it could be a
separate patch.  Thanks,

Alex

>      DEFINE_PROP_BOOL("x-send-queued", VFIOUserPCIDevice, send_queued, false),
>      DEFINE_PROP_BOOL("x-no-posted-writes", VFIOUserPCIDevice, no_post, false),
>      DEFINE_PROP_END_OF_LIST(),
> diff --git a/hw/vfio/user.c b/hw/vfio/user.c
> index 70fe7a6..cee08b6 100644
> --- a/hw/vfio/user.c
> +++ b/hw/vfio/user.c
> @@ -52,8 +52,11 @@ static void vfio_user_request(void *opaque);
>  static int vfio_user_send_queued(VFIOProxy *proxy, VFIOUserMsg *msg);
>  static void vfio_user_send_async(VFIOProxy *proxy, VFIOUserHdr *hdr,
>                                   VFIOUserFDs *fds);
> +static void vfio_user_send_nowait(VFIOProxy *proxy, VFIOUserHdr *hdr,
> +                                  VFIOUserFDs *fds, int rsize);
>  static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
>                                  VFIOUserFDs *fds, int rsize, bool nobql);
> +static void vfio_user_wait_reqs(VFIOProxy *proxy);
>  static void vfio_user_request_msg(VFIOUserHdr *hdr, uint16_t cmd,
>                                    uint32_t size, uint32_t flags);
>  
> @@ -562,6 +565,36 @@ static void vfio_user_send_async(VFIOProxy *proxy, VFIOUserHdr *hdr,
>      }
>  }
>  
> +/*
> + * nowait send - vfio_wait_reqs() can wait for it later
> + */
> +static void vfio_user_send_nowait(VFIOProxy *proxy, VFIOUserHdr *hdr,
> +                                  VFIOUserFDs *fds, int rsize)
> +{
> +    VFIOUserMsg *msg;
> +    int ret;
> +
> +    if (hdr->flags & VFIO_USER_NO_REPLY) {
> +        error_printf("vfio_user_send_nowait on async message\n");
> +        return;
> +    }
> +
> +    QEMU_LOCK_GUARD(&proxy->lock);
> +
> +    msg = vfio_user_getmsg(proxy, hdr, fds);
> +    msg->id = hdr->id;
> +    msg->rsize = rsize ? rsize : hdr->size;
> +    msg->type = VFIO_MSG_NOWAIT;
> +
> +    ret = vfio_user_send_queued(proxy, msg);
> +    if (ret < 0) {
> +        vfio_user_recycle(proxy, msg);
> +        return;
> +    }
> +
> +    proxy->last_nowait = msg;
> +}
> +
>  static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
>                                  VFIOUserFDs *fds, int rsize, bool nobql)
>  {
> @@ -610,6 +643,56 @@ static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
>      }
>  }
>  
> +static void vfio_user_wait_reqs(VFIOProxy *proxy)
> +{
> +    VFIOUserMsg *msg;
> +    bool iolock = false;
> +
> +    /*
> +     * Any DMA map/unmap requests sent in the middle
> +     * of a memory region transaction were sent nowait.
> +     * Wait for them here.
> +     */
> +    qemu_mutex_lock(&proxy->lock);
> +    if (proxy->last_nowait != NULL) {
> +        iolock = qemu_mutex_iothread_locked();
> +        if (iolock) {
> +            qemu_mutex_unlock_iothread();
> +        }
> +
> +        /*
> +         * Change type to WAIT to wait for reply
> +         */
> +        msg = proxy->last_nowait;
> +        msg->type = VFIO_MSG_WAIT;
> +        while (!msg->complete) {
> +            if (!qemu_cond_timedwait(&msg->cv, &proxy->lock, wait_time)) {
> +                error_printf("vfio_wait_reqs - timed out\n");
> +                break;
> +            }
> +        }
> +
> +        if (msg->hdr->flags & VFIO_USER_ERROR) {
> +            error_printf("vfio_user_wait_reqs - error reply on async request ");
> +            error_printf("command %x error %s\n", msg->hdr->command,
> +                         strerror(msg->hdr->error_reply));
> +        }
> +
> +        proxy->last_nowait = NULL;
> +        /*
> +         * Change type back to NOWAIT to free
> +         */
> +        msg->type = VFIO_MSG_NOWAIT;
> +        vfio_user_recycle(proxy, msg);
> +    }
> +
> +    /* lock order is BQL->proxy - don't hold proxy when getting BQL */
> +    qemu_mutex_unlock(&proxy->lock);
> +    if (iolock) {
> +        qemu_mutex_lock_iothread();
> +    }
> +}
> +
>  static QLIST_HEAD(, VFIOProxy) vfio_user_sockets =
>      QLIST_HEAD_INITIALIZER(vfio_user_sockets);
>  
> @@ -935,6 +1018,102 @@ int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp)
>      return 0;
>  }
>  
> +static int vfio_user_dma_map(VFIOProxy *proxy,
> +                             struct vfio_iommu_type1_dma_map *map,
> +                             int fd, bool will_commit)
> +{
> +    VFIOUserFDs *fds = NULL;
> +    VFIOUserDMAMap *msgp = g_malloc0(sizeof(*msgp));
> +    int ret;
> +
> +    vfio_user_request_msg(&msgp->hdr, VFIO_USER_DMA_MAP, sizeof(*msgp), 0);
> +    msgp->argsz = map->argsz;
> +    msgp->flags = map->flags;
> +    msgp->offset = map->vaddr;
> +    msgp->iova = map->iova;
> +    msgp->size = map->size;
> +
> +    /*
> +     * The will_commit case sends without blocking or dropping BQL.
> +     * They're later waited for in vfio_send_wait_reqs.
> +     */
> +    if (will_commit) {
> +        /* can't use auto variable since we don't block */
> +        if (fd != -1) {
> +            fds = vfio_user_getfds(1);
> +            fds->send_fds = 1;
> +            fds->fds[0] = fd;
> +        }
> +        vfio_user_send_nowait(proxy, &msgp->hdr, fds, 0);
> +        ret = 0;
> +    } else {
> +        VFIOUserFDs local_fds = { 1, 0, &fd };
> +
> +        fds = fd != -1 ? &local_fds : NULL;
> +        vfio_user_send_wait(proxy, &msgp->hdr, fds, 0, will_commit);
> +        ret = (msgp->hdr.flags & VFIO_USER_ERROR) ? -msgp->hdr.error_reply : 0;
> +        g_free(msgp);
> +    }
> +
> +    return ret;
> +}
> +
> +static int vfio_user_dma_unmap(VFIOProxy *proxy,
> +                               struct vfio_iommu_type1_dma_unmap *unmap,
> +                               struct vfio_bitmap *bitmap, bool will_commit)
> +{
> +    struct {
> +        VFIOUserDMAUnmap msg;
> +        VFIOUserBitmap bitmap;
> +    } *msgp = NULL;
> +    int msize, rsize;
> +    bool blocking = !will_commit;
> +
> +    if (bitmap == NULL &&
> +        (unmap->flags & VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP)) {
> +        error_printf("vfio_user_dma_unmap mismatched flags and bitmap\n");
> +        return -EINVAL;
> +    }
> +
> +    /*
> +     * If a dirty bitmap is returned, allocate extra space for it
> +     * and block for reply even in the will_commit case.
> +     * Otherwise, can send the unmap request without waiting.
> +     */
> +    if (bitmap != NULL) {
> +        blocking = true;
> +        msize = sizeof(*msgp);
> +        rsize = msize + bitmap->size;
> +        msgp = g_malloc0(rsize);
> +        msgp->bitmap.pgsize = bitmap->pgsize;
> +        msgp->bitmap.size = bitmap->size;
> +    } else {
> +        msize = rsize = sizeof(VFIOUserDMAUnmap);
> +        msgp = g_malloc0(rsize);
> +    }
> +
> +    vfio_user_request_msg(&msgp->msg.hdr, VFIO_USER_DMA_UNMAP, msize, 0);
> +    msgp->msg.argsz = unmap->argsz;
> +    msgp->msg.flags = unmap->flags;
> +    msgp->msg.iova = unmap->iova;
> +    msgp->msg.size = unmap->size;
> +
> +    if (blocking) {
> +        vfio_user_send_wait(proxy, &msgp->msg.hdr, NULL, rsize, will_commit);
> +        if (msgp->msg.hdr.flags & VFIO_USER_ERROR) {
> +            return -msgp->msg.hdr.error_reply;
> +        }
> +        if (bitmap != NULL) {
> +            memcpy(bitmap->data, &msgp->bitmap.data, bitmap->size);
> +        }
> +        g_free(msgp);
> +    } else {
> +        vfio_user_send_nowait(proxy, &msgp->msg.hdr, NULL, rsize);
> +    }
> +
> +    return 0;
> +}
> +
>  static int vfio_user_get_info(VFIOProxy *proxy, struct vfio_device_info *info)
>  {
>      VFIOUserDeviceInfo msg;
> @@ -1225,5 +1404,32 @@ VFIODevIO vfio_dev_io_sock = {
>  };
>  
>  
> +static int vfio_user_io_dma_map(VFIOContainer *container,
> +                                struct vfio_iommu_type1_dma_map *map,
> +                                int fd, bool will_commit)
> +{
> +    if (fd != -1) {
> +        return vfio_user_dma_map(container->proxy, map, fd, will_commit);
> +    } else {
> +        map->vaddr = 0;
> +        return vfio_user_dma_map(container->proxy, map, -1, will_commit);
> +    }
> +}
> +
> +static int vfio_user_io_dma_unmap(VFIOContainer *container,
> +                                  struct vfio_iommu_type1_dma_unmap *unmap,
> +                                  struct vfio_bitmap *bitmap, bool will_commit)
> +{
> +    return vfio_user_dma_unmap(container->proxy, unmap, bitmap, will_commit);
> +}
> +
> +static void vfio_user_io_wait_commit(VFIOContainer *container)
> +{
> +    vfio_user_wait_reqs(container->proxy);
> +}
> +
>  VFIOContIO vfio_cont_io_sock = {
> +    .dma_map = vfio_user_io_dma_map,
> +    .dma_unmap = vfio_user_io_dma_unmap,
> +    .wait_commit = vfio_user_io_wait_commit,
>  };


