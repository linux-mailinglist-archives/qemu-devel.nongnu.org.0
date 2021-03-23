Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0208D345555
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 03:11:15 +0100 (CET)
Received: from localhost ([::1]:33440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOWVm-0005xg-1n
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 22:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKX-0002GJ-Bx
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:59:37 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:2067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKV-0006u2-5U
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:59:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616464775; x=1648000775;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GVsjdmcVX62JFZyhKUVU/2XYRym5KuPEP4kwrlGAMdA=;
 b=iQf+jwY1MTNR3plKRONW/aV91QF7m+gX6F64N6mMKFJZ+toaKc0m6JXG
 Hc0moaCU73IaTlyAn0LmNUd1qZ1ee4tJvNr48zyh6Ti10BMC7zD2sh1Z6
 INkv4XkgWH6CKPWB8+wQcA8KnOt695RXnP+v+M/EQyuFTMHilaz3fz3Pv
 s7RqSe4qTjXlOs2oJOUhSv/FmDcrqwwxpR8TAcZxLREnjsunDqE7+pJnt
 MuBOfEO20rP75ziZ+Qw0qPKze4XuaVokYC3gC2BoSSwmWGU9BCKmVlTb3
 5pAi1sCYzLNykKVOFbQa8gRi185desZmrP6vBqE6UWThrFxca8SBAltHe A==;
IronPort-SDR: qujE89TBRha7m5bUBUB2FCwT5z69itvU7CmcnOYXVixYLe9RhrkrqAiFJUI/PNEtF5//PnuPtT
 X4XsLAs2CRFlQzXMR5NgYq68QtREV33FhbmY+ycd/kNNx5ZWzp6QyYjCH3PKonUnrwISmeoKSl
 cY5Cf3006X6UtH3YeEJ4NpGPgoMnX2RWjM7p1SjQVv+VuJXJrQuySlxaSJY1t8k3HG3uG3t+It
 b++gNvlpSOLvQ4Woba+/B5W2+9gs2lHE9hxdQcozExXTjCS6wEXwSdwmgVIkXbE26R1EYm1HQG
 CXo=
X-IronPort-AV: E=Sophos;i="5.81,270,1610380800"; d="scan'208";a="162707629"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2021 09:59:30 +0800
IronPort-SDR: 3mAS8YSK7A3k3qx8vnAJx1wCr/5tZ4LyBmLOm2KjiDPTo44V04BN6RAixTP0pz65hPguIrgclv
 uSG5IrIocY6a4Kuw3Ozdzi4YaWZ4aJQCeYFbEP9P+ELl0G9BmnrmT2cxHYlToS2wmmi2LbycjC
 OCJDLZyUX4emv4NctJcR1uwan0oSm8TTT/TNNQvvqkLBBZUSLhj37L+AOElTJbTBedhdyJAQPX
 2BcLZ/iiQINwDnzawBvJHy3Ide63b3cSGRZvwkNEb45PiP4xekRePXPv3WMnofVIXaPYiKAxQe
 aMt2i7yA5DsEcg3TGRql3MBm
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 18:41:38 -0700
IronPort-SDR: SCd02aVYPkXgT6JOI3kP96p9YW7gl/atbfDGjn4jDxUvaSCQGncmUI1k23pPkAoP5legi964Lf
 uK4xFcxkBA6kzfMEmOQps2sWLydCXz6P7+qk7BuKpIDqA1BgEFVYZlt3BMHm84J0SbJU4fSLbh
 TicAEsqL59SfPvY1dH+LdKWBXycVPq4uun26SC9M+cVAUiV+/MngbXZJRA66pBSRTSl5kLBJRm
 S740yIZbM/aAwToWaULDErNxXlEfk+9fo/zFtOjYncibVYkXMe+dDparsi0PiU1tyvmD3ohMwh
 Weo=
WDCIronportException: Internal
Received: from cn6ntbqq2.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.49.5])
 by uls-op-cesaip01.wdc.com with ESMTP; 22 Mar 2021 18:59:30 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 03/16] target/riscv: propagate PMP permission to TLB page
Date: Mon, 22 Mar 2021 21:57:43 -0400
Message-Id: <20210323015756.3168650-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323015756.3168650-1-alistair.francis@wdc.com>
References: <20210323015756.3168650-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=709ee912d=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org, Jim Shu <cwshu@andestech.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jim Shu <cwshu@andestech.com>

Currently, PMP permission checking of TLB page is bypassed if TLB hits
Fix it by propagating PMP permission to TLB page permission.

PMP permission checking also use MMU-style API to change TLB permission
and size.

Signed-off-by: Jim Shu <cwshu@andestech.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 1613916082-19528-2-git-send-email-cwshu@andestech.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/pmp.h        |  4 +-
 target/riscv/cpu_helper.c | 84 +++++++++++++++++++++++++++++----------
 target/riscv/pmp.c        | 80 +++++++++++++++++++++++++++----------
 3 files changed, 125 insertions(+), 43 deletions(-)

diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
index c8d5ef4a69..b82a30f0d5 100644
--- a/target/riscv/pmp.h
+++ b/target/riscv/pmp.h
@@ -59,11 +59,13 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
     target_ulong val);
 target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index);
 bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
-    target_ulong size, pmp_priv_t priv, target_ulong mode);
+    target_ulong size, pmp_priv_t privs, pmp_priv_t *allowed_privs,
+    target_ulong mode);
 bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
                          target_ulong *tlb_size);
 void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
 void pmp_update_rule_nums(CPURISCVState *env);
 uint32_t pmp_get_num_rules(CPURISCVState *env);
+int pmp_priv_to_page_prot(pmp_priv_t pmp_priv);
 
 #endif
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 83a6bcfad0..fa385594df 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -280,6 +280,49 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
     env->load_res = -1;
 }
 
+/*
+ * get_physical_address_pmp - check PMP permission for this physical address
+ *
+ * Match the PMP region and check permission for this physical address and it's
+ * TLB page. Returns 0 if the permission checking was successful
+ *
+ * @env: CPURISCVState
+ * @prot: The returned protection attributes
+ * @tlb_size: TLB page size containing addr. It could be modified after PMP
+ *            permission checking. NULL if not set TLB page for addr.
+ * @addr: The physical address to be checked permission
+ * @access_type: The type of MMU access
+ * @mode: Indicates current privilege level.
+ */
+static int get_physical_address_pmp(CPURISCVState *env, int *prot,
+                                    target_ulong *tlb_size, hwaddr addr,
+                                    int size, MMUAccessType access_type,
+                                    int mode)
+{
+    pmp_priv_t pmp_priv;
+    target_ulong tlb_size_pmp = 0;
+
+    if (!riscv_feature(env, RISCV_FEATURE_PMP)) {
+        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        return TRANSLATE_SUCCESS;
+    }
+
+    if (!pmp_hart_has_privs(env, addr, size, 1 << access_type, &pmp_priv,
+                            mode)) {
+        *prot = 0;
+        return TRANSLATE_PMP_FAIL;
+    }
+
+    *prot = pmp_priv_to_page_prot(pmp_priv);
+    if (tlb_size != NULL) {
+        if (pmp_is_range_in_tlb(env, addr & ~(*tlb_size - 1), &tlb_size_pmp)) {
+            *tlb_size = tlb_size_pmp;
+        }
+    }
+
+    return TRANSLATE_SUCCESS;
+}
+
 /* get_physical_address - get the physical address for this virtual address
  *
  * Do a page table walk to obtain the physical address corresponding to a
@@ -442,9 +485,11 @@ restart:
             pte_addr = base + idx * ptesize;
         }
 
-        if (riscv_feature(env, RISCV_FEATURE_PMP) &&
-            !pmp_hart_has_privs(env, pte_addr, sizeof(target_ulong),
-            1 << MMU_DATA_LOAD, PRV_S)) {
+        int pmp_prot;
+        int pmp_ret = get_physical_address_pmp(env, &pmp_prot, NULL, pte_addr,
+                                               sizeof(target_ulong),
+                                               MMU_DATA_LOAD, PRV_S);
+        if (pmp_ret != TRANSLATE_SUCCESS) {
             return TRANSLATE_PMP_FAIL;
         }
 
@@ -682,13 +727,14 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 #ifndef CONFIG_USER_ONLY
     vaddr im_address;
     hwaddr pa = 0;
-    int prot, prot2;
+    int prot, prot2, prot_pmp;
     bool pmp_violation = false;
     bool first_stage_error = true;
     bool two_stage_lookup = false;
     int ret = TRANSLATE_FAIL;
     int mode = mmu_idx;
-    target_ulong tlb_size = 0;
+    /* default TLB page size */
+    target_ulong tlb_size = TARGET_PAGE_SIZE;
 
     env->guest_phys_fault_addr = 0;
 
@@ -745,10 +791,10 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
             prot &= prot2;
 
-            if (riscv_feature(env, RISCV_FEATURE_PMP) &&
-                (ret == TRANSLATE_SUCCESS) &&
-                !pmp_hart_has_privs(env, pa, size, 1 << access_type, mode)) {
-                ret = TRANSLATE_PMP_FAIL;
+            if (ret == TRANSLATE_SUCCESS) {
+                ret = get_physical_address_pmp(env, &prot_pmp, &tlb_size, pa,
+                                               size, access_type, mode);
+                prot &= prot_pmp;
             }
 
             if (ret != TRANSLATE_SUCCESS) {
@@ -771,25 +817,21 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       "%s address=%" VADDR_PRIx " ret %d physical "
                       TARGET_FMT_plx " prot %d\n",
                       __func__, address, ret, pa, prot);
-    }
 
-    if (riscv_feature(env, RISCV_FEATURE_PMP) &&
-        (ret == TRANSLATE_SUCCESS) &&
-        !pmp_hart_has_privs(env, pa, size, 1 << access_type, mode)) {
-        ret = TRANSLATE_PMP_FAIL;
+        if (ret == TRANSLATE_SUCCESS) {
+            ret = get_physical_address_pmp(env, &prot_pmp, &tlb_size, pa,
+                                           size, access_type, mode);
+            prot &= prot_pmp;
+        }
     }
+
     if (ret == TRANSLATE_PMP_FAIL) {
         pmp_violation = true;
     }
 
     if (ret == TRANSLATE_SUCCESS) {
-        if (pmp_is_range_in_tlb(env, pa & TARGET_PAGE_MASK, &tlb_size)) {
-            tlb_set_page(cs, address & ~(tlb_size - 1), pa & ~(tlb_size - 1),
-                         prot, mmu_idx, tlb_size);
-        } else {
-            tlb_set_page(cs, address & TARGET_PAGE_MASK, pa & TARGET_PAGE_MASK,
-                         prot, mmu_idx, TARGET_PAGE_SIZE);
-        }
+        tlb_set_page(cs, address & ~(tlb_size - 1), pa & ~(tlb_size - 1),
+                     prot, mmu_idx, tlb_size);
         return true;
     } else if (probe) {
         return false;
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 80d0334e1b..ebd874cde3 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -217,6 +217,35 @@ static int pmp_is_in_range(CPURISCVState *env, int pmp_index, target_ulong addr)
     return result;
 }
 
+/*
+ * Check if the address has required RWX privs when no PMP entry is matched.
+ */
+static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
+    target_ulong size, pmp_priv_t privs, pmp_priv_t *allowed_privs,
+    target_ulong mode)
+{
+    bool ret;
+
+    if ((!riscv_feature(env, RISCV_FEATURE_PMP)) || (mode == PRV_M)) {
+        /*
+         * Privileged spec v1.10 states if HW doesn't implement any PMP entry
+         * or no PMP entry matches an M-Mode access, the access succeeds.
+         */
+        ret = true;
+        *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
+    } else {
+        /*
+         * Other modes are not allowed to succeed if they don't * match a rule,
+         * but there are rules. We've checked for no rule earlier in this
+         * function.
+         */
+        ret = false;
+        *allowed_privs = 0;
+    }
+
+    return ret;
+}
+
 
 /*
  * Public Interface
@@ -226,18 +255,19 @@ static int pmp_is_in_range(CPURISCVState *env, int pmp_index, target_ulong addr)
  * Check if the address has required RWX privs to complete desired operation
  */
 bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
-    target_ulong size, pmp_priv_t privs, target_ulong mode)
+    target_ulong size, pmp_priv_t privs, pmp_priv_t *allowed_privs,
+    target_ulong mode)
 {
     int i = 0;
     int ret = -1;
     int pmp_size = 0;
     target_ulong s = 0;
     target_ulong e = 0;
-    pmp_priv_t allowed_privs = 0;
 
     /* Short cut if no rules */
     if (0 == pmp_get_num_rules(env)) {
-        return (env->priv == PRV_M) ? true : false;
+        return pmp_hart_has_privs_default(env, addr, size, privs,
+                                          allowed_privs, mode);
     }
 
     if (size == 0) {
@@ -277,37 +307,25 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
          * check
          */
         if (((s + e) == 2) && (PMP_AMATCH_OFF != a_field)) {
-            allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
+            *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
             if ((mode != PRV_M) || pmp_is_locked(env, i)) {
-                allowed_privs &= env->pmp_state.pmp[i].cfg_reg;
+                *allowed_privs &= env->pmp_state.pmp[i].cfg_reg;
             }
 
-            if ((privs & allowed_privs) == privs) {
-                ret = 1;
-                break;
-            } else {
-                ret = 0;
-                break;
-            }
+            ret = ((privs & *allowed_privs) == privs);
+            break;
         }
     }
 
     /* No rule matched */
     if (ret == -1) {
-        if (mode == PRV_M) {
-            ret = 1; /* Privileged spec v1.10 states if no PMP entry matches an
-                      * M-Mode access, the access succeeds */
-        } else {
-            ret = 0; /* Other modes are not allowed to succeed if they don't
-                      * match a rule, but there are rules.  We've checked for
-                      * no rule earlier in this function. */
-        }
+        return pmp_hart_has_privs_default(env, addr, size, privs,
+                                          allowed_privs, mode);
     }
 
     return ret == 1 ? true : false;
 }
 
-
 /*
  * Handle a write to a pmpcfg CSP
  */
@@ -442,3 +460,23 @@ bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
 
     return false;
 }
+
+/*
+ * Convert PMP privilege to TLB page privilege.
+ */
+int pmp_priv_to_page_prot(pmp_priv_t pmp_priv)
+{
+    int prot = 0;
+
+    if (pmp_priv & PMP_READ) {
+        prot |= PAGE_READ;
+    }
+    if (pmp_priv & PMP_WRITE) {
+        prot |= PAGE_WRITE;
+    }
+    if (pmp_priv & PMP_EXEC) {
+        prot |= PAGE_EXEC;
+    }
+
+    return prot;
+}
-- 
2.30.1


