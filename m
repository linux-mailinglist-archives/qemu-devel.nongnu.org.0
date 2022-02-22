Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BB04BF42B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 09:57:14 +0100 (CET)
Received: from localhost ([::1]:59626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMQyv-0000oO-Ow
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 03:57:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nMQvf-0007CX-Ap
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 03:53:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nMQvb-0008Ly-Ef
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 03:53:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645520022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LeBDtxeasTRBtp2oYzWvPRZArdoqIX4KSqQ600z5CxU=;
 b=enwsxRVpJ4+2gD2SB9NxtHYiSYhu2imOgqrF1GeTyS+NTktNVgIJhzzyrndkmafliexB4d
 UdZJewkYpBeJjoB9/Dj3yJnh4NrCCxQU9ncDq8HYzxzzBpgA8N0sWU/4ZsWrqN6VlWZjlF
 pM/yvSJGVhULt0T0RS3PwbQBZ+SnezA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-0DfFlFWDNUKHxYhbqGoTwQ-1; Tue, 22 Feb 2022 03:53:40 -0500
X-MC-Unique: 0DfFlFWDNUKHxYhbqGoTwQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 k30-20020a05600c1c9e00b0037d1bee4847so552078wms.9
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 00:53:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LeBDtxeasTRBtp2oYzWvPRZArdoqIX4KSqQ600z5CxU=;
 b=r3meRzbgB26SU7Xl4wqQk2e3euh8yKfPbKRLhCGd/QmUlZC5ZNVHPxcnnG5D6UDIMk
 toEZQDcB1jBqRuqGN11kHOLqHAoBhGUhzZ+WXBmQ3qmSrDnxKjXBT3rja6fQ/FAF2qie
 6rfryTKBPXiCQvp5dJtUUl0Y9+60Xa0xZxkJ+HmFelOjVWlsdK8DH5tWbmDuZmNw9Vm2
 Qm+UZLfZVihJQtZA8vxk/XgfWZVEIUwSHH4H1z4+KT2ZBeGXN0H7n9QeVfe2VtvS0AiL
 foDFIkB4drXI2ZfFnMX2NKlQ2In+tuYPJkkcKbk7WGkw32e1ddkBaZViBlDpi4BX9a4g
 +BAQ==
X-Gm-Message-State: AOAM533to0Ir4bGNxivp5X+0Uu2ek+usKNHOKqIIL1tNP5J24c2lMMUP
 NiMz5soPDIBNOzFOQSBYAKSY1F7WkpPEj3JR3CKxlmIInIt2jJlF0Vuf6KhZUGXHUdfjImef6ho
 IuCCMmTdicC50lRs=
X-Received: by 2002:a5d:6d05:0:b0:1ea:9a76:49c7 with SMTP id
 e5-20020a5d6d05000000b001ea9a7649c7mr789747wrq.613.1645520019407; 
 Tue, 22 Feb 2022 00:53:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx16DIYfBdk33MSeCorrmjk++vXSdpa1mX8DWzzV63sOCZ4nPtm9ooAyl0CvDj7viUY2aKgow==
X-Received: by 2002:a5d:6d05:0:b0:1ea:9a76:49c7 with SMTP id
 e5-20020a5d6d05000000b001ea9a7649c7mr789735wrq.613.1645520019155; 
 Tue, 22 Feb 2022 00:53:39 -0800 (PST)
Received: from [192.168.100.42] ([82.142.17.50])
 by smtp.gmail.com with ESMTPSA id m8sm1861527wms.4.2022.02.22.00.53.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 00:53:38 -0800 (PST)
Message-ID: <bef192f5-70b0-8412-388d-e4278ca35747@redhat.com>
Date: Tue, 22 Feb 2022 09:53:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] hw/virtio: vdpa: Fix leak of host-notifier memory-region
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20220211170259.1388734-1-lvivier@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20220211170259.1388734-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Michael,

do you plan to merge this soon?

This is a bugfix for a QEMU coredump.

Thanks,
Laurent

On 11/02/2022 18:02, Laurent Vivier wrote:
> If call virtio_queue_set_host_notifier_mr fails, should free
> host-notifier memory-region.
> 
> This problem can trigger a coredump with some vDPA drivers (mlx5,
> but not with the vdpasim), if we unplug the virtio-net card from
> the guest after a stop/start.
> 
> The same fix has been done for vhost-user:
>    1f89d3b91e3e ("hw/virtio: Fix leak of host-notifier memory-region")
> 
> Fixes: d0416d487bd5 ("vhost-vdpa: map virtqueue notification area if possible")
> Cc: jasowang@redhat.com
> Resolves: https://bugzilla.redhat.com/2027208
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>   hw/virtio/vhost-vdpa.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 04ea43704f5d..11f696468dc1 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -431,6 +431,7 @@ static int vhost_vdpa_host_notifier_init(struct vhost_dev *dev, int queue_index)
>       g_free(name);
>   
>       if (virtio_queue_set_host_notifier_mr(vdev, queue_index, &n->mr, true)) {
> +        object_unparent(OBJECT(&n->mr));
>           munmap(addr, page_size);
>           goto err;
>       }


