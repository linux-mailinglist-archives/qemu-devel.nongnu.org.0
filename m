Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC286A7CC3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:34:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeFs-0002x2-45; Thu, 02 Mar 2023 03:25:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFn-0002ez-Oi
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFl-0002Hm-RE
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fXxj5h0qQ8uhuKbUYFn8UPh6HW6hOOdETJzf90gxJPU=;
 b=B0QXzsp/H+AORS4UfDtdmLTdW5RL5+RXFiu3Z4hgspSaIWXu3hG2I0r4bH5LV8HNZ6qBZc
 zXGZRd6JEdtDhTEtUwmpjIAk9hpO9Pqay5AM98Wc4jsabyXD9yL8MeBGRGg3Z1CMKyGwWX
 1Pt+GyKKWze4ciY98JyLzxp+hGbjF3Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-FSCz492VMtWoV4hUn7VWLQ-1; Thu, 02 Mar 2023 03:25:28 -0500
X-MC-Unique: FSCz492VMtWoV4hUn7VWLQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 s18-20020a7bc392000000b003deaf780ab6so745460wmj.4
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:25:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745526;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fXxj5h0qQ8uhuKbUYFn8UPh6HW6hOOdETJzf90gxJPU=;
 b=ATH/antQYQocZPcKsffVGC5iIQekOSdSS8axEDfjtOss+sMkHJYwdZ0qJOiEFtHd27
 BQRcdHK5yqZ17+LagdF9V9KSEkqCe4qfZpF6HgER70eJnCfbEsC/sazmicJiLoE0Oil8
 i0vbjXvNl8oJm1MRuG4Cjy6mqbdiel3S0Yo5T/GiyXT3qI/B2m2wtkmCPpmq/X8tLJD8
 r2E8Nnm3kcnyHMsg8dOiF/KyequrthZwgoTum/IUp7qEK2xu23MfsZtwGXTctv8QN0gN
 iZ6eax0hzBUwQ/gWXNjUv8IArodF6aFFeI3fINh/36Q+Neioi8vrI4Mcy5E6OzEo+WJI
 /wfw==
X-Gm-Message-State: AO0yUKW8azT5KiIWRCd1CoCODCDNIPBkehIXM7Bnnmax7GXG0Jvd1pJj
 QT0DjJFRxhFsXm1RtkldhOESWkK9UjjS5u1ZY7LmSJ5bV5jw71UHvMjgivcoD6k1yLWB3W0MDNk
 BTzZEtw1cBIlvz7/STc/SEdB/4SDq4Hb8TmIu67/SI/pajxKau7D/8LXulMvisiDFZQ==
X-Received: by 2002:a05:600c:1554:b0:3eb:38b0:e757 with SMTP id
 f20-20020a05600c155400b003eb38b0e757mr808080wmg.10.1677745526548; 
 Thu, 02 Mar 2023 00:25:26 -0800 (PST)
X-Google-Smtp-Source: AK7set8VdPLsZ+irPfrO8AhSnABQ0eilgA+gjXMwoVslHMUEO5pexyK1GvrRapR0swiZZZ4YVuqokg==
X-Received: by 2002:a05:600c:1554:b0:3eb:38b0:e757 with SMTP id
 f20-20020a05600c155400b003eb38b0e757mr808069wmg.10.1677745526310; 
 Thu, 02 Mar 2023 00:25:26 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 d16-20020adff850000000b002c55306f6edsm14480963wrq.54.2023.03.02.00.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:25:25 -0800 (PST)
Date: Thu, 2 Mar 2023 03:25:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Maxime Coquelin <maxime.coquelin@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 17/53] libvhost-user: Adopt new backend naming
Message-ID: <20230302082343.560446-18-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Maxime Coquelin <maxime.coquelin@redhat.com>

The Vhost-user specification changed feature and request
naming from _SLAVE_ to _BACKEND_.

This patch adopts the new naming convention.

Signed-off-by: Maxime Coquelin <maxime.coquelin@redhat.com>
Message-Id: <20230208203259.381326-3-maxime.coquelin@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.h | 20 ++++++++++----------
 subprojects/libvhost-user/libvhost-user.c | 20 ++++++++++----------
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
index 8cda9b8f57..8c5a2719e3 100644
--- a/subprojects/libvhost-user/libvhost-user.h
+++ b/subprojects/libvhost-user/libvhost-user.h
@@ -54,12 +54,12 @@ enum VhostUserProtocolFeature {
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
@@ -92,7 +92,7 @@ typedef enum VhostUserRequest {
     VHOST_USER_SET_VRING_ENABLE = 18,
     VHOST_USER_SEND_RARP = 19,
     VHOST_USER_NET_SET_MTU = 20,
-    VHOST_USER_SET_SLAVE_REQ_FD = 21,
+    VHOST_USER_SET_BACKEND_REQ_FD = 21,
     VHOST_USER_IOTLB_MSG = 22,
     VHOST_USER_SET_VRING_ENDIAN = 23,
     VHOST_USER_GET_CONFIG = 24,
@@ -113,13 +113,13 @@ typedef enum VhostUserRequest {
 } VhostUserRequest;
 
 typedef enum VhostUserSlaveRequest {
-    VHOST_USER_SLAVE_NONE = 0,
-    VHOST_USER_SLAVE_IOTLB_MSG = 1,
-    VHOST_USER_SLAVE_CONFIG_CHANGE_MSG = 2,
-    VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG = 3,
-    VHOST_USER_SLAVE_VRING_CALL = 4,
-    VHOST_USER_SLAVE_VRING_ERR = 5,
-    VHOST_USER_SLAVE_MAX
+    VHOST_USER_BACKEND_NONE = 0,
+    VHOST_USER_BACKEND_IOTLB_MSG = 1,
+    VHOST_USER_BACKEND_CONFIG_CHANGE_MSG = 2,
+    VHOST_USER_BACKEND_VRING_HOST_NOTIFIER_MSG = 3,
+    VHOST_USER_BACKEND_VRING_CALL = 4,
+    VHOST_USER_BACKEND_VRING_ERR = 5,
+    VHOST_USER_BACKEND_MAX
 }  VhostUserSlaveRequest;
 
 typedef struct VhostUserMemoryRegion {
diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index fc69783d2b..f661af7c85 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -140,7 +140,7 @@ vu_request_to_string(unsigned int req)
         REQ(VHOST_USER_SET_VRING_ENABLE),
         REQ(VHOST_USER_SEND_RARP),
         REQ(VHOST_USER_NET_SET_MTU),
-        REQ(VHOST_USER_SET_SLAVE_REQ_FD),
+        REQ(VHOST_USER_SET_BACKEND_REQ_FD),
         REQ(VHOST_USER_IOTLB_MSG),
         REQ(VHOST_USER_SET_VRING_ENDIAN),
         REQ(VHOST_USER_GET_CONFIG),
@@ -1365,7 +1365,7 @@ bool vu_set_queue_host_notifier(VuDev *dev, VuVirtq *vq, int fd,
     int qidx = vq - dev->vq;
     int fd_num = 0;
     VhostUserMsg vmsg = {
-        .request = VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG,
+        .request = VHOST_USER_BACKEND_VRING_HOST_NOTIFIER_MSG,
         .flags = VHOST_USER_VERSION | VHOST_USER_NEED_REPLY_MASK,
         .size = sizeof(vmsg.payload.area),
         .payload.area = {
@@ -1383,7 +1383,7 @@ bool vu_set_queue_host_notifier(VuDev *dev, VuVirtq *vq, int fd,
 
     vmsg.fd_num = fd_num;
 
-    if (!vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD)) {
+    if (!vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_BACKEND_SEND_FD)) {
         return false;
     }
 
@@ -1461,9 +1461,9 @@ vu_get_protocol_features_exec(VuDev *dev, VhostUserMsg *vmsg)
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
 
@@ -1494,7 +1494,7 @@ vu_set_protocol_features_exec(VuDev *dev, VhostUserMsg *vmsg)
 
     if (vu_has_protocol_feature(dev,
                                 VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS) &&
-        (!vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_SLAVE_REQ) ||
+        (!vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_BACKEND_REQ) ||
          !vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_REPLY_ACK))) {
         /*
          * The use case for using messages for kick/call is simulation, to make
@@ -1507,7 +1507,7 @@ vu_set_protocol_features_exec(VuDev *dev, VhostUserMsg *vmsg)
          * that actually enables the simulation case.
          */
         vu_panic(dev,
-                 "F_IN_BAND_NOTIFICATIONS requires F_SLAVE_REQ && F_REPLY_ACK");
+                 "F_IN_BAND_NOTIFICATIONS requires F_BACKEND_REQ && F_REPLY_ACK");
         return false;
     }
 
@@ -1910,7 +1910,7 @@ vu_process_message(VuDev *dev, VhostUserMsg *vmsg)
         return vu_get_queue_num_exec(dev, vmsg);
     case VHOST_USER_SET_VRING_ENABLE:
         return vu_set_vring_enable_exec(dev, vmsg);
-    case VHOST_USER_SET_SLAVE_REQ_FD:
+    case VHOST_USER_SET_BACKEND_REQ_FD:
         return vu_set_slave_req_fd(dev, vmsg);
     case VHOST_USER_GET_CONFIG:
         return vu_get_config(dev, vmsg);
@@ -2416,9 +2416,9 @@ static void _vu_queue_notify(VuDev *dev, VuVirtq *vq, bool sync)
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
-- 
MST


