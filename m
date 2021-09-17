Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B764440FDFF
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 18:37:57 +0200 (CEST)
Received: from localhost ([::1]:60464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRGs8-0002g6-S9
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 12:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRGeY-0003aO-61
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:23:54 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRGeW-0005dE-C1
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:23:53 -0400
Received: by mail-wr1-x431.google.com with SMTP id g16so16074068wrb.3
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 09:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GCZPVLj0653u4cTSSRRcYrTh9dJINc809P2AzsfKj0E=;
 b=lLMV/QlCkIR610MvZSHRJ50xu6QlYWL9widoi/3/+oO9WPFNnnwtG6PHldVffkJ5FR
 GGbnkOXBLlC9VUnbFXdosWeWbAdmeVd5jo97Op5YBec3x5AJ4toa/W3APUcq/kbUGS//
 zTinekuR5as0gmpIazRdKs/V7I+mYCA+3RNMtb6UyJAZOxRenmCkcjo68PJXlIscYixc
 n86AC1DaguBAZrPz/yrT3Uux7Cxa6Lo83ZKNN5CkRqVGmEi/uiAgqHRVFSoRclf+IvkJ
 SAX5XFtEXrhL7NtvxlJb4Mw/zVZgmiqOiketCZCVhd1NDI+6O3p1PpqCXdQ/TTbjdTLh
 /0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GCZPVLj0653u4cTSSRRcYrTh9dJINc809P2AzsfKj0E=;
 b=ulA0AS5BxIa9n6nUbHlo7weqvQRsH6aEyQegA77Ll3fsqpWraAEE33IAtugsV8kYDG
 UF1KrFXfMPidy6u4r7g0PNaG3mBc+GDiRvlHT/z+O3FxVAU9Sj9V+Ga72rUnmMd0cLpY
 2kxcvkxfrz5ehh7w2QG9SKaATzvVdYRI13CmXP3ZotXENFgjcrEIm5SOGQyiltUpiBhO
 nRJqDvbjxnsp0jYq6JW1oE0kC12SOlJLzTntUkJ2BLqXLd1k2XylcPD2He9NpxX5alFY
 meG3EKA6HWTpfAiNs7Zi5D/AfwQ8ONojc/1j8nX2kXy9m+JAzM5sr0q4EoApP7q0WjeP
 qhVQ==
X-Gm-Message-State: AOAM531ArHFOBXeIL/c+QwJthrrJxTFSHbefP5oxsQrxYr8TkwYMfJjG
 HXqP938lqSPoGtOKYL9Pq78Pdw==
X-Google-Smtp-Source: ABdhPJwnWiLkzNmfyRsdYgXlflwOXv8tITuq3QrP8V5oeYAdcKK9/Rr37LN6hr7EB+v9Jli3KundKA==
X-Received: by 2002:a5d:59a4:: with SMTP id p4mr12917545wrr.332.1631895830714; 
 Fri, 17 Sep 2021 09:23:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r129sm7138432wmr.7.2021.09.17.09.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 09:23:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2115F1FFA9;
 Fri, 17 Sep 2021 17:23:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 11/11] accel/tcg: re-factor plugin_inject_cb so we can
 assert insn_idx is valid
Date: Fri, 17 Sep 2021 17:23:32 +0100
Message-Id: <20210917162332.3511179-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210917162332.3511179-1-alex.bennee@linaro.org>
References: <20210917162332.3511179-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity doesn't know enough about how we have arranged our plugin TCG
ops to know we will always have incremented insn_idx before injecting
the callback. Let us assert it for the benefit of Coverity and protect
ourselves from accidentally breaking the assumption and triggering
harder to grok errors deeper in the code if we attempt a negative
indexed array lookup.

However to get to this point we re-factor the code and remove the
second hand instruction boundary detection in favour of scanning the
full set of ops and using the existing INDEX_op_insn_start to cleanly
detect when the instruction has started. As we no longer need the
plugin specific list of ops we delete that.

My initial benchmarks shows no discernible impact of dropping the
plugin specific ops list.

Fixes: Coverity 1459509
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>

---
v2/v3
  - re-factor and drop the plugin_op/link approach
---
 include/tcg/tcg.h      |   6 --
 accel/tcg/plugin-gen.c | 157 ++++++++++++++++++++++-------------------
 2 files changed, 85 insertions(+), 78 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 44ccd86f3e..a7f6475348 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -492,9 +492,6 @@ typedef struct TCGOp {
 
     /* Next and previous opcodes.  */
     QTAILQ_ENTRY(TCGOp) link;
-#ifdef CONFIG_PLUGIN
-    QSIMPLEQ_ENTRY(TCGOp) plugin_link;
-#endif
 
     /* Arguments for the opcode.  */
     TCGArg args[MAX_OPC_PARAM];
@@ -604,9 +601,6 @@ struct TCGContext {
 
     /* descriptor of the instruction being translated */
     struct qemu_plugin_insn *plugin_insn;
-
-    /* list to quickly access the injected ops */
-    QSIMPLEQ_HEAD(, TCGOp) plugin_ops;
 #endif
 
     GHashTable *const_table[TCG_TYPE_COUNT];
diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 88e25c6df9..f145b815c0 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -163,11 +163,7 @@ static void gen_empty_mem_helper(void)
 static void gen_plugin_cb_start(enum plugin_gen_from from,
                                 enum plugin_gen_cb type, unsigned wr)
 {
-    TCGOp *op;
-
     tcg_gen_plugin_cb_start(from, type, wr);
-    op = tcg_last_op();
-    QSIMPLEQ_INSERT_TAIL(&tcg_ctx->plugin_ops, op, plugin_link);
 }
 
 static void gen_wrapped(enum plugin_gen_from from,
@@ -707,62 +703,6 @@ static void plugin_gen_disable_mem_helper(const struct qemu_plugin_tb *ptb,
     inject_mem_disable_helper(insn, begin_op);
 }
 
-static void plugin_inject_cb(const struct qemu_plugin_tb *ptb, TCGOp *begin_op,
-                             int insn_idx)
-{
-    enum plugin_gen_from from = begin_op->args[0];
-    enum plugin_gen_cb type = begin_op->args[1];
-
-    switch (from) {
-    case PLUGIN_GEN_FROM_TB:
-        switch (type) {
-        case PLUGIN_GEN_CB_UDATA:
-            plugin_gen_tb_udata(ptb, begin_op);
-            return;
-        case PLUGIN_GEN_CB_INLINE:
-            plugin_gen_tb_inline(ptb, begin_op);
-            return;
-        default:
-            g_assert_not_reached();
-        }
-    case PLUGIN_GEN_FROM_INSN:
-        switch (type) {
-        case PLUGIN_GEN_CB_UDATA:
-            plugin_gen_insn_udata(ptb, begin_op, insn_idx);
-            return;
-        case PLUGIN_GEN_CB_INLINE:
-            plugin_gen_insn_inline(ptb, begin_op, insn_idx);
-            return;
-        case PLUGIN_GEN_ENABLE_MEM_HELPER:
-            plugin_gen_enable_mem_helper(ptb, begin_op, insn_idx);
-            return;
-        default:
-            g_assert_not_reached();
-        }
-    case PLUGIN_GEN_FROM_MEM:
-        switch (type) {
-        case PLUGIN_GEN_CB_MEM:
-            plugin_gen_mem_regular(ptb, begin_op, insn_idx);
-            return;
-        case PLUGIN_GEN_CB_INLINE:
-            plugin_gen_mem_inline(ptb, begin_op, insn_idx);
-            return;
-        default:
-            g_assert_not_reached();
-        }
-    case PLUGIN_GEN_AFTER_INSN:
-        switch (type) {
-        case PLUGIN_GEN_DISABLE_MEM_HELPER:
-            plugin_gen_disable_mem_helper(ptb, begin_op, insn_idx);
-            return;
-        default:
-            g_assert_not_reached();
-        }
-    default:
-        g_assert_not_reached();
-    }
-}
-
 /* #define DEBUG_PLUGIN_GEN_OPS */
 static void pr_ops(void)
 {
@@ -820,21 +760,95 @@ static void pr_ops(void)
 static void plugin_gen_inject(const struct qemu_plugin_tb *plugin_tb)
 {
     TCGOp *op;
-    int insn_idx;
+    int insn_idx = -1;
 
     pr_ops();
-    insn_idx = -1;
-    QSIMPLEQ_FOREACH(op, &tcg_ctx->plugin_ops, plugin_link) {
-        enum plugin_gen_from from = op->args[0];
-        enum plugin_gen_cb type = op->args[1];
-
-        tcg_debug_assert(op->opc == INDEX_op_plugin_cb_start);
-        /* ENABLE_MEM_HELPER is the first callback of an instruction */
-        if (from == PLUGIN_GEN_FROM_INSN &&
-            type == PLUGIN_GEN_ENABLE_MEM_HELPER) {
+
+    QTAILQ_FOREACH(op, &tcg_ctx->ops, link) {
+        switch (op->opc) {
+        case INDEX_op_insn_start:
             insn_idx++;
+            break;
+        case INDEX_op_plugin_cb_start:
+        {
+            enum plugin_gen_from from = op->args[0];
+            enum plugin_gen_cb type = op->args[1];
+
+            switch (from) {
+            case PLUGIN_GEN_FROM_TB:
+            {
+                g_assert(insn_idx == -1);
+
+                switch (type) {
+                case PLUGIN_GEN_CB_UDATA:
+                    plugin_gen_tb_udata(plugin_tb, op);
+                    break;
+                case PLUGIN_GEN_CB_INLINE:
+                    plugin_gen_tb_inline(plugin_tb, op);
+                    break;
+                default:
+                    g_assert_not_reached();
+                }
+                break;
+            }
+            case PLUGIN_GEN_FROM_INSN:
+            {
+                g_assert(insn_idx >= 0);
+
+                switch (type) {
+                case PLUGIN_GEN_CB_UDATA:
+                    plugin_gen_insn_udata(plugin_tb, op, insn_idx);
+                    break;
+                case PLUGIN_GEN_CB_INLINE:
+                    plugin_gen_insn_inline(plugin_tb, op, insn_idx);
+                    break;
+                case PLUGIN_GEN_ENABLE_MEM_HELPER:
+                    plugin_gen_enable_mem_helper(plugin_tb, op, insn_idx);
+                    break;
+                default:
+                    g_assert_not_reached();
+                }
+                break;
+            }
+            case PLUGIN_GEN_FROM_MEM:
+            {
+                g_assert(insn_idx >= 0);
+
+                switch (type) {
+                case PLUGIN_GEN_CB_MEM:
+                    plugin_gen_mem_regular(plugin_tb, op, insn_idx);
+                    break;
+                case PLUGIN_GEN_CB_INLINE:
+                    plugin_gen_mem_inline(plugin_tb, op, insn_idx);
+                    break;
+                default:
+                    g_assert_not_reached();
+                }
+
+                break;
+            }
+            case PLUGIN_GEN_AFTER_INSN:
+            {
+                g_assert(insn_idx >= 0);
+
+                switch (type) {
+                case PLUGIN_GEN_DISABLE_MEM_HELPER:
+                    plugin_gen_disable_mem_helper(plugin_tb, op, insn_idx);
+                    break;
+                default:
+                    g_assert_not_reached();
+                }
+                break;
+            }
+            default:
+                g_assert_not_reached();
+            }
+            break;
+        }
+        default:
+            /* plugins don't care about any other ops */
+            break;
         }
-        plugin_inject_cb(plugin_tb, op, insn_idx);
     }
     pr_ops();
 }
@@ -847,7 +861,6 @@ bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool mem_onl
     if (test_bit(QEMU_PLUGIN_EV_VCPU_TB_TRANS, cpu->plugin_mask)) {
         ret = true;
 
-        QSIMPLEQ_INIT(&tcg_ctx->plugin_ops);
         ptb->vaddr = tb->pc;
         ptb->vaddr2 = -1;
         get_page_addr_code_hostp(cpu->env_ptr, tb->pc, &ptb->haddr1);
-- 
2.30.2


