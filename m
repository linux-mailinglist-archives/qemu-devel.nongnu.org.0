Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB616055EB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 05:24:10 +0200 (CEST)
Received: from localhost ([::1]:51364 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olMAD-0007l4-MF
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 23:24:09 -0400
Received: from [::1] (port=60202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olM0h-0002Ax-D2
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 23:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLu2-0003Dl-08
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 23:07:28 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:38767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLtz-0001oC-Mm
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 23:07:25 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so2045603pjq.3
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 20:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XfNqM1TV8zLFTfqclxFJnL1gAJn2jXJMcTsYW1QIiw0=;
 b=e/RAZgaZgBAAjjENeuD9b6nnHiVMIZAc4KceRhIquVClP9Qp2bERUukyWiKXyetywq
 YhteR0c7LCX1hrI03pO8t6gz8riY4BO4pGUYhTeHGJDFq3bFcOw+JQ3knkPywL8/9Rqo
 dcxjMBqHgaearqFB1GsR3QqX6jIoUlx92pvSGlUh7/8ve0Fr/wUXSjN0q5R5FCXt3T4o
 jpt14IYjPJfEnGSqOPCdkhhB6VCFWwLHnfDPfVaLJ07S74AJdBOd6igFUWcVpK8vJ5Qx
 sV/mBh4eUsp+OTSQmyy2+vdXpW+S9ceDkK+LmnrPUtx6EBrxIRCobQXTxlcGjsmQ09Lq
 iiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XfNqM1TV8zLFTfqclxFJnL1gAJn2jXJMcTsYW1QIiw0=;
 b=i1FoRqpqqJxqT4dN3GmliiVU66QoKYV/UJ1U9dM3JTZvQbLF3Wtg2EVpvb1hEdzsTC
 tdeodkCAdyHUdnCnVxSFmYpShPlnNahJYyz+y6V5vZrLlaHtCtVUeOB6LFKKZf3zT3zi
 m0x3MMMDrNkEYzsO1BKsLvdumQzaHsnUbwwmdV/tGDnRJMLL8TheYpaDkSZt8GkcyGFk
 eJesZzV2R3SQ6qTJT5y6pUcngC8Qar9qFTOkE1zZ2kN4mlXTQhpeBlRhO3sA86Xd1ySf
 YfGAqnbLzAjUHyftPoFb46Cfp5rQme3q71YcXKah1+/3yNJLvqVTnSst5OPLPezWUN5F
 C2Wg==
X-Gm-Message-State: ACrzQf3jXpRUIg404uh8dQvxrJYA8aG2mYwR0FbiQDAfJ1UD/peVQ328
 e1MHCIX7PzVZpJVxw45GG6ySrQ8xbkbEA11Y
X-Google-Smtp-Source: AMsMyM5iy+CAlnczQtnaAReCQ/sCWnUQfMUyRRjS/d6pqXWd2CFV8YUsqEJ6x1J8UocGxPg/F8yOhw==
X-Received: by 2002:a17:90b:4f4d:b0:20d:2225:4275 with SMTP id
 pj13-20020a17090b4f4d00b0020d22254275mr13643064pjb.191.1666235242264; 
 Wed, 19 Oct 2022 20:07:22 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a63ed49000000b0043c7996f7f0sm10657647pgk.58.2022.10.19.20.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 20:07:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v8 4/9] target/arm: Change gen_exception_insn* to work on
 displacements
Date: Thu, 20 Oct 2022 13:06:36 +1000
Message-Id: <20221020030641.2066807-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020030641.2066807-1-richard.henderson@linaro.org>
References: <20221020030641.2066807-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h        |  5 +++--
 target/arm/translate-a64.c    | 28 ++++++++++-------------
 target/arm/translate-m-nocp.c |  6 ++---
 target/arm/translate-mve.c    |  2 +-
 target/arm/translate-vfp.c    |  6 ++---
 target/arm/translate.c        | 42 +++++++++++++++++------------------
 6 files changed, 43 insertions(+), 46 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index d651044855..4aa239e23c 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -281,9 +281,10 @@ void arm_jump_cc(DisasCompare *cmp, TCGLabel *label);
 void arm_gen_test_cc(int cc, TCGLabel *label);
 MemOp pow2_align(unsigned i);
 void unallocated_encoding(DisasContext *s);
-void gen_exception_insn_el(DisasContext *s, uint64_t pc, int excp,
+void gen_exception_insn_el(DisasContext *s, target_long pc_diff, int excp,
                            uint32_t syn, uint32_t target_el);
-void gen_exception_insn(DisasContext *s, uint64_t pc, int excp, uint32_t syn);
+void gen_exception_insn(DisasContext *s, target_long pc_diff,
+                        int excp, uint32_t syn);
 
 /* Return state of Alternate Half-precision flag, caller frees result */
 static inline TCGv_i32 get_ahp_flag(void)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 585d42d5b2..49380e1cfe 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1155,7 +1155,7 @@ static bool fp_access_check_only(DisasContext *s)
         assert(!s->fp_access_checked);
         s->fp_access_checked = true;
 
-        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
+        gen_exception_insn_el(s, 0, EXCP_UDEF,
                               syn_fp_access_trap(1, 0xe, false, 0),
                               s->fp_excp_el);
         return false;
@@ -1170,7 +1170,7 @@ static bool fp_access_check(DisasContext *s)
         return false;
     }
     if (s->sme_trap_nonstreaming && s->is_nonstreaming) {
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+        gen_exception_insn(s, 0, EXCP_UDEF,
                            syn_smetrap(SME_ET_Streaming, false));
         return false;
     }
@@ -1190,7 +1190,7 @@ bool sve_access_check(DisasContext *s)
             goto fail_exit;
         }
     } else if (s->sve_excp_el) {
-        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
+        gen_exception_insn_el(s, 0, EXCP_UDEF,
                               syn_sve_access_trap(), s->sve_excp_el);
         goto fail_exit;
     }
@@ -1212,7 +1212,7 @@ bool sve_access_check(DisasContext *s)
 static bool sme_access_check(DisasContext *s)
 {
     if (s->sme_excp_el) {
-        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
+        gen_exception_insn_el(s, 0, EXCP_UDEF,
                               syn_smetrap(SME_ET_AccessTrap, false),
                               s->sme_excp_el);
         return false;
@@ -1242,12 +1242,12 @@ bool sme_enabled_check_with_svcr(DisasContext *s, unsigned req)
         return false;
     }
     if (FIELD_EX64(req, SVCR, SM) && !s->pstate_sm) {
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+        gen_exception_insn(s, 0, EXCP_UDEF,
                            syn_smetrap(SME_ET_NotStreaming, false));
         return false;
     }
     if (FIELD_EX64(req, SVCR, ZA) && !s->pstate_za) {
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+        gen_exception_insn(s, 0, EXCP_UDEF,
                            syn_smetrap(SME_ET_InactiveZA, false));
         return false;
     }
@@ -1907,7 +1907,7 @@ static void gen_sysreg_undef(DisasContext *s, bool isread,
     } else {
         syndrome = syn_uncategorized();
     }
-    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syndrome);
+    gen_exception_insn(s, 0, EXCP_UDEF, syndrome);
 }
 
 /* MRS - move from system register
@@ -2161,8 +2161,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
         switch (op2_ll) {
         case 1:                                                     /* SVC */
             gen_ss_advance(s);
-            gen_exception_insn(s, s->base.pc_next, EXCP_SWI,
-                               syn_aa64_svc(imm16));
+            gen_exception_insn(s, 4, EXCP_SWI, syn_aa64_svc(imm16));
             break;
         case 2:                                                     /* HVC */
             if (s->current_el == 0) {
@@ -2175,8 +2174,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
             gen_a64_update_pc(s, 0);
             gen_helper_pre_hvc(cpu_env);
             gen_ss_advance(s);
-            gen_exception_insn_el(s, s->base.pc_next, EXCP_HVC,
-                                  syn_aa64_hvc(imm16), 2);
+            gen_exception_insn_el(s, 4, EXCP_HVC, syn_aa64_hvc(imm16), 2);
             break;
         case 3:                                                     /* SMC */
             if (s->current_el == 0) {
@@ -2186,8 +2184,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
             gen_a64_update_pc(s, 0);
             gen_helper_pre_smc(cpu_env, tcg_constant_i32(syn_aa64_smc(imm16)));
             gen_ss_advance(s);
-            gen_exception_insn_el(s, s->base.pc_next, EXCP_SMC,
-                                  syn_aa64_smc(imm16), 3);
+            gen_exception_insn_el(s, 4, EXCP_SMC, syn_aa64_smc(imm16), 3);
             break;
         default:
             unallocated_encoding(s);
@@ -14825,7 +14822,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          * Illegal execution state. This has priority over BTI
          * exceptions, but comes after instruction abort exceptions.
          */
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_illegalstate());
+        gen_exception_insn(s, 0, EXCP_UDEF, syn_illegalstate());
         return;
     }
 
@@ -14856,8 +14853,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
             if (s->btype != 0
                 && s->guarded_page
                 && !btype_destination_ok(insn, s->bt, s->btype)) {
-                gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                                   syn_btitrap(s->btype));
+                gen_exception_insn(s, 0, EXCP_UDEF, syn_btitrap(s->btype));
                 return;
             }
         } else {
diff --git a/target/arm/translate-m-nocp.c b/target/arm/translate-m-nocp.c
index 4029d7fdd4..694fae7e2e 100644
--- a/target/arm/translate-m-nocp.c
+++ b/target/arm/translate-m-nocp.c
@@ -143,7 +143,7 @@ static bool trans_VSCCLRM(DisasContext *s, arg_VSCCLRM *a)
     tcg_gen_brcondi_i32(TCG_COND_EQ, sfpa, 0, s->condlabel);
 
     if (s->fp_excp_el != 0) {
-        gen_exception_insn_el(s, s->pc_curr, EXCP_NOCP,
+        gen_exception_insn_el(s, 0, EXCP_NOCP,
                               syn_uncategorized(), s->fp_excp_el);
         return true;
     }
@@ -765,12 +765,12 @@ static bool trans_NOCP(DisasContext *s, arg_nocp *a)
     }
 
     if (a->cp != 10) {
-        gen_exception_insn(s, s->pc_curr, EXCP_NOCP, syn_uncategorized());
+        gen_exception_insn(s, 0, EXCP_NOCP, syn_uncategorized());
         return true;
     }
 
     if (s->fp_excp_el != 0) {
-        gen_exception_insn_el(s, s->pc_curr, EXCP_NOCP,
+        gen_exception_insn_el(s, 0, EXCP_NOCP,
                               syn_uncategorized(), s->fp_excp_el);
         return true;
     }
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 0cf1b5ea4f..db7ea3f603 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -100,7 +100,7 @@ bool mve_eci_check(DisasContext *s)
         return true;
     default:
         /* Reserved value: INVSTATE UsageFault */
-        gen_exception_insn(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized());
+        gen_exception_insn(s, 0, EXCP_INVSTATE, syn_uncategorized());
         return false;
     }
 }
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 070f465b17..5c5d58d2c6 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -230,7 +230,7 @@ static bool vfp_access_check_a(DisasContext *s, bool ignore_vfp_enabled)
         int coproc = arm_dc_feature(s, ARM_FEATURE_V8) ? 0 : 0xa;
         uint32_t syn = syn_fp_access_trap(1, 0xe, false, coproc);
 
-        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF, syn, s->fp_excp_el);
+        gen_exception_insn_el(s, 0, EXCP_UDEF, syn, s->fp_excp_el);
         return false;
     }
 
@@ -240,7 +240,7 @@ static bool vfp_access_check_a(DisasContext *s, bool ignore_vfp_enabled)
      * appear to be any insns which touch VFP which are allowed.
      */
     if (s->sme_trap_nonstreaming) {
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+        gen_exception_insn(s, 0, EXCP_UDEF,
                            syn_smetrap(SME_ET_Streaming,
                                        curr_insn_len(s) == 2));
         return false;
@@ -272,7 +272,7 @@ bool vfp_access_check_m(DisasContext *s, bool skip_context_update)
          * the encoding space handled by the patterns in m-nocp.decode,
          * and for them we may need to raise NOCP here.
          */
-        gen_exception_insn_el(s, s->pc_curr, EXCP_NOCP,
+        gen_exception_insn_el(s, 0, EXCP_NOCP,
                               syn_uncategorized(), s->fp_excp_el);
         return false;
     }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9863a08f49..350f991649 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1099,32 +1099,34 @@ static void gen_exception(int excp, uint32_t syndrome)
                                        tcg_constant_i32(syndrome));
 }
 
-static void gen_exception_insn_el_v(DisasContext *s, uint64_t pc, int excp,
-                                    uint32_t syn, TCGv_i32 tcg_el)
+static void gen_exception_insn_el_v(DisasContext *s, target_long pc_diff,
+                                    int excp, uint32_t syn, TCGv_i32 tcg_el)
 {
     if (s->aarch64) {
-        gen_a64_update_pc(s, pc - s->pc_curr);
+        gen_a64_update_pc(s, pc_diff);
     } else {
         gen_set_condexec(s);
-        gen_update_pc(s, pc - s->pc_curr);
+        gen_update_pc(s, pc_diff);
     }
     gen_exception_el_v(excp, syn, tcg_el);
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-void gen_exception_insn_el(DisasContext *s, uint64_t pc, int excp,
+void gen_exception_insn_el(DisasContext *s, target_long pc_diff, int excp,
                            uint32_t syn, uint32_t target_el)
 {
-    gen_exception_insn_el_v(s, pc, excp, syn, tcg_constant_i32(target_el));
+    gen_exception_insn_el_v(s, pc_diff, excp, syn,
+                            tcg_constant_i32(target_el));
 }
 
-void gen_exception_insn(DisasContext *s, uint64_t pc, int excp, uint32_t syn)
+void gen_exception_insn(DisasContext *s, target_long pc_diff,
+                        int excp, uint32_t syn)
 {
     if (s->aarch64) {
-        gen_a64_update_pc(s, pc - s->pc_curr);
+        gen_a64_update_pc(s, pc_diff);
     } else {
         gen_set_condexec(s);
-        gen_update_pc(s, pc - s->pc_curr);
+        gen_update_pc(s, pc_diff);
     }
     gen_exception(excp, syn);
     s->base.is_jmp = DISAS_NORETURN;
@@ -1141,7 +1143,7 @@ static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
 void unallocated_encoding(DisasContext *s)
 {
     /* Unallocated and reserved encodings are uncategorized */
-    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized());
+    gen_exception_insn(s, 0, EXCP_UDEF, syn_uncategorized());
 }
 
 /* Force a TB lookup after an instruction that changes the CPU state.  */
@@ -2865,7 +2867,7 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
                 tcg_el = tcg_constant_i32(3);
             }
 
-            gen_exception_insn_el_v(s, s->pc_curr, EXCP_UDEF,
+            gen_exception_insn_el_v(s, 0, EXCP_UDEF,
                                     syn_uncategorized(), tcg_el);
             tcg_temp_free_i32(tcg_el);
             return false;
@@ -2891,7 +2893,7 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
 
 undef:
     /* If we get here then some access check did not pass */
-    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized());
+    gen_exception_insn(s, 0, EXCP_UDEF, syn_uncategorized());
     return false;
 }
 
@@ -5115,8 +5117,7 @@ static void gen_srs(DisasContext *s,
      * For the UNPREDICTABLE cases we choose to UNDEF.
      */
     if (s->current_el == 1 && !s->ns && mode == ARM_CPU_MODE_MON) {
-        gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
-                              syn_uncategorized(), 3);
+        gen_exception_insn_el(s, 0, EXCP_UDEF, syn_uncategorized(), 3);
         return;
     }
 
@@ -8498,7 +8499,7 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
          * Do the check-and-raise-exception by hand.
          */
         if (s->fp_excp_el) {
-            gen_exception_insn_el(s, s->pc_curr, EXCP_NOCP,
+            gen_exception_insn_el(s, 0, EXCP_NOCP,
                                   syn_uncategorized(), s->fp_excp_el);
             return true;
         }
@@ -8601,7 +8602,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
         tmp = load_cpu_field(v7m.ltpsize);
         tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 4, skipexc);
         tcg_temp_free_i32(tmp);
-        gen_exception_insn(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized());
+        gen_exception_insn(s, 0, EXCP_INVSTATE, syn_uncategorized());
         gen_set_label(skipexc);
     }
 
@@ -9069,7 +9070,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
      * UsageFault exception.
      */
     if (arm_dc_feature(s, ARM_FEATURE_M)) {
-        gen_exception_insn(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized());
+        gen_exception_insn(s, 0, EXCP_INVSTATE, syn_uncategorized());
         return;
     }
 
@@ -9078,7 +9079,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
          * Illegal execution state. This has priority over BTI
          * exceptions, but comes after instruction abort exceptions.
          */
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_illegalstate());
+        gen_exception_insn(s, 0, EXCP_UDEF, syn_illegalstate());
         return;
     }
 
@@ -9642,7 +9643,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          * Illegal execution state. This has priority over BTI
          * exceptions, but comes after instruction abort exceptions.
          */
-        gen_exception_insn(dc, dc->pc_curr, EXCP_UDEF, syn_illegalstate());
+        gen_exception_insn(dc, 0, EXCP_UDEF, syn_illegalstate());
         return;
     }
 
@@ -9715,8 +9716,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          */
         tcg_remove_ops_after(dc->insn_eci_rewind);
         dc->condjmp = 0;
-        gen_exception_insn(dc, dc->pc_curr, EXCP_INVSTATE,
-                           syn_uncategorized());
+        gen_exception_insn(dc, 0, EXCP_INVSTATE, syn_uncategorized());
     }
 
     arm_post_translate_insn(dc);
-- 
2.34.1


