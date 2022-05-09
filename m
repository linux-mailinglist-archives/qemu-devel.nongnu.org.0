Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D799751FC2A
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:06:53 +0200 (CEST)
Received: from localhost ([::1]:58864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2A8-0007Rp-U9
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22T-00074F-Ak
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:58:57 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:51108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22R-0001HE-Nn
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:58:57 -0400
Received: by mail-wm1-x330.google.com with SMTP id 129so8240189wmz.0
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ppR8M7ixk9OKU1weHfQnjLWTVAHBFdys9ITuaO8WXIs=;
 b=pdwa+SCC74XdaKZKT+1bADvrYieb+dWKs/IQ19Er+CcgcDC6Q+J47SPw2nuzys0khf
 ubZCLZvVLmiJyPa7W2EiULvtWAHv+pK0VFvuuZgPnDE4vVwUflF2tH3qXk1VzN+A6qSt
 UBbMuVQ9UvTbre53aPUmGQVuu3qB8cQZn3ND1yPTbq2nDkes7n0efYdItRkDIZKH9zi1
 dY5dC1vnTyH+MA9dQWeyQqgtZDVY9YqHmgMJ5+HCeCtExHx1Iqrdz082mGaNtdLg0xuu
 AceFKCUomY159mZMDkyTWuzbfIX/T98UD4XsvcH1f95WU/H1Zhe9zKa5WGMzOwhsVBJW
 +4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ppR8M7ixk9OKU1weHfQnjLWTVAHBFdys9ITuaO8WXIs=;
 b=ZTksA59LpiH/zsNgajRXEDc2zwjhqFIoxrZ81QChfScRqkY2acstte08287UFe+PE7
 Dr2+4EHbqY59tyRFE5K3gwgwBB9AdZGdCm0ZSsrXv/iXjt1ToGpTDAQO7S5gc+xiVXTJ
 Nq/wl05whnXLkvceE9mQ2Y2qCwvp7S+jNssgztzoVoE9Y+6YOD4jdv+xpeJLTBAxVSyx
 NQ7Ew9py6QeXdoABLdJ6EdaCJaqnYk2Nz7weTSO0f12UiFIoEj3NY7kzz2NIqtrBIosB
 lzBGr4G/uKBwoe2CASzvFRXhrUgTBa+Guam9jPAm8Xm3Owl1UOF8IDe5UQqekBP1oK7D
 y8Vw==
X-Gm-Message-State: AOAM53240ZURZNObQo8NiHqOYH1G7X+AAzyRW+6Y2AbW8TZc5IULxHZr
 rbMrvpCAj0bKdz4WNyxdFT/jjrwkynfwFg==
X-Google-Smtp-Source: ABdhPJx/kEnQ1o1H8hAIFoMDsW1HWgoUwoTunuCS89CbDsAZMrWPxngsJ7g1xp7IZoowWZqx/eZjrA==
X-Received: by 2002:a7b:c4d9:0:b0:394:41a:d36f with SMTP id
 g25-20020a7bc4d9000000b00394041ad36fmr15651014wmk.152.1652097534305; 
 Mon, 09 May 2022 04:58:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8bdsm12199928wrb.9.2022.05.09.04.58.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:58:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/32] target/arm: Adjust definition of CONTEXTIDR_EL2
Date: Mon,  9 May 2022 12:58:21 +0100
Message-Id: <20220509115848.3521805-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509115848.3521805-1-peter.maydell@linaro.org>
References: <20220509115848.3521805-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

This register is present for either VHE or Debugv8p2.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220506180242.216785-5-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 72d05070f02..7b31c719806 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7246,11 +7246,14 @@ static const ARMCPRegInfo jazelle_regs[] = {
       .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
 };
 
+static const ARMCPRegInfo contextidr_el2 = {
+    .name = "CONTEXTIDR_EL2", .state = ARM_CP_STATE_AA64,
+    .opc0 = 3, .opc1 = 4, .crn = 13, .crm = 0, .opc2 = 1,
+    .access = PL2_RW,
+    .fieldoffset = offsetof(CPUARMState, cp15.contextidr_el[2])
+};
+
 static const ARMCPRegInfo vhe_reginfo[] = {
-    { .name = "CONTEXTIDR_EL2", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 4, .crn = 13, .crm = 0, .opc2 = 1,
-      .access = PL2_RW,
-      .fieldoffset = offsetof(CPUARMState, cp15.contextidr_el[2]) },
     { .name = "TTBR1_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 1,
       .access = PL2_RW, .writefn = vmsa_tcr_ttbr_el2_write,
@@ -8215,6 +8218,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_one_arm_cp_reg(cpu, &ssbs_reginfo);
     }
 
+    if (cpu_isar_feature(aa64_vh, cpu) ||
+        cpu_isar_feature(aa64_debugv8p2, cpu)) {
+        define_one_arm_cp_reg(cpu, &contextidr_el2);
+    }
     if (arm_feature(env, ARM_FEATURE_EL2) && cpu_isar_feature(aa64_vh, cpu)) {
         define_arm_cp_regs(cpu, vhe_reginfo);
     }
-- 
2.25.1


