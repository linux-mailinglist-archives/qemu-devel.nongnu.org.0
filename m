Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8530C374356
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 19:11:53 +0200 (CEST)
Received: from localhost ([::1]:58140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leL3w-0007AR-JY
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 13:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3X8-SYAYKClQF4FGED2AA270.yA8C08G-z0H079A929G.AD2@flex--titusr.bounces.google.com>)
 id 1leKtx-0006Go-RX
 for qemu-devel@nongnu.org; Wed, 05 May 2021 13:01:33 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:39914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3X8-SYAYKClQF4FGED2AA270.yA8C08G-z0H079A929G.AD2@flex--titusr.bounces.google.com>)
 id 1leKtm-0002SS-R2
 for qemu-devel@nongnu.org; Wed, 05 May 2021 13:01:33 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 184-20020a250cc10000b02904ee21d0e583so3022570ybm.6
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 10:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=ElzMOM6aW4E8geP0hoo/VTENe73pt1QRWVIDwiEIy0E=;
 b=U4aTznZ2CRS6Iw9G27BgYm2sC/9y/DJNxS6Adl449mSKjfiXRkOmlkGhb3B/Lck8KA
 Bmdc/Do8kQSeOs3Pl4O3liGanfUtsE5GkUd3yzdsFD7RcpXFz4FYjaunMc/Q4qVnmZVF
 tGxoyqiG/dVqBWftAee0nskELXOrWqsmer2EDRy8itCI2Ztpde/pMtCMbUsZGevATYUc
 DFvtf34mb4wJ6BEb3zro77e6m4WGOEHREHjFC0sTYBe7ohlCW57HjckNAjYFWZQiPDg5
 NG6UB10R4baq+QYqqr2gvZo6UeNFYDA9JVAqmc9Or0Mhz0G72ifk3HTR5y0vzW5NmSkE
 VGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ElzMOM6aW4E8geP0hoo/VTENe73pt1QRWVIDwiEIy0E=;
 b=YH/K5/xdchQ2ulJlJ8cwloRw2SsW4IqDZnHYzhQMB79e/Ex3WTrHTL6DM9NqOoTG3H
 AlyzK00ql3ZLKapwC3xi/nkFtvRwwyDVWL4P+m3hxT8WvevLf0JixCQyhC1VMrGoJgUg
 65KxeSVRIfqO/k897mhezaxBVNwhT9WnB8W190TOaec1uNCYi5UD6qNifj5KhmJlp3ba
 62NcJJ4GDM2vu54/DG054eyX8dWBkLcyqKD/0xVzP7pkCuHrIv5Hm+xBqFfmttqTe7xu
 ijoYXr5wZDmt8Q6RnOWICs/lM1cG1f8mpW+mFtLb1nOCzcjZMs7B2oJs0rJZTUyB5HLz
 g7Zw==
X-Gm-Message-State: AOAM531HbPY28aue86huTqVMNj93GLvQWgX8McQqdI0siJqQpwTuMYji
 9q++yo3Oo3/SDmR4zFcsYA0wanbhWKA=
X-Google-Smtp-Source: ABdhPJwa2dbmvuQucq78aDt6PX3Bxbzn/MZmJke9Iisi1nautBnMd4fvGfVvvOyd2WmJllGwgVQEJ6HSehM=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2c5:13:aa52:9f3f:7187:bafc])
 (user=titusr job=sendgmr) by 2002:a5b:b92:: with SMTP id
 l18mr44087895ybq.414.1620234079915; 
 Wed, 05 May 2021 10:01:19 -0700 (PDT)
Date: Wed,  5 May 2021 10:00:59 -0700
In-Reply-To: <20210505170101.3297395-1-titusr@google.com>
Message-Id: <20210505170101.3297395-4-titusr@google.com>
Mime-Version: 1.0
References: <20210505170101.3297395-1-titusr@google.com>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
Subject: [PATCH v2 3/5] tests/qtest: add tests for ADM1272 device model
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <cminyard@mvista.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3X8-SYAYKClQF4FGED2AA270.yA8C08G-z0H079A929G.AD2@flex--titusr.bounces.google.com;
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
---
 tests/qtest/adm1272-test.c | 445 +++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build    |   1 +
 2 files changed, 446 insertions(+)
 create mode 100644 tests/qtest/adm1272-test.c

diff --git a/tests/qtest/adm1272-test.c b/tests/qtest/adm1272-test.c
new file mode 100644
index 0000000000..63f8514801
--- /dev/null
+++ b/tests/qtest/adm1272-test.c
@@ -0,0 +1,445 @@
+/*
+ * QTests for the ADM1272 hotswap controller
+ *
+ * Copyright 2021 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include <math.h>
+#include "hw/i2c/pmbus_device.h"
+#include "libqtest-single.h"
+#include "libqos/qgraph.h"
+#include "libqos/i2c.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qnum.h"
+#include "qemu/bitops.h"
+
+#define TEST_ID "adm1272-test"
+#define TEST_ADDR (0x10)
+
+#define ADM1272_RESTART_TIME            0xCC
+#define ADM1272_MFR_PEAK_IOUT           0xD0
+#define ADM1272_MFR_PEAK_VIN            0xD1
+#define ADM1272_MFR_PEAK_VOUT           0xD2
+#define ADM1272_MFR_PMON_CONTROL        0xD3
+#define ADM1272_MFR_PMON_CONFIG         0xD4
+#define ADM1272_MFR_ALERT1_CONFIG       0xD5
+#define ADM1272_MFR_ALERT2_CONFIG       0xD6
+#define ADM1272_MFR_PEAK_TEMPERATURE    0xD7
+#define ADM1272_MFR_DEVICE_CONFIG       0xD8
+#define ADM1272_MFR_POWER_CYCLE         0xD9
+#define ADM1272_MFR_PEAK_PIN            0xDA
+#define ADM1272_MFR_READ_PIN_EXT        0xDB
+#define ADM1272_MFR_READ_EIN_EXT        0xDC
+
+#define ADM1272_HYSTERESIS_LOW          0xF2
+#define ADM1272_HYSTERESIS_HIGH         0xF3
+#define ADM1272_STATUS_HYSTERESIS       0xF4
+#define ADM1272_STATUS_GPIO             0xF5
+#define ADM1272_STRT_UP_IOUT_LIM        0xF6
+
+/* Defaults */
+#define ADM1272_OPERATION_DEFAULT       0x80
+#define ADM1272_CAPABILITY_DEFAULT      0xB0
+#define ADM1272_CAPABILITY_NO_PEC       0x30
+#define ADM1272_DIRECT_MODE             0x40
+#define ADM1272_HIGH_LIMIT_DEFAULT      0x0FFF
+#define ADM1272_PIN_OP_DEFAULT          0x7FFF
+#define ADM1272_PMBUS_REVISION_DEFAULT  0x22
+#define ADM1272_MFR_ID_DEFAULT          "ADI"
+#define ADM1272_MODEL_DEFAULT           "ADM1272-A1"
+#define ADM1272_MFR_DEFAULT_REVISION    "25"
+#define ADM1272_DEFAULT_DATE            "160301"
+#define ADM1272_RESTART_TIME_DEFAULT    0x64
+#define ADM1272_PMON_CONTROL_DEFAULT    0x1
+#define ADM1272_PMON_CONFIG_DEFAULT     0x3F35
+#define ADM1272_DEVICE_CONFIG_DEFAULT   0x8
+#define ADM1272_HYSTERESIS_HIGH_DEFAULT     0xFFFF
+#define ADM1272_STRT_UP_IOUT_LIM_DEFAULT    0x000F
+#define ADM1272_VOLT_DEFAULT            12000
+#define ADM1272_IOUT_DEFAULT            25000
+#define ADM1272_PWR_DEFAULT             300  /* 12V 25A */
+#define ADM1272_SHUNT                   300 /* micro-ohms */
+#define ADM1272_VOLTAGE_COEFF_DEFAULT   1
+#define ADM1272_CURRENT_COEFF_DEFAULT   3
+#define ADM1272_PWR_COEFF_DEFAULT       7
+#define ADM1272_IOUT_OFFSET             0x5000
+#define ADM1272_IOUT_OFFSET             0x5000
+
+static const PMBusCoefficients adm1272_coefficients[] = {
+    [0] = { 6770, 0, -2 },       /* voltage, vrange 60V */
+    [1] = { 4062, 0, -2 },       /* voltage, vrange 100V */
+    [2] = { 1326, 20480, -1 },   /* current, vsense range 15mV */
+    [3] = { 663, 20480, -1 },    /* current, vsense range 30mV */
+    [4] = { 3512, 0, -2 },       /* power, vrange 60V, irange 15mV */
+    [5] = { 21071, 0, -3 },      /* power, vrange 100V, irange 15mV */
+    [6] = { 17561, 0, -3 },      /* power, vrange 60V, irange 30mV */
+    [7] = { 10535, 0, -3 },      /* power, vrange 100V, irange 30mV */
+    [8] = { 42, 31871, -1 },     /* temperature */
+};
+
+uint16_t pmbus_data2direct_mode(PMBusCoefficients c, uint32_t value)
+{
+    /* R is usually negative to fit large readings into 16 bits */
+    uint16_t y = (c.m * value + c.b) * pow(10, c.R);
+    return y;
+}
+
+uint32_t pmbus_direct_mode2data(PMBusCoefficients c, uint16_t value)
+{
+    /* X = (Y * 10^-R - b) / m */
+    uint32_t x = (value / pow(10, c.R) - c.b) / c.m;
+    return x;
+}
+
+
+static uint16_t adm1272_millivolts_to_direct(uint32_t value)
+{
+    PMBusCoefficients c = adm1272_coefficients[ADM1272_VOLTAGE_COEFF_DEFAULT];
+    c.b = c.b * 1000;
+    c.R = c.R - 3;
+    return pmbus_data2direct_mode(c, value);
+}
+
+static uint32_t adm1272_direct_to_millivolts(uint16_t value)
+{
+    PMBusCoefficients c = adm1272_coefficients[ADM1272_VOLTAGE_COEFF_DEFAULT];
+    c.b = c.b * 1000;
+    c.R = c.R - 3;
+    return pmbus_direct_mode2data(c, value);
+}
+
+static uint16_t adm1272_milliamps_to_direct(uint32_t value)
+{
+    PMBusCoefficients c = adm1272_coefficients[ADM1272_CURRENT_COEFF_DEFAULT];
+    /* Y = (m * r_sense * x - b) * 10^R */
+    c.m = c.m * ADM1272_SHUNT / 1000; /* micro-ohms */
+    c.b = c.b * 1000;
+    c.R = c.R - 3;
+    return pmbus_data2direct_mode(c, value);
+}
+
+static uint32_t adm1272_direct_to_milliamps(uint16_t value)
+{
+    PMBusCoefficients c = adm1272_coefficients[ADM1272_CURRENT_COEFF_DEFAULT];
+    c.m = c.m * ADM1272_SHUNT / 1000;
+    c.b = c.b * 1000;
+    c.R = c.R - 3;
+    return pmbus_direct_mode2data(c, value);
+}
+
+static uint16_t adm1272_watts_to_direct(uint32_t value)
+{
+    PMBusCoefficients c = adm1272_coefficients[ADM1272_PWR_COEFF_DEFAULT];
+    c.m = c.m * ADM1272_SHUNT / 1000;
+    return pmbus_data2direct_mode(c, value);
+}
+
+static uint32_t adm1272_direct_to_watts(uint16_t value)
+{
+    PMBusCoefficients c = adm1272_coefficients[ADM1272_PWR_COEFF_DEFAULT];
+    c.m = c.m * ADM1272_SHUNT / 1000;
+    return pmbus_direct_mode2data(c, value);
+}
+
+static uint16_t qmp_adm1272_get(const char *id, const char *property)
+{
+    QDict *response;
+    uint64_t ret;
+
+    response = qmp("{ 'execute': 'qom-get', 'arguments': { 'path': %s, "
+                   "'property': %s } }", id, property);
+    g_assert(qdict_haskey(response, "return"));
+    ret = qnum_get_uint(qobject_to(QNum, qdict_get(response, "return")));
+    qobject_unref(response);
+    return ret;
+}
+
+static void qmp_adm1272_set(const char *id,
+                            const char *property,
+                            uint16_t value)
+{
+    QDict *response;
+
+    response = qmp("{ 'execute': 'qom-set', 'arguments': { 'path': %s, "
+                   "'property': %s, 'value': %u } }", id, property, value);
+    g_assert(qdict_haskey(response, "return"));
+    qobject_unref(response);
+}
+
+/* PMBus commands are little endian vs i2c_set16 in i2c.h which is big endian */
+static uint16_t adm1272_i2c_get16(QI2CDevice *i2cdev, uint8_t reg)
+{
+    uint8_t resp[2];
+    i2c_read_block(i2cdev, reg, resp, sizeof(resp));
+    return (resp[1] << 8) | resp[0];
+}
+
+/* PMBus commands are little endian vs i2c_set16 in i2c.h which is big endian */
+static void adm1272_i2c_set16(QI2CDevice *i2cdev, uint8_t reg, uint16_t value)
+{
+    uint8_t data[2];
+
+    data[0] = value & 255;
+    data[1] = value >> 8;
+    i2c_write_block(i2cdev, reg, data, sizeof(data));
+}
+
+static void test_defaults(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t value, i2c_value;
+    int16_t err;
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    value = qmp_adm1272_get(TEST_ID, "vout");
+    err = ADM1272_VOLT_DEFAULT - value;
+    g_assert_cmpuint(abs(err), <, ADM1272_VOLT_DEFAULT / 20);
+
+    i2c_value = i2c_get8(i2cdev, PMBUS_OPERATION);
+    g_assert_cmphex(i2c_value, ==, ADM1272_OPERATION_DEFAULT);
+
+    i2c_value = i2c_get8(i2cdev, PMBUS_VOUT_MODE);
+    g_assert_cmphex(i2c_value, ==, ADM1272_DIRECT_MODE);
+
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_VOUT_OV_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ADM1272_HIGH_LIMIT_DEFAULT);
+
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_VOUT_UV_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, 0);
+
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_IOUT_OC_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ADM1272_HIGH_LIMIT_DEFAULT);
+
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_OT_FAULT_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ADM1272_HIGH_LIMIT_DEFAULT);
+
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_OT_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ADM1272_HIGH_LIMIT_DEFAULT);
+
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_VIN_OV_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ADM1272_HIGH_LIMIT_DEFAULT);
+
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_VIN_UV_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, 0);
+
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_PIN_OP_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ADM1272_PIN_OP_DEFAULT);
+
+    i2c_value = i2c_get8(i2cdev, PMBUS_REVISION);
+    g_assert_cmphex(i2c_value, ==, ADM1272_PMBUS_REVISION_DEFAULT);
+
+    i2c_value = i2c_get8(i2cdev, ADM1272_MFR_PMON_CONTROL);
+    g_assert_cmphex(i2c_value, ==, ADM1272_PMON_CONTROL_DEFAULT);
+
+    i2c_value = adm1272_i2c_get16(i2cdev, ADM1272_MFR_PMON_CONFIG);
+    g_assert_cmphex(i2c_value, ==, ADM1272_PMON_CONFIG_DEFAULT);
+
+    i2c_value = adm1272_i2c_get16(i2cdev, ADM1272_MFR_DEVICE_CONFIG);
+    g_assert_cmphex(i2c_value, ==, ADM1272_DEVICE_CONFIG_DEFAULT);
+
+    i2c_value = adm1272_i2c_get16(i2cdev, ADM1272_HYSTERESIS_HIGH);
+    g_assert_cmphex(i2c_value, ==, ADM1272_HYSTERESIS_HIGH_DEFAULT);
+
+    i2c_value = adm1272_i2c_get16(i2cdev, ADM1272_STRT_UP_IOUT_LIM);
+    g_assert_cmphex(i2c_value, ==, ADM1272_STRT_UP_IOUT_LIM_DEFAULT);
+}
+
+/* test qmp access */
+static void test_tx_rx(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t i2c_value, value, i2c_voltage, i2c_pwr, lossy_value;
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    /* converting to direct mode is lossy - we generate the same loss here */
+    lossy_value =
+        adm1272_direct_to_millivolts(adm1272_millivolts_to_direct(1000));
+    qmp_adm1272_set(TEST_ID, "vin", 1000);
+    value = qmp_adm1272_get(TEST_ID, "vin");
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_VIN);
+    i2c_voltage = adm1272_direct_to_millivolts(i2c_value);
+    g_assert_cmpuint(value, ==, i2c_voltage);
+    g_assert_cmpuint(i2c_voltage, ==, lossy_value);
+
+    lossy_value =
+        adm1272_direct_to_millivolts(adm1272_millivolts_to_direct(1500));
+    qmp_adm1272_set(TEST_ID, "vout", 1500);
+    value = qmp_adm1272_get(TEST_ID, "vout");
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_VOUT);
+    i2c_voltage = adm1272_direct_to_millivolts(i2c_value);
+    g_assert_cmpuint(value, ==, i2c_voltage);
+    g_assert_cmpuint(i2c_voltage, ==, lossy_value);
+
+    lossy_value =
+        adm1272_direct_to_milliamps(adm1272_milliamps_to_direct(1600));
+    qmp_adm1272_set(TEST_ID, "iout", 1600);
+    value = qmp_adm1272_get(TEST_ID, "iout");
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_IOUT);
+    i2c_value = adm1272_direct_to_milliamps(i2c_value);
+    g_assert_cmphex(value, ==, i2c_value);
+    g_assert_cmphex(i2c_value, ==, lossy_value);
+
+    lossy_value =
+        adm1272_direct_to_watts(adm1272_watts_to_direct(320));
+    qmp_adm1272_set(TEST_ID, "pin", 320);
+    value = qmp_adm1272_get(TEST_ID, "pin");
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_PIN);
+    i2c_pwr = adm1272_direct_to_watts(i2c_value);
+    g_assert_cmphex(value, ==, i2c_pwr);
+    g_assert_cmphex(i2c_pwr, ==, lossy_value);
+}
+
+/* test r/w registers */
+static void test_rw_regs(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t i2c_value;
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    adm1272_i2c_set16(i2cdev, PMBUS_VOUT_OV_WARN_LIMIT, 0xABCD);
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_VOUT_OV_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, 0xABCD);
+
+    adm1272_i2c_set16(i2cdev, PMBUS_VOUT_UV_WARN_LIMIT, 0xCDEF);
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_VOUT_UV_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, 0xCDEF);
+
+    adm1272_i2c_set16(i2cdev, PMBUS_IOUT_OC_WARN_LIMIT, 0x1234);
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_IOUT_OC_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, 0x1234);
+
+    adm1272_i2c_set16(i2cdev, PMBUS_OT_FAULT_LIMIT, 0x5678);
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_OT_FAULT_LIMIT);
+    g_assert_cmphex(i2c_value, ==, 0x5678);
+
+    adm1272_i2c_set16(i2cdev, PMBUS_OT_WARN_LIMIT, 0xABDC);
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_OT_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, 0xABDC);
+
+    adm1272_i2c_set16(i2cdev, PMBUS_VIN_OV_WARN_LIMIT, 0xCDEF);
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_VIN_OV_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, 0xCDEF);
+
+    adm1272_i2c_set16(i2cdev, PMBUS_VIN_UV_WARN_LIMIT, 0x2345);
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_VIN_UV_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, 0x2345);
+
+    i2c_set8(i2cdev, ADM1272_RESTART_TIME, 0xF8);
+    i2c_value = i2c_get8(i2cdev, ADM1272_RESTART_TIME);
+    g_assert_cmphex(i2c_value, ==, 0xF8);
+
+    i2c_set8(i2cdev, ADM1272_MFR_PMON_CONTROL, 0);
+    i2c_value = i2c_get8(i2cdev, ADM1272_MFR_PMON_CONTROL);
+    g_assert_cmpuint(i2c_value, ==, 0);
+
+    adm1272_i2c_set16(i2cdev, ADM1272_MFR_PMON_CONFIG, 0xDEF0);
+    i2c_value = adm1272_i2c_get16(i2cdev, ADM1272_MFR_PMON_CONFIG);
+    g_assert_cmphex(i2c_value, ==, 0xDEF0);
+
+    adm1272_i2c_set16(i2cdev, ADM1272_MFR_ALERT1_CONFIG, 0x0123);
+    i2c_value = adm1272_i2c_get16(i2cdev, ADM1272_MFR_ALERT1_CONFIG);
+    g_assert_cmphex(i2c_value, ==, 0x0123);
+
+    adm1272_i2c_set16(i2cdev, ADM1272_MFR_ALERT2_CONFIG, 0x9876);
+    i2c_value = adm1272_i2c_get16(i2cdev, ADM1272_MFR_ALERT2_CONFIG);
+    g_assert_cmphex(i2c_value, ==, 0x9876);
+
+    adm1272_i2c_set16(i2cdev, ADM1272_MFR_DEVICE_CONFIG, 0x3456);
+    i2c_value = adm1272_i2c_get16(i2cdev, ADM1272_MFR_DEVICE_CONFIG);
+    g_assert_cmphex(i2c_value, ==, 0x3456);
+
+    adm1272_i2c_set16(i2cdev, ADM1272_HYSTERESIS_LOW, 0xCABA);
+    i2c_value = adm1272_i2c_get16(i2cdev, ADM1272_HYSTERESIS_LOW);
+    g_assert_cmphex(i2c_value, ==, 0xCABA);
+
+    adm1272_i2c_set16(i2cdev, ADM1272_HYSTERESIS_HIGH, 0x6789);
+    i2c_value = adm1272_i2c_get16(i2cdev, ADM1272_HYSTERESIS_HIGH);
+    g_assert_cmphex(i2c_value, ==, 0x6789);
+
+    adm1272_i2c_set16(i2cdev, ADM1272_STRT_UP_IOUT_LIM, 0x9876);
+    i2c_value = adm1272_i2c_get16(i2cdev, ADM1272_STRT_UP_IOUT_LIM);
+    g_assert_cmphex(i2c_value, ==, 0x9876);
+
+    adm1272_i2c_set16(i2cdev, PMBUS_OPERATION, 0xA);
+    i2c_value = i2c_get8(i2cdev, PMBUS_OPERATION);
+    g_assert_cmphex(i2c_value, ==, 0xA);
+}
+
+/* test read-only registers */
+static void test_ro_regs(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t i2c_init_value, i2c_value;
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    i2c_init_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_VIN);
+    adm1272_i2c_set16(i2cdev, PMBUS_READ_VIN, 0xBEEF);
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_VIN);
+    g_assert_cmphex(i2c_init_value, ==, i2c_value);
+
+    i2c_init_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_VOUT);
+    adm1272_i2c_set16(i2cdev, PMBUS_READ_VOUT, 0x1234);
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_VOUT);
+    g_assert_cmphex(i2c_init_value, ==, i2c_value);
+
+    i2c_init_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_IOUT);
+    adm1272_i2c_set16(i2cdev, PMBUS_READ_IOUT, 0x6547);
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_IOUT);
+    g_assert_cmphex(i2c_init_value, ==, i2c_value);
+
+    i2c_init_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_1);
+    adm1272_i2c_set16(i2cdev, PMBUS_READ_TEMPERATURE_1, 0x1597);
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_1);
+    g_assert_cmphex(i2c_init_value, ==, i2c_value);
+
+    i2c_init_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_PIN);
+    adm1272_i2c_set16(i2cdev, PMBUS_READ_PIN, 0xDEAD);
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_PIN);
+    g_assert_cmphex(i2c_init_value, ==, i2c_value);
+}
+
+/* test voltage fault handling */
+static void test_voltage_faults(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t i2c_value;
+    uint8_t i2c_byte;
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    adm1272_i2c_set16(i2cdev, PMBUS_VOUT_OV_WARN_LIMIT,
+                      adm1272_millivolts_to_direct(5000));
+    qmp_adm1272_set(TEST_ID, "vout", 5100);
+
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_STATUS_WORD);
+    i2c_byte = i2c_get8(i2cdev, PMBUS_STATUS_VOUT);
+    g_assert_true((i2c_value & PB_STATUS_VOUT) != 0);
+    g_assert_true((i2c_byte & PB_STATUS_VOUT_OV_WARN) != 0);
+
+    qmp_adm1272_set(TEST_ID, "vout", 4500);
+    i2c_set8(i2cdev, PMBUS_CLEAR_FAULTS, 0);
+    i2c_byte = i2c_get8(i2cdev, PMBUS_STATUS_VOUT);
+    g_assert_true((i2c_byte & PB_STATUS_VOUT_OV_WARN) == 0);
+
+    adm1272_i2c_set16(i2cdev, PMBUS_VOUT_UV_WARN_LIMIT,
+                      adm1272_millivolts_to_direct(4600));
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_STATUS_WORD);
+    i2c_byte = i2c_get8(i2cdev, PMBUS_STATUS_VOUT);
+    g_assert_true((i2c_value & PB_STATUS_VOUT) != 0);
+    g_assert_true((i2c_byte & PB_STATUS_VOUT_UV_WARN) != 0);
+
+}
+
+static void adm1272_register_nodes(void)
+{
+    QOSGraphEdgeOptions opts = {
+        .extra_device_opts = "id=" TEST_ID ",address=0x10"
+    };
+    add_qi2c_address(&opts, &(QI2CAddress) { TEST_ADDR });
+
+    qos_node_create_driver("adm1272", i2c_device_create);
+    qos_node_consumes("adm1272", "i2c-bus", &opts);
+
+    qos_add_test("test_defaults", "adm1272", test_defaults, NULL);
+    qos_add_test("test_tx_rx", "adm1272", test_tx_rx, NULL);
+    qos_add_test("test_rw_regs", "adm1272", test_rw_regs, NULL);
+    qos_add_test("test_ro_regs", "adm1272", test_ro_regs, NULL);
+    qos_add_test("test_ov_faults", "adm1272", test_voltage_faults, NULL);
+}
+libqos_init(adm1272_register_nodes);
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 0c76738921..30255dce0c 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -200,6 +200,7 @@ qtests_s390x = \
 qos_test_ss = ss.source_set()
 qos_test_ss.add(
   'ac97-test.c',
+  'adm1272-test.c',
   'ds1338-test.c',
   'e1000-test.c',
   'e1000e-test.c',
-- 
2.31.1.527.g47e6f16901-goog


