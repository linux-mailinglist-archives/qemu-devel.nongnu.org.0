Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C093E4B8D09
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 16:58:10 +0100 (CET)
Received: from localhost ([::1]:53700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKMgz-0003ks-N4
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 10:58:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nKMdX-0000j7-9j
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 10:54:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nKMdU-0003QX-30
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 10:54:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645026871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z8j4V46EWBrh6ISUR3/C7wdNrSvLW96P7p7GBArssMs=;
 b=K1ydlPj/+CuDrRbC8JcMzAZk5F4hn9R86FGtEpoYRnhmwnzPlc4cak6kNdhE+iBLvvCjyJ
 qDvbht9KqycrWDqytCmb8sk9s508yXgjR9+EayQH6Fi2pTbINvgYdxQL4WO9NJlkTm8yaW
 75jSONfNUBxP2ExLV06bw4TEbgA5dNA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-YN6u9ZsxNyiZ7UUFVyCMEQ-1; Wed, 16 Feb 2022 10:54:30 -0500
X-MC-Unique: YN6u9ZsxNyiZ7UUFVyCMEQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 k6-20020ad45be6000000b0042c82bd64deso2089043qvc.22
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 07:54:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Z8j4V46EWBrh6ISUR3/C7wdNrSvLW96P7p7GBArssMs=;
 b=hrP7uF5BqQwfwag4hZeJ+FLaK7iE4Tdlah8rHahdVy0ueZ3uDBub9CaUhi4y/e/bHq
 WlEQfkyefPI9fq1HvxfpnGZ/rEygYp7hThQ6ZRGRFixklfKSa+LZkNqa00JNZRELNCyB
 xqoEIiKSnvf13u7n8po5NEtN4sFU0Hj7KY6K5M5CoZOhyqbq+cPSY7ULU+EtOpAvclMr
 irH1oCvvbo9JM1XN7oiCI13myynybhWSZSLbqT9cX2IVjMgpFccIw0vh3sv8s5Tfz4Cf
 eyfjdw33dHwLi+qDyVcTlGUe6Ixu0FJ97yRwGVNkxn+cJQkolTLcLvteN6etYk1Rq63o
 cwrw==
X-Gm-Message-State: AOAM532DoXye+10yeHVzrZ7j7zESe43CMp2q1pmX/ANa72AyGs/mXail
 xQ00a0yO3GlWa8PUDzievtCUR0uyu3qPopiBv8If79aSecpqtWtW7Dhklqdfh9m8tk3072OoeRV
 F7zUDDwKY6kHZLMqGBCHI6MVVcW7ybyM=
X-Received: by 2002:a05:620a:743:b0:507:222c:c183 with SMTP id
 i3-20020a05620a074300b00507222cc183mr1588992qki.486.1645026869870; 
 Wed, 16 Feb 2022 07:54:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5omDyMr6QH/nkbCKuxgv4fh0LBlvFdHW+acJ3vV6/SasxGYAsfymr7UsvrpWOgrvp1yLiVOICF+cdXR8eEKc=
X-Received: by 2002:a05:620a:743:b0:507:222c:c183 with SMTP id
 i3-20020a05620a074300b00507222cc183mr1588976qki.486.1645026869617; Wed, 16
 Feb 2022 07:54:29 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-29-eperezma@redhat.com>
 <42664143-6d0c-b107-ec90-8e6336bae29b@redhat.com>
 <CAJaqyWdBLU+maEhByepzeH7iwLmqUba0rRb8PM4VwBy2P8Vtow@mail.gmail.com>
 <9b32f664-56a9-3718-cf48-49003f87d430@redhat.com>
In-Reply-To: <9b32f664-56a9-3718-cf48-49003f87d430@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 16 Feb 2022 16:53:53 +0100
Message-ID: <CAJaqyWcvWjPas0=xp+U-c-kG+e6k73jg=C4phFD7S-tZY=niSQ@mail.gmail.com>
Subject: Re: [PATCH 28/31] vdpa: Expose VHOST_F_LOG_ALL on SVQ
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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

On Tue, Feb 8, 2022 at 9:25 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/2/1 =E4=B8=8B=E5=8D=887:45, Eugenio Perez Martin =E5=86=99=
=E9=81=93:
> > On Sun, Jan 30, 2022 at 7:50 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =E5=86=
=99=E9=81=93:
> >>> SVQ is able to log the dirty bits by itself, so let's use it to not
> >>> block migration.
> >>>
> >>> Also, ignore set and clear of VHOST_F_LOG_ALL on set_features if SVQ =
is
> >>> enabled. Even if the device supports it, the reports would be nonsens=
e
> >>> because SVQ memory is in the qemu region.
> >>>
> >>> The log region is still allocated. Future changes might skip that, bu=
t
> >>> this series is already long enough.
> >>>
> >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>> ---
> >>>    hw/virtio/vhost-vdpa.c | 20 ++++++++++++++++++++
> >>>    1 file changed, 20 insertions(+)
> >>>
> >>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >>> index fb0a338baa..75090d65e8 100644
> >>> --- a/hw/virtio/vhost-vdpa.c
> >>> +++ b/hw/virtio/vhost-vdpa.c
> >>> @@ -1022,6 +1022,9 @@ static int vhost_vdpa_get_features(struct vhost=
_dev *dev, uint64_t *features)
> >>>        if (ret =3D=3D 0 && v->shadow_vqs_enabled) {
> >>>            /* Filter only features that SVQ can offer to guest */
> >>>            vhost_svq_valid_guest_features(features);
> >>> +
> >>> +        /* Add SVQ logging capabilities */
> >>> +        *features |=3D BIT_ULL(VHOST_F_LOG_ALL);
> >>>        }
> >>>
> >>>        return ret;
> >>> @@ -1039,8 +1042,25 @@ static int vhost_vdpa_set_features(struct vhos=
t_dev *dev,
> >>>
> >>>        if (v->shadow_vqs_enabled) {
> >>>            uint64_t dev_features, svq_features, acked_features;
> >>> +        uint8_t status =3D 0;
> >>>            bool ok;
> >>>
> >>> +        ret =3D vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status)=
;
> >>> +        if (unlikely(ret)) {
> >>> +            return ret;
> >>> +        }
> >>> +
> >>> +        if (status & VIRTIO_CONFIG_S_DRIVER_OK) {
> >>> +            /*
> >>> +             * vhost is trying to enable or disable _F_LOG, and the =
device
> >>> +             * would report wrong dirty pages. SVQ handles it.
> >>> +             */
> >>
> >> I fail to understand this comment, I'd think there's no way to disable
> >> dirty page tracking for SVQ.
> >>
> > vhost_log_global_{start,stop} are called at the beginning and end of
> > migration. To inform the device that it should start logging, they set
> > or clean VHOST_F_LOG_ALL at vhost_dev_set_log.
>
>
> Yes, but for SVQ, we can't disable dirty page tracking, isn't it? The
> only thing is to ignore or filter out the F_LOG_ALL and pretend to be
> enabled and disabled.
>

Yes, that's what this patch does.

>
> >
> > While SVQ does not use VHOST_F_LOG_ALL, it exports the feature bit so
> > vhost does not block migration. Maybe we need to look for another way
> > to do this?
>
>
> I'm fine with filtering since it's much more simpler, but I fail to
> understand why we need to check DRIVER_OK.
>

Ok maybe I can make that part more clear,

Since both operations use vhost_vdpa_set_features we must just filter
the one that actually sets or removes VHOST_F_LOG_ALL, without
affecting other features.

In practice, that means to not forward the set features after
DRIVER_OK. The device is not expecting them anymore.

Does that make more sense?

Thanks!

> Thanks
>
>
> >
> > Thanks!
> >
> >> Thanks
> >>
> >>
> >>> +            return 0;
> >>> +        }
> >>> +
> >>> +        /* We must not ack _F_LOG if SVQ is enabled */
> >>> +        features &=3D ~BIT_ULL(VHOST_F_LOG_ALL);
> >>> +
> >>>            ret =3D vhost_vdpa_get_dev_features(dev, &dev_features);
> >>>            if (ret !=3D 0) {
> >>>                error_report("Can't get vdpa device features, got (%d)=
", ret);
>


