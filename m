Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1704388048
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 21:05:12 +0200 (CEST)
Received: from localhost ([::1]:53474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj51j-0004l5-MF
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 15:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3VwukYAYKCgo3s3421qyyqvo.myw0ow4-no5ovxyxqx4.y1q@flex--titusr.bounces.google.com>)
 id 1lj4iy-0006w6-OS
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:45:48 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:53149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3VwukYAYKCgo3s3421qyyqvo.myw0ow4-no5ovxyxqx4.y1q@flex--titusr.bounces.google.com>)
 id 1lj4iv-0003wn-8X
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:45:48 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 c9-20020a2580c90000b02904f86395a96dso14627843ybm.19
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=NQ+oPEchcukwKqlHYSyVb8bgHl09wYV1UiuEeyBZqMI=;
 b=Qi/Hk85OV/9HjW0thunliszYE7F0dezzVDxCQs20bF0/+jXeJgKneHgevtxCFFzHvf
 /ap3MCYmPtmzJBH/uKST13YJLU9W1UiEdEFwZxcEJ+Dtpp8kLzsqzbf0tWLcBSYWOROW
 aKsdghGiP8hLnkw+HTpCzSBQ1VAuURJQC94eAZ75KYgp87wo0yKcQ4SMoa1fu7XzNoT5
 phANUwZu/QuVge+7pE5d1IhrDxUxkAV5xAoZSNc/X3Rfq3xI71Cg/9YO/LVqulgoEjTj
 hsUlBOUi7qIqiwEU8P6PZ8QbpL8siD2BUWWNzL2wPYh5f8ZlhYWtWGR5NAjTFYkm9Z4u
 Xhrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=NQ+oPEchcukwKqlHYSyVb8bgHl09wYV1UiuEeyBZqMI=;
 b=jZy5DGhw2m92ilska7Nq2O7RiZa7omTXTMoZgFJqm4bwRvfPF8eXtC1wIFq0nfhp/4
 SvTHj+sUnO0xeWuDOkl6VHLZbdEqYOHUS/Z12gHr/kXSpc7K7EFFjF/5Sq3cW0Kp+anN
 ePutjUn6vcOM1XBTlMWeJOqvyQOBRVgR5objFOOhaSootXhzgme1LLng0bgjsETvyjZ2
 IBJg2qZZHF8R7kofusCOMlZNDo0iFB4Kw8sBSRqrKBJooA0zJUgx0tkj1SWt6GahUXR1
 KHqHp2xycui6dGL9KotFadXS/Xid9bAL/iHZ74UAcQ92BjFNVcwFLopMQSE0Ib/tB5et
 aWTg==
X-Gm-Message-State: AOAM533dTxxGIvyRxGfJOhgd9HQUnP9UvY85Ipm4jQqWcg7BHhPqqc+5
 YK+6XYC1NWoSHLnfSYSIyqrn/9s9ZhY=
X-Google-Smtp-Source: ABdhPJy+OVfP9m5vXuJPkvvJEyMbiwtnGHZYQoJ7rWPK1HOg5OM/mKFPDvKsxhRbnUdNWDd7IN9KGQ1vvLQ=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2c5:13:4bf9:75f4:b656:df26])
 (user=titusr job=sendgmr) by 2002:a25:ec02:: with SMTP id
 j2mr10064587ybh.248.1621363543412; 
 Tue, 18 May 2021 11:45:43 -0700 (PDT)
Date: Tue, 18 May 2021 11:45:27 -0700
In-Reply-To: <20210518184527.1037888-1-titusr@google.com>
Message-Id: <20210518184527.1037888-6-titusr@google.com>
Mime-Version: 1.0
References: <20210518184527.1037888-1-titusr@google.com>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
Subject: [PATCH v3 5/5] tests/qtest: add tests for MAX34451 device model
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <cminyard@mvista.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 Titus Rwantare <titusr@google.com>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3VwukYAYKCgo3s3421qyyqvo.myw0ow4-no5ovxyxqx4.y1q@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
2.31.1.751.gd2f1c929bd-goog


