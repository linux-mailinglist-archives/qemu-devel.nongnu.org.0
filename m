Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7DA32BA25
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 20:14:57 +0100 (CET)
Received: from localhost ([::1]:34508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWxU-0001XW-TR
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 14:14:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWv2-0008Gj-HH
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:12:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWuw-0006lp-0j
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:12:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614798735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MCpf1H4OXD9yrNlExURtQRGgfyEZrfNaghb6RD0f6bw=;
 b=DmGUCLgVxY4aCBNyFdfI8yuJV+SoUK8+2qOiQkkKppHTiQ9uFGgneiOXIy4Z1ldawTX01o
 Ic0WPsg0EECH8FSJ3krKL9eKyeEMuNjghAUgVfnOe8hkKJ00Gotwx6/bgooVmmd4onW+7X
 kOYELwyLxc/JrjIXqA3n3eTQmQonzC8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-ewiXDgk5OeW4RJpC9VTfMQ-1; Wed, 03 Mar 2021 14:12:14 -0500
X-MC-Unique: ewiXDgk5OeW4RJpC9VTfMQ-1
Received: by mail-wr1-f69.google.com with SMTP id m9so7487587wrx.6
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 11:12:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MCpf1H4OXD9yrNlExURtQRGgfyEZrfNaghb6RD0f6bw=;
 b=L8V9hanlBbtNMweZ2W5K1MgmsieyvkmvHpFOMFRrHuFjmtWey1bgW7yHT5ZGV+Ge1x
 Ro9I7hyEiOwI4XBh8okytmiHlTsmgj6AcNIMKCAbP4tWnEg61FGwRNfGrEMO82yj5zGw
 ZiS0kWJ+23zue3b9P8gfyT38B15ct0lcTYng61cnBcpfPcAT2w6FJPG7YtKsal/7igXy
 IArrfnG1b/8zba5savwhPxk8I8TVf2oHK8m70wZk6Ah89+lxRl8E/+LvOqSg1/t+WBx8
 Gv/eL+/tR/FmrHu829PBOFn0i/SzGzaovA+80VnrHJRjYAXqATXSUCQirFMpF88S3fi5
 GwvA==
X-Gm-Message-State: AOAM531MZmXtl3mFZN+UzpALwBaLkUzIsgPG7ze+VlL9HxRou7VTOZoi
 yXnyvNW9ulbhn/PnCpwUuu5q+LKR4uDXUpb2rMDdJT2fcpdy5+b20QuNPupcvi/3X//8yocp/Sz
 Hlh9GIymjiRW2SE6ZXLfIW+t1w+xiaW7Ig8bYr5RzH8+7VTOhWk+KgYPq+3usEGnw
X-Received: by 2002:adf:8341:: with SMTP id 59mr213910wrd.130.1614798732693;
 Wed, 03 Mar 2021 11:12:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdOBrnV985ExD4APTwSwarDv2aq51sOhfto7G+StqDdiOrCyv1U376c2/iT2arhc9NF13VKA==
X-Received: by 2002:adf:8341:: with SMTP id 59mr213883wrd.130.1614798732550;
 Wed, 03 Mar 2021 11:12:12 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h20sm6859508wmb.1.2021.03.03.11.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 11:12:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 01/10] net: Use 'struct iovec' in
 qemu_send_packet_async_with_flags()
Date: Wed,  3 Mar 2021 20:11:56 +0100
Message-Id: <20210303191205.1656980-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303191205.1656980-1-philmd@redhat.com>
References: <20210303191205.1656980-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Directly use iovec structure in qemu_send_packet_async_with_flags()
by inlining filter_receive() and using qemu_net_queue_send_iov()
instead of qemu_net_queue_send().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 net/net.c | 33 ++++++++++++---------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/net/net.c b/net/net.c
index fb7b7dcc252..159e4d0ec25 100644
--- a/net/net.c
+++ b/net/net.c
@@ -581,22 +581,6 @@ static ssize_t filter_receive_iov(NetClientState *nc,
     return ret;
 }
 
-static ssize_t filter_receive(NetClientState *nc,
-                              NetFilterDirection direction,
-                              NetClientState *sender,
-                              unsigned flags,
-                              const uint8_t *data,
-                              size_t size,
-                              NetPacketSent *sent_cb)
-{
-    struct iovec iov = {
-        .iov_base = (void *)data,
-        .iov_len = size
-    };
-
-    return filter_receive_iov(nc, direction, sender, flags, &iov, 1, sent_cb);
-}
-
 void qemu_purge_queued_packets(NetClientState *nc)
 {
     if (!nc->peer) {
@@ -638,6 +622,13 @@ static ssize_t qemu_send_packet_async_with_flags(NetClientState *sender,
 {
     NetQueue *queue;
     int ret;
+    int iovcnt = 1;
+    struct iovec iov[] = {
+        [0] = {
+            .iov_base = (void *)buf,
+            .iov_len = size,
+        },
+    };
 
 #ifdef DEBUG_NET
     printf("qemu_send_packet_async:\n");
@@ -649,21 +640,21 @@ static ssize_t qemu_send_packet_async_with_flags(NetClientState *sender,
     }
 
     /* Let filters handle the packet first */
-    ret = filter_receive(sender, NET_FILTER_DIRECTION_TX,
-                         sender, flags, buf, size, sent_cb);
+    ret = filter_receive_iov(sender, NET_FILTER_DIRECTION_TX,
+                             sender, flags, iov, iovcnt, sent_cb);
     if (ret) {
         return ret;
     }
 
-    ret = filter_receive(sender->peer, NET_FILTER_DIRECTION_RX,
-                         sender, flags, buf, size, sent_cb);
+    ret = filter_receive_iov(sender->peer, NET_FILTER_DIRECTION_RX,
+                             sender, flags, iov, iovcnt, sent_cb);
     if (ret) {
         return ret;
     }
 
     queue = sender->peer->incoming_queue;
 
-    return qemu_net_queue_send(queue, sender, flags, buf, size, sent_cb);
+    return qemu_net_queue_send_iov(queue, sender, flags, iov, iovcnt, sent_cb);
 }
 
 ssize_t qemu_send_packet_async(NetClientState *sender,
-- 
2.26.2


