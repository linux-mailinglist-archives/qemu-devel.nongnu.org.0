Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D1658497B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 03:53:44 +0200 (CEST)
Received: from localhost ([::1]:53468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHFCA-0000Z6-LV
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 21:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oHFA9-00077P-UT
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 21:51:37 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:52682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oHFA4-0004G0-JK
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 21:51:35 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R261e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0VKj4s.R_1659059482; 
Received: from 30.227.73.26(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VKj4s.R_1659059482) by smtp.aliyun-inc.com;
 Fri, 29 Jul 2022 09:51:24 +0800
Message-ID: <26ed468e-97ef-8454-3665-5f89c82d3fe7@linux.alibaba.com>
Date: Fri, 29 Jul 2022 09:51:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 08/16] vhost: add op to enable or disable a single vring
To: Jason Wang <jasowang@redhat.com>
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <8bf7574d8e133d3fa7e8b09f4deb59369916774a.1658141552.git.kangjie.xu@linux.alibaba.com>
 <b078fc30-0c8b-b56c-e320-c89e6376fb21@redhat.com>
 <93985df7-7d5f-782e-10ed-7494f0806d22@linux.alibaba.com>
 <CACGkMEsTcoLQYJVxT8J3yDu007zan-3OsExRHFe3DCsZ1_y1=w@mail.gmail.com>
 <810e4f2c-69bb-e2be-1faf-056549063fae@linux.alibaba.com>
 <CACGkMEv_=dsU_-Syw08Nf6FeHrFzf+GXYXcLBDqTNVX9NguJ2w@mail.gmail.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, xuanzhuo@linux.alibaba.com,
 hengqi@linux.alibaba.com
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
In-Reply-To: <CACGkMEv_=dsU_-Syw08Nf6FeHrFzf+GXYXcLBDqTNVX9NguJ2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.132;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-132.freemail.mail.aliyun.com
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


在 2022/7/28 10:41, Jason Wang 写道:
> On Wed, Jul 27, 2022 at 3:05 PM Kangjie Xu <kangjie.xu@linux.alibaba.com> wrote:
>>
>> 在 2022/7/27 12:55, Jason Wang 写道:
>>> On Tue, Jul 26, 2022 at 2:39 PM Kangjie Xu <kangjie.xu@linux.alibaba.com> wrote:
>>>> 在 2022/7/26 11:49, Jason Wang 写道:
>>>>> 在 2022/7/18 19:17, Kangjie Xu 写道:
>>>>>> The interface to set enable status for a single vring is lacked in
>>>>>> VhostOps, since the vhost_set_vring_enable_op will manipulate all
>>>>>> virtqueues in a device.
>>>>>>
>>>>>> Resetting a single vq will rely on this interface. It requires a
>>>>>> reply to indicate that the reset operation is finished, so the
>>>>>> parameter, wait_for_reply, is added.
>>>>> The wait reply seems to be a implementation specific thing. Can we
>>>>> hide it?
>>>>>
>>>>> Thanks
>>>>>
>>>> I do not hide wait_for_reply here because when stopping the queue, a
>>>> reply is needed to ensure that the message has been processed and queue
>>>> has been disabled.
>>> This needs to be done at vhost-backend level instead of the general vhost code.
>>>
>>> E.g vhost-kernel or vDPA is using ioctl() which is synchronous.
>> Yeah, I understand your concerns, will fix it in the next version.
>>>> When restarting the queue, we do not need a reply, which is the same as
>>>> what qemu does in vhost_dev_start().
>>>>
>>>> So I add this parameter to distinguish the two cases.
>>>>
>>>> I think one alternative implementation is to add a interface in
>>>> VhostOps: queue_reset(). In this way details can be hidden. What do you
>>>> think of this solution? Does it look better?
>>> Let me ask it differently, under which case can we call this function
>>> with wait_for_reply = false?
>>>
>>> Thanks
>> Cases when we do not need to wait until that the reply has been
>> processed. Actually in dev_start(), or dev_stop(),
> But we don't need to send virtqueue reset requests in those cases?

You're right, we don't need to do this in those cases.

Thanks

>> they do not wait for
>> replies when enabling/disabling vqs.
>>
>> Specifically, vhost_set_vring_enable() will call it with wait_for_reply
>> = false.
>>
>> In our vq reset scenario, it should be synchronous because the driver
>> need to modify queues after the device stop using the vq in the backend.
>> Undefined errors will occur If the device is still using the queue when
>> the driver is making modifications to it,
>>
>> Back to our implementation, we will not expose this parameter in the
>> next version.
> Ok.
>
> Thanks
>
>> Thanks.
>>
>>>> Thanks
>>>>
>>>>>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>>>>>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>>>>>> ---
>>>>>>     include/hw/virtio/vhost-backend.h | 4 ++++
>>>>>>     1 file changed, 4 insertions(+)
>>>>>>
>>>>>> diff --git a/include/hw/virtio/vhost-backend.h
>>>>>> b/include/hw/virtio/vhost-backend.h
>>>>>> index eab46d7f0b..7bddd1e9a0 100644
>>>>>> --- a/include/hw/virtio/vhost-backend.h
>>>>>> +++ b/include/hw/virtio/vhost-backend.h
>>>>>> @@ -81,6 +81,9 @@ typedef int (*vhost_set_backend_cap_op)(struct
>>>>>> vhost_dev *dev);
>>>>>>     typedef int (*vhost_set_owner_op)(struct vhost_dev *dev);
>>>>>>     typedef int (*vhost_reset_device_op)(struct vhost_dev *dev);
>>>>>>     typedef int (*vhost_get_vq_index_op)(struct vhost_dev *dev, int idx);
>>>>>> +typedef int (*vhost_set_single_vring_enable_op)(struct vhost_dev *dev,
>>>>>> +                                                int index, int enable,
>>>>>> +                                                bool wait_for_reply);
>>>>>>     typedef int (*vhost_set_vring_enable_op)(struct vhost_dev *dev,
>>>>>>                                              int enable);
>>>>>>     typedef bool (*vhost_requires_shm_log_op)(struct vhost_dev *dev);
>>>>>> @@ -155,6 +158,7 @@ typedef struct VhostOps {
>>>>>>         vhost_set_owner_op vhost_set_owner;
>>>>>>         vhost_reset_device_op vhost_reset_device;
>>>>>>         vhost_get_vq_index_op vhost_get_vq_index;
>>>>>> +    vhost_set_single_vring_enable_op vhost_set_single_vring_enable;
>>>>>>         vhost_set_vring_enable_op vhost_set_vring_enable;
>>>>>>         vhost_requires_shm_log_op vhost_requires_shm_log;
>>>>>>         vhost_migration_done_op vhost_migration_done;

