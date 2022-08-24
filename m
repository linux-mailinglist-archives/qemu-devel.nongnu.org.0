Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F01E59F62F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 11:29:23 +0200 (CEST)
Received: from localhost ([::1]:50820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQmhO-0008U4-Fl
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 05:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oQmX3-0001q2-E1
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:18:41 -0400
Received: from out199-15.us.a.mail.aliyun.com ([47.90.199.15]:20597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oQmWx-0006Ri-Ep
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:18:37 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R911e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VN6lXvw_1661332705; 
Received: from 30.227.72.120(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VN6lXvw_1661332705) by smtp.aliyun-inc.com;
 Wed, 24 Aug 2022 17:18:26 +0800
Message-ID: <ab0e91bb-4c59-a2e2-0406-0fac8e06461e@linux.alibaba.com>
Date: Wed, 24 Aug 2022 17:18:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 18/24] vhost-net: vhost-user: update
 vhost_net_virtqueue_stop()
To: Jason Wang <jasowang@redhat.com>
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <303811ffeac48647ac4c81eeec542292e8f67a0e.1660611460.git.kangjie.xu@linux.alibaba.com>
 <3b60bcab-f69b-7ec9-caa8-c5947a14b659@redhat.com>
 <ecce701d-3bec-b98e-6d46-5ca85542ef87@linux.alibaba.com>
 <f3293e23-feec-3388-18e5-6db6b78bdd51@redhat.com>
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
In-Reply-To: <f3293e23-feec-3388-18e5-6db6b78bdd51@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=47.90.199.15;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out199-15.us.a.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
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


在 2022/8/24 17:04, Jason Wang 写道:
>
> 在 2022/8/24 12:57, Kangjie Xu 写道:
>>
>> 在 2022/8/24 12:05, Jason Wang 写道:
>>>
>>> 在 2022/8/16 09:06, Kangjie Xu 写道:
>>>> Update vhost_net_virtqueue_stop() for vhost-user scenario.
>>>
>>>
>>> Let's explain why it is needed now or why it doesn't cause any issue 
>>> or it's a bug fix or not.
>>>
>>> Thanks
>>>
>> This patch is to suppport vq reset for vhost-user.
>>
>> We need this simply because the behavior of vhost_ops->get_vq_index() 
>> is different in vhost-user and vhost-kernel.
>>
>> vhost_user_get_vq_index(dev, idx) simply returns "idx".
>>
>> vhost_kernel_get_vq_index(dev, idx) returns "idx - dev->vq_index".
>>
>> Thanks
>
>
> Let's add them in the change-log in the next version.
Sorry, i don't get what to be changed here, could you explain it?
>
> But the question still, is this a bug fix (requires a Fixes tag)? If 
> not why do we need this now?
>
> Thanks
>
Actually, it is not a bugfix, it is simply intended to support vhost-user.

Because vhost_ops->get_vq_index returns different values for 
vhost-kernel and vhost-user.

To align vhost-kernel and vhost-user and reuse the following code,

     vhost_dev_virtqueue_stop(&net->dev, vdev, idx);

we process the 'idx' here for vhost-user specifically.

Thanks.

>
>>
>>>
>>>>
>>>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>>>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>>>> ---
>>>>   hw/net/vhost_net.c | 4 ++++
>>>>   1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>>>> index 2ab67e875e..c0d408f3b4 100644
>>>> --- a/hw/net/vhost_net.c
>>>> +++ b/hw/net/vhost_net.c
>>>> @@ -533,6 +533,10 @@ void vhost_net_virtqueue_stop(VirtIODevice 
>>>> *vdev, NetClientState *nc,
>>>>           assert(r >= 0);
>>>>       }
>>>>   +    if (net->nc->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
>>>> +        idx = idx - net->dev.vq_index;
>>>> +    }
>>>> +
>>>>       vhost_dev_virtqueue_stop(&net->dev, vdev, idx);
>>>>   }
>>

