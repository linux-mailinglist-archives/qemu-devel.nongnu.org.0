Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9637350B759
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 14:31:10 +0200 (CEST)
Received: from localhost ([::1]:46596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhsRJ-0001ja-Ng
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 08:31:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nhroP-00052l-S6
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:50:57 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:40590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nhroN-0004kX-LH
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:50:57 -0400
Received: by mail-pf1-x429.google.com with SMTP id i24so7780750pfa.7
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 04:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/hhTgFcRG37a2wesxenTjwWF/U3aMo1SJEFjn4coiWw=;
 b=jbCVh05pFiq77v7AJHENT363lzdKdN6Hj/l/fGOBvmtAWgqbkX0r+vZO77san5sb+R
 UPeNVSRDyP3BxeBMbaPTCVF9ZGAml7uxTdkw0dqmpuG27TQPe/RcW8lqIvapXzJj6MJw
 6gGE2kwscKfbCTZ+gbs+4B3YlyNYVhxNrcLPpflcQiok0Uc7nMPcsJmyyr9Wo/wErEbO
 m+ZrMrOoR4jpAney8kMZR2nLILCBhg7EugLN5lj9ZtUMs7C5YSviSQ6igf4NBizURFL9
 5FXEix1znvFanxtQJ0l01UNRqEQLEiNXLGGzEuAJ48mWdn9xz3ducj51uvJ5aSJOzCQY
 0o+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/hhTgFcRG37a2wesxenTjwWF/U3aMo1SJEFjn4coiWw=;
 b=3qZr+7PhYDpFMifVPrUeY0a/IMy7JuVNqp30IcSd/r/SdF+EkR9Bv4mc8MxyVOy9Nr
 x3A+pILDozDrZW8tjqPVIasa3NiMP/VHJRsy0fU8ihKDnHMEeRnb/5HkYWCSvc6cCxAu
 q7JPZdBxt0HTCnIlKLhfz22PqIRl51qPiuCyynZZG+QoTI5KPP3xb4DdPOt5kmJm9gU5
 /JxzS0+c/vvKuxHPxaqv63ejnyMrNeLzCKd1R4iJnAX2AHKG5vxiDV0R+wVlPnu6cqrg
 z8trdDhcEjVhzv2HI08A6kLP5Z3pKewsY3iNwUKxrvy10GEkWRdWGl+PfH/c97NDieJI
 gMng==
X-Gm-Message-State: AOAM531nBH9bS5m8L6rtJccg9ajWKmYO61c8/ByF5jzfFOEnOe7VBz4u
 cCrjo/VyHueMfbJkPBA7rj6rnODo6Rs=
X-Google-Smtp-Source: ABdhPJwQZzOTR+tXf5kpsGNEd4uJGm6EscRIV/K3Rnzyf2O2D/uSxjgH9ePvrqSwWnQZiKJ6dcgsMQ==
X-Received: by 2002:a05:6a00:1a06:b0:4fc:d6c5:f3d7 with SMTP id
 g6-20020a056a001a0600b004fcd6c5f3d7mr4546428pfv.53.1650628251417; 
 Fri, 22 Apr 2022 04:50:51 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:4c40:4238:b597:4c1a])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a056a00084f00b0050ab60bf37fsm2532276pfk.22.2022.04.22.04.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 04:50:50 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/7] target/xtensa: use tcg_constant_* for remaining opcodes
Date: Fri, 22 Apr 2022 04:50:25 -0700
Message-Id: <20220422115025.381131-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

- gen_jumpi passes target PC to the helper;
- gen_callw_slot uses callinc (1..3);
- gen_brcondi passes immediate field (less than 32 different possible
  values) to the helper;
- disas_xtensa_insn passes PC to the helpers;
- translate_entry passes PC, stack register number (0..15) and stack
  frame size to the helper;
- gen_check_exclusive passes PC and boolean flag to the helper;
- test_exceptions_retw passes PC to the helper;
- gen_check_atomctl passes PC to the helper;
- translate_ssai passes immediate shift amount (0..31) to the helper;
- gen_waiti passes next PC and an immediate (0..15) to the helper;

use tcg_constant_* for the constants listed above. Fold gen_waiti body
into the translate_waiti as it's the only user.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v2->v3:
- use 'pc' consistently in gen_check_atomctl

Changes v1->v2:
- convert gen_jumpi, disas_xtensa_insn, test_exceptions_retw and
  gen_check_atomctl
- use tcg_constant_* for PC

 target/xtensa/translate.c | 77 +++++++++++++--------------------------
 1 file changed, 25 insertions(+), 52 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 09fb3df40934..0cc44e9b3aba 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -396,19 +396,15 @@ static int adjust_jump_slot(DisasContext *dc, uint32_t dest, int slot)
 
 static void gen_jumpi(DisasContext *dc, uint32_t dest, int slot)
 {
-    TCGv_i32 tmp = tcg_const_i32(dest);
-    gen_jump_slot(dc, tmp, adjust_jump_slot(dc, dest, slot));
-    tcg_temp_free(tmp);
+    gen_jump_slot(dc, tcg_constant_i32(dest),
+                  adjust_jump_slot(dc, dest, slot));
 }
 
 static void gen_callw_slot(DisasContext *dc, int callinc, TCGv_i32 dest,
         int slot)
 {
-    TCGv_i32 tcallinc = tcg_const_i32(callinc);
-
     tcg_gen_deposit_i32(cpu_SR[PS], cpu_SR[PS],
-            tcallinc, PS_CALLINC_SHIFT, PS_CALLINC_LEN);
-    tcg_temp_free(tcallinc);
+            tcg_constant_i32(callinc), PS_CALLINC_SHIFT, PS_CALLINC_LEN);
     tcg_gen_movi_i32(cpu_R[callinc << 2],
             (callinc << 30) | (dc->base.pc_next & 0x3fffffff));
     gen_jump_slot(dc, dest, slot);
@@ -454,9 +450,7 @@ static void gen_brcond(DisasContext *dc, TCGCond cond,
 static void gen_brcondi(DisasContext *dc, TCGCond cond,
                         TCGv_i32 t0, uint32_t t1, uint32_t addr)
 {
-    TCGv_i32 tmp = tcg_const_i32(t1);
-    gen_brcond(dc, cond, t0, tmp, addr);
-    tcg_temp_free(tmp);
+    gen_brcond(dc, cond, t0, tcg_constant_i32(t1), addr);
 }
 
 static uint32_t test_exceptions_sr(DisasContext *dc, const OpcodeArg arg[],
@@ -541,21 +535,6 @@ static MemOp gen_load_store_alignment(DisasContext *dc, MemOp mop,
     return mop;
 }
 
-#ifndef CONFIG_USER_ONLY
-static void gen_waiti(DisasContext *dc, uint32_t imm4)
-{
-    TCGv_i32 pc = tcg_const_i32(dc->base.pc_next);
-    TCGv_i32 intlevel = tcg_const_i32(imm4);
-
-    if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
-    gen_helper_waiti(cpu_env, pc, intlevel);
-    tcg_temp_free(pc);
-    tcg_temp_free(intlevel);
-}
-#endif
-
 static bool gen_window_check(DisasContext *dc, uint32_t mask)
 {
     unsigned r = 31 - clz32(mask);
@@ -1070,17 +1049,15 @@ static void disas_xtensa_insn(CPUXtensaState *env, DisasContext *dc)
     }
 
     if (op_flags & XTENSA_OP_UNDERFLOW) {
-        TCGv_i32 tmp = tcg_const_i32(dc->pc);
+        TCGv_i32 pc = tcg_constant_i32(dc->pc);
 
-        gen_helper_test_underflow_retw(cpu_env, tmp);
-        tcg_temp_free(tmp);
+        gen_helper_test_underflow_retw(cpu_env, pc);
     }
 
     if (op_flags & XTENSA_OP_ALLOCA) {
-        TCGv_i32 tmp = tcg_const_i32(dc->pc);
+        TCGv_i32 pc = tcg_constant_i32(dc->pc);
 
-        gen_helper_movsp(cpu_env, tmp);
-        tcg_temp_free(tmp);
+        gen_helper_movsp(cpu_env, pc);
     }
 
     if (coprocessor && !gen_check_cpenable(dc, coprocessor)) {
@@ -1659,13 +1636,10 @@ static uint32_t test_overflow_entry(DisasContext *dc, const OpcodeArg arg[],
 static void translate_entry(DisasContext *dc, const OpcodeArg arg[],
                             const uint32_t par[])
 {
-    TCGv_i32 pc = tcg_const_i32(dc->pc);
-    TCGv_i32 s = tcg_const_i32(arg[0].imm);
-    TCGv_i32 imm = tcg_const_i32(arg[1].imm);
+    TCGv_i32 pc = tcg_constant_i32(dc->pc);
+    TCGv_i32 s = tcg_constant_i32(arg[0].imm);
+    TCGv_i32 imm = tcg_constant_i32(arg[1].imm);
     gen_helper_entry(cpu_env, pc, s, imm);
-    tcg_temp_free(imm);
-    tcg_temp_free(s);
-    tcg_temp_free(pc);
 }
 
 static void translate_extui(DisasContext *dc, const OpcodeArg arg[],
@@ -1745,12 +1719,10 @@ static void gen_check_exclusive(DisasContext *dc, TCGv_i32 addr, bool is_write)
 static void gen_check_exclusive(DisasContext *dc, TCGv_i32 addr, bool is_write)
 {
     if (!option_enabled(dc, XTENSA_OPTION_MPU)) {
-        TCGv_i32 tpc = tcg_const_i32(dc->pc);
-        TCGv_i32 write = tcg_const_i32(is_write);
+        TCGv_i32 pc = tcg_constant_i32(dc->pc);
 
-        gen_helper_check_exclusive(cpu_env, tpc, addr, write);
-        tcg_temp_free(tpc);
-        tcg_temp_free(write);
+        gen_helper_check_exclusive(cpu_env, pc, addr,
+                                   tcg_constant_i32(is_write));
     }
 }
 #endif
@@ -2127,10 +2099,9 @@ static uint32_t test_exceptions_retw(DisasContext *dc, const OpcodeArg arg[],
                       "Illegal retw instruction(pc = %08x)\n", dc->pc);
         return XTENSA_OP_ILL;
     } else {
-        TCGv_i32 tmp = tcg_const_i32(dc->pc);
+        TCGv_i32 pc = tcg_constant_i32(dc->pc);
 
-        gen_helper_test_ill_retw(cpu_env, tmp);
-        tcg_temp_free(tmp);
+        gen_helper_test_ill_retw(cpu_env, pc);
         return 0;
     }
 }
@@ -2290,10 +2261,9 @@ static void gen_check_atomctl(DisasContext *dc, TCGv_i32 addr)
 #else
 static void gen_check_atomctl(DisasContext *dc, TCGv_i32 addr)
 {
-    TCGv_i32 tpc = tcg_const_i32(dc->pc);
+    TCGv_i32 pc = tcg_constant_i32(dc->pc);
 
-    gen_helper_check_atomctl(cpu_env, tpc, addr);
-    tcg_temp_free(tpc);
+    gen_helper_check_atomctl(cpu_env, pc, addr);
 }
 #endif
 
@@ -2514,9 +2484,7 @@ static void translate_ssa8l(DisasContext *dc, const OpcodeArg arg[],
 static void translate_ssai(DisasContext *dc, const OpcodeArg arg[],
                            const uint32_t par[])
 {
-    TCGv_i32 tmp = tcg_const_i32(arg[0].imm);
-    gen_right_shift_sar(dc, tmp);
-    tcg_temp_free(tmp);
+    gen_right_shift_sar(dc, tcg_constant_i32(arg[0].imm));
 }
 
 static void translate_ssl(DisasContext *dc, const OpcodeArg arg[],
@@ -2550,7 +2518,12 @@ static void translate_waiti(DisasContext *dc, const OpcodeArg arg[],
                             const uint32_t par[])
 {
 #ifndef CONFIG_USER_ONLY
-    gen_waiti(dc, arg[0].imm);
+    TCGv_i32 pc = tcg_constant_i32(dc->base.pc_next);
+
+    if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_waiti(cpu_env, pc, tcg_constant_i32(arg[0].imm));
 #endif
 }
 
-- 
2.30.2


