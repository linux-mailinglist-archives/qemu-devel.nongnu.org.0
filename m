Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6AA31E861
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 11:07:47 +0100 (CET)
Received: from localhost ([::1]:56652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCgDq-00052F-Fm
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 05:07:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfzP-0004TT-OG
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:52:53 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:32819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfzN-0000yh-MY
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:52:51 -0500
Received: by mail-wr1-x42f.google.com with SMTP id 7so2242379wrz.0
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 01:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F+StAOu3qxmsqdNHe7+WWm/s4oEdZe+M8dtFdhw4Ux0=;
 b=EGLehANvZVsBQm4hPQacFnA76oHvnmNtigYjR/HNt4UQnkJ4z1KCrpaRk8zYGm0XEN
 RP+1ISPuUgfOktAfJLRFNn/At1CXSKGdghQkR5djZnyiNR6nWGx4ChrAqAC3lvvgQ2+J
 aaRF7u3bGZj8AN+pso7kgfwENlNNyctawK2sX+O23JXihz8WW64XS6PAiivT51AjWtOj
 WghQF5DAxNvUs50jCDQiF6xhiiC1OLaGOLBmmfCiP74Yu7i+Bx1bQDUClcgMFPwtTJs8
 mGqdOOw1hm6cY8ac0WyWpXYybm/0OCyuk7sLRdsuuPDBrEnDsRnoHvAxvHzRr6tiWpZm
 OmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F+StAOu3qxmsqdNHe7+WWm/s4oEdZe+M8dtFdhw4Ux0=;
 b=IGjTZMte7hECMhIEH+eaCbebAQdtU05vUrRl75irG/0qmphUrYTOrpqFu/fct4kS6x
 QpqtQpFNSymEnt12hp9vPoAgRPBC9i0S+o2OcQbmp1UfraZgk+EES0+RaZxNwATxfk4D
 bHOdi5Jx6HplTr1fcZVRlf+rx+5NPeD9n3v7Xh+GrJntnB/YVbarlXtx//Ism2clLma1
 CK8Bg+SvRVvuecMDon0/K4K0oNMiqGc41R/2ABMjf0lFxSd9RcT4H5Rr6f4CWh0MRJwc
 rjMKl5jAYYVlW39/noKuU7NvC/GLLjWmqhRHtivWSOvqoVCIiqNXXavhP94aqz3iJtNs
 Q1xQ==
X-Gm-Message-State: AOAM5339Holf1ynefjfxHpPPz+pUPKaOO6YwN0Sm2byXdNQWJPShHRAu
 buXvipevbxcYVRqZQgeDxLoMFg==
X-Google-Smtp-Source: ABdhPJyTlGM6mhL9QqWgTJ1LFNupcsV30Wr+5IkA+TeJzlT9AA3ezvATTEqe7IGaFlYhNDr/cS3e6Q==
X-Received: by 2002:adf:dcc2:: with SMTP id x2mr3331994wrm.178.1613641968028; 
 Thu, 18 Feb 2021 01:52:48 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y16sm7809783wrw.46.2021.02.18.01.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 01:52:46 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BA52C1FF98;
 Thu, 18 Feb 2021 09:47:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 09/23] accel/tcg/plugin-gen: fix the call signature for inline
 callbacks
Date: Thu, 18 Feb 2021 09:46:52 +0000
Message-Id: <20210218094706.23038-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210218094706.23038-1-alex.bennee@linaro.org>
References: <20210218094706.23038-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
 "Emilio G . Cota" <cota@braap.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
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
Message-Id: <20210213130325.14781-10-alex.bennee@linaro.org>

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


