Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F05F25BB7FE
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 13:28:14 +0200 (CEST)
Received: from localhost ([::1]:38764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZVzZ-0000Bu-UB
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 07:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oZVwz-0005l6-KQ
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 07:25:33 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oZVwx-0006m2-2Y
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 07:25:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tqwW7RxrcKSSINRRm1M2d+Dw4HlsxZ4/nsotstHSHzU=; b=LS8LbkHADJFFqkmqNClf3YGDdU
 n7j2SDBUPWDGoT1B+gAh9vEdBheRgPI09tR09aRMIhT0ebG0I1AAGbFoII7DO7inPPQ9ihOkFVZD9
 VnhA/Da9VtLT7wgJEyJk8nNsruTsXrnlXiq/fVPoy0/QjLiaWry5ZHL8Hf8zbmbhLlsV85bck8FLE
 qlT11/5tAaz6EoQfy2jkj4OCvRwePEspLs7bifih72OUy+I7mt7Z653Jbp4yd6aNqdRmbNE3nDNEk
 j8ps3vgTxvPA37BkMmNIBBYnv0W/4x+XXNGuXVW79HyJWnPZX/pR8pF2oiffo07KbRyYc/IfJlJDt
 bEtp5OoXlomuX7X9B9Kkf8kKqC0/XI1scteiNK9Dlopg2IuEm3dSb1/SwFQMmt+uy3PHv6F8wXU3g
 QsIdhqKXabp1A4CVp2ICjP3vAFhDoXmRFNrjgXydcoI+gqo/iyGNxhO+nyk6vilLdabarGUxQr+yr
 vP/TI3TJY1rxnwLb1ZXk/uNxQZ8jtOAIxw1fXxtERBzq1D09hhRsteZIZoq357eYRCnHtuD/YVuwb
 1ilEURdcIjlgTkV8R7NEWO2RZerB4I2fRmESSQTuY7Jj8MIna9eeDidTVSvlIl/mdWhXRsqK+9hjq
 sciYHOlbwh9e/zSb9/a6CesnmcjaLOtoaTZO1jXLY=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oZVvE-000C7q-Lk; Sat, 17 Sep 2022 12:23:48 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu, richard.henderson@linaro.org, lucienmp.qemu@gmail.com,
 qemu-devel@nongnu.org
Date: Sat, 17 Sep 2022 12:25:12 +0100
Message-Id: <20220917112515.83905-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220917112515.83905-1-mark.cave-ayland@ilande.co.uk>
References: <20220917112515.83905-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 1/4] target/m68k: rename M68K_FEATURE_M68000 to
 M68K_FEATURE_M68K
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

The M68K_FEATURE_M68000 feature is misleading in that its name suggests the feature
is defined just for Motorola 68000 CPUs, whilst in fact it is defined for all
Motorola 680X0 CPUs.

In order to avoid confusion with the other M68K_FEATURE_M680X0 constants which
define the features available for specific Motorola CPU models, rename
M68K_FEATURE_M68000 to M68K_FEATURE_M68K and add comments to clarify its usage.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 target/m68k/cpu.c       |   2 +-
 target/m68k/cpu.h       |   5 +-
 target/m68k/helper.c    |   2 +-
 target/m68k/op_helper.c |   2 +-
 target/m68k/translate.c | 138 ++++++++++++++++++++--------------------
 5 files changed, 75 insertions(+), 74 deletions(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 5bbefda575..f681be3a2a 100644
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
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 4d8f48e8c7..67b6c12c28 100644
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
diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 5728e48585..4621cf2402 100644
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
index d9937ca8dc..99dc994fcb 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -433,7 +433,7 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
 
 static void do_interrupt_all(CPUM68KState *env, int is_hw)
 {
-    if (m68k_feature(env, M68K_FEATURE_M68000)) {
+    if (m68k_feature(env, M68K_FEATURE_M68K)) {
         m68k_interrupt_all(env, is_hw);
         return;
     }
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 5098f7e570..fad8af8f83 100644
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
@@ -2875,7 +2875,7 @@ DISAS_INSN(mull)
         return;
     }
     SRC_EA(env, src1, OS_LONG, 0, NULL);
-    if (m68k_feature(s->env, M68K_FEATURE_M68000)) {
+    if (m68k_feature(s->env, M68K_FEATURE_M68K)) {
         tcg_gen_movi_i32(QREG_CC_C, 0);
         if (sign) {
             tcg_gen_muls2_i32(QREG_CC_N, QREG_CC_V, src1, DREG(ext, 12));
@@ -3470,7 +3470,7 @@ static inline void shift_im(DisasContext *s, uint16_t insn, int opsize)
          * while M68000 sets if the most significant bit is changed at
          * any time during the shift operation.
          */
-        if (!logical && m68k_feature(s->env, M68K_FEATURE_M68000)) {
+        if (!logical && m68k_feature(s->env, M68K_FEATURE_M68K)) {
             /* if shift count >= bits, V is (reg != 0) */
             if (count >= bits) {
                 tcg_gen_setcond_i32(TCG_COND_NE, QREG_CC_V, reg, QREG_CC_V);
@@ -3554,7 +3554,7 @@ static inline void shift_reg(DisasContext *s, uint16_t insn, int opsize)
          *     int64_t t = (int64_t)(intN_t)reg << count;
          *     V = ((s ^ t) & (-1 << (bits - 1))) != 0
          */
-        if (!logical && m68k_feature(s->env, M68K_FEATURE_M68000)) {
+        if (!logical && m68k_feature(s->env, M68K_FEATURE_M68K)) {
             TCGv_i64 tt = tcg_const_i64(32);
             /* if shift is greater than 32, use 32 */
             tcg_gen_movcond_i64(TCG_COND_GT, s64, s64, tt, tt, s64);
@@ -3647,7 +3647,7 @@ DISAS_INSN(shift_mem)
          * while M68000 sets if the most significant bit is changed at
          * any time during the shift operation
          */
-        if (!logical && m68k_feature(s->env, M68K_FEATURE_M68000)) {
+        if (!logical && m68k_feature(s->env, M68K_FEATURE_M68K)) {
             src = gen_extend(s, src, OS_WORD, 1);
             tcg_gen_xor_i32(QREG_CC_V, QREG_CC_N, src);
         }
@@ -4598,7 +4598,7 @@ DISAS_INSN(move_from_sr)
 {
     TCGv sr;
 
-    if (IS_USER(s) && !m68k_feature(env, M68K_FEATURE_M68000)) {
+    if (IS_USER(s) && !m68k_feature(env, M68K_FEATURE_M68K)) {
         gen_exception(s, s->base.pc_next, EXCP_PRIVILEGE);
         return;
     }
@@ -6011,7 +6011,7 @@ void register_m68k_insns (CPUM68KState *env)
     } while(0)
     BASE(undef,     0000, 0000);
     INSN(arith_im,  0080, fff8, CF_ISA_A);
-    INSN(arith_im,  0000, ff00, M68000);
+    INSN(arith_im,  0000, ff00, M68K);
     INSN(chk2,      00c0, f9c0, CHK2);
     INSN(bitrev,    00c0, fff8, CF_ISA_APLUSC);
     BASE(bitop_reg, 0100, f1c0);
@@ -6020,26 +6020,26 @@ void register_m68k_insns (CPUM68KState *env)
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
@@ -6049,44 +6049,44 @@ void register_m68k_insns (CPUM68KState *env)
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
@@ -6101,7 +6101,7 @@ void register_m68k_insns (CPUM68KState *env)
 #if defined(CONFIG_SOFTMMU)
     INSN(move_to_usp, 4e60, fff8, USP);
     INSN(move_from_usp, 4e68, fff8, USP);
-    INSN(reset,     4e70, ffff, M68000);
+    INSN(reset,     4e70, ffff, M68K);
     BASE(stop,      4e72, ffff);
     BASE(rte,       4e73, ffff);
     INSN(cf_movec,  4e7b, ffff, CF_ISA_A);
@@ -6110,15 +6110,15 @@ void register_m68k_insns (CPUM68KState *env)
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
@@ -6137,15 +6137,15 @@ void register_m68k_insns (CPUM68KState *env)
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
@@ -6166,41 +6166,41 @@ void register_m68k_insns (CPUM68KState *env)
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
2.30.2


