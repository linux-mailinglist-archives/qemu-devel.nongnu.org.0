Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D0F6062D8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:20:50 +0200 (CEST)
Received: from localhost ([::1]:41266 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWPf-0000pV-5e
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:20:48 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWHO-0008QA-MJ
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUZB-0001Yp-El
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:49 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUYs-00011v-Cw
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:29 -0400
Received: by mail-wr1-x431.google.com with SMTP id a3so34065147wrt.0
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LVpoijYYZDISaHGUrIWsTdA0LJPMFim/HGwImr/Ncbs=;
 b=f8rB1XQW7a/flj8vSOKwzulCGJK135Zea24t7mdF3jflFzfsj7TDKJWSATIpgtGdrZ
 zKgdlZVZqrFDh5wPpJAIVif4tCR9n7roA7PVLN4ozoGywDbVzJvkRXltTKttYZmHsFlL
 YPqRdk0723LBfMEGzK77+OqbDypXA0VuDRJV8uJyYyvWubeJ4IG1bqJ1Xlb7X99iGOpb
 6o4TVD1VM87mEsMDdvPQatCS7ETAxUTsCY0t1EpRt7a2D61tYMPFvnJGTuV9fV1O+W8X
 9d0U+nY6UiSeDn/TvEpGFARPbpTpxuJ7GByBzjQ9yT3zCmVuBqqc6E+8SnBRJ+0rkLaM
 PFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LVpoijYYZDISaHGUrIWsTdA0LJPMFim/HGwImr/Ncbs=;
 b=WW/uHDk8bt0ulaLU35UUTwkBiPZ8gdoErsQaIPV16LY8li01eQoG8pkvyWbbJZzjOx
 5EJuJGALjIDKHnAGiCfSxIfwzA8uEQ64r5PDZ7/4yieJAnmDYe2tW/9BEZvP8TSw/t23
 4GbvI8RhyLlrX/CppnKDJ+kz+2bx/RI1of6omTkp6E6uW6IIBloYDwExKK03BkGK6gme
 UCveCcHCsH0IDH7qdJqFuuK7V90gt6S814M6kchsppAYx96qAhtsc5vLk3iecPZAgz/8
 ZMneHYHxPyuVC4cM39Uhfo2yfK6e2ABTVtzNKbvecT9plhefhyr/egGsZ2v6dEFJ5gsx
 oSGw==
X-Gm-Message-State: ACrzQf1CjUeuKXsdGSPLsjLlUZ4NNGMzgk43Y+xKFaAvZ3aEYd4OpnlI
 vQ8nnEgUq8FKpEoMmRm+pwWqgRW1JsX0qA==
X-Google-Smtp-Source: AMsMyM5Rb1H6JTcEpNtdSiPQ65DWPkUkicKsa4qBtk35rCp7omIDt5pvsRwwSx2jQmhLBCf9dxYlgw==
X-Received: by 2002:a5d:6d89:0:b0:22e:4af7:84a5 with SMTP id
 l9-20020a5d6d89000000b0022e4af784a5mr8634525wrs.4.1666268524337; 
 Thu, 20 Oct 2022 05:22:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b00230c9d427f9sm16520192wrs.53.2022.10.20.05.22.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:22:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/24] target/arm: Use softmmu tlbs for page table walking
Date: Thu, 20 Oct 2022 13:21:34 +0100
Message-Id: <20221020122146.3177980-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020122146.3177980-1-peter.maydell@linaro.org>
References: <20221020122146.3177980-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

So far, limit the change to S1_ptw_translate, arm_ldl_ptw, and
arm_ldq_ptw.  Use probe_access_full to find the host address,
and if so use a host load.  If the probe fails, we've got our
fault info already.  On the off chance that page tables are not
in RAM, continue to use the address_space_ld* functions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221011031911.2408754-11-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h        |   5 +
 target/arm/ptw.c        | 196 +++++++++++++++++++++++++---------------
 target/arm/tlb_helper.c |  17 +++-
 3 files changed, 144 insertions(+), 74 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 315c1c2820c..64fc03214c1 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -225,6 +225,8 @@ typedef struct CPUARMTBFlags {
     target_ulong flags2;
 } CPUARMTBFlags;
 
+typedef struct ARMMMUFaultInfo ARMMMUFaultInfo;
+
 typedef struct CPUArchState {
     /* Regs for current mode.  */
     uint32_t regs[16];
@@ -715,6 +717,9 @@ typedef struct CPUArchState {
     struct CPUBreakpoint *cpu_breakpoint[16];
     struct CPUWatchpoint *cpu_watchpoint[16];
 
+    /* Optional fault info across tlb lookup. */
+    ARMMMUFaultInfo *tlb_fi;
+
     /* Fields up to this point are cleared by a CPU reset */
     struct {} end_reset_fields;
 
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index c58788ac693..8f41d285b7d 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -9,6 +9,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qemu/range.h"
+#include "exec/exec-all.h"
 #include "cpu.h"
 #include "internals.h"
 #include "idau.h"
@@ -21,6 +22,7 @@ typedef struct S1Translate {
     bool out_secure;
     bool out_be;
     hwaddr out_phys;
+    void *out_host;
 } S1Translate;
 
 static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
@@ -200,7 +202,7 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
     return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
 }
 
-static bool ptw_attrs_are_device(uint64_t hcr, ARMCacheAttrs cacheattrs)
+static bool S2_attrs_are_device(uint64_t hcr, uint8_t attrs)
 {
     /*
      * For an S1 page table walk, the stage 1 attributes are always
@@ -211,11 +213,10 @@ static bool ptw_attrs_are_device(uint64_t hcr, ARMCacheAttrs cacheattrs)
      * With HCR_EL2.FWB == 1 this is when descriptor bit [4] is 0, ie
      * when cacheattrs.attrs bit [2] is 0.
      */
-    assert(cacheattrs.is_s2_format);
     if (hcr & HCR_FWB) {
-        return (cacheattrs.attrs & 0x4) == 0;
+        return (attrs & 0x4) == 0;
     } else {
-        return (cacheattrs.attrs & 0xc) == 0;
+        return (attrs & 0xc) == 0;
     }
 }
 
@@ -224,32 +225,65 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
                              hwaddr addr, ARMMMUFaultInfo *fi)
 {
     bool is_secure = ptw->in_secure;
+    ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
     ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
+    bool s2_phys = false;
+    uint8_t pte_attrs;
+    bool pte_secure;
 
-    if (arm_mmu_idx_is_stage1_of_2(ptw->in_mmu_idx) &&
-        !regime_translation_disabled(env, s2_mmu_idx, is_secure)) {
-        GetPhysAddrResult s2 = {};
-        S1Translate s2ptw = {
-            .in_mmu_idx = s2_mmu_idx,
-            .in_secure = is_secure,
-            .in_debug = ptw->in_debug,
-        };
-        uint64_t hcr;
-        int ret;
+    if (!arm_mmu_idx_is_stage1_of_2(mmu_idx)
+        || regime_translation_disabled(env, s2_mmu_idx, is_secure)) {
+        s2_mmu_idx = is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
+        s2_phys = true;
+    }
 
-        ret = get_phys_addr_lpae(env, &s2ptw, addr, MMU_DATA_LOAD,
-                                 false, &s2, fi);
-        if (ret) {
-            assert(fi->type != ARMFault_None);
-            fi->s2addr = addr;
-            fi->stage2 = true;
-            fi->s1ptw = true;
-            fi->s1ns = !is_secure;
-            return false;
+    if (unlikely(ptw->in_debug)) {
+        /*
+         * From gdbstub, do not use softmmu so that we don't modify the
+         * state of the cpu at all, including softmmu tlb contents.
+         */
+        if (s2_phys) {
+            ptw->out_phys = addr;
+            pte_attrs = 0;
+            pte_secure = is_secure;
+        } else {
+            S1Translate s2ptw = {
+                .in_mmu_idx = s2_mmu_idx,
+                .in_secure = is_secure,
+                .in_debug = true,
+            };
+            GetPhysAddrResult s2 = { };
+            if (!get_phys_addr_lpae(env, &s2ptw, addr, MMU_DATA_LOAD,
+                                    false, &s2, fi)) {
+                goto fail;
+            }
+            ptw->out_phys = s2.f.phys_addr;
+            pte_attrs = s2.cacheattrs.attrs;
+            pte_secure = s2.f.attrs.secure;
         }
+        ptw->out_host = NULL;
+    } else {
+        CPUTLBEntryFull *full;
+        int flags;
 
-        hcr = arm_hcr_el2_eff_secstate(env, is_secure);
-        if ((hcr & HCR_PTW) && ptw_attrs_are_device(hcr, s2.cacheattrs)) {
+        env->tlb_fi = fi;
+        flags = probe_access_full(env, addr, MMU_DATA_LOAD,
+                                  arm_to_core_mmu_idx(s2_mmu_idx),
+                                  true, &ptw->out_host, &full, 0);
+        env->tlb_fi = NULL;
+
+        if (unlikely(flags & TLB_INVALID_MASK)) {
+            goto fail;
+        }
+        ptw->out_phys = full->phys_addr;
+        pte_attrs = full->pte_attrs;
+        pte_secure = full->attrs.secure;
+    }
+
+    if (!s2_phys) {
+        uint64_t hcr = arm_hcr_el2_eff_secstate(env, is_secure);
+
+        if ((hcr & HCR_PTW) && S2_attrs_are_device(hcr, pte_attrs)) {
             /*
              * PTW set and S1 walk touched S2 Device memory:
              * generate Permission fault.
@@ -261,25 +295,23 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
             fi->s1ns = !is_secure;
             return false;
         }
-
-        if (arm_is_secure_below_el3(env)) {
-            /* Check if page table walk is to secure or non-secure PA space. */
-            if (is_secure) {
-                is_secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
-            } else {
-                is_secure = !(env->cp15.vtcr_el2 & VTCR_NSW);
-            }
-        } else {
-            assert(!is_secure);
-        }
-
-        addr = s2.f.phys_addr;
     }
 
-    ptw->out_secure = is_secure;
-    ptw->out_phys = addr;
-    ptw->out_be = regime_translation_big_endian(env, ptw->in_mmu_idx);
+    /* Check if page table walk is to secure or non-secure PA space. */
+    ptw->out_secure = (is_secure
+                       && !(pte_secure
+                            ? env->cp15.vstcr_el2 & VSTCR_SW
+                            : env->cp15.vtcr_el2 & VTCR_NSW));
+    ptw->out_be = regime_translation_big_endian(env, mmu_idx);
     return true;
+
+ fail:
+    assert(fi->type != ARMFault_None);
+    fi->s2addr = addr;
+    fi->stage2 = true;
+    fi->s1ptw = true;
+    fi->s1ns = !is_secure;
+    return false;
 }
 
 /* All loads done in the course of a page table walk go through here. */
@@ -287,56 +319,78 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, S1Translate *ptw, hwaddr addr,
                             ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
-    MemTxAttrs attrs = {};
-    MemTxResult result = MEMTX_OK;
-    AddressSpace *as;
     uint32_t data;
 
     if (!S1_ptw_translate(env, ptw, addr, fi)) {
+        /* Failure. */
+        assert(fi->s1ptw);
         return 0;
     }
-    addr = ptw->out_phys;
-    attrs.secure = ptw->out_secure;
-    as = arm_addressspace(cs, attrs);
-    if (ptw->out_be) {
-        data = address_space_ldl_be(as, addr, attrs, &result);
+
+    if (likely(ptw->out_host)) {
+        /* Page tables are in RAM, and we have the host address. */
+        if (ptw->out_be) {
+            data = ldl_be_p(ptw->out_host);
+        } else {
+            data = ldl_le_p(ptw->out_host);
+        }
     } else {
-        data = address_space_ldl_le(as, addr, attrs, &result);
+        /* Page tables are in MMIO. */
+        MemTxAttrs attrs = { .secure = ptw->out_secure };
+        AddressSpace *as = arm_addressspace(cs, attrs);
+        MemTxResult result = MEMTX_OK;
+
+        if (ptw->out_be) {
+            data = address_space_ldl_be(as, ptw->out_phys, attrs, &result);
+        } else {
+            data = address_space_ldl_le(as, ptw->out_phys, attrs, &result);
+        }
+        if (unlikely(result != MEMTX_OK)) {
+            fi->type = ARMFault_SyncExternalOnWalk;
+            fi->ea = arm_extabort_type(result);
+            return 0;
+        }
     }
-    if (result == MEMTX_OK) {
-        return data;
-    }
-    fi->type = ARMFault_SyncExternalOnWalk;
-    fi->ea = arm_extabort_type(result);
-    return 0;
+    return data;
 }
 
 static uint64_t arm_ldq_ptw(CPUARMState *env, S1Translate *ptw, hwaddr addr,
                             ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
-    MemTxAttrs attrs = {};
-    MemTxResult result = MEMTX_OK;
-    AddressSpace *as;
     uint64_t data;
 
     if (!S1_ptw_translate(env, ptw, addr, fi)) {
+        /* Failure. */
+        assert(fi->s1ptw);
         return 0;
     }
-    addr = ptw->out_phys;
-    attrs.secure = ptw->out_secure;
-    as = arm_addressspace(cs, attrs);
-    if (ptw->out_be) {
-        data = address_space_ldq_be(as, addr, attrs, &result);
+
+    if (likely(ptw->out_host)) {
+        /* Page tables are in RAM, and we have the host address. */
+        if (ptw->out_be) {
+            data = ldq_be_p(ptw->out_host);
+        } else {
+            data = ldq_le_p(ptw->out_host);
+        }
     } else {
-        data = address_space_ldq_le(as, addr, attrs, &result);
+        /* Page tables are in MMIO. */
+        MemTxAttrs attrs = { .secure = ptw->out_secure };
+        AddressSpace *as = arm_addressspace(cs, attrs);
+        MemTxResult result = MEMTX_OK;
+
+        if (ptw->out_be) {
+            data = address_space_ldq_be(as, ptw->out_phys, attrs, &result);
+        } else {
+            data = address_space_ldq_le(as, ptw->out_phys, attrs, &result);
+        }
+        if (unlikely(result != MEMTX_OK)) {
+            fi->type = ARMFault_SyncExternalOnWalk;
+            fi->ea = arm_extabort_type(result);
+            return 0;
+        }
     }
-    if (result == MEMTX_OK) {
-        return data;
-    }
-    fi->type = ARMFault_SyncExternalOnWalk;
-    fi->ea = arm_extabort_type(result);
-    return 0;
+    return data;
 }
 
 static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 3462a6ea14e..69b0dc69dfa 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -208,10 +208,21 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       bool probe, uintptr_t retaddr)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-    ARMMMUFaultInfo fi = {};
     GetPhysAddrResult res = {};
+    ARMMMUFaultInfo local_fi, *fi;
     int ret;
 
+    /*
+     * Allow S1_ptw_translate to see any fault generated here.
+     * Since this may recurse, read and clear.
+     */
+    fi = cpu->env.tlb_fi;
+    if (fi) {
+        cpu->env.tlb_fi = NULL;
+    } else {
+        fi = memset(&local_fi, 0, sizeof(local_fi));
+    }
+
     /*
      * Walk the page table and (if the mapping exists) add the page
      * to the TLB.  On success, return true.  Otherwise, if probing,
@@ -220,7 +231,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
      */
     ret = get_phys_addr(&cpu->env, address, access_type,
                         core_to_arm_mmu_idx(&cpu->env, mmu_idx),
-                        &res, &fi);
+                        &res, fi);
     if (likely(!ret)) {
         /*
          * Map a single [sub]page. Regions smaller than our declared
@@ -242,7 +253,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     } else {
         /* now we have a real cpu fault */
         cpu_restore_state(cs, retaddr, true);
-        arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
+        arm_deliver_fault(cpu, address, access_type, mmu_idx, fi);
     }
 }
 #else
-- 
2.25.1


