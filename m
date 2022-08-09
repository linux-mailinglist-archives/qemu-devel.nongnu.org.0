Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DE958D479
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 09:22:42 +0200 (CEST)
Received: from localhost ([::1]:48182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLJZX-0005cl-VF
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 03:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLJU1-00037j-Uz
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 03:16:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLJTx-0005TW-HR
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 03:16:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660029412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7KH4uuw83YWMBx2jR/lMHgknOi8vZtp8VDOffKr4FMs=;
 b=WkDv3fsAdT3N17kATtSR/8LVu+/B9zQmKUuRgw13i1qHB0GnO5DuEFGMmKLd40Tm/AJ03X
 pRT39w08rRD9S8LI6Do8wbovASvYEDXHC+Ykzg+zQqriAB6Ssn45UuLj2znxK7LyYvkcHb
 3Tf7+fkzI3sVW7F1DJzggRkdZxGl/sw=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-eJzDCBVzNJ69_8lF4R3xrA-1; Tue, 09 Aug 2022 03:16:51 -0400
X-MC-Unique: eJzDCBVzNJ69_8lF4R3xrA-1
Received: by mail-lf1-f70.google.com with SMTP id
 j5-20020ac253a5000000b0048ce9fc0e38so1162292lfh.1
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 00:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7KH4uuw83YWMBx2jR/lMHgknOi8vZtp8VDOffKr4FMs=;
 b=U21bPiEYLEMvNZc3TUeS2Hobu2ziZ7pw9KNjAzOIbXCuJWB1PF4tUKEO5ZYJeKTeTX
 Lj8fsPkypeu2mz4AAj9zZAwy0j2rku0mUjfWdZY7i3ETgVZ5AbDQ39TKhswr682MhUcN
 UD27a1VIbpmFx16Qf+j1+BD4C/ynF1Wu1BkcSD/L7uxRD1J2SrQ6B4D+KCKn5q6NInNv
 iGKqDU6KdLTPaQnkq+PU5EhlHvpJHPGWazS7XnPMCsQrjJ6daMOe+SFnE4o3p7TmTXUx
 J0NS6z2nvIMVns95Gs04Ov/O4aC6eDTVmu39XPLymJIPeTiy2DkcjE/oUrM55dhGTTco
 EGOA==
X-Gm-Message-State: ACgBeo24+pCX+g+7xlrw3kqqL6WiQx+N4lqLi78OPLQeND4OgkvnkU8A
 +KPbWbuXZDVEtuW6m9GPRGeYIMCLSL0bno36G2ihX8bvxGJzebKcStRBTNcfJ0YiabhY7/3OiET
 q1lBBQ8AF8hiZ4QD3Z9LfYDxgzN2V6PA=
X-Received: by 2002:a2e:83c4:0:b0:25d:ea2c:5bc2 with SMTP id
 s4-20020a2e83c4000000b0025dea2c5bc2mr6437303ljh.251.1660029409727; 
 Tue, 09 Aug 2022 00:16:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR65EJ0Vi5rjEY92bTIfW/HNJoI067yv8/3miXp4Reg8Ex22e64nJ0gHAl8BX1CHZL0Bho4KbvO5/BObdcFF6UI=
X-Received: by 2002:a2e:83c4:0:b0:25d:ea2c:5bc2 with SMTP id
 s4-20020a2e83c4000000b0025dea2c5bc2mr6437282ljh.251.1660029409429; Tue, 09
 Aug 2022 00:16:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220804182852.703398-1-eperezma@redhat.com>
 <20220804182852.703398-12-eperezma@redhat.com>
In-Reply-To: <20220804182852.703398-12-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 9 Aug 2022 15:16:38 +0800
Message-ID: <CACGkMEuYuAJ2ZnmRzeO95=Hd8pC_N=YhPnO4KfBW9jV5Tac2Sw@mail.gmail.com>
Subject: Re: [PATCH v7 11/12] vdpa: Add virtio-net mac address via CVQ at start
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Eric Blake <eblake@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Markus Armbruster <armbru@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Eli Cohen <eli@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>
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

On Fri, Aug 5, 2022 at 2:29 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wro=
te:
>
> This is needed so the destination vdpa device see the same state a the
> guest set in the source.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
> v6:
> * Map and unmap command buffers at the start and end of device usage.
>
> v5:
> * Rename s/start/load/
> * Use independent NetClientInfo to only add load callback on cvq.
> ---
>  net/vhost-vdpa.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 10843e6d97..4f1524c2e9 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -363,11 +363,54 @@ static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAStat=
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

Can we build this directly from the cmd_out_buffer?

> +        char *cursor =3D s->cvq_cmd_out_buffer;
> +        ssize_t dev_written;
> +        virtio_net_ctrl_ack state;

I think we can read the status directly from the cmd_in_buffer.

Thanks

> +
> +        memcpy(cursor, &ctrl, sizeof(ctrl));
> +        cursor +=3D sizeof(ctrl);
> +        memcpy(cursor, n->mac, sizeof(n->mac));
> +        cursor +=3D sizeof(n->mac);
> +
> +        dev_written =3D vhost_vdpa_net_cvq_add(s, sizeof(ctrl) + sizeof(=
n->mac),
> +                                             sizeof(state));
> +        if (unlikely(dev_written < 0)) {
> +            return dev_written;
> +        }
> +
> +        memcpy(&state, s->cvq_cmd_in_buffer, sizeof(state));
> +        return state =3D=3D VIRTIO_NET_OK ? 0 : -1;
> +    }
> +
> +    return 0;
> +}
> +
>  static NetClientInfo net_vhost_vdpa_cvq_info =3D {
>      .type =3D NET_CLIENT_DRIVER_VHOST_VDPA,
>      .size =3D sizeof(VhostVDPAState),
>      .receive =3D vhost_vdpa_receive,
>      .prepare =3D vhost_vdpa_net_cvq_prepare,
> +    .load =3D vhost_vdpa_net_load,
>      .stop =3D vhost_vdpa_net_cvq_stop,
>      .cleanup =3D vhost_vdpa_cleanup,
>      .has_vnet_hdr =3D vhost_vdpa_has_vnet_hdr,
> --
> 2.31.1
>


