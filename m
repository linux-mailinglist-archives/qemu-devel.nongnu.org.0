Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE303242D9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 18:06:00 +0100 (CET)
Received: from localhost ([::1]:39556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lExbr-0008PA-6I
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 12:05:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lExUU-0003HL-Oo
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:58:24 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:53261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lExUN-00072g-MU
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:58:22 -0500
Received: by mail-wm1-x32e.google.com with SMTP id x16so2381861wmk.3
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 08:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AwSqA5g84lGAhAL1w2zSXZBGJIZPg/hYExK6AypbDmU=;
 b=JIroZYon6oOABliT3VnssgHgpzb0aXrMsoYARFHKPdWe8I7MwMnOmcXEVejPamlAoE
 IjXcU0E9ULHHIZPdxytl59yS/il3RimpmD8u5tvhU2tlTbezR7YEUfbwdvxQ27u+EPjY
 Gp9TqNT3RWP6XlQ5LjrLBBL4nujg31uThuNrfH2aAxyn0ljChX0jl8JfuIpzM/2mlzD2
 TIjAlnIdJKsFHpydU7S8ivqZBqyguWWNapOF0vRVQ4NqdIKrl+6JB4p7g/455pQflYjv
 uX5g+ZZ7lASMcjkPIDi4KjLZDNoQjkr/ZAA2rQxiRvZT+LafX2H9qA/XhA60E4rDXTlW
 1OEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AwSqA5g84lGAhAL1w2zSXZBGJIZPg/hYExK6AypbDmU=;
 b=ltGNUhDoxz3dzKYEP9eyzTpt9EWIvMsJaaz5wEgQbcHU8latml3kApVTWlWVNA5+R5
 h0w0mlQb/zcLKOFiZGiIHcsgFU6XANWSw3XOLlA8uaguuGlbOxXU2l9KpusXV0YbLzy2
 FAdplRVv8vE16DkM4xTLRZeA7Loo0SGGwoul32tLzVO+QEl3E62BOxtfKW7G/e2eG7rQ
 hzdSSy9sxL8FJA5lcIeL1fRg99+A5PWwW+Zasu0kjat+UUpvHw/e6ENzgeN40m/VgwSW
 yuEBz2T1/mLDKkryy75DcFmjug5Yn+NQXjD456g5FTrWZjmRMjA+ndAwi7mqU1IjNbTq
 xwHA==
X-Gm-Message-State: AOAM530bknZwrYYQzGuvL0TylGO53kk4Glh6sZm2J59D2vEx8UQP0lOe
 8/4iOhiGWVLFH57t/xy2yJlvVA==
X-Google-Smtp-Source: ABdhPJxvnvvYUbpxSDEMX9JEGKnc7WYNafK/uqc2RIKpvFoTmpN4ogcFyC7OzB4XDC0i4+kt7/baOg==
X-Received: by 2002:a1c:c903:: with SMTP id f3mr4548876wmb.69.1614185893103;
 Wed, 24 Feb 2021 08:58:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g63sm4150970wma.40.2021.02.24.08.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 08:58:12 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7721D1FF87;
 Wed, 24 Feb 2021 16:58:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Subject: [RFC PATCH 1/5] accel/tcg: rename tb_lookup__cpu_state and hoist
 state extraction
Date: Wed, 24 Feb 2021 16:58:07 +0000
Message-Id: <20210224165811.11567-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210224165811.11567-1-alex.bennee@linaro.org>
References: <20210224165811.11567-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

Having a function return either and valid TB and some system state
seems excessive. It will make the subsequent re-factoring easier if we
lookup the current state where we are.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/tb-lookup.h | 18 ++++++++----------
 accel/tcg/cpu-exec.c     | 10 ++++++++--
 accel/tcg/tcg-runtime.c  |  4 +++-
 3 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/include/exec/tb-lookup.h b/include/exec/tb-lookup.h
index 9cf475bb03..62a509535d 100644
--- a/include/exec/tb-lookup.h
+++ b/include/exec/tb-lookup.h
@@ -17,30 +17,28 @@
 #include "exec/tb-hash.h"
 
 /* Might cause an exception, so have a longjmp destination ready */
-static inline TranslationBlock *
-tb_lookup__cpu_state(CPUState *cpu, target_ulong *pc, target_ulong *cs_base,
-                     uint32_t *flags, uint32_t cf_mask)
+static inline TranslationBlock * tb_lookup(CPUState *cpu,
+                                           target_ulong pc, target_ulong cs_base,
+                                           uint32_t flags, uint32_t cf_mask)
 {
-    CPUArchState *env = (CPUArchState *)cpu->env_ptr;
     TranslationBlock *tb;
     uint32_t hash;
 
-    cpu_get_tb_cpu_state(env, pc, cs_base, flags);
-    hash = tb_jmp_cache_hash_func(*pc);
+    hash = tb_jmp_cache_hash_func(pc);
     tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash]);
 
     cf_mask &= ~CF_CLUSTER_MASK;
     cf_mask |= cpu->cluster_index << CF_CLUSTER_SHIFT;
 
     if (likely(tb &&
-               tb->pc == *pc &&
-               tb->cs_base == *cs_base &&
-               tb->flags == *flags &&
+               tb->pc == pc &&
+               tb->cs_base == cs_base &&
+               tb->flags == flags &&
                tb->trace_vcpu_dstate == *cpu->trace_dstate &&
                (tb_cflags(tb) & (CF_HASH_MASK | CF_INVALID)) == cf_mask)) {
         return tb;
     }
-    tb = tb_htable_lookup(cpu, *pc, *cs_base, *flags, cf_mask);
+    tb = tb_htable_lookup(cpu, pc, cs_base, flags, cf_mask);
     if (tb == NULL) {
         return NULL;
     }
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 16e4fe3ccd..ef96b312a1 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -245,6 +245,7 @@ static void cpu_exec_exit(CPUState *cpu)
 
 void cpu_exec_step_atomic(CPUState *cpu)
 {
+    CPUArchState *env = (CPUArchState *)cpu->env_ptr;
     TranslationBlock *tb;
     target_ulong cs_base, pc;
     uint32_t flags;
@@ -258,7 +259,9 @@ void cpu_exec_step_atomic(CPUState *cpu)
         g_assert(!cpu->running);
         cpu->running = true;
 
-        tb = tb_lookup__cpu_state(cpu, &pc, &cs_base, &flags, cf_mask);
+        cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
+        tb = tb_lookup(cpu, pc, cs_base, flags, cf_mask);
+
         if (tb == NULL) {
             mmap_lock();
             tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
@@ -418,11 +421,14 @@ static inline TranslationBlock *tb_find(CPUState *cpu,
                                         TranslationBlock *last_tb,
                                         int tb_exit, uint32_t cf_mask)
 {
+    CPUArchState *env = (CPUArchState *)cpu->env_ptr;
     TranslationBlock *tb;
     target_ulong cs_base, pc;
     uint32_t flags;
 
-    tb = tb_lookup__cpu_state(cpu, &pc, &cs_base, &flags, cf_mask);
+    cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
+
+    tb = tb_lookup(cpu, pc, cs_base, flags, cf_mask);
     if (tb == NULL) {
         mmap_lock();
         tb = tb_gen_code(cpu, pc, cs_base, flags, cf_mask);
diff --git a/accel/tcg/tcg-runtime.c b/accel/tcg/tcg-runtime.c
index d736f4ff55..05e3d52c2f 100644
--- a/accel/tcg/tcg-runtime.c
+++ b/accel/tcg/tcg-runtime.c
@@ -152,7 +152,9 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState *env)
     target_ulong cs_base, pc;
     uint32_t flags;
 
-    tb = tb_lookup__cpu_state(cpu, &pc, &cs_base, &flags, curr_cflags());
+    cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
+
+    tb = tb_lookup(cpu, pc, cs_base, flags, curr_cflags());
     if (tb == NULL) {
         return tcg_code_gen_epilogue;
     }
-- 
2.20.1


