Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 476F8644135
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 11:27:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2V9N-0007KU-92; Tue, 06 Dec 2022 05:26:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1p2V95-0007Ec-I5
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:25:53 -0500
Received: from mail-out-4.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1p2V8t-00028p-SL
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:25:50 -0500
X-IPAS-Result: =?us-ascii?q?A2AUBADNF49j/5sagoZaHQEBAQEJARIBBQUBQIFPhQuET?=
 =?us-ascii?q?pEcA51JgWoPAQEBAQEBAQEBCAFEBAEBhQECAgKFDyY4EwECBAEBAQEDAgMBA?=
 =?us-ascii?q?QEBAQEDAQEGAQEBAQEBBgSBHYUvRoZWAgEDIwQLAUYQIAUCJgICVwYOBYJ+g?=
 =?us-ascii?q?yOtSn8zgQGEcZxNCQGBCiyJCIJOhUKCUIJRgTcHboQrNjCDCoJnBIEUiSaMW?=
 =?us-ascii?q?w5uHDcDCQMHBSwdQAMLGA0WMgoTMjULEUwrHBsHgQwqKBUDBAQDAgYTAyACD?=
 =?us-ascii?q?SgxFAQpEw0rJm0JAgMhYQUDAwQoLAMJBDwHJiY8B1Y3BQMCDyA4BgMJAwIfF?=
 =?us-ascii?q?j50LxIUBQMLFSUIBUkECAwrBQZICxICChESDyxFBwdIPjkWBidBATAODhMDX?=
 =?us-ascii?q?UsdgQEEYBYjgRUvLpohcQGBD4I/cqBwoU0Hgh+iDkyWfQKSHYINhFYBkFyiE?=
 =?us-ascii?q?oEYhCgCBAIEBQIWgXmBfnGDNlIXAg+OLBaOL3Q7AgcBCgEBAwmKHwEB?=
IronPort-Data: A9a23:7/yW2auCraOa3ZRddd1EobdvnufnVAlfMUV32f8akzHdYApBsoF/q
 tZmKW3UOvrcMTOkKd1xOdm38UlS75KHzt9qGQBr+y5nRHkUgMeUXt7xwmUcns+xBpCZEBg3v
 512hv3odp1coqr0/0/1WlTZhSAgk/vOH9IQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwa++3k
 YqaT/b3ZRn0hVaYDkpOs/jZ8Uk34qyo0N8llgVWic5j7Qe2e0Y9Ucp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VSKlLgFVHmZkl+B8BOtiN/Shkaic7XAtJBMxsN22XR9zxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj66lkD2ZsZNU+xsRUKCJSr
 M4jcwIdQSnW0opawJrjIgVtrv4cEOnGDMYk4DRKiyvGEfZjSJyFT6iiCd1whWxswJkVRbCEO
 YxANGcHgBfoOnWjPn8LD5g/lfzunH7yczhVrHqPurY3pmHaxwx81v7hPbI5f/TTG5kIzhfG/
 TyuE2LRKBgrON/c0xC/4GOztOzjnx7fAasDC+jtnhJtqBjJroAJMzUPWF6m5PW0lEO6c9RYL
 UMS52wpt6da3FSmUtTnGRixsXKJuho0X9tWGvc9rgaXxcLpDx2xHHcYTjNRLcd88cVwXyM21
 hqAk5XlCFSDrYGodJ5UzZ/MxRvaBMTfBTVqifMsJefd3+TenQ==
IronPort-HdrOrdr: A9a23:cTpp2q2aVdA8o/So5DKhygqjBIMkLtp133Aq2lEZdPRUGvb1qy
 nIpoV96faUskd0ZJhOo7690cW7K080sKQFgrX5Xo3SOTUO2lHIEGgK1+KLqAEIWReOlNK1vZ
 0QFZSWY+eeMbEVt6vHCF7SKadZ/DD+ysCVbLDlvg5QcT0=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.96,222,1665439200"; d="scan'208";a="164589636"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-4.itc.rwth-aachen.de with ESMTP; 06 Dec 2022 11:25:31 +0100
Received: from localhost.localdomain (2a02:908:1088:5920:7fc5:a897:a756:e2fb)
 by RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20; Tue, 6 Dec 2022 11:25:31 +0100
From: <tobias.roehmel@rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <tobias.roehmel@rwth-aachen.de>
Subject: [PATCH v6 2/7] target/arm: Make RVBAR available for all ARMv8 CPUs
Date: Tue, 6 Dec 2022 11:24:59 +0100
Message-ID: <20221206102504.165775-3-tobias.roehmel@rwth-aachen.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206102504.165775-1-tobias.roehmel@rwth-aachen.de>
References: <20221206102504.165775-1-tobias.roehmel@rwth-aachen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:7fc5:a897:a756:e2fb]
X-ClientProxiedBy: rwthex-s2-a.rwth-ad.de (2a00:8a60:1:e500::26:154) To
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>

RVBAR shadows RVBAR_ELx where x is the highest exception
level if the highest EL is not EL3. This patch also allows
ARMv8 CPUs to change the reset address with
the rvbar property.

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c    |  6 +++++-
 target/arm/helper.c | 21 ++++++++++++++-------
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 38d066c294..f9ab6af829 100644
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


