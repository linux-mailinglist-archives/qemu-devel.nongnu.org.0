Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 989D056B526
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 11:14:16 +0200 (CEST)
Received: from localhost ([::1]:47058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9k3z-0003vK-OU
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 05:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o9k2d-0003Fy-P5
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 05:12:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o9k2b-00011y-Vu
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 05:12:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657271569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NOv4bRDuA5IrkgXZCncFaxVhd+zuqwplpis+ihnXhKU=;
 b=G28/a97IUnpwpi4TtaDWp8Tn9tixfZ4866jFmJ7Ophk1wqBzlBnIinm9buRioRub3mGXpO
 ReAgs0Wk209j/0UVqwtXmf7lqBGm2BPuJKZ+2RLE60G1QQ2WPT1ROooMQurPMHFE2kNYX4
 n2+YTCbgPD41pWK6EdC16g4eFhdHiuI=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-zalTG-9_OBOzzycxOy66fw-1; Fri, 08 Jul 2022 05:12:48 -0400
X-MC-Unique: zalTG-9_OBOzzycxOy66fw-1
Received: by mail-lj1-f199.google.com with SMTP id
 y8-20020a2eb008000000b0025bf6ec0c6cso5863348ljk.20
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 02:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NOv4bRDuA5IrkgXZCncFaxVhd+zuqwplpis+ihnXhKU=;
 b=CNTqstoj7H3VQHu5qjL6TlNstHsBYaaxrWist5Z7h4a1R/hCIiMIjgi8Fqc6vSVN+2
 38hq40iVDw5+eG33Bu5r8inIuB1N8X/t99/mMnuBZMtlZbQmRVnsoI/RF0nssEesapER
 cLmWCam3h8vD0OCCxp6TnnOzuElNPXwaZtp39VlUDNZPfdGuVTyoy6bHF62rHGvgYrAb
 Wg4vyN8yzLjRlG7GgR2s8qroJkE+648wt8Gy5igHD/yOdHSWCouHWhnIK9tciuweFJ+g
 is4+r4vK1zUjjKtXn4rE7ZLQ9XGXjLT08lDh6ixELwmvAK/ZQiOufIoPo2xuRbLsZDD2
 Q81w==
X-Gm-Message-State: AJIora+zgwj2Cb89j0nrhJlixm2cix7TLOT6G0XtTXXbYoDWr3M/fPwq
 CrqV5cSkiWRiFgLGC2C6Lu24f1lwffBU8wVu4faffoWYzlASqIxESwAWt7aUzh1eSdM2/VY32do
 9zM/fjT60EbiUu0q22Lw2qiSD74JIH9c=
X-Received: by 2002:a05:6512:b0d:b0:481:5cb4:cf1e with SMTP id
 w13-20020a0565120b0d00b004815cb4cf1emr1638390lfu.442.1657271566624; 
 Fri, 08 Jul 2022 02:12:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vIYPlT2/w52hTYdp2O2p3cNwSjJmKLmZ+Qo93DRAQrYiZQtkFYSOaO9yeL5EEROk3Qz3p6zi7bS6AgIfbtLkc=
X-Received: by 2002:a05:6512:b0d:b0:481:5cb4:cf1e with SMTP id
 w13-20020a0565120b0d00b004815cb4cf1emr1638366lfu.442.1657271566385; Fri, 08
 Jul 2022 02:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-5-eperezma@redhat.com>
In-Reply-To: <20220706184008.1649478-5-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 8 Jul 2022 17:12:34 +0800
Message-ID: <CACGkMEv660pXKK9-E+eLhph_Pq346PVELVEryg=MKNtB0BL5eg@mail.gmail.com>
Subject: Re: [RFC PATCH v9 04/23] vhost: Get vring base from vq, not svq
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eric Blake <eblake@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
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

On Thu, Jul 7, 2022 at 2:40 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wro=
te:
>
> The used idx used to match with this, but it will not match from the
> moment we introduce svq_inject.

It might be better to explain what "svq_inject" means here.

> Rewind all the descriptors not used by
> vdpa device and get the vq state properly.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  include/hw/virtio/virtio.h | 1 +
>  hw/virtio/vhost-vdpa.c     | 7 +++----
>  hw/virtio/virtio.c         | 5 +++++
>  3 files changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index db1c0ddf6b..4b51ab9d06 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -302,6 +302,7 @@ hwaddr virtio_queue_get_desc_size(VirtIODevice *vdev,=
 int n);
>  hwaddr virtio_queue_get_avail_size(VirtIODevice *vdev, int n);
>  hwaddr virtio_queue_get_used_size(VirtIODevice *vdev, int n);
>  unsigned int virtio_queue_get_last_avail_idx(VirtIODevice *vdev, int n);
> +unsigned int virtio_queue_get_in_use(const VirtQueue *vq);
>  void virtio_queue_set_last_avail_idx(VirtIODevice *vdev, int n,
>                                       unsigned int idx);
>  void virtio_queue_restore_last_avail_idx(VirtIODevice *vdev, int n);
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 2ee8009594..de76128030 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -1189,12 +1189,10 @@ static int vhost_vdpa_get_vring_base(struct vhost=
_dev *dev,
>                                         struct vhost_vring_state *ring)
>  {
>      struct vhost_vdpa *v =3D dev->opaque;
> -    int vdpa_idx =3D ring->index - dev->vq_index;
>      int ret;
>
>      if (v->shadow_vqs_enabled) {
> -        VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs, v=
dpa_idx);
> -
> +        const VirtQueue *vq =3D virtio_get_queue(dev->vdev, ring->index)=
;
>          /*
>           * Setting base as last used idx, so destination will see as ava=
ilable
>           * all the entries that the device did not use, including the in=
-flight
> @@ -1203,7 +1201,8 @@ static int vhost_vdpa_get_vring_base(struct vhost_d=
ev *dev,
>           * TODO: This is ok for networking, but other kinds of devices m=
ight
>           * have problems with these retransmissions.
>           */
> -        ring->num =3D svq->last_used_idx;
> +        ring->num =3D virtio_queue_get_last_avail_idx(dev->vdev, ring->i=
ndex) -
> +                    virtio_queue_get_in_use(vq);

I think we need to change the above comment as well otherwise readers
might get confused.

I wonder why we need to bother at this time. Is this an issue for
networking devices? And for block device, it's not sufficient since
there's no guarantee that the descriptor is handled in order?

Thanks

>          return 0;
>      }
>
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 5d607aeaa0..e02656f7a2 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -3420,6 +3420,11 @@ unsigned int virtio_queue_get_last_avail_idx(VirtI=
ODevice *vdev, int n)
>      }
>  }
>
> +unsigned int virtio_queue_get_in_use(const VirtQueue *vq)
> +{
> +    return vq->inuse;
> +}
> +
>  static void virtio_queue_packed_set_last_avail_idx(VirtIODevice *vdev,
>                                                     int n, unsigned int i=
dx)
>  {
> --
> 2.31.1
>


