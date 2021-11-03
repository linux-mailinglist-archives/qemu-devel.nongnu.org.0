Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA84D443B9B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 03:52:34 +0100 (CET)
Received: from localhost ([::1]:32810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi6O9-0003Hy-DJ
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 22:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mi6MU-0002Wm-QF
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 22:50:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mi6MR-0000bh-6T
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 22:50:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635907845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fuFFTJUtz6odsxemmUMFH6kXJcgaXWc6Tsr/uuoiadc=;
 b=athAjoBHyQbX9IizXyHnPb9nfcTq5jJCKp6kTYFZuVeOOr0YylUKLv+wQTpvWkJIGn2/XR
 iyTOiB40HD6myeFfoOowbsEkb2mdmcqlw3BNiPd1uy8LQWI/ZLQQ4Ak1uAyvQ1G54pqZGX
 9LJRrPbOgSJzjiGaDAoMFqvLb6vsZ7c=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-7-OXHDblMK2MjXWRHKW2sg-1; Tue, 02 Nov 2021 22:50:44 -0400
X-MC-Unique: 7-OXHDblMK2MjXWRHKW2sg-1
Received: by mail-lj1-f198.google.com with SMTP id
 h14-20020a2ea48e000000b0021789353d84so472766lji.15
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 19:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fuFFTJUtz6odsxemmUMFH6kXJcgaXWc6Tsr/uuoiadc=;
 b=vSh4O1pjKcXGD21b+0cG+TGg/cac8M9sPHCteHB8TWHcrwRsv6rUKj4O3WAbWoPp6g
 DZeAiE7ro70p8eAVXCBuMyIkrSspZiKhJX9g/QmiS/7Sa/WG3EGTdgGBJjujyySZEh7L
 P9gyDUmHNoD0EmiTwpCFlDF/KcCA6iMkl885nO0on3ckw1fs/aqWP5JPzQKw7CZJC2eZ
 CahfXAJJmTFR2CpRA442uOo0a8q++qVpFNXVX7ccyNYvlD67CbJX/YG/WQ8s40Oolj9P
 sZzvwhRLZ2TK4m457pyZjIyq+g9SUYl0QkXlIXjJVqvkPszyocT6m98e/J7g/vAkCDm7
 xTdg==
X-Gm-Message-State: AOAM531axh5aeFbC4ypNKeR2J8AFWD4kvHmAyF8MTns0q4RlV6wXJxTo
 0EG0BKKOv1bmoqjdCadFCZqQ2zQYfTNy5HDYbGxdl/vh6HOBqk0BZtgzq8pinWcaEGVkLWMkE9E
 D5ti7tW0y9y2yf70kgTd//GkCjPiIpu4=
X-Received: by 2002:a05:6512:110d:: with SMTP id
 l13mr36932038lfg.199.1635907842415; 
 Tue, 02 Nov 2021 19:50:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVmfNNx9m7+G0uzOZdJzx6VrT3IeFPXobUCv2QU3ulc++nRO9T7pIPK3N9SMk8CKzxugeGfKkvuDPyyKbWEKA=
X-Received: by 2002:a05:6512:110d:: with SMTP id
 l13mr36932024lfg.199.1635907842192; 
 Tue, 02 Nov 2021 19:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211102114059.1917341-1-eperezma@redhat.com>
 <20211102114059.1917341-2-eperezma@redhat.com>
In-Reply-To: <20211102114059.1917341-2-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 3 Nov 2021 10:50:31 +0800
Message-ID: <CACGkMEuv2csSn6NJAN_mh3yXC4rXXQ8YD4EA9T+WmmeM8Y3R6Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] vhost: Fix last queue index of devices with no cvq
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 2, 2021 at 7:41 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wro=
te:
>
> The -1 assumes that all devices with no cvq have an spare vq allocated
> for them, but with no offer of VIRTIO_NET_F_CTRL_VQ. This is an invalid
> device by the standard, so just stick to the right number of device
> models.
>
> This is not a problem to vhost-net, but it is to vhost-vdpa, which
> device model trust to reach the last index to finish starting the
> device.
>
> Tested with vp_vdpa with host's vhost=3Don and vhost=3Doff.
>
> Fixes: 049eb15b5fc9 ("vhost: record the last virtqueue index for the virt=
io device")
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/net/vhost_net.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 0d888f29a6..a859cc943d 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -329,10 +329,6 @@ int vhost_net_start(VirtIODevice *dev, NetClientStat=
e *ncs,
>      int r, e, i, last_index =3D data_queue_pairs * 2;
>      NetClientState *peer;
>
> -    if (!cvq) {
> -        last_index -=3D 1;
> -    }
> -

So I think the math is wrong at least from the perspective of virtio:
If we had a device with 1 queue pair without cvq, last_index is 2 but
should be 1.

Another thing is that it may break the device with cvq. If we have a
device with 1 queue pair + cvq, last_index is 2.

We will start the device before cvq vhost_net is initialized. Since
for the first vhost_net device (first queue pair) we meet the:

dev->vq_index + dev->nvqs =3D=3D dev->last_index (0 + 2 =3D=3D 2).

Then we set DRIVER_OK before initializing cvq.

Thanks

>      if (!k->set_guest_notifiers) {
>          error_report("binding does not support guest notifiers");
>          return -ENOSYS;
> --
> 2.27.0
>


