Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E53689BB3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:31:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx5G-0007HI-BY; Fri, 03 Feb 2023 09:30:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4c-0006jK-3L
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:55 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4Y-00057L-CA
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:53 -0500
Received: by mail-wm1-x330.google.com with SMTP id n13so4000889wmr.4
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0taStepCYELwMXmaZO+UXEgrJrJoHD0cnE+BYO0UISY=;
 b=D+ME8HfPbqx0RC/0muSsblIOPi+U8igcLPeD9AIrrZ+MmRd3GZ/hdEoulajlunHPx1
 RxT7+E7Pf502Tghcj/0nYAloxbdSc/sNDJZiBjhZY3sacVmmmlMsqCehPZqm44B5Jvqp
 5/8pLAl3fjHkIftiSR1dnahRTBpW2yBfVVjygmp4HEVRIgXLseJjhp1XvZaXpzU9QaI1
 hZogoBGVERbacHQdF1flpMHh2aYKLFdYhTTYzKOhQs97meJ87sQuRyEGOadgITSZX9dc
 9EPqteNZeudTsYgZ67qNSK/n0ysLYMMVvxc5aNAHr3rOJ4XbcC+cH8noK69+JceLQp1u
 qBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0taStepCYELwMXmaZO+UXEgrJrJoHD0cnE+BYO0UISY=;
 b=RJmvDkhVHtUezfaQkh8bjWw1fN5cNfuqIvwgGjCacuzbHppvGPiFpPor2AKX4OytfZ
 HP9Op02uRHcmIidltDE+ndrZhkw4n9ft1haXfOJUEAzp2VtPr1IDuCb9YRyAxzT/s3WD
 ATYGrCo1M/NJph+gUm5+iyH6a9ufoq/r+B8uPIBXiuG1PRS7bb5g9cJntjREdtgjI2mH
 r4nxCv4t0BPSzxo1C7trSE+9LX+qKPAmwSqLi7Pyyu+5N3uaVFMs25YcH+i58/s2Vkhk
 JwNIvo64NAZpYFOp+0wXa5fGvNA7+czUc6owsWK52CYxkifTtsQKQbeAe+yIrumTY7zt
 TDFw==
X-Gm-Message-State: AO0yUKUNZf/jutcU4VjXw6Nn0QtACv4LrYQyWtVkDRsATTXTJ6zaxd53
 x7sa5zoL0ZfNdMWJYjF7CRA1Aew7euh0KS0i
X-Google-Smtp-Source: AK7set+osC0w9lCIUlRm7moc946PYM2KM6eh0GOh5P6/t5Q5lC/AMw+WeSuKo4gH38n0KDLiN/0O0Q==
X-Received: by 2002:a05:600c:3513:b0:3df:b5ae:5289 with SMTP id
 h19-20020a05600c351300b003dfb5ae5289mr6773942wmq.8.1675434587760; 
 Fri, 03 Feb 2023 06:29:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/33] target/arm: Mark up sysregs for HFGRTR bits 24..35
Date: Fri,  3 Feb 2023 14:29:16 +0000
Message-Id: <20230203142927.834793-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
References: <20230203142927.834793-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Mark up the sysreg definitions for the registers trapped
by HFGRTR/HFGWTR bits 24..35.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Fuad Tabba <tabba@google.com>
Message-id: 20230130182459.3309057-13-peter.maydell@linaro.org
Message-id: 20230127175507.2895013-13-peter.maydell@linaro.org
---
 target/arm/cpregs.h | 12 ++++++++++++
 target/arm/helper.c | 14 ++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 67d87ae8bf5..1b219242d5d 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -603,6 +603,18 @@ typedef enum FGTBit {
     DO_BIT(HFGRTR, LORID_EL1),
     DO_BIT(HFGRTR, LORN_EL1),
     DO_BIT(HFGRTR, LORSA_EL1),
+    DO_BIT(HFGRTR, MAIR_EL1),
+    DO_BIT(HFGRTR, MIDR_EL1),
+    DO_BIT(HFGRTR, MPIDR_EL1),
+    DO_BIT(HFGRTR, PAR_EL1),
+    DO_BIT(HFGRTR, REVIDR_EL1),
+    DO_BIT(HFGRTR, SCTLR_EL1),
+    DO_BIT(HFGRTR, SCXTNUM_EL1),
+    DO_BIT(HFGRTR, SCXTNUM_EL0),
+    DO_BIT(HFGRTR, TCR_EL1),
+    DO_BIT(HFGRTR, TPIDR_EL1),
+    DO_BIT(HFGRTR, TPIDRRO_EL0),
+    DO_BIT(HFGRTR, TPIDR_EL0),
 } FGTBit;
 
 #undef DO_BIT
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c059935d0e6..9f6d9e2a3c9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2206,6 +2206,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
     { .name = "MAIR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 10, .crm = 2, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .fgt = FGT_MAIR_EL1,
       .fieldoffset = offsetof(CPUARMState, cp15.mair_el[1]),
       .resetvalue = 0 },
     { .name = "MAIR_EL3", .state = ARM_CP_STATE_AA64,
@@ -2349,25 +2350,30 @@ static const ARMCPRegInfo v6k_cp_reginfo[] = {
     { .name = "TPIDR_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .opc2 = 2, .crn = 13, .crm = 0,
       .access = PL0_RW,
+      .fgt = FGT_TPIDR_EL0,
       .fieldoffset = offsetof(CPUARMState, cp15.tpidr_el[0]), .resetvalue = 0 },
     { .name = "TPIDRURW", .cp = 15, .crn = 13, .crm = 0, .opc1 = 0, .opc2 = 2,
       .access = PL0_RW,
+      .fgt = FGT_TPIDR_EL0,
       .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.tpidrurw_s),
                              offsetoflow32(CPUARMState, cp15.tpidrurw_ns) },
       .resetfn = arm_cp_reset_ignore },
     { .name = "TPIDRRO_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .opc2 = 3, .crn = 13, .crm = 0,
       .access = PL0_R | PL1_W,
+      .fgt = FGT_TPIDRRO_EL0,
       .fieldoffset = offsetof(CPUARMState, cp15.tpidrro_el[0]),
       .resetvalue = 0},
     { .name = "TPIDRURO", .cp = 15, .crn = 13, .crm = 0, .opc1 = 0, .opc2 = 3,
       .access = PL0_R | PL1_W,
+      .fgt = FGT_TPIDRRO_EL0,
       .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.tpidruro_s),
                              offsetoflow32(CPUARMState, cp15.tpidruro_ns) },
       .resetfn = arm_cp_reset_ignore },
     { .name = "TPIDR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .opc2 = 4, .crn = 13, .crm = 0,
       .access = PL1_RW,
+      .fgt = FGT_TPIDR_EL1,
       .fieldoffset = offsetof(CPUARMState, cp15.tpidr_el[1]), .resetvalue = 0 },
     { .name = "TPIDRPRW", .opc1 = 0, .cp = 15, .crn = 13, .crm = 0, .opc2 = 4,
       .access = PL1_RW,
@@ -4164,6 +4170,7 @@ static const ARMCPRegInfo vmsa_cp_reginfo[] = {
     { .name = "TCR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .crn = 2, .crm = 0, .opc1 = 0, .opc2 = 2,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .fgt = FGT_TCR_EL1,
       .writefn = vmsa_tcr_el12_write,
       .raw_writefn = raw_write,
       .resetvalue = 0,
@@ -5399,6 +5406,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .type = ARM_CP_ALIAS,
       .opc0 = 3, .opc1 = 0, .crn = 7, .crm = 4, .opc2 = 0,
       .access = PL1_RW, .resetvalue = 0,
+      .fgt = FGT_PAR_EL1,
       .fieldoffset = offsetof(CPUARMState, cp15.par_el[1]),
       .writefn = par_write },
 #endif
@@ -7562,10 +7570,12 @@ static const ARMCPRegInfo scxtnum_reginfo[] = {
     { .name = "SCXTNUM_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 13, .crm = 0, .opc2 = 7,
       .access = PL0_RW, .accessfn = access_scxtnum,
+      .fgt = FGT_SCXTNUM_EL0,
       .fieldoffset = offsetof(CPUARMState, scxtnum_el[0]) },
     { .name = "SCXTNUM_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 13, .crm = 0, .opc2 = 7,
       .access = PL1_RW, .accessfn = access_scxtnum,
+      .fgt = FGT_SCXTNUM_EL1,
       .fieldoffset = offsetof(CPUARMState, scxtnum_el[1]) },
     { .name = "SCXTNUM_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 13, .crm = 0, .opc2 = 7,
@@ -8604,6 +8614,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "MIDR_EL1", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 0, .opc2 = 0,
               .access = PL1_R, .type = ARM_CP_NO_RAW, .resetvalue = cpu->midr,
+              .fgt = FGT_MIDR_EL1,
               .fieldoffset = offsetof(CPUARMState, cp15.c0_cpuid),
               .readfn = midr_read },
             /* crn = 0 op1 = 0 crm = 0 op2 = 7 : AArch32 aliases of MIDR */
@@ -8614,6 +8625,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 0, .opc2 = 6,
               .access = PL1_R,
               .accessfn = access_aa64_tid1,
+              .fgt = FGT_REVIDR_EL1,
               .type = ARM_CP_CONST, .resetvalue = cpu->revidr },
         };
         ARMCPRegInfo id_v8_midr_alias_cp_reginfo = {
@@ -8785,6 +8797,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         ARMCPRegInfo mpidr_cp_reginfo[] = {
             { .name = "MPIDR_EL1", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 5,
+              .fgt = FGT_MPIDR_EL1,
               .access = PL1_R, .readfn = mpidr_read, .type = ARM_CP_NO_RAW },
         };
 #ifdef CONFIG_USER_ONLY
@@ -8884,6 +8897,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             .name = "SCTLR", .state = ARM_CP_STATE_BOTH,
             .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 0,
             .access = PL1_RW, .accessfn = access_tvm_trvm,
+            .fgt = FGT_SCTLR_EL1,
             .bank_fieldoffsets = { offsetof(CPUARMState, cp15.sctlr_s),
                                    offsetof(CPUARMState, cp15.sctlr_ns) },
             .writefn = sctlr_write, .resetvalue = cpu->reset_sctlr,
-- 
2.34.1


