Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F48743433D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 04:09:29 +0200 (CEST)
Received: from localhost ([::1]:40312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md12m-0001q6-Ma
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 22:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1md112-0000UV-1U
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 22:07:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1md10z-0001nB-EB
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 22:07:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634695655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ChcCAfcq9l/z6L0h4JSc4z/BKEbQoEAqxCF0yDYwfMg=;
 b=D9BeUwSzIva0Wtvt5MT5Lr1nvYzqKPiYsAbo8YRC9u2/q8796DBhxwioZFQSwx3b4c8+Pz
 f41l0k9annO+NjiI3hguOyuHY1gOPyGU4/eLZHA76mJqbnKHa1WhceGxkCsZh/4/hlyaIJ
 jVlEnqiCZn4iMFwHb0EuYe0+5loHEqU=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-acgqShVeOt-QXrbV9K0Vug-1; Tue, 19 Oct 2021 22:07:34 -0400
X-MC-Unique: acgqShVeOt-QXrbV9K0Vug-1
Received: by mail-lf1-f72.google.com with SMTP id
 z29-20020a195e5d000000b003fd437f0e07so2315742lfi.20
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 19:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ChcCAfcq9l/z6L0h4JSc4z/BKEbQoEAqxCF0yDYwfMg=;
 b=MIRpWZ/OMYaFfwh3swVpq8FpkWAx4ZXnW68+wO7YHLyhCGWYirWzMlucBgZ6NoZ+Jv
 9DGSuLcsVKEiaGnTQAQss56/+znUgktv3ymtNu0lrc1zgOuqXRfrA3G100meaICz5Ygb
 gEEHbBTkWC8pAgN6LPWi+8xk0gGcMmmum4zl8p82fjHJWgQmKJzEB1OOd2jNHYSCrWAt
 fHzjTnh+/IHynFEVCb8Ohr9WjJSiRW6kA8MihbTFTwPFQ70rE/tliiKL+ZjrZ4vvwuBM
 nhxsg/w02WDZaMf42PzlbIsxDArjTZyfqTIqIiBO2BcLrxLMgoqS1gI1MbRmbaLGJRor
 YNNw==
X-Gm-Message-State: AOAM530ZT8wHQ0zKpf2PukoXxj1bcdVNRDM8CpNBB4V4YHnKjUuBpObQ
 zY1X8TN+qNaPu3Hm8rQvike7JapMAN6lFCLWbGtmOCroTSLCw3rn4N7he7bfS69eAJq7CEW1tWY
 19ZdpSuPjwrk2S+Nib9z565RxXmLD0NQ=
X-Received: by 2002:a2e:7212:: with SMTP id n18mr10576999ljc.369.1634695652741; 
 Tue, 19 Oct 2021 19:07:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6jz0lfV0wysFj/cuZ1UvO4Vv9p+kQgW84ye3irGIXTmbgbI4hkTeo1gV1U8FQQaLt8+MpZIMjnZmzB4oYK4w=
X-Received: by 2002:a2e:7212:: with SMTP id n18mr10576964ljc.369.1634695652345; 
 Tue, 19 Oct 2021 19:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-21-eperezma@redhat.com>
 <a426c22c-f41a-4e3f-d140-7e7a0defeacb@redhat.com>
 <CAJaqyWcRcm9rwuTqJHS0FmuMrXpoCvF34TzXKQmxXTfZssZ-jA@mail.gmail.com>
 <CACGkMEtgOc6ccaV5fckMwgEccEwL=sfuvkGymjAsQh7Tvn9krw@mail.gmail.com>
In-Reply-To: <CACGkMEtgOc6ccaV5fckMwgEccEwL=sfuvkGymjAsQh7Tvn9krw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 20 Oct 2021 10:07:21 +0800
Message-ID: <CACGkMEsjnnsTbCOdEP6iq8Fwc0=BSKfheGPubg7bcbF-BPU1gg@mail.gmail.com>
Subject: Re: [RFC PATCH v4 20/20] vdpa: Add custom IOTLB translations to SVQ
To: Eugenio Perez Martin <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Wed, Oct 20, 2021 at 10:02 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Tue, Oct 19, 2021 at 6:29 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Tue, Oct 19, 2021 at 11:25 AM Jason Wang <jasowang@redhat.com> wrote=
:
> > >
> > >
> > > =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:06, Eugenio P=C3=A9rez =E5=86=
=99=E9=81=93:
> > > > Use translations added in VhostIOVATree in SVQ.
> > > >
> > > > Now every element needs to store the previous address also, so Virt=
Queue
> > > > can consume the elements properly. This adds a little overhead per =
VQ
> > > > element, having to allocate more memory to stash them. As a possibl=
e
> > > > optimization, this allocation could be avoided if the descriptor is=
 not
> > > > a chain but a single one, but this is left undone.
> > > >
> > > > TODO: iova range should be queried before, and add logic to fail wh=
en
> > > > GPA is outside of its range and memory listener or svq add it.
> > > >
> > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > ---
> > > >   hw/virtio/vhost-shadow-virtqueue.h |   4 +-
> > > >   hw/virtio/vhost-shadow-virtqueue.c | 130 ++++++++++++++++++++++++=
-----
> > > >   hw/virtio/vhost-vdpa.c             |  40 ++++++++-
> > > >   hw/virtio/trace-events             |   1 +
> > > >   4 files changed, 152 insertions(+), 23 deletions(-)
> > > >
> > > > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-s=
hadow-virtqueue.h
> > > > index b7baa424a7..a0e6b5267a 100644
> > > > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > > > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > > > @@ -11,6 +11,7 @@
> > > >   #define VHOST_SHADOW_VIRTQUEUE_H
> > > >
> > > >   #include "hw/virtio/vhost.h"
> > > > +#include "hw/virtio/vhost-iova-tree.h"
> > > >
> > > >   typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> > > >
> > > > @@ -28,7 +29,8 @@ bool vhost_svq_start(struct vhost_dev *dev, unsig=
ned idx,
> > > >   void vhost_svq_stop(struct vhost_dev *dev, unsigned idx,
> > > >                       VhostShadowVirtqueue *svq);
> > > >
> > > > -VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx=
);
> > > > +VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx=
,
> > > > +                                    VhostIOVATree *iova_map);
> > > >
> > > >   void vhost_svq_free(VhostShadowVirtqueue *vq);
> > > >
> > > > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-s=
hadow-virtqueue.c
> > > > index 2fd0bab75d..9db538547e 100644
> > > > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > > > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > > > @@ -11,12 +11,19 @@
> > > >   #include "hw/virtio/vhost-shadow-virtqueue.h"
> > > >   #include "hw/virtio/vhost.h"
> > > >   #include "hw/virtio/virtio-access.h"
> > > > +#include "hw/virtio/vhost-iova-tree.h"
> > > >
> > > >   #include "standard-headers/linux/vhost_types.h"
> > > >
> > > >   #include "qemu/error-report.h"
> > > >   #include "qemu/main-loop.h"
> > > >
> > > > +typedef struct SVQElement {
> > > > +    VirtQueueElement elem;
> > > > +    void **in_sg_stash;
> > > > +    void **out_sg_stash;
> > > > +} SVQElement;
> > > > +
> > > >   /* Shadow virtqueue to relay notifications */
> > > >   typedef struct VhostShadowVirtqueue {
> > > >       /* Shadow vring */
> > > > @@ -46,8 +53,11 @@ typedef struct VhostShadowVirtqueue {
> > > >       /* Virtio device */
> > > >       VirtIODevice *vdev;
> > > >
> > > > +    /* IOVA mapping if used */
> > > > +    VhostIOVATree *iova_map;
> > > > +
> > > >       /* Map for returning guest's descriptors */
> > > > -    VirtQueueElement **ring_id_maps;
> > > > +    SVQElement **ring_id_maps;
> > > >
> > > >       /* Next head to expose to device */
> > > >       uint16_t avail_idx_shadow;
> > > > @@ -79,13 +89,6 @@ bool vhost_svq_valid_device_features(uint64_t *d=
ev_features)
> > > >               continue;
> > > >
> > > >           case VIRTIO_F_ACCESS_PLATFORM:
> > > > -            /* SVQ needs this feature disabled. Can't continue */
> > > > -            if (*dev_features & BIT_ULL(b)) {
> > > > -                clear_bit(b, dev_features);
> > > > -                r =3D false;
> > > > -            }
> > > > -            break;
> > > > -
> > > >           case VIRTIO_F_VERSION_1:
> > > >               /* SVQ needs this feature, so can't continue */
> > > >               if (!(*dev_features & BIT_ULL(b))) {
> > > > @@ -126,6 +129,64 @@ static void vhost_svq_set_notification(VhostSh=
adowVirtqueue *svq, bool enable)
> > > >       }
> > > >   }
> > > >
> > > > +static void vhost_svq_stash_addr(void ***stash, const struct iovec=
 *iov,
> > > > +                                 size_t num)
> > > > +{
> > > > +    size_t i;
> > > > +
> > > > +    if (num =3D=3D 0) {
> > > > +        return;
> > > > +    }
> > > > +
> > > > +    *stash =3D g_new(void *, num);
> > > > +    for (i =3D 0; i < num; ++i) {
> > > > +        (*stash)[i] =3D iov[i].iov_base;
> > > > +    }
> > > > +}
> > > > +
> > > > +static void vhost_svq_unstash_addr(void **stash, struct iovec *iov=
, size_t num)
> > > > +{
> > > > +    size_t i;
> > > > +
> > > > +    if (num =3D=3D 0) {
> > > > +        return;
> > > > +    }
> > > > +
> > > > +    for (i =3D 0; i < num; ++i) {
> > > > +        iov[i].iov_base =3D stash[i];
> > > > +    }
> > > > +    g_free(stash);
> > > > +}
> > > > +
> > > > +static void vhost_svq_translate_addr(const VhostShadowVirtqueue *s=
vq,
> > > > +                                     struct iovec *iovec, size_t n=
um)
> > > > +{
> > > > +    size_t i;
> > > > +
> > > > +    for (i =3D 0; i < num; ++i) {
> > > > +        VhostDMAMap needle =3D {
> > > > +            .translated_addr =3D iovec[i].iov_base,
> > > > +            .size =3D iovec[i].iov_len,
> > > > +        };
> > > > +        size_t off;
> > > > +
> > > > +        const VhostDMAMap *map =3D vhost_iova_tree_find_iova(svq->=
iova_map,
> > > > +                                                           &needle=
);
> > >
> > >
> > > Is it possible that we end up with more than one maps here?
> > >
> >
> > Actually it is possible, since there is no guarantee that one
> > descriptor (or indirect descriptor) maps exactly to one iov. It could
> > map to many if qemu vaddr is not contiguous but GPA + size is. This is
> > something that must be fixed for the next revision, so thanks for
> > pointing it out!
> >
> > Taking that into account, the condition that svq vring avail_idx -
> > used_idx was always less or equal than guest's vring avail_idx -
> > used_idx is not true anymore. Checking for that before adding buffers
> > to SVQ is the easy part, but how could we recover in that case?
> >
> > I think that the easy solution is to check for more available buffers
> > unconditionally at the end of vhost_svq_handle_call, which handles the
> > SVQ used and is supposed to make more room for available buffers. So
> > vhost_handle_guest_kick would not check if eventfd is set or not
> > anymore.
> >
> > Would that make sense?
>
> Yes, I think it should work.

Btw, I wonder how to handle indirect descriptors. SVQ doesn't use
indirect descriptors for now, but it looks like a must otherwise we
may end up SVQ is full before VQ.

It looks to me an easy way is to always use indirect descriptors if #sg >=
=3D 2?

Thanks

>
> Thanks
>
> >
> > Thanks!
> >
> > >
> > > > +        /*
> > > > +         * Map cannot be NULL since iova map contains all guest sp=
ace and
> > > > +         * qemu already has a physical address mapped
> > > > +         */
> > > > +        assert(map);
> > > > +
> > > > +        /*
> > > > +         * Map->iova chunk size is ignored. What to do if descript=
or
> > > > +         * (addr, size) does not fit is delegated to the device.
> > > > +         */
> > > > +        off =3D needle.translated_addr - map->translated_addr;
> > > > +        iovec[i].iov_base =3D (void *)(map->iova + off);
> > > > +    }
> > > > +}
> > > > +
> > > >   static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
> > > >                                       const struct iovec *iovec,
> > > >                                       size_t num, bool more_descs, =
bool write)
> > > > @@ -156,8 +217,9 @@ static void vhost_vring_write_descs(VhostShadow=
Virtqueue *svq,
> > > >   }
> > > >
> > > >   static unsigned vhost_svq_add_split(VhostShadowVirtqueue *svq,
> > > > -                                    VirtQueueElement *elem)
> > > > +                                    SVQElement *svq_elem)
> > > >   {
> > > > +    VirtQueueElement *elem =3D &svq_elem->elem;
> > > >       int head;
> > > >       unsigned avail_idx;
> > > >       vring_avail_t *avail =3D svq->vring.avail;
> > > > @@ -167,6 +229,12 @@ static unsigned vhost_svq_add_split(VhostShado=
wVirtqueue *svq,
> > > >       /* We need some descriptors here */
> > > >       assert(elem->out_num || elem->in_num);
> > > >
> > > > +    vhost_svq_stash_addr(&svq_elem->in_sg_stash, elem->in_sg, elem=
->in_num);
> > > > +    vhost_svq_stash_addr(&svq_elem->out_sg_stash, elem->out_sg, el=
em->out_num);
> > >
> > >
> > > I wonder if we can solve the trick like stash and unstash with a
> > > dedicated sgs in svq_elem, instead of reusing the elem.
> > >
> >
> > Actually yes, it would be way simpler to use a new sgs array in
> > svq_elem. I will change that.
> >
> > Thanks!
> >
> > > Thanks
> > >
> > >
> > > > +
> > > > +    vhost_svq_translate_addr(svq, elem->in_sg, elem->in_num);
> > > > +    vhost_svq_translate_addr(svq, elem->out_sg, elem->out_num);
> > > > +
> > > >       vhost_vring_write_descs(svq, elem->out_sg, elem->out_num,
> > > >                               elem->in_num > 0, false);
> > > >       vhost_vring_write_descs(svq, elem->in_sg, elem->in_num, false=
, true);
> > > > @@ -187,7 +255,7 @@ static unsigned vhost_svq_add_split(VhostShadow=
Virtqueue *svq,
> > > >
> > > >   }
> > > >
> > > > -static void vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElem=
ent *elem)
> > > > +static void vhost_svq_add(VhostShadowVirtqueue *svq, SVQElement *e=
lem)
> > > >   {
> > > >       unsigned qemu_head =3D vhost_svq_add_split(svq, elem);
> > > >
> > > > @@ -221,7 +289,7 @@ static void vhost_handle_guest_kick(EventNotifi=
er *n)
> > > >           }
> > > >
> > > >           while (true) {
> > > > -            VirtQueueElement *elem =3D virtqueue_pop(svq->vq, size=
of(*elem));
> > > > +            SVQElement *elem =3D virtqueue_pop(svq->vq, sizeof(*el=
em));
> > > >               if (!elem) {
> > > >                   break;
> > > >               }
> > > > @@ -247,7 +315,7 @@ static bool vhost_svq_more_used(VhostShadowVirt=
queue *svq)
> > > >       return svq->used_idx !=3D svq->shadow_used_idx;
> > > >   }
> > > >
> > > > -static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *s=
vq)
> > > > +static SVQElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq)
> > > >   {
> > > >       vring_desc_t *descs =3D svq->vring.desc;
> > > >       const vring_used_t *used =3D svq->vring.used;
> > > > @@ -279,7 +347,7 @@ static VirtQueueElement *vhost_svq_get_buf(Vhos=
tShadowVirtqueue *svq)
> > > >       descs[used_elem.id].next =3D svq->free_head;
> > > >       svq->free_head =3D used_elem.id;
> > > >
> > > > -    svq->ring_id_maps[used_elem.id]->len =3D used_elem.len;
> > > > +    svq->ring_id_maps[used_elem.id]->elem.len =3D used_elem.len;
> > > >       return g_steal_pointer(&svq->ring_id_maps[used_elem.id]);
> > > >   }
> > > >
> > > > @@ -296,12 +364,19 @@ static void vhost_svq_handle_call_no_test(Eve=
ntNotifier *n)
> > > >
> > > >           vhost_svq_set_notification(svq, false);
> > > >           while (true) {
> > > > -            g_autofree VirtQueueElement *elem =3D vhost_svq_get_bu=
f(svq);
> > > > -            if (!elem) {
> > > > +            g_autofree SVQElement *svq_elem =3D vhost_svq_get_buf(=
svq);
> > > > +            VirtQueueElement *elem;
> > > > +            if (!svq_elem) {
> > > >                   break;
> > > >               }
> > > >
> > > >               assert(i < svq->vring.num);
> > > > +            elem =3D &svq_elem->elem;
> > > > +
> > > > +            vhost_svq_unstash_addr(svq_elem->in_sg_stash, elem->in=
_sg,
> > > > +                                   elem->in_num);
> > > > +            vhost_svq_unstash_addr(svq_elem->out_sg_stash, elem->o=
ut_sg,
> > > > +                                   elem->out_num);
> > > >               virtqueue_fill(vq, elem, elem->len, i++);
> > > >           }
> > > >
> > > > @@ -451,14 +526,24 @@ void vhost_svq_stop(struct vhost_dev *dev, un=
signed idx,
> > > >       event_notifier_set_handler(&svq->host_notifier, NULL);
> > > >
> > > >       for (i =3D 0; i < svq->vring.num; ++i) {
> > > > -        g_autofree VirtQueueElement *elem =3D svq->ring_id_maps[i]=
;
> > > > +        g_autofree SVQElement *svq_elem =3D svq->ring_id_maps[i];
> > > > +        VirtQueueElement *elem;
> > > > +
> > > > +        if (!svq_elem) {
> > > > +            continue;
> > > > +        }
> > > > +
> > > > +        elem =3D &svq_elem->elem;
> > > > +        vhost_svq_unstash_addr(svq_elem->in_sg_stash, elem->in_sg,
> > > > +                               elem->in_num);
> > > > +        vhost_svq_unstash_addr(svq_elem->out_sg_stash, elem->out_s=
g,
> > > > +                               elem->out_num);
> > > > +
> > > >           /*
> > > >            * Although the doc says we must unpop in order, it's ok =
to unpop
> > > >            * everything.
> > > >            */
> > > > -        if (elem) {
> > > > -            virtqueue_unpop(svq->vq, elem, elem->len);
> > > > -        }
> > > > +        virtqueue_unpop(svq->vq, elem, elem->len);
> > > >       }
> > > >   }
> > > >
> > > > @@ -466,7 +551,8 @@ void vhost_svq_stop(struct vhost_dev *dev, unsi=
gned idx,
> > > >    * Creates vhost shadow virtqueue, and instruct vhost device to u=
se the shadow
> > > >    * methods and file descriptors.
> > > >    */
> > > > -VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx=
)
> > > > +VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx=
,
> > > > +                                    VhostIOVATree *iova_map)
> > > >   {
> > > >       int vq_idx =3D dev->vq_index + idx;
> > > >       unsigned num =3D virtio_queue_get_num(dev->vdev, vq_idx);
> > > > @@ -500,11 +586,13 @@ VhostShadowVirtqueue *vhost_svq_new(struct vh=
ost_dev *dev, int idx)
> > > >       memset(svq->vring.desc, 0, driver_size);
> > > >       svq->vring.used =3D qemu_memalign(qemu_real_host_page_size, d=
evice_size);
> > > >       memset(svq->vring.used, 0, device_size);
> > > > +    svq->iova_map =3D iova_map;
> > > > +
> > > >       for (i =3D 0; i < num - 1; i++) {
> > > >           svq->vring.desc[i].next =3D cpu_to_le16(i + 1);
> > > >       }
> > > >
> > > > -    svq->ring_id_maps =3D g_new0(VirtQueueElement *, num);
> > > > +    svq->ring_id_maps =3D g_new0(SVQElement *, num);
> > > >       event_notifier_set_handler(&svq->call_notifier,
> > > >                                  vhost_svq_handle_call);
> > > >       return g_steal_pointer(&svq);
> > > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > > index a9c680b487..f5a12fee9d 100644
> > > > --- a/hw/virtio/vhost-vdpa.c
> > > > +++ b/hw/virtio/vhost-vdpa.c
> > > > @@ -176,6 +176,18 @@ static void vhost_vdpa_listener_region_add(Mem=
oryListener *listener,
> > > >                                            vaddr, section->readonly=
);
> > > >
> > > >       llsize =3D int128_sub(llend, int128_make64(iova));
> > > > +    if (v->shadow_vqs_enabled) {
> > > > +        VhostDMAMap mem_region =3D {
> > > > +            .translated_addr =3D vaddr,
> > > > +            .size =3D int128_get64(llsize) - 1,
> > > > +            .perm =3D IOMMU_ACCESS_FLAG(true, section->readonly),
> > > > +        };
> > > > +
> > > > +        int r =3D vhost_iova_tree_alloc(v->iova_map, &mem_region);
> > > > +        assert(r =3D=3D VHOST_DMA_MAP_OK);
> > > > +
> > > > +        iova =3D mem_region.iova;
> > > > +    }
> > > >
> > > >       ret =3D vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
> > > >                                vaddr, section->readonly);
> > > > @@ -754,6 +766,23 @@ static bool  vhost_vdpa_force_iommu(struct vho=
st_dev *dev)
> > > >       return true;
> > > >   }
> > > >
> > > > +static int vhost_vdpa_get_iova_range(struct vhost_dev *dev,
> > > > +                                     hwaddr *first, hwaddr *last)
> > > > +{
> > > > +    int ret;
> > > > +    struct vhost_vdpa_iova_range range;
> > > > +
> > > > +    ret =3D vhost_vdpa_call(dev, VHOST_VDPA_GET_IOVA_RANGE, &range=
);
> > > > +    if (ret !=3D 0) {
> > > > +        return ret;
> > > > +    }
> > > > +
> > > > +    *first =3D range.first;
> > > > +    *last =3D range.last;
> > > > +    trace_vhost_vdpa_get_iova_range(dev, *first, *last);
> > > > +    return ret;
> > > > +}
> > > > +
> > > >   /**
> > > >    * Maps QEMU vaddr memory to device in a suitable way for shadow =
virtqueue:
> > > >    * - It always reference qemu memory address, not guest's memory.
> > > > @@ -881,6 +910,7 @@ static bool vhost_vdpa_svq_start_vq(struct vhos=
t_dev *dev, unsigned idx)
> > > >   static unsigned vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool =
enable)
> > > >   {
> > > >       struct vhost_dev *hdev =3D v->dev;
> > > > +    hwaddr iova_first, iova_last;
> > > >       unsigned n;
> > > >       int r;
> > > >
> > > > @@ -894,7 +924,7 @@ static unsigned vhost_vdpa_enable_svq(struct vh=
ost_vdpa *v, bool enable)
> > > >           /* Allocate resources */
> > > >           assert(v->shadow_vqs->len =3D=3D 0);
> > > >           for (n =3D 0; n < hdev->nvqs; ++n) {
> > > > -            VhostShadowVirtqueue *svq =3D vhost_svq_new(hdev, n);
> > > > +            VhostShadowVirtqueue *svq =3D vhost_svq_new(hdev, n, v=
->iova_map);
> > > >               if (unlikely(!svq)) {
> > > >                   g_ptr_array_set_size(v->shadow_vqs, 0);
> > > >                   return 0;
> > > > @@ -903,6 +933,8 @@ static unsigned vhost_vdpa_enable_svq(struct vh=
ost_vdpa *v, bool enable)
> > > >           }
> > > >       }
> > > >
> > > > +    r =3D vhost_vdpa_get_iova_range(hdev, &iova_first, &iova_last)=
;
> > > > +    assert(r =3D=3D 0);
> > > >       r =3D vhost_vdpa_vring_pause(hdev);
> > > >       assert(r =3D=3D 0);
> > > >
> > > > @@ -913,6 +945,12 @@ static unsigned vhost_vdpa_enable_svq(struct v=
host_vdpa *v, bool enable)
> > > >           }
> > > >       }
> > > >
> > > > +    memory_listener_unregister(&v->listener);
> > > > +    if (vhost_vdpa_dma_unmap(v, iova_first,
> > > > +                             (iova_last - iova_first) & TARGET_PAG=
E_MASK)) {
> > > > +        error_report("Fail to invalidate device iotlb");
> > > > +    }
> > > > +
> > > >       /* Reset device so it can be configured */
> > > >       r =3D vhost_vdpa_dev_start(hdev, false);
> > > >       assert(r =3D=3D 0);
> > > > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > > > index 8ed19e9d0c..650e521e35 100644
> > > > --- a/hw/virtio/trace-events
> > > > +++ b/hw/virtio/trace-events
> > > > @@ -52,6 +52,7 @@ vhost_vdpa_set_vring_call(void *dev, unsigned int=
 index, int fd) "dev: %p index:
> > > >   vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p fe=
atures: 0x%"PRIx64
> > > >   vhost_vdpa_set_owner(void *dev) "dev: %p"
> > > >   vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_ad=
dr, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc=
_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PR=
Ix64
> > > > +vhost_vdpa_get_iova_range(void *dev, uint64_t first, uint64_t last=
) "dev: %p first: 0x%"PRIx64" last: 0x%"PRIx64
> > > >
> > > >   # virtio.c
> > > >   virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, u=
nsigned out_num) "elem %p size %zd in_num %u out_num %u"
> > >
> >


