Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2415259D24B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 09:37:27 +0200 (CEST)
Received: from localhost ([::1]:51114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQOTU-0006hz-DO
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 03:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQONq-0003sI-9P
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 03:31:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQONn-00054t-5X
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 03:31:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661239890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nrjh+aICjKiFUeoCvZ1PPxeY/16Gg4/pCq5Gp6JOea8=;
 b=QcQpjKcyS848VKPBZIwtvhjRLu1kov3I0nuTrmqBsOoq32fkpwx3iBAmBhxHyvz8/iEyp8
 vlqU0yR//1Vw8iJRKyxatdre3rZ74Lw+PRpnJ+/zR792c56IhbuU9sssipvhv+tKApMYSq
 dKGI6G+hcsHt/3A2XBb/388ayUJm0No=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-218-YT93hTT0NPS5veo4MDI57w-1; Tue, 23 Aug 2022 03:31:29 -0400
X-MC-Unique: YT93hTT0NPS5veo4MDI57w-1
Received: by mail-pj1-f71.google.com with SMTP id
 s17-20020a17090aad9100b001faf81f9654so5986604pjq.5
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 00:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Nrjh+aICjKiFUeoCvZ1PPxeY/16Gg4/pCq5Gp6JOea8=;
 b=6okHrxDtQZn8VUdW3Do0T6QMbY+1MdUVTl3hPZQIln63CRVypnvqArOwJGcA7CRG+v
 2mVv0EpVKvUOQl0e1C4V8s7weK+w1p5N/ZxII9qvZkd0fd2MLvSwXYEqqOIUA15r7M/4
 E70uYzfrhXTjRorawVSj8ItrCnj2XfBv2MkTRB9SLiRsD7i+/us+Zp4K6Xr4rrWZft8g
 Z2no1+5Kqe6DuE/neE77LeE86yVws/LJ1/WziFN1jqEKaFKWlOVoINqWNwl/GIggsY08
 Xrqr3t+mB9HkpXphsJretO1tT6RmPatzhD0T4sULOAfVZtAJlBEbFAKsfHVKlQbUNb5L
 AsWg==
X-Gm-Message-State: ACgBeo2kOHXZ7ZwXKucmb9+2R/+CIdJuulxBa0xqn6GdtZG5UFAHIUID
 VRms66QVkIKfprhnVWfvz3UckvzQN3AjyjyyZQF96s0k6sjJzk6wiUdZJJq39ZmLECplVOji7PG
 uCIwFABGK8A/6T2U=
X-Received: by 2002:a17:902:d4c4:b0:172:f328:e474 with SMTP id
 o4-20020a170902d4c400b00172f328e474mr5925508plg.144.1661239888005; 
 Tue, 23 Aug 2022 00:31:28 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6WIXolhzggt8a19/ueSWTJM7srqXDwJTUkyzHBcTZWnJJg1j9/BS9nKh+S/nUDlU3y70bhkg==
X-Received: by 2002:a17:902:d4c4:b0:172:f328:e474 with SMTP id
 o4-20020a170902d4c400b00172f328e474mr5925490plg.144.1661239887727; 
 Tue, 23 Aug 2022 00:31:27 -0700 (PDT)
Received: from [10.72.13.141] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 x11-20020aa7956b000000b00535da15a252sm9601137pfq.165.2022.08.23.00.31.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 00:31:27 -0700 (PDT)
Message-ID: <f6b1c100-5d8b-c05e-0813-4fd2adeb88cb@redhat.com>
Date: Tue, 23 Aug 2022 15:31:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 02/24] virtio: introduce __virtio_queue_reset()
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <0031ce31c24905031d8af9df82af18a1f3c932de.1660611460.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <0031ce31c24905031d8af9df82af18a1f3c932de.1660611460.git.kangjie.xu@linux.alibaba.com>
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


在 2022/8/16 09:06, Kangjie Xu 写道:
> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>
> Separate the logic of vq reset. This logic will be called directly
> later.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/virtio/virtio.c | 37 +++++++++++++++++++++----------------
>   1 file changed, 21 insertions(+), 16 deletions(-)
>
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 5d607aeaa0..67d54832a9 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2019,6 +2019,26 @@ static enum virtio_device_endian virtio_current_cpu_endian(void)
>       }
>   }
>   
> +static void __virtio_queue_reset(VirtIODevice *vdev, uint32_t i)
> +{
> +    vdev->vq[i].vring.desc = 0;
> +    vdev->vq[i].vring.avail = 0;
> +    vdev->vq[i].vring.used = 0;
> +    vdev->vq[i].last_avail_idx = 0;
> +    vdev->vq[i].shadow_avail_idx = 0;
> +    vdev->vq[i].used_idx = 0;
> +    vdev->vq[i].last_avail_wrap_counter = true;
> +    vdev->vq[i].shadow_avail_wrap_counter = true;
> +    vdev->vq[i].used_wrap_counter = true;
> +    virtio_queue_set_vector(vdev, i, VIRTIO_NO_VECTOR);
> +    vdev->vq[i].signalled_used = 0;
> +    vdev->vq[i].signalled_used_valid = false;
> +    vdev->vq[i].notification = true;
> +    vdev->vq[i].vring.num = vdev->vq[i].vring.num_default;
> +    vdev->vq[i].inuse = 0;
> +    virtio_virtqueue_reset_region_cache(&vdev->vq[i]);
> +}
> +
>   void virtio_reset(void *opaque)
>   {
>       VirtIODevice *vdev = opaque;
> @@ -2050,22 +2070,7 @@ void virtio_reset(void *opaque)
>       virtio_notify_vector(vdev, vdev->config_vector);
>   
>       for(i = 0; i < VIRTIO_QUEUE_MAX; i++) {
> -        vdev->vq[i].vring.desc = 0;
> -        vdev->vq[i].vring.avail = 0;
> -        vdev->vq[i].vring.used = 0;
> -        vdev->vq[i].last_avail_idx = 0;
> -        vdev->vq[i].shadow_avail_idx = 0;
> -        vdev->vq[i].used_idx = 0;
> -        vdev->vq[i].last_avail_wrap_counter = true;
> -        vdev->vq[i].shadow_avail_wrap_counter = true;
> -        vdev->vq[i].used_wrap_counter = true;
> -        virtio_queue_set_vector(vdev, i, VIRTIO_NO_VECTOR);
> -        vdev->vq[i].signalled_used = 0;
> -        vdev->vq[i].signalled_used_valid = false;
> -        vdev->vq[i].notification = true;
> -        vdev->vq[i].vring.num = vdev->vq[i].vring.num_default;
> -        vdev->vq[i].inuse = 0;
> -        virtio_virtqueue_reset_region_cache(&vdev->vq[i]);
> +        __virtio_queue_reset(vdev, i);
>       }
>   }
>   


