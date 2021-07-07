Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A27D3BE7BE
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 14:21:53 +0200 (CEST)
Received: from localhost ([::1]:47998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m16Yp-00008z-Th
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 08:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1m16WY-0006gU-Cw
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 08:19:34 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:55796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1m16WT-0003MF-WB
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 08:19:28 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 556282E199B;
 Wed,  7 Jul 2021 15:19:22 +0300 (MSK)
Received: from iva8-5ba4ca89b0c6.qloud-c.yandex.net
 (iva8-5ba4ca89b0c6.qloud-c.yandex.net [2a02:6b8:c0c:a8ae:0:640:5ba4:ca89])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 Q5WpzKDDdH-JMxS09tF; Wed, 07 Jul 2021 15:19:22 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1625660362; bh=TxXXFS30lTLo2qBIYHXzDw17et+7olqqTGiZkOTjOKo=;
 h=In-Reply-To:References:Date:Message-ID:From:To:Subject:Cc;
 b=F3tAVBVn0yJWO3ati9xODXXS+qajGIslzTjhoZfDT0/8x8vKBiZlaoynzHZU//JUs
 jc8pWZxAFubzPh2wlC1Y5WElloNGBbouVozEW1yhexOg4YnAwuy/mtaLhXcH5Tn3sb
 UaQmJlukXyFj2v83QJIxRqH9FurAXNCI7gSTx9q8=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:4::1:5])
 by iva8-5ba4ca89b0c6.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 8MYH83pnwF-JL206p30; Wed, 07 Jul 2021 15:19:21 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Subject: Re: [PATCH v0] vhost: make SET_VRING_ADDR, SET_[PROTOCOL_]FEATEURES
 send replies
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210625085210.236299-1-den-plotnikov@yandex-team.ru>
 <20210707060936-mutt-send-email-mst@kernel.org>
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Message-ID: <d7d3deec-f1d1-4fce-dbf0-a0cbd8063504@yandex-team.ru>
Date: Wed, 7 Jul 2021 15:19:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707060936-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


On 07.07.2021 13:10, Michael S. Tsirkin wrote:
> On Fri, Jun 25, 2021 at 11:52:10AM +0300, Denis Plotnikov wrote:
>> On vhost-user-blk migration, qemu normally sends a number of commands
>> to enable logging if VHOST_USER_PROTOCOL_F_LOG_SHMFD is negotiated.
>> Qemu sends VHOST_USER_SET_FEATURES to enable buffers logging and
>> VHOST_USER_SET_FEATURES per each started ring to enable "used ring"
>> data logging.
>> The issue is that qemu doesn't wait for reply from the vhost daemon
>> for these commands which may result in races between qemu expectation
>> of logging starting and actual login starting in vhost daemon.
> Could you be more explicit please? What kind of race have you
> observed? Getting a reply slows down the setup considerably and
> should not be done lightly.

I'm talking about the vhost-user-blk case. On migration setup, we enable 
logging by sending VHOST_USER_SET_FEATURES. The command doesn't arrive 
to a vhost-user-blk daemon immediately and the daemon needs some time 
turn the logging on internally. If qemu doesn't wait for reply, after 
sending the command qemu may start migrate memory pages. At this time 
the logging may not be actually turned on in the daemon  but some guest 
pages, which the daemon is about to write to, may be already transferred 
without logging to a destination. Since the logging wasn't turned on, 
those pages won't be transferred again as dirty. So we may end up with 
corrupted data on the destination.

Have I managed to explain the case clearly?

Thanks!

Denis

>
> Thanks!
>
>> To resolve this issue, this patch makes qemu wait for the commands result
>> explicilty if VHOST_USER_PROTOCOL_F_REPLY_ACK is negotiated.
>> Also, this patch adds the reply waiting for VHOST_USER_SET_PROTOCOL_FEATURES
>> command to make the features setting functions work similary.
>>
>> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
>> ---
>>   hw/virtio/vhost-user.c | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
>> index ee57abe04526..e47b82adab00 100644
>> --- a/hw/virtio/vhost-user.c
>> +++ b/hw/virtio/vhost-user.c
>> @@ -1105,10 +1105,20 @@ static int vhost_user_set_vring_addr(struct vhost_dev *dev,
>>           .hdr.size = sizeof(msg.payload.addr),
>>       };
>>   
>> +    bool reply_supported = virtio_has_feature(dev->protocol_features,
>> +                                              VHOST_USER_PROTOCOL_F_REPLY_ACK);
>> +    if (reply_supported) {
>> +        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
>> +    }
>> +
>>       if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
>>           return -1;
>>       }
>>   
>> +    if (reply_supported) {
>> +        return process_message_reply(dev, &msg);
>> +    }
>> +
>>       return 0;
>>   }
>>   
>> @@ -1297,10 +1307,20 @@ static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64)
>>           .hdr.size = sizeof(msg.payload.u64),
>>       };
>>   
>> +    bool reply_supported = virtio_has_feature(dev->protocol_features,
>> +                                              VHOST_USER_PROTOCOL_F_REPLY_ACK);
>> +    if (reply_supported) {
>> +        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
>> +    }
>> +
>>       if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
>>           return -1;
>>       }
>>   
>> +    if (reply_supported) {
>> +        return process_message_reply(dev, &msg);
>> +    }
>> +
>>       return 0;
>>   }
>>   
>> -- 
>> 2.25.1

