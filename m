Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 469C731ABAC
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 14:23:04 +0100 (CET)
Received: from localhost ([::1]:51920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAut3-0006Lo-GT
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 08:23:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaW-0001zH-Ip
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:52 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaR-00068C-4b
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:52 -0500
Received: by mail-wr1-x435.google.com with SMTP id v15so2910675wrx.4
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 05:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/sFBFJIayCoi+cQdo5Fkztt0yDv3eeKfYYymr+XP+Hs=;
 b=S/hbiawTFmxRJAh0cg3947msJGJC9Yv6ncqTrIpEKbQ6w8EiiX42ulzt1Lb9bfpwcO
 EQpzFZ6av97uBQM8yyN9F/N9WoR0NlLIk9tY952sp+tLZDQYEprezq21x2llXOzvse/6
 DKyiV7u8G9tVJirTXCiHMDAKuXE3VYIGoa8JO2FsaJnCN1SquQDplTVI5SNQTGWZEgv7
 PkoLuME1zo452YtR6lwcVrZ4/Ya7r+Cwww2m8xjMeOjfxgmoo01qzHmR+D8jM0uBRUwQ
 QW52s/1AJitsD0N74ut8ZHprQu1DHrTXlZKxVd43uFtdXUSkjFmuoem7ZxHKFGl2oUBY
 iHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/sFBFJIayCoi+cQdo5Fkztt0yDv3eeKfYYymr+XP+Hs=;
 b=SFXG+jBFV0xBqdKuxqs5lH1Nkg17rRp2RQX0injg/7wBfLLacVVRFyALcxvT03NBy8
 zlnxDnfei6TGtM2q7+qMLSUOHG/lsRKQ6g+yNMvV9BBobLk8RgEmwAwNdPu7kRvj3i6e
 tZfBfE6f+U6rHxiA8Uug+aBJLF3qEvnBrgX7PfrfhGLJL3vbDzTrkg770P7GJGrbMU9a
 lFX3kYqkltcTXZljtxZWOELnRCagWXGnl+QeUX4Mgr+dg07zjzaP92ZmJDZIwJiZU5Np
 MmurFAEu+codi13Mts74CtqGSVsln0pFhhf6paHgS7sgshjl3jhK3pOvFDkv1DNp6BzD
 avYQ==
X-Gm-Message-State: AOAM533BW+71TaKa1RH+Q+jz91aCM/ARIARTeJjQHtmMpLUqRf8ROYjP
 VNazIE/gSJJcMKr2LmBimTaaEA==
X-Google-Smtp-Source: ABdhPJxXsrOaSPxFOzUK9RXhKEkwl1nmXZ1z6NiUFalwboMZrTMABZzGl+NDwXtmzIxGyqVylXwWpg==
X-Received: by 2002:adf:de01:: with SMTP id b1mr87313wrm.369.1613221421149;
 Sat, 13 Feb 2021 05:03:41 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o8sm17653118wmc.34.2021.02.13.05.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 05:03:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BDE861FF9C;
 Sat, 13 Feb 2021 13:03:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/23] target/sh4: Create superh_io_recompile_replay_branch
Date: Sat, 13 Feb 2021 13:03:15 +0000
Message-Id: <20210213130325.14781-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210213130325.14781-1-alex.bennee@linaro.org>
References: <20210213130325.14781-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com,
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
Message-Id: <20210209182749.31323-5-alex.bennee@linaro.org>
Message-Id: <20210210221053.18050-14-alex.bennee@linaro.org>
---
 accel/tcg/translate-all.c | 12 ------------
 target/sh4/cpu.c          | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 470657b02a..b8ad95aa1b 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2417,9 +2417,6 @@ void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr)
  */
 void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
 {
-#if defined(TARGET_SH4)
-    CPUArchState *env = cpu->env_ptr;
-#endif
     TranslationBlock *tb;
     CPUClass *cc;
     uint32_t n;
@@ -2443,15 +2440,6 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
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


