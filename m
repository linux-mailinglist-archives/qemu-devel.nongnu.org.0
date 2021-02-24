Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 857073242C5
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 18:03:37 +0100 (CET)
Received: from localhost ([::1]:60318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lExZY-0004mb-G6
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 12:03:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lExUW-0003Ho-QM
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:58:24 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lExUP-000748-Ne
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:58:24 -0500
Received: by mail-wm1-x329.google.com with SMTP id k66so2469466wmf.1
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 08:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5tflN3q79KkPgu1AfUv+9Ai33YagcdoNXpl6kgnHQ88=;
 b=z4Twsl1gqeIe/EEbGMuM5b4V0pKi6+P+BW8EsYTsPf16XwGkVUf2i2Mafqce7kSwwE
 9WBhYblXsWfdBhK6+ygiXyu3a6ySOGUf9gT5lwGWJyuZ3Li0vp+89BAz8lsFz4SkyUko
 UzVfKeFKJVb21vYpeeNuJni7V19a8VJ1wtE/wn4WxvfBQQlc9IrKPwlIZokFpzlCjWvj
 IK19bqJRTs77vk4rhw+oDp/QHRcjtV+2+2IIPYn/XVPM8JTCwt3tJhN6vwYNXKyCu7Ba
 AOPoH75fO5W7dt1NIl3F1p9olzZJQ3A4vDhlsIZSB5Ai2ktma+TqEVKMPrdlhNX9nNis
 6Tww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5tflN3q79KkPgu1AfUv+9Ai33YagcdoNXpl6kgnHQ88=;
 b=Q8Yxlmx869fIjhcKyquInWcobFxt+ESMZuQgEv5/Ne2NjAsEJrhEAnQSwQZgCVxwj0
 tEXZYCYSBQ/GqG/nni1HESE5rOuXlD42qeLJAZMXxoAMRC6JV8RFX8Oy5nVtLI9ITY3Q
 Pwd4mEFAufS0w0h4KvwMRnSW9+w4Db9krL/Yva8NPO5/ToHIWrvjpWh4GqQi/sA1IEu1
 F4ZayeG5z0+2j+6xYezjwOVba2DP2uR9iMdlllRI7YYp0SjKOioixl23eePvYwKa6ZJV
 5hFdXsDdhnfoxwxWHWdIq1HCE4PZoTsTIZrOmTfqjFEN3XNkRgFR228O7cJyXRVaSYjY
 71gA==
X-Gm-Message-State: AOAM532/JyppIR20/HMZuNCQBZAJtmryXvnWZYob/qTDMqjrUwLT+JpY
 lxNCDY3DjWn2majlN+SWqDSzyA==
X-Google-Smtp-Source: ABdhPJzDv1KJiO8jO9Z+Dmjj75ymW7f7wIYUb2Aa4qn5vwU2bBfhfANmD99LMbNMTIhBPdwJC/laOg==
X-Received: by 2002:a7b:c957:: with SMTP id i23mr4502790wml.32.1614185896330; 
 Wed, 24 Feb 2021 08:58:16 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 2sm5001720wre.24.2021.02.24.08.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 08:58:12 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9C0561FF8C;
 Wed, 24 Feb 2021 16:58:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Subject: [RFC PATCH 2/5] accel/tcg: move CF_CLUSTER calculation to curr_cflags
Date: Wed, 24 Feb 2021 16:58:08 +0000
Message-Id: <20210224165811.11567-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210224165811.11567-1-alex.bennee@linaro.org>
References: <20210224165811.11567-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, cota@braap.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is nothing special about this compile flag that doesn't mean we
can't just compute it with curr_cflags() which we should be using when
building a new set.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/exec-all.h   | 8 +++++---
 include/exec/tb-lookup.h  | 3 ---
 accel/tcg/cpu-exec.c      | 9 ++++-----
 accel/tcg/tcg-runtime.c   | 2 +-
 accel/tcg/translate-all.c | 6 +++---
 softmmu/physmem.c         | 2 +-
 6 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index b7b3c0ef12..1a69c07add 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -519,10 +519,12 @@ static inline uint32_t tb_cflags(const TranslationBlock *tb)
 }
 
 /* current cflags for hashing/comparison */
-static inline uint32_t curr_cflags(void)
+static inline uint32_t curr_cflags(CPUState *cpu)
 {
-    return (parallel_cpus ? CF_PARALLEL : 0)
-         | (icount_enabled() ? CF_USE_ICOUNT : 0);
+    uint32_t cflags = deposit32(0, CF_CLUSTER_SHIFT, 8, cpu->cluster_index);
+    cflags |= parallel_cpus ? CF_PARALLEL : 0;
+    cflags |= icount_enabled() ? CF_USE_ICOUNT : 0;
+    return cflags;
 }
 
 /* TranslationBlock invalidate API */
diff --git a/include/exec/tb-lookup.h b/include/exec/tb-lookup.h
index 62a509535d..b2247d458b 100644
--- a/include/exec/tb-lookup.h
+++ b/include/exec/tb-lookup.h
@@ -27,9 +27,6 @@ static inline TranslationBlock * tb_lookup(CPUState *cpu,
     hash = tb_jmp_cache_hash_func(pc);
     tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash]);
 
-    cf_mask &= ~CF_CLUSTER_MASK;
-    cf_mask |= cpu->cluster_index << CF_CLUSTER_SHIFT;
-
     if (likely(tb &&
                tb->pc == pc &&
                tb->cs_base == cs_base &&
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index ef96b312a1..45286dc4b3 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -249,8 +249,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
     TranslationBlock *tb;
     target_ulong cs_base, pc;
     uint32_t flags;
-    uint32_t cflags = 1;
-    uint32_t cf_mask = cflags & CF_HASH_MASK;
+    uint32_t cflags = (curr_cflags(cpu) & ~CF_PARALLEL) | 1;
     int tb_exit;
 
     if (sigsetjmp(cpu->jmp_env, 0) == 0) {
@@ -260,7 +259,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
         cpu->running = true;
 
         cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
-        tb = tb_lookup(cpu, pc, cs_base, flags, cf_mask);
+        tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
 
         if (tb == NULL) {
             mmap_lock();
@@ -497,7 +496,7 @@ static inline bool cpu_handle_exception(CPUState *cpu, int *ret)
         if (replay_has_exception()
             && cpu_neg(cpu)->icount_decr.u16.low + cpu->icount_extra == 0) {
             /* Execute just one insn to trigger exception pending in the log */
-            cpu->cflags_next_tb = (curr_cflags() & ~CF_USE_ICOUNT) | 1;
+            cpu->cflags_next_tb = (curr_cflags(cpu) & ~CF_USE_ICOUNT) | 1;
         }
 #endif
         return false;
@@ -794,7 +793,7 @@ int cpu_exec(CPUState *cpu)
                have CF_INVALID set, -1 is a convenient invalid value that
                does not require tcg headers for cpu_common_reset.  */
             if (cflags == -1) {
-                cflags = curr_cflags();
+                cflags = curr_cflags(cpu);
             } else {
                 cpu->cflags_next_tb = -1;
             }
diff --git a/accel/tcg/tcg-runtime.c b/accel/tcg/tcg-runtime.c
index 05e3d52c2f..99403e3eb3 100644
--- a/accel/tcg/tcg-runtime.c
+++ b/accel/tcg/tcg-runtime.c
@@ -154,7 +154,7 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState *env)
 
     cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
 
-    tb = tb_lookup(cpu, pc, cs_base, flags, curr_cflags());
+    tb = tb_lookup(cpu, pc, cs_base, flags, curr_cflags(cpu));
     if (tb == NULL) {
         return tcg_code_gen_epilogue;
     }
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index bbd919a393..f29b47f090 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2194,7 +2194,7 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
     if (current_tb_modified) {
         page_collection_unlock(pages);
         /* Force execution of one insn next time.  */
-        cpu->cflags_next_tb = 1 | curr_cflags();
+        cpu->cflags_next_tb = 1 | curr_cflags(cpu);
         mmap_unlock();
         cpu_loop_exit_noexc(cpu);
     }
@@ -2362,7 +2362,7 @@ static bool tb_invalidate_phys_page(tb_page_addr_t addr, uintptr_t pc)
 #ifdef TARGET_HAS_PRECISE_SMC
     if (current_tb_modified) {
         /* Force execution of one insn next time.  */
-        cpu->cflags_next_tb = 1 | curr_cflags();
+        cpu->cflags_next_tb = 1 | curr_cflags(cpu);
         return true;
     }
 #endif
@@ -2438,7 +2438,7 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
      * operations only (which execute after completion) so we don't
      * double instrument the instruction.
      */
-    cpu->cflags_next_tb = curr_cflags() | CF_MEMI_ONLY | CF_LAST_IO | n;
+    cpu->cflags_next_tb = curr_cflags(cpu) | CF_MEMI_ONLY | CF_LAST_IO | n;
 
     qemu_log_mask_and_addr(CPU_LOG_EXEC, tb->pc,
                            "cpu_io_recompile: rewound execution of TB to "
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 19e0aa9836..7e8b0fab89 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -937,7 +937,7 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                     cpu_loop_exit_restore(cpu, ra);
                 } else {
                     /* Force execution of one insn next time.  */
-                    cpu->cflags_next_tb = 1 | curr_cflags();
+                    cpu->cflags_next_tb = 1 | curr_cflags(cpu);
                     mmap_unlock();
                     if (ra) {
                         cpu_restore_state(cpu, ra, true);
-- 
2.20.1


