Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1567F39ED00
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 05:21:53 +0200 (CEST)
Received: from localhost ([::1]:47428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqSJM-0000MI-5m
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 23:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lqSIX-00087u-6q
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 23:21:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lqSIU-0002PY-FG
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 23:21:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623122457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6GT2MRqt84llASkmKIZ8SNlEIeuoW2IqOq8lRjrTJLM=;
 b=i7c+/iBADViei4tFWU/zVy88lpWWLi9oA27Hncsw3Y4IiCniEjnUSUvyK10I9s3TKzxwPL
 7Qq1tU/cUOQvcucry+goLEsIfIhLdNi3FRqDnuNGaY4xebKB0hNTbAvGn2i3BAg5k5/mpa
 NDJrDpbn7bLG399NKZEJ6ak+Yu0U3M4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-bupfU8zAMa20Pgip3f5tMQ-1; Mon, 07 Jun 2021 23:20:56 -0400
X-MC-Unique: bupfU8zAMa20Pgip3f5tMQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 b8-20020a170906d108b02903fa10388224so6152284ejz.18
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 20:20:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6GT2MRqt84llASkmKIZ8SNlEIeuoW2IqOq8lRjrTJLM=;
 b=DP9TjmAx6Dsga2yTcfUfucmnZV6ZMYaXgFs/6k2hBXyHo0Ep/JCJYPFAubmWhtfGiS
 dPdTj3ctvBgUGRabhMUZnpIzzpqtIYI+HdC81HRo7lqgAPvnqbHuXPa3b8aek0FBB6/F
 I+zLyogVjRAZPZtoUUgbKxLd5ToGyrJ2FY1dPIDVeTushWkPlX/VjBSX9KCT8lrjsaaS
 7Oa0njq8N3FN1PqLc9iUCQE6sa4frtdv5/3gTeDLfIhANE4qrTEQlp8lBiSO0ShwTF6E
 cJTwb7lEgU6WH9ZF1inenDE8x1CbDkEKQPuZW45EH1HsXRRrFXDTgX+tViXh4nPrdliY
 BV4w==
X-Gm-Message-State: AOAM532lJVq8XzNvLjJlzCODY8A5e2cULzcAjWyKeUG/hH9RWwiWWIPd
 yGdx/B+TGeQlKtR7mXHG4VgRnhYpFc/KfJqT0loiv8uhlrZ4xdrNkqLnoLnBRdlcM1RnvRkQmr9
 A/HHKtkuvBmd1zsdwPMSL0xseR5l7egg=
X-Received: by 2002:aa7:c41a:: with SMTP id j26mr23206861edq.133.1623122455104; 
 Mon, 07 Jun 2021 20:20:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsWcKmb7OQ496+3MbpbMV58fcVHoqvTvOaJNReaO/xQzDduBv95Ed/LZTtXMKWPxG+2BFm5ZuCRMkhFJvrm88=
X-Received: by 2002:aa7:c41a:: with SMTP id j26mr23206848edq.133.1623122454797; 
 Mon, 07 Jun 2021 20:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210602034750.23377-1-lulu@redhat.com>
 <20210602034750.23377-7-lulu@redhat.com>
 <253ae5a7-529b-eb78-6d7a-0c3d75e01d1f@redhat.com>
In-Reply-To: <253ae5a7-529b-eb78-6d7a-0c3d75e01d1f@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Tue, 8 Jun 2021 11:20:18 +0800
Message-ID: <CACLfguWs_01BwWA9pNgJ23fH1=DJRsf63v=xnPxyb_Nq9NPyMw@mail.gmail.com>
Subject: Re: [PATCH v7 06/10] vhost:add support for configure interrupt
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 3, 2021 at 2:28 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/6/2 =E4=B8=8A=E5=8D=8811:47, Cindy Lu =E5=86=99=E9=81=93:
> > Add configure notifier support in vhost and virtio driver
> > When backend support VIRTIO_NET_F_STATUS,
>
>
> So config interrupt is the basic facility of the virtio device. We need
> to make the code not specific to this feature.
>
> But we can leave the specific device (like virtio-net, or vhost-net) to
> decide whether or not it can be used.
>
> For net, it is also used by guest announcement.
>
sure, I will rewrite this part
>
> > setup the configure
> > interrupt function in vhost_dev_start and release the related
> > resource when vhost_dev_stop
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >   hw/net/vhost_net.c         |  9 +++++
> >   hw/net/virtio-net.c        |  6 ++++
> >   hw/virtio/vhost.c          | 68 ++++++++++++++++++++++++++++++++++++-=
-
> >   hw/virtio/virtio.c         | 23 +++++++++++--
> >   include/hw/virtio/vhost.h  |  2 ++
> >   include/hw/virtio/virtio.h |  3 ++
> >   include/net/vhost_net.h    |  3 ++
> >   7 files changed, 109 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > index 24d555e764..5d0c35f18d 100644
> > --- a/hw/net/vhost_net.c
> > +++ b/hw/net/vhost_net.c
> > @@ -426,6 +426,15 @@ void vhost_net_virtqueue_mask(VHostNetState *net, =
VirtIODevice *dev,
> >       vhost_virtqueue_mask(&net->dev, dev, idx, mask);
> >   }
> >
> > +bool vhost_net_config_pending(VHostNetState *net, int idx)
> > +{
> > +    return vhost_config_pending(&net->dev, idx);
> > +}
> > +void vhost_net_config_mask(VHostNetState *net, VirtIODevice *dev,
> > +                              bool mask)
> > +{
> > +    vhost_config_mask(&net->dev, dev, mask);
> > +}
> >   VHostNetState *get_vhost_net(NetClientState *nc)
> >   {
> >       VHostNetState *vhost_net =3D 0;
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index f50235b5d6..02033be748 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -3055,6 +3055,9 @@ static bool virtio_net_guest_notifier_pending(Vir=
tIODevice *vdev, int idx)
> >       if (idx !=3D VIRTIO_CONFIG_IRQ_IDX) {
> >           return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), i=
dx);
> >       }
> > +    if (idx =3D=3D VIRTIO_CONFIG_IRQ_IDX) {
> > +        return vhost_net_config_pending(get_vhost_net(nc->peer), idx);
> > +   }
> >       return false;
> >   }
> >
> > @@ -3067,6 +3070,9 @@ static void virtio_net_guest_notifier_mask(VirtIO=
Device *vdev, int idx,
> >       if (idx !=3D VIRTIO_CONFIG_IRQ_IDX) {
> >           vhost_net_virtqueue_mask(get_vhost_net(nc->peer), vdev, idx, =
mask);
> >       }
> > +    if (idx =3D=3D VIRTIO_CONFIG_IRQ_IDX) {
> > +        vhost_net_config_mask(get_vhost_net(nc->peer), vdev, mask);
> > +     }
> >   }
> >
> >   static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_fe=
atures)
> > diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> > index e2163a0d63..3b05f09d98 100644
> > --- a/hw/virtio/vhost.c
> > +++ b/hw/virtio/vhost.c
> > @@ -21,6 +21,7 @@
> >   #include "qemu/error-report.h"
> >   #include "qemu/memfd.h"
> >   #include "standard-headers/linux/vhost_types.h"
> > +#include "standard-headers/linux/virtio_net.h"
>
>
> Inclusion of device specific header in the general vhost code looks like
> a layer violation.
>
>
> >   #include "exec/address-spaces.h"
> >   #include "hw/virtio/virtio-bus.h"
> >   #include "hw/virtio/virtio-access.h"
> > @@ -1505,6 +1506,16 @@ bool vhost_virtqueue_pending(struct vhost_dev *h=
dev, int n)
> >       return event_notifier_test_and_clear(&vq->masked_notifier);
> >   }
> >
> > +bool vhost_config_pending(struct vhost_dev *hdev, int n)
> > +{
> > +    assert(hdev->vhost_ops);
>
>
> I think we can remove this.
>
>
> > +    VirtIODevice *vdev =3D hdev->vdev;
> > +    if ((hdev->started =3D=3D false) ||
>
>
> We don't check this in vhost_virtqueue_pending(), any reason to do this?
>
>
> > +        (hdev->vhost_ops->vhost_set_config_call =3D=3D NULL)) {
>
>
> I think we need first check what happens if we try to down the link for
> vhost-vdpa network backend in the monitor. (Or should we block that from
> the monitor?)
>
> Then we can decided whether or not we need this.
>
>
I will remove this part
> > +        return false;
> > +    }
> > +    return event_notifier_test_and_clear(&vdev->masked_config_notifier=
);
> > +}
> >   /* Mask/unmask events from this vq. */
> >   void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev,=
 int n,
> >                            bool mask)
> > @@ -1529,6 +1540,30 @@ void vhost_virtqueue_mask(struct vhost_dev *hdev=
, VirtIODevice *vdev, int n,
> >           VHOST_OPS_DEBUG("vhost_set_vring_call failed");
> >       }
> >   }
> > +void vhost_config_mask(struct vhost_dev *hdev, VirtIODevice *vdev,
> > +                         bool mask)
> > +{
> > +   int fd;
> > +   int r;
> > +   EventNotifier *masked_config_notifier =3D &vdev->masked_config_noti=
fier;
> > +   EventNotifier *config_notifier =3D &vdev->config_notifier;
> > +   assert(hdev->vhost_ops);
> > +
> > +   if ((hdev->started =3D=3D false) ||
> > +        (hdev->vhost_ops->vhost_set_config_call =3D=3D NULL)) {
> > +        return ;
> > +    }
> > +    if (mask) {
> > +        assert(vdev->use_guest_notifier_mask);
> > +        fd =3D event_notifier_get_fd(masked_config_notifier);
> > +    } else {
> > +        fd =3D event_notifier_get_fd(config_notifier);
> > +    }
> > +   r =3D hdev->vhost_ops->vhost_set_config_call(hdev, &fd);
> > +   if (r < 0) {
> > +        error_report("vhost_set_config_call failed");
>
>
> VHOST_OPS_DEBUG() please.
>
will fix this
>
> > +    }
> > +}
> >
> >   uint64_t vhost_get_features(struct vhost_dev *hdev, const int *featur=
e_bits,
> >                               uint64_t features)
> > @@ -1708,6 +1743,7 @@ int vhost_dev_get_inflight(struct vhost_dev *dev,=
 uint16_t queue_size,
> >   int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
> >   {
> >       int i, r;
> > +    int fd =3D 0;
> >
> >       /* should only be called after backend is connected */
> >       assert(hdev->vhost_ops);
> > @@ -1739,7 +1775,14 @@ int vhost_dev_start(struct vhost_dev *hdev, Virt=
IODevice *vdev)
> >               goto fail_vq;
> >           }
> >       }
> > -
> > +    r =3D event_notifier_init(&vdev->masked_config_notifier, 0);
> > +    if (r < 0) {
> > +        return r;
> > +    }
> > +    event_notifier_test_and_clear(&vdev->masked_config_notifier);
> > +    if (!vdev->use_guest_notifier_mask) {
> > +        vhost_config_mask(hdev, vdev, true);
> > +    }
>
>
> Let's leave a new line for separating the logical blocks.
>
>
will fix this
> >       if (hdev->log_enabled) {
> >           uint64_t log_base;
> >
> > @@ -1773,6 +1816,19 @@ int vhost_dev_start(struct vhost_dev *hdev, Virt=
IODevice *vdev)
> >               vhost_device_iotlb_miss(hdev, vq->used_phys, true);
> >           }
> >       }
> > +   if (!(hdev->features & (0x1ULL << VIRTIO_NET_F_STATUS))) {
> > +        return 0;
> > +    }
>
>
> Let's move this to vhost-net instead of doing it in the general vhost cod=
e.
>
> Or we can even remove this, otherwise it will introduce some burden if
> we need to implement other features that depends on the config interrupt
> for vhost-net/vDPA.
>
>
will fix this
> > +    if (hdev->vhost_ops->vhost_set_config_call) {
> > +        fd =3D event_notifier_get_fd(&vdev->config_notifier);
> > +        r =3D hdev->vhost_ops->vhost_set_config_call(hdev, &fd);
> > +        if (!r) {
> > +            event_notifier_set(&vdev->config_notifier);
>
>
> Any reason you need to trigger the config interrupt here?
>
>
> > +        }
> > +        if (r) {
> > +            goto fail_log;
> > +        }
> > +    }
> >       return 0;
> >   fail_log:
> >       vhost_log_put(hdev, false);
> > @@ -1795,10 +1851,18 @@ fail_features:
> >   void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
> >   {
> >       int i;
> > +    int fd;
> >
> >       /* should only be called after backend is connected */
> >       assert(hdev->vhost_ops);
> > -
> > +    event_notifier_test_and_clear(&vdev->masked_config_notifier);
> > +    event_notifier_test_and_clear(&vdev->config_notifier);
>
>
> If we do this in the start, there's no need for such cleanup here.
>
>
> > +    if ((hdev->features & (0x1ULL << VIRTIO_NET_F_STATUS))) {
>
>
> Let's move this to vhost-net or I'd rather remove this.
>
> Thanks
>
>
will fix this
> > +        if (hdev->vhost_ops->vhost_set_config_call) {
> > +            fd =3D -1;
> > +            hdev->vhost_ops->vhost_set_config_call(hdev, &fd);
> > +        }
> > +    }
> >       if (hdev->vhost_ops->vhost_dev_start) {
> >           hdev->vhost_ops->vhost_dev_start(hdev, false);
> >       }
> > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > index c5d786bb5e..09ed3f67d9 100644
> > --- a/hw/virtio/virtio.c
> > +++ b/hw/virtio/virtio.c
> > @@ -3506,14 +3506,27 @@ static void virtio_queue_guest_notifier_read(Ev=
entNotifier *n)
> >   }
> >
> >
> > +static void virtio_config_read(EventNotifier *n)
> > +{
> > +    VirtIODevice *vdev =3D container_of(n, VirtIODevice, config_notifi=
er);
> > +
> > +    if (event_notifier_test_and_clear(n)) {
> > +        virtio_notify_config(vdev);
> > +    }
> > +}
> >   void virtio_set_notifier_fd_handler(VirtIODevice *vdev, int queue_no,
> >                                  bool assign, bool with_irqfd)
> >   {
> >       EventNotifier *e ;
> >       EventNotifierHandler *handler;
> > -    VirtQueue *vq =3D virtio_get_queue(vdev, queue_no);
> > -    e =3D &vq->guest_notifier;
> > -    handler =3D virtio_queue_guest_notifier_read;
> > +    if (queue_no !=3D VIRTIO_CONFIG_IRQ_IDX) {
> > +        VirtQueue *vq =3D virtio_get_queue(vdev, queue_no);
> > +        e =3D &vq->guest_notifier;
> > +        handler =3D virtio_queue_guest_notifier_read;
> > +    } else {
> > +        e =3D &vdev->config_notifier;
> > +        handler =3D virtio_config_read;
> > +    }
> >       if (assign && !with_irqfd) {
> >           event_notifier_set_handler(e, handler);
> >       } else {
> > @@ -3599,6 +3612,10 @@ EventNotifier *virtio_queue_get_host_notifier(Vi=
rtQueue *vq)
> >       return &vq->host_notifier;
> >   }
> >
> > +EventNotifier *virtio_get_config_notifier(VirtIODevice *vdev)
> > +{
> > +    return &vdev->config_notifier;
> > +}
> >   void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabl=
ed)
> >   {
> >       vq->host_notifier_enabled =3D enabled;
> > diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> > index 4a8bc75415..b8814ece32 100644
> > --- a/include/hw/virtio/vhost.h
> > +++ b/include/hw/virtio/vhost.h
> > @@ -108,6 +108,8 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIOD=
evice *vdev);
> >   void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
> >   int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *=
vdev);
> >   void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice=
 *vdev);
> > +bool vhost_config_pending(struct vhost_dev *hdev, int n);
> > +void vhost_config_mask(struct vhost_dev *hdev, VirtIODevice *vdev, boo=
l mask);
> >
> >   /* Test and clear masked event pending status.
> >    * Should be called after unmask to avoid losing events.
> > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > index 447899dea5..5856517d43 100644
> > --- a/include/hw/virtio/virtio.h
> > +++ b/include/hw/virtio/virtio.h
> > @@ -110,6 +110,8 @@ struct VirtIODevice
> >       bool use_guest_notifier_mask;
> >       AddressSpace *dma_as;
> >       QLIST_HEAD(, VirtQueue) *vector_queues;
> > +    EventNotifier config_notifier;
> > +    EventNotifier masked_config_notifier;
> >   };
> >
> >   struct VirtioDeviceClass {
> > @@ -317,6 +319,7 @@ int virtio_device_grab_ioeventfd(VirtIODevice *vdev=
);
> >   void virtio_device_release_ioeventfd(VirtIODevice *vdev);
> >   bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev);
> >   EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq);
> > +EventNotifier *virtio_get_config_notifier(VirtIODevice *vdev);
> >   void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabl=
ed);
> >   void virtio_queue_host_notifier_read(EventNotifier *n);
> >   void virtio_queue_aio_set_host_notifier_handler(VirtQueue *vq, AioCon=
text *ctx,
> > diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
> > index 172b0051d8..0d38c97c94 100644
> > --- a/include/net/vhost_net.h
> > +++ b/include/net/vhost_net.h
> > @@ -36,6 +36,9 @@ int vhost_net_set_config(struct vhost_net *net, const=
 uint8_t *data,
> >   bool vhost_net_virtqueue_pending(VHostNetState *net, int n);
> >   void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
> >                                 int idx, bool mask);
> > +bool vhost_net_config_pending(VHostNetState *net, int n);
> > +void vhost_net_config_mask(VHostNetState *net, VirtIODevice *dev,
> > +                              bool mask);
> >   int vhost_net_notify_migration_done(VHostNetState *net, char* mac_add=
r);
> >   VHostNetState *get_vhost_net(NetClientState *nc);
> >
>


