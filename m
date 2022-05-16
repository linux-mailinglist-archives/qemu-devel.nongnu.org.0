Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D6E529336
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:56:53 +0200 (CEST)
Received: from localhost ([::1]:52988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqihs-00029Z-GR
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhjx-0002Vq-Bc
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:54:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhjv-0006nt-CO
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B1nDZq61p1Fo9R+kfzgjGxckxAqyZiNflr6I94N0EOM=;
 b=AwoHqTHorB/5Aym+rTZl/H1iv7c9OrSTXWpRT3Ab7drHk+/JtNAJQPL9u+Mu4IQXZGL07/
 w8BD4IEm9KslaJKH6yRY2zlT8MF630AKfFSjfu225iFKhtj17gxhit/XSB7PWh9LF12gem
 aUEhMl8+uROYPscCryUeDpaNEO4SXrM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-ZpdjXfILO762nEEu52t6Bg-1; Mon, 16 May 2022 16:54:49 -0400
X-MC-Unique: ZpdjXfILO762nEEu52t6Bg-1
Received: by mail-ed1-f71.google.com with SMTP id
 s9-20020aa7c549000000b0042ab6ab62f0so2002781edr.14
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=B1nDZq61p1Fo9R+kfzgjGxckxAqyZiNflr6I94N0EOM=;
 b=YEcmfH9Q2BbVs9XEk7empvG0tvuo/IZXv/QWwdk29B7pCenuqsyEhilcEMS4lNdb0S
 YdtyoGgCSRJPYPN6EV4YBHjszrEL7iYTE+ycXOLN0C+enlNvA5HSPKKz8BueSaSMnUSZ
 +7OtBhm4HJBk7lZr+MeEqmNb/Hsprs84mOTVKuJZCZ5LEEt5feONgFR/Xqf82vqCrkXt
 P5sXZ1JlGEM5NaRcwVfgHq0Fwkc8yXMgzuTk3m1FFLYD/ciwZRVie8GG5/imncCxiiQv
 e2cyldJlPjjHZG/eYdaxLB3eMu22mov6g1E18ygoVuDgG9BWsU1Wg2mU9z1/ViXM3fX1
 FqRA==
X-Gm-Message-State: AOAM530iMaAFkNTswXwDz7AYcjVs2hQi4Z4JNzY5Kn4UdQOEvHpEKmYQ
 xP9FyoDg1Bnm+jKJusXGaV2jhG4phknGY4sAkI2QRp0EBTb9NyWU23tD0ohesbWx07DHNpRoi5L
 aLYzCupnw8bh7IjEPNrjuU0vfh2wvh12vlS0kEFZndzo+nwxuObPER2JSoWff
X-Received: by 2002:a17:907:7f1a:b0:6f4:6b52:adfd with SMTP id
 qf26-20020a1709077f1a00b006f46b52adfdmr16976513ejc.203.1652734487882; 
 Mon, 16 May 2022 13:54:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxft0sXJA1zwsvW4sMPAvJD2ZoiQhohGzpUSBAXUVD3bqGFJp6K/WPdQqMKyuReV2O0fwUKaw==
X-Received: by 2002:a17:907:7f1a:b0:6f4:6b52:adfd with SMTP id
 qf26-20020a1709077f1a00b006f46b52adfdmr16976500ejc.203.1652734487640; 
 Mon, 16 May 2022 13:54:47 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 r14-20020aa7cb8e000000b0042a9d52d811sm3872520edt.75.2022.05.16.13.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:54:47 -0700 (PDT)
Date: Mon, 16 May 2022 16:54:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: [PULL v2 67/86] include/hw: start documenting the vhost API
Message-ID: <20220516204913.542894-68-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

While trying to get my head around the nest of interactions for vhost
devices I though I could start by documenting the key API functions.
This patch documents the main API hooks for creating and starting a
vhost device as well as how the configuration changes are handled.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220321153037.3622127-11-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
MST


