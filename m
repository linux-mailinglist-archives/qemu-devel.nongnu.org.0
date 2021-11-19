Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 375E14578FA
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 23:45:43 +0100 (CET)
Received: from localhost ([::1]:34934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moCda-0001DG-Am
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 17:45:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1moCb8-0006ih-8F
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 17:43:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1moCb5-0002Xc-5v
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 17:43:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637361785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=19BYv3gX+0tZ4d6TGY+auWye7e9Laam4piR5sb6OSDk=;
 b=Bb8z9Yw4mSLsXSrfjrioYbe3+e+uLdKHnLRaa5nKzG17Irwvr7gZqp1n95sjNUwe8od4Ou
 Fljgg2n9BnkFdsMMiX6mDWSJ/UwSG6u0oR4U6vSTqtRB1xRaVC9OmX0HIZ+Wgdu3wEJyBu
 VPmcIyiX8VU7wxkimCqpfLbOCpmM0zQ=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-hSN3xULoOaSArNPcDXp2ew-1; Fri, 19 Nov 2021 17:43:03 -0500
X-MC-Unique: hSN3xULoOaSArNPcDXp2ew-1
Received: by mail-oo1-f70.google.com with SMTP id
 y9-20020a4a2d09000000b002c600da5eb9so7028973ooy.9
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 14:43:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=19BYv3gX+0tZ4d6TGY+auWye7e9Laam4piR5sb6OSDk=;
 b=n+fl7WmFaDYEM2ehde5FL6+nhy6uziVuul8fjg3HFsVDxDymvSPBIFa4XDFVaMHqkd
 9bagTsbX/i5czJYhuq951FteajfSYpuR6l0xHI5MCQN6Nq3opBRhtP0GFr/iHODWKu+K
 9PLyIogqag4r96e6uglHfdipgcBjtfqC9735SkpKEOg2wAcnt6Yx03hdSKvLHOMZvKoe
 g+B4eg4w3zVwRAOJnM6LpxcGlW2DVRHsBxy3AuP1aG2VLZNW+7XMvxvU2n2z1+R9/gLW
 suEvK4OHXQoQ3VhFtjKePMQW3lpCWkhAD9rp86B0yyikp8GxfpWeVEpUZ71NRXXmML5x
 +tYA==
X-Gm-Message-State: AOAM531YPmpF6YPbcjUKVqoSeatlyHtiDxWt6FiVINlP9I+6qFRj7ROT
 Pdd9aBnEWq7DRKLP0u5kuPWyvxFM1FfpqSzZuwhydV0yKZvM3Ebi9yUdE13ISBcnVp/japYJlOO
 2F/tk2UHs681Ei7o=
X-Received: by 2002:a05:6830:348f:: with SMTP id
 c15mr7877132otu.254.1637361782525; 
 Fri, 19 Nov 2021 14:43:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMKvc4tU8awXzXayOO1cmq5uIZ1e8oG6ThYDfUEAX6qQ6et2Sipj99tqmMIRcQ7Ncx+YcoRQ==
X-Received: by 2002:a05:6830:348f:: with SMTP id
 c15mr7877084otu.254.1637361781933; 
 Fri, 19 Nov 2021 14:43:01 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id g26sm239115ots.25.2021.11.19.14.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 14:43:01 -0800 (PST)
Date: Fri, 19 Nov 2021 15:42:15 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [RFC v3 04/19] Add device IO ops vector
Message-ID: <20211119154215.31c599eb.alex.williamson@redhat.com>
In-Reply-To: <c8f636ad86d8b89f4610e95089ad49816c70a7a6.1636057885.git.john.g.johnson@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
 <c8f636ad86d8b89f4610e95089ad49816c70a7a6.1636057885.git.john.g.johnson@oracle.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
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

On Mon,  8 Nov 2021 16:46:32 -0800
John Johnson <john.g.johnson@oracle.com> wrote:

> Used for communication with VFIO driver
> (prep work for vfio-user, which will communicate over a socket)
> 
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> ---
>  include/hw/vfio/vfio-common.h |  28 ++++++++
>  hw/vfio/common.c              | 159 ++++++++++++++++++++++++++++++++++++++----
>  hw/vfio/pci.c                 | 146 ++++++++++++++++++++++++--------------
>  3 files changed, 265 insertions(+), 68 deletions(-)
> 
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 9b3c5e5..43fa948 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -124,6 +124,7 @@ typedef struct VFIOHostDMAWindow {
>  } VFIOHostDMAWindow;
>  
>  typedef struct VFIODeviceOps VFIODeviceOps;
> +typedef struct VFIODevIO VFIODevIO;
>  
>  typedef struct VFIODevice {
>      QLIST_ENTRY(VFIODevice) next;
> @@ -139,12 +140,14 @@ typedef struct VFIODevice {
>      bool ram_block_discard_allowed;
>      bool enable_migration;
>      VFIODeviceOps *ops;
> +    VFIODevIO *io_ops;
>      unsigned int num_irqs;
>      unsigned int num_regions;
>      unsigned int flags;
>      VFIOMigration *migration;
>      Error *migration_blocker;
>      OnOffAuto pre_copy_dirty_page_tracking;
> +    struct vfio_region_info **regions;
>  } VFIODevice;
>  
>  struct VFIODeviceOps {
> @@ -164,6 +167,30 @@ struct VFIODeviceOps {
>   * through ioctl() to the kernel VFIO driver, but vfio-user
>   * can use a socket to a remote process.
>   */
> +struct VFIODevIO {
> +    int (*get_info)(VFIODevice *vdev, struct vfio_device_info *info);
> +    int (*get_region_info)(VFIODevice *vdev,
> +                           struct vfio_region_info *info, int *fd);
> +    int (*get_irq_info)(VFIODevice *vdev, struct vfio_irq_info *irq);
> +    int (*set_irqs)(VFIODevice *vdev, struct vfio_irq_set *irqs);
> +    int (*region_read)(VFIODevice *vdev, uint8_t nr, off_t off, uint32_t size,
> +                       void *data);
> +    int (*region_write)(VFIODevice *vdev, uint8_t nr, off_t off, uint32_t size,
> +                        void *data, bool post);

The @post arg is not really developed in this patch, it would make
review easier to add the arg when it becomes implemented and used.

> +};
> +
> +#define VDEV_GET_INFO(vdev, info) \
> +    ((vdev)->io_ops->get_info((vdev), (info)))
> +#define VDEV_GET_REGION_INFO(vdev, info, fd) \
> +    ((vdev)->io_ops->get_region_info((vdev), (info), (fd)))
> +#define VDEV_GET_IRQ_INFO(vdev, irq) \
> +    ((vdev)->io_ops->get_irq_info((vdev), (irq)))
> +#define VDEV_SET_IRQS(vdev, irqs) \
> +    ((vdev)->io_ops->set_irqs((vdev), (irqs)))
> +#define VDEV_REGION_READ(vdev, nr, off, size, data) \
> +    ((vdev)->io_ops->region_read((vdev), (nr), (off), (size), (data)))
> +#define VDEV_REGION_WRITE(vdev, nr, off, size, data, post) \
> +    ((vdev)->io_ops->region_write((vdev), (nr), (off), (size), (data), (post)))
>  
>  struct VFIOContIO {
>      int (*dma_map)(VFIOContainer *container,
> @@ -184,6 +211,7 @@ struct VFIOContIO {
>  #define CONT_DIRTY_BITMAP(cont, bitmap, range) \
>      ((cont)->io_ops->dirty_bitmap((cont), (bitmap), (range)))
>  
> +extern VFIODevIO vfio_dev_io_ioctl;
>  extern VFIOContIO vfio_cont_io_ioctl;
>  
>  #endif /* CONFIG_LINUX */
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 50748be..41fdd78 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -70,7 +70,7 @@ void vfio_disable_irqindex(VFIODevice *vbasedev, int index)
>          .count = 0,
>      };
>  
> -    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
> +    VDEV_SET_IRQS(vbasedev, &irq_set);
>  }
>  
>  void vfio_unmask_single_irqindex(VFIODevice *vbasedev, int index)
> @@ -83,7 +83,7 @@ void vfio_unmask_single_irqindex(VFIODevice *vbasedev, int index)
>          .count = 1,
>      };
>  
> -    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
> +    VDEV_SET_IRQS(vbasedev, &irq_set);
>  }
>  
>  void vfio_mask_single_irqindex(VFIODevice *vbasedev, int index)
> @@ -96,7 +96,7 @@ void vfio_mask_single_irqindex(VFIODevice *vbasedev, int index)
>          .count = 1,
>      };
>  
> -    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
> +    VDEV_SET_IRQS(vbasedev, &irq_set);
>  }
>  
>  static inline const char *action_to_str(int action)
> @@ -177,9 +177,7 @@ int vfio_set_irq_signaling(VFIODevice *vbasedev, int index, int subindex,
>      pfd = (int32_t *)&irq_set->data;
>      *pfd = fd;
>  
> -    if (ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, irq_set)) {
> -        ret = -errno;
> -    }
> +    ret = VDEV_SET_IRQS(vbasedev, irq_set);
>      g_free(irq_set);
>  
>      if (!ret) {
> @@ -214,6 +212,7 @@ void vfio_region_write(void *opaque, hwaddr addr,
>          uint32_t dword;
>          uint64_t qword;
>      } buf;
> +    int ret;
>  
>      switch (size) {
>      case 1:
> @@ -233,13 +232,15 @@ void vfio_region_write(void *opaque, hwaddr addr,
>          break;
>      }
>  
> -    if (pwrite(vbasedev->fd, &buf, size, region->fd_offset + addr) != size) {
> +    ret = VDEV_REGION_WRITE(vbasedev, region->nr, addr, size, &buf, false);
> +    if (ret != size) {
> +        const char *err = ret < 0 ? strerror(-ret) : "short write";
> +
>          error_report("%s(%s:region%d+0x%"HWADDR_PRIx", 0x%"PRIx64
> -                     ",%d) failed: %m",
> +                     ",%d) failed: %s",
>                       __func__, vbasedev->name, region->nr,
> -                     addr, data, size);
> +                     addr, data, size, err);
>      }
> -
>      trace_vfio_region_write(vbasedev->name, region->nr, addr, data, size);
>  
>      /*
> @@ -265,13 +266,18 @@ uint64_t vfio_region_read(void *opaque,
>          uint64_t qword;
>      } buf;
>      uint64_t data = 0;
> +    int ret;
>  
> -    if (pread(vbasedev->fd, &buf, size, region->fd_offset + addr) != size) {
> -        error_report("%s(%s:region%d+0x%"HWADDR_PRIx", %d) failed: %m",
> +    ret = VDEV_REGION_READ(vbasedev, region->nr, addr, size, &buf);
> +    if (ret != size) {
> +        const char *err = ret < 0 ? strerror(-ret) : "short read";
> +
> +        error_report("%s(%s:region%d+0x%"HWADDR_PRIx", %d) failed: %s",
>                       __func__, vbasedev->name, region->nr,
> -                     addr, size);
> +                     addr, size, err);
>          return (uint64_t)-1;
>      }
> +
>      switch (size) {
>      case 1:
>          data = buf.byte;
> @@ -2369,6 +2375,16 @@ int vfio_get_device(VFIOGroup *group, const char *name,
>  
>  void vfio_put_base_device(VFIODevice *vbasedev)
>  {
> +    if (vbasedev->regions != NULL) {
> +        int i;
> +
> +        for (i = 0; i < vbasedev->num_regions; i++) {
> +            g_free(vbasedev->regions[i]);
> +        }
> +        g_free(vbasedev->regions);
> +        vbasedev->regions = NULL;
> +    }
> +
>      if (!vbasedev->group) {
>          return;
>      }
> @@ -2382,6 +2398,21 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
>                           struct vfio_region_info **info)
>  {
>      size_t argsz = sizeof(struct vfio_region_info);
> +    int fd = -1;
> +    int ret;
> +
> +    /* create region cache */
> +    if (vbasedev->regions == NULL) {
> +        vbasedev->regions = g_new0(struct vfio_region_info *,
> +                                   vbasedev->num_regions);
> +    }

Seems like this should have been part of vfio_get_device() since that's
where we set num_regions.

> +    /* check cache */
> +    if (vbasedev->regions[index] != NULL) {
> +        *info = g_malloc0(vbasedev->regions[index]->argsz);
> +        memcpy(*info, vbasedev->regions[index],
> +               vbasedev->regions[index]->argsz);
> +        return 0;
> +    }

Why are we calling vfio_get_region_info() enough that we need a cache?
This looks like an optimization for something that doesn't exist yet.
And if we have a cache, why aren't callers using it directly rather
than creating a copy for each caller?

>  
>      *info = g_malloc0(argsz);
>  
> @@ -2389,19 +2420,28 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
>  retry:
>      (*info)->argsz = argsz;
>  
> -    if (ioctl(vbasedev->fd, VFIO_DEVICE_GET_REGION_INFO, *info)) {
> +    ret = VDEV_GET_REGION_INFO(vbasedev, *info, &fd);
> +    if (ret != 0) {
>          g_free(*info);
>          *info = NULL;
> -        return -errno;
> +        return ret;
>      }
>  
>      if ((*info)->argsz > argsz) {
>          argsz = (*info)->argsz;
>          *info = g_realloc(*info, argsz);
> +        if (fd != -1) {
> +            close(fd);
> +            fd = -1;
> +        }

Use of fd here is hard to review, it's clearly for some future use case.

>  
>          goto retry;
>      }
>  
> +    /* fill cache */
> +    vbasedev->regions[index] = g_malloc0(argsz);
> +    memcpy(vbasedev->regions[index], *info, argsz);
> +
>      return 0;
>  }
>  
> @@ -2554,6 +2594,95 @@ int vfio_eeh_as_op(AddressSpace *as, uint32_t op)
>   * Traditional ioctl() based io_ops
>   */
>  
> +static int vfio_io_get_info(VFIODevice *vbasedev, struct vfio_device_info *info)
> +{
> +    int ret;
> +
> +    ret = ioctl(vbasedev->fd, VFIO_DEVICE_GET_INFO, info);
> +    if (ret < 0) {
> +        ret = -errno;
> +    }
> +
> +    return ret;
> +}
> +
> +static int vfio_io_get_region_info(VFIODevice *vbasedev,
> +                                   struct vfio_region_info *info,
> +                                   int *fd)
> +{
> +    int ret;
> +
> +    *fd = -1;
> +    ret = ioctl(vbasedev->fd, VFIO_DEVICE_GET_REGION_INFO, info);
> +    if (ret < 0) {
> +        ret = -errno;
> +    }
> +
> +    return ret;
> +}
> +
> +static int vfio_io_get_irq_info(VFIODevice *vbasedev,
> +                                struct vfio_irq_info *info)
> +{
> +    int ret;
> +
> +    ret = ioctl(vbasedev->fd, VFIO_DEVICE_GET_IRQ_INFO, info);
> +    if (ret < 0) {
> +        ret = -errno;
> +    }
> +
> +    return ret;
> +}
> +
> +static int vfio_io_set_irqs(VFIODevice *vbasedev, struct vfio_irq_set *irqs)
> +{
> +    int ret;
> +
> +    ret = ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, irqs);
> +    if (ret < 0) {
> +        ret = -errno;
> +    }
> +
> +    return ret;
> +}
> +
> +static int vfio_io_region_read(VFIODevice *vbasedev, uint8_t index, off_t off,
> +                               uint32_t size, void *data)
> +{
> +    struct vfio_region_info *info = vbasedev->regions[index];
> +    int ret;
> +
> +    ret = pread(vbasedev->fd, data, size, info->offset + off);
> +    if (ret < 0) {
> +        ret = -errno;
> +    }
> +
> +    return ret;
> +}
> +
> +static int vfio_io_region_write(VFIODevice *vbasedev, uint8_t index, off_t off,
> +                                uint32_t size, void *data, bool post)
> +{
> +    struct vfio_region_info *info = vbasedev->regions[index];
> +    int ret;
> +
> +    ret = pwrite(vbasedev->fd, data, size, info->offset + off);
> +    if (ret < 0) {
> +        ret = -errno;
> +    }
> +
> +    return ret;
> +}

Simplify all these with ternaries?

    return ret < 0 ? -errno : ret;

> +
> +VFIODevIO vfio_dev_io_ioctl = {
> +    .get_info = vfio_io_get_info,
> +    .get_region_info = vfio_io_get_region_info,
> +    .get_irq_info = vfio_io_get_irq_info,
> +    .set_irqs = vfio_io_set_irqs,
> +    .region_read = vfio_io_region_read,
> +    .region_write = vfio_io_region_write,
> +};
> +
>  static int vfio_io_dma_map(VFIOContainer *container,
>                             struct vfio_iommu_type1_dma_map *map,
>                             int fd, bool will_commit)
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 122edf8..28f21f8 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -402,7 +402,7 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
>          fds[i] = fd;
>      }
>  
> -    ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_SET_IRQS, irq_set);
> +    ret = VDEV_SET_IRQS(&vdev->vbasedev, irq_set);
>  
>      g_free(irq_set);
>  
> @@ -772,14 +772,16 @@ static void vfio_update_msi(VFIOPCIDevice *vdev)
>  
>  static void vfio_pci_load_rom(VFIOPCIDevice *vdev)
>  {
> +    VFIODevice *vbasedev = &vdev->vbasedev;
>      struct vfio_region_info *reg_info;
>      uint64_t size;
>      off_t off = 0;
>      ssize_t bytes;
> +    int ret;
>  
> -    if (vfio_get_region_info(&vdev->vbasedev,
> -                             VFIO_PCI_ROM_REGION_INDEX, &reg_info)) {
> -        error_report("vfio: Error getting ROM info: %m");
> +    ret = vfio_get_region_info(vbasedev, VFIO_PCI_ROM_REGION_INDEX, &reg_info);
> +    if (ret < 0) {
> +        error_report("vfio: Error getting ROM info: %s", strerror(-ret));
>          return;
>      }
>  
> @@ -806,18 +808,19 @@ static void vfio_pci_load_rom(VFIOPCIDevice *vdev)
>      memset(vdev->rom, 0xff, size);
>  
>      while (size) {
> -        bytes = pread(vdev->vbasedev.fd, vdev->rom + off,
> -                      size, vdev->rom_offset + off);
> +        bytes = VDEV_REGION_READ(vbasedev, VFIO_PCI_ROM_REGION_INDEX, off,
> +                                 size, vdev->rom + off);
>          if (bytes == 0) {
>              break;
>          } else if (bytes > 0) {
>              off += bytes;
>              size -= bytes;
>          } else {
> -            if (errno == EINTR || errno == EAGAIN) {
> +            if (bytes == -EINTR || bytes == -EAGAIN) {
>                  continue;
>              }
> -            error_report("vfio: Error reading device ROM: %m");
> +            error_report("vfio: Error reading device ROM: %s",
> +                         strerror(-bytes));
>              break;
>          }
>      }
> @@ -905,11 +908,10 @@ static const MemoryRegionOps vfio_rom_ops = {
>  
>  static void vfio_pci_size_rom(VFIOPCIDevice *vdev)
>  {
> +    VFIODevice *vbasedev = &vdev->vbasedev;
>      uint32_t orig, size = cpu_to_le32((uint32_t)PCI_ROM_ADDRESS_MASK);
> -    off_t offset = vdev->config_offset + PCI_ROM_ADDRESS;
>      DeviceState *dev = DEVICE(vdev);
>      char *name;
> -    int fd = vdev->vbasedev.fd;
>  
>      if (vdev->pdev.romfile || !vdev->pdev.rom_bar) {
>          /* Since pci handles romfile, just print a message and return */
> @@ -926,13 +928,23 @@ static void vfio_pci_size_rom(VFIOPCIDevice *vdev)
>       * Use the same size ROM BAR as the physical device.  The contents
>       * will get filled in later when the guest tries to read it.
>       */
> -    if (pread(fd, &orig, 4, offset) != 4 ||
> -        pwrite(fd, &size, 4, offset) != 4 ||
> -        pread(fd, &size, 4, offset) != 4 ||
> -        pwrite(fd, &orig, 4, offset) != 4) {
> -        error_report("%s(%s) failed: %m", __func__, vdev->vbasedev.name);
> +#define rom_read(var) VDEV_REGION_READ(vbasedev,  \
> +                                       VFIO_PCI_CONFIG_REGION_INDEX,  \
> +                                       PCI_ROM_ADDRESS, 4, (var))
> +#define rom_write(var) VDEV_REGION_WRITE(vbasedev,  \
> +                                         VFIO_PCI_CONFIG_REGION_INDEX,  \
> +                                         PCI_ROM_ADDRESS, 4, (var), false)
> +
> +    if (rom_read(&orig) != 4 ||
> +        rom_write(&size) != 4 ||
> +        rom_read(&size) != 4 ||
> +        rom_write(&orig) != 4) {
> +
> +        error_report("%s(%s) ROM access failed", __func__, vbasedev->name);
>          return;
>      }
> +#undef rom_read
> +#undef rom_write

Hmm, I think I'd rather see a generic function broken out for this,
maybe:

int vfio_pci_size_bar32(VFIODevice *vbasedev, int offset,
                        uint32_t mask, uint32_t *size)
{
    uint32_t orig, val;
    int index = VFIO_PCI_CONFIG_REGION_INDEX;

    if (VDEV_REGION_READ(vbasedev, index, offset, 4, &orig) != 4 ||
        VDEV_REGION_WRITE(vbasedev, index, offset, 4, &mask, false) != 4 ||
        VDEV_REGION_READ(vbasedev, index, offset, 4, &val) != 4 ||
        VDEV_REGION_WRITE(vbasedev, index, offset, 4, &orig, false) != 4) {

        error_report(...

        return -1;
    }

    *size = ~(le32_to_cpu(val) & PCI_ROM_ADDRESS_MASK) + 1;

    return 0;
}

Really I think it's just trying to hard code
VFIO_PCI_CONFIG_REGION_INDEX and PCI_ROM_ADDRESS into the macro calls
that demand some simplification, if we use variables it looks fine
inline.

We could also re-wrap VDEV_REGION_READ/WRITE in vfio/pci.h to simplify
config space access, presumably we'd never have posted writes to config
space.  Thanks,

Alex

>  
>      size = ~(le32_to_cpu(size) & PCI_ROM_ADDRESS_MASK) + 1;
>  
> @@ -1110,6 +1122,7 @@ static void vfio_sub_page_bar_update_mapping(PCIDevice *pdev, int bar)
>  uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
>  {
>      VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
> +    VFIODevice *vbasedev = &vdev->vbasedev;
>      uint32_t emu_bits = 0, emu_val = 0, phys_val = 0, val;
>  
>      memcpy(&emu_bits, vdev->emulated_config_bits + addr, len);
> @@ -1122,12 +1135,14 @@ uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
>      if (~emu_bits & (0xffffffffU >> (32 - len * 8))) {
>          ssize_t ret;
>  
> -        ret = pread(vdev->vbasedev.fd, &phys_val, len,
> -                    vdev->config_offset + addr);
> +        ret = VDEV_REGION_READ(vbasedev, VFIO_PCI_CONFIG_REGION_INDEX, addr,
> +                               len, &phys_val);
>          if (ret != len) {
> -            error_report("%s(%s, 0x%x, 0x%x) failed: %m",
> -                         __func__, vdev->vbasedev.name, addr, len);
> -            return -errno;
> +            const char *err = ret < 0 ? strerror(-ret) : "short read";
> +
> +            error_report("%s(%s, 0x%x, 0x%x) failed: %s",
> +                         __func__, vbasedev->name, addr, len, err);
> +            return -1;
>          }
>          phys_val = le32_to_cpu(phys_val);
>      }
> @@ -1143,15 +1158,20 @@ void vfio_pci_write_config(PCIDevice *pdev,
>                             uint32_t addr, uint32_t val, int len)
>  {
>      VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
> +    VFIODevice *vbasedev = &vdev->vbasedev;
>      uint32_t val_le = cpu_to_le32(val);
> +    int ret;
>  
>      trace_vfio_pci_write_config(vdev->vbasedev.name, addr, val, len);
>  
>      /* Write everything to VFIO, let it filter out what we can't write */
> -    if (pwrite(vdev->vbasedev.fd, &val_le, len, vdev->config_offset + addr)
> -                != len) {
> -        error_report("%s(%s, 0x%x, 0x%x, 0x%x) failed: %m",
> -                     __func__, vdev->vbasedev.name, addr, val, len);
> +    ret = VDEV_REGION_WRITE(vbasedev, VFIO_PCI_CONFIG_REGION_INDEX, addr,
> +                            len, &val_le, false);
> +    if (ret != len) {
> +        const char *err = ret < 0 ? strerror(-ret) : "short write";
> +
> +        error_report("%s(%s, 0x%x, 0x%x, 0x%x) failed: %s",
> +                     __func__, vbasedev->name, addr, val, len, err);
>      }
>  
>      /* MSI/MSI-X Enabling/Disabling */
> @@ -1239,10 +1259,13 @@ static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
>      int ret, entries;
>      Error *err = NULL;
>  
> -    if (pread(vdev->vbasedev.fd, &ctrl, sizeof(ctrl),
> -              vdev->config_offset + pos + PCI_CAP_FLAGS) != sizeof(ctrl)) {
> -        error_setg_errno(errp, errno, "failed reading MSI PCI_CAP_FLAGS");
> -        return -errno;
> +    ret = VDEV_REGION_READ(&vdev->vbasedev, VFIO_PCI_CONFIG_REGION_INDEX,
> +                           pos + PCI_CAP_FLAGS, sizeof(ctrl), &ctrl);
> +    if (ret != sizeof(ctrl)) {
> +        const char *err = ret < 0 ? strerror(-ret) : "short read";
> +
> +        error_setg(errp, "failed reading MSI PCI_CAP_FLAGS %s", err);
> +        return ret;
>      }
>      ctrl = le16_to_cpu(ctrl);
>  
> @@ -1444,33 +1467,40 @@ static void vfio_pci_relocate_msix(VFIOPCIDevice *vdev, Error **errp)
>   */
>  static void vfio_msix_early_setup(VFIOPCIDevice *vdev, Error **errp)
>  {
> +    VFIODevice *vbasedev = &vdev->vbasedev;
>      uint8_t pos;
>      uint16_t ctrl;
>      uint32_t table, pba;
> -    int fd = vdev->vbasedev.fd;
>      VFIOMSIXInfo *msix;
> +    int ret;
>  
>      pos = pci_find_capability(&vdev->pdev, PCI_CAP_ID_MSIX);
>      if (!pos) {
>          return;
>      }
>  
> -    if (pread(fd, &ctrl, sizeof(ctrl),
> -              vdev->config_offset + pos + PCI_MSIX_FLAGS) != sizeof(ctrl)) {
> -        error_setg_errno(errp, errno, "failed to read PCI MSIX FLAGS");
> -        return;
> +    ret = VDEV_REGION_READ(vbasedev, VFIO_PCI_CONFIG_REGION_INDEX,
> +                           pos + PCI_MSIX_FLAGS, sizeof(ctrl), &ctrl);
> +    if (ret != sizeof(ctrl)) {
> +        const char *err = ret < 0 ? strerror(-ret) : "short read";
> +
> +        error_setg(errp, "failed to read PCI MSIX FLAGS %s", err);
>      }
>  
> -    if (pread(fd, &table, sizeof(table),
> -              vdev->config_offset + pos + PCI_MSIX_TABLE) != sizeof(table)) {
> -        error_setg_errno(errp, errno, "failed to read PCI MSIX TABLE");
> -        return;
> +    ret = VDEV_REGION_READ(vbasedev, VFIO_PCI_CONFIG_REGION_INDEX,
> +                           pos + PCI_MSIX_TABLE, sizeof(table), &table);
> +    if (ret != sizeof(table)) {
> +        const char *err = ret < 0 ? strerror(-ret) : "short read";
> +
> +        error_setg(errp, "failed to read PCI MSIX TABLE %s", err);
>      }
>  
> -    if (pread(fd, &pba, sizeof(pba),
> -              vdev->config_offset + pos + PCI_MSIX_PBA) != sizeof(pba)) {
> -        error_setg_errno(errp, errno, "failed to read PCI MSIX PBA");
> -        return;
> +    ret = VDEV_REGION_READ(vbasedev, VFIO_PCI_CONFIG_REGION_INDEX,
> +                           pos + PCI_MSIX_PBA, sizeof(pba), &pba);
> +    if (ret != sizeof(pba)) {
> +        const char *err = ret < 0 ? strerror(-ret) : "short read";
> +
> +        error_setg(errp, "failed to read PCI MSIX PBA %s", err);
>      }
>  
>      ctrl = le16_to_cpu(ctrl);
> @@ -1608,7 +1638,6 @@ static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled)
>  static void vfio_bar_prepare(VFIOPCIDevice *vdev, int nr)
>  {
>      VFIOBAR *bar = &vdev->bars[nr];
> -
>      uint32_t pci_bar;
>      int ret;
>  
> @@ -1618,10 +1647,13 @@ static void vfio_bar_prepare(VFIOPCIDevice *vdev, int nr)
>      }
>  
>      /* Determine what type of BAR this is for registration */
> -    ret = pread(vdev->vbasedev.fd, &pci_bar, sizeof(pci_bar),
> -                vdev->config_offset + PCI_BASE_ADDRESS_0 + (4 * nr));
> +    ret = VDEV_REGION_READ(&vdev->vbasedev, VFIO_PCI_CONFIG_REGION_INDEX,
> +                           PCI_BASE_ADDRESS_0 + (4 * nr),
> +                           sizeof(pci_bar), &pci_bar);
>      if (ret != sizeof(pci_bar)) {
> -        error_report("vfio: Failed to read BAR %d (%m)", nr);
> +        const char *err =  ret < 0 ? strerror(-ret) : "short read";
> +
> +        error_report("vfio: Failed to read BAR %d (%s)", nr, err);
>          return;
>      }
>  
> @@ -2169,8 +2201,9 @@ static void vfio_pci_pre_reset(VFIOPCIDevice *vdev)
>  
>  static void vfio_pci_post_reset(VFIOPCIDevice *vdev)
>  {
> +    VFIODevice *vbasedev = &vdev->vbasedev;
>      Error *err = NULL;
> -    int nr;
> +    int ret, nr;
>  
>      vfio_intx_enable(vdev, &err);
>      if (err) {
> @@ -2178,13 +2211,17 @@ static void vfio_pci_post_reset(VFIOPCIDevice *vdev)
>      }
>  
>      for (nr = 0; nr < PCI_NUM_REGIONS - 1; ++nr) {
> -        off_t addr = vdev->config_offset + PCI_BASE_ADDRESS_0 + (4 * nr);
> +        off_t addr = PCI_BASE_ADDRESS_0 + (4 * nr);
>          uint32_t val = 0;
>          uint32_t len = sizeof(val);
>  
> -        if (pwrite(vdev->vbasedev.fd, &val, len, addr) != len) {
> -            error_report("%s(%s) reset bar %d failed: %m", __func__,
> -                         vdev->vbasedev.name, nr);
> +        ret = VDEV_REGION_WRITE(vbasedev, VFIO_PCI_CONFIG_REGION_INDEX, addr,
> +                                len, &val, false);
> +        if (ret != len) {
> +            const char *err = ret < 0 ? strerror(-ret) : "short write";
> +
> +            error_report("%s(%s) reset bar %d failed: %s", __func__,
> +                         vbasedev->name, nr, err);
>          }
>      }
>  
> @@ -2619,7 +2656,7 @@ static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
>  
>      irq_info.index = VFIO_PCI_ERR_IRQ_INDEX;
>  
> -    ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_GET_IRQ_INFO, &irq_info);
> +    ret = VDEV_GET_IRQ_INFO(vbasedev, &irq_info);
>      if (ret) {
>          /* This can fail for an old kernel or legacy PCI dev */
>          trace_vfio_populate_device_get_irq_info_failure(strerror(errno));
> @@ -2738,8 +2775,10 @@ static void vfio_register_req_notifier(VFIOPCIDevice *vdev)
>          return;
>      }
>  
> -    if (ioctl(vdev->vbasedev.fd,
> -              VFIO_DEVICE_GET_IRQ_INFO, &irq_info) < 0 || irq_info.count < 1) {
> +    if (VDEV_GET_IRQ_INFO(&vdev->vbasedev, &irq_info) < 0) {
> +        return;
> +    }
> +    if (irq_info.count < 1) {
>          return;
>      }
>  
> @@ -2817,6 +2856,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
>      vdev->vbasedev.ops = &vfio_pci_ops;
>      vdev->vbasedev.type = VFIO_DEVICE_TYPE_PCI;
>      vdev->vbasedev.dev = DEVICE(vdev);
> +    vdev->vbasedev.io_ops = &vfio_dev_io_ioctl;
>  
>      tmp = g_strdup_printf("%s/iommu_group", vdev->vbasedev.sysfsdev);
>      len = readlink(tmp, group_path, sizeof(group_path));


