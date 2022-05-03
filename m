Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD7C518E8F
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:17:42 +0200 (CEST)
Received: from localhost ([::1]:47296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlyxp-0003U8-Q4
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWC-0001hK-81
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:08 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:37741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWA-0003a7-6S
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:07 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 t11-20020a17090ad50b00b001d95bf21996so3227295pju.2
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wXLSxy1WX79eMXmNdpTVz+8RqAC6B/BBjkCPMRdeubQ=;
 b=EbDksDGUqveYixSOgkkhKb/ClBKSD//cJlxStKWxIIxQamq5MocJObRKZNLrFgMUEC
 vjO9n8d54Ac3S06mrYq1EgquxWdGeJIhWg9hAnXJM1ArPRxJv14ASsmIBcws03oKdKMM
 aPg6SJ1k3PVi6/L1bEbjY1iBTQcZFO7L3JoIymswCW3XE1QVPHc90bqX7mS1b5oMSnrm
 kAopSHHzHIEsl6ugbpXx/bFR6Twh9DhNBI67Zc/tI1l3LerbZmn+2HAMUGu7Bw5Q6GoG
 H2Bms4Du4DnDtk9BYtfBa8L+jPlbR02LTk7Oz2hBOdkG19nqSmNWpyO+QCj/lon7vK6N
 MzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wXLSxy1WX79eMXmNdpTVz+8RqAC6B/BBjkCPMRdeubQ=;
 b=NP/as7MhfCQBx/Y6m7LCZGhaWnxzCsjOVLwU2ZW49s8Me7D+anW90fZlS3yXgiHmU5
 vvWqzNd7zCQNNlxThtaafg41/HiCIjdyHhHGxKEFYKnjPC4j7f/TjxXtx39BEPjgHxcf
 a99TwzP54UbYq5wg592BcnqwFHPqxLqBpcmYdhcGiiivYkN2OUoxbGmz5/Igwkg2BVZi
 xprV7yohvHY8cxgjLGxKHxTcprYsbbR/PTrQrzb8lpTCCPaSJS3pUc6CUaYVe5vp8TuS
 P0l0q5taXn/8HgzIWlKCLRM8AfL3hGObFlX8mpYIc6Zl/8RrZyQz/C67pNiF5naGpq/k
 jueQ==
X-Gm-Message-State: AOAM533xS7Zi/540MTpJ1UKP6qoAtKYu6sKsF0FKJnhOW5ohdZS77Oav
 odnNRiYV6rLinktzsqCASn0ELRdXk1VcQA==
X-Google-Smtp-Source: ABdhPJzdPNs/E0KrBXFmRlZTtwSa+pIj0ALmsIJJ0/NnaFV8YFgbPtknBrU3Y3WJONQK5Y9eh56YGQ==
X-Received: by 2002:a17:90a:de87:b0:1d9:8264:baef with SMTP id
 n7-20020a17090ade8700b001d98264baefmr6492685pjv.227.1651607344875; 
 Tue, 03 May 2022 12:49:04 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.49.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:49:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/74] semihosting: Use env more often in
 do_common_semihosting
Date: Tue,  3 May 2022 12:47:48 -0700
Message-Id: <20220503194843.1379101-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We've already loaded cs->env_ptr into a local variable; use it.
Since env is unconditionally used, we don't need a dummy use.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/common-semi-target.h   |  62 ++++++++++++++++++
 target/riscv/common-semi-target.h |  50 +++++++++++++++
 semihosting/arm-compat-semi.c     | 101 ++----------------------------
 3 files changed, 116 insertions(+), 97 deletions(-)
 create mode 100644 target/arm/common-semi-target.h
 create mode 100644 target/riscv/common-semi-target.h

diff --git a/target/arm/common-semi-target.h b/target/arm/common-semi-target.h
new file mode 100644
index 0000000000..c20e1cca76
--- /dev/null
+++ b/target/arm/common-semi-target.h
@@ -0,0 +1,62 @@
+/*
+ * Target-specific parts of semihosting/arm-compat-semi.c.
+ *
+ * Copyright (c) 2005, 2007 CodeSourcery.
+ * Copyright (c) 2019, 2022 Linaro
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef TARGET_ARM_COMMON_SEMI_TARGET_H
+#define TARGET_ARM_COMMON_SEMI_TARGET_H
+
+#ifndef CONFIG_USER_ONLY
+#include "hw/arm/boot.h"
+#endif
+
+static inline target_ulong common_semi_arg(CPUState *cs, int argno)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    if (is_a64(env)) {
+        return env->xregs[argno];
+    } else {
+        return env->regs[argno];
+    }
+}
+
+static inline void common_semi_set_ret(CPUState *cs, target_ulong ret)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    if (is_a64(env)) {
+        env->xregs[0] = ret;
+    } else {
+        env->regs[0] = ret;
+    }
+}
+
+static inline bool common_semi_sys_exit_extended(CPUState *cs, int nr)
+{
+    return (nr == TARGET_SYS_EXIT_EXTENDED || is_a64(cs->env_ptr));
+}
+
+static inline bool is_64bit_semihosting(CPUArchState *env)
+{
+    return is_a64(env);
+}
+
+static inline target_ulong common_semi_stack_bottom(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    return is_a64(env) ? env->xregs[31] : env->regs[13];
+}
+
+static inline bool common_semi_has_synccache(CPUArchState *env)
+{
+    /* Invalid for A32/T32 */
+    return !is_a64(env);
+}
+
+#endif
diff --git a/target/riscv/common-semi-target.h b/target/riscv/common-semi-target.h
new file mode 100644
index 0000000000..7c8a59e0cc
--- /dev/null
+++ b/target/riscv/common-semi-target.h
@@ -0,0 +1,50 @@
+/*
+ * Target-specific parts of semihosting/arm-compat-semi.c.
+ *
+ * Copyright (c) 2005, 2007 CodeSourcery.
+ * Copyright (c) 2019, 2022 Linaro
+ * Copyright © 2020 by Keith Packard <keithp@keithp.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef TARGET_RISCV_COMMON_SEMI_TARGET_H
+#define TARGET_RISCV_COMMON_SEMI_TARGET_H
+
+static inline target_ulong common_semi_arg(CPUState *cs, int argno)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    return env->gpr[xA0 + argno];
+}
+
+static inline void common_semi_set_ret(CPUState *cs, target_ulong ret)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    env->gpr[xA0] = ret;
+}
+
+static inline bool common_semi_sys_exit_extended(CPUState *cs, int nr)
+{
+    return (nr == TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) == 8);
+}
+
+static inline bool is_64bit_semihosting(CPUArchState *env)
+{
+    return riscv_cpu_mxl(env) != MXL_RV32;
+}
+
+static inline target_ulong common_semi_stack_bottom(CPUState *cs)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    return env->gpr[xSP];
+}
+
+static inline bool common_semi_has_synccache(CPUArchState *env)
+{
+    return true;
+}
+
+#endif
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 6149be404f..3a740482f9 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -46,9 +46,6 @@
 #else
 #include "qemu/cutils.h"
 #include "hw/loader.h"
-#ifdef TARGET_ARM
-#include "hw/arm/boot.h"
-#endif
 #include "hw/boards.h"
 #endif
 
@@ -182,96 +179,7 @@ static LayoutInfo common_semi_find_bases(CPUState *cs)
 
 #endif
 
-#ifdef TARGET_ARM
-static inline target_ulong
-common_semi_arg(CPUState *cs, int argno)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    if (is_a64(env)) {
-        return env->xregs[argno];
-    } else {
-        return env->regs[argno];
-    }
-}
-
-static inline void
-common_semi_set_ret(CPUState *cs, target_ulong ret)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    if (is_a64(env)) {
-        env->xregs[0] = ret;
-    } else {
-        env->regs[0] = ret;
-    }
-}
-
-static inline bool
-common_semi_sys_exit_extended(CPUState *cs, int nr)
-{
-    return (nr == TARGET_SYS_EXIT_EXTENDED || is_a64(cs->env_ptr));
-}
-
-static inline bool is_64bit_semihosting(CPUArchState *env)
-{
-    return is_a64(env);
-}
-
-static inline target_ulong common_semi_stack_bottom(CPUState *cs)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    return is_a64(env) ? env->xregs[31] : env->regs[13];
-}
-
-static inline bool common_semi_has_synccache(CPUArchState *env)
-{
-    /* Invalid for A32/T32. */
-    return !is_a64(env);
-}
-#endif /* TARGET_ARM */
-
-#ifdef TARGET_RISCV
-static inline target_ulong
-common_semi_arg(CPUState *cs, int argno)
-{
-    RISCVCPU *cpu = RISCV_CPU(cs);
-    CPURISCVState *env = &cpu->env;
-    return env->gpr[xA0 + argno];
-}
-
-static inline void
-common_semi_set_ret(CPUState *cs, target_ulong ret)
-{
-    RISCVCPU *cpu = RISCV_CPU(cs);
-    CPURISCVState *env = &cpu->env;
-    env->gpr[xA0] = ret;
-}
-
-static inline bool
-common_semi_sys_exit_extended(CPUState *cs, int nr)
-{
-    return (nr == TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) == 8);
-}
-
-static inline bool is_64bit_semihosting(CPUArchState *env)
-{
-    return riscv_cpu_mxl(env) != MXL_RV32;
-}
-
-static inline target_ulong common_semi_stack_bottom(CPUState *cs)
-{
-    RISCVCPU *cpu = RISCV_CPU(cs);
-    CPURISCVState *env = &cpu->env;
-    return env->gpr[xSP];
-}
-
-static inline bool common_semi_has_synccache(CPUArchState *env)
-{
-    return true;
-}
-#endif
+#include "common-semi-target.h"
 
 /*
  * The semihosting API has no concept of its errno being thread-safe,
@@ -646,7 +554,6 @@ void do_common_semihosting(CPUState *cs)
     GuestFD *gf;
     int64_t elapsed;
 
-    (void) env; /* Used implicitly by arm lock_user macro */
     nr = common_semi_arg(cs, 0) & 0xffffffffU;
     args = common_semi_arg(cs, 1);
 
@@ -729,12 +636,12 @@ void do_common_semihosting(CPUState *cs)
         break;
 
     case TARGET_SYS_WRITEC:
-        qemu_semihosting_console_outc(cs->env_ptr, args);
+        qemu_semihosting_console_outc(env, args);
         common_semi_set_ret(cs, 0xdeadbeef);
         break;
 
     case TARGET_SYS_WRITE0:
-        ret = qemu_semihosting_console_outs(cs->env_ptr, args);
+        ret = qemu_semihosting_console_outs(env, args);
         common_semi_set_ret(cs, ret);
         break;
 
@@ -765,7 +672,7 @@ void do_common_semihosting(CPUState *cs)
         break;
 
     case TARGET_SYS_READC:
-        ret = qemu_semihosting_console_inc(cs->env_ptr);
+        ret = qemu_semihosting_console_inc(env);
         common_semi_set_ret(cs, ret);
         break;
 
-- 
2.34.1


