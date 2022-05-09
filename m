Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F11A51FC44
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:11:08 +0200 (CEST)
Received: from localhost ([::1]:39180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2EF-0004r5-8m
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22S-00072V-JN
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:58:56 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22Q-0001Gs-T9
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:58:56 -0400
Received: by mail-wr1-x432.google.com with SMTP id e2so19095769wrh.7
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=td1xtIAYO/HO2sfcsrTqOil4G/8JSLwPxSu0vY6fM+Q=;
 b=KQ5YJNr/ENfUtj1+7cHtGFS3se8DsQ0iM25ElXXWhkX7SF3ulWtYbya4NJKb+RHytc
 mgEqlT7d+FYQPH8zXVont2mCRaDAT1mj4xt6fqPJuGQYC0mmno7QXZQVN2UWhwQC9mg6
 Og/KSo1XdmWmDfCwB/JVVhin7g6DYZi1Sdcxgwo/7eQ0klnOzjb2DEi4BZWPSShBMS6B
 LqO31X+ASd5qTBVOWWhFKF1y6I2Qv+e+vGH46Wko//nXHAWTnsPio/9+ds4ynDs5bfqW
 7WKxhSKkheZf6Id26kpgtp63kKij42/UJ/AYuC8KQbnDbYOttf2QCWHvcV3hjKZF/FR7
 C3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=td1xtIAYO/HO2sfcsrTqOil4G/8JSLwPxSu0vY6fM+Q=;
 b=NwaA8nF2QRklpjXTf4eFivD8mUKWkufhaWpJv1Q0kcBZBxsAYWW9ebUTDVVhol3ESN
 0U2NnLQkiNMluXA1j0/80InjskzhfHA4U8g3qxlsjtnesVfM3kdPDpRU5u8n7P3AhccK
 avYw6ssWpnZYgdOxPVWd1Hlhm2PO/oijYHYVxf03SgWfyFgtRLICrC4I1o7etlNzmKgX
 ImbolRBBN+tzzyuCSCLaU8nqSYZx4bX22cO85mKpYJ4+Y58wyoQ/46Zc/A6pAvg4WYdq
 /mPzSuR3q4CFreIYEOh7MlKgBmcnyOi+ivOvluRDQA2wDuS8GYtM1XlduY2uQGijuvSC
 XQjg==
X-Gm-Message-State: AOAM533u+3GyXuPcgGLXqIyJ7unPlVuWm5TUVz/IQ796ADT3CwctR7Tl
 dC57PXch671HybEgqbs63R3tlx6PeTlr7g==
X-Google-Smtp-Source: ABdhPJxrOvC9TF4VLkUtPWvx/7nSk9gTo/uMB9dN/HdkLSoBd65fJCRP+x/wH/PltU/G1y7vXJl9PQ==
X-Received: by 2002:a5d:5085:0:b0:20a:e090:85ad with SMTP id
 a5-20020a5d5085000000b0020ae09085admr13387896wrt.235.1652097533587; 
 Mon, 09 May 2022 04:58:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8bdsm12199928wrb.9.2022.05.09.04.58.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:58:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/32] target/arm: Merge zcr reginfo
Date: Mon,  9 May 2022 12:58:20 +0100
Message-Id: <20220509115848.3521805-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509115848.3521805-1-peter.maydell@linaro.org>
References: <20220509115848.3521805-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

Drop zcr_no_el2_reginfo and merge the 3 registers into one array,
now that ZCR_EL2 can be squashed to RES0 and ZCR_EL3 dropped
while registering.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220506180242.216785-4-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 55 ++++++++++++++-------------------------------
 1 file changed, 17 insertions(+), 38 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ea2788b3d53..72d05070f02 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6122,35 +6122,22 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
-static const ARMCPRegInfo zcr_el1_reginfo = {
-    .name = "ZCR_EL1", .state = ARM_CP_STATE_AA64,
-    .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 2, .opc2 = 0,
-    .access = PL1_RW, .type = ARM_CP_SVE,
-    .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[1]),
-    .writefn = zcr_write, .raw_writefn = raw_write
-};
-
-static const ARMCPRegInfo zcr_el2_reginfo = {
-    .name = "ZCR_EL2", .state = ARM_CP_STATE_AA64,
-    .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 0,
-    .access = PL2_RW, .type = ARM_CP_SVE,
-    .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[2]),
-    .writefn = zcr_write, .raw_writefn = raw_write
-};
-
-static const ARMCPRegInfo zcr_no_el2_reginfo = {
-    .name = "ZCR_EL2", .state = ARM_CP_STATE_AA64,
-    .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 0,
-    .access = PL2_RW, .type = ARM_CP_SVE,
-    .readfn = arm_cp_read_zero, .writefn = arm_cp_write_ignore
-};
-
-static const ARMCPRegInfo zcr_el3_reginfo = {
-    .name = "ZCR_EL3", .state = ARM_CP_STATE_AA64,
-    .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 2, .opc2 = 0,
-    .access = PL3_RW, .type = ARM_CP_SVE,
-    .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[3]),
-    .writefn = zcr_write, .raw_writefn = raw_write
+static const ARMCPRegInfo zcr_reginfo[] = {
+    { .name = "ZCR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 2, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_SVE,
+      .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[1]),
+      .writefn = zcr_write, .raw_writefn = raw_write },
+    { .name = "ZCR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 0,
+      .access = PL2_RW, .type = ARM_CP_SVE,
+      .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[2]),
+      .writefn = zcr_write, .raw_writefn = raw_write },
+    { .name = "ZCR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 2, .opc2 = 0,
+      .access = PL3_RW, .type = ARM_CP_SVE,
+      .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[3]),
+      .writefn = zcr_write, .raw_writefn = raw_write },
 };
 
 void hw_watchpoint_update(ARMCPU *cpu, int n)
@@ -8233,15 +8220,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     }
 
     if (cpu_isar_feature(aa64_sve, cpu)) {
-        define_one_arm_cp_reg(cpu, &zcr_el1_reginfo);
-        if (arm_feature(env, ARM_FEATURE_EL2)) {
-            define_one_arm_cp_reg(cpu, &zcr_el2_reginfo);
-        } else {
-            define_one_arm_cp_reg(cpu, &zcr_no_el2_reginfo);
-        }
-        if (arm_feature(env, ARM_FEATURE_EL3)) {
-            define_one_arm_cp_reg(cpu, &zcr_el3_reginfo);
-        }
+        define_arm_cp_regs(cpu, zcr_reginfo);
     }
 
 #ifdef TARGET_AARCH64
-- 
2.25.1


