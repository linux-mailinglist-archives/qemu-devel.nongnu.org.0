Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8B162039C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:18:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osB0v-0006ca-GM; Mon, 07 Nov 2022 17:54:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osB0j-0006ax-Vt
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:54:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osB0i-0006tM-5m
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:54:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5DKAhc8UuyBsaAmvh2doz18jtlVWDfuKs/eOG9h+Qv8=;
 b=fMtP+HjCHEzqQScORx/LUxjEwdOLqt94VMl06OFvTJuDl2hIfybcjmSiFx1s82G00H6IJF
 q6riyg6AjcIcVsTWXI57zqxO7oMl4tqUqOUdN2MxD8DsbMVgyv3CE9NH1lmEmB0RQR41Yd
 t5M2e/TLg7x0a42qOhHvNxgeLpJtVSQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-147-Ksp3H5lTNaSsq_G7RRDZeA-1; Mon, 07 Nov 2022 17:54:29 -0500
X-MC-Unique: Ksp3H5lTNaSsq_G7RRDZeA-1
Received: by mail-qk1-f200.google.com with SMTP id
 x2-20020a05620a448200b006fa7dad5c1cso10166304qkp.10
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:54:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5DKAhc8UuyBsaAmvh2doz18jtlVWDfuKs/eOG9h+Qv8=;
 b=J2DsXM9vkqk1FWG8NiaTs8fGUJ+g/UcwivelVdlXE03brbHCm3zt73iKBhJ7cCxp2P
 ILlKWEPhBaTbxvKEbyQSJi2lx4uoFm1oEelO8DL9sQdAnXvBNupxUG+Uuvl5kAxd06rc
 ewY/NTBXYm0OXGw65prPtLxQQBwZycXj7N9JRD+b8T8KnZY09SbAITucXzVB1ZQiDv4o
 gbKda+FnN2RJrE3KLrFV5p7OF2TirvPniP04ndXMh6G8MXhvec6n70aLZgENgGQFxf9B
 1udj12w3nYf8bQXn/0Axr3bcKsZz8K4LY63/8lRO4iw6MnGPQWOUT/hBUYobKqB7TIcL
 dwSw==
X-Gm-Message-State: ANoB5plNPRTYVvc9413d0U9545asnFkT8PqX9Fe36zvlQiC8Z7IXReow
 hkoHmN+Xw42qrWAu2dknH9+S+dcrz9txR8fxoeg4rKpLBrOkYoF0ZycHSEvGsXSyGREx49RMM/e
 KUjSEPPDFu3uFCDg6oNIzPrb+znIGTFQ8PUXxqQIn4UJq0VO9+QF7vJPsnZJO
X-Received: by 2002:ac8:5e14:0:b0:3a5:89ec:b1fb with SMTP id
 h20-20020ac85e14000000b003a589ecb1fbmr6145938qtx.304.1667861668143; 
 Mon, 07 Nov 2022 14:54:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7b7eOZz5UJFyV4pIU4tXiTeBuOP96rWHs6aUoh1OKvNTUEjrKsSbq+LWhjNDmn2r+ayFKizA==
X-Received: by 2002:ac8:5e14:0:b0:3a5:89ec:b1fb with SMTP id
 h20-20020ac85e14000000b003a589ecb1fbmr6145915qtx.304.1667861667819; 
 Mon, 07 Nov 2022 14:54:27 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 bj10-20020a05620a190a00b006fa313bf185sm7826821qkb.8.2022.11.07.14.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:54:27 -0800 (PST)
Date: Mon, 7 Nov 2022 17:54:22 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, qemu-block@nongnu.org,
 virtio-fs@redhat.com
Subject: [PULL v4 82/83] hw/virtio: introduce virtio_device_should_start
Message-ID: <20221107224600.934080-83-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Alex Bennée <alex.bennee@linaro.org>

The previous fix to virtio_device_started revealed a problem in its
use by both the core and the device code. The core code should be able
to handle the device "starting" while the VM isn't running to handle
the restoration of migration state. To solve this duel use introduce a
new helper for use by the vhost-user backends who all use it to feed a
should_start variable.

We can also pick up a change vhost_user_blk_set_status while we are at
it which follows the same pattern.

Fixes: 9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_started)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Message-Id: <20221107121407.1010913-1-alex.bennee@linaro.org>
---
 include/hw/virtio/virtio.h   | 18 ++++++++++++++++++
 hw/block/vhost-user-blk.c    |  6 +-----
 hw/virtio/vhost-user-fs.c    |  2 +-
 hw/virtio/vhost-user-gpio.c  |  2 +-
 hw/virtio/vhost-user-i2c.c   |  2 +-
 hw/virtio/vhost-user-rng.c   |  2 +-
 hw/virtio/vhost-user-vsock.c |  2 +-
 hw/virtio/vhost-vsock.c      |  2 +-
 8 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 1423dba379..141a253a2c 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -395,6 +395,24 @@ static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t status)
         return vdev->started;
     }
 
+    return status & VIRTIO_CONFIG_S_DRIVER_OK;
+}
+
+/**
+ * virtio_device_should_start() - check if device startable
+ * @vdev - the VirtIO device
+ * @status - the devices status bits
+ *
+ * This is similar to virtio_device_started() but also encapsulates a
+ * check on the VM status which would prevent a device starting
+ * anyway.
+ */
+static inline bool virtio_device_should_start(VirtIODevice *vdev, uint8_t status)
+{
+    if (vdev->use_started) {
+        return vdev->started;
+    }
+
     if (!vdev->vm_running) {
         return false;
     }
diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 28409c90f7..16ad400889 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -226,14 +226,10 @@ static void vhost_user_blk_stop(VirtIODevice *vdev)
 static void vhost_user_blk_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
-    bool should_start = virtio_device_started(vdev, status);
+    bool should_start = virtio_device_should_start(vdev, status);
     Error *local_err = NULL;
     int ret;
 
-    if (!vdev->vm_running) {
-        should_start = false;
-    }
-
     if (!s->connected) {
         return;
     }
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index ad0f91c607..1c40f42045 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -123,7 +123,7 @@ static void vuf_stop(VirtIODevice *vdev)
 static void vuf_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostUserFS *fs = VHOST_USER_FS(vdev);
-    bool should_start = virtio_device_started(vdev, status);
+    bool should_start = virtio_device_should_start(vdev, status);
 
     if (vhost_dev_is_started(&fs->vhost_dev) == should_start) {
         return;
diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
index 8b40fe450c..677d1c7730 100644
--- a/hw/virtio/vhost-user-gpio.c
+++ b/hw/virtio/vhost-user-gpio.c
@@ -152,7 +152,7 @@ static void vu_gpio_stop(VirtIODevice *vdev)
 static void vu_gpio_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
-    bool should_start = virtio_device_started(vdev, status);
+    bool should_start = virtio_device_should_start(vdev, status);
 
     trace_virtio_gpio_set_status(status);
 
diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
index bc58b6c0d1..864eba695e 100644
--- a/hw/virtio/vhost-user-i2c.c
+++ b/hw/virtio/vhost-user-i2c.c
@@ -93,7 +93,7 @@ static void vu_i2c_stop(VirtIODevice *vdev)
 static void vu_i2c_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
-    bool should_start = virtio_device_started(vdev, status);
+    bool should_start = virtio_device_should_start(vdev, status);
 
     if (vhost_dev_is_started(&i2c->vhost_dev) == should_start) {
         return;
diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
index bc1f36c5ac..8b47287875 100644
--- a/hw/virtio/vhost-user-rng.c
+++ b/hw/virtio/vhost-user-rng.c
@@ -90,7 +90,7 @@ static void vu_rng_stop(VirtIODevice *vdev)
 static void vu_rng_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostUserRNG *rng = VHOST_USER_RNG(vdev);
-    bool should_start = virtio_device_started(vdev, status);
+    bool should_start = virtio_device_should_start(vdev, status);
 
     if (vhost_dev_is_started(&rng->vhost_dev) == should_start) {
         return;
diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
index 7b67e29d83..9431b9792c 100644
--- a/hw/virtio/vhost-user-vsock.c
+++ b/hw/virtio/vhost-user-vsock.c
@@ -55,7 +55,7 @@ const VhostDevConfigOps vsock_ops = {
 static void vuv_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
-    bool should_start = virtio_device_started(vdev, status);
+    bool should_start = virtio_device_should_start(vdev, status);
 
     if (vhost_dev_is_started(&vvc->vhost_dev) == should_start) {
         return;
diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 7dc3c73931..aa16d584ee 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -70,7 +70,7 @@ static int vhost_vsock_set_running(VirtIODevice *vdev, int start)
 static void vhost_vsock_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
-    bool should_start = virtio_device_started(vdev, status);
+    bool should_start = virtio_device_should_start(vdev, status);
     int ret;
 
     if (vhost_dev_is_started(&vvc->vhost_dev) == should_start) {
-- 
MST


