Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BEC58E6A4
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 07:12:14 +0200 (CEST)
Received: from localhost ([::1]:38894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLe0r-0008W1-7h
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 01:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLdyT-0005O0-Um
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 01:09:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLdyS-00074E-5o
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 01:09:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660108183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nyB2pd1QRPTHoDufT8LJsVxhD1Mf1UgjZFK2HX7Go6I=;
 b=SQs+HB08Za0R1W+1oY9aB9B89iXsNDstc9+U9b9DIYJ6DW1aMFZmw5JiJUGdgZg2aJ/UI+
 Xfr3uXzlz96LhLNBq+2UOOFEfsoDiJqhJnzCaqRCuWWdtnH+bTMvKPUTlsi6/cRDAvNA/4
 ryDfob6s7fo7opUv67aFZcH9ldp9Z9o=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-0KmXqDsPMPCBJv9Hch02Zw-1; Wed, 10 Aug 2022 01:09:42 -0400
X-MC-Unique: 0KmXqDsPMPCBJv9Hch02Zw-1
Received: by mail-lf1-f71.google.com with SMTP id
 z1-20020a0565120c0100b0048ab2910b13so3147201lfu.23
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 22:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=nyB2pd1QRPTHoDufT8LJsVxhD1Mf1UgjZFK2HX7Go6I=;
 b=qxeu8+nKn/GBYRCRBIJg1x5rJ3V9CmGYCVWFU/8UxCGankqbYKx+uUpfBYILCRbGTT
 6YU5InJp7C2lS50UMF7n+/WeBOmTwtuQ+1hzxDIq96FhW7MszP/scAQtXIOZ3NMR7+AY
 hnU+5zlGz45vSM7Fxga+mxH1ZW4Ix8mjufGDDmlb3VhJ8wCBcShjpeUFdC4pl1MzH1Mo
 ZqqZuXtO/91xopaYT3aY6VwTK8CQTZCWVFP2wg94yshGtvCxrEEmbKnZnGdtAXS0RI84
 v85l6sOm5FMkz1V60l1i8ksuh/6rravPU93YzsH5UhNTHyJEwiSHQuz6Ugvvt24qxV4f
 4FSg==
X-Gm-Message-State: ACgBeo3ARoFxfZ5473MNNwNum/KDfQWIjHAz5SrM3nnx91LfQ4mKkpd8
 q+kaelAGr33yhU/NY4sTEjcBG9hA/LqUF71oG2Jz2K3K9hDBqj/A8TAqNxyaarN4NqC26GNXPrz
 tGhztmuvr4thoQNJlDqRakAYtoAoBPOU=
X-Received: by 2002:ac2:43b0:0:b0:48b:1eb:d1e5 with SMTP id
 t16-20020ac243b0000000b0048b01ebd1e5mr9611356lfl.641.1660108180835; 
 Tue, 09 Aug 2022 22:09:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7Pzaw+Vb/KO0q4jI8T8hCYSW235T2fbRcpcoY5jGyLPYZU58QVg2Ojfsyl3lTl39orh9iJCneRW14GcR7sPvo=
X-Received: by 2002:ac2:43b0:0:b0:48b:1eb:d1e5 with SMTP id
 t16-20020ac243b0000000b0048b01ebd1e5mr9611334lfl.641.1660108180632; Tue, 09
 Aug 2022 22:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220809173926.1695280-1-eperezma@redhat.com>
 <20220809173926.1695280-12-eperezma@redhat.com>
In-Reply-To: <20220809173926.1695280-12-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 10 Aug 2022 13:09:29 +0800
Message-ID: <CACGkMEv0hsLskgOj7LC4NEKEjQ9ssCVLBXE1NTY6g0xzDESD6w@mail.gmail.com>
Subject: Re: [PATCH v8 11/12] vdpa: Add virtio-net mac address via CVQ at start
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Laurent Vivier <lvivier@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 
 Eric Blake <eblake@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eli Cohen <eli@mellanox.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Aug 10, 2022 at 1:40 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> This is needed so the destination vdpa device see the same state a the
> guest set in the source.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
> v8:
> * Delete unneeded copy from device's in buffer.
>
> v6:
> * Map and unmap command buffers at the start and end of device usage.
>
> v5:
> * Rename s/start/load/
> * Use independent NetClientInfo to only add load callback on cvq.
> ---
>  net/vhost-vdpa.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index df85567cff..e775957952 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -363,11 +363,52 @@ static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAStat=
e *s, size_t out_len,
>      return vhost_svq_poll(svq);
>  }
>
> +static int vhost_vdpa_net_load(NetClientState *nc)
> +{
> +    VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> +    VirtIONet *n;
> +    uint64_t features;
> +
> +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> +
> +    if (!v->shadow_vqs_enabled) {
> +        return 0;
> +    }
> +
> +    n =3D VIRTIO_NET(v->dev->vdev);
> +    features =3D v->dev->vdev->host_features;
> +    if (features & BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR)) {
> +        const struct virtio_net_ctrl_hdr ctrl =3D {
> +            .class =3D VIRTIO_NET_CTRL_MAC,
> +            .cmd =3D VIRTIO_NET_CTRL_MAC_ADDR_SET,
> +        };
> +        char *cursor =3D s->cvq_cmd_out_buffer;
> +        ssize_t dev_written;
> +
> +        memcpy(cursor, &ctrl, sizeof(ctrl));
> +        cursor +=3D sizeof(ctrl);
> +        memcpy(cursor, n->mac, sizeof(n->mac));
> +        cursor +=3D sizeof(n->mac);

I'd cast and initialize directly from the cmd_out_buff. But this could
be done on top.

So

Acked-by: Jason Wang <jasowang@redhat.com>


> +
> +        dev_written =3D vhost_vdpa_net_cvq_add(s, sizeof(ctrl) + sizeof(=
n->mac),
> +                                             sizeof(virtio_net_ctrl_ack)=
);
> +        if (unlikely(dev_written < 0)) {
> +            return dev_written;
> +        }
> +
> +        return *((virtio_net_ctrl_ack *)s->cvq_cmd_in_buffer) !=3D VIRTI=
O_NET_OK;
> +    }
> +
> +    return 0;
> +}
> +
>  static NetClientInfo net_vhost_vdpa_cvq_info =3D {
>      .type =3D NET_CLIENT_DRIVER_VHOST_VDPA,
>      .size =3D sizeof(VhostVDPAState),
>      .receive =3D vhost_vdpa_receive,
>      .start =3D vhost_vdpa_net_cvq_start,
> +    .load =3D vhost_vdpa_net_load,
>      .stop =3D vhost_vdpa_net_cvq_stop,
>      .cleanup =3D vhost_vdpa_cleanup,
>      .has_vnet_hdr =3D vhost_vdpa_has_vnet_hdr,
> --
> 2.31.1
>


