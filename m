Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BF048C38B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 12:51:27 +0100 (CET)
Received: from localhost ([::1]:53646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7c9w-0002X0-KW
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 06:51:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1n7buI-0005ex-0s
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:35:10 -0500
Received: from [2607:f8b0:4864:20::102f] (port=46607
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1n7buF-0004Ok-Lc
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:35:09 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 rj2-20020a17090b3e8200b001b1944bad25so4119469pjb.5
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zNXGFvqhDmxPvRAJNqSTR29nzHFsKVuDdG+p2nqmL9k=;
 b=MVWWS2bUfXpNhAuCu04i54HYpQpwnM/KmXpvLwn0U3SsHc5RXlZ7csS7JTOK5XfDLL
 7susqTcAuQpYlIHZW47ebcgFRBuJZ0JbHXUaczlV8ccjs0AOw/9MC/9CFrC1WnioIiJb
 Al67QD3sGjAXP5iD6POBeY4w9n6DIKDoMO5Gy2fcdZSRNcKXKkRg03JxxhqiH6zrQ9km
 4vyEPUtU7UL9YSsGdjrfN1WQ239DvOW1hc+cNtP1M6zzzLQ5gQ2GZnzt76FBz7tl64tH
 dzNOoNGW0TSC6d3V5mvDJfPvLFno0muqR5gJtekDBCgk0spZjWZsvCCXGEeWi0VmGToN
 Qf0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zNXGFvqhDmxPvRAJNqSTR29nzHFsKVuDdG+p2nqmL9k=;
 b=I7ciyepSTym71XplC3ovBe3w92HfZPfexkBuTYbckQw/gIbOtVXt//zLZRRm2LRyXC
 YpbOvvJnfiTGVEoN/f9a3bqrQM4mXGQ51OVTWb1RzIMPRNNrzxcQi1mQ0yTBv9eZputp
 wpah30jXTQTGQHiCOWKkb/wSBhdzNM1gwIj1TN0gf8Bvxhm20Pj2Ek0Kv2fvI6lqctUS
 7ZFJciHTkI/ZnDCKQK3vDB/nO1Lls3u/fJpi/jyFjqPVcKx4j0dY+m7EB+qcq5pjqKlY
 to4zF8hBxGl1WKSQ+xgPsndiGZ/SmGg9uJk+M7l0N7t7xki6V27BnaEqMF02l4J6EkA7
 EjYg==
X-Gm-Message-State: AOAM531UysNpqGPfCr8rS4WG8ntjVDY7wrJnFpDxd+l72VEwWmdiBmAK
 bTq0vr8OLLCpfX1UVv+WSKUnX/k/HEz1Jw==
X-Google-Smtp-Source: ABdhPJypO8gpyMPh0i3bQlwf0cTyBCVg1b7wbB0SQ1P62UaOg9aaDzYuLyJpbjC5mCM0I4x/RhJjpQ==
X-Received: by 2002:a17:902:b110:b0:14a:197:dfea with SMTP id
 q16-20020a170902b11000b0014a0197dfeamr8824608plr.142.1641987305825; 
 Wed, 12 Jan 2022 03:35:05 -0800 (PST)
Received: from localhost ([122.171.221.63])
 by smtp.gmail.com with ESMTPSA id s6sm5315331pjp.19.2022.01.12.03.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:35:05 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH 1/2] hw/virtio: add boilerplate for vhost-user-gpio device
Date: Wed, 12 Jan 2022 17:04:58 +0530
Message-Id: <5390324a748194a21bc99b1538e19761a8c64092.1641987128.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1641987128.git.viresh.kumar@linaro.org>
References: <cover.1641987128.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This creates the QEMU side of the vhost-user-gpio device which connects
to the remote daemon. It is based of vhost-user-i2c code.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 hw/virtio/Kconfig                   |   5 +
 hw/virtio/meson.build               |   1 +
 hw/virtio/vhost-user-gpio.c         | 343 ++++++++++++++++++++++++++++
 include/hw/virtio/vhost-user-gpio.h |  35 +++
 4 files changed, 384 insertions(+)
 create mode 100644 hw/virtio/vhost-user-gpio.c
 create mode 100644 include/hw/virtio/vhost-user-gpio.h

diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
index c144d42f9bd0..b16a63609530 100644
--- a/hw/virtio/Kconfig
+++ b/hw/virtio/Kconfig
@@ -59,6 +59,11 @@ config VIRTIO_MEM
     depends on VIRTIO_MEM_SUPPORTED
     select MEM_DEVICE
 
+config VHOST_USER_GPIO
+    bool
+    default y
+    depends on VIRTIO && VHOST_USER
+
 config VHOST_USER_I2C
     bool
     default y
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 521f7d64a86a..c7e67adff337 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -29,6 +29,7 @@ virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c.c'))
 virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_I2C'], if_true: files('vhost-user-i2c-pci.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng.c'))
 virtio_ss.add(when: ['CONFIG_VHOST_USER_RNG', 'CONFIG_VIRTIO_PCI'], if_true: files('vhost-user-rng-pci.c'))
+virtio_ss.add(when: 'CONFIG_VHOST_USER_GPIO', if_true: files('vhost-user-gpio.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
new file mode 100644
index 000000000000..c5f67c0104a9
--- /dev/null
+++ b/hw/virtio/vhost-user-gpio.c
@@ -0,0 +1,343 @@
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
+
+static const int feature_bits[] = {
+    VIRTIO_GPIO_F_IRQ
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
+    int ret, i;
+
+    if (!k->set_guest_notifiers) {
+        error_report("binding does not support guest notifiers");
+        return -ENOSYS;
+    }
+
+    ret = vhost_dev_enable_notifiers(&gpio->vhost_dev, vdev);
+    if (ret < 0) {
+        error_report("Error enabling host notifiers: %d", ret);
+        return ret;
+    }
+
+    ret = k->set_guest_notifiers(qbus->parent, gpio->vhost_dev.nvqs, true);
+    if (ret < 0) {
+        error_report("Error binding guest notifier: %d", ret);
+        goto err_host_notifiers;
+    }
+
+    gpio->vhost_dev.acked_features = vdev->guest_features;
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
+    return 0;
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
+    int ret;
+
+    if (!k->set_guest_notifiers) {
+        return;
+    }
+
+    vhost_dev_stop(&gpio->vhost_dev, vdev);
+
+    ret = k->set_guest_notifiers(qbus->parent, gpio->vhost_dev.nvqs, false);
+    if (ret < 0) {
+        error_report("vhost guest notifier cleanup failed: %d", ret);
+        return;
+    }
+
+    vhost_dev_disable_notifiers(&gpio->vhost_dev, vdev);
+}
+
+static void vu_gpio_set_status(VirtIODevice *vdev, uint8_t status)
+{
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
+    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
+
+    if (!vdev->vm_running) {
+        should_start = false;
+    }
+
+    if (!gpio->connected) {
+        return;
+    }
+
+    if (gpio->vhost_dev.started == should_start) {
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
+static uint64_t vu_gpio_get_features(VirtIODevice *vdev,
+                                    uint64_t requested_features, Error **errp)
+{
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
+
+    virtio_add_feature(&requested_features, VIRTIO_GPIO_F_IRQ);
+    return vhost_get_features(&gpio->vhost_dev, feature_bits, requested_features);
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
+static int vu_gpio_connect(DeviceState *dev)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
+    Error *local_err = NULL;
+    int ret;
+
+    if (gpio->connected) {
+        return 0;
+    }
+    gpio->connected = true;
+
+    vhost_dev_set_config_notifier(&gpio->vhost_dev, &gpio_ops);
+
+    ret = vhost_dev_init(&gpio->vhost_dev, &gpio->vhost_user,
+                         VHOST_BACKEND_TYPE_USER, 0, &local_err);
+    if (ret < 0) {
+        error_report("vhost-user-gpio: vhost initialization failed: %s",
+                     strerror(-ret));
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
+
+    switch (event) {
+    case CHR_EVENT_OPENED:
+        if (vu_gpio_connect(dev) < 0) {
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
+static void vu_gpio_device_realize(DeviceState *dev, Error **errp)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(dev);
+    Error *err = NULL;
+    int ret;
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
+    virtio_init(vdev, "vhost-user-gpio", VIRTIO_ID_GPIO, sizeof(gpio->config));
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
+reconnect:
+    if (qemu_chr_fe_wait_connected(&gpio->chardev, &err) < 0) {
+        error_report_err(err);
+        do_vhost_user_cleanup(vdev, gpio);
+        return;
+    }
+
+    /* check whether vhost_user_gpio_connect() failed or not */
+    if (!gpio->connected) {
+        goto reconnect;
+    }
+
+    ret = vhost_dev_get_config(&gpio->vhost_dev, (uint8_t *)&gpio->config,
+                               sizeof(gpio->config), errp);
+    if (ret < 0) {
+        error_report("vhost-user-gpio: get config failed");
+        goto reconnect;
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
diff --git a/include/hw/virtio/vhost-user-gpio.h b/include/hw/virtio/vhost-user-gpio.h
new file mode 100644
index 000000000000..afeb56f53e99
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
+    VirtIODevice parent;
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
-- 
2.31.1.272.g89b43f80a514


