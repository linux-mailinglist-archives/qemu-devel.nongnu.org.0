Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F2839BCD7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:16:28 +0200 (CEST)
Received: from localhost ([::1]:55844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCUl-0000W0-Ev
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:16:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8g-0003Hd-VL
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:39 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:46609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8d-00009c-OD
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:38 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 h22-20020a05600c3516b02901a826f84095so915817wmq.5
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cn3xyAgideBI5BCmgu7Gt0NwbqrNIOTnH45mDz31IIw=;
 b=lmCmFVu9dBcfNaXqIg9xLnLz+tn44MNuz1dERwHLoNAp82MxyQSMST+TUpv0nodjLo
 54e+QIEwYcLla+Y8P4Z9bfwiFKmHe9lEfGrH8zqcIgcD/FjOY/pobgtVE4YGQ+mxlSs1
 kUDBHI/LimmZAFUj3FRbVIIAER5YsdHugARyQ+6LvGND8l5JetIJD2+mj09gLhcYYndt
 m16/noRk3QkM3dH3bXoQCDly5DF8v4jxskroqA4ZLpiqcggCNCr2qVibTgUM7WPkWRQt
 TW0QXBii/yUnvvkLievncYSMP9aezfqVN9+OhreBMqwfdBDgacCRHXt2qF+ZjICLFg9Z
 TEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cn3xyAgideBI5BCmgu7Gt0NwbqrNIOTnH45mDz31IIw=;
 b=EPdbJwOaTupMydd9DpCtaBxgVTMSaixiFBrPwjhZ4fHAJg+6xHMgvesiUMmU/S+O0M
 BTyus8qBiIUBK2PVbhz03Nvuez8jHzQfuW1wHf1Vazy0gDMPEauefH3wfSleZbu01Yud
 g6WLBDe/e2b/wE2vs/tFrTtfEIEQ5ZmDq0o1SlrwZEpL7iMTOxylh6Q8VbR/NAaQSRsE
 xyOdXAJpeMYVna77AYoJroFCZpObIgHfRRSSD6tp0fpipXXgASKR4sVJ/r203wE79r1H
 E1P99MkcZJvNZ0R/oOV9FbnNrKN6MdKtLYfbS2u2VLY4lV5vFxZkircDay5yaoO2nlW6
 llDQ==
X-Gm-Message-State: AOAM530CAEZASON1sei8MgBXolxFe66Fmr9I7ADzZ+9lOXDwcX7dIMXi
 z2Q2OJZkEEBpUMSQCdpcm8FxkA==
X-Google-Smtp-Source: ABdhPJwBGgHeEMNoNt4zieUKiCx3Xl7I2U0WrGF3GT77SV0h/Bfo0zjl50HLoqof395zvHzWxUbNsA==
X-Received: by 2002:a1c:7402:: with SMTP id p2mr4273222wmc.88.1622822014181;
 Fri, 04 Jun 2021 08:53:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l16sm9356859wmj.47.2021.06.04.08.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:53:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7295E1FFBC;
 Fri,  4 Jun 2021 16:53:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v16 36/99] target/arm: move arm_mmu_idx* to cpu-mmu
Date: Fri,  4 Jun 2021 16:52:09 +0100
Message-Id: <20210604155312.15902-37-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-mmu.c    | 95 +++++++++++++++++++++++++++++++++++++++++
 target/arm/tcg/helper.c | 95 -----------------------------------------
 2 files changed, 95 insertions(+), 95 deletions(-)

diff --git a/target/arm/cpu-mmu.c b/target/arm/cpu-mmu.c
index f463f8458e..c6ac90a61e 100644
--- a/target/arm/cpu-mmu.c
+++ b/target/arm/cpu-mmu.c
@@ -122,3 +122,98 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .using64k = using64k,
     };
 }
+
+/* Return the exception level we're running at if this is our mmu_idx */
+int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
+{
+    if (mmu_idx & ARM_MMU_IDX_M) {
+        return mmu_idx & ARM_MMU_IDX_M_PRIV;
+    }
+
+    switch (mmu_idx) {
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_SE10_0:
+    case ARMMMUIdx_SE20_0:
+        return 0;
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_E10_1_PAN:
+    case ARMMMUIdx_SE10_1:
+    case ARMMMUIdx_SE10_1_PAN:
+        return 1;
+    case ARMMMUIdx_E2:
+    case ARMMMUIdx_E20_2:
+    case ARMMMUIdx_E20_2_PAN:
+    case ARMMMUIdx_SE2:
+    case ARMMMUIdx_SE20_2:
+    case ARMMMUIdx_SE20_2_PAN:
+        return 2;
+    case ARMMMUIdx_SE3:
+        return 3;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+#ifndef CONFIG_TCG
+ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
+{
+    g_assert_not_reached();
+}
+#endif
+
+ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
+{
+    ARMMMUIdx idx;
+    uint64_t hcr;
+
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        return arm_v7m_mmu_idx_for_secstate(env, env->v7m.secure);
+    }
+
+    /* See ARM pseudo-function ELIsInHost.  */
+    switch (el) {
+    case 0:
+        hcr = arm_hcr_el2_eff(env);
+        if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
+            idx = ARMMMUIdx_E20_0;
+        } else {
+            idx = ARMMMUIdx_E10_0;
+        }
+        break;
+    case 1:
+        if (env->pstate & PSTATE_PAN) {
+            idx = ARMMMUIdx_E10_1_PAN;
+        } else {
+            idx = ARMMMUIdx_E10_1;
+        }
+        break;
+    case 2:
+        /* Note that TGE does not apply at EL2.  */
+        if (arm_hcr_el2_eff(env) & HCR_E2H) {
+            if (env->pstate & PSTATE_PAN) {
+                idx = ARMMMUIdx_E20_2_PAN;
+            } else {
+                idx = ARMMMUIdx_E20_2;
+            }
+        } else {
+            idx = ARMMMUIdx_E2;
+        }
+        break;
+    case 3:
+        return ARMMMUIdx_SE3;
+    default:
+        g_assert_not_reached();
+    }
+
+    if (arm_is_secure_below_el3(env)) {
+        idx &= ~ARM_MMU_IDX_A_NS;
+    }
+
+    return idx;
+}
+
+ARMMMUIdx arm_mmu_idx(CPUARMState *env)
+{
+    return arm_mmu_idx_el(env, arm_current_el(env));
+}
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index e85e2bfed9..a4630b4039 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -2093,101 +2093,6 @@ int fp_exception_el(CPUARMState *env, int cur_el)
     return 0;
 }
 
-/* Return the exception level we're running at if this is our mmu_idx */
-int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
-{
-    if (mmu_idx & ARM_MMU_IDX_M) {
-        return mmu_idx & ARM_MMU_IDX_M_PRIV;
-    }
-
-    switch (mmu_idx) {
-    case ARMMMUIdx_E10_0:
-    case ARMMMUIdx_E20_0:
-    case ARMMMUIdx_SE10_0:
-    case ARMMMUIdx_SE20_0:
-        return 0;
-    case ARMMMUIdx_E10_1:
-    case ARMMMUIdx_E10_1_PAN:
-    case ARMMMUIdx_SE10_1:
-    case ARMMMUIdx_SE10_1_PAN:
-        return 1;
-    case ARMMMUIdx_E2:
-    case ARMMMUIdx_E20_2:
-    case ARMMMUIdx_E20_2_PAN:
-    case ARMMMUIdx_SE2:
-    case ARMMMUIdx_SE20_2:
-    case ARMMMUIdx_SE20_2_PAN:
-        return 2;
-    case ARMMMUIdx_SE3:
-        return 3;
-    default:
-        g_assert_not_reached();
-    }
-}
-
-#ifndef CONFIG_TCG
-ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
-{
-    g_assert_not_reached();
-}
-#endif
-
-ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
-{
-    ARMMMUIdx idx;
-    uint64_t hcr;
-
-    if (arm_feature(env, ARM_FEATURE_M)) {
-        return arm_v7m_mmu_idx_for_secstate(env, env->v7m.secure);
-    }
-
-    /* See ARM pseudo-function ELIsInHost.  */
-    switch (el) {
-    case 0:
-        hcr = arm_hcr_el2_eff(env);
-        if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
-            idx = ARMMMUIdx_E20_0;
-        } else {
-            idx = ARMMMUIdx_E10_0;
-        }
-        break;
-    case 1:
-        if (env->pstate & PSTATE_PAN) {
-            idx = ARMMMUIdx_E10_1_PAN;
-        } else {
-            idx = ARMMMUIdx_E10_1;
-        }
-        break;
-    case 2:
-        /* Note that TGE does not apply at EL2.  */
-        if (arm_hcr_el2_eff(env) & HCR_E2H) {
-            if (env->pstate & PSTATE_PAN) {
-                idx = ARMMMUIdx_E20_2_PAN;
-            } else {
-                idx = ARMMMUIdx_E20_2;
-            }
-        } else {
-            idx = ARMMMUIdx_E2;
-        }
-        break;
-    case 3:
-        return ARMMMUIdx_SE3;
-    default:
-        g_assert_not_reached();
-    }
-
-    if (arm_is_secure_below_el3(env)) {
-        idx &= ~ARM_MMU_IDX_A_NS;
-    }
-
-    return idx;
-}
-
-ARMMMUIdx arm_mmu_idx(CPUARMState *env)
-{
-    return arm_mmu_idx_el(env, arm_current_el(env));
-}
-
 #ifndef CONFIG_USER_ONLY
 ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env)
 {
-- 
2.20.1


