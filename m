Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0EB624323
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 14:24:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot7Wm-0001PU-CH; Thu, 10 Nov 2022 08:23:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ot7Wk-0001P6-9b
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 08:23:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ot7Wh-00065Y-6I
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 08:23:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668086603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q3q7vZZ6hvLVnoXGfWB8YvLJ7mySd3fvzdjJdGt/+ak=;
 b=Kk1c/UokPZZ4bZarbtwX7aq06GQyrSGluORAiVkoz2ugOX6stC43F9XnAYGaXq84EbRmNW
 30G6I9bRqFPeb3w8DKd4xNGsgBpIiozPn82piBRazpkz4gT4sCqqrYVHvjBesMV3NLGVQs
 oNnGyvAbQTSXsqZn5uc5a1UnnB22aUY=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-85-5vslwAx8Od-B4Gq36Y1ImQ-1; Thu, 10 Nov 2022 08:23:22 -0500
X-MC-Unique: 5vslwAx8Od-B4Gq36Y1ImQ-1
Received: by mail-pg1-f197.google.com with SMTP id
 v18-20020a637a12000000b0046ed84b94efso998452pgc.6
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 05:23:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q3q7vZZ6hvLVnoXGfWB8YvLJ7mySd3fvzdjJdGt/+ak=;
 b=GnxltXSuo+frd62Z2pt3yNvj21b2eHqGoOKACpDmaxrq7iQLZtOsly5Nyn6La5zOFG
 znr0dJ2RkshJfOcjST6GSqdLiTVuF2qR4BlC/DHIZRZ1+Lyc8pIkfAtTRfGDrnBZQ370
 0SoF7gAoQY9jhVZF/4hAw4R6jU+fyZwFwr24zFyRR14a1OOnBNDTNMFCsy3vTqvVH1iV
 wElrLww0NJUcvJQ6bnlf0HyBzEYSoKqdP3rmZV47ZHdx1yuEMbqkBnxVRemj+SIPc+E+
 GFJGMh25PHMNkHn5N5Apw2ZtRgT/8NXq0f9WvCR6miye0ds7S39avA+yY5p2HiBxL9mi
 XFjw==
X-Gm-Message-State: ACrzQf0+J34ZQ/TnAVBFRbuqNWoGSaSipAVB7KVSPO+30Y1EfZFEJXwB
 0HmuA1Vzqv3lryBCWIDvLQ4ka0baugXrR48KzDAz6BrmUEaKUr6VrRGKHnSGxcfjyP4nN52Z/6h
 GICAjy3aMiI3bWdGN4a/GQLS/gKHGFVE=
X-Received: by 2002:a17:902:ce82:b0:187:3591:edac with SMTP id
 f2-20020a170902ce8200b001873591edacmr48488798plg.153.1668086600648; 
 Thu, 10 Nov 2022 05:23:20 -0800 (PST)
X-Google-Smtp-Source: AMsMyM60JtWWo+8r1fX04eXc7OnFF8dnAgixl/Vtg8iEneJB0G+bnbPRN9yBXp2W/vnf9wtqStSSz51zIUu0h7utnR0=
X-Received: by 2002:a17:902:ce82:b0:187:3591:edac with SMTP id
 f2-20020a170902ce8200b001873591edacmr48488761plg.153.1668086600262; Thu, 10
 Nov 2022 05:23:20 -0800 (PST)
MIME-Version: 1.0
References: <20221108170755.92768-1-eperezma@redhat.com>
 <20221108170755.92768-8-eperezma@redhat.com>
 <CACGkMEvzw283JE9Uo6kqKuAJ4CWpWyHciHe8DazLEP5Xzw91wg@mail.gmail.com>
In-Reply-To: <CACGkMEvzw283JE9Uo6kqKuAJ4CWpWyHciHe8DazLEP5Xzw91wg@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 10 Nov 2022 14:22:44 +0100
Message-ID: <CAJaqyWcbYLzdEcPMMjDNWsGV4bkb8NTJnNHj5Wp+v4WbM+LHeQ@mail.gmail.com>
Subject: Re: [PATCH v6 07/10] vdpa: Add asid parameter to
 vhost_vdpa_dma_map/unmap
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Parav Pandit <parav@mellanox.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>, 
 Laurent Vivier <lvivier@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, kvm@vger.kernel.org, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Nov 10, 2022 at 6:51 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Wed, Nov 9, 2022 at 1:08 AM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
> >
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
> > v5:
> > * Solve conflict, now vhost_vdpa_svq_unmap_ring returns void
> > * Change comment on zero initialization.
> >
> > v4: Add comment specifying behavior if device does not support _F_ASID
> >
> > v3: Deleted unneeded space
> > ---
> >  include/hw/virtio/vhost-vdpa.h |  8 +++++---
> >  hw/virtio/vhost-vdpa.c         | 29 +++++++++++++++++++----------
> >  net/vhost-vdpa.c               |  6 +++---
> >  hw/virtio/trace-events         |  4 ++--
> >  4 files changed, 29 insertions(+), 18 deletions(-)
> >
> > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-v=
dpa.h
> > index 1111d85643..6560bb9d78 100644
> > --- a/include/hw/virtio/vhost-vdpa.h
> > +++ b/include/hw/virtio/vhost-vdpa.h
> > @@ -29,6 +29,7 @@ typedef struct vhost_vdpa {
> >      int index;
> >      uint32_t msg_type;
> >      bool iotlb_batch_begin_sent;
> > +    uint32_t address_space_id;
>
> So the trick is let device specific code to zero this during allocation?
>

Yes, but I don't see how that is a trick :). All other parameters also
trust it to be 0 at allocation.

> >      MemoryListener listener;
> >      struct vhost_vdpa_iova_range iova_range;
> >      uint64_t acked_features;
> > @@ -42,8 +43,9 @@ typedef struct vhost_vdpa {
> >      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> >  } VhostVDPA;
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
> >  #endif
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 23efb8f49d..8fd32ba32b 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -72,22 +72,24 @@ static bool vhost_vdpa_listener_skipped_section(Mem=
oryRegionSection *section,
> >      return false;
> >  }
> >
> > -int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
> > -                       void *vaddr, bool readonly)
> > +int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iov=
a,
> > +                       hwaddr size, void *vaddr, bool readonly)
> >  {
> >      struct vhost_msg_v2 msg =3D {};
> >      int fd =3D v->device_fd;
> >      int ret =3D 0;
> >
> >      msg.type =3D v->msg_type;
> > +    msg.asid =3D asid; /* 0 if vdpa device does not support asid */
>
> The comment here is confusing. If this is a requirement, we need either
>
> 1) doc this
>
> or
>
> 2) perform necessary checks in the function itself.
>

I only documented it in vhost_vdpa_dma_unmap and now I realize it.
Would it work to just copy that comment here?

> >      msg.iotlb.iova =3D iova;
> >      msg.iotlb.size =3D size;
> >      msg.iotlb.uaddr =3D (uint64_t)(uintptr_t)vaddr;
> >      msg.iotlb.perm =3D readonly ? VHOST_ACCESS_RO : VHOST_ACCESS_RW;
> >      msg.iotlb.type =3D VHOST_IOTLB_UPDATE;
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
> >      if (write(fd, &msg, sizeof(msg)) !=3D sizeof(msg)) {
> >          error_report("failed to write, fd=3D%d, errno=3D%d (%s)",
> > @@ -98,18 +100,24 @@ int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwadd=
r iova, hwaddr size,
> >      return ret;
> >  }
> >
> > -int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwaddr siz=
e)
> > +int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, uint32_t asid, hwaddr i=
ova,
> > +                         hwaddr size)
> >  {
> >      struct vhost_msg_v2 msg =3D {};
> >      int fd =3D v->device_fd;
> >      int ret =3D 0;
> >
> >      msg.type =3D v->msg_type;
> > +    /*
> > +     * The caller must set asid =3D 0 if the device does not support a=
sid.
> > +     * This is not an ABI break since it is set to 0 by the initialize=
r anyway.
> > +     */
> > +    msg.asid =3D asid;
> >      msg.iotlb.iova =3D iova;
> >      msg.iotlb.size =3D size;
> >      msg.iotlb.type =3D VHOST_IOTLB_INVALIDATE;
> >
> > -    trace_vhost_vdpa_dma_unmap(v, fd, msg.type, msg.iotlb.iova,
> > +    trace_vhost_vdpa_dma_unmap(v, fd, msg.type, msg.asid, msg.iotlb.io=
va,
> >                                 msg.iotlb.size, msg.iotlb.type);
> >
> >      if (write(fd, &msg, sizeof(msg)) !=3D sizeof(msg)) {
> > @@ -229,7 +237,7 @@ static void vhost_vdpa_listener_region_add(MemoryLi=
stener *listener,
> >      }
> >
> >      vhost_vdpa_iotlb_batch_begin_once(v);
> > -    ret =3D vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
> > +    ret =3D vhost_vdpa_dma_map(v, 0, iova, int128_get64(llsize),
>
> Can we use v->address_space_id here? Then we don't need to modify this
> line when we support multiple asids logic in the future.
>

The registered memory listener is the one of the last vhost_vdpa, the
one that handles the last queue.

If all data virtqueues are not shadowed but CVQ is,
v->address_space_id is 1 with the current code. But the listener is
actually mapping the ASID 0, not 1.

Another alternative is to register it to the last data virtqueue, not
the last queue of vhost_vdpa. But it is hard to express it in a
generic way at virtio/vhost-vdpa.c . To have a boolean indicating the
vhost_vdpa we want to register its memory listener?

It seems easier to me to simply assign 0 at GPA translations. If SVQ
is enabled for all queues, then 0 is GPA to qemu's VA + SVQ stuff. If
it is not, 0 is always GPA to qemu's VA.

Thanks!

> Thanks
>
> >                               vaddr, section->readonly);
> >      if (ret) {
> >          error_report("vhost vdpa map fail!");
> > @@ -303,7 +311,7 @@ static void vhost_vdpa_listener_region_del(MemoryLi=
stener *listener,
> >          vhost_iova_tree_remove(v->iova_tree, *result);
> >      }
> >      vhost_vdpa_iotlb_batch_begin_once(v);
> > -    ret =3D vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
> > +    ret =3D vhost_vdpa_dma_unmap(v, 0, iova, int128_get64(llsize));
> >      if (ret) {
> >          error_report("vhost_vdpa dma unmap error!");
> >      }
> > @@ -884,7 +892,7 @@ static void vhost_vdpa_svq_unmap_ring(struct vhost_=
vdpa *v, hwaddr addr)
> >      }
> >
> >      size =3D ROUND_UP(result->size, qemu_real_host_page_size());
> > -    r =3D vhost_vdpa_dma_unmap(v, result->iova, size);
> > +    r =3D vhost_vdpa_dma_unmap(v, v->address_space_id, result->iova, s=
ize);
> >      if (unlikely(r < 0)) {
> >          error_report("Unable to unmap SVQ vring: %s (%d)", g_strerror(=
-r), -r);
> >          return;
> > @@ -924,7 +932,8 @@ static bool vhost_vdpa_svq_map_ring(struct vhost_vd=
pa *v, DMAMap *needle,
> >          return false;
> >      }
> >
> > -    r =3D vhost_vdpa_dma_map(v, needle->iova, needle->size + 1,
> > +    r =3D vhost_vdpa_dma_map(v, v->address_space_id, needle->iova,
> > +                           needle->size + 1,
> >                             (void *)(uintptr_t)needle->translated_addr,
> >                             needle->perm =3D=3D IOMMU_RO);
> >      if (unlikely(r !=3D 0)) {
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index fb35b17ab4..ca1acc0410 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -258,7 +258,7 @@ static void vhost_vdpa_cvq_unmap_buf(struct vhost_v=
dpa *v, void *addr)
> >          return;
> >      }
> >
> > -    r =3D vhost_vdpa_dma_unmap(v, map->iova, map->size + 1);
> > +    r =3D vhost_vdpa_dma_unmap(v, v->address_space_id, map->iova, map-=
>size + 1);
> >      if (unlikely(r !=3D 0)) {
> >          error_report("Device cannot unmap: %s(%d)", g_strerror(r), r);
> >      }
> > @@ -298,8 +298,8 @@ static int vhost_vdpa_cvq_map_buf(struct vhost_vdpa=
 *v, void *buf, size_t size,
> >          return r;
> >      }
> >
> > -    r =3D vhost_vdpa_dma_map(v, map.iova, vhost_vdpa_net_cvq_cmd_page_=
len(), buf,
> > -                           !write);
> > +    r =3D vhost_vdpa_dma_map(v, v->address_space_id, map.iova,
> > +                           vhost_vdpa_net_cvq_cmd_page_len(), buf, !wr=
ite);
> >      if (unlikely(r < 0)) {
> >          goto dma_map_err;
> >      }
> > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > index 820dadc26c..0ad9390307 100644
> > --- a/hw/virtio/trace-events
> > +++ b/hw/virtio/trace-events
> > @@ -30,8 +30,8 @@ vhost_user_write(uint32_t req, uint32_t flags) "req:%=
d flags:0x%"PRIx32""
> >  vhost_user_create_notifier(int idx, void *n) "idx:%d n:%p"
> >
> >  # vhost-vdpa.c
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
> >  vhost_vdpa_listener_begin_batch(void *v, int fd, uint32_t msg_type, ui=
nt8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
> >  vhost_vdpa_listener_commit(void *v, int fd, uint32_t msg_type, uint8_t=
 type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
> >  vhost_vdpa_listener_region_add(void *vdpa, uint64_t iova, uint64_t lle=
nd, void *vaddr, bool readonly) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx64=
" vaddr: %p read-only: %d"
> > --
> > 2.31.1
> >
>


