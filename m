Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668F431ABDD
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 14:35:32 +0100 (CET)
Received: from localhost ([::1]:57592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAv59-0003sM-FW
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 08:35:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaY-00025V-UW
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:55 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaT-00068W-IE
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:54 -0500
Received: by mail-wm1-x32d.google.com with SMTP id m1so2512599wml.2
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 05:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=et68Ul0EK68HfckjM4rQ5ALpeTI2NFkiLkwfcenYZPU=;
 b=YqFH+HvL/pKIPfhNf6VuN5Y3pwIbblowslx6gE5Gluua7r0tcbXEkSS8h8wLMshI0v
 l4ga6Y72v6Ml9T9M83gE9UPdUnuld/9f+Xf5tyOqz82XPe08PnV+l2bhmZnymVmjyImI
 iSVeWDI/3qyBYIt3X4yQ5OuVxPwMrHJIQp20FlmHkdBHAnOVitSRz38ecPpWnSWe2Nyo
 TBqLJxovCHuwLfx05/v6M5eK5ituqQMboZ2743RtFy6A9BjlhIaDdJq6yUYbWuIJqQOK
 sH9jiA4LAZ8+fi1Nrs9S7xR4FwleU952EEFdDZef1iCHCjcPUzeeHuvu9NhfNY/fKuyZ
 TcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=et68Ul0EK68HfckjM4rQ5ALpeTI2NFkiLkwfcenYZPU=;
 b=tq1xSBthZkSehGt9M6NFCWJpdBImV2Yx8Fdu8iXfC5vjfpKzmr6z6AOAmUo1o4zPaD
 mWma7+ZWmZBNd26o8nKNUzQBTWaegH6hFm+JBns2EF7WRJpPNmgNrUjxmOQ2B35+LweO
 IiXVvuWzd14GLKCra5PF7rbTMfRbR1kBTreu+EthszT2IqkV4vf7e5IEYX2tIt+bhUM5
 F/cZmLzfM9eET0P9S3wlnUOf1Zsk5OWS2UbSFv0OTDBR2KKVafFn0LMjBegOHJQWHPdQ
 b1r4xBwQqj4ifMQi0nGL8uVyszCkscV0g2/fOeao7Zk3kU1kRdMeXSjHBIj4Bc/wjW6E
 t5EA==
X-Gm-Message-State: AOAM532cojykh5OZNlUHlE1eDK0JTyDBHY5sc+GdU7J7Ly1eIOe2z5CJ
 KUK4yZRHQ59LqNguxfNGifDLeQ==
X-Google-Smtp-Source: ABdhPJwHlNmj6GGEJTEjn4+lPFCUvg2wCWHyaJNMPspzCPlptoGQGd3pL5pfOZSEJ+Wrugdi6I08QQ==
X-Received: by 2002:a05:600c:3229:: with SMTP id
 r41mr2179155wmp.164.1613221426372; 
 Sat, 13 Feb 2021 05:03:46 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r1sm14426134wrl.95.2021.02.13.05.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 05:03:40 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 72FD71FFAA;
 Sat, 13 Feb 2021 13:03:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/23] accel/tcg: allow plugin instrumentation to be
 disable via cflags
Date: Sat, 13 Feb 2021 13:03:22 +0000
Message-Id: <20210213130325.14781-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210213130325.14781-1-alex.bennee@linaro.org>
References: <20210213130325.14781-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When icount is enabled and we recompile an MMIO access we end up
double counting the instruction execution. To avoid this we introduce
the CF_MEMI cflag which only allows memory instrumentation for the
next TB (which won't yet have been counted). As this is part of the
hashed compile flags we will only execute the generated TB while
coming out of a cpu_io_recompile.

While we are at it delete the old TODO. We might as well keep the
translation handy as it's likely you will repeatedly hit it on each
MMIO access.

Reported-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210210221053.18050-21-alex.bennee@linaro.org>

---
v3
  - s/CF_NOINSTR/CF_MEMI_ONY/
  - Limit instrumentation at API call sites instead of skipping altogether
  - clean-up commit log message
---
 include/exec/exec-all.h   |  6 +++---
 include/exec/plugin-gen.h |  4 ++--
 include/qemu/plugin.h     |  4 ++++
 accel/tcg/plugin-gen.c    |  3 ++-
 accel/tcg/translate-all.c | 18 +++++++++---------
 accel/tcg/translator.c    |  5 ++++-
 plugins/api.c             | 36 +++++++++++++++++++++++++-----------
 7 files changed, 49 insertions(+), 27 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index e08179de34..77a2dc044d 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -454,14 +454,14 @@ struct TranslationBlock {
     uint32_t cflags;    /* compile flags */
 #define CF_COUNT_MASK  0x00007fff
 #define CF_LAST_IO     0x00008000 /* Last insn may be an IO access.  */
+#define CF_MEMI_ONLY   0x00010000 /* Only instrument memory ops */
 #define CF_USE_ICOUNT  0x00020000
 #define CF_INVALID     0x00040000 /* TB is stale. Set with @jmp_lock held */
 #define CF_PARALLEL    0x00080000 /* Generate code for a parallel context */
 #define CF_CLUSTER_MASK 0xff000000 /* Top 8 bits are cluster ID */
 #define CF_CLUSTER_SHIFT 24
-/* cflags' mask for hashing/comparison */
-#define CF_HASH_MASK   \
-    (CF_COUNT_MASK | CF_LAST_IO | CF_USE_ICOUNT | CF_PARALLEL | CF_CLUSTER_MASK)
+/* cflags' mask for hashing/comparison, basically ignore CF_INVALID */
+#define CF_HASH_MASK   (~CF_INVALID)
 
     /* Per-vCPU dynamic tracing state used to generate this TB */
     uint32_t trace_vcpu_dstate;
diff --git a/include/exec/plugin-gen.h b/include/exec/plugin-gen.h
index 4834a9e2f4..b1b72b5d90 100644
--- a/include/exec/plugin-gen.h
+++ b/include/exec/plugin-gen.h
@@ -19,7 +19,7 @@ struct DisasContextBase;
 
 #ifdef CONFIG_PLUGIN
 
-bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb);
+bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool supress);
 void plugin_gen_tb_end(CPUState *cpu);
 void plugin_gen_insn_start(CPUState *cpu, const struct DisasContextBase *db);
 void plugin_gen_insn_end(void);
@@ -41,7 +41,7 @@ static inline void plugin_insn_append(const void *from, size_t size)
 #else /* !CONFIG_PLUGIN */
 
 static inline
-bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb)
+bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool supress)
 {
     return false;
 }
diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index 841deed79c..c5a79a89f0 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -92,6 +92,7 @@ struct qemu_plugin_dyn_cb {
     };
 };
 
+/* Internal context for instrumenting an instruction */
 struct qemu_plugin_insn {
     GByteArray *data;
     uint64_t vaddr;
@@ -99,6 +100,7 @@ struct qemu_plugin_insn {
     GArray *cbs[PLUGIN_N_CB_TYPES][PLUGIN_N_CB_SUBTYPES];
     bool calls_helpers;
     bool mem_helper;
+    bool mem_only;
 };
 
 /*
@@ -128,6 +130,7 @@ static inline struct qemu_plugin_insn *qemu_plugin_insn_alloc(void)
     return insn;
 }
 
+/* Internal context for this TranslationBlock */
 struct qemu_plugin_tb {
     GPtrArray *insns;
     size_t n;
@@ -135,6 +138,7 @@ struct qemu_plugin_tb {
     uint64_t vaddr2;
     void *haddr1;
     void *haddr2;
+    bool mem_only;
     GArray *cbs[PLUGIN_N_CB_SUBTYPES];
 };
 
diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 8a1bb801e0..c3dc3effe7 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -842,7 +842,7 @@ static void plugin_gen_inject(const struct qemu_plugin_tb *plugin_tb)
     pr_ops();
 }
 
-bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb)
+bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool mem_only)
 {
     struct qemu_plugin_tb *ptb = tcg_ctx->plugin_tb;
     bool ret = false;
@@ -855,6 +855,7 @@ bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb)
         ptb->vaddr2 = -1;
         get_page_addr_code_hostp(cpu->env_ptr, tb->pc, &ptb->haddr1);
         ptb->haddr2 = NULL;
+        ptb->mem_only = mem_only;
 
         plugin_gen_empty_callback(PLUGIN_GEN_FROM_TB);
     }
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 0666f9ef14..fdf88dc1c3 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2399,7 +2399,8 @@ void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr)
 }
 
 #ifndef CONFIG_USER_ONLY
-/* in deterministic execution mode, instructions doing device I/Os
+/*
+ * In deterministic execution mode, instructions doing device I/Os
  * must be at the end of the TB.
  *
  * Called by softmmu_template.h, with iothread mutex not held.
@@ -2430,19 +2431,18 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
         n = 2;
     }
 
-    /* Generate a new TB executing the I/O insn.  */
-    cpu->cflags_next_tb = curr_cflags() | CF_LAST_IO | n;
+    /*
+     * Exit the loop and potentially generate a new TB executing the
+     * just the I/O insns. We also limit instrumentation to memory
+     * operations only (which execute after completion) so we don't
+     * double instrument the instruction.
+     */
+    cpu->cflags_next_tb = curr_cflags() | CF_MEMI_ONLY | CF_LAST_IO | n;
 
     qemu_log_mask_and_addr(CPU_LOG_EXEC, tb->pc,
                            "cpu_io_recompile: rewound execution of TB to "
                            TARGET_FMT_lx "\n", tb->pc);
 
-    /* TODO: If env->pc != tb->pc (i.e. the faulting instruction was not
-     * the first in the TB) then we end up generating a whole new TB and
-     *  repeating the fault, which is horribly inefficient.
-     *  Better would be to execute just this insn uncached, or generate a
-     *  second new TB.
-     */
     cpu_loop_exit_noexc(cpu);
 }
 
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index a49a794065..2dfc27102f 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -58,7 +58,8 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
     ops->tb_start(db, cpu);
     tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
 
-    plugin_enabled = plugin_gen_tb_start(cpu, tb);
+    plugin_enabled = plugin_gen_tb_start(cpu, tb,
+                                         tb_cflags(db->tb) & CF_MEMI_ONLY);
 
     while (true) {
         db->num_insns++;
@@ -100,6 +101,8 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
             gen_io_start();
             ops->translate_insn(db, cpu);
         } else {
+            /* we should only see CF_MEMI_ONLY for io_recompile */
+            tcg_debug_assert(!(tb_cflags(db->tb) & CF_MEMI_ONLY));
             ops->translate_insn(db, cpu);
         }
 
diff --git a/plugins/api.c b/plugins/api.c
index 5dc8e6f934..0b04380d57 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -84,15 +84,19 @@ void qemu_plugin_register_vcpu_tb_exec_cb(struct qemu_plugin_tb *tb,
                                           enum qemu_plugin_cb_flags flags,
                                           void *udata)
 {
-    plugin_register_dyn_cb__udata(&tb->cbs[PLUGIN_CB_REGULAR],
-                                  cb, flags, udata);
+    if (!tb->mem_only) {
+        plugin_register_dyn_cb__udata(&tb->cbs[PLUGIN_CB_REGULAR],
+                                      cb, flags, udata);
+    }
 }
 
 void qemu_plugin_register_vcpu_tb_exec_inline(struct qemu_plugin_tb *tb,
                                               enum qemu_plugin_op op,
                                               void *ptr, uint64_t imm)
 {
-    plugin_register_inline_op(&tb->cbs[PLUGIN_CB_INLINE], 0, op, ptr, imm);
+    if (!tb->mem_only) {
+        plugin_register_inline_op(&tb->cbs[PLUGIN_CB_INLINE], 0, op, ptr, imm);
+    }
 }
 
 void qemu_plugin_register_vcpu_insn_exec_cb(struct qemu_plugin_insn *insn,
@@ -100,20 +104,27 @@ void qemu_plugin_register_vcpu_insn_exec_cb(struct qemu_plugin_insn *insn,
                                             enum qemu_plugin_cb_flags flags,
                                             void *udata)
 {
-    plugin_register_dyn_cb__udata(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_REGULAR],
-        cb, flags, udata);
+    if (!insn->mem_only) {
+        plugin_register_dyn_cb__udata(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_REGULAR],
+                                      cb, flags, udata);
+    }
 }
 
 void qemu_plugin_register_vcpu_insn_exec_inline(struct qemu_plugin_insn *insn,
                                                 enum qemu_plugin_op op,
                                                 void *ptr, uint64_t imm)
 {
-    plugin_register_inline_op(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_INLINE],
-                              0, op, ptr, imm);
+    if (!insn->mem_only) {
+        plugin_register_inline_op(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_INLINE],
+                                  0, op, ptr, imm);
+    }
 }
 
 
-
+/*
+ * We always plant memory instrumentation because they don't finalise until
+ * after the operation has complete.
+ */
 void qemu_plugin_register_vcpu_mem_cb(struct qemu_plugin_insn *insn,
                                       qemu_plugin_vcpu_mem_cb_t cb,
                                       enum qemu_plugin_cb_flags flags,
@@ -121,7 +132,7 @@ void qemu_plugin_register_vcpu_mem_cb(struct qemu_plugin_insn *insn,
                                       void *udata)
 {
     plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_REGULAR],
-                                cb, flags, rw, udata);
+                                    cb, flags, rw, udata);
 }
 
 void qemu_plugin_register_vcpu_mem_inline(struct qemu_plugin_insn *insn,
@@ -130,7 +141,7 @@ void qemu_plugin_register_vcpu_mem_inline(struct qemu_plugin_insn *insn,
                                           uint64_t imm)
 {
     plugin_register_inline_op(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_INLINE],
-        rw, op, ptr, imm);
+                              rw, op, ptr, imm);
 }
 
 void qemu_plugin_register_vcpu_tb_trans_cb(qemu_plugin_id_t id,
@@ -181,10 +192,13 @@ uint64_t qemu_plugin_tb_vaddr(const struct qemu_plugin_tb *tb)
 struct qemu_plugin_insn *
 qemu_plugin_tb_get_insn(const struct qemu_plugin_tb *tb, size_t idx)
 {
+    struct qemu_plugin_insn *insn;
     if (unlikely(idx >= tb->n)) {
         return NULL;
     }
-    return g_ptr_array_index(tb->insns, idx);
+    insn = g_ptr_array_index(tb->insns, idx);
+    insn->mem_only = tb->mem_only;
+    return insn;
 }
 
 /*
-- 
2.20.1


