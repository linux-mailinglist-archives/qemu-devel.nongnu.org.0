Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A34431E350
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 00:58:45 +0100 (CET)
Received: from localhost ([::1]:57002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWiS-0004Ln-Jx
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 18:58:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWS3-0001BC-EE
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:49 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:37196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRp-0004ps-LU
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:46 -0500
Received: by mail-pf1-x42d.google.com with SMTP id b145so39877pfb.4
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C7OXmlTY2oJFnwsCJ9njAy0mLj9unuWAipSamkyriOo=;
 b=pdPVsxzz3H5WN6S+5QSd58G9+U6JnNa3Vm4Dg7EMXeVfcVxr+AN22sqZMGi68Ox1Pe
 QkCJA8XE5QSjEyyN/ikIq2kw+r2nUVN3YXbRyFhQ0P4WjOlr2nCbnewtka/05uBGzhTz
 bWIcGOGCIjs7WjfmlsTiGq9ToZhZVZxr3rAQMo9WolqZU17dSq8+ZX9yeA3tgL+SbiWL
 YGQBlLQYjP1OtrW5ULSgcuuSewHAc0Ectb8Eibcvf9KOfEmHcJ62DC9tEiwM86CPSgzp
 8rwYqxPziM82UHecLBK28Phu7YE3O50YMsfFEP1bvrTavXNwl7rKTsbDWcyQpb3xmlwV
 zREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C7OXmlTY2oJFnwsCJ9njAy0mLj9unuWAipSamkyriOo=;
 b=CvDKLaRaPnWyGmrvb8rogKusY0WlTyTAL943MuJwl96a9lQqjUWGGMCz6i23ua/10q
 HaZTYdzfwN9RH6/fe86A/cvdnHem7MFNFI9cvVGtpoR7oq8DxyiHr3uJfsJkwfpld5zK
 PmJbjzHZvR/jiIQB7+aoKQnYEtefOIcJpFSni7WGRN71rMl3jaBthndXqwDZE1ehWU7E
 ir1H+ctAu+2b2fUYK6A4oyTPi+1vUL7qbdkW3nEZxhDqiaglsD/Au+B8gt23nX/7921K
 GZMyDex9sxyH53Z+KwSEOPaYN2Y9oirou4EA+sKNAzcIiLM58YJQ+AMtUwZ7qaSLmHMz
 c+qQ==
X-Gm-Message-State: AOAM5336cFp4lQaDOuv4brrdC8MNtpwT4SkGXUQsLhAD0riuy+v6hX2w
 Rf5hI6dLctugLmAEflvhyf+G+r4S942sAA==
X-Google-Smtp-Source: ABdhPJwT1eB5ZGuminpLSRMH7Tni4VoFWhaX7u5FujkhSiajy1l586QDVtm1KjhyFG0sfTPlrrhl0w==
X-Received: by 2002:a63:ed57:: with SMTP id m23mr1638105pgk.28.1613605290276; 
 Wed, 17 Feb 2021 15:41:30 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:41:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/35] Hexagon (target/hexagon) TCG generation
Date: Wed, 17 Feb 2021 15:40:15 -0800
Message-Id: <20210217234023.1742406-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Include the generated files and set up the data structures

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Message-Id: <1612763186-18161-27-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/genptr.h |  25 +++
 target/hexagon/genptr.c | 331 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 356 insertions(+)
 create mode 100644 target/hexagon/genptr.h
 create mode 100644 target/hexagon/genptr.c

diff --git a/target/hexagon/genptr.h b/target/hexagon/genptr.h
new file mode 100644
index 0000000000..c158005d2a
--- /dev/null
+++ b/target/hexagon/genptr.h
@@ -0,0 +1,25 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HEXAGON_GENPTR_H
+#define HEXAGON_GENPTR_H
+
+#include "insn.h"
+
+extern const SemanticInsn opcode_genptr[];
+
+#endif
diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
new file mode 100644
index 0000000000..7481f4c1dd
--- /dev/null
+++ b/target/hexagon/genptr.c
@@ -0,0 +1,331 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#define QEMU_GENERATE
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "cpu.h"
+#include "internal.h"
+#include "tcg/tcg-op.h"
+#include "insn.h"
+#include "opcodes.h"
+#include "translate.h"
+#include "macros.h"
+#include "gen_tcg.h"
+
+static inline TCGv gen_read_preg(TCGv pred, uint8_t num)
+{
+    tcg_gen_mov_tl(pred, hex_pred[num]);
+    return pred;
+}
+
+static inline void gen_log_predicated_reg_write(int rnum, TCGv val, int slot)
+{
+    TCGv one = tcg_const_tl(1);
+    TCGv zero = tcg_const_tl(0);
+    TCGv slot_mask = tcg_temp_new();
+
+    tcg_gen_andi_tl(slot_mask, hex_slot_cancelled, 1 << slot);
+    tcg_gen_movcond_tl(TCG_COND_EQ, hex_new_value[rnum], slot_mask, zero,
+                           val, hex_new_value[rnum]);
+#if HEX_DEBUG
+    /* Do this so HELPER(debug_commit_end) will know */
+    tcg_gen_movcond_tl(TCG_COND_EQ, hex_reg_written[rnum], slot_mask, zero,
+                       one, hex_reg_written[rnum]);
+#endif
+
+    tcg_temp_free(one);
+    tcg_temp_free(zero);
+    tcg_temp_free(slot_mask);
+}
+
+static inline void gen_log_reg_write(int rnum, TCGv val)
+{
+    tcg_gen_mov_tl(hex_new_value[rnum], val);
+#if HEX_DEBUG
+    /* Do this so HELPER(debug_commit_end) will know */
+    tcg_gen_movi_tl(hex_reg_written[rnum], 1);
+#endif
+}
+
+static void gen_log_predicated_reg_write_pair(int rnum, TCGv_i64 val, int slot)
+{
+    TCGv val32 = tcg_temp_new();
+    TCGv one = tcg_const_tl(1);
+    TCGv zero = tcg_const_tl(0);
+    TCGv slot_mask = tcg_temp_new();
+
+    tcg_gen_andi_tl(slot_mask, hex_slot_cancelled, 1 << slot);
+    /* Low word */
+    tcg_gen_extrl_i64_i32(val32, val);
+    tcg_gen_movcond_tl(TCG_COND_EQ, hex_new_value[rnum], slot_mask, zero,
+                       val32, hex_new_value[rnum]);
+#if HEX_DEBUG
+    /* Do this so HELPER(debug_commit_end) will know */
+    tcg_gen_movcond_tl(TCG_COND_EQ, hex_reg_written[rnum],
+                       slot_mask, zero,
+                       one, hex_reg_written[rnum]);
+#endif
+
+    /* High word */
+    tcg_gen_extrh_i64_i32(val32, val);
+    tcg_gen_movcond_tl(TCG_COND_EQ, hex_new_value[rnum + 1],
+                       slot_mask, zero,
+                       val32, hex_new_value[rnum + 1]);
+#if HEX_DEBUG
+    /* Do this so HELPER(debug_commit_end) will know */
+    tcg_gen_movcond_tl(TCG_COND_EQ, hex_reg_written[rnum + 1],
+                       slot_mask, zero,
+                       one, hex_reg_written[rnum + 1]);
+#endif
+
+    tcg_temp_free(val32);
+    tcg_temp_free(one);
+    tcg_temp_free(zero);
+    tcg_temp_free(slot_mask);
+}
+
+static void gen_log_reg_write_pair(int rnum, TCGv_i64 val)
+{
+    /* Low word */
+    tcg_gen_extrl_i64_i32(hex_new_value[rnum], val);
+#if HEX_DEBUG
+    /* Do this so HELPER(debug_commit_end) will know */
+    tcg_gen_movi_tl(hex_reg_written[rnum], 1);
+#endif
+
+    /* High word */
+    tcg_gen_extrh_i64_i32(hex_new_value[rnum + 1], val);
+#if HEX_DEBUG
+    /* Do this so HELPER(debug_commit_end) will know */
+    tcg_gen_movi_tl(hex_reg_written[rnum + 1], 1);
+#endif
+}
+
+static inline void gen_log_pred_write(int pnum, TCGv val)
+{
+    TCGv zero = tcg_const_tl(0);
+    TCGv base_val = tcg_temp_new();
+    TCGv and_val = tcg_temp_new();
+    TCGv pred_written = tcg_temp_new();
+
+    /* Multiple writes to the same preg are and'ed together */
+    tcg_gen_andi_tl(base_val, val, 0xff);
+    tcg_gen_and_tl(and_val, base_val, hex_new_pred_value[pnum]);
+    tcg_gen_andi_tl(pred_written, hex_pred_written, 1 << pnum);
+    tcg_gen_movcond_tl(TCG_COND_NE, hex_new_pred_value[pnum],
+                       pred_written, zero,
+                       and_val, base_val);
+    tcg_gen_ori_tl(hex_pred_written, hex_pred_written, 1 << pnum);
+
+    tcg_temp_free(zero);
+    tcg_temp_free(base_val);
+    tcg_temp_free(and_val);
+    tcg_temp_free(pred_written);
+}
+
+static inline void gen_read_p3_0(TCGv control_reg)
+{
+    tcg_gen_movi_tl(control_reg, 0);
+    for (int i = 0; i < NUM_PREGS; i++) {
+        tcg_gen_deposit_tl(control_reg, control_reg, hex_pred[i], i * 8, 8);
+    }
+}
+
+/*
+ * Certain control registers require special handling on read
+ *     HEX_REG_P3_0          aliased to the predicate registers
+ *                           -> concat the 4 predicate registers together
+ *     HEX_REG_PC            actual value stored in DisasContext
+ *                           -> assign from ctx->base.pc_next
+ *     HEX_REG_QEMU_*_CNT    changes in current TB in DisasContext
+ *                           -> add current TB changes to existing reg value
+ */
+static inline void gen_read_ctrl_reg(DisasContext *ctx, const int reg_num,
+                                     TCGv dest)
+{
+    if (reg_num == HEX_REG_P3_0) {
+        gen_read_p3_0(dest);
+    } else if (reg_num == HEX_REG_PC) {
+        tcg_gen_movi_tl(dest, ctx->base.pc_next);
+    } else if (reg_num == HEX_REG_QEMU_PKT_CNT) {
+        tcg_gen_addi_tl(dest, hex_gpr[HEX_REG_QEMU_PKT_CNT],
+                        ctx->num_packets);
+    } else if (reg_num == HEX_REG_QEMU_INSN_CNT) {
+        tcg_gen_addi_tl(dest, hex_gpr[HEX_REG_QEMU_INSN_CNT],
+                        ctx->num_insns);
+    } else {
+        tcg_gen_mov_tl(dest, hex_gpr[reg_num]);
+    }
+}
+
+static inline void gen_read_ctrl_reg_pair(DisasContext *ctx, const int reg_num,
+                                          TCGv_i64 dest)
+{
+    if (reg_num == HEX_REG_P3_0) {
+        TCGv p3_0 = tcg_temp_new();
+        gen_read_p3_0(p3_0);
+        tcg_gen_concat_i32_i64(dest, p3_0, hex_gpr[reg_num + 1]);
+        tcg_temp_free(p3_0);
+    } else if (reg_num == HEX_REG_PC - 1) {
+        TCGv pc = tcg_const_tl(ctx->base.pc_next);
+        tcg_gen_concat_i32_i64(dest, hex_gpr[reg_num], pc);
+        tcg_temp_free(pc);
+    } else if (reg_num == HEX_REG_QEMU_PKT_CNT) {
+        TCGv pkt_cnt = tcg_temp_new();
+        TCGv insn_cnt = tcg_temp_new();
+        tcg_gen_addi_tl(pkt_cnt, hex_gpr[HEX_REG_QEMU_PKT_CNT],
+                        ctx->num_packets);
+        tcg_gen_addi_tl(insn_cnt, hex_gpr[HEX_REG_QEMU_INSN_CNT],
+                        ctx->num_insns);
+        tcg_gen_concat_i32_i64(dest, pkt_cnt, insn_cnt);
+        tcg_temp_free(pkt_cnt);
+        tcg_temp_free(insn_cnt);
+    } else {
+        tcg_gen_concat_i32_i64(dest,
+            hex_gpr[reg_num],
+            hex_gpr[reg_num + 1]);
+    }
+}
+
+static inline void gen_write_p3_0(TCGv control_reg)
+{
+    for (int i = 0; i < NUM_PREGS; i++) {
+        tcg_gen_extract_tl(hex_pred[i], control_reg, i * 8, 8);
+    }
+}
+
+/*
+ * Certain control registers require special handling on write
+ *     HEX_REG_P3_0          aliased to the predicate registers
+ *                           -> break the value across 4 predicate registers
+ *     HEX_REG_QEMU_*_CNT    changes in current TB in DisasContext
+ *                            -> clear the changes
+ */
+static inline void gen_write_ctrl_reg(DisasContext *ctx, int reg_num,
+                                      TCGv val)
+{
+    if (reg_num == HEX_REG_P3_0) {
+        gen_write_p3_0(val);
+    } else {
+        gen_log_reg_write(reg_num, val);
+        ctx_log_reg_write(ctx, reg_num);
+        if (reg_num == HEX_REG_QEMU_PKT_CNT) {
+            ctx->num_packets = 0;
+        }
+        if (reg_num == HEX_REG_QEMU_INSN_CNT) {
+            ctx->num_insns = 0;
+        }
+    }
+}
+
+static inline void gen_write_ctrl_reg_pair(DisasContext *ctx, int reg_num,
+                                           TCGv_i64 val)
+{
+    if (reg_num == HEX_REG_P3_0) {
+        TCGv val32 = tcg_temp_new();
+        tcg_gen_extrl_i64_i32(val32, val);
+        gen_write_p3_0(val32);
+        tcg_gen_extrh_i64_i32(val32, val);
+        gen_log_reg_write(reg_num + 1, val32);
+        tcg_temp_free(val32);
+        ctx_log_reg_write(ctx, reg_num + 1);
+    } else {
+        gen_log_reg_write_pair(reg_num, val);
+        ctx_log_reg_write_pair(ctx, reg_num);
+        if (reg_num == HEX_REG_QEMU_PKT_CNT) {
+            ctx->num_packets = 0;
+            ctx->num_insns = 0;
+        }
+    }
+}
+
+static inline void gen_load_locked4u(TCGv dest, TCGv vaddr, int mem_index)
+{
+    tcg_gen_qemu_ld32u(dest, vaddr, mem_index);
+    tcg_gen_mov_tl(hex_llsc_addr, vaddr);
+    tcg_gen_mov_tl(hex_llsc_val, dest);
+}
+
+static inline void gen_load_locked8u(TCGv_i64 dest, TCGv vaddr, int mem_index)
+{
+    tcg_gen_qemu_ld64(dest, vaddr, mem_index);
+    tcg_gen_mov_tl(hex_llsc_addr, vaddr);
+    tcg_gen_mov_i64(hex_llsc_val_i64, dest);
+}
+
+static inline void gen_store_conditional4(CPUHexagonState *env,
+                                          DisasContext *ctx, int prednum,
+                                          TCGv pred, TCGv vaddr, TCGv src)
+{
+    TCGLabel *fail = gen_new_label();
+    TCGLabel *done = gen_new_label();
+    TCGv one, zero, tmp;
+
+    tcg_gen_brcond_tl(TCG_COND_NE, vaddr, hex_llsc_addr, fail);
+
+    one = tcg_const_tl(0xff);
+    zero = tcg_const_tl(0);
+    tmp = tcg_temp_new();
+    tcg_gen_atomic_cmpxchg_tl(tmp, hex_llsc_addr, hex_llsc_val, src,
+                              ctx->mem_idx, MO_32);
+    tcg_gen_movcond_tl(TCG_COND_EQ, hex_pred[prednum], tmp, hex_llsc_val,
+                       one, zero);
+    tcg_temp_free(one);
+    tcg_temp_free(zero);
+    tcg_temp_free(tmp);
+    tcg_gen_br(done);
+
+    gen_set_label(fail);
+    tcg_gen_movi_tl(pred, 0);
+
+    gen_set_label(done);
+    tcg_gen_movi_tl(hex_llsc_addr, ~0);
+}
+
+static inline void gen_store_conditional8(CPUHexagonState *env,
+                                          DisasContext *ctx, int prednum,
+                                          TCGv pred, TCGv vaddr, TCGv_i64 src)
+{
+    TCGLabel *fail = gen_new_label();
+    TCGLabel *done = gen_new_label();
+    TCGv_i64 one, zero, tmp;
+
+    tcg_gen_brcond_tl(TCG_COND_NE, vaddr, hex_llsc_addr, fail);
+
+    one = tcg_const_i64(0xff);
+    zero = tcg_const_i64(0);
+    tmp = tcg_temp_new_i64();
+    tcg_gen_atomic_cmpxchg_i64(tmp, hex_llsc_addr, hex_llsc_val_i64, src,
+                               ctx->mem_idx, MO_64);
+    tcg_gen_movcond_i64(TCG_COND_EQ, tmp, tmp, hex_llsc_val_i64,
+                        one, zero);
+    tcg_gen_extrl_i64_i32(hex_pred[prednum], tmp);
+    tcg_temp_free_i64(one);
+    tcg_temp_free_i64(zero);
+    tcg_temp_free_i64(tmp);
+    tcg_gen_br(done);
+
+    gen_set_label(fail);
+    tcg_gen_movi_tl(pred, 0);
+
+    gen_set_label(done);
+    tcg_gen_movi_tl(hex_llsc_addr, ~0);
+}
+
+#include "tcg_funcs_generated.c.inc"
+#include "tcg_func_table_generated.c.inc"
-- 
2.25.1


