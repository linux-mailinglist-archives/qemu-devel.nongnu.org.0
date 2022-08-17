Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 371E0596D99
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 13:36:55 +0200 (CEST)
Received: from localhost ([::1]:40634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOGz2-0000re-3y
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 07:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOGnu-0003BB-8h
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 07:01:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOGns-0005FR-TF
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 07:01:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660734099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f0X51nGsneG5dfW1atPz3ulwM85UgcWDOQBH/+o1168=;
 b=UT21l8zG+CW3Pq5TXFRBEC3Jqf9H7v5gNQ7V4n3gLq/UkqQTg5Msr+8FrdJ3+yL1sMi9xW
 ls86H+FVozhJOb7w5Viu7gbKde1Y+kg3gBjeObrSXGJVv3xKCwcMiVmuPLrdH/2LgXs2KP
 yEwsAwv8gJKg5S9wazAZj4ZavDF+ChA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-yqSy4BeANC6nur4FqLZV0g-1; Wed, 17 Aug 2022 07:01:38 -0400
X-MC-Unique: yqSy4BeANC6nur4FqLZV0g-1
Received: by mail-wm1-f70.google.com with SMTP id
 v67-20020a1cac46000000b003a615c4893dso646863wme.3
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 04:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=f0X51nGsneG5dfW1atPz3ulwM85UgcWDOQBH/+o1168=;
 b=otH7WiYQHhGpDjcLzivFFyv2z8lyEabK3bH2fdzjZV1K3ZtCC26rPqLjVi1kxZ473p
 3ZkKM11vWRxFX3UQyk0hVxmRSD3njS5mIwJaJF61HxbOaz0cFy+t/pGRCAQJfo0leJw1
 DHbyWomPRzZVwIAeHRTI8+nMv2pYoxjDoOnsY1/+4ArYr8OTBP/wnCRkqtPXF2dTWgkW
 UFCa42g6G44czx1+iobIM02PvdIbG/z0G7PH3JNaXR83ZIu4StlbJ2iohvVijslfVdb+
 FpsgpG7/HGywW0k4VU6xIdVSrrE2+MVEHtFT49Ifo77wyS5SMcQWP0X9D7zM7TfkvJ1x
 Esew==
X-Gm-Message-State: ACgBeo0mlwhizhFZ+hXfNG9bhMj5Ey9e2Hr0YSlxRBqE69C39oSfYuJ0
 yIfiekKcQDncReaCcswk23XIcwUKvu+HCcbjoSHzsVWmzCjU1CsCQVwAKBReYAeDV8mYkfNzEwu
 3bztGHTfLtGqrV5k=
X-Received: by 2002:a05:6000:1251:b0:225:259d:c765 with SMTP id
 j17-20020a056000125100b00225259dc765mr1291473wrx.1.1660734097352; 
 Wed, 17 Aug 2022 04:01:37 -0700 (PDT)
X-Google-Smtp-Source: AA6agR48oSOZYqiaUZO6s+VkSV0FxW+DiNfjY4K8bbJggAcMmU8ElP2U2MLSbKnp4qgTcErJXlUvOQ==
X-Received: by 2002:a05:6000:1251:b0:225:259d:c765 with SMTP id
 j17-20020a056000125100b00225259dc765mr1291449wrx.1.1660734097043; 
 Wed, 17 Aug 2022 04:01:37 -0700 (PDT)
Received: from redhat.com ([2.55.43.215]) by smtp.gmail.com with ESMTPSA id
 m17-20020a05600c3b1100b003a319b67f64sm8397241wms.0.2022.08.17.04.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 04:01:36 -0700 (PDT)
Date: Wed, 17 Aug 2022 07:01:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/4] hw/virtio: gracefully handle unset vhost_dev vdev
Message-ID: <20220817070112-mutt-send-email-mst@kernel.org>
References: <20220728135503.1060062-1-alex.bennee@linaro.org>
 <20220728135503.1060062-3-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220728135503.1060062-3-alex.bennee@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Thu, Jul 28, 2022 at 02:55:01PM +0100, Alex Bennée wrote:
> I've noticed asserts firing because we query the status of vdev after
> a vhost connection is closed down. Rather than faulting on the NULL
> indirect just quietly reply false.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20220726192150.2435175-8-alex.bennee@linaro.org>

Please do not include this header when you post.


> ---
>  hw/virtio/vhost.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 0827d631c0..f758f177bb 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -306,7 +306,7 @@ static inline void vhost_dev_log_resize(struct vhost_dev *dev, uint64_t size)
>      dev->log_size = size;
>  }
>  
> -static int vhost_dev_has_iommu(struct vhost_dev *dev)
> +static bool vhost_dev_has_iommu(struct vhost_dev *dev)
>  {
>      VirtIODevice *vdev = dev->vdev;
>  
> @@ -316,8 +316,12 @@ static int vhost_dev_has_iommu(struct vhost_dev *dev)
>       * does not have IOMMU, there's no need to enable this feature
>       * which may cause unnecessary IOTLB miss/update transactions.
>       */
> -    return virtio_bus_device_iommu_enabled(vdev) &&
> -           virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> +    if (vdev) {
> +        return virtio_bus_device_iommu_enabled(vdev) &&
> +            virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> +    } else {
> +        return false;
> +    }
>  }
>  
>  static void *vhost_memory_map(struct vhost_dev *dev, hwaddr addr,
> -- 
> 2.30.2


