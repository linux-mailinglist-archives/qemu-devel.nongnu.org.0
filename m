Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAE542DBF0
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 16:42:13 +0200 (CEST)
Received: from localhost ([::1]:34488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb1vw-0006HW-0W
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 10:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mb1uA-0005Zg-ER
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 10:40:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mb1u5-0000Yn-UR
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 10:40:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634222415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b8u7LQkZhVVSf9cqZbCINo2EEXMnT223lxM5AWR7uh8=;
 b=Scqch6rPynxCiTghBefjMxzJLCUFW+ixdK3DnTtK3W6BuEoc4ylzE7mPuAEVWN71ijljqy
 tiFRbh2GheRA+MCakC3TcqtGYq7zckwFYZG/G+lFYDidp5xKLTxrgC70/KjL+bONt0zzs9
 lSSj+rc0kaaijdg4ZmQWwKAK66jcOhY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-nMNlJS09NNuH0ivEVfSRXg-1; Thu, 14 Oct 2021 10:40:11 -0400
X-MC-Unique: nMNlJS09NNuH0ivEVfSRXg-1
Received: by mail-qk1-f198.google.com with SMTP id
 z29-20020a05620a08dd00b0045fa369b83dso4597025qkz.9
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 07:40:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b8u7LQkZhVVSf9cqZbCINo2EEXMnT223lxM5AWR7uh8=;
 b=3EjkexvGxSv776hD18A6vCxxys5+kJtbeiISR8/SrMX9Y6C2KWezOtBRd3Es72BDRh
 2Hym9Fg8jC9YHu+jtDuSm9iCbG9Gco4yPX9w2KJLvwdKrONE0u8VtP4qqmj2lbEWWYpd
 fonsyW9aBew73Fwdnx4B9PW5ZRrQdU8sGcokYYHZzEDqS/FfXmWn1E5tq5CC/eJN73HI
 TYrdCEiLFrDA7n+rFt9rUSSS8Xez/ISKyr46fEkMsYb07xHj3V2/YJjk8KfaNe8tU600
 UURLHUg7PbHgW365Y1QCVykgsaKI+ntIF2zEj41cKVd63U9Ul7Q0Lsk8RCJ1DQ2Aj472
 Y1qw==
X-Gm-Message-State: AOAM533IDM7jkcX4l54Kqc7OFzQgJ0WzYK4do62Ro6S3QpLR53RfUK1y
 gl+9B420j6ul8mmTPO5xFULqEK5ekTttrt/b6+9g4rO+CJBM8O69y6SXIKOj3tEh9WGZCu+ahHT
 wahD/6WNeqK3AM882k7B6ZMRWUsVTJaE=
X-Received: by 2002:a37:5446:: with SMTP id i67mr5092778qkb.502.1634222410754; 
 Thu, 14 Oct 2021 07:40:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpRSy4i+z+WSbk67Wkg885rjxMTV5Af6d3fhKqsmdxBfwA/LknIa862J0l/vTQCWjzr5xlP6h6nve0gTMrEWI=
X-Received: by 2002:a37:5446:: with SMTP id i67mr5092756qkb.502.1634222410498; 
 Thu, 14 Oct 2021 07:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-13-eperezma@redhat.com>
 <981f5647-544e-f35e-4b72-06eca733368f@redhat.com>
In-Reply-To: <981f5647-544e-f35e-4b72-06eca733368f@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 14 Oct 2021 16:39:33 +0200
Message-ID: <CAJaqyWeJDpe2FsFCN2dbLRtd2x7J4-NsQ4R5W=7QhP2DmYszxg@mail.gmail.com>
Subject: Re: [RFC PATCH v4 12/20] virtio: Add vhost_shadow_vq_get_vring_addr
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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

On Wed, Oct 13, 2021 at 5:54 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:05, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > It reports the shadow virtqueue address from qemu virtual address space
>
>
> I think both the title and commit log needs to more tweaks. Looking at
> the codes, what id does is actually introduce vring into svq.
>

Right, this commit evolved a little bit providing more functionality
and it is not reflected in the commit message. I will expand it.

>
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.h |  4 +++
> >   hw/virtio/vhost-shadow-virtqueue.c | 50 +++++++++++++++++++++++++++++=
+
> >   2 files changed, 54 insertions(+)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index 237cfceb9c..2df3d117f5 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -16,6 +16,10 @@ typedef struct VhostShadowVirtqueue VhostShadowVirtq=
ueue;
> >
> >   EventNotifier *vhost_svq_get_svq_call_notifier(VhostShadowVirtqueue *=
svq);
> >   void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq, int=
 call_fd);
> > +void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
> > +                              struct vhost_vring_addr *addr);
> > +size_t vhost_svq_driver_area_size(const VhostShadowVirtqueue *svq);
> > +size_t vhost_svq_device_area_size(const VhostShadowVirtqueue *svq);
> >
> >   bool vhost_svq_start(struct vhost_dev *dev, unsigned idx,
> >                        VhostShadowVirtqueue *svq);
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 3fe129cf63..5c1899f6af 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -18,6 +18,9 @@
> >
> >   /* Shadow virtqueue to relay notifications */
> >   typedef struct VhostShadowVirtqueue {
> > +    /* Shadow vring */
> > +    struct vring vring;
> > +
> >       /* Shadow kick notifier, sent to vhost */
> >       EventNotifier kick_notifier;
> >       /* Shadow call notifier, sent to vhost */
> > @@ -38,6 +41,9 @@ typedef struct VhostShadowVirtqueue {
> >
> >       /* Virtio queue shadowing */
> >       VirtQueue *vq;
> > +
> > +    /* Virtio device */
> > +    VirtIODevice *vdev;
> >   } VhostShadowVirtqueue;
> >
> >   /* Forward guest notifications */
> > @@ -93,6 +99,35 @@ void vhost_svq_set_guest_call_notifier(VhostShadowVi=
rtqueue *svq, int call_fd)
> >       event_notifier_init_fd(&svq->guest_call_notifier, call_fd);
> >   }
> >
> > +/*
> > + * Get the shadow vq vring address.
> > + * @svq Shadow virtqueue
> > + * @addr Destination to store address
> > + */
> > +void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
> > +                              struct vhost_vring_addr *addr)
> > +{
> > +    addr->desc_user_addr =3D (uint64_t)svq->vring.desc;
> > +    addr->avail_user_addr =3D (uint64_t)svq->vring.avail;
> > +    addr->used_user_addr =3D (uint64_t)svq->vring.used;
> > +}
> > +
> > +size_t vhost_svq_driver_area_size(const VhostShadowVirtqueue *svq)
> > +{
> > +    uint16_t vq_idx =3D virtio_get_queue_index(svq->vq);
> > +    size_t desc_size =3D virtio_queue_get_desc_size(svq->vdev, vq_idx)=
;
> > +    size_t avail_size =3D virtio_queue_get_avail_size(svq->vdev, vq_id=
x);
> > +
> > +    return ROUND_UP(desc_size + avail_size, qemu_real_host_page_size);
>
>
> Is this round up required by the spec?
>

No, I was trying to avoid that more qemu data get exposed to the
device because of mapping at page granularity, in case data gets
allocated after some region. I will expand with a comment, but if
there are other ways to achieve or it is not needed please let me
know!

>
> > +}
> > +
> > +size_t vhost_svq_device_area_size(const VhostShadowVirtqueue *svq)
> > +{
> > +    uint16_t vq_idx =3D virtio_get_queue_index(svq->vq);
> > +    size_t used_size =3D virtio_queue_get_used_size(svq->vdev, vq_idx)=
;
> > +    return ROUND_UP(used_size, qemu_real_host_page_size);
> > +}
> > +
> >   /*
> >    * Restore the vhost guest to host notifier, i.e., disables svq effec=
t.
> >    */
> > @@ -178,6 +213,10 @@ void vhost_svq_stop(struct vhost_dev *dev, unsigne=
d idx,
> >   VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx)
> >   {
> >       int vq_idx =3D dev->vq_index + idx;
> > +    unsigned num =3D virtio_queue_get_num(dev->vdev, vq_idx);
> > +    size_t desc_size =3D virtio_queue_get_desc_size(dev->vdev, vq_idx)=
;
> > +    size_t driver_size;
> > +    size_t device_size;
> >       g_autofree VhostShadowVirtqueue *svq =3D g_new0(VhostShadowVirtqu=
eue, 1);
> >       int r;
> >
> > @@ -196,6 +235,15 @@ VhostShadowVirtqueue *vhost_svq_new(struct vhost_d=
ev *dev, int idx)
> >       }
> >
> >       svq->vq =3D virtio_get_queue(dev->vdev, vq_idx);
> > +    svq->vdev =3D dev->vdev;
> > +    driver_size =3D vhost_svq_driver_area_size(svq);
> > +    device_size =3D vhost_svq_device_area_size(svq);
> > +    svq->vring.num =3D num;
> > +    svq->vring.desc =3D qemu_memalign(qemu_real_host_page_size, driver=
_size);
> > +    svq->vring.avail =3D (void *)((char *)svq->vring.desc + desc_size)=
;
> > +    memset(svq->vring.desc, 0, driver_size);
>
>
> Any reason for using the contiguous area for both desc and avail?
>

No special reason, it can be splitted but if we maintain the
page-width padding it could save memory, iotlb entries, etc. Not like
it's going to be a big difference but still.

Thanks!

> Thanks
>
>
> > +    svq->vring.used =3D qemu_memalign(qemu_real_host_page_size, device=
_size);
> > +    memset(svq->vring.used, 0, device_size);
> >       event_notifier_set_handler(&svq->call_notifier,
> >                                  vhost_svq_handle_call);
> >       return g_steal_pointer(&svq);
> > @@ -215,5 +263,7 @@ void vhost_svq_free(VhostShadowVirtqueue *vq)
> >       event_notifier_cleanup(&vq->kick_notifier);
> >       event_notifier_set_handler(&vq->call_notifier, NULL);
> >       event_notifier_cleanup(&vq->call_notifier);
> > +    qemu_vfree(vq->vring.desc);
> > +    qemu_vfree(vq->vring.used);
> >       g_free(vq);
> >   }
>


