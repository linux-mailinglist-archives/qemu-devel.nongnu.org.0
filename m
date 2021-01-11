Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D85F2F1CB2
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:42:30 +0100 (CET)
Received: from localhost ([::1]:55978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz1D3-00013N-8M
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:42:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0rk-0003Lk-Sd
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:28 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:52997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0re-0000Fp-S3
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:28 -0500
Received: by mail-pj1-x102b.google.com with SMTP id v1so8191326pjr.2
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 09:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rT+Iuuo6F5MmSbW+tCwYHH0uffarzjIWxAQZUPXloBE=;
 b=dln7UCaTm+XQuSJ4RaOPH9maRuDzhGxjmSfgxt/nTJsmgbOGvNmRIkSVOpiujs5DP5
 XHZ9PwQaEKlYZvnmPfu8xoPuIpKkUVcBn7x5dZedaN1KYXrVUczbMHAFgcQh+5LsEjvg
 oXC4FgpPHB8z6/LBijKetSYAS2k4xcRiT02/tJB/XmeD3g26AnZNrwCYER7qU5su3IXb
 3zLaoShlNALxp2I66iHz+8I51t9pGw1VIllkypu+SvM3WYbfswChEJjLWjHAJfehdtOn
 A4W84vW79ISGu/418WOkbtELAJavr7nSFoVS6XRZAoBPY/xujuq87uyDZW7kqt8sziuH
 hj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rT+Iuuo6F5MmSbW+tCwYHH0uffarzjIWxAQZUPXloBE=;
 b=OU17wYu31WF/y4SnBAptx6fbWNqz9NsvTZMw+xeuFqJ0ji9NoJM5PzPJ8r564YcHur
 t1jj3nvyPmWocp6CyA4TknmXKqpDZ3bXNE7jIBU4ZEw0L/6M23DlYTmJbjATwjlaGDQD
 0EkYEalLRiqW1DX1koMw38qfqLDTtsxhvDQBICo7ZYKaqh/6nHPxtSLUCOWsxdN3hJWc
 ibFaoGDlKWkTi5VvJtaT5PBL+QzOb1cpTA5etLFxfrwkXtQANP/lW25etLJaYIh4kHGN
 jPM7pjS8+HTm6ozplz4z/DPkfFKKgd+k8PUpeGYy0OW4fj3Pn1GKwoeprY+vvhkvaLI/
 qMwA==
X-Gm-Message-State: AOAM530jHY/hhIc2zLl9V2EpTz2B3WZnL9phAAKVAX0V9mjoBYEyp1QR
 z2IkeRKOqW8UWXG/G8z3rO14MRpY4hAmJQ==
X-Google-Smtp-Source: ABdhPJzfBfnR0Lh5sBKliFVHLh3VM+lAfBTH1E5cjzRl5CZQU+iZVxKqWjKFKVBA3kDt9gLZfODozw==
X-Received: by 2002:a17:902:b781:b029:db:e4ee:b8c7 with SMTP id
 e1-20020a170902b781b02900dbe4eeb8c7mr703302pls.69.1610385621193; 
 Mon, 11 Jan 2021 09:20:21 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id k64sm206666pfd.75.2021.01.11.09.20.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 09:20:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 19/23] tcg: Add tcg_reg_alloc_dup2
Date: Mon, 11 Jan 2021 07:19:42 -1000
Message-Id: <20210111171946.219469-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111171946.219469-1-richard.henderson@linaro.org>
References: <20210111171946.219469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are several ways we can expand a vector dup of a 64-bit
element on a 32-bit host.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 97 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 5b0e42be91..8f8badb61c 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -4084,6 +4084,98 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
     }
 }
 
+static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
+{
+    const TCGLifeData arg_life = op->life;
+    TCGTemp *ots, *itsl, *itsh;
+    TCGType vtype = TCGOP_VECL(op) + TCG_TYPE_V64;
+
+    /* This opcode is only valid for 32-bit hosts, for 64-bit elements. */
+    tcg_debug_assert(TCG_TARGET_REG_BITS == 32);
+    tcg_debug_assert(TCGOP_VECE(op) == MO_64);
+
+    ots = arg_temp(op->args[0]);
+    itsl = arg_temp(op->args[1]);
+    itsh = arg_temp(op->args[2]);
+
+    /* ENV should not be modified.  */
+    tcg_debug_assert(!temp_readonly(ots));
+
+    /* Allocate the output register now.  */
+    if (ots->val_type != TEMP_VAL_REG) {
+        TCGRegSet allocated_regs = s->reserved_regs;
+        TCGRegSet dup_out_regs =
+            tcg_op_defs[INDEX_op_dup_vec].args_ct[0].regs;
+
+        /* Make sure to not spill the input registers. */
+        if (!IS_DEAD_ARG(1) && itsl->val_type == TEMP_VAL_REG) {
+            tcg_regset_set_reg(allocated_regs, itsl->reg);
+        }
+        if (!IS_DEAD_ARG(2) && itsh->val_type == TEMP_VAL_REG) {
+            tcg_regset_set_reg(allocated_regs, itsh->reg);
+        }
+
+        ots->reg = tcg_reg_alloc(s, dup_out_regs, allocated_regs,
+                                 op->output_pref[0], ots->indirect_base);
+        ots->val_type = TEMP_VAL_REG;
+        ots->mem_coherent = 0;
+        s->reg_to_temp[ots->reg] = ots;
+    }
+
+    /* Promote dup2 of immediates to dupi_vec. */
+    if (itsl->val_type == TEMP_VAL_CONST && itsh->val_type == TEMP_VAL_CONST) {
+        uint64_t val = deposit64(itsl->val, 32, 32, itsh->val);
+        MemOp vece = MO_64;
+
+        if (val == dup_const(MO_8, val)) {
+            vece = MO_8;
+        } else if (val == dup_const(MO_16, val)) {
+            vece = MO_16;
+        } else if (val == dup_const(MO_32, val)) {
+            vece = MO_32;
+        }
+
+        tcg_out_dupi_vec(s, vtype, vece, ots->reg, val);
+        goto done;
+    }
+
+    /* If the two inputs form one 64-bit value, try dupm_vec. */
+    if (itsl + 1 == itsh && itsl->base_type == TCG_TYPE_I64) {
+        if (!itsl->mem_coherent) {
+            temp_sync(s, itsl, s->reserved_regs, 0, 0);
+        }
+        if (!itsh->mem_coherent) {
+            temp_sync(s, itsh, s->reserved_regs, 0, 0);
+        }
+#ifdef HOST_WORDS_BIGENDIAN
+        TCGTemp *its = itsh;
+#else
+        TCGTemp *its = itsl;
+#endif
+        if (tcg_out_dupm_vec(s, vtype, MO_64, ots->reg,
+                             its->mem_base->reg, its->mem_offset)) {
+            goto done;
+        }
+    }
+
+    /* Fall back to generic expansion. */
+    return false;
+
+ done:
+    if (IS_DEAD_ARG(1)) {
+        temp_dead(s, itsl);
+    }
+    if (IS_DEAD_ARG(2)) {
+        temp_dead(s, itsh);
+    }
+    if (NEED_SYNC_ARG(0)) {
+        temp_sync(s, ots, s->reserved_regs, 0, IS_DEAD_ARG(0));
+    } else if (IS_DEAD_ARG(0)) {
+        temp_dead(s, ots);
+    }
+    return true;
+}
+
 #ifdef TCG_TARGET_STACK_GROWSUP
 #define STACK_DIR(x) (-(x))
 #else
@@ -4501,6 +4593,11 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
         case INDEX_op_call:
             tcg_reg_alloc_call(s, op);
             break;
+        case INDEX_op_dup2_vec:
+            if (tcg_reg_alloc_dup2(s, op)) {
+                break;
+            }
+            /* fall through */
         default:
             /* Sanity check that we've not introduced any unhandled opcodes. */
             tcg_debug_assert(tcg_op_supported(opc));
-- 
2.25.1


