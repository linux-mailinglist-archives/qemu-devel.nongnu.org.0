Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D6763FFE2
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 06:41:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ymP-0002X4-Hs; Fri, 02 Dec 2022 00:40:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymN-0002W5-EZ
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:07 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymL-0003JP-GS
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:07 -0500
Received: by mail-pl1-x62b.google.com with SMTP id 4so3751529pli.0
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 21:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=B2h4aVGmGk/ozxNqj9+5WShlfIEAislLVF416QCuZP0=;
 b=BO6y59Cap+4glI1OvAIEPzmsUrlU0cFwtM1JihplQ4Fyo1MnxTG9V/S/tPwC715xpg
 1RxD21niRY5TNLq+COm1iUOO7zxed8XEV4Gml3AhYsHfDZ6aW+JKdow9tyJU1mqxKqXo
 1mpHNi1R7NBHlRRkdDfeCD9oMjMPhyzineajf9Bqsnt2lHN5PQR8bfRLKJUv4gjKf/SA
 PNG2MYsTc7ZH0HZxU7JMpAtZsNTO+bH1FOCUCrJMZrUM5HXnQGRFf+SO0aPKaSEvnKm7
 CNIT8WrGP9S5xgN3d4HpGQMrcMOWYZFFDKufVG6k6Q2t1jR8CCI27+24tDpcMufgL+sz
 saMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B2h4aVGmGk/ozxNqj9+5WShlfIEAislLVF416QCuZP0=;
 b=yNR5hoWeRmQy+KjBmIO0GeECg6o4yEahpPYp2kEUuQdMqBSqvEvt6rBFohksN6mDDD
 Lg169fkeQ1HSIHcR1/Y/b6JSMBVH/8NYWymUx1mheI41I+OmFJ3exDm1KPmGy9O3PUqy
 bjAdkmbjWnX3eWUzcKZVYvrjct3qSvpbX9301dTBHtM5bPHk9UNuy/6Y6kg3VQc2enlS
 fQ8DoM034MMOtXM0kFqtwRuhUnyUXpfj38CBinH9/zp61eN/qagoam42ps0BlrfcRtCl
 pxblAZs06x10KwTSx5A/xZslURiIXVi1YS1j/d6yFQ6Rnju8L3inUGrGP/3cUpOqTugJ
 /kfw==
X-Gm-Message-State: ANoB5pktqwOZJ8EOPt1M+LdxqIrk0dvvnuXq+LSNGro3BFsvcR1TQ7wh
 vNe4aVaKFNEL7M1MDxbQhaL9VquTo1bHLO+S
X-Google-Smtp-Source: AA0mqf593dRBm50XedRT3GCkCrqLThFvSRoJ2/4e+XJbLQoJaDMRo2eE5zZME96654cvj5J+Eixlvg==
X-Received: by 2002:a17:90a:7804:b0:211:2d90:321 with SMTP id
 w4-20020a17090a780400b002112d900321mr80043406pjk.84.1669959604059; 
 Thu, 01 Dec 2022 21:40:04 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b00186f0f59c85sm4637075plh.235.2022.12.01.21.40.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 21:40:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/34] tcg: Cleanup trailing whitespace
Date: Thu,  1 Dec 2022 21:39:28 -0800
Message-Id: <20221202053958.223890-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202053958.223890-1-richard.henderson@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Remove whitespace at end of line, plus one place this also
highlights some missing braces.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                | 33 +++++++++++++++++----------------
 tcg/ppc/tcg-target.c.inc |  2 +-
 2 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 436fcf6ebd..db64799e03 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -496,7 +496,7 @@ void *tcg_malloc_internal(TCGContext *s, int size)
 {
     TCGPool *p;
     int pool_size;
-    
+
     if (size > TCG_POOL_CHUNK_SIZE) {
         /* big malloc: insert a new pool (XXX: could optimize) */
         p = g_malloc(sizeof(TCGPool) + size);
@@ -517,10 +517,11 @@ void *tcg_malloc_internal(TCGContext *s, int size)
                 p = g_malloc(sizeof(TCGPool) + pool_size);
                 p->size = pool_size;
                 p->next = NULL;
-                if (s->pool_current) 
+                if (s->pool_current) {
                     s->pool_current->next = p;
-                else
+                } else {
                     s->pool_first = p;
+                }
             } else {
                 p = p->next;
             }
@@ -2949,8 +2950,8 @@ static void dump_regs(TCGContext *s)
 
     for(i = 0; i < TCG_TARGET_NB_REGS; i++) {
         if (s->reg_to_temp[i] != NULL) {
-            printf("%s: %s\n", 
-                   tcg_target_reg_names[i], 
+            printf("%s: %s\n",
+                   tcg_target_reg_names[i],
                    tcg_get_arg_str_ptr(s, buf, sizeof(buf), s->reg_to_temp[i]));
         }
     }
@@ -2967,7 +2968,7 @@ static void check_regs(TCGContext *s)
         ts = s->reg_to_temp[reg];
         if (ts != NULL) {
             if (ts->val_type != TEMP_VAL_REG || ts->reg != reg) {
-                printf("Inconsistency for register %s:\n", 
+                printf("Inconsistency for register %s:\n",
                        tcg_target_reg_names[reg]);
                 goto fail;
             }
@@ -3597,14 +3598,14 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
     nb_iargs = def->nb_iargs;
 
     /* copy constants */
-    memcpy(new_args + nb_oargs + nb_iargs, 
+    memcpy(new_args + nb_oargs + nb_iargs,
            op->args + nb_oargs + nb_iargs,
            sizeof(TCGArg) * def->nb_cargs);
 
     i_allocated_regs = s->reserved_regs;
     o_allocated_regs = s->reserved_regs;
 
-    /* satisfy input constraints */ 
+    /* satisfy input constraints */
     for (k = 0; k < nb_iargs; k++) {
         TCGRegSet i_preferred_regs, o_preferred_regs;
 
@@ -3678,7 +3679,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
         const_args[i] = 0;
         tcg_regset_set_reg(i_allocated_regs, reg);
     }
-    
+
     /* mark dead temporaries and free the associated registers */
     for (i = nb_oargs; i < nb_oargs + nb_iargs; i++) {
         if (IS_DEAD_ARG(i)) {
@@ -3692,7 +3693,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
         tcg_reg_alloc_bb_end(s, i_allocated_regs);
     } else {
         if (def->flags & TCG_OPF_CALL_CLOBBER) {
-            /* XXX: permit generic clobber register list ? */ 
+            /* XXX: permit generic clobber register list ? */
             for (i = 0; i < TCG_TARGET_NB_REGS; i++) {
                 if (tcg_regset_test_reg(tcg_target_call_clobber_regs, i)) {
                     tcg_reg_free(s, i, i_allocated_regs);
@@ -3704,7 +3705,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
                an exception. */
             sync_globals(s, i_allocated_regs);
         }
-        
+
         /* satisfy the output constraints */
         for(k = 0; k < nb_oargs; k++) {
             i = def->args_ct[k].sort_index;
@@ -3889,7 +3890,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
 
     /* assign stack slots first */
     call_stack_size = (nb_iargs - nb_regs) * sizeof(tcg_target_long);
-    call_stack_size = (call_stack_size + TCG_TARGET_STACK_ALIGN - 1) & 
+    call_stack_size = (call_stack_size + TCG_TARGET_STACK_ALIGN - 1) &
         ~(TCG_TARGET_STACK_ALIGN - 1);
     allocate_args = (call_stack_size > TCG_STATIC_CALL_ARGS_SIZE);
     if (allocate_args) {
@@ -3914,7 +3915,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
         stack_offset += sizeof(tcg_target_long);
 #endif
     }
-    
+
     /* assign input registers */
     allocated_regs = s->reserved_regs;
     for (i = 0; i < nb_regs; i++) {
@@ -3947,14 +3948,14 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
             tcg_regset_set_reg(allocated_regs, reg);
         }
     }
-    
+
     /* mark dead temporaries and free the associated registers */
     for (i = nb_oargs; i < nb_iargs + nb_oargs; i++) {
         if (IS_DEAD_ARG(i)) {
             temp_dead(s, arg_temp(op->args[i]));
         }
     }
-    
+
     /* clobber call registers */
     for (i = 0; i < TCG_TARGET_NB_REGS; i++) {
         if (tcg_regset_test_reg(tcg_target_call_clobber_regs, i)) {
@@ -4395,7 +4396,7 @@ void tcg_dump_info(GString *buf)
                            (double)s->code_out_len / tb_div_count);
     g_string_append_printf(buf, "avg search data/TB  %0.1f\n",
                            (double)s->search_out_len / tb_div_count);
-    
+
     g_string_append_printf(buf, "cycles/op           %0.1f\n",
                            s->op_count ? (double)tot / s->op_count : 0);
     g_string_append_printf(buf, "cycles/in byte      %0.1f\n",
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index e3dba47697..9e34df94ba 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -42,7 +42,7 @@
 # else
 #  error "Unknown ABI"
 # endif
-#endif 
+#endif
 
 #ifdef _CALL_SYSV
 # define TCG_TARGET_CALL_ALIGN_ARGS   1
-- 
2.34.1


