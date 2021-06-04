Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CC339BD59
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:37:08 +0200 (CEST)
Received: from localhost ([::1]:43716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCok-0008Ca-LW
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCRU-0003E0-PV
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:13:06 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:55149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCRL-0003rr-E9
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:13:04 -0400
Received: by mail-wm1-x329.google.com with SMTP id o127so5694414wmo.4
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YLNKH6WMEOpMy9rbclft4o2lCy4Z7+mVhGSkPGtULLE=;
 b=EknOOgdUdP7RZfsZU2t6/2TJqfmiN7AvQ7GY/cTZ0Iei400/sBpXExpok5jn6i/mjF
 mve4BU73qU4B3sORAkOAgjnDZSt802eUqDVleFLRQbw1Z/MAU0xIBcvwRi8hNbNnHtNX
 ZeRQYlACHiFWPdgUlzJVag4i4UU3TXk0N2KTSmov3VuPl18R5nTSe2J5Jq8pi2YutFh6
 vBNtntVGf909NpqPpdAp37HU1MUTusNODW3/NFEBLftAQx/6ZV+Els3vHSIcBWqIYz8f
 4AiVOslN4ieIF96iPobJcMz/6IDA4sPnjuJ+Ocmii431oxEi+g1jQCpWMWyNlVpUKmYc
 OIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YLNKH6WMEOpMy9rbclft4o2lCy4Z7+mVhGSkPGtULLE=;
 b=UGqJbwfFpZYxFugHNlWxoJhZAxD9ZOQqDKkedcIOrrtK4gpzU5sSM2ZVrf2ltcO66G
 AWc/7whEW2l3I+FG8fqhF6lMNbZEP7X6dzIhcH9fOzzYteS0BXNsdPVQQ6iUprLECTle
 nsZ2dToVm8F77gWW+BFuNm9VzRm6ACRcRN5cipklHYnG93oCBOjNFCe3s2NaX5z0J3y+
 LMvPpoWSOgLGeVHNFNFzzs011HJroZGcdEilr+WvBcFdgz5+Y3OvswvVZvGaPUXvjb7W
 JcixxSzIfvYW4OSFXusDEsyYbQyVIPI5HbIzAHF8Y14m5fzNmxoNP0th3e3AfUvemP56
 x1Vg==
X-Gm-Message-State: AOAM53163r5oLP5kK/s5wswS6cS9gOiOQc37lGRCz900nXi86OSmy5hC
 yX+enyHQBRLJZKY8uFTHn3eJHw==
X-Google-Smtp-Source: ABdhPJw/CQLfVlqV4ClCXY5KLfMzQ+VT98gmjQQAQGb124xUO9CausihVeJ6y7lTV0GHoyffryjLzA==
X-Received: by 2002:a05:600c:4ba4:: with SMTP id
 e36mr3799460wmp.28.1622823173878; 
 Fri, 04 Jun 2021 09:12:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a12sm5974399wmj.36.2021.06.04.09.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:12:52 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D4AA71FFF6;
 Fri,  4 Jun 2021 16:53:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 82/99] target/arm: move sve_zcr_len_for_el to
 TARGET_AARCH64-only cpu-sve
Date: Fri,  4 Jun 2021 16:52:55 +0100
Message-Id: <20210604155312.15902-83-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

now that we handled the dependency between HELPER(), cpregs defs
and functions in tcg/,

we can make sve_zcr_len_for_el TARGET_AARCH64-only,
and move it to the cpu-sve module.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-sve.h    |  3 +++
 target/arm/cpu.h        |  4 ++--
 target/arm/arch_dump.c  |  1 +
 target/arm/cpu-common.c | 43 -----------------------------------------
 target/arm/cpu-sve.c    | 33 +++++++++++++++++++++++++++++++
 target/arm/cpu.c        |  4 ++++
 target/arm/tcg/cpregs.c |  1 +
 target/arm/tcg/helper.c |  4 ++++
 8 files changed, 48 insertions(+), 45 deletions(-)

diff --git a/target/arm/cpu-sve.h b/target/arm/cpu-sve.h
index 6ab74b1d8f..1512c56a6b 100644
--- a/target/arm/cpu-sve.h
+++ b/target/arm/cpu-sve.h
@@ -34,4 +34,7 @@ void cpu_sve_add_props(Object *obj);
 /* add the CPU SVE properties specific to the "MAX" CPU */
 void cpu_sve_add_props_max(Object *obj);
 
+/* return the vector length for EL */
+uint32_t sve_zcr_len_for_el(CPUARMState *env, int el);
+
 #endif /* CPU_SVE_H */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 3edf8bb4ec..e9bfb6f575 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -223,7 +223,8 @@ typedef struct ARMPACKey {
 } ARMPACKey;
 #else
 static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
-#endif
+
+#endif /* TARGET_AARCH64 */
 
 /* See the commentary above the TBFLAG field definitions.  */
 typedef struct CPUARMTBFlags {
@@ -1097,7 +1098,6 @@ void aarch64_sync_64_to_32(CPUARMState *env);
 
 int fp_exception_el(CPUARMState *env, int cur_el);
 int sve_exception_el(CPUARMState *env, int cur_el);
-uint32_t sve_zcr_len_for_el(CPUARMState *env, int el);
 
 /* you can call this signal handler from your SIGBUS and SIGSEGV
    signal handlers to inform the virtual CPU of exceptions. non zero
diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
index 9cc75a6fda..9b2e76f5a7 100644
--- a/target/arm/arch_dump.c
+++ b/target/arm/arch_dump.c
@@ -24,6 +24,7 @@
 #include "sysemu/dump.h"
 
 #ifdef TARGET_AARCH64
+#include "cpu-sve.h"
 
 /* struct user_pt_regs from arch/arm64/include/uapi/asm/ptrace.h */
 struct aarch64_user_regs {
diff --git a/target/arm/cpu-common.c b/target/arm/cpu-common.c
index f4a3780e9e..b7a199a8d6 100644
--- a/target/arm/cpu-common.c
+++ b/target/arm/cpu-common.c
@@ -301,49 +301,6 @@ uint64_t arm_hcr_el2_eff(CPUARMState *env)
     return ret;
 }
 
-/*
- * these are AARCH64-only, but due to the chain of dependencies,
- * between HELPER prototypes, hflags, cpreg definitions and functions in
- * tcg/ etc, it becomes incredibly messy to add what should be here:
- *
- * #ifdef TARGET_AARCH64
- */
-
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
-/* #endif TARGET_AARCH64 , see matching comment above */
-
 uint64_t arm_sctlr(CPUARMState *env, int el)
 {
     /* Only EL0 needs to be adjusted for EL1&0 or EL2&0. */
diff --git a/target/arm/cpu-sve.c b/target/arm/cpu-sve.c
index 24bffbba8b..e8e817e110 100644
--- a/target/arm/cpu-sve.c
+++ b/target/arm/cpu-sve.c
@@ -288,3 +288,36 @@ void cpu_sve_add_props_max(Object *obj)
 {
     object_property_add(obj, "sve-max-vq", "uint32", get_prop_max_vq, set_prop_max_vq, NULL, NULL);
 }
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
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b297d0e6aa..0e41854b92 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -23,7 +23,11 @@
 #include "target/arm/idau.h"
 #include "qapi/error.h"
 #include "cpu.h"
+
+#ifdef TARGET_AARCH64
 #include "cpu-sve.h"
+#endif /* TARGET_AARCH64 */
+
 #include "cpregs.h"
 
 #ifdef CONFIG_TCG
diff --git a/target/arm/tcg/cpregs.c b/target/arm/tcg/cpregs.c
index 9d4ac66281..c971dc6097 100644
--- a/target/arm/tcg/cpregs.c
+++ b/target/arm/tcg/cpregs.c
@@ -17,6 +17,7 @@
 #include "cpregs.h"
 
 #ifdef TARGET_AARCH64
+#include "cpu-sve.h"
 #include "tcg/tcg-sve.h"
 #endif /* TARGET_AARCH64 */
 
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index edc4b4cb4e..984dae7643 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -18,6 +18,10 @@
 #include "cpregs.h"
 #include "tcg-cpu.h"
 
+#ifdef TARGET_AARCH64
+#include "cpu-sve.h"
+#endif /* TARGET_AARCH64 */
+
 static int vfp_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
 {
     ARMCPU *cpu = env_archcpu(env);
-- 
2.20.1


