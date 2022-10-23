Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22014609530
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Oct 2022 19:31:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omeVC-0005XV-IJ
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 13:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1omd2Q-0005yl-8n
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 11:37:22 -0400
Received: from mail-out-2a.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1omd2N-0006L8-9B
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 11:37:21 -0400
X-IPAS-Result: =?us-ascii?q?A2CrAAAhREVj/5sagoZaHAEBAQEBAQcBARIBAQQEAQFAg?=
 =?us-ascii?q?T4EAQELAYR9hE6RGJ8TCwEBAQEBAQEBAQgBQgQBAYUBAgIChHUmNwYOAQIEA?=
 =?us-ascii?q?QEBAQMCAwEBAQEBAQMBAQYBAQEBAQEGBIEchS9GhkMCAQMjBAsBRhAgBQImA?=
 =?us-ascii?q?gJXBg4Fgn2DIa0UfzOBAYRwiXEJAYEHLAGIUIIrhTSCUIJRgTd1hGEwgwqCZ?=
 =?us-ascii?q?gSSIogXHDgDCQMHBSwdQAMLHw0WNRgDFAMFIQcDGQ8jDQ0EHQwDAwUlAwICG?=
 =?us-ascii?q?wcCAgMCBhMFAgI1GDQIBAgEKyQPBQIHLwUELwIeBAUGEQgCFgIGBAQEBBUCE?=
 =?us-ascii?q?AgCCCYXBxMzGQEFMicOCSEcDhoNBQYTAyBvBQc7DygvaSsdGweBDCooFQMEB?=
 =?us-ascii?q?AMCBhMDIAINKTEUBCkTDy0HKXEJAgMiZQUDAwQoLAMJQAcoJDwHWDoFAwIQI?=
 =?us-ascii?q?jwGAwkDAiRZdDASFAUDDRcmCAU3GwQIPAIFBlITAgoSAxIPLUkPSj47FwicW?=
 =?us-ascii?q?IEOlUSORqECB4IboWpMlnQCkhaXEaMehCgCBAIEBQIWgXeBf3GDNlEXAg+OL?=
 =?us-ascii?q?BaOMHM7AgYBCgEBAwmLCgEB?=
IronPort-Data: A9a23:QGOtkKnZNwlSvSZMdENr+gvo5gzdJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKDTuOa/iMMGXxetAkPI+x904OsZ6HyN9gT1E4/C48FltH+JHPbTi7wuYcHAvPdJGZHBI/h
 yk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvU0
 T/Ji5CZaQLNNwJcaDpOsfvb8Uo35pwehRtB1rAATaET1LPhvyRNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiY+t5yZv/R3jndaPpATaaBAMxcH011lqPgqo
 DlFncTYpQ7EpcQgksxFO/VTO3kW0aGrZNYrLFDn2fF/wXEqfFO24P9FT3EoBrcBpPZWAFxe2
 tgICGEkO0Xra+KemNpXS8FWufgDAfmuB9lakDd60i3ZSP8qB5zOK0nIzYYDgHFp3ZgIR6iYP
 pdEAdZsRE2ojxlnJlAdCZsl2v2vi3n6fjlwsk2Jpe8+6mPTwQo33LWF3N/9IIHbG5UPxxvwS
 mTuxF7GMCMcCsOm5z/C/HST2KzQgBnQcddHfFG/3rsw6LGJ/UQKBRgLEFe2v/S9oki5Xd1ZN
 goT4CVGhbA/6EGxCNz0ThG1pHqsuh8aUsBXVeog52mwJrH8+RmFBmUUCyUbLdZgrtAqRXkj2
 hmFkrsFGABSjVFcclrFnp/8kN94EXJ9wbMqDcPccTY43g==
IronPort-HdrOrdr: A9a23:G9yLHKkce29JgC+1yo4PWU7+OivpDfI+3DAbv31ZSRFFG/Fw9v
 rPoB1173DJYVoqNU3I+urgBEDjex3hHPdOiOF7AV7LZniEhILCFu1fBOXZqQEJTEbFh4tgPP
 BbAspDNOE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.95,176,1661810400"; d="scan'208";a="25968215"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-2a.itc.rwth-aachen.de with ESMTP; 23 Oct 2022 17:37:14 +0200
Received: from localhost.localdomain (2a02:908:1088:5920:10a7:3a65:7c9d:55ef)
 by RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.15; Sun, 23 Oct 2022 17:37:13 +0200
From: <tobias.roehmel@rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <tobias.roehmel@rwth-aachen.de>
Subject: [PATCH v4 7/7] target/arm: Add ARM Cortex-R52 CPU
Date: Sun, 23 Oct 2022 17:36:59 +0200
Message-ID: <20221023153659.121138-8-tobias.roehmel@rwth-aachen.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221023153659.121138-1-tobias.roehmel@rwth-aachen.de>
References: <20221023153659.121138-1-tobias.roehmel@rwth-aachen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:10a7:3a65:7c9d:55ef]
X-ClientProxiedBy: rwthex-s4-b.rwth-ad.de (2a00:8a60:1:e500::26:165) To
 RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155)
Received-SPF: pass client-ip=2a00:8a60:1:e501::5:45;
 envelope-from=tobias.roehmel@rwth-aachen.de;
 helo=mail-out-2a.itc.rwth-aachen.de
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>

All constants are taken from the ARM Cortex-R52 Processor TRM Revision: r1p3

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
---
 target/arm/cpu_tcg.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 98b5ba2160..52b9d671f7 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -851,6 +851,47 @@ static void cortex_r5_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortexr5_cp_reginfo);
 }
 
+static void cortex_r52_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_PMSA);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    cpu->midr = 0x411fd133; /* r1p3 */
+    cpu->revidr = 0x00000000;
+    cpu->reset_fpsid = 0x41034023;
+    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr1 = 0x12111111;
+    cpu->isar.mvfr2 = 0x00000043;
+    cpu->ctr = 0x8144c004;
+    cpu->reset_sctlr = 0x30c50838;
+    cpu->isar.id_pfr0 = 0x00000131;
+    cpu->isar.id_pfr1 = 0x10111001;
+    cpu->isar.id_dfr0 = 0x03010006;
+    cpu->id_afr0 = 0x00000000;
+    cpu->isar.id_mmfr0 = 0x00211040;
+    cpu->isar.id_mmfr1 = 0x40000000;
+    cpu->isar.id_mmfr2 = 0x01200000;
+    cpu->isar.id_mmfr3 = 0xf0102211;
+    cpu->isar.id_mmfr4 = 0x00000010;
+    cpu->isar.id_isar0 = 0x02101110;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232142;
+    cpu->isar.id_isar3 = 0x01112131;
+    cpu->isar.id_isar4 = 0x00010142;
+    cpu->isar.id_isar5 = 0x00010001;
+    cpu->isar.dbgdidr = 0x77168000;
+    cpu->clidr = (1 << 27) | (1 << 24) | 0x3;
+    cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
+    cpu->ccsidr[1] = 0x201fe00a; /* 32KB L1 icache */
+
+    cpu->pmsav7_dregion = 16;
+    cpu->pmsav8r_hdregion = 16;
+}
+
 static void cortex_r5f_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -1159,6 +1200,7 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
                              .class_init = arm_v7m_class_init },
     { .name = "cortex-r5",   .initfn = cortex_r5_initfn },
     { .name = "cortex-r5f",  .initfn = cortex_r5f_initfn },
+    { .name = "cortex-r52",  .initfn = cortex_r52_initfn },
     { .name = "ti925t",      .initfn = ti925t_initfn },
     { .name = "sa1100",      .initfn = sa1100_initfn },
     { .name = "sa1110",      .initfn = sa1110_initfn },
-- 
2.34.1


