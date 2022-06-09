Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AEF544825
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 11:59:16 +0200 (CEST)
Received: from localhost ([::1]:44480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzEwd-0003Mn-5m
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 05:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7W-0001ci-Pq
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:28 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7G-0005vV-Hm
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:26 -0400
Received: by mail-wr1-x430.google.com with SMTP id v14so5217169wra.5
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NZ83DvVjSP5f3cqPypoQ1LPQjwV9cfTRg8x9u5U5b3g=;
 b=fZa6bg6qSNkmXf57PyJdhOmHbZVgPgo9omqBX1ryW+WwjPjDi4aIn8AU9k9NFiBpFq
 pErvXrBSbSSRMWExtYBG7c/5veva9BgeP08Rx68+TU2s4nM1kalUNhbdngddleEhOyIG
 TGqzqznfGO3valMdZqn9/7iliaI7XKI7zy0NCstvLf8z1xzuGNb0odFnTWw+OHvJUyXA
 EPAnhhbLr9iA+pvmiwtjqkf9DKAFKjeyOAFS6/2u+2rjOPdbGonG0uj26mLhVIMZ7U6k
 Vfiy4du8asrK6tvvGjmKGX1RiurywbKrFMzgFZgtxWLzkOLdhYffqUG0nrFT0gIFjIrR
 f8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NZ83DvVjSP5f3cqPypoQ1LPQjwV9cfTRg8x9u5U5b3g=;
 b=eQGHIi5n9DHXdZRi23F8NbcLS3/HUvXak0HYYRUhkl+IMsPVNgqDfm/t+BmlvFOgSj
 XvnwRcP4X1LvErqp75XBMmjapOnou1UkQJfskeV7VbZC88Dx8hWmlUl3mwUAypRqMCDy
 YhQEHbHwElIrxHaggcXWtKAHKmD+mG4NtlruKUhkt39z28sxMh0WtsrffQp+jow6xDVI
 DVBW7hei/wM2aXS5k4Zig1rUGZTR29tcVVUDvpChN9vppozgHHIX7tijoDwjjbq9pjj5
 IH2/J7B6YgxqVcTRo7FENkPiFAFR5hyGwzdcdnGzNBz+dutdeIHlX4lmri/PeTwJHZhh
 fosw==
X-Gm-Message-State: AOAM532ccOxflbNYf3+fIC/1KaWf2cNzVCcrGuBFNMQuHp9HeOx6vAYg
 scsXXZrA33U0hCCpdcdrcpMBKQk77VYflA==
X-Google-Smtp-Source: ABdhPJzA6aTbg78rtSfrLEj+jEO1ssvtGqyGKiAxkDKXBywbHKfBOLaq1FUVOR2lk7TXV8pFm/f7xA==
X-Received: by 2002:a5d:67c2:0:b0:215:7a0f:71f9 with SMTP id
 n2-20020a5d67c2000000b002157a0f71f9mr30973731wrw.486.1654765569593; 
 Thu, 09 Jun 2022 02:06:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/55] target/arm: Move get_S1prot, get_S2prot to ptw.c
Date: Thu,  9 Jun 2022 10:05:08 +0100
Message-Id: <20220609090537.1971756-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Message-id: 20220604040607.269301-20-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.h    |   3 --
 target/arm/helper.c | 128 --------------------------------------------
 target/arm/ptw.c    | 128 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 128 insertions(+), 131 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index fba650d01ca..93147e0b065 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -29,9 +29,6 @@ ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
                                    ARMMMUIdx mmu_idx);
 bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
                         int inputsize, int stride, int outputsize);
-int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0);
-int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
-               int ap, int ns, int xn, int pxn);
 
 #endif /* !CONFIG_USER_ONLY */
 #endif /* TARGET_ARM_PTW_H */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 563e34ecded..148eb28ba8c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10615,134 +10615,6 @@ int simple_ap_to_rw_prot_is_user(int ap, bool is_user)
     }
 }
 
-/* Translate S2 section/page access permissions to protection flags
- *
- * @env:     CPUARMState
- * @s2ap:    The 2-bit stage2 access permissions (S2AP)
- * @xn:      XN (execute-never) bits
- * @s1_is_el0: true if this is S2 of an S1+2 walk for EL0
- */
-int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
-{
-    int prot = 0;
-
-    if (s2ap & 1) {
-        prot |= PAGE_READ;
-    }
-    if (s2ap & 2) {
-        prot |= PAGE_WRITE;
-    }
-
-    if (cpu_isar_feature(any_tts2uxn, env_archcpu(env))) {
-        switch (xn) {
-        case 0:
-            prot |= PAGE_EXEC;
-            break;
-        case 1:
-            if (s1_is_el0) {
-                prot |= PAGE_EXEC;
-            }
-            break;
-        case 2:
-            break;
-        case 3:
-            if (!s1_is_el0) {
-                prot |= PAGE_EXEC;
-            }
-            break;
-        default:
-            g_assert_not_reached();
-        }
-    } else {
-        if (!extract32(xn, 1, 1)) {
-            if (arm_el_is_aa64(env, 2) || prot & PAGE_READ) {
-                prot |= PAGE_EXEC;
-            }
-        }
-    }
-    return prot;
-}
-
-/* Translate section/page access permissions to protection flags
- *
- * @env:     CPUARMState
- * @mmu_idx: MMU index indicating required translation regime
- * @is_aa64: TRUE if AArch64
- * @ap:      The 2-bit simple AP (AP[2:1])
- * @ns:      NS (non-secure) bit
- * @xn:      XN (execute-never) bit
- * @pxn:     PXN (privileged execute-never) bit
- */
-int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
-               int ap, int ns, int xn, int pxn)
-{
-    bool is_user = regime_is_user(env, mmu_idx);
-    int prot_rw, user_rw;
-    bool have_wxn;
-    int wxn = 0;
-
-    assert(mmu_idx != ARMMMUIdx_Stage2);
-    assert(mmu_idx != ARMMMUIdx_Stage2_S);
-
-    user_rw = simple_ap_to_rw_prot_is_user(ap, true);
-    if (is_user) {
-        prot_rw = user_rw;
-    } else {
-        if (user_rw && regime_is_pan(env, mmu_idx)) {
-            /* PAN forbids data accesses but doesn't affect insn fetch */
-            prot_rw = 0;
-        } else {
-            prot_rw = simple_ap_to_rw_prot_is_user(ap, false);
-        }
-    }
-
-    if (ns && arm_is_secure(env) && (env->cp15.scr_el3 & SCR_SIF)) {
-        return prot_rw;
-    }
-
-    /* TODO have_wxn should be replaced with
-     *   ARM_FEATURE_V8 || (ARM_FEATURE_V7 && ARM_FEATURE_EL2)
-     * when ARM_FEATURE_EL2 starts getting set. For now we assume all LPAE
-     * compatible processors have EL2, which is required for [U]WXN.
-     */
-    have_wxn = arm_feature(env, ARM_FEATURE_LPAE);
-
-    if (have_wxn) {
-        wxn = regime_sctlr(env, mmu_idx) & SCTLR_WXN;
-    }
-
-    if (is_aa64) {
-        if (regime_has_2_ranges(mmu_idx) && !is_user) {
-            xn = pxn || (user_rw & PAGE_WRITE);
-        }
-    } else if (arm_feature(env, ARM_FEATURE_V7)) {
-        switch (regime_el(env, mmu_idx)) {
-        case 1:
-        case 3:
-            if (is_user) {
-                xn = xn || !(user_rw & PAGE_READ);
-            } else {
-                int uwxn = 0;
-                if (have_wxn) {
-                    uwxn = regime_sctlr(env, mmu_idx) & SCTLR_UWXN;
-                }
-                xn = xn || !(prot_rw & PAGE_READ) || pxn ||
-                     (uwxn && (user_rw & PAGE_WRITE));
-            }
-            break;
-        case 2:
-            break;
-        }
-    } else {
-        xn = wxn = 0;
-    }
-
-    if (xn || (wxn && (prot_rw & PAGE_WRITE))) {
-        return prot_rw;
-    }
-    return prot_rw | PAGE_EXEC;
-}
-
 /*
  * check_s2_mmu_setup
  * @cpu:        ARMCPU
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index d754273fa16..af9ad420288 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -487,6 +487,134 @@ do_fault:
     return true;
 }
 
+/*
+ * Translate S2 section/page access permissions to protection flags
+ * @env:     CPUARMState
+ * @s2ap:    The 2-bit stage2 access permissions (S2AP)
+ * @xn:      XN (execute-never) bits
+ * @s1_is_el0: true if this is S2 of an S1+2 walk for EL0
+ */
+static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
+{
+    int prot = 0;
+
+    if (s2ap & 1) {
+        prot |= PAGE_READ;
+    }
+    if (s2ap & 2) {
+        prot |= PAGE_WRITE;
+    }
+
+    if (cpu_isar_feature(any_tts2uxn, env_archcpu(env))) {
+        switch (xn) {
+        case 0:
+            prot |= PAGE_EXEC;
+            break;
+        case 1:
+            if (s1_is_el0) {
+                prot |= PAGE_EXEC;
+            }
+            break;
+        case 2:
+            break;
+        case 3:
+            if (!s1_is_el0) {
+                prot |= PAGE_EXEC;
+            }
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    } else {
+        if (!extract32(xn, 1, 1)) {
+            if (arm_el_is_aa64(env, 2) || prot & PAGE_READ) {
+                prot |= PAGE_EXEC;
+            }
+        }
+    }
+    return prot;
+}
+
+/*
+ * Translate section/page access permissions to protection flags
+ * @env:     CPUARMState
+ * @mmu_idx: MMU index indicating required translation regime
+ * @is_aa64: TRUE if AArch64
+ * @ap:      The 2-bit simple AP (AP[2:1])
+ * @ns:      NS (non-secure) bit
+ * @xn:      XN (execute-never) bit
+ * @pxn:     PXN (privileged execute-never) bit
+ */
+static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
+                      int ap, int ns, int xn, int pxn)
+{
+    bool is_user = regime_is_user(env, mmu_idx);
+    int prot_rw, user_rw;
+    bool have_wxn;
+    int wxn = 0;
+
+    assert(mmu_idx != ARMMMUIdx_Stage2);
+    assert(mmu_idx != ARMMMUIdx_Stage2_S);
+
+    user_rw = simple_ap_to_rw_prot_is_user(ap, true);
+    if (is_user) {
+        prot_rw = user_rw;
+    } else {
+        if (user_rw && regime_is_pan(env, mmu_idx)) {
+            /* PAN forbids data accesses but doesn't affect insn fetch */
+            prot_rw = 0;
+        } else {
+            prot_rw = simple_ap_to_rw_prot_is_user(ap, false);
+        }
+    }
+
+    if (ns && arm_is_secure(env) && (env->cp15.scr_el3 & SCR_SIF)) {
+        return prot_rw;
+    }
+
+    /* TODO have_wxn should be replaced with
+     *   ARM_FEATURE_V8 || (ARM_FEATURE_V7 && ARM_FEATURE_EL2)
+     * when ARM_FEATURE_EL2 starts getting set. For now we assume all LPAE
+     * compatible processors have EL2, which is required for [U]WXN.
+     */
+    have_wxn = arm_feature(env, ARM_FEATURE_LPAE);
+
+    if (have_wxn) {
+        wxn = regime_sctlr(env, mmu_idx) & SCTLR_WXN;
+    }
+
+    if (is_aa64) {
+        if (regime_has_2_ranges(mmu_idx) && !is_user) {
+            xn = pxn || (user_rw & PAGE_WRITE);
+        }
+    } else if (arm_feature(env, ARM_FEATURE_V7)) {
+        switch (regime_el(env, mmu_idx)) {
+        case 1:
+        case 3:
+            if (is_user) {
+                xn = xn || !(user_rw & PAGE_READ);
+            } else {
+                int uwxn = 0;
+                if (have_wxn) {
+                    uwxn = regime_sctlr(env, mmu_idx) & SCTLR_UWXN;
+                }
+                xn = xn || !(prot_rw & PAGE_READ) || pxn ||
+                     (uwxn && (user_rw & PAGE_WRITE));
+            }
+            break;
+        case 2:
+            break;
+        }
+    } else {
+        xn = wxn = 0;
+    }
+
+    if (xn || (wxn && (prot_rw & PAGE_WRITE))) {
+        return prot_rw;
+    }
+    return prot_rw | PAGE_EXEC;
+}
+
 /**
  * get_phys_addr_lpae: perform one stage of page table walk, LPAE format
  *
-- 
2.25.1


