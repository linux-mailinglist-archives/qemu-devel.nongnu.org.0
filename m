Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26025253F1
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 19:43:44 +0200 (CEST)
Received: from localhost ([::1]:60824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npCql-0005bc-Qp
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 13:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZG-0004wh-6O
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZC-00057m-R5
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652376334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FumAWeVd1irXJA/O6eZrUXZOZWsRn6/nwaCrVp7Ge2Y=;
 b=Uzrcv/L9JdmYP1niN9xhKoDvD5kqbjx/e2lB7XOmFb9tSZ/LJMQGue/+/JikIuGvb0R/9R
 f6NuGeRP9c1MwnZvdkMrD8U1zHTXdF7FImyebrtAfDDK557Cskn1Yt5qnHHrCQAbu+WMA8
 P36neve/C2mjJsKY/Oz8thfv+p8PM7g=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-yxmB5OLTPSSm-YFWbcvyzg-1; Thu, 12 May 2022 13:25:32 -0400
X-MC-Unique: yxmB5OLTPSSm-YFWbcvyzg-1
Received: by mail-ed1-f72.google.com with SMTP id
 c23-20020a50d657000000b00425d5162a0dso3474246edj.16
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FumAWeVd1irXJA/O6eZrUXZOZWsRn6/nwaCrVp7Ge2Y=;
 b=71ZgyiSQc47Uhb3fLVynWTrcCcvXApGSdoZPC0CgpCatdyrYmOD5wpo3qtBDYJkyy3
 PUpLLAwFtnvOzCltIa0A6fPSRONA1A72ZB+41xv6A2ebjk9Ff1IXKQNSUEKH54s2/+T0
 1+txfljVWY/PjY+RSwGYaGSLxvHCweGP4fdivO2BtHOZmrACsgLtCwsx7S4bg1JnuYbQ
 aTVt53P3Z/kwMmXPTcqWMqL6hTaAdATyXKDWwHcSY09af6eubnjQqUTmZZqOj2Z1lRTL
 WJd5PfngyxVc182/6Cx6kIYZN9X7V06P3kYm53NIt49KZRaFQAYxMpJ2Lap3TMa4dXSy
 XHsQ==
X-Gm-Message-State: AOAM530KSRk6oetqXK/f/6Uq4JE8+Wx47UKAn86ZyUU0mgVjzazxc4QI
 ETRl4QZwlSlOOB2xELExdZCvPfSEzMAcP6BLLnERZD0KmVf6U7H67o5sqLwHPSB2DSk7c8WKDnf
 UsXt6PFhTWgiwOOUKMua4o7ufy9FdT3rgsVGVPv4rk5w7s4vjDogCmEPeTcN90OjIEF8=
X-Received: by 2002:a05:6402:5188:b0:428:e77:b55b with SMTP id
 q8-20020a056402518800b004280e77b55bmr36591696edd.82.1652376331170; 
 Thu, 12 May 2022 10:25:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIcrzfVwA7NYiiBVzFJ6ttU0tAN/3+FxTn3Y+uwuDeJSBzjIGKYvNHLsyaq2Xlmq9ruBeyfg==
X-Received: by 2002:a05:6402:5188:b0:428:e77:b55b with SMTP id
 q8-20020a056402518800b004280e77b55bmr36591670edd.82.1652376330814; 
 Thu, 12 May 2022 10:25:30 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a17090660c700b006f3ef214de7sm2334262ejk.77.2022.05.12.10.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:25:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>
Subject: [PULL 10/27] tests/qtest/libqos: Add generic pci host bridge in
 arm-virt machine
Date: Thu, 12 May 2022 19:24:48 +0200
Message-Id: <20220512172505.1065394-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512172505.1065394-1-pbonzini@redhat.com>
References: <20220512172505.1065394-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Eric Auger <eric.auger@redhat.com>

Up to now the virt-machine node contains a virtio-mmio node.
However no driver produces any PCI interface node. Hence, PCI
tests cannot be run with aarch64 binary.

Add a GPEX driver node that produces a pci interface node. This latter
then can be consumed by all the pci tests. One of the first motivation
was to be able to run the virtio-iommu-pci tests.

We still face an issue with pci hotplug tests as hotplug cannot happen
on the pcie root bus and require a generic root port. This will be
addressed later on.

We force cpu=max along with aarch64/virt machine as some PCI tests
require high MMIO regions to be available.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

Message-Id: <20220504152025.1785704-4-eric.auger@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/libqos/arm-virt-machine.c |  19 ++-
 tests/qtest/libqos/generic-pcihost.c  | 231 ++++++++++++++++++++++++++
 tests/qtest/libqos/generic-pcihost.h  |  54 ++++++
 tests/qtest/libqos/meson.build        |   1 +
 4 files changed, 301 insertions(+), 4 deletions(-)
 create mode 100644 tests/qtest/libqos/generic-pcihost.c
 create mode 100644 tests/qtest/libqos/generic-pcihost.h

diff --git a/tests/qtest/libqos/arm-virt-machine.c b/tests/qtest/libqos/arm-virt-machine.c
index 2e0beaefb8..139eaba142 100644
--- a/tests/qtest/libqos/arm-virt-machine.c
+++ b/tests/qtest/libqos/arm-virt-machine.c
@@ -22,6 +22,8 @@
 #include "malloc.h"
 #include "qgraph.h"
 #include "virtio-mmio.h"
+#include "generic-pcihost.h"
+#include "hw/pci/pci_regs.h"
 
 #define ARM_PAGE_SIZE               4096
 #define VIRTIO_MMIO_BASE_ADDR       0x0A003E00
@@ -35,6 +37,7 @@ struct QVirtMachine {
     QOSGraphObject obj;
     QGuestAllocator alloc;
     QVirtioMMIODevice virtio_mmio;
+    QGenericPCIHost bridge;
 };
 
 static void virt_destructor(QOSGraphObject *obj)
@@ -57,11 +60,13 @@ static void *virt_get_driver(void *object, const char *interface)
 static QOSGraphObject *virt_get_device(void *obj, const char *device)
 {
     QVirtMachine *machine = obj;
-    if (!g_strcmp0(device, "virtio-mmio")) {
+    if (!g_strcmp0(device, "generic-pcihost")) {
+        return &machine->bridge.obj;
+    } else if (!g_strcmp0(device, "virtio-mmio")) {
         return &machine->virtio_mmio.obj;
     }
 
-    fprintf(stderr, "%s not present in arm/virtio\n", device);
+    fprintf(stderr, "%s not present in arm/virt\n", device);
     g_assert_not_reached();
 }
 
@@ -76,16 +81,22 @@ static void *qos_create_machine_arm_virt(QTestState *qts)
     qvirtio_mmio_init_device(&machine->virtio_mmio, qts, VIRTIO_MMIO_BASE_ADDR,
                              VIRTIO_MMIO_SIZE);
 
+    qos_create_generic_pcihost(&machine->bridge, qts, &machine->alloc);
+
     machine->obj.get_device = virt_get_device;
     machine->obj.get_driver = virt_get_driver;
     machine->obj.destructor = virt_destructor;
     return machine;
 }
 
-static void virtio_mmio_register_nodes(void)
+static void virt_machine_register_nodes(void)
 {
     qos_node_create_machine("arm/virt", qos_create_machine_arm_virt);
     qos_node_contains("arm/virt", "virtio-mmio", NULL);
+
+    qos_node_create_machine_args("aarch64/virt", qos_create_machine_arm_virt,
+                                 " -cpu max");
+    qos_node_contains("aarch64/virt", "generic-pcihost", NULL);
 }
 
-libqos_init(virtio_mmio_register_nodes);
+libqos_init(virt_machine_register_nodes);
diff --git a/tests/qtest/libqos/generic-pcihost.c b/tests/qtest/libqos/generic-pcihost.c
new file mode 100644
index 0000000000..3124b0e46b
--- /dev/null
+++ b/tests/qtest/libqos/generic-pcihost.c
@@ -0,0 +1,231 @@
+/*
+ * libqos PCI bindings for generic PCI
+ *
+ * Copyright Red Hat Inc., 2022
+ *
+ * Authors:
+ *  Eric Auger   <eric.auger@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "../libqtest.h"
+#include "generic-pcihost.h"
+#include "qapi/qmp/qdict.h"
+#include "hw/pci/pci_regs.h"
+#include "qemu/host-utils.h"
+
+#include "qemu/module.h"
+
+/* QGenericPCIHost */
+
+QOSGraphObject *generic_pcihost_get_device(void *obj, const char *device)
+{
+    QGenericPCIHost *host = obj;
+    if (!g_strcmp0(device, "pci-bus-generic")) {
+        return &host->pci.obj;
+    }
+    fprintf(stderr, "%s not present in generic-pcihost\n", device);
+    g_assert_not_reached();
+}
+
+void qos_create_generic_pcihost(QGenericPCIHost *host,
+                                QTestState *qts,
+                                QGuestAllocator *alloc)
+{
+    host->obj.get_device = generic_pcihost_get_device;
+    qpci_init_generic(&host->pci, qts, alloc, false);
+}
+
+static uint8_t qpci_generic_pio_readb(QPCIBus *bus, uint32_t addr)
+{
+    QGenericPCIBus *s = container_of(bus, QGenericPCIBus, bus);
+
+    return qtest_readb(bus->qts, s->gpex_pio_base + addr);
+}
+
+static void qpci_generic_pio_writeb(QPCIBus *bus, uint32_t addr, uint8_t val)
+{
+    QGenericPCIBus *s = container_of(bus, QGenericPCIBus, bus);
+
+    qtest_writeb(bus->qts, s->gpex_pio_base + addr,  val);
+}
+
+static uint16_t qpci_generic_pio_readw(QPCIBus *bus, uint32_t addr)
+{
+    QGenericPCIBus *s = container_of(bus, QGenericPCIBus, bus);
+
+    return qtest_readw(bus->qts, s->gpex_pio_base + addr);
+}
+
+static void qpci_generic_pio_writew(QPCIBus *bus, uint32_t addr, uint16_t val)
+{
+    QGenericPCIBus *s = container_of(bus, QGenericPCIBus, bus);
+
+    qtest_writew(bus->qts, s->gpex_pio_base + addr, val);
+}
+
+static uint32_t qpci_generic_pio_readl(QPCIBus *bus, uint32_t addr)
+{
+    QGenericPCIBus *s = container_of(bus, QGenericPCIBus, bus);
+
+    return qtest_readl(bus->qts, s->gpex_pio_base + addr);
+}
+
+static void qpci_generic_pio_writel(QPCIBus *bus, uint32_t addr, uint32_t val)
+{
+    QGenericPCIBus *s = container_of(bus, QGenericPCIBus, bus);
+
+    qtest_writel(bus->qts, s->gpex_pio_base + addr, val);
+}
+
+static uint64_t qpci_generic_pio_readq(QPCIBus *bus, uint32_t addr)
+{
+    QGenericPCIBus *s = container_of(bus, QGenericPCIBus, bus);
+
+    return qtest_readq(bus->qts, s->gpex_pio_base + addr);
+}
+
+static void qpci_generic_pio_writeq(QPCIBus *bus, uint32_t addr, uint64_t val)
+{
+    QGenericPCIBus *s = container_of(bus, QGenericPCIBus, bus);
+
+    qtest_writeq(bus->qts, s->gpex_pio_base + addr, val);
+}
+
+static void qpci_generic_memread(QPCIBus *bus, uint32_t addr, void *buf, size_t len)
+{
+    qtest_memread(bus->qts, addr, buf, len);
+}
+
+static void qpci_generic_memwrite(QPCIBus *bus, uint32_t addr,
+                                  const void *buf, size_t len)
+{
+    qtest_memwrite(bus->qts, addr, buf, len);
+}
+
+static uint8_t qpci_generic_config_readb(QPCIBus *bus, int devfn, uint8_t offset)
+{
+    QGenericPCIBus *gbus = container_of(bus, QGenericPCIBus, bus);
+    uint64_t addr = gbus->ecam_alloc_ptr + ((0 << 20) | (devfn << 12) | offset);
+    uint8_t val;
+
+    qtest_memread(bus->qts, addr, &val, 1);
+    return val;
+}
+
+static uint16_t qpci_generic_config_readw(QPCIBus *bus, int devfn, uint8_t offset)
+{
+    QGenericPCIBus *gbus = container_of(bus, QGenericPCIBus, bus);
+    uint64_t addr = gbus->ecam_alloc_ptr + ((0 << 20) | (devfn << 12) | offset);
+    uint16_t val;
+
+    qtest_memread(bus->qts, addr, &val, 2);
+    return le16_to_cpu(val);
+}
+
+static uint32_t qpci_generic_config_readl(QPCIBus *bus, int devfn, uint8_t offset)
+{
+    QGenericPCIBus *gbus = container_of(bus, QGenericPCIBus, bus);
+    uint64_t addr = gbus->ecam_alloc_ptr + ((0 << 20) | (devfn << 12) | offset);
+    uint32_t val;
+
+    qtest_memread(bus->qts, addr, &val, 4);
+    return le32_to_cpu(val);
+}
+
+static void
+qpci_generic_config_writeb(QPCIBus *bus, int devfn, uint8_t offset, uint8_t value)
+{
+    QGenericPCIBus *gbus = container_of(bus, QGenericPCIBus, bus);
+    uint64_t addr = gbus->ecam_alloc_ptr + ((0 << 20) | (devfn << 12) | offset);
+
+    qtest_memwrite(bus->qts, addr, &value, 1);
+}
+
+static void
+qpci_generic_config_writew(QPCIBus *bus, int devfn, uint8_t offset, uint16_t value)
+{
+    QGenericPCIBus *gbus = container_of(bus, QGenericPCIBus, bus);
+    uint64_t addr = gbus->ecam_alloc_ptr + ((0 << 20) | (devfn << 12) | offset);
+    uint16_t val = cpu_to_le16(value);
+
+    qtest_memwrite(bus->qts, addr, &val, 2);
+}
+
+static void
+qpci_generic_config_writel(QPCIBus *bus, int devfn, uint8_t offset, uint32_t value)
+{
+    QGenericPCIBus *gbus = container_of(bus, QGenericPCIBus, bus);
+    uint64_t addr = gbus->ecam_alloc_ptr + ((0 << 20) | (devfn << 12) | offset);
+    uint32_t val = cpu_to_le32(value);
+
+    qtest_memwrite(bus->qts, addr, &val, 4);
+}
+
+static void *qpci_generic_get_driver(void *obj, const char *interface)
+{
+    QGenericPCIBus *qpci = obj;
+    if (!g_strcmp0(interface, "pci-bus")) {
+        return &qpci->bus;
+    }
+    fprintf(stderr, "%s not present in pci-bus-generic\n", interface);
+    g_assert_not_reached();
+}
+
+void qpci_init_generic(QGenericPCIBus *qpci, QTestState *qts,
+                       QGuestAllocator *alloc, bool hotpluggable)
+{
+    assert(qts);
+
+    qpci->gpex_pio_base = 0x3eff0000;
+    qpci->bus.not_hotpluggable = !hotpluggable;
+    qpci->bus.has_buggy_msi = false;
+
+    qpci->bus.pio_readb = qpci_generic_pio_readb;
+    qpci->bus.pio_readw = qpci_generic_pio_readw;
+    qpci->bus.pio_readl = qpci_generic_pio_readl;
+    qpci->bus.pio_readq = qpci_generic_pio_readq;
+
+    qpci->bus.pio_writeb = qpci_generic_pio_writeb;
+    qpci->bus.pio_writew = qpci_generic_pio_writew;
+    qpci->bus.pio_writel = qpci_generic_pio_writel;
+    qpci->bus.pio_writeq = qpci_generic_pio_writeq;
+
+    qpci->bus.memread = qpci_generic_memread;
+    qpci->bus.memwrite = qpci_generic_memwrite;
+
+    qpci->bus.config_readb = qpci_generic_config_readb;
+    qpci->bus.config_readw = qpci_generic_config_readw;
+    qpci->bus.config_readl = qpci_generic_config_readl;
+
+    qpci->bus.config_writeb = qpci_generic_config_writeb;
+    qpci->bus.config_writew = qpci_generic_config_writew;
+    qpci->bus.config_writel = qpci_generic_config_writel;
+
+    qpci->bus.qts = qts;
+    qpci->bus.pio_alloc_ptr = 0x0000;
+    qpci->bus.pio_limit = 0x10000;
+    qpci->bus.mmio_alloc_ptr = 0x10000000;
+    qpci->bus.mmio_limit = 0x2eff0000;
+    qpci->ecam_alloc_ptr = 0x4010000000;
+
+    qpci->obj.get_driver = qpci_generic_get_driver;
+}
+
+static void qpci_generic_register_nodes(void)
+{
+    qos_node_create_driver("pci-bus-generic", NULL);
+    qos_node_produces("pci-bus-generic", "pci-bus");
+}
+
+static void qpci_generic_pci_register_nodes(void)
+{
+    qos_node_create_driver("generic-pcihost", NULL);
+    qos_node_contains("generic-pcihost", "pci-bus-generic", NULL);
+}
+
+libqos_init(qpci_generic_register_nodes);
+libqos_init(qpci_generic_pci_register_nodes);
diff --git a/tests/qtest/libqos/generic-pcihost.h b/tests/qtest/libqos/generic-pcihost.h
new file mode 100644
index 0000000000..c693c769df
--- /dev/null
+++ b/tests/qtest/libqos/generic-pcihost.h
@@ -0,0 +1,54 @@
+/*
+ * libqos Generic PCI bindings and generic pci host bridge
+ *
+ * Copyright Red Hat Inc., 2022
+ *
+ * Authors:
+ *  Eric Auger <eric.auger@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef LIBQOS_GENERIC_PCIHOST_H
+#define LIBQOS_GENERIC_PCIHOST_H
+
+#include "pci.h"
+#include "malloc.h"
+#include "qgraph.h"
+
+typedef struct QGenericPCIBus {
+    QOSGraphObject obj;
+    QPCIBus bus;
+    uint64_t gpex_pio_base;
+    uint64_t ecam_alloc_ptr;
+} QGenericPCIBus;
+
+/*
+ * qpci_init_generic():
+ * @ret: A valid QGenericPCIBus * pointer
+ * @qts: The %QTestState
+ * @alloc: A previously initialized @alloc providing memory for @qts
+ * @bool: devices can be hotplugged on this bus
+ *
+ * This function initializes an already allocated
+ * QGenericPCIBus object.
+ */
+void qpci_init_generic(QGenericPCIBus *ret, QTestState *qts,
+                       QGuestAllocator *alloc, bool hotpluggable);
+
+/* QGenericPCIHost */
+
+typedef struct QGenericPCIHost QGenericPCIHost;
+
+struct QGenericPCIHost {
+    QOSGraphObject obj;
+    QGenericPCIBus pci;
+};
+
+QOSGraphObject *generic_pcihost_get_device(void *obj, const char *device);
+void qos_create_generic_pcihost(QGenericPCIHost *host,
+                                QTestState *qts,
+                                QGuestAllocator *alloc);
+
+#endif
diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
index 9f292339f9..fd5d6e5ae1 100644
--- a/tests/qtest/libqos/meson.build
+++ b/tests/qtest/libqos/meson.build
@@ -45,6 +45,7 @@ libqos_srcs = files(
         'virtio-scsi.c',
         'virtio-serial.c',
         'virtio-iommu.c',
+        'generic-pcihost.c',
 
         # qgraph machines:
         'aarch64-xlnx-zcu102-machine.c',
-- 
2.36.0


