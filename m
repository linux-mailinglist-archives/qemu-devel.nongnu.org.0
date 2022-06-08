Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3261E543934
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 18:41:28 +0200 (CEST)
Received: from localhost ([::1]:55126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyykI-0008H3-PV
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 12:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nyyi1-0006pN-Aa
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:39:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nyyhw-0006cs-2X
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:39:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654706338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/UEeq6xat0rDpbKpKugX4cDGM0zQ94k3gGebsyVZJ0M=;
 b=OvFLjpGbWOMhVn1dicSKBRyZeUwQD+sO080ooWuXTnTuGUhryFNRhUTF3dFpQxE89Rtupv
 w8qUcGFrUQp4LKChiiRXqqeOKw+AZoW1V1o/Ht5m4EE9fs9rGxQvRTuduUN6ASNp3sdOi/
 VnIQKOr0K86v2u7gZxuiGEmyBjtntGE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-RP9WMcaLNieCRqC5ynLLww-1; Wed, 08 Jun 2022 12:38:57 -0400
X-MC-Unique: RP9WMcaLNieCRqC5ynLLww-1
Received: by mail-qt1-f198.google.com with SMTP id
 u24-20020a05622a199800b0030500f8e1bcso1879407qtc.16
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 09:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/UEeq6xat0rDpbKpKugX4cDGM0zQ94k3gGebsyVZJ0M=;
 b=KBBWkmnBGWw5FfmHpe1gwyrDoZlS7L6LzyIfCd22u8ep4WkrVvMFun+1LeEjVNjJ5A
 /13Kls8dZQs4AeOBuGfGxNunMDVDkJc4VhbKACNtXqWvMBwtmrHLiaCsJQzwrq5gNEoD
 C6vvjrgK/vGrBNGwJPjM/FvDVt5ZcUiht8IgUwfcMoTTCb9v3BxJu5P0PjX3AwTnlsF3
 9pLD+DDQVR3uddOhBLqjv7B8j8lgxIZ1HZkbOHbx1MSTDn/9L+S71JqUItz2h5SgAPAZ
 JBVniLSdLQ4rdoVhYhtF2wKsVgXUTqFKoM+yMXDIDhQK0qEIj5/Yd9nAikBNi7wusbfz
 IQ7w==
X-Gm-Message-State: AOAM5306+95RYuP5fy8YhHmxc+X+7+iPe+rD87s1043hX0bZxNNHt8eL
 I3TeLXYPKjTuWZJUrtwf3cJW5Eavvd7eb8La1CyHwGNsr7ymeDne8TQcd+fFVq6jZRNuN7tDmUF
 kuQCJSuTxuqILHu0zjGgxBHtRIkm3Ys8=
X-Received: by 2002:a05:620a:1a0d:b0:6a6:ba92:d82b with SMTP id
 bk13-20020a05620a1a0d00b006a6ba92d82bmr11910509qkb.522.1654706337158; 
 Wed, 08 Jun 2022 09:38:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYP1Ee48eMw4K4gAhxDsLm+pO14zNSDFZd2KjpCpSw5H8B1HGsqSOi74uP66pwF+ZPT+u/nau/BCcFeg+E5r0=
X-Received: by 2002:a05:620a:1a0d:b0:6a6:ba92:d82b with SMTP id
 bk13-20020a05620a1a0d00b006a6ba92d82bmr11910475qkb.522.1654706336902; Wed, 08
 Jun 2022 09:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220519191306.821774-1-eperezma@redhat.com>
 <20220519191306.821774-4-eperezma@redhat.com>
 <050a3bc5-911b-4478-1d5c-8064a1c2fae4@redhat.com>
In-Reply-To: <050a3bc5-911b-4478-1d5c-8064a1c2fae4@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 8 Jun 2022 18:38:20 +0200
Message-ID: <CAJaqyWfWiRyyjytXUmehk7+T6_KAF40d9gFgqrp_gaFxLU_pMw@mail.gmail.com>
Subject: Re: [RFC PATCH v8 03/21] vdpa: control virtqueue support on shadow
 virtqueue
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Eric Blake <eblake@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Jun 7, 2022 at 8:05 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/5/20 03:12, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > Introduce the control virtqueue support for vDPA shadow virtqueue. This
> > is needed for advanced networking features like multiqueue.
> >
> > To demonstrate command handling, VIRTIO_NET_F_CTRL_MACADDR and
> > VIRTIO_NET_CTRL_MQ are implemented. If vDPA device is started with SVQ
> > support and virtio-net driver changes MAC or the number of queues
> > virtio-net device model will be updated with the new one.
> >
> > Others cvq commands could be added here straightforwardly but they have
> > been not tested.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   net/vhost-vdpa.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 44 insertions(+)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index df1e69ee72..ef12fc284c 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -11,6 +11,7 @@
> >
> >   #include "qemu/osdep.h"
> >   #include "clients.h"
> > +#include "hw/virtio/virtio-net.h"
> >   #include "net/vhost_net.h"
> >   #include "net/vhost-vdpa.h"
> >   #include "hw/virtio/vhost-vdpa.h"
> > @@ -187,6 +188,46 @@ static NetClientInfo net_vhost_vdpa_info =3D {
> >           .check_peer_type =3D vhost_vdpa_check_peer_type,
> >   };
> >
> > +static void vhost_vdpa_net_handle_ctrl(VirtIODevice *vdev,
> > +                                       const VirtQueueElement *elem)
> > +{
> > +    struct virtio_net_ctrl_hdr ctrl;
> > +    virtio_net_ctrl_ack status =3D VIRTIO_NET_ERR;
> > +    size_t s;
> > +    struct iovec in =3D {
> > +        .iov_base =3D &status,
> > +        .iov_len =3D sizeof(status),
> > +    };
> > +
> > +    s =3D iov_to_buf(elem->out_sg, elem->out_num, 0, &ctrl, sizeof(ctr=
l.class));
> > +    if (s !=3D sizeof(ctrl.class)) {
> > +        return;
> > +    }
> > +
> > +    switch (ctrl.class) {
> > +    case VIRTIO_NET_CTRL_MAC_ADDR_SET:
> > +    case VIRTIO_NET_CTRL_MQ:
> > +        break;
> > +    default:
> > +        return;
> > +    };
>
>
> I think we can probably remove the whitelist here since it is expected
> to work for any kind of command?
>

SVQ is expected to inject virtio device status at startup
(specifically, at live migration destination startup). This code is
specific per command.

Thanks!

> Thanks
>
>
> > +
> > +    s =3D iov_to_buf(elem->in_sg, elem->in_num, 0, &status, sizeof(sta=
tus));
> > +    if (s !=3D sizeof(status) || status !=3D VIRTIO_NET_OK) {
> > +        return;
> > +    }
> > +
> > +    status =3D VIRTIO_NET_ERR;
> > +    virtio_net_handle_ctrl_iov(vdev, &in, 1, elem->out_sg, elem->out_n=
um);
> > +    if (status !=3D VIRTIO_NET_OK) {
> > +        error_report("Bad CVQ processing in model");
> > +    }
> > +}
> > +
> > +static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops =3D {
> > +    .used_elem_handler =3D vhost_vdpa_net_handle_ctrl,
> > +};
> > +
> >   static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
> >                                              const char *device,
> >                                              const char *name,
> > @@ -211,6 +252,9 @@ static NetClientState *net_vhost_vdpa_init(NetClien=
tState *peer,
> >
> >       s->vhost_vdpa.device_fd =3D vdpa_device_fd;
> >       s->vhost_vdpa.index =3D queue_pair_index;
> > +    if (!is_datapath) {
> > +        s->vhost_vdpa.shadow_vq_ops =3D &vhost_vdpa_net_svq_ops;
> > +    }
> >       ret =3D vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_ind=
ex, nvqs);
> >       if (ret) {
> >           qemu_del_net_client(nc);
>


