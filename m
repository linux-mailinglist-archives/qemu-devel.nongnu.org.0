Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A5A4D34F2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 17:53:05 +0100 (CET)
Received: from localhost ([::1]:39786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRzYd-0000uc-AN
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 11:53:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRzVM-0007jw-Sj
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 11:49:45 -0500
Received: from [2a00:1450:4864:20::433] (port=34472
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRzVK-000722-Cs
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 11:49:39 -0500
Received: by mail-wr1-x433.google.com with SMTP id j26so4038316wrb.1
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 08:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=COcIPdR9Saci6AcvepJx0SCsAa20ptMZ/w1MAI5QkHE=;
 b=h2DytWJxOOlXQfR+nyflfz5zTVpz05yg1jkEwguMFkQZyROd2iNq2CMJlHt2nELugQ
 KevvFjHO32HsLXWYrZn7kBkfshSEDoO+DZWe/YMgBOaRV1mrlUP8Ohn0hI+9Y9fyePZ2
 JyfTjyAS9CrqUAhMJcNNhJF1ZYASrra0qN96oG9fKhkQjeVnfAbi1uDmRS6Lak8X8o9x
 brnqZghhkUrHBAVBJpJZ1G45RQEk2/WrO5KMKVbmN1q0R4Phnky+gPTAsi7Mx94h29cx
 18y5XHLYNoZSCmaVUJYOk09vZqkuJwUJY8cjbA5JOKt9ons2rzPbiB1hYV4cgjeQhnQq
 h7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=COcIPdR9Saci6AcvepJx0SCsAa20ptMZ/w1MAI5QkHE=;
 b=Dt3d86S8UOPGU6wEb6IY9gQaWGNBNlRf5hXiCfnqEU/E6bWJBOZQjpaOoanmtdggaT
 x/36q1xs++R5pC7Nt8JHkfxsOrdriFk/ODrRm1f/uJoFwzjSDwbuumMO+iMQEifRgiT0
 Be8/piGEqPAQ2xNRX4bT8QmnSLPNGXmtj9akcu0G0ef2zFBMmXWs6kAwEFy9xOWZfZaL
 f2h5CR7tSsbvaLb4HsrG9Dra4RVw/VfFDshEQFEND1ip8pLvYQH3522IQ4jAIreXjfcK
 M1slKlJHTXWhexgoJ6MAVQ7ODFQPIUXaQSFvCw1M6wZ38NDEIOQa6+pfDuOGh5n54qtx
 N4VA==
X-Gm-Message-State: AOAM532kDPuG5Z9ULzC0MqEsPTpt7rV/ET+ylFt60PJvN0cJy9pklS5b
 yteQOOho8p3zK2qNKQS02lF4mg==
X-Google-Smtp-Source: ABdhPJyEhSCDKqW7Mh8Ru5VniY9i3X6E7UisaoNvZqy1CdrNZaxosr+pcX9S80O1BozpVy71ZXnA9A==
X-Received: by 2002:a05:6000:2ca:b0:1f1:e692:9986 with SMTP id
 o10-20020a05600002ca00b001f1e6929986mr389223wry.427.1646844576105; 
 Wed, 09 Mar 2022 08:49:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a05600c4f4e00b0038181486018sm2555152wmq.40.2022.03.09.08.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 08:49:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 486D61FFB7;
 Wed,  9 Mar 2022 16:49:34 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] docs/devel: start documenting writing VirtIO devices
Date: Wed,  9 Mar 2022 16:49:29 +0000
Message-Id: <20220309164929.19395-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While writing my own VirtIO devices I've gotten confused with how
things are structured and what sort of shared infrastructure there is.
If we can document how everything is supposed to work we can then
maybe start cleaning up inconsistencies in the code.

Based-on: 20220309135355.4149689-1-alex.bennee@linaro.org
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 docs/devel/index-internals.rst |   2 +-
 docs/devel/virtio-backends.rst | 139 +++++++++++++++++++++++++++++++++
 2 files changed, 140 insertions(+), 1 deletion(-)
 create mode 100644 docs/devel/virtio-backends.rst

diff --git a/docs/devel/index-internals.rst b/docs/devel/index-internals.rst
index 78270e89b3..5d9f95dd93 100644
--- a/docs/devel/index-internals.rst
+++ b/docs/devel/index-internals.rst
@@ -19,4 +19,4 @@ Details about QEMU's various subsystems including how to add features to them.
    tracing
    vfio-migration
    writing-monitor-commands
-      
+   virtio-backends
diff --git a/docs/devel/virtio-backends.rst b/docs/devel/virtio-backends.rst
new file mode 100644
index 0000000000..230538f46b
--- /dev/null
+++ b/docs/devel/virtio-backends.rst
@@ -0,0 +1,139 @@
+..
+   Copyright (c) 2022, Linaro Limited
+   Written by Alex Bennée
+
+Writing VirtIO backends for QEMU
+================================
+
+This document attempts to outline the information a developer needs to
+know to write backends for QEMU. It is specifically focused on
+implementing VirtIO devices.
+
+Front End Transports
+--------------------
+
+VirtIO supports a number of different front end transports. The
+details of the device remain the same but there are differences in
+command line for specifying the device (e.g. -device virtio-foo
+and -device virtio-foo-pci). For example:
+
+.. code:: c
+
+  static const TypeInfo vhost_user_blk_info = {
+      .name = TYPE_VHOST_USER_BLK,
+      .parent = TYPE_VIRTIO_DEVICE,
+      .instance_size = sizeof(VHostUserBlk),
+      .instance_init = vhost_user_blk_instance_init,
+      .class_init = vhost_user_blk_class_init,
+  };
+
+defines ``TYPE_VHOST_USER_BLK`` as a child of the generic
+``TYPE_VIRTIO_DEVICE``. And then for the PCI device it wraps around the
+base device (although explicitly initialising via
+virtio_instance_init_common):
+
+.. code:: c
+
+  struct VHostUserBlkPCI {
+      VirtIOPCIProxy parent_obj;
+      VHostUserBlk vdev;
+  };
+   
+  static void vhost_user_blk_pci_instance_init(Object *obj)
+  {
+      VHostUserBlkPCI *dev = VHOST_USER_BLK_PCI(obj);
+
+      virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                  TYPE_VHOST_USER_BLK);
+      object_property_add_alias(obj, "bootindex", OBJECT(&dev->vdev),
+                                "bootindex");
+  }
+
+  static const VirtioPCIDeviceTypeInfo vhost_user_blk_pci_info = {
+      .base_name               = TYPE_VHOST_USER_BLK_PCI,
+      .generic_name            = "vhost-user-blk-pci",
+      .transitional_name       = "vhost-user-blk-pci-transitional",
+      .non_transitional_name   = "vhost-user-blk-pci-non-transitional",
+      .instance_size  = sizeof(VHostUserBlkPCI),
+      .instance_init  = vhost_user_blk_pci_instance_init,
+      .class_init     = vhost_user_blk_pci_class_init,
+  };
+
+Back End Implementations
+------------------------
+
+There are a number of places where the implementation of the backend
+can be done:
+
+* in QEMU itself
+* in the host kernel (a.k.a vhost)
+* in a separate process (a.k.a. vhost-user)
+
+where a vhost-user implementation is being done the code in QEMU is
+mainly boilerplate to handle the command line definition and
+connection to the separate process with a socket (using the ``chardev``
+functionality).
+
+Implementing a vhost-user wrapper
+---------------------------------
+
+There are some classes defined that can wrap a lot of the common
+vhost-user code in a ``VhostUserBackend``. For example:
+
+.. code:: c
+
+  struct VhostUserGPU {
+      VirtIOGPUBase parent_obj;
+
+      VhostUserBackend *vhost;
+      ...
+  };
+
+  static void
+  vhost_user_gpu_instance_init(Object *obj)
+  {
+      VhostUserGPU *g = VHOST_USER_GPU(obj);
+
+      g->vhost = VHOST_USER_BACKEND(object_new(TYPE_VHOST_USER_BACKEND));
+      object_property_add_alias(obj, "chardev",
+                                OBJECT(g->vhost), "chardev");
+  }
+
+  static void
+  vhost_user_gpu_device_realize(DeviceState *qdev, Error **errp)
+  {
+      VhostUserGPU *g = VHOST_USER_GPU(qdev);
+      VirtIODevice *vdev = VIRTIO_DEVICE(g);
+
+      vhost_dev_set_config_notifier(&g->vhost->dev, &config_ops);
+      if (vhost_user_backend_dev_init(g->vhost, vdev, 2, errp) < 0) {
+          return;
+      }
+      ...
+  }
+
+  static void
+  vhost_user_gpu_class_init(ObjectClass *klass, void *data)
+  {
+      DeviceClass *dc = DEVICE_CLASS(klass);
+      VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
+
+      vdc->realize = vhost_user_gpu_device_realize;
+      ...
+  }
+
+  static const TypeInfo vhost_user_gpu_info = {
+      .name = TYPE_VHOST_USER_GPU,
+      .parent = TYPE_VIRTIO_GPU_BASE,
+      .instance_size = sizeof(VhostUserGPU),
+      .instance_init = vhost_user_gpu_instance_init,
+      .class_init = vhost_user_gpu_class_init,
+      ...
+  };
+
+Here the ``TYPE_VHOST_USER_GPU`` is based off a shared base class
+(``TYPE_VIRTIO_GPU_BASE`` which itself is based on
+``TYPE_VIRTIO_DEVICE``). The chardev property is aliased to the
+VhostUserBackend chardev so it can be specified on the command line
+for this device.
+ 
-- 
2.30.2


