Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B8F50585A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 16:00:56 +0200 (CEST)
Received: from localhost ([::1]:39268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngRvz-00038a-CQ
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 10:00:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ngRty-0001vA-B5
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 09:58:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ngRtu-0000RP-Kq
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 09:58:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650290324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q91qVkF/3yuim741r9zY5yVnKS3COCCXe6XUHp2tHxc=;
 b=Ey/cD2WZNPpAlZe9dNKbs6x0ItTRRoLz1Knbyrml6IblsGIpZkUFZx884WEFF7hRtptXAa
 8dC0byT7YEWLzCeHuSD22JCwcyrcZpLni0JQ2PqbeKbPxRHXLvS2G2MGzeV3pv1OBfFTNK
 scpZmKOmfDeMS2Q+4BVyHOKSOca9I0I=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-vP4SYsO0MHybedNn8KQPkA-1; Mon, 18 Apr 2022 09:58:41 -0400
X-MC-Unique: vP4SYsO0MHybedNn8KQPkA-1
Received: by mail-qk1-f199.google.com with SMTP id
 bk23-20020a05620a1a1700b0067b32f93b90so10386363qkb.16
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 06:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q91qVkF/3yuim741r9zY5yVnKS3COCCXe6XUHp2tHxc=;
 b=VwOzZdkYfIt11aHRpA96hdmUgDuNFj9+H7RK18tB/+LtmTHTQoSxw8IhP66V6MSqyt
 1O5ACvqsGf5plrPVlPwU1CDlZB9AN/q5TmcnJCHa5TzszXFi1X+UuyZUhx6CKyY9tBym
 B0am6NwehRV7+1+RzsnBN6CwTbwmPoqxc9XTg5fg+tP/AM0wN3S6ig4vYMhWuD8MiwMs
 iEc07uGmCmUp1u3TfP2NTsMixeoKBiDCjGx2CdzxZ2PUbCygzr+xYUGRkLU/EFJiF+Sh
 JMNd29kD60qT/sWqjL5psD7PNjPC7kmqknwQFHLBbTIilBqy7ZHEnVZc8qPmsW8GrKtm
 nSmw==
X-Gm-Message-State: AOAM532TDs6X6kbLPV7SHKYe02TFqnkiaSpsIkIU/lqp22brdeJCWLyt
 W2SDfKF1711y1x6281lQkQ4yWNGBuFzbVgq3BlFKI1UWkFGnOts8Cs9wKKwYqOwu0owbgzlCeW1
 SbuPvWEXamOD0URjgg+U32KUxkWCgkQU=
X-Received: by 2002:ad4:47cf:0:b0:444:4512:db0e with SMTP id
 p15-20020ad447cf000000b004444512db0emr8100174qvw.70.1650290321243; 
 Mon, 18 Apr 2022 06:58:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxB6WT85XHfZPw4p2EByrkJGidePVw8E/qtLUjR3s1a6YIPK2xRcf+drYyqflqQchHfj8X312wQcIhXfjdHtRc=
X-Received: by 2002:ad4:47cf:0:b0:444:4512:db0e with SMTP id
 p15-20020ad447cf000000b004444512db0emr8100138qvw.70.1650290320935; Mon, 18
 Apr 2022 06:58:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220413163206.1958254-1-eperezma@redhat.com>
 <20220413163206.1958254-20-eperezma@redhat.com>
 <CACGkMEsRSXTmuyoH4sgKLm+Tj4=veQdz-PAzC+xRAPbMwWCUeA@mail.gmail.com>
In-Reply-To: <CACGkMEsRSXTmuyoH4sgKLm+Tj4=veQdz-PAzC+xRAPbMwWCUeA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 18 Apr 2022 15:58:05 +0200
Message-ID: <CAJaqyWeL4RRa44Y6eEJCZHRDiT1rYY9zYLFg+9hxerFtgm27Dw@mail.gmail.com>
Subject: Re: [RFC PATCH v7 19/25] vhost: Add vhost_svq_inject
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 14, 2022 at 11:10 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Thu, Apr 14, 2022 at 12:32 AM Eugenio P=C3=A9rez <eperezma@redhat.com>=
 wrote:
> >
> > This allows qemu to inject packets to the device without guest's notice=
.

s/packets/buffers/ actually.

>
> Does it mean it can support guests without _F_ANNOUNCE?
>

Technically it is possible. We could inject the packet using this to
data virtqueues, but that implies that they start in SVQ mode
actually.

Once we have a way to transition from/to shadow virtqueue dynamically,
data virtqueues could start shadowed, the gratuitous ARP can be sent,
and then we can move to passthrough mode again.

> >
> > This will be use to inject net CVQ messages to restore status in the de=
stination
>
> I guess for restoring, we should set cvq.ready =3D true but all other
> (TX/RX) as false before we complete the restoring? If yes, I don't see
> codes to do that.
>

Right, that will be ready for the next version.

> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/virtio/vhost-shadow-virtqueue.h |   5 +
> >  hw/virtio/vhost-shadow-virtqueue.c | 179 +++++++++++++++++++++++++----
> >  2 files changed, 160 insertions(+), 24 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index e06ac52158..2a5229e77f 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -17,6 +17,9 @@
> >
> >  typedef struct SVQElement {
> >      VirtQueueElement elem;
> > +    hwaddr in_iova;
> > +    hwaddr out_iova;
> > +    bool not_from_guest;
>
> Let's add a comment for those fields.
>

Sure.

> >  } SVQElement;
> >
> >  typedef void (*VirtQueueElementCallback)(VirtIODevice *vdev,
> > @@ -106,6 +109,8 @@ typedef struct VhostShadowVirtqueue {
> >
> >  bool vhost_svq_valid_features(uint64_t features, Error **errp);
> >
> > +bool vhost_svq_inject(VhostShadowVirtqueue *svq, const struct iovec *i=
ov,
> > +                      size_t out_num, size_t in_num);
> >  void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick=
_fd);
> >  void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd)=
;
> >  void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 87980e2a9c..f3600df133 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -16,6 +16,7 @@
> >  #include "qemu/log.h"
> >  #include "qemu/memalign.h"
> >  #include "linux-headers/linux/vhost.h"
> > +#include "qemu/iov.h"
> >
> >  /**
> >   * Validate the transport device features that both guests can use wit=
h the SVQ
> > @@ -122,7 +123,8 @@ static bool vhost_svq_translate_addr(const VhostSha=
dowVirtqueue *svq,
> >      return true;
> >  }
> >
> > -static bool vhost_svq_vring_write_descs(VhostShadowVirtqueue *svq, hwa=
ddr *sg,
> > +static bool vhost_svq_vring_write_descs(VhostShadowVirtqueue *svq,
> > +                                        SVQElement *svq_elem, hwaddr *=
sg,
> >                                          const struct iovec *iovec, siz=
e_t num,
> >                                          bool more_descs, bool write)
> >  {
> > @@ -130,15 +132,39 @@ static bool vhost_svq_vring_write_descs(VhostShad=
owVirtqueue *svq, hwaddr *sg,
> >      unsigned n;
> >      uint16_t flags =3D write ? cpu_to_le16(VRING_DESC_F_WRITE) : 0;
> >      vring_desc_t *descs =3D svq->vring.desc;
> > -    bool ok;
> >
> >      if (num =3D=3D 0) {
> >          return true;
> >      }
> >
> > -    ok =3D vhost_svq_translate_addr(svq, sg, iovec, num);
> > -    if (unlikely(!ok)) {
> > -        return false;
> > +    if (svq_elem->not_from_guest) {
> > +        DMAMap map =3D {
> > +            .translated_addr =3D (hwaddr)iovec->iov_base,
> > +            .size =3D ROUND_UP(iovec->iov_len, 4096) - 1,
> > +            .perm =3D write ? IOMMU_RW : IOMMU_RO,
> > +        };
> > +        int r;
> > +
> > +        if (unlikely(num !=3D 1)) {
> > +            error_report("Unexpected chain of element injected");
> > +            return false;
> > +        }
> > +        r =3D vhost_iova_tree_map_alloc(svq->iova_tree, &map);
> > +        if (unlikely(r !=3D IOVA_OK)) {
> > +            error_report("Cannot map injected element");
> > +            return false;
> > +        }
> > +
> > +        r =3D svq->map_ops->map(map.iova, map.size + 1,
> > +                              (void *)map.translated_addr, !write,
> > +                              svq->map_ops_opaque);
> > +        assert(r =3D=3D 0);
> > +        sg[0] =3D map.iova;
> > +    } else {
> > +        bool ok =3D vhost_svq_translate_addr(svq, sg, iovec, num);
> > +        if (unlikely(!ok)) {
> > +            return false;
> > +        }
> >      }
> >
> >      for (n =3D 0; n < num; n++) {
> > @@ -166,7 +192,8 @@ static bool vhost_svq_add_split(VhostShadowVirtqueu=
e *svq, SVQElement *svq_elem,
> >      unsigned avail_idx;
> >      vring_avail_t *avail =3D svq->vring.avail;
> >      bool ok;
> > -    g_autofree hwaddr *sgs =3D g_new(hwaddr, MAX(elem->out_num, elem->=
in_num));
> > +    g_autofree hwaddr *sgs =3D NULL;
> > +    hwaddr *in_sgs, *out_sgs;
> >
> >      *head =3D svq->free_head;
> >
> > @@ -177,15 +204,23 @@ static bool vhost_svq_add_split(VhostShadowVirtqu=
eue *svq, SVQElement *svq_elem,
> >          return false;
> >      }
> >
> > -    ok =3D vhost_svq_vring_write_descs(svq, sgs, elem->out_sg, elem->o=
ut_num,
> > -                                     elem->in_num > 0, false);
> > +    if (!svq_elem->not_from_guest) {
> > +        sgs =3D g_new(hwaddr, MAX(elem->out_num, elem->in_num));
> > +        in_sgs =3D out_sgs =3D sgs;
> > +    } else {
> > +        in_sgs =3D &svq_elem->in_iova;
> > +        out_sgs =3D &svq_elem->out_iova;
> > +    }
> > +    ok =3D vhost_svq_vring_write_descs(svq, svq_elem, out_sgs, elem->o=
ut_sg,
> > +                                     elem->out_num, elem->in_num > 0, =
false);
> >      if (unlikely(!ok)) {
> >          return false;
> >      }
> >
> > -    ok =3D vhost_svq_vring_write_descs(svq, sgs, elem->in_sg, elem->in=
_num, false,
> > -                                     true);
> > +    ok =3D vhost_svq_vring_write_descs(svq, svq_elem, in_sgs, elem->in=
_sg,
> > +                                     elem->in_num, false, true);
> >      if (unlikely(!ok)) {
> > +        /* TODO unwind out_sg */
> >          return false;
> >      }
> >
> > @@ -230,6 +265,43 @@ static void vhost_svq_kick(VhostShadowVirtqueue *s=
vq)
> >      event_notifier_set(&svq->hdev_kick);
> >  }
> >
> > +bool vhost_svq_inject(VhostShadowVirtqueue *svq, const struct iovec *i=
ov,
> > +                      size_t out_num, size_t in_num)
> > +{
> > +    size_t out_size =3D iov_size(iov, out_num);
> > +    size_t out_buf_size =3D ROUND_UP(out_size, 4096);
> > +    size_t in_size =3D iov_size(iov + out_num, in_num);
> > +    size_t in_buf_size =3D ROUND_UP(in_size, 4096);
> > +    SVQElement *svq_elem;
> > +    uint16_t num_slots =3D (in_num ? 1 : 0) + (out_num ? 1 : 0);
> > +
> > +    if (unlikely(num_slots =3D=3D 0 || svq->next_guest_avail_elem ||
> > +                 vhost_svq_available_slots(svq) < num_slots)) {
> > +        return false;
> > +    }
> > +
> > +    svq_elem =3D virtqueue_alloc_element(sizeof(SVQElement), 1, 1);
> > +    if (out_num) {
> > +        void *out =3D qemu_memalign(4096, out_buf_size);
> > +        svq_elem->elem.out_sg[0].iov_base =3D out;
> > +        svq_elem->elem.out_sg[0].iov_len =3D out_size;
> > +        iov_to_buf(iov, out_num, 0, out, out_size);
> > +        memset(out + out_size, 0, out_buf_size - out_size);
> > +    }
> > +    if (in_num) {
> > +        void *in =3D qemu_memalign(4096, in_buf_size);
> > +        svq_elem->elem.in_sg[0].iov_base =3D in;
> > +        svq_elem->elem.in_sg[0].iov_len =3D in_size;
> > +        memset(in, 0, in_buf_size);
> > +    }
> > +
> > +    svq_elem->not_from_guest =3D true;
> > +    vhost_svq_add(svq, svq_elem);
> > +    vhost_svq_kick(svq);
> > +
>
> Should we wait for the completion before moving forward? Otherwise we
> will have a race.
>
> And if we wait for the completion (e.g doing busy polling), I think we
> can avoid the auxiliary structures like
> in_iova/out_iova/not_from_guest by doing mapping before
> vhost_svq_add() to keep it clean.
>

Ok I can move it to that model.

Thanks!

> Thanks
>
> > +    return true;
> > +}
> > +
> >  /**
> >   * Forward available buffers.
> >   *
> > @@ -267,6 +339,7 @@ static void vhost_handle_guest_kick(VhostShadowVirt=
queue *svq)
> >                  break;
> >              }
> >
> > +            svq_elem->not_from_guest =3D false;
> >              elem =3D &svq_elem->elem;
> >              if (elem->out_num + elem->in_num > vhost_svq_available_slo=
ts(svq)) {
> >                  /*
> > @@ -391,6 +464,31 @@ static SVQElement *vhost_svq_get_buf(VhostShadowVi=
rtqueue *svq, uint32_t *len)
> >      return g_steal_pointer(&svq->ring_id_maps[used_elem.id]);
> >  }
> >
> > +static int vhost_svq_unmap(VhostShadowVirtqueue *svq, hwaddr iova, siz=
e_t size)
> > +{
> > +    DMAMap needle =3D {
> > +        .iova =3D iova,
> > +        .size =3D size,
> > +    };
> > +    const DMAMap *overlap;
> > +
> > +    while ((overlap =3D vhost_iova_tree_find(svq->iova_tree, &needle))=
) {
> > +        DMAMap needle =3D *overlap;
> > +
> > +        if (svq->map_ops->unmap) {
> > +            int r =3D svq->map_ops->unmap(overlap->iova, overlap->size=
 + 1,
> > +                                        svq->map_ops_opaque);
> > +            if (unlikely(r !=3D 0)) {
> > +                return r;
> > +            }
> > +        }
> > +        qemu_vfree((void *)overlap->translated_addr);
> > +        vhost_iova_tree_remove(svq->iova_tree, &needle);
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >  static void vhost_svq_flush(VhostShadowVirtqueue *svq,
> >                              bool check_for_avail_queue)
> >  {
> > @@ -410,23 +508,56 @@ static void vhost_svq_flush(VhostShadowVirtqueue =
*svq,
> >              }
> >
> >              elem =3D &svq_elem->elem;
> > -            if (unlikely(i >=3D svq->vring.num)) {
> > -                qemu_log_mask(LOG_GUEST_ERROR,
> > -                         "More than %u used buffers obtained in a %u s=
ize SVQ",
> > -                         i, svq->vring.num);
> > -                virtqueue_fill(vq, elem, len, i);
> > -                virtqueue_flush(vq, i);
> > -                return;
> > -            }
> > -            virtqueue_fill(vq, elem, len, i++);
> > -
> >              if (svq->ops && svq->ops->used_elem_handler) {
> >                  svq->ops->used_elem_handler(svq->vdev, elem);
> >              }
> > +
> > +            if (svq_elem->not_from_guest) {
> > +                if (unlikely(!elem->out_num && elem->out_num !=3D 1)) =
{
> > +                    error_report("Unexpected out_num > 1");
> > +                    return;
> > +                }
> > +
> > +                if (elem->out_num) {
> > +                    int r =3D vhost_svq_unmap(svq, svq_elem->out_iova,
> > +                                            elem->out_sg[0].iov_len);
> > +                    if (unlikely(r !=3D 0)) {
> > +                        error_report("Cannot unmap out buffer");
> > +                        return;
> > +                    }
> > +                }
> > +
> > +                if (unlikely(!elem->in_num && elem->in_num !=3D 1)) {
> > +                    error_report("Unexpected in_num > 1");
> > +                    return;
> > +                }
> > +
> > +                if (elem->in_num) {
> > +                    int r =3D vhost_svq_unmap(svq, svq_elem->in_iova,
> > +                                            elem->in_sg[0].iov_len);
> > +                    if (unlikely(r !=3D 0)) {
> > +                        error_report("Cannot unmap out buffer");
> > +                        return;
> > +                    }
> > +                }
> > +            } else {
> > +                if (unlikely(i >=3D svq->vring.num)) {
> > +                    qemu_log_mask(
> > +                        LOG_GUEST_ERROR,
> > +                        "More than %u used buffers obtained in a %u si=
ze SVQ",
> > +                        i, svq->vring.num);
> > +                    virtqueue_fill(vq, elem, len, i);
> > +                    virtqueue_flush(vq, i);
> > +                    return;
> > +                }
> > +                virtqueue_fill(vq, elem, len, i++);
> > +            }
> >          }
> >
> > -        virtqueue_flush(vq, i);
> > -        event_notifier_set(&svq->svq_call);
> > +        if (i > 0) {
> > +            virtqueue_flush(vq, i);
> > +            event_notifier_set(&svq->svq_call);
> > +        }
> >
> >          if (check_for_avail_queue && svq->next_guest_avail_elem) {
> >              /*
> > @@ -590,13 +721,13 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
> >      for (unsigned i =3D 0; i < svq->vring.num; ++i) {
> >          g_autofree SVQElement *svq_elem =3D NULL;
> >          svq_elem =3D g_steal_pointer(&svq->ring_id_maps[i]);
> > -        if (svq_elem) {
> > +        if (svq_elem && !svq_elem->not_from_guest) {
> >              virtqueue_detach_element(svq->vq, &svq_elem->elem, 0);
> >          }
> >      }
> >
> >      next_avail_elem =3D g_steal_pointer(&svq->next_guest_avail_elem);
> > -    if (next_avail_elem) {
> > +    if (next_avail_elem && !next_avail_elem->not_from_guest) {
> >          virtqueue_detach_element(svq->vq, &next_avail_elem->elem, 0);
> >      }
> >      svq->vq =3D NULL;
> > --
> > 2.27.0
> >
>


