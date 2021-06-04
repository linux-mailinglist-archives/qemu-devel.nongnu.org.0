Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C51339BD3A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:33:24 +0200 (CEST)
Received: from localhost ([::1]:57726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCl9-0006qu-KO
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCHb-0007iu-BJ
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:02:51 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCHS-0005iV-Ku
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:02:51 -0400
Received: by mail-wr1-x435.google.com with SMTP id c5so9793484wrq.9
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KFXdupVdeAnSfunCtZQNKO6+//sRzqaD3i4QyYWExWo=;
 b=EWIBS1imBQS8e8FjiILHdMdtM6O+ZJB0YUmjyTfJo0Hv8D+MCpAlQq2dEaAfVqm6Zk
 LFFXiMQl0sKZuuzDJuxbcdBgN855xptbvbSBkuZIL+Mrt9s9WxNOyW7zWeJhtaq3jNqm
 740aueAjyc6X+YahPUCVSK+WZBUbhLKDIvZValekPtSj1Wysyk12EbqpTt82Q08bk0+Y
 5iwczK7C8Vy6UunvvbFBSflAo8KdqKdljlIRhOFfsPCVypiQ5ZnLlqhGJUyvsty2rkmX
 LTv896m/KYscSfvpwWzEtVtSGecCqwJ3lBHMEg2mKOl+6LgGJWT/7s1EprlU/BFWbLNc
 ooPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KFXdupVdeAnSfunCtZQNKO6+//sRzqaD3i4QyYWExWo=;
 b=oqdBWEVQfmd62xA98lvsJFjmu2obB0pNAjE3JIY+EU5lLYxE08t0ZI6Sk+7BUJs9xo
 hJ8KdX0aWLuMJKTO850Eqd7sWmC7uX3Rf42bESTO1Rou4NwFDWaLcTh3JnvaE8rc28qN
 H/qhvg1ijCNt1jbR2AdFWmvqrudCCzFLxQFZtQXug6u9FjkW9sAJ3Ugx7XtE7aSY6Cn4
 PvRlPLB4L/BiUXJFiavoZlvxF+7/SGELp7OaNCcLQffhbgbL2dIo/ZhxPewzu0oV2cNa
 kh1DkdbcUsm92Tpfu4k6MnLRRefgurkd++uQn+TmnEU35l7mZfQp1/KPuPXLbo9978ys
 kKhA==
X-Gm-Message-State: AOAM533JYSn+d9tcdY2g6CZ3aIy9Fp0Jhrtvhfmj1vB+dO2aIP8Vmirj
 k8JDuAzsteeTe3nlcoY6yC1hEw==
X-Google-Smtp-Source: ABdhPJwsNFfJo+dczdJRUqWFv0CIx/BojoQ9uI6GUTdVlEAcgoBH37j9y+y06x9NEMghHfPYjyjx2A==
X-Received: by 2002:a5d:64a5:: with SMTP id m5mr4566198wrp.182.1622822561382; 
 Fri, 04 Jun 2021 09:02:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s1sm7503481wre.67.2021.06.04.09.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:02:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9026A20008;
 Fri,  4 Jun 2021 16:53:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 88/99] target/arm: cpu64: rename arm_cpu_finalize_features
Date: Fri,  4 Jun 2021 16:53:01 +0100
Message-Id: <20210604155312.15902-89-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

also remove the now useless ifdef TARGET_AARCH64 from the function

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-sve.h       | 2 +-
 target/arm/cpu.h           | 2 +-
 target/arm/tcg/cpu-pauth.h | 2 +-
 target/arm/cpu.c           | 2 +-
 target/arm/cpu64.c         | 4 +---
 target/arm/monitor.c       | 4 ++--
 6 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu-sve.h b/target/arm/cpu-sve.h
index c83508ea0a..85078550bb 100644
--- a/target/arm/cpu-sve.h
+++ b/target/arm/cpu-sve.h
@@ -25,7 +25,7 @@
 
 #include "cpu.h"
 
-/* called by arm_cpu_finalize_features in realizefn */
+/* called by aarch64_cpu_finalize_features in realizefn */
 bool cpu_sve_finalize_features(ARMCPU *cpu, Error **errp);
 
 /* add the CPU SVE properties */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 02e0fe5dbd..847d3628e9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2127,7 +2127,7 @@ static inline int arm_feature(CPUARMState *env, int feature)
     return (env->features & (1ULL << feature)) != 0;
 }
 
-void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp);
+void aarch64_cpu_finalize_features(ARMCPU *cpu, Error **errp);
 
 #if !defined(CONFIG_USER_ONLY)
 /* Return true if exception levels below EL3 are in secure state,
diff --git a/target/arm/tcg/cpu-pauth.h b/target/arm/tcg/cpu-pauth.h
index a0ef74dc77..b106b9cefc 100644
--- a/target/arm/tcg/cpu-pauth.h
+++ b/target/arm/tcg/cpu-pauth.h
@@ -25,7 +25,7 @@
 
 #include "cpu.h"
 
-/* called by arm_cpu_finalize_features in realizefn */
+/* called by aarch64_cpu_finalize_features in realizefn */
 bool cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
 
 /* add the CPU Pointer Authentication properties */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0adbf36347..fb04d768b5 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -843,7 +843,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
 #ifdef TARGET_AARCH64
-    arm_cpu_finalize_features(cpu, &local_err);
+    aarch64_cpu_finalize_features(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c762f3f07a..3058e2c273 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -469,11 +469,10 @@ static gchar *aarch64_gdb_arch_name(CPUState *cs)
     return g_strdup("aarch64");
 }
 
-void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
+void aarch64_cpu_finalize_features(ARMCPU *cpu, Error **errp)
 {
     Error *local_err = NULL;
 
-#ifdef TARGET_AARCH64
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         if (!cpu_sve_finalize_features(cpu, &local_err)) {
             error_propagate(errp, local_err);
@@ -492,7 +491,6 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
             }
         }
     }
-#endif /* TARGET_AARCH64 */
 
     if (kvm_enabled()) {
         kvm_arm_steal_time_finalize(cpu, &local_err);
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 95c1e72cd1..8a31c4dd04 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -186,7 +186,7 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
         }
 #ifdef TARGET_AARCH64
         if (!err) {
-            arm_cpu_finalize_features(ARM_CPU(obj), &err);
+            aarch64_cpu_finalize_features(ARM_CPU(obj), &err);
         }
 #endif /* TARGET_AARCH64 */
         visit_end_struct(visitor, NULL);
@@ -198,7 +198,7 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
         }
     } else {
 #ifdef TARGET_AARCH64
-        arm_cpu_finalize_features(ARM_CPU(obj), &error_abort);
+        aarch64_cpu_finalize_features(ARM_CPU(obj), &error_abort);
 #endif /* TARGET_AARCH64 */
     }
 
-- 
2.20.1


