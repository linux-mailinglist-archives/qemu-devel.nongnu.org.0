Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A2C39BF00
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:41:49 +0200 (CEST)
Received: from localhost ([::1]:60174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDpM-0004P0-Hz
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpDNY-0000TB-0L
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 13:13:04 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpDNR-00028f-QQ
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 13:13:03 -0400
Received: by mail-wr1-x42d.google.com with SMTP id y7so5387707wrh.7
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 10:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=05nkHLjcRHyfDukFJajvGPGtE1+ijrzLS+mVjmVHqf8=;
 b=DodAKl7esocnjjL/SdHyoskpdivSLAuDP3NAJ35wJcmxAE4rrmKaa80TM3hjYhxRHN
 QFmSCWX/2cRPrLgWyhCMUdfn4CB4Z1omc9RE4J7Ajdmvx7r42a4x+ZpVzxP1lggrmOjV
 m2alL0J3LugU5AD0DUBWpMCt1J5iQ7nXFe/yqmelp7axmiiGCQm5kWGoKgrm2fbwxLn0
 3RX7LhRBGrH+6BOZde8sKNjrtj1r3mFcZ/YufbJUt5BMz7u861Bhlo2+19KPZxYHc6xa
 fJuUSElnLblI87nvh+vacSW5fBsdHUnzIu78FA3MW0/Sk+RH4qp2ZQBkoe05NITs1B5R
 GtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=05nkHLjcRHyfDukFJajvGPGtE1+ijrzLS+mVjmVHqf8=;
 b=Bc33fV12hdXf1bNSuTwWDBD4VB9q6A9JVrxTnOaAdzHR3KWdCnUUkQKfsew7l++tad
 Bw/u82sZM/+Qa799MyT+UgeQv9uDRxcZsYodFNcpcLd5wwaSmWXnVmFuuD4Yev+FqFoe
 9CCatuQx0wy4jM8KQdYAXS3mfgKPMJ9IJYy/1PuAnwlztoqoAx6txLciwjAVTAxudHEL
 KzM1uCch0PCryZ+iP2+qU/yzSph/KYxaAHAKz8/vV9V+XyN8IX3oJ517KmMZVHiPa5pP
 Babkc59f04m4Qfws7qajcU3MpUzYMwZGs7fpyvVAOizUvO1S4D91vfU8Zjr/2beTwuru
 76Lw==
X-Gm-Message-State: AOAM531tMs0s1x123I/jcyGFWHc7SuNElJTbthoOP4JSRbIRbbfGIELp
 tEGkIYOrxnSeO7BoNu0IVcW9aQ==
X-Google-Smtp-Source: ABdhPJzjIwtDlBNItvYql7yYx8wUbO6NCDfp+azpt35Qz2Mc0XiyIvuv/7VqCc5gfFAMuLBRQdpEZQ==
X-Received: by 2002:adf:f382:: with SMTP id m2mr4983685wro.394.1622826776475; 
 Fri, 04 Jun 2021 10:12:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q20sm9145301wrf.45.2021.06.04.10.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 10:12:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 73FBC1FFC4;
 Fri,  4 Jun 2021 16:53:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 45/99] target/arm: move sve_exception_el out of TCG helpers
Date: Fri,  4 Jun 2021 16:52:18 +0100
Message-Id: <20210604155312.15902-46-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

we need this for KVM too.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-sysemu.c | 62 +++++++++++++++++++++++++++++++++++++++
 target/arm/cpu-user.c   |  5 ++++
 target/arm/tcg/helper.c | 64 -----------------------------------------
 3 files changed, 67 insertions(+), 64 deletions(-)

diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
index 7a314bf805..7cc721fe68 100644
--- a/target/arm/cpu-sysemu.c
+++ b/target/arm/cpu-sysemu.c
@@ -348,3 +348,65 @@ void aarch64_sync_64_to_32(CPUARMState *env)
 
     env->regs[15] = env->pc;
 }
+
+/*
+ * Return the exception level to which exceptions should be taken
+ * via SVEAccessTrap.  If an exception should be routed through
+ * AArch64.AdvSIMDFPAccessTrap, return 0; fp_exception_el should
+ * take care of raising that exception.
+ * C.f. the ARM pseudocode function CheckSVEEnabled.
+ */
+int sve_exception_el(CPUARMState *env, int el)
+{
+    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
+
+    if (el <= 1 && (hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
+        bool disabled = false;
+
+        /*
+         * The CPACR.ZEN controls traps to EL1:
+         * 0, 2 : trap EL0 and EL1 accesses
+         * 1    : trap only EL0 accesses
+         * 3    : trap no accesses
+         */
+        if (!extract32(env->cp15.cpacr_el1, 16, 1)) {
+            disabled = true;
+        } else if (!extract32(env->cp15.cpacr_el1, 17, 1)) {
+            disabled = el == 0;
+        }
+        if (disabled) {
+            /* route_to_el2 */
+            return hcr_el2 & HCR_TGE ? 2 : 1;
+        }
+
+        /* Check CPACR.FPEN.  */
+        if (!extract32(env->cp15.cpacr_el1, 20, 1)) {
+            disabled = true;
+        } else if (!extract32(env->cp15.cpacr_el1, 21, 1)) {
+            disabled = el == 0;
+        }
+        if (disabled) {
+            return 0;
+        }
+    }
+
+    /*
+     * CPTR_EL2.  Since TZ and TFP are positive,
+     * they will be zero when EL2 is not present.
+     */
+    if (el <= 2 && arm_is_el2_enabled(env)) {
+        if (env->cp15.cptr_el[2] & CPTR_TZ) {
+            return 2;
+        }
+        if (env->cp15.cptr_el[2] & CPTR_TFP) {
+            return 0;
+        }
+    }
+
+    /* CPTR_EL3.  Since EZ is negative we must check for EL3.  */
+    if (arm_feature(env, ARM_FEATURE_EL3)
+        && !(env->cp15.cptr_el[3] & CPTR_EZ)) {
+        return 3;
+    }
+    return 0;
+}
diff --git a/target/arm/cpu-user.c b/target/arm/cpu-user.c
index 0225089e46..39093ade76 100644
--- a/target/arm/cpu-user.c
+++ b/target/arm/cpu-user.c
@@ -33,3 +33,8 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
 {
     return 1;
 }
+
+int sve_exception_el(CPUARMState *env, int el)
+{
+    return 0;
+}
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index 1c69a69d5a..8372089260 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -261,70 +261,6 @@ static int arm_gdb_set_svereg(CPUARMState *env, uint8_t *buf, int reg)
 }
 #endif /* TARGET_AARCH64 */
 
-/*
- * Return the exception level to which exceptions should be taken
- * via SVEAccessTrap.  If an exception should be routed through
- * AArch64.AdvSIMDFPAccessTrap, return 0; fp_exception_el should
- * take care of raising that exception.
- * C.f. the ARM pseudocode function CheckSVEEnabled.
- */
-int sve_exception_el(CPUARMState *env, int el)
-{
-#ifndef CONFIG_USER_ONLY
-    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
-
-    if (el <= 1 && (hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
-        bool disabled = false;
-
-        /*
-         * The CPACR.ZEN controls traps to EL1:
-         * 0, 2 : trap EL0 and EL1 accesses
-         * 1    : trap only EL0 accesses
-         * 3    : trap no accesses
-         */
-        if (!extract32(env->cp15.cpacr_el1, 16, 1)) {
-            disabled = true;
-        } else if (!extract32(env->cp15.cpacr_el1, 17, 1)) {
-            disabled = el == 0;
-        }
-        if (disabled) {
-            /* route_to_el2 */
-            return hcr_el2 & HCR_TGE ? 2 : 1;
-        }
-
-        /* Check CPACR.FPEN.  */
-        if (!extract32(env->cp15.cpacr_el1, 20, 1)) {
-            disabled = true;
-        } else if (!extract32(env->cp15.cpacr_el1, 21, 1)) {
-            disabled = el == 0;
-        }
-        if (disabled) {
-            return 0;
-        }
-    }
-
-    /*
-     * CPTR_EL2.  Since TZ and TFP are positive,
-     * they will be zero when EL2 is not present.
-     */
-    if (el <= 2 && arm_is_el2_enabled(env)) {
-        if (env->cp15.cptr_el[2] & CPTR_TZ) {
-            return 2;
-        }
-        if (env->cp15.cptr_el[2] & CPTR_TFP) {
-            return 0;
-        }
-    }
-
-    /* CPTR_EL3.  Since EZ is negative we must check for EL3.  */
-    if (arm_feature(env, ARM_FEATURE_EL3)
-        && !(env->cp15.cptr_el[3] & CPTR_EZ)) {
-        return 3;
-    }
-#endif
-    return 0;
-}
-
 void hw_watchpoint_update(ARMCPU *cpu, int n)
 {
     CPUARMState *env = &cpu->env;
-- 
2.20.1


