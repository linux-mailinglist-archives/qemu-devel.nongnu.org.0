Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E26E43155FD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 19:36:22 +0100 (CET)
Received: from localhost ([::1]:50080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Xs5-0003Qj-VY
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 13:36:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Xjx-0002mS-U1
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:27:57 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:50782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Xjw-0007mO-27
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:27:57 -0500
Received: by mail-wm1-x333.google.com with SMTP id 190so4176221wmz.0
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 10:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DCYLKD8lKHBC7zqZxsTt0jNxWwRKIBBIOHuXIK5gJKg=;
 b=ZT+jFby6CcB/HaeXekybKcyT8N1uK8Tc69ilxcaQv0BcLI8N2QLBrGIrltXQyfDmcl
 4w9L3WV6wD02OA0m0XDvLDxYwr+3hAQ0e7s5/IOgBxl29uRQTU6gTfxRfe+Fh7sKR7IC
 JuObPYX9Awt2twZKss0KRsrakWq2Sd4TmN/51xq0VMKen7iC79yUdjDJV8wc+L43Rq3h
 k43Cb3sgT4qOGeAvjlVa6EvKGwobKk8sCP3qLNxCHHdMZKfvFlrI/pV3GJq5uKZnzB0n
 ngXxEivwOreb4JYGcSsJ5IfmH2Nhtn325NXVUbiRxsH1X2GrizKlPZz+xJddqjTbyzLw
 FeUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DCYLKD8lKHBC7zqZxsTt0jNxWwRKIBBIOHuXIK5gJKg=;
 b=taoiPOFm35jAZRgsTPc7JEIB/6rn4fE95rO/ajG6r+0hkQDcXWmMTt6voR9fif+2yz
 N6ZrHubB3NMtNa29hcaCkSk6S6dhaHe3MpYsfmGgGFZltWxgrUqi02eeEy7BHkK5afyv
 pvjetRZoMZwgmVxN0s1Mhukw70BiFdHtO+WpP3kKzGALZb7EJb35ldBL17pL/JIOPppx
 7qqny3JzOyfUsBFo4RDRcGB1ZBeMmy6/2RZcLiwP5TFvzO7+mS61O6BnrRR0e7sVd6W1
 dE423nhq9U/OuYZ0w7y5uWW3aZBQCW+ls56sLbUpSMR0UzQrHS9MmyoTGl22Nl9S5m9N
 omLQ==
X-Gm-Message-State: AOAM530BIkZWJbirK/f5pbExe2dBga0KmRv1VIekE4blu/rtQY6rMOw5
 2sQyxM6qkny2ZbmQqYQiDxshOA==
X-Google-Smtp-Source: ABdhPJyB2dj35Qlfj5W29Op62Ky2LXuf6BqhU9blDiupNynR+zIBXgLMv9Po7snNxdDiRIE6XhIZEw==
X-Received: by 2002:a05:600c:47d7:: with SMTP id
 l23mr4833252wmo.16.1612895274745; 
 Tue, 09 Feb 2021 10:27:54 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e4sm37194265wrw.96.2021.02.09.10.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 10:27:51 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3564D1FF90;
 Tue,  9 Feb 2021 18:27:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 04/12] target/sh4: Create superh_io_recompile_replay_branch
Date: Tue,  9 Feb 2021 18:27:40 +0000
Message-Id: <20210209182749.31323-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209182749.31323-1-alex.bennee@linaro.org>
References: <20210209182749.31323-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
 Richard Henderson <richard.henderson@linaro.org>, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Move the code from accel/tcg/translate-all.c to target/sh4/cpu.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210208233906.479571-5-richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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


