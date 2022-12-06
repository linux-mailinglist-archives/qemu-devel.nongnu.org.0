Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C9C64413A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 11:27:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2V9H-0007ES-Ur; Tue, 06 Dec 2022 05:26:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1p2V91-0007Dg-38
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:25:47 -0500
Received: from mail-out-2a.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1p2V8t-000292-SL
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:25:45 -0500
X-IPAS-Result: =?us-ascii?q?A2ASBACWF49j/5sagoZaHQEBAQEJARIBBQUBQIFPhQuET?=
 =?us-ascii?q?pEfnzMPAQEBAQEBAQEBCAFEBAEBhQECAgKFDyY4EwECBAEBAQEDAgMBAQEBA?=
 =?us-ascii?q?QEDAQEGAQEBAQEBBgSBHYUvRoZWAgEDIwQLAUYQIAUCJgICVwYOBYJ+gyOtS?=
 =?us-ascii?q?n8zgQGEcZxNCQGBCiyJCIJOhUKCUIJRgTd1hGEwgwqCZwSKOoxbDm4cNwMJA?=
 =?us-ascii?q?wcFLB1AAwsYDRYyChMyNQsRTCscGweBDCooFQMEBAMCBhMDIAINKDEUBCkTD?=
 =?us-ascii?q?SsmbQkCAyFhBQMDBCgsAwlAByYmPAdWNwUDAg8gOAYDCQMCH1R0LxIUBQMLF?=
 =?us-ascii?q?SUIBUkECDcFBlMSAgoREg8sRQ5IPjkWBidBATAODhMDXUsdgQEEYDmBFS8um?=
 =?us-ascii?q?xOBDoJAkw+OU6FNB4Ifog5Mln0Ckh2XQKMqhCgCBAIEBQIWgXmBfnGDNlIXA?=
 =?us-ascii?q?g+OLBaOL3Q7AgcBCgEBAwmKHwEB?=
IronPort-Data: A9a23:mVjGRK7QPSEnWdmihGhrLgxRtGTGchMFZxGqfqrLsTDasY5as4F+v
 jEbWG6POP6LazGhfop2Yd6w8kIC7ZGGyIBmTwpv+XszZn8b8sCt6fZ1j6vTF37IcpeTHBoPA
 +E2MISowBUcFyeEzvuVGuG96yM6jMlkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1rlV
 eja/ouOZjdJ5xYuajhOsvjb9ks11BjPkGpwUmIWNKgjUGD2yiF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum1hK6b5Ofbi1q/UTe5I5mbqZGORcP49m+t4sZJ
 N1l7fRcQOqyV0HGsLx1vxJwS0mSMUDakVPKCSDXjCCd86HJW1XJ7NtePG09Aa5C/+coJUpiq
 /8pKy9YO3hvh8ruqF66YtNTuuQOHIzQZsY1/Gt/0TGcBPpgTZ2rr6fivIQEmm5r3oYUQ7CHO
 pdxhTlHNXwsZzVTPV0WAYl4huClhnzydxVCt06V4KM+6Gjeykp93dABNfKOIobVFJgEwi50o
 Er++TvzXBQIJODGyGTb7zGL2eGQnxn0Ddd6+LqQs6QCbEeo7nUeDQBTWValrP2RjEm4VNRCb
 UsO9UIGtaUu+VbtS9DsUxC8pFaAvxgVQd0WFPc1gDxh0YLO/BqZC3hBVWQEYpo8q9M2ADUmk
 FOE9z/0OQFSXHSuYSr13t+pQfmaYED58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:9ospdKuUkBJEMMvpcXcy94Ah7skDmdV00zEX/kB9WHVpW+SSi9
 qj2M8WzBnulTYXVjUBtLm7VZWoaXjB75Iw2oUJO6y+Rk3avgKTXfhfBOzZskDd8kzFh5RgPM
 JbGZSWZ+eeMbEXt6fHCWqDYq0dKbu8gcOVbI7lph8HcegAUcFdBmlCZDqzLnxKZCQuP/YE/O
 Xw3LshmxOQPVwdct62QlkDUO6rnayvqHrsCSR2fyLPkDP+7w+A2frAHwGfxQp2aUIq/V9EmV
 K19TDE2g==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.96,222,1665439200"; d="scan'208";a="30279594"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-2a.itc.rwth-aachen.de with ESMTP; 06 Dec 2022 11:25:32 +0100
Received: from localhost.localdomain (2a02:908:1088:5920:7fc5:a897:a756:e2fb)
 by RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20; Tue, 6 Dec 2022 11:25:32 +0100
From: <tobias.roehmel@rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <tobias.roehmel@rwth-aachen.de>
Subject: [PATCH v6 7/7] target/arm: Add ARM Cortex-R52 CPU
Date: Tue, 6 Dec 2022 11:25:04 +0100
Message-ID: <20221206102504.165775-8-tobias.roehmel@rwth-aachen.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206102504.165775-1-tobias.roehmel@rwth-aachen.de>
References: <20221206102504.165775-1-tobias.roehmel@rwth-aachen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:7fc5:a897:a756:e2fb]
X-ClientProxiedBy: rwthex-s2-a.rwth-ad.de (2a00:8a60:1:e500::26:154) To
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>

All constants are taken from the ARM Cortex-R52 Processor TRM Revision: r1p3

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu_tcg.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 9a2cef7d05..a9e407ccf3 100644
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
@@ -1162,6 +1203,7 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
                              .class_init = arm_v7m_class_init },
     { .name = "cortex-r5",   .initfn = cortex_r5_initfn },
     { .name = "cortex-r5f",  .initfn = cortex_r5f_initfn },
+    { .name = "cortex-r52",  .initfn = cortex_r52_initfn },
     { .name = "ti925t",      .initfn = ti925t_initfn },
     { .name = "sa1100",      .initfn = sa1100_initfn },
     { .name = "sa1110",      .initfn = sa1110_initfn },
-- 
2.34.1


