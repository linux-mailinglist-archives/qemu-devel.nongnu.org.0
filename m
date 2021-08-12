Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5C33E9E67
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 08:24:21 +0200 (CEST)
Received: from localhost ([::1]:58676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE48a-0000lh-Ux
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 02:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mE46J-0004xW-Ul; Thu, 12 Aug 2021 02:21:59 -0400
Received: from esa6.hc1455-7.c3s2.iphmx.com ([68.232.139.139]:6650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mE46H-00014F-BN; Thu, 12 Aug 2021 02:21:59 -0400
IronPort-SDR: vuq6E+nTZJwfP8Mh/kl1afXj8qf/CCTnRIVCz8IkEKt89+hMJymE4htmqE719MxjkZGMtrGxIF
 zVRRF1z2dAgxIQX/msdlfLLQnc7Z6yXoXqVsIckgaLBSfI7L4xvozKyuUih2CHVdm145sFzzOr
 OP9xeyTEg8Oqzlv0JlJSlw4p5aWhbK5JBDs0vnef+qOgTXnqqEh3CzVD2nPM/10CZHV1iaqtOw
 VAkTPiHOEmms+CmBtYfPd/TfoKbKvbnPWgWTM9O12FZ5ZOijwqgdkY3xINvRoItIym4yWZWqQq
 HNiqC9sj/PjeA6mPr6pBUkh/
X-IronPort-AV: E=McAfee;i="6200,9189,10073"; a="39964537"
X-IronPort-AV: E=Sophos;i="5.84,315,1620658800"; d="scan'208";a="39964537"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
 by esa6.hc1455-7.c3s2.iphmx.com with ESMTP; 12 Aug 2021 15:21:53 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com
 [192.168.83.64])
 by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3ADF06DB27;
 Thu, 12 Aug 2021 15:21:52 +0900 (JST)
Received: from yto-om2.fujitsu.com (yto-om2.o.css.fujitsu.com [10.128.89.163])
 by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 80BDCC9CCE;
 Thu, 12 Aug 2021 15:21:51 +0900 (JST)
Received: from localhost.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by yto-om2.fujitsu.com (Postfix) with ESMTP id 612344007B802;
 Thu, 12 Aug 2021 15:21:51 +0900 (JST)
From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
Date: Thu, 12 Aug 2021 15:04:38 +0900
Message-Id: <20210812060440.1330348-2-ishii.shuuichir@fujitsu.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210812060440.1330348-1-ishii.shuuichir@fujitsu.com>
References: <20210812060440.1330348-1-ishii.shuuichir@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
Received-SPF: pass client-ip=68.232.139.139;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa6.hc1455-7.c3s2.iphmx.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, qemu-devel@nongnu.org, ishii.shuuichir@fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a definition for the Fujitsu A64FX processor.

The A64FX processor does not implement the AArch32 Execution state,
so there are no associated AArch32 Identification registers.

For SVE, the A64FX processor supports only 128,256 and 512bit vector lengths.

Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
---
 target/arm/cpu.c   | 27 +++++++++++++++++++++++----
 target/arm/cpu.h   |  1 +
 target/arm/cpu64.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2866dd7658..162e46afc3 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1345,15 +1345,34 @@ static void arm_cpu_finalizefn(Object *obj)
 #endif
 }
 
+static void a64fx_cpu_set_sve(ARMCPU *cpu)
+{
+    /* Suppport of A64FX's vector length are 128,256 and 512bit only */
+    bitmap_zero(cpu->sve_vq_map, ARM_MAX_VQ);
+    bitmap_zero(cpu->sve_vq_init, ARM_MAX_VQ);
+    set_bit(0, cpu->sve_vq_map); /* 128bit */
+    set_bit(0, cpu->sve_vq_init);
+    set_bit(1, cpu->sve_vq_map); /* 256bit */
+    set_bit(1, cpu->sve_vq_init);
+    set_bit(3, cpu->sve_vq_map); /* 512bit */
+    set_bit(3, cpu->sve_vq_init);
+
+    cpu->sve_max_vq = find_last_bit(cpu->sve_vq_map, ARM_MAX_VQ) + 1;
+}
+
 void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
 {
     Error *local_err = NULL;
 
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        arm_cpu_sve_finalize(cpu, &local_err);
-        if (local_err != NULL) {
-            error_propagate(errp, local_err);
-            return;
+        if (arm_feature(&cpu->env, ARM_FEATURE_A64FX)) {
+            a64fx_cpu_set_sve(cpu);
+        } else {
+            arm_cpu_sve_finalize(cpu, &local_err);
+            if (local_err != NULL) {
+                error_propagate(errp, local_err);
+                return;
+            }
         }
 
         /*
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9f0a5f84d5..84ebca731a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2145,6 +2145,7 @@ enum arm_features {
     ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
     ARM_FEATURE_M_MAIN, /* M profile Main Extension */
     ARM_FEATURE_V8_1M, /* M profile extras only in v8.1M and later */
+    ARM_FEATURE_A64FX, /* Fujitsu A64FX processor */
 };
 
 static inline int arm_feature(CPUARMState *env, int feature)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c690318a9b..5e7e885f9d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -847,10 +847,52 @@ static void aarch64_max_initfn(Object *obj)
                         cpu_max_set_sve_max_vq, NULL, NULL);
 }
 
+static void aarch64_a64fx_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,a64fx";
+    set_feature(&cpu->env, ARM_FEATURE_A64FX);
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    cpu->midr = 0x461f0010;
+    cpu->revidr = 0x00000000;
+    cpu->ctr = 0x86668006;
+    cpu->reset_sctlr = 0x30000180;
+    cpu->isar.id_aa64pfr0 =   0x0000000101111111; /* No RAS Extensions */
+    cpu->isar.id_aa64pfr1 = 0x0000000000000000;
+    cpu->isar.id_aa64dfr0 = 0x0000000010305408;
+    cpu->isar.id_aa64dfr1 = 0x0000000000000000;
+    cpu->id_aa64afr0 = 0x0000000000000000;
+    cpu->id_aa64afr1 = 0x0000000000000000;
+    cpu->isar.id_aa64mmfr0 = 0x0000000000001122;
+    cpu->isar.id_aa64mmfr1 = 0x0000000011212100;
+    cpu->isar.id_aa64mmfr2 = 0x0000000000001011;
+    cpu->isar.id_aa64isar0 = 0x0000000010211120;
+    cpu->isar.id_aa64isar1 = 0x0000000000010001;
+    cpu->isar.id_aa64zfr0 = 0x0000000000000000;
+    cpu->clidr = 0x0000000080000023;
+    cpu->ccsidr[0] = 0x7007e01c; /* 64KB L1 dcache */
+    cpu->ccsidr[1] = 0x2007e01c; /* 64KB L1 icache */
+    cpu->ccsidr[2] = 0x70ffe07c; /* 8MB L2 cache */
+    cpu->dcz_blocksize = 6; /* 256 bytes */
+    cpu->gic_num_lrs = 4;
+    cpu->gic_vpribits = 5;
+    cpu->gic_vprebits = 5;
+
+    /* TODO:  Add A64FX specific HPC extension registers */
+}
+
 static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
     { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
     { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
+    { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
     { .name = "max",                .initfn = aarch64_max_initfn },
 };
 
-- 
2.27.0


