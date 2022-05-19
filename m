Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4F452DC4F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 20:05:55 +0200 (CEST)
Received: from localhost ([::1]:35954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrkX4-0004Fv-4B
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 14:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk5K-0006U4-7K
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:14 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:36681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk5F-0000sC-IC
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:13 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 a14-20020a7bc1ce000000b00393fb52a386so5464340wmj.1
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 10:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FynhDtYvj3CxzRLSU4kAPvr9JvgtqP8FYx4t0cBZfdo=;
 b=sCleLE3+GRF7BkRcXrtM2g4vH9rq4MNTLDHIam2tzpoeQgMOSaqwuF3sneE1KhDN1u
 bKO0OhbH+8bh1v3weUKRgL6aw0oTn+KS+PZTyxz2FMU+W0zGHeVX/P+HocbCVvBacWac
 I+TV7OVXJhDMF0AXqspY7EYdUUsvz3K9Dh3pK8mhAreewFz0hqPWRipnuK0Bs3DxuUr2
 tysoiLAoTnL1gwIZwQzSSlhXRmoztAYV++rhTfdeZBYsPnmZTSuQFsapbdlt9hRQYIqJ
 BTP0O/WYgEdsEdpNXloFvhv25aRUP6HVzHI5sFjtGmo3nQ504qoBL/cnZuG3B9S4DRFl
 OcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FynhDtYvj3CxzRLSU4kAPvr9JvgtqP8FYx4t0cBZfdo=;
 b=tSwv0e+IehNFAGL/fHkIXqN/6AGXWNz3GEJCY6qKatJBUNwt9fQASebRUd8kBBQR9c
 RL4KDsmvVogfKqGPI0Dpc/d3t+66Qonptpy6xq8tT9WuQg/gQAWGCKxw0aIgSxZUKI9Z
 KRUsSmcV5PpWV4B+Q/tKNYF+N+D3YxwLEofOMNroobgtXnpFKTnR0BOVYxEt08X7PK/+
 wQqlTg17KXzbcaU68ITB/PYhsLpPNeunNiNQYgPAE1dsZOQnNPkx9KsRw4dnqJC+MyD8
 mIsdkYCYYKTCHjljVrsRVPdhAsGVA79rO1BqFr57gPwiRTQTcv1vsME40qZOvPFwpK7B
 qS4w==
X-Gm-Message-State: AOAM5334oNy0o4hoKXC31T4IDNbGiMTiA9BUp8iUv6A0TcoUwQSjI/ZS
 VIvW7GMgUx55y7qXtcbten3h0QoZAPT8Ug==
X-Google-Smtp-Source: ABdhPJxrmbYKy5kcEk3kjNJXdyYdxOsCE6dYb3VQbgem33HGr79nz9356F2hpDYX4+ooNeT47Txhsg==
X-Received: by 2002:a7b:c015:0:b0:397:3685:5148 with SMTP id
 c21-20020a7bc015000000b0039736855148mr920509wmb.174.1652981826987; 
 Thu, 19 May 2022 10:37:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfa742000000b0020c5253d8f2sm180183wrd.62.2022.05.19.10.37.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 10:37:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/22] target/arm: Make number of counters in PMCR follow the
 CPU
Date: Thu, 19 May 2022 18:36:45 +0100
Message-Id: <20220519173651.399295-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519173651.399295-1-peter.maydell@linaro.org>
References: <20220519173651.399295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Currently we give all the v7-and-up CPUs a PMU with 4 counters.  This
means that we don't provide the 6 counters that are required by the
Arm BSA (Base System Architecture) specification if the CPU supports
the Virtualization extensions.

Instead of having a single PMCR_NUM_COUNTERS, make each CPU type
specify the PMCR reset value (obtained from the appropriate TRM), and
use the 'N' field of that value to define the number of counters
provided.

This means that we now supply 6 counters instead of 4 for:
 Cortex-A9, Cortex-A15, Cortex-A53, Cortex-A57, Cortex-A72,
 Cortex-A76, Neoverse-N1, '-cpu max'
This CPU goes from 4 to 8 counters:
 A64FX
These CPUs remain with 4 counters:
 Cortex-A7, Cortex-A8
This CPU goes down from 4 to 3 counters:
 Cortex-R5

Note that because we now use the PMCR reset value of the specific
implementation, we no longer set the LC bit out of reset.  This has
an UNKNOWN value out of reset for all cores with any AArch32 support,
so guest software should be setting it anyway if it wants it.

This change was originally landed in commit f7fb73b8cdd3f7 (during
the 6.0 release cycle) but was then reverted by commit
21c2dd77a6aa517 before that release because it did not work with KVM.
This version fixes that by creating the scratch vCPU in
kvm_arm_get_host_cpu_features() with the KVM_ARM_VCPU_PMU_V3 feature
if KVM supports it, and then only asking KVM for the PMCR_EL0 value
if the vCPU has a PMU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
[PMM: Added the correct value for a64fx]
Message-id: 20220513122852.4063586-1-peter.maydell@linaro.org
---
 target/arm/cpu.h       |  1 +
 target/arm/internals.h |  4 +++-
 target/arm/cpu64.c     | 11 +++++++++++
 target/arm/cpu_tcg.c   |  6 ++++++
 target/arm/helper.c    | 25 ++++++++++++++-----------
 target/arm/kvm64.c     | 12 ++++++++++++
 6 files changed, 47 insertions(+), 12 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a42464eb57a..3dc79f121b5 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -965,6 +965,7 @@ struct ArchCPU {
         uint64_t id_aa64dfr0;
         uint64_t id_aa64dfr1;
         uint64_t id_aa64zfr0;
+        uint64_t reset_pmcr_el0;
     } isar;
     uint64_t midr;
     uint32_t revidr;
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 9b354eea7e4..b654bee4682 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1304,7 +1304,9 @@ enum MVEECIState {
 
 static inline uint32_t pmu_num_counters(CPUARMState *env)
 {
-  return (env->cp15.c9_pmcr & PMCRN_MASK) >> PMCRN_SHIFT;
+    ARMCPU *cpu = env_archcpu(env);
+
+    return (cpu->isar.reset_pmcr_el0 & PMCRN_MASK) >> PMCRN_SHIFT;
 }
 
 /* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 7628f4fa39d..a752b648568 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -79,6 +79,7 @@ static void aarch64_a57_initfn(Object *obj)
     cpu->isar.id_aa64isar0 = 0x00011120;
     cpu->isar.id_aa64mmfr0 = 0x00001124;
     cpu->isar.dbgdidr = 0x3516d000;
+    cpu->isar.reset_pmcr_el0 = 0x41013000;
     cpu->clidr = 0x0a200023;
     cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
     cpu->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
@@ -133,6 +134,7 @@ static void aarch64_a53_initfn(Object *obj)
     cpu->isar.id_aa64isar0 = 0x00011120;
     cpu->isar.id_aa64mmfr0 = 0x00001122; /* 40 bit physical addr */
     cpu->isar.dbgdidr = 0x3516d000;
+    cpu->isar.reset_pmcr_el0 = 0x41033000;
     cpu->clidr = 0x0a200023;
     cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
     cpu->ccsidr[1] = 0x201fe00a; /* 32KB L1 icache */
@@ -185,6 +187,7 @@ static void aarch64_a72_initfn(Object *obj)
     cpu->isar.id_aa64isar0 = 0x00011120;
     cpu->isar.id_aa64mmfr0 = 0x00001124;
     cpu->isar.dbgdidr = 0x3516d000;
+    cpu->isar.reset_pmcr_el0 = 0x41023000;
     cpu->clidr = 0x0a200023;
     cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
     cpu->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
@@ -261,6 +264,9 @@ static void aarch64_a76_initfn(Object *obj)
     cpu->isar.mvfr0 = 0x10110222;
     cpu->isar.mvfr1 = 0x13211111;
     cpu->isar.mvfr2 = 0x00000043;
+
+    /* From D5.1 AArch64 PMU register summary */
+    cpu->isar.reset_pmcr_el0 = 0x410b3000;
 }
 
 static void aarch64_neoverse_n1_initfn(Object *obj)
@@ -327,6 +333,9 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
     cpu->isar.mvfr0 = 0x10110222;
     cpu->isar.mvfr1 = 0x13211111;
     cpu->isar.mvfr2 = 0x00000043;
+
+    /* From D5.1 AArch64 PMU register summary */
+    cpu->isar.reset_pmcr_el0 = 0x410c3000;
 }
 
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
@@ -1022,6 +1031,8 @@ static void aarch64_a64fx_initfn(Object *obj)
     set_bit(1, cpu->sve_vq_supported); /* 256bit */
     set_bit(3, cpu->sve_vq_supported); /* 512bit */
 
+    cpu->isar.reset_pmcr_el0 = 0x46014040;
+
     /* TODO:  Add A64FX specific HPC extension registers */
 }
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index ea4eccddc35..b751a19c8a7 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -425,6 +425,7 @@ static void cortex_a8_initfn(Object *obj)
     cpu->ccsidr[1] = 0x2007e01a; /* 16k L1 icache. */
     cpu->ccsidr[2] = 0xf0000000; /* No L2 icache. */
     cpu->reset_auxcr = 2;
+    cpu->isar.reset_pmcr_el0 = 0x41002000;
     define_arm_cp_regs(cpu, cortexa8_cp_reginfo);
 }
 
@@ -496,6 +497,7 @@ static void cortex_a9_initfn(Object *obj)
     cpu->clidr = (1 << 27) | (1 << 24) | 3;
     cpu->ccsidr[0] = 0xe00fe019; /* 16k L1 dcache. */
     cpu->ccsidr[1] = 0x200fe019; /* 16k L1 icache. */
+    cpu->isar.reset_pmcr_el0 = 0x41093000;
     define_arm_cp_regs(cpu, cortexa9_cp_reginfo);
 }
 
@@ -565,6 +567,7 @@ static void cortex_a7_initfn(Object *obj)
     cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
     cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
     cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
+    cpu->isar.reset_pmcr_el0 = 0x41072000;
     define_arm_cp_regs(cpu, cortexa15_cp_reginfo); /* Same as A15 */
 }
 
@@ -607,6 +610,7 @@ static void cortex_a15_initfn(Object *obj)
     cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
     cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
     cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
+    cpu->isar.reset_pmcr_el0 = 0x410F3000;
     define_arm_cp_regs(cpu, cortexa15_cp_reginfo);
 }
 
@@ -835,6 +839,7 @@ static void cortex_r5_initfn(Object *obj)
     cpu->isar.id_isar6 = 0x0;
     cpu->mp_is_up = true;
     cpu->pmsav7_dregion = 16;
+    cpu->isar.reset_pmcr_el0 = 0x41151800;
     define_arm_cp_regs(cpu, cortexr5_cp_reginfo);
 }
 
@@ -1093,6 +1098,7 @@ static void arm_max_initfn(Object *obj)
     cpu->isar.id_isar5 = 0x00011121;
     cpu->isar.id_isar6 = 0;
     cpu->isar.dbgdidr = 0x3516d000;
+    cpu->isar.reset_pmcr_el0 = 0x41013000;
     cpu->clidr = 0x0a200023;
     cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
     cpu->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d4db21dc92c..aa7a8e05721 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -39,7 +39,6 @@
 #include "cpregs.h"
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
-#define PMCR_NUM_COUNTERS 4 /* QEMU IMPDEF choice */
 
 #ifndef CONFIG_USER_ONLY
 
@@ -5544,13 +5543,6 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .resetvalue = 0,
       .writefn = gt_hyp_ctl_write, .raw_writefn = raw_write },
 #endif
-    /* The only field of MDCR_EL2 that has a defined architectural reset value
-     * is MDCR_EL2.HPMN which should reset to the value of PMCR_EL0.N.
-     */
-    { .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 1,
-      .access = PL2_RW, .resetvalue = PMCR_NUM_COUNTERS,
-      .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el2), },
     { .name = "HPFAR", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 4,
       .access = PL2_RW, .accessfn = access_el3_aa32ns,
@@ -6604,7 +6596,7 @@ static void define_pmu_regs(ARMCPU *cpu)
      * field as main ID register, and we implement four counters in
      * addition to the cycle count register.
      */
-    unsigned int i, pmcrn = PMCR_NUM_COUNTERS;
+    unsigned int i, pmcrn = pmu_num_counters(&cpu->env);
     ARMCPRegInfo pmcr = {
         .name = "PMCR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 0,
         .access = PL0_RW,
@@ -6619,10 +6611,10 @@ static void define_pmu_regs(ARMCPU *cpu)
         .access = PL0_RW, .accessfn = pmreg_access,
         .type = ARM_CP_IO,
         .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcr),
-        .resetvalue = (cpu->midr & 0xff000000) | (pmcrn << PMCRN_SHIFT) |
-                      PMCRLC,
+        .resetvalue = cpu->isar.reset_pmcr_el0,
         .writefn = pmcr_write, .raw_writefn = raw_write,
     };
+
     define_one_arm_cp_reg(cpu, &pmcr);
     define_one_arm_cp_reg(cpu, &pmcr64);
     for (i = 0; i < pmcrn; i++) {
@@ -7979,6 +7971,17 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .type = ARM_CP_EL3_NO_EL2_C_NZ,
               .fieldoffset = offsetof(CPUARMState, cp15.vmpidr_el2) },
         };
+        /*
+         * The only field of MDCR_EL2 that has a defined architectural reset
+         * value is MDCR_EL2.HPMN which should reset to the value of PMCR_EL0.N.
+         */
+        ARMCPRegInfo mdcr_el2 = {
+            .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
+            .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 1,
+            .access = PL2_RW, .resetvalue = pmu_num_counters(env),
+            .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el2),
+        };
+        define_one_arm_cp_reg(cpu, &mdcr_el2);
         define_arm_cp_regs(cpu, vpidr_regs);
         define_arm_cp_regs(cpu, el2_cp_reginfo);
         if (arm_feature(env, ARM_FEATURE_V8)) {
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index b8cfaf5782a..363032da903 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -505,6 +505,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
      */
     int fdarray[3];
     bool sve_supported;
+    bool pmu_supported = false;
     uint64_t features = 0;
     uint64_t t;
     int err;
@@ -537,6 +538,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                              1 << KVM_ARM_VCPU_PTRAUTH_GENERIC);
     }
 
+    if (kvm_arm_pmu_supported()) {
+        init.features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
+        pmu_supported = true;
+    }
+
     if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
         return false;
     }
@@ -659,6 +665,12 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
             dbgdidr |= (1 << 15); /* RES1 bit */
             ahcf->isar.dbgdidr = dbgdidr;
         }
+
+        if (pmu_supported) {
+            /* PMCR_EL0 is only accessible if the vCPU has feature PMU_V3 */
+            err |= read_sys_reg64(fdarray[2], &ahcf->isar.reset_pmcr_el0,
+                                  ARM64_SYS_REG(3, 3, 9, 12, 0));
+        }
     }
 
     sve_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE) > 0;
-- 
2.25.1


