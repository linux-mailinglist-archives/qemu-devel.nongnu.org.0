Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6055960968C
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Oct 2022 23:32:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omfFN-0001vO-MU
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 13:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1omd2S-0005zz-CN
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 11:37:25 -0400
Received: from mail-out-4.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1omd2N-0006L4-9C
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 11:37:24 -0400
X-IPAS-Result: =?us-ascii?q?A2CrAAC8Q0Vj/5sagoZaHAEBAQEBAQcBARIBAQQEAQFAg?=
 =?us-ascii?q?T4EAQELAYR9hE6RGIETngALAQEBAQEBAQEBCAFCBAEBhQECAgKEdSY3Bg4BA?=
 =?us-ascii?q?gQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBAQYEgRyFL0aGQwIBAyMECwFGECAFA?=
 =?us-ascii?q?iYCAlcGDgWCfYMhrRR/M4EBhHCJcQkBgQcsAYhQgiuFNIJQgRWCc3WEYTCDC?=
 =?us-ascii?q?oJmBJo5HDgDCQMHBSwdQAMLHw0WNRgDFAMFIQcDGQ8jDQ0EHQwDAwUlAwICG?=
 =?us-ascii?q?wcCAgMCBhMFAgI1GDQIBAgEKyQPBQIHLwUELwIeBAUGEQgCFgIGBAQEBBUCE?=
 =?us-ascii?q?AgCCCYXBxMzGQEFMicOCSEcDhoNBQYTAyBvBQc7DygvaSsdGweBDCooFQMEB?=
 =?us-ascii?q?AMCBhMDIAINKTEUBCkTDy0HKXEJAgMiZQUDAwQoLAMJQAcoJDwHWDoFAwIQI?=
 =?us-ascii?q?jwGAwkDAiRZdDASFAUDDRcmCAU3GwQIPAIFBlITAgoSAxIPLUkPSj47FwicW?=
 =?us-ascii?q?IEOpAqhAgeCG6FqTJZ0ApIWlxGiBoEYhCgCBAIEBQIWgXeBf3GDNlEXAg+OL?=
 =?us-ascii?q?BYVjhtzOwIGAQoBAQMJiwoBAQ?=
IronPort-Data: A9a23:Xshf86/AGzuE14Qrpfc5DrUD33+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 mYeW2+Obv+KNDfxeIxyPI3i8k9U6MKBydBlTwdv+C1EQiMRo6IpJzg4wmTYYnnOdJ2TFCqLy
 +1EN7Es+ehtFie0Si+Fa+Sn9z8kvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRWmthg
 vuv5ZyCULOZ82QsaDhNs/va8EkHUMna4Vv0gHRvPZing3eDzxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDS4pZiYJVOtzAZzsAE+vthaKBMOR8/ZwKhxLidw
 P0V3XC5pJxA0qfkwIzxWDEAe81y0DEvFLLveRCCXcKvI0LuQ1DlyehICRENIog6y+xHUWhur
 vYBEWVYBvyDr7reLLOTcNZQpukTafKxealZoG58zXTQAbAqTPgvQY2TvoMehWxowJoQW6+DO
 qL1ahI2BPjESwFIMFYeE9Qkm+qog3T7WydHtFLQrKM842XVigB8uFToGIOLIobVGZQPxi50o
 Ero+0/bLRAFaeCjyAW/7kqonuLBgxzCDdd6+LqQs6QCbEeo7nUeDQBTWValrP2RjEm4VNRCb
 UsO9UIGtaUu+VbtS9DsUxC8pFaAvxgVQd0WFPc1gDxh0YLO/BqZC3hBVWQEYpo8q9M2ADUmk
 FOE9z/0OQFSXHSuYSr13t+pQfmaYED58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:+5PIa6HArULrRPuJpLqE0ceALOsnbusQ8zAXPidKOHtom62j5q
 STdZEgvnXJYVkqNU3I5urwXpVoLUmyyXcN2/hyAV7AZniChILLFuFfBOLZqlXd8kvFmNK1vp
 0AT0ERMrHN5CBB/KXHCQCDYq8d/OU=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.95,176,1661810400"; d="scan'208";a="160274920"
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
Subject: [PATCH v4 1/7] target/arm: Don't add all MIDR aliases for cores that
 immplement PMSA
Date: Sun, 23 Oct 2022 17:36:53 +0200
Message-ID: <20221023153659.121138-2-tobias.roehmel@rwth-aachen.de>
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

Cores with PMSA have the MPUIR register which has the
same encoding as the MIDR alias with opc2=4. So we only
add that alias if we are not realizing a core that
implements PMSA.

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
---
 target/arm/helper.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index db3b1ea72d..3c517356e1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8025,10 +8025,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
@@ -8038,6 +8035,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
@@ -8101,8 +8103,12 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
2.34.1


