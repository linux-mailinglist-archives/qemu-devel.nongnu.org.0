Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9E45B2F28
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 08:41:51 +0200 (CEST)
Received: from localhost ([::1]:45196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWXi1-00065C-N5
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 02:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oWXf3-0003TU-TW
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 02:38:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oWXf0-0006LP-Ki
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 02:38:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662705521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=efKY57i4uSxC2GagPfq0vC+FDtZ7C4d/dcl0JVrh8Mc=;
 b=CK1AfcSJQXEeOSeIvALrLDYOYqPSuLjd+jiPv4H0ve4izXUwfumGMRS56i2QWuWgvWVsiM
 uIfO1iepTrvp4gcbWhoGTZ59dUuyaPHvPGtEWNzpynDgsWfw1cgLQlUNSalMXBOWg5wsWT
 77y4Qw2ZgkcjpBP2/GZtCHte1okzumw=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-644-waTMt8KTNCij7u-b3KiiaA-1; Fri, 09 Sep 2022 02:38:40 -0400
X-MC-Unique: waTMt8KTNCij7u-b3KiiaA-1
Received: by mail-vk1-f200.google.com with SMTP id
 200-20020a1f18d1000000b003a0a4957a50so219174vky.10
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 23:38:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=efKY57i4uSxC2GagPfq0vC+FDtZ7C4d/dcl0JVrh8Mc=;
 b=XEEF0BRT/VUd6p1bXY+g5lyW3GHDqDyyjfoViu0FbTWnIV3HMGsWahEeYlNFrna2R8
 6sjJDyBUY0fHkWgxYbODFxxXJ2/c/W7Njj7jsglegApWQ2bKe6evay6pxwRMyivoWU8n
 hpu1nUi9dKLWqXSchkUrINwt0xHy/6PAU6uw7BvqVy2urUOwALDFpEfuVY7NbTftL272
 YBa+nLPohHlpB76QYZ9S9pfWw5PnMJA0QGU3LL2xRIc6NUFBskK0XK8e8b9OVfU90Ljq
 qKBH8iRzo4hvEAG+LK3v8GpINI4DHIglz4NmYcijDcinEDc5pq43wvCsz/xJ2+znUEM6
 qUjA==
X-Gm-Message-State: ACgBeo1wXQTAC7j+HBQyUwZCsHT95f2taOdLfOgmZp4bU9yTPuZ7aZLF
 ethMGKph4pM6XwIIkkiIh7om+2g0M5IoCTVUmxxHImmW1RS0uve4hjP9aI4QbW1QRLWTOVGsaWS
 R7wOFJIhmshHCYc7xD6+OH1JlGjAHIic=
X-Received: by 2002:a1f:2515:0:b0:394:e654:ea55 with SMTP id
 l21-20020a1f2515000000b00394e654ea55mr4383024vkl.3.1662705519763; 
 Thu, 08 Sep 2022 23:38:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5/ZfPQoy/Ku/8DZqK4nzhbYRGCKONEXNE9is/5X/Nuz7jEh13PSSRbAupuGVjGSFc/sjYYYxps6bFmyWP0rwI=
X-Received: by 2002:a1f:2515:0:b0:394:e654:ea55 with SMTP id
 l21-20020a1f2515000000b00394e654ea55mr4383009vkl.3.1662705519513; Thu, 08 Sep
 2022 23:38:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220906163621.1144675-1-eperezma@redhat.com>
 <20220906163621.1144675-3-eperezma@redhat.com>
In-Reply-To: <20220906163621.1144675-3-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 9 Sep 2022 14:38:28 +0800
Message-ID: <CACGkMEvnVavevtxWa49Yew+Nnkx_Wfmgf1JLVXCBe=zkpvdHnQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] vdpa: load vlan configuration at NIC startup
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Cindy Lu <lulu@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Eli Cohen <eli@mellanox.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Laurent Vivier <lvivier@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Wed, Sep 7, 2022 at 12:36 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> To have enabled vlans at device startup may happen in the destination of
> a live migration, so this configuration must be restored.
>
> At this moment the code is not accessible, since SVQ refuses to start if
> vlan feature is exposed by the device.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  net/vhost-vdpa.c | 46 ++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 44 insertions(+), 2 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 4bc3fd01a8..ecbfd08eb9 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -100,6 +100,8 @@ static const uint64_t vdpa_svq_device_features =3D
>      BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
>      BIT_ULL(VIRTIO_NET_F_STANDBY);
>
> +#define MAX_VLAN    (1 << 12)   /* Per 802.1Q definition */
> +
>  VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
>  {
>      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> @@ -423,6 +425,47 @@ static int vhost_vdpa_net_load_mq(VhostVDPAState *s,
>      return *s->status !=3D VIRTIO_NET_OK;
>  }
>
> +static int vhost_vdpa_net_load_single_vlan(VhostVDPAState *s,
> +                                           const VirtIONet *n,
> +                                           uint16_t vid)
> +{
> +    ssize_t dev_written =3D vhost_vdpa_net_load_cmd(s, VIRTIO_NET_CTRL_V=
LAN,
> +                                                  VIRTIO_NET_CTRL_VLAN_A=
DD,
> +                                                  &vid, sizeof(vid));
> +    if (unlikely(dev_written < 0)) {
> +        return dev_written;
> +    }
> +
> +    if (unlikely(*s->status !=3D VIRTIO_NET_OK)) {
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> +
> +static int vhost_vdpa_net_load_vlan(VhostVDPAState *s,
> +                                    const VirtIONet *n)
> +{
> +    uint64_t features =3D n->parent_obj.guest_features;
> +
> +    if (!(features & BIT_ULL(VIRTIO_NET_F_CTRL_VLAN))) {
> +        return 0;
> +    }
> +
> +    for (int i =3D 0; i < MAX_VLAN >> 5; i++) {
> +        for (int j =3D 0; n->vlans[i] && j <=3D 0x1f; j++) {
> +            if (n->vlans[i] & (1U << j)) {
> +                int r =3D vhost_vdpa_net_load_single_vlan(s, n, (i << 5)=
 + j);

This seems to cause a lot of latency if the driver has a lot of vlans.

I wonder if it's simply to let all vlan traffic go by disabling
CTRL_VLAN feature at vDPA layer.

Thanks

> +                if (unlikely(r !=3D 0)) {
> +                    return r;
> +                }
> +            }
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>  static int vhost_vdpa_net_load(NetClientState *nc)
>  {
>      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> @@ -445,8 +488,7 @@ static int vhost_vdpa_net_load(NetClientState *nc)
>      if (unlikely(r)) {
>          return r;
>      }
> -
> -    return 0;
> +    return vhost_vdpa_net_load_vlan(s, n);
>  }
>
>  static NetClientInfo net_vhost_vdpa_cvq_info =3D {
> --
> 2.31.1
>


