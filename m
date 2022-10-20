Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7ED606400
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:16:11 +0200 (CEST)
Received: from localhost ([::1]:46378 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXHE-0005xn-QU
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:16:09 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXB7-0002fN-Pq
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUZW-0001cF-C4
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:23:00 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:51926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUZ2-00017P-Bm
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:45 -0400
Received: by mail-wm1-x336.google.com with SMTP id v11so4784762wmd.1
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hjZ3sbI2K/lZhWhkkpfCu8VnXewrVe++etqWuOsIW+o=;
 b=JRr9IoiAYvznq0rKsjxdRDJIh/6pRnOeZMTIuNBxG/Be4SY9BYoRgAp8cwH1EswV0I
 ak1CKhlyZYeZBXVG1Wx+ylPD2vsz1OelxgqGBYiqL7NsHM+7ZmgU4D1Yd5xDfw5jt7dt
 SCt86Z1fON8TPfjZXYsR72TCXErkpr5RKp9Geqw1/JfMKBnHdO/BoMS5ZiqFs5zWrNZ8
 cDS1RQt5krKTvx6JRCXXgE5zpJkFS7LktsDHnEgHBHhK+YgA1PjPl+XMmtNlbDABxC43
 aDJPPBAW7zWOl3pHxxQN6CurMPwrriEx5JrV+rfMMkwaXz6mCLvmQ73RBDFiO+CaREB4
 xa2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hjZ3sbI2K/lZhWhkkpfCu8VnXewrVe++etqWuOsIW+o=;
 b=jzVNYi6an4M1fvRTNOS0OoWiR2rE7UuLrodnZfWp9ZxUvId3WzjJS/oMTFzuqrWJNe
 SATmBTHInxy+reACccuynvWHORzqJfS2DuwCJ0v/6z0vUHxdwmOHKqvTdpZ5QL/uoC2j
 2oSxrjWXDeUu/AjaXEEmdqUX/73WJc2FVz0jE+ozfoxWybvFQ861OcFzBEywmYw3629K
 VgVhSVyZhRDEP5uFnoeXIisiXu/qJHaRCpz1v+GK/VFpZbhjbzv8G6IyR8enJAHe2pEd
 ktJBgoJR4mmh8eNZ5t2kH6F0ASTLElJjNVyccfAJ37UD1wZNDk6K3j/49O5I8V2ubH/R
 vzYQ==
X-Gm-Message-State: ACrzQf1BfWYKgDRbJt1grbDRTj7Uq//mGhh7P3SwcdYfZ8bTeWH/fN2R
 ohBf3TbjptOgBwOJqQrq/BL5xTY5kq7LJA==
X-Google-Smtp-Source: AMsMyM4qGSfKlM9IZ2kmze09ToCsXb9rHMJyD+DKBkiVxjbX/t47ViGd7YUEGTNZ7ASb0ORy5azR8w==
X-Received: by 2002:a05:600c:3b1d:b0:3c6:ff0d:6a60 with SMTP id
 m29-20020a05600c3b1d00b003c6ff0d6a60mr8842015wms.183.1666268538336; 
 Thu, 20 Oct 2022 05:22:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b00230c9d427f9sm16520192wrs.53.2022.10.20.05.22.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:22:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/24] target/arm: Enable TARGET_TB_PCREL
Date: Thu, 20 Oct 2022 13:21:45 +0100
Message-Id: <20221020122146.3177980-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020122146.3177980-1-peter.maydell@linaro.org>
References: <20221020122146.3177980-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221020030641.2066807-10-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu-param.h        |   2 +
 target/arm/translate.h        |  50 +++++++++++++++-
 target/arm/cpu.c              |  23 ++++----
 target/arm/translate-a64.c    |  64 +++++++++++++-------
 target/arm/translate-m-nocp.c |   2 +-
 target/arm/translate.c        | 108 +++++++++++++++++++++++-----------
 6 files changed, 178 insertions(+), 71 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index b7bde189860..53cac9c89bf 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -31,6 +31,8 @@
 # define TARGET_PAGE_BITS_VARY
 # define TARGET_PAGE_BITS_MIN  10
 
+# define TARGET_TB_PCREL 1
+
 /*
  * Cache the attrs and shareability fields from the page table entry.
  *
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 4aa239e23cd..3cdc7dbc2fb 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -6,18 +6,42 @@
 
 
 /* internal defines */
+
+/*
+ * Save pc_save across a branch, so that we may restore the value from
+ * before the branch at the point the label is emitted.
+ */
+typedef struct DisasLabel {
+    TCGLabel *label;
+    target_ulong pc_save;
+} DisasLabel;
+
 typedef struct DisasContext {
     DisasContextBase base;
     const ARMISARegisters *isar;
 
     /* The address of the current instruction being translated. */
     target_ulong pc_curr;
+    /*
+     * For TARGET_TB_PCREL, the full value of cpu_pc is not known
+     * (although the page offset is known).  For convenience, the
+     * translation loop uses the full virtual address that triggered
+     * the translation, from base.pc_start through pc_curr.
+     * For efficiency, we do not update cpu_pc for every instruction.
+     * Instead, pc_save has the value of pc_curr at the time of the
+     * last update to cpu_pc, which allows us to compute the addend
+     * needed to bring cpu_pc current: pc_curr - pc_save.
+     * If cpu_pc now contains the destination of an indirect branch,
+     * pc_save contains -1 to indicate that relative updates are no
+     * longer possible.
+     */
+    target_ulong pc_save;
     target_ulong page_start;
     uint32_t insn;
     /* Nonzero if this instruction has been conditionally skipped.  */
     int condjmp;
     /* The label that will be jumped to when the instruction is skipped.  */
-    TCGLabel *condlabel;
+    DisasLabel condlabel;
     /* Thumb-2 conditional execution bits.  */
     int condexec_mask;
     int condexec_cond;
@@ -28,8 +52,6 @@ typedef struct DisasContext {
      * after decode (ie after any UNDEF checks)
      */
     bool eci_handled;
-    /* TCG op to rewind to if this turns out to be an invalid ECI state */
-    TCGOp *insn_eci_rewind;
     int sctlr_b;
     MemOp be_data;
 #if !defined(CONFIG_USER_ONLY)
@@ -566,6 +588,28 @@ static inline MemOp finalize_memop(DisasContext *s, MemOp opc)
  */
 uint64_t asimd_imm_const(uint32_t imm, int cmode, int op);
 
+/*
+ * gen_disas_label:
+ * Create a label and cache a copy of pc_save.
+ */
+static inline DisasLabel gen_disas_label(DisasContext *s)
+{
+    return (DisasLabel){
+        .label = gen_new_label(),
+        .pc_save = s->pc_save,
+    };
+}
+
+/*
+ * set_disas_label:
+ * Emit a label and restore the cached copy of pc_save.
+ */
+static inline void set_disas_label(DisasContext *s, DisasLabel l)
+{
+    gen_set_label(l.label);
+    s->pc_save = l.pc_save;
+}
+
 /*
  * Helpers for implementing sets of trans_* functions.
  * Defer the implementation of NAME to FUNC, with optional extra arguments.
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 94ca6f163f7..0bc5e9b125b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -76,17 +76,18 @@ static vaddr arm_cpu_get_pc(CPUState *cs)
 void arm_cpu_synchronize_from_tb(CPUState *cs,
                                  const TranslationBlock *tb)
 {
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    /*
-     * It's OK to look at env for the current mode here, because it's
-     * never possible for an AArch64 TB to chain to an AArch32 TB.
-     */
-    if (is_a64(env)) {
-        env->pc = tb_pc(tb);
-    } else {
-        env->regs[15] = tb_pc(tb);
+    /* The program counter is always up to date with TARGET_TB_PCREL. */
+    if (!TARGET_TB_PCREL) {
+        CPUARMState *env = cs->env_ptr;
+        /*
+         * It's OK to look at env for the current mode here, because it's
+         * never possible for an AArch64 TB to chain to an AArch32 TB.
+         */
+        if (is_a64(env)) {
+            env->pc = tb_pc(tb);
+        } else {
+            env->regs[15] = tb_pc(tb);
+        }
     }
 }
 #endif /* CONFIG_TCG */
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c2316352957..2ee171f249c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -142,12 +142,18 @@ static void reset_btype(DisasContext *s)
 
 static void gen_pc_plus_diff(DisasContext *s, TCGv_i64 dest, target_long diff)
 {
-    tcg_gen_movi_i64(dest, s->pc_curr + diff);
+    assert(s->pc_save != -1);
+    if (TARGET_TB_PCREL) {
+        tcg_gen_addi_i64(dest, cpu_pc, (s->pc_curr - s->pc_save) + diff);
+    } else {
+        tcg_gen_movi_i64(dest, s->pc_curr + diff);
+    }
 }
 
 void gen_a64_update_pc(DisasContext *s, target_long diff)
 {
     gen_pc_plus_diff(s, cpu_pc, diff);
+    s->pc_save = s->pc_curr + diff;
 }
 
 /*
@@ -201,6 +207,7 @@ static void gen_a64_set_pc(DisasContext *s, TCGv_i64 src)
      * then loading an address into the PC will clear out any tag.
      */
     gen_top_byte_ignore(s, cpu_pc, src, s->tbii);
+    s->pc_save = -1;
 }
 
 /*
@@ -377,11 +384,22 @@ static inline bool use_goto_tb(DisasContext *s, uint64_t dest)
 
 static void gen_goto_tb(DisasContext *s, int n, int64_t diff)
 {
-    uint64_t dest = s->pc_curr + diff;
-
-    if (use_goto_tb(s, dest)) {
-        tcg_gen_goto_tb(n);
-        gen_a64_update_pc(s, diff);
+    if (use_goto_tb(s, s->pc_curr + diff)) {
+        /*
+         * For pcrel, the pc must always be up-to-date on entry to
+         * the linked TB, so that it can use simple additions for all
+         * further adjustments.  For !pcrel, the linked TB is compiled
+         * to know its full virtual address, so we can delay the
+         * update to pc to the unlinked path.  A long chain of links
+         * can thus avoid many updates to the PC.
+         */
+        if (TARGET_TB_PCREL) {
+            gen_a64_update_pc(s, diff);
+            tcg_gen_goto_tb(n);
+        } else {
+            tcg_gen_goto_tb(n);
+            gen_a64_update_pc(s, diff);
+        }
         tcg_gen_exit_tb(s->base.tb, n);
         s->base.is_jmp = DISAS_NORETURN;
     } else {
@@ -1383,7 +1401,7 @@ static void disas_comp_b_imm(DisasContext *s, uint32_t insn)
 {
     unsigned int sf, op, rt;
     int64_t diff;
-    TCGLabel *label_match;
+    DisasLabel match;
     TCGv_i64 tcg_cmp;
 
     sf = extract32(insn, 31, 1);
@@ -1392,14 +1410,13 @@ static void disas_comp_b_imm(DisasContext *s, uint32_t insn)
     diff = sextract32(insn, 5, 19) * 4;
 
     tcg_cmp = read_cpu_reg(s, rt, sf);
-    label_match = gen_new_label();
-
     reset_btype(s);
-    tcg_gen_brcondi_i64(op ? TCG_COND_NE : TCG_COND_EQ,
-                        tcg_cmp, 0, label_match);
 
+    match = gen_disas_label(s);
+    tcg_gen_brcondi_i64(op ? TCG_COND_NE : TCG_COND_EQ,
+                        tcg_cmp, 0, match.label);
     gen_goto_tb(s, 0, 4);
-    gen_set_label(label_match);
+    set_disas_label(s, match);
     gen_goto_tb(s, 1, diff);
 }
 
@@ -1413,7 +1430,7 @@ static void disas_test_b_imm(DisasContext *s, uint32_t insn)
 {
     unsigned int bit_pos, op, rt;
     int64_t diff;
-    TCGLabel *label_match;
+    DisasLabel match;
     TCGv_i64 tcg_cmp;
 
     bit_pos = (extract32(insn, 31, 1) << 5) | extract32(insn, 19, 5);
@@ -1423,14 +1440,15 @@ static void disas_test_b_imm(DisasContext *s, uint32_t insn)
 
     tcg_cmp = tcg_temp_new_i64();
     tcg_gen_andi_i64(tcg_cmp, cpu_reg(s, rt), (1ULL << bit_pos));
-    label_match = gen_new_label();
 
     reset_btype(s);
+
+    match = gen_disas_label(s);
     tcg_gen_brcondi_i64(op ? TCG_COND_NE : TCG_COND_EQ,
-                        tcg_cmp, 0, label_match);
+                        tcg_cmp, 0, match.label);
     tcg_temp_free_i64(tcg_cmp);
     gen_goto_tb(s, 0, 4);
-    gen_set_label(label_match);
+    set_disas_label(s, match);
     gen_goto_tb(s, 1, diff);
 }
 
@@ -1455,10 +1473,10 @@ static void disas_cond_b_imm(DisasContext *s, uint32_t insn)
     reset_btype(s);
     if (cond < 0x0e) {
         /* genuinely conditional branches */
-        TCGLabel *label_match = gen_new_label();
-        arm_gen_test_cc(cond, label_match);
+        DisasLabel match = gen_disas_label(s);
+        arm_gen_test_cc(cond, match.label);
         gen_goto_tb(s, 0, 4);
-        gen_set_label(label_match);
+        set_disas_label(s, match);
         gen_goto_tb(s, 1, diff);
     } else {
         /* 0xe and 0xf are both "always" conditions */
@@ -14698,7 +14716,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
 
     dc->isar = &arm_cpu->isar;
     dc->condjmp = 0;
-
+    dc->pc_save = dc->base.pc_first;
     dc->aarch64 = true;
     dc->thumb = false;
     dc->sctlr_b = 0;
@@ -14780,8 +14798,12 @@ static void aarch64_tr_tb_start(DisasContextBase *db, CPUState *cpu)
 static void aarch64_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
+    target_ulong pc_arg = dc->base.pc_next;
 
-    tcg_gen_insn_start(dc->base.pc_next, 0, 0);
+    if (TARGET_TB_PCREL) {
+        pc_arg &= ~TARGET_PAGE_MASK;
+    }
+    tcg_gen_insn_start(pc_arg, 0, 0);
     dc->insn_start = tcg_last_op();
 }
 
diff --git a/target/arm/translate-m-nocp.c b/target/arm/translate-m-nocp.c
index 694fae7e2e3..5df7d461209 100644
--- a/target/arm/translate-m-nocp.c
+++ b/target/arm/translate-m-nocp.c
@@ -140,7 +140,7 @@ static bool trans_VSCCLRM(DisasContext *s, arg_VSCCLRM *a)
     tcg_gen_andi_i32(sfpa, sfpa, R_V7M_CONTROL_SFPA_MASK);
     tcg_gen_or_i32(sfpa, sfpa, aspen);
     arm_gen_condlabel(s);
-    tcg_gen_brcondi_i32(TCG_COND_EQ, sfpa, 0, s->condlabel);
+    tcg_gen_brcondi_i32(TCG_COND_EQ, sfpa, 0, s->condlabel.label);
 
     if (s->fp_excp_el != 0) {
         gen_exception_insn_el(s, 0, EXCP_NOCP,
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5f6bd9b5b79..d1b868430e0 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -162,7 +162,7 @@ uint64_t asimd_imm_const(uint32_t imm, int cmode, int op)
 void arm_gen_condlabel(DisasContext *s)
 {
     if (!s->condjmp) {
-        s->condlabel = gen_new_label();
+        s->condlabel = gen_disas_label(s);
         s->condjmp = 1;
     }
 }
@@ -268,7 +268,12 @@ static target_long jmp_diff(DisasContext *s, target_long diff)
 
 static void gen_pc_plus_diff(DisasContext *s, TCGv_i32 var, target_long diff)
 {
-    tcg_gen_movi_i32(var, s->pc_curr + diff);
+    assert(s->pc_save != -1);
+    if (TARGET_TB_PCREL) {
+        tcg_gen_addi_i32(var, cpu_R[15], (s->pc_curr - s->pc_save) + diff);
+    } else {
+        tcg_gen_movi_i32(var, s->pc_curr + diff);
+    }
 }
 
 /* Set a variable to the value of a CPU register.  */
@@ -314,6 +319,7 @@ void store_reg(DisasContext *s, int reg, TCGv_i32 var)
          */
         tcg_gen_andi_i32(var, var, s->thumb ? ~1 : ~3);
         s->base.is_jmp = DISAS_JUMP;
+        s->pc_save = -1;
     } else if (reg == 13 && arm_dc_feature(s, ARM_FEATURE_M)) {
         /* For M-profile SP bits [1:0] are always zero */
         tcg_gen_andi_i32(var, var, ~3);
@@ -779,7 +785,8 @@ void gen_set_condexec(DisasContext *s)
 
 void gen_update_pc(DisasContext *s, target_long diff)
 {
-    tcg_gen_movi_i32(cpu_R[15], s->pc_curr + diff);
+    gen_pc_plus_diff(s, cpu_R[15], diff);
+    s->pc_save = s->pc_curr + diff;
 }
 
 /* Set PC and Thumb state from var.  var is marked as dead.  */
@@ -789,6 +796,7 @@ static inline void gen_bx(DisasContext *s, TCGv_i32 var)
     tcg_gen_andi_i32(cpu_R[15], var, ~1);
     tcg_gen_andi_i32(var, var, 1);
     store_cpu_field(var, thumb);
+    s->pc_save = -1;
 }
 
 /*
@@ -830,7 +838,7 @@ static inline void gen_bx_excret(DisasContext *s, TCGv_i32 var)
 static inline void gen_bx_excret_final_code(DisasContext *s)
 {
     /* Generate the code to finish possible exception return and end the TB */
-    TCGLabel *excret_label = gen_new_label();
+    DisasLabel excret_label = gen_disas_label(s);
     uint32_t min_magic;
 
     if (arm_dc_feature(s, ARM_FEATURE_M_SECURITY)) {
@@ -842,14 +850,14 @@ static inline void gen_bx_excret_final_code(DisasContext *s)
     }
 
     /* Is the new PC value in the magic range indicating exception return? */
-    tcg_gen_brcondi_i32(TCG_COND_GEU, cpu_R[15], min_magic, excret_label);
+    tcg_gen_brcondi_i32(TCG_COND_GEU, cpu_R[15], min_magic, excret_label.label);
     /* No: end the TB as we would for a DISAS_JMP */
     if (s->ss_active) {
         gen_singlestep_exception(s);
     } else {
         tcg_gen_exit_tb(NULL, 0);
     }
-    gen_set_label(excret_label);
+    set_disas_label(s, excret_label);
     /* Yes: this is an exception return.
      * At this point in runtime env->regs[15] and env->thumb will hold
      * the exception-return magic number, which do_v7m_exception_exit()
@@ -2603,11 +2611,22 @@ static void gen_goto_ptr(void)
  */
 static void gen_goto_tb(DisasContext *s, int n, target_long diff)
 {
-    target_ulong dest = s->pc_curr + diff;
-
-    if (translator_use_goto_tb(&s->base, dest)) {
-        tcg_gen_goto_tb(n);
-        gen_update_pc(s, diff);
+    if (translator_use_goto_tb(&s->base, s->pc_curr + diff)) {
+        /*
+         * For pcrel, the pc must always be up-to-date on entry to
+         * the linked TB, so that it can use simple additions for all
+         * further adjustments.  For !pcrel, the linked TB is compiled
+         * to know its full virtual address, so we can delay the
+         * update to pc to the unlinked path.  A long chain of links
+         * can thus avoid many updates to the PC.
+         */
+        if (TARGET_TB_PCREL) {
+            gen_update_pc(s, diff);
+            tcg_gen_goto_tb(n);
+        } else {
+            tcg_gen_goto_tb(n);
+            gen_update_pc(s, diff);
+        }
         tcg_gen_exit_tb(s->base.tb, n);
     } else {
         gen_update_pc(s, diff);
@@ -5221,7 +5240,7 @@ static void gen_srs(DisasContext *s,
 static void arm_skip_unless(DisasContext *s, uint32_t cond)
 {
     arm_gen_condlabel(s);
-    arm_gen_test_cc(cond ^ 1, s->condlabel);
+    arm_gen_test_cc(cond ^ 1, s->condlabel.label);
 }
 
 
@@ -8472,7 +8491,7 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
 {
     /* M-profile low-overhead while-loop start */
     TCGv_i32 tmp;
-    TCGLabel *nextlabel;
+    DisasLabel nextlabel;
 
     if (!dc_isar_feature(aa32_lob, s)) {
         return false;
@@ -8513,8 +8532,8 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
         }
     }
 
-    nextlabel = gen_new_label();
-    tcg_gen_brcondi_i32(TCG_COND_EQ, cpu_R[a->rn], 0, nextlabel);
+    nextlabel = gen_disas_label(s);
+    tcg_gen_brcondi_i32(TCG_COND_EQ, cpu_R[a->rn], 0, nextlabel.label);
     tmp = load_reg(s, a->rn);
     store_reg(s, 14, tmp);
     if (a->size != 4) {
@@ -8535,7 +8554,7 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
     }
     gen_jmp_tb(s, curr_insn_len(s), 1);
 
-    gen_set_label(nextlabel);
+    set_disas_label(s, nextlabel);
     gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
@@ -8551,7 +8570,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
      * any faster.
      */
     TCGv_i32 tmp;
-    TCGLabel *loopend;
+    DisasLabel loopend;
     bool fpu_active;
 
     if (!dc_isar_feature(aa32_lob, s)) {
@@ -8606,12 +8625,12 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
 
     if (!a->tp && dc_isar_feature(aa32_mve, s) && fpu_active) {
         /* Need to do a runtime check for LTPSIZE != 4 */
-        TCGLabel *skipexc = gen_new_label();
+        DisasLabel skipexc = gen_disas_label(s);
         tmp = load_cpu_field(v7m.ltpsize);
-        tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 4, skipexc);
+        tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 4, skipexc.label);
         tcg_temp_free_i32(tmp);
         gen_exception_insn(s, 0, EXCP_INVSTATE, syn_uncategorized());
-        gen_set_label(skipexc);
+        set_disas_label(s, skipexc);
     }
 
     if (a->f) {
@@ -8626,9 +8645,9 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
      * loop decrement value is 1. For LETP we need to calculate the decrement
      * value from LTPSIZE.
      */
-    loopend = gen_new_label();
+    loopend = gen_disas_label(s);
     if (!a->tp) {
-        tcg_gen_brcondi_i32(TCG_COND_LEU, cpu_R[14], 1, loopend);
+        tcg_gen_brcondi_i32(TCG_COND_LEU, cpu_R[14], 1, loopend.label);
         tcg_gen_addi_i32(cpu_R[14], cpu_R[14], -1);
     } else {
         /*
@@ -8641,7 +8660,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
         tcg_gen_shl_i32(decr, tcg_constant_i32(1), decr);
         tcg_temp_free_i32(ltpsize);
 
-        tcg_gen_brcond_i32(TCG_COND_LEU, cpu_R[14], decr, loopend);
+        tcg_gen_brcond_i32(TCG_COND_LEU, cpu_R[14], decr, loopend.label);
 
         tcg_gen_sub_i32(cpu_R[14], cpu_R[14], decr);
         tcg_temp_free_i32(decr);
@@ -8649,7 +8668,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
     /* Jump back to the loop start */
     gen_jmp(s, jmp_diff(s, -a->imm));
 
-    gen_set_label(loopend);
+    set_disas_label(s, loopend);
     if (a->tp) {
         /* Exits from tail-pred loops must reset LTPSIZE to 4 */
         store_cpu_field(tcg_constant_i32(4), v7m.ltpsize);
@@ -8753,7 +8772,7 @@ static bool trans_CBZ(DisasContext *s, arg_CBZ *a)
 
     arm_gen_condlabel(s);
     tcg_gen_brcondi_i32(a->nz ? TCG_COND_EQ : TCG_COND_NE,
-                        tmp, 0, s->condlabel);
+                        tmp, 0, s->condlabel.label);
     tcg_temp_free_i32(tmp);
     gen_jmp(s, jmp_diff(s, a->imm));
     return true;
@@ -9319,7 +9338,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     dc->isar = &cpu->isar;
     dc->condjmp = 0;
-
+    dc->pc_save = dc->base.pc_first;
     dc->aarch64 = false;
     dc->thumb = EX_TBFLAG_AM32(tb_flags, THUMB);
     dc->be_data = EX_TBFLAG_ANY(tb_flags, BE_DATA) ? MO_BE : MO_LE;
@@ -9337,7 +9356,6 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
      */
     dc->eci = dc->condexec_mask = dc->condexec_cond = 0;
     dc->eci_handled = false;
-    dc->insn_eci_rewind = NULL;
     if (condexec & 0xf) {
         dc->condexec_mask = (condexec & 0xf) << 1;
         dc->condexec_cond = condexec >> 4;
@@ -9473,13 +9491,17 @@ static void arm_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
      * fields here.
      */
     uint32_t condexec_bits;
+    target_ulong pc_arg = dc->base.pc_next;
 
+    if (TARGET_TB_PCREL) {
+        pc_arg &= ~TARGET_PAGE_MASK;
+    }
     if (dc->eci) {
         condexec_bits = dc->eci << 4;
     } else {
         condexec_bits = (dc->condexec_cond << 4) | (dc->condexec_mask >> 1);
     }
-    tcg_gen_insn_start(dc->base.pc_next, condexec_bits, 0);
+    tcg_gen_insn_start(pc_arg, condexec_bits, 0);
     dc->insn_start = tcg_last_op();
 }
 
@@ -9522,8 +9544,11 @@ static bool arm_check_ss_active(DisasContext *dc)
 
 static void arm_post_translate_insn(DisasContext *dc)
 {
-    if (dc->condjmp && !dc->base.is_jmp) {
-        gen_set_label(dc->condlabel);
+    if (dc->condjmp && dc->base.is_jmp == DISAS_NEXT) {
+        if (dc->pc_save != dc->condlabel.pc_save) {
+            gen_update_pc(dc, dc->condlabel.pc_save - dc->pc_save);
+        }
+        gen_set_label(dc->condlabel.label);
         dc->condjmp = 0;
     }
     translator_loop_temp_check(&dc->base);
@@ -9626,6 +9651,9 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     uint32_t pc = dc->base.pc_next;
     uint32_t insn;
     bool is_16bit;
+    /* TCG op to rewind to if this turns out to be an invalid ECI state */
+    TCGOp *insn_eci_rewind = NULL;
+    target_ulong insn_eci_pc_save = -1;
 
     /* Misaligned thumb PC is architecturally impossible. */
     assert((dc->base.pc_next & 1) == 0);
@@ -9687,7 +9715,8 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          *     insn" case. We will rewind to the marker (ie throwing away
          *     all the generated code) and instead emit "take exception".
          */
-        dc->insn_eci_rewind = tcg_last_op();
+        insn_eci_rewind = tcg_last_op();
+        insn_eci_pc_save = dc->pc_save;
     }
 
     if (dc->condexec_mask && !thumb_insn_is_unconditional(dc, insn)) {
@@ -9723,7 +9752,8 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          * Insn wasn't valid for ECI/ICI at all: undo what we
          * just generated and instead emit an exception
          */
-        tcg_remove_ops_after(dc->insn_eci_rewind);
+        tcg_remove_ops_after(insn_eci_rewind);
+        dc->pc_save = insn_eci_pc_save;
         dc->condjmp = 0;
         gen_exception_insn(dc, 0, EXCP_INVSTATE, syn_uncategorized());
     }
@@ -9852,7 +9882,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 
     if (dc->condjmp) {
         /* "Condition failed" instruction codepath for the branch/trap insn */
-        gen_set_label(dc->condlabel);
+        set_disas_label(dc, dc->condlabel);
         gen_set_condexec(dc);
         if (unlikely(dc->ss_active)) {
             gen_update_pc(dc, curr_insn_len(dc));
@@ -9914,11 +9944,19 @@ void restore_state_to_opc(CPUARMState *env, TranslationBlock *tb,
                           target_ulong *data)
 {
     if (is_a64(env)) {
-        env->pc = data[0];
+        if (TARGET_TB_PCREL) {
+            env->pc = (env->pc & TARGET_PAGE_MASK) | data[0];
+        } else {
+            env->pc = data[0];
+        }
         env->condexec_bits = 0;
         env->exception.syndrome = data[2] << ARM_INSN_START_WORD2_SHIFT;
     } else {
-        env->regs[15] = data[0];
+        if (TARGET_TB_PCREL) {
+            env->regs[15] = (env->regs[15] & TARGET_PAGE_MASK) | data[0];
+        } else {
+            env->regs[15] = data[0];
+        }
         env->condexec_bits = data[1];
         env->exception.syndrome = data[2] << ARM_INSN_START_WORD2_SHIFT;
     }
-- 
2.25.1


