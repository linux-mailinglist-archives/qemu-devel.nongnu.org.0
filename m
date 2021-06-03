Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB6D399A76
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 08:08:07 +0200 (CEST)
Received: from localhost ([::1]:36084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1logWU-0006g3-DS
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 02:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1logV6-0005lU-D9
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 02:06:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1logV4-0002ye-HB
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 02:06:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622700397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+O2jDrWbda3zHblT2Iea3D6cexCK+OUli3bYLt1J+f0=;
 b=T4LyC4vmPPFGdP185sRbR4RSiVOA9jKXGApskrgEshF3zrGqyVpxi57QF0Bz5Sh3tK4xsF
 3HAtKZzj1RQAQCAJ4nAsIneLD2Tvan4JDSCia+uC2f5mSnm8cHAbG8EGip1ussh3FALyOy
 V7I/0UbX8XibGuwUNVhDuvfDnzoGcyk=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-sJ2CuqH_OzminYq6nLMMqQ-1; Thu, 03 Jun 2021 02:06:35 -0400
X-MC-Unique: sJ2CuqH_OzminYq6nLMMqQ-1
Received: by mail-pj1-f71.google.com with SMTP id
 mw15-20020a17090b4d0fb0290157199aadbaso4782546pjb.7
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 23:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=+O2jDrWbda3zHblT2Iea3D6cexCK+OUli3bYLt1J+f0=;
 b=WmqHdPT9x13iBvJSalf0GwE/7LbqLA9vzIhqZPapuyIdPvUkt2Ir4HZeJUmPL4EsHM
 Piw1dKA3grOKDDlGNYZmUEZ+ClgKzIa2aBH7ATXIxSx7J55moDTJG7nGP8UuBitXhmi0
 n8Z8FFZNwpGnm/4szINciKeWz+SnkLPbx74+5Xi9WYJFbyJFy/WRtd/lOmEPwLfiD1Kf
 JwBp+JRuUy7trfhCp72iI2Nws44vCNcKyMHEhsFDvbr8tNw+kpoJromzLLqZ6b9QRhQg
 khbibzP+pGEELK3z8Ty11Z7b3OK2vhwFFmoKAXdEDMQiA7KGVwZEjFBfQQS01+uJ7NA1
 KeEg==
X-Gm-Message-State: AOAM533yMMNWIylhKDIDsBiyc1WUotWJQIOlP+IjXx8qFKKaVzcB2fgq
 MAl9R9wRN3dxwzawt88LZoVB1VZ1l52G5Vy3n+Q4leNk2YVcSMnXH/sRTFL3ymPovJKjUZUnDiH
 6kcfKudlk/PIoDQk6KLb6vDOXVpwGGM/WBZq8eT+EGu4fBB4tp9z3pCwJVD+Az0lxHFw=
X-Received: by 2002:a17:90a:7f92:: with SMTP id
 m18mr9232926pjl.168.1622700394489; 
 Wed, 02 Jun 2021 23:06:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFB2SQZbeMBjxzTgwz+FQOYpssSq2fncfQ0r+pYH82E/Y/WTBngNKc6Weqd/nhrssj1AKtHQ==
X-Received: by 2002:a17:90a:7f92:: with SMTP id
 m18mr9232898pjl.168.1622700394134; 
 Wed, 02 Jun 2021 23:06:34 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id s19sm1489223pgv.92.2021.06.02.23.06.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 23:06:33 -0700 (PDT)
Subject: Re: [PATCH v7 05/10] vhost-vdpa: add support for config interrupt
 call back
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210602034750.23377-1-lulu@redhat.com>
 <20210602034750.23377-6-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <655e3a49-229d-d858-3273-90e109dd7779@redhat.com>
Date: Thu, 3 Jun 2021 14:06:30 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210602034750.23377-6-lulu@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7,
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


ÔÚ 2021/6/2 ÉÏÎç11:47, Cindy Lu Ð´µÀ:
> Add new call back function in vhost-vdpa, this call back function only
> supported in vhost-vdpa backend
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/virtio/trace-events | 2 ++
>   hw/virtio/vhost-vdpa.c | 7 +++++++
>   2 files changed, 9 insertions(+)
>
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index c62727f879..60a15f0186 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -52,6 +52,8 @@ vhost_vdpa_set_vring_call(void *dev, unsigned int index, int fd) "dev: %p index:
>   vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRIx64
>   vhost_vdpa_set_owner(void *dev) "dev: %p"
>   vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
> +vhost_vdpa_set_config_call(void *dev, int *fd)"dev: %p fd: %p"


This tracing information is sub-optimal, I think we should show the fd 
instead of its address here.

Other looks good.

Thanks


> +
>   
>   # virtio.c
>   virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned out_num) "elem %p size %zd in_num %u out_num %u"
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 01d2101d09..9ba2a2bed4 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -545,6 +545,12 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
>       trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
>       return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
>   }
> +static int vhost_vdpa_set_config_call(struct vhost_dev *dev,
> +                                       int *fd)
> +{
> +    trace_vhost_vdpa_set_config_call(dev, fd);
> +    return vhost_vdpa_call(dev, VHOST_VDPA_SET_CONFIG_CALL, fd);
> +}
>   
>   static int vhost_vdpa_get_features(struct vhost_dev *dev,
>                                        uint64_t *features)
> @@ -611,4 +617,5 @@ const VhostOps vdpa_ops = {
>           .vhost_get_device_id = vhost_vdpa_get_device_id,
>           .vhost_vq_get_addr = vhost_vdpa_vq_get_addr,
>           .vhost_force_iommu = vhost_vdpa_force_iommu,
> +        .vhost_set_config_call = vhost_vdpa_set_config_call,
>   };


