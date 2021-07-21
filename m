Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF023D0939
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 08:53:04 +0200 (CEST)
Received: from localhost ([::1]:39624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m666J-0003bt-MM
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 02:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vj-00054u-F4
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:07 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:39926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vh-0005Q1-QA
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:07 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 p14-20020a17090ad30eb02901731c776526so3409786pju.4
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 23:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hdcHXTBndQJ60bOp5yOpBpWN/uojHbOe/orD+nT3HGI=;
 b=pXps9aDuEWzbbhgK3IRRjZk8SRlnocDTC9MgLErvLxRVEtLwMMOe5aK38OjcpZWzeU
 i7HKW1e5j73085gkdAaHCOp6Zzji0Vznmf/l4rnd/9CbrHgpcr02VJGsdcKhTZVt+JZI
 JeKy0AbgfCg+OQS8mY/53FoYuhv4P7K9/V/lTTm6t2PcdIA1DBGqNx4MEhzFAjYb8QtH
 1KiJDXQO89O/jF78Nhua13qxhl0bvKnlo4R17QCO3J4VxLwoVIIuYdQfW3ZC151T2n5Q
 KvwLkbaUKqxPLMjfyFmzSybYiBhqCztDRVz5QEq+5tMBd2bfx9XcRRc1VkL1tovbkSE7
 uiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hdcHXTBndQJ60bOp5yOpBpWN/uojHbOe/orD+nT3HGI=;
 b=tJf6uGVXg4j/JFRYh9QDWfKz6wnAR+PWSmqHccJOInr2QcKnqfTKHCxGLNGkDNAmH6
 7YVyG2RIp9Fe9ra6wHWLxKSxUb+cMaqVwLi0ZoYX46+tO7i4Ola/pi89KNKJZU1DZegI
 1rDp1ZYNc64PRD4720xXWFjXghgBdNgNYv5nDQPETHLa6Uqk0HzwWGdbsWU1qcKOWP3O
 hEcNNA9iMKaISyV8rcm5KzT4Lbl8nobDuUtHxp/HlAkNOXG+UM5YWQbWMtL2vV+UuUDb
 MHw0z5AO2OUE4ZbZlWH+EjXnhdUE2XcSgMBPSoLWFFCSA0SzmzO0fK0KUn1IU5uDH25O
 ZZ9w==
X-Gm-Message-State: AOAM530Pl6WEpGrEWDt2FVKhjJ0+/LuI39GM3Y305hkcPdQj4i7r7uIp
 UuMhF91TbMJ+1QtN5kTEvIrH4f/CPRrFYw==
X-Google-Smtp-Source: ABdhPJy41qGCIgZOJZ1EEZ9F2/S3pvItJWoUA3mb0K55jfizA1+sdPk82KK6kBwFPHlLhCPv1WjeQg==
X-Received: by 2002:a17:902:b941:b029:12b:81c3:6919 with SMTP id
 h1-20020a170902b941b029012b81c36919mr14184101pls.7.1626849724515; 
 Tue, 20 Jul 2021 23:42:04 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id q17sm21146132pjd.42.2021.07.20.23.42.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 23:42:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 06/23] target/arm: Drop checks for singlestep_enabled
Date: Tue, 20 Jul 2021 20:41:38 -1000
Message-Id: <20210721064155.645508-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721064155.645508-1-richard.henderson@linaro.org>
References: <20210721064155.645508-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB single-stepping is now handled generically.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 10 ++--------
 target/arm/translate.c     | 36 ++++++------------------------------
 2 files changed, 8 insertions(+), 38 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 422e2ac0c9..a7da3c5d45 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -404,8 +404,6 @@ static inline void gen_goto_tb(DisasContext *s, int n, uint64_t dest)
         gen_a64_set_pc_im(dest);
         if (s->ss_active) {
             gen_step_complete_exception(s);
-        } else if (s->base.singlestep_enabled) {
-            gen_exception_internal(EXCP_DEBUG);
         } else {
             tcg_gen_lookup_and_goto_ptr();
             s->base.is_jmp = DISAS_NORETURN;
@@ -14874,7 +14872,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    if (unlikely(dc->base.singlestep_enabled || dc->ss_active)) {
+    if (unlikely(dc->ss_active)) {
         /* Note that this means single stepping WFI doesn't halt the CPU.
          * For conditional branch insns this is harmless unreachable code as
          * gen_goto_tb() has already handled emitting the debug exception
@@ -14886,11 +14884,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             /* fall through */
         case DISAS_EXIT:
         case DISAS_JUMP:
-            if (dc->base.singlestep_enabled) {
-                gen_exception_internal(EXCP_DEBUG);
-            } else {
-                gen_step_complete_exception(dc);
-            }
+            gen_step_complete_exception(dc);
             break;
         case DISAS_NORETURN:
             break;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 351afa43a2..4fb2b846a3 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -338,7 +338,7 @@ static void gen_exception_internal(int excp)
     tcg_temp_free_i32(tcg_excp);
 }
 
-static void gen_step_complete_exception(DisasContext *s)
+static void gen_singlestep_exception(DisasContext *s)
 {
     /* We just completed step of an insn. Move from Active-not-pending
      * to Active-pending, and then also take the swstep exception.
@@ -354,30 +354,6 @@ static void gen_step_complete_exception(DisasContext *s)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_singlestep_exception(DisasContext *s)
-{
-    /* Generate the right kind of exception for singlestep, which is
-     * either the architectural singlestep or EXCP_DEBUG for QEMU's
-     * gdb singlestepping.
-     */
-    if (s->ss_active) {
-        gen_step_complete_exception(s);
-    } else {
-        gen_exception_internal(EXCP_DEBUG);
-    }
-}
-
-static inline bool is_singlestepping(DisasContext *s)
-{
-    /* Return true if we are singlestepping either because of
-     * architectural singlestep or QEMU gdbstub singlestep. This does
-     * not include the command line '-singlestep' mode which is rather
-     * misnamed as it only means "one instruction per TB" and doesn't
-     * affect the code we generate.
-     */
-    return s->base.singlestep_enabled || s->ss_active;
-}
-
 void clear_eci_state(DisasContext *s)
 {
     /*
@@ -834,7 +810,7 @@ static inline void gen_bx_excret_final_code(DisasContext *s)
     /* Is the new PC value in the magic range indicating exception return? */
     tcg_gen_brcondi_i32(TCG_COND_GEU, cpu_R[15], min_magic, excret_label);
     /* No: end the TB as we would for a DISAS_JMP */
-    if (is_singlestepping(s)) {
+    if (s->ss_active) {
         gen_singlestep_exception(s);
     } else {
         tcg_gen_exit_tb(NULL, 0);
@@ -2603,7 +2579,7 @@ static void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
 /* Jump, specifying which TB number to use if we gen_goto_tb() */
 static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
 {
-    if (unlikely(is_singlestepping(s))) {
+    if (unlikely(s->ss_active)) {
         /* An indirect jump so that we still trigger the debug exception.  */
         gen_set_pc_im(s, dest);
         s->base.is_jmp = DISAS_JUMP;
@@ -9360,7 +9336,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     dc->page_start = dc->base.pc_first & TARGET_PAGE_MASK;
 
     /* If architectural single step active, limit to 1.  */
-    if (is_singlestepping(dc)) {
+    if (dc->ss_active) {
         dc->base.max_insns = 1;
     }
 
@@ -9684,7 +9660,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
          * insn codepath itself.
          */
         gen_bx_excret_final_code(dc);
-    } else if (unlikely(is_singlestepping(dc))) {
+    } else if (unlikely(dc->ss_active)) {
         /* Unconditional and "condition passed" instruction codepath. */
         switch (dc->base.is_jmp) {
         case DISAS_SWI:
@@ -9779,7 +9755,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         /* "Condition failed" instruction codepath for the branch/trap insn */
         gen_set_label(dc->condlabel);
         gen_set_condexec(dc);
-        if (unlikely(is_singlestepping(dc))) {
+        if (unlikely(dc->ss_active)) {
             gen_set_pc_im(dc, dc->base.pc_next);
             gen_singlestep_exception(dc);
         } else {
-- 
2.25.1


