Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8469B577AA3
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 07:53:26 +0200 (CEST)
Received: from localhost ([::1]:51934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDJh7-0006IZ-Gz
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 01:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDJe4-0003sk-36
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 01:50:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDJe2-0001m4-By
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 01:50:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658123413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hqgL+D7yS7ByLa5SpsdZBWiJe+YhHJTpVrSKApH9qfk=;
 b=FRic63bYIbvkx/Zy1U90a4AkUPnqhHQ29YXXSCFwLr3s11Eqk2O7ghPMq+hRtTJuN3xtBZ
 OkDgY8a6QfIRY1ILYSPqOkbIewTd9ErBvnYPKxpO4Tj2CUDBqecCzx/+3IXPG2VuTvixRy
 tBgbCCCMKzRZ0kZ05iWDvqm7dMPNS04=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-_v7joNj5PQyXa8s9KC5xYQ-1; Mon, 18 Jul 2022 01:50:12 -0400
X-MC-Unique: _v7joNj5PQyXa8s9KC5xYQ-1
Received: by mail-lj1-f200.google.com with SMTP id
 g3-20020a2e9cc3000000b00253cc2b5ab5so1734446ljj.19
 for <qemu-devel@nongnu.org>; Sun, 17 Jul 2022 22:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hqgL+D7yS7ByLa5SpsdZBWiJe+YhHJTpVrSKApH9qfk=;
 b=S9Z4GUaYooESMutM4Yisdd3SV2/fToHBTpXru2A42hj/xXXv5D7QHilijjexMGhKvR
 iHFcU3hLYeDKubPhVd4YOz9xwjI74KGp3ms+xDoKb/TjUfW2CEuydMj5DYt64Yu/O7+f
 z0gXrh8KIJYV8LlsdNr37gY954NIjn2VkiFvgnBoUxw+kHPjsAyunumkFBvUScB+V9S3
 41qda4sZHobFL8QCUKeKDYm16YFB6aW/EbgYZxg13iUdEbBWsQ05HlBF5qQc5XXsqhfg
 Pb19+XHRZrzUW9WKDDW4iCkeNJnJQcwUnObSQv3MLhGeRp5MXC6ih3/pS+kxbIWXxZrQ
 BUIg==
X-Gm-Message-State: AJIora88ythTkVi4XJRIc97P3zXTURzoSw12eTEGpcNRsndy1ZIatEw2
 V0cw1/IRozlgqHmCS+td+Ewd2l5s7u/W+5A5ibPNPTDHG2H6g/Zwx/vjiahUZcInQ02e0XN7TkC
 74rB7x6TRW9myAU9SrAqkJwg5A846pZE=
X-Received: by 2002:ac2:50d1:0:b0:489:fb36:cde1 with SMTP id
 h17-20020ac250d1000000b00489fb36cde1mr13216120lfm.411.1658123410814; 
 Sun, 17 Jul 2022 22:50:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1spcIWuYLI+qxVc22+Zh0KCNbhdR8EgTVXIBglJlMKZgajilBDAutXSqUaYvG6ZLtR+3cp55YdIXsgVJfdThUc=
X-Received: by 2002:ac2:50d1:0:b0:489:fb36:cde1 with SMTP id
 h17-20020ac250d1000000b00489fb36cde1mr13216114lfm.411.1658123410638; Sun, 17
 Jul 2022 22:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220716113407.2730331-1-eperezma@redhat.com>
 <20220716113407.2730331-3-eperezma@redhat.com>
In-Reply-To: <20220716113407.2730331-3-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 18 Jul 2022 13:49:59 +0800
Message-ID: <CACGkMEvXgWWwrPLTWW7TCRH7z+dg2rn4kK3WbPBCTWHQpcZoTw@mail.gmail.com>
Subject: Re: [RFC PATCH 02/12] vhost: Move SVQ queue rewind to the destination
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eli Cohen <eli@mellanox.com>, 
 Parav Pandit <parav@mellanox.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Gautam Dawar <gdawar@xilinx.com>
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

On Sat, Jul 16, 2022 at 7:34 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Migration with SVQ already migrate the inflight descriptors,

How is this done?

> so the
> destination can perform the work.
>
> This makes easier to migrate between backends or to recover them in
> vhost devices that support set in flight descriptors.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost-vdpa.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 18820498b3..4458c8d23e 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -1178,7 +1178,18 @@ static int vhost_vdpa_set_vring_base(struct vhost_=
dev *dev,
>                                         struct vhost_vring_state *ring)
>  {
>      struct vhost_vdpa *v =3D dev->opaque;
> +    VirtQueue *vq =3D virtio_get_queue(dev->vdev, ring->index);
>
> +    /*
> +     * vhost-vdpa devices does not support in-flight requests. Set all o=
f them
> +     * as available.
> +     *
> +     * TODO: This is ok for networking, but other kinds of devices might
> +     * have problems with these retransmissions.
> +     */
> +    while (virtqueue_rewind(vq, 1)) {
> +        continue;
> +    }
>      if (v->shadow_vqs_enabled) {
>          /*
>           * Device vring base was set at device start. SVQ base is handle=
d by
> @@ -1197,19 +1208,6 @@ static int vhost_vdpa_get_vring_base(struct vhost_=
dev *dev,
>      int ret;
>
>      if (v->shadow_vqs_enabled) {
> -        VirtQueue *vq =3D virtio_get_queue(dev->vdev, ring->index);
> -
> -        /*
> -         * Setting base as last used idx, so destination will see as ava=
ilable
> -         * all the entries that the device did not use, including the in=
-flight
> -         * processing ones.
> -         *
> -         * TODO: This is ok for networking, but other kinds of devices m=
ight
> -         * have problems with these retransmissions.
> -         */
> -        while (virtqueue_rewind(vq, 1)) {
> -            continue;
> -        }

I think it's not a good idea to partially revert the code that was
just introduced in the previous patch (unless it can be backported to
-stable independently).

We probably need to squash the changes.

Thanks

>          ring->num =3D virtio_queue_get_last_avail_idx(dev->vdev, ring->i=
ndex);
>          return 0;
>      }
> --
> 2.31.1
>


