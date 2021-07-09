Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB663C1EC0
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:05:05 +0200 (CEST)
Received: from localhost ([::1]:34446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ihE-0004u3-8t
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1m1icr-0007kM-PC
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 01:00:34 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:40908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1m1icp-0001rT-TB
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 01:00:33 -0400
Received: by mail-pg1-x530.google.com with SMTP id k20so1787957pgg.7
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 22:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p9Fy0zR/oY9ljMxigzCfbUSambW+z1dJgVvEjF1TVVQ=;
 b=XUEUN2c9LiPKnTKlSFqfsigdZWJfEKmiiKa8TjufU4O5ndiLwZda+KsZ4cQgLjJIKo
 dcA0zmbWNYV0S0jhT2d/eyB1oPCg1BDOhZ/pWo+8XcKh6a3Rbexpht58vgRX/BKK11P9
 XkrQMMHaDJeP6CyP66lvp1rZJx6KnAZx7dfsDW9AvvQGNs3NNRwY4692XgFt9bkXJPhy
 TsB8IqT4f+ZUuZLLEGl1IzSvms1hOSQj+HxLSTTPSIf6iKzb//mwHHFeVqI15sgp+BSt
 O5xxQMa55BMP4wDLwcZvn+/RwAhmHhcJXPqumQPEt2mvSGqJEGHVxyhIpLInQPB1L/Xn
 0JQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p9Fy0zR/oY9ljMxigzCfbUSambW+z1dJgVvEjF1TVVQ=;
 b=O/AE45HlNAYqF9BOwLbMWyNXox+WXJOj6xtT4C/jqCFniEksBrYCYwmv+oG72bpCE+
 TiHhzsB4K4Z9PjpYQpr+WJTE57rlme8WCi/VcTUBMQvmHZu84vskpuZ/ydYdNUL2QWaF
 uIgEjOlQ4b3Ce1Kh+XHw9+4zVgsnGhivjkW84rJD3JaHAPhQxGcYf8D+a0h3H+WlYqKO
 0I9BzmwR5LOLTX6ZsN24AbZVubpbnHRaN3MzlzvY7eLr+fEssZSa0GD7faTB4BwGvuii
 Mdl2+F4I0/D6hVPhhpSmNjMY5Y9RuvPHuybw/CdzicRVK2rvBmsfL/ujuE7S6FvyJOX4
 ORSw==
X-Gm-Message-State: AOAM5319rrr1j6Abj+xy7ywWMR1GbQsb8f6dAbY5k+lHyFx4CET58tFw
 CqUU6T1P5mtmrxRxcat91MO41itE1yt/JQ==
X-Google-Smtp-Source: ABdhPJym566D8wO2sjP03mKHabdfZXEJNuSn1c7+5PvoW+x5C+QPCR0yTaSqFinOpg9olmHKOF36Mg==
X-Received: by 2002:a63:ef44:: with SMTP id c4mr35313558pgk.162.1625806830636; 
 Thu, 08 Jul 2021 22:00:30 -0700 (PDT)
Received: from localhost ([106.201.108.2])
 by smtp.gmail.com with ESMTPSA id b33sm5098095pgb.92.2021.07.08.22.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 22:00:30 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH V2 2/3] hw/virtio: add vhost-user-i2c-pci boilerplate
Date: Fri,  9 Jul 2021 10:30:17 +0530
Message-Id: <8a083eaa57d93feaab12acd1f94b225879212f20.1625806763.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1625806763.git.viresh.kumar@linaro.org>
References: <cover.1625806763.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Jie Deng <jie.deng@intel.com>,
 Bill Mills <bill.mills@linaro.org>, Arnd Bergmann <arnd.bergmann@linaro.com>,
 Mike Holmes <mike.holmes@linaro.org>, stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows is to instantiate a vhost-user-i2c device as part of a PCI
bus. It is mostly boilerplate which looks pretty similar to the
vhost-user-fs-pci device.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 hw/virtio/meson.build          |  1 +
 hw/virtio/vhost-user-i2c-pci.c | 69 ++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 hw/virtio/vhost-user-i2c-pci.c

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 1a0d736a0db5..bc352a600911 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -26,6 +26,7 @@ virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-rng.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c.c'))
+virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_I2C'], if_true: files('vhost-user-i2c-pci.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
diff --git a/hw/virtio/vhost-user-i2c-pci.c b/hw/virtio/vhost-user-i2c-pci.c
new file mode 100644
index 000000000000..70b7b65fd970
--- /dev/null
+++ b/hw/virtio/vhost-user-i2c-pci.c
@@ -0,0 +1,69 @@
+/*
+ * Vhost-user i2c virtio device PCI glue
+ *
+ * Copyright (c) 2021 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/qdev-properties.h"
+#include "hw/virtio/vhost-user-i2c.h"
+#include "virtio-pci.h"
+
+struct VHostUserI2CPCI {
+    VirtIOPCIProxy parent_obj;
+    VHostUserI2C vdev;
+};
+
+typedef struct VHostUserI2CPCI VHostUserI2CPCI;
+
+#define TYPE_VHOST_USER_I2C_PCI "vhost-user-i2c-pci-base"
+
+DECLARE_INSTANCE_CHECKER(VHostUserI2CPCI, VHOST_USER_I2C_PCI,
+                         TYPE_VHOST_USER_I2C_PCI)
+
+static void vhost_user_i2c_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
+{
+    VHostUserI2CPCI *dev = VHOST_USER_I2C_PCI(vpci_dev);
+    DeviceState *vdev = DEVICE(&dev->vdev);
+
+    vpci_dev->nvectors = 1;
+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
+}
+
+static void vhost_user_i2c_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
+    PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
+    k->realize = vhost_user_i2c_pci_realize;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
+    pcidev_k->device_id = 0; /* Set by virtio-pci based on virtio id */
+    pcidev_k->revision = 0x00;
+    pcidev_k->class_id = PCI_CLASS_COMMUNICATION_OTHER;
+}
+
+static void vhost_user_i2c_pci_instance_init(Object *obj)
+{
+    VHostUserI2CPCI *dev = VHOST_USER_I2C_PCI(obj);
+
+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                TYPE_VHOST_USER_I2C);
+}
+
+static const VirtioPCIDeviceTypeInfo vhost_user_i2c_pci_info = {
+    .base_name = TYPE_VHOST_USER_I2C_PCI,
+    .non_transitional_name = "vhost-user-i2c-pci",
+    .instance_size = sizeof(VHostUserI2CPCI),
+    .instance_init = vhost_user_i2c_pci_instance_init,
+    .class_init = vhost_user_i2c_pci_class_init,
+};
+
+static void vhost_user_i2c_pci_register(void)
+{
+    virtio_pci_types_register(&vhost_user_i2c_pci_info);
+}
+
+type_init(vhost_user_i2c_pci_register);
-- 
2.31.1.272.g89b43f80a514


