Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1FC546A54
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:25:32 +0200 (CEST)
Received: from localhost ([::1]:41040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhRz-0004wm-NL
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhB6-0007lX-A7
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:08:05 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhB1-0007HN-TG
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:08:01 -0400
Received: by mail-wr1-x42c.google.com with SMTP id p10so37129088wrg.12
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3zz0yuYCYm08qx+o6Rm2f0pOHdzCDBKI3lZuk2sPa/I=;
 b=qGg9+vrFbe+PEn/+Iuxw/uFwcipbAzwRxpMZEYGpblkaS0HzWlJxvEe439Wh52Xbw3
 IOmSfaxqtKmckgkwA/MSs0Te63ASY/Tx9hzA79oZu63PgmamMcij/lO/PGkXGR9pfjh1
 6NcOyDPRdCyFo+fqGIAaTYGB2Uap1/Yok/2VB3sKdj6jvOlsYTqMdkSCr+JaShp/8QIB
 xBi490saH7nA3xAQ6VSKRJW9YrU4zt9BjEZ5JiBKRsi1AsX1sXqSk26Le0CNdd/v0y/n
 wZiAy/OqRvzvLgGPafeq1lSVhGgPawYh6OdVvMlOF+xC+rAhdJ31CCqYAMgruXJf8ERK
 zTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3zz0yuYCYm08qx+o6Rm2f0pOHdzCDBKI3lZuk2sPa/I=;
 b=THrh+lLZHn1VfSzu7SlK1NHF41MwxwHlDrqd4QcOTnry+KgBn/GL0Z/9PdASEFykNQ
 EwR4kgRTsYk3FTQ7AJ8NCbzBNl51k0x3CxDQ/U8FKcPoIRimCCwA5SjwVepopSCyd+PQ
 w/Py9l71weiMlBBtoPnSrAe2LdooGrHvDKUG/HPRjw+4kfzBGkl/OkPCxUIOjRgLzYah
 cwfZHTAWkhLcJwreSpEvPYZCvMS3EnZ3WI1xOZUk8UWZtarA1L/pOJt41zS+kgfcraOh
 i2qdrTjWocwJnJWBj3/5z3cK3/f8fM5nUGSCxTuA9GzNASI2nBUc7p87AitrWmyqI+Wp
 E7BQ==
X-Gm-Message-State: AOAM532Z6PwIZZ9Er3W5i6HolOsq6FiEJ9M78l0IT6F28B1NAibAMonz
 whw0Hy0bxrvrbfmhGiyYutiOcpfEGucVLw==
X-Google-Smtp-Source: ABdhPJwMMQD4tHdA5cUHgro5nWTgn4cF6ZMp5PGV6Wlv1A42z160bB3OZmV62Fujf42PwGcwxZ+DbA==
X-Received: by 2002:a5d:5142:0:b0:212:af29:530 with SMTP id
 u2-20020a5d5142000000b00212af290530mr44862499wrt.444.1654877277457; 
 Fri, 10 Jun 2022 09:07:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm14276053wrb.114.2022.06.10.09.07.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:07:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/28] target/arm: Introduce helper_exception_with_syndrome
Date: Fri, 10 Jun 2022 17:07:29 +0100
Message-Id: <20220610160738.2230762-20-peter.maydell@linaro.org>
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

With the helper we can use exception_target_el at runtime,
instead of default_exception_el at translate time.
While we're at it, remove the DisasContext parameter from
gen_exception, as it is no longer used.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220609202901.1177572-20-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h    |  1 +
 target/arm/op_helper.c | 10 ++++++++++
 target/arm/translate.c | 18 +++++++++++++-----
 3 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index db7447d233e..07d45faf495 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -45,6 +45,7 @@ DEF_HELPER_FLAGS_2(usad8, TCG_CALL_NO_RWG_SE, i32, i32, i32)
 DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
                    i32, i32, i32, i32)
 DEF_HELPER_2(exception_internal, noreturn, env, i32)
+DEF_HELPER_3(exception_with_syndrome, noreturn, env, i32, i32)
 DEF_HELPER_4(exception_with_syndrome_el, noreturn, env, i32, i32, i32)
 DEF_HELPER_2(exception_bkpt_insn, noreturn, env, i32)
 DEF_HELPER_2(exception_swstep, noreturn, env, i32)
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 8a6a3b85516..c5bde1cfcc7 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -399,6 +399,16 @@ void HELPER(exception_with_syndrome_el)(CPUARMState *env, uint32_t excp,
     raise_exception(env, excp, syndrome, target_el);
 }
 
+/*
+ * Raise an exception with the specified syndrome register value
+ * to the default target el.
+ */
+void HELPER(exception_with_syndrome)(CPUARMState *env, uint32_t excp,
+                                     uint32_t syndrome)
+{
+    raise_exception(env, excp, syndrome, exception_target_el(env));
+}
+
 uint32_t HELPER(cpsr_read)(CPUARMState *env)
 {
     return cpsr_read(env) & ~CPSR_EXEC;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index fcb6ee648b5..81c27e7c70c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1097,9 +1097,10 @@ static void gen_exception_el(int excp, uint32_t syndrome, uint32_t target_el)
     gen_exception_el_v(excp, syndrome, tcg_constant_i32(target_el));
 }
 
-static void gen_exception(DisasContext *s, int excp, uint32_t syndrome)
+static void gen_exception(int excp, uint32_t syndrome)
 {
-    gen_exception_el(excp, syndrome, default_exception_el(s));
+    gen_helper_exception_with_syndrome(cpu_env, tcg_constant_i32(excp),
+                                       tcg_constant_i32(syndrome));
 }
 
 static void gen_exception_insn_el_v(DisasContext *s, uint64_t pc, int excp,
@@ -1123,7 +1124,14 @@ void gen_exception_insn_el(DisasContext *s, uint64_t pc, int excp,
 
 void gen_exception_insn(DisasContext *s, uint64_t pc, int excp, uint32_t syn)
 {
-    gen_exception_insn_el(s, pc, excp, syn, default_exception_el(s));
+    if (s->aarch64) {
+        gen_a64_set_pc_im(pc);
+    } else {
+        gen_set_condexec(s);
+        gen_set_pc_im(s, pc);
+    }
+    gen_exception(excp, syn);
+    s->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
@@ -9766,7 +9774,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         switch (dc->base.is_jmp) {
         case DISAS_SWI:
             gen_ss_advance(dc);
-            gen_exception(dc, EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb));
+            gen_exception(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb));
             break;
         case DISAS_HVC:
             gen_ss_advance(dc);
@@ -9835,7 +9843,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_helper_yield(cpu_env);
             break;
         case DISAS_SWI:
-            gen_exception(dc, EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb));
+            gen_exception(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb));
             break;
         case DISAS_HVC:
             gen_exception_el(EXCP_HVC, syn_aa32_hvc(dc->svc_imm), 2);
-- 
2.25.1


