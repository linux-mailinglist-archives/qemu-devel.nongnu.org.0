Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCD343B0A4
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:57:33 +0200 (CEST)
Received: from localhost ([::1]:58754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfK96-0007fe-Fd
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJi7-0002Na-0R
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:39 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJi4-0004gl-JH
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:38 -0400
Received: by mail-wr1-x436.google.com with SMTP id v17so16989640wrv.9
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TBVxZ6Q/g+qUmFR+s8MXbIY8mtSx45SwwXl5Me8/rtw=;
 b=q5AMTefPruO6m+dcOkWpRuChjOw/ygChfDqN5mMyoVDEmFeURJwTuZ125y9tCHPRU/
 rQIlgzHK3CaKjGi/zQ+M3+8XYQNl/IpmBxuzNMZr/E67U+YtVHQmD5JvXL3PdFyZLp+y
 bxk6Ais4euUJlDzPunOS6X22WcZ+L9dAsTaO8JHgxb0YYxPLOLoYBJcG6Bz6nO+72pOn
 baZ1VJqTuXygx17xkIZP44FXJE5ixpInWpWQGVo+AyQqYEbnnvcKa1wK4Z0j42rAo7qq
 DbNl1gh7mFEqWxMPepnXOQtxK5F2q8wI/2AnOZO+2EsTxYPee8/84/wuRJgDMWXIjULv
 3/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TBVxZ6Q/g+qUmFR+s8MXbIY8mtSx45SwwXl5Me8/rtw=;
 b=SRa6JCaRca1xyNsFpVHKRgbCrOqmBRuMDuA85xYixxuRIrQojfGVutwAxTjksWc10u
 GlnWPLXyrobIrrnaVAjcxIWt/+b4vCsbgTaZ9VhyhhTuNRTM6yye5wVDQs/Capb4zNy0
 xNZ2ll5ElfYvLHrNYOaYMt7KYQASpTyn1x1GZLmp8+n0FbW75VM3l9AM8sZDkhYRgpm0
 UCIMoEFteZPJRJbkGSUhEefVO07NLfKQgG43gBcocjkS4bRZtkjX/CPG6LMQvlCYGFLF
 BNt3RlrTxcQwVf31gsg9n3WL0klBwL2U3a8yKSPuJOG36YJa2DDCg2B7RL5r4eHbB/rl
 SBUg==
X-Gm-Message-State: AOAM530RL6LGuYpgff9W+zfjxdaTNlCwfAZeBKYHpGFt+4JIAeByZXs0
 HCnryvDyb4D1x3n8RZAPE8/9vA==
X-Google-Smtp-Source: ABdhPJzfZRErDSyWk+4bYjJrIx0Dvmxp1wjxrPbFAaksFC6fD9wGxPjTT7a8k5tY9uQfBxWvrJ7ijg==
X-Received: by 2002:adf:b353:: with SMTP id k19mr30792588wrd.325.1635244174990; 
 Tue, 26 Oct 2021 03:29:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 13sm6168796wrz.38.2021.10.26.03.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:29:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BDA191FFB8;
 Tue, 26 Oct 2021 11:22:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 22/28] tracing: remove TCG memory access tracing
Date: Tue, 26 Oct 2021 11:22:28 +0100
Message-Id: <20211026102234.3961636-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026102234.3961636-1-alex.bennee@linaro.org>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 robhenry@microsoft.com, Luis Vilanova <vilanova@imperial.ac.uk>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If you really want to trace all memory operations TCG plugins gives
you a more flexible interface for doing so.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Luis Vilanova <vilanova@imperial.ac.uk>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
---
 accel/tcg/atomic_template.h   | 12 ------------
 accel/tcg/cputlb.c            |  2 --
 accel/tcg/user-exec.c         | 15 +--------------
 tcg/tcg-op.c                  |  5 -----
 accel/tcg/atomic_common.c.inc | 20 --------------------
 trace-events                  | 14 --------------
 6 files changed, 1 insertion(+), 67 deletions(-)

diff --git a/accel/tcg/atomic_template.h b/accel/tcg/atomic_template.h
index 2d917b6b1f..fc165031e8 100644
--- a/accel/tcg/atomic_template.h
+++ b/accel/tcg/atomic_template.h
@@ -77,7 +77,6 @@ ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
                                          PAGE_READ | PAGE_WRITE, retaddr);
     DATA_TYPE ret;
 
-    atomic_trace_rmw_pre(env, addr, oi);
 #if DATA_SIZE == 16
     ret = atomic16_cmpxchg(haddr, cmpv, newv);
 #else
@@ -97,7 +96,6 @@ ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr,
                                          PAGE_READ, retaddr);
     DATA_TYPE val;
 
-    atomic_trace_ld_pre(env, addr, oi);
     val = atomic16_read(haddr);
     ATOMIC_MMU_CLEANUP;
     atomic_trace_ld_post(env, addr, oi);
@@ -110,7 +108,6 @@ void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
                                          PAGE_WRITE, retaddr);
 
-    atomic_trace_st_pre(env, addr, oi);
     atomic16_set(haddr, val);
     ATOMIC_MMU_CLEANUP;
     atomic_trace_st_post(env, addr, oi);
@@ -124,7 +121,6 @@ ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
                                          PAGE_READ | PAGE_WRITE, retaddr);
     DATA_TYPE ret;
 
-    atomic_trace_rmw_pre(env, addr, oi);
     ret = qatomic_xchg__nocheck(haddr, val);
     ATOMIC_MMU_CLEANUP;
     atomic_trace_rmw_post(env, addr, oi);
@@ -138,7 +134,6 @@ ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,  \
                                          PAGE_READ | PAGE_WRITE, retaddr); \
     DATA_TYPE ret;                                                  \
-    atomic_trace_rmw_pre(env, addr, oi);                            \
     ret = qatomic_##X(haddr, val);                                  \
     ATOMIC_MMU_CLEANUP;                                             \
     atomic_trace_rmw_post(env, addr, oi);                           \
@@ -171,7 +166,6 @@ ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
     XDATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE, \
                                           PAGE_READ | PAGE_WRITE, retaddr); \
     XDATA_TYPE cmp, old, new, val = xval;                           \
-    atomic_trace_rmw_pre(env, addr, oi);                            \
     smp_mb();                                                       \
     cmp = qatomic_read__nocheck(haddr);                             \
     do {                                                            \
@@ -216,7 +210,6 @@ ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
                                          PAGE_READ | PAGE_WRITE, retaddr);
     DATA_TYPE ret;
 
-    atomic_trace_rmw_pre(env, addr, oi);
 #if DATA_SIZE == 16
     ret = atomic16_cmpxchg(haddr, BSWAP(cmpv), BSWAP(newv));
 #else
@@ -236,7 +229,6 @@ ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr,
                                          PAGE_READ, retaddr);
     DATA_TYPE val;
 
-    atomic_trace_ld_pre(env, addr, oi);
     val = atomic16_read(haddr);
     ATOMIC_MMU_CLEANUP;
     atomic_trace_ld_post(env, addr, oi);
@@ -249,7 +241,6 @@ void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
                                          PAGE_WRITE, retaddr);
 
-    atomic_trace_st_pre(env, addr, oi);
     val = BSWAP(val);
     atomic16_set(haddr, val);
     ATOMIC_MMU_CLEANUP;
@@ -264,7 +255,6 @@ ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
                                          PAGE_READ | PAGE_WRITE, retaddr);
     ABI_TYPE ret;
 
-    atomic_trace_rmw_pre(env, addr, oi);
     ret = qatomic_xchg__nocheck(haddr, BSWAP(val));
     ATOMIC_MMU_CLEANUP;
     atomic_trace_rmw_post(env, addr, oi);
@@ -278,7 +268,6 @@ ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,  \
                                          PAGE_READ | PAGE_WRITE, retaddr); \
     DATA_TYPE ret;                                                  \
-    atomic_trace_rmw_pre(env, addr, oi);                            \
     ret = qatomic_##X(haddr, BSWAP(val));                           \
     ATOMIC_MMU_CLEANUP;                                             \
     atomic_trace_rmw_post(env, addr, oi);                           \
@@ -308,7 +297,6 @@ ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
     XDATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE, \
                                           PAGE_READ | PAGE_WRITE, retaddr); \
     XDATA_TYPE ldo, ldn, old, new, val = xval;                      \
-    atomic_trace_rmw_pre(env, addr, oi);                            \
     smp_mb();                                                       \
     ldn = qatomic_read__nocheck(haddr);                             \
     do {                                                            \
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b69a953447..6899e4fe72 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2140,7 +2140,6 @@ static inline uint64_t cpu_load_helper(CPUArchState *env, abi_ptr addr,
 {
     uint64_t ret;
 
-    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
     ret = full_load(env, addr, oi, retaddr);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
     return ret;
@@ -2487,7 +2486,6 @@ static inline void cpu_store_helper(CPUArchState *env, target_ulong addr,
                                     uint64_t val, MemOpIdx oi, uintptr_t ra,
                                     FullStoreHelper *full_store)
 {
-    trace_guest_st_before_exec(env_cpu(env), addr, oi);
     full_store(env, addr, val, oi, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index e6bb29b42d..7e10634580 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -920,7 +920,6 @@ uint8_t cpu_ldb_mmu(CPUArchState *env, abi_ptr addr,
     uint8_t ret;
 
     validate_memop(oi, MO_UB);
-    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
     ret = ldub_p(haddr);
     clear_helper_retaddr();
@@ -935,7 +934,6 @@ uint16_t cpu_ldw_be_mmu(CPUArchState *env, abi_ptr addr,
     uint16_t ret;
 
     validate_memop(oi, MO_BEUW);
-    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
     ret = lduw_be_p(haddr);
     clear_helper_retaddr();
@@ -950,7 +948,6 @@ uint32_t cpu_ldl_be_mmu(CPUArchState *env, abi_ptr addr,
     uint32_t ret;
 
     validate_memop(oi, MO_BEUL);
-    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
     ret = ldl_be_p(haddr);
     clear_helper_retaddr();
@@ -965,7 +962,7 @@ uint64_t cpu_ldq_be_mmu(CPUArchState *env, abi_ptr addr,
     uint64_t ret;
 
     validate_memop(oi, MO_BEQ);
-    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
+
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
     ret = ldq_be_p(haddr);
     clear_helper_retaddr();
@@ -980,7 +977,6 @@ uint16_t cpu_ldw_le_mmu(CPUArchState *env, abi_ptr addr,
     uint16_t ret;
 
     validate_memop(oi, MO_LEUW);
-    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
     ret = lduw_le_p(haddr);
     clear_helper_retaddr();
@@ -995,7 +991,6 @@ uint32_t cpu_ldl_le_mmu(CPUArchState *env, abi_ptr addr,
     uint32_t ret;
 
     validate_memop(oi, MO_LEUL);
-    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
     ret = ldl_le_p(haddr);
     clear_helper_retaddr();
@@ -1010,7 +1005,6 @@ uint64_t cpu_ldq_le_mmu(CPUArchState *env, abi_ptr addr,
     uint64_t ret;
 
     validate_memop(oi, MO_LEQ);
-    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
     ret = ldq_le_p(haddr);
     clear_helper_retaddr();
@@ -1024,7 +1018,6 @@ void cpu_stb_mmu(CPUArchState *env, abi_ptr addr, uint8_t val,
     void *haddr;
 
     validate_memop(oi, MO_UB);
-    trace_guest_st_before_exec(env_cpu(env), addr, oi);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
     stb_p(haddr, val);
     clear_helper_retaddr();
@@ -1037,7 +1030,6 @@ void cpu_stw_be_mmu(CPUArchState *env, abi_ptr addr, uint16_t val,
     void *haddr;
 
     validate_memop(oi, MO_BEUW);
-    trace_guest_st_before_exec(env_cpu(env), addr, oi);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
     stw_be_p(haddr, val);
     clear_helper_retaddr();
@@ -1050,7 +1042,6 @@ void cpu_stl_be_mmu(CPUArchState *env, abi_ptr addr, uint32_t val,
     void *haddr;
 
     validate_memop(oi, MO_BEUL);
-    trace_guest_st_before_exec(env_cpu(env), addr, oi);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
     stl_be_p(haddr, val);
     clear_helper_retaddr();
@@ -1063,7 +1054,6 @@ void cpu_stq_be_mmu(CPUArchState *env, abi_ptr addr, uint64_t val,
     void *haddr;
 
     validate_memop(oi, MO_BEQ);
-    trace_guest_st_before_exec(env_cpu(env), addr, oi);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
     stq_be_p(haddr, val);
     clear_helper_retaddr();
@@ -1076,7 +1066,6 @@ void cpu_stw_le_mmu(CPUArchState *env, abi_ptr addr, uint16_t val,
     void *haddr;
 
     validate_memop(oi, MO_LEUW);
-    trace_guest_st_before_exec(env_cpu(env), addr, oi);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
     stw_le_p(haddr, val);
     clear_helper_retaddr();
@@ -1089,7 +1078,6 @@ void cpu_stl_le_mmu(CPUArchState *env, abi_ptr addr, uint32_t val,
     void *haddr;
 
     validate_memop(oi, MO_LEUL);
-    trace_guest_st_before_exec(env_cpu(env), addr, oi);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
     stl_le_p(haddr, val);
     clear_helper_retaddr();
@@ -1102,7 +1090,6 @@ void cpu_stq_le_mmu(CPUArchState *env, abi_ptr addr, uint64_t val,
     void *haddr;
 
     validate_memop(oi, MO_LEQ);
-    trace_guest_st_before_exec(env_cpu(env), addr, oi);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
     stq_le_p(haddr, val);
     clear_helper_retaddr();
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 61b492d89f..65e1c94c2d 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -27,7 +27,6 @@
 #include "tcg/tcg.h"
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-mo.h"
-#include "trace-tcg.h"
 #include "exec/plugin-gen.h"
 
 /* Reduce the number of ifdefs below.  This assumes that all uses of
@@ -2877,7 +2876,6 @@ void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
     tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     memop = tcg_canonicalize_memop(memop, 0, 0);
     oi = make_memop_idx(memop, idx);
-    trace_guest_ld_before_tcg(tcg_ctx->cpu, cpu_env, addr, oi);
 
     orig_memop = memop;
     if (!TCG_TARGET_HAS_MEMORY_BSWAP && (memop & MO_BSWAP)) {
@@ -2916,7 +2914,6 @@ void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
     tcg_gen_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
     memop = tcg_canonicalize_memop(memop, 0, 1);
     oi = make_memop_idx(memop, idx);
-    trace_guest_st_before_tcg(tcg_ctx->cpu, cpu_env, addr, oi);
 
     if (!TCG_TARGET_HAS_MEMORY_BSWAP && (memop & MO_BSWAP)) {
         swap = tcg_temp_new_i32();
@@ -2965,7 +2962,6 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
     tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     memop = tcg_canonicalize_memop(memop, 1, 0);
     oi = make_memop_idx(memop, idx);
-    trace_guest_ld_before_tcg(tcg_ctx->cpu, cpu_env, addr, oi);
 
     orig_memop = memop;
     if (!TCG_TARGET_HAS_MEMORY_BSWAP && (memop & MO_BSWAP)) {
@@ -3013,7 +3009,6 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
     tcg_gen_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
     memop = tcg_canonicalize_memop(memop, 1, 1);
     oi = make_memop_idx(memop, idx);
-    trace_guest_st_before_tcg(tcg_ctx->cpu, cpu_env, addr, oi);
 
     if (!TCG_TARGET_HAS_MEMORY_BSWAP && (memop & MO_BSWAP)) {
         swap = tcg_temp_new_i64();
diff --git a/accel/tcg/atomic_common.c.inc b/accel/tcg/atomic_common.c.inc
index 1df1f243e9..6602d7689f 100644
--- a/accel/tcg/atomic_common.c.inc
+++ b/accel/tcg/atomic_common.c.inc
@@ -13,14 +13,6 @@
  * See the COPYING file in the top-level directory.
  */
 
-static void atomic_trace_rmw_pre(CPUArchState *env, target_ulong addr,
-                                 MemOpIdx oi)
-{
-    CPUState *cpu = env_cpu(env);
-
-    trace_guest_rmw_before_exec(cpu, addr, oi);
-}
-
 static void atomic_trace_rmw_post(CPUArchState *env, target_ulong addr,
                                   MemOpIdx oi)
 {
@@ -28,24 +20,12 @@ static void atomic_trace_rmw_post(CPUArchState *env, target_ulong addr,
 }
 
 #if HAVE_ATOMIC128
-static void atomic_trace_ld_pre(CPUArchState *env, target_ulong addr,
-                                MemOpIdx oi)
-{
-    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
-}
-
 static void atomic_trace_ld_post(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi)
 {
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
 }
 
-static void atomic_trace_st_pre(CPUArchState *env, target_ulong addr,
-                                MemOpIdx oi)
-{
-    trace_guest_st_before_exec(env_cpu(env), addr, oi);
-}
-
 static void atomic_trace_st_post(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi)
 {
diff --git a/trace-events b/trace-events
index a637a61eba..bc71006675 100644
--- a/trace-events
+++ b/trace-events
@@ -117,20 +117,6 @@ vcpu guest_cpu_exit(void)
 # Targets: all
 vcpu guest_cpu_reset(void)
 
-# tcg/tcg-op.c
-
-# @vaddr: Access' virtual address.
-# @memopidx: Access' information (see below).
-#
-# Start virtual memory access (before any potential access violation).
-# Does not include memory accesses performed by devices.
-#
-# Mode: user, softmmu
-# Targets: TCG(all)
-vcpu tcg guest_ld_before(TCGv vaddr, uint32_t memopidx) "info=%d", "vaddr=0x%016"PRIx64" memopidx=0x%x"
-vcpu tcg guest_st_before(TCGv vaddr, uint32_t memopidx) "info=%d", "vaddr=0x%016"PRIx64" memopidx=0x%x"
-vcpu tcg guest_rmw_before(TCGv vaddr, uint32_t memopidx) "info=%d", "vaddr=0x%016"PRIx64" memopidx=0x%x"
-
 # include/user/syscall-trace.h
 
 # @num: System call number.
-- 
2.30.2


