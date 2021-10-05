Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D51422DCD
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:22:39 +0200 (CEST)
Received: from localhost ([::1]:60894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnDC-0004LP-IY
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmsw-0000F1-RA
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmsu-00058A-5B
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dLqgegjxL7pN0HDxyZfbuN/wY/nTKcbE0sqdZS/D2ns=;
 b=ERKiT1TEvy47vKg5GhTp4ipg4W6dys9KT/oius/4RHlDjL1vbiMqmWPTi/ovbmq1ACfGYb
 vMY9Y3rpgpvYmdNrv8y9RsGc2utgPQkbO4x/p8ZQp27UlMHnjQ/9iIjON6/wUr5kFM2EV9
 t9bxlMHMrsOpdnKlxWgM5Y5LeNClQoU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-TqYtCYOcOeqmAv1_KQhdlw-1; Tue, 05 Oct 2021 12:01:37 -0400
X-MC-Unique: TqYtCYOcOeqmAv1_KQhdlw-1
Received: by mail-wr1-f71.google.com with SMTP id
 d13-20020adf9b8d000000b00160a94c235aso2296109wrc.2
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:01:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dLqgegjxL7pN0HDxyZfbuN/wY/nTKcbE0sqdZS/D2ns=;
 b=4SxRwINC1uGy+FLKP6tsdEoZH9F0YfL4ysWsYWG4WvjZLDxTWYJeHea0GB/dBhQNvs
 wi2bPPSPRlcSQxuF17yYnHnsqyJ0h+5SzmA9NdrHAX2RAxkHiupk+xONFINvBEdDFYr8
 k+BjnMt2Az0R62fxyjqqSsJjSg13GBaqZJ70wo4La+SuxJNNcX1RekP3xXrLq+wmUg6G
 jwvx5UG2F1uOzzy/elyNf+6JcPW9vEHZ03EYU25JE85BL6JmTBfSQ37Q+hvtl4s1PZlt
 BXGrwfMnHkBWV/ft+aoajqB562ydarVnLWe+6VbQh3KIrgy6ub+66pVRvQMbiprZxq8y
 y/Hw==
X-Gm-Message-State: AOAM530aA2CeqmH/j23kVDGVcPsCCX3yL7AaBHncUMnkWBU2ZeafstcY
 x7PzGa1WZbhSwu4GwZu067ygSRQ1CTzV7G9uS6asOIBRIjMZ8McTqeLO7anJS1MuyVMNnvtQNw9
 m/6QLu2abwkG/HV0PglmK2dMceGS+LuOX7BaWtFpiILfL+kR+PFjOZYz6TsND
X-Received: by 2002:adf:a3da:: with SMTP id m26mr2806918wrb.336.1633449695611; 
 Tue, 05 Oct 2021 09:01:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyizjBrO0BBuFhhC9BZp7QlEj3t0qktPjfuXlzrIil1UjAc/GNsJdhrEN+24Hl3gheHiJQ4Fw==
X-Received: by 2002:adf:a3da:: with SMTP id m26mr2806885wrb.336.1633449695381; 
 Tue, 05 Oct 2021 09:01:35 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id m21sm2590940wmq.37.2021.10.05.09.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:01:34 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:01:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/57] vhost-vsock: handle common features in vhost-vsock-common
Message-ID: <20211005155946.513818-15-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
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
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.066, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefano Garzarella <sgarzare@redhat.com>

virtio-vsock features, like VIRTIO_VSOCK_F_SEQPACKET, can be handled
by vhost-vsock-common parent class. In this way, we can reuse the
same code for all virtio-vsock backends (i.e. vhost-vsock,
vhost-user-vsock).

Let's move `seqpacket` property to vhost-vsock-common class, add
vhost_vsock_common_get_features() used by children, and disable
`seqpacket` for vhost-user-vsock device for machine types < 6.2.

The behavior of vhost-vsock device doesn't change; vhost-user-vsock
device now supports `seqpacket` property.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20210921161642.206461-3-sgarzare@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-vsock-common.h |  5 +++++
 include/hw/virtio/vhost-vsock.h        |  3 ---
 hw/core/machine.c                      |  4 +++-
 hw/virtio/vhost-user-vsock.c           |  4 +++-
 hw/virtio/vhost-vsock-common.c         | 31 ++++++++++++++++++++++++++
 hw/virtio/vhost-vsock.c                | 24 +-------------------
 6 files changed, 43 insertions(+), 28 deletions(-)

diff --git a/include/hw/virtio/vhost-vsock-common.h b/include/hw/virtio/vhost-vsock-common.h
index e412b5ee98..d8b565b4da 100644
--- a/include/hw/virtio/vhost-vsock-common.h
+++ b/include/hw/virtio/vhost-vsock-common.h
@@ -35,6 +35,9 @@ struct VHostVSockCommon {
     VirtQueue *trans_vq;
 
     QEMUTimer *post_load_timer;
+
+    /* features */
+    OnOffAuto seqpacket;
 };
 
 int vhost_vsock_common_start(VirtIODevice *vdev);
@@ -43,5 +46,7 @@ int vhost_vsock_common_pre_save(void *opaque);
 int vhost_vsock_common_post_load(void *opaque, int version_id);
 void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name);
 void vhost_vsock_common_unrealize(VirtIODevice *vdev);
+uint64_t vhost_vsock_common_get_features(VirtIODevice *vdev, uint64_t features,
+                                         Error **errp);
 
 #endif /* _QEMU_VHOST_VSOCK_COMMON_H */
diff --git a/include/hw/virtio/vhost-vsock.h b/include/hw/virtio/vhost-vsock.h
index 3f121a624f..84f4e727c7 100644
--- a/include/hw/virtio/vhost-vsock.h
+++ b/include/hw/virtio/vhost-vsock.h
@@ -30,9 +30,6 @@ struct VHostVSock {
     VHostVSockCommon parent;
     VHostVSockConf conf;
 
-    /* features */
-    OnOffAuto seqpacket;
-
     /*< public >*/
 };
 
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 74f2a9a984..b8d95eec32 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -37,7 +37,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
-GlobalProperty hw_compat_6_1[] = {};
+GlobalProperty hw_compat_6_1[] = {
+    { "vhost-user-vsock-device", "seqpacket", "off" },
+};
 const size_t hw_compat_6_1_len = G_N_ELEMENTS(hw_compat_6_1);
 
 GlobalProperty hw_compat_6_0[] = {
diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
index 6095ed7349..52bd682c34 100644
--- a/hw/virtio/vhost-user-vsock.c
+++ b/hw/virtio/vhost-user-vsock.c
@@ -81,7 +81,9 @@ static uint64_t vuv_get_features(VirtIODevice *vdev,
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
 
-    return vhost_get_features(&vvc->vhost_dev, user_feature_bits, features);
+    features = vhost_get_features(&vvc->vhost_dev, user_feature_bits, features);
+
+    return vhost_vsock_common_get_features(vdev, features, errp);
 }
 
 static const VMStateDescription vuv_vmstate = {
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 4ad6e234ad..3f3771274e 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -18,6 +18,30 @@
 #include "qemu/iov.h"
 #include "monitor/monitor.h"
 
+const int feature_bits[] = {
+    VIRTIO_VSOCK_F_SEQPACKET,
+    VHOST_INVALID_FEATURE_BIT
+};
+
+uint64_t vhost_vsock_common_get_features(VirtIODevice *vdev, uint64_t features,
+                                         Error **errp)
+{
+    VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
+
+    if (vvc->seqpacket != ON_OFF_AUTO_OFF) {
+        virtio_add_feature(&features, VIRTIO_VSOCK_F_SEQPACKET);
+    }
+
+    features = vhost_get_features(&vvc->vhost_dev, feature_bits, features);
+
+    if (vvc->seqpacket == ON_OFF_AUTO_ON &&
+        !virtio_has_feature(features, VIRTIO_VSOCK_F_SEQPACKET)) {
+        error_setg(errp, "vhost-vsock backend doesn't support seqpacket");
+    }
+
+    return features;
+}
+
 int vhost_vsock_common_start(VirtIODevice *vdev)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
@@ -231,11 +255,18 @@ void vhost_vsock_common_unrealize(VirtIODevice *vdev)
     virtio_cleanup(vdev);
 }
 
+static Property vhost_vsock_common_properties[] = {
+    DEFINE_PROP_ON_OFF_AUTO("seqpacket", VHostVSockCommon, seqpacket,
+                            ON_OFF_AUTO_AUTO),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void vhost_vsock_common_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
 
+    device_class_set_props(dc, vhost_vsock_common_properties);
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     vdc->guest_notifier_mask = vhost_vsock_common_guest_notifier_mask;
     vdc->guest_notifier_pending = vhost_vsock_common_guest_notifier_pending;
diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index dade0da031..478c0c9a87 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -21,11 +21,6 @@
 #include "hw/virtio/vhost-vsock.h"
 #include "monitor/monitor.h"
 
-const int feature_bits[] = {
-    VIRTIO_VSOCK_F_SEQPACKET,
-    VHOST_INVALID_FEATURE_BIT
-};
-
 static void vhost_vsock_get_config(VirtIODevice *vdev, uint8_t *config)
 {
     VHostVSock *vsock = VHOST_VSOCK(vdev);
@@ -113,22 +108,7 @@ static uint64_t vhost_vsock_get_features(VirtIODevice *vdev,
                                          uint64_t requested_features,
                                          Error **errp)
 {
-    VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
-    VHostVSock *vsock = VHOST_VSOCK(vdev);
-
-    if (vsock->seqpacket != ON_OFF_AUTO_OFF) {
-        virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_SEQPACKET);
-    }
-
-    requested_features = vhost_get_features(&vvc->vhost_dev, feature_bits,
-                                            requested_features);
-
-    if (vsock->seqpacket == ON_OFF_AUTO_ON &&
-        !virtio_has_feature(requested_features, VIRTIO_VSOCK_F_SEQPACKET)) {
-        error_setg(errp, "vhost-vsock backend doesn't support seqpacket");
-    }
-
-    return requested_features;
+    return vhost_vsock_common_get_features(vdev, requested_features, errp);
 }
 
 static const VMStateDescription vmstate_virtio_vhost_vsock = {
@@ -229,8 +209,6 @@ static void vhost_vsock_device_unrealize(DeviceState *dev)
 static Property vhost_vsock_properties[] = {
     DEFINE_PROP_UINT64("guest-cid", VHostVSock, conf.guest_cid, 0),
     DEFINE_PROP_STRING("vhostfd", VHostVSock, conf.vhostfd),
-    DEFINE_PROP_ON_OFF_AUTO("seqpacket", VHostVSock, seqpacket,
-                            ON_OFF_AUTO_AUTO),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
MST


