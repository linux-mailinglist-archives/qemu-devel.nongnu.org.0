Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AED39BD64
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:39:39 +0200 (CEST)
Received: from localhost ([::1]:49402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCrC-0003gN-NU
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCIT-0000oO-SM
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:03:45 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:34524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCHy-0005wT-48
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:03:45 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso4509129wmc.1
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pdzAt2AXoQ9lDlpGyixAMgmXVwO3iRo3io77IDow6qA=;
 b=SQwdWupWuVopNCIEc/t23+QezyJZGaovRIliiKt2U9V3Op00Yl5bJlEbyEXdYtMH8X
 EpLpAWljNaRn1hn7vda6/LVVJAicIUk6kc5TAzIXILxujTM2Et1Iqac4mYGSXY8HfGjz
 hhOmDvQZqqBJjX2RTfMwc3wJnRi8NHrILaRoTb4V59+QAb7zZ5YTgcaurAWv2ShcpxXi
 JWqf/yRjvOXG/gthaknmD8myejdZgjHo9RWRzoltujdmoW7l25lYwHvFB1ctsiwrD9BI
 QpDRIZ7no008gl5ofVa4eV7wr23lZYNjED81G5rM8rAXvU7tv+YDHdEKnu4SdyHcAY5X
 R4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pdzAt2AXoQ9lDlpGyixAMgmXVwO3iRo3io77IDow6qA=;
 b=CxyHMCAZMob5ZJ8bRzMHX+gx4EFXLXvv0wAdKSLJmuoSDbMz/NlTSvxqx3L/R8aXx5
 BzDiBTt/dJxuHp7BRBp1uQi/9E8Fj+QvgvE0kXn72TBBjkYAM5OKSPrdnmPHZzzi9aVh
 O84drVFG0uuak/PoK8UZfncq+odIpz6CsMlnVL3zd45i8lWfeHvqsGG6j2ol+LBJWvJi
 V1Tb08l0cljtVljp7hp8QX6UF3lGw6mj5nl11YvU0fNzA+ih2oISXBP7Ost3FCxsRFNb
 PjFwLglzJCXDV2QxRfPDCDeFdQ8pVM5cg0j8s3UetO0Z8wHiC8WJptvL98RrDYwVs0+9
 1nUQ==
X-Gm-Message-State: AOAM533EGP5/dGxBErLqMsXLFc6vjy7WnrngkUX2emsWAEHQ6uZGSNDF
 zKT7MEAWO5aa+BzbDOiX52+L0g==
X-Google-Smtp-Source: ABdhPJxFZyWrY6CVppaRmUsSYj1Ec5/KlmbX717CKXs9sfM0imnuQxprKctoxFhlq66lDRKa4PuAHA==
X-Received: by 2002:a7b:c853:: with SMTP id c19mr4464373wml.30.1622822585348; 
 Fri, 04 Jun 2021 09:03:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r7sm11380294wma.9.2021.06.04.09.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:02:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 455B01FFC2;
 Fri,  4 Jun 2021 16:53:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 43/99] target/arm: move a15 cpu model away from the
 TCG-only models
Date: Fri,  4 Jun 2021 16:52:16 +0100
Message-Id: <20210604155312.15902-44-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

Cortex-A15 is the only ARM cpu class we need in KVM too.

We will be able to move it to tcg/ once the board code and configurations
are fixed.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu32.h   |  4 +++
 target/arm/cpu32.c   | 73 ++++++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu_tcg.c | 67 ----------------------------------------
 3 files changed, 77 insertions(+), 67 deletions(-)

diff --git a/target/arm/cpu32.h b/target/arm/cpu32.h
index 128d0c9247..abd575d47d 100644
--- a/target/arm/cpu32.h
+++ b/target/arm/cpu32.h
@@ -21,8 +21,12 @@
 #ifndef ARM_CPU32_H
 #define ARM_CPU32_H
 
+#include "cpregs.h"
+
 void arm32_cpu_dump_state(CPUState *cs, FILE *f, int flags);
 void arm32_cpu_class_init(ObjectClass *oc, void *data);
 void arm32_cpu_register(const ARMCPUInfo *info);
+void cortex_a15_initfn(Object *obj);
+extern const ARMCPRegInfo cortexa15_cp_reginfo[];
 
 #endif /* ARM_CPU32_H */
diff --git a/target/arm/cpu32.c b/target/arm/cpu32.c
index c03f420ba2..a6ba91ae08 100644
--- a/target/arm/cpu32.c
+++ b/target/arm/cpu32.c
@@ -43,8 +43,81 @@
 #include "cpu-mmu.h"
 #include "cpu32.h"
 
+#if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
+
+#ifndef CONFIG_USER_ONLY
+static uint64_t a15_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+
+    /*
+     * Linux wants the number of processors from here.
+     * Might as well set the interrupt-controller bit too.
+     */
+    return ((ms->smp.cpus - 1) << 24) | (1 << 23);
+}
+#endif
+
+const ARMCPRegInfo cortexa15_cp_reginfo[] = {
+#ifndef CONFIG_USER_ONLY
+    { .name = "L2CTLR", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 2,
+      .access = PL1_RW, .resetvalue = 0, .readfn = a15_l2ctlr_read,
+      .writefn = arm_cp_write_ignore, },
+#endif
+    { .name = "L2ECTLR", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 3,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    REGINFO_SENTINEL
+};
+
+void cortex_a15_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a15";
+    set_feature(&cpu->env, ARM_FEATURE_V7VE);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A15;
+    cpu->midr = 0x412fc0f1;
+    cpu->reset_fpsid = 0x410430f0;
+    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr1 = 0x11111111;
+    cpu->ctr = 0x8444c004;
+    cpu->reset_sctlr = 0x00c50078;
+    cpu->isar.id_pfr0 = 0x00001131;
+    cpu->isar.id_pfr1 = 0x00011011;
+    cpu->isar.id_dfr0 = 0x02010555;
+    cpu->id_afr0 = 0x00000000;
+    cpu->isar.id_mmfr0 = 0x10201105;
+    cpu->isar.id_mmfr1 = 0x20000000;
+    cpu->isar.id_mmfr2 = 0x01240000;
+    cpu->isar.id_mmfr3 = 0x02102211;
+    cpu->isar.id_isar0 = 0x02101110;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232041;
+    cpu->isar.id_isar3 = 0x11112131;
+    cpu->isar.id_isar4 = 0x10011142;
+    cpu->isar.dbgdidr = 0x3515f021;
+    cpu->clidr = 0x0a200023;
+    cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
+    cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
+    cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
+    define_arm_cp_regs(cpu, cortexa15_cp_reginfo);
+}
+
+#endif /* !CONFIG_USER_ONLY || !TARGET_AARCH64 */
+
 /* we can move this to tcg/ after the cleanup of ARM boards configurations */
 static const ARMCPUInfo arm32_cpus[] = {
+#if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
+    { .name = "cortex-a15",  .initfn = cortex_a15_initfn },
+#endif /* !CONFIG_USER_ONLY || !TARGET_AARCH64 */
 };
 
 static gchar *arm_gdb_arch_name(CPUState *cs)
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 09eff9bfd2..fe422498c7 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -378,30 +378,6 @@ static void cortex_a9_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortexa9_cp_reginfo);
 }
 
-#ifndef CONFIG_USER_ONLY
-static uint64_t a15_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
-{
-    MachineState *ms = MACHINE(qdev_get_machine());
-
-    /*
-     * Linux wants the number of processors from here.
-     * Might as well set the interrupt-controller bit too.
-     */
-    return ((ms->smp.cpus - 1) << 24) | (1 << 23);
-}
-#endif
-
-static const ARMCPRegInfo cortexa15_cp_reginfo[] = {
-#ifndef CONFIG_USER_ONLY
-    { .name = "L2CTLR", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 2,
-      .access = PL1_RW, .resetvalue = 0, .readfn = a15_l2ctlr_read,
-      .writefn = arm_cp_write_ignore, },
-#endif
-    { .name = "L2ECTLR", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 3,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    REGINFO_SENTINEL
-};
-
 static void cortex_a7_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -448,48 +424,6 @@ static void cortex_a7_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortexa15_cp_reginfo); /* Same as A15 */
 }
 
-static void cortex_a15_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    cpu->dtb_compatible = "arm,cortex-a15";
-    set_feature(&cpu->env, ARM_FEATURE_V7VE);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
-    cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A15;
-    cpu->midr = 0x412fc0f1;
-    cpu->reset_fpsid = 0x410430f0;
-    cpu->isar.mvfr0 = 0x10110222;
-    cpu->isar.mvfr1 = 0x11111111;
-    cpu->ctr = 0x8444c004;
-    cpu->reset_sctlr = 0x00c50078;
-    cpu->isar.id_pfr0 = 0x00001131;
-    cpu->isar.id_pfr1 = 0x00011011;
-    cpu->isar.id_dfr0 = 0x02010555;
-    cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x10201105;
-    cpu->isar.id_mmfr1 = 0x20000000;
-    cpu->isar.id_mmfr2 = 0x01240000;
-    cpu->isar.id_mmfr3 = 0x02102211;
-    cpu->isar.id_isar0 = 0x02101110;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232041;
-    cpu->isar.id_isar3 = 0x11112131;
-    cpu->isar.id_isar4 = 0x10011142;
-    cpu->isar.dbgdidr = 0x3515f021;
-    cpu->clidr = 0x0a200023;
-    cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
-    cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
-    cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
-    define_arm_cp_regs(cpu, cortexa15_cp_reginfo);
-}
-
 static void cortex_m0_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -1022,7 +956,6 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
     { .name = "cortex-a7",   .initfn = cortex_a7_initfn },
     { .name = "cortex-a8",   .initfn = cortex_a8_initfn },
     { .name = "cortex-a9",   .initfn = cortex_a9_initfn },
-    { .name = "cortex-a15",  .initfn = cortex_a15_initfn },
     { .name = "cortex-m0",   .initfn = cortex_m0_initfn,
                              .class_init = arm_v7m_class_init },
     { .name = "cortex-m3",   .initfn = cortex_m3_initfn,
-- 
2.20.1


