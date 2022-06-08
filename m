Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9685420EF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 06:22:29 +0200 (CEST)
Received: from localhost ([::1]:45362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nynDA-0001Ab-Bc
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 00:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nynBq-0008Uy-Hu
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 00:21:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nynBo-0002gi-Kj
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 00:21:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654662063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eoHa6z8vHjIiDBmej5zMCDtj7BeQa/duYVRHa1SGMXQ=;
 b=dV5qxO/3zHdezRt0CHXpMnRERGVpD6wiUg3FkflsRosv8Lgrv3s3hq6aDCAhIoz33Hc0zf
 RwkOlvlBL8kHRnMcFACbvn6P5b6+t7CmQYRqH389AV+cqXS9G25llYFWxHU1Kfn2pU9Mqy
 iWBNVD/NYxSWekYZK8l7/z65pM8EwbI=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-BE3DIQvXPa6IJx7RhMk06Q-1; Wed, 08 Jun 2022 00:21:00 -0400
X-MC-Unique: BE3DIQvXPa6IJx7RhMk06Q-1
Received: by mail-pf1-f197.google.com with SMTP id
 e19-20020aa79813000000b0051bba91468eso9716407pfl.14
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 21:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eoHa6z8vHjIiDBmej5zMCDtj7BeQa/duYVRHa1SGMXQ=;
 b=h6+I8r5nfqZZOIabqZ/FFPY3MQ4QxlwROXXhIKE1AXhvI0RGcxOlsWSQqDp4bIs16P
 uycPSVNmuzDzimoNApPOoEWkjGR8jmwpKZUxvvaKouhfFaVw3NW1ThSfAhtkjzB+VYSq
 ViNBqSMtj5LyolzFhnzM92QangRVmMlE2TWwMDkF3yb+jo6wRYPIqz4iib43enBg7Acx
 2mN3F9kV2xKnO/PWeCqazQnzVEtWW+HL36FIwcNNxSU88EHYPAaC3aMYS5HCjPiHKh5S
 uEM99sK1cIxZaTQgOdQq6zUdCfHSld3eq300Qm92s0glGaihWDJC8sjq8w9u+uYZNSE7
 a+dg==
X-Gm-Message-State: AOAM531Lk731SKh1aucbyeiLXNHgeAshEwR1bdMaJDX3cQB823O4eaaY
 RZ2GUS0WcrEeShJmIp9RRfp1ugOs8FWc7warFfqYfkxghAIdTWjFAZiJp1SL33FZt281bx/TkAa
 yIU1AnShg7VeVT6k=
X-Received: by 2002:a17:902:d551:b0:168:93b6:a94a with SMTP id
 z17-20020a170902d55100b0016893b6a94amr1728540plf.149.1654662057586; 
 Tue, 07 Jun 2022 21:20:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzKjr79mtVMRgOXUwHmbT6hdIypHQhBtkOsMxQRdTGXylvDsnwEuMM3mToBLGa5cKgey6ffw==
X-Received: by 2002:a17:902:d551:b0:168:93b6:a94a with SMTP id
 z17-20020a170902d55100b0016893b6a94amr1728505plf.149.1654662057307; 
 Tue, 07 Jun 2022 21:20:57 -0700 (PDT)
Received: from [10.72.13.97] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a170902a50b00b001661f9ada6dsm13112189plq.143.2022.06.07.21.20.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 21:20:56 -0700 (PDT)
Message-ID: <21204df4-3e92-d1b7-042c-30f769c97893@redhat.com>
Date: Wed, 8 Jun 2022 12:20:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [RFC PATCH v8 12/21] vdpa: delay set_vring_ready after DRIVER_OK
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Eric Blake <eblake@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Parav Pandit <parav@mellanox.com>
References: <20220519191306.821774-1-eperezma@redhat.com>
 <20220519191306.821774-13-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220519191306.821774-13-eperezma@redhat.com>
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


在 2022/5/20 03:12, Eugenio Pérez 写道:
> To restore the device in the destination of a live migration we send the
> commands through control virtqueue. For a device to read CVQ it must
> have received DRIVER_OK status bit.
>
> However this open a window where the device could start receiving
> packets in rx queue 0 before it receive the RSS configuration. To avoid
> that, we will not send vring_enable until all configuration is used by
> the device.
>
> As a first step, reverse the DRIVER_OK and SET_VRING_ENABLE steps.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>


I may miss something, but it looks to me this should be an independent 
patch or it should depend on live migration series.

Thanks


> ---
>   hw/virtio/vhost-vdpa.c | 20 +++++++++++++++-----
>   1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 31b3d4d013..13e5e2a061 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -748,13 +748,18 @@ static int vhost_vdpa_get_vq_index(struct vhost_dev *dev, int idx)
>       return idx;
>   }
>   
> +/**
> + * Set ready all vring of the device
> + *
> + * @dev: Vhost device
> + */
>   static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
>   {
>       int i;
>       trace_vhost_vdpa_set_vring_ready(dev);
> -    for (i = 0; i < dev->nvqs; ++i) {
> +    for (i = 0; i < dev->vq_index_end; ++i) {
>           struct vhost_vring_state state = {
> -            .index = dev->vq_index + i,
> +            .index = i,
>               .num = 1,
>           };
>           vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
> @@ -1117,7 +1122,6 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>           if (unlikely(!ok)) {
>               return -1;
>           }
> -        vhost_vdpa_set_vring_ready(dev);
>       } else {
>           ok = vhost_vdpa_svqs_stop(dev);
>           if (unlikely(!ok)) {
> @@ -1131,16 +1135,22 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>       }
>   
>       if (started) {
> +        int r;
>           memory_listener_register(&v->listener, &address_space_memory);
> -        return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> +        r = vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> +        if (unlikely(r)) {
> +            return r;
> +        }
> +        vhost_vdpa_set_vring_ready(dev);
>       } else {
>           vhost_vdpa_reset_device(dev);
>           vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>                                      VIRTIO_CONFIG_S_DRIVER);
>           memory_listener_unregister(&v->listener);
>   
> -        return 0;
>       }
> +
> +    return 0;
>   }
>   
>   static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,


