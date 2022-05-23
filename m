Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DCC531D55
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 23:05:17 +0200 (CEST)
Received: from localhost ([::1]:56404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntFEo-0002wk-7i
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 17:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy9-0008Ug-Uv
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:48:01 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:42932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy8-000539-3q
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:48:01 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 a23-20020a17090acb9700b001df4e9f4870so368820pju.1
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 13:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3bqX2hAe2Sjw2v5YRDxIGUXWsq30Bbv7KtpnLqEB4zE=;
 b=FYGDDMhS5YogglGyw3rxUdVX5dAu2do5oDVC6igkJVyMjGeUhXjyRpgjHZfeRHR4+m
 uOx5zG5xlvucSfTPaf9YaUEJ/OYpmDToDdEylLIfvOUcrCthrWoUkli1nL9mKYjR8oN/
 f8Xi08CQY+Xaa9d1dAEkWdxQuQD6awGmxxc7czwYkBGFeD+giw708ZSrPHaxvJ1Z1hsZ
 6rKcNmq74Ku9YyGM3xQE7vngN2HVjSHUfFm3405kaCjROG6DDukVZWv6RShVfwl1c5qp
 1c4SQGt13VR7HPVwaYC2n707oBHeL8yab61oP0YaY8VSyK0nWhhDxyk86I3r5mVZCKHQ
 +tVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3bqX2hAe2Sjw2v5YRDxIGUXWsq30Bbv7KtpnLqEB4zE=;
 b=UHcKqXJZSXKWxpH0WGOeuBBkjT1VAknNp1SpBsPm8TdrS1MU81QAQm76BYvPWIGELl
 GE8FrZ6GJhVgMwRpw3FXBjptTU00IuYctSr/KBp8iJUhQkjnQ3SKL5x26F5OeHliUWQg
 Cuu5CGWW6K1xdQNPRovJLRE03MtBVT3ldNh93+TqWZ9UFbufdVg1FD9HSe60lYVKV1Gx
 sKVINM+hG71hFCfdR5+B7tZevqZWwJ3mtk05dGBp0/61Adu7lsIgVnykDERqNi0MYIp5
 vszfb7lmekvFr71B8vm2FZHtBoRlaMZjooRqmd1WZ69FJUqSIzE6Q7NB15++M7auwJQr
 vlMg==
X-Gm-Message-State: AOAM5338zhli6OWzYs8z+plZ7/oK0q352n5MTrqQTmrVJ+/u7EF7EAP8
 U8ZmRx7BMuO/uyjPoOvKw+NdDVEU1fHlcw==
X-Google-Smtp-Source: ABdhPJwIHXMFvuYdtCbMHK9zlrhdVd8OSviCFmQoJUf5fbKR19ZSwMwA5YlozlhhcJQiXC9+Gwka1w==
X-Received: by 2002:a17:90b:3e8d:b0:1e0:3d95:a0e1 with SMTP id
 rj13-20020a17090b3e8d00b001e03d95a0e1mr834551pjb.61.1653338875464; 
 Mon, 23 May 2022 13:47:55 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:47:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 11/18] target/arm: Move arm_debug_target_el to internals.h
Date: Mon, 23 May 2022 13:47:35 -0700
Message-Id: <20220523204742.740932-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523204742.740932-1-richard.henderson@linaro.org>
References: <20220523204742.740932-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

This function is private to the implementation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       | 21 ---------------------
 target/arm/internals.h | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 92c9758e86..90cdc7b1de 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2967,27 +2967,6 @@ typedef enum ARMASIdx {
     ARMASIdx_TagS = 3,
 } ARMASIdx;
 
-/* Return the Exception Level targeted by debug exceptions. */
-static inline int arm_debug_target_el(CPUARMState *env)
-{
-    bool secure = arm_is_secure(env);
-    bool route_to_el2 = false;
-
-    if (arm_is_el2_enabled(env)) {
-        route_to_el2 = env->cp15.hcr_el2 & HCR_TGE ||
-                       env->cp15.mdcr_el2 & MDCR_TDE;
-    }
-
-    if (route_to_el2) {
-        return 2;
-    } else if (arm_feature(env, ARM_FEATURE_EL3) &&
-               !arm_el_is_aa64(env, 3) && secure) {
-        return 3;
-    } else {
-        return 1;
-    }
-}
-
 static inline bool arm_v7m_csselr_razwi(ARMCPU *cpu)
 {
     /* If all the CLIDR.Ctypem bits are 0 there are no caches, and
diff --git a/target/arm/internals.h b/target/arm/internals.h
index bb45100f06..685214503b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1068,6 +1068,27 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
 
 int exception_target_el(CPUARMState *env, int cur_el, uint32_t *psyn);
 
+/* Return the Exception Level targeted by debug exceptions. */
+static inline int arm_debug_target_el(CPUARMState *env)
+{
+    bool secure = arm_is_secure(env);
+    bool route_to_el2 = false;
+
+    if (arm_is_el2_enabled(env)) {
+        route_to_el2 = env->cp15.hcr_el2 & HCR_TGE ||
+                       env->cp15.mdcr_el2 & MDCR_TDE;
+    }
+
+    if (route_to_el2) {
+        return 2;
+    } else if (arm_feature(env, ARM_FEATURE_EL3) &&
+               !arm_el_is_aa64(env, 3) && secure) {
+        return 3;
+    } else {
+        return 1;
+    }
+}
+
 /* Determine if allocation tags are available.  */
 static inline bool allocation_tag_access_enabled(CPUARMState *env, int el,
                                                  uint64_t sctlr)
-- 
2.34.1


