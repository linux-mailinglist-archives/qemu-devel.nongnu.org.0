Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 944DA5FA316
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:01:33 +0200 (CEST)
Received: from localhost ([::1]:44450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohx5o-0006bs-M7
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwao-0000hA-UH
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:29:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwae-0006WE-JD
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:29:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665422959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MQSvNFO358FNTLwJZfDEG2H4eIK7/uaYo60a2mg4/K8=;
 b=SwklRjhMi22H8ljIbzchReXCXmSbk6l1S1A3Ghk+EvNur7rW2nC/dYQfq+KlqDHr2IXKM0
 kHByEdEX4zPNkpjkFOI6+FcCiwsmVjPAEQvCo5TNEVAnt9UP48mxR8omkTFYBh0T5VsYE/
 DMgBGQlUG/oYZI8acIi1tX3HdvSKHX8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-361-LX8Nw0IaNLqMMDlATbLG5Q-1; Mon, 10 Oct 2022 13:29:18 -0400
X-MC-Unique: LX8Nw0IaNLqMMDlATbLG5Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 k21-20020a7bc415000000b003b4fac53006so3260437wmi.3
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MQSvNFO358FNTLwJZfDEG2H4eIK7/uaYo60a2mg4/K8=;
 b=5+dRT25n2q796kgmIi4EDgdKO21KK/EELI0Eon0BUv/gggN1H7O3W2jmiJqlSnSCzd
 XOGmh3lheadaURdx78ZX0OQ+q9jPJgRskrzRyeQpbQcpao5tbBH4KFA1t0zjpAFLGGSO
 Z3hVg+ooNCGgB1Kgx3BVnFnh5B2Xkn5yQ0e2EfokgII9R/fGoUp5VVAUr9G4TFDGD3/b
 dEzIbv8+QAWT2l54PqhigYcktHIjDWb9ktK5tVSlhAqlBN26e+borWRmGhUuPmx/BGmF
 MlYi2o5T0iPpiMVPpl1hpWY7mGvvUZzLJ4esdKYU44Zuwi7Uankg+j1/AjHqJw1bk2LZ
 KUSw==
X-Gm-Message-State: ACrzQf3Bw3gstHo4G4DH6TC2Mcmz3sk1I9mqJO8BEH2ZqUPiEqqLTD19
 gst8Ft2M04L3PxCJTAAV0EAys1nHoxzXcNv5S6m9cr77ZRYkOzvY4cIGYGnoVNTUiRBDS+C+PVO
 CA39PYnQftx6KnR0ntBapUZIJrpEb2VpBfzRdjgPGfVHtaGl4esNJUFgyPGAc
X-Received: by 2002:a05:6000:981:b0:22e:6b59:fe52 with SMTP id
 by1-20020a056000098100b0022e6b59fe52mr11674598wrb.188.1665422956548; 
 Mon, 10 Oct 2022 10:29:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4YDxPtnv+WMlLsGSJnYTZNhhiTxTnFOpcQmuDB3GeWXbCsqlwUW+mDlnd5+wNrWKYs9aNkSQ==
X-Received: by 2002:a05:6000:981:b0:22e:6b59:fe52 with SMTP id
 by1-20020a056000098100b0022e6b59fe52mr11674572wrb.188.1665422956219; 
 Mon, 10 Oct 2022 10:29:16 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 p17-20020a5d4591000000b0022e32f4c06asm9187324wrq.11.2022.10.10.10.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:29:15 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:29:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Raphael Norwitz <raphael.norwittz@nutanix.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, qemu-block@nongnu.org,
 virtio-fs@redhat.com
Subject: [PULL 08/55] hw/virtio: move vhd->started check into helper and add
 FIXME
Message-ID: <20221010172813.204597-9-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

From: Alex Bennée <alex.bennee@linaro.org>

The `started` field is manipulated internally within the vhost code
except for one place, vhost-user-blk via f5b22d06fb (vhost: recheck
dev state in the vhost_migration_log routine). Mark that as a FIXME
because it introduces a potential race. I think the referenced fix
should be tracking its state locally.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220802095010.3330793-12-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Raphael Norwitz <raphael.norwittz@nutanix.com>
---
 include/hw/virtio/vhost.h      | 12 ++++++++++++
 hw/block/vhost-user-blk.c      | 10 ++++++++--
 hw/scsi/vhost-scsi.c           |  4 ++--
 hw/scsi/vhost-user-scsi.c      |  2 +-
 hw/virtio/vhost-user-fs.c      |  3 ++-
 hw/virtio/vhost-user-i2c.c     |  4 ++--
 hw/virtio/vhost-user-rng.c     |  4 ++--
 hw/virtio/vhost-user-vsock.c   |  2 +-
 hw/virtio/vhost-vsock-common.c |  3 ++-
 hw/virtio/vhost-vsock.c        |  2 +-
 10 files changed, 33 insertions(+), 13 deletions(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 586c5457e2..61b957e927 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -94,6 +94,7 @@ struct vhost_dev {
     uint64_t protocol_features;
     uint64_t max_queues;
     uint64_t backend_cap;
+    /* @started: is the vhost device started? */
     bool started;
     bool log_enabled;
     uint64_t log_size;
@@ -165,6 +166,17 @@ int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
  */
 void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
 
+/**
+ * vhost_dev_is_started() - report status of vhost device
+ * @hdev: common vhost_dev structure
+ *
+ * Return the started status of the vhost device
+ */
+static inline bool vhost_dev_is_started(struct vhost_dev *hdev)
+{
+    return hdev->started;
+}
+
 /**
  * vhost_dev_start() - start the vhost device
  * @hdev: common vhost_dev structure
diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 9117222456..2bba42478d 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -229,7 +229,7 @@ static void vhost_user_blk_set_status(VirtIODevice *vdev, uint8_t status)
         return;
     }
 
-    if (s->dev.started == should_start) {
+    if (vhost_dev_is_started(&s->dev) == should_start) {
         return;
     }
 
@@ -286,7 +286,7 @@ static void vhost_user_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
         return;
     }
 
-    if (s->dev.started) {
+    if (vhost_dev_is_started(&s->dev)) {
         return;
     }
 
@@ -415,6 +415,12 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
              * the vhost migration code. If disconnect was caught there is an
              * option for the general vhost code to get the dev state without
              * knowing its type (in this case vhost-user).
+             *
+             * FIXME: this is sketchy to be reaching into vhost_dev
+             * now because we are forcing something that implies we
+             * have executed vhost_dev_stop() but that won't happen
+             * until vhost_user_blk_stop() gets called from the bh.
+             * Really this state check should be tracked locally.
              */
             s->dev.started = false;
         }
diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index 3059068175..bdf337a7a2 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -120,7 +120,7 @@ static void vhost_scsi_set_status(VirtIODevice *vdev, uint8_t val)
         start = false;
     }
 
-    if (vsc->dev.started == start) {
+    if (vhost_dev_is_started(&vsc->dev) == start) {
         return;
     }
 
@@ -147,7 +147,7 @@ static int vhost_scsi_pre_save(void *opaque)
 
     /* At this point, backend must be stopped, otherwise
      * it might keep writing to memory. */
-    assert(!vsc->dev.started);
+    assert(!vhost_dev_is_started(&vsc->dev));
 
     return 0;
 }
diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
index 1b2f7eed98..bc37317d55 100644
--- a/hw/scsi/vhost-user-scsi.c
+++ b/hw/scsi/vhost-user-scsi.c
@@ -49,7 +49,7 @@ static void vhost_user_scsi_set_status(VirtIODevice *vdev, uint8_t status)
     VHostSCSICommon *vsc = VHOST_SCSI_COMMON(s);
     bool start = (status & VIRTIO_CONFIG_S_DRIVER_OK) && vdev->vm_running;
 
-    if (vsc->dev.started == start) {
+    if (vhost_dev_is_started(&vsc->dev) == start) {
         return;
     }
 
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index d2bebba785..ad0f91c607 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -20,6 +20,7 @@
 #include "hw/virtio/virtio-bus.h"
 #include "hw/virtio/virtio-access.h"
 #include "qemu/error-report.h"
+#include "hw/virtio/vhost.h"
 #include "hw/virtio/vhost-user-fs.h"
 #include "monitor/monitor.h"
 #include "sysemu/sysemu.h"
@@ -124,7 +125,7 @@ static void vuf_set_status(VirtIODevice *vdev, uint8_t status)
     VHostUserFS *fs = VHOST_USER_FS(vdev);
     bool should_start = virtio_device_started(vdev, status);
 
-    if (fs->vhost_dev.started == should_start) {
+    if (vhost_dev_is_started(&fs->vhost_dev) == should_start) {
         return;
     }
 
diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
index b930cf6d5e..bc58b6c0d1 100644
--- a/hw/virtio/vhost-user-i2c.c
+++ b/hw/virtio/vhost-user-i2c.c
@@ -95,7 +95,7 @@ static void vu_i2c_set_status(VirtIODevice *vdev, uint8_t status)
     VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
     bool should_start = virtio_device_started(vdev, status);
 
-    if (i2c->vhost_dev.started == should_start) {
+    if (vhost_dev_is_started(&i2c->vhost_dev) == should_start) {
         return;
     }
 
@@ -174,7 +174,7 @@ static void vu_i2c_disconnect(DeviceState *dev)
     }
     i2c->connected = false;
 
-    if (i2c->vhost_dev.started) {
+    if (vhost_dev_is_started(&i2c->vhost_dev)) {
         vu_i2c_stop(vdev);
     }
 }
diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
index a9c1c4bc79..bc1f36c5ac 100644
--- a/hw/virtio/vhost-user-rng.c
+++ b/hw/virtio/vhost-user-rng.c
@@ -92,7 +92,7 @@ static void vu_rng_set_status(VirtIODevice *vdev, uint8_t status)
     VHostUserRNG *rng = VHOST_USER_RNG(vdev);
     bool should_start = virtio_device_started(vdev, status);
 
-    if (rng->vhost_dev.started == should_start) {
+    if (vhost_dev_is_started(&rng->vhost_dev) == should_start) {
         return;
     }
 
@@ -160,7 +160,7 @@ static void vu_rng_disconnect(DeviceState *dev)
 
     rng->connected = false;
 
-    if (rng->vhost_dev.started) {
+    if (vhost_dev_is_started(&rng->vhost_dev)) {
         vu_rng_stop(vdev);
     }
 }
diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
index 22c1616ebd..7b67e29d83 100644
--- a/hw/virtio/vhost-user-vsock.c
+++ b/hw/virtio/vhost-user-vsock.c
@@ -57,7 +57,7 @@ static void vuv_set_status(VirtIODevice *vdev, uint8_t status)
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
     bool should_start = virtio_device_started(vdev, status);
 
-    if (vvc->vhost_dev.started == should_start) {
+    if (vhost_dev_is_started(&vvc->vhost_dev) == should_start) {
         return;
     }
 
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 7394818e00..29b9ab4f72 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -14,6 +14,7 @@
 #include "hw/virtio/virtio-access.h"
 #include "qemu/error-report.h"
 #include "hw/qdev-properties.h"
+#include "hw/virtio/vhost.h"
 #include "hw/virtio/vhost-vsock.h"
 #include "qemu/iov.h"
 #include "monitor/monitor.h"
@@ -199,7 +200,7 @@ int vhost_vsock_common_pre_save(void *opaque)
      * At this point, backend must be stopped, otherwise
      * it might keep writing to memory.
      */
-    assert(!vvc->vhost_dev.started);
+    assert(!vhost_dev_is_started(&vvc->vhost_dev));
 
     return 0;
 }
diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 8031c164a5..7dc3c73931 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -73,7 +73,7 @@ static void vhost_vsock_set_status(VirtIODevice *vdev, uint8_t status)
     bool should_start = virtio_device_started(vdev, status);
     int ret;
 
-    if (vvc->vhost_dev.started == should_start) {
+    if (vhost_dev_is_started(&vvc->vhost_dev) == should_start) {
         return;
     }
 
-- 
MST


