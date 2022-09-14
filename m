Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0DC5B7F32
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 05:09:34 +0200 (CEST)
Received: from localhost ([::1]:47480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYImL-0003B5-7T
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 23:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYIkU-0000s5-5P
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 23:07:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYIkR-0001Q0-9T
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 23:07:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663124854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xSAqoz0bN9Ci45bSLjTWu4fjOjZ4ObMemX61hfa2haY=;
 b=SdnF7bLnMZdbWxa3Z3YHUu+El2RPdLXQi1HWxZnBD2m3TVBQ3LXLzHjiXBN8O1X69f5Gtx
 5FBQ64y93rroHl0DMADmD9oQx2t5T8gbrRkndXxiAaqK/qRqiKQolssYFZbvO3+alGNDeK
 oKbDDXWxcgXwVEkvO4j9OzT27DeYYAE=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-288-erV79tlpMI2eaJq9fkY3sQ-1; Tue, 13 Sep 2022 23:07:33 -0400
X-MC-Unique: erV79tlpMI2eaJq9fkY3sQ-1
Received: by mail-pj1-f71.google.com with SMTP id
 o23-20020a17090aac1700b002006b02384fso11057955pjq.3
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 20:07:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=xSAqoz0bN9Ci45bSLjTWu4fjOjZ4ObMemX61hfa2haY=;
 b=axoICiky7hq7u3qCO29w01BCJMugDc1ChFQwX2grHyixfa53nofAtGBqaOqHCgfo0r
 TFlI9lgUwTPikcnkT2OhJS36mWKCNlmBd4eVUTTls8nVxrOwwPIU1KYKwCgNV7vWhKlT
 CgkkZLCIN8zYDTMD28cw+yYA1hl2bew3t2XGeDuxWBYgB4BSugSAzo+Q3PPsbhVQYbzn
 KE52hTwwYDtJEXXn7aCNAi0XqVBfkLfiNi9L2oKa60qhuv8irabUl2SS1yH2i7ecbRy6
 23GxLpNjHC+KnZtqlXAg8ZsGgjgASL5WpOr12Dt6JYM1DOo804iBL/K3DVyS2yJ1Jlej
 qFTg==
X-Gm-Message-State: ACrzQf3YAGtwJv+GWl3yVOmQkUnPsW/uqEqoFj12Z8/fP7aHB5LO+8Ul
 i+ponaKbTFchU98LLK8UY4qDtQeH2hT0OUp2y3IASquitserDXUXE+9YWW7TlS8FzqfcnP2ceBv
 wP5Gfodka/ZhM2Nw=
X-Received: by 2002:a17:90b:4b43:b0:202:e09c:664d with SMTP id
 mi3-20020a17090b4b4300b00202e09c664dmr2439130pjb.120.1663124848279; 
 Tue, 13 Sep 2022 20:07:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6GUGSpfr/wyRWwTt6/GSo/xy7wMeOAerb2oLlmAQZE8Gas4UrW2QhnF320HzF94QkyN0t87g==
X-Received: by 2002:a17:90b:4b43:b0:202:e09c:664d with SMTP id
 mi3-20020a17090b4b4300b00202e09c664dmr2439117pjb.120.1663124848074; 
 Tue, 13 Sep 2022 20:07:28 -0700 (PDT)
Received: from [10.72.13.65] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a17090a5b1600b001fd77933fb3sm8123041pji.17.2022.09.13.20.07.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 20:07:27 -0700 (PDT)
Message-ID: <4421cc8d-8226-e435-6d53-171c032b174a@redhat.com>
Date: Wed, 14 Sep 2022 11:07:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/6] vhost-user: add op to enable or disable a single
 vring
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, arei.gonglei@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1662949366.git.kangjie.xu@linux.alibaba.com>
 <985e7facb121059d06631a9688e93d11e453795c.1662949366.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <985e7facb121059d06631a9688e93d11e453795c.1662949366.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.628, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


在 2022/9/12 11:10, Kangjie Xu 写道:
> There is only vhost_set_dev_enable op in VhostOps. Thus, we introduce
> the interface vhost_set_vring_enable to set the enable status for a
> single vring.
>
> Resetting a single vq will rely on this interface.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/virtio/vhost-user.c            | 25 ++++++++++++++++++-------
>   include/hw/virtio/vhost-backend.h |  3 +++
>   2 files changed, 21 insertions(+), 7 deletions(-)
>
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index 794519359b..3f140d5085 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -1198,6 +1198,22 @@ static int vhost_user_set_vring_base(struct vhost_dev *dev,
>       return vhost_set_vring(dev, VHOST_USER_SET_VRING_BASE, ring);
>   }
>   
> +static int vhost_user_set_vring_enable(struct vhost_dev *dev,
> +                                       int index,
> +                                       int enable)
> +{
> +    if (index < dev->vq_index || index >= dev->vq_index + dev->nvqs) {
> +        return -EINVAL;
> +    }
> +
> +    struct vhost_vring_state state = {
> +        .index = index,
> +        .num   = enable,
> +    };
> +
> +    return vhost_set_vring(dev, VHOST_USER_SET_VRING_ENABLE, &state);
> +}
> +
>   static int vhost_user_set_dev_enable(struct vhost_dev *dev, int enable)
>   {
>       int i;
> @@ -1207,13 +1223,7 @@ static int vhost_user_set_dev_enable(struct vhost_dev *dev, int enable)
>       }
>   
>       for (i = 0; i < dev->nvqs; ++i) {
> -        int ret;
> -        struct vhost_vring_state state = {
> -            .index = dev->vq_index + i,
> -            .num   = enable,
> -        };
> -
> -        ret = vhost_set_vring(dev, VHOST_USER_SET_VRING_ENABLE, &state);
> +        int ret = vhost_user_set_vring_enable(dev, dev->vq_index + i, enable);
>           if (ret < 0) {
>               /*
>                * Restoring the previous state is likely infeasible, as well as
> @@ -2627,6 +2637,7 @@ const VhostOps user_ops = {
>           .vhost_set_owner = vhost_user_set_owner,
>           .vhost_reset_device = vhost_user_reset_device,
>           .vhost_get_vq_index = vhost_user_get_vq_index,
> +        .vhost_set_vring_enable = vhost_user_set_vring_enable,
>           .vhost_set_dev_enable = vhost_user_set_dev_enable,
>           .vhost_requires_shm_log = vhost_user_requires_shm_log,
>           .vhost_migration_done = vhost_user_migration_done,
> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
> index b49432045f..dad7191bac 100644
> --- a/include/hw/virtio/vhost-backend.h
> +++ b/include/hw/virtio/vhost-backend.h
> @@ -81,6 +81,8 @@ typedef int (*vhost_set_backend_cap_op)(struct vhost_dev *dev);
>   typedef int (*vhost_set_owner_op)(struct vhost_dev *dev);
>   typedef int (*vhost_reset_device_op)(struct vhost_dev *dev);
>   typedef int (*vhost_get_vq_index_op)(struct vhost_dev *dev, int idx);
> +typedef int (*vhost_set_vring_enable_op)(struct vhost_dev *dev,
> +                                         int index, int enable);
>   typedef int (*vhost_set_dev_enable_op)(struct vhost_dev *dev,
>                                          int enable);
>   typedef bool (*vhost_requires_shm_log_op)(struct vhost_dev *dev);
> @@ -155,6 +157,7 @@ typedef struct VhostOps {
>       vhost_set_owner_op vhost_set_owner;
>       vhost_reset_device_op vhost_reset_device;
>       vhost_get_vq_index_op vhost_get_vq_index;
> +    vhost_set_vring_enable_op vhost_set_vring_enable;
>       vhost_set_dev_enable_op vhost_set_dev_enable;
>       vhost_requires_shm_log_op vhost_requires_shm_log;
>       vhost_migration_done_op vhost_migration_done;


