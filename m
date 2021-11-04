Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1696444D51
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 03:33:34 +0100 (CET)
Received: from localhost ([::1]:60710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miSZJ-0008Ps-Et
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 22:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1miSXF-0007VZ-Mj
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 22:31:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1miSXB-0003q8-Ua
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 22:31:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635993079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NcNKgPAdotlma+SzbiL53/k1dV5NpFo2xKriZncoGG8=;
 b=XNvYjFyoe6XvkL2TDTGoW8UPfqToKyzGKeG9eTNDujegB0ZSd6jDB+BeuIvEoRUdPkEtgk
 SuIhdyTiq2I9G1+VmGIPvfMM4NU/T7e7/S1OlVcM/qUag/pXXcL7zFOrthRE9BfzI7AstR
 3kkm1o0FalMrG8yzX/zbWM2JPgPtuPg=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-5yGEkdciPjGZkjboD8w-yg-1; Wed, 03 Nov 2021 22:31:18 -0400
X-MC-Unique: 5yGEkdciPjGZkjboD8w-yg-1
Received: by mail-lf1-f72.google.com with SMTP id
 j11-20020a056512398b00b004016f3be72fso1322601lfu.15
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 19:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NcNKgPAdotlma+SzbiL53/k1dV5NpFo2xKriZncoGG8=;
 b=Or6uER1ciloZS+M83adKChLIj0gdHNaKol3+po3Y9hb8XUf0/TyQwU0GWzhiScU50g
 QguYzv7066sSTGdoJaB0cC5Hi7N/jglcHwxV5hBk+LIKiTqvH72xk1AV0d6xe/stVvLm
 mDloHvpW8NTM92rhfGLy8LV4x6oHs1+Kp7oHLecwdfGb2bsX/q7MJvYAXPNVEk5EVwCc
 oB1IQfSq33Q0fqyXcUYTqv6Hw40uZxXnyPFiWosCy6i92NTjbaUDvolvIE18EB3/mlr8
 yfDh0JSK794rTIlMR9720WPbYBZwNkrQkEz2dQ/c78zhdtzxtai/+Ni6AooX9v2llL+p
 gNMQ==
X-Gm-Message-State: AOAM531l3AY1XA/3ndNiLZ0bwC1TaQAU/nN4kdbyqRCaKNrkehSiPJJi
 +pzkq4myxisr9UUyanuciFSEiW0fVbsHNmE2Qz2/Aay0nWPWkVcaqpm1ODNtl9J/67+3dDVDrre
 3g00HQ2DNC1FSf+9g15qGDMeuV6UxPv0=
X-Received: by 2002:a05:6512:32c1:: with SMTP id
 f1mr45935293lfg.498.1635993076436; 
 Wed, 03 Nov 2021 19:31:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwpEZwopt/FLpSd93uaD8FQ8BeiJJ3BLvKAmk9tr1ED8T3ahFDV7Us6tZiLiBradYvwHPdQAg8wBwYgGnbRFs=
X-Received: by 2002:a05:6512:32c1:: with SMTP id
 f1mr45935246lfg.498.1635993076043; 
 Wed, 03 Nov 2021 19:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211029183525.1776416-1-eperezma@redhat.com>
 <20211029183525.1776416-12-eperezma@redhat.com>
 <74dbf70f-96a7-6fe3-dbc5-28a7b7989109@redhat.com>
 <CAJaqyWe56+wzXgdQp4nbGxhrSU4tPU+SkgTBUa=wSB5nSbtwuw@mail.gmail.com>
 <CACGkMEvOxUMo1WA4tUfDhw+FOJVW87JJGPw=U3JvUSQTU_ogWQ@mail.gmail.com>
 <CAJaqyWd4DQwRSL5StCft+3-uq12TW5x1o4DN_YW97D0JzOr2XQ@mail.gmail.com>
In-Reply-To: <CAJaqyWd4DQwRSL5StCft+3-uq12TW5x1o4DN_YW97D0JzOr2XQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 4 Nov 2021 10:31:05 +0800
Message-ID: <CACGkMEvXBHfgx+Vy-wjgHb_SYXAe1XOxp5NZPCkU06whXBHTmw@mail.gmail.com>
Subject: Re: [RFC PATCH v5 11/26] vhost: Handle host notifiers in SVQ
To: Eugenio Perez Martin <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Xiao W Wang <xiao.w.wang@intel.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Parav Pandit <parav@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 3, 2021 at 3:40 PM Eugenio Perez Martin <eperezma@redhat.com> w=
rote:
>
> On Wed, Nov 3, 2021 at 3:56 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Tue, Nov 2, 2021 at 4:47 PM Eugenio Perez Martin <eperezma@redhat.co=
m> wrote:
> > >
> > > On Tue, Nov 2, 2021 at 8:55 AM Jason Wang <jasowang@redhat.com> wrote=
:
> > > >
> > > >
> > > > =E5=9C=A8 2021/10/30 =E4=B8=8A=E5=8D=882:35, Eugenio P=C3=A9rez =E5=
=86=99=E9=81=93:
> > > > > If device supports host notifiers, this makes one jump less (kern=
el) to
> > > > > deliver SVQ notifications to it.
> > > > >
> > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > ---
> > > > >   hw/virtio/vhost-shadow-virtqueue.h |  2 ++
> > > > >   hw/virtio/vhost-shadow-virtqueue.c | 23 ++++++++++++++++++++++-
> > > > >   2 files changed, 24 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost=
-shadow-virtqueue.h
> > > > > index 30ab9643b9..eb0a54f954 100644
> > > > > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > > > > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > > > > @@ -18,6 +18,8 @@ typedef struct VhostShadowVirtqueue VhostShadow=
Virtqueue;
> > > > >   void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int s=
vq_kick_fd);
> > > > >   const EventNotifier *vhost_svq_get_dev_kick_notifier(
> > > > >                                                 const VhostShadow=
Virtqueue *svq);
> > > > > +void vhost_svq_set_host_mr_notifier(VhostShadowVirtqueue *svq, v=
oid *addr);
> > > > > +
> > > > >   void vhost_svq_start(struct vhost_dev *dev, unsigned idx,
> > > > >                        VhostShadowVirtqueue *svq, int svq_kick_fd=
);
> > > > >   void vhost_svq_stop(struct vhost_dev *dev, unsigned idx,
> > > > > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost=
-shadow-virtqueue.c
> > > > > index fda60d11db..e3dcc039b6 100644
> > > > > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > > > > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > > > > @@ -29,6 +29,12 @@ typedef struct VhostShadowVirtqueue {
> > > > >        * So shadow virtqueue must not clean it, or we would lose =
VirtQueue one.
> > > > >        */
> > > > >       EventNotifier svq_kick;
> > > > > +
> > > > > +    /* Device's host notifier memory region. NULL means no regio=
n */
> > > > > +    void *host_notifier_mr;
> > > > > +
> > > > > +    /* Virtio queue shadowing */
> > > > > +    VirtQueue *vq;
> > > > >   } VhostShadowVirtqueue;
> > > > >
> > > > >   /**
> > > > > @@ -50,7 +56,20 @@ static void vhost_handle_guest_kick(EventNotif=
ier *n)
> > > > >           return;
> > > > >       }
> > > > >
> > > > > -    event_notifier_set(&svq->hdev_kick);
> > > > > +    if (svq->host_notifier_mr) {
> > > > > +        uint16_t *mr =3D svq->host_notifier_mr;
> > > > > +        *mr =3D virtio_get_queue_index(svq->vq);
> > > >
> > > >
> > > > Do we need barriers around the possible MMIO here?
> > >
> > > That's right, I missed them.
> > >
> > > >
> > > > To avoid those complicated stuff, I'd rather simply go with eventfd=
 path.
> > > >
> > > > Note mmio and eventfd are not mutually exclusive.
> > >
> > > Actually we cannot ignore them since they are set in the guest. If SV=
Q
> > > does nothing about them, the guest's notification will travel directl=
y
> > > to the vdpa device, and SVQ cannot intercept them.
> > >
> > > Taking that into account, it's actually less changes to move them to
> > > SVQ (like in this series) than to disable them (like in previous
> > > series). But we can go with disabling them for sure.
> >
> > I think we can simply disable the memory region for the doorbell, then
> > qemu/kvm will do all the rest for us.
> >
> > If we want to add barriers it would be a lot of architecture specific
> > instructions which looks like a burden for us to maintain in Qemu.
> >
> > So if we disable the memory region, KVM will fallback to the eventfd,
> > then qemu can intercept and we can simply relay it via kickfd. This
> > looks easier to maintain.
> >
> > Thanks
> >
>
> Any reason to go off-list? :).

Hit the wrong button:(

Adding the list back.

>
> I'm fine doing it that way, but it seems to me there must be a way
> since VFIO, UIO, etc would have the same issues. The worst case would
> be that these accesses are resolved through a syscall or similar. How
> does DPDK solve it?

I guess it should have per arch assemblies etc.

> Probably with specific asm as you say...

We can go this way, but to speed up the merging, I'd go with eventfd
first to avoid dependencies. And we can do that in the future as the
performance optimization.

Thanks

>
> Thanks!
>
>
> > >
> > > Thanks!
> > >
> > > >
> > > > Thanks
> > > >
> > > >
> > > > > +    } else {
> > > > > +        event_notifier_set(&svq->hdev_kick);
> > > > > +    }
> > > > > +}
> > > > > +
> > > > > +/*
> > > > > + * Set the device's memory region notifier. addr =3D NULL clear =
it.
> > > > > + */
> > > > > +void vhost_svq_set_host_mr_notifier(VhostShadowVirtqueue *svq, v=
oid *addr)
> > > > > +{
> > > > > +    svq->host_notifier_mr =3D addr;
> > > > >   }
> > > > >
> > > > >   /**
> > > > > @@ -134,6 +153,7 @@ void vhost_svq_stop(struct vhost_dev *dev, un=
signed idx,
> > > > >    */
> > > > >   VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int =
idx)
> > > > >   {
> > > > > +    int vq_idx =3D dev->vq_index + idx;
> > > > >       g_autofree VhostShadowVirtqueue *svq =3D g_new0(VhostShadow=
Virtqueue, 1);
> > > > >       int r;
> > > > >
> > > > > @@ -151,6 +171,7 @@ VhostShadowVirtqueue *vhost_svq_new(struct vh=
ost_dev *dev, int idx)
> > > > >           goto err_init_hdev_call;
> > > > >       }
> > > > >
> > > > > +    svq->vq =3D virtio_get_queue(dev->vdev, vq_idx);
> > > > >       return g_steal_pointer(&svq);
> > > > >
> > > > >   err_init_hdev_call:
> > > >
> > >
> >
>


