Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B145448E3
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 12:30:04 +0200 (CEST)
Received: from localhost ([::1]:42880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzFQQ-0006qM-La
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 06:30:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE79-0001Xq-5M
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:08 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:43532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE72-0005uZ-QU
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:02 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 67-20020a1c1946000000b00397382b44f4so12289092wmz.2
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0Ac7KbUehUrhXzsuRCDQnaYGhbdKNCku5Way9XfeMZo=;
 b=R7KO9PzZ/pB0nd8inZoLEQw0ERb5LxGezHzFfZC361K6hTCLflUmg4fD5FVfWn5oQn
 Rlv5MXYBbC19BRz77vAefjOmI2fPAikzp97igxl79mxolXePWfiTZEZOdyHf4AWeQxI0
 7YvXGOmoGSMID+qEXOEsiNdS0vZq3pvNj5fgl+8rvf/YIYcItSqhR+NS8t76VY2SbfK4
 VwGw19Cp3R7VhAh3FLJf5hxEmQPkEizbsHeNSCFtpc6D8uuAM191XOhgGZvNZV5OjXyL
 RZRuYhRCyr8FAcdD8f8hBhKiO+rjDT9E2kQUMC0+h4wlGSqKi2Sgp16eATPb8lTx/kSX
 DMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Ac7KbUehUrhXzsuRCDQnaYGhbdKNCku5Way9XfeMZo=;
 b=XNWhLrXZTE7YlTCk6/bd0b27lDNDCLy6wz3QM3R/EIZtEB6r53B63Slh0b8ZuZrSOZ
 rF4/OGsrdn7Q0cXil5cpG5A8SCoxc0ltN+vv7MK7OuzRKDyu3SRqChO8DHkd++tHKDmg
 t0O0e/C9QnMivsmewIfztG0y9ei6I5wijDi7tDVCp4W2GbPvpxO8c++HHqQLrRxYPLLk
 LoGifJsCIBDVqdiQlGLmBbQg2sXYSAplaIQTdaZ3gsEZrJ7p2a59pbKswP9fvLg8UIvk
 rRJg3hnxkQcZ+IIUr+BcOpJ3s8/pM6lFHuC/+iBBapeE2zqTGc5qAZ20fAUcxJctRo0v
 3jvw==
X-Gm-Message-State: AOAM531P+3pvPzLxxzadFs8zZGuUXxO9JByQPfCJG3NSB30jUpvoMEWp
 xDNrjHmSUYRm3zfhjIesMOn97R4IV1lbFw==
X-Google-Smtp-Source: ABdhPJz3UySPhzdxcLsmfx9li6RfoZObN/DYmaxiUxkUNt5V9WT/a4mTVg63Vik/GwkWMrbx73R2+A==
X-Received: by 2002:a05:600c:3d1b:b0:39b:1743:4d84 with SMTP id
 bh27-20020a05600c3d1b00b0039b17434d84mr2231723wmb.118.1654765555993; 
 Thu, 09 Jun 2022 02:05:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.05.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:05:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/55] target/arm: Move get_phys_addr_pmsav7 to ptw.c
Date: Thu,  9 Jun 2022 10:04:56 +0100
Message-Id: <20220609090537.1971756-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220604040607.269301-8-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.h    |  10 +--
 target/arm/helper.c | 194 +-------------------------------------------
 target/arm/ptw.c    | 190 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 198 insertions(+), 196 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index d6e3fee1523..d24b7c263a8 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -33,14 +33,14 @@ simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
     return simple_ap_to_rw_prot_is_user(ap, regime_is_user(env, mmu_idx));
 }
 
+bool m_is_ppb_region(CPUARMState *env, uint32_t address);
+bool m_is_system_region(CPUARMState *env, uint32_t address);
+
 void get_phys_addr_pmsav7_default(CPUARMState *env,
                                   ARMMMUIdx mmu_idx,
                                   int32_t address, int *prot);
-bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
-                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                          hwaddr *phys_ptr, int *prot,
-                          target_ulong *page_size,
-                          ARMMMUFaultInfo *fi);
+bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx, bool is_user);
+
 bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                           MMUAccessType access_type, ARMMMUIdx mmu_idx,
                           hwaddr *phys_ptr, MemTxAttrs *txattrs,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d4f7c05625c..2ebaf694075 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11678,8 +11678,7 @@ do_fault:
     return true;
 }
 
-static bool pmsav7_use_background_region(ARMCPU *cpu,
-                                         ARMMMUIdx mmu_idx, bool is_user)
+bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx, bool is_user)
 {
     /* Return true if we should use the default memory map as a
      * "background" region if there are no hits against any MPU regions.
@@ -11698,14 +11697,14 @@ static bool pmsav7_use_background_region(ARMCPU *cpu,
     }
 }
 
-static inline bool m_is_ppb_region(CPUARMState *env, uint32_t address)
+bool m_is_ppb_region(CPUARMState *env, uint32_t address)
 {
     /* True if address is in the M profile PPB region 0xe0000000 - 0xe00fffff */
     return arm_feature(env, ARM_FEATURE_M) &&
         extract32(address, 20, 12) == 0xe00;
 }
 
-static inline bool m_is_system_region(CPUARMState *env, uint32_t address)
+bool m_is_system_region(CPUARMState *env, uint32_t address)
 {
     /* True if address is in the M profile system region
      * 0xe0000000 - 0xffffffff
@@ -11713,193 +11712,6 @@ static inline bool m_is_system_region(CPUARMState *env, uint32_t address)
     return arm_feature(env, ARM_FEATURE_M) && extract32(address, 29, 3) == 0x7;
 }
 
-bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
-                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                          hwaddr *phys_ptr, int *prot,
-                          target_ulong *page_size,
-                          ARMMMUFaultInfo *fi)
-{
-    ARMCPU *cpu = env_archcpu(env);
-    int n;
-    bool is_user = regime_is_user(env, mmu_idx);
-
-    *phys_ptr = address;
-    *page_size = TARGET_PAGE_SIZE;
-    *prot = 0;
-
-    if (regime_translation_disabled(env, mmu_idx) ||
-        m_is_ppb_region(env, address)) {
-        /* MPU disabled or M profile PPB access: use default memory map.
-         * The other case which uses the default memory map in the
-         * v7M ARM ARM pseudocode is exception vector reads from the vector
-         * table. In QEMU those accesses are done in arm_v7m_load_vector(),
-         * which always does a direct read using address_space_ldl(), rather
-         * than going via this function, so we don't need to check that here.
-         */
-        get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
-    } else { /* MPU enabled */
-        for (n = (int)cpu->pmsav7_dregion - 1; n >= 0; n--) {
-            /* region search */
-            uint32_t base = env->pmsav7.drbar[n];
-            uint32_t rsize = extract32(env->pmsav7.drsr[n], 1, 5);
-            uint32_t rmask;
-            bool srdis = false;
-
-            if (!(env->pmsav7.drsr[n] & 0x1)) {
-                continue;
-            }
-
-            if (!rsize) {
-                qemu_log_mask(LOG_GUEST_ERROR,
-                              "DRSR[%d]: Rsize field cannot be 0\n", n);
-                continue;
-            }
-            rsize++;
-            rmask = (1ull << rsize) - 1;
-
-            if (base & rmask) {
-                qemu_log_mask(LOG_GUEST_ERROR,
-                              "DRBAR[%d]: 0x%" PRIx32 " misaligned "
-                              "to DRSR region size, mask = 0x%" PRIx32 "\n",
-                              n, base, rmask);
-                continue;
-            }
-
-            if (address < base || address > base + rmask) {
-                /*
-                 * Address not in this region. We must check whether the
-                 * region covers addresses in the same page as our address.
-                 * In that case we must not report a size that covers the
-                 * whole page for a subsequent hit against a different MPU
-                 * region or the background region, because it would result in
-                 * incorrect TLB hits for subsequent accesses to addresses that
-                 * are in this MPU region.
-                 */
-                if (ranges_overlap(base, rmask,
-                                   address & TARGET_PAGE_MASK,
-                                   TARGET_PAGE_SIZE)) {
-                    *page_size = 1;
-                }
-                continue;
-            }
-
-            /* Region matched */
-
-            if (rsize >= 8) { /* no subregions for regions < 256 bytes */
-                int i, snd;
-                uint32_t srdis_mask;
-
-                rsize -= 3; /* sub region size (power of 2) */
-                snd = ((address - base) >> rsize) & 0x7;
-                srdis = extract32(env->pmsav7.drsr[n], snd + 8, 1);
-
-                srdis_mask = srdis ? 0x3 : 0x0;
-                for (i = 2; i <= 8 && rsize < TARGET_PAGE_BITS; i *= 2) {
-                    /* This will check in groups of 2, 4 and then 8, whether
-                     * the subregion bits are consistent. rsize is incremented
-                     * back up to give the region size, considering consistent
-                     * adjacent subregions as one region. Stop testing if rsize
-                     * is already big enough for an entire QEMU page.
-                     */
-                    int snd_rounded = snd & ~(i - 1);
-                    uint32_t srdis_multi = extract32(env->pmsav7.drsr[n],
-                                                     snd_rounded + 8, i);
-                    if (srdis_mask ^ srdis_multi) {
-                        break;
-                    }
-                    srdis_mask = (srdis_mask << i) | srdis_mask;
-                    rsize++;
-                }
-            }
-            if (srdis) {
-                continue;
-            }
-            if (rsize < TARGET_PAGE_BITS) {
-                *page_size = 1 << rsize;
-            }
-            break;
-        }
-
-        if (n == -1) { /* no hits */
-            if (!pmsav7_use_background_region(cpu, mmu_idx, is_user)) {
-                /* background fault */
-                fi->type = ARMFault_Background;
-                return true;
-            }
-            get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
-        } else { /* a MPU hit! */
-            uint32_t ap = extract32(env->pmsav7.dracr[n], 8, 3);
-            uint32_t xn = extract32(env->pmsav7.dracr[n], 12, 1);
-
-            if (m_is_system_region(env, address)) {
-                /* System space is always execute never */
-                xn = 1;
-            }
-
-            if (is_user) { /* User mode AP bit decoding */
-                switch (ap) {
-                case 0:
-                case 1:
-                case 5:
-                    break; /* no access */
-                case 3:
-                    *prot |= PAGE_WRITE;
-                    /* fall through */
-                case 2:
-                case 6:
-                    *prot |= PAGE_READ | PAGE_EXEC;
-                    break;
-                case 7:
-                    /* for v7M, same as 6; for R profile a reserved value */
-                    if (arm_feature(env, ARM_FEATURE_M)) {
-                        *prot |= PAGE_READ | PAGE_EXEC;
-                        break;
-                    }
-                    /* fall through */
-                default:
-                    qemu_log_mask(LOG_GUEST_ERROR,
-                                  "DRACR[%d]: Bad value for AP bits: 0x%"
-                                  PRIx32 "\n", n, ap);
-                }
-            } else { /* Priv. mode AP bits decoding */
-                switch (ap) {
-                case 0:
-                    break; /* no access */
-                case 1:
-                case 2:
-                case 3:
-                    *prot |= PAGE_WRITE;
-                    /* fall through */
-                case 5:
-                case 6:
-                    *prot |= PAGE_READ | PAGE_EXEC;
-                    break;
-                case 7:
-                    /* for v7M, same as 6; for R profile a reserved value */
-                    if (arm_feature(env, ARM_FEATURE_M)) {
-                        *prot |= PAGE_READ | PAGE_EXEC;
-                        break;
-                    }
-                    /* fall through */
-                default:
-                    qemu_log_mask(LOG_GUEST_ERROR,
-                                  "DRACR[%d]: Bad value for AP bits: 0x%"
-                                  PRIx32 "\n", n, ap);
-                }
-            }
-
-            /* execute never */
-            if (xn) {
-                *prot &= ~PAGE_EXEC;
-            }
-        }
-    }
-
-    fi->type = ARMFault_Permission;
-    fi->level = 1;
-    return !(*prot & (1 << access_type));
-}
-
 static bool v8m_is_sau_exempt(CPUARMState *env,
                               uint32_t address, MMUAccessType access_type)
 {
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 74650c6c525..27715dbfa8c 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -8,6 +8,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qemu/range.h"
 #include "cpu.h"
 #include "internals.h"
 #include "ptw.h"
@@ -415,6 +416,195 @@ void get_phys_addr_pmsav7_default(CPUARMState *env,
     }
 }
 
+static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
+                                 MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                                 hwaddr *phys_ptr, int *prot,
+                                 target_ulong *page_size,
+                                 ARMMMUFaultInfo *fi)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    int n;
+    bool is_user = regime_is_user(env, mmu_idx);
+
+    *phys_ptr = address;
+    *page_size = TARGET_PAGE_SIZE;
+    *prot = 0;
+
+    if (regime_translation_disabled(env, mmu_idx) ||
+        m_is_ppb_region(env, address)) {
+        /*
+         * MPU disabled or M profile PPB access: use default memory map.
+         * The other case which uses the default memory map in the
+         * v7M ARM ARM pseudocode is exception vector reads from the vector
+         * table. In QEMU those accesses are done in arm_v7m_load_vector(),
+         * which always does a direct read using address_space_ldl(), rather
+         * than going via this function, so we don't need to check that here.
+         */
+        get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
+    } else { /* MPU enabled */
+        for (n = (int)cpu->pmsav7_dregion - 1; n >= 0; n--) {
+            /* region search */
+            uint32_t base = env->pmsav7.drbar[n];
+            uint32_t rsize = extract32(env->pmsav7.drsr[n], 1, 5);
+            uint32_t rmask;
+            bool srdis = false;
+
+            if (!(env->pmsav7.drsr[n] & 0x1)) {
+                continue;
+            }
+
+            if (!rsize) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "DRSR[%d]: Rsize field cannot be 0\n", n);
+                continue;
+            }
+            rsize++;
+            rmask = (1ull << rsize) - 1;
+
+            if (base & rmask) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "DRBAR[%d]: 0x%" PRIx32 " misaligned "
+                              "to DRSR region size, mask = 0x%" PRIx32 "\n",
+                              n, base, rmask);
+                continue;
+            }
+
+            if (address < base || address > base + rmask) {
+                /*
+                 * Address not in this region. We must check whether the
+                 * region covers addresses in the same page as our address.
+                 * In that case we must not report a size that covers the
+                 * whole page for a subsequent hit against a different MPU
+                 * region or the background region, because it would result in
+                 * incorrect TLB hits for subsequent accesses to addresses that
+                 * are in this MPU region.
+                 */
+                if (ranges_overlap(base, rmask,
+                                   address & TARGET_PAGE_MASK,
+                                   TARGET_PAGE_SIZE)) {
+                    *page_size = 1;
+                }
+                continue;
+            }
+
+            /* Region matched */
+
+            if (rsize >= 8) { /* no subregions for regions < 256 bytes */
+                int i, snd;
+                uint32_t srdis_mask;
+
+                rsize -= 3; /* sub region size (power of 2) */
+                snd = ((address - base) >> rsize) & 0x7;
+                srdis = extract32(env->pmsav7.drsr[n], snd + 8, 1);
+
+                srdis_mask = srdis ? 0x3 : 0x0;
+                for (i = 2; i <= 8 && rsize < TARGET_PAGE_BITS; i *= 2) {
+                    /*
+                     * This will check in groups of 2, 4 and then 8, whether
+                     * the subregion bits are consistent. rsize is incremented
+                     * back up to give the region size, considering consistent
+                     * adjacent subregions as one region. Stop testing if rsize
+                     * is already big enough for an entire QEMU page.
+                     */
+                    int snd_rounded = snd & ~(i - 1);
+                    uint32_t srdis_multi = extract32(env->pmsav7.drsr[n],
+                                                     snd_rounded + 8, i);
+                    if (srdis_mask ^ srdis_multi) {
+                        break;
+                    }
+                    srdis_mask = (srdis_mask << i) | srdis_mask;
+                    rsize++;
+                }
+            }
+            if (srdis) {
+                continue;
+            }
+            if (rsize < TARGET_PAGE_BITS) {
+                *page_size = 1 << rsize;
+            }
+            break;
+        }
+
+        if (n == -1) { /* no hits */
+            if (!pmsav7_use_background_region(cpu, mmu_idx, is_user)) {
+                /* background fault */
+                fi->type = ARMFault_Background;
+                return true;
+            }
+            get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
+        } else { /* a MPU hit! */
+            uint32_t ap = extract32(env->pmsav7.dracr[n], 8, 3);
+            uint32_t xn = extract32(env->pmsav7.dracr[n], 12, 1);
+
+            if (m_is_system_region(env, address)) {
+                /* System space is always execute never */
+                xn = 1;
+            }
+
+            if (is_user) { /* User mode AP bit decoding */
+                switch (ap) {
+                case 0:
+                case 1:
+                case 5:
+                    break; /* no access */
+                case 3:
+                    *prot |= PAGE_WRITE;
+                    /* fall through */
+                case 2:
+                case 6:
+                    *prot |= PAGE_READ | PAGE_EXEC;
+                    break;
+                case 7:
+                    /* for v7M, same as 6; for R profile a reserved value */
+                    if (arm_feature(env, ARM_FEATURE_M)) {
+                        *prot |= PAGE_READ | PAGE_EXEC;
+                        break;
+                    }
+                    /* fall through */
+                default:
+                    qemu_log_mask(LOG_GUEST_ERROR,
+                                  "DRACR[%d]: Bad value for AP bits: 0x%"
+                                  PRIx32 "\n", n, ap);
+                }
+            } else { /* Priv. mode AP bits decoding */
+                switch (ap) {
+                case 0:
+                    break; /* no access */
+                case 1:
+                case 2:
+                case 3:
+                    *prot |= PAGE_WRITE;
+                    /* fall through */
+                case 5:
+                case 6:
+                    *prot |= PAGE_READ | PAGE_EXEC;
+                    break;
+                case 7:
+                    /* for v7M, same as 6; for R profile a reserved value */
+                    if (arm_feature(env, ARM_FEATURE_M)) {
+                        *prot |= PAGE_READ | PAGE_EXEC;
+                        break;
+                    }
+                    /* fall through */
+                default:
+                    qemu_log_mask(LOG_GUEST_ERROR,
+                                  "DRACR[%d]: Bad value for AP bits: 0x%"
+                                  PRIx32 "\n", n, ap);
+                }
+            }
+
+            /* execute never */
+            if (xn) {
+                *prot &= ~PAGE_EXEC;
+            }
+        }
+    }
+
+    fi->type = ARMFault_Permission;
+    fi->level = 1;
+    return !(*prot & (1 << access_type));
+}
+
 /**
  * get_phys_addr - get the physical address for this virtual address
  *
-- 
2.25.1


