Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EFAA75F7
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 23:10:43 +0200 (CEST)
Received: from localhost ([::1]:51532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5G4Y-0001b9-Ci
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 17:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53330)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jag.raman@oracle.com>) id 1i5FZt-0007QQ-CV
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 16:39:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jag.raman@oracle.com>) id 1i5FZr-0000Mf-Im
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 16:39:01 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:36638)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jag.raman@oracle.com>)
 id 1i5FZr-0000L0-Ao
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 16:38:59 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x83KXem6066078;
 Tue, 3 Sep 2019 20:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2019-08-05;
 bh=4SShMEO4BMrcL4WeoxKpnzE+jvE1BAoblIgGAWyWpgU=;
 b=Q2bmpfmqzLhmc7ikB/tfntICurNHcqsYgC4v6c+m2FuYW1rB5W/hkd2RB6FJ9ZEhzaz6
 wwun/tG8ZUOuFlObsGxvgsDO2T7EN7Cs5B3iJSyQSG0R2bKPTPRuq3j0B/hqUBs8hpdk
 ZxsL+eghOhCAybgjd6/MZLJEUmPDTtFS+FKubje67IBFbMqxL/afeKqBNSdc6zVBhLcY
 8GrptE3Z0w2XAbcKqlWxZt39ZP7WUiOHQOuo9fO6VvsYCsVDVo5ztxqxHvmCn5UVH13m
 VRdnn9t8qiUGdr9IJv4qTaNn9w1wnqeoyrVJx32zOlGB8zJpLyVDY6y01JA6erQcZfEE OQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2usy4u8310-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Sep 2019 20:38:54 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x83KcIo1094718;
 Tue, 3 Sep 2019 20:38:53 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 2usu51u1un-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Sep 2019 20:38:53 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x83KcqnP012364;
 Tue, 3 Sep 2019 20:38:52 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 03 Sep 2019 13:38:52 -0700
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Date: Tue,  3 Sep 2019 16:37:45 -0400
Message-Id: <4c59e3b3d38d1e269be889cc31859ea97c15b2ff.1567534653.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1567534653.git.jag.raman@oracle.com>
References: <cover.1567534653.git.jag.raman@oracle.com>
In-Reply-To: <cover.1567534653.git.jag.raman@oracle.com>
References: <cover.1567534653.git.jag.raman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9369
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909030207
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9369
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909030206
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 156.151.31.86
Subject: [Qemu-devel] [RFC v3 PATCH 19/45] multi-process: Add LSI device
 proxy object
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, john.g.johnson@oracle.com,
 kraxel@redhat.com, jag.raman@oracle.com, quintela@redhat.com, mst@redhat.com,
 armbru@redhat.com, kanth.ghatraju@oracle.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 liran.alon@oracle.com, stefanha@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 berrange@redhat.com, mreitz@redhat.com, ross.lagerwall@citrix.com,
 marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adds proxy-lsi53c895a object, as a derivative of the pci-proxy-dev
object. This object is the proxy for the lsi53c895a object
instantiated by the remote process.

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
---
 hw/proxy/Makefile.objs              |   1 +
 hw/proxy/proxy-lsi53c895a.c         | 162 ++++++++++++++++++++++++++++++++++++
 include/hw/proxy/proxy-lsi53c895a.h |  42 ++++++++++
 3 files changed, 205 insertions(+)
 create mode 100644 hw/proxy/proxy-lsi53c895a.c
 create mode 100644 include/hw/proxy/proxy-lsi53c895a.h

diff --git a/hw/proxy/Makefile.objs b/hw/proxy/Makefile.objs
index eb81624..f562f5a 100644
--- a/hw/proxy/Makefile.objs
+++ b/hw/proxy/Makefile.objs
@@ -1 +1,2 @@
 common-obj-$(CONFIG_MPQEMU) += qemu-proxy.o
+common-obj-$(CONFIG_MPQEMU) += proxy-lsi53c895a.o
diff --git a/hw/proxy/proxy-lsi53c895a.c b/hw/proxy/proxy-lsi53c895a.c
new file mode 100644
index 0000000..e8a8d36
--- /dev/null
+++ b/hw/proxy/proxy-lsi53c895a.c
@@ -0,0 +1,162 @@
+/*
+ * Copyright 2019, Oracle and/or its affiliates.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include <sys/types.h>
+
+#include "qemu/osdep.h"
+#include "hw/qdev-core.h"
+#include "qemu/bitops.h"
+#include "hw/pci/pci.h"
+#include "hw/proxy/qemu-proxy.h"
+#include "hw/proxy/proxy-lsi53c895a.h"
+#include "exec/memory.h"
+
+static uint64_t proxy_lsi_io_read(void *opaque, hwaddr addr, unsigned size)
+{
+    ProxyLSIState *s = opaque;
+
+    return proxy_default_bar_read(PCI_PROXY_DEV(s), &s->io_io, addr, size,
+                                  false);
+}
+
+static void proxy_lsi_io_write(void *opaque, hwaddr addr, uint64_t val,
+                               unsigned size)
+{
+    ProxyLSIState *s = opaque;
+
+    proxy_default_bar_write(PCI_PROXY_DEV(s), &s->io_io, addr, val, size,
+                            false);
+}
+
+static const MemoryRegionOps proxy_lsi_io_ops = {
+    .read = proxy_lsi_io_read,
+    .write = proxy_lsi_io_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 1,
+    },
+};
+
+static uint64_t proxy_lsi_ram_read(void *opaque, hwaddr addr, unsigned size)
+{
+    ProxyLSIState *s = opaque;
+
+    return proxy_default_bar_read(PCI_PROXY_DEV(s), &s->ram_io, addr, size,
+                                  true);
+}
+
+static void proxy_lsi_ram_write(void *opaque, hwaddr addr, uint64_t val,
+                                unsigned size)
+{
+    ProxyLSIState *s = opaque;
+
+    proxy_default_bar_write(PCI_PROXY_DEV(s), &s->ram_io, addr, val, size,
+                            true);
+}
+
+static const MemoryRegionOps proxy_lsi_ram_ops = {
+    .read = proxy_lsi_ram_read,
+    .write = proxy_lsi_ram_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static uint64_t proxy_lsi_mmio_read(void *opaque, hwaddr addr, unsigned size)
+{
+    ProxyLSIState *s = opaque;
+
+    return proxy_default_bar_read(PCI_PROXY_DEV(s), &s->mmio_io, addr, size,
+                                  true);
+}
+
+static void proxy_lsi_mmio_write(void *opaque, hwaddr addr, uint64_t val,
+                                 unsigned size)
+{
+    ProxyLSIState *s = opaque;
+
+    proxy_default_bar_write(PCI_PROXY_DEV(s), &s->mmio_io, addr, val, size,
+                            true);
+}
+
+static const MemoryRegionOps proxy_lsi_mmio_ops = {
+    .read = proxy_lsi_mmio_read,
+    .write = proxy_lsi_mmio_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 1,
+    },
+};
+
+static void proxy_lsi_realize(PCIProxyDev *dev, Error **errp)
+{
+    ProxyLSIState *s = LSI_PROXY_DEV(dev);
+    PCIDevice *pci_dev = PCI_DEVICE(dev);
+    uint8_t *pci_conf = pci_dev->config;
+
+    pci_conf[PCI_LATENCY_TIMER] = 0xff;
+    pci_conf[PCI_INTERRUPT_PIN] = 0x01;
+
+    memory_region_init_io(&s->mmio_io, OBJECT(s), &proxy_lsi_mmio_ops, s,
+                          "proxy-lsi-mmio", 0x400);
+    memory_region_init_io(&s->ram_io, OBJECT(s), &proxy_lsi_ram_ops, s,
+                          "proxy-lsi-ram", 0x2000);
+    memory_region_init_io(&s->io_io, OBJECT(s), &proxy_lsi_io_ops, s,
+                          "proxy-lsi-io", 256);
+
+    pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &s->io_io);
+    pci_register_bar(pci_dev, 1, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->mmio_io);
+    pci_register_bar(pci_dev, 2, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->ram_io);
+}
+
+static void proxy_lsi_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *pci_class = PCI_DEVICE_CLASS(klass);
+    PCIProxyDevClass *proxy_class = PCI_PROXY_DEV_CLASS(klass);
+
+    proxy_class->realize = proxy_lsi_realize;
+    proxy_class->command = g_strdup("qemu-scsi-dev");
+
+    pci_class->vendor_id = PCI_VENDOR_ID_LSI_LOGIC;
+    pci_class->device_id = PCI_DEVICE_ID_LSI_53C895A;
+    pci_class->class_id = PCI_CLASS_STORAGE_SCSI;
+    pci_class->subsystem_id = 0x1000;
+
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
+
+    dc->desc = "LSI Proxy Device";
+}
+
+static const TypeInfo lsi_proxy_dev_type_info = {
+    .name          = TYPE_PROXY_LSI53C895A,
+    .parent        = TYPE_PCI_PROXY_DEV,
+    .instance_size = sizeof(ProxyLSIState),
+    .class_init    = proxy_lsi_class_init,
+};
+
+static void lsi_proxy_dev_register_types(void)
+{
+    type_register_static(&lsi_proxy_dev_type_info);
+}
+
+type_init(lsi_proxy_dev_register_types)
diff --git a/include/hw/proxy/proxy-lsi53c895a.h b/include/hw/proxy/proxy-lsi53c895a.h
new file mode 100644
index 0000000..8afb8f3
--- /dev/null
+++ b/include/hw/proxy/proxy-lsi53c895a.h
@@ -0,0 +1,42 @@
+/*
+ * Copyright 2019, Oracle and/or its affiliates.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef LSI_PROXY_H
+#define LSI_PROXY_H
+
+#include "hw/proxy/qemu-proxy.h"
+
+#define TYPE_PROXY_LSI53C895A "proxy-lsi53c895a"
+
+#define LSI_PROXY_DEV(obj) \
+            OBJECT_CHECK(ProxyLSIState, (obj), TYPE_PROXY_LSI53C895A)
+
+typedef struct ProxyLSIState {
+    PCIProxyDev parent_dev;
+
+    MemoryRegion mmio_io;
+    MemoryRegion ram_io;
+    MemoryRegion io_io;
+
+} ProxyLSIState;
+
+#endif
-- 
1.8.3.1


