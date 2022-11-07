Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F657620321
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:01:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAwc-0000ul-Em; Mon, 07 Nov 2022 17:50:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAwY-0000qI-Sb
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:50:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAwX-0003jg-7n
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:50:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=53cDP1F6gXOJDB503L4H7aDBSnQaypNNt0vv+nFB0O0=;
 b=h5G5G5F5xSydBBi+K3dG/V58r0H1nmttbpxOm6wPJkkcqkSWWxaKixbzEDeOjBzMKd1NYd
 cfRbDOlS8SWqkPKBmm6dybo8Q/Ek8nT0EIs91ybqywgDGIWoRz4lFdlAp433oSzGR37vcs
 8FgiCQOxoNNeya7zMv8K9jfTPMa/CbI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-tHM_3-KcN6yglgLJC24XDw-1; Mon, 07 Nov 2022 17:50:11 -0500
X-MC-Unique: tHM_3-KcN6yglgLJC24XDw-1
Received: by mail-qv1-f70.google.com with SMTP id
 e9-20020ad45369000000b004bbb737fcf9so8525261qvv.6
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:50:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=53cDP1F6gXOJDB503L4H7aDBSnQaypNNt0vv+nFB0O0=;
 b=Ir1YoH9aFft+1M4IaU0NhS5S+bmhM7J8v1wgbkX5x/6RIvJPcSe1GL5nMPKTWOGTmm
 F0sW/HnGqrCUAKBiisKsue+pgWm+Qdv8EMmInR9Fz+eRn5zYIctZM6bWVdJNIEb7rr6y
 PDmKKLqrndtJg3MpW+zMBSHKSrY8V1JfJCv8hxaNG+WPx+dfZXZPVQJ+X59q+HkP6DYW
 0T52O5/W++CFdGyWMgVFR1uYHppdB3jeiMCwsg57wWXdbLK8w64kJHb8JZvfwONLY31Z
 MSKwA9abKYh/27A91cJcl4xnO5CQ4Flpk6sB2eY1A/uPWT8vfJ7LuaZre/7qoEb8QA3c
 zVRg==
X-Gm-Message-State: ACrzQf3beVmcILCoPoxrAUSMsRrEgBBAUfLoj0Z5Lm4VkyLl9OlEO6KP
 bJrxUi0ovRu8eB09a90IYMy59Od8/IOMyJlWeGK9IeFnznPQ38gCJx+G3I6R9knd4ACE9Pdd91N
 VzZy9cYLnAxYEgUCCA0ev+cf9+j6cZn7wUOk9u/oNOcsUudmd6bPml7loGwOn
X-Received: by 2002:ac8:1202:0:b0:3a5:2997:cab8 with SMTP id
 x2-20020ac81202000000b003a52997cab8mr32175807qti.639.1667861410951; 
 Mon, 07 Nov 2022 14:50:10 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4yc4oD0Higkhd9vPcoHyrGpZKppwVqB7TyI/pIJ+ocFOARanwRlQjvMnvR2zN87eWxT1KX4g==
X-Received: by 2002:ac8:1202:0:b0:3a5:2997:cab8 with SMTP id
 x2-20020ac81202000000b003a52997cab8mr32175785qti.639.1667861410614; 
 Mon, 07 Nov 2022 14:50:10 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 az36-20020a05620a172400b006ce9e880c6fsm7961705qkb.111.2022.11.07.14.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:50:10 -0800 (PST)
Date: Mon, 7 Nov 2022 17:50:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v4 31/83] virtio-pci: support queue reset
Message-ID: <20221107224600.934080-32-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

PCI devices support vq reset.

Based on this function, the driver can adjust the size of the ring, and
quickly recycle the buffer in the ring.

The migration of the virtio devices will not happen during a reset
operation. This is becuase the global iothread lock is held. Migration
thread also needs the lock. As a result, when migration of virtio
devices starts, the 'reset' status of VirtIOPCIQueue will always be 0.
Thus, we do not need to add it in vmstate_virtio_pci_modern_queue_state.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-6-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio-pci.h |  5 +++++
 hw/virtio/virtio-pci.c         | 15 +++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pci.h
index 2446dcd9ae..938799e8f6 100644
--- a/include/hw/virtio/virtio-pci.h
+++ b/include/hw/virtio/virtio-pci.h
@@ -117,6 +117,11 @@ typedef struct VirtIOPCIRegion {
 typedef struct VirtIOPCIQueue {
   uint16_t num;
   bool enabled;
+  /*
+   * No need to migrate the reset status, because it is always 0
+   * when the migration starts.
+   */
+  bool reset;
   uint32_t desc[2];
   uint32_t avail[2];
   uint32_t used[2];
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 34db51e241..d4f2ffe986 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1251,6 +1251,9 @@ static uint64_t virtio_pci_common_read(void *opaque, hwaddr addr,
     case VIRTIO_PCI_COMMON_Q_USEDHI:
         val = proxy->vqs[vdev->queue_sel].used[1];
         break;
+    case VIRTIO_PCI_COMMON_Q_RESET:
+        val = proxy->vqs[vdev->queue_sel].reset;
+        break;
     default:
         val = 0;
     }
@@ -1338,6 +1341,7 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
                        ((uint64_t)proxy->vqs[vdev->queue_sel].used[1]) << 32 |
                        proxy->vqs[vdev->queue_sel].used[0]);
             proxy->vqs[vdev->queue_sel].enabled = 1;
+            proxy->vqs[vdev->queue_sel].reset = 0;
         } else {
             virtio_error(vdev, "wrong value for queue_enable %"PRIx64, val);
         }
@@ -1360,6 +1364,16 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
     case VIRTIO_PCI_COMMON_Q_USEDHI:
         proxy->vqs[vdev->queue_sel].used[1] = val;
         break;
+    case VIRTIO_PCI_COMMON_Q_RESET:
+        if (val == 1) {
+            proxy->vqs[vdev->queue_sel].reset = 1;
+
+            virtio_queue_reset(vdev, vdev->queue_sel);
+
+            proxy->vqs[vdev->queue_sel].reset = 0;
+            proxy->vqs[vdev->queue_sel].enabled = 0;
+        }
+        break;
     default:
         break;
     }
@@ -1954,6 +1968,7 @@ static void virtio_pci_reset(DeviceState *qdev)
 
     for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
         proxy->vqs[i].enabled = 0;
+        proxy->vqs[i].reset = 0;
         proxy->vqs[i].num = 0;
         proxy->vqs[i].desc[0] = proxy->vqs[i].desc[1] = 0;
         proxy->vqs[i].avail[0] = proxy->vqs[i].avail[1] = 0;
-- 
MST


