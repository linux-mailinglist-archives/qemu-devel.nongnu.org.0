Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E4F30BBC9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 11:11:13 +0100 (CET)
Received: from localhost ([::1]:33420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6seO-0006hu-TB
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 05:11:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l6scv-0005xn-Pm
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 05:09:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l6scr-0002ov-ND
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 05:09:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612260575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ghSmagZUItcJlJ4VvL1LamSW3fSjn4XM/ZorUjKK2dk=;
 b=EvzaPusBtxg6IhOfJT2nCSr8Td/oDBdTqnhhKMWsRgpq/i9TbD8nyRNVL+C0vNsX1mUIIo
 GXaYSQq3SCCgaIRryfJJ8MfV+uVFnNZWjqbT9HaJoDhEqH5ITQyjGW9VsO9ms+zc/sTGLW
 z33QH+k7Y+a1CCkEuWCbU+qqqiVHJTQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-2sfjFi8xOZSTVpAYP02agQ-1; Tue, 02 Feb 2021 05:09:33 -0500
X-MC-Unique: 2sfjFi8xOZSTVpAYP02agQ-1
Received: by mail-qt1-f199.google.com with SMTP id l15so12728026qtp.21
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 02:09:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ghSmagZUItcJlJ4VvL1LamSW3fSjn4XM/ZorUjKK2dk=;
 b=LXLWkCI8WgSu3QmkAbHZQhNy92iGGx7V90mFtVTe9Re297yH9pEYrtkITgyZ2Uhj6C
 5NCeHmhn5mYVrCaedhBNzaiTWN78ihz7tfyRSlGcpRTCKbYICTBGw80qveJye6riCL7C
 9PMN/8ozLYRfBjoKJHOnV35EAJBHpRz0kFAuwADHy5LGjgI+zBM34B6Zuj4PxxQv9q8h
 yKOtlFc1RMFYyWh6D5P4tsTmXyURHn1YaeqwL81cEJK3JLVC94aeBLxRyOOiIKUXOMJJ
 jC8h9wABooz7RbxGAcxdE4Zs8RQHppHxeAskrEQ6cR4yXy68kA53I9PPSD+8xEIKOYZh
 r/cQ==
X-Gm-Message-State: AOAM531qWsQDtrL0Yuv7fFmLeCpzDT7pgbO2jvP9jwDlrbc1+mR/oCl1
 DETve8aL/n0aEfAMrUapK0KOpW6cY78fBjfqYcwygHIEZCBNeRjezNvI28YraWaO0fvnH/JxLVU
 RFj/u5A5ZGoP0F2QgVYfsW2msgam08hw=
X-Received: by 2002:a05:620a:12d5:: with SMTP id
 e21mr20004155qkl.131.1612260572363; 
 Tue, 02 Feb 2021 02:09:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrvB7XMW6VnqJpje4ugPbQIMZk0Gh2CeQvjqMwP6vrlrKb5e4dNaa70PkNNjJn6XDM33ZzGRKHRo0fZlNJn4o=
X-Received: by 2002:a05:620a:12d5:: with SMTP id
 e21mr20004121qkl.131.1612260571999; 
 Tue, 02 Feb 2021 02:09:31 -0800 (PST)
MIME-Version: 1.0
References: <20210129205415.876290-1-eperezma@redhat.com>
 <20210129205415.876290-10-eperezma@redhat.com>
 <acb11542-52e0-a271-fd22-dff09daa032e@redhat.com>
In-Reply-To: <acb11542-52e0-a271-fd22-dff09daa032e@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 2 Feb 2021 11:08:55 +0100
Message-ID: <CAJaqyWe_m3Ekmm5HjW_KZmi9CUL6JJ8Vd2pCtFgAJbfPXmiZCw@mail.gmail.com>
Subject: Re: [RFC 09/10] vhost: Route guest->host notification through shadow
 virtqueue
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 virtualization@lists.linux-foundation.org, Michael Lilja <ml@napatech.com>,
 Jim Harford <jim.harford@broadcom.com>, Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 1, 2021 at 7:29 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/1/30 =E4=B8=8A=E5=8D=884:54, Eugenio P=C3=A9rez wrote:
> > Shadow virtqueue notifications forwarding is disabled when vhost_dev
> > stops.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.h |   5 ++
> >   include/hw/virtio/vhost.h          |   4 +
> >   hw/virtio/vhost-shadow-virtqueue.c | 123 +++++++++++++++++++++++++-
> >   hw/virtio/vhost.c                  | 135 ++++++++++++++++++++++++++++=
-
> >   4 files changed, 264 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index 6cc18d6acb..466f8ae595 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -17,6 +17,11 @@
> >
> >   typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> >
> > +bool vhost_shadow_vq_start_rcu(struct vhost_dev *dev,
> > +                               VhostShadowVirtqueue *svq);
> > +void vhost_shadow_vq_stop_rcu(struct vhost_dev *dev,
> > +                              VhostShadowVirtqueue *svq);
> > +
> >   VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int =
idx);
> >
> >   void vhost_shadow_vq_free(VhostShadowVirtqueue *vq);
> > diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> > index 2be782cefd..732a4b2a2b 100644
> > --- a/include/hw/virtio/vhost.h
> > +++ b/include/hw/virtio/vhost.h
> > @@ -55,6 +55,8 @@ struct vhost_iommu {
> >       QLIST_ENTRY(vhost_iommu) iommu_next;
> >   };
> >
> > +typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> > +
> >   typedef struct VhostDevConfigOps {
> >       /* Vhost device config space changed callback
> >        */
> > @@ -83,7 +85,9 @@ struct vhost_dev {
> >       uint64_t backend_cap;
> >       bool started;
> >       bool log_enabled;
> > +    bool sw_lm_enabled;
> >       uint64_t log_size;
> > +    VhostShadowVirtqueue **shadow_vqs;
> >       Error *migration_blocker;
> >       const VhostOps *vhost_ops;
> >       void *opaque;
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index c0c967a7c5..908c36c66d 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -8,15 +8,129 @@
> >    */
> >
> >   #include "hw/virtio/vhost-shadow-virtqueue.h"
> > +#include "hw/virtio/vhost.h"
> > +#include "hw/virtio/virtio-access.h"
> > +
> > +#include "standard-headers/linux/vhost_types.h"
> > +#include "standard-headers/linux/virtio_ring.h"
> >
> >   #include "qemu/error-report.h"
> > -#include "qemu/event_notifier.h"
> > +#include "qemu/main-loop.h"
> >
> >   typedef struct VhostShadowVirtqueue {
> >       EventNotifier kick_notifier;
> >       EventNotifier call_notifier;
> > +    const struct vhost_virtqueue *hvq;
> > +    VirtIODevice *vdev;
> > +    VirtQueue *vq;
> >   } VhostShadowVirtqueue;
>
>
> So instead of doing things at virtio level, how about do the shadow
> stuffs at vhost level?
>
> It works like:
>
> virtio -> [shadow vhost backend] -> vhost backend
>
> Then the QMP is used to plug the shadow vhost backend in the middle or no=
t.
>
> It looks kind of easier since we don't need to deal with virtqueue
> handlers etc.. Instead, we just need to deal with eventfd stuffs:
>
> When shadow vhost mode is enabled, we just intercept the host_notifiers
> and guest_notifiers. When it was disabled, we just pass the host/guest
> notifiers to the real vhost backends?
>

Hi Jason.

Sure we can try that model, but it seems to me that it comes with a
different set of problems.

For example, there are code in vhost.c that checks if implementations
are available in vhost_ops, like:

if (dev->vhost_ops->vhost_vq_get_addr) {
        r =3D dev->vhost_ops->vhost_vq_get_addr(dev, &addr, vq);
        ...
}

I can count 14 of these, checking:

dev->vhost_ops->vhost_backend_can_merge
dev->vhost_ops->vhost_backend_mem_section_filter
dev->vhost_ops->vhost_force_iommu
dev->vhost_ops->vhost_requires_shm_log
dev->vhost_ops->vhost_set_backend_cap
dev->vhost_ops->vhost_set_vring_busyloop_timeout
dev->vhost_ops->vhost_vq_get_addr
hdev->vhost_ops->vhost_dev_start
hdev->vhost_ops->vhost_get_config
hdev->vhost_ops->vhost_get_inflight_fd
hdev->vhost_ops->vhost_net_set_backend
hdev->vhost_ops->vhost_set_config
hdev->vhost_ops->vhost_set_inflight_fd
hdev->vhost_ops->vhost_set_iotlb_callback

So we should Implement all of the vhost_ops callbacks, forwarding them
to actual vhost_backed, and delete conditionally these ones? In other
words, dynamically generate the new shadow vq vhost_ops? If a new
callback is added to any vhost backend in the future, do we have to
force the adding / checking for NULL in shadow backend vhost_ops?
Would this be a good moment to check if all backends implement these
and delete the checks?

There are also checks like:

if (dev->vhost_ops->backend_type =3D=3D VHOST_BACKEND_TYPE_USER)

How would shadow_vq backend expose itself? (I guess as the actual used back=
end).

I can modify this patchset to not relay the guest->host notifications
on vq handlers but on eventfd handlers. Although this will make it
independent of the actual virtio device kind used, I can see two
drawbacks:
* The actual fact that it makes it independent of virtio device kind.
If a device does not use the notifiers and poll the ring by itself, it
has no chance of knowing that it should stop. What happens if
virtio-net tx timer is armed when we start shadow vq?.
* The fixes (current and future) in vq notifications, like the one
currently implemented in virtio_notify_irqfd for windows drivers
regarding ISR bit 0. I think this one in particular is OK not to
carry, but I think many changes affecting any of the functions will
have to be mirrored in the other.

Thoughts on this?

Thanks!

> Thanks
>
>
> >
> > +static uint16_t vhost_shadow_vring_used_flags(VhostShadowVirtqueue *sv=
q)
> > +{
> > +    const struct vring_used *used =3D svq->hvq->used;
> > +    return virtio_tswap16(svq->vdev, used->flags);
> > +}
> > +
> > +static bool vhost_shadow_vring_should_kick(VhostShadowVirtqueue *vq)
> > +{
> > +    return !(vhost_shadow_vring_used_flags(vq) & VRING_USED_F_NO_NOTIF=
Y);
> > +}
> > +
> > +static void vhost_shadow_vring_kick(VhostShadowVirtqueue *vq)
> > +{
> > +    if (vhost_shadow_vring_should_kick(vq)) {
> > +        event_notifier_set(&vq->kick_notifier);
> > +    }
> > +}
> > +
> > +static void handle_shadow_vq(VirtIODevice *vdev, VirtQueue *vq)
> > +{
> > +    struct vhost_dev *hdev =3D vhost_dev_from_virtio(vdev);
> > +    uint16_t idx =3D virtio_get_queue_index(vq);
> > +
> > +    VhostShadowVirtqueue *svq =3D hdev->shadow_vqs[idx];
> > +
> > +    vhost_shadow_vring_kick(svq);
> > +}
> > +
> > +/*
> > + * Start shadow virtqueue operation.
> > + * @dev vhost device
> > + * @svq Shadow Virtqueue
> > + *
> > + * Run in RCU context
> > + */
> > +bool vhost_shadow_vq_start_rcu(struct vhost_dev *dev,
> > +                               VhostShadowVirtqueue *svq)
> > +{
> > +    const VirtioDeviceClass *k =3D VIRTIO_DEVICE_GET_CLASS(dev->vdev);
> > +    EventNotifier *vq_host_notifier =3D virtio_queue_get_host_notifier=
(svq->vq);
> > +    unsigned idx =3D virtio_queue_get_idx(svq->vdev, svq->vq);
> > +    struct vhost_vring_file kick_file =3D {
> > +        .index =3D idx,
> > +        .fd =3D event_notifier_get_fd(&svq->kick_notifier),
> > +    };
> > +    int r;
> > +    bool ok;
> > +
> > +    /* Check that notifications are still going directly to vhost dev =
*/
> > +    assert(virtio_queue_host_notifier_status(svq->vq));
> > +
> > +    ok =3D k->set_vq_handler(dev->vdev, idx, handle_shadow_vq);
> > +    if (!ok) {
> > +        error_report("Couldn't set the vq handler");
> > +        goto err_set_kick_handler;
> > +    }
> > +
> > +    r =3D dev->vhost_ops->vhost_set_vring_kick(dev, &kick_file);
> > +    if (r !=3D 0) {
> > +        error_report("Couldn't set kick fd: %s", strerror(errno));
> > +        goto err_set_vring_kick;
> > +    }
> > +
> > +    event_notifier_set_handler(vq_host_notifier,
> > +                               virtio_queue_host_notifier_read);
> > +    virtio_queue_set_host_notifier_enabled(svq->vq, false);
> > +    virtio_queue_host_notifier_read(vq_host_notifier);
> > +
> > +    return true;
> > +
> > +err_set_vring_kick:
> > +    k->set_vq_handler(dev->vdev, idx, NULL);
> > +
> > +err_set_kick_handler:
> > +    return false;
> > +}
> > +
> > +/*
> > + * Stop shadow virtqueue operation.
> > + * @dev vhost device
> > + * @svq Shadow Virtqueue
> > + *
> > + * Run in RCU context
> > + */
> > +void vhost_shadow_vq_stop_rcu(struct vhost_dev *dev,
> > +                              VhostShadowVirtqueue *svq)
> > +{
> > +    const VirtioDeviceClass *k =3D VIRTIO_DEVICE_GET_CLASS(svq->vdev);
> > +    unsigned idx =3D virtio_queue_get_idx(svq->vdev, svq->vq);
> > +    EventNotifier *vq_host_notifier =3D virtio_queue_get_host_notifier=
(svq->vq);
> > +    struct vhost_vring_file kick_file =3D {
> > +        .index =3D idx,
> > +        .fd =3D event_notifier_get_fd(vq_host_notifier),
> > +    };
> > +    int r;
> > +
> > +    /* Restore vhost kick */
> > +    r =3D dev->vhost_ops->vhost_set_vring_kick(dev, &kick_file);
> > +    /* Cannot do a lot of things */
> > +    assert(r =3D=3D 0);
> > +
> > +    event_notifier_set_handler(vq_host_notifier, NULL);
> > +    virtio_queue_set_host_notifier_enabled(svq->vq, true);
> > +    k->set_vq_handler(svq->vdev, idx, NULL);
> > +}
> > +
> >   /*
> >    * Creates vhost shadow virtqueue, and instruct vhost device to use t=
he shadow
> >    * methods and file descriptors.
> > @@ -24,8 +138,13 @@ typedef struct VhostShadowVirtqueue {
> >   VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int =
idx)
> >   {
> >       g_autofree VhostShadowVirtqueue *svq =3D g_new0(VhostShadowVirtqu=
eue, 1);
> > +    int vq_idx =3D dev->vhost_ops->vhost_get_vq_index(dev, dev->vq_ind=
ex + idx);
> >       int r;
> >
> > +    svq->vq =3D virtio_get_queue(dev->vdev, vq_idx);
> > +    svq->hvq =3D &dev->vqs[idx];
> > +    svq->vdev =3D dev->vdev;
> > +
> >       r =3D event_notifier_init(&svq->kick_notifier, 0);
> >       if (r !=3D 0) {
> >           error_report("Couldn't create kick event notifier: %s",
> > @@ -40,7 +159,7 @@ VhostShadowVirtqueue *vhost_shadow_vq_new(struct vho=
st_dev *dev, int idx)
> >           goto err_init_call_notifier;
> >       }
> >
> > -    return svq;
> > +    return g_steal_pointer(&svq);
> >
> >   err_init_call_notifier:
> >       event_notifier_cleanup(&svq->kick_notifier);
> > diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> > index 42836e45f3..bde688f278 100644
> > --- a/hw/virtio/vhost.c
> > +++ b/hw/virtio/vhost.c
> > @@ -25,6 +25,7 @@
> >   #include "exec/address-spaces.h"
> >   #include "hw/virtio/virtio-bus.h"
> >   #include "hw/virtio/virtio-access.h"
> > +#include "hw/virtio/vhost-shadow-virtqueue.h"
> >   #include "migration/blocker.h"
> >   #include "migration/qemu-file-types.h"
> >   #include "sysemu/dma.h"
> > @@ -945,6 +946,82 @@ static void vhost_log_global_stop(MemoryListener *=
listener)
> >       }
> >   }
> >
> > +static int vhost_sw_live_migration_stop(struct vhost_dev *dev)
> > +{
> > +    int idx;
> > +
> > +    WITH_RCU_READ_LOCK_GUARD() {
> > +        dev->sw_lm_enabled =3D false;
> > +
> > +        for (idx =3D 0; idx < dev->nvqs; ++idx) {
> > +            vhost_shadow_vq_stop_rcu(dev, dev->shadow_vqs[idx]);
> > +        }
> > +    }
> > +
> > +    for (idx =3D 0; idx < dev->nvqs; ++idx) {
> > +        vhost_shadow_vq_free(dev->shadow_vqs[idx]);
> > +    }
> > +
> > +    g_free(dev->shadow_vqs);
> > +    dev->shadow_vqs =3D NULL;
> > +    return 0;
> > +}
> > +
> > +static int vhost_sw_live_migration_start(struct vhost_dev *dev)
> > +{
> > +    int idx;
> > +
> > +    dev->shadow_vqs =3D g_new0(VhostShadowVirtqueue *, dev->nvqs);
> > +    for (idx =3D 0; idx < dev->nvqs; ++idx) {
> > +        dev->shadow_vqs[idx] =3D vhost_shadow_vq_new(dev, idx);
> > +        if (unlikely(dev->shadow_vqs[idx] =3D=3D NULL)) {
> > +            goto err;
> > +        }
> > +    }
> > +
> > +    WITH_RCU_READ_LOCK_GUARD() {
> > +        for (idx =3D 0; idx < dev->nvqs; ++idx) {
> > +            int stop_idx =3D idx;
> > +            bool ok =3D vhost_shadow_vq_start_rcu(dev,
> > +                                                dev->shadow_vqs[idx]);
> > +
> > +            if (!ok) {
> > +                while (--stop_idx >=3D 0) {
> > +                    vhost_shadow_vq_stop_rcu(dev, dev->shadow_vqs[stop=
_idx]);
> > +                }
> > +
> > +                goto err;
> > +            }
> > +        }
> > +    }
> > +
> > +    dev->sw_lm_enabled =3D true;
> > +    return 0;
> > +
> > +err:
> > +    for (; idx >=3D 0; --idx) {
> > +        vhost_shadow_vq_free(dev->shadow_vqs[idx]);
> > +    }
> > +    g_free(dev->shadow_vqs[idx]);
> > +
> > +    return -1;
> > +}
> > +
> > +static int vhost_sw_live_migration_enable(struct vhost_dev *dev,
> > +                                          bool enable_lm)
> > +{
> > +    int r;
> > +
> > +    if (enable_lm =3D=3D dev->sw_lm_enabled) {
> > +        return 0;
> > +    }
> > +
> > +    r =3D enable_lm ? vhost_sw_live_migration_start(dev)
> > +                  : vhost_sw_live_migration_stop(dev);
> > +
> > +    return r;
> > +}
> > +
> >   static void vhost_log_start(MemoryListener *listener,
> >                               MemoryRegionSection *section,
> >                               int old, int new)
> > @@ -1389,6 +1466,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *=
opaque,
> >       hdev->log =3D NULL;
> >       hdev->log_size =3D 0;
> >       hdev->log_enabled =3D false;
> > +    hdev->sw_lm_enabled =3D false;
> >       hdev->started =3D false;
> >       memory_listener_register(&hdev->memory_listener, &address_space_m=
emory);
> >       QLIST_INSERT_HEAD(&vhost_devices, hdev, entry);
> > @@ -1816,6 +1894,11 @@ void vhost_dev_stop(struct vhost_dev *hdev, Virt=
IODevice *vdev)
> >           hdev->vhost_ops->vhost_dev_start(hdev, false);
> >       }
> >       for (i =3D 0; i < hdev->nvqs; ++i) {
> > +        if (hdev->sw_lm_enabled) {
> > +            vhost_shadow_vq_stop_rcu(hdev, hdev->shadow_vqs[i]);
> > +            vhost_shadow_vq_free(hdev->shadow_vqs[i]);
> > +        }
> > +
> >           vhost_virtqueue_stop(hdev,
> >                                vdev,
> >                                hdev->vqs + i,
> > @@ -1829,6 +1912,8 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtI=
ODevice *vdev)
> >           memory_listener_unregister(&hdev->iommu_listener);
> >       }
> >       vhost_log_put(hdev, true);
> > +    g_free(hdev->shadow_vqs);
> > +    hdev->sw_lm_enabled =3D false;
> >       hdev->started =3D false;
> >       hdev->vdev =3D NULL;
> >   }
> > @@ -1845,5 +1930,53 @@ int vhost_net_set_backend(struct vhost_dev *hdev=
,
> >
> >   void qmp_x_vhost_enable_shadow_vq(const char *name, bool enable, Erro=
r **errp)
> >   {
> > -    error_setg(errp, "Shadow virtqueue still not implemented.");
> > +    struct vhost_dev *hdev;
> > +    const char *err_cause =3D NULL;
> > +    const VirtioDeviceClass *k;
> > +    int r;
> > +    ErrorClass err_class =3D ERROR_CLASS_GENERIC_ERROR;
> > +
> > +    QLIST_FOREACH(hdev, &vhost_devices, entry) {
> > +        if (hdev->vdev && 0 =3D=3D strcmp(hdev->vdev->name, name)) {
> > +            break;
> > +        }
> > +    }
> > +
> > +    if (!hdev) {
> > +        err_class =3D ERROR_CLASS_DEVICE_NOT_FOUND;
> > +        err_cause =3D "Device not found";
> > +        goto err;
> > +    }
> > +
> > +    if (!hdev->started) {
> > +        err_cause =3D "Device is not started";
> > +        goto err;
> > +    }
> > +
> > +    if (hdev->acked_features & BIT_ULL(VIRTIO_F_RING_PACKED)) {
> > +        err_cause =3D "Use packed vq";
> > +        goto err;
> > +    }
> > +
> > +    if (vhost_dev_has_iommu(hdev)) {
> > +        err_cause =3D "Device use IOMMU";
> > +        goto err;
> > +    }
> > +
> > +    k =3D VIRTIO_DEVICE_GET_CLASS(hdev->vdev);
> > +    if (!k->set_vq_handler) {
> > +        err_cause =3D "Virtio device type does not support reset of vq=
 handler";
> > +        goto err;
> > +    }
> > +
> > +    r =3D vhost_sw_live_migration_enable(hdev, enable);
> > +    if (unlikely(r)) {
> > +        err_cause =3D "Error enabling (see monitor)";
> > +    }
> > +
> > +err:
> > +    if (err_cause) {
> > +        error_set(errp, err_class,
> > +                  "Can't enable shadow vq on %s: %s", name, err_cause)=
;
> > +    }
> >   }
>


