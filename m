Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3D352936E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 00:13:18 +0200 (CEST)
Received: from localhost ([::1]:35650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqixp-000594-Fa
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 18:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhl9-0004UG-Gd
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:56:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhl7-0007EQ-Nl
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rJGj9rcrPIfr0rT/FqmzOCh6EWoJ3dC5Zl4b5PjAYq0=;
 b=LUAdG1lSlQeg9SBjhtkm5qFc3S/f/GuIq10KDZNA+bqWA//bdkl6FZzM91LeVHtov0uqJ3
 +oh9F2hTHUOJtvLEzjcA9AvFpKFxrFun6Q6DPX0oaG2ilI9wvsyz7z5gd+AnHuXXIiAgVd
 cN+J4X4hY7XqxW2Au/oNNMUy+b+BvmQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-ITmvVV2nM6OxGORNWY25fw-1; Mon, 16 May 2022 16:56:04 -0400
X-MC-Unique: ITmvVV2nM6OxGORNWY25fw-1
Received: by mail-ed1-f72.google.com with SMTP id
 bc17-20020a056402205100b0042aa0e072d3so4134095edb.17
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rJGj9rcrPIfr0rT/FqmzOCh6EWoJ3dC5Zl4b5PjAYq0=;
 b=F6DM0xK+nUZW8btSxrasbSJF8jbqOdS7NClMSflq7dwV9np3kvfuYB1FYZ8yWpWUpM
 nOBa/Q9k97qP7TZXB2ju6QNrzuVVsdg3ar2S1E+M1uo4m58hgUFCbMPgRuV83N6GJS1r
 BFIQfPPhp3egMo1RVkQUXhVWvtqQJE5fAEeD2U4r1DT2qpr4bfoFTD8J3iPUa2wikVZj
 EDZHktJsr8DUyZl4BFBlfZ4LMPNAsELqQ8nkSmho+NXlnQ852RB0M0I8OeXTYo8c3UXX
 vTR1Y4WYXLScLP/ySZWdxvyUhadxCInSP1ce0m2G8HDuIt4mKH3U4x0yWg9RE/zwM+De
 JuuA==
X-Gm-Message-State: AOAM530tfU1krKOIMGBzigAN5xg0bdkDKj2CgWwwi9YSySw4Zb+BqxIO
 bwC+PFXY/q6WphDpTnkY5p9K6X5EMAYU9KgK5FhC2pI7j3wUmT9XWKZ6yE62TT67Sg6d5ojukua
 OJcZ0L5YtY5tSEGJFOEYpG+X9rLDfv3Hf4RO54hLgzzkHfV7vMG8J/5cozyOa
X-Received: by 2002:a17:907:2d10:b0:6f4:a700:6970 with SMTP id
 gs16-20020a1709072d1000b006f4a7006970mr17191233ejc.108.1652734562393; 
 Mon, 16 May 2022 13:56:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIHax5vmXIqb5pwR/Wje8Snai5ZyKFXFxV7Azq3Xp1+HI3bHivOP+gig2my0vR6ybDL+ygsw==
X-Received: by 2002:a17:907:2d10:b0:6f4:a700:6970 with SMTP id
 gs16-20020a1709072d1000b006f4a7006970mr17191213ejc.108.1652734562067; 
 Mon, 16 May 2022 13:56:02 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 z28-20020a17090674dc00b006f3ef214e3bsm152217ejl.161.2022.05.16.13.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:56:01 -0700 (PDT)
Date: Mon, 16 May 2022 16:55:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v2 85/86] virtio-net: don't handle mq request in userspace
 handler for vhost-vdpa
Message-ID: <20220516204913.542894-86-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Si-Wei Liu <si-wei.liu@oracle.com>

virtio_queue_host_notifier_read() tends to read pending event
left behind on ioeventfd in the vhost_net_stop() path, and
attempts to handle outstanding kicks from userspace vq handler.
However, in the ctrl_vq handler, virtio_net_handle_mq() has a
recursive call into virtio_net_set_status(), which may lead to
segmentation fault as shown in below stack trace:

0  0x000055f800df1780 in qdev_get_parent_bus (dev=0x0) at ../hw/core/qdev.c:376
1  0x000055f800c68ad8 in virtio_bus_device_iommu_enabled (vdev=vdev@entry=0x0) at ../hw/virtio/virtio-bus.c:331
2  0x000055f800d70d7f in vhost_memory_unmap (dev=<optimized out>) at ../hw/virtio/vhost.c:318
3  0x000055f800d70d7f in vhost_memory_unmap (dev=<optimized out>, buffer=0x7fc19bec5240, len=2052, is_write=1, access_len=2052) at ../hw/virtio/vhost.c:336
4  0x000055f800d71867 in vhost_virtqueue_stop (dev=dev@entry=0x55f8037ccc30, vdev=vdev@entry=0x55f8044ec590, vq=0x55f8037cceb0, idx=0) at ../hw/virtio/vhost.c:1241
5  0x000055f800d7406c in vhost_dev_stop (hdev=hdev@entry=0x55f8037ccc30, vdev=vdev@entry=0x55f8044ec590) at ../hw/virtio/vhost.c:1839
6  0x000055f800bf00a7 in vhost_net_stop_one (net=0x55f8037ccc30, dev=0x55f8044ec590) at ../hw/net/vhost_net.c:315
7  0x000055f800bf0678 in vhost_net_stop (dev=dev@entry=0x55f8044ec590, ncs=0x55f80452bae0, data_queue_pairs=data_queue_pairs@entry=7, cvq=cvq@entry=1)
   at ../hw/net/vhost_net.c:423
8  0x000055f800d4e628 in virtio_net_set_status (status=<optimized out>, n=0x55f8044ec590) at ../hw/net/virtio-net.c:296
9  0x000055f800d4e628 in virtio_net_set_status (vdev=vdev@entry=0x55f8044ec590, status=15 '\017') at ../hw/net/virtio-net.c:370
10 0x000055f800d534d8 in virtio_net_handle_ctrl (iov_cnt=<optimized out>, iov=<optimized out>, cmd=0 '\000', n=0x55f8044ec590) at ../hw/net/virtio-net.c:1408
11 0x000055f800d534d8 in virtio_net_handle_ctrl (vdev=0x55f8044ec590, vq=0x7fc1a7e888d0) at ../hw/net/virtio-net.c:1452
12 0x000055f800d69f37 in virtio_queue_host_notifier_read (vq=0x7fc1a7e888d0) at ../hw/virtio/virtio.c:2331
13 0x000055f800d69f37 in virtio_queue_host_notifier_read (n=n@entry=0x7fc1a7e8894c) at ../hw/virtio/virtio.c:3575
14 0x000055f800c688e6 in virtio_bus_cleanup_host_notifier (bus=<optimized out>, n=n@entry=14) at ../hw/virtio/virtio-bus.c:312
15 0x000055f800d73106 in vhost_dev_disable_notifiers (hdev=hdev@entry=0x55f8035b51b0, vdev=vdev@entry=0x55f8044ec590)
   at ../../../include/hw/virtio/virtio-bus.h:35
16 0x000055f800bf00b2 in vhost_net_stop_one (net=0x55f8035b51b0, dev=0x55f8044ec590) at ../hw/net/vhost_net.c:316
17 0x000055f800bf0678 in vhost_net_stop (dev=dev@entry=0x55f8044ec590, ncs=0x55f80452bae0, data_queue_pairs=data_queue_pairs@entry=7, cvq=cvq@entry=1)
   at ../hw/net/vhost_net.c:423
18 0x000055f800d4e628 in virtio_net_set_status (status=<optimized out>, n=0x55f8044ec590) at ../hw/net/virtio-net.c:296
19 0x000055f800d4e628 in virtio_net_set_status (vdev=0x55f8044ec590, status=15 '\017') at ../hw/net/virtio-net.c:370
20 0x000055f800d6c4b2 in virtio_set_status (vdev=0x55f8044ec590, val=<optimized out>) at ../hw/virtio/virtio.c:1945
21 0x000055f800d11d9d in vm_state_notify (running=running@entry=false, state=state@entry=RUN_STATE_SHUTDOWN) at ../softmmu/runstate.c:333
22 0x000055f800d04e7a in do_vm_stop (state=state@entry=RUN_STATE_SHUTDOWN, send_stop=send_stop@entry=false) at ../softmmu/cpus.c:262
23 0x000055f800d04e99 in vm_shutdown () at ../softmmu/cpus.c:280
24 0x000055f800d126af in qemu_cleanup () at ../softmmu/runstate.c:812
25 0x000055f800ad5b13 in main (argc=<optimized out>, argv=<optimized out>, envp=<optimized out>) at ../softmmu/main.c:51

For now, temporarily disable handling MQ request from the ctrl_vq
userspace hanlder to avoid the recursive virtio_net_set_status()
call. Some rework is needed to allow changing the number of
queues without going through a full virtio_net_set_status cycle,
particularly for vhost-vdpa backend.

This patch will need to be reverted as soon as future patches of
having the change of #queues handled in userspace is merged.

Fixes: 402378407db ("vhost-vdpa: multiqueue support")
Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <1651890498-24478-8-git-send-email-si-wei.liu@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 1ea524ff09..7ad948ee7c 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1381,6 +1381,7 @@ static int virtio_net_handle_mq(VirtIONet *n, uint8_t cmd,
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
     uint16_t queue_pairs;
+    NetClientState *nc = qemu_get_queue(n->nic);
 
     virtio_net_disable_rss(n);
     if (cmd == VIRTIO_NET_CTRL_MQ_HASH_CONFIG) {
@@ -1412,6 +1413,18 @@ static int virtio_net_handle_mq(VirtIONet *n, uint8_t cmd,
         return VIRTIO_NET_ERR;
     }
 
+    /* Avoid changing the number of queue_pairs for vdpa device in
+     * userspace handler. A future fix is needed to handle the mq
+     * change in userspace handler with vhost-vdpa. Let's disable
+     * the mq handling from userspace for now and only allow get
+     * done through the kernel. Ripples may be seen when falling
+     * back to userspace, but without doing it qemu process would
+     * crash on a recursive entry to virtio_net_set_status().
+     */
+    if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
+        return VIRTIO_NET_ERR;
+    }
+
     n->curr_queue_pairs = queue_pairs;
     /* stop the backend before changing the number of queue_pairs to avoid handling a
      * disabled queue */
-- 
MST


