Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBC14892B0
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 08:49:22 +0100 (CET)
Received: from localhost ([::1]:53540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6pQf-0003wr-CJ
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 02:49:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6ov2-0007h5-BU
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 02:16:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6ov0-0001ry-Ll
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 02:16:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641798998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6LWUvhDCM9AWtb+UqNtPLAd5SK+8CTL4ZgNvZbCKAms=;
 b=c57wDiw6dZy4rlZ9ikIuYT55kLoFid+snDzWJlaa0TjFSwy0obG5hUjHVZ8DLZKXmynZKa
 c4VuI3717w02T8cdNRyB3jTScqf3/3b8S5uLDIfuIlq6ZDDlApnL2tmX6D7xKM2ciHmSuq
 dny0KZcf0LbyDHUNUdmWr9n7eeoHYZU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-MkJAzlOUPiWg5qeAdjG8lg-1; Mon, 10 Jan 2022 02:16:36 -0500
X-MC-Unique: MkJAzlOUPiWg5qeAdjG8lg-1
Received: by mail-wr1-f72.google.com with SMTP id
 v18-20020a5d5912000000b001815910d2c0so3846618wrd.1
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 23:16:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6LWUvhDCM9AWtb+UqNtPLAd5SK+8CTL4ZgNvZbCKAms=;
 b=7xbMzHXJEDgaPRSJq39cyb7Yd92orVf8hwgRWgK39DHL4/7xtyhWorkF8FQt8gXSH6
 x+JzDc8rdIudhodqJCixL+dxJkr4tG9sGbXWQGwVmkdjN84omlx/HPMPwhW9KDusQlb0
 J2Zfv39RXBX1m6keA1gxiHnaLZ6B+DsHarbVezLCLyVLZAmeS5hME0/MvFEU1zKpJM8h
 8g7aiIUYOOYXlTq42t20WVB/b9aSy2Xyt9hQ/zac2Lw0r04ax0jdYKz8LfZRB4WNZcCe
 lb97JLwr8Afl+enk2+96Y6EcIaVae93DHWKW6HOxQIIp1NjMIbI0/xMa7y0cAjuvjD7T
 PQEg==
X-Gm-Message-State: AOAM533sYGgxtqwCPcd8pwRDmIjjZfHbMcZ7TscIgt4kH+LWIa/5quC0
 5pbOznoFKeobuShc0xAFNHOsIrONA65fudPntZ0pFAGzASBJwvPHFglAmuczwnVg48FzkuAVu6V
 5/Xvz9l6YkOZF7GQDtsKUgwylw7s1VJN5NuvM6bWxfeVs1Dhbhp9fR3r2IiAM
X-Received: by 2002:adf:f48a:: with SMTP id l10mr6112005wro.220.1641798994381; 
 Sun, 09 Jan 2022 23:16:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjxDv2Xla2jlW+6iq4s2LGPrB0z68yk1ukBbZlFHwPWVpalsYQKPm0NSxRdkBwaJgMpkDFQA==
X-Received: by 2002:adf:f48a:: with SMTP id l10mr6111985wro.220.1641798994141; 
 Sun, 09 Jan 2022 23:16:34 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107d:b60c:c297:16fe:7528:e989])
 by smtp.gmail.com with ESMTPSA id o12sm6379707wrc.69.2022.01.09.23.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 23:16:33 -0800 (PST)
Date: Mon, 10 Jan 2022 02:16:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/10] Revert "virtio: introduce macro IRTIO_CONFIG_IRQ_IDX"
Message-ID: <20220110071547.195669-11-mst@redhat.com>
References: <20220110071547.195669-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220110071547.195669-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit bf1d85c166c19af95dbd27b1faba1d2909732323.
---
 include/hw/virtio/virtio.h     |  3 ---
 hw/display/vhost-user-gpu.c    |  6 ------
 hw/net/virtio-net.c            | 10 ++--------
 hw/virtio/vhost-user-fs.c      |  6 ------
 hw/virtio/vhost-vsock-common.c |  6 ------
 hw/virtio/virtio-crypto.c      |  6 ------
 6 files changed, 2 insertions(+), 35 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 605ea79c90..8bab9cfb75 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -67,9 +67,6 @@ typedef struct VirtQueueElement
 
 #define VIRTIO_NO_VECTOR 0xffff
 
-/* special index value used internally for config irqs */
-#define VIRTIO_CONFIG_IRQ_IDX -1
-
 #define TYPE_VIRTIO_DEVICE "virtio-device"
 OBJECT_DECLARE_TYPE(VirtIODevice, VirtioDeviceClass, VIRTIO_DEVICE)
 
diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index d4a440e815..09818231bd 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -485,9 +485,6 @@ vhost_user_gpu_guest_notifier_pending(VirtIODevice *vdev, int idx)
 {
     VhostUserGPU *g = VHOST_USER_GPU(vdev);
 
-    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
-        return false;
-    }
     return vhost_virtqueue_pending(&g->vhost->dev, idx);
 }
 
@@ -496,9 +493,6 @@ vhost_user_gpu_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
 {
     VhostUserGPU *g = VHOST_USER_GPU(vdev);
 
-    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
-        return;
-    }
     vhost_virtqueue_mask(&g->vhost->dev, vdev, idx, mask);
 }
 
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 5e03c0dd14..cf8ab0f8af 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3168,9 +3168,6 @@ static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
     VirtIONet *n = VIRTIO_NET(vdev);
     NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
     assert(n->vhost_started);
-    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
-        return false;
-    }
     return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
 }
 
@@ -3180,11 +3177,8 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
     VirtIONet *n = VIRTIO_NET(vdev);
     NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
     assert(n->vhost_started);
-    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
-        return;
-    }
-
-    vhost_net_virtqueue_mask(get_vhost_net(nc->peer), vdev, idx, mask);
+    vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
+                             vdev, idx, mask);
 }
 
 static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_features)
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index 9b0349922e..c595957983 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -161,9 +161,6 @@ static void vuf_guest_notifier_mask(VirtIODevice *vdev, int idx,
 {
     VHostUserFS *fs = VHOST_USER_FS(vdev);
 
-    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
-        return;
-    }
     vhost_virtqueue_mask(&fs->vhost_dev, vdev, idx, mask);
 }
 
@@ -171,9 +168,6 @@ static bool vuf_guest_notifier_pending(VirtIODevice *vdev, int idx)
 {
     VHostUserFS *fs = VHOST_USER_FS(vdev);
 
-    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
-        return false;
-    }
     return vhost_virtqueue_pending(&fs->vhost_dev, idx);
 }
 
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index d1b9c027b6..3f3771274e 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -125,9 +125,6 @@ static void vhost_vsock_common_guest_notifier_mask(VirtIODevice *vdev, int idx,
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
 
-    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
-        return;
-    }
     vhost_virtqueue_mask(&vvc->vhost_dev, vdev, idx, mask);
 }
 
@@ -136,9 +133,6 @@ static bool vhost_vsock_common_guest_notifier_pending(VirtIODevice *vdev,
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
 
-    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
-        return false;
-    }
     return vhost_virtqueue_pending(&vvc->vhost_dev, idx);
 }
 
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 1d5192f8b4..54f9bbb789 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -948,9 +948,6 @@ static void virtio_crypto_guest_notifier_mask(VirtIODevice *vdev, int idx,
 
     assert(vcrypto->vhost_started);
 
-    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
-        return;
-    }
     cryptodev_vhost_virtqueue_mask(vdev, queue, idx, mask);
 }
 
@@ -961,9 +958,6 @@ static bool virtio_crypto_guest_notifier_pending(VirtIODevice *vdev, int idx)
 
     assert(vcrypto->vhost_started);
 
-    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
-        return false;
-    }
     return cryptodev_vhost_virtqueue_pending(vdev, queue, idx);
 }
 
-- 
MST


