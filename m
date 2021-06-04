Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC29B39B506
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 10:39:41 +0200 (CEST)
Received: from localhost ([::1]:33022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp5Mi-0008G3-2R
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 04:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lp5Lc-0007aO-EX
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 04:38:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lp5LZ-0001K7-42
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 04:38:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622795908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xvcmC5QOAsqE5OXJfl61aOhtf5TcE2JaBDsgZQMhN/c=;
 b=OIU7QHltx38AVfGOuBQ3so8haBTMNUc5/p5Wt4hhj4iCoVvsR81Lk8JC8nXihuGb0pm1zK
 RRYgaryaFIMwBCRfi7C8mQuw0SNJdqVGxHf27YIPVm0P73UH5dnBbO//8XEZd4Y/aV/x5V
 7XtZPNd7EYt8y5LlDuvehZ8ikz577l0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-FbSVJkXTP7GdaN77Clt7Hg-1; Fri, 04 Jun 2021 04:38:26 -0400
X-MC-Unique: FbSVJkXTP7GdaN77Clt7Hg-1
Received: by mail-qt1-f197.google.com with SMTP id
 d7-20020ac811870000b02901e65f85117bso4741072qtj.18
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 01:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xvcmC5QOAsqE5OXJfl61aOhtf5TcE2JaBDsgZQMhN/c=;
 b=dAI4a5KhemtJH7Lm67cf01etLWrEvyLZKmNrRcq1WO2ub7S3dx1DdZH0knqtdpPxxu
 I+W0jEXctDAL05hIWK2LuYTIpa7uMuSp3I0eyL2IMLPeEcsInaDwGxI/kMnEN9OOMr6C
 M67tULDnxeqeCixo3/+yyvStqPQn/2gPxuIVhCZm5/8nUhmsaY9l8NupqF/+eul2DFGi
 Xnt5D5KaF/f+kfS8dl4M//258OzmPRm8QCVM8WXi4tflPO+2kP5PNjX6bcikl6R+J7Er
 Uzl3j567Z7f9z4ddIbyyK1QdJcCVj4LGySFqxaVzYgHdJ90OVsMdd9+ogbDQCrjpAQBk
 jLnw==
X-Gm-Message-State: AOAM532Z1tbY6XSwWLl4DIrnkzvYeD3uVpdCJez/5zyxK34rHpf3FEBy
 cZtdC87oQxmJ792Br0lrFvOsTpPkHFpop9tC6UxbaHZ6epXvhftf39vMGkEUcuQAlWH0JFa0Xjn
 unCnk8KDfl3tkNgEvtl0W3NdGvonO7dw=
X-Received: by 2002:ac8:708e:: with SMTP id y14mr948403qto.221.1622795905979; 
 Fri, 04 Jun 2021 01:38:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9KwLJ3Un1g+JQXwPs207C1NZ4hBbmMzdX2t0TJkHD48OXEw+7mlrqdaTuNIct47HteBluCW4kA3rBCO/s9JU=
X-Received: by 2002:ac8:708e:: with SMTP id y14mr948387qto.221.1622795905678; 
 Fri, 04 Jun 2021 01:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210519162903.1172366-18-eperezma@redhat.com>
 <bfd680e5-9434-3fbe-3119-1f3c5fc42f4c@redhat.com>
 <CAJaqyWf7M1fjrd+kr-2bcYj+ibrqZVoREZuTiJ0i+p6dA+Dukw@mail.gmail.com>
 <66d83472-7cde-76e6-5e23-a85037156206@redhat.com>
In-Reply-To: <66d83472-7cde-76e6-5e23-a85037156206@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 4 Jun 2021 10:37:49 +0200
Message-ID: <CAJaqyWdSWWQwsS_G9ewMh++fB6zfj-+GfkE5um4wOLxKh+CgLA@mail.gmail.com>
Subject: Re: [RFC v3 17/29] vhost: Shadow virtqueue buffers forwarding
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
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
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Harpreet Singh Anand <hanand@xilinx.com>,
 Xiao W Wang <xiao.w.wang@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 3, 2021 at 5:35 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/6/3 =E4=B8=8A=E5=8D=881:18, Eugenio Perez Martin =E5=86=99=
=E9=81=93:
> > On Wed, Jun 2, 2021 at 11:51 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> =E5=9C=A8 2021/5/20 =E4=B8=8A=E5=8D=8812:28, Eugenio P=C3=A9rez =E5=86=
=99=E9=81=93:
> >>> Initial version of shadow virtqueue that actually forward buffers. Th=
e
> >>> exposed addresses are the qemu's virtual address, so devices with IOM=
MU
> >>> that does not allow full mapping of qemu's address space does not wor=
k
> >>> at the moment.
> >>>
> >>> Also for simplicity it only supports modern devices, that expects vri=
ng
> >>> in little endian, with split ring and no event idx or indirect
> >>> descriptors.
> >>>
> >>> It reuses the VirtQueue code for the device part. The driver part is
> >>> based on Linux's virtio_ring driver, but with stripped functionality
> >>> and optimizations so it's easier to review.
> >>>
> >>> Later commits will solve some of these concerns.
> >>
> >> It would be more more easier to review if you squash those
> >> "enhancements" into this patch.
> >>
> > Ok, they will be in the same commit for the next version.
> >
> >>> Code also need to map used ring (device part) as RW in, and only in,
> >>> vhost-net. To map (or call vhost_device_iotlb_miss) inconditionally
> >>> would print an error in case of vhost devices with its own mapping
> >>> (vdpa).
> >>
> >> I think we should not depend on the IOTLB miss. Instead, we should
> >> program the device IOTLB before starting the svq. Or is there anything
> >> that prevent you from doing this?
> >>
> > Sorry for being unclear, that is what I meant in the message: No other
> > device than kernel vhost needs the map (as "sent iotlb miss ahead"),
> > so we must make it conditional. Doing it unconditionally would make
> > nothing but an error appear on the screen, but it is incorrect anyway.
> >
> > Is it clearer this way?
>
>
> So what I'm worrying is the following code:
>
> int vhost_device_iotlb_miss(struct vhost_dev *dev, uint64_t iova, int wri=
te)
> {
> ...
>
>      if (dev->shadow_vqs_enabled) {
>          /* Shadow virtqueue translations in its Virtual Address Space */
>          const VhostDMAMap *result;
>          const VhostDMAMap needle =3D {
>              .iova =3D iova,
>          };
>
>          result =3D vhost_iova_tree_find_taddr(&dev->iova_map, &needle);
>          ...
>
> }
>
> I wonder the reason for doing that (sorry if I've asked this in the
> previous version).
>
> I think the correct way is to use map those in the device IOTLB before,
> instead of using the miss.
>
> Then we can have a unified code for vhost-vDPA and vhost-kernel.
>

Sure we can do it that way, this just followed the usual vhost + IOMMU
way of working.

Since in this case we are using vIOMMU, the code should also take care
of guest's updates. However, I agree it's better to leave this use
case for a future patch, and start just taking into account vhost-vdpa
map/unmap.

>
> >
> >>> To know if this call is needed, vhost_sw_live_migration_start_vq and
> >>> vhost_sw_live_migration_stop copy the test performed in
> >>> vhost_dev_start. Testing for the actual backend type could be cleaner=
,
> >>> or checking for non-NULL vhost_force_iommu, enable_custom_iommu, or
> >>> another vhostOp. We could extract this test in its own function too,
> >>> so its name could give a better hint. Just copy the vhost_dev_start
> >>> check at the moment.
> >>>
> >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>> ---
> >>>    hw/virtio/vhost-shadow-virtqueue.c | 205 +++++++++++++++++++++++++=
++--
> >>>    hw/virtio/vhost.c                  | 134 ++++++++++++++++++-
> >>>    2 files changed, 325 insertions(+), 14 deletions(-)
> >>>
> >>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-sha=
dow-virtqueue.c
> >>> index ff50f12410..6d767fe248 100644
> >>> --- a/hw/virtio/vhost-shadow-virtqueue.c
> >>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> >>> @@ -9,6 +9,7 @@
> >>>
> >>>    #include "hw/virtio/vhost-shadow-virtqueue.h"
> >>>    #include "hw/virtio/vhost.h"
> >>> +#include "hw/virtio/virtio-access.h"
> >>>
> >>>    #include "standard-headers/linux/vhost_types.h"
> >>>
> >>> @@ -48,9 +49,93 @@ typedef struct VhostShadowVirtqueue {
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
> >>>    } VhostShadowVirtqueue;
> >>>
> >>> -/* Forward guest notifications */
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
> >>> +static unsigned vhost_shadow_vq_add_split(VhostShadowVirtqueue *svq,
> >>> +                                          VirtQueueElement *elem)
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
> >>> +    /* Expose descriptors to device */
> >>
> >> It's better to describe the detail order.
> >>
> >> E.g "Update avail index after the descriptor is wrote"
> >>
> > Agree, I will replace it with your wording.
> >
> >>> +    smp_wmb();
> >>> +    avail->idx =3D cpu_to_le16(svq->avail_idx_shadow);
> >>> +
> >>> +    return head;
> >>> +
> >>> +}
> >>> +
> >>> +static void vhost_shadow_vq_add(VhostShadowVirtqueue *svq,
> >>> +                                VirtQueueElement *elem)
> >>> +{
> >>> +    unsigned qemu_head =3D vhost_shadow_vq_add_split(svq, elem);
> >>> +
> >>> +    svq->ring_id_maps[qemu_head] =3D elem;
> >>> +}
> >>> +
> >>> +/* Handle guest->device notifications */
> >>>    static void vhost_handle_guest_kick(EventNotifier *n)
> >>>    {
> >>>        VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowVirtq=
ueue,
> >>> @@ -60,7 +145,67 @@ static void vhost_handle_guest_kick(EventNotifier=
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
> >>> +
> >>> +        while (true) {
> >>> +            VirtQueueElement *elem =3D virtqueue_pop(svq->vq, sizeof=
(*elem));
> >>> +            if (!elem) {
> >>> +                break;
> >>> +            }
> >>> +
> >>> +            vhost_shadow_vq_add(svq, elem);
> >>> +            event_notifier_set(&svq->kick_notifier);
> >>> +        }
> >>> +
> >>> +        virtio_queue_set_notification(svq->vq, true);
> >>> +    } while (!virtio_queue_empty(svq->vq));
> >>> +}
> >>> +
> >>> +static bool vhost_shadow_vq_more_used(VhostShadowVirtqueue *svq)
> >>> +{
> >>> +    if (svq->used_idx !=3D svq->shadow_used_idx) {
> >>> +        return true;
> >>> +    }
> >>> +
> >>> +    /* Get used idx must not be reordered */
> >>> +    smp_rmb();
> >>> +    svq->shadow_used_idx =3D cpu_to_le16(svq->vring.used->idx);
> >>> +
> >>> +    return svq->used_idx !=3D svq->shadow_used_idx;
> >>> +}
> >>> +
> >>> +static VirtQueueElement *vhost_shadow_vq_get_buf(VhostShadowVirtqueu=
e *svq)
> >>> +{
> >>> +    vring_desc_t *descs =3D svq->vring.desc;
> >>> +    const vring_used_t *used =3D svq->vring.used;
> >>> +    vring_used_elem_t used_elem;
> >>> +    uint16_t last_used;
> >>> +
> >>> +    if (!vhost_shadow_vq_more_used(svq)) {
> >>> +        return NULL;
> >>> +    }
> >>> +
> >>> +    last_used =3D svq->used_idx & (svq->vring.num - 1);
> >>> +    used_elem.id =3D le32_to_cpu(used->ring[last_used].id);
> >>> +    used_elem.len =3D le32_to_cpu(used->ring[last_used].len);
> >>> +
> >>> +    if (unlikely(used_elem.id >=3D svq->vring.num)) {
> >>> +        error_report("Device %s says index %u is available", svq->vd=
ev->name,
> >>> +                     used_elem.id);
> >>> +        return NULL;
> >>> +    }
> >>> +
> >>> +    descs[used_elem.id].next =3D svq->free_head;
> >>> +    svq->free_head =3D used_elem.id;
> >>> +
> >>> +    svq->used_idx++;
> >>> +    svq->ring_id_maps[used_elem.id]->len =3D used_elem.len;
> >>> +    return g_steal_pointer(&svq->ring_id_maps[used_elem.id]);
> >>>    }
> >>>
> >>>    /* Forward vhost notifications */
> >>> @@ -69,17 +214,33 @@ static void vhost_shadow_vq_handle_call_no_test(=
EventNotifier *n)
> >>>        VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowVirtq=
ueue,
> >>>                                                 call_notifier);
> >>>        EventNotifier *masked_notifier;
> >>> +    VirtQueue *vq =3D svq->vq;
> >>>
> >>>        masked_notifier =3D svq->masked_notifier.n;
> >>>
> >>> -    if (!masked_notifier) {
> >>> -        unsigned n =3D virtio_get_queue_index(svq->vq);
> >>> -        virtio_queue_invalidate_signalled_used(svq->vdev, n);
> >>> -        virtio_notify_irqfd(svq->vdev, svq->vq);
> >>> -    } else if (!svq->masked_notifier.signaled) {
> >>> -        svq->masked_notifier.signaled =3D true;
> >>> -        event_notifier_set(svq->masked_notifier.n);
> >>> -    }
> >>> +    /* Make as many buffers as possible used. */
> >>> +    do {
> >>> +        unsigned i =3D 0;
> >>> +
> >>> +        /* TODO: Use VRING_AVAIL_F_NO_INTERRUPT */
> >>> +        while (true) {
> >>> +            g_autofree VirtQueueElement *elem =3D vhost_shadow_vq_ge=
t_buf(svq);
> >>> +            if (!elem) {
> >>> +                break;
> >>> +            }
> >>> +
> >>> +            assert(i < svq->vring.num);
> >>> +            virtqueue_fill(vq, elem, elem->len, i++);
> >>> +        }
> >>> +
> >>> +        virtqueue_flush(vq, i);
> >>> +        if (!masked_notifier) {
> >>> +            virtio_notify_irqfd(svq->vdev, svq->vq);
> >>
> >> Any reason that you don't use virtio_notify() here?
> >>
> > No reason but to make sure guest_notifier is used. I'm not sure if
> > this is an implementation detail though.
>
>
> The difference is that virtio_notify() will go through the memory API
> which will finally go to irqfd in this case.
>
>
> >
> > I can test to switch to virtio_notify, what would be the advantage here=
?
>
>
> Probably no.
>
>
> >
> >>> +        } else if (!svq->masked_notifier.signaled) {
> >>> +            svq->masked_notifier.signaled =3D true;
> >>> +            event_notifier_set(svq->masked_notifier.n);
> >>> +        }
> >>
> >> This is an example of the extra complexity if you do shadow virtqueue =
at
> > .> virtio level.
> >> If you do everything at e.g vhost-vdpa, you don't need to care about
> >> masked_notifer at all.
> >>
> > Correct me if I'm wrong, what you mean is to use the backend
> > vhost_set_vring_call to set the guest notifier (from SVQ point of
> > view), and then set it unconditionally. The function
> > vhost_virtqueue_mask would set the masked one by itself, no
> > modification is needed here.
>
>
> Something like this, from the point of vhost, it doesn't even need to
> know whether or not the notifier is masked or not. All it needs is to
> write to the eventfd set via vq call.
>
>
> >
> > Backend would still need a conditional checking if SVQ is enabled, so
> > it either sends call_fd to backend or to SVQ.
>
>
> Yes.
>
>
> > The call to
> > virtqueue_fill, would still be needed if we don't want to duplicate
> > all the device virtio's logic in the vhost-vdpa backend.
>
>
> Yes, you can make the buffer forwarding a common library then it could
> be used other vhost backend in the future.
>
> The point is to avoid touching vhost protocols to reduce the changeset
> and have someting minimal for our requirements (vhost-vDPA mainly).
>
>
> >
> > Another possibility would be to just store guest_notifier in SVQ, and
> > replace it with masked notifier and back. I think this is more aligned
> > with what you have in mind, but it still needs changes to
> > vhost_virtqueue_mask. Note that the boolean store
> > masked_notifier.signaled is just a (maybe premature) optimization to
> > skip the unneeded write syscall, but it could be omitted for brevity.
> > Or maybe a cleaner solution is to use io_uring for this write? :).
>
>
> Looks like not what I meant :)
>
> To clarify, it works like:
>
> 1) record the vq call fd1 during vhost_vdpa_set_vring_call
> 2) when svq is not enabled, set this fd1 to vhost-VDPA via
> VHOST_SET_VRING_CALL
> 3) when svq is enabled, initialize and set fd2 to vhost-vDPA, poll and
> handle guest kick via fd1 and rely fd1 to fd2
>
> So we don't need to care much about the masking, in the svq codes, we
> just stick to use the fd that is set via recent vhost_vdpa_set_vring_call=
().
>
> That means, if virtqueue is masked, we're using mased_notifier actually,
> but it's totally transparent to us.
>
> So the idea is behave like a normal vhost-vDPA backend, and hide the
> shadowing from the virtio codes.
>
> Thanks
>

I'm fine with that approach. It could write many times to
masked_notifier if the guest does mask the device and active poll the
ring, but
1) I'm not sure if any driver relies on it actually, and they should
also indicate that they don't want to be notified through the avail
ring flags.
2) Actual devices cannot do these optimizations, it would write
repeatedly to masked_notifier.

So even if a synthetic test proves that it is beneficial, it probably
is of no use in real use cases.

>
> >
> > Thanks!
> >
> >> Thanks
> >>
>


