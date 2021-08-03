Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C073DE509
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:24:25 +0200 (CEST)
Received: from localhost ([::1]:53844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAlya-0002zn-PE
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlph-0003UT-6U
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:13 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:39681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpf-0002IX-Dn
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:12 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 k4-20020a17090a5144b02901731c776526so2065571pjm.4
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/O4FSLSdKM7O2eyneH+m4/fnuUnJtcbpf/wN+KzJWic=;
 b=BupbEDLLhxV5oH1gTF6dUaP1N3j0OtN9WebdwQXnsomNhxEMPT6wdGzevSKAcQTn2I
 qOaufP44IBVAnZzK3uidR+IYAX2VyIFqzfTCBzEkS8cTRfsLGkqF2Y1Y/UxRH1GbrKr9
 KiuxXuZd/lyyC4S/8vXFrqHYyUygj+Qgxb6Fn7eAVXka3oqswpBN1ynxGC45H6feOwkw
 hIj6Ak+j0NoO967BC2aeoyUoXrB3LKR52BC72AT8Db8gPUUwLfnATDfaqAwEqCI39qGc
 V5Itc8ESXzDumy+YryyO1ya/eHAGLX2uTlVUW/L0zHJ6TaGrAxkp2K5BoecCdTFR6Fid
 gj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/O4FSLSdKM7O2eyneH+m4/fnuUnJtcbpf/wN+KzJWic=;
 b=bjMtKVbIwlzfqcgsze5gQVAtvcbwnMxqRko+9r0dgcqnXwlJLd6q4EkW/q1DhrUwMJ
 9Ej18Y74LXPpnBJJJhPbSHAHm16palErkjQBD4KPxxy+6rzKAHcxfCK/eD8aUkRPiTwA
 M6FUG+iplKSA07MVZecfG+RDU+lP1HOJqgzdm/Ps1kwnPrvxLS6a+ZJAFmB+XJsuyzbR
 HjWXYf2SUrhgEOiBQwaAL3e+cRynF4ANdVlUeatnmmBJyExxA+bGIuDQ+2F/tBjCnHhM
 AUqH2EpcWA1tOSGUutpXeHLLdj9k7kJZoV95WQoY2y5RTeKOr+SmZttHIYev/WG+u35w
 PQ9A==
X-Gm-Message-State: AOAM532Z0TMkvoXYzrnHR0ZM5e1g8AD88bgY/xDrTM7PcLKuX+HPnDGQ
 8idFPxLugvh8CdwflwApuibYMgF0kq4gjw==
X-Google-Smtp-Source: ABdhPJwqu0oglYnZ7Ur3Tno1ZbRjto68E2MSmzYdJeQbU6jtW7Ff2DpkRXTgwa/LMSWuoZjIclcO7w==
X-Received: by 2002:a17:902:e04e:b029:10f:133f:87c8 with SMTP id
 x14-20020a170902e04eb029010f133f87c8mr16577887plx.70.1627964110068; 
 Mon, 02 Aug 2021 21:15:10 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.15.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:15:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/55] accel/tcg: Drop signness in tracing in cputlb.c
Date: Mon,  2 Aug 2021 18:14:09 -1000
Message-Id: <20210803041443.55452-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

We are already inconsistent about whether or not
MO_SIGN is set in trace_mem_get_info.  Dropping it
entirely allows some simplification.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c    | 10 +++-------
 accel/tcg/user-exec.c | 45 ++++++-------------------------------------
 2 files changed, 9 insertions(+), 46 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 116b289907..acdd20b1bc 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2110,7 +2110,6 @@ static inline uint64_t cpu_load_helper(CPUArchState *env, abi_ptr addr,
     meminfo = trace_mem_get_info(op, mmu_idx, false);
     trace_guest_mem_before_exec(env_cpu(env), addr, meminfo);
 
-    op &= ~MO_SIGN;
     oi = make_memop_idx(op, mmu_idx);
     ret = full_load(env, addr, oi, retaddr);
 
@@ -2128,8 +2127,7 @@ uint32_t cpu_ldub_mmuidx_ra(CPUArchState *env, abi_ptr addr,
 int cpu_ldsb_mmuidx_ra(CPUArchState *env, abi_ptr addr,
                        int mmu_idx, uintptr_t ra)
 {
-    return (int8_t)cpu_load_helper(env, addr, mmu_idx, ra, MO_SB,
-                                   full_ldub_mmu);
+    return (int8_t)cpu_ldub_mmuidx_ra(env, addr, mmu_idx, ra);
 }
 
 uint32_t cpu_lduw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
@@ -2141,8 +2139,7 @@ uint32_t cpu_lduw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
 int cpu_ldsw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
                           int mmu_idx, uintptr_t ra)
 {
-    return (int16_t)cpu_load_helper(env, addr, mmu_idx, ra, MO_BESW,
-                                    full_be_lduw_mmu);
+    return (int16_t)cpu_lduw_be_mmuidx_ra(env, addr, mmu_idx, ra);
 }
 
 uint32_t cpu_ldl_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
@@ -2166,8 +2163,7 @@ uint32_t cpu_lduw_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
 int cpu_ldsw_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
                           int mmu_idx, uintptr_t ra)
 {
-    return (int16_t)cpu_load_helper(env, addr, mmu_idx, ra, MO_LESW,
-                                    full_le_lduw_mmu);
+    return (int16_t)cpu_lduw_le_mmuidx_ra(env, addr, mmu_idx, ra);
 }
 
 uint32_t cpu_ldl_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 5ad808a25a..e687b9652e 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -866,13 +866,7 @@ uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr)
 
 int cpu_ldsb_data(CPUArchState *env, abi_ptr ptr)
 {
-    int ret;
-    uint16_t meminfo = trace_mem_get_info(MO_SB, MMU_USER_IDX, false);
-
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    ret = ldsb_p(g2h(env_cpu(env), ptr));
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
-    return ret;
+    return (int8_t)cpu_ldub_data(env, ptr);
 }
 
 uint32_t cpu_lduw_be_data(CPUArchState *env, abi_ptr ptr)
@@ -888,13 +882,7 @@ uint32_t cpu_lduw_be_data(CPUArchState *env, abi_ptr ptr)
 
 int cpu_ldsw_be_data(CPUArchState *env, abi_ptr ptr)
 {
-    int ret;
-    uint16_t meminfo = trace_mem_get_info(MO_BESW, MMU_USER_IDX, false);
-
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    ret = ldsw_be_p(g2h(env_cpu(env), ptr));
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
-    return ret;
+    return (int16_t)cpu_lduw_be_data(env, ptr);
 }
 
 uint32_t cpu_ldl_be_data(CPUArchState *env, abi_ptr ptr)
@@ -932,13 +920,7 @@ uint32_t cpu_lduw_le_data(CPUArchState *env, abi_ptr ptr)
 
 int cpu_ldsw_le_data(CPUArchState *env, abi_ptr ptr)
 {
-    int ret;
-    uint16_t meminfo = trace_mem_get_info(MO_LESW, MMU_USER_IDX, false);
-
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    ret = ldsw_le_p(g2h(env_cpu(env), ptr));
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
-    return ret;
+    return (int16_t)cpu_lduw_le_data(env, ptr);
 }
 
 uint32_t cpu_ldl_le_data(CPUArchState *env, abi_ptr ptr)
@@ -975,12 +957,7 @@ uint32_t cpu_ldub_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
 
 int cpu_ldsb_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
 {
-    int ret;
-
-    set_helper_retaddr(retaddr);
-    ret = cpu_ldsb_data(env, ptr);
-    clear_helper_retaddr();
-    return ret;
+    return (int8_t)cpu_ldub_data_ra(env, ptr, retaddr);
 }
 
 uint32_t cpu_lduw_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
@@ -995,12 +972,7 @@ uint32_t cpu_lduw_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
 
 int cpu_ldsw_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
 {
-    int ret;
-
-    set_helper_retaddr(retaddr);
-    ret = cpu_ldsw_be_data(env, ptr);
-    clear_helper_retaddr();
-    return ret;
+    return (int16_t)cpu_lduw_be_data_ra(env, ptr, retaddr);
 }
 
 uint32_t cpu_ldl_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
@@ -1035,12 +1007,7 @@ uint32_t cpu_lduw_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
 
 int cpu_ldsw_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
 {
-    int ret;
-
-    set_helper_retaddr(retaddr);
-    ret = cpu_ldsw_le_data(env, ptr);
-    clear_helper_retaddr();
-    return ret;
+    return (int16_t)cpu_lduw_le_data_ra(env, ptr, retaddr);
 }
 
 uint32_t cpu_ldl_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
-- 
2.25.1


