Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8533149C5A1
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 09:57:41 +0100 (CET)
Received: from localhost ([::1]:48432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCe7Y-0004hp-M2
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 03:57:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nCe4Z-000371-Mo
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 03:54:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nCe4Y-0004ep-3L
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 03:54:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643187273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KZ+KLRmEkI2xHam9Z0ONj0vqNG8QmvNvtH3Ax+Bb9C8=;
 b=L4Xz4Z/lbvsDC/kTufs5ngvMWz/bq6IIH/4CgZpGwy4jd5woiLXPpjWoPcnLYoPkm/qIlE
 CzlnKnht9/IkG5HvYY3JRdiZuwW+W8yc8XjUCdXxkPbRx0li0+AoZGxyAedYMp4JVAmzJs
 oAj5YPNTXrQZvRem7X0JDfr+XMokmO0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-VPy5P1R5Pw6xzsD-ceIOoQ-1; Wed, 26 Jan 2022 03:54:30 -0500
X-MC-Unique: VPy5P1R5Pw6xzsD-ceIOoQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 q5-20020a05620a0d8500b004738c1b48beso16692932qkl.7
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 00:54:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KZ+KLRmEkI2xHam9Z0ONj0vqNG8QmvNvtH3Ax+Bb9C8=;
 b=zI57VeEzIeFEGdOoOkd/0HUTKe/FwnIKCsGnZPkvuPCuN9emnzWD15tDkqn8eI9CWR
 m4y7gkjPHFO9XKQFRgQJJ0m2bg43uPXRCj21X1wcsMBndDXH2Kyc0s3Ixdxr5BedZNmE
 p4AbFDmIXoDVmCcd2WBFKf14BHNLBFAJmQFFsK+plo3JymH6wbnSlxCAm0lIX+LgG+hE
 ru38HXWxGnCW6c4R2paD29yPY26GrZqLnJ4uvTLU7q6TPdu9yyezTvkbwaEsIIARFXGC
 6lhDlb7+6ine5bEHdnXVXL8rq2m2jSPekkmkswsdYHmwX+aDORWvZkKT9qUbiYrDn1+f
 AvYg==
X-Gm-Message-State: AOAM531NO2rcZVVhjJ7M8XUyyepHsAaguzrS+iTtn4NcmSLAHukOmj/G
 /jLAl+XNJHzMvGCA7hUiuAmG5Dsh278nYCpUiC/+hHaeLabzo/hZApcOmkGlc15OSko8pUmiXWw
 /SP5fAMF7qZStJmehJHIkOpu4q/rhDGY=
X-Received: by 2002:a05:620a:408d:: with SMTP id
 f13mr16002235qko.486.1643187269963; 
 Wed, 26 Jan 2022 00:54:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMugKnZNR99vnc3K1v9xJ3FGyLCGDWWGRTJd/9ijPwf3DAoZamXW8Sx3m5/Z9QS/piuUnPoyNS44E2pBvXhJo=
X-Received: by 2002:a05:620a:408d:: with SMTP id
 f13mr16002207qko.486.1643187269705; 
 Wed, 26 Jan 2022 00:54:29 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-3-eperezma@redhat.com>
In-Reply-To: <20220121202733.404989-3-eperezma@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 26 Jan 2022 09:53:53 +0100
Message-ID: <CAJaqyWfdWZJs5bg=zh+43m_8ecGm+KJLMFWqOqkK9hRG+tjwxg@mail.gmail.com>
Subject: Re: [PATCH 02/31] vhost: Add VhostShadowVirtqueue
To: qemu-level <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Cindy Lu <lulu@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 21, 2022 at 9:32 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Vhost shadow virtqueue (SVQ) is an intermediate jump for virtqueue
> notifications and buffers, allowing qemu to track them. While qemu is
> forwarding the buffers and virtqueue changes, it is able to commit the
> memory it's being dirtied, the same way regular qemu's VirtIO devices
> do.
>
> This commit only exposes basic SVQ allocation and free. Next patches of
> the series add functionality like notifications and buffers forwarding.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost-shadow-virtqueue.h | 21 ++++++++++
>  hw/virtio/vhost-shadow-virtqueue.c | 64 ++++++++++++++++++++++++++++++
>  hw/virtio/meson.build              |  2 +-
>  3 files changed, 86 insertions(+), 1 deletion(-)
>  create mode 100644 hw/virtio/vhost-shadow-virtqueue.h
>  create mode 100644 hw/virtio/vhost-shadow-virtqueue.c
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-=
virtqueue.h
> new file mode 100644
> index 0000000000..61ea112002
> --- /dev/null
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -0,0 +1,21 @@
> +/*
> + * vhost shadow virtqueue
> + *
> + * SPDX-FileCopyrightText: Red Hat, Inc. 2021
> + * SPDX-FileContributor: Author: Eugenio P=C3=A9rez <eperezma@redhat.com=
>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef VHOST_SHADOW_VIRTQUEUE_H
> +#define VHOST_SHADOW_VIRTQUEUE_H
> +
> +#include "hw/virtio/vhost.h"
> +
> +typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> +
> +VhostShadowVirtqueue *vhost_svq_new(void);
> +
> +void vhost_svq_free(VhostShadowVirtqueue *vq);
> +
> +#endif
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-=
virtqueue.c
> new file mode 100644
> index 0000000000..5ee7b401cb
> --- /dev/null
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -0,0 +1,64 @@
> +/*
> + * vhost shadow virtqueue
> + *
> + * SPDX-FileCopyrightText: Red Hat, Inc. 2021
> + * SPDX-FileContributor: Author: Eugenio P=C3=A9rez <eperezma@redhat.com=
>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/virtio/vhost-shadow-virtqueue.h"
> +
> +#include "qemu/error-report.h"
> +#include "qemu/event_notifier.h"
> +
> +/* Shadow virtqueue to relay notifications */
> +typedef struct VhostShadowVirtqueue {

This is already typedef as VhostShadowVirtqueue in the header, so I
will remove it here for the next version.

> +    /* Shadow kick notifier, sent to vhost */
> +    EventNotifier hdev_kick;
> +    /* Shadow call notifier, sent to vhost */
> +    EventNotifier hdev_call;
> +} VhostShadowVirtqueue;
> +
> +/**
> + * Creates vhost shadow virtqueue, and instruct vhost device to use the =
shadow
> + * methods and file descriptors.
> + */
> +VhostShadowVirtqueue *vhost_svq_new(void)
> +{
> +    g_autofree VhostShadowVirtqueue *svq =3D g_new0(VhostShadowVirtqueue=
, 1);
> +    int r;
> +
> +    r =3D event_notifier_init(&svq->hdev_kick, 0);
> +    if (r !=3D 0) {
> +        error_report("Couldn't create kick event notifier: %s",
> +                     strerror(errno));
> +        goto err_init_hdev_kick;
> +    }
> +
> +    r =3D event_notifier_init(&svq->hdev_call, 0);
> +    if (r !=3D 0) {
> +        error_report("Couldn't create call event notifier: %s",
> +                     strerror(errno));
> +        goto err_init_hdev_call;
> +    }
> +
> +    return g_steal_pointer(&svq);
> +
> +err_init_hdev_call:
> +    event_notifier_cleanup(&svq->hdev_kick);
> +
> +err_init_hdev_kick:
> +    return NULL;
> +}
> +
> +/**
> + * Free the resources of the shadow virtqueue.
> + */
> +void vhost_svq_free(VhostShadowVirtqueue *vq)
> +{
> +    event_notifier_cleanup(&vq->hdev_kick);
> +    event_notifier_cleanup(&vq->hdev_call);
> +    g_free(vq);
> +}
> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> index 521f7d64a8..2dc87613bc 100644
> --- a/hw/virtio/meson.build
> +++ b/hw/virtio/meson.build
> @@ -11,7 +11,7 @@ softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhos=
t-stub.c'))
>
>  virtio_ss =3D ss.source_set()
>  virtio_ss.add(files('virtio.c'))
> -virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-bac=
kend.c'))
> +virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-bac=
kend.c', 'vhost-shadow-virtqueue.c'))
>  virtio_ss.add(when: 'CONFIG_VHOST_USER', if_true: files('vhost-user.c'))
>  virtio_ss.add(when: 'CONFIG_VHOST_VDPA', if_true: files('vhost-vdpa.c'))
>  virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-ball=
oon.c'))
> --
> 2.27.0
>
>


