Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C620E575E38
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 11:09:59 +0200 (CEST)
Received: from localhost ([::1]:40982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCHKd-0000Ri-SK
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 05:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCHDi-0001A4-1q
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 05:02:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCHDe-0006ZV-G1
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 05:02:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657875758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6S3b6zj+oDujG+0jRW+PgcpDkSgxvOiWh+1UevxxmSw=;
 b=WJLTKwn8FKPPn8xwqKWp5pRRuFD1X+Ma5xC2fQ6bgALuW81Y3cXt33SC96PnCQRlGI6DRg
 F4xXgP+WZMw65ujsbLYOvlKYmUjvzLiI3vavAij24heTnC76oUN3NxaULYuPagj9SUkl7O
 1dTwUNy1nFpl3sprFVuvom3d89mA9Ns=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-HO_RDfDRPDCFVHeb1geKDw-1; Fri, 15 Jul 2022 05:02:28 -0400
X-MC-Unique: HO_RDfDRPDCFVHeb1geKDw-1
Received: by mail-qk1-f200.google.com with SMTP id
 bp14-20020a05620a458e00b006b59195c391so3002493qkb.19
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 02:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6S3b6zj+oDujG+0jRW+PgcpDkSgxvOiWh+1UevxxmSw=;
 b=ZWTdDrUXkv5eDK9E1T/Li2GnT4WMs2VjNlDHNN6w66Zt4U2AOO8JDfK7EX45a45ZYM
 bY7AqdgoiZcbp5/RehEBWrZh0xo45eW9p6Ylwsv687imOhRjf86qj00Lr/9dkIruwM9p
 QKCOiYPKX71KxR2UhyFa5sNkwNFuM11eYg7RXu2/8kHFt7K9U/xeQ7KK6+B17pmOaxhc
 st0NhTyAaH2Gu4CKp43O6I/0wBYnz8wr0AXcTOag+ZASpcNMUYSUfOYG+hkhvIkaBByI
 gavb6A5z0y4y2Lgv+9Fmi1d5Tt34M6DvEWSPjGWEpm8vDofac3Y6wDM2FNGLpqXHSA90
 vvjA==
X-Gm-Message-State: AJIora/zlXnRGRszrqIviyT2wP1/gpDF0RQjHmzkvLkxRErjE/4wktj7
 AHaGWWOH631YqSrrFrSQuCUBW5lAr6yBSNuvVvYXDld9JlNDiR8tl0jVIWI4JOTmloocIcKxaaa
 cTrrwweepakaHoHxu2RN+aQ2UoIX/aCc=
X-Received: by 2002:a05:620a:f10:b0:6aa:318e:55a9 with SMTP id
 v16-20020a05620a0f1000b006aa318e55a9mr8751758qkl.559.1657875747089; 
 Fri, 15 Jul 2022 02:02:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vXxDHOH0AFMtsYLOfezDZTvtUXzkM6dpqSeiujVDoCASng4qVC5/V6LnAqKObGQYTT7EnpiP3Qf0YCxfAkbHI=
X-Received: by 2002:a05:620a:f10:b0:6aa:318e:55a9 with SMTP id
 v16-20020a05620a0f1000b006aa318e55a9mr8751742qkl.559.1657875746791; Fri, 15
 Jul 2022 02:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220714163150.2536327-1-eperezma@redhat.com>
 <20220714163150.2536327-16-eperezma@redhat.com>
 <CACGkMEvV9X6odd=p2g_6NyUqOw7ZqApd_zker0uDLXyZK9kDcw@mail.gmail.com>
 <CAJaqyWdJf9qSJvKo4-gjpFPKb2rpwDwKaZ2-reEsEtThdx+c6A@mail.gmail.com>
 <CACGkMEuETovdsG1J=bbYdvevCxErbobt8WA9P4wAp=s8sfjing@mail.gmail.com>
In-Reply-To: <CACGkMEuETovdsG1J=bbYdvevCxErbobt8WA9P4wAp=s8sfjing@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 15 Jul 2022 11:01:50 +0200
Message-ID: <CAJaqyWeFS9wUxxZh3oQWaMJgdtf-2Z5XHidMBWGCWSco5B77LQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/19] vdpa: manual forward CVQ buffers
To: Jason Wang <jasowang@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Fri, Jul 15, 2022 at 10:44 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Jul 15, 2022 at 1:34 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Fri, Jul 15, 2022 at 6:08 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Fri, Jul 15, 2022 at 12:32 AM Eugenio P=C3=A9rez <eperezma@redhat.=
com> wrote:
> > > >
> > > > Do a simple forwarding of CVQ buffers, the same work SVQ could do b=
ut
> > > > through callbacks. No functional change intended.
> > > >
> > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > ---
> > > >  include/hw/virtio/vhost-vdpa.h |  3 ++
> > > >  hw/virtio/vhost-vdpa.c         |  3 +-
> > > >  net/vhost-vdpa.c               | 58 ++++++++++++++++++++++++++++++=
++++
> > > >  3 files changed, 63 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vho=
st-vdpa.h
> > > > index 7214eb47dc..1111d85643 100644
> > > > --- a/include/hw/virtio/vhost-vdpa.h
> > > > +++ b/include/hw/virtio/vhost-vdpa.h
> > > > @@ -15,6 +15,7 @@
> > > >  #include <gmodule.h>
> > > >
> > > >  #include "hw/virtio/vhost-iova-tree.h"
> > > > +#include "hw/virtio/vhost-shadow-virtqueue.h"
> > > >  #include "hw/virtio/virtio.h"
> > > >  #include "standard-headers/linux/vhost_types.h"
> > > >
> > > > @@ -35,6 +36,8 @@ typedef struct vhost_vdpa {
> > > >      /* IOVA mapping used by the Shadow Virtqueue */
> > > >      VhostIOVATree *iova_tree;
> > > >      GPtrArray *shadow_vqs;
> > > > +    const VhostShadowVirtqueueOps *shadow_vq_ops;
> > > > +    void *shadow_vq_ops_opaque;
> > > >      struct vhost_dev *dev;
> > > >      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> > > >  } VhostVDPA;
> > > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > > index 96997210be..beaaa7049a 100644
> > > > --- a/hw/virtio/vhost-vdpa.c
> > > > +++ b/hw/virtio/vhost-vdpa.c
> > > > @@ -419,7 +419,8 @@ static int vhost_vdpa_init_svq(struct vhost_dev=
 *hdev, struct vhost_vdpa *v,
> > > >      for (unsigned n =3D 0; n < hdev->nvqs; ++n) {
> > > >          g_autoptr(VhostShadowVirtqueue) svq;
> > > >
> > > > -        svq =3D vhost_svq_new(v->iova_tree, NULL, NULL);
> > > > +        svq =3D vhost_svq_new(v->iova_tree, v->shadow_vq_ops,
> > > > +                            v->shadow_vq_ops_opaque);
> > > >          if (unlikely(!svq)) {
> > > >              error_setg(errp, "Cannot create svq %u", n);
> > > >              return -1;
> > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > index df1e69ee72..805c9dd6b6 100644
> > > > --- a/net/vhost-vdpa.c
> > > > +++ b/net/vhost-vdpa.c
> > > > @@ -11,11 +11,14 @@
> > > >
> > > >  #include "qemu/osdep.h"
> > > >  #include "clients.h"
> > > > +#include "hw/virtio/virtio-net.h"
> > > >  #include "net/vhost_net.h"
> > > >  #include "net/vhost-vdpa.h"
> > > >  #include "hw/virtio/vhost-vdpa.h"
> > > >  #include "qemu/config-file.h"
> > > >  #include "qemu/error-report.h"
> > > > +#include "qemu/log.h"
> > > > +#include "qemu/memalign.h"
> > > >  #include "qemu/option.h"
> > > >  #include "qapi/error.h"
> > > >  #include <linux/vhost.h>
> > > > @@ -187,6 +190,57 @@ static NetClientInfo net_vhost_vdpa_info =3D {
> > > >          .check_peer_type =3D vhost_vdpa_check_peer_type,
> > > >  };
> > > >
> > > > +/**
> > > > + * Forward buffer for the moment.
> > > > + */
> > > > +static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *=
svq,
> > > > +                                            SVQElement *svq_elem, =
void *opaque)
> > > > +{
> > > > +    VirtQueueElement *elem =3D &svq_elem->elem;
> > > > +    unsigned int n =3D elem->out_num + elem->in_num;
> > > > +    g_autofree struct iovec *dev_buffers =3D g_new(struct iovec, n=
);
> > > > +    size_t in_len, dev_written;
> > > > +    virtio_net_ctrl_ack status =3D VIRTIO_NET_ERR;
> > > > +    int r;
> > > > +
> > > > +    memcpy(dev_buffers, elem->out_sg, elem->out_num);
> > > > +    memcpy(dev_buffers + elem->out_num, elem->in_sg, elem->in_num)=
;
> > > > +
> > > > +    r =3D vhost_svq_add(svq, &dev_buffers[0], elem->out_num, &dev_=
buffers[1],
> > > > +                      elem->in_num, svq_elem);
> > > > +    if (unlikely(r !=3D 0)) {
> > > > +        if (unlikely(r =3D=3D -ENOSPC)) {
> > > > +            qemu_log_mask(LOG_GUEST_ERROR, "%s: No space on device=
 queue\n",
> > > > +                          __func__);
> > > > +        }
> > > > +        goto out;
> > > > +    }
> > > > +
> > > > +    /*
> > > > +     * We can poll here since we've had BQL from the time we sent =
the
> > > > +     * descriptor. Also, we need to take the answer before SVQ pul=
ls by itself,
> > > > +     * when BQL is released
> > > > +     */
> > > > +    dev_written =3D vhost_svq_poll(svq);
> > > > +    if (unlikely(dev_written < sizeof(status))) {
> > > > +        error_report("Insufficient written data (%zu)", dev_writte=
n);
> > > > +    }
> > > > +
> > > > +out:
> > > > +    in_len =3D iov_from_buf(elem->in_sg, elem->in_num, 0, &status,
> > > > +                          sizeof(status));
> > > > +    if (unlikely(in_len < sizeof(status))) {
> > > > +        error_report("Bad device CVQ written length");
> > > > +    }
> > > > +    vhost_svq_push_elem(svq, svq_elem, MIN(in_len, sizeof(status))=
);
> > > > +    g_free(svq_elem);
> > > > +    return r;
> > > > +}
> > > > +
> > > > +static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops =3D {
> > > > +    .avail_handler =3D vhost_vdpa_net_handle_ctrl_avail,
> > > > +};
> > >
> > > I wonder if it's possible to even remove this handler. Can we let the
> > > kick to be handled by virtio_net_handler_ctrl() in virtio-net.c?
> > >
> >
> > I kind of drafted that here:
> > https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg02652.html
> >
> > But I'm not sure about the part of not enabling the guest event
> > notifiers. I'd say we would need to move SVQ to the VirtIODevice
> > itself, which seems rather complicated at this moment.
> >
> > Without applying that patch, all of the events of vDPA devices go
> > either to device itself or to the SVQ registered handlers. If we go
> > that route, we add the vq event handler, and that would depend on the
> > svq state + specific vq.
>
> So what's in my mind is to let it work more like existing vhost
> backends. In that case the shadow virtqueue is only used as one way to
> communicate with the vhost-backend:
>
> 1) vhost-net using TAP ioctl
> 2) vhost-user using UNIX domain socket
> 3) vhost-vDPA is using shadow cvq
>

Yes, but how do you get SVQ event handlers called?

Data vqs are currently registering by themselves on
vhost_svq_set_svq_kick_fd / vhost_svq_new. With this proposal, data
vqs would keep that way but cvq will be registered by other means,
making SVQ hard to reason about.

With this proposal, the right thing to do is to move everything to
virtqueues handle_output callbacks. I like the proposal a lot: that
way we slim down SVQ by a lot, and SVQ will benefit for every
improvement we do to VirtQueues kick handling (coroutines, iothreads,
...). However to move everything comes with problems: SVQ code can be
called outside of the event loop.

Both that and not calling vhost_dev_enable_notifiers will be severely
untested at this point, not sure if other vhost devices do that but I
think not.

Thanks!


