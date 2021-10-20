Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A51174347A9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 11:09:13 +0200 (CEST)
Received: from localhost ([::1]:47162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md7ay-0006ig-O4
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 05:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1md7Vt-0000WC-6u
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 05:03:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1md7Vq-0001de-1z
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 05:03:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634720632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uPa+G+EcOKIk+DnST/Z0qBrDiuCIB9AbvSS2mQg806c=;
 b=AEO2I+JfKuWL66axt3P+yejOpB4/KII1z2kSNae9nk5UxGNfKmcvoK2DRJFyCZP2KHHW5o
 0W4pWBsSRMXra3rUjHkjicDuM4vBcEoRTA6TsHKsg4uYYWLzWwC/85/kAIxvIwzBKRXf3t
 xQT2II6v1lY4FmzuFIZlz9BP10cS4qU=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-sUol1OdaP1-lGgsCfoDF2g-1; Wed, 20 Oct 2021 05:03:51 -0400
X-MC-Unique: sUol1OdaP1-lGgsCfoDF2g-1
Received: by mail-lf1-f70.google.com with SMTP id
 p10-20020a056512234a00b003fe188e9960so2198340lfu.19
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 02:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uPa+G+EcOKIk+DnST/Z0qBrDiuCIB9AbvSS2mQg806c=;
 b=VK2Op2pLzp9blMidCN/Hly4dwHcY/cM+6ssiq0cahy9yjn2cfGzu2q/rlqabcTD/Da
 Ukg9DARiqPEBRDc5hKTOkahYtRJ/DegeKc5XC42dkGr8tAXpRWZorCupz2rr7FiWuaYV
 TLQWMt1zyPsRybCAEjLEXQmErLJG/PNpreKw2IiBHs8UTV+LXlgtoSBFklOhGiKZNyoC
 Rf4zqsUV31iOy0JT+z7/wUUQu5QO71ZB4GAi/iBGQUjubfs0+iclLTMR9JNURQONZjj7
 0Bq7IL5x/w+fyCGwXVBceElGnQUPum2YiXJB3xQHK+O18UTHs0eeQZ44iqviMv/G10IB
 ay6w==
X-Gm-Message-State: AOAM532UlJUkZZToSikTA0mrTAe9/u4d4jaNRacU2FP8DcHKMKAPcJmz
 GoqPLqLkcRyU1LIzTqeBKwZr6aqaQ9W0nc2vq0GkikUwV1/TuXeKNk5igxLuS9BEH6CVddfi9rU
 4Pzl7BQJjH9HRVsMTlEMYyzYmuL9fhXI=
X-Received: by 2002:a2e:5c8:: with SMTP id 191mr12527994ljf.107.1634720629761; 
 Wed, 20 Oct 2021 02:03:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwedZdGsGbXWESIB+xX4h2of3eqda0QX5D9OOTiMzR7h2kuAF684R7K1Asz8xC6AvaS2cysF6R0SOapXBqdUOU=
X-Received: by 2002:a2e:5c8:: with SMTP id 191mr12527937ljf.107.1634720629259; 
 Wed, 20 Oct 2021 02:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-21-eperezma@redhat.com>
 <a426c22c-f41a-4e3f-d140-7e7a0defeacb@redhat.com>
 <CAJaqyWcRcm9rwuTqJHS0FmuMrXpoCvF34TzXKQmxXTfZssZ-jA@mail.gmail.com>
 <CACGkMEtgOc6ccaV5fckMwgEccEwL=sfuvkGymjAsQh7Tvn9krw@mail.gmail.com>
 <CACGkMEsjnnsTbCOdEP6iq8Fwc0=BSKfheGPubg7bcbF-BPU1gg@mail.gmail.com>
 <CAJaqyWe6R_32Se75XF3+NUZyiWr+cLYQ_86LExmom-vCRT9G0g@mail.gmail.com>
In-Reply-To: <CAJaqyWe6R_32Se75XF3+NUZyiWr+cLYQ_86LExmom-vCRT9G0g@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 20 Oct 2021 17:03:38 +0800
Message-ID: <CACGkMEs_HEfV6PE4LRex7cqKtux2RtQUDz8MTgROa2dWchNfwg@mail.gmail.com>
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

On Wed, Oct 20, 2021 at 2:52 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Wed, Oct 20, 2021 at 4:07 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Wed, Oct 20, 2021 at 10:02 AM Jason Wang <jasowang@redhat.com> wrote=
:
> > >
> > > On Tue, Oct 19, 2021 at 6:29 PM Eugenio Perez Martin
> > > <eperezma@redhat.com> wrote:
> > > >
> > > > On Tue, Oct 19, 2021 at 11:25 AM Jason Wang <jasowang@redhat.com> w=
rote:
> > > > >
> > > > >
> > > > > =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:06, Eugenio P=C3=A9rez =
=E5=86=99=E9=81=93:
> > > > > > Use translations added in VhostIOVATree in SVQ.
> > > > > >
> > > > > > Now every element needs to store the previous address also, so =
VirtQueue
> > > > > > can consume the elements properly. This adds a little overhead =
per VQ
> > > > > > element, having to allocate more memory to stash them. As a pos=
sible
> > > > > > optimization, this allocation could be avoided if the descripto=
r is not
> > > > > > a chain but a single one, but this is left undone.
> > > > > >
> > > > > > TODO: iova range should be queried before, and add logic to fai=
l when
> > > > > > GPA is outside of its range and memory listener or svq add it.
> > > > > >
> > > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > > ---
> > > > > >   hw/virtio/vhost-shadow-virtqueue.h |   4 +-
> > > > > >   hw/virtio/vhost-shadow-virtqueue.c | 130 ++++++++++++++++++++=
++++-----
> > > > > >   hw/virtio/vhost-vdpa.c             |  40 ++++++++-
> > > > > >   hw/virtio/trace-events             |   1 +
> > > > > >   4 files changed, 152 insertions(+), 23 deletions(-)
> > > > > >
> > > > > > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vho=
st-shadow-virtqueue.h
> > > > > > index b7baa424a7..a0e6b5267a 100644
> > > > > > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > > > > > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > > > > > @@ -11,6 +11,7 @@
> > > > > >   #define VHOST_SHADOW_VIRTQUEUE_H
> > > > > >
> > > > > >   #include "hw/virtio/vhost.h"
> > > > > > +#include "hw/virtio/vhost-iova-tree.h"
> > > > > >
> > > > > >   typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> > > > > >
> > > > > > @@ -28,7 +29,8 @@ bool vhost_svq_start(struct vhost_dev *dev, u=
nsigned idx,
> > > > > >   void vhost_svq_stop(struct vhost_dev *dev, unsigned idx,
> > > > > >                       VhostShadowVirtqueue *svq);
> > > > > >
> > > > > > -VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int=
 idx);
> > > > > > +VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int=
 idx,
> > > > > > +                                    VhostIOVATree *iova_map);
> > > > > >
> > > > > >   void vhost_svq_free(VhostShadowVirtqueue *vq);
> > > > > >
> > > > > > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vho=
st-shadow-virtqueue.c
> > > > > > index 2fd0bab75d..9db538547e 100644
> > > > > > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > > > > > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > > > > > @@ -11,12 +11,19 @@
> > > > > >   #include "hw/virtio/vhost-shadow-virtqueue.h"
> > > > > >   #include "hw/virtio/vhost.h"
> > > > > >   #include "hw/virtio/virtio-access.h"
> > > > > > +#include "hw/virtio/vhost-iova-tree.h"
> > > > > >
> > > > > >   #include "standard-headers/linux/vhost_types.h"
> > > > > >
> > > > > >   #include "qemu/error-report.h"
> > > > > >   #include "qemu/main-loop.h"
> > > > > >
> > > > > > +typedef struct SVQElement {
> > > > > > +    VirtQueueElement elem;
> > > > > > +    void **in_sg_stash;
> > > > > > +    void **out_sg_stash;
> > > > > > +} SVQElement;
> > > > > > +
> > > > > >   /* Shadow virtqueue to relay notifications */
> > > > > >   typedef struct VhostShadowVirtqueue {
> > > > > >       /* Shadow vring */
> > > > > > @@ -46,8 +53,11 @@ typedef struct VhostShadowVirtqueue {
> > > > > >       /* Virtio device */
> > > > > >       VirtIODevice *vdev;
> > > > > >
> > > > > > +    /* IOVA mapping if used */
> > > > > > +    VhostIOVATree *iova_map;
> > > > > > +
> > > > > >       /* Map for returning guest's descriptors */
> > > > > > -    VirtQueueElement **ring_id_maps;
> > > > > > +    SVQElement **ring_id_maps;
> > > > > >
> > > > > >       /* Next head to expose to device */
> > > > > >       uint16_t avail_idx_shadow;
> > > > > > @@ -79,13 +89,6 @@ bool vhost_svq_valid_device_features(uint64_=
t *dev_features)
> > > > > >               continue;
> > > > > >
> > > > > >           case VIRTIO_F_ACCESS_PLATFORM:
> > > > > > -            /* SVQ needs this feature disabled. Can't continue=
 */
> > > > > > -            if (*dev_features & BIT_ULL(b)) {
> > > > > > -                clear_bit(b, dev_features);
> > > > > > -                r =3D false;
> > > > > > -            }
> > > > > > -            break;
> > > > > > -
> > > > > >           case VIRTIO_F_VERSION_1:
> > > > > >               /* SVQ needs this feature, so can't continue */
> > > > > >               if (!(*dev_features & BIT_ULL(b))) {
> > > > > > @@ -126,6 +129,64 @@ static void vhost_svq_set_notification(Vho=
stShadowVirtqueue *svq, bool enable)
> > > > > >       }
> > > > > >   }
> > > > > >
> > > > > > +static void vhost_svq_stash_addr(void ***stash, const struct i=
ovec *iov,
> > > > > > +                                 size_t num)
> > > > > > +{
> > > > > > +    size_t i;
> > > > > > +
> > > > > > +    if (num =3D=3D 0) {
> > > > > > +        return;
> > > > > > +    }
> > > > > > +
> > > > > > +    *stash =3D g_new(void *, num);
> > > > > > +    for (i =3D 0; i < num; ++i) {
> > > > > > +        (*stash)[i] =3D iov[i].iov_base;
> > > > > > +    }
> > > > > > +}
> > > > > > +
> > > > > > +static void vhost_svq_unstash_addr(void **stash, struct iovec =
*iov, size_t num)
> > > > > > +{
> > > > > > +    size_t i;
> > > > > > +
> > > > > > +    if (num =3D=3D 0) {
> > > > > > +        return;
> > > > > > +    }
> > > > > > +
> > > > > > +    for (i =3D 0; i < num; ++i) {
> > > > > > +        iov[i].iov_base =3D stash[i];
> > > > > > +    }
> > > > > > +    g_free(stash);
> > > > > > +}
> > > > > > +
> > > > > > +static void vhost_svq_translate_addr(const VhostShadowVirtqueu=
e *svq,
> > > > > > +                                     struct iovec *iovec, size=
_t num)
> > > > > > +{
> > > > > > +    size_t i;
> > > > > > +
> > > > > > +    for (i =3D 0; i < num; ++i) {
> > > > > > +        VhostDMAMap needle =3D {
> > > > > > +            .translated_addr =3D iovec[i].iov_base,
> > > > > > +            .size =3D iovec[i].iov_len,
> > > > > > +        };
> > > > > > +        size_t off;
> > > > > > +
> > > > > > +        const VhostDMAMap *map =3D vhost_iova_tree_find_iova(s=
vq->iova_map,
> > > > > > +                                                           &ne=
edle);
> > > > >
> > > > >
> > > > > Is it possible that we end up with more than one maps here?
> > > > >
> > > >
> > > > Actually it is possible, since there is no guarantee that one
> > > > descriptor (or indirect descriptor) maps exactly to one iov. It cou=
ld
> > > > map to many if qemu vaddr is not contiguous but GPA + size is. This=
 is
> > > > something that must be fixed for the next revision, so thanks for
> > > > pointing it out!
> > > >
> > > > Taking that into account, the condition that svq vring avail_idx -
> > > > used_idx was always less or equal than guest's vring avail_idx -
> > > > used_idx is not true anymore. Checking for that before adding buffe=
rs
> > > > to SVQ is the easy part, but how could we recover in that case?
> > > >
> > > > I think that the easy solution is to check for more available buffe=
rs
> > > > unconditionally at the end of vhost_svq_handle_call, which handles =
the
> > > > SVQ used and is supposed to make more room for available buffers. S=
o
> > > > vhost_handle_guest_kick would not check if eventfd is set or not
> > > > anymore.
> > > >
> > > > Would that make sense?
> > >
> > > Yes, I think it should work.
> >
> > Btw, I wonder how to handle indirect descriptors. SVQ doesn't use
> > indirect descriptors for now, but it looks like a must otherwise we
> > may end up SVQ is full before VQ.
> >
>
> We can get to that situation without indirect too, if a single
> descriptor maps to more than one sg buffer. The next revision is going
> to control that too.
>
> > It looks to me an easy way is to always use indirect descriptors if #sg=
 >=3D 2?
> >
>
> I will use that, but that does not solve the case where a descriptor
> maps to > 1 different buffers in qemu vaddr.

Right, so we need to deal with the case when SVQ is out of space.


> So I think that some
> check after marking descriptors as used is a must somehow.

I thought it should be before processing the available buffer? It's
the guest driver that make sure there's sufficient space for used
ring?

Thanks

>
>
> > Thanks
> >
> > >
> > > Thanks
> > >
> > > >
> > > > Thanks!
> > > >
> > > > >
> > > > > > +        /*
> > > > > > +         * Map cannot be NULL since iova map contains all gues=
t space and
> > > > > > +         * qemu already has a physical address mapped
> > > > > > +         */
> > > > > > +        assert(map);
> > > > > > +
> > > > > > +        /*
> > > > > > +         * Map->iova chunk size is ignored. What to do if desc=
riptor
> > > > > > +         * (addr, size) does not fit is delegated to the devic=
e.
> > > > > > +         */
> > > > > > +        off =3D needle.translated_addr - map->translated_addr;
> > > > > > +        iovec[i].iov_base =3D (void *)(map->iova + off);
> > > > > > +    }
> > > > > > +}
> > > > > > +
> > > > > >   static void vhost_vring_write_descs(VhostShadowVirtqueue *svq=
,
> > > > > >                                       const struct iovec *iovec=
,
> > > > > >                                       size_t num, bool more_des=
cs, bool write)
> > > > > > @@ -156,8 +217,9 @@ static void vhost_vring_write_descs(VhostSh=
adowVirtqueue *svq,
> > > > > >   }
> > > > > >
> > > > > >   static unsigned vhost_svq_add_split(VhostShadowVirtqueue *svq=
,
> > > > > > -                                    VirtQueueElement *elem)
> > > > > > +                                    SVQElement *svq_elem)
> > > > > >   {
> > > > > > +    VirtQueueElement *elem =3D &svq_elem->elem;
> > > > > >       int head;
> > > > > >       unsigned avail_idx;
> > > > > >       vring_avail_t *avail =3D svq->vring.avail;
> > > > > > @@ -167,6 +229,12 @@ static unsigned vhost_svq_add_split(VhostS=
hadowVirtqueue *svq,
> > > > > >       /* We need some descriptors here */
> > > > > >       assert(elem->out_num || elem->in_num);
> > > > > >
> > > > > > +    vhost_svq_stash_addr(&svq_elem->in_sg_stash, elem->in_sg, =
elem->in_num);
> > > > > > +    vhost_svq_stash_addr(&svq_elem->out_sg_stash, elem->out_sg=
, elem->out_num);
> > > > >
> > > > >
> > > > > I wonder if we can solve the trick like stash and unstash with a
> > > > > dedicated sgs in svq_elem, instead of reusing the elem.
> > > > >
> > > >
> > > > Actually yes, it would be way simpler to use a new sgs array in
> > > > svq_elem. I will change that.
> > > >
> > > > Thanks!
> > > >
> > > > > Thanks
> > > > >
> > > > >
> > > > > > +
> > > > > > +    vhost_svq_translate_addr(svq, elem->in_sg, elem->in_num);
> > > > > > +    vhost_svq_translate_addr(svq, elem->out_sg, elem->out_num)=
;
> > > > > > +
> > > > > >       vhost_vring_write_descs(svq, elem->out_sg, elem->out_num,
> > > > > >                               elem->in_num > 0, false);
> > > > > >       vhost_vring_write_descs(svq, elem->in_sg, elem->in_num, f=
alse, true);
> > > > > > @@ -187,7 +255,7 @@ static unsigned vhost_svq_add_split(VhostSh=
adowVirtqueue *svq,
> > > > > >
> > > > > >   }
> > > > > >
> > > > > > -static void vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueue=
Element *elem)
> > > > > > +static void vhost_svq_add(VhostShadowVirtqueue *svq, SVQElemen=
t *elem)
> > > > > >   {
> > > > > >       unsigned qemu_head =3D vhost_svq_add_split(svq, elem);
> > > > > >
> > > > > > @@ -221,7 +289,7 @@ static void vhost_handle_guest_kick(EventNo=
tifier *n)
> > > > > >           }
> > > > > >
> > > > > >           while (true) {
> > > > > > -            VirtQueueElement *elem =3D virtqueue_pop(svq->vq, =
sizeof(*elem));
> > > > > > +            SVQElement *elem =3D virtqueue_pop(svq->vq, sizeof=
(*elem));
> > > > > >               if (!elem) {
> > > > > >                   break;
> > > > > >               }
> > > > > > @@ -247,7 +315,7 @@ static bool vhost_svq_more_used(VhostShadow=
Virtqueue *svq)
> > > > > >       return svq->used_idx !=3D svq->shadow_used_idx;
> > > > > >   }
> > > > > >
> > > > > > -static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueu=
e *svq)
> > > > > > +static SVQElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq=
)
> > > > > >   {
> > > > > >       vring_desc_t *descs =3D svq->vring.desc;
> > > > > >       const vring_used_t *used =3D svq->vring.used;
> > > > > > @@ -279,7 +347,7 @@ static VirtQueueElement *vhost_svq_get_buf(=
VhostShadowVirtqueue *svq)
> > > > > >       descs[used_elem.id].next =3D svq->free_head;
> > > > > >       svq->free_head =3D used_elem.id;
> > > > > >
> > > > > > -    svq->ring_id_maps[used_elem.id]->len =3D used_elem.len;
> > > > > > +    svq->ring_id_maps[used_elem.id]->elem.len =3D used_elem.le=
n;
> > > > > >       return g_steal_pointer(&svq->ring_id_maps[used_elem.id]);
> > > > > >   }
> > > > > >
> > > > > > @@ -296,12 +364,19 @@ static void vhost_svq_handle_call_no_test=
(EventNotifier *n)
> > > > > >
> > > > > >           vhost_svq_set_notification(svq, false);
> > > > > >           while (true) {
> > > > > > -            g_autofree VirtQueueElement *elem =3D vhost_svq_ge=
t_buf(svq);
> > > > > > -            if (!elem) {
> > > > > > +            g_autofree SVQElement *svq_elem =3D vhost_svq_get_=
buf(svq);
> > > > > > +            VirtQueueElement *elem;
> > > > > > +            if (!svq_elem) {
> > > > > >                   break;
> > > > > >               }
> > > > > >
> > > > > >               assert(i < svq->vring.num);
> > > > > > +            elem =3D &svq_elem->elem;
> > > > > > +
> > > > > > +            vhost_svq_unstash_addr(svq_elem->in_sg_stash, elem=
->in_sg,
> > > > > > +                                   elem->in_num);
> > > > > > +            vhost_svq_unstash_addr(svq_elem->out_sg_stash, ele=
m->out_sg,
> > > > > > +                                   elem->out_num);
> > > > > >               virtqueue_fill(vq, elem, elem->len, i++);
> > > > > >           }
> > > > > >
> > > > > > @@ -451,14 +526,24 @@ void vhost_svq_stop(struct vhost_dev *dev=
, unsigned idx,
> > > > > >       event_notifier_set_handler(&svq->host_notifier, NULL);
> > > > > >
> > > > > >       for (i =3D 0; i < svq->vring.num; ++i) {
> > > > > > -        g_autofree VirtQueueElement *elem =3D svq->ring_id_map=
s[i];
> > > > > > +        g_autofree SVQElement *svq_elem =3D svq->ring_id_maps[=
i];
> > > > > > +        VirtQueueElement *elem;
> > > > > > +
> > > > > > +        if (!svq_elem) {
> > > > > > +            continue;
> > > > > > +        }
> > > > > > +
> > > > > > +        elem =3D &svq_elem->elem;
> > > > > > +        vhost_svq_unstash_addr(svq_elem->in_sg_stash, elem->in=
_sg,
> > > > > > +                               elem->in_num);
> > > > > > +        vhost_svq_unstash_addr(svq_elem->out_sg_stash, elem->o=
ut_sg,
> > > > > > +                               elem->out_num);
> > > > > > +
> > > > > >           /*
> > > > > >            * Although the doc says we must unpop in order, it's=
 ok to unpop
> > > > > >            * everything.
> > > > > >            */
> > > > > > -        if (elem) {
> > > > > > -            virtqueue_unpop(svq->vq, elem, elem->len);
> > > > > > -        }
> > > > > > +        virtqueue_unpop(svq->vq, elem, elem->len);
> > > > > >       }
> > > > > >   }
> > > > > >
> > > > > > @@ -466,7 +551,8 @@ void vhost_svq_stop(struct vhost_dev *dev, =
unsigned idx,
> > > > > >    * Creates vhost shadow virtqueue, and instruct vhost device =
to use the shadow
> > > > > >    * methods and file descriptors.
> > > > > >    */
> > > > > > -VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int=
 idx)
> > > > > > +VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int=
 idx,
> > > > > > +                                    VhostIOVATree *iova_map)
> > > > > >   {
> > > > > >       int vq_idx =3D dev->vq_index + idx;
> > > > > >       unsigned num =3D virtio_queue_get_num(dev->vdev, vq_idx);
> > > > > > @@ -500,11 +586,13 @@ VhostShadowVirtqueue *vhost_svq_new(struc=
t vhost_dev *dev, int idx)
> > > > > >       memset(svq->vring.desc, 0, driver_size);
> > > > > >       svq->vring.used =3D qemu_memalign(qemu_real_host_page_siz=
e, device_size);
> > > > > >       memset(svq->vring.used, 0, device_size);
> > > > > > +    svq->iova_map =3D iova_map;
> > > > > > +
> > > > > >       for (i =3D 0; i < num - 1; i++) {
> > > > > >           svq->vring.desc[i].next =3D cpu_to_le16(i + 1);
> > > > > >       }
> > > > > >
> > > > > > -    svq->ring_id_maps =3D g_new0(VirtQueueElement *, num);
> > > > > > +    svq->ring_id_maps =3D g_new0(SVQElement *, num);
> > > > > >       event_notifier_set_handler(&svq->call_notifier,
> > > > > >                                  vhost_svq_handle_call);
> > > > > >       return g_steal_pointer(&svq);
> > > > > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > > > > index a9c680b487..f5a12fee9d 100644
> > > > > > --- a/hw/virtio/vhost-vdpa.c
> > > > > > +++ b/hw/virtio/vhost-vdpa.c
> > > > > > @@ -176,6 +176,18 @@ static void vhost_vdpa_listener_region_add=
(MemoryListener *listener,
> > > > > >                                            vaddr, section->read=
only);
> > > > > >
> > > > > >       llsize =3D int128_sub(llend, int128_make64(iova));
> > > > > > +    if (v->shadow_vqs_enabled) {
> > > > > > +        VhostDMAMap mem_region =3D {
> > > > > > +            .translated_addr =3D vaddr,
> > > > > > +            .size =3D int128_get64(llsize) - 1,
> > > > > > +            .perm =3D IOMMU_ACCESS_FLAG(true, section->readonl=
y),
> > > > > > +        };
> > > > > > +
> > > > > > +        int r =3D vhost_iova_tree_alloc(v->iova_map, &mem_regi=
on);
> > > > > > +        assert(r =3D=3D VHOST_DMA_MAP_OK);
> > > > > > +
> > > > > > +        iova =3D mem_region.iova;
> > > > > > +    }
> > > > > >
> > > > > >       ret =3D vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
> > > > > >                                vaddr, section->readonly);
> > > > > > @@ -754,6 +766,23 @@ static bool  vhost_vdpa_force_iommu(struct=
 vhost_dev *dev)
> > > > > >       return true;
> > > > > >   }
> > > > > >
> > > > > > +static int vhost_vdpa_get_iova_range(struct vhost_dev *dev,
> > > > > > +                                     hwaddr *first, hwaddr *la=
st)
> > > > > > +{
> > > > > > +    int ret;
> > > > > > +    struct vhost_vdpa_iova_range range;
> > > > > > +
> > > > > > +    ret =3D vhost_vdpa_call(dev, VHOST_VDPA_GET_IOVA_RANGE, &r=
ange);
> > > > > > +    if (ret !=3D 0) {
> > > > > > +        return ret;
> > > > > > +    }
> > > > > > +
> > > > > > +    *first =3D range.first;
> > > > > > +    *last =3D range.last;
> > > > > > +    trace_vhost_vdpa_get_iova_range(dev, *first, *last);
> > > > > > +    return ret;
> > > > > > +}
> > > > > > +
> > > > > >   /**
> > > > > >    * Maps QEMU vaddr memory to device in a suitable way for sha=
dow virtqueue:
> > > > > >    * - It always reference qemu memory address, not guest's mem=
ory.
> > > > > > @@ -881,6 +910,7 @@ static bool vhost_vdpa_svq_start_vq(struct =
vhost_dev *dev, unsigned idx)
> > > > > >   static unsigned vhost_vdpa_enable_svq(struct vhost_vdpa *v, b=
ool enable)
> > > > > >   {
> > > > > >       struct vhost_dev *hdev =3D v->dev;
> > > > > > +    hwaddr iova_first, iova_last;
> > > > > >       unsigned n;
> > > > > >       int r;
> > > > > >
> > > > > > @@ -894,7 +924,7 @@ static unsigned vhost_vdpa_enable_svq(struc=
t vhost_vdpa *v, bool enable)
> > > > > >           /* Allocate resources */
> > > > > >           assert(v->shadow_vqs->len =3D=3D 0);
> > > > > >           for (n =3D 0; n < hdev->nvqs; ++n) {
> > > > > > -            VhostShadowVirtqueue *svq =3D vhost_svq_new(hdev, =
n);
> > > > > > +            VhostShadowVirtqueue *svq =3D vhost_svq_new(hdev, =
n, v->iova_map);
> > > > > >               if (unlikely(!svq)) {
> > > > > >                   g_ptr_array_set_size(v->shadow_vqs, 0);
> > > > > >                   return 0;
> > > > > > @@ -903,6 +933,8 @@ static unsigned vhost_vdpa_enable_svq(struc=
t vhost_vdpa *v, bool enable)
> > > > > >           }
> > > > > >       }
> > > > > >
> > > > > > +    r =3D vhost_vdpa_get_iova_range(hdev, &iova_first, &iova_l=
ast);
> > > > > > +    assert(r =3D=3D 0);
> > > > > >       r =3D vhost_vdpa_vring_pause(hdev);
> > > > > >       assert(r =3D=3D 0);
> > > > > >
> > > > > > @@ -913,6 +945,12 @@ static unsigned vhost_vdpa_enable_svq(stru=
ct vhost_vdpa *v, bool enable)
> > > > > >           }
> > > > > >       }
> > > > > >
> > > > > > +    memory_listener_unregister(&v->listener);
> > > > > > +    if (vhost_vdpa_dma_unmap(v, iova_first,
> > > > > > +                             (iova_last - iova_first) & TARGET=
_PAGE_MASK)) {
> > > > > > +        error_report("Fail to invalidate device iotlb");
> > > > > > +    }
> > > > > > +
> > > > > >       /* Reset device so it can be configured */
> > > > > >       r =3D vhost_vdpa_dev_start(hdev, false);
> > > > > >       assert(r =3D=3D 0);
> > > > > > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > > > > > index 8ed19e9d0c..650e521e35 100644
> > > > > > --- a/hw/virtio/trace-events
> > > > > > +++ b/hw/virtio/trace-events
> > > > > > @@ -52,6 +52,7 @@ vhost_vdpa_set_vring_call(void *dev, unsigned=
 int index, int fd) "dev: %p index:
> > > > > >   vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %=
p features: 0x%"PRIx64
> > > > > >   vhost_vdpa_set_owner(void *dev) "dev: %p"
> > > > > >   vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_use=
r_addr, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p =
desc_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x=
%"PRIx64
> > > > > > +vhost_vdpa_get_iova_range(void *dev, uint64_t first, uint64_t =
last) "dev: %p first: 0x%"PRIx64" last: 0x%"PRIx64
> > > > > >
> > > > > >   # virtio.c
> > > > > >   virtqueue_alloc_element(void *elem, size_t sz, unsigned in_nu=
m, unsigned out_num) "elem %p size %zd in_num %u out_num %u"
> > > > >
> > > >
> >
>


