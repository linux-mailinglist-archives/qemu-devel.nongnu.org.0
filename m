Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DDA48DC28
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 17:46:20 +0100 (CET)
Received: from localhost ([::1]:48218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n83Ew-0003Y5-RK
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 11:46:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <30VXgYQcKChQFy7DEBy08805y.w86Ay6E-xyFy578707E.8B0@flex--venture.bounces.google.com>)
 id 1n838f-0006k5-HC
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:39:49 -0500
Received: from [2607:f8b0:4864:20::f4a] (port=50141
 helo=mail-qv1-xf4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <30VXgYQcKChQFy7DEBy08805y.w86Ay6E-xyFy578707E.8B0@flex--venture.bounces.google.com>)
 id 1n838d-0002Ma-L7
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:39:49 -0500
Received: by mail-qv1-xf4a.google.com with SMTP id
 ib7-20020a0562141c8700b0040812bc4425so6208644qvb.16
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 08:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=LifCWiTQZmNhrBu401wbAO4/VaPVPFl+xifbloSN9Os=;
 b=BdDU8xQwJrziYkpMPT5scs/YareWo4fA8n728+E7WZab9/93blNf/92gpt0j62jTQy
 IhE0MXSgrlTjdqd0UxflVeY7/E2+c+62Lx76qGl4tNfhTaIcKb5XnWhiD2bBF0TIEs/C
 kgYqlYoT5WvDlu4beVISyQC3kbvTuOj6e/c8iLcT70diXKHOu0gHBmjrBO4cLBJs+diz
 9wtdUXqpvb6kFln9/0/yyqeqNFa0JVvm6uMsVNtFL7Bh13QD5qTrG0CZwIuSdSVSc8rn
 UoLjknhvbw7DmkETIoqHSyvMu9LHV1282nlCeXhSPJWu/h0SEzTZeg9Qlb+G2yVR3nye
 U1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=LifCWiTQZmNhrBu401wbAO4/VaPVPFl+xifbloSN9Os=;
 b=OY37trvcvwzOLWvgz/zjpndfjMKU/MHIqQiywsDhwCiUJ1EKxkH3I3dnvEC2dERL9G
 I9QbhupdV9QdDfxQ0zq30euMRGw+2Df1FAQ3wV9+lDvFW0NEny12EFFB9mNBVIoGbEDv
 MK7C72BJvBxq1kp4FVKWXnuffxAs8ZR4ZOsYMbSK/Y5zQo1D0c61tKKRr/QjwEt27kAS
 0T6CoW0A1f+3Ac68T53j2VEdek0vKgv8JiUfs2oui0O9nzBfmx67l2aBj7xtBS1YE1AR
 sCrrfRFk6QwGEoQk14ROoSZBF0ZBq+P0xlxzYO0T+/cnd2EjPfcMnBQmaKerLMIWSxyL
 +5zg==
X-Gm-Message-State: AOAM532d/h+d/zlbNCanbGq19kASABlQM16mjtItxiKv32ZneUhd9sAy
 gLBcl3PhAWTyO+CkTaMDrxLRywaciPR2
X-Google-Smtp-Source: ABdhPJziaM1iX12bYgULW0Vx9CHZZdX7SVu9fVMwUAwVP+Hr9IImucMDYDfXw9H3xKDAufg/tMROdK5mWTc5
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:e292:b948:2633:96])
 (user=venture job=sendgmr) by 2002:a05:622a:1046:: with SMTP id
 f6mr4152358qte.517.1642091985787; Thu, 13 Jan 2022 08:39:45 -0800 (PST)
Date: Thu, 13 Jan 2022 08:39:34 -0800
In-Reply-To: <20220113163934.2556958-1-venture@google.com>
Message-Id: <20220113163934.2556958-3-venture@google.com>
Mime-Version: 1.0
References: <20220113163934.2556958-1-venture@google.com>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
Subject: [PATCH v3 2/2] tests: add qtest for hw/sensor/sbtsi
From: Patrick Venture <venture@google.com>
To: thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com, f4bug@amsat.org,
 cminyard@mvista.com
Cc: qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>,
 Doug Evans <dje@google.com>, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f4a;
 envelope-from=30VXgYQcKChQFy7DEBy08805y.w86Ay6E-xyFy578707E.8B0@flex--venture.bounces.google.com;
 helo=mail-qv1-xf4a.google.com
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

From: Hao Wu <wuhaotsh@google.com>

Reviewed-by: Doug Evans <dje@google.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
Acked-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/tmp-sbtsi-test.c | 161 +++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build      |   1 +
 2 files changed, 162 insertions(+)
 create mode 100644 tests/qtest/tmp-sbtsi-test.c

diff --git a/tests/qtest/tmp-sbtsi-test.c b/tests/qtest/tmp-sbtsi-test.c
new file mode 100644
index 0000000000..ff1e193739
--- /dev/null
+++ b/tests/qtest/tmp-sbtsi-test.c
@@ -0,0 +1,161 @@
+/*
+ * QTests for the SBTSI temperature sensor
+ *
+ * Copyright 2020 Google LLC
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
+#include "libqtest-single.h"
+#include "libqos/qgraph.h"
+#include "libqos/i2c.h"
+#include "qapi/qmp/qdict.h"
+#include "qemu/bitops.h"
+#include "hw/sensor/sbtsi.h"
+
+#define TEST_ID   "sbtsi-test"
+#define TEST_ADDR (0x4c)
+
+/* The temperature stored are in units of 0.125 degrees. */
+#define LIMIT_LOW_IN_MILLIDEGREE (10500)
+#define LIMIT_HIGH_IN_MILLIDEGREE (55125)
+
+static uint32_t qmp_sbtsi_get_temperature(const char *id)
+{
+    QDict *response;
+    int ret;
+
+    response = qmp("{ 'execute': 'qom-get', 'arguments': { 'path': %s, "
+                   "'property': 'temperature' } }", id);
+    g_assert(qdict_haskey(response, "return"));
+    ret = (uint32_t)qdict_get_int(response, "return");
+    qobject_unref(response);
+    return ret;
+}
+
+static void qmp_sbtsi_set_temperature(const char *id, uint32_t value)
+{
+    QDict *response;
+
+    response = qmp("{ 'execute': 'qom-set', 'arguments': { 'path': %s, "
+                   "'property': 'temperature', 'value': %d } }", id, value);
+    g_assert(qdict_haskey(response, "return"));
+    qobject_unref(response);
+}
+
+/*
+ * Compute the temperature using the integer and decimal part and return
+ * millidegrees. The decimal part are only the top 3 bits so we shift it by
+ * 5 here.
+ */
+static uint32_t regs_to_temp(uint8_t integer, uint8_t decimal)
+{
+    return ((integer << 3) + (decimal >> 5)) * SBTSI_TEMP_UNIT_IN_MILLIDEGREE;
+}
+
+/*
+ * Compute the integer and decimal parts of the temperature in millidegrees.
+ * H/W store the decimal in the top 3 bits so we shift it by 5.
+ */
+static void temp_to_regs(uint32_t temp, uint8_t *integer, uint8_t *decimal)
+{
+    temp /= SBTSI_TEMP_UNIT_IN_MILLIDEGREE;
+    *integer = temp >> 3;
+    *decimal = (temp & 0x7) << 5;
+}
+
+static void tx_rx(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t value;
+    uint8_t integer, decimal;
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    /* Test default values */
+    value = qmp_sbtsi_get_temperature(TEST_ID);
+    g_assert_cmpuint(value, ==, 0);
+
+    integer = i2c_get8(i2cdev, SBTSI_REG_TEMP_INT);
+    decimal = i2c_get8(i2cdev, SBTSI_REG_TEMP_DEC);
+    g_assert_cmpuint(regs_to_temp(integer, decimal), ==, 0);
+
+    /* Test setting temperature */
+    qmp_sbtsi_set_temperature(TEST_ID, 20000);
+    value = qmp_sbtsi_get_temperature(TEST_ID);
+    g_assert_cmpuint(value, ==, 20000);
+
+    integer = i2c_get8(i2cdev, SBTSI_REG_TEMP_INT);
+    decimal = i2c_get8(i2cdev, SBTSI_REG_TEMP_DEC);
+    g_assert_cmpuint(regs_to_temp(integer, decimal), ==, 20000);
+
+    /* Set alert mask in config */
+    i2c_set8(i2cdev, SBTSI_REG_CONFIG_WR, SBTSI_CONFIG_ALERT_MASK);
+    value = i2c_get8(i2cdev, SBTSI_REG_CONFIG);
+    g_assert_cmphex(value, ==, SBTSI_CONFIG_ALERT_MASK);
+    /* Enable alarm_en */
+    i2c_set8(i2cdev, SBTSI_REG_ALERT_CONFIG, SBTSI_ALARM_EN);
+    value = i2c_get8(i2cdev, SBTSI_REG_ALERT_CONFIG);
+    g_assert_cmphex(value, ==, SBTSI_ALARM_EN);
+
+    /* Test setting limits */
+    /* Limit low = 10.500 */
+    temp_to_regs(LIMIT_LOW_IN_MILLIDEGREE, &integer, &decimal);
+    i2c_set8(i2cdev, SBTSI_REG_TEMP_LOW_INT, integer);
+    i2c_set8(i2cdev, SBTSI_REG_TEMP_LOW_DEC, decimal);
+    integer = i2c_get8(i2cdev, SBTSI_REG_TEMP_LOW_INT);
+    decimal = i2c_get8(i2cdev, SBTSI_REG_TEMP_LOW_DEC);
+    g_assert_cmpuint(
+        regs_to_temp(integer, decimal), ==, LIMIT_LOW_IN_MILLIDEGREE);
+    /* Limit high = 55.125 */
+    temp_to_regs(LIMIT_HIGH_IN_MILLIDEGREE, &integer, &decimal);
+    i2c_set8(i2cdev, SBTSI_REG_TEMP_HIGH_INT, integer);
+    i2c_set8(i2cdev, SBTSI_REG_TEMP_HIGH_DEC, decimal);
+    integer = i2c_get8(i2cdev, SBTSI_REG_TEMP_HIGH_INT);
+    decimal = i2c_get8(i2cdev, SBTSI_REG_TEMP_HIGH_DEC);
+    g_assert_cmpuint(
+        regs_to_temp(integer, decimal), ==, LIMIT_HIGH_IN_MILLIDEGREE);
+    /* No alert is generated. */
+    value = i2c_get8(i2cdev, SBTSI_REG_STATUS);
+    g_assert_cmphex(value, ==, 0);
+
+    /* Test alert for low temperature */
+    qmp_sbtsi_set_temperature(TEST_ID, LIMIT_LOW_IN_MILLIDEGREE);
+    value = i2c_get8(i2cdev, SBTSI_REG_STATUS);
+    g_assert_cmphex(value, ==, SBTSI_STATUS_LOW_ALERT);
+
+    /* Test alert for high temperature */
+    qmp_sbtsi_set_temperature(TEST_ID, LIMIT_HIGH_IN_MILLIDEGREE);
+    value = i2c_get8(i2cdev, SBTSI_REG_STATUS);
+    g_assert_cmphex(value, ==, SBTSI_STATUS_HIGH_ALERT);
+
+    /* Disable alarm_en */
+    i2c_set8(i2cdev, SBTSI_REG_ALERT_CONFIG, 0);
+    value = i2c_get8(i2cdev, SBTSI_REG_ALERT_CONFIG);
+    g_assert_cmphex(value, ==, 0);
+    /* No alert when alarm_en is false. */
+    value = i2c_get8(i2cdev, SBTSI_REG_STATUS);
+    g_assert_cmphex(value, ==, 0);
+}
+
+static void sbtsi_register_nodes(void)
+{
+    QOSGraphEdgeOptions opts = {
+        .extra_device_opts = "id=" TEST_ID ",address=0x4c"
+    };
+    add_qi2c_address(&opts, &(QI2CAddress) { TEST_ADDR });
+
+    qos_node_create_driver("sbtsi", i2c_device_create);
+    qos_node_consumes("sbtsi", "i2c-bus", &opts);
+
+    qos_add_test("tx-rx", "sbtsi", tx_rx, NULL);
+}
+libqos_init(sbtsi_register_nodes);
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 37e1eaa449..21e6152949 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -254,6 +254,7 @@ qos_test_ss.add(
   'spapr-phb-test.c',
   'tmp105-test.c',
   'emc141x-test.c',
+  'tmp-sbtsi-test.c',
   'usb-hcd-ohci-test.c',
   'virtio-test.c',
   'virtio-blk-test.c',
-- 
2.34.1.575.g55b058a8bb-goog


