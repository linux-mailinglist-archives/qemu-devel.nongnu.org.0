Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6DD2DE536
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 15:58:36 +0100 (CET)
Received: from localhost ([::1]:43058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHDG-0008HQ-SD
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 09:58:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <coiby.xu@gmail.com>)
 id 1kqHCD-0007i8-7p; Fri, 18 Dec 2020 09:57:29 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:36436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <coiby.xu@gmail.com>)
 id 1kqHC9-0007rr-Pk; Fri, 18 Dec 2020 09:57:28 -0500
Received: by mail-pf1-x436.google.com with SMTP id t22so1697472pfl.3;
 Fri, 18 Dec 2020 06:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=wEXbZM3j+Ak1w1z0+h4xwAgTuBjVLgyTmmwNlsxfvTc=;
 b=LODL6JhFJth1+0PFesGjgpsK8Czad6d2fpu7gYAbTv118tYLoV22+igb3FTXPTbeKT
 t9uG/0LTanUBk0uoBO6UAmblqTsqMSqHuQ4f2hsyFFO65KxBbN/L68Duc4oVF1wIV/yi
 WzdAQfFgP1kk3D6ZuIDZIPyZYhTnv1sZwucliKc6yihAv+U3fO6SaB92YL77f6qbq3qN
 3CbxfgE2nCEUNcBEdYi7Q6QfrwMU87NdJkgAHJRTtCRrZBQLU/kYelOWPvyRv2LuPJpv
 0dHuT0Vbeg3WIL8xVw7GbafoCLIxJ+thrVg6loEzyUeKgkH089Syupc4DXMqU1T+pYoE
 HW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wEXbZM3j+Ak1w1z0+h4xwAgTuBjVLgyTmmwNlsxfvTc=;
 b=kfCZybWK/vpdyh2pWEaZFyU+rUZfBHiOXJ/EFP5VLk+/t+x9UPJhbgFkEzEo8Lg3XC
 rUHCNBB8G27MdCjmzrlNwsI9L4IudknNQsK7FN5ZPuAku6zWLcinxmY1JzrWLdtgDLKd
 FQb5dTp6G+p7u6w63nCtWeqJmv1hLHELwZfWPG0myNdeeAyHG1rAdSPvHCe1+uqPH0Zg
 35Wm336IJVGEK6NcF9tv3BjhdR2kk6yRaqFkZ+0NpnqvgS4R2A0cqVJdJBkGvNCqo7+E
 WFo56k+Xlpn1/7BQfm0qizivaIwEwXvZDJrm2975Kvb939F7mem0emAVWWZOz+I3xVuk
 mk8Q==
X-Gm-Message-State: AOAM5318+1AD3/p6LBBXEnaKyOLR2vUpqQ4yrCmnz/10r4FAvtER14ve
 jtoX/GrMn6LeqTQKdN8KMg0=
X-Google-Smtp-Source: ABdhPJw2ZmLJpPQ4nUUwVsCsHCWHoIwi21BAij+Wtyzv5IuX+N+5y0djDjc7AD36GYJWiqoXmhbrzA==
X-Received: by 2002:a05:6a00:ac5:b029:19d:97c2:d3a7 with SMTP id
 c5-20020a056a000ac5b029019d97c2d3a7mr4173169pfl.61.1608303443960; 
 Fri, 18 Dec 2020 06:57:23 -0800 (PST)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id x23sm10602362pge.47.2020.12.18.06.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 06:57:22 -0800 (PST)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Fri, 18 Dec 2020 22:56:32 +0800
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 05/12] test: new qTest case to test the
 vhost-user-blk-server
Message-ID: <20201218145632.7id2vg3pyngqhezs@Rk>
References: <20201207172030.251905-1-stefanha@redhat.com>
 <20201207172030.251905-6-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201207172030.251905-6-stefanha@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=coiby.xu@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 07, 2020 at 05:20:23PM +0000, Stefan Hajnoczi wrote:
>From: Coiby Xu <coiby.xu@gmail.com>
>
>This test case has the same tests as tests/virtio-blk-test.c except for
>tests have block_resize. Since the vhost-user-blk export only serves one
>client one time, two exports are started by qemu-storage-daemon for the
>hotplug test.
>
>Suggested-by: Thomas Huth <thuth@redhat.com>
>Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>---
> MAINTAINERS                         |   2 +
> tests/qtest/libqos/vhost-user-blk.h |  48 ++
> tests/qtest/libqos/vhost-user-blk.c | 130 +++++
> tests/qtest/vhost-user-blk-test.c   | 788 ++++++++++++++++++++++++++++
> tests/qtest/libqos/meson.build      |   1 +
> tests/qtest/meson.build             |   4 +
> 6 files changed, 973 insertions(+)
> create mode 100644 tests/qtest/libqos/vhost-user-blk.h
> create mode 100644 tests/qtest/libqos/vhost-user-blk.c
> create mode 100644 tests/qtest/vhost-user-blk-test.c
>
>diff --git a/MAINTAINERS b/MAINTAINERS
>index 68bc160f41..d351280d1f 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -3103,6 +3103,8 @@ F: block/export/vhost-user-blk-server.c
> F: block/export/vhost-user-blk-server.h
> F: include/qemu/vhost-user-server.h
> F: tests/qtest/libqos/vhost-user-blk.c
>+F: tests/qtest/libqos/vhost-user-blk.h
>+F: tests/qtest/vhost-user-blk-test.c
> F: util/vhost-user-server.c
>
> Replication
>diff --git a/tests/qtest/libqos/vhost-user-blk.h b/tests/qtest/libqos/vhost-user-blk.h
>new file mode 100644
>index 0000000000..2a03456a45
>--- /dev/null
>+++ b/tests/qtest/libqos/vhost-user-blk.h
>@@ -0,0 +1,48 @@
>+/*
>+ * libqos driver framework
>+ *
>+ * Based on tests/qtest/libqos/virtio-blk.c
>+ *
>+ * Copyright (c) 2020 Coiby Xu <coiby.xu@gmail.com>
>+ *
>+ * Copyright (c) 2018 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>
>+ *
>+ * This library is free software; you can redistribute it and/or
>+ * modify it under the terms of the GNU Lesser General Public
>+ * License version 2 as published by the Free Software Foundation.
>+ *
>+ * This library is distributed in the hope that it will be useful,
>+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
>+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>+ * Lesser General Public License for more details.
>+ *
>+ * You should have received a copy of the GNU Lesser General Public
>+ * License along with this library; if not, see <http://www.gnu.org/licenses/>
>+ */
>+
>+#ifndef TESTS_LIBQOS_VHOST_USER_BLK_H
>+#define TESTS_LIBQOS_VHOST_USER_BLK_H
>+
>+#include "qgraph.h"
>+#include "virtio.h"
>+#include "virtio-pci.h"
>+
>+typedef struct QVhostUserBlk QVhostUserBlk;
>+typedef struct QVhostUserBlkPCI QVhostUserBlkPCI;
>+typedef struct QVhostUserBlkDevice QVhostUserBlkDevice;
>+
>+struct QVhostUserBlk {
>+    QVirtioDevice *vdev;
>+};
>+
>+struct QVhostUserBlkPCI {
>+    QVirtioPCIDevice pci_vdev;
>+    QVhostUserBlk blk;
>+};
>+
>+struct QVhostUserBlkDevice {
>+    QOSGraphObject obj;
>+    QVhostUserBlk blk;
>+};
>+
>+#endif
>diff --git a/tests/qtest/libqos/vhost-user-blk.c b/tests/qtest/libqos/vhost-user-blk.c
>new file mode 100644
>index 0000000000..568c3426ed
>--- /dev/null
>+++ b/tests/qtest/libqos/vhost-user-blk.c
>@@ -0,0 +1,130 @@
>+/*
>+ * libqos driver framework
>+ *
>+ * Based on tests/qtest/libqos/virtio-blk.c
>+ *
>+ * Copyright (c) 2020 Coiby Xu <coiby.xu@gmail.com>
>+ *
>+ * Copyright (c) 2018 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>
>+ *
>+ * This library is free software; you can redistribute it and/or
>+ * modify it under the terms of the GNU Lesser General Public
>+ * License version 2.1 as published by the Free Software Foundation.
>+ *
>+ * This library is distributed in the hope that it will be useful,
>+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
>+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>+ * Lesser General Public License for more details.
>+ *
>+ * You should have received a copy of the GNU Lesser General Public
>+ * License along with this library; if not, see <http://www.gnu.org/licenses/>
>+ */
>+
>+#include "qemu/osdep.h"
>+#include "libqtest.h"
>+#include "qemu/module.h"
>+#include "standard-headers/linux/virtio_blk.h"
>+#include "vhost-user-blk.h"
>+
>+#define PCI_SLOT                0x04
>+#define PCI_FN                  0x00
>+
>+/* virtio-blk-device */
>+static void *qvhost_user_blk_get_driver(QVhostUserBlk *v_blk,
>+                                    const char *interface)
>+{
>+    if (!g_strcmp0(interface, "vhost-user-blk")) {
>+        return v_blk;
>+    }
>+    if (!g_strcmp0(interface, "virtio")) {
>+        return v_blk->vdev;
>+    }
>+
>+    fprintf(stderr, "%s not present in vhost-user-blk-device\n", interface);
>+    g_assert_not_reached();
>+}
>+
>+static void *qvhost_user_blk_device_get_driver(void *object,
>+                                           const char *interface)
>+{
>+    QVhostUserBlkDevice *v_blk = object;
>+    return qvhost_user_blk_get_driver(&v_blk->blk, interface);
>+}
>+
>+static void *vhost_user_blk_device_create(void *virtio_dev,
>+                                      QGuestAllocator *t_alloc,
>+                                      void *addr)
>+{
>+    QVhostUserBlkDevice *vhost_user_blk = g_new0(QVhostUserBlkDevice, 1);
>+    QVhostUserBlk *interface = &vhost_user_blk->blk;
>+
>+    interface->vdev = virtio_dev;
>+
>+    vhost_user_blk->obj.get_driver = qvhost_user_blk_device_get_driver;
>+
>+    return &vhost_user_blk->obj;
>+}
>+
>+/* virtio-blk-pci */
>+static void *qvhost_user_blk_pci_get_driver(void *object, const char *interface)
>+{
>+    QVhostUserBlkPCI *v_blk = object;
>+    if (!g_strcmp0(interface, "pci-device")) {
>+        return v_blk->pci_vdev.pdev;
>+    }
>+    return qvhost_user_blk_get_driver(&v_blk->blk, interface);
>+}
>+
>+static void *vhost_user_blk_pci_create(void *pci_bus, QGuestAllocator *t_alloc,
>+                                      void *addr)
>+{
>+    QVhostUserBlkPCI *vhost_user_blk = g_new0(QVhostUserBlkPCI, 1);
>+    QVhostUserBlk *interface = &vhost_user_blk->blk;
>+    QOSGraphObject *obj = &vhost_user_blk->pci_vdev.obj;
>+
>+    virtio_pci_init(&vhost_user_blk->pci_vdev, pci_bus, addr);
>+    interface->vdev = &vhost_user_blk->pci_vdev.vdev;
>+
>+    g_assert_cmphex(interface->vdev->device_type, ==, VIRTIO_ID_BLOCK);
>+
>+    obj->get_driver = qvhost_user_blk_pci_get_driver;
>+
>+    return obj;
>+}
>+
>+static void vhost_user_blk_register_nodes(void)
>+{
>+    /*
>+     * FIXME: every test using these two nodes needs to setup a
>+     * -drive,id=drive0 otherwise QEMU is not going to start.
>+     * Therefore, we do not include "produces" edge for virtio
>+     * and pci-device yet.
>+     */
>+
>+    char *arg = g_strdup_printf("id=drv0,chardev=char1,addr=%x.%x",
>+                                PCI_SLOT, PCI_FN);
>+
>+    QPCIAddress addr = {
>+        .devfn = QPCI_DEVFN(PCI_SLOT, PCI_FN),
>+    };
>+
>+    QOSGraphEdgeOptions opts = { };
>+
>+    /* virtio-blk-device */
>+    /** opts.extra_device_opts = "drive=drive0"; */
>+    qos_node_create_driver("vhost-user-blk-device",
>+                           vhost_user_blk_device_create);
>+    qos_node_consumes("vhost-user-blk-device", "virtio-bus", &opts);
>+    qos_node_produces("vhost-user-blk-device", "vhost-user-blk");
>+
>+    /* virtio-blk-pci */
>+    opts.extra_device_opts = arg;
>+    add_qpci_address(&opts, &addr);
>+    qos_node_create_driver("vhost-user-blk-pci", vhost_user_blk_pci_create);
>+    qos_node_consumes("vhost-user-blk-pci", "pci-bus", &opts);
>+    qos_node_produces("vhost-user-blk-pci", "vhost-user-blk");
>+
>+    g_free(arg);
>+}
>+
>+libqos_init(vhost_user_blk_register_nodes);
>diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
>new file mode 100644
>index 0000000000..175dccab98
>--- /dev/null
>+++ b/tests/qtest/vhost-user-blk-test.c
>@@ -0,0 +1,788 @@
>+/*
>+ * QTest testcase for Vhost-user Block Device
>+ *
>+ * Based on tests/qtest//virtio-blk-test.c
>+
>+ * Copyright (c) 2014 SUSE LINUX Products GmbH
>+ * Copyright (c) 2014 Marc Marí
>+ * Copyright (c) 2020 Coiby Xu
>+ *
>+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
>+ * See the COPYING file in the top-level directory.
>+ */
>+
>+#include "qemu/osdep.h"
>+#include "libqtest-single.h"
>+#include "qemu/bswap.h"
>+#include "qemu/module.h"
>+#include "standard-headers/linux/virtio_blk.h"
>+#include "standard-headers/linux/virtio_pci.h"
>+#include "libqos/qgraph.h"
>+#include "libqos/vhost-user-blk.h"
>+#include "libqos/libqos-pc.h"
>+
>+#define TEST_IMAGE_SIZE         (64 * 1024 * 1024)
>+#define QVIRTIO_BLK_TIMEOUT_US  (30 * 1000 * 1000)
>+#define PCI_SLOT_HP             0x06
>+
>+typedef struct {
>+    pid_t pid;
>+} QemuStorageDaemonState;
>+
>+typedef struct QVirtioBlkReq {
>+    uint32_t type;
>+    uint32_t ioprio;
>+    uint64_t sector;
>+    char *data;
>+    uint8_t status;
>+} QVirtioBlkReq;
>+
>+#ifdef HOST_WORDS_BIGENDIAN
>+static const bool host_is_big_endian = true;
>+#else
>+static const bool host_is_big_endian; /* false */
>+#endif
>+
>+static inline void virtio_blk_fix_request(QVirtioDevice *d, QVirtioBlkReq *req)
>+{
>+    if (qvirtio_is_big_endian(d) != host_is_big_endian) {
>+        req->type = bswap32(req->type);
>+        req->ioprio = bswap32(req->ioprio);
>+        req->sector = bswap64(req->sector);
>+    }
>+}
>+
>+static inline void virtio_blk_fix_dwz_hdr(QVirtioDevice *d,
>+    struct virtio_blk_discard_write_zeroes *dwz_hdr)
>+{
>+    if (qvirtio_is_big_endian(d) != host_is_big_endian) {
>+        dwz_hdr->sector = bswap64(dwz_hdr->sector);
>+        dwz_hdr->num_sectors = bswap32(dwz_hdr->num_sectors);
>+        dwz_hdr->flags = bswap32(dwz_hdr->flags);
>+    }
>+}
>+
>+static uint64_t virtio_blk_request(QGuestAllocator *alloc, QVirtioDevice *d,
>+                                   QVirtioBlkReq *req, uint64_t data_size)
>+{
>+    uint64_t addr;
>+    uint8_t status = 0xFF;
>+    QTestState *qts = global_qtest;
>+
>+    switch (req->type) {
>+    case VIRTIO_BLK_T_IN:
>+    case VIRTIO_BLK_T_OUT:
>+        g_assert_cmpuint(data_size % 512, ==, 0);
>+        break;
>+    case VIRTIO_BLK_T_DISCARD:
>+    case VIRTIO_BLK_T_WRITE_ZEROES:
>+        g_assert_cmpuint(data_size %
>+                         sizeof(struct virtio_blk_discard_write_zeroes), ==, 0);
>+        break;
>+    default:
>+        g_assert_cmpuint(data_size, ==, 0);
>+    }
>+
>+    addr = guest_alloc(alloc, sizeof(*req) + data_size);
>+
>+    virtio_blk_fix_request(d, req);
>+
>+    qtest_memwrite(qts, addr, req, 16);
>+    qtest_memwrite(qts, addr + 16, req->data, data_size);
>+    qtest_memwrite(qts, addr + 16 + data_size, &status, sizeof(status));
>+
>+    return addr;
>+}
>+
>+/* Returns the request virtqueue so the caller can perform further tests */
>+static QVirtQueue *test_basic(QVirtioDevice *dev, QGuestAllocator *alloc)
>+{
>+    QVirtioBlkReq req;
>+    uint64_t req_addr;
>+    uint64_t capacity;
>+    uint64_t features;
>+    uint32_t free_head;
>+    uint8_t status;
>+    char *data;
>+    QTestState *qts = global_qtest;
>+    QVirtQueue *vq;
>+
>+    features = qvirtio_get_features(dev);
>+    features = features & ~(QVIRTIO_F_BAD_FEATURE |
>+                    (1u << VIRTIO_RING_F_INDIRECT_DESC) |
>+                    (1u << VIRTIO_RING_F_EVENT_IDX) |
>+                    (1u << VIRTIO_BLK_F_SCSI));
>+    qvirtio_set_features(dev, features);
>+
>+    capacity = qvirtio_config_readq(dev, 0);
>+    g_assert_cmpint(capacity, ==, TEST_IMAGE_SIZE / 512);
>+
>+    vq = qvirtqueue_setup(dev, alloc, 0);
>+
>+    qvirtio_set_driver_ok(dev);
>+
>+    /* Write and read with 3 descriptor layout */
>+    /* Write request */
>+    req.type = VIRTIO_BLK_T_OUT;
>+    req.ioprio = 1;
>+    req.sector = 0;
>+    req.data = g_malloc0(512);
>+    strcpy(req.data, "TEST");
>+
>+    req_addr = virtio_blk_request(alloc, dev, &req, 512);
>+
>+    g_free(req.data);
>+
>+    free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
>+    qvirtqueue_add(qts, vq, req_addr + 16, 512, false, true);
>+    qvirtqueue_add(qts, vq, req_addr + 528, 1, true, false);
>+
>+    qvirtqueue_kick(qts, dev, vq, free_head);
>+
>+    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>+                           QVIRTIO_BLK_TIMEOUT_US);
>+    status = readb(req_addr + 528);
>+    g_assert_cmpint(status, ==, 0);
>+
>+    guest_free(alloc, req_addr);
>+
>+    /* Read request */
>+    req.type = VIRTIO_BLK_T_IN;
>+    req.ioprio = 1;
>+    req.sector = 0;
>+    req.data = g_malloc0(512);
>+
>+    req_addr = virtio_blk_request(alloc, dev, &req, 512);
>+
>+    g_free(req.data);
>+
>+    free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
>+    qvirtqueue_add(qts, vq, req_addr + 16, 512, true, true);
>+    qvirtqueue_add(qts, vq, req_addr + 528, 1, true, false);
>+
>+    qvirtqueue_kick(qts, dev, vq, free_head);
>+
>+    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>+                           QVIRTIO_BLK_TIMEOUT_US);
>+    status = readb(req_addr + 528);
>+    g_assert_cmpint(status, ==, 0);
>+
>+    data = g_malloc0(512);
>+    qtest_memread(qts, req_addr + 16, data, 512);
>+    g_assert_cmpstr(data, ==, "TEST");
>+    g_free(data);
>+
>+    guest_free(alloc, req_addr);
>+
>+    if (features & (1u << VIRTIO_BLK_F_WRITE_ZEROES)) {
>+        struct virtio_blk_discard_write_zeroes dwz_hdr;
>+        void *expected;
>+
>+        /*
>+         * WRITE_ZEROES request on the same sector of previous test where
>+         * we wrote "TEST".
>+         */
>+        req.type = VIRTIO_BLK_T_WRITE_ZEROES;
>+        req.data = (char *) &dwz_hdr;
>+        dwz_hdr.sector = 0;
>+        dwz_hdr.num_sectors = 1;
>+        dwz_hdr.flags = 0;
>+
>+        virtio_blk_fix_dwz_hdr(dev, &dwz_hdr);
>+
>+        req_addr = virtio_blk_request(alloc, dev, &req, sizeof(dwz_hdr));
>+
>+        free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
>+        qvirtqueue_add(qts, vq, req_addr + 16, sizeof(dwz_hdr), false, true);
>+        qvirtqueue_add(qts, vq, req_addr + 16 + sizeof(dwz_hdr), 1, true,
>+                       false);
>+
>+        qvirtqueue_kick(qts, dev, vq, free_head);
>+
>+        qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>+                               QVIRTIO_BLK_TIMEOUT_US);
>+        status = readb(req_addr + 16 + sizeof(dwz_hdr));
>+        g_assert_cmpint(status, ==, 0);
>+
>+        guest_free(alloc, req_addr);
>+
>+        /* Read request to check if the sector contains all zeroes */
>+        req.type = VIRTIO_BLK_T_IN;
>+        req.ioprio = 1;
>+        req.sector = 0;
>+        req.data = g_malloc0(512);
>+
>+        req_addr = virtio_blk_request(alloc, dev, &req, 512);
>+
>+        g_free(req.data);
>+
>+        free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
>+        qvirtqueue_add(qts, vq, req_addr + 16, 512, true, true);
>+        qvirtqueue_add(qts, vq, req_addr + 528, 1, true, false);
>+
>+        qvirtqueue_kick(qts, dev, vq, free_head);
>+
>+        qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>+                               QVIRTIO_BLK_TIMEOUT_US);
>+        status = readb(req_addr + 528);
>+        g_assert_cmpint(status, ==, 0);
>+
>+        data = g_malloc(512);
>+        expected = g_malloc0(512);
>+        qtest_memread(qts, req_addr + 16, data, 512);
>+        g_assert_cmpmem(data, 512, expected, 512);
>+        g_free(expected);
>+        g_free(data);
>+
>+        guest_free(alloc, req_addr);
>+    }
>+
>+    if (features & (1u << VIRTIO_BLK_F_DISCARD)) {
>+        struct virtio_blk_discard_write_zeroes dwz_hdr;
>+
>+        req.type = VIRTIO_BLK_T_DISCARD;
>+        req.data = (char *) &dwz_hdr;
>+        dwz_hdr.sector = 0;
>+        dwz_hdr.num_sectors = 1;
>+        dwz_hdr.flags = 0;
>+
>+        virtio_blk_fix_dwz_hdr(dev, &dwz_hdr);
>+
>+        req_addr = virtio_blk_request(alloc, dev, &req, sizeof(dwz_hdr));
>+
>+        free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
>+        qvirtqueue_add(qts, vq, req_addr + 16, sizeof(dwz_hdr), false, true);
>+        qvirtqueue_add(qts, vq, req_addr + 16 + sizeof(dwz_hdr),
>+                       1, true, false);
>+
>+        qvirtqueue_kick(qts, dev, vq, free_head);
>+
>+        qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>+                               QVIRTIO_BLK_TIMEOUT_US);
>+        status = readb(req_addr + 16 + sizeof(dwz_hdr));
>+        g_assert_cmpint(status, ==, 0);
>+
>+        guest_free(alloc, req_addr);
>+    }
>+
>+    if (features & (1u << VIRTIO_F_ANY_LAYOUT)) {
>+        /* Write and read with 2 descriptor layout */
>+        /* Write request */
>+        req.type = VIRTIO_BLK_T_OUT;
>+        req.ioprio = 1;
>+        req.sector = 1;
>+        req.data = g_malloc0(512);
>+        strcpy(req.data, "TEST");
>+
>+        req_addr = virtio_blk_request(alloc, dev, &req, 512);
>+
>+        g_free(req.data);
>+
>+        free_head = qvirtqueue_add(qts, vq, req_addr, 528, false, true);
>+        qvirtqueue_add(qts, vq, req_addr + 528, 1, true, false);
>+        qvirtqueue_kick(qts, dev, vq, free_head);
>+
>+        qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>+                               QVIRTIO_BLK_TIMEOUT_US);
>+        status = readb(req_addr + 528);
>+        g_assert_cmpint(status, ==, 0);
>+
>+        guest_free(alloc, req_addr);
>+
>+        /* Read request */
>+        req.type = VIRTIO_BLK_T_IN;
>+        req.ioprio = 1;
>+        req.sector = 1;
>+        req.data = g_malloc0(512);
>+
>+        req_addr = virtio_blk_request(alloc, dev, &req, 512);
>+
>+        g_free(req.data);
>+
>+        free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
>+        qvirtqueue_add(qts, vq, req_addr + 16, 513, true, false);
>+
>+        qvirtqueue_kick(qts, dev, vq, free_head);
>+
>+        qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>+                               QVIRTIO_BLK_TIMEOUT_US);
>+        status = readb(req_addr + 528);
>+        g_assert_cmpint(status, ==, 0);
>+
>+        data = g_malloc0(512);
>+        qtest_memread(qts, req_addr + 16, data, 512);
>+        g_assert_cmpstr(data, ==, "TEST");
>+        g_free(data);
>+
>+        guest_free(alloc, req_addr);
>+    }
>+
>+    return vq;
>+}
>+
>+static void basic(void *obj, void *data, QGuestAllocator *t_alloc)
>+{
>+    QVhostUserBlk *blk_if = obj;
>+    QVirtQueue *vq;
>+
>+    vq = test_basic(blk_if->vdev, t_alloc);
>+    qvirtqueue_cleanup(blk_if->vdev->bus, vq, t_alloc);
>+
>+}
>+
>+static void indirect(void *obj, void *u_data, QGuestAllocator *t_alloc)
>+{
>+    QVirtQueue *vq;
>+    QVhostUserBlk *blk_if = obj;
>+    QVirtioDevice *dev = blk_if->vdev;
>+    QVirtioBlkReq req;
>+    QVRingIndirectDesc *indirect;
>+    uint64_t req_addr;
>+    uint64_t capacity;
>+    uint64_t features;
>+    uint32_t free_head;
>+    uint8_t status;
>+    char *data;
>+    QTestState *qts = global_qtest;
>+
>+    features = qvirtio_get_features(dev);
>+    g_assert_cmphex(features & (1u << VIRTIO_RING_F_INDIRECT_DESC), !=, 0);
>+    features = features & ~(QVIRTIO_F_BAD_FEATURE |
>+                            (1u << VIRTIO_RING_F_EVENT_IDX) |
>+                            (1u << VIRTIO_BLK_F_SCSI));
>+    qvirtio_set_features(dev, features);
>+
>+    capacity = qvirtio_config_readq(dev, 0);
>+    g_assert_cmpint(capacity, ==, TEST_IMAGE_SIZE / 512);
>+
>+    vq = qvirtqueue_setup(dev, t_alloc, 0);
>+    qvirtio_set_driver_ok(dev);
>+
>+    /* Write request */
>+    req.type = VIRTIO_BLK_T_OUT;
>+    req.ioprio = 1;
>+    req.sector = 0;
>+    req.data = g_malloc0(512);
>+    strcpy(req.data, "TEST");
>+
>+    req_addr = virtio_blk_request(t_alloc, dev, &req, 512);
>+
>+    g_free(req.data);
>+
>+    indirect = qvring_indirect_desc_setup(qts, dev, t_alloc, 2);
>+    qvring_indirect_desc_add(dev, qts, indirect, req_addr, 528, false);
>+    qvring_indirect_desc_add(dev, qts, indirect, req_addr + 528, 1, true);
>+    free_head = qvirtqueue_add_indirect(qts, vq, indirect);
>+    qvirtqueue_kick(qts, dev, vq, free_head);
>+
>+    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>+                           QVIRTIO_BLK_TIMEOUT_US);
>+    status = readb(req_addr + 528);
>+    g_assert_cmpint(status, ==, 0);
>+
>+    g_free(indirect);
>+    guest_free(t_alloc, req_addr);
>+
>+    /* Read request */
>+    req.type = VIRTIO_BLK_T_IN;
>+    req.ioprio = 1;
>+    req.sector = 0;
>+    req.data = g_malloc0(512);
>+    strcpy(req.data, "TEST");
>+
>+    req_addr = virtio_blk_request(t_alloc, dev, &req, 512);
>+
>+    g_free(req.data);
>+
>+    indirect = qvring_indirect_desc_setup(qts, dev, t_alloc, 2);
>+    qvring_indirect_desc_add(dev, qts, indirect, req_addr, 16, false);
>+    qvring_indirect_desc_add(dev, qts, indirect, req_addr + 16, 513, true);
>+    free_head = qvirtqueue_add_indirect(qts, vq, indirect);
>+    qvirtqueue_kick(qts, dev, vq, free_head);
>+
>+    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>+                           QVIRTIO_BLK_TIMEOUT_US);
>+    status = readb(req_addr + 528);
>+    g_assert_cmpint(status, ==, 0);
>+
>+    data = g_malloc0(512);
>+    qtest_memread(qts, req_addr + 16, data, 512);
>+    g_assert_cmpstr(data, ==, "TEST");
>+    g_free(data);
>+
>+    g_free(indirect);
>+    guest_free(t_alloc, req_addr);
>+    qvirtqueue_cleanup(dev->bus, vq, t_alloc);
>+}
>+
>+static void idx(void *obj, void *u_data, QGuestAllocator *t_alloc)
>+{
>+    QVirtQueue *vq;
>+    QVhostUserBlkPCI *blk = obj;
>+    QVirtioPCIDevice *pdev = &blk->pci_vdev;
>+    QVirtioDevice *dev = &pdev->vdev;
>+    QVirtioBlkReq req;
>+    uint64_t req_addr;
>+    uint64_t capacity;
>+    uint64_t features;
>+    uint32_t free_head;
>+    uint32_t write_head;
>+    uint32_t desc_idx;
>+    uint8_t status;
>+    char *data;
>+    QOSGraphObject *blk_object = obj;
>+    QPCIDevice *pci_dev = blk_object->get_driver(blk_object, "pci-device");
>+    QTestState *qts = global_qtest;
>+
>+    if (qpci_check_buggy_msi(pci_dev)) {
>+        return;
>+    }
>+
>+    qpci_msix_enable(pdev->pdev);
>+    qvirtio_pci_set_msix_configuration_vector(pdev, t_alloc, 0);
>+
>+    features = qvirtio_get_features(dev);
>+    features = features & ~(QVIRTIO_F_BAD_FEATURE |
>+                            (1u << VIRTIO_RING_F_INDIRECT_DESC) |
>+                            (1u << VIRTIO_F_NOTIFY_ON_EMPTY) |
>+                            (1u << VIRTIO_BLK_F_SCSI));
>+    qvirtio_set_features(dev, features);
>+
>+    capacity = qvirtio_config_readq(dev, 0);
>+    g_assert_cmpint(capacity, ==, TEST_IMAGE_SIZE / 512);
>+
>+    vq = qvirtqueue_setup(dev, t_alloc, 0);
>+    qvirtqueue_pci_msix_setup(pdev, (QVirtQueuePCI *)vq, t_alloc, 1);
>+
>+    qvirtio_set_driver_ok(dev);
>+
>+    /* Write request */
>+    req.type = VIRTIO_BLK_T_OUT;
>+    req.ioprio = 1;
>+    req.sector = 0;
>+    req.data = g_malloc0(512);
>+    strcpy(req.data, "TEST");
>+
>+    req_addr = virtio_blk_request(t_alloc, dev, &req, 512);
>+
>+    g_free(req.data);
>+
>+    free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
>+    qvirtqueue_add(qts, vq, req_addr + 16, 512, false, true);
>+    qvirtqueue_add(qts, vq, req_addr + 528, 1, true, false);
>+    qvirtqueue_kick(qts, dev, vq, free_head);
>+
>+    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>+                           QVIRTIO_BLK_TIMEOUT_US);
>+
>+    /* Write request */
>+    req.type = VIRTIO_BLK_T_OUT;
>+    req.ioprio = 1;
>+    req.sector = 1;
>+    req.data = g_malloc0(512);
>+    strcpy(req.data, "TEST");
>+
>+    req_addr = virtio_blk_request(t_alloc, dev, &req, 512);
>+
>+    g_free(req.data);
>+
>+    /* Notify after processing the third request */
>+    qvirtqueue_set_used_event(qts, vq, 2);
>+    free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
>+    qvirtqueue_add(qts, vq, req_addr + 16, 512, false, true);
>+    qvirtqueue_add(qts, vq, req_addr + 528, 1, true, false);
>+    qvirtqueue_kick(qts, dev, vq, free_head);
>+    write_head = free_head;
>+
>+    /* No notification expected */
>+    status = qvirtio_wait_status_byte_no_isr(qts, dev,
>+                                             vq, req_addr + 528,
>+                                             QVIRTIO_BLK_TIMEOUT_US);
>+    g_assert_cmpint(status, ==, 0);
>+
>+    guest_free(t_alloc, req_addr);
>+
>+    /* Read request */
>+    req.type = VIRTIO_BLK_T_IN;
>+    req.ioprio = 1;
>+    req.sector = 1;
>+    req.data = g_malloc0(512);
>+
>+    req_addr = virtio_blk_request(t_alloc, dev, &req, 512);
>+
>+    g_free(req.data);
>+
>+    free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
>+    qvirtqueue_add(qts, vq, req_addr + 16, 512, true, true);
>+    qvirtqueue_add(qts, vq, req_addr + 528, 1, true, false);
>+
>+    qvirtqueue_kick(qts, dev, vq, free_head);
>+
>+    /* We get just one notification for both requests */
>+    qvirtio_wait_used_elem(qts, dev, vq, write_head, NULL,
>+                           QVIRTIO_BLK_TIMEOUT_US);
>+    g_assert(qvirtqueue_get_buf(qts, vq, &desc_idx, NULL));
>+    g_assert_cmpint(desc_idx, ==, free_head);
>+
>+    status = readb(req_addr + 528);
>+    g_assert_cmpint(status, ==, 0);
>+
>+    data = g_malloc0(512);
>+    qtest_memread(qts, req_addr + 16, data, 512);
>+    g_assert_cmpstr(data, ==, "TEST");
>+    g_free(data);
>+
>+    guest_free(t_alloc, req_addr);
>+
>+    /* End test */
>+    qpci_msix_disable(pdev->pdev);
>+
>+    qvirtqueue_cleanup(dev->bus, vq, t_alloc);
>+}
>+
>+static void pci_hotplug(void *obj, void *data, QGuestAllocator *t_alloc)
>+{
>+    QVirtioPCIDevice *dev1 = obj;
>+    QVirtioPCIDevice *dev;
>+    QTestState *qts = dev1->pdev->bus->qts;
>+
>+    /* plug secondary disk */
>+    qtest_qmp_device_add(qts, "vhost-user-blk-pci", "drv1",
>+                         "{'addr': %s, 'chardev': 'char2'}",
>+                         stringify(PCI_SLOT_HP) ".0");
>+
>+    dev = virtio_pci_new(dev1->pdev->bus,
>+                         &(QPCIAddress) { .devfn = QPCI_DEVFN(PCI_SLOT_HP, 0)
>+                                        });
>+    g_assert_nonnull(dev);
>+    g_assert_cmpint(dev->vdev.device_type, ==, VIRTIO_ID_BLOCK);
>+    qvirtio_pci_device_disable(dev);
>+    qos_object_destroy((QOSGraphObject *)dev);
>+
>+    /* unplug secondary disk */
>+    qpci_unplug_acpi_device_test(qts, "drv1", PCI_SLOT_HP);
>+}
>+
>+/*
>+ * Check that setting the vring addr on a non-existent virtqueue does
>+ * not crash.
>+ */
>+static void test_nonexistent_virtqueue(void *obj, void *data,
>+                                       QGuestAllocator *t_alloc)
>+{
>+    QVhostUserBlkPCI *blk = obj;
>+    QVirtioPCIDevice *pdev = &blk->pci_vdev;
>+    QPCIBar bar0;
>+    QPCIDevice *dev;
>+
>+    dev = qpci_device_find(pdev->pdev->bus, QPCI_DEVFN(4, 0));
>+    g_assert(dev != NULL);
>+    qpci_device_enable(dev);
>+
>+    bar0 = qpci_iomap(dev, 0, NULL);
>+
>+    qpci_io_writeb(dev, bar0, VIRTIO_PCI_QUEUE_SEL, 2);
>+    qpci_io_writel(dev, bar0, VIRTIO_PCI_QUEUE_PFN, 1);
>+
>+    g_free(dev);
>+}
>+
>+static const char *qtest_qemu_storage_daemon_binary(void)
>+{
>+    const char *qemu_storage_daemon_bin;
>+
>+    qemu_storage_daemon_bin = getenv("QTEST_QEMU_STORAGE_DAEMON_BINARY");
>+    if (!qemu_storage_daemon_bin) {
>+        fprintf(stderr, "Environment variable "
>+                        "QTEST_QEMU_STORAGE_DAEMON_BINARY required\n");
>+        exit(0);
>+    }
>+
>+    return qemu_storage_daemon_bin;
>+}
>+
>+/* g_test_queue_destroy() cleanup function for files */
>+static void destroy_file(void *path)
>+{
>+    unlink(path);
>+    g_free(path);
>+    qos_invalidate_command_line();
>+}
>+
>+static char *drive_create(void)
>+{
>+    int fd, ret;
>+    /** vhost-user-blk won't recognize drive located in /tmp */
>+    char *t_path = g_strdup("qtest.XXXXXX");
>+
>+    /** Create a temporary raw image */
>+    fd = mkstemp(t_path);
>+    g_assert_cmpint(fd, >=, 0);
>+    ret = ftruncate(fd, TEST_IMAGE_SIZE);
>+    g_assert_cmpint(ret, ==, 0);
>+    close(fd);
>+
>+    g_test_queue_destroy(destroy_file, t_path);
>+    return t_path;
>+}
>+
>+static char *create_listen_socket(int *fd)
>+{
>+    int tmp_fd;
>+    char *path;
>+
>+    /* No race because our pid makes the path unique */
>+    path = g_strdup_printf("/tmp/qtest-%d-sock.XXXXXX", getpid());
>+    tmp_fd = mkstemp(path);
>+    g_assert_cmpint(tmp_fd, >=, 0);
>+    close(tmp_fd);
>+    unlink(path);
>+
>+    *fd = qtest_socket_server(path);
>+    g_test_queue_destroy(destroy_file, path);
>+    return path;
>+}
>+
>+/*
>+ * g_test_queue_destroy() and qtest_add_abrt_handler() cleanup function for
>+ * qemu-storage-daemon.
>+ */
>+static void quit_storage_daemon(void *data)
>+{
>+    QemuStorageDaemonState *qsd = data;
>+    int wstatus;
>+    pid_t pid;
>+
>+    /*
>+     * If we were invoked as a g_test_queue_destroy() cleanup function we need
>+     * to remove the abrt handler to avoid being called again if the code below
>+     * aborts. Also, we must not leave the abrt handler installed after
>+     * cleanup.
>+     */
>+    qtest_remove_abrt_handler(data);
>+

There is an issue. If a test fails, quit_storage_daemon won't be
called. Since there no abrt_handler like kill_qemu_hook_func
installed to stop qemu-storage-daemon, qemu-storage-daemon would keep
running after QEMU is killed by kill_qemu_hook_func.

>+    /* Before quitting storage-daemon, quit qemu to avoid dubious messages */
>+    qtest_kill_qemu(global_qtest);
>+
>+    kill(qsd->pid, SIGTERM);
>+    pid = waitpid(qsd->pid, &wstatus, 0);
>+    g_assert_cmpint(pid, ==, qsd->pid);
>+    if (!WIFEXITED(wstatus)) {
>+        fprintf(stderr, "%s: expected qemu-storage-daemon to exit\n",
>+                __func__);
>+        abort();
>+    }
>+    if (WEXITSTATUS(wstatus) != 0) {
>+        fprintf(stderr, "%s: expected qemu-storage-daemon to exit "
>+                "successfully, got %d\n",
>+                __func__, WEXITSTATUS(wstatus));
>+        abort();
>+    }
>+
>+    g_free(data);
>+}
>+
>+static void start_vhost_user_blk(GString *cmd_line, int vus_instances)
>+{
>+    const char *vhost_user_blk_bin = qtest_qemu_storage_daemon_binary();
>+    int i;
>+    gchar *img_path;
>+    GString *storage_daemon_command = g_string_new(NULL);
>+    QemuStorageDaemonState *qsd;
>+
>+    g_string_append_printf(storage_daemon_command,
>+                           "exec %s ",
>+                           vhost_user_blk_bin);
>+
>+    g_string_append_printf(cmd_line,
>+            " -object memory-backend-memfd,id=mem,size=256M,share=on "
>+            " -M memory-backend=mem ");
>+
>+    for (i = 0; i < vus_instances; i++) {
>+        int fd;
>+        char *sock_path = create_listen_socket(&fd);
>+
>+        /* create image file */
>+        img_path = drive_create();
>+        g_string_append_printf(storage_daemon_command,
>+            "--blockdev driver=file,node-name=disk%d,filename=%s "
>+            "--export type=vhost-user-blk,id=disk%d,addr.type=unix,addr.path=%s,"
>+            "node-name=disk%i,writable=on ",
>+            i, img_path, i, sock_path, i);
>+
>+        g_string_append_printf(cmd_line, "-chardev socket,id=char%d,path=%s ",
>+                               i + 1, sock_path);
>+    }
>+
>+    g_test_message("starting vhost-user backend: %s",
>+                   storage_daemon_command->str);
>+    pid_t pid = fork();
>+    if (pid == 0) {
>+        /*
>+         * Close standard file descriptors so tap-driver.pl pipe detects when
>+         * our parent terminates.
>+         */
>+        close(0);
>+        close(1);
>+        open("/dev/null", O_RDONLY);
>+        open("/dev/null", O_WRONLY);
>+
>+        execlp("/bin/sh", "sh", "-c", storage_daemon_command->str, NULL);
>+        exit(1);
>+    }
>+    g_string_free(storage_daemon_command, true);
>+
>+    qsd = g_new(QemuStorageDaemonState, 1);
>+    qsd->pid = pid;
>+
>+    /* Make sure qemu-storage-daemon is stopped */
>+    qtest_add_abrt_handler(quit_storage_daemon, qsd);
>+    g_test_queue_destroy(quit_storage_daemon, qsd);
>+}
>+
>+static void *vhost_user_blk_test_setup(GString *cmd_line, void *arg)
>+{
>+    start_vhost_user_blk(cmd_line, 1);
>+    return arg;
>+}
>+
>+/*
>+ * Setup for hotplug.
>+ *
>+ * Since vhost-user server only serves one vhost-user client one time,
>+ * another exprot
>+ *
>+ */
>+static void *vhost_user_blk_hotplug_test_setup(GString *cmd_line, void *arg)
>+{
>+    /* "-chardev socket,id=char2" is used for pci_hotplug*/
>+    start_vhost_user_blk(cmd_line, 2);
>+    return arg;
>+}
>+
>+static void register_vhost_user_blk_test(void)
>+{
>+    QOSGraphTestOptions opts = {
>+        .before = vhost_user_blk_test_setup,
>+    };
>+
>+    /*
>+     * tests for vhost-user-blk and vhost-user-blk-pci
>+     * The tests are borrowed from tests/virtio-blk-test.c. But some tests
>+     * regarding block_resize don't work for vhost-user-blk.
>+     * vhost-user-blk device doesn't have -drive, so tests containing
>+     * block_resize are also abandoned,
>+     *  - config
>+     *  - resize
>+     */
>+    qos_add_test("basic", "vhost-user-blk", basic, &opts);
>+    qos_add_test("indirect", "vhost-user-blk", indirect, &opts);
>+    qos_add_test("idx", "vhost-user-blk-pci", idx, &opts);
>+    qos_add_test("nxvirtq", "vhost-user-blk-pci",
>+                 test_nonexistent_virtqueue, &opts);
>+
>+    opts.before = vhost_user_blk_hotplug_test_setup;
>+    qos_add_test("hotplug", "vhost-user-blk-pci", pci_hotplug, &opts);
>+}
>+
>+libqos_init(register_vhost_user_blk_test);
>diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
>index 1cddf5bdaa..1f5c8f1053 100644
>--- a/tests/qtest/libqos/meson.build
>+++ b/tests/qtest/libqos/meson.build
>@@ -32,6 +32,7 @@ libqos_srcs = files('../libqtest.c',
>         'virtio-9p.c',
>         'virtio-balloon.c',
>         'virtio-blk.c',
>+        'vhost-user-blk.c',
>         'virtio-mmio.c',
>         'virtio-net.c',
>         'virtio-pci.c',
>diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>index c19f1c8503..39af1cddc4 100644
>--- a/tests/qtest/meson.build
>+++ b/tests/qtest/meson.build
>@@ -199,6 +199,9 @@ qos_test_ss.add(
> )
> qos_test_ss.add(when: 'CONFIG_VIRTFS', if_true: files('virtio-9p-test.c'))
> qos_test_ss.add(when: 'CONFIG_VHOST_USER', if_true: files('vhost-user-test.c'))
>+if have_vhost_user_blk_server
>+  qos_test_ss.add(files('vhost-user-blk-test.c'))
>+endif
>
> tpmemu_files = ['tpm-emu.c', 'tpm-util.c', 'tpm-tests.c']
>
>@@ -237,6 +240,7 @@ foreach dir : target_dirs
>   endif
>   qtest_env.set('G_TEST_DBUS_DAEMON', meson.source_root() / 'tests/dbus-vmstate-daemon.sh')
>   qtest_env.set('QTEST_QEMU_BINARY', './qemu-system-' + target_base)
>+  qtest_env.set('QTEST_QEMU_STORAGE_DAEMON_BINARY', './storage-daemon/qemu-storage-daemon')
>
>   foreach test : target_qtests
>     # Executables are shared across targets, declare them only the first time we
>--
>2.28.0
>

--
Best regards,
Coiby

