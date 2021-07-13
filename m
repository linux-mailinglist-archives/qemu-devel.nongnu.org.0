Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0306F3C7988
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:18:36 +0200 (CEST)
Received: from localhost ([::1]:56958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Qja-0006Jy-V3
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3Qc4-0007Np-2z
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:10:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3Qc0-0007xB-LL
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:10:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626214244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f/yL9X7yv98T/bg8H5tdQO8Tp7NdclLbM6Zin1PZync=;
 b=BTNdG8uFeQSj8EErZ8o7j/G2Z2guNZAfDMPX0C0yMLndlT877Pj1qTyStzEZY/jQzVhet0
 j5ZvRn+q5Tciz6Fyb0JFhDJMmURC1U+l+tktYKXEOHNzjhIHCaqPRSS7UdcQbdHcT1wv8V
 JSs0d1kcTt5RkGbds5APTyObJ98AvV8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-VBdLvG2WN0mJz7094GZkFw-1; Tue, 13 Jul 2021 18:10:42 -0400
X-MC-Unique: VBdLvG2WN0mJz7094GZkFw-1
Received: by mail-wm1-f70.google.com with SMTP id
 m40-20020a05600c3b28b02901f42375a73fso150641wms.5
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f/yL9X7yv98T/bg8H5tdQO8Tp7NdclLbM6Zin1PZync=;
 b=OOlUTG9gHqZ59cOTwriArTQ6IDsGXliNCUrQmcqlgy2Q/gvkdvZX6j+wSQWUpMR4k5
 b+Z4XgWIKorNaSO6ukKWhAiFxeViD+dz3WanSNjXFIgjW9cvsrO3ylCkJpttDPKrjJXE
 By8DP6DjofVe2Lyiy1S7GZ9cyYTwDDNiVVu1M/IbTRRfFyvbxAXKP4TUirqYx3lg10lP
 M+xGTum146VZzOzfyTTf0FrjLyeSP1euwnpL8yuUpmKPD/eE/kIKcoL/JTsncSHd5E2d
 1Eg7IKhZxn+yALjXNIJOk34cADB5MqhjI1qLVGZI2WFLXCun98Mm1pmNf/y1VRij9pj+
 GEJw==
X-Gm-Message-State: AOAM533tIS/h5Jgz6zWW7385Tb6lg0EOHKT4MvqyzE4pkulMx4IDFDr1
 9OIz0DQgXYCOWjogPlOkXRx2ymWXjl6zqFLIfHFHb36jMCDxRdUfvQbaj33IVBwTF1nPAI5ETat
 1ojpKVEKHNBRHdOnI31ForPHxMpU9KwyoOCFQI9UBIbyxEyRQEG9vmGsix4Dq
X-Received: by 2002:adf:e507:: with SMTP id j7mr8649515wrm.152.1626214241217; 
 Tue, 13 Jul 2021 15:10:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqccBVZV1yCbaNcCSujACsjbzBIxbuyBFeSyTqXCodXOQrrbmYDjQsksNf60R3f/yq5MgF/A==
X-Received: by 2002:adf:e507:: with SMTP id j7mr8649488wrm.152.1626214240937; 
 Tue, 13 Jul 2021 15:10:40 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id z7sm129039wrt.47.2021.07.13.15.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:10:40 -0700 (PDT)
Date: Tue, 13 Jul 2021 18:10:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/23] hw/virtio: add boilerplate for vhost-user-i2c device
Message-ID: <20210713220946.212562-12-mst@redhat.com>
References: <20210713220946.212562-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210713220946.212562-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Viresh Kumar <viresh.kumar@linaro.org>

This creates the QEMU side of the vhost-user-i2c device which connects
to the remote daemon. It is based of vhost-user-fs code.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Message-Id: <e80591b52fea4b51631818bb92a798a3daf90399.1625806763.git.viresh.kumar@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-user-i2c.h |  28 +++
 hw/virtio/vhost-user-i2c.c         | 288 +++++++++++++++++++++++++++++
 hw/virtio/Kconfig                  |   5 +
 hw/virtio/meson.build              |   1 +
 4 files changed, 322 insertions(+)
 create mode 100644 include/hw/virtio/vhost-user-i2c.h
 create mode 100644 hw/virtio/vhost-user-i2c.c

diff --git a/include/hw/virtio/vhost-user-i2c.h b/include/hw/virtio/vhost-user-i2c.h
new file mode 100644
index 0000000000..deae47a76d
--- /dev/null
+++ b/include/hw/virtio/vhost-user-i2c.h
@@ -0,0 +1,28 @@
+/*
+ * Vhost-user i2c virtio device
+ *
+ * Copyright (c) 2021 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef _QEMU_VHOST_USER_I2C_H
+#define _QEMU_VHOST_USER_I2C_H
+
+#include "hw/virtio/vhost.h"
+#include "hw/virtio/vhost-user.h"
+
+#define TYPE_VHOST_USER_I2C "vhost-user-i2c-device"
+OBJECT_DECLARE_SIMPLE_TYPE(VHostUserI2C, VHOST_USER_I2C)
+
+struct VHostUserI2C {
+    VirtIODevice parent;
+    CharBackend chardev;
+    struct vhost_virtqueue *vhost_vq;
+    struct vhost_dev vhost_dev;
+    VhostUserState vhost_user;
+    VirtQueue *vq;
+    bool connected;
+};
+
+#endif /* _QEMU_VHOST_USER_I2C_H */
diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
new file mode 100644
index 0000000000..d172632bb0
--- /dev/null
+++ b/hw/virtio/vhost-user-i2c.c
@@ -0,0 +1,288 @@
+/*
+ * Vhost-user i2c virtio device
+ *
+ * Copyright (c) 2021 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/qdev-properties.h"
+#include "hw/virtio/virtio-bus.h"
+#include "hw/virtio/vhost-user-i2c.h"
+#include "qemu/error-report.h"
+#include "standard-headers/linux/virtio_ids.h"
+
+/* Remove this once the header is updated in Linux kernel */
+#ifndef VIRTIO_ID_I2C_ADAPTER
+#define VIRTIO_ID_I2C_ADAPTER                34
+#endif
+
+static void vu_i2c_start(VirtIODevice *vdev)
+{
+    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
+    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
+    VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
+    int ret, i;
+
+    if (!k->set_guest_notifiers) {
+        error_report("binding does not support guest notifiers");
+        return;
+    }
+
+    ret = vhost_dev_enable_notifiers(&i2c->vhost_dev, vdev);
+    if (ret < 0) {
+        error_report("Error enabling host notifiers: %d", -ret);
+        return;
+    }
+
+    ret = k->set_guest_notifiers(qbus->parent, i2c->vhost_dev.nvqs, true);
+    if (ret < 0) {
+        error_report("Error binding guest notifier: %d", -ret);
+        goto err_host_notifiers;
+    }
+
+    i2c->vhost_dev.acked_features = vdev->guest_features;
+
+    ret = vhost_dev_start(&i2c->vhost_dev, vdev);
+    if (ret < 0) {
+        error_report("Error starting vhost-user-i2c: %d", -ret);
+        goto err_guest_notifiers;
+    }
+
+    /*
+     * guest_notifier_mask/pending not used yet, so just unmask
+     * everything here. virtio-pci will do the right thing by
+     * enabling/disabling irqfd.
+     */
+    for (i = 0; i < i2c->vhost_dev.nvqs; i++) {
+        vhost_virtqueue_mask(&i2c->vhost_dev, vdev, i, false);
+    }
+
+    return;
+
+err_guest_notifiers:
+    k->set_guest_notifiers(qbus->parent, i2c->vhost_dev.nvqs, false);
+err_host_notifiers:
+    vhost_dev_disable_notifiers(&i2c->vhost_dev, vdev);
+}
+
+static void vu_i2c_stop(VirtIODevice *vdev)
+{
+    VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
+    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
+    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
+    int ret;
+
+    if (!k->set_guest_notifiers) {
+        return;
+    }
+
+    vhost_dev_stop(&i2c->vhost_dev, vdev);
+
+    ret = k->set_guest_notifiers(qbus->parent, i2c->vhost_dev.nvqs, false);
+    if (ret < 0) {
+        error_report("vhost guest notifier cleanup failed: %d", ret);
+        return;
+    }
+
+    vhost_dev_disable_notifiers(&i2c->vhost_dev, vdev);
+}
+
+static void vu_i2c_set_status(VirtIODevice *vdev, uint8_t status)
+{
+    VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
+    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
+
+    if (!vdev->vm_running) {
+        should_start = false;
+    }
+
+    if (i2c->vhost_dev.started == should_start) {
+        return;
+    }
+
+    if (should_start) {
+        vu_i2c_start(vdev);
+    } else {
+        vu_i2c_stop(vdev);
+    }
+}
+
+static uint64_t vu_i2c_get_features(VirtIODevice *vdev,
+                                    uint64_t requested_features, Error **errp)
+{
+    /* No feature bits used yet */
+    return requested_features;
+}
+
+static void vu_i2c_handle_output(VirtIODevice *vdev, VirtQueue *vq)
+{
+    /*
+     * Not normally called; it's the daemon that handles the queue;
+     * however virtio's cleanup path can call this.
+     */
+}
+
+static void vu_i2c_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
+{
+    VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
+
+    vhost_virtqueue_mask(&i2c->vhost_dev, vdev, idx, mask);
+}
+
+static bool vu_i2c_guest_notifier_pending(VirtIODevice *vdev, int idx)
+{
+    VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
+
+    return vhost_virtqueue_pending(&i2c->vhost_dev, idx);
+}
+
+static void do_vhost_user_cleanup(VirtIODevice *vdev, VHostUserI2C *i2c)
+{
+    vhost_user_cleanup(&i2c->vhost_user);
+    virtio_delete_queue(i2c->vq);
+    virtio_cleanup(vdev);
+    g_free(i2c->vhost_dev.vqs);
+    i2c->vhost_dev.vqs = NULL;
+}
+
+static int vu_i2c_connect(DeviceState *dev)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
+
+    if (i2c->connected) {
+        return 0;
+    }
+    i2c->connected = true;
+
+    /* restore vhost state */
+    if (virtio_device_started(vdev, vdev->status)) {
+        vu_i2c_start(vdev);
+    }
+
+    return 0;
+}
+
+static void vu_i2c_disconnect(DeviceState *dev)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
+
+    if (!i2c->connected) {
+        return;
+    }
+    i2c->connected = false;
+
+    if (i2c->vhost_dev.started) {
+        vu_i2c_stop(vdev);
+    }
+}
+
+static void vu_i2c_event(void *opaque, QEMUChrEvent event)
+{
+    DeviceState *dev = opaque;
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
+
+    switch (event) {
+    case CHR_EVENT_OPENED:
+        if (vu_i2c_connect(dev) < 0) {
+            qemu_chr_fe_disconnect(&i2c->chardev);
+            return;
+        }
+        break;
+    case CHR_EVENT_CLOSED:
+        vu_i2c_disconnect(dev);
+        break;
+    case CHR_EVENT_BREAK:
+    case CHR_EVENT_MUX_IN:
+    case CHR_EVENT_MUX_OUT:
+        /* Ignore */
+        break;
+    }
+}
+
+static void vu_i2c_device_realize(DeviceState *dev, Error **errp)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserI2C *i2c = VHOST_USER_I2C(dev);
+    int ret;
+
+    if (!i2c->chardev.chr) {
+        error_setg(errp, "vhost-user-i2c: missing chardev");
+        return;
+    }
+
+    if (!vhost_user_init(&i2c->vhost_user, &i2c->chardev, errp)) {
+        return;
+    }
+
+    virtio_init(vdev, "vhost-user-i2c", VIRTIO_ID_I2C_ADAPTER, 0);
+
+    i2c->vhost_dev.nvqs = 1;
+    i2c->vq = virtio_add_queue(vdev, 4, vu_i2c_handle_output);
+    i2c->vhost_dev.vqs = g_new0(struct vhost_virtqueue, i2c->vhost_dev.nvqs);
+
+    ret = vhost_dev_init(&i2c->vhost_dev, &i2c->vhost_user,
+                         VHOST_BACKEND_TYPE_USER, 0, errp);
+    if (ret < 0) {
+        do_vhost_user_cleanup(vdev, i2c);
+    }
+
+    qemu_chr_fe_set_handlers(&i2c->chardev, NULL, NULL, vu_i2c_event, NULL,
+                             dev, NULL, true);
+}
+
+static void vu_i2c_device_unrealize(DeviceState *dev)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserI2C *i2c = VHOST_USER_I2C(dev);
+
+    /* This will stop vhost backend if appropriate. */
+    vu_i2c_set_status(vdev, 0);
+    vhost_dev_cleanup(&i2c->vhost_dev);
+    do_vhost_user_cleanup(vdev, i2c);
+}
+
+static const VMStateDescription vu_i2c_vmstate = {
+    .name = "vhost-user-i2c",
+    .unmigratable = 1,
+};
+
+static Property vu_i2c_properties[] = {
+    DEFINE_PROP_CHR("chardev", VHostUserI2C, chardev),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void vu_i2c_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, vu_i2c_properties);
+    dc->vmsd = &vu_i2c_vmstate;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+    vdc->realize = vu_i2c_device_realize;
+    vdc->unrealize = vu_i2c_device_unrealize;
+    vdc->get_features = vu_i2c_get_features;
+    vdc->set_status = vu_i2c_set_status;
+    vdc->guest_notifier_mask = vu_i2c_guest_notifier_mask;
+    vdc->guest_notifier_pending = vu_i2c_guest_notifier_pending;
+}
+
+static const TypeInfo vu_i2c_info = {
+    .name = TYPE_VHOST_USER_I2C,
+    .parent = TYPE_VIRTIO_DEVICE,
+    .instance_size = sizeof(VHostUserI2C),
+    .class_init = vu_i2c_class_init,
+};
+
+static void vu_i2c_register_types(void)
+{
+    type_register_static(&vu_i2c_info);
+}
+
+type_init(vu_i2c_register_types)
diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
index 69066ab14e..6c917d7f1f 100644
--- a/hw/virtio/Kconfig
+++ b/hw/virtio/Kconfig
@@ -63,3 +63,8 @@ config VHOST_USER_RNG
     bool
     default y
     depends on VIRTIO && VHOST_USER
+
+config VHOST_USER_I2C
+    bool
+    default y
+    depends on VIRTIO && VHOST_USER
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 1430b370e6..948e668ed3 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -27,6 +27,7 @@ virtio_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng.c'))
 virtio_ss.add(when: ['CONFIG_VHOST_USER_RNG', 'CONFIG_VIRTIO_PCI'], if_true: files('vhost-user-rng-pci.c'))
+virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
-- 
MST


