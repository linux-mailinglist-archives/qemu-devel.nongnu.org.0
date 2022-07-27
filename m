Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B9E582085
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 08:55:44 +0200 (CEST)
Received: from localhost ([::1]:39194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGaxL-0000We-HM
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 02:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oGamP-0000Oi-Dg
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 02:44:26 -0400
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:38276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oGamF-0002KT-2I
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 02:44:18 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0VKZluKf_1658904240; 
Received: from 30.227.68.147(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VKZluKf_1658904240) by smtp.aliyun-inc.com;
 Wed, 27 Jul 2022 14:44:01 +0800
Message-ID: <1fcf4956-a28f-ada5-87c8-e3c64fb57eb4@linux.alibaba.com>
Date: Wed, 27 Jul 2022 14:44:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 09/16] vhost-user: enable/disable a single vring
To: Jason Wang <jasowang@redhat.com>
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <46deff7d44ad806a4bfb9235e57b0d37d8cfa95c.1658141552.git.kangjie.xu@linux.alibaba.com>
 <3fd4d288-8db7-41f4-7e8b-0a8ef44c936f@redhat.com>
 <1b0f4eed-7925-949d-678a-f929c6baddda@linux.alibaba.com>
 <CACGkMEsQ6aW-ihHoiioD5M6acVwQ2vgW97XJ0BoQxVtc3JnNVw@mail.gmail.com>
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
In-Reply-To: <CACGkMEsQ6aW-ihHoiioD5M6acVwQ2vgW97XJ0BoQxVtc3JnNVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.133;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-133.freemail.mail.aliyun.com
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


在 2022/7/27 12:51, Jason Wang 写道:
> On Tue, Jul 26, 2022 at 1:27 PM Kangjie Xu <kangjie.xu@linux.alibaba.com> wrote:
>>
>> 在 2022/7/26 12:07, Jason Wang 写道:
>>> 在 2022/7/18 19:17, Kangjie Xu 写道:
>>>> Implement the vhost_set_single_vring_enable, which is to enable or
>>>> disable a single vring.
>>>>
>>>> The parameter wait_for_reply is added to help for some cases such as
>>>> vq reset.
>>>>
>>>> Meanwhile, vhost_user_set_vring_enable() is refactored.
>>>>
>>>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>>>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>>>> ---
>>>>    hw/virtio/vhost-user.c | 55 ++++++++++++++++++++++++++++++++++++------
>>>>    1 file changed, 48 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
>>>> index 75b8df21a4..5a80a415f0 100644
>>>> --- a/hw/virtio/vhost-user.c
>>>> +++ b/hw/virtio/vhost-user.c
>>>> @@ -267,6 +267,8 @@ struct scrub_regions {
>>>>        int fd_idx;
>>>>    };
>>>>    +static int enforce_reply(struct vhost_dev *dev, const VhostUserMsg
>>>> *msg);
>>>> +
>>>>    static bool ioeventfd_enabled(void)
>>>>    {
>>>>        return !kvm_enabled() || kvm_eventfds_enabled();
>>>> @@ -1198,6 +1200,49 @@ static int vhost_user_set_vring_base(struct
>>>> vhost_dev *dev,
>>>>        return vhost_set_vring(dev, VHOST_USER_SET_VRING_BASE, ring);
>>>>    }
>>>>    +
>>>> +static int vhost_user_set_single_vring_enable(struct vhost_dev *dev,
>>>> +                                              int index,
>>>> +                                              int enable,
>>>> +                                              bool wait_for_reply)
>>>> +{
>>>> +    int ret;
>>>> +
>>>> +    if (index < dev->vq_index || index >= dev->vq_index + dev->nvqs) {
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    struct vhost_vring_state state = {
>>>> +        .index = index,
>>>> +        .num   = enable,
>>>> +    };
>>>> +
>>>> +    VhostUserMsg msg = {
>>>> +        .hdr.request = VHOST_USER_SET_VRING_ENABLE,
>>>> +        .hdr.flags = VHOST_USER_VERSION,
>>>> +        .payload.state = state,
>>>> +        .hdr.size = sizeof(msg.payload.state),
>>>> +    };
>>>> +
>>>> +    bool reply_supported = virtio_has_feature(dev->protocol_features,
>>>> + VHOST_USER_PROTOCOL_F_REPLY_ACK);
>>>> +
>>>> +    if (reply_supported && wait_for_reply) {
>>>> +        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
>>>> +    }
>>>
>>> Do we need to fail if !realy_supported && wait_for_reply?
>>>
>>> Thanks
>>>
>>>
>> I guess you mean "should we fail if VHOST_USER_PROTOCOL_F_REPLY_ACK
>> feature is not supported?".
>>
>> The implementation here is similar to that in vhost_user_set_vring_addr().
>>
>> If this feature is not supported, it will call enforce_reply(), then
>> call vhost_user_get_features() to get a reply.
> Ok, so you meant we can then fallback to VHOST_USER_GET_FEATURES? I
> wonder how robust is this, e.g is the bakcend required to process
> vhost-user request in order?
>
> Thanks
Yes, we rely on VHOST_USER_GET_FEATURES message to ensure that 
VHOST_USER_SET_VRING_ENABLE has been processed.

It's not robust. I reviewed the vhost-user protocol in qemu doc, 
actually it does not specify that the backend should process them in order.

I think adding a new vhost protocol message can fix this issue. The new 
invented message should reset the queue, and have a blocked read to 
ensure the message has been processed.

Thanks

>> Since the messages will be processed sequentailly in DPDK, success of
>> enforce_reply() means the previous message VHOST_USER_SET_VRING_ENABLE
>> has been processed.
>>
>> Thanks
>>
>>>> +
>>>> +    ret = vhost_user_write(dev, &msg, NULL, 0);
>>>> +    if (ret < 0) {
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    if (wait_for_reply) {
>>>> +        return enforce_reply(dev, &msg);
>>>> +    }
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>>    static int vhost_user_set_vring_enable(struct vhost_dev *dev, int
>>>> enable)
>>>>    {
>>>>        int i;
>>>> @@ -1207,13 +1252,8 @@ static int vhost_user_set_vring_enable(struct
>>>> vhost_dev *dev, int enable)
>>>>        }
>>>>          for (i = 0; i < dev->nvqs; ++i) {
>>>> -        int ret;
>>>> -        struct vhost_vring_state state = {
>>>> -            .index = dev->vq_index + i,
>>>> -            .num   = enable,
>>>> -        };
>>>> -
>>>> -        ret = vhost_set_vring(dev, VHOST_USER_SET_VRING_ENABLE,
>>>> &state);
>>>> +        int ret = vhost_user_set_single_vring_enable(dev,
>>>> dev->vq_index + i,
>>>> +                                                     enable, false);
>>>>            if (ret < 0) {
>>>>                /*
>>>>                 * Restoring the previous state is likely infeasible,
>>>> as well as
>>>> @@ -2627,6 +2667,7 @@ const VhostOps user_ops = {
>>>>            .vhost_set_owner = vhost_user_set_owner,
>>>>            .vhost_reset_device = vhost_user_reset_device,
>>>>            .vhost_get_vq_index = vhost_user_get_vq_index,
>>>> +        .vhost_set_single_vring_enable =
>>>> vhost_user_set_single_vring_enable,
>>>>            .vhost_set_vring_enable = vhost_user_set_vring_enable,
>>>>            .vhost_requires_shm_log = vhost_user_requires_shm_log,
>>>>            .vhost_migration_done = vhost_user_migration_done,

