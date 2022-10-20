Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE8B605651
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 06:28:39 +0200 (CEST)
Received: from localhost ([::1]:47040 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olNAd-0004oG-1o
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 00:28:39 -0400
Received: from [::1] (port=53038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olNAc-0004WZ-RF
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 00:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1olN5L-0006Wo-Uk
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 00:23:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1olN5J-0002s9-Vy
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 00:23:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666239788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZHTdFhBVfTM5koLYUdvW3kXx9RGJ288B8/L4MH9FyYs=;
 b=OY6mKef1KPdRjfQGbtA8SDJZTGICSCMzQEiAbA7oIS/Zkz8bcDXs7lsBSHXL0mYWYayRts
 fIKSL+DthQoNlGBDpAWaOJNoilOMbB7BxFYqGtOUbgHIEsTWHBzcmfn1f3pQ+asHxlhOay
 0fmovvxZBR/IhgNAo0o2zMAIs8Hg/AE=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-VkqyYmCdOt6oPl62xYBd1g-1; Thu, 20 Oct 2022 00:23:07 -0400
X-MC-Unique: VkqyYmCdOt6oPl62xYBd1g-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-13237320c16so9104155fac.16
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 21:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZHTdFhBVfTM5koLYUdvW3kXx9RGJ288B8/L4MH9FyYs=;
 b=FNozI4ViUwr6kEc1J5HrzAqNMQs48XJyS+Evle2mnMb4nOf0zu8G2a8ITPnhC4i5wX
 W4PcPIPBmx05DrZrghbJK+KWc3Pn3+QZxCLJRY0QXcO95JkrTVBLU8PhTS1J20zo1X0w
 x2pWmIWDfRTUL1KgM5mt8on9emxFsOQTHDu1al+HqyLNkYrEbzEKbxCaXiQ6COCTSELj
 PD/X6XQi7GXBWp4f8HrByWEAmLFmtUWW8byF6XpWNLR4bgEuUKEoBDo5IJNOgEuznzm6
 ZhGcFRtQCeRoUmbchJk/4p+looZAf4UBwzXcYaWTpeAKWwnAj8qf+ktsfZqxI0Qm9GNn
 Lajw==
X-Gm-Message-State: ACrzQf26NimMF1RjRPJnf5vQlL8yZQD9zs0XejSLKMKihN+OY9x0ZBSS
 p3sAas/g69Ct2R5uxcC+wvd4raWLPkPkHU3PIEUYBloKuLfM+hjyt3Erjnvhp7uf559PUtMrb6A
 QFSKgZECZZ0OQsif25e14rSrEa1aXiPY=
X-Received: by 2002:a05:6808:1483:b0:354:a36e:5b with SMTP id
 e3-20020a056808148300b00354a36e005bmr20059239oiw.35.1666239781833; 
 Wed, 19 Oct 2022 21:23:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5GAeLz3wMjZtY94Zrp01tB+AKjmmXh2gd2s0lHokjkqx4s14IGVcRHIEtth8NaHUs8JOUsWFNhj0N3Ij2d1Mo=
X-Received: by 2002:a05:6808:1483:b0:354:a36e:5b with SMTP id
 e3-20020a056808148300b00354a36e005bmr20059220oiw.35.1666239781638; Wed, 19
 Oct 2022 21:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <20221019125210.226291-1-eperezma@redhat.com>
 <20221019125210.226291-3-eperezma@redhat.com>
In-Reply-To: <20221019125210.226291-3-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 20 Oct 2022 12:22:50 +0800
Message-ID: <CACGkMEvQOksFuE37SCCW+4x=Ku5CfHpcbgCDq6tic_H5fW7hYw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/8] vdpa: Save emulated features list in vhost_vdpa
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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
> At this moment only _F_LOG is added there.
>
> However future patches add features that depend on the kind of device.
> In particular, only net devices can add VIRTIO_F_GUEST_ANNOUNCE. So
> let's allow vhost_vdpa creator to set custom emulated device features.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  include/hw/virtio/vhost-vdpa.h | 2 ++
>  hw/virtio/vhost-vdpa.c         | 8 ++++----
>  net/vhost-vdpa.c               | 4 ++++
>  3 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdp=
a.h
> index 1111d85643..50083e1e3b 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -31,6 +31,8 @@ typedef struct vhost_vdpa {
>      bool iotlb_batch_begin_sent;
>      MemoryListener listener;
>      struct vhost_vdpa_iova_range iova_range;
> +    /* VirtIO device features that can be emulated by qemu */
> +    uint64_t added_features;

Any reason we need a per vhost_vdpa storage for this? Or is there a
chance that this field could be different among the devices?

Thanks

>      uint64_t acked_features;
>      bool shadow_vqs_enabled;
>      /* IOVA mapping used by the Shadow Virtqueue */
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 7468e44b87..ddb5e29288 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -660,8 +660,8 @@ static int vhost_vdpa_set_features(struct vhost_dev *=
dev,
>
>          v->acked_features =3D features;
>
> -        /* We must not ack _F_LOG if SVQ is enabled */
> -        features &=3D ~BIT_ULL(VHOST_F_LOG_ALL);
> +        /* Do not ack features emulated by qemu */
> +        features &=3D ~v->added_features;
>      }
>
>      trace_vhost_vdpa_set_features(dev, features);
> @@ -1244,8 +1244,8 @@ static int vhost_vdpa_get_features(struct vhost_dev=
 *dev,
>      int ret =3D vhost_vdpa_get_dev_features(dev, features);
>
>      if (ret =3D=3D 0 && v->shadow_vqs_enabled) {
> -        /* Add SVQ logging capabilities */
> -        *features |=3D BIT_ULL(VHOST_F_LOG_ALL);
> +        /* Add emulated capabilities */
> +        *features |=3D v->added_features;
>      }
>
>      return ret;
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index eebf29f5c1..3803452800 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -599,6 +599,10 @@ static NetClientState *net_vhost_vdpa_init(NetClient=
State *peer,
>      s->vhost_vdpa.index =3D queue_pair_index;
>      s->vhost_vdpa.shadow_vqs_enabled =3D svq;
>      s->vhost_vdpa.iova_tree =3D iova_tree;
> +    if (svq) {
> +        /* Add SVQ logging capabilities */
> +        s->vhost_vdpa.added_features |=3D BIT_ULL(VHOST_F_LOG_ALL);
> +    }
>      if (!is_datapath) {
>          s->cvq_cmd_out_buffer =3D qemu_memalign(qemu_real_host_page_size=
(),
>                                              vhost_vdpa_net_cvq_cmd_page_=
len());
> --
> 2.31.1
>


