Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D5F55B927
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 12:32:35 +0200 (CEST)
Received: from localhost ([::1]:38348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5m2k-0003JH-7d
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 06:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltJ-0002JR-3h
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:49 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltD-0004rv-K1
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:48 -0400
Received: by mail-wr1-x42e.google.com with SMTP id k22so12340593wrd.6
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 03:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=n62ubY7+iB/7rTCXmZ/zUPH5zT2IZxj1SHTY5yvBRm8=;
 b=QxR2jP0RbnY9kNPOLur59/p6YtdZX6h5GZmjUVDzr9DCAPmrUDMNCK3LeAFTf3lWOq
 Z/oPFdQyNPtHRznDVLVL/YJItlrIBbMDxSpyG7h6n5idQMLqysPugHeSpazMlwtM4f40
 CJKjNkF8WJbipUf9X0yMljZZ+Pvlm6FBqQ59vaPLrOIhj+0pXhpi9Q4xrvdk7Obf0hb6
 zhKdI40oqgUnL4raENszGAXUdoKFtbIf25Shcpn52MmILoDW3MMqYdc5DU0xxGNKqm3C
 /Yj+bO1XLLRasaQpv2p57X65iPMedsh09P7tIIxrPx8Nv4cRMqeaA5V14FWZRVzfCRkC
 CrFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n62ubY7+iB/7rTCXmZ/zUPH5zT2IZxj1SHTY5yvBRm8=;
 b=3FfzDqxL4JJNNIaxn8GaN0Ws6VFe4mM3sq/N2ai24vUMruNvmkz2T+w4xE0sl49Tip
 X4NVoxc4wVuOddCjCN8IVae7LQnBZ0JO7gimnot1WbDDCyRW775zafQd/WE9Oko/tddl
 BD3rVDaxTszoFshDr83ikhOIcVkR3teHOlzdJWeqc55p9BTGkxEtjxPHix2Ty4N27N3i
 vQDOC6kzkjGxP70K+TY+8Dr+daU50yGo8+pOW6ehw3fQxJp/T4PD1wNFUlvNT7zaCNbo
 qY/lubljqZxyzMRloJi939AzAtHY/6sON2yl3hbssfIagFBiv1nqlSuBhCrcm7UnfZPJ
 JiTQ==
X-Gm-Message-State: AJIora+1eMkofXyOzLyBZeB+0VQ+IPd72WpCH2hqzsTmfQpqpHr/FVCe
 xXCJPwxaOL0jGWNLUSEUIxAQu0SPLy2vCQ==
X-Google-Smtp-Source: AGRyM1vB+BMOQh0eVuDKTJsbRlZPTdrr/T6Sj9w0b5kjw2u059Hi4HBXCy0e9mgsGB48cJahii6Kgg==
X-Received: by 2002:adf:db50:0:b0:21b:8a4c:594b with SMTP id
 f16-20020adfdb50000000b0021b8a4c594bmr11420005wrj.564.1656325362299; 
 Mon, 27 Jun 2022 03:22:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a5d6dcb000000b0020e6ce4dabdsm9754335wrz.103.2022.06.27.03.22.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 03:22:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/25] target/arm: Add SMEEXC_EL to TB flags
Date: Mon, 27 Jun 2022 11:22:16 +0100
Message-Id: <20220627102236.3097629-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627102236.3097629-1-peter.maydell@linaro.org>
References: <20220627102236.3097629-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

This is CheckSMEAccess, which is the basis for a set of
related tests for various SME cpregs and instructions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220620175235.60881-3-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h           |  2 ++
 target/arm/translate.h     |  1 +
 target/arm/helper.c        | 52 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c |  1 +
 4 files changed, 56 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 05d1e2e8dd1..e99de180978 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1134,6 +1134,7 @@ void aarch64_sync_64_to_32(CPUARMState *env);
 
 int fp_exception_el(CPUARMState *env, int cur_el);
 int sve_exception_el(CPUARMState *env, int cur_el);
+int sme_exception_el(CPUARMState *env, int cur_el);
 
 /**
  * sve_vqm1_for_el:
@@ -3148,6 +3149,7 @@ FIELD(TBFLAG_A64, ATA, 15, 1)
 FIELD(TBFLAG_A64, TCMA, 16, 2)
 FIELD(TBFLAG_A64, MTE_ACTIVE, 18, 1)
 FIELD(TBFLAG_A64, MTE0_ACTIVE, 19, 1)
+FIELD(TBFLAG_A64, SMEEXC_EL, 20, 2)
 
 /*
  * Helpers for using the above.
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 88dc18a034b..c88c9533253 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -42,6 +42,7 @@ typedef struct DisasContext {
     bool ns;        /* Use non-secure CPREG bank on access */
     int fp_excp_el; /* FP exception EL or 0 if enabled */
     int sve_excp_el; /* SVE exception EL or 0 if enabled */
+    int sme_excp_el; /* SME exception EL or 0 if enabled */
     int vl;          /* current vector length in bytes */
     bool vfp_enabled; /* FP enabled via FPSCR.EN */
     int vec_len;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d21ba7ab836..2c080c6cac0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6218,6 +6218,55 @@ int sve_exception_el(CPUARMState *env, int el)
     return 0;
 }
 
+/*
+ * Return the exception level to which exceptions should be taken for SME.
+ * C.f. the ARM pseudocode function CheckSMEAccess.
+ */
+int sme_exception_el(CPUARMState *env, int el)
+{
+#ifndef CONFIG_USER_ONLY
+    if (el <= 1 && !el_is_in_host(env, el)) {
+        switch (FIELD_EX64(env->cp15.cpacr_el1, CPACR_EL1, SMEN)) {
+        case 1:
+            if (el != 0) {
+                break;
+            }
+            /* fall through */
+        case 0:
+        case 2:
+            return 1;
+        }
+    }
+
+    if (el <= 2 && arm_is_el2_enabled(env)) {
+        /* CPTR_EL2 changes format with HCR_EL2.E2H (regardless of TGE). */
+        if (env->cp15.hcr_el2 & HCR_E2H) {
+            switch (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, SMEN)) {
+            case 1:
+                if (el != 0 || !(env->cp15.hcr_el2 & HCR_TGE)) {
+                    break;
+                }
+                /* fall through */
+            case 0:
+            case 2:
+                return 2;
+            }
+        } else {
+            if (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, TSM)) {
+                return 2;
+            }
+        }
+    }
+
+    /* CPTR_EL3.  Since ESM is negative we must check for EL3.  */
+    if (arm_feature(env, ARM_FEATURE_EL3)
+        && !FIELD_EX64(env->cp15.cptr_el[3], CPTR_EL3, ESM)) {
+        return 3;
+    }
+#endif
+    return 0;
+}
+
 /*
  * Given that SVE is enabled, return the vector length for EL.
  */
@@ -11197,6 +11246,9 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         }
         DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
     }
+    if (cpu_isar_feature(aa64_sme, env_archcpu(env))) {
+        DP_TBFLAG_A64(flags, SMEEXC_EL, sme_exception_el(env, el));
+    }
 
     sctlr = regime_sctlr(env, stage1);
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 4c64546090c..9a285dd1774 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14603,6 +14603,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
     dc->pstate_il = EX_TBFLAG_ANY(tb_flags, PSTATE__IL);
     dc->sve_excp_el = EX_TBFLAG_A64(tb_flags, SVEEXC_EL);
+    dc->sme_excp_el = EX_TBFLAG_A64(tb_flags, SMEEXC_EL);
     dc->vl = (EX_TBFLAG_A64(tb_flags, VL) + 1) * 16;
     dc->pauth_active = EX_TBFLAG_A64(tb_flags, PAUTH_ACTIVE);
     dc->bt = EX_TBFLAG_A64(tb_flags, BT);
-- 
2.25.1


