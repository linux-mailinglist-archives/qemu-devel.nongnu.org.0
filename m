Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF60D68F8E0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 21:34:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPr84-00087V-VA; Wed, 08 Feb 2023 15:33:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1pPr81-00086r-J3
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:33:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1pPr7z-0005Sq-NC
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:33:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675888394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nr+c7MkAniquoRj2f/MqkfS4BJkaPNHnzsdi0NVbng0=;
 b=hnJfwu4AUXYE9E2NiZHz3ODtT8EsEstYjdAh70Jcveop2C977tgVJO0WDSxxy48AniB7lN
 ULqrXBucvnWPZDi+ZTWe5nH3MVlD0e1TH2FCEuqSRtQQWBOryQ7wGSRtW0E4zqX74TdhIg
 Sv3iLbknFjr8oumzBtP6CVwWRWUy6TY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-YkwfwEREMESPEpeAPi3W5Q-1; Wed, 08 Feb 2023 15:33:10 -0500
X-MC-Unique: YkwfwEREMESPEpeAPi3W5Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3CC2286C14C;
 Wed,  8 Feb 2023 20:33:10 +0000 (UTC)
Received: from max-t490s.redhat.com (unknown [10.39.208.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90C701121314;
 Wed,  8 Feb 2023 20:33:08 +0000 (UTC)
From: Maxime Coquelin <maxime.coquelin@redhat.com>
To: qemu-devel@nongnu.org, mst@redhat.com, pbonzini@redhat.com,
 stephen@networkplumber.org, chenbo.xia@intel.com, thomas@monjalon.net,
 dmarchan@redhat.com
Cc: Maxime Coquelin <maxime.coquelin@redhat.com>
Subject: [PATCH v2 3/3] vhost-user: Adopt new backend naming
Date: Wed,  8 Feb 2023 21:32:59 +0100
Message-Id: <20230208203259.381326-4-maxime.coquelin@redhat.com>
In-Reply-To: <20230208203259.381326-1-maxime.coquelin@redhat.com>
References: <20230208203259.381326-1-maxime.coquelin@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=maxime.coquelin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

The Vhost-user specification changed feature and request
naming from _SLAVE_ to _BACKEND_.

This patch adopts the new naming convention.

Signed-off-by: Maxime Coquelin <maxime.coquelin@redhat.com>
---
 hw/virtio/vhost-user.c | 30 +++++++++++++++---------------
 hw/virtio/virtio-qmp.c | 12 ++++++------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index e68daa35d4..8968541514 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -40,7 +40,7 @@
 
 #define VHOST_MEMORY_BASELINE_NREGIONS    8
 #define VHOST_USER_F_PROTOCOL_FEATURES 30
-#define VHOST_USER_SLAVE_MAX_FDS     8
+#define VHOST_USER_BACKEND_MAX_FDS     8
 
 /*
  * Set maximum number of RAM slots supported to
@@ -71,12 +71,12 @@ enum VhostUserProtocolFeature {
     VHOST_USER_PROTOCOL_F_RARP = 2,
     VHOST_USER_PROTOCOL_F_REPLY_ACK = 3,
     VHOST_USER_PROTOCOL_F_NET_MTU = 4,
-    VHOST_USER_PROTOCOL_F_SLAVE_REQ = 5,
+    VHOST_USER_PROTOCOL_F_BACKEND_REQ = 5,
     VHOST_USER_PROTOCOL_F_CROSS_ENDIAN = 6,
     VHOST_USER_PROTOCOL_F_CRYPTO_SESSION = 7,
     VHOST_USER_PROTOCOL_F_PAGEFAULT = 8,
     VHOST_USER_PROTOCOL_F_CONFIG = 9,
-    VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD = 10,
+    VHOST_USER_PROTOCOL_F_BACKEND_SEND_FD = 10,
     VHOST_USER_PROTOCOL_F_HOST_NOTIFIER = 11,
     VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD = 12,
     VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
@@ -110,7 +110,7 @@ typedef enum VhostUserRequest {
     VHOST_USER_SET_VRING_ENABLE = 18,
     VHOST_USER_SEND_RARP = 19,
     VHOST_USER_NET_SET_MTU = 20,
-    VHOST_USER_SET_SLAVE_REQ_FD = 21,
+    VHOST_USER_SET_BACKEND_REQ_FD = 21,
     VHOST_USER_IOTLB_MSG = 22,
     VHOST_USER_SET_VRING_ENDIAN = 23,
     VHOST_USER_GET_CONFIG = 24,
@@ -134,11 +134,11 @@ typedef enum VhostUserRequest {
 } VhostUserRequest;
 
 typedef enum VhostUserSlaveRequest {
-    VHOST_USER_SLAVE_NONE = 0,
-    VHOST_USER_SLAVE_IOTLB_MSG = 1,
-    VHOST_USER_SLAVE_CONFIG_CHANGE_MSG = 2,
-    VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG = 3,
-    VHOST_USER_SLAVE_MAX
+    VHOST_USER_BACKEND_NONE = 0,
+    VHOST_USER_BACKEND_IOTLB_MSG = 1,
+    VHOST_USER_BACKEND_CONFIG_CHANGE_MSG = 2,
+    VHOST_USER_BACKEND_VRING_HOST_NOTIFIER_MSG = 3,
+    VHOST_USER_BACKEND_MAX
 }  VhostUserSlaveRequest;
 
 typedef struct VhostUserMemoryRegion {
@@ -1638,13 +1638,13 @@ static gboolean slave_read(QIOChannel *ioc, GIOCondition condition,
     }
 
     switch (hdr.request) {
-    case VHOST_USER_SLAVE_IOTLB_MSG:
+    case VHOST_USER_BACKEND_IOTLB_MSG:
         ret = vhost_backend_handle_iotlb_msg(dev, &payload.iotlb);
         break;
-    case VHOST_USER_SLAVE_CONFIG_CHANGE_MSG :
+    case VHOST_USER_BACKEND_CONFIG_CHANGE_MSG:
         ret = vhost_user_slave_handle_config_change(dev);
         break;
-    case VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG:
+    case VHOST_USER_BACKEND_VRING_HOST_NOTIFIER_MSG:
         ret = vhost_user_slave_handle_vring_host_notifier(dev, &payload.area,
                                                           fd ? fd[0] : -1);
         break;
@@ -1696,7 +1696,7 @@ fdcleanup:
 static int vhost_setup_slave_channel(struct vhost_dev *dev)
 {
     VhostUserMsg msg = {
-        .hdr.request = VHOST_USER_SET_SLAVE_REQ_FD,
+        .hdr.request = VHOST_USER_SET_BACKEND_REQ_FD,
         .hdr.flags = VHOST_USER_VERSION,
     };
     struct vhost_user *u = dev->opaque;
@@ -1707,7 +1707,7 @@ static int vhost_setup_slave_channel(struct vhost_dev *dev)
     QIOChannel *ioc;
 
     if (!virtio_has_feature(dev->protocol_features,
-                            VHOST_USER_PROTOCOL_F_SLAVE_REQ)) {
+                            VHOST_USER_PROTOCOL_F_BACKEND_REQ)) {
         return 0;
     }
 
@@ -2065,7 +2065,7 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
 
         if (virtio_has_feature(features, VIRTIO_F_IOMMU_PLATFORM) &&
                 !(virtio_has_feature(dev->protocol_features,
-                    VHOST_USER_PROTOCOL_F_SLAVE_REQ) &&
+                    VHOST_USER_PROTOCOL_F_BACKEND_REQ) &&
                  virtio_has_feature(dev->protocol_features,
                     VHOST_USER_PROTOCOL_F_REPLY_ACK))) {
             error_setg(errp, "IOMMU support requires reply-ack and "
diff --git a/hw/virtio/virtio-qmp.c b/hw/virtio/virtio-qmp.c
index e4d4bece2d..b70148aba9 100644
--- a/hw/virtio/virtio-qmp.c
+++ b/hw/virtio/virtio-qmp.c
@@ -42,12 +42,12 @@ enum VhostUserProtocolFeature {
     VHOST_USER_PROTOCOL_F_RARP = 2,
     VHOST_USER_PROTOCOL_F_REPLY_ACK = 3,
     VHOST_USER_PROTOCOL_F_NET_MTU = 4,
-    VHOST_USER_PROTOCOL_F_SLAVE_REQ = 5,
+    VHOST_USER_PROTOCOL_F_BACKEND_REQ = 5,
     VHOST_USER_PROTOCOL_F_CROSS_ENDIAN = 6,
     VHOST_USER_PROTOCOL_F_CRYPTO_SESSION = 7,
     VHOST_USER_PROTOCOL_F_PAGEFAULT = 8,
     VHOST_USER_PROTOCOL_F_CONFIG = 9,
-    VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD = 10,
+    VHOST_USER_PROTOCOL_F_BACKEND_SEND_FD = 10,
     VHOST_USER_PROTOCOL_F_HOST_NOTIFIER = 11,
     VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD = 12,
     VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
@@ -101,8 +101,8 @@ static const qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
             "supported"),
     FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_NET_MTU, \
             "VHOST_USER_PROTOCOL_F_NET_MTU: Expose host MTU to guest supported"),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_SLAVE_REQ, \
-            "VHOST_USER_PROTOCOL_F_SLAVE_REQ: Socket fd for back-end initiated "
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_BACKEND_REQ, \
+            "VHOST_USER_PROTOCOL_F_BACKEND_REQ: Socket fd for back-end initiated "
             "requests supported"),
     FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CROSS_ENDIAN, \
             "VHOST_USER_PROTOCOL_F_CROSS_ENDIAN: Endianness of VQs for legacy "
@@ -116,8 +116,8 @@ static const qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
     FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CONFIG, \
             "VHOST_USER_PROTOCOL_F_CONFIG: Vhost-user messaging for virtio "
             "device configuration space supported"),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD, \
-            "VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD: Slave fd communication "
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_BACKEND_SEND_FD, \
+            "VHOST_USER_PROTOCOL_F_BACKEND_SEND_FD: Slave fd communication "
             "channel supported"),
     FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_HOST_NOTIFIER, \
             "VHOST_USER_PROTOCOL_F_HOST_NOTIFIER: Host notifiers for specified "
-- 
2.39.1


