Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F55D39BF84
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 20:24:25 +0200 (CEST)
Received: from localhost ([::1]:38212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpEUa-0004Pn-0i
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 14:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpET4-0000w1-6Q
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:22:50 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:46755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpET0-0000Nr-RO
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:22:49 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 h22-20020a05600c3516b02901a826f84095so1132628wmq.5
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 11:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fs4mHduSC7s6AOHhF5ZFH6VJI9TQw9c8e27N4ga4IHk=;
 b=Zh1DBO0X4/prlBXa4eTG/cGDvDbmsYYxiDHeHH9PZIqK0MpqCcOy7uFZdUBwJr21Bz
 kYWhxtwC8YrhMEV6UP8OKobH2ZnOQcH2ZVGI0dJ3fxU/ewTm1EQhHVwSwsajpmTHUssB
 piqKQ981vZQE/WI3JvPk/uCSE6qQieRdb3C6ohSPkb0YneMxPqL5WTMzJfFCCm3cSHer
 CzY2310Dbbnf6Aue0xfxGh8s7VH3D2lJcuWrFvlAr811KKEKRNX50V1u75UQfQPDLpmw
 sBO14K8fqQumR6v9fX9lUlXt8/KCOAUiNixfT6iV5hEQqqkBlY/u6n0wGcvYkZIlUVIy
 BnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fs4mHduSC7s6AOHhF5ZFH6VJI9TQw9c8e27N4ga4IHk=;
 b=ah/yPV2MHxoEaW5qLDZYEsVAvEsLwTco1x+pPwfB5m2hz/AFu7TwHi5KneYhmuWw0/
 wjlLHDGQfmJzTxIhvGJX0LE7hFXtPPsBpqCan0+aWyhD98Fng/34xrXh9/EocyX9ZQLs
 On7zdOF4rHrnmXg5CabqZtQVgwgYxlDKLghC/ZPcSmKYtODUKygKhHOgem9Z+IWeCP6t
 Y5249oym6sm1ZSVNMOfjQK1N5g0I/F1De3XcM7aFbzB8D2T4Lg6PRPsimTPI0YakytHk
 Jllg/UuhMx7gqH9Lb866t7HFc93SwGMzpw8H/ZIpUMV0fVwqC51jRq3xsQrCPMBh5caE
 2Avg==
X-Gm-Message-State: AOAM532w9mJHZ4tHleSewpJIgclDK6PkHS+80bD9BO/pAuHS1KSA6P/+
 gCXhr0jKNB67eHWEEZ3bGdqSIg==
X-Google-Smtp-Source: ABdhPJwlQaIdkNsdFsknvM0aojJ5EidOEExpMRnPs4QLGrEd/w/BBGqXRCUDYfhQGgfYx7d58QKawg==
X-Received: by 2002:a1c:bc06:: with SMTP id m6mr4965227wmf.74.1622830965405;
 Fri, 04 Jun 2021 11:22:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q19sm9085241wmc.44.2021.06.04.11.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 11:22:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8F0421FFBD;
 Fri,  4 Jun 2021 16:53:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v16 37/99] target/arm: move sve_zcr_len_for_el to common_cpu
Date: Fri,  4 Jun 2021 16:52:10 +0100
Message-Id: <20210604155312.15902-38-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

it is required by arch-dump.c and cpu.c, so apparently
we need this for KVM too

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-common.c | 43 +++++++++++++++++++++++++++++++++++++++++
 target/arm/tcg/helper.c | 33 -------------------------------
 2 files changed, 43 insertions(+), 33 deletions(-)

diff --git a/target/arm/cpu-common.c b/target/arm/cpu-common.c
index 040e06392a..a34f7f19d8 100644
--- a/target/arm/cpu-common.c
+++ b/target/arm/cpu-common.c
@@ -299,3 +299,46 @@ uint64_t arm_hcr_el2_eff(CPUARMState *env)
 
     return ret;
 }
+
+/*
+ * these are AARCH64-only, but due to the chain of dependencies,
+ * between HELPER prototypes, hflags, cpreg definitions and functions in
+ * tcg/ etc, it becomes incredibly messy to add what should be here:
+ *
+ * #ifdef TARGET_AARCH64
+ */
+
+static uint32_t sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
+{
+    uint32_t end_len;
+
+    end_len = start_len &= 0xf;
+    if (!test_bit(start_len, cpu->sve_vq_map)) {
+        end_len = find_last_bit(cpu->sve_vq_map, start_len);
+        assert(end_len < start_len);
+    }
+    return end_len;
+}
+
+/*
+ * Given that SVE is enabled, return the vector length for EL.
+ */
+uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    uint32_t zcr_len = cpu->sve_max_vq - 1;
+
+    if (el <= 1) {
+        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
+    }
+    if (el <= 2 && arm_feature(env, ARM_FEATURE_EL2)) {
+        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[2]);
+    }
+    if (arm_feature(env, ARM_FEATURE_EL3)) {
+        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
+    }
+
+    return sve_zcr_get_valid_len(cpu, zcr_len);
+}
+
+/* #endif TARGET_AARCH64 , see matching comment above */
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index a4630b4039..93fa3fa2a9 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -322,39 +322,6 @@ int sve_exception_el(CPUARMState *env, int el)
     return 0;
 }
 
-static uint32_t sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
-{
-    uint32_t end_len;
-
-    end_len = start_len &= 0xf;
-    if (!test_bit(start_len, cpu->sve_vq_map)) {
-        end_len = find_last_bit(cpu->sve_vq_map, start_len);
-        assert(end_len < start_len);
-    }
-    return end_len;
-}
-
-/*
- * Given that SVE is enabled, return the vector length for EL.
- */
-uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
-{
-    ARMCPU *cpu = env_archcpu(env);
-    uint32_t zcr_len = cpu->sve_max_vq - 1;
-
-    if (el <= 1) {
-        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
-    }
-    if (el <= 2 && arm_feature(env, ARM_FEATURE_EL2)) {
-        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[2]);
-    }
-    if (arm_feature(env, ARM_FEATURE_EL3)) {
-        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
-    }
-
-    return sve_zcr_get_valid_len(cpu, zcr_len);
-}
-
 void hw_watchpoint_update(ARMCPU *cpu, int n)
 {
     CPUARMState *env = &cpu->env;
-- 
2.20.1


