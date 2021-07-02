Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A943B9E78
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 11:43:17 +0200 (CEST)
Received: from localhost ([::1]:45778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzFhb-0006np-Sv
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 05:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1lzFgL-0005bS-7X
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:41:57 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:42616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1lzFgE-0006oQ-I2
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:41:55 -0400
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 20E562E1A96;
 Fri,  2 Jul 2021 12:41:44 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net [2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 gggm5PB1ty-fhxKuipC; Fri, 02 Jul 2021 12:41:44 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1625218904; bh=QLK1H+sZ+NlrnPqWe8EMsSR1ijJpWXS+Umzhiv7agzg=;
 h=In-Reply-To:References:Date:Message-ID:To:From:Subject:Cc;
 b=IE0EWfABthO3q55a3QB8W9+l8nsMbcCnSpN8BGF6aXqNnx2OBAra4FONATHsHi694
 Uqn6Q6FDfYT6XVNLSjxg0iBe5JfpRQXdT56LpiW7S1h+V4nqq+1b1hKw9E7ouFmf38
 ME6cg3H5i3qOxERf5UmtMmuZ46P1Xi+rW5FRnp2U=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:1::1:16])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 t7Phi1MdNo-fh2qpQeX; Fri, 02 Jul 2021 12:41:43 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Subject: Re: [PATCH v0] vhost: make SET_VRING_ADDR, SET_[PROTOCOL_]FEATEURES
 send replies
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
References: <20210625085210.236299-1-den-plotnikov@yandex-team.ru>
Message-ID: <d9fb62ba-3738-0181-dd32-745ec87f5c10@yandex-team.ru>
Date: Fri, 2 Jul 2021 12:41:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625085210.236299-1-den-plotnikov@yandex-team.ru>
Content-Type: multipart/alternative;
 boundary="------------D564D3F457AAC36E811EBD63"
Content-Language: en-US
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

This is a multi-part message in MIME format.
--------------D564D3F457AAC36E811EBD63
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

ping ping!

On 25.06.2021 11:52, Denis Plotnikov wrote:
> On vhost-user-blk migration, qemu normally sends a number of commands
> to enable logging if VHOST_USER_PROTOCOL_F_LOG_SHMFD is negotiated.
> Qemu sends VHOST_USER_SET_FEATURES to enable buffers logging and
> VHOST_USER_SET_FEATURES per each started ring to enable "used ring"
> data logging.
> The issue is that qemu doesn't wait for reply from the vhost daemon
> for these commands which may result in races between qemu expectation
> of logging starting and actual login starting in vhost daemon.
> To resolve this issue, this patch makes qemu wait for the commands result
> explicilty if VHOST_USER_PROTOCOL_F_REPLY_ACK is negotiated.
> Also, this patch adds the reply waiting for VHOST_USER_SET_PROTOCOL_FEATURES
> command to make the features setting functions work similary.
>
> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
> ---
>   hw/virtio/vhost-user.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index ee57abe04526..e47b82adab00 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -1105,10 +1105,20 @@ static int vhost_user_set_vring_addr(struct vhost_dev *dev,
>           .hdr.size = sizeof(msg.payload.addr),
>       };
>   
> +    bool reply_supported = virtio_has_feature(dev->protocol_features,
> +                                              VHOST_USER_PROTOCOL_F_REPLY_ACK);
> +    if (reply_supported) {
> +        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
> +    }
> +
>       if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
>           return -1;
>       }
>   
> +    if (reply_supported) {
> +        return process_message_reply(dev, &msg);
> +    }
> +
>       return 0;
>   }
>   
> @@ -1297,10 +1307,20 @@ static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64)
>           .hdr.size = sizeof(msg.payload.u64),
>       };
>   
> +    bool reply_supported = virtio_has_feature(dev->protocol_features,
> +                                              VHOST_USER_PROTOCOL_F_REPLY_ACK);
> +    if (reply_supported) {
> +        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
> +    }
> +
>       if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
>           return -1;
>       }
>   
> +    if (reply_supported) {
> +        return process_message_reply(dev, &msg);
> +    }
> +
>       return 0;
>   }
>   

--------------D564D3F457AAC36E811EBD63
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
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

Signed-off-by: Denis Plotnikov <a class="moz-txt-link-rfc2396E" href="mailto:den-plotnikov@yandex-team.ru">&lt;den-plotnikov@yandex-team.ru&gt;</a>
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
  </body>
</html>

--------------D564D3F457AAC36E811EBD63--

