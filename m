Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AE15A078F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 05:13:26 +0200 (CEST)
Received: from localhost ([::1]:60732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR3J8-0004fz-5V
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 23:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oR3I2-0003FJ-AR
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 23:12:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oR3I0-0004rj-5F
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 23:12:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661397135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ka1VGe3Ww4MWK4s/BAbYieW1q/ioqFfCI25TeoxGBFE=;
 b=VCgSQMn1Tokv85ZepqQbW4m8J5HVBA5Uln11GSsOCCi6lv1pOvxBgv4abY7nUMBXl+Z1oC
 EslKKFnuYgzvK0PqbZszaErNolip6vQRr5w++nQh0OAcLv0lDzdz7wCVe+aA7T/O5tKUNL
 EjuXJN19Ipv73g0TkaaiOMu/Xk3yE4U=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-595-Q01T9xPeOB2-1x1fvI_oUw-1; Wed, 24 Aug 2022 23:12:14 -0400
X-MC-Unique: Q01T9xPeOB2-1x1fvI_oUw-1
Received: by mail-lf1-f72.google.com with SMTP id
 g23-20020ac25397000000b00492e52a1dadso3350271lfh.21
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 20:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=Ka1VGe3Ww4MWK4s/BAbYieW1q/ioqFfCI25TeoxGBFE=;
 b=3nIcVvwHUILEFYgvSjcucupKz6xBdiaIxvXgjWolDBqB4Qt3JJHVA+2PnZyaXQWnoR
 sStgHvUYTb1zPKUgO2XXa0B+0IaRrOWNFNiwQdH1w1XZZavmoTmPEQp+srqgdqzq9FH4
 0rEE+IJQjcQ7Q66+mvBqhKJ1cty+eSawbt0qvAGptJuvirclr1au+Su/UUtF5Y1oLHwv
 Ky/aUhJI4fD0IUAQQ3+MFerNFny3rIP013bmWol2JjnmqASEBmy9i2yE7D17G71Wkn4c
 UQhbxZP3JduDPdCUPw0+nIGWjB7s+MBw6BFkBwP4Ig2R7WTuTp95yZcYt1Pp/jED6jck
 qNxw==
X-Gm-Message-State: ACgBeo3oFot3ouYFrqyISWARK/fp/oEHZ6HEkN9KN9t8vv4JYR4rJX8B
 4EwCHZR9j17Av0pN+2jhVaEy9YVGiTiAnaA2XhcXAOehtYXQdDe2xpJtkwUfYEboz4jJOSsIMZP
 zQGpq47BZggv+qtnDbYsXy+SaSf6QqyA=
X-Received: by 2002:a05:6512:1518:b0:492:d08a:a360 with SMTP id
 bq24-20020a056512151800b00492d08aa360mr585421lfb.238.1661397132725; 
 Wed, 24 Aug 2022 20:12:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5/6GWC6R9O3IW+l06F6MoS/7WWndAkKVzT9HK4AYkZnxp92mbfO3z7iEmCgPaPsHMfb6lxY7JrBUZ4vJjbMxU=
X-Received: by 2002:a05:6512:1518:b0:492:d08a:a360 with SMTP id
 bq24-20020a056512151800b00492d08aa360mr585400lfb.238.1661397132445; Wed, 24
 Aug 2022 20:12:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220824183551.197052-1-eperezma@redhat.com>
 <20220824183551.197052-3-eperezma@redhat.com>
In-Reply-To: <20220824183551.197052-3-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 25 Aug 2022 11:12:01 +0800
Message-ID: <CACGkMEv9zMVj6W3Y1aQ5De65MahDMihKatzaT8tSb_hLbaYmaA@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] vdpa: extract vhost_vdpa_net_load_mac from
 vhost_vdpa_net_load
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Parav Pandit <parav@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Eli Cohen <eli@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Thu, Aug 25, 2022 at 2:36 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Since there may be many commands we need to issue to load the NIC
> state, let's split them in individual functions
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> --
> v2: Add vhost_vdpa_net_load_cmd helper
> ---
>  net/vhost-vdpa.c | 54 ++++++++++++++++++++++++++++++++----------------
>  1 file changed, 36 insertions(+), 18 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 468e460ac2..c89e2262d9 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -365,35 +365,31 @@ static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAStat=
e *s, size_t out_len,
>      return vhost_svq_poll(svq);
>  }
>
> -static int vhost_vdpa_net_load(NetClientState *nc)
> +static ssize_t vhost_vdpa_net_load_cmd(VhostVDPAState *s,
> +                                       const struct virtio_net_ctrl_hdr =
*ctrl,
> +                                       const void *data, size_t data_siz=
e)
>  {
> -    VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> -    const struct vhost_vdpa *v =3D &s->vhost_vdpa;
> -    const VirtIONet *n;
> -    uint64_t features;
> +    assert(data_size < vhost_vdpa_net_cvq_cmd_page_len() - sizeof(*ctrl)=
);
>
> -    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> +    memcpy(s->cvq_cmd_out_buffer, ctrl, sizeof(*ctrl));
> +    memcpy(s->cvq_cmd_out_buffer + sizeof(ctrl), data, data_size);
>
> -    if (!v->shadow_vqs_enabled) {
> -        return 0;
> -    }
> +    return vhost_vdpa_net_cvq_add(s, sizeof(ctrl) + data_size,
> +                                  sizeof(virtio_net_ctrl_ack));
> +}
>
> -    n =3D VIRTIO_NET(v->dev->vdev);
> -    features =3D n->parent_obj.guest_features;
> +static int vhost_vdpa_net_load_mac(VhostVDPAState *s, const VirtIONet *n=
)
> +{
> +    uint64_t features =3D n->parent_obj.guest_features;
>      if (features & BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR)) {
>          const struct virtio_net_ctrl_hdr ctrl =3D {
>              .class =3D VIRTIO_NET_CTRL_MAC,
>              .cmd =3D VIRTIO_NET_CTRL_MAC_ADDR_SET,
>          };
> -        char *cursor =3D s->cvq_cmd_out_buffer;
>          ssize_t dev_written;
>
> -        memcpy(cursor, &ctrl, sizeof(ctrl));
> -        cursor +=3D sizeof(ctrl);
> -        memcpy(cursor, n->mac, sizeof(n->mac));
> -
> -        dev_written =3D vhost_vdpa_net_cvq_add(s, sizeof(ctrl) + sizeof(=
n->mac),
> -                                             sizeof(virtio_net_ctrl_ack)=
);
> +        dev_written =3D vhost_vdpa_net_load_cmd(s, &ctrl, n->mac,
> +                                              sizeof(n->mac));

Patch looks good, if there's another respin, I'd accept class/cmd as
parameter then there's no need for the caller to prepare
virtio_net_ctrl_hdr.

Thanks

>          if (unlikely(dev_written < 0)) {
>              return dev_written;
>          }
> @@ -404,6 +400,28 @@ static int vhost_vdpa_net_load(NetClientState *nc)
>      return 0;
>  }
>
> +static int vhost_vdpa_net_load(NetClientState *nc)
> +{
> +    VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> +    const VirtIONet *n;
> +    int r;
> +
> +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> +
> +    if (!v->shadow_vqs_enabled) {
> +        return 0;
> +    }
> +
> +    n =3D VIRTIO_NET(v->dev->vdev);
> +    r =3D vhost_vdpa_net_load_mac(s, n);
> +    if (unlikely(r < 0)) {
> +        return r;
> +    }
> +
> +    return 0;
> +}
> +
>  static NetClientInfo net_vhost_vdpa_cvq_info =3D {
>      .type =3D NET_CLIENT_DRIVER_VHOST_VDPA,
>      .size =3D sizeof(VhostVDPAState),
> --
> 2.31.1
>


