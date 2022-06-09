Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DAF544831
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 12:01:24 +0200 (CEST)
Received: from localhost ([::1]:47166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzEyh-0005Eo-59
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 06:01:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7O-0001Yz-Ba
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:21 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7J-00063j-W3
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:17 -0400
Received: by mail-wr1-x42c.google.com with SMTP id o8so3625877wro.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rd6uuNfniFNZ5ZxqrHQJZxW1BzKlfPz7FzEjKvWSCtE=;
 b=Ll+e0oo1jaPvSjSMft05R2FgQe3K2SnfuIImWHyZwiGxoMJItgjYQBROhhOjGG2nqn
 AYV20Mecjp7DyZRGA+/isTvkovKsTKB2zGYEQMqiN6H67gesoqkMHpUDC+Pw/OkwkapN
 ZfXMWvvMbTBc0MQ4PQUT12AwQeE4Z1nyfrRbKX84CTq1saP8XfQk51qY7pqFCbwPI/ir
 Tj2YQHTzfMDzDZqAl2COkOBq+YfvQDjlQuYWaT8cQ2SFu1P1VIkCdTx38I0Fim5bTpvX
 KOgeyetWNZ+I74gpv53TzEBFr873f70mRJvnVfpajNdlR1k6jrz4U6+43ds11rudXd+9
 Ji9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rd6uuNfniFNZ5ZxqrHQJZxW1BzKlfPz7FzEjKvWSCtE=;
 b=UjQR4uSY0ruf7oMwEV6UyvqmyqDtCkkXVh6lvDrHevG02iuzVQu1u05kRvR5DuBnOX
 AJaPJfCWQAUW/poTa1k+CRh2BRQ/lxdo33eGKioDcUVUvVS3QtzDlynDCvlCiLSxZlwR
 RdX17nrIgVmJE6hgTm080WtxC4F1A8iyWZEM2cBEULV6//IVMY2uGQzC3mPJZyBeyDsQ
 FYwrkPVywU4sd6nV9caTC8AtFLuh2wrV6lVcbYzuYWWwBet7vcrfFioFTCm9LM3xDlvz
 9Qkq6qUrlJSQRKzHNp238xCMhNG3BkuwnTmUMA8d/lYPOnEJwVcQm4kXOwmXtDTC+TaZ
 Pywg==
X-Gm-Message-State: AOAM531CEgXAnhSJl3ArALCPrP4jYh4Lelb3G2OQ4PXleX2YuJv3RScy
 JkG4XHUq3ssku2XXMlxEF8vvyvzAgZ7cNw==
X-Google-Smtp-Source: ABdhPJzMlQehlTKvbt5PFwGDtm/1/IckpECetxalOVR92XObXKeYVPiDa7sywLnNB/Bh00sFP4gzVw==
X-Received: by 2002:adf:f90f:0:b0:20e:5fd4:5d06 with SMTP id
 b15-20020adff90f000000b0020e5fd45d06mr37551453wrr.371.1654765572394; 
 Thu, 09 Jun 2022 02:06:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/55] target/arm: Move ap_to_tw_prot etc to ptw.c
Date: Thu,  9 Jun 2022 10:05:11 +0100
Message-Id: <20220609090537.1971756-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220604040607.269301-23-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.h    | 10 ------
 target/arm/helper.c | 77 ------------------------------------------
 target/arm/ptw.c    | 81 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 81 insertions(+), 87 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index 9314fb4d23c..85ad5767944 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -15,15 +15,5 @@ bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx);
 bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx);
 uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn);
 
-int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx,
-                  int ap, int domain_prot);
-int simple_ap_to_rw_prot_is_user(int ap, bool is_user);
-
-static inline int
-simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
-{
-    return simple_ap_to_rw_prot_is_user(ap, regime_is_user(env, mmu_idx));
-}
-
 #endif /* !CONFIG_USER_ONLY */
 #endif /* TARGET_ARM_PTW_H */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index f61f1da61e4..e894afcb491 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10537,83 +10537,6 @@ bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
         g_assert_not_reached();
     }
 }
-
-/* Translate section/page access permissions to page
- * R/W protection flags
- *
- * @env:         CPUARMState
- * @mmu_idx:     MMU index indicating required translation regime
- * @ap:          The 3-bit access permissions (AP[2:0])
- * @domain_prot: The 2-bit domain access permissions
- */
-int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap, int domain_prot)
-{
-    bool is_user = regime_is_user(env, mmu_idx);
-
-    if (domain_prot == 3) {
-        return PAGE_READ | PAGE_WRITE;
-    }
-
-    switch (ap) {
-    case 0:
-        if (arm_feature(env, ARM_FEATURE_V7)) {
-            return 0;
-        }
-        switch (regime_sctlr(env, mmu_idx) & (SCTLR_S | SCTLR_R)) {
-        case SCTLR_S:
-            return is_user ? 0 : PAGE_READ;
-        case SCTLR_R:
-            return PAGE_READ;
-        default:
-            return 0;
-        }
-    case 1:
-        return is_user ? 0 : PAGE_READ | PAGE_WRITE;
-    case 2:
-        if (is_user) {
-            return PAGE_READ;
-        } else {
-            return PAGE_READ | PAGE_WRITE;
-        }
-    case 3:
-        return PAGE_READ | PAGE_WRITE;
-    case 4: /* Reserved.  */
-        return 0;
-    case 5:
-        return is_user ? 0 : PAGE_READ;
-    case 6:
-        return PAGE_READ;
-    case 7:
-        if (!arm_feature(env, ARM_FEATURE_V6K)) {
-            return 0;
-        }
-        return PAGE_READ;
-    default:
-        g_assert_not_reached();
-    }
-}
-
-/* Translate section/page access permissions to page
- * R/W protection flags.
- *
- * @ap:      The 2-bit simple AP (AP[2:1])
- * @is_user: TRUE if accessing from PL0
- */
-int simple_ap_to_rw_prot_is_user(int ap, bool is_user)
-{
-    switch (ap) {
-    case 0:
-        return is_user ? 0 : PAGE_READ | PAGE_WRITE;
-    case 1:
-        return PAGE_READ | PAGE_WRITE;
-    case 2:
-        return is_user ? 0 : PAGE_READ;
-    case 3:
-        return PAGE_READ;
-    default:
-        g_assert_not_reached();
-    }
-}
 #endif /* !CONFIG_USER_ONLY */
 
 int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 427813ea563..9ab77c39980 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -211,6 +211,87 @@ static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
     return true;
 }
 
+/*
+ * Translate section/page access permissions to page R/W protection flags
+ * @env:         CPUARMState
+ * @mmu_idx:     MMU index indicating required translation regime
+ * @ap:          The 3-bit access permissions (AP[2:0])
+ * @domain_prot: The 2-bit domain access permissions
+ */
+static int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx,
+                         int ap, int domain_prot)
+{
+    bool is_user = regime_is_user(env, mmu_idx);
+
+    if (domain_prot == 3) {
+        return PAGE_READ | PAGE_WRITE;
+    }
+
+    switch (ap) {
+    case 0:
+        if (arm_feature(env, ARM_FEATURE_V7)) {
+            return 0;
+        }
+        switch (regime_sctlr(env, mmu_idx) & (SCTLR_S | SCTLR_R)) {
+        case SCTLR_S:
+            return is_user ? 0 : PAGE_READ;
+        case SCTLR_R:
+            return PAGE_READ;
+        default:
+            return 0;
+        }
+    case 1:
+        return is_user ? 0 : PAGE_READ | PAGE_WRITE;
+    case 2:
+        if (is_user) {
+            return PAGE_READ;
+        } else {
+            return PAGE_READ | PAGE_WRITE;
+        }
+    case 3:
+        return PAGE_READ | PAGE_WRITE;
+    case 4: /* Reserved.  */
+        return 0;
+    case 5:
+        return is_user ? 0 : PAGE_READ;
+    case 6:
+        return PAGE_READ;
+    case 7:
+        if (!arm_feature(env, ARM_FEATURE_V6K)) {
+            return 0;
+        }
+        return PAGE_READ;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+/*
+ * Translate section/page access permissions to page R/W protection flags.
+ * @ap:      The 2-bit simple AP (AP[2:1])
+ * @is_user: TRUE if accessing from PL0
+ */
+static int simple_ap_to_rw_prot_is_user(int ap, bool is_user)
+{
+    switch (ap) {
+    case 0:
+        return is_user ? 0 : PAGE_READ | PAGE_WRITE;
+    case 1:
+        return PAGE_READ | PAGE_WRITE;
+    case 2:
+        return is_user ? 0 : PAGE_READ;
+    case 3:
+        return PAGE_READ;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static int simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
+{
+    return simple_ap_to_rw_prot_is_user(ap, regime_is_user(env, mmu_idx));
+}
+
 static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
                              hwaddr *phys_ptr, int *prot,
-- 
2.25.1


