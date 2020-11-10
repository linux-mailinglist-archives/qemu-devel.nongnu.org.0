Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A032ACE6F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 05:13:10 +0100 (CET)
Received: from localhost ([::1]:37446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcL1p-0000Kb-6D
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 23:13:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=57671029a=alistair.francis@wdc.com>)
 id 1kcKxx-0004tk-It
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 23:09:09 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:21673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=57671029a=alistair.francis@wdc.com>)
 id 1kcKxv-0000VN-63
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 23:09:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604981598; x=1636517598;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KtCnWr4DeXwUpsroextycENHH/eFybwG79H6sDARwaQ=;
 b=TrE9LyT2kDp+1472OP8fGnbcJG2iknkG6VS6JT73e/04fgFWHP1kQsTM
 ZPZM0QujNSBAaeWSfpDX075dsj8lNqhF7bMBg2KE7YxytHg9xfV3UkxgQ
 wJMy2pa1IpRy6zqoKJpTKcCRbxFHCcE/iZV9m+cpFD5FI5L2/BhN6n7sF
 hi96ftSSjByM1CSvwhpAgVjDTIbsbXNph1OXbkOPZiIpOvLxb7A6A5rjc
 zN43Zdqylduk3rfDvnXMpQazdBddSLBQM3KE1gTGix8zpcGsMk3h2OlBh
 0OYfj78DUqP5U5XAFWxu12cFJgkVgXC3/38TbxLfqubmARoK/XlLjrL4l Q==;
IronPort-SDR: 4vYjzmLIYMxZktvc+bQ+L85MXPgVXCjxXDtYm3Lw0y7S6flIoDbWXw+46Qbr22Kpy9KJlF5IUr
 ANeSu0bvWJvdZZdJPHvSje6ul0PXS3TIdGCk+S8Tg73B4S2r3K2FQuiVad1QK7Gv6CToeX4rmK
 /QMe0vNZSPd+MFSViWrNVz+pY4GBZJ2N5BaHrVCd8bhmxb0NYlVs20nmNbwNWhiVu3mtgpf8ks
 s1Cr2d7dS5i+D3cu6lBieU4+WHJmRHHPFdmmHsXWp/vJj81oKesyPZipUGZo4bkGkZu0M8PQyi
 wbE=
X-IronPort-AV: E=Sophos;i="5.77,465,1596470400"; d="scan'208";a="255803597"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Nov 2020 12:13:08 +0800
IronPort-SDR: jWIr+JkDTzEggRkgrKCTbX9FwIzm2JP/NGnvYrH/lbxfLLG21xbIPZ2MBj6G/8nWokQhYkxB7+
 kWEXwP8FG/QH8vRIM308RN3G4QKGRDzQSKm+lwjcWhDcUPYGWNOxT/N5GsDZzpI1EQbvnSLPMD
 hOCz/FoOckf7OoWMZg48dF8x9fh0HnCSvgohGGSvNOlivKIv3Ix+iL5Gy3/oxk5w7g9OMaZmPa
 aZ3si/HhUwarSBEyjVfK1TNrmF097+9Kk2wlkwraaMyuCDhWERtd6VP7nB1K59gIVgZFMS8Pxy
 HKtuGwiv9GTiFOmUzd5nku7z
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 19:55:01 -0800
IronPort-SDR: oxE1wHlaELHjQ9HrKe+TE3xyfhjUmuWiIzL92lw8m8IbddyL/xsJcVGnS4+hhNE13aMqpY3lwo
 b1Kqzet+cKvtUopMZmAS281HHjxEwlSn6sHp/actZkhDNBlBU2DdL63Z3fJ7ipp6+abAMYwRSM
 zU8ggL9/XYTyLzrKtUD0LKeTfgtub9WkxOQjUgeO6VUDsnsqmdnAFwjRklEBCipNkGDLH/tJ3L
 jD6c0Lqc5cl+RPffsN/8s9wYRPHztY011zlqbWKgpeIBKdj6cyNSTBqA8wlBf0+tb+WMUNOlgj
 7ao=
WDCIronportException: Internal
Received: from usa001882.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.60.209])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Nov 2020 20:09:00 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 3/6] target/riscv: Remove the HS_TWO_STAGE flag
Date: Mon,  9 Nov 2020 19:57:00 -0800
Message-Id: <20201110035703.83786-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201110035703.83786-1-alistair.francis@wdc.com>
References: <20201110035703.83786-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=57671029a=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 23:09:00
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
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
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The HS_TWO_STAGE flag is no longer required as the MMU index contains
the information if we are performing a two stage access.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: f514b128b1ff0fb41c85f914cee18f905007a922.1604464950.git.alistair.francis@wdc.com
---
 target/riscv/cpu.h        |  3 +-
 target/riscv/cpu_bits.h   |  1 -
 target/riscv/cpu_helper.c | 60 ++++++++++++++++-----------------------
 target/riscv/op_helper.c  | 12 --------
 4 files changed, 25 insertions(+), 51 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5d8e54c426..0cf48a1521 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -323,8 +323,7 @@ bool riscv_cpu_virt_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
 bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env);
 void riscv_cpu_set_force_hs_excep(CPURISCVState *env, bool enable);
-bool riscv_cpu_two_stage_lookup(CPURISCVState *env);
-void riscv_cpu_set_two_stage_lookup(CPURISCVState *env, bool enable);
+bool riscv_cpu_two_stage_lookup(int mmu_idx);
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
 hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index daedad8691..24b24c69c5 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -469,7 +469,6 @@
  * page table fault.
  */
 #define FORCE_HS_EXCEP      2
-#define HS_TWO_STAGE        4
 
 /* RV32 satp CSR field masks */
 #define SATP32_MODE         0x80000000
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9dfa7af401..a2787b1d48 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -207,22 +207,9 @@ void riscv_cpu_set_force_hs_excep(CPURISCVState *env, bool enable)
     env->virt = set_field(env->virt, FORCE_HS_EXCEP, enable);
 }
 
-bool riscv_cpu_two_stage_lookup(CPURISCVState *env)
+bool riscv_cpu_two_stage_lookup(int mmu_idx)
 {
-    if (!riscv_has_ext(env, RVH)) {
-        return false;
-    }
-
-    return get_field(env->virt, HS_TWO_STAGE);
-}
-
-void riscv_cpu_set_two_stage_lookup(CPURISCVState *env, bool enable)
-{
-    if (!riscv_has_ext(env, RVH)) {
-        return;
-    }
-
-    env->virt = set_field(env->virt, HS_TWO_STAGE, enable);
+    return mmu_idx & TB_FLAGS_PRIV_HYP_ACCESS_MASK;
 }
 
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
@@ -333,7 +320,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
      * was called. Background registers will be used if the guest has
      * forced a two stage translation to be on (in HS or M mode).
      */
-    if (riscv_cpu_two_stage_lookup(env) && access_type != MMU_INST_FETCH) {
+    if (!riscv_cpu_virt_enabled(env) && riscv_cpu_two_stage_lookup(mmu_idx)) {
         use_background = true;
     }
 
@@ -572,7 +559,7 @@ restart:
 
 static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
                                 MMUAccessType access_type, bool pmp_violation,
-                                bool first_stage)
+                                bool first_stage, bool two_stage)
 {
     CPUState *cs = env_cpu(env);
     int page_fault_exceptions;
@@ -595,8 +582,7 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
         }
         break;
     case MMU_DATA_LOAD:
-        if ((riscv_cpu_virt_enabled(env) || riscv_cpu_two_stage_lookup(env)) &&
-            !first_stage) {
+        if (two_stage && !first_stage) {
             cs->exception_index = RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT;
         } else {
             cs->exception_index = page_fault_exceptions ?
@@ -604,8 +590,7 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
         }
         break;
     case MMU_DATA_STORE:
-        if ((riscv_cpu_virt_enabled(env) || riscv_cpu_two_stage_lookup(env)) &&
-            !first_stage) {
+        if (two_stage && !first_stage) {
             cs->exception_index = RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT;
         } else {
             cs->exception_index = page_fault_exceptions ?
@@ -696,6 +681,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     int prot, prot2;
     bool pmp_violation = false;
     bool first_stage_error = true;
+    bool two_stage_lookup = false;
     int ret = TRANSLATE_FAIL;
     int mode = mmu_idx;
     target_ulong tlb_size = 0;
@@ -715,11 +701,12 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         access_type != MMU_INST_FETCH &&
         get_field(env->mstatus, MSTATUS_MPRV) &&
         get_field(env->mstatus, MSTATUS_MPV)) {
-        riscv_cpu_set_two_stage_lookup(env, true);
+        two_stage_lookup = true;
     }
 
     if (riscv_cpu_virt_enabled(env) ||
-        (riscv_cpu_two_stage_lookup(env) && access_type != MMU_INST_FETCH)) {
+        ((riscv_cpu_two_stage_lookup(mmu_idx) || two_stage_lookup) &&
+         access_type != MMU_INST_FETCH)) {
         /* Two stage lookup */
         ret = get_physical_address(env, &pa, &prot, address,
                                    &env->guest_phys_fault_addr, access_type,
@@ -782,14 +769,6 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       __func__, address, ret, pa, prot);
     }
 
-    /* We did the two stage lookup based on MPRV, unset the lookup */
-    if (riscv_has_ext(env, RVH) && env->priv == PRV_M &&
-        access_type != MMU_INST_FETCH &&
-        get_field(env->mstatus, MSTATUS_MPRV) &&
-        get_field(env->mstatus, MSTATUS_MPV)) {
-        riscv_cpu_set_two_stage_lookup(env, false);
-    }
-
     if (riscv_feature(env, RISCV_FEATURE_PMP) &&
         (ret == TRANSLATE_SUCCESS) &&
         !pmp_hart_has_privs(env, pa, size, 1 << access_type, mode)) {
@@ -811,7 +790,10 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     } else if (probe) {
         return false;
     } else {
-        raise_mmu_exception(env, address, access_type, pmp_violation, first_stage_error);
+        raise_mmu_exception(env, address, access_type, pmp_violation,
+                            first_stage_error,
+                            riscv_cpu_virt_enabled(env) ||
+                                riscv_cpu_two_stage_lookup(mmu_idx));
         riscv_raise_exception(env, cs->exception_index, retaddr);
     }
 
@@ -915,9 +897,16 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         /* handle the trap in S-mode */
         if (riscv_has_ext(env, RVH)) {
             target_ulong hdeleg = async ? env->hideleg : env->hedeleg;
+            bool two_stage_lookup = false;
+
+            if (env->priv == PRV_M ||
+                (env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
+                (env->priv == PRV_U && !riscv_cpu_virt_enabled(env) &&
+                    get_field(env->hstatus, HSTATUS_HU))) {
+                    two_stage_lookup = true;
+            }
 
-            if ((riscv_cpu_virt_enabled(env) ||
-                 riscv_cpu_two_stage_lookup(env)) && write_tval) {
+            if ((riscv_cpu_virt_enabled(env) || two_stage_lookup) && write_tval) {
                 /*
                  * If we are writing a guest virtual address to stval, set
                  * this to 1. If we are trapping to VS we will set this to 0
@@ -955,11 +944,10 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                 riscv_cpu_set_force_hs_excep(env, 0);
             } else {
                 /* Trap into HS mode */
-                if (!riscv_cpu_two_stage_lookup(env)) {
+                if (!two_stage_lookup) {
                     env->hstatus = set_field(env->hstatus, HSTATUS_SPV,
                                              riscv_cpu_virt_enabled(env));
                 }
-                riscv_cpu_set_two_stage_lookup(env, false);
                 htval = env->guest_phys_fault_addr;
             }
         }
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 548c5851ec..5759850e69 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -237,8 +237,6 @@ target_ulong helper_hyp_load(CPURISCVState *env, target_ulong address,
         target_ulong pte;
         int mmu_idx = cpu_mmu_index(env, false) | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
 
-        riscv_cpu_set_two_stage_lookup(env, true);
-
         switch (memop) {
         case MO_SB:
             pte = cpu_ldsb_mmuidx_ra(env, address, mmu_idx, GETPC());
@@ -265,8 +263,6 @@ target_ulong helper_hyp_load(CPURISCVState *env, target_ulong address,
             g_assert_not_reached();
         }
 
-        riscv_cpu_set_two_stage_lookup(env, false);
-
         return pte;
     }
 
@@ -287,8 +283,6 @@ void helper_hyp_store(CPURISCVState *env, target_ulong address,
             get_field(env->hstatus, HSTATUS_HU))) {
         int mmu_idx = cpu_mmu_index(env, false) | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
 
-        riscv_cpu_set_two_stage_lookup(env, true);
-
         switch (memop) {
         case MO_SB:
         case MO_UB:
@@ -309,8 +303,6 @@ void helper_hyp_store(CPURISCVState *env, target_ulong address,
             g_assert_not_reached();
         }
 
-        riscv_cpu_set_two_stage_lookup(env, false);
-
         return;
     }
 
@@ -331,8 +323,6 @@ target_ulong helper_hyp_x_load(CPURISCVState *env, target_ulong address,
         target_ulong pte;
         int mmu_idx = cpu_mmu_index(env, false) | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
 
-        riscv_cpu_set_two_stage_lookup(env, true);
-
         switch (memop) {
         case MO_TEUW:
             pte = cpu_lduw_mmuidx_ra(env, address, mmu_idx, GETPC());
@@ -344,8 +334,6 @@ target_ulong helper_hyp_x_load(CPURISCVState *env, target_ulong address,
             g_assert_not_reached();
         }
 
-        riscv_cpu_set_two_stage_lookup(env, false);
-
         return pte;
     }
 
-- 
2.29.2


