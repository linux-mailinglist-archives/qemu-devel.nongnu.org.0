Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F9F48BBD6
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 01:28:01 +0100 (CET)
Received: from localhost ([::1]:42802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7RUe-00035E-Fw
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 19:28:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <38h_eYQYKCr8ynyzxwlttlqj.htrvjrz-ij0jqstslsz.twl@flex--titusr.bounces.google.com>)
 id 1n7RSN-0000t8-Lz
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:25:39 -0500
Received: from [2607:f8b0:4864:20::f4a] (port=33545
 helo=mail-qv1-xf4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <38h_eYQYKCr8ynyzxwlttlqj.htrvjrz-ij0jqstslsz.twl@flex--titusr.bounces.google.com>)
 id 1n7RS7-00045E-Pg
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:25:39 -0500
Received: by mail-qv1-xf4a.google.com with SMTP id
 jt5-20020a05621427e500b0041425477b6dso1067097qvb.0
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 16:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=HtCLuKReMRxlqOk+k0rDXapjbyKQYgd6xzb8Az4f714=;
 b=GXheUfoI909SB6VMc2ZTqCf7edEqpbYu+/pNUOqSVEbSXBrCTzw8PEtwbEqXzwEF9Y
 v26SVzP4zOJWRKy4Fo/SszbVy2nEMjhoNYQH8a7v6npoHv/aXgRHZ5UscrwUCeWhczU5
 FnySb0Uaye1u4tefMgiRgtUjwbB728BESJSqwJOZwy2smFcyIhusBKfpo9/NZK1nFJNu
 2HxhjL1PRrpp/Xn3nnypsmwtb8UPHWlOAlNTmL5xNfaqv+hJZz+y1IkYnwQCCKxh6IOo
 rHK1zY1q/R5Xw04637QM9GkiMq8K/SZUxJeRr/I7ZSGkfHqMQoJnSushrnCjEeNp7Gi1
 NIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=HtCLuKReMRxlqOk+k0rDXapjbyKQYgd6xzb8Az4f714=;
 b=nXtaNp0/huM0V/+q4QzXWJGXPM06yXzJ0kH9GKIq/8dDWguyrcx5TKiq7Pp73CgHEy
 W3C74ZJvjBqNLJNLlWKjEgJFEr6eHAXLQjBOt+oZbWqys8+CTjI+qJDLrPsgmPYimdUW
 1UKDijWzDQlsFmElXTX3gjT9Y7jPkMP+KZq4mnqc2IkJkC5Ood2FvTG4uJE5IqgCLhwW
 5l8rj7UEsxM0oqFr/hqDaoxEuelOkqof6Du88bLwnXxPur/pWgFHe5DCF6MuDbdCEeDt
 wQH3PR08Pt41daEF4sGTQJUU4gvhWJ03sr8WZIPNX1pgqJnSfLDWM5VIzTPlnX9YQP9K
 4W1w==
X-Gm-Message-State: AOAM533hAatAUsNKYbkTb2WpLwocuQA1m8ivP4jg4PtDNnrfwP9vPX5p
 OYJtaiLQGWOPFbAqSzHeh4Ne1c+POOI=
X-Google-Smtp-Source: ABdhPJy3KcDXAUvDTFEVaPegzYKrgHx5MRIQAfQZiHjqGQ6VInEWLz8fayEnfKyejkbhCc+dbmAOV1dzh08=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:ac8:5cc1:: with SMTP id
 s1mr5978189qta.220.1641947122085; 
 Tue, 11 Jan 2022 16:25:22 -0800 (PST)
Date: Wed, 12 Jan 2022 00:25:14 +0000
In-Reply-To: <20220112002515.3991540-1-titusr@google.com>
Message-Id: <20220112002515.3991540-2-titusr@google.com>
Mime-Version: 1.0
References: <20220112002515.3991540-1-titusr@google.com>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
Subject: [PATCH 2/3] tests/qtest: add tests for MAX31790 fan controller
From: Titus Rwantare <titusr@google.com>
To: minyard@acm.org, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 venture@google.com, Titus Rwantare <titusr@google.com>,
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f4a;
 envelope-from=38h_eYQYKCr8ynyzxwlttlqj.htrvjrz-ij0jqstslsz.twl@flex--titusr.bounces.google.com;
 helo=mail-qv1-xf4a.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RDNS_NONE=0.793, SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 tests/qtest/max31790_fan_ctrl-test.c | 171 +++++++++++++++++++++++++++
 tests/qtest/meson.build              |   1 +
 2 files changed, 172 insertions(+)
 create mode 100644 tests/qtest/max31790_fan_ctrl-test.c

diff --git a/tests/qtest/max31790_fan_ctrl-test.c b/tests/qtest/max31790_fan_ctrl-test.c
new file mode 100644
index 0000000000..b0b703d018
--- /dev/null
+++ b/tests/qtest/max31790_fan_ctrl-test.c
@@ -0,0 +1,171 @@
+/*
+ * QTests for MAX31790 Fan controller
+ *
+ * Independently control 6 fans, up to 12 tachometer inputs,
+ * controlled through i2c
+ *
+ * Copyright 2021 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include <math.h>
+#include "hw/sensor/max31790_fan_ctrl.h"
+#include "libqtest-single.h"
+#include "libqos/qgraph.h"
+#include "libqos/i2c.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qnum.h"
+#include "qemu/bitops.h"
+
+#define TEST_ID         "max31790-test"
+#define TEST_ADDR       (0x37)
+#define TEST_MAX_RPM    0x4000
+
+static uint16_t qmp_max31790_get(const char *id, const char *property)
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
+static void qmp_max31790_set(const char *id,
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
+static uint32_t max31790_tach_count2rpm(uint16_t tach, uint8_t sr)
+{
+    if (tach) {
+        return (sr * MAX31790_CLK_FREQ * 60) / (MAX31790_PULSES_PER_REV * tach);
+    } else {
+        return 0;
+    }
+}
+
+/* R/W Tach - 6 fans */
+static void test_defaults(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    uint8_t i2c_value;
+
+    i2c_value = i2c_get8(i2cdev, MAX31790_REG_GLOBAL_CONFIG);
+    g_assert_cmphex(i2c_value, ==, MAX31790_GLOBAL_CONFIG_DEFAULT);
+
+    i2c_value = i2c_get8(i2cdev, MAX31790_REG_PWM_FREQ);
+    g_assert_cmphex(i2c_value, ==, MAX31790_PWM_FREQ_DEFAULT);
+
+    for (int i = 0; i < MAX31790_NUM_FANS; i++) {
+        i2c_value = i2c_get8(i2cdev, MAX31790_REG_FAN_DYNAMICS(i));
+        g_assert_cmphex(i2c_value, ==, MAX31790_FAN_DYNAMICS_DEFAULT);
+    }
+
+    i2c_value = i2c_get8(i2cdev, MAX31790_REG_FAILED_FAN_OPTS_SEQ_STRT);
+    g_assert_cmphex(i2c_value, ==, MAX31790_FAILED_FAN_OPTS_SEQ_STRT_DEFAULT);
+}
+
+static void test_pwm(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    char *path;
+    int err;
+    uint16_t i2c_value, value, rpm;
+
+
+    /* init fans to different pwm duty cycles */
+    for (int i = 0; i < MAX31790_NUM_FANS; i++) {
+        path = g_strdup_printf("max_rpm[%d]", i);
+        qmp_max31790_set(TEST_ID, path, TEST_MAX_RPM); /* ~16k RPM */
+        g_free(path);
+        i2c_set8(i2cdev, MAX31790_REG_FAN_CONFIG(i), 0); /* enable PWM mode */
+        path = g_strdup_printf("pwm[%d]", i);
+        qmp_max31790_set(TEST_ID, path, i * 0x40);
+        g_free(path);
+    }
+
+    /* read and compare qmp with i2c 9-bit pwm */
+    for (int i = 0; i < MAX31790_NUM_FANS; i++) {
+        path = g_strdup_printf("pwm[%d]", i);
+        value = qmp_max31790_get(TEST_ID, path);
+        g_free(path);
+        i2c_value = i2c_get8(i2cdev, MAX31790_REG_PWMOUT_MSB(i)) << 8;
+        i2c_value |= i2c_get8(i2cdev, MAX31790_REG_PWMOUT_LSB(i));
+        i2c_value >>= MAX31790_PWM_SHAMT;
+        g_assert_cmphex(value, ==, i2c_value);
+    }
+
+    /* expect tach to match pwm scaled to max_rpm */
+    for (int i = 0; i < MAX31790_NUM_FANS; i++) {
+        i2c_value = i2c_get8(i2cdev, MAX31790_REG_TACH_COUNT_MSB(i)) << 8;
+        i2c_value |= i2c_get8(i2cdev, MAX31790_REG_TACH_COUNT_LSB(i));
+        i2c_value >>= 5;
+        value = max31790_tach_count2rpm(i2c_value, MAX31790_SR_DEFAULT);
+        rpm = (TEST_MAX_RPM * i * 0x40) / 0x1FF; /* max_rpm x pwm_duty_cycle */
+        err = value - rpm;
+        g_assert_cmpuint(abs(err), <, 163); /* ~1% of max_rpm */
+    }
+}
+
+static void test_rpm(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    char *path;
+    int err;
+    uint16_t i2c_value, value, rpm;
+
+    /* init fans to different speeds */
+    for (int i = 0; i < MAX31790_NUM_FANS; i++) {
+        i2c_set8(i2cdev, MAX31790_REG_FAN_CONFIG(i),
+                 MAX31790_FAN_CFG_RPM_MODE);
+        path = g_strdup_printf("target_rpm[%d]", i);
+        qmp_max31790_set(TEST_ID, path, i * 1000);
+        g_free(path);
+    }
+
+    /* read and compare qmp with i2c 11-bit tach */
+    for (int i = 0; i < MAX31790_NUM_FANS; i++) {
+        path = g_strdup_printf("target_rpm[%d]", i);
+        value = qmp_max31790_get(TEST_ID, path);
+        g_free(path);
+
+        i2c_value = i2c_get8(i2cdev, MAX31790_REG_TACH_COUNT_MSB(i)) << 8;
+        i2c_value |= i2c_get8(i2cdev, MAX31790_REG_TACH_COUNT_LSB(i));
+        i2c_value >>= MAX31790_TACH_SHAMT;
+
+        rpm = max31790_tach_count2rpm(i2c_value, MAX31790_SR_DEFAULT);
+        err = value - rpm;
+        g_assert_cmpint(abs(err), <, 20); /* 20 RPM */
+        err = (i * 1000) - rpm;
+        g_assert_cmpint(abs(err), <, 20);
+    }
+}
+
+static void max31790_register_nodes(void)
+{
+    QOSGraphEdgeOptions opts = {
+        .extra_device_opts = "id=" TEST_ID ",address=0x37"
+    };
+    add_qi2c_address(&opts, &(QI2CAddress) { TEST_ADDR });
+
+    qos_node_create_driver("max31790", i2c_device_create);
+    qos_node_consumes("max31790", "i2c-bus", &opts);
+
+    qos_add_test("test_defaults", "max31790", test_defaults, NULL);
+    qos_add_test("test_pwm", "max31790", test_pwm, NULL);
+    qos_add_test("test_rpm", "max31790", test_rpm, NULL);
+}
+libqos_init(max31790_register_nodes);
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 37e1eaa449..45694a26ba 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -243,6 +243,7 @@ qos_test_ss.add(
   'es1370-test.c',
   'ipoctal232-test.c',
   'max34451-test.c',
+  'max31790_fan_ctrl-test.c',
   'megasas-test.c',
   'ne2000-test.c',
   'tulip-test.c',
-- 
2.34.1.575.g55b058a8bb-goog


