Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218113C1E00
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 06:05:34 +0200 (CEST)
Received: from localhost ([::1]:36704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1hlc-00025u-Vf
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 00:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m1hkM-0001Q6-3E
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:04:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m1hkJ-0007E0-6a
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:04:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625803450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5piogbcNGX3R3PUcAVZ/n6BZLTJx2klcsViEXc3rZpk=;
 b=d7uykWBWWmPjRTqXDR1FAn9+4xItcWvQoJrcx3uAxTVP71jnIoe2kfNqYviDD8T1v62y3w
 nD709EmVXq90VO/RqUEN1BKU3MDQOCpM5e11hz+J3iRdpW04tvtTZyd6gIYTG9VCzS6HOy
 IYAJhphkRdnSUMbwOBE8qxGuieAFE0E=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-jkO4BOm8N6uWY-UJ0m0SoQ-1; Fri, 09 Jul 2021 00:04:09 -0400
X-MC-Unique: jkO4BOm8N6uWY-UJ0m0SoQ-1
Received: by mail-pl1-f199.google.com with SMTP id
 v7-20020a1709028d87b029012945cac72fso2743463plo.7
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 21:04:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=5piogbcNGX3R3PUcAVZ/n6BZLTJx2klcsViEXc3rZpk=;
 b=UnUHQ30K63y4nQDvfMQ64bYpe0HghPT7gMNOyf0cj8leQ/5OUs7fL5FtWForNXFmG1
 lhe2r4zqES3cUyZpqZkt+HgBnCmAq+NKdj1dUQ9Xn8rjbTbgXl99k6uDZgOJUPuj2LNV
 XUxSa5P84Ey1WsKAxjZuLC299Cl9DPflipRa3cb/t9vONluAtI/LWDzGDeOIr1pqBk/T
 37fGO3+G5JwZa1H9ksffKwXsBtioDLsUOrOYJ8IpA9g8yvPAjH8eAqB60EHwOo1QEqZO
 kEpsHJWGGf7ZxnpyI/EvZB0vY/ONXvlRs+10N+vYy+nq6ZZ1Ig03wWfmQZjVl1Xct5se
 32OQ==
X-Gm-Message-State: AOAM533dxM2xjr3CtQee0vXU0heg8rc3ppGqxTdY6qVHGEwUef2mol3L
 rkPb2WfxR4xtAiNcNrnV6V5eWq68t9E8YHgpxStBIruS6I5xlj20wV1DVQCwMBzt489KY90Uihi
 1igT8nd/lLauEdjnPnW9hoN+ObxIfaJfIem0X8MDhKpCJBoI8Ta74iUjZfDd8M+LarxI=
X-Received: by 2002:a62:9242:0:b029:300:6fb1:38b7 with SMTP id
 o63-20020a6292420000b02903006fb138b7mr34470470pfd.80.1625803448128; 
 Thu, 08 Jul 2021 21:04:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbRpHc3DlmdRySBWBgMhpASSM+o1yuLa1UJd8xSJICyxKBIL5YuE5t0WOerMtVbY5t56CLUw==
X-Received: by 2002:a62:9242:0:b029:300:6fb1:38b7 with SMTP id
 o63-20020a6292420000b02903006fb138b7mr34470444pfd.80.1625803447804; 
 Thu, 08 Jul 2021 21:04:07 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id b19sm4063736pjh.29.2021.07.08.21.04.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 21:04:07 -0700 (PDT)
Subject: Re: [PATCH v8 1/9] virtio: introduce macro IRTIO_CONFIG_IRQ_IDX
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210706072030.32365-1-lulu@redhat.com>
 <20210706072030.32365-2-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <075a2959-74de-c8e4-4182-75b936a03eb3@redhat.com>
Date: Fri, 9 Jul 2021 12:04:04 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706072030.32365-2-lulu@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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


ÔÚ 2021/7/6 ÏÂÎç3:20, Cindy Lu Ð´µÀ:
> In order to support configure interrupt for vhost-vdpa
> introduce VIRTIO_CONFIG_IRQ_IDX -1 as a queue index,
> then we can reuse the function guest_notifier_mask and
> guest_notifier_pending.
> we add the check of queue index, if the driver
> is not support configure interrupt, the function will just return


Typo in the subject.

Thanks


>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/display/vhost-user-gpu.c    |  6 ++++++
>   hw/net/virtio-net.c            | 10 +++++++---
>   hw/virtio/vhost-user-fs.c      |  9 +++++++--
>   hw/virtio/vhost-vsock-common.c |  6 ++++++
>   hw/virtio/virtio-crypto.c      |  6 ++++++
>   include/hw/virtio/virtio.h     |  2 ++
>   6 files changed, 34 insertions(+), 5 deletions(-)
>
> diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
> index 6cdaa1c73b..c232d55986 100644
> --- a/hw/display/vhost-user-gpu.c
> +++ b/hw/display/vhost-user-gpu.c
> @@ -483,6 +483,9 @@ vhost_user_gpu_guest_notifier_pending(VirtIODevice *vdev, int idx)
>   {
>       VhostUserGPU *g = VHOST_USER_GPU(vdev);
>   
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return false;
> +    }
>       return vhost_virtqueue_pending(&g->vhost->dev, idx);
>   }
>   
> @@ -491,6 +494,9 @@ vhost_user_gpu_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
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
> index 66b9ff4511..f50235b5d6 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3052,7 +3052,10 @@ static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
>       VirtIONet *n = VIRTIO_NET(vdev);
>       NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
>       assert(n->vhost_started);
> -    return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
> +    if (idx != VIRTIO_CONFIG_IRQ_IDX) {
> +        return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
> +    }
> +    return false;
>   }
>   
>   static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
> @@ -3061,8 +3064,9 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
>       VirtIONet *n = VIRTIO_NET(vdev);
>       NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
>       assert(n->vhost_started);
> -    vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
> -                             vdev, idx, mask);
> +    if (idx != VIRTIO_CONFIG_IRQ_IDX) {
> +        vhost_net_virtqueue_mask(get_vhost_net(nc->peer), vdev, idx, mask);
> +    }
>   }
>   
>   static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_features)
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index 6f7f91533d..7e8ca25f71 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -156,11 +156,13 @@ static void vuf_handle_output(VirtIODevice *vdev, VirtQueue *vq)
>        */
>   }
>   
> -static void vuf_guest_notifier_mask(VirtIODevice *vdev, int idx,
> -                                            bool mask)
> +static void vuf_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
>   {
>       VHostUserFS *fs = VHOST_USER_FS(vdev);
>   
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return;
> +    }
>       vhost_virtqueue_mask(&fs->vhost_dev, vdev, idx, mask);
>   }
>   
> @@ -168,6 +170,9 @@ static bool vuf_guest_notifier_pending(VirtIODevice *vdev, int idx)
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
> index 4ad6e234ad..2112b44802 100644
> --- a/hw/virtio/vhost-vsock-common.c
> +++ b/hw/virtio/vhost-vsock-common.c
> @@ -101,6 +101,9 @@ static void vhost_vsock_common_guest_notifier_mask(VirtIODevice *vdev, int idx,
>   {
>       VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>   
> +    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        return;
> +    }
>       vhost_virtqueue_mask(&vvc->vhost_dev, vdev, idx, mask);
>   }
>   
> @@ -109,6 +112,9 @@ static bool vhost_vsock_common_guest_notifier_pending(VirtIODevice *vdev,
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
> index 54f9bbb789..1d5192f8b4 100644
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
> index b7ece7a6a8..63cb9455ed 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -67,6 +67,8 @@ typedef struct VirtQueueElement
>   
>   #define VIRTIO_NO_VECTOR 0xffff
>   
> +#define VIRTIO_CONFIG_IRQ_IDX -1
> +
>   #define TYPE_VIRTIO_DEVICE "virtio-device"
>   OBJECT_DECLARE_TYPE(VirtIODevice, VirtioDeviceClass, VIRTIO_DEVICE)
>   


