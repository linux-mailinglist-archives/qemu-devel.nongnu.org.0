Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93E65FA306
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 19:57:08 +0200 (CEST)
Received: from localhost ([::1]:33158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohx1X-0000Zs-Ca
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 13:57:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwav-0000qy-9E
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:29:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwan-0006Y2-RH
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:29:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665422969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8FzTRqu6X76Q9LWCqleedY0GTIZa238RHANVu9yOyt8=;
 b=Q1ByyL9rTSpWWx+E02x/zruXf4ZiREt2mAdPFJHl1EZEk3+0NVzGLNn5MuDJB8G9N4HWhM
 ikgl8arNHfmYkumx975AJG2bdDydUp8k6gq6SJQCRggp5tASumhksFVcPbnY3s/2tud8Ay
 scLKwypOuBZ4/HsuHd7U9/7Sb8Zjij4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-176-drUkLtInMXCm52P2XPdnTQ-1; Mon, 10 Oct 2022 13:29:27 -0400
X-MC-Unique: drUkLtInMXCm52P2XPdnTQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 d22-20020adfa356000000b0022e224b21c0so2950599wrb.9
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8FzTRqu6X76Q9LWCqleedY0GTIZa238RHANVu9yOyt8=;
 b=JE5yWs2/9STMLsKcq953bX3rwEIg+4r723TjDVuGRaBodFsAnWTces3bHE5jsWZvI6
 0J578R8/WzoLHCGjGJ6wSXAcvk7DHMez/G8Su5Au5HfrL58quEmi/6WOPZ8xbMVe/wuQ
 nw1R4JmRsbyfaVyr4lKwUvkgLUlhBBB78vZlxeQScpFXfKg6wCxwqm01vkDJ899jGBen
 tuHXEgAvMgSnk+CtNe67RQdCijl1264ViekjeXdjsY0N/9x2jVq4VyY2RyEmXaIVdzMv
 yOSKZhg2PAxVYeRXwyT+xGMyfSZZa+j+ujLVD7Ky9/IPnpLnGzi8XL9Cgo/06UXKttkd
 hA+w==
X-Gm-Message-State: ACrzQf0DPxwq3Oa9Zkdnj9AfTPO9rjbec6Ug/KeWbAP8dZkc9A4L8qAK
 GMaUnWupH+kF2c7iUp8mQCQjz4BZ5asVXoW0dkEArUxc6HUdh0HSCuSLiB4t+r00hs98tnpn4HP
 GkKG593CKKxrjLaw2npJfD4Mh/IqlREZZ+foyxX9L1XU7stQ7I4PNeyN77LWG
X-Received: by 2002:a5d:64c2:0:b0:22e:41b0:42ca with SMTP id
 f2-20020a5d64c2000000b0022e41b042camr12556947wri.411.1665422965110; 
 Mon, 10 Oct 2022 10:29:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4XDPkr3lK2mCtLj2f9Q77EsTw1E+YAJvHIH15YhPodr5ztAFZNTD7hpAkh5QCGx6g0p4eHag==
X-Received: by 2002:a5d:64c2:0:b0:22e:41b0:42ca with SMTP id
 f2-20020a5d64c2000000b0022e41b042camr12556929wri.411.1665422964744; 
 Mon, 10 Oct 2022 10:29:24 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 i18-20020a5d5592000000b0021e51c039c5sm9460696wrv.80.2022.10.10.10.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:29:24 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:29:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 10/55] hw/virtio: add vhost-user-gpio-pci boilerplate
Message-ID: <20221010172813.204597-11-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

This allows is to instantiate a vhost-user-gpio device as part of a PCI
bus. It is mostly boilerplate which looks pretty similar to the
vhost-user-fs-pci device.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <5f560cab92d0d789b1c94295ec74b9952907d69d.1641987128.git.viresh.kumar@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Message-Id: <20220802095010.3330793-14-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-user-gpio-pci.c | 69 +++++++++++++++++++++++++++++++++
 MAINTAINERS                     |  2 +-
 hw/virtio/meson.build           |  1 +
 3 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 hw/virtio/vhost-user-gpio-pci.c

diff --git a/hw/virtio/vhost-user-gpio-pci.c b/hw/virtio/vhost-user-gpio-pci.c
new file mode 100644
index 0000000000..b3028a24a1
--- /dev/null
+++ b/hw/virtio/vhost-user-gpio-pci.c
@@ -0,0 +1,69 @@
+/*
+ * Vhost-user gpio virtio device PCI glue
+ *
+ * Copyright (c) 2022 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/qdev-properties.h"
+#include "hw/virtio/vhost-user-gpio.h"
+#include "hw/virtio/virtio-pci.h"
+
+struct VHostUserGPIOPCI {
+    VirtIOPCIProxy parent_obj;
+    VHostUserGPIO vdev;
+};
+
+typedef struct VHostUserGPIOPCI VHostUserGPIOPCI;
+
+#define TYPE_VHOST_USER_GPIO_PCI "vhost-user-gpio-pci-base"
+
+DECLARE_INSTANCE_CHECKER(VHostUserGPIOPCI, VHOST_USER_GPIO_PCI,
+                         TYPE_VHOST_USER_GPIO_PCI)
+
+static void vhost_user_gpio_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
+{
+    VHostUserGPIOPCI *dev = VHOST_USER_GPIO_PCI(vpci_dev);
+    DeviceState *vdev = DEVICE(&dev->vdev);
+
+    vpci_dev->nvectors = 1;
+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
+}
+
+static void vhost_user_gpio_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
+    PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
+    k->realize = vhost_user_gpio_pci_realize;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
+    pcidev_k->device_id = 0; /* Set by virtio-pci based on virtio id */
+    pcidev_k->revision = 0x00;
+    pcidev_k->class_id = PCI_CLASS_COMMUNICATION_OTHER;
+}
+
+static void vhost_user_gpio_pci_instance_init(Object *obj)
+{
+    VHostUserGPIOPCI *dev = VHOST_USER_GPIO_PCI(obj);
+
+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                TYPE_VHOST_USER_GPIO);
+}
+
+static const VirtioPCIDeviceTypeInfo vhost_user_gpio_pci_info = {
+    .base_name = TYPE_VHOST_USER_GPIO_PCI,
+    .non_transitional_name = "vhost-user-gpio-pci",
+    .instance_size = sizeof(VHostUserGPIOPCI),
+    .instance_init = vhost_user_gpio_pci_instance_init,
+    .class_init = vhost_user_gpio_pci_class_init,
+};
+
+static void vhost_user_gpio_pci_register(void)
+{
+    virtio_pci_types_register(&vhost_user_gpio_pci_info);
+}
+
+type_init(vhost_user_gpio_pci_register);
diff --git a/MAINTAINERS b/MAINTAINERS
index 66d519fe35..beccce4a7a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2102,7 +2102,7 @@ vhost-user-gpio
 M: Alex Bennée <alex.bennee@linaro.org>
 R: Viresh Kumar <viresh.kumar@linaro.org>
 S: Maintained
-F: hw/virtio/vhost-user-gpio.c
+F: hw/virtio/vhost-user-gpio*
 F: include/hw/virtio/vhost-user-gpio.h
 
 virtio-crypto
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 33c8e71fab..c14e3db10a 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -30,6 +30,7 @@ virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_GPIO', if_true: files('vhost-user-gpio.c'))
+virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_GPIO'], if_true: files('vhost-user-gpio-pci.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
-- 
MST


