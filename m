Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D884079B0
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 19:00:35 +0200 (CEST)
Received: from localhost ([::1]:40116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP6Mk-0007Ks-8T
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 13:00:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6IA-0007oi-Ef
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:55:50 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6I7-0002qd-O8
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:55:49 -0400
Received: by mail-wr1-x432.google.com with SMTP id b6so7462098wrh.10
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 09:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oAm0Jcp7Dg3eAE8iWKGhR4SrU9JkFdpvVtk43FQam+A=;
 b=bYk4YK19R3tHg1IGRF2iRsnM9vViR+YFrMt0Mmds7JaBHsw0h6xsJA70BGDpK1/R7P
 DYu0SZCJ/fJoLJuMdoFqJXz3bXLNQTQhbYOPa8g5+XT2x7k10lDTQnZbJiIErSFaeVdS
 uPab8zz5YNc0DuQ+z6obnzTUtXEVDK/jkLGFzDdLyrsc8hTbs3uVz6sJR/Gqd57OP5F9
 2jLGe3T7Co4ob2p87KOFjkbUv3eap8kdzVdc4sRjcFFP0woRD30qADI8ETV2fMIascnm
 PbjjEDQvTpjZlkjBKAHhrJ9OQe96fXU8lm7Tgye2VTC0aKu4XwdeZoyxVUWSeZ11lECy
 YUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oAm0Jcp7Dg3eAE8iWKGhR4SrU9JkFdpvVtk43FQam+A=;
 b=rgHLw0jcvLsClBxLbZCLgMKnape7TxhC6WbqJaF88PEXgsIxCFYFR2To9i158igwjc
 NaLdxKtJNXUtjZ3peZQHCN6QMKC3C3siHPtYozsWvFgsQAuDqjbMXeepn3ak0mNaEVgc
 lTacp8gi3iCaV0GY4aihmbiFzsKDoR5DDHYZRsqFTHMI0zFgY3n1lZB3vUmvd/S+nGHy
 PULYkrd/sfQc2GfiUBfwSQNIhn2Cte2zIE+KcdYW8D2UqxKD+Dhou4lXveHYGzxOeKoj
 OvNSWxhl0xj4itBEmPAFxozn/z38ZxIO9TMygrnkphvQzyIsJSsU8E1fyNY5YkG8rxUI
 qs9w==
X-Gm-Message-State: AOAM532bCvMGxjzH7eNc5xODAzKzco36u0v9RviqkZtEDkZrOSDdS5E5
 RZpjN/KCaF9DZD+l22h2FwjEF1ENqB0=
X-Google-Smtp-Source: ABdhPJwgeB4ZXpeq3QMZnkfXUYrCTuVhuwdd09ixmf0WqS5ChqzM29iQl+k3gA+aAh2VWXRb9opFKg==
X-Received: by 2002:adf:d1b2:: with SMTP id w18mr4021625wrc.6.1631379346392;
 Sat, 11 Sep 2021 09:55:46 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id h11sm2582477wrx.9.2021.09.11.09.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 09:55:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/24] target/mips: Restrict cpu_exec_interrupt() handler
 to sysemu
Date: Sat, 11 Sep 2021 18:54:24 +0200
Message-Id: <20210911165434.531552-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210911165434.531552-1-f4bug@amsat.org>
References: <20210911165434.531552-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/tcg-internal.h      |  5 +++--
 target/mips/cpu.c                   |  2 +-
 target/mips/tcg/exception.c         | 18 ------------------
 target/mips/tcg/sysemu/tlb_helper.c | 18 ++++++++++++++++++
 target/mips/tcg/user/tlb_helper.c   |  5 -----
 5 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index 81b14eb219e..c7a77ddccdd 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -18,8 +18,6 @@
 void mips_tcg_init(void);
 
 void mips_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
-void mips_cpu_do_interrupt(CPUState *cpu);
-bool mips_cpu_exec_interrupt(CPUState *cpu, int int_req);
 bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
@@ -41,6 +39,9 @@ static inline void QEMU_NORETURN do_raise_exception(CPUMIPSState *env,
 
 #if !defined(CONFIG_USER_ONLY)
 
+void mips_cpu_do_interrupt(CPUState *cpu);
+bool mips_cpu_exec_interrupt(CPUState *cpu, int int_req);
+
 void mmu_init(CPUMIPSState *env, const mips_def_t *def);
 
 void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask);
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index d426918291a..00e0c55d0e4 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -539,10 +539,10 @@ static const struct SysemuCPUOps mips_sysemu_ops = {
 static const struct TCGCPUOps mips_tcg_ops = {
     .initialize = mips_tcg_init,
     .synchronize_from_tb = mips_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = mips_cpu_exec_interrupt,
     .tlb_fill = mips_cpu_tlb_fill,
 
 #if !defined(CONFIG_USER_ONLY)
+    .cpu_exec_interrupt = mips_cpu_exec_interrupt,
     .do_interrupt = mips_cpu_do_interrupt,
     .do_transaction_failed = mips_cpu_do_transaction_failed,
     .do_unaligned_access = mips_cpu_do_unaligned_access,
diff --git a/target/mips/tcg/exception.c b/target/mips/tcg/exception.c
index 4fb8b00711d..7b3026b105b 100644
--- a/target/mips/tcg/exception.c
+++ b/target/mips/tcg/exception.c
@@ -86,24 +86,6 @@ void mips_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb)
     env->hflags |= tb->flags & MIPS_HFLAG_BMASK;
 }
 
-bool mips_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
-{
-    if (interrupt_request & CPU_INTERRUPT_HARD) {
-        MIPSCPU *cpu = MIPS_CPU(cs);
-        CPUMIPSState *env = &cpu->env;
-
-        if (cpu_mips_hw_interrupts_enabled(env) &&
-            cpu_mips_hw_interrupts_pending(env)) {
-            /* Raise it */
-            cs->exception_index = EXCP_EXT_INTERRUPT;
-            env->error_code = 0;
-            mips_cpu_do_interrupt(cs);
-            return true;
-        }
-    }
-    return false;
-}
-
 static const char * const excp_names[EXCP_LAST + 1] = {
     [EXCP_RESET] = "reset",
     [EXCP_SRESET] = "soft reset",
diff --git a/target/mips/tcg/sysemu/tlb_helper.c b/target/mips/tcg/sysemu/tlb_helper.c
index a150a014ec1..73254d19298 100644
--- a/target/mips/tcg/sysemu/tlb_helper.c
+++ b/target/mips/tcg/sysemu/tlb_helper.c
@@ -1339,6 +1339,24 @@ void mips_cpu_do_interrupt(CPUState *cs)
     cs->exception_index = EXCP_NONE;
 }
 
+bool mips_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
+{
+    if (interrupt_request & CPU_INTERRUPT_HARD) {
+        MIPSCPU *cpu = MIPS_CPU(cs);
+        CPUMIPSState *env = &cpu->env;
+
+        if (cpu_mips_hw_interrupts_enabled(env) &&
+            cpu_mips_hw_interrupts_pending(env)) {
+            /* Raise it */
+            cs->exception_index = EXCP_EXT_INTERRUPT;
+            env->error_code = 0;
+            mips_cpu_do_interrupt(cs);
+            return true;
+        }
+    }
+    return false;
+}
+
 void r4k_invalidate_tlb(CPUMIPSState *env, int idx, int use_extra)
 {
     CPUState *cs = env_cpu(env);
diff --git a/target/mips/tcg/user/tlb_helper.c b/target/mips/tcg/user/tlb_helper.c
index b835144b820..210c6d529ef 100644
--- a/target/mips/tcg/user/tlb_helper.c
+++ b/target/mips/tcg/user/tlb_helper.c
@@ -57,8 +57,3 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     raise_mmu_exception(env, address, access_type);
     do_raise_exception_err(env, cs->exception_index, env->error_code, retaddr);
 }
-
-void mips_cpu_do_interrupt(CPUState *cs)
-{
-    cs->exception_index = EXCP_NONE;
-}
-- 
2.31.1


