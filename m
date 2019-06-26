Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0904755EB9
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jun 2019 04:34:25 +0200 (CEST)
Received: from localhost ([::1]:36322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfxlQ-0002lX-7p
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 22:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48225)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <elohimes@gmail.com>) id 1hfxjH-0001Vx-Ml
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 22:32:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <elohimes@gmail.com>) id 1hfxj9-0001iI-GG
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 22:32:06 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:33043)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <elohimes@gmail.com>) id 1hfxj5-0001c2-NC
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 22:32:01 -0400
Received: by mail-pl1-x643.google.com with SMTP id c14so528529plo.0
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2019 19:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=I/bjLTd/1YHMTbglHk1uwq049G1bbJuk0nNR9Wo1Qg8=;
 b=hWtLGl8F5bjoBgvNPJQ2MczWAYTA3EDi+arSvUINmh9JvC9HhV5pXMl5qoo5tONQLN
 vU9245UYjLChENsNWSVW9quwmGBqYGRmghdxoVoVYHv+0pVD6keTeXK4lBq9tWyT1Uhk
 McrpiOCgM5NE9WJJ5qUV1QEBgy2vWB8zkTAWH3hjyPgzq95PGimrU2E9Vbnq1AnSMHI7
 id6r2xgLnoZilUJ7Dw465jBKlWMQLQzRdBd8B5n9jF9yvD4iqWWhpCC8zwqWWnAT8hug
 YQpOz6dnYZ5FyIUH3y2gTOAg5i7op/jVYH0mSxTwQ5nDJAaaN0fSB3JQepOqa/rK8CE2
 /xfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=I/bjLTd/1YHMTbglHk1uwq049G1bbJuk0nNR9Wo1Qg8=;
 b=fBhAILC1ZvflgDXCfmM48DCt5UONhF+xG6fKba8DQlz/jXpyj2hFXZx58OicYi8kLg
 us4ccOqkl6BbZyIzYDkRCklqFa4DKOmyAW5rLTGHmtWqqIbxl46SU/eAjeZB4R5/pbaH
 X+uGpnCRT9blPwA4Rw1X6/lLcDXgc6BW8KjwImikfgIw8A9q3szfkWAVp62nPrqyLWgw
 9Zd1DIwpwdq3dJi6j62fNiCzRxNV/eeNrC4OA5/cODnXesIj1fqRK4GW+rWWD/nRWMxK
 OuQMHFOC6GrWY9JYVBloAeVxi7YHWmrsotBfo2Ioq0KkmopUeDFWdWXnxMsEj8alPV+m
 Je8A==
X-Gm-Message-State: APjAAAXPeRBkGl3T6JK8aiNwgqh38i5MUIJ+T/ubVB2MtlfkubRiybeW
 KKVSlIP52BGQXgKjWSv9G3E=
X-Google-Smtp-Source: APXvYqxv6bHA0DyR8WZw3TpjBkOkjddwCN/jRgHbFDfO07slB+wNsyb9e1Fa6IPFl1DdI1fEZTbAzQ==
X-Received: by 2002:a17:902:684:: with SMTP id 4mr2217225plh.138.1561516315608; 
 Tue, 25 Jun 2019 19:31:55 -0700 (PDT)
Received: from localhost ([116.247.112.152])
 by smtp.gmail.com with ESMTPSA id n184sm15472697pfn.21.2019.06.25.19.31.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 25 Jun 2019 19:31:55 -0700 (PDT)
From: elohimes@gmail.com
X-Google-Original-From: xieyongji@baidu.com
To: mst@redhat.com,
	groug@kaod.org
Date: Wed, 26 Jun 2019 10:31:26 +0800
Message-Id: <20190626023130.31315-2-xieyongji@baidu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190626023130.31315-1-xieyongji@baidu.com>
References: <20190626023130.31315-1-xieyongji@baidu.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-devel] [PATCH v4 1/5] virtio: add "use-started" property
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
Cc: lvivier@redhat.com, ehabkost@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, Xie Yongji <xieyongji@baidu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xie Yongji <xieyongji@baidu.com>

In order to avoid migration issues, we introduce a "use-started"
property to the base virtio device to indicate whether use
"started" flag or not. This property will be true by default and
set to false when machine type <= 4.0.

Suggested-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Xie Yongji <xieyongji@baidu.com>
---
 hw/block/vhost-user-blk.c  |  4 ++--
 hw/core/machine.c          |  1 +
 hw/virtio/virtio.c         | 18 +++++++-----------
 include/hw/virtio/virtio.h | 21 +++++++++++++++++++++
 4 files changed, 31 insertions(+), 13 deletions(-)

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
index ea5a01aa49..ea84bd6788 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -30,6 +30,7 @@ GlobalProperty hw_compat_4_0[] = {
     { "bochs-display",  "edid", "false" },
     { "virtio-vga",     "edid", "false" },
     { "virtio-gpu-pci", "edid", "false" },
+    { "virtio-device", "use-started", "false" },
 };
 const size_t hw_compat_4_0_len = G_N_ELEMENTS(hw_compat_4_0);
 
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index e1e90fcfd6..c9a6ca04b8 100644
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


