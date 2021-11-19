Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D65457916
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 23:50:09 +0100 (CET)
Received: from localhost ([::1]:50006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moChs-0002sx-L6
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 17:50:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1moCbC-0006mq-8u
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 17:43:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1moCbA-0002kn-Be
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 17:43:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637361791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R0TUB3hMiEah7tnfQm8rie9x1LzAtBP7X3ckckmZryA=;
 b=W3aXkjP1AJtXozNErCgw3mXayVK4akRlQpcsiXz0smZEFwJZzeZs8NfvoukpfSl5Ap/T8w
 keqp8ARZTRVTaLM2c2yR+qAE++Xn1NRWo4kkwZk9h5WciVEeeZotAm/YuzYRVe5JCfqawL
 mLo9iWxbb7ItdGHh8fswdhQykGA8+Ww=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-X8dYUm3GPrqR6m5EGoZjJw-1; Fri, 19 Nov 2021 17:43:10 -0500
X-MC-Unique: X8dYUm3GPrqR6m5EGoZjJw-1
Received: by mail-oo1-f72.google.com with SMTP id
 x23-20020a4a4117000000b002c263f22601so7015653ooa.19
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 14:43:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R0TUB3hMiEah7tnfQm8rie9x1LzAtBP7X3ckckmZryA=;
 b=sZjOLslZq7jVYaMB1vkV0ycnbrtCelD+FL1HhPdbaZOJ1Eg0JlEgi2/GUt4K5y8rt4
 8bD4peS/t66bc2W3THwtfyrXoiShphyQ8klx4FRVoXFRw4fkBwbErfvBlXr4WHjmMu9r
 bjjQazuPFVu8C/RdG0iKEq3HhUGrzSaDZB1CXq83HA/EZ3L2D9VXCQYKLxaBdyazM4VZ
 SCLXlkan290xj1D6D7mx+3o/5sS6jWAZrQ05zxvW+7u8VHOqXsNBz9/j90wz4dDTXM2/
 nnM5rbegFtw+HF3Uaeu4XNYL36iOGDsQyiw75Ltc5hZOwmX72zq9aCtpGmQEgwzukXj0
 SKZg==
X-Gm-Message-State: AOAM530vMdaBkRQNwl1AZH7NVQwVelg5g5hiWXDpCH6izbbatgL48Y+x
 vGvOGcJQcAp7xUO1m97VQoxeGF8SdvgkZry/5SmG437nitvivtX+BzJpkmZWG9Q+EaGZ0GzwNag
 9goZaUZslTeQuddM=
X-Received: by 2002:a05:6808:1a28:: with SMTP id
 bk40mr3114066oib.26.1637361789615; 
 Fri, 19 Nov 2021 14:43:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPF14lUHTde8czUkyvk6kEfc/QqbWTT6DDa9oyV5lb8iLrBWW0/mXO5TppY1K/2twWo8yb1g==
X-Received: by 2002:a05:6808:1a28:: with SMTP id
 bk40mr3114056oib.26.1637361789480; 
 Fri, 19 Nov 2021 14:43:09 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id g26sm239115ots.25.2021.11.19.14.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 14:43:09 -0800 (PST)
Date: Fri, 19 Nov 2021 15:42:19 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [RFC v3 05/19] Add validation ops vector
Message-ID: <20211119154219.65a02f15.alex.williamson@redhat.com>
In-Reply-To: <327df73b51de7a11657aea61295d735fdd0427fb.1636057885.git.john.g.johnson@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
 <327df73b51de7a11657aea61295d735fdd0427fb.1636057885.git.john.g.johnson@oracle.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Add a prefix on Subject: please.  Same for previous in series.

On Mon,  8 Nov 2021 16:46:33 -0800
John Johnson <john.g.johnson@oracle.com> wrote:

> Validates cases where the return values aren't fully trusted
> (prep work for vfio-user, where the return values from the
> remote process aren't trusted)
> 
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> ---
>  include/hw/vfio/vfio-common.h | 21 ++++++++++++++
>  hw/vfio/pci.c                 | 67 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 88 insertions(+)
> 
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 43fa948..c0dbbfb 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -125,6 +125,7 @@ typedef struct VFIOHostDMAWindow {
>  
>  typedef struct VFIODeviceOps VFIODeviceOps;
>  typedef struct VFIODevIO VFIODevIO;
> +typedef struct VFIOValidOps VFIOValidOps;
>  
>  typedef struct VFIODevice {
>      QLIST_ENTRY(VFIODevice) next;
> @@ -141,6 +142,7 @@ typedef struct VFIODevice {
>      bool enable_migration;
>      VFIODeviceOps *ops;
>      VFIODevIO *io_ops;
> +    VFIOValidOps *valid_ops;
>      unsigned int num_irqs;
>      unsigned int num_regions;
>      unsigned int flags;
> @@ -214,6 +216,25 @@ struct VFIOContIO {
>  extern VFIODevIO vfio_dev_io_ioctl;
>  extern VFIOContIO vfio_cont_io_ioctl;
>  
> +/*
> + * This ops vector allows for bus-specific verification
> + * routines in cases where the server may not be fully
> + * trusted.
> + */
> +struct VFIOValidOps {
> +    int (*validate_get_info)(VFIODevice *vdev, struct vfio_device_info *info);
> +    int (*validate_get_region_info)(VFIODevice *vdev,
> +                                    struct vfio_region_info *info, int *fd);
> +    int (*validate_get_irq_info)(VFIODevice *vdev, struct vfio_irq_info *info);
> +};
> +
> +#define VDEV_VALID_INFO(vdev, info) \
> +    ((vdev)->valid_ops->validate_get_info((vdev), (info)))
> +#define VDEV_VALID_REGION_INFO(vdev, info, fd) \
> +    ((vdev)->valid_ops->validate_get_region_info((vdev), (info), (fd)))
> +#define VDEV_VALID_IRQ_INFO(vdev, irq) \
> +    ((vdev)->valid_ops->validate_get_irq_info((vdev), (irq)))
> +
>  #endif /* CONFIG_LINUX */
>  
>  typedef struct VFIOGroup {
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 28f21f8..6e2ce35 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3371,3 +3371,70 @@ static void register_vfio_pci_dev_type(void)
>  }
>  
>  type_init(register_vfio_pci_dev_type)
> +
> +
> +/*
> + * PCI validation ops - used when return values need
> + * validation before use
> + */
> +
> +static int vfio_pci_valid_info(VFIODevice *vbasedev,
> +                               struct vfio_device_info *info)
> +{
> +    /* must be PCI */
> +    if ((info->flags & VFIO_DEVICE_FLAGS_PCI) == 0) {
> +        return -EINVAL;
> +    }
> +    /* only other valid flag is reset */
> +    if (info->flags & ~(VFIO_DEVICE_FLAGS_PCI | VFIO_DEVICE_FLAGS_RESET)) {
> +        return -EINVAL;
> +    }

This means QEMU vfio-pci breaks on any extension of the flags field.

> +    /* account for extra migration region */
> +    if (info->num_regions > VFIO_PCI_NUM_REGIONS + 1) {
> +        return -EINVAL;
> +    }

This is also invalid, there can be device specific regions beyond
migration.

> +    if (info->num_irqs > VFIO_PCI_NUM_IRQS) {
> +        return -EINVAL;
> +    }

And device specific IRQs.

> +    return 0;
> +}
> +
> +static int vfio_pci_valid_region_info(VFIODevice *vbasedev,
> +                                          struct vfio_region_info *info,
> +                                          int *fd)
> +{
> +    if (info->flags & ~(VFIO_REGION_INFO_FLAG_READ |
> +                        VFIO_REGION_INFO_FLAG_WRITE |
> +                        VFIO_REGION_INFO_FLAG_MMAP |
> +                        VFIO_REGION_INFO_FLAG_CAPS)) {
> +        return -EINVAL;
> +    }

Similarly, this allows zero future extensions.  Notice for instance how
the CAPS flag was added later as a backwards compatible extension.

> +    if (info->index > vbasedev->num_regions) {
> +        return -EINVAL;
> +    }
> +    /* cap_offset in valid area */
> +    if ((info->flags & VFIO_REGION_INFO_FLAG_CAPS) &&
> +        (info->cap_offset < sizeof(*info) || info->cap_offset > info->argsz)) {
> +        return -EINVAL;
> +    }
> +    return 0;
> +}
> +
> +static int vfio_pci_valid_irq_info(VFIODevice *vbasedev,
> +                                 struct vfio_irq_info *info)
> +{
> +    if (info->flags & ~(VFIO_IRQ_INFO_EVENTFD | VFIO_IRQ_INFO_MASKABLE |
> +                        VFIO_IRQ_INFO_AUTOMASKED | VFIO_IRQ_INFO_NORESIZE)) {
> +        return -EINVAL;
> +    }

Similarly, nak.  Thanks,

Alex

> +    if (info->index > vbasedev->num_irqs) {
> +        return -EINVAL;
> +    }
> +    return 0;
> +}
> +
> +struct VFIOValidOps vfio_pci_valid_ops = {
> +    .validate_get_info = vfio_pci_valid_info,
> +    .validate_get_region_info = vfio_pci_valid_region_info,
> +    .validate_get_irq_info = vfio_pci_valid_irq_info,
> +};


