Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B122C3B16
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 09:30:48 +0100 (CET)
Received: from localhost ([::1]:36604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khqCN-0004UB-AG
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 03:30:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <coiby.xu@gmail.com>)
 id 1khqAg-0003yZ-Bn; Wed, 25 Nov 2020 03:29:05 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:34213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <coiby.xu@gmail.com>)
 id 1khqAc-0007zY-FP; Wed, 25 Nov 2020 03:29:02 -0500
Received: by mail-pf1-x443.google.com with SMTP id w6so1647446pfu.1;
 Wed, 25 Nov 2020 00:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=gTivTyOX69JIhJdBUsfe9aDY7eSUgHnFT8F+wI1GUrg=;
 b=KNZ67lz0pC7ePR2oN3GIJiA36L13oq7vqg722kDWy4K1XkkeMWWNMvAlN81YLzxkHy
 yReGEylRdpsvvxuk4B2xLeYdLVlAT5ieT6W+GL8IM1ntba73vYJn/RAX0yRqYMBzReFs
 E83ipiTyYBs1mbfZk6WCi+cU2b2HltnzuG3geA6RcVsBjfYHxOoKbv4xYAhNKI1B7ods
 W/K+uCaOHtfTbmqmXWYDd+d6ilTR4xqkJbgg3CC3PfuHKT3I4uaivgu6ZQFRm7vnO/VQ
 dXNZ618EJILCfuxjna/TzIBYXD10tyE4cOBZa81bURUNiGz/qP1pPcm5lSo/sY/KY1uG
 KQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=gTivTyOX69JIhJdBUsfe9aDY7eSUgHnFT8F+wI1GUrg=;
 b=pkZyliNikbgwuWxBkz61AytWD9IORGU19ASuZKI501IGnpeW/CdFlP0Q/WsPnQz2t/
 zzKKXe6TGiWXQ2FDi/W3kgxCud6FxMBBDX+ypkq06qj/MQ7yHJID8cZfGm0HFyL27ZcR
 zAw+1MqlXeKsoUcwX2ecHprcrgPN0VYiHnOnU32KrciGd+hpYkUVQxyKR5Plrz369vf5
 fhtqv8pF2tBBQthDPFUWfqzUY4W0XTd9JI/h4A5jiRP2GCCRGp0Icy3ReQDfkbqj52td
 0gBtRYG7iKuw1DBwpKgGMDz3WR48FjziOqHskzEn7gvCjQduTWxTu9gzf+GzG7UTKJ8z
 ElxQ==
X-Gm-Message-State: AOAM533Op/NdeHi4TSKD/AL6ACHJgOhqA0mP8H71QyWyyWPqA5QCxSn1
 ut340q/VxPxMjMGdCpCI9HI=
X-Google-Smtp-Source: ABdhPJz6vNCRSuGiyxwYlUbnRp5++pHSP+OQHethprgZm0/QbQ2y3DREzHIaUjqk/iRNDWEmazE/Kg==
X-Received: by 2002:a17:90a:2b0b:: with SMTP id
 x11mr2852834pjc.65.1606292936041; 
 Wed, 25 Nov 2020 00:28:56 -0800 (PST)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id k26sm1288724pfg.8.2020.11.25.00.28.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 00:28:55 -0800 (PST)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Wed, 25 Nov 2020 16:28:20 +0800
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH for-5.2 01/10] test: new qTest case to test the
 vhost-user-blk-server
Message-ID: <20201125082820.6g5umkr4dafrzsai@Rk>
References: <20201111124331.1393747-1-stefanha@redhat.com>
 <20201111124331.1393747-2-stefanha@redhat.com>
 <20201125082056.wcxx274zo34qmobb@Rk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201125082056.wcxx274zo34qmobb@Rk>
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=coiby.xu@gmail.com; helo=mail-pf1-x443.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLY=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 25, 2020 at 04:20:56PM +0800, Coiby Xu wrote:
>On Wed, Nov 11, 2020 at 12:43:22PM +0000, Stefan Hajnoczi wrote:
>>From: Coiby Xu <coiby.xu@gmail.com>
>>
>>This test case has the same tests as tests/virtio-blk-test.c except for
>>tests have block_resize. Since vhost-user server can only server one
>>client one time, two instances of vhost-user-blk-server are started by
>>qemu-storage-daemon for the hotplug test.
>>
>>In order to not block scripts/tap-driver.pl, vhost-user-blk-server will
>>send "quit" command to qemu-storage-daemon's QMP monitor. So a function
>>is added to libqtest.c to establish socket connection with socket
>>server.
>>
>>Suggested-by: Thomas Huth <thuth@redhat.com>
>>Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>>Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>Message-id: 20200918080912.321299-7-coiby.xu@gmail.com
>>[Update meson.build to only test when CONFIG_TOOLS has built
>>qemu-storage-daemon. This prevents CI failures with --disable-tools.
>>Also bump RAM to 256 MB because that is the minimum RAM granularity on
>>ppc64 spapr machines.
>>--Stefan]
>>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>>---
>>tests/qtest/libqos/libqtest.h       |  17 +
>>tests/qtest/libqos/vhost-user-blk.h |  48 ++
>>tests/qtest/libqos/vhost-user-blk.c | 129 +++++
>>tests/qtest/libqtest.c              |  36 +-
>>tests/qtest/vhost-user-blk-test.c   | 751 ++++++++++++++++++++++++++++
>>tests/qtest/libqos/meson.build      |   1 +
>>tests/qtest/meson.build             |   2 +
>>7 files changed, 982 insertions(+), 2 deletions(-)
>>create mode 100644 tests/qtest/libqos/vhost-user-blk.h
>>create mode 100644 tests/qtest/libqos/vhost-user-blk.c
>>create mode 100644 tests/qtest/vhost-user-blk-test.c
>>
>>diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
>>index 724f65aa94..d6236ea7a0 100644
>>--- a/tests/qtest/libqos/libqtest.h
>>+++ b/tests/qtest/libqos/libqtest.h
>>@@ -132,6 +132,23 @@ void qtest_qmp_send(QTestState *s, const char *fmt, ...)
>>void qtest_qmp_send_raw(QTestState *s, const char *fmt, ...)
>>    GCC_FMT_ATTR(2, 3);
>>
>>+/**
>>+ * qtest_socket_client:
>>+ * @server_socket_path: the socket server's path
>>+ *
>>+ * Connect to a socket server.
>>+ */
>>+int qtest_socket_client(char *server_socket_path);
>>+
>>+/**
>>+ * qtest_create_state_with_qmp_fd:
>>+ * @fd: socket fd
>>+ *
>>+ * Wrap socket fd in QTestState to make use of qtest_qmp*
>>+ * functions
>>+ */
>>+QTestState *qtest_create_state_with_qmp_fd(int fd);
>>+
>>/**
>> * qtest_vqmp_fds:
>> * @s: #QTestState instance to operate on.
>>diff --git a/tests/qtest/libqos/vhost-user-blk.h b/tests/qtest/libqos/vhost-user-blk.h
>>new file mode 100644
>>index 0000000000..2a03456a45
>>--- /dev/null
>>+++ b/tests/qtest/libqos/vhost-user-blk.h
>>@@ -0,0 +1,48 @@
>>+/*
>>+ * libqos driver framework
>>+ *
>>+ * Based on tests/qtest/libqos/virtio-blk.c
>>+ *
>>+ * Copyright (c) 2020 Coiby Xu <coiby.xu@gmail.com>
>>+ *
>>+ * Copyright (c) 2018 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>
>>+ *
>>+ * This library is free software; you can redistribute it and/or
>>+ * modify it under the terms of the GNU Lesser General Public
>>+ * License version 2 as published by the Free Software Foundation.
>>+ *
>>+ * This library is distributed in the hope that it will be useful,
>>+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>>+ * Lesser General Public License for more details.
>>+ *
>>+ * You should have received a copy of the GNU Lesser General Public
>>+ * License along with this library; if not, see <http://www.gnu.org/licenses/>
>>+ */
>>+
>>+#ifndef TESTS_LIBQOS_VHOST_USER_BLK_H
>>+#define TESTS_LIBQOS_VHOST_USER_BLK_H
>>+
>>+#include "qgraph.h"
>>+#include "virtio.h"
>>+#include "virtio-pci.h"
>>+
>>+typedef struct QVhostUserBlk QVhostUserBlk;
>>+typedef struct QVhostUserBlkPCI QVhostUserBlkPCI;
>>+typedef struct QVhostUserBlkDevice QVhostUserBlkDevice;
>>+
>>+struct QVhostUserBlk {
>>+    QVirtioDevice *vdev;
>>+};
>>+
>>+struct QVhostUserBlkPCI {
>>+    QVirtioPCIDevice pci_vdev;
>>+    QVhostUserBlk blk;
>>+};
>>+
>>+struct QVhostUserBlkDevice {
>>+    QOSGraphObject obj;
>>+    QVhostUserBlk blk;
>>+};
>>+
>>+#endif
>>diff --git a/tests/qtest/libqos/vhost-user-blk.c b/tests/qtest/libqos/vhost-user-blk.c
>>new file mode 100644
>>index 0000000000..58c7e1eb69
>>--- /dev/null
>>+++ b/tests/qtest/libqos/vhost-user-blk.c
>>@@ -0,0 +1,129 @@
>>+/*
>>+ * libqos driver framework
>>+ *
>>+ * Based on tests/qtest/libqos/virtio-blk.c
>>+ *
>>+ * Copyright (c) 2020 Coiby Xu <coiby.xu@gmail.com>
>>+ *
>>+ * Copyright (c) 2018 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>
>>+ *
>>+ * This library is free software; you can redistribute it and/or
>>+ * modify it under the terms of the GNU Lesser General Public
>>+ * License version 2.1 as published by the Free Software Foundation.
>>+ *
>>+ * This library is distributed in the hope that it will be useful,
>>+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>>+ * Lesser General Public License for more details.
>>+ *
>>+ * You should have received a copy of the GNU Lesser General Public
>>+ * License along with this library; if not, see <http://www.gnu.org/licenses/>
>>+ */
>>+
>>+#include "qemu/osdep.h"
>>+#include "libqtest.h"
>>+#include "qemu/module.h"
>>+#include "standard-headers/linux/virtio_blk.h"
>>+#include "vhost-user-blk.h"
>>+
>>+#define PCI_SLOT                0x04
>>+#define PCI_FN                  0x00
>>+
>>+/* virtio-blk-device */
>>+static void *qvhost_user_blk_get_driver(QVhostUserBlk *v_blk,
>>+                                    const char *interface)
>>+{
>>+    if (!g_strcmp0(interface, "vhost-user-blk")) {
>>+        return v_blk;
>>+    }
>>+    if (!g_strcmp0(interface, "virtio")) {
>>+        return v_blk->vdev;
>>+    }
>>+
>>+    fprintf(stderr, "%s not present in vhost-user-blk-device\n", interface);
>>+    g_assert_not_reached();
>>+}
>>+
>>+static void *qvhost_user_blk_device_get_driver(void *object,
>>+                                           const char *interface)
>>+{
>>+    QVhostUserBlkDevice *v_blk = object;
>>+    return qvhost_user_blk_get_driver(&v_blk->blk, interface);
>>+}
>>+
>>+static void *vhost_user_blk_device_create(void *virtio_dev,
>>+                                      QGuestAllocator *t_alloc,
>>+                                      void *addr)
>>+{
>>+    QVhostUserBlkDevice *vhost_user_blk = g_new0(QVhostUserBlkDevice, 1);
>>+    QVhostUserBlk *interface = &vhost_user_blk->blk;
>>+
>>+    interface->vdev = virtio_dev;
>>+
>>+    vhost_user_blk->obj.get_driver = qvhost_user_blk_device_get_driver;
>>+
>>+    return &vhost_user_blk->obj;
>>+}
>>+
>>+/* virtio-blk-pci */
>>+static void *qvhost_user_blk_pci_get_driver(void *object, const char *interface)
>>+{
>>+    QVhostUserBlkPCI *v_blk = object;
>>+    if (!g_strcmp0(interface, "pci-device")) {
>>+        return v_blk->pci_vdev.pdev;
>>+    }
>>+    return qvhost_user_blk_get_driver(&v_blk->blk, interface);
>>+}
>>+
>>+static void *vhost_user_blk_pci_create(void *pci_bus, QGuestAllocator *t_alloc,
>>+                                      void *addr)
>>+{
>>+    QVhostUserBlkPCI *vhost_user_blk = g_new0(QVhostUserBlkPCI, 1);
>>+    QVhostUserBlk *interface = &vhost_user_blk->blk;
>>+    QOSGraphObject *obj = &vhost_user_blk->pci_vdev.obj;
>>+
>>+    virtio_pci_init(&vhost_user_blk->pci_vdev, pci_bus, addr);
>>+    interface->vdev = &vhost_user_blk->pci_vdev.vdev;
>>+
>>+    g_assert_cmphex(interface->vdev->device_type, ==, VIRTIO_ID_BLOCK);
>>+
>>+    obj->get_driver = qvhost_user_blk_pci_get_driver;
>>+
>>+    return obj;
>>+}
>>+
>>+static void vhost_user_blk_register_nodes(void)
>>+{
>>+    /*
>>+     * FIXME: every test using these two nodes needs to setup a
>>+     * -drive,id=drive0 otherwise QEMU is not going to start.
>>+     * Therefore, we do not include "produces" edge for virtio
>>+     * and pci-device yet.
>>+     */
>>+
>>+    char *arg = g_strdup_printf("id=drv0,chardev=char1,addr=%x.%x",
>>+                                PCI_SLOT, PCI_FN);
>>+
>>+    QPCIAddress addr = {
>>+        .devfn = QPCI_DEVFN(PCI_SLOT, PCI_FN),
>>+    };
>>+
>>+    QOSGraphEdgeOptions opts = { };
>>+
>>+    /* virtio-blk-device */
>>+    /** opts.extra_device_opts = "drive=drive0"; */
>>+    qos_node_create_driver("vhost-user-blk-device", vhost_user_blk_device_create);
>>+    qos_node_consumes("vhost-user-blk-device", "virtio-bus", &opts);
>>+    qos_node_produces("vhost-user-blk-device", "vhost-user-blk");
>>+
>>+    /* virtio-blk-pci */
>>+    opts.extra_device_opts = arg;
>>+    add_qpci_address(&opts, &addr);
>>+    qos_node_create_driver("vhost-user-blk-pci", vhost_user_blk_pci_create);
>>+    qos_node_consumes("vhost-user-blk-pci", "pci-bus", &opts);
>>+    qos_node_produces("vhost-user-blk-pci", "vhost-user-blk");
>>+
>>+    g_free(arg);
>>+}
>>+
>>+libqos_init(vhost_user_blk_register_nodes);
>>diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
>>index be0fb430dd..ff563cbaba 100644
>>--- a/tests/qtest/libqtest.c
>>+++ b/tests/qtest/libqtest.c
>>@@ -4,11 +4,13 @@
>> * Copyright IBM, Corp. 2012
>> * Copyright Red Hat, Inc. 2012
>> * Copyright SUSE LINUX Products GmbH 2013
>>+ * Copyright Copyright (c) Coiby Xu
>> *
>> * Authors:
>> *  Anthony Liguori   <aliguori@us.ibm.com>
>> *  Paolo Bonzini     <pbonzini@redhat.com>
>> *  Andreas Färber    <afaerber@suse.de>
>>+ *  Coiby Xu          <coiby.xu@gmail.com>
>> *
>> * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> * See the COPYING file in the top-level directory.
>>@@ -52,8 +54,7 @@ typedef struct QTestClientTransportOps {
>>    QTestRecvFn     recv_line; /* for receiving qtest command responses */
>>} QTestTransportOps;
>>
>>-struct QTestState
>>-{
>>+struct QTestState {
>>    int fd;
>>    int qmp_fd;
>>    pid_t qemu_pid;  /* our child QEMU process */
>>@@ -635,6 +636,37 @@ QDict *qtest_qmp_receive_dict(QTestState *s)
>>    return qmp_fd_receive(s->qmp_fd);
>>}
>>
>>+QTestState *qtest_create_state_with_qmp_fd(int fd)
>>+{
>>+    QTestState *qmp_test_state = g_new0(QTestState, 1);
>>+    qmp_test_state->qmp_fd = fd;
>>+    return qmp_test_state;
>>+}
>>+
>>+int qtest_socket_client(char *server_socket_path)
>>+{
>>+    struct sockaddr_un serv_addr;
>>+    int sock;
>>+    int ret;
>>+    int retries = 0;
>>+    sock = socket(PF_UNIX, SOCK_STREAM, 0);
>>+    g_assert_cmpint(sock, !=, -1);
>>+    serv_addr.sun_family = AF_UNIX;
>>+    snprintf(serv_addr.sun_path, sizeof(serv_addr.sun_path), "%s",
>>+             server_socket_path);
>>+
>>+    for (retries = 0; retries < 3; retries++) {
>>+        ret = connect(sock, (struct sockaddr *)&serv_addr, sizeof(serv_addr));
>>+        if (ret == 0) {
>>+            break;
>>+        }
>>+        g_usleep(G_USEC_PER_SEC);
>>+    }
>>+
>>+    g_assert_cmpint(ret, ==, 0);
>>+    return sock;
>>+}
>>+
>>/**
>> * Allow users to send a message without waiting for the reply,
>> * in the case that they choose to discard all replies up until
>>diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
>>new file mode 100644
>>index 0000000000..e7e44f9bf0
>>--- /dev/null
>>+++ b/tests/qtest/vhost-user-blk-test.c
>>@@ -0,0 +1,751 @@
>>+/*
>>+ * QTest testcase for Vhost-user Block Device
>>+ *
>>+ * Based on tests/qtest//virtio-blk-test.c
>>+
>>+ * Copyright (c) 2014 SUSE LINUX Products GmbH
>>+ * Copyright (c) 2014 Marc Marí
>>+ * Copyright (c) 2020 Coiby Xu
>>+ *
>>+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
>>+ * See the COPYING file in the top-level directory.
>>+ */
>>+
>>+#include "qemu/osdep.h"
>>+#include "libqtest-single.h"
>>+#include "qemu/bswap.h"
>>+#include "qemu/module.h"
>>+#include "standard-headers/linux/virtio_blk.h"
>>+#include "standard-headers/linux/virtio_pci.h"
>>+#include "libqos/qgraph.h"
>>+#include "libqos/vhost-user-blk.h"
>>+#include "libqos/libqos-pc.h"
>>+
>>+#define TEST_IMAGE_SIZE         (64 * 1024 * 1024)
>>+#define QVIRTIO_BLK_TIMEOUT_US  (30 * 1000 * 1000)
>>+#define PCI_SLOT_HP             0x06
>>+
>>+typedef struct QVirtioBlkReq {
>>+    uint32_t type;
>>+    uint32_t ioprio;
>>+    uint64_t sector;
>>+    char *data;
>>+    uint8_t status;
>>+} QVirtioBlkReq;
>>+
>>+#ifdef HOST_WORDS_BIGENDIAN
>>+static const bool host_is_big_endian = true;
>>+#else
>>+static const bool host_is_big_endian; /* false */
>>+#endif
>>+
>>+static inline void virtio_blk_fix_request(QVirtioDevice *d, QVirtioBlkReq *req)
>>+{
>>+    if (qvirtio_is_big_endian(d) != host_is_big_endian) {
>>+        req->type = bswap32(req->type);
>>+        req->ioprio = bswap32(req->ioprio);
>>+        req->sector = bswap64(req->sector);
>>+    }
>>+}
>>+
>>+static inline void virtio_blk_fix_dwz_hdr(QVirtioDevice *d,
>>+    struct virtio_blk_discard_write_zeroes *dwz_hdr)
>>+{
>>+    if (qvirtio_is_big_endian(d) != host_is_big_endian) {
>>+        dwz_hdr->sector = bswap64(dwz_hdr->sector);
>>+        dwz_hdr->num_sectors = bswap32(dwz_hdr->num_sectors);
>>+        dwz_hdr->flags = bswap32(dwz_hdr->flags);
>>+    }
>>+}
>>+
>>+static uint64_t virtio_blk_request(QGuestAllocator *alloc, QVirtioDevice *d,
>>+                                   QVirtioBlkReq *req, uint64_t data_size)
>>+{
>>+    uint64_t addr;
>>+    uint8_t status = 0xFF;
>>+    QTestState *qts = global_qtest;
>>+
>>+    switch (req->type) {
>>+    case VIRTIO_BLK_T_IN:
>>+    case VIRTIO_BLK_T_OUT:
>>+        g_assert_cmpuint(data_size % 512, ==, 0);
>>+        break;
>>+    case VIRTIO_BLK_T_DISCARD:
>>+    case VIRTIO_BLK_T_WRITE_ZEROES:
>>+        g_assert_cmpuint(data_size %
>>+                         sizeof(struct virtio_blk_discard_write_zeroes), ==, 0);
>>+        break;
>>+    default:
>>+        g_assert_cmpuint(data_size, ==, 0);
>>+    }
>>+
>>+    addr = guest_alloc(alloc, sizeof(*req) + data_size);
>>+
>>+    virtio_blk_fix_request(d, req);
>>+
>>+    qtest_memwrite(qts, addr, req, 16);
>>+    qtest_memwrite(qts, addr + 16, req->data, data_size);
>>+    qtest_memwrite(qts, addr + 16 + data_size, &status, sizeof(status));
>>+
>>+    return addr;
>>+}
>>+
>>+/* Returns the request virtqueue so the caller can perform further tests */
>>+static QVirtQueue *test_basic(QVirtioDevice *dev, QGuestAllocator *alloc)
>>+{
>>+    QVirtioBlkReq req;
>>+    uint64_t req_addr;
>>+    uint64_t capacity;
>>+    uint64_t features;
>>+    uint32_t free_head;
>>+    uint8_t status;
>>+    char *data;
>>+    QTestState *qts = global_qtest;
>>+    QVirtQueue *vq;
>>+
>>+    features = qvirtio_get_features(dev);
>>+    features = features & ~(QVIRTIO_F_BAD_FEATURE |
>>+                    (1u << VIRTIO_RING_F_INDIRECT_DESC) |
>>+                    (1u << VIRTIO_RING_F_EVENT_IDX) |
>>+                    (1u << VIRTIO_BLK_F_SCSI));
>>+    qvirtio_set_features(dev, features);
>>+
>>+    capacity = qvirtio_config_readq(dev, 0);
>>+    g_assert_cmpint(capacity, ==, TEST_IMAGE_SIZE / 512);
>>+
>>+    vq = qvirtqueue_setup(dev, alloc, 0);
>>+
>>+    qvirtio_set_driver_ok(dev);
>>+
>>+    /* Write and read with 3 descriptor layout */
>>+    /* Write request */
>>+    req.type = VIRTIO_BLK_T_OUT;
>>+    req.ioprio = 1;
>>+    req.sector = 0;
>>+    req.data = g_malloc0(512);
>>+    strcpy(req.data, "TEST");
>>+
>>+    req_addr = virtio_blk_request(alloc, dev, &req, 512);
>>+
>>+    g_free(req.data);
>>+
>>+    free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
>>+    qvirtqueue_add(qts, vq, req_addr + 16, 512, false, true);
>>+    qvirtqueue_add(qts, vq, req_addr + 528, 1, true, false);
>>+
>>+    qvirtqueue_kick(qts, dev, vq, free_head);
>>+
>>+    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>>+                           QVIRTIO_BLK_TIMEOUT_US);
>>+    status = readb(req_addr + 528);
>>+    g_assert_cmpint(status, ==, 0);
>>+
>>+    guest_free(alloc, req_addr);
>>+
>>+    /* Read request */
>>+    req.type = VIRTIO_BLK_T_IN;
>>+    req.ioprio = 1;
>>+    req.sector = 0;
>>+    req.data = g_malloc0(512);
>>+
>>+    req_addr = virtio_blk_request(alloc, dev, &req, 512);
>>+
>>+    g_free(req.data);
>>+
>>+    free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
>>+    qvirtqueue_add(qts, vq, req_addr + 16, 512, true, true);
>>+    qvirtqueue_add(qts, vq, req_addr + 528, 1, true, false);
>>+
>>+    qvirtqueue_kick(qts, dev, vq, free_head);
>>+
>>+    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>>+                           QVIRTIO_BLK_TIMEOUT_US);
>>+    status = readb(req_addr + 528);
>>+    g_assert_cmpint(status, ==, 0);
>>+
>>+    data = g_malloc0(512);
>>+    qtest_memread(qts, req_addr + 16, data, 512);
>>+    g_assert_cmpstr(data, ==, "TEST");
>>+    g_free(data);
>>+
>>+    guest_free(alloc, req_addr);
>>+
>>+    if (features & (1u << VIRTIO_BLK_F_WRITE_ZEROES)) {
>>+        struct virtio_blk_discard_write_zeroes dwz_hdr;
>>+        void *expected;
>>+
>>+        /*
>>+         * WRITE_ZEROES request on the same sector of previous test where
>>+         * we wrote "TEST".
>>+         */
>>+        req.type = VIRTIO_BLK_T_WRITE_ZEROES;
>>+        req.data = (char *) &dwz_hdr;
>>+        dwz_hdr.sector = 0;
>>+        dwz_hdr.num_sectors = 1;
>>+        dwz_hdr.flags = 0;
>>+
>>+        virtio_blk_fix_dwz_hdr(dev, &dwz_hdr);
>>+
>>+        req_addr = virtio_blk_request(alloc, dev, &req, sizeof(dwz_hdr));
>>+
>>+        free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
>>+        qvirtqueue_add(qts, vq, req_addr + 16, sizeof(dwz_hdr), false, true);
>>+        qvirtqueue_add(qts, vq, req_addr + 16 + sizeof(dwz_hdr), 1, true,
>>+                       false);
>>+
>>+        qvirtqueue_kick(qts, dev, vq, free_head);
>>+
>>+        qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>>+                               QVIRTIO_BLK_TIMEOUT_US);
>>+        status = readb(req_addr + 16 + sizeof(dwz_hdr));
>>+        g_assert_cmpint(status, ==, 0);
>>+
>>+        guest_free(alloc, req_addr);
>>+
>>+        /* Read request to check if the sector contains all zeroes */
>>+        req.type = VIRTIO_BLK_T_IN;
>>+        req.ioprio = 1;
>>+        req.sector = 0;
>>+        req.data = g_malloc0(512);
>>+
>>+        req_addr = virtio_blk_request(alloc, dev, &req, 512);
>>+
>>+        g_free(req.data);
>>+
>>+        free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
>>+        qvirtqueue_add(qts, vq, req_addr + 16, 512, true, true);
>>+        qvirtqueue_add(qts, vq, req_addr + 528, 1, true, false);
>>+
>>+        qvirtqueue_kick(qts, dev, vq, free_head);
>>+
>>+        qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>>+                               QVIRTIO_BLK_TIMEOUT_US);
>>+        status = readb(req_addr + 528);
>>+        g_assert_cmpint(status, ==, 0);
>>+
>>+        data = g_malloc(512);
>>+        expected = g_malloc0(512);
>>+        qtest_memread(qts, req_addr + 16, data, 512);
>>+        g_assert_cmpmem(data, 512, expected, 512);
>>+        g_free(expected);
>>+        g_free(data);
>>+
>>+        guest_free(alloc, req_addr);
>>+    }
>>+
>>+    if (features & (1u << VIRTIO_BLK_F_DISCARD)) {
>>+        struct virtio_blk_discard_write_zeroes dwz_hdr;
>>+
>>+        req.type = VIRTIO_BLK_T_DISCARD;
>>+        req.data = (char *) &dwz_hdr;
>>+        dwz_hdr.sector = 0;
>>+        dwz_hdr.num_sectors = 1;
>>+        dwz_hdr.flags = 0;
>>+
>>+        virtio_blk_fix_dwz_hdr(dev, &dwz_hdr);
>>+
>>+        req_addr = virtio_blk_request(alloc, dev, &req, sizeof(dwz_hdr));
>>+
>>+        free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
>>+        qvirtqueue_add(qts, vq, req_addr + 16, sizeof(dwz_hdr), false, true);
>>+        qvirtqueue_add(qts, vq, req_addr + 16 + sizeof(dwz_hdr),
>>+                       1, true, false);
>>+
>>+        qvirtqueue_kick(qts, dev, vq, free_head);
>>+
>>+        qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>>+                               QVIRTIO_BLK_TIMEOUT_US);
>>+        status = readb(req_addr + 16 + sizeof(dwz_hdr));
>>+        g_assert_cmpint(status, ==, 0);
>>+
>>+        guest_free(alloc, req_addr);
>>+    }
>>+
>>+    if (features & (1u << VIRTIO_F_ANY_LAYOUT)) {
>>+        /* Write and read with 2 descriptor layout */
>>+        /* Write request */
>>+        req.type = VIRTIO_BLK_T_OUT;
>>+        req.ioprio = 1;
>>+        req.sector = 1;
>>+        req.data = g_malloc0(512);
>>+        strcpy(req.data, "TEST");
>>+
>>+        req_addr = virtio_blk_request(alloc, dev, &req, 512);
>>+
>>+        g_free(req.data);
>>+
>>+        free_head = qvirtqueue_add(qts, vq, req_addr, 528, false, true);
>>+        qvirtqueue_add(qts, vq, req_addr + 528, 1, true, false);
>>+        qvirtqueue_kick(qts, dev, vq, free_head);
>>+
>>+        qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>>+                               QVIRTIO_BLK_TIMEOUT_US);
>>+        status = readb(req_addr + 528);
>>+        g_assert_cmpint(status, ==, 0);
>>+
>>+        guest_free(alloc, req_addr);
>>+
>>+        /* Read request */
>>+        req.type = VIRTIO_BLK_T_IN;
>>+        req.ioprio = 1;
>>+        req.sector = 1;
>>+        req.data = g_malloc0(512);
>>+
>>+        req_addr = virtio_blk_request(alloc, dev, &req, 512);
>>+
>>+        g_free(req.data);
>>+
>>+        free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
>>+        qvirtqueue_add(qts, vq, req_addr + 16, 513, true, false);
>>+
>>+        qvirtqueue_kick(qts, dev, vq, free_head);
>>+
>>+        qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>>+                               QVIRTIO_BLK_TIMEOUT_US);
>>+        status = readb(req_addr + 528);
>>+        g_assert_cmpint(status, ==, 0);
>>+
>>+        data = g_malloc0(512);
>>+        qtest_memread(qts, req_addr + 16, data, 512);
>>+        g_assert_cmpstr(data, ==, "TEST");
>>+        g_free(data);
>>+
>>+        guest_free(alloc, req_addr);
>>+    }
>>+
>>+    return vq;
>>+}
>>+
>>+static void basic(void *obj, void *data, QGuestAllocator *t_alloc)
>>+{
>>+    QVhostUserBlk *blk_if = obj;
>>+    QVirtQueue *vq;
>>+
>>+    vq = test_basic(blk_if->vdev, t_alloc);
>>+    qvirtqueue_cleanup(blk_if->vdev->bus, vq, t_alloc);
>>+
>>+}
>>+
>>+static void indirect(void *obj, void *u_data, QGuestAllocator *t_alloc)
>>+{
>>+    QVirtQueue *vq;
>>+    QVhostUserBlk *blk_if = obj;
>>+    QVirtioDevice *dev = blk_if->vdev;
>>+    QVirtioBlkReq req;
>>+    QVRingIndirectDesc *indirect;
>>+    uint64_t req_addr;
>>+    uint64_t capacity;
>>+    uint64_t features;
>>+    uint32_t free_head;
>>+    uint8_t status;
>>+    char *data;
>>+    QTestState *qts = global_qtest;
>>+
>>+    features = qvirtio_get_features(dev);
>>+    g_assert_cmphex(features & (1u << VIRTIO_RING_F_INDIRECT_DESC), !=, 0);
>>+    features = features & ~(QVIRTIO_F_BAD_FEATURE |
>>+                            (1u << VIRTIO_RING_F_EVENT_IDX) |
>>+                            (1u << VIRTIO_BLK_F_SCSI));
>>+    qvirtio_set_features(dev, features);
>>+
>>+    capacity = qvirtio_config_readq(dev, 0);
>>+    g_assert_cmpint(capacity, ==, TEST_IMAGE_SIZE / 512);
>>+
>>+    vq = qvirtqueue_setup(dev, t_alloc, 0);
>>+    qvirtio_set_driver_ok(dev);
>>+
>>+    /* Write request */
>>+    req.type = VIRTIO_BLK_T_OUT;
>>+    req.ioprio = 1;
>>+    req.sector = 0;
>>+    req.data = g_malloc0(512);
>>+    strcpy(req.data, "TEST");
>>+
>>+    req_addr = virtio_blk_request(t_alloc, dev, &req, 512);
>>+
>>+    g_free(req.data);
>>+
>>+    indirect = qvring_indirect_desc_setup(qts, dev, t_alloc, 2);
>>+    qvring_indirect_desc_add(dev, qts, indirect, req_addr, 528, false);
>>+    qvring_indirect_desc_add(dev, qts, indirect, req_addr + 528, 1, true);
>>+    free_head = qvirtqueue_add_indirect(qts, vq, indirect);
>>+    qvirtqueue_kick(qts, dev, vq, free_head);
>>+
>>+    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>>+                           QVIRTIO_BLK_TIMEOUT_US);
>>+    status = readb(req_addr + 528);
>>+    g_assert_cmpint(status, ==, 0);
>>+
>>+    g_free(indirect);
>>+    guest_free(t_alloc, req_addr);
>>+
>>+    /* Read request */
>>+    req.type = VIRTIO_BLK_T_IN;
>>+    req.ioprio = 1;
>>+    req.sector = 0;
>>+    req.data = g_malloc0(512);
>>+    strcpy(req.data, "TEST");
>>+
>>+    req_addr = virtio_blk_request(t_alloc, dev, &req, 512);
>>+
>>+    g_free(req.data);
>>+
>>+    indirect = qvring_indirect_desc_setup(qts, dev, t_alloc, 2);
>>+    qvring_indirect_desc_add(dev, qts, indirect, req_addr, 16, false);
>>+    qvring_indirect_desc_add(dev, qts, indirect, req_addr + 16, 513, true);
>>+    free_head = qvirtqueue_add_indirect(qts, vq, indirect);
>>+    qvirtqueue_kick(qts, dev, vq, free_head);
>>+
>>+    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>>+                           QVIRTIO_BLK_TIMEOUT_US);
>>+    status = readb(req_addr + 528);
>>+    g_assert_cmpint(status, ==, 0);
>>+
>>+    data = g_malloc0(512);
>>+    qtest_memread(qts, req_addr + 16, data, 512);
>>+    g_assert_cmpstr(data, ==, "TEST");
>>+    g_free(data);
>>+
>>+    g_free(indirect);
>>+    guest_free(t_alloc, req_addr);
>>+    qvirtqueue_cleanup(dev->bus, vq, t_alloc);
>>+}
>>+
>>+static void idx(void *obj, void *u_data, QGuestAllocator *t_alloc)
>>+{
>>+    QVirtQueue *vq;
>>+    QVhostUserBlkPCI *blk = obj;
>>+    QVirtioPCIDevice *pdev = &blk->pci_vdev;
>>+    QVirtioDevice *dev = &pdev->vdev;
>>+    QVirtioBlkReq req;
>>+    uint64_t req_addr;
>>+    uint64_t capacity;
>>+    uint64_t features;
>>+    uint32_t free_head;
>>+    uint32_t write_head;
>>+    uint32_t desc_idx;
>>+    uint8_t status;
>>+    char *data;
>>+    QOSGraphObject *blk_object = obj;
>>+    QPCIDevice *pci_dev = blk_object->get_driver(blk_object, "pci-device");
>>+    QTestState *qts = global_qtest;
>>+
>>+    if (qpci_check_buggy_msi(pci_dev)) {
>>+        return;
>>+    }
>>+
>>+    qpci_msix_enable(pdev->pdev);
>>+    qvirtio_pci_set_msix_configuration_vector(pdev, t_alloc, 0);
>>+
>>+    features = qvirtio_get_features(dev);
>>+    features = features & ~(QVIRTIO_F_BAD_FEATURE |
>>+                            (1u << VIRTIO_RING_F_INDIRECT_DESC) |
>>+                            (1u << VIRTIO_F_NOTIFY_ON_EMPTY) |
>>+                            (1u << VIRTIO_BLK_F_SCSI));
>>+    qvirtio_set_features(dev, features);
>>+
>>+    capacity = qvirtio_config_readq(dev, 0);
>>+    g_assert_cmpint(capacity, ==, TEST_IMAGE_SIZE / 512);
>>+
>>+    vq = qvirtqueue_setup(dev, t_alloc, 0);
>>+    qvirtqueue_pci_msix_setup(pdev, (QVirtQueuePCI *)vq, t_alloc, 1);
>>+
>>+    qvirtio_set_driver_ok(dev);
>>+
>>+    /* Write request */
>>+    req.type = VIRTIO_BLK_T_OUT;
>>+    req.ioprio = 1;
>>+    req.sector = 0;
>>+    req.data = g_malloc0(512);
>>+    strcpy(req.data, "TEST");
>>+
>>+    req_addr = virtio_blk_request(t_alloc, dev, &req, 512);
>>+
>>+    g_free(req.data);
>>+
>>+    free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
>>+    qvirtqueue_add(qts, vq, req_addr + 16, 512, false, true);
>>+    qvirtqueue_add(qts, vq, req_addr + 528, 1, true, false);
>>+    qvirtqueue_kick(qts, dev, vq, free_head);
>>+
>>+    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>>+                           QVIRTIO_BLK_TIMEOUT_US);
>>+
>>+    /* Write request */
>>+    req.type = VIRTIO_BLK_T_OUT;
>>+    req.ioprio = 1;
>>+    req.sector = 1;
>>+    req.data = g_malloc0(512);
>>+    strcpy(req.data, "TEST");
>>+
>>+    req_addr = virtio_blk_request(t_alloc, dev, &req, 512);
>>+
>>+    g_free(req.data);
>>+
>>+    /* Notify after processing the third request */
>>+    qvirtqueue_set_used_event(qts, vq, 2);
>>+    free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
>>+    qvirtqueue_add(qts, vq, req_addr + 16, 512, false, true);
>>+    qvirtqueue_add(qts, vq, req_addr + 528, 1, true, false);
>>+    qvirtqueue_kick(qts, dev, vq, free_head);
>>+    write_head = free_head;
>>+
>>+    /* No notification expected */
>>+    status = qvirtio_wait_status_byte_no_isr(qts, dev,
>>+                                             vq, req_addr + 528,
>>+                                             QVIRTIO_BLK_TIMEOUT_US);
>>+    g_assert_cmpint(status, ==, 0);
>>+
>>+    guest_free(t_alloc, req_addr);
>>+
>>+    /* Read request */
>>+    req.type = VIRTIO_BLK_T_IN;
>>+    req.ioprio = 1;
>>+    req.sector = 1;
>>+    req.data = g_malloc0(512);
>>+
>>+    req_addr = virtio_blk_request(t_alloc, dev, &req, 512);
>>+
>>+    g_free(req.data);
>>+
>>+    free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
>>+    qvirtqueue_add(qts, vq, req_addr + 16, 512, true, true);
>>+    qvirtqueue_add(qts, vq, req_addr + 528, 1, true, false);
>>+
>>+    qvirtqueue_kick(qts, dev, vq, free_head);
>>+
>>+    /* We get just one notification for both requests */
>>+    qvirtio_wait_used_elem(qts, dev, vq, write_head, NULL,
>>+                           QVIRTIO_BLK_TIMEOUT_US);
>>+    g_assert(qvirtqueue_get_buf(qts, vq, &desc_idx, NULL));
>>+    g_assert_cmpint(desc_idx, ==, free_head);
>>+
>>+    status = readb(req_addr + 528);
>>+    g_assert_cmpint(status, ==, 0);
>>+
>>+    data = g_malloc0(512);
>>+    qtest_memread(qts, req_addr + 16, data, 512);
>>+    g_assert_cmpstr(data, ==, "TEST");
>>+    g_free(data);
>>+
>>+    guest_free(t_alloc, req_addr);
>>+
>>+    /* End test */
>>+    qpci_msix_disable(pdev->pdev);
>>+
>>+    qvirtqueue_cleanup(dev->bus, vq, t_alloc);
>>+}
>>+
>>+static void pci_hotplug(void *obj, void *data, QGuestAllocator *t_alloc)
>>+{
>>+    QVirtioPCIDevice *dev1 = obj;
>>+    QVirtioPCIDevice *dev;
>>+    QTestState *qts = dev1->pdev->bus->qts;
>>+
>>+    /* plug secondary disk */
>>+    qtest_qmp_device_add(qts, "vhost-user-blk-pci", "drv1",
>>+                         "{'addr': %s, 'chardev': 'char2'}",
>>+                         stringify(PCI_SLOT_HP) ".0");
>>+
>>+    dev = virtio_pci_new(dev1->pdev->bus,
>>+                         &(QPCIAddress) { .devfn = QPCI_DEVFN(PCI_SLOT_HP, 0)
>>+                                        });
>>+    g_assert_nonnull(dev);
>>+    g_assert_cmpint(dev->vdev.device_type, ==, VIRTIO_ID_BLOCK);
>>+    qvirtio_pci_device_disable(dev);
>>+    qos_object_destroy((QOSGraphObject *)dev);
>>+
>>+    /* unplug secondary disk */
>>+    qpci_unplug_acpi_device_test(qts, "drv1", PCI_SLOT_HP);
>>+}
>>+
>>+/*
>>+ * Check that setting the vring addr on a non-existent virtqueue does
>>+ * not crash.
>>+ */
>>+static void test_nonexistent_virtqueue(void *obj, void *data,
>>+                                       QGuestAllocator *t_alloc)
>>+{
>>+    QVhostUserBlkPCI *blk = obj;
>>+    QVirtioPCIDevice *pdev = &blk->pci_vdev;
>>+    QPCIBar bar0;
>>+    QPCIDevice *dev;
>>+
>>+    dev = qpci_device_find(pdev->pdev->bus, QPCI_DEVFN(4, 0));
>>+    g_assert(dev != NULL);
>>+    qpci_device_enable(dev);
>>+
>>+    bar0 = qpci_iomap(dev, 0, NULL);
>>+
>>+    qpci_io_writeb(dev, bar0, VIRTIO_PCI_QUEUE_SEL, 2);
>>+    qpci_io_writel(dev, bar0, VIRTIO_PCI_QUEUE_PFN, 1);
>>+
>>+    g_free(dev);
>>+}
>>+
>>+static const char *qtest_qemu_storage_daemon_binary(void)
>>+{
>>+    const char *qemu_storage_daemon_bin;
>>+
>>+    qemu_storage_daemon_bin = getenv("QTEST_QEMU_STORAGE_DAEMON_BINARY");
>>+    if (!qemu_storage_daemon_bin) {
>>+        fprintf(stderr, "Environment variable "
>>+                        "QTEST_QEMU_STORAGE_DAEMON_BINARY required\n");
>>+        exit(0);
>>+    }
>>+
>>+    return qemu_storage_daemon_bin;
>>+}
>>+
>>+static void drive_destroy(void *path)
>>+{
>>+    unlink(path);
>>+    g_free(path);
>>+    qos_invalidate_command_line();
>>+}
>>+
>>+static char *drive_create(void)
>>+{
>>+    int fd, ret;
>>+    /** vhost-user-blk won't recognize drive located in /tmp */
>>+    char *t_path = g_strdup("qtest.XXXXXX");
>>+
>>+    /** Create a temporary raw image */
>>+    fd = mkstemp(t_path);
>>+    g_assert_cmpint(fd, >=, 0);
>>+    ret = ftruncate(fd, TEST_IMAGE_SIZE);
>>+    g_assert_cmpint(ret, ==, 0);
>>+    close(fd);
>>+
>>+    g_test_queue_destroy(drive_destroy, t_path);
>>+    return t_path;
>>+}
>>+
>>+static char sock_path_tempate[] = "/tmp/qtest.vhost_user_blk.XXXXXX";
>>+static char qmp_sock_path_tempate[] = "/tmp/qtest.vhost_user_blk.qmp.XXXXXX";
>>+
>>+static void quit_storage_daemon(void *qmp_test_state)
>>+{
>>+    const char quit_str[] = "{ 'execute': 'quit' }";
>>+
>>+    /* Before quiting storate-daemon, quit qemu to avoid dubious messages */
>>+    qobject_unref(qtest_qmp(global_qtest, quit_str));
>>+
>>+    /*
>>+     * Give storage-daemon enough time to wake up&terminate
>>+     * vu_client_trip coroutine so the Coroutine object could
>>+     * be cleaned up. Otherwise LeakSanitizer would complain
>>+     * about memory leaks.
>>+     */
>>+    g_usleep(1000);
>
>Your "[PATCH for-5.2 07/10] vhost-user-blk-test: fix races by using fd passing"
>prompts to me think if there is a race condition under which 1000 ms
                                                               ^^^^^^^
Sorry, I meant 1000 μs.

>is not enough for qemu-storage-daemon to do the cleanups. If this
>situation could happen, is there a way to tell if Coroutine objects have
>been freed by qemu-storage-daemon?
>>+
>>+    qobject_unref(qtest_qmp((QTestState *)qmp_test_state, quit_str));
>>+    g_free(qmp_test_state);
>>+}
>>+
>
>>[...]
>>--
>>2.28.0
>>
>
>--
>Best regards,
>Coiby

--
Best regards,
Coiby

