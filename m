Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DA64A5AD8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:05:29 +0100 (CET)
Received: from localhost ([::1]:47718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEqyW-0004ky-Ok
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:05:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nEqre-0007jv-Hv
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 05:58:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nEqrb-0001En-Gd
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 05:58:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643713098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xns20/UETCM+FX4CQ3wFAQiIr0z8uMxx3FEZVnl+6GA=;
 b=MxvBd8GxSFSZ6Q7MFlBlBpVXhwQ2EMARgisrib6tbCcKGkrDmm948t5BERwfW8+Qg5z1GZ
 RTzJpMycZS7urU1OV+A5pA8SkdHMWjKj5KF5jiQ05lR0aG1YUF6h/HwKAeZLc1xq/jB5oa
 ECMXR7m5P+jAaXRqn4InsOrQecBUrOM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-xMMo2_4sMLWpca9p3cvFQA-1; Tue, 01 Feb 2022 05:58:17 -0500
X-MC-Unique: xMMo2_4sMLWpca9p3cvFQA-1
Received: by mail-qt1-f199.google.com with SMTP id
 e14-20020ac84b4e000000b002cfbbdf8206so12643320qts.10
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 02:58:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Xns20/UETCM+FX4CQ3wFAQiIr0z8uMxx3FEZVnl+6GA=;
 b=6V5dVgzGinuYzRTzsRiJsQsua4/kzCSEVfGby2zQb7THeXeoFmjn1Ld7h9jYm5iQtc
 fjtLrCYZS3oQM3RXRBd3T0uTg1tPUekn2g6nQSUjUBA0F4xfkBga/6YYl9oucKVQ3Twx
 dRk1/cEITvnTlx9nd9uwr+PHRfWU+B6GRJbiAFOiS//SR7hKHx3hlPPsoaHpx/4nj20N
 E0RF3CKpF1ZXKwbU9IYt6YpsD98F7PaoTJfpn9Xc/coOcF7YSVWZeDAxSwkMBRyn7Fw1
 D8bwwf+gBFKA/SMZ84UGbh7oN5yjcqWqVRCORKUJb11NvZLjTztQANMmTEqbkdiSZaLv
 qdig==
X-Gm-Message-State: AOAM5317ddjf1YspsE78PY0gMd63mhiCBsgAgBmF+IsnxKWDXfitoRY2
 wJYySYCio7IDLm2dkgVwIZiKtrx897CO1K5lMnu/tw4NJ7GGycP156GiFmRueUoRhjrhatZ/PYW
 HgPXjGUEgAuh9jsNUAiswqHWO2kC2LPM=
X-Received: by 2002:a05:622a:1350:: with SMTP id
 w16mr18165373qtk.320.1643713097149; 
 Tue, 01 Feb 2022 02:58:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUq3cpZujk1YKDNqwrWiq1qL8tCZYLGWEEfSjvblZNxTNApXxrfTRg0XuIpQpAJJBmQ7Zh+aVLqQ6rJ1O4JJM=
X-Received: by 2002:a05:622a:1350:: with SMTP id
 w16mr18165339qtk.320.1643713096825; 
 Tue, 01 Feb 2022 02:58:16 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-12-eperezma@redhat.com>
 <660257ba-6445-3fb2-1da4-3b141e382191@redhat.com>
 <CAJaqyWfaf0RG9AzW4ktH2L3wyfOGuSk=rNm-j7xRkpdfVvkY-g@mail.gmail.com>
In-Reply-To: <CAJaqyWfaf0RG9AzW4ktH2L3wyfOGuSk=rNm-j7xRkpdfVvkY-g@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 1 Feb 2022 11:57:40 +0100
Message-ID: <CAJaqyWc6BqJBDcUE36AQ=bgWjJYkyMo1ZYxRwmc5ZgGj4T-pVg@mail.gmail.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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

On Mon, Jan 31, 2022 at 4:49 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Sat, Jan 29, 2022 at 9:11 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =E5=86=
=99=E9=81=93:
> > > This allows SVQ to negotiate features with the device. For the device=
,
> > > SVQ is a driver. While this function needs to bypass all non-transpor=
t
> > > features, it needs to disable the features that SVQ does not support
> > > when forwarding buffers. This includes packed vq layout, indirect
> > > descriptors or event idx.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >   hw/virtio/vhost-shadow-virtqueue.h |  2 ++
> > >   hw/virtio/vhost-shadow-virtqueue.c | 44 +++++++++++++++++++++++++++=
+++
> > >   hw/virtio/vhost-vdpa.c             | 21 ++++++++++++++
> > >   3 files changed, 67 insertions(+)
> > >
> > > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-sha=
dow-virtqueue.h
> > > index c9ffa11fce..d963867a04 100644
> > > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > > @@ -15,6 +15,8 @@
> > >
> > >   typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> > >
> > > +bool vhost_svq_valid_device_features(uint64_t *features);
> > > +
> > >   void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_k=
ick_fd);
> > >   void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq, i=
nt call_fd);
> > >   const EventNotifier *vhost_svq_get_dev_kick_notifier(
> > > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-sha=
dow-virtqueue.c
> > > index 9619c8082c..51442b3dbf 100644
> > > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > > @@ -45,6 +45,50 @@ const EventNotifier *vhost_svq_get_dev_kick_notifi=
er(
> > >       return &svq->hdev_kick;
> > >   }
> > >
> > > +/**
> > > + * Validate the transport device features that SVQ can use with the =
device
> > > + *
> > > + * @dev_features  The device features. If success, the acknowledged =
features.
> > > + *
> > > + * Returns true if SVQ can go with a subset of these, false otherwis=
e.
> > > + */
> > > +bool vhost_svq_valid_device_features(uint64_t *dev_features)
> > > +{
> > > +    bool r =3D true;
> > > +
> > > +    for (uint64_t b =3D VIRTIO_TRANSPORT_F_START; b <=3D VIRTIO_TRAN=
SPORT_F_END;
> > > +         ++b) {
> > > +        switch (b) {
> > > +        case VIRTIO_F_NOTIFY_ON_EMPTY:
> > > +        case VIRTIO_F_ANY_LAYOUT:
> > > +            continue;
> > > +
> > > +        case VIRTIO_F_ACCESS_PLATFORM:
> > > +            /* SVQ does not know how to translate addresses */
> >
> >
> > I may miss something but any reason that we need to disable
> > ACCESS_PLATFORM? I'd expect the vring helper we used for shadow
> > virtqueue can deal with vIOMMU perfectly.
> >
>
> This function is validating SVQ <-> Device communications features,
> that may or may not be the same as guest <-> SVQ. These feature flags
> are valid for guest <-> SVQ communication, same as with indirect
> descriptors one.
>
> Having said that, there is a point in the series where
> VIRTIO_F_ACCESS_PLATFORM is actually mandatory, so I think we could
> use the latter addition of x-svq cmdline parameter and delay the
> feature validations where it makes more sense.
>
> >
> > > +            if (*dev_features & BIT_ULL(b)) {
> > > +                clear_bit(b, dev_features);
> > > +                r =3D false;
> > > +            }
> > > +            break;
> > > +
> > > +        case VIRTIO_F_VERSION_1:
> >
> >
> > I had the same question here.
> >
>
> For VERSION_1 it's easier to assume that guest is little endian at
> some points, but we could try harder to support both endianness if
> needed.
>

Re-thinking the SVQ feature isolation stuff for this first iteration
based on your comments.

Maybe it's easier to simply fail if the device does not *match* the
expected feature set, and add all of the "feature isolation" later.
While a lot of guest <-> SVQ communication details are already solved
for free with qemu's VirtQueue (indirect, packed, ...), we may
simplify this series in particular and add the support for it later.

For example, at this moment would be valid for the device to export
indirect descriptors feature flag, and SVQ simply forward that feature
flag offering to the guest. So the guest <-> SVQ communication could
have indirect descriptors (qemu's VirtQueue code handles it for free),
but SVQ would not acknowledge it for the device. As a side note, to
negotiate it would have been harmless actually, but it's not the case
of packed vq.

So maybe for the v2 we can simply force the device to just export the
strictly needed features and nothing else with qemu cmdline, and then
enable the feature negotiation isolation for each side of SVQ?

Thanks!


> Thanks!
>
> > Thanks
> >
> >
> > > +            /* SVQ trust that guest vring is little endian */
> > > +            if (!(*dev_features & BIT_ULL(b))) {
> > > +                set_bit(b, dev_features);
> > > +                r =3D false;
> > > +            }
> > > +            continue;
> > > +
> > > +        default:
> > > +            if (*dev_features & BIT_ULL(b)) {
> > > +                clear_bit(b, dev_features);
> > > +            }
> > > +        }
> > > +    }
> > > +
> > > +    return r;
> > > +}
> > > +
> > >   /* Forward guest notifications */
> > >   static void vhost_handle_guest_kick(EventNotifier *n)
> > >   {
> > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > index bdb45c8808..9d801cf907 100644
> > > --- a/hw/virtio/vhost-vdpa.c
> > > +++ b/hw/virtio/vhost-vdpa.c
> > > @@ -855,10 +855,31 @@ static int vhost_vdpa_init_svq(struct vhost_dev=
 *hdev, struct vhost_vdpa *v,
> > >       size_t n_svqs =3D v->shadow_vqs_enabled ? hdev->nvqs : 0;
> > >       g_autoptr(GPtrArray) shadow_vqs =3D g_ptr_array_new_full(n_svqs=
,
> > >                                                              vhost_ps=
vq_free);
> > > +    uint64_t dev_features;
> > > +    uint64_t svq_features;
> > > +    int r;
> > > +    bool ok;
> > > +
> > >       if (!v->shadow_vqs_enabled) {
> > >           goto out;
> > >       }
> > >
> > > +    r =3D vhost_vdpa_get_features(hdev, &dev_features);
> > > +    if (r !=3D 0) {
> > > +        error_setg(errp, "Can't get vdpa device features, got (%d)",=
 r);
> > > +        return r;
> > > +    }
> > > +
> > > +    svq_features =3D dev_features;
> > > +    ok =3D vhost_svq_valid_device_features(&svq_features);
> > > +    if (unlikely(!ok)) {
> > > +        error_setg(errp,
> > > +            "SVQ Invalid device feature flags, offer: 0x%"PRIx64", o=
k: 0x%"PRIx64,
> > > +            hdev->features, svq_features);
> > > +        return -1;
> > > +    }
> > > +
> > > +    shadow_vqs =3D g_ptr_array_new_full(hdev->nvqs, vhost_psvq_free)=
;
> > >       for (unsigned n =3D 0; n < hdev->nvqs; ++n) {
> > >           VhostShadowVirtqueue *svq =3D vhost_svq_new();
> > >
> >


