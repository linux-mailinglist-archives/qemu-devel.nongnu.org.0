Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBF73ECEDE
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 08:54:30 +0200 (CEST)
Received: from localhost ([::1]:33852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFWVx-0004Ns-4N
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 02:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mFWVC-0003cd-Lo
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 02:53:42 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:52818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mFWV6-00059m-BT
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 02:53:40 -0400
Received: from sas1-ec30c78b6c5b.qloud-c.yandex.net
 (sas1-ec30c78b6c5b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:2704:0:640:ec30:c78b])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 16C892E156A;
 Mon, 16 Aug 2021 09:53:29 +0300 (MSK)
Received: from sas1-c2bc061771d1.qloud-c.yandex.net
 (sas1-c2bc061771d1.qloud-c.yandex.net [2a02:6b8:c08:8c0e:0:640:c2bc:617])
 by sas1-ec30c78b6c5b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 xFkbuvdts6-rS0CGOR6; Mon, 16 Aug 2021 09:53:29 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1629096808; bh=cT0d2Wqll9A1S4yLIyXSN5+FQCFKw/AIlL9T5qQx1hE=;
 h=In-Reply-To:References:Date:Message-ID:To:From:Subject:Cc;
 b=SVoUPaUUyaSpEFqxjc20r5IQY4nCrx8RXfeLuknARjYgMdhz6jkaaeOpdqWkWnGL7
 UeGiQQqtplkg09+VnNmHU5dwK5kKjmkf8rdYoAkF40+bRqUBUXqLQUd0TrlnqorDSJ
 lcybWnmmIqShNCIivrTfb52yEf4dPAlhUsgakJpM=
Authentication-Results: sas1-ec30c78b6c5b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:8011::1:18])
 by sas1-c2bc061771d1.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 HljgGrzOEJ-rS2SgeRs; Mon, 16 Aug 2021 09:53:28 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Subject: [PING][PING] [PATCH v4] vhost: make SET_VRING_ADDR, SET_FEATURES send
 replies
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
References: <20210809104824.78830-1-den-plotnikov@yandex-team.ru>
 <14cad3d1-c99b-32ef-2aa9-803a9eb27096@yandex-team.ru>
Message-ID: <b83030bd-26d5-b26e-742b-185e9120a1cc@yandex-team.ru>
Date: Mon, 16 Aug 2021 09:53:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <14cad3d1-c99b-32ef-2aa9-803a9eb27096@yandex-team.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: yc-core@yandex-team.ru, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 12.08.2021 11:04, Denis Plotnikov wrote:
>
> On 09.08.2021 13:48, Denis Plotnikov wrote:
>> On vhost-user-blk migration, qemu normally sends a number of commands
>> to enable logging if VHOST_USER_PROTOCOL_F_LOG_SHMFD is negotiated.
>> Qemu sends VHOST_USER_SET_FEATURES to enable buffers logging and
>> VHOST_USER_SET_VRING_ADDR per each started ring to enable "used ring"
>> data logging.
>> The issue is that qemu doesn't wait for reply from the vhost daemon
>> for these commands which may result in races between qemu expectation
>> of logging starting and actual login starting in vhost daemon.
>>
>> The race can appear as follows: on migration setup, qemu enables 
>> dirty page
>> logging by sending VHOST_USER_SET_FEATURES. The command doesn't 
>> arrive to a
>> vhost-user-blk daemon immediately and the daemon needs some time to 
>> turn the
>> logging on internally. If qemu doesn't wait for reply, after sending the
>> command, qemu may start migrateing memory pages to a destination. At 
>> this time,
>> the logging may not be actually turned on in the daemon but some 
>> guest pages,
>> which the daemon is about to write to, may have already been transferred
>> without logging to the destination. Since the logging wasn't turned on,
>> those pages won't be transferred again as dirty. So we may end up with
>> corrupted data on the destination.
>> The same scenario is applicable for "used ring" data logging, which is
>> turned on with VHOST_USER_SET_VRING_ADDR command.
>>
>> To resolve this issue, this patch makes qemu wait for the command result
>> explicitly if VHOST_USER_PROTOCOL_F_REPLY_ACK is negotiated and 
>> logging enabled.
>>
>> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
>>
>> ---
>> v3 -> v4:
>>    * join acked reply and get_features in enforce_reply [mst]
>>    * typos, rewording, cosmetic changes [mst]
>>
>> v2 -> v3:
>>    * send VHOST_USER_GET_FEATURES to flush out outstanding messages 
>> [mst]
>>
>> v1 -> v2:
>>    * send reply only when logging is enabled [mst]
>>
>> v0 -> v1:
>>    * send reply for SET_VRING_ADDR, SET_FEATURES only [mst]
>> ---
>>   hw/virtio/vhost-user.c | 139 +++++++++++++++++++++++++++++------------
>>   1 file changed, 98 insertions(+), 41 deletions(-)
>>
>> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
>> index ee57abe04526..5bb9254acd21 100644
>> --- a/hw/virtio/vhost-user.c
>> +++ b/hw/virtio/vhost-user.c
>> @@ -1095,23 +1095,6 @@ static int vhost_user_set_mem_table(struct 
>> vhost_dev *dev,
>>       return 0;
>>   }
>>   -static int vhost_user_set_vring_addr(struct vhost_dev *dev,
>> -                                     struct vhost_vring_addr *addr)
>> -{
>> -    VhostUserMsg msg = {
>> -        .hdr.request = VHOST_USER_SET_VRING_ADDR,
>> -        .hdr.flags = VHOST_USER_VERSION,
>> -        .payload.addr = *addr,
>> -        .hdr.size = sizeof(msg.payload.addr),
>> -    };
>> -
>> -    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
>> -        return -1;
>> -    }
>> -
>> -    return 0;
>> -}
>> -
>>   static int vhost_user_set_vring_endian(struct vhost_dev *dev,
>>                                          struct vhost_vring_state *ring)
>>   {
>> @@ -1288,72 +1271,146 @@ static int vhost_user_set_vring_call(struct 
>> vhost_dev *dev,
>>       return vhost_set_vring_file(dev, VHOST_USER_SET_VRING_CALL, file);
>>   }
>>   -static int vhost_user_set_u64(struct vhost_dev *dev, int request, 
>> uint64_t u64)
>> +
>> +static int vhost_user_get_u64(struct vhost_dev *dev, int request, 
>> uint64_t *u64)
>>   {
>>       VhostUserMsg msg = {
>>           .hdr.request = request,
>>           .hdr.flags = VHOST_USER_VERSION,
>> -        .payload.u64 = u64,
>> -        .hdr.size = sizeof(msg.payload.u64),
>>       };
>>   +    if (vhost_user_one_time_request(request) && dev->vq_index != 0) {
>> +        return 0;
>> +    }
>> +
>>       if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
>>           return -1;
>>       }
>>   +    if (vhost_user_read(dev, &msg) < 0) {
>> +        return -1;
>> +    }
>> +
>> +    if (msg.hdr.request != request) {
>> +        error_report("Received unexpected msg type. Expected %d 
>> received %d",
>> +                     request, msg.hdr.request);
>> +        return -1;
>> +    }
>> +
>> +    if (msg.hdr.size != sizeof(msg.payload.u64)) {
>> +        error_report("Received bad msg size.");
>> +        return -1;
>> +    }
>> +
>> +    *u64 = msg.payload.u64;
>> +
>>       return 0;
>>   }
>>   -static int vhost_user_set_features(struct vhost_dev *dev,
>> -                                   uint64_t features)
>> +static int vhost_user_get_features(struct vhost_dev *dev, uint64_t 
>> *features)
>>   {
>> -    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features);
>> +    return vhost_user_get_u64(dev, VHOST_USER_GET_FEATURES, features);
>>   }
>>   -static int vhost_user_set_protocol_features(struct vhost_dev *dev,
>> -                                            uint64_t features)
>> +static int enforce_reply(struct vhost_dev *dev,
>> +                         const VhostUserMsg *msg)
>>   {
>> -    return vhost_user_set_u64(dev, VHOST_USER_SET_PROTOCOL_FEATURES, 
>> features);
>> +    uint64_t dummy;
>> +
>> +    if (msg->hdr.flags & VHOST_USER_NEED_REPLY_MASK) {
>> +        return process_message_reply(dev, msg);
>> +    }
>> +
>> +   /*
>> +    * We need to wait for a reply but the backend does not
>> +    * support replies for the command we just sent.
>> +    * Send VHOST_USER_GET_FEATURES which makes all backends
>> +    * send a reply.
>> +    */
>> +    return vhost_user_get_features(dev, &dummy);
>>   }
>>   -static int vhost_user_get_u64(struct vhost_dev *dev, int request, 
>> uint64_t *u64)
>> +static int vhost_user_set_vring_addr(struct vhost_dev *dev,
>> +                                     struct vhost_vring_addr *addr)
>>   {
>>       VhostUserMsg msg = {
>> -        .hdr.request = request,
>> +        .hdr.request = VHOST_USER_SET_VRING_ADDR,
>>           .hdr.flags = VHOST_USER_VERSION,
>> +        .payload.addr = *addr,
>> +        .hdr.size = sizeof(msg.payload.addr),
>>       };
>>   -    if (vhost_user_one_time_request(request) && dev->vq_index != 0) {
>> -        return 0;
>> +    bool reply_supported = virtio_has_feature(dev->protocol_features,
>> + VHOST_USER_PROTOCOL_F_REPLY_ACK);
>> +
>> +    /*
>> +     * wait for a reply if logging is enabled to make sure
>> +     * backend is actually logging changes
>> +     */
>> +    bool wait_for_reply = addr->flags & (1 << VHOST_VRING_F_LOG);
>> +
>> +    if (reply_supported && wait_for_reply) {
>> +        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
>>       }
>>         if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
>>           return -1;
>>       }
>>   -    if (vhost_user_read(dev, &msg) < 0) {
>> -        return -1;
>> +    if (wait_for_reply) {
>> +        return enforce_reply(dev, &msg);
>>       }
>>   -    if (msg.hdr.request != request) {
>> -        error_report("Received unexpected msg type. Expected %d 
>> received %d",
>> -                     request, msg.hdr.request);
>> -        return -1;
>> +    return 0;
>> +}
>> +
>> +static int vhost_user_set_u64(struct vhost_dev *dev, int request, 
>> uint64_t u64,
>> +                              bool wait_for_reply)
>> +{
>> +    VhostUserMsg msg = {
>> +        .hdr.request = request,
>> +        .hdr.flags = VHOST_USER_VERSION,
>> +        .payload.u64 = u64,
>> +        .hdr.size = sizeof(msg.payload.u64),
>> +    };
>> +
>> +    if (wait_for_reply) {
>> +        bool reply_supported = 
>> virtio_has_feature(dev->protocol_features,
>> + VHOST_USER_PROTOCOL_F_REPLY_ACK);
>> +        if (reply_supported) {
>> +            msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
>> +        }
>>       }
>>   -    if (msg.hdr.size != sizeof(msg.payload.u64)) {
>> -        error_report("Received bad msg size.");
>> +    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
>>           return -1;
>>       }
>>   -    *u64 = msg.payload.u64;
>> +    if (wait_for_reply) {
>> +        return enforce_reply(dev, &msg);
>> +    }
>>         return 0;
>>   }
>>   -static int vhost_user_get_features(struct vhost_dev *dev, uint64_t 
>> *features)
>> +static int vhost_user_set_features(struct vhost_dev *dev,
>> +                                   uint64_t features)
>>   {
>> -    return vhost_user_get_u64(dev, VHOST_USER_GET_FEATURES, features);
>> +    /*
>> +     * wait for a reply if logging is enabled to make sure
>> +     * backend is actually logging changes
>> +     */
>> +    bool log_enabled = features & (0x1ULL << VHOST_F_LOG_ALL);
>> +
>> +    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features,
>> +                              log_enabled);
>> +}
>> +
>> +static int vhost_user_set_protocol_features(struct vhost_dev *dev,
>> +                                            uint64_t features)
>> +{
>> +    return vhost_user_set_u64(dev, VHOST_USER_SET_PROTOCOL_FEATURES, 
>> features,
>> +                              false);
>>   }
>>     static int vhost_user_set_owner(struct vhost_dev *dev)

