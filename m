Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 930633C1920
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:21:26 +0200 (CEST)
Received: from localhost ([::1]:42766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1YeL-0001sf-KA
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3NTXnYAYKCko5u5643s00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--titusr.bounces.google.com>)
 id 1m1Xn1-000085-5O
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:26:19 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:38696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3NTXnYAYKCko5u5643s00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--titusr.bounces.google.com>)
 id 1m1Xmw-0005lP-S2
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:26:18 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 x84-20020a2531570000b029055d47682463so6293902ybx.5
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 10:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=J3rhjoYKGEuwWrg7Wi4lk+VNKC07bHbA7CaMm4leJJw=;
 b=m3f01T3NeijTJjeWHUvLpp0CM8VqIuPEik2C4bqV3NtcttSCgynLlw9JY6X/rILqcE
 rpikoorU+891EFHX0ROVmRBNYwWiHHjrTIcEGeicOr7QD/uNEXrte6s2RuxV5/milWP/
 ymGC0P1RdUNncbaNTadSlMgsdT4q1T9LlFRSQneeYKUJwgrkY0xwRXzNrMjFpYXz10DH
 tLe5XRhthnDSJuYBNyt9HnF/7UUjR9RYrIam0ycz5Zjn1sRaSLV6+u2lpPccPXjiJVaT
 YCjIQdGbiTltn7vp3PfrsZgdfb/CSFnb90gLwPObDq07N4s/d0cDNcryqSOOqHxrpehG
 3cjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=J3rhjoYKGEuwWrg7Wi4lk+VNKC07bHbA7CaMm4leJJw=;
 b=K5+PGQzYsuxJvdGx3gTIa5aT4YJPoH6ZUm9D+AhRQtmO2Yy+mF9OMoyZfZgbJY/rZS
 wQ5dlg2VUCCvN1PAA9GNCEvhPiiRqRjZgNEk85pIM8vR/qrrQioYrOlZ+r7aFs84Qlvf
 HTA0fTgcuegXlYEf1Hf9kpnf+cQPgO5XhxYq8zBzoXHpzJA9k6YH5Lu/m44isI1bRgEt
 G+fC/j5D1rGivN5+dyxrnkJ2j8W99S87+dig3Us587k6VEGrMmMcXwoIviwoQszw3/SL
 c9H8hxFsqa2EczxTH1I2weqvaeX4VMDtTWP5SjmbmzPujgdVOC9+kPI558MG0eWvt+Ei
 QIcw==
X-Gm-Message-State: AOAM533pJQlR5fYPpWR7r7JFHgJ2hW39IZSF5biojHaCsPmw5yUAl8yO
 MchZYIu21Rv2RXf5sPzD1mFQyBFASB8=
X-Google-Smtp-Source: ABdhPJy0D2oE95M1DvlJ0mhJ+loUgH8QhpFxuTduZpeit9A5DOurY8nbj0uPWKOc92ycsyKhwAREZwxsKW0=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2c5:13:6b42:285b:df15:bf])
 (user=titusr job=sendgmr) by 2002:a25:aa09:: with SMTP id
 s9mr41614514ybi.165.1625765173407; 
 Thu, 08 Jul 2021 10:26:13 -0700 (PDT)
Date: Thu,  8 Jul 2021 10:25:56 -0700
In-Reply-To: <20210708172556.1868139-1-titusr@google.com>
Message-Id: <20210708172556.1868139-6-titusr@google.com>
Mime-Version: 1.0
References: <20210708172556.1868139-1-titusr@google.com>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
Subject: [PATCH v5 5/5] tests/qtest: add tests for MAX34451 device model
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3NTXnYAYKCko5u5643s00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -100
X-Spam_score: -10.1
X-Spam_bar: ----------
X-Spam_report: (-10.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.5,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 tests/qtest/max34451-test.c | 336 ++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build     |   1 +
 2 files changed, 337 insertions(+)
 create mode 100644 tests/qtest/max34451-test.c

diff --git a/tests/qtest/max34451-test.c b/tests/qtest/max34451-test.c
new file mode 100644
index 0000000000..0c98d0764c
--- /dev/null
+++ b/tests/qtest/max34451-test.c
@@ -0,0 +1,336 @@
+/*
+ * QTests for the MAX34451 device
+ *
+ * Copyright 2021 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/i2c/pmbus_device.h"
+#include "libqtest-single.h"
+#include "libqos/qgraph.h"
+#include "libqos/i2c.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qnum.h"
+#include "qemu/bitops.h"
+
+#define TEST_ID "max34451-test"
+#define TEST_ADDR (0x4e)
+
+#define MAX34451_MFR_VOUT_PEAK          0xD4
+#define MAX34451_MFR_IOUT_PEAK          0xD5
+#define MAX34451_MFR_TEMPERATURE_PEAK   0xD6
+#define MAX34451_MFR_VOUT_MIN           0xD7
+
+#define DEFAULT_VOUT                    0
+#define DEFAULT_UV_LIMIT                0
+#define DEFAULT_TEMPERATURE             2500
+#define DEFAULT_SCALE                   0x7FFF
+#define DEFAULT_OV_LIMIT                0x7FFF
+#define DEFAULT_OC_LIMIT                0x7FFF
+#define DEFAULT_OT_LIMIT                0x7FFF
+#define DEFAULT_VMIN                    0x7FFF
+#define DEFAULT_TON_FAULT_LIMIT         0xFFFF
+#define DEFAULT_CHANNEL_CONFIG          0x20
+#define DEFAULT_TEXT                    0x20
+
+#define MAX34451_NUM_PWR_DEVICES        16
+#define MAX34451_NUM_TEMP_DEVICES       5
+
+
+static uint16_t qmp_max34451_get(const char *id, const char *property)
+{
+    QDict *response;
+    uint16_t ret;
+    response = qmp("{ 'execute': 'qom-get', 'arguments': { 'path': %s, "
+                   "'property': %s } }", id, property);
+    g_assert(qdict_haskey(response, "return"));
+    ret = qnum_get_uint(qobject_to(QNum, qdict_get(response, "return")));
+    qobject_unref(response);
+    return ret;
+}
+
+static void qmp_max34451_set(const char *id,
+                             const char *property,
+                             uint16_t value)
+{
+    QDict *response;
+
+    response = qmp("{ 'execute': 'qom-set', 'arguments': { 'path': %s, "
+                   "'property': %s, 'value': %u } }",
+                   id, property, value);
+    g_assert(qdict_haskey(response, "return"));
+    qobject_unref(response);
+}
+
+/* PMBus commands are little endian vs i2c_set16 in i2c.h which is big endian */
+static uint16_t max34451_i2c_get16(QI2CDevice *i2cdev, uint8_t reg)
+{
+    uint8_t resp[2];
+    i2c_read_block(i2cdev, reg, resp, sizeof(resp));
+    return (resp[1] << 8) | resp[0];
+}
+
+/* PMBus commands are little endian vs i2c_set16 in i2c.h which is big endian */
+static void max34451_i2c_set16(QI2CDevice *i2cdev, uint8_t reg, uint16_t value)
+{
+    uint8_t data[2];
+
+    data[0] = value & 255;
+    data[1] = value >> 8;
+    i2c_write_block(i2cdev, reg, data, sizeof(data));
+}
+
+/* Test default values */
+static void test_defaults(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t value, i2c_value;
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    char *path;
+
+    /* Default temperatures and temperature fault limits */
+    for (int i = 0; i < MAX34451_NUM_TEMP_DEVICES; i++) {
+        path = g_strdup_printf("temperature[%d]", i);
+        value = qmp_max34451_get(TEST_ID, path);
+        g_assert_cmpuint(value, ==, DEFAULT_TEMPERATURE);
+        g_free(path);
+
+        /* Temperature sensors start on page 16 */
+        i2c_set8(i2cdev, PMBUS_PAGE, i + 16);
+        i2c_value = max34451_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_1);
+        g_assert_cmpuint(i2c_value, ==, DEFAULT_TEMPERATURE);
+
+        i2c_value = max34451_i2c_get16(i2cdev, PMBUS_OT_FAULT_LIMIT);
+        g_assert_cmpuint(i2c_value, ==, DEFAULT_OT_LIMIT);
+
+        i2c_value = max34451_i2c_get16(i2cdev, PMBUS_OT_WARN_LIMIT);
+        g_assert_cmpuint(i2c_value, ==, DEFAULT_OT_LIMIT);
+    }
+
+    /* Default voltages and fault limits */
+    for (int i = 0; i < MAX34451_NUM_PWR_DEVICES; i++) {
+        path = g_strdup_printf("vout[%d]", i);
+        value = qmp_max34451_get(TEST_ID, path);
+        g_assert_cmpuint(value, ==, DEFAULT_VOUT);
+        g_free(path);
+
+        i2c_set8(i2cdev, PMBUS_PAGE, i);
+        i2c_value = max34451_i2c_get16(i2cdev, PMBUS_READ_VOUT);
+        g_assert_cmpuint(i2c_value, ==, DEFAULT_VOUT);
+
+        i2c_value = max34451_i2c_get16(i2cdev, PMBUS_VOUT_OV_FAULT_LIMIT);
+        g_assert_cmpuint(i2c_value, ==, DEFAULT_OV_LIMIT);
+
+        i2c_value = max34451_i2c_get16(i2cdev, PMBUS_VOUT_OV_WARN_LIMIT);
+        g_assert_cmpuint(i2c_value, ==, DEFAULT_OV_LIMIT);
+
+        i2c_value = max34451_i2c_get16(i2cdev, PMBUS_VOUT_UV_WARN_LIMIT);
+        g_assert_cmpuint(i2c_value, ==, DEFAULT_UV_LIMIT);
+
+        i2c_value = max34451_i2c_get16(i2cdev, PMBUS_VOUT_UV_FAULT_LIMIT);
+        g_assert_cmpuint(i2c_value, ==, DEFAULT_UV_LIMIT);
+
+        i2c_value = max34451_i2c_get16(i2cdev, MAX34451_MFR_VOUT_MIN);
+        g_assert_cmpuint(i2c_value, ==, DEFAULT_VMIN);
+    }
+
+    i2c_value = i2c_get8(i2cdev, PMBUS_VOUT_MODE);
+    g_assert_cmphex(i2c_value, ==, 0x40); /* DIRECT mode */
+
+    i2c_value = i2c_get8(i2cdev, PMBUS_REVISION);
+    g_assert_cmphex(i2c_value, ==, 0x11); /* Rev 1.1 */
+}
+
+/* Test setting temperature */
+static void test_temperature(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t value, i2c_value;
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    char *path;
+
+    for (int i = 0; i < MAX34451_NUM_TEMP_DEVICES; i++) {
+        path = g_strdup_printf("temperature[%d]", i);
+        qmp_max34451_set(TEST_ID, path, 0xBE00 + i);
+        value = qmp_max34451_get(TEST_ID, path);
+        g_assert_cmphex(value, ==, 0xBE00 + i);
+        g_free(path);
+    }
+
+    /* compare qmp read with i2c read separately */
+    for (int i = 0; i < MAX34451_NUM_TEMP_DEVICES; i++) {
+        /* temperature[0] is on page 16 */
+        i2c_set8(i2cdev, PMBUS_PAGE, i + 16);
+        i2c_value = max34451_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_1);
+        g_assert_cmphex(i2c_value, ==, 0xBE00 + i);
+
+        i2c_value = max34451_i2c_get16(i2cdev, MAX34451_MFR_TEMPERATURE_PEAK);
+        g_assert_cmphex(i2c_value, ==, 0xBE00 + i);
+    }
+}
+
+/* Test setting voltage */
+static void test_voltage(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t value, i2c_value;
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    char *path;
+
+    for (int i = 0; i < MAX34451_NUM_PWR_DEVICES; i++) {
+        path = g_strdup_printf("vout[%d]", i);
+        qmp_max34451_set(TEST_ID, path, 3000 + i);
+        value = qmp_max34451_get(TEST_ID, path);
+        g_assert_cmpuint(value, ==, 3000 + i);
+        g_free(path);
+    }
+
+    /* compare qmp read with i2c read separately */
+    for (int i = 0; i < MAX34451_NUM_PWR_DEVICES; i++) {
+        i2c_set8(i2cdev, PMBUS_PAGE, i);
+        i2c_value = max34451_i2c_get16(i2cdev, PMBUS_READ_VOUT);
+        g_assert_cmpuint(i2c_value, ==, 3000 + i);
+
+        i2c_value = max34451_i2c_get16(i2cdev, MAX34451_MFR_VOUT_PEAK);
+        g_assert_cmpuint(i2c_value, ==, 3000 + i);
+
+        i2c_value = max34451_i2c_get16(i2cdev, MAX34451_MFR_VOUT_MIN);
+        g_assert_cmpuint(i2c_value, ==, 3000 + i);
+    }
+}
+
+/* Test setting some read/write registers */
+static void test_rw_regs(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t i2c_value;
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    i2c_set8(i2cdev, PMBUS_PAGE, 11);
+    i2c_value = i2c_get8(i2cdev, PMBUS_PAGE);
+    g_assert_cmpuint(i2c_value, ==, 11);
+
+    i2c_set8(i2cdev, PMBUS_OPERATION, 1);
+    i2c_value = i2c_get8(i2cdev, PMBUS_OPERATION);
+    g_assert_cmpuint(i2c_value, ==, 1);
+
+    max34451_i2c_set16(i2cdev, PMBUS_VOUT_MARGIN_HIGH, 5000);
+    i2c_value = max34451_i2c_get16(i2cdev, PMBUS_VOUT_MARGIN_HIGH);
+    g_assert_cmpuint(i2c_value, ==, 5000);
+
+    max34451_i2c_set16(i2cdev, PMBUS_VOUT_MARGIN_LOW, 4000);
+    i2c_value = max34451_i2c_get16(i2cdev, PMBUS_VOUT_MARGIN_LOW);
+    g_assert_cmpuint(i2c_value, ==, 4000);
+
+    max34451_i2c_set16(i2cdev, PMBUS_VOUT_OV_FAULT_LIMIT, 5500);
+    i2c_value = max34451_i2c_get16(i2cdev, PMBUS_VOUT_OV_FAULT_LIMIT);
+    g_assert_cmpuint(i2c_value, ==, 5500);
+
+    max34451_i2c_set16(i2cdev, PMBUS_VOUT_OV_WARN_LIMIT, 5600);
+    i2c_value = max34451_i2c_get16(i2cdev, PMBUS_VOUT_OV_WARN_LIMIT);
+    g_assert_cmpuint(i2c_value, ==, 5600);
+
+    max34451_i2c_set16(i2cdev, PMBUS_VOUT_UV_FAULT_LIMIT, 5700);
+    i2c_value = max34451_i2c_get16(i2cdev, PMBUS_VOUT_UV_FAULT_LIMIT);
+    g_assert_cmpuint(i2c_value, ==, 5700);
+
+    max34451_i2c_set16(i2cdev, PMBUS_VOUT_UV_WARN_LIMIT, 5800);
+    i2c_value = max34451_i2c_get16(i2cdev, PMBUS_VOUT_UV_WARN_LIMIT);
+    g_assert_cmpuint(i2c_value, ==, 5800);
+
+    max34451_i2c_set16(i2cdev, PMBUS_POWER_GOOD_ON, 5900);
+    i2c_value = max34451_i2c_get16(i2cdev, PMBUS_POWER_GOOD_ON);
+    g_assert_cmpuint(i2c_value, ==, 5900);
+
+    max34451_i2c_set16(i2cdev, PMBUS_POWER_GOOD_OFF, 6100);
+    i2c_value = max34451_i2c_get16(i2cdev, PMBUS_POWER_GOOD_OFF);
+    g_assert_cmpuint(i2c_value, ==, 6100);
+}
+
+/* Test that Read only registers can't be written */
+static void test_ro_regs(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t i2c_value, i2c_init_value;
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    i2c_set8(i2cdev, PMBUS_PAGE, 1); /* move to page 1 */
+    i2c_init_value = i2c_get8(i2cdev, PMBUS_CAPABILITY);
+    i2c_set8(i2cdev, PMBUS_CAPABILITY, 0xF9);
+    i2c_value = i2c_get8(i2cdev, PMBUS_CAPABILITY);
+    g_assert_cmpuint(i2c_init_value, ==, i2c_value);
+
+    i2c_init_value = max34451_i2c_get16(i2cdev, PMBUS_READ_VOUT);
+    max34451_i2c_set16(i2cdev, PMBUS_READ_VOUT, 0xDEAD);
+    i2c_value = max34451_i2c_get16(i2cdev, PMBUS_READ_VOUT);
+    g_assert_cmpuint(i2c_init_value, ==, i2c_value);
+    g_assert_cmphex(i2c_value, !=, 0xDEAD);
+
+    i2c_set8(i2cdev, PMBUS_PAGE, 16); /* move to page 16 */
+    i2c_init_value = max34451_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_1);
+    max34451_i2c_set16(i2cdev, PMBUS_READ_TEMPERATURE_1, 0xABBA);
+    i2c_value = max34451_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_1);
+    g_assert_cmpuint(i2c_init_value, ==, i2c_value);
+    g_assert_cmphex(i2c_value, !=, 0xABBA);
+}
+
+/* test over voltage faults */
+static void test_ov_faults(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t i2c_value;
+    uint8_t i2c_byte;
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    char *path;
+    /* Test ov fault reporting */
+    for (int i = 0; i < MAX34451_NUM_PWR_DEVICES; i++) {
+        path = g_strdup_printf("vout[%d]", i);
+        i2c_set8(i2cdev, PMBUS_PAGE, i);
+        max34451_i2c_set16(i2cdev, PMBUS_VOUT_OV_FAULT_LIMIT, 5000);
+        qmp_max34451_set(TEST_ID, path, 5100);
+        g_free(path);
+
+        i2c_value = max34451_i2c_get16(i2cdev, PMBUS_STATUS_WORD);
+        i2c_byte = i2c_get8(i2cdev, PMBUS_STATUS_VOUT);
+        g_assert_true((i2c_value & PB_STATUS_VOUT) != 0);
+        g_assert_true((i2c_byte & PB_STATUS_VOUT_OV_FAULT) != 0);
+    }
+}
+
+/* test over temperature faults */
+static void test_ot_faults(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t i2c_value;
+    uint8_t i2c_byte;
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    char *path;
+
+    for (int i = 0; i < MAX34451_NUM_TEMP_DEVICES; i++) {
+        path = g_strdup_printf("temperature[%d]", i);
+        i2c_set8(i2cdev, PMBUS_PAGE, i + 16);
+        max34451_i2c_set16(i2cdev, PMBUS_OT_FAULT_LIMIT, 6000);
+        qmp_max34451_set(TEST_ID, path, 6100);
+        g_free(path);
+
+        i2c_value = max34451_i2c_get16(i2cdev, PMBUS_STATUS_WORD);
+        i2c_byte = i2c_get8(i2cdev, PMBUS_STATUS_TEMPERATURE);
+        g_assert_true((i2c_value & PB_STATUS_TEMPERATURE) != 0);
+        g_assert_true((i2c_byte & PB_STATUS_OT_FAULT) != 0);
+    }
+}
+
+static void max34451_register_nodes(void)
+{
+    QOSGraphEdgeOptions opts = {
+        .extra_device_opts = "id=" TEST_ID ",address=0x4e"
+    };
+    add_qi2c_address(&opts, &(QI2CAddress) { TEST_ADDR });
+
+    qos_node_create_driver("max34451", i2c_device_create);
+    qos_node_consumes("max34451", "i2c-bus", &opts);
+
+    qos_add_test("test_defaults", "max34451", test_defaults, NULL);
+    qos_add_test("test_temperature", "max34451", test_temperature, NULL);
+    qos_add_test("test_voltage", "max34451", test_voltage, NULL);
+    qos_add_test("test_rw_regs", "max34451", test_rw_regs, NULL);
+    qos_add_test("test_ro_regs", "max34451", test_ro_regs, NULL);
+    qos_add_test("test_ov_faults", "max34451", test_ov_faults, NULL);
+    qos_add_test("test_ot_faults", "max34451", test_ot_faults, NULL);
+}
+libqos_init(max34451_register_nodes);
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 99040885fb..48eb646889 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -208,6 +208,7 @@ qos_test_ss.add(
   'eepro100-test.c',
   'es1370-test.c',
   'ipoctal232-test.c',
+  'max34451-test.c',
   'megasas-test.c',
   'ne2000-test.c',
   'tulip-test.c',
-- 
2.32.0.93.g670b81a890-goog


