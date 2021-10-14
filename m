Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE2542E09E
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 19:58:07 +0200 (CEST)
Received: from localhost ([::1]:48836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb4zW-0007cH-53
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 13:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mb4yF-0006tZ-Ho
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 13:56:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mb4yA-0001WZ-C9
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 13:56:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634234200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=obpgQcwOZGMElPb1j/f9grIyGz4w549qKaP/wJ3FoWs=;
 b=GJ8GnR6FrW/hesh5DfK5sdqFMIJrH9SZguEvKBKjcZS4MnF10lP6Tc4BAVXBfWN2PC2eC6
 Yw0DL6a2PaTCca9F+ObFPlIOhuQ66mAm8RRN5nC5+6VkAkdIu0LsWFJ8aY4nYiLNwY/X3F
 5NI517r4fY//g/LUd9Mdj7MWLjmjUGk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-1pSliNx6O_KKZhHBZ0viHA-1; Thu, 14 Oct 2021 13:56:39 -0400
X-MC-Unique: 1pSliNx6O_KKZhHBZ0viHA-1
Received: by mail-qk1-f200.google.com with SMTP id
 az37-20020a05620a172500b0045e43348ee8so4989411qkb.19
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 10:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=obpgQcwOZGMElPb1j/f9grIyGz4w549qKaP/wJ3FoWs=;
 b=FJQYnjdDBC3XpwMkqTxj5iO1tWXtoIR/UUVkR1YV2re1Af9FstDNzlah3ZZQSv8Wyt
 yW3GoQXj3mR4xNfYAFVWylc0UioElYQeGN5dmW7GUZW8Q4wu7UIItapZHiQ1XwX+tvJT
 sHI5DY53X9i2j2gLPJ84wdlpNQq5qTL8wNwv810NZ5/fM6HEPNsYnOz521tHTfvae7AU
 dinrCq3x3dAgE7skrJSAREHlPssrVgJ6HR/J90p3Ahlzu82rn99Tn/MZl634OyItG7f9
 D+B8eoux4dL1HDeWYmGJSKHOBhm52VkXyg10r0RH6JqXC+lPd+arI/b6NYB0kADj04qy
 B2ug==
X-Gm-Message-State: AOAM532qfOyHmgvwam47ihZt464eXbP0be5HzIXgLjs8y21IqVjH3nG1
 TWM2+Z86Zu5Z/HlpVBnwQ47q/JN/+PISNlxRh+qBg7HQs+3usEhAdNXBEkgixYveAYC4LR+k80n
 huGhZSm7pOzpJ58odVJDWtFJ5PKV7wF4=
X-Received: by 2002:a05:620a:4154:: with SMTP id
 k20mr6172606qko.316.1634234198281; 
 Thu, 14 Oct 2021 10:56:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHHTnwOeIxXWwFYUtnPeQRrPJkKAevq1Mnm4hJCqwf9dkQ9EusvZiXWe2v4FgvI2G6Hh1W6rhVcvqMXjZhuSw=
X-Received: by 2002:a05:620a:4154:: with SMTP id
 k20mr6172557qko.316.1634234197784; 
 Thu, 14 Oct 2021 10:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-16-eperezma@redhat.com>
 <a55ad3f5-09ef-b361-e690-1f8c9423fde3@redhat.com>
In-Reply-To: <a55ad3f5-09ef-b361-e690-1f8c9423fde3@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 14 Oct 2021 19:56:01 +0200
Message-ID: <CAJaqyWeaJyxh-tt45wxONzuOLhVt6wO48e2ufZZ3uECHTDofFw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 15/20] vhost: Shadow virtqueue buffers forwarding
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 6:31 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:05, Eugenio P=C3=A9rez =E5=86=99=
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
> > SVQ uses VIRTIO_CONFIG_S_DEVICE_STOPPED to pause the device and
> > retrieve its status (next available idx the device was going to
> > consume) race-free. It can later reset the device to replace vring
> > addresses etc. When SVQ starts qemu can resume consuming the guest's
> > driver ring from that state, without notice from the latter.
> >
> > This status bit VIRTIO_CONFIG_S_DEVICE_STOPPED is currently discussed
> > in VirtIO, and is implemented in qemu VirtIO-net devices in previous
> > commits.
> >
> > Removal of _S_DEVICE_STOPPED bit (in other words, resuming the device)
> > can be done in the future if an use case arises. At this moment we can
> > just rely on reseting the full device.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   qapi/net.json                      |   2 +-
> >   hw/virtio/vhost-shadow-virtqueue.c | 237 ++++++++++++++++++++++++++++=
-
> >   hw/virtio/vhost-vdpa.c             | 109 ++++++++++++-
> >   3 files changed, 337 insertions(+), 11 deletions(-)
> >
> > diff --git a/qapi/net.json b/qapi/net.json
> > index fe546b0e7c..1f4a55f2c5 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -86,7 +86,7 @@
> >   #
> >   # @name: the device name of the VirtIO device
> >   #
> > -# @enable: true to use the alternate shadow VQ notifications
> > +# @enable: true to use the alternate shadow VQ buffers fowarding path
> >   #
> >   # Returns: Error if failure, or 'no error' for success.
> >   #
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 34e159d4fd..df7e6fa3ec 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -10,6 +10,7 @@
> >   #include "qemu/osdep.h"
> >   #include "hw/virtio/vhost-shadow-virtqueue.h"
> >   #include "hw/virtio/vhost.h"
> > +#include "hw/virtio/virtio-access.h"
> >
> >   #include "standard-headers/linux/vhost_types.h"
> >
> > @@ -44,15 +45,135 @@ typedef struct VhostShadowVirtqueue {
> >
> >       /* Virtio device */
> >       VirtIODevice *vdev;
> > +
> > +    /* Map for returning guest's descriptors */
> > +    VirtQueueElement **ring_id_maps;
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
> > +    uint16_t used_idx;
>
>
> Let's use "last_used_idx" as kernel driver did.
>

Ok I will change it.

>
> >   } VhostShadowVirtqueue;
> >
> >   /* If the device is using some of these, SVQ cannot communicate */
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
> > +            /* SVQ is fine with this feature */
> > +            continue;
> > +
> > +        case VIRTIO_F_ACCESS_PLATFORM:
> > +            /* SVQ needs this feature disabled. Can't continue */
>
>
> So code can explain itself, need a comment to explain why.
>

Do you mean that it *doesn't* need a comment to explain why? In that
case I will delete them.

>
> > +            if (*dev_features & BIT_ULL(b)) {
> > +                clear_bit(b, dev_features);
> > +                r =3D false;
> > +            }
> > +            break;
> > +
> > +        case VIRTIO_F_VERSION_1:
> > +            /* SVQ needs this feature, so can't continue */
>
>
> A comment to explain why SVQ needs this feature.
>

Sure I will add it.

>
> > +            if (!(*dev_features & BIT_ULL(b))) {
> > +                set_bit(b, dev_features);
> > +                r =3D false;
> > +            }
> > +            continue;
> > +
> > +        default:
> > +            /*
> > +             * SVQ must disable this feature, let's hope the device is=
 fine
> > +             * without it.
> > +             */
> > +            if (*dev_features & BIT_ULL(b)) {
> > +                clear_bit(b, dev_features);
> > +            }
> > +        }
> > +    }
> > +
> > +    return r;
> > +}
>
>
> Let's move this to patch 14.
>

I can move it down to 14/20, but then it is not really accurate, since
notifications forwarding can work with all feature sets. Not like we
are introducing a regression, but still.

I can always explain that in the patch message though, would that be ok?

>
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
> > +    avail->idx =3D cpu_to_le16(svq->avail_idx_shadow);
> > +
> > +    return head;
> > +
> >   }
> >
> > -/* Forward guest notifications */
> > +static void vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElement =
*elem)
> > +{
> > +    unsigned qemu_head =3D vhost_svq_add_split(svq, elem);
> > +
> > +    svq->ring_id_maps[qemu_head] =3D elem;
> > +}
> > +
> > +/* Handle guest->device notifications */
> >   static void vhost_handle_guest_kick(EventNotifier *n)
> >   {
> >       VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowVirtqueu=
e,
> > @@ -62,7 +183,74 @@ static void vhost_handle_guest_kick(EventNotifier *=
n)
> >           return;
> >       }
> >
> > -    event_notifier_set(&svq->kick_notifier);
> > +    /* Make available as many buffers as possible */
> > +    do {
> > +        if (virtio_queue_get_notification(svq->vq)) {
> > +            /* No more notifications until process all available */
> > +            virtio_queue_set_notification(svq->vq, false);
> > +        }
>
>
> This can be done outside the loop.
>

I think it cannot. The intention of doing this way is that we check
for new available buffers *also after* enabling notifications, so we
don't miss any of them. It is more or less copied from
virtio_blk_handle_vq, which also needs to run to completion.

If we need to loop again because there are more available buffers, we
want to disable notifications again. Or am I missing something?

>
> > +
> > +        while (true) {
> > +            VirtQueueElement *elem =3D virtqueue_pop(svq->vq, sizeof(*=
elem));
> > +            if (!elem) {
> > +                break;
> > +            }
> > +
> > +            vhost_svq_add(svq, elem);
> > +            event_notifier_set(&svq->kick_notifier);
> > +        }
> > +
> > +        virtio_queue_set_notification(svq->vq, true);
>
>
> I think this can be moved to the end of this function.
>

(Same as previous answer)

> Btw, we probably need a quota to make sure the svq is not hogging the
> main event loop.
>
> Similar issue could be found in both virtio-net TX (using timer or bh)
> and TAP (a quota).
>

I think that virtqueue size is the natural limit to that: since we are
not making any buffers used in the loop, there is no way that it runs
more than virtqueue size times. If it does because of an evil/bogus
guest, virtqueue_pop raises the message "Virtqueue size exceeded" and
returns NULL, effectively breaking the loop.

Virtio-net tx functions mark each buffer right after making them
available and use it, so they can hog BQL. But my understanding is
that is not possible in the SVQ case.

I can add a comment in the code to make it clearer though.

>
> > +    } while (!virtio_queue_empty(svq->vq));
> > +}
> > +
> > +static bool vhost_svq_more_used(VhostShadowVirtqueue *svq)
> > +{
> > +    if (svq->used_idx !=3D svq->shadow_used_idx) {
> > +        return true;
> > +    }
> > +
> > +    /* Get used idx must not be reordered */
> > +    smp_rmb();
>
>
> Interesting, we don't do this for kernel drivers. It would be helpful to
> explain it more clear by "X must be done before Y".
>

I think this got reordered, it's supposed to be *after* get the used
idx, so it matches the one in the kernel with the comment "Only get
used array entries after they have been exposed by host.".

I will change it for the next series.

>
> > +    svq->shadow_used_idx =3D cpu_to_le16(svq->vring.used->idx);
> > +
> > +    return svq->used_idx !=3D svq->shadow_used_idx;
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
> > +    last_used =3D svq->used_idx & (svq->vring.num - 1);
> > +    used_elem.id =3D le32_to_cpu(used->ring[last_used].id);
> > +    used_elem.len =3D le32_to_cpu(used->ring[last_used].len);
> > +
> > +    svq->used_idx++;
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
> >   /* Forward vhost notifications */
> > @@ -70,8 +258,26 @@ static void vhost_svq_handle_call_no_test(EventNoti=
fier *n)
> >   {
> >       VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowVirtqueu=
e,
> >                                                call_notifier);
> > -
> > -    event_notifier_set(&svq->guest_call_notifier);
> > +    VirtQueue *vq =3D svq->vq;
> > +
> > +    /* Make as many buffers as possible used. */
> > +    do {
> > +        unsigned i =3D 0;
> > +
> > +        /* TODO: Use VRING_AVAIL_F_NO_INTERRUPT */
> > +        while (true) {
> > +            g_autofree VirtQueueElement *elem =3D vhost_svq_get_buf(sv=
q);
> > +            if (!elem) {
> > +                break;
> > +            }
> > +
> > +            assert(i < svq->vring.num);
>
>
> Let's return error instead of using the assert.
>

Actually this is a condition that we should never meet: In the case of
ring overrun, device would try to set used a descriptor that is either
> vring size *or* should try to overrun some of the already used ones.
In both cases, elem should be NULL and the loop should break.

So this is a safety net protecting from both, if we have an i >
svq->vring.num means we are not processing used buffers well anymore,
and (moreover) this is happening after making used all descriptors.

Taking that into account, should we delete it?

>
> > +            virtqueue_fill(vq, elem, elem->len, i++);
> > +        }
> > +
> > +        virtqueue_flush(vq, i);
> > +        event_notifier_set(&svq->guest_call_notifier);
> > +    } while (vhost_svq_more_used(svq));
> >   }
> >
> >   static void vhost_svq_handle_call(EventNotifier *n)
> > @@ -204,12 +410,25 @@ err_set_vring_kick:
> >   void vhost_svq_stop(struct vhost_dev *dev, unsigned idx,
> >                       VhostShadowVirtqueue *svq)
> >   {
> > +    int i;
> >       int r =3D vhost_svq_restore_vdev_host_notifier(dev, idx, svq);
> > +
> >       if (unlikely(r < 0)) {
> >           error_report("Couldn't restore vq kick fd: %s", strerror(-r))=
;
> >       }
> >
> >       event_notifier_set_handler(&svq->host_notifier, NULL);
> > +
> > +    for (i =3D 0; i < svq->vring.num; ++i) {
> > +        g_autofree VirtQueueElement *elem =3D svq->ring_id_maps[i];
> > +        /*
> > +         * Although the doc says we must unpop in order, it's ok to un=
pop
> > +         * everything.
> > +         */
> > +        if (elem) {
> > +            virtqueue_unpop(svq->vq, elem, elem->len);
> > +        }
>
>
> Will this result some of the "pending" buffers to be submitted multiple
> times? If yes, should we wait for all the buffers used instead of doing
> the unpop here?
>

Do you mean to call virtqueue_unpop with the same elem (or elem.id)
multiple times? That should never happen, because elem.id should be
the position in the ring_id_maps. Also, unpop() should just unmap the
element and never sync again.

Maybe it is way clearer to call virtqueue_detach_element here directly.

>
> > +    }
> >   }
> >
> >   /*
> > @@ -224,7 +443,7 @@ VhostShadowVirtqueue *vhost_svq_new(struct vhost_de=
v *dev, int idx)
> >       size_t driver_size;
> >       size_t device_size;
> >       g_autofree VhostShadowVirtqueue *svq =3D g_new0(VhostShadowVirtqu=
eue, 1);
> > -    int r;
> > +    int r, i;
> >
> >       r =3D event_notifier_init(&svq->kick_notifier, 0);
> >       if (r !=3D 0) {
> > @@ -250,6 +469,11 @@ VhostShadowVirtqueue *vhost_svq_new(struct vhost_d=
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
> >       event_notifier_set_handler(&svq->call_notifier,
> >                                  vhost_svq_handle_call);
> >       return g_steal_pointer(&svq);
> > @@ -269,6 +493,7 @@ void vhost_svq_free(VhostShadowVirtqueue *vq)
> >       event_notifier_cleanup(&vq->kick_notifier);
> >       event_notifier_set_handler(&vq->call_notifier, NULL);
> >       event_notifier_cleanup(&vq->call_notifier);
> > +    g_free(vq->ring_id_maps);
> >       qemu_vfree(vq->vring.desc);
> >       qemu_vfree(vq->vring.used);
> >       g_free(vq);
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index a057e8277d..bb7010ddb5 100644
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
> > @@ -475,6 +476,28 @@ static int vhost_vdpa_set_features(struct vhost_de=
v *dev,
> >       return vhost_vdpa_backend_set_features(dev, features);
> >   }
> >
> > +/**
> > + * Restore guest features to vdpa device
> > + */
> > +static int vhost_vdpa_set_guest_features(struct vhost_dev *dev)
> > +{
> > +    struct vhost_vdpa *v =3D dev->opaque;
> > +    return vhost_vdpa_backend_set_features(dev, v->guest_features);
> > +}
> > +
> > +/**
> > + * Set shadow virtqueue supported features
> > + */
> > +static int vhost_vdpa_set_svq_features(struct vhost_dev *dev)
> > +{
> > +    struct vhost_vdpa *v =3D dev->opaque;
> > +    uint64_t features =3D v->host_features;
> > +    bool b =3D vhost_svq_valid_device_features(&features);
> > +    assert(b);
> > +
> > +    return vhost_vdpa_backend_set_features(dev, features);
> > +}
> > +
> >   static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
> >   {
> >       uint64_t features;
> > @@ -730,6 +753,19 @@ static bool  vhost_vdpa_force_iommu(struct vhost_d=
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
>
>
> I guess we'd better add some sleep here.
>

If the final version still contains the call, I will add the sleep. At
the moment I think it's better if we stop the device by a vdpa ioctl.

>
> > +    } while (r =3D=3D 0 && !(status & VIRTIO_CONFIG_S_DEVICE_STOPPED))=
;
> > +
> > +    return 0;
> > +}
> > +
> >   /*
> >    * Start shadow virtqueue.
> >    */
> > @@ -742,9 +778,29 @@ static bool vhost_vdpa_svq_start_vq(struct vhost_d=
ev *dev, unsigned idx)
> >           .index =3D idx + dev->vq_index,
> >           .fd =3D event_notifier_get_fd(vhost_call_notifier),
> >       };
> > +    struct vhost_vring_addr addr =3D {
> > +        .index =3D idx + dev->vq_index,
> > +    };
> > +    struct vhost_vring_state num =3D {
> > +        .index =3D idx + dev->vq_index,
> > +        .num =3D virtio_queue_get_num(dev->vdev, idx),
> > +    };
> >       int r;
> >       bool b;
> >
> > +    vhost_svq_get_vring_addr(svq, &addr);
> > +    r =3D vhost_vdpa_set_vring_addr(dev, &addr);
> > +    if (unlikely(r)) {
> > +        error_report("vhost_set_vring_addr for shadow vq failed");
> > +        return false;
> > +    }
> > +
> > +    r =3D vhost_vdpa_set_vring_num(dev, &num);
> > +    if (unlikely(r)) {
> > +        error_report("vhost_vdpa_set_vring_num for shadow vq failed");
> > +        return false;
> > +    }
> > +
> >       /* Set shadow vq -> guest notifier */
> >       assert(v->call_fd[idx]);
> >       vhost_svq_set_guest_call_notifier(svq, v->call_fd[idx]);
> > @@ -781,15 +837,32 @@ static unsigned vhost_vdpa_enable_svq(struct vhos=
t_vdpa *v, bool enable)
> >           assert(v->shadow_vqs->len =3D=3D 0);
> >           for (n =3D 0; n < hdev->nvqs; ++n) {
> >               VhostShadowVirtqueue *svq =3D vhost_svq_new(hdev, n);
> > -            bool ok;
> > -
> >               if (unlikely(!svq)) {
> >                   g_ptr_array_set_size(v->shadow_vqs, 0);
> >                   return 0;
> >               }
> >               g_ptr_array_add(v->shadow_vqs, svq);
> > +        }
> > +    }
> >
> > -            ok =3D vhost_vdpa_svq_start_vq(hdev, n);
> > +    r =3D vhost_vdpa_vring_pause(hdev);
> > +    assert(r =3D=3D 0);
> > +
> > +    if (enable) {
> > +        for (n =3D 0; n < v->shadow_vqs->len; ++n) {
> > +            /* Obtain Virtqueue state */
> > +            vhost_virtqueue_stop(hdev, hdev->vdev, &hdev->vqs[n], n);
> > +        }
> > +    }
> > +
> > +    /* Reset device so it can be configured */
> > +    r =3D vhost_vdpa_dev_start(hdev, false);
> > +    assert(r =3D=3D 0);
> > +
> > +    if (enable) {
> > +        int r;
> > +        for (n =3D 0; n < v->shadow_vqs->len; ++n) {
> > +            bool ok =3D vhost_vdpa_svq_start_vq(hdev, n);
> >               if (unlikely(!ok)) {
> >                   /* Free still not started svqs */
> >                   g_ptr_array_set_size(v->shadow_vqs, n);
> > @@ -797,11 +870,19 @@ static unsigned vhost_vdpa_enable_svq(struct vhos=
t_vdpa *v, bool enable)
> >                   break;
> >               }
> >           }
> > +
> > +        /* Need to ack features to set state in vp_vdpa devices */
>
>
> vhost_vdpa actually?
>

Yes, what a mistake!

>
> > +        r =3D vhost_vdpa_set_svq_features(hdev);
> > +        if (unlikely(r)) {
> > +            enable =3D false;
> > +        }
> >       }
> >
> >       v->shadow_vqs_enabled =3D enable;
> >
> >       if (!enable) {
> > +        vhost_vdpa_set_guest_features(hdev);
> > +
> >           /* Disable all queues or clean up failed start */
> >           for (n =3D 0; n < v->shadow_vqs->len; ++n) {
> >               struct vhost_vring_file file =3D {
> > @@ -818,7 +899,12 @@ static unsigned vhost_vdpa_enable_svq(struct vhost=
_vdpa *v, bool enable)
> >               /* TODO: This can unmask or override call fd! */
> >               vhost_virtqueue_start(hdev, hdev->vdev, &hdev->vqs[n], vq=
_idx);
> >           }
> > +    }
> >
> > +    r =3D vhost_vdpa_dev_start(hdev, true);
> > +    assert(r =3D=3D 0);
> > +
> > +    if (!enable) {
> >           /* Resources cleanup */
> >           g_ptr_array_set_size(v->shadow_vqs, 0);
> >       }
> > @@ -831,6 +917,7 @@ void qmp_x_vhost_enable_shadow_vq(const char *name,=
 bool enable, Error **errp)
> >       struct vhost_vdpa *v;
> >       const char *err_cause =3D NULL;
> >       bool r;
> > +    uint64_t svq_features;
> >
> >       QLIST_FOREACH(v, &vhost_vdpa_devices, entry) {
> >           if (v->dev->vdev && 0 =3D=3D strcmp(v->dev->vdev->name, name)=
) {
> > @@ -846,6 +933,20 @@ void qmp_x_vhost_enable_shadow_vq(const char *name=
, bool enable, Error **errp)
> >           goto err;
> >       }
> >
> > +    svq_features =3D v->host_features;
> > +    if (!vhost_svq_valid_device_features(&svq_features)) {
> > +        error_setg(errp,
> > +            "Can't enable shadow vq on %s: Unexpected feature flags (%=
lx-%lx)",
> > +            name, v->host_features, svq_features);
> > +        return;
> > +    } else {
> > +        /* TODO: Check for virtio_vdpa + IOMMU & modern device */
>
>
> I guess you mean "vhost_vdpa" here.

Yes, a similar mistake in less than 50 lines :).

> For IOMMU, I guess you mean "vIOMMU"
> actually?
>

This comment is out of date and inherited from the vhost version,
where only the IOMMU version was developed, so it will be deleted in
the next series. I think it makes little sense to check vIOMMU if we
stick with vDPA since it still does not support it, but we could make
the check here for sure.

Thanks!

> Thanks
>
>
> > +    }
> > +
> > +    if (err_cause) {
> > +        goto err;
> > +    }
> > +
> >       r =3D vhost_vdpa_enable_svq(v, enable);
> >       if (unlikely(!r)) {
> >           err_cause =3D "Error enabling (see monitor)";
> > @@ -853,7 +954,7 @@ void qmp_x_vhost_enable_shadow_vq(const char *name,=
 bool enable, Error **errp)
> >       }
> >
> >   err:
> > -    if (err_cause) {
> > +    if (errp =3D=3D NULL && err_cause) {
> >           error_setg(errp, "Can't enable shadow vq on %s: %s", name, er=
r_cause);
> >       }
> >   }
>


