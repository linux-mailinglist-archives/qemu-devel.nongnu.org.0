Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 612DA4EBD62
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 11:14:01 +0200 (CEST)
Received: from localhost ([::1]:43464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZUOu-0005lp-5z
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 05:14:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZUIR-0001k2-BQ
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 05:07:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZUIO-0001v7-3R
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 05:07:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648631234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tT06OpIp+u92qP+QNeJsQFjnIt32zLmk/B0WMQXHvd4=;
 b=SNLqaQgoN3Wq8k2Q7GJuiJ4CBSu79+wlDRwUav0iyZxFcGVbbQTLdi2CBNbiwyWRpF+MHW
 pXHam7zva87MZnzwP6xbNaokCEIx66Pb2eebDekypHMTzP0vsjfPiEktIBF4yTOgKnG1P6
 pOoRuNALdJWSpsREwxxzuvx4BfKHMCI=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-d4ob8eFwPOKnRluOGTWKBA-1; Wed, 30 Mar 2022 05:07:13 -0400
X-MC-Unique: d4ob8eFwPOKnRluOGTWKBA-1
Received: by mail-lj1-f198.google.com with SMTP id
 m27-20020a2e581b000000b002498087c6f4so8452034ljb.14
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 02:07:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tT06OpIp+u92qP+QNeJsQFjnIt32zLmk/B0WMQXHvd4=;
 b=xqf0PimdClS36StngNWffxiE7IkGr44p56PAhpG3jOW/LnKcq9q9G6wcA18/P91jXL
 7yVE7xRNTFNKaJzEIjKzhhu06s883HWQ4isgEKGpeU4Qk9pygVBqILWGDowXJAGdqHHM
 n/1gpzjJFt6jV5qlOJqwRst7+HpX3Ne+CA6Wcn1XNlUd52BkeYUiF6Qf1mnUdTjqHQBl
 wmuRRt8yXrjJUdGnnofOXGZv9XfHSTjJ4J/hr1Q7DAVP21Vw3Y2bZNV1q0wYTEGPikV/
 oxeXI/oWlexxOxWOVxo/H8NGPgpIWEFMT33R8bqyno/IGuyyANyXfpYBeXc4/XrsLo7G
 Pvww==
X-Gm-Message-State: AOAM532CJFF9sJ2Ni/i4jq9iDxbjG1Ms1+Ivq/CKt4lL3m83blCEkQj/
 S62je3E7A0RW2XLjRko6Jdb+p5NU2Gu1FkKf33ufcz7wMuDqG4pm8q6FKWw0oRrZUCb+COOI508
 RfKJmnC4el/V6tomPVbWKXnlPJ7X9tA8=
X-Received: by 2002:ac2:4189:0:b0:448:bc2b:e762 with SMTP id
 z9-20020ac24189000000b00448bc2be762mr6044540lfh.471.1648631231554; 
 Wed, 30 Mar 2022 02:07:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTtvquE76DjdD5sBa6Vz8yGoccj3HKFzlgzOER7Sh5uS4jcNB3fEPk+alSyAQSQnPaNQe7T6vrlq5snJbG4zg=
X-Received: by 2002:ac2:4189:0:b0:448:bc2b:e762 with SMTP id
 z9-20020ac24189000000b00448bc2be762mr6044511lfh.471.1648631231100; Wed, 30
 Mar 2022 02:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-4-git-send-email-si-wei.liu@oracle.com>
In-Reply-To: <1648621997-22416-4-git-send-email-si-wei.liu@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 30 Mar 2022 17:07:00 +0800
Message-ID: <CACGkMEvjc5rZ2vYmiDQM-FGQYuvk1DEUFALn_oO25wkxAeWqvA@mail.gmail.com>
Subject: Re: [PATCH 3/7] virtio-net: Only enable userland vq if using tap
 backend
To: Si-Wei Liu <si-wei.liu@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eperezma <eperezma@redhat.com>, Eli Cohen <eli@mellanox.com>,
 qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 30, 2022 at 2:33 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
> From: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
> Qemu falls back on userland handlers even if vhost-user and vhost-vdpa
> cases. These assumes a tap device can handle the packets.
>
> If a vdpa device fail to start, it can trigger a sigsegv because of
> that. Do not resort on them unless actually possible.

What kind of segsev you've seen. If my memory is correct we finally
choose to have a dummy receive() for vhost-vDPA in

commit 846a1e85da646c6006db429648389fc110f92d75
Author: Eugenio P=C3=A9rez <eperezma@redhat.com>
Date:   Thu Nov 25 11:16:13 2021 +0100

    vdpa: Add dummy receive callback

    Qemu falls back on userland handlers even if vhost-user and vhost-vdpa
    cases. These assumes a tap device can handle the packets.

    If a vdpa device fail to start, it can trigger a sigsegv because of
    that. Add dummy receiver that returns no progress so it can keep
    running.

    Fixes: 1e0a84ea49 ("vhost-vdpa: introduce vhost-vdpa net client")
    Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
    Message-Id: <20211125101614.76927-2-eperezma@redhat.com>
    Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
    Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
    Acked-by: Jason Wang <jasowang@redhat.com>

(Technically, we can have a vhost-vDPA networking backend (not vhost backen=
d))

>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/net/virtio-net.c        |  4 ++++
>  hw/virtio/virtio.c         | 21 +++++++++++++--------
>  include/hw/virtio/virtio.h |  2 ++
>  3 files changed, 19 insertions(+), 8 deletions(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index ffaf481..9cdf777 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3523,6 +3523,10 @@ static void virtio_net_device_realize(DeviceState =
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
> index 9d637e0..806603b 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -3708,17 +3708,22 @@ static int virtio_device_start_ioeventfd_impl(Vir=
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
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index b31c450..b6ce5f0 100644
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
> --
> 1.8.3.1
>


