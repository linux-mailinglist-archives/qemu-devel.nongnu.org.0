Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 061744C99F9
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 01:37:08 +0100 (CET)
Received: from localhost ([::1]:33320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPCzL-0005Wt-4j
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 19:37:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3CbkeYgYKCg47w7865u22uzs.q204s08-rs9sz121u18.25u@flex--titusr.bounces.google.com>)
 id 1nPCrK-0005Ie-HS
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 19:28:50 -0500
Received: from [2607:f8b0:4864:20::949] (port=40729
 helo=mail-ua1-x949.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3CbkeYgYKCg47w7865u22uzs.q204s08-rs9sz121u18.25u@flex--titusr.bounces.google.com>)
 id 1nPCrJ-0007Kl-2t
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 19:28:50 -0500
Received: by mail-ua1-x949.google.com with SMTP id
 z1-20020ab05641000000b00341f2a589deso152326uaa.7
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 16:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=y5gTl/dneFYFAvtKtWO9nY0S7K6+kknOpexTazdaxEs=;
 b=nx8FQfYcIlwYQCKoSNLt4hpEb4Atj3F/pijmn/6Z17dmA2rq113DzDAGqufZKh+jCp
 je02+us+xkW9DU3SeSEYLadFqpDrCIy87CBXKobyt4jeYjZr39Mri2g/CtONMHH/L6he
 fYI7Kbrkx/IYasIAKYY3ERukb9+WZnydK4GmrWq3v4yz74gtQqgmZ3LKeodZkrUydsh1
 ZDpXrTLOuto58mw32r9ruqofaEYPtktCRsil78J4xgBJA2kDXcLbUdmhkPWx8GiWJgI+
 TV8/OCg9aRbu8YYi0v1k9k6y+9gz36NvNyPsVKflkrRT0Gl3p6ONtAXvRgfWlBVcoj7R
 sp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=y5gTl/dneFYFAvtKtWO9nY0S7K6+kknOpexTazdaxEs=;
 b=YE0QVV1KWe0aLd77Gd40deFdiOrjjmTEtTWwdYxwayZFzIm1OVROmZ8VdAPeSbUvkq
 5HQTsFmBqj+iVhzwcUzbBYkMkA+bxGnZhTWIM/JLSlg446kco0i8j1tVaNPzX+JgIVAO
 4C1tvLx1LIjpccoFhDiYPj+SDUrp+PKGeA0no7H+9kYhFlbkFglrpHEwKz3ijyh5DC9k
 3aueZf4hCpqFj1fwMZGMdU/wWxq+5obW7ywyW1J9dMqpA2oDcWGrr86k68Px3n12v46C
 niGD+KLxuXQEoQWb4+cRPwHbwb9bIylgx8pfkuHgcCswOsROZTOkN/Ijoy4EP7QmTlgM
 /bTw==
X-Gm-Message-State: AOAM5336oN8PDhOcjD6pAId3ZmpuwpAmwzce1hSuB8ksnmyf696taKax
 PBVsZe1bVoBBVnom7jL5beOgamHFBNI=
X-Google-Smtp-Source: ABdhPJxLp5gPDZKtrsPyAEQBy2bqv+kOWuJYMN2bunKWanNPMqkmaRyGCtdt6Lpf3n1SibfVpsDfY8FjZEA=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3a0a:5449:c096:dc84])
 (user=titusr job=sendgmr) by 2002:a05:6902:102a:b0:614:105b:33a6 with SMTP id
 x10-20020a056902102a00b00614105b33a6mr26630778ybt.457.1646180617455; Tue, 01
 Mar 2022 16:23:37 -0800 (PST)
Date: Tue,  1 Mar 2022 16:23:05 -0800
In-Reply-To: <20220302002307.1895616-1-titusr@google.com>
Message-Id: <20220302002307.1895616-8-titusr@google.com>
Mime-Version: 1.0
References: <20220302002307.1895616-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v2 7/9] hw/sensor: add Renesas raa229004 PMBus device
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::949
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::949;
 envelope-from=3CbkeYgYKCg47w7865u22uzs.q204s08-rs9sz121u18.25u@flex--titusr.bounces.google.com;
 helo=mail-ua1-x949.google.com
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

The Renesas RAA229004 is a PMBus Multiphase Voltage Regulator

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/sensor/isl_pmbus.c         | 18 ++++++++++++++++++
 include/hw/sensor/isl_pmbus.h |  1 +
 tests/qtest/isl_pmbus-test.c  |  8 ++++++++
 3 files changed, 27 insertions(+)

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
index 59fa67f110..80d6c24ec7 100644
--- a/tests/qtest/isl_pmbus-test.c
+++ b/tests/qtest/isl_pmbus-test.c
@@ -383,11 +383,19 @@ static void isl_pmbus_register_nodes(void)
     qos_node_create_driver("isl69260", i2c_device_create);
     qos_node_consumes("isl69260", "i2c-bus", &opts);
 
+    qos_node_create_driver("raa229004", i2c_device_create);
+    qos_node_consumes("raa229004", "i2c-bus", &opts);
+
     qos_add_test("test_defaults", "isl69260", test_defaults, NULL);
     qos_add_test("test_tx_rx", "isl69260", test_tx_rx, NULL);
     qos_add_test("test_rw_regs", "isl69260", test_rw_regs, NULL);
     qos_add_test("test_pages_rw", "isl69260", test_pages_rw, NULL);
     qos_add_test("test_ro_regs", "isl69260", test_ro_regs, NULL);
     qos_add_test("test_ov_faults", "isl69260", test_voltage_faults, NULL);
+
+    qos_add_test("test_tx_rx", "raa229004", test_tx_rx, NULL);
+    qos_add_test("test_rw_regs", "raa229004", test_rw_regs, NULL);
+    qos_add_test("test_pages_rw", "raa229004", test_pages_rw, NULL);
+    qos_add_test("test_ov_faults", "raa229004", test_voltage_faults, NULL);
 }
 libqos_init(isl_pmbus_register_nodes);
-- 
2.35.1.616.g0bdcbb4464-goog


