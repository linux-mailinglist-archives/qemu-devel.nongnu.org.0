Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D15510761
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:46:49 +0200 (CEST)
Received: from localhost ([::1]:48178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQD2-0003GA-UP
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmn-0002jM-6k
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:41 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:40816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPml-0004SK-A5
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:40 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 iq2-20020a17090afb4200b001d93cf33ae9so2839906pjb.5
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f5/eHgJ89Bw1Fi14EqcdKUKLBG0n+ns6jn+rbbcLZws=;
 b=WwtkxSc63TR/3JfuNCDNE27rMTQdesPh+5CUNjXnrkWEsHI0iKJLQuQfrNNSkrLwHx
 VfZCZ6bHMrLrppMfgaIqGnPaoJHpvuQHsRIYqkbAugQmw1TdIpB93uA8hf/amwpGLo60
 6oUobFnDLqnOFA2Y2QsMZ/Rg++FMoeN/0r1drjN76wZt7fvI945yEvXGS4cTwBkW0prd
 6U+KtZLvxsBZWdCKNiV7hp77mrWTzBxG+NtJXO0/eG2pfmAp52PWAzq6RuJTKfnWuV4f
 osMDPUsJudA/pkpj3/dai3YEDvpgn7QvhU4bbxurlgYv9qPWK9m3RrsTmAmAm8sIB8Tq
 Na+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f5/eHgJ89Bw1Fi14EqcdKUKLBG0n+ns6jn+rbbcLZws=;
 b=6lBvbr5sEPhMLq5yEtnd+rWJNn8IaFkTmAuy+Lcb62crQpgI+ObYGZKYuvzKIPLbQ2
 900Xu0hvgk8iryIwJJ+87ghfxnhawAc4b29I3DqI0kobPTx/yoVNEveYyQW2IAv4c2+4
 RKHvussIGTZTM5fwlYgvL+hgsJil/x5D4DxtMyBBgEuZ4EGO8OGTvWPB9dgJhcPOO3m0
 m6m6LVT4kJVQabUK2gaP81OJzeFgvV/xgJu6Scr4yH7VTNYBf0ApGxXJLQL/Av3JRquU
 kQvq6CXNRzdEsZL1biTF30TM4GftUjj/7g+NyGoXqlNNWl7AChArmPIXv7T11taUpILb
 8FnQ==
X-Gm-Message-State: AOAM531TLhIHDZyAGeb3b55rm5KVfFK1uvLLjA7UQGS7wwBt/BG0klvh
 e4t/UYneaF3LKvxkUgmJsHw83mjBQ9jvFA==
X-Google-Smtp-Source: ABdhPJzfXgx6Lt604q+4azAGwC/K+OUsiZFkoHvwCA9a4f54TMz7D6b82cZwBkg4Z3BG9bbphB+BLw==
X-Received: by 2002:a17:902:d1cd:b0:15d:1483:6ed6 with SMTP id
 g13-20020a170902d1cd00b0015d14836ed6mr12139126plb.58.1650997178004; 
 Tue, 26 Apr 2022 11:19:38 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/68] target/nios2: Clean up nios2_cpu_do_interrupt
Date: Tue, 26 Apr 2022 11:18:31 -0700
Message-Id: <20220426181907.103691-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Split out do_exception and do_iic_irq to handle bulk of the interrupt and
exception processing.  Parameterize the changes required to cpu state.

The status.EH bit, which protects some data against double-faults,
is only present with the MMU.  Several exception cases did not check
for status.EH being set, as required.

The status.IH bit, which had been set by EXCP_IRQ, is exclusive to
the external interrupt controller, which we do not yet implement.
The internal interrupt controller, when the MMU is also present,
sets the status.EH bit.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-33-richard.henderson@linaro.org>
---
 target/nios2/helper.c | 141 +++++++++++++-----------------------------
 1 file changed, 44 insertions(+), 97 deletions(-)

diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 1d17c0379f..63971a8b3c 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -29,6 +29,42 @@
 #include "semihosting/semihost.h"
 
 
+static void do_exception(Nios2CPU *cpu, uint32_t exception_addr, bool is_break)
+{
+    CPUNios2State *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
+    uint32_t old_status = env->ctrl[CR_STATUS];
+    uint32_t new_status = old_status;
+
+    if ((old_status & CR_STATUS_EH) == 0) {
+        int r_ea = R_EA, cr_es = CR_ESTATUS;
+
+        if (is_break) {
+            r_ea = R_BA;
+            cr_es = CR_BSTATUS;
+        }
+        env->ctrl[cr_es] = old_status;
+        env->regs[r_ea] = env->pc + 4;
+
+        if (cpu->mmu_present) {
+            new_status |= CR_STATUS_EH;
+        }
+    }
+
+    new_status &= ~(CR_STATUS_PIE | CR_STATUS_U);
+
+    env->ctrl[CR_STATUS] = new_status;
+    env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
+                                         CR_EXCEPTION, CAUSE,
+                                         cs->exception_index);
+    env->pc = exception_addr;
+}
+
+static void do_iic_irq(Nios2CPU *cpu)
+{
+    do_exception(cpu, cpu->exception_addr, false);
+}
+
 void nios2_cpu_do_interrupt(CPUState *cs)
 {
     Nios2CPU *cpu = NIOS2_CPU(cs);
@@ -36,57 +72,20 @@ void nios2_cpu_do_interrupt(CPUState *cs)
 
     switch (cs->exception_index) {
     case EXCP_IRQ:
-        assert(env->ctrl[CR_STATUS] & CR_STATUS_PIE);
-
         qemu_log_mask(CPU_LOG_INT, "interrupt at pc=%x\n", env->pc);
-
-        env->ctrl[CR_ESTATUS] = env->ctrl[CR_STATUS];
-        env->ctrl[CR_STATUS] |= CR_STATUS_IH;
-        env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
-
-        env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
-                                             CR_EXCEPTION, CAUSE,
-                                             cs->exception_index);
-
-        env->regs[R_EA] = env->pc + 4;
-        env->pc = cpu->exception_addr;
+        do_iic_irq(cpu);
         break;
 
     case EXCP_TLBD:
         if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
             qemu_log_mask(CPU_LOG_INT, "TLB MISS (fast) at pc=%x\n", env->pc);
-
-            /* Fast TLB miss */
-            /* Variation from the spec. Table 3-35 of the cpu reference shows
-             * estatus not being changed for TLB miss but this appears to
-             * be incorrect. */
-            env->ctrl[CR_ESTATUS] = env->ctrl[CR_STATUS];
-            env->ctrl[CR_STATUS] |= CR_STATUS_EH;
-            env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
-
-            env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
-                                                 CR_EXCEPTION, CAUSE,
-                                                 cs->exception_index);
-
             env->ctrl[CR_TLBMISC] &= ~CR_TLBMISC_DBL;
             env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WE;
-
-            env->regs[R_EA] = env->pc + 4;
-            env->pc = cpu->fast_tlb_miss_addr;
+            do_exception(cpu, cpu->fast_tlb_miss_addr, false);
         } else {
             qemu_log_mask(CPU_LOG_INT, "TLB MISS (double) at pc=%x\n", env->pc);
-
-            /* Double TLB miss */
-            env->ctrl[CR_STATUS] |= CR_STATUS_EH;
-            env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
-
-            env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
-                                                 CR_EXCEPTION, CAUSE,
-                                                 cs->exception_index);
-
             env->ctrl[CR_TLBMISC] |= CR_TLBMISC_DBL;
-
-            env->pc = cpu->exception_addr;
+            do_exception(cpu, cpu->exception_addr, false);
         }
         break;
 
@@ -94,78 +93,28 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     case EXCP_TLBW:
     case EXCP_TLBX:
         qemu_log_mask(CPU_LOG_INT, "TLB PERM at pc=%x\n", env->pc);
-
-        env->ctrl[CR_ESTATUS] = env->ctrl[CR_STATUS];
-        env->ctrl[CR_STATUS] |= CR_STATUS_EH;
-        env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
-
-        env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
-                                             CR_EXCEPTION, CAUSE,
-                                             cs->exception_index);
-
         if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
             env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WE;
         }
-
-        env->regs[R_EA] = env->pc + 4;
-        env->pc = cpu->exception_addr;
+        do_exception(cpu, cpu->exception_addr, false);
         break;
 
     case EXCP_SUPERA:
     case EXCP_SUPERI:
     case EXCP_SUPERD:
         qemu_log_mask(CPU_LOG_INT, "SUPERVISOR exception at pc=%x\n", env->pc);
-
-        if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
-            env->ctrl[CR_ESTATUS] = env->ctrl[CR_STATUS];
-            env->regs[R_EA] = env->pc + 4;
-        }
-
-        env->ctrl[CR_STATUS] |= CR_STATUS_EH;
-        env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
-
-        env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
-                                             CR_EXCEPTION, CAUSE,
-                                             cs->exception_index);
-
-        env->pc = cpu->exception_addr;
+        do_exception(cpu, cpu->exception_addr, false);
         break;
 
     case EXCP_ILLEGAL:
     case EXCP_TRAP:
         qemu_log_mask(CPU_LOG_INT, "TRAP exception at pc=%x\n", env->pc);
-
-        if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
-            env->ctrl[CR_ESTATUS] = env->ctrl[CR_STATUS];
-            env->regs[R_EA] = env->pc + 4;
-        }
-
-        env->ctrl[CR_STATUS] |= CR_STATUS_EH;
-        env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
-
-        env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
-                                             CR_EXCEPTION, CAUSE,
-                                             cs->exception_index);
-
-        env->pc = cpu->exception_addr;
+        do_exception(cpu, cpu->exception_addr, false);
         break;
 
     case EXCP_BREAK:
         qemu_log_mask(CPU_LOG_INT, "BREAK exception at pc=%x\n", env->pc);
-
-        if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
-            env->ctrl[CR_BSTATUS] = env->ctrl[CR_STATUS];
-            env->regs[R_BA] = env->pc + 4;
-        }
-
-        env->ctrl[CR_STATUS] |= CR_STATUS_EH;
-        env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
-
-        env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
-                                             CR_EXCEPTION, CAUSE,
-                                             cs->exception_index);
-
-        env->pc = cpu->exception_addr;
+        do_exception(cpu, cpu->exception_addr, true);
         break;
 
     case EXCP_SEMIHOST:
@@ -175,9 +124,7 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         break;
 
     default:
-        cpu_abort(cs, "unhandled exception type=%d\n",
-                  cs->exception_index);
-        break;
+        cpu_abort(cs, "unhandled exception type=%d\n", cs->exception_index);
     }
 }
 
-- 
2.34.1


