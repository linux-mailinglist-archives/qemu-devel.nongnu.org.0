Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A56D60731D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 10:59:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olnrr-0003gG-SW
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 04:59:04 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmIJ-0003ii-BN
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmI2-0003PB-Nc
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:58 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHz-0005v1-R5
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:57 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so5828054pjq.3
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QVoRiK3j5+lRW7rSsEPFl7/tCZVXuMds/nbUBLlYc34=;
 b=BWOPbD2JWL4tLyCjs8EhKb0h27+hbV56lUF7t6EXeS5Eb5fxHI5Ru3NsHPUiu4/HKk
 GEgus5m3iVkBYgHQS2eaUG4J0Ag1/71gHKu8Iv2t7wVhDjMD4E/tSFi9eUz/sVGhTYPi
 gOZtbXjn9X0mJiDOhYP5Yt4SiGxTfwnk8Hr+DZexe48V+FEnX1jEjhFLNtvePi+D4RT7
 1aW26yU9GunccHcO12YPftxlXgBMHG85ixTUIoWd4aOZSQOfheOYnJaaJgZGVagrsS96
 X0tpr7NPe27p5MpLICeCB3ln3i9O84KjRokdmSKvZ0Kj7tzO1U++tDAdobycy8Oc3Bk3
 Ff2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QVoRiK3j5+lRW7rSsEPFl7/tCZVXuMds/nbUBLlYc34=;
 b=6AaVL8nAgHHxc0ZOZ0M6WgzMgKhjPnYnj1IlIUjspwBSuhNLDPa/FTTK9dNFK84+2a
 H8o2UPb9gXAuT7iluwJo5voEXMCJheWUVTiE7gA5SYppo+NeQjiCv6GuxGtHjQaWL1OJ
 8P75RXNxxefNX6vsjvTMgSRneMbykxBc/8UL8tzT+LfwCCVWV0KaQ59TKVgVumHhU3uE
 Iu6BoGxJeKw4jp0KQOpABCyFVWMcpHzOmbaVc5IinRu/ZdUW6y6D2UbQwrwy3ErGccw9
 sVjtNNRLHUpRMd9cmUkHMiuIFuCcVnjuzOdrtZIh7dmQaLqKp/uCJQ/zDtODvC8yk3oy
 dVAA==
X-Gm-Message-State: ACrzQf0vmypjg7U8IMert6O9kho1RoWvuBTM9xadnaqxkKZ0K/MLdImh
 LMspRYrMQjGtUPc5cgtATcMznVUO3Ds0d88b
X-Google-Smtp-Source: AMsMyM6QzMF/sBY7SaoiNhVnOtM+rmAF/D39GN84rULe5b/Dhgeoyy7lEa4/y1+rS05EhZn7F3g3bA==
X-Received: by 2002:a17:902:8212:b0:182:2f14:f6de with SMTP id
 x18-20020a170902821200b001822f14f6demr18194450pln.38.1666336674297; 
 Fri, 21 Oct 2022 00:17:54 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.17.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:17:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 33/36] tcg/tci: Add TCG_TARGET_CALL_{RET,ARG}_I128
Date: Fri, 21 Oct 2022 17:15:46 +1000
Message-Id: <20221021071549.2398137-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Fill in the parameters for libffi for Int128.
Adjust the interpreter to allow for 16-byte return values.
Adjust tcg_out_call to record the return value length.

Call parameters are no longer all the same size, so we
cannot reuse the same call_slots array for every function.
Compute it each time now, but only fill in slots required
for the call we're about to make.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     |  3 +++
 tcg/tcg.c                | 18 ++++++++++++++++
 tcg/tci.c                | 45 ++++++++++++++++++++--------------------
 tcg/tci/tcg-target.c.inc |  8 +++----
 4 files changed, 48 insertions(+), 26 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 94ec541b4e..9d569c9e04 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -161,10 +161,13 @@ typedef enum {
 #if TCG_TARGET_REG_BITS == 32
 # define TCG_TARGET_CALL_ARG_I32        TCG_CALL_ARG_EVEN
 # define TCG_TARGET_CALL_ARG_I64        TCG_CALL_ARG_EVEN
+# define TCG_TARGET_CALL_ARG_I128       TCG_CALL_ARG_EVEN
 #else
 # define TCG_TARGET_CALL_ARG_I32        TCG_CALL_ARG_NORMAL
 # define TCG_TARGET_CALL_ARG_I64        TCG_CALL_ARG_NORMAL
+# define TCG_TARGET_CALL_ARG_I128       TCG_CALL_ARG_NORMAL
 #endif
+#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
 
 #define HAVE_TCG_QEMU_TB_EXEC
 #define TCG_TARGET_NEED_POOL_LABELS
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 9ec5b85f44..f921a5ca24 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -548,6 +548,22 @@ static GHashTable *helper_table;
 #ifdef CONFIG_TCG_INTERPRETER
 static ffi_type *typecode_to_ffi(int argmask)
 {
+    /*
+     * libffi does not support __int128_t, so we have forced Int128
+     * to use the structure definition instead of the builtin type.
+     */
+    static ffi_type *ffi_type_i128_elements[3] = {
+        &ffi_type_uint64,
+        &ffi_type_uint64,
+        NULL
+    };
+    static ffi_type ffi_type_i128 = {
+        .size = 16,
+        .alignment = __alignof__(Int128),
+        .type = FFI_TYPE_STRUCT,
+        .elements = ffi_type_i128_elements,
+    };
+
     switch (argmask) {
     case dh_typecode_void:
         return &ffi_type_void;
@@ -561,6 +577,8 @@ static ffi_type *typecode_to_ffi(int argmask)
         return &ffi_type_sint64;
     case dh_typecode_ptr:
         return &ffi_type_pointer;
+    case dh_typecode_i128:
+        return &ffi_type_i128;
     }
     g_assert_not_reached();
 }
diff --git a/tcg/tci.c b/tcg/tci.c
index 114dece206..9154a3f22b 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -471,12 +471,9 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
     tcg_target_ulong regs[TCG_TARGET_NB_REGS];
     uint64_t stack[(TCG_STATIC_CALL_ARGS_SIZE + TCG_STATIC_FRAME_SIZE)
                    / sizeof(uint64_t)];
-    void *call_slots[TCG_STATIC_CALL_ARGS_SIZE / sizeof(uint64_t)];
 
     regs[TCG_AREG0] = (tcg_target_ulong)env;
     regs[TCG_REG_CALL_STACK] = (uintptr_t)stack;
-    /* Other call_slots entries initialized at first use (see below). */
-    call_slots[0] = NULL;
     tci_assert(tb_ptr);
 
     for (;;) {
@@ -499,26 +496,27 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         switch (opc) {
         case INDEX_op_call:
-            /*
-             * Set up the ffi_avalue array once, delayed until now
-             * because many TB's do not make any calls. In tcg_gen_callN,
-             * we arranged for every real argument to be "left-aligned"
-             * in each 64-bit slot.
-             */
-            if (unlikely(call_slots[0] == NULL)) {
-                for (int i = 0; i < ARRAY_SIZE(call_slots); ++i) {
-                    call_slots[i] = &stack[i];
-                }
-            }
-
-            tci_args_nl(insn, tb_ptr, &len, &ptr);
-
-            /* Helper functions may need to access the "return address" */
-            tci_tb_ptr = (uintptr_t)tb_ptr;
-
             {
-                void **pptr = ptr;
-                ffi_call(pptr[1], pptr[0], stack, call_slots);
+                void *call_slots[MAX_OPC_PARAM_IARGS];
+                ffi_cif *cif;
+                void *func;
+                unsigned i, s, n;
+
+                tci_args_nl(insn, tb_ptr, &len, &ptr);
+                func = ((void **)ptr)[0];
+                cif = ((void **)ptr)[1];
+
+                n = cif->nargs;
+                tci_assert(n <= MAX_OPC_PARAM_IARGS);
+                for (i = s = 0; i < n; ++i) {
+                    ffi_type *t = cif->arg_types[i];
+                    call_slots[i] = &stack[s];
+                    s += DIV_ROUND_UP(t->size, 8);
+                }
+
+                /* Helper functions may need to access the "return address" */
+                tci_tb_ptr = (uintptr_t)tb_ptr;
+                ffi_call(cif, func, stack, call_slots);
             }
 
             switch (len) {
@@ -543,6 +541,9 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                  */
                 memcpy(&regs[TCG_REG_R0], stack, 8);
                 break;
+            case 3: /* Int128 */
+                memcpy(&regs[TCG_REG_R0], stack, 16);
+                break;
             default:
                 g_assert_not_reached();
             }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 914806c216..a20a983422 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -576,11 +576,11 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *func,
 
     if (cif->rtype == &ffi_type_void) {
         which = 0;
-    } else if (cif->rtype->size == 4) {
-        which = 1;
     } else {
-        tcg_debug_assert(cif->rtype->size == 8);
-        which = 2;
+        tcg_debug_assert(cif->rtype->size == 4 ||
+                         cif->rtype->size == 8 ||
+                         cif->rtype->size == 16);
+        which = ctz32(cif->rtype->size) - 1;
     }
     new_pool_l2(s, 20, s->code_ptr, 0, (uintptr_t)func, (uintptr_t)cif);
     insn = deposit32(insn, 0, 8, INDEX_op_call);
-- 
2.34.1


