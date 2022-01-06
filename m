Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 099C7486DA0
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 00:18:52 +0100 (CET)
Received: from localhost ([::1]:43200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5c1y-0004Hs-Jo
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 18:18:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3xHbXYQYKCiUUJUVTSHPPHMF.DPNRFNV-EFWFMOPOHOV.PSH@flex--titusr.bounces.google.com>)
 id 1n5bz4-0001dJ-ML
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 18:15:51 -0500
Received: from [2607:f8b0:4864:20::f49] (port=42605
 helo=mail-qv1-xf49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3xHbXYQYKCiUUJUVTSHPPHMF.DPNRFNV-EFWFMOPOHOV.PSH@flex--titusr.bounces.google.com>)
 id 1n5bz2-000620-Od
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 18:15:50 -0500
Received: by mail-qv1-xf49.google.com with SMTP id
 ge12-20020a05621427cc00b00410de1dc898so3453078qvb.9
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 15:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=nYWFZm+kcWsf7aAygcl1/A/lTC91XhdZMvgXx7BO+Yc=;
 b=mtB5ASu1153XMnbafuD8FGOMiS1F996/yI3Rl1kjkKKtyAymKYPwYDoF+Uj6ZjHnpM
 lgKqsHumFgjGmM9Jk3vAVvdIYA1r5QTN5R8w5iTcLXNl17q82aRRxuERlzaJOugRoFaM
 WmNasnsBg4OvxDa983xfevl4HKZ9i6+wBC+4hRJDRDMU6wpqT0Ij9IHbjx4He/DDT1UQ
 gzaYz1CsQEhMIQsVR9hYDtGZKKBnvRLVy05GU6L7B9iSzgo788wvryV5IvxH0QwiYPLp
 Z4PKnIx/LmUKKtNWzcVfQOIDjFok1oXQYHl4iCGEuC7eMConfUzGzg3MNBemK+qjyOQw
 8Wkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=nYWFZm+kcWsf7aAygcl1/A/lTC91XhdZMvgXx7BO+Yc=;
 b=Yf6X7m0SeBEHgLfUNdWhasZf6ItX/l2IZ2+zHl1lLr21kSkJeAgRKgN3HAiYwoS35M
 YOxWo0X3SAmIPXTrXWkHqcmX5vowu1J/GuP8y0srIfeG513cNWcuwaRq1oQju906lChw
 mBh4cncHseQKptBdA+wOo9fe5jsF98SKTQ4pmWF+jvoK/Flb4CgX3A8pC5QiS1SySDba
 akrDDdH06idxT/0GbO1kyGDROc14GPA70LDhUQ/OIvLNRfFFHiToJ/4hO2PV+mvdmDNu
 qJoq9IiDPCmWfaLxS6VlZbp/s8eAQqIBKTsRXKfp/5XheDgrkWpng5sVrgHCM+LZbOiY
 b52w==
X-Gm-Message-State: AOAM53283B++aK8dkPYFiUqMFDpLdev0omHjm9w5MJgV7GeD2iSuR8OQ
 6CP8iALGUiRzJAmOqo2C5yVHxmtqxTA=
X-Google-Smtp-Source: ABdhPJwR/vfjn6ONMQip4KoZjdihkyLwiwvzDFkCPUM9rfy/q2VLb+HvofVTQ5zn745pDxdUMZROKLFPdQo=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a05:622a:1713:: with SMTP id
 h19mr54424729qtk.464.1641510596557; Thu, 06 Jan 2022 15:09:56 -0800 (PST)
Date: Thu,  6 Jan 2022 23:09:36 +0000
In-Reply-To: <20220106230936.417020-1-titusr@google.com>
Message-Id: <20220106230936.417020-6-titusr@google.com>
Mime-Version: 1.0
References: <20220106230936.417020-1-titusr@google.com>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH 5/5] hw/misc: add Renesas raa228000 device
From: Titus Rwantare <titusr@google.com>
To: f4bug@amsat.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f49;
 envelope-from=3xHbXYQYKCiUUJUVTSHPPHMF.DPNRFNV-EFWFMOPOHOV.PSH@flex--titusr.bounces.google.com;
 helo=mail-qv1-xf49.google.com
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
index 5bdc247428..3b5fb2208d 100644
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
@@ -372,17 +436,25 @@ static void isl_pmbus_register_nodes(void)
     qos_node_create_driver("isl69260", i2c_device_create);
     qos_node_consumes("isl69260", "i2c-bus", &opts);
 
-    qos_node_create_driver("raa229004", i2c_device_create);
-    qos_node_consumes("raa229004", "i2c-bus", &opts);
-
     qos_add_test("test_defaults", "isl69260", test_defaults, NULL);
     qos_add_test("test_tx_rx", "isl69260", test_tx_rx, NULL);
     qos_add_test("test_rw_regs", "isl69260", test_rw_regs, NULL);
     qos_add_test("test_ro_regs", "isl69260", test_ro_regs, NULL);
     qos_add_test("test_ov_faults", "isl69260", test_voltage_faults, NULL);
 
+    qos_node_create_driver("raa229004", i2c_device_create);
+    qos_node_consumes("raa229004", "i2c-bus", &opts);
+
     qos_add_test("test_tx_rx", "raa229004", test_tx_rx, NULL);
     qos_add_test("test_rw_regs", "raa229004", test_rw_regs, NULL);
     qos_add_test("test_ov_faults", "raa229004", test_voltage_faults, NULL);
+
+    qos_node_create_driver("raa22800", i2c_device_create);
+    qos_node_consumes("raa22800", "i2c-bus", &opts);
+
+    qos_add_test("test_defaults", "raa22800", raa228000_test_defaults, NULL);
+    qos_add_test("test_tx_rx", "raa22800", test_tx_rx, NULL);
+    qos_add_test("test_rw_regs", "raa22800", test_rw_regs, NULL);
+    qos_add_test("test_ov_faults", "raa22800", test_voltage_faults, NULL);
 }
 libqos_init(isl_pmbus_register_nodes);
-- 
2.34.1.448.ga2b2bfdf31-goog


