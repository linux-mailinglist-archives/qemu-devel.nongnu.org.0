Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C5D33701E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:37:19 +0100 (CET)
Received: from localhost ([::1]:50688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKIgw-0000jC-J9
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:37:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKIcw-0002a2-Im
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:33:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKIcu-0005gV-Kn
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:33:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615458787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ee/ei1R0l+B+WJ02Vfu6Jfsbjt7pu4p5m+kBDVjIUsI=;
 b=TGAm0DGU2xbXzuFRjRNLzka3ig2s8B1Lx0j7qLIaj2g5O3p0z0z0H3KdHhfs0JWjQEUw5C
 BHZsvhmDmkaGStkdaY31dDRlrJPaFtwQR1XEb9CKCsA9pDEVcdFhJBRn9ZazZ5z8c26U16
 iregThmLfxhtBR428bkEroATQWjMcvU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-k5_VQ9dKPyaJQiSwo0ekUA-1; Thu, 11 Mar 2021 05:33:05 -0500
X-MC-Unique: k5_VQ9dKPyaJQiSwo0ekUA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7A1E10866A5
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 10:33:04 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81E951B5AD;
 Thu, 11 Mar 2021 10:33:04 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] libvhost-user: rename message names from "SLAVE" to
 "BACKEND"
Date: Thu, 11 Mar 2021 05:32:49 -0500
Message-Id: <20210311103250.532191-7-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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

Follow the terminology that is used in the specification.  The old names
are preserved for API compatibility.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 20 ++++++------
 subprojects/libvhost-user/libvhost-user.h | 39 ++++++++++++++++-------
 2 files changed, 37 insertions(+), 22 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index fab7ca17ee..b7aef17e4e 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -125,7 +125,7 @@ vu_request_to_string(unsigned int req)
         REQ(VHOST_USER_SET_VRING_ENABLE),
         REQ(VHOST_USER_SEND_RARP),
         REQ(VHOST_USER_NET_SET_MTU),
-        REQ(VHOST_USER_SET_SLAVE_REQ_FD),
+        REQ(VHOST_USER_SET_BACKEND_REQ_FD),
         REQ(VHOST_USER_IOTLB_MSG),
         REQ(VHOST_USER_SET_VRING_ENDIAN),
         REQ(VHOST_USER_GET_CONFIG),
@@ -1313,7 +1313,7 @@ bool vu_set_queue_host_notifier(VuDev *dev, VuVirtq *vq, int fd,
     int qidx = vq - dev->vq;
     int fd_num = 0;
     VhostUserMsg vmsg = {
-        .request = VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG,
+        .request = VHOST_USER_BACKEND_VRING_HOST_NOTIFIER_MSG,
         .flags = VHOST_USER_VERSION | VHOST_USER_NEED_REPLY_MASK,
         .size = sizeof(vmsg.payload.area),
         .payload.area = {
@@ -1331,7 +1331,7 @@ bool vu_set_queue_host_notifier(VuDev *dev, VuVirtq *vq, int fd,
 
     vmsg.fd_num = fd_num;
 
-    if (!vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD)) {
+    if (!vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_BACKEND_SEND_FD)) {
         return false;
     }
 
@@ -1409,9 +1409,9 @@ vu_get_protocol_features_exec(VuDev *dev, VhostUserMsg *vmsg)
      */
     uint64_t features = 1ULL << VHOST_USER_PROTOCOL_F_MQ |
                         1ULL << VHOST_USER_PROTOCOL_F_LOG_SHMFD |
-                        1ULL << VHOST_USER_PROTOCOL_F_SLAVE_REQ |
+                        1ULL << VHOST_USER_PROTOCOL_F_BACKEND_REQ |
                         1ULL << VHOST_USER_PROTOCOL_F_HOST_NOTIFIER |
-                        1ULL << VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD |
+                        1ULL << VHOST_USER_PROTOCOL_F_BACKEND_SEND_FD |
                         1ULL << VHOST_USER_PROTOCOL_F_REPLY_ACK |
                         1ULL << VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS;
 
@@ -1442,7 +1442,7 @@ vu_set_protocol_features_exec(VuDev *dev, VhostUserMsg *vmsg)
 
     if (vu_has_protocol_feature(dev,
                                 VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS) &&
-        (!vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_SLAVE_REQ) ||
+        (!vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_BACKEND_REQ) ||
          !vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_REPLY_ACK))) {
         /*
          * The use case for using messages for kick/call is simulation, to make
@@ -1455,7 +1455,7 @@ vu_set_protocol_features_exec(VuDev *dev, VhostUserMsg *vmsg)
          * that actually enables the simulation case.
          */
         vu_panic(dev,
-                 "F_IN_BAND_NOTIFICATIONS requires F_SLAVE_REQ && F_REPLY_ACK");
+                 "F_IN_BAND_NOTIFICATIONS requires F_BACKEND_REQ && F_REPLY_ACK");
         return false;
     }
 
@@ -1864,7 +1864,7 @@ vu_process_message(VuDev *dev, VhostUserMsg *vmsg)
         return vu_get_queue_num_exec(dev, vmsg);
     case VHOST_USER_SET_VRING_ENABLE:
         return vu_set_vring_enable_exec(dev, vmsg);
-    case VHOST_USER_SET_SLAVE_REQ_FD:
+    case VHOST_USER_SET_BACKEND_REQ_FD:
         return vu_set_slave_req_fd(dev, vmsg);
     case VHOST_USER_GET_CONFIG:
         return vu_get_config(dev, vmsg);
@@ -2370,9 +2370,9 @@ static void _vu_queue_notify(VuDev *dev, VuVirtq *vq, bool sync)
     if (vq->call_fd < 0 &&
         vu_has_protocol_feature(dev,
                                 VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS) &&
-        vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_SLAVE_REQ)) {
+        vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_BACKEND_REQ)) {
         VhostUserMsg vmsg = {
-            .request = VHOST_USER_SLAVE_VRING_CALL,
+            .request = VHOST_USER_BACKEND_VRING_CALL,
             .flags = VHOST_USER_VERSION,
             .size = sizeof(vmsg.payload.state),
             .payload.state = {
diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
index 3d13dfadde..eba3e1fc05 100644
--- a/subprojects/libvhost-user/libvhost-user.h
+++ b/subprojects/libvhost-user/libvhost-user.h
@@ -54,18 +54,20 @@ enum VhostUserProtocolFeature {
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
     VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS = 14,
     VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS = 15,
+    VHOST_USER_PROTOCOL_F_MAX,
 
-    VHOST_USER_PROTOCOL_F_MAX
+    VHOST_USER_PROTOCOL_F_SLAVE_REQ = VHOST_USER_PROTOCOL_F_BACKEND_REQ,
+    VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD = VHOST_USER_PROTOCOL_F_BACKEND_SEND_FD
 };
 
 #define VHOST_USER_PROTOCOL_FEATURE_MASK ((1 << VHOST_USER_PROTOCOL_F_MAX) - 1)
@@ -92,7 +94,7 @@ typedef enum VhostUserRequest {
     VHOST_USER_SET_VRING_ENABLE = 18,
     VHOST_USER_SEND_RARP = 19,
     VHOST_USER_NET_SET_MTU = 20,
-    VHOST_USER_SET_SLAVE_REQ_FD = 21,
+    VHOST_USER_SET_BACKEND_REQ_FD = 21,
     VHOST_USER_IOTLB_MSG = 22,
     VHOST_USER_SET_VRING_ENDIAN = 23,
     VHOST_USER_GET_CONFIG = 24,
@@ -109,16 +111,29 @@ typedef enum VhostUserRequest {
     VHOST_USER_GET_MAX_MEM_SLOTS = 36,
     VHOST_USER_ADD_MEM_REG = 37,
     VHOST_USER_REM_MEM_REG = 38,
-    VHOST_USER_MAX
+    VHOST_USER_MAX,
+
+    VHOST_USER_SET_SLAVE_REQ_FD = VHOST_USER_SET_BACKEND_REQ_FD,
 } VhostUserRequest;
 
+typedef enum VhostUserBackendRequest {
+    VHOST_USER_BACKEND_NONE = 0,
+    VHOST_USER_BACKEND_IOTLB_MSG = 1,
+    VHOST_USER_BACKEND_CONFIG_CHANGE_MSG = 2,
+    VHOST_USER_BACKEND_VRING_HOST_NOTIFIER_MSG = 3,
+    VHOST_USER_BACKEND_VRING_CALL = 4,
+    VHOST_USER_BACKEND_VRING_ERR = 5,
+    VHOST_USER_BACKEND_MAX
+}  VhostUserBackendRequest;
+
+
 typedef enum VhostUserSlaveRequest {
-    VHOST_USER_SLAVE_NONE = 0,
-    VHOST_USER_SLAVE_IOTLB_MSG = 1,
-    VHOST_USER_SLAVE_CONFIG_CHANGE_MSG = 2,
-    VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG = 3,
-    VHOST_USER_SLAVE_VRING_CALL = 4,
-    VHOST_USER_SLAVE_VRING_ERR = 5,
+    VHOST_USER_SLAVE_NONE = VHOST_USER_BACKEND_NONE,
+    VHOST_USER_SLAVE_IOTLB_MSG = VHOST_USER_BACKEND_IOTLB_MSG,
+    VHOST_USER_SLAVE_CONFIG_CHANGE_MSG = VHOST_USER_BACKEND_CONFIG_CHANGE_MSG,
+    VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG = VHOST_USER_BACKEND_VRING_HOST_NOTIFIER_MSG,
+    VHOST_USER_SLAVE_VRING_CALL = VHOST_USER_BACKEND_VRING_CALL,
+    VHOST_USER_SLAVE_VRING_ERR = VHOST_USER_BACKEND_VRING_ERR,
     VHOST_USER_SLAVE_MAX
 }  VhostUserSlaveRequest;
 
@@ -295,7 +310,7 @@ typedef struct VuVirtqInflight {
     uint16_t version;
 
     /* The size of VuDescStateSplit array. It's equal to the virtqueue
-     * size. Slave could get it from queue size field of VhostUserInflight. */
+     * size. The backend could get it from queue size field of VhostUserInflight. */
     uint16_t desc_num;
 
     /* The head of list that track the last batch of used descriptors. */
-- 
2.26.2



