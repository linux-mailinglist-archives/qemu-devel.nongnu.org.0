Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAAF39BE7B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:21:15 +0200 (CEST)
Received: from localhost ([::1]:51754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDVS-0001yr-J1
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCkg-0008Gt-8F
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:32:54 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCkY-00028v-VE
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:32:54 -0400
Received: by mail-wr1-x430.google.com with SMTP id z8so9890074wrp.12
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U5Xfw9YPhDKbocOUkGJ6dyaTOmUWedj5SAgt0+6wAY8=;
 b=dvCxY719d/0Gualat41bhM6mcAkf30N5uTmv8+TgAlljASfURjug1+inD/wQOSZjmW
 PI40sntvmkx7vY45zvYLrpyqowP8rzKUMCORsKlb+EYsM5rLyJYmsSxKDrkMplUyvtDi
 re+8zdsgdwLkIT6iJ7gLQKcGEFvXlnRPKCupEI5I8dYNlxYNB5ewa9qZHp3UXw+CB5iu
 J0qoOX3BHIRJUTLL4/1s1Z5jOUqkYWMNNHEjDe155aWtdl6QBk4HZSPbOdI6TcdKwQSm
 3WRR+ZHph0SNRoxdYBTEczRJVosgj3uEa9RJ3+heR7UuYoiq5jX/EpVzjUcydAfU5mz7
 gPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U5Xfw9YPhDKbocOUkGJ6dyaTOmUWedj5SAgt0+6wAY8=;
 b=o6b1Ke27aYqkod5PcoEqWiYhtLIbx1OQtX8Q7cdYaJKGFPyDZtIEL/BLPlfPYJ0Mvj
 gbyAVfwWyZFFNQ7l2irom+rKseD3A0468lPmlFRfp8chcKlru3mwGU0r439NXesx21QW
 onEOFjsxWUV8zWY8k1zk6JqVqP0tJiEXU5PWhNMTRewOs6QjIE4kyZdfqvRcqvRAKS4R
 S7hmkBcGAAs7yRviQXGypnm02Lv8LGMJdspPiNH/I7Xz3BEjlFTZ8UGZX5Dt33X7XWJx
 KbKxKSaTgn/oLHoevnWMq9NcADacpeoMIbJtGGD66NV40qEEk9yTS9YYhgv4qjQg7IxP
 IvRg==
X-Gm-Message-State: AOAM531YONSBfOvP3D3bommppgQs84iA2bO8MurcuZWTr6Izx11FGIJ5
 zDadCFslpBY+7nS9sZhl6Wg0jvDHoDF3+Q==
X-Google-Smtp-Source: ABdhPJxHpS+GVDfK7kko4JAzVgMoqxILFFXUl5oQkDMOA6oNHAU0BxJsSihPgNJzivByqEaFfUxnag==
X-Received: by 2002:adf:e507:: with SMTP id j7mr4685178wrm.178.1622824365471; 
 Fri, 04 Jun 2021 09:32:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z3sm7638834wrl.13.2021.06.04.09.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:32:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A38E51FFC6;
 Fri,  4 Jun 2021 16:53:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 47/99] target/arm: move fp_exception_el out of TCG helpers
Date: Fri,  4 Jun 2021 16:52:20 +0100
Message-Id: <20210604155312.15902-48-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-sysemu.c | 100 ++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu-user.c   |   5 ++
 target/arm/tcg/helper.c | 100 ----------------------------------------
 3 files changed, 105 insertions(+), 100 deletions(-)

diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
index 7cc721fe68..128616d90d 100644
--- a/target/arm/cpu-sysemu.c
+++ b/target/arm/cpu-sysemu.c
@@ -410,3 +410,103 @@ int sve_exception_el(CPUARMState *env, int el)
     }
     return 0;
 }
+
+/*
+ * Return the exception level to which FP-disabled exceptions should
+ * be taken, or 0 if FP is enabled.
+ */
+int fp_exception_el(CPUARMState *env, int cur_el)
+{
+#ifndef CONFIG_USER_ONLY
+    /*
+     * CPACR and the CPTR registers don't exist before v6, so FP is
+     * always accessible
+     */
+    if (!arm_feature(env, ARM_FEATURE_V6)) {
+        return 0;
+    }
+
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        /* CPACR can cause a NOCP UsageFault taken to current security state */
+        if (!v7m_cpacr_pass(env, env->v7m.secure, cur_el != 0)) {
+            return 1;
+        }
+
+        if (arm_feature(env, ARM_FEATURE_M_SECURITY) && !env->v7m.secure) {
+            if (!extract32(env->v7m.nsacr, 10, 1)) {
+                /* FP insns cause a NOCP UsageFault taken to Secure */
+                return 3;
+            }
+        }
+
+        return 0;
+    }
+
+    /*
+     * The CPACR controls traps to EL1, or PL1 if we're 32 bit:
+     * 0, 2 : trap EL0 and EL1/PL1 accesses
+     * 1    : trap only EL0 accesses
+     * 3    : trap no accesses
+     * This register is ignored if E2H+TGE are both set.
+     */
+    if ((arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
+        int fpen = extract32(env->cp15.cpacr_el1, 20, 2);
+
+        switch (fpen) {
+        case 0:
+        case 2:
+            if (cur_el == 0 || cur_el == 1) {
+                /* Trap to PL1, which might be EL1 or EL3 */
+                if (arm_is_secure(env) && !arm_el_is_aa64(env, 3)) {
+                    return 3;
+                }
+                return 1;
+            }
+            if (cur_el == 3 && !is_a64(env)) {
+                /* Secure PL1 running at EL3 */
+                return 3;
+            }
+            break;
+        case 1:
+            if (cur_el == 0) {
+                return 1;
+            }
+            break;
+        case 3:
+            break;
+        }
+    }
+
+    /*
+     * The NSACR allows A-profile AArch32 EL3 and M-profile secure mode
+     * to control non-secure access to the FPU. It doesn't have any
+     * effect if EL3 is AArch64 or if EL3 doesn't exist at all.
+     */
+    if ((arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
+         cur_el <= 2 && !arm_is_secure_below_el3(env))) {
+        if (!extract32(env->cp15.nsacr, 10, 1)) {
+            /* FP insns act as UNDEF */
+            return cur_el == 2 ? 2 : 1;
+        }
+    }
+
+    /*
+     * For the CPTR registers we don't need to guard with an ARM_FEATURE
+     * check because zero bits in the registers mean "don't trap".
+     */
+
+    /* CPTR_EL2 : present in v7VE or v8 */
+    if (cur_el <= 2 && extract32(env->cp15.cptr_el[2], 10, 1)
+        && arm_is_el2_enabled(env)) {
+        /* Trap FP ops at EL2, NS-EL1 or NS-EL0 to EL2 */
+        return 2;
+    }
+
+    /* CPTR_EL3 : present in v8 */
+    if (extract32(env->cp15.cptr_el[3], 10, 1)) {
+        /* Trap all FP ops to EL3 */
+        return 3;
+    }
+#endif
+    return 0;
+}
diff --git a/target/arm/cpu-user.c b/target/arm/cpu-user.c
index 39093ade76..6a1a1fa273 100644
--- a/target/arm/cpu-user.c
+++ b/target/arm/cpu-user.c
@@ -38,3 +38,8 @@ int sve_exception_el(CPUARMState *env, int el)
 {
     return 0;
 }
+
+int fp_exception_el(CPUARMState *env, int el)
+{
+    return 0;
+}
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index d4cafdbd95..e55209491f 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -1625,106 +1625,6 @@ uint32_t HELPER(crc32c)(uint32_t acc, uint32_t val, uint32_t bytes)
     return crc32c(acc, buf, bytes) ^ 0xffffffff;
 }
 
-/*
- * Return the exception level to which FP-disabled exceptions should
- * be taken, or 0 if FP is enabled.
- */
-int fp_exception_el(CPUARMState *env, int cur_el)
-{
-#ifndef CONFIG_USER_ONLY
-    /*
-     * CPACR and the CPTR registers don't exist before v6, so FP is
-     * always accessible
-     */
-    if (!arm_feature(env, ARM_FEATURE_V6)) {
-        return 0;
-    }
-
-    if (arm_feature(env, ARM_FEATURE_M)) {
-        /* CPACR can cause a NOCP UsageFault taken to current security state */
-        if (!v7m_cpacr_pass(env, env->v7m.secure, cur_el != 0)) {
-            return 1;
-        }
-
-        if (arm_feature(env, ARM_FEATURE_M_SECURITY) && !env->v7m.secure) {
-            if (!extract32(env->v7m.nsacr, 10, 1)) {
-                /* FP insns cause a NOCP UsageFault taken to Secure */
-                return 3;
-            }
-        }
-
-        return 0;
-    }
-
-    /*
-     * The CPACR controls traps to EL1, or PL1 if we're 32 bit:
-     * 0, 2 : trap EL0 and EL1/PL1 accesses
-     * 1    : trap only EL0 accesses
-     * 3    : trap no accesses
-     * This register is ignored if E2H+TGE are both set.
-     */
-    if ((arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
-        int fpen = extract32(env->cp15.cpacr_el1, 20, 2);
-
-        switch (fpen) {
-        case 0:
-        case 2:
-            if (cur_el == 0 || cur_el == 1) {
-                /* Trap to PL1, which might be EL1 or EL3 */
-                if (arm_is_secure(env) && !arm_el_is_aa64(env, 3)) {
-                    return 3;
-                }
-                return 1;
-            }
-            if (cur_el == 3 && !is_a64(env)) {
-                /* Secure PL1 running at EL3 */
-                return 3;
-            }
-            break;
-        case 1:
-            if (cur_el == 0) {
-                return 1;
-            }
-            break;
-        case 3:
-            break;
-        }
-    }
-
-    /*
-     * The NSACR allows A-profile AArch32 EL3 and M-profile secure mode
-     * to control non-secure access to the FPU. It doesn't have any
-     * effect if EL3 is AArch64 or if EL3 doesn't exist at all.
-     */
-    if ((arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
-         cur_el <= 2 && !arm_is_secure_below_el3(env))) {
-        if (!extract32(env->cp15.nsacr, 10, 1)) {
-            /* FP insns act as UNDEF */
-            return cur_el == 2 ? 2 : 1;
-        }
-    }
-
-    /*
-     * For the CPTR registers we don't need to guard with an ARM_FEATURE
-     * check because zero bits in the registers mean "don't trap".
-     */
-
-    /* CPTR_EL2 : present in v7VE or v8 */
-    if (cur_el <= 2 && extract32(env->cp15.cptr_el[2], 10, 1)
-        && arm_is_el2_enabled(env)) {
-        /* Trap FP ops at EL2, NS-EL1 or NS-EL0 to EL2 */
-        return 2;
-    }
-
-    /* CPTR_EL3 : present in v8 */
-    if (extract32(env->cp15.cptr_el[3], 10, 1)) {
-        /* Trap all FP ops to EL3 */
-        return 3;
-    }
-#endif
-    return 0;
-}
-
 #ifndef CONFIG_USER_ONLY
 ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env)
 {
-- 
2.20.1


