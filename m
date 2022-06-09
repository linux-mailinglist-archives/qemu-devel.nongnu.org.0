Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE38D5449CA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 13:14:35 +0200 (CEST)
Received: from localhost ([::1]:38360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzG7W-0004Fx-Ky
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 07:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7Q-0001ZE-JP
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:22 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:51890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7H-000638-G6
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:19 -0400
Received: by mail-wm1-x331.google.com with SMTP id z17so7275188wmi.1
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LQAbBz4sWCtAO2yu2KsDdB0OcUgNeqq9QInZEXr67f8=;
 b=uv2vHh+riZszdtFm3LFhhQ7v4NIhkOmxQbzVRPNGbcRLEMthArUO/YkdBK9RmAGGLx
 O5o7zGdZMSlq9CDf+t1porKCQqSAk1rtPs5BYKolvCoUIlXBLoiG2BoTqRc7XcN91NNu
 lkH5cgO0x5oTEHdgg/dNNF2Yu0XtBKW3gzdHTvqQWq13JPdqK6CHxhKH19EYGuRPUqB5
 554cntq1TYAas6rBJ5Xv8WFSfBcFekr2rGAHT3PRubRq39KkM+JU38M2BzRFvX+Lwvep
 n/cBHbDPqjjop3CfwVsRoXiQOdaqPBPSSbRQzkdd6JpYSst5UZ52bWx/Hu3itj7kkJfi
 xomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LQAbBz4sWCtAO2yu2KsDdB0OcUgNeqq9QInZEXr67f8=;
 b=Iw06qqy5GHMXeSEmmqmk4CuqP4O5mnN+5lbWQy9pT5mqR4E+iXpdlmkwmLinCFxTKO
 4A7NPyaR4o/1CswYxpDUkw8ZgtpFe4coERV13+sWuGpdSGSAY8OjRAa84n9qP1HBlRNa
 VOWrKwU3qQWme2MxOb0qNOAKwWiOd40rNcNQIHuJcNYOIcmm4EYWDmPMsMdYF7Hl2WYK
 7WQvZTXBWIy2lH5vjyUMILnNOjRqjLsQJrUnTkabE1elONmZhAJMrCBXJVkyHBnaMVl4
 qJCtbFOw1XXz5b8LGmAK7/jTlYnZVMKpaTB8z1f60bRP045zJQAdhLfefIdREPrtHEhx
 1uHw==
X-Gm-Message-State: AOAM531QYqYzvRjzPvQRYO3vGzsqC4+mMnGEscMO/CW52BspRs6vbMUd
 Ef8B0q583+ljJBkyomDOt7xMYEQjJRKnuw==
X-Google-Smtp-Source: ABdhPJz2bR733zgoNP4W82EJu5U2kXu5XO4Lo7N323F3uSBGPxmP5DMy5zDDvuXawshQBdqDJlbxmQ==
X-Received: by 2002:a05:600c:2244:b0:39c:4060:1ec9 with SMTP id
 a4-20020a05600c224400b0039c40601ec9mr2186915wmm.147.1654765567686; 
 Thu, 09 Jun 2022 02:06:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/55] target/arm: Move {arm_s1_,
 }regime_using_lpae_format to tlb_helper.c
Date: Thu,  9 Jun 2022 10:05:06 +0100
Message-Id: <20220609090537.1971756-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

These functions are used for both page table walking and for
deciding what format in which to deliver exception results.
Since ptw.c is only present for system mode, put the functions
into tlb_helper.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220604040607.269301-18-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c     | 24 ------------------------
 target/arm/tlb_helper.c | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 398bcd62ab9..d2b196ff3e5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10515,30 +10515,6 @@ ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
 }
 #endif /* !CONFIG_USER_ONLY */
 
-/* Return true if the translation regime is using LPAE format page tables */
-bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    int el = regime_el(env, mmu_idx);
-    if (el == 2 || arm_el_is_aa64(env, el)) {
-        return true;
-    }
-    if (arm_feature(env, ARM_FEATURE_LPAE)
-        && (regime_tcr(env, mmu_idx)->raw_tcr & TTBCR_EAE)) {
-        return true;
-    }
-    return false;
-}
-
-/* Returns true if the stage 1 translation regime is using LPAE format page
- * tables. Used when raising alignment exceptions, whose FSR changes depending
- * on whether the long or short descriptor format is in use. */
-bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    mmu_idx = stage_1_mmu_idx(mmu_idx);
-
-    return regime_using_lpae_format(env, mmu_idx);
-}
-
 #ifndef CONFIG_USER_ONLY
 bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 6421e16202e..7d8a86b3c45 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -11,6 +11,32 @@
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 
+
+/* Return true if the translation regime is using LPAE format page tables */
+bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    int el = regime_el(env, mmu_idx);
+    if (el == 2 || arm_el_is_aa64(env, el)) {
+        return true;
+    }
+    if (arm_feature(env, ARM_FEATURE_LPAE)
+        && (regime_tcr(env, mmu_idx)->raw_tcr & TTBCR_EAE)) {
+        return true;
+    }
+    return false;
+}
+
+/*
+ * Returns true if the stage 1 translation regime is using LPAE format page
+ * tables. Used when raising alignment exceptions, whose FSR changes depending
+ * on whether the long or short descriptor format is in use.
+ */
+bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    mmu_idx = stage_1_mmu_idx(mmu_idx);
+    return regime_using_lpae_format(env, mmu_idx);
+}
+
 static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
                                             unsigned int target_el,
                                             bool same_el, bool ea,
-- 
2.25.1


