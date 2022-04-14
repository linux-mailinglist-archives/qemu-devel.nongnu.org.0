Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABB8500973
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 11:16:11 +0200 (CEST)
Received: from localhost ([::1]:54164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nevaE-0000Qm-GD
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 05:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nevUa-0003aS-Hm
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 05:10:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nevUX-00060k-VJ
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 05:10:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649927417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kDziIjZYJp8FQ/7F5479pLNOwd0jRcvBaJWiLeHQY00=;
 b=CFX+n6LKO/p5wUXzA8LwDaDzVNdJXlqez5m4B3MxndRESBKlZRwbo3gAx+rcqGRTphKiMP
 0JPOOvpVWFSNzXxeDZLc2xUsf658997lb6b23hFka/2PnfL8mZ23PsfZASG2zeuN4UDZ5j
 Pgzr+Ho6lMnQ8/3GJTotPpf2nnalzps=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-OmBCAXqzPf-1TvSzjnqAWg-1; Thu, 14 Apr 2022 05:10:16 -0400
X-MC-Unique: OmBCAXqzPf-1TvSzjnqAWg-1
Received: by mail-lf1-f72.google.com with SMTP id
 k11-20020a05651239cb00b0046bbe5d500eso2085902lfu.7
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 02:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kDziIjZYJp8FQ/7F5479pLNOwd0jRcvBaJWiLeHQY00=;
 b=mn0qx5Yq8VqXdPuoocQuHD4EoSFLBvdpnUGrR41+uOd9KBm98+ud9Jf4H0Z4lnmpcp
 qCr7DvHZimjCtLD3EEhi09qhlOUEHO18vcMGMq2gp+0LQnPvLnbzguHmWrKxHQ3bEUEo
 gjAZavrVVB5JD5hNpc+l2WiTHHbPS+NNWvF2TX3VJnnRGvq7CvimV50/3qvEDwMk41k+
 bOVVoiv1HU6tZ70PtTFe5XXdTMpVYLBXiWwMaBpyq0nrgwxkKaXvPPlFcqlmx5zUEgrn
 aLtyhBdNO06vtOLAl8fnaZHmHKdOvxyPGONRqWO5AZVF4/Q9r/P8cRfvMb93NBvWWLra
 vm0A==
X-Gm-Message-State: AOAM531ZcJkJ8/NgvOXj1JGBiL+pWxWUf/9cF27ocWUNgv1s2fe+/nhT
 /F1b2w/0EL1pR1Q8gqEFkwqXXqRYWJwuqorxR76UjbgwLe5Dp9vqITyuv/5mRdQC5hPH/Vsqtfz
 fVw522Lr1Dq+0H0ve5GJrME63DGZD+M4=
X-Received: by 2002:ac2:4189:0:b0:448:bc2b:e762 with SMTP id
 z9-20020ac24189000000b00448bc2be762mr1293890lfh.471.1649927414226; 
 Thu, 14 Apr 2022 02:10:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6CkTpjSJroifwwM00+hMnSr07Li4sVUP0OQUtkJQKZfPwydLrKga03uTrxQHPu4qOXDE8GdkdEiMGlCThMBE=
X-Received: by 2002:ac2:4189:0:b0:448:bc2b:e762 with SMTP id
 z9-20020ac24189000000b00448bc2be762mr1293879lfh.471.1649927413941; Thu, 14
 Apr 2022 02:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220413163206.1958254-1-eperezma@redhat.com>
 <20220413163206.1958254-25-eperezma@redhat.com>
In-Reply-To: <20220413163206.1958254-25-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 14 Apr 2022 17:10:02 +0800
Message-ID: <CACGkMEsYoRiz1YqYXyYqVgBx92tK+e=73wnY07T_q7+yW4cCYw@mail.gmail.com>
Subject: Re: [RFC PATCH v7 24/25] vdpa: Add asid attribute to vdpa device
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 14, 2022 at 12:33 AM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
>
> We can configure ASID per group, but we still use asid 0 for every vdpa
> device. Multiple asid support for cvq will be introduced in next
> patches
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  include/hw/virtio/vhost.h |  4 ++
>  hw/net/vhost_net.c        |  5 +++
>  hw/virtio/vhost-vdpa.c    | 95 ++++++++++++++++++++++++++++++++-------
>  net/vhost-vdpa.c          |  4 +-
>  hw/virtio/trace-events    |  9 ++--
>  5 files changed, 94 insertions(+), 23 deletions(-)
>
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index 034868fa9e..640cf82168 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -76,8 +76,12 @@ struct vhost_dev {
>      int vq_index;
>      /* one past the last vq index for the virtio device (not vhost) */
>      int vq_index_end;
> +    /* one past the last vq index of this virtqueue group */
> +    int vq_group_index_end;
>      /* if non-zero, minimum required value for max_queues */
>      int num_queues;
> +    /* address space id */

Instead of doing shortcuts like this, I think we need to have
abstraction as what kernel did. That is to say, introduce structures
like:

struct vhost_vdpa_dev_group;
struct vhost_vdpa_as;

Then having pointers to those structures like

struct vhost_vdpa {
        ...
        struct vhost_vdpa_dev_group *group;
};

struct vhost_vdpa_group {
        ...
        uint32_t id;
        struct vhost_vdpa_as;
};

struct vhost_vdpa_as {
        uint32_t id;
        MemoryListener listener;
};

We can read the group topology during initialization and allocate the
structure accordingly. If the CVQ has its own group:

1) We know we will have 2 AS otherwise 1 AS
2) allocate #AS and attach the group to the corresponding AS

Then we know the

1) map/unmap and listener is done per as instead of per group or vdpa.
2) AS attach/detach is done per group

And it would simplify the future extension when we want to advertise
the as/groups to guests.

To simplify the reviewing, we can introduce the above concept before
the ASID uAPIs and assume a 1 group 1 as a model as a start.

Thanks

> +    uint32_t address_space_id;
>      /* Must be a vq group different than any other vhost dev */
>      bool independent_vq_group;
>      uint64_t features;
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 10480e19e5..a34df739a7 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -344,15 +344,20 @@ int vhost_net_start(VirtIODevice *dev, NetClientSta=
te *ncs,
>
>      for (i =3D 0; i < nvhosts; i++) {
>          bool cvq_idx =3D i >=3D data_queue_pairs;
> +        uint32_t vq_group_end;
>
>          if (!cvq_idx) {
>              peer =3D qemu_get_peer(ncs, i);
> +            vq_group_end =3D 2 * data_queue_pairs;
>          } else { /* Control Virtqueue */
>              peer =3D qemu_get_peer(ncs, n->max_queue_pairs);
> +            vq_group_end =3D 2 * data_queue_pairs + 1;
>          }
>
>          net =3D get_vhost_net(peer);
> +        net->dev.address_space_id =3D !!cvq_idx;
>          net->dev.independent_vq_group =3D !!cvq_idx;
> +        net->dev.vq_group_index_end =3D vq_group_end;
>          vhost_net_set_vq_index(net, i * 2, index_end);
>
>          /* Suppress the masking guest notifiers on vhost user
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 4096555242..5ed211287c 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -79,6 +79,9 @@ static int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwa=
ddr iova, hwaddr size,
>      int ret =3D 0;
>
>      msg.type =3D v->msg_type;
> +    if (v->dev->backend_cap & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID)) {
> +        msg.asid =3D v->dev->address_space_id;
> +    }
>      msg.iotlb.iova =3D iova;
>      msg.iotlb.size =3D size;
>      msg.iotlb.uaddr =3D (uint64_t)(uintptr_t)vaddr;
> @@ -90,8 +93,9 @@ static int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwa=
ddr iova, hwaddr size,
>          return 0;
>      }
>
> -   trace_vhost_vdpa_dma_map(v, fd, msg.type, msg.iotlb.iova, msg.iotlb.s=
ize,
> -                            msg.iotlb.uaddr, msg.iotlb.perm, msg.iotlb.t=
ype);
> +    trace_vhost_vdpa_dma_map(v, fd, msg.type, msg.asid, msg.iotlb.iova,
> +                             msg.iotlb.size, msg.iotlb.uaddr, msg.iotlb.=
perm,
> +                             msg.iotlb.type);
>
>      if (write(fd, &msg, sizeof(msg)) !=3D sizeof(msg)) {
>          error_report("failed to write, fd=3D%d, errno=3D%d (%s)",
> @@ -109,6 +113,9 @@ static int vhost_vdpa_dma_unmap(struct vhost_vdpa *v,=
 hwaddr iova,
>      int fd =3D v->device_fd;
>      int ret =3D 0;
>
> +    if (v->dev->backend_cap & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID)) {
> +        msg.asid =3D v->dev->address_space_id;
> +    }
>      msg.type =3D v->msg_type;
>      msg.iotlb.iova =3D iova;
>      msg.iotlb.size =3D size;
> @@ -119,7 +126,7 @@ static int vhost_vdpa_dma_unmap(struct vhost_vdpa *v,=
 hwaddr iova,
>          return 0;
>      }
>
> -    trace_vhost_vdpa_dma_unmap(v, fd, msg.type, msg.iotlb.iova,
> +    trace_vhost_vdpa_dma_unmap(v, fd, msg.type, msg.asid, msg.iotlb.iova=
,
>                                 msg.iotlb.size, msg.iotlb.type);
>
>      if (write(fd, &msg, sizeof(msg)) !=3D sizeof(msg)) {
> @@ -134,6 +141,7 @@ static int vhost_vdpa_dma_unmap(struct vhost_vdpa *v,=
 hwaddr iova,
>  static void vhost_vdpa_listener_commit(MemoryListener *listener)
>  {
>      struct vhost_vdpa *v =3D container_of(listener, struct vhost_vdpa, l=
istener);
> +    struct vhost_dev *dev =3D v->dev;
>      struct vhost_msg_v2 msg =3D {};
>      int fd =3D v->device_fd;
>      size_t num =3D v->iotlb_updates->len;
> @@ -142,9 +150,14 @@ static void vhost_vdpa_listener_commit(MemoryListene=
r *listener)
>          return;
>      }
>
> +    if (dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_ASID)) {
> +        msg.asid =3D v->dev->address_space_id;
> +    }
> +
>      msg.type =3D v->msg_type;
>      msg.iotlb.type =3D VHOST_IOTLB_BATCH_BEGIN;
> -    trace_vhost_vdpa_listener_begin_batch(v, fd, msg.type, msg.iotlb.typ=
e);
> +    trace_vhost_vdpa_listener_begin_batch(v, fd, msg.type, msg.asid,
> +                                          msg.iotlb.type);
>      if (write(fd, &msg, sizeof(msg)) !=3D sizeof(msg)) {
>          error_report("failed to write BEGIN_BATCH, fd=3D%d, errno=3D%d (=
%s)",
>                       fd, errno, strerror(errno));
> @@ -162,7 +175,8 @@ static void vhost_vdpa_listener_commit(MemoryListener=
 *listener)
>      }
>
>      msg.iotlb.type =3D VHOST_IOTLB_BATCH_END;
> -    trace_vhost_vdpa_listener_commit(v, fd, msg.type, msg.iotlb.type);
> +    trace_vhost_vdpa_listener_commit(v, fd, msg.type, msg.asid,
> +                                     msg.iotlb.type);
>      if (write(fd, &msg, sizeof(msg)) !=3D sizeof(msg)) {
>          error_report("failed to write, fd=3D%d, errno=3D%d (%s)",
>                       fd, errno, strerror(errno));
> @@ -1171,10 +1185,48 @@ call_err:
>      return false;
>  }
>
> +static int vhost_vdpa_set_vq_group_address_space_id(struct vhost_dev *de=
v,
> +                                                struct vhost_vring_state=
 *asid)
> +{
> +    trace_vhost_vdpa_set_vq_group_address_space_id(dev, asid->index, asi=
d->num);
> +    return vhost_vdpa_call(dev, VHOST_VDPA_SET_GROUP_ASID, asid);
> +}
> +
> +static int vhost_vdpa_set_address_space_id(struct vhost_dev *dev)
> +{
> +    struct vhost_vring_state vq_group =3D {
> +        .index =3D dev->vq_index,
> +    };
> +    struct vhost_vring_state asid;
> +    int ret;
> +
> +    if (!dev->address_space_id) {
> +        return 0;
> +    }
> +
> +    ret =3D vhost_vdpa_get_vring_group(dev, &vq_group);
> +    if (unlikely(ret)) {
> +        error_report("Can't read vq group, errno=3D%d (%s)", ret,
> +                     g_strerror(-ret));
> +        return ret;
> +    }
> +
> +    asid.index =3D vq_group.num;
> +    asid.num =3D dev->address_space_id;
> +    ret =3D vhost_vdpa_set_vq_group_address_space_id(dev, &asid);
> +    if (unlikely(ret)) {
> +        error_report("Can't set vq group %u asid %u, errno=3D%d (%s)",
> +            asid.index, asid.num, ret, g_strerror(-ret));
> +    }
> +    return ret;
> +}
> +
>  static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>  {
>      struct vhost_vdpa *v =3D dev->opaque;
> -    bool ok;
> +    bool vq_group_end, ok;
> +    int r =3D 0;
> +
>      trace_vhost_vdpa_dev_start(dev, started);
>
>      if (started) {
> @@ -1183,6 +1235,10 @@ static int vhost_vdpa_dev_start(struct vhost_dev *=
dev, bool started)
>              !vhost_dev_is_independent_group(dev)) {
>              return -1;
>          }
> +        r =3D vhost_vdpa_set_address_space_id(dev);
> +        if (unlikely(r)) {
> +            return r;
> +        }
>          ok =3D vhost_vdpa_svqs_start(dev);
>          if (unlikely(!ok)) {
>              return -1;
> @@ -1196,21 +1252,26 @@ static int vhost_vdpa_dev_start(struct vhost_dev =
*dev, bool started)
>          vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
>      }
>
> -    if (dev->vq_index + dev->nvqs !=3D dev->vq_index_end) {
> -        return 0;
> +    vq_group_end =3D dev->vq_index + dev->nvqs =3D=3D dev->vq_group_inde=
x_end;
> +    if (vq_group_end && started) {
> +        memory_listener_register(&v->listener, &address_space_memory);
>      }
>
> -    if (started) {
> -        memory_listener_register(&v->listener, &address_space_memory);
> -        return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> -    } else {
> -        vhost_vdpa_reset_device(dev);
> -        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> -                                   VIRTIO_CONFIG_S_DRIVER);
> -        memory_listener_unregister(&v->listener);
> +    if (dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
> +        if (started) {
> +            r =3D vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> +        } else {
> +            vhost_vdpa_reset_device(dev);
> +            vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> +                                       VIRTIO_CONFIG_S_DRIVER);
> +        }
> +    }
>
> -        return 0;
> +    if (vq_group_end && !started) {
> +        memory_listener_unregister(&v->listener);
>      }
> +
> +    return r;
>  }
>
>  static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 15c3e4f703..a6f803ea4e 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -473,8 +473,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const c=
har *name,
>
>      if (has_cvq) {
>          nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> -                                 vdpa_device_fd, i, 1, false, opts->x_sv=
q,
> -                                 iova_tree);
> +                                 vdpa_device_fd, i, 1,
> +                                 false, opts->x_svq, iova_tree);
>          if (!nc)
>              goto err;
>      }
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index e6fdc03514..2858deac60 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -23,10 +23,10 @@ vhost_user_postcopy_waker_found(uint64_t client_addr)=
 "0x%"PRIx64
>  vhost_user_postcopy_waker_nomatch(const char *rb, uint64_t rb_offset) "%=
s + 0x%"PRIx64
>
>  # vhost-vdpa.c
> -vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint64_t iova,=
 uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type) "vdpa:%p fd: %d=
 msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" uaddr: 0x%"PRIx64"=
 perm: 0x%"PRIx8" type: %"PRIu8
> -vhost_vdpa_dma_unmap(void *vdpa, int fd, uint32_t msg_type, uint64_t iov=
a, uint64_t size, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iova: 0=
x%"PRIx64" size: 0x%"PRIx64" type: %"PRIu8
> -vhost_vdpa_listener_begin_batch(void *v, int fd, uint32_t msg_type, uint=
8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
> -vhost_vdpa_listener_commit(void *v, int fd, uint32_t msg_type, uint8_t t=
ype)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
> +vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint32_t asid,=
 uint64_t iova, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type) =
"vdpa:%p fd: %d msg_type: %"PRIu32" asid: %"PRIu32" iova: 0x%"PRIx64" size:=
 0x%"PRIx64" uaddr: 0x%"PRIx64" perm: 0x%"PRIx8" type: %"PRIu8
> +vhost_vdpa_dma_unmap(void *vdpa, int fd, uint32_t msg_type, uint32_t asi=
d, uint64_t iova, uint64_t size, uint8_t type) "vdpa:%p fd: %d msg_type: %"=
PRIu32" asid: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" type: %"PRIu8
> +vhost_vdpa_listener_begin_batch(void *v, int fd, uint32_t msg_type, uint=
32_t asid, uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" asid: %"PRIu3=
2" type: %"PRIu8
> +vhost_vdpa_listener_commit(void *v, int fd, uint32_t msg_type, uint32_t =
asid, uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" asid: %"PRIu32" ty=
pe: %"PRIu8
>  vhost_vdpa_listener_region_add(void *vdpa, uint64_t iova, uint64_t llend=
, void *vaddr, bool readonly) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx64" =
vaddr: %p read-only: %d"
>  vhost_vdpa_listener_region_del(void *vdpa, uint64_t iova, uint64_t llend=
) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx64
>  vhost_vdpa_add_status(void *dev, uint8_t status) "dev: %p status: 0x%"PR=
Ix8
> @@ -44,6 +44,7 @@ vhost_vdpa_dump_config(void *dev, const char *line) "de=
v: %p %s"
>  vhost_vdpa_set_config(void *dev, uint32_t offset, uint32_t size, uint32_=
t flags) "dev: %p offset: %"PRIu32" size: %"PRIu32" flags: 0x%"PRIx32
>  vhost_vdpa_get_config(void *dev, void *config, uint32_t config_len) "dev=
: %p config: %p config_len: %"PRIu32
>  vhost_vdpa_get_vring_group(void *dev, unsigned int index, unsigned int n=
um) "dev: %p index: %u num: %u"
> +vhost_vdpa_set_vq_group_address_space_id(void *dev, unsigned int index, =
unsigned int num) "dev: %p index: %u num: %u"
>  vhost_vdpa_dev_start(void *dev, bool started) "dev: %p started: %d"
>  vhost_vdpa_set_log_base(void *dev, uint64_t base, unsigned long long siz=
e, int refcnt, int fd, void *log) "dev: %p base: 0x%"PRIx64" size: %llu ref=
cnt: %d fd: %d log: %p"
>  vhost_vdpa_set_vring_addr(void *dev, unsigned int index, unsigned int fl=
ags, uint64_t desc_user_addr, uint64_t used_user_addr, uint64_t avail_user_=
addr, uint64_t log_guest_addr) "dev: %p index: %u flags: 0x%x desc_user_add=
r: 0x%"PRIx64" used_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" log=
_guest_addr: 0x%"PRIx64
> --
> 2.27.0
>


