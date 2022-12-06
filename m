Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4431644139
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 11:27:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2V9X-0007PM-Sa; Tue, 06 Dec 2022 05:26:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1p2V9A-0007FV-Lj
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:26:00 -0500
Received: from mail-out-1a.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1p2V97-00028y-Ol
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:25:55 -0500
X-IPAS-Result: =?us-ascii?q?A2DqBACWF49j/5sagoZaHgEBCxIMQIZahE6RHAOfMw8BA?=
 =?us-ascii?q?QEBAQEBAQEIAUQEAQGFAQICAoUPJjgTAQIEAQEBAQMCAwEBAQEBAQMBAQYBA?=
 =?us-ascii?q?QEBAQEGBIEdhS9GhlYCAQMjBAsBQQUQIAUCJgICVwYOBYJ+gyOtSn8zgQGEc?=
 =?us-ascii?q?ZxNCQGBCiyJCIJOhUKCUIJRgTd1hBxFgzqCZwSKOoxbDm4cNwMJAwcFLB1AA?=
 =?us-ascii?q?wsYDRYyChMyNQsRTCscGweBDCooFQMEBAMCBhMDIAINKDEUBCkTDSsmbQkCA?=
 =?us-ascii?q?yFhBQMDBCgsAwlAByYmPAdWNwUDAg8gOAYDCQMCH1R0LxIUBQMLFSUIBUkEC?=
 =?us-ascii?q?DcFBlMSAgoREg8sRQ5IPjkWBidBATAODhMDXUsdgQEEYDmBFS8umiFyASwtN?=
 =?us-ascii?q?IJAE68mk3YHgh+iDkyDeZMEAjeRZpdAoyqEKAIEAgQFAhaBeYF+cYM2UhcCD?=
 =?us-ascii?q?5xxdDsCBwEKAQEDCYdHglgBAQ?=
IronPort-Data: A9a23:Tm8BNKzQR/JqyWshrh96t+drxyrEfRIJ4+MujC+fZmUNrF6WrkVTx
 jZLCGCDaf6LYTPxctkiPYW/pksOsJXWmIRmQAVqr1hgHilAwSbn6XV1DW+tZX/Ifp2bJK5Dx
 59DAjUVBJlsFhcwnj/0bv676yAUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dga++2k
 Y608pO31GONgWYuaDtOs/zb8nuDgdyr0N8mlg1mDRx0lAKG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVTmZk5tZkSXqkMqShoaj/xnbqpMMS+7vB3S9zx54
 I0lWZVd0m7FNIWU8AgWe0Ew/y2TocSq9ZefSUVTv/B/wGXeQlnA+vk/In09PL8F48xGXl5sr
 cYHfWVlghCr34pawZqBddVMq/RmF5OuFsUFpW1giDjVS/orKXzBa/yRuZkBh2923J4IRKuDD
 yYaQWMHgBDofxpFO14MTog5keeti33XaSJEqBecrKE37m6VwAEZPL3Fa4KPKoTRH5g9ckCwr
 UDl+HXIXggjO4a1yD/GwFWg3tXBpHauMG4VPPjinhJwu3WKy2kOTREbS1a/if++jEG4RpRYM
 UN80jIjsaUoskmiX9XwWxmQpH+CtwQbHd1KHIUHBBql0LXI4wuJQ3NeCzQHcsM6tIo/SXom2
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:D4cI0K4KC1NSMO7ZHwPXwOTXdLJyesId70hD6qkRc3xom6mj/P
 xG885rtyMc5Ax8ZJhCo7G90cu7MBDhHPdOiOF6UItKNzOJhILHFu5fBdyI+UyEJwTOstd466
 dmN5dzE8fxC18St7ef3CCIV+sd7Z258Lu1n6PlxX9rSg1mApsQiDtENg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.96,222,1665439200"; d="scan'208";a="30280325"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-1a.itc.rwth-aachen.de with ESMTP; 06 Dec 2022 11:25:32 +0100
Received: from localhost.localdomain (2a02:908:1088:5920:7fc5:a897:a756:e2fb)
 by RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20; Tue, 6 Dec 2022 11:25:31 +0100
From: <tobias.roehmel@rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <tobias.roehmel@rwth-aachen.de>
Subject: [PATCH v6 6/7] target/arm: Add PMSAv8r functionality
Date: Tue, 6 Dec 2022 11:25:03 +0100
Message-ID: <20221206102504.165775-7-tobias.roehmel@rwth-aachen.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206102504.165775-1-tobias.roehmel@rwth-aachen.de>
References: <20221206102504.165775-1-tobias.roehmel@rwth-aachen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:7fc5:a897:a756:e2fb]
X-ClientProxiedBy: rwthex-s2-a.rwth-ad.de (2a00:8a60:1:e500::26:154) To
 RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155)
Received-SPF: pass client-ip=2a00:8a60:1:e501::5:44;
 envelope-from=tobias.roehmel@rwth-aachen.de;
 helo=mail-out-1a.itc.rwth-aachen.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>

Add PMSAv8r translation.

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 126 ++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 104 insertions(+), 22 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 7d19829702..49e5e5627b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1758,9 +1758,13 @@ static bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx,
 
     if (arm_feature(env, ARM_FEATURE_M)) {
         return env->v7m.mpu_ctrl[is_secure] & R_V7M_MPU_CTRL_PRIVDEFENA_MASK;
-    } else {
-        return regime_sctlr(env, mmu_idx) & SCTLR_BR;
     }
+
+    if (mmu_idx == ARMMMUIdx_Stage2) {
+        return false;
+    }
+
+    return regime_sctlr(env, mmu_idx) & SCTLR_BR;
 }
 
 static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
@@ -1952,6 +1956,26 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
     return !(result->f.prot & (1 << access_type));
 }
 
+static uint32_t *regime_rbar(CPUARMState *env, ARMMMUIdx mmu_idx,
+                             uint32_t secure)
+{
+    if (regime_el(env, mmu_idx) == 2) {
+        return env->pmsav8.hprbar;
+    } else {
+        return env->pmsav8.rbar[secure];
+    }
+}
+
+static uint32_t *regime_rlar(CPUARMState *env, ARMMMUIdx mmu_idx,
+                             uint32_t secure)
+{
+    if (regime_el(env, mmu_idx) == 2) {
+        return env->pmsav8.hprlar;
+    } else {
+        return env->pmsav8.rlar[secure];
+    }
+}
+
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
                        bool secure, GetPhysAddrResult *result,
@@ -1974,6 +1998,13 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     bool hit = false;
     uint32_t addr_page_base = address & TARGET_PAGE_MASK;
     uint32_t addr_page_limit = addr_page_base + (TARGET_PAGE_SIZE - 1);
+    int region_counter;
+
+    if (regime_el(env, mmu_idx) == 2) {
+        region_counter = cpu->pmsav8r_hdregion;
+    } else {
+        region_counter = cpu->pmsav7_dregion;
+    }
 
     result->f.lg_page_size = TARGET_PAGE_BITS;
     result->f.phys_addr = address;
@@ -1982,6 +2013,10 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
         *mregion = -1;
     }
 
+    if (mmu_idx == ARMMMUIdx_Stage2) {
+        fi->stage2 = true;
+    }
+
     /*
      * Unlike the ARM ARM pseudocode, we don't need to check whether this
      * was an exception vector read from the vector table (which is always
@@ -1998,17 +2033,26 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
             hit = true;
         }
 
-        for (n = (int)cpu->pmsav7_dregion - 1; n >= 0; n--) {
+        uint32_t bitmask;
+        if (arm_feature(env, ARM_FEATURE_M)) {
+            bitmask = 0x1f;
+        } else {
+            bitmask = 0x3f;
+            fi->level = 0;
+        }
+
+        for (n = region_counter - 1; n >= 0; n--) {
             /* region search */
             /*
-             * Note that the base address is bits [31:5] from the register
-             * with bits [4:0] all zeroes, but the limit address is bits
-             * [31:5] from the register with bits [4:0] all ones.
+             * Note that the base address is bits [31:x] from the register
+             * with bits [x-1:0] all zeroes, but the limit address is bits
+             * [31:x] from the register with bits [x:0] all ones. Where x is
+             * 5 for Cortex-M and 6 for Cortex-R
              */
-            uint32_t base = env->pmsav8.rbar[secure][n] & ~0x1f;
-            uint32_t limit = env->pmsav8.rlar[secure][n] | 0x1f;
+            uint32_t base = regime_rbar(env, mmu_idx, secure)[n] & ~bitmask;
+            uint32_t limit = regime_rlar(env, mmu_idx, secure)[n] | bitmask;
 
-            if (!(env->pmsav8.rlar[secure][n] & 0x1)) {
+            if (!(regime_rlar(env, mmu_idx, secure)[n] & 0x1)) {
                 /* Region disabled */
                 continue;
             }
@@ -2042,7 +2086,9 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                  * PMSAv7 where highest-numbered-region wins)
                  */
                 fi->type = ARMFault_Permission;
-                fi->level = 1;
+                if (arm_feature(env, ARM_FEATURE_M)) {
+                    fi->level = 1;
+                }
                 return true;
             }
 
@@ -2052,8 +2098,11 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     }
 
     if (!hit) {
-        /* background fault */
-        fi->type = ARMFault_Background;
+        if (arm_feature(env, ARM_FEATURE_M)) {
+            fi->type = ARMFault_Background;
+        } else {
+            fi->type = ARMFault_Permission;
+        }
         return true;
     }
 
@@ -2061,12 +2110,14 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
         /* hit using the background region */
         get_phys_addr_pmsav7_default(env, mmu_idx, address, &result->f.prot);
     } else {
-        uint32_t ap = extract32(env->pmsav8.rbar[secure][matchregion], 1, 2);
-        uint32_t xn = extract32(env->pmsav8.rbar[secure][matchregion], 0, 1);
+        uint32_t matched_rbar = regime_rbar(env, mmu_idx, secure)[matchregion];
+        uint32_t matched_rlar = regime_rlar(env, mmu_idx, secure)[matchregion];
+        uint32_t ap = extract32(matched_rbar, 1, 2);
+        uint32_t xn = extract32(matched_rbar, 0, 1);
         bool pxn = false;
 
         if (arm_feature(env, ARM_FEATURE_V8_1M)) {
-            pxn = extract32(env->pmsav8.rlar[secure][matchregion], 4, 1);
+            pxn = extract32(matched_rlar, 4, 1);
         }
 
         if (m_is_system_region(env, address)) {
@@ -2074,21 +2125,46 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
             xn = 1;
         }
 
-        result->f.prot = simple_ap_to_rw_prot(env, mmu_idx, ap);
+        if (regime_el(env, mmu_idx) == 2) {
+            result->f.prot = simple_ap_to_rw_prot_is_user(ap,
+                                            mmu_idx != ARMMMUIdx_E2);
+        } else {
+            result->f.prot = simple_ap_to_rw_prot(env, mmu_idx, ap);
+        }
+
+        if (!arm_feature(env, ARM_FEATURE_M)) {
+            uint8_t attrindx = extract32(matched_rlar, 1, 3);
+            uint64_t mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
+            uint8_t sh = extract32(matched_rlar, 3, 2);
+
+            if (regime_sctlr(env, mmu_idx) & SCTLR_WXN &&
+                result->f.prot & PAGE_WRITE && mmu_idx != ARMMMUIdx_Stage2) {
+                xn = 0x1;
+            }
+
+            if ((regime_el(env, mmu_idx) == 1) &&
+                regime_sctlr(env, mmu_idx) & SCTLR_UWXN && ap == 0x1) {
+                pxn = 0x1;
+            }
+
+            result->cacheattrs.is_s2_format = false;
+            result->cacheattrs.attrs = extract64(mair, attrindx * 8, 8);
+            result->cacheattrs.shareability = sh;
+        }
+
         if (result->f.prot && !xn && !(pxn && !is_user)) {
             result->f.prot |= PAGE_EXEC;
         }
-        /*
-         * We don't need to look the attribute up in the MAIR0/MAIR1
-         * registers because that only tells us about cacheability.
-         */
+
         if (mregion) {
             *mregion = matchregion;
         }
     }
 
     fi->type = ARMFault_Permission;
-    fi->level = 1;
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        fi->level = 1;
+    }
     return !(result->f.prot & (1 << access_type));
 }
 
@@ -2649,7 +2725,13 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
-    ret = get_phys_addr_lpae(env, ptw, ipa, access_type, is_el0, result, fi);
+    if (arm_feature(env, ARM_FEATURE_PMSA)) {
+        ret = get_phys_addr_pmsav8(env, ipa, access_type,
+                                   ptw->in_mmu_idx, is_secure, result, fi);
+    } else {
+        ret = get_phys_addr_lpae(env, ptw, ipa, access_type,
+                                 is_el0, result, fi);
+    }
     fi->s2addr = ipa;
 
     /* Combine the S1 and S2 perms.  */
-- 
2.34.1


