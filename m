Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED0813ABED
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 15:11:21 +0100 (CET)
Received: from localhost ([::1]:40504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irMue-0005W4-8v
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 09:11:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54750)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <coiby.xu@gmail.com>) id 1irMsm-0003X4-V6
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 09:09:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <coiby.xu@gmail.com>) id 1irMsj-0008EF-NM
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 09:09:24 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:33261)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <coiby.xu@gmail.com>) id 1irMsj-0008Dc-Do
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 09:09:21 -0500
Received: by mail-pl1-x641.google.com with SMTP id ay11so5294373plb.0
 for <qemu-devel@nongnu.org>; Tue, 14 Jan 2020 06:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FDXlkBcLpLf9BJh9up3G3wY7P/raOIBTXkdtxoet+D8=;
 b=u0zqmIOzRBnnx8GvTyDdnn5/jfaEmDVSpdSqkobVfMhqzKcQoBNRHLIVBxAIArG1Je
 ozDWyp1Qwqq9Mx/tzg4PLhfljoLpoTiNXJ/AKnYFFlgxEl7ZOhPkXk05bOFHzkHJ19yZ
 oWH3af1TE/tA3ssrDDH5OF8z/RWUBl2xvyAu88i0FbKPyhb9DVaJ/eSZ0HZrG36GcMrx
 oUTVj9y7cUXeJm3/6tzLI3qQ1/6arSaphSzvI/ggvPL+R7MtgkokJR5jPDhaiUpOpNUU
 IrTmh24ObOX22Hpl1zE25UpASXZ0i+gnH7Dd66TaViAGJzdVW0wfgt+StdKFCpAgVzEe
 ymRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FDXlkBcLpLf9BJh9up3G3wY7P/raOIBTXkdtxoet+D8=;
 b=KIe77C5fi/0LNR/z5DZ5k8DPe7bZ70ohLc61EKczQNU5O9L0sKVAGa18t8h6lsmSnb
 zvKNRmPeNNq6Hs/WIOALuAmxt5SlNchsIau4lsdeo7ToEDBlcmnhW+NECVqtp2nL/dAh
 GKhaknezFab2lIeRNfLprSh1Jt1GoYUkmPydwO3HVEFphK4mrtxwj/uSpS2/T94ziz0V
 y+VcnOxxjYbpfmBmUqpLUXLizBBQz6PylMmaP4EpAH3bqwF4CfXiJS7LgYNMa/p3n4wN
 opZcSnNGauXKNSFqYhN/Nd2klBgdxoJzsc6E31MKq+RsLsmjcIfcPmzrxk6jPoNXHqd6
 iMgA==
X-Gm-Message-State: APjAAAVaWogjOXAf6+17sqxTu/pnbpZZXQAWHHhFJVeMQy+6c9qxM2hs
 k+iEifZwb0zIIbbhBDpkvOpsyX+gHHzpiw==
X-Google-Smtp-Source: APXvYqzqufOzSN8+tlmOWsdARAPjSLAVzgWsWWfwZ/5gjfQS0p9UfLirb4gdUcMf97JTY3C0hU5hQQ==
X-Received: by 2002:a17:90a:384f:: with SMTP id
 l15mr29363917pjf.134.1579010959722; 
 Tue, 14 Jan 2020 06:09:19 -0800 (PST)
Received: from localhost.localdomain ([175.124.145.172])
 by smtp.googlemail.com with ESMTPSA id a17sm17264773pjv.6.2020.01.14.06.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 06:09:19 -0800 (PST)
From: Coiby Xu <coiby.xu@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] new qTest case for the vhost-user-blk device backend
Date: Tue, 14 Jan 2020 22:06:19 +0800
Message-Id: <20200114140620.10385-5-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200114140620.10385-1-coiby.xu@gmail.com>
References: <20200114140620.10385-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
Cc: kwolf@redhat.com, bharatlkmlkvm@gmail.com, Coiby Xu <coiby.xu@gmail.com>,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This test case has the same tests as tests/virtio-blk-test.c except for
tests have block_resize.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 tests/libqos/vhost-user-blk.c | 125 ++++++
 tests/libqos/vhost-user-blk.h |  44 +++
 tests/vhost-user-blk-test.c   | 691 ++++++++++++++++++++++++++++++++++
 3 files changed, 860 insertions(+)
 create mode 100644 tests/libqos/vhost-user-blk.c
 create mode 100644 tests/libqos/vhost-user-blk.h
 create mode 100644 tests/vhost-user-blk-test.c

diff --git a/tests/libqos/vhost-user-blk.c b/tests/libqos/vhost-user-blk.c
new file mode 100644
index 0000000000..1f8e6eec7e
--- /dev/null
+++ b/tests/libqos/vhost-user-blk.c
@@ -0,0 +1,125 @@
+/*
+ * libqos driver framework
+ *
+ * Copyright (c) 2018 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License version 2 as published by the Free Software Foundation.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest.h"
+#include "qemu/module.h"
+#include "standard-headers/linux/virtio_blk.h"
+#include "libqos/qgraph.h"
+#include "libqos/vhost-user-blk.h"
+
+#define PCI_SLOT                0x04
+#define PCI_FN                  0x00
+
+/* virtio-blk-device */
+static void *qvhost_user_blk_get_driver(QVhostUserBlk *v_blk,
+                                    const char *interface)
+{
+    if (!g_strcmp0(interface, "vhost-user-blk")) {
+        return v_blk;
+    }
+    if (!g_strcmp0(interface, "virtio")) {
+        return v_blk->vdev;
+    }
+
+    fprintf(stderr, "%s not present in vhost-user-blk-device\n", interface);
+    g_assert_not_reached();
+}
+
+static void *qvhost_user_blk_device_get_driver(void *object,
+                                           const char *interface)
+{
+    QVhostUserBlkDevice *v_blk = object;
+    return qvhost_user_blk_get_driver(&v_blk->blk, interface);
+}
+
+static void *vhost_user_blk_device_create(void *virtio_dev,
+                                      QGuestAllocator *t_alloc,
+                                      void *addr)
+{
+    QVhostUserBlkDevice *vhost_user_blk = g_new0(QVhostUserBlkDevice, 1);
+    QVhostUserBlk *interface = &vhost_user_blk->blk;
+
+    interface->vdev = virtio_dev;
+
+    vhost_user_blk->obj.get_driver = qvhost_user_blk_device_get_driver;
+
+    return &vhost_user_blk->obj;
+}
+
+/* virtio-blk-pci */
+static void *qvhost_user_blk_pci_get_driver(void *object, const char *interface)
+{
+    QVhostUserBlkPCI *v_blk = object;
+    if (!g_strcmp0(interface, "pci-device")) {
+        return v_blk->pci_vdev.pdev;
+    }
+    return qvhost_user_blk_get_driver(&v_blk->blk, interface);
+}
+
+static void *vhost_user_blk_pci_create(void *pci_bus, QGuestAllocator *t_alloc,
+                                      void *addr)
+{
+    QVhostUserBlkPCI *vhost_user_blk = g_new0(QVhostUserBlkPCI, 1);
+    QVhostUserBlk *interface = &vhost_user_blk->blk;
+    QOSGraphObject *obj = &vhost_user_blk->pci_vdev.obj;
+
+    virtio_pci_init(&vhost_user_blk->pci_vdev, pci_bus, addr);
+    interface->vdev = &vhost_user_blk->pci_vdev.vdev;
+
+    g_assert_cmphex(interface->vdev->device_type, ==, VIRTIO_ID_BLOCK);
+
+    obj->get_driver = qvhost_user_blk_pci_get_driver;
+
+    return obj;
+}
+
+static void vhost_user_blk_register_nodes(void)
+{
+    /* FIXME: every test using these two nodes needs to setup a
+     * -drive,id=drive0 otherwise QEMU is not going to start.
+     * Therefore, we do not include "produces" edge for virtio
+     * and pci-device yet.
+    */
+
+    char *arg = g_strdup_printf("id=drv0,chardev=char1,addr=%x.%x",
+                                PCI_SLOT, PCI_FN);
+
+    QPCIAddress addr = {
+        .devfn = QPCI_DEVFN(PCI_SLOT, PCI_FN),
+    };
+
+    QOSGraphEdgeOptions opts = { };
+
+    /* virtio-blk-device */
+    /** opts.extra_device_opts = "drive=drive0"; */
+    qos_node_create_driver("vhost-user-blk-device", vhost_user_blk_device_create);
+    qos_node_consumes("vhost-user-blk-device", "virtio-bus", &opts);
+    qos_node_produces("vhost-user-blk-device", "vhost-user-blk");
+
+    /* virtio-blk-pci */
+    opts.extra_device_opts = arg;
+    add_qpci_address(&opts, &addr);
+    qos_node_create_driver("vhost-user-blk-pci", vhost_user_blk_pci_create);
+    qos_node_consumes("vhost-user-blk-pci", "pci-bus", &opts);
+    qos_node_produces("vhost-user-blk-pci", "vhost-user-blk");
+
+    g_free(arg);
+}
+
+libqos_init(vhost_user_blk_register_nodes);
diff --git a/tests/libqos/vhost-user-blk.h b/tests/libqos/vhost-user-blk.h
new file mode 100644
index 0000000000..ef4ef09cca
--- /dev/null
+++ b/tests/libqos/vhost-user-blk.h
@@ -0,0 +1,44 @@
+/*
+ * libqos driver framework
+ *
+ * Copyright (c) 2018 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License version 2 as published by the Free Software Foundation.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>
+ */
+
+#ifndef TESTS_LIBQOS_VHOST_USER_BLK_H
+#define TESTS_LIBQOS_VHOST_USER_BLK_H
+
+#include "libqos/qgraph.h"
+#include "libqos/virtio.h"
+#include "libqos/virtio-pci.h"
+
+typedef struct QVhostUserBlk QVhostUserBlk;
+typedef struct QVhostUserBlkPCI QVhostUserBlkPCI;
+typedef struct QVhostUserBlkDevice QVhostUserBlkDevice;
+
+struct QVhostUserBlk {
+    QVirtioDevice *vdev;
+};
+
+struct QVhostUserBlkPCI {
+    QVirtioPCIDevice pci_vdev;
+    QVhostUserBlk blk;
+};
+
+struct QVhostUserBlkDevice {
+    QOSGraphObject obj;
+    QVhostUserBlk blk;
+};
+
+#endif
diff --git a/tests/vhost-user-blk-test.c b/tests/vhost-user-blk-test.c
new file mode 100644
index 0000000000..d54769dd7f
--- /dev/null
+++ b/tests/vhost-user-blk-test.c
@@ -0,0 +1,691 @@
+/*
+ * QTest testcase for VirtIO Block Device
+ *
+ * Copyright (c) 2014 SUSE LINUX Products GmbH
+ * Copyright (c) 2014 Marc Marí
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest-single.h"
+#include "qemu/bswap.h"
+#include "qemu/module.h"
+#include "standard-headers/linux/virtio_blk.h"
+#include "standard-headers/linux/virtio_pci.h"
+#include "libqos/qgraph.h"
+#include "libqos/vhost-user-blk.h"
+#include "libqos/libqos-pc.h"
+
+/* TODO actually test the results and get rid of this */
+#define qmp_discard_response(...) qobject_unref(qmp(__VA_ARGS__))
+
+#define TEST_IMAGE_SIZE         (64 * 1024 * 1024)
+#define QVIRTIO_BLK_TIMEOUT_US  (30 * 1000 * 1000)
+#define PCI_SLOT_HP             0x06
+
+typedef struct QVirtioBlkReq {
+    uint32_t type;
+    uint32_t ioprio;
+    uint64_t sector;
+    char *data;
+    uint8_t status;
+} QVirtioBlkReq;
+
+
+#ifdef HOST_WORDS_BIGENDIAN
+static const bool host_is_big_endian = true;
+#else
+static const bool host_is_big_endian; /* false */
+#endif
+
+static inline void virtio_blk_fix_request(QVirtioDevice *d, QVirtioBlkReq *req)
+{
+    if (qvirtio_is_big_endian(d) != host_is_big_endian) {
+        req->type = bswap32(req->type);
+        req->ioprio = bswap32(req->ioprio);
+        req->sector = bswap64(req->sector);
+    }
+}
+
+
+static inline void virtio_blk_fix_dwz_hdr(QVirtioDevice *d,
+    struct virtio_blk_discard_write_zeroes *dwz_hdr)
+{
+    if (qvirtio_is_big_endian(d) != host_is_big_endian) {
+        dwz_hdr->sector = bswap64(dwz_hdr->sector);
+        dwz_hdr->num_sectors = bswap32(dwz_hdr->num_sectors);
+        dwz_hdr->flags = bswap32(dwz_hdr->flags);
+    }
+}
+
+static uint64_t virtio_blk_request(QGuestAllocator *alloc, QVirtioDevice *d,
+                                   QVirtioBlkReq *req, uint64_t data_size)
+{
+    uint64_t addr;
+    uint8_t status = 0xFF;
+
+    switch (req->type) {
+    case VIRTIO_BLK_T_IN:
+    case VIRTIO_BLK_T_OUT:
+        g_assert_cmpuint(data_size % 512, ==, 0);
+        break;
+    case VIRTIO_BLK_T_DISCARD:
+    case VIRTIO_BLK_T_WRITE_ZEROES:
+        g_assert_cmpuint(data_size %
+                         sizeof(struct virtio_blk_discard_write_zeroes), ==, 0);
+        break;
+    default:
+        g_assert_cmpuint(data_size, ==, 0);
+    }
+
+    addr = guest_alloc(alloc, sizeof(*req) + data_size);
+
+    virtio_blk_fix_request(d, req);
+
+    memwrite(addr, req, 16);
+    memwrite(addr + 16, req->data, data_size);
+    memwrite(addr + 16 + data_size, &status, sizeof(status));
+
+    return addr;
+}
+
+/* Returns the request virtqueue so the caller can perform further tests */
+static QVirtQueue *test_basic(QVirtioDevice *dev, QGuestAllocator *alloc)
+{
+    QVirtioBlkReq req;
+    uint64_t req_addr;
+    uint64_t capacity;
+    uint64_t features;
+    uint32_t free_head;
+    uint8_t status;
+    char *data;
+    QTestState *qts = global_qtest;
+    QVirtQueue *vq;
+
+    features = qvirtio_get_features(dev);
+    features = features & ~(QVIRTIO_F_BAD_FEATURE |
+                    (1u << VIRTIO_RING_F_INDIRECT_DESC) |
+                    (1u << VIRTIO_RING_F_EVENT_IDX) |
+                    (1u << VIRTIO_BLK_F_SCSI));
+    qvirtio_set_features(dev, features);
+
+    capacity = qvirtio_config_readq(dev, 0);
+    g_assert_cmpint(capacity, ==, TEST_IMAGE_SIZE / 512);
+
+    vq = qvirtqueue_setup(dev, alloc, 0);
+
+    qvirtio_set_driver_ok(dev);
+
+    /* Write and read with 3 descriptor layout */
+    /* Write request */
+    req.type = VIRTIO_BLK_T_OUT;
+    req.ioprio = 1;
+    req.sector = 0;
+    req.data = g_malloc0(512);
+    strcpy(req.data, "TEST");
+
+    req_addr = virtio_blk_request(alloc, dev, &req, 512);
+
+    g_free(req.data);
+
+    free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
+    qvirtqueue_add(qts, vq, req_addr + 16, 512, false, true);
+    qvirtqueue_add(qts, vq, req_addr + 528, 1, true, false);
+
+    qvirtqueue_kick(qts, dev, vq, free_head);
+
+    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
+                           QVIRTIO_BLK_TIMEOUT_US);
+    status = readb(req_addr + 528);
+    g_assert_cmpint(status, ==, 0);
+
+    guest_free(alloc, req_addr);
+
+    /* Read request */
+    req.type = VIRTIO_BLK_T_IN;
+    req.ioprio = 1;
+    req.sector = 0;
+    req.data = g_malloc0(512);
+
+    req_addr = virtio_blk_request(alloc, dev, &req, 512);
+
+    g_free(req.data);
+
+    free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
+    qvirtqueue_add(qts, vq, req_addr + 16, 512, true, true);
+    qvirtqueue_add(qts, vq, req_addr + 528, 1, true, false);
+
+    qvirtqueue_kick(qts, dev, vq, free_head);
+
+    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
+                           QVIRTIO_BLK_TIMEOUT_US);
+    status = readb(req_addr + 528);
+    g_assert_cmpint(status, ==, 0);
+
+    data = g_malloc0(512);
+    memread(req_addr + 16, data, 512);
+    g_assert_cmpstr(data, ==, "TEST");
+    g_free(data);
+
+    guest_free(alloc, req_addr);
+
+    if (features & (1u << VIRTIO_BLK_F_WRITE_ZEROES)) {
+        struct virtio_blk_discard_write_zeroes dwz_hdr;
+        void *expected;
+
+        /*
+         * WRITE_ZEROES request on the same sector of previous test where
+         * we wrote "TEST".
+         */
+        req.type = VIRTIO_BLK_T_WRITE_ZEROES;
+        req.data = (char *) &dwz_hdr;
+        dwz_hdr.sector = 0;
+        dwz_hdr.num_sectors = 1;
+        dwz_hdr.flags = 0;
+
+        virtio_blk_fix_dwz_hdr(dev, &dwz_hdr);
+
+        req_addr = virtio_blk_request(alloc, dev, &req, sizeof(dwz_hdr));
+
+        free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
+        qvirtqueue_add(qts, vq, req_addr + 16, sizeof(dwz_hdr), false, true);
+        qvirtqueue_add(qts, vq, req_addr + 16 + sizeof(dwz_hdr), 1, true,
+                       false);
+
+        qvirtqueue_kick(qts, dev, vq, free_head);
+
+        qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
+                               QVIRTIO_BLK_TIMEOUT_US);
+        status = readb(req_addr + 16 + sizeof(dwz_hdr));
+        g_assert_cmpint(status, ==, 0);
+
+        guest_free(alloc, req_addr);
+
+        /* Read request to check if the sector contains all zeroes */
+        req.type = VIRTIO_BLK_T_IN;
+        req.ioprio = 1;
+        req.sector = 0;
+        req.data = g_malloc0(512);
+
+        req_addr = virtio_blk_request(alloc, dev, &req, 512);
+
+        g_free(req.data);
+
+        free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
+        qvirtqueue_add(qts, vq, req_addr + 16, 512, true, true);
+        qvirtqueue_add(qts, vq, req_addr + 528, 1, true, false);
+
+        qvirtqueue_kick(qts, dev, vq, free_head);
+
+        qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
+                               QVIRTIO_BLK_TIMEOUT_US);
+        status = readb(req_addr + 528);
+        g_assert_cmpint(status, ==, 0);
+
+        data = g_malloc(512);
+        expected = g_malloc0(512);
+        memread(req_addr + 16, data, 512);
+        g_assert_cmpmem(data, 512, expected, 512);
+        g_free(expected);
+        g_free(data);
+
+        guest_free(alloc, req_addr);
+    }
+
+    if (features & (1u << VIRTIO_BLK_F_DISCARD)) {
+        struct virtio_blk_discard_write_zeroes dwz_hdr;
+
+        req.type = VIRTIO_BLK_T_DISCARD;
+        req.data = (char *) &dwz_hdr;
+        dwz_hdr.sector = 0;
+        dwz_hdr.num_sectors = 1;
+        dwz_hdr.flags = 0;
+
+        virtio_blk_fix_dwz_hdr(dev, &dwz_hdr);
+
+        req_addr = virtio_blk_request(alloc, dev, &req, sizeof(dwz_hdr));
+
+        free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
+        qvirtqueue_add(qts, vq, req_addr + 16, sizeof(dwz_hdr), false, true);
+        qvirtqueue_add(qts, vq, req_addr + 16 + sizeof(dwz_hdr), 1, true, false);
+
+        qvirtqueue_kick(qts, dev, vq, free_head);
+
+        qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
+                               QVIRTIO_BLK_TIMEOUT_US);
+        status = readb(req_addr + 16 + sizeof(dwz_hdr));
+        g_assert_cmpint(status, ==, 0);
+
+        guest_free(alloc, req_addr);
+    }
+
+    if (features & (1u << VIRTIO_F_ANY_LAYOUT)) {
+        /* Write and read with 2 descriptor layout */
+        /* Write request */
+        req.type = VIRTIO_BLK_T_OUT;
+        req.ioprio = 1;
+        req.sector = 1;
+        req.data = g_malloc0(512);
+        strcpy(req.data, "TEST");
+
+        req_addr = virtio_blk_request(alloc, dev, &req, 512);
+
+        g_free(req.data);
+
+        free_head = qvirtqueue_add(qts, vq, req_addr, 528, false, true);
+        qvirtqueue_add(qts, vq, req_addr + 528, 1, true, false);
+        qvirtqueue_kick(qts, dev, vq, free_head);
+
+        qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
+                               QVIRTIO_BLK_TIMEOUT_US);
+        status = readb(req_addr + 528);
+        g_assert_cmpint(status, ==, 0);
+
+        guest_free(alloc, req_addr);
+
+        /* Read request */
+        req.type = VIRTIO_BLK_T_IN;
+        req.ioprio = 1;
+        req.sector = 1;
+        req.data = g_malloc0(512);
+
+        req_addr = virtio_blk_request(alloc, dev, &req, 512);
+
+        g_free(req.data);
+
+        free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
+        qvirtqueue_add(qts, vq, req_addr + 16, 513, true, false);
+
+        qvirtqueue_kick(qts, dev, vq, free_head);
+
+        qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
+                               QVIRTIO_BLK_TIMEOUT_US);
+        status = readb(req_addr + 528);
+        g_assert_cmpint(status, ==, 0);
+
+        data = g_malloc0(512);
+        memread(req_addr + 16, data, 512);
+        g_assert_cmpstr(data, ==, "TEST");
+        g_free(data);
+
+        guest_free(alloc, req_addr);
+    }
+
+    return vq;
+}
+
+static void basic(void *obj, void *data, QGuestAllocator *t_alloc)
+{
+    QVhostUserBlk *blk_if = obj;
+    QVirtQueue *vq;
+
+    vq = test_basic(blk_if->vdev, t_alloc);
+    qvirtqueue_cleanup(blk_if->vdev->bus, vq, t_alloc);
+
+}
+
+static void indirect(void *obj, void *u_data, QGuestAllocator *t_alloc)
+{
+    QVirtQueue *vq;
+    QVhostUserBlk *blk_if = obj;
+    QVirtioDevice *dev = blk_if->vdev;
+    QVirtioBlkReq req;
+    QVRingIndirectDesc *indirect;
+    uint64_t req_addr;
+    uint64_t capacity;
+    uint64_t features;
+    uint32_t free_head;
+    uint8_t status;
+    char *data;
+    QTestState *qts = global_qtest;
+
+    features = qvirtio_get_features(dev);
+    g_assert_cmphex(features & (1u << VIRTIO_RING_F_INDIRECT_DESC), !=, 0);
+    features = features & ~(QVIRTIO_F_BAD_FEATURE |
+                            (1u << VIRTIO_RING_F_EVENT_IDX) |
+                            (1u << VIRTIO_BLK_F_SCSI));
+    qvirtio_set_features(dev, features);
+
+    capacity = qvirtio_config_readq(dev, 0);
+    g_assert_cmpint(capacity, ==, TEST_IMAGE_SIZE / 512);
+
+    vq = qvirtqueue_setup(dev, t_alloc, 0);
+    qvirtio_set_driver_ok(dev);
+
+    /* Write request */
+    req.type = VIRTIO_BLK_T_OUT;
+    req.ioprio = 1;
+    req.sector = 0;
+    req.data = g_malloc0(512);
+    strcpy(req.data, "TEST");
+
+    req_addr = virtio_blk_request(t_alloc, dev, &req, 512);
+
+    g_free(req.data);
+
+    indirect = qvring_indirect_desc_setup(qts, dev, t_alloc, 2);
+    qvring_indirect_desc_add(dev, qts, indirect, req_addr, 528, false);
+    qvring_indirect_desc_add(dev, qts, indirect, req_addr + 528, 1, true);
+    free_head = qvirtqueue_add_indirect(qts, vq, indirect);
+    qvirtqueue_kick(qts, dev, vq, free_head);
+
+    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
+                           QVIRTIO_BLK_TIMEOUT_US);
+    status = readb(req_addr + 528);
+    g_assert_cmpint(status, ==, 0);
+
+    g_free(indirect);
+    guest_free(t_alloc, req_addr);
+
+    /* Read request */
+    req.type = VIRTIO_BLK_T_IN;
+    req.ioprio = 1;
+    req.sector = 0;
+    req.data = g_malloc0(512);
+    strcpy(req.data, "TEST");
+
+    req_addr = virtio_blk_request(t_alloc, dev, &req, 512);
+
+    g_free(req.data);
+
+    indirect = qvring_indirect_desc_setup(qts, dev, t_alloc, 2);
+    qvring_indirect_desc_add(dev, qts, indirect, req_addr, 16, false);
+    qvring_indirect_desc_add(dev, qts, indirect, req_addr + 16, 513, true);
+    free_head = qvirtqueue_add_indirect(qts, vq, indirect);
+    qvirtqueue_kick(qts, dev, vq, free_head);
+
+    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
+                           QVIRTIO_BLK_TIMEOUT_US);
+    status = readb(req_addr + 528);
+    g_assert_cmpint(status, ==, 0);
+
+    data = g_malloc0(512);
+    memread(req_addr + 16, data, 512);
+    g_assert_cmpstr(data, ==, "TEST");
+    g_free(data);
+
+    g_free(indirect);
+    guest_free(t_alloc, req_addr);
+    qvirtqueue_cleanup(dev->bus, vq, t_alloc);
+}
+
+
+static void idx(void *obj, void *u_data, QGuestAllocator *t_alloc)
+{
+    QVirtQueue *vq;
+    QVhostUserBlkPCI *blk = obj;
+    QVirtioPCIDevice *pdev = &blk->pci_vdev;
+    QVirtioDevice *dev = &pdev->vdev;
+    QVirtioBlkReq req;
+    uint64_t req_addr;
+    uint64_t capacity;
+    uint64_t features;
+    uint32_t free_head;
+    uint32_t write_head;
+    uint32_t desc_idx;
+    uint8_t status;
+    char *data;
+    QOSGraphObject *blk_object = obj;
+    QPCIDevice *pci_dev = blk_object->get_driver(blk_object, "pci-device");
+    QTestState *qts = global_qtest;
+
+    if (qpci_check_buggy_msi(pci_dev)) {
+        return;
+    }
+
+    qpci_msix_enable(pdev->pdev);
+    qvirtio_pci_set_msix_configuration_vector(pdev, t_alloc, 0);
+
+    features = qvirtio_get_features(dev);
+    features = features & ~(QVIRTIO_F_BAD_FEATURE |
+                            (1u << VIRTIO_RING_F_INDIRECT_DESC) |
+                            (1u << VIRTIO_F_NOTIFY_ON_EMPTY) |
+                            (1u << VIRTIO_BLK_F_SCSI));
+    qvirtio_set_features(dev, features);
+
+    capacity = qvirtio_config_readq(dev, 0);
+    g_assert_cmpint(capacity, ==, TEST_IMAGE_SIZE / 512);
+
+    vq = qvirtqueue_setup(dev, t_alloc, 0);
+    qvirtqueue_pci_msix_setup(pdev, (QVirtQueuePCI *)vq, t_alloc, 1);
+
+    qvirtio_set_driver_ok(dev);
+
+    /* Write request */
+    req.type = VIRTIO_BLK_T_OUT;
+    req.ioprio = 1;
+    req.sector = 0;
+    req.data = g_malloc0(512);
+    strcpy(req.data, "TEST");
+
+    req_addr = virtio_blk_request(t_alloc, dev, &req, 512);
+
+    g_free(req.data);
+
+    free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
+    qvirtqueue_add(qts, vq, req_addr + 16, 512, false, true);
+    qvirtqueue_add(qts, vq, req_addr + 528, 1, true, false);
+    qvirtqueue_kick(qts, dev, vq, free_head);
+
+    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
+                           QVIRTIO_BLK_TIMEOUT_US);
+
+    /* Write request */
+    req.type = VIRTIO_BLK_T_OUT;
+    req.ioprio = 1;
+    req.sector = 1;
+    req.data = g_malloc0(512);
+    strcpy(req.data, "TEST");
+
+    req_addr = virtio_blk_request(t_alloc, dev, &req, 512);
+
+    g_free(req.data);
+
+    /* Notify after processing the third request */
+    qvirtqueue_set_used_event(qts, vq, 2);
+    free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
+    qvirtqueue_add(qts, vq, req_addr + 16, 512, false, true);
+    qvirtqueue_add(qts, vq, req_addr + 528, 1, true, false);
+    qvirtqueue_kick(qts, dev, vq, free_head);
+    write_head = free_head;
+
+    /* No notification expected */
+    status = qvirtio_wait_status_byte_no_isr(qts, dev,
+                                             vq, req_addr + 528,
+                                             QVIRTIO_BLK_TIMEOUT_US);
+    g_assert_cmpint(status, ==, 0);
+
+    guest_free(t_alloc, req_addr);
+
+    /* Read request */
+    req.type = VIRTIO_BLK_T_IN;
+    req.ioprio = 1;
+    req.sector = 1;
+    req.data = g_malloc0(512);
+
+    req_addr = virtio_blk_request(t_alloc, dev, &req, 512);
+
+    g_free(req.data);
+
+    free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
+    qvirtqueue_add(qts, vq, req_addr + 16, 512, true, true);
+    qvirtqueue_add(qts, vq, req_addr + 528, 1, true, false);
+
+    qvirtqueue_kick(qts, dev, vq, free_head);
+
+    /* We get just one notification for both requests */
+    qvirtio_wait_used_elem(qts, dev, vq, write_head, NULL,
+                           QVIRTIO_BLK_TIMEOUT_US);
+    g_assert(qvirtqueue_get_buf(qts, vq, &desc_idx, NULL));
+    g_assert_cmpint(desc_idx, ==, free_head);
+
+    status = readb(req_addr + 528);
+    g_assert_cmpint(status, ==, 0);
+
+    data = g_malloc0(512);
+    memread(req_addr + 16, data, 512);
+    g_assert_cmpstr(data, ==, "TEST");
+    g_free(data);
+
+    guest_free(t_alloc, req_addr);
+
+    /* End test */
+    qpci_msix_disable(pdev->pdev);
+
+    qvirtqueue_cleanup(dev->bus, vq, t_alloc);
+}
+
+static void pci_hotplug(void *obj, void *data, QGuestAllocator *t_alloc)
+{
+    QVirtioPCIDevice *dev1 = obj;
+    QVirtioPCIDevice *dev;
+    QTestState *qts = dev1->pdev->bus->qts;
+
+    /* plug secondary disk */
+    qtest_qmp_device_add(qts, "vhost-user-blk-pci", "drv1",
+                         "{'addr': %s, 'chardev': 'char2'}",
+                         stringify(PCI_SLOT_HP) ".0");
+
+    dev = virtio_pci_new(dev1->pdev->bus,
+                         &(QPCIAddress) { .devfn = QPCI_DEVFN(PCI_SLOT_HP, 0) });
+    g_assert_nonnull(dev);
+    g_assert_cmpint(dev->vdev.device_type, ==, VIRTIO_ID_BLOCK);
+    qvirtio_pci_device_disable(dev);
+    qos_object_destroy((QOSGraphObject *)dev);
+
+    /* unplug secondary disk */
+    qpci_unplug_acpi_device_test(qts, "drv1", PCI_SLOT_HP);
+}
+
+/*
+ * Check that setting the vring addr on a non-existent virtqueue does
+ * not crash.
+ */
+static void test_nonexistent_virtqueue(void *obj, void *data,
+                                       QGuestAllocator *t_alloc)
+{
+    QVhostUserBlkPCI *blk = obj;
+    QVirtioPCIDevice *pdev = &blk->pci_vdev;
+    QPCIBar bar0;
+    QPCIDevice *dev;
+
+    dev = qpci_device_find(pdev->pdev->bus, QPCI_DEVFN(4, 0));
+    g_assert(dev != NULL);
+    qpci_device_enable(dev);
+
+    bar0 = qpci_iomap(dev, 0, NULL);
+
+    qpci_io_writeb(dev, bar0, VIRTIO_PCI_QUEUE_SEL, 2);
+    qpci_io_writel(dev, bar0, VIRTIO_PCI_QUEUE_PFN, 1);
+
+    g_free(dev);
+}
+
+static const char *qtest_qemu_vu_binary(void)
+{
+    const char *qemu_vu_bin;
+
+    qemu_vu_bin = getenv("QTEST_QEMU_VU_BINARY");
+    if (!qemu_vu_bin) {
+        fprintf(stderr, "Environment variable QTEST_QEMU_VU_BINARY required\n");
+        exit(0);
+    }
+
+    return qemu_vu_bin;
+}
+
+static void drive_destroy(void *path)
+{
+    unlink(path);
+    g_free(path);
+    qos_invalidate_command_line();
+}
+
+
+static char *drive_create(void)
+{
+ int fd, ret;
+ /** vhost-user-blk won't recognize drive located in /tmp */
+ char *t_path = g_strdup("qtest.XXXXXX");
+
+ /** Create a temporary raw image */
+ fd = mkstemp(t_path);
+ g_assert_cmpint(fd, >=, 0);
+ ret = ftruncate(fd, TEST_IMAGE_SIZE);
+ g_assert_cmpint(ret, ==, 0);
+ close(fd);
+
+ g_test_queue_destroy(drive_destroy, t_path);
+ return t_path;
+}
+
+
+
+static void start_vhost_user_blk(const char *img_path, const char *sock_path)
+{
+    const char *vhost_user_blk_bin = qtest_qemu_vu_binary();
+    /* "qemu-vu -e" will exit when the client disconnects thus the launched
+     *  qemu-vu process will not block scripts/tap-driver.pl
+     */
+    gchar *command = g_strdup_printf("exec %s "
+                                     "-e "
+                                     "-k %s "
+                                     "-f raw "
+                                     "%s",
+                                     vhost_user_blk_bin,
+                                     sock_path, img_path);
+    g_test_message("starting vhost-user backend: %s", command);
+    pid_t pid = fork();
+    if (pid == 0) {
+        execlp("/bin/sh", "sh", "-c", command, NULL);
+        exit(1);
+    }
+    /*
+     * make sure qemu-vu i.e. socket server is started before tests
+     * otherwise qemu will complain,
+     * "Failed to connect socket ... Connection refused"
+     */
+    g_usleep(G_USEC_PER_SEC);
+}
+
+static void *vhost_user_blk_test_setup(GString *cmd_line, void *arg)
+{
+    /* create image file */
+    const char *img_path = drive_create();
+    const char *sock_path = "/tmp/vhost-user-blk_vhost.socket";
+    start_vhost_user_blk(img_path, sock_path);
+    /* "-chardev socket,id=char2" is used for pci_hotplug*/
+    g_string_append_printf(cmd_line,
+                           " -object memory-backend-memfd,id=mem,size=128M,share=on -numa node,memdev=mem "
+                           "-chardev socket,id=char1,path=%s "
+                           "-chardev socket,id=char2,path=%s",
+                           sock_path, sock_path);
+    return arg;
+}
+
+static void register_vhost_user_blk_test(void)
+{
+    QOSGraphTestOptions opts = {
+        .before = vhost_user_blk_test_setup,
+    };
+
+    /*
+     * tests for vhost-user-blk and vhost-user-blk-pci
+     * The tests are borrowed from tests/virtio-blk-test.c. But some tests
+     * regarding block_resize don't work for vhost-user-blk.
+     * vhost-user-blk device doesn't have -drive, so tests containing
+     * block_resize are also abandoned,
+     *  - config
+     *  - resize
+     */
+    qos_add_test("basic", "vhost-user-blk", basic, &opts);
+    qos_add_test("indirect", "vhost-user-blk", indirect, &opts);
+    qos_add_test("idx", "vhost-user-blk-pci", idx, &opts);
+    qos_add_test("nxvirtq", "vhost-user-blk-pci",
+                      test_nonexistent_virtqueue, &opts);
+    qos_add_test("hotplug", "vhost-user-blk-pci", pci_hotplug, &opts);
+}
+
+libqos_init(register_vhost_user_blk_test);
--
2.24.1


