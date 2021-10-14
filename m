Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E97542DD91
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 17:07:49 +0200 (CEST)
Received: from localhost ([::1]:49492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb2Kh-0000rQ-SL
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 11:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mb2H9-0007nF-MP
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:04:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mb2H3-0007Ug-Lk
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:04:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634223839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lxx2ipYXEwpCKLVbyrXlQhgxwck1tkVBOA2l23IErIc=;
 b=ZotwTBGE6nVNS+uhfwkSiBE5XEvKfsy62SZc6DK6ebiUEle08qaIE92O5JKmciCVbW6XwD
 FgDs+XdqNqSZR3QzCndCzgGb30maQ9qsgPkyiy/BXisST6PNzPBwxB1Ky7oKIPxkjgRLEo
 22P0m4KIFKdNHeUA7N0Or5rykY6YLj0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-jTFXlUQ-N9WpyJIkK2TnlA-1; Thu, 14 Oct 2021 11:03:56 -0400
X-MC-Unique: jTFXlUQ-N9WpyJIkK2TnlA-1
Received: by mail-qk1-f200.google.com with SMTP id
 c14-20020a37e10e000000b0045f3f44539eso4656271qkm.14
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 08:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Lxx2ipYXEwpCKLVbyrXlQhgxwck1tkVBOA2l23IErIc=;
 b=WVVTNlKvDhNETlW4AkIlcf7+qMnnz6DoRz4blPw0xToDS5IoIazuIYjJ0fiOinm2W9
 dD+E+/S/qYzbTy8VmaK4KVFJBwNRZCUz4S8MT9oHUQJoOxYe/OFs7Rf8hUQn3uhJxOUj
 qyApv1RdW23zid5r4WNcsnak2tAmWkNc3XuHBrac6zj3278mT+SS1S892XBqjtbSZhTP
 fGeqK4zDhICaJx7EVBhPkYpAakaal8ruMVRww4B51cO8Q2WUjrlH7Clmm+4ayDkak2qo
 OsJmPToGhuKLADQnJI7bWc6DQMQJNkXM6nmnDIzW0S/3iDhQq+tadza64FhDCaxyGwRz
 8SBg==
X-Gm-Message-State: AOAM530vOUOruRUWUkUFI1po8MtiLkzXWiIIBE9i0HeXZWCC3CMS5FCN
 jwDg2hezpGvHs74+4NP0tvOoAdPKE968JUeQ+K5EDxh7U8GO2XiXheyyi/fkFNdYQQ+AX5w0GpY
 mGi0eD2a+HRJOD90oQAqi3p4jd7SxR5w=
X-Received: by 2002:ac8:5f90:: with SMTP id j16mr7233566qta.175.1634223836161; 
 Thu, 14 Oct 2021 08:03:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOXUrxXo6q7LjPR7HaJms0uWJ/ZpW6lrfMNIvXzo8b8NYNTTe7LeZCXjhtLtO2aup1ozI+sgJWqGEaXug2G28=
X-Received: by 2002:ac8:5f90:: with SMTP id j16mr7233523qta.175.1634223835919; 
 Thu, 14 Oct 2021 08:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-14-eperezma@redhat.com>
 <37bddd4a-eeae-33c3-45f5-3d9070a25513@redhat.com>
In-Reply-To: <37bddd4a-eeae-33c3-45f5-3d9070a25513@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 14 Oct 2021 17:03:19 +0200
Message-ID: <CAJaqyWe+_=X6QuttGJgm3rkZHXCCgff51duezYTDxfhmi4MUPQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 13/20] vdpa: Save host and guest features
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
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 5:57 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:05, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > Those are needed for SVQ: Host ones are needed to check if SVQ knows
> > how to talk with the device and for feature negotiation, and guest ones
> > to know if SVQ can talk with it.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   include/hw/virtio/vhost-vdpa.h |  2 ++
> >   hw/virtio/vhost-vdpa.c         | 31 ++++++++++++++++++++++++++++---
> >   2 files changed, 30 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-v=
dpa.h
> > index fddac248b3..9044ae694b 100644
> > --- a/include/hw/virtio/vhost-vdpa.h
> > +++ b/include/hw/virtio/vhost-vdpa.h
> > @@ -26,6 +26,8 @@ typedef struct vhost_vdpa {
> >       int device_fd;
> >       uint32_t msg_type;
> >       MemoryListener listener;
> > +    uint64_t host_features;
> > +    uint64_t guest_features;
>
>
> Any reason that we can't use the features stored in VirtioDevice?
>
> Thanks
>

It was easier to handle the non standard _F_STOP feature flag in
vhost-vdpa but I think we can use VirtIODevice flags for the next
series.

Thanks!

>
> >       bool shadow_vqs_enabled;
> >       GPtrArray *shadow_vqs;
> >       struct vhost_dev *dev;
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 6c5f4c98b8..a057e8277d 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -439,10 +439,19 @@ static int vhost_vdpa_set_mem_table(struct vhost_=
dev *dev,
> >       return 0;
> >   }
> >
> > -static int vhost_vdpa_set_features(struct vhost_dev *dev,
> > -                                   uint64_t features)
> > +/**
> > + * Internal set_features() that follows vhost/VirtIO protocol for that
> > + */
> > +static int vhost_vdpa_backend_set_features(struct vhost_dev *dev,
> > +                                           uint64_t features)
> >   {
> > +    struct vhost_vdpa *v =3D dev->opaque;
> > +
> >       int ret;
> > +    if (v->host_features & BIT_ULL(VIRTIO_F_QUEUE_STATE)) {
> > +        features |=3D BIT_ULL(VIRTIO_F_QUEUE_STATE);
> > +    }
> > +
> >       trace_vhost_vdpa_set_features(dev, features);
> >       ret =3D vhost_vdpa_call(dev, VHOST_SET_FEATURES, &features);
> >       uint8_t status =3D 0;
> > @@ -455,6 +464,17 @@ static int vhost_vdpa_set_features(struct vhost_de=
v *dev,
> >       return !(status & VIRTIO_CONFIG_S_FEATURES_OK);
> >   }
> >
> > +/**
> > + * Exposed vhost set features
> > + */
> > +static int vhost_vdpa_set_features(struct vhost_dev *dev,
> > +                                   uint64_t features)
> > +{
> > +    struct vhost_vdpa *v =3D dev->opaque;
> > +    v->guest_features =3D features;
> > +    return vhost_vdpa_backend_set_features(dev, features);
> > +}
> > +
> >   static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
> >   {
> >       uint64_t features;
> > @@ -673,12 +693,17 @@ static int vhost_vdpa_set_vring_call(struct vhost=
_dev *dev,
> >   }
> >
> >   static int vhost_vdpa_get_features(struct vhost_dev *dev,
> > -                                     uint64_t *features)
> > +                                   uint64_t *features)
> >   {
> >       int ret;
> >
> >       ret =3D vhost_vdpa_call(dev, VHOST_GET_FEATURES, features);
> >       trace_vhost_vdpa_get_features(dev, *features);
> > +
> > +    if (ret =3D=3D 0) {
> > +        struct vhost_vdpa *v =3D dev->opaque;
> > +        v->host_features =3D *features;
> > +    }
> >       return ret;
> >   }
> >
>


