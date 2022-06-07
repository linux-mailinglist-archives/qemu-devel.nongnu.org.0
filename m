Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E1554172D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:00:10 +0200 (CEST)
Received: from localhost ([::1]:45430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nygJ7-0000iy-7X
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftN-0007wH-Ck
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:33 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:33637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftI-0007L9-3V
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:33 -0400
Received: by mail-pf1-x432.google.com with SMTP id w21so16550583pfc.0
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZL65kXUjogqHvImAlQL3thwutvuDb7SzFLJksV0LJ4Y=;
 b=oyZCl3QeNSgnai4eb64j5o0WWhTfPMUEEAoEMEhb8iGHYBycW2wjHMcYPgnX0wZD0g
 mqIe9TEXte/Lg+oZ/9+WWCIPnvePQ6KafWAID1zMXkb7bX73ikfLRUaM3PyeyMDBcrPc
 UoPApnh5MzOyul2QCB+D1aPiUMB5iHmhVK8ae3NWm9Lc0R3YS0Lfm/zdgvsJjdwe4nUr
 t4Ols75QK6zfibyxEetK5Ia7LjY2iT+7oVLxyIl5oM4+US+R+G+JbEBjOyrZ38i2hsjf
 sBHCjOwyr3K2pxKWQaIw9MD8rvnb9UHnWkrD9LvnITSycfckHTz0CVwJJv2+qeLMrDRp
 lOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZL65kXUjogqHvImAlQL3thwutvuDb7SzFLJksV0LJ4Y=;
 b=GGE2bS2tfphtt4hUwbqFMTHbfm3OEaBIwge7fSHpQ8sFWcMvVnBE0eCRpmEwHVtgn4
 K/QZ9vRUwI1dtZ5p8yar3b36TJiur8+10Wg8P5wvTtHxXKvrY41UHiU+sUiEwS2SbPlI
 OmaIVNI2n4MzZdD/z2OhII62l7hhktGcxIux9RkoVwBnjjk1LpwgT2u/ZrHbAgo5jtJ9
 Y0deqO0WrYpgLoMeQD3az8oR4Kb7fLzxc8vQviF57rWukZGKNHzw/PwqihzFhNJAa4h8
 KZARA1nOAmGjQo9kwLPbDR29wP0Utow0HJzPkHGrZI3EVOwYMLwRj4ElQry8p2zrrpNq
 yvaA==
X-Gm-Message-State: AOAM53250QM5IMtI8ctmSlNZnRSuWcia8FFSkiYPRy7cHLyhI3195akP
 CQXx1NAYVaJ/qmYcx43O84ElLEv9tghm2w==
X-Google-Smtp-Source: ABdhPJwgyTzgNL/rJi/kSz5i2oJuwDtDf8CHTOkpezn8k6TRauXNQE5mRW4MZE6E7R0A38MJOalY+Q==
X-Received: by 2002:a63:4d16:0:b0:3fe:2062:60db with SMTP id
 a22-20020a634d16000000b003fe206260dbmr2022304pgb.214.1654634006641; 
 Tue, 07 Jun 2022 13:33:26 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 21/71] target/arm: Implement TPIDR2_EL0
Date: Tue,  7 Jun 2022 13:32:16 -0700
Message-Id: <20220607203306.657998-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

This register is part of SME, but isn't closely related to the
rest of the extension.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  1 +
 target/arm/helper.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 246371f93b..31094a9248 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -474,6 +474,7 @@ typedef struct CPUArchState {
             };
             uint64_t tpidr_el[4];
         };
+        uint64_t tpidr2_el0;
         /* The secure banks of these registers don't map anywhere */
         uint64_t tpidrurw_s;
         uint64_t tpidrprw_s;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 48534db0bd..616ea70c9e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6283,6 +6283,35 @@ static const ARMCPRegInfo zcr_reginfo[] = {
       .writefn = zcr_write, .raw_writefn = raw_write },
 };
 
+#ifdef TARGET_AARCH64
+static CPAccessResult access_tpidr2(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    bool isread)
+{
+    int el = arm_current_el(env);
+
+    if (el == 0) {
+        uint64_t sctlr = arm_sctlr(env, el);
+        if (!(sctlr & SCTLR_EnTP2)) {
+            return CP_ACCESS_TRAP;
+        }
+    }
+    /* TODO: FEAT_FGT */
+    if (el < 3
+        && arm_feature(env, ARM_FEATURE_EL3)
+        && !(env->cp15.scr_el3 & SCR_ENTP2)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
+static const ARMCPRegInfo sme_reginfo[] = {
+    { .name = "TPIDR2_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 13, .crm = 0, .opc2 = 5,
+      .access = PL0_RW, .accessfn = access_tpidr2,
+      .fieldoffset = offsetof(CPUARMState, cp15.tpidr2_el0) },
+};
+#endif /* TARGET_AARCH64 */
+
 void hw_watchpoint_update(ARMCPU *cpu, int n)
 {
     CPUARMState *env = &cpu->env;
@@ -8444,6 +8473,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     }
 
 #ifdef TARGET_AARCH64
+    if (cpu_isar_feature(aa64_sme, cpu)) {
+        define_arm_cp_regs(cpu, sme_reginfo);
+    }
     if (cpu_isar_feature(aa64_pauth, cpu)) {
         define_arm_cp_regs(cpu, pauth_reginfo);
     }
-- 
2.34.1


