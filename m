Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A263DA1A2
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 12:57:38 +0200 (CEST)
Received: from localhost ([::1]:43296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m93jN-0004QW-3E
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 06:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1m93iU-0003kE-7G
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 06:56:42 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:48318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1m93iP-0003PG-Ve
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 06:56:40 -0400
Received: from iva8-c5ee4261001e.qloud-c.yandex.net
 (iva8-c5ee4261001e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a8a6:0:640:c5ee:4261])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id B693E2E14D8;
 Thu, 29 Jul 2021 13:56:29 +0300 (MSK)
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net [2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by iva8-c5ee4261001e.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 hnLe5c9xXC-uTxqIFvQ; Thu, 29 Jul 2021 13:56:29 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1627556189; bh=pzvZdqLvVz1dPXrh5c2MDEbaLuGGQYmn/mdqW+3XClU=;
 h=In-Reply-To:References:Date:Message-ID:To:From:Subject:Cc;
 b=XEs8DJNzJiNb5pqVJT++SieEBwIOa9q4DLHfeblLL6d4nEDn6DEKW1PmxxYRHuC7k
 AGclLgB4UkF9U8q1Vsd2f3wTrNV8ir0s8l8SLBYcs0HzC4EKTHLcwDyv5X9mDNOaEo
 MYyOuj4aPIMwoO+eMqJv6hIN3ox9XjAJbctu/nNQ=
Authentication-Results: iva8-c5ee4261001e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:8007::1:10])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 3MLpfgl1SE-uT2SJZAO; Thu, 29 Jul 2021 13:56:29 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Subject: [PING][PING][PATCH v2] vhost: make SET_VRING_ADDR, SET_FEATURES send
 replies
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
References: <20210719142138.24543-1-den-plotnikov@yandex-team.ru>
 <8f3959d9-2dd8-3fc0-f350-b4ea98a10f38@yandex-team.ru>
Message-ID: <f809aa3e-dc2f-4a2f-92d1-e5dc8782c1e5@yandex-team.ru>
Date: Thu, 29 Jul 2021 13:56:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8f3959d9-2dd8-3fc0-f350-b4ea98a10f38@yandex-team.ru>
Content-Type: multipart/alternative;
 boundary="------------78D4F04C895957C03848F88E"
Content-Language: en-US
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
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
--------------78D4F04C895957C03848F88E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 23.07.2021 12:59, Denis Plotnikov wrote:
>
> ping!
>
> On 19.07.2021 17:21, Denis Plotnikov wrote:
>> On vhost-user-blk migration, qemu normally sends a number of commands
>> to enable logging if VHOST_USER_PROTOCOL_F_LOG_SHMFD is negotiated.
>> Qemu sends VHOST_USER_SET_FEATURES to enable buffers logging and
>> VHOST_USER_SET_VRING_ADDR per each started ring to enable "used ring"
>> data logging.
>> The issue is that qemu doesn't wait for reply from the vhost daemon
>> for these commands which may result in races between qemu expectation
>> of logging starting and actual login starting in vhost daemon.
>>
>> The race can appear as follows: on migration setup, qemu enables dirty page
>> logging by sending VHOST_USER_SET_FEATURES. The command doesn't arrive to a
>> vhost-user-blk daemon immediately and the daemon needs some time to turn the
>> logging on internally. If qemu doesn't wait for reply, after sending the
>> command, qemu may start migrate memory pages to a destination. At this time,
>> the logging may not be actually turned on in the daemon but some guest pages,
>> which the daemon is about to write to, may have already been transferred
>> without logging to the destination. Since the logging wasn't turned on,
>> those pages won't be transferred again as dirty. So we may end up with
>> corrupted data on the destination.
>> The same scenario is applicable for "used ring" data logging, which is
>> turned on with VHOST_USER_SET_VRING_ADDR command.
>>
>> To resolve this issue, this patch makes qemu wait for the commands result
>> explicilty if VHOST_USER_PROTOCOL_F_REPLY_ACK is negotiated and
>> logging is enabled.
>>
>> Signed-off-by: Denis Plotnikov<den-plotnikov@yandex-team.ru>
>> ---
>> v1 -> v2:
>>    * send reply only when logging is enabled [mst]
>>
>> v0 -> v1:
>>    * send reply for SET_VRING_ADDR, SET_FEATURES only [mst]
>>    
>>   hw/virtio/vhost-user.c | 37 ++++++++++++++++++++++++++++++++++---
>>   1 file changed, 34 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
>> index ee57abe04526..133588b3961e 100644
>> --- a/hw/virtio/vhost-user.c
>> +++ b/hw/virtio/vhost-user.c
>> @@ -1095,6 +1095,11 @@ static int vhost_user_set_mem_table(struct vhost_dev *dev,
>>       return 0;
>>   }
>>   
>> +static bool log_enabled(uint64_t features)
>> +{
>> +    return !!(features & (0x1ULL << VHOST_F_LOG_ALL));
>> +}
>> +
>>   static int vhost_user_set_vring_addr(struct vhost_dev *dev,
>>                                        struct vhost_vring_addr *addr)
>>   {
>> @@ -1105,10 +1110,21 @@ static int vhost_user_set_vring_addr(struct vhost_dev *dev,
>>           .hdr.size = sizeof(msg.payload.addr),
>>       };
>>   
>> +    bool reply_supported = virtio_has_feature(dev->protocol_features,
>> +                                              VHOST_USER_PROTOCOL_F_REPLY_ACK);
>> +
>> +    if (reply_supported && log_enabled(msg.hdr.flags)) {
>> +        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
>> +    }
>> +
>>       if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
>>           return -1;
>>       }
>>   
>> +    if (msg.hdr.flags & VHOST_USER_NEED_REPLY_MASK) {
>> +        return process_message_reply(dev, &msg);
>> +    }
>> +
>>       return 0;
>>   }
>>   
>> @@ -1288,7 +1304,8 @@ static int vhost_user_set_vring_call(struct vhost_dev *dev,
>>       return vhost_set_vring_file(dev, VHOST_USER_SET_VRING_CALL, file);
>>   }
>>   
>> -static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64)
>> +static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64,
>> +                              bool need_reply)
>>   {
>>       VhostUserMsg msg = {
>>           .hdr.request = request,
>> @@ -1297,23 +1314,37 @@ static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64)
>>           .hdr.size = sizeof(msg.payload.u64),
>>       };
>>   
>> +    if (need_reply) {
>> +        bool reply_supported = virtio_has_feature(dev->protocol_features,
>> +                                          VHOST_USER_PROTOCOL_F_REPLY_ACK);
>> +        if (reply_supported) {
>> +            msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
>> +        }
>> +    }
>> +
>>       if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
>>           return -1;
>>       }
>>   
>> +    if (msg.hdr.flags & VHOST_USER_NEED_REPLY_MASK) {
>> +        return process_message_reply(dev, &msg);
>> +    }
>> +
>>       return 0;
>>   }
>>   
>>   static int vhost_user_set_features(struct vhost_dev *dev,
>>                                      uint64_t features)
>>   {
>> -    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features);
>> +    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features,
>> +                              log_enabled(features));
>>   }
>>   
>>   static int vhost_user_set_protocol_features(struct vhost_dev *dev,
>>                                               uint64_t features)
>>   {
>> -    return vhost_user_set_u64(dev, VHOST_USER_SET_PROTOCOL_FEATURES, features);
>> +    return vhost_user_set_u64(dev, VHOST_USER_SET_PROTOCOL_FEATURES, features,
>> +                              false);
>>   }
>>   
>>   static int vhost_user_get_u64(struct vhost_dev *dev, int request, uint64_t *u64)

--------------78D4F04C895957C03848F88E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 23.07.2021 12:59, Denis Plotnikov
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:8f3959d9-2dd8-3fc0-f350-b4ea98a10f38@yandex-team.ru">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><font size="+1"><font face="monospace">ping!</font></font><br>
      </p>
      <div class="moz-cite-prefix">On 19.07.2021 17:21, Denis Plotnikov
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:20210719142138.24543-1-den-plotnikov@yandex-team.ru">
        <pre class="moz-quote-pre" wrap="">On vhost-user-blk migration, qemu normally sends a number of commands
to enable logging if VHOST_USER_PROTOCOL_F_LOG_SHMFD is negotiated.
Qemu sends VHOST_USER_SET_FEATURES to enable buffers logging and
VHOST_USER_SET_VRING_ADDR per each started ring to enable "used ring"
data logging.
The issue is that qemu doesn't wait for reply from the vhost daemon
for these commands which may result in races between qemu expectation
of logging starting and actual login starting in vhost daemon.

The race can appear as follows: on migration setup, qemu enables dirty page
logging by sending VHOST_USER_SET_FEATURES. The command doesn't arrive to a
vhost-user-blk daemon immediately and the daemon needs some time to turn the
logging on internally. If qemu doesn't wait for reply, after sending the
command, qemu may start migrate memory pages to a destination. At this time,
the logging may not be actually turned on in the daemon but some guest pages,
which the daemon is about to write to, may have already been transferred
without logging to the destination. Since the logging wasn't turned on,
those pages won't be transferred again as dirty. So we may end up with
corrupted data on the destination.
The same scenario is applicable for "used ring" data logging, which is
turned on with VHOST_USER_SET_VRING_ADDR command.

To resolve this issue, this patch makes qemu wait for the commands result
explicilty if VHOST_USER_PROTOCOL_F_REPLY_ACK is negotiated and
logging is enabled.

Signed-off-by: Denis Plotnikov <a class="moz-txt-link-rfc2396E" href="mailto:den-plotnikov@yandex-team.ru" moz-do-not-send="true">&lt;den-plotnikov@yandex-team.ru&gt;</a>
---
v1 -&gt; v2:
  * send reply only when logging is enabled [mst]

v0 -&gt; v1:
  * send reply for SET_VRING_ADDR, SET_FEATURES only [mst]
  
 hw/virtio/vhost-user.c | 37 ++++++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index ee57abe04526..133588b3961e 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1095,6 +1095,11 @@ static int vhost_user_set_mem_table(struct vhost_dev *dev,
     return 0;
 }
 
+static bool log_enabled(uint64_t features)
+{
+    return !!(features &amp; (0x1ULL &lt;&lt; VHOST_F_LOG_ALL));
+}
+
 static int vhost_user_set_vring_addr(struct vhost_dev *dev,
                                      struct vhost_vring_addr *addr)
 {
@@ -1105,10 +1110,21 @@ static int vhost_user_set_vring_addr(struct vhost_dev *dev,
         .hdr.size = sizeof(msg.payload.addr),
     };
 
+    bool reply_supported = virtio_has_feature(dev-&gt;protocol_features,
+                                              VHOST_USER_PROTOCOL_F_REPLY_ACK);
+
+    if (reply_supported &amp;&amp; log_enabled(msg.hdr.flags)) {
+        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
+    }
+
     if (vhost_user_write(dev, &amp;msg, NULL, 0) &lt; 0) {
         return -1;
     }
 
+    if (msg.hdr.flags &amp; VHOST_USER_NEED_REPLY_MASK) {
+        return process_message_reply(dev, &amp;msg);
+    }
+
     return 0;
 }
 
@@ -1288,7 +1304,8 @@ static int vhost_user_set_vring_call(struct vhost_dev *dev,
     return vhost_set_vring_file(dev, VHOST_USER_SET_VRING_CALL, file);
 }
 
-static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64)
+static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64,
+                              bool need_reply)
 {
     VhostUserMsg msg = {
         .hdr.request = request,
@@ -1297,23 +1314,37 @@ static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64)
         .hdr.size = sizeof(msg.payload.u64),
     };
 
+    if (need_reply) {
+        bool reply_supported = virtio_has_feature(dev-&gt;protocol_features,
+                                          VHOST_USER_PROTOCOL_F_REPLY_ACK);
+        if (reply_supported) {
+            msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
+        }
+    }
+
     if (vhost_user_write(dev, &amp;msg, NULL, 0) &lt; 0) {
         return -1;
     }
 
+    if (msg.hdr.flags &amp; VHOST_USER_NEED_REPLY_MASK) {
+        return process_message_reply(dev, &amp;msg);
+    }
+
     return 0;
 }
 
 static int vhost_user_set_features(struct vhost_dev *dev,
                                    uint64_t features)
 {
-    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features);
+    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features,
+                              log_enabled(features));
 }
 
 static int vhost_user_set_protocol_features(struct vhost_dev *dev,
                                             uint64_t features)
 {
-    return vhost_user_set_u64(dev, VHOST_USER_SET_PROTOCOL_FEATURES, features);
+    return vhost_user_set_u64(dev, VHOST_USER_SET_PROTOCOL_FEATURES, features,
+                              false);
 }
 
 static int vhost_user_get_u64(struct vhost_dev *dev, int request, uint64_t *u64)
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------78D4F04C895957C03848F88E--

