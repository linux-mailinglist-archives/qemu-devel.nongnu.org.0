Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA3B1D3264
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 16:14:17 +0200 (CEST)
Received: from localhost ([::1]:38838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZEcq-0006ax-KC
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 10:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1jZEbN-00053H-81
 for qemu-devel@nongnu.org; Thu, 14 May 2020 10:12:45 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:45040
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1jZEbM-0003Wc-6U
 for qemu-devel@nongnu.org; Thu, 14 May 2020 10:12:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589465563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MnzvyHH75rWMwJcCvgdLH0nGBrPuqFnhNE7F3JPoEQ4=;
 b=YimWy2FtvL/CaUvnjCZO6yMrdsXqI4Gndm/Xoe4SHKOAXnsNvVPQmg5zY2jFrKWkNKaKuT
 jfAF7yA3/ktk3ybEuC5sU1lEEEVLOBeh59IPcEnBNay+U9GMxkOxuFnmT0JOil4/4DYBgq
 Sa1tSJDhI1jZZQ3gkBb83Mg7IGIFGGY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-ymoU0VKgOxCHRYYS_RA7Bw-1; Thu, 14 May 2020 10:12:39 -0400
X-MC-Unique: ymoU0VKgOxCHRYYS_RA7Bw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2EA51005512;
 Thu, 14 May 2020 14:12:38 +0000 (UTC)
Received: from [10.36.110.30] (unknown [10.36.110.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F3B3862B1E;
 Thu, 14 May 2020 14:12:33 +0000 (UTC)
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200514073332.1434576-1-maxime.coquelin@redhat.com>
 <20200514064306-mutt-send-email-mst@kernel.org>
From: Maxime Coquelin <maxime.coquelin@redhat.com>
Autocrypt: addr=maxime.coquelin@redhat.com; keydata=
 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
 Mwqu3GQ=
Subject: Re: [PATCH] vhost-user: add support for VHOST_USER_SET_STATUS
Message-ID: <f6d6d746-813a-d3b8-1876-450f8e35d9a8@redhat.com>
Date: Thu, 14 May 2020 16:12:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200514064306-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81;
 envelope-from=maxime.coquelin@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 22:25:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: shahafs@mellanox.com, lulu@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, amorenoz@redhat.com, matan@mellanox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>




On 5/14/20 12:44 PM, Michael S. Tsirkin wrote:
> On Thu, May 14, 2020 at 09:33:32AM +0200, Maxime Coquelin wrote:
>> It is usefull for the Vhost-user backend to know
>> about about the Virtio device status updates,
>> especially when the driver sets the DRIVER_OK bit.
>>
>> With that information, no more need to do hazardous
>> assumptions on when the driver is done with the
>> device configuration.
>>
>> Signed-off-by: Maxime Coquelin <maxime.coquelin@redhat.com>
>> ---
>>
>> This patch applies on top of Cindy's "vDPA support in qemu"
>> series, which introduces the .vhost_set_state vhost-backend
>> ops.
>>
>>  docs/interop/vhost-user.rst | 12 ++++++++++++
>>  hw/net/vhost_net.c          | 10 +++++-----
>>  hw/virtio/vhost-user.c      | 35 +++++++++++++++++++++++++++++++++++
>>  3 files changed, 52 insertions(+), 5 deletions(-)
>>
>> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
>> index 3b1b6602c7..f108de7458 100644
>> --- a/docs/interop/vhost-user.rst
>> +++ b/docs/interop/vhost-user.rst
>> @@ -815,6 +815,7 @@ Protocol features
>>    #define VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD       12
>>    #define VHOST_USER_PROTOCOL_F_RESET_DEVICE         13
>>    #define VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS 14
>> +  #define VHOST_USER_PROTOCOL_F_STATUS               15
>>  
>>  Master message types
>>  --------------------
>> @@ -1263,6 +1264,17 @@ Master message types
>>  
>>    The state.num field is currently reserved and must be set to 0.
>>  
>> +``VHOST_USER_SET_STATUS``
>> +  :id: 36
>> +  :equivalent ioctl: VHOST_VDPA_SET_STATUS
>> +  :slave payload: N/A
>> +  :master payload: ``u64``
>> +
>> +  When the ``VHOST_USER_PROTOCOL_F_STATUS`` protocol feature has been
>> +  successfully negotiated, this message is submitted by the master to
>> +  notify the backend with updated device status as defined in the Virtio
>> +  specification.
>> +
>>  Slave message types
>>  -------------------
>>  
>> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>> index 463e333531..37f3156dbc 100644
>> --- a/hw/net/vhost_net.c
>> +++ b/hw/net/vhost_net.c
>> @@ -517,10 +517,10 @@ int vhost_set_state(NetClientState *nc, int state)
>>  {
>>      struct vhost_net *net = get_vhost_net(nc);
>>      struct vhost_dev *hdev = &net->dev;
>> -    if (nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
>> -        if (hdev->vhost_ops->vhost_set_state) {
>> -                return hdev->vhost_ops->vhost_set_state(hdev, state);
>> -             }
>> -        }
>> +
>> +    if (hdev->vhost_ops->vhost_set_state) {
>> +        return hdev->vhost_ops->vhost_set_state(hdev, state);
>> +    }
>> +
>>      return 0;
>>  }
>> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
>> index ec21e8fbe8..b7e52d97fc 100644
>> --- a/hw/virtio/vhost-user.c
>> +++ b/hw/virtio/vhost-user.c
>> @@ -59,6 +59,7 @@ enum VhostUserProtocolFeature {
>>      VHOST_USER_PROTOCOL_F_HOST_NOTIFIER = 11,
>>      VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD = 12,
>>      VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
>> +    VHOST_USER_PROTOCOL_F_STATUS = 15,
>>      VHOST_USER_PROTOCOL_F_MAX
>>  };
>>  
>> @@ -100,6 +101,7 @@ typedef enum VhostUserRequest {
>>      VHOST_USER_SET_INFLIGHT_FD = 32,
>>      VHOST_USER_GPU_SET_SOCKET = 33,
>>      VHOST_USER_RESET_DEVICE = 34,
>> +    VHOST_USER_SET_STATUS = 36,
>>      VHOST_USER_MAX
>>  } VhostUserRequest;
>>  
>> @@ -1886,6 +1888,38 @@ static int vhost_user_set_inflight_fd(struct vhost_dev *dev,
>>      return 0;
>>  }
>>  
>> +static int vhost_user_set_state(struct vhost_dev *dev, int state)
>> +{
>> +    bool reply_supported = virtio_has_feature(dev->protocol_features,
>> +                                              VHOST_USER_PROTOCOL_F_REPLY_ACK);
>> +
>> +    VhostUserMsg msg = {
>> +        .hdr.request = VHOST_USER_SET_STATUS,
>> +        .hdr.flags = VHOST_USER_VERSION,
>> +        .hdr.size = sizeof(msg.payload.u64),
>> +        .payload.u64 = (uint64_t)state,
>> +    };
>> +
>> +    if (!virtio_has_feature(dev->protocol_features,
>> +                VHOST_USER_PROTOCOL_F_STATUS)) {
>> +        return -1;
>> +    }
>> +
>> +    if (reply_supported) {
>> +        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
>> +    }
>> +
>> +    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
>> +        return -1;
>> +    }
>> +
>> +    if (reply_supported) {
>> +        return process_message_reply(dev, &msg);
>> +    }
> 
> So since we are doing this anyway, let's give backend the opportunity
> to validate features and fail FEATURES_OK?

Just to be sure I understand, the feature negotiation happens,
then when the backend receives FEATURES_OK, it uses the REPLY_ACK
protocol feature to NACK?

In DPDK backend, we already check the feature set by SET_FEATURES are
supported by the backend. If it is not the case, either the master did
set NEED_REPLY flag and error would be reported to the master, or the
NEED_REPLY flag isn't set in the message and the backend disconnects.

Looking at Qemu side, it does not seem to set the NEED_REPLY flag on
SET_FEATURES, so basically the backend close the sockets if it happened.

I wonder whether it would be better for Qemu to set the NEED_REPLY flag
on SET_FEATURES, so that when the backend is running and VHOST_F_LOG_ALL
feature bit is set, we are the sure the master starts the live-migration
only once the SET_FEATURES is fully handled on backend side.

What do you think?

>> +
>> +    return 0;
>> +}
>> +
>>  bool vhost_user_init(VhostUserState *user, CharBackend *chr, Error **errp)
>>  {
>>      if (user->chr) {
>> @@ -1947,4 +1981,5 @@ const VhostOps user_ops = {
>>          .vhost_backend_mem_section_filter = vhost_user_mem_section_filter,
>>          .vhost_get_inflight_fd = vhost_user_get_inflight_fd,
>>          .vhost_set_inflight_fd = vhost_user_set_inflight_fd,
>> +        .vhost_set_state = vhost_user_set_state,
>>  };
>> -- 
>> 2.25.4
> 


