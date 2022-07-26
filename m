Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 123A45809F1
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 05:23:54 +0200 (CEST)
Received: from localhost ([::1]:48768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGBAn-0002nY-0q
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 23:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGB8J-0000gD-Cz
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 23:21:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGB8F-0006Cw-S0
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 23:21:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658805675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lF5RVrDgu/u2AWLlwLhbFTlJOoq36QDrC8s56aect54=;
 b=Cnzdllqv1SiOFcCWukS6swPhjvF9mq4dvZHIMmUdTQc/v+Ns/CiBEjRBKFxq4KZKwRQhqh
 2IPbJA1iNlyIj6oRpEPmuGm0iP5DzqZ8sIonKr80WE1JOChVlcjSnuaL2bt7YN3OspbdjD
 AAJwgQOVtwvFuXa+3CkVD9Au+yxkt74=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-X1Q3WEKnN7GZPuy5qVDS2g-1; Mon, 25 Jul 2022 23:21:13 -0400
X-MC-Unique: X1Q3WEKnN7GZPuy5qVDS2g-1
Received: by mail-pj1-f71.google.com with SMTP id
 c15-20020a17090abf0f00b001f221ef494fso8747464pjs.0
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 20:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lF5RVrDgu/u2AWLlwLhbFTlJOoq36QDrC8s56aect54=;
 b=XcALaaU/rS/+MaFc1TzrbpQ2fQ0zBvWcGjo1jCFdJS30TE8eBXOMjkn4jqsX8/B60V
 g4aOfzg2fc2UCf38rsNd3N/DAYxSeVqy26VUnuPgxgC+/wwOCLHLgltQ8wTrtpQQEh4b
 7tr3zrBuHHf778SnekB4hEfHw7JHJg87YY3mS3FAevh3KyHgDubxwDo00WYC7zqwP7UJ
 OZiO7XaPOMMletfs0ncuKY0J6EzS+XQtW1xM0+O/Jv+ZXl+QpNPzwjQAQHL7DEMlSwKd
 sXzbXunpptgxRuav2FYvvKlDlGdmlW1dVSPxiT0/STOYg++/VC8HbasYahb2HYMngWya
 daCQ==
X-Gm-Message-State: AJIora8wnKwqKBeQ0RSEvFPnzr+3iSfLtVW9u7vsj0SA2KodgbG1V1/f
 eQoLYZD9VKXkMNv2k/4ZbSxKz4rq99/6GMdsv5UlK5l/m7h/5ADpw5HUyAG/woWI1o5KKoNyWiu
 a6448GuuDMyVhgg4=
X-Received: by 2002:a63:2051:0:b0:412:6d61:ab0a with SMTP id
 r17-20020a632051000000b004126d61ab0amr13910611pgm.52.1658805672747; 
 Mon, 25 Jul 2022 20:21:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sOSKcI1tpePWYseQEjWEFyTANCQCf4GVHWEKpFzQODH4LLPzaRbk9z7I+AhaT+rayVc8pYlQ==
X-Received: by 2002:a63:2051:0:b0:412:6d61:ab0a with SMTP id
 r17-20020a632051000000b004126d61ab0amr13910597pgm.52.1658805672396; 
 Mon, 25 Jul 2022 20:21:12 -0700 (PDT)
Received: from [10.72.12.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 v12-20020aa799cc000000b00528c149fe97sm10389784pfi.89.2022.07.25.20.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 20:21:11 -0700 (PDT)
Message-ID: <380617f9-059a-47b3-011e-fc81948bd853@redhat.com>
Date: Tue, 26 Jul 2022 11:21:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 05/16] virtio: introduce virtio_queue_reset()
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <59d980caae371c95343cb3a6e2e245b7bcc530ff.1658141552.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <59d980caae371c95343cb3a6e2e245b7bcc530ff.1658141552.git.kangjie.xu@linux.alibaba.com>
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
> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>
> Introduce a new interface function virtio_queue_reset() to implement
> reset for vq.
>
> Add a new callback to VirtioDeviceClass for queue reset operation for
> each child device.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/virtio/virtio.c         | 11 +++++++++++
>   include/hw/virtio/virtio.h |  2 ++
>   2 files changed, 13 insertions(+)
>
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 67d54832a9..0e9d41366f 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2039,6 +2039,17 @@ static void __virtio_queue_reset(VirtIODevice *vdev, uint32_t i)
>       virtio_virtqueue_reset_region_cache(&vdev->vq[i]);
>   }
>   
> +void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
> +{
> +    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> +
> +    if (k->queue_reset) {
> +        k->queue_reset(vdev, queue_index);
> +    }
> +
> +    __virtio_queue_reset(vdev, queue_index);
> +}
> +
>   void virtio_reset(void *opaque)
>   {
>       VirtIODevice *vdev = opaque;
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index db1c0ddf6b..879394299b 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -130,6 +130,7 @@ struct VirtioDeviceClass {
>       void (*set_config)(VirtIODevice *vdev, const uint8_t *config);
>       void (*reset)(VirtIODevice *vdev);
>       void (*set_status)(VirtIODevice *vdev, uint8_t val);
> +    void (*queue_reset)(VirtIODevice *vdev, uint32_t queue_index);
>       /* For transitional devices, this is a bitmap of features
>        * that are only exposed on the legacy interface but not
>        * the modern one.
> @@ -268,6 +269,7 @@ int virtio_queue_set_host_notifier_mr(VirtIODevice *vdev, int n,
>                                         MemoryRegion *mr, bool assign);
>   int virtio_set_status(VirtIODevice *vdev, uint8_t val);
>   void virtio_reset(void *opaque);
> +void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index);
>   void virtio_update_irq(VirtIODevice *vdev);
>   int virtio_set_features(VirtIODevice *vdev, uint64_t val);
>   


