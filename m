Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA12B546A65
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:32:23 +0200 (CEST)
Received: from localhost ([::1]:51190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhYc-0004Do-Ri
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhAw-0007Tn-DJ
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:54 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:50929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhAu-0007Ff-BL
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:54 -0400
Received: by mail-wm1-x32f.google.com with SMTP id e5so7265806wma.0
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=icTCRKRjuowQOMmCx0jMtO8MzJbDY9Kf6qW0uT7LQEI=;
 b=ogyMzmMXWLtwjB+a8foTr6uA/EVBnDVNr+tNkg0TXbhcoKWXUcB3DumQPOePqBT7KX
 Fm8d3yiBSc3tXyC74yKWISCz1Pg/zcuweHCy0ZHjzV6HJ/PTklax0A5IWv2F1CDy0IB4
 qc0MeEx/wIH8M25aPE492Em4suCifYHVKHBCqWUN2DpNhwkaLhDHzuHjUQHMvjG61GJx
 66H8/n/4gtW6pN3csXDv7lTLssOUVokGq6ysX4pbLgsJol5ceYAVWPxOle6JPxktHEPi
 SXDAKEcN1xTGeKwtlyMEROA1kAWz/+d7RSIo28vD50Q4Y6yFrKnxn8ZMpHAICVsesiDA
 z86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=icTCRKRjuowQOMmCx0jMtO8MzJbDY9Kf6qW0uT7LQEI=;
 b=oYtFSj2u7HXojTkR8SOuvk855++TVGQEsN90zWVCEp6tcRRubQtKuRCIOojvfW2C0k
 ySdcEsgi9KZclVWagr+UYkC5hB1ha7hdIPv6ZFgJWKlu2O2GmDAXTWalc35qXQ8G6qBe
 0eS4NcDw/PBt7or3of9SWZj4aidYH862z/tkVHDEiAG/+2L4uNYd6l8YkLBO3OkSQsQp
 MompCmRXHSMrDjl+03L4oIBDb1Gy5ikW8zQtBn1ub5kZDnL97S5pvgvFEhJpoNuVIHTr
 B2bYHvGqsc3kqDSF/IRMZK8uDGqsZ3b2Vz+E2LiZo5WqXZxwOl+7++86LjS5s9XqY49m
 GTnw==
X-Gm-Message-State: AOAM531vlIa0P1Vf17hAKX/e0chZk/myBMs1NvIg4vrmx+Onbef7BEX0
 RKI8PvC7yiZ3rsfYMo6n8rw/AXbBCBXtFA==
X-Google-Smtp-Source: ABdhPJxH26vTkLZTFR5jt297eMjsdoozXVUbCZS1BeQAP9hy/kDw1f+JmGAu8LngTg/NkJ74Onr4yw==
X-Received: by 2002:a05:600c:a03:b0:395:bc75:61eb with SMTP id
 z3-20020a05600c0a0300b00395bc7561ebmr489159wmp.46.1654877268701; 
 Fri, 10 Jun 2022 09:07:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm14276053wrb.114.2022.06.10.09.07.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:07:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/28] target/arm: Move arm_debug_exception_fsr to
 debug_helper.c
Date: Fri, 10 Jun 2022 17:07:18 +0100
Message-Id: <20220610160738.2230762-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610160738.2230762-1-peter.maydell@linaro.org>
References: <20220610160738.2230762-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

This function now now only used in debug_helper.c, so there is
no reason to have a declaration in a header.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220609202901.1177572-9-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h    | 25 -------------------------
 target/arm/debug_helper.c | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 02fa70f75ae..6f94f3019db 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -793,31 +793,6 @@ static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
     return &env->cp15.tcr_el[regime_el(env, mmu_idx)];
 }
 
-/* Return the FSR value for a debug exception (watchpoint, hardware
- * breakpoint or BKPT insn) targeting the specified exception level.
- */
-static inline uint32_t arm_debug_exception_fsr(CPUARMState *env)
-{
-    ARMMMUFaultInfo fi = { .type = ARMFault_Debug };
-    int target_el = arm_debug_target_el(env);
-    bool using_lpae = false;
-
-    if (target_el == 2 || arm_el_is_aa64(env, target_el)) {
-        using_lpae = true;
-    } else {
-        if (arm_feature(env, ARM_FEATURE_LPAE) &&
-            (env->cp15.tcr_el[target_el].raw_tcr & TTBCR_EAE)) {
-            using_lpae = true;
-        }
-    }
-
-    if (using_lpae) {
-        return arm_fi_to_lfsc(&fi);
-    } else {
-        return arm_fi_to_sfsc(&fi);
-    }
-}
-
 /**
  * arm_num_brps: Return number of implemented breakpoints.
  * Note that the ID register BRPS field is "number of bps - 1",
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 80dff0788b7..a743061e89b 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -379,6 +379,32 @@ bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
     return check_watchpoints(cpu);
 }
 
+/*
+ * Return the FSR value for a debug exception (watchpoint, hardware
+ * breakpoint or BKPT insn) targeting the specified exception level.
+ */
+static uint32_t arm_debug_exception_fsr(CPUARMState *env)
+{
+    ARMMMUFaultInfo fi = { .type = ARMFault_Debug };
+    int target_el = arm_debug_target_el(env);
+    bool using_lpae = false;
+
+    if (target_el == 2 || arm_el_is_aa64(env, target_el)) {
+        using_lpae = true;
+    } else {
+        if (arm_feature(env, ARM_FEATURE_LPAE) &&
+            (env->cp15.tcr_el[target_el].raw_tcr & TTBCR_EAE)) {
+            using_lpae = true;
+        }
+    }
+
+    if (using_lpae) {
+        return arm_fi_to_lfsc(&fi);
+    } else {
+        return arm_fi_to_sfsc(&fi);
+    }
+}
+
 void arm_debug_excp_handler(CPUState *cs)
 {
     /*
-- 
2.25.1


