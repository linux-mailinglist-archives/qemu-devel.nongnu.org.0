Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AAD95012
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 23:47:43 +0200 (CEST)
Received: from localhost ([::1]:59044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzpV8-0003Il-6d
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 17:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58653)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpLw-0001Pi-0b
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:38:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpLu-00063j-0q
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:38:11 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:34694)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpLt-00063C-Pj
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:38:09 -0400
Received: by mail-pg1-x541.google.com with SMTP id n9so1937691pgc.1
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 14:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FEq/15vwK0NtvonTorhtMB0UzZJdmnn/K7430AdfD8A=;
 b=pDgHGQTvtWD9v7//JnAoxbksZBnn4fm+ErQMWxRQfArAwuH2240nTec14sB5LiVvrz
 oodfUhw6RYsVExpO2f7IQFVvcTbTdADY7W6uQ8aztdnaA0/whKlrgjggFascME8q4JRI
 FJ1csZzA2mAs1+wK9fk4NvP0Dru2sidK1QeQZmYo1iIiNpFCIji1/yByQuJmM8funebt
 FJqKTSnmJlM6NRbW6VTO5d881yJsvDdcX4Rsfsr5rrNbYhe07S/8AqVq3Gd78nqJBqsb
 W375XbuhG/j4XYT8YXXjxovcT30ZY/R8PGdRg7kKvZ0m36QgX9FAOUAE0i9TECskNdKz
 VKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FEq/15vwK0NtvonTorhtMB0UzZJdmnn/K7430AdfD8A=;
 b=Qi5GpfOC6xqornlAgNuqHIKWY78OgnYMQUi9XmBSfL/8oAj7lOgj5OWRPuq3Lm48w3
 ICi28nx39b8M9FUy1bgYObXcVsUg/dPqyhpVA9ceIlWKj5IyTVGgiTFXTmhg7KyvNNe7
 8E4HWx5mKVI7B4PqGauQDrUnBRZ8zpKZzIKlpwHcXc+i59vZQWsfKC1hQSi7dZvi7ruC
 O9pSaTSFleRciiA2od4c+HpIRXG5BnYphDypKrnvnc6zrYA0hwhYhqP4ydLnLY28O5Ua
 XkqK1iXLqzbMe6xkLsJncSsc7JG460f3fnUo6zisoK4YPmd3aPRxsFr4gmmCRpvmI9uX
 TEWA==
X-Gm-Message-State: APjAAAU2JlXMDQWuFThshMFLBujIq4cm3L2iuQHsxTEUnP3C3rCe6PhX
 oNaW3d+QNwhI7d0kzvmEk4gr8FX6uUM=
X-Google-Smtp-Source: APXvYqwwNNO9HmbyrvQImg2wKuv0p89aLKziEXqs3raoGb8wPp/s8/7dcbF3q28yTI/76r9S/LdBPQ==
X-Received: by 2002:a63:3dcd:: with SMTP id k196mr22099424pga.45.1566250688223; 
 Mon, 19 Aug 2019 14:38:08 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:36:56 -0700
Message-Id: <20190819213755.26175-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-devel] [PATCH v2 09/68] target/arm: Convert Halfword multiply
 and multiply accumulate
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 218 +++++++++++++++++++++++------------------
 target/arm/a32.decode  |  20 ++++
 target/arm/t32.decode  |  29 ++++++
 3 files changed, 170 insertions(+), 97 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index b731e08fe4..56ae83a7d0 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8141,6 +8141,117 @@ DO_QADDSUB(QDSUB, false, true)
 
 #undef DO_QADDSUB
 
+/*
+ * Halfword multiply and multiply accumulate
+ */
+
+static bool op_smlaxxx(DisasContext *s, arg_rrrr *a,
+                       int add_long, bool nt, bool mt)
+{
+    TCGv_i32 t0, t1;
+    TCGv_i64 t64;
+
+    if (s->thumb
+        ? !arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)
+        : !ENABLE_ARCH_5TE) {
+        return false;
+    }
+
+    t0 = load_reg(s, a->rn);
+    t1 = load_reg(s, a->rm);
+    gen_mulxy(t0, t1, nt, mt);
+    tcg_temp_free_i32(t1);
+
+    switch (add_long) {
+    case 0:
+        store_reg(s, a->rd, t0);
+        break;
+    case 1:
+        t1 = load_reg(s, a->ra);
+        gen_helper_add_setq(t0, cpu_env, t0, t1);
+        tcg_temp_free_i32(t1);
+        store_reg(s, a->rd, t0);
+        break;
+    case 2:
+        t64 = tcg_temp_new_i64();
+        tcg_gen_ext_i32_i64(t64, t0);
+        tcg_temp_free_i32(t0);
+        gen_addq(s, t64, a->ra, a->rd);
+        gen_storeq_reg(s, a->ra, a->rd, t64);
+        tcg_temp_free_i64(t64);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    return true;
+}
+
+#define DO_SMLAX(NAME, add, nt, mt) \
+static bool trans_##NAME(DisasContext *s, arg_rrrr *a)     \
+{                                                          \
+    return op_smlaxxx(s, a, add, nt, mt);                  \
+}
+
+DO_SMLAX(SMULBB, 0, 0, 0)
+DO_SMLAX(SMULBT, 0, 0, 1)
+DO_SMLAX(SMULTB, 0, 1, 0)
+DO_SMLAX(SMULTT, 0, 1, 1)
+
+DO_SMLAX(SMLABB, 1, 0, 0)
+DO_SMLAX(SMLABT, 1, 0, 1)
+DO_SMLAX(SMLATB, 1, 1, 0)
+DO_SMLAX(SMLATT, 1, 1, 1)
+
+DO_SMLAX(SMLALBB, 2, 0, 0)
+DO_SMLAX(SMLALBT, 2, 0, 1)
+DO_SMLAX(SMLALTB, 2, 1, 0)
+DO_SMLAX(SMLALTT, 2, 1, 1)
+
+#undef DO_SMLAX
+
+static bool op_smlawx(DisasContext *s, arg_rrrr *a, bool add, bool mt)
+{
+    TCGv_i32 t0, t1;
+    TCGv_i64 t64;
+
+    if (!ENABLE_ARCH_5TE) {
+        return false;
+    }
+
+    t0 = load_reg(s, a->rn);
+    t1 = load_reg(s, a->rm);
+    if (mt) {
+        tcg_gen_sari_i32(t1, t1, 16);
+    } else {
+        gen_sxth(t1);
+    }
+    t64 = gen_muls_i64_i32(t0, t1);
+    tcg_gen_shri_i64(t64, t64, 16);
+    t1 = tcg_temp_new_i32();
+    tcg_gen_extrl_i64_i32(t1, t64);
+    tcg_temp_free_i64(t64);
+    if (add) {
+        t0 = load_reg(s, a->ra);
+        gen_helper_add_setq(t1, cpu_env, t1, t0);
+        tcg_temp_free_i32(t0);
+    }
+    store_reg(s, a->rd, t1);
+    return true;
+}
+
+#define DO_SMLAWX(NAME, add, mt) \
+static bool trans_##NAME(DisasContext *s, arg_rrrr *a)     \
+{                                                          \
+    return op_smlawx(s, a, add, mt);                       \
+}
+
+DO_SMLAWX(SMULWB, 0, 0)
+DO_SMLAWX(SMULWT, 0, 1)
+DO_SMLAWX(SMLAWB, 1, 0)
+DO_SMLAWX(SMLAWT, 1, 1)
+
+#undef DO_SMLAWX
+
 /*
  * Legacy decoder.
  */
@@ -8607,56 +8718,13 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             }
             break;
         }
-        case 0x8: /* signed multiply */
+        case 0x8:
         case 0xa:
         case 0xc:
         case 0xe:
-            ARCH(5TE);
-            rs = (insn >> 8) & 0xf;
-            rn = (insn >> 12) & 0xf;
-            rd = (insn >> 16) & 0xf;
-            if (op1 == 1) {
-                /* (32 * 16) >> 16 */
-                tmp = load_reg(s, rm);
-                tmp2 = load_reg(s, rs);
-                if (sh & 4)
-                    tcg_gen_sari_i32(tmp2, tmp2, 16);
-                else
-                    gen_sxth(tmp2);
-                tmp64 = gen_muls_i64_i32(tmp, tmp2);
-                tcg_gen_shri_i64(tmp64, tmp64, 16);
-                tmp = tcg_temp_new_i32();
-                tcg_gen_extrl_i64_i32(tmp, tmp64);
-                tcg_temp_free_i64(tmp64);
-                if ((sh & 2) == 0) {
-                    tmp2 = load_reg(s, rn);
-                    gen_helper_add_setq(tmp, cpu_env, tmp, tmp2);
-                    tcg_temp_free_i32(tmp2);
-                }
-                store_reg(s, rd, tmp);
-            } else {
-                /* 16 * 16 */
-                tmp = load_reg(s, rm);
-                tmp2 = load_reg(s, rs);
-                gen_mulxy(tmp, tmp2, sh & 2, sh & 4);
-                tcg_temp_free_i32(tmp2);
-                if (op1 == 2) {
-                    tmp64 = tcg_temp_new_i64();
-                    tcg_gen_ext_i32_i64(tmp64, tmp);
-                    tcg_temp_free_i32(tmp);
-                    gen_addq(s, tmp64, rn, rd);
-                    gen_storeq_reg(s, rn, rd, tmp64);
-                    tcg_temp_free_i64(tmp64);
-                } else {
-                    if (op1 == 0) {
-                        tmp2 = load_reg(s, rn);
-                        gen_helper_add_setq(tmp, cpu_env, tmp, tmp2);
-                        tcg_temp_free_i32(tmp2);
-                    }
-                    store_reg(s, rd, tmp);
-                }
-            }
-            break;
+            /* Halfword multiply and multiply accumulate.  */
+            /* All done in decodetree.  Reach here for illegal ops.  */
+            goto illegal_op;
         default:
             goto illegal_op;
         }
@@ -10108,13 +10176,14 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
             break;
         case 4: case 5: /* 32-bit multiply.  Sum of absolute differences.  */
             switch ((insn >> 20) & 7) {
-            case 0: /* 32 x 32 -> 32, in decodetree */
+            case 0: /* 32 x 32 -> 32 */
+            case 1: /* 16 x 16 -> 32 */
+            case 3: /* 32 * 16 -> 32msb */
+                /* in decodetree */
                 goto illegal_op;
             case 7: /* Unsigned sum of absolute differences.  */
                 break;
-            case 1: /* 16 x 16 -> 32 */
             case 2: /* Dual multiply add.  */
-            case 3: /* 32 * 16 -> 32msb */
             case 4: /* Dual multiply subtract.  */
             case 5: case 6: /* 32 * 32 -> 32msb (SMMUL, SMMLA, SMMLS) */
                 if (!arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)) {
@@ -10126,15 +10195,6 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
             tmp = load_reg(s, rn);
             tmp2 = load_reg(s, rm);
             switch ((insn >> 20) & 7) {
-            case 1: /* 16 x 16 -> 32 */
-                gen_mulxy(tmp, tmp2, op & 2, op & 1);
-                tcg_temp_free_i32(tmp2);
-                if (rs != 15) {
-                    tmp2 = load_reg(s, rs);
-                    gen_helper_add_setq(tmp, cpu_env, tmp, tmp2);
-                    tcg_temp_free_i32(tmp2);
-                }
-                break;
             case 2: /* Dual multiply add.  */
             case 4: /* Dual multiply subtract.  */
                 if (op)
@@ -10158,23 +10218,6 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                     tcg_temp_free_i32(tmp2);
                   }
                 break;
-            case 3: /* 32 * 16 -> 32msb */
-                if (op)
-                    tcg_gen_sari_i32(tmp2, tmp2, 16);
-                else
-                    gen_sxth(tmp2);
-                tmp64 = gen_muls_i64_i32(tmp, tmp2);
-                tcg_gen_shri_i64(tmp64, tmp64, 16);
-                tmp = tcg_temp_new_i32();
-                tcg_gen_extrl_i64_i32(tmp, tmp64);
-                tcg_temp_free_i64(tmp64);
-                if (rs != 15)
-                  {
-                    tmp2 = load_reg(s, rs);
-                    gen_helper_add_setq(tmp, cpu_env, tmp, tmp2);
-                    tcg_temp_free_i32(tmp2);
-                  }
-                break;
             case 5: case 6: /* 32 * 32 -> 32msb (SMMUL, SMMLA, SMMLS) */
                 tcg_gen_muls2_i32(tmp2, tmp, tmp, tmp2);
                 if (rs != 15) {
@@ -10248,29 +10291,10 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 gen_storeq_reg(s, rs, rd, tmp64);
                 tcg_temp_free_i64(tmp64);
             } else {
-                if ((op & 0x20) || !(op & 8)) {
-                    /* Signed/unsigned 64-bit multiply, in decodetree */
-                    tcg_temp_free_i32(tmp2);
-                    tcg_temp_free_i32(tmp);
-                    goto illegal_op;
-                }
-                /* smlalxy */
-                if (!arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)) {
-                    tcg_temp_free_i32(tmp2);
-                    tcg_temp_free_i32(tmp);
-                    goto illegal_op;
-                }
-                gen_mulxy(tmp, tmp2, op & 2, op & 1);
+                /* Signed/unsigned 64-bit multiply, in decodetree */
                 tcg_temp_free_i32(tmp2);
-                tmp64 = tcg_temp_new_i64();
-                tcg_gen_ext_i32_i64(tmp64, tmp);
                 tcg_temp_free_i32(tmp);
-                if (op & 0x40) {
-                    /* 64-bit accumulate.  */
-                    gen_addq(s, tmp64, rs, rd);
-                }
-                gen_storeq_reg(s, rs, rd, tmp64);
-                tcg_temp_free_i64(tmp64);
+                goto illegal_op;
             }
             break;
         }
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index 7791be5590..19d12e726b 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -114,6 +114,7 @@ MVN_rxi          .... 001 1111 . 0000 .... ............       @s_rxi_rot
 @s_rdamn         ---- .... ... s:1 rd:4 ra:4 rm:4 .... rn:4   &s_rrrr
 @s_rd0mn         ---- .... ... s:1 rd:4 .... rm:4 .... rn:4   &s_rrrr ra=0
 @rdamn           ---- .... ... .   rd:4 ra:4 rm:4 .... rn:4   &rrrr
+@rd0mn           ---- .... ... .   rd:4 .... rm:4 .... rn:4   &rrrr ra=0
 
 MUL              .... 0000 000 . .... 0000 .... 1001 ....     @s_rd0mn
 MLA              .... 0000 001 . .... .... .... 1001 ....     @s_rdamn
@@ -132,3 +133,22 @@ QADD             .... 0001 0000 .... .... 0000 0101 ....      @rndm
 QSUB             .... 0001 0010 .... .... 0000 0101 ....      @rndm
 QDADD            .... 0001 0100 .... .... 0000 0101 ....      @rndm
 QDSUB            .... 0001 0110 .... .... 0000 0101 ....      @rndm
+
+# Halfword multiply and multiply accumulate
+
+SMLABB           .... 0001 0000 .... .... .... 1000 ....      @rdamn
+SMLABT           .... 0001 0000 .... .... .... 1100 ....      @rdamn
+SMLATB           .... 0001 0000 .... .... .... 1010 ....      @rdamn
+SMLATT           .... 0001 0000 .... .... .... 1110 ....      @rdamn
+SMLAWB           .... 0001 0010 .... .... .... 1000 ....      @rdamn
+SMULWB           .... 0001 0010 .... 0000 .... 1010 ....      @rd0mn
+SMLAWT           .... 0001 0010 .... .... .... 1100 ....      @rdamn
+SMULWT           .... 0001 0010 .... 0000 .... 1110 ....      @rd0mn
+SMLALBB          .... 0001 0100 .... .... .... 1000 ....      @rdamn
+SMLALBT          .... 0001 0100 .... .... .... 1100 ....      @rdamn
+SMLALTB          .... 0001 0100 .... .... .... 1010 ....      @rdamn
+SMLALTT          .... 0001 0100 .... .... .... 1110 ....      @rdamn
+SMULBB           .... 0001 0110 .... 0000 .... 1000 ....      @rd0mn
+SMULBT           .... 0001 0110 .... 0000 .... 1100 ....      @rd0mn
+SMULTB           .... 0001 0110 .... 0000 .... 1010 ....      @rd0mn
+SMULTT           .... 0001 0110 .... 0000 .... 1110 ....      @rd0mn
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 7c6226e0af..122a0537ed 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -118,6 +118,7 @@ RSB_rri          1111 0.0 1110 . .... 0 ... .... ........     @s_rri_rot
 @s0_rnadm        .... .... .... rn:4 ra:4 rd:4 .... rm:4      &s_rrrr s=0
 @s0_rn0dm        .... .... .... rn:4 .... rd:4 .... rm:4      &s_rrrr ra=0 s=0
 @rnadm           .... .... .... rn:4 ra:4 rd:4 .... rm:4      &rrrr
+@rn0dm           .... .... .... rn:4 .... rd:4 .... rm:4      &rrrr ra=0
 @rndm            .... .... .... rn:4 .... rd:4 .... rm:4      &rrr
 
 {
@@ -130,6 +131,34 @@ UMULL            1111 1011 1010 .... .... .... 0000 ....      @s0_rnadm
 SMLAL            1111 1011 1100 .... .... .... 0000 ....      @s0_rnadm
 UMLAL            1111 1011 1110 .... .... .... 0000 ....      @s0_rnadm
 UMAAL            1111 1011 1110 .... .... .... 0110 ....      @rnadm
+{
+  SMULWB         1111 1011 0011 .... 1111 .... 0000 ....      @rn0dm
+  SMLAWB         1111 1011 0011 .... .... .... 0000 ....      @rnadm
+}
+{
+  SMULWT         1111 1011 0011 .... 1111 .... 0001 ....      @rn0dm
+  SMLAWT         1111 1011 0011 .... .... .... 0001 ....      @rnadm
+}
+{
+  SMULBB         1111 1011 0001 .... 1111 .... 0000 ....      @rn0dm
+  SMLABB         1111 1011 0001 .... .... .... 0000 ....      @rnadm
+}
+{
+  SMULBT         1111 1011 0001 .... 1111 .... 0001 ....      @rn0dm
+  SMLABT         1111 1011 0001 .... .... .... 0001 ....      @rnadm
+}
+{
+  SMULTB         1111 1011 0001 .... 1111 .... 0010 ....      @rn0dm
+  SMLATB         1111 1011 0001 .... .... .... 0010 ....      @rnadm
+}
+{
+  SMULTT         1111 1011 0001 .... 1111 .... 0011 ....      @rn0dm
+  SMLATT         1111 1011 0001 .... .... .... 0011 ....      @rnadm
+}
+SMLALBB          1111 1011 1100 .... .... .... 1000 ....      @rnadm
+SMLALBT          1111 1011 1100 .... .... .... 1001 ....      @rnadm
+SMLALTB          1111 1011 1100 .... .... .... 1010 ....      @rnadm
+SMLALTT          1111 1011 1100 .... .... .... 1011 ....      @rnadm
 
 # Data-processing (two source registers)
 
-- 
2.17.1


