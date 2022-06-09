Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7CC544A0E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 13:27:49 +0200 (CEST)
Received: from localhost ([::1]:47034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzGKJ-0002f7-Kt
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 07:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7R-0001ZF-2K
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:22 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7P-00064p-0N
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:20 -0400
Received: by mail-wr1-x432.google.com with SMTP id q15so23424549wrc.11
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Hig8Fai2F1wZbBshuF8R/7YaHSV9c3nGNPXI/ypkLI4=;
 b=m/4E20ulIBpiVB/IMa2AT0nnlThFQOBHtqCJzjlmJp3oFcJcu+Xpy0FTdeWW4zK9ch
 MNfuszWLqvuUhK5IseecTJff0wmPFASjE1IRsO2ZrCgBs3E0xzXE6gmjrbATr6Mb1dwZ
 QYRC3a/r2it+xiQq3um2PL0locyGFSGhxdFfJc/kCiPfxMZALgRo94qDtrRQLntdEi1l
 CzjGR3jUaO58muauouuXb5mZFNpZH+pl+JGL+2papdYTW5nVR17jJMVvsnE21laW2VpE
 2cNW27sSBMP3HMIukzTCCpFRto5WRcn7wVu163HBjAknMWwkjyH9CQsaCSWu40vwAHKx
 eOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hig8Fai2F1wZbBshuF8R/7YaHSV9c3nGNPXI/ypkLI4=;
 b=RUCVNJbDhcMlnMtQvR4ky3yU/4VJ+k52H9hd0SHHGTn3iH87KEoVRwJelRlx1UWafh
 cKvWDeEmf1P8Ki8+HEonLyO8+VpfXebooxAXg5hfC1Lky5ETHguAgyutxvhrUDFGcjBS
 banWHdoTftO8zyGgAYBxGDbEFWviASovHJgYgyPGdy3N0df2mh3S3DLP/sFUfWQrG8fx
 j1OMSP7t7zeULpgz1a6OrwgrGcxrr3ZMdWCpjotlkbxv96TQCXxwDM3ZuN8G5HVyaW0C
 Rys4kQXMYYWP9W8WOedqehO1mC+GJvC2mcQX+rhwNUzvlPYFaidRMYZKnaHUGBxk0FOV
 /xBQ==
X-Gm-Message-State: AOAM532/T5dd5E2AxQ4FdFGtWdUNTmWElHMe4YCGqqJDs59Bd2zTCqr+
 0qSxk6NAXvvvt1dLPQI2+SzWxPp+UvRR6Q==
X-Google-Smtp-Source: ABdhPJw6taCiKgsTflyHHzTZD2bD5n60nC8L1iEFRyRYMLxJLwTSLu81gjHWoHLJSCPyI+/dClUrRg==
X-Received: by 2002:a5d:4290:0:b0:213:badd:abc5 with SMTP id
 k16-20020a5d4290000000b00213baddabc5mr32116536wrq.54.1654765577735; 
 Thu, 09 Jun 2022 02:06:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/55] target/arm: Move stage_1_mmu_idx,
 arm_stage1_mmu_idx to ptw.c
Date: Thu,  9 Jun 2022 10:05:16 +0100
Message-Id: <20220609090537.1971756-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Message-id: 20220604040607.269301-28-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 32 --------------------------------
 target/arm/ptw.c    | 28 ++++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 32 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index fe1e426f883..37cf9fa6aba 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10427,31 +10427,6 @@ uint64_t arm_sctlr(CPUARMState *env, int el)
     return env->cp15.sctlr_el[el];
 }
 
-#ifndef CONFIG_USER_ONLY
-/* Convert a possible stage1+2 MMU index into the appropriate
- * stage 1 MMU index
- */
-ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx) {
-    case ARMMMUIdx_SE10_0:
-        return ARMMMUIdx_Stage1_SE0;
-    case ARMMMUIdx_SE10_1:
-        return ARMMMUIdx_Stage1_SE1;
-    case ARMMMUIdx_SE10_1_PAN:
-        return ARMMMUIdx_Stage1_SE1_PAN;
-    case ARMMMUIdx_E10_0:
-        return ARMMMUIdx_Stage1_E0;
-    case ARMMMUIdx_E10_1:
-        return ARMMMUIdx_Stage1_E1;
-    case ARMMMUIdx_E10_1_PAN:
-        return ARMMMUIdx_Stage1_E1_PAN;
-    default:
-        return mmu_idx;
-    }
-}
-#endif /* !CONFIG_USER_ONLY */
-
 int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
@@ -11081,13 +11056,6 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env)
     return arm_mmu_idx_el(env, arm_current_el(env));
 }
 
-#ifndef CONFIG_USER_ONLY
-ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env)
-{
-    return stage_1_mmu_idx(arm_mmu_idx(env));
-}
-#endif
-
 static CPUARMTBFlags rebuild_hflags_common(CPUARMState *env, int fp_el,
                                            ARMMMUIdx mmu_idx,
                                            CPUARMTBFlags flags)
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e9f6870d0a6..49e9a1d108e 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -47,6 +47,34 @@ unsigned int arm_pamax(ARMCPU *cpu)
     return pamax_map[parange];
 }
 
+/*
+ * Convert a possible stage1+2 MMU index into the appropriate stage 1 MMU index
+ */
+ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
+{
+    switch (mmu_idx) {
+    case ARMMMUIdx_SE10_0:
+        return ARMMMUIdx_Stage1_SE0;
+    case ARMMMUIdx_SE10_1:
+        return ARMMMUIdx_Stage1_SE1;
+    case ARMMMUIdx_SE10_1_PAN:
+        return ARMMMUIdx_Stage1_SE1_PAN;
+    case ARMMMUIdx_E10_0:
+        return ARMMMUIdx_Stage1_E0;
+    case ARMMMUIdx_E10_1:
+        return ARMMMUIdx_Stage1_E1;
+    case ARMMMUIdx_E10_1_PAN:
+        return ARMMMUIdx_Stage1_E1_PAN;
+    default:
+        return mmu_idx;
+    }
+}
+
+ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env)
+{
+    return stage_1_mmu_idx(arm_mmu_idx(env));
+}
+
 static bool regime_translation_big_endian(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     return (regime_sctlr(env, mmu_idx) & SCTLR_EE) != 0;
-- 
2.25.1


