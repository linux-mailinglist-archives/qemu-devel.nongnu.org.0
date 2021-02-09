Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A7431561E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 19:41:20 +0100 (CET)
Received: from localhost ([::1]:58674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Xwt-0007JP-LX
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 13:41:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Xjz-0002pY-BA
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:27:59 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Xjx-0007mc-2z
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:27:59 -0500
Received: by mail-wr1-x432.google.com with SMTP id r21so6986815wrr.9
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 10:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/09yZXBu/IIBdtGKto41tx2iEh/nEfZf6dGwHzi/lkI=;
 b=XAICnjr5aUDi2vKoKu3eqA52NHh2FT2ysPULfHaECaTigveQaCW34PjBbDGJ0W3PxB
 IP1Unjnug85UpFZfHGiBE7WDGc6Q1fkn+1+c0ukr+xWZpLrjO4WsCkU/nmUrKOtjn1cR
 mWx3UMPrKJysrLLntYNIu0uFTxw4G7GFYvtHJfQlq6ej45yOnIP0vZQTiTMzGHKOZfWe
 C2XtLZgzramSJoqx2/3BfqXEnBk08wlt2VSzGQPDs7elAN4T60gkZhma3BWxNfhy28HB
 hXmfu/Lwh3ayJEndMiU4DwoGR+zmyzMmheqhWaf/wSADVK8SlMg+qkaiSwVWFIaQ5ECi
 CbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/09yZXBu/IIBdtGKto41tx2iEh/nEfZf6dGwHzi/lkI=;
 b=Spm9VSHm59vk+o2dKnzl5rWI8T0FHoSsSFrcP66ifaLaqB/BUM2yAQrc+qGO6gFTdW
 UzWO9TGF5zusc6kUZD06RU2Z+hyrJjlirTUgxcKy3kPEcgLsCk/tQvAQ1rRguNs8A9JF
 7Isek/JzP01vHhS0mrt/rePyKYr44f0SlesXQkesDawGB9zCRAHr0BkKiBsPn2hwiNpX
 NP259O1YRMaftnsTg66JkFnriNvrNwHmbOfeMwrm/L65yO/YGmNGamMMdtFJe6LUl8G1
 XlLSpynmvS89eIOecNoLwRRprRP+qRJfJStNuRGq/FFbY9I+fqY50lMAQGSGSqJ1MYvh
 4gRg==
X-Gm-Message-State: AOAM533bxtZoViX5f0on3QDSCa4loyQz7lXDrXNZGoAHqPY8DwhY+xS0
 20MU/EODp9IEbINdwKqo9kzDV/VTRPx/yifq
X-Google-Smtp-Source: ABdhPJxbg/S6oGucAEZBm88tfZCRu0kbc0AkcUDUsIScQD1Gn7yO3j8tv1sziNifSbfpJqbR8al/wA==
X-Received: by 2002:adf:dd10:: with SMTP id a16mr27236303wrm.207.1612895275667; 
 Tue, 09 Feb 2021 10:27:55 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s23sm5670539wmc.29.2021.02.09.10.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 10:27:50 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 014631FF8F;
 Tue,  9 Feb 2021 18:27:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 03/12] target/mips: Create mips_io_recompile_replay_branch
Date: Tue,  9 Feb 2021 18:27:39 +0000
Message-Id: <20210209182749.31323-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209182749.31323-1-alex.bennee@linaro.org>
References: <20210209182749.31323-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 robhenry@microsoft.com, aaron@os.amperecomputing.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Move the code from accel/tcg/translate-all.c to target/mips/cpu.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210208233906.479571-4-richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/translate-all.c | 12 ++----------
 target/mips/cpu.c         | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 6eb37883bd..470657b02a 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2417,7 +2417,7 @@ void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr)
  */
 void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
 {
-#if defined(TARGET_MIPS) || defined(TARGET_SH4)
+#if defined(TARGET_SH4)
     CPUArchState *env = cpu->env_ptr;
 #endif
     TranslationBlock *tb;
@@ -2443,15 +2443,7 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
         cpu_neg(cpu)->icount_decr.u16.low++;
         n = 2;
     }
-#if defined(TARGET_MIPS)
-    if ((env->hflags & MIPS_HFLAG_BMASK) != 0
-        && env->active_tc.PC != tb->pc) {
-        env->active_tc.PC -= (env->hflags & MIPS_HFLAG_B16 ? 2 : 4);
-        cpu_neg(cpu)->icount_decr.u16.low++;
-        env->hflags &= ~MIPS_HFLAG_BMASK;
-        n = 2;
-    }
-#elif defined(TARGET_SH4)
+#if defined(TARGET_SH4)
     if ((env->flags & ((DELAY_SLOT | DELAY_SLOT_CONDITIONAL))) != 0
         && env->pc != tb->pc) {
         env->pc -= 2;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index ad163ead62..bf70c77295 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -268,6 +268,23 @@ static void mips_cpu_synchronize_from_tb(CPUState *cs,
     env->hflags &= ~MIPS_HFLAG_BMASK;
     env->hflags |= tb->flags & MIPS_HFLAG_BMASK;
 }
+
+# ifndef CONFIG_USER_ONLY
+static bool mips_io_recompile_replay_branch(CPUState *cs,
+                                            const TranslationBlock *tb)
+{
+    MIPSCPU *cpu = MIPS_CPU(cs);
+    CPUMIPSState *env = &cpu->env;
+
+    if ((env->hflags & MIPS_HFLAG_BMASK) != 0
+        && env->active_tc.PC != tb->pc) {
+        env->active_tc.PC -= (env->hflags & MIPS_HFLAG_B16 ? 2 : 4);
+        env->hflags &= ~MIPS_HFLAG_BMASK;
+        return true;
+    }
+    return false;
+}
+# endif /* !CONFIG_USER_ONLY */
 #endif /* CONFIG_TCG */
 
 static bool mips_cpu_has_work(CPUState *cs)
@@ -679,6 +696,7 @@ static struct TCGCPUOps mips_tcg_ops = {
     .do_interrupt = mips_cpu_do_interrupt,
     .do_transaction_failed = mips_cpu_do_transaction_failed,
     .do_unaligned_access = mips_cpu_do_unaligned_access,
+    .io_recompile_replay_branch = mips_io_recompile_replay_branch,
 #endif /* !CONFIG_USER_ONLY */
 };
 #endif /* CONFIG_TCG */
-- 
2.20.1


