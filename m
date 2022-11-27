Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C532639AFB
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Nov 2022 14:24:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozHbx-00057A-HX; Sun, 27 Nov 2022 08:22:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1ozHbT-0004zd-38
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 08:21:59 -0500
Received: from mail-out-1a.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1ozHbJ-0002QW-CY
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 08:21:43 -0500
X-IPAS-Result: =?us-ascii?q?A2DqBABPY4Nj/5sagoZaHgEBCxIMQIZYhE6RGwOdSIFqD?=
 =?us-ascii?q?wEBAQEBAQEBAQgBRAQBAYUBAgIChQgmOBMBAgQBAQEBAwIDAQEBAQEBAwEBB?=
 =?us-ascii?q?gEBAQEBAQYEgR2FL0aGVAIBAyMECwFGECAFAiYCAlcGDgWCfYMjrXF/M4EBh?=
 =?us-ascii?q?HCcTQkBgQosiQaCToVCglCCUYE3B26EKzYwgwqCZwSMOowHHDcDCQMHBSwdQ?=
 =?us-ascii?q?AMLGA0WMgoTMhsxJw4JHxwOFw0FBhIDIGwFBzoPKC9kKxwbB4EMKigVAwQEA?=
 =?us-ascii?q?wIGEwMiAg0pMRQEKRMNKydvCQIDImUFAwMEKCwDCQQ8ByckPAdWOgUDAg8gO?=
 =?us-ascii?q?AYDCQMCIhY+ci8SFAUDCxUlCAVLBAgMLQUGRwsSAgoRAxIPLEUHB0g+ORYGJ?=
 =?us-ascii?q?0IBMA4OEwNdSx2BAQRiFiOBFTEvmWuCOXEBgQ+DMaBtoUQHgh+iCkyWewKSH?=
 =?us-ascii?q?IINhFMBkFaiD4EYhCgCBAIEBQIWgXmBfnGDNlIXAg+OLBaOL3Q7AgcBCgEBA?=
 =?us-ascii?q?wmKHwEB?=
IronPort-Data: A9a23:bg3mUKsdz8zmzXJ8RDsR58jmBufnVApfMUV32f8akzHdYApBsoF/q
 tZmKTvQMvbeYWX0etsnaNm08E8G7JTWzd9hHQE5qS41RCsWgMeUXt7xwmUcns+xBpCZEBg3v
 512hv3odp1coqr0/0/1WlTZhSAgk/vOH9IQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwa++3k
 YqaT/b3ZRn0hVaYDkpOs/jZ8Uo146yr0N8llgVWic5j7Qe2e0Y9Ucp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VSKlLgFVHmZkl+B8BOtiN/Shkaic7XAtJBMxsN22XR9zxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/p2JUAzB6hJw+o0HWtH7
 dAHFCkiUinW0opawJrjIgVtrv4cEOnGDMYk4DRKiyvGEfZjSJyFT6iiCd1whWxswJkVRbCEO
 YxANGcHgBfoOnWjPn8LD5g/lfzunH7yczhVrHqPurY3pmHaxwx81v7hPbI5f/TQFJ4Mxx7H9
 goq+UzVJiMfP4CZyAbC9y6Uo+/ejwPeH7MNQejQGvlCxQf7KnYoIAQbUEb+rfSnh0qWXdVZJ
 EoJvC00osAa7EG3Q8O7WhSprHOAujYYWtxZCep87xuCopc4+C6DGXQEQy4Ec4ZjvoksWiAqk
 1aF2d/kbdByjICopbum3u/8hVuP1eI9dwfuuQdsodM53uTe
IronPort-HdrOrdr: A9a23:QuhTQaMve+NXv8BcThCjsMiBIKoaSvp037BN7SxMoH1uH/Bw8v
 rEoB11737JYVoqN03I5+rwW5VoMEmzyXcd2+B4V4tKNzOHhILHFvAB0WKb+UyEJwTOstdH06
 Fuaq5/D8C1I2RboK/BkW2FOudl+cKA9q+wg+fY0jNKdiFFL49dzyoRMHf9LqVRLDM2fKbR0K
 DsgPZ6mw==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.96,198,1665439200"; d="scan'208";a="29311078"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-1a.itc.rwth-aachen.de with ESMTP; 27 Nov 2022 14:21:31 +0100
Received: from localhost.localdomain (2a02:908:1088:5920:e2b3:9876:72f1:5569)
 by RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20; Sun, 27 Nov 2022 14:21:30 +0100
From: <tobias.roehmel@rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <tobias.roehmel@rwth-aachen.de>
Subject: [PATCH v5 2/7] target/arm: Make RVBAR available for all ARMv8 CPUs
Date: Sun, 27 Nov 2022 14:21:07 +0100
Message-ID: <20221127132112.300331-3-tobias.roehmel@rwth-aachen.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127132112.300331-1-tobias.roehmel@rwth-aachen.de>
References: <20221127132112.300331-1-tobias.roehmel@rwth-aachen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:e2b3:9876:72f1:5569]
X-ClientProxiedBy: rwthex-s1-a.rwth-ad.de (2a00:8a60:1:e500::26:152) To
 RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155)
Received-SPF: pass client-ip=2a00:8a60:1:e501::5:44;
 envelope-from=tobias.roehmel@rwth-aachen.de;
 helo=mail-out-1a.itc.rwth-aachen.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>

RVBAR shadows RVBAR_ELx where x is the highest exception
level if the highest EL is not EL3. This patch also allows
ARMv8 CPUs to change the reset address with
the rvbar property.

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
---
 target/arm/cpu.c    |  6 +++++-
 target/arm/helper.c | 21 ++++++++++++++-------
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a021df9e9e..cccd957553 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -307,6 +307,10 @@ static void arm_cpu_reset(DeviceState *dev)
         env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
                                          CPACR, CP11, 3);
 #endif
+        if (arm_feature(env, ARM_FEATURE_V8)) {
+            env->cp15.rvbar = cpu->rvbar_prop;
+            env->regs[15] = cpu->rvbar_prop;
+        }
     }
 
 #if defined(CONFIG_USER_ONLY)
@@ -1342,7 +1346,7 @@ void arm_cpu_post_init(Object *obj)
         qdev_property_add_static(DEVICE(obj), &arm_cpu_reset_hivecs_property);
     }
 
-    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+    if (arm_feature(&cpu->env, ARM_FEATURE_V8)) {
         object_property_add_uint64_ptr(obj, "rvbar",
                                        &cpu->rvbar_prop,
                                        OBJ_PROP_FLAG_READWRITE);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d857d61fa9..23a55dbe7d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7855,7 +7855,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         if (!arm_feature(env, ARM_FEATURE_EL3) &&
             !arm_feature(env, ARM_FEATURE_EL2)) {
             ARMCPRegInfo rvbar = {
-                .name = "RVBAR_EL1", .state = ARM_CP_STATE_AA64,
+                .name = "RVBAR_EL1", .state = ARM_CP_STATE_BOTH,
                 .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 0, .opc2 = 1,
                 .access = PL1_R,
                 .fieldoffset = offsetof(CPUARMState, cp15.rvbar),
@@ -7946,13 +7946,20 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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


