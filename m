Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A79C575A2A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 06:10:46 +0200 (CEST)
Received: from localhost ([::1]:57848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCCf6-000859-PY
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 00:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oCCdB-0005Si-4V
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 00:08:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oCCd7-0001AV-56
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 00:08:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657858120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oq1XE7bw/Asz5NdnC1GVEvLtM2ZJVrxiAV5hihRTuYg=;
 b=HKNTAd2CsukwTbgXDyF3yRyLfPO5mWmKZj5Qrt53ufDfisImq3kCbwbfb6LsN63NrxrcVD
 Ke2TJj7Q02PX6U1SBoN8SFpxDuMM4Q0X3cDn9KmX37/ZtzaZYVyzLKiu9bLMpTql/VTr8d
 cKG0IJP8k6xLj34J4VY5GbRZUEx7uHQ=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-ojFvHrHiNvWvrAKurAjFrw-1; Fri, 15 Jul 2022 00:08:39 -0400
X-MC-Unique: ojFvHrHiNvWvrAKurAjFrw-1
Received: by mail-lf1-f72.google.com with SMTP id
 o9-20020ac24e89000000b00489c7acd6cbso1433948lfr.13
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 21:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oq1XE7bw/Asz5NdnC1GVEvLtM2ZJVrxiAV5hihRTuYg=;
 b=W0IFNT/PM+I+F0pedGbzKkH3l6kOTNNJpJlJEOxkXzg2vnqy5oy9fklJFYRme/MxFQ
 AqnhwhdN9LrKJAMNp85dP3d9Mqlh2zOoADTs+N2YAwINsRre20Nan3HcMVA9WYsofz5F
 d3YfAoPgevzpl/K8jX2Ul9QiCbLg37q1BYQo2VkhZUnYObFgr9l6EwG15enQF2pbgQcF
 0B+nbWy1KP2zSHHYB+Evs2O5ipHAHRj2/IzVyFcEbnJU82JqmbjgpjfYzM218e4MlmID
 rWAq8yQR8nDYsIN9g7ZV/5L1xoJITXWmLvqJETNqJ50QXiVSyoA+2mv9AIe7s/Dg8jm8
 bLWA==
X-Gm-Message-State: AJIora+IQ0zlBv2RIITOIAPxmbUjbC+uJtdhgBlhbTICimOyhJL9oWXh
 ootxyhhOzFLa5Ci8UFngFeS7nZiblorsKfKTDeTDbBiG3o0jLnIO7hZ/BYMrxmpBn5y6FiKJW9j
 DkO1v4bRSGkt8HyN47YvQ5bg7T9HnMDs=
X-Received: by 2002:a05:651c:2103:b0:25d:6478:2a57 with SMTP id
 a3-20020a05651c210300b0025d64782a57mr6016599ljq.496.1657858116634; 
 Thu, 14 Jul 2022 21:08:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uY3J6WG4+UNujQlhUTBwC5TVa8Wj3D+xkWUfDxnBpIEBeV3xzbLcO85sOfcRWKcfwew3V353VM9WdhPYQOUz0=
X-Received: by 2002:a05:651c:2103:b0:25d:6478:2a57 with SMTP id
 a3-20020a05651c210300b0025d64782a57mr6016580ljq.496.1657858116333; Thu, 14
 Jul 2022 21:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220714163150.2536327-1-eperezma@redhat.com>
 <20220714163150.2536327-16-eperezma@redhat.com>
In-Reply-To: <20220714163150.2536327-16-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 15 Jul 2022 12:08:25 +0800
Message-ID: <CACGkMEvV9X6odd=p2g_6NyUqOw7ZqApd_zker0uDLXyZK9kDcw@mail.gmail.com>
Subject: Re: [PATCH v2 15/19] vdpa: manual forward CVQ buffers
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Parav Pandit <parav@mellanox.com>, 
 Laurent Vivier <lvivier@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Eli Cohen <eli@mellanox.com>, Cindy Lu <lulu@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 15, 2022 at 12:32 AM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
>
> Do a simple forwarding of CVQ buffers, the same work SVQ could do but
> through callbacks. No functional change intended.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  include/hw/virtio/vhost-vdpa.h |  3 ++
>  hw/virtio/vhost-vdpa.c         |  3 +-
>  net/vhost-vdpa.c               | 58 ++++++++++++++++++++++++++++++++++
>  3 files changed, 63 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdp=
a.h
> index 7214eb47dc..1111d85643 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -15,6 +15,7 @@
>  #include <gmodule.h>
>
>  #include "hw/virtio/vhost-iova-tree.h"
> +#include "hw/virtio/vhost-shadow-virtqueue.h"
>  #include "hw/virtio/virtio.h"
>  #include "standard-headers/linux/vhost_types.h"
>
> @@ -35,6 +36,8 @@ typedef struct vhost_vdpa {
>      /* IOVA mapping used by the Shadow Virtqueue */
>      VhostIOVATree *iova_tree;
>      GPtrArray *shadow_vqs;
> +    const VhostShadowVirtqueueOps *shadow_vq_ops;
> +    void *shadow_vq_ops_opaque;
>      struct vhost_dev *dev;
>      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
>  } VhostVDPA;
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 96997210be..beaaa7049a 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -419,7 +419,8 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev=
, struct vhost_vdpa *v,
>      for (unsigned n =3D 0; n < hdev->nvqs; ++n) {
>          g_autoptr(VhostShadowVirtqueue) svq;
>
> -        svq =3D vhost_svq_new(v->iova_tree, NULL, NULL);
> +        svq =3D vhost_svq_new(v->iova_tree, v->shadow_vq_ops,
> +                            v->shadow_vq_ops_opaque);
>          if (unlikely(!svq)) {
>              error_setg(errp, "Cannot create svq %u", n);
>              return -1;
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index df1e69ee72..805c9dd6b6 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -11,11 +11,14 @@
>
>  #include "qemu/osdep.h"
>  #include "clients.h"
> +#include "hw/virtio/virtio-net.h"
>  #include "net/vhost_net.h"
>  #include "net/vhost-vdpa.h"
>  #include "hw/virtio/vhost-vdpa.h"
>  #include "qemu/config-file.h"
>  #include "qemu/error-report.h"
> +#include "qemu/log.h"
> +#include "qemu/memalign.h"
>  #include "qemu/option.h"
>  #include "qapi/error.h"
>  #include <linux/vhost.h>
> @@ -187,6 +190,57 @@ static NetClientInfo net_vhost_vdpa_info =3D {
>          .check_peer_type =3D vhost_vdpa_check_peer_type,
>  };
>
> +/**
> + * Forward buffer for the moment.
> + */
> +static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
> +                                            SVQElement *svq_elem, void *=
opaque)
> +{
> +    VirtQueueElement *elem =3D &svq_elem->elem;
> +    unsigned int n =3D elem->out_num + elem->in_num;
> +    g_autofree struct iovec *dev_buffers =3D g_new(struct iovec, n);
> +    size_t in_len, dev_written;
> +    virtio_net_ctrl_ack status =3D VIRTIO_NET_ERR;
> +    int r;
> +
> +    memcpy(dev_buffers, elem->out_sg, elem->out_num);
> +    memcpy(dev_buffers + elem->out_num, elem->in_sg, elem->in_num);
> +
> +    r =3D vhost_svq_add(svq, &dev_buffers[0], elem->out_num, &dev_buffer=
s[1],
> +                      elem->in_num, svq_elem);
> +    if (unlikely(r !=3D 0)) {
> +        if (unlikely(r =3D=3D -ENOSPC)) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: No space on device queue=
\n",
> +                          __func__);
> +        }
> +        goto out;
> +    }
> +
> +    /*
> +     * We can poll here since we've had BQL from the time we sent the
> +     * descriptor. Also, we need to take the answer before SVQ pulls by =
itself,
> +     * when BQL is released
> +     */
> +    dev_written =3D vhost_svq_poll(svq);
> +    if (unlikely(dev_written < sizeof(status))) {
> +        error_report("Insufficient written data (%zu)", dev_written);
> +    }
> +
> +out:
> +    in_len =3D iov_from_buf(elem->in_sg, elem->in_num, 0, &status,
> +                          sizeof(status));
> +    if (unlikely(in_len < sizeof(status))) {
> +        error_report("Bad device CVQ written length");
> +    }
> +    vhost_svq_push_elem(svq, svq_elem, MIN(in_len, sizeof(status)));
> +    g_free(svq_elem);
> +    return r;
> +}
> +
> +static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops =3D {
> +    .avail_handler =3D vhost_vdpa_net_handle_ctrl_avail,
> +};

I wonder if it's possible to even remove this handler. Can we let the
kick to be handled by virtio_net_handler_ctrl() in virtio-net.c?

Thanks

> +
>  static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>                                             const char *device,
>                                             const char *name,
> @@ -211,6 +265,10 @@ static NetClientState *net_vhost_vdpa_init(NetClient=
State *peer,
>
>      s->vhost_vdpa.device_fd =3D vdpa_device_fd;
>      s->vhost_vdpa.index =3D queue_pair_index;
> +    if (!is_datapath) {
> +        s->vhost_vdpa.shadow_vq_ops =3D &vhost_vdpa_net_svq_ops;
> +        s->vhost_vdpa.shadow_vq_ops_opaque =3D s;
> +    }
>      ret =3D vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_index,=
 nvqs);
>      if (ret) {
>          qemu_del_net_client(nc);
> --
> 2.31.1
>


