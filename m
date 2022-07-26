Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F634580A38
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 06:10:45 +0200 (CEST)
Received: from localhost ([::1]:41110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGBu7-0002Us-Lu
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 00:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGBrM-0008Fh-8F
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:07:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGBrI-0004BQ-T7
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:07:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658808468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DwRZlp329l6NGaJ+InfLkJPvY1TQMXcvSJPFhPxC3Ag=;
 b=eRYUy4bFn86614R2/bXYFXbzis6XHgfv9vGHHBzktDrz374qAXa6VT28Dq5VJOWcG//u1p
 sxNIF4FmugpBoPYwRaytpR+1xqve1ZUHj3iWddfPvpRkTtIpN1gS69NcSMDGXavOvUxzxa
 lbecNKm5RskW/sgRQ4N66pQaF0e2Rdk=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-kDFh7wDYP_yWnB2SjgwEFw-1; Tue, 26 Jul 2022 00:07:46 -0400
X-MC-Unique: kDFh7wDYP_yWnB2SjgwEFw-1
Received: by mail-pj1-f71.google.com with SMTP id
 u12-20020a17090a5e4c00b001f22d74c3f1so6753196pji.5
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 21:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DwRZlp329l6NGaJ+InfLkJPvY1TQMXcvSJPFhPxC3Ag=;
 b=e22qxjB8qtNbmYdokhNoEGXIYbAhhvm5w8SM21HOVJds3u31awbHZbJTqDNVTa/b4m
 d550vAAupay9ywz+Qf2UpFKfu9z4YFYN+B03OKj67XtstpARxMl98itqIWhpN8ICuAU1
 zcGZzBzukLOxe70KnAQsWbMRM7YXXJLC79dVl4h7W697rSdAPSeVOIFGWmQPbxIzniYf
 C/Te/KZ2RhjMkQIjI4p/gRBCHlyfdn4A3yAmVGnmhvQQQBWF2RCllLYTp7iVxOfqn6Gk
 ql1+k1H9uZc1vO3ILQ4rBYP/c/WD8UIDK/P4ycNvVHwseM+zkTTaJZ9DyoB9SNPJvoU3
 k9Kw==
X-Gm-Message-State: AJIora8ZlECFz8nEuqe/XU/GPpGVMjACN6Gdy/VaHCUNEUdNWhQuVzqp
 iA88LBLPmTionF1z2ZMCA3D2PFQcf3Z5+XJqCN6giea46711Ej6DFtrgOAmYTJzaGxwF0O5T2O1
 ZfjlVmodrSHE5J1A=
X-Received: by 2002:a65:6bcc:0:b0:3f6:1815:f541 with SMTP id
 e12-20020a656bcc000000b003f61815f541mr13158781pgw.183.1658808465344; 
 Mon, 25 Jul 2022 21:07:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vjmdK4EKUjFw5W5kh3PHZ4k68h5HalgVIHBx5lWHg3kCXvvu9I1tv3jw6SswW03VRkpmyFog==
X-Received: by 2002:a65:6bcc:0:b0:3f6:1815:f541 with SMTP id
 e12-20020a656bcc000000b003f61815f541mr13158766pgw.183.1658808465039; 
 Mon, 25 Jul 2022 21:07:45 -0700 (PDT)
Received: from [10.72.12.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a626003000000b005289eafbd08sm10821769pfb.18.2022.07.25.21.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 21:07:44 -0700 (PDT)
Message-ID: <a297c525-ef7e-5cbb-6472-c2888b25853c@redhat.com>
Date: Tue, 26 Jul 2022 12:07:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 10/16] vhost: extract the logic of unmapping the vrings
 and desc
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <d949da87100674fc122f02b7eff316851e32cdda.1658141552.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <d949da87100674fc122f02b7eff316851e32cdda.1658141552.git.kangjie.xu@linux.alibaba.com>
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


在 2022/7/18 19:17, Kangjie Xu 写道:
> Introduce vhost_virtqueue_unmap() to ummap the vrings and desc
> of a virtqueue.
>
> The function will be used later.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/virtio/vhost.c | 20 ++++++++++++++------
>   1 file changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 0827d631c0..e467dfc7bc 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1197,6 +1197,19 @@ fail_alloc_desc:
>       return r;
>   }
>   
> +static void vhost_virtqueue_unmap(struct vhost_dev *dev,
> +                                  struct VirtIODevice *vdev,
> +                                  struct vhost_virtqueue *vq,
> +                                  unsigned idx)
> +{
> +    vhost_memory_unmap(dev, vq->used, virtio_queue_get_used_size(vdev, idx),
> +                       1, virtio_queue_get_used_size(vdev, idx));
> +    vhost_memory_unmap(dev, vq->avail, virtio_queue_get_avail_size(vdev, idx),
> +                       0, virtio_queue_get_avail_size(vdev, idx));
> +    vhost_memory_unmap(dev, vq->desc, virtio_queue_get_desc_size(vdev, idx),
> +                       0, virtio_queue_get_desc_size(vdev, idx));
> +}
> +
>   static void vhost_virtqueue_stop(struct vhost_dev *dev,
>                                       struct VirtIODevice *vdev,
>                                       struct vhost_virtqueue *vq,
> @@ -1235,12 +1248,7 @@ static void vhost_virtqueue_stop(struct vhost_dev *dev,
>                                                   vhost_vq_index);
>       }
>   
> -    vhost_memory_unmap(dev, vq->used, virtio_queue_get_used_size(vdev, idx),
> -                       1, virtio_queue_get_used_size(vdev, idx));
> -    vhost_memory_unmap(dev, vq->avail, virtio_queue_get_avail_size(vdev, idx),
> -                       0, virtio_queue_get_avail_size(vdev, idx));
> -    vhost_memory_unmap(dev, vq->desc, virtio_queue_get_desc_size(vdev, idx),
> -                       0, virtio_queue_get_desc_size(vdev, idx));
> +    vhost_virtqueue_unmap(dev, vdev, vq, idx);
>   }
>   
>   static void vhost_eventfd_add(MemoryListener *listener,


