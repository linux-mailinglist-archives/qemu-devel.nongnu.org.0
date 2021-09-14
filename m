Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B91240AD0B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:07:51 +0200 (CEST)
Received: from localhost ([::1]:42880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7E6-0000NY-8M
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mQ7BB-0004yv-0S
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:04:49 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mQ7B7-0007YE-0g
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:04:48 -0400
Received: by mail-wr1-x435.google.com with SMTP id q26so19778831wrc.7
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 05:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i2l9xkw4cqDm04ZfkyZQN8LfDElFHQL8NpQeEcnTHpM=;
 b=qJx97JrOT0PFprAYhsJ/yZz9GiSPnzEqaUkFvPDBGtvo+5bZoJ929mb9y91/ls6ZYw
 031pYz+TLRD/paX+8XoaMRB2zXIgjKySlKom4MrcJfPM67Y0fVo4GJkbXcsygfkqVQpf
 zdXimGqOCmOgYWyv9SOtDJMsjXS/KRVsOT06C3k+2JDS359+kOWxeKWWcorNY/D4cJ2I
 Oepxb7zRD6NHwCk7jHk8RL6tZzsISezsZU31n/gqe5bkOmwuL3MG6GYVPM8PUN0RLuIG
 VfBXM+BDk9Ff91hPuLp2BBJU5sxYeDPBDzd2NbO3Zb+gfZ+nawTd1plsJXc7E/Q/WymP
 o8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i2l9xkw4cqDm04ZfkyZQN8LfDElFHQL8NpQeEcnTHpM=;
 b=xXAazzihcdsLLZsMgZo4FNnU0EbjyPmKtMdnb3SPNSttUO02lBVGGxQv35lNzxuIlK
 dNTaVoD2yarSxOziOas3w4E0DJoqsOBeYdc+v+A366mTLNnvtJQ9q9afzfgMmZFjsvJh
 UkNj3/dxxikh89YMud0P/wiORU8M28s5wCLjcjTtzZQpFlWgkKBC/tYwWlKDFvzm3t3u
 9WGHMVRQPpdXdMGB7ZzRaWFJ1OHh/6WEwX5iHGV8aOiIyfj4KiqQkVLuIf0NoO5IhNV/
 eDBQU62M/SVJ6XQex9Pu8SiEM1+AgaE/rroEwO2tUotg9UjvAo8Vt5kHwXoUfMdE1H3T
 m0GQ==
X-Gm-Message-State: AOAM531Fwyo/iGE5i7eSqUtNHjhQ8sV2Yl5EzhcGMPJS+LkxgqOi+lmx
 8dQ3OjGIWN0ZUjjQM3RTeA/Kzw==
X-Google-Smtp-Source: ABdhPJwv3p9GfG1FnQ8QmCPAPaC2lQ3Rsy/uoyX1Xtkw2eBoMetM+l0ZOfq7Y+43+jmtvJke8N0sAA==
X-Received: by 2002:a05:6000:363:: with SMTP id
 f3mr18448075wrf.142.1631621073880; 
 Tue, 14 Sep 2021 05:04:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g1sm1742277wmk.2.2021.09.14.05.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 05:04:32 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 951E71FF96;
 Tue, 14 Sep 2021 13:04:31 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2] accel/tcg: re-factor plugin_inject_cb so we can assert
 insn_idx is valid
Date: Tue, 14 Sep 2021 13:04:18 +0100
Message-Id: <20210914120418.1388698-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
---
 include/tcg/tcg.h      |   3 -
 accel/tcg/plugin-gen.c | 157 ++++++++++++++++++++++-------------------
 2 files changed, 85 insertions(+), 75 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 44ccd86f3e..49a02db7e6 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -604,9 +604,6 @@ struct TCGContext {
 
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


