Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5F179AE8
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 23:17:49 +0200 (CEST)
Received: from localhost ([::1]:56452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsD1g-00073u-SL
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 17:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56705)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hsD0D-0005ko-1n
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 17:16:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hsD0B-0003i7-Gb
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 17:16:16 -0400
Received: from mail-qt1-f179.google.com ([209.85.160.179]:36842)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hsD0B-0003hy-BU
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 17:16:15 -0400
Received: by mail-qt1-f179.google.com with SMTP id z4so60997890qtc.3
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 14:16:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QdMWtHmweOrWAhdEfsuivxg5RVP7OHshZr5ulNpkUmM=;
 b=B1JH5DfblYY7jT7itl3Ms+jRL7QTPqL/RN2hyZvg+nv/d+ssJBiSbjWFHQf/5LVnkN
 ii+ptThOyH/Ru8AN+lptkrwNnO749FX6R9fZRM/rVg874KURD2bZk13YJARZbdJ2Pmtl
 BkbVk4TToscDdulaIHsrSEm3BZvI8MI9ZfKtD9vTV4GFLTNj7Q4ciVh2bW+vhOooS0LH
 ITz6exEdp9XWnngFMduMb5N6bRzPYtfQ3TK2mOM6JUtGBqMs8wdyn35iM7hn4eDRH6BI
 E9Jix2qDCQMF7qoSMWcl4r4O1jsl2O6VWoKdPim1/2jzEhT8f1lyaxZ5Ys36vG8q/uJ2
 Ugcw==
X-Gm-Message-State: APjAAAVxsw5siV8LOlhA2uJzm8etlb+Y8DGV8INHz3IJy5GoomFqGJQW
 nLwqo4yYyB+zOootXOlUZjJfw6rPBhvX3w==
X-Google-Smtp-Source: APXvYqyHmMPKL7Y0ZhvyQBEF47iyaeFt6PDuCfyHeCqTqbZHg0PoWHK+uqOiiVz3+CrTqv0idCUc0A==
X-Received: by 2002:ac8:3908:: with SMTP id s8mr33336794qtb.224.1564434974381; 
 Mon, 29 Jul 2019 14:16:14 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
 by smtp.gmail.com with ESMTPSA id
 l19sm35708677qtb.6.2019.07.29.14.16.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 14:16:13 -0700 (PDT)
Date: Mon, 29 Jul 2019 17:16:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190729162903.4489-3-dgilbert@redhat.com>
References: <20190729211404.1533-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190729211404.1533-1-mst@redhat.com>
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.160.179
Subject: [Qemu-devel] [PULL 2/3] Revert "hw: report invalid
 disable-legacy|modern usage for virtio-1-only devs"
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
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gonglei <arei.gonglei@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

This reverts commit f2784eed306449c3d04a71a05ed6463b8289aedf
since that accidentally removes the PCIe capabilities from virtio
devices because virtio_pci_dc_realize is called before the new 'mode'
flag is set.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20190729162903.4489-3-dgilbert@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/core/machine.c             | 23 +++--------------------
 hw/display/virtio-gpu-pci.c   |  4 +---
 hw/display/virtio-vga.c       |  4 +---
 hw/virtio/virtio-crypto-pci.c |  4 +---
 hw/virtio/virtio-input-pci.c  |  4 +---
 hw/virtio/virtio-pci.c        | 26 ++++++++++----------------
 hw/virtio/virtio-pci.h        | 31 ++++++-------------------------
 7 files changed, 23 insertions(+), 73 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index c58a8e594e..c4a2ab2282 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -115,26 +115,9 @@ const size_t hw_compat_2_7_len = G_N_ELEMENTS(hw_compat_2_7);
 
 GlobalProperty hw_compat_2_6[] = {
     { "virtio-mmio", "format_transport_address", "off" },
-    /*
-     * don't include devices which are modern-only
-     * ie keyboard, mouse, tablet, gpu, vga & crypto
-     */
-    { "virtio-9p-pci", "disable-modern", "on" },
-    { "virtio-9p-pci", "disable-legacy", "off" },
-    { "virtio-balloon-pci", "disable-modern", "on" },
-    { "virtio-balloon-pci", "disable-legacy", "off" },
-    { "virtio-blk-pci", "disable-modern", "on" },
-    { "virtio-blk-pci", "disable-legacy", "off" },
-    { "virtio-input-host-pci", "disable-modern", "on" },
-    { "virtio-input-host-pci", "disable-legacy", "off" },
-    { "virtio-net-pci", "disable-modern", "on" },
-    { "virtio-net-pci", "disable-legacy", "off" },
-    { "virtio-rng-pci", "disable-modern", "on" },
-    { "virtio-rng-pci", "disable-legacy", "off" },
-    { "virtio-scsi-pci", "disable-modern", "on" },
-    { "virtio-scsi-pci", "disable-legacy", "off" },
-    { "virtio-serial-pci", "disable-modern", "on" },
-    { "virtio-serial-pci", "disable-legacy", "off" },
+    /* Optional because not all virtio-pci devices support legacy mode */
+    { "virtio-pci", "disable-modern", "on",  .optional = true },
+    { "virtio-pci", "disable-legacy", "off", .optional = true },
 };
 const size_t hw_compat_2_6_len = G_N_ELEMENTS(hw_compat_2_6);
 
diff --git a/hw/display/virtio-gpu-pci.c b/hw/display/virtio-gpu-pci.c
index d6f01b4a98..e4c7eb6193 100644
--- a/hw/display/virtio-gpu-pci.c
+++ b/hw/display/virtio-gpu-pci.c
@@ -33,9 +33,7 @@ static void virtio_gpu_pci_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     Error *local_error = NULL;
 
     qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
-    if (!virtio_pci_force_virtio_1(vpci_dev, errp)) {
-        return;
-    }
+    virtio_pci_force_virtio_1(vpci_dev);
     object_property_set_bool(OBJECT(vdev), true, "realized", &local_error);
 
     if (local_error) {
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index 416e7fec87..79a145e284 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -137,9 +137,7 @@ static void virtio_vga_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
 
     /* init virtio bits */
     qdev_set_parent_bus(DEVICE(g), BUS(&vpci_dev->bus));
-    if (!virtio_pci_force_virtio_1(vpci_dev, errp)) {
-        return;
-    }
+    virtio_pci_force_virtio_1(vpci_dev);
     object_property_set_bool(OBJECT(g), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
diff --git a/hw/virtio/virtio-crypto-pci.c b/hw/virtio/virtio-crypto-pci.c
index c8a2317a10..91d4446080 100644
--- a/hw/virtio/virtio-crypto-pci.c
+++ b/hw/virtio/virtio-crypto-pci.c
@@ -53,9 +53,7 @@ static void virtio_crypto_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     }
 
     qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
-    if (!virtio_pci_force_virtio_1(vpci_dev, errp)) {
-        return;
-    }
+    virtio_pci_force_virtio_1(vpci_dev);
     object_property_set_bool(OBJECT(vdev), true, "realized", errp);
     object_property_set_link(OBJECT(vcrypto),
                  OBJECT(vcrypto->vdev.conf.cryptodev), "cryptodev",
diff --git a/hw/virtio/virtio-input-pci.c b/hw/virtio/virtio-input-pci.c
index 1c40292abc..ad7774e93e 100644
--- a/hw/virtio/virtio-input-pci.c
+++ b/hw/virtio/virtio-input-pci.c
@@ -49,9 +49,7 @@ static void virtio_input_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     DeviceState *vdev = DEVICE(&vinput->vdev);
 
     qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
-    if (!virtio_pci_force_virtio_1(vpci_dev, errp)) {
-        return;
-    }
+    virtio_pci_force_virtio_1(vpci_dev);
     object_property_set_bool(OBJECT(vdev), true, "realized", errp);
 }
 
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index ce928f2429..f6d2223e78 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1723,22 +1723,16 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
                        /* PCI BAR regions must be powers of 2 */
                        pow2ceil(proxy->notify.offset + proxy->notify.size));
 
-    if ((proxy->disable_legacy == ON_OFF_AUTO_ON) ||
-        ((proxy->disable_legacy == ON_OFF_AUTO_AUTO) && pcie_port)) {
-        if (proxy->disable_modern) {
-            error_setg(errp, "device cannot work as neither modern nor "
-                       "legacy mode is enabled");
-            error_append_hint(errp, "Set either disable-modern or "
-                              "disable-legacy to off\n");
-            return;
-        }
-        proxy->mode = VIRTIO_PCI_MODE_MODERN;
-    } else {
-        if (proxy->disable_modern) {
-            proxy->mode = VIRTIO_PCI_MODE_LEGACY;
-        } else {
-            proxy->mode = VIRTIO_PCI_MODE_TRANSITIONAL;
-        }
+    if (proxy->disable_legacy == ON_OFF_AUTO_AUTO) {
+        proxy->disable_legacy = pcie_port ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
+    }
+
+    if (!virtio_pci_modern(proxy) && !virtio_pci_legacy(proxy)) {
+        error_setg(errp, "device cannot work as neither modern nor legacy mode"
+                   " is enabled");
+        error_append_hint(errp, "Set either disable-modern or disable-legacy"
+                          " to off\n");
+        return;
     }
 
     if (pcie_port && pci_is_express(pci_dev)) {
diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
index 619d9098c1..292275acb1 100644
--- a/hw/virtio/virtio-pci.h
+++ b/hw/virtio/virtio-pci.h
@@ -15,7 +15,6 @@
 #ifndef QEMU_VIRTIO_PCI_H
 #define QEMU_VIRTIO_PCI_H
 
-#include "qapi/error.h"
 #include "hw/pci/msi.h"
 #include "hw/virtio/virtio-bus.h"
 
@@ -119,12 +118,6 @@ typedef struct VirtIOPCIQueue {
   uint32_t used[2];
 } VirtIOPCIQueue;
 
-typedef enum {
-    VIRTIO_PCI_MODE_LEGACY,
-    VIRTIO_PCI_MODE_TRANSITIONAL,
-    VIRTIO_PCI_MODE_MODERN,
-} VirtIOPCIMode;
-
 struct VirtIOPCIProxy {
     PCIDevice pci_dev;
     MemoryRegion bar;
@@ -149,7 +142,6 @@ struct VirtIOPCIProxy {
     bool disable_modern;
     bool ignore_backend_features;
     OnOffAuto disable_legacy;
-    VirtIOPCIMode mode;
     uint32_t class_code;
     uint32_t nvectors;
     uint32_t dfselect;
@@ -164,34 +156,23 @@ struct VirtIOPCIProxy {
 
 static inline bool virtio_pci_modern(VirtIOPCIProxy *proxy)
 {
-    return proxy->mode != VIRTIO_PCI_MODE_LEGACY;
+    return !proxy->disable_modern;
 }
 
 static inline bool virtio_pci_legacy(VirtIOPCIProxy *proxy)
 {
-    return proxy->mode != VIRTIO_PCI_MODE_MODERN;
+    return proxy->disable_legacy == ON_OFF_AUTO_OFF;
 }
 
-static inline bool virtio_pci_force_virtio_1(VirtIOPCIProxy *proxy,
-                                             Error **errp)
+static inline void virtio_pci_force_virtio_1(VirtIOPCIProxy *proxy)
 {
-    if (proxy->disable_legacy == ON_OFF_AUTO_OFF) {
-        error_setg(errp, "Unable to set disable-legacy=off on a virtio-1.0 "
-                   "only device");
-        return false;
-    }
-    if (proxy->disable_modern == true) {
-        error_setg(errp, "Unable to set disable-modern=on on a virtio-1.0 "
-                   "only device");
-        return false;
-    }
-    proxy->mode = VIRTIO_PCI_MODE_MODERN;
-    return true;
+    proxy->disable_modern = false;
+    proxy->disable_legacy = ON_OFF_AUTO_ON;
 }
 
 static inline void virtio_pci_disable_modern(VirtIOPCIProxy *proxy)
 {
-    proxy->mode = VIRTIO_PCI_MODE_LEGACY;
+    proxy->disable_modern = true;
 }
 
 /*
-- 
MST


