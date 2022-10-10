Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBEF5FA305
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 19:57:03 +0200 (CEST)
Received: from localhost ([::1]:42428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohx1S-0000Mh-Br
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 13:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwae-0000Hh-Uh
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:29:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwaZ-0006V0-DI
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:29:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665422954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2l9JLwGuz3wzXzGkuYjtRaLlikVZCR4iaTnj7H8kZ3E=;
 b=FqBXL88TFPUNgyHRQAIeREt3clOa4hKiYCF95/boryDO/8LIR9dLIfS1rd5omk69LwFJ4w
 3cWKaSx3tWscRLnZXPRgt0K/pGvxcxqrNsV+rvs6xjpY+TMh8UxiHFOghwla1qVHbATEaq
 yaQ5ORjjqFzgsxZ3sWdUIqhVkDwvTac=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-370-UTqY8tbDPO6T0dyImkCGPw-1; Mon, 10 Oct 2022 13:29:11 -0400
X-MC-Unique: UTqY8tbDPO6T0dyImkCGPw-1
Received: by mail-wm1-f70.google.com with SMTP id
 h10-20020a1c210a000000b003c56437e529so707155wmh.2
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2l9JLwGuz3wzXzGkuYjtRaLlikVZCR4iaTnj7H8kZ3E=;
 b=68AaFmVG3SobEV6WYhciX6I+0COCto14YWaC1r9Hl6r4SuKx/uxJATHDnFWOzILaKE
 ZT/WuexgwWJZKkkSaIxS8uPrvHUeCSh4EmdBZ2nEfWRZ4/a5jZ4NYHcGNu/bZsds0Rk5
 MZXqWBxNcVP3dBHw1Jbpgt8YJE/3Pmej1jBmpziYbAAPtORukiTyBJQRHGwAyhOTCK8a
 g4cjrKqbxenOwtl74rxCoF9/hkOD+jgrT34czE79kTvxLaKFP766WhgS7K/zkbb/Erju
 /1eDXcE+w5WVMUC7JjBNgfYITsLV1gXvTjfeEqypbbjGiyY3Rt7mtPnmshd19yZATHdN
 mfxg==
X-Gm-Message-State: ACrzQf3AVxOxCk0Yr45pI7KBb7xoQ+zId1Z23A9jhdTTIz7274xrn5hz
 Bb0535nGnDACKTtG0g103xXSwSLk4Hus49ys4rhEd9vYe0L1TclM2OwxVTXG3fFJXhOn9VAA9yw
 znj0IVVgl45AsGSAD0pMnaoreBnbcUmwWSrYG62pU1Ui9yv0FUBOvKIuuV9Lh
X-Received: by 2002:a05:600c:4789:b0:3c4:dbb7:ab0c with SMTP id
 k9-20020a05600c478900b003c4dbb7ab0cmr8567763wmo.164.1665422950332; 
 Mon, 10 Oct 2022 10:29:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4jjBQ7CQKzNydZwwSmAhNo+MTOR/s6NX5Rhw9kX4K9i+c759pzaBG+oIvoscBujOweMizcUA==
X-Received: by 2002:a05:600c:4789:b0:3c4:dbb7:ab0c with SMTP id
 k9-20020a05600c478900b003c4dbb7ab0cmr8567740wmo.164.1665422950091; 
 Mon, 10 Oct 2022 10:29:10 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 d9-20020adff2c9000000b0021badf3cb26sm11616044wrp.63.2022.10.10.10.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:29:09 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:29:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, virtio-fs@redhat.com
Subject: [PULL 07/55] hw/virtio: move vm_running check to virtio_device_started
Message-ID: <20221010172813.204597-8-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

All the boilerplate virtio code does the same thing (or should at
least) of checking to see if the VM is running before attempting to
start VirtIO. Push the logic up to the common function to avoid
getting a copy and paste wrong.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220802095010.3330793-11-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio.h   | 5 +++++
 hw/virtio/vhost-user-fs.c    | 6 +-----
 hw/virtio/vhost-user-i2c.c   | 6 +-----
 hw/virtio/vhost-user-rng.c   | 6 +-----
 hw/virtio/vhost-user-vsock.c | 6 +-----
 hw/virtio/vhost-vsock.c      | 6 +-----
 6 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 9bb2485415..74e7ad5a92 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -100,6 +100,7 @@ struct VirtIODevice
     VirtQueue *vq;
     MemoryListener listener;
     uint16_t device_id;
+    /* @vm_running: current VM running state via virtio_vmstate_change() */
     bool vm_running;
     bool broken; /* device in invalid state, needs reset */
     bool use_disabled_flag; /* allow use of 'disable' flag when needed */
@@ -376,6 +377,10 @@ static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t status)
         return vdev->started;
     }
 
+    if (!vdev->vm_running) {
+        return false;
+    }
+
     return status & VIRTIO_CONFIG_S_DRIVER_OK;
 }
 
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index e513e4fdda..d2bebba785 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -122,11 +122,7 @@ static void vuf_stop(VirtIODevice *vdev)
 static void vuf_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostUserFS *fs = VHOST_USER_FS(vdev);
-    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
-
-    if (!vdev->vm_running) {
-        should_start = false;
-    }
+    bool should_start = virtio_device_started(vdev, status);
 
     if (fs->vhost_dev.started == should_start) {
         return;
diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
index 6020eee093..b930cf6d5e 100644
--- a/hw/virtio/vhost-user-i2c.c
+++ b/hw/virtio/vhost-user-i2c.c
@@ -93,11 +93,7 @@ static void vu_i2c_stop(VirtIODevice *vdev)
 static void vu_i2c_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
-    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
-
-    if (!vdev->vm_running) {
-        should_start = false;
-    }
+    bool should_start = virtio_device_started(vdev, status);
 
     if (i2c->vhost_dev.started == should_start) {
         return;
diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
index 3a7bf8e32d..a9c1c4bc79 100644
--- a/hw/virtio/vhost-user-rng.c
+++ b/hw/virtio/vhost-user-rng.c
@@ -90,11 +90,7 @@ static void vu_rng_stop(VirtIODevice *vdev)
 static void vu_rng_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostUserRNG *rng = VHOST_USER_RNG(vdev);
-    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
-
-    if (!vdev->vm_running) {
-        should_start = false;
-    }
+    bool should_start = virtio_device_started(vdev, status);
 
     if (rng->vhost_dev.started == should_start) {
         return;
diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
index 0f8ff99f85..22c1616ebd 100644
--- a/hw/virtio/vhost-user-vsock.c
+++ b/hw/virtio/vhost-user-vsock.c
@@ -55,11 +55,7 @@ const VhostDevConfigOps vsock_ops = {
 static void vuv_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
-    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
-
-    if (!vdev->vm_running) {
-        should_start = false;
-    }
+    bool should_start = virtio_device_started(vdev, status);
 
     if (vvc->vhost_dev.started == should_start) {
         return;
diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 0338de892f..8031c164a5 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -70,13 +70,9 @@ static int vhost_vsock_set_running(VirtIODevice *vdev, int start)
 static void vhost_vsock_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
-    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
+    bool should_start = virtio_device_started(vdev, status);
     int ret;
 
-    if (!vdev->vm_running) {
-        should_start = false;
-    }
-
     if (vvc->vhost_dev.started == should_start) {
         return;
     }
-- 
MST


