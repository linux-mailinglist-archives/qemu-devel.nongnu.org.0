Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74591639AFA
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Nov 2022 14:24:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozHc8-0005Lu-BX; Sun, 27 Nov 2022 08:22:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1ozHbb-00052E-D3
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 08:22:05 -0500
Received: from mail-out-3.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1ozHbS-0002Sq-Vr
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 08:21:55 -0500
X-IPAS-Result: =?us-ascii?q?A2D5AADXY4Nj/5sagoZaHQEBAQEJARIBBQUBQIE+BQELA?=
 =?us-ascii?q?YUIhE6RHp8yDwEBAQEBAQEBAQgBRAQBAYUBAgIChQgmNwYOAQIEAQEBAQMCA?=
 =?us-ascii?q?wEBAQEBAQMBAQYBAQEBAQEGBIEdhS9GhlQCAQMjBAsBRhAgBQImAgJXBg4Fg?=
 =?us-ascii?q?n2DI61yfzOBAYRwnE0JAYEKLAGJBYJOhUKCUIJRgTd1hGEwgwqCZwSMOowHH?=
 =?us-ascii?q?DcDCQMHBSwdQAMLGA0WMgoTMhsxJw4JHxwOFw0FBhIDIGwFBzoPKC9kKxwbB?=
 =?us-ascii?q?4EMKigVAwQEAwIGEwMiAg0pMRQEKRMNKydvCQIDImUFAwMEKCwDCUAHJyQ8B?=
 =?us-ascii?q?1Y6BQMCDyA4BgMJAwIiVHIvEhQFAwsVJQgFSwQIOQUGUhICChEDEg8sRQ5IP?=
 =?us-ascii?q?jkWBidCATAODhMDXUsdgQEEYjmBFTEvmWuDK4EOlU+OUKFEB4IfogpMlnsCk?=
 =?us-ascii?q?hyXN6MnhCgCBAIEBQIWgXiBf3GDNlIXAg+OLBaOL3Q7AgcBCgEBAwmKHwEB?=
IronPort-Data: A9a23:/0dnJ6Oh8dWyqf7vrR37lsFynXyQoLVcMsEvi/4bfWQNrUojhWMGn
 GAdCGyBM/3YY2L9Lt9zb9uw9E9Tv8LXyNJkSXM5pCpnJ55oRWspJvzEdBuqb3PKRiHnZBg6h
 ynLQoCYdKjYdleF+lH3dOGJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYx6TSCK17L6
 I2aT/H3Ygf/gWctaD1MsspvlTs21BjMkGJA1rABTa0T1LPuvyF9JI4SI6i3M0z5TuF8dgJtb
 7+epF0R1jqxEyYFUrtJoJ6iGqE5auK60Ty1t5Zjc/PKbi5q+3ZuiPZrbJLwXm8M49mBt4gZJ
 NygLvVcQy9xVkHHsLx1vxW1j0iSMIUekIIrL0RTvuS1/RHXXCWxwslEUlptIoY648F+OXBRo
 KlwxDAlNnhvhsqM/46bZ9kpvZ5mBo/xI58f/3hsiz3UZRokacmYH+OTvocehml2350TdRrdT
 5NxhT5HcBPKYhRUfE0QBZI7keOAnGbjc3hRoVmVqKxx72W7IAlZiee9b4qFJY3ULSlTtlaWr
 z3s1EjiPgMbOtqT+DiI2UKKn/CayEsXX6pXTtVU7MVCmVCW2ykfBQMbUXO9pv+2jFP4XMhQQ
 2QM9zYjt+43/V2nQ935dxm5pneeuVgbQdU4LgEhwBuS1qrZ80OCXC0OCCRedNxjvcNwSTFCO
 kK1ou4FzAdH6NW9IU9xPJ/N9Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:/PDCNKP8T1EHW8BcTvCjsMiBIKoaSvp037Eqv3ocdfUzSL3+qy
 nOpoV+6faaslgssR0b8+xofZPwIk80lqQFhLX5X43CYOCOggLBR72Kr7GSoQEIcxeOkNK1vp
 0OT0ERMrDN5Q8Qt7eD3ODBKbYdKY68gdmVuds=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.96,198,1665439200"; d="scan'208";a="178788796"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-3.itc.rwth-aachen.de with ESMTP; 27 Nov 2022 14:21:32 +0100
Received: from localhost.localdomain (2a02:908:1088:5920:e2b3:9876:72f1:5569)
 by RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20; Sun, 27 Nov 2022 14:21:32 +0100
From: <tobias.roehmel@rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <tobias.roehmel@rwth-aachen.de>
Subject: [PATCH v5 7/7] target/arm: Add ARM Cortex-R52 CPU
Date: Sun, 27 Nov 2022 14:21:12 +0100
Message-ID: <20221127132112.300331-8-tobias.roehmel@rwth-aachen.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127132112.300331-1-tobias.roehmel@rwth-aachen.de>
References: <20221127132112.300331-1-tobias.roehmel@rwth-aachen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:e2b3:9876:72f1:5569]
X-ClientProxiedBy: rwthex-s1-a.rwth-ad.de (2a00:8a60:1:e500::26:152) To
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

All constants are taken from the ARM Cortex-R52 Processor TRM Revision: r1p3

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
---
 target/arm/cpu_tcg.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 60ff539fa1..ae08322758 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -853,6 +853,47 @@ static void cortex_r5_initfn(Object *obj)
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
@@ -1161,6 +1202,7 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
                              .class_init = arm_v7m_class_init },
     { .name = "cortex-r5",   .initfn = cortex_r5_initfn },
     { .name = "cortex-r5f",  .initfn = cortex_r5f_initfn },
+    { .name = "cortex-r52",  .initfn = cortex_r52_initfn },
     { .name = "ti925t",      .initfn = ti925t_initfn },
     { .name = "sa1100",      .initfn = sa1100_initfn },
     { .name = "sa1110",      .initfn = sa1110_initfn },
-- 
2.34.1


