Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA901559CA
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 15:38:53 +0100 (CET)
Received: from localhost ([::1]:57976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j04mS-0000jJ-3j
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 09:38:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51589)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j04hv-0000UD-5f
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 09:34:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j04hs-0002vX-Pa
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 09:34:11 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35748)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j04hs-0002uM-GM
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 09:34:08 -0500
Received: by mail-wr1-x42e.google.com with SMTP id w12so2980027wrt.2
 for <qemu-devel@nongnu.org>; Fri, 07 Feb 2020 06:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GcXRoN6INpUx5s2miIIC/0NtEA2mwP4s4g2MehtKvJc=;
 b=IMuWFXmweNV/QNt5ho7NyUPbOE3Fgha8FhjqtXerMSOjKk9IfaA55lSR8ayPahF2OH
 sopG5GVx0aZ9wfKuWgQh/FO1rjKf8tJGndgS+/XzJPJWeX9I44Fz1Q4HgPcBs0yN6jWc
 7JL3gNMyT2Mv0fk/yjJGbQcJZwPL8QXPDxYb3Wu245KMdy7TX8i+jvsoVnZ2uyyHI9jP
 tY2hSj9wSABgUYa/3rESBbCVb7y9NVVKw6ozB06J57A66uk61nYDn+PuyYrEDRVhaYre
 Cqw6SxXYwomarSXoKSy4CHKh2GMo7ofJR8xQwBRCOF5dFAmh8RLg5wFiykcuFIsDGpSh
 rWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GcXRoN6INpUx5s2miIIC/0NtEA2mwP4s4g2MehtKvJc=;
 b=tb6JZiq9MMzz6kqlHUiTfySSEcdeUAeLDDxwdiHMkmItk8uLZDrDfuGAATfG4/gI6P
 3v5PdDqvgpC4AOOIcp8f7quE38MzbXFKKG1mDMUkfnaDFpmgn/pW1jeTPKDgj0qlQ8+m
 Re8s0mJiIbnWwT2WcE2yDm0fkz7yAmvtnhX9oFA0f77iP6IitFskme05BAIhTjsg6JNZ
 VIvu/4P+VKiUBcsgbDgQxxPaMk/lkeNuUdl48NsppFPjXarhAXOXGCZrAEMY+q8s71b7
 fNELPLrcU/6w/JGjwR9L0W6ITDMnG8MyceKW4EEPfW1f0Y34B2KVVOgUuKeMi2UJMpXx
 CJmQ==
X-Gm-Message-State: APjAAAU13Ky8KSwTZ9GTQdO0A9oHWxvTdkfH09iHe6oQ1CUiLYhdFX+n
 xnIAjpEWvgAF24t764qsZQEav8N2U8E=
X-Google-Smtp-Source: APXvYqyjIMM4q4iuMipJfKVvH8Db7g1vemsaVi6fRkNTxBZIKG7F0eXOypPGyQaDlp2IGxxOQ6gnjA==
X-Received: by 2002:a5d:4b03:: with SMTP id v3mr5279530wrq.178.1581086046919; 
 Fri, 07 Feb 2020 06:34:06 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w1sm3796430wro.72.2020.02.07.06.34.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 06:34:06 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/48] target/arm: Reorganize ARMMMUIdx
Date: Fri,  7 Feb 2020 14:33:15 +0000
Message-Id: <20200207143343.30322-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200207143343.30322-1-peter.maydell@linaro.org>
References: <20200207143343.30322-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42e
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Prepare for, but do not yet implement, the EL2&0 regime.
This involves adding the new MMUIdx enumerators and adjusting
some of the MMUIdx related predicates to match.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200206105448.4726-20-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu-param.h |   2 +-
 target/arm/cpu.h       | 134 ++++++++++++++++++-----------------------
 target/arm/internals.h |  35 +++++++++++
 target/arm/helper.c    |  66 +++++++++++++++++---
 target/arm/translate.c |   1 -
 5 files changed, 152 insertions(+), 86 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 6e6948e9602..18ac5623462 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -29,6 +29,6 @@
 # define TARGET_PAGE_BITS_MIN  10
 #endif
 
-#define NB_MMU_MODES 8
+#define NB_MMU_MODES 9
 
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ad92873943f..3fc0e6e7465 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2819,18 +2819,21 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
  *  + NonSecure EL1 & 0 stage 1
  *  + NonSecure EL1 & 0 stage 2
  *  + NonSecure EL2
- *  + Secure EL1 & EL0
+ *  + NonSecure EL2 & 0   (ARMv8.1-VHE)
+ *  + Secure EL1 & 0
  *  + Secure EL3
  * If EL3 is 32-bit:
  *  + NonSecure PL1 & 0 stage 1
  *  + NonSecure PL1 & 0 stage 2
  *  + NonSecure PL2
- *  + Secure PL0 & PL1
+ *  + Secure PL0
+ *  + Secure PL1
  * (reminder: for 32 bit EL3, Secure PL1 is *EL3*, not EL1.)
  *
  * For QEMU, an mmu_idx is not quite the same as a translation regime because:
- *  1. we need to split the "EL1 & 0" regimes into two mmu_idxes, because they
- *     may differ in access permissions even if the VA->PA map is the same
+ *  1. we need to split the "EL1 & 0" and "EL2 & 0" regimes into two mmu_idxes,
+ *     because they may differ in access permissions even if the VA->PA map is
+ *     the same
  *  2. we want to cache in our TLB the full VA->IPA->PA lookup for a stage 1+2
  *     translation, which means that we have one mmu_idx that deals with two
  *     concatenated translation regimes [this sort of combined s1+2 TLB is
@@ -2842,19 +2845,23 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
  *  4. we can also safely fold together the "32 bit EL3" and "64 bit EL3"
  *     translation regimes, because they map reasonably well to each other
  *     and they can't both be active at the same time.
- * This gives us the following list of mmu_idx values:
+ *  5. we want to be able to use the TLB for accesses done as part of a
+ *     stage1 page table walk, rather than having to walk the stage2 page
+ *     table over and over.
  *
- * NS EL0 (aka NS PL0) stage 1+2
- * NS EL1 (aka NS PL1) stage 1+2
+ * This gives us the following list of cases:
+ *
+ * NS EL0 EL1&0 stage 1+2 (aka NS PL0)
+ * NS EL1 EL1&0 stage 1+2 (aka NS PL1)
+ * NS EL0 EL2&0
+ * NS EL2 EL2&0
  * NS EL2 (aka NS PL2)
+ * S EL0 EL1&0 (aka S PL0)
+ * S EL1 EL1&0 (not used if EL3 is 32 bit)
  * S EL3 (aka S PL1)
- * S EL0 (aka S PL0)
- * S EL1 (not used if EL3 is 32 bit)
- * NS EL0+1 stage 2
+ * NS EL1&0 stage 2
  *
- * (The last of these is an mmu_idx because we want to be able to use the TLB
- * for the accesses done as part of a stage 1 page table walk, rather than
- * having to walk the stage 2 page table over and over.)
+ * for a total of 9 different mmu_idx.
  *
  * R profile CPUs have an MPU, but can use the same set of MMU indexes
  * as A profile. They only need to distinguish NS EL0 and NS EL1 (and
@@ -2892,26 +2899,47 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
  * For M profile we arrange them to have a bit for priv, a bit for negpri
  * and a bit for secure.
  */
-#define ARM_MMU_IDX_A 0x10 /* A profile */
-#define ARM_MMU_IDX_NOTLB 0x20 /* does not have a TLB */
-#define ARM_MMU_IDX_M 0x40 /* M profile */
+#define ARM_MMU_IDX_A     0x10  /* A profile */
+#define ARM_MMU_IDX_NOTLB 0x20  /* does not have a TLB */
+#define ARM_MMU_IDX_M     0x40  /* M profile */
 
-/* meanings of the bits for M profile mmu idx values */
-#define ARM_MMU_IDX_M_PRIV 0x1
+/* Meanings of the bits for M profile mmu idx values */
+#define ARM_MMU_IDX_M_PRIV   0x1
 #define ARM_MMU_IDX_M_NEGPRI 0x2
-#define ARM_MMU_IDX_M_S 0x4
+#define ARM_MMU_IDX_M_S      0x4  /* Secure */
 
-#define ARM_MMU_IDX_TYPE_MASK (~0x7)
-#define ARM_MMU_IDX_COREIDX_MASK 0x7
+#define ARM_MMU_IDX_TYPE_MASK \
+    (ARM_MMU_IDX_A | ARM_MMU_IDX_M | ARM_MMU_IDX_NOTLB)
+#define ARM_MMU_IDX_COREIDX_MASK 0xf
 
 typedef enum ARMMMUIdx {
-    ARMMMUIdx_E10_0 = 0 | ARM_MMU_IDX_A,
-    ARMMMUIdx_E10_1 = 1 | ARM_MMU_IDX_A,
-    ARMMMUIdx_E2 = 2 | ARM_MMU_IDX_A,
-    ARMMMUIdx_SE3 = 3 | ARM_MMU_IDX_A,
-    ARMMMUIdx_SE10_0 = 4 | ARM_MMU_IDX_A,
-    ARMMMUIdx_SE10_1 = 5 | ARM_MMU_IDX_A,
-    ARMMMUIdx_Stage2 = 6 | ARM_MMU_IDX_A,
+    /*
+     * A-profile.
+     */
+    ARMMMUIdx_E10_0 =  0 | ARM_MMU_IDX_A,
+    ARMMMUIdx_E20_0 =  1 | ARM_MMU_IDX_A,
+
+    ARMMMUIdx_E10_1 =  2 | ARM_MMU_IDX_A,
+
+    ARMMMUIdx_E2 =     3 | ARM_MMU_IDX_A,
+    ARMMMUIdx_E20_2 =  4 | ARM_MMU_IDX_A,
+
+    ARMMMUIdx_SE10_0 = 5 | ARM_MMU_IDX_A,
+    ARMMMUIdx_SE10_1 = 6 | ARM_MMU_IDX_A,
+    ARMMMUIdx_SE3 =    7 | ARM_MMU_IDX_A,
+
+    ARMMMUIdx_Stage2 = 8 | ARM_MMU_IDX_A,
+
+    /*
+     * These are not allocated TLBs and are used only for AT system
+     * instructions or for the first stage of an S12 page table walk.
+     */
+    ARMMMUIdx_Stage1_E0 = 0 | ARM_MMU_IDX_NOTLB,
+    ARMMMUIdx_Stage1_E1 = 1 | ARM_MMU_IDX_NOTLB,
+
+    /*
+     * M-profile.
+     */
     ARMMMUIdx_MUser = ARM_MMU_IDX_M,
     ARMMMUIdx_MPriv = ARM_MMU_IDX_M | ARM_MMU_IDX_M_PRIV,
     ARMMMUIdx_MUserNegPri = ARMMMUIdx_MUser | ARM_MMU_IDX_M_NEGPRI,
@@ -2920,11 +2948,6 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_MSPriv = ARMMMUIdx_MPriv | ARM_MMU_IDX_M_S,
     ARMMMUIdx_MSUserNegPri = ARMMMUIdx_MUserNegPri | ARM_MMU_IDX_M_S,
     ARMMMUIdx_MSPrivNegPri = ARMMMUIdx_MPrivNegPri | ARM_MMU_IDX_M_S,
-    /* Indexes below here don't have TLBs and are used only for AT system
-     * instructions or for the first stage of an S12 page table walk.
-     */
-    ARMMMUIdx_Stage1_E0 = 0 | ARM_MMU_IDX_NOTLB,
-    ARMMMUIdx_Stage1_E1 = 1 | ARM_MMU_IDX_NOTLB,
 } ARMMMUIdx;
 
 /*
@@ -2936,8 +2959,10 @@ typedef enum ARMMMUIdx {
 
 typedef enum ARMMMUIdxBit {
     TO_CORE_BIT(E10_0),
+    TO_CORE_BIT(E20_0),
     TO_CORE_BIT(E10_1),
     TO_CORE_BIT(E2),
+    TO_CORE_BIT(E20_2),
     TO_CORE_BIT(SE10_0),
     TO_CORE_BIT(SE10_1),
     TO_CORE_BIT(SE3),
@@ -2957,49 +2982,6 @@ typedef enum ARMMMUIdxBit {
 
 #define MMU_USER_IDX 0
 
-static inline int arm_to_core_mmu_idx(ARMMMUIdx mmu_idx)
-{
-    return mmu_idx & ARM_MMU_IDX_COREIDX_MASK;
-}
-
-static inline ARMMMUIdx core_to_arm_mmu_idx(CPUARMState *env, int mmu_idx)
-{
-    if (arm_feature(env, ARM_FEATURE_M)) {
-        return mmu_idx | ARM_MMU_IDX_M;
-    } else {
-        return mmu_idx | ARM_MMU_IDX_A;
-    }
-}
-
-/* Return the exception level we're running at if this is our mmu_idx */
-static inline int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx & ARM_MMU_IDX_TYPE_MASK) {
-    case ARM_MMU_IDX_A:
-        return mmu_idx & 3;
-    case ARM_MMU_IDX_M:
-        return mmu_idx & ARM_MMU_IDX_M_PRIV;
-    default:
-        g_assert_not_reached();
-    }
-}
-
-/*
- * Return the MMU index for a v7M CPU with all relevant information
- * manually specified.
- */
-ARMMMUIdx arm_v7m_mmu_idx_all(CPUARMState *env,
-                              bool secstate, bool priv, bool negpri);
-
-/* Return the MMU index for a v7M CPU in the specified security and
- * privilege state.
- */
-ARMMMUIdx arm_v7m_mmu_idx_for_secstate_and_priv(CPUARMState *env,
-                                                bool secstate, bool priv);
-
-/* Return the MMU index for a v7M CPU in the specified security state */
-ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate);
-
 /**
  * cpu_mmu_index:
  * @env: The cpu environment
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 5b8b9c233fe..0c4119a3a2e 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -769,6 +769,39 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       MMUAccessType access_type, int mmu_idx,
                       bool probe, uintptr_t retaddr);
 
+static inline int arm_to_core_mmu_idx(ARMMMUIdx mmu_idx)
+{
+    return mmu_idx & ARM_MMU_IDX_COREIDX_MASK;
+}
+
+static inline ARMMMUIdx core_to_arm_mmu_idx(CPUARMState *env, int mmu_idx)
+{
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        return mmu_idx | ARM_MMU_IDX_M;
+    } else {
+        return mmu_idx | ARM_MMU_IDX_A;
+    }
+}
+
+int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx);
+
+/*
+ * Return the MMU index for a v7M CPU with all relevant information
+ * manually specified.
+ */
+ARMMMUIdx arm_v7m_mmu_idx_all(CPUARMState *env,
+                              bool secstate, bool priv, bool negpri);
+
+/*
+ * Return the MMU index for a v7M CPU in the specified security and
+ * privilege state.
+ */
+ARMMMUIdx arm_v7m_mmu_idx_for_secstate_and_priv(CPUARMState *env,
+                                                bool secstate, bool priv);
+
+/* Return the MMU index for a v7M CPU in the specified security state */
+ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate);
+
 /* Return true if the stage 1 translation regime is using LPAE format page
  * tables */
 bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
@@ -810,6 +843,8 @@ static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
     switch (mmu_idx) {
     case ARMMMUIdx_E10_0:
     case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_E20_2:
     case ARMMMUIdx_Stage1_E0:
     case ARMMMUIdx_Stage1_E1:
     case ARMMMUIdx_E2:
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5609bb18e86..3ce37c2c163 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8707,9 +8707,11 @@ void arm_cpu_do_interrupt(CPUState *cs)
 #endif /* !CONFIG_USER_ONLY */
 
 /* Return the exception level which controls this address translation regime */
-static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
+static uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_E20_2:
     case ARMMMUIdx_Stage2:
     case ARMMMUIdx_E2:
         return 2;
@@ -8720,6 +8722,8 @@ static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
     case ARMMMUIdx_SE10_1:
     case ARMMMUIdx_Stage1_E0:
     case ARMMMUIdx_Stage1_E1:
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E10_1:
     case ARMMMUIdx_MPrivNegPri:
     case ARMMMUIdx_MUserNegPri:
     case ARMMMUIdx_MPriv:
@@ -8821,10 +8825,14 @@ static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
  */
 static inline ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
 {
-    if (mmu_idx == ARMMMUIdx_E10_0 || mmu_idx == ARMMMUIdx_E10_1) {
-        mmu_idx += (ARMMMUIdx_Stage1_E0 - ARMMMUIdx_E10_0);
+    switch (mmu_idx) {
+    case ARMMMUIdx_E10_0:
+        return ARMMMUIdx_Stage1_E0;
+    case ARMMMUIdx_E10_1:
+        return ARMMMUIdx_Stage1_E1;
+    default:
+        return mmu_idx;
     }
-    return mmu_idx;
 }
 
 /* Return true if the translation regime is using LPAE format page tables */
@@ -8857,6 +8865,7 @@ static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
     case ARMMMUIdx_SE10_0:
+    case ARMMMUIdx_E20_0:
     case ARMMMUIdx_Stage1_E0:
     case ARMMMUIdx_MUser:
     case ARMMMUIdx_MSUser:
@@ -11282,6 +11291,31 @@ int fp_exception_el(CPUARMState *env, int cur_el)
     return 0;
 }
 
+/* Return the exception level we're running at if this is our mmu_idx */
+int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
+{
+    if (mmu_idx & ARM_MMU_IDX_M) {
+        return mmu_idx & ARM_MMU_IDX_M_PRIV;
+    }
+
+    switch (mmu_idx) {
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_SE10_0:
+        return 0;
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_SE10_1:
+        return 1;
+    case ARMMMUIdx_E2:
+    case ARMMMUIdx_E20_2:
+        return 2;
+    case ARMMMUIdx_SE3:
+        return 3;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 #ifndef CONFIG_TCG
 ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
 {
@@ -11295,10 +11329,26 @@ ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
         return arm_v7m_mmu_idx_for_secstate(env, env->v7m.secure);
     }
 
-    if (el < 2 && arm_is_secure_below_el3(env)) {
-        return ARMMMUIdx_SE10_0 + el;
-    } else {
-        return ARMMMUIdx_E10_0 + el;
+    switch (el) {
+    case 0:
+        /* TODO: ARMv8.1-VHE */
+        if (arm_is_secure_below_el3(env)) {
+            return ARMMMUIdx_SE10_0;
+        }
+        return ARMMMUIdx_E10_0;
+    case 1:
+        if (arm_is_secure_below_el3(env)) {
+            return ARMMMUIdx_SE10_1;
+        }
+        return ARMMMUIdx_E10_1;
+    case 2:
+        /* TODO: ARMv8.1-VHE */
+        /* TODO: ARMv8.4-SecEL2 */
+        return ARMMMUIdx_E2;
+    case 3:
+        return ARMMMUIdx_SE3;
+    default:
+        g_assert_not_reached();
     }
 }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index c169984374a..e11a5871d02 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -172,7 +172,6 @@ static inline int get_a32_user_mem_index(DisasContext *s)
     case ARMMMUIdx_MSUserNegPri:
     case ARMMMUIdx_MSPrivNegPri:
         return arm_to_core_mmu_idx(ARMMMUIdx_MSUserNegPri);
-    case ARMMMUIdx_Stage2:
     default:
         g_assert_not_reached();
     }
-- 
2.20.1


