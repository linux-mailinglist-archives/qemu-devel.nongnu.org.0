Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 321C7605654
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 06:33:49 +0200 (CEST)
Received: from localhost ([::1]:44940 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olNFc-0000c7-7L
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 00:33:48 -0400
Received: from [::1] (port=52286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olNFc-0000T7-0h
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 00:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1olNCI-0005Nz-62
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 00:30:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1olNCB-0004Fz-UT
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 00:30:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666240212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gny6REvU7PRAQ7dAT7Qo5a9iSc+K3s7v9EwJW1fArB4=;
 b=TB6slQqMuKOVNkQIZ4xkQZBUxBdOboYC7Xf19bz6Jif6BHVqtOIFNZ+F6v8xzirmO5XRM8
 M7B2KNzaqm2PReB7X7RVdcYYrt9JUNl7aM7ZaxmIzmnyntRvLos0RYwRxpoCXH+AulN5vJ
 Re7XbEYIs0+14LGBbwXPKg+8X2u9rKo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-EOUepKxeOWqiH7GZToRPgg-1; Thu, 20 Oct 2022 00:30:10 -0400
X-MC-Unique: EOUepKxeOWqiH7GZToRPgg-1
Received: by mail-ed1-f71.google.com with SMTP id
 l18-20020a056402255200b0045d2674d1a0so12790748edb.0
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 21:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gny6REvU7PRAQ7dAT7Qo5a9iSc+K3s7v9EwJW1fArB4=;
 b=lhXFor/m9/M+RvpRMOy9nf26owph7ruyhuIxcnrOyXfMMgIQ14YwzJ89sWiq4vmm1h
 +eeymVkiZ1i4d4wIIOMqwCcOjeTqZdiXQ1ndzvpjBje/zDGweKBJrVnZS9CAY6bl0P37
 aD8EKUzFtMJ5RgUtn4vnbcI+4pEg6uadnLaD4wNicmnbd+1TvtbiPOBhjiS+rXrO6rmF
 u91AGwjgmiPuhzUh4QzgYAsH1cUpDIEvfHxyzZ7YvdiaMIaFvA1CjRcb6c6I1hZnxb4D
 kpJQwlcmsy9r2HMqHDhfTYFpDZCjb7kZfrarkTgdSYOnVeZQRlYwhVu/Y7s5TNaWxTg3
 u9mA==
X-Gm-Message-State: ACrzQf0ebUZaXCzw03Hh48yzxNpMO0wrDtyMCTg96FYXKgb3EjK1Xjgf
 VXBYCKYwYxDtNi7SDipreP/G1RLYxXR2+wwz/ESYdahMpY/ndtcOZXaJZNClzWxIttQ4SDdyQlW
 9nKuw9weVViaYbzBR/m1TdprGAGAa7LA=
X-Received: by 2002:a17:907:2c5b:b0:78d:3f8a:19d0 with SMTP id
 hf27-20020a1709072c5b00b0078d3f8a19d0mr9205107ejc.369.1666240209769; 
 Wed, 19 Oct 2022 21:30:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4NVpp7rSifHXJFPkfGpWV/sr9hgsfat+Tabe6BJ6GjReqOHvwRX5IfglnETpyDg9G9fLkdsZO+Fj7DrxD976A=
X-Received: by 2002:a17:907:2c5b:b0:78d:3f8a:19d0 with SMTP id
 hf27-20020a1709072c5b00b0078d3f8a19d0mr9205086ejc.369.1666240209547; Wed, 19
 Oct 2022 21:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20221019125210.226291-1-eperezma@redhat.com>
 <20221019125210.226291-4-eperezma@redhat.com>
In-Reply-To: <20221019125210.226291-4-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 20 Oct 2022 12:29:57 +0800
Message-ID: <CACGkMEtTG1YnqtTWs_1feAfdL=m9tiJxGX118fDCTUd2onPnPg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/8] vhost_net: Emulate link state up if backend
 doesn't expose it
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Gautam Dawar <gdawar@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 19, 2022 at 8:52 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> At this moment this code path is not reached, but vdpa devices can offer
> VIRTIO_NET_F_STATUS unconditionally.

So I guess what you mean is that, for the parent that doesn't support
VIRTIO_NET_F_STATUS, emulate one for making sure the ANNOUCNE to work.
This is safe since the spec said the driver will assume the link is
always up if without this feature.

> While the guest must assume that
> link is always up by the standard, qemu will set the status bit to 1
> always in this case.
>
> This makes little use by itself, but VIRTIO_NET_F_STATUS is needed for
> the guest to read status bit VIRTIO_NET_F_GUEST_ANNOUNCE, used by feature
> VIRTIO_NET_F_GUEST_ANNOUNCE. So qemu must emulate status feature in case
> it needs to emulate the guest announce feature.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/net/vhost_net.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index d28f8b974b..5660606c1d 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -117,7 +117,32 @@ uint64_t vhost_net_get_features(struct vhost_net *ne=
t, uint64_t features)
>  int vhost_net_get_config(struct vhost_net *net,  uint8_t *config,
>                           uint32_t config_len)
>  {
> -    return vhost_dev_get_config(&net->dev, config, config_len, NULL);
> +    VirtIODevice *vdev;
> +    int r =3D vhost_dev_get_config(&net->dev, config, config_len, NULL);
> +
> +    if (unlikely(r !=3D 0)) {
> +        return r;
> +    }
> +
> +    if (config_len < endof(struct virtio_net_config, status)) {
> +        return 0;
> +    }
> +
> +    /*
> +     * TODO: Perform this only if vhost_vdpa.
> +     */

Cindy adds some mediation codes for vhost-vDPA in
virtio_net_get_config(), so I believe it can be done there?

Thanks

> +    vdev =3D net->dev.vdev;
> +    if (!vdev) {
> +        /* Device is starting */
> +        return 0;
> +    }
> +
> +    if ((net->dev.acked_features & BIT_ULL(VIRTIO_NET_F_STATUS)) &&
> +        !(net->dev.features & BIT_ULL(VIRTIO_NET_F_STATUS))) {
> +        ((struct virtio_net_config *)config)->status |=3D VIRTIO_NET_S_L=
INK_UP;
> +    }
> +
> +    return 0;
>  }
>  int vhost_net_set_config(struct vhost_net *net, const uint8_t *data,
>                           uint32_t offset, uint32_t size, uint32_t flags)
> --
> 2.31.1
>


