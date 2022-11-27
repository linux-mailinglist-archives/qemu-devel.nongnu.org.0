Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 352A9639AF6
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Nov 2022 14:23:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozHc4-0005Dg-5M; Sun, 27 Nov 2022 08:22:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1ozHbN-0004vc-7l
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 08:21:57 -0500
Received: from mail-out-3.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1ozHbJ-0002S8-2B
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 08:21:42 -0500
X-IPAS-Result: =?us-ascii?q?A2DqBADXY4Nj/5sagoZaHgEBCxIMQIZYhE6RGwOfMg8BA?=
 =?us-ascii?q?QEBAQEBAQEIAUQEAQGFAQICAoUIJjgTAQIEAQEBAQMCAwEBAQEBAQMBAQYBA?=
 =?us-ascii?q?QEBAQEGBIEdhS9GhlQCAQMjBAsBQQUQIAUCJgICVwYOBYJ9gyOtcn8zgQGEc?=
 =?us-ascii?q?JxNCQGBCiyJBoJOhUKCUIJRgTd1hBxFgzqCZwSMOowHHDcDCQMHBSwdQAMLG?=
 =?us-ascii?q?A0WMgoTMhsxJw4JHxwOFw0FBhIDIGwFBzoPKC9kKxwbB4EMKigVAwQEAwIGE?=
 =?us-ascii?q?wMiAg0pMRQEKRMNKydvCQIDImUFAwMEKCwDCUAHJyQ8B1Y6BQMCDyA4BgMJA?=
 =?us-ascii?q?wIiVHIvEhQFAwsVJQgFSwQIOQUGUhICChEDEg8sRQ5IPjkWBidCATAODhMDX?=
 =?us-ascii?q?UsdgQEEYjmBFTEvmWuCOXIBLC00glOvI5NtB4IfogpMg3iTAwI3kWWXN6Mnh?=
 =?us-ascii?q?CgCBAIEBQIWgXmBfnGDNlIXAg+ccXQ7AgcBCgEBAwmHR4JYAQE?=
IronPort-Data: A9a23:NVgvCqs+Ih5vH0CM3VKKXRtgEufnVAhfMUV32f8akzHdYApBsoF/q
 tZmKT+Gb/neM2PyftEkO9/g/B9T7MOHydA3SQFuqnpgQigUgMeUXt7xwmUcns+xBpCZEBg3v
 512hv3odp1coqr0/0/1WlTZhSAgk/vOH9IQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwa++3k
 YqaT/b3ZRn0hVaYDkpOs/jZ8Uo146yr0N8llgVWic5j7Qe2e0Y9Ucp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VSKlLgFVHmZkl+B8BOtiN/Shkaic7XAtJBMxsN22XR9zxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/BIE1EUFs5EwcN6UEse7
 cQ2GQA8bx/W0opawJrjIgVtrv4cEOnGDMYk4DRKiyvGEfZjSJyFT6iiCd1whWxswJkVRbCEO
 YxANGcHgBfoOnWjPn8LD5g/lfzunH7yczhVrHqPurY3pmHaxwx81v7hPbI5f/TTGpUKzhbH9
 z+uE2LRXEgYJviF7zy+1GOdqv3QowOnfKMtG+jtnhJtqBjJroAJMzUPWF6m5PW0lEO6c9RYL
 UMS52wpt6da3FSmUtTnGRixsXKJuho0X9tWGvc9rgaXxcLpDx2xHHcYTjNRLcd88cVwXyM21
 hqAk5XlCFSDrYGodJ5UzZ/MxRvaBMTfBTZaDcPYZWPpO+Xenbw=
IronPort-HdrOrdr: A9a23:LCxBgqgAS/s3fNqun4ht8jYAZXBQXusji2hC6mlwRA09TySZ//
 rDoB19726StN9xYgBFpTnuAse9qB/nn6KdpLNhXotKPzOW3VdATrsC0WKK+VSJcBEWtNQtt5
 uIG5IObuEYZmIUsS+V2mSF+4FK+qj+zEnRv4fjJiBWPHhXV50=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.96,198,1665439200"; d="scan'208";a="178788795"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-3.itc.rwth-aachen.de with ESMTP; 27 Nov 2022 14:21:32 +0100
Received: from localhost.localdomain (2a02:908:1088:5920:e2b3:9876:72f1:5569)
 by RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20; Sun, 27 Nov 2022 14:21:31 +0100
From: <tobias.roehmel@rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <tobias.roehmel@rwth-aachen.de>
Subject: [PATCH v5 6/7] target/arm: Add PMSAv8r functionality
Date: Sun, 27 Nov 2022 14:21:11 +0100
Message-ID: <20221127132112.300331-7-tobias.roehmel@rwth-aachen.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127132112.300331-1-tobias.roehmel@rwth-aachen.de>
References: <20221127132112.300331-1-tobias.roehmel@rwth-aachen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:e2b3:9876:72f1:5569]
X-ClientProxiedBy: rwthex-s1-a.rwth-ad.de (2a00:8a60:1:e500::26:152) To
 RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155)
Received-SPF: pass client-ip=2a00:8a60:1:e501::5:48;
 envelope-from=tobias.roehmel@rwth-aachen.de;
 helo=mail-out-3.itc.rwth-aachen.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
---
 target/arm/ptw.c | 127 +++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 105 insertions(+), 22 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 7d19829702..0514a83c1b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1758,9 +1758,14 @@ static bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx,
 
     if (arm_feature(env, ARM_FEATURE_M)) {
         return env->v7m.mpu_ctrl[is_secure] & R_V7M_MPU_CTRL_PRIVDEFENA_MASK;
-    } else {
-        return regime_sctlr(env, mmu_idx) & SCTLR_BR;
     }
+
+    if (arm_feature(env, ARM_FEATURE_V8) &&
+        ((mmu_idx == ARMMMUIdx_Stage2) || (mmu_idx == ARMMMUIdx_Stage1_E0))) {
+        return false;
+    }
+
+    return regime_sctlr(env, mmu_idx) & SCTLR_BR;
 }
 
 static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
@@ -1952,6 +1957,26 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
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
@@ -1974,6 +1999,13 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
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
@@ -1982,6 +2014,10 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
         *mregion = -1;
     }
 
+    if (mmu_idx == ARMMMUIdx_Stage2) {
+        fi->stage2 = true;
+    }
+
     /*
      * Unlike the ARM ARM pseudocode, we don't need to check whether this
      * was an exception vector read from the vector table (which is always
@@ -1998,17 +2034,26 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
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
@@ -2042,7 +2087,9 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                  * PMSAv7 where highest-numbered-region wins)
                  */
                 fi->type = ARMFault_Permission;
-                fi->level = 1;
+                if (arm_feature(env, ARM_FEATURE_M)) {
+                    fi->level = 1;
+                }
                 return true;
             }
 
@@ -2052,8 +2099,11 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
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
 
@@ -2061,12 +2111,14 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
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
@@ -2074,21 +2126,46 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
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
+            uint8_t attrindx = extract32(matched_rlar, 1, 3);
+            uint64_t mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
+            uint8_t sh = extract32(matched_rlar, 3, 2);
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
 
@@ -2649,7 +2726,13 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
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


