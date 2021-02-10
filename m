Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50035317326
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:18:14 +0100 (CET)
Received: from localhost ([::1]:33094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9xoK-00035u-M4
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:18:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xhk-0006Gr-NY
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:11:24 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:51425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xhf-0003Ku-Ch
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:11:24 -0500
Received: by mail-wm1-x32f.google.com with SMTP id t142so3200570wmt.1
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o81Mz4W9KCvutw0rCkPpru0KeoeXZKNx1XZY/IHOEHo=;
 b=S6cHlkWEYWDuU77TQtbJkZlDr+0/+TkKe6tT8EbUjDKj4PnwHS3g+nf8ngx2pbI0Xv
 NL/wvdbj6EB5KKeX8/1VdX5VWntmBQaa5qreZQVsHOYkQDUAneoSW1AX+4mDJv/WN2Wc
 Ac5qVloPOQc+p8+RHN3BIWZG3DDMiaVYAdkos8NSrRuLflKwFo8LDlEFWmsIwmGlHI1I
 w80RcZSnttxC8U4JbjTwqE30SgMwueJydjUKzWCXbD1yJHiTiqwAg7us6cewysbRQwjv
 yZjtPeh+P0YPzj0dM2vWliadAARiQM0dXdpDeLefXZUSmMrToUe3mE2vLaiaBdneHHVr
 WL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o81Mz4W9KCvutw0rCkPpru0KeoeXZKNx1XZY/IHOEHo=;
 b=sbdgDJyU9RRtXM5WQPDbCF+aNEdmeqClVf7O5Ust7vmMT9SjwbcrpXkHwIQkKDeP4u
 1hBLTOp74Au2kKK/a8zTI3s7jm6QtCBXqjahy6o6IDiUzaJ1Inr8AIEHTMw+XPKk9Fgf
 oKpyEs7yHPuvLJB9XgDZ1giSdY3VYuoTrkJ7ZkbnCZpTPdofX+xvje7Db7oPrToX7Emc
 QAfusdkAnNBLHbRASrMty6hP4g4SZB01+LZ2wtWQH49ixGH70WtqfV3Cwh3d3fDRRV8C
 rr2XIwsgAPVLclh8g09zeN1oy1pE1NnWfJ3QJ9Lr3hE7NPov6TOPtj0S1B8cJuyECs3C
 iucA==
X-Gm-Message-State: AOAM533MbMET4YdkLJsMcEsTmxGfl5ozoXxOnpjYFynuRqFnUpfulzkB
 I9nzlmGdjgHpGFnEtWo/DHokbQ==
X-Google-Smtp-Source: ABdhPJz9QfVdymzu+DZVmPiEGKTXi9UjPLtcDZCtL4kDvDsPeqBWdkgFQmrh4ENlxoXAsDgMCvLDtw==
X-Received: by 2002:a1c:220a:: with SMTP id i10mr1162872wmi.102.1612995078102; 
 Wed, 10 Feb 2021 14:11:18 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o124sm5304658wmb.5.2021.02.10.14.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:11:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 60B5D1FF98;
 Wed, 10 Feb 2021 22:10:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/21] accel/tcg/plugin-gen: fix the call signature for
 inline callbacks
Date: Wed, 10 Feb 2021 22:10:41 +0000
Message-Id: <20210210221053.18050-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210210221053.18050-1-alex.bennee@linaro.org>
References: <20210210221053.18050-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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


