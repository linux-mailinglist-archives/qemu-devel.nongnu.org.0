Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A100659AEB5
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Aug 2022 16:37:44 +0200 (CEST)
Received: from localhost ([::1]:32866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPPbb-000343-5E
	for lists+qemu-devel@lfdr.de; Sat, 20 Aug 2022 10:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1oPPK8-0005DN-6d
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 10:19:40 -0400
Received: from mail-out-4.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:49]:45767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1oPPK2-0003lt-BK
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 10:19:39 -0400
X-IPAS-Result: =?us-ascii?q?A2DQAgBk7ABj/5sagoZaHAEBAQEBAQcBARIBAQQEAQFAg?=
 =?us-ascii?q?U+EfoROkQwDnReBaAsBAQEBAQEBAQEIAUIEAQGFAwICAoRiJjgTAQIEAQEBA?=
 =?us-ascii?q?QMCAwEBAQEBAQMBAQYBAQEBAQEGBIEchS9GhkMCAQMjBAsBRhAgBQImAgJXB?=
 =?us-ascii?q?g4Fgn2DI6kafzKBAYRwhRIJAYEHLIgQghqFK4JQglGBNwduhCs2gzmCZQSVU?=
 =?us-ascii?q?4N7HDgDCQQHBSweQgMLHw4WBQgJFxIQEAIEERoLBgMWPgkCBA4DQAgNAxEEA?=
 =?us-ascii?q?w8YCRIIEAQGAzEMJQsDFAwBBgMGBQMBAxsDFAMFJAcDGQ8jDQ0EHwwDAwUlA?=
 =?us-ascii?q?wICGwcCAgMCBhUGAgI2GDkIBAgEKyMPBQIHLwUELwIeBAUGEQgCFgIGBAQEB?=
 =?us-ascii?q?BUCEAgCCCcXBxMzGQEFMicQCSEcDhoQBQYTAyBvBQc+DygzNTkrHRsKgRIqK?=
 =?us-ascii?q?RUDBAQDAgYTAwMiAhAuMQMVBikTEi0HK3UJAgMiaQUDAwQoLAMJBDoHCSImP?=
 =?us-ascii?q?QUFWzoFAwMQIj0GAwkDAikaIpobcQGBD4MxkhGOLaBkB4IWoUlMlnECkgGCC?=
 =?us-ascii?q?IRGAZA4oXeBGIQnAgQCBAUCFoF4gX5xgzZRFwIPjiwWjjBzOwIGAQoBAQMJi?=
 =?us-ascii?q?lwBAQ?=
IronPort-Data: A9a23:63qaqqjY6iM1AcQpf4NzJ+5jX1613RIKZh0ujC45NGQN5FlHY01je
 htvWG2CaaqIYGTwLtFxaNixpE1Q65DXydc1SAo/+yBkQ3xjpJueD7x1DKtR0wC6c5efFhI3t
 63yTvGacajYm1eF/k/F3oDJ9CU6jefRLlbFILas1hpZHGeIcw98z0M48wIFqtQw24LhU1nV4
 YmaT/D3YTdJ5RYlagr41Ire8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatU88tqBe
 gr25OrRElXxok1xUIP1yt4XRWVRKlLaFVDmZnO7wMFOiDAazsA5+v5T2Pbx9S67hh3R9+2dx
 umhurSXcFwJHIjjvt8geB9HDB1kBbxZ2ZLYdC3XXcy7lyUqclPW/MlOIXFzBtdd0KBtHn1Os
 PUUbjwABvyBr7vtnPTiEbEq3JpldZS2VG8ckigIITXxEfEsQJnYBb/N6N9d0TMYnN9SHbPXb
 sEZZDwpYBmojxhnYwpMWM5lx7r27pX5WztoommtuI4r31iQ4lZ1yIb2C9bNIuXfEK25mW7d/
 Aoq5V/RGxwfKZmTxCSI9lqqgenAmz69X5gdfJWg++JnmhuWz30fBRkSfV+6p/CjjQi5Qd03F
 qAP0jAxsag/5AmwFJz3GQenvH7BtxJaV9c4//AG1TxhA5H8u26xblXohBYbADD6nKfanQAX6
 2I=
IronPort-HdrOrdr: A9a23:CvPL/68sbaqhVMyw48tuk+AII+orL9Y04lQ7vn2ZKCYlEPBw8v
 rE9sjzuiWYtN9vYgBcpTntAsW9qFnnhPpICPAqTMyftVDdyRGVxeJZnOjfKl/behEWn9Q1vZ
 uIFZIQNDSaNzhHZKjBjjVQXOxQpuVviJrY/Ns30x1WPGZXQpAl9Qt/BwqBe3cGPDVuNN4kEY
 ORj/A3wgadRQ==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.93,251,1654552800"; d="scan'208";a="153843356"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-4.itc.rwth-aachen.de with ESMTP; 20 Aug 2022 16:19:27 +0200
Received: from localhost.localdomain (2a02:908:1088:5920:e70b:29db:1db5:28bf)
 by RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Sat, 20 Aug 2022 16:19:26 +0200
From: <tobias.roehmel@rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <tobias.roehmel@rwth-aachen.de>
Subject: [PATCH v3 3/9] target/arm: Make RVBAR available for all ARMv8 CPUs
Date: Sat, 20 Aug 2022 16:19:08 +0200
Message-ID: <20220820141914.217399-4-tobias.roehmel@rwth-aachen.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220820141914.217399-1-tobias.roehmel@rwth-aachen.de>
References: <20220820141914.217399-1-tobias.roehmel@rwth-aachen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:e70b:29db:1db5:28bf]
X-ClientProxiedBy: rwthex-w4-b.rwth-ad.de (2a00:8a60:1:e500::26:167) To
 RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155)
Received-SPF: pass client-ip=2a00:8a60:1:e501::5:49;
 envelope-from=tobias.roehmel@rwth-aachen.de;
 helo=mail-out-4.itc.rwth-aachen.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>

RVBAR shadows RVBAR_ELx where x is the highest exception
level if the highest EL is not EL3. This patch also allows
ARMv8 CPUs to change the reset address to be changed with
the rvbar property.

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
---
 target/arm/cpu.c    |  6 +++++-
 target/arm/helper.c | 38 ++++++++++++++++++++++++++------------
 2 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1b5d535788..9007768418 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -258,6 +258,10 @@ static void arm_cpu_reset(DeviceState *dev)
         env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
                                          CPACR, CP11, 3);
 #endif
+        if (arm_feature(env, ARM_FEATURE_V8)) {
+            env->cp15.rvbar = cpu->rvbar_prop;
+            env->regs[15] = cpu->rvbar_prop;
+        }
     }
 
 #if defined(CONFIG_USER_ONLY)
@@ -1273,7 +1277,7 @@ void arm_cpu_post_init(Object *obj)
         qdev_property_add_static(DEVICE(obj), &arm_cpu_reset_hivecs_property);
     }
 
-    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+    if (arm_feature(&cpu->env, ARM_FEATURE_V8)) {
         object_property_add_uint64_ptr(obj, "rvbar",
                                        &cpu->rvbar_prop,
                                        OBJ_PROP_FLAG_READWRITE);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b9547594ae..23461397e0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7954,13 +7954,20 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         /* RVBAR_EL1 is only implemented if EL1 is the highest EL */
         if (!arm_feature(env, ARM_FEATURE_EL3) &&
             !arm_feature(env, ARM_FEATURE_EL2)) {
-            ARMCPRegInfo rvbar = {
-                .name = "RVBAR_EL1", .state = ARM_CP_STATE_AA64,
-                .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 0, .opc2 = 1,
-                .access = PL1_R,
-                .fieldoffset = offsetof(CPUARMState, cp15.rvbar),
+            ARMCPRegInfo rvbar[] = {
+                {
+                    .name = "RVBAR_EL1", .state = ARM_CP_STATE_AA64,
+                    .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 0, .opc2 = 1,
+                    .access = PL1_R,
+                    .fieldoffset = offsetof(CPUARMState, cp15.rvbar),
+                },
+                {   .name = "RVBAR", .type = ARM_CP_ALIAS,
+                    .cp = 15, .crn = 12, .crm = 0, .opc1 = 0, .opc2 = 1,
+                    .access = PL1_R,
+                    .fieldoffset = offsetof(CPUARMState, cp15.rvbar),
+                },
             };
-            define_one_arm_cp_reg(cpu, &rvbar);
+            define_arm_cp_regs(cpu, rvbar);
         }
         define_arm_cp_regs(cpu, v8_idregs);
         define_arm_cp_regs(cpu, v8_cp_reginfo);
@@ -8022,13 +8029,20 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         }
         /* RVBAR_EL2 is only implemented if EL2 is the highest EL */
         if (!arm_feature(env, ARM_FEATURE_EL3)) {
-            ARMCPRegInfo rvbar = {
-                .name = "RVBAR_EL2", .state = ARM_CP_STATE_AA64,
-                .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 0, .opc2 = 1,
-                .access = PL2_R,
-                .fieldoffset = offsetof(CPUARMState, cp15.rvbar),
+            ARMCPRegInfo rvbar[] = {
+                {
+                    .name = "RVBAR_EL2", .state = ARM_CP_STATE_AA64,
+                    .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 0, .opc2 = 1,
+                    .access = PL2_R,
+                    .fieldoffset = offsetof(CPUARMState, cp15.rvbar),
+                },
+                {   .name = "RVBAR", .type = ARM_CP_ALIAS,
+                    .cp = 15, .crn = 12, .crm = 0, .opc1 = 0, .opc2 = 1,
+                    .access = PL2_R,
+                    .fieldoffset = offsetof(CPUARMState, cp15.rvbar),
+                },
             };
-            define_one_arm_cp_reg(cpu, &rvbar);
+            define_arm_cp_regs(cpu, rvbar);
         }
     }
 
-- 
2.25.1


