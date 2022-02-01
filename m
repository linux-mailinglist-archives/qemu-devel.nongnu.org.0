Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD074A6724
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 22:38:49 +0100 (CET)
Received: from localhost ([::1]:43556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF0rQ-00020m-GN
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 16:38:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nEwhQ-00037M-NC
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:12:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nEwh2-0006Go-Gx
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:11:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643735507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HkbBI3yY5U5YzdCFpv5javDx2MPzf4S+ql8pWSi4y6E=;
 b=IyE6X35FCiT45NlO62anrvdxksAr5YSRN2eKfPzlDdt9hMewDNJMtStH41BDyTHAMAjhX9
 QAlytXMzZPxUlNLW5CDwGACu6bB4Z8YZJyNFfvw8kRD3VnNiq+pAIgrnqRwEdbvb/E+hm1
 jaVJyLHK8Wq1dwsmYnMTXTxih4aI6i4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-iuPcEv00PeqeUcUJTB0zxg-1; Tue, 01 Feb 2022 12:11:47 -0500
X-MC-Unique: iuPcEv00PeqeUcUJTB0zxg-1
Received: by mail-qv1-f70.google.com with SMTP id
 t3-20020a0562140c6300b00424a0fd3721so16439295qvj.12
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 09:11:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HkbBI3yY5U5YzdCFpv5javDx2MPzf4S+ql8pWSi4y6E=;
 b=DTShMDTwf3tR1Mf0sNpnqonkYPlUPJljACBIxONZfr63tcyPnuyvCjh2eGGBxtTCVl
 CqQa1a7Krex77I9U7Wc6t5Tf0pKGVzKae7LkdkoOynpX5uIJoXUAZZhKNuD7IWF3xpWj
 d7pQOAcX4XpwZdRKWP/PcLMHFzw/zQ6yBEtT81kTStLEmgzXpISMB+nGqWfq5tHyv2IO
 WWSUuF3KEHW0/6qw7Q1PNdDdS54moXNquZvstjEa0o+qVGp4Vq5o9eQOanSqNE1HHBxt
 tJnLVQCl8ART2A6yw/ZH4czUypxh9quqJ7RegQqZrOhFrbvXMhCbRZWCiuAN9Y62sUFR
 ZMUQ==
X-Gm-Message-State: AOAM532Qbp4otuOBcHLD2EidJeoiMlUBk5cQwLYZOktuICtmIJLz3CuY
 wmSczZU2qbjhmrv6+L0G5ZXe5pCewMIzRVQm7EEPK/uS3HNPpCnI30blyLdkPzCH2HB8qWR/an1
 alUPcXc3Gz7ty+VXhQGnTvQEaIG6e03s=
X-Received: by 2002:ac8:5a4a:: with SMTP id o10mr3464764qta.459.1643735506545; 
 Tue, 01 Feb 2022 09:11:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyraekFvhYEzNtTvXJSo33djEu6aQmhnpNBzx+20C5/AAqT5H8O3aX/QeKkdE7RBbaqwt/dp3ecY3+87IOBURk=
X-Received: by 2002:ac8:5a4a:: with SMTP id o10mr3464726qta.459.1643735506283; 
 Tue, 01 Feb 2022 09:11:46 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-31-eperezma@redhat.com>
 <a05fe05e-ff20-5f2b-ef95-c7db0e7b2670@redhat.com>
In-Reply-To: <a05fe05e-ff20-5f2b-ef95-c7db0e7b2670@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 1 Feb 2022 18:11:10 +0100
Message-ID: <CAJaqyWeF_mzVxkRTu3XbNZZkTFnZ+7JZ9fE074hHFOiRLSuwJg@mail.gmail.com>
Subject: Re: [PATCH 30/31] vdpa: Move vhost_vdpa_get_iova_range to
 net/vhost-vdpa.c
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jan 30, 2022 at 7:53 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > Since it's a device property, it can be done in net/. This helps SVQ to
> > allocate the rings in vdpa device initialization, rather than delay
> > that.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-vdpa.c | 15 ---------------
> >   net/vhost-vdpa.c       | 32 ++++++++++++++++++++++++--------
>
>
> I don't understand here, since we will support device other than net?
>
>
> >   2 files changed, 24 insertions(+), 23 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 75090d65e8..2491c05d29 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -350,19 +350,6 @@ static int vhost_vdpa_add_status(struct vhost_dev =
*dev, uint8_t status)
> >       return 0;
> >   }
> >
> > -static void vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
> > -{
> > -    int ret =3D vhost_vdpa_call(v->dev, VHOST_VDPA_GET_IOVA_RANGE,
> > -                              &v->iova_range);
> > -    if (ret !=3D 0) {
> > -        v->iova_range.first =3D 0;
> > -        v->iova_range.last =3D UINT64_MAX;
> > -    }
> > -
> > -    trace_vhost_vdpa_get_iova_range(v->dev, v->iova_range.first,
> > -                                    v->iova_range.last);
> > -}
>
>
> Let's just export this instead?
>

Yes, I see now that export is a better solution than moving.

Thanks!

> Thanks
>
>
> > -
> >   static bool vhost_vdpa_one_time_request(struct vhost_dev *dev)
> >   {
> >       struct vhost_vdpa *v =3D dev->opaque;
> > @@ -1295,8 +1282,6 @@ static int vhost_vdpa_init(struct vhost_dev *dev,=
 void *opaque, Error **errp)
> >           goto err;
> >       }
> >
> > -    vhost_vdpa_get_iova_range(v);
> > -
> >       if (vhost_vdpa_one_time_request(dev)) {
> >           return 0;
> >       }
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 4befba5cc7..cc9cecf8d1 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -22,6 +22,7 @@
> >   #include <sys/ioctl.h>
> >   #include <err.h>
> >   #include "standard-headers/linux/virtio_net.h"
> > +#include "standard-headers/linux/vhost_types.h"
> >   #include "monitor/monitor.h"
> >   #include "hw/virtio/vhost.h"
> >
> > @@ -187,13 +188,25 @@ static NetClientInfo net_vhost_vdpa_info =3D {
> >           .check_peer_type =3D vhost_vdpa_check_peer_type,
> >   };
> >
> > +static void vhost_vdpa_get_iova_range(int fd,
> > +                                      struct vhost_vdpa_iova_range *io=
va_range)
> > +{
> > +    int ret =3D ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
> > +
> > +    if (ret < 0) {
> > +        iova_range->first =3D 0;
> > +        iova_range->last =3D UINT64_MAX;
> > +    }
> > +}
> > +
> >   static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
> > -                                           const char *device,
> > -                                           const char *name,
> > -                                           int vdpa_device_fd,
> > -                                           int queue_pair_index,
> > -                                           int nvqs,
> > -                                           bool is_datapath)
> > +                                       const char *device,
> > +                                       const char *name,
> > +                                       int vdpa_device_fd,
> > +                                       int queue_pair_index,
> > +                                       int nvqs,
> > +                                       bool is_datapath,
> > +                                       struct vhost_vdpa_iova_range io=
va_range)
> >   {
> >       NetClientState *nc =3D NULL;
> >       VhostVDPAState *s;
> > @@ -211,6 +224,7 @@ static NetClientState *net_vhost_vdpa_init(NetClien=
tState *peer,
> >
> >       s->vhost_vdpa.device_fd =3D vdpa_device_fd;
> >       s->vhost_vdpa.index =3D queue_pair_index;
> > +    s->vhost_vdpa.iova_range =3D iova_range;
> >       ret =3D vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_ind=
ex, nvqs);
> >       if (ret) {
> >           qemu_del_net_client(nc);
> > @@ -267,6 +281,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const=
 char *name,
> >       g_autofree NetClientState **ncs =3D NULL;
> >       NetClientState *nc;
> >       int queue_pairs, i, has_cvq =3D 0;
> > +    struct vhost_vdpa_iova_range iova_range;
> >
> >       assert(netdev->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> >       opts =3D &netdev->u.vhost_vdpa;
> > @@ -286,19 +301,20 @@ int net_init_vhost_vdpa(const Netdev *netdev, con=
st char *name,
> >           qemu_close(vdpa_device_fd);
> >           return queue_pairs;
> >       }
> > +    vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> >
> >       ncs =3D g_malloc0(sizeof(*ncs) * queue_pairs);
> >
> >       for (i =3D 0; i < queue_pairs; i++) {
> >           ncs[i] =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > -                                     vdpa_device_fd, i, 2, true);
> > +                                     vdpa_device_fd, i, 2, true, iova_=
range);
> >           if (!ncs[i])
> >               goto err;
> >       }
> >
> >       if (has_cvq) {
> >           nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > -                                 vdpa_device_fd, i, 1, false);
> > +                                 vdpa_device_fd, i, 1, false, iova_ran=
ge);
> >           if (!nc)
> >               goto err;
> >       }
>


