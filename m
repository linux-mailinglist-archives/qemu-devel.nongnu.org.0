Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BD83C798C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:21:05 +0200 (CEST)
Received: from localhost ([::1]:37326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Qm0-0003cT-GR
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3Qc5-0007Sr-ED
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:10:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3Qc3-0007yY-B3
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:10:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626214246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pGNVy1FELi8qpaAI6ieUTmFEXCRocQuU2XFIwFNetIA=;
 b=T4vgEuT9A9m9tx5IJ9CweyKTLP47jC4sxVjDF8m4zTTqJED7dKuSdMAjYqvx23Jl15sUPF
 JUbyR8c8zkp7w/g4ilIFn3hP3xwsDXB1KTlkIaOdb0egH+tW+VQWwiDJfPXAWg3NjsubxA
 FpF3jVGTkP1xtXOju4InA041f/svHqk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-Fhy54vN6NUGF8lJE5qY-tQ-1; Tue, 13 Jul 2021 18:10:45 -0400
X-MC-Unique: Fhy54vN6NUGF8lJE5qY-tQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 i7-20020a05600c3547b0290229a389ceb2so948532wmq.0
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pGNVy1FELi8qpaAI6ieUTmFEXCRocQuU2XFIwFNetIA=;
 b=CBnSYxMmxFjvtR33/a+s68ouS3WihaJ5n1kOsjF8JPI+3tifMWEXTzcWHD1i3MmO5k
 L+dLz2+L7HV7u0kHQ18pYQnCiqC4SQd8ipJzPr3yJ+vL9Qr3irwkWokk2w0t2CwsRlbH
 4tK8K/huGmZRVz2nc6alzishem38CR+zuos2DOKa1qfSci/TVWxQoUiUFsUR2YlwFPdM
 z6HF999MX+PB6WNoEGQLdHnNaQHj0iLStcvsTi5AUFLVywsQE4DBCwXnCYGvcsN5Q/Ha
 jbtMkgoYQWzK9sFphobb6KhBnS5L6n45wtKDulp/ZHei9xqxknhWwpPF7jFPhXbVavPs
 c7fg==
X-Gm-Message-State: AOAM533TtupQ/Cgr2b3Okkxzf6KUo0FZswmMHiMSnRYMpyfQISZrXJoB
 p8CycNQ00R4cn8bNiIVrfhVbRzh9CWuAYDt287yL676MjmWSmmfgf9AOKoTjcwO62LYSHEdvXK2
 IpHwrRAQ5VCQDq97Wjaz+BqRGi2IQVJsZz8nW7CBF68jdeuEK3e2MhS1oKkld
X-Received: by 2002:a5d:6804:: with SMTP id w4mr8365540wru.417.1626214243818; 
 Tue, 13 Jul 2021 15:10:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtFqUSpxjemS90mOp60GTDvrKlEl5h7op4sTcM69V9cpukYGvEcui1lfjRIqqLtH1qYphw+Q==
X-Received: by 2002:a5d:6804:: with SMTP id w4mr8365517wru.417.1626214243579; 
 Tue, 13 Jul 2021 15:10:43 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id d18sm237257wmp.46.2021.07.13.15.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:10:43 -0700 (PDT)
Date: Tue, 13 Jul 2021 18:10:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/23] hw/virtio: add vhost-user-i2c-pci boilerplate
Message-ID: <20210713220946.212562-13-mst@redhat.com>
References: <20210713220946.212562-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210713220946.212562-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Viresh Kumar <viresh.kumar@linaro.org>

This allows is to instantiate a vhost-user-i2c device as part of a PCI
bus. It is mostly boilerplate which looks pretty similar to the
vhost-user-fs-pci device.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Message-Id: <8a083eaa57d93feaab12acd1f94b225879212f20.1625806763.git.viresh.kumar@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-user-i2c-pci.c | 69 ++++++++++++++++++++++++++++++++++
 hw/virtio/meson.build          |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 hw/virtio/vhost-user-i2c-pci.c

diff --git a/hw/virtio/vhost-user-i2c-pci.c b/hw/virtio/vhost-user-i2c-pci.c
new file mode 100644
index 0000000000..70b7b65fd9
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
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 948e668ed3..08629c8f2c 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -28,6 +28,7 @@ virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng.c'))
 virtio_ss.add(when: ['CONFIG_VHOST_USER_RNG', 'CONFIG_VIRTIO_PCI'], if_true: files('vhost-user-rng-pci.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c.c'))
+virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_I2C'], if_true: files('vhost-user-i2c-pci.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
-- 
MST


