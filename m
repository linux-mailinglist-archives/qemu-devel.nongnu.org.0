Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E4E51FC6B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:15:22 +0200 (CEST)
Received: from localhost ([::1]:47978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2IL-0002Qu-7T
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:15:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22a-0007Ng-FH
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:04 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22Y-0001GV-Hg
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:04 -0400
Received: by mail-wr1-x431.google.com with SMTP id v12so19069501wrv.10
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QFEFHrp8GnfgbZp41x52WMf8dTsWr28zOIoNVlzdXik=;
 b=nrADNp01sOuN1uEPaP6mfcXcHIQhZF4ZHH7O6iVuwNea0zRThtjthiH5f7jRbQDiuW
 Q6m3q6rrOl2IrU2LtKLJx9hBfVAdiYEaTPbY6lFp2aT+JQVDBACdt31VizL6NsjpFITk
 xLQ56oEyfg1Z2ty4X0OPiSdpPlR66kx/N7U+jJOl0Efr+m+P19baHddpIiDMT6i61usV
 iqSJyWNauqpFxQ0/C/6lqUUTpOOW8OudkW2t0MdjJLv3I4uZyWsR4DTAlYtKxzWkCOkL
 HqhEMFPes2lF60zEz+FaBYCxp/JNPpRZ3pgzFF+RpO7wBzqLQSn95nQRPyY4uOXjDXKk
 UcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QFEFHrp8GnfgbZp41x52WMf8dTsWr28zOIoNVlzdXik=;
 b=LUQUWbR1DxWD7/+Z0nql2R9Y9YnCKGVgM3cGZx+o5Qw97CoCYTHhSFWUJpDUABnUNZ
 e1sQQt4jxR7LC5w32OdLu7AyrQYDmlAs19ChMa8WXAaR99mQsZwpfrsgzav+N/7gA2Vc
 JbtjUaKh88qbrq9HIi7zxqiqkmwATejDMczK2pk9fLieBXhYukq1jDEolV9/PKAKY2rC
 bmXWqDajvnQAXfHEz8Zdte53IZxBXevf+PP+2NQ5xnJYcYvacU3hMVLyGbkWvoDkEdvl
 sq8FQ05q8hXNcCcuV3If6LdrSfUMr+WqD8ofrqXeAYtXZNRTiCF3AMam+iEZlb2ZOmLm
 5EbA==
X-Gm-Message-State: AOAM531nZ9MFry/EJdqI9Lku5Lp2Rgg18Vh/8BlK2tz4uRQ8IIIWX1YX
 udrQ9zWYxiA0eD6okMCf0jDKz5IUDTa6vg==
X-Google-Smtp-Source: ABdhPJwaAERPBDHdonrWuKvRs0iBwNcpiGQjrrwpDP2jZfVLWeUqTlxx1LfCipyWM+UsNrZ6oEdpqQ==
X-Received: by 2002:a05:6000:1f91:b0:20c:d301:2a57 with SMTP id
 bw17-20020a0560001f9100b0020cd3012a57mr228677wrb.400.1652097541638; 
 Mon, 09 May 2022 04:59:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8bdsm12199928wrb.9.2022.05.09.04.59.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:59:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/32] target/arm: Add minimal RAS registers
Date: Mon,  9 May 2022 12:58:30 +0100
Message-Id: <20220509115848.3521805-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509115848.3521805-1-peter.maydell@linaro.org>
References: <20220509115848.3521805-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

Add only the system registers required to implement zero error
records.  This means that all values for ERRSELR are out of range,
which means that it and all of the indexed error record registers
need not be implemented.

Add the EL2 registers required for injecting virtual SError.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220506180242.216785-14-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    |  5 +++
 target/arm/helper.c | 84 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ca01f909a86..a55980d66da 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -525,6 +525,11 @@ typedef struct CPUArchState {
         uint64_t tfsr_el[4]; /* tfsre0_el1 is index 0.  */
         uint64_t gcr_el1;
         uint64_t rgsr_el1;
+
+        /* Minimal RAS registers */
+        uint64_t disr_el1;
+        uint64_t vdisr_el2;
+        uint64_t vsesr_el2;
     } cp15;
 
     struct {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7b31c719806..37c5e42bc08 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5980,6 +5980,87 @@ static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
       .access = PL0_R, .type = ARM_CP_CONST|ARM_CP_64BIT, .resetvalue = 0 },
 };
 
+/*
+ * Check for traps to RAS registers, which are controlled
+ * by HCR_EL2.TERR and SCR_EL3.TERR.
+ */
+static CPAccessResult access_terr(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  bool isread)
+{
+    int el = arm_current_el(env);
+
+    if (el < 2 && (arm_hcr_el2_eff(env) & HCR_TERR)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    if (el < 3 && (env->cp15.scr_el3 & SCR_TERR)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
+static uint64_t disr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    int el = arm_current_el(env);
+
+    if (el < 2 && (arm_hcr_el2_eff(env) & HCR_AMO)) {
+        return env->cp15.vdisr_el2;
+    }
+    if (el < 3 && (env->cp15.scr_el3 & SCR_EA)) {
+        return 0; /* RAZ/WI */
+    }
+    return env->cp15.disr_el1;
+}
+
+static void disr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t val)
+{
+    int el = arm_current_el(env);
+
+    if (el < 2 && (arm_hcr_el2_eff(env) & HCR_AMO)) {
+        env->cp15.vdisr_el2 = val;
+        return;
+    }
+    if (el < 3 && (env->cp15.scr_el3 & SCR_EA)) {
+        return; /* RAZ/WI */
+    }
+    env->cp15.disr_el1 = val;
+}
+
+/*
+ * Minimal RAS implementation with no Error Records.
+ * Which means that all of the Error Record registers:
+ *   ERXADDR_EL1
+ *   ERXCTLR_EL1
+ *   ERXFR_EL1
+ *   ERXMISC0_EL1
+ *   ERXMISC1_EL1
+ *   ERXMISC2_EL1
+ *   ERXMISC3_EL1
+ *   ERXPFGCDN_EL1  (RASv1p1)
+ *   ERXPFGCTL_EL1  (RASv1p1)
+ *   ERXPFGF_EL1    (RASv1p1)
+ *   ERXSTATUS_EL1
+ * and
+ *   ERRSELR_EL1
+ * may generate UNDEFINED, which is the effect we get by not
+ * listing them at all.
+ */
+static const ARMCPRegInfo minimal_ras_reginfo[] = {
+    { .name = "DISR_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 1, .opc2 = 1,
+      .access = PL1_RW, .fieldoffset = offsetof(CPUARMState, cp15.disr_el1),
+      .readfn = disr_read, .writefn = disr_write, .raw_writefn = raw_write },
+    { .name = "ERRIDR_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 5, .crm = 3, .opc2 = 0,
+      .access = PL1_R, .accessfn = access_terr,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "VDISR_EL2", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 1, .opc2 = 1,
+      .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.vdisr_el2) },
+    { .name = "VSESR_EL2", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 2, .opc2 = 3,
+      .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.vsesr_el2) },
+};
+
 /* Return the exception level to which exceptions should be taken
  * via SVEAccessTrap.  If an exception should be routed through
  * AArch64.AdvSIMDFPAccessTrap, return 0; fp_exception_el should
@@ -8217,6 +8298,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_ssbs, cpu)) {
         define_one_arm_cp_reg(cpu, &ssbs_reginfo);
     }
+    if (cpu_isar_feature(any_ras, cpu)) {
+        define_arm_cp_regs(cpu, minimal_ras_reginfo);
+    }
 
     if (cpu_isar_feature(aa64_vh, cpu) ||
         cpu_isar_feature(aa64_debugv8p2, cpu)) {
-- 
2.25.1


