Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 638E9644136
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 11:27:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2V9S-0007NC-1s; Tue, 06 Dec 2022 05:26:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1p2V95-0007Ed-UN
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:25:53 -0500
Received: from mail-out-3.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1p2V93-00028m-LG
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:25:51 -0500
X-IPAS-Result: =?us-ascii?q?A2ATBADNF49j/5sagoZaHQEBAQEJARIBBQUBQIFPhQuET?=
 =?us-ascii?q?pEfgROeIA8BAQEBAQEBAQEIAUQEAQGFAQICAoUPJjgTAQIEAQEBAQMCAwEBA?=
 =?us-ascii?q?QEBAQMBAQYBAQEBAQEGBIEdhS9GhlYCAQMjBAsBRhAgBQImAgJXBg4Fgn6DI?=
 =?us-ascii?q?61KfzOBAaE+CQGBCiyJCIJOhUKCUIEVgnN1hGEwgwqCZwSXFQ5uHDcDCQMHB?=
 =?us-ascii?q?SwdQAMLGA0WMgoTMjULEUwrHBsHgQwqKBUDBAQDAgYTAyACDSgxFAQpEw0rJ?=
 =?us-ascii?q?m0JAgMhYQUDAwQoLAMJQAcmJjwHVjcFAwIPIDgGAwkDAh9UdC8SFAUDCxUlC?=
 =?us-ascii?q?AVJBAg3BQZTEgIKERIPLEUOSD45FgYnQQEwDg4TA11LHYEBBGA5gRUvLpsTg?=
 =?us-ascii?q?Q6CQKFioU0Hgh+iDkyWfQKSHZdAohKBGIQoAgQCBAUCFoF5gX5xgzZSFwIPj?=
 =?us-ascii?q?iwWFY4adDsCBwEKAQEDCYofAQE?=
IronPort-Data: A9a23:b95DlKyEqpI0Ni43W9J6t+dKxyrEfRIJ4+MujC+fZmUNrF6WrkVUz
 WcfXGvSa/qCZzDyc9FwOork9kkPscXdxtY3HlZsqFhgHilAwSbn6XV1DW+tZX/Ifp2bJK5Dx
 59DAjUVBJlsFhcwnj/0bv676yAUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dga++2k
 Y608pO31GONgWYuaDtOs/zb8nuDgdyr0N8mlg1mDRx0lAKG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVTmZk5tZkSXqkMqShoaj/xnbqpMMS+7vB3S9zx54
 I0lWZVd0m7FNIWU8AgWe0Ew/y2TocSq9ZefSUVTv/B/wGXMNEPdkqxHBn0aHocZ/9l+UCZy/
 toHfWVlghCr34pawZqBddVMq/RmF5OuFsUFpW1giDjVS/orKXzBa/yRuZkBh2923J4IRKuDD
 yYaQWMHgBDofxpFO14MTog5keeti33XaSJEqBecrKE37m6VwAEZPL3FaYWEJYDVFJsM9qqej
 m/K+171CSs5DsXF5WKJ0COliubDsCyuDer+E5X9rJaGmma732EWFVgaWEW2pdG/jUixXc8ZL
 FYbkgI2oLQ/7gquR8jxUhm8iHqFuBcGXJxXCeJSwBuMward+QrfBmUCQjNbc9sgnMs3QzUw0
 RmOhdyBONB0mKeKVXKQ5vKP93a4fzIKMW9HbCNCQQZtD8TfnbzfRynnFr5LeJNZRPWucd0s6
 1hmdBQDuog=
IronPort-HdrOrdr: A9a23:GXtAE66iYUgvhoht2gPXwPLXdLJyesId70hD6qkRc3Bom6mj/P
 xG88516faZslgssRMb+exoSZPgfZq0z/cci+Qs1NGZLWvbUQCTXeJfBOXZslrdMhy72ulB1b
 pxN4hSYeeAa2SSVPyKhTVQxexQpOW6zA==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.96,222,1665439200"; d="scan'208";a="179747961"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-3.itc.rwth-aachen.de with ESMTP; 06 Dec 2022 11:25:30 +0100
Received: from localhost.localdomain (2a02:908:1088:5920:7fc5:a897:a756:e2fb)
 by RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20; Tue, 6 Dec 2022 11:25:30 +0100
From: <tobias.roehmel@rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <tobias.roehmel@rwth-aachen.de>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: [PATCH v6 1/7] target/arm: Don't add all MIDR aliases for cores that
 implement PMSA
Date: Tue, 6 Dec 2022 11:24:58 +0100
Message-ID: <20221206102504.165775-2-tobias.roehmel@rwth-aachen.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206102504.165775-1-tobias.roehmel@rwth-aachen.de>
References: <20221206102504.165775-1-tobias.roehmel@rwth-aachen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:7fc5:a897:a756:e2fb]
X-ClientProxiedBy: rwthex-s2-a.rwth-ad.de (2a00:8a60:1:e500::26:154) To
 RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155)
Received-SPF: pass client-ip=2a00:8a60:1:e501::5:48;
 envelope-from=tobias.roehmel@rwth-aachen.de;
 helo=mail-out-3.itc.rwth-aachen.de
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

Cores with PMSA have the MPUIR register which has the
same encoding as the MIDR alias with opc2=4. So we only
add that alias if we are not realizing a core that
implements PMSA.

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


