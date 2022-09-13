Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090125B681D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 08:48:07 +0200 (CEST)
Received: from localhost ([::1]:57574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXziH-0001rG-6v
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 02:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oXzNz-0007cm-BZ
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 02:27:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oXzNw-0000Ka-GU
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 02:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663050423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FQklb5wF3VYzXb0H80IfmXY1E8Sty/Whbx9rSXB+Z90=;
 b=fCjBJM+i5/WOR1KddudUWvnK6kHznYebcDraqtwJYVgPSOeZnU+5XW+6pIiqfGTSORHaTy
 SjGU2brQeCWEEGLzxjp4s4x53XlyOVNwq6oBopVwN8Jf5GAHqFSLrNad3PAMhEiqrpFu7K
 fS3CyGNd6dahEZD6OJ2ik+9KdCDzMrY=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-662-_QgXRdgKMi6BvBRKjGozxA-1; Tue, 13 Sep 2022 02:27:01 -0400
X-MC-Unique: _QgXRdgKMi6BvBRKjGozxA-1
Received: by mail-vk1-f199.google.com with SMTP id
 y13-20020a1f320d000000b003a27b2acf97so746329vky.23
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 23:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=FQklb5wF3VYzXb0H80IfmXY1E8Sty/Whbx9rSXB+Z90=;
 b=eG8IPjWacsDyv/wrjYT2wbJIXR6BJXrSbBRoZiCX5vUtcU59YJg9ceXC23VzsXgM9N
 GzUHyNU2GbMfHJsy7YYO9TPI3XMDAGdnijeXaZ2+TqlzXMKX0d1m8fJArWdEYcFEHWqv
 dS246Jurw7MLSpivfaLjmJW70uX5RVA43KJGsa4Ivu9k5DwY5qP/Y14OusEYXc0M/fRx
 YVVetnmCw2KtOP9rDeElwYjhi+Pwci3ehqqML57+WoPGN1S0XT/dBXSSsjrEPJbj2D7b
 bwgNyS8EWBbkQhiS/eigKLajjWNdsboP+YYA3AiyAwEWPBpSwYHlrbkr0mWavqzbypQO
 pk2Q==
X-Gm-Message-State: ACgBeo3blA9nGhqLwyBpNkDRWMxACkZHJ+KX9LSHUxHc1jh3/6fPa6kN
 FcAjoNFjXwZvJLr2/RIK+x4B7H8LebPcEF58q2x35rxDXIRdg+gtAWZTv4xzEdRPOf3FOCeNlZA
 22RLVvQblVhG8mR1lk1obe+H9OWNIZ3I=
X-Received: by 2002:a05:6102:a84:b0:357:c234:8041 with SMTP id
 n4-20020a0561020a8400b00357c2348041mr9150971vsg.25.1663050420549; 
 Mon, 12 Sep 2022 23:27:00 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7GLt68/7VS/UJSpk+qSPPnjpaKpOQWJWV2Wyjil64bYwPBgMtVgsYWNNSZOkhQTOn2MbjsL+bLauMqfTmF630=
X-Received: by 2002:a05:6102:a84:b0:357:c234:8041 with SMTP id
 n4-20020a0561020a8400b00357c2348041mr9150967vsg.25.1663050420371; Mon, 12 Sep
 2022 23:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1662916759.git.kangjie.xu@linux.alibaba.com>
 <a37c5b1646f8fc4981d842abeb6f85f14fd5d261.1662916759.git.kangjie.xu@linux.alibaba.com>
In-Reply-To: <a37c5b1646f8fc4981d842abeb6f85f14fd5d261.1662916759.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 13 Sep 2022 14:26:49 +0800
Message-ID: <CACGkMEuUhGUpsvs285O0wrW5YxbH4OOVsYnPt9C8VQOYSdHG=w@mail.gmail.com>
Subject: Re: [PATCH v4 09/15] vhost: expose vhost_virtqueue_stop()
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 wangyanan55@huawei.com, Heng Qi <hengqi@linux.alibaba.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Sep 12, 2022 at 1:22 AM Kangjie Xu <kangjie.xu@linux.alibaba.com> wrote:
>
> Expose vhost_virtqueue_stop(), we need to use it when resetting a
> virtqueue.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  hw/virtio/vhost.c         | 8 ++++----
>  include/hw/virtio/vhost.h | 2 ++
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 7900bc81ab..5407f60226 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1201,10 +1201,10 @@ fail_alloc_desc:
>      return r;
>  }
>
> -static void vhost_virtqueue_stop(struct vhost_dev *dev,
> -                                    struct VirtIODevice *vdev,
> -                                    struct vhost_virtqueue *vq,
> -                                    unsigned idx)
> +void vhost_virtqueue_stop(struct vhost_dev *dev,
> +                          struct VirtIODevice *vdev,
> +                          struct vhost_virtqueue *vq,
> +                          unsigned idx)
>  {
>      int vhost_vq_index = dev->vhost_ops->vhost_get_vq_index(dev, idx);
>      struct vhost_vring_state state = {
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index b092f57d98..2b168b2269 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -281,6 +281,8 @@ int vhost_device_iotlb_miss(struct vhost_dev *dev, uint64_t iova, int write);
>
>  int vhost_virtqueue_start(struct vhost_dev *dev, struct VirtIODevice *vdev,
>                            struct vhost_virtqueue *vq, unsigned idx);
> +void vhost_virtqueue_stop(struct vhost_dev *dev, struct VirtIODevice *vdev,
> +                          struct vhost_virtqueue *vq, unsigned idx);
>
>  void vhost_dev_reset_inflight(struct vhost_inflight *inflight);
>  void vhost_dev_free_inflight(struct vhost_inflight *inflight);
> --
> 2.32.0
>


