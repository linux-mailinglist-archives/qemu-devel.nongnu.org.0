Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE4955B91E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 12:25:54 +0200 (CEST)
Received: from localhost ([::1]:57192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5lwF-0005Al-6g
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 06:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltI-0002Ic-0o
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:48 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltD-0004rq-5v
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:47 -0400
Received: by mail-wr1-x436.google.com with SMTP id e28so7168599wra.0
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 03:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Ka8T6WbFRnliAmr+bft7mWOY5gWROhUwaTzzbJ3vo7o=;
 b=zaGklMlwCc7G726S4DHHILYmG8H9cY8UWqO+muTPPGQzrbCdwafx2G/ur6M4yPdyFA
 BAVA+i7yQZdul/EXZycBWYLMnxKaGMSlthdvpsY44HCQO8LW1HXdmh8m+o+JjuZKcMb4
 WQW3uDm+ucxfn9wfblfDded3oVw+0U3g3gFP0iReYLX6pzuC85T4m52zKWPb9VSPoJgQ
 QfJ6YoMNokfxSpTNq+ouYzC/jHS7jTYAkIkZVIJJgd1L/b0vzjTvIaWpL3TpWQZ9rlt5
 tpwBMuSj37XohkO+fuFDc6kYknwhJiZ10FoLP6MBTnUyEcKqWeT3cRHGFmis3TWD/j5L
 VOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ka8T6WbFRnliAmr+bft7mWOY5gWROhUwaTzzbJ3vo7o=;
 b=h8to+n9gOHo+BjFcGCIHQUtzJbgp0tcxDL9yy0uMUdVVQy7rm/JLobcdtool1K6RFt
 KsPE7j/Qw+jlYMsfUUFQ/IIifpPtV0+mb4CmGSC6rDlrFLn1PpHScHlxS7RmFjQ6r3SR
 FyzFoyYd4ScKh552E35+waPDPSbasWkLdOb7ND6duqjwEOLQ2Q+B729D3ySXehjJ1uiz
 XGoOCEhzeuXBACZP8PTw0DJLhQpERkMLOH+Kv0FXgWcMAyZ7WTN78Q2iulwMZKtGVXjz
 KLFvHqdAbg/pJ6roOb0oiLWEScTYBmHnIL4zWIgsjBs3hKHisl79wZep1MtFsBMAcHLA
 yISQ==
X-Gm-Message-State: AJIora89/Ph/JdZA265dg2EKYb6/9NTgn8iGVHYbdjLKgBvdN401VPPK
 y9n9915aVz2uiIs6wEk+vzibfXwbEyQS1Q==
X-Google-Smtp-Source: AGRyM1sPs2eBzfKitmatuzvH3hgNI/JVyWYY4LB7RBtnDSwe/85WOPMzBxthWEt7Svl2MOtrjpWS8g==
X-Received: by 2002:adf:e350:0:b0:21a:3bc:7d85 with SMTP id
 n16-20020adfe350000000b0021a03bc7d85mr11453354wrj.400.1656325361571; 
 Mon, 27 Jun 2022 03:22:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a5d6dcb000000b0020e6ce4dabdsm9754335wrz.103.2022.06.27.03.22.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 03:22:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/25] target/arm: Implement TPIDR2_EL0
Date: Mon, 27 Jun 2022 11:22:15 +0100
Message-Id: <20220627102236.3097629-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627102236.3097629-1-peter.maydell@linaro.org>
References: <20220627102236.3097629-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

This register is part of SME, but isn't closely related to the
rest of the extension.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220620175235.60881-2-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    |  1 +
 target/arm/helper.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index df677b2d5d2..05d1e2e8dd1 100644
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
index 6457e6301cd..d21ba7ab836 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6279,6 +6279,35 @@ static const ARMCPRegInfo zcr_reginfo[] = {
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
@@ -8440,6 +8469,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     }
 
 #ifdef TARGET_AARCH64
+    if (cpu_isar_feature(aa64_sme, cpu)) {
+        define_arm_cp_regs(cpu, sme_reginfo);
+    }
     if (cpu_isar_feature(aa64_pauth, cpu)) {
         define_arm_cp_regs(cpu, pauth_reginfo);
     }
-- 
2.25.1


