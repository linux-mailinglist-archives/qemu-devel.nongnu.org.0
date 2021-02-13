Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8094031ABB2
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 14:25:59 +0100 (CET)
Received: from localhost ([::1]:60118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAuvu-0001NV-Hk
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 08:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaJ-0001sf-9Z
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:44 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaF-00066G-QX
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:39 -0500
Received: by mail-wr1-x434.google.com with SMTP id g6so2858513wrs.11
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 05:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ocJwc5FXEbPnuQ6STa64ELxcT3vCM5OTMmw6Q3u6PRw=;
 b=Y2t/yGSGlZGi99rEX/klM4nFgOt9wckJwIyCzR7+nh0sAqGR5/OylVb8Ym4EVK7+CH
 ePcubTf/fnUojuJrD/yIeAPAOw/w78v8iCSDyo8euCgSBgVA0BPHxEj8q792iajrjmS+
 gGW/ajEIm7khPgI3FStPcNoLYIerjMfxIgHb69GQdWvIf215BigvwbFn63jKvgJS8HYh
 lU4ZjT6nYYA6b1MEB8oL9n7V7KE/rLUZveH3K7+1Wk1XpEYJtDkwnGmClIYj5QbWFGvM
 EV664/XLH0cRzWg/1ZtuLgHbAGE7M9iKKgK8shpHKimA/HWyZh8BQCYJWa2DuBJywJC4
 LbmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ocJwc5FXEbPnuQ6STa64ELxcT3vCM5OTMmw6Q3u6PRw=;
 b=ggJSjSA9Fh16170XH2LHG+u0Nw3YAiD6bbzZbuDHXiNcI318FI/Bp5PphACWS9Q6ap
 FBCJ4KJWP5O/EyQQ9tkWTePVbORZ9ww3Q/tzlu7fD2ThHhERQddkpVB2HF3R6qQzIFqF
 UmoQu+oXcmakFE90fiA9iDvOAxbaUGfqtdvB/aZN2x1sE1LQmJ+l1l6nE4V0gYQyUHxB
 ugWMCfd1mc7AmSCvUA9LQA1ns98eK3pPGisvavdTi0FA9C4GegwvJQqWNPkcamwcOF1J
 ZY02W/GI9yWQBKRlSDgdc6hRtsqholAdhX/X5rwBe97A3PFKo+TRmYTnPcSl6ORQsf0D
 eC7w==
X-Gm-Message-State: AOAM532iYHU2SYFjMv+CrTpFFPAkzsDlc9PSWo1tq4JmvlMtfxwupMNe
 GsasA1wf/Z0Sa1+o2+peSa1O3A==
X-Google-Smtp-Source: ABdhPJzKQMEp1IkLs9FtliN52Nn7TSKjQPaf3ShKyUOWXbFuhabrixNL6meRhlUKODwskJrrrLLkqw==
X-Received: by 2002:a5d:4c4f:: with SMTP id n15mr8980322wrt.124.1613221414327; 
 Sat, 13 Feb 2021 05:03:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o25sm34753593wmh.1.2021.02.13.05.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 05:03:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 54AD01FF98;
 Sat, 13 Feb 2021 13:03:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/23] accel/tcg/plugin-gen: fix the call signature for
 inline callbacks
Date: Sat, 13 Feb 2021 13:03:11 +0000
Message-Id: <20210213130325.14781-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210213130325.14781-1-alex.bennee@linaro.org>
References: <20210213130325.14781-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

A recent change to the handling of constants in TCG changed the
pattern of ops emitted for a constant add. We no longer emit a mov and
the constant can be applied directly to the TCG_op_add arguments. This
was causing SEGVs when running the insn plugin with arg=inline. Fix
this by updating copy_add_i64 to do the right thing while also adding
a comment at the top of the append section as an aide memoir if
something like this happens again.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Emilio G. Cota <cota@braap.org>
Message-Id: <20210210172751.11669-1-alex.bennee@linaro.org>
Message-Id: <20210210221053.18050-10-alex.bennee@linaro.org>
---
 accel/tcg/plugin-gen.c | 32 +++++++++++---------------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index e5dc9d0ca9..8a1bb801e0 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -320,22 +320,6 @@ static TCGOp *copy_const_ptr(TCGOp **begin_op, TCGOp *op, void *ptr)
     return op;
 }
 
-static TCGOp *copy_const_i64(TCGOp **begin_op, TCGOp *op, uint64_t v)
-{
-    if (TCG_TARGET_REG_BITS == 32) {
-        /* 2x mov_i32 */
-        op = copy_op(begin_op, op, INDEX_op_mov_i32);
-        op->args[1] = tcgv_i32_arg(tcg_constant_i32(v));
-        op = copy_op(begin_op, op, INDEX_op_mov_i32);
-        op->args[1] = tcgv_i32_arg(tcg_constant_i32(v >> 32));
-    } else {
-        /* mov_i64 */
-        op = copy_op(begin_op, op, INDEX_op_mov_i64);
-        op->args[1] = tcgv_i64_arg(tcg_constant_i64(v));
-    }
-    return op;
-}
-
 static TCGOp *copy_extu_tl_i64(TCGOp **begin_op, TCGOp *op)
 {
     if (TARGET_LONG_BITS == 32) {
@@ -374,14 +358,17 @@ static TCGOp *copy_st_i64(TCGOp **begin_op, TCGOp *op)
     return op;
 }
 
-static TCGOp *copy_add_i64(TCGOp **begin_op, TCGOp *op)
+static TCGOp *copy_add_i64(TCGOp **begin_op, TCGOp *op, uint64_t v)
 {
     if (TCG_TARGET_REG_BITS == 32) {
         /* all 32-bit backends must implement add2_i32 */
         g_assert(TCG_TARGET_HAS_add2_i32);
         op = copy_op(begin_op, op, INDEX_op_add2_i32);
+        op->args[4] = tcgv_i32_arg(tcg_constant_i32(v));
+        op->args[5] = tcgv_i32_arg(tcg_constant_i32(v >> 32));
     } else {
         op = copy_op(begin_op, op, INDEX_op_add_i64);
+        op->args[2] = tcgv_i64_arg(tcg_constant_i64(v));
     }
     return op;
 }
@@ -431,6 +418,12 @@ static TCGOp *copy_call(TCGOp **begin_op, TCGOp *op, void *empty_func,
     return op;
 }
 
+/*
+ * When we append/replace ops here we are sensitive to changing patterns of
+ * TCGOps generated by the tcg_gen_FOO calls when we generated the
+ * empty callbacks. This will assert very quickly in a debug build as
+ * we assert the ops we are replacing are the correct ones.
+ */
 static TCGOp *append_udata_cb(const struct qemu_plugin_dyn_cb *cb,
                               TCGOp *begin_op, TCGOp *op, int *cb_idx)
 {
@@ -462,11 +455,8 @@ static TCGOp *append_inline_cb(const struct qemu_plugin_dyn_cb *cb,
     /* ld_i64 */
     op = copy_ld_i64(&begin_op, op);
 
-    /* const_i64 */
-    op = copy_const_i64(&begin_op, op, cb->inline_insn.imm);
-
     /* add_i64 */
-    op = copy_add_i64(&begin_op, op);
+    op = copy_add_i64(&begin_op, op, cb->inline_insn.imm);
 
     /* st_i64 */
     op = copy_st_i64(&begin_op, op);
-- 
2.20.1


