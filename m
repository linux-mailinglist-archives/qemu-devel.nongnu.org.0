Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCBE33D73E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 16:22:39 +0100 (CET)
Received: from localhost ([::1]:58652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMBWo-0006gE-3C
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 11:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lMBV2-00058u-Co
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:20:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lMBUz-0002X5-6Y
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:20:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615908043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nrf+s6tunls2KZBABv7vnt0FxnDqlXHU65SDTdOklVs=;
 b=SbKruyMwCP2Q+2SDhe2hDzaVgBzrUz+3WA90wp0fx6QeBed15CjCPSpD9+z+QeeIWHcQ7/
 BAX/NfxAzlkg4hy7ykuKjAZ9q41mhUwy5KJLk3yTtYCgn9ZhGHGEB/GHAufQyW6Z6qLNa+
 NYJdJl2VXId4/+0fE5ae2mw8GzGOWow=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-QYj0aOB_M6ad8P5TejT4uw-1; Tue, 16 Mar 2021 11:20:42 -0400
X-MC-Unique: QYj0aOB_M6ad8P5TejT4uw-1
Received: by mail-qv1-f71.google.com with SMTP id j3so25529912qvo.1
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 08:20:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Nrf+s6tunls2KZBABv7vnt0FxnDqlXHU65SDTdOklVs=;
 b=EWkZz35SSTWcqaKXxQdjUDwqJudNwJMJxNOAXSDlDM3/X53vO1nMAOYBiSl0anMrim
 9YkYaiYRvqjIFtihnK6jMtzWkv1/L42nr2HlLPiKkrfmxgILoqVu8W0SQkzQxG0duuKA
 3TRUltzpCMhf7W5Z0KUhTIyFqr/JUYJHrT8fQgIdT0Bq2pL48S4RTTsj8PHQ/t+ODyeI
 hExyf6j2w24hGbW/CI9jRUv79p4tDQmbUK4VFB1aiqpMtLXiuJ5mHzpq096Gx0dNQoVB
 sv4YkyyMWE1r2pUbN1EoksILMSTVp3h2eBROposSS53rH/hFXuo+uVfR1y9L0kPJWYOU
 4MXg==
X-Gm-Message-State: AOAM533p3BktJJQI99N8Luw2vWxL7pSTsEOw7SyTHwzorkSA5cTSlNue
 361O9vymRa5ccEUbrfYyFjZDzmjAcgz2RrmcBx3GksG5vdxAxu4b07OiKfS5UAbnCvj5Dd6jvzi
 vQf9RfMqNaJTv9cTFC18Ymc1h0mcGnBg=
X-Received: by 2002:a37:af83:: with SMTP id y125mr120660qke.210.1615908041664; 
 Tue, 16 Mar 2021 08:20:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyASx746DQCRU+sLInCXjqcscYlwSr8CPrCFR7ElkODJtXJOqtuCXg/92dv/WccgGwq9RwHN4tSrZTus3r1w5U=
X-Received: by 2002:a37:af83:: with SMTP id y125mr120631qke.210.1615908041431; 
 Tue, 16 Mar 2021 08:20:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210315194842.277740-1-eperezma@redhat.com>
 <20210315194842.277740-9-eperezma@redhat.com>
 <0ab71cb2-6240-3c26-18db-71a1a9d25275@redhat.com>
In-Reply-To: <0ab71cb2-6240-3c26-18db-71a1a9d25275@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 16 Mar 2021 16:20:05 +0100
Message-ID: <CAJaqyWf-LttgkodnSR6L9K0TEy5bwV+=2ny=j=6HeL_dEbQXgA@mail.gmail.com>
Subject: Re: [RFC v2 08/13] virtio: Add vhost_shadow_vq_get_vring_addr
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
 Guru Prasad <guru.prasad@broadcom.com>, Juan Quintela <quintela@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 16, 2021 at 8:50 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/3/16 =E4=B8=8A=E5=8D=883:48, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > It reports the shadow virtqueue address from qemu virtual address space
>
>
> Note that to be used by vDPA, we can't use qemu VA directly here.
>

Right, I'm planning to use a different virtual address space if the
device has such limitations.

>
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.h |  2 ++
> >   hw/virtio/vhost-shadow-virtqueue.c | 24 +++++++++++++++++++++++-
> >   2 files changed, 25 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index 2ca4b92b12..d82c35bccf 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -19,6 +19,8 @@ typedef struct VhostShadowVirtqueue VhostShadowVirtqu=
eue;
> >
> >   void vhost_shadow_vq_mask(VhostShadowVirtqueue *svq, EventNotifier *m=
asked);
> >   void vhost_shadow_vq_unmask(VhostShadowVirtqueue *svq);
> > +void vhost_shadow_vq_get_vring_addr(const VhostShadowVirtqueue *svq,
> > +                                    struct vhost_vring_addr *addr);
> >
> >   bool vhost_shadow_vq_start(struct vhost_dev *dev,
> >                              unsigned idx,
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index b6bab438d6..1460d1d5d1 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -17,6 +17,9 @@
> >
> >   /* Shadow virtqueue to relay notifications */
> >   typedef struct VhostShadowVirtqueue {
> > +    /* Shadow vring */
> > +    struct vring vring;
> > +
> >       /* Shadow kick notifier, sent to vhost */
> >       EventNotifier kick_notifier;
> >       /* Shadow call notifier, sent to vhost */
> > @@ -51,6 +54,9 @@ typedef struct VhostShadowVirtqueue {
> >
> >       /* Virtio device */
> >       VirtIODevice *vdev;
> > +
> > +    /* Descriptors copied from guest */
> > +    vring_desc_t descs[];
> >   } VhostShadowVirtqueue;
> >
> >   /* Forward guest notifications */
> > @@ -132,6 +138,19 @@ void vhost_shadow_vq_unmask(VhostShadowVirtqueue *=
svq)
> >       qemu_event_wait(&svq->masked_notifier.is_free);
> >   }
> >
> > +/*
> > + * Get the shadow vq vring address.
> > + * @svq Shadow virtqueue
> > + * @addr Destination to store address
> > + */
> > +void vhost_shadow_vq_get_vring_addr(const VhostShadowVirtqueue *svq,
> > +                                    struct vhost_vring_addr *addr)
> > +{
> > +    addr->desc_user_addr =3D (uint64_t)svq->vring.desc;
> > +    addr->avail_user_addr =3D (uint64_t)svq->vring.avail;
> > +    addr->used_user_addr =3D (uint64_t)svq->vring.used;
> > +}
> > +
> >   /*
> >    * Restore the vhost guest to host notifier, i.e., disables svq effec=
t.
> >    */
> > @@ -262,7 +281,9 @@ void vhost_shadow_vq_stop(struct vhost_dev *dev,
> >   VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int =
idx)
> >   {
> >       int vq_idx =3D dev->vq_index + idx;
> > -    g_autofree VhostShadowVirtqueue *svq =3D g_new0(VhostShadowVirtque=
ue, 1);
> > +    unsigned num =3D virtio_queue_get_num(dev->vdev, vq_idx);
> > +    size_t ring_size =3D vring_size(num, VRING_DESC_ALIGN_SIZE);
> > +    g_autofree VhostShadowVirtqueue *svq =3D g_malloc0(sizeof(*svq) + =
ring_size);
> >       int r;
> >
> >       r =3D event_notifier_init(&svq->kick_notifier, 0);
> > @@ -279,6 +300,7 @@ VhostShadowVirtqueue *vhost_shadow_vq_new(struct vh=
ost_dev *dev, int idx)
> >           goto err_init_call_notifier;
> >       }
> >
> > +    vring_init(&svq->vring, num, svq->descs, VRING_DESC_ALIGN_SIZE);
>
>
> We had some dicussion in the past. Exporting vring_init() is wrong but
> too late to fix (assumes a legacy split layout). Let's not depend on
> this buggy uAPI.
>

Ok, I will change the way to allocate and initialize it.

> Thanks
>
>
> >       svq->vq =3D virtio_get_queue(dev->vdev, vq_idx);
> >       svq->vdev =3D dev->vdev;
> >       event_notifier_set_handler(&svq->call_notifier,
>


