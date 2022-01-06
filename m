Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEC7486DAD
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 00:24:04 +0100 (CET)
Received: from localhost ([::1]:54282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5c71-0003wz-On
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 18:24:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3w3bXYQYKCiQTITUSRGOOGLE.COMQEMU-DEVELNONGNU.ORG@flex--titusr.bounces.google.com>)
 id 1n5c1O-0004d7-8o
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 18:18:14 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=37819
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3w3bXYQYKCiQTITUSRGOOGLE.COMQEMU-DEVELNONGNU.ORG@flex--titusr.bounces.google.com>)
 id 1n5c1M-0006La-7u
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 18:18:13 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 b144-20020a253496000000b0060bddc72114so8111107yba.4
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 15:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=6LLiL4AuMjgwJDw/hLv0NPZST2B5iF1mx74lkuGwVXU=;
 b=kT86I2A7X33698nvhWqXd10azQVYBJoLMMVvbxgM0BxL49+NvqdjoInbNcVknzcTLE
 aVbM0eeX9IwMHydD9xILzF73LG+I5ieBd1ZgzPnrfN8AVp9NLSxKqck6qPyCSP35STae
 tsXfbojoEvrMxEBhMsosxdcmB6atvfRuasmYeMOqMZ1sPpuQqc8EubD7gjuYRrMYR2S9
 ZKsS83O8HCFLV/cdKsfXsqdqQNKq4WGpRhTyaSlsEzFGndHYHkcqvrRkxOaQJmsVZBP1
 bZorWcEN9uKmHpajtkbscUEqWBsGjaSvvGbZBnxTiy9xQJwsydxxnn9Pm8M90lzwMQjF
 KIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=6LLiL4AuMjgwJDw/hLv0NPZST2B5iF1mx74lkuGwVXU=;
 b=IKO3ZKBpXjWvZ4n6hjOPIT3siDNAJaynq5Heyu9PIt7sbXeyQLmxCI9zNV3Ue6XoXB
 tp/fG1YfB4Bm8699OqgyBgPZ0mDIprybF6HMKBs4uOcnS5LeiggcEEjkjC2IPxEcUDIn
 nGCCc/FKwOhe+ovDZf/sPWWioB/4SqXLhX3aY3KbUGCeFf5FUVtRr+hZNUB8zumk9uRD
 XE8J60UDru3FaOdot0tqYBOujzRFLWzjdmobppU1bNAFIRBMxUmwoFsZL/uyf3YiroZJ
 BKdZCX3hTq+5UtYXXSuwk6oG4kEwCQDOEl8sNtJWOtMr0MkWnQ+6sVMS56KSuF23Wnfs
 FlvA==
X-Gm-Message-State: AOAM530WWmdQ6iNqTSxQ+NfP0zXNVNTe9w8O5ucT2Y7EXja1wL2t3cpb
 Cqhx002KF1ACrrN73PE8MZ+v4F0O8W0=
X-Google-Smtp-Source: ABdhPJwPEl/zGcFLZnHwXXTxGdwPYEhsh0DKnPduM7oMObG8mUIsvEcyvpMiy4E4QHv2iSBXppHo1hgGbFI=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a25:8a:: with SMTP id
 132mr62878693yba.738.1641510595760; 
 Thu, 06 Jan 2022 15:09:55 -0800 (PST)
Date: Thu,  6 Jan 2022 23:09:35 +0000
In-Reply-To: <20220106230936.417020-1-titusr@google.com>
Message-Id: <20220106230936.417020-5-titusr@google.com>
Mime-Version: 1.0
References: <20220106230936.417020-1-titusr@google.com>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH 4/5] hw/sensor: add Renesas raa229004 PMBus device
From: Titus Rwantare <titusr@google.com>
To: f4bug@amsat.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3w3bXYQYKCiQTITUSRGOOGLE.COMQEMU-DEVELNONGNU.ORG@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
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

The Renesas RAA229004 is a PMBus Multiphase Voltage Regulator

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/sensor/isl_pmbus.c         | 18 ++++++++++++++++++
 include/hw/sensor/isl_pmbus.h |  1 +
 tests/qtest/isl_pmbus-test.c  |  7 +++++++
 3 files changed, 26 insertions(+)

diff --git a/hw/sensor/isl_pmbus.c b/hw/sensor/isl_pmbus.c
index 8cc7220a57..4ff848f663 100644
--- a/hw/sensor/isl_pmbus.c
+++ b/hw/sensor/isl_pmbus.c
@@ -194,6 +194,15 @@ static void isl69260_class_init(ObjectClass *klass, void *data)
     isl_pmbus_class_init(klass, data, 2);
 }
 
+static void raa229004_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->desc = "Renesas 229004 Digital Multiphase Voltage Regulator";
+    rc->phases.exit = isl_pmbus_exit_reset;
+    isl_pmbus_class_init(klass, data, 2);
+}
+
 static const TypeInfo isl69260_info = {
     .name = TYPE_ISL69260,
     .parent = TYPE_PMBUS_DEVICE,
@@ -202,9 +211,18 @@ static const TypeInfo isl69260_info = {
     .class_init = isl69260_class_init,
 };
 
+static const TypeInfo raa229004_info = {
+    .name = TYPE_RAA229004,
+    .parent = TYPE_PMBUS_DEVICE,
+    .instance_size = sizeof(ISLState),
+    .instance_init = raa22xx_init,
+    .class_init = raa229004_class_init,
+};
+
 static void isl_pmbus_register_types(void)
 {
     type_register_static(&isl69260_info);
+    type_register_static(&raa229004_info);
 }
 
 type_init(isl_pmbus_register_types)
diff --git a/include/hw/sensor/isl_pmbus.h b/include/hw/sensor/isl_pmbus.h
index 8115aaa698..a947fd3903 100644
--- a/include/hw/sensor/isl_pmbus.h
+++ b/include/hw/sensor/isl_pmbus.h
@@ -13,6 +13,7 @@
 #include "qom/object.h"
 
 #define TYPE_ISL69260   "isl69260"
+#define TYPE_RAA229004  "raa229004"
 
 struct ISLState {
     PMBusDevice parent;
diff --git a/tests/qtest/isl_pmbus-test.c b/tests/qtest/isl_pmbus-test.c
index 3e956f912c..5bdc247428 100644
--- a/tests/qtest/isl_pmbus-test.c
+++ b/tests/qtest/isl_pmbus-test.c
@@ -372,10 +372,17 @@ static void isl_pmbus_register_nodes(void)
     qos_node_create_driver("isl69260", i2c_device_create);
     qos_node_consumes("isl69260", "i2c-bus", &opts);
 
+    qos_node_create_driver("raa229004", i2c_device_create);
+    qos_node_consumes("raa229004", "i2c-bus", &opts);
+
     qos_add_test("test_defaults", "isl69260", test_defaults, NULL);
     qos_add_test("test_tx_rx", "isl69260", test_tx_rx, NULL);
     qos_add_test("test_rw_regs", "isl69260", test_rw_regs, NULL);
     qos_add_test("test_ro_regs", "isl69260", test_ro_regs, NULL);
     qos_add_test("test_ov_faults", "isl69260", test_voltage_faults, NULL);
+
+    qos_add_test("test_tx_rx", "raa229004", test_tx_rx, NULL);
+    qos_add_test("test_rw_regs", "raa229004", test_rw_regs, NULL);
+    qos_add_test("test_ov_faults", "raa229004", test_voltage_faults, NULL);
 }
 libqos_init(isl_pmbus_register_nodes);
-- 
2.34.1.448.ga2b2bfdf31-goog


