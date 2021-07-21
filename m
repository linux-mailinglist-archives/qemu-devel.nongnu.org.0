Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4513D3D17E3
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 22:21:27 +0200 (CEST)
Received: from localhost ([::1]:49996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Iic-0007zk-A8
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 16:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IOR-00031g-96
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:38 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:39773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IOP-0005yq-0F
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:35 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 k4-20020a17090a5144b02901731c776526so511324pjm.4
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 13:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9GWkaKyRsG77alB6vA/2Z/4XpERa6jrLA8YHoeRukk0=;
 b=g0o6AtAON5ZZ3g/uJciZbtP5yf/rRKkIxLQFryEXVCuGXPFoDM/rAhtKg3+Tm0TjHo
 TLUn/d1GGY0fc0E98grVyjNTaPLU3guQ5RNIaAOK4EDlRIk0vnFRjIE5bcV7Vecj2CZ6
 Pf+y6i2Qjl6Ixr5Dg+WNrHWKDomHGreGBT3sd8cgPMdaNBmppu2WaB9eolFdvUmhc3RQ
 Sh6LDU8GyXJtNFyECAkNzLXGQaK+7Yvz3qFxM6HAfSJwgNRwEKWh12nGoVuSX0SIRvUP
 kF5wgRVlIpED5wgEVuP0rHCvBc7lepZS4sDO9s22myznjuW7cr8XqCbLA4GYbg9RhJm0
 1S3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9GWkaKyRsG77alB6vA/2Z/4XpERa6jrLA8YHoeRukk0=;
 b=mnHJXvWwmfoqooDZM6zkuqGRsVPpJWBxhLlD2bSn5m2CfhHbaqD+I0E8nlUG57mvtG
 3xSuEcC2N/jKnh0S98yqX3MqmGnFKGa4NP1YiS13RrABaElXq0UqRmvN6jV3P4xC++j9
 1zX/eJUeqUOVJGGpqF5op2bZ0zQE9fJohUYqzC7O43ibYtSGdKEWdA23ZedBdGpGxSar
 1JMgT8uCkc3SXVCAjTE30O+SjQqVFZTJNnC7HSQyym/b3NiNoNNxhiDsDxiCFlhX7HGe
 kmNeKItTjLbXIthF+K9lct+awUV2A5sANE7dz+x1GPY9fcMMj71g997FEGVmF28h0CB3
 L7Eg==
X-Gm-Message-State: AOAM533tqO1pksV8nkcBMQ1Ro2synzCuNLX0Qwxhdu2UxnvhSdHmcztx
 8R8TXrWrZcLAZHIc2OVygOEydK/wX5u4ug==
X-Google-Smtp-Source: ABdhPJxbXSn63Qws8znP/pTsyvxr0txO2nrojjwXYBgW++sAIIxf8d41YZOHsnC7rB61qB7ZrRdprg==
X-Received: by 2002:a17:902:e04e:b029:10f:133f:87c8 with SMTP id
 x14-20020a170902e04eb029010f133f87c8mr28962199plx.70.1626897629593; 
 Wed, 21 Jul 2021 13:00:29 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id w3sm706028pjq.12.2021.07.21.13.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:00:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/27] accel/tcg: Move breakpoint recognition outside
 translation
Date: Wed, 21 Jul 2021 09:59:51 -1000
Message-Id: <20210721195954.879535-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721195954.879535-1-richard.henderson@linaro.org>
References: <20210721195954.879535-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trigger breakpoints before beginning translation of a TB
that would begin with a BP.  Thus we never generate code
for the BP at all.

Single-step instructions within a page containing a BP so
that we are sure to check each insn for the BP as above.

We no longer need to flush any TBs when changing BPs.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/286
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/404
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/489
Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c   | 91 ++++++++++++++++++++++++++++++++++++++++--
 accel/tcg/translator.c | 24 +----------
 cpu.c                  | 20 ----------
 3 files changed, 89 insertions(+), 46 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index cde7069eb7..5cc6363f4c 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -222,6 +222,76 @@ static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
     }
 }
 
+static bool check_for_breakpoints(CPUState *cpu, target_ulong pc,
+                                  uint32_t *cflags)
+{
+    CPUBreakpoint *bp;
+    bool match_page = false;
+
+    if (likely(QTAILQ_EMPTY(&cpu->breakpoints))) {
+        return false;
+    }
+
+    /*
+     * Singlestep overrides breakpoints.
+     * This requirement is visible in the record-replay tests, where
+     * we would fail to make forward progress in reverse-continue.
+     *
+     * TODO: gdb singlestep should only override gdb breakpoints,
+     * so that one could (gdb) singlestep into the guest kernel's
+     * architectural breakpoint handler.
+     */
+    if (cpu->singlestep_enabled) {
+        return false;
+    }
+
+    QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
+        /*
+         * If we have an exact pc match, trigger the breakpoint.
+         * Otherwise, note matches within the page.
+         */
+        if (pc == bp->pc) {
+            bool match_bp = false;
+
+            if (bp->flags & BP_GDB) {
+                match_bp = true;
+            } else if (bp->flags & BP_CPU) {
+#ifdef CONFIG_USER_ONLY
+                g_assert_not_reached();
+#else
+                CPUClass *cc = CPU_GET_CLASS(cpu);
+                assert(cc->tcg_ops->debug_check_breakpoint);
+                match_bp = cc->tcg_ops->debug_check_breakpoint(cpu);
+#endif
+            }
+
+            if (match_bp) {
+                cpu->exception_index = EXCP_DEBUG;
+                return true;
+            }
+        } else if (((pc ^ bp->pc) & TARGET_PAGE_MASK) == 0) {
+            match_page = true;
+        }
+    }
+
+    /*
+     * Within the same page as a breakpoint, single-step,
+     * returning to helper_lookup_tb_ptr after each insn looking
+     * for the actual breakpoint.
+     *
+     * TODO: Perhaps better to record all of the TBs associated
+     * with a given virtual page that contains a breakpoint, and
+     * then invalidate them when a new overlapping breakpoint is
+     * set on the page.  Non-overlapping TBs would not be
+     * invalidated, nor would any TB need to be invalidated as
+     * breakpoints are removed.
+     */
+    if (match_page) {
+        *cflags = (*cflags & ~CF_COUNT_MASK) | CF_NO_GOTO_TB | 1;
+    }
+    return false;
+}
+
 /**
  * helper_lookup_tb_ptr: quick check for next tb
  * @env: current cpu state
@@ -235,11 +305,16 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState *env)
     CPUState *cpu = env_cpu(env);
     TranslationBlock *tb;
     target_ulong cs_base, pc;
-    uint32_t flags;
+    uint32_t flags, cflags;
 
     cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
 
-    tb = tb_lookup(cpu, pc, cs_base, flags, curr_cflags(cpu));
+    cflags = curr_cflags(cpu);
+    if (check_for_breakpoints(cpu, pc, &cflags)) {
+        cpu_loop_exit(cpu);
+    }
+
+    tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
     if (tb == NULL) {
         return tcg_code_gen_epilogue;
     }
@@ -346,6 +421,12 @@ void cpu_exec_step_atomic(CPUState *cpu)
         cflags &= ~CF_PARALLEL;
         /* After 1 insn, return and release the exclusive lock. */
         cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR | 1;
+        /*
+         * No need to check_for_breakpoints here.
+         * We only arrive in cpu_exec_step_atomic after beginning execution
+         * of an insn that includes an atomic operation we can't handle.
+         * Any breakpoint for this insn will have been recognized earlier.
+         */
 
         tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
         if (tb == NULL) {
@@ -837,6 +918,8 @@ int cpu_exec(CPUState *cpu)
             target_ulong cs_base, pc;
             uint32_t flags, cflags;
 
+            cpu_get_tb_cpu_state(cpu->env_ptr, &pc, &cs_base, &flags);
+
             /*
              * When requested, use an exact setting for cflags for the next
              * execution.  This is used for icount, precise smc, and stop-
@@ -851,7 +934,9 @@ int cpu_exec(CPUState *cpu)
                 cpu->cflags_next_tb = -1;
             }
 
-            cpu_get_tb_cpu_state(cpu->env_ptr, &pc, &cs_base, &flags);
+            if (check_for_breakpoints(cpu, pc, &cflags)) {
+                break;
+            }
 
             tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
             if (tb == NULL) {
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index a59eb7c11b..4f3728c278 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -50,7 +50,6 @@ bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest)
 void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
                      CPUState *cpu, TranslationBlock *tb, int max_insns)
 {
-    int bp_insn = 0;
     bool plugin_enabled;
 
     /* Initialize DisasContext */
@@ -85,27 +84,6 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
             plugin_gen_insn_start(cpu, db);
         }
 
-        /* Pass breakpoint hits to target for further processing */
-        if (!db->singlestep_enabled
-            && unlikely(!QTAILQ_EMPTY(&cpu->breakpoints))) {
-            CPUBreakpoint *bp;
-            QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
-                if (bp->pc == db->pc_next) {
-                    if (ops->breakpoint_check(db, cpu, bp)) {
-                        bp_insn = 1;
-                        break;
-                    }
-                }
-            }
-            /* The breakpoint_check hook may use DISAS_TOO_MANY to indicate
-               that only one more instruction is to be executed.  Otherwise
-               it should use DISAS_NORETURN when generating an exception,
-               but may use a DISAS_TARGET_* value for Something Else.  */
-            if (db->is_jmp > DISAS_TOO_MANY) {
-                break;
-            }
-        }
-
         /* Disassemble one instruction.  The translate_insn hook should
            update db->pc_next and db->is_jmp to indicate what should be
            done next -- either exiting this loop or locate the start of
@@ -144,7 +122,7 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
 
     /* Emit code to exit the TB, as indicated by db->is_jmp.  */
     ops->tb_stop(db, cpu);
-    gen_tb_end(db->tb, db->num_insns - bp_insn);
+    gen_tb_end(db->tb, db->num_insns);
 
     if (plugin_enabled) {
         plugin_gen_tb_end(cpu);
diff --git a/cpu.c b/cpu.c
index 91d9e38acb..d6ae5ae581 100644
--- a/cpu.c
+++ b/cpu.c
@@ -225,11 +225,6 @@ void tb_invalidate_phys_addr(target_ulong addr)
     tb_invalidate_phys_page_range(addr, addr + 1);
     mmap_unlock();
 }
-
-static void breakpoint_invalidate(CPUState *cpu, target_ulong pc)
-{
-    tb_invalidate_phys_addr(pc);
-}
 #else
 void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs)
 {
@@ -250,17 +245,6 @@ void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs)
     ram_addr = memory_region_get_ram_addr(mr) + addr;
     tb_invalidate_phys_page_range(ram_addr, ram_addr + 1);
 }
-
-static void breakpoint_invalidate(CPUState *cpu, target_ulong pc)
-{
-    /*
-     * There may not be a virtual to physical translation for the pc
-     * right now, but there may exist cached TB for this pc.
-     * Flush the whole TB cache to force re-translation of such TBs.
-     * This is heavyweight, but we're debugging anyway.
-     */
-    tb_flush(cpu);
-}
 #endif
 
 /* Add a breakpoint.  */
@@ -286,8 +270,6 @@ int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
         QTAILQ_INSERT_TAIL(&cpu->breakpoints, bp, entry);
     }
 
-    breakpoint_invalidate(cpu, pc);
-
     if (breakpoint) {
         *breakpoint = bp;
     }
@@ -320,8 +302,6 @@ void cpu_breakpoint_remove_by_ref(CPUState *cpu, CPUBreakpoint *bp)
 {
     QTAILQ_REMOVE(&cpu->breakpoints, bp, entry);
 
-    breakpoint_invalidate(cpu, bp->pc);
-
     trace_breakpoint_remove(cpu->cpu_index, bp->pc, bp->flags);
     g_free(bp);
 }
-- 
2.25.1


