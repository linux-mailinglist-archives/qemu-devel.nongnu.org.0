Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B055C03D1
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 18:13:09 +0200 (CEST)
Received: from localhost ([::1]:55574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob2LT-0004A5-Ni
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 12:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ob21O-0006a4-0M
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 11:52:22 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:49629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ob21L-0006CW-Ht
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 11:52:21 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1McGtA-1p9HRC21q0-00clhL; Wed, 21
 Sep 2022 17:52:14 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 4/5] target/m68k: rename M68K_FEATURE_M68000 to
 M68K_FEATURE_M68K
Date: Wed, 21 Sep 2022 17:52:10 +0200
Message-Id: <20220921155211.402559-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220921155211.402559-1-laurent@vivier.eu>
References: <20220921155211.402559-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cTcylAB8T0lzUaA93KXWXri9YRAEAaDBSk01vOW6//SJ7Nt7fHv
 Bartpj7daMJ9AJhdwr0q3l+1Y9Fvjjx4SsfREziOEAagfEoNpTDBHELgugMayRQTl1oP/oY
 VcSGxxyzAfwAnT255aQJUMXJLhPhrTk3pYW6HLHEK0xO7oBiQLfGdC8HjHBgvCa2tXOkCOs
 macG3y/QhQ+xUeM48g/BQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bdsI9RUW6WM=:Zs+ps+DaPjc1QWb5ymEax1
 OSsFgCGFEqTuinOtEZhiSvmca46omRhhUysvOhvja0gAFVoRj3lGHKM9DQpS+u9JpODWRkpO2
 yO3KTF9S/rKt+aWaioP/GrY4Y2jRBQ2T8ZvJ6v7TH/yYDXGJy9Pq3bGzYuL4p9tzZZmMViHxo
 sU0pCTrPpOBYbWETPnjPkBQhnwh4S+EzvmAshoiwN3yYytGrYNhbcPwgBccdDCBbFwY1U5TCf
 M4VIX9eNxx+FZPYs1wNidKdTNwxjIggHojHiSjl1plJW5uFV2gXDDLL3yW7htj6cNPo5v1QNE
 S85s73ikj7XV/UqgBd0RJMyjccPcP7lKjdRh8SIIfeUjCKoD1WSv3x8UxK1v2zAI2QHL6rsgd
 FprmEA8Yk+pCtID/FmE/GPdcX6T3dAhH6JqNqREycWgWkc+nLEi9Y6JDxfrNxi3iPbUqL4V3+
 Ya0h2aFd2QgFmcAvBVqdEzt94pOQXx+hI7DVzh7HSaZEp5ruq6a13YNO1+hC0n3YY2keGcNCZ
 kL37oXukG3Mj0LW8aek8jHAT2L5NrceaRiYdWU77J+0ZOHGEwp9rWHfrrhX/NvG4/UZUlmqJ5
 bmnEZEp0Ft9Qc8zkmAAqunZAqPYk6/W+MLuIOYnJp6Z4M3CgQHjgEBoOrrVEX9aNnfvb7FlDV
 l4cAW8v5ax9qwweap0NXsrRMf+aVHIyNwVdfzEzV/FUDJKw9cJ+BQyYMNMwiHdNV7l2rok625
 hpxGRIj7vG3AbJ+nh62caHx6+BVxx3bMxmJeAIJ+4ssuxxhwjKoaDrfIu3ApO/1cneC/RyCK/
 yu0Kn+M
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

The M68K_FEATURE_M68000 feature is misleading in that its name suggests the feature
is defined just for Motorola 68000 CPUs, whilst in fact it is defined for all
Motorola 680X0 CPUs.

In order to avoid confusion with the other M68K_FEATURE_M680X0 constants which
define the features available for specific Motorola CPU models, rename
M68K_FEATURE_M68000 to M68K_FEATURE_M68K and add comments to clarify its usage.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220917112515.83905-2-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/cpu.h       |   5 +-
 target/m68k/cpu.c       |   2 +-
 target/m68k/helper.c    |   2 +-
 target/m68k/op_helper.c |   2 +-
 target/m68k/translate.c | 138 ++++++++++++++++++++--------------------
 5 files changed, 75 insertions(+), 74 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 4d8f48e8c747..67b6c12c2892 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -480,8 +480,9 @@ void do_m68k_semihosting(CPUM68KState *env, int nr);
  */
 
 enum m68k_features {
-    /* Base m68k instruction set */
-    M68K_FEATURE_M68000,
+    /* Base Motorola CPU set (not set for Coldfire CPUs) */
+    M68K_FEATURE_M68K,
+    /* Motorola CPU feature sets */
     M68K_FEATURE_M68010,
     M68K_FEATURE_M68020,
     M68K_FEATURE_M68030,
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 5bbefda5752d..f681be3a2a58 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -110,7 +110,7 @@ static void m68000_cpu_initfn(Object *obj)
     M68kCPU *cpu = M68K_CPU(obj);
     CPUM68KState *env = &cpu->env;
 
-    m68k_set_feature(env, M68K_FEATURE_M68000);
+    m68k_set_feature(env, M68K_FEATURE_M68K);
     m68k_set_feature(env, M68K_FEATURE_USP);
     m68k_set_feature(env, M68K_FEATURE_WORD_INDEX);
     m68k_set_feature(env, M68K_FEATURE_MOVEP);
diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 5728e48585fc..4621cf24027e 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -460,7 +460,7 @@ void m68k_switch_sp(CPUM68KState *env)
     int new_sp;
 
     env->sp[env->current_sp] = env->aregs[7];
-    if (m68k_feature(env, M68K_FEATURE_M68000)) {
+    if (m68k_feature(env, M68K_FEATURE_M68K)) {
         if (env->sr & SR_S) {
             /* SR:Master-Mode bit unimplemented then ISP is not available */
             if (!m68k_feature(env, M68K_FEATURE_MSP) || env->sr & SR_M) {
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index a96a03405060..5da176d6425a 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -432,7 +432,7 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
 
 static void do_interrupt_all(CPUM68KState *env, int is_hw)
 {
-    if (m68k_feature(env, M68K_FEATURE_M68000)) {
+    if (m68k_feature(env, M68K_FEATURE_M68K)) {
         m68k_interrupt_all(env, is_hw);
         return;
     }
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 4640eadf78e1..0b618e8eb2bd 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -471,7 +471,7 @@ static TCGv gen_lea_indexed(CPUM68KState *env, DisasContext *s, TCGv base)
     if ((ext & 0x800) == 0 && !m68k_feature(s->env, M68K_FEATURE_WORD_INDEX))
         return NULL_QREG;
 
-    if (m68k_feature(s->env, M68K_FEATURE_M68000) &&
+    if (m68k_feature(s->env, M68K_FEATURE_M68K) &&
         !m68k_feature(s->env, M68K_FEATURE_SCALED_INDEX)) {
         ext &= ~(3 << 9);
     }
@@ -804,7 +804,7 @@ static TCGv gen_lea_mode(CPUM68KState *env, DisasContext *s,
         reg = get_areg(s, reg0);
         tmp = mark_to_release(s, tcg_temp_new());
         if (reg0 == 7 && opsize == OS_BYTE &&
-            m68k_feature(s->env, M68K_FEATURE_M68000)) {
+            m68k_feature(s->env, M68K_FEATURE_M68K)) {
             tcg_gen_subi_i32(tmp, reg, 2);
         } else {
             tcg_gen_subi_i32(tmp, reg, opsize_bytes(opsize));
@@ -888,7 +888,7 @@ static TCGv gen_ea_mode(CPUM68KState *env, DisasContext *s, int mode, int reg0,
         if (what == EA_STORE || !addrp) {
             TCGv tmp = tcg_temp_new();
             if (reg0 == 7 && opsize == OS_BYTE &&
-                m68k_feature(s->env, M68K_FEATURE_M68000)) {
+                m68k_feature(s->env, M68K_FEATURE_M68K)) {
                 tcg_gen_addi_i32(tmp, reg, 2);
             } else {
                 tcg_gen_addi_i32(tmp, reg, opsize_bytes(opsize));
@@ -2210,7 +2210,7 @@ DISAS_INSN(bitop_im)
     op = (insn >> 6) & 3;
 
     bitnum = read_im16(env, s);
-    if (m68k_feature(s->env, M68K_FEATURE_M68000)) {
+    if (m68k_feature(s->env, M68K_FEATURE_M68K)) {
         if (bitnum & 0xfe00) {
             disas_undef(env, s, insn);
             return;
@@ -2897,7 +2897,7 @@ DISAS_INSN(mull)
         return;
     }
     SRC_EA(env, src1, OS_LONG, 0, NULL);
-    if (m68k_feature(s->env, M68K_FEATURE_M68000)) {
+    if (m68k_feature(s->env, M68K_FEATURE_M68K)) {
         tcg_gen_movi_i32(QREG_CC_C, 0);
         if (sign) {
             tcg_gen_muls2_i32(QREG_CC_N, QREG_CC_V, src1, DREG(ext, 12));
@@ -3492,7 +3492,7 @@ static inline void shift_im(DisasContext *s, uint16_t insn, int opsize)
          * while M68000 sets if the most significant bit is changed at
          * any time during the shift operation.
          */
-        if (!logical && m68k_feature(s->env, M68K_FEATURE_M68000)) {
+        if (!logical && m68k_feature(s->env, M68K_FEATURE_M68K)) {
             /* if shift count >= bits, V is (reg != 0) */
             if (count >= bits) {
                 tcg_gen_setcond_i32(TCG_COND_NE, QREG_CC_V, reg, QREG_CC_V);
@@ -3576,7 +3576,7 @@ static inline void shift_reg(DisasContext *s, uint16_t insn, int opsize)
          *     int64_t t = (int64_t)(intN_t)reg << count;
          *     V = ((s ^ t) & (-1 << (bits - 1))) != 0
          */
-        if (!logical && m68k_feature(s->env, M68K_FEATURE_M68000)) {
+        if (!logical && m68k_feature(s->env, M68K_FEATURE_M68K)) {
             TCGv_i64 tt = tcg_const_i64(32);
             /* if shift is greater than 32, use 32 */
             tcg_gen_movcond_i64(TCG_COND_GT, s64, s64, tt, tt, s64);
@@ -3669,7 +3669,7 @@ DISAS_INSN(shift_mem)
          * while M68000 sets if the most significant bit is changed at
          * any time during the shift operation
          */
-        if (!logical && m68k_feature(s->env, M68K_FEATURE_M68000)) {
+        if (!logical && m68k_feature(s->env, M68K_FEATURE_M68K)) {
             src = gen_extend(s, src, OS_WORD, 1);
             tcg_gen_xor_i32(QREG_CC_V, QREG_CC_N, src);
         }
@@ -4620,7 +4620,7 @@ DISAS_INSN(move_from_sr)
 {
     TCGv sr;
 
-    if (IS_USER(s) && !m68k_feature(env, M68K_FEATURE_M68000)) {
+    if (IS_USER(s) && !m68k_feature(env, M68K_FEATURE_M68K)) {
         gen_exception(s, s->base.pc_next, EXCP_PRIVILEGE);
         return;
     }
@@ -6035,7 +6035,7 @@ void register_m68k_insns (CPUM68KState *env)
     } while(0)
     BASE(undef,     0000, 0000);
     INSN(arith_im,  0080, fff8, CF_ISA_A);
-    INSN(arith_im,  0000, ff00, M68000);
+    INSN(arith_im,  0000, ff00, M68K);
     INSN(chk2,      00c0, f9c0, CHK2);
     INSN(bitrev,    00c0, fff8, CF_ISA_APLUSC);
     BASE(bitop_reg, 0100, f1c0);
@@ -6044,26 +6044,26 @@ void register_m68k_insns (CPUM68KState *env)
     BASE(bitop_reg, 01c0, f1c0);
     INSN(movep,     0108, f138, MOVEP);
     INSN(arith_im,  0280, fff8, CF_ISA_A);
-    INSN(arith_im,  0200, ff00, M68000);
-    INSN(undef,     02c0, ffc0, M68000);
+    INSN(arith_im,  0200, ff00, M68K);
+    INSN(undef,     02c0, ffc0, M68K);
     INSN(byterev,   02c0, fff8, CF_ISA_APLUSC);
     INSN(arith_im,  0480, fff8, CF_ISA_A);
-    INSN(arith_im,  0400, ff00, M68000);
-    INSN(undef,     04c0, ffc0, M68000);
-    INSN(arith_im,  0600, ff00, M68000);
-    INSN(undef,     06c0, ffc0, M68000);
+    INSN(arith_im,  0400, ff00, M68K);
+    INSN(undef,     04c0, ffc0, M68K);
+    INSN(arith_im,  0600, ff00, M68K);
+    INSN(undef,     06c0, ffc0, M68K);
     INSN(ff1,       04c0, fff8, CF_ISA_APLUSC);
     INSN(arith_im,  0680, fff8, CF_ISA_A);
     INSN(arith_im,  0c00, ff38, CF_ISA_A);
-    INSN(arith_im,  0c00, ff00, M68000);
+    INSN(arith_im,  0c00, ff00, M68K);
     BASE(bitop_im,  0800, ffc0);
     BASE(bitop_im,  0840, ffc0);
     BASE(bitop_im,  0880, ffc0);
     BASE(bitop_im,  08c0, ffc0);
     INSN(arith_im,  0a80, fff8, CF_ISA_A);
-    INSN(arith_im,  0a00, ff00, M68000);
+    INSN(arith_im,  0a00, ff00, M68K);
 #if defined(CONFIG_SOFTMMU)
-    INSN(moves,     0e00, ff00, M68000);
+    INSN(moves,     0e00, ff00, M68K);
 #endif
     INSN(cas,       0ac0, ffc0, CAS);
     INSN(cas,       0cc0, ffc0, CAS);
@@ -6073,44 +6073,44 @@ void register_m68k_insns (CPUM68KState *env)
     BASE(move,      1000, f000);
     BASE(move,      2000, f000);
     BASE(move,      3000, f000);
-    INSN(chk,       4000, f040, M68000);
+    INSN(chk,       4000, f040, M68K);
     INSN(strldsr,   40e7, ffff, CF_ISA_APLUSC);
     INSN(negx,      4080, fff8, CF_ISA_A);
-    INSN(negx,      4000, ff00, M68000);
-    INSN(undef,     40c0, ffc0, M68000);
+    INSN(negx,      4000, ff00, M68K);
+    INSN(undef,     40c0, ffc0, M68K);
     INSN(move_from_sr, 40c0, fff8, CF_ISA_A);
-    INSN(move_from_sr, 40c0, ffc0, M68000);
+    INSN(move_from_sr, 40c0, ffc0, M68K);
     BASE(lea,       41c0, f1c0);
     BASE(clr,       4200, ff00);
     BASE(undef,     42c0, ffc0);
     INSN(move_from_ccr, 42c0, fff8, CF_ISA_A);
-    INSN(move_from_ccr, 42c0, ffc0, M68000);
+    INSN(move_from_ccr, 42c0, ffc0, M68K);
     INSN(neg,       4480, fff8, CF_ISA_A);
-    INSN(neg,       4400, ff00, M68000);
-    INSN(undef,     44c0, ffc0, M68000);
+    INSN(neg,       4400, ff00, M68K);
+    INSN(undef,     44c0, ffc0, M68K);
     BASE(move_to_ccr, 44c0, ffc0);
     INSN(not,       4680, fff8, CF_ISA_A);
-    INSN(not,       4600, ff00, M68000);
+    INSN(not,       4600, ff00, M68K);
 #if defined(CONFIG_SOFTMMU)
     BASE(move_to_sr, 46c0, ffc0);
 #endif
-    INSN(nbcd,      4800, ffc0, M68000);
-    INSN(linkl,     4808, fff8, M68000);
+    INSN(nbcd,      4800, ffc0, M68K);
+    INSN(linkl,     4808, fff8, M68K);
     BASE(pea,       4840, ffc0);
     BASE(swap,      4840, fff8);
     INSN(bkpt,      4848, fff8, BKPT);
     INSN(movem,     48d0, fbf8, CF_ISA_A);
     INSN(movem,     48e8, fbf8, CF_ISA_A);
-    INSN(movem,     4880, fb80, M68000);
+    INSN(movem,     4880, fb80, M68K);
     BASE(ext,       4880, fff8);
     BASE(ext,       48c0, fff8);
     BASE(ext,       49c0, fff8);
     BASE(tst,       4a00, ff00);
     INSN(tas,       4ac0, ffc0, CF_ISA_B);
-    INSN(tas,       4ac0, ffc0, M68000);
+    INSN(tas,       4ac0, ffc0, M68K);
 #if defined(CONFIG_SOFTMMU)
     INSN(halt,      4ac8, ffff, CF_ISA_A);
-    INSN(halt,      4ac8, ffff, M68060);
+    INSN(halt,      4ac8, ffff, M68K);
 #endif
     INSN(pulse,     4acc, ffff, CF_ISA_A);
     BASE(illegal,   4afc, ffff);
@@ -6125,7 +6125,7 @@ void register_m68k_insns (CPUM68KState *env)
 #if defined(CONFIG_SOFTMMU)
     INSN(move_to_usp, 4e60, fff8, USP);
     INSN(move_from_usp, 4e68, fff8, USP);
-    INSN(reset,     4e70, ffff, M68000);
+    INSN(reset,     4e70, ffff, M68K);
     BASE(stop,      4e72, ffff);
     BASE(rte,       4e73, ffff);
     INSN(cf_movec,  4e7b, ffff, CF_ISA_A);
@@ -6134,15 +6134,15 @@ void register_m68k_insns (CPUM68KState *env)
     BASE(nop,       4e71, ffff);
     INSN(rtd,       4e74, ffff, RTD);
     BASE(rts,       4e75, ffff);
-    INSN(trapv,     4e76, ffff, M68000);
-    INSN(rtr,       4e77, ffff, M68000);
+    INSN(trapv,     4e76, ffff, M68K);
+    INSN(rtr,       4e77, ffff, M68K);
     BASE(jump,      4e80, ffc0);
     BASE(jump,      4ec0, ffc0);
-    INSN(addsubq,   5000, f080, M68000);
+    INSN(addsubq,   5000, f080, M68K);
     BASE(addsubq,   5080, f0c0);
     INSN(scc,       50c0, f0f8, CF_ISA_A); /* Scc.B Dx   */
-    INSN(scc,       50c0, f0c0, M68000);   /* Scc.B <EA> */
-    INSN(dbcc,      50c8, f0f8, M68000);
+    INSN(scc,       50c0, f0c0, M68K);     /* Scc.B <EA> */
+    INSN(dbcc,      50c8, f0f8, M68K);
     INSN(trapcc,    50fa, f0fe, TRAPCC);   /* opmode 010, 011 */
     INSN(trapcc,    50fc, f0ff, TRAPCC);   /* opmode 100 */
     INSN(trapcc,    51fa, fffe, CF_ISA_A); /* TPF (trapf) opmode 010, 011 */
@@ -6161,15 +6161,15 @@ void register_m68k_insns (CPUM68KState *env)
     INSN(mvzs,      7100, f100, CF_ISA_B);
     BASE(or,        8000, f000);
     BASE(divw,      80c0, f0c0);
-    INSN(sbcd_reg,  8100, f1f8, M68000);
-    INSN(sbcd_mem,  8108, f1f8, M68000);
+    INSN(sbcd_reg,  8100, f1f8, M68K);
+    INSN(sbcd_mem,  8108, f1f8, M68K);
     BASE(addsub,    9000, f000);
     INSN(undef,     90c0, f0c0, CF_ISA_A);
     INSN(subx_reg,  9180, f1f8, CF_ISA_A);
-    INSN(subx_reg,  9100, f138, M68000);
-    INSN(subx_mem,  9108, f138, M68000);
+    INSN(subx_reg,  9100, f138, M68K);
+    INSN(subx_mem,  9108, f138, M68K);
     INSN(suba,      91c0, f1c0, CF_ISA_A);
-    INSN(suba,      90c0, f0c0, M68000);
+    INSN(suba,      90c0, f0c0, M68K);
 
     BASE(undef_mac, a000, f000);
     INSN(mac,       a000, f100, CF_EMAC);
@@ -6190,41 +6190,41 @@ void register_m68k_insns (CPUM68KState *env)
     INSN(cmpa,      b0c0, f1c0, CF_ISA_B); /* cmpa.w */
     INSN(cmp,       b080, f1c0, CF_ISA_A);
     INSN(cmpa,      b1c0, f1c0, CF_ISA_A);
-    INSN(cmp,       b000, f100, M68000);
-    INSN(eor,       b100, f100, M68000);
-    INSN(cmpm,      b108, f138, M68000);
-    INSN(cmpa,      b0c0, f0c0, M68000);
+    INSN(cmp,       b000, f100, M68K);
+    INSN(eor,       b100, f100, M68K);
+    INSN(cmpm,      b108, f138, M68K);
+    INSN(cmpa,      b0c0, f0c0, M68K);
     INSN(eor,       b180, f1c0, CF_ISA_A);
     BASE(and,       c000, f000);
-    INSN(exg_dd,    c140, f1f8, M68000);
-    INSN(exg_aa,    c148, f1f8, M68000);
-    INSN(exg_da,    c188, f1f8, M68000);
+    INSN(exg_dd,    c140, f1f8, M68K);
+    INSN(exg_aa,    c148, f1f8, M68K);
+    INSN(exg_da,    c188, f1f8, M68K);
     BASE(mulw,      c0c0, f0c0);
-    INSN(abcd_reg,  c100, f1f8, M68000);
-    INSN(abcd_mem,  c108, f1f8, M68000);
+    INSN(abcd_reg,  c100, f1f8, M68K);
+    INSN(abcd_mem,  c108, f1f8, M68K);
     BASE(addsub,    d000, f000);
     INSN(undef,     d0c0, f0c0, CF_ISA_A);
     INSN(addx_reg,      d180, f1f8, CF_ISA_A);
-    INSN(addx_reg,  d100, f138, M68000);
-    INSN(addx_mem,  d108, f138, M68000);
+    INSN(addx_reg,  d100, f138, M68K);
+    INSN(addx_mem,  d108, f138, M68K);
     INSN(adda,      d1c0, f1c0, CF_ISA_A);
-    INSN(adda,      d0c0, f0c0, M68000);
+    INSN(adda,      d0c0, f0c0, M68K);
     INSN(shift_im,  e080, f0f0, CF_ISA_A);
     INSN(shift_reg, e0a0, f0f0, CF_ISA_A);
-    INSN(shift8_im, e000, f0f0, M68000);
-    INSN(shift16_im, e040, f0f0, M68000);
-    INSN(shift_im,  e080, f0f0, M68000);
-    INSN(shift8_reg, e020, f0f0, M68000);
-    INSN(shift16_reg, e060, f0f0, M68000);
-    INSN(shift_reg, e0a0, f0f0, M68000);
-    INSN(shift_mem, e0c0, fcc0, M68000);
-    INSN(rotate_im, e090, f0f0, M68000);
-    INSN(rotate8_im, e010, f0f0, M68000);
-    INSN(rotate16_im, e050, f0f0, M68000);
-    INSN(rotate_reg, e0b0, f0f0, M68000);
-    INSN(rotate8_reg, e030, f0f0, M68000);
-    INSN(rotate16_reg, e070, f0f0, M68000);
-    INSN(rotate_mem, e4c0, fcc0, M68000);
+    INSN(shift8_im, e000, f0f0, M68K);
+    INSN(shift16_im, e040, f0f0, M68K);
+    INSN(shift_im,  e080, f0f0, M68K);
+    INSN(shift8_reg, e020, f0f0, M68K);
+    INSN(shift16_reg, e060, f0f0, M68K);
+    INSN(shift_reg, e0a0, f0f0, M68K);
+    INSN(shift_mem, e0c0, fcc0, M68K);
+    INSN(rotate_im, e090, f0f0, M68K);
+    INSN(rotate8_im, e010, f0f0, M68K);
+    INSN(rotate16_im, e050, f0f0, M68K);
+    INSN(rotate_reg, e0b0, f0f0, M68K);
+    INSN(rotate8_reg, e030, f0f0, M68K);
+    INSN(rotate16_reg, e070, f0f0, M68K);
+    INSN(rotate_mem, e4c0, fcc0, M68K);
     INSN(bfext_mem, e9c0, fdc0, BITFIELD);  /* bfextu & bfexts */
     INSN(bfext_reg, e9c0, fdf8, BITFIELD);
     INSN(bfins_mem, efc0, ffc0, BITFIELD);
-- 
2.37.3


