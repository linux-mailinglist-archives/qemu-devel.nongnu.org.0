Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8BE699C9D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 19:47:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSjHI-0006Kj-MT; Thu, 16 Feb 2023 13:46:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkarthikeyan1509@gmail.com>)
 id 1pSjGx-0006F5-9c; Thu, 16 Feb 2023 13:46:23 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pkarthikeyan1509@gmail.com>)
 id 1pSjGv-00084i-ED; Thu, 16 Feb 2023 13:46:22 -0500
Received: by mail-pg1-x530.google.com with SMTP id e1so1853422pgg.9;
 Thu, 16 Feb 2023 10:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kDGCNgP/HqriguoJrv1lH0CH349ASjBLevBqGlZM65w=;
 b=iZQRaCb6TZVfsiwcpWqZ9ohScte29U9y/wH9CawUajX+/5CQwyvS722ArowVCeByEe
 AErQjE5/pPb5MfjjsRaa73orChm39tuooNfhD6NQiYdbxwySgCYl/Hg+66HUtyzjz6If
 bzWIwz/Qj10gugJQZQwTcHGlskNcfMCrRmS2uUG2c0a4Vu4eul1dd8VNRThZc+qGAyKz
 LfE6t6NYFonYUy5IPEI8EoLeLXLDLp7ccD5K2OXJCOdLkJ0vrwjWx1/hEsN7eJjYX/5b
 rYmiJ9w33g4rvX+cgtCAYZjU7Kmg7Jad9C9riMXgYqZuamm02cbfp8J9e7I+m+CZ+Aw9
 zbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kDGCNgP/HqriguoJrv1lH0CH349ASjBLevBqGlZM65w=;
 b=2H/ApToUwSzQE3JQ1nnd6df/rEiSPzOD2e7jUCpDTwjnDEVvj9u6qnnIzote8+o1zc
 2owvU6swBGE14t8pRXwsMeN/H3Rl6G0oJLcMGNeTh8WSyGUhYGOCVTlN/wYEMfoxMs7f
 B9smvvMNYNSiMTlf9BOuwKyUFktmdXBgSKLLu6EwPSVeivacAYPLeUfejEW/qbc09Mi0
 Wo1NaIScJEwCRuUMnbjCiV/gswRKViEJ9d81vu5I+vR6UG7HB24pjxOWO1Qc7ar425NK
 g5LYxDxHt5B0YVBiDFVwEIOboeO7UdVmElQGyW1VBcC5I7f9qwGV7/2AyLMoOwZZiWiU
 hZGA==
X-Gm-Message-State: AO0yUKXPTNJbA6daqnea9iVS2ysLzcjQL0M0U1nJowZKnE+ZF+j3KqAl
 0Odgf3q81/4CUtWJYbJYcaY=
X-Google-Smtp-Source: AK7set80y24nDwfFBaPE7mcXN5OX9qbspF3uEC25aF4cKWKMBy1XbwVkypHr6Hsuvnu7Lx4eUKRXBA==
X-Received: by 2002:aa7:9e1a:0:b0:58d:d546:8012 with SMTP id
 y26-20020aa79e1a000000b0058dd5468012mr5576226pfq.0.1676573179525; 
 Thu, 16 Feb 2023 10:46:19 -0800 (PST)
Received: from localhost.localdomain ([2409:40f4:b:d40d:3893:4d65:38b4:e3e6])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a62b406000000b00580cc63dce8sm1630311pfn.77.2023.02.16.10.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 10:46:19 -0800 (PST)
From: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
To: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
Subject: [PATCH v2] Adding new machine Tiogapass in QEMU
Date: Fri, 17 Feb 2023 00:13:43 +0530
Message-Id: <20230216184342.253868-1-pkarthikeyan1509@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=pkarthikeyan1509@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This patch support Tiogapass in QEMU environment.
and introduced EEPROM BMC FRU data support "add tiogapass_bmc_fruid data"
along with the machine support.

Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
---
 hw/arm/aspeed.c        | 32 ++++++++++++++++++++++++++++++++
 hw/arm/aspeed_eeprom.c | 22 ++++++++++++++++++++++
 hw/arm/aspeed_eeprom.h |  3 +++
 3 files changed, 57 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 27dda58338..d12164420d 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -530,6 +530,15 @@ static void romulus_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338", 0x32);
 }
 
+static void tiogapass_bmc_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc = &bmc->soc;
+
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 4), 0x54, 128 * KiB);
+    at24c_eeprom_init_rom(aspeed_i2c_get_bus(&soc->i2c, 6), 0x54, 128 * KiB, tiogapass_bmc_fruid,
+                          tiogapass_bmc_fruid_len);
+}
+
 static void create_pca9552(AspeedSoCState *soc, int bus_id, int addr)
 {
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, bus_id),
@@ -1191,6 +1200,25 @@ static void aspeed_machine_romulus_class_init(ObjectClass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 };
 
+static void aspeed_machine_tiogapass_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       = "Facebook Tiogapass BMC (ARM1176)";
+    amc->soc_name  = "ast2500-a1";
+    amc->hw_strap1 = AST2500_EVB_HW_STRAP1;
+    amc->hw_strap2 = 0;
+    amc->fmc_model = "n25q256a";
+    amc->spi_model = "mx25l25635e";
+    amc->num_cs    = 2;
+    amc->i2c_init  = tiogapass_bmc_i2c_init;
+    mc->default_ram_size       = 1 * GiB;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus =
+        aspeed_soc_num_cpus(amc->soc_name);
+        aspeed_soc_num_cpus(amc->soc_name);
+};
+
 static void aspeed_machine_sonorapass_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1566,6 +1594,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name          = MACHINE_TYPE_NAME("tacoma-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_tacoma_class_init,
+    }, {
+        .name          = MACHINE_TYPE_NAME("tiogapass-bmc"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_tiogapass_class_init,
     }, {
         .name          = MACHINE_TYPE_NAME("g220a-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
diff --git a/hw/arm/aspeed_eeprom.c b/hw/arm/aspeed_eeprom.c
index 04463acc9d..f937a6ceaa 100644
--- a/hw/arm/aspeed_eeprom.c
+++ b/hw/arm/aspeed_eeprom.c
@@ -6,6 +6,27 @@
 
 #include "aspeed_eeprom.h"
 
+/* Tiogapass BMC FRU */
+const uint8_t tiogapass_bmc_fruid[] = {
+    0x01, 0x00, 0x00, 0x01, 0x0d, 0x00, 0x00, 0xf1, 0x01, 0x0c, 0x00, 0x36,
+    0xe6, 0xd0, 0xc6, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x42, 0x4d,
+    0x43, 0x20, 0x53, 0x74, 0x6f, 0x72, 0x61, 0x67, 0x65, 0x20, 0x4d, 0x6f,
+    0x64, 0x75, 0x6c, 0x65, 0xcd, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e,
+    0x30, 0xc9, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc1, 0x39, 0x01, 0x0c, 0x00, 0xc6,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x54, 0x69, 0x6f, 0x67, 0x61,
+    0x20, 0x50, 0x61, 0x73, 0x73, 0x20, 0x53, 0x69, 0x6e, 0x67, 0x6c, 0x65,
+    0x32, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0xc4, 0x58, 0x58, 0x58, 0x32, 0xcd, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc7,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e, 0x30, 0xc9,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc8, 0x43, 0x6f,
+    0x6e, 0x66, 0x69, 0x67, 0x20, 0x41, 0xc1, 0x45,
+};
+
 const uint8_t fby35_nic_fruid[] = {
     0x01, 0x00, 0x00, 0x01, 0x0f, 0x20, 0x00, 0xcf, 0x01, 0x0e, 0x19, 0xd7,
     0x5e, 0xcf, 0xc8, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xdd,
@@ -77,6 +98,7 @@ const uint8_t fby35_bmc_fruid[] = {
     0x6e, 0x66, 0x69, 0x67, 0x20, 0x41, 0xc1, 0x45,
 };
 
+const size_t tiogapass_bmc_fruid_len = sizeof(tiogapass_bmc_fruid);
 const size_t fby35_nic_fruid_len = sizeof(fby35_nic_fruid);
 const size_t fby35_bb_fruid_len = sizeof(fby35_bb_fruid);
 const size_t fby35_bmc_fruid_len = sizeof(fby35_bmc_fruid);
diff --git a/hw/arm/aspeed_eeprom.h b/hw/arm/aspeed_eeprom.h
index a0f848fa6e..69db103c83 100644
--- a/hw/arm/aspeed_eeprom.h
+++ b/hw/arm/aspeed_eeprom.h
@@ -9,6 +9,9 @@
 
 #include "qemu/osdep.h"
 
+extern const uint8_t tiogapass_bmc_fruid[];
+extern const size_t tiogapass_bmc_fruid_len;
+
 extern const uint8_t fby35_nic_fruid[];
 extern const uint8_t fby35_bb_fruid[];
 extern const uint8_t fby35_bmc_fruid[];
-- 
2.25.1


