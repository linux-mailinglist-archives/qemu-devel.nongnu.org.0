Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49694CBCDE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 12:38:24 +0100 (CET)
Received: from localhost ([::1]:53752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPjmp-0002Gn-Ot
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 06:38:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nPjku-0001JU-NS
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 06:36:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nPjko-0004BR-7Z
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 06:36:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646307376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eDU1UFukqmx/gXP8yXoPeergAwWIqxWwsIH+dywUpWY=;
 b=bCxziMcqjzgkQbxEVzTulmLdEqijqwwG6Nbz6iuwniYYlpNl1NF1urmgVeAD5mDgSj/jpE
 7V7C50LuDPczIEJl60+xFGwZj+xyv6Hmf36wu4LCQo9h4uutmvp2D7T5BSe3JjjTG5XECA
 QDpyuymWMM+wWHQWxRZyRdKc4Pl9SGk=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-7gZ9ocE-MV6_T50767566A-1; Thu, 03 Mar 2022 06:36:15 -0500
X-MC-Unique: 7gZ9ocE-MV6_T50767566A-1
Received: by mail-qv1-f71.google.com with SMTP id
 t18-20020a0cb712000000b004350812c194so3954884qvd.9
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 03:36:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eDU1UFukqmx/gXP8yXoPeergAwWIqxWwsIH+dywUpWY=;
 b=RTFhA6z7lzQcE36fqd1J/2BHqH8c0E399TRQXMrhE0QvOnkZmBcLP+sEfPinMu1pvh
 EIVulclGHFIegWSpE+F8S3kGffpA/OTIzI7L48lHi9FwrbCphqtEXw9KOGklPqPEPWr7
 kAkVIHFUY0FqvwIVYpnZULQCh4eknmXHQDuhxXOMha3aMFhoIEswf0Hvz3euFO6beDmn
 qatVASrdRuwFr20ougyLer5BWUjFzyZLF6Te17dUhClGVz0+X0Q/1IMEZCDyKL4Ca7B9
 wEi9ZsyCcEvY3WQ8lB9UXAZFfUqzqpCucw6tGAWcjJVxnR0zUM/waVap9lJYk3mkqdaF
 j7Gw==
X-Gm-Message-State: AOAM531qbDUo6/VxylRDbzvRD/q8cO58jX654bNLgzitdursO2ipqE6j
 kiSd/QoRfZVARI+6S4WX+vM2Wa+0iApciDcSRNT9046cHZ8QUSc7E3nk5MvepZXSoLT7pbN4cyV
 ftSHFdLEjYtApzMxSwR1Yp2e/Vg82lUY=
X-Received: by 2002:a05:622a:1190:b0:2dc:915a:9ce4 with SMTP id
 m16-20020a05622a119000b002dc915a9ce4mr26192764qtk.221.1646307374391; 
 Thu, 03 Mar 2022 03:36:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbDo4pfQHGJLuxVd+J4X3sNzUpHkFxuBslSdEyFaznpV6SzGshK9cK7ebmBN7hut2hyDD2Ys6qoGjIJ1CGMIs=
X-Received: by 2002:a05:622a:1190:b0:2dc:915a:9ce4 with SMTP id
 m16-20020a05622a119000b002dc915a9ce4mr26192721qtk.221.1646307373875; Thu, 03
 Mar 2022 03:36:13 -0800 (PST)
MIME-Version: 1.0
References: <20220227134111.3254066-1-eperezma@redhat.com>
 <20220227134111.3254066-11-eperezma@redhat.com>
 <af6d14b3-6bdf-8717-90b5-bc685896cc8a@redhat.com>
 <CAJaqyWf9c=OOKt7sB=kMY7FzNGG+YfPF=qNbu6A0UVkhzxmHZA@mail.gmail.com>
 <cc5e53a9-4b83-ce44-f32b-cb8d758b2cf2@redhat.com>
In-Reply-To: <cc5e53a9-4b83-ce44-f32b-cb8d758b2cf2@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 3 Mar 2022 12:35:37 +0100
Message-ID: <CAJaqyWfwDjuVsX_ELpad0-8EQJJhK79tz5Yi18Ye1xksM_1snQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/14] vdpa: Add custom IOTLB translations to SVQ
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 3, 2022 at 8:33 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/3/1 =E4=B8=8B=E5=8D=884:50, Eugenio Perez Martin =E5=86=99=
=E9=81=93:
> > On Mon, Feb 28, 2022 at 8:37 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> =E5=9C=A8 2022/2/27 =E4=B8=8B=E5=8D=889:41, Eugenio P=C3=A9rez =E5=86=
=99=E9=81=93:
> >>> Use translations added in VhostIOVATree in SVQ.
> >>>
> >>> Only introduce usage here, not allocation and deallocation. As with
> >>> previous patches, we use the dead code paths of shadow_vqs_enabled to
> >>> avoid commiting too many changes at once. These are impossible to tak=
e
> >>> at the moment.
> >>>
> >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>> ---
> >>>    hw/virtio/vhost-shadow-virtqueue.h |   6 +-
> >>>    include/hw/virtio/vhost-vdpa.h     |   3 +
> >>>    hw/virtio/vhost-shadow-virtqueue.c |  76 ++++++++++++++++-
> >>>    hw/virtio/vhost-vdpa.c             | 128 ++++++++++++++++++++++++-=
----
> >>>    4 files changed, 187 insertions(+), 26 deletions(-)
> >>>
> >>> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-sha=
dow-virtqueue.h
> >>> index 04c67685fd..b2f722d101 100644
> >>> --- a/hw/virtio/vhost-shadow-virtqueue.h
> >>> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> >>> @@ -13,6 +13,7 @@
> >>>    #include "qemu/event_notifier.h"
> >>>    #include "hw/virtio/virtio.h"
> >>>    #include "standard-headers/linux/vhost_types.h"
> >>> +#include "hw/virtio/vhost-iova-tree.h"
> >>>
> >>>    /* Shadow virtqueue to relay notifications */
> >>>    typedef struct VhostShadowVirtqueue {
> >>> @@ -43,6 +44,9 @@ typedef struct VhostShadowVirtqueue {
> >>>        /* Virtio device */
> >>>        VirtIODevice *vdev;
> >>>
> >>> +    /* IOVA mapping */
> >>> +    VhostIOVATree *iova_tree;
> >>> +
> >>>        /* Map for use the guest's descriptors */
> >>>        VirtQueueElement **ring_id_maps;
> >>>
> >>> @@ -78,7 +82,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, Vir=
tIODevice *vdev,
> >>>                         VirtQueue *vq);
> >>>    void vhost_svq_stop(VhostShadowVirtqueue *svq);
> >>>
> >>> -VhostShadowVirtqueue *vhost_svq_new(void);
> >>> +VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree);
> >>>
> >>>    void vhost_svq_free(gpointer vq);
> >>>    G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostShadowVirtqueue, vhost_svq_free=
);
> >>> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost=
-vdpa.h
> >>> index 009a9f3b6b..ee8e939ad0 100644
> >>> --- a/include/hw/virtio/vhost-vdpa.h
> >>> +++ b/include/hw/virtio/vhost-vdpa.h
> >>> @@ -14,6 +14,7 @@
> >>>
> >>>    #include <gmodule.h>
> >>>
> >>> +#include "hw/virtio/vhost-iova-tree.h"
> >>>    #include "hw/virtio/virtio.h"
> >>>    #include "standard-headers/linux/vhost_types.h"
> >>>
> >>> @@ -30,6 +31,8 @@ typedef struct vhost_vdpa {
> >>>        MemoryListener listener;
> >>>        struct vhost_vdpa_iova_range iova_range;
> >>>        bool shadow_vqs_enabled;
> >>> +    /* IOVA mapping used by the Shadow Virtqueue */
> >>> +    VhostIOVATree *iova_tree;
> >>>        GPtrArray *shadow_vqs;
> >>>        struct vhost_dev *dev;
> >>>        VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> >>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-sha=
dow-virtqueue.c
> >>> index a38d313755..7e073773d1 100644
> >>> --- a/hw/virtio/vhost-shadow-virtqueue.c
> >>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> >>> @@ -11,6 +11,7 @@
> >>>    #include "hw/virtio/vhost-shadow-virtqueue.h"
> >>>
> >>>    #include "qemu/error-report.h"
> >>> +#include "qemu/log.h"
> >>>    #include "qemu/main-loop.h"
> >>>    #include "qemu/log.h"
> >>>    #include "linux-headers/linux/vhost.h"
> >>> @@ -84,7 +85,58 @@ static void vhost_svq_set_notification(VhostShadow=
Virtqueue *svq, bool enable)
> >>>        }
> >>>    }
> >>>
> >>> +/**
> >>> + * Translate addresses between the qemu's virtual address and the SV=
Q IOVA
> >>> + *
> >>> + * @svq    Shadow VirtQueue
> >>> + * @vaddr  Translated IOVA addresses
> >>> + * @iovec  Source qemu's VA addresses
> >>> + * @num    Length of iovec and minimum length of vaddr
> >>> + */
> >>> +static bool vhost_svq_translate_addr(const VhostShadowVirtqueue *svq=
,
> >>> +                                     void **addrs, const struct iove=
c *iovec,
> >>> +                                     size_t num)
> >>> +{
> >>> +    if (num =3D=3D 0) {
> >>> +        return true;
> >>> +    }
> >>> +
> >>> +    for (size_t i =3D 0; i < num; ++i) {
> >>> +        DMAMap needle =3D {
> >>> +            .translated_addr =3D (hwaddr)iovec[i].iov_base,
> >>> +            .size =3D iovec[i].iov_len,
> >>> +        };
> >>> +        size_t off;
> >>> +
> >>> +        const DMAMap *map =3D vhost_iova_tree_find_iova(svq->iova_tr=
ee, &needle);
> >>> +        /*
> >>> +         * Map cannot be NULL since iova map contains all guest spac=
e and
> >>> +         * qemu already has a physical address mapped
> >>> +         */
> >>> +        if (unlikely(!map)) {
> >>> +            qemu_log_mask(LOG_GUEST_ERROR,
> >>> +                          "Invalid address 0x%"HWADDR_PRIx" given by=
 guest",
> >>> +                          needle.translated_addr);
> >>> +            return false;
> >>> +        }
> >>> +
> >>> +        off =3D needle.translated_addr - map->translated_addr;
> >>> +        addrs[i] =3D (void *)(map->iova + off);
> >>> +
> >>> +        if (unlikely(int128_gt(int128_add(needle.translated_addr,
> >>> +                                          iovec[i].iov_len),
> >>> +                               map->translated_addr + map->size))) {
> >>> +            qemu_log_mask(LOG_GUEST_ERROR,
> >>> +                          "Guest buffer expands over iova range");
> >>> +            return false;
> >>> +        }
> >>> +    }
> >>> +
> >>> +    return true;
> >>> +}
> >>> +
> >>>    static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
> >>> +                                    void * const *vaddr_sg,
> >>
> >> Nit: it looks to me we are not passing vaddr but iova here, so it migh=
t
> >> be better to use "sg"?
> >>
> > Sure, this is a leftover of pre-IOVA translations. I see better to
> > write as you say.
> >
> >>>                                        const struct iovec *iovec,
> >>>                                        size_t num, bool more_descs, b=
ool write)
> >>>    {
> >>> @@ -103,7 +155,7 @@ static void vhost_vring_write_descs(VhostShadowVi=
rtqueue *svq,
> >>>            } else {
> >>>                descs[i].flags =3D flags;
> >>>            }
> >>> -        descs[i].addr =3D cpu_to_le64((hwaddr)iovec[n].iov_base);
> >>> +        descs[i].addr =3D cpu_to_le64((hwaddr)vaddr_sg[n]);
> >>>            descs[i].len =3D cpu_to_le32(iovec[n].iov_len);
> >>>
> >>>            last =3D i;
> >>> @@ -119,6 +171,8 @@ static bool vhost_svq_add_split(VhostShadowVirtqu=
eue *svq,
> >>>    {
> >>>        unsigned avail_idx;
> >>>        vring_avail_t *avail =3D svq->vring.avail;
> >>> +    bool ok;
> >>> +    g_autofree void **sgs =3D g_new(void *, MAX(elem->out_num, elem-=
>in_num));
> >>>
> >>>        *head =3D svq->free_head;
> >>>
> >>> @@ -129,9 +183,20 @@ static bool vhost_svq_add_split(VhostShadowVirtq=
ueue *svq,
> >>>            return false;
> >>>        }
> >>>
> >>> -    vhost_vring_write_descs(svq, elem->out_sg, elem->out_num,
> >>> +    ok =3D vhost_svq_translate_addr(svq, sgs, elem->out_sg, elem->ou=
t_num);
> >>> +    if (unlikely(!ok)) {
> >>> +        return false;
> >>> +    }
> >>> +    vhost_vring_write_descs(svq, sgs, elem->out_sg, elem->out_num,
> >>>                                elem->in_num > 0, false);
> >>> -    vhost_vring_write_descs(svq, elem->in_sg, elem->in_num, false, t=
rue);
> >>> +
> >>> +
> >>> +    ok =3D vhost_svq_translate_addr(svq, sgs, elem->in_sg, elem->in_=
num);
> >>> +    if (unlikely(!ok)) {
> >>> +        return false;
> >>> +    }
> >>> +
> >>> +    vhost_vring_write_descs(svq, sgs, elem->in_sg, elem->in_num, fal=
se, true);
> >>>
> >>>        /*
> >>>         * Put the entry in the available array (but don't update avai=
l->idx until
> >>> @@ -514,11 +579,13 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
> >>>     * Creates vhost shadow virtqueue, and instructs the vhost device =
to use the
> >>>     * shadow methods and file descriptors.
> >>>     *
> >>> + * @iova_tree Tree to perform descriptors translations
> >>> + *
> >>>     * Returns the new virtqueue or NULL.
> >>>     *
> >>>     * In case of error, reason is reported through error_report.
> >>>     */
> >>> -VhostShadowVirtqueue *vhost_svq_new(void)
> >>> +VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree)
> >>>    {
> >>>        g_autofree VhostShadowVirtqueue *svq =3D g_new0(VhostShadowVir=
tqueue, 1);
> >>>        int r;
> >>> @@ -539,6 +606,7 @@ VhostShadowVirtqueue *vhost_svq_new(void)
> >>>
> >>>        event_notifier_init_fd(&svq->svq_kick, VHOST_FILE_UNBIND);
> >>>        event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_c=
all);
> >>> +    svq->iova_tree =3D iova_tree;
> >>>        return g_steal_pointer(&svq);
> >>>
> >>>    err_init_hdev_call:
> >>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >>> index 435b9c2e9e..56f9f125cd 100644
> >>> --- a/hw/virtio/vhost-vdpa.c
> >>> +++ b/hw/virtio/vhost-vdpa.c
> >>> @@ -209,6 +209,21 @@ static void vhost_vdpa_listener_region_add(Memor=
yListener *listener,
> >>>                                             vaddr, section->readonly)=
;
> >>>
> >>>        llsize =3D int128_sub(llend, int128_make64(iova));
> >>> +    if (v->shadow_vqs_enabled) {
> >>> +        DMAMap mem_region =3D {
> >>> +            .translated_addr =3D (hwaddr)vaddr,
> >>> +            .size =3D int128_get64(llsize) - 1,
> >>> +            .perm =3D IOMMU_ACCESS_FLAG(true, section->readonly),
> >>> +        };
> >>> +
> >>> +        int r =3D vhost_iova_tree_map_alloc(v->iova_tree, &mem_regio=
n);
> >>> +        if (unlikely(r !=3D IOVA_OK)) {
> >>> +            error_report("Can't allocate a mapping (%d)", r);
> >>> +            goto fail;
> >>> +        }
> >>> +
> >>> +        iova =3D mem_region.iova;
> >>> +    }
> >>>
> >>>        vhost_vdpa_iotlb_batch_begin_once(v);
> >>>        ret =3D vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
> >>> @@ -261,6 +276,20 @@ static void vhost_vdpa_listener_region_del(Memor=
yListener *listener,
> >>>
> >>>        llsize =3D int128_sub(llend, int128_make64(iova));
> >>>
> >>> +    if (v->shadow_vqs_enabled) {
> >>> +        const DMAMap *result;
> >>> +        const void *vaddr =3D memory_region_get_ram_ptr(section->mr)=
 +
> >>> +            section->offset_within_region +
> >>> +            (iova - section->offset_within_address_space);
> >>> +        DMAMap mem_region =3D {
> >>> +            .translated_addr =3D (hwaddr)vaddr,
> >>> +            .size =3D int128_get64(llsize) - 1,
> >>> +        };
> >>> +
> >>> +        result =3D vhost_iova_tree_find_iova(v->iova_tree, &mem_regi=
on);
> >>> +        iova =3D result->iova;
> >>> +        vhost_iova_tree_remove(v->iova_tree, &mem_region);
> >>> +    }
> >>>        vhost_vdpa_iotlb_batch_begin_once(v);
> >>>        ret =3D vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
> >>>        if (ret) {
> >>> @@ -383,7 +412,7 @@ static int vhost_vdpa_init_svq(struct vhost_dev *=
hdev, struct vhost_vdpa *v,
> >>>
> >>>        shadow_vqs =3D g_ptr_array_new_full(hdev->nvqs, vhost_svq_free=
);
> >>>        for (unsigned n =3D 0; n < hdev->nvqs; ++n) {
> >>> -        g_autoptr(VhostShadowVirtqueue) svq =3D vhost_svq_new();
> >>> +        g_autoptr(VhostShadowVirtqueue) svq =3D vhost_svq_new(v->iov=
a_tree);
> >>>
> >>>            if (unlikely(!svq)) {
> >>>                error_setg(errp, "Cannot create svq %u", n);
> >>> @@ -834,37 +863,78 @@ static int vhost_vdpa_svq_set_fds(struct vhost_=
dev *dev,
> >>>    /**
> >>>     * Unmap a SVQ area in the device
> >>>     */
> >>> -static bool vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v, hwaddr i=
ova,
> >>> -                                      hwaddr size)
> >>> +static bool vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v,
> >>> +                                      const DMAMap *needle)
> >>>    {
> >>> +    const DMAMap *result =3D vhost_iova_tree_find_iova(v->iova_tree,=
 needle);
> >>> +    hwaddr size;
> >>>        int r;
> >>>
> >>> -    size =3D ROUND_UP(size, qemu_real_host_page_size);
> >>> -    r =3D vhost_vdpa_dma_unmap(v, iova, size);
> >>> +    if (unlikely(!result)) {
> >>> +        error_report("Unable to find SVQ address to unmap");
> >>> +        return false;
> >>> +    }
> >>> +
> >>> +    size =3D ROUND_UP(result->size, qemu_real_host_page_size);
> >>> +    r =3D vhost_vdpa_dma_unmap(v, result->iova, size);
> >>>        return r =3D=3D 0;
> >>>    }
> >>>
> >>>    static bool vhost_vdpa_svq_unmap_rings(struct vhost_dev *dev,
> >>>                                           const VhostShadowVirtqueue =
*svq)
> >>>    {
> >>> +    DMAMap needle;
> >>>        struct vhost_vdpa *v =3D dev->opaque;
> >>>        struct vhost_vring_addr svq_addr;
> >>> -    size_t device_size =3D vhost_svq_device_area_size(svq);
> >>> -    size_t driver_size =3D vhost_svq_driver_area_size(svq);
> >>>        bool ok;
> >>>
> >>>        vhost_svq_get_vring_addr(svq, &svq_addr);
> >>>
> >>> -    ok =3D vhost_vdpa_svq_unmap_ring(v, svq_addr.desc_user_addr, dri=
ver_size);
> >>> +    needle =3D (DMAMap) {
> >>> +        .translated_addr =3D svq_addr.desc_user_addr,
> >>> +    };
> >>
> >> Let's simply initialize the member to zero during start of this functi=
on
> >> then we can use needle->transalted_addr =3D XXX here.
> >>
> > Sure
> >
> >>> +    ok =3D vhost_vdpa_svq_unmap_ring(v, &needle);
> >>>        if (unlikely(!ok)) {
> >>>            return false;
> >>>        }
> >>>
> >>> -    return vhost_vdpa_svq_unmap_ring(v, svq_addr.used_user_addr, dev=
ice_size);
> >>> +    needle =3D (DMAMap) {
> >>> +        .translated_addr =3D svq_addr.used_user_addr,
> >>> +    };
> >>> +    return vhost_vdpa_svq_unmap_ring(v, &needle);
> >>> +}
> >>> +
> >>> +/**
> >>> + * Map the SVQ area in the device
> >>> + *
> >>> + * @v          Vhost-vdpa device
> >>> + * @needle     The area to search iova
> >>> + * @errorp     Error pointer
> >>> + */
> >>> +static bool vhost_vdpa_svq_map_ring(struct vhost_vdpa *v, DMAMap *ne=
edle,
> >>> +                                    Error **errp)
> >>> +{
> >>> +    int r;
> >>> +
> >>> +    r =3D vhost_iova_tree_map_alloc(v->iova_tree, needle);
> >>> +    if (unlikely(r !=3D IOVA_OK)) {
> >>> +        error_setg(errp, "Cannot allocate iova (%d)", r);
> >>> +        return false;
> >>> +    }
> >>> +
> >>> +    r =3D vhost_vdpa_dma_map(v, needle->iova, needle->size,
> >>> +                           (void *)needle->translated_addr,
> >>> +                           !(needle->perm & IOMMU_ACCESS_FLAG(0, 1))=
);
> >>
> >> Let's simply use needle->perm =3D=3D IOMMU_RO here?
> >>
> > The motivation to use this way is to be more resilient to the future.
> > For example, if a new flag is added.
> >
> > But I'm totally ok with comparing with IOMMU_RO, I see that scenario
> > unlikely at the moment.
> >
> >>> +    if (unlikely(r !=3D 0)) {
> >>> +        error_setg_errno(errp, -r, "Cannot map region to device");
> >>> +        vhost_iova_tree_remove(v->iova_tree, needle);
> >>> +    }
> >>> +
> >>> +    return r =3D=3D 0;
> >>>    }
> >>>
> >>>    /**
> >>> - * Map shadow virtqueue rings in device
> >>> + * Map the shadow virtqueue rings in the device
> >>>     *
> >>>     * @dev   The vhost device
> >>>     * @svq   The shadow virtqueue
> >>> @@ -876,28 +946,44 @@ static bool vhost_vdpa_svq_map_rings(struct vho=
st_dev *dev,
> >>>                                         struct vhost_vring_addr *addr=
,
> >>>                                         Error **errp)
> >>>    {
> >>> +    DMAMap device_region, driver_region;
> >>> +    struct vhost_vring_addr svq_addr;
> >>>        struct vhost_vdpa *v =3D dev->opaque;
> >>>        size_t device_size =3D vhost_svq_device_area_size(svq);
> >>>        size_t driver_size =3D vhost_svq_driver_area_size(svq);
> >>> -    int r;
> >>> +    size_t avail_offset;
> >>> +    bool ok;
> >>>
> >>>        ERRP_GUARD();
> >>> -    vhost_svq_get_vring_addr(svq, addr);
> >>> +    vhost_svq_get_vring_addr(svq, &svq_addr);
> >>>
> >>> -    r =3D vhost_vdpa_dma_map(v, addr->desc_user_addr, driver_size,
> >>> -                           (void *)addr->desc_user_addr, true);
> >>> -    if (unlikely(r !=3D 0)) {
> >>> -        error_setg_errno(errp, -r, "Cannot create vq driver region: =
");
> >>> +    driver_region =3D (DMAMap) {
> >>> +        .translated_addr =3D svq_addr.desc_user_addr,
> >>> +        .size =3D driver_size - 1,
> >>
> >> Any reason for the "-1" here? I see several places do things like that=
,
> >> it's probably hint of wrong API somehwere.
> >>
> > The "problem" is the api mismatch between _end and _last, to include
> > the last member in the size or not.
> >
> > IOVA tree needs to use _end so we can allocate the last page in case
> > of available range ending in (uint64_t)-1 [1]. But If we change
> > vhost_svq_{device,driver}_area_size to make it inclusive,
>
>
> These functions looks sane since it doesn't return a range. It's up to
> the caller to decide how to use the size.
>

Ok I think I didn't get your comment the first time, so there is a bug
here. But I'm not sure if we are on the same page regarding the iova
tree.

Regarding the alignment, it's up to the caller how to use the size.
But if you introduce a mapping of (iova_1, translated_addr_1, size_1),
the iova address iova_1+size_1 belongs to that mapping. If you want to
introduce a new mapping (iova_2 =3D iova_1 + size_1, translated_addr_2,
size_2) it will be rejected, since it overlaps with the first one.
That part is not up to the caller.

At this moment, vhost_svq_driver_area_size and
vhost_svq_device_area_size returns in the same terms as sizeof(x). In
other words, size is not inclusive. As memset() or VHOST_IOTLB_UPDATE
expects, for example. We could move the -1 inside of these functions,
and then we need to adapt qemu_memalign calls on vhost_svq_start or
vhost_vdpa dma_map/unmap.

>
> >   we need to
> > use "+1" in calls like qemu_memalign and memset at vhost_svq_start.
> > Probably in more places too
>
>
> I'm not sure I get here. Maybe you can show which code may suffers if we
> don't decrease it by one here.
>

Less than I expected I have to say:

diff --git a/hw/virtio/vhost-shadow-virtqueue.c
b/hw/virtio/vhost-shadow-virtqueue.c
index 497237dcbb..b42ba5a3c0 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -479,7 +479,7 @@ size_t vhost_svq_device_area_size(const
VhostShadowVirtqueue *svq)
 {
     size_t used_size =3D offsetof(vring_used_t, ring) +
                                     sizeof(vring_used_elem_t) * svq->vring=
.num;
-    return ROUND_UP(used_size, qemu_real_host_page_size);
+    return ROUND_UP(used_size, qemu_real_host_page_size) - 1;
 }

 /**
@@ -532,8 +532,8 @@ void vhost_svq_start(VhostShadowVirtqueue *svq,
VirtIODevice *vdev,
     svq->vq =3D vq;

     svq->vring.num =3D virtio_queue_get_num(vdev, virtio_get_queue_index(v=
q));
-    driver_size =3D vhost_svq_driver_area_size(svq);
-    device_size =3D vhost_svq_device_area_size(svq);
+    driver_size =3D vhost_svq_driver_area_size(svq) + 1;
+    device_size =3D vhost_svq_device_area_size(svq) + 1;
     svq->vring.desc =3D qemu_memalign(qemu_real_host_page_size, driver_siz=
e);
     desc_size =3D sizeof(vring_desc_t) * svq->vring.num;
     svq->vring.avail =3D (void *)((char *)svq->vring.desc + desc_size);
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 5eefc5911a..2bf648de4a 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -955,7 +955,7 @@ static bool vhost_vdpa_svq_map_rings(struct vhost_dev *=
dev,

     driver_region =3D (DMAMap) {
         .translated_addr =3D svq_addr.desc_user_addr,
-        .size =3D driver_size - 1,
+        .size =3D driver_size,
         .perm =3D IOMMU_RO,
     };
     ok =3D vhost_vdpa_svq_map_ring(v, &driver_region, errp);
@@ -969,7 +969,7 @@ static bool vhost_vdpa_svq_map_rings(struct vhost_dev *=
dev,

     device_region =3D (DMAMap) {
         .translated_addr =3D svq_addr.used_user_addr,
-        .size =3D device_size - 1,
+        .size =3D device_size,
         .perm =3D IOMMU_RW,
     };
     ok =3D vhost_vdpa_svq_map_ring(v, &device_region, errp);
diff --git a/hw/virtio/vhost-shadow-virtqueue.c
b/hw/virtio/vhost-shadow-virtqueue.c
index 497237dcbb..b42ba5a3c0 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -479,7 +479,7 @@ size_t vhost_svq_device_area_size(const
VhostShadowVirtqueue *svq)
 {
     size_t used_size =3D offsetof(vring_used_t, ring) +
                                     sizeof(vring_used_elem_t) * svq->vring=
.num;
-    return ROUND_UP(used_size, qemu_real_host_page_size);
+    return ROUND_UP(used_size, qemu_real_host_page_size) - 1;
 }

 /**
@@ -532,8 +532,8 @@ void vhost_svq_start(VhostShadowVirtqueue *svq,
VirtIODevice *vdev,
     svq->vq =3D vq;

     svq->vring.num =3D virtio_queue_get_num(vdev, virtio_get_queue_index(v=
q));
-    driver_size =3D vhost_svq_driver_area_size(svq);
-    device_size =3D vhost_svq_device_area_size(svq);
+    driver_size =3D vhost_svq_driver_area_size(svq) + 1;
+    device_size =3D vhost_svq_device_area_size(svq) + 1;
     svq->vring.desc =3D qemu_memalign(qemu_real_host_page_size, driver_siz=
e);
     desc_size =3D sizeof(vring_desc_t) * svq->vring.num;
     svq->vring.avail =3D (void *)((char *)svq->vring.desc + desc_size);
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 5eefc5911a..2bf648de4a 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -918,7 +918,7 @@ static bool vhost_vdpa_svq_map_ring(struct
vhost_vdpa *v, DMAMap *needle,
         return false;
     }

-    r =3D vhost_vdpa_dma_map(v, needle->iova, needle->size,
+    r =3D vhost_vdpa_dma_map(v, needle->iova, needle->size + 1,
                            (void *)needle->translated_addr,
                            needle->perm =3D=3D IOMMU_RO);
     if (unlikely(r !=3D 0)) {
@@ -955,7 +955,7 @@ static bool vhost_vdpa_svq_map_rings(struct vhost_dev *=
dev,

     driver_region =3D (DMAMap) {
         .translated_addr =3D svq_addr.desc_user_addr,
-        .size =3D driver_size - 1,
+        .size =3D driver_size,
         .perm =3D IOMMU_RO,
     };
     ok =3D vhost_vdpa_svq_map_ring(v, &driver_region, errp);
@@ -969,7 +969,7 @@ static bool vhost_vdpa_svq_map_rings(struct vhost_dev *=
dev,

     device_region =3D (DMAMap) {
         .translated_addr =3D svq_addr.used_user_addr,
-        .size =3D device_size - 1,
+        .size =3D device_size,
         .perm =3D IOMMU_RW,
     };
     ok =3D vhost_vdpa_svq_map_ring(v, &device_region, errp);
---

> But current code may endup to passing qemu_real_host_page_size - 1 to
> vhost-VDPA which seems wrong?
>
> E.g vhost_svq_device_area_size() return qemu_real_host_page_size, but it
> was decreased by 1 here for size, then we pass size to vhost_vdpa_dma_map=
().
>

That part needs fixing, but the right solution is not to skip the -1
but increment to pass to the vhost_vdpa_dma_map. Doing otherwise would
bring problems with how iova-tree works. It will be included in the
next series.

Thanks!

> Thanks
>
>
> >
> > QEMU's emulated Intel iommu code solves it using the address mask as
> > the size, something that does not fit 100% with vhost devices since
> > they can allocate an arbitrary address of arbitrary size when using
> > vIOMMU. It's not a problem for vhost-vdpa at this moment since we make
> > sure we expose unaligned and whole pages with vrings, but I feel it
> > would only be to move the problem somewhere else.
> >
> > Thanks!
> >
> > [1] There are alternatives: to use Int128_t, etc. But I think it's
> > better not to change that in this patch series.
> >
> >> Thanks
> >>
> >>
> >>> +        .perm =3D IOMMU_RO,
> >>> +    };
> >>> +    ok =3D vhost_vdpa_svq_map_ring(v, &driver_region, errp);
> >>> +    if (unlikely(!ok)) {
> >>> +        error_prepend(errp, "Cannot create vq driver region: ");
> >>>            return false;
> >>>        }
> >>> +    addr->desc_user_addr =3D driver_region.iova;
> >>> +    avail_offset =3D svq_addr.avail_user_addr - svq_addr.desc_user_a=
ddr;
> >>> +    addr->avail_user_addr =3D driver_region.iova + avail_offset;
> >>>
> >>> -    r =3D vhost_vdpa_dma_map(v, addr->used_user_addr, device_size,
> >>> -                           (void *)addr->used_user_addr, false);
> >>> -    if (unlikely(r !=3D 0)) {
> >>> -        error_setg_errno(errp, -r, "Cannot create vq device region: =
");
> >>> +    device_region =3D (DMAMap) {
> >>> +        .translated_addr =3D svq_addr.used_user_addr,
> >>> +        .size =3D device_size - 1,
> >>> +        .perm =3D IOMMU_RW,
> >>> +    };
> >>> +    ok =3D vhost_vdpa_svq_map_ring(v, &device_region, errp);
> >>> +    if (unlikely(!ok)) {
> >>> +        error_prepend(errp, "Cannot create vq device region: ");
> >>> +        vhost_vdpa_svq_unmap_ring(v, &driver_region);
> >>>        }
> >>> +    addr->used_user_addr =3D device_region.iova;
> >>>
> >>> -    return r =3D=3D 0;
> >>> +    return ok;
> >>>    }
> >>>
> >>>    static bool vhost_vdpa_svq_setup(struct vhost_dev *dev,
>


