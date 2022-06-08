Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF3D543C58
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 21:05:44 +0200 (CEST)
Received: from localhost ([::1]:38918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz0zv-0006gV-Ao
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 15:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nz0xi-0005Vr-Df
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 15:03:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nz0xd-0003ca-MJ
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 15:03:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654714999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SQsqU4EzS9wwBpnk2Insrkb9azAeZLbIo0POoJBpeGU=;
 b=C5GUJPWcALBefd1d58hSQPyCGT3H3B84nHTKKPrHVzYAllAvVGB5KMnIUOQMMQinEXCgEV
 L5JtM00kcrYTeiusOWYSMFuh/oITgfMYLDP7lczLffqJ6P4b2Bl3d1TFUk9CkuHtFxGfYm
 dEtfPSZ4jp/2h422gFGYBMfcXq9Ubxo=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-ruPylshwP4u9HmHPjyiYHA-1; Wed, 08 Jun 2022 15:03:18 -0400
X-MC-Unique: ruPylshwP4u9HmHPjyiYHA-1
Received: by mail-qv1-f72.google.com with SMTP id
 kj4-20020a056214528400b0044399a9bb4cso13505789qvb.15
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 12:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SQsqU4EzS9wwBpnk2Insrkb9azAeZLbIo0POoJBpeGU=;
 b=KUh4VS9q/btvfMiO6DrXCqGNJXquvpet3KuUr0CasYjMzrOgPwpGi4Yhi9di6HYzku
 8szgIQGY1OHK0FZIOQJ/CUaWkJphZliPDS92SYw5ukCRGdrpqV0bnoJTei8JPHUVy+A5
 lkDP6Tlf375XCioPGEg0TAE20nMSGnrwczwLbGlVryo1YAAe/YDdfqSzA2hwyiLLe+ly
 9LBjGQhuIXoN1hJjjYnw9FUH9KFN7q43zGbTu8XZ3adiPz4tuRrrYnhFZMI09Ip09+xT
 +Cvagkxor0+QJaKXzNJrZ7mYBP6nJhXOrfEp7gvf3R7MAoULWr9jOxI1DTOg5mwdFw98
 G9bQ==
X-Gm-Message-State: AOAM533hvDiOXbSHfpXaWpFOv/PLlUuGagC0JDYTN8Dt5vnk+nevtm44
 7vtTb2g/vj5759FGHVaRDcqwgJot+V6MCNLJyNWR6Fhb08NKIsD9D2ZRZ4winbS5vqTLGA+aVVb
 ONK52fBZ0cqv8PPnR+qWfESC4oKkNbhw=
X-Received: by 2002:a05:622a:1048:b0:305:89c:3ec4 with SMTP id
 f8-20020a05622a104800b00305089c3ec4mr2147004qte.582.1654714997818; 
 Wed, 08 Jun 2022 12:03:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQCVN5LRyx+8NYEPvdJtnNP9Ogfk0qVHS854spa3ypJLkF2zNL4GPOR0KQg5pZMeY2g2As/1XR4oVLRjAo+Z8=
X-Received: by 2002:a05:622a:1048:b0:305:89c:3ec4 with SMTP id
 f8-20020a05622a104800b00305089c3ec4mr2146954qte.582.1654714997194; Wed, 08
 Jun 2022 12:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220519191306.821774-1-eperezma@redhat.com>
 <20220519191306.821774-10-eperezma@redhat.com>
 <ada7a29f-a8c8-9642-72ab-acf61e8158da@redhat.com>
In-Reply-To: <ada7a29f-a8c8-9642-72ab-acf61e8158da@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 8 Jun 2022 21:02:40 +0200
Message-ID: <CAJaqyWfoJETAuhm9n3oWVg2YDNMkopyRdMvJGojzT8oYC5bXVQ@mail.gmail.com>
Subject: Re: [RFC PATCH v8 09/21] vhost: Add svq copy desc mode
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

On Wed, Jun 8, 2022 at 6:14 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/5/20 03:12, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > Enable SVQ to not to forward the descriptor translating its address to
> > qemu's IOVA but copying to a region outside of the guest.
> >
> > Virtio-net control VQ will use this mode, so we don't need to send all
> > the guest's memory every time there is a change, but only on messages.
> > Reversely, CVQ will only have access to control messages.  This lead to
> > less messing with memory listeners.
> >
> > We could also try to send only the required translation by message, but
> > this presents a problem when many control messages occupy the same
> > guest's memory region.
> >
> > Lastly, this allows us to inject messages from QEMU to the device in a
> > simple manner.  CVQ should be used rarely and with small messages, so a=
ll
> > the drawbacks should be assumible.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.h |  10 ++
> >   include/hw/virtio/vhost-vdpa.h     |   1 +
> >   hw/virtio/vhost-shadow-virtqueue.c | 174 +++++++++++++++++++++++++++-=
-
> >   hw/virtio/vhost-vdpa.c             |   1 +
> >   net/vhost-vdpa.c                   |   1 +
> >   5 files changed, 175 insertions(+), 12 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index e06ac52158..79cb2d301f 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -17,6 +17,12 @@
> >
> >   typedef struct SVQElement {
> >       VirtQueueElement elem;
> > +
> > +    /* SVQ IOVA address of in buffer and out buffer if cloned */
> > +    hwaddr in_iova, out_iova;
>
>
> It might worth to mention that we'd expect a single buffer here.
>

I'll do it. There is another comment like that in another place, I'll
copy it here.

>
> > +
> > +    /* Length of in buffer */
> > +    size_t in_len;
> >   } SVQElement;
> >
> >   typedef void (*VirtQueueElementCallback)(VirtIODevice *vdev,
> > @@ -102,6 +108,9 @@ typedef struct VhostShadowVirtqueue {
> >
> >       /* Next head to consume from the device */
> >       uint16_t last_used_idx;
> > +
> > +    /* Copy each descriptor to QEMU iova */
> > +    bool copy_descs;
> >   } VhostShadowVirtqueue;
> >
> >   bool vhost_svq_valid_features(uint64_t features, Error **errp);
> > @@ -119,6 +128,7 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq);
> >
> >   VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_map,
> >                                       const VhostShadowVirtqueueOps *op=
s,
> > +                                    bool copy_descs,
> >                                       const VhostShadowVirtqueueMapOps =
*map_ops,
> >                                       void *map_ops_opaque);
> >
> > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-v=
dpa.h
> > index f1ba46a860..dc2884eea4 100644
> > --- a/include/hw/virtio/vhost-vdpa.h
> > +++ b/include/hw/virtio/vhost-vdpa.h
> > @@ -33,6 +33,7 @@ typedef struct vhost_vdpa {
> >       struct vhost_vdpa_iova_range iova_range;
> >       uint64_t acked_features;
> >       bool shadow_vqs_enabled;
> > +    bool svq_copy_descs;
> >       /* IOVA mapping used by the Shadow Virtqueue */
> >       VhostIOVATree *iova_tree;
> >       GPtrArray *shadow_vqs;
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 044005ba89..5a8feb1cbc 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -16,6 +16,7 @@
> >   #include "qemu/log.h"
> >   #include "qemu/memalign.h"
> >   #include "linux-headers/linux/vhost.h"
> > +#include "qemu/iov.h"
> >
> >   /**
> >    * Validate the transport device features that both guests can use wi=
th the SVQ
> > @@ -70,6 +71,30 @@ static uint16_t vhost_svq_available_slots(const Vhos=
tShadowVirtqueue *svq)
> >       return svq->vring.num - (svq->shadow_avail_idx - svq->shadow_used=
_idx);
> >   }
> >
> > +static void vhost_svq_alloc_buffer(void **base, size_t *len,
> > +                                   const struct iovec *iov, size_t num=
,
> > +                                   bool write)
> > +{
> > +    *len =3D iov_size(iov, num);
>
>
> Since this behavior is trigger able by the guest, we need an upper limit
> here.
>

Good point. What could be a good limit?

As you propose later, maybe I can redesign SVQ so it either forwards
the buffer to the device or calls an available element callback. It
can inject the right copied buffer by itself. This way we know the
right buffer size beforehand.

>
> > +    size_t buf_size =3D ROUND_UP(*len, 4096);
>
>
> I see a kind of duplicated round up which is done in
> vhost_svq_write_descs().
>

Yes, it's better to return this size somehow.

> Btw, should we use TARGET_PAGE_SIZE instead of the magic 4096 here?
>

Yes. But since we're going to expose pages to the device, it should be
host_page_size, right?

>
> > +
> > +    if (!num) {
> > +        return;
> > +    }
> > +
> > +    /*
> > +     * Linearize element. If guest had a descriptor chain, we expose t=
he device
> > +     * a single buffer.
> > +     */
> > +    *base =3D qemu_memalign(4096, buf_size);
> > +    if (!write) {
> > +        iov_to_buf(iov, num, 0, *base, *len);
> > +        memset(*base + *len, 0, buf_size - *len);
> > +    } else {
> > +        memset(*base, 0, *len);
> > +    }
> > +}
> > +
> >   /**
> >    * Translate addresses between the qemu's virtual address and the SVQ=
 IOVA
> >    *
> > @@ -126,7 +151,9 @@ static bool vhost_svq_translate_addr(const VhostSha=
dowVirtqueue *svq,
> >    * Write descriptors to SVQ vring
> >    *
> >    * @svq: The shadow virtqueue
> > + * @svq_elem: The shadow virtqueue element
> >    * @sg: Cache for hwaddr
> > + * @descs_len: Total written buffer if svq->copy_descs.
> >    * @iovec: The iovec from the guest
> >    * @num: iovec length
> >    * @more_descs: True if more descriptors come in the chain
> > @@ -134,7 +161,9 @@ static bool vhost_svq_translate_addr(const VhostSha=
dowVirtqueue *svq,
> >    *
> >    * Return true if success, false otherwise and print error.
> >    */
> > -static bool vhost_svq_vring_write_descs(VhostShadowVirtqueue *svq, hwa=
ddr *sg,
> > +static bool vhost_svq_vring_write_descs(VhostShadowVirtqueue *svq,
> > +                                        SVQElement *svq_elem, hwaddr *=
sg,
> > +                                        size_t *descs_len,
> >                                           const struct iovec *iovec, si=
ze_t num,
> >                                           bool more_descs, bool write)
> >   {
> > @@ -142,18 +171,41 @@ static bool vhost_svq_vring_write_descs(VhostShad=
owVirtqueue *svq, hwaddr *sg,
> >       unsigned n;
> >       uint16_t flags =3D write ? cpu_to_le16(VRING_DESC_F_WRITE) : 0;
> >       vring_desc_t *descs =3D svq->vring.desc;
> > -    bool ok;
> > -
> >       if (num =3D=3D 0) {
> >           return true;
> >       }
> >
> > -    ok =3D vhost_svq_translate_addr(svq, sg, iovec, num);
> > -    if (unlikely(!ok)) {
> > -        return false;
> > +    if (svq->copy_descs) {
> > +        void *buf;
> > +        DMAMap map =3D {};
> > +        int r;
> > +
> > +        vhost_svq_alloc_buffer(&buf, descs_len, iovec, num, write);
> > +        map.translated_addr =3D (hwaddr)(uintptr_t)buf;
> > +        map.size =3D ROUND_UP(*descs_len, 4096) - 1;
> > +        map.perm =3D write ? IOMMU_RW : IOMMU_RO,
> > +        r =3D vhost_iova_tree_map_alloc(svq->iova_tree, &map);
> > +        if (unlikely(r !=3D IOVA_OK)) {
> > +            error_report("Cannot map injected element");
> > +            return false;
> > +        }
> > +
> > +        r =3D svq->map_ops->map(map.iova, map.size + 1,
> > +                              (void *)map.translated_addr, !write,
> > +                              svq->map_ops_opaque);
> > +        /* TODO: Handle error */
> > +        assert(r =3D=3D 0);
> > +        num =3D 1;
> > +        sg[0] =3D map.iova;
>
>
> I think it would be simple if stick a simple logic of
> vhost_svq_vring_write_descs() here.
>
> E.g we can move the above logic to the caller and it can simply prepare
> a dedicated in/out sg for the copied buffer.
>

Yes, it can be done that way.

>
> > +    } else {
> > +        bool ok =3D vhost_svq_translate_addr(svq, sg, iovec, num);
> > +        if (unlikely(!ok)) {
> > +            return false;
> > +        }
> >       }
> >
> >       for (n =3D 0; n < num; n++) {
> > +        uint32_t len =3D svq->copy_descs ? *descs_len : iovec[n].iov_l=
en;
> >           if (more_descs || (n + 1 < num)) {
> >               descs[i].flags =3D flags | cpu_to_le16(VRING_DESC_F_NEXT)=
;
> >               descs[i].next =3D cpu_to_le16(svq->desc_next[i]);
> > @@ -161,7 +213,7 @@ static bool vhost_svq_vring_write_descs(VhostShadow=
Virtqueue *svq, hwaddr *sg,
> >               descs[i].flags =3D flags;
> >           }
> >           descs[i].addr =3D cpu_to_le64(sg[n]);
> > -        descs[i].len =3D cpu_to_le32(iovec[n].iov_len);
> > +        descs[i].len =3D cpu_to_le32(len);
> >
> >           last =3D i;
> >           i =3D cpu_to_le16(svq->desc_next[i]);
> > @@ -178,7 +230,8 @@ static bool vhost_svq_add_split(VhostShadowVirtqueu=
e *svq, SVQElement *svq_elem,
> >       unsigned avail_idx;
> >       vring_avail_t *avail =3D svq->vring.avail;
> >       bool ok;
> > -    g_autofree hwaddr *sgs =3D g_new(hwaddr, MAX(elem->out_num, elem->=
in_num));
> > +    g_autofree hwaddr *sgs =3D NULL;
> > +    hwaddr *in_sgs, *out_sgs;
> >
> >       *head =3D svq->free_head;
> >
> > @@ -189,15 +242,24 @@ static bool vhost_svq_add_split(VhostShadowVirtqu=
eue *svq, SVQElement *svq_elem,
> >           return false;
> >       }
> >
> > -    ok =3D vhost_svq_vring_write_descs(svq, sgs, elem->out_sg, elem->o=
ut_num,
> > +    if (!svq->copy_descs) {
> > +        sgs =3D g_new(hwaddr, MAX(elem->out_num, elem->in_num));
> > +        in_sgs =3D out_sgs =3D sgs;
> > +    } else {
> > +        in_sgs =3D &svq_elem->in_iova;
> > +        out_sgs =3D &svq_elem->out_iova;
> > +    }
> > +    ok =3D vhost_svq_vring_write_descs(svq, svq_elem, out_sgs, (size_t=
[]){},
> > +                                     elem->out_sg, elem->out_num,
> >                                        elem->in_num > 0, false);
> >       if (unlikely(!ok)) {
> >           return false;
> >       }
> >
> > -    ok =3D vhost_svq_vring_write_descs(svq, sgs, elem->in_sg, elem->in=
_num, false,
> > -                                     true);
> > +    ok =3D vhost_svq_vring_write_descs(svq, svq_elem, in_sgs, &svq_ele=
m->in_len,
> > +                                     elem->in_sg, elem->in_num, false,=
 true);
> >       if (unlikely(!ok)) {
> > +        /* TODO unwind out_sg */
> >           return false;
> >       }
> >
> > @@ -276,6 +338,7 @@ static void vhost_handle_guest_kick(VhostShadowVirt=
queue *svq)
> >               SVQElement *svq_elem;
> >               VirtQueueElement *elem;
> >               bool ok;
> > +            uint32_t needed_slots;
> >
> >               if (svq->next_guest_avail_elem) {
> >                   svq_elem =3D g_steal_pointer(&svq->next_guest_avail_e=
lem);
> > @@ -288,7 +351,8 @@ static void vhost_handle_guest_kick(VhostShadowVirt=
queue *svq)
> >               }
> >
> >               elem =3D &svq_elem->elem;
> > -            if (elem->out_num + elem->in_num > vhost_svq_available_slo=
ts(svq)) {
> > +            needed_slots =3D svq->copy_descs ? 1 : elem->out_num + ele=
m->in_num;
> > +            if (needed_slots > vhost_svq_available_slots(svq)) {
> >                   /*
> >                    * This condition is possible since a contiguous buff=
er in GPA
> >                    * does not imply a contiguous buffer in qemu's VA
> > @@ -411,6 +475,76 @@ static SVQElement *vhost_svq_get_buf(VhostShadowVi=
rtqueue *svq, uint32_t *len)
> >       return g_steal_pointer(&svq->ring_id_maps[used_elem.id]);
> >   }
> >
> > +/**
> > + * Unmap a descriptor chain of a SVQ element, optionally copying its i=
n buffers
> > + *
> > + * @svq: Shadow VirtQueue
> > + * @iova: SVQ IO Virtual address of descriptor
> > + * @iov: Optional iovec to store device writable buffer
> > + * @iov_cnt: iov length
> > + * @buf_len: Length written by the device
> > + *
> > + * Print error message in case of error
> > + */
> > +static bool vhost_svq_unmap_iov(VhostShadowVirtqueue *svq, hwaddr iova=
,
> > +                                const struct iovec *iov, size_t iov_cn=
t,
> > +                                size_t buf_len)
> > +{
> > +    DMAMap needle =3D {
> > +        /*
> > +         * No need to specify size since contiguous iova chunk was all=
ocated
> > +         * by SVQ.
> > +         */
> > +        .iova =3D iova,
> > +    };
> > +    const DMAMap *map =3D vhost_iova_tree_find(svq->iova_tree, &needle=
);
> > +    int r;
> > +
> > +    if (!map) {
> > +        error_report("Cannot locate expected map");
> > +        return false;
> > +    }
> > +
> > +    r =3D svq->map_ops->unmap(map->iova, map->size + 1, svq->map_ops_o=
paque);
> > +    if (unlikely(r !=3D 0)) {
> > +        error_report("Device cannot unmap: %s(%d)", g_strerror(r), r);
> > +        return false;
> > +    }
> > +
> > +    if (iov) {
> > +        iov_from_buf(iov, iov_cnt, 0, (const void *)map->translated_ad=
dr, buf_len);
> > +    }
> > +    qemu_vfree((void *)map->translated_addr);
> > +    vhost_iova_tree_remove(svq->iova_tree, &needle);
> > +    return true;
> > +}
> > +
> > +/**
> > + * Unmap shadow virtqueue element
> > + *
> > + * @svq_elem: Shadow VirtQueue Element
> > + * @copy_in: Copy in buffer to the element at unmapping
> > + */
> > +static bool vhost_svq_unmap_elem(VhostShadowVirtqueue *svq, SVQElement=
 *svq_elem, uint32_t len, bool copy_in)
> > +{
> > +    VirtQueueElement *elem =3D &svq_elem->elem;
> > +    const struct iovec *in_iov =3D copy_in ? elem->in_sg : NULL;
> > +    size_t in_count =3D copy_in ? elem->in_num : 0;
> > +    if (elem->out_num) {
> > +        bool ok =3D vhost_svq_unmap_iov(svq, svq_elem->out_iova, NULL,=
 0, 0);
> > +        if (unlikely(!ok)) {
> > +            return false;
> > +        }
> > +    }
> > +
> > +    if (elem->in_num) {
> > +        return vhost_svq_unmap_iov(svq, svq_elem->in_iova, in_iov, in_=
count,
> > +                                   len);
> > +    }
> > +
> > +    return true;
> > +}
> > +
> >   static void vhost_svq_flush(VhostShadowVirtqueue *svq,
> >                               bool check_for_avail_queue)
> >   {
> > @@ -429,6 +563,13 @@ static void vhost_svq_flush(VhostShadowVirtqueue *=
svq,
> >                   break;
> >               }
> >
> > +            if (svq->copy_descs) {
> > +                bool ok =3D vhost_svq_unmap_elem(svq, svq_elem, len, t=
rue);
> > +                if (unlikely(!ok)) {
> > +                    return;
> > +                }
> > +            }
> > +
> >               elem =3D &svq_elem->elem;
> >               if (svq->ops && svq->ops->used_elem_handler) {
> >                   svq->ops->used_elem_handler(svq->vdev, elem);
> > @@ -611,12 +752,18 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
> >           g_autofree SVQElement *svq_elem =3D NULL;
> >           svq_elem =3D g_steal_pointer(&svq->ring_id_maps[i]);
> >           if (svq_elem) {
> > +            if (svq->copy_descs) {
> > +                vhost_svq_unmap_elem(svq, svq_elem, 0, false);
> > +            }
> >               virtqueue_detach_element(svq->vq, &svq_elem->elem, 0);
> >           }
> >       }
> >
> >       next_avail_elem =3D g_steal_pointer(&svq->next_guest_avail_elem);
> >       if (next_avail_elem) {
> > +        if (svq->copy_descs) {
> > +            vhost_svq_unmap_elem(svq, next_avail_elem, 0, false);
> > +        }
> >           virtqueue_detach_element(svq->vq, &next_avail_elem->elem, 0);
> >       }
> >       svq->vq =3D NULL;
> > @@ -632,6 +779,7 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
> >    *
> >    * @iova_tree: Tree to perform descriptors translations
> >    * @ops: SVQ operations hooks
> > + * @copy_descs: Copy each descriptor to QEMU iova
> >    * @map_ops: SVQ mapping operation hooks
> >    * @map_ops_opaque: Opaque data to pass to mapping operations
> >    *
> > @@ -641,6 +789,7 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
> >    */
> >   VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
> >                                       const VhostShadowVirtqueueOps *op=
s,
> > +                                    bool copy_descs,
> >                                       const VhostShadowVirtqueueMapOps =
*map_ops,
> >                                       void *map_ops_opaque)
> >   {
> > @@ -665,6 +814,7 @@ VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *=
iova_tree,
> >       event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call=
);
> >       svq->iova_tree =3D iova_tree;
> >       svq->ops =3D ops;
> > +    svq->copy_descs =3D copy_descs;
> >       svq->map_ops =3D map_ops;
> >       svq->map_ops_opaque =3D map_ops_opaque;
> >       return g_steal_pointer(&svq);
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index e6ef944e23..31b3d4d013 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -436,6 +436,7 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hd=
ev, struct vhost_vdpa *v,
> >       for (unsigned n =3D 0; n < hdev->nvqs; ++n) {
> >           g_autoptr(VhostShadowVirtqueue) svq =3D vhost_svq_new(v->iova=
_tree,
> >                                                          v->shadow_vq_o=
ps,
> > +                                                       v->svq_copy_des=
cs,
> >                                                          &vhost_vdpa_sv=
q_map_ops,
> >                                                          v);
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index ef12fc284c..174fec5e77 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -254,6 +254,7 @@ static NetClientState *net_vhost_vdpa_init(NetClien=
tState *peer,
> >       s->vhost_vdpa.index =3D queue_pair_index;
> >       if (!is_datapath) {
> >           s->vhost_vdpa.shadow_vq_ops =3D &vhost_vdpa_net_svq_ops;
> > +        s->vhost_vdpa.svq_copy_descs =3D true;
> >       }
> >       ret =3D vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_ind=
ex, nvqs);
> >       if (ret) {
>
>
> So all these logic seems rather complicated, it might be better to think
> of a way to simplify the stuffs. The cause of the complexity is that we
> couple too many stuffs with SVQ.
>
> I wonder if we can simply let control virtqueue end in userspace code
> where it has a full understanding of the semantic, then let it talks to
> the vhost-vdpa directly:
>
> E.g in the case of mq setting, we will start form the
> virtio_net_handle_mq(). Where we can prepare cvq commands there and send
> them to vhost-vDPA networking backend where the cvq commands were mapped
> and submitted to the device?
>

If I understood you correctly, it's doable.

I'll try to come up with that for the next version.

Thanks!

> Thanks
>


