Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 492BDA0AA5
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 21:45:01 +0200 (CEST)
Received: from localhost ([::1]:41550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i33sJ-00078m-Md
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 15:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38020)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GH-0003h1-Am
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:05:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GB-0000E6-Rw
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:05:41 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:42157)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33GB-0000DQ-9k
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:05:35 -0400
Received: by mail-pl1-x630.google.com with SMTP id y1so389405plp.9
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 12:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zZFuMO58BR7yJyBZdctbi072LRKy0qNYskEijvowE88=;
 b=hFVDvLpRTjVuhLYzbZs7bD9imVqznEDneotv1g18VgeZkBJQfNn3GwOYGO3M4uKZhs
 /3CTkYeXOC8mvnwXh/4y9uUDfGvR92kNMkL9RHZOxFrnVo/bH5M2+NRdNEzIFkWtbEIO
 8Apm71r4is51GOzcskd8vaJKCX2U00FNoDNLcxkeZY+EVnbXT248ynS3snve1KaRIDss
 BLtdxVmh+oFdshjmW/Nju5Z8VTjjQ6adb7tYm8FTNMO9BEaBnVOQv5pBPC1kvG+zXvjG
 0tn88dd1yMKVTqYT6quePmT+UZCPu1fra30Ng48GM/72renTNtq0+qrODsvoqw7tdOJW
 lBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zZFuMO58BR7yJyBZdctbi072LRKy0qNYskEijvowE88=;
 b=WDhsFvzXioR2Nvyc3OWmm1G25jacNJp/g8gldnBtNIfmDnHezcyHnbsyqigTKgt+Bb
 Bf6v7BXJB11VmXetTuu1FwDxrpSINRWL4VDZ+UiT/UsYjGLXDOGI6TtryfN11DRnxQdU
 8BVaa89cmjTP35sy6cvVRRnhBwNCCfZDLNSScVqVWJGUz9f1zeaY+T6cBn32wRX2RYhm
 8H8voUc9wkFITuvziWPcYEXsesTaZy7kzOU4EIgKM6we83h97pEKPOpM/xWREzgLbOVG
 XqujAPl6w0YD6Uf4n6bhp5jhx/QDGjuyfmdF0jRVq7q8joh7AvMq9advS8tpm7rYh7+v
 Jdfw==
X-Gm-Message-State: APjAAAWTnnVqDeourUfYQkE+tmCvFV+7UwKcls4cO+sYvlkT2sTZNzui
 EyNuRDoh6VmVG/oDFxEakuR+VIDMLa8=
X-Google-Smtp-Source: APXvYqw50Q1KIafIDMf/R9xb7VJyfzkAX2ILFNaqsvegisZlsfX4L+ocmCs7Tc0IE389iwT4m6QSVw==
X-Received: by 2002:a17:902:b191:: with SMTP id
 s17mr5972691plr.121.1567019133546; 
 Wed, 28 Aug 2019 12:05:33 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:05:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:13 -0700
Message-Id: <20190828190456.30315-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::630
Subject: [Qemu-devel] [PATCH v3 26/69] target/arm: Convert Signed multiply,
 signed and unsigned divide
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 467 +++++++++++++++++++----------------------
 target/arm/a32.decode  |  22 ++
 target/arm/t32.decode  |  18 ++
 3 files changed, 251 insertions(+), 256 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 86d7330458..9e47c2e0c4 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9518,18 +9518,221 @@ static bool trans_RBIT(DisasContext *s, arg_rr *a)
     return op_rr(s, a, gen_helper_rbit);
 }
 
+/*
+ * Signed multiply, signed and unsigned divide
+ */
+
+static bool op_smlad(DisasContext *s, arg_rrrr *a, bool m_swap, bool sub)
+{
+    TCGv_i32 t1, t2;
+
+    if (!ENABLE_ARCH_6) {
+        return false;
+    }
+
+    t1 = load_reg(s, a->rn);
+    t2 = load_reg(s, a->rm);
+    if (m_swap) {
+        gen_swap_half(t2);
+    }
+    gen_smul_dual(t1, t2);
+
+    if (sub) {
+        /* This subtraction cannot overflow. */
+        tcg_gen_sub_i32(t1, t1, t2);
+    } else {
+        /*
+         * This addition cannot overflow 32 bits; however it may
+         * overflow considered as a signed operation, in which case
+         * we must set the Q flag.
+         */
+        gen_helper_add_setq(t1, cpu_env, t1, t2);
+    }
+    tcg_temp_free_i32(t2);
+
+    if (a->ra != 15) {
+        t2 = load_reg(s, a->ra);
+        gen_helper_add_setq(t1, cpu_env, t1, t2);
+        tcg_temp_free_i32(t2);
+    }
+    store_reg(s, a->rd, t1);
+    return true;
+}
+
+static bool trans_SMLAD(DisasContext *s, arg_rrrr *a)
+{
+    return op_smlad(s, a, false, false);
+}
+
+static bool trans_SMLADX(DisasContext *s, arg_rrrr *a)
+{
+    return op_smlad(s, a, true, false);
+}
+
+static bool trans_SMLSD(DisasContext *s, arg_rrrr *a)
+{
+    return op_smlad(s, a, false, true);
+}
+
+static bool trans_SMLSDX(DisasContext *s, arg_rrrr *a)
+{
+    return op_smlad(s, a, true, true);
+}
+
+static bool op_smlald(DisasContext *s, arg_rrrr *a, bool m_swap, bool sub)
+{
+    TCGv_i32 t1, t2;
+    TCGv_i64 l1, l2;
+
+    if (!ENABLE_ARCH_6) {
+        return false;
+    }
+
+    t1 = load_reg(s, a->rn);
+    t2 = load_reg(s, a->rm);
+    if (m_swap) {
+        gen_swap_half(t2);
+    }
+    gen_smul_dual(t1, t2);
+
+    l1 = tcg_temp_new_i64();
+    l2 = tcg_temp_new_i64();
+    tcg_gen_ext_i32_i64(l1, t1);
+    tcg_gen_ext_i32_i64(l2, t2);
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+
+    if (sub) {
+        tcg_gen_sub_i64(l1, l1, l2);
+    } else {
+        tcg_gen_add_i64(l1, l1, l2);
+    }
+    tcg_temp_free_i64(l2);
+
+    gen_addq(s, l1, a->ra, a->rd);
+    gen_storeq_reg(s, a->ra, a->rd, l1);
+    tcg_temp_free_i64(l1);
+    return true;
+}
+
+static bool trans_SMLALD(DisasContext *s, arg_rrrr *a)
+{
+    return op_smlald(s, a, false, false);
+}
+
+static bool trans_SMLALDX(DisasContext *s, arg_rrrr *a)
+{
+    return op_smlald(s, a, true, false);
+}
+
+static bool trans_SMLSLD(DisasContext *s, arg_rrrr *a)
+{
+    return op_smlald(s, a, false, true);
+}
+
+static bool trans_SMLSLDX(DisasContext *s, arg_rrrr *a)
+{
+    return op_smlald(s, a, true, true);
+}
+
+static bool op_smmla(DisasContext *s, arg_rrrr *a, bool round, bool sub)
+{
+    TCGv_i32 t1, t2;
+
+    if (s->thumb
+        ? !arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)
+        : !ENABLE_ARCH_6) {
+        return false;
+    }
+
+    t1 = load_reg(s, a->rn);
+    t2 = load_reg(s, a->rm);
+    tcg_gen_muls2_i32(t2, t1, t1, t2);
+
+    if (a->ra != 15) {
+        TCGv_i32 t3 = load_reg(s, a->ra);
+        if (sub) {
+            tcg_gen_sub_i32(t1, t1, t3);
+        } else {
+            tcg_gen_add_i32(t1, t1, t3);
+        }
+        tcg_temp_free_i32(t3);
+    }
+    if (round) {
+        /*
+         * Adding 0x80000000 to the 64-bit quantity means that we have
+         * carry in to the high word when the low word has the msb set.
+         */
+        tcg_gen_shri_i32(t2, t2, 31);
+        tcg_gen_add_i32(t1, t1, t2);
+    }
+    tcg_temp_free_i32(t2);
+    store_reg(s, a->rd, t1);
+    return true;
+}
+
+static bool trans_SMMLA(DisasContext *s, arg_rrrr *a)
+{
+    return op_smmla(s, a, false, false);
+}
+
+static bool trans_SMMLAR(DisasContext *s, arg_rrrr *a)
+{
+    return op_smmla(s, a, true, false);
+}
+
+static bool trans_SMMLS(DisasContext *s, arg_rrrr *a)
+{
+    return op_smmla(s, a, false, true);
+}
+
+static bool trans_SMMLSR(DisasContext *s, arg_rrrr *a)
+{
+    return op_smmla(s, a, true, true);
+}
+
+static bool op_div(DisasContext *s, arg_rrr *a, bool u)
+{
+    TCGv_i32 t1, t2;
+
+    if (s->thumb
+        ? !dc_isar_feature(thumb_div, s)
+        : !dc_isar_feature(arm_div, s)) {
+        return false;
+    }
+
+    t1 = load_reg(s, a->rn);
+    t2 = load_reg(s, a->rm);
+    if (u) {
+        gen_helper_udiv(t1, t1, t2);
+    } else {
+        gen_helper_sdiv(t1, t1, t2);
+    }
+    tcg_temp_free_i32(t2);
+    store_reg(s, a->rd, t1);
+    return true;
+}
+
+static bool trans_SDIV(DisasContext *s, arg_rrr *a)
+{
+    return op_div(s, a, false);
+}
+
+static bool trans_UDIV(DisasContext *s, arg_rrr *a)
+{
+    return op_div(s, a, true);
+}
+
 /*
  * Legacy decoder.
  */
 
 static void disas_arm_insn(DisasContext *s, unsigned int insn)
 {
-    unsigned int cond, val, op1, i, rm, rs, rn, rd;
+    unsigned int cond, val, op1, i, rn, rd;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
-    TCGv_i32 tmp3;
     TCGv_i32 addr;
-    TCGv_i64 tmp64;
 
     /* M variants do not implement ARM mode; this must raise the INVSTATE
      * UsageFault exception.
@@ -9812,148 +10015,10 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         switch(op1) {
         case 0x0:
         case 0x1:
-            /* multiplies, extra load/stores */
-            /* All done in decodetree.  Reach here for illegal ops.  */
-            goto illegal_op;
-            break;
         case 0x4:
         case 0x5:
-            goto do_ldst;
         case 0x6:
         case 0x7:
-            if (insn & (1 << 4)) {
-                ARCH(6);
-                /* Armv6 Media instructions.  */
-                rm = insn & 0xf;
-                rn = (insn >> 16) & 0xf;
-                rd = (insn >> 12) & 0xf;
-                rs = (insn >> 8) & 0xf;
-                switch ((insn >> 23) & 3) {
-                case 0: /* Parallel add/subtract.  */
-                    /* Done by decodetree */
-                    goto illegal_op;
-                case 1:
-                    /* Halfword pack, [US]SAT, [US]SAT16, SEL, REV et al */
-                    /* Done by decodetree */
-                    goto illegal_op;
-                case 2: /* Multiplies (Type 3).  */
-                    switch ((insn >> 20) & 0x7) {
-                    case 5:
-                        if (((insn >> 6) ^ (insn >> 7)) & 1) {
-                            /* op2 not 00x or 11x : UNDEF */
-                            goto illegal_op;
-                        }
-                        /* Signed multiply most significant [accumulate].
-                           (SMMUL, SMMLA, SMMLS) */
-                        tmp = load_reg(s, rm);
-                        tmp2 = load_reg(s, rs);
-                        tcg_gen_muls2_i32(tmp2, tmp, tmp, tmp2);
-
-                        if (rd != 15) {
-                            tmp3 = load_reg(s, rd);
-                            if (insn & (1 << 6)) {
-                                tcg_gen_sub_i32(tmp, tmp, tmp3);
-                            } else {
-                                tcg_gen_add_i32(tmp, tmp, tmp3);
-                            }
-                            tcg_temp_free_i32(tmp3);
-                        }
-                        if (insn & (1 << 5)) {
-                            /*
-                             * Adding 0x80000000 to the 64-bit quantity
-                             * means that we have carry in to the high
-                             * word when the low word has the high bit set.
-                             */
-                            tcg_gen_shri_i32(tmp2, tmp2, 31);
-                            tcg_gen_add_i32(tmp, tmp, tmp2);
-                        }
-                        tcg_temp_free_i32(tmp2);
-                        store_reg(s, rn, tmp);
-                        break;
-                    case 0:
-                    case 4:
-                        /* SMLAD, SMUAD, SMLSD, SMUSD, SMLALD, SMLSLD */
-                        if (insn & (1 << 7)) {
-                            goto illegal_op;
-                        }
-                        tmp = load_reg(s, rm);
-                        tmp2 = load_reg(s, rs);
-                        if (insn & (1 << 5))
-                            gen_swap_half(tmp2);
-                        gen_smul_dual(tmp, tmp2);
-                        if (insn & (1 << 22)) {
-                            /* smlald, smlsld */
-                            TCGv_i64 tmp64_2;
-
-                            tmp64 = tcg_temp_new_i64();
-                            tmp64_2 = tcg_temp_new_i64();
-                            tcg_gen_ext_i32_i64(tmp64, tmp);
-                            tcg_gen_ext_i32_i64(tmp64_2, tmp2);
-                            tcg_temp_free_i32(tmp);
-                            tcg_temp_free_i32(tmp2);
-                            if (insn & (1 << 6)) {
-                                tcg_gen_sub_i64(tmp64, tmp64, tmp64_2);
-                            } else {
-                                tcg_gen_add_i64(tmp64, tmp64, tmp64_2);
-                            }
-                            tcg_temp_free_i64(tmp64_2);
-                            gen_addq(s, tmp64, rd, rn);
-                            gen_storeq_reg(s, rd, rn, tmp64);
-                            tcg_temp_free_i64(tmp64);
-                        } else {
-                            /* smuad, smusd, smlad, smlsd */
-                            if (insn & (1 << 6)) {
-                                /* This subtraction cannot overflow. */
-                                tcg_gen_sub_i32(tmp, tmp, tmp2);
-                            } else {
-                                /* This addition cannot overflow 32 bits;
-                                 * however it may overflow considered as a
-                                 * signed operation, in which case we must set
-                                 * the Q flag.
-                                 */
-                                gen_helper_add_setq(tmp, cpu_env, tmp, tmp2);
-                            }
-                            tcg_temp_free_i32(tmp2);
-                            if (rd != 15)
-                              {
-                                tmp2 = load_reg(s, rd);
-                                gen_helper_add_setq(tmp, cpu_env, tmp, tmp2);
-                                tcg_temp_free_i32(tmp2);
-                              }
-                            store_reg(s, rn, tmp);
-                        }
-                        break;
-                    case 1:
-                    case 3:
-                        /* SDIV, UDIV */
-                        if (!dc_isar_feature(arm_div, s)) {
-                            goto illegal_op;
-                        }
-                        if (((insn >> 5) & 7) || (rd != 15)) {
-                            goto illegal_op;
-                        }
-                        tmp = load_reg(s, rm);
-                        tmp2 = load_reg(s, rs);
-                        if (insn & (1 << 21)) {
-                            gen_helper_udiv(tmp, tmp, tmp2);
-                        } else {
-                            gen_helper_sdiv(tmp, tmp, tmp2);
-                        }
-                        tcg_temp_free_i32(tmp2);
-                        store_reg(s, rn, tmp);
-                        break;
-                    default:
-                        goto illegal_op;
-                    }
-                    break;
-                case 3:
-                    /* USAD, BFI, BFC, SBFX, UBFX */
-                    /* Done by decodetree */
-                    goto illegal_op;
-                }
-                break;
-            }
-        do_ldst:
             /* All done in decodetree.  Reach here for illegal ops.  */
             goto illegal_op;
         case 0x08:
@@ -10175,9 +10240,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
     uint32_t rd, rn, rm, rs;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
-    TCGv_i32 tmp3;
     TCGv_i32 addr;
-    TCGv_i64 tmp64;
     int op;
 
     /*
@@ -10438,119 +10501,11 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
         case 2: /* SIMD add/subtract, in decodetree */
         case 3: /* Other data processing, in decodetree */
             goto illegal_op;
-        case 4: case 5: /* 32-bit multiply.  Sum of absolute differences.  */
-            switch ((insn >> 20) & 7) {
-            case 0: /* 32 x 32 -> 32 */
-            case 1: /* 16 x 16 -> 32 */
-            case 3: /* 32 * 16 -> 32msb */
-            case 7: /* Unsigned sum of absolute differences.  */
-                /* in decodetree */
-                goto illegal_op;
-            case 2: /* Dual multiply add.  */
-            case 4: /* Dual multiply subtract.  */
-            case 5: case 6: /* 32 * 32 -> 32msb (SMMUL, SMMLA, SMMLS) */
-                if (!arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)) {
-                    goto illegal_op;
-                }
-                break;
-            }
-            op = (insn >> 4) & 0xf;
-            tmp = load_reg(s, rn);
-            tmp2 = load_reg(s, rm);
-            switch ((insn >> 20) & 7) {
-            case 2: /* Dual multiply add.  */
-            case 4: /* Dual multiply subtract.  */
-                if (op)
-                    gen_swap_half(tmp2);
-                gen_smul_dual(tmp, tmp2);
-                if (insn & (1 << 22)) {
-                    /* This subtraction cannot overflow. */
-                    tcg_gen_sub_i32(tmp, tmp, tmp2);
-                } else {
-                    /* This addition cannot overflow 32 bits;
-                     * however it may overflow considered as a signed
-                     * operation, in which case we must set the Q flag.
-                     */
-                    gen_helper_add_setq(tmp, cpu_env, tmp, tmp2);
-                }
-                tcg_temp_free_i32(tmp2);
-                if (rs != 15)
-                  {
-                    tmp2 = load_reg(s, rs);
-                    gen_helper_add_setq(tmp, cpu_env, tmp, tmp2);
-                    tcg_temp_free_i32(tmp2);
-                  }
-                break;
-            case 5: case 6: /* 32 * 32 -> 32msb (SMMUL, SMMLA, SMMLS) */
-                tcg_gen_muls2_i32(tmp2, tmp, tmp, tmp2);
-                if (rs != 15) {
-                    tmp3 = load_reg(s, rs);
-                    if (insn & (1 << 20)) {
-                        tcg_gen_add_i32(tmp, tmp, tmp3);
-                    } else {
-                        tcg_gen_sub_i32(tmp, tmp, tmp3);
-                    }
-                    tcg_temp_free_i32(tmp3);
-                }
-                if (insn & (1 << 4)) {
-                    /*
-                     * Adding 0x80000000 to the 64-bit quantity
-                     * means that we have carry in to the high
-                     * word when the low word has the high bit set.
-                     */
-                    tcg_gen_shri_i32(tmp2, tmp2, 31);
-                    tcg_gen_add_i32(tmp, tmp, tmp2);
-                }
-                tcg_temp_free_i32(tmp2);
-                break;
-            }
-            store_reg(s, rd, tmp);
-            break;
-        case 6: case 7: /* 64-bit multiply, Divide.  */
-            op = ((insn >> 4) & 0xf) | ((insn >> 16) & 0x70);
-            tmp = load_reg(s, rn);
-            tmp2 = load_reg(s, rm);
-            if ((op & 0x50) == 0x10) {
-                /* sdiv, udiv */
-                if (!dc_isar_feature(thumb_div, s)) {
-                    goto illegal_op;
-                }
-                if (op & 0x20)
-                    gen_helper_udiv(tmp, tmp, tmp2);
-                else
-                    gen_helper_sdiv(tmp, tmp, tmp2);
-                tcg_temp_free_i32(tmp2);
-                store_reg(s, rd, tmp);
-            } else if ((op & 0xe) == 0xc) {
-                /* Dual multiply accumulate long.  */
-                if (!arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)) {
-                    tcg_temp_free_i32(tmp);
-                    tcg_temp_free_i32(tmp2);
-                    goto illegal_op;
-                }
-                if (op & 1)
-                    gen_swap_half(tmp2);
-                gen_smul_dual(tmp, tmp2);
-                if (op & 0x10) {
-                    tcg_gen_sub_i32(tmp, tmp, tmp2);
-                } else {
-                    tcg_gen_add_i32(tmp, tmp, tmp2);
-                }
-                tcg_temp_free_i32(tmp2);
-                /* BUGFIX */
-                tmp64 = tcg_temp_new_i64();
-                tcg_gen_ext_i32_i64(tmp64, tmp);
-                tcg_temp_free_i32(tmp);
-                gen_addq(s, tmp64, rs, rd);
-                gen_storeq_reg(s, rs, rd, tmp64);
-                tcg_temp_free_i64(tmp64);
-            } else {
-                /* Signed/unsigned 64-bit multiply, in decodetree */
-                tcg_temp_free_i32(tmp2);
-                tcg_temp_free_i32(tmp);
-                goto illegal_op;
-            }
-            break;
+        case 4: case 5:
+            /* 32-bit multiply.  Sum of absolute differences, in decodetree */
+            goto illegal_op;
+        case 6: case 7: /* 64-bit multiply, Divide, in decodetree */
+            goto illegal_op;
         }
         break;
     case 6: case 7: case 14: case 15:
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index 4990eb3839..d7a333b90b 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -486,3 +486,25 @@ REV              .... 0110 1011 1111 .... 1111 0011 ....      @rdm
 REV16            .... 0110 1011 1111 .... 1111 1011 ....      @rdm
 REVSH            .... 0110 1111 1111 .... 1111 1011 ....      @rdm
 RBIT             .... 0110 1111 1111 .... 1111 0011 ....      @rdm
+
+# Signed multiply, signed and unsigned divide
+
+@rdmn            ---- .... .... rd:4 .... rm:4 .... rn:4      &rrr
+
+SMLAD            .... 0111 0000 .... .... .... 0001 ....      @rdamn
+SMLADX           .... 0111 0000 .... .... .... 0011 ....      @rdamn
+SMLSD            .... 0111 0000 .... .... .... 0101 ....      @rdamn
+SMLSDX           .... 0111 0000 .... .... .... 0111 ....      @rdamn
+
+SDIV             .... 0111 0001 .... 1111 .... 0001 ....      @rdmn
+UDIV             .... 0111 0011 .... 1111 .... 0001 ....      @rdmn
+
+SMLALD           .... 0111 0100 .... .... .... 0001 ....      @rdamn
+SMLALDX          .... 0111 0100 .... .... .... 0011 ....      @rdamn
+SMLSLD           .... 0111 0100 .... .... .... 0101 ....      @rdamn
+SMLSLDX          .... 0111 0100 .... .... .... 0111 ....      @rdamn
+
+SMMLA            .... 0111 0101 .... .... .... 0001 ....      @rdamn
+SMMLAR           .... 0111 0101 .... .... .... 0011 ....      @rdamn
+SMMLS            .... 0111 0101 .... .... .... 1101 ....      @rdamn
+SMMLSR           .... 0111 0101 .... .... .... 1111 ....      @rdamn
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 71f6d728f2..677acb698d 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -228,6 +228,24 @@ SMLALTT          1111 1011 1100 .... .... .... 1011 ....      @rnadm
 # usad8 is usada8 w/ ra=15
 USADA8           1111 1011 0111 .... .... .... 0000 ....      @rnadm
 
+SMLAD            1111 1011 0010 .... .... .... 0000 ....      @rnadm
+SMLADX           1111 1011 0010 .... .... .... 0001 ....      @rnadm
+SMLSD            1111 1011 0100 .... .... .... 0000 ....      @rnadm
+SMLSDX           1111 1011 0100 .... .... .... 0001 ....      @rnadm
+
+SMLALD           1111 1011 1100 .... .... .... 1100 ....      @rnadm
+SMLALDX          1111 1011 1100 .... .... .... 1101 ....      @rnadm
+SMLSLD           1111 1011 1101 .... .... .... 1100 ....      @rnadm
+SMLSLDX          1111 1011 1101 .... .... .... 1101 ....      @rnadm
+
+SMMLA            1111 1011 0101 .... .... .... 0000 ....      @rnadm
+SMMLAR           1111 1011 0101 .... .... .... 0001 ....      @rnadm
+SMMLS            1111 1011 0110 .... .... .... 0000 ....      @rnadm
+SMMLSR           1111 1011 0110 .... .... .... 0001 ....      @rnadm
+
+SDIV             1111 1011 1001 .... 1111 .... 1111 ....      @rndm
+UDIV             1111 1011 1011 .... 1111 .... 1111 ....      @rndm
+
 # Data-processing (two source registers)
 
 QADD             1111 1010 1000 .... 1111 .... 1000 ....      @rndm
-- 
2.17.1


