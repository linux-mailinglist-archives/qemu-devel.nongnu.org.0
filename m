Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C79B73172FD
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:14:11 +0100 (CET)
Received: from localhost ([::1]:52422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9xkQ-0007cn-RE
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:14:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xhM-0005tf-3W
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:11:00 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:55736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xhJ-0003Bm-L1
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:10:59 -0500
Received: by mail-wm1-x332.google.com with SMTP id o15so1414082wmq.5
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jmoVvCJIZ5hgn5Z6/1kOCx1zfxEb1vqsWzWnY3mB7y4=;
 b=DqHSKAKTmho5ktC2M0s65TCYaACCF29xxddGi9+tt+v6M8G3DV8OPXrV/IKMYzXdZN
 NXZtboATRYSenbU6YZmLuJ9bKpzD2CraP74TeU5y7H2qXRzoiAQ+39lyV7GVWZjG2GuZ
 ptdrqImjzRcX5ZGbq6XcYD27nN54gRPZYHXdbTd330imoDXhpHj3P963+bHus8wB8J+E
 Gn48RibY4GuVG6n/1dTk4+qxsmh8m+sgF1WGbEYB2zcuCU6xOKuot9lJdnG2xJMnw/3Z
 DTOC0fiynvznv4z8B2yUMLzoW2Dua/k9TRg6xvcLUXSZfHLEn9EfP7bF8m8IHhDAUDhG
 mO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jmoVvCJIZ5hgn5Z6/1kOCx1zfxEb1vqsWzWnY3mB7y4=;
 b=PlXjtHCkto9ADf7uvH1F2d4SMGUCx1JxsxL2yQO0WmQMDGTqkwxeq0jjHGQ6c//aPa
 FZsCIftEFlNKtQy53+InKxjIJvGK4RL/P7YDhLz9MDXmIHiysVMEZBshMUi/nrssVL8Q
 gAEadWwNH3Gb9hELTmQBMOpzYbIlrG8zIZbRnTuWytjRIBbnV/mVos+vKsEY2L4JoY2m
 X0TBP1k9fNsAv080Rgn8QcCgEP23xNS/GH3CIW/x7C8OvmsB4scqsllWoucLTxdP7REQ
 7qQeCyL81nDoU50sqRHZy3AE5U8RaOt0SqUgMkEhzue4BygElQRV/6GNBWs9t745wEx6
 Bqrg==
X-Gm-Message-State: AOAM531ZATpCG3Ff3E/tZwLzqd91nz7XJ3llh2hZ924P4/r1gOC7BFii
 /guagPs8FKLzxDlpD7ija3Ifag==
X-Google-Smtp-Source: ABdhPJxMjNPMg+XROeLITWcloSddEEByq8qQ8GoNF031i0ipwmUIq8VspiemAvNtWITL9+8v3ZkYJQ==
X-Received: by 2002:a1c:b156:: with SMTP id a83mr1137663wmf.11.1612995055939; 
 Wed, 10 Feb 2021 14:10:55 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z63sm5137411wme.8.2021.02.10.14.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:10:54 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 939901FF87;
 Wed, 10 Feb 2021 22:10:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/21] hw/virtio/pci: include vdev name in registered PCI
 sections
Date: Wed, 10 Feb 2021 22:10:33 +0000
Message-Id: <20210210221053.18050-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210210221053.18050-1-alex.bennee@linaro.org>
References: <20210210221053.18050-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When viewing/debugging memory regions it is sometimes hard to figure
out which PCI device something belongs to. Make the names unique by
including the vdev name in the name string.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Message-Id: <20200713200415.26214-10-alex.bennee@linaro.org>
---
 hw/virtio/virtio-pci.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 094c36aa3e..883045a223 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1423,7 +1423,8 @@ static void virtio_pci_device_write(void *opaque, hwaddr addr,
     }
 }
 
-static void virtio_pci_modern_regions_init(VirtIOPCIProxy *proxy)
+static void virtio_pci_modern_regions_init(VirtIOPCIProxy *proxy,
+                                           const char *vdev_name)
 {
     static const MemoryRegionOps common_ops = {
         .read = virtio_pci_common_read,
@@ -1470,36 +1471,41 @@ static void virtio_pci_modern_regions_init(VirtIOPCIProxy *proxy)
         },
         .endianness = DEVICE_LITTLE_ENDIAN,
     };
+    g_autoptr(GString) name = g_string_new(NULL);
 
-
+    g_string_printf(name, "virtio-pci-common-%s", vdev_name);
     memory_region_init_io(&proxy->common.mr, OBJECT(proxy),
                           &common_ops,
                           proxy,
-                          "virtio-pci-common",
+                          name->str,
                           proxy->common.size);
 
+    g_string_printf(name, "virtio-pci-isr-%s", vdev_name);
     memory_region_init_io(&proxy->isr.mr, OBJECT(proxy),
                           &isr_ops,
                           proxy,
-                          "virtio-pci-isr",
+                          name->str,
                           proxy->isr.size);
 
+    g_string_printf(name, "virtio-pci-device-%s", vdev_name);
     memory_region_init_io(&proxy->device.mr, OBJECT(proxy),
                           &device_ops,
                           proxy,
-                          "virtio-pci-device",
+                          name->str,
                           proxy->device.size);
 
+    g_string_printf(name, "virtio-pci-notify-%s", vdev_name);
     memory_region_init_io(&proxy->notify.mr, OBJECT(proxy),
                           &notify_ops,
                           proxy,
-                          "virtio-pci-notify",
+                          name->str,
                           proxy->notify.size);
 
+    g_string_printf(name, "virtio-pci-notify-pio-%s", vdev_name);
     memory_region_init_io(&proxy->notify_pio.mr, OBJECT(proxy),
                           &notify_pio_ops,
                           proxy,
-                          "virtio-pci-notify-pio",
+                          name->str,
                           proxy->notify_pio.size);
 }
 
@@ -1654,7 +1660,7 @@ static void virtio_pci_device_plugged(DeviceState *d, Error **errp)
 
         struct virtio_pci_cfg_cap *cfg_mask;
 
-        virtio_pci_modern_regions_init(proxy);
+        virtio_pci_modern_regions_init(proxy, vdev->name);
 
         virtio_pci_modern_mem_region_map(proxy, &proxy->common, &cap);
         virtio_pci_modern_mem_region_map(proxy, &proxy->isr, &cap);
-- 
2.20.1


