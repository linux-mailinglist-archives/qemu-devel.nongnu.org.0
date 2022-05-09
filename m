Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA67E51FCC7
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:28:40 +0200 (CEST)
Received: from localhost ([::1]:50858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2VD-0006nL-Te
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22g-0007eW-2J
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:10 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22e-0001Iy-5G
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:09 -0400
Received: by mail-wr1-x435.google.com with SMTP id k2so19091116wrd.5
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/KwXv4BlDQuOReLyYKnpu/uH4XylEzL/YqcY+RA23x8=;
 b=ETsqwWfYKvWmDa5OL3G8up9XfzlBpw+oToiaPw4dc4y52V/GFuukZpheq3XgDNUxmn
 DiaSw4fVg3SBJDypqxr6FktDPxupl0BexD5uKw3YO5CF++5Ejqr1QtYGR1bdRJOnECi2
 GnMDy4cZQ9SJz83VDXqYx0PM1dj3nxKNlG49JXqCq26VmU0ZQfuIho+zHJwR632b274u
 0c3uhLM5TaCqm/HY9tNGDKiBQ2F1zrbvrBzsqub3deR6JMRS82WQwboAJ0znLQ+30M1c
 TNBjrylh7cvFaBLN6Z2Aj0aDrxAxZ8rXAGUEoukMoLfg/TtW36jQoAlOzlpyppsQ2NWv
 SGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/KwXv4BlDQuOReLyYKnpu/uH4XylEzL/YqcY+RA23x8=;
 b=pqMq9dFKhV4IkNapyyiAnYx/b4xvGM7covwlpJGUkgViZ8l7UIf1dAdkRUHh1ggDgs
 VOt5zwgJbd71pYXREo6xU0R0Vwy9tK5NukIogtqd/igU53KoM+taggD5LqjLwMNI2cbo
 DUQKduQ2PeLnGWUi2aubKGZhB7n0MZbPAloHXHOH7O8RvgZGj26bgBqTg+poQC4Ap/qc
 tT7PV7IDnb68rZl7179XADLJXnibVwEHFKSnm6WZw3rWzmSAAOkqkYa4gD0VSjrq4KlT
 7JYbBHsi/4hUnURAZh7O/HqDaeAOg9bPbUmnWoeQ2wYEr5EfjXtlEdyVl4zrK0FSgFBd
 /bDg==
X-Gm-Message-State: AOAM532fErkVubxGubHstscAmvQi57TbADRKa7qLOeZ0reCvtODfSC//
 x7Cr6qVNSpIwqLXEuSAtqYCONXwlzIn/8A==
X-Google-Smtp-Source: ABdhPJzEyFJz4C4gvvICc2PoIrUyRisw4R5XwgPYpUAiusKzJgzguOOR8tDKXgy3mOso/tRy3x4PPA==
X-Received: by 2002:a5d:6d0b:0:b0:20c:4ecb:1113 with SMTP id
 e11-20020a5d6d0b000000b0020c4ecb1113mr13323857wrq.203.1652097547421; 
 Mon, 09 May 2022 04:59:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8bdsm12199928wrb.9.2022.05.09.04.59.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:59:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/32] target/arm: Enable FEAT_CSV2_2 for -cpu max
Date: Mon,  9 May 2022 12:58:37 +0100
Message-Id: <20220509115848.3521805-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509115848.3521805-1-peter.maydell@linaro.org>
References: <20220509115848.3521805-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

There is no branch prediction in TCG, therefore there is no
need to actually include the context number into the predictor.
Therefore all we need to do is add the state for SCXTNUM_ELx.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220506180242.216785-21-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst |  3 ++
 target/arm/cpu.h              | 16 +++++++++
 target/arm/cpu.c              |  5 +++
 target/arm/cpu64.c            |  3 +-
 target/arm/helper.c           | 61 ++++++++++++++++++++++++++++++++++-
 5 files changed, 86 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index b2a3e2a4373..9765ee3eaf6 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -13,6 +13,9 @@ the following architecture extensions:
 - FEAT_BF16 (AArch64 BFloat16 instructions)
 - FEAT_BTI (Branch Target Identification)
 - FEAT_CSV2 (Cache speculation variant 2)
+- FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
+- FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
+- FEAT_CSV2_2 (Cache speculation variant 2, version 2)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index aade9237bde..18ca61e8e25 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -688,6 +688,8 @@ typedef struct CPUArchState {
         ARMPACKey apdb;
         ARMPACKey apga;
     } keys;
+
+    uint64_t scxtnum_el[4];
 #endif
 
 #if defined(CONFIG_USER_ONLY)
@@ -1211,6 +1213,7 @@ void pmu_init(ARMCPU *cpu);
 #define SCTLR_WXN     (1U << 19)
 #define SCTLR_ST      (1U << 20) /* up to ??, RAZ in v6 */
 #define SCTLR_UWXN    (1U << 20) /* v7 onward, AArch32 only */
+#define SCTLR_TSCXT   (1U << 20) /* FEAT_CSV2_1p2, AArch64 only */
 #define SCTLR_FI      (1U << 21) /* up to v7, v8 RES0 */
 #define SCTLR_IESB    (1U << 21) /* v8.2-IESB, AArch64 only */
 #define SCTLR_U       (1U << 22) /* up to v6, RAO in v7 */
@@ -4022,6 +4025,19 @@ static inline bool isar_feature_aa64_dit(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, DIT) != 0;
 }
 
+static inline bool isar_feature_aa64_scxtnum(const ARMISARegisters *id)
+{
+    int key = FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, CSV2);
+    if (key >= 2) {
+        return true;      /* FEAT_CSV2_2 */
+    }
+    if (key == 1) {
+        key = FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, CSV2_FRAC);
+        return key >= 2;  /* FEAT_CSV2_1p2 */
+    }
+    return false;
+}
+
 static inline bool isar_feature_aa64_ssbs(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SSBS) != 0;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 652a84cf849..59df597e052 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -230,6 +230,11 @@ static void arm_cpu_reset(DeviceState *dev)
              */
             env->cp15.gcr_el1 = 0x1ffff;
         }
+        /*
+         * Disable access to SCXTNUM_EL0 from CSV2_1p2.
+         * This is not yet exposed from the Linux kernel in any way.
+         */
+        env->cp15.sctlr_el[1] |= SCTLR_TSCXT;
 #else
         /* Reset into the highest available EL */
         if (arm_feature(env, ARM_FEATURE_EL3)) {
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 25fe74f928b..07b44a62bef 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -748,7 +748,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
-    t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 1);      /* FEAT_CSV2 */
+    t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 2);      /* FEAT_CSV2_2 */
     cpu->isar.id_aa64pfr0 = t;
 
     t = cpu->isar.id_aa64pfr1;
@@ -760,6 +760,7 @@ static void aarch64_max_initfn(Object *obj)
      * we do for EL2 with the virtualization=on property.
      */
     t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);       /* FEAT_MTE3 */
+    t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_2 */
     cpu->isar.id_aa64pfr1 = t;
 
     t = cpu->isar.id_aa64mmfr0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4857d2dbb80..432bd819195 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1770,6 +1770,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         if (cpu_isar_feature(aa64_mte, cpu)) {
             valid_mask |= SCR_ATA;
         }
+        if (cpu_isar_feature(aa64_scxtnum, cpu)) {
+            valid_mask |= SCR_ENSCXT;
+        }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
         if (cpu_isar_feature(aa32_ras, cpu)) {
@@ -5149,6 +5152,9 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         if (cpu_isar_feature(aa64_mte, cpu)) {
             valid_mask |= HCR_ATA | HCR_DCT | HCR_TID5;
         }
+        if (cpu_isar_feature(aa64_scxtnum, cpu)) {
+            valid_mask |= HCR_ENSCXT;
+        }
     }
 
     /* Clear RES0 bits.  */
@@ -5800,6 +5806,10 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
         { K(3, 0,  5, 6, 0), K(3, 4,  5, 6, 0), K(3, 5, 5, 6, 0),
           "TFSR_EL1", "TFSR_EL2", "TFSR_EL12", isar_feature_aa64_mte },
 
+        { K(3, 0, 13, 0, 7), K(3, 4, 13, 0, 7), K(3, 5, 13, 0, 7),
+          "SCXTNUM_EL1", "SCXTNUM_EL2", "SCXTNUM_EL12",
+          isar_feature_aa64_scxtnum },
+
         /* TODO: ARMv8.2-SPE -- PMSCR_EL2 */
         /* TODO: ARMv8.4-Trace -- TRFCR_EL2 */
     };
@@ -7223,7 +7233,52 @@ static const ARMCPRegInfo mte_el0_cacheop_reginfo[] = {
     },
 };
 
-#endif
+static CPAccessResult access_scxtnum(CPUARMState *env, const ARMCPRegInfo *ri,
+                                     bool isread)
+{
+    uint64_t hcr = arm_hcr_el2_eff(env);
+    int el = arm_current_el(env);
+
+    if (el == 0 && !((hcr & HCR_E2H) && (hcr & HCR_TGE))) {
+        if (env->cp15.sctlr_el[1] & SCTLR_TSCXT) {
+            if (hcr & HCR_TGE) {
+                return CP_ACCESS_TRAP_EL2;
+            }
+            return CP_ACCESS_TRAP;
+        }
+    } else if (el < 2 && (env->cp15.sctlr_el[2] & SCTLR_TSCXT)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    if (el < 2 && arm_is_el2_enabled(env) && !(hcr & HCR_ENSCXT)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    if (el < 3
+        && arm_feature(env, ARM_FEATURE_EL3)
+        && !(env->cp15.scr_el3 & SCR_ENSCXT)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
+static const ARMCPRegInfo scxtnum_reginfo[] = {
+    { .name = "SCXTNUM_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 13, .crm = 0, .opc2 = 7,
+      .access = PL0_RW, .accessfn = access_scxtnum,
+      .fieldoffset = offsetof(CPUARMState, scxtnum_el[0]) },
+    { .name = "SCXTNUM_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 13, .crm = 0, .opc2 = 7,
+      .access = PL1_RW, .accessfn = access_scxtnum,
+      .fieldoffset = offsetof(CPUARMState, scxtnum_el[1]) },
+    { .name = "SCXTNUM_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 13, .crm = 0, .opc2 = 7,
+      .access = PL2_RW, .accessfn = access_scxtnum,
+      .fieldoffset = offsetof(CPUARMState, scxtnum_el[2]) },
+    { .name = "SCXTNUM_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 13, .crm = 0, .opc2 = 7,
+      .access = PL3_RW,
+      .fieldoffset = offsetof(CPUARMState, scxtnum_el[3]) },
+};
+#endif /* TARGET_AARCH64 */
 
 static CPAccessResult access_predinv(CPUARMState *env, const ARMCPRegInfo *ri,
                                      bool isread)
@@ -8365,6 +8420,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, mte_tco_ro_reginfo);
         define_arm_cp_regs(cpu, mte_el0_cacheop_reginfo);
     }
+
+    if (cpu_isar_feature(aa64_scxtnum, cpu)) {
+        define_arm_cp_regs(cpu, scxtnum_reginfo);
+    }
 #endif
 
     if (cpu_isar_feature(any_predinv, cpu)) {
-- 
2.25.1


