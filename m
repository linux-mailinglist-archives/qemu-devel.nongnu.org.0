Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FDD39C117
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 22:14:08 +0200 (CEST)
Received: from localhost ([::1]:50452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpGCl-0000Ck-59
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 16:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGAz-0005d2-1v
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:17 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:46887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGAv-0005Hn-E3
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:16 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso6475962pjb.5
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 13:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uhnv3DU/ab7lvFoOWhro8SY6YuqOZ4zZG1TsE9eSUIo=;
 b=LsnID9M0mQbsIrOv6l8JaAX0UXp3Xcnb9vzhFbMQyk1KQ5ADFLtmd1uOFLoYGENCOO
 wpwbsVqklpozFJBKSmgXbqaR71zRlBI58wloJV4azRQezKPnL3j7omJX+5aVSJUmF9cy
 MMlcTdfSpFmpLpLgUQptFa/Fz+sf8BVA1Mx8RihoqCi7Qm+c/7IpTEAy4m34//28WU9e
 qRB5dacvjIrtJAGKYdwe5rQ8o+PBwlWvb87nXrRxVI+V9jlk3eFlkKYATZ+BOk0xZrQE
 ZHaWb28rP7W4uuJr1Mv3Ts95Ah8wKqrkn6fckNl4iA/ToYJeXTSC3/uMTsdcd64YBAy3
 GK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uhnv3DU/ab7lvFoOWhro8SY6YuqOZ4zZG1TsE9eSUIo=;
 b=b02a/CkEw1folffFY8Uy4A3FIDw3ykazKDF0NW+pUfn76qH6sUwUHeWlTJIVa1H8GA
 2KLvSDXvfkPsSlqtsBIAIaH+fF5aLN//pHwLOx2mflXAj/OK/gX8WcHEXD4Ec97ucju6
 +w34suRGG6uMbiBdWFOPtV8SYK6rTubGwMPClwBzM4AjnXaQExgD/+qT26H+IceNMhot
 vQs7i8heeHuhR/Hpnp5Ea2rKqsIMe8+h7m8+iyhIywsxImYBmvCbSJ7arLM2eGA0nFes
 qTPf3w5kNjepSaMMTMyysn9T7W2uqBLsZ2QAP+/tmm6iGTjWgVQORLJ179ZTNg/arQJ8
 WzTQ==
X-Gm-Message-State: AOAM533kF0TQXZHP1HqrOihBPSK2KhnM7fpWno46Zn2WuPEVVfVN/owB
 4vJtrGLSXrOC1vkiGGub/+MgkVcsI4hBlg==
X-Google-Smtp-Source: ABdhPJwJ/JmI0bwtn4sH+HoLwpCbSU06J0hPQgMtuG0n0ub1vzuSlWDC4ygMm8bBGMEN/EbxGTfZbQ==
X-Received: by 2002:a17:902:a50b:b029:f7:820f:fd1c with SMTP id
 s11-20020a170902a50bb02900f7820ffd1cmr6018701plq.69.1622837532033; 
 Fri, 04 Jun 2021 13:12:12 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id a129sm2422599pfa.118.2021.06.04.13.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 13:12:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/15] tcg/arm: Add host vector framework
Date: Fri,  4 Jun 2021 13:11:57 -0700
Message-Id: <20210604201210.920136-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604201210.920136-1-richard.henderson@linaro.org>
References: <20210604201210.920136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Add registers and function stubs.  The functionality
is disabled via use_neon_instructions defined to 0.

We must still include results for the mandatory opcodes in
tcg_target_op_def, as all opcodes are checked during tcg init.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target-con-set.h |   4 ++
 tcg/arm/tcg-target-con-str.h |   1 +
 tcg/arm/tcg-target.h         |  48 ++++++++++++--
 tcg/arm/tcg-target.opc.h     |  12 ++++
 tcg/arm/tcg-target.c.inc     | 117 +++++++++++++++++++++++++++++------
 5 files changed, 158 insertions(+), 24 deletions(-)
 create mode 100644 tcg/arm/tcg-target.opc.h

diff --git a/tcg/arm/tcg-target-con-set.h b/tcg/arm/tcg-target-con-set.h
index ab63e089c2..27aced5391 100644
--- a/tcg/arm/tcg-target-con-set.h
+++ b/tcg/arm/tcg-target-con-set.h
@@ -13,11 +13,14 @@ C_O0_I1(r)
 C_O0_I2(r, r)
 C_O0_I2(r, rIN)
 C_O0_I2(s, s)
+C_O0_I2(w, r)
 C_O0_I3(s, s, s)
 C_O0_I4(r, r, rI, rI)
 C_O0_I4(s, s, s, s)
 C_O1_I1(r, l)
 C_O1_I1(r, r)
+C_O1_I1(w, r)
+C_O1_I1(w, wr)
 C_O1_I2(r, 0, rZ)
 C_O1_I2(r, l, l)
 C_O1_I2(r, r, r)
@@ -26,6 +29,7 @@ C_O1_I2(r, r, rIK)
 C_O1_I2(r, r, rIN)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, rZ, rZ)
+C_O1_I2(w, w, w)
 C_O1_I4(r, r, r, rI, rI)
 C_O1_I4(r, r, rIN, rIK, 0)
 C_O2_I1(r, r, l)
diff --git a/tcg/arm/tcg-target-con-str.h b/tcg/arm/tcg-target-con-str.h
index a0ab7747db..255a1ae0e2 100644
--- a/tcg/arm/tcg-target-con-str.h
+++ b/tcg/arm/tcg-target-con-str.h
@@ -11,6 +11,7 @@
 REGS('r', ALL_GENERAL_REGS)
 REGS('l', ALL_QLOAD_REGS)
 REGS('s', ALL_QSTORE_REGS)
+REGS('w', ALL_VECTOR_REGS)
 
 /*
  * Define constraint letters for constants:
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 8d1fee6327..a9dc09bd08 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -78,19 +78,38 @@ typedef enum {
     TCG_REG_R13,
     TCG_REG_R14,
     TCG_REG_PC,
+
+    TCG_REG_Q0,
+    TCG_REG_Q1,
+    TCG_REG_Q2,
+    TCG_REG_Q3,
+    TCG_REG_Q4,
+    TCG_REG_Q5,
+    TCG_REG_Q6,
+    TCG_REG_Q7,
+    TCG_REG_Q8,
+    TCG_REG_Q9,
+    TCG_REG_Q10,
+    TCG_REG_Q11,
+    TCG_REG_Q12,
+    TCG_REG_Q13,
+    TCG_REG_Q14,
+    TCG_REG_Q15,
+
+    TCG_AREG0 = TCG_REG_R6,
+    TCG_REG_CALL_STACK = TCG_REG_R13,
 } TCGReg;
 
-#define TCG_TARGET_NB_REGS 16
+#define TCG_TARGET_NB_REGS 32
 
 #ifdef __ARM_ARCH_EXT_IDIV__
 #define use_idiv_instructions  1
 #else
 extern bool use_idiv_instructions;
 #endif
-
+#define use_neon_instructions  0
 
 /* used for function call generation */
-#define TCG_REG_CALL_STACK		TCG_REG_R13
 #define TCG_TARGET_STACK_ALIGN		8
 #define TCG_TARGET_CALL_ALIGN_ARGS	1
 #define TCG_TARGET_CALL_STACK_OFFSET	0
@@ -128,9 +147,26 @@ extern bool use_idiv_instructions;
 #define TCG_TARGET_HAS_direct_jump      0
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
-enum {
-    TCG_AREG0 = TCG_REG_R6,
-};
+#define TCG_TARGET_HAS_v64              use_neon_instructions
+#define TCG_TARGET_HAS_v128             use_neon_instructions
+#define TCG_TARGET_HAS_v256             0
+
+#define TCG_TARGET_HAS_andc_vec         0
+#define TCG_TARGET_HAS_orc_vec          0
+#define TCG_TARGET_HAS_not_vec          0
+#define TCG_TARGET_HAS_neg_vec          0
+#define TCG_TARGET_HAS_abs_vec          0
+#define TCG_TARGET_HAS_roti_vec         0
+#define TCG_TARGET_HAS_rots_vec         0
+#define TCG_TARGET_HAS_rotv_vec         0
+#define TCG_TARGET_HAS_shi_vec          0
+#define TCG_TARGET_HAS_shs_vec          0
+#define TCG_TARGET_HAS_shv_vec          0
+#define TCG_TARGET_HAS_mul_vec          0
+#define TCG_TARGET_HAS_sat_vec          0
+#define TCG_TARGET_HAS_minmax_vec       0
+#define TCG_TARGET_HAS_bitsel_vec       0
+#define TCG_TARGET_HAS_cmpsel_vec       0
 
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
diff --git a/tcg/arm/tcg-target.opc.h b/tcg/arm/tcg-target.opc.h
new file mode 100644
index 0000000000..7a4578e9b4
--- /dev/null
+++ b/tcg/arm/tcg-target.opc.h
@@ -0,0 +1,12 @@
+/*
+ * Copyright (c) 2019 Linaro
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * (at your option) any later version.
+ *
+ * See the COPYING file in the top-level directory for details.
+ *
+ * Target-specific opcodes for host vector expansion.  These will be
+ * emitted by tcg_expand_vec_op.  For those familiar with GCC internals,
+ * consider these to be UNSPEC with names.
+ */
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index eb4f42e53d..4770d0c537 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -40,22 +40,10 @@ bool use_idiv_instructions;
 
 #ifdef CONFIG_DEBUG_TCG
 static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
-    "%r0",
-    "%r1",
-    "%r2",
-    "%r3",
-    "%r4",
-    "%r5",
-    "%r6",
-    "%r7",
-    "%r8",
-    "%r9",
-    "%r10",
-    "%r11",
-    "%r12",
-    "%r13",
-    "%r14",
-    "%pc",
+    "%r0",  "%r1",  "%r2",  "%r3",  "%r4",  "%r5",  "%r6",  "%r7",
+    "%r8",  "%r9",  "%r10", "%r11", "%r12", "%sp",  "%r14", "%pc",
+    "%q0",  "%q1",  "%q2",  "%q3",  "%q4",  "%q5",  "%q6",  "%q7",
+    "%q8",  "%q9",  "%q10", "%q11", "%q12", "%q13", "%q14", "%q15",
 };
 #endif
 
@@ -75,6 +63,20 @@ static const int tcg_target_reg_alloc_order[] = {
     TCG_REG_R3,
     TCG_REG_R12,
     TCG_REG_R14,
+
+    TCG_REG_Q0,
+    TCG_REG_Q1,
+    TCG_REG_Q2,
+    TCG_REG_Q3,
+    /* Q4 - Q7 are call-saved, and skipped. */
+    TCG_REG_Q8,
+    TCG_REG_Q9,
+    TCG_REG_Q10,
+    TCG_REG_Q11,
+    TCG_REG_Q12,
+    TCG_REG_Q13,
+    TCG_REG_Q14,
+    TCG_REG_Q15,
 };
 
 static const int tcg_target_call_iarg_regs[4] = {
@@ -85,6 +87,7 @@ static const int tcg_target_call_oarg_regs[2] = {
 };
 
 #define TCG_REG_TMP  TCG_REG_R12
+#define TCG_VEC_TMP  TCG_REG_Q15
 
 enum arm_cond_code_e {
     COND_EQ = 0x0,
@@ -238,6 +241,7 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 #define TCG_CT_CONST_ZERO 0x800
 
 #define ALL_GENERAL_REGS  0xffffu
+#define ALL_VECTOR_REGS   0xffff0000u
 
 /*
  * r0-r2 will be overwritten when reading the tlb entry (softmmu only)
@@ -2117,6 +2121,22 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_qemu_st_i64:
         return TARGET_LONG_BITS == 32 ? C_O0_I3(s, s, s) : C_O0_I4(s, s, s, s);
 
+    case INDEX_op_st_vec:
+        return C_O0_I2(w, r);
+    case INDEX_op_ld_vec:
+    case INDEX_op_dupm_vec:
+        return C_O1_I1(w, r);
+    case INDEX_op_dup_vec:
+        return C_O1_I1(w, wr);
+    case INDEX_op_dup2_vec:
+    case INDEX_op_add_vec:
+    case INDEX_op_sub_vec:
+    case INDEX_op_xor_vec:
+    case INDEX_op_or_vec:
+    case INDEX_op_and_vec:
+    case INDEX_op_cmp_vec:
+        return C_O1_I2(w, w, w);
+
     default:
         g_assert_not_reached();
     }
@@ -2126,12 +2146,18 @@ static void tcg_target_init(TCGContext *s)
 {
     /* Only probe for the platform and capabilities if we havn't already
        determined maximum values at compile time.  */
-#ifndef use_idiv_instructions
+#if !defined(use_idiv_instructions) || !defined(use_neon_instructions)
     {
         unsigned long hwcap = qemu_getauxval(AT_HWCAP);
+#ifndef use_idiv_instructions
         use_idiv_instructions = (hwcap & HWCAP_ARM_IDIVA) != 0;
+#endif
+#ifndef use_neon_instructions
+        use_neon_instructions = (hwcap & HWCAP_ARM_NEON) != 0;
+#endif
     }
 #endif
+
     if (__ARM_ARCH < 7) {
         const char *pl = (const char *)qemu_getauxval(AT_PLATFORM);
         if (pl != NULL && pl[0] == 'v' && pl[1] >= '4' && pl[1] <= '9') {
@@ -2139,7 +2165,7 @@ static void tcg_target_init(TCGContext *s)
         }
     }
 
-    tcg_target_available_regs[TCG_TYPE_I32] = 0xffff;
+    tcg_target_available_regs[TCG_TYPE_I32] = ALL_GENERAL_REGS;
 
     tcg_target_call_clobber_regs = 0;
     tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_R0);
@@ -2149,10 +2175,29 @@ static void tcg_target_init(TCGContext *s)
     tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_R12);
     tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_R14);
 
+    if (use_neon_instructions) {
+        tcg_target_available_regs[TCG_TYPE_V64]  = ALL_VECTOR_REGS;
+        tcg_target_available_regs[TCG_TYPE_V128] = ALL_VECTOR_REGS;
+
+        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q0);
+        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q1);
+        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q2);
+        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q3);
+        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q8);
+        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q9);
+        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q10);
+        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q11);
+        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q12);
+        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q13);
+        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q14);
+        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q15);
+    }
+
     s->reserved_regs = 0;
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_CALL_STACK);
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP);
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_PC);
+    tcg_regset_set_reg(s->reserved_regs, TCG_VEC_TMP);
 }
 
 static inline void tcg_out_ld(TCGContext *s, TCGType type, TCGReg arg,
@@ -2186,6 +2231,42 @@ static inline void tcg_out_movi(TCGContext *s, TCGType type,
     tcg_out_movi32(s, COND_AL, ret, arg);
 }
 
+static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
+                            TCGReg rd, TCGReg rs)
+{
+    g_assert_not_reached();
+}
+
+static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
+                             TCGReg rd, TCGReg base, intptr_t offset)
+{
+    g_assert_not_reached();
+}
+
+static void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
+                             TCGReg rd, int64_t v64)
+{
+    g_assert_not_reached();
+}
+
+static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
+                           unsigned vecl, unsigned vece,
+                           const TCGArg *args, const int *const_args)
+{
+    g_assert_not_reached();
+}
+
+int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
+{
+    return 0;
+}
+
+void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
+                       TCGArg a0, ...)
+{
+    g_assert_not_reached();
+}
+
 static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
 {
     int i;
-- 
2.25.1


