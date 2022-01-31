Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 375314A4003
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 11:21:03 +0100 (CET)
Received: from localhost ([::1]:46436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nETnx-00008Z-Pe
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 05:21:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nETmZ-0007YP-3f
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 05:19:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nETmW-0005nx-Cd
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 05:19:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643624365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fkJLGZME/+hsZXtGB+83k/vwiy7v5qdBQnLhYtdlajY=;
 b=LLMsOJtNf3mKXQ1n1/jXou+9vLCPOwbW00mIV7oEd+zptpLou6esEXixzGKKtgdUfkodTl
 SkA2VgUiwXysW8ufPDD4PIS2JFEls7UtmOrVUwURTv67X7gwAtG6hCYnCzseFNVHn2u0vo
 i9+yu5j7klWAgJFKPXUI1sQRzIyzu4U=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-wJwfJx6bMZuhxMqEejpzXw-1; Mon, 31 Jan 2022 05:19:24 -0500
X-MC-Unique: wJwfJx6bMZuhxMqEejpzXw-1
Received: by mail-qk1-f200.google.com with SMTP id
 j66-20020a375545000000b004e0e071f37eso6699358qkb.23
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 02:19:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fkJLGZME/+hsZXtGB+83k/vwiy7v5qdBQnLhYtdlajY=;
 b=sGK+APq3EKtAFSjR4xBYO2eYgghciLwmmy4F4QjoZrRwStVPZHWRTROP9BlU9WX4qT
 Xus3cwk1M9j76NwvbglRDnNmvuPjobC8d0VAIZq3rm3972jK4+sbr1L3i8ZCY3lOzI+o
 YJM7xshyzppIVFAxNeM9V1wPNuUBoUT6XmsrFM8twufJeQaeiUALa5BR29eCbG0xR13Z
 zQ1mZsMUb0rRF8NuIRISXhyUYYN7QdmzX2RKRFaUsKZ4EfqKduJp8u3ytrm6kda/lV9c
 4WmmrFK66L+18y2jBOygmm9WMRpGOteytPBJ/9E6cCnAxKn9K8RRf3MStuDJYwsLfNjI
 TdYw==
X-Gm-Message-State: AOAM531l5qthVpHh6vtbiQ1aL8zhxEXt72pYBkX1TE40qhftY+Rtj9AW
 OOnK71rg79CK2e+OAPtBxPPytTCAKEYcJbyy2qNJnRUpji4hWKZiSprZRjWK33jd4IkgOFjuNhs
 wzZXRLF5DOd3oeHhtBlop7IaMvvhChCw=
X-Received: by 2002:a05:6214:20ad:: with SMTP id
 13mr16532686qvd.40.1643624362003; 
 Mon, 31 Jan 2022 02:19:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwv14CBKOkWG38eu1vqXl661BXlEE53xOcdOkS/cl+4xyu77DnkEN9QNiyEq7SHuAnwloQf+Y1Oglokz7J45YI=
X-Received: by 2002:a05:6214:20ad:: with SMTP id
 13mr16532660qvd.40.1643624361680; 
 Mon, 31 Jan 2022 02:19:21 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-5-eperezma@redhat.com>
 <e10a7631-f1f9-5597-dd74-0f5301a68e27@redhat.com>
In-Reply-To: <e10a7631-f1f9-5597-dd74-0f5301a68e27@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 31 Jan 2022 11:18:45 +0100
Message-ID: <CAJaqyWc7fbgN-W7y3=iFqHsJzj+1Mg0cuwSu+my=62nu9vGOqA@mail.gmail.com>
Subject: Re: [PATCH 04/31] vdpa: Add vhost_svq_set_svq_kick_fd
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

On Fri, Jan 28, 2022 at 7:29 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > This function allows the vhost-vdpa backend to override kick_fd.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.h |  1 +
> >   hw/virtio/vhost-shadow-virtqueue.c | 45 +++++++++++++++++++++++++++++=
+
> >   2 files changed, 46 insertions(+)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index 400effd9f2..a56ecfc09d 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -15,6 +15,7 @@
> >
> >   typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> >
> > +void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick=
_fd);
> >   const EventNotifier *vhost_svq_get_dev_kick_notifier(
> >                                                 const VhostShadowVirtqu=
eue *svq);
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index bd87110073..21534bc94d 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -11,6 +11,7 @@
> >   #include "hw/virtio/vhost-shadow-virtqueue.h"
> >
> >   #include "qemu/error-report.h"
> > +#include "qemu/main-loop.h"
> >
> >   /* Shadow virtqueue to relay notifications */
> >   typedef struct VhostShadowVirtqueue {
> > @@ -18,8 +19,20 @@ typedef struct VhostShadowVirtqueue {
> >       EventNotifier hdev_kick;
> >       /* Shadow call notifier, sent to vhost */
> >       EventNotifier hdev_call;
> > +
> > +    /*
> > +     * Borrowed virtqueue's guest to host notifier.
> > +     * To borrow it in this event notifier allows to register on the e=
vent
> > +     * loop and access the associated shadow virtqueue easily. If we u=
se the
> > +     * VirtQueue, we don't have an easy way to retrieve it.
> > +     *
> > +     * So shadow virtqueue must not clean it, or we would lose VirtQue=
ue one.
> > +     */
> > +    EventNotifier svq_kick;
> >   } VhostShadowVirtqueue;
> >
> > +#define INVALID_SVQ_KICK_FD -1
> > +
> >   /**
> >    * The notifier that SVQ will use to notify the device.
> >    */
> > @@ -29,6 +42,35 @@ const EventNotifier *vhost_svq_get_dev_kick_notifier=
(
> >       return &svq->hdev_kick;
> >   }
> >
> > +/**
> > + * Set a new file descriptor for the guest to kick SVQ and notify for =
avail
> > + *
> > + * @svq          The svq
> > + * @svq_kick_fd  The new svq kick fd
> > + */
> > +void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick=
_fd)
> > +{
> > +    EventNotifier tmp;
> > +    bool check_old =3D INVALID_SVQ_KICK_FD !=3D
> > +                     event_notifier_get_fd(&svq->svq_kick);
> > +
> > +    if (check_old) {
> > +        event_notifier_set_handler(&svq->svq_kick, NULL);
> > +        event_notifier_init_fd(&tmp, event_notifier_get_fd(&svq->svq_k=
ick));
> > +    }
>
>
> It looks to me we don't do similar things in vhost-net. Any reason for
> caring about the old svq_kick?
>

Do you mean to check for old kick_fd in case we miss notifications,
and explicitly omit the INVALID_SVQ_KICK_FD?

If you mean qemu's vhost-net, I guess it's because the device's kick
fd is never changed in all the vhost device lifecycle, it's only set
at the beginning. Previous RFC also depended on that, but you
suggested better vhost and SVQ in v4 feedback if I understood
correctly [1]. Or am I missing something?

Qemu's vhost-net does not need to use this because it is not polling
it. For kernel's vhost, I guess the closest is the use of pollstop and
pollstart at vhost_vring_ioctl.

In my opinion, I think that SVQ code size can benefit from now
allowing to override kick_fd from the start of the operation. Not from
initialization, but start. But I can see the benefits of having the
change into account from this moment so it's more resilient to the
future.

>
> > +
> > +    /*
> > +     * event_notifier_set_handler already checks for guest's notificat=
ions if
> > +     * they arrive to the new file descriptor in the switch, so there =
is no
> > +     * need to explicitely check for them.
> > +     */
> > +    event_notifier_init_fd(&svq->svq_kick, svq_kick_fd);
> > +
> > +    if (!check_old || event_notifier_test_and_clear(&tmp)) {
> > +        event_notifier_set(&svq->hdev_kick);
>
>
> Any reason we need to kick the device directly here?
>

At this point of the series only notifications are forwarded, not
buffers. If kick_fd is set, we need to check the old one, the same way
as vhost checks the masked notifier in case of change.

Thanks!

[1] https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg03152.html
, from "I'd suggest to not depend on this since it:"


> Thanks
>
>
> > +    }
> > +}
> > +
> >   /**
> >    * Creates vhost shadow virtqueue, and instruct vhost device to use t=
he shadow
> >    * methods and file descriptors.
> > @@ -52,6 +94,9 @@ VhostShadowVirtqueue *vhost_svq_new(void)
> >           goto err_init_hdev_call;
> >       }
> >
> > +    /* Placeholder descriptor, it should be deleted at set_kick_fd */
> > +    event_notifier_init_fd(&svq->svq_kick, INVALID_SVQ_KICK_FD);
> > +
> >       return g_steal_pointer(&svq);
> >
> >   err_init_hdev_call:
>


