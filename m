Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 071B449945C
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 21:42:53 +0100 (CET)
Received: from localhost ([::1]:42920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC6Au-00019u-4Y
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 15:42:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5lW-0006ke-Pp
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:16:38 -0500
Received: from [2a00:1450:4864:20::52c] (port=43532
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5lP-0003GH-Qs
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:16:33 -0500
Received: by mail-ed1-x52c.google.com with SMTP id w14so5713834edd.10
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 12:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TphmjCoHQzMrsIigStP4q3nxIrmP0eJCB98BxrKAi/w=;
 b=BWl0meubjsbaxHbZt949hEd3IO/rme9XQFC2BS2Pu2TLnYUGX4oeFzs7ukOwKLSaDj
 7Jk24nDc8amhUf1B0zkINfEh7imRbQFy46f5T1r3aXeSh6AgoLMvK5uvu4vyTevEF5CO
 LNIEkdLmdVLW7Dp/1xLR4D8jmbQawhSa3IpcpAQRPBEQqHplC0oRCj0AHBJuq6NE8awj
 uqftX8i+YihhlKbSZEFRmULD/T+C0XgFhcbBa5a1XIbQeRzcKLeEwAboDULoVlnMSD7V
 JH0KZSdhSHuqsoatU2clijtXoJaMrAf4NBlaJL7nlL1YPYhcX/e9PC9Q8MFq37tNeiJZ
 AUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TphmjCoHQzMrsIigStP4q3nxIrmP0eJCB98BxrKAi/w=;
 b=JDzo5wB+Hu2NAiokmXxSpfQyd5eZOoW2rdyYQFwI2HD1SUbtjiQ/RRrl1qHjRLbNa1
 Suh7AdiCfq3UGOBq6sm/C19xjpuukQAEVojE4WY6s6bFmG8UAbKd8FidvH0mRmS/hFCp
 lKPRYQkHxnCP+5HBOPU793PrrTrO0qtKgbQnm/u6UIRmyvInlf5el6QNvgTldbpUMQ0l
 /8rOBNMZonk9nq75fWoc9xt7Cbs3OMHVDZlageZNUr+Ap+fO3YXAu6q3wH593rRU/LYN
 jsjyqg3qJz5Sjsf2hZBB04o0lPtEKjDkHiCFDDykV/gSwVylzDVTQPcSA6vgcn9LyXM1
 4KNg==
X-Gm-Message-State: AOAM5335KDNMcrKwozck2to601wPEaNLwbzRLYSgN25eBGtI2okIMAnD
 m+8WwtHTZ0UhXPEkXIPLazKkWw==
X-Google-Smtp-Source: ABdhPJyRlymesDV+HSm+b6IWWsnUnDZ1Vzsc+SKHb5h/nTRkxEauREblS3fnP45jcSxFGDW1SM8Qhg==
X-Received: by 2002:aa7:c0c9:: with SMTP id j9mr17173713edp.270.1643055389852; 
 Mon, 24 Jan 2022 12:16:29 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id oz3sm5266064ejb.219.2022.01.24.12.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 12:16:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F18A61FFC6;
 Mon, 24 Jan 2022 20:16:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 14/22] tracing: remove TCG memory access tracing
Date: Mon, 24 Jan 2022 20:16:00 +0000
Message-Id: <20220124201608.604599-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124201608.604599-1-alex.bennee@linaro.org>
References: <20220124201608.604599-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, Luis Vilanova <vilanova@imperial.ac.uk>,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, Paolo Bonzini <pbonzini@redhat.com>,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If you really want to trace all memory operations TCG plugins gives
you a more flexible interface for doing so.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Luis Vilanova <vilanova@imperial.ac.uk>
Cc: Stefan Hajnoczi <stefanha@redhat.com>

--
v2
  - dropped extra line
---
 accel/tcg/atomic_template.h   | 12 ------------
 accel/tcg/cputlb.c            |  2 --
 accel/tcg/user-exec.c         | 14 --------------
 tcg/tcg-op.c                  |  5 -----
 accel/tcg/atomic_common.c.inc | 20 --------------------
 trace-events                  | 14 --------------
 6 files changed, 67 deletions(-)

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
index 5e0d0eebc3..82adefe574 100644
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
index 6f5d4933f0..8edf0bbaa1 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -250,7 +250,6 @@ uint8_t cpu_ldb_mmu(CPUArchState *env, abi_ptr addr,
     uint8_t ret;
 
     validate_memop(oi, MO_UB);
-    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
     ret = ldub_p(haddr);
     clear_helper_retaddr();
@@ -265,7 +264,6 @@ uint16_t cpu_ldw_be_mmu(CPUArchState *env, abi_ptr addr,
     uint16_t ret;
 
     validate_memop(oi, MO_BEUW);
-    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
     ret = lduw_be_p(haddr);
     clear_helper_retaddr();
@@ -280,7 +278,6 @@ uint32_t cpu_ldl_be_mmu(CPUArchState *env, abi_ptr addr,
     uint32_t ret;
 
     validate_memop(oi, MO_BEUL);
-    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
     ret = ldl_be_p(haddr);
     clear_helper_retaddr();
@@ -295,7 +292,6 @@ uint64_t cpu_ldq_be_mmu(CPUArchState *env, abi_ptr addr,
     uint64_t ret;
 
     validate_memop(oi, MO_BEUQ);
-    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
     ret = ldq_be_p(haddr);
     clear_helper_retaddr();
@@ -310,7 +306,6 @@ uint16_t cpu_ldw_le_mmu(CPUArchState *env, abi_ptr addr,
     uint16_t ret;
 
     validate_memop(oi, MO_LEUW);
-    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
     ret = lduw_le_p(haddr);
     clear_helper_retaddr();
@@ -325,7 +320,6 @@ uint32_t cpu_ldl_le_mmu(CPUArchState *env, abi_ptr addr,
     uint32_t ret;
 
     validate_memop(oi, MO_LEUL);
-    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
     ret = ldl_le_p(haddr);
     clear_helper_retaddr();
@@ -340,7 +334,6 @@ uint64_t cpu_ldq_le_mmu(CPUArchState *env, abi_ptr addr,
     uint64_t ret;
 
     validate_memop(oi, MO_LEUQ);
-    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
     ret = ldq_le_p(haddr);
     clear_helper_retaddr();
@@ -354,7 +347,6 @@ void cpu_stb_mmu(CPUArchState *env, abi_ptr addr, uint8_t val,
     void *haddr;
 
     validate_memop(oi, MO_UB);
-    trace_guest_st_before_exec(env_cpu(env), addr, oi);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
     stb_p(haddr, val);
     clear_helper_retaddr();
@@ -367,7 +359,6 @@ void cpu_stw_be_mmu(CPUArchState *env, abi_ptr addr, uint16_t val,
     void *haddr;
 
     validate_memop(oi, MO_BEUW);
-    trace_guest_st_before_exec(env_cpu(env), addr, oi);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
     stw_be_p(haddr, val);
     clear_helper_retaddr();
@@ -380,7 +371,6 @@ void cpu_stl_be_mmu(CPUArchState *env, abi_ptr addr, uint32_t val,
     void *haddr;
 
     validate_memop(oi, MO_BEUL);
-    trace_guest_st_before_exec(env_cpu(env), addr, oi);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
     stl_be_p(haddr, val);
     clear_helper_retaddr();
@@ -393,7 +383,6 @@ void cpu_stq_be_mmu(CPUArchState *env, abi_ptr addr, uint64_t val,
     void *haddr;
 
     validate_memop(oi, MO_BEUQ);
-    trace_guest_st_before_exec(env_cpu(env), addr, oi);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
     stq_be_p(haddr, val);
     clear_helper_retaddr();
@@ -406,7 +395,6 @@ void cpu_stw_le_mmu(CPUArchState *env, abi_ptr addr, uint16_t val,
     void *haddr;
 
     validate_memop(oi, MO_LEUW);
-    trace_guest_st_before_exec(env_cpu(env), addr, oi);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
     stw_le_p(haddr, val);
     clear_helper_retaddr();
@@ -419,7 +407,6 @@ void cpu_stl_le_mmu(CPUArchState *env, abi_ptr addr, uint32_t val,
     void *haddr;
 
     validate_memop(oi, MO_LEUL);
-    trace_guest_st_before_exec(env_cpu(env), addr, oi);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
     stl_le_p(haddr, val);
     clear_helper_retaddr();
@@ -432,7 +419,6 @@ void cpu_stq_le_mmu(CPUArchState *env, abi_ptr addr, uint64_t val,
     void *haddr;
 
     validate_memop(oi, MO_LEUQ);
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


