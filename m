Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 089AD3DE565
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:33:35 +0200 (CEST)
Received: from localhost ([::1]:36168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAm7S-0003k1-0A
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpo-0003m1-6c
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:23 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:36507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpk-0002N9-AB
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:19 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so2104091pjr.1
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=d79Ehsx00V1rTKSQBrdX0FwTXwSkGrimeMRx4/TaAVU=;
 b=VM0oxaVKPRAtdd7rskyDP7HKeUtdGiMccTrfiA4n6GY1CthdpkvZSxa9AypBCffUDu
 LD3I9edbVK6TsHtx4xEdf5+T1QEC/kazZx59+pGXY0gLiYgSOTWQC+OiSXhSNB9TBF4/
 94wqqTuu90QFcfyopoSP2OpRY4ezUqkYDt2oFdhWvb2YTNIYFIQx4sVEWcy7XKYCdpVc
 Ge455KGBfv4KTRf5uPHqoq4SinQDCXYuGu+Y2T652M7myEoJYAzwXdju2hpFdREd+Iri
 U2XFG4UNRPhXOZgWu/AmY4UIjEJZKp9krRMXqkfMXUa1WwNKf7uc6CHabN96uPzHfftE
 gg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d79Ehsx00V1rTKSQBrdX0FwTXwSkGrimeMRx4/TaAVU=;
 b=qV5VvbsQxTAMWUb5TrmD9SVxA8bcWXbuskr0vpNMcYHoS8RW0WDoRR/QTtkFodEkUX
 03C49+ekz9VUax9buEjDtW1sqUrwf7fdmDkrdFweR/z0UXnbU96OCPOSOg56Q2HOzEZq
 9nZSemUbEvKS80NEmVMGCFIrVSHQHgIErFNcTjTz0+E1T/94sERYdEJSpHn4KOSK/IZ2
 aM6+3f21yVCt5UNjbYhrUdEfDrTFqYOKckz4vgBY0Wo8hqjJbYO2mJ5Tol0dFzsKmDwJ
 jieAFoZSUBBTH2UDgCAl1nhgRqC38O95eoct4CifhSoGoz8IWyw3NKHZ63p8m8wZH5rW
 PG1w==
X-Gm-Message-State: AOAM532051BXQNzOexLIL7Cog4oQu2kOO1MeQeRUeP7+a7xzCuANenP3
 1ASIOH/c3FEukK5LM4l1RLjgWEI5TaReRw==
X-Google-Smtp-Source: ABdhPJzX5vXFulo0uDrMwv4KS1BNTO+asJcdsz5dYSXnpTgde+s4X1yefGtlftDZWdlxnOdVgvS1Lw==
X-Received: by 2002:a17:902:a503:b029:12b:2429:385e with SMTP id
 s3-20020a170902a503b029012b2429385emr17137549plq.64.1627964115041; 
 Mon, 02 Aug 2021 21:15:15 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.15.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:15:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/55] trace/mem: Pass MemOpIdx to trace_mem_get_info
Date: Mon,  2 Aug 2021 18:14:13 -1000
Message-Id: <20210803041443.55452-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We (will) often have the complete MemOpIdx handy, so use that.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 trace/mem.h                   | 32 +++++++++-----------------
 accel/tcg/cputlb.c            | 12 ++++------
 accel/tcg/user-exec.c         | 42 +++++++++++++++++++++++------------
 tcg/tcg-op.c                  |  8 +++----
 accel/tcg/atomic_common.c.inc |  6 ++---
 5 files changed, 49 insertions(+), 51 deletions(-)

diff --git a/trace/mem.h b/trace/mem.h
index 2f27e7bdf0..699566c661 100644
--- a/trace/mem.h
+++ b/trace/mem.h
@@ -10,7 +10,7 @@
 #ifndef TRACE__MEM_H
 #define TRACE__MEM_H
 
-#include "tcg/tcg.h"
+#include "exec/memopidx.h"
 
 #define TRACE_MEM_SZ_SHIFT_MASK 0xf /* size shift mask */
 #define TRACE_MEM_SE (1ULL << 4)    /* sign extended (y/n) */
@@ -19,45 +19,33 @@
 #define TRACE_MEM_MMU_SHIFT 8       /* mmu idx */
 
 /**
- * trace_mem_build_info:
+ * trace_mem_get_info:
  *
  * Return a value for the 'info' argument in guest memory access traces.
  */
-static inline uint16_t trace_mem_build_info(int size_shift, bool sign_extend,
-                                            MemOp endianness, bool store,
-                                            unsigned int mmu_idx)
+static inline uint16_t trace_mem_get_info(MemOpIdx oi, bool store)
 {
+    MemOp op = get_memop(oi);
+    uint32_t size_shift = op & MO_SIZE;
+    bool sign_extend = op & MO_SIGN;
+    bool big_endian = (op & MO_BSWAP) == MO_BE;
     uint16_t res;
 
     res = size_shift & TRACE_MEM_SZ_SHIFT_MASK;
     if (sign_extend) {
         res |= TRACE_MEM_SE;
     }
-    if (endianness == MO_BE) {
+    if (big_endian) {
         res |= TRACE_MEM_BE;
     }
     if (store) {
         res |= TRACE_MEM_ST;
     }
 #ifdef CONFIG_SOFTMMU
-    res |= mmu_idx << TRACE_MEM_MMU_SHIFT;
+    res |= get_mmuidx(oi) << TRACE_MEM_MMU_SHIFT;
 #endif
+
     return res;
 }
 
-
-/**
- * trace_mem_get_info:
- *
- * Return a value for the 'info' argument in guest memory access traces.
- */
-static inline uint16_t trace_mem_get_info(MemOp op,
-                                          unsigned int mmu_idx,
-                                          bool store)
-{
-    return trace_mem_build_info(op & MO_SIZE, !!(op & MO_SIGN),
-                                op & MO_BSWAP, store,
-                                mmu_idx);
-}
-
 #endif /* TRACE__MEM_H */
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 2dfbc29a0c..c27658b8a2 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2103,14 +2103,12 @@ static inline uint64_t cpu_load_helper(CPUArchState *env, abi_ptr addr,
                                        int mmu_idx, uintptr_t retaddr,
                                        MemOp op, FullLoadHelper *full_load)
 {
-    uint16_t meminfo;
-    MemOpIdx oi;
+    MemOpIdx oi = make_memop_idx(op, mmu_idx);
+    uint16_t meminfo = trace_mem_get_info(oi, false);
     uint64_t ret;
 
-    meminfo = trace_mem_get_info(op, mmu_idx, false);
     trace_guest_mem_before_exec(env_cpu(env), addr, meminfo);
 
-    oi = make_memop_idx(op, mmu_idx);
     ret = full_load(env, addr, oi, retaddr);
 
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, meminfo);
@@ -2542,13 +2540,11 @@ static inline void QEMU_ALWAYS_INLINE
 cpu_store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
                  int mmu_idx, uintptr_t retaddr, MemOp op)
 {
-    MemOpIdx oi;
-    uint16_t meminfo;
+    MemOpIdx oi = make_memop_idx(op, mmu_idx);
+    uint16_t meminfo = trace_mem_get_info(oi, true);
 
-    meminfo = trace_mem_get_info(op, mmu_idx, true);
     trace_guest_mem_before_exec(env_cpu(env), addr, meminfo);
 
-    oi = make_memop_idx(op, mmu_idx);
     store_helper(env, addr, val, oi, retaddr, op);
 
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, meminfo);
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index eab2b9804d..68d9c1b33d 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -855,8 +855,9 @@ int cpu_signal_handler(int host_signum, void *pinfo,
 
 uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr)
 {
+    MemOpIdx oi = make_memop_idx(MO_UB, MMU_USER_IDX);
+    uint16_t meminfo = trace_mem_get_info(oi, false);
     uint32_t ret;
-    uint16_t meminfo = trace_mem_get_info(MO_UB, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     ret = ldub_p(g2h(env_cpu(env), ptr));
@@ -871,8 +872,9 @@ int cpu_ldsb_data(CPUArchState *env, abi_ptr ptr)
 
 uint32_t cpu_lduw_be_data(CPUArchState *env, abi_ptr ptr)
 {
+    MemOpIdx oi = make_memop_idx(MO_BEUW, MMU_USER_IDX);
+    uint16_t meminfo = trace_mem_get_info(oi, false);
     uint32_t ret;
-    uint16_t meminfo = trace_mem_get_info(MO_BEUW, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     ret = lduw_be_p(g2h(env_cpu(env), ptr));
@@ -887,8 +889,9 @@ int cpu_ldsw_be_data(CPUArchState *env, abi_ptr ptr)
 
 uint32_t cpu_ldl_be_data(CPUArchState *env, abi_ptr ptr)
 {
+    MemOpIdx oi = make_memop_idx(MO_BEUL, MMU_USER_IDX);
+    uint16_t meminfo = trace_mem_get_info(oi, false);
     uint32_t ret;
-    uint16_t meminfo = trace_mem_get_info(MO_BEUL, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     ret = ldl_be_p(g2h(env_cpu(env), ptr));
@@ -898,8 +901,9 @@ uint32_t cpu_ldl_be_data(CPUArchState *env, abi_ptr ptr)
 
 uint64_t cpu_ldq_be_data(CPUArchState *env, abi_ptr ptr)
 {
+    MemOpIdx oi = make_memop_idx(MO_BEQ, MMU_USER_IDX);
+    uint16_t meminfo = trace_mem_get_info(oi, false);
     uint64_t ret;
-    uint16_t meminfo = trace_mem_get_info(MO_BEQ, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     ret = ldq_be_p(g2h(env_cpu(env), ptr));
@@ -909,8 +913,9 @@ uint64_t cpu_ldq_be_data(CPUArchState *env, abi_ptr ptr)
 
 uint32_t cpu_lduw_le_data(CPUArchState *env, abi_ptr ptr)
 {
+    MemOpIdx oi = make_memop_idx(MO_LEUW, MMU_USER_IDX);
+    uint16_t meminfo = trace_mem_get_info(oi, false);
     uint32_t ret;
-    uint16_t meminfo = trace_mem_get_info(MO_LEUW, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     ret = lduw_le_p(g2h(env_cpu(env), ptr));
@@ -925,8 +930,9 @@ int cpu_ldsw_le_data(CPUArchState *env, abi_ptr ptr)
 
 uint32_t cpu_ldl_le_data(CPUArchState *env, abi_ptr ptr)
 {
+    MemOpIdx oi = make_memop_idx(MO_LEUL, MMU_USER_IDX);
+    uint16_t meminfo = trace_mem_get_info(oi, false);
     uint32_t ret;
-    uint16_t meminfo = trace_mem_get_info(MO_LEUL, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     ret = ldl_le_p(g2h(env_cpu(env), ptr));
@@ -936,8 +942,9 @@ uint32_t cpu_ldl_le_data(CPUArchState *env, abi_ptr ptr)
 
 uint64_t cpu_ldq_le_data(CPUArchState *env, abi_ptr ptr)
 {
+    MemOpIdx oi = make_memop_idx(MO_LEQ, MMU_USER_IDX);
+    uint16_t meminfo = trace_mem_get_info(oi, false);
     uint64_t ret;
-    uint16_t meminfo = trace_mem_get_info(MO_LEQ, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     ret = ldq_le_p(g2h(env_cpu(env), ptr));
@@ -1032,7 +1039,8 @@ uint64_t cpu_ldq_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
 
 void cpu_stb_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 {
-    uint16_t meminfo = trace_mem_get_info(MO_UB, MMU_USER_IDX, true);
+    MemOpIdx oi = make_memop_idx(MO_UB, MMU_USER_IDX);
+    uint16_t meminfo = trace_mem_get_info(oi, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     stb_p(g2h(env_cpu(env), ptr), val);
@@ -1041,7 +1049,8 @@ void cpu_stb_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 
 void cpu_stw_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 {
-    uint16_t meminfo = trace_mem_get_info(MO_BEUW, MMU_USER_IDX, true);
+    MemOpIdx oi = make_memop_idx(MO_BEUW, MMU_USER_IDX);
+    uint16_t meminfo = trace_mem_get_info(oi, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     stw_be_p(g2h(env_cpu(env), ptr), val);
@@ -1050,7 +1059,8 @@ void cpu_stw_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 
 void cpu_stl_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 {
-    uint16_t meminfo = trace_mem_get_info(MO_BEUL, MMU_USER_IDX, true);
+    MemOpIdx oi = make_memop_idx(MO_BEUL, MMU_USER_IDX);
+    uint16_t meminfo = trace_mem_get_info(oi, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     stl_be_p(g2h(env_cpu(env), ptr), val);
@@ -1059,7 +1069,8 @@ void cpu_stl_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 
 void cpu_stq_be_data(CPUArchState *env, abi_ptr ptr, uint64_t val)
 {
-    uint16_t meminfo = trace_mem_get_info(MO_BEQ, MMU_USER_IDX, true);
+    MemOpIdx oi = make_memop_idx(MO_BEQ, MMU_USER_IDX);
+    uint16_t meminfo = trace_mem_get_info(oi, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     stq_be_p(g2h(env_cpu(env), ptr), val);
@@ -1068,7 +1079,8 @@ void cpu_stq_be_data(CPUArchState *env, abi_ptr ptr, uint64_t val)
 
 void cpu_stw_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 {
-    uint16_t meminfo = trace_mem_get_info(MO_LEUW, MMU_USER_IDX, true);
+    MemOpIdx oi = make_memop_idx(MO_LEUW, MMU_USER_IDX);
+    uint16_t meminfo = trace_mem_get_info(oi, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     stw_le_p(g2h(env_cpu(env), ptr), val);
@@ -1077,7 +1089,8 @@ void cpu_stw_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 
 void cpu_stl_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 {
-    uint16_t meminfo = trace_mem_get_info(MO_LEUL, MMU_USER_IDX, true);
+    MemOpIdx oi = make_memop_idx(MO_LEUL, MMU_USER_IDX);
+    uint16_t meminfo = trace_mem_get_info(oi, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     stl_le_p(g2h(env_cpu(env), ptr), val);
@@ -1086,7 +1099,8 @@ void cpu_stl_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 
 void cpu_stq_le_data(CPUArchState *env, abi_ptr ptr, uint64_t val)
 {
-    uint16_t meminfo = trace_mem_get_info(MO_LEQ, MMU_USER_IDX, true);
+    MemOpIdx oi = make_memop_idx(MO_LEQ, MMU_USER_IDX);
+    uint16_t meminfo = trace_mem_get_info(oi, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     stq_le_p(g2h(env_cpu(env), ptr), val);
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index e1490c372e..37b440af7f 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2866,7 +2866,7 @@ static inline void plugin_gen_mem_callbacks(TCGv vaddr, uint16_t info)
 void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
 {
     MemOp orig_memop;
-    uint16_t info = trace_mem_get_info(memop, idx, 0);
+    uint16_t info = trace_mem_get_info(make_memop_idx(memop, idx), 0);
 
     tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     memop = tcg_canonicalize_memop(memop, 0, 0);
@@ -2904,7 +2904,7 @@ void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
 void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
 {
     TCGv_i32 swap = NULL;
-    uint16_t info = trace_mem_get_info(memop, idx, 1);
+    uint16_t info = trace_mem_get_info(make_memop_idx(memop, idx), 1);
 
     tcg_gen_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
     memop = tcg_canonicalize_memop(memop, 0, 1);
@@ -2956,7 +2956,7 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
 
     tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     memop = tcg_canonicalize_memop(memop, 1, 0);
-    info = trace_mem_get_info(memop, idx, 0);
+    info = trace_mem_get_info(make_memop_idx(memop, idx), 0);
     trace_guest_mem_before_tcg(tcg_ctx->cpu, cpu_env, addr, info);
 
     orig_memop = memop;
@@ -3004,7 +3004,7 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
 
     tcg_gen_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
     memop = tcg_canonicalize_memop(memop, 1, 1);
-    info = trace_mem_get_info(memop, idx, 1);
+    info = trace_mem_get_info(make_memop_idx(memop, idx), 1);
     trace_guest_mem_before_tcg(tcg_ctx->cpu, cpu_env, addr, info);
 
     if (!TCG_TARGET_HAS_MEMORY_BSWAP && (memop & MO_BSWAP)) {
diff --git a/accel/tcg/atomic_common.c.inc b/accel/tcg/atomic_common.c.inc
index ebaa793464..6019a957b9 100644
--- a/accel/tcg/atomic_common.c.inc
+++ b/accel/tcg/atomic_common.c.inc
@@ -17,7 +17,7 @@ static uint16_t atomic_trace_rmw_pre(CPUArchState *env, target_ulong addr,
                                      MemOpIdx oi)
 {
     CPUState *cpu = env_cpu(env);
-    uint16_t info = trace_mem_get_info(get_memop(oi), get_mmuidx(oi), false);
+    uint16_t info = trace_mem_get_info(oi, false);
 
     trace_guest_mem_before_exec(cpu, addr, info);
     trace_guest_mem_before_exec(cpu, addr, info | TRACE_MEM_ST);
@@ -36,7 +36,7 @@ static void atomic_trace_rmw_post(CPUArchState *env, target_ulong addr,
 static uint16_t atomic_trace_ld_pre(CPUArchState *env, target_ulong addr,
                                     MemOpIdx oi)
 {
-    uint16_t info = trace_mem_get_info(get_memop(oi), get_mmuidx(oi), false);
+    uint16_t info = trace_mem_get_info(oi, false);
 
     trace_guest_mem_before_exec(env_cpu(env), addr, info);
 
@@ -52,7 +52,7 @@ static void atomic_trace_ld_post(CPUArchState *env, target_ulong addr,
 static uint16_t atomic_trace_st_pre(CPUArchState *env, target_ulong addr,
                                     MemOpIdx oi)
 {
-    uint16_t info = trace_mem_get_info(get_memop(oi), get_mmuidx(oi), true);
+    uint16_t info = trace_mem_get_info(oi, true);
 
     trace_guest_mem_before_exec(env_cpu(env), addr, info);
 
-- 
2.25.1


