Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1571145540D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 06:08:18 +0100 (CET)
Received: from localhost ([::1]:52630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnZei-0000rK-4k
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 00:08:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mnZdD-00005X-56
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 00:06:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mnZdA-0000n1-EA
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 00:06:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637211999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qFPT+jUFkIMM29qE+RfkFvvBhlibEHHmcxfUlXjTt8s=;
 b=HjoJcaJBJZMOG9DCBaj/iI0BtkgaAFxlktYcPVT42ghFgV1Ct/YWZEiER+I6msF+6/z5vB
 IeflaFI95j1erFlED6GHaGgCoNea4r+4nDXxBt07B5ulfpiqtuFATouC7A8mDt0heoqu4j
 R565+wUeAkjJ+S6Y5Jit8slP0yazUcU=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-__2YPtl1N5ex-6cdp7th9Q-1; Thu, 18 Nov 2021 00:06:38 -0500
X-MC-Unique: __2YPtl1N5ex-6cdp7th9Q-1
Received: by mail-lf1-f72.google.com with SMTP id
 c14-20020a056512104e00b004036d17f91bso3136800lfb.17
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 21:06:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qFPT+jUFkIMM29qE+RfkFvvBhlibEHHmcxfUlXjTt8s=;
 b=CcDBu/00PS7rfiOERTuxXBGHgBHf4wHlwqjRMkAUegVXHCfb//jsAMW0FU7tSKgoIf
 q8+lT6RUx9+hEJhk7W6ypE12CCizEXJw3Muc53Zr5Y7u1rj7lBPjHohdZ4P2E8kb3Guz
 VihviOgKd6/XZgwzovXdYPeRDt76dUq+nDAV/cl8cZJj89/BLAMTaRqX0FQWTaAbGK/r
 UblnvBBUFmJr9xw5jnckQ2smauQW1DadctmhqqH0y4sOfh2J2qmGEhtoBVDkOH0m6BdY
 kXy5mROfT5JhXmDjNPfrrp1chFGqRieFBOtBbQp5KqJum+8ahvwEK4ghjLQVb1Bo6u0r
 Dsmg==
X-Gm-Message-State: AOAM533s4ewQ4hfb1uzatoUk2NgGXC+PrELYI9JkFoqtV3s+icVpZk2O
 8XT6B9WEELySdKah/PS6FhK4pdomDN/ekOBEEu5UB2oD/S6yzhgkm4gFdwl4vFBoAhf/usO7Pgj
 RbahP/+VHJAn8Kp/NHjk4z4LzXT/96NA=
X-Received: by 2002:a05:6512:3990:: with SMTP id
 j16mr20646118lfu.199.1637211996695; 
 Wed, 17 Nov 2021 21:06:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPqTpqshUUg7XHA5tOxI5yi9P/RIXNk25sZXm4xXgNwQS+sqlvo+DK6jOhGTIwr1zu/nzXreX07nn9DcKfns4=
X-Received: by 2002:a05:6512:3990:: with SMTP id
 j16mr20646091lfu.199.1637211996445; 
 Wed, 17 Nov 2021 21:06:36 -0800 (PST)
MIME-Version: 1.0
References: <20211117192851.65529-1-eperezma@redhat.com>
 <20211117192851.65529-3-eperezma@redhat.com>
In-Reply-To: <20211117192851.65529-3-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 18 Nov 2021 13:06:25 +0800
Message-ID: <CACGkMEtad_+DBt4NJcjtRfPYXPUn6BVCUses7yeb8sMVhQL58g@mail.gmail.com>
Subject: Re: [PATCH 2/3] virtio-net: Only enable userland vq if using tap
 backend
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cindy Lu <lulu@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 18, 2021 at 3:29 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Qemu falls back on userland handlers even if vhost-user and vhost-vdpa
> cases. These assumes a tap device can handle the packets.
>
> If a vdpa device fail to start, it can trigger a sigsegv because of
> that. Do not resort on them unless actually possible.

It would be better to show the calltrace here then we can see the root caus=
e.

>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  include/hw/virtio/virtio.h |  2 ++
>  hw/net/virtio-net.c        |  4 ++++
>  hw/virtio/virtio.c         | 21 +++++++++++++--------
>  3 files changed, 19 insertions(+), 8 deletions(-)
>
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 8bab9cfb75..1712ba0b4c 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -105,6 +105,8 @@ struct VirtIODevice
>      VMChangeStateEntry *vmstate;
>      char *bus_name;
>      uint8_t device_endian;
> +    /* backend does not support userspace handler */
> +    bool disable_ioeventfd_handler;
>      bool use_guest_notifier_mask;
>      AddressSpace *dma_as;
>      QLIST_HEAD(, VirtQueue) *vector_queues;
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 004acf858f..8c5c4e5a9d 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3501,6 +3501,10 @@ static void virtio_net_device_realize(DeviceState =
*dev, Error **errp)
>      nc =3D qemu_get_queue(n->nic);
>      nc->rxfilter_notify_enabled =3D 1;
>
> +    if (!nc->peer || nc->peer->info->type !=3D NET_CLIENT_DRIVER_TAP) {
> +        /* Only tap can use userspace networking */
> +        vdev->disable_ioeventfd_handler =3D true;
> +    }
>      if (nc->peer && nc->peer->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_=
VDPA) {
>          struct virtio_net_config netcfg =3D {};
>          memcpy(&netcfg.mac, &n->nic_conf.macaddr, ETH_ALEN);
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index ea7c079fb0..1e04db6650 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -3734,17 +3734,22 @@ static int virtio_device_start_ioeventfd_impl(Vir=
tIODevice *vdev)
>              err =3D r;
>              goto assign_error;
>          }
> -        event_notifier_set_handler(&vq->host_notifier,
> -                                   virtio_queue_host_notifier_read);
> +
> +        if (!vdev->disable_ioeventfd_handler) {
> +            event_notifier_set_handler(&vq->host_notifier,
> +                                       virtio_queue_host_notifier_read);

This is just about not responding to ioeventfd. Does this happen only
when ioeventfd is enabled? If yes, we probably need a consistent way
to deal with that. Will having a dummy receiver be more simpler?

Thanks

> +        }
>      }
>
> -    for (n =3D 0; n < VIRTIO_QUEUE_MAX; n++) {
> -        /* Kick right away to begin processing requests already in vring=
 */
> -        VirtQueue *vq =3D &vdev->vq[n];
> -        if (!vq->vring.num) {
> -            continue;
> +    if (!vdev->disable_ioeventfd_handler) {
> +        for (n =3D 0; n < VIRTIO_QUEUE_MAX; n++) {
> +            /* Kick right away to begin processing requests already in v=
ring */
> +            VirtQueue *vq =3D &vdev->vq[n];
> +            if (!vq->vring.num) {
> +                continue;
> +            }
> +            event_notifier_set(&vq->host_notifier);
>          }
> -        event_notifier_set(&vq->host_notifier);
>      }
>      memory_region_transaction_commit();
>      return 0;
> --
> 2.27.0
>


