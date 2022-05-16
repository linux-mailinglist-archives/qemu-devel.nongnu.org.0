Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DD0528467
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:46:31 +0200 (CEST)
Received: from localhost ([::1]:35028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqa7K-0006Ij-U1
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY9d-0002tX-R9
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:40:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY9c-0005oz-13
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:40:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+A4vB5M07e/rYIfkuHJ1c5xTvbN6acy0VhX/QsPIpxM=;
 b=VHRWdvPfQWH+ldW9sHRfzyPkco6O6ip6HkAv9M7AqNqycSIPoV2p76dyHlBUeN65MMiz2c
 oa9PplBwiLifIcaRVgkEbeCv2xHjN5wU8/Qk9Ve7f3jlgpx4lA0oHO86TfJlJlWHq2aoZ9
 GdmFZ/IvCPbT9LXBbvPVBaU2MlRtTgs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-jlMHrpmSOuGjFfYNmM5IxQ-1; Mon, 16 May 2022 06:40:42 -0400
X-MC-Unique: jlMHrpmSOuGjFfYNmM5IxQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 z23-20020a05600c221700b003942fd37764so10139652wml.8
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+A4vB5M07e/rYIfkuHJ1c5xTvbN6acy0VhX/QsPIpxM=;
 b=RjpgbpRkClFJnmr4QsF5SLdp1cdxla3rCy6Wbg8d9GY0N02CMVhUmow+x+pg5oTjYZ
 s8YK7Sb5q20VE0T5AoDRYuzA++vn/KzKHWx/Z6cDXrkhrCfZrZPCTc4c5PEwe8Zt3Ojk
 L9XFsNQceBkCHOzVlxDSKgd4sgDLttSl/IkSc8ALi1VIcOPJPBaHmr274MC9H4ra6Y86
 YHI3mEL9L/T+56FQHj/HnMIN2t/KXPR3kJ4cZNaGOAzx/IfxWGVofthGwcVbfOtzR7PD
 znDd/Z+hkaZFZqqqHAv26r/LBLZ+6hBmkx1KUkpB/q0e6me2daJlZstYlyqh6BGZH3au
 0TcQ==
X-Gm-Message-State: AOAM532KKGFp2O95s4xDyuepoWsSjTGlMJcezsyWgLphoOfbXLHHaO77
 HXMrvGxPDLUAuzN2Rss197hbhRDjr8E98iVpWK5Y1c5p+YTOHqJ39keZhuy7gtUgBBomx2psAoo
 56NWNtUELDemDdFjNuCmh9yv6Qq6fJq33o7hk3Ob1K0v2KfynG8mBRn/GfFHy
X-Received: by 2002:a05:600c:a4b:b0:37b:ea2b:5583 with SMTP id
 c11-20020a05600c0a4b00b0037bea2b5583mr27100394wmq.139.1652697640836; 
 Mon, 16 May 2022 03:40:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyO/16vYU/x0bRr7glfFBdR5FG5t7UU1gA7Gxx8h1B/L0zgO3OARR1lT3hdGGMEYwJBTAz/ug==
X-Received: by 2002:a05:600c:a4b:b0:37b:ea2b:5583 with SMTP id
 c11-20020a05600c0a4b00b0037bea2b5583mr27100361wmq.139.1652697640418; 
 Mon, 16 May 2022 03:40:40 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 l5-20020adfc785000000b0020cdcb0efa2sm9210694wrg.34.2022.05.16.03.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:40:40 -0700 (PDT)
Date: Mon, 16 May 2022 06:40:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 86/91] virtio-net: align ctrl_vq index for non-mq guest for
 vhost_vdpa
Message-ID: <20220516095448.507876-87-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

With MQ enabled vdpa device and non-MQ supporting guest e.g.
booting vdpa with mq=on over OVMF of single vqp, below assert
failure is seen:

../hw/virtio/vhost-vdpa.c:560: vhost_vdpa_get_vq_index: Assertion `idx >= dev->vq_index && idx < dev->vq_index + dev->nvqs' failed.

0  0x00007f8ce3ff3387 in raise () at /lib64/libc.so.6
1  0x00007f8ce3ff4a78 in abort () at /lib64/libc.so.6
2  0x00007f8ce3fec1a6 in __assert_fail_base () at /lib64/libc.so.6
3  0x00007f8ce3fec252 in  () at /lib64/libc.so.6
4  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:563
5  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:558
6  0x0000558f52d7329a in vhost_virtqueue_mask (hdev=0x558f55c01800, vdev=0x558f568f91f0, n=2, mask=<optimized out>) at ../hw/virtio/vhost.c:1557
7  0x0000558f52c6b89a in virtio_pci_set_guest_notifier (d=d@entry=0x558f568f0f60, n=n@entry=2, assign=assign@entry=true, with_irqfd=with_irqfd@entry=false)
   at ../hw/virtio/virtio-pci.c:974
8  0x0000558f52c6c0d8 in virtio_pci_set_guest_notifiers (d=0x558f568f0f60, nvqs=3, assign=true) at ../hw/virtio/virtio-pci.c:1019
9  0x0000558f52bf091d in vhost_net_start (dev=dev@entry=0x558f568f91f0, ncs=0x558f56937cd0, data_queue_pairs=data_queue_pairs@entry=1, cvq=cvq@entry=1)
   at ../hw/net/vhost_net.c:361
10 0x0000558f52d4e5e7 in virtio_net_set_status (status=<optimized out>, n=0x558f568f91f0) at ../hw/net/virtio-net.c:289
11 0x0000558f52d4e5e7 in virtio_net_set_status (vdev=0x558f568f91f0, status=15 '\017') at ../hw/net/virtio-net.c:370
12 0x0000558f52d6c4b2 in virtio_set_status (vdev=vdev@entry=0x558f568f91f0, val=val@entry=15 '\017') at ../hw/virtio/virtio.c:1945
13 0x0000558f52c69eff in virtio_pci_common_write (opaque=0x558f568f0f60, addr=<optimized out>, val=<optimized out>, size=<optimized out>) at ../hw/virtio/virtio-pci.c:1292
14 0x0000558f52d15d6e in memory_region_write_accessor (mr=0x558f568f19d0, addr=20, value=<optimized out>, size=1, shift=<optimized out>, mask=<optimized out>, attrs=...)
   at ../softmmu/memory.c:492
15 0x0000558f52d127de in access_with_adjusted_size (addr=addr@entry=20, value=value@entry=0x7f8cdbffe748, size=size@entry=1, access_size_min=<optimized out>, access_size_max=<optimized out>, access_fn=0x558f52d15cf0 <memory_region_write_accessor>, mr=0x558f568f19d0, attrs=...) at ../softmmu/memory.c:554
16 0x0000558f52d157ef in memory_region_dispatch_write (mr=mr@entry=0x558f568f19d0, addr=20, data=<optimized out>, op=<optimized out>, attrs=attrs@entry=...)
   at ../softmmu/memory.c:1504
17 0x0000558f52d078e7 in flatview_write_continue (fv=fv@entry=0x7f8accbc3b90, addr=addr@entry=103079215124, attrs=..., ptr=ptr@entry=0x7f8ce6300028, len=len@entry=1, addr1=<optimized out>, l=<optimized out>, mr=0x558f568f19d0) at /home/opc/qemu-upstream/include/qemu/host-utils.h:165
18 0x0000558f52d07b06 in flatview_write (fv=0x7f8accbc3b90, addr=103079215124, attrs=..., buf=0x7f8ce6300028, len=1) at ../softmmu/physmem.c:2822
19 0x0000558f52d0b36b in address_space_write (as=<optimized out>, addr=<optimized out>, attrs=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>)
   at ../softmmu/physmem.c:2914
20 0x0000558f52d0b3da in address_space_rw (as=<optimized out>, addr=<optimized out>, attrs=...,
   attrs@entry=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>, is_write=<optimized out>) at ../softmmu/physmem.c:2924
21 0x0000558f52dced09 in kvm_cpu_exec (cpu=cpu@entry=0x558f55c2da60) at ../accel/kvm/kvm-all.c:2903
22 0x0000558f52dcfabd in kvm_vcpu_thread_fn (arg=arg@entry=0x558f55c2da60) at ../accel/kvm/kvm-accel-ops.c:49
23 0x0000558f52f9f04a in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:556
24 0x00007f8ce4392ea5 in start_thread () at /lib64/libpthread.so.0
25 0x00007f8ce40bb9fd in clone () at /lib64/libc.so.6

The cause for the assert failure is due to that the vhost_dev index
for the ctrl vq was not aligned with actual one in use by the guest.
Upon multiqueue feature negotiation in virtio_net_set_multiqueue(),
if guest doesn't support multiqueue, the guest vq layout would shrink
to a single queue pair, consisting of 3 vqs in total (rx, tx and ctrl).
This results in ctrl_vq taking a different vhost_dev group index than
the default. We can map vq to the correct vhost_dev group by checking
if MQ is supported by guest and successfully negotiated. Since the
MQ feature is only present along with CTRL_VQ, we ensure the index
2 is only meant for the control vq while MQ is not supported by guest.

Fixes: 22288fe ("virtio-net: vhost control virtqueue support")
Suggested-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <1651890498-24478-3-git-send-email-si-wei.liu@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index f9dd012021..ccfb2f3761 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -14,6 +14,7 @@
 #include "qemu/osdep.h"
 #include "qemu/atomic.h"
 #include "qemu/iov.h"
+#include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "hw/virtio/virtio.h"
@@ -3219,8 +3220,22 @@ static NetClientInfo net_virtio_info = {
 static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
-    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
+    NetClientState *nc;
     assert(n->vhost_started);
+    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx == 2) {
+        /* Must guard against invalid features and bogus queue index
+         * from being set by malicious guest, or penetrated through
+         * buggy migration stream.
+         */
+        if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: bogus vq index ignored\n", __func__);
+            return false;
+        }
+        nc = qemu_get_subqueue(n->nic, n->max_queue_pairs);
+    } else {
+        nc = qemu_get_subqueue(n->nic, vq2q(idx));
+    }
     return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
 }
 
@@ -3228,8 +3243,22 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
                                            bool mask)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
-    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
+    NetClientState *nc;
     assert(n->vhost_started);
+    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx == 2) {
+        /* Must guard against invalid features and bogus queue index
+         * from being set by malicious guest, or penetrated through
+         * buggy migration stream.
+         */
+        if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: bogus vq index ignored\n", __func__);
+            return;
+        }
+        nc = qemu_get_subqueue(n->nic, n->max_queue_pairs);
+    } else {
+        nc = qemu_get_subqueue(n->nic, vq2q(idx));
+    }
     vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
                              vdev, idx, mask);
 }
-- 
MST


