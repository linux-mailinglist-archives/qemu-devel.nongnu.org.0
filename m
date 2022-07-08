Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E4956B512
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 11:09:03 +0200 (CEST)
Received: from localhost ([::1]:42626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9jyw-0000JQ-8Q
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 05:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o9jwy-0007Vz-8c
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 05:07:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o9jwu-00009d-89
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 05:06:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657271213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S8r5Q0y4sPPCiX0G/3c0bzO8BdE/+PrL7qk2UDyAxqU=;
 b=DxdxMDuBJsaW+l+wNu0IWYxrUEONao/V5MZBpm/JLq/bsF4LhbF9xsuKjMcKrVflYIafkf
 RPSsaxIfK+8xAEQTsFbPg3mDsm0cjDs/A5DAwLkmkOCAbhe4lRfFAv3xyltuQHRVC24Cxk
 YNkzFE8xQecK39EKs/CKguyoUEAs21k=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-a8sI1FDVPoCbAW35B-MJwQ-1; Fri, 08 Jul 2022 05:06:46 -0400
X-MC-Unique: a8sI1FDVPoCbAW35B-MJwQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 u10-20020a2e9b0a000000b0025d2a397f12so3265391lji.15
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 02:06:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=S8r5Q0y4sPPCiX0G/3c0bzO8BdE/+PrL7qk2UDyAxqU=;
 b=UgKY5N66G/SZCfU9kdztZzGMFOAVVQKLfOLerH/WhjLBro7Oo4EVGtUn/isDHNaMUS
 gSJtN0PJa4UaQTb8sKpiDj1mPbFZ7eYrCNO3UZ8+pQLLPbh4B0z/WI+mk4bA0GaWhgBj
 kF/0tivtWtWvP01XTQ3w5CnFHsNMwkGPaXj0BbGOF1VMsKI3E/9c86G1VXTJPeXZxEH0
 RxiEBfRLcJ2VVVa8EBJ1sqPEl1z8d3UpMRqYcUcA37PYOGlQQDZ1TKJ/AwimZAq3itSb
 +ubcniyQ8bDbTnbwptT++cFBbGAc0FNnjJaQUGNTTd8kkm507FRMXsYXuyttQ+bP9arH
 dBaQ==
X-Gm-Message-State: AJIora/PxweAZoM+4OdhnhJ7y8Fj4icUro/1WCvRB1tfNQDFFx7hEY08
 4wAGgku61lHAPNMYB174giqWo1p8Z0gXAG/k9Usf9x0pP1HHRo6uw+Od6ZAImKLF8bptytupz0U
 Tr435UgwTuMKmb+Dk99zjGC+qYMc3llQ=
X-Received: by 2002:a2e:9043:0:b0:25d:1ba8:5b59 with SMTP id
 n3-20020a2e9043000000b0025d1ba85b59mr1352178ljg.496.1657271204732; 
 Fri, 08 Jul 2022 02:06:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v3f0Ic5eTw1kEHPBijhDTMWYg4vTDzA0exTpoyUVr/bKgrR876ShO0X0xq0v8AuuOdLqB4L86QzNovsE2LfaA=
X-Received: by 2002:a2e:9043:0:b0:25d:1ba8:5b59 with SMTP id
 n3-20020a2e9043000000b0025d1ba85b59mr1352158ljg.496.1657271204465; Fri, 08
 Jul 2022 02:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-4-eperezma@redhat.com>
In-Reply-To: <20220706184008.1649478-4-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 8 Jul 2022 17:06:33 +0800
Message-ID: <CACGkMEv361=0fJY-x2=xARkDKYWgZcAUrQD=jds=m30GvPzR_g@mail.gmail.com>
Subject: Re: [RFC PATCH v9 03/23] vdpa: delay set_vring_ready after DRIVER_OK
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
> To restore the device in the destination of a live migration we send the
> commands through control virtqueue. For a device to read CVQ it must
> have received DRIVER_OK status bit.
>
> However this open a window where the device could start receiving
> packets in rx queue 0 before it receive the RSS configuration. To avoid
> that, we will not send vring_enable until all configuration is used by
> the device.
>
> As a first step, reverse the DRIVER_OK and SET_VRING_ENABLE steps.

I wonder if it's better to delay this to the series that implements
migration since the shadow cvq doesn't depends on this?

>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost-vdpa.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 66f054a12c..2ee8009594 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -728,13 +728,18 @@ static int vhost_vdpa_get_vq_index(struct vhost_dev=
 *dev, int idx)
>      return idx;
>  }
>
> +/**
> + * Set ready all vring of the device
> + *
> + * @dev: Vhost device
> + */
>  static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
>  {
>      int i;
>      trace_vhost_vdpa_set_vring_ready(dev);
> -    for (i =3D 0; i < dev->nvqs; ++i) {
> +    for (i =3D 0; i < dev->vq_index_end; ++i) {
>          struct vhost_vring_state state =3D {
> -            .index =3D dev->vq_index + i,
> +            .index =3D i,

Looks like a cleanup or bugfix which deserves a separate patch?

>              .num =3D 1,
>          };
>          vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
> @@ -1097,7 +1102,6 @@ static int vhost_vdpa_dev_start(struct vhost_dev *d=
ev, bool started)
>          if (unlikely(!ok)) {
>              return -1;
>          }
> -        vhost_vdpa_set_vring_ready(dev);
>      } else {
>          ok =3D vhost_vdpa_svqs_stop(dev);
>          if (unlikely(!ok)) {
> @@ -1111,16 +1115,22 @@ static int vhost_vdpa_dev_start(struct vhost_dev =
*dev, bool started)
>      }
>
>      if (started) {
> +        int r;
> +
>          memory_listener_register(&v->listener, &address_space_memory);
> -        return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> +        r =3D vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> +        if (unlikely(r)) {
> +            return r;
> +        }
> +        vhost_vdpa_set_vring_ready(dev);

Interesting, does this mean we only enable the last two queues without
this patch?

Thanks

>      } else {
>          vhost_vdpa_reset_device(dev);
>          vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>                                     VIRTIO_CONFIG_S_DRIVER);
>          memory_listener_unregister(&v->listener);
> -
> -        return 0;
>      }
> +
> +    return 0;
>  }
>
>  static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
> --
> 2.31.1
>


