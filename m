Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C6449F511
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 09:27:48 +0100 (CET)
Received: from localhost ([::1]:50658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDMbj-0000Cg-Hh
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 03:27:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nDMMC-0000d6-1O
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 03:11:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nDMM7-00041h-VN
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 03:11:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643357463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lRExr/7znOmIJOTEXqUyWxdS0mzyWPGdrYCuKrisEjE=;
 b=MKgXXRcdkR/hP2nA4EQS0vkFzvnv6Qm/n4ldlOQzGtMxZyEpN5Ffd4z4dRH05ixXuq8F8g
 FwAgfcerrU3+2X9/s45I6VVEC5ckjKwqoz9xdtBsD507FvHfZyA+ZN5Ew5A3N/pcoA9iUB
 LhXWMh9vbK4IvOhCxsr3ky66ob9GjO4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-wR81WVXwPNSggbhN1SS59g-1; Fri, 28 Jan 2022 03:11:00 -0500
X-MC-Unique: wR81WVXwPNSggbhN1SS59g-1
Received: by mail-qk1-f198.google.com with SMTP id
 z205-20020a3765d6000000b0047db3b020dfso4241134qkb.22
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 00:11:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lRExr/7znOmIJOTEXqUyWxdS0mzyWPGdrYCuKrisEjE=;
 b=ZPsLB14cTWcmAcOPAqdyQgRqF95e5lRCvZhY1SATbjDuoQJmiN65Nl1fta6bCoNX/D
 R0aXcaLlBOGfIt9vIXDjVCjNTkk91RLW9E9ihVOLb31ZAi65c1qgkvyVdW6mpEU4QImO
 jOTl4VN6qiDjXlR3fsjV/P1DMzXhf6EAtFf2cK6Q9Xll6eZiYEEsVXf1UUF/lOoMR9bG
 ZlMNfWJeCDiFuoxjUR8OMBd1jOC1ZRPZUaoOwCIIzbs7CErNcQq/dOTZ8u3gDFu4U28f
 39DlxVJM2Jx0dWNixQO45wRf4/+6s3H4GZrmZ/TSQGumjy0dzF6xSmdPjWR8uWCuX8uD
 Eybg==
X-Gm-Message-State: AOAM5330Mf+d1QaCUqE97p927hmSO4SNhOh9Ibf0jt9ka3fwyCFtoKhP
 Isas4pHoFAH0IyHk1NqvTM1j65ffQQuBtsimOEdibsEEFJv+kEsfvOGXaud1SNRo1fbjgDpnOig
 iAvdZg1J2qBHgX4ZNLvapJbKPHcZaYFY=
X-Received: by 2002:a05:620a:410b:: with SMTP id
 j11mr5049758qko.486.1643357459679; 
 Fri, 28 Jan 2022 00:10:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxc7ZMdj29zy4aQkNYPeiFeSW4vFuS7qtPAr6gVRnIGa4cWLXQFqbGmAZcKCaUiDsYuQ/C7yCV/TOkQWWlEDGE=
X-Received: by 2002:a05:620a:410b:: with SMTP id
 j11mr5049749qko.486.1643357459387; 
 Fri, 28 Jan 2022 00:10:59 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-3-eperezma@redhat.com>
 <3900d7cc-a7a0-90a0-5ba4-6fc37a84922f@redhat.com>
In-Reply-To: <3900d7cc-a7a0-90a0-5ba4-6fc37a84922f@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 28 Jan 2022 09:10:23 +0100
Message-ID: <CAJaqyWegx9TkX8Q=yOeF25kYLt97xTRYYk5teJZxORxZJkii-A@mail.gmail.com>
Subject: Re: [PATCH 02/31] vhost: Add VhostShadowVirtqueue
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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

On Fri, Jan 28, 2022 at 7:00 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > Vhost shadow virtqueue (SVQ) is an intermediate jump for virtqueue
> > notifications and buffers, allowing qemu to track them. While qemu is
> > forwarding the buffers and virtqueue changes, it is able to commit the
> > memory it's being dirtied, the same way regular qemu's VirtIO devices
> > do.
> >
> > This commit only exposes basic SVQ allocation and free. Next patches of
> > the series add functionality like notifications and buffers forwarding.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.h | 21 ++++++++++
> >   hw/virtio/vhost-shadow-virtqueue.c | 64 +++++++++++++++++++++++++++++=
+
> >   hw/virtio/meson.build              |  2 +-
> >   3 files changed, 86 insertions(+), 1 deletion(-)
> >   create mode 100644 hw/virtio/vhost-shadow-virtqueue.h
> >   create mode 100644 hw/virtio/vhost-shadow-virtqueue.c
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > new file mode 100644
> > index 0000000000..61ea112002
> > --- /dev/null
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -0,0 +1,21 @@
> > +/*
> > + * vhost shadow virtqueue
> > + *
> > + * SPDX-FileCopyrightText: Red Hat, Inc. 2021
> > + * SPDX-FileContributor: Author: Eugenio P=C3=A9rez <eperezma@redhat.c=
om>
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +
> > +#ifndef VHOST_SHADOW_VIRTQUEUE_H
> > +#define VHOST_SHADOW_VIRTQUEUE_H
> > +
> > +#include "hw/virtio/vhost.h"
> > +
> > +typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> > +
> > +VhostShadowVirtqueue *vhost_svq_new(void);
> > +
> > +void vhost_svq_free(VhostShadowVirtqueue *vq);
> > +
> > +#endif
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > new file mode 100644
> > index 0000000000..5ee7b401cb
> > --- /dev/null
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -0,0 +1,64 @@
> > +/*
> > + * vhost shadow virtqueue
> > + *
> > + * SPDX-FileCopyrightText: Red Hat, Inc. 2021
> > + * SPDX-FileContributor: Author: Eugenio P=C3=A9rez <eperezma@redhat.c=
om>
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "hw/virtio/vhost-shadow-virtqueue.h"
> > +
> > +#include "qemu/error-report.h"
> > +#include "qemu/event_notifier.h"
> > +
> > +/* Shadow virtqueue to relay notifications */
> > +typedef struct VhostShadowVirtqueue {
> > +    /* Shadow kick notifier, sent to vhost */
> > +    EventNotifier hdev_kick;
> > +    /* Shadow call notifier, sent to vhost */
> > +    EventNotifier hdev_call;
> > +} VhostShadowVirtqueue;
> > +
> > +/**
> > + * Creates vhost shadow virtqueue, and instruct vhost device to use th=
e shadow
> > + * methods and file descriptors.
> > + */
> > +VhostShadowVirtqueue *vhost_svq_new(void)
> > +{
> > +    g_autofree VhostShadowVirtqueue *svq =3D g_new0(VhostShadowVirtque=
ue, 1);
> > +    int r;
> > +
> > +    r =3D event_notifier_init(&svq->hdev_kick, 0);
> > +    if (r !=3D 0) {
> > +        error_report("Couldn't create kick event notifier: %s",
> > +                     strerror(errno));
> > +        goto err_init_hdev_kick;
> > +    }
> > +
> > +    r =3D event_notifier_init(&svq->hdev_call, 0);
> > +    if (r !=3D 0) {
> > +        error_report("Couldn't create call event notifier: %s",
> > +                     strerror(errno));
> > +        goto err_init_hdev_call;
> > +    }
> > +
> > +    return g_steal_pointer(&svq);
> > +
> > +err_init_hdev_call:
> > +    event_notifier_cleanup(&svq->hdev_kick);
> > +
> > +err_init_hdev_kick:
> > +    return NULL;
> > +}
> > +
> > +/**
> > + * Free the resources of the shadow virtqueue.
> > + */
> > +void vhost_svq_free(VhostShadowVirtqueue *vq)
> > +{
> > +    event_notifier_cleanup(&vq->hdev_kick);
> > +    event_notifier_cleanup(&vq->hdev_call);
> > +    g_free(vq);
> > +}
> > diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> > index 521f7d64a8..2dc87613bc 100644
> > --- a/hw/virtio/meson.build
> > +++ b/hw/virtio/meson.build
> > @@ -11,7 +11,7 @@ softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vh=
ost-stub.c'))
> >
> >   virtio_ss =3D ss.source_set()
> >   virtio_ss.add(files('virtio.c'))
> > -virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-b=
ackend.c'))
> > +virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-b=
ackend.c', 'vhost-shadow-virtqueue.c'))
>
>
> I wonder if we need a dedicated config option for shadow virtqueue.
>

I'd say that the changes are isolated enough and require no external
library dependencies so the gain is little. But it can be done with an
explicit enable/disable for sure.

Thanks!

> Thanks
>
>
> >   virtio_ss.add(when: 'CONFIG_VHOST_USER', if_true: files('vhost-user.c=
'))
> >   virtio_ss.add(when: 'CONFIG_VHOST_VDPA', if_true: files('vhost-vdpa.c=
'))
> >   virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-b=
alloon.c'))
>


