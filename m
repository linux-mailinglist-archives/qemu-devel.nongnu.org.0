Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D17AF4C9AC7
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 02:54:28 +0100 (CET)
Received: from localhost ([::1]:43948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPECB-0002Vp-UJ
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 20:54:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3l80eYgYKCsQ3s3421qyyqvo.myw0ow4-no5ovxyxqx4.y1q@flex--titusr.bounces.google.com>)
 id 1nPE9E-000805-RB
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 20:51:25 -0500
Received: from [2607:f8b0:4864:20::b49] (port=34564
 helo=mail-yb1-xb49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3l80eYgYKCsQ3s3421qyyqvo.myw0ow4-no5ovxyxqx4.y1q@flex--titusr.bounces.google.com>)
 id 1nPE9A-00052F-NW
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 20:51:24 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 w6-20020a25c706000000b006287a0164f2so233710ybe.1
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 17:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=XYN59VvRX2AT2pHQ1lvOa3ZDRpcLJvwu4TLeEW0HOpM=;
 b=MV+po+e/sBetw1KkpnnzutywaPCPIZtFE/1tcNOBan4KGh/Q7ODhe62/a2tfvSl96w
 NS1I0UvJE4sx3FuIg3jr0oZG654mni+rU6ua3G07hl7Uc6XAtldIVuX6uJ5BbjnGjUF0
 /FOV0Xko5BbZ2DKuSY7ZKTlLsNOVyggU51pWgJGWBIW8nYjAJjhucTjz48VuU6SvpKHS
 dNIJm9UX+rkSlkSheu3d6RgMrA++Rb8VjPKKsM5T0usoyaj/aO+0eRfKljkjOqQGPYPI
 8pdoLuir+/a3pMV3gGcG+ivy1kXWmbT5Q2DBJ+Lt8tfXH8Kec2z9hu9s3LYShWWXKrj3
 fFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=XYN59VvRX2AT2pHQ1lvOa3ZDRpcLJvwu4TLeEW0HOpM=;
 b=UENxp5u78pqg/tSmWvDu2yorduhPOTIHBaqy9Z1ioP4CgH7VuZopaBuXr2+N1a6P5b
 UcmssKrcnGEzr4aJrCYAhxA2AWFOqpMdnZ7dZjqB077MkCFB7oPpR4NmseQMpRtOY4Qe
 JFs5jPI7JOPs4Tc0X7ngm0fy6bMpF7WsfStfeZWbV2Rx/jUqBaWjkoHog2cuyItRHQV8
 354rT4EboOv1fq9nwqy6vuvCvPISXXTExS8C5GRmMzejBfENTMjGKM4dQTuq+hpzFtmC
 OkLnKnFPVXMUHS5kxdDWWwYoNHjed5aNcIljXM4/2c5a/8yyEGxo7NI8xJsvzU1mhv8O
 cYqw==
X-Gm-Message-State: AOAM533R7IjmhAd0AWrmJqckVht9CxLOYBk55gjQlbhlsijMpnbp8nOq
 E/Pc8+2HaNXbQXnJt/msiNajWxFBKE8=
X-Google-Smtp-Source: ABdhPJxwuXOiIF5S8l+OWtMOH1DG0O40Iutehef/9KZCW00ALu7xDjHmxwMc/ePdSOI9lVTFJeF35O2a6JQ=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3a0a:5449:c096:dc84])
 (user=titusr job=sendgmr) by 2002:a81:d85:0:b0:2d1:1b8d:f236 with SMTP id
 127-20020a810d85000000b002d11b8df236mr27961440ywn.212.1646185879400; Tue, 01
 Mar 2022 17:51:19 -0800 (PST)
Date: Tue,  1 Mar 2022 17:50:52 -0800
In-Reply-To: <20220302015053.1984165-1-titusr@google.com>
Message-Id: <20220302015053.1984165-9-titusr@google.com>
Mime-Version: 1.0
References: <20220302015053.1984165-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v3 8/9] hw/sensor: add Renesas raa229004 PMBus device
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, peter.maydell@linaro.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3l80eYgYKCsQ3s3421qyyqvo.myw0ow4-no5ovxyxqx4.y1q@flex--titusr.bounces.google.com;
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

The Renesas RAA229004 is a PMBus Multiphase Voltage Regulator

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/sensor/isl_pmbus_vr.c         | 18 ++++++++++++++++++
 include/hw/sensor/isl_pmbus_vr.h |  1 +
 tests/qtest/isl_pmbus_vr-test.c  |  8 ++++++++
 3 files changed, 27 insertions(+)

diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c
index b3d24e40ab..e260faeac3 100644
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
index f77732ae96..a33dfb6135 100644
--- a/tests/qtest/isl_pmbus_vr-test.c
+++ b/tests/qtest/isl_pmbus_vr-test.c
@@ -384,11 +384,19 @@ static void isl_pmbus_vr_register_nodes(void)
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
 libqos_init(isl_pmbus_vr_register_nodes);
-- 
2.35.1.616.g0bdcbb4464-goog


