Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2490255C72
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 16:30:07 +0200 (CEST)
Received: from localhost ([::1]:40670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBfOI-0002nA-Pm
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 10:30:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBfEq-000103-3s
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 10:20:20 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:53024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBfEm-0005BL-F4
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 10:20:19 -0400
Received: by mail-pj1-x1030.google.com with SMTP id z18so562388pjr.2
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 07:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KOp/91/a2BIVMe1u/E83L0OjODEkWinQdZcmcUxF1f8=;
 b=ksnZScMT+sYu259HQ1fPfP83tPwQQkGaOt8HtshEex7K3bsg9ma4VF37yIv5w2NibM
 Vhk8LI5swG6DV+f3eYeCAvsS7x3xBuPD8EJtw10ewLa2DdHQKDPnv6BZHenBHA9YShNe
 vnr1qdLObFTKQ7l9kD522uZ26knySElcWWq/i72rolDZCT8zHuu6rfyiwu726HmHiftc
 mtUmhCVhutUMovzsussqLoTyJLEYNlrnF7s6xyW31Vjnh2Y1QP0st6EyBovifawHe439
 L4U1vehj/zkRTCV4tS+VSeySjaERI2e5Vr1NlsiOb8pZ4BIGirJIvVRrcHjHpts7INLQ
 6zdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KOp/91/a2BIVMe1u/E83L0OjODEkWinQdZcmcUxF1f8=;
 b=G0NQUBdtICdTuF/AoV703A32xvnBbCWGelQp21QxP2xwbpOQUkvI3BB8gOL6lQun3Z
 3kVB9HP1Y7drZSUV+lNnEvza1BPRjtrwI9pCVnj7mPVC9EeP/N/Ls2gtKND2uuBgzT7x
 H4RChWte+u0+ZuJsJ0DoC7ixQMSSvm1VoH6SeFk7A+Q6zN+Yd0Lku+HkPZUVdX05fWhD
 dJRhG+iSngt0kfLnzIv28HkeusoeInL4qNtbfALZXAjLE5Yx5JNdakUPUY7d+1wNdcIy
 aCJi82uTKL/n5r1Y1v4sI2D2yebg6Izm2KnY+KInjti6rj4tDY2Qs5kxY/Ln6toxg6Gu
 ANWA==
X-Gm-Message-State: AOAM530DX5+S06R8K+I/2XhMqcOaDzXp7dI6+lLcQZX4sGd8vLv5HY59
 9jSNkfaZySffEPBDJQ6+QIg9cGw6uccgAA==
X-Google-Smtp-Source: ABdhPJw7nrUNcGtTsKWGCNOoHKKWeWklMSLXkGsR+Y6XqR8r1qkqDuztbr7PMbHzUXm35cvHicJeWQ==
X-Received: by 2002:a17:902:a981:: with SMTP id
 bh1mr1499134plb.157.1598624414243; 
 Fri, 28 Aug 2020 07:20:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id j3sm1403080pjw.23.2020.08.28.07.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 07:20:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 33/76] target/microblaze: Remove LOG_DIS
Date: Fri, 28 Aug 2020 07:18:46 -0700
Message-Id: <20200828141929.77854-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200828141929.77854-1-richard.henderson@linaro.org>
References: <20200828141929.77854-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: edgar.iglesias@xilinx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Also remove the related defines, DISAS_MB and DEBUG_DISAS.
Rely on print_insn_microblaze.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 78 +----------------------------------
 1 file changed, 1 insertion(+), 77 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 860859324a..133ec24870 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -33,14 +33,6 @@
 #include "trace-tcg.h"
 #include "exec/log.h"
 
-
-#define DISAS_MB 1
-#if DISAS_MB
-#  define LOG_DIS(...) qemu_log_mask(CPU_LOG_TB_IN_ASM, ## __VA_ARGS__)
-#else
-#  define LOG_DIS(...) do { } while (0)
-#endif
-
 #define EXTRACT_FIELD(src, start, end) \
             (((src) >> start) & ((1 << (end - start + 1)) - 1))
 
@@ -205,10 +197,6 @@ static void dec_add(DisasContext *dc)
     k = dc->opcode & 4;
     c = dc->opcode & 2;
 
-    LOG_DIS("add%s%s%s r%d r%d r%d\n",
-            dc->type_b ? "i" : "", k ? "k" : "", c ? "c" : "",
-            dc->rd, dc->ra, dc->rb);
-
     /* Take care of the easy cases first.  */
     if (k) {
         /* k - keep carry, no need to update MSR.  */
@@ -252,7 +240,6 @@ static void dec_sub(DisasContext *dc)
     cmp = (dc->imm & 1) && (!dc->type_b) && k;
 
     if (cmp) {
-        LOG_DIS("cmp%s r%d, r%d ir=%x\n", u ? "u" : "", dc->rd, dc->ra, dc->ir);
         if (dc->rd) {
             if (u)
                 gen_helper_cmpu(cpu_R[dc->rd], cpu_R[dc->ra], cpu_R[dc->rb]);
@@ -262,9 +249,6 @@ static void dec_sub(DisasContext *dc)
         return;
     }
 
-    LOG_DIS("sub%s%s r%d, r%d r%d\n",
-             k ? "k" : "",  c ? "c" : "", dc->rd, dc->ra, dc->rb);
-
     /* Take care of the easy cases first.  */
     if (k) {
         /* k - keep carry, no need to update MSR.  */
@@ -314,19 +298,16 @@ static void dec_pattern(DisasContext *dc)
     switch (mode) {
         case 0:
             /* pcmpbf.  */
-            LOG_DIS("pcmpbf r%d r%d r%d\n", dc->rd, dc->ra, dc->rb);
             if (dc->rd)
                 gen_helper_pcmpbf(cpu_R[dc->rd], cpu_R[dc->ra], cpu_R[dc->rb]);
             break;
         case 2:
-            LOG_DIS("pcmpeq r%d r%d r%d\n", dc->rd, dc->ra, dc->rb);
             if (dc->rd) {
                 tcg_gen_setcond_i32(TCG_COND_EQ, cpu_R[dc->rd],
                                    cpu_R[dc->ra], cpu_R[dc->rb]);
             }
             break;
         case 3:
-            LOG_DIS("pcmpne r%d r%d r%d\n", dc->rd, dc->ra, dc->rb);
             if (dc->rd) {
                 tcg_gen_setcond_i32(TCG_COND_NE, cpu_R[dc->rd],
                                    cpu_R[dc->ra], cpu_R[dc->rb]);
@@ -349,7 +330,6 @@ static void dec_and(DisasContext *dc)
     }
 
     not = dc->opcode & (1 << 1);
-    LOG_DIS("and%s\n", not ? "n" : "");
 
     if (!dc->rd)
         return;
@@ -367,7 +347,6 @@ static void dec_or(DisasContext *dc)
         return;
     }
 
-    LOG_DIS("or r%d r%d r%d imm=%x\n", dc->rd, dc->ra, dc->rb, dc->imm);
     if (dc->rd)
         tcg_gen_or_i32(cpu_R[dc->rd], cpu_R[dc->ra], *(dec_alu_op_b(dc)));
 }
@@ -379,7 +358,6 @@ static void dec_xor(DisasContext *dc)
         return;
     }
 
-    LOG_DIS("xor r%d\n", dc->rd);
     if (dc->rd)
         tcg_gen_xor_i32(cpu_R[dc->rd], cpu_R[dc->ra], *(dec_alu_op_b(dc)));
 }
@@ -433,9 +411,6 @@ static void dec_msr(DisasContext *dc)
     if (clrset) {
         bool clr = extract32(dc->ir, 16, 1);
 
-        LOG_DIS("msr%s r%d imm=%x\n", clr ? "clr" : "set",
-                dc->rd, dc->imm);
-
         if (!dc->cpu->cfg.use_msr_instr) {
             /* nop??? */
             return;
@@ -478,7 +453,6 @@ static void dec_msr(DisasContext *dc)
 
         sr &= 7;
         tmp_sr = tcg_const_i32(sr);
-        LOG_DIS("m%ss sr%d r%d imm=%x\n", to ? "t" : "f", sr, dc->ra, dc->imm);
         if (to) {
             gen_helper_mmu_write(cpu_env, tmp_ext, tmp_sr, cpu_R[dc->ra]);
         } else {
@@ -491,7 +465,6 @@ static void dec_msr(DisasContext *dc)
 #endif
 
     if (to) {
-        LOG_DIS("m%ss sr%x r%d imm=%x\n", to ? "t" : "f", sr, dc->ra, dc->imm);
         switch (sr) {
             case SR_PC:
                 break;
@@ -535,8 +508,6 @@ static void dec_msr(DisasContext *dc)
                 break;
         }
     } else {
-        LOG_DIS("m%ss r%d sr%x imm=%x\n", to ? "t" : "f", dc->rd, sr, dc->imm);
-
         switch (sr) {
             case SR_PC:
                 tcg_gen_movi_i32(cpu_R[dc->rd], dc->base.pc_next);
@@ -609,7 +580,6 @@ static void dec_mul(DisasContext *dc)
     subcode = dc->imm & 3;
 
     if (dc->type_b) {
-        LOG_DIS("muli r%d r%d %x\n", dc->rd, dc->ra, dc->imm);
         tcg_gen_mul_i32(cpu_R[dc->rd], cpu_R[dc->ra], *(dec_alu_op_b(dc)));
         return;
     }
@@ -622,21 +592,17 @@ static void dec_mul(DisasContext *dc)
     tmp = tcg_temp_new_i32();
     switch (subcode) {
         case 0:
-            LOG_DIS("mul r%d r%d r%d\n", dc->rd, dc->ra, dc->rb);
             tcg_gen_mul_i32(cpu_R[dc->rd], cpu_R[dc->ra], cpu_R[dc->rb]);
             break;
         case 1:
-            LOG_DIS("mulh r%d r%d r%d\n", dc->rd, dc->ra, dc->rb);
             tcg_gen_muls2_i32(tmp, cpu_R[dc->rd],
                               cpu_R[dc->ra], cpu_R[dc->rb]);
             break;
         case 2:
-            LOG_DIS("mulhsu r%d r%d r%d\n", dc->rd, dc->ra, dc->rb);
             tcg_gen_mulsu2_i32(tmp, cpu_R[dc->rd],
                                cpu_R[dc->ra], cpu_R[dc->rb]);
             break;
         case 3:
-            LOG_DIS("mulhu r%d r%d r%d\n", dc->rd, dc->ra, dc->rb);
             tcg_gen_mulu2_i32(tmp, cpu_R[dc->rd], cpu_R[dc->ra], cpu_R[dc->rb]);
             break;
         default:
@@ -652,7 +618,6 @@ static void dec_div(DisasContext *dc)
     unsigned int u;
 
     u = dc->imm & 2; 
-    LOG_DIS("div\n");
 
     if (trap_illegal(dc, !dc->cpu->cfg.use_div)) {
         return;
@@ -688,10 +653,6 @@ static void dec_barrel(DisasContext *dc)
     imm_w = extract32(dc->imm, 6, 5);
     imm_s = extract32(dc->imm, 0, 5);
 
-    LOG_DIS("bs%s%s%s r%d r%d r%d\n",
-            e ? "e" : "",
-            s ? "l" : "r", t ? "a" : "l", dc->rd, dc->ra, dc->rb);
-
     if (e) {
         if (imm_w + imm_s > 32 || imm_w == 0) {
             /* These inputs have an undefined behavior.  */
@@ -742,7 +703,6 @@ static void dec_bit(DisasContext *dc)
             /* src.  */
             t0 = tcg_temp_new_i32();
 
-            LOG_DIS("src r%d r%d\n", dc->rd, dc->ra);
             tcg_gen_shli_i32(t0, cpu_msr_c, 31);
             tcg_gen_andi_i32(cpu_msr_c, cpu_R[dc->ra], 1);
             if (dc->rd) {
@@ -755,8 +715,6 @@ static void dec_bit(DisasContext *dc)
         case 0x1:
         case 0x41:
             /* srl.  */
-            LOG_DIS("srl r%d r%d\n", dc->rd, dc->ra);
-
             tcg_gen_andi_i32(cpu_msr_c, cpu_R[dc->ra], 1);
             if (dc->rd) {
                 if (op == 0x41)
@@ -766,11 +724,9 @@ static void dec_bit(DisasContext *dc)
             }
             break;
         case 0x60:
-            LOG_DIS("ext8s r%d r%d\n", dc->rd, dc->ra);
             tcg_gen_ext8s_i32(cpu_R[dc->rd], cpu_R[dc->ra]);
             break;
         case 0x61:
-            LOG_DIS("ext16s r%d r%d\n", dc->rd, dc->ra);
             tcg_gen_ext16s_i32(cpu_R[dc->rd], cpu_R[dc->ra]);
             break;
         case 0x64:
@@ -778,12 +734,10 @@ static void dec_bit(DisasContext *dc)
         case 0x74:
         case 0x76:
             /* wdc.  */
-            LOG_DIS("wdc r%d\n", dc->ra);
             trap_userspace(dc, true);
             break;
         case 0x68:
             /* wic.  */
-            LOG_DIS("wic r%d\n", dc->ra);
             trap_userspace(dc, true);
             break;
         case 0xe0:
@@ -796,12 +750,10 @@ static void dec_bit(DisasContext *dc)
             break;
         case 0x1e0:
             /* swapb */
-            LOG_DIS("swapb r%d r%d\n", dc->rd, dc->ra);
             tcg_gen_bswap32_i32(cpu_R[dc->rd], cpu_R[dc->ra]);
             break;
         case 0x1e2:
             /*swaph */
-            LOG_DIS("swaph r%d r%d\n", dc->rd, dc->ra);
             tcg_gen_rotri_i32(cpu_R[dc->rd], cpu_R[dc->ra], 16);
             break;
         default:
@@ -824,7 +776,6 @@ static inline void sync_jmpstate(DisasContext *dc)
 
 static void dec_imm(DisasContext *dc)
 {
-    LOG_DIS("imm %x\n", dc->imm << 16);
     tcg_gen_movi_i32(cpu_imm, (dc->imm << 16));
     dc->tb_flags |= IMM_FLAG;
     dc->clear_imm = 0;
@@ -928,10 +879,6 @@ static void dec_load(DisasContext *dc)
         return;
     }
 
-    LOG_DIS("l%d%s%s%s%s\n", size, dc->type_b ? "i" : "", rev ? "r" : "",
-                                                        ex ? "x" : "",
-                                                        ea ? "ea" : "");
-
     t_sync_flags(dc);
     addr = tcg_temp_new();
     compute_ldst_addr(dc, ea, addr);
@@ -1039,9 +986,6 @@ static void dec_store(DisasContext *dc)
 
     trap_userspace(dc, ea);
 
-    LOG_DIS("s%d%s%s%s%s\n", size, dc->type_b ? "i" : "", rev ? "r" : "",
-                                                        ex ? "x" : "",
-                                                        ea ? "ea" : "");
     t_sync_flags(dc);
     /* If we get a fault on a dslot, the jmpstate better be in sync.  */
     sync_jmpstate(dc);
@@ -1184,7 +1128,6 @@ static void dec_bcc(DisasContext *dc)
 
     cc = EXTRACT_FIELD(dc->ir, 21, 23);
     dslot = dc->ir & (1 << 25);
-    LOG_DIS("bcc%s r%d %x\n", dslot ? "d" : "", dc->ra, dc->imm);
 
     dc->delayed_branch = 1;
     if (dslot) {
@@ -1217,8 +1160,6 @@ static void dec_br(DisasContext *dc)
     if (mbar == 2 && dc->imm == 4) {
         uint16_t mbar_imm = dc->rd;
 
-        LOG_DIS("mbar %d\n", mbar_imm);
-
         /* Data access memory barrier.  */
         if ((mbar_imm & 2) == 0) {
             tcg_gen_mb(TCG_BAR_SC | TCG_MO_ALL);
@@ -1228,8 +1169,6 @@ static void dec_br(DisasContext *dc)
         if (mbar_imm & 16) {
             TCGv_i32 tmp_1;
 
-            LOG_DIS("sleep\n");
-
             if (trap_userspace(dc, true)) {
                 /* Sleep is a privileged instruction.  */
                 return;
@@ -1253,11 +1192,6 @@ static void dec_br(DisasContext *dc)
         return;
     }
 
-    LOG_DIS("br%s%s%s%s imm=%x\n",
-             abs ? "a" : "", link ? "l" : "",
-             dc->type_b ? "i" : "", dslot ? "d" : "",
-             dc->imm);
-
     dc->delayed_branch = 1;
     if (dslot) {
         dec_setup_dslot(dc);
@@ -1363,16 +1297,12 @@ static void dec_rts(DisasContext *dc)
     dec_setup_dslot(dc);
 
     if (i_bit) {
-        LOG_DIS("rtid ir=%x\n", dc->ir);
         dc->tb_flags |= DRTI_FLAG;
     } else if (b_bit) {
-        LOG_DIS("rtbd ir=%x\n", dc->ir);
         dc->tb_flags |= DRTB_FLAG;
     } else if (e_bit) {
-        LOG_DIS("rted ir=%x\n", dc->ir);
         dc->tb_flags |= DRTE_FLAG;
-    } else
-        LOG_DIS("rts ir=%x\n", dc->ir);
+    }
 
     dc->jmp = JMP_INDIRECT;
     tcg_gen_movi_i32(cpu_btaken, 1);
@@ -1505,9 +1435,6 @@ static void dec_stream(DisasContext *dc)
     TCGv_i32 t_id, t_ctrl;
     int ctrl;
 
-    LOG_DIS("%s%s imm=%x\n", dc->rd ? "get" : "put",
-            dc->type_b ? "" : "d", dc->imm);
-
     if (trap_userspace(dc, true)) {
         return;
     }
@@ -1565,7 +1492,6 @@ static inline void decode(DisasContext *dc, uint32_t ir)
     int i;
 
     dc->ir = ir;
-    LOG_DIS("%8.8x\t", dc->ir);
 
     if (ir == 0) {
         trap_illegal(dc, dc->cpu->cfg.opcode_0_illegal);
@@ -1744,10 +1670,8 @@ static void mb_tr_tb_stop(DisasContextBase *dcb, CPUState *cs)
 
 static void mb_tr_disas_log(const DisasContextBase *dcb, CPUState *cs)
 {
-#ifdef DEBUG_DISAS
     qemu_log("IN: %s\n", lookup_symbol(dcb->pc_first));
     log_target_disas(cs, dcb->pc_first, dcb->tb->size);
-#endif
 }
 
 static const TranslatorOps mb_tr_ops = {
-- 
2.25.1


