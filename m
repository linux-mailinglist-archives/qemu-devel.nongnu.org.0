Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C24D6F7A58
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:06:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujsg-0005Jr-49; Thu, 04 May 2023 21:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujsb-0005A0-BS
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:05:01 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujsV-00077q-QI
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:05:00 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1ab01bf474aso8555865ad.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248694; x=1685840694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=COPdmPGTsakgWsYch7yYN18znxXDMdJHEbnCGEjq5WM=;
 b=EDLh3MVMLIy/CmCzuNitFyNaIw+S6PiBS95vmM+wXmFw08qsWANhlxgIjEsKHN+NYt
 pTq4vN9O3qdSiydVYax+O/d2dJWR13kqjFdmXOrCLM06CohriWhfhRtjzACg7Odc1+d1
 eooUQJ982JxPyKCTLY3/VNZ4k6ZGWsKG3Zf0xFc2mMaQcKlY3CCp3DKeGHT6FMyelwn6
 exxoYQC9OFANcnOlWj7btI/WRylTX2ZXOa7t/E+LHgjJ+ArL0Oks5F4PCvZb7eDwB5wu
 tvlRHSCaJUwfRJD11QA2dRwxU77Yg/RH2G7+G5elCK4hRNR5EnlB8zNpQgNtJJ+ayct+
 JeqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248694; x=1685840694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=COPdmPGTsakgWsYch7yYN18znxXDMdJHEbnCGEjq5WM=;
 b=A8xrVBO+94FQD715o20i5O9c0/qD6xVqx/tObMN+/ZMYcetZn0TFZEtsewvTD230Iy
 yZXgDG2N6qH5KoXrLr9o4x4iv4VdQHWBZDG1b0+Sn5GczXnlpR0rbQa4rulaU653DfqC
 aSgrEIkt/RFd77S7bWfSln1F6Xt535SVsGKQUAYTdKv/WZRYxGGR16hn1lZy32gPAZ0t
 CuHiGXqA0ymYLbHepnS2AIchCDYph4FruYvFtQCvFd/zKL15wSKYD9RsXQHKg5XsKAok
 SpjCGCRTy3jmkMWj+XUUrT1eLkJ4iS8OvXc7HywLa+qOxNtl7ujuYPQkqoyZI7KGp+rd
 ULDw==
X-Gm-Message-State: AC+VfDzsyXkqDAzvlRKkArdggUI3nEoUF8XuUJHkAxdKGW+1k8I8BIZp
 vSum1uurr/7IFD6Jjb8+lff7hXcxNVnmBQ==
X-Google-Smtp-Source: ACHHUZ7mSteBsfPL9fhhQiR7cBOmVnTe8ed3bPiaoUlTDKuY0vE50YH59vklGukUhTiK0jScKqmV/w==
X-Received: by 2002:a17:902:8b83:b0:1a1:bfe8:4fae with SMTP id
 ay3-20020a1709028b8300b001a1bfe84faemr5646716plb.43.1683248693817; 
 Thu, 04 May 2023 18:04:53 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:04:53 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 28/89] target/riscv: Remove riscv_cpu_virt_enabled()
Date: Fri,  5 May 2023 11:01:40 +1000
Message-Id: <20230505010241.21812-29-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Weiwei Li <liweiwei@iscas.ac.cn>

Directly use env->virt_enabled instead.

Suggested-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230405085813.40643-2-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        |  1 -
 target/riscv/cpu.c        |  2 +-
 target/riscv/cpu_helper.c | 51 ++++++++++++++++++---------------------
 target/riscv/csr.c        | 46 +++++++++++++++++------------------
 target/riscv/debug.c      | 10 ++++----
 target/riscv/op_helper.c  | 18 +++++++-------
 target/riscv/pmu.c        |  4 +--
 target/riscv/translate.c  |  2 +-
 8 files changed, 64 insertions(+), 70 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ff6b3c6720..995192757a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -585,7 +585,6 @@ bool riscv_cpu_fp_enabled(CPURISCVState *env);
 target_ulong riscv_cpu_get_geilen(CPURISCVState *env);
 void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
 bool riscv_cpu_vector_enabled(CPURISCVState *env);
-bool riscv_cpu_virt_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
 bool riscv_cpu_two_stage_lookup(int mmu_idx);
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cd9e7bdce6..c304deabd7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -556,7 +556,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 
 #if !defined(CONFIG_USER_ONLY)
     if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s %d\n", "V      =  ", riscv_cpu_virt_enabled(env));
+        qemu_fprintf(f, " %s %d\n", "V      =  ", env->virt_enabled);
     }
 #endif
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "pc      ", env->pc);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index b0e094a933..fbcdec3c06 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -93,8 +93,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 
     if (riscv_has_ext(env, RVH)) {
         if (env->priv == PRV_M ||
-            (env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
-            (env->priv == PRV_U && !riscv_cpu_virt_enabled(env) &&
+            (env->priv == PRV_S && !env->virt_enabled) ||
+            (env->priv == PRV_U && !env->virt_enabled &&
                 get_field(env->hstatus, HSTATUS_HU))) {
             flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
         }
@@ -391,7 +391,7 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
     uint64_t irqs, pending, mie, hsie, vsie;
 
     /* Determine interrupt enable state of all privilege modes */
-    if (riscv_cpu_virt_enabled(env)) {
+    if (env->virt_enabled) {
         mie = 1;
         hsie = 1;
         vsie = (env->priv < PRV_S) ||
@@ -452,7 +452,7 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 bool riscv_cpu_fp_enabled(CPURISCVState *env)
 {
     if (env->mstatus & MSTATUS_FS) {
-        if (riscv_cpu_virt_enabled(env) && !(env->mstatus_hs & MSTATUS_FS)) {
+        if (env->virt_enabled && !(env->mstatus_hs & MSTATUS_FS)) {
             return false;
         }
         return true;
@@ -465,7 +465,7 @@ bool riscv_cpu_fp_enabled(CPURISCVState *env)
 bool riscv_cpu_vector_enabled(CPURISCVState *env)
 {
     if (env->mstatus & MSTATUS_VS) {
-        if (riscv_cpu_virt_enabled(env) && !(env->mstatus_hs & MSTATUS_VS)) {
+        if (env->virt_enabled && !(env->mstatus_hs & MSTATUS_VS)) {
             return false;
         }
         return true;
@@ -483,7 +483,7 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
     if (riscv_has_ext(env, RVF)) {
         mstatus_mask |= MSTATUS_FS;
     }
-    bool current_virt = riscv_cpu_virt_enabled(env);
+    bool current_virt = env->virt_enabled;
 
     g_assert(riscv_has_ext(env, RVH));
 
@@ -558,11 +558,6 @@ void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen)
     env->geilen = geilen;
 }
 
-bool riscv_cpu_virt_enabled(CPURISCVState *env)
-{
-    return env->virt_enabled;
-}
-
 /* This function can only be called to set virt when RVH is enabled */
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
 {
@@ -609,7 +604,7 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask,
     CPUState *cs = env_cpu(env);
     uint64_t gein, vsgein = 0, vstip = 0, old = env->mip;
 
-    if (riscv_cpu_virt_enabled(env)) {
+    if (env->virt_enabled) {
         gein = get_field(env->hstatus, HSTATUS_VGEIN);
         vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
     }
@@ -768,7 +763,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
      * was called. Background registers will be used if the guest has
      * forced a two stage translation to be on (in HS or M mode).
      */
-    if (!riscv_cpu_virt_enabled(env) && two_stage) {
+    if (!env->virt_enabled && two_stage) {
         use_background = true;
     }
 
@@ -931,7 +926,7 @@ restart:
         bool pbmte = env->menvcfg & MENVCFG_PBMTE;
         bool hade = env->menvcfg & MENVCFG_HADE;
 
-        if (first_stage && two_stage && riscv_cpu_virt_enabled(env)) {
+        if (first_stage && two_stage && env->virt_enabled) {
             pbmte = pbmte && (env->henvcfg & HENVCFG_PBMTE);
             hade = hade && (env->henvcfg & HENVCFG_HADE);
         }
@@ -1091,7 +1086,7 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
 
     switch (access_type) {
     case MMU_INST_FETCH:
-        if (riscv_cpu_virt_enabled(env) && !first_stage) {
+        if (env->virt_enabled && !first_stage) {
             cs->exception_index = RISCV_EXCP_INST_GUEST_PAGE_FAULT;
         } else {
             cs->exception_index = page_fault_exceptions ?
@@ -1131,11 +1126,11 @@ hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     int mmu_idx = cpu_mmu_index(&cpu->env, false);
 
     if (get_physical_address(env, &phys_addr, &prot, addr, NULL, 0, mmu_idx,
-                             true, riscv_cpu_virt_enabled(env), true)) {
+                             true, env->virt_enabled, true)) {
         return -1;
     }
 
-    if (riscv_cpu_virt_enabled(env)) {
+    if (env->virt_enabled) {
         if (get_physical_address(env, &phys_addr, &prot, phys_addr, NULL,
                                  0, mmu_idx, false, true, true)) {
             return -1;
@@ -1163,7 +1158,7 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     }
 
     env->badaddr = addr;
-    env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
+    env->two_stage_lookup = env->virt_enabled ||
                             riscv_cpu_two_stage_lookup(mmu_idx);
     env->two_stage_indirect_lookup = false;
     cpu_loop_exit_restore(cs, retaddr);
@@ -1189,7 +1184,7 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
         g_assert_not_reached();
     }
     env->badaddr = addr;
-    env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
+    env->two_stage_lookup = env->virt_enabled ||
                             riscv_cpu_two_stage_lookup(mmu_idx);
     env->two_stage_indirect_lookup = false;
     cpu_loop_exit_restore(cs, retaddr);
@@ -1253,7 +1248,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     }
 
     pmu_tlb_fill_incr_ctr(cpu, access_type);
-    if (riscv_cpu_virt_enabled(env) ||
+    if (env->virt_enabled ||
         ((riscv_cpu_two_stage_lookup(mmu_idx) || two_stage_lookup) &&
          access_type != MMU_INST_FETCH)) {
         /* Two stage lookup */
@@ -1351,7 +1346,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     } else {
         raise_mmu_exception(env, address, access_type, pmp_violation,
                             first_stage_error,
-                            riscv_cpu_virt_enabled(env) ||
+                            env->virt_enabled ||
                                 riscv_cpu_two_stage_lookup(mmu_idx),
                             two_stage_indirect_error);
         cpu_loop_exit_restore(cs, retaddr);
@@ -1658,9 +1653,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
 
             if (env->priv == PRV_M) {
                 cause = RISCV_EXCP_M_ECALL;
-            } else if (env->priv == PRV_S && riscv_cpu_virt_enabled(env)) {
+            } else if (env->priv == PRV_S && env->virt_enabled) {
                 cause = RISCV_EXCP_VS_ECALL;
-            } else if (env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) {
+            } else if (env->priv == PRV_S && !env->virt_enabled) {
                 cause = RISCV_EXCP_S_ECALL;
             } else if (env->priv == PRV_U) {
                 cause = RISCV_EXCP_U_ECALL;
@@ -1683,7 +1678,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         if (riscv_has_ext(env, RVH)) {
             uint64_t hdeleg = async ? env->hideleg : env->hedeleg;
 
-            if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1)) {
+            if (env->virt_enabled && ((hdeleg >> cause) & 1)) {
                 /* Trap to VS mode */
                 /*
                  * See if we need to adjust cause. Yes if its VS mode interrupt
@@ -1694,7 +1689,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                     cause = cause - 1;
                 }
                 write_gva = false;
-            } else if (riscv_cpu_virt_enabled(env)) {
+            } else if (env->virt_enabled) {
                 /* Trap into HS mode, from virt */
                 riscv_cpu_swap_hypervisor_regs(env);
                 env->hstatus = set_field(env->hstatus, HSTATUS_SPVP,
@@ -1728,12 +1723,12 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     } else {
         /* handle the trap in M-mode */
         if (riscv_has_ext(env, RVH)) {
-            if (riscv_cpu_virt_enabled(env)) {
+            if (env->virt_enabled) {
                 riscv_cpu_swap_hypervisor_regs(env);
             }
             env->mstatus = set_field(env->mstatus, MSTATUS_MPV,
-                                     riscv_cpu_virt_enabled(env));
-            if (riscv_cpu_virt_enabled(env) && tval) {
+                                     env->virt_enabled);
+            if (env->virt_enabled && tval) {
                 env->mstatus = set_field(env->mstatus, MSTATUS_GVA, 1);
             }
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 777d7fbac0..41e56012d5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -45,7 +45,7 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
 #if !defined(CONFIG_USER_ONLY)
 RISCVException smstateen_acc_ok(CPURISCVState *env, int index, uint64_t bit)
 {
-    bool virt = riscv_cpu_virt_enabled(env);
+    bool virt = env->virt_enabled;
 
     if (env->priv == PRV_M || !riscv_cpu_cfg(env)->ext_smstateen) {
         return RISCV_EXCP_NONE;
@@ -135,7 +135,7 @@ skip_ext_pmu_check:
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
-    if (riscv_cpu_virt_enabled(env)) {
+    if (env->virt_enabled) {
         if (!get_field(env->hcounteren, ctr_mask) ||
             (env->priv == PRV_U && !get_field(env->scounteren, ctr_mask))) {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
@@ -365,7 +365,7 @@ static RISCVException hstateenh(CPURISCVState *env, int csrno)
 
 static RISCVException sstateen(CPURISCVState *env, int csrno)
 {
-    bool virt = riscv_cpu_virt_enabled(env);
+    bool virt = env->virt_enabled;
     int index = csrno - CSR_SSTATEEN0;
 
     if (!riscv_cpu_cfg(env)->ext_smstateen) {
@@ -430,7 +430,7 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
-    if (riscv_cpu_virt_enabled(env)) {
+    if (env->virt_enabled) {
         if (!(get_field(env->hcounteren, COUNTEREN_TM) &&
               get_field(env->henvcfg, HENVCFG_STCE))) {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
@@ -536,7 +536,7 @@ static RISCVException seed(CPURISCVState *env, int csrno)
      */
     if (env->priv == PRV_M) {
         return RISCV_EXCP_NONE;
-    } else if (riscv_cpu_virt_enabled(env)) {
+    } else if (env->virt_enabled) {
         if (env->mseccfg & MSECCFG_SSEED) {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         } else {
@@ -964,7 +964,7 @@ static int read_scountovf(CPURISCVState *env, int csrno, target_ulong *val)
 static RISCVException read_time(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
-    uint64_t delta = riscv_cpu_virt_enabled(env) ? env->htimedelta : 0;
+    uint64_t delta = env->virt_enabled ? env->htimedelta : 0;
 
     if (!env->rdtime_fn) {
         return RISCV_EXCP_ILLEGAL_INST;
@@ -977,7 +977,7 @@ static RISCVException read_time(CPURISCVState *env, int csrno,
 static RISCVException read_timeh(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
-    uint64_t delta = riscv_cpu_virt_enabled(env) ? env->htimedelta : 0;
+    uint64_t delta = env->virt_enabled ? env->htimedelta : 0;
 
     if (!env->rdtime_fn) {
         return RISCV_EXCP_ILLEGAL_INST;
@@ -1031,7 +1031,7 @@ static RISCVException write_vstimecmph(CPURISCVState *env, int csrno,
 static RISCVException read_stimecmp(CPURISCVState *env, int csrno,
                                     target_ulong *val)
 {
-    if (riscv_cpu_virt_enabled(env)) {
+    if (env->virt_enabled) {
         *val = env->vstimecmp;
     } else {
         *val = env->stimecmp;
@@ -1043,7 +1043,7 @@ static RISCVException read_stimecmp(CPURISCVState *env, int csrno,
 static RISCVException read_stimecmph(CPURISCVState *env, int csrno,
                                      target_ulong *val)
 {
-    if (riscv_cpu_virt_enabled(env)) {
+    if (env->virt_enabled) {
         *val = env->vstimecmp >> 32;
     } else {
         *val = env->stimecmp >> 32;
@@ -1055,7 +1055,7 @@ static RISCVException read_stimecmph(CPURISCVState *env, int csrno,
 static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
                                      target_ulong val)
 {
-    if (riscv_cpu_virt_enabled(env)) {
+    if (env->virt_enabled) {
         if (env->hvictl & HVICTL_VTI) {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
@@ -1076,7 +1076,7 @@ static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
 static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
                                       target_ulong val)
 {
-    if (riscv_cpu_virt_enabled(env)) {
+    if (env->virt_enabled) {
         if (env->hvictl & HVICTL_VTI) {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
@@ -1530,7 +1530,7 @@ static int read_mtopi(CPURISCVState *env, int csrno, target_ulong *val)
 
 static int aia_xlate_vs_csrno(CPURISCVState *env, int csrno)
 {
-    if (!riscv_cpu_virt_enabled(env)) {
+    if (!env->virt_enabled) {
         return csrno;
     }
 
@@ -1687,7 +1687,7 @@ static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
 
 done:
     if (ret) {
-        return (riscv_cpu_virt_enabled(env) && virt) ?
+        return (env->virt_enabled && virt) ?
                RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
     }
     return RISCV_EXCP_NONE;
@@ -1741,7 +1741,7 @@ static int rmw_xtopei(CPURISCVState *env, int csrno, target_ulong *val,
 
 done:
     if (ret) {
-        return (riscv_cpu_virt_enabled(env) && virt) ?
+        return (env->virt_enabled && virt) ?
                RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
     }
     return RISCV_EXCP_NONE;
@@ -2171,7 +2171,7 @@ static RISCVException write_hstateenh_1_3(CPURISCVState *env, int csrno,
 static RISCVException read_sstateen(CPURISCVState *env, int csrno,
                                     target_ulong *val)
 {
-    bool virt = riscv_cpu_virt_enabled(env);
+    bool virt = env->virt_enabled;
     int index = csrno - CSR_SSTATEEN0;
 
     *val = env->sstateen[index] & env->mstateen[index];
@@ -2185,7 +2185,7 @@ static RISCVException read_sstateen(CPURISCVState *env, int csrno,
 static RISCVException write_sstateen(CPURISCVState *env, int csrno,
                                      uint64_t mask, target_ulong new_val)
 {
-    bool virt = riscv_cpu_virt_enabled(env);
+    bool virt = env->virt_enabled;
     int index = csrno - CSR_SSTATEEN0;
     uint64_t wr_mask;
     uint64_t *reg;
@@ -2380,7 +2380,7 @@ static RISCVException rmw_sie64(CPURISCVState *env, int csrno,
     RISCVException ret;
     uint64_t mask = env->mideleg & S_MODE_INTERRUPTS;
 
-    if (riscv_cpu_virt_enabled(env)) {
+    if (env->virt_enabled) {
         if (env->hvictl & HVICTL_VTI) {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
@@ -2590,7 +2590,7 @@ static RISCVException rmw_sip64(CPURISCVState *env, int csrno,
     RISCVException ret;
     uint64_t mask = env->mideleg & sip_writable_mask;
 
-    if (riscv_cpu_virt_enabled(env)) {
+    if (env->virt_enabled) {
         if (env->hvictl & HVICTL_VTI) {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
@@ -2783,7 +2783,7 @@ static int read_stopi(CPURISCVState *env, int csrno, target_ulong *val)
     int irq;
     uint8_t iprio;
 
-    if (riscv_cpu_virt_enabled(env)) {
+    if (env->virt_enabled) {
         return read_vstopi(env, CSR_VSTOPI, val);
     }
 
@@ -3128,7 +3128,7 @@ static int read_hvipriox(CPURISCVState *env, int first_index,
 
     /* First index has to be a multiple of number of irqs per register */
     if (first_index % num_irqs) {
-        return (riscv_cpu_virt_enabled(env)) ?
+        return (env->virt_enabled) ?
                RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -3154,7 +3154,7 @@ static int write_hvipriox(CPURISCVState *env, int first_index,
 
     /* First index has to be a multiple of number of irqs per register */
     if (first_index % num_irqs) {
-        return (riscv_cpu_virt_enabled(env)) ?
+        return (env->virt_enabled) ?
                RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -3809,7 +3809,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
     int csr_priv, effective_priv = env->priv;
 
     if (riscv_has_ext(env, RVH) && env->priv == PRV_S &&
-        !riscv_cpu_virt_enabled(env)) {
+        !env->virt_enabled) {
         /*
          * We are in HS mode. Add 1 to the effective privledge level to
          * allow us to access the Hypervisor CSRs.
@@ -3819,7 +3819,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
 
     csr_priv = get_field(csrno, 0x300);
     if (!env->debugger && (effective_priv < csr_priv)) {
-        if (csr_priv == (PRV_S + 1) && riscv_cpu_virt_enabled(env)) {
+        if (csr_priv == (PRV_S + 1) && env->virt_enabled) {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
         return RISCV_EXCP_ILLEGAL_INST;
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index b091293069..1f7aed23c9 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -515,7 +515,7 @@ itrigger_set_count(CPURISCVState *env, int index, int value)
 static bool check_itrigger_priv(CPURISCVState *env, int index)
 {
     target_ulong tdata1 = env->tdata1[index];
-    if (riscv_cpu_virt_enabled(env)) {
+    if (env->virt_enabled) {
         /* check VU/VS bit against current privilege level */
         return (get_field(tdata1, ITRIGGER_VS) == env->priv) ||
                (get_field(tdata1, ITRIGGER_VU) == env->priv);
@@ -787,7 +787,7 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
             switch (trigger_type) {
             case TRIGGER_TYPE_AD_MATCH:
                 /* type 2 trigger cannot be fired in VU/VS mode */
-                if (riscv_cpu_virt_enabled(env)) {
+                if (env->virt_enabled) {
                     return false;
                 }
 
@@ -806,7 +806,7 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
                 pc = env->tdata2[i];
 
                 if ((ctrl & TYPE6_EXEC) && (bp->pc == pc)) {
-                    if (riscv_cpu_virt_enabled(env)) {
+                    if (env->virt_enabled) {
                         /* check VU/VS bit against current privilege level */
                         if ((ctrl >> 23) & BIT(env->priv)) {
                             return true;
@@ -845,7 +845,7 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
         switch (trigger_type) {
         case TRIGGER_TYPE_AD_MATCH:
             /* type 2 trigger cannot be fired in VU/VS mode */
-            if (riscv_cpu_virt_enabled(env)) {
+            if (env->virt_enabled) {
                 return false;
             }
 
@@ -880,7 +880,7 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
             }
 
             if ((wp->flags & flags) && (wp->vaddr == addr)) {
-                if (riscv_cpu_virt_enabled(env)) {
+                if (env->virt_enabled) {
                     /* check VU/VS bit against current privilege level */
                     if ((ctrl >> 23) & BIT(env->priv)) {
                         return true;
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 1eecae9547..c0c4ced7f0 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -140,7 +140,7 @@ static void check_zicbo_envcfg(CPURISCVState *env, target_ulong envbits,
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
     }
 
-    if (riscv_cpu_virt_enabled(env) &&
+    if (env->virt_enabled &&
         (((env->priv < PRV_H) && !get_field(env->henvcfg, envbits)) ||
          ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits)))) {
         riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, ra);
@@ -278,7 +278,7 @@ target_ulong helper_sret(CPURISCVState *env)
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
     }
 
-    if (riscv_cpu_virt_enabled(env) && get_field(env->hstatus, HSTATUS_VTSR)) {
+    if (env->virt_enabled && get_field(env->hstatus, HSTATUS_VTSR)) {
         riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
     }
 
@@ -293,7 +293,7 @@ target_ulong helper_sret(CPURISCVState *env)
     }
     env->mstatus = mstatus;
 
-    if (riscv_has_ext(env, RVH) && !riscv_cpu_virt_enabled(env)) {
+    if (riscv_has_ext(env, RVH) && !env->virt_enabled) {
         /* We support Hypervisor extensions and virtulisation is disabled */
         target_ulong hstatus = env->hstatus;
 
@@ -365,9 +365,9 @@ void helper_wfi(CPURISCVState *env)
     bool prv_s = env->priv == PRV_S;
 
     if (((prv_s || (!rvs && prv_u)) && get_field(env->mstatus, MSTATUS_TW)) ||
-        (rvs && prv_u && !riscv_cpu_virt_enabled(env))) {
+        (rvs && prv_u && !env->virt_enabled)) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
-    } else if (riscv_cpu_virt_enabled(env) && (prv_u ||
+    } else if (env->virt_enabled && (prv_u ||
         (prv_s && get_field(env->hstatus, HSTATUS_VTW)))) {
         riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
     } else {
@@ -384,7 +384,7 @@ void helper_tlb_flush(CPURISCVState *env)
         (env->priv == PRV_S &&
          get_field(env->mstatus, MSTATUS_TVM))) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
-    } else if (riscv_has_ext(env, RVH) && riscv_cpu_virt_enabled(env) &&
+    } else if (riscv_has_ext(env, RVH) && env->virt_enabled &&
                get_field(env->hstatus, HSTATUS_VTVM)) {
         riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
     } else {
@@ -402,12 +402,12 @@ void helper_hyp_tlb_flush(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
 
-    if (env->priv == PRV_S && riscv_cpu_virt_enabled(env)) {
+    if (env->priv == PRV_S && env->virt_enabled) {
         riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
     }
 
     if (env->priv == PRV_M ||
-        (env->priv == PRV_S && !riscv_cpu_virt_enabled(env))) {
+        (env->priv == PRV_S && !env->virt_enabled)) {
         tlb_flush(cs);
         return;
     }
@@ -417,7 +417,7 @@ void helper_hyp_tlb_flush(CPURISCVState *env)
 
 void helper_hyp_gvma_tlb_flush(CPURISCVState *env)
 {
-    if (env->priv == PRV_S && !riscv_cpu_virt_enabled(env) &&
+    if (env->priv == PRV_S && !env->virt_enabled &&
         get_field(env->mstatus, MSTATUS_TVM)) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
     }
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index 96ce2dbe49..48ad60be2b 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -109,7 +109,7 @@ static int riscv_pmu_incr_ctr_rv32(RISCVCPU *cpu, uint32_t ctr_idx)
     CPURISCVState *env = &cpu->env;
     target_ulong max_val = UINT32_MAX;
     PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
-    bool virt_on = riscv_cpu_virt_enabled(env);
+    bool virt_on = env->virt_enabled;
 
     /* Privilege mode filtering */
     if ((env->priv == PRV_M &&
@@ -150,7 +150,7 @@ static int riscv_pmu_incr_ctr_rv64(RISCVCPU *cpu, uint32_t ctr_idx)
     CPURISCVState *env = &cpu->env;
     PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
     uint64_t max_val = UINT64_MAX;
-    bool virt_on = riscv_cpu_virt_enabled(env);
+    bool virt_on = env->virt_enabled;
 
     /* Privilege mode filtering */
     if ((env->priv == PRV_M &&
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 5dddac44bc..03748f72e6 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1169,7 +1169,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->priv_ver = env->priv_ver;
 #if !defined(CONFIG_USER_ONLY)
     if (riscv_has_ext(env, RVH)) {
-        ctx->virt_enabled = riscv_cpu_virt_enabled(env);
+        ctx->virt_enabled = env->virt_enabled;
     } else {
         ctx->virt_enabled = false;
     }
-- 
2.40.0


