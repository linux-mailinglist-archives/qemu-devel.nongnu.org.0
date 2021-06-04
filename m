Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668AE39C115
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 22:14:02 +0200 (CEST)
Received: from localhost ([::1]:50014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpGCf-0008MR-Dc
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 16:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGAw-0005cW-WC
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:15 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:40607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGAv-0005H5-0x
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:14 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 jz2-20020a17090b14c2b0290162cf0b5a35so8035251pjb.5
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 13:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l2UwELGiZnIKpdCkZaYqqVJXOdc/mS9I96df+41M4E4=;
 b=DOYKphavfnwBWqRQ3EmJkxvc/IcP9akw0ENodpKSGPFANTZUNNIzhhlXS/zfa1qudJ
 sSqy4lDq7TYMsZj8JAN6tFmASgDGSD8KyqYk/fZ0Mx/MLDKe2BXRKwSZudsyw/Mqn07a
 hCpAgmTCXjSMEgzUMj65g8cPJfhIR2npD54Prlhy8TOPY/uJiOw/nNkKp6GQyT8sdSab
 J7QUCTxpv7RDh8Ty/q5Bki8mtfQrt+d8nB+pNzL9QcRha5BqLvFN8glN/sF1qBmeLbjW
 Q72coPVkUHQ+8f/3zGg+XQKDUpQF7Jiw+S7qkOyGAtyP5EPTqvzX97GUkJPCUuLrvley
 +2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l2UwELGiZnIKpdCkZaYqqVJXOdc/mS9I96df+41M4E4=;
 b=d9mbHqckxHmume8MQfWp4OeCM7DgZzdS7izcSZOFxO7KJ1shidDDu3xHIlU0soMY1S
 CcVAvho2eThD6wv5EypAzbRzAMT7oLapF+nQddIQcrxZpZmLqi844cWqj/ix0Gm3G6YW
 mryQ6SidP6zQy6o7CKPpsLRkhGZc2PCcb51VmuUOWnsS1Qd36sJfS/N9/ONjCY+BPVT2
 Bm3UsHjTOKPXV8Xn8ENyhejJFfGbYkwJpqTZXvOojc0fdc4lCchk0C8jpyl7T4OYE1qL
 Ew3/6W4vNk62rFb1zACMOAOA01JMVnyf1sM/SDEiFmJR3rQSQ12RUVqQ4DRyjtEvAqRL
 0JMQ==
X-Gm-Message-State: AOAM531YpAYVWUffGmXtZQoDL8quQjz7RB+5ScRKvmngo7MEGFsU4j6q
 7XLfOkYsPE6UI0k2PoCtOkp/l/WqJlVSTg==
X-Google-Smtp-Source: ABdhPJwmP1VPCAsO47KvLCO3e196ARr1Y4FqKJbKc9bofbrUIbezQlRU8KW3Nk3SNqu2dTxkOuTcqw==
X-Received: by 2002:a17:902:b58a:b029:fe:735f:ddbf with SMTP id
 a10-20020a170902b58ab02900fe735fddbfmr5852830pls.68.1622837531497; 
 Fri, 04 Jun 2021 13:12:11 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id a129sm2422599pfa.118.2021.06.04.13.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 13:12:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/15] tcg: Change parameters for tcg_target_const_match
Date: Fri,  4 Jun 2021 13:11:56 -0700
Message-Id: <20210604201210.920136-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604201210.920136-1-richard.henderson@linaro.org>
References: <20210604201210.920136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change the return value to bool, because that's what is should
have been from the start.  Pass the ct mask instead of the whole
TCGArgConstraint, as that's the only part that's relevant.

Change the value argument to int64_t.  We will need the extra
width for 32-bit hosts wanting to match vector constants.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                    | 5 ++---
 tcg/aarch64/tcg-target.c.inc | 5 +----
 tcg/arm/tcg-target.c.inc     | 5 +----
 tcg/i386/tcg-target.c.inc    | 4 +---
 tcg/mips/tcg-target.c.inc    | 5 +----
 tcg/ppc/tcg-target.c.inc     | 4 +---
 tcg/riscv/tcg-target.c.inc   | 4 +---
 tcg/s390/tcg-target.c.inc    | 5 +----
 tcg/sparc/tcg-target.c.inc   | 5 +----
 tcg/tci/tcg-target.c.inc     | 6 ++----
 10 files changed, 12 insertions(+), 36 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index db806a6658..0dc271aac9 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -148,8 +148,7 @@ static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg, TCGReg arg1,
 static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
                         TCGReg base, intptr_t ofs);
 static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target);
-static int tcg_target_const_match(tcg_target_long val, TCGType type,
-                                  const TCGArgConstraint *arg_ct);
+static bool tcg_target_const_match(int64_t val, TCGType type, int ct);
 #ifdef TCG_TARGET_NEED_LDST_LABELS
 static int tcg_out_ldst_finalize(TCGContext *s);
 #endif
@@ -4078,7 +4077,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
         ts = arg_temp(arg);
 
         if (ts->val_type == TEMP_VAL_CONST
-            && tcg_target_const_match(ts->val, ts->type, arg_ct)) {
+            && tcg_target_const_match(ts->val, ts->type, arg_ct->ct)) {
             /* constant is OK for instruction */
             const_args[i] = 1;
             new_args[i] = ts->val;
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 5bd366f2d4..27cde314a9 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -277,11 +277,8 @@ static bool is_shimm1632(uint32_t v32, int *cmode, int *imm8)
     }
 }
 
-static int tcg_target_const_match(tcg_target_long val, TCGType type,
-                                  const TCGArgConstraint *arg_ct)
+static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 {
-    int ct = arg_ct->ct;
-
     if (ct & TCG_CT_CONST) {
         return 1;
     }
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 8457108a87..eb4f42e53d 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -301,11 +301,8 @@ static inline int check_fit_imm(uint32_t imm)
  * mov operand2:     values represented with x << (2 * y), x < 0x100
  * add, sub, eor...: ditto
  */
-static inline int tcg_target_const_match(tcg_target_long val, TCGType type,
-                                         const TCGArgConstraint *arg_ct)
+static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 {
-    int ct;
-    ct = arg_ct->ct;
     if (ct & TCG_CT_CONST) {
         return 1;
     } else if ((ct & TCG_CT_CONST_ARM) && check_fit_imm(val)) {
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 415c5c0796..34113388ef 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -210,10 +210,8 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 }
 
 /* test if a constant matches the constraint */
-static inline int tcg_target_const_match(tcg_target_long val, TCGType type,
-                                         const TCGArgConstraint *arg_ct)
+static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 {
-    int ct = arg_ct->ct;
     if (ct & TCG_CT_CONST) {
         return 1;
     }
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 8b16726242..5944448b2a 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -193,11 +193,8 @@ static inline bool is_p2m1(tcg_target_long val)
 }
 
 /* test if a constant matches the constraint */
-static inline int tcg_target_const_match(tcg_target_long val, TCGType type,
-                                         const TCGArgConstraint *arg_ct)
+static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 {
-    int ct;
-    ct = arg_ct->ct;
     if (ct & TCG_CT_CONST) {
         return 1;
     } else if ((ct & TCG_CT_CONST_ZERO) && val == 0) {
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 838ccfa42d..795701442b 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -238,10 +238,8 @@ static bool reloc_pc14(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
 }
 
 /* test if a constant matches the constraint */
-static int tcg_target_const_match(tcg_target_long val, TCGType type,
-                                  const TCGArgConstraint *arg_ct)
+static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 {
-    int ct = arg_ct->ct;
     if (ct & TCG_CT_CONST) {
         return 1;
     }
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index ef43147040..da7eecafc5 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -145,10 +145,8 @@ static inline tcg_target_long sextreg(tcg_target_long val, int pos, int len)
 }
 
 /* test if a constant matches the constraint */
-static int tcg_target_const_match(tcg_target_long val, TCGType type,
-                                  const TCGArgConstraint *arg_ct)
+static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 {
-    int ct = arg_ct->ct;
     if (ct & TCG_CT_CONST) {
         return 1;
     }
diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
index af8dfe81ac..5fe073f09a 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -417,11 +417,8 @@ static bool patch_reloc(tcg_insn_unit *src_rw, int type,
 }
 
 /* Test if a constant matches the constraint. */
-static int tcg_target_const_match(tcg_target_long val, TCGType type,
-                                  const TCGArgConstraint *arg_ct)
+static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 {
-    int ct = arg_ct->ct;
-
     if (ct & TCG_CT_CONST) {
         return 1;
     }
diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 3d50f985c6..ce39ac2d86 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -341,11 +341,8 @@ static bool patch_reloc(tcg_insn_unit *src_rw, int type,
 }
 
 /* test if a constant matches the constraint */
-static inline int tcg_target_const_match(tcg_target_long val, TCGType type,
-                                         const TCGArgConstraint *arg_ct)
+static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 {
-    int ct = arg_ct->ct;
-
     if (ct & TCG_CT_CONST) {
         return 1;
     }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index ee6cdfec71..823ecd5d35 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -789,11 +789,9 @@ static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
 }
 
 /* Test if a constant matches the constraint. */
-static int tcg_target_const_match(tcg_target_long val, TCGType type,
-                                  const TCGArgConstraint *arg_ct)
+static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 {
-    /* No need to return 0 or 1, 0 or != 0 is good enough. */
-    return arg_ct->ct & TCG_CT_CONST;
+    return ct & TCG_CT_CONST;
 }
 
 static void tcg_target_init(TCGContext *s)
-- 
2.25.1


