Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 962E1317366
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:33:18 +0100 (CET)
Received: from localhost ([::1]:35928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9y2t-0000ky-V1
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:33:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xhl-0006Ii-45
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:11:26 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xhg-0003L5-Ev
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:11:24 -0500
Received: by mail-wm1-x32b.google.com with SMTP id y134so3307329wmd.3
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=maKaI/qzwTXOe899gbp1Af9qP827gN0VYDNXRtqE7f8=;
 b=BnRJ6TMA1Fz8nSbo6qVYjZzR/6j+e3mCokFjSS18/v7JeRZUFspfyqFGl0fV4GocSI
 FvwLegdVMCNjiTfrq7n3B7eC7kqhgxKVl0BfwCQKi/AFsSSf1yerk8mp+fVFc0jdRpyo
 /chpAte7At3NS0x807qy+5SpuBCBlFUiFOipd9aoMAnlWgo7ADP+0pGU3U3/wrj5s2rE
 SKOBTHM66BACAUuSDaUbHxx3AdjsAFcmir2g+F1pq+Iw0D50IX1KIdE4CkrDOLkBsyIr
 jwSOfE91+2xIyX75wYV2SUVS5UIZvKyay0oosN1FWbSBXSwGZNxpO//4M7MW8L/C3MCQ
 /rtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=maKaI/qzwTXOe899gbp1Af9qP827gN0VYDNXRtqE7f8=;
 b=iQAz4vlTDP8oj453DH3qNmYEQO8YO9+iAw/tL8GTNh6oArdYLZx3u6EzcpfedSnzgj
 gKZ1gTRQ9dSUFBCUwDKQXf58RV/29pvHiWJ8QrXb9kFFd+2NLIlMHZ3N2yEcLrje65Ce
 pEFZtBWEPfBTVooD4IYKdt/PhuGFT9VYSkhCp0Oko4ulxrEbbIrhukdD/FwkuPeyrjc8
 XUsJlvzVW6mfOceEHD0GetiSzeeuYR3xGhmhKpiLQAS7I0qlUSsrdHpTNVraFsgDpxEw
 2Q/z1yesQOedPXsXLG24HWhiNj0gHdWqSL3cHM1Qk/dQz3KY1oguQFgDIp0sBu/Ya5j6
 DOWg==
X-Gm-Message-State: AOAM532GYhIz1yaiSMxiY8IpSmKzePgF3ajp6PEnn2DMccNcoAWq2ndW
 dkRYRNSOA61SjgROTCXcbsS7BA==
X-Google-Smtp-Source: ABdhPJxRYsPFYy58IQ6r4t73WTS1IMGMgv/HyUp+bMSfQEG9YdDH6pXp6Xfpv16DQrath/FGvYC5hg==
X-Received: by 2002:a05:600c:3506:: with SMTP id
 h6mr1192328wmq.21.1612995079131; 
 Wed, 10 Feb 2021 14:11:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j17sm4537337wmc.28.2021.02.10.14.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:11:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BC52D1FF9B;
 Wed, 10 Feb 2021 22:10:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/21] target/mips: Create mips_io_recompile_replay_branch
Date: Wed, 10 Feb 2021 22:10:44 +0000
Message-Id: <20210210221053.18050-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210210221053.18050-1-alex.bennee@linaro.org>
References: <20210210221053.18050-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Move the code from accel/tcg/translate-all.c to target/mips/cpu.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210208233906.479571-4-richard.henderson@linaro.org>
Message-Id: <20210209182749.31323-4-alex.bennee@linaro.org>
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


