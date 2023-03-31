Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 263446D13E0
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 02:09:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi2KN-0007Kv-QG; Thu, 30 Mar 2023 20:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3iCQmZAYKCpEE3EFDC19916z.x97Bz7F-yzGz689818F.9C1@flex--titusr.bounces.google.com>)
 id 1pi2KA-0007EF-2A
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 20:08:58 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3iCQmZAYKCpEE3EFDC19916z.x97Bz7F-yzGz689818F.9C1@flex--titusr.bounces.google.com>)
 id 1pi2K6-0005lw-Bx
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 20:08:57 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-5417f156cb9so204774557b3.8
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 17:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680221320;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=NouqQ4NmgiCSaLa3pSeLTuKCidNI7EomSt2z9bvPEGU=;
 b=AMxYAwkHnczd45yj2xNoBEGr68L9/s1RuNTSp5HGZRU8kcJXLJn1130p86CM+d2uKu
 xNp+IsZybJuh1M5rqutT19+G77vX5g1Qlt08uihTf0lwag/PK4JwZ6M8fDZ80YX/m5QE
 ubruHKhv8Kq+9DKTRkRlnv8VgXvCNPKDHFalZ2PaD5MCP5GVJEAxne469JbRiFeFP5wW
 Fx481pNErv5JT4Pi5sXuhPzTcDk84odCkxVWenEAiHdxTIjeW7sjUExgwX447Szx8oaN
 YYI8Su8kCo8dM32hOBzDU7OojnYHOXs6LU7CbnHkXTd4ALIHTnmk7yN5sVYpqs+RrT6Y
 VZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680221320;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NouqQ4NmgiCSaLa3pSeLTuKCidNI7EomSt2z9bvPEGU=;
 b=IO9bE9s9D1xk7bhXsqVyBTQ861QMgeSHri4qI2rZw26oPSl8UwfX3bBY+syajmhJve
 piqLHo9U7M2adrk8AG/rBazJYXpAxfuTDON7eDEyniMuDlot4+qMVDII+K77aYqIXhgf
 KJ1tGuSRoA54wPe78dxukeE4e17bs4ofWSQHUykCEbdCFlf3+i2D+VwKT0/tvxDVlIOO
 eN4RTPiUys+BvKsFnce6bLvodkWV5Fee3SDAG2WKOteK99jzovnhMcgCQ+MiomQyMAAg
 89czgcapkgKW1/Q52FC4YBIQuLT4PhIxx19CNh1LU4OJ2axzhd99C2rN8Xj/zWHm0AJN
 CdVQ==
X-Gm-Message-State: AAQBX9cK1O0X5rQbAWxWB00pCBT4QWGU7AYcarnMkdNIQl5C+wqwQ4xp
 lCkGgrp9TWppNft1eWNAoftd8Tc2V1o=
X-Google-Smtp-Source: AKy350a7YTlq0qLGYX6aE0G+ztS37B++gdG9HZN1wPly8BD34JQNXQD+69hmx9zYtTGxjo76VrWtlGfB/E0=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a05:6902:1586:b0:b69:fab9:de39 with SMTP id
 k6-20020a056902158600b00b69fab9de39mr13681849ybu.2.1680221320642; Thu, 30 Mar
 2023 17:08:40 -0700 (PDT)
Date: Fri, 31 Mar 2023 00:07:56 +0000
In-Reply-To: <20230331000756.1712787-1-titusr@google.com>
Mime-Version: 1.0
References: <20230331000756.1712787-1-titusr@google.com>
X-Mailer: git-send-email 2.40.0.423.gd6c402a77b-goog
Message-ID: <20230331000756.1712787-8-titusr@google.com>
Subject: [PATCH 7/7] tests/qtest: add tests for ADM1266
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3iCQmZAYKCpEE3EFDC19916z.x97Bz7F-yzGz689818F.9C1@flex--titusr.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  The ADM1266 can have string fields written by the driver, so
  it's worth specifically testing.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 tests/qtest/adm1266-test.c | 123 +++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build    |   1 +
 2 files changed, 124 insertions(+)
 create mode 100644 tests/qtest/adm1266-test.c

diff --git a/tests/qtest/adm1266-test.c b/tests/qtest/adm1266-test.c
new file mode 100644
index 0000000000..6431a21de6
--- /dev/null
+++ b/tests/qtest/adm1266-test.c
@@ -0,0 +1,123 @@
+/*
+ * Analog Devices ADM1266 Cascadable Super Sequencer with Margin Control and
+ * Fault Recording with PMBus
+ *
+ * Copyright 2022 Google LLC
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
+#define TEST_ID "adm1266-test"
+#define TEST_ADDR (0x12)
+
+#define ADM1266_BLACKBOX_CONFIG                 0xD3
+#define ADM1266_PDIO_CONFIG                     0xD4
+#define ADM1266_READ_STATE                      0xD9
+#define ADM1266_READ_BLACKBOX                   0xDE
+#define ADM1266_SET_RTC                         0xDF
+#define ADM1266_GPIO_SYNC_CONFIGURATION         0xE1
+#define ADM1266_BLACKBOX_INFORMATION            0xE6
+#define ADM1266_PDIO_STATUS                     0xE9
+#define ADM1266_GPIO_STATUS                     0xEA
+
+/* Defaults */
+#define ADM1266_OPERATION_DEFAULT               0x80
+#define ADM1266_CAPABILITY_DEFAULT              0xA0
+#define ADM1266_CAPABILITY_NO_PEC               0x20
+#define ADM1266_PMBUS_REVISION_DEFAULT          0x22
+#define ADM1266_MFR_ID_DEFAULT                  "ADI"
+#define ADM1266_MFR_ID_DEFAULT_LEN              32
+#define ADM1266_MFR_MODEL_DEFAULT               "ADM1266-A1"
+#define ADM1266_MFR_MODEL_DEFAULT_LEN           32
+#define ADM1266_MFR_REVISION_DEFAULT            "25"
+#define ADM1266_MFR_REVISION_DEFAULT_LEN        8
+#define TEST_STRING_A                           "a sample"
+#define TEST_STRING_B                           "b sample"
+#define TEST_STRING_C                           "rev c"
+
+static void compare_string(QI2CDevice *i2cdev, uint8_t reg,
+                           const char *test_str)
+{
+    uint8_t len = i2c_get8(i2cdev, reg);
+    char i2c_str[SMBUS_DATA_MAX_LEN] = {0};
+
+    i2c_read_block(i2cdev, reg, (uint8_t *)i2c_str, len);
+    g_assert_cmpstr(i2c_str, ==, test_str);
+}
+
+static void write_and_compare_string(QI2CDevice *i2cdev, uint8_t reg,
+                                     const char *test_str, uint8_t len)
+{
+    char buf[SMBUS_DATA_MAX_LEN] = {0};
+    buf[0] = len;
+    strncpy(buf + 1, test_str, len);
+    i2c_write_block(i2cdev, reg, (uint8_t *)buf, len + 1);
+    compare_string(i2cdev, reg, test_str);
+}
+
+static void test_defaults(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t i2c_value;
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    i2c_value = i2c_get8(i2cdev, PMBUS_OPERATION);
+    g_assert_cmphex(i2c_value, ==, ADM1266_OPERATION_DEFAULT);
+
+    i2c_value = i2c_get8(i2cdev, PMBUS_REVISION);
+    g_assert_cmphex(i2c_value, ==, ADM1266_PMBUS_REVISION_DEFAULT);
+
+    compare_string(i2cdev, PMBUS_MFR_ID, ADM1266_MFR_ID_DEFAULT);
+    compare_string(i2cdev, PMBUS_MFR_MODEL, ADM1266_MFR_MODEL_DEFAULT);
+    compare_string(i2cdev, PMBUS_MFR_REVISION, ADM1266_MFR_REVISION_DEFAULT);
+}
+
+/* test r/w registers */
+static void test_rw_regs(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    /* empty strings */
+    i2c_set8(i2cdev, PMBUS_MFR_ID, 0);
+    compare_string(i2cdev, PMBUS_MFR_ID, "");
+
+    i2c_set8(i2cdev, PMBUS_MFR_MODEL, 0);
+    compare_string(i2cdev, PMBUS_MFR_MODEL, "");
+
+    i2c_set8(i2cdev, PMBUS_MFR_REVISION, 0);
+    compare_string(i2cdev, PMBUS_MFR_REVISION, "");
+
+    /* test strings */
+    write_and_compare_string(i2cdev, PMBUS_MFR_ID, TEST_STRING_A,
+                             sizeof(TEST_STRING_A));
+    write_and_compare_string(i2cdev, PMBUS_MFR_ID, TEST_STRING_B,
+                             sizeof(TEST_STRING_B));
+    write_and_compare_string(i2cdev, PMBUS_MFR_ID, TEST_STRING_C,
+                             sizeof(TEST_STRING_C));
+}
+
+static void adm1266_register_nodes(void)
+{
+    QOSGraphEdgeOptions opts = {
+        .extra_device_opts = "id=" TEST_ID ",address=0x12"
+    };
+    add_qi2c_address(&opts, &(QI2CAddress) { TEST_ADDR });
+
+    qos_node_create_driver("adm1266", i2c_device_create);
+    qos_node_consumes("adm1266", "i2c-bus", &opts);
+
+    qos_add_test("test_defaults", "adm1266", test_defaults, NULL);
+    qos_add_test("test_rw_regs", "adm1266", test_rw_regs, NULL);
+}
+
+libqos_init(adm1266_register_nodes);
+
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 85ea4e8d99..d3cf7b2287 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -232,6 +232,7 @@ qos_test_ss = ss.source_set()
 qos_test_ss.add(
   'ac97-test.c',
   'adm1272-test.c',
+  'adm1266-test.c',
   'ds1338-test.c',
   'e1000-test.c',
   'eepro100-test.c',
-- 
2.40.0.423.gd6c402a77b-goog


