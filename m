Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AD45FA2F8
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 19:53:22 +0200 (CEST)
Received: from localhost ([::1]:52456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohwxt-00040V-Pi
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 13:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwav-0000qx-8s
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:29:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwar-0006Zk-MD
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:29:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665422972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gmZWIaLBbM0XIchBusCCbI3eKbKP0+13fR+gGociBYs=;
 b=d15uGAe53MGEyECCN2BIY0PZH3RY9+tItUyKy7Ao1elQnVmrlmQXXPNfUius3SE6MQX2Rg
 N704O71cYyN5sV0ffYHkrztQ8BJ/hkRieJGrv1Hw6LE610A+3xji6amNWfA7b8WqO6wIjI
 G1DEarXf0K5SNlEfkXnqdn5Yhi38KO8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-155-lGNu9zJyO8WKW9BzPzFubg-1; Mon, 10 Oct 2022 13:29:23 -0400
X-MC-Unique: lGNu9zJyO8WKW9BzPzFubg-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay21-20020a05600c1e1500b003b45fd14b53so5819064wmb.1
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gmZWIaLBbM0XIchBusCCbI3eKbKP0+13fR+gGociBYs=;
 b=k04GLorGAjuR9z0ZcHRWnhJToBIcDwBx+NZaxFB43K+Ef1QZ9V/RDtoxtoElX0rXcH
 YIVN/quwAxthUFMX4FxqNpORjsK083/vfRJ/MuURLgJuqcX7nYe1Ss/Mc+U4PDMi/oZC
 Jch7GEwqATF1q7IrwCijJMSKj8AznMjyKblM0OWN/EuJhAhm9zVZx0+pl1XMcUtLtSCH
 GBxBqTZtqSj5E2TGjaWG0wxji91MIKOB7C1ATGXnYu1GB1s20K2ZT86Fh/zOCnu/aI5c
 FaQq+uZOhdL3GzVi1/Drd1Jm/e6C/DfxVP5jiGdjZATbFKUFYW6Ok6cmbxjJkwJ5RDxC
 2qmA==
X-Gm-Message-State: ACrzQf0Rt/PW045ROg37SbGyzqpT24QAV28+NrAKvxCw/ePoe/Kr3bHm
 6bD6C5gj9oCOGIl//dZ5W4lXWaL049CyEoivhxA6tLgJ0pSnHT5QPNRXVKQ+ZbYmv8D4hdVcB/A
 3KzIgiHFOiEvCpSP3KM3vvn1kWQnXUethHqDiLALgsrNIIOxUJFawlSXGWHeN
X-Received: by 2002:a05:600c:b43:b0:3c3:64cd:6f39 with SMTP id
 k3-20020a05600c0b4300b003c364cd6f39mr11636172wmr.66.1665422961358; 
 Mon, 10 Oct 2022 10:29:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7mI7fkHcz8Qrz5ZR2u8MDZ6/2Ums3lvtTv6u6aUbdAOA3nzFm688gQ5wwiJWaRJu8WNzffhQ==
X-Received: by 2002:a05:600c:b43:b0:3c3:64cd:6f39 with SMTP id
 k3-20020a05600c0b4300b003c364cd6f39mr11636137wmr.66.1665422960946; 
 Mon, 10 Oct 2022 10:29:20 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 g20-20020a05600c4ed400b003b4ac05a8a4sm23754363wmq.27.2022.10.10.10.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:29:20 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:29:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: [PULL 09/55] hw/virtio: add boilerplate for vhost-user-gpio device
Message-ID: <20221010172813.204597-10-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Viresh Kumar <viresh.kumar@linaro.org>

This creates the QEMU side of the vhost-user-gpio device which connects
to the remote daemon. It is based of vhost-user-i2c code.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <5390324a748194a21bc99b1538e19761a8c64092.1641987128.git.viresh.kumar@linaro.org>
[AJB: fixes for qtest, tweaks to feature bits]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Vincent Whitchurch <vincent.whitchurch@axis.com>

Message-Id: <20220802095010.3330793-13-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-user-gpio.h |  35 +++
 hw/virtio/vhost-user-gpio.c         | 411 ++++++++++++++++++++++++++++
 MAINTAINERS                         |   7 +
 hw/virtio/Kconfig                   |   5 +
 hw/virtio/meson.build               |   1 +
 hw/virtio/trace-events              |   5 +
 6 files changed, 464 insertions(+)
 create mode 100644 include/hw/virtio/vhost-user-gpio.h
 create mode 100644 hw/virtio/vhost-user-gpio.c

diff --git a/include/hw/virtio/vhost-user-gpio.h b/include/hw/virtio/vhost-user-gpio.h
new file mode 100644
index 0000000000..4fe9aeecc0
--- /dev/null
+++ b/include/hw/virtio/vhost-user-gpio.h
@@ -0,0 +1,35 @@
+/*
+ * Vhost-user GPIO virtio device
+ *
+ * Copyright (c) 2021 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef _QEMU_VHOST_USER_GPIO_H
+#define _QEMU_VHOST_USER_GPIO_H
+
+#include "hw/virtio/virtio.h"
+#include "hw/virtio/vhost.h"
+#include "hw/virtio/vhost-user.h"
+#include "standard-headers/linux/virtio_gpio.h"
+#include "chardev/char-fe.h"
+
+#define TYPE_VHOST_USER_GPIO "vhost-user-gpio-device"
+OBJECT_DECLARE_SIMPLE_TYPE(VHostUserGPIO, VHOST_USER_GPIO);
+
+struct VHostUserGPIO {
+    /*< private >*/
+    VirtIODevice parent_obj;
+    CharBackend chardev;
+    struct virtio_gpio_config config;
+    struct vhost_virtqueue *vhost_vq;
+    struct vhost_dev vhost_dev;
+    VhostUserState vhost_user;
+    VirtQueue *command_vq;
+    VirtQueue *interrupt_vq;
+    bool connected;
+    /*< public >*/
+};
+
+#endif /* _QEMU_VHOST_USER_GPIO_H */
diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
new file mode 100644
index 0000000000..8b40fe450c
--- /dev/null
+++ b/hw/virtio/vhost-user-gpio.c
@@ -0,0 +1,411 @@
+/*
+ * Vhost-user GPIO virtio device
+ *
+ * Copyright (c) 2022 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/qdev-properties.h"
+#include "hw/virtio/virtio-bus.h"
+#include "hw/virtio/vhost-user-gpio.h"
+#include "qemu/error-report.h"
+#include "standard-headers/linux/virtio_ids.h"
+#include "trace.h"
+
+#define REALIZE_CONNECTION_RETRIES 3
+
+/* Features required from VirtIO */
+static const int feature_bits[] = {
+    VIRTIO_F_VERSION_1,
+    VIRTIO_F_NOTIFY_ON_EMPTY,
+    VIRTIO_RING_F_INDIRECT_DESC,
+    VIRTIO_RING_F_EVENT_IDX,
+    VIRTIO_GPIO_F_IRQ,
+    VHOST_INVALID_FEATURE_BIT
+};
+
+static void vu_gpio_get_config(VirtIODevice *vdev, uint8_t *config)
+{
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
+
+    memcpy(config, &gpio->config, sizeof(gpio->config));
+}
+
+static int vu_gpio_config_notifier(struct vhost_dev *dev)
+{
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(dev->vdev);
+
+    memcpy(dev->vdev->config, &gpio->config, sizeof(gpio->config));
+    virtio_notify_config(dev->vdev);
+
+    return 0;
+}
+
+const VhostDevConfigOps gpio_ops = {
+    .vhost_dev_config_notifier = vu_gpio_config_notifier,
+};
+
+static int vu_gpio_start(VirtIODevice *vdev)
+{
+    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
+    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
+    struct vhost_dev *vhost_dev = &gpio->vhost_dev;
+    int ret, i;
+
+    if (!k->set_guest_notifiers) {
+        error_report("binding does not support guest notifiers");
+        return -ENOSYS;
+    }
+
+    ret = vhost_dev_enable_notifiers(vhost_dev, vdev);
+    if (ret < 0) {
+        error_report("Error enabling host notifiers: %d", ret);
+        return ret;
+    }
+
+    ret = k->set_guest_notifiers(qbus->parent, vhost_dev->nvqs, true);
+    if (ret < 0) {
+        error_report("Error binding guest notifier: %d", ret);
+        goto err_host_notifiers;
+    }
+
+    /*
+     * Before we start up we need to ensure we have the final feature
+     * set needed for the vhost configuration. The backend may also
+     * apply backend_features when the feature set is sent.
+     */
+    vhost_ack_features(&gpio->vhost_dev, feature_bits, vdev->guest_features);
+
+    ret = vhost_dev_start(&gpio->vhost_dev, vdev);
+    if (ret < 0) {
+        error_report("Error starting vhost-user-gpio: %d", ret);
+        goto err_guest_notifiers;
+    }
+
+    /*
+     * guest_notifier_mask/pending not used yet, so just unmask
+     * everything here. virtio-pci will do the right thing by
+     * enabling/disabling irqfd.
+     */
+    for (i = 0; i < gpio->vhost_dev.nvqs; i++) {
+        vhost_virtqueue_mask(&gpio->vhost_dev, vdev, i, false);
+    }
+
+    /*
+     * As we must have VHOST_USER_F_PROTOCOL_FEATURES (because
+     * VHOST_USER_GET_CONFIG requires it) we need to explicitly enable
+     * the vrings.
+     */
+    g_assert(vhost_dev->vhost_ops &&
+             vhost_dev->vhost_ops->vhost_set_vring_enable);
+    ret = vhost_dev->vhost_ops->vhost_set_vring_enable(vhost_dev, true);
+    if (ret == 0) {
+        return 0;
+    }
+
+    error_report("Failed to start vrings for vhost-user-gpio: %d", ret);
+
+err_guest_notifiers:
+    k->set_guest_notifiers(qbus->parent, gpio->vhost_dev.nvqs, false);
+err_host_notifiers:
+    vhost_dev_disable_notifiers(&gpio->vhost_dev, vdev);
+
+    return ret;
+}
+
+static void vu_gpio_stop(VirtIODevice *vdev)
+{
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
+    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
+    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
+    struct vhost_dev *vhost_dev = &gpio->vhost_dev;
+    int ret;
+
+    if (!k->set_guest_notifiers) {
+        return;
+    }
+
+    /*
+     * We can call vu_gpio_stop multiple times, for example from
+     * vm_state_notify and the final object finalisation. Check we
+     * aren't already stopped before doing so.
+     */
+    if (!vhost_dev_is_started(vhost_dev)) {
+        return;
+    }
+
+    vhost_dev_stop(vhost_dev, vdev);
+
+    ret = k->set_guest_notifiers(qbus->parent, vhost_dev->nvqs, false);
+    if (ret < 0) {
+        error_report("vhost guest notifier cleanup failed: %d", ret);
+        return;
+    }
+
+    vhost_dev_disable_notifiers(vhost_dev, vdev);
+}
+
+static void vu_gpio_set_status(VirtIODevice *vdev, uint8_t status)
+{
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
+    bool should_start = virtio_device_started(vdev, status);
+
+    trace_virtio_gpio_set_status(status);
+
+    if (!gpio->connected) {
+        return;
+    }
+
+    if (vhost_dev_is_started(&gpio->vhost_dev) == should_start) {
+        return;
+    }
+
+    if (should_start) {
+        if (vu_gpio_start(vdev)) {
+            qemu_chr_fe_disconnect(&gpio->chardev);
+        }
+    } else {
+        vu_gpio_stop(vdev);
+    }
+}
+
+static uint64_t vu_gpio_get_features(VirtIODevice *vdev, uint64_t features,
+                                     Error **errp)
+{
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
+
+    return vhost_get_features(&gpio->vhost_dev, feature_bits, features);
+}
+
+static void vu_gpio_handle_output(VirtIODevice *vdev, VirtQueue *vq)
+{
+    /*
+     * Not normally called; it's the daemon that handles the queue;
+     * however virtio's cleanup path can call this.
+     */
+}
+
+static void vu_gpio_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
+{
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
+
+    vhost_virtqueue_mask(&gpio->vhost_dev, vdev, idx, mask);
+}
+
+static void do_vhost_user_cleanup(VirtIODevice *vdev, VHostUserGPIO *gpio)
+{
+    virtio_delete_queue(gpio->command_vq);
+    virtio_delete_queue(gpio->interrupt_vq);
+    g_free(gpio->vhost_dev.vqs);
+    gpio->vhost_dev.vqs = NULL;
+    virtio_cleanup(vdev);
+    vhost_user_cleanup(&gpio->vhost_user);
+}
+
+static int vu_gpio_connect(DeviceState *dev, Error **errp)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
+    struct vhost_dev *vhost_dev = &gpio->vhost_dev;
+    int ret;
+
+    if (gpio->connected) {
+        return 0;
+    }
+    gpio->connected = true;
+
+    vhost_dev_set_config_notifier(vhost_dev, &gpio_ops);
+    gpio->vhost_user.supports_config = true;
+
+    ret = vhost_dev_init(vhost_dev, &gpio->vhost_user,
+                         VHOST_BACKEND_TYPE_USER, 0, errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    /* restore vhost state */
+    if (virtio_device_started(vdev, vdev->status)) {
+        vu_gpio_start(vdev);
+    }
+
+    return 0;
+}
+
+static void vu_gpio_disconnect(DeviceState *dev)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
+
+    if (!gpio->connected) {
+        return;
+    }
+    gpio->connected = false;
+
+    vu_gpio_stop(vdev);
+    vhost_dev_cleanup(&gpio->vhost_dev);
+}
+
+static void vu_gpio_event(void *opaque, QEMUChrEvent event)
+{
+    DeviceState *dev = opaque;
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
+    Error *local_err = NULL;
+
+    switch (event) {
+    case CHR_EVENT_OPENED:
+        if (vu_gpio_connect(dev, &local_err) < 0) {
+            qemu_chr_fe_disconnect(&gpio->chardev);
+            return;
+        }
+        break;
+    case CHR_EVENT_CLOSED:
+        vu_gpio_disconnect(dev);
+        break;
+    case CHR_EVENT_BREAK:
+    case CHR_EVENT_MUX_IN:
+    case CHR_EVENT_MUX_OUT:
+        /* Ignore */
+        break;
+    }
+}
+
+static int vu_gpio_realize_connect(VHostUserGPIO *gpio, Error **errp)
+{
+    VirtIODevice *vdev = &gpio->parent_obj;
+    DeviceState *dev = &vdev->parent_obj;
+    struct vhost_dev *vhost_dev = &gpio->vhost_dev;
+    int ret;
+
+    ret = qemu_chr_fe_wait_connected(&gpio->chardev, errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    /*
+     * vu_gpio_connect() may have already connected (via the event
+     * callback) in which case it will just report success.
+     */
+    ret = vu_gpio_connect(dev, errp);
+    if (ret < 0) {
+        qemu_chr_fe_disconnect(&gpio->chardev);
+        return ret;
+    }
+    g_assert(gpio->connected);
+
+    ret = vhost_dev_get_config(vhost_dev, (uint8_t *)&gpio->config,
+                               sizeof(gpio->config), errp);
+
+    if (ret < 0) {
+        error_report("vhost-user-gpio: get config failed");
+
+        qemu_chr_fe_disconnect(&gpio->chardev);
+        vhost_dev_cleanup(vhost_dev);
+        return ret;
+    }
+
+    return 0;
+}
+
+static void vu_gpio_device_realize(DeviceState *dev, Error **errp)
+{
+    ERRP_GUARD();
+
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(dev);
+    int retries, ret;
+
+    if (!gpio->chardev.chr) {
+        error_setg(errp, "vhost-user-gpio: chardev is mandatory");
+        return;
+    }
+
+    if (!vhost_user_init(&gpio->vhost_user, &gpio->chardev, errp)) {
+        return;
+    }
+
+    virtio_init(vdev, VIRTIO_ID_GPIO, sizeof(gpio->config));
+
+    gpio->vhost_dev.nvqs = 2;
+    gpio->command_vq = virtio_add_queue(vdev, 256, vu_gpio_handle_output);
+    gpio->interrupt_vq = virtio_add_queue(vdev, 256, vu_gpio_handle_output);
+    gpio->vhost_dev.vqs = g_new0(struct vhost_virtqueue, gpio->vhost_dev.nvqs);
+
+    gpio->connected = false;
+
+    qemu_chr_fe_set_handlers(&gpio->chardev, NULL, NULL, vu_gpio_event, NULL,
+                             dev, NULL, true);
+
+    retries = REALIZE_CONNECTION_RETRIES;
+    g_assert(!*errp);
+    do {
+        if (*errp) {
+            error_prepend(errp, "Reconnecting after error: ");
+            error_report_err(*errp);
+            *errp = NULL;
+        }
+        ret = vu_gpio_realize_connect(gpio, errp);
+    } while (ret < 0 && retries--);
+
+    if (ret < 0) {
+        do_vhost_user_cleanup(vdev, gpio);
+    }
+
+    return;
+}
+
+static void vu_gpio_device_unrealize(DeviceState *dev)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(dev);
+
+    vu_gpio_set_status(vdev, 0);
+    qemu_chr_fe_set_handlers(&gpio->chardev, NULL, NULL, NULL, NULL, NULL, NULL,
+                             false);
+    vhost_dev_cleanup(&gpio->vhost_dev);
+    do_vhost_user_cleanup(vdev, gpio);
+}
+
+static const VMStateDescription vu_gpio_vmstate = {
+    .name = "vhost-user-gpio",
+    .unmigratable = 1,
+};
+
+static Property vu_gpio_properties[] = {
+    DEFINE_PROP_CHR("chardev", VHostUserGPIO, chardev),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void vu_gpio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, vu_gpio_properties);
+    dc->vmsd = &vu_gpio_vmstate;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+    vdc->realize = vu_gpio_device_realize;
+    vdc->unrealize = vu_gpio_device_unrealize;
+    vdc->get_features = vu_gpio_get_features;
+    vdc->get_config = vu_gpio_get_config;
+    vdc->set_status = vu_gpio_set_status;
+    vdc->guest_notifier_mask = vu_gpio_guest_notifier_mask;
+}
+
+static const TypeInfo vu_gpio_info = {
+    .name = TYPE_VHOST_USER_GPIO,
+    .parent = TYPE_VIRTIO_DEVICE,
+    .instance_size = sizeof(VHostUserGPIO),
+    .class_init = vu_gpio_class_init,
+};
+
+static void vu_gpio_register_types(void)
+{
+    type_register_static(&vu_gpio_info);
+}
+
+type_init(vu_gpio_register_types)
diff --git a/MAINTAINERS b/MAINTAINERS
index e1530b51a2..66d519fe35 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2098,6 +2098,13 @@ F: hw/virtio/vhost-user-rng-pci.c
 F: include/hw/virtio/vhost-user-rng.h
 F: tools/vhost-user-rng/*
 
+vhost-user-gpio
+M: Alex Bennée <alex.bennee@linaro.org>
+R: Viresh Kumar <viresh.kumar@linaro.org>
+S: Maintained
+F: hw/virtio/vhost-user-gpio.c
+F: include/hw/virtio/vhost-user-gpio.h
+
 virtio-crypto
 M: Gonglei <arei.gonglei@huawei.com>
 S: Supported
diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
index e9ecae1f50..cbfd8c7173 100644
--- a/hw/virtio/Kconfig
+++ b/hw/virtio/Kconfig
@@ -80,3 +80,8 @@ config VHOST_USER_FS
     bool
     default y
     depends on VIRTIO && VHOST_USER
+
+config VHOST_USER_GPIO
+    bool
+    default y
+    depends on VIRTIO && VHOST_USER
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 7e8877fd64..33c8e71fab 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -29,6 +29,7 @@ virtio_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng.c'))
+virtio_ss.add(when: 'CONFIG_VHOST_USER_GPIO', if_true: files('vhost-user-gpio.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 887ca7afa8..820dadc26c 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -144,3 +144,8 @@ virtio_mem_state_response(uint16_t state) "state=%" PRIu16
 virtio_pmem_flush_request(void) "flush request"
 virtio_pmem_response(void) "flush response"
 virtio_pmem_flush_done(int type) "fsync return=%d"
+
+# virtio-gpio.c
+virtio_gpio_start(void) "start"
+virtio_gpio_stop(void) "stop"
+virtio_gpio_set_status(uint8_t status) "0x%x"
-- 
MST


