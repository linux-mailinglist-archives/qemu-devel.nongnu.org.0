Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3C43136AE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 16:15:25 +0100 (CET)
Received: from localhost ([::1]:52404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l98G1-0003xz-0V
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 10:15:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l90Us-0005C6-6Z
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 01:58:16 -0500
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:34777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l90UQ-0003xZ-0l
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 01:57:59 -0500
Received: by mail-io1-xd31.google.com with SMTP id f67so12103193ioa.1
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 22:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uvwq/YN8u5pObjxC65tOZ2S//OAZBWD2Zjjr6qZSwlg=;
 b=i/+jHsfz07pxGGD3iV9YN6SbHZgujCMhMh/M5dDcotF69Lf7IGTs9AvBWa5VVUHDx7
 zW846vc1E01fTXG4BwvfftOvDYIbp1LTe/a7ndmMgT6wH+FPvZI2jsSr1QhfVeZVcrH1
 x2+tNWrQdR5H+oKyKtoEcO/mWo7DSBsNwNZNqZaOoXvVCpOx6qeB1K/Yj812W5EaubOn
 lsksxCSA1GCv7XN6JCsKhcTQxbJbEhcBOxLGbbrGHt/wPMVWxpiHV2s4A/Gj1pdEFAby
 C/ECi0Kr2/cxIy4tiU2YI9sw/CFC7sFz4ecILIZDY/HvwD3OzCZ8h0k+YCSFKchVL9j+
 BkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uvwq/YN8u5pObjxC65tOZ2S//OAZBWD2Zjjr6qZSwlg=;
 b=fC+6tcHmZQiWgsObHT3NwXmLCMiv7mLFFEmXdqW0Dzvohi0F+vDth8VWA08Ve4wsYs
 r2P+9hm48z9C498UM2edVrHUgfHjcYDsfFi/O3wSssdGbq7A+j20l1CBDDszMy43amL0
 1zc1kt4O/G7sVqxaDuHgGJtlaZuioYN2tlJlCnWNA9kKYgjpipyWdcsSvr2FNvALwOeC
 3NA32udczLUYz6QzvM5VJkPbVJxvPnqfle8/wPvXsRIvoH2YF6BzCiRo5sFWPpYlN0QA
 QZKXuM6k0o20SYrZeUr+2aHYV3KpFSQy741hh76I53wOoCfdwFGr8XnmI5L7cNrfZ7pp
 xevQ==
X-Gm-Message-State: AOAM5328SvXAixiar3pD5gMnDq+7DgF5Bh1MrfqtBz2KQ9OcIsmVSKKX
 eEdsFKrXcJDDKVfADAV8gZ//nZyp2YusOC/uiPnCWp6OqFMgEvk4k4YJ6uuzqVsxBo2ssjpWauA
 2r+Tq+S9sDeWMxpLJ84R3rswdCQB4hV+T1Fze4iHRgYBouUwdEKDzO1dOuyJ18a2FO5LM+ZA=
X-Google-Smtp-Source: ABdhPJxHcgfDbG7isD+tfoFGpf4zI89UsvcG7fImEhPCbqEnuClDR7MJQn0odD0Ej1yYAzmMqKDbQQ==
X-Received: by 2002:a6b:fc16:: with SMTP id r22mr13510234ioh.102.1612767424468; 
 Sun, 07 Feb 2021 22:57:04 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id c19sm8335904ile.17.2021.02.07.22.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 22:57:03 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/4] target/arm: Add support for FEAT_DIT,
 Data Independent Timing
Date: Sun,  7 Feb 2021 23:56:57 -0700
Message-Id: <20210208065700.19454-2-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210208065700.19454-1-rebecca@nuviainc.com>
References: <20210208065700.19454-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=rebecca@nuviainc.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
index d080239863c0..2e5853928474 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1243,6 +1243,7 @@ void pmu_init(ARMCPU *cpu);
 #define CPSR_IT_2_7 (0xfc00U)
 #define CPSR_GE (0xfU << 16)
 #define CPSR_IL (1U << 20)
+#define CPSR_DIT (1U << 21)
 #define CPSR_PAN (1U << 22)
 #define CPSR_J (1U << 24)
 #define CPSR_IT_0_1 (3U << 25)
@@ -1310,6 +1311,7 @@ void pmu_init(ARMCPU *cpu);
 #define PSTATE_SS (1U << 21)
 #define PSTATE_PAN (1U << 22)
 #define PSTATE_UAO (1U << 23)
+#define PSTATE_DIT (1U << 24)
 #define PSTATE_TCO (1U << 25)
 #define PSTATE_V (1U << 28)
 #define PSTATE_C (1U << 29)
@@ -3876,6 +3878,11 @@ static inline bool isar_feature_aa32_tts2uxn(const ARMISARegisters *id)
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
@@ -4120,6 +4127,11 @@ static inline bool isar_feature_aa64_tts2uxn(const ARMISARegisters *id)
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
index 1a64bd748ce5..ce6965b50d42 100644
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
@@ -8212,6 +8230,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
index 448982dd2f9f..b251fe44506b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1228,6 +1228,9 @@ static inline uint32_t aarch32_cpsr_valid_mask(uint64_t features,
     if (isar_feature_aa32_pan(id)) {
         valid |= CPSR_PAN;
     }
+    if (isar_feature_aa32_dit(id)) {
+        valid |= CPSR_DIT;
+    }
 
     return valid;
 }
@@ -1246,6 +1249,9 @@ static inline uint32_t aarch64_pstate_valid_mask(const ARMISARegisters *id)
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


