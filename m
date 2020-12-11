Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D782D6F8D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 06:17:42 +0100 (CET)
Received: from localhost ([::1]:33892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knaoH-0008Hm-9q
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 00:17:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1knal6-0005p7-G2
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 00:14:24 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:36265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1knal4-0001QC-Hb
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 00:14:24 -0500
Received: by mail-pg1-x52a.google.com with SMTP id w5so5586621pgj.3
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 21:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yk+UkyZ3zZHaivDH6FffLRUoNUblBlLI7PyiOu0Mpgc=;
 b=SAbVM5tsQS1VvNG/xnPmksqWiO3QKd5IkDxIS2ij5mSWQ7CAXQBiTOQfEB0xlVeMZv
 Q6DvU8OS8hcukD4Fau24coGUoJtSFzBYm952EaVKndww5VD14D8gEm0HQbE7tPHKajfm
 KV6BSU3iBQrVqReOG/GxR9DimY1TreMxuUSKL4gPeQqdwcwqePvT9f5mlyXBU7Nr6CMy
 JQigDpWUnkoGoJwg65HeCFsw+9v/uVU06/y6K0s+XnCF4NMuI4WRTdHWf1yBlB+QMhWb
 VK/r5Qacvgllw7wPn8LvO8gl75gwxaBQ6Qe7HsOQWYh/9lqN4M1qQ9eVk/j0HhFKfyOP
 PNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yk+UkyZ3zZHaivDH6FffLRUoNUblBlLI7PyiOu0Mpgc=;
 b=PB1k7R8cb6AGIZcxdkZ0wyf0wXmcxUdMwZ8tLiAwFVFp5MxI+W2dwGkTEHqsat7kvY
 bRuVOyXhhlOHcYV1Wt1pXVr5CtV5WaiagVozaHkF1z4OsKXlFAN4C4yUO/4AoGT17mT7
 sv9iGotZMTc3LPACJguqeVmrGOVbMVpBOeaiL3BSdh+4R1YLktCyWFFfBLMhmbtZlXb6
 5B++r7jdkgjtStAE6Aq7tdawp4YwtLcTMWkcgwp2EFfjoM+CVVroM0/GNgUVAK51IXpo
 TSZFp3aDQpPeyPg6/QIdz8aJaS8xRbc7ccb2miWUeHgQJ+k7Aa5MHTEr7+8+7Zm/DfDz
 wshw==
X-Gm-Message-State: AOAM532pj7Gwp4MfGjrs6JBgSetD1rYUY5KuIFC7fW3OB5vnI/3xOjZH
 DGtzxnvS4lmD5/IL7O4gO4s+b9FydzfO6or6rvHLrqa9xrRdZ7YSZzgLxsUXoREwH3dhfnf59pk
 nFlpSqfCJgslgYdMG/Wjcxqhm8pJv/64LIjVmkgWebllVnnLvg6PP26u99FnBvdreM1u1tIg77g
 ==
X-Google-Smtp-Source: ABdhPJxlalB0j7pFcqdIL2QsCRRP6OPCQMjOPYvHp1Su2JdVAl18YM2eE7K7Io3gjDl3mLu6qsvipw==
X-Received: by 2002:a62:844b:0:b029:19e:62a0:ca18 with SMTP id
 k72-20020a62844b0000b029019e62a0ca18mr9990456pfd.46.1607663660601; 
 Thu, 10 Dec 2020 21:14:20 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id h8sm8293554pfk.71.2020.12.10.21.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 21:14:20 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/arm: add support for FEAT_DIT,
 Data Independent Timing
Date: Thu, 10 Dec 2020 22:13:58 -0700
Message-Id: <20201211051359.3231-2-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201211051359.3231-1-rebecca@nuviainc.com>
References: <20201211051359.3231-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=rebecca@nuviainc.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Rebecca Cran <rebecca@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for FEAT_DIT. DIT (Data Independent Timing) is a required
feature for ARMv8.4. Since virtual machine execution is largely
nondeterministic, it's implemented as a NOP.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 target/arm/cpu.h           | 20 +++++++++++++-
 target/arm/helper.c        | 28 +++++++++++++++++++-
 target/arm/internals.h     |  6 +++++
 target/arm/translate-a64.c | 14 ++++++++++
 4 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4c9cbfbd9975..862be662cef7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -269,6 +269,7 @@ typedef struct CPUARMState {
     uint32_t NF; /* N is bit 31. All other bits are undefined.  */
     uint32_t ZF; /* Z set if zero.  */
     uint32_t QF; /* 0 or 1 */
+    uint32_t DIT; /* 0 or 1 */
     uint32_t GE; /* cpsr[19:16] */
     uint32_t thumb; /* cpsr[5]. 0 = arm mode, 1 = thumb mode. */
     uint32_t condexec_bits; /* IT bits.  cpsr[15:10,26:25].  */
@@ -1233,6 +1234,7 @@ void pmu_init(ARMCPU *cpu);
 #define CPSR_IT_2_7 (0xfc00U)
 #define CPSR_GE (0xfU << 16)
 #define CPSR_IL (1U << 20)
+#define CPSR_DIT (1U << 21)
 #define CPSR_PAN (1U << 22)
 #define CPSR_J (1U << 24)
 #define CPSR_IT_0_1 (3U << 25)
@@ -1266,6 +1268,7 @@ void pmu_init(ARMCPU *cpu);
 #define XPSR_Z CPSR_Z
 #define XPSR_N CPSR_N
 #define XPSR_NZCV CPSR_NZCV
+#define XPSR_DIT CPSR_DIT
 #define XPSR_IT CPSR_IT
 
 #define TTBCR_N      (7U << 0) /* TTBCR.EAE==0 */
@@ -1300,6 +1303,7 @@ void pmu_init(ARMCPU *cpu);
 #define PSTATE_SS (1U << 21)
 #define PSTATE_PAN (1U << 22)
 #define PSTATE_UAO (1U << 23)
+#define PSTATE_DIT (1U << 24)
 #define PSTATE_TCO (1U << 25)
 #define PSTATE_V (1U << 28)
 #define PSTATE_C (1U << 29)
@@ -1374,7 +1378,8 @@ static inline uint32_t xpsr_read(CPUARMState *env)
     ZF = (env->ZF == 0);
     return (env->NF & 0x80000000) | (ZF << 30)
         | (env->CF << 29) | ((env->VF & 0x80000000) >> 3) | (env->QF << 27)
-        | (env->thumb << 24) | ((env->condexec_bits & 3) << 25)
+        | (env->thumb << 24) | (env->DIT << 21)
+        | ((env->condexec_bits & 3) << 25)
         | ((env->condexec_bits & 0xfc) << 8)
         | (env->GE << 16)
         | env->v7m.exception;
@@ -1389,6 +1394,9 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
         env->CF = (val >> 29) & 1;
         env->VF = (val << 3) & 0x80000000;
     }
+    if (mask & XPSR_DIT) {
+        env->DIT = ((val & XPSR_DIT) != 0);
+    }
     if (mask & XPSR_Q) {
         env->QF = ((val & XPSR_Q) != 0);
     }
@@ -3823,6 +3831,11 @@ static inline bool isar_feature_aa32_tts2uxn(const ARMISARegisters *id)
     return FIELD_EX32(id->id_mmfr4, ID_MMFR4, XNX) != 0;
 }
 
+static inline bool isar_feature_aa32_dit(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_pfr0, ID_PFR0, DIT) != 0;
+}
+
 /*
  * 64-bit feature tests via id registers.
  */
@@ -4050,6 +4063,11 @@ static inline bool isar_feature_aa64_tts2uxn(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, XNX) != 0;
 }
 
+static inline bool isar_feature_aa64_dit(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, DIT) != 0;
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7b8bcd69030f..eb4979baceff 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4390,6 +4390,24 @@ static const ARMCPRegInfo uao_reginfo = {
     .readfn = aa64_uao_read, .writefn = aa64_uao_write
 };
 
+static uint64_t aa64_dit_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pstate & PSTATE_DIT;
+}
+
+static void aa64_dit_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                           uint64_t value)
+{
+    env->pstate = (env->pstate & ~PSTATE_DIT) | (value & PSTATE_DIT);
+}
+
+static const ARMCPRegInfo dit_reginfo = {
+    .name = "DIT", .state = ARM_CP_STATE_AA64,
+    .opc0 = 3, .opc1 = 3, .crn = 4, .crm = 2, .opc2 = 5,
+    .type = ARM_CP_NO_RAW, .access = PL0_RW,
+    .readfn = aa64_dit_read, .writefn = aa64_dit_write
+};
+
 static CPAccessResult aa64_cacheop_poc_access(CPUARMState *env,
                                               const ARMCPRegInfo *ri,
                                               bool isread)
@@ -8133,6 +8151,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_one_arm_cp_reg(cpu, &uao_reginfo);
     }
 
+    if (cpu_isar_feature(aa64_dit, cpu)) {
+        define_one_arm_cp_reg(cpu, &dit_reginfo);
+    }
+
     if (arm_feature(env, ARM_FEATURE_EL2) && cpu_isar_feature(aa64_vh, cpu)) {
         define_arm_cp_regs(cpu, vhe_reginfo);
     }
@@ -8740,7 +8762,8 @@ uint32_t cpsr_read(CPUARMState *env)
     ZF = (env->ZF == 0);
     return env->uncached_cpsr | (env->NF & 0x80000000) | (ZF << 30) |
         (env->CF << 29) | ((env->VF & 0x80000000) >> 3) | (env->QF << 27)
-        | (env->thumb << 5) | ((env->condexec_bits & 3) << 25)
+        | (env->DIT << 21) | (env->thumb << 5)
+        | ((env->condexec_bits & 3) << 25)
         | ((env->condexec_bits & 0xfc) << 8)
         | (env->GE << 16) | (env->daif & CPSR_AIF);
 }
@@ -8756,6 +8779,9 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
         env->CF = (val >> 29) & 1;
         env->VF = (val << 3) & 0x80000000;
     }
+    if (mask & CPSR_DIT) {
+        env->DIT = ((val & CPSR_DIT) != 0);
+    }
     if (mask & CPSR_Q)
         env->QF = ((val & CPSR_Q) != 0);
     if (mask & CPSR_T)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 5460678756d3..00ecfc174c80 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1186,6 +1186,9 @@ static inline uint32_t aarch32_cpsr_valid_mask(uint64_t features,
     if (isar_feature_aa32_pan(id)) {
         valid |= CPSR_PAN;
     }
+    if (isar_feature_aa32_dit(id)) {
+        valid |= CPSR_DIT;
+    }
 
     return valid;
 }
@@ -1204,6 +1207,9 @@ static inline uint32_t aarch64_pstate_valid_mask(const ARMISARegisters *id)
     if (isar_feature_aa64_uao(id)) {
         valid |= PSTATE_UAO;
     }
+    if (isar_feature_aa64_dit(id)) {
+        valid |= PSTATE_DIT;
+    }
     if (isar_feature_aa64_mte(id)) {
         valid |= PSTATE_TCO;
     }
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2e3fdfdf6ba8..0cafba6188c6 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1696,6 +1696,20 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         tcg_temp_free_i32(t1);
         break;
 
+    case 0x1a: /* DIT */
+        if (!dc_isar_feature(aa64_dit, s)) {
+            goto do_unallocated;
+        }
+        if (crm & 1) {
+            set_pstate_bits(PSTATE_DIT);
+        } else {
+            clear_pstate_bits(PSTATE_DIT);
+        }
+        t1 = tcg_const_i32(s->current_el);
+        gen_helper_rebuild_hflags_a64(cpu_env, t1);
+        tcg_temp_free_i32(t1);
+        break;
+
     case 0x1e: /* DAIFSet */
         t1 = tcg_const_i32(crm);
         gen_helper_msr_i_daifset(cpu_env, t1);
-- 
2.26.2


