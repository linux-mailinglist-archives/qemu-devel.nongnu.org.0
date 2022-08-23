Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A79059D27B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 09:43:57 +0200 (CEST)
Received: from localhost ([::1]:42740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQOZo-0003is-3L
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 03:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQOTn-0006w5-JN
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 03:37:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQOTl-0005pO-8N
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 03:37:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661240260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CIonI0pndNahGWn1l20K1UcfoNJB4vHsRJ0B1tkBDvA=;
 b=Ky27jAD24mPWSbBKUekUIwye81yALf8UcU6LfonHV5FqbCLdyJTfdKTM0382GDU+WOXNZY
 fLRJrVDx8JNSr/zzePt2z5s0cp2R3tLrmHLY/lcFswzAPhJRJwZE4hhlY/KDTXdg7sT75T
 ZLIBzQqLM2kPE8ldGT3SjOw4fSRQZfw=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-557-GF3nvmR-Pom2eBfT5hX7OQ-1; Tue, 23 Aug 2022 03:37:39 -0400
X-MC-Unique: GF3nvmR-Pom2eBfT5hX7OQ-1
Received: by mail-pl1-f200.google.com with SMTP id
 p8-20020a170902e74800b0017307429ca3so409561plf.17
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 00:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=CIonI0pndNahGWn1l20K1UcfoNJB4vHsRJ0B1tkBDvA=;
 b=FDHjBSfEIkbmzu/tqHyiyP/9gG6EWWmAt/c2P650JZXpao0tz5CvVl/yM4BvCU7TIb
 FCZfFrjC1soSVr2dGc9hTDz17K4Kj79WcJbFnhzkzRZs3Kk9s/vRHgSagjXvV9JlNKfU
 sVbNh1P3nT16E+3fFVOqR5ip9hcD/8Mwmac1d1DaVbxFhHwjKcVysbXzRUOv5NIDSLMb
 wIRW+1fdZSv8aFYSwKnl67I0pCJ2tZWkRvRoySypuNeHqgdFhTAXcpwsTha6/h8+E6AD
 IdJ43ORyPjxrSq1hEOYnEyRPkSHWCUYqz5QUIMvznfkl52+0KjKX1fiwCJ4/OVGPO965
 vV/w==
X-Gm-Message-State: ACgBeo3kLekAnSOQAzUFfUAAV82D6CNXL94DmURww9CSMzK5435/xhG9
 /77gvrQu0cht4j1uxCURG57sTlGk6xowVLOltHDNkknZjLfjTgzbwu/t68AeZzIL+zej3IyfiHC
 wPwOSZ5+RgvCmm80=
X-Received: by 2002:a17:902:a608:b0:172:ffa5:2ed8 with SMTP id
 u8-20020a170902a60800b00172ffa52ed8mr2075209plq.164.1661240258613; 
 Tue, 23 Aug 2022 00:37:38 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6P/h80lhkDahpuWfgo1C0h4uEVABSTwAU+1UMSffWJAqPrmQKT3OZygEKFUm3Jd6R+EBFSXQ==
X-Received: by 2002:a17:902:a608:b0:172:ffa5:2ed8 with SMTP id
 u8-20020a170902a60800b00172ffa52ed8mr2075189plq.164.1661240258309; 
 Tue, 23 Aug 2022 00:37:38 -0700 (PDT)
Received: from [10.72.13.141] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a170903235100b0016f1ef2cd44sm9734035plh.154.2022.08.23.00.37.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 00:37:37 -0700 (PDT)
Message-ID: <268c8e26-2f82-2bd1-c751-6f8f6930d73f@redhat.com>
Date: Tue, 23 Aug 2022 15:37:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 04/24] virtio: introduce virtio_queue_enable()
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <d308096f0734db11159ff114e55ccb5868270c8c.1660611460.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <d308096f0734db11159ff114e55ccb5868270c8c.1660611460.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


在 2022/8/16 09:06, Kangjie Xu 写道:
> Introduce the interface queue_enable() in VirtioDeviceClass and the
> fucntion virtio_queue_enable() in virtio, it can be called when
> VIRTIO_PCI_COMMON_Q_ENABLE is written and related virtqueue can be
> started. It only supports the devices of virtio 1 or later. The
> not-supported devices can only start the virtqueue when DRIVER_OK.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---


Acked-by: Jason Wang <jasowang@redhat.com>


>   hw/virtio/virtio.c         | 14 ++++++++++++++
>   include/hw/virtio/virtio.h |  2 ++
>   2 files changed, 16 insertions(+)
>
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 0e9d41366f..141f18c633 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2050,6 +2050,20 @@ void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
>       __virtio_queue_reset(vdev, queue_index);
>   }
>   
> +void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
> +{
> +    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> +
> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
> +        error_report("queue_enable is only suppported in devices of virtio "
> +                     "1.0 or later.");
> +    }
> +
> +    if (k->queue_enable) {
> +        k->queue_enable(vdev, queue_index);
> +    }
> +}
> +
>   void virtio_reset(void *opaque)
>   {
>       VirtIODevice *vdev = opaque;
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 879394299b..085997d8f3 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -131,6 +131,7 @@ struct VirtioDeviceClass {
>       void (*reset)(VirtIODevice *vdev);
>       void (*set_status)(VirtIODevice *vdev, uint8_t val);
>       void (*queue_reset)(VirtIODevice *vdev, uint32_t queue_index);
> +    void (*queue_enable)(VirtIODevice *vdev, uint32_t queue_index);
>       /* For transitional devices, this is a bitmap of features
>        * that are only exposed on the legacy interface but not
>        * the modern one.
> @@ -270,6 +271,7 @@ int virtio_queue_set_host_notifier_mr(VirtIODevice *vdev, int n,
>   int virtio_set_status(VirtIODevice *vdev, uint8_t val);
>   void virtio_reset(void *opaque);
>   void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index);
> +void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index);
>   void virtio_update_irq(VirtIODevice *vdev);
>   int virtio_set_features(VirtIODevice *vdev, uint64_t val);
>   


