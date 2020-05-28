Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665A11E639B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 May 2020 16:19:54 +0200 (CEST)
Received: from localhost ([::1]:51826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jeJNx-0007ls-Fo
	for lists+qemu-devel@lfdr.de; Thu, 28 May 2020 10:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1jeJN6-0006OA-Qw; Thu, 28 May 2020 10:19:00 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:40811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1jeJN5-0007w5-OZ; Thu, 28 May 2020 10:19:00 -0400
Received: by mail-wm1-x343.google.com with SMTP id r15so3338229wmh.5;
 Thu, 28 May 2020 07:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1XUzSo1oYepawlt3Ngrdk2CNaXO8nxoc6ho/bZlzT4Q=;
 b=dDkoCwWC88WeaqMSEBxb/dl7o5RQ3YY519R015l43bRAEfOJe9W/LyFKq5tlOMIH3A
 EGSnHXRY/o9+fFDfaz1RAN2owfblAPWd0k4kxz9OLWkKRP88Q9x3+lCnp24wIEgs/Fvm
 KfI2z6O9fstR0RY0BGpHC9c16b+UCCMuTdZlju28uOyEKxvyruZHGZZ4TxvoskLCeswo
 kyeqWZjdE7GKuIVCaHsClEmtiexR0daPWh39ihHQ6GQtFWjSn43LSOx0tcCtWi7AM5Mz
 E12o+JE8Pqx5yR5R55brjdXQM2e9kFPiS3+GzoN9TxL0UdodEyZ5hbzfIEWGFmptYtP5
 IwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1XUzSo1oYepawlt3Ngrdk2CNaXO8nxoc6ho/bZlzT4Q=;
 b=Jhe1mX7ASjiIImAzuoTGdBrG6MfYaTvxJXgDgciSHL1exdqvvFU/NWrt2NbCDyamsG
 MXV0IU2zBV8N+KpbFNeDvFzLCVHB4iqW6/nL/Xil6pBJM84zv256YMil2OGM5smMPWf1
 HR4hc+dZLmlAS0b9Tk5XE1vpxv68sYX+/SFmGLdf1UMvqvXdl+/a8cVKCtQxz83wNn94
 IPi1JOTMXcc5TXYdnZ92uFcX6S47QXZkz3ZoCHVnqej5J1J3usvxqi31YCXps+mwSv3F
 jlwQ0kzRl7hlioXe0+XTQsxwo93JYh1Ohe/BE5KQ8MuQsvnksXC8zi3paiyAOprxMJB6
 OcWQ==
X-Gm-Message-State: AOAM533yLj1ncx1rsSvk3VmOedwLHfZUzk/9DQar7Nw79ubaMOTm3AG9
 Pdj+uRIYb8UPI4eRwhvsP5MFhGgtW55vyJIJ2FU=
X-Google-Smtp-Source: ABdhPJzmqKxOEtXI33QN7Tq7ffUZ/+T85NE6Au4aAfTVUKgZaCzSsG7KbDgEm+Vx6wabBwbjABcOGgf8WGb3eNnmuI0=
X-Received: by 2002:a1c:4d14:: with SMTP id o20mr3483768wmh.164.1590675537711; 
 Thu, 28 May 2020 07:18:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200527102925.128013-1-stefanha@redhat.com>
 <20200527102925.128013-3-stefanha@redhat.com>
In-Reply-To: <20200527102925.128013-3-stefanha@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Thu, 28 May 2020 16:18:46 +0200
Message-ID: <CAM9Jb+jFbcEFvAwMxo-1pn1vOFARr7sZmK68-rgTp3Js5N3v4w@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] virtio-scsi: introduce a constant for fixed
 virtqueues
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, cohuck@redhat.com,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> The event and control virtqueues are always present, regardless of the
> multi-queue configuration.  Define a constant so that virtqueue number
> calculations are easier to read.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  include/hw/virtio/virtio-scsi.h | 3 +++
>  hw/scsi/vhost-user-scsi.c       | 2 +-
>  hw/scsi/virtio-scsi.c           | 7 ++++---
>  hw/virtio/vhost-scsi-pci.c      | 3 ++-
>  hw/virtio/vhost-user-scsi-pci.c | 3 ++-
>  hw/virtio/virtio-scsi-pci.c     | 3 ++-
>  6 files changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
> index 24e768909d..9f293bcb80 100644
> --- a/include/hw/virtio/virtio-scsi.h
> +++ b/include/hw/virtio/virtio-scsi.h
> @@ -36,6 +36,9 @@
>  #define VIRTIO_SCSI_MAX_TARGET  255
>  #define VIRTIO_SCSI_MAX_LUN     16383
>
> +/* Number of virtqueues that are always present */
> +#define VIRTIO_SCSI_VQ_NUM_FIXED    2
> +
>  typedef struct virtio_scsi_cmd_req VirtIOSCSICmdReq;
>  typedef struct virtio_scsi_cmd_resp VirtIOSCSICmdResp;
>  typedef struct virtio_scsi_ctrl_tmf_req VirtIOSCSICtrlTMFReq;
> diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
> index cbb5d97599..f8bd158c31 100644
> --- a/hw/scsi/vhost-user-scsi.c
> +++ b/hw/scsi/vhost-user-scsi.c
> @@ -115,7 +115,7 @@ static void vhost_user_scsi_realize(DeviceState *dev, Error **errp)
>          goto free_virtio;
>      }
>
> -    vsc->dev.nvqs = 2 + vs->conf.num_queues;
> +    vsc->dev.nvqs = VIRTIO_SCSI_VQ_NUM_FIXED + vs->conf.num_queues;
>      vsc->dev.vqs = g_new0(struct vhost_virtqueue, vsc->dev.nvqs);
>      vsc->dev.vq_index = 0;
>      vsc->dev.backend_features = 0;
> diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
> index 9b72094a61..f3d60683bd 100644
> --- a/hw/scsi/virtio-scsi.c
> +++ b/hw/scsi/virtio-scsi.c
> @@ -191,7 +191,7 @@ static void virtio_scsi_save_request(QEMUFile *f, SCSIRequest *sreq)
>      VirtIOSCSIReq *req = sreq->hba_private;
>      VirtIOSCSICommon *vs = VIRTIO_SCSI_COMMON(req->dev);
>      VirtIODevice *vdev = VIRTIO_DEVICE(req->dev);
> -    uint32_t n = virtio_get_queue_index(req->vq) - 2;
> +    uint32_t n = virtio_get_queue_index(req->vq) - VIRTIO_SCSI_VQ_NUM_FIXED;
>
>      assert(n < vs->conf.num_queues);
>      qemu_put_be32s(f, &n);
> @@ -892,10 +892,11 @@ void virtio_scsi_common_realize(DeviceState *dev,
>                  sizeof(VirtIOSCSIConfig));
>
>      if (s->conf.num_queues == 0 ||
> -            s->conf.num_queues > VIRTIO_QUEUE_MAX - 2) {
> +            s->conf.num_queues > VIRTIO_QUEUE_MAX - VIRTIO_SCSI_VQ_NUM_FIXED) {
>          error_setg(errp, "Invalid number of queues (= %" PRIu32 "), "
>                           "must be a positive integer less than %d.",
> -                   s->conf.num_queues, VIRTIO_QUEUE_MAX - 2);
> +                   s->conf.num_queues,
> +                   VIRTIO_QUEUE_MAX - VIRTIO_SCSI_VQ_NUM_FIXED);
>          virtio_cleanup(vdev);
>          return;
>      }
> diff --git a/hw/virtio/vhost-scsi-pci.c b/hw/virtio/vhost-scsi-pci.c
> index 5da6bb6449..2b25db9a3c 100644
> --- a/hw/virtio/vhost-scsi-pci.c
> +++ b/hw/virtio/vhost-scsi-pci.c
> @@ -50,7 +50,8 @@ static void vhost_scsi_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>      VirtIOSCSICommon *vs = VIRTIO_SCSI_COMMON(vdev);
>
>      if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
> -        vpci_dev->nvectors = vs->conf.num_queues + 3;
> +        vpci_dev->nvectors = vs->conf.num_queues +
> +                             VIRTIO_SCSI_VQ_NUM_FIXED + 1;
>      }
>
>      qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
> diff --git a/hw/virtio/vhost-user-scsi-pci.c b/hw/virtio/vhost-user-scsi-pci.c
> index 6f3375fe55..80710ab170 100644
> --- a/hw/virtio/vhost-user-scsi-pci.c
> +++ b/hw/virtio/vhost-user-scsi-pci.c
> @@ -56,7 +56,8 @@ static void vhost_user_scsi_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>      VirtIOSCSICommon *vs = VIRTIO_SCSI_COMMON(vdev);
>
>      if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
> -        vpci_dev->nvectors = vs->conf.num_queues + 3;
> +        vpci_dev->nvectors = vs->conf.num_queues +
> +                             VIRTIO_SCSI_VQ_NUM_FIXED + 1;
>      }
>
>      qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
> diff --git a/hw/virtio/virtio-scsi-pci.c b/hw/virtio/virtio-scsi-pci.c
> index e82e7e5680..c52d68053a 100644
> --- a/hw/virtio/virtio-scsi-pci.c
> +++ b/hw/virtio/virtio-scsi-pci.c
> @@ -51,7 +51,8 @@ static void virtio_scsi_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>      char *bus_name;
>
>      if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
> -        vpci_dev->nvectors = vs->conf.num_queues + 3;
> +        vpci_dev->nvectors = vs->conf.num_queues +
> +                             VIRTIO_SCSI_VQ_NUM_FIXED + 1;
>      }
>
>      /*
> --
Better readability with no change in logic. Code looks good to me.

Reviewed-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>

