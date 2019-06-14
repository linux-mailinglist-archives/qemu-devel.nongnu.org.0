Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A754458FF
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 11:42:09 +0200 (CEST)
Received: from localhost ([::1]:49612 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbiim-00079g-QM
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 05:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40605)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <elohimes@gmail.com>) id 1hbieL-0004gq-Ih
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 05:37:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <elohimes@gmail.com>) id 1hbiZ4-0000mO-7N
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 05:32:07 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:42747)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <elohimes@gmail.com>) id 1hbiZ4-0000m7-1P
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 05:32:06 -0400
Received: by mail-pg1-x544.google.com with SMTP id l19so1213024pgh.9
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 02:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MaNnBhq230BAubeMqIN5LqpwAUYnao6c+evwILoE4ik=;
 b=DTDUxy7THN8vdbsc/IYZQii4wnr6/XIVBLqdtAPiZr2gzGfmCI965b1y0kY3/PMVAa
 6SdyvERRyTsczD+iLQN8kWwsXJNi2u3IDrKUApDX59UjXCaxx33EcITzGhu5HTVfwglq
 Ib782zDbkJEKljRN3qwTSe87AWm8zxGakol7XTTShR6h0haa0bVgEjSaQ/2mrh5/J67P
 l9ijbuX43Lo71uWNr5sMKR6YAUtgCz+ePHlmp6mYvunKHRN7iu+2qC41NdeGjoM049Y3
 3i2WyNECmaWwefCEnAqoM/QbQ7mBfhnvDCr5xES5zUu6WZf8lHSzy3XJ9d0vPG2/zqGp
 UE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MaNnBhq230BAubeMqIN5LqpwAUYnao6c+evwILoE4ik=;
 b=LE+7/lRGEEgKhADD2aY/ilV4asx34rJ2A8VI57BxtF6DMyHGuGbYJJDDVzdfifmo/g
 UvCFGjVfrzL6cmKlclYCrhJ8ZdMxx1rnrLjx/LRJ/iBEzEda2MPyYUQ8kH/MJiSPXIgi
 XjrEJIqsqZVNgwk0h5zsbyrzlt5ELyzHud82ZPJCdC7BF6Req0EYBaXRXoOI+jI967z1
 WCBGPyuY5F2BVokFWa+QIf9k8BVw/iXM8qXYZepedqDOItLsA36GfkIdBPb3Y4707jxT
 i8TL3HmwglDokzg8dz2hoIS0V7NCd1ETnHYeIdijuaxADePjt3sAk3Fc3KuyvkKRekMd
 VLaw==
X-Gm-Message-State: APjAAAWbgVxdJX2+cimWCQbmZlDz/4Qb1e6XUndkVMp3mRTlaZLUHVZN
 FZ+LPnzApCOv0AJfBMuGPuk=
X-Google-Smtp-Source: APXvYqy27LsXxxAhrUE6QdMBKy+muFTNJE23qY3Ji73EOfRIQt6kfBeI/ZNdQa+3TAubavAhlp3E4Q==
X-Received: by 2002:a62:a511:: with SMTP id v17mr95204312pfm.129.1560504725081; 
 Fri, 14 Jun 2019 02:32:05 -0700 (PDT)
Received: from localhost ([116.247.112.152])
 by smtp.gmail.com with ESMTPSA id 24sm2166173pgn.32.2019.06.14.02.32.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 14 Jun 2019 02:32:04 -0700 (PDT)
From: elohimes@gmail.com
X-Google-Original-From: xieyongji@baidu.com
To: mst@redhat.com,
	groug@kaod.org
Date: Fri, 14 Jun 2019 17:31:17 +0800
Message-Id: <20190614093121.5580-2-xieyongji@baidu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190614093121.5580-1-xieyongji@baidu.com>
References: <20190614093121.5580-1-xieyongji@baidu.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-devel] [PATCH v3 1/5] virtio: add "use-started" property
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
Cc: qemu-devel@nongnu.org, Xie Yongji <xieyongji@baidu.com>,
 dgilbert@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xie Yongji <xieyongji@baidu.com>

In order to avoid migration issues, we introduce a "use-started"
property to the base virtio device to indicate whether use
"started" flag or not. This property will be true by default and
set to false when machine type <= 4.0.1.

Suggested-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Xie Yongji <xieyongji@baidu.com>
---
 hw/block/vhost-user-blk.c  |  4 ++--
 hw/core/machine.c          |  8 ++++++--
 hw/virtio/virtio.c         | 18 +++++++-----------
 include/hw/virtio/virtio.h | 21 +++++++++++++++++++++
 4 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 9cb61336a6..85bc4017e7 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -191,7 +191,7 @@ static void vhost_user_blk_stop(VirtIODevice *vdev)
 static void vhost_user_blk_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
-    bool should_start = vdev->started;
+    bool should_start = virtio_device_started(vdev, status);
     int ret;
 
     if (!vdev->vm_running) {
@@ -317,7 +317,7 @@ static int vhost_user_blk_connect(DeviceState *dev)
     }
 
     /* restore vhost state */
-    if (vdev->started) {
+    if (virtio_device_started(vdev, vdev->status)) {
         ret = vhost_user_blk_start(vdev);
         if (ret < 0) {
             error_report("vhost-user-blk: vhost start failed: %s",
diff --git a/hw/core/machine.c b/hw/core/machine.c
index f1a0f45f9c..60d1e27d2c 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -24,10 +24,14 @@
 #include "hw/pci/pci.h"
 #include "hw/mem/nvdimm.h"
 
-GlobalProperty hw_compat_4_0_1[] = {};
+GlobalProperty hw_compat_4_0_1[] = {
+    { "virtio-device", "use-started", "false" },
+};
 const size_t hw_compat_4_0_1_len = G_N_ELEMENTS(hw_compat_4_0_1);
 
-GlobalProperty hw_compat_4_0[] = {};
+GlobalProperty hw_compat_4_0[] = {
+    { "virtio-device", "use-started", "false" },
+};
 const size_t hw_compat_4_0_len = G_N_ELEMENTS(hw_compat_4_0);
 
 GlobalProperty hw_compat_3_1[] = {
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 07f4a64b48..19062fbb96 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1162,10 +1162,8 @@ int virtio_set_status(VirtIODevice *vdev, uint8_t val)
             }
         }
     }
-    vdev->started = val & VIRTIO_CONFIG_S_DRIVER_OK;
-    if (unlikely(vdev->start_on_kick && vdev->started)) {
-        vdev->start_on_kick = false;
-    }
+
+    virtio_set_started(vdev, val & VIRTIO_CONFIG_S_DRIVER_OK);
 
     if (k->set_status) {
         k->set_status(vdev, val);
@@ -1536,8 +1534,7 @@ static bool virtio_queue_notify_aio_vq(VirtQueue *vq)
         ret = vq->handle_aio_output(vdev, vq);
 
         if (unlikely(vdev->start_on_kick)) {
-            vdev->started = true;
-            vdev->start_on_kick = false;
+            virtio_set_started(vdev, true);
         }
     }
 
@@ -1557,8 +1554,7 @@ static void virtio_queue_notify_vq(VirtQueue *vq)
         vq->handle_output(vdev, vq);
 
         if (unlikely(vdev->start_on_kick)) {
-            vdev->started = true;
-            vdev->start_on_kick = false;
+            virtio_set_started(vdev, true);
         }
     }
 }
@@ -1579,8 +1575,7 @@ void virtio_queue_notify(VirtIODevice *vdev, int n)
     }
 
     if (unlikely(vdev->start_on_kick)) {
-        vdev->started = true;
-        vdev->start_on_kick = false;
+        virtio_set_started(vdev, true);
     }
 }
 
@@ -2291,7 +2286,7 @@ static void virtio_vmstate_change(void *opaque, int running, RunState state)
     VirtIODevice *vdev = opaque;
     BusState *qbus = qdev_get_parent_bus(DEVICE(vdev));
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
-    bool backend_run = running && vdev->started;
+    bool backend_run = running && virtio_device_started(vdev, vdev->status);
     vdev->vm_running = running;
 
     if (backend_run) {
@@ -2669,6 +2664,7 @@ static void virtio_device_instance_finalize(Object *obj)
 
 static Property virtio_properties[] = {
     DEFINE_VIRTIO_COMMON_FEATURES(VirtIODevice, host_features),
+    DEFINE_PROP_BOOL("use-started", VirtIODevice, use_started, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 27c0efc3d0..15d5366939 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -105,6 +105,7 @@ struct VirtIODevice
     uint16_t device_id;
     bool vm_running;
     bool broken; /* device in invalid state, needs reset */
+    bool use_started;
     bool started;
     bool start_on_kick; /* virtio 1.0 transitional devices support that */
     VMChangeStateEntry *vmstate;
@@ -351,4 +352,24 @@ static inline bool virtio_is_big_endian(VirtIODevice *vdev)
     /* Devices conforming to VIRTIO 1.0 or later are always LE. */
     return false;
 }
+
+static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t status)
+{
+    if (vdev->use_started) {
+        return vdev->started;
+    }
+
+    return status & VIRTIO_CONFIG_S_DRIVER_OK;
+}
+
+static inline void virtio_set_started(VirtIODevice *vdev, bool started)
+{
+    if (started) {
+        vdev->start_on_kick = false;
+    }
+
+    if (vdev->use_started) {
+        vdev->started = started;
+    }
+}
 #endif
-- 
2.17.1


