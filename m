Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8406095EF
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Oct 2022 22:00:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omfe6-0003t7-Uh
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 14:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1omd2U-00061W-NB
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 11:37:27 -0400
Received: from mail-out-4.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1omd2S-0006L4-Pm
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 11:37:26 -0400
X-IPAS-Result: =?us-ascii?q?A2DQAgC8Q0Vj/5sagoZaHAEBAQEBAQcBARIBAQQEAQFAg?=
 =?us-ascii?q?U+EfoROkRUDnSuBaAsBAQEBAQEBAQEIAUIEAQGFAQICAoR1JjgTAQIEAQEBA?=
 =?us-ascii?q?QMCAwEBAQEBAQMBAQYBAQEBAQEGBIEchS9GhkMCAQMjBAsBRhAgBQImAgJXB?=
 =?us-ascii?q?g4Fgn2DIa0UfzOBAYRwiXEJAYEHLIhRgiuFNIJQglGBNwduhCs2MIMKgmYEk?=
 =?us-ascii?q?iKIFxw4AwkDBwUsHUADCx8NFjUYAxQDBSEHAxkPIw0NBB0MAwMFJQMCAhsHA?=
 =?us-ascii?q?gIDAgYTBQICNRg0CAQIBCskDwUCBy8FBC8CHgQFBhEIAhYCBgQEBAQVAhAIA?=
 =?us-ascii?q?ggmFwcTMxkBBTInDgkhHA4aDQUGEwMgbwUHOw8oL2krHRsHgQwqKBUDBAQDA?=
 =?us-ascii?q?gYTAyACDSkxFAQpEw8tBylxCQIDImUFAwMEKCwDCQQ8BygkPAdYOgUDAhAiP?=
 =?us-ascii?q?AYDCQMCJBhBdDASFAUDDRcmCAU3GwQIDi4CBQZHCxMCChIDEg8tSQcISj47F?=
 =?us-ascii?q?wibZnEBgQ+DMaBYoQIHghuhakyWdAKSFoIIhEgBkECiBoEYhCgCBAIEBQIWg?=
 =?us-ascii?q?XiBfnGDNlEXAg+OLBaOMHM7AgYBCgEBAwmLCgEB?=
IronPort-Data: A9a23:4hHAoKLApjhidsoCFE+RjpQlxSXFcZb7ZxGr2PjKsXjdYENShjwGn
 GAcCmmFOKuPMWSmLdBwYdiy8BsPuJLdndBqHgsd+CA2RRqmiyZk6fexcx2sZXPCdqUvaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2LBVOCvQ/
 4KvyyHjEAX9gWQtajtNs/jrRC5H5ZwehhtJ5jTSWtgW5Dcyp1FNZLoDKKe4KWfPQ4U8NoZWk
 M6akdlVVkuAl/scIovNfoTTKyXmcZaOVeS6sUe6boD56vR0jnFojvxrZKJ0hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0aBuoNf6zXaDXcO7kGr0Ymf0ws5VFmITB6wX1OFvKGVF3
 KlNQNwNRkjra+Oe+o2HasRcw/95aeOtJpwDujRpwXfVAJ7KQ7iaGPmMvIQAmm1uwJkTQJ4yZ
 OJAAdZrRAjHaRxGIREND58+meqsrmPgbz0doVuepacxpWTepOB0+OGzaICKJo3QH625mG67m
 ziBwWjoAyhAd/XC6BG89UyjmrLAyHaTtIU6UefQGuRRqESew3FWBBAIWF+Tp/6/hUijHdVFJ
 CQ84icyoLJ08UW6QtT5WzW8oXiNpBlaXMBfe9DW8ymX1bbU7hbcHTJBRHhbd8Am8cY6AzAnv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:TYJd/6PDbC3H0cBcTvijsMiBIKoaSvp037BN7TEXdfU1SL39qy
 nKpp9w6faaslsssQ4b6La90cW7Lk80jKQFg7X5Xo3SOTUO2lHJEGgK1+KL/9SHIUPDH4VmtJ
 uIHZITNDSJNykYsS/y2njAL+od
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.95,176,1661810400"; d="scan'208";a="160274922"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-4.itc.rwth-aachen.de with ESMTP; 23 Oct 2022 17:37:11 +0200
Received: from localhost.localdomain (2a02:908:1088:5920:10a7:3a65:7c9d:55ef)
 by RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.15; Sun, 23 Oct 2022 17:37:12 +0200
From: <tobias.roehmel@rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <tobias.roehmel@rwth-aachen.de>
Subject: [PATCH v4 2/7] target/arm: Make RVBAR available for all ARMv8 CPUs
Date: Sun, 23 Oct 2022 17:36:54 +0200
Message-ID: <20221023153659.121138-3-tobias.roehmel@rwth-aachen.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221023153659.121138-1-tobias.roehmel@rwth-aachen.de>
References: <20221023153659.121138-1-tobias.roehmel@rwth-aachen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:10a7:3a65:7c9d:55ef]
X-ClientProxiedBy: rwthex-s4-b.rwth-ad.de (2a00:8a60:1:e500::26:165) To
 RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155)
Received-SPF: pass client-ip=2a00:8a60:1:e501::5:49;
 envelope-from=tobias.roehmel@rwth-aachen.de;
 helo=mail-out-4.itc.rwth-aachen.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
ARMv8 CPUs to change the reset address with
the rvbar property.

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
---
 target/arm/cpu.c    |  6 +++++-
 target/arm/helper.c | 23 +++++++++++++++--------
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 94ca6f163f..b642749d6d 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -281,6 +281,10 @@ static void arm_cpu_reset(DeviceState *dev)
         env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
                                          CPACR, CP11, 3);
 #endif
+        if (arm_feature(env, ARM_FEATURE_V8)) {
+            env->cp15.rvbar = cpu->rvbar_prop;
+            env->regs[15] = cpu->rvbar_prop;
+        }
     }
 
 #if defined(CONFIG_USER_ONLY)
@@ -1306,7 +1310,7 @@ void arm_cpu_post_init(Object *obj)
         qdev_property_add_static(DEVICE(obj), &arm_cpu_reset_hivecs_property);
     }
 
-    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+    if (arm_feature(&cpu->env, ARM_FEATURE_V8)) {
         object_property_add_uint64_ptr(obj, "rvbar",
                                        &cpu->rvbar_prop,
                                        OBJ_PROP_FLAG_READWRITE);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3c517356e1..2e9e420d4e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7768,8 +7768,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         if (!arm_feature(env, ARM_FEATURE_EL3) &&
             !arm_feature(env, ARM_FEATURE_EL2)) {
             ARMCPRegInfo rvbar = {
-                .name = "RVBAR_EL1", .state = ARM_CP_STATE_AA64,
-                .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 0, .opc2 = 1,
+                .name = "RVBAR_EL1", .state = ARM_CP_STATE_BOTH,
+                .opc0 = 3, .cp = 15, .opc1 = 0, .crn = 12, .crm = 0, .opc2 = 1,
                 .access = PL1_R,
                 .fieldoffset = offsetof(CPUARMState, cp15.rvbar),
             };
@@ -7859,13 +7859,20 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
+                    .cp = 15, .opc1 = 0, .crn = 12, .crm = 0, .opc2 = 1,
+                    .access = PL2_R,
+                    .fieldoffset = offsetof(CPUARMState, cp15.rvbar),
+                },
             };
-            define_one_arm_cp_reg(cpu, &rvbar);
+            define_arm_cp_regs(cpu, rvbar);
         }
     }
 
-- 
2.34.1


