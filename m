Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 778C83BF63B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 09:25:37 +0200 (CEST)
Received: from localhost ([::1]:60608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1OPg-0008I8-J3
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 03:25:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1m1OOJ-0006uR-41
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 03:24:11 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:56794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1m1OOC-0007it-9t
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 03:24:10 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id AA2372E1A63;
 Thu,  8 Jul 2021 10:23:59 +0300 (MSK)
Received: from iva8-5ba4ca89b0c6.qloud-c.yandex.net
 (iva8-5ba4ca89b0c6.qloud-c.yandex.net [2a02:6b8:c0c:a8ae:0:640:5ba4:ca89])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 iTL9RVjYXZ-NxxSC2Vf; Thu, 08 Jul 2021 10:23:59 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1625729039; bh=fueUfeqk+ipVHrz74MHezdZsK+0S13Rdbjqw1GmGCGA=;
 h=In-Reply-To:References:Date:Message-ID:From:To:Subject:Cc;
 b=KB8mq0zuSvpAjcroh3jHrF0HDXN3yP90wUDc3Oryavvdf01VQYhv+x6mCfZn8Pf+Q
 ++PFl+65Kyfd4ZfUyx+Z4yLaMyem+XgZQ7Q357iE75SKPRKx3elf0jFZLDZy9jjdUH
 a+G3F5RxJrQLkLr13ylZbvuNnWgNaXswzI8IV584=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:12::1:3a])
 by iva8-5ba4ca89b0c6.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 h98uLTMUR3-Nx2aWePW; Thu, 08 Jul 2021 10:23:59 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Subject: Re: [PATCH v0] vhost: make SET_VRING_ADDR, SET_[PROTOCOL_]FEATEURES
 send replies
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210625085210.236299-1-den-plotnikov@yandex-team.ru>
 <20210707060936-mutt-send-email-mst@kernel.org>
 <d7d3deec-f1d1-4fce-dbf0-a0cbd8063504@yandex-team.ru>
 <20210707103555-mutt-send-email-mst@kernel.org>
 <13c22772-5642-06b9-2ba3-864995544cd2@yandex-team.ru>
 <20210707144355-mutt-send-email-mst@kernel.org>
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Message-ID: <61112ffa-b4e6-dff7-e480-4895c1da7918@yandex-team.ru>
Date: Thu, 8 Jul 2021 10:23:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707144355-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 07.07.2021 21:44, Michael S. Tsirkin wrote:
> On Wed, Jul 07, 2021 at 05:58:50PM +0300, Denis Plotnikov wrote:
>> On 07.07.2021 17:39, Michael S. Tsirkin wrote:
>>> On Wed, Jul 07, 2021 at 03:19:20PM +0300, Denis Plotnikov wrote:
>>>> On 07.07.2021 13:10, Michael S. Tsirkin wrote:
>>>>> On Fri, Jun 25, 2021 at 11:52:10AM +0300, Denis Plotnikov wrote:
>>>>>> On vhost-user-blk migration, qemu normally sends a number of commands
>>>>>> to enable logging if VHOST_USER_PROTOCOL_F_LOG_SHMFD is negotiated.
>>>>>> Qemu sends VHOST_USER_SET_FEATURES to enable buffers logging and
>>>>>> VHOST_USER_SET_FEATURES per each started ring to enable "used ring"
>>>>>> data logging.
>>>>>> The issue is that qemu doesn't wait for reply from the vhost daemon
>>>>>> for these commands which may result in races between qemu expectation
>>>>>> of logging starting and actual login starting in vhost daemon.
>>>>> Could you be more explicit please? What kind of race have you
>>>>> observed? Getting a reply slows down the setup considerably and
>>>>> should not be done lightly.
>>>> I'm talking about the vhost-user-blk case. On migration setup, we enable
>>>> logging by sending VHOST_USER_SET_FEATURES. The command doesn't arrive to a
>>>> vhost-user-blk daemon immediately and the daemon needs some time turn the
>>>> logging on internally. If qemu doesn't wait for reply, after sending the
>>>> command qemu may start migrate memory pages. At this time the logging may
>>>> not be actually turned on in the daemon  but some guest pages, which the
>>>> daemon is about to write to, may be already transferred without logging to a
>>>> destination. Since the logging wasn't turned on, those pages won't be
>>>> transferred again as dirty. So we may end up with corrupted data on the
>>>> destination.
>>>>
>>>> Have I managed to explain the case clearly?
>>>>
>>>> Thanks!
>>>>
>>>> Denis
>>> OK so this is just about enabling logging. It would be cleaner to
>>> defer migrating memory until response ... if that is too hard,
>>> at least document why we are doing this please.
>>> And, let's wait for an ack just in that case then - why not?
>>>
>>> And what about VHOST_USER_SET_PROTOCOL_FEATURES?
>> The code uses the same path for both VHOST_USER_SET_PROTOCOL_FEATURES and
>> VHOST_USER_SET_FEATURES via vhost_user_set_u64(). So, I decided to suggest
>> adding reply to both of them, so both feature setting commands work
>> similarly as it doesn't contradicts with vhost-user spec.
>>
>> I'm not sure that it worth doing that, so if you think it's not I'll just
>> remove them.
>>
>>
>> Denis
>
> I'm inclined to say let's not add to the latency of setting up the
> device unnecessarily.

ok

I'll remove reply for VHOST_USER_SET_FEATURES and amend the commit 
message in v2

Thanks!

Denis

>>>
>>>>> Thanks!
>>>>>
>>>>>> To resolve this issue, this patch makes qemu wait for the commands result
>>>>>> explicilty if VHOST_USER_PROTOCOL_F_REPLY_ACK is negotiated.
>>>>>> Also, this patch adds the reply waiting for VHOST_USER_SET_PROTOCOL_FEATURES
>>>>>> command to make the features setting functions work similary.
>>>>>>
>>>>>> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
>>>>>> ---
>>>>>>     hw/virtio/vhost-user.c | 20 ++++++++++++++++++++
>>>>>>     1 file changed, 20 insertions(+)
>>>>>>
>>>>>> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
>>>>>> index ee57abe04526..e47b82adab00 100644
>>>>>> --- a/hw/virtio/vhost-user.c
>>>>>> +++ b/hw/virtio/vhost-user.c
>>>>>> @@ -1105,10 +1105,20 @@ static int vhost_user_set_vring_addr(struct vhost_dev *dev,
>>>>>>             .hdr.size = sizeof(msg.payload.addr),
>>>>>>         };
>>>>>> +    bool reply_supported = virtio_has_feature(dev->protocol_features,
>>>>>> +                                              VHOST_USER_PROTOCOL_F_REPLY_ACK);
>>>>>> +    if (reply_supported) {
>>>>>> +        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
>>>>>> +    }
>>>>>> +
>>>>>>         if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
>>>>>>             return -1;
>>>>>>         }
>>>>>> +    if (reply_supported) {
>>>>>> +        return process_message_reply(dev, &msg);
>>>>>> +    }
>>>>>> +
>>>>>>         return 0;
>>>>>>     }
>>>>>> @@ -1297,10 +1307,20 @@ static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64)
>>>>>>             .hdr.size = sizeof(msg.payload.u64),
>>>>>>         };
>>>>>> +    bool reply_supported = virtio_has_feature(dev->protocol_features,
>>>>>> +                                              VHOST_USER_PROTOCOL_F_REPLY_ACK);
>>>>>> +    if (reply_supported) {
>>>>>> +        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
>>>>>> +    }
>>>>>> +
>>>>>>         if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
>>>>>>             return -1;
>>>>>>         }
>>>>>> +    if (reply_supported) {
>>>>>> +        return process_message_reply(dev, &msg);
>>>>>> +    }
>>>>>> +
>>>>>>         return 0;
>>>>>>     }
>>>>>> -- 
>>>>>> 2.25.1

