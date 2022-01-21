Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 722D449620B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 16:28:13 +0100 (CET)
Received: from localhost ([::1]:45338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAvpj-0005BX-EZ
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 10:28:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nAvew-00075V-Sd
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:17:02 -0500
Received: from [2a00:1450:4864:20::634] (port=39547
 helo=mail-ej1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nAveq-0006LQ-Hn
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:17:02 -0500
Received: by mail-ej1-x634.google.com with SMTP id j2so967561ejk.6
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 07:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BucITeSyyjZi0hZHmrRnUdsDXe24bFhXp917kQA5h3U=;
 b=kZvuIVUcktxl2pne/87/86u3P3J9TvqVVCTfU0BCOuGBb5o3hoRUDLk0uXRhPKD+MF
 3T9jS305WFXOOexdwoS3hDN+qYX5qhjs69Z0NHosvOmSxuq0rFlngEf/YAiUVUfzRKQg
 ZnqF9VB5EoMNxU2ltyesvV+CihmWXKShRGnmxqT+8Vi5AExqHBqtU1/2mV871uvDpwaB
 NcuRM/laGWLwdi9dAjR87bCD7b7TLYeiXvCVHk0ESZRpNpHI09y06kGxWcl51WRWRGyh
 nWrq+9iSqVOaGIBQQ5x/ehtNo144DjWGC4BpmXyIAekQUFz9l4JOfW+mHbJU/kfpbm27
 /CFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BucITeSyyjZi0hZHmrRnUdsDXe24bFhXp917kQA5h3U=;
 b=o/HVdOjwj5LiX3zoKN63GP4avKxaA6UOhO7s9GnrEqZ/fnAJ8WdFc9FCwgzfgFQ+Eg
 PWEIHwx68oY5yfQKBuTt6Lv3jBRm+9ltBMsnZIzwcF3f/ArVnOPsC73cnf5AnUWPczaw
 r8suUOGwQVuqIlpCymeOi1Cw3yv/cLda33GzNQqH7+N3Y2btuB1F1mOyxnbEEom74zHW
 Zo7x4Wyo8fPAeACYiUvH2qJqDw5R8VHIGJPrCGEQj3+qjRJLM9P13wF+HzRX74W8winq
 1k52CYkbcxCyV7shWwCL24fMPzkm+FgFSznUq49D/4YaMOMaC0wCeKqWW7pDcoZsnzpV
 UQGA==
X-Gm-Message-State: AOAM532fk9Pxnncp+4aWHd8Kz4AD/T3apjHF+QjV94moa3jqXVDoVrTL
 AkrOFf50O8A5BLUPDf6Ix2JpSg==
X-Google-Smtp-Source: ABdhPJxVVAUg7raBQFg1DfFGqdMUwmiWvDWb2qrwnp2rHVFU9LhMToorMIpU9SHJwVCQzV1TN/2ufQ==
X-Received: by 2002:a17:907:3d8e:: with SMTP id
 he14mr3647912ejc.472.1642778141090; 
 Fri, 21 Jan 2022 07:15:41 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a27sm2715631edj.17.2022.01.21.07.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 07:15:38 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 554A71FFB7;
 Fri, 21 Jan 2022 15:15:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] tests/qtest: attempt to enable tests for virtio-gpio
 (!working)
Date: Fri, 21 Jan 2022 15:15:34 +0000
Message-Id: <20220121151534.3654562-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220120040234.ehcjcdr6wrvlz3yc@vireshk-i7>
References: <20220120040234.ehcjcdr6wrvlz3yc@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::634
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't have a virtio-gpio implementation in QEMU and only
support a vhost-user backend. The QEMU side of the code is minimal so
it should be enough to instantiate the device and pass some vhost-user
messages over the control socket. To do this we hook into the existing
vhost-user-test code and just add the bits required for gpio.

Based-on: 20220118203833.316741-1-eric.auger@redhat.com
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>

---

This goes as far as to add things to the QOS tree but so far it's
failing to properly start QEMU with the chardev socket needed to
communicate between the mock vhost-user daemon and QEMU itself.
---
 tests/qtest/libqos/virtio-gpio.h | 34 +++++++++++
 tests/qtest/libqos/virtio-gpio.c | 98 ++++++++++++++++++++++++++++++++
 tests/qtest/vhost-user-test.c    | 34 +++++++++++
 tests/qtest/libqos/meson.build   |  1 +
 4 files changed, 167 insertions(+)
 create mode 100644 tests/qtest/libqos/virtio-gpio.h
 create mode 100644 tests/qtest/libqos/virtio-gpio.c

diff --git a/tests/qtest/libqos/virtio-gpio.h b/tests/qtest/libqos/virtio-gpio.h
new file mode 100644
index 0000000000..abe6967ae9
--- /dev/null
+++ b/tests/qtest/libqos/virtio-gpio.h
@@ -0,0 +1,34 @@
+/*
+ * virtio-gpio structures
+ *
+ * Copyright (c) 2022 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef TESTS_LIBQOS_VIRTIO_GPIO_H
+#define TESTS_LIBQOS_VIRTIO_GPIO_H
+
+#include "qgraph.h"
+#include "virtio.h"
+#include "virtio-pci.h"
+
+typedef struct QVhostUserGPIO QVhostUserGPIO;
+typedef struct QVhostUserGPIOPCI QVhostUserGPIOPCI;
+typedef struct QVhostUserGPIODevice QVhostUserGPIODevice;
+
+struct QVhostUserGPIO {
+    QVirtioDevice *vdev;
+};
+
+struct QVhostUserGPIOPCI {
+    QVirtioPCIDevice pci_vdev;
+    QVhostUserGPIO gpio;
+};
+
+struct QVhostUserGPIODevice {
+    QOSGraphObject obj;
+    QVhostUserGPIO gpio;
+};
+
+#endif
diff --git a/tests/qtest/libqos/virtio-gpio.c b/tests/qtest/libqos/virtio-gpio.c
new file mode 100644
index 0000000000..62c8074777
--- /dev/null
+++ b/tests/qtest/libqos/virtio-gpio.c
@@ -0,0 +1,98 @@
+/*
+ * virtio-gpio nodes for testing
+ *
+ * Copyright (c) 2022 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest.h"
+#include "qemu/module.h"
+#include "qgraph.h"
+#include "virtio-gpio.h"
+
+static void *qvirtio_gpio_get_driver(QVhostUserGPIO *v_gpio,
+                                       const char *interface)
+{
+    if (!g_strcmp0(interface, "vhost-user-gpio")) {
+        return v_gpio;
+    }
+    if (!g_strcmp0(interface, "virtio")) {
+        return v_gpio->vdev;
+    }
+
+    fprintf(stderr, "%s not present in virtio-gpio-device\n", interface);
+    g_assert_not_reached();
+}
+
+static void *qvirtio_gpio_device_get_driver(void *object,
+                                              const char *interface)
+{
+    QVhostUserGPIODevice *v_gpio = object;
+    return qvirtio_gpio_get_driver(&v_gpio->gpio, interface);
+}
+
+static void *virtio_gpio_device_create(void *virtio_dev,
+                                         QGuestAllocator *t_alloc,
+                                         void *addr)
+{
+    QVhostUserGPIODevice *virtio_device = g_new0(QVhostUserGPIODevice, 1);
+    QVhostUserGPIO *interface = &virtio_device->gpio;
+
+    interface->vdev = virtio_dev;
+
+    virtio_device->obj.get_driver = qvirtio_gpio_device_get_driver;
+
+    return &virtio_device->obj;
+}
+
+/* virtio-gpio-pci */
+static void *qvirtio_gpio_pci_get_driver(void *object, const char *interface)
+{
+    QVhostUserGPIOPCI *v_gpio = object;
+    if (!g_strcmp0(interface, "pci-device")) {
+        return v_gpio->pci_vdev.pdev;
+    }
+    return qvirtio_gpio_get_driver(&v_gpio->gpio, interface);
+}
+
+static void *virtio_gpio_pci_create(void *pci_bus, QGuestAllocator *t_alloc,
+                                      void *addr)
+{
+    QVhostUserGPIOPCI *virtio_spci = g_new0(QVhostUserGPIOPCI, 1);
+    QVhostUserGPIO *interface = &virtio_spci->gpio;
+    QOSGraphObject *obj = &virtio_spci->pci_vdev.obj;
+
+    virtio_pci_init(&virtio_spci->pci_vdev, pci_bus, addr);
+    interface->vdev = &virtio_spci->pci_vdev.vdev;
+
+    obj->get_driver = qvirtio_gpio_pci_get_driver;
+
+    return obj;
+}
+
+static void virtio_gpio_register_nodes(void)
+{
+    QPCIAddress addr = {
+        .devfn = QPCI_DEVFN(4, 0),
+    };
+
+    QOSGraphEdgeOptions edge_opts = { };
+
+    /* vhost-user-gpio-device */
+    edge_opts.extra_device_opts = "id=gpio0,chardev=vhgpio0";
+    qos_node_create_driver("vhost-user-gpio-device",
+                            virtio_gpio_device_create);
+    qos_node_consumes("vhost-user-gpio-device", "virtio-bus", &edge_opts);
+    qos_node_produces("vhost-user-gpio-device", "vhost-user-gpio");
+
+    /* virtio-gpio-pci */
+    edge_opts.extra_device_opts = "id=gpio0,addr=04.0,chardev=vhgpio0";
+    add_qpci_address(&edge_opts, &addr);
+    qos_node_create_driver("vhost-user-gpio-pci", virtio_gpio_pci_create);
+    qos_node_consumes("vhost-user-gpio-pci", "pci-bus", &edge_opts);
+    qos_node_produces("vhost-user-gpio-pci", "vhost-user-gpio");
+}
+
+libqos_init(virtio_gpio_register_nodes);
diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index ee30f54796..4f8789424b 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -43,6 +43,7 @@
                         " -numa node,memdev=mem"
 #define QEMU_CMD_CHR    " -chardev socket,id=%s,path=%s%s"
 #define QEMU_CMD_NETDEV " -netdev vhost-user,id=hs0,chardev=%s,vhostforce=on"
+#define QEMU_CMD_GPIO   " -device vhost-user-gpio-pci,id=gpio0,chardev=%s,vhostforce=on"
 
 #define HUGETLBFS_MAGIC       0x958458f6
 
@@ -137,6 +138,7 @@ enum {
 
 enum {
     VHOST_USER_NET,
+    VHOST_USER_GPIO,
 };
 
 typedef struct TestServer {
@@ -194,6 +196,14 @@ static void append_vhost_net_opts(TestServer *s, GString *cmd_line,
                            chr_opts, s->chr_name);
 }
 
+static void append_vhost_gpio_opts(TestServer *s, GString *cmd_line,
+                             const char *chr_opts)
+{
+    g_string_append_printf(cmd_line, QEMU_CMD_CHR QEMU_CMD_GPIO,
+                           s->chr_name, s->socket_path,
+                           chr_opts, s->chr_name);
+}
+
 static void append_mem_opts(TestServer *server, GString *cmd_line,
                             int size, enum test_memfd memfd)
 {
@@ -1014,3 +1024,27 @@ static void register_vhost_user_test(void)
                  test_multiqueue, &opts);
 }
 libqos_init(register_vhost_user_test);
+
+static struct vhost_user_ops g_vu_gpio_ops = {
+    .type = VHOST_USER_GPIO,
+
+    .append_opts = append_vhost_gpio_opts,
+
+    .set_features = vu_net_set_features,
+    .get_protocol_features = vu_net_get_protocol_features,
+};
+
+static void register_vhost_gpio_test(void)
+{
+    QOSGraphTestOptions opts = {
+        .before = vhost_user_test_setup,
+        .subprocess = true,
+        .arg = &g_vu_gpio_ops,
+    };
+
+    qemu_add_opts(&qemu_chardev_opts);
+
+    qos_add_test("read-guest-mem/memfile",
+                 "vhost-user-gpio", test_read_guest_mem, &opts);
+}
+libqos_init(register_vhost_gpio_test);
diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
index 8c8ee15553..f581330d8b 100644
--- a/tests/qtest/libqos/meson.build
+++ b/tests/qtest/libqos/meson.build
@@ -42,6 +42,7 @@ libqos_srcs = files('../libqtest.c',
         'virtio-scsi.c',
         'virtio-serial.c',
         'virtio-iommu.c',
+        'virtio-gpio.c',
         'generic-pcihost.c',
 
         # qgraph machines:
-- 
2.30.2


