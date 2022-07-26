Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E213580BA0
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 08:28:45 +0200 (CEST)
Received: from localhost ([::1]:46534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGE3g-0001Lf-9k
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 02:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oGDzy-00084I-Vy
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 02:24:55 -0400
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:50914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oGDzc-0005PA-Pt
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 02:24:50 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0VKU9h-q_1658816662; 
Received: from 30.227.68.147(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VKU9h-q_1658816662) by smtp.aliyun-inc.com;
 Tue, 26 Jul 2022 14:24:23 +0800
Message-ID: <1dee6c9f-aeee-cd72-7141-dd95eed811c0@linux.alibaba.com>
Date: Tue, 26 Jul 2022 14:24:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 16/16] vhost-net: vq reset feature bit support
To: Jason Wang <jasowang@redhat.com>
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <229f4bc4d6ba7e85a09d6f35d2d06f3cc6a46a6a.1658141552.git.kangjie.xu@linux.alibaba.com>
 <e443d984-d4ae-084a-060c-70f802830014@redhat.com>
Cc: mst@redhat.com, xuanzhuo@linux.alibaba.com, hengqi@linux.alibaba.com,
 qemu-devel@nongnu.org
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
In-Reply-To: <e443d984-d4ae-084a-060c-70f802830014@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.54;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-54.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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


在 2022/7/26 12:28, Jason Wang 写道:
>
> 在 2022/7/18 19:17, Kangjie Xu 写道:
>> Add support for negotation of vq reset feature bit.
>>
>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>
>
> I'd suggest to add support for vhost-net kernel as well. It looks much 
> more easier than vhost-user (I guess a stop/start would do the trick).
>
> Thanks
>
>
Yeah, we've planned to support it in the future.

Thanks

>> ---
>>   hw/net/vhost_net.c  | 1 +
>>   hw/net/virtio-net.c | 3 ++-
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>> index 4f5f034c11..de910f6466 100644
>> --- a/hw/net/vhost_net.c
>> +++ b/hw/net/vhost_net.c
>> @@ -73,6 +73,7 @@ static const int user_feature_bits[] = {
>>       VIRTIO_NET_F_MTU,
>>       VIRTIO_F_IOMMU_PLATFORM,
>>       VIRTIO_F_RING_PACKED,
>> +    VIRTIO_F_RING_RESET,
>>       VIRTIO_NET_F_RSS,
>>       VIRTIO_NET_F_HASH_REPORT,
>>   diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>> index 0747ffe71c..a8b299067a 100644
>> --- a/hw/net/virtio-net.c
>> +++ b/hw/net/virtio-net.c
>> @@ -757,6 +757,8 @@ static uint64_t 
>> virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
>>         virtio_add_feature(&features, VIRTIO_NET_F_MAC);
>>   +    virtio_add_feature(&features, VIRTIO_F_RING_RESET);
>> +
>>       if (!peer_has_vnet_hdr(n)) {
>>           virtio_clear_feature(&features, VIRTIO_NET_F_CSUM);
>>           virtio_clear_feature(&features, VIRTIO_NET_F_HOST_TSO4);
>> @@ -777,7 +779,6 @@ static uint64_t 
>> virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
>>       }
>>         if (!get_vhost_net(nc->peer)) {
>> -        virtio_add_feature(&features, VIRTIO_F_RING_RESET);
>>           return features;
>>       }

