Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1948442B98
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 11:24:18 +0100 (CET)
Received: from localhost ([::1]:44648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhqxl-0004Em-6j
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 06:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhqwm-0003Vy-Ow
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:23:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhqwi-0000Bf-Fn
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:23:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635848591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HaTsDqf9rBYYu5NupI1+AeUAaY8YG1Qq2NWrohFbepk=;
 b=N0Psnza0cFjyN/8pxD1lPVCGG1FquIGtuyCeJKTrPbUGIAyl7ZSIokOd9PcBGuQi8uawIY
 zrot4OAV4Hk0UrDpecmhmMbjtOf+E5uE7e6sbzySKIr1RE3CfeZ0UnXf2ffvaJo10LOwzL
 k8I+alu9ysgm0FsNGyu1Z0XO0wqoLuY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-txkKAM9XNnKxCCUqYgMdFA-1; Tue, 02 Nov 2021 06:23:10 -0400
X-MC-Unique: txkKAM9XNnKxCCUqYgMdFA-1
Received: by mail-qv1-f69.google.com with SMTP id
 gs5-20020a056214226500b00382f5609124so19107145qvb.8
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 03:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HaTsDqf9rBYYu5NupI1+AeUAaY8YG1Qq2NWrohFbepk=;
 b=4wcnZFwc8OkqdiA4bLj+RqC5wbEHBd2r5IwMXA1M8b3aEEINijO5IEPmBfQRYigAH+
 yubzF2gWfdXrYjE8yz2zPNOiJ0lGQEzGg4qMa4mSRMqUKZe1j6bPq4hOzQwKf0GximiF
 x7g/6P36RkY8VrwxISd5EcH2YjcFEdlABZNqtW//uarVGW7Lns9dOR121oFLv6/3AFzm
 kicUOtlR6HN38zN3+sudDO9MWQJuHy/AtKYU4wsO9yKpdoD2l7X5kCTy1Y0GnTiQFnmS
 erjgqATA7GhIQSe/Vv/mznRLcpi0JaoXoUr4VgcFbYLTHj/NKSyUERP7iRRyYNxh4R4J
 3X2A==
X-Gm-Message-State: AOAM531gekAbiOLQvGKldoZBffDTEUKWSV+c6sFect28eT44mMU3aWYZ
 Tzsnde4OQQ4hjTmTHzZyG8u35jCV24E6GLxltQvae7ZfXY+b3dbfahC1R2W6vve3zlIr2DN7zJM
 8GXfTTaK1jF/CoT1ASgc9Q9Byyw4CGoY=
X-Received: by 2002:a05:620a:2848:: with SMTP id
 h8mr28121819qkp.87.1635848589965; 
 Tue, 02 Nov 2021 03:23:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlu4lOgnVzrEkkakBWb5tLCqSqfztIWX2Wd1lzpOU4b7gvD0rJNZ5ziGu6PCEA0c1XtY0oDqymaY8rMcmHdZU=
X-Received: by 2002:a05:620a:2848:: with SMTP id
 h8mr28121778qkp.87.1635848589462; 
 Tue, 02 Nov 2021 03:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211029183525.1776416-1-eperezma@redhat.com>
 <20211029183525.1776416-23-eperezma@redhat.com>
 <5cc9cb09-8b10-d406-25bf-b8de5b510a07@redhat.com>
In-Reply-To: <5cc9cb09-8b10-d406-25bf-b8de5b510a07@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 2 Nov 2021 11:22:33 +0100
Message-ID: <CAJaqyWetiR4QtEr0+k4B9P4Q0m5w+dr1StAQVccJOg19jJ6eNg@mail.gmail.com>
Subject: Re: [RFC PATCH v5 22/26] vhost: Shadow virtqueue buffers forwarding
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Xiao W Wang <xiao.w.wang@intel.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Parav Pandit <parav@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 2, 2021 at 8:59 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/10/30 =E4=B8=8A=E5=8D=882:35, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > Initial version of shadow virtqueue that actually forward buffers. Ther=
e
> > are no iommu support at the moment, and that will be addressed in futur=
e
> > patches of this series. Since all vhost-vdpa devices uses forced IOMMU,
> > this means that SVQ is not usable at this point of the series on any
> > device.
> >
> > For simplicity it only supports modern devices, that expects vring
> > in little endian, with split ring and no event idx or indirect
> > descriptors. Support for them will not be added in this series.
> >
> > It reuses the VirtQueue code for the device part. The driver part is
> > based on Linux's virtio_ring driver, but with stripped functionality
> > and optimizations so it's easier to review. Later commits add simpler
> > ones.
> >
> > However to forwarding buffers have some particular pieces: One of the
> > most unexpected ones is that a guest's buffer can expand through more
> > than one descriptor in SVQ. While this is handled gracefully by qemu's
> > emulated virtio devices, it may cause unexpected SVQ queue full. This
> > patch also solves it checking for this condition at both guest's kicks
> > and device's calls. The code may be more elegant in the future if SVQ
> > code runs in its own iocontext.
> >
> > Note that vhost_vdpa_get_vq_state trust the device to write its status
> > to used_idx at pause(), finishing all in-flight descriptors. This may
> > not be enough for complex devices, but other development like usage of
> > inflight_fd on top of this solution may extend the usage in the future.
> >
> > In particular, SVQ trust it to recover guest's virtqueue at start, and
> > to mark as used the latest descriptors used by the device in the
> > meantime.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   qapi/net.json                      |   5 +-
> >   hw/virtio/vhost-shadow-virtqueue.c | 400 +++++++++++++++++++++++++++-=
-
> >   hw/virtio/vhost-vdpa.c             | 144 ++++++++++-
> >   3 files changed, 521 insertions(+), 28 deletions(-)
> >
> > diff --git a/qapi/net.json b/qapi/net.json
> > index fca2f6ebca..1c6d3b2179 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -84,12 +84,9 @@
> >   #
> >   # Use vhost shadow virtqueue.
> >   #
> > -# SVQ can just forward notifications between the device and the guest =
at this
> > -# moment. This will expand in future changes.
> > -#
> >   # @name: the device name of the VirtIO device
> >   #
> > -# @set: true to use the alternate shadow VQ notifications
> > +# @set: true to use the alternate shadow VQ
> >   #
> >   # Since: 6.2
> >   #
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index cb9ffcb015..ad1b2342be 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -9,6 +9,9 @@
> >
> >   #include "qemu/osdep.h"
> >   #include "hw/virtio/vhost-shadow-virtqueue.h"
> > +#include "hw/virtio/vhost.h"
> > +#include "hw/virtio/virtio-access.h"
> > +
> >   #include "standard-headers/linux/vhost_types.h"
> >
> >   #include "qemu/error-report.h"
> > @@ -45,6 +48,27 @@ typedef struct VhostShadowVirtqueue {
> >
> >       /* Virtio device */
> >       VirtIODevice *vdev;
> > +
> > +    /* Map for returning guest's descriptors */
> > +    VirtQueueElement **ring_id_maps;
> > +
> > +    /* Next VirtQueue element that guest made available */
> > +    VirtQueueElement *next_guest_avail_elem;
> > +
> > +    /* Next head to expose to device */
> > +    uint16_t avail_idx_shadow;
> > +
> > +    /* Next free descriptor */
> > +    uint16_t free_head;
> > +
> > +    /* Last seen used idx */
> > +    uint16_t shadow_used_idx;
> > +
> > +    /* Next head to consume from device */
> > +    uint16_t last_used_idx;
> > +
> > +    /* Cache for the exposed notification flag */
> > +    bool notification;
> >   } VhostShadowVirtqueue;
> >
> >   /**
> > @@ -56,25 +80,174 @@ const EventNotifier *vhost_svq_get_dev_kick_notifi=
er(
> >       return &svq->hdev_kick;
> >   }
> >
> > -/* If the device is using some of these, SVQ cannot communicate */
> > +/**
> > + * VirtIO transport device feature acknowledge
> > + *
> > + * @dev_features  The device features. If success, the acknowledged fe=
atures.
> > + *
> > + * Returns true if SVQ can go with a subset of these, false otherwise.
> > + */
> >   bool vhost_svq_valid_device_features(uint64_t *dev_features)
> >   {
> > -    return true;
> > +    uint64_t b;
> > +    bool r =3D true;
> > +
> > +    for (b =3D VIRTIO_TRANSPORT_F_START; b <=3D VIRTIO_TRANSPORT_F_END=
; ++b) {
> > +        switch (b) {
> > +        case VIRTIO_F_NOTIFY_ON_EMPTY:
> > +        case VIRTIO_F_ANY_LAYOUT:
> > +            continue;
> > +
> > +        case VIRTIO_F_ACCESS_PLATFORM:
> > +            /* SVQ does not know how to translate addresses */
> > +            if (*dev_features & BIT_ULL(b)) {
> > +                clear_bit(b, dev_features);
> > +                r =3D false;
> > +            }
> > +            break;
> > +
> > +        case VIRTIO_F_VERSION_1:
> > +            /* SVQ trust that guest vring is little endian */
> > +            if (!(*dev_features & BIT_ULL(b))) {
> > +                set_bit(b, dev_features);
> > +                r =3D false;
> > +            }
> > +            continue;
> > +
> > +        default:
> > +            if (*dev_features & BIT_ULL(b)) {
> > +                clear_bit(b, dev_features);
> > +            }
> > +        }
> > +    }
> > +
> > +    return r;
> >   }
> >
> > -/* If the guest is using some of these, SVQ cannot communicate */
> > +/**
> > + * Check of guest's acknowledge features.
> > + *
> > + * @guest_features  The guest's acknowledged features
> > + *
> > + * Returns true if SVQ can handle them, false otherwise.
> > + */
> >   bool vhost_svq_valid_guest_features(uint64_t *guest_features)
> >   {
> > -    return true;
> > +    static const uint64_t transport =3D MAKE_64BIT_MASK(VIRTIO_TRANSPO=
RT_F_START,
> > +                            VIRTIO_TRANSPORT_F_END - VIRTIO_TRANSPORT_=
F_START);
> > +
> > +    /* These transport features are handled by VirtQueue */
> > +    static const uint64_t valid =3D (BIT_ULL(VIRTIO_RING_F_INDIRECT_DE=
SC) |
> > +                                   BIT_ULL(VIRTIO_F_VERSION_1));
> > +
> > +    /* We are only interested in transport-related feature bits */
> > +    uint64_t guest_transport_features =3D (*guest_features) & transpor=
t;
> > +
> > +    *guest_features &=3D (valid | ~transport);
> > +    return !(guest_transport_features & (transport ^ valid));
> >   }
> >
> > -/* Forward guest notifications */
> > -static void vhost_handle_guest_kick(EventNotifier *n)
> > +/**
> > + * Number of descriptors that SVQ can make available from the guest.
> > + *
> > + * @svq   The svq
> > + */
> > +static uint16_t vhost_svq_available_slots(const VhostShadowVirtqueue *=
svq)
> >   {
> > -    VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowVirtqueue=
,
> > -                                             svq_kick);
> > +    return svq->vring.num - (svq->avail_idx_shadow - svq->shadow_used_=
idx);
> > +}
> >
> > -    if (unlikely(!event_notifier_test_and_clear(n))) {
> > +static void vhost_svq_set_notification(VhostShadowVirtqueue *svq, bool=
 enable)
> > +{
> > +    uint16_t notification_flag;
> > +
> > +    if (svq->notification =3D=3D enable) {
> > +        return;
> > +    }
> > +
> > +    notification_flag =3D cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
> > +
> > +    svq->notification =3D enable;
> > +    if (enable) {
> > +        svq->vring.avail->flags &=3D ~notification_flag;
> > +    } else {
> > +        svq->vring.avail->flags |=3D notification_flag;
> > +    }
> > +}
> > +
> > +static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
> > +                                    const struct iovec *iovec,
> > +                                    size_t num, bool more_descs, bool =
write)
> > +{
> > +    uint16_t i =3D svq->free_head, last =3D svq->free_head;
> > +    unsigned n;
> > +    uint16_t flags =3D write ? cpu_to_le16(VRING_DESC_F_WRITE) : 0;
> > +    vring_desc_t *descs =3D svq->vring.desc;
> > +
> > +    if (num =3D=3D 0) {
> > +        return;
> > +    }
> > +
> > +    for (n =3D 0; n < num; n++) {
> > +        if (more_descs || (n + 1 < num)) {
> > +            descs[i].flags =3D flags | cpu_to_le16(VRING_DESC_F_NEXT);
> > +        } else {
> > +            descs[i].flags =3D flags;
> > +        }
> > +        descs[i].addr =3D cpu_to_le64((hwaddr)iovec[n].iov_base);
> > +        descs[i].len =3D cpu_to_le32(iovec[n].iov_len);
> > +
> > +        last =3D i;
> > +        i =3D cpu_to_le16(descs[i].next);
> > +    }
> > +
> > +    svq->free_head =3D le16_to_cpu(descs[last].next);
> > +}
> > +
> > +static unsigned vhost_svq_add_split(VhostShadowVirtqueue *svq,
> > +                                    VirtQueueElement *elem)
> > +{
> > +    int head;
> > +    unsigned avail_idx;
> > +    vring_avail_t *avail =3D svq->vring.avail;
> > +
> > +    head =3D svq->free_head;
> > +
> > +    /* We need some descriptors here */
> > +    assert(elem->out_num || elem->in_num);
> > +
> > +    vhost_vring_write_descs(svq, elem->out_sg, elem->out_num,
> > +                            elem->in_num > 0, false);
> > +    vhost_vring_write_descs(svq, elem->in_sg, elem->in_num, false, tru=
e);
> > +
> > +    /*
> > +     * Put entry in available array (but don't update avail->idx until=
 they
> > +     * do sync).
> > +     */
> > +    avail_idx =3D svq->avail_idx_shadow & (svq->vring.num - 1);
> > +    avail->ring[avail_idx] =3D cpu_to_le16(head);
> > +    svq->avail_idx_shadow++;
> > +
> > +    /* Update avail index after the descriptor is wrote */
> > +    smp_wmb();
>
>
> A question, since we may talk with the real hardware, is smp_wmb()
> sufficient in this case or do we need to honer VIRTIO_F_ORDER_PLATFORM?
>

I didn't take that into account, please let me look better about
qemu's barriers and I will come back for this.

>
> > +    avail->idx =3D cpu_to_le16(svq->avail_idx_shadow);
> > +
> > +    return head;
> > +
> > +}
> > +
> > +static void vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElement =
*elem)
> > +{
> > +    unsigned qemu_head =3D vhost_svq_add_split(svq, elem);
> > +
> > +    svq->ring_id_maps[qemu_head] =3D elem;
> > +}
> > +
> > +static void vhost_svq_kick(VhostShadowVirtqueue *svq)
> > +{
> > +    /* We need to expose available array entries before checking used =
flags */
> > +    smp_mb();
> > +    if (svq->vring.used->flags & VRING_USED_F_NO_NOTIFY) {
> >           return;
> >       }
> >
> > @@ -86,25 +259,188 @@ static void vhost_handle_guest_kick(EventNotifier=
 *n)
> >       }
> >   }
> >
> > -/*
> > - * Set the device's memory region notifier. addr =3D NULL clear it.
> > +/**
> > + * Forward available buffers.
> > + *
> > + * @svq Shadow VirtQueue
> > + *
> > + * Note that this function does not guarantee that all guest's availab=
le
> > + * buffers are available to the device in SVQ avail ring. The guest ma=
y have
> > + * exposed a GPA / GIOVA congiuous buffer, but it may not be contiguou=
s in qemu
> > + * vaddr.
> > + *
> > + * If that happens, guest's kick notifications will be disabled until =
device
> > + * makes some buffers used.
> >    */
> > -void vhost_svq_set_host_mr_notifier(VhostShadowVirtqueue *svq, void *a=
ddr)
> > +static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
> >   {
> > -    svq->host_notifier_mr =3D addr;
> > +    /* Clear event notifier */
> > +    event_notifier_test_and_clear(&svq->svq_kick);
> > +
> > +    /* Make available as many buffers as possible */
> > +    do {
> > +        if (virtio_queue_get_notification(svq->vq)) {
> > +            virtio_queue_set_notification(svq->vq, false);
> > +        }
> > +
> > +        while (true) {
> > +            VirtQueueElement *elem;
> > +
> > +            if (svq->next_guest_avail_elem) {
> > +                elem =3D g_steal_pointer(&svq->next_guest_avail_elem);
> > +            } else {
> > +                elem =3D virtqueue_pop(svq->vq, sizeof(*elem));
> > +            }
> > +
> > +            if (!elem) {
> > +                break;
> > +            }
> > +
> > +            if (elem->out_num + elem->in_num >
> > +                vhost_svq_available_slots(svq)) {
> > +                /*
> > +                 * This condition is possible since a contiguous buffe=
r in GPA
> > +                 * does not imply a contiguous buffer in qemu's VA
> > +                 * scatter-gather segments. If that happen, the buffer=
 exposed
> > +                 * to the device needs to be a chain of descriptors at=
 this
> > +                 * moment.
> > +                 *
> > +                 * SVQ cannot hold more available buffers if we are he=
re:
> > +                 * queue the current guest descriptor and ignore furth=
er kicks
> > +                 * until some elements are used.
> > +                 */
>
>
> I wonder what's the advantage of tracking the pending elem like this. It
> looks to me we can simply rewind last_avail_idx in this case?
>

If we do that, we have no way to know if we should check for more
avail buffers at the end of making more used buffers.

We could rewind + use a boolean flag, but I think it would be somehow
equivalent to checking for next_guest_avail_elem !=3D NULL, and then
having to pop (map, etc) everything again.

Another option is to always check for more available buffers at the
end of used buffers. The check should be somehow free with
shadow_avail_idx, but qemu needs to map the descriptor's memory again
as said before.

>
> > +                svq->next_guest_avail_elem =3D elem;
> > +                return;
> > +            }
> > +
> > +            vhost_svq_add(svq, elem);
> > +            vhost_svq_kick(svq);
> > +        }
> > +
> > +        virtio_queue_set_notification(svq->vq, true);
> > +    } while (!virtio_queue_empty(svq->vq));
> > +}
> > +
> > +/**
> > + * Handle guest's kick.
> > + *
> > + * @n guest kick event notifier, the one that guest set to notify svq.
> > + */
> > +static void vhost_handle_guest_kick_notifier(EventNotifier *n)
> > +{
> > +    VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowVirtqueue=
,
> > +                                             svq_kick);
> > +    vhost_handle_guest_kick(svq);
> > +}
> > +
> > +static bool vhost_svq_more_used(VhostShadowVirtqueue *svq)
> > +{
> > +    if (svq->last_used_idx !=3D svq->shadow_used_idx) {
> > +        return true;
> > +    }
> > +
> > +    svq->shadow_used_idx =3D cpu_to_le16(svq->vring.used->idx);
> > +
> > +    return svq->last_used_idx !=3D svq->shadow_used_idx;
> > +}
> > +
> > +static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq)
> > +{
> > +    vring_desc_t *descs =3D svq->vring.desc;
> > +    const vring_used_t *used =3D svq->vring.used;
> > +    vring_used_elem_t used_elem;
> > +    uint16_t last_used;
> > +
> > +    if (!vhost_svq_more_used(svq)) {
> > +        return NULL;
> > +    }
> > +
> > +    /* Only get used array entries after they have been exposed by dev=
 */
> > +    smp_rmb();
> > +    last_used =3D svq->last_used_idx & (svq->vring.num - 1);
> > +    used_elem.id =3D le32_to_cpu(used->ring[last_used].id);
> > +    used_elem.len =3D le32_to_cpu(used->ring[last_used].len);
> > +
> > +    svq->last_used_idx++;
> > +    if (unlikely(used_elem.id >=3D svq->vring.num)) {
> > +        error_report("Device %s says index %u is used", svq->vdev->nam=
e,
> > +                     used_elem.id);
> > +        return NULL;
> > +    }
> > +
> > +    if (unlikely(!svq->ring_id_maps[used_elem.id])) {
> > +        error_report(
> > +            "Device %s says index %u is used, but it was not available=
",
> > +            svq->vdev->name, used_elem.id);
> > +        return NULL;
> > +    }
> > +
> > +    descs[used_elem.id].next =3D svq->free_head;
> > +    svq->free_head =3D used_elem.id;
> > +
> > +    svq->ring_id_maps[used_elem.id]->len =3D used_elem.len;
> > +    return g_steal_pointer(&svq->ring_id_maps[used_elem.id]);
> >   }
> >
> > -/* Forward vhost notifications */
> > +static void vhost_svq_flush(VhostShadowVirtqueue *svq,
> > +                            bool check_for_avail_queue)
> > +{
> > +    VirtQueue *vq =3D svq->vq;
> > +
> > +    /* Make as many buffers as possible used. */
> > +    do {
> > +        unsigned i =3D 0;
> > +
> > +        vhost_svq_set_notification(svq, false);
> > +        while (true) {
> > +            g_autofree VirtQueueElement *elem =3D vhost_svq_get_buf(sv=
q);
> > +            if (!elem) {
> > +                break;
> > +            }
> > +
> > +            if (unlikely(i >=3D svq->vring.num)) {
> > +                virtio_error(svq->vdev,
> > +                         "More than %u used buffers obtained in a %u s=
ize SVQ",
> > +                         i, svq->vring.num);
> > +                virtqueue_fill(vq, elem, elem->len, i);
> > +                virtqueue_flush(vq, i);
> > +                i =3D 0;
> > +            }
> > +            virtqueue_fill(vq, elem, elem->len, i++);
> > +        }
> > +
> > +        virtqueue_flush(vq, i);
> > +        event_notifier_set(&svq->svq_call);
> > +
> > +        if (check_for_avail_queue && svq->next_guest_avail_elem) {
> > +            /*
> > +             * Avail ring was full when vhost_svq_flush was called, so=
 it's a
> > +             * good moment to make more descriptors available if possi=
ble
> > +             */
> > +            vhost_handle_guest_kick(svq);
> > +        }
> > +
> > +        vhost_svq_set_notification(svq, true);
> > +    } while (vhost_svq_more_used(svq));
>
>
> So this actually doesn't make sure all the buffers were processed by the
> device? Is this intended (I see it was called by the vhost_svq_stop()).
>
> Note that it means some buffers might not be submitted to the device
> after migration?
>

Not really,

At the do{}while exit, the SVQ has marked all guest's avail buffer as
used. If the device is *not* paused (normal operation), the device
could mark another descriptor as used right after the do{}while
condition, and call() SVQ right after that.

What could happen is that we can pause the device with *those* buffers
pending. That's why a last flush is needed. Since that flush happens
after the pause, the device is not allowed to mark more descriptors as
used, and must have flushed them to SVQ vring after pause() return.

Since the device is going to be reset, it makes no sense to make more
buffers available for it, so we skip that part with
check_for_avail_queue =3D=3D false.

Is that clear?

>
> > +}
> > +
> > +/**
> > + * Forward used buffers.
> > + *
> > + * @n hdev call event notifier, the one that device set to notify svq.
> > + *
> > + * Note that we are not making any buffers available in the loop, ther=
e is no
> > + * way that it runs more than virtqueue size times.
> > + */
> >   static void vhost_svq_handle_call(EventNotifier *n)
> >   {
> >       VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowVirtqueu=
e,
> >                                                hdev_call);
> >
> > -    if (unlikely(!event_notifier_test_and_clear(n))) {
> > -        return;
> > -    }
> > +    /* Clear event notifier */
> > +    event_notifier_test_and_clear(n);
> >
> > -    event_notifier_set(&svq->svq_call);
> > +    vhost_svq_flush(svq, true);
> >   }
> >
> >   /*
> > @@ -132,6 +468,14 @@ void vhost_svq_set_guest_call_notifier(VhostShadow=
Virtqueue *svq, int call_fd)
> >       event_notifier_init_fd(&svq->svq_call, call_fd);
> >   }
> >
> > +/*
> > + * Set the device's memory region notifier. addr =3D NULL clear it.
> > + */
> > +void vhost_svq_set_host_mr_notifier(VhostShadowVirtqueue *svq, void *a=
ddr)
> > +{
> > +    svq->host_notifier_mr =3D addr;
> > +}
> > +
> >   /*
> >    * Get the shadow vq vring address.
> >    * @svq Shadow virtqueue
> > @@ -185,7 +529,8 @@ static void vhost_svq_set_svq_kick_fd_internal(Vhos=
tShadowVirtqueue *svq,
> >        * need to explicitely check for them.
> >        */
> >       event_notifier_init_fd(&svq->svq_kick, svq_kick_fd);
> > -    event_notifier_set_handler(&svq->svq_kick, vhost_handle_guest_kick=
);
> > +    event_notifier_set_handler(&svq->svq_kick,
> > +                               vhost_handle_guest_kick_notifier);
> >
> >       /*
> >        * !check_old means that we are starting SVQ, taking the descript=
or from
> > @@ -233,7 +578,16 @@ void vhost_svq_start(struct vhost_dev *dev, unsign=
ed idx,
> >   void vhost_svq_stop(struct vhost_dev *dev, unsigned idx,
> >                       VhostShadowVirtqueue *svq)
> >   {
> > +    unsigned i;
> >       event_notifier_set_handler(&svq->svq_kick, NULL);
> > +    vhost_svq_flush(svq, false);
> > +
> > +    for (i =3D 0; i < svq->vring.num; ++i) {
> > +        g_autofree VirtQueueElement *elem =3D svq->ring_id_maps[i];
> > +        if (elem) {
> > +            virtqueue_detach_element(svq->vq, elem, elem->len);
> > +        }
> > +    }
> >   }
> >
> >   /*
> > @@ -248,7 +602,7 @@ VhostShadowVirtqueue *vhost_svq_new(struct vhost_de=
v *dev, int idx)
> >       size_t driver_size;
> >       size_t device_size;
> >       g_autofree VhostShadowVirtqueue *svq =3D g_new0(VhostShadowVirtqu=
eue, 1);
> > -    int r;
> > +    int r, i;
> >
> >       r =3D event_notifier_init(&svq->hdev_kick, 0);
> >       if (r !=3D 0) {
> > @@ -274,6 +628,11 @@ VhostShadowVirtqueue *vhost_svq_new(struct vhost_d=
ev *dev, int idx)
> >       memset(svq->vring.desc, 0, driver_size);
> >       svq->vring.used =3D qemu_memalign(qemu_real_host_page_size, devic=
e_size);
> >       memset(svq->vring.used, 0, device_size);
> > +    for (i =3D 0; i < num - 1; i++) {
> > +        svq->vring.desc[i].next =3D cpu_to_le16(i + 1);
> > +    }
> > +
> > +    svq->ring_id_maps =3D g_new0(VirtQueueElement *, num);
> >       event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call=
);
> >       return g_steal_pointer(&svq);
> >
> > @@ -292,6 +651,7 @@ void vhost_svq_free(VhostShadowVirtqueue *vq)
> >       event_notifier_cleanup(&vq->hdev_kick);
> >       event_notifier_set_handler(&vq->hdev_call, NULL);
> >       event_notifier_cleanup(&vq->hdev_call);
> > +    g_free(vq->ring_id_maps);
> >       qemu_vfree(vq->vring.desc);
> >       qemu_vfree(vq->vring.used);
> >       g_free(vq);
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index fc8396ba8a..e1c55e43e7 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -19,6 +19,7 @@
> >   #include "hw/virtio/virtio-net.h"
> >   #include "hw/virtio/vhost-shadow-virtqueue.h"
> >   #include "hw/virtio/vhost-vdpa.h"
> > +#include "hw/virtio/vhost-shadow-virtqueue.h"
> >   #include "exec/address-spaces.h"
> >   #include "qemu/main-loop.h"
> >   #include "cpu.h"
> > @@ -821,6 +822,19 @@ static bool  vhost_vdpa_force_iommu(struct vhost_d=
ev *dev)
> >       return true;
> >   }
> >
> > +static int vhost_vdpa_vring_pause(struct vhost_dev *dev)
> > +{
> > +    int r;
> > +    uint8_t status;
> > +
> > +    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DEVICE_STOPPED);
> > +    do {
> > +        r =3D vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
> > +    } while (r =3D=3D 0 && !(status & VIRTIO_CONFIG_S_DEVICE_STOPPED))=
;
> > +
> > +    return 0;
> > +}
> > +
> >   /*
> >    * Start or stop a shadow virtqueue in a vdpa device
> >    *
> > @@ -844,7 +858,14 @@ static bool vhost_vdpa_svq_start_vq(struct vhost_d=
ev *dev, unsigned idx,
> >           .index =3D vq_index,
> >       };
> >       struct vhost_vring_file vhost_call_file =3D {
> > -        .index =3D idx + dev->vq_index,
> > +        .index =3D vq_index,
> > +    };
> > +    struct vhost_vring_addr addr =3D {
> > +        .index =3D vq_index,
> > +    };
> > +    struct vhost_vring_state num =3D {
> > +        .index =3D vq_index,
> > +        .num =3D virtio_queue_get_num(dev->vdev, vq_index),
> >       };
> >       int r;
> >
> > @@ -852,6 +873,7 @@ static bool vhost_vdpa_svq_start_vq(struct vhost_de=
v *dev, unsigned idx,
> >           const EventNotifier *vhost_kick =3D vhost_svq_get_dev_kick_no=
tifier(svq);
> >           const EventNotifier *vhost_call =3D vhost_svq_get_svq_call_no=
tifier(svq);
> >
> > +        vhost_svq_get_vring_addr(svq, &addr);
> >           if (n->addr) {
> >               r =3D virtio_queue_set_host_notifier_mr(dev->vdev, idx, &=
n->mr,
> >                                                     false);
> > @@ -870,8 +892,20 @@ static bool vhost_vdpa_svq_start_vq(struct vhost_d=
ev *dev, unsigned idx,
> >           vhost_kick_file.fd =3D event_notifier_get_fd(vhost_kick);
> >           vhost_call_file.fd =3D event_notifier_get_fd(vhost_call);
> >       } else {
> > +        struct vhost_vring_state state =3D {
> > +            .index =3D vq_index,
> > +        };
> > +
> >           vhost_svq_stop(dev, idx, svq);
> >
> > +        state.num =3D virtio_queue_get_last_avail_idx(dev->vdev, idx);
> > +        r =3D vhost_vdpa_set_vring_base(dev, &state);
> > +        if (unlikely(r)) {
> > +            error_setg_errno(errp, -r, "vhost_set_vring_base failed");
> > +            return false;
> > +        }
> > +
> > +        vhost_vdpa_vq_get_addr(dev, &addr, &dev->vqs[idx]);
> >           if (n->addr) {
> >               r =3D virtio_queue_set_host_notifier_mr(dev->vdev, idx, &=
n->mr,
> >                                                     true);
> > @@ -885,6 +919,17 @@ static bool vhost_vdpa_svq_start_vq(struct vhost_d=
ev *dev, unsigned idx,
> >           vhost_call_file.fd =3D v->call_fd[idx];
> >       }
> >
> > +    r =3D vhost_vdpa_set_vring_addr(dev, &addr);
> > +    if (unlikely(r)) {
> > +        error_setg_errno(errp, -r, "vhost_set_vring_addr failed");
> > +        return false;
> > +    }
> > +    r =3D vhost_vdpa_set_vring_num(dev, &num);
> > +    if (unlikely(r)) {
> > +        error_setg_errno(errp, -r, "vhost_set_vring_num failed");
> > +        return false;
> > +    }
> > +
> >       r =3D vhost_vdpa_set_vring_dev_kick(dev, &vhost_kick_file);
> >       if (unlikely(r)) {
> >           error_setg_errno(errp, -r, "vhost_vdpa_set_vring_kick failed"=
);
> > @@ -899,6 +944,50 @@ static bool vhost_vdpa_svq_start_vq(struct vhost_d=
ev *dev, unsigned idx,
> >       return true;
> >   }
> >
> > +static void vhost_vdpa_get_vq_state(struct vhost_dev *dev, unsigned id=
x)
> > +{
> > +    struct VirtIODevice *vdev =3D dev->vdev;
> > +
> > +    virtio_queue_restore_last_avail_idx(vdev, idx);
> > +    virtio_queue_invalidate_signalled_used(vdev, idx);
> > +    virtio_queue_update_used_idx(vdev, idx);
> > +}
>
>
> Do we need to change vhost_vdpa_get_vring_base() to return
> vq->last_avail_idx as well?
>

Yes. To support things like a full reset of the device by the guest in
SVQ mode, we need to control a lot more: address, etc. I think it's
better to replace vhost_ops callbacks, as you proposed in previous
series.

They will be addressed in the next revision.

> Thanks
>


