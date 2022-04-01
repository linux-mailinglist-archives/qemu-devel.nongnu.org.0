Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB3C4EE64D
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 04:55:23 +0200 (CEST)
Received: from localhost ([::1]:36246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na7Ra-0007ke-6s
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 22:55:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1na7QT-00074v-9z
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 22:54:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1na7QP-0000hh-IH
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 22:54:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648781647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IZgq2wqJeYJpGmXlmOnNpUsp6OB+0p/x+/W/fb0jYPQ=;
 b=Jp349BL2eLI8epmbbtRNf6Do/RuFDRLThxpIqzPuQ1xdOJ1bJK0+/o1Ej054DpRRqIA8xC
 XfVyk4/JmI6Uz8TRuKEiCK8UVy5wtg5DKU6Hp4LmgmcFCEawzxv2gXcQ/Mjp4siiUDvPet
 Gi2oqRuRDaWZ1bks8lzPYSqZdREs7+o=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-IIJvUQaiOJ6Bg9CJVEnCFA-1; Thu, 31 Mar 2022 22:54:06 -0400
X-MC-Unique: IIJvUQaiOJ6Bg9CJVEnCFA-1
Received: by mail-lj1-f197.google.com with SMTP id
 s24-20020a2e98d8000000b00249800e5b87so435680ljj.22
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 19:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IZgq2wqJeYJpGmXlmOnNpUsp6OB+0p/x+/W/fb0jYPQ=;
 b=7xfd3YptQvrqcFb+vU50JDBUk2KNzNqsNBg8U6EMBLa60R5Q6rhm2lvGelsMo7uZiG
 0L3E2OjkyTRKwq286eJ2gkglx3TClQEn91Wzvubva6CZYL17S6/3huNiK40czE6MGF4m
 6k6kHNOOvC/77nnaTxD7P27FpIFiB6i29wSN6W2D2o9ZX5Or7lvqh3E/T9AHXbDPncAb
 VcOzCUtP/7/rvah4F0OvUdRIyQnyEcMEnNsMja4n360YY3FGtEO6wwqkKcy6Dy34SS3Q
 QMPSSZydDnZq3GhWrCn1H+xAzP4nCzK8YSjIgw20fuAA27lvTMe+gf/fdXoiiULBOdLW
 POBw==
X-Gm-Message-State: AOAM530HoekLzdYNxOvDmYq50QXpIZaI+qVaYRf7gDHQtOs7sI0erLmL
 wQ8//hqtgS+YidGasim10e9NA9rXtdIKcxEUevPBU1lhswQjAFYyNggfD9uZmVt9dH2mSKyq5Ow
 K5yxJa09+Pnly1rzsx7t5EtCjYbGZcT0=
X-Received: by 2002:a05:651c:90a:b0:249:5d82:fe9c with SMTP id
 e10-20020a05651c090a00b002495d82fe9cmr12287293ljq.300.1648781644591; 
 Thu, 31 Mar 2022 19:54:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysTYHBhUfm7GxgBRIxMgdWJCjCnAcg1IE30A/VlRCy7cZ4ApeCfQgJdDpTi/9JIKJlNmmqtyJvpzstf4l0PL8=
X-Received: by 2002:a05:651c:90a:b0:249:5d82:fe9c with SMTP id
 e10-20020a05651c090a00b002495d82fe9cmr12287275ljq.300.1648781644202; Thu, 31
 Mar 2022 19:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <1648718713-7637-1-git-send-email-qiudayu@archeros.com>
 <1648776683-23739-1-git-send-email-qiudayu@archeros.com>
In-Reply-To: <1648776683-23739-1-git-send-email-qiudayu@archeros.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 1 Apr 2022 10:53:53 +0800
Message-ID: <CACGkMEuQ_YW+aSysnFtDrjy=Wjq_U3KouOobYSC+e5+5SR0zEA@mail.gmail.com>
Subject: Re: [PATCH v4] vdpa: reset the backend device in the end of
 vhost_net_stop()
To: Michael Qiu <qiudayu@archeros.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Cindy Lu <lulu@redhat.com>, mst <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, eperezma <eperezma@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 1, 2022 at 9:31 AM Michael Qiu <qiudayu@archeros.com> wrote:
>
> Currently, when VM poweroff, it will trigger vdpa
> device(such as mlx bluefield2 VF) reset many times(with 1 datapath
> queue pair and one control queue, triggered 3 times), this
> leads to below issue:
>
> vhost VQ 2 ring restore failed: -22: Invalid argument (22)
>
> This because in vhost_net_stop(), it will stop all vhost device bind to
> this virtio device, and in vhost_dev_stop(), qemu tries to stop the device
> , then stop the queue: vhost_virtqueue_stop().
>
> In vhost_dev_stop(), it resets the device, which clear some flags
> in low level driver, and in next loop(stop other vhost backends),
> qemu try to stop the queue corresponding to the vhost backend,
>  the driver finds that the VQ is invalied, this is the root cause.
>
> To solve the issue, vdpa should set vring unready, and
> remove reset ops in device stop: vhost_dev_start(hdev, false).
>
> and implement a new function vhost_dev_reset, only reset backend
> device after all vhost(per-queue) stoped.

Typo.

>
> Signed-off-by: Michael Qiu<qiudayu@archeros.com>
> Acked-by: Jason Wang <jasowang@redhat.com>

Rethink this patch, consider there're devices that don't support
set_vq_ready(). I wonder if we need

1) uAPI to tell the user space whether or not it supports set_vq_ready()
2) userspace will call SET_VRING_ENABLE() when the device supports
otherwise it will use RESET.

And for safety, I suggest tagging this as 7.1.

> ---
> v4 --> v3
>     Nothing changed, becasue of issue with mimecast,
>     when the From: tag is different from the sender,
>     the some mail client will take the patch as an
>     attachment, RESEND v3 does not work, So resend
>     the patch as v4
>
> v3 --> v2:
>     Call vhost_dev_reset() at the end of vhost_net_stop().
>
>     Since the vDPA device need re-add the status bit
>     VIRTIO_CONFIG_S_ACKNOWLEDGE and VIRTIO_CONFIG_S_DRIVER,
>     simply, add them inside vhost_vdpa_reset_device, and
>     the only way calling vhost_vdpa_reset_device is in
>     vhost_net_stop(), so it keeps the same behavior as before.
>
> v2 --> v1:
>    Implement a new function vhost_dev_reset,
>    reset the backend kernel device at last.
> ---
>  hw/net/vhost_net.c        | 24 +++++++++++++++++++++---
>  hw/virtio/vhost-vdpa.c    | 15 +++++++++------
>  hw/virtio/vhost.c         | 15 ++++++++++++++-
>  include/hw/virtio/vhost.h |  1 +
>  4 files changed, 45 insertions(+), 10 deletions(-)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 30379d2..422c9bf 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -325,7 +325,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>      int total_notifiers = data_queue_pairs * 2 + cvq;
>      VirtIONet *n = VIRTIO_NET(dev);
>      int nvhosts = data_queue_pairs + cvq;
> -    struct vhost_net *net;
> +    struct vhost_net *net = NULL;
>      int r, e, i, index_end = data_queue_pairs * 2;
>      NetClientState *peer;
>
> @@ -391,8 +391,17 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>  err_start:
>      while (--i >= 0) {
>          peer = qemu_get_peer(ncs , i);
> -        vhost_net_stop_one(get_vhost_net(peer), dev);
> +
> +        net = get_vhost_net(peer);
> +
> +        vhost_net_stop_one(net, dev);
>      }
> +
> +    /* We only reset backend vdpa device */
> +    if (net && net->dev.vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA) {
> +        vhost_dev_reset(&net->dev);
> +    }
> +
>      e = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
>      if (e < 0) {
>          fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", e);
> @@ -410,6 +419,7 @@ void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
>      VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
>      VirtIONet *n = VIRTIO_NET(dev);
>      NetClientState *peer;
> +    struct vhost_net *net = NULL;
>      int total_notifiers = data_queue_pairs * 2 + cvq;
>      int nvhosts = data_queue_pairs + cvq;
>      int i, r;
> @@ -420,7 +430,15 @@ void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
>          } else {
>              peer = qemu_get_peer(ncs, n->max_queue_pairs);
>          }
> -        vhost_net_stop_one(get_vhost_net(peer), dev);
> +
> +        net = get_vhost_net(peer);
> +
> +        vhost_net_stop_one(net, dev);
> +    }
> +
> +    /* We only reset backend vdpa device */
> +    if (net && net->dev.vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA) {
> +        vhost_dev_reset(&net->dev);
>      }

So we've already reset the device in vhost_vdpa_dev_start(), any
reason we need to do it again here?

>
>      r = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index c5ed7a3..3ef0199 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -708,6 +708,11 @@ static int vhost_vdpa_reset_device(struct vhost_dev *dev)
>
>      ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
>      trace_vhost_vdpa_reset_device(dev, status);
> +
> +    /* Add back this status, so that the device could work next time*/
> +    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> +                               VIRTIO_CONFIG_S_DRIVER);

This seems to contradict the semantic of reset.

> +
>      return ret;
>  }
>
> @@ -719,14 +724,14 @@ static int vhost_vdpa_get_vq_index(struct vhost_dev *dev, int idx)
>      return idx;
>  }
>
> -static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
> +static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev, unsigned int ready)
>  {
>      int i;
>      trace_vhost_vdpa_set_vring_ready(dev);
>      for (i = 0; i < dev->nvqs; ++i) {
>          struct vhost_vring_state state = {
>              .index = dev->vq_index + i,
> -            .num = 1,
> +            .num = ready,
>          };
>          vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
>      }
> @@ -1088,8 +1093,9 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>          if (unlikely(!ok)) {
>              return -1;
>          }
> -        vhost_vdpa_set_vring_ready(dev);
> +        vhost_vdpa_set_vring_ready(dev, 1);
>      } else {
> +        vhost_vdpa_set_vring_ready(dev, 0);
>          ok = vhost_vdpa_svqs_stop(dev);
>          if (unlikely(!ok)) {
>              return -1;
> @@ -1105,9 +1111,6 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>          memory_listener_register(&v->listener, &address_space_memory);
>          return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
>      } else {
> -        vhost_vdpa_reset_device(dev);
> -        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> -                                   VIRTIO_CONFIG_S_DRIVER);
>          memory_listener_unregister(&v->listener);
>
>          return 0;
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index b643f42..7e0cdb6 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1820,7 +1820,6 @@ fail_features:
>  void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
>  {
>      int i;
> -

Unnecessary changes.

>      /* should only be called after backend is connected */
>      assert(hdev->vhost_ops);
>
> @@ -1854,3 +1853,17 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
>
>      return -ENOSYS;
>  }
> +
> +int vhost_dev_reset(struct vhost_dev *hdev)
> +{

Let's use a separate patch for this.

Thanks

> +    int ret = 0;
> +
> +    /* should only be called after backend is connected */
> +    assert(hdev->vhost_ops);
> +
> +    if (hdev->vhost_ops->vhost_reset_device) {
> +        ret = hdev->vhost_ops->vhost_reset_device(hdev);
> +    }
> +
> +    return ret;
> +}
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index 58a73e7..b8b7c20 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -114,6 +114,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
>  void vhost_dev_cleanup(struct vhost_dev *hdev);
>  int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
>  void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
> +int vhost_dev_reset(struct vhost_dev *hdev);
>  int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
>  void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
>
> --
> 1.8.3.1
>
>
>


