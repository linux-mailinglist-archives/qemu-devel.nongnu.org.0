Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FFD577E0B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 10:56:33 +0200 (CEST)
Received: from localhost ([::1]:48806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDMYK-0003gZ-LL
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 04:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDMSX-0003sk-9Z
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 04:50:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDMST-0002AX-No
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 04:50:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658134228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GKGJYNqFjciIYfg0X6yvtoWgzJiCTGcDyWULwjUtkOc=;
 b=BgRaLLyRN85xtuwrzOir9ND13yr2M+b4TXUwB8seGwHTY5wBh8HIUdMsQqJ8nRx9NuU9uz
 M8MBacLiGwkTD9a2v44quhcHCFZNRSvkTX7nadFapNdDXTnX3LNiySQ1ddbumphngUwA4F
 1JAFiaByCWXjaAXWUxbRNJKsTlJLkhM=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-Z0kbOCheMmqEd5pLc3gJQQ-1; Mon, 18 Jul 2022 04:50:26 -0400
X-MC-Unique: Z0kbOCheMmqEd5pLc3gJQQ-1
Received: by mail-lf1-f70.google.com with SMTP id
 g3-20020a05651222c300b00489fe30ee90so4030355lfu.20
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 01:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GKGJYNqFjciIYfg0X6yvtoWgzJiCTGcDyWULwjUtkOc=;
 b=TOTkyf6MYw34PP0uq5ZktxnudN66FSR3/459gbHYXjkEjdV2s6c9aNyyprmMxcf4Mq
 6qy/P5oGhpty008kBJnrhUK1y8XFabtF8LPehIhAgMCjThFgre3mpxZ9ctMV5Ty1KFj9
 Nl02zoeHwdAYJ8PLNkxkYLU6+fZHHKeNJOkHNTOwUU6v/aHlDvhRLu0M0ENRdVCT68O6
 Xr7mq51BckIq37yAA5gVVvqzhSBit8FLgJRe6llRUWWS5yHl5fwuii+LpvPbMGLMRGAE
 8au+k4zWEw72xTMMdurgsQO6ydjZNt8sYqp2Uu2oU/+1qHxLYlZWnimoTtnLYhmrxHso
 1ceg==
X-Gm-Message-State: AJIora8QlVTHu3HHG7rB9uWL6zAEE3A0ytW9+x/Xtg2HcyK+kL39Fkg8
 6nQgCUeZG6clho6uxg0JPY5QHz6Sw1ZAa54YMFItUBhm4jV+XSUy2eiLQ2nNJtm1ZLBfeYlwv9X
 bwva/jSy9vznH7tDnbvLCLZAayPYkKOc=
X-Received: by 2002:a05:6512:3c95:b0:48a:3d1:9df with SMTP id
 h21-20020a0565123c9500b0048a03d109dfmr15016470lfv.641.1658134225455; 
 Mon, 18 Jul 2022 01:50:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vJSWG3zVPipKleP4DejysRRjAfVZJjIbCvU3v1phKTSxnZzsDQ0GrTZKOoQ9BViGFwQ4QHRBa8F3+7UNJOmdc=
X-Received: by 2002:a05:6512:3c95:b0:48a:3d1:9df with SMTP id
 h21-20020a0565123c9500b0048a03d109dfmr15016444lfv.641.1658134225169; Mon, 18
 Jul 2022 01:50:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220716113407.2730331-1-eperezma@redhat.com>
 <20220716113407.2730331-8-eperezma@redhat.com>
In-Reply-To: <20220716113407.2730331-8-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 18 Jul 2022 16:50:14 +0800
Message-ID: <CACGkMEsUMtY-8suaPVQMm=H3ckWVNFhFFj4=5su_wjHq7mjqPA@mail.gmail.com>
Subject: Re: [RFC PATCH 07/12] vhost: Add VhostVDPAStartOp operation
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
> It allows to run commands at start of the device, before it have enabled
> any queue.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost-shadow-virtqueue.h | 3 +++
>  include/hw/virtio/vhost-vdpa.h     | 5 +++++
>  hw/virtio/vhost-vdpa.c             | 8 ++++++++
>  3 files changed, 16 insertions(+)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-=
virtqueue.h
> index 03eb7ff670..210fe393cd 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -26,6 +26,8 @@ typedef struct SVQDescState {
>  } SVQDescState;
>
>  typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> +typedef int (*ShadowVirtQueueStart)(VhostShadowVirtqueue *svq,
> +                                    void *opaque);
>
>  /**
>   * Callback to handle an avail buffer.
> @@ -43,6 +45,7 @@ typedef int (*VirtQueueAvailCallback)(VhostShadowVirtqu=
eue *svq,
>                                        void *vq_callback_opaque);
>
>  typedef struct VhostShadowVirtqueueOps {
> +    ShadowVirtQueueStart start;

What's the difference between this and start_op?

Thanks

>      VirtQueueAvailCallback avail_handler;
>  } VhostShadowVirtqueueOps;
>
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdp=
a.h
> index d10a89303e..b7d18b4e30 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -24,6 +24,10 @@ typedef struct VhostVDPAHostNotifier {
>      void *addr;
>  } VhostVDPAHostNotifier;
>
> +struct vhost_vdpa;
> +/* Called after send DRIVER_OK but after enabling vrings */
> +typedef int (*VhostVDPAStartOp)(struct vhost_vdpa *v);
> +
>  typedef struct vhost_vdpa {
>      int device_fd;
>      int index;
> @@ -39,6 +43,7 @@ typedef struct vhost_vdpa {
>      GPtrArray *shadow_vqs;
>      const VhostShadowVirtqueueOps *shadow_vq_ops;
>      void *shadow_vq_ops_opaque;
> +    VhostVDPAStartOp start_op;
>      struct vhost_dev *dev;
>      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
>  } VhostVDPA;
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 1d8829c619..48f031b8c0 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -1136,6 +1136,14 @@ static int vhost_vdpa_dev_start(struct vhost_dev *=
dev, bool started)
>          if (unlikely(r)) {
>              return r;
>          }
> +
> +        if (v->start_op) {
> +            r =3D v->start_op(v);
> +            if (unlikely(r)) {
> +                return r;
> +            }
> +        }
> +
>          vhost_vdpa_set_vring_ready(dev);
>      } else {
>          vhost_vdpa_reset_device(dev);
> --
> 2.31.1
>


