Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94155639AF9
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Nov 2022 14:24:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozHbv-00055P-Vv; Sun, 27 Nov 2022 08:22:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1ozHbI-0004uz-WA
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 08:21:41 -0500
Received: from mail-out-1a.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1ozHbG-0002QW-KP
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 08:21:40 -0500
X-IPAS-Result: =?us-ascii?q?A2ATBABPY4Nj/5sagoZaHQEBAQEJARIBBQUBQIFPhQmET?=
 =?us-ascii?q?pEegROeHw8BAQEBAQEBAQEIAUQEAQGFAQICAoUIJjgTAQIEAQEBAQMCAwEBA?=
 =?us-ascii?q?QEBAQMBAQYBAQEBAQEGBIEdhS9GhlQCAQMjBAsBRhAgBQImAgJXBg4Fgn2DI?=
 =?us-ascii?q?61xfzOBAYRwnE0JAYEKLIkGgk6FQoJQgRWCc3WEYTCDCoJnBJhBHDcDCQMHB?=
 =?us-ascii?q?SwdQAMLGA0WMgoTMhsxJw4JHxwOFw0FBhIDIGwFBzoPKC9kKxwbB4EMKigVA?=
 =?us-ascii?q?wQEAwIGEwMiAg0pMRQEKRMNKydvCQIDImUFAwMEKCwDCUAHJyQ8B1Y6BQMCD?=
 =?us-ascii?q?yA4BgMJAwIiVHIvEhQFAwsVJQgFSwQIOQUGUhICChEDEg8sRQ5IPjkWBidCA?=
 =?us-ascii?q?TAODhMDXUsdgQEEYjmBFTEvmWuDK4EOpB+hRAeCH6IKTJZ7ApIclzeiD4EYh?=
 =?us-ascii?q?CgCBAIEBQIWgXmBfnGDNlIXAg+OLBYVjhp0OwIHAQoBAQMJih8BAQ?=
IronPort-Data: A9a23:lu/y8Kv/50Us1l1+coRAvqkyAufnVApfMUV32f8akzHdYApBsoF/q
 tZmKWuGP/veYmvze9lxOojl8BkPuZTSydVrHVA6/CpmFS0agMeUXt7xwmUcns+xBpCZEBg3v
 512hv3odp1coqr0/0/1WlTZhSAgk/vOH9IQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwa++3k
 YqaT/b3ZRn0hVaYDkpOs/jZ8Uo146yr0N8llgVWic5j7Qe2e0Y9Ucp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VSKlLgFVHmZkl+B8BOtiN/Shkaic7XAtJBMxsN22XR9zxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/QpLn8tJaMYw7dyX0wW+
 8Y3MzAzdDnW0opawJrjIgVtrv4cEOnGDMYk4DRKiyvGEfZjSJyFT6iiCd1whWxswJkVRbCEO
 YxANGcHgBfoOnWjPn8LD5g/lfzunH7yczhVrHqPurY3pmHaxwx81v7hPbI5f/TQFJ4Mxx7H+
 Qoq+Uz7KDdZFt6VyQas1XS2q6zMlg/UV7kdQejQGvlCxQf7KnYoIAQbUEb+rfSnh0qWXdVZJ
 EoJvC00osAa7EG3Q8O7WhSprHOAujYYWtxZCep87xuCopc4+C6DGXQEQy4Ec4ZjvoksWiAqk
 1aF2d/kbdByjICopbum3u/8hVuP1eI9dAfuuQdsodM53uTe
IronPort-HdrOrdr: A9a23:WkLvaaqdbtPKUce/Awxnt/waV5oaeYIsimQD101hICG8cqSj+/
 xG+85rsiMc6QxhPE3I9urvBEDtexnhHNtOkOos1NSZLWzbUQmTTb2KhLGKq1bd8m/Fh4xgPM
 9bAs5D4bbLYmSS4/yW3OHueOxQuOVviJrJuQ6I9QYVcT1X
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.96,198,1665439200"; d="scan'208";a="29311077"
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
Subject: [PATCH v5 1/7] target/arm: Don't add all MIDR aliases for cores that
 implement PMSA
Date: Sun, 27 Nov 2022 14:21:06 +0100
Message-ID: <20221127132112.300331-2-tobias.roehmel@rwth-aachen.de>
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

Cores with PMSA have the MPUIR register which has the
same encoding as the MIDR alias with opc2=4. So we only
add that alias if we are not realizing a core that
implements PMSA.

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
---
 target/arm/helper.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d8c8223ec3..d857d61fa9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8112,10 +8112,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_NO_RAW, .resetvalue = cpu->midr,
               .fieldoffset = offsetof(CPUARMState, cp15.c0_cpuid),
               .readfn = midr_read },
-            /* crn = 0 op1 = 0 crm = 0 op2 = 4,7 : AArch32 aliases of MIDR */
-            { .name = "MIDR", .type = ARM_CP_ALIAS | ARM_CP_CONST,
-              .cp = 15, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 4,
-              .access = PL1_R, .resetvalue = cpu->midr },
+            /* crn = 0 op1 = 0 crm = 0 op2 = 7 : AArch32 aliases of MIDR */
             { .name = "MIDR", .type = ARM_CP_ALIAS | ARM_CP_CONST,
               .cp = 15, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 7,
               .access = PL1_R, .resetvalue = cpu->midr },
@@ -8125,6 +8122,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .accessfn = access_aa64_tid1,
               .type = ARM_CP_CONST, .resetvalue = cpu->revidr },
         };
+        ARMCPRegInfo id_v8_midr_alias_cp_reginfo = {
+            .name = "MIDR", .type = ARM_CP_ALIAS | ARM_CP_CONST,
+            .cp = 15, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 4,
+            .access = PL1_R, .resetvalue = cpu->midr
+        };
         ARMCPRegInfo id_cp_reginfo[] = {
             /* These are common to v8 and pre-v8 */
             { .name = "CTR",
@@ -8190,6 +8192,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         }
         if (arm_feature(env, ARM_FEATURE_V8)) {
             define_arm_cp_regs(cpu, id_v8_midr_cp_reginfo);
+            if (!arm_feature(env, ARM_FEATURE_PMSA)) {
+                define_one_arm_cp_reg(cpu, &id_v8_midr_alias_cp_reginfo);
+            }
         } else {
             define_arm_cp_regs(cpu, id_pre_v8_midr_cp_reginfo);
         }
-- 
2.34.1


