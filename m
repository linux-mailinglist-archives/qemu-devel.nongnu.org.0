Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB1E60564F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 06:26:43 +0200 (CEST)
Received: from localhost ([::1]:37132 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olN8g-0001yt-Lj
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 00:26:40 -0400
Received: from [::1] (port=53466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olN5x-0006mo-RY
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 00:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1olN3C-0003Oq-Jm
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 00:20:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1olN35-0002ZV-Ua
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 00:20:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666239650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HRwknnRdMaoHSQY6sRLpLp4XC0Xvzj2ZxLBdLyalJRA=;
 b=UJdLoFGGzMiMy+5dNMxv0BG6lhwOiVoNPyUobve/aZLoGC58HukOVphjyHngvBG8G2Cmj8
 lB/lqEhpJvFWhLsLAnHaTVyUd7BcR83pmdH2yJsnbBODSYjVL3r8ej8BFHtMf5jdfPk/UP
 L2RKytTR5jyhxZtCVEuJHT/jGgcuNQ4=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-510-LcyWsiHZOp6w72daviwQrQ-1; Thu, 20 Oct 2022 00:20:48 -0400
X-MC-Unique: LcyWsiHZOp6w72daviwQrQ-1
Received: by mail-ot1-f72.google.com with SMTP id
 q6-20020a9d6306000000b0065757df1611so9263001otk.19
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 21:20:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HRwknnRdMaoHSQY6sRLpLp4XC0Xvzj2ZxLBdLyalJRA=;
 b=Bf44Nqr6i25CxVtZH6glVoc9hNsRxplHcgPo3/qOuigmQW0yMNGmG7cTIzkJRPJxBo
 80vdNO/cjwpVpP163DdJrkY9xs2JKfNGq5sJFc2V5bQy6d677MJdnzd8T1ruTcnoZQCK
 kScZJzKrYCMqf6w3JpgK0g8xeVqVXL+BVGcHNqmrgIg1oV8Yc8lWS6TFyvi9InuQOLwd
 v2HvtQBmFspYwbQxK61wb2jnHYgTk5bdlAYYIoff6Rx5tLR+E/wehmdZ3rrEr2oenByL
 JR03veB6vlqxz4tI2dqxKS/8UVfSIUxyvxB9qSjo3xAlgLnY3e1Ahr4q1cR+YvfUNmyY
 pqOQ==
X-Gm-Message-State: ACrzQf2l6YWNC5Qwed19Zn094cR69O1Wy9XboLkDAm0Lr73r+jwP97/h
 d+p0zdV16vKHOogLVH0c4UTW2dvPM3aO7UajuIII49Gsu38SdsECvQmYwEUYfQYD4YG0+riwYVJ
 bxfhHSAnCGk32UEQeLx2jEnvxnOMGVYc=
X-Received: by 2002:a9d:7dcf:0:b0:661:dc25:ba0 with SMTP id
 k15-20020a9d7dcf000000b00661dc250ba0mr5864189otn.201.1666239648069; 
 Wed, 19 Oct 2022 21:20:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6NdVO/m1bCaA8+Ot+Mkhwdd2GzC4IBj/TfkAmiXpm2W5GD4NL+UQKMC3m6sGQrEzE656WhjJDCpAE7RGD1E1w=
X-Received: by 2002:a9d:7dcf:0:b0:661:dc25:ba0 with SMTP id
 k15-20020a9d7dcf000000b00661dc250ba0mr5864182otn.201.1666239647835; Wed, 19
 Oct 2022 21:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221014132004.114602-1-lvivier@redhat.com>
 <20221014132004.114602-3-lvivier@redhat.com>
In-Reply-To: <20221014132004.114602-3-lvivier@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 20 Oct 2022 12:20:36 +0800
Message-ID: <CACGkMEu2TU9Jq-5Y2G8Df-98HaDxx7rOMXX08B+cFsQQA4yuLw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] virtio-net: fix TX timer with tx_burst
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Brivio <sbrivio@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, alex.williamson@redhat.com
Content-Type: text/plain; charset="UTF-8"
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

On Fri, Oct 14, 2022 at 9:20 PM Laurent Vivier <lvivier@redhat.com> wrote:
>
> When virtio_net_flush_tx() reaches the tx_burst value all
> the queue is not flushed and nothing restart the timer.
>
> Fix that by doing for TX timer as we do for bottom half TX:
> rearming the timer if we find any packet to send during the
> virtio_net_flush_tx() call.
>
> Fixes: e3f30488e5f8 ("virtio-net: Limit number of packets sent per TX flush")
> Cc: alex.williamson@redhat.com
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  hw/net/virtio-net.c | 59 +++++++++++++++++++++++++++++++++++----------
>  1 file changed, 46 insertions(+), 13 deletions(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 1fbf2f3e19a7..b4964b821021 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -2536,14 +2536,19 @@ static void virtio_net_tx_complete(NetClientState *nc, ssize_t len)
>
>      virtio_queue_set_notification(q->tx_vq, 1);
>      ret = virtio_net_flush_tx(q);
> -    if (q->tx_bh && ret >= n->tx_burst) {
> +    if (ret >= n->tx_burst) {
>          /*
>           * the flush has been stopped by tx_burst
>           * we will not receive notification for the
>           * remainining part, so re-schedule
>           */
>          virtio_queue_set_notification(q->tx_vq, 0);
> -        qemu_bh_schedule(q->tx_bh);
> +        if (q->tx_bh) {
> +            qemu_bh_schedule(q->tx_bh);
> +        } else {
> +            timer_mod(q->tx_timer,
> +                      qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
> +        }
>          q->tx_waiting = 1;
>      }
>  }
> @@ -2644,6 +2649,8 @@ drop:
>      return num_packets;
>  }
>
> +static void virtio_net_tx_timer(void *opaque);
> +
>  static void virtio_net_handle_tx_timer(VirtIODevice *vdev, VirtQueue *vq)
>  {
>      VirtIONet *n = VIRTIO_NET(vdev);
> @@ -2661,18 +2668,17 @@ static void virtio_net_handle_tx_timer(VirtIODevice *vdev, VirtQueue *vq)
>      }
>
>      if (q->tx_waiting) {
> -        virtio_queue_set_notification(vq, 1);
> +        /* We already have queued packets, immediately flush */
>          timer_del(q->tx_timer);
> -        q->tx_waiting = 0;
> -        if (virtio_net_flush_tx(q) == -EINVAL) {
> -            return;
> -        }
> -    } else {
> -        timer_mod(q->tx_timer,
> -                       qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
> -        q->tx_waiting = 1;
> -        virtio_queue_set_notification(vq, 0);
> +        virtio_net_tx_timer(q);
> +        return;
>      }
> +
> +    /* re-arm timer to flush it (and more) on next tick */
> +    timer_mod(q->tx_timer,
> +              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
> +    q->tx_waiting = 1;
> +    virtio_queue_set_notification(vq, 0);
>  }

Nit: if we stick the above in the else, we can avoid a lot of changes.

Others look good.

Thanks

>
>  static void virtio_net_handle_tx_bh(VirtIODevice *vdev, VirtQueue *vq)
> @@ -2702,6 +2708,8 @@ static void virtio_net_tx_timer(void *opaque)
>      VirtIONetQueue *q = opaque;
>      VirtIONet *n = q->n;
>      VirtIODevice *vdev = VIRTIO_DEVICE(n);
> +    int ret;
> +
>      /* This happens when device was stopped but BH wasn't. */
>      if (!vdev->vm_running) {
>          /* Make sure tx waiting is set, so we'll run when restarted. */
> @@ -2716,8 +2724,33 @@ static void virtio_net_tx_timer(void *opaque)
>          return;
>      }
>
> +    ret = virtio_net_flush_tx(q);
> +    if (ret == -EBUSY || ret == -EINVAL) {
> +        return;
> +    }
> +    /*
> +     * If we flush a full burst of packets, assume there are
> +     * more coming and immediately rearm
> +     */
> +    if (ret >= n->tx_burst) {
> +        q->tx_waiting = 1;
> +        timer_mod(q->tx_timer,
> +                  qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
> +        return;
> +    }
> +    /*
> +     * If less than a full burst, re-enable notification and flush
> +     * anything that may have come in while we weren't looking.  If
> +     * we find something, assume the guest is still active and rearm
> +     */
>      virtio_queue_set_notification(q->tx_vq, 1);
> -    virtio_net_flush_tx(q);
> +    ret = virtio_net_flush_tx(q);
> +    if (ret > 0) {
> +        virtio_queue_set_notification(q->tx_vq, 0);
> +        q->tx_waiting = 1;
> +        timer_mod(q->tx_timer,
> +                  qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
> +    }
>  }
>
>  static void virtio_net_tx_bh(void *opaque)
> --
> 2.37.3
>


