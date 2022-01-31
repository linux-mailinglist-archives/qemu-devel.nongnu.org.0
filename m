Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ECD4A4BC3
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 17:21:44 +0100 (CET)
Received: from localhost ([::1]:49820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEZR1-0004Qy-U4
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 11:21:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nEYwJ-0004nr-6L
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 10:50:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nEYwG-0002fR-Pb
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 10:49:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643644195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8DJRM83NtrGkmFO2N0v+PIszj0WppHGGQNE5laxRt1I=;
 b=dCJkbXYw4ZjR5NwvzXXtiddMaN9zjDhTpgipozva+zOZthC6s3ylCnyRDjlQxWZoo/0Zy5
 EMUZqrSBVzE4QS+ZaJTdt+26QxGb8hfXN6WAWYv0JeyyO1UR3hnnNE0ZFrO116N4z3VevI
 6aPd5aZ14dBbCySozxSEUHlL0hfROmk=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-3sxgyHZfNbmlgfJ1A8w8xQ-1; Mon, 31 Jan 2022 10:49:52 -0500
X-MC-Unique: 3sxgyHZfNbmlgfJ1A8w8xQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 x10-20020ac8700a000000b002c3ef8fc44cso10578466qtm.8
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 07:49:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8DJRM83NtrGkmFO2N0v+PIszj0WppHGGQNE5laxRt1I=;
 b=52UOGCSeVVJvM7WYzYf2QkaLU5Z23Rwd1qlJI51yPl5D1vQEis6NL7G3bV4OC42DgF
 EDksuRAACWs/Uc30rE+yGoU+kzXN+lLrETjlnJ6NC7JN1O87MMm5uwzufkK740KhVFP8
 kCmwKjKj7LhQWyaacXwjB2Lk/IOAEZ31FFIcKdiJMis0RtnBEgyrnMsrytKySxmEhCIs
 gRXwFDgB5n4RiCI9SejK7wBV00OwVwBHVT3UMDwpIUS3Uh7vpwpMad2e5eEqUKWqL/gX
 FfhbVL1/ekLG6xSVOtOlrPtS+rEpzLdVDnkho9nCmLVSBsqF0ycQkyRUbukTZZAbucPw
 IPPA==
X-Gm-Message-State: AOAM53392YnQ6LWL0Qcu68iSfI6tgsVO0prlT7Qrd+3rLvWPSZv3v3LK
 xzlCkNIBWf4kn/49DNr+9oR3gb3aki6RGl6Qc4H/uFgPM3gs8K8PToh4vFS2C2ZI9fkFtEJUg25
 ZFkrLMsoRyffWyU8bUzZbF1uznMiYsHU=
X-Received: by 2002:a05:622a:215:: with SMTP id
 b21mr15252640qtx.199.1643644191767; 
 Mon, 31 Jan 2022 07:49:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypAVOujwCAFAi6QUU+20GVpZI7kPrUKTzlwyepE8e4SpXOSjzYkql3x8iGYe4MLPmVvryHW/LJqDvINCmbzOc=
X-Received: by 2002:a05:622a:215:: with SMTP id
 b21mr15252621qtx.199.1643644191381; 
 Mon, 31 Jan 2022 07:49:51 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-12-eperezma@redhat.com>
 <660257ba-6445-3fb2-1da4-3b141e382191@redhat.com>
In-Reply-To: <660257ba-6445-3fb2-1da4-3b141e382191@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 31 Jan 2022 16:49:15 +0100
Message-ID: <CAJaqyWfaf0RG9AzW4ktH2L3wyfOGuSk=rNm-j7xRkpdfVvkY-g@mail.gmail.com>
Subject: Re: [PATCH 11/31] vhost: Add vhost_svq_valid_device_features to
 shadow vq
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

On Sat, Jan 29, 2022 at 9:11 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > This allows SVQ to negotiate features with the device. For the device,
> > SVQ is a driver. While this function needs to bypass all non-transport
> > features, it needs to disable the features that SVQ does not support
> > when forwarding buffers. This includes packed vq layout, indirect
> > descriptors or event idx.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.h |  2 ++
> >   hw/virtio/vhost-shadow-virtqueue.c | 44 +++++++++++++++++++++++++++++=
+
> >   hw/virtio/vhost-vdpa.c             | 21 ++++++++++++++
> >   3 files changed, 67 insertions(+)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index c9ffa11fce..d963867a04 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -15,6 +15,8 @@
> >
> >   typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> >
> > +bool vhost_svq_valid_device_features(uint64_t *features);
> > +
> >   void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kic=
k_fd);
> >   void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq, int=
 call_fd);
> >   const EventNotifier *vhost_svq_get_dev_kick_notifier(
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 9619c8082c..51442b3dbf 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -45,6 +45,50 @@ const EventNotifier *vhost_svq_get_dev_kick_notifier=
(
> >       return &svq->hdev_kick;
> >   }
> >
> > +/**
> > + * Validate the transport device features that SVQ can use with the de=
vice
> > + *
> > + * @dev_features  The device features. If success, the acknowledged fe=
atures.
> > + *
> > + * Returns true if SVQ can go with a subset of these, false otherwise.
> > + */
> > +bool vhost_svq_valid_device_features(uint64_t *dev_features)
> > +{
> > +    bool r =3D true;
> > +
> > +    for (uint64_t b =3D VIRTIO_TRANSPORT_F_START; b <=3D VIRTIO_TRANSP=
ORT_F_END;
> > +         ++b) {
> > +        switch (b) {
> > +        case VIRTIO_F_NOTIFY_ON_EMPTY:
> > +        case VIRTIO_F_ANY_LAYOUT:
> > +            continue;
> > +
> > +        case VIRTIO_F_ACCESS_PLATFORM:
> > +            /* SVQ does not know how to translate addresses */
>
>
> I may miss something but any reason that we need to disable
> ACCESS_PLATFORM? I'd expect the vring helper we used for shadow
> virtqueue can deal with vIOMMU perfectly.
>

This function is validating SVQ <-> Device communications features,
that may or may not be the same as guest <-> SVQ. These feature flags
are valid for guest <-> SVQ communication, same as with indirect
descriptors one.

Having said that, there is a point in the series where
VIRTIO_F_ACCESS_PLATFORM is actually mandatory, so I think we could
use the latter addition of x-svq cmdline parameter and delay the
feature validations where it makes more sense.

>
> > +            if (*dev_features & BIT_ULL(b)) {
> > +                clear_bit(b, dev_features);
> > +                r =3D false;
> > +            }
> > +            break;
> > +
> > +        case VIRTIO_F_VERSION_1:
>
>
> I had the same question here.
>

For VERSION_1 it's easier to assume that guest is little endian at
some points, but we could try harder to support both endianness if
needed.

Thanks!

> Thanks
>
>
> > +            /* SVQ trust that guest vring is little endian */
> > +            if (!(*dev_features & BIT_ULL(b))) {
> > +                set_bit(b, dev_features);
> > +                r =3D false;
> > +            }
> > +            continue;
> > +
> > +        default:
> > +            if (*dev_features & BIT_ULL(b)) {
> > +                clear_bit(b, dev_features);
> > +            }
> > +        }
> > +    }
> > +
> > +    return r;
> > +}
> > +
> >   /* Forward guest notifications */
> >   static void vhost_handle_guest_kick(EventNotifier *n)
> >   {
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index bdb45c8808..9d801cf907 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -855,10 +855,31 @@ static int vhost_vdpa_init_svq(struct vhost_dev *=
hdev, struct vhost_vdpa *v,
> >       size_t n_svqs =3D v->shadow_vqs_enabled ? hdev->nvqs : 0;
> >       g_autoptr(GPtrArray) shadow_vqs =3D g_ptr_array_new_full(n_svqs,
> >                                                              vhost_psvq=
_free);
> > +    uint64_t dev_features;
> > +    uint64_t svq_features;
> > +    int r;
> > +    bool ok;
> > +
> >       if (!v->shadow_vqs_enabled) {
> >           goto out;
> >       }
> >
> > +    r =3D vhost_vdpa_get_features(hdev, &dev_features);
> > +    if (r !=3D 0) {
> > +        error_setg(errp, "Can't get vdpa device features, got (%d)", r=
);
> > +        return r;
> > +    }
> > +
> > +    svq_features =3D dev_features;
> > +    ok =3D vhost_svq_valid_device_features(&svq_features);
> > +    if (unlikely(!ok)) {
> > +        error_setg(errp,
> > +            "SVQ Invalid device feature flags, offer: 0x%"PRIx64", ok:=
 0x%"PRIx64,
> > +            hdev->features, svq_features);
> > +        return -1;
> > +    }
> > +
> > +    shadow_vqs =3D g_ptr_array_new_full(hdev->nvqs, vhost_psvq_free);
> >       for (unsigned n =3D 0; n < hdev->nvqs; ++n) {
> >           VhostShadowVirtqueue *svq =3D vhost_svq_new();
> >
>


