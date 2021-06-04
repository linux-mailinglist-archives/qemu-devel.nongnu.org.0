Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF0839BE2F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:11:33 +0200 (CEST)
Received: from localhost ([::1]:46502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDM4-0003aD-RW
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCkb-0008AE-BH
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:32:49 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCkX-00027b-7g
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:32:48 -0400
Received: by mail-wr1-x431.google.com with SMTP id l2so9930301wrw.6
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sclbEbvsQp39DT+lWM9cgWgO57dq75LgW1XTapf4q3Q=;
 b=XWV4BxMGDDYyrNfsy2t0fB53nHMyJiexRzNeodEeSMtYK65mTPv6dp9f7xfrPfTxUr
 oEsHLHIsVqosHsKFK45wTioim0tiphz35AivQHYwZNwCtxuta9V1LZ1pcpls4U0q9tNz
 9X8xQJ+3TaPIutIYw6ewAWOLTukmep38nCYq5GC/gfWb4hyUbAEfZw5ugr6s/Pddxytt
 +Hb3Ur/Z6tvath79yyW/xtQQWXCCc5/Q8YrnMMqT9javWFrYBDRu9N4FUuyAJZr4Zo3w
 UHQZUgw2P1T39DKrBFpJ5+lBhRBdEbjhXUwewgLbuCqI1sSJiuzPv9JEqTFCHifP9cIZ
 lwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sclbEbvsQp39DT+lWM9cgWgO57dq75LgW1XTapf4q3Q=;
 b=GKEkvxZB2L1PcDj6z45q2E1bCmoREfGyVBZfeW3iRpLQCap1kSBC68j6y1cZdvoha6
 thQEQmKESVq4xVgxNJnB7WDiAuLNWsg0sPFE2asuWAY7pV5U9gczpKDpIsOEZQIB9Z+V
 DKU3I6w+kNLqLzjTKV5pU3eZrkKJoLYeoGqihL+Uqz3jjeYc53aUlUfqBkEO92vQbOVd
 a0kq/kKjPXkJCdclXBa7CY4JsmK9mkkcQyra97e4RZX4VuPm5mtDE8aoTnBmWITu1lGA
 jFvfipIFQggoszoh9/owoctc3bhwIkJq+uCB+zi71N0Ot5LaYOE9Njaf9BrHVEVbuo3v
 pAlw==
X-Gm-Message-State: AOAM532rNtLwOrQ1oANPu8A4ABfxMZtyXzUW+bJwp16BKPzdXBhhRIr0
 MZ2/NvlDlKyLGUgVcXoZoTvtGQ==
X-Google-Smtp-Source: ABdhPJwNPvC/dnaM71qA22G3vFe6WdJuEWSptiOmig9X8J34jNsX5oemiZjJTwQwHfDUUNGnxQ6oxw==
X-Received: by 2002:adf:bc07:: with SMTP id s7mr4848885wrg.301.1622824363286; 
 Fri, 04 Jun 2021 09:32:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t1sm7060818wrx.28.2021.06.04.09.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:32:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DFC9D1FFBF;
 Fri,  4 Jun 2021 16:53:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 40/99] target/arm: move aarch64_sync_32_to_64 (and vv) to
 cpu code
Date: Fri,  4 Jun 2021 16:52:13 +0100
Message-Id: <20210604155312.15902-41-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

and arm_phys_excp_target_el since it is tied up inside the
same #ifdef block.

aarch64_sync_32_to_64 and aarch64_sync_64_to_32 are
mixed in with the TCG helpers, but they shouldn't, as they
are needed for KVM too.

kvm_arch_get_registers()
{
    if (!is_a64(env)) {
        aarch64_sync_64_to_32(env);
    }
    write_kvmstate_to_list(cpu);
    write_list_to_cpustate(cpu);
    ...
}

kvm_arch_put_registers()
{
    if (!is_a64(env)) {
        aarch64_sync_32_to_64(env);
    }
    write_cpustate_to_list(cpu, true);
    write_list_to_kvmstate(cpu, level)
    ...
}

Move to the cpu module.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-sysemu.c | 215 +++++++++++++++++++++++++++++++++++++
 target/arm/cpu-user.c   |  11 ++
 target/arm/tcg/helper.c | 232 +---------------------------------------
 3 files changed, 229 insertions(+), 229 deletions(-)

diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
index 3add2c2439..7a314bf805 100644
--- a/target/arm/cpu-sysemu.c
+++ b/target/arm/cpu-sysemu.c
@@ -133,3 +133,218 @@ void switch_mode(CPUARMState *env, int mode)
     env->banked_r14[r14_bank_number(old_mode)] = env->regs[14];
     env->regs[14] = env->banked_r14[r14_bank_number(mode)];
 }
+
+/*
+ * Function used to synchronize QEMU's AArch64 register set with AArch32
+ * register set.  This is necessary when switching between AArch32 and AArch64
+ * execution state.
+ */
+void aarch64_sync_32_to_64(CPUARMState *env)
+{
+    int i;
+    uint32_t mode = env->uncached_cpsr & CPSR_M;
+
+    /* We can blanket copy R[0:7] to X[0:7] */
+    for (i = 0; i < 8; i++) {
+        env->xregs[i] = env->regs[i];
+    }
+
+    /*
+     * Unless we are in FIQ mode, x8-x12 come from the user registers r8-r12.
+     * Otherwise, they come from the banked user regs.
+     */
+    if (mode == ARM_CPU_MODE_FIQ) {
+        for (i = 8; i < 13; i++) {
+            env->xregs[i] = env->usr_regs[i - 8];
+        }
+    } else {
+        for (i = 8; i < 13; i++) {
+            env->xregs[i] = env->regs[i];
+        }
+    }
+
+    /*
+     * Registers x13-x23 are the various mode SP and FP registers. Registers
+     * r13 and r14 are only copied if we are in that mode, otherwise we copy
+     * from the mode banked register.
+     */
+    if (mode == ARM_CPU_MODE_USR || mode == ARM_CPU_MODE_SYS) {
+        env->xregs[13] = env->regs[13];
+        env->xregs[14] = env->regs[14];
+    } else {
+        env->xregs[13] = env->banked_r13[bank_number(ARM_CPU_MODE_USR)];
+        /* HYP is an exception in that it is copied from r14 */
+        if (mode == ARM_CPU_MODE_HYP) {
+            env->xregs[14] = env->regs[14];
+        } else {
+            env->xregs[14] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_USR)];
+        }
+    }
+
+    if (mode == ARM_CPU_MODE_HYP) {
+        env->xregs[15] = env->regs[13];
+    } else {
+        env->xregs[15] = env->banked_r13[bank_number(ARM_CPU_MODE_HYP)];
+    }
+
+    if (mode == ARM_CPU_MODE_IRQ) {
+        env->xregs[16] = env->regs[14];
+        env->xregs[17] = env->regs[13];
+    } else {
+        env->xregs[16] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_IRQ)];
+        env->xregs[17] = env->banked_r13[bank_number(ARM_CPU_MODE_IRQ)];
+    }
+
+    if (mode == ARM_CPU_MODE_SVC) {
+        env->xregs[18] = env->regs[14];
+        env->xregs[19] = env->regs[13];
+    } else {
+        env->xregs[18] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_SVC)];
+        env->xregs[19] = env->banked_r13[bank_number(ARM_CPU_MODE_SVC)];
+    }
+
+    if (mode == ARM_CPU_MODE_ABT) {
+        env->xregs[20] = env->regs[14];
+        env->xregs[21] = env->regs[13];
+    } else {
+        env->xregs[20] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_ABT)];
+        env->xregs[21] = env->banked_r13[bank_number(ARM_CPU_MODE_ABT)];
+    }
+
+    if (mode == ARM_CPU_MODE_UND) {
+        env->xregs[22] = env->regs[14];
+        env->xregs[23] = env->regs[13];
+    } else {
+        env->xregs[22] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_UND)];
+        env->xregs[23] = env->banked_r13[bank_number(ARM_CPU_MODE_UND)];
+    }
+
+    /*
+     * Registers x24-x30 are mapped to r8-r14 in FIQ mode.  If we are in FIQ
+     * mode, then we can copy from r8-r14.  Otherwise, we copy from the
+     * FIQ bank for r8-r14.
+     */
+    if (mode == ARM_CPU_MODE_FIQ) {
+        for (i = 24; i < 31; i++) {
+            env->xregs[i] = env->regs[i - 16];   /* X[24:30] <- R[8:14] */
+        }
+    } else {
+        for (i = 24; i < 29; i++) {
+            env->xregs[i] = env->fiq_regs[i - 24];
+        }
+        env->xregs[29] = env->banked_r13[bank_number(ARM_CPU_MODE_FIQ)];
+        env->xregs[30] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_FIQ)];
+    }
+
+    env->pc = env->regs[15];
+}
+
+/*
+ * Function used to synchronize QEMU's AArch32 register set with AArch64
+ * register set.  This is necessary when switching between AArch32 and AArch64
+ * execution state.
+ */
+void aarch64_sync_64_to_32(CPUARMState *env)
+{
+    int i;
+    uint32_t mode = env->uncached_cpsr & CPSR_M;
+
+    /* We can blanket copy X[0:7] to R[0:7] */
+    for (i = 0; i < 8; i++) {
+        env->regs[i] = env->xregs[i];
+    }
+
+    /*
+     * Unless we are in FIQ mode, r8-r12 come from the user registers x8-x12.
+     * Otherwise, we copy x8-x12 into the banked user regs.
+     */
+    if (mode == ARM_CPU_MODE_FIQ) {
+        for (i = 8; i < 13; i++) {
+            env->usr_regs[i - 8] = env->xregs[i];
+        }
+    } else {
+        for (i = 8; i < 13; i++) {
+            env->regs[i] = env->xregs[i];
+        }
+    }
+
+    /*
+     * Registers r13 & r14 depend on the current mode.
+     * If we are in a given mode, we copy the corresponding x registers to r13
+     * and r14.  Otherwise, we copy the x register to the banked r13 and r14
+     * for the mode.
+     */
+    if (mode == ARM_CPU_MODE_USR || mode == ARM_CPU_MODE_SYS) {
+        env->regs[13] = env->xregs[13];
+        env->regs[14] = env->xregs[14];
+    } else {
+        env->banked_r13[bank_number(ARM_CPU_MODE_USR)] = env->xregs[13];
+
+        /*
+         * HYP is an exception in that it does not have its own banked r14 but
+         * shares the USR r14
+         */
+        if (mode == ARM_CPU_MODE_HYP) {
+            env->regs[14] = env->xregs[14];
+        } else {
+            env->banked_r14[r14_bank_number(ARM_CPU_MODE_USR)] = env->xregs[14];
+        }
+    }
+
+    if (mode == ARM_CPU_MODE_HYP) {
+        env->regs[13] = env->xregs[15];
+    } else {
+        env->banked_r13[bank_number(ARM_CPU_MODE_HYP)] = env->xregs[15];
+    }
+
+    if (mode == ARM_CPU_MODE_IRQ) {
+        env->regs[14] = env->xregs[16];
+        env->regs[13] = env->xregs[17];
+    } else {
+        env->banked_r14[r14_bank_number(ARM_CPU_MODE_IRQ)] = env->xregs[16];
+        env->banked_r13[bank_number(ARM_CPU_MODE_IRQ)] = env->xregs[17];
+    }
+
+    if (mode == ARM_CPU_MODE_SVC) {
+        env->regs[14] = env->xregs[18];
+        env->regs[13] = env->xregs[19];
+    } else {
+        env->banked_r14[r14_bank_number(ARM_CPU_MODE_SVC)] = env->xregs[18];
+        env->banked_r13[bank_number(ARM_CPU_MODE_SVC)] = env->xregs[19];
+    }
+
+    if (mode == ARM_CPU_MODE_ABT) {
+        env->regs[14] = env->xregs[20];
+        env->regs[13] = env->xregs[21];
+    } else {
+        env->banked_r14[r14_bank_number(ARM_CPU_MODE_ABT)] = env->xregs[20];
+        env->banked_r13[bank_number(ARM_CPU_MODE_ABT)] = env->xregs[21];
+    }
+
+    if (mode == ARM_CPU_MODE_UND) {
+        env->regs[14] = env->xregs[22];
+        env->regs[13] = env->xregs[23];
+    } else {
+        env->banked_r14[r14_bank_number(ARM_CPU_MODE_UND)] = env->xregs[22];
+        env->banked_r13[bank_number(ARM_CPU_MODE_UND)] = env->xregs[23];
+    }
+
+    /*
+     * Registers x24-x30 are mapped to r8-r14 in FIQ mode.  If we are in FIQ
+     * mode, then we can copy to r8-r14.  Otherwise, we copy to the
+     * FIQ bank for r8-r14.
+     */
+    if (mode == ARM_CPU_MODE_FIQ) {
+        for (i = 24; i < 31; i++) {
+            env->regs[i - 16] = env->xregs[i];   /* X[24:30] -> R[8:14] */
+        }
+    } else {
+        for (i = 24; i < 29; i++) {
+            env->fiq_regs[i - 24] = env->xregs[i];
+        }
+        env->banked_r13[bank_number(ARM_CPU_MODE_FIQ)] = env->xregs[29];
+        env->banked_r14[r14_bank_number(ARM_CPU_MODE_FIQ)] = env->xregs[30];
+    }
+
+    env->regs[15] = env->pc;
+}
diff --git a/target/arm/cpu-user.c b/target/arm/cpu-user.c
index a72b7f5703..0225089e46 100644
--- a/target/arm/cpu-user.c
+++ b/target/arm/cpu-user.c
@@ -22,3 +22,14 @@ void switch_mode(CPUARMState *env, int mode)
         cpu_abort(CPU(cpu), "Tried to switch out of user mode\n");
     }
 }
+
+void aarch64_sync_64_to_32(CPUARMState *env)
+{
+    g_assert_not_reached();
+}
+
+uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
+                                 uint32_t cur_el, bool secure)
+{
+    return 1;
+}
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index 0e3f403e56..9dd83911f2 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -590,22 +590,10 @@ uint32_t HELPER(rbit)(uint32_t x)
     return revbit32(x);
 }
 
-#ifdef CONFIG_USER_ONLY
-
-uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
-                                 uint32_t cur_el, bool secure)
-{
-    return 1;
-}
-
-void aarch64_sync_64_to_32(CPUARMState *env)
-{
-    g_assert_not_reached();
-}
-
-#else
+#ifndef CONFIG_USER_ONLY
 
-/* Physical Interrupt Target EL Lookup Table
+/*
+ * Physical Interrupt Target EL Lookup Table
  *
  * [ From ARM ARM section G1.13.4 (Table G1-15) ]
  *
@@ -754,220 +742,6 @@ void arm_log_exception(int idx)
     }
 }
 
-/*
- * Function used to synchronize QEMU's AArch64 register set with AArch32
- * register set.  This is necessary when switching between AArch32 and AArch64
- * execution state.
- */
-void aarch64_sync_32_to_64(CPUARMState *env)
-{
-    int i;
-    uint32_t mode = env->uncached_cpsr & CPSR_M;
-
-    /* We can blanket copy R[0:7] to X[0:7] */
-    for (i = 0; i < 8; i++) {
-        env->xregs[i] = env->regs[i];
-    }
-
-    /*
-     * Unless we are in FIQ mode, x8-x12 come from the user registers r8-r12.
-     * Otherwise, they come from the banked user regs.
-     */
-    if (mode == ARM_CPU_MODE_FIQ) {
-        for (i = 8; i < 13; i++) {
-            env->xregs[i] = env->usr_regs[i - 8];
-        }
-    } else {
-        for (i = 8; i < 13; i++) {
-            env->xregs[i] = env->regs[i];
-        }
-    }
-
-    /*
-     * Registers x13-x23 are the various mode SP and FP registers. Registers
-     * r13 and r14 are only copied if we are in that mode, otherwise we copy
-     * from the mode banked register.
-     */
-    if (mode == ARM_CPU_MODE_USR || mode == ARM_CPU_MODE_SYS) {
-        env->xregs[13] = env->regs[13];
-        env->xregs[14] = env->regs[14];
-    } else {
-        env->xregs[13] = env->banked_r13[bank_number(ARM_CPU_MODE_USR)];
-        /* HYP is an exception in that it is copied from r14 */
-        if (mode == ARM_CPU_MODE_HYP) {
-            env->xregs[14] = env->regs[14];
-        } else {
-            env->xregs[14] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_USR)];
-        }
-    }
-
-    if (mode == ARM_CPU_MODE_HYP) {
-        env->xregs[15] = env->regs[13];
-    } else {
-        env->xregs[15] = env->banked_r13[bank_number(ARM_CPU_MODE_HYP)];
-    }
-
-    if (mode == ARM_CPU_MODE_IRQ) {
-        env->xregs[16] = env->regs[14];
-        env->xregs[17] = env->regs[13];
-    } else {
-        env->xregs[16] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_IRQ)];
-        env->xregs[17] = env->banked_r13[bank_number(ARM_CPU_MODE_IRQ)];
-    }
-
-    if (mode == ARM_CPU_MODE_SVC) {
-        env->xregs[18] = env->regs[14];
-        env->xregs[19] = env->regs[13];
-    } else {
-        env->xregs[18] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_SVC)];
-        env->xregs[19] = env->banked_r13[bank_number(ARM_CPU_MODE_SVC)];
-    }
-
-    if (mode == ARM_CPU_MODE_ABT) {
-        env->xregs[20] = env->regs[14];
-        env->xregs[21] = env->regs[13];
-    } else {
-        env->xregs[20] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_ABT)];
-        env->xregs[21] = env->banked_r13[bank_number(ARM_CPU_MODE_ABT)];
-    }
-
-    if (mode == ARM_CPU_MODE_UND) {
-        env->xregs[22] = env->regs[14];
-        env->xregs[23] = env->regs[13];
-    } else {
-        env->xregs[22] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_UND)];
-        env->xregs[23] = env->banked_r13[bank_number(ARM_CPU_MODE_UND)];
-    }
-
-    /*
-     * Registers x24-x30 are mapped to r8-r14 in FIQ mode.  If we are in FIQ
-     * mode, then we can copy from r8-r14.  Otherwise, we copy from the
-     * FIQ bank for r8-r14.
-     */
-    if (mode == ARM_CPU_MODE_FIQ) {
-        for (i = 24; i < 31; i++) {
-            env->xregs[i] = env->regs[i - 16];   /* X[24:30] <- R[8:14] */
-        }
-    } else {
-        for (i = 24; i < 29; i++) {
-            env->xregs[i] = env->fiq_regs[i - 24];
-        }
-        env->xregs[29] = env->banked_r13[bank_number(ARM_CPU_MODE_FIQ)];
-        env->xregs[30] = env->banked_r14[r14_bank_number(ARM_CPU_MODE_FIQ)];
-    }
-
-    env->pc = env->regs[15];
-}
-
-/*
- * Function used to synchronize QEMU's AArch32 register set with AArch64
- * register set.  This is necessary when switching between AArch32 and AArch64
- * execution state.
- */
-void aarch64_sync_64_to_32(CPUARMState *env)
-{
-    int i;
-    uint32_t mode = env->uncached_cpsr & CPSR_M;
-
-    /* We can blanket copy X[0:7] to R[0:7] */
-    for (i = 0; i < 8; i++) {
-        env->regs[i] = env->xregs[i];
-    }
-
-    /*
-     * Unless we are in FIQ mode, r8-r12 come from the user registers x8-x12.
-     * Otherwise, we copy x8-x12 into the banked user regs.
-     */
-    if (mode == ARM_CPU_MODE_FIQ) {
-        for (i = 8; i < 13; i++) {
-            env->usr_regs[i - 8] = env->xregs[i];
-        }
-    } else {
-        for (i = 8; i < 13; i++) {
-            env->regs[i] = env->xregs[i];
-        }
-    }
-
-    /*
-     * Registers r13 & r14 depend on the current mode.
-     * If we are in a given mode, we copy the corresponding x registers to r13
-     * and r14.  Otherwise, we copy the x register to the banked r13 and r14
-     * for the mode.
-     */
-    if (mode == ARM_CPU_MODE_USR || mode == ARM_CPU_MODE_SYS) {
-        env->regs[13] = env->xregs[13];
-        env->regs[14] = env->xregs[14];
-    } else {
-        env->banked_r13[bank_number(ARM_CPU_MODE_USR)] = env->xregs[13];
-
-        /*
-         * HYP is an exception in that it does not have its own banked r14 but
-         * shares the USR r14
-         */
-        if (mode == ARM_CPU_MODE_HYP) {
-            env->regs[14] = env->xregs[14];
-        } else {
-            env->banked_r14[r14_bank_number(ARM_CPU_MODE_USR)] = env->xregs[14];
-        }
-    }
-
-    if (mode == ARM_CPU_MODE_HYP) {
-        env->regs[13] = env->xregs[15];
-    } else {
-        env->banked_r13[bank_number(ARM_CPU_MODE_HYP)] = env->xregs[15];
-    }
-
-    if (mode == ARM_CPU_MODE_IRQ) {
-        env->regs[14] = env->xregs[16];
-        env->regs[13] = env->xregs[17];
-    } else {
-        env->banked_r14[r14_bank_number(ARM_CPU_MODE_IRQ)] = env->xregs[16];
-        env->banked_r13[bank_number(ARM_CPU_MODE_IRQ)] = env->xregs[17];
-    }
-
-    if (mode == ARM_CPU_MODE_SVC) {
-        env->regs[14] = env->xregs[18];
-        env->regs[13] = env->xregs[19];
-    } else {
-        env->banked_r14[r14_bank_number(ARM_CPU_MODE_SVC)] = env->xregs[18];
-        env->banked_r13[bank_number(ARM_CPU_MODE_SVC)] = env->xregs[19];
-    }
-
-    if (mode == ARM_CPU_MODE_ABT) {
-        env->regs[14] = env->xregs[20];
-        env->regs[13] = env->xregs[21];
-    } else {
-        env->banked_r14[r14_bank_number(ARM_CPU_MODE_ABT)] = env->xregs[20];
-        env->banked_r13[bank_number(ARM_CPU_MODE_ABT)] = env->xregs[21];
-    }
-
-    if (mode == ARM_CPU_MODE_UND) {
-        env->regs[14] = env->xregs[22];
-        env->regs[13] = env->xregs[23];
-    } else {
-        env->banked_r14[r14_bank_number(ARM_CPU_MODE_UND)] = env->xregs[22];
-        env->banked_r13[bank_number(ARM_CPU_MODE_UND)] = env->xregs[23];
-    }
-
-    /* Registers x24-x30 are mapped to r8-r14 in FIQ mode.  If we are in FIQ
-     * mode, then we can copy to r8-r14.  Otherwise, we copy to the
-     * FIQ bank for r8-r14.
-     */
-    if (mode == ARM_CPU_MODE_FIQ) {
-        for (i = 24; i < 31; i++) {
-            env->regs[i - 16] = env->xregs[i];   /* X[24:30] -> R[8:14] */
-        }
-    } else {
-        for (i = 24; i < 29; i++) {
-            env->fiq_regs[i - 24] = env->xregs[i];
-        }
-        env->banked_r13[bank_number(ARM_CPU_MODE_FIQ)] = env->xregs[29];
-        env->banked_r14[r14_bank_number(ARM_CPU_MODE_FIQ)] = env->xregs[30];
-    }
-
-    env->regs[15] = env->pc;
-}
-
 static void take_aarch32_exception(CPUARMState *env, int new_mode,
                                    uint32_t mask, uint32_t offset,
                                    uint32_t newpc)
-- 
2.20.1


