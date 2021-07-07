Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 605223BE607
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 11:56:39 +0200 (CEST)
Received: from localhost ([::1]:38220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m14IH-0005qw-SX
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 05:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1m14HD-00052L-RZ
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 05:55:31 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:40536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1m14H9-00058I-Ka
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 05:55:30 -0400
Received: from sas1-6b1512233ef6.qloud-c.yandex.net
 (sas1-6b1512233ef6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:44af:0:640:6b15:1223])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id E2EEA2E19F0;
 Wed,  7 Jul 2021 12:55:20 +0300 (MSK)
Received: from sas2-d40aa8807eff.qloud-c.yandex.net
 (sas2-d40aa8807eff.qloud-c.yandex.net [2a02:6b8:c08:b921:0:640:d40a:a880])
 by sas1-6b1512233ef6.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 iJqgcbvHLz-tK0mfjJl; Wed, 07 Jul 2021 12:55:20 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1625651720; bh=hr/COkF6z9sHyQYnUUlrhxEXAwpLdq66uoNY1C+wEMc=;
 h=In-Reply-To:References:Date:Message-ID:To:From:Subject:Cc;
 b=JOyCZgxNU+CSf13wZgudbz7lFhFaRJrrk/rOnFS1hSdf2ep+gvK7IqWrqJjCkKL+E
 +LHJepYjXDcOd2ueuXvitMJ/ivAMKJSmraunH/qMRG++9ifb81xnKi7Iw+mx/wJPat
 +oAWikGkGodIQAqlr2Ce7LZuMoE/CN4onWWNfbqk=
Authentication-Results: sas1-6b1512233ef6.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:4::1:5])
 by sas2-d40aa8807eff.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 kTrne668NG-tK2Sk1oT; Wed, 07 Jul 2021 12:55:20 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Subject: [PING] [PATCH v0] vhost: make SET_VRING_ADDR,
 SET_[PROTOCOL_]FEATEURES send replies
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
References: <20210625085210.236299-1-den-plotnikov@yandex-team.ru>
 <d9fb62ba-3738-0181-dd32-745ec87f5c10@yandex-team.ru>
Message-ID: <903fa816-6deb-7496-5b0a-8defc219683c@yandex-team.ru>
Date: Wed, 7 Jul 2021 12:55:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d9fb62ba-3738-0181-dd32-745ec87f5c10@yandex-team.ru>
Content-Type: multipart/alternative;
 boundary="------------86CDCE5C7F68C5C7BEF1B39A"
Content-Language: en-US
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Cc: yc-core@yandex-team.ru, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------86CDCE5C7F68C5C7BEF1B39A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 02.07.2021 12:41, Denis Plotnikov wrote:
>
> ping ping!
>
> On 25.06.2021 11:52, Denis Plotnikov wrote:
>> On vhost-user-blk migration, qemu normally sends a number of commands
>> to enable logging if VHOST_USER_PROTOCOL_F_LOG_SHMFD is negotiated.
>> Qemu sends VHOST_USER_SET_FEATURES to enable buffers logging and
>> VHOST_USER_SET_FEATURES per each started ring to enable "used ring"
>> data logging.
>> The issue is that qemu doesn't wait for reply from the vhost daemon
>> for these commands which may result in races between qemu expectation
>> of logging starting and actual login starting in vhost daemon.
>> To resolve this issue, this patch makes qemu wait for the commands result
>> explicilty if VHOST_USER_PROTOCOL_F_REPLY_ACK is negotiated.
>> Also, this patch adds the reply waiting for VHOST_USER_SET_PROTOCOL_FEATURES
>> command to make the features setting functions work similary.
>>
>> Signed-off-by: Denis Plotnikov<den-plotnikov@yandex-team.ru>
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

--------------86CDCE5C7F68C5C7BEF1B39A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 02.07.2021 12:41, Denis Plotnikov
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d9fb62ba-3738-0181-dd32-745ec87f5c10@yandex-team.ru">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><font size="+1"><font face="monospace">ping ping!</font></font><br>
      </p>
      <div class="moz-cite-prefix">On 25.06.2021 11:52, Denis Plotnikov
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:20210625085210.236299-1-den-plotnikov@yandex-team.ru">
        <pre class="moz-quote-pre" wrap="">On vhost-user-blk migration, qemu normally sends a number of commands
to enable logging if VHOST_USER_PROTOCOL_F_LOG_SHMFD is negotiated.
Qemu sends VHOST_USER_SET_FEATURES to enable buffers logging and
VHOST_USER_SET_FEATURES per each started ring to enable "used ring"
data logging.
The issue is that qemu doesn't wait for reply from the vhost daemon
for these commands which may result in races between qemu expectation
of logging starting and actual login starting in vhost daemon.
To resolve this issue, this patch makes qemu wait for the commands result
explicilty if VHOST_USER_PROTOCOL_F_REPLY_ACK is negotiated.
Also, this patch adds the reply waiting for VHOST_USER_SET_PROTOCOL_FEATURES
command to make the features setting functions work similary.

Signed-off-by: Denis Plotnikov <a class="moz-txt-link-rfc2396E" href="mailto:den-plotnikov@yandex-team.ru" moz-do-not-send="true">&lt;den-plotnikov@yandex-team.ru&gt;</a>
---
 hw/virtio/vhost-user.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index ee57abe04526..e47b82adab00 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1105,10 +1105,20 @@ static int vhost_user_set_vring_addr(struct vhost_dev *dev,
         .hdr.size = sizeof(msg.payload.addr),
     };
 
+    bool reply_supported = virtio_has_feature(dev-&gt;protocol_features,
+                                              VHOST_USER_PROTOCOL_F_REPLY_ACK);
+    if (reply_supported) {
+        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
+    }
+
     if (vhost_user_write(dev, &amp;msg, NULL, 0) &lt; 0) {
         return -1;
     }
 
+    if (reply_supported) {
+        return process_message_reply(dev, &amp;msg);
+    }
+
     return 0;
 }
 
@@ -1297,10 +1307,20 @@ static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64)
         .hdr.size = sizeof(msg.payload.u64),
     };
 
+    bool reply_supported = virtio_has_feature(dev-&gt;protocol_features,
+                                              VHOST_USER_PROTOCOL_F_REPLY_ACK);
+    if (reply_supported) {
+        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
+    }
+
     if (vhost_user_write(dev, &amp;msg, NULL, 0) &lt; 0) {
         return -1;
     }
 
+    if (reply_supported) {
+        return process_message_reply(dev, &amp;msg);
+    }
+
     return 0;
 }
 
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------86CDCE5C7F68C5C7BEF1B39A--

