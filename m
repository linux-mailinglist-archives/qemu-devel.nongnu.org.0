Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A686E1D17
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 09:26:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnDnD-0003mH-4f; Fri, 14 Apr 2023 03:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ray90514@gmail.com>)
 id 1pn9hm-0006uk-Po
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 23:02:30 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ray90514@gmail.com>)
 id 1pn9ha-0003Cr-Jt
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 23:02:30 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 y11-20020a17090a600b00b0024693e96b58so16306813pji.1
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 20:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681441335; x=1684033335;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=suUFGIu333J5BhRBdzQmYtbFluGOeO0x0BxGNl1j7lE=;
 b=br4gsEQQdQnTmkcyaFPHeWvDVJMibHuls7/DsEdeOW9LtGD+YgFJuFb2N6i3N53x8z
 yLr+94WKTQhHM5XFw1GDtgfO2GXcBf8H0y/Crfm90C4VSIs414i7kdwX/QgtFzmjYObp
 vTugqmtruPM3h4BZGwoUX+or/H/hiCT7Ga4+yeUA9urQgjEbk/Nw/3DSThpk+/RCi14i
 x8zqvEvyZs6glMn0nXc/MZLNpbrDC2g6frV/+Tg8LgSiFSCJ80hEPgykyEagROkw/AoH
 77rQ9m6W9InJDTijSQNojrNSoVQV/GgFTyW/uYRK2LzmD34I6raTC2aZSedxRfxi3FEf
 w1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681441335; x=1684033335;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=suUFGIu333J5BhRBdzQmYtbFluGOeO0x0BxGNl1j7lE=;
 b=jq1jox080k5WHjBFlcYrKI5jilzrJ4bBEKDP6wDjKubo9MnhyWh2zoad2U16TQno2k
 BfikdUatd9Lk4BLwpCjZjsvQltgu1hmsMsZpShtSr1cogBPBwVar5zT2lu5Ran3WLKNI
 sz2ia5h0MgC4Lws6rX9e28RpzakUxLtkFIEJk+15uJRNmo35ur9KsIjgjDvHb4SfgS/m
 hcxlWFpQX43oI9K5qcxCh7uiZegE1hCeLQThyLIuN1KigUhbphx0WhsodQwintnMlJP3
 /y3y8HWno3dlpzHx9sqWfeXeQuDVyN/NVkJSvFgSzT1nMJEnUvnUKff//weonEmc7x04
 HTgQ==
X-Gm-Message-State: AAQBX9dyq5NHXc32QPQ1c8F76A43eNZezOXXvEjWR9PvQLdzzYJ8REls
 dytJ0kknQL/mKAxGWC1dXS0=
X-Google-Smtp-Source: AKy350YLAGC8HvvkW3yEH5kxEU3FJFHlUMHg80fxlXhyxp8YFtNCUj++aFsOH/ayyDryVaeZ7L8XeA==
X-Received: by 2002:a17:902:e782:b0:1a0:75fe:cd66 with SMTP id
 cp2-20020a170902e78200b001a075fecd66mr913381plb.50.1681441334670; 
 Thu, 13 Apr 2023 20:02:14 -0700 (PDT)
Received: from localhost.localdomain
 (2001-b011-e009-bcc6-4af2-3e75-b56c-0988.dynamic-ip6.hinet.net.
 [2001:b011:e009:bcc6:4af2:3e75:b56c:988])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a170902788c00b0019e60c645b1sm2101277pll.305.2023.04.13.20.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 20:02:14 -0700 (PDT)
From: Shao-Chien Chiang <ray90514@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Shao-Chien Chiang <ray90514@gmail.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH] vhost-vdpa: cache Virtio states
Date: Fri, 14 Apr 2023 10:57:20 +0800
Message-Id: <20230414025721.10219-1-ray90514@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=ray90514@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 14 Apr 2023 03:24:13 -0400
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

Repetitive ioctls makes vdpa devices initialization and startup slow.
This patch is to cache Virtio status, features, and config.
Testing with vdpa-sim-net as my vdpa device, the numbers of ioctl is 
reduced from 47 to 37.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1579

Signed-off-by: Shao-Chien Chiang <ray90514@gmail.com>
---
 hw/virtio/vhost-vdpa.c         | 44 +++++++++++++++++++++++-----------
 include/hw/virtio/vhost-vdpa.h |  3 +++
 2 files changed, 33 insertions(+), 14 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index bc6bad23d5..1fccd151cf 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -343,21 +343,17 @@ static int vhost_vdpa_call(struct vhost_dev *dev, unsigned long int request,
     int ret;
 
     assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
-
     ret = ioctl(fd, request, arg);
     return ret < 0 ? -errno : ret;
 }
 
 static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
 {
-    uint8_t s;
+    struct vhost_vdpa *v = dev->opaque;
+    uint8_t s = v->status;
     int ret;
 
     trace_vhost_vdpa_add_status(dev, status);
-    ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &s);
-    if (ret < 0) {
-        return ret;
-    }
 
     s |= status;
 
@@ -374,6 +370,7 @@ static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
     if (!(s & status)) {
         return -EIO;
     }
+    v->status = s;
 
     return 0;
 }
@@ -436,8 +433,15 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
     dev->opaque =  opaque ;
     v->listener = vhost_vdpa_memory_listener;
     v->msg_type = VHOST_IOTLB_MSG_V2;
+    v->config = NULL;
+    v->features = dev->features;
     vhost_vdpa_init_svq(dev, v);
 
+    ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &v->status);
+    if (ret) {
+        return ret;
+    }
+
     error_propagate(&dev->migration_blocker, v->migration_blocker);
     if (!vhost_vdpa_first_dev(dev)) {
         return 0;
@@ -456,6 +460,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
             return ret;
         }
         vhost_svq_valid_features(features, &dev->migration_blocker);
+        v->features = features;
     }
 
     /*
@@ -602,6 +607,7 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
     vhost_vdpa_svq_cleanup(dev);
 
     dev->opaque = NULL;
+    g_free(v->config);
 
     return 0;
 }
@@ -718,6 +724,7 @@ static int vhost_vdpa_reset_device(struct vhost_dev *dev)
     ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
     trace_vhost_vdpa_reset_device(dev, status);
     v->suspended = false;
+    v->status = 0;
     return ret;
 }
 
@@ -767,6 +774,7 @@ static int vhost_vdpa_set_config(struct vhost_dev *dev, const uint8_t *data,
                                    uint32_t offset, uint32_t size,
                                    uint32_t flags)
 {
+    struct vhost_vdpa *v = dev->opaque;
     struct vhost_vdpa_config *config;
     int ret;
     unsigned long config_size = offsetof(struct vhost_vdpa_config, buf);
@@ -776,6 +784,10 @@ static int vhost_vdpa_set_config(struct vhost_dev *dev, const uint8_t *data,
     config->off = offset;
     config->len = size;
     memcpy(config->buf, data, size);
+    if (v->config != NULL) {
+        assert(size + offset <= v->config->len);
+        memcpy(v->config->buf + offset, data, size);
+    }
     if (trace_event_get_state_backends(TRACE_VHOST_VDPA_SET_CONFIG) &&
         trace_event_get_state_backends(TRACE_VHOST_VDPA_DUMP_CONFIG)) {
         vhost_vdpa_dump_config(dev, data, size);
@@ -788,17 +800,19 @@ static int vhost_vdpa_set_config(struct vhost_dev *dev, const uint8_t *data,
 static int vhost_vdpa_get_config(struct vhost_dev *dev, uint8_t *config,
                                    uint32_t config_len, Error **errp)
 {
-    struct vhost_vdpa_config *v_config;
+    struct vhost_vdpa *v = dev->opaque;
     unsigned long config_size = offsetof(struct vhost_vdpa_config, buf);
     int ret;
 
     trace_vhost_vdpa_get_config(dev, config, config_len);
-    v_config = g_malloc(config_len + config_size);
-    v_config->len = config_len;
-    v_config->off = 0;
-    ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_CONFIG, v_config);
-    memcpy(config, v_config->buf, config_len);
-    g_free(v_config);
+    if (v->config == NULL) {
+        v->config = g_malloc(config_len + config_size);
+        v->config->len = config_len;
+        v->config->off = 0;
+        ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_CONFIG, v->config);
+    }
+    assert(config_len <= v->config->len);
+    memcpy(config, v->config->buf, config_len);
     if (trace_event_get_state_backends(TRACE_VHOST_VDPA_GET_CONFIG) &&
         trace_event_get_state_backends(TRACE_VHOST_VDPA_DUMP_CONFIG)) {
         vhost_vdpa_dump_config(dev, config, config_len);
@@ -1294,8 +1308,10 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
 static int vhost_vdpa_get_features(struct vhost_dev *dev,
                                      uint64_t *features)
 {
-    int ret = vhost_vdpa_get_dev_features(dev, features);
+    struct vhost_vdpa *v = dev->opaque;
+    int ret = 0;
 
+    *features = v->features;
     if (ret == 0) {
         /* Add SVQ logging capabilities */
         *features |= BIT_ULL(VHOST_F_LOG_ALL);
diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index c278a2a8de..c1505a21ec 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -39,6 +39,9 @@ typedef struct vhost_vdpa {
     MemoryListener listener;
     struct vhost_vdpa_iova_range iova_range;
     uint64_t acked_features;
+    uint64_t features;
+    uint8_t status;
+    struct vhost_vdpa_config *config;
     bool shadow_vqs_enabled;
     /* Vdpa must send shadow addresses as IOTLB key for data queues, not GPA */
     bool shadow_data;
-- 
2.25.1


