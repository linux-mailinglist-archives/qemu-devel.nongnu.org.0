Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E8C4B6915
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 11:18:53 +0100 (CET)
Received: from localhost ([::1]:47534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuv5-0003y4-GV
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 05:18:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nJuQc-0003Qr-VG
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:47:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nJuQZ-0002Ud-Kb
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:47:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644918439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ool1wB0G66vB+zdBJ/i7pXNiepG/y5MRDsiQx2zDZ2I=;
 b=OOhDrg0kNeG2itEXYMobtdimf1ZVlKzPSKjT0egG+J6ijbsUMkHE1kXg9yTyKESFEDV/Hv
 spgA2w0kzWRW3vpQH/Cn/gCNkDt0QutPKpfKgVavHo1K06M/oXNpbn+IXRXhUn9fhu7Bri
 Cy5VRk0nNVlF9Efbf6i7GDjkZdQExPI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-olrCX_PBNlC6grwCeHfqXw-1; Tue, 15 Feb 2022 04:47:18 -0500
X-MC-Unique: olrCX_PBNlC6grwCeHfqXw-1
Received: by mail-qt1-f198.google.com with SMTP id
 l15-20020ac84ccf000000b002cf9424cfa5so14522748qtv.7
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:47:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ool1wB0G66vB+zdBJ/i7pXNiepG/y5MRDsiQx2zDZ2I=;
 b=qskKTMP17cyU+8q3hwif6jNQBva7XvrcvZQphNvnYAbGf0da5TJ40GLbZ7A8Wi3MaS
 MLYbutFj9eYPNwqM8sBjVQNrMrcXqxGC2zUL9waEPiGOQOGl67efvR6WAC97zpTTMUgU
 RA7n6KOEaNGg2ajQH22F1w/nAj4RD8NotfUzDCqHkuizl5zWtme/y5qCEv/ShQg3uxOy
 HZJYBNdLIyhsHlDf9dNu8hxk4EjqcKXlT0CUlXFk/zGRur2WascPhGcv4TQSw3K0XQ6Y
 LvnkARU8y/u534XsIDBjsJ3sLna7kGKZ1255+pHMRqqdW61K8chmqZNZx6tXXXdgeH0Z
 7UUQ==
X-Gm-Message-State: AOAM532xRDxGCPwVfCNqV95WZOk8gm3bsbu/X5V7u2PT+XOv6KqbsGYZ
 bvNtpJ3zthPRdbze+h1W9gu9KUTUe8SvrLzr/8gfswcPoQdTw7QvIN0Wbz2K2cb9687XdcsYN5P
 p8JIu+7xQ4GVaDpjPJjvgsp6yYYI+bsA=
X-Received: by 2002:ad4:5c4c:: with SMTP id a12mr2030268qva.119.1644918437458; 
 Tue, 15 Feb 2022 01:47:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxl5T5D8TZbi8lvM4j7jTknZF7Rv/fdOTsrb21TdinjRS41/CZyiCAECbweyQ0SYkk7gMSIow4M5lBZflrIPoU=
X-Received: by 2002:ad4:5c4c:: with SMTP id a12mr2030253qva.119.1644918437234; 
 Tue, 15 Feb 2022 01:47:17 -0800 (PST)
MIME-Version: 1.0
References: <20220214191635.1604932-1-eperezma@redhat.com>
 <20220214191635.1604932-8-eperezma@redhat.com>
In-Reply-To: <20220214191635.1604932-8-eperezma@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 15 Feb 2022 10:46:41 +0100
Message-ID: <CAJaqyWfnr0rcHhUwhaYnVuvRpZjxDUF-Z6KAvhrybkqEnk3fFw@mail.gmail.com>
Subject: Re: [RFC PATCH 7/9] vhost: Add vhost_svq_inject
To: qemu-level <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 14, 2022 at 8:28 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> This allows qemu to inject packets to the device without guest's notice.
>
> This will be use to inject net CVQ messages to restore status in the dest=
ination
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost-shadow-virtqueue.h |   2 +
>  hw/virtio/vhost-shadow-virtqueue.c | 142 ++++++++++++++++++++++++-----
>  2 files changed, 123 insertions(+), 21 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-=
virtqueue.h
> index bf3b658889..767b0a82ba 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -38,6 +38,8 @@ bool vhost_svq_ack_guest_features(uint64_t dev_features=
,
>                                    uint64_t guest_features,
>                                    uint64_t *acked_features);
>
> +bool vhost_svq_inject(VhostShadowVirtqueue *svq, const struct iovec *iov=
,
> +                      size_t out_num, size_t in_num);
>  void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_f=
d);
>  void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq, int ca=
ll_fd);
>  const EventNotifier *vhost_svq_get_dev_kick_notifier(
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-=
virtqueue.c
> index 2ba3c2966a..26938b059c 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -16,9 +16,11 @@
>
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
> +#include "qemu/iov.h"
>
>  typedef struct SVQElement {
>      VirtQueueElement elem;
> +    bool not_from_guest;
>  } SVQElement;
>
>  /* Shadow virtqueue to relay notifications */
> @@ -311,19 +313,53 @@ static bool vhost_svq_add_split(VhostShadowVirtqueu=
e *svq,
>      /* We need some descriptors here */
>      assert(elem->out_num || elem->in_num);
>
> -    ok =3D vhost_svq_translate_addr(svq, sgs, elem->out_sg, elem->out_nu=
m);
> -    if (unlikely(!ok)) {
> -        return false;
> +    if (elem->out_sg && svq_elem->not_from_guest) {
> +        DMAMap map =3D {
> +            .translated_addr =3D (hwaddr)svq_elem->elem.out_sg->iov_base=
,
> +            .size =3D ROUND_UP(elem->out_sg->iov_len, 4096) - 1,
> +            .perm =3D IOMMU_RO,
> +        };
> +        int r =3D vhost_iova_tree_map_alloc(svq->iova_tree, &map);
> +
> +        elem->out_addr[0] =3D map.iova;
> +        assert(elem->out_num =3D=3D 1);
> +        assert(r =3D=3D IOVA_OK);
> +
> +        r =3D svq->map_ops->map(map.iova, map.size, (void *)map.translat=
ed_addr,
> +                              true, svq->map_ops_opaque);
> +        assert(r =3D=3D 0);
> +        sgs[0] =3D (void *)map.iova;
> +    } else {
> +        ok =3D vhost_svq_translate_addr(svq, sgs, elem->out_sg, elem->ou=
t_num);
> +        if (unlikely(!ok)) {
> +            return false;
> +        }
>      }
>      vhost_vring_write_descs(svq, sgs, elem->out_sg, elem->out_num,
>                              elem->in_num > 0, false);
>
> +    if (elem->in_sg && svq_elem->not_from_guest) {
> +        DMAMap map =3D {
> +            .translated_addr =3D (hwaddr)svq_elem->elem.in_sg->iov_base,
> +            .size =3D ROUND_UP(elem->in_sg->iov_len, 4096) - 1,
> +            .perm =3D IOMMU_RW,
> +        };
> +        int r =3D vhost_iova_tree_map_alloc(svq->iova_tree, &map);
>
> -    ok =3D vhost_svq_translate_addr(svq, sgs, elem->in_sg, elem->in_num)=
;
> -    if (unlikely(!ok)) {
> -        return false;
> -    }
> +        elem->in_addr[0] =3D map.iova;
> +        assert(elem->out_num =3D=3D 1);
> +        assert(r =3D=3D IOVA_OK);
>
> +        r =3D svq->map_ops->map(map.iova, map.size, (void *)map.translat=
ed_addr,
> +                              false, svq->map_ops_opaque);
> +        assert(r =3D=3D 0);
> +        sgs[0] =3D (void *)map.iova;
> +    } else {
> +        ok =3D vhost_svq_translate_addr(svq, sgs, elem->in_sg, elem->in_=
num);
> +        if (unlikely(!ok)) {
> +            return false;
> +        }
> +    }
>      vhost_vring_write_descs(svq, sgs, elem->in_sg, elem->in_num, false, =
true);
>
>      /*
> @@ -364,6 +400,43 @@ static void vhost_svq_kick(VhostShadowVirtqueue *svq=
)
>      event_notifier_set(&svq->hdev_kick);
>  }
>
> +bool vhost_svq_inject(VhostShadowVirtqueue *svq, const struct iovec *iov=
,
> +                      size_t out_num, size_t in_num)
> +{
> +    size_t out_size =3D iov_size(iov, out_num);
> +    size_t out_buf_size =3D ROUND_UP(out_size, 4096);
> +    size_t in_size =3D iov_size(iov + out_num, in_num);
> +    size_t in_buf_size =3D ROUND_UP(in_size, 4096);
> +    SVQElement *svq_elem;
> +    uint16_t num_slots =3D (in_num ? 1 : 0) + (out_num ? 1 : 0);
> +
> +    if (unlikely(num_slots =3D=3D 0 || svq->next_guest_avail_elem ||
> +        vhost_svq_available_slots(svq) < num_slots)) {
> +        return false;
> +    }
> +
> +    svq_elem =3D virtqueue_alloc_element(sizeof(SVQElement), 1, 1);
> +    if (out_num) {
> +        void *out =3D qemu_memalign(4096, out_buf_size);
> +        svq_elem->elem.out_sg[0].iov_base =3D out;
> +        svq_elem->elem.out_sg[0].iov_len =3D out_size;
> +        iov_to_buf(iov, out_num, 0, out, out_size);
> +        memset(out + out_size, 0, out_buf_size - out_size);
> +    }
> +    if (in_num) {
> +        void *in =3D qemu_memalign(4096, in_buf_size);
> +        svq_elem->elem.in_sg[0].iov_base =3D in;
> +        svq_elem->elem.in_sg[0].iov_len =3D in_size;
> +        memset(in, 0, in_buf_size);
> +    }
> +
> +    svq_elem->not_from_guest =3D true;
> +    vhost_svq_add(svq, svq_elem);
> +    vhost_svq_kick(svq);
> +
> +    return true;
> +}
> +
>  /**
>   * Forward available buffers.
>   *
> @@ -512,23 +585,50 @@ static void vhost_svq_flush(VhostShadowVirtqueue *s=
vq,
>              }
>
>              elem =3D &svq_elem->elem;
> -            if (unlikely(i >=3D svq->vring.num)) {
> -                virtio_error(svq->vdev,
> -                         "More than %u used buffers obtained in a %u siz=
e SVQ",
> -                         i, svq->vring.num);
> -                virtqueue_fill(vq, elem, elem->len, i);
> -                virtqueue_flush(vq, i);
> -                i =3D 0;
> -            }
> -            virtqueue_fill(vq, elem, elem->len, i++);
> -
>              if (svq->ops && svq->ops->used_elem_handler) {
>                  svq->ops->used_elem_handler(svq->vdev, elem);
>              }
> +
> +            if (svq_elem->not_from_guest) {
> +                const DMAMap out_map =3D {
> +                    .iova =3D elem->out_addr[0],
> +                    .translated_addr =3D (hwaddr)elem->out_sg[0].iov_bas=
e,
> +                    .size =3D elem->out_sg[0].iov_len,
> +                };
> +                const DMAMap in_map =3D {
> +                    .iova =3D elem->in_addr[0],
> +                    .translated_addr =3D (hwaddr)elem->in_sg[0].iov_base=
,
> +                    .size =3D elem->in_sg[0].iov_len,
> +                };
> +                vhost_iova_tree_remove(svq->iova_tree, &out_map);
> +                if (svq->map_ops->unmap) {

This is actually bad, as is removing the SVQ element size, not the map size=
.

Same for the "in_map". I will fix it for the next revision.

Thanks!

> +                    svq->map_ops->unmap(out_map.iova, in_map.size,
> +                                        svq->map_ops_opaque);
> +                }
> +                qemu_vfree(elem->out_sg[0].iov_base);
> +                vhost_iova_tree_remove(svq->iova_tree, &in_map);
> +                if (svq->map_ops->unmap) {
> +                    svq->map_ops->unmap(out_map.iova, out_map.size,
> +                                        svq->map_ops_opaque);
> +                }
> +                qemu_vfree(elem->in_sg[0].iov_base);
> +            } else {
> +                if (unlikely(i >=3D svq->vring.num)) {
> +                    virtio_error(svq->vdev,
> +                        "More than %u used buffers obtained in a %u size=
 SVQ",
> +                        i, svq->vring.num);
> +                    virtqueue_fill(vq, elem, elem->len, i);
> +                    virtqueue_flush(vq, i);
> +                    i =3D 0;
> +                }
> +                virtqueue_fill(vq, elem, elem->len, i++);
> +            }
>          }
>
> -        virtqueue_flush(vq, i);
> -        event_notifier_set(&svq->svq_call);
> +        if (i > 0) {
> +            virtqueue_flush(vq, i);
> +            event_notifier_set(&svq->svq_call);
> +        }
>
>          if (check_for_avail_queue && svq->next_guest_avail_elem) {
>              /*
> @@ -704,14 +804,14 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
>      for (unsigned i =3D 0; i < svq->vring.num; ++i) {
>          g_autofree SVQElement *svq_elem =3D NULL;
>          svq_elem =3D g_steal_pointer(&svq->ring_id_maps[i]);
> -        if (svq_elem)  {
> +        if (svq_elem && !svq_elem->not_from_guest)  {
>              virtqueue_detach_element(svq->vq, &svq_elem->elem,
>                                       svq_elem->elem.len);
>          }
>      }
>
>      next_avail_elem =3D g_steal_pointer(&svq->next_guest_avail_elem);
> -    if (next_avail_elem) {
> +    if (next_avail_elem && !next_avail_elem->not_from_guest) {
>          virtqueue_detach_element(svq->vq, &next_avail_elem->elem,
>                                   next_avail_elem->elem.len);
>      }
> --
> 2.27.0
>
>


