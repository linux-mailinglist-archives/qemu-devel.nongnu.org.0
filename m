Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E267586594
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 09:18:48 +0200 (CEST)
Received: from localhost ([::1]:41274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIPhL-0006Mx-DQ
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 03:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIPbh-0003GE-Ps
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 03:12:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIPbd-0006NX-Km
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 03:12:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659337968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MaJwcPw6rqMoxKbpURhjt5MI2gMh6mCZlx+/+qZ4dYI=;
 b=SRX6PDdWu3VyIhb4LZwLMQMngI3glz9CXClgdLdjJsciF+vs+CkQUBE1cmE6pQsUp1ysfU
 EU9UR1lWt3nM9PEUNifddWHHezxpOxebVYHxTWJ0ykKxAZPLQwh9OEHa5sPPtgZ8xyEJ1X
 iiIsxJBXFg5giF2ZG/5gs0f05y20JNA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-o_Sm1RJ8PY6PoxaroPJpkQ-1; Mon, 01 Aug 2022 03:12:47 -0400
X-MC-Unique: o_Sm1RJ8PY6PoxaroPJpkQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 eq6-20020ad45966000000b0047405c4e6ffso5945537qvb.17
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 00:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MaJwcPw6rqMoxKbpURhjt5MI2gMh6mCZlx+/+qZ4dYI=;
 b=71yDb+OX0g/EkYm87/PI5dO8XtMuEQRLOP23u5n+eQ2ao8QDFumQgSDt5QogXtTmyI
 eJ6qqlaeOt1mIBP/6YFkRUUHE+6cMVfV/Ha0otp76k2ZM8ZyCLlAwwlas9UFWrDb6/Bp
 zIrS+HYQdp40PiR3ANAazwLG++0OFna4YHL07W6YoQJe2S8Vi0gjSyd15ZM2BXwr4LwQ
 893bIGZ7yo+voadgvGzjviMPkPqyiwn0G9IZwfPLgjHbv2MYSavnR9geXOqwIpR/NL1j
 rkTKjGHx5ibPnMmi/URPfAkTEEjbIJHqU5HvM5cgoQ+UxX3X81XEDPMkmwSRReRbCF5Y
 iBSw==
X-Gm-Message-State: AJIora89HfCcsRJ+49VKHFLEK83otJ8bI6/4MzRrdekrP2415O6dy4ET
 lndSxGUnBCsYT+3F2R01q6EWbQupKrXXgVX1IzHujhmTWVnO8LPOGZaduEsOp/Tytyy3TXHXhxW
 2GGoDx5WHp/nf5L4sx6006EVGfFhZ3X4=
X-Received: by 2002:a05:622a:451:b0:31f:4257:4eb2 with SMTP id
 o17-20020a05622a045100b0031f42574eb2mr12904748qtx.370.1659337967082; 
 Mon, 01 Aug 2022 00:12:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uy0ZyKis0LvodlojZgZ/Lwc5lXOzt2JS41lLsfg3F+rNCQbg7u1pOKRVQs4wGQcINWsoPevJvX4LSQpQnpx3U=
X-Received: by 2002:a05:622a:451:b0:31f:4257:4eb2 with SMTP id
 o17-20020a05622a045100b0031f42574eb2mr12904730qtx.370.1659337966813; Mon, 01
 Aug 2022 00:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220722134318.3430667-1-eperezma@redhat.com>
 <20220722134318.3430667-5-eperezma@redhat.com>
 <22b35cff-bcd5-78b8-cab4-43d2e65dccbe@redhat.com>
In-Reply-To: <22b35cff-bcd5-78b8-cab4-43d2e65dccbe@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 1 Aug 2022 09:12:11 +0200
Message-ID: <CAJaqyWe1rpz4LtX++zht7eSq3qGYi1s-Ti6iFV96HjrAYE1JSA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] vdpa: Add asid parameter to
 vhost_vdpa_dma_map/unmap
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, Cindy Lu <lulu@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, kvm list <kvm@vger.kernel.org>, 
 Parav Pandit <parav@mellanox.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Gautam Dawar <gdawar@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 25, 2022 at 11:36 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/7/22 21:43, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > So the caller can choose which ASID is destined.
> >
> > No need to update the batch functions as they will always be called fro=
m
> > memory listener updates at the moment. Memory listener updates will
> > always update ASID 0, as it's the passthrough ASID.
> >
> > All vhost devices's ASID are 0 at this moment.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   include/hw/virtio/vhost-vdpa.h |  8 +++++---
> >   hw/virtio/vhost-vdpa.c         | 26 ++++++++++++++++----------
> >   net/vhost-vdpa.c               |  6 +++---
> >   hw/virtio/trace-events         |  4 ++--
> >   4 files changed, 26 insertions(+), 18 deletions(-)
> >
> > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-v=
dpa.h
> > index 1111d85643..6560bb9d78 100644
> > --- a/include/hw/virtio/vhost-vdpa.h
> > +++ b/include/hw/virtio/vhost-vdpa.h
> > @@ -29,6 +29,7 @@ typedef struct vhost_vdpa {
> >       int index;
> >       uint32_t msg_type;
> >       bool iotlb_batch_begin_sent;
> > +    uint32_t address_space_id;
> >       MemoryListener listener;
> >       struct vhost_vdpa_iova_range iova_range;
> >       uint64_t acked_features;
> > @@ -42,8 +43,9 @@ typedef struct vhost_vdpa {
> >       VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> >   } VhostVDPA;
> >
> > -int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
> > -                       void *vaddr, bool readonly);
> > -int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwaddr siz=
e);
> > +int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iov=
a,
> > +                       hwaddr size, void *vaddr, bool readonly);
> > +int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, uint32_t asid, hwaddr i=
ova,
> > +                         hwaddr size);
> >
> >   #endif
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index e1ed56b26d..79623badf2 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -72,22 +72,24 @@ static bool vhost_vdpa_listener_skipped_section(Mem=
oryRegionSection *section,
> >       return false;
> >   }
> >
> > -int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
> > -                       void *vaddr, bool readonly)
> > +int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iov=
a,
> > +                       hwaddr size, void *vaddr, bool readonly)
> >   {
> >       struct vhost_msg_v2 msg =3D {};
> >       int fd =3D v->device_fd;
> >       int ret =3D 0;
> >
> >       msg.type =3D v->msg_type;
> > +    msg.asid =3D asid;
> >       msg.iotlb.iova =3D iova;
> >       msg.iotlb.size =3D size;
> >       msg.iotlb.uaddr =3D (uint64_t)(uintptr_t)vaddr;
> >       msg.iotlb.perm =3D readonly ? VHOST_ACCESS_RO : VHOST_ACCESS_RW;
> >       msg.iotlb.type =3D VHOST_IOTLB_UPDATE;
> >
> > -   trace_vhost_vdpa_dma_map(v, fd, msg.type, msg.iotlb.iova, msg.iotlb=
.size,
> > -                            msg.iotlb.uaddr, msg.iotlb.perm, msg.iotlb=
.type);
> > +    trace_vhost_vdpa_dma_map(v, fd, msg.type, msg.asid, msg.iotlb.iova=
,
> > +                             msg.iotlb.size, msg.iotlb.uaddr, msg.iotl=
b.perm,
> > +                             msg.iotlb.type);
> >
> >       if (write(fd, &msg, sizeof(msg)) !=3D sizeof(msg)) {
> >           error_report("failed to write, fd=3D%d, errno=3D%d (%s)",
> > @@ -98,18 +100,20 @@ int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwadd=
r iova, hwaddr size,
> >       return ret;
> >   }
> >
> > -int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwaddr siz=
e)
> > +int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, uint32_t asid, hwaddr i=
ova,
> > +                         hwaddr size)
> >   {
> >       struct vhost_msg_v2 msg =3D {};
> >       int fd =3D v->device_fd;
> >       int ret =3D 0;
> >
> >       msg.type =3D v->msg_type;
> > +    msg.asid =3D asid;
> >       msg.iotlb.iova =3D iova;
> >       msg.iotlb.size =3D size;
> >       msg.iotlb.type =3D VHOST_IOTLB_INVALIDATE;
> >
> > -    trace_vhost_vdpa_dma_unmap(v, fd, msg.type, msg.iotlb.iova,
> > +    trace_vhost_vdpa_dma_unmap(v, fd, msg.type, msg.asid, msg.iotlb.io=
va,
> >                                  msg.iotlb.size, msg.iotlb.type);
> >
> >       if (write(fd, &msg, sizeof(msg)) !=3D sizeof(msg)) {
> > @@ -228,7 +232,7 @@ static void vhost_vdpa_listener_region_add(MemoryLi=
stener *listener,
> >       }
> >
> >       vhost_vdpa_iotlb_batch_begin_once(v);
> > -    ret =3D vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
> > +    ret =3D vhost_vdpa_dma_map(v, 0, iova, int128_get64(llsize),
> >                                vaddr, section->readonly);
> >       if (ret) {
> >           error_report("vhost vdpa map fail!");
> > @@ -293,7 +297,7 @@ static void vhost_vdpa_listener_region_del(MemoryLi=
stener *listener,
> >           vhost_iova_tree_remove(v->iova_tree, result);
> >       }
> >       vhost_vdpa_iotlb_batch_begin_once(v);
> > -    ret =3D vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
> > +    ret =3D vhost_vdpa_dma_unmap(v, 0, iova, int128_get64(llsize));
> >       if (ret) {
> >           error_report("vhost_vdpa dma unmap error!");
> >       }
> > @@ -884,7 +888,7 @@ static bool vhost_vdpa_svq_unmap_ring(struct vhost_=
vdpa *v,
> >       }
> >
> >       size =3D ROUND_UP(result->size, qemu_real_host_page_size());
> > -    r =3D vhost_vdpa_dma_unmap(v, result->iova, size);
> > +    r =3D vhost_vdpa_dma_unmap(v, v->address_space_id, result->iova, s=
ize);
> >       return r =3D=3D 0;
> >   }
> >
> > @@ -926,7 +930,8 @@ static bool vhost_vdpa_svq_map_ring(struct vhost_vd=
pa *v, DMAMap *needle,
> >           return false;
> >       }
> >
> > -    r =3D vhost_vdpa_dma_map(v, needle->iova, needle->size + 1,
> > +    r =3D vhost_vdpa_dma_map(v, v->address_space_id, needle->iova,
> > +                           needle->size + 1,
> >                              (void *)(uintptr_t)needle->translated_addr=
,
> >                              needle->perm =3D=3D IOMMU_RO);
> >       if (unlikely(r !=3D 0)) {
> > @@ -1092,6 +1097,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev =
*dev, bool started)
> >
> >       if (started) {
> >           vhost_vdpa_host_notifiers_init(dev);
> > +
>
>
> Unnecessary changes.
>
> Other looks good.
>

I'll resend without it.

Thanks!

> Thanks
>
>
> >           ok =3D vhost_vdpa_svqs_start(dev);
> >           if (unlikely(!ok)) {
> >               return -1;
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 75143ded8b..8203200c2a 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -229,7 +229,7 @@ static void vhost_vdpa_cvq_unmap_buf(struct vhost_v=
dpa *v, void *addr)
> >           return;
> >       }
> >
> > -    r =3D vhost_vdpa_dma_unmap(v, map->iova, map->size + 1);
> > +    r =3D vhost_vdpa_dma_unmap(v, v->address_space_id, map->iova, map-=
>size + 1);
> >       if (unlikely(r !=3D 0)) {
> >           error_report("Device cannot unmap: %s(%d)", g_strerror(r), r)=
;
> >       }
> > @@ -278,8 +278,8 @@ static bool vhost_vdpa_cvq_map_buf(struct vhost_vdp=
a *v,
> >           return false;
> >       }
> >
> > -    r =3D vhost_vdpa_dma_map(v, map.iova, vhost_vdpa_net_cvq_cmd_page_=
len(), buf,
> > -                           !write);
> > +    r =3D vhost_vdpa_dma_map(v, v->address_space_id, map.iova,
> > +                           vhost_vdpa_net_cvq_cmd_page_len(), buf, !wr=
ite);
> >       if (unlikely(r < 0)) {
> >           goto dma_map_err;
> >       }
> > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > index 20af2e7ebd..36e5ae75f6 100644
> > --- a/hw/virtio/trace-events
> > +++ b/hw/virtio/trace-events
> > @@ -26,8 +26,8 @@ vhost_user_write(uint32_t req, uint32_t flags) "req:%=
d flags:0x%"PRIx32""
> >   vhost_user_create_notifier(int idx, void *n) "idx:%d n:%p"
> >
> >   # vhost-vdpa.c
> > -vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint64_t iov=
a, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type) "vdpa:%p fd: =
%d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" uaddr: 0x%"PRIx6=
4" perm: 0x%"PRIx8" type: %"PRIu8
> > -vhost_vdpa_dma_unmap(void *vdpa, int fd, uint32_t msg_type, uint64_t i=
ova, uint64_t size, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iova:=
 0x%"PRIx64" size: 0x%"PRIx64" type: %"PRIu8
> > +vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint32_t asi=
d, uint64_t iova, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type=
) "vdpa:%p fd: %d msg_type: %"PRIu32" asid: %"PRIu32" iova: 0x%"PRIx64" siz=
e: 0x%"PRIx64" uaddr: 0x%"PRIx64" perm: 0x%"PRIx8" type: %"PRIu8
> > +vhost_vdpa_dma_unmap(void *vdpa, int fd, uint32_t msg_type, uint32_t a=
sid, uint64_t iova, uint64_t size, uint8_t type) "vdpa:%p fd: %d msg_type: =
%"PRIu32" asid: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" type: %"PRIu8
> >   vhost_vdpa_listener_begin_batch(void *v, int fd, uint32_t msg_type, u=
int8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
> >   vhost_vdpa_listener_commit(void *v, int fd, uint32_t msg_type, uint8_=
t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
> >   vhost_vdpa_listener_region_add(void *vdpa, uint64_t iova, uint64_t ll=
end, void *vaddr, bool readonly) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx6=
4" vaddr: %p read-only: %d"
>


