Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3B25455C8
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 22:39:46 +0200 (CEST)
Received: from localhost ([::1]:49356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzOwS-000665-U2
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 16:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmH-0003iw-JY
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:13 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:54110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmC-0008Rf-Dl
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:13 -0400
Received: by mail-pj1-x102c.google.com with SMTP id a10so22309580pju.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 13:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DvjfME7+Ka5kNm2PWO6mtYjQ90LhCIioEZBbUU3Qie4=;
 b=HRyPnQswkDWpijO56F5AUjckxyFYu/uFG7bizMhvWa0jtwMwfzEl3ymxnPVKDCpfwj
 7HewtWqFqPez0ynjzum667bI/HWCmWMlIJrAfuw0zx9rtia4HBlqNRiy1RsVTgDOmyux
 qijo0YykQfa5tJem3BfF8wdidUXyXB1NalRIi+5ZwbE261SOjKGXdJb++kjW1wyzUFaO
 uYJFRNM41n516vN2wD9rY8zT7rJ3w+r0OXKuFvkE4FWUbxKV/8/cqjMhHDa6V6ogI/hQ
 qKM3au5v1rRPgs0Z7GBfe3hAlcIR+a9Z3bS990eDsH3r6B9PK0sttt2DZehVY8FPvhuM
 inQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DvjfME7+Ka5kNm2PWO6mtYjQ90LhCIioEZBbUU3Qie4=;
 b=3ri5wTzUfiJU4NkDV/kCPnyBKk8m0Cyb8odvubkvWDU2/lNd3zciJGbvzJ80dQ3fZ8
 hYg57pjFlZa+17qkOW9VHUDAQrTGxjZDZrU0MomxIemgZRRteF0MpqYBB4KNceGKVtkW
 DuQAWVJpUH4HKZh7JwFPI8EtsZ+NBKDRS28AEEQR0XJq+IGs/e84OCHo6KJeTSgCOrOu
 ZXpZcgIyUlldhpUKT/JItuN8OrBE9hOVQpodOVMIVjAdX6EOPRvIv2zKrgsSH/zhX7sc
 jpBSp54DD4iAaULl9pRW2oEVovQKwpoc6hiMolw8g5f0U5V+givIem4C8e5Nhej1fLkT
 ti6w==
X-Gm-Message-State: AOAM532RqfIj7HpPyIlb/SqYhYz40wq5M+tzSke9FjqwbJw1WrvWnJvv
 JGeuat5Qd9zSvPrdqik0QKSBoQbYb+yAcw==
X-Google-Smtp-Source: ABdhPJwFv/gprCIhmD5ELL4uOluRR55rhiX+BvrTN7GutRzAzGk29AHKR+SQ1WIYXtfbGqv4uICMRw==
X-Received: by 2002:a17:902:d2c1:b0:165:d4cd:e118 with SMTP id
 n1-20020a170902d2c100b00165d4cde118mr42385400plc.4.1654806547118; 
 Thu, 09 Jun 2022 13:29:07 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 05/23] target/arm: Move arm_generate_debug_exceptions out
 of line
Date: Thu,  9 Jun 2022 13:28:43 -0700
Message-Id: <20220609202901.1177572-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Move arm_generate_debug_exceptions and its two subroutines,
{aa32,aa64}_generate_debug_exceptions into debug_helper.c,
and the one interface declaration to internals.h.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h          | 91 -------------------------------------
 target/arm/internals.h    |  1 +
 target/arm/debug_helper.c | 94 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+), 91 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bb1dc3289a..50b5a9c9fd 100644
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
index 64e2c1dfad..02fa70f75a 100644
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
index 1abf41c5f8..20a0e4261a 100644
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
2.34.1


