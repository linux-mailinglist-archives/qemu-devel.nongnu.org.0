Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 745BA60D1C1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:43:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMyB-00052Q-O8; Tue, 25 Oct 2022 12:40:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMy9-0004zr-24
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:02 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMy6-0001OR-Pg
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:00 -0400
Received: by mail-wr1-x431.google.com with SMTP id z14so8564697wrn.7
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hY0POGqFqW7EijffbvLzF0Tmz3qfnjEYn1YZBVrMPJY=;
 b=lmY/TYV+Oquski4hdEXG79Ux52L2UHVXlPMIPix2t8mbt6UR3r/6iX9kHa2WSvvv8G
 +UJyk4zQl0Nni58BH5HVYlVhPyhsRJFGGBv8/C69wJStUk5e1vmnY94HyxK4Q3qbcOVF
 hsMDyCK7Xv7SrRI+hpyEu/6mXgXQkeEaaUG0CJcbctGElsw5bkt7e2QduU1Jcdh/8O8C
 +mTMfSwnPJ/frREB1VFr8YYvG5qoVmdgfkIpkfxQjDKkO0GvuM5aPLupnQdNneKnEEMJ
 OThTSyQpOY2P7Tk+JWR4iHVvXWx0QQZXyq79mZxdBhOjqtL7tDLnExpZql3yQ+4SkDXx
 /Wlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hY0POGqFqW7EijffbvLzF0Tmz3qfnjEYn1YZBVrMPJY=;
 b=o4tpoY4+fPUZC3kWEeldYApPEbtRNmGzUwMBQfrgJTam10iNdAIP3Nmqgo7xAj1QqG
 j5+DK1Z0TOggqUA9nsB2h12S/I3mluUaGmCRz62WDDyZjRd/8SV+TDLIDCjALnRu85sS
 RJApAvC+R+LKubWACjK+ONKo1YsHdadIZoRH6sBaIMdJYkSEEz5LuqZE6SwCLuiswuSL
 xn/yzAAmLUlxSIOV9b3reIh7snH1RcQYn9TGe6Z44midZ3Zv+1eiqQJ1dUNvTr/IS8YN
 mxh6wrocVOkV0mUekU9w9GCrOup3j2s4YGHfvDCoimGcEAvQChjIY8qISsvlNyEy5/Uf
 lvzQ==
X-Gm-Message-State: ACrzQf1YvhokkWMaPodyAOhQ/iWvp6Yar4Ui+TnZKd2GtapuZSYvpMEt
 gmbFkvXvSZ5X6xtMhdHAdhRD5X4EhY1kkg==
X-Google-Smtp-Source: AMsMyM4COY2qkaxTuhQEvx7mxvDHJxNSU3x9+cchOXNapPMEow2r3ao/xJWYHKRZb99vPjY0vZ8Gfg==
X-Received: by 2002:adf:d1ca:0:b0:236:737f:8dfa with SMTP id
 b10-20020adfd1ca000000b00236737f8dfamr7228369wrd.588.1666715996190; 
 Tue, 25 Oct 2022 09:39:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c220c00b003cd9c26a0basm2971084wml.40.2022.10.25.09.39.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:39:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/30] target/arm: Implement FEAT_E0PD
Date: Tue, 25 Oct 2022 17:39:23 +0100
Message-Id: <20221025163952.4131046-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025163952.4131046-1-peter.maydell@linaro.org>
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

FEAT_E0PD adds new bits E0PD0 and E0PD1 to TCR_EL1, which allow the
OS to forbid EL0 access to half of the address space.  Since this is
an EL0-specific variation on the existing TCR_ELx.{EPD0,EPD1}, we can
implement it entirely in aa64_va_parameters().

This requires moving the existing regime_is_user() to internals.h
so that the code in helper.c can get at it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20221021160131.3531787-1-peter.maydell@linaro.org
---
 docs/system/arm/emulation.rst |  1 +
 target/arm/cpu.h              |  5 +++++
 target/arm/internals.h        | 19 +++++++++++++++++++
 target/arm/cpu64.c            |  1 +
 target/arm/helper.c           |  9 +++++++++
 target/arm/ptw.c              | 19 -------------------
 6 files changed, 35 insertions(+), 19 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index cfb4b0768b0..fd61360a086 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -24,6 +24,7 @@ the following architecture extensions:
 - FEAT_Debugv8p4 (Debug changes for v8.4)
 - FEAT_DotProd (Advanced SIMD dot product instructions)
 - FEAT_DoubleFault (Double Fault Extension)
+- FEAT_E0PD (Preventing EL0 access to halves of address maps)
 - FEAT_ETS (Enhanced Translation Synchronization)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 64fc03214c1..f8c59858063 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4139,6 +4139,11 @@ static inline bool isar_feature_aa64_lva(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, VARANGE) != 0;
 }
 
+static inline bool isar_feature_aa64_e0pd(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, E0PD) != 0;
+}
+
 static inline bool isar_feature_aa64_tts2uxn(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, XNX) != 0;
diff --git a/target/arm/internals.h b/target/arm/internals.h
index c3c3920ded2..c8c5ca7b934 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -707,6 +707,25 @@ static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
+static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    switch (mmu_idx) {
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_MUser:
+    case ARMMMUIdx_MSUser:
+    case ARMMMUIdx_MUserNegPri:
+    case ARMMMUIdx_MSUserNegPri:
+        return true;
+    default:
+        return false;
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_E10_1_PAN:
+        g_assert_not_reached();
+    }
+}
+
 /* Return the SCTLR value which controls this address translation regime */
 static inline uint64_t regime_sctlr(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 85e0d1daf1c..da95eabab5e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1185,6 +1185,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR2, FWB, 1);      /* FEAT_S2FWB */
     t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1);      /* FEAT_TTL */
     t = FIELD_DP64(t, ID_AA64MMFR2, BBM, 2);      /* FEAT_BBM at level 2 */
+    t = FIELD_DP64(t, ID_AA64MMFR2, E0PD, 1);     /* FEAT_E0PD */
     cpu->isar.id_aa64mmfr2 = t;
 
     t = cpu->isar.id_aa64zfr0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c672903f432..252651a8d19 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10491,6 +10491,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         ps = extract32(tcr, 16, 3);
         ds = extract64(tcr, 32, 1);
     } else {
+        bool e0pd;
+
         /*
          * Bit 55 is always between the two regions, and is canonical for
          * determining if address tagging is enabled.
@@ -10502,15 +10504,22 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             epd = extract32(tcr, 7, 1);
             sh = extract32(tcr, 12, 2);
             hpd = extract64(tcr, 41, 1);
+            e0pd = extract64(tcr, 55, 1);
         } else {
             tsz = extract32(tcr, 16, 6);
             gran = tg1_to_gran_size(extract32(tcr, 30, 2));
             epd = extract32(tcr, 23, 1);
             sh = extract32(tcr, 28, 2);
             hpd = extract64(tcr, 42, 1);
+            e0pd = extract64(tcr, 56, 1);
         }
         ps = extract64(tcr, 32, 3);
         ds = extract64(tcr, 59, 1);
+
+        if (e0pd && cpu_isar_feature(aa64_e0pd, cpu) &&
+            regime_is_user(env, mmu_idx)) {
+            epd = true;
+        }
     }
 
     gran = sanitize_gran_size(cpu, gran, stage2);
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6c5ed56a101..aed6f92d6f6 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -104,25 +104,6 @@ static bool regime_translation_big_endian(CPUARMState *env, ARMMMUIdx mmu_idx)
     return (regime_sctlr(env, mmu_idx) & SCTLR_EE) != 0;
 }
 
-static bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx) {
-    case ARMMMUIdx_E20_0:
-    case ARMMMUIdx_Stage1_E0:
-    case ARMMMUIdx_MUser:
-    case ARMMMUIdx_MSUser:
-    case ARMMMUIdx_MUserNegPri:
-    case ARMMMUIdx_MSUserNegPri:
-        return true;
-    default:
-        return false;
-    case ARMMMUIdx_E10_0:
-    case ARMMMUIdx_E10_1:
-    case ARMMMUIdx_E10_1_PAN:
-        g_assert_not_reached();
-    }
-}
-
 /* Return the TTBR associated with this translation regime */
 static uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn)
 {
-- 
2.25.1


