Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4807C56A1F4
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 14:29:59 +0200 (CEST)
Received: from localhost ([::1]:36936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Qdq-0001VB-BO
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 08:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9Qbj-0007o9-2H
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:27:47 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9Qbg-0006vq-PA
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:27:46 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 h131-20020a1c2189000000b003a2cc290135so819202wmh.2
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 05:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3Zny3pPpx6FNeCxsKe5coi8T+FO7ki0GbLttskNZyF4=;
 b=NSySmL3Cd1Zl2mUrqUq+r+FQ+c4r3c54hOMKOVQV6i2GStcJHgaQUZDJ3nfpNuOX0j
 KoWxVCC3Pq2PstXsWQ5qVxLhIs8gLZQVjZN/xGHO8vO4Da6kYWx99fhyMIBA8/fxYO2e
 8Q4PcJmpfBBGQNMrjud3LYKI+HDt2kP3YFvdJX/qCGgc7jIR/XsjoLwzyTqcIWU9Jh8M
 LrF+4P4/TTURx1adYlAiYXSuZz43WQAyhW3BrYONAJJHVG4JuAhWRDFsGhDEl1vZ1Sfv
 wHLcqwTSrwZhwQ02rWfpFZWQIMJwLzvg7K5Lh/hdqrvcynH5XoD98wL2MLn063A8kEsd
 ZBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Zny3pPpx6FNeCxsKe5coi8T+FO7ki0GbLttskNZyF4=;
 b=U04WKw3GpbAYkkjyegaISwe5WKMpjEP+6wxwSK3MVQsTWbdwAVH6W9sNs2s03un+PR
 NU7vRBREIwwyYM7lgNnzJJwuj6K1/CRBLf+HEgJ72AmSQPnPsLmSAaHktTBTxotnHVbb
 3ma5Q9PyegUcsYnWMAlDKS3ExcjDnNg/S8AicLj5hsfvdso1KIc8iI5IE81IF8mwOrOm
 gfxRDooLabdTqdplITGcbspCqbaZnWPs+CqXmlKMV1w9c6YrNYZ1zA8L888aBiSLv6YW
 R+rbyJfX1dgsLNAe7BCDo3Zm1ljHzwPEyFNhZOLpEVo5beSqXXnCftD2VjOJ3+5PpEAk
 GPaQ==
X-Gm-Message-State: AJIora9XH9HDcrvvhAHYH5zVE+KhegriKEP/PG4U+0m9JP9PrXrt0p3v
 O0+eq63VpLgw+g7tMR9d0kGHYmUcys2uOg==
X-Google-Smtp-Source: AGRyM1sKQ7ddsLzymYDQE/vuBORhfhWjEy9U9UnmiMFAywNtpawlshhFvBggIaR80mh0EuXagTPJyQ==
X-Received: by 2002:a05:600c:3553:b0:3a0:519b:4b96 with SMTP id
 i19-20020a05600c355300b003a0519b4b96mr4129218wmq.61.1657196864033; 
 Thu, 07 Jul 2022 05:27:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c35d000b003a0375c4f73sm29177618wmq.44.2022.07.07.05.27.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 05:27:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 7/9] target/arm: Implement AArch32 DBGDEVID, DBGDEVID1,
 DBGDEVID2
Date: Thu,  7 Jul 2022 13:27:32 +0100
Message-Id: <20220707122734.288929-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707122734.288929-1-peter.maydell@linaro.org>
References: <20220707122734.288929-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

Starting with v7 of the debug architecture, there are three extra
ID registers that add information on top of that provided in
DBGDIDR. These are DBGDEVID, DBGDEVID1 and DBGDEVID2. In the
v7 debug architecture, DBGDEVID is optional, present only of
DBGDIDR.DEVID_imp is set. In v7.1 all three must be present.

Implement the missing registers.  Note that we only need to set the
values in the ARMISARegisters struct for the CPUs Cortex-A7, A15,
A53, A57 and A72 (plus the 32-bit 'max' which uses the Cortex-A53
values): earlier CPUs didn't implement v7 of the architecture, and
our other 64-bit CPUs (Cortex-A76, Neoverse-N1 and A64fx) don't have
AArch32 support at EL1.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220630194116.3438513-5-peter.maydell@linaro.org
---
 target/arm/cpu.h          |  7 +++++++
 target/arm/cpu64.c        |  6 ++++++
 target/arm/cpu_tcg.c      |  6 ++++++
 target/arm/debug_helper.c | 36 ++++++++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4a4342f2622..c533ad0b64d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -988,6 +988,8 @@ struct ArchCPU {
         uint32_t mvfr2;
         uint32_t id_dfr0;
         uint32_t dbgdidr;
+        uint32_t dbgdevid;
+        uint32_t dbgdevid1;
         uint64_t id_aa64isar0;
         uint64_t id_aa64isar1;
         uint64_t id_aa64pfr0;
@@ -3719,6 +3721,11 @@ static inline bool isar_feature_aa32_ssbs(const ARMISARegisters *id)
     return FIELD_EX32(id->id_pfr2, ID_PFR2, SSBS) != 0;
 }
 
+static inline bool isar_feature_aa32_debugv7p1(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_dfr0, ID_DFR0, COPDBG) >= 5;
+}
+
 static inline bool isar_feature_aa32_debugv8p2(const ARMISARegisters *id)
 {
     return FIELD_EX32(id->id_dfr0, ID_DFR0, COPDBG) >= 8;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 19188d6cc2a..b4fd4b7ec87 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -79,6 +79,8 @@ static void aarch64_a57_initfn(Object *obj)
     cpu->isar.id_aa64isar0 = 0x00011120;
     cpu->isar.id_aa64mmfr0 = 0x00001124;
     cpu->isar.dbgdidr = 0x3516d000;
+    cpu->isar.dbgdevid = 0x01110f13;
+    cpu->isar.dbgdevid1 = 0x2;
     cpu->isar.reset_pmcr_el0 = 0x41013000;
     cpu->clidr = 0x0a200023;
     cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
@@ -134,6 +136,8 @@ static void aarch64_a53_initfn(Object *obj)
     cpu->isar.id_aa64isar0 = 0x00011120;
     cpu->isar.id_aa64mmfr0 = 0x00001122; /* 40 bit physical addr */
     cpu->isar.dbgdidr = 0x3516d000;
+    cpu->isar.dbgdevid = 0x00110f13;
+    cpu->isar.dbgdevid1 = 0x1;
     cpu->isar.reset_pmcr_el0 = 0x41033000;
     cpu->clidr = 0x0a200023;
     cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
@@ -187,6 +191,8 @@ static void aarch64_a72_initfn(Object *obj)
     cpu->isar.id_aa64isar0 = 0x00011120;
     cpu->isar.id_aa64mmfr0 = 0x00001124;
     cpu->isar.dbgdidr = 0x3516d000;
+    cpu->isar.dbgdevid = 0x01110f13;
+    cpu->isar.dbgdevid1 = 0x2;
     cpu->isar.reset_pmcr_el0 = 0x41023000;
     cpu->clidr = 0x0a200023;
     cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index b751a19c8a7..3099b38e32b 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -563,6 +563,8 @@ static void cortex_a7_initfn(Object *obj)
     cpu->isar.id_isar3 = 0x11112131;
     cpu->isar.id_isar4 = 0x10011142;
     cpu->isar.dbgdidr = 0x3515f005;
+    cpu->isar.dbgdevid = 0x01110f13;
+    cpu->isar.dbgdevid1 = 0x1;
     cpu->clidr = 0x0a200023;
     cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
     cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
@@ -606,6 +608,8 @@ static void cortex_a15_initfn(Object *obj)
     cpu->isar.id_isar3 = 0x11112131;
     cpu->isar.id_isar4 = 0x10011142;
     cpu->isar.dbgdidr = 0x3515f021;
+    cpu->isar.dbgdevid = 0x01110f13;
+    cpu->isar.dbgdevid1 = 0x0;
     cpu->clidr = 0x0a200023;
     cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
     cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
@@ -1098,6 +1102,8 @@ static void arm_max_initfn(Object *obj)
     cpu->isar.id_isar5 = 0x00011121;
     cpu->isar.id_isar6 = 0;
     cpu->isar.dbgdidr = 0x3516d000;
+    cpu->isar.dbgdevid = 0x00110f13;
+    cpu->isar.dbgdevid1 = 0x2;
     cpu->isar.reset_pmcr_el0 = 0x41013000;
     cpu->clidr = 0x0a200023;
     cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 691b9b74c4a..e96a4ffd28d 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -999,6 +999,42 @@ void define_debug_regs(ARMCPU *cpu)
         define_one_arm_cp_reg(cpu, &dbgdidr);
     }
 
+    /*
+     * DBGDEVID is present in the v7 debug architecture if
+     * DBGDIDR.DEVID_imp is 1 (bit 15); from v7.1 and on it is
+     * mandatory (and bit 15 is RES1). DBGDEVID1 and DBGDEVID2 exist
+     * from v7.1 of the debug architecture. Because no fields have yet
+     * been defined in DBGDEVID2 (and quite possibly none will ever
+     * be) we don't define an ARMISARegisters field for it.
+     * These registers exist only if EL1 can use AArch32, but that
+     * happens naturally because they are only PL1 accessible anyway.
+     */
+    if (extract32(cpu->isar.dbgdidr, 15, 1)) {
+        ARMCPRegInfo dbgdevid = {
+            .name = "DBGDEVID",
+            .cp = 14, .opc1 = 0, .crn = 7, .opc2 = 2, .crn = 7,
+            .access = PL1_R, .accessfn = access_tda,
+            .type = ARM_CP_CONST, .resetvalue = cpu->isar.dbgdevid,
+        };
+        define_one_arm_cp_reg(cpu, &dbgdevid);
+    }
+    if (cpu_isar_feature(aa32_debugv7p1, cpu)) {
+        ARMCPRegInfo dbgdevid12[] = {
+            {
+                .name = "DBGDEVID1",
+                .cp = 14, .opc1 = 0, .crn = 7, .opc2 = 1, .crn = 7,
+                .access = PL1_R, .accessfn = access_tda,
+                .type = ARM_CP_CONST, .resetvalue = cpu->isar.dbgdevid1,
+            }, {
+                .name = "DBGDEVID2",
+                .cp = 14, .opc1 = 0, .crn = 7, .opc2 = 0, .crn = 7,
+                .access = PL1_R, .accessfn = access_tda,
+                .type = ARM_CP_CONST, .resetvalue = 0,
+            },
+        };
+        define_arm_cp_regs(cpu, dbgdevid12);
+    }
+
     brps = arm_num_brps(cpu);
     wrps = arm_num_wrps(cpu);
     ctx_cmps = arm_num_ctx_cmps(cpu);
-- 
2.25.1


