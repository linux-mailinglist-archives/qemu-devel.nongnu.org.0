Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EED5795B5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 11:00:32 +0200 (CEST)
Received: from localhost ([::1]:60804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDj5h-0001N3-U3
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 05:00:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDj3n-0007a9-Ef
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:58:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDj3k-0003Yk-4F
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:58:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658221107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZpM0yNbotqj+YKgquTf8DkgvuvJoXcHI3C9nWZSppCc=;
 b=W27jR8aRPNcqCLlYJY+Cv7bSb+Qmqx/933g0gs+YzP7uJyT8EkYDfRPqabn7NQB1yjUnwp
 G070Rwbd1a6Oe7rJzvj5ucwHEZJddjuNfy1VEIBwDRysoaJBEoByF1ORCgvVQiMZ0PX9nC
 rSPpOQsaa+uPJSsamgGik9YsjmZfKLg=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-V-VIA7ZuNce1bBNRUeVMJA-1; Tue, 19 Jul 2022 04:58:22 -0400
X-MC-Unique: V-VIA7ZuNce1bBNRUeVMJA-1
Received: by mail-pj1-f69.google.com with SMTP id
 d21-20020a17090ae29500b001f2042edb63so488789pjz.8
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 01:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZpM0yNbotqj+YKgquTf8DkgvuvJoXcHI3C9nWZSppCc=;
 b=sfpnFJJ0RuucNWfRtN5gwhFHenFzhiz461L5Pgf0pS/e21k4O6g3a11OQB9YOe/dcr
 zgfPzO1XamYloPETLwOStlv+LSN79WDP/G0hHBeau/cPQA3jg/tUAshbVgP+4VMzGoLt
 Zs2OPCr+63MZee82WFHsVN41VJgjD5JEfnLBuCoWswwdPkeBOJQUasqdmBqzomUA6tvO
 /sC7rEJgJyFA6UEw63nNY9jZQHZvwVVcG9VTop00++EDF1xLQJyqN5L0zPdddpOm5wCC
 Xh7QFHmUI6ljjQPJ4zN0+a8SSfysfmPQMjtg0CkCtE/McbHUTC1x70a73/hpUSGGeN2B
 GcOg==
X-Gm-Message-State: AJIora8cHY0SASkRqYQgyHdhXOSU2DPuyJWzPHwsZr3dpdE3XkXIJN+d
 Yyu1gAzrNrcmLfHoJdP8Aq8B5MD0zffBz87V3bXGRQU6CAv3WanvnlzapDEe1fTcrGctFoZ2LEl
 7w52jRDr0yhQNti0=
X-Received: by 2002:aa7:88d5:0:b0:52a:ea1f:50c6 with SMTP id
 k21-20020aa788d5000000b0052aea1f50c6mr32059868pff.81.1658221100465; 
 Tue, 19 Jul 2022 01:58:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v0OeLi7HiBk5YwXGDUyyp8c3+lctnb/0ubDJAf0cMIvYPbZHVvkBlOjKLf1UqkA0jMleTymA==
X-Received: by 2002:aa7:88d5:0:b0:52a:ea1f:50c6 with SMTP id
 k21-20020aa788d5000000b0052aea1f50c6mr32059841pff.81.1658221100128; 
 Tue, 19 Jul 2022 01:58:20 -0700 (PDT)
Received: from [10.72.13.162] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 q10-20020aa7842a000000b0052516db7123sm10784243pfn.35.2022.07.19.01.58.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 01:58:19 -0700 (PDT)
Message-ID: <48006fbf-b848-829c-fe0b-e2bc51f9563c@redhat.com>
Date: Tue, 19 Jul 2022 16:58:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v11 01/10] virtio: introduce macro IRTIO_CONFIG_IRQ_IDX
Content-Language: en-US
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, kraxel@redhat.com,
 dgilbert@redhat.com, stefanha@redhat.com, arei.gonglei@huawei.com,
 marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220711155243.866530-2-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220711155243.866530-2-lulu@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


在 2022/7/11 23:52, Cindy Lu 写道:
> To support configure interrupt for vhost-vdpa
> Introduce VIRTIO_CONFIG_IRQ_IDX -1 as configure interrupt's queue index,
> Then we can reuse the functions guest_notifier_mask and guest_notifier_pending.
> Add the check of queue index in these drivers, if the driver does not support
> configure interrupt, the function will just return
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>


A typo in the subject should be "VIRTIO_CONFIG_IRQ_IDX".


> ---
>   hw/display/vhost-user-gpu.c    |  6 ++++++
>   hw/net/virtio-net.c            | 10 ++++++++--
>   hw/virtio/vhost-user-fs.c      |  6 ++++++
>   hw/virtio/vhost-vsock-common.c |  6 ++++++
>   hw/virtio/virtio-crypto.c      |  6 ++++++
>   include/hw/virtio/virtio.h     |  3 +++
>   6 files changed, 35 insertions(+), 2 deletions(-)
>
> diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
> index 09818231bd..d4a440e815 100644
> --- a/hw/display/vhost-user-gpu.c
> +++ b/hw/display/vhost-user-gpu.c
> @@ -485,6 +485,9 @@ vhost_user_gpu_guest_notifier_pending(VirtIODevice *vdev, int idx)
>   {
>       VhostUserGPU *g = VHOST_USER_GPU(vdev);
>   
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return false;
> +    }


I think we should either

1) explain why this check is needed

or

2) defer this change to the patch that can actually hit this check

Thanks


>       return vhost_virtqueue_pending(&g->vhost->dev, idx);
>   }
>   
> @@ -493,6 +496,9 @@ vhost_user_gpu_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
>   {
>       VhostUserGPU *g = VHOST_USER_GPU(vdev);
>   
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return;
> +    }
>       vhost_virtqueue_mask(&g->vhost->dev, vdev, idx, mask);
>   }
>   
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 1067e72b39..72ea4819f7 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3172,6 +3172,9 @@ static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
>       VirtIONet *n = VIRTIO_NET(vdev);
>       NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
>       assert(n->vhost_started);
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return false;
> +    }
>       return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
>   }
>   
> @@ -3181,8 +3184,11 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
>       VirtIONet *n = VIRTIO_NET(vdev);
>       NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
>       assert(n->vhost_started);
> -    vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
> -                             vdev, idx, mask);
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return;
> +    }
> +
> +    vhost_net_virtqueue_mask(get_vhost_net(nc->peer), vdev, idx, mask);
>   }
>   
>   static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_features)
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index c595957983..9b0349922e 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -161,6 +161,9 @@ static void vuf_guest_notifier_mask(VirtIODevice *vdev, int idx,
>   {
>       VHostUserFS *fs = VHOST_USER_FS(vdev);
>   
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return;
> +    }
>       vhost_virtqueue_mask(&fs->vhost_dev, vdev, idx, mask);
>   }
>   
> @@ -168,6 +171,9 @@ static bool vuf_guest_notifier_pending(VirtIODevice *vdev, int idx)
>   {
>       VHostUserFS *fs = VHOST_USER_FS(vdev);
>   
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return false;
> +    }
>       return vhost_virtqueue_pending(&fs->vhost_dev, idx);
>   }
>   
> diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
> index ed706681ac..b1f0d46209 100644
> --- a/hw/virtio/vhost-vsock-common.c
> +++ b/hw/virtio/vhost-vsock-common.c
> @@ -125,6 +125,9 @@ static void vhost_vsock_common_guest_notifier_mask(VirtIODevice *vdev, int idx,
>   {
>       VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>   
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return;
> +    }
>       vhost_virtqueue_mask(&vvc->vhost_dev, vdev, idx, mask);
>   }
>   
> @@ -133,6 +136,9 @@ static bool vhost_vsock_common_guest_notifier_pending(VirtIODevice *vdev,
>   {
>       VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>   
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return false;
> +    }
>       return vhost_virtqueue_pending(&vvc->vhost_dev, idx);
>   }
>   
> diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
> index dcd80b904d..7085643d5f 100644
> --- a/hw/virtio/virtio-crypto.c
> +++ b/hw/virtio/virtio-crypto.c
> @@ -948,6 +948,9 @@ static void virtio_crypto_guest_notifier_mask(VirtIODevice *vdev, int idx,
>   
>       assert(vcrypto->vhost_started);
>   
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return;
> +    }
>       cryptodev_vhost_virtqueue_mask(vdev, queue, idx, mask);
>   }
>   
> @@ -958,6 +961,9 @@ static bool virtio_crypto_guest_notifier_pending(VirtIODevice *vdev, int idx)
>   
>       assert(vcrypto->vhost_started);
>   
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return false;
> +    }
>       return cryptodev_vhost_virtqueue_pending(vdev, queue, idx);
>   }
>   
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index b31c4507f5..4512205503 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -67,6 +67,9 @@ typedef struct VirtQueueElement
>   
>   #define VIRTIO_NO_VECTOR 0xffff
>   
> +/* special index value used internally for config irqs */
> +#define VIRTIO_CONFIG_IRQ_IDX -1
> +
>   #define TYPE_VIRTIO_DEVICE "virtio-device"
>   OBJECT_DECLARE_TYPE(VirtIODevice, VirtioDeviceClass, VIRTIO_DEVICE)
>   


