Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7164A4FB7
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 20:51:07 +0100 (CET)
Received: from localhost ([::1]:57904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEche-0003n3-8W
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 14:51:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nEc6M-0003PU-3a
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:12:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nEc5m-0002KO-Gb
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:12:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643656311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pwb7gq/Grc/DyUkbqSdd7m/ULk5qcGgsOA8x9KL/X7Y=;
 b=Gw7OnmWLxEVtMld+IboXuAJbX+CWDVgYYrmyRy4yLU1Tuty/LizZ2VQ/2HwvOo3zk87KDY
 +Jl+4IbgP3zGTIhjlps3ubLWwZF5U2/YFbOHKAgi+Mq77cB/76OCZU6mJx417XZpe4PMFJ
 z9utyaqEa5c6dDAVAbFA+J3vUdEgeIA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-9iCjyxaBNlisuKligQ2DOA-1; Mon, 31 Jan 2022 14:11:50 -0500
X-MC-Unique: 9iCjyxaBNlisuKligQ2DOA-1
Received: by mail-qv1-f72.google.com with SMTP id
 gg10-20020a056214252a00b0041eeb1c2684so13660932qvb.21
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:11:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Pwb7gq/Grc/DyUkbqSdd7m/ULk5qcGgsOA8x9KL/X7Y=;
 b=rWUNsXImj4J+2SAuvzw5S5dxTSEprdI8+BbhDJgVfwrpJDpCaDfTo9Sjf7D6+weHex
 kaDi/7KaGwNrViMgUPR/Umdk/vY04oAUnGyjlCEUDXqUvogD8IAzrWjndh50kjoVRUv5
 Prpmnz9CAAFEzqSC7AU7P+pUPFlab/0+TiS3ZXTgxKD3C3BIqBqFY4zF3HWXWeKXR8ed
 dAUMhn0N3QmAzvoOlcA0STWeEsH+Ox2yDlYpuLJK8+cq2QoqNIHDFAyBBwj229CAkRoW
 YlY5joDMEOWxMISfZ51ShtVcTeC3A17Ww1OgapXCDtSQPl0CCcrbiz7ubTUigYB75kUv
 s1TA==
X-Gm-Message-State: AOAM531qTTuNZd4KHQbrPSbHO44ALDt2iYAsNI1hNYFcHKA2ddjd/otN
 BE+1+D2X1GDQVk+eFnxM2xRcYwWqaNCIou8G6DOjc22JjzuZCHanP/yXUTdZSnydXP3dqe1v3I0
 Ub3GsldoX76fqvtCLZ89rbtxOve0q9YU=
X-Received: by 2002:a05:620a:1996:: with SMTP id
 bm22mr13987562qkb.764.1643656309232; 
 Mon, 31 Jan 2022 11:11:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxebI/q/RbA5e0QeU7h9FShh7ypPYsym4S9BxRGEw7XuBB1BjTBJTpgzWFIbvIl7aL5GLKso7+VWfPLId9ieuM=
X-Received: by 2002:a05:620a:1996:: with SMTP id
 bm22mr13987525qkb.764.1643656308707; 
 Mon, 31 Jan 2022 11:11:48 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-24-eperezma@redhat.com>
 <e3b9ee89-46e0-cdbe-1093-5f067d2176ac@redhat.com>
In-Reply-To: <e3b9ee89-46e0-cdbe-1093-5f067d2176ac@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 31 Jan 2022 20:11:12 +0100
Message-ID: <CAJaqyWe1zH8bfaoxTyz_RXH=0q+Yk9H7QyUffaRB1fCV9oVLZQ@mail.gmail.com>
Subject: Re: [PATCH 23/31] vdpa: Add custom IOTLB translations to SVQ
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jan 30, 2022 at 6:58 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > Use translations added in VhostIOVATree in SVQ.
> >
> > Only introduce usage here, not allocation and deallocation. As with
> > previous patches, we use the dead code paths of shadow_vqs_enabled to
> > avoid commiting too many changes at once. These are impossible to take
> > at the moment.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.h |   3 +-
> >   include/hw/virtio/vhost-vdpa.h     |   3 +
> >   hw/virtio/vhost-shadow-virtqueue.c | 111 ++++++++++++++++----
> >   hw/virtio/vhost-vdpa.c             | 161 +++++++++++++++++++++++++---=
-
> >   4 files changed, 238 insertions(+), 40 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index 19c934af49..c6f67d6f76 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -12,6 +12,7 @@
> >
> >   #include "hw/virtio/vhost.h"
> >   #include "qemu/event_notifier.h"
> > +#include "hw/virtio/vhost-iova-tree.h"
> >
> >   typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> >
> > @@ -37,7 +38,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtI=
ODevice *vdev,
> >                        VirtQueue *vq);
> >   void vhost_svq_stop(VhostShadowVirtqueue *svq);
> >
> > -VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize);
> > +VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize, VhostIOVATree *iov=
a_map);
> >
> >   void vhost_svq_free(VhostShadowVirtqueue *vq);
> >
> > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-v=
dpa.h
> > index 009a9f3b6b..cd2388b3be 100644
> > --- a/include/hw/virtio/vhost-vdpa.h
> > +++ b/include/hw/virtio/vhost-vdpa.h
> > @@ -14,6 +14,7 @@
> >
> >   #include <gmodule.h>
> >
> > +#include "hw/virtio/vhost-iova-tree.h"
> >   #include "hw/virtio/virtio.h"
> >   #include "standard-headers/linux/vhost_types.h"
> >
> > @@ -30,6 +31,8 @@ typedef struct vhost_vdpa {
> >       MemoryListener listener;
> >       struct vhost_vdpa_iova_range iova_range;
> >       bool shadow_vqs_enabled;
> > +    /* IOVA mapping used by Shadow Virtqueue */
> > +    VhostIOVATree *iova_tree;
> >       GPtrArray *shadow_vqs;
> >       struct vhost_dev *dev;
> >       VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index a1a404f68f..c7888eb8cf 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -11,6 +11,7 @@
> >   #include "hw/virtio/vhost-shadow-virtqueue.h"
> >   #include "hw/virtio/vhost.h"
> >   #include "hw/virtio/virtio-access.h"
> > +#include "hw/virtio/vhost-iova-tree.h"
> >   #include "standard-headers/linux/vhost_types.h"
> >
> >   #include "qemu/error-report.h"
> > @@ -45,6 +46,9 @@ typedef struct VhostShadowVirtqueue {
> >       /* Virtio device */
> >       VirtIODevice *vdev;
> >
> > +    /* IOVA mapping */
> > +    VhostIOVATree *iova_tree;
> > +
> >       /* Map for returning guest's descriptors */
> >       VirtQueueElement **ring_id_maps;
> >
> > @@ -97,13 +101,7 @@ bool vhost_svq_valid_device_features(uint64_t *dev_=
features)
> >               continue;
> >
> >           case VIRTIO_F_ACCESS_PLATFORM:
> > -            /* SVQ does not know how to translate addresses */
> > -            if (*dev_features & BIT_ULL(b)) {
> > -                clear_bit(b, dev_features);
> > -                r =3D false;
> > -            }
> > -            break;
> > -
> > +            /* SVQ trust in host's IOMMU to translate addresses */
> >           case VIRTIO_F_VERSION_1:
> >               /* SVQ trust that guest vring is little endian */
> >               if (!(*dev_features & BIT_ULL(b))) {
> > @@ -205,7 +203,55 @@ static void vhost_svq_set_notification(VhostShadow=
Virtqueue *svq, bool enable)
> >       }
> >   }
> >
> > +/**
> > + * Translate addresses between qemu's virtual address and SVQ IOVA
> > + *
> > + * @svq    Shadow VirtQueue
> > + * @vaddr  Translated IOVA addresses
> > + * @iovec  Source qemu's VA addresses
> > + * @num    Length of iovec and minimum length of vaddr
> > + */
> > +static bool vhost_svq_translate_addr(const VhostShadowVirtqueue *svq,
> > +                                     void **addrs, const struct iovec =
*iovec,
> > +                                     size_t num)
> > +{
> > +    size_t i;
> > +
> > +    if (num =3D=3D 0) {
> > +        return true;
> > +    }
> > +
> > +    for (i =3D 0; i < num; ++i) {
> > +        DMAMap needle =3D {
> > +            .translated_addr =3D (hwaddr)iovec[i].iov_base,
> > +            .size =3D iovec[i].iov_len,
> > +        };
> > +        size_t off;
> > +
> > +        const DMAMap *map =3D vhost_iova_tree_find_iova(svq->iova_tree=
, &needle);
> > +        /*
> > +         * Map cannot be NULL since iova map contains all guest space =
and
> > +         * qemu already has a physical address mapped
> > +         */
> > +        if (unlikely(!map)) {
> > +            error_report("Invalid address 0x%"HWADDR_PRIx" given by gu=
est",
> > +                         needle.translated_addr);
>
>
> This can be triggered by guest, we need use once or log_guest_error() etc=
.
>

Ok I see the issue, I will change.

>
> > +            return false;
> > +        }
> > +
> > +        /*
> > +         * Map->iova chunk size is ignored. What to do if descriptor
> > +         * (addr, size) does not fit is delegated to the device.
> > +         */
>
>
> I think we need at least check the size and fail if the size doesn't
> match here. Or is it possible that we have a buffer that may cross two
> memory regions?
>

It should be impossible, since both iova_tree and VirtQueue should be
in sync regarding the memory regions updates. If a VirtQueue buffer
crosses many memory regions, iovec has more entries.

I can add a return false, but I'm not able to trigger that situation
even with a malformed driver.

>
> > +        off =3D needle.translated_addr - map->translated_addr;
> > +        addrs[i] =3D (void *)(map->iova + off);
> > +    }
> > +
> > +    return true;
> > +}
> > +
> >   static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
> > +                                    void * const *vaddr_sg,
> >                                       const struct iovec *iovec,
> >                                       size_t num, bool more_descs, bool=
 write)
> >   {
> > @@ -224,7 +270,7 @@ static void vhost_vring_write_descs(VhostShadowVirt=
queue *svq,
> >           } else {
> >               descs[i].flags =3D flags;
> >           }
> > -        descs[i].addr =3D cpu_to_le64((hwaddr)iovec[n].iov_base);
> > +        descs[i].addr =3D cpu_to_le64((hwaddr)vaddr_sg[n]);
> >           descs[i].len =3D cpu_to_le32(iovec[n].iov_len);
> >
> >           last =3D i;
> > @@ -234,42 +280,60 @@ static void vhost_vring_write_descs(VhostShadowVi=
rtqueue *svq,
> >       svq->free_head =3D le16_to_cpu(descs[last].next);
> >   }
> >
> > -static unsigned vhost_svq_add_split(VhostShadowVirtqueue *svq,
> > -                                    VirtQueueElement *elem)
> > +static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
> > +                                VirtQueueElement *elem,
> > +                                unsigned *head)
>
>
> I'd suggest to make it returns bool since the patch that introduces this
> function.
>

Ok I will do it from the start.

>
> >   {
> > -    int head;
> >       unsigned avail_idx;
> >       vring_avail_t *avail =3D svq->vring.avail;
> > +    bool ok;
> > +    g_autofree void **sgs =3D g_new(void *, MAX(elem->out_num, elem->i=
n_num));
> >
> > -    head =3D svq->free_head;
> > +    *head =3D svq->free_head;
> >
> >       /* We need some descriptors here */
> >       assert(elem->out_num || elem->in_num);
> >
> > -    vhost_vring_write_descs(svq, elem->out_sg, elem->out_num,
> > +    ok =3D vhost_svq_translate_addr(svq, sgs, elem->out_sg, elem->out_=
num);
> > +    if (unlikely(!ok)) {
> > +        return false;
> > +    }
> > +    vhost_vring_write_descs(svq, sgs, elem->out_sg, elem->out_num,
> >                               elem->in_num > 0, false);
> > -    vhost_vring_write_descs(svq, elem->in_sg, elem->in_num, false, tru=
e);
> > +
> > +
> > +    ok =3D vhost_svq_translate_addr(svq, sgs, elem->in_sg, elem->in_nu=
m);
> > +    if (unlikely(!ok)) {
> > +        return false;
> > +    }
> > +
> > +    vhost_vring_write_descs(svq, sgs, elem->in_sg, elem->in_num, false=
, true);
> >
> >       /*
> >        * Put entry in available array (but don't update avail->idx unti=
l they
> >        * do sync).
> >        */
> >       avail_idx =3D svq->avail_idx_shadow & (svq->vring.num - 1);
> > -    avail->ring[avail_idx] =3D cpu_to_le16(head);
> > +    avail->ring[avail_idx] =3D cpu_to_le16(*head);
> >       svq->avail_idx_shadow++;
> >
> >       /* Update avail index after the descriptor is wrote */
> >       smp_wmb();
> >       avail->idx =3D cpu_to_le16(svq->avail_idx_shadow);
> >
> > -    return head;
> > +    return true;
> >   }
> >
> > -static void vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElement =
*elem)
> > +static bool vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElement =
*elem)
> >   {
> > -    unsigned qemu_head =3D vhost_svq_add_split(svq, elem);
> > +    unsigned qemu_head;
> > +    bool ok =3D vhost_svq_add_split(svq, elem, &qemu_head);
> > +    if (unlikely(!ok)) {
> > +        return false;
> > +    }
> >
> >       svq->ring_id_maps[qemu_head] =3D elem;
> > +    return true;
> >   }
> >
> >   static void vhost_svq_kick(VhostShadowVirtqueue *svq)
> > @@ -309,6 +373,7 @@ static void vhost_handle_guest_kick(VhostShadowVirt=
queue *svq)
> >
> >           while (true) {
> >               VirtQueueElement *elem;
> > +            bool ok;
> >
> >               if (svq->next_guest_avail_elem) {
> >                   elem =3D g_steal_pointer(&svq->next_guest_avail_elem)=
;
> > @@ -337,7 +402,11 @@ static void vhost_handle_guest_kick(VhostShadowVir=
tqueue *svq)
> >                   return;
> >               }
> >
> > -            vhost_svq_add(svq, elem);
> > +            ok =3D vhost_svq_add(svq, elem);
> > +            if (unlikely(!ok)) {
> > +                /* VQ is broken, just return and ignore any other kick=
s */
> > +                return;
> > +            }
> >               vhost_svq_kick(svq);
> >           }
> >
> > @@ -619,12 +688,13 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
> >    * methods and file descriptors.
> >    *
> >    * @qsize Shadow VirtQueue size
> > + * @iova_tree Tree to perform descriptors translations
> >    *
> >    * Returns the new virtqueue or NULL.
> >    *
> >    * In case of error, reason is reported through error_report.
> >    */
> > -VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize)
> > +VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize, VhostIOVATree *iov=
a_tree)
> >   {
> >       size_t desc_size =3D sizeof(vring_desc_t) * qsize;
> >       size_t device_size, driver_size;
> > @@ -656,6 +726,7 @@ VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize)
> >       memset(svq->vring.desc, 0, driver_size);
> >       svq->vring.used =3D qemu_memalign(qemu_real_host_page_size, devic=
e_size);
> >       memset(svq->vring.used, 0, device_size);
> > +    svq->iova_tree =3D iova_tree;
> >       svq->ring_id_maps =3D g_new0(VirtQueueElement *, qsize);
> >       event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call=
);
> >       return g_steal_pointer(&svq);
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 0e5c00ed7e..276a559649 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -209,6 +209,18 @@ static void vhost_vdpa_listener_region_add(MemoryL=
istener *listener,
> >                                            vaddr, section->readonly);
> >
> >       llsize =3D int128_sub(llend, int128_make64(iova));
> > +    if (v->shadow_vqs_enabled) {
> > +        DMAMap mem_region =3D {
> > +            .translated_addr =3D (hwaddr)vaddr,
> > +            .size =3D int128_get64(llsize) - 1,
> > +            .perm =3D IOMMU_ACCESS_FLAG(true, section->readonly),
> > +        };
> > +
> > +        int r =3D vhost_iova_tree_map_alloc(v->iova_tree, &mem_region)=
;
> > +        assert(r =3D=3D IOVA_OK);
>
>
> It's better to fail or warn here.
>

Sure, a warning is possible.

>
> > +
> > +        iova =3D mem_region.iova;
> > +    }
> >
> >       vhost_vdpa_iotlb_batch_begin_once(v);
> >       ret =3D vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
> > @@ -261,6 +273,20 @@ static void vhost_vdpa_listener_region_del(MemoryL=
istener *listener,
> >
> >       llsize =3D int128_sub(llend, int128_make64(iova));
> >
> > +    if (v->shadow_vqs_enabled) {
> > +        const DMAMap *result;
> > +        const void *vaddr =3D memory_region_get_ram_ptr(section->mr) +
> > +            section->offset_within_region +
> > +            (iova - section->offset_within_address_space);
> > +        DMAMap mem_region =3D {
> > +            .translated_addr =3D (hwaddr)vaddr,
> > +            .size =3D int128_get64(llsize) - 1,
> > +        };
> > +
> > +        result =3D vhost_iova_tree_find_iova(v->iova_tree, &mem_region=
);
> > +        iova =3D result->iova;
> > +        vhost_iova_tree_remove(v->iova_tree, &mem_region);
> > +    }
> >       vhost_vdpa_iotlb_batch_begin_once(v);
> >       ret =3D vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
> >       if (ret) {
> > @@ -783,33 +809,70 @@ static int vhost_vdpa_svq_set_fds(struct vhost_de=
v *dev,
> >   /**
> >    * Unmap SVQ area in the device
> >    */
> > -static bool vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v, hwaddr iov=
a,
> > -                                      hwaddr size)
> > +static bool vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v,
> > +                                      const DMAMap *needle)
> >   {
> > +    const DMAMap *result =3D vhost_iova_tree_find_iova(v->iova_tree, n=
eedle);
> > +    hwaddr size;
> >       int r;
> >
> > -    size =3D ROUND_UP(size, qemu_real_host_page_size);
> > -    r =3D vhost_vdpa_dma_unmap(v, iova, size);
> > +    if (unlikely(!result)) {
> > +        error_report("Unable to find SVQ address to unmap");
> > +        return false;
> > +    }
> > +
> > +    size =3D ROUND_UP(result->size, qemu_real_host_page_size);
> > +    r =3D vhost_vdpa_dma_unmap(v, result->iova, size);
> >       return r =3D=3D 0;
> >   }
> >
> >   static bool vhost_vdpa_svq_unmap_rings(struct vhost_dev *dev,
> >                                          const VhostShadowVirtqueue *sv=
q)
> >   {
> > +    DMAMap needle;
> >       struct vhost_vdpa *v =3D dev->opaque;
> >       struct vhost_vring_addr svq_addr;
> > -    size_t device_size =3D vhost_svq_device_area_size(svq);
> > -    size_t driver_size =3D vhost_svq_driver_area_size(svq);
> >       bool ok;
> >
> >       vhost_svq_get_vring_addr(svq, &svq_addr);
> >
> > -    ok =3D vhost_vdpa_svq_unmap_ring(v, svq_addr.desc_user_addr, drive=
r_size);
> > +    needle =3D (DMAMap) {
> > +        .translated_addr =3D svq_addr.desc_user_addr,
> > +    };
> > +    ok =3D vhost_vdpa_svq_unmap_ring(v, &needle);
> >       if (unlikely(!ok)) {
> >           return false;
> >       }
> >
> > -    return vhost_vdpa_svq_unmap_ring(v, svq_addr.used_user_addr, devic=
e_size);
> > +    needle =3D (DMAMap) {
> > +        .translated_addr =3D svq_addr.used_user_addr,
> > +    };
> > +    return vhost_vdpa_svq_unmap_ring(v, &needle);
> > +}
> > +
> > +/**
> > + * Map SVQ area in the device
> > + *
> > + * @v          Vhost-vdpa device
> > + * @needle     The area to search iova
> > + * @readonly   Permissions of the area
> > + */
> > +static bool vhost_vdpa_svq_map_ring(struct vhost_vdpa *v, const DMAMap=
 *needle,
> > +                                    bool readonly)
> > +{
> > +    hwaddr off;
> > +    const DMAMap *result =3D vhost_iova_tree_find_iova(v->iova_tree, n=
eedle);
> > +    int r;
> > +
> > +    if (unlikely(!result)) {
> > +        error_report("Can't locate SVQ ring");
> > +        return false;
> > +    }
> > +
> > +    off =3D needle->translated_addr - result->translated_addr;
> > +    r =3D vhost_vdpa_dma_map(v, result->iova + off, needle->size,
> > +                           (void *)needle->translated_addr, readonly);
> > +    return r =3D=3D 0;
> >   }
> >
> >   /**
> > @@ -821,23 +884,29 @@ static bool vhost_vdpa_svq_unmap_rings(struct vho=
st_dev *dev,
> >   static bool vhost_vdpa_svq_map_rings(struct vhost_dev *dev,
> >                                        const VhostShadowVirtqueue *svq)
> >   {
> > +    DMAMap needle;
> >       struct vhost_vdpa *v =3D dev->opaque;
> >       struct vhost_vring_addr svq_addr;
> >       size_t device_size =3D vhost_svq_device_area_size(svq);
> >       size_t driver_size =3D vhost_svq_driver_area_size(svq);
> > -    int r;
> > +    bool ok;
> >
> >       vhost_svq_get_vring_addr(svq, &svq_addr);
> >
> > -    r =3D vhost_vdpa_dma_map(v, svq_addr.desc_user_addr, driver_size,
> > -                           (void *)svq_addr.desc_user_addr, true);
> > -    if (unlikely(r !=3D 0)) {
> > +    needle =3D (DMAMap) {
> > +        .translated_addr =3D svq_addr.desc_user_addr,
> > +        .size =3D driver_size,
> > +    };
> > +    ok =3D vhost_vdpa_svq_map_ring(v, &needle, true);
> > +    if (unlikely(!ok)) {
> >           return false;
> >       }
> >
> > -    r =3D vhost_vdpa_dma_map(v, svq_addr.used_user_addr, device_size,
> > -                           (void *)svq_addr.used_user_addr, false);
> > -    return r =3D=3D 0;
> > +    needle =3D (DMAMap) {
> > +        .translated_addr =3D svq_addr.used_user_addr,
> > +        .size =3D device_size,
> > +    };
> > +    return vhost_vdpa_svq_map_ring(v, &needle, false);
> >   }
> >
> >   static bool vhost_vdpa_svq_setup(struct vhost_dev *dev,
> > @@ -1006,6 +1075,23 @@ static int vhost_vdpa_set_owner(struct vhost_dev=
 *dev)
> >       return vhost_vdpa_call(dev, VHOST_SET_OWNER, NULL);
> >   }
> >
> > +static bool vhost_vdpa_svq_get_vq_region(struct vhost_vdpa *v,
> > +                                         unsigned long long addr,
> > +                                         uint64_t *iova_addr)
> > +{
> > +    const DMAMap needle =3D {
> > +        .translated_addr =3D addr,
> > +    };
> > +    const DMAMap *translation =3D vhost_iova_tree_find_iova(v->iova_tr=
ee,
> > +                                                          &needle);
> > +    if (!translation) {
> > +        return false;
> > +    }
> > +
> > +    *iova_addr =3D translation->iova + (addr - translation->translated=
_addr);
> > +    return true;
> > +}
> > +
> >   static void vhost_vdpa_vq_get_guest_addr(struct vhost_vring_addr *add=
r,
> >                                            struct vhost_virtqueue *vq)
> >   {
> > @@ -1023,10 +1109,23 @@ static int vhost_vdpa_vq_get_addr(struct vhost_=
dev *dev,
> >       assert(dev->vhost_ops->backend_type =3D=3D VHOST_BACKEND_TYPE_VDP=
A);
> >
> >       if (v->shadow_vqs_enabled) {
> > +        struct vhost_vring_addr svq_addr;
> >           int idx =3D vhost_vdpa_get_vq_index(dev, addr->index);
> >           VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs=
, idx);
> >
> > -        vhost_svq_get_vring_addr(svq, addr);
> > +        vhost_svq_get_vring_addr(svq, &svq_addr);
> > +        if (!vhost_vdpa_svq_get_vq_region(v, svq_addr.desc_user_addr,
> > +                                          &addr->desc_user_addr)) {
> > +            return -1;
> > +        }
> > +        if (!vhost_vdpa_svq_get_vq_region(v, svq_addr.avail_user_addr,
> > +                                          &addr->avail_user_addr)) {
> > +            return -1;
> > +        }
> > +        if (!vhost_vdpa_svq_get_vq_region(v, svq_addr.used_user_addr,
> > +                                          &addr->used_user_addr)) {
> > +            return -1;
> > +        }
> >       } else {
> >           vhost_vdpa_vq_get_guest_addr(addr, vq);
> >       }
> > @@ -1095,13 +1194,37 @@ static int vhost_vdpa_init_svq(struct vhost_dev=
 *hdev, struct vhost_vdpa *v,
> >
> >       shadow_vqs =3D g_ptr_array_new_full(hdev->nvqs, vhost_psvq_free);
> >       for (unsigned n =3D 0; n < hdev->nvqs; ++n) {
> > -        VhostShadowVirtqueue *svq =3D vhost_svq_new(qsize);
> > -
> > +        DMAMap device_region, driver_region;
> > +        struct vhost_vring_addr addr;
> > +        VhostShadowVirtqueue *svq =3D vhost_svq_new(qsize, v->iova_tre=
e);
> >           if (unlikely(!svq)) {
> >               error_setg(errp, "Cannot create svq %u", n);
> >               return -1;
> >           }
> > -        g_ptr_array_add(v->shadow_vqs, svq);
> > +
> > +        vhost_svq_get_vring_addr(svq, &addr);
> > +        driver_region =3D (DMAMap) {
> > +            .translated_addr =3D (hwaddr)addr.desc_user_addr,
> > +
> > +            /*
> > +             * DMAMAp.size include the last byte included in the range=
, while
> > +             * sizeof marks one past it. Substract one byte to make th=
em match.
> > +             */
> > +            .size =3D vhost_svq_driver_area_size(svq) - 1,
> > +            .perm =3D VHOST_ACCESS_RO,
> > +        };
> > +        device_region =3D (DMAMap) {
> > +            .translated_addr =3D (hwaddr)addr.used_user_addr,
> > +            .size =3D vhost_svq_device_area_size(svq) - 1,
> > +            .perm =3D VHOST_ACCESS_RW,
> > +        };
> > +
> > +        r =3D vhost_iova_tree_map_alloc(v->iova_tree, &driver_region);
> > +        assert(r =3D=3D IOVA_OK);
>
>
> Let's fail instead of assert here.
>

Sure, I see how we must not assert here too.

Thanks!

> Thanks
>
>
> > +        r =3D vhost_iova_tree_map_alloc(v->iova_tree, &device_region);
> > +        assert(r =3D=3D IOVA_OK);
> > +
> > +        g_ptr_array_add(shadow_vqs, svq);
> >       }
> >
> >   out:
>


