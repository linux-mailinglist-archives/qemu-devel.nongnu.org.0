Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F61F5716A7
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 12:09:02 +0200 (CEST)
Received: from localhost ([::1]:47810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBCpB-0007cf-A4
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 06:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oBCVW-0002mt-OP
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:48:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oBCVS-0005n0-1b
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:48:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657619316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v2TPn8W3Ut4xcAhCB8LgadFM++CkRz85HfI3MTkfWWA=;
 b=U23oilET1Ty0blKFm1ExnLdAVLRCD3uTI3UjgADOjcc/j9Cv7A8ugat9wW5Ji9zPjhCNWD
 STn2Ym7DGbz8169GBsSxGd1S2xC7RRJGMprRiw1JFQLoe6Tcn/HY7N7frJ3607SVsUaZf9
 vMDPIdVzZqqtvjcKYOq+0HBakApYUZ4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-Ve7_SNvVOvSjn8ZjefoCKg-1; Tue, 12 Jul 2022 05:48:29 -0400
X-MC-Unique: Ve7_SNvVOvSjn8ZjefoCKg-1
Received: by mail-qv1-f70.google.com with SMTP id
 p6-20020a0c8c86000000b004731e63c75bso1518115qvb.10
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 02:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v2TPn8W3Ut4xcAhCB8LgadFM++CkRz85HfI3MTkfWWA=;
 b=nS0omXgDPzXJ6k/Hw5cH1fk31wNv7xd8OTRQzpO1rHluWWR6P58e8DeWbsptYm6ym4
 7XIS1EQhMOVpWXdFh+EPRGiv/VS3stmEzg1SWmP3goUG/J0Gd4nsvj2XfJQ/jZnJ3p7O
 cEUIFavwvu4gW+WVl2Se+5RCgIaeq27CGOmdNDhKpFxzBLQ999rBrFa9Xf7c83rBUfOQ
 AGoQSXXshFEo7QnUmzrk/HFIxPOqEv2jI+e6u38X8C/PhP1pNNmkaqEnvPFAPFdFElLe
 pr7f/my5lsZ3gws97JclfNPhrAgsjNckbGufwo82bUGaaRB9gvBP0HkU6uPDml5aPBzi
 1OWQ==
X-Gm-Message-State: AJIora8fIgsz0Wr3uvcMJbEMBDxtt7C+5D97KWmX6IZbw2Hxol7qOkra
 W1OkmMsMWfqJKXz7Sa504fLNA+mC1jNb6YTrg0vCs2aXkmQCb1x8PraZqBHJlZW4ZxG4gL4LOVH
 r4y28XYCqHvV+LEOHHMWLzeXIsQuhHbU=
X-Received: by 2002:a05:6214:1c83:b0:46b:a79a:2f0b with SMTP id
 ib3-20020a0562141c8300b0046ba79a2f0bmr16678820qvb.103.1657619308628; 
 Tue, 12 Jul 2022 02:48:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tehAASIDwHp9af2Jw99uYQKQDKUHSZqEDPtbb539mz+m1ZYsjzXs7e27aGPWBgOY2lYoWIEkPlCOOUlmmStSw=
X-Received: by 2002:a05:6214:1c83:b0:46b:a79a:2f0b with SMTP id
 ib3-20020a0562141c8300b0046ba79a2f0bmr16678790qvb.103.1657619308239; Tue, 12
 Jul 2022 02:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-21-eperezma@redhat.com>
 <0f40536a-8c51-e546-17e8-bd752313123c@redhat.com>
In-Reply-To: <0f40536a-8c51-e546-17e8-bd752313123c@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 12 Jul 2022 11:47:52 +0200
Message-ID: <CAJaqyWcKstiF8AXsUUppPsdfXiiuRhDi2-8ynLVLM8ncv=Pc+Q@mail.gmail.com>
Subject: Re: [RFC PATCH v9 20/23] vdpa: Buffer CVQ support on shadow virtqueue
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eric Blake <eblake@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Tue, Jul 12, 2022 at 9:18 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/7/7 02:40, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > Introduce the control virtqueue support for vDPA shadow virtqueue. This
> > is needed for advanced networking features like multiqueue.
> >
> > Virtio-net control VQ will copy the descriptors to qemu's VA, so we
> > avoid TOCTOU with the guest's or device's memory every time there is a
> > device model change.
>
>
> Not sure this is a must since we currently do cvq passthrough. So we
> might already "suffer" from this.
>

Since we currently do cvq passthrough, we don't update qemu's device
model. So there are only one element checking and using the cvq buffer
(vhost device), not two. The device itself may suffer from TOCTOU but
this is not something we can solve from qemu.

Now, we're adding the update of qemu device model at this patch, we're
opening a window where the guest could present some data to qemu, and
then some other data to the vhost device, making both of them
different udpates. To do a local copy on qemu is the solution to that,
but it can be others for sure.

>
> > When address space isolation is implemented, this
> > will allow, CVQ to only have access to control messages too.
> >
> > To demonstrate command handling, VIRTIO_NET_F_CTRL_MACADDR is
> > implemented.  If virtio-net driver changes MAC the virtio-net device
> > model will be updated with the new one.
> >
> > Others cvq commands could be added here straightforwardly but they have
> > been not tested.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   include/hw/virtio/vhost-vdpa.h |   3 +
> >   hw/virtio/vhost-vdpa.c         |   5 +-
> >   net/vhost-vdpa.c               | 373 ++++++++++++++++++++++++++++++++=
+
> >   3 files changed, 379 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-v=
dpa.h
> > index 7214eb47dc..1111d85643 100644
> > --- a/include/hw/virtio/vhost-vdpa.h
> > +++ b/include/hw/virtio/vhost-vdpa.h
> > @@ -15,6 +15,7 @@
> >   #include <gmodule.h>
> >
> >   #include "hw/virtio/vhost-iova-tree.h"
> > +#include "hw/virtio/vhost-shadow-virtqueue.h"
> >   #include "hw/virtio/virtio.h"
> >   #include "standard-headers/linux/vhost_types.h"
> >
> > @@ -35,6 +36,8 @@ typedef struct vhost_vdpa {
> >       /* IOVA mapping used by the Shadow Virtqueue */
> >       VhostIOVATree *iova_tree;
> >       GPtrArray *shadow_vqs;
> > +    const VhostShadowVirtqueueOps *shadow_vq_ops;
> > +    void *shadow_vq_ops_opaque;
> >       struct vhost_dev *dev;
> >       VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> >   } VhostVDPA;
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 613c3483b0..94bda07b4d 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -417,9 +417,10 @@ static int vhost_vdpa_init_svq(struct vhost_dev *h=
dev, struct vhost_vdpa *v,
> >
> >       shadow_vqs =3D g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
> >       for (unsigned n =3D 0; n < hdev->nvqs; ++n) {
> > -        g_autoptr(VhostShadowVirtqueue) svq =3D vhost_svq_new(v->iova_=
tree, NULL,
> > -                                                            NULL);
> > +        g_autoptr(VhostShadowVirtqueue) svq =3D NULL;
>
>
> I don't see the reason of this assignment consider it will just be
> initialized in the following line.
>

It can be deleted for sure, as long as we don't add code that return
in between or something like that. Compiler should both squash the
writes and warn us if we mistakenly add a return, so I'm fine with
deleting it.

>
> >
> > +        svq =3D vhost_svq_new(v->iova_tree, v->shadow_vq_ops,
> > +                            v->shadow_vq_ops_opaque);
> >           if (unlikely(!svq)) {
> >               error_setg(errp, "Cannot create svq %u", n);
> >               return -1;
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index b0158f625e..e415cc8de5 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -11,11 +11,15 @@
> >
> >   #include "qemu/osdep.h"
> >   #include "clients.h"
> > +#include "hw/virtio/virtio-net.h"
> >   #include "net/vhost_net.h"
> >   #include "net/vhost-vdpa.h"
> >   #include "hw/virtio/vhost-vdpa.h"
> > +#include "qemu/buffer.h"
> >   #include "qemu/config-file.h"
> >   #include "qemu/error-report.h"
> > +#include "qemu/log.h"
> > +#include "qemu/memalign.h"
> >   #include "qemu/option.h"
> >   #include "qapi/error.h"
> >   #include <linux/vhost.h>
> > @@ -25,6 +29,26 @@
> >   #include "monitor/monitor.h"
> >   #include "hw/virtio/vhost.h"
> >
> > +typedef struct CVQElement {
> > +    /* Device's in and out buffer */
> > +    void *in_buf, *out_buf;
> > +
> > +    /* Optional guest element from where this cvqelement was created *=
/
>
>
> Should be "cvq element".
>

I'll fix it, thanks!

>
> > +    VirtQueueElement *guest_elem;
> > +
> > +    /* Control header sent by the guest. */
> > +    struct virtio_net_ctrl_hdr ctrl;
> > +
> > +    /* vhost-vdpa device, for cleanup reasons */
> > +    struct vhost_vdpa *vdpa;
> > +
> > +    /* Length of out data */
> > +    size_t out_len;
> > +
> > +    /* Copy of the out data sent by the guest excluding ctrl. */
> > +    uint8_t out_data[];
> > +} CVQElement;
> > +
> >   /* Todo:need to add the multiqueue support here */
> >   typedef struct VhostVDPAState {
> >       NetClientState nc;
> > @@ -187,6 +211,351 @@ static NetClientInfo net_vhost_vdpa_info =3D {
> >           .check_peer_type =3D vhost_vdpa_check_peer_type,
> >   };
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
> > + * TODO: Use me! and adapt to net/vhost-vdpa format
> > + * Print error message in case of error
> > + */
> > +static void vhost_vdpa_cvq_unmap_buf(CVQElement *elem, void *addr)
> > +{
> > +    struct vhost_vdpa *v =3D elem->vdpa;
> > +    VhostIOVATree *tree =3D v->iova_tree;
> > +    DMAMap needle =3D {
> > +        /*
> > +         * No need to specify size or to look for more translations si=
nce
> > +         * this contiguous chunk was allocated by us.
> > +         */
> > +        .translated_addr =3D (hwaddr)(uintptr_t)addr,
> > +    };
> > +    const DMAMap *map =3D vhost_iova_tree_find_iova(tree, &needle);
> > +    int r;
> > +
> > +    if (unlikely(!map)) {
> > +        error_report("Cannot locate expected map");
> > +        goto err;
> > +    }
> > +
> > +    r =3D vhost_vdpa_dma_unmap(v, map->iova, map->size + 1);
> > +    if (unlikely(r !=3D 0)) {
> > +        error_report("Device cannot unmap: %s(%d)", g_strerror(r), r);
> > +    }
> > +
> > +    vhost_iova_tree_remove(tree, map);
> > +
> > +err:
> > +    qemu_vfree(addr);
> > +}
> > +
> > +static void vhost_vdpa_cvq_delete_elem(CVQElement *elem)
> > +{
> > +    if (elem->out_buf) {
> > +        vhost_vdpa_cvq_unmap_buf(elem, g_steal_pointer(&elem->out_buf)=
);
> > +    }
> > +
> > +    if (elem->in_buf) {
> > +        vhost_vdpa_cvq_unmap_buf(elem, g_steal_pointer(&elem->in_buf))=
;
> > +    }
> > +
> > +    /* Guest element must have been returned to the guest or free othe=
rway */
> > +    assert(!elem->guest_elem);
> > +
> > +    g_free(elem);
> > +}
> > +G_DEFINE_AUTOPTR_CLEANUP_FUNC(CVQElement, vhost_vdpa_cvq_delete_elem);
> > +
> > +static int vhost_vdpa_net_cvq_svq_inject(VhostShadowVirtqueue *svq,
> > +                                         CVQElement *cvq_elem,
> > +                                         size_t out_len)
> > +{
> > +    const struct iovec iov[] =3D {
> > +        {
> > +            .iov_base =3D cvq_elem->out_buf,
> > +            .iov_len =3D out_len,
> > +        },{
> > +            .iov_base =3D cvq_elem->in_buf,
> > +            .iov_len =3D sizeof(virtio_net_ctrl_ack),
> > +        }
> > +    };
> > +
> > +    return vhost_svq_inject(svq, iov, 1, 1, cvq_elem);
> > +}
> > +
> > +static void *vhost_vdpa_cvq_alloc_buf(struct vhost_vdpa *v,
> > +                                      const uint8_t *out_data, size_t =
data_len,
> > +                                      bool write)
> > +{
> > +    DMAMap map =3D {};
> > +    size_t buf_len =3D ROUND_UP(data_len, qemu_real_host_page_size());
> > +    void *buf =3D qemu_memalign(qemu_real_host_page_size(), buf_len);
> > +    int r;
> > +
> > +    if (!write) {
> > +        memcpy(buf, out_data, data_len);
> > +        memset(buf + data_len, 0, buf_len - data_len);
> > +    } else {
> > +        memset(buf, 0, data_len);
> > +    }
> > +
> > +    map.translated_addr =3D (hwaddr)(uintptr_t)buf;
> > +    map.size =3D buf_len - 1;
> > +    map.perm =3D write ? IOMMU_RW : IOMMU_RO,
> > +    r =3D vhost_iova_tree_map_alloc(v->iova_tree, &map);
> > +    if (unlikely(r !=3D IOVA_OK)) {
> > +        error_report("Cannot map injected element");
> > +        goto err;
> > +    }
> > +
> > +    r =3D vhost_vdpa_dma_map(v, map.iova, buf_len, buf, !write);
> > +    /* TODO: Handle error */
> > +    assert(r =3D=3D 0);
> > +
> > +    return buf;
> > +
> > +err:
> > +    qemu_vfree(buf);
> > +    return NULL;
> > +}
> > +
> > +/**
> > + * Allocate an element suitable to be injected
> > + *
> > + * @iov: The iovec
> > + * @out_num: Number of out elements, placed first in iov
> > + * @in_num: Number of in elements, placed after out ones
> > + * @elem: Optional guest element from where this one was created
> > + *
> > + * TODO: Do we need a sg for out_num? I think not
> > + */
> > +static CVQElement *vhost_vdpa_cvq_alloc_elem(VhostVDPAState *s,
> > +                                             struct virtio_net_ctrl_hd=
r ctrl,
> > +                                             const struct iovec *out_s=
g,
> > +                                             size_t out_num, size_t ou=
t_size,
> > +                                             VirtQueueElement *elem)
> > +{
> > +    g_autoptr(CVQElement) cvq_elem =3D g_malloc(sizeof(CVQElement) + o=
ut_size);
> > +    uint8_t *out_cursor =3D cvq_elem->out_data;
> > +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> > +
> > +    /* Start with a clean base */
> > +    memset(cvq_elem, 0, sizeof(*cvq_elem));
> > +    cvq_elem->vdpa =3D &s->vhost_vdpa;
> > +
> > +    /*
> > +     * Linearize element. If guest had a descriptor chain, we expose t=
he device
> > +     * a single buffer.
> > +     */
> > +    cvq_elem->out_len =3D out_size;
> > +    memcpy(out_cursor, &ctrl, sizeof(ctrl));
> > +    out_size -=3D sizeof(ctrl);
> > +    out_cursor +=3D sizeof(ctrl);
> > +    iov_to_buf(out_sg, out_num, 0, out_cursor, out_size);
> > +
> > +    cvq_elem->out_buf =3D vhost_vdpa_cvq_alloc_buf(v, cvq_elem->out_da=
ta,
> > +                                                 out_size, false);
> > +    assert(cvq_elem->out_buf);
> > +    cvq_elem->in_buf =3D vhost_vdpa_cvq_alloc_buf(v, NULL,
> > +                                                sizeof(virtio_net_ctrl=
_ack),
> > +                                                true);
> > +    assert(cvq_elem->in_buf);
> > +
> > +    cvq_elem->guest_elem =3D elem;
> > +    cvq_elem->ctrl =3D ctrl;
> > +    return g_steal_pointer(&cvq_elem);
> > +}
> > +
> > +/**
> > + * iov_size with an upper limit. It's assumed UINT64_MAX is an invalid
> > + * iov_size.
> > + */
> > +static uint64_t vhost_vdpa_net_iov_len(const struct iovec *iov,
> > +                                       unsigned int iov_cnt, size_t ma=
x)
> > +{
> > +    uint64_t len =3D 0;
> > +
> > +    for (unsigned int i =3D 0; len < max && i < iov_cnt; i++) {
> > +        bool overflow =3D uadd64_overflow(iov[i].iov_len, len, &len);
> > +        if (unlikely(overflow)) {
> > +            return UINT64_MAX;
> > +        }
>
>
> Let's use iov_size() here, and if you think we need to fix the overflow
> issue, we need fix it there then other user can benefit from that.
>

I think it can be solved with iov_size, let me rethink about it.

>
> > +    }
> > +
> > +    return len;
> > +}
> > +
> > +static CVQElement *vhost_vdpa_net_cvq_copy_elem(VhostVDPAState *s,
> > +                                                VirtQueueElement *elem=
)
> > +{
> > +    struct virtio_net_ctrl_hdr ctrl;
> > +    g_autofree struct iovec *iov =3D NULL;
> > +    struct iovec *iov2;
> > +    unsigned int out_num =3D elem->out_num;
> > +    size_t n, out_size =3D 0;
> > +
> > +    /* TODO: in buffer MUST have only a single entry with a char? size=
 */
>
>
> I couldn't understand the question but we should not assume the layout
> of the control command.
>

This is a leftover TODO, sorry. It's not for the cvq command but for
the input buffer reserved for the answer.

>
> > +    if (unlikely(vhost_vdpa_net_iov_len(elem->in_sg, elem->in_num,
> > +                                        sizeof(virtio_net_ctrl_ack))
> > +                                              < sizeof(virtio_net_ctrl=
_ack))) {
> > +        return NULL;
> > +    }
>
>
> We don't have such check in virtio-net.c, anything make svq different?
>

It's the first conditional after the if(!elem), but it doesn't check
for overflow:
    virtio_net_ctrl_ack status =3D VIRTIO_NET_ERR;
...
        if (iov_size(elem->in_sg, elem->in_num) < sizeof(status) ||
            ...) {
            virtio_error(vdev, "virtio-net ctrl missing headers");
            ...
            break;
        }

>
> > +
> > +    n =3D iov_to_buf(elem->out_sg, out_num, 0, &ctrl, sizeof(ctrl));
> > +    if (unlikely(n !=3D sizeof(ctrl))) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid out size\n", __fun=
c__);
> > +        return NULL;
> > +    }
> > +
> > +    iov =3D iov2 =3D g_memdup2(elem->out_sg, sizeof(struct iovec) * el=
em->out_num);
>
>
> Let's use iov_copy() here.
>

I'm fine with moving it to iov_copy, but it has some disadvantages.
For example, I need to know the size before, so I need to transverse
the iovec twice.

But maybe it could be better if we delete the first checks of the size.

> And I don't see how iov is used after this.
>

This is copied from virtio_net_handle_ctrl, but I just realized I
reversed the uses.

iov and iov2 are copies (memdup) of out iovec, so we don't modify
original ones. This is, VirtQueueElement's one.

Since they're memduped, they must be freed. One of them is used to be
able to free with the memduped addr. iov2 is the one explicitely freed
at virtio_net_handle_ctrl. iov is the one freed by g_autofree in the
new code.

The other one is used as a cursor to iterate the output.

>
> > +    iov_discard_front(&iov2, &out_num, sizeof(ctrl));
> > +    switch (ctrl.class) {
> > +    case VIRTIO_NET_CTRL_MAC:
> > +        switch (ctrl.cmd) {
> > +        case VIRTIO_NET_CTRL_MAC_ADDR_SET:
> > +            if (likely(vhost_vdpa_net_iov_len(iov2, out_num, 6))) {
> > +                out_size +=3D 6;
> > +                break;
> > +            }
> > +
> > +            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid mac size\n", _=
_func__);
> > +            return NULL;
>
>
> Note that we need to support VIRTIO_NET_CTRL_ANNOUNCE_ACK in order to
> support live migration.
>

I thought it was valid to add it on top of this series.

> But a more fundamental question, what's the value of having this kind of
> whitelist here?
>

What should qemu do if it forwards a command it does not understand
and the device returns VIRTIO_NET_OK? Migration is not possible from
that moment (unless we consider all of CVQ features best effort).

I think it's simpler to sanitize it before copying it to the device,
although it requires some pre-copy validations.

> Is it more simpler just have a sane limit of the buffer and simply
> forward everything to the vhost-vDPA?
>

I'm ok with exploring this. Should we return VIRTIO_NET_ERR if the
guest's output buffer is bigger than that limit, not forwarding it to
the device?

> And if we do this, instead of validating the inputs one by one we can
> simply doing validation only on VIRTIO_NET_CTRL_MAC_TABLE_SET which
> accepts variable length and simply fallback to alluni/allmulti if it
> contains too much entries.
>

So let's simulate the guest issues a cmd with a MAC table of >
MAC_TABLE_ENTRIES. QEMU should modify the request and enable alluni
and/or allmulti. We return VIRTIO_NET_OK to the guest, and the rx
filtering change event / query returns the right status.

This makes equal the behavior of the emulated virtio-net device model
and the vhost-vdpa one. The guest will receive packets that should
have been filtered out, rx filter event is right, and migration will
preserve the filtering behavior.

Otherwise, the device will not receive all the MAC filters, so the
guest will not receive frames that it wants to receive. As a
disadvantage, we're effectively capping the MAC table size, because
the device's size could be many times MAC_TABLE_ENTRIES.

>
> > +        default:
> > +            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid mac cmd %u\n",
> > +                          __func__, ctrl.cmd);
> > +            return NULL;
> > +        };
> > +        break;
> > +    default:
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid control class %u\n=
",
> > +                      __func__, ctrl.class);
> > +        return NULL;
> > +    };
> > +
> > +    return vhost_vdpa_cvq_alloc_elem(s, ctrl, iov2, out_num,
> > +                                     sizeof(ctrl) + out_size, elem);
> > +}
> > +
> > +/**
> > + * Validate and copy control virtqueue commands.
> > + *
> > + * Following QEMU guidelines, we offer a copy of the buffers to the de=
vice to
> > + * prevent TOCTOU bugs.  This functions check that the buffers length =
are
> > + * expected too.
> > + */
> > +static bool vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq=
,
> > +                                             VirtQueueElement *guest_e=
lem,
> > +                                             void *opaque)
> > +{
> > +    VhostVDPAState *s =3D opaque;
> > +    g_autoptr(CVQElement) cvq_elem =3D NULL;
> > +    g_autofree VirtQueueElement *elem =3D guest_elem;
> > +    size_t out_size, in_len;
> > +    virtio_net_ctrl_ack status =3D VIRTIO_NET_ERR;
> > +    int r;
> > +
> > +    cvq_elem =3D vhost_vdpa_net_cvq_copy_elem(s, elem);
> > +    if (unlikely(!cvq_elem)) {
> > +        goto err;
> > +    }
> > +
> > +    /* out size validated at vhost_vdpa_net_cvq_copy_elem */
> > +    out_size =3D iov_size(elem->out_sg, elem->out_num);
> > +    r =3D vhost_vdpa_net_cvq_svq_inject(svq, cvq_elem, out_size);
> > +    if (unlikely(r !=3D 0)) {
> > +        goto err;
> > +    }
> > +
> > +    cvq_elem->guest_elem =3D g_steal_pointer(&elem);
> > +    /* Now CVQ elem belongs to SVQ */
> > +    g_steal_pointer(&cvq_elem);
> > +    return true;
> > +
> > +err:
> > +    in_len =3D iov_from_buf(elem->in_sg, elem->in_num, 0, &status,
> > +                          sizeof(status));
> > +    vhost_svq_push_elem(svq, elem, in_len);
> > +    return true;
> > +}
> > +
> > +static VirtQueueElement *vhost_vdpa_net_handle_ctrl_detach(void *elem_=
opaque)
> > +{
> > +    g_autoptr(CVQElement) cvq_elem =3D elem_opaque;
> > +    return g_steal_pointer(&cvq_elem->guest_elem);
> > +}
> > +
> > +static void vhost_vdpa_net_handle_ctrl_used(VhostShadowVirtqueue *svq,
> > +                                            void *vq_elem_opaque,
> > +                                            uint32_t dev_written)
> > +{
> > +    g_autoptr(CVQElement) cvq_elem =3D vq_elem_opaque;
> > +    virtio_net_ctrl_ack status =3D VIRTIO_NET_ERR;
> > +    const struct iovec out =3D {
> > +        .iov_base =3D cvq_elem->out_data,
> > +        .iov_len =3D cvq_elem->out_len,
> > +    };
> > +    const DMAMap status_map_needle =3D {
> > +        .translated_addr =3D (hwaddr)(uintptr_t)cvq_elem->in_buf,
> > +        .size =3D sizeof(status),
> > +    };
> > +    const DMAMap *in_map;
> > +    const struct iovec in =3D {
> > +        .iov_base =3D &status,
> > +        .iov_len =3D sizeof(status),
> > +    };
> > +    g_autofree VirtQueueElement *guest_elem =3D NULL;
> > +
> > +    if (unlikely(dev_written < sizeof(status))) {
> > +        error_report("Insufficient written data (%llu)",
> > +                     (long long unsigned)dev_written);
> > +        goto out;
> > +    }
> > +
> > +    in_map =3D vhost_iova_tree_find_iova(svq->iova_tree, &status_map_n=
eedle);
> > +    if (unlikely(!in_map)) {
> > +        error_report("Cannot locate out mapping");
> > +        goto out;
> > +    }
> > +
> > +    switch (cvq_elem->ctrl.class) {
> > +    case VIRTIO_NET_CTRL_MAC_ADDR_SET:
> > +        break;
> > +    default:
> > +        error_report("Unexpected ctrl class %u", cvq_elem->ctrl.class)=
;
> > +        goto out;
> > +    };
> > +
> > +    memcpy(&status, cvq_elem->in_buf, sizeof(status));
> > +    if (status !=3D VIRTIO_NET_OK) {
> > +        goto out;
> > +    }
> > +
> > +    status =3D VIRTIO_NET_ERR;
> > +    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, &out, 1);
>
>
> I wonder if this is the best choice. It looks to me it might be better
> to extend the virtio_net_handle_ctrl_iov() logic:
>
> virtio_net_handle_ctrl_iov() {
>      if (svq enabled) {
>           host_elem =3D iov_copy(guest_elem);
>           vhost_svq_add(host_elem);
>           vhost_svq_poll(host_elem);
>      }
>      // usersapce ctrl vq logic
> }
>
>
> This can help to avoid coupling too much logic in cvq (like the
> avail,used and detach ops).
>

Let me try that way and I'll come back to you.

Thanks!

> Thanks
>
>
> > +    if (status !=3D VIRTIO_NET_OK) {
> > +        error_report("Bad CVQ processing in model");
> > +        goto out;
> > +    }
> > +
> > +out:
> > +    guest_elem =3D g_steal_pointer(&cvq_elem->guest_elem);
> > +    if (guest_elem) {
> > +        iov_from_buf(guest_elem->in_sg, guest_elem->in_num, 0, &status=
,
> > +                     sizeof(status));
> > +        vhost_svq_push_elem(svq, guest_elem, sizeof(status));
> > +    }
> > +}
> > +
> > +static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops =3D {
> > +    .avail_handler =3D vhost_vdpa_net_handle_ctrl_avail,
> > +    .used_handler =3D vhost_vdpa_net_handle_ctrl_used,
> > +    .detach_handler =3D vhost_vdpa_net_handle_ctrl_detach,
> > +};
> > +
> >   static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
> >                                              const char *device,
> >                                              const char *name,
> > @@ -211,6 +580,10 @@ static NetClientState *net_vhost_vdpa_init(NetClie=
ntState *peer,
> >
> >       s->vhost_vdpa.device_fd =3D vdpa_device_fd;
> >       s->vhost_vdpa.index =3D queue_pair_index;
> > +    if (!is_datapath) {
> > +        s->vhost_vdpa.shadow_vq_ops =3D &vhost_vdpa_net_svq_ops;
> > +        s->vhost_vdpa.shadow_vq_ops_opaque =3D s;
> > +    }
> >       ret =3D vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_ind=
ex, nvqs);
> >       if (ret) {
> >           qemu_del_net_client(nc);
>


