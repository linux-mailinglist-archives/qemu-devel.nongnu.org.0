Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE437306C64
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 05:47:12 +0100 (CET)
Received: from localhost ([::1]:48566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4zD5-0006ai-Tp
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 23:47:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l4zBh-0004rC-BA
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 23:45:45 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:42812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l4zBd-000752-H6
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 23:45:45 -0500
Received: by mail-oi1-x232.google.com with SMTP id x71so4741568oia.9
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 20:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ePuzVxapvy6BI+DgasJj8U7j+a5TRswsXhKAbmvOk9g=;
 b=RKOHl+pOPNi0OysKozyRMRSWAo1S32bzdeHVZe9JVgrteCjnX8KNbXDp5Zj4tbUZ05
 Mp8ivoHoVhCVRA3OLxPBvwzmFwoJkBUOF9oHhQ3tpjT8nTgoFo/iOz2/wOUHe1GGWUtR
 BXI7DVQQtFjMJE9xcHhK7ENrUf8KcJWVL57+7QqlLfEdFjZIZ9lZKcaYYhTz+gARtf/Z
 1QLVW7LbwHHjxMszOPTwcW010sFJfCtg55QqhS6/wy8Zt8VS7HMGa6dUXfXmSymHIayq
 OLzLKjpoVYVSWldC0mRDCIcJ0G4l7ehEsyhUnoXClmHMK/bn/yjKS3BNwLht8a5hfmpy
 Rprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ePuzVxapvy6BI+DgasJj8U7j+a5TRswsXhKAbmvOk9g=;
 b=Q4Bwreqkpn9GeFjv6gDDIEe8At6sxFO7qnlBrTshcxrr+pKyd/z3G3hXYV3orsbUCo
 IHcAdRdV0OUut0cQFdLFsbDyEfLGn0xc38Nbro4YB69+KlUzBsETYC+HPn11TIUmPXVN
 jdiYgJ0Rsrp36n9ephwDB9QZkLKs+ihuPMNHARVsWqGMGu8NTFNbAExxv2UhMEaOlMZD
 3kMF1kBzD7p1dwzUX23tfoUiu4mA6fu+FtfpU+CLSfnrSyLpOn1LJoaarnQ1DPAUqY2m
 tnHe81RSuF0u6sUULfV/O3Rb01E5dIAnitQPRMw+uJFy2/5XDKPzLzj+AiWV4H40tZ+v
 7ebA==
X-Gm-Message-State: AOAM530ervrd+CRP1nVfrpkIcOWc8BzdvNJP5daQnB92oVnpDyZoN45T
 zgAACCM4FGGMChLUTQ4VypaRu4RYapZ3eB843cyR+y0ECIbFP+1bUzasfqmGDzvMzOj22BKHJjG
 pfvjV5gq4jzF/PzVl0NDdGi2jGKIQ4dESrUai+sjKsRkvM6PyUrCLwHd3XtqJf7S8puht3yY=
X-Google-Smtp-Source: ABdhPJzrj0T0ZLZ6tBRvuIrTPHFooso248EM5jJaysob7vzcdvxXapKpDKFz/Syz88ThNwyOq8fm4Q==
X-Received: by 2002:aca:6702:: with SMTP id z2mr5352335oix.149.1611809139454; 
 Wed, 27 Jan 2021 20:45:39 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id k198sm887399oih.33.2021.01.27.20.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 20:45:39 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/4] target/arm: Add support for FEAT_DIT,
 Data Independent Timing
Date: Wed, 27 Jan 2021 21:45:27 -0700
Message-Id: <20210128044529.1403-3-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128044529.1403-1-rebecca@nuviainc.com>
References: <20210128044529.1403-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=rebecca@nuviainc.com; helo=mail-oi1-x232.google.com
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
 Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for FEAT_DIT. DIT (Data Independent Timing) is a required
feature for ARMv8.4. Since virtual machine execution is largely
nondeterministic and TCG is outside of the security domain, it's
implemented as a NOP.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           | 12 +++++++++++
 target/arm/helper.c        | 22 ++++++++++++++++++++
 target/arm/internals.h     |  6 ++++++
 target/arm/translate-a64.c | 12 +++++++++++
 4 files changed, 52 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index df0d6778330f..56b1053dfdec 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1242,6 +1242,7 @@ void pmu_init(ARMCPU *cpu);
 #define CPSR_IT_2_7 (0xfc00U)
 #define CPSR_GE (0xfU << 16)
 #define CPSR_IL (1U << 20)
+#define CPSR_DIT (1U << 21)
 #define CPSR_PAN (1U << 22)
 #define CPSR_J (1U << 24)
 #define CPSR_IT_0_1 (3U << 25)
@@ -1309,6 +1310,7 @@ void pmu_init(ARMCPU *cpu);
 #define PSTATE_SS (1U << 21)
 #define PSTATE_PAN (1U << 22)
 #define PSTATE_UAO (1U << 23)
+#define PSTATE_DIT (1U << 24)
 #define PSTATE_TCO (1U << 25)
 #define PSTATE_V (1U << 28)
 #define PSTATE_C (1U << 29)
@@ -3875,6 +3877,11 @@ static inline bool isar_feature_aa32_tts2uxn(const ARMISARegisters *id)
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
@@ -4119,6 +4126,11 @@ static inline bool isar_feature_aa64_tts2uxn(const ARMISARegisters *id)
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
index 7b7e72ba878c..435208121e9f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4419,6 +4419,24 @@ static const ARMCPRegInfo uao_reginfo = {
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
@@ -8203,6 +8221,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_one_arm_cp_reg(cpu, &uao_reginfo);
     }
 
+    if (cpu_isar_feature(aa64_dit, cpu)) {
+        define_one_arm_cp_reg(cpu, &dit_reginfo);
+    }
+
     if (arm_feature(env, ARM_FEATURE_EL2) && cpu_isar_feature(aa64_vh, cpu)) {
         define_arm_cp_regs(cpu, vhe_reginfo);
     }
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 853fa88fd616..3d11e42d8e1b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1222,6 +1222,9 @@ static inline uint32_t aarch32_cpsr_valid_mask(uint64_t features,
     if (isar_feature_aa32_pan(id)) {
         valid |= CPSR_PAN;
     }
+    if (isar_feature_aa32_dit(id)) {
+        valid |= CPSR_DIT;
+    }
 
     return valid;
 }
@@ -1240,6 +1243,9 @@ static inline uint32_t aarch64_pstate_valid_mask(const ARMISARegisters *id)
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
index ffc060e5d70c..1c4b8d02f3b8 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1700,6 +1700,18 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
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
+        /* There's no need to rebuild hflags because DIT is a nop */
+        break;
+
     case 0x1e: /* DAIFSet */
         t1 = tcg_const_i32(crm);
         gen_helper_msr_i_daifset(cpu_env, t1);
-- 
2.26.2


