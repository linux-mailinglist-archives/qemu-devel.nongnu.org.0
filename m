Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7203E544826
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 11:59:46 +0200 (CEST)
Received: from localhost ([::1]:45112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzEx7-0003m5-Bt
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 05:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE71-0001TV-AJ
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:05:55 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE6x-0005wl-R3
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:05:55 -0400
Received: by mail-wr1-x436.google.com with SMTP id k16so31477811wrg.7
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hc5zkvCsi6gg6RtC6i+txFH2JRDjXFdVtwnnnFfRk5Y=;
 b=baAdG3ycirS9ozBNAcguePoPK+4apMDZ9WHZkHthEKipv9a73/Z3BWfsJHFh07Bvo/
 rBFcvaKn5x0vOXIZ+F8O5yFkNV1EboizS3PHIm4AdJj1YOlgfga9/K31YFiuapxiGIrK
 rOMKM4jm/xRTiKFqdVbWev4Jb9Zel5yoQV/8YPfWAIm066L6TvU03dFTauIjjIZC3Jy5
 gRGYGWFcng84FuWUG9M2ntTd5NOkqYLgMmnDVoBpgNV0QUKOK5JxZv2gB9LRvRUxZDjg
 HNADpRNRItqqN1XObU0wXMyetK3jIJ3nJ9YlhW3CLbO6z99AzPcGX1sbIBBqf79F+q1Z
 nGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hc5zkvCsi6gg6RtC6i+txFH2JRDjXFdVtwnnnFfRk5Y=;
 b=qd6lmkx/83I/01CklAQ7yVgoXXDXY8gnYOPI66AshmqQukba+r0rY37YmGrsvI0HJS
 4QHMBd5CWmr9+P7WNW126mxcaIqdjxtMbqdg8itCmOQ1Os4NjXVGGUhHSFvXnvW2F8c+
 7uHqBzwkOA275tjP3eYbLy/bDQJ3nhj6j1+Dv2T/sz9eXF6Qfcx7XQnsYLrgaXmRmjse
 mWoGx94vSocU2DVpOxf9wgTsa1QbRdF7cWYRzQIobc9x1ayMxG5/gka51wOx2H2Fj35L
 JGYAYtSLTQEqoxhkyca2a46F30nY+FLFYzc/8tUd+GLYEXxjGV2M2nlICNxtUlCOvyGt
 T/Xg==
X-Gm-Message-State: AOAM531imTqL5+dbtAkvh+jx6YAoDtlky5+ytPTXA7irDNLXOySYU20J
 5lKtAnk6leITyL7406s6KMHiOGfbVCrDGg==
X-Google-Smtp-Source: ABdhPJxTy0Gl8uIFJ4DlpB8kxBjO/jL00MAdig58l9YoK6h5jPUSe2G8XdFKhfK9GBbU5/swLS7FCw==
X-Received: by 2002:adf:f90f:0:b0:20e:5fd4:5d06 with SMTP id
 b15-20020adff90f000000b0020e5fd45d06mr37549597wrr.371.1654765549972; 
 Thu, 09 Jun 2022 02:05:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.05.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:05:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/55] target/arm: Move get_phys_addr to ptw.c
Date: Thu,  9 Jun 2022 10:04:51 +0100
Message-Id: <20220609090537.1971756-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

Begin moving all of the page table walking functions
out of helper.c, starting with get_phys_addr().

Create a temporary header file, "ptw.h", in which to
share declarations between the two C files while we
are moving functions.

Move a few declarations to "internals.h", which will
remain used by multiple C files.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220604040607.269301-3-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h |  18 ++-
 target/arm/ptw.h       |  51 ++++++
 target/arm/helper.c    | 344 +++++------------------------------------
 target/arm/ptw.c       | 267 ++++++++++++++++++++++++++++++++
 target/arm/meson.build |   1 +
 5 files changed, 372 insertions(+), 309 deletions(-)
 create mode 100644 target/arm/ptw.h
 create mode 100644 target/arm/ptw.c

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 049edce946c..1d83146d565 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -613,8 +613,13 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate_and_priv(CPUARMState *env,
 /* Return the MMU index for a v7M CPU in the specified security state */
 ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate);
 
-/* Return true if the stage 1 translation regime is using LPAE format page
- * tables */
+/* Return true if the translation regime is using LPAE format page tables */
+bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
+
+/*
+ * Return true if the stage 1 translation regime is using LPAE
+ * format page tables
+ */
 bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
 
 /* Raise a data fault alignment exception for the specified virtual address */
@@ -777,6 +782,12 @@ static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
+/* Return the SCTLR value which controls this address translation regime */
+static inline uint64_t regime_sctlr(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    return env->cp15.sctlr_el[regime_el(env, mmu_idx)];
+}
+
 /* Return the TCR controlling this translation regime */
 static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
@@ -1095,6 +1106,9 @@ typedef struct ARMVAParameters {
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data);
 
+int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx);
+int aa64_va_parameter_tbid(uint64_t tcr, ARMMMUIdx mmu_idx);
+
 static inline int exception_target_el(CPUARMState *env)
 {
     int target_el = MAX(1, arm_current_el(env));
diff --git a/target/arm/ptw.h b/target/arm/ptw.h
new file mode 100644
index 00000000000..e2023ae7508
--- /dev/null
+++ b/target/arm/ptw.h
@@ -0,0 +1,51 @@
+/*
+ * ARM page table walking.
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef TARGET_ARM_PTW_H
+#define TARGET_ARM_PTW_H
+
+#ifndef CONFIG_USER_ONLY
+
+bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx);
+bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx);
+ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
+                                 ARMCacheAttrs s1, ARMCacheAttrs s2);
+
+bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
+                      MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                      hwaddr *phys_ptr, int *prot,
+                      target_ulong *page_size,
+                      ARMMMUFaultInfo *fi);
+bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
+                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                          hwaddr *phys_ptr, int *prot,
+                          ARMMMUFaultInfo *fi);
+bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
+                      MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                      hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
+                      target_ulong *page_size, ARMMMUFaultInfo *fi);
+bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
+                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                          hwaddr *phys_ptr, int *prot,
+                          target_ulong *page_size,
+                          ARMMMUFaultInfo *fi);
+bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
+                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                          hwaddr *phys_ptr, MemTxAttrs *txattrs,
+                          int *prot, target_ulong *page_size,
+                          ARMMMUFaultInfo *fi);
+bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
+                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                        bool s1_is_el0,
+                        hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
+                        target_ulong *page_size_ptr,
+                        ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
+    __attribute__((nonnull));
+
+#endif /* !CONFIG_USER_ONLY */
+#endif /* TARGET_ARM_PTW_H */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 829b660db92..3ffd122178d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -37,22 +37,11 @@
 #include "semihosting/common-semi.h"
 #endif
 #include "cpregs.h"
+#include "ptw.h"
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
 
-#ifndef CONFIG_USER_ONLY
-
-static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
-                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool s1_is_el0,
-                               hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
-                               target_ulong *page_size_ptr,
-                               ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
-    __attribute__((nonnull));
-#endif
-
 static void switch_mode(CPUARMState *env, int mode);
-static int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx);
 
 static uint64_t raw_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
@@ -10440,17 +10429,10 @@ uint64_t arm_sctlr(CPUARMState *env, int el)
     return env->cp15.sctlr_el[el];
 }
 
-/* Return the SCTLR value which controls this address translation regime */
-static inline uint64_t regime_sctlr(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    return env->cp15.sctlr_el[regime_el(env, mmu_idx)];
-}
-
 #ifndef CONFIG_USER_ONLY
 
 /* Return true if the specified stage of address translation is disabled */
-static inline bool regime_translation_disabled(CPUARMState *env,
-                                               ARMMMUIdx mmu_idx)
+bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     uint64_t hcr_el2;
 
@@ -10542,8 +10524,7 @@ ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
 #endif /* !CONFIG_USER_ONLY */
 
 /* Return true if the translation regime is using LPAE format page tables */
-static inline bool regime_using_lpae_format(CPUARMState *env,
-                                            ARMMMUIdx mmu_idx)
+bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     int el = regime_el(env, mmu_idx);
     if (el == 2 || arm_el_is_aa64(env, el)) {
@@ -10567,7 +10548,7 @@ bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
 }
 
 #ifndef CONFIG_USER_ONLY
-static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
+bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
     case ARMMMUIdx_SE10_0:
@@ -10959,11 +10940,11 @@ static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
     return 0;
 }
 
-static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
-                             MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             hwaddr *phys_ptr, int *prot,
-                             target_ulong *page_size,
-                             ARMMMUFaultInfo *fi)
+bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
+                      MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                      hwaddr *phys_ptr, int *prot,
+                      target_ulong *page_size,
+                      ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
     int level = 1;
@@ -11081,10 +11062,10 @@ do_fault:
     return true;
 }
 
-static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
-                             MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
-                             target_ulong *page_size, ARMMMUFaultInfo *fi)
+bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
+                      MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                      hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
+                      target_ulong *page_size, ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
     ARMCPU *cpu = env_archcpu(env);
@@ -11360,7 +11341,7 @@ unsigned int arm_pamax(ARMCPU *cpu)
     return pamax_map[parange];
 }
 
-static int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
+int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
         return extract64(tcr, 37, 2);
@@ -11372,7 +11353,7 @@ static int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
     }
 }
 
-static int aa64_va_parameter_tbid(uint64_t tcr, ARMMMUIdx mmu_idx)
+int aa64_va_parameter_tbid(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
         return extract64(tcr, 51, 2);
@@ -11602,12 +11583,12 @@ static ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
  * @fi: set to fault info if the translation fails
  * @cacheattrs: (if non-NULL) set to the cacheability/shareability attributes
  */
-static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
-                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool s1_is_el0,
-                               hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
-                               target_ulong *page_size_ptr,
-                               ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
+bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
+                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                        bool s1_is_el0,
+                        hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
+                        target_ulong *page_size_ptr,
+                        ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
 {
     ARMCPU *cpu = env_archcpu(env);
     CPUState *cs = CPU(cpu);
@@ -12055,11 +12036,11 @@ static inline bool m_is_system_region(CPUARMState *env, uint32_t address)
     return arm_feature(env, ARM_FEATURE_M) && extract32(address, 29, 3) == 0x7;
 }
 
-static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
-                                 MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 hwaddr *phys_ptr, int *prot,
-                                 target_ulong *page_size,
-                                 ARMMMUFaultInfo *fi)
+bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
+                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                          hwaddr *phys_ptr, int *prot,
+                          target_ulong *page_size,
+                          ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
     int n;
@@ -12501,11 +12482,11 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
 }
 
 
-static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
-                                 MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 hwaddr *phys_ptr, MemTxAttrs *txattrs,
-                                 int *prot, target_ulong *page_size,
-                                 ARMMMUFaultInfo *fi)
+bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
+                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                          hwaddr *phys_ptr, MemTxAttrs *txattrs,
+                          int *prot, target_ulong *page_size,
+                          ARMMMUFaultInfo *fi)
 {
     uint32_t secure = regime_is_secure(env, mmu_idx);
     V8M_SAttributes sattrs = {};
@@ -12575,10 +12556,10 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
     return ret;
 }
 
-static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
-                                 MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 hwaddr *phys_ptr, int *prot,
-                                 ARMMMUFaultInfo *fi)
+bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
+                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                          hwaddr *phys_ptr, int *prot,
+                          ARMMMUFaultInfo *fi)
 {
     int n;
     uint32_t mask;
@@ -12795,8 +12776,8 @@ static uint8_t combined_attrs_fwb(CPUARMState *env,
  * @s1:      Attributes from stage 1 walk
  * @s2:      Attributes from stage 2 walk
  */
-static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
-                                        ARMCacheAttrs s1, ARMCacheAttrs s2)
+ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
+                                 ARMCacheAttrs s1, ARMCacheAttrs s2)
 {
     ARMCacheAttrs ret;
     bool tagged = false;
@@ -12848,256 +12829,6 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
     return ret;
 }
 
-
-/* get_phys_addr - get the physical address for this virtual address
- *
- * Find the physical address corresponding to the given virtual address,
- * by doing a translation table walk on MMU based systems or using the
- * MPU state on MPU based systems.
- *
- * Returns false if the translation was successful. Otherwise, phys_ptr, attrs,
- * prot and page_size may not be filled in, and the populated fsr value provides
- * information on why the translation aborted, in the format of a
- * DFSR/IFSR fault register, with the following caveats:
- *  * we honour the short vs long DFSR format differences.
- *  * the WnR bit is never set (the caller must do this).
- *  * for PSMAv5 based systems we don't bother to return a full FSR format
- *    value.
- *
- * @env: CPUARMState
- * @address: virtual address to get physical address for
- * @access_type: 0 for read, 1 for write, 2 for execute
- * @mmu_idx: MMU index indicating required translation regime
- * @phys_ptr: set to the physical address corresponding to the virtual address
- * @attrs: set to the memory transaction attributes to use
- * @prot: set to the permissions for the page containing phys_ptr
- * @page_size: set to the size of the page containing phys_ptr
- * @fi: set to fault info if the translation fails
- * @cacheattrs: (if non-NULL) set to the cacheability/shareability attributes
- */
-bool get_phys_addr(CPUARMState *env, target_ulong address,
-                   MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                   hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
-                   target_ulong *page_size,
-                   ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
-{
-    ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
-
-    if (mmu_idx != s1_mmu_idx) {
-        /* Call ourselves recursively to do the stage 1 and then stage 2
-         * translations if mmu_idx is a two-stage regime.
-         */
-        if (arm_feature(env, ARM_FEATURE_EL2)) {
-            hwaddr ipa;
-            int s2_prot;
-            int ret;
-            bool ipa_secure;
-            ARMCacheAttrs cacheattrs2 = {};
-            ARMMMUIdx s2_mmu_idx;
-            bool is_el0;
-
-            ret = get_phys_addr(env, address, access_type, s1_mmu_idx, &ipa,
-                                attrs, prot, page_size, fi, cacheattrs);
-
-            /* If S1 fails or S2 is disabled, return early.  */
-            if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2)) {
-                *phys_ptr = ipa;
-                return ret;
-            }
-
-            ipa_secure = attrs->secure;
-            if (arm_is_secure_below_el3(env)) {
-                if (ipa_secure) {
-                    attrs->secure = !(env->cp15.vstcr_el2.raw_tcr & VSTCR_SW);
-                } else {
-                    attrs->secure = !(env->cp15.vtcr_el2.raw_tcr & VTCR_NSW);
-                }
-            } else {
-                assert(!ipa_secure);
-            }
-
-            s2_mmu_idx = attrs->secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
-            is_el0 = mmu_idx == ARMMMUIdx_E10_0 || mmu_idx == ARMMMUIdx_SE10_0;
-
-            /* S1 is done. Now do S2 translation.  */
-            ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx, is_el0,
-                                     phys_ptr, attrs, &s2_prot,
-                                     page_size, fi, &cacheattrs2);
-            fi->s2addr = ipa;
-            /* Combine the S1 and S2 perms.  */
-            *prot &= s2_prot;
-
-            /* If S2 fails, return early.  */
-            if (ret) {
-                return ret;
-            }
-
-            /* Combine the S1 and S2 cache attributes. */
-            if (arm_hcr_el2_eff(env) & HCR_DC) {
-                /*
-                 * HCR.DC forces the first stage attributes to
-                 *  Normal Non-Shareable,
-                 *  Inner Write-Back Read-Allocate Write-Allocate,
-                 *  Outer Write-Back Read-Allocate Write-Allocate.
-                 * Do not overwrite Tagged within attrs.
-                 */
-                if (cacheattrs->attrs != 0xf0) {
-                    cacheattrs->attrs = 0xff;
-                }
-                cacheattrs->shareability = 0;
-            }
-            *cacheattrs = combine_cacheattrs(env, *cacheattrs, cacheattrs2);
-
-            /* Check if IPA translates to secure or non-secure PA space. */
-            if (arm_is_secure_below_el3(env)) {
-                if (ipa_secure) {
-                    attrs->secure =
-                        !(env->cp15.vstcr_el2.raw_tcr & (VSTCR_SA | VSTCR_SW));
-                } else {
-                    attrs->secure =
-                        !((env->cp15.vtcr_el2.raw_tcr & (VTCR_NSA | VTCR_NSW))
-                        || (env->cp15.vstcr_el2.raw_tcr & (VSTCR_SA | VSTCR_SW)));
-                }
-            }
-            return 0;
-        } else {
-            /*
-             * For non-EL2 CPUs a stage1+stage2 translation is just stage 1.
-             */
-            mmu_idx = stage_1_mmu_idx(mmu_idx);
-        }
-    }
-
-    /* The page table entries may downgrade secure to non-secure, but
-     * cannot upgrade an non-secure translation regime's attributes
-     * to secure.
-     */
-    attrs->secure = regime_is_secure(env, mmu_idx);
-    attrs->user = regime_is_user(env, mmu_idx);
-
-    /* Fast Context Switch Extension. This doesn't exist at all in v8.
-     * In v7 and earlier it affects all stage 1 translations.
-     */
-    if (address < 0x02000000 && mmu_idx != ARMMMUIdx_Stage2
-        && !arm_feature(env, ARM_FEATURE_V8)) {
-        if (regime_el(env, mmu_idx) == 3) {
-            address += env->cp15.fcseidr_s;
-        } else {
-            address += env->cp15.fcseidr_ns;
-        }
-    }
-
-    if (arm_feature(env, ARM_FEATURE_PMSA)) {
-        bool ret;
-        *page_size = TARGET_PAGE_SIZE;
-
-        if (arm_feature(env, ARM_FEATURE_V8)) {
-            /* PMSAv8 */
-            ret = get_phys_addr_pmsav8(env, address, access_type, mmu_idx,
-                                       phys_ptr, attrs, prot, page_size, fi);
-        } else if (arm_feature(env, ARM_FEATURE_V7)) {
-            /* PMSAv7 */
-            ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
-                                       phys_ptr, prot, page_size, fi);
-        } else {
-            /* Pre-v7 MPU */
-            ret = get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
-                                       phys_ptr, prot, fi);
-        }
-        qemu_log_mask(CPU_LOG_MMU, "PMSA MPU lookup for %s at 0x%08" PRIx32
-                      " mmu_idx %u -> %s (prot %c%c%c)\n",
-                      access_type == MMU_DATA_LOAD ? "reading" :
-                      (access_type == MMU_DATA_STORE ? "writing" : "execute"),
-                      (uint32_t)address, mmu_idx,
-                      ret ? "Miss" : "Hit",
-                      *prot & PAGE_READ ? 'r' : '-',
-                      *prot & PAGE_WRITE ? 'w' : '-',
-                      *prot & PAGE_EXEC ? 'x' : '-');
-
-        return ret;
-    }
-
-    /* Definitely a real MMU, not an MPU */
-
-    if (regime_translation_disabled(env, mmu_idx)) {
-        uint64_t hcr;
-        uint8_t memattr;
-
-        /*
-         * MMU disabled.  S1 addresses within aa64 translation regimes are
-         * still checked for bounds -- see AArch64.TranslateAddressS1Off.
-         */
-        if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
-            int r_el = regime_el(env, mmu_idx);
-            if (arm_el_is_aa64(env, r_el)) {
-                int pamax = arm_pamax(env_archcpu(env));
-                uint64_t tcr = env->cp15.tcr_el[r_el].raw_tcr;
-                int addrtop, tbi;
-
-                tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
-                if (access_type == MMU_INST_FETCH) {
-                    tbi &= ~aa64_va_parameter_tbid(tcr, mmu_idx);
-                }
-                tbi = (tbi >> extract64(address, 55, 1)) & 1;
-                addrtop = (tbi ? 55 : 63);
-
-                if (extract64(address, pamax, addrtop - pamax + 1) != 0) {
-                    fi->type = ARMFault_AddressSize;
-                    fi->level = 0;
-                    fi->stage2 = false;
-                    return 1;
-                }
-
-                /*
-                 * When TBI is disabled, we've just validated that all of the
-                 * bits above PAMax are zero, so logically we only need to
-                 * clear the top byte for TBI.  But it's clearer to follow
-                 * the pseudocode set of addrdesc.paddress.
-                 */
-                address = extract64(address, 0, 52);
-            }
-        }
-        *phys_ptr = address;
-        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-        *page_size = TARGET_PAGE_SIZE;
-
-        /* Fill in cacheattr a-la AArch64.TranslateAddressS1Off. */
-        hcr = arm_hcr_el2_eff(env);
-        cacheattrs->shareability = 0;
-        cacheattrs->is_s2_format = false;
-        if (hcr & HCR_DC) {
-            if (hcr & HCR_DCT) {
-                memattr = 0xf0;  /* Tagged, Normal, WB, RWA */
-            } else {
-                memattr = 0xff;  /* Normal, WB, RWA */
-            }
-        } else if (access_type == MMU_INST_FETCH) {
-            if (regime_sctlr(env, mmu_idx) & SCTLR_I) {
-                memattr = 0xee;  /* Normal, WT, RA, NT */
-            } else {
-                memattr = 0x44;  /* Normal, NC, No */
-            }
-            cacheattrs->shareability = 2; /* outer sharable */
-        } else {
-            memattr = 0x00;      /* Device, nGnRnE */
-        }
-        cacheattrs->attrs = memattr;
-        return 0;
-    }
-
-    if (regime_using_lpae_format(env, mmu_idx)) {
-        return get_phys_addr_lpae(env, address, access_type, mmu_idx, false,
-                                  phys_ptr, attrs, prot, page_size,
-                                  fi, cacheattrs);
-    } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
-        return get_phys_addr_v6(env, address, access_type, mmu_idx,
-                                phys_ptr, attrs, prot, page_size, fi);
-    } else {
-        return get_phys_addr_v5(env, address, access_type, mmu_idx,
-                                    phys_ptr, prot, page_size, fi);
-    }
-}
-
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
                                          MemTxAttrs *attrs)
 {
@@ -13121,7 +12852,6 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
     }
     return phys_addr;
 }
-
 #endif
 
 /* Note that signed overflow is undefined in C.  The following routines are
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
new file mode 100644
index 00000000000..318000f6d94
--- /dev/null
+++ b/target/arm/ptw.c
@@ -0,0 +1,267 @@
+/*
+ * ARM page table walking.
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "cpu.h"
+#include "internals.h"
+#include "ptw.h"
+
+
+/**
+ * get_phys_addr - get the physical address for this virtual address
+ *
+ * Find the physical address corresponding to the given virtual address,
+ * by doing a translation table walk on MMU based systems or using the
+ * MPU state on MPU based systems.
+ *
+ * Returns false if the translation was successful. Otherwise, phys_ptr, attrs,
+ * prot and page_size may not be filled in, and the populated fsr value provides
+ * information on why the translation aborted, in the format of a
+ * DFSR/IFSR fault register, with the following caveats:
+ *  * we honour the short vs long DFSR format differences.
+ *  * the WnR bit is never set (the caller must do this).
+ *  * for PSMAv5 based systems we don't bother to return a full FSR format
+ *    value.
+ *
+ * @env: CPUARMState
+ * @address: virtual address to get physical address for
+ * @access_type: 0 for read, 1 for write, 2 for execute
+ * @mmu_idx: MMU index indicating required translation regime
+ * @phys_ptr: set to the physical address corresponding to the virtual address
+ * @attrs: set to the memory transaction attributes to use
+ * @prot: set to the permissions for the page containing phys_ptr
+ * @page_size: set to the size of the page containing phys_ptr
+ * @fi: set to fault info if the translation fails
+ * @cacheattrs: (if non-NULL) set to the cacheability/shareability attributes
+ */
+bool get_phys_addr(CPUARMState *env, target_ulong address,
+                   MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                   hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
+                   target_ulong *page_size,
+                   ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
+{
+    ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
+
+    if (mmu_idx != s1_mmu_idx) {
+        /*
+         * Call ourselves recursively to do the stage 1 and then stage 2
+         * translations if mmu_idx is a two-stage regime.
+         */
+        if (arm_feature(env, ARM_FEATURE_EL2)) {
+            hwaddr ipa;
+            int s2_prot;
+            int ret;
+            bool ipa_secure;
+            ARMCacheAttrs cacheattrs2 = {};
+            ARMMMUIdx s2_mmu_idx;
+            bool is_el0;
+
+            ret = get_phys_addr(env, address, access_type, s1_mmu_idx, &ipa,
+                                attrs, prot, page_size, fi, cacheattrs);
+
+            /* If S1 fails or S2 is disabled, return early.  */
+            if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2)) {
+                *phys_ptr = ipa;
+                return ret;
+            }
+
+            ipa_secure = attrs->secure;
+            if (arm_is_secure_below_el3(env)) {
+                if (ipa_secure) {
+                    attrs->secure = !(env->cp15.vstcr_el2.raw_tcr & VSTCR_SW);
+                } else {
+                    attrs->secure = !(env->cp15.vtcr_el2.raw_tcr & VTCR_NSW);
+                }
+            } else {
+                assert(!ipa_secure);
+            }
+
+            s2_mmu_idx = attrs->secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
+            is_el0 = mmu_idx == ARMMMUIdx_E10_0 || mmu_idx == ARMMMUIdx_SE10_0;
+
+            /* S1 is done. Now do S2 translation.  */
+            ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx, is_el0,
+                                     phys_ptr, attrs, &s2_prot,
+                                     page_size, fi, &cacheattrs2);
+            fi->s2addr = ipa;
+            /* Combine the S1 and S2 perms.  */
+            *prot &= s2_prot;
+
+            /* If S2 fails, return early.  */
+            if (ret) {
+                return ret;
+            }
+
+            /* Combine the S1 and S2 cache attributes. */
+            if (arm_hcr_el2_eff(env) & HCR_DC) {
+                /*
+                 * HCR.DC forces the first stage attributes to
+                 *  Normal Non-Shareable,
+                 *  Inner Write-Back Read-Allocate Write-Allocate,
+                 *  Outer Write-Back Read-Allocate Write-Allocate.
+                 * Do not overwrite Tagged within attrs.
+                 */
+                if (cacheattrs->attrs != 0xf0) {
+                    cacheattrs->attrs = 0xff;
+                }
+                cacheattrs->shareability = 0;
+            }
+            *cacheattrs = combine_cacheattrs(env, *cacheattrs, cacheattrs2);
+
+            /* Check if IPA translates to secure or non-secure PA space. */
+            if (arm_is_secure_below_el3(env)) {
+                if (ipa_secure) {
+                    attrs->secure =
+                        !(env->cp15.vstcr_el2.raw_tcr & (VSTCR_SA | VSTCR_SW));
+                } else {
+                    attrs->secure =
+                        !((env->cp15.vtcr_el2.raw_tcr & (VTCR_NSA | VTCR_NSW))
+                        || (env->cp15.vstcr_el2.raw_tcr & (VSTCR_SA | VSTCR_SW)));
+                }
+            }
+            return 0;
+        } else {
+            /*
+             * For non-EL2 CPUs a stage1+stage2 translation is just stage 1.
+             */
+            mmu_idx = stage_1_mmu_idx(mmu_idx);
+        }
+    }
+
+    /*
+     * The page table entries may downgrade secure to non-secure, but
+     * cannot upgrade an non-secure translation regime's attributes
+     * to secure.
+     */
+    attrs->secure = regime_is_secure(env, mmu_idx);
+    attrs->user = regime_is_user(env, mmu_idx);
+
+    /*
+     * Fast Context Switch Extension. This doesn't exist at all in v8.
+     * In v7 and earlier it affects all stage 1 translations.
+     */
+    if (address < 0x02000000 && mmu_idx != ARMMMUIdx_Stage2
+        && !arm_feature(env, ARM_FEATURE_V8)) {
+        if (regime_el(env, mmu_idx) == 3) {
+            address += env->cp15.fcseidr_s;
+        } else {
+            address += env->cp15.fcseidr_ns;
+        }
+    }
+
+    if (arm_feature(env, ARM_FEATURE_PMSA)) {
+        bool ret;
+        *page_size = TARGET_PAGE_SIZE;
+
+        if (arm_feature(env, ARM_FEATURE_V8)) {
+            /* PMSAv8 */
+            ret = get_phys_addr_pmsav8(env, address, access_type, mmu_idx,
+                                       phys_ptr, attrs, prot, page_size, fi);
+        } else if (arm_feature(env, ARM_FEATURE_V7)) {
+            /* PMSAv7 */
+            ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
+                                       phys_ptr, prot, page_size, fi);
+        } else {
+            /* Pre-v7 MPU */
+            ret = get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
+                                       phys_ptr, prot, fi);
+        }
+        qemu_log_mask(CPU_LOG_MMU, "PMSA MPU lookup for %s at 0x%08" PRIx32
+                      " mmu_idx %u -> %s (prot %c%c%c)\n",
+                      access_type == MMU_DATA_LOAD ? "reading" :
+                      (access_type == MMU_DATA_STORE ? "writing" : "execute"),
+                      (uint32_t)address, mmu_idx,
+                      ret ? "Miss" : "Hit",
+                      *prot & PAGE_READ ? 'r' : '-',
+                      *prot & PAGE_WRITE ? 'w' : '-',
+                      *prot & PAGE_EXEC ? 'x' : '-');
+
+        return ret;
+    }
+
+    /* Definitely a real MMU, not an MPU */
+
+    if (regime_translation_disabled(env, mmu_idx)) {
+        uint64_t hcr;
+        uint8_t memattr;
+
+        /*
+         * MMU disabled.  S1 addresses within aa64 translation regimes are
+         * still checked for bounds -- see AArch64.TranslateAddressS1Off.
+         */
+        if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
+            int r_el = regime_el(env, mmu_idx);
+            if (arm_el_is_aa64(env, r_el)) {
+                int pamax = arm_pamax(env_archcpu(env));
+                uint64_t tcr = env->cp15.tcr_el[r_el].raw_tcr;
+                int addrtop, tbi;
+
+                tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
+                if (access_type == MMU_INST_FETCH) {
+                    tbi &= ~aa64_va_parameter_tbid(tcr, mmu_idx);
+                }
+                tbi = (tbi >> extract64(address, 55, 1)) & 1;
+                addrtop = (tbi ? 55 : 63);
+
+                if (extract64(address, pamax, addrtop - pamax + 1) != 0) {
+                    fi->type = ARMFault_AddressSize;
+                    fi->level = 0;
+                    fi->stage2 = false;
+                    return 1;
+                }
+
+                /*
+                 * When TBI is disabled, we've just validated that all of the
+                 * bits above PAMax are zero, so logically we only need to
+                 * clear the top byte for TBI.  But it's clearer to follow
+                 * the pseudocode set of addrdesc.paddress.
+                 */
+                address = extract64(address, 0, 52);
+            }
+        }
+        *phys_ptr = address;
+        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        *page_size = TARGET_PAGE_SIZE;
+
+        /* Fill in cacheattr a-la AArch64.TranslateAddressS1Off. */
+        hcr = arm_hcr_el2_eff(env);
+        cacheattrs->shareability = 0;
+        cacheattrs->is_s2_format = false;
+        if (hcr & HCR_DC) {
+            if (hcr & HCR_DCT) {
+                memattr = 0xf0;  /* Tagged, Normal, WB, RWA */
+            } else {
+                memattr = 0xff;  /* Normal, WB, RWA */
+            }
+        } else if (access_type == MMU_INST_FETCH) {
+            if (regime_sctlr(env, mmu_idx) & SCTLR_I) {
+                memattr = 0xee;  /* Normal, WT, RA, NT */
+            } else {
+                memattr = 0x44;  /* Normal, NC, No */
+            }
+            cacheattrs->shareability = 2; /* outer sharable */
+        } else {
+            memattr = 0x00;      /* Device, nGnRnE */
+        }
+        cacheattrs->attrs = memattr;
+        return 0;
+    }
+
+    if (regime_using_lpae_format(env, mmu_idx)) {
+        return get_phys_addr_lpae(env, address, access_type, mmu_idx, false,
+                                  phys_ptr, attrs, prot, page_size,
+                                  fi, cacheattrs);
+    } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
+        return get_phys_addr_v6(env, address, access_type, mmu_idx,
+                                phys_ptr, attrs, prot, page_size, fi);
+    } else {
+        return get_phys_addr_v5(env, address, access_type, mmu_idx,
+                                    phys_ptr, prot, page_size, fi);
+    }
+}
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 50f152214af..ac571fc45db 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -58,6 +58,7 @@ arm_softmmu_ss.add(files(
   'machine.c',
   'monitor.c',
   'psci.c',
+  'ptw.c',
 ))
 
 subdir('hvf')
-- 
2.25.1


