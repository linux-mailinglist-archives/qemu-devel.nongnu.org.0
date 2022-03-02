Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E8C4C99E2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 01:33:20 +0100 (CET)
Received: from localhost ([::1]:56718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPCvf-0001ze-0g
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 19:33:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3C7keYgYKChA9y9A87w44w1u.s426u2A-tuBu1343w3A.47w@flex--titusr.bounces.google.com>)
 id 1nPCmO-0008R1-5C
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 19:23:45 -0500
Received: from [2607:f8b0:4864:20::b49] (port=45846
 helo=mail-yb1-xb49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3C7keYgYKChA9y9A87w44w1u.s426u2A-tuBu1343w3A.47w@flex--titusr.bounces.google.com>)
 id 1nPCmK-0003Hz-TG
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 19:23:43 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 n66-20020a254045000000b0062883b59ddbso7567yba.12
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 16:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=sxHwCFQ7GN3iQdwu0G1IfNe7Yi5+zoqZ7WtImg1yT/U=;
 b=g8odv4LEGBlbxjoumC6gP90rfFOR6RXtjWoQ8LbyrRdAXVzk3x0q4bjd2VjTm0UWBE
 6dKx5pPi0KLrKV4bljJnugi//VErsS9QVevNMfLOQjaBWYOBtX3wfAOcghp+El4IiuY1
 DzSv3cY7Vk65WiFEZYJX9xyTmu89QhHahm3OkD6zdxTu5OyAQCmM83qPr0YbPdrou7WM
 wCr6yMqg8qfUJGLU4lrY6XZeGauWNEU/t4liIJxpK9n+b6PeLUz/Q9LeK6mDvInXVBXn
 EmA21OPA5jKVQEuSUrzjDPIkLG2EQwNv5pf/j4YxguZyZaVIoF0/xNRUscvp3N4aVxGo
 2wxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=sxHwCFQ7GN3iQdwu0G1IfNe7Yi5+zoqZ7WtImg1yT/U=;
 b=iPydPpnZJC5RK9uv2rK2shyxxWK0DnnxiT8LIwZkHPRjA9kYNXTRNPD2dgWhW/+3oo
 1gGawU2P9oxVSmhZzy3zv0Nmf9g0HdyUWYADV6OaZ+TAyfXiRr/eC9iTVAueayEKJmEl
 4epzSSJVDvpK8AmA8hZ4usaiT4GBZGJkT0uzilfPsbtRhmHHtZ6H7FnuVswHhEqt9cMF
 VGY7/9fgOtOiSiYdLoyeEp4DGKeKS56L+PDIa5wu7IK9bf7w4BtFZe8NtvDgOuJSCDD9
 Gb/wmz6z6WB6GxxwuRI6GAkrznYhZ4qL/uT1QXeejNc8F4SnVx+GETxlXrc+KEMuqlBM
 FgYw==
X-Gm-Message-State: AOAM532Zler4wZAuI9Gn55I3sJmADzpTEcWFl5kIrFFOrVk1WE4x4DNq
 j+FtM06+vXl8fhByODaoEqe6ajUL+ck=
X-Google-Smtp-Source: ABdhPJylnP5IMlrCZB5RJ8BKFX+BQI6winkyIg8FATCZJrOP6tY5Lsx2G/GatT8auq1Mqg6ODOoNkk5nJK0=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3a0a:5449:c096:dc84])
 (user=titusr job=sendgmr) by 2002:a05:6902:2:b0:624:4cb5:fd3b with SMTP id
 l2-20020a056902000200b006244cb5fd3bmr27492489ybh.1.1646180619713; Tue, 01 Mar
 2022 16:23:39 -0800 (PST)
Date: Tue,  1 Mar 2022 16:23:06 -0800
In-Reply-To: <20220302002307.1895616-1-titusr@google.com>
Message-Id: <20220302002307.1895616-9-titusr@google.com>
Mime-Version: 1.0
References: <20220302002307.1895616-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v2 8/9] hw/sensor: add Renesas raa228000 device
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3C7keYgYKChA9y9A87w44w1u.s426u2A-tuBu1343w3A.47w@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
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
 hw/sensor/isl_pmbus.c         | 50 ++++++++++++++++++++++
 include/hw/sensor/isl_pmbus.h |  1 +
 tests/qtest/isl_pmbus-test.c  | 78 +++++++++++++++++++++++++++++++++--
 3 files changed, 126 insertions(+), 3 deletions(-)

diff --git a/hw/sensor/isl_pmbus.c b/hw/sensor/isl_pmbus.c
index 4ff848f663..e3b42b119e 100644
--- a/hw/sensor/isl_pmbus.c
+++ b/hw/sensor/isl_pmbus.c
@@ -89,6 +89,24 @@ static void isl_pmbus_exit_reset(Object *obj)
     }
 }
 
+/* The raa228000 uses different direct mode coefficents from most isl devices */
+static void raa228000_exit_reset(Object *obj)
+{
+    isl_pmbus_exit_reset(obj);
+
+    PMBusDevice *pmdev = PMBUS_DEVICE(obj);
+
+    pmdev->pages[0].read_vout = 0;
+    pmdev->pages[0].read_iout = 0;
+    pmdev->pages[0].read_pout = 0;
+    pmdev->pages[0].read_vin = 0;
+    pmdev->pages[0].read_iin = 0;
+    pmdev->pages[0].read_pin = 0;
+    pmdev->pages[0].read_temperature_1 = 0;
+    pmdev->pages[0].read_temperature_2 = 0;
+    pmdev->pages[0].read_temperature_3 = 0;
+}
+
 static void isl_pmbus_add_props(Object *obj, uint64_t *flags, uint8_t pages)
 {
     PMBusDevice *pmdev = PMBUS_DEVICE(obj);
@@ -177,6 +195,20 @@ static void raa22xx_init(Object *obj)
     isl_pmbus_add_props(obj, flags, 2);
 }
 
+static void raa228000_init(Object *obj)
+{
+    PMBusDevice *pmdev = PMBUS_DEVICE(obj);
+    uint64_t flags[1];
+
+    flags[0] = PB_HAS_VIN | PB_HAS_VOUT | PB_HAS_VOUT_MODE |
+               PB_HAS_VOUT_RATING | PB_HAS_VOUT_MARGIN | PB_HAS_IIN |
+               PB_HAS_IOUT | PB_HAS_PIN | PB_HAS_POUT | PB_HAS_TEMPERATURE |
+               PB_HAS_TEMP2 | PB_HAS_TEMP3 | PB_HAS_STATUS_MFR_SPECIFIC;
+
+    pmbus_page_config(pmdev, 0, flags[0]);
+    isl_pmbus_add_props(obj, flags, 1);
+}
+
 static void isl_pmbus_class_init(ObjectClass *klass, void *data, uint8_t pages)
 {
     PMBusDeviceClass *k = PMBUS_DEVICE_CLASS(klass);
@@ -194,6 +226,15 @@ static void isl69260_class_init(ObjectClass *klass, void *data)
     isl_pmbus_class_init(klass, data, 2);
 }
 
+static void raa228000_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->desc = "Renesas 228000 Digital Multiphase Voltage Regulator";
+    rc->phases.exit = raa228000_exit_reset;
+    isl_pmbus_class_init(klass, data, 1);
+}
+
 static void raa229004_class_init(ObjectClass *klass, void *data)
 {
     ResettableClass *rc = RESETTABLE_CLASS(klass);
@@ -219,9 +260,18 @@ static const TypeInfo raa229004_info = {
     .class_init = raa229004_class_init,
 };
 
+static const TypeInfo raa228000_info = {
+    .name = TYPE_RAA228000,
+    .parent = TYPE_PMBUS_DEVICE,
+    .instance_size = sizeof(ISLState),
+    .instance_init = raa228000_init,
+    .class_init = raa228000_class_init,
+};
+
 static void isl_pmbus_register_types(void)
 {
     type_register_static(&isl69260_info);
+    type_register_static(&raa228000_info);
     type_register_static(&raa229004_info);
 }
 
diff --git a/include/hw/sensor/isl_pmbus.h b/include/hw/sensor/isl_pmbus.h
index a947fd3903..7ead1dc4a2 100644
--- a/include/hw/sensor/isl_pmbus.h
+++ b/include/hw/sensor/isl_pmbus.h
@@ -13,6 +13,7 @@
 #include "qom/object.h"
 
 #define TYPE_ISL69260   "isl69260"
+#define TYPE_RAA228000  "raa228000"
 #define TYPE_RAA229004  "raa229004"
 
 struct ISLState {
diff --git a/tests/qtest/isl_pmbus-test.c b/tests/qtest/isl_pmbus-test.c
index 80d6c24ec7..ea62cd4e07 100644
--- a/tests/qtest/isl_pmbus-test.c
+++ b/tests/qtest/isl_pmbus-test.c
@@ -149,6 +149,70 @@ static void test_defaults(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(i2c_value, ==, ISL_REVISION_DEFAULT);
 }
 
+static void raa228000_test_defaults(void *obj, void *data,
+                                    QGuestAllocator *alloc)
+{
+    uint16_t value, i2c_value;
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    value = qmp_isl_pmbus_get(TEST_ID, "vout[0]");
+    g_assert_cmpuint(value, ==, 0);
+
+    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_IOUT);
+    g_assert_cmpuint(i2c_value, ==, 0);
+
+    value = qmp_isl_pmbus_get(TEST_ID, "pout[0]");
+    g_assert_cmpuint(value, ==, 0);
+
+    i2c_value = i2c_get8(i2cdev, PMBUS_CAPABILITY);
+    g_assert_cmphex(i2c_value, ==, ISL_CAPABILITY_DEFAULT);
+
+    i2c_value = i2c_get8(i2cdev, PMBUS_OPERATION);
+    g_assert_cmphex(i2c_value, ==, ISL_OPERATION_DEFAULT);
+
+    i2c_value = i2c_get8(i2cdev, PMBUS_ON_OFF_CONFIG);
+    g_assert_cmphex(i2c_value, ==, ISL_ON_OFF_CONFIG_DEFAULT);
+
+    i2c_value = i2c_get8(i2cdev, PMBUS_VOUT_MODE);
+    g_assert_cmphex(i2c_value, ==, ISL_VOUT_MODE_DEFAULT);
+
+    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_COMMAND);
+    g_assert_cmphex(i2c_value, ==, ISL_VOUT_COMMAND_DEFAULT);
+
+    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_MAX);
+    g_assert_cmphex(i2c_value, ==, ISL_VOUT_MAX_DEFAULT);
+
+    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_MARGIN_HIGH);
+    g_assert_cmphex(i2c_value, ==, ISL_VOUT_MARGIN_HIGH_DEFAULT);
+
+    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_MARGIN_LOW);
+    g_assert_cmphex(i2c_value, ==, ISL_VOUT_MARGIN_LOW_DEFAULT);
+
+    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_TRANSITION_RATE);
+    g_assert_cmphex(i2c_value, ==, ISL_VOUT_TRANSITION_RATE_DEFAULT);
+
+    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_OV_FAULT_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ISL_VOUT_OV_FAULT_LIMIT_DEFAULT);
+
+    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_OT_FAULT_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ISL_OT_FAULT_LIMIT_DEFAULT);
+
+    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_OT_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ISL_OT_WARN_LIMIT_DEFAULT);
+
+    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VIN_OV_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ISL_VIN_OV_WARN_LIMIT_DEFAULT);
+
+    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VIN_UV_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ISL_VIN_UV_WARN_LIMIT_DEFAULT);
+
+    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_IIN_OC_FAULT_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ISL_IIN_OC_FAULT_LIMIT_DEFAULT);
+
+    i2c_value = i2c_get8(i2cdev, PMBUS_REVISION);
+    g_assert_cmphex(i2c_value, ==, ISL_REVISION_DEFAULT);
+}
+
 /* test qmp access */
 static void test_tx_rx(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -383,9 +447,6 @@ static void isl_pmbus_register_nodes(void)
     qos_node_create_driver("isl69260", i2c_device_create);
     qos_node_consumes("isl69260", "i2c-bus", &opts);
 
-    qos_node_create_driver("raa229004", i2c_device_create);
-    qos_node_consumes("raa229004", "i2c-bus", &opts);
-
     qos_add_test("test_defaults", "isl69260", test_defaults, NULL);
     qos_add_test("test_tx_rx", "isl69260", test_tx_rx, NULL);
     qos_add_test("test_rw_regs", "isl69260", test_rw_regs, NULL);
@@ -393,9 +454,20 @@ static void isl_pmbus_register_nodes(void)
     qos_add_test("test_ro_regs", "isl69260", test_ro_regs, NULL);
     qos_add_test("test_ov_faults", "isl69260", test_voltage_faults, NULL);
 
+    qos_node_create_driver("raa229004", i2c_device_create);
+    qos_node_consumes("raa229004", "i2c-bus", &opts);
+
     qos_add_test("test_tx_rx", "raa229004", test_tx_rx, NULL);
     qos_add_test("test_rw_regs", "raa229004", test_rw_regs, NULL);
     qos_add_test("test_pages_rw", "raa229004", test_pages_rw, NULL);
     qos_add_test("test_ov_faults", "raa229004", test_voltage_faults, NULL);
+
+    qos_node_create_driver("raa228000", i2c_device_create);
+    qos_node_consumes("raa228000", "i2c-bus", &opts);
+
+    qos_add_test("test_defaults", "raa228000", raa228000_test_defaults, NULL);
+    qos_add_test("test_tx_rx", "raa228000", test_tx_rx, NULL);
+    qos_add_test("test_rw_regs", "raa228000", test_rw_regs, NULL);
+    qos_add_test("test_ov_faults", "raa228000", test_voltage_faults, NULL);
 }
 libqos_init(isl_pmbus_register_nodes);
-- 
2.35.1.616.g0bdcbb4464-goog


