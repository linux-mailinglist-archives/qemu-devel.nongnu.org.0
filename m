Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD704767A6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 03:02:22 +0100 (CET)
Received: from localhost ([::1]:56936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxg68-0005CT-Rt
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 21:02:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3VJy6YQcKCosz3103sxv33v0t.r315t19-stAt0232v29.36v@flex--komlodi.bounces.google.com>)
 id 1mxg3b-0003Iw-Gd
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 20:59:45 -0500
Received: from [2607:f8b0:4864:20::94a] (port=37481
 helo=mail-ua1-x94a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3VJy6YQcKCosz3103sxv33v0t.r315t19-stAt0232v29.36v@flex--komlodi.bounces.google.com>)
 id 1mxg3Z-0007S2-Mt
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 20:59:43 -0500
Received: by mail-ua1-x94a.google.com with SMTP id
 h6-20020a9f3006000000b002e6e81fda51so15015280uab.4
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 17:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=8HmnuyfVD1e8skDf3kwtgBZA9JjXZYqlKEdQrXjs434=;
 b=Q9WR+kLzH/DI29s1faGyrK0mLaxfY067/tClQY55KiCGSsdphf1jy91WUupZqWP7AK
 BVaV2b/O4e91iwvF+g3ycPa8aw9i4oE5GUuVnDV/Ap6yhPEo9Byk0QezDC2qrcgTVUxI
 8cFIGZPvM2t/jTEKFmgd2e49unoD8m/3aDBVEAcB9NAwVfpEzePohPMsrUOx9oR2xTnQ
 Sh8gcJTYvTymsNl8ihRwxsoWRCq49YSZH3HCa4S8gVl+k9G+2i/tIkg7N4wO+/0v+mxY
 FpVOX3V02Jt25FmArHIq/IT0spnkQmwfmovQUPd762tnftQDliQKeN7LIjSY/V5Up1IC
 mxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=8HmnuyfVD1e8skDf3kwtgBZA9JjXZYqlKEdQrXjs434=;
 b=y0xzr/jpPgETf66YoskE0Z+AtJTXiOqC1pVFi8SCRVRc/nZWMmcaam4LHNrGlk3nwl
 pHjbpy1JV+vl+5OwAaZpcp3F09hAku6j1RYfCchoG5zdNXgAP2mqnfODebEg65GLEPSg
 svmfgSKRhdcMmnpnGdv/PSRNubxsRMZpfJNBFD2D4agL27OLMY89WQJ7DLM/3FB08DzZ
 HJfpP+s7Zt6ukCZUAaRla/AExqPgw76Om8WDamT/tKgrbgrEoKk4NOsyl6WPKpnbqH84
 wdVFsRQNTJ8gOfL03pNCDvboGq6ahSyUmB4+ZJwPjrh7K2kbg+wLYZEX9lGaqnYWC30P
 jr1A==
X-Gm-Message-State: AOAM531ame4cZFsDfLiC4XclMauzPHGH395WrbX3+yKlf2ym+Z1yKf6+
 aQezhaTGMtw/onNZo7VgcNxhZJrBwqmM3jKHXN3PfVMVEIJElBiDTTbP4+8Xx0aGeTtPnrq+Ac3
 Jzi52aJtoD0B8YG7oRBDVvkFMde9iYNLNBNOdhaOf/nikLgp3gJnuAj9+nspKVi0=
X-Google-Smtp-Source: ABdhPJwsDE1I0kaeU7Rage8Beh2K0W0uSFfSDt/trYdhh4bKsu+frQLim6oGkNeWkOGHDNvo4Uw850jVobO5
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a17:903:1246:b0:148:a658:8d32 with SMTP id
 u6-20020a170903124600b00148a6588d32mr6333901plh.117.1639619668013; Wed, 15
 Dec 2021 17:54:28 -0800 (PST)
Date: Thu, 16 Dec 2021 01:54:17 +0000
In-Reply-To: <20211216015417.1234812-1-komlodi@google.com>
Message-Id: <20211216015417.1234812-7-komlodi@google.com>
Mime-Version: 1.0
References: <20211216015417.1234812-1-komlodi@google.com>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
Subject: [RFC PATCH 6/6] qtests/gpio_transmitter: Add test
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, venture@google.com, hskinnemoen@google.com, 
 kfting@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::94a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::94a;
 envelope-from=3VJy6YQcKCosz3103sxv33v0t.r315t19-stAt0232v29.36v@flex--komlodi.bounces.google.com;
 helo=mail-ua1-x94a.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

This tests each NPCM7xx GPIO controller to make sure that when GPIO state is
updated, the controller sends a request to the GPIO transmitter to transmit the
data via chardev.
Along with that, we verify that the data is formatted correctly.

Signed-off-by: Joe Komlodi <komlodi@google.com>
---
 tests/qtest/google_gpio_tx-test.c | 216 ++++++++++++++++++++++++++++++
 tests/qtest/meson.build           |   1 +
 2 files changed, 217 insertions(+)
 create mode 100644 tests/qtest/google_gpio_tx-test.c

diff --git a/tests/qtest/google_gpio_tx-test.c b/tests/qtest/google_gpio_tx-test.c
new file mode 100644
index 0000000000..651c0501bc
--- /dev/null
+++ b/tests/qtest/google_gpio_tx-test.c
@@ -0,0 +1,216 @@
+/*
+ * QTest testcase for the Google GPIO Transmitter, using the NPCM7xx GPIO
+ * controller.
+ *
+ * Copyright 2021 Google LLC
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
+#include "libqtest-single.h"
+#include "libqos/libqtest.h"
+
+#define NR_GPIO_DEVICES (8)
+#define GPIO(x)         (0xf0010000 + (x) * 0x1000)
+
+/* GPIO registers */
+#define GP_N_TLOCK1     0x00
+#define GP_N_DIN        0x04 /* Data IN */
+#define GP_N_POL        0x08 /* Polarity */
+#define GP_N_DOUT       0x0c /* Data OUT */
+#define GP_N_OE         0x10 /* Output Enable */
+#define GP_N_OTYP       0x14
+#define GP_N_MP         0x18
+#define GP_N_PU         0x1c /* Pull-up */
+#define GP_N_PD         0x20 /* Pull-down */
+#define GP_N_DBNC       0x24 /* Debounce */
+#define GP_N_EVTYP      0x28 /* Event Type */
+#define GP_N_EVBE       0x2c /* Event Both Edge */
+#define GP_N_OBL0       0x30
+#define GP_N_OBL1       0x34
+#define GP_N_OBL2       0x38
+#define GP_N_OBL3       0x3c
+#define GP_N_EVEN       0x40 /* Event Enable */
+#define GP_N_EVENS      0x44 /* Event Set (enable) */
+#define GP_N_EVENC      0x48 /* Event Clear (disable) */
+#define GP_N_EVST       0x4c /* Event Status */
+#define GP_N_SPLCK      0x50
+#define GP_N_MPLCK      0x54
+#define GP_N_IEM        0x58 /* Input Enable */
+#define GP_N_OSRC       0x5c
+#define GP_N_ODSC       0x60
+#define GP_N_DOS        0x68 /* Data OUT Set */
+#define GP_N_DOC        0x6c /* Data OUT Clear */
+#define GP_N_OES        0x70 /* Output Enable Set */
+#define GP_N_OEC        0x74 /* Output Enable Clear */
+#define GP_N_TLOCK2     0x7c
+
+#define PACKET_REVISION 0x01
+
+typedef enum {
+    GPIOTXCODE_OK              = 0x00,
+    GPIOTXCODE_MALFORMED_PKT   = 0xe0,
+    GPIOTXCODE_UNKNOWN_VERSION = 0xe1,
+} GPIOTXCode;
+
+static int sock;
+static int fd;
+
+static in_port_t open_socket(void)
+{
+    struct sockaddr_in myaddr;
+    struct timeval timeout = { .tv_sec = 1, };
+    socklen_t addrlen;
+
+    myaddr.sin_family = AF_INET;
+    myaddr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
+    myaddr.sin_port = 0;
+    sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
+    g_assert(sock != -1);
+    g_assert(bind(sock, (struct sockaddr *) &myaddr, sizeof(myaddr)) != -1);
+    setsockopt(sock, SOL_SOCKET, SO_RCVTIMEO, &timeout, sizeof(timeout));
+
+    addrlen = sizeof(myaddr);
+    g_assert(getsockname(sock, (struct sockaddr *) &myaddr , &addrlen) != -1);
+    g_assert(listen(sock, 1) != -1);
+    return ntohs(myaddr.sin_port);
+}
+
+static void setup_fd(void)
+{
+    fd_set readfds;
+
+    FD_ZERO(&readfds);
+    FD_SET(sock, &readfds);
+    g_assert(select(sock + 1, &readfds, NULL, NULL, NULL) == 1);
+
+    fd = accept(sock, NULL, 0);
+}
+
+/*
+ * The GPIO controller is naturally chatty and will send us state updates when
+ * any register is written to, since it could impact the GPIO state.
+ * For our purposes, we only care when we set DOUT, so we use this to discard
+
+ * state changes we don't care about.
+ */
+static void purge_read_queue(void)
+{
+    uint8_t buf[256];
+    ssize_t ret;
+
+    do {
+        ret = read(fd, buf, sizeof(buf));
+    } while (ret > 0);
+}
+
+static void gpio_unlock(int n)
+{
+    if (readl(GPIO(n) + GP_N_TLOCK1) != 0) {
+        writel(GPIO(n) + GP_N_TLOCK2, 0xc0de1248);
+        writel(GPIO(n) + GP_N_TLOCK1, 0xc0defa73);
+    }
+}
+
+/* Restore the GPIO controller to a sensible default state. */
+static void gpio_reset(int n)
+{
+    gpio_unlock(0);
+
+    writel(GPIO(n) + GP_N_EVEN, 0x00000000);
+    writel(GPIO(n) + GP_N_EVST, 0xffffffff);
+    writel(GPIO(n) + GP_N_POL, 0x00000000);
+    writel(GPIO(n) + GP_N_DOUT, 0x00000000);
+    writel(GPIO(n) + GP_N_OE, 0x00000000);
+    writel(GPIO(n) + GP_N_OTYP, 0x00000000);
+    writel(GPIO(n) + GP_N_PU, 0xffffffff);
+    writel(GPIO(n) + GP_N_PD, 0x00000000);
+    writel(GPIO(n) + GP_N_IEM, 0xffffffff);
+}
+
+static void set_dout(int n, uint32_t val)
+{
+    gpio_reset(n);
+    writel(GPIO(n) + GP_N_OE, 0xffffffff);
+    /* Remove anything the controller TXed from reset and OEN */
+    purge_read_queue();
+
+    writel(GPIO(n) + GP_N_DOUT, val);
+    g_assert_cmphex(readl(GPIO(n) + GP_N_DOUT), ==, val);
+}
+
+static void read_data(uint8_t *data, size_t len)
+{
+    ssize_t ret;
+    size_t len_read = 0;
+
+    while (len_read < len) {
+        ret = read(fd, &data[len_read], len);
+        g_assert_cmpint(ret, !=, -1);
+
+        len_read += ret;
+    }
+}
+
+/*
+ * Set DOUT, ensure only the allowed pin triggers a packet tx, then receive the
+ * state update TXed by the controller.
+ */
+static void test_gpio_n_tx(gconstpointer test_data)
+{
+    uint8_t packet[6];
+    uint32_t gpio_state;
+    intptr_t n = (intptr_t)test_data;
+    uint8_t resp;
+    ssize_t ret;
+
+    set_dout(n, 0xaa55aa55);
+    read_data(packet, sizeof(packet));
+    gpio_state = *(uint32_t *)&packet[2];
+
+    g_assert_cmpint(packet[0], ==, PACKET_REVISION);
+    g_assert_cmpint(packet[1], ==, n);
+    g_assert_cmpint(gpio_state, ==, 0xaa55aa55);
+
+    /* All good */
+    resp = 0x00;
+    ret = write(fd, &resp, sizeof(resp));
+    g_assert_cmpint(ret, !=, -1);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+    size_t i;
+    int port;
+
+    g_test_init(&argc, &argv, NULL);
+    port = open_socket();
+
+    global_qtest = qtest_initf("-machine npcm750-evb "
+                "-chardev socket,id=google-gpio-tx-chr,port=%d,host=localhost "
+                "-global driver=google.gpio-transmitter,property=gpio-chardev,"
+                "value=google-gpio-tx-chr",
+                port);
+    setup_fd();
+
+    for (i = 0; i < NR_GPIO_DEVICES; i++) {
+        g_autofree char *test_name =
+            g_strdup_printf("/google_gpio_tx/gpio[%zu]/tx", i);
+        qtest_add_data_func(test_name, (void *)(intptr_t)i, test_gpio_n_tx);
+    }
+
+    ret = g_test_run();
+    qtest_end();
+
+    return ret;
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index ee171f7423..d7b36f89af 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -160,6 +160,7 @@ qtests_sparc64 = \
 qtests_npcm7xx = \
   ['npcm7xx_adc-test',
    'npcm7xx_gpio-test',
+   'google_gpio_tx-test',
    'npcm7xx_pwm-test',
    'npcm7xx_rng-test',
    'npcm7xx_smbus-test',
-- 
2.34.1.173.g76aa8bc2d0-goog


