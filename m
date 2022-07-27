Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DC1581F5E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 07:02:29 +0200 (CEST)
Received: from localhost ([::1]:57906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGZBk-0001B1-Ai
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 01:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGZ8V-0007hr-R5
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 00:59:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGZ8U-0001R0-0I
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 00:59:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658897945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WTxttArniVTu3HJxB/gs6Cn3yS6dd4TVRrwiLkKKAmM=;
 b=ejYrPJmCLfjjDoIsT7Jpt5CAJDAbl22MSDhYZcWxXNZSgW5if/j62jpxIyH+MjZIhniyqc
 D8Mg9wi18xHJfUYrj6BKxfgNE3+sg/TiBQRYflu8FBGUXYdwSX5EtX6l2QDwMolSijGA1D
 zW6EVM9tngouBi6djfM4G22JlHuw1cw=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-4OSA2_ugOh6o_tPDcaUW-w-1; Wed, 27 Jul 2022 00:59:01 -0400
X-MC-Unique: 4OSA2_ugOh6o_tPDcaUW-w-1
Received: by mail-lf1-f69.google.com with SMTP id
 a19-20020a19f813000000b0048a7379e38bso4337527lff.5
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 21:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WTxttArniVTu3HJxB/gs6Cn3yS6dd4TVRrwiLkKKAmM=;
 b=z+PC0d6s6BOkb3VY3Gl7imDiyHYuvaKWxqe5d8bNPc2OOKgDZ+Yj7Aig9velb0PNZI
 lr6Ykk+5SoESZiaoouMDTESMc+X25tuokA8WcKv2KfD4gFN4EFFVuJy+L3YeCQ63pe3h
 hJ49guRmDuC4k//UTh4mEfkNs3LNr+eqSxWDTlvDeTCAu4E4OwnvY3gQDo8lPd2jms47
 nNg3kTxqA7NpfW9O/FDBySs2arcfEsiotClV6r0p1pwb5O8vjAADNNc310ExwXgf+Q91
 TVZNkZzKe3M2kyc4DbaqMkdH/nesnYNB7wiPcLwY3UH4I6nDsJdP52ZPFKOnP0CALZM3
 VVVg==
X-Gm-Message-State: AJIora/J7nIe1qk5k0vrl+vloHLbFHVJs97I3bWn+SvLUM7+dnnSUo3N
 fNMqWGOXb8IUiLbM3YISZE7K9SB8QXgqO041Y9Q0Ml7IbFYrkOCiUGhP0VQjsS/CbNcpD0sNY/k
 fpn9nvAjnyzcK8Dg2gahQtLyMn6zX3BE=
X-Received: by 2002:ac2:4205:0:b0:48a:95e6:395c with SMTP id
 y5-20020ac24205000000b0048a95e6395cmr4109718lfh.238.1658897940005; 
 Tue, 26 Jul 2022 21:59:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tcRze046NpsO+Uk5nsuR56kBfZad36MVB3qzNZ9FHGOC9qutuBzpo3jaIZ8FUH2Q7Y0FFsKcIll6W2UNpGW2g=
X-Received: by 2002:ac2:4205:0:b0:48a:95e6:395c with SMTP id
 y5-20020ac24205000000b0048a95e6395cmr4109706lfh.238.1658897939634; Tue, 26
 Jul 2022 21:58:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <591635c6dfa81b8310ae38e56916aa6f3842fc58.1658141552.git.kangjie.xu@linux.alibaba.com>
 <1c676f4c-5618-e944-cf2a-c0e3e5b8b0e9@redhat.com>
 <fd8457a1-fb49-577c-881e-c5fc50ede7ad@linux.alibaba.com>
In-Reply-To: <fd8457a1-fb49-577c-881e-c5fc50ede7ad@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 27 Jul 2022 12:58:48 +0800
Message-ID: <CACGkMEvWYBj6t6KDnSY6+XOTW3RvpZq-YzuRGd_nbpN7-2TdRQ@mail.gmail.com>
Subject: Re: [PATCH 14/16] virtio-net: support queue_enable for vhost-user
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: mst <mst@redhat.com>, hengqi@linux.alibaba.com, 
 qemu-devel <qemu-devel@nongnu.org>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 26, 2022 at 2:54 PM Kangjie Xu <kangjie.xu@linux.alibaba.com> w=
rote:
>
>
> =E5=9C=A8 2022/7/26 12:25, Jason Wang =E5=86=99=E9=81=93:
> >
> > =E5=9C=A8 2022/7/18 19:17, Kangjie Xu =E5=86=99=E9=81=93:
> >> Support queue enable in vhost-user scenario. It will be called when
> >> a vq reset operation is performed and the vq will be restared.
> >>
> >> It should be noted that we can restart the vq when the vhost has
> >> already started. When launching a new vhost-user device, the vhost
> >> is not started and all vqs are not initalized until
> >> VIRTIO_PCI_COMMON_STATUS is written. Thus, we should use vhost_started
> >> to differentiate the two cases: vq reset and device start.
> >>
> >> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> >> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> >> ---
> >>   hw/net/virtio-net.c | 20 ++++++++++++++++++++
> >>   1 file changed, 20 insertions(+)
> >>
> >> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> >> index 8396e21a67..2c26e2ef73 100644
> >> --- a/hw/net/virtio-net.c
> >> +++ b/hw/net/virtio-net.c
> >> @@ -544,6 +544,25 @@ static void virtio_net_queue_reset(VirtIODevice
> >> *vdev, uint32_t queue_index)
> >>       assert(!virtio_net_get_subqueue(nc)->async_tx.elem);
> >>   }
> >>   +static void virtio_net_queue_enable(VirtIODevice *vdev, uint32_t
> >> queue_index)
> >> +{
> >> +    VirtIONet *n =3D VIRTIO_NET(vdev);
> >> +    NetClientState *nc =3D qemu_get_subqueue(n->nic, vq2q(queue_index=
));
> >> +    int r;
> >> +
> >> +    if (!nc->peer || !vdev->vhost_started) {
> >> +        return;
> >> +    }
> >> +
> >> +    if (nc->peer->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_USER) {
> >> +        r =3D vhost_virtqueue_restart(vdev, nc, queue_index);
> >> +        if (r < 0) {
> >> +            error_report("unable to restart vhost net virtqueue: %d, =
"
> >> +                            "when resetting the queue", queue_index);
> >> +        }
> >> +    }
> >> +}
> >
> >
> > So we don't check queue_enable in vhost_dev_start(), does this mean
> > the queue_enable is actually meaningless (since the virtqueue is
> > already started there)?
> >
> > And another issue is
> >
> > peet_attach/peer_detach() "abuse" vhost_set_vring_enable(). This
> > probably means we need to invent new type of request instead of
> > re-using VHOST_USER_SET_VRING_ENABLE.
> >
> > Thanks
> >
> >
> 1. Yes, we don't need queue_enable in vhost_dev_start(), queue_enable is
> only useful when restarting the queue. I name it as queue_enable()
> simply because it is called when VIRTIO_PCI_COMMON_Q_ENABLE is written.
> Would it look better if we rename it as "queue_reenable"?

I think the right approach is probably:

1) when VERSION_1 is negotiated, only start the virtqueue when queue_enable=
 is 1
2) when VERSION_1 is not negotiated, start virtqueue when DRIVER_OK
(vhost_dev_start())

?

>
> 2. I think inventing a new type of vhost-protocol message can be a good
> choice. However, I don't know much about the vhost protocol. If we want
> to add a new message in vhost protocol, except the documentation and the
> code in qemu, Do we need to submit patches to other projects, e.g. some
> projects like virtio-spec?

Probably not since vhost-user doesn't belong to the spec currently.
The doc in qemu should be sufficient.

Thanks

>
> Thanks
>
> >> +
> >>   static void virtio_net_reset(VirtIODevice *vdev)
> >>   {
> >>       VirtIONet *n =3D VIRTIO_NET(vdev);
> >> @@ -3781,6 +3800,7 @@ static void virtio_net_class_init(ObjectClass
> >> *klass, void *data)
> >>       vdc->bad_features =3D virtio_net_bad_features;
> >>       vdc->reset =3D virtio_net_reset;
> >>       vdc->queue_reset =3D virtio_net_queue_reset;
> >> +    vdc->queue_enable =3D virtio_net_queue_enable;
> >>       vdc->set_status =3D virtio_net_set_status;
> >>       vdc->guest_notifier_mask =3D virtio_net_guest_notifier_mask;
> >>       vdc->guest_notifier_pending =3D virtio_net_guest_notifier_pendin=
g;
>


