Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2EE510896
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:08:43 +0200 (CEST)
Received: from localhost ([::1]:45738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQYF-00073c-33
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPpq-0001nt-TT
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:22:54 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:40840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPpp-0005Lx-7N
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:22:50 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 iq2-20020a17090afb4200b001d93cf33ae9so2848312pjb.5
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jeDOlvgCVk+y2B//qRod3Wvk+Oo9Yi7Y8REDz4Pr8oM=;
 b=dmni/nSE9YRVpvUqP9arGePVhTwsLLzzlEAaN2JjhwMu3XLxHBW5muMDLH7i/feUsZ
 iPpyj4rnQbjvTg8iCHrF3qLysStJLMal5zQxZWnoySaBtAvH8TxrWBjkneagL6LJ4FYO
 P98xdozoGzr1tBoddbkOw/S6igSqgGwkqn5ZgLsFc6qQ1LlHA07HdipcOrgTKtMlGXv7
 2qFeVCpbrnxCNmgA/5MzC6sEuVQWC3+PbAKlez4iewcFEnGSgYuoePfxERDRoqP3iIaS
 ME7fb69k0Z9DOyNA0+dTVhXxywR+W7x1KDteU/m9L2wsBRRqZZFH3ntwnkm0C8uhku1S
 lcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jeDOlvgCVk+y2B//qRod3Wvk+Oo9Yi7Y8REDz4Pr8oM=;
 b=RxYjLZr515Bdz0R/9awhVS5Evspk13bkMP3HyuWAggnrF7+k/HLx3N5TqnaQFn474z
 nauBFzzP8JhvCTR4Up/b/f3PXxnUJlsfh88Q5PqF19r/bIEH1HrTmr9sjpMxcopV7Dzd
 mrNLeaQXHW6TxHp8J8ZraKquTHMQRKo1+pnVKbiNqaNUg/jmmKuDFZ6v0rSjsdeySh1c
 1DCA8IWrpizdCIOywI6ZTNKAjrkWRjelrn7TH1qwNnL+UT/PamuxOf7ozbtsLPz2HCI+
 RWWirjU8WV4BgnGggoLHOfEcsH60eHshQtFxDvBDmklKHlethgr5q36uFcrWppB3Nii6
 OGCw==
X-Gm-Message-State: AOAM5326rX7FCvBBYceKoaOvmqu+8VzIiJLwdnZ/NibqgUnXXKAzfsrB
 5h/eJbbeVCZL6LeVpXDpSbQT5tSuKCdyGQ==
X-Google-Smtp-Source: ABdhPJwDp0gPKGMRkn5QuY37dJScETTqC41jJHClXKeHLuEyrbFqdNU5P/A6AiXADqCokItHj3o+YA==
X-Received: by 2002:a17:90a:ca89:b0:1d9:7d1a:c337 with SMTP id
 y9-20020a17090aca8900b001d97d1ac337mr11892923pjt.88.1650997367941; 
 Tue, 26 Apr 2022 11:22:47 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a636fc4000000b003983a01b896sm13585053pgc.90.2022.04.26.11.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:22:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 42/68] target/nios2: Use tcg_constant_tl
Date: Tue, 26 Apr 2022 11:18:41 -0700
Message-Id: <20220426181907.103691-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace current uses of tcg_const_tl, and remove the frees.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-43-richard.henderson@linaro.org>
---
 target/nios2/translate.c | 30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index b27269bf08..f33015f942 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -99,7 +99,6 @@
 
 typedef struct DisasContext {
     DisasContextBase  base;
-    TCGv_i32          zero;
     target_ulong      pc;
     int               mem_idx;
     const ControlRegState *cr_state;
@@ -125,31 +124,20 @@ static uint8_t get_opxcode(uint32_t code)
     return instr.opx;
 }
 
-static TCGv load_zero(DisasContext *dc)
+static TCGv load_gpr(DisasContext *dc, unsigned reg)
 {
-    if (!dc->zero) {
-        dc->zero = tcg_const_i32(0);
-    }
-    return dc->zero;
-}
-
-static TCGv load_gpr(DisasContext *dc, uint8_t reg)
-{
-    if (likely(reg != R_ZERO)) {
-        return cpu_R[reg];
-    } else {
-        return load_zero(dc);
+    assert(reg < NUM_GP_REGS);
+    if (unlikely(reg == R_ZERO)) {
+        return tcg_constant_tl(0);
     }
+    return cpu_R[reg];
 }
 
 static void t_gen_helper_raise_exception(DisasContext *dc,
                                          uint32_t index)
 {
-    TCGv_i32 tmp = tcg_const_i32(index);
-
     tcg_gen_movi_tl(cpu_pc, dc->pc);
-    gen_helper_raise_exception(cpu_env, tmp);
-    tcg_temp_free_i32(tmp);
+    gen_helper_raise_exception(cpu_env, tcg_constant_i32(index));
     dc->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -876,14 +864,8 @@ static void nios2_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         return;
     }
 
-    dc->zero = NULL;
-
     instr = &i_type_instructions[op];
     instr->handler(dc, code, instr->flags);
-
-    if (dc->zero) {
-        tcg_temp_free(dc->zero);
-    }
 }
 
 static void nios2_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
-- 
2.34.1


