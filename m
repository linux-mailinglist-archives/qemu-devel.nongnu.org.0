Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD01439BF97
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 20:27:37 +0200 (CEST)
Received: from localhost ([::1]:53278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpEXg-00064H-Rk
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 14:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpET5-00011x-I5
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:22:51 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpET3-0000Pe-BV
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:22:51 -0400
Received: by mail-wr1-x430.google.com with SMTP id u7so4751492wrs.10
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 11:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z78Q04mjV1LVORaYbrxDOeNi35S151UOcJPYVSic2GM=;
 b=pLtkDC7HeIb5DEaEcC2s1iOeouuq9rjcmMc+Kk30tJVcE1JDU/4vmaqp5SmD5mCm5M
 9hj+qudJQ5wpDfqSmCPh/lyYumOBD6tOLgRFB1M+1ueJlBUnp6v3azI9VPbOlZz5Fpc1
 MeAj7MYliku+hdpw28dZui6NktZB51xZ0PkoO2CHR11jOqw7LJlplIo/bXUqvMdDKfc8
 9OUCrlAqhWCteLCR2SRfV5R5UwCO61Y162qoxVO/dm2TPwrMkv1rmXeQ0ZofhBbsKShW
 Vh4SQR2uvuRCKV3QSJDuVYkwaX8mag4gZaEWTcZnZz5Wn0R+7xMiBYpVdPpwOjjD/XEq
 sPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z78Q04mjV1LVORaYbrxDOeNi35S151UOcJPYVSic2GM=;
 b=cC/ZsI4gexJONXIQ1hAt8tutFr5lsbZ1WG3d8OEzm3Mr3N46eRROqxyBgp3LBQoK3u
 GqE9QLrcavmrJcI1KwyokUA5QqIDB3/Ot+k2U2Qa4daDFvWDG4im9IOBNDq8YWv8yX5p
 MH5H6yab8lI1wWi5ABmaxry5xX+erfv6N+539GdNYAKLg/K+0m1ZAKIUXH2lnoR8ET7s
 4gFM8cOaGv3n9dUlZs7rHK9imavzDUH1toS/W4NOfnKoIciuljGp9Oof9g7mgrkIHSY6
 ZVBx26eN9nwKlAXFADNqJRskWQiCzTptqAV72KpngJS//FDifQudVBulr+J+OEbRrlss
 8Yqw==
X-Gm-Message-State: AOAM530Dsyt1TxifY5NYd6nKSgWEcEF5a6MzqGetCLYDg/u6QEJEszhg
 vG5F4FNgJQDj4RBeZ8zWco47JA==
X-Google-Smtp-Source: ABdhPJxBP2fgeakgxaALJTsQCBA5MGIMYnHyB/Sz+ndNiq80a0IfaBGzZL4/61IFdt+q0TVeu3i9Sg==
X-Received: by 2002:adf:ee85:: with SMTP id b5mr5168329wro.95.1622830967926;
 Fri, 04 Jun 2021 11:22:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x7sm8156479wre.8.2021.06.04.11.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 11:22:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2F1161FF7E;
 Fri,  4 Jun 2021 16:53:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 34/99] target/arm: move arm_hcr_el2_eff from tcg/ to
 common_cpu
Date: Fri,  4 Jun 2021 16:52:07 +0100
Message-Id: <20210604155312.15902-35-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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

we will need this for KVM too, especially for Nested support.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-common.c | 68 +++++++++++++++++++++++++++++++++++++++++
 target/arm/tcg/helper.c | 68 -----------------------------------------
 2 files changed, 68 insertions(+), 68 deletions(-)

diff --git a/target/arm/cpu-common.c b/target/arm/cpu-common.c
index 694e5d73f3..040e06392a 100644
--- a/target/arm/cpu-common.c
+++ b/target/arm/cpu-common.c
@@ -231,3 +231,71 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
     mask &= ~CACHED_CPSR_BITS;
     env->uncached_cpsr = (env->uncached_cpsr & ~mask) | (val & mask);
 }
+
+/*
+ * Return the effective value of HCR_EL2.
+ * Bits that are not included here:
+ * RW       (read from SCR_EL3.RW as needed)
+ */
+uint64_t arm_hcr_el2_eff(CPUARMState *env)
+{
+    uint64_t ret = env->cp15.hcr_el2;
+
+    if (!arm_is_el2_enabled(env)) {
+        /*
+         * "This register has no effect if EL2 is not enabled in the
+         * current Security state".  This is ARMv8.4-SecEL2 speak for
+         * !(SCR_EL3.NS==1 || SCR_EL3.EEL2==1).
+         *
+         * Prior to that, the language was "In an implementation that
+         * includes EL3, when the value of SCR_EL3.NS is 0 the PE behaves
+         * as if this field is 0 for all purposes other than a direct
+         * read or write access of HCR_EL2".  With lots of enumeration
+         * on a per-field basis.  In current QEMU, this is condition
+         * is arm_is_secure_below_el3.
+         *
+         * Since the v8.4 language applies to the entire register, and
+         * appears to be backward compatible, use that.
+         */
+        return 0;
+    }
+
+    /*
+     * For a cpu that supports both aarch64 and aarch32, we can set bits
+     * in HCR_EL2 (e.g. via EL3) that are RES0 when we enter EL2 as aa32.
+     * Ignore all of the bits in HCR+HCR2 that are not valid for aarch32.
+     */
+    if (!arm_el_is_aa64(env, 2)) {
+        uint64_t aa32_valid;
+
+        /*
+         * These bits are up-to-date as of ARMv8.6.
+         * For HCR, it's easiest to list just the 2 bits that are invalid.
+         * For HCR2, list those that are valid.
+         */
+        aa32_valid = MAKE_64BIT_MASK(0, 32) & ~(HCR_RW | HCR_TDZ);
+        aa32_valid |= (HCR_CD | HCR_ID | HCR_TERR | HCR_TEA | HCR_MIOCNCE |
+                       HCR_TID4 | HCR_TICAB | HCR_TOCU | HCR_TTLBIS);
+        ret &= aa32_valid;
+    }
+
+    if (ret & HCR_TGE) {
+        /* These bits are up-to-date as of ARMv8.6.  */
+        if (ret & HCR_E2H) {
+            ret &= ~(HCR_VM | HCR_FMO | HCR_IMO | HCR_AMO |
+                     HCR_BSU_MASK | HCR_DC | HCR_TWI | HCR_TWE |
+                     HCR_TID0 | HCR_TID2 | HCR_TPCP | HCR_TPU |
+                     HCR_TDZ | HCR_CD | HCR_ID | HCR_MIOCNCE |
+                     HCR_TID4 | HCR_TICAB | HCR_TOCU | HCR_ENSCXT |
+                     HCR_TTLBIS | HCR_TTLBOS | HCR_TID5);
+        } else {
+            ret |= HCR_FMO | HCR_IMO | HCR_AMO;
+        }
+        ret &= ~(HCR_SWIO | HCR_PTW | HCR_VF | HCR_VI | HCR_VSE |
+                 HCR_FB | HCR_TID1 | HCR_TID3 | HCR_TSC | HCR_TACR |
+                 HCR_TSW | HCR_TTLB | HCR_TVM | HCR_HCD | HCR_TRVM |
+                 HCR_TLOR);
+    }
+
+    return ret;
+}
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index d32f9659bc..e85e2bfed9 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -261,74 +261,6 @@ static int arm_gdb_set_svereg(CPUARMState *env, uint8_t *buf, int reg)
 }
 #endif /* TARGET_AARCH64 */
 
-/*
- * Return the effective value of HCR_EL2.
- * Bits that are not included here:
- * RW       (read from SCR_EL3.RW as needed)
- */
-uint64_t arm_hcr_el2_eff(CPUARMState *env)
-{
-    uint64_t ret = env->cp15.hcr_el2;
-
-    if (!arm_is_el2_enabled(env)) {
-        /*
-         * "This register has no effect if EL2 is not enabled in the
-         * current Security state".  This is ARMv8.4-SecEL2 speak for
-         * !(SCR_EL3.NS==1 || SCR_EL3.EEL2==1).
-         *
-         * Prior to that, the language was "In an implementation that
-         * includes EL3, when the value of SCR_EL3.NS is 0 the PE behaves
-         * as if this field is 0 for all purposes other than a direct
-         * read or write access of HCR_EL2".  With lots of enumeration
-         * on a per-field basis.  In current QEMU, this is condition
-         * is arm_is_secure_below_el3.
-         *
-         * Since the v8.4 language applies to the entire register, and
-         * appears to be backward compatible, use that.
-         */
-        return 0;
-    }
-
-    /*
-     * For a cpu that supports both aarch64 and aarch32, we can set bits
-     * in HCR_EL2 (e.g. via EL3) that are RES0 when we enter EL2 as aa32.
-     * Ignore all of the bits in HCR+HCR2 that are not valid for aarch32.
-     */
-    if (!arm_el_is_aa64(env, 2)) {
-        uint64_t aa32_valid;
-
-        /*
-         * These bits are up-to-date as of ARMv8.6.
-         * For HCR, it's easiest to list just the 2 bits that are invalid.
-         * For HCR2, list those that are valid.
-         */
-        aa32_valid = MAKE_64BIT_MASK(0, 32) & ~(HCR_RW | HCR_TDZ);
-        aa32_valid |= (HCR_CD | HCR_ID | HCR_TERR | HCR_TEA | HCR_MIOCNCE |
-                       HCR_TID4 | HCR_TICAB | HCR_TOCU | HCR_TTLBIS);
-        ret &= aa32_valid;
-    }
-
-    if (ret & HCR_TGE) {
-        /* These bits are up-to-date as of ARMv8.6.  */
-        if (ret & HCR_E2H) {
-            ret &= ~(HCR_VM | HCR_FMO | HCR_IMO | HCR_AMO |
-                     HCR_BSU_MASK | HCR_DC | HCR_TWI | HCR_TWE |
-                     HCR_TID0 | HCR_TID2 | HCR_TPCP | HCR_TPU |
-                     HCR_TDZ | HCR_CD | HCR_ID | HCR_MIOCNCE |
-                     HCR_TID4 | HCR_TICAB | HCR_TOCU | HCR_ENSCXT |
-                     HCR_TTLBIS | HCR_TTLBOS | HCR_TID5);
-        } else {
-            ret |= HCR_FMO | HCR_IMO | HCR_AMO;
-        }
-        ret &= ~(HCR_SWIO | HCR_PTW | HCR_VF | HCR_VI | HCR_VSE |
-                 HCR_FB | HCR_TID1 | HCR_TID3 | HCR_TSC | HCR_TACR |
-                 HCR_TSW | HCR_TTLB | HCR_TVM | HCR_HCD | HCR_TRVM |
-                 HCR_TLOR);
-    }
-
-    return ret;
-}
-
 /* Return the exception level to which exceptions should be taken
  * via SVEAccessTrap.  If an exception should be routed through
  * AArch64.AdvSIMDFPAccessTrap, return 0; fp_exception_el should
-- 
2.20.1


