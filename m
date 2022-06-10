Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B988B546A39
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:18:12 +0200 (CEST)
Received: from localhost ([::1]:49970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhKt-0008Tx-GQ
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhB1-0007iO-TW
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:08:03 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhAw-0007GG-7K
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:59 -0400
Received: by mail-wr1-x42c.google.com with SMTP id o16so3416935wra.4
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=kfpJqM/vTQKkaI6WcdqgObmH1bKNzodG8GQonjvolGM=;
 b=iritQDSZDNRG2EhlK6StycOvmxM9U+meK6Sm4nrlTINi0SmAkU+Ftjc5mJLFv5T5Ck
 x1iVYf4Nnr17qIHMHtZ2iIUtAytDcUKxmBISP5zS/HNcBqjko/P1vTJSLhKLSgNkn97m
 daXruySuhY7Pfpx5WsTDafh9QymUF+7gmm5ctnDWakO8itTZBEWmUO75AjIvX63bpSq8
 Gpw06HG8Gs0IkPZXXuotvpXULZFwHfwKpGBCSwU3Lw+CNPIjXCzpfTAGe81XoCI0NvXY
 fRE4FH4fRv42uGMKJBO/UFOGOlp9/M6djNg3oI4SE55SFEuvSbJrIou6b1xK+Zm6tUcx
 Nplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kfpJqM/vTQKkaI6WcdqgObmH1bKNzodG8GQonjvolGM=;
 b=Fo9wNRE6D4eMgbCulm7uFZDWZQMEMfn7DTm2ensFOv84goPFNAtOlwsAzb23X5qK83
 2AiKgQm3npNlwOflH84XZ9bFxlxQpqyuGj0QOpCLUEYUu9qDhn9U5/XjtgvYRRtC65lf
 RGBIHXUL8SXorVXm6u3f/17HpsVAtatXAq80rZ2Qwg4nG/WYTu3D6TDCklvxLlK0Updb
 KSnBuIfT1sWlWe28EeJmYL4xmNiOvtKvAS3T8BL7OV7/qWFuT/GNlPMDeIUFIwdtcKgb
 /QX5ZRj5mUoJKkmL0hhYMOiBFuntCxVgaeppDV6CasZ5WvF59eDyLQjDWQJcbpcBKgDq
 TqbA==
X-Gm-Message-State: AOAM532fODgD8s8D5ixkS5Co30SceBbkvpSb3skCZIDex4701Wfb+E8F
 x6JCrXgxa8Q7wLA6j+hGSAK0XrDBAL10UQ==
X-Google-Smtp-Source: ABdhPJyfa6epmQHJMgvUeTeYuSWG3bw8DEBWcCFmtJUfA+RIbtcaTgtbRmkTX4clvNnZ9g8tprUFPg==
X-Received: by 2002:a5d:638b:0:b0:218:54a2:71d0 with SMTP id
 p11-20020a5d638b000000b0021854a271d0mr19299256wru.36.1654877272786; 
 Fri, 10 Jun 2022 09:07:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm14276053wrb.114.2022.06.10.09.07.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:07:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/28] target/arm: Create helper_exception_swstep
Date: Fri, 10 Jun 2022 17:07:23 +0100
Message-Id: <20220610160738.2230762-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610160738.2230762-1-peter.maydell@linaro.org>
References: <20220610160738.2230762-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Move the computation from gen_swstep_exception into a helper.

This fixes a bug when:
  - MDSCR_EL1.KDE == 1 to enable debug exceptions within EL_D itself
  - we singlestep an ERET from EL_D to some lower EL

Previously we were computing 'same el' based on the EL which
executed the ERET instruction, whereas it ought to be computed
based on the EL to which ERET returned.  This happens naturally
with the new helper, which runs after EL has been changed.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220609202901.1177572-14-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h       |  1 +
 target/arm/translate.h    | 12 +++---------
 target/arm/debug_helper.c | 16 ++++++++++++++++
 3 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 5a6802e3fac..db7447d233e 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -47,6 +47,7 @@ DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
 DEF_HELPER_2(exception_internal, noreturn, env, i32)
 DEF_HELPER_4(exception_with_syndrome_el, noreturn, env, i32, i32, i32)
 DEF_HELPER_2(exception_bkpt_insn, noreturn, env, i32)
+DEF_HELPER_2(exception_swstep, noreturn, env, i32)
 DEF_HELPER_2(exception_pc_alignment, noreturn, env, tl)
 DEF_HELPER_1(setend, void, env)
 DEF_HELPER_2(wfi, void, env, i32)
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 4575af6e1c9..890e73194c3 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -341,15 +341,9 @@ static inline void gen_exception(int excp, uint32_t syndrome,
 /* Generate an architectural singlestep exception */
 static inline void gen_swstep_exception(DisasContext *s, int isv, int ex)
 {
-    bool same_el = (s->debug_target_el == s->current_el);
-
-    /*
-     * If singlestep is targeting a lower EL than the current one,
-     * then s->ss_active must be false and we can never get here.
-     */
-    assert(s->debug_target_el >= s->current_el);
-
-    gen_exception(EXCP_UDEF, syn_swstep(same_el, isv, ex), s->debug_target_el);
+    /* Fill in the same_el field of the syndrome in the helper. */
+    uint32_t syn = syn_swstep(false, isv, ex);
+    gen_helper_exception_swstep(cpu_env, tcg_constant_i32(syn));
 }
 
 /*
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index a743061e89b..a3a1b98de28 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -487,6 +487,22 @@ void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
     raise_exception(env, EXCP_BKPT, syndrome, debug_el);
 }
 
+void HELPER(exception_swstep)(CPUARMState *env, uint32_t syndrome)
+{
+    int debug_el = arm_debug_target_el(env);
+    int cur_el = arm_current_el(env);
+
+    /*
+     * If singlestep is targeting a lower EL than the current one, then
+     * DisasContext.ss_active must be false and we can never get here.
+     */
+    assert(debug_el >= cur_el);
+    if (debug_el == cur_el) {
+        syndrome |= 1 << ARM_EL_EC_SHIFT;
+    }
+    raise_exception(env, EXCP_UDEF, syndrome, debug_el);
+}
+
 #if !defined(CONFIG_USER_ONLY)
 
 vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len)
-- 
2.25.1


