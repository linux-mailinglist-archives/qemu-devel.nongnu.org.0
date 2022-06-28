Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 070E255BEB9
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 08:25:53 +0200 (CEST)
Received: from localhost ([::1]:50160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o64fW-000279-Gv
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 02:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Fm-0003Jy-JN
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:10 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:41699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Fj-0008Mm-VX
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:09 -0400
Received: by mail-pg1-x530.google.com with SMTP id 23so11059700pgc.8
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yLewmFCQYfYKQ8zF22ZeW0whi874jiIombKuJNnln/U=;
 b=dllIxhJqlHD9P6Hlp7OHxtF3aLxNW+05S00uU3IKw1tZ5tMBupdeSA5DeVTJZZxWW0
 XHXDIhDSrTARzKro6OIUUzcrAQ5i8/N/oHXIxTf81NVjHbgJZCVDDV9ZekfgpAecHDTq
 hcpbTGlKK5j7YS8SI5XPNMzNVvE6X0gzzjCxLStV2itSUaohBE5f/a+ExTbN28cO+gpC
 e8mjfHTa5to+Ke5eLbBRJpAoCk2lyocM0yrps8bP3JaeV7FhYdu8ejsgTWOd1DMxGE8c
 WNpcPAV2Fd/SAXFZOOneNyfBu3FQOslW0dqhoRk65YdIyum2iWVEDS1QjtJ5JLv4ajxl
 lBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yLewmFCQYfYKQ8zF22ZeW0whi874jiIombKuJNnln/U=;
 b=VKEuad/F0nU+Mlqnl4RPwVUIZT1E70Gv4ujfhhOZSP4FWofWTbUeFYjpBWs1c0YBnY
 tZwEB+EeO6rllCNbYL+DkgSyiPdU+FnghVb40l6UbF+i2wSnvKL09leFsEwYpQ4pdrLx
 SUO3ZMmXHfJA5G/Vmn3nRafyaqBQ9wMKnkAPZ+C1YautNsbc2TpJfV0eCV2s3gGp/P49
 F1u94IKrVflapzN3co6KvcsVpfljzy8J3MDb1Xh9TkWEwzalyAKoI4uHpy0D5pGeuAjq
 p0kW2cvFinijrrXyHBTYQGmY7eozACE7wwts32Cd2OWFRt4xkLt4LUH5F2gVLusI5qSU
 MDZw==
X-Gm-Message-State: AJIora/GPuu8heQ2GjtoouSzKYAZtF0MSXYTWLpgwcTkby+N8K3AzFgi
 UlO/cfEfxB/YJRVQzixXhqWRTOqsZfIB/g==
X-Google-Smtp-Source: AGRyM1uKAs4+ovSzrOuXuIZ94u95hvxb8zXEUl1HXx7ilIStBlZI2InfQrSqNWAohtbksed511RPHA==
X-Received: by 2002:a63:9c01:0:b0:40c:e842:ff5e with SMTP id
 f1-20020a639c01000000b0040ce842ff5emr15832681pge.145.1656392106335; 
 Mon, 27 Jun 2022 21:55:06 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:55:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Luc Michel <lmichel@kalray.eu>
Subject: [PULL 24/60] semihosting: Split out common-semi-target.h
Date: Tue, 28 Jun 2022 10:23:27 +0530
Message-Id: <20220628045403.508716-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

Move the ARM and RISCV specific helpers into
their own header file.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luc Michel <lmichel@kalray.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/common-semi-target.h   | 62 ++++++++++++++++++++
 target/riscv/common-semi-target.h | 50 ++++++++++++++++
 semihosting/arm-compat-semi.c     | 94 +------------------------------
 3 files changed, 113 insertions(+), 93 deletions(-)
 create mode 100644 target/arm/common-semi-target.h
 create mode 100644 target/riscv/common-semi-target.h

diff --git a/target/arm/common-semi-target.h b/target/arm/common-semi-target.h
new file mode 100644
index 0000000000..629d75ca5a
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
+    /* Ok for A64, invalid for A32/T32 */
+    return is_a64(env);
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
index 50f40a2a1a..5e442e549d 100644
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
-    /* Ok for A64, invalid for A32/T32. */
-    return is_a64(env);
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
-- 
2.34.1


