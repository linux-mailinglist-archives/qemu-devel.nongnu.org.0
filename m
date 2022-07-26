Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03783580A7F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 06:31:20 +0200 (CEST)
Received: from localhost ([::1]:54164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGCE2-0003df-Od
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 00:31:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGCBp-00023C-UP
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:29:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGCBm-0006uz-RQ
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:29:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658809738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mH0XY+8YpCJXT+gFhjqpIKrKIj68fZMvFLFWSz9KGPw=;
 b=BUsLVZfAjtc54Gc4KEqd8CxLcHYOTHFAF1jxFOkStZPANMC3uwsS7hqd4DwOrQ5I4kQIKW
 TTtZ7uqLOJu59PxYuJhp39CwJSQgn5kB0m1T/7q3U3P/JhdpI4QuM5RRQpYm7DUCcf7tVb
 xJLTgC4aVSG7ocVQ85EooCgwIxgL4zM=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-tAJyzcSOOy-Oc_tFbiTNJg-1; Tue, 26 Jul 2022 00:28:56 -0400
X-MC-Unique: tAJyzcSOOy-Oc_tFbiTNJg-1
Received: by mail-pj1-f72.google.com with SMTP id
 t19-20020a17090a5d9300b001f2f3223d17so256692pji.9
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 21:28:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mH0XY+8YpCJXT+gFhjqpIKrKIj68fZMvFLFWSz9KGPw=;
 b=Z929c2pf5iyKz1laJWszP3AKacLmxJjnf1rFAbKPq+LzYqn8RBrrRKwpR6wblSnsJ0
 4xqz8x86QDfiVOf5slSqzD9VN9r76HjpX3t+sEFZM9dOUy+hDlXLhxyh5EFWpAYt+fti
 gYX9A6DOqul/y+L+1AC6CPqU/u26sxvzn+aDXMgTUH3MQyFNJGiFnLW6mwhX64xOQFWh
 YoVPu6kaNYItb6qrMihfAJf+5qRK0oX6FNDo1PZfZTXJpyQdGxNAU6A9zN+Y5YEZ8agF
 ka9FWkueaI0CIK58yBPmmsVflQJ4kPubCMAimNpCO1Omhq3bDnZpt/TJ0jCBZVt1wy+I
 5y0w==
X-Gm-Message-State: AJIora/KCDohEd+dbjVwpdlOyoVhwtBEDP6AfgPDvDae08IYVxlVXyao
 8cqK/tk/bHvVx3gw3mv6eetveNLeWgKUa8bwYm2Y+2qgT+PcMY8aXOk0T1fWHdzseBM4KYWlAIM
 ma3xJ+TU594WTVWM=
X-Received: by 2002:a62:38cb:0:b0:528:2ed8:7e3d with SMTP id
 f194-20020a6238cb000000b005282ed87e3dmr16085595pfa.82.1658809735159; 
 Mon, 25 Jul 2022 21:28:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tPHsM68jUuvIyg+b0KpZQse1ThQWWrRpm7eD+JcmR97jeaP+4jF6+fOIAq6mfxLJzqkWEc1Q==
X-Received: by 2002:a62:38cb:0:b0:528:2ed8:7e3d with SMTP id
 f194-20020a6238cb000000b005282ed87e3dmr16085583pfa.82.1658809734894; 
 Mon, 25 Jul 2022 21:28:54 -0700 (PDT)
Received: from [10.72.12.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a654507000000b0041ab83d39d4sm5321405pgq.0.2022.07.25.21.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 21:28:54 -0700 (PDT)
Message-ID: <e443d984-d4ae-084a-060c-70f802830014@redhat.com>
Date: Tue, 26 Jul 2022 12:28:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 16/16] vhost-net: vq reset feature bit support
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <229f4bc4d6ba7e85a09d6f35d2d06f3cc6a46a6a.1658141552.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <229f4bc4d6ba7e85a09d6f35d2d06f3cc6a46a6a.1658141552.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


在 2022/7/18 19:17, Kangjie Xu 写道:
> Add support for negotation of vq reset feature bit.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


I'd suggest to add support for vhost-net kernel as well. It looks much 
more easier than vhost-user (I guess a stop/start would do the trick).

Thanks


> ---
>   hw/net/vhost_net.c  | 1 +
>   hw/net/virtio-net.c | 3 ++-
>   2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 4f5f034c11..de910f6466 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -73,6 +73,7 @@ static const int user_feature_bits[] = {
>       VIRTIO_NET_F_MTU,
>       VIRTIO_F_IOMMU_PLATFORM,
>       VIRTIO_F_RING_PACKED,
> +    VIRTIO_F_RING_RESET,
>       VIRTIO_NET_F_RSS,
>       VIRTIO_NET_F_HASH_REPORT,
>   
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 0747ffe71c..a8b299067a 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -757,6 +757,8 @@ static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
>   
>       virtio_add_feature(&features, VIRTIO_NET_F_MAC);
>   
> +    virtio_add_feature(&features, VIRTIO_F_RING_RESET);
> +
>       if (!peer_has_vnet_hdr(n)) {
>           virtio_clear_feature(&features, VIRTIO_NET_F_CSUM);
>           virtio_clear_feature(&features, VIRTIO_NET_F_HOST_TSO4);
> @@ -777,7 +779,6 @@ static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
>       }
>   
>       if (!get_vhost_net(nc->peer)) {
> -        virtio_add_feature(&features, VIRTIO_F_RING_RESET);
>           return features;
>       }
>   


