Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3656391F39
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 20:35:46 +0200 (CEST)
Received: from localhost ([::1]:36544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llyNV-0003OU-Tq
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 14:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1llxfN-00075W-1W
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:50:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1llxfK-0001uZ-JR
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:50:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622051397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3fBmzCG21O+ZuTQCZ/pXWxeWbZ0mJKicfQMD7YOB920=;
 b=Rm2iTTptZIrhIr96bpP9qHI7qce82S1SPb9ATYOJCgVNAakaPFNV6kuV63gPKMgiT4iFfX
 Z/BdXxFdjWR1Nq4Vjdqr65CjnrV4GbUIRwCLMsWpOL7BC/HDMrGQcfrVI4nhhB19clIxuZ
 3o7yTPFdShFTL9f5UzIk6C2Yij3LtOs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-3JHVMgi1MX-wT9-Jz2dD_g-1; Wed, 26 May 2021 13:49:56 -0400
X-MC-Unique: 3JHVMgi1MX-wT9-Jz2dD_g-1
Received: by mail-qv1-f72.google.com with SMTP id
 k12-20020a0cfd6c0000b029020df9543019so1857607qvs.14
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 10:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3fBmzCG21O+ZuTQCZ/pXWxeWbZ0mJKicfQMD7YOB920=;
 b=fpQ5fYm+XIUPIr4Cjcll3EUGRZHnxLLcgXGaaPQWhIRpoR77dp0ntkGT9cCNZ/P3G8
 2S/bEgllt6DisKsqgXT2FZ6Ip0JVoe9T/EeU2T3UXuGc6rEQ+SsJl0pZK/GjhClFW4qq
 qaAJzU6f0wwBUZfDD23VvAhglQoPR59x8cybgNWoyPV+7GhRgFen3T6Vn7Ijx6j+/OJo
 0XkMX8F3NM7SPlLQPjHy+phDTS6UMH0mhZ+5ckfyp+uW4BbuUNW4IffJdYsodZuJ6Mcq
 PBX0KpoAbrUU204CNZw0bpbXbNUy670SIcffcFQoAl7sMCctRioKgfpBr0Ng7AVobBuZ
 884Q==
X-Gm-Message-State: AOAM531zOjGWlA8bZ8hpdwkhVIpPYOxBxPp6AoIBaX9f9kXyKZBz2fs7
 ajYW680aQnQJQzq7Mc4eBvNyLo3pXJuKGJlDsEx8pGhdvR5SUvoFGRripSivJwPkug55ie3+ETI
 SSMbasJbXi+e3fNulairW52j1Faz7qSc=
X-Received: by 2002:a05:6214:b27:: with SMTP id
 w7mr44267955qvj.40.1622051395493; 
 Wed, 26 May 2021 10:49:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLS5D3+/4zlNMbPlif1yO8dkDXr4CelkCRm4uVCwB8QAl7Xl1o3Fi3iuCnPo6T+o2AvKzgvW6YHSOf4UUsBDo=
X-Received: by 2002:a05:6214:b27:: with SMTP id
 w7mr44267935qvj.40.1622051395279; 
 Wed, 26 May 2021 10:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210519162903.1172366-14-eperezma@redhat.com>
 <e0114c64-2620-7a72-6445-3035ceb748ac@redhat.com>
In-Reply-To: <e0114c64-2620-7a72-6445-3035ceb748ac@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 26 May 2021 19:49:19 +0200
Message-ID: <CAJaqyWeL-0KjsBcXs1tYdvn9xLAK-x0Sb+RFuzPgngXxYtF9uw@mail.gmail.com>
Subject: Re: [RFC v3 13/29] vhost: Add vhost_get_iova_range operation
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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

On Wed, May 26, 2021 at 3:14 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/5/20 =E4=B8=8A=E5=8D=8812:28, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > For simplicity, If a device does not support this operation it means
> > that it can handle full (uint64_t)-1 iova address.
>
>
> Note that, we probably need a separated patch for this.
>

Actually the comment is not in the right commit, the next one is the
one that uses it. Is that what you mean?

> And we need to this during vhost-vdpa initialization. If GPA is out of
> the range, we need to fail the start of vhost-vdpa.
>

Right, that is still to-do.

Maybe a series with just these two commits and failing the start if
GPA is not in the range, as you say, would help to split the amount of
changes.

I will send it if no more comments arise about it.

Thanks!

> THanks
>
>
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   include/hw/virtio/vhost-backend.h |  5 +++++
> >   hw/virtio/vhost-vdpa.c            | 18 ++++++++++++++++++
> >   hw/virtio/trace-events            |  1 +
> >   3 files changed, 24 insertions(+)
> >
> > diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhos=
t-backend.h
> > index 94d3323905..bcb112c166 100644
> > --- a/include/hw/virtio/vhost-backend.h
> > +++ b/include/hw/virtio/vhost-backend.h
> > @@ -36,6 +36,7 @@ struct vhost_vring_addr;
> >   struct vhost_scsi_target;
> >   struct vhost_iotlb_msg;
> >   struct vhost_virtqueue;
> > +struct vhost_vdpa_iova_range;
> >
> >   typedef int (*vhost_backend_init)(struct vhost_dev *dev, void *opaque=
);
> >   typedef int (*vhost_backend_cleanup)(struct vhost_dev *dev);
> > @@ -127,6 +128,9 @@ typedef bool (*vhost_force_iommu_op)(struct vhost_d=
ev *dev);
> >
> >   typedef int (*vhost_vring_pause_op)(struct vhost_dev *dev);
> >
> > +typedef int (*vhost_get_iova_range)(struct vhost_dev *dev,
> > +                                    hwaddr *first, hwaddr *last);
> > +
> >   typedef struct VhostOps {
> >       VhostBackendType backend_type;
> >       vhost_backend_init vhost_backend_init;
> > @@ -173,6 +177,7 @@ typedef struct VhostOps {
> >       vhost_get_device_id_op vhost_get_device_id;
> >       vhost_vring_pause_op vhost_vring_pause;
> >       vhost_force_iommu_op vhost_force_iommu;
> > +    vhost_get_iova_range vhost_get_iova_range;
> >   } VhostOps;
> >
> >   extern const VhostOps user_ops;
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 01d2101d09..74fe92935e 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -579,6 +579,23 @@ static bool  vhost_vdpa_force_iommu(struct vhost_d=
ev *dev)
> >       return true;
> >   }
> >
> > +static int vhost_vdpa_get_iova_range(struct vhost_dev *dev,
> > +                                     hwaddr *first, hwaddr *last)
> > +{
> > +    int ret;
> > +    struct vhost_vdpa_iova_range range;
> > +
> > +    ret =3D vhost_vdpa_call(dev, VHOST_VDPA_GET_IOVA_RANGE, &range);
> > +    if (ret !=3D 0) {
> > +        return ret;
> > +    }
> > +
> > +    *first =3D range.first;
> > +    *last =3D range.last;
> > +    trace_vhost_vdpa_get_iova_range(dev, *first, *last);
> > +    return ret;
> > +}
> > +
> >   const VhostOps vdpa_ops =3D {
> >           .backend_type =3D VHOST_BACKEND_TYPE_VDPA,
> >           .vhost_backend_init =3D vhost_vdpa_init,
> > @@ -611,4 +628,5 @@ const VhostOps vdpa_ops =3D {
> >           .vhost_get_device_id =3D vhost_vdpa_get_device_id,
> >           .vhost_vq_get_addr =3D vhost_vdpa_vq_get_addr,
> >           .vhost_force_iommu =3D vhost_vdpa_force_iommu,
> > +        .vhost_get_iova_range =3D vhost_vdpa_get_iova_range,
> >   };
> > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > index c62727f879..5debe3a681 100644
> > --- a/hw/virtio/trace-events
> > +++ b/hw/virtio/trace-events
> > @@ -52,6 +52,7 @@ vhost_vdpa_set_vring_call(void *dev, unsigned int ind=
ex, int fd) "dev: %p index:
> >   vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p featur=
es: 0x%"PRIx64
> >   vhost_vdpa_set_owner(void *dev) "dev: %p"
> >   vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, =
uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_use=
r_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
> > +vhost_vdpa_get_iova_range(void *dev, uint64_t first, uint64_t last) "d=
ev: %p first: 0x%"PRIx64" last: 0x%"PRIx64
> >
> >   # virtio.c
> >   virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsig=
ned out_num) "elem %p size %zd in_num %u out_num %u"
>


