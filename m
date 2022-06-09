Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF333544990
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 12:58:38 +0200 (CEST)
Received: from localhost ([::1]:49814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzFs5-00085d-RS
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 06:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7O-0001Z3-Ud
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:21 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7M-00060e-Ft
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:18 -0400
Received: by mail-wr1-x433.google.com with SMTP id q15so23422931wrc.11
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NqYWQ8l2y3CQlswUgWQkihqe1Lkdxi0y72T5OHE/ZAg=;
 b=lXZ8SzMQuaSIkxttaPcqja1ngEg2kC4C4jnTj25wsXSNAyadt/KJSoB8uTk+71trNh
 lyMsKokwPfTfS3ET35LbQQIYysiZ+P8um5eZq1cx+ZIJpWtEmo59afB3p81u/ZI9CrtL
 EThDxu/nzSljgic5GS0+q3D1WeqkdmTvxD/QT8D5VVPI7hAhd8WRBbvGeUgxZsZHAwwf
 vEZLLUDedkJl1OQAcWMhNJtkthYFoJX7x0qYiJT5KZYhDDgNf3eO8G9YocbQmmCrZSfy
 H6qp/FFLFnrFmnPxlGvhLSTf9ZbEaBORMz61X1ia5QXZ3abZbnTfp6B19aMrTE8Q0jKi
 vQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NqYWQ8l2y3CQlswUgWQkihqe1Lkdxi0y72T5OHE/ZAg=;
 b=7XWrZwiwGrVCrNXXpQXXVXdqm8/aLvGRKRmqCySWEYpVzX6fCm+axU9eEPCf33y1N7
 A3vkTeBEpnYTcgShi4LY1tTEHHBC84LDdsmn7oVKng1Z899ddVB/rSw5dedgefIRi6P3
 Flr++gWdweOI4za6mKUBwU4E9ELPQQkLhERBH9DtX7zIo2gkKTLcFJapLkMApwjtG1P2
 cAChrgFH0Cn0Sv4kDr2aD4jFj5SzhbeIno74itlxPJiHP71zW1iJJSVbSxzA50pa+8jo
 Ho3wTWAnDORmgkxuI9+JtsEY9lmV2tBlGCXolm3SicPNkeP2M0srGWlz8+5q+8sIejBY
 qBZA==
X-Gm-Message-State: AOAM532HghF4oujbjge+9nMBjg7hSZuQ0WIJ0WaB4vxQHhpInMk8xCFl
 BO7C74kShzV36IR9JrrXMBsyjtx3PyuDyA==
X-Google-Smtp-Source: ABdhPJzCdX1k7VfeeJ4eZItrHgTdOrxSjkoGP2Aydcls6+JuFh0SXNuBJ8Xs8pN8FsQfH+BkKai/9g==
X-Received: by 2002:a5d:5383:0:b0:211:8d24:8285 with SMTP id
 d3-20020a5d5383000000b002118d248285mr37600105wrv.681.1654765575792; 
 Thu, 09 Jun 2022 02:06:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/55] target/arm: Move regime_translation_disabled to ptw.c
Date: Thu,  9 Jun 2022 10:05:14 +0100
Message-Id: <20220609090537.1971756-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220604040607.269301-26-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.h    | 17 ----------------
 target/arm/helper.c | 47 ---------------------------------------------
 target/arm/ptw.c    | 47 ++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 46 insertions(+), 65 deletions(-)
 delete mode 100644 target/arm/ptw.h

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
deleted file mode 100644
index ed152ddaf4e..00000000000
--- a/target/arm/ptw.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/*
- * ARM page table walking.
- *
- * This code is licensed under the GNU GPL v2 or later.
- *
- * SPDX-License-Identifier: GPL-2.0-or-later
- */
-
-#ifndef TARGET_ARM_PTW_H
-#define TARGET_ARM_PTW_H
-
-#ifndef CONFIG_USER_ONLY
-
-bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx);
-
-#endif /* !CONFIG_USER_ONLY */
-#endif /* TARGET_ARM_PTW_H */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index fdda87e87e2..69b1c060c1f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -36,7 +36,6 @@
 #include "semihosting/common-semi.h"
 #endif
 #include "cpregs.h"
-#include "ptw.h"
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
 
@@ -10429,52 +10428,6 @@ uint64_t arm_sctlr(CPUARMState *env, int el)
 }
 
 #ifndef CONFIG_USER_ONLY
-
-/* Return true if the specified stage of address translation is disabled */
-bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    uint64_t hcr_el2;
-
-    if (arm_feature(env, ARM_FEATURE_M)) {
-        switch (env->v7m.mpu_ctrl[regime_is_secure(env, mmu_idx)] &
-                (R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK)) {
-        case R_V7M_MPU_CTRL_ENABLE_MASK:
-            /* Enabled, but not for HardFault and NMI */
-            return mmu_idx & ARM_MMU_IDX_M_NEGPRI;
-        case R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK:
-            /* Enabled for all cases */
-            return false;
-        case 0:
-        default:
-            /* HFNMIENA set and ENABLE clear is UNPREDICTABLE, but
-             * we warned about that in armv7m_nvic.c when the guest set it.
-             */
-            return true;
-        }
-    }
-
-    hcr_el2 = arm_hcr_el2_eff(env);
-
-    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
-        /* HCR.DC means HCR.VM behaves as 1 */
-        return (hcr_el2 & (HCR_DC | HCR_VM)) == 0;
-    }
-
-    if (hcr_el2 & HCR_TGE) {
-        /* TGE means that NS EL0/1 act as if SCTLR_EL1.M is zero */
-        if (!regime_is_secure(env, mmu_idx) && regime_el(env, mmu_idx) == 1) {
-            return true;
-        }
-    }
-
-    if ((hcr_el2 & HCR_DC) && arm_mmu_idx_is_stage1_of_2(mmu_idx)) {
-        /* HCR.DC means SCTLR_EL1.M behaves as 0 */
-        return true;
-    }
-
-    return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
-}
-
 /* Convert a possible stage1+2 MMU index into the appropriate
  * stage 1 MMU index
  */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index dc559e6bdfd..ec60afd9bff 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -12,7 +12,6 @@
 #include "cpu.h"
 #include "internals.h"
 #include "idau.h"
-#include "ptw.h"
 
 
 static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
@@ -91,6 +90,52 @@ static uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn)
     }
 }
 
+/* Return true if the specified stage of address translation is disabled */
+static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    uint64_t hcr_el2;
+
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        switch (env->v7m.mpu_ctrl[regime_is_secure(env, mmu_idx)] &
+                (R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK)) {
+        case R_V7M_MPU_CTRL_ENABLE_MASK:
+            /* Enabled, but not for HardFault and NMI */
+            return mmu_idx & ARM_MMU_IDX_M_NEGPRI;
+        case R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK:
+            /* Enabled for all cases */
+            return false;
+        case 0:
+        default:
+            /*
+             * HFNMIENA set and ENABLE clear is UNPREDICTABLE, but
+             * we warned about that in armv7m_nvic.c when the guest set it.
+             */
+            return true;
+        }
+    }
+
+    hcr_el2 = arm_hcr_el2_eff(env);
+
+    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+        /* HCR.DC means HCR.VM behaves as 1 */
+        return (hcr_el2 & (HCR_DC | HCR_VM)) == 0;
+    }
+
+    if (hcr_el2 & HCR_TGE) {
+        /* TGE means that NS EL0/1 act as if SCTLR_EL1.M is zero */
+        if (!regime_is_secure(env, mmu_idx) && regime_el(env, mmu_idx) == 1) {
+            return true;
+        }
+    }
+
+    if ((hcr_el2 & HCR_DC) && arm_mmu_idx_is_stage1_of_2(mmu_idx)) {
+        /* HCR.DC means SCTLR_EL1.M behaves as 0 */
+        return true;
+    }
+
+    return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
+}
+
 static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
 {
     /*
-- 
2.25.1


