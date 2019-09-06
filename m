Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A55AB85F
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 14:50:52 +0200 (CEST)
Received: from localhost ([::1]:55820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i6DhT-00010n-7Y
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 08:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54746)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i6De0-0007M2-H6
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 08:47:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i6Ddy-0005ys-Ge
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 08:47:16 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:35739)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i6Ddw-0005sD-Bz
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 08:47:12 -0400
Received: by mail-wm1-x341.google.com with SMTP id n10so6972535wmj.0
 for <qemu-devel@nongnu.org>; Fri, 06 Sep 2019 05:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zlpCkLPxW/plsVCAFKM/m8fldNY7IYpuz4hZ7EfXmKg=;
 b=hE9vOr4ZBRXZClZD1JwA7TU8R3Rs5dn3wND0mtm49e5RKYlMScQh1MKld5pbzIoKVh
 TFjZooY/6BaClJuVYDQQDkIuD/cNvg+t6AntxL8iNj2g1eRcNzgmUsWnZSCI/Gl1Vgbb
 dHDEdMShjnwjRsC/Ras/7UAZH3xaIIaMXik32TwAd8deDQeu+oZ3mgtknojXfuIp/tLi
 wE0pNnMALikSL/YNL/b8M9rF41D3W99fVdYoWw3LYNAWkr0mrGgOQfDj+7j7yTyJR/N/
 3NAO6vexpzWhekCDDVXKr4GauQW5qrD9Huoj4ePKqbRSA/RZC0liY1Ffd8zec/0qaazI
 X8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zlpCkLPxW/plsVCAFKM/m8fldNY7IYpuz4hZ7EfXmKg=;
 b=h151mwRk0tkU1xc+sp8un9ANeOG3f0TMuIIC2Z3Wolw1wB9Zur7I9IhSaz/NHpIKcY
 dxaNWt/WKvfy3fGJjDhCiPvP2+enRwWRo2NvxuxWDHXSCzwR1hK5c57KQbfR8AKWHdkH
 H7byOoLqWxQ+6w7YDQ1ePgO5/sB+/9wTJs1CrbFBpU2tsBQejyt2PCoGjOfwqnpZPNmq
 PuG+5vj/QE/cOwO4yCDXhyBy3r2WVv1qB0l94WS0NyA/IHXucSZODKXi2dh2+NKdBtZ1
 pVeZvWJxL5GI2UA5Xt5mT8gThNFGDnpJg2ScVmjCvFPwG/exl0eL8rTcteb+tPyooOdS
 TLvA==
X-Gm-Message-State: APjAAAXr2XhE1tpryc540fxnugVehB31wLRVA/8bz5R4mCz0H12REn88
 9O2fDIuQd/P1dmh2l1OaHqJU4g==
X-Google-Smtp-Source: APXvYqyYojoSx460XgzjoV9S6CeyRfzVcV/qKfx0blL4Y50vdyAqI9MqdbNlSlBWWlpfOEQu7npuOQ==
X-Received: by 2002:a1c:c78f:: with SMTP id x137mr7740433wmf.42.1567774030709; 
 Fri, 06 Sep 2019 05:47:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s12sm7334448wra.82.2019.09.06.05.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2019 05:47:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EEC9A1FF90;
 Fri,  6 Sep 2019 13:47:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Fri,  6 Sep 2019 13:47:05 +0100
Message-Id: <20190906124706.19145-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190906124706.19145-1-alex.bennee@linaro.org>
References: <20190906124706.19145-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PATCH v3 3/4] target/arm: remove run time semihosting
 checks
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now we do all our checking and use a common EXCP_SEMIHOST for
semihosting operations we can make helper code a lot simpler.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v2
  - fix re-base conflicts
  - hoist EXCP_SEMIHOST check
  - comment cleanups
v5
  - move CONFIG_TCG ifdefs
---
 target/arm/helper.c | 96 +++++++++++----------------------------------
 1 file changed, 22 insertions(+), 74 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 507026c9154..a87ae6d46a1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8339,88 +8339,32 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
                   new_el, env->pc, pstate_read(env));
 }
 
-static inline bool check_for_semihosting(CPUState *cs)
-{
+/*
+ * Do semihosting call and set the appropriate return value. All the
+ * permission and validity checks have been done at translate time.
+ *
+ * We only see semihosting exceptions in TCG only as they are not
+ * trapped to the hypervisor in KVM.
+ */
 #ifdef CONFIG_TCG
-    /* Check whether this exception is a semihosting call; if so
-     * then handle it and return true; otherwise return false.
-     */
+static void handle_semihosting(CPUState *cs)
+{
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
 
     if (is_a64(env)) {
-        if (cs->exception_index == EXCP_SEMIHOST) {
-            /* This is always the 64-bit semihosting exception.
-             * The "is this usermode" and "is semihosting enabled"
-             * checks have been done at translate time.
-             */
-            qemu_log_mask(CPU_LOG_INT,
-                          "...handling as semihosting call 0x%" PRIx64 "\n",
-                          env->xregs[0]);
-            env->xregs[0] = do_arm_semihosting(env);
-            return true;
-        }
-        return false;
+        qemu_log_mask(CPU_LOG_INT,
+                      "...handling as semihosting call 0x%" PRIx64 "\n",
+                      env->xregs[0]);
+        env->xregs[0] = do_arm_semihosting(env);
     } else {
-        uint32_t imm;
-
-        /* Only intercept calls from privileged modes, to provide some
-         * semblance of security.
-         */
-        if (cs->exception_index != EXCP_SEMIHOST &&
-            (!semihosting_enabled() ||
-             ((env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_USR))) {
-            return false;
-        }
-
-        switch (cs->exception_index) {
-        case EXCP_SEMIHOST:
-            /* This is always a semihosting call; the "is this usermode"
-             * and "is semihosting enabled" checks have been done at
-             * translate time.
-             */
-            break;
-        case EXCP_SWI:
-            /* Check for semihosting interrupt.  */
-            if (env->thumb) {
-                imm = arm_lduw_code(env, env->regs[15] - 2, arm_sctlr_b(env))
-                    & 0xff;
-                if (imm == 0xab) {
-                    break;
-                }
-            } else {
-                imm = arm_ldl_code(env, env->regs[15] - 4, arm_sctlr_b(env))
-                    & 0xffffff;
-                if (imm == 0x123456) {
-                    break;
-                }
-            }
-            return false;
-        case EXCP_BKPT:
-            /* See if this is a semihosting syscall.  */
-            if (env->thumb) {
-                imm = arm_lduw_code(env, env->regs[15], arm_sctlr_b(env))
-                    & 0xff;
-                if (imm == 0xab) {
-                    env->regs[15] += 2;
-                    break;
-                }
-            }
-            return false;
-        default:
-            return false;
-        }
-
         qemu_log_mask(CPU_LOG_INT,
                       "...handling as semihosting call 0x%x\n",
                       env->regs[0]);
         env->regs[0] = do_arm_semihosting(env);
-        return true;
     }
-#else
-    return false;
-#endif
 }
+#endif
 
 /* Handle a CPU exception for A and R profile CPUs.
  * Do any appropriate logging, handle PSCI calls, and then hand off
@@ -8451,13 +8395,17 @@ void arm_cpu_do_interrupt(CPUState *cs)
         return;
     }
 
-    /* Semihosting semantics depend on the register width of the
-     * code that caused the exception, not the target exception level,
-     * so must be handled here.
+    /*
+     * Semihosting semantics depend on the register width of the code
+     * that caused the exception, not the target exception level, so
+     * must be handled here.
      */
-    if (check_for_semihosting(cs)) {
+#ifdef CONFIG_TCG
+    if (cs->exception_index == EXCP_SEMIHOST) {
+        handle_semihosting(cs);
         return;
     }
+#endif
 
     /* Hooks may change global state so BQL should be held, also the
      * BQL needs to be held for any modification of
-- 
2.20.1


