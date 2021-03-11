Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6957933701D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:36:55 +0100 (CET)
Received: from localhost ([::1]:48342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKIgY-000887-Ft
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:36:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKIcw-0002Yt-00
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:33:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKIct-0005fp-O2
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:33:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615458787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hnxlQsHD1/OtTtkYAeS1gwTtMqtRpxPUf0HOhg5GQCA=;
 b=F8N7AgNyDO8cp90lD+EMhknu/Et9CC2ftkvTP+KguuQIH4CSToomzS8nxY8EQXs0IFeC3E
 OTZ4fDcVgiJQECc9yDdGsOOocZIKmjcI1LYhIX712oUSPBDSBnRrnLn2fkXjMh+QuGZJ6s
 X8jc9TK6M/JdfZ/waP1IGjeAzS/PIzY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-Rt323LmYPCSUFmj2DfVWhg-1; Thu, 11 Mar 2021 05:33:05 -0500
X-MC-Unique: Rt323LmYPCSUFmj2DfVWhg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6800419200C0
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 10:33:04 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0277029400;
 Thu, 11 Mar 2021 10:33:03 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] vhost-user: rename message names from "SLAVE" to "BACKEND"
Date: Thu, 11 Mar 2021 05:32:48 -0500
Message-Id: <20210311103250.532191-6-pbonzini@redhat.com>
In-Reply-To: <20210311103250.532191-1-pbonzini@redhat.com>
References: <20210311103250.532191-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, stefanha@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the terminology that is used in the specification.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/virtio/vhost-user.c | 96 +++++++++++++++++++++---------------------
 1 file changed, 48 insertions(+), 48 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 2fdd5daf74..dff420fce9 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -37,7 +37,7 @@
 
 #define VHOST_MEMORY_BASELINE_NREGIONS    8
 #define VHOST_USER_F_PROTOCOL_FEATURES 30
-#define VHOST_USER_SLAVE_MAX_FDS     8
+#define VHOST_USER_BACKEND_MAX_FDS     8
 
 /*
  * Set maximum number of RAM slots supported to
@@ -68,12 +68,12 @@ enum VhostUserProtocolFeature {
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
@@ -106,7 +106,7 @@ typedef enum VhostUserRequest {
     VHOST_USER_SET_VRING_ENABLE = 18,
     VHOST_USER_SEND_RARP = 19,
     VHOST_USER_NET_SET_MTU = 20,
-    VHOST_USER_SET_SLAVE_REQ_FD = 21,
+    VHOST_USER_SET_BACKEND_REQ_FD = 21,
     VHOST_USER_IOTLB_MSG = 22,
     VHOST_USER_SET_VRING_ENDIAN = 23,
     VHOST_USER_GET_CONFIG = 24,
@@ -128,11 +128,11 @@ typedef enum VhostUserRequest {
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
@@ -237,7 +237,7 @@ struct vhost_user {
     struct vhost_dev *dev;
     /* Shared between vhost devs of the same virtio device */
     VhostUserState *user;
-    int slave_fd;
+    int backend_fd;
     NotifierWithReturn postcopy_notifier;
     struct PostCopyFD  postcopy_fd;
     uint64_t           postcopy_client_bases[VHOST_USER_MAX_RAM_SLOTS];
@@ -1317,7 +1317,7 @@ static int vhost_user_reset_device(struct vhost_dev *dev)
     return 0;
 }
 
-static int vhost_user_slave_handle_config_change(struct vhost_dev *dev)
+static int vhost_user_backend_handle_config_change(struct vhost_dev *dev)
 {
     int ret = -1;
 
@@ -1332,9 +1332,9 @@ static int vhost_user_slave_handle_config_change(struct vhost_dev *dev)
     return ret;
 }
 
-static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
-                                                       VhostUserVringArea *area,
-                                                       int fd)
+static int vhost_user_backend_handle_vring_host_notifier(struct vhost_dev *dev,
+                                                         VhostUserVringArea *area,
+                                                         int fd)
 {
     int queue_idx = area->u64 & VHOST_USER_VRING_IDX_MASK;
     size_t page_size = qemu_real_host_page_size;
@@ -1392,7 +1392,7 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
     return 0;
 }
 
-static void slave_read(void *opaque)
+static void backend_read(void *opaque)
 {
     struct vhost_dev *dev = opaque;
     struct vhost_user *u = dev->opaque;
@@ -1401,7 +1401,7 @@ static void slave_read(void *opaque)
     int size, ret = 0;
     struct iovec iov;
     struct msghdr msgh;
-    int fd[VHOST_USER_SLAVE_MAX_FDS];
+    int fd[VHOST_USER_BACKEND_MAX_FDS];
     char control[CMSG_SPACE(sizeof(fd))];
     struct cmsghdr *cmsg;
     int i, fdsize = 0;
@@ -1419,11 +1419,11 @@ static void slave_read(void *opaque)
     iov.iov_len = VHOST_USER_HDR_SIZE;
 
     do {
-        size = recvmsg(u->slave_fd, &msgh, 0);
+        size = recvmsg(u->backend_fd, &msgh, 0);
     } while (size < 0 && (errno == EINTR || errno == EAGAIN));
 
     if (size != VHOST_USER_HDR_SIZE) {
-        error_report("Failed to read from slave.");
+        error_report("Failed to read from backend.");
         goto err;
     }
 
@@ -1451,24 +1451,24 @@ static void slave_read(void *opaque)
 
     /* Read payload */
     do {
-        size = read(u->slave_fd, &payload, hdr.size);
+        size = read(u->backend_fd, &payload, hdr.size);
     } while (size < 0 && (errno == EINTR || errno == EAGAIN));
 
     if (size != hdr.size) {
-        error_report("Failed to read payload from slave.");
+        error_report("Failed to read payload from backend.");
         goto err;
     }
 
     switch (hdr.request) {
-    case VHOST_USER_SLAVE_IOTLB_MSG:
+    case VHOST_USER_BACKEND_IOTLB_MSG:
         ret = vhost_backend_handle_iotlb_msg(dev, &payload.iotlb);
         break;
-    case VHOST_USER_SLAVE_CONFIG_CHANGE_MSG :
-        ret = vhost_user_slave_handle_config_change(dev);
+    case VHOST_USER_BACKEND_CONFIG_CHANGE_MSG :
+        ret = vhost_user_backend_handle_config_change(dev);
         break;
-    case VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG:
-        ret = vhost_user_slave_handle_vring_host_notifier(dev, &payload.area,
-                                                          fd[0]);
+    case VHOST_USER_BACKEND_VRING_HOST_NOTIFIER_MSG:
+        ret = vhost_user_backend_handle_vring_host_notifier(dev, &payload.area,
+                                                            fd[0]);
         break;
     default:
         error_report("Received unexpected msg type: %d.", hdr.request);
@@ -1502,11 +1502,11 @@ static void slave_read(void *opaque)
         iovec[1].iov_len = hdr.size;
 
         do {
-            size = writev(u->slave_fd, iovec, ARRAY_SIZE(iovec));
+            size = writev(u->backend_fd, iovec, ARRAY_SIZE(iovec));
         } while (size < 0 && (errno == EINTR || errno == EAGAIN));
 
         if (size != VHOST_USER_HDR_SIZE + hdr.size) {
-            error_report("Failed to send msg reply to slave.");
+            error_report("Failed to send msg reply to backend.");
             goto err;
         }
     }
@@ -1514,9 +1514,9 @@ static void slave_read(void *opaque)
     return;
 
 err:
-    qemu_set_fd_handler(u->slave_fd, NULL, NULL, NULL);
-    close(u->slave_fd);
-    u->slave_fd = -1;
+    qemu_set_fd_handler(u->backend_fd, NULL, NULL, NULL);
+    close(u->backend_fd);
+    u->backend_fd = -1;
     for (i = 0; i < fdsize; i++) {
         if (fd[i] != -1) {
             close(fd[i]);
@@ -1525,10 +1525,10 @@ err:
     return;
 }
 
-static int vhost_setup_slave_channel(struct vhost_dev *dev)
+static int vhost_setup_backend_channel(struct vhost_dev *dev)
 {
     VhostUserMsg msg = {
-        .hdr.request = VHOST_USER_SET_SLAVE_REQ_FD,
+        .hdr.request = VHOST_USER_SET_BACKEND_REQ_FD,
         .hdr.flags = VHOST_USER_VERSION,
     };
     struct vhost_user *u = dev->opaque;
@@ -1537,7 +1537,7 @@ static int vhost_setup_slave_channel(struct vhost_dev *dev)
                                               VHOST_USER_PROTOCOL_F_REPLY_ACK);
 
     if (!virtio_has_feature(dev->protocol_features,
-                            VHOST_USER_PROTOCOL_F_SLAVE_REQ)) {
+                            VHOST_USER_PROTOCOL_F_BACKEND_REQ)) {
         return 0;
     }
 
@@ -1546,8 +1546,8 @@ static int vhost_setup_slave_channel(struct vhost_dev *dev)
         return -1;
     }
 
-    u->slave_fd = sv[0];
-    qemu_set_fd_handler(u->slave_fd, slave_read, NULL, dev);
+    u->backend_fd = sv[0];
+    qemu_set_fd_handler(u->backend_fd, backend_read, NULL, dev);
 
     if (reply_supported) {
         msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
@@ -1565,9 +1565,9 @@ static int vhost_setup_slave_channel(struct vhost_dev *dev)
 out:
     close(sv[1]);
     if (ret) {
-        qemu_set_fd_handler(u->slave_fd, NULL, NULL, NULL);
-        close(u->slave_fd);
-        u->slave_fd = -1;
+        qemu_set_fd_handler(u->backend_fd, NULL, NULL, NULL);
+        close(u->backend_fd);
+        u->backend_fd = -1;
     }
 
     return ret;
@@ -1804,7 +1804,7 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque)
 
     u = g_new0(struct vhost_user, 1);
     u->user = opaque;
-    u->slave_fd = -1;
+    u->backend_fd = -1;
     u->dev = dev;
     dev->opaque = u;
 
@@ -1851,11 +1851,11 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque)
 
         if (virtio_has_feature(features, VIRTIO_F_IOMMU_PLATFORM) &&
                 !(virtio_has_feature(dev->protocol_features,
-                    VHOST_USER_PROTOCOL_F_SLAVE_REQ) &&
+                    VHOST_USER_PROTOCOL_F_BACKEND_REQ) &&
                  virtio_has_feature(dev->protocol_features,
                     VHOST_USER_PROTOCOL_F_REPLY_ACK))) {
             error_report("IOMMU support requires reply-ack and "
-                         "slave-req protocol features.");
+                         "backend-req protocol features.");
             return -1;
         }
 
@@ -1890,7 +1890,7 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque)
     }
 
     if (dev->vq_index == 0) {
-        err = vhost_setup_slave_channel(dev);
+        err = vhost_setup_backend_channel(dev);
         if (err < 0) {
             return err;
         }
@@ -1919,10 +1919,10 @@ static int vhost_user_backend_cleanup(struct vhost_dev *dev)
         close(u->postcopy_fd.fd);
         u->postcopy_fd.handler = NULL;
     }
-    if (u->slave_fd >= 0) {
-        qemu_set_fd_handler(u->slave_fd, NULL, NULL, NULL);
-        close(u->slave_fd);
-        u->slave_fd = -1;
+    if (u->backend_fd >= 0) {
+        qemu_set_fd_handler(u->backend_fd, NULL, NULL, NULL);
+        close(u->backend_fd);
+        u->backend_fd = -1;
     }
     g_free(u->region_rb);
     u->region_rb = NULL;
@@ -2016,7 +2016,7 @@ static int vhost_user_net_set_mtu(struct vhost_dev *dev, uint16_t mtu)
         return -1;
     }
 
-    /* If reply_ack supported, slave has to ack specified MTU is valid */
+    /* If reply_ack supported, backend has to ack specified MTU is valid */
     if (reply_supported) {
         return process_message_reply(dev, &msg);
     }
-- 
2.26.2



