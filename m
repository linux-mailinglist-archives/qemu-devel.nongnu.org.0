Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE604D1FE4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 19:17:08 +0100 (CET)
Received: from localhost ([::1]:49540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nReOQ-0004Vd-Oh
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 13:17:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nReLy-0001a7-SP
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:14:34 -0500
Received: from [2607:f8b0:4864:20::1031] (port=35717
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nReLx-00024d-7B
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:14:34 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 mg21-20020a17090b371500b001bef9e4657cso2981617pjb.0
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 10:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SvkUqH8EHQkjY6PExpghWqCVTlxNIOFrSCaG9W/TPic=;
 b=mFtn5lZfg1a3Ez4ntd1ZdvchH2Zw75EbO5mUL7HtsJfigznMtvLeFlLoTZ9LveV99X
 b5DAZ51+uql97lyQYp4AgaRlRYK0KlcpJHD3HGE3kEQ56SOyhJ/62X3rKnooJ1Nd1sdw
 tEMVjHLozyCFoEAs0c9UZx1qOw653utdynr1yF4yzs8AlU42RD3GSn0Z6GzBGr6d/LpF
 oWJ4o9RgNbV2WkL3MEdjbKBbJchZ5P5Nm6nYUzEeg2xA8nrdB+v7hVCqenoAcI7DYbM7
 +aoKTui6oUExYrKahpWC3eMoZwdNr9ZHTsOppF5ZHnl96Wd134nO1GHjppUzEVAf+bPA
 Ngfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SvkUqH8EHQkjY6PExpghWqCVTlxNIOFrSCaG9W/TPic=;
 b=gwOySkAR0wNkJFv4I08RK8TwYH6Gf/K8WFlznAiDlPJOxbYlZyLe8SPwrvSg5M+nDM
 fdzK8xy7G7+N3OEos6K8BdwKbmP/LQ0r64IEJvCmtQ3c2T99dgPolg/yh8oSzV3lvFa1
 973XjKbDY/uRq53bAgEaEXc2v6MAE19d0x6gksu6+AP8GmqH6nppBPPLtYxR50iF0DCO
 FhWIBx+ftFf8Bzmh7/E6crhSvjst9raajG8S0Sw1evSrH/U9fr1GwrJPZrJH7OGqKVGJ
 2TgwR1ERdGyVhJNvJfzZ1LlYGcZnz2/aS76awNQ9MwtBE07qcwEt30NyLf8xHeZYUG+H
 Ijqw==
X-Gm-Message-State: AOAM532cbiDhe2iOZ6+2TqmVakQS8vVEtw1dGh7dbQkF7D+MswCxp7VH
 M4NT4qlMQkcLo530N12vaqirqwSXQ5Q=
X-Google-Smtp-Source: ABdhPJzW+JQ+9LC4PcyxRPpf4iBB4rGDt09PhJjt4tFulyMC/6WrpatPapytL1CWfLLSq9atD88k2g==
X-Received: by 2002:a17:90a:fe14:b0:1bf:a3a0:d212 with SMTP id
 ck20-20020a17090afe1400b001bfa3a0d212mr916940pjb.207.1646763271842; 
 Tue, 08 Mar 2022 10:14:31 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 m79-20020a628c52000000b004f6f249d298sm9577729pfd.80.2022.03.08.10.14.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Mar 2022 10:14:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 8/9] hw/sensor: add Renesas raa229004 PMBus device
Date: Tue,  8 Mar 2022 19:13:19 +0100
Message-Id: <20220308181320.79400-9-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220308181320.79400-1-philippe.mathieu.daude@gmail.com>
References: <20220308181320.79400-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Corey Minyard <minyard@acm.org>, Corey Minyard <cminyard@mvista.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Titus Rwantare <titusr@google.com>

The Renesas RAA229004 is a PMBus Multiphase Voltage Regulator

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Message-Id: <20220307200605.4001451-9-titusr@google.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sensor/isl_pmbus_vr.c         | 18 ++++++++++++++++++
 include/hw/sensor/isl_pmbus_vr.h |  1 +
 tests/qtest/isl_pmbus_vr-test.c  |  8 ++++++++
 3 files changed, 27 insertions(+)

diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c
index f8cc75fc31..53187d619a 100644
--- a/hw/sensor/isl_pmbus_vr.c
+++ b/hw/sensor/isl_pmbus_vr.c
@@ -195,6 +195,15 @@ static void isl69260_class_init(ObjectClass *klass, void *data)
     isl_pmbus_vr_class_init(klass, data, 2);
 }
 
+static void raa229004_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->desc = "Renesas 229004 Digital Multiphase Voltage Regulator";
+    rc->phases.exit = isl_pmbus_vr_exit_reset;
+    isl_pmbus_vr_class_init(klass, data, 2);
+}
+
 static const TypeInfo isl69260_info = {
     .name = TYPE_ISL69260,
     .parent = TYPE_PMBUS_DEVICE,
@@ -203,9 +212,18 @@ static const TypeInfo isl69260_info = {
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
 static void isl_pmbus_vr_register_types(void)
 {
     type_register_static(&isl69260_info);
+    type_register_static(&raa229004_info);
 }
 
 type_init(isl_pmbus_vr_register_types)
diff --git a/include/hw/sensor/isl_pmbus_vr.h b/include/hw/sensor/isl_pmbus_vr.h
index 4e12e95efb..233916f70a 100644
--- a/include/hw/sensor/isl_pmbus_vr.h
+++ b/include/hw/sensor/isl_pmbus_vr.h
@@ -13,6 +13,7 @@
 #include "qom/object.h"
 
 #define TYPE_ISL69260   "isl69260"
+#define TYPE_RAA229004  "raa229004"
 
 struct ISLState {
     PMBusDevice parent;
diff --git a/tests/qtest/isl_pmbus_vr-test.c b/tests/qtest/isl_pmbus_vr-test.c
index f77732ae96..dc0ccae2aa 100644
--- a/tests/qtest/isl_pmbus_vr-test.c
+++ b/tests/qtest/isl_pmbus_vr-test.c
@@ -390,5 +390,13 @@ static void isl_pmbus_vr_register_nodes(void)
     qos_add_test("test_pages_rw", "isl69260", test_pages_rw, NULL);
     qos_add_test("test_ro_regs", "isl69260", test_ro_regs, NULL);
     qos_add_test("test_ov_faults", "isl69260", test_voltage_faults, NULL);
+
+    qos_node_create_driver("raa229004", i2c_device_create);
+    qos_node_consumes("raa229004", "i2c-bus", &opts);
+
+    qos_add_test("test_tx_rx", "raa229004", test_tx_rx, NULL);
+    qos_add_test("test_rw_regs", "raa229004", test_rw_regs, NULL);
+    qos_add_test("test_pages_rw", "raa229004", test_pages_rw, NULL);
+    qos_add_test("test_ov_faults", "raa229004", test_voltage_faults, NULL);
 }
 libqos_init(isl_pmbus_vr_register_nodes);
-- 
2.34.1


