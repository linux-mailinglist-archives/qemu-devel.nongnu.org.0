Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E848A226D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 19:37:26 +0200 (CEST)
Received: from localhost ([::1]:52894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3OMP-0006Vi-BX
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 13:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60330)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vandersonmr2@gmail.com>) id 1i3OKB-0004iz-Sp
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 13:35:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vandersonmr2@gmail.com>) id 1i3OKA-00008Z-CY
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 13:35:07 -0400
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:46034)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <vandersonmr2@gmail.com>)
 id 1i3OKA-00008K-65
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 13:35:06 -0400
Received: by mail-qk1-x742.google.com with SMTP id m2so3649364qki.12
 for <qemu-devel@nongnu.org>; Thu, 29 Aug 2019 10:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fBs5joRr2GmQQ30d+sA4UaECTV9lNrfGzlG2K0u8w34=;
 b=vCFv7/s7H99nYkeVC/+AH6fO9hqjDddTG8BfavAW3y24sbHJHpN5iR6bjIy95+D4xl
 bm9s+VKenDAtYeZQ/NvnqgOhi3+/oxR2SQTDnMEo4zZAyo0svP1y17CBig5h95dU2Hb5
 LCeNq8bE/UQFjpdRhPW41DJi2jc+6wZCQFVccrxWFB0bJEgIBlESn+NhvCM0d1ni4d8a
 ETEeqoPqz4NVrnBmya3r1mTZ491cDrTUF47RLFLUcNLXiX9mn38PXQ9IdT75Xc2mMJwr
 5RxUOpl8roExFniJwwxLaX/yxUoUN8O9ewfG/2/Sj7QOeIZ0aeSB9iZZKhbnfM6QXFcB
 Kcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fBs5joRr2GmQQ30d+sA4UaECTV9lNrfGzlG2K0u8w34=;
 b=e++o7Qm7DH3zXiJcOUXH2ACw0lIqbHCts/hawZd3TJYbDptdjF9oDaEn4GccJXsJ6C
 a0VfAF+QVZbOpdS0BywrmzvVm5Lfm86ndAsaBZQx2Z7C+ZN3lBKf0AU2KyjZWbmeCVBE
 rkm1Puumb2PYwt9dqaezTDICYMwUZaSZqVC6qtSYo+TdOA9TUWtjzOy0QJZFcjt4VN25
 7J/eRcPfLqOrN9xLLRWGe/2PX0Pkwtc4tTtf0CROfO70ANIfDyHig78OYWqUEwMZh7Kd
 P3jmvLV5kgfFZFXnv8V5ud00XvWbzQVn3ffZWW2JKGdeOVq+1bPOVtkmfDF1Ibml07e5
 hwoQ==
X-Gm-Message-State: APjAAAXSG2tn15hq3r0lKgqfgLWPTiCfsc6TgNQsqvEW7TfbxbitNkpw
 ZcP5lBkJWff1FHQ/y0TpoGOc8A7Ac5BmrQ==
X-Google-Smtp-Source: APXvYqyfT6Gg60stLQNmUnlylLj5oXdFsM6yqKCz122vCXRBgCkN17WS9btTN0RV/0Bm3OEO6GEgKQ==
X-Received: by 2002:a37:c14:: with SMTP id 20mr10495069qkm.291.1567100105387; 
 Thu, 29 Aug 2019 10:35:05 -0700 (PDT)
Received: from vanderson-lmcad.gw.lmcad.ic.unicamp.br (gw.lmcad.ic.unicamp.br.
 [143.106.73.166])
 by smtp.googlemail.com with ESMTPSA id j50sm1721700qtj.30.2019.08.29.10.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 10:35:05 -0700 (PDT)
From: vandersonmr <vandersonmr2@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Aug 2019 14:34:29 -0300
Message-Id: <20190829173437.5926-4-vandersonmr2@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829173437.5926-1-vandersonmr2@gmail.com>
References: <20190829173437.5926-1-vandersonmr2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::742
Subject: [Qemu-devel] [PATCH v8 03/11] accel: collecting JIT statistics
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, vandersonmr <vandersonmr2@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If a TB has a TBS (TBStatistics) with the TB_JIT_STATS
enabled then we collect statistics of its translation
processes and code translation.

Collecting the number of host instructions seems to be
not simple as it would imply in having to modify several
target source files. So, for now, we are only collecting
the size of the host gen code.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Vanderson M. do Rosario <vandersonmr2@gmail.com>
---
 accel/tcg/translate-all.c | 15 ++++++++++++++-
 accel/tcg/translator.c    |  4 ++++
 include/exec/tb-stats.h   | 15 +++++++++++++++
 tcg/tcg.c                 | 23 +++++++++++++++++++++++
 tcg/tcg.h                 |  2 ++
 5 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index e72aeba682..fb2fe0fa1f 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1705,6 +1705,7 @@ static TBStatistics *tb_get_stats(tb_page_addr_t phys_pc, target_ulong pc,
          * then just make the new TB point to the older TBStatistic
          */
         g_free(new_stats);
+        ((TBStatistics *) existing_stats)->tb = current_tb;
         return existing_stats;
     } else {
         return new_stats;
@@ -1785,13 +1786,18 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
      */
     if (tb_stats_collection_enabled()) {
         tb->tb_stats = tb_get_stats(phys_pc, pc, cs_base, flags, tb);
+        uint32_t flag = get_default_tbstats_flag();
 
         if (qemu_log_in_addr_range(tb->pc)) {
-            uint32_t flag = get_default_tbstats_flag();
             if (flag & TB_EXEC_STATS) {
                 tb->tb_stats->stats_enabled |= TB_EXEC_STATS;
             }
         }
+
+        if (flag & TB_JIT_STATS) {
+            tb->tb_stats->stats_enabled |= TB_JIT_STATS;
+            atomic_inc(&tb->tb_stats->translations.total);
+        }
     } else {
         tb->tb_stats = NULL;
     }
@@ -1869,6 +1875,10 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     atomic_set(&prof->search_out_len, prof->search_out_len + search_size);
 #endif
 
+    if (tb_stats_enabled(tb, TB_JIT_STATS)) {
+        atomic_add(&tb->tb_stats->code.out_len, gen_code_size);
+    }
+
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_OUT_ASM) &&
         qemu_log_in_addr_range(tb->pc)) {
@@ -1926,6 +1936,9 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     phys_page2 = -1;
     if ((pc & TARGET_PAGE_MASK) != virt_page2) {
         phys_page2 = get_page_addr_code(env, virt_page2);
+        if (tb_stats_enabled(tb, TB_JIT_STATS)) {
+            atomic_inc(&tb->tb_stats->translations.spanning);
+        }
     }
     /*
      * No explicit memory barrier is required -- tb_link_page() makes the
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index ec6bd829a0..9b2e248b09 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -116,6 +116,10 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
     db->tb->size = db->pc_next - db->pc_first;
     db->tb->icount = db->num_insns;
 
+    if (tb_stats_enabled(tb, TB_JIT_STATS)) {
+        atomic_add(&db->tb->tb_stats->code.num_guest_inst, db->num_insns);
+    }
+
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
         && qemu_log_in_addr_range(db->pc_first)) {
diff --git a/include/exec/tb-stats.h b/include/exec/tb-stats.h
index c4a8715400..b68edd5d24 100644
--- a/include/exec/tb-stats.h
+++ b/include/exec/tb-stats.h
@@ -58,6 +58,20 @@ struct TBStatistics {
         unsigned long atomic;
     } executions;
 
+    struct {
+        unsigned num_guest_inst;
+        unsigned num_tcg_ops;
+        unsigned num_tcg_ops_opt;
+        unsigned spills;
+        unsigned out_len;
+    } code;
+
+    struct {
+        unsigned long total;
+        unsigned long uncached;
+        unsigned long spanning;
+    } translations;
+
     /* current TB linked to this TBStatistics */
     TranslationBlock *tb;
 };
@@ -71,6 +85,7 @@ enum TBStatsStatus { TB_STATS_RUNNING, TB_STATS_PAUSED, TB_STATS_STOPPED };
 
 #define TB_NOTHING    (1 << 0)
 #define TB_EXEC_STATS (1 << 1)
+#define TB_JIT_STATS  (1 << 2)
 
 extern int tcg_collect_tb_stats;
 extern uint32_t default_tbstats_flag;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 0458eaec57..ae3e7a2217 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3125,6 +3125,11 @@ static void temp_sync(TCGContext *s, TCGTemp *ts, TCGRegSet allocated_regs,
         case TEMP_VAL_REG:
             tcg_out_st(s, ts->type, ts->reg,
                        ts->mem_base->reg, ts->mem_offset);
+
+            /* Count number of spills */
+            if (tb_stats_enabled(s->current_tb, TB_JIT_STATS)) {
+                atomic_inc(&s->current_tb->tb_stats->code.spills);
+            }
             break;
 
         case TEMP_VAL_MEM:
@@ -3996,6 +4001,8 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
     int i, num_insns;
     TCGOp *op;
 
+    s->current_tb = tb;
+
 #ifdef CONFIG_PROFILER
     {
         int n = 0;
@@ -4027,6 +4034,14 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
     }
 #endif
 
+    if (tb_stats_enabled(tb, TB_JIT_STATS)) {
+        int n = 0;
+        QTAILQ_FOREACH(op, &s->ops, link) {
+            n++;
+        }
+        atomic_add(&tb->tb_stats->code.num_tcg_ops, n);
+    }
+
 #ifdef CONFIG_DEBUG_TCG
     /* Ensure all labels referenced have been emitted.  */
     {
@@ -4093,6 +4108,14 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
     }
 #endif
 
+    if (tb_stats_enabled(tb, TB_JIT_STATS)) {
+        int n = 0;
+        QTAILQ_FOREACH(op, &s->ops, link) {
+            n++;
+        }
+        atomic_add(&tb->tb_stats->code.num_tcg_ops_opt, n);
+    }
+
     tcg_reg_alloc_start(s);
 
     s->code_buf = tb->tc.ptr;
diff --git a/tcg/tcg.h b/tcg/tcg.h
index 529acb2ed8..b4601162f8 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -740,6 +740,8 @@ struct TCGContext {
 
     uint16_t gen_insn_end_off[TCG_MAX_INSNS];
     target_ulong gen_insn_data[TCG_MAX_INSNS][TARGET_INSN_START_WORDS];
+
+    TranslationBlock *current_tb;
 };
 
 extern TCGContext tcg_init_ctx;
-- 
2.22.0


