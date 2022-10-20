Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D69396064B3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:36:16 +0200 (CEST)
Received: from localhost ([::1]:41690 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXag-0004mt-Kr
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:36:14 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXSv-0007LL-Uz
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7G-00044e-LH
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:53:38 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:39686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU71-0000va-Ae
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:53:38 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 o17-20020a17090aac1100b0020d98b0c0f4so3198533pjq.4
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0N2X3V1riRQReX4ltI4ULsG1O5wdgfurbMkc7ES3gzU=;
 b=oIOEqy8lhREixIlMf4h7ABgBYyrAjtSKZUqccQGwczGS6LRyE+8NB5BDznXvxoCIrA
 LATMqO3ShRGsamPF/MWdZXa+Hx9RcEKILTZRgXZdklVAUgEQhDu8hnvCfj3rz8ogr4a9
 hCBW9veFyunR6TQm7cP+f/FGe8YUDjaVBvZx0uyuH4KKNAfH5wB0qMFOJBeB5VHQWqY4
 yOuqR2eubPUocAMIRoF4HVuQtYRvD02n89hfNEHEGL7/Or0+cPAXHRI9nJVM6cg+xqSg
 kwiutXi0YJIOKzl45rtNXv/zskR1K6oQeUb0ZyaIShmYU1fkEy4putJa2TgGpkML4jLr
 qd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0N2X3V1riRQReX4ltI4ULsG1O5wdgfurbMkc7ES3gzU=;
 b=kVO0xKPIH6tZASG0VbdespM993n1jzNbl69FUqnNiF6d61D0pMhRJ6+sBKhanwywG5
 GysVnKaSjfJlAUC77ZkZKxgI0DFR+avNNbRdHsy4GxWudV0YyprDQa2tY2LilMGXNnuA
 7V/K9YuCXzfEBykcT1zNyGJV/m59g3B6ct7XlJnI5Z80RFJxnmZVxWNt3DpayhCxbkCs
 NBv35n/I0jZ3+CzglW4uOkAjQWuf2a305fqT2S0iIcLA82DMy6Tn2ArjSRWkJguDY+4/
 7FNUtdFhckKkhw3g6E7bLp6pJJx3bA51PfBDv/OJzuWcG4szOxBHA5MK5m/0bfzeHDD7
 czVw==
X-Gm-Message-State: ACrzQf3O6w0vcR9FYQQNLfjPj3H8C6d4MtCJPAZOJx27oWEfZEkbu/yi
 nDJW73nIXy2BrG8od7zrpUPFki+XLxgoobFZ
X-Google-Smtp-Source: AMsMyM6cw7F+y9Uwa0eVjJSS8OiupqHofZcEC4It+LTo1FFzpbTDSmc7T5q7mwc64Lv+AY7FH6jfnQ==
X-Received: by 2002:a17:902:c946:b0:183:4bdf:9478 with SMTP id
 i6-20020a170902c94600b001834bdf9478mr13138450pla.139.1666266801916; 
 Thu, 20 Oct 2022 04:53:21 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w206-20020a627bd7000000b0056109e15638sm13065464pfc.54.2022.10.20.04.53.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:53:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/31] tcg: Tidy tcg_reg_alloc_op
Date: Thu, 20 Oct 2022 21:52:12 +1000
Message-Id: <20221020115242.2301066-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115242.2301066-1-richard.henderson@linaro.org>
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Replace goto allocate_in_reg with a boolean.
Remove o_preferred_regs which isn't used, except to copy.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 45 +++++++++++++++++++++------------------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index c9e664ee31..660d5eb098 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3606,7 +3606,8 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
 
     /* satisfy input constraints */ 
     for (k = 0; k < nb_iargs; k++) {
-        TCGRegSet i_preferred_regs, o_preferred_regs;
+        TCGRegSet i_preferred_regs;
+        bool allocate_new_reg;
 
         i = def->args_ct[nb_oargs + k].sort_index;
         arg = op->args[i];
@@ -3621,9 +3622,12 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
             continue;
         }
 
-        i_preferred_regs = o_preferred_regs = 0;
+        reg = ts->reg;
+        i_preferred_regs = 0;
+        allocate_new_reg = false;
+
         if (arg_ct->ialias) {
-            o_preferred_regs = op->output_pref[arg_ct->alias_index];
+            i_preferred_regs = op->output_pref[arg_ct->alias_index];
 
             /*
              * If the input is readonly, then it cannot also be an
@@ -3632,30 +3636,23 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
              * register and move it.
              */
             if (temp_readonly(ts) || !IS_DEAD_ARG(i)) {
-                goto allocate_in_reg;
+                allocate_new_reg = true;
+            } else if (ts->val_type == TEMP_VAL_REG) {
+                /*
+                 * Check if the current register has already been
+                 * allocated for another input.
+                 */
+                allocate_new_reg = tcg_regset_test_reg(i_allocated_regs, reg);
             }
-
-            /*
-             * Check if the current register has already been allocated
-             * for another input aliased to an output.
-             */
-            if (ts->val_type == TEMP_VAL_REG) {
-                reg = ts->reg;
-                for (int k2 = 0; k2 < k; k2++) {
-                    int i2 = def->args_ct[nb_oargs + k2].sort_index;
-                    if (def->args_ct[i2].ialias && reg == new_args[i2]) {
-                        goto allocate_in_reg;
-                    }
-                }
-            }
-            i_preferred_regs = o_preferred_regs;
         }
 
-        temp_load(s, ts, arg_ct->regs, i_allocated_regs, i_preferred_regs);
-        reg = ts->reg;
+        if (!allocate_new_reg) {
+            temp_load(s, ts, arg_ct->regs, i_allocated_regs, i_preferred_regs);
+            reg = ts->reg;
+            allocate_new_reg = !tcg_regset_test_reg(arg_ct->regs, reg);
+        }
 
-        if (!tcg_regset_test_reg(arg_ct->regs, reg)) {
- allocate_in_reg:
+        if (allocate_new_reg) {
             /*
              * Allocate a new register matching the constraint
              * and move the temporary register into it.
@@ -3663,7 +3660,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
             temp_load(s, ts, tcg_target_available_regs[ts->type],
                       i_allocated_regs, 0);
             reg = tcg_reg_alloc(s, arg_ct->regs, i_allocated_regs,
-                                o_preferred_regs, ts->indirect_base);
+                                i_preferred_regs, ts->indirect_base);
             if (!tcg_out_mov(s, ts->type, reg, ts->reg)) {
                 /*
                  * Cross register class move not supported.  Sync the
-- 
2.34.1


