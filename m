Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31B3578568
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:30:08 +0200 (CEST)
Received: from localhost ([::1]:47572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRl9-0003eN-Pg
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHb-00027h-Ta
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:36 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:55997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHX-0003Ac-EI
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:34 -0400
Received: by mail-wm1-x335.google.com with SMTP id b6so6659574wmq.5
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 06:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ocRTy264UImfHohmga9Mhs3jVom81Fw75OT8Y228IS4=;
 b=zYdB1K1D8Mgxy1mZjmn/7C+MGLXOeGr5OxavMRBG7Aikr5TA7nSb7x4J9fV7LxFnmw
 Q5y4DXO+ie0uIZnONtTaMi4o5VXEq96Incb2aHpJe/NJ39voXx1xwfN27ewQF9G3XhXb
 yeI6vb0r0KrOaRFTROt5/J+TP6/rilqjQV0Mg1cYaRm0t35+LyK5G82Ny75cjOuiu0yX
 o4Dl6ZTxvd2dormwaR7r/MzSHNRBthLtxrX1Df3H+6rLvBkDQp25XkJJOlfFVGdO2c9g
 EvOK4YQ9fQzn528GEvlLoUE24g5D4Y3nQiOkFp+c9ZRlXakc2//IqkIt8dIFJQ+qTfoZ
 LuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ocRTy264UImfHohmga9Mhs3jVom81Fw75OT8Y228IS4=;
 b=lxViFgCF56a9iCLXvinabkaspf9VAbh6eNhAUvRA4AZ7tVWiY0n5HJ7dt6P+T6l/GZ
 6k7NPFjKqaP+WUInAEOdSc5P4AH4btlFVK64cT2nIrGa0Lz358sll1JGfjvsUWuvcfn4
 GT9n5XiPv4UBifQd23r7/9KdPdcY7mxG4jG/9Ho30bVXL5z7wFjvq3KYCJQupBrx0HK5
 3DtdyRWoHgLirfyvOyPvwwMUYbaVNzcs+BJbKpKO+mYm15ACSj5PIvSFMMxv+SkZJ50Y
 7kccoqY5x4hLbjDrbc9dQcjo9IAPoxhgTwXe8pb1YRWrGpWa/ZevvopVyFHhxW7Q7uN9
 lcaQ==
X-Gm-Message-State: AJIora9ohlXVAAJR0pmSR1V4NfiJ/oHUQ04TP5S0oiLyZkvZFSzbq6ZX
 V57lkaMdCTgcnsKmJHNinxt15+dak4uSJA==
X-Google-Smtp-Source: AGRyM1vXbiYvOXl2e6bp+Eibh1wldJAef25R2MXyga+FmUv640+4sK4UDImjGBAY0l7yeAVmCs73WQ==
X-Received: by 2002:a05:600c:5128:b0:3a3:2160:7a7b with SMTP id
 o40-20020a05600c512800b003a321607a7bmr4045wms.204.1658152769127; 
 Mon, 18 Jul 2022 06:59:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 id15-20020a05600ca18f00b003a31f1edfa7sm1805798wmb.41.2022.07.18.06.59.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 06:59:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/15] target/arm: Fold regime_tcr() and regime_tcr_value()
 together
Date: Mon, 18 Jul 2022 14:59:12 +0100
Message-Id: <20220718135920.13667-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718135920.13667-1-peter.maydell@linaro.org>
References: <20220718135920.13667-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

The only caller of regime_tcr() is now regime_tcr_value(); fold the
two together, and use the shorter and more natural 'regime_tcr'
name for the new function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220714132303.1287193-4-peter.maydell@linaro.org
---
 target/arm/internals.h  | 16 +++++-----------
 target/arm/helper.c     |  6 +++---
 target/arm/ptw.c        |  6 +++---
 target/arm/tlb_helper.c |  2 +-
 4 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index fa046124fa8..0a1eb20afce 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -777,26 +777,20 @@ static inline uint64_t regime_sctlr(CPUARMState *env, ARMMMUIdx mmu_idx)
     return env->cp15.sctlr_el[regime_el(env, mmu_idx)];
 }
 
-/* Return the TCR controlling this translation regime */
-static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
+/* Return the value of the TCR controlling this translation regime */
+static inline uint64_t regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     if (mmu_idx == ARMMMUIdx_Stage2) {
-        return &env->cp15.vtcr_el2;
+        return env->cp15.vtcr_el2.raw_tcr;
     }
     if (mmu_idx == ARMMMUIdx_Stage2_S) {
         /*
          * Note: Secure stage 2 nominally shares fields from VTCR_EL2, but
          * those are not currently used by QEMU, so just return VSTCR_EL2.
          */
-        return &env->cp15.vstcr_el2;
+        return env->cp15.vstcr_el2.raw_tcr;
     }
-    return &env->cp15.tcr_el[regime_el(env, mmu_idx)];
-}
-
-/* Return the raw value of the TCR controlling this translation regime */
-static inline uint64_t regime_tcr_value(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    return regime_tcr(env, mmu_idx)->raw_tcr;
+    return env->cp15.tcr_el[regime_el(env, mmu_idx)].raw_tcr;
 }
 
 /**
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c245922bb5d..8847f5b90ad 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4216,7 +4216,7 @@ static int vae1_tlbmask(CPUARMState *env)
 static int tlbbits_for_regime(CPUARMState *env, ARMMMUIdx mmu_idx,
                               uint64_t addr)
 {
-    uint64_t tcr = regime_tcr_value(env, mmu_idx);
+    uint64_t tcr = regime_tcr(env, mmu_idx);
     int tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
     int select = extract64(addr, 55, 1);
 
@@ -10158,7 +10158,7 @@ static int aa64_va_parameter_tcma(uint64_t tcr, ARMMMUIdx mmu_idx)
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data)
 {
-    uint64_t tcr = regime_tcr_value(env, mmu_idx);
+    uint64_t tcr = regime_tcr(env, mmu_idx);
     bool epd, hpd, using16k, using64k, tsz_oob, ds;
     int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
     ARMCPU *cpu = env_archcpu(env);
@@ -10849,7 +10849,7 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
 {
     CPUARMTBFlags flags = {};
     ARMMMUIdx stage1 = stage_1_mmu_idx(mmu_idx);
-    uint64_t tcr = regime_tcr_value(env, mmu_idx);
+    uint64_t tcr = regime_tcr(env, mmu_idx);
     uint64_t sctlr;
     int tbii, tbid;
 
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 16226d14233..e9959848d88 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -315,7 +315,7 @@ static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
                                      uint32_t *table, uint32_t address)
 {
     /* Note that we can only get here for an AArch32 PL0/PL1 lookup */
-    uint64_t tcr = regime_tcr_value(env, mmu_idx);
+    uint64_t tcr = regime_tcr(env, mmu_idx);
     int maskshift = extract32(tcr, 0, 3);
     uint32_t mask = ~(((uint32_t)0xffffffffu) >> maskshift);
     uint32_t base_mask;
@@ -824,7 +824,7 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
 static ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
                                           ARMMMUIdx mmu_idx)
 {
-    uint64_t tcr = regime_tcr_value(env, mmu_idx);
+    uint64_t tcr = regime_tcr(env, mmu_idx);
     uint32_t el = regime_el(env, mmu_idx);
     int select, tsz;
     bool epd, hpd;
@@ -998,7 +998,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     uint32_t attrs;
     int32_t stride;
     int addrsize, inputsize, outputsize;
-    uint64_t tcr = regime_tcr_value(env, mmu_idx);
+    uint64_t tcr = regime_tcr(env, mmu_idx);
     int ap, ns, xn, pxn;
     uint32_t el = regime_el(env, mmu_idx);
     uint64_t descaddrmask;
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index a2f87a5042d..5a709eab56f 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -20,7 +20,7 @@ bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
         return true;
     }
     if (arm_feature(env, ARM_FEATURE_LPAE)
-        && (regime_tcr_value(env, mmu_idx) & TTBCR_EAE)) {
+        && (regime_tcr(env, mmu_idx) & TTBCR_EAE)) {
         return true;
     }
     return false;
-- 
2.25.1


