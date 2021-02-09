Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC9531525A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 16:07:13 +0100 (CET)
Received: from localhost ([::1]:37412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Ubg-00027c-1w
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 10:07:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l9UXU-0008K4-8b
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:02:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l9UXN-0001eU-PH
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:02:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612882964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uXRES7hC2TR3ekZYe+5cBy0cWpAllCUeRBylIHhgizU=;
 b=NMgJ/w4ov+f7JKrDL0sddO/FV8jqDlIv19kcNfuyZ0i3kCnyPrsErSaPAAtmHBJ0WdzmTC
 aUYytXg2BAb+RAgwuhoCjg+ZMahC2NWPVRfIotYz4vXvGHkWyKARAFQdBhpSbVxElAL6Zn
 mjTNyiVvT5QeSaB8cvFRlknz2ABeH78=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-9wDLYQ-xMlGAOFTqKIEkDA-1; Tue, 09 Feb 2021 10:02:43 -0500
X-MC-Unique: 9wDLYQ-xMlGAOFTqKIEkDA-1
Received: by mail-lf1-f71.google.com with SMTP id v25so10993243lfp.18
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 07:02:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uXRES7hC2TR3ekZYe+5cBy0cWpAllCUeRBylIHhgizU=;
 b=TCdg3EoccGTHIEhahV+Mhi0Tk/xLCttgefUhry7smNikQ4wkvfppUCaKonLHGS4UgD
 Et+pHsSkWhvdu0fEYgr0eaxBWDkRJjc63ag8296diRRLZKBWJtaTVXAGPl4Jn2hIdObQ
 6844YMsOBeiJjuirWeKjmlFfSIxDCpyjHMoRHKQaMUDSd/ts7pR5CrHt9tgNIlPjTzME
 Udc3XGQ9vDLGHZKr1rBaZmt2Mwr/z8h6TRPlOKHL9bjhRsnsYWyoY4rdAmj+Gj0dcqWV
 Bnugv/sJZGFTU1ClS9cOZi4Ba4bjZi+EK2FIeTvRybYACma/CUd4OSHaHEVMzjx+xhAX
 VSdw==
X-Gm-Message-State: AOAM530oP5iupoq38cawS5/2xYcmRmvA9U/hpJgKKse8daglRblfnHiJ
 4ZKnHexl/DapTMrNrKTHZS3Ggj34Syt9nN09MFuvZ9ZSXVGp63hqVs9/MiAQ6ooK3885jLq+aOX
 WuqH8/2lNU46vunhli/afKkwNz8TFaeQ=
X-Received: by 2002:a19:224d:: with SMTP id i74mr1202102lfi.395.1612882961036; 
 Tue, 09 Feb 2021 07:02:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpeErH0hLZ5Ln9lZzP8W7HbtflWpg9nDPQVJQZpqbKyCwDeZG4zpo/RGClkvgdM87Pn7bunNaVQpawTkygQeI=
X-Received: by 2002:a19:224d:: with SMTP id i74mr1202062lfi.395.1612882960379; 
 Tue, 09 Feb 2021 07:02:40 -0800 (PST)
MIME-Version: 1.0
References: <20210129205415.876290-1-eperezma@redhat.com>
 <20210129205415.876290-10-eperezma@redhat.com>
 <acb11542-52e0-a271-fd22-dff09daa032e@redhat.com>
 <CAJaqyWe_m3Ekmm5HjW_KZmi9CUL6JJ8Vd2pCtFgAJbfPXmiZCw@mail.gmail.com>
 <2e02fb06-985c-8d93-f4ce-24d108285ba6@redhat.com>
In-Reply-To: <2e02fb06-985c-8d93-f4ce-24d108285ba6@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 9 Feb 2021 16:02:02 +0100
Message-ID: <CAJaqyWc39+tqEwm6OMxEMa1XhRQxncWO31nUFXPFYMPJzh7cgQ@mail.gmail.com>
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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

On Thu, Feb 4, 2021 at 4:27 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/2/2 =E4=B8=8B=E5=8D=886:08, Eugenio Perez Martin wrote:
> > On Mon, Feb 1, 2021 at 7:29 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> On 2021/1/30 =E4=B8=8A=E5=8D=884:54, Eugenio P=C3=A9rez wrote:
> >>> Shadow virtqueue notifications forwarding is disabled when vhost_dev
> >>> stops.
> >>>
> >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>> ---
> >>>    hw/virtio/vhost-shadow-virtqueue.h |   5 ++
> >>>    include/hw/virtio/vhost.h          |   4 +
> >>>    hw/virtio/vhost-shadow-virtqueue.c | 123 +++++++++++++++++++++++++=
-
> >>>    hw/virtio/vhost.c                  | 135 +++++++++++++++++++++++++=
+++-
> >>>    4 files changed, 264 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-sha=
dow-virtqueue.h
> >>> index 6cc18d6acb..466f8ae595 100644
> >>> --- a/hw/virtio/vhost-shadow-virtqueue.h
> >>> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> >>> @@ -17,6 +17,11 @@
> >>>
> >>>    typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> >>>
> >>> +bool vhost_shadow_vq_start_rcu(struct vhost_dev *dev,
> >>> +                               VhostShadowVirtqueue *svq);
> >>> +void vhost_shadow_vq_stop_rcu(struct vhost_dev *dev,
> >>> +                              VhostShadowVirtqueue *svq);
> >>> +
> >>>    VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, i=
nt idx);
> >>>
> >>>    void vhost_shadow_vq_free(VhostShadowVirtqueue *vq);
> >>> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> >>> index 2be782cefd..732a4b2a2b 100644
> >>> --- a/include/hw/virtio/vhost.h
> >>> +++ b/include/hw/virtio/vhost.h
> >>> @@ -55,6 +55,8 @@ struct vhost_iommu {
> >>>        QLIST_ENTRY(vhost_iommu) iommu_next;
> >>>    };
> >>>
> >>> +typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> >>> +
> >>>    typedef struct VhostDevConfigOps {
> >>>        /* Vhost device config space changed callback
> >>>         */
> >>> @@ -83,7 +85,9 @@ struct vhost_dev {
> >>>        uint64_t backend_cap;
> >>>        bool started;
> >>>        bool log_enabled;
> >>> +    bool sw_lm_enabled;
> >>>        uint64_t log_size;
> >>> +    VhostShadowVirtqueue **shadow_vqs;
> >>>        Error *migration_blocker;
> >>>        const VhostOps *vhost_ops;
> >>>        void *opaque;
> >>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-sha=
dow-virtqueue.c
> >>> index c0c967a7c5..908c36c66d 100644
> >>> --- a/hw/virtio/vhost-shadow-virtqueue.c
> >>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> >>> @@ -8,15 +8,129 @@
> >>>     */
> >>>
> >>>    #include "hw/virtio/vhost-shadow-virtqueue.h"
> >>> +#include "hw/virtio/vhost.h"
> >>> +#include "hw/virtio/virtio-access.h"
> >>> +
> >>> +#include "standard-headers/linux/vhost_types.h"
> >>> +#include "standard-headers/linux/virtio_ring.h"
> >>>
> >>>    #include "qemu/error-report.h"
> >>> -#include "qemu/event_notifier.h"
> >>> +#include "qemu/main-loop.h"
> >>>
> >>>    typedef struct VhostShadowVirtqueue {
> >>>        EventNotifier kick_notifier;
> >>>        EventNotifier call_notifier;
> >>> +    const struct vhost_virtqueue *hvq;
> >>> +    VirtIODevice *vdev;
> >>> +    VirtQueue *vq;
> >>>    } VhostShadowVirtqueue;
> >>
> >> So instead of doing things at virtio level, how about do the shadow
> >> stuffs at vhost level?
> >>
> >> It works like:
> >>
> >> virtio -> [shadow vhost backend] -> vhost backend
> >>
> >> Then the QMP is used to plug the shadow vhost backend in the middle or=
 not.
> >>
> >> It looks kind of easier since we don't need to deal with virtqueue
> >> handlers etc.. Instead, we just need to deal with eventfd stuffs:
> >>
> >> When shadow vhost mode is enabled, we just intercept the host_notifier=
s
> >> and guest_notifiers. When it was disabled, we just pass the host/guest
> >> notifiers to the real vhost backends?
> >>
> > Hi Jason.
> >
> > Sure we can try that model, but it seems to me that it comes with a
> > different set of problems.
> >
> > For example, there are code in vhost.c that checks if implementations
> > are available in vhost_ops, like:
> >
> > if (dev->vhost_ops->vhost_vq_get_addr) {
> >          r =3D dev->vhost_ops->vhost_vq_get_addr(dev, &addr, vq);
> >          ...
> > }
> >
> > I can count 14 of these, checking:
> >
> > dev->vhost_ops->vhost_backend_can_merge
> > dev->vhost_ops->vhost_backend_mem_section_filter
> > dev->vhost_ops->vhost_force_iommu
> > dev->vhost_ops->vhost_requires_shm_log
> > dev->vhost_ops->vhost_set_backend_cap
> > dev->vhost_ops->vhost_set_vring_busyloop_timeout
> > dev->vhost_ops->vhost_vq_get_addr
> > hdev->vhost_ops->vhost_dev_start
> > hdev->vhost_ops->vhost_get_config
> > hdev->vhost_ops->vhost_get_inflight_fd
> > hdev->vhost_ops->vhost_net_set_backend
> > hdev->vhost_ops->vhost_set_config
> > hdev->vhost_ops->vhost_set_inflight_fd
> > hdev->vhost_ops->vhost_set_iotlb_callback
> >
> > So we should Implement all of the vhost_ops callbacks, forwarding them
> > to actual vhost_backed, and delete conditionally these ones? In other
> > words, dynamically generate the new shadow vq vhost_ops? If a new
> > callback is added to any vhost backend in the future, do we have to
> > force the adding / checking for NULL in shadow backend vhost_ops?
> > Would this be a good moment to check if all backends implement these
> > and delete the checks?
>
>
> I think it won't be easy if we want to support all kinds of vhost
> backends from the start. So we can go with vhost-vdpa one first.
>
> Actually how it work might be something like (no need to switch
> vhost_ops, we can do everything silently in the ops)
>
> 1) when device to switch to shadow vq (e.g via QMP)
> 2) vhost-vdpa will stop and sync state (last_avail_idx) internally
> 3) reset vhost-vdpa, clean call and kick eventfd
> 4) allocate vqs for vhost-vdpa, new call and kick eventfd, restart
> vhost-vdpa
> 5) start the shadow vq (make it start for last_avail_idx)
> 6) intercept ioeventfd and forward the request to callfd
> 7) intercept callfd and forward the request to irqfd
> 8) forward request between shadow virtqueue and vhost-vdpa
>

Sorry, still not clear to me how it relates with the actual backend used :)=
.

Would it work for you if we finish the notifications forwarding part
and we work on the buffer forwarding part?

I'm going to send another cleaner revision, with less dependencies on
virtio code, only notifications eventfds. I think it will be easier to
discuss the changes on top of that.

>
> >
> > There are also checks like:
> >
> > if (dev->vhost_ops->backend_type =3D=3D VHOST_BACKEND_TYPE_USER)
> >
> > How would shadow_vq backend expose itself? (I guess as the actual used =
backend).
> >
> > I can modify this patchset to not relay the guest->host notifications
> > on vq handlers but on eventfd handlers. Although this will make it
> > independent of the actual virtio device kind used, I can see two
> > drawbacks:
> > * The actual fact that it makes it independent of virtio device kind.
> > If a device does not use the notifiers and poll the ring by itself, it
> > has no chance of knowing that it should stop. What happens if
> > virtio-net tx timer is armed when we start shadow vq?.
>
>
> So if we do that in vhost level, it's a vhost backend from the virtio
> layer. Then we don't need to worry about tx timer stuffs.
>

Got it.

So I'm going to assume that no device in virtio layer needs to be
aware of the change. It seems a valid assumption to me.

>
> > * The fixes (current and future) in vq notifications, like the one
> > currently implemented in virtio_notify_irqfd for windows drivers
> > regarding ISR bit 0. I think this one in particular is OK not to
> > carry, but I think many changes affecting any of the functions will
> > have to be mirrored in the other.
>
>
> Consider we behave like a vhost, it just work as in the past for other
> type of vhost backends when MSI-X is not enabled?
>

Yes, it may be a bad example, as vhost devices may not update it.
However I still think a lot of features (packed ring buffers
treatment, etc), performance optimizations and future fixes will have
to apply to two different codes in case we roll our own buffers
treatment.

Expanding in thread of patch 05/10, since you propose two solutions for thi=
s.

Thanks!


> Thanks
>
>
> >
> > Thoughts on this?
> >
> > Thanks!
> >
> >> Thanks
> >>
> >>
> >>> +static uint16_t vhost_shadow_vring_used_flags(VhostShadowVirtqueue *=
svq)
> >>> +{
> >>> +    const struct vring_used *used =3D svq->hvq->used;
> >>> +    return virtio_tswap16(svq->vdev, used->flags);
> >>> +}
> >>> +
> >>> +static bool vhost_shadow_vring_should_kick(VhostShadowVirtqueue *vq)
> >>> +{
> >>> +    return !(vhost_shadow_vring_used_flags(vq) & VRING_USED_F_NO_NOT=
IFY);
> >>> +}
> >>> +
> >>> +static void vhost_shadow_vring_kick(VhostShadowVirtqueue *vq)
> >>> +{
> >>> +    if (vhost_shadow_vring_should_kick(vq)) {
> >>> +        event_notifier_set(&vq->kick_notifier);
> >>> +    }
> >>> +}
> >>> +
> >>> +static void handle_shadow_vq(VirtIODevice *vdev, VirtQueue *vq)
> >>> +{
> >>> +    struct vhost_dev *hdev =3D vhost_dev_from_virtio(vdev);
> >>> +    uint16_t idx =3D virtio_get_queue_index(vq);
> >>> +
> >>> +    VhostShadowVirtqueue *svq =3D hdev->shadow_vqs[idx];
> >>> +
> >>> +    vhost_shadow_vring_kick(svq);
> >>> +}
> >>> +
> >>> +/*
> >>> + * Start shadow virtqueue operation.
> >>> + * @dev vhost device
> >>> + * @svq Shadow Virtqueue
> >>> + *
> >>> + * Run in RCU context
> >>> + */
> >>> +bool vhost_shadow_vq_start_rcu(struct vhost_dev *dev,
> >>> +                               VhostShadowVirtqueue *svq)
> >>> +{
> >>> +    const VirtioDeviceClass *k =3D VIRTIO_DEVICE_GET_CLASS(dev->vdev=
);
> >>> +    EventNotifier *vq_host_notifier =3D virtio_queue_get_host_notifi=
er(svq->vq);
> >>> +    unsigned idx =3D virtio_queue_get_idx(svq->vdev, svq->vq);
> >>> +    struct vhost_vring_file kick_file =3D {
> >>> +        .index =3D idx,
> >>> +        .fd =3D event_notifier_get_fd(&svq->kick_notifier),
> >>> +    };
> >>> +    int r;
> >>> +    bool ok;
> >>> +
> >>> +    /* Check that notifications are still going directly to vhost de=
v */
> >>> +    assert(virtio_queue_host_notifier_status(svq->vq));
> >>> +
> >>> +    ok =3D k->set_vq_handler(dev->vdev, idx, handle_shadow_vq);
> >>> +    if (!ok) {
> >>> +        error_report("Couldn't set the vq handler");
> >>> +        goto err_set_kick_handler;
> >>> +    }
> >>> +
> >>> +    r =3D dev->vhost_ops->vhost_set_vring_kick(dev, &kick_file);
> >>> +    if (r !=3D 0) {
> >>> +        error_report("Couldn't set kick fd: %s", strerror(errno));
> >>> +        goto err_set_vring_kick;
> >>> +    }
> >>> +
> >>> +    event_notifier_set_handler(vq_host_notifier,
> >>> +                               virtio_queue_host_notifier_read);
> >>> +    virtio_queue_set_host_notifier_enabled(svq->vq, false);
> >>> +    virtio_queue_host_notifier_read(vq_host_notifier);
> >>> +
> >>> +    return true;
> >>> +
> >>> +err_set_vring_kick:
> >>> +    k->set_vq_handler(dev->vdev, idx, NULL);
> >>> +
> >>> +err_set_kick_handler:
> >>> +    return false;
> >>> +}
> >>> +
> >>> +/*
> >>> + * Stop shadow virtqueue operation.
> >>> + * @dev vhost device
> >>> + * @svq Shadow Virtqueue
> >>> + *
> >>> + * Run in RCU context
> >>> + */
> >>> +void vhost_shadow_vq_stop_rcu(struct vhost_dev *dev,
> >>> +                              VhostShadowVirtqueue *svq)
> >>> +{
> >>> +    const VirtioDeviceClass *k =3D VIRTIO_DEVICE_GET_CLASS(svq->vdev=
);
> >>> +    unsigned idx =3D virtio_queue_get_idx(svq->vdev, svq->vq);
> >>> +    EventNotifier *vq_host_notifier =3D virtio_queue_get_host_notifi=
er(svq->vq);
> >>> +    struct vhost_vring_file kick_file =3D {
> >>> +        .index =3D idx,
> >>> +        .fd =3D event_notifier_get_fd(vq_host_notifier),
> >>> +    };
> >>> +    int r;
> >>> +
> >>> +    /* Restore vhost kick */
> >>> +    r =3D dev->vhost_ops->vhost_set_vring_kick(dev, &kick_file);
> >>> +    /* Cannot do a lot of things */
> >>> +    assert(r =3D=3D 0);
> >>> +
> >>> +    event_notifier_set_handler(vq_host_notifier, NULL);
> >>> +    virtio_queue_set_host_notifier_enabled(svq->vq, true);
> >>> +    k->set_vq_handler(svq->vdev, idx, NULL);
> >>> +}
> >>> +
> >>>    /*
> >>>     * Creates vhost shadow virtqueue, and instruct vhost device to us=
e the shadow
> >>>     * methods and file descriptors.
> >>> @@ -24,8 +138,13 @@ typedef struct VhostShadowVirtqueue {
> >>>    VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, i=
nt idx)
> >>>    {
> >>>        g_autofree VhostShadowVirtqueue *svq =3D g_new0(VhostShadowVir=
tqueue, 1);
> >>> +    int vq_idx =3D dev->vhost_ops->vhost_get_vq_index(dev, dev->vq_i=
ndex + idx);
> >>>        int r;
> >>>
> >>> +    svq->vq =3D virtio_get_queue(dev->vdev, vq_idx);
> >>> +    svq->hvq =3D &dev->vqs[idx];
> >>> +    svq->vdev =3D dev->vdev;
> >>> +
> >>>        r =3D event_notifier_init(&svq->kick_notifier, 0);
> >>>        if (r !=3D 0) {
> >>>            error_report("Couldn't create kick event notifier: %s",
> >>> @@ -40,7 +159,7 @@ VhostShadowVirtqueue *vhost_shadow_vq_new(struct v=
host_dev *dev, int idx)
> >>>            goto err_init_call_notifier;
> >>>        }
> >>>
> >>> -    return svq;
> >>> +    return g_steal_pointer(&svq);
> >>>
> >>>    err_init_call_notifier:
> >>>        event_notifier_cleanup(&svq->kick_notifier);
> >>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> >>> index 42836e45f3..bde688f278 100644
> >>> --- a/hw/virtio/vhost.c
> >>> +++ b/hw/virtio/vhost.c
> >>> @@ -25,6 +25,7 @@
> >>>    #include "exec/address-spaces.h"
> >>>    #include "hw/virtio/virtio-bus.h"
> >>>    #include "hw/virtio/virtio-access.h"
> >>> +#include "hw/virtio/vhost-shadow-virtqueue.h"
> >>>    #include "migration/blocker.h"
> >>>    #include "migration/qemu-file-types.h"
> >>>    #include "sysemu/dma.h"
> >>> @@ -945,6 +946,82 @@ static void vhost_log_global_stop(MemoryListener=
 *listener)
> >>>        }
> >>>    }
> >>>
> >>> +static int vhost_sw_live_migration_stop(struct vhost_dev *dev)
> >>> +{
> >>> +    int idx;
> >>> +
> >>> +    WITH_RCU_READ_LOCK_GUARD() {
> >>> +        dev->sw_lm_enabled =3D false;
> >>> +
> >>> +        for (idx =3D 0; idx < dev->nvqs; ++idx) {
> >>> +            vhost_shadow_vq_stop_rcu(dev, dev->shadow_vqs[idx]);
> >>> +        }
> >>> +    }
> >>> +
> >>> +    for (idx =3D 0; idx < dev->nvqs; ++idx) {
> >>> +        vhost_shadow_vq_free(dev->shadow_vqs[idx]);
> >>> +    }
> >>> +
> >>> +    g_free(dev->shadow_vqs);
> >>> +    dev->shadow_vqs =3D NULL;
> >>> +    return 0;
> >>> +}
> >>> +
> >>> +static int vhost_sw_live_migration_start(struct vhost_dev *dev)
> >>> +{
> >>> +    int idx;
> >>> +
> >>> +    dev->shadow_vqs =3D g_new0(VhostShadowVirtqueue *, dev->nvqs);
> >>> +    for (idx =3D 0; idx < dev->nvqs; ++idx) {
> >>> +        dev->shadow_vqs[idx] =3D vhost_shadow_vq_new(dev, idx);
> >>> +        if (unlikely(dev->shadow_vqs[idx] =3D=3D NULL)) {
> >>> +            goto err;
> >>> +        }
> >>> +    }
> >>> +
> >>> +    WITH_RCU_READ_LOCK_GUARD() {
> >>> +        for (idx =3D 0; idx < dev->nvqs; ++idx) {
> >>> +            int stop_idx =3D idx;
> >>> +            bool ok =3D vhost_shadow_vq_start_rcu(dev,
> >>> +                                                dev->shadow_vqs[idx]=
);
> >>> +
> >>> +            if (!ok) {
> >>> +                while (--stop_idx >=3D 0) {
> >>> +                    vhost_shadow_vq_stop_rcu(dev, dev->shadow_vqs[st=
op_idx]);
> >>> +                }
> >>> +
> >>> +                goto err;
> >>> +            }
> >>> +        }
> >>> +    }
> >>> +
> >>> +    dev->sw_lm_enabled =3D true;
> >>> +    return 0;
> >>> +
> >>> +err:
> >>> +    for (; idx >=3D 0; --idx) {
> >>> +        vhost_shadow_vq_free(dev->shadow_vqs[idx]);
> >>> +    }
> >>> +    g_free(dev->shadow_vqs[idx]);
> >>> +
> >>> +    return -1;
> >>> +}
> >>> +
> >>> +static int vhost_sw_live_migration_enable(struct vhost_dev *dev,
> >>> +                                          bool enable_lm)
> >>> +{
> >>> +    int r;
> >>> +
> >>> +    if (enable_lm =3D=3D dev->sw_lm_enabled) {
> >>> +        return 0;
> >>> +    }
> >>> +
> >>> +    r =3D enable_lm ? vhost_sw_live_migration_start(dev)
> >>> +                  : vhost_sw_live_migration_stop(dev);
> >>> +
> >>> +    return r;
> >>> +}
> >>> +
> >>>    static void vhost_log_start(MemoryListener *listener,
> >>>                                MemoryRegionSection *section,
> >>>                                int old, int new)
> >>> @@ -1389,6 +1466,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void=
 *opaque,
> >>>        hdev->log =3D NULL;
> >>>        hdev->log_size =3D 0;
> >>>        hdev->log_enabled =3D false;
> >>> +    hdev->sw_lm_enabled =3D false;
> >>>        hdev->started =3D false;
> >>>        memory_listener_register(&hdev->memory_listener, &address_spac=
e_memory);
> >>>        QLIST_INSERT_HEAD(&vhost_devices, hdev, entry);
> >>> @@ -1816,6 +1894,11 @@ void vhost_dev_stop(struct vhost_dev *hdev, Vi=
rtIODevice *vdev)
> >>>            hdev->vhost_ops->vhost_dev_start(hdev, false);
> >>>        }
> >>>        for (i =3D 0; i < hdev->nvqs; ++i) {
> >>> +        if (hdev->sw_lm_enabled) {
> >>> +            vhost_shadow_vq_stop_rcu(hdev, hdev->shadow_vqs[i]);
> >>> +            vhost_shadow_vq_free(hdev->shadow_vqs[i]);
> >>> +        }
> >>> +
> >>>            vhost_virtqueue_stop(hdev,
> >>>                                 vdev,
> >>>                                 hdev->vqs + i,
> >>> @@ -1829,6 +1912,8 @@ void vhost_dev_stop(struct vhost_dev *hdev, Vir=
tIODevice *vdev)
> >>>            memory_listener_unregister(&hdev->iommu_listener);
> >>>        }
> >>>        vhost_log_put(hdev, true);
> >>> +    g_free(hdev->shadow_vqs);
> >>> +    hdev->sw_lm_enabled =3D false;
> >>>        hdev->started =3D false;
> >>>        hdev->vdev =3D NULL;
> >>>    }
> >>> @@ -1845,5 +1930,53 @@ int vhost_net_set_backend(struct vhost_dev *hd=
ev,
> >>>
> >>>    void qmp_x_vhost_enable_shadow_vq(const char *name, bool enable, E=
rror **errp)
> >>>    {
> >>> -    error_setg(errp, "Shadow virtqueue still not implemented.");
> >>> +    struct vhost_dev *hdev;
> >>> +    const char *err_cause =3D NULL;
> >>> +    const VirtioDeviceClass *k;
> >>> +    int r;
> >>> +    ErrorClass err_class =3D ERROR_CLASS_GENERIC_ERROR;
> >>> +
> >>> +    QLIST_FOREACH(hdev, &vhost_devices, entry) {
> >>> +        if (hdev->vdev && 0 =3D=3D strcmp(hdev->vdev->name, name)) {
> >>> +            break;
> >>> +        }
> >>> +    }
> >>> +
> >>> +    if (!hdev) {
> >>> +        err_class =3D ERROR_CLASS_DEVICE_NOT_FOUND;
> >>> +        err_cause =3D "Device not found";
> >>> +        goto err;
> >>> +    }
> >>> +
> >>> +    if (!hdev->started) {
> >>> +        err_cause =3D "Device is not started";
> >>> +        goto err;
> >>> +    }
> >>> +
> >>> +    if (hdev->acked_features & BIT_ULL(VIRTIO_F_RING_PACKED)) {
> >>> +        err_cause =3D "Use packed vq";
> >>> +        goto err;
> >>> +    }
> >>> +
> >>> +    if (vhost_dev_has_iommu(hdev)) {
> >>> +        err_cause =3D "Device use IOMMU";
> >>> +        goto err;
> >>> +    }
> >>> +
> >>> +    k =3D VIRTIO_DEVICE_GET_CLASS(hdev->vdev);
> >>> +    if (!k->set_vq_handler) {
> >>> +        err_cause =3D "Virtio device type does not support reset of =
vq handler";
> >>> +        goto err;
> >>> +    }
> >>> +
> >>> +    r =3D vhost_sw_live_migration_enable(hdev, enable);
> >>> +    if (unlikely(r)) {
> >>> +        err_cause =3D "Error enabling (see monitor)";
> >>> +    }
> >>> +
> >>> +err:
> >>> +    if (err_cause) {
> >>> +        error_set(errp, err_class,
> >>> +                  "Can't enable shadow vq on %s: %s", name, err_caus=
e);
> >>> +    }
> >>>    }
>


