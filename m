Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD15C546A5A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:27:23 +0200 (CEST)
Received: from localhost ([::1]:44940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhTm-0007kT-Nm
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhAu-0007QC-Vr
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:53 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:35483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhAp-0007F7-UI
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:49 -0400
Received: by mail-wr1-x42c.google.com with SMTP id a15so28618256wrh.2
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+MoErnjm74ckDgy5tbZNnxq6pI/QlmDb72blZJEpgZc=;
 b=owxmShK/qzhxJm8LCIBJ+uC8VPjoKDes8mKgCincgeiYua23u8bdd/aasFPTsFDXHC
 BsHNxG3MJOF06KMXLRRxQqEprbVsQKNJKJax6n3QmV1966FZbiEGekB4+gvGSR5px4Zh
 A6m8G5q2y5w39c/3LXdBTNGRyH7j43hd6lHVcn8mPYBgt0j2tiKuoCn+GQ28g0vQMUB1
 0xwtgzxb+ID4p8suu7LNRwCWZ6vXJ2PcpS3il+SeRpe5BRyFUUy/eW+aLc8tq5gOnZuI
 drXaw3FU6UQq0rr/1Ch2BweDDT0/V7T2VFjfbwO4tmNqq6WHcj+49jdVTKfVFlADGBp2
 bwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+MoErnjm74ckDgy5tbZNnxq6pI/QlmDb72blZJEpgZc=;
 b=ZulAPTxNX34aXxX7YqHND64GlwC7cHodG+0Jc2jh/XrmgYFHDJHrDzSJOl+G1uu2l6
 OntIvSW9+ghuRQD8Pak3FL1zXI6KYATdkVCwQHs3zpajcPzZy5876DzdOpupHUVI2wUC
 kXiNTEJGQRGkQpXcoco5SChdqQ9nHxsHcPCEJSZnfESWq8+h3iP8UvoLbXY9YzLU3iZW
 FglQkG7zSjUEtTYNKeADmKuDF85Umf/X0789pgUjLafKZXvEkBXlbL3q6rJEbYcsvs51
 ijLmPKOJYKmnBgB5tWu4HEEm6sUITyMfvFS1D6cKMQksmdUyuO9dTjMTooDHCxLXC8OF
 pOMg==
X-Gm-Message-State: AOAM532RNLzM56/8flNZ5mRVvZ4P402VmsVWEn0QptfVifTdnfUzEJBi
 I1jdX+cd3+6KitHbtERMXU7S8sNvkFXpQg==
X-Google-Smtp-Source: ABdhPJw//nt8uGfm3mi4zckf8Pgdd15ofV9dabtWIyfERnvUNQAG+icvdX0CLH4D7Rf1bbYrhhRq9g==
X-Received: by 2002:adf:e70e:0:b0:210:2b0f:723 with SMTP id
 c14-20020adfe70e000000b002102b0f0723mr44369149wrm.47.1654877266277; 
 Fri, 10 Jun 2022 09:07:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm14276053wrb.114.2022.06.10.09.07.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:07:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/28] target/arm: Move arm_generate_debug_exceptions out of
 line
Date: Fri, 10 Jun 2022 17:07:15 +0100
Message-Id: <20220610160738.2230762-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610160738.2230762-1-peter.maydell@linaro.org>
References: <20220610160738.2230762-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Move arm_generate_debug_exceptions and its two subroutines,
{aa32,aa64}_generate_debug_exceptions into debug_helper.c,
and the one interface declaration to internals.h.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220609202901.1177572-6-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h          | 91 -------------------------------------
 target/arm/internals.h    |  1 +
 target/arm/debug_helper.c | 94 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+), 91 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bb1dc3289a2..50b5a9c9fd0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3015,97 +3015,6 @@ static inline bool arm_v7m_csselr_razwi(ARMCPU *cpu)
     return (cpu->clidr & R_V7M_CLIDR_CTYPE_ALL_MASK) != 0;
 }
 
-/* See AArch64.GenerateDebugExceptionsFrom() in ARM ARM pseudocode */
-static inline bool aa64_generate_debug_exceptions(CPUARMState *env)
-{
-    int cur_el = arm_current_el(env);
-    int debug_el;
-
-    if (cur_el == 3) {
-        return false;
-    }
-
-    /* MDCR_EL3.SDD disables debug events from Secure state */
-    if (arm_is_secure_below_el3(env)
-        && extract32(env->cp15.mdcr_el3, 16, 1)) {
-        return false;
-    }
-
-    /*
-     * Same EL to same EL debug exceptions need MDSCR_KDE enabled
-     * while not masking the (D)ebug bit in DAIF.
-     */
-    debug_el = arm_debug_target_el(env);
-
-    if (cur_el == debug_el) {
-        return extract32(env->cp15.mdscr_el1, 13, 1)
-            && !(env->daif & PSTATE_D);
-    }
-
-    /* Otherwise the debug target needs to be a higher EL */
-    return debug_el > cur_el;
-}
-
-static inline bool aa32_generate_debug_exceptions(CPUARMState *env)
-{
-    int el = arm_current_el(env);
-
-    if (el == 0 && arm_el_is_aa64(env, 1)) {
-        return aa64_generate_debug_exceptions(env);
-    }
-
-    if (arm_is_secure(env)) {
-        int spd;
-
-        if (el == 0 && (env->cp15.sder & 1)) {
-            /* SDER.SUIDEN means debug exceptions from Secure EL0
-             * are always enabled. Otherwise they are controlled by
-             * SDCR.SPD like those from other Secure ELs.
-             */
-            return true;
-        }
-
-        spd = extract32(env->cp15.mdcr_el3, 14, 2);
-        switch (spd) {
-        case 1:
-            /* SPD == 0b01 is reserved, but behaves as 0b00. */
-        case 0:
-            /* For 0b00 we return true if external secure invasive debug
-             * is enabled. On real hardware this is controlled by external
-             * signals to the core. QEMU always permits debug, and behaves
-             * as if DBGEN, SPIDEN, NIDEN and SPNIDEN are all tied high.
-             */
-            return true;
-        case 2:
-            return false;
-        case 3:
-            return true;
-        }
-    }
-
-    return el != 2;
-}
-
-/* Return true if debugging exceptions are currently enabled.
- * This corresponds to what in ARM ARM pseudocode would be
- *    if UsingAArch32() then
- *        return AArch32.GenerateDebugExceptions()
- *    else
- *        return AArch64.GenerateDebugExceptions()
- * We choose to push the if() down into this function for clarity,
- * since the pseudocode has it at all callsites except for the one in
- * CheckSoftwareStep(), where it is elided because both branches would
- * always return the same value.
- */
-static inline bool arm_generate_debug_exceptions(CPUARMState *env)
-{
-    if (env->aarch64) {
-        return aa64_generate_debug_exceptions(env);
-    } else {
-        return aa32_generate_debug_exceptions(env);
-    }
-}
-
 static inline bool arm_sctlr_b(CPUARMState *env)
 {
     return
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 64e2c1dfad4..02fa70f75ae 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1326,6 +1326,7 @@ bool el_is_in_host(CPUARMState *env, int el);
 void aa32_max_features(ARMCPU *cpu);
 int exception_target_el(CPUARMState *env);
 bool arm_singlestep_active(CPUARMState *env);
+bool arm_generate_debug_exceptions(CPUARMState *env);
 
 /* Powers of 2 for sve_vq_map et al. */
 #define SVE_VQ_POW2_MAP                                 \
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 1abf41c5f85..20a0e4261ad 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -12,6 +12,100 @@
 #include "exec/helper-proto.h"
 
 
+/* See AArch64.GenerateDebugExceptionsFrom() in ARM ARM pseudocode */
+static bool aa64_generate_debug_exceptions(CPUARMState *env)
+{
+    int cur_el = arm_current_el(env);
+    int debug_el;
+
+    if (cur_el == 3) {
+        return false;
+    }
+
+    /* MDCR_EL3.SDD disables debug events from Secure state */
+    if (arm_is_secure_below_el3(env)
+        && extract32(env->cp15.mdcr_el3, 16, 1)) {
+        return false;
+    }
+
+    /*
+     * Same EL to same EL debug exceptions need MDSCR_KDE enabled
+     * while not masking the (D)ebug bit in DAIF.
+     */
+    debug_el = arm_debug_target_el(env);
+
+    if (cur_el == debug_el) {
+        return extract32(env->cp15.mdscr_el1, 13, 1)
+            && !(env->daif & PSTATE_D);
+    }
+
+    /* Otherwise the debug target needs to be a higher EL */
+    return debug_el > cur_el;
+}
+
+static bool aa32_generate_debug_exceptions(CPUARMState *env)
+{
+    int el = arm_current_el(env);
+
+    if (el == 0 && arm_el_is_aa64(env, 1)) {
+        return aa64_generate_debug_exceptions(env);
+    }
+
+    if (arm_is_secure(env)) {
+        int spd;
+
+        if (el == 0 && (env->cp15.sder & 1)) {
+            /*
+             * SDER.SUIDEN means debug exceptions from Secure EL0
+             * are always enabled. Otherwise they are controlled by
+             * SDCR.SPD like those from other Secure ELs.
+             */
+            return true;
+        }
+
+        spd = extract32(env->cp15.mdcr_el3, 14, 2);
+        switch (spd) {
+        case 1:
+            /* SPD == 0b01 is reserved, but behaves as 0b00. */
+        case 0:
+            /*
+             * For 0b00 we return true if external secure invasive debug
+             * is enabled. On real hardware this is controlled by external
+             * signals to the core. QEMU always permits debug, and behaves
+             * as if DBGEN, SPIDEN, NIDEN and SPNIDEN are all tied high.
+             */
+            return true;
+        case 2:
+            return false;
+        case 3:
+            return true;
+        }
+    }
+
+    return el != 2;
+}
+
+/*
+ * Return true if debugging exceptions are currently enabled.
+ * This corresponds to what in ARM ARM pseudocode would be
+ *    if UsingAArch32() then
+ *        return AArch32.GenerateDebugExceptions()
+ *    else
+ *        return AArch64.GenerateDebugExceptions()
+ * We choose to push the if() down into this function for clarity,
+ * since the pseudocode has it at all callsites except for the one in
+ * CheckSoftwareStep(), where it is elided because both branches would
+ * always return the same value.
+ */
+bool arm_generate_debug_exceptions(CPUARMState *env)
+{
+    if (env->aarch64) {
+        return aa64_generate_debug_exceptions(env);
+    } else {
+        return aa32_generate_debug_exceptions(env);
+    }
+}
+
 /*
  * Is single-stepping active? (Note that the "is EL_D AArch64?" check
  * implicitly means this always returns false in pre-v8 CPUs.)
-- 
2.25.1


