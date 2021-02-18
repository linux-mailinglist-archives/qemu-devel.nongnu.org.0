Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EC631E85F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 11:07:27 +0100 (CET)
Received: from localhost ([::1]:55496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCgDW-0004Xi-G3
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 05:07:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfzO-0004Rq-Bq
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:52:50 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:33987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfzM-0000yd-FF
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:52:49 -0500
Received: by mail-wm1-x331.google.com with SMTP id o10so2466909wmc.1
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 01:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=by4E5jCVC9bx2TQqGdZFWQRpu+EpcHBR3WGdgm6ocCw=;
 b=YXsB03vaUE3SBea0f2cktWvK++/AlwnJeKe3jGNVb1npz5Zgvl2IN42JczNO31qzf5
 ItcIcrfwuEQwVxffptZM8FiATCKExWZgL782s4rwELwHGFkSemktiHH4DOeRne6xzQAN
 h9RY30VL/wz5kDDRq657VhKXA6wJnIVDs/RzvIzKebkJ7BorPcUtV7i7zeylgS7V0Uk/
 aAKHtwTXblLDRk9GGRBkBUxMSvu2r5r77+uVtw9uQ6BhRaIw/3W3s/AnBpW/yQ8zyJmg
 fbrJh5hf7zfihr1VbbLdKlowF1Jt0fu9l9QST8awPEElGzhRdtr/F9+osYgYK0j8umPR
 cd0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=by4E5jCVC9bx2TQqGdZFWQRpu+EpcHBR3WGdgm6ocCw=;
 b=llbdBtD08XxgaDmuN0OVi+gFeRNhCkvja1x/9CSfhQUAzCEPzo8uVafI7vXvgV/Ynr
 t3LKJvkOfaycex1K/Vfeo2Zw9SmTj1H/GoFQNVe6XAV03k3tqRrdXhsf6iDujrAsmN/K
 kQIuKkKvyZT+gX2VuY8GxyiBRRUH1KJUe3xU+/c6G01jH+2CHHeg/8n2wyjC5RZhOeb8
 jEiEEeuB2LMW+VfCeIftfASZgpQJtdbJKSAzsfcKTqVUBIBwzHEElAs9/s3DoAKKydgW
 5MjJCTem5KxLhfw6mWythKl+gPspKAVRi7R6mwq5SIHzwG0BAGitFVX1vuNBOKrWMlw2
 eFqg==
X-Gm-Message-State: AOAM533ilKu83S+oXea1k6Kg3wH2CP9Wd2EM4mmLzgjleRjGhZIxI8Oj
 NpAt5LCMx9/B1uwc56by05K5ZQ==
X-Google-Smtp-Source: ABdhPJzpIBOsZBEBUvNpBesddmTuzC5mmhJC3MREw994T/rCxiL7WOv/zHbJ/Kha0qdIB6QLLE1FnQ==
X-Received: by 2002:a7b:c5c7:: with SMTP id n7mr2779724wmk.63.1613641966989;
 Thu, 18 Feb 2021 01:52:46 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g15sm8080303wrx.1.2021.02.18.01.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 01:52:46 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 395661FF9C;
 Thu, 18 Feb 2021 09:47:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 13/23] target/sh4: Create superh_io_recompile_replay_branch
Date: Thu, 18 Feb 2021 09:46:56 +0000
Message-Id: <20210218094706.23038-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210218094706.23038-1-alex.bennee@linaro.org>
References: <20210218094706.23038-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Move the code from accel/tcg/translate-all.c to target/sh4/cpu.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210208233906.479571-5-richard.henderson@linaro.org>
Message-Id: <20210213130325.14781-14-alex.bennee@linaro.org>

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 9fea5c0e59..c0b98e76b9 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2418,9 +2418,6 @@ void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr)
  */
 void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
 {
-#if defined(TARGET_SH4)
-    CPUArchState *env = cpu->env_ptr;
-#endif
     TranslationBlock *tb;
     CPUClass *cc;
     uint32_t n;
@@ -2444,15 +2441,6 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
         cpu_neg(cpu)->icount_decr.u16.low++;
         n = 2;
     }
-#if defined(TARGET_SH4)
-    if ((env->flags & ((DELAY_SLOT | DELAY_SLOT_CONDITIONAL))) != 0
-        && env->pc != tb->pc) {
-        env->pc -= 2;
-        cpu_neg(cpu)->icount_decr.u16.low++;
-        env->flags &= ~(DELAY_SLOT | DELAY_SLOT_CONDITIONAL);
-        n = 2;
-    }
-#endif
 
     /* Generate a new TB executing the I/O insn.  */
     cpu->cflags_next_tb = curr_cflags() | CF_LAST_IO | n;
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index a78d283bc8..ac65c88f1f 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -43,6 +43,23 @@ static void superh_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.flags = tb->flags & TB_FLAG_ENVFLAGS_MASK;
 }
 
+#ifndef CONFIG_USER_ONLY
+static bool superh_io_recompile_replay_branch(CPUState *cs,
+                                              const TranslationBlock *tb)
+{
+    SuperHCPU *cpu = SUPERH_CPU(cs);
+    CPUSH4State *env = &cpu->env;
+
+    if ((env->flags & ((DELAY_SLOT | DELAY_SLOT_CONDITIONAL))) != 0
+        && env->pc != tb->pc) {
+        env->pc -= 2;
+        env->flags &= ~(DELAY_SLOT | DELAY_SLOT_CONDITIONAL);
+        return true;
+    }
+    return false;
+}
+#endif
+
 static bool superh_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
@@ -217,6 +234,7 @@ static struct TCGCPUOps superh_tcg_ops = {
 #ifndef CONFIG_USER_ONLY
     .do_interrupt = superh_cpu_do_interrupt,
     .do_unaligned_access = superh_cpu_do_unaligned_access,
+    .io_recompile_replay_branch = superh_io_recompile_replay_branch,
 #endif /* !CONFIG_USER_ONLY */
 };
 
-- 
2.20.1


