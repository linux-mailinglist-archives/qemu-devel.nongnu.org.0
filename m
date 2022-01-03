Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2F3482FFE
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 11:43:39 +0100 (CET)
Received: from localhost ([::1]:53260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4KoU-0005Yb-8u
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 05:43:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n4KnV-0004k8-FE
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 05:42:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n4KnS-0004Z4-DY
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 05:42:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641206552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+lOuE+a/zSx3OOzS3W5VGTlE1nihjTd8EVMPWn0ToeI=;
 b=MkHXKaWZr8SwaNB5r5STB2nxgHDXI33PSe1Tr4wNlVm9b/6bwH/EK6fRg5cZvmQlkjvPTx
 7a8qUVvAVk1eKPb9UTWz7txInc6IXYXL9SSUBj7NBrOkI8NVh3FAZIatsVtXOSBLEBeq4D
 9upXnc4KElHZv9814A7vUa/PfKfKeZU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-4xsLt5iePwyZwiVDuKRTdQ-1; Mon, 03 Jan 2022 05:42:31 -0500
X-MC-Unique: 4xsLt5iePwyZwiVDuKRTdQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 g11-20020a056402090b00b003f8fd1ac475so14758831edz.1
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 02:42:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+lOuE+a/zSx3OOzS3W5VGTlE1nihjTd8EVMPWn0ToeI=;
 b=ejxQi3kibJ4esGx59XVy79GtMO8+boPRzyrMFxufFx9e2ZqP3YYrtyA67rCR6vwfGV
 w5jAXDx0mQUcDuvn6wlJbsOUpJyYgyRpNlDmAiMM3dFSs73x1u3e3V5l5uBPQuw8TXh7
 T5xRiivsWBN1e72uwAR+9MGC9v0ISV6Fxq+JlhIq7KEw/weUO/mtaNE2ufi6J2djO3A3
 cac+lwF2bBCi64UK8XEwDc1W+peocFXkl8NkG49H1rYV8LK5Pxon1Bxn0TQgPMV7QkpU
 0iu5CXE6FeE7R9LYApqpEWzAcgfSemnnOcxKeyRkqeB/5BZKmSCgbXe7PRKlF3lWrEuu
 0gaw==
X-Gm-Message-State: AOAM532KjEeUr4ULG8vBhNLzUS7vMk5JBbRC64G8i91xl8SfdTvsbyB2
 GSR8hosFnc4FLaNPgWjjvNOElDqjWuauH26nPrKLgOVr8YXJt5Bl26jSWJlFBnJrujuy/HkRcZ6
 5pxf9CqYmS1BMExg=
X-Received: by 2002:a17:906:4556:: with SMTP id
 s22mr35658626ejq.321.1641206550663; 
 Mon, 03 Jan 2022 02:42:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyPKjyP5wiorC0AtlB82bfx7zNZ3/LivrEcs66iGQk6e6nR3cV6cKNclqzUDlFZKLnrTdCfQ==
X-Received: by 2002:a17:906:4556:: with SMTP id
 s22mr35658612ejq.321.1641206550460; 
 Mon, 03 Jan 2022 02:42:30 -0800 (PST)
Received: from redhat.com ([2.55.137.15])
 by smtp.gmail.com with ESMTPSA id gt20sm6664926ejc.11.2022.01.03.02.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 02:42:29 -0800 (PST)
Date: Mon, 3 Jan 2022 05:42:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andy Pei <andy.pei@intel.com>
Subject: Re: [PATCH v2] hw/vhost-user-blk: turn on VIRTIO_BLK_F_SIZE_MAX
 feature for virtio blk device
Message-ID: <20220103053913-mutt-send-email-mst@kernel.org>
References: <1641202092-149677-1-git-send-email-andy.pei@intel.com>
MIME-Version: 1.0
In-Reply-To: <1641202092-149677-1-git-send-email-andy.pei@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 raphael.norwitz@nutanix.com, mreitz@redhat.com, changpeng.liu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 03, 2022 at 05:28:12PM +0800, Andy Pei wrote:
> Turn on pre-defined feature VIRTIO_BLK_F_SIZE_MAX for virtio blk device to
> avoid guest DMA request sizes which are too large for hardware spec.
> 
> Signed-off-by: Andy Pei <andy.pei@intel.com>


> ---

Thanks!
Notes for future submissions:
- pls include acks sent on previous versions unless changes you made
  are substantial enough to invalidate them
- pls include a changelog for those that reviewed previous versions

No need to repost this one though.
Thanks!

>  hw/block/vhost-user-blk.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index ba13cb8..eb1264a 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -252,6 +252,7 @@ static uint64_t vhost_user_blk_get_features(VirtIODevice *vdev,
>      VHostUserBlk *s = VHOST_USER_BLK(vdev);
>  
>      /* Turn on pre-defined features */
> +    virtio_add_feature(&features, VIRTIO_BLK_F_SIZE_MAX);
>      virtio_add_feature(&features, VIRTIO_BLK_F_SEG_MAX);
>      virtio_add_feature(&features, VIRTIO_BLK_F_GEOMETRY);
>      virtio_add_feature(&features, VIRTIO_BLK_F_TOPOLOGY);
> -- 
> 1.8.3.1


