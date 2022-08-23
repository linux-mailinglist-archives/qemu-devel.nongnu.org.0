Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AF459D18C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 08:56:27 +0200 (CEST)
Received: from localhost ([::1]:55130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQNpp-0005Q0-KU
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 02:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQNab-0005GA-1o
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 02:40:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQNaU-00051G-MB
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 02:40:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661236832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P53PLHBxX0sYVroH2ug9vIN7dDMiZnJm6kmX+xtjKhc=;
 b=Bu0E1JSiQBpJSvd8UM4Oi5LE4RMo2flCQgI8iOftgiVXjYStgOyT9KO0hTru9w4gDMTCox
 NqfE7yTegxRMdE0jTUV/u0jBFd1WwEEjX4Eqk25lKrypQEvpdRi/MSh+Gc1diiM1c/uvTJ
 YFK90QSmPmxZSI/UBeX9IYtnvGFYrcI=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-102-TkhSikbsOR22J1wY7hwQXg-1; Tue, 23 Aug 2022 02:40:30 -0400
X-MC-Unique: TkhSikbsOR22J1wY7hwQXg-1
Received: by mail-pl1-f199.google.com with SMTP id
 u14-20020a17090341ce00b00172f000e493so2749877ple.8
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 23:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=P53PLHBxX0sYVroH2ug9vIN7dDMiZnJm6kmX+xtjKhc=;
 b=HRo9P9nnPJfFpJ1B0nxRDVOFqD18DjDEBXXp9r7BRcd4oyFr6Y/KxX0QgVQZuW5nHU
 NwCuf5+xD+ySnjN5g6YXP0DWiQ3SNkuOi0cPabXT5O1jFdu5Kc4PZ3lalxP2Rtqb/6uk
 YmE4+QBvmGjnSj/K/yKy6Fm7OB0ZcHkKtONFosrlR4ZL8cphQhYDgnIC/jJ6vMqYvMIB
 //ZCxb+FqpJuySGloMjxhbDdGasza4DVf135C/mqBy6eIKUyVSCokxo9/vSyZFtbEA4G
 BJKX7rhRjcw5q5tN1Voiq8jeJKrRulcpbjFmNI+sYpaPE4bq4rZM5Z840xksqmYCLAyb
 skLg==
X-Gm-Message-State: ACgBeo1WTmv2YSQieqZ8o8gp5shpDkFx0fS0Ph4k7bvfnLdDtLAaY3ze
 R+rxeYl2rpNSc8h6f08SPwuLyGCi0yGCrtQC/aPHV7UVsRvypzuQ659j8hXP7y8FsC1SZgmoh3w
 sZcym/069CvCH4Mo=
X-Received: by 2002:a17:902:ce11:b0:172:6f2c:a910 with SMTP id
 k17-20020a170902ce1100b001726f2ca910mr23580747plg.156.1661236829416; 
 Mon, 22 Aug 2022 23:40:29 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7jpzTxY9NEqv93+PGgYw7ZA3lsI8XxS82JIV2eSLXaAJcAZJdzSd92UbdNaf0P+iX6ehWTxw==
X-Received: by 2002:a17:902:ce11:b0:172:6f2c:a910 with SMTP id
 k17-20020a170902ce1100b001726f2ca910mr23580738plg.156.1661236829190; 
 Mon, 22 Aug 2022 23:40:29 -0700 (PDT)
Received: from [10.72.13.141] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 j68-20020a625547000000b0052e37b32618sm9799352pfb.132.2022.08.22.23.40.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 23:40:28 -0700 (PDT)
Message-ID: <f55e8c88-4ea6-0152-73c1-afa1601dfb26@redhat.com>
Date: Tue, 23 Aug 2022 14:40:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 7/7] vdpa: Use ring hwaddr at vhost_vdpa_svq_unmap_ring
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Lei Yang <leiyang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220819165357.3591965-1-eperezma@redhat.com>
 <20220819165357.3591965-8-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220819165357.3591965-8-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


在 2022/8/20 00:53, Eugenio Pérez 写道:
> Reduce code duplication.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>

(In the future, we need to look for other cases where a function may use 
only a partial of DMAMap.)

Thanks


> ---
>   hw/virtio/vhost-vdpa.c | 17 ++++++++---------
>   1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 07d00f5284..45d6e86b45 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -884,10 +884,12 @@ static int vhost_vdpa_svq_set_fds(struct vhost_dev *dev,
>   /**
>    * Unmap a SVQ area in the device
>    */
> -static void vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v,
> -                                      const DMAMap *needle)
> +static void vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v, hwaddr addr)
>   {
> -    const DMAMap *result = vhost_iova_tree_find_iova(v->iova_tree, needle);
> +    const DMAMap needle = {
> +        .translated_addr = addr,
> +    };
> +    const DMAMap *result = vhost_iova_tree_find_iova(v->iova_tree, &needle);
>       hwaddr size;
>       int r;
>   
> @@ -908,17 +910,14 @@ static void vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v,
>   static void vhost_vdpa_svq_unmap_rings(struct vhost_dev *dev,
>                                          const VhostShadowVirtqueue *svq)
>   {
> -    DMAMap needle = {};
>       struct vhost_vdpa *v = dev->opaque;
>       struct vhost_vring_addr svq_addr;
>   
>       vhost_svq_get_vring_addr(svq, &svq_addr);
>   
> -    needle.translated_addr = svq_addr.desc_user_addr;
> -    vhost_vdpa_svq_unmap_ring(v, &needle);
> +    vhost_vdpa_svq_unmap_ring(v, svq_addr.desc_user_addr);
>   
> -    needle.translated_addr = svq_addr.used_user_addr;
> -    vhost_vdpa_svq_unmap_ring(v, &needle);
> +    vhost_vdpa_svq_unmap_ring(v, svq_addr.used_user_addr);
>   }
>   
>   /**
> @@ -996,7 +995,7 @@ static bool vhost_vdpa_svq_map_rings(struct vhost_dev *dev,
>       ok = vhost_vdpa_svq_map_ring(v, &device_region, errp);
>       if (unlikely(!ok)) {
>           error_prepend(errp, "Cannot create vq device region: ");
> -        vhost_vdpa_svq_unmap_ring(v, &driver_region);
> +        vhost_vdpa_svq_unmap_ring(v, driver_region.translated_addr);
>       }
>       addr->used_user_addr = device_region.iova;
>   


