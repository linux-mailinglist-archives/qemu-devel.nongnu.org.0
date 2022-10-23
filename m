Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DCE6095A8
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Oct 2022 20:45:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omft9-0004wY-KI
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 14:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1omd2V-00061x-AZ
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 11:37:27 -0400
Received: from mail-out-1a.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1omd2T-0006L7-9X
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 11:37:27 -0400
X-IPAS-Result: =?us-ascii?q?A2D6AAC8Q0Vj/5sagoZaHQEBAQEJARIBBQUBQIE+BQELA?=
 =?us-ascii?q?YR9hE6RFQOfEwsBAQEBAQEBAQEIAUIEAQGFAQICAoR1JjcGDgECBAEBAQEDA?=
 =?us-ascii?q?gMBAQEBAQEDAQEGAQEBAQEBBgSBHIUvRoZDAgEDIwQLAUEFECAFAiYCAlcGD?=
 =?us-ascii?q?gWCfYMhrRR/M4EBhHCJcQkBgQcsAYhQgiuFNIJQglGBN3WEHEWDOoJmBJIii?=
 =?us-ascii?q?BccOAMJAwcFLB1AAwsfDRY1GAMUAwUhBwMZDyMNDQQdDAMDBSUDAgIbBwICA?=
 =?us-ascii?q?wIGEwUCAjUYNAgECAQrJA8FAgcvBQQvAh4EBQYRCAIWAgYEBAQEFQIQCAIIJ?=
 =?us-ascii?q?hcHEzMZAQUyJw4JIRwOGg0FBhMDIG8FBzsPKC9pKx0bB4EMKigVAwQEAwIGE?=
 =?us-ascii?q?wMgAg0pMRQEKRMPLQcpcQkCAyJlBQMDBCgsAwlABygkPAdYOgUDAhAiPAYDC?=
 =?us-ascii?q?QMCJFl0MBIUBQMNFyYIBTcbBAg8AgUGUhMCChIDEg8tSQ9KPjsXCJtmcgEsL?=
 =?us-ascii?q?TSCU68GkzMHghuhakyDdpJ+AjaRYJcRox6EKAIEAgQFAhaBd4F/cYM2URcCD?=
 =?us-ascii?q?5xyczsCBgEKAQEDCYhDgkcBAQ?=
IronPort-Data: A9a23:6Ag0r6tBwZAh/v8CqBGgQ+vZsufnVApfMUV32f8akzHdYApBsoF/q
 tZmKWqGafbZMTT1co8lPo7npEsCsZXWyd9hQAY9rCFjHnwSgMeUXt7xwmUcns+xBpCZEBg3v
 512hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwa++3k
 YqaT/b3ZRn0hlaYDkpOs/jZ8Us25ayo0N8llgVWic5j7Qe2e0Y9Ucp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VSKlLgFVHmZkl+B8BOtiN/Shkaic7XAtJBMxsN22XR9zxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69dXImdoDa4Ywf0tH0xt9
 KIoMAwjVynW0opawJrjIgVtrv4cEOnGDMYk4DRKiyvGEfZjSJyFT6iiCd1whWxswJkVRbCEO
 YxANGcHgBfoOnWjPn8LD5g/lfzunH7yczhVrHqPurY3pmHaxwx81v7hPbI5f/TQGJQIxxbD+
 Aoq+UzlGD44MvDYwwOs0Un0jeXdvB3jWb8rQejQGvlCxQf7KnYoIAQbUEb+rfSnh0qWXdVZJ
 EoJvC00osAa7EG3Q8O7WhSprHOAujYYWtxZCep87xuCopc4+C6DGXQEQy4Ec4ZjvoksWiAqk
 1aF2d/kbdByjICopbum3u/8hVuP1eI9cQfuuQdsodM53uTe
IronPort-HdrOrdr: A9a23:6qQrhqFon9xA+ZSmpLqE2ceALOsnbusQ8zAXP0AYc3Bom6uj5q
 eTdZUgpHvJYVkqNk3I9errBEDEewK+yXcX2/h1AV7BZmjbUQKTRekI0WKh+UyDJ8SXzJ866U
 4KScdD4bPLYGST2q3BkXGF+q4boOVvp5rY/Nvj8w==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.95,176,1661810400"; d="scan'208";a="25951836"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-1a.itc.rwth-aachen.de with ESMTP; 23 Oct 2022 17:37:13 +0200
Received: from localhost.localdomain (2a02:908:1088:5920:10a7:3a65:7c9d:55ef)
 by RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.15; Sun, 23 Oct 2022 17:37:13 +0200
From: <tobias.roehmel@rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <tobias.roehmel@rwth-aachen.de>
Subject: [PATCH v4 6/7] target/arm: Add PMSAv8r functionality
Date: Sun, 23 Oct 2022 17:36:58 +0200
Message-ID: <20221023153659.121138-7-tobias.roehmel@rwth-aachen.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221023153659.121138-1-tobias.roehmel@rwth-aachen.de>
References: <20221023153659.121138-1-tobias.roehmel@rwth-aachen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:10a7:3a65:7c9d:55ef]
X-ClientProxiedBy: rwthex-s4-b.rwth-ad.de (2a00:8a60:1:e500::26:165) To
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>

Add PMSAv8r translation.

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
---
 target/arm/ptw.c | 130 +++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 110 insertions(+), 20 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 4bd7389fa9..a5d890c09a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1503,6 +1503,23 @@ static bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx,
 
     if (arm_feature(env, ARM_FEATURE_M)) {
         return env->v7m.mpu_ctrl[is_secure] & R_V7M_MPU_CTRL_PRIVDEFENA_MASK;
+    } else if (arm_feature(env, ARM_FEATURE_PMSA)) {
+        if (regime_el(env, mmu_idx) == 2) {
+            if (mmu_idx != ARMMMUIdx_E2) {
+                return false;
+            } else if ((mmu_idx == ARMMMUIdx_E2)
+                       &&!(regime_sctlr(env, mmu_idx) & SCTLR_BR)) {
+                return false;
+            }
+        } else {
+            if (mmu_idx != ARMMMUIdx_Stage1_E1) {
+                return false;
+            } else if ((mmu_idx == ARMMMUIdx_Stage1_E1)
+                       &&!(regime_sctlr(env, mmu_idx) & SCTLR_BR)) {
+                return false;
+            }
+        }
+        return true;
     } else {
         return regime_sctlr(env, mmu_idx) & SCTLR_BR;
     }
@@ -1696,6 +1713,26 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
     return !(result->prot & (1 << access_type));
 }
 
+static uint32_t *regime_rbar(CPUARMState *env, ARMMMUIdx mmu_idx,
+                             uint32_t secure)
+{
+    if (regime_el(env, mmu_idx) == 2) {
+        return env->pmsav8.hprbar[secure];
+    } else {
+        return env->pmsav8.rbar[secure];
+    }
+}
+
+static uint32_t *regime_rlar(CPUARMState *env, ARMMMUIdx mmu_idx,
+                             uint32_t secure)
+{
+    if (regime_el(env, mmu_idx) == 2) {
+        return env->pmsav8.hprlar[secure];
+    } else {
+        return env->pmsav8.rlar[secure];
+    }
+}
+
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
                        bool secure, GetPhysAddrResult *result,
@@ -1733,6 +1770,10 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
         *mregion = -1;
     }
 
+    if (mmu_idx == ARMMMUIdx_Stage2) {
+        fi->stage2 = true;
+    }
+
     /*
      * Unlike the ARM ARM pseudocode, we don't need to check whether this
      * was an exception vector read from the vector table (which is always
@@ -1749,17 +1790,27 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
             hit = true;
         }
 
+        uint32_t bitmask;
+        if (arm_feature(env, ARM_FEATURE_M)) {
+            bitmask = 0x1f;
+            fi->level = 1;
+        } else {
+            bitmask = 0x3f;
+            fi->level = 0;
+        }
+
         for (n = region_counter - 1; n >= 0; n--) {
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
@@ -1793,7 +1844,6 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                  * PMSAv7 where highest-numbered-region wins)
                  */
                 fi->type = ARMFault_Permission;
-                fi->level = 1;
                 return true;
             }
 
@@ -1803,8 +1853,11 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
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
 
@@ -1812,12 +1865,14 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
         /* hit using the background region */
         get_phys_addr_pmsav7_default(env, mmu_idx, address, &result->prot);
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
@@ -1825,21 +1880,49 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
             xn = 1;
         }
 
-        result->prot = simple_ap_to_rw_prot(env, mmu_idx, ap);
+        if (arm_feature(env, ARM_FEATURE_M)) {
+            /*
+             * We don't need to look the attribute up in the MAIR0/MAIR1
+             * registers because that only tells us about cacheability.
+             */
+            result->prot = simple_ap_to_rw_prot(env, mmu_idx, ap);
+        } else {
+            if (regime_el(env, mmu_idx) == 2) {
+                result->prot = simple_ap_to_rw_prot_is_user(ap,
+                                                mmu_idx != ARMMMUIdx_E2);
+            } else {
+                result->prot = simple_ap_to_rw_prot_is_user(ap,
+                                                mmu_idx != ARMMMUIdx_Stage1_E1);
+            }
+
+            if (regime_sctlr(env, mmu_idx) & SCTLR_WXN
+                && (result->prot & PAGE_WRITE)) {
+                xn = 0x1;
+            }
+
+            if ((regime_el(env, mmu_idx) == 1) && regime_sctlr(env, mmu_idx)
+                 & SCTLR_UWXN && (ap == 0x1)) {
+                xn = 0x1;
+            }
+
+            uint8_t attrindx = extract32(matched_rlar, 1, 3);
+            uint64_t mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
+            uint8_t sh = extract32(matched_rlar, 3, 2);
+            result->cacheattrs.is_s2_format = false;
+            result->cacheattrs.attrs = extract64(mair, attrindx * 8, 8);
+            result->cacheattrs.shareability = sh;
+        }
+
         if (result->prot && !xn && !(pxn && !is_user)) {
             result->prot |= PAGE_EXEC;
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
     return !(result->prot & (1 << access_type));
 }
 
@@ -2348,8 +2431,15 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             cacheattrs1 = result->cacheattrs;
             memset(result, 0, sizeof(*result));
 
-            ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
-                                     is_el0, result, fi);
+            /* S1 is done. Now do S2 translation.  */
+            if (arm_feature(env, ARM_FEATURE_PMSA)) {
+                ret = get_phys_addr_pmsav8(env, ipa, access_type, s2_mmu_idx,
+                                       is_secure, result, fi);
+            } else {
+                ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
+                                        is_el0, result, fi);
+            }
+
             fi->s2addr = ipa;
 
             /* Combine the S1 and S2 perms.  */
-- 
2.34.1


