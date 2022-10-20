Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9DF6062AA
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:16:37 +0200 (CEST)
Received: from localhost ([::1]:51572 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWLb-0003mw-Jl
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:16:36 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWJc-0004be-Ru
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7U-0004vg-SQ
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:03 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:40921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7S-00011e-A2
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:53:52 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 g8-20020a17090a128800b0020c79f987ceso3202872pja.5
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FvhGnFHzWfI6y4DuUWYRaxVVosi7A5FepLQOww3MqYY=;
 b=C/7GIQqnY9NQqALUtRrxoIiygcB74BSHX/OzaHCrhCxd3dc4dJMAz2cwT8gYIA6Y1n
 bDY7Fgx1teQyQCwWtX0+kXhMCOKGwQOnKx3dqqyEEtW1/noIxbtSEIA2ksOvW0JdAgEz
 dtaqf/h4KEXvYgfCG2XtA6v/8NeQFfLsk2/Gv7GrZv8Qjxkbw05IuZycVX+2F5j6iNdP
 a3z9TxBZJWVVJLkFxw2TOVx9Q8o0OQUjfEfN7+OYKyunOkQ9WLi1cny0kD20/XHd3eiz
 JaQVA9IAW/FvXvtosAT9y7GYnP4+36wjBT6JktPGKKKARAF4SP0YbR3rGbt+1Jl+Wyut
 JSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FvhGnFHzWfI6y4DuUWYRaxVVosi7A5FepLQOww3MqYY=;
 b=ME6/EsdObYk2XyA4ty1d0/hjMe49foxmZo/S9CdNQoJ8WfmXfkdAcsZmIFVZEqBWhr
 sRX39te5DpJBwblQolBxKCa2TaCJsFjziO7ZsHHVEFCYB9Fycc1CjwJLUp/gttPSSXD4
 Ft4vA+JAy4/EqWftkbmszIET3t5QFFg6XbsFk0pBei79lcX8ra0zfAB2TjFp5gToRqRx
 n0BQQk7zDFZYeKrO4rfyl2Q5/h9p0AMAEw6+WsBdKZtoHyAVb38BOJcZK3sJ9G5h7C4a
 vjbkbNhOWQcZHXQmd3q6vB5rbqeXOHnihtIsh38r0Dzk8HSZ0CgkCbfoKSplfwfD2B8t
 AJBA==
X-Gm-Message-State: ACrzQf10DRNKSUKC16QCqPVEY8dPw+NJxuEKAPu1J65kZKiiK51AFdWI
 lnVwebMTFP0bu+E6Zn0OiCaiibsVVlpD/RdK
X-Google-Smtp-Source: AMsMyM5bmceUZNaLEEBSA1idbBgetg1jHSqaB+OCjKjArb0BuTtlYffnK7qaMzg0yLXzxYQo0bvnHg==
X-Received: by 2002:a17:902:8e88:b0:185:3cea:6335 with SMTP id
 bg8-20020a1709028e8800b001853cea6335mr13549594plb.96.1666266828565; 
 Thu, 20 Oct 2022 04:53:48 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w206-20020a627bd7000000b0056109e15638sm13065464pfc.54.2022.10.20.04.53.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:53:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/31] tcg: Allocate TCGTemp pairs in host memory order
Date: Thu, 20 Oct 2022 21:52:22 +1000
Message-Id: <20221020115242.2301066-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115242.2301066-1-richard.henderson@linaro.org>
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
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

Allocate the first of a pair at the lower address, and the
second of a pair at the higher address.  This will make it
easier to find the beginning of the larger memory block.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-internal.h |  4 ++--
 tcg/tcg.c          | 60 ++++++++++++++++++++--------------------------
 2 files changed, 28 insertions(+), 36 deletions(-)

diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index a9ea27f67a..2c06b5116a 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -62,11 +62,11 @@ static inline unsigned tcg_call_flags(TCGOp *op)
 #if TCG_TARGET_REG_BITS == 32
 static inline TCGv_i32 TCGV_LOW(TCGv_i64 t)
 {
-    return temp_tcgv_i32(tcgv_i64_temp(t));
+    return temp_tcgv_i32(tcgv_i64_temp(t) + HOST_BIG_ENDIAN);
 }
 static inline TCGv_i32 TCGV_HIGH(TCGv_i64 t)
 {
-    return temp_tcgv_i32(tcgv_i64_temp(t) + 1);
+    return temp_tcgv_i32(tcgv_i64_temp(t) + !HOST_BIG_ENDIAN);
 }
 #else
 extern TCGv_i32 TCGV_LOW(TCGv_i64) QEMU_ERROR("32-bit code path is reachable");
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 135d9a9a0a..71afa4b749 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -886,10 +886,7 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
     TCGContext *s = tcg_ctx;
     TCGTemp *base_ts = tcgv_ptr_temp(base);
     TCGTemp *ts = tcg_global_alloc(s);
-    int indirect_reg = 0, bigendian = 0;
-#if HOST_BIG_ENDIAN
-    bigendian = 1;
-#endif
+    int indirect_reg = 0;
 
     switch (base_ts->kind) {
     case TEMP_FIXED:
@@ -915,7 +912,7 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
         ts->indirect_reg = indirect_reg;
         ts->mem_allocated = 1;
         ts->mem_base = base_ts;
-        ts->mem_offset = offset + bigendian * 4;
+        ts->mem_offset = offset;
         pstrcpy(buf, sizeof(buf), name);
         pstrcat(buf, sizeof(buf), "_0");
         ts->name = strdup(buf);
@@ -926,7 +923,7 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
         ts2->indirect_reg = indirect_reg;
         ts2->mem_allocated = 1;
         ts2->mem_base = base_ts;
-        ts2->mem_offset = offset + (1 - bigendian) * 4;
+        ts2->mem_offset = offset + 4;
         ts2->temp_subindex = 1;
         pstrcpy(buf, sizeof(buf), name);
         pstrcat(buf, sizeof(buf), "_1");
@@ -1072,37 +1069,43 @@ TCGTemp *tcg_constant_internal(TCGType type, int64_t val)
 
     ts = g_hash_table_lookup(h, &val);
     if (ts == NULL) {
+        int64_t *val_ptr;
+
         ts = tcg_temp_alloc(s);
 
         if (TCG_TARGET_REG_BITS == 32 && type == TCG_TYPE_I64) {
             TCGTemp *ts2 = tcg_temp_alloc(s);
 
+            tcg_debug_assert(ts2 == ts + 1);
+
             ts->base_type = TCG_TYPE_I64;
             ts->type = TCG_TYPE_I32;
             ts->kind = TEMP_CONST;
             ts->temp_allocated = 1;
-            /*
-             * Retain the full value of the 64-bit constant in the low
-             * part, so that the hash table works.  Actual uses will
-             * truncate the value to the low part.
-             */
-            ts->val = val;
 
-            tcg_debug_assert(ts2 == ts + 1);
             ts2->base_type = TCG_TYPE_I64;
             ts2->type = TCG_TYPE_I32;
             ts2->kind = TEMP_CONST;
             ts2->temp_allocated = 1;
             ts2->temp_subindex = 1;
-            ts2->val = val >> 32;
+
+            /*
+             * Retain the full value of the 64-bit constant in the low
+             * part, so that the hash table works.  Actual uses will
+             * truncate the value to the low part.
+             */
+            ts[HOST_BIG_ENDIAN].val = val;
+            ts[!HOST_BIG_ENDIAN].val = val >> 32;
+            val_ptr = &ts[HOST_BIG_ENDIAN].val;
         } else {
             ts->base_type = type;
             ts->type = type;
             ts->kind = TEMP_CONST;
             ts->temp_allocated = 1;
             ts->val = val;
+            val_ptr = &ts->val;
         }
-        g_hash_table_insert(h, &ts->val, ts);
+        g_hash_table_insert(h, val_ptr, ts);
     }
 
     return ts;
@@ -1514,13 +1517,8 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
     pi = 0;
     if (ret != NULL) {
         if (TCG_TARGET_REG_BITS < 64 && (typemask & 6) == dh_typecode_i64) {
-#if HOST_BIG_ENDIAN
-            op->args[pi++] = temp_arg(ret + 1);
-            op->args[pi++] = temp_arg(ret);
-#else
             op->args[pi++] = temp_arg(ret);
             op->args[pi++] = temp_arg(ret + 1);
-#endif
             nb_rets = 2;
         } else {
             op->args[pi++] = temp_arg(ret);
@@ -1554,8 +1552,8 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
         }
 
         if (TCG_TARGET_REG_BITS < 64 && is_64bit) {
-            op->args[pi++] = temp_arg(args[i] + HOST_BIG_ENDIAN);
-            op->args[pi++] = temp_arg(args[i] + !HOST_BIG_ENDIAN);
+            op->args[pi++] = temp_arg(args[i]);
+            op->args[pi++] = temp_arg(args[i] + 1);
             real_args += 2;
             continue;
         }
@@ -4116,18 +4114,12 @@ static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
     }
 
     /* If the two inputs form one 64-bit value, try dupm_vec. */
-    if (itsl + 1 == itsh && itsl->base_type == TCG_TYPE_I64) {
-        if (!itsl->mem_coherent) {
-            temp_sync(s, itsl, s->reserved_regs, 0, 0);
-        }
-        if (!itsh->mem_coherent) {
-            temp_sync(s, itsh, s->reserved_regs, 0, 0);
-        }
-#if HOST_BIG_ENDIAN
-        TCGTemp *its = itsh;
-#else
-        TCGTemp *its = itsl;
-#endif
+    if (itsl - itsl->temp_subindex == itsh - itsh->temp_subindex) {
+        TCGTemp *its = itsl - itsl->temp_subindex;
+
+        temp_sync(s, its + 0, s->reserved_regs, 0, 0);
+        temp_sync(s, its + 1, s->reserved_regs, 0, 0);
+
         if (tcg_out_dupm_vec(s, vtype, MO_64, ots->reg,
                              its->mem_base->reg, its->mem_offset)) {
             goto done;
-- 
2.34.1


