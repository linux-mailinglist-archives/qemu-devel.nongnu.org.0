Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE316062E0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:21:56 +0200 (CEST)
Received: from localhost ([::1]:54426 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWQh-0001lT-EL
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:21:53 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWEm-0003U8-QB
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUZJ-0001ap-Oz
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:23:00 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUYy-00016c-94
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:32 -0400
Received: by mail-wr1-x429.google.com with SMTP id u10so34143879wrq.2
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JKTPPFI6OQycDQmUfqdJ155wDPSBNEFdzT5uaQz87Po=;
 b=UgJKikAv2MbX+kqb78oNw5r/C/fOlCFUL0zVG02VmUbSiUATrFdB5ryFuGZl5ik895
 4g27IAALnjL6bpg5L9Ikl/p1OlKbNB6FkmY/RAOALs4MQ+ic4fueOnwptPE1703Q23fg
 NcNCYXd0qU0Fvqe10hyDy7B+25gWYSQ6c9Y0NKXRu1l/tY2J6WAlcoV10zwH7WxOcOnz
 cbn7GN6S48lfhiSn3O5cc0nM01O59P5Eo3wdcwyEPEi7iFzSUBbpnf1tDHwnftYk32cg
 88QDOaLGWW6RO2g8e4LMkWDgSZq7knT6EmVVcjtLtkbG+Vn3XIUy4axknNWcw+9NJDij
 Ht6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JKTPPFI6OQycDQmUfqdJ155wDPSBNEFdzT5uaQz87Po=;
 b=GbbXeT9p4QNwIh5mHiCd9PCzk2foM5XlocLt8Bw4+UdLWYXQjWncrBVaWV86bRkKCZ
 +7y6Ez24B+Yn1Blt1CbyjksvqBGU/toSbtF7yaniILPO7GLD4Eevi1SDBHbfejS4raiX
 kHyXJOTPOWGtYIvjl5SwN6gpy2z2bKoJXAtcDgfnUjCV8zG5edT1J1/D9R8c4+RtmD69
 b+mWKVg4iMkayhRe8S7kH48K+8TClF/POP1f60uF0mkuxFf2lYjIyM56GEwep1NdzUMI
 pwtXI4sgiLsyP03veM5tQYutifN5kHTQWm3gzsAbui95TUKCfp7ih/bPnbXgIT4swqlT
 +W9Q==
X-Gm-Message-State: ACrzQf3Vcws8axxZ0CmO4lLoRIuAZhl1FfzUtcXLtAQIu6Q6qYvdVZVK
 kszW89KhJ2IklN8dd/tguQhz+1WIXX4TtQ==
X-Google-Smtp-Source: AMsMyM4SwMj2JnNEkojAkA7VfHBlGfEyjMJAhoH41r1NpaMXYOFMwflgKnKOM0BxUgT+11uCUd8sMQ==
X-Received: by 2002:a05:6000:1e07:b0:236:759:929d with SMTP id
 bj7-20020a0560001e0700b002360759929dmr1685580wrb.199.1666268532424; 
 Thu, 20 Oct 2022 05:22:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b00230c9d427f9sm16520192wrs.53.2022.10.20.05.22.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:22:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/24] target/arm: Change gen_exception_insn* to work on
 displacements
Date: Thu, 20 Oct 2022 13:21:40 +0100
Message-Id: <20221020122146.3177980-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020122146.3177980-1-peter.maydell@linaro.org>
References: <20221020122146.3177980-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221020030641.2066807-5-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.h        |  5 +++--
 target/arm/translate-a64.c    | 28 ++++++++++-------------
 target/arm/translate-m-nocp.c |  6 ++---
 target/arm/translate-mve.c    |  2 +-
 target/arm/translate-vfp.c    |  6 ++---
 target/arm/translate.c        | 42 +++++++++++++++++------------------
 6 files changed, 43 insertions(+), 46 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index d651044855a..4aa239e23cd 100644
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
index b638d14f2d3..8ed192198fd 100644
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
@@ -14824,7 +14821,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          * Illegal execution state. This has priority over BTI
          * exceptions, but comes after instruction abort exceptions.
          */
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_illegalstate());
+        gen_exception_insn(s, 0, EXCP_UDEF, syn_illegalstate());
         return;
     }
 
@@ -14855,8 +14852,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
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
index 4029d7fdd49..694fae7e2e3 100644
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
index 0cf1b5ea4f5..db7ea3f6038 100644
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
index 070f465b172..5c5d58d2c62 100644
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
index 9863a08f496..350f991649b 100644
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
2.25.1


