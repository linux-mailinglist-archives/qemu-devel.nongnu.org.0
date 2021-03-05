Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA7632EE99
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:22:16 +0100 (CET)
Received: from localhost ([::1]:45418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICHP-0004vj-3I
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:22:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lIBwP-000257-N4
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:00:33 -0500
Received: from mx2.suse.de ([195.135.220.15]:59942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lIBwI-00040H-4k
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:00:33 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DADE6AFF9;
 Fri,  5 Mar 2021 14:59:55 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v4 25/33] target/arm: cpu: fix style
Date: Fri,  5 Mar 2021 15:59:33 +0100
Message-Id: <20210305145941.32020-26-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210305145941.32020-1-cfontana@suse.de>
References: <20210305145941.32020-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/cpu-sysemu.c | 17 +++++++++++------
 target/arm/cpu32.c      | 12 ++++++++----
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
index 126263dbf4..eb928832a9 100644
--- a/target/arm/cpu-sysemu.c
+++ b/target/arm/cpu-sysemu.c
@@ -372,7 +372,8 @@ int sve_exception_el(CPUARMState *env, int el)
     if (el <= 1 && (hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
         bool disabled = false;
 
-        /* The CPACR.ZEN controls traps to EL1:
+        /*
+         * The CPACR.ZEN controls traps to EL1:
          * 0, 2 : trap EL0 and EL1 accesses
          * 1    : trap only EL0 accesses
          * 3    : trap no accesses
@@ -398,7 +399,8 @@ int sve_exception_el(CPUARMState *env, int el)
         }
     }
 
-    /* CPTR_EL2.  Since TZ and TFP are positive,
+    /*
+     * CPTR_EL2.  Since TZ and TFP are positive,
      * they will be zero when EL2 is not present.
      */
     if (el <= 2 && arm_is_el2_enabled(env)) {
@@ -625,10 +627,11 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
         new_mode = ARM_CPU_MODE_UND;
         addr = 0x04;
         mask = CPSR_I;
-        if (env->thumb)
+        if (env->thumb) {
             offset = 2;
-        else
+        } else {
             offset = 4;
+        }
         break;
     case EXCP_SWI:
         new_mode = ARM_CPU_MODE_SVC;
@@ -714,7 +717,8 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
         /* High vectors. When enabled, base address cannot be remapped. */
         addr += 0xffff0000;
     } else {
-        /* ARM v7 architectures provide a vector base address register to remap
+        /*
+         * ARM v7 architectures provide a vector base address register to remap
          * the interrupt vector table.
          * This register is only followed in non-monitor mode, and is banked.
          * Note: only bits 31:5 are valid.
@@ -1013,7 +1017,8 @@ void arm_log_exception(int idx)
     }
 }
 
-/* Handle a CPU exception for A and R profile CPUs.
+/*
+ * Handle a CPU exception for A and R profile CPUs.
  * Do any appropriate logging, handle PSCI calls, and then hand off
  * to the AArch64-entry or AArch32-entry function depending on the
  * target exception level's register width.
diff --git a/target/arm/cpu32.c b/target/arm/cpu32.c
index 0ddb5627a7..08e9506509 100644
--- a/target/arm/cpu32.c
+++ b/target/arm/cpu32.c
@@ -92,7 +92,8 @@ static void cortex_a8_initfn(Object *obj)
 }
 
 static const ARMCPRegInfo cortexa9_cp_reginfo[] = {
-    /* power_control should be set to maximum latency. Again,
+    /*
+     * power_control should be set to maximum latency. Again,
      * default to 0 and set by private hook
      */
     { .name = "A9_PWRCTL", .cp = 15, .crn = 15, .crm = 0, .opc1 = 0, .opc2 = 0,
@@ -129,7 +130,8 @@ static void cortex_a9_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
-    /* Note that A9 supports the MP extensions even for
+    /*
+     * Note that A9 supports the MP extensions even for
      * A9UP and single-core A9MP (which are both different
      * and valid configurations; we don't model A9UP).
      */
@@ -166,7 +168,8 @@ static uint64_t a15_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
 
-    /* Linux wants the number of processors from here.
+    /*
+     * Linux wants the number of processors from here.
      * Might as well set the interrupt-controller bit too.
      */
     return ((ms->smp.cpus - 1) << 24) | (1 << 23);
@@ -213,7 +216,8 @@ static void cortex_a7_initfn(Object *obj)
     cpu->isar.id_mmfr1 = 0x40000000;
     cpu->isar.id_mmfr2 = 0x01240000;
     cpu->isar.id_mmfr3 = 0x02102211;
-    /* a7_mpcore_r0p5_trm, page 4-4 gives 0x01101110; but
+    /*
+     * a7_mpcore_r0p5_trm, page 4-4 gives 0x01101110; but
      * table 4-41 gives 0x02101110, which includes the arm div insns.
      */
     cpu->isar.id_isar0 = 0x02101110;
-- 
2.26.2


