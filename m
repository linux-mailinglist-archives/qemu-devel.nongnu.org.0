Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA43359AEBD
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Aug 2022 16:54:20 +0200 (CEST)
Received: from localhost ([::1]:35326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPPrf-0008EQ-2D
	for lists+qemu-devel@lfdr.de; Sat, 20 Aug 2022 10:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1oPPK7-0005DG-62
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 10:19:39 -0400
Received: from mail-out-1a.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:44]:13371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1oPPK2-0003mY-BE
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 10:19:37 -0400
X-IPAS-Result: =?us-ascii?q?A2ATBABA7QBj/5sagoZaHQEBAQEJARIBBQUBQIFPhH6ET?=
 =?us-ascii?q?pEPgROdbAsBAQEBAQEBAQEIAUIEAQGFAwICAoRiJjgTAQIEAQEBAQMCAwEBA?=
 =?us-ascii?q?QEBAQMBAQYBAQEBAQEGBIEchS9GhkMCAQMjBAsBRhAgBQImAgJXBg4Fgn2DI?=
 =?us-ascii?q?6kafzKBAYRwhRIJAYEHLIgQghqFK4JQgRWCc3WEYTCDCYJlBJlOHDgDCQQHB?=
 =?us-ascii?q?SweQgMLHw4WBQgJFxIQEAIEERoLBgMWPgkCBA4DQAgNAxEEAw8YCRIIEAQGA?=
 =?us-ascii?q?zEMJQsDFAwBBgMGBQMBAxsDFAMFJAcDGQ8jDQ0EHwwDAwUlAwICGwcCAgMCB?=
 =?us-ascii?q?hUGAgI2GDkIBAgEKyMPBQIHLwUELwIeBAUGEQgCFgIGBAQEBBUCEAgCCCcXB?=
 =?us-ascii?q?xMzGQEFMicQCSEcDhoQBQYTAyBvBQc+DygzNTkrHRsKgRIqKRUDBAQDAgYTA?=
 =?us-ascii?q?wMiAhAuMQMVBikTEi0HK3UJAgMiaQUDAwQoLAMJPgcJIiY9BQVbOgUDAxAiP?=
 =?us-ascii?q?QYDCQMCKTybDYEOo3CgZAeCFqFJTJZxApIBlwehd4EYhCcCBAIEBQIWgXiBf?=
 =?us-ascii?q?nGDNlEXAg+OLBYVjhtzOwIGAQoBAQMJilwBAQ?=
IronPort-Data: A9a23:WFv3B6KQtiaQCYqrFE+RY5clxSXFcZb7ZxGr2PjKsXjdYENShGMPn
 WofUG/QOv+KZWanet53aYy/9x8Gu8fUz9RnTlMd+CA2RRqmiyZk6fexcx2sZXPCdqUvaGo9s
 q3yv/GZdJhcokf0/0vrav64xZVF/fngqoDUUYYoAQgsA14/IMsdoUg7wbRh0tQw2YLR7z6l4
 LseneWOYDdJ5BYpagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDf3Zw0/Df2VhNrXSq
 9DrkevlpDOJp3/BPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XOdJEAXq7hQllkPhDl
 M1gm4CIRD0uN4HOhrhedjVdPgRxaPguFL/veRBTsOSp8HHmXkup+K8rJgcsIpEYv+97R21Dn
 RAaAGlWMlba3Lrwmuz9E7Qx7iggBJCD0Ic3pnZqzDjCS+whTJDGTqHi/8BE3HI5j8tOEPCYa
 8dxhT9HNUWeOEARagd/5JQWv9uOuFbVcmVitVOEn4cuwE3SkzFXz+24WDbSUpnQLSlPpW6Bq
 2fbumj0HBweHNqYzzWD7zSrnOCntTv2RI8IUrix5/JnhFm7wm0VAQcRE1yhrpGEZlWWQc1DK
 0EEvzF06KJ07lO3Tpz0U1u0rRZooyIhZjaZKMVigCnl90Yey1bx6rQsJtKZVOEbiQ==
IronPort-HdrOrdr: A9a23:SSmInKAyyg55RyTlHemd55DYdb4zR+YMi2TC1yhKJSC9Ffbo8P
 xG/c5rsSMc5wx+ZJhNo7q90ey7MBDhHP1OkOws1NWZPTUO0VHAROpfBMnZsl/d8kXFh4hgPM
 xbHJSWZuecMbAs5vyKmDVQa+xB/DDRytHQudvj
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.93,251,1654552800"; d="scan'208";a="19635688"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-1a.itc.rwth-aachen.de with ESMTP; 20 Aug 2022 16:19:26 +0200
Received: from localhost.localdomain (2a02:908:1088:5920:e70b:29db:1db5:28bf)
 by RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Sat, 20 Aug 2022 16:19:26 +0200
From: <tobias.roehmel@rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <tobias.roehmel@rwth-aachen.de>
Subject: [PATCH v3 2/9] target/arm: Don't add all MIDR aliases for cores that
 immplement PMSA
Date: Sat, 20 Aug 2022 16:19:07 +0200
Message-ID: <20220820141914.217399-3-tobias.roehmel@rwth-aachen.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220820141914.217399-1-tobias.roehmel@rwth-aachen.de>
References: <20220820141914.217399-1-tobias.roehmel@rwth-aachen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:e70b:29db:1db5:28bf]
X-ClientProxiedBy: rwthex-w4-b.rwth-ad.de (2a00:8a60:1:e500::26:167) To
 RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155)
Received-SPF: pass client-ip=2a00:8a60:1:e501::5:44;
 envelope-from=tobias.roehmel@rwth-aachen.de;
 helo=mail-out-1a.itc.rwth-aachen.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Cores with PMSA have the MPUIR register which has the
same encoding as the MIDR alias with opc2=4. So we only
add that alias if we are not realizing a core that
implements PMSA.

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
---
 target/arm/helper.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6457e6301c..b9547594ae 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8188,10 +8188,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
@@ -8201,6 +8198,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .accessfn = access_aa64_tid1,
               .type = ARM_CP_CONST, .resetvalue = cpu->revidr },
         };
+        ARMCPRegInfo id_v8_midr_alias_cp_reginfo = {
+              .name = "MIDR", .type = ARM_CP_ALIAS | ARM_CP_CONST,
+              .cp = 15, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 4,
+              .access = PL1_R, .resetvalue = cpu->midr
+        };
         ARMCPRegInfo id_cp_reginfo[] = {
             /* These are common to v8 and pre-v8 */
             { .name = "CTR",
@@ -8264,8 +8266,12 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             id_mpuir_reginfo.access = PL1_RW;
             id_tlbtr_reginfo.access = PL1_RW;
         }
+
         if (arm_feature(env, ARM_FEATURE_V8)) {
             define_arm_cp_regs(cpu, id_v8_midr_cp_reginfo);
+            if (!arm_feature(env, ARM_FEATURE_PMSA)) {
+                define_one_arm_cp_reg(cpu, &id_v8_midr_alias_cp_reginfo);
+            }
         } else {
             define_arm_cp_regs(cpu, id_pre_v8_midr_cp_reginfo);
         }
-- 
2.25.1


