Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7596442EE34
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:56:23 +0200 (CEST)
Received: from localhost ([::1]:40116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJws-0003GA-JA
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mbJbP-0008Fa-Pn
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:34:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mbJbI-0008Dt-Ea
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:34:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634290443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J1/XXgL6lXS58rgbKjSXrHAPPnQ4ZVuXPVPaX4X7dUI=;
 b=G9EAU9MVjqFWSxElNwxreflW4JNMKR8IHjsfKlI4JZnUGNDTsic4puw3baRajAJzsYbjiZ
 7lcrvS70/Kn+7NNEwqf76NaT4g3GPnhH5cKzNftH4+uCIGC9lY6hxOLAt9c5O5/Dv+ok0O
 OYvKv+NWPqO/sv5yqUmnboVDn2HYW4E=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-iZ1xQHKBP-u8hylRfKOtPA-1; Fri, 15 Oct 2021 05:34:01 -0400
X-MC-Unique: iZ1xQHKBP-u8hylRfKOtPA-1
Received: by mail-qt1-f198.google.com with SMTP id
 w12-20020ac80ecc000000b002a7a4cd22faso3135740qti.4
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 02:34:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J1/XXgL6lXS58rgbKjSXrHAPPnQ4ZVuXPVPaX4X7dUI=;
 b=CP2y3i9/PmlE1bUIx3FMdxPrk6rzwS/En88R8xGENQ0fODWAcluugAZggn1BvW8scj
 419PemWUYMgKh4UYfdZGi6DlkWhavIWOyUxroinYUX7cN8NYRUzo9TjAVOYB6TTkntK+
 Y1UREEHa+/1rVPb/9ToyONGRryV+Rm9q/uOu6hEGCF1LxoFelLz0ZZKVpDOZESkuBbGk
 bwyvJJ29maXH7wDObkWaBcziPV3Rk5TBds60b5hndAAFiJ+walmp9P6Z1Z4QWQxCJAns
 SJEaBdYNScpNG3wySzD5lYXbGda+I5AtVsfDnYYAyWI260UUfOQSAly1DCFG/fIHREQu
 F4bg==
X-Gm-Message-State: AOAM530bWZh31IMPSdcfV5tFb/LPveMfaigr7JtQ6SZ65M6F8JDzTlQt
 kXLdXHOixH/ophE01t2WHt0ABdVZbRTonQurmZfeB3Uu7EI5gTXV1ZLNdWLq47lViK7D8Tdonr7
 xfwhRNAk7d+TB+PHwbnykQtX6YNG4pxc=
X-Received: by 2002:ac8:5f90:: with SMTP id j16mr12306315qta.175.1634290440319; 
 Fri, 15 Oct 2021 02:34:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIkZn5APTWxSkbekbZK7BTps4euG4dSwgIuVcPYDrSidUPPNDixzQkpXKLT++vRs6VyNw4GN65fJp7eHr5yGA=
X-Received: by 2002:ac8:5f90:: with SMTP id j16mr12306269qta.175.1634290439798; 
 Fri, 15 Oct 2021 02:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-16-eperezma@redhat.com>
 <a55ad3f5-09ef-b361-e690-1f8c9423fde3@redhat.com>
 <CAJaqyWeaJyxh-tt45wxONzuOLhVt6wO48e2ufZZ3uECHTDofFw@mail.gmail.com>
 <c728a2bf-6cde-ccdc-e1a1-3928a48b7deb@redhat.com>
In-Reply-To: <c728a2bf-6cde-ccdc-e1a1-3928a48b7deb@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 15 Oct 2021 11:33:23 +0200
Message-ID: <CAJaqyWes8TB++Jkz2UfCSPG-XU8dQLBA0OOiO6MaYfguMnyZZA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 15/20] vhost: Shadow virtqueue buffers forwarding
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Oct 15, 2021 at 6:23 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/10/15 =E4=B8=8A=E5=8D=881:56, Eugenio Perez Martin =E5=86=
=99=E9=81=93:
> > On Wed, Oct 13, 2021 at 6:31 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:05, Eugenio P=C3=A9rez =E5=86=
=99=E9=81=93:
> >>> Initial version of shadow virtqueue that actually forward buffers. Th=
ere
> >>> are no iommu support at the moment, and that will be addressed in fut=
ure
> >>> patches of this series. Since all vhost-vdpa devices uses forced IOMM=
U,
> >>> this means that SVQ is not usable at this point of the series on any
> >>> device.
> >>>
> >>> For simplicity it only supports modern devices, that expects vring
> >>> in little endian, with split ring and no event idx or indirect
> >>> descriptors. Support for them will not be added in this series.
> >>>
> >>> It reuses the VirtQueue code for the device part. The driver part is
> >>> based on Linux's virtio_ring driver, but with stripped functionality
> >>> and optimizations so it's easier to review. Later commits add simpler
> >>> ones.
> >>>
> >>> SVQ uses VIRTIO_CONFIG_S_DEVICE_STOPPED to pause the device and
> >>> retrieve its status (next available idx the device was going to
> >>> consume) race-free. It can later reset the device to replace vring
> >>> addresses etc. When SVQ starts qemu can resume consuming the guest's
> >>> driver ring from that state, without notice from the latter.
> >>>
> >>> This status bit VIRTIO_CONFIG_S_DEVICE_STOPPED is currently discussed
> >>> in VirtIO, and is implemented in qemu VirtIO-net devices in previous
> >>> commits.
> >>>
> >>> Removal of _S_DEVICE_STOPPED bit (in other words, resuming the device=
)
> >>> can be done in the future if an use case arises. At this moment we ca=
n
> >>> just rely on reseting the full device.
> >>>
> >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>> ---
> >>>    qapi/net.json                      |   2 +-
> >>>    hw/virtio/vhost-shadow-virtqueue.c | 237 +++++++++++++++++++++++++=
+++-
> >>>    hw/virtio/vhost-vdpa.c             | 109 ++++++++++++-
> >>>    3 files changed, 337 insertions(+), 11 deletions(-)
> >>>
> >>> diff --git a/qapi/net.json b/qapi/net.json
> >>> index fe546b0e7c..1f4a55f2c5 100644
> >>> --- a/qapi/net.json
> >>> +++ b/qapi/net.json
> >>> @@ -86,7 +86,7 @@
> >>>    #
> >>>    # @name: the device name of the VirtIO device
> >>>    #
> >>> -# @enable: true to use the alternate shadow VQ notifications
> >>> +# @enable: true to use the alternate shadow VQ buffers fowarding pat=
h
> >>>    #
> >>>    # Returns: Error if failure, or 'no error' for success.
> >>>    #
> >>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-sha=
dow-virtqueue.c
> >>> index 34e159d4fd..df7e6fa3ec 100644
> >>> --- a/hw/virtio/vhost-shadow-virtqueue.c
> >>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> >>> @@ -10,6 +10,7 @@
> >>>    #include "qemu/osdep.h"
> >>>    #include "hw/virtio/vhost-shadow-virtqueue.h"
> >>>    #include "hw/virtio/vhost.h"
> >>> +#include "hw/virtio/virtio-access.h"
> >>>
> >>>    #include "standard-headers/linux/vhost_types.h"
> >>>
> >>> @@ -44,15 +45,135 @@ typedef struct VhostShadowVirtqueue {
> >>>
> >>>        /* Virtio device */
> >>>        VirtIODevice *vdev;
> >>> +
> >>> +    /* Map for returning guest's descriptors */
> >>> +    VirtQueueElement **ring_id_maps;
> >>> +
> >>> +    /* Next head to expose to device */
> >>> +    uint16_t avail_idx_shadow;
> >>> +
> >>> +    /* Next free descriptor */
> >>> +    uint16_t free_head;
> >>> +
> >>> +    /* Last seen used idx */
> >>> +    uint16_t shadow_used_idx;
> >>> +
> >>> +    /* Next head to consume from device */
> >>> +    uint16_t used_idx;
> >>
> >> Let's use "last_used_idx" as kernel driver did.
> >>
> > Ok I will change it.
> >
> >>>    } VhostShadowVirtqueue;
> >>>
> >>>    /* If the device is using some of these, SVQ cannot communicate */
> >>>    bool vhost_svq_valid_device_features(uint64_t *dev_features)
> >>>    {
> >>> -    return true;
> >>> +    uint64_t b;
> >>> +    bool r =3D true;
> >>> +
> >>> +    for (b =3D VIRTIO_TRANSPORT_F_START; b <=3D VIRTIO_TRANSPORT_F_E=
ND; ++b) {
> >>> +        switch (b) {
> >>> +        case VIRTIO_F_NOTIFY_ON_EMPTY:
> >>> +        case VIRTIO_F_ANY_LAYOUT:
> >>> +            /* SVQ is fine with this feature */
> >>> +            continue;
> >>> +
> >>> +        case VIRTIO_F_ACCESS_PLATFORM:
> >>> +            /* SVQ needs this feature disabled. Can't continue */
> >>
> >> So code can explain itself, need a comment to explain why.
> >>
> > Do you mean that it *doesn't* need a comment to explain why? In that
> > case I will delete them.
>
>
> I meant the comment is duplicated with the code. If you wish, you can
> explain why ACCESS_PLATFORM needs to be disabled.
>

Got it, I will do something about it.

>
> >
> >>> +            if (*dev_features & BIT_ULL(b)) {
> >>> +                clear_bit(b, dev_features);
> >>> +                r =3D false;
> >>> +            }
> >>> +            break;
> >>> +
> >>> +        case VIRTIO_F_VERSION_1:
> >>> +            /* SVQ needs this feature, so can't continue */
> >>
> >> A comment to explain why SVQ needs this feature.
> >>
> > Sure I will add it.
> >
> >>> +            if (!(*dev_features & BIT_ULL(b))) {
> >>> +                set_bit(b, dev_features);
> >>> +                r =3D false;
> >>> +            }
> >>> +            continue;
> >>> +
> >>> +        default:
> >>> +            /*
> >>> +             * SVQ must disable this feature, let's hope the device =
is fine
> >>> +             * without it.
> >>> +             */
> >>> +            if (*dev_features & BIT_ULL(b)) {
> >>> +                clear_bit(b, dev_features);
> >>> +            }
> >>> +        }
> >>> +    }
> >>> +
> >>> +    return r;
> >>> +}
> >>
> >> Let's move this to patch 14.
> >>
> > I can move it down to 14/20, but then it is not really accurate, since
> > notifications forwarding can work with all feature sets. Not like we
> > are introducing a regression, but still.
> >
> > I can always explain that in the patch message though, would that be ok=
?
>
>
> I'm afraid this will break bisection. E.g for patch 14, it works for any
> features but for patch 15 it doesn't.
>

So no moving them? :).

>
> >
> >>> +
> >>> +static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
> >>> +                                    const struct iovec *iovec,
> >>> +                                    size_t num, bool more_descs, boo=
l write)
> >>> +{
> >>> +    uint16_t i =3D svq->free_head, last =3D svq->free_head;
> >>> +    unsigned n;
> >>> +    uint16_t flags =3D write ? cpu_to_le16(VRING_DESC_F_WRITE) : 0;
> >>> +    vring_desc_t *descs =3D svq->vring.desc;
> >>> +
> >>> +    if (num =3D=3D 0) {
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    for (n =3D 0; n < num; n++) {
> >>> +        if (more_descs || (n + 1 < num)) {
> >>> +            descs[i].flags =3D flags | cpu_to_le16(VRING_DESC_F_NEXT=
);
> >>> +        } else {
> >>> +            descs[i].flags =3D flags;
> >>> +        }
> >>> +        descs[i].addr =3D cpu_to_le64((hwaddr)iovec[n].iov_base);
> >>> +        descs[i].len =3D cpu_to_le32(iovec[n].iov_len);
> >>> +
> >>> +        last =3D i;
> >>> +        i =3D cpu_to_le16(descs[i].next);
> >>> +    }
> >>> +
> >>> +    svq->free_head =3D le16_to_cpu(descs[last].next);
> >>> +}
> >>> +
> >>> +static unsigned vhost_svq_add_split(VhostShadowVirtqueue *svq,
> >>> +                                    VirtQueueElement *elem)
> >>> +{
> >>> +    int head;
> >>> +    unsigned avail_idx;
> >>> +    vring_avail_t *avail =3D svq->vring.avail;
> >>> +
> >>> +    head =3D svq->free_head;
> >>> +
> >>> +    /* We need some descriptors here */
> >>> +    assert(elem->out_num || elem->in_num);
> >>> +
> >>> +    vhost_vring_write_descs(svq, elem->out_sg, elem->out_num,
> >>> +                            elem->in_num > 0, false);
> >>> +    vhost_vring_write_descs(svq, elem->in_sg, elem->in_num, false, t=
rue);
> >>> +
> >>> +    /*
> >>> +     * Put entry in available array (but don't update avail->idx unt=
il they
> >>> +     * do sync).
> >>> +     */
> >>> +    avail_idx =3D svq->avail_idx_shadow & (svq->vring.num - 1);
> >>> +    avail->ring[avail_idx] =3D cpu_to_le16(head);
> >>> +    svq->avail_idx_shadow++;
> >>> +
> >>> +    /* Update avail index after the descriptor is wrote */
> >>> +    smp_wmb();
> >>> +    avail->idx =3D cpu_to_le16(svq->avail_idx_shadow);
> >>> +
> >>> +    return head;
> >>> +
> >>>    }
> >>>
> >>> -/* Forward guest notifications */
> >>> +static void vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElemen=
t *elem)
> >>> +{
> >>> +    unsigned qemu_head =3D vhost_svq_add_split(svq, elem);
> >>> +
> >>> +    svq->ring_id_maps[qemu_head] =3D elem;
> >>> +}
> >>> +
> >>> +/* Handle guest->device notifications */
> >>>    static void vhost_handle_guest_kick(EventNotifier *n)
> >>>    {
> >>>        VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowVirtq=
ueue,
> >>> @@ -62,7 +183,74 @@ static void vhost_handle_guest_kick(EventNotifier=
 *n)
> >>>            return;
> >>>        }
> >>>
> >>> -    event_notifier_set(&svq->kick_notifier);
> >>> +    /* Make available as many buffers as possible */
> >>> +    do {
> >>> +        if (virtio_queue_get_notification(svq->vq)) {
> >>> +            /* No more notifications until process all available */
> >>> +            virtio_queue_set_notification(svq->vq, false);
> >>> +        }
> >>
> >> This can be done outside the loop.
> >>
> > I think it cannot. The intention of doing this way is that we check
> > for new available buffers *also after* enabling notifications, so we
> > don't miss any of them. It is more or less copied from
> > virtio_blk_handle_vq, which also needs to run to completion.
> >
> > If we need to loop again because there are more available buffers, we
> > want to disable notifications again. Or am I missing something?
>
>
> I think you're right.
>
>
> >
> >>> +
> >>> +        while (true) {
> >>> +            VirtQueueElement *elem =3D virtqueue_pop(svq->vq, sizeof=
(*elem));
> >>> +            if (!elem) {
> >>> +                break;
> >>> +            }
> >>> +
> >>> +            vhost_svq_add(svq, elem);
> >>> +            event_notifier_set(&svq->kick_notifier);
> >>> +        }
> >>> +
> >>> +        virtio_queue_set_notification(svq->vq, true);
> >>
> >> I think this can be moved to the end of this function.
> >>
> > (Same as previous answer)
> >
> >> Btw, we probably need a quota to make sure the svq is not hogging the
> >> main event loop.
> >>
> >> Similar issue could be found in both virtio-net TX (using timer or bh)
> >> and TAP (a quota).
> >>
> > I think that virtqueue size is the natural limit to that: since we are
> > not making any buffers used in the loop, there is no way that it runs
> > more than virtqueue size times. If it does because of an evil/bogus
> > guest, virtqueue_pop raises the message "Virtqueue size exceeded" and
> > returns NULL, effectively breaking the loop.
> >
> > Virtio-net tx functions mark each buffer right after making them
> > available and use it, so they can hog BQL. But my understanding is
> > that is not possible in the SVQ case.
>
>
> Right.
>
>
> >
> > I can add a comment in the code to make it clearer though.
>
>
> Yes, please.
>

Ok I will add the comment.

>
> >
> >>> +    } while (!virtio_queue_empty(svq->vq));
> >>> +}
> >>> +
> >>> +static bool vhost_svq_more_used(VhostShadowVirtqueue *svq)
> >>> +{
> >>> +    if (svq->used_idx !=3D svq->shadow_used_idx) {
> >>> +        return true;
> >>> +    }
> >>> +
> >>> +    /* Get used idx must not be reordered */
> >>> +    smp_rmb();
> >>
> >> Interesting, we don't do this for kernel drivers. It would be helpful =
to
> >> explain it more clear by "X must be done before Y".
> >>
> > I think this got reordered, it's supposed to be *after* get the used
> > idx, so it matches the one in the kernel with the comment "Only get
> > used array entries after they have been exposed by host.".
>
>
> Right.
>
>
> >
> > I will change it for the next series.
>
>
> Ok.
>
>
> >
> >>> +    svq->shadow_used_idx =3D cpu_to_le16(svq->vring.used->idx);
> >>> +
> >>> +    return svq->used_idx !=3D svq->shadow_used_idx;
> >>> +}
> >>> +
> >>> +static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq=
)
> >>> +{
> >>> +    vring_desc_t *descs =3D svq->vring.desc;
> >>> +    const vring_used_t *used =3D svq->vring.used;
> >>> +    vring_used_elem_t used_elem;
> >>> +    uint16_t last_used;
> >>> +
> >>> +    if (!vhost_svq_more_used(svq)) {
> >>> +        return NULL;
> >>> +    }
> >>> +
> >>> +    last_used =3D svq->used_idx & (svq->vring.num - 1);
> >>> +    used_elem.id =3D le32_to_cpu(used->ring[last_used].id);
> >>> +    used_elem.len =3D le32_to_cpu(used->ring[last_used].len);
> >>> +
> >>> +    svq->used_idx++;
> >>> +    if (unlikely(used_elem.id >=3D svq->vring.num)) {
> >>> +        error_report("Device %s says index %u is used", svq->vdev->n=
ame,
> >>> +                     used_elem.id);
> >>> +        return NULL;
> >>> +    }
> >>> +
> >>> +    if (unlikely(!svq->ring_id_maps[used_elem.id])) {
> >>> +        error_report(
> >>> +            "Device %s says index %u is used, but it was not availab=
le",
> >>> +            svq->vdev->name, used_elem.id);
> >>> +        return NULL;
> >>> +    }
> >>> +
> >>> +    descs[used_elem.id].next =3D svq->free_head;
> >>> +    svq->free_head =3D used_elem.id;
> >>> +
> >>> +    svq->ring_id_maps[used_elem.id]->len =3D used_elem.len;
> >>> +    return g_steal_pointer(&svq->ring_id_maps[used_elem.id]);
> >>>    }
> >>>
> >>>    /* Forward vhost notifications */
> >>> @@ -70,8 +258,26 @@ static void vhost_svq_handle_call_no_test(EventNo=
tifier *n)
> >>>    {
> >>>        VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowVirtq=
ueue,
> >>>                                                 call_notifier);
> >>> -
> >>> -    event_notifier_set(&svq->guest_call_notifier);
> >>> +    VirtQueue *vq =3D svq->vq;
> >>> +
> >>> +    /* Make as many buffers as possible used. */
> >>> +    do {
> >>> +        unsigned i =3D 0;
> >>> +
> >>> +        /* TODO: Use VRING_AVAIL_F_NO_INTERRUPT */
> >>> +        while (true) {
> >>> +            g_autofree VirtQueueElement *elem =3D vhost_svq_get_buf(=
svq);
> >>> +            if (!elem) {
> >>> +                break;
> >>> +            }
> >>> +
> >>> +            assert(i < svq->vring.num);
> >>
> >> Let's return error instead of using the assert.
> >>
> > Actually this is a condition that we should never meet: In the case of
> > ring overrun, device would try to set used a descriptor that is either
> >> vring size *or* should try to overrun some of the already used ones.
> > In both cases, elem should be NULL and the loop should break.
> >
> > So this is a safety net protecting from both, if we have an i >
> > svq->vring.num means we are not processing used buffers well anymore,
> > and (moreover) this is happening after making used all descriptors.
> >
> > Taking that into account, should we delete it?
>
>
> Maybe a warning instead.
>

Ok I will do it.

>
> >
> >>> +            virtqueue_fill(vq, elem, elem->len, i++);
> >>> +        }
> >>> +
> >>> +        virtqueue_flush(vq, i);
> >>> +        event_notifier_set(&svq->guest_call_notifier);
> >>> +    } while (vhost_svq_more_used(svq));
> >>>    }
> >>>
> >>>    static void vhost_svq_handle_call(EventNotifier *n)
> >>> @@ -204,12 +410,25 @@ err_set_vring_kick:
> >>>    void vhost_svq_stop(struct vhost_dev *dev, unsigned idx,
> >>>                        VhostShadowVirtqueue *svq)
> >>>    {
> >>> +    int i;
> >>>        int r =3D vhost_svq_restore_vdev_host_notifier(dev, idx, svq);
> >>> +
> >>>        if (unlikely(r < 0)) {
> >>>            error_report("Couldn't restore vq kick fd: %s", strerror(-=
r));
> >>>        }
> >>>
> >>>        event_notifier_set_handler(&svq->host_notifier, NULL);
> >>> +
> >>> +    for (i =3D 0; i < svq->vring.num; ++i) {
> >>> +        g_autofree VirtQueueElement *elem =3D svq->ring_id_maps[i];
> >>> +        /*
> >>> +         * Although the doc says we must unpop in order, it's ok to =
unpop
> >>> +         * everything.
> >>> +         */
> >>> +        if (elem) {
> >>> +            virtqueue_unpop(svq->vq, elem, elem->len);
> >>> +        }
> >>
> >> Will this result some of the "pending" buffers to be submitted multipl=
e
> >> times? If yes, should we wait for all the buffers used instead of doin=
g
> >> the unpop here?
> >>
> > Do you mean to call virtqueue_unpop with the same elem (or elem.id)
> > multiple times? That should never happen, because elem.id should be
> > the position in the ring_id_maps. Also, unpop() should just unmap the
> > element and never sync again.
> >
> > Maybe it is way clearer to call virtqueue_detach_element here directly.
>
>
> I meant basically for the buffers that were consumed by the device but
> not made used. In this case if we unpop here. It will be processed by
> the device later via vhost-vdpa again?
>
> This is probably fine for net but I'm not sure it works for other
> devices. Another way is to wait until all the consumed buffer used.
>

My understanding is that it is the responsibility of the device to
pause and mark all of them as used. Without things like INFLIGHT_FD
there is no way for qemu to tell the difference between a buffer that
should be marked as used but is not, and a buffer that is properly not
marked as used. So if the device is not able to do it by itself, it
(or vdpa backend device driver) should not offer / fail the pause
command.

Similarly, if the device *needs* the inflight_fd mechanism to pause,
it should fail the pause if it has not been negotiated.

>
> >
> >>> +    }
> >>>    }
> >>>
> >>>    /*
> >>> @@ -224,7 +443,7 @@ VhostShadowVirtqueue *vhost_svq_new(struct vhost_=
dev *dev, int idx)
> >>>        size_t driver_size;
> >>>        size_t device_size;
> >>>        g_autofree VhostShadowVirtqueue *svq =3D g_new0(VhostShadowVir=
tqueue, 1);
> >>> -    int r;
> >>> +    int r, i;
> >>>
> >>>        r =3D event_notifier_init(&svq->kick_notifier, 0);
> >>>        if (r !=3D 0) {
> >>> @@ -250,6 +469,11 @@ VhostShadowVirtqueue *vhost_svq_new(struct vhost=
_dev *dev, int idx)
> >>>        memset(svq->vring.desc, 0, driver_size);
> >>>        svq->vring.used =3D qemu_memalign(qemu_real_host_page_size, de=
vice_size);
> >>>        memset(svq->vring.used, 0, device_size);
> >>> +    for (i =3D 0; i < num - 1; i++) {
> >>> +        svq->vring.desc[i].next =3D cpu_to_le16(i + 1);
> >>> +    }
> >>> +
> >>> +    svq->ring_id_maps =3D g_new0(VirtQueueElement *, num);
> >>>        event_notifier_set_handler(&svq->call_notifier,
> >>>                                   vhost_svq_handle_call);
> >>>        return g_steal_pointer(&svq);
> >>> @@ -269,6 +493,7 @@ void vhost_svq_free(VhostShadowVirtqueue *vq)
> >>>        event_notifier_cleanup(&vq->kick_notifier);
> >>>        event_notifier_set_handler(&vq->call_notifier, NULL);
> >>>        event_notifier_cleanup(&vq->call_notifier);
> >>> +    g_free(vq->ring_id_maps);
> >>>        qemu_vfree(vq->vring.desc);
> >>>        qemu_vfree(vq->vring.used);
> >>>        g_free(vq);
> >>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >>> index a057e8277d..bb7010ddb5 100644
> >>> --- a/hw/virtio/vhost-vdpa.c
> >>> +++ b/hw/virtio/vhost-vdpa.c
> >>> @@ -19,6 +19,7 @@
> >>>    #include "hw/virtio/virtio-net.h"
> >>>    #include "hw/virtio/vhost-shadow-virtqueue.h"
> >>>    #include "hw/virtio/vhost-vdpa.h"
> >>> +#include "hw/virtio/vhost-shadow-virtqueue.h"
> >>>    #include "exec/address-spaces.h"
> >>>    #include "qemu/main-loop.h"
> >>>    #include "cpu.h"
> >>> @@ -475,6 +476,28 @@ static int vhost_vdpa_set_features(struct vhost_=
dev *dev,
> >>>        return vhost_vdpa_backend_set_features(dev, features);
> >>>    }
> >>>
> >>> +/**
> >>> + * Restore guest features to vdpa device
> >>> + */
> >>> +static int vhost_vdpa_set_guest_features(struct vhost_dev *dev)
> >>> +{
> >>> +    struct vhost_vdpa *v =3D dev->opaque;
> >>> +    return vhost_vdpa_backend_set_features(dev, v->guest_features);
> >>> +}
> >>> +
> >>> +/**
> >>> + * Set shadow virtqueue supported features
> >>> + */
> >>> +static int vhost_vdpa_set_svq_features(struct vhost_dev *dev)
> >>> +{
> >>> +    struct vhost_vdpa *v =3D dev->opaque;
> >>> +    uint64_t features =3D v->host_features;
> >>> +    bool b =3D vhost_svq_valid_device_features(&features);
> >>> +    assert(b);
> >>> +
> >>> +    return vhost_vdpa_backend_set_features(dev, features);
> >>> +}
> >>> +
> >>>    static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
> >>>    {
> >>>        uint64_t features;
> >>> @@ -730,6 +753,19 @@ static bool  vhost_vdpa_force_iommu(struct vhost=
_dev *dev)
> >>>        return true;
> >>>    }
> >>>
> >>> +static int vhost_vdpa_vring_pause(struct vhost_dev *dev)
> >>> +{
> >>> +    int r;
> >>> +    uint8_t status;
> >>> +
> >>> +    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DEVICE_STOPPED);
> >>> +    do {
> >>> +        r =3D vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
> >>
> >> I guess we'd better add some sleep here.
> >>
> > If the final version still contains the call, I will add the sleep. At
> > the moment I think it's better if we stop the device by a vdpa ioctl.
>
>
> Ok, so the idea is to sleep in the ioctl?
>

At the moment I would say so: The ioctl can take "as long as it
wants". If we decide to support both methods (virtio pause & vdpa
pause), then sleep should be added, yes.

If we don't trust the device regarding the time it will take to pause,
we could try to move the wait for the pause outside of BQL in the
future, so qemu can operate regularly. I think it is not worth it in
the first series but it could help the adoption to other stricter or
more stateful devices.

Thanks!


>
> >
> >>> +    } while (r =3D=3D 0 && !(status & VIRTIO_CONFIG_S_DEVICE_STOPPED=
));
> >>> +
> >>> +    return 0;
> >>> +}
> >>> +
> >>>    /*
> >>>     * Start shadow virtqueue.
> >>>     */
> >>> @@ -742,9 +778,29 @@ static bool vhost_vdpa_svq_start_vq(struct vhost=
_dev *dev, unsigned idx)
> >>>            .index =3D idx + dev->vq_index,
> >>>            .fd =3D event_notifier_get_fd(vhost_call_notifier),
> >>>        };
> >>> +    struct vhost_vring_addr addr =3D {
> >>> +        .index =3D idx + dev->vq_index,
> >>> +    };
> >>> +    struct vhost_vring_state num =3D {
> >>> +        .index =3D idx + dev->vq_index,
> >>> +        .num =3D virtio_queue_get_num(dev->vdev, idx),
> >>> +    };
> >>>        int r;
> >>>        bool b;
> >>>
> >>> +    vhost_svq_get_vring_addr(svq, &addr);
> >>> +    r =3D vhost_vdpa_set_vring_addr(dev, &addr);
> >>> +    if (unlikely(r)) {
> >>> +        error_report("vhost_set_vring_addr for shadow vq failed");
> >>> +        return false;
> >>> +    }
> >>> +
> >>> +    r =3D vhost_vdpa_set_vring_num(dev, &num);
> >>> +    if (unlikely(r)) {
> >>> +        error_report("vhost_vdpa_set_vring_num for shadow vq failed"=
);
> >>> +        return false;
> >>> +    }
> >>> +
> >>>        /* Set shadow vq -> guest notifier */
> >>>        assert(v->call_fd[idx]);
> >>>        vhost_svq_set_guest_call_notifier(svq, v->call_fd[idx]);
> >>> @@ -781,15 +837,32 @@ static unsigned vhost_vdpa_enable_svq(struct vh=
ost_vdpa *v, bool enable)
> >>>            assert(v->shadow_vqs->len =3D=3D 0);
> >>>            for (n =3D 0; n < hdev->nvqs; ++n) {
> >>>                VhostShadowVirtqueue *svq =3D vhost_svq_new(hdev, n);
> >>> -            bool ok;
> >>> -
> >>>                if (unlikely(!svq)) {
> >>>                    g_ptr_array_set_size(v->shadow_vqs, 0);
> >>>                    return 0;
> >>>                }
> >>>                g_ptr_array_add(v->shadow_vqs, svq);
> >>> +        }
> >>> +    }
> >>>
> >>> -            ok =3D vhost_vdpa_svq_start_vq(hdev, n);
> >>> +    r =3D vhost_vdpa_vring_pause(hdev);
> >>> +    assert(r =3D=3D 0);
> >>> +
> >>> +    if (enable) {
> >>> +        for (n =3D 0; n < v->shadow_vqs->len; ++n) {
> >>> +            /* Obtain Virtqueue state */
> >>> +            vhost_virtqueue_stop(hdev, hdev->vdev, &hdev->vqs[n], n)=
;
> >>> +        }
> >>> +    }
> >>> +
> >>> +    /* Reset device so it can be configured */
> >>> +    r =3D vhost_vdpa_dev_start(hdev, false);
> >>> +    assert(r =3D=3D 0);
> >>> +
> >>> +    if (enable) {
> >>> +        int r;
> >>> +        for (n =3D 0; n < v->shadow_vqs->len; ++n) {
> >>> +            bool ok =3D vhost_vdpa_svq_start_vq(hdev, n);
> >>>                if (unlikely(!ok)) {
> >>>                    /* Free still not started svqs */
> >>>                    g_ptr_array_set_size(v->shadow_vqs, n);
> >>> @@ -797,11 +870,19 @@ static unsigned vhost_vdpa_enable_svq(struct vh=
ost_vdpa *v, bool enable)
> >>>                    break;
> >>>                }
> >>>            }
> >>> +
> >>> +        /* Need to ack features to set state in vp_vdpa devices */
> >>
> >> vhost_vdpa actually?
> >>
> > Yes, what a mistake!
> >
> >>> +        r =3D vhost_vdpa_set_svq_features(hdev);
> >>> +        if (unlikely(r)) {
> >>> +            enable =3D false;
> >>> +        }
> >>>        }
> >>>
> >>>        v->shadow_vqs_enabled =3D enable;
> >>>
> >>>        if (!enable) {
> >>> +        vhost_vdpa_set_guest_features(hdev);
> >>> +
> >>>            /* Disable all queues or clean up failed start */
> >>>            for (n =3D 0; n < v->shadow_vqs->len; ++n) {
> >>>                struct vhost_vring_file file =3D {
> >>> @@ -818,7 +899,12 @@ static unsigned vhost_vdpa_enable_svq(struct vho=
st_vdpa *v, bool enable)
> >>>                /* TODO: This can unmask or override call fd! */
> >>>                vhost_virtqueue_start(hdev, hdev->vdev, &hdev->vqs[n],=
 vq_idx);
> >>>            }
> >>> +    }
> >>>
> >>> +    r =3D vhost_vdpa_dev_start(hdev, true);
> >>> +    assert(r =3D=3D 0);
> >>> +
> >>> +    if (!enable) {
> >>>            /* Resources cleanup */
> >>>            g_ptr_array_set_size(v->shadow_vqs, 0);
> >>>        }
> >>> @@ -831,6 +917,7 @@ void qmp_x_vhost_enable_shadow_vq(const char *nam=
e, bool enable, Error **errp)
> >>>        struct vhost_vdpa *v;
> >>>        const char *err_cause =3D NULL;
> >>>        bool r;
> >>> +    uint64_t svq_features;
> >>>
> >>>        QLIST_FOREACH(v, &vhost_vdpa_devices, entry) {
> >>>            if (v->dev->vdev && 0 =3D=3D strcmp(v->dev->vdev->name, na=
me)) {
> >>> @@ -846,6 +933,20 @@ void qmp_x_vhost_enable_shadow_vq(const char *na=
me, bool enable, Error **errp)
> >>>            goto err;
> >>>        }
> >>>
> >>> +    svq_features =3D v->host_features;
> >>> +    if (!vhost_svq_valid_device_features(&svq_features)) {
> >>> +        error_setg(errp,
> >>> +            "Can't enable shadow vq on %s: Unexpected feature flags =
(%lx-%lx)",
> >>> +            name, v->host_features, svq_features);
> >>> +        return;
> >>> +    } else {
> >>> +        /* TODO: Check for virtio_vdpa + IOMMU & modern device */
> >>
> >> I guess you mean "vhost_vdpa" here.
> > Yes, a similar mistake in less than 50 lines :).
> >
> >> For IOMMU, I guess you mean "vIOMMU"
> >> actually?
> >>
> > This comment is out of date and inherited from the vhost version,
> > where only the IOMMU version was developed, so it will be deleted in
> > the next series. I think it makes little sense to check vIOMMU if we
> > stick with vDPA since it still does not support it, but we could make
> > the check here for sure.
>
>
> Right.
>
> Thanks
>
>
> >
> > Thanks!
> >
> >> Thanks
> >>
> >>
> >>> +    }
> >>> +
> >>> +    if (err_cause) {
> >>> +        goto err;
> >>> +    }
> >>> +
> >>>        r =3D vhost_vdpa_enable_svq(v, enable);
> >>>        if (unlikely(!r)) {
> >>>            err_cause =3D "Error enabling (see monitor)";
> >>> @@ -853,7 +954,7 @@ void qmp_x_vhost_enable_shadow_vq(const char *nam=
e, bool enable, Error **errp)
> >>>        }
> >>>
> >>>    err:
> >>> -    if (err_cause) {
> >>> +    if (errp =3D=3D NULL && err_cause) {
> >>>            error_setg(errp, "Can't enable shadow vq on %s: %s", name,=
 err_cause);
> >>>        }
> >>>    }
>


