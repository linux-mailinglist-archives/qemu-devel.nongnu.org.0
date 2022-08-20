Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8857059AEBE
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Aug 2022 16:54:26 +0200 (CEST)
Received: from localhost ([::1]:35328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPPrk-0008G8-HI
	for lists+qemu-devel@lfdr.de; Sat, 20 Aug 2022 10:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1oPPKD-0005Fk-1N
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 10:19:45 -0400
Received: from mail-out-4.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:49]:45776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1oPPK8-0003nF-G5
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 10:19:44 -0400
X-IPAS-Result: =?us-ascii?q?A2D5AABk7ABj/5sagoZaHQEBAQEJARIBBQUBQIE+BQELA?=
 =?us-ascii?q?YR9hE6RD55/CwEBAQEBAQEBAQgBQgQBAYUDAgIChGImNwYOAQIEAQEBAQMCA?=
 =?us-ascii?q?wEBAQEBAQMBAQYBAQEBAQEGBIEchS9GhkMCAQMjBAsBRhAgBQImAgJXBg4Fg?=
 =?us-ascii?q?n2DI6kafzKBAYRwhRIJAYEHLAGID4IahSuCUIJRgTd1hGEwgwmCZQSVU4N7H?=
 =?us-ascii?q?DgDCQQHBSweQgMLHw4WBQgJFxIQEAIEERoLBgMWPgkCBA4DQAgNAxEEAw8YC?=
 =?us-ascii?q?RIIEAQGAzEMJQsDFAwBBgMGBQMBAxsDFAMFJAcDGQ8jDQ0EHwwDAwUlAwICG?=
 =?us-ascii?q?wcCAgMCBhUGAgI2GDkIBAgEKyMPBQIHLwUELwIeBAUGEQgCFgIGBAQEBBUCE?=
 =?us-ascii?q?AgCCCcXBxMzGQEFMicQCSEcDhoQBQYTAyBvBQc+DygzNTkrHRsKgRIqKRUDB?=
 =?us-ascii?q?AQDAgYTAwMiAhAuMQMVBikTEi0HK3UJAgMiaQUDAwQoLAMJPgcJIiY9BQVbO?=
 =?us-ascii?q?gUDAxAiPQYDCQMCKTybDYEOlT+OMaBkB4IWoUlMlnECkgGXB6MPhCcCBAIEB?=
 =?us-ascii?q?QIWgXeBf3GDNlEXAg+OLBaOMHM7AgYBCgEBAwmKXAEB?=
IronPort-Data: A9a23:WeaJo6sVVZ0FBvOBY0OurzXifOfnVOtcMUV32f8akzHdYApBsoF/q
 tZmKWjTb/ffZGTze4oibIqzpE9TuZGBmNNjGQc6qS80Ri1BgMeUXt7xwmUcns+xBpCZEBg3v
 512hv3odp1coqr0/0/1WlTZhSAgk/nOH9IQMcacUsxLbVYMpBwJ1FQywIbVvqYy2YLjW1PX4
 YuoyyHiEAbNNwBcYzp8B52r9UsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaEIdgKOf
 Nsv+Znilo/v10p3Von1wu6TnnoiGdY+NSDW4pZftjPLbhJq/kTe2Y5jXBYQhNs+Zzihx7hMJ
 NtxWZOYeBcqGqnSt+AkfCJ7DDxnG/Ab1JDJLi3q2SCT5xWun3rE+cpSLGwGeLZCv8wxG35S9
 bkRJHYBY3hvhcrvm+79E7I0wJ59apC2YevzuVk5pd3dJeohS5HKWOPQ4tJY2To0rtpRAfabb
 sMSaTdpKhjNC/FKEg5KU8Jix7z11xETdRUJpm3OpIA94FPd5w9P/5zGEOjJINOzEJA9ckGw4
 ziuE37CKggXMcHaxTeb/3aEgOjJkiXmHoUIG9WQ7vN2jUfVw2UCBBASUXO/oP+wkEn4XMhQQ
 3H44QI0srQy+VzuVYO4VVuiv2KE+xcQHdZdewEn1DywJmPvy17xLgA5ovRpM7TKaOdeqeQW6
 2K0
IronPort-HdrOrdr: A9a23:ILE7jqi/AOHKvv1HjudlnQz0GHBQXusji2hC6mlwRA09TySZ//
 rDoB19726StN9xYgBFpTnuAse9qB/nn6KdpLNhXotKPzOW3VdATrsC0WKK+VSJcBEWtNQtt5
 uIG5IObuEYZmIUsS+V2mSF+4FK+qj+zEnRv4fjJiBWPHhXV50=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.93,251,1654552800"; d="scan'208";a="153843359"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-4.itc.rwth-aachen.de with ESMTP; 20 Aug 2022 16:19:29 +0200
Received: from localhost.localdomain (2a02:908:1088:5920:e70b:29db:1db5:28bf)
 by RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Sat, 20 Aug 2022 16:19:27 +0200
From: <tobias.roehmel@rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <tobias.roehmel@rwth-aachen.de>
Subject: [PATCH v3 9/9] target/arm: Add ARM Cortex-R52 cpu
Date: Sat, 20 Aug 2022 16:19:14 +0200
Message-ID: <20220820141914.217399-10-tobias.roehmel@rwth-aachen.de>
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

All constants are taken from the ARM Cortex-R52 Processor TRM Revision: r1p3

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
---
 target/arm/cpu_tcg.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index b751a19c8a..e0f445dc91 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -843,6 +843,47 @@ static void cortex_r5_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortexr5_cp_reginfo);
 }
 
+static void cortex_r52_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_V8_R);
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
+}
+
 static void cortex_r5f_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -1149,6 +1190,7 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
                              .class_init = arm_v7m_class_init },
     { .name = "cortex-r5",   .initfn = cortex_r5_initfn },
     { .name = "cortex-r5f",  .initfn = cortex_r5f_initfn },
+    { .name = "cortex-r52",  .initfn = cortex_r52_initfn },
     { .name = "ti925t",      .initfn = ti925t_initfn },
     { .name = "sa1100",      .initfn = sa1100_initfn },
     { .name = "sa1110",      .initfn = sa1110_initfn },
-- 
2.25.1


