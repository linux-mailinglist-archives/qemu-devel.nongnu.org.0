Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DC150B9E5
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 16:19:08 +0200 (CEST)
Received: from localhost ([::1]:34416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhu7m-00045s-Sn
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 10:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nhu67-00030u-8a
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 10:17:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nhu63-0000Xq-N4
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 10:17:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650637038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3RK6f476X9QfrAmBpmjatIZHRBhpR5W59lBPUSbIAcQ=;
 b=jBPNf23RZcfbAf3tmGRKQGpOlpJ6hf0AsXVgZk4AtvuhYaMo3QHjAXOxBr6VlUZdmdy5PY
 K2FD1SbK/nQnIDLrDgPFTBR6QUs5UbUoEfIrAmz3IqpZOT6vIrm1ov7RaWDFn1nQe9bgGK
 gOs47VZK4R7+C1mtdGsdUHHo3mYs0nQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-X9pA5hn4MTqCfMwYq4UNUA-1; Fri, 22 Apr 2022 10:17:17 -0400
X-MC-Unique: X9pA5hn4MTqCfMwYq4UNUA-1
Received: by mail-qk1-f200.google.com with SMTP id
 s63-20020a372c42000000b0069ec0715d5eso5500107qkh.10
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 07:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3RK6f476X9QfrAmBpmjatIZHRBhpR5W59lBPUSbIAcQ=;
 b=IdmCk5x2ad6wNOgeDvr48w0jkRcA3ROynQ8YZq30GDqx8pJbYp7BAzMmJCd6FxvxQP
 PbF+U8tt6YwaSNJ85q/p/Wz4RWj/KmeNQmHZdkBIZvI0HqMM9zQMbFy5hvgqyL5VTuL+
 OgkgZsHE9QmbKjqGBRkMKwA98dZDlRhRksPiumPOXKtLNNmeKA0YRpGFW7VFqcxjPCEI
 yzwvWflb2LNKxgjbKzfu4HZWr+6fYYGW75Ir1f63y2EFhRt1QiBTK1cIzLld/S9Id023
 H9qD51lkgleN5driPh2ydbiJFtvHSwrF+ANFuFkd2EHdgSWGfo7ACk9BvA6snP7Lgchl
 3Tcg==
X-Gm-Message-State: AOAM531a8s9qYVOGltW6/tj5TQSKmF45gIx90sTn/f42kCi3IzO/oUD7
 F6OeAtiYz47Vx5/p04f6sJ0EnQ6Ho8y8GXuXRLgVRHusFT+GZY0TBQr12nORg996v1+r8G7pX2P
 //hFREekumq+awjYMucEhhZWQ1old4kg=
X-Received: by 2002:ac8:5705:0:b0:2f3:3fad:66f5 with SMTP id
 5-20020ac85705000000b002f33fad66f5mr3210385qtw.221.1650637036471; 
 Fri, 22 Apr 2022 07:17:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2U1b7lhgzjasnthzj7i3WEjJfNKUYLS2CRi2EqJE4udyU+XatbNTPlevr1pVQfCp4plwMMz1UetToQr0FNAE=
X-Received: by 2002:ac8:5705:0:b0:2f3:3fad:66f5 with SMTP id
 5-20020ac85705000000b002f33fad66f5mr3210353qtw.221.1650637036071; Fri, 22 Apr
 2022 07:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220413163206.1958254-1-eperezma@redhat.com>
 <20220413163206.1958254-2-eperezma@redhat.com>
 <e9258425-f6c9-5fc4-987d-f61b6f25f676@redhat.com>
In-Reply-To: <e9258425-f6c9-5fc4-987d-f61b6f25f676@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 22 Apr 2022 16:16:39 +0200
Message-ID: <CAJaqyWdxjhwesAeBizzJxojhA5gg1rY2zRRwv9PKa3EMcZDs+g@mail.gmail.com>
Subject: Re: [RFC PATCH v7 01/25] vhost: Track descriptor chain in private at
 SVQ
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 14, 2022 at 5:48 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/4/14 00:31, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > Only the first one of them were properly enqueued back.
>
>
> I wonder if it's better to use two patches:
>
> 1) using private chain
>
> 2) fix the chain issue
>
> Patch looks good itself.
>
> Thanks
>

Sure, it can be done that way for the next version.

Thanks!

>
> >
> > While we're at it, harden SVQ: The device could have access to modify
> > them, and it definitely have access when we implement packed vq. Harden
> > SVQ maintaining a private copy of the descriptor chain. Other fields
> > like buffer addresses are already maintained sepparatedly.
> >
> > Fixes: 100890f7ca ("vhost: Shadow virtqueue buffers forwarding")
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.h |  6 ++++++
> >   hw/virtio/vhost-shadow-virtqueue.c | 27 +++++++++++++++++++++------
> >   2 files changed, 27 insertions(+), 6 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index e5e24c536d..c132c994e9 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -53,6 +53,12 @@ typedef struct VhostShadowVirtqueue {
> >       /* Next VirtQueue element that guest made available */
> >       VirtQueueElement *next_guest_avail_elem;
> >
> > +    /*
> > +     * Backup next field for each descriptor so we can recover securel=
y, not
> > +     * needing to trust the device access.
> > +     */
> > +    uint16_t *desc_next;
> > +
> >       /* Next head to expose to the device */
> >       uint16_t shadow_avail_idx;
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index b232803d1b..a2531d5874 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -138,6 +138,7 @@ static void vhost_vring_write_descs(VhostShadowVirt=
queue *svq, hwaddr *sg,
> >       for (n =3D 0; n < num; n++) {
> >           if (more_descs || (n + 1 < num)) {
> >               descs[i].flags =3D flags | cpu_to_le16(VRING_DESC_F_NEXT)=
;
> > +            descs[i].next =3D cpu_to_le16(svq->desc_next[i]);
> >           } else {
> >               descs[i].flags =3D flags;
> >           }
> > @@ -145,10 +146,10 @@ static void vhost_vring_write_descs(VhostShadowVi=
rtqueue *svq, hwaddr *sg,
> >           descs[i].len =3D cpu_to_le32(iovec[n].iov_len);
> >
> >           last =3D i;
> > -        i =3D cpu_to_le16(descs[i].next);
> > +        i =3D cpu_to_le16(svq->desc_next[i]);
> >       }
> >
> > -    svq->free_head =3D le16_to_cpu(descs[last].next);
> > +    svq->free_head =3D le16_to_cpu(svq->desc_next[last]);
> >   }
> >
> >   static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
> > @@ -333,13 +334,22 @@ static void vhost_svq_disable_notification(VhostS=
hadowVirtqueue *svq)
> >       svq->vring.avail->flags |=3D cpu_to_le16(VRING_AVAIL_F_NO_INTERRU=
PT);
> >   }
> >
> > +static uint16_t vhost_svq_last_desc_of_chain(const VhostShadowVirtqueu=
e *svq,
> > +                                             uint16_t num, uint16_t i)
> > +{
> > +    for (uint16_t j =3D 0; j < num; ++j) {
> > +        i =3D le16_to_cpu(svq->desc_next[i]);
> > +    }
> > +
> > +    return i;
> > +}
> > +
> >   static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
> >                                              uint32_t *len)
> >   {
> > -    vring_desc_t *descs =3D svq->vring.desc;
> >       const vring_used_t *used =3D svq->vring.used;
> >       vring_used_elem_t used_elem;
> > -    uint16_t last_used;
> > +    uint16_t last_used, last_used_chain, num;
> >
> >       if (!vhost_svq_more_used(svq)) {
> >           return NULL;
> > @@ -365,7 +375,10 @@ static VirtQueueElement *vhost_svq_get_buf(VhostSh=
adowVirtqueue *svq,
> >           return NULL;
> >       }
> >
> > -    descs[used_elem.id].next =3D svq->free_head;
> > +    num =3D svq->ring_id_maps[used_elem.id]->in_num +
> > +          svq->ring_id_maps[used_elem.id]->out_num;
> > +    last_used_chain =3D vhost_svq_last_desc_of_chain(svq, num, used_el=
em.id);
> > +    svq->desc_next[last_used_chain] =3D svq->free_head;
> >       svq->free_head =3D used_elem.id;
> >
> >       *len =3D used_elem.len;
> > @@ -540,8 +553,9 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, Vir=
tIODevice *vdev,
> >       svq->vring.used =3D qemu_memalign(qemu_real_host_page_size, devic=
e_size);
> >       memset(svq->vring.used, 0, device_size);
> >       svq->ring_id_maps =3D g_new0(VirtQueueElement *, svq->vring.num);
> > +    svq->desc_next =3D g_new0(uint16_t, svq->vring.num);
> >       for (unsigned i =3D 0; i < svq->vring.num - 1; i++) {
> > -        svq->vring.desc[i].next =3D cpu_to_le16(i + 1);
> > +        svq->desc_next[i] =3D cpu_to_le16(i + 1);
> >       }
> >   }
> >
> > @@ -574,6 +588,7 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
> >           virtqueue_detach_element(svq->vq, next_avail_elem, 0);
> >       }
> >       svq->vq =3D NULL;
> > +    g_free(svq->desc_next);
> >       g_free(svq->ring_id_maps);
> >       qemu_vfree(svq->vring.desc);
> >       qemu_vfree(svq->vring.used);
>


