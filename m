Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2372F3D2C48
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 21:03:41 +0200 (CEST)
Received: from localhost ([::1]:56414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6dyu-0007r5-3D
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 15:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3l8D5YAUKCg4670o2u22uzs.q204s08-rs9sz121u18.25u@flex--stmao.bounces.google.com>)
 id 1m6dx7-0006Pi-Cp
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 15:01:49 -0400
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749]:49735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3l8D5YAUKCg4670o2u22uzs.q204s08-rs9sz121u18.25u@flex--stmao.bounces.google.com>)
 id 1m6dx3-00069w-7O
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 15:01:48 -0400
Received: by mail-qk1-x749.google.com with SMTP id
 t144-20020a3746960000b02903ad9c5e94baso4758567qka.16
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 12:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=mYaBGYLE1cfmLsawmRPTnzVehqhdnXeBADvGwfTTA5E=;
 b=EajZ5aYwSih1xDFfuEazmSothxuecmCZyC/Qdk2d+o6i1t8fi6SGxWGXgCr3c23ahA
 VaykR040Hbe6aMYBkfNrMQi5gCKM8js6iSsdlo77dGY0yho8/SEJ6n65qP6EvYJ7aDki
 FeA4XlNKYyWiNGJ5PyAJSn14TixaXYWIafucjH90k99Pe1x4pVfVykMH+orMvk3Az6gZ
 kq4hy//J99efw/VJjlKhWT1c+1di2GopDL0nfyaxmijVGCWjyyvmO6eUp7rXle+41/YZ
 n4U1WEIQdslXNB73/5fMsx6YgyXhsMqXryXChWZRo8aVNmQzzTp2+2Oj59sGSGnUyea8
 Xp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=mYaBGYLE1cfmLsawmRPTnzVehqhdnXeBADvGwfTTA5E=;
 b=pE9Aa6v+VE0tdYY+NG3q+Teh0bvB8FZ+1gsqhZLxrr7sam3RQSDNMPW12uU58wog6G
 btb5Y6lGhYJ0Sxu7hs20XXkcp6yh29SP1pLkoTsGdlXn6hcWJ4plCdHVQCEp4BmRzU3c
 27rdV1+FteiHfDprjbuw6KrpKvBDoFOYkpXIHu7bf6l0ZkBPAagl/9B+JS/YCrq5a1JA
 9OttYJVgJNzEwd6RcIehqS42QuLXe79wzVQIDF8CEvGWi4wPwr7u/zis7HOcwGSQZ7oo
 Lzj+falpQ+OutNlpLVGNW0kX2QBb/c1lfg+z4dACTRpqj+32y7Nch95pTdIDwW6zKf+e
 sTzQ==
X-Gm-Message-State: AOAM532m/PDpVl3C7g5GFqCzihdvhwjCI+JsAZtcaih9TM9B0tgkw2hg
 UZ2HYfJK9XkGJ5fo5DR2q/oXuBDQDQ==
X-Google-Smtp-Source: ABdhPJwkd94RLbIHSo0boYtnFyZ6guOyjVkRW2QVH7N4GjKhkCxdk6ab/cjOwcsf2TVWTOPB51qkWwZrOQ==
X-Received: from smvm.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2d5f])
 (user=stmao job=sendgmr) by 2002:a0c:c349:: with SMTP id
 j9mr1045112qvi.35.1626980503455; 
 Thu, 22 Jul 2021 12:01:43 -0700 (PDT)
Date: Thu, 22 Jul 2021 19:01:38 +0000
In-Reply-To: <20210722190138.486785-1-stmao@google.com>
Message-Id: <20210722190138.486785-2-stmao@google.com>
Mime-Version: 1.0
References: <20210722190138.486785-1-stmao@google.com>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
Subject: [PATCH 1/1] hw/i2c: add remote I2C device
From: Shengtan Mao <stmao@google.com>
To: cminyard@mvista.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, stmao@google.com, 
 crauer@google.com, wuhaotsh@google.com, venture@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::749;
 envelope-from=3l8D5YAUKCg4670o2u22uzs.q204s08-rs9sz121u18.25u@flex--stmao.bounces.google.com;
 helo=mail-qk1-x749.google.com
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds the remote I2C device, which supports the usage of
external I2C devices.
Signed-off-by: Shengtan Mao <stmao@google.com>
---
 hw/arm/Kconfig                |   1 +
 hw/i2c/Kconfig                |   4 +
 hw/i2c/meson.build            |   1 +
 hw/i2c/remote-i2c.c           | 117 ++++++++++++++++++
 tests/qtest/meson.build       |   1 +
 tests/qtest/remote-i2c-test.c | 216 ++++++++++++++++++++++++++++++++++
 6 files changed, 340 insertions(+)
 create mode 100644 hw/i2c/remote-i2c.c
 create mode 100644 tests/qtest/remote-i2c-test.c

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 90b19c0861..58fdfab90d 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -392,6 +392,7 @@ config NPCM7XX
     select MAX34451
     select PL310  # cache controller
     select PMBUS
+    select REMOTE_I2C
     select SERIAL
     select SSI
     select UNIMP
diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
index 8217cb5041..278156991d 100644
--- a/hw/i2c/Kconfig
+++ b/hw/i2c/Kconfig
@@ -1,6 +1,10 @@
 config I2C
     bool
 
+config REMOTE_I2C
+    bool
+    select I2C
+
 config SMBUS
     bool
     select I2C
diff --git a/hw/i2c/meson.build b/hw/i2c/meson.build
index d3df273251..ba0215db61 100644
--- a/hw/i2c/meson.build
+++ b/hw/i2c/meson.build
@@ -6,6 +6,7 @@ i2c_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('smbus_ich9.c'))
 i2c_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_i2c.c'))
 i2c_ss.add(when: 'CONFIG_BITBANG_I2C', if_true: files('bitbang_i2c.c'))
 i2c_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_i2c.c'))
+i2c_ss.add(when: 'CONFIG_REMOTE_I2C', if_true: files('remote-i2c.c'))
 i2c_ss.add(when: 'CONFIG_IMX_I2C', if_true: files('imx_i2c.c'))
 i2c_ss.add(when: 'CONFIG_MPC_I2C', if_true: files('mpc_i2c.c'))
 i2c_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('microbit_i2c.c'))
diff --git a/hw/i2c/remote-i2c.c b/hw/i2c/remote-i2c.c
new file mode 100644
index 0000000000..69be80fd3c
--- /dev/null
+++ b/hw/i2c/remote-i2c.c
@@ -0,0 +1,117 @@
+/*
+ * Remote I2C controller
+ *
+ * Copyright (c) 2021 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+
+#include "chardev/char-fe.h"
+#include "hw/i2c/i2c.h"
+#include "hw/qdev-properties-system.h"
+
+#define TYPE_REMOTE_I2C "remote-i2c"
+#define REMOTE_I2C(obj) OBJECT_CHECK(RemoteI2CState, (obj), TYPE_REMOTE_I2C)
+#define ONE_BYTE 1
+
+typedef struct {
+    I2CSlave parent_obj;
+    CharBackend chr;
+} RemoteI2CState;
+
+typedef enum {
+    REMOTE_I2C_START_RECV = 0,
+    REMOTE_I2C_START_SEND = 1,
+    REMOTE_I2C_FINISH = 2,
+    REMOTE_I2C_NACK = 3,
+    REMOTE_I2C_RECV = 4,
+    REMOTE_I2C_SEND = 5,
+} RemoteI2CCommand;
+
+static uint8_t remote_i2c_recv(I2CSlave *s)
+{
+    RemoteI2CState *i2c = REMOTE_I2C(s);
+    uint8_t resp = 0;
+    uint8_t type = REMOTE_I2C_RECV;
+    qemu_chr_fe_write_all(&i2c->chr, &type, ONE_BYTE);
+
+    qemu_chr_fe_read_all(&i2c->chr, &resp, ONE_BYTE);
+    return resp;
+}
+
+static int remote_i2c_send(I2CSlave *s, uint8_t data)
+{
+    RemoteI2CState *i2c = REMOTE_I2C(s);
+    uint8_t type = REMOTE_I2C_SEND;
+    uint8_t resp = 1;
+    qemu_chr_fe_write_all(&i2c->chr, &type, ONE_BYTE);
+    qemu_chr_fe_write_all(&i2c->chr, &data, ONE_BYTE);
+
+    qemu_chr_fe_read_all(&i2c->chr, &resp, ONE_BYTE);
+    return resp ? -1 : 0;
+}
+
+/* Returns non-zero when no response from the device. */
+static int remote_i2c_event(I2CSlave *s, enum i2c_event event)
+{
+    RemoteI2CState *i2c = REMOTE_I2C(s);
+    uint8_t type;
+    uint8_t resp = 1;
+    switch (event) {
+    case I2C_START_RECV:
+        type = REMOTE_I2C_START_RECV;
+        break;
+    case I2C_START_SEND:
+        type = REMOTE_I2C_START_SEND;
+        break;
+    case I2C_FINISH:
+        type = REMOTE_I2C_FINISH;
+        break;
+    case I2C_NACK:
+        type = REMOTE_I2C_NACK;
+    }
+    qemu_chr_fe_write_all(&i2c->chr, &type, ONE_BYTE);
+    qemu_chr_fe_read_all(&i2c->chr, &resp, ONE_BYTE);
+    return resp ? -1 : 0;
+}
+
+static Property remote_i2c_props[] = {
+    DEFINE_PROP_CHR("chardev", RemoteI2CState, chr),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void remote_i2c_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
+
+    k->recv = &remote_i2c_recv;
+    k->send = &remote_i2c_send;
+    k->event = &remote_i2c_event;
+    device_class_set_props(dc, remote_i2c_props);
+}
+
+static const TypeInfo remote_i2c_type = {
+    .name = TYPE_REMOTE_I2C,
+    .parent = TYPE_I2C_SLAVE,
+    .instance_size = sizeof(RemoteI2CState),
+    .class_size = sizeof(I2CSlaveClass),
+    .class_init = remote_i2c_class_init,
+};
+
+static void remote_i2c_register(void)
+{
+    type_register_static(&remote_i2c_type);
+}
+
+type_init(remote_i2c_register)
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index e22a0792c5..95faa2c379 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -218,6 +218,7 @@ qos_test_ss.add(
   'pca9552-test.c',
   'pci-test.c',
   'pcnet-test.c',
+  'remote-i2c-test.c',
   'sdhci-test.c',
   'spapr-phb-test.c',
   'tmp105-test.c',
diff --git a/tests/qtest/remote-i2c-test.c b/tests/qtest/remote-i2c-test.c
new file mode 100644
index 0000000000..ac6e339cbe
--- /dev/null
+++ b/tests/qtest/remote-i2c-test.c
@@ -0,0 +1,216 @@
+/*
+ * Remote I2C controller
+ *
+ * Copyright (c) 2021 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+
+#include "qemu/config-file.h"
+#include "sysemu/sysemu.h"
+#include "libqos/qgraph.h"
+#include "libqos/i2c.h"
+
+#include <sys/socket.h>
+
+#define TEST_ID "remote-i2c-test"
+#define TEST_ADDR (0x62)
+#define QEMU_CMD_CHR                                                           \
+    " -chardev socket,id=i2c-chardev,host=localhost,port=%d,reconnect=10"
+
+typedef enum {
+    REMOTE_I2C_START_RECV = 0,
+    REMOTE_I2C_START_SEND = 1,
+    REMOTE_I2C_FINISH = 2,
+    REMOTE_I2C_NACK = 3,
+    REMOTE_I2C_RECV = 4,
+    REMOTE_I2C_SEND = 5,
+} RemoteI2CCommand;
+
+static int setup_fd(int *sock)
+{
+    fd_set readfds;
+    int fd;
+
+    FD_ZERO(&readfds);
+    FD_SET(*sock, &readfds);
+    g_assert(select((*sock) + 1, &readfds, NULL, NULL, NULL) == 1);
+
+    fd = accept(*sock, NULL, 0);
+    g_assert(fd >= 0);
+
+    return fd;
+}
+
+static void test_recv(QI2CDevice *i2cdev, int fd, uint8_t *msg, uint16_t len)
+{
+    uint16_t buf_size = len + 2;
+    uint8_t *buf = g_new(uint8_t, buf_size);
+    uint16_t bytes_read = 0;
+    uint8_t zero = 0;
+    ssize_t rv;
+
+    /* write device responses to socket */
+    rv = write(fd, &zero, 1);
+    g_assert_cmpint(rv, ==, 1);
+    rv = write(fd, msg, len);
+    g_assert_cmpint(rv, ==, len);
+    rv = write(fd, &zero, 1);
+    g_assert_cmpint(rv, ==, 1);
+
+    /* check received value */
+    qi2c_recv(i2cdev, buf, len);
+    for (int i = 0; i < len; ++i) {
+        g_assert_cmphex(buf[i], ==, msg[i]);
+    }
+
+    /* check controller writes to chardev */
+    do {
+        bytes_read += read(fd, buf + bytes_read, buf_size - bytes_read);
+    } while (bytes_read < buf_size);
+
+    g_assert_cmphex(buf[0], ==, REMOTE_I2C_START_RECV);
+    for (int i = 1; i < len - 1; ++i) {
+        g_assert_cmphex(buf[i], ==, REMOTE_I2C_RECV);
+    }
+    g_assert_cmphex(buf[buf_size - 1], ==, REMOTE_I2C_FINISH);
+
+    g_free(buf);
+}
+
+static void test_send(QI2CDevice *i2cdev, int fd, uint8_t *msg, uint16_t len)
+{
+    uint16_t buf_size = len * 2 + 2;
+    uint8_t *buf = g_new0(uint8_t, buf_size);
+    uint16_t bytes_read = 0;
+    ssize_t rv;
+    int j = 0;
+
+    /* write device ACKs to socket*/
+    rv = write(fd, buf, len + 2);
+    g_assert_cmpint(rv, ==, len + 2);
+
+    qi2c_send(i2cdev, msg, len);
+
+    /* check controller writes to chardev */
+    do {
+        bytes_read += read(fd, buf + bytes_read, buf_size - bytes_read);
+    } while (bytes_read < buf_size);
+
+    g_assert_cmphex(buf[0], ==, REMOTE_I2C_START_SEND);
+    for (int i = 1; i < buf_size - 1; i += 2) {
+        g_assert_cmphex(buf[i], ==, REMOTE_I2C_SEND);
+        g_assert_cmphex(buf[i + 1], ==, msg[j++]);
+    }
+    g_assert_cmphex(buf[buf_size - 1], ==, REMOTE_I2C_FINISH);
+
+    g_free(buf);
+}
+
+static void test_remote_i2c_recv(void *obj, void *data,
+                                 QGuestAllocator *t_alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    int *sock = (int *)data;
+    int fd = setup_fd(sock);
+
+    uint8_t msg[] = {0x47, 0x48, 0x49, 0x4A, 0x4B, 0x4C, 0x4D, 0x4E, 0x4F};
+
+    test_recv(i2cdev, fd, msg, 1);
+    test_recv(i2cdev, fd, msg, 2);
+    test_recv(i2cdev, fd, msg, 3);
+    test_recv(i2cdev, fd, msg, 4);
+    test_recv(i2cdev, fd, msg, 5);
+    test_recv(i2cdev, fd, msg, 6);
+    test_recv(i2cdev, fd, msg, 7);
+    test_recv(i2cdev, fd, msg, 8);
+    test_recv(i2cdev, fd, msg, 9);
+}
+
+static void test_remote_i2c_send(void *obj, void *data,
+                                 QGuestAllocator *t_alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    int *sock = (int *)data;
+    int fd = setup_fd(sock);
+
+    uint8_t msg[] = {0x47, 0x48, 0x49, 0x4A, 0x4B, 0x4C, 0x4D, 0x4E, 0x4F};
+
+    test_send(i2cdev, fd, msg, 1);
+    test_send(i2cdev, fd, msg, 2);
+    test_send(i2cdev, fd, msg, 3);
+    test_send(i2cdev, fd, msg, 4);
+    test_send(i2cdev, fd, msg, 5);
+    test_send(i2cdev, fd, msg, 6);
+    test_send(i2cdev, fd, msg, 7);
+    test_send(i2cdev, fd, msg, 8);
+    test_send(i2cdev, fd, msg, 9);
+}
+
+static in_port_t open_socket(int *sock)
+{
+    struct sockaddr_in myaddr;
+    socklen_t addrlen;
+
+    myaddr.sin_family = AF_INET;
+    myaddr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
+    myaddr.sin_port = 0;
+
+    *sock = socket(AF_INET, SOCK_STREAM, 0);
+    g_assert(*sock != -1);
+    g_assert(bind(*sock, (struct sockaddr *)&myaddr, sizeof(myaddr)) != -1);
+
+    addrlen = sizeof(myaddr);
+    g_assert(getsockname(*sock, (struct sockaddr *)&myaddr, &addrlen) != -1);
+    g_assert(listen(*sock, 1) != -1);
+
+    return ntohs(myaddr.sin_port);
+}
+
+static void remote_i2c_test_cleanup(void *socket)
+{
+    int *s = socket;
+
+    close(*s);
+    qos_invalidate_command_line();
+    g_free(s);
+}
+
+static void *remote_i2c_test_setup(GString *cmd_line, void *arg)
+{
+    int *sock = g_new(int, 1);
+
+    g_string_append_printf(cmd_line, QEMU_CMD_CHR, open_socket(sock));
+    g_test_queue_destroy(remote_i2c_test_cleanup, sock);
+    return sock;
+}
+
+static void register_remote_i2c_test(void)
+{
+    QOSGraphEdgeOptions edge = {
+        .extra_device_opts = "id=" TEST_ID ",address=0x62,chardev=i2c-chardev"};
+    add_qi2c_address(&edge, &(QI2CAddress){TEST_ADDR});
+
+    qos_node_create_driver("remote-i2c", i2c_device_create);
+    qos_node_consumes("remote-i2c", "i2c-bus", &edge);
+
+    QOSGraphTestOptions opts = {
+        .before = remote_i2c_test_setup,
+    };
+    qemu_add_opts(&qemu_chardev_opts);
+    qos_add_test("test_remote_i2c_recv", "remote-i2c", test_remote_i2c_recv,
+                 &opts);
+    qos_add_test("test_remote_i2c_send", "remote-i2c", test_remote_i2c_send,
+                 &opts);
+}
+libqos_init(register_remote_i2c_test);
-- 
2.32.0.402.g57bb445576-goog


