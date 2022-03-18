Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4824DD9CD
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 13:35:30 +0100 (CET)
Received: from localhost ([::1]:46848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVBpJ-00060Y-NT
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 08:35:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nVBjk-00031A-5D
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 08:29:44 -0400
Received: from [2a00:1450:4864:20::62a] (port=37632
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nVBjh-0000pN-7e
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 08:29:42 -0400
Received: by mail-ej1-x62a.google.com with SMTP id bg10so16737477ejb.4
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 05:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MQjMBfPt07Yn8P1M2RUzALevfIxDKLCIzvSLtVRCENI=;
 b=tujaLYQaa0kt04mPjU98JCCXvVjyd4t3xgWZn8AHbXIfom1kKanossJ9X7z9n4hELT
 kYIg5Bp90lGFve14kQ2Eh9lE6sMJQRjUQ2ZR9Wflw1+crq2lkveHVVtJpsN12YYfqsWA
 95F8c9RwVFSQvbwQ+Tj11tQhDLOWQOURHQIA9SH94bB7chv3JW4Cm7Wsa1Ov4aUaTluf
 vVBFJi3GAt7qSxebCfIpncP5idJ8F3DO8O5Hh2+osspGs3gzpcLtsC6T6igH803Iy0dK
 j50FTCJd0ADjQyNsFpIlDOm4BXJIOetqcOdVKX58Y1vf5/AL3bg/XY3yncdes0CAWKkj
 bJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MQjMBfPt07Yn8P1M2RUzALevfIxDKLCIzvSLtVRCENI=;
 b=m7iTJ5w1mDhYDG512no5oEWbCYCftnHNqOq3iwMYUXeO0HMQvrgj2jnxX83phYRWBF
 W5YgXjUtqM6MAcVXZNsq19hxufYqvuaseDQ6l8zVmkj7dA700fyScT8p42c76Kdqwvyl
 //9nzsIY3X1IXlJgvqiNrW+vMex9jiGzMay1E+HOzAYARDe9mPUkRDAWPya2dj/FCiJ2
 w0CEAep+vfhc77g2iSqWFFgVBQ9hmPFR5jf505wOFSMI13rwYJOoZmRbD/RgP3ISaEF+
 1hUQb5MCF1Ql0CKzxr3zeee+wwiWDYtkp5QFlmxw9CgKSRGZ5hYzLL9DDEXipQ9GO9DZ
 eTWg==
X-Gm-Message-State: AOAM531Ps/KqKOhgOauKl2suhKvq/yxRaP4ggNADklYHf8ToqAZ4oYiX
 sJtWXRFqt1GzETDG1bYbbjVrZQ==
X-Google-Smtp-Source: ABdhPJzXyqZQfCXyRzAgTOBO4nADQwTiwxxcQ+uNXvhhzXnWgwW+JKhosRTy07DKaAwc79fZLKerSQ==
X-Received: by 2002:a17:907:9485:b0:6db:331:591e with SMTP id
 dm5-20020a170907948500b006db0331591emr8750619ejc.478.1647606578249; 
 Fri, 18 Mar 2022 05:29:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 f29-20020a170906739d00b006df8bf95536sm2707190ejl.143.2022.03.18.05.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 05:29:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 340111FFB7;
 Fri, 18 Mar 2022 12:29:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] include/hw: start documenting the vhost API
Date: Fri, 18 Mar 2022 12:29:33 +0000
Message-Id: <20220318122933.282578-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While trying to get my head around the nest of interactions for vhost
devices I though I could start by documenting the key API functions.
This patch documents the main API hooks for creating and starting a
vhost device as well as how the configuration changes are handled.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/hw/virtio/vhost.h | 132 +++++++++++++++++++++++++++++++++++---
 1 file changed, 122 insertions(+), 10 deletions(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 58a73e7b7a..b291fe4e24 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -61,6 +61,12 @@ typedef struct VhostDevConfigOps {
 } VhostDevConfigOps;
 
 struct vhost_memory;
+
+/**
+ * struct vhost_dev - common vhost_dev structure
+ * @vhost_ops: backend specific ops
+ * @config_ops: ops for config changes (see @vhost_dev_set_config_notifier)
+ */
 struct vhost_dev {
     VirtIODevice *vdev;
     MemoryListener memory_listener;
@@ -108,15 +114,129 @@ struct vhost_net {
     NetClientState *nc;
 };
 
+/**
+ * vhost_dev_init() - initialise the vhost interface
+ * @hdev: the common vhost_dev structure
+ * @opaque: opaque ptr passed to backend (vhost/vhost-user/vdpa)
+ * @backend_type: type of backend
+ * @busyloop_timeout: timeout for polling virtqueue
+ * @errp: error handle
+ *
+ * The initialisation of the vhost device will trigger the
+ * initialisation of the backend and potentially capability
+ * negotiation of backend interface. Configuration of the VirtIO
+ * itself won't happen until the interface is started.
+ *
+ * Return: 0 on success, non-zero on error while setting errp.
+ */
 int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
                    VhostBackendType backend_type,
                    uint32_t busyloop_timeout, Error **errp);
+
+/**
+ * vhost_dev_cleanup() - tear down and cleanup vhost interface
+ * @hdev: the common vhost_dev structure
+ */
 void vhost_dev_cleanup(struct vhost_dev *hdev);
-int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
-void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
+
+/**
+ * vhost_dev_enable_notifiers() - enable event notifiers
+ * @hdev: common vhost_dev structure
+ * @vdev: the VirtIODevice structure
+ *
+ * Enable notifications directly to the vhost device rather than being
+ * triggered by QEMU itself. Notifications should be enabled before
+ * the vhost device is started via @vhost_dev_start.
+ *
+ * Return: 0 on success, < 0 on error.
+ */
 int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
+
+/**
+ * vhost_dev_disable_notifiers - disable event notifications
+ * @hdev: common vhost_dev structure
+ * @vdev: the VirtIODevice structure
+ *
+ * Disable direct notifications to vhost device.
+ */
 void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
 
+/**
+ * vhost_dev_start() - start the vhost device
+ * @hdev: common vhost_dev structure
+ * @vdev: the VirtIODevice structure
+ *
+ * Starts the vhost device. From this point VirtIO feature negotiation
+ * can start and the device can start processing VirtIO transactions.
+ *
+ * Return: 0 on success, < 0 on error.
+ */
+int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
+
+/**
+ * vhost_dev_stop() - stop the vhost device
+ * @hdev: common vhost_dev structure
+ * @vdev: the VirtIODevice structure
+ *
+ * Stop the vhost device. After the device is stopped the notifiers
+ * can be disabled (@vhost_dev_disable_notifiers) and the device can
+ * be torn down (@vhost_dev_cleanup).
+ */
+void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
+
+/**
+ * DOC: vhost device configuration handling
+ *
+ * The VirtIO device configuration space is used for rarely changing
+ * or initialisation time parameters. The configuration can be updated
+ * by either the guest driver or the device itself. If the device can
+ * change the configuration over time the vhost handler should
+ * register a @VhostDevConfigOps structure with
+ * @vhost_dev_set_config_notifier so the guest can be notified. Some
+ * devices register a handler anyway and will signal an error if an
+ * unexpected config change happens.
+ */
+
+/**
+ * vhost_dev_get_config() - fetch device configuration
+ * @hdev: common vhost_dev_structure
+ * @config: pointer to device appropriate config structure
+ * @config_len: size of device appropriate config structure
+ *
+ * Return: 0 on success, < 0 on error while setting errp
+ */
+int vhost_dev_get_config(struct vhost_dev *hdev, uint8_t *config,
+                         uint32_t config_len, Error **errp);
+
+/**
+ * vhost_dev_set_config() - set device configuration
+ * @hdev: common vhost_dev_structure
+ * @data: pointer to data to set
+ * @offset: offset into configuration space
+ * @size: length of set
+ * @flags: @VhostSetConfigType flags
+ *
+ * By use of @offset/@size a subset of the configuration space can be
+ * written to. The @flags are used to indicate if it is a normal
+ * transaction or related to migration.
+ *
+ * Return: 0 on success, non-zero on error
+ */
+int vhost_dev_set_config(struct vhost_dev *dev, const uint8_t *data,
+                         uint32_t offset, uint32_t size, uint32_t flags);
+
+/**
+ * vhost_dev_set_config_notifier() - register VhostDevConfigOps
+ * @hdev: common vhost_dev_structure
+ * @ops: notifier ops
+ *
+ * If the device is expected to change configuration a notifier can be
+ * setup to handle the case.
+ */
+void vhost_dev_set_config_notifier(struct vhost_dev *dev,
+                                   const VhostDevConfigOps *ops);
+
+
 /* Test and clear masked event pending status.
  * Should be called after unmask to avoid losing events.
  */
@@ -136,14 +256,6 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
                           struct vhost_vring_file *file);
 
 int vhost_device_iotlb_miss(struct vhost_dev *dev, uint64_t iova, int write);
-int vhost_dev_get_config(struct vhost_dev *hdev, uint8_t *config,
-                         uint32_t config_len, Error **errp);
-int vhost_dev_set_config(struct vhost_dev *dev, const uint8_t *data,
-                         uint32_t offset, uint32_t size, uint32_t flags);
-/* notifier callback in case vhost device config space changed
- */
-void vhost_dev_set_config_notifier(struct vhost_dev *dev,
-                                   const VhostDevConfigOps *ops);
 
 void vhost_dev_reset_inflight(struct vhost_inflight *inflight);
 void vhost_dev_free_inflight(struct vhost_inflight *inflight);
-- 
2.30.2


