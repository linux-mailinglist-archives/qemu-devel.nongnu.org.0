Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED74A133A03
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 05:12:33 +0100 (CET)
Received: from localhost ([::1]:35748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ip2hs-0007wn-Uk
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 23:12:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49559)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ip2Ir-0004gI-NU
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 22:46:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ip2Ip-0003UJ-71
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 22:46:41 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:51226)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ip2Io-0003ST-TG
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 22:46:39 -0500
Received: by mail-pj1-x1033.google.com with SMTP id j11so466325pjs.1
 for <qemu-devel@nongnu.org>; Tue, 07 Jan 2020 19:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zc75EjE8w8RVB6gBDV3zhh7cLhbg3IDqBzTdm5jMpgw=;
 b=amlU88bcUdXwao84i0GyHTJ96561A2uYSYvetUaFpYlqEFM6/YVM4HNd7Gg48RtWt2
 6RglW6s8zbaJtwzDlpF/gxNGOitC4pPgpkbrYhiuV6khtlu1gWeUghJpVfVUpKYG4Cnh
 jnA+dyGJPkZ6MGB/eFZy2L3ippTDtA7B6Lk9UN037YIk2ahlMsHZly8+vd3wUu+a0oVd
 8MZk1pICMcnkghyrEmpwns6+mXuGn/ch7+r0cQaSmG+WvoIZvyWHpf74Rdu+QzRHKHFX
 14HxDM+2g00lXRoJpBaM+gZcHoeT1M8d70MHGTWipfNq7tQtdpqZeJnbduFVqVoBttkW
 E4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zc75EjE8w8RVB6gBDV3zhh7cLhbg3IDqBzTdm5jMpgw=;
 b=HmoeUQrn+AQmODkMu6akush9fLbKu+MNa9iNZF5ABYmDdsfjVKiLFjsJXyEyE5nuBg
 IJh56AKyReLHVrm46JLLtp+tQzHFzWlyCJBMVGDryHnVBo2/UPDAdGOab0APx6HNBXtd
 tnwuP0SmCICU/BQNqJZl4Ui2CG0KeE6UvOQvbw9wK3TZku8R8t6bc/uqYGTEbWg1p3yp
 xvij6+XRhYKMIyqqT5F8lxNvm9egf5B9GUPxSRxR7iZjHcDtfNgLHClhkiDNOE5SPu6K
 bC53DxJGg/H/24+kfp3d5EjfP1wgBr9fEhlkQFaMtSL6s0vNykCAewfm5L6oNK9G5+OS
 IAaQ==
X-Gm-Message-State: APjAAAUe1aKGDGV1wl1CeJphp3FkRUN9olrUocOI5GBjxDUXIzQmxEe4
 fR67TYjyYAIa7wg58Xu2Vid0oZGogK28dw==
X-Google-Smtp-Source: APXvYqzgPCqZiS6tFNONmw7EvvcRzDtTGNLIMJmRACKeQOzzQukptOn7uB88/CRjtqaT7AyKuhQS7w==
X-Received: by 2002:a17:90b:1110:: with SMTP id
 gi16mr2064114pjb.110.1578455196690; 
 Tue, 07 Jan 2020 19:46:36 -0800 (PST)
Received: from localhost.localdomain (alanje.lnk.telstra.net.
 [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id f23sm1198433pgj.76.2020.01.07.19.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 19:46:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/41] cputlb: Expand cpu_ldst_useronly_template.h in
 user-exec.c
Date: Wed,  8 Jan 2020 14:45:04 +1100
Message-Id: <20200108034523.17349-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200108034523.17349-1-richard.henderson@linaro.org>
References: <20200108034523.17349-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1033
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the tracing hooks, the inline functions are no longer
so simple.  Reduce the amount of preprocessor obfuscation
by expanding the text of each of the functions generated.

Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h                   |  54 +++--
 include/exec/cpu_ldst_useronly_template.h | 159 ---------------
 accel/tcg/user-exec.c                     | 236 ++++++++++++++++++++++
 3 files changed, 262 insertions(+), 187 deletions(-)
 delete mode 100644 include/exec/cpu_ldst_useronly_template.h

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 41b98ba801..0f3c49a005 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -120,35 +120,33 @@ static inline void clear_helper_retaddr(void)
 
 /* In user-only mode we provide only the _code and _data accessors. */
 
-#define MEMSUFFIX _data
-#define DATA_SIZE 1
-#include "exec/cpu_ldst_useronly_template.h"
+uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr);
+uint32_t cpu_lduw_data(CPUArchState *env, abi_ptr ptr);
+uint32_t cpu_ldl_data(CPUArchState *env, abi_ptr ptr);
+uint64_t cpu_ldq_data(CPUArchState *env, abi_ptr ptr);
+int cpu_ldsb_data(CPUArchState *env, abi_ptr ptr);
+int cpu_ldsw_data(CPUArchState *env, abi_ptr ptr);
 
-#define DATA_SIZE 2
-#include "exec/cpu_ldst_useronly_template.h"
+uint32_t cpu_ldub_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr);
+uint32_t cpu_lduw_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr);
+uint32_t cpu_ldl_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr);
+uint64_t cpu_ldq_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr);
+int cpu_ldsb_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr);
+int cpu_ldsw_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr);
 
-#define DATA_SIZE 4
-#include "exec/cpu_ldst_useronly_template.h"
+void cpu_stb_data(CPUArchState *env, abi_ptr ptr, uint32_t val);
+void cpu_stw_data(CPUArchState *env, abi_ptr ptr, uint32_t val);
+void cpu_stl_data(CPUArchState *env, abi_ptr ptr, uint32_t val);
+void cpu_stq_data(CPUArchState *env, abi_ptr ptr, uint64_t val);
 
-#define DATA_SIZE 8
-#include "exec/cpu_ldst_useronly_template.h"
-#undef MEMSUFFIX
-
-#define MEMSUFFIX _code
-#define CODE_ACCESS
-#define DATA_SIZE 1
-#include "exec/cpu_ldst_useronly_template.h"
-
-#define DATA_SIZE 2
-#include "exec/cpu_ldst_useronly_template.h"
-
-#define DATA_SIZE 4
-#include "exec/cpu_ldst_useronly_template.h"
-
-#define DATA_SIZE 8
-#include "exec/cpu_ldst_useronly_template.h"
-#undef MEMSUFFIX
-#undef CODE_ACCESS
+void cpu_stb_data_ra(CPUArchState *env, abi_ptr ptr,
+                     uint32_t val, uintptr_t retaddr);
+void cpu_stw_data_ra(CPUArchState *env, abi_ptr ptr,
+                     uint32_t val, uintptr_t retaddr);
+void cpu_stl_data_ra(CPUArchState *env, abi_ptr ptr,
+                     uint32_t val, uintptr_t retaddr);
+void cpu_stq_data_ra(CPUArchState *env, abi_ptr ptr,
+                     uint64_t val, uintptr_t retaddr);
 
 /*
  * Provide the same *_mmuidx_ra interface as for softmmu.
@@ -520,6 +518,8 @@ void cpu_stq_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint64_t val,
 #undef CPU_MMU_INDEX
 #undef MEMSUFFIX
 
+#endif /* defined(CONFIG_USER_ONLY) */
+
 uint32_t cpu_ldub_code(CPUArchState *env, abi_ptr addr);
 uint32_t cpu_lduw_code(CPUArchState *env, abi_ptr addr);
 uint32_t cpu_ldl_code(CPUArchState *env, abi_ptr addr);
@@ -535,8 +535,6 @@ static inline int cpu_ldsw_code(CPUArchState *env, abi_ptr addr)
     return (int16_t)cpu_lduw_code(env, addr);
 }
 
-#endif /* defined(CONFIG_USER_ONLY) */
-
 /**
  * tlb_vaddr_to_host:
  * @env: CPUArchState
diff --git a/include/exec/cpu_ldst_useronly_template.h b/include/exec/cpu_ldst_useronly_template.h
deleted file mode 100644
index e5a3d1983a..0000000000
--- a/include/exec/cpu_ldst_useronly_template.h
+++ /dev/null
@@ -1,159 +0,0 @@
-/*
- *  User-only accessor function support
- *
- * Generate inline load/store functions for one data size.
- *
- * Generate a store function as well as signed and unsigned loads.
- *
- * Not used directly but included from cpu_ldst.h.
- *
- *  Copyright (c) 2015 Linaro Limited
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#if !defined(CODE_ACCESS)
-#include "trace-root.h"
-#endif
-
-#include "trace/mem.h"
-
-#if DATA_SIZE == 8
-#define SUFFIX q
-#define USUFFIX q
-#define DATA_TYPE uint64_t
-#define SHIFT 3
-#elif DATA_SIZE == 4
-#define SUFFIX l
-#define USUFFIX l
-#define DATA_TYPE uint32_t
-#define SHIFT 2
-#elif DATA_SIZE == 2
-#define SUFFIX w
-#define USUFFIX uw
-#define DATA_TYPE uint16_t
-#define DATA_STYPE int16_t
-#define SHIFT 1
-#elif DATA_SIZE == 1
-#define SUFFIX b
-#define USUFFIX ub
-#define DATA_TYPE uint8_t
-#define DATA_STYPE int8_t
-#define SHIFT 0
-#else
-#error unsupported data size
-#endif
-
-#if DATA_SIZE == 8
-#define RES_TYPE uint64_t
-#else
-#define RES_TYPE uint32_t
-#endif
-
-static inline RES_TYPE
-glue(glue(cpu_ld, USUFFIX), MEMSUFFIX)(CPUArchState *env, abi_ptr ptr)
-{
-    RES_TYPE ret;
-#ifdef CODE_ACCESS
-    set_helper_retaddr(1);
-    ret = glue(glue(ld, USUFFIX), _p)(g2h(ptr));
-    clear_helper_retaddr();
-#else
-    MemOp op = MO_TE | SHIFT;
-    uint16_t meminfo = trace_mem_get_info(op, MMU_USER_IDX, false);
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    ret = glue(glue(ld, USUFFIX), _p)(g2h(ptr));
-#endif
-    return ret;
-}
-
-#ifndef CODE_ACCESS
-static inline RES_TYPE
-glue(glue(glue(cpu_ld, USUFFIX), MEMSUFFIX), _ra)(CPUArchState *env,
-                                                  abi_ptr ptr,
-                                                  uintptr_t retaddr)
-{
-    RES_TYPE ret;
-    set_helper_retaddr(retaddr);
-    ret = glue(glue(cpu_ld, USUFFIX), MEMSUFFIX)(env, ptr);
-    clear_helper_retaddr();
-    return ret;
-}
-#endif
-
-#if DATA_SIZE <= 2
-static inline int
-glue(glue(cpu_lds, SUFFIX), MEMSUFFIX)(CPUArchState *env, abi_ptr ptr)
-{
-    int ret;
-#ifdef CODE_ACCESS
-    set_helper_retaddr(1);
-    ret = glue(glue(lds, SUFFIX), _p)(g2h(ptr));
-    clear_helper_retaddr();
-#else
-    MemOp op = MO_TE | MO_SIGN | SHIFT;
-    uint16_t meminfo = trace_mem_get_info(op, MMU_USER_IDX, false);
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    ret = glue(glue(lds, SUFFIX), _p)(g2h(ptr));
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
-#endif
-    return ret;
-}
-
-#ifndef CODE_ACCESS
-static inline int
-glue(glue(glue(cpu_lds, SUFFIX), MEMSUFFIX), _ra)(CPUArchState *env,
-                                                  abi_ptr ptr,
-                                                  uintptr_t retaddr)
-{
-    int ret;
-    set_helper_retaddr(retaddr);
-    ret = glue(glue(cpu_lds, SUFFIX), MEMSUFFIX)(env, ptr);
-    clear_helper_retaddr();
-    return ret;
-}
-#endif /* CODE_ACCESS */
-#endif /* DATA_SIZE <= 2 */
-
-#ifndef CODE_ACCESS
-static inline void
-glue(glue(cpu_st, SUFFIX), MEMSUFFIX)(CPUArchState *env, abi_ptr ptr,
-                                      RES_TYPE v)
-{
-    MemOp op = MO_TE | SHIFT;
-    uint16_t meminfo = trace_mem_get_info(op, MMU_USER_IDX, true);
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    glue(glue(st, SUFFIX), _p)(g2h(ptr), v);
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
-}
-
-static inline void
-glue(glue(glue(cpu_st, SUFFIX), MEMSUFFIX), _ra)(CPUArchState *env,
-                                                  abi_ptr ptr,
-                                                  RES_TYPE v,
-                                                  uintptr_t retaddr)
-{
-    set_helper_retaddr(retaddr);
-    glue(glue(cpu_st, SUFFIX), MEMSUFFIX)(env, ptr, v);
-    clear_helper_retaddr();
-}
-#endif
-
-#undef RES_TYPE
-#undef DATA_TYPE
-#undef DATA_STYPE
-#undef SUFFIX
-#undef USUFFIX
-#undef DATA_SIZE
-#undef SHIFT
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index b09f7a1577..79da4219bb 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -26,6 +26,8 @@
 #include "translate-all.h"
 #include "exec/helper-proto.h"
 #include "qemu/atomic128.h"
+#include "trace-root.h"
+#include "trace/mem.h"
 
 #undef EAX
 #undef ECX
@@ -734,6 +736,240 @@ int cpu_signal_handler(int host_signum, void *pinfo,
 
 /* The softmmu versions of these helpers are in cputlb.c.  */
 
+uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr)
+{
+    uint32_t ret;
+    uint16_t meminfo = trace_mem_get_info(MO_UB, MMU_USER_IDX, false);
+
+    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    ret = ldub_p(g2h(ptr));
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+    return ret;
+}
+
+int cpu_ldsb_data(CPUArchState *env, abi_ptr ptr)
+{
+    int ret;
+    uint16_t meminfo = trace_mem_get_info(MO_SB, MMU_USER_IDX, false);
+
+    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    ret = ldsb_p(g2h(ptr));
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+    return ret;
+}
+
+uint32_t cpu_lduw_data(CPUArchState *env, abi_ptr ptr)
+{
+    uint32_t ret;
+    uint16_t meminfo = trace_mem_get_info(MO_TEUW, MMU_USER_IDX, false);
+
+    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    ret = lduw_p(g2h(ptr));
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+    return ret;
+}
+
+int cpu_ldsw_data(CPUArchState *env, abi_ptr ptr)
+{
+    int ret;
+    uint16_t meminfo = trace_mem_get_info(MO_TESW, MMU_USER_IDX, false);
+
+    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    ret = ldsw_p(g2h(ptr));
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+    return ret;
+}
+
+uint32_t cpu_ldl_data(CPUArchState *env, abi_ptr ptr)
+{
+    uint32_t ret;
+    uint16_t meminfo = trace_mem_get_info(MO_TEUL, MMU_USER_IDX, false);
+
+    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    ret = ldl_p(g2h(ptr));
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+    return ret;
+}
+
+uint64_t cpu_ldq_data(CPUArchState *env, abi_ptr ptr)
+{
+    uint64_t ret;
+    uint16_t meminfo = trace_mem_get_info(MO_TEQ, MMU_USER_IDX, false);
+
+    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    ret = ldq_p(g2h(ptr));
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+    return ret;
+}
+
+uint32_t cpu_ldub_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
+{
+    uint32_t ret;
+
+    set_helper_retaddr(retaddr);
+    ret = cpu_ldub_data(env, ptr);
+    clear_helper_retaddr();
+    return ret;
+}
+
+int cpu_ldsb_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
+{
+    int ret;
+
+    set_helper_retaddr(retaddr);
+    ret = cpu_ldsb_data(env, ptr);
+    clear_helper_retaddr();
+    return ret;
+}
+
+uint32_t cpu_lduw_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
+{
+    uint32_t ret;
+
+    set_helper_retaddr(retaddr);
+    ret = cpu_lduw_data(env, ptr);
+    clear_helper_retaddr();
+    return ret;
+}
+
+int cpu_ldsw_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
+{
+    int ret;
+
+    set_helper_retaddr(retaddr);
+    ret = cpu_ldsw_data(env, ptr);
+    clear_helper_retaddr();
+    return ret;
+}
+
+uint32_t cpu_ldl_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
+{
+    uint32_t ret;
+
+    set_helper_retaddr(retaddr);
+    ret = cpu_ldl_data(env, ptr);
+    clear_helper_retaddr();
+    return ret;
+}
+
+uint64_t cpu_ldq_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
+{
+    uint64_t ret;
+
+    set_helper_retaddr(retaddr);
+    ret = cpu_ldq_data(env, ptr);
+    clear_helper_retaddr();
+    return ret;
+}
+
+void cpu_stb_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
+{
+    uint16_t meminfo = trace_mem_get_info(MO_UB, MMU_USER_IDX, true);
+
+    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    stb_p(g2h(ptr), val);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+}
+
+void cpu_stw_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
+{
+    uint16_t meminfo = trace_mem_get_info(MO_TEUW, MMU_USER_IDX, true);
+
+    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    stw_p(g2h(ptr), val);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+}
+
+void cpu_stl_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
+{
+    uint16_t meminfo = trace_mem_get_info(MO_TEUL, MMU_USER_IDX, true);
+
+    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    stl_p(g2h(ptr), val);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+}
+
+void cpu_stq_data(CPUArchState *env, abi_ptr ptr, uint64_t val)
+{
+    uint16_t meminfo = trace_mem_get_info(MO_TEQ, MMU_USER_IDX, true);
+
+    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    stq_p(g2h(ptr), val);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+}
+
+void cpu_stb_data_ra(CPUArchState *env, abi_ptr ptr,
+                     uint32_t val, uintptr_t retaddr)
+{
+    set_helper_retaddr(retaddr);
+    cpu_stb_data(env, ptr, val);
+    clear_helper_retaddr();
+}
+
+void cpu_stw_data_ra(CPUArchState *env, abi_ptr ptr,
+                     uint32_t val, uintptr_t retaddr)
+{
+    set_helper_retaddr(retaddr);
+    cpu_stw_data(env, ptr, val);
+    clear_helper_retaddr();
+}
+
+void cpu_stl_data_ra(CPUArchState *env, abi_ptr ptr,
+                     uint32_t val, uintptr_t retaddr)
+{
+    set_helper_retaddr(retaddr);
+    cpu_stl_data(env, ptr, val);
+    clear_helper_retaddr();
+}
+
+void cpu_stq_data_ra(CPUArchState *env, abi_ptr ptr,
+                     uint64_t val, uintptr_t retaddr)
+{
+    set_helper_retaddr(retaddr);
+    cpu_stq_data(env, ptr, val);
+    clear_helper_retaddr();
+}
+
+uint32_t cpu_ldub_code(CPUArchState *env, abi_ptr ptr)
+{
+    uint32_t ret;
+
+    set_helper_retaddr(1);
+    ret = ldub_p(g2h(ptr));
+    clear_helper_retaddr();
+    return ret;
+}
+
+uint32_t cpu_lduw_code(CPUArchState *env, abi_ptr ptr)
+{
+    uint32_t ret;
+
+    set_helper_retaddr(1);
+    ret = lduw_p(g2h(ptr));
+    clear_helper_retaddr();
+    return ret;
+}
+
+uint32_t cpu_ldl_code(CPUArchState *env, abi_ptr ptr)
+{
+    uint32_t ret;
+
+    set_helper_retaddr(1);
+    ret = ldl_p(g2h(ptr));
+    clear_helper_retaddr();
+    return ret;
+}
+
+uint64_t cpu_ldq_code(CPUArchState *env, abi_ptr ptr)
+{
+    uint64_t ret;
+
+    set_helper_retaddr(1);
+    ret = ldq_p(g2h(ptr));
+    clear_helper_retaddr();
+    return ret;
+}
+
 /* Do not allow unaligned operations to proceed.  Return the host address.  */
 static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
                                int size, uintptr_t retaddr)
-- 
2.20.1


