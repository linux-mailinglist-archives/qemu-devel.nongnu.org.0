Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC353544968
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 12:44:23 +0200 (CEST)
Received: from localhost ([::1]:60330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzFeH-0002sU-VC
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 06:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7K-0001Yq-H2
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:18 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7F-000633-2Y
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:14 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 j5-20020a05600c1c0500b0039c5dbbfa48so3048438wms.5
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DsW3nbtPSrSfTu9Rena6hSRG4ePZWb5I260ZDnqhOaQ=;
 b=ZZjTHK2siwm0u69fTlk3CnlYIS06ODUXpXqs7PuwMYQkNILJofl0DleClJfx1XF4G4
 BB9FhVDlNJWE98Q2x2vwZwa+qd3j1yHd5gKx1WA9bCFMR5OZGtfv27lau2MuDLtQxj0w
 WDRS+7X6X7EGeoY7sYtyT/TuoDyGjrKD5RDULq5gQVoP1pv5Uqg5VBK6e4vqwXkjXzeC
 FPwu8mJsuulorgRE+pvNYrkul6MjmEDnmXrOcip5BBsLzIevPn4hNdwrakldQhrx1561
 BnDLN35bHB3J2O2frxFc1GolMWvvGujG2tXmXkByYInUv5rW1cnxwh9fMX3cYUxy9vye
 UsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DsW3nbtPSrSfTu9Rena6hSRG4ePZWb5I260ZDnqhOaQ=;
 b=1fPPgN/x3u4JJsswXg64idTvGGsYlp3X31fty/FLZ+a1hRmRLlseXlxImL0dMNs2m0
 Ry5pdn/kBgmT/l6Aym9TWUn8FCoCgGEivYHc1f6CMkd5pgxbffUqb3af81+FvCxYVA4l
 YB8P/XLm9pP5WyO3OXIyoCQiIXPzkPP+zXBznzhXpK6gu08MqBQUYvegQr17+TQPVKiZ
 6wWfzA68ERANjXtERmxh8jt1FG1t+U0wYY0M4apGDOTQyB+ZI0IzlagAN5zw5/KMrzni
 WBpRfdrkhBDQLRlvNjbTJ0DKOkSzW1lqa0+3/POoR+tQOEQozRnFX2Sqv3xwoC28d7jl
 R0oQ==
X-Gm-Message-State: AOAM530geySCj0DwIaz+Rmzy2FtSAB6s+Ou9OVU9D8ezlU5Nz4t2xOo3
 Iy5ZbOds32WbTXs5mBtWsVksLtJ77iMxLQ==
X-Google-Smtp-Source: ABdhPJyW4Dsesi96PK/47D4fBgvd7I/dUBpj5KpEAsRVxVLnTwKwogQ6vZfqtRbHAiqbYZdDtsV+Tw==
X-Received: by 2002:a05:600c:3792:b0:39c:6667:202 with SMTP id
 o18-20020a05600c379200b0039c66670202mr2254531wmr.104.1654765566707; 
 Thu, 09 Jun 2022 02:06:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/55] target/arm: Move arm_{ldl,ldq}_ptw to ptw.c
Date: Thu,  9 Jun 2022 10:05:05 +0100
Message-Id: <20220609090537.1971756-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

Move the ptw load functions, plus 3 common subroutines:
S1_ptw_translate, ptw_attrs_are_device, and regime_translation_big_endian.
This also allows get_phys_addr_lpae to become static again.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220604040607.269301-17-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.h    |  13 ----
 target/arm/helper.c | 141 --------------------------------------
 target/arm/ptw.c    | 160 ++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 154 insertions(+), 160 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index 31744df6646..28b8cb9fb89 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -13,11 +13,6 @@
 
 extern const uint8_t pamax_map[7];
 
-uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
-                     ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi);
-uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
-                     ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi);
-
 bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx);
 bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx);
 uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn);
@@ -40,13 +35,5 @@ int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0);
 int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
                int ap, int ns, int xn, int pxn);
 
-bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
-                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                        bool s1_is_el0,
-                        hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
-                        target_ulong *page_size_ptr,
-                        ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
-    __attribute__((nonnull));
-
 #endif /* !CONFIG_USER_ONLY */
 #endif /* TARGET_ARM_PTW_H */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7de815fe986..398bcd62ab9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10475,12 +10475,6 @@ bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx)
     return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
 }
 
-static inline bool regime_translation_big_endian(CPUARMState *env,
-                                                 ARMMMUIdx mmu_idx)
-{
-    return (regime_sctlr(env, mmu_idx) & SCTLR_EE) != 0;
-}
-
 /* Return the TTBR associated with this translation regime */
 uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn)
 {
@@ -10773,141 +10767,6 @@ int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
     return prot_rw | PAGE_EXEC;
 }
 
-static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
-{
-    /*
-     * For an S1 page table walk, the stage 1 attributes are always
-     * some form of "this is Normal memory". The combined S1+S2
-     * attributes are therefore only Device if stage 2 specifies Device.
-     * With HCR_EL2.FWB == 0 this is when descriptor bits [5:4] are 0b00,
-     * ie when cacheattrs.attrs bits [3:2] are 0b00.
-     * With HCR_EL2.FWB == 1 this is when descriptor bit [4] is 0, ie
-     * when cacheattrs.attrs bit [2] is 0.
-     */
-    assert(cacheattrs.is_s2_format);
-    if (arm_hcr_el2_eff(env) & HCR_FWB) {
-        return (cacheattrs.attrs & 0x4) == 0;
-    } else {
-        return (cacheattrs.attrs & 0xc) == 0;
-    }
-}
-
-/* Translate a S1 pagetable walk through S2 if needed.  */
-static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
-                               hwaddr addr, bool *is_secure,
-                               ARMMMUFaultInfo *fi)
-{
-    if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
-        !regime_translation_disabled(env, ARMMMUIdx_Stage2)) {
-        target_ulong s2size;
-        hwaddr s2pa;
-        int s2prot;
-        int ret;
-        ARMMMUIdx s2_mmu_idx = *is_secure ? ARMMMUIdx_Stage2_S
-                                          : ARMMMUIdx_Stage2;
-        ARMCacheAttrs cacheattrs = {};
-        MemTxAttrs txattrs = {};
-
-        ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx, false,
-                                 &s2pa, &txattrs, &s2prot, &s2size, fi,
-                                 &cacheattrs);
-        if (ret) {
-            assert(fi->type != ARMFault_None);
-            fi->s2addr = addr;
-            fi->stage2 = true;
-            fi->s1ptw = true;
-            fi->s1ns = !*is_secure;
-            return ~0;
-        }
-        if ((arm_hcr_el2_eff(env) & HCR_PTW) &&
-            ptw_attrs_are_device(env, cacheattrs)) {
-            /*
-             * PTW set and S1 walk touched S2 Device memory:
-             * generate Permission fault.
-             */
-            fi->type = ARMFault_Permission;
-            fi->s2addr = addr;
-            fi->stage2 = true;
-            fi->s1ptw = true;
-            fi->s1ns = !*is_secure;
-            return ~0;
-        }
-
-        if (arm_is_secure_below_el3(env)) {
-            /* Check if page table walk is to secure or non-secure PA space. */
-            if (*is_secure) {
-                *is_secure = !(env->cp15.vstcr_el2.raw_tcr & VSTCR_SW);
-            } else {
-                *is_secure = !(env->cp15.vtcr_el2.raw_tcr & VTCR_NSW);
-            }
-        } else {
-            assert(!*is_secure);
-        }
-
-        addr = s2pa;
-    }
-    return addr;
-}
-
-/* All loads done in the course of a page table walk go through here. */
-uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
-                     ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    MemTxAttrs attrs = {};
-    MemTxResult result = MEMTX_OK;
-    AddressSpace *as;
-    uint32_t data;
-
-    addr = S1_ptw_translate(env, mmu_idx, addr, &is_secure, fi);
-    attrs.secure = is_secure;
-    as = arm_addressspace(cs, attrs);
-    if (fi->s1ptw) {
-        return 0;
-    }
-    if (regime_translation_big_endian(env, mmu_idx)) {
-        data = address_space_ldl_be(as, addr, attrs, &result);
-    } else {
-        data = address_space_ldl_le(as, addr, attrs, &result);
-    }
-    if (result == MEMTX_OK) {
-        return data;
-    }
-    fi->type = ARMFault_SyncExternalOnWalk;
-    fi->ea = arm_extabort_type(result);
-    return 0;
-}
-
-uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
-                     ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    MemTxAttrs attrs = {};
-    MemTxResult result = MEMTX_OK;
-    AddressSpace *as;
-    uint64_t data;
-
-    addr = S1_ptw_translate(env, mmu_idx, addr, &is_secure, fi);
-    attrs.secure = is_secure;
-    as = arm_addressspace(cs, attrs);
-    if (fi->s1ptw) {
-        return 0;
-    }
-    if (regime_translation_big_endian(env, mmu_idx)) {
-        data = address_space_ldq_be(as, addr, attrs, &result);
-    } else {
-        data = address_space_ldq_le(as, addr, attrs, &result);
-    }
-    if (result == MEMTX_OK) {
-        return data;
-    }
-    fi->type = ARMFault_SyncExternalOnWalk;
-    fi->ea = arm_extabort_type(result);
-    return 0;
-}
-
 /*
  * check_s2_mmu_setup
  * @cpu:        ARMCPU
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index cbccf91b132..e4b860d2aee 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -15,6 +15,154 @@
 #include "ptw.h"
 
 
+static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
+                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                               bool s1_is_el0, hwaddr *phys_ptr,
+                               MemTxAttrs *txattrs, int *prot,
+                               target_ulong *page_size_ptr,
+                               ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
+    __attribute__((nonnull));
+
+static bool regime_translation_big_endian(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    return (regime_sctlr(env, mmu_idx) & SCTLR_EE) != 0;
+}
+
+static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
+{
+    /*
+     * For an S1 page table walk, the stage 1 attributes are always
+     * some form of "this is Normal memory". The combined S1+S2
+     * attributes are therefore only Device if stage 2 specifies Device.
+     * With HCR_EL2.FWB == 0 this is when descriptor bits [5:4] are 0b00,
+     * ie when cacheattrs.attrs bits [3:2] are 0b00.
+     * With HCR_EL2.FWB == 1 this is when descriptor bit [4] is 0, ie
+     * when cacheattrs.attrs bit [2] is 0.
+     */
+    assert(cacheattrs.is_s2_format);
+    if (arm_hcr_el2_eff(env) & HCR_FWB) {
+        return (cacheattrs.attrs & 0x4) == 0;
+    } else {
+        return (cacheattrs.attrs & 0xc) == 0;
+    }
+}
+
+/* Translate a S1 pagetable walk through S2 if needed.  */
+static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
+                               hwaddr addr, bool *is_secure,
+                               ARMMMUFaultInfo *fi)
+{
+    if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
+        !regime_translation_disabled(env, ARMMMUIdx_Stage2)) {
+        target_ulong s2size;
+        hwaddr s2pa;
+        int s2prot;
+        int ret;
+        ARMMMUIdx s2_mmu_idx = *is_secure ? ARMMMUIdx_Stage2_S
+                                          : ARMMMUIdx_Stage2;
+        ARMCacheAttrs cacheattrs = {};
+        MemTxAttrs txattrs = {};
+
+        ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx, false,
+                                 &s2pa, &txattrs, &s2prot, &s2size, fi,
+                                 &cacheattrs);
+        if (ret) {
+            assert(fi->type != ARMFault_None);
+            fi->s2addr = addr;
+            fi->stage2 = true;
+            fi->s1ptw = true;
+            fi->s1ns = !*is_secure;
+            return ~0;
+        }
+        if ((arm_hcr_el2_eff(env) & HCR_PTW) &&
+            ptw_attrs_are_device(env, cacheattrs)) {
+            /*
+             * PTW set and S1 walk touched S2 Device memory:
+             * generate Permission fault.
+             */
+            fi->type = ARMFault_Permission;
+            fi->s2addr = addr;
+            fi->stage2 = true;
+            fi->s1ptw = true;
+            fi->s1ns = !*is_secure;
+            return ~0;
+        }
+
+        if (arm_is_secure_below_el3(env)) {
+            /* Check if page table walk is to secure or non-secure PA space. */
+            if (*is_secure) {
+                *is_secure = !(env->cp15.vstcr_el2.raw_tcr & VSTCR_SW);
+            } else {
+                *is_secure = !(env->cp15.vtcr_el2.raw_tcr & VTCR_NSW);
+            }
+        } else {
+            assert(!*is_secure);
+        }
+
+        addr = s2pa;
+    }
+    return addr;
+}
+
+/* All loads done in the course of a page table walk go through here. */
+static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
+                            ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    MemTxAttrs attrs = {};
+    MemTxResult result = MEMTX_OK;
+    AddressSpace *as;
+    uint32_t data;
+
+    addr = S1_ptw_translate(env, mmu_idx, addr, &is_secure, fi);
+    attrs.secure = is_secure;
+    as = arm_addressspace(cs, attrs);
+    if (fi->s1ptw) {
+        return 0;
+    }
+    if (regime_translation_big_endian(env, mmu_idx)) {
+        data = address_space_ldl_be(as, addr, attrs, &result);
+    } else {
+        data = address_space_ldl_le(as, addr, attrs, &result);
+    }
+    if (result == MEMTX_OK) {
+        return data;
+    }
+    fi->type = ARMFault_SyncExternalOnWalk;
+    fi->ea = arm_extabort_type(result);
+    return 0;
+}
+
+static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
+                            ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    MemTxAttrs attrs = {};
+    MemTxResult result = MEMTX_OK;
+    AddressSpace *as;
+    uint64_t data;
+
+    addr = S1_ptw_translate(env, mmu_idx, addr, &is_secure, fi);
+    attrs.secure = is_secure;
+    as = arm_addressspace(cs, attrs);
+    if (fi->s1ptw) {
+        return 0;
+    }
+    if (regime_translation_big_endian(env, mmu_idx)) {
+        data = address_space_ldq_be(as, addr, attrs, &result);
+    } else {
+        data = address_space_ldq_le(as, addr, attrs, &result);
+    }
+    if (result == MEMTX_OK) {
+        return data;
+    }
+    fi->type = ARMFault_SyncExternalOnWalk;
+    fi->ea = arm_extabort_type(result);
+    return 0;
+}
+
 static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
                                      uint32_t *table, uint32_t address)
 {
@@ -338,12 +486,12 @@ do_fault:
  * @fi: set to fault info if the translation fails
  * @cacheattrs: (if non-NULL) set to the cacheability/shareability attributes
  */
-bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
-                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                        bool s1_is_el0,
-                        hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
-                        target_ulong *page_size_ptr,
-                        ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
+static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
+                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                               bool s1_is_el0, hwaddr *phys_ptr,
+                               MemTxAttrs *txattrs, int *prot,
+                               target_ulong *page_size_ptr,
+                               ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
 {
     ARMCPU *cpu = env_archcpu(env);
     CPUState *cs = CPU(cpu);
-- 
2.25.1


