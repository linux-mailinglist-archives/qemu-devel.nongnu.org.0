Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE009770AB
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 19:55:45 +0200 (CEST)
Received: from localhost ([::1]:42370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hr4RT-0005I7-F1
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 13:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58017)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr4N1-0003Wm-Rz
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 13:51:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr4Mx-0008JB-W3
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 13:51:07 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:38418)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr4Mx-0008Gh-MK
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 13:51:03 -0400
Received: by mail-pf1-x42b.google.com with SMTP id y15so24860584pfn.5
 for <qemu-devel@nongnu.org>; Fri, 26 Jul 2019 10:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KDqMHilsFSyAuM+TBQ81iYiWxxVpobopuXe2EkWbMJY=;
 b=n//mIpduCcnAamCEltxYUgUYpsHCm3X0hDFeKZfVD693VklzNMlN8ySnrcQW+1vsZv
 BRUhEX1bpInpNzo+WZBgY21GyGxowLT87yD2fw9caG+Hg1M9hXBTIN7UaKrL57N79yVz
 YI+Ux0cey2DEbdU2PAUXcI7PNJmg8/UjBA6zckvn8zonXvlEdt0T2CWogVEmBEW8bhk9
 iukHeseQuBX3k2PJg/qylHvVpzpoe9C/0D/+ClYAbjo7rIQEU7tYeRSxnOwqi9ISUfib
 8GQS8473oiRZS8AynbUSDdanCFXhOTS4Rup+U5Z8Yc8IjFGv+AERQ9nudFlGqWs0z5/Q
 +Mgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KDqMHilsFSyAuM+TBQ81iYiWxxVpobopuXe2EkWbMJY=;
 b=cNc//p0UUJ2q69Hqo31I6qWmihZq/srp/Z+u9tJXaqx9GqarMc8J0HrHaNfyzkTRYW
 Ot/KlCuykiIV0X89Arf0MQ7zfBNkQziJg9JyIJCxrTST3ZqpQQAajsRK9UhvSyNTkfft
 bGPZGC2WNttCzRCOqdfh39ZiJyoq1le05xYKUoDsnf5bE026AZ6FwdCJyo9AjqOmy3s/
 FFOOG2VR385xCW2mSNmHRCXbEG5n11NkTv4RHyJYATLlQtKO6wYnjCqogpWal+6JOEO7
 2mhAoWNrEQn+V+yHMGrLwNQv7xYBuhI7tOUeW/PnJYsI/2oD5mbXGmuQPKc7k9WCCkuH
 2cVw==
X-Gm-Message-State: APjAAAUbR+OJTSByl15YfdeTI58Rj6MuoIVO6HR8w5wbvcmbZfgQ/Uwf
 1Y4Re2ehrifgXZ4JFRznVRjyCDV/sZQ=
X-Google-Smtp-Source: APXvYqza5DD5i4nBalIOjkTFBAneSmMeehzIiI42o+jqpUHehWKmjrM/tM4vko6BgWGHqtGmTElMBA==
X-Received: by 2002:a17:90a:d996:: with SMTP id
 d22mr99372813pjv.86.1564163462300; 
 Fri, 26 Jul 2019 10:51:02 -0700 (PDT)
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net.
 [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 10:51:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 26 Jul 2019 10:49:49 -0700
Message-Id: <20190726175032.6769-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::42b
Subject: [Qemu-devel] [PATCH 24/67] target/arm: Convert USAD8, USADA8, SBFX,
 UBFX, BFC, BFI, UDF
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 201 +++++++++++++++++++++--------------------
 target/arm/a32.decode  |  20 ++++
 target/arm/t32.decode  |  19 ++++
 3 files changed, 144 insertions(+), 96 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 74e54b7efb..bcc890c458 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9186,6 +9186,104 @@ static bool trans_LDAH(DisasContext *s, arg_LDA *a)
     return op_lda(s, a, MO_UW);
 }
 
+/*
+ * Media instructions
+ */
+
+static bool trans_USADA8(DisasContext *s, arg_USADA8 *a)
+{
+    TCGv_i32 t1, t2;
+
+    if (!ENABLE_ARCH_6) {
+        return false;
+    }
+
+    t1 = load_reg(s, a->rn);
+    t2 = load_reg(s, a->rm);
+    gen_helper_usad8(t1, t1, t2);
+    tcg_temp_free_i32(t2);
+    if (a->ra != 15) {
+        t2 = load_reg(s, a->ra);
+        tcg_gen_add_i32(t1, t1, t2);
+        tcg_temp_free_i32(t2);
+    }
+    store_reg(s, a->rd, t1);
+    return true;
+}
+
+static bool op_bfx(DisasContext *s, arg_UBFX *a, bool u)
+{
+    TCGv_i32 tmp;
+    int width = a->widthm1 + 1;
+    int shift = a->lsb;
+
+    if (!ENABLE_ARCH_6T2) {
+        return false;
+    }
+
+    tmp = load_reg(s, a->rn);
+    if (shift + width > 32) {
+        gen_illegal_op(s);
+    } else if (width < 32) {
+        if (u) {
+            tcg_gen_extract_i32(tmp, tmp, shift, width);
+        } else {
+            tcg_gen_sextract_i32(tmp, tmp, shift, width);
+        }
+    }
+    store_reg(s, a->rd, tmp);
+    return true;
+}
+
+static bool trans_SBFX(DisasContext *s, arg_SBFX *a)
+{
+    return op_bfx(s, a, false);
+}
+
+static bool trans_UBFX(DisasContext *s, arg_UBFX *a)
+{
+    return op_bfx(s, a, true);
+}
+
+static bool trans_BFCI(DisasContext *s, arg_BFCI *a)
+{
+    TCGv_i32 tmp;
+    int msb = a->msb, lsb = a->lsb;
+    int width;
+
+    if (!ENABLE_ARCH_6T2) {
+        return false;
+    }
+
+    if (msb < lsb) {
+        /* UNPREDICTABLE; we choose to UNDEF */
+        gen_illegal_op(s);
+        return true;
+    }
+
+    width = msb + 1 - lsb;
+    if (a->rn == 15) {
+        /* BFC */
+        tmp = tcg_const_i32(0);
+    } else {
+        /* BFI */
+        tmp = load_reg(s, a->rn);
+    }
+    if (width != 32) {
+        TCGv_i32 tmp2 = load_reg(s, a->rd);
+        tcg_gen_deposit_i32(tmp, tmp2, tmp, lsb, width);
+        tcg_temp_free_i32(tmp2);
+    }
+    store_reg(s, a->rd, tmp);
+    return true;
+}
+
+static bool trans_UDF(DisasContext *s, arg_UDF *a)
+{
+    gen_illegal_op(s);
+    return true;
+}
+
 /*
  * Legacy decoder.
  */
@@ -9723,65 +9821,9 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                     }
                     break;
                 case 3:
-                    op1 = ((insn >> 17) & 0x38) | ((insn >> 5) & 7);
-                    switch (op1) {
-                    case 0: /* Unsigned sum of absolute differences.  */
-                        ARCH(6);
-                        tmp = load_reg(s, rm);
-                        tmp2 = load_reg(s, rs);
-                        gen_helper_usad8(tmp, tmp, tmp2);
-                        tcg_temp_free_i32(tmp2);
-                        if (rd != 15) {
-                            tmp2 = load_reg(s, rd);
-                            tcg_gen_add_i32(tmp, tmp, tmp2);
-                            tcg_temp_free_i32(tmp2);
-                        }
-                        store_reg(s, rn, tmp);
-                        break;
-                    case 0x20: case 0x24: case 0x28: case 0x2c:
-                        /* Bitfield insert/clear.  */
-                        ARCH(6T2);
-                        shift = (insn >> 7) & 0x1f;
-                        i = (insn >> 16) & 0x1f;
-                        if (i < shift) {
-                            /* UNPREDICTABLE; we choose to UNDEF */
-                            goto illegal_op;
-                        }
-                        i = i + 1 - shift;
-                        if (rm == 15) {
-                            tmp = tcg_temp_new_i32();
-                            tcg_gen_movi_i32(tmp, 0);
-                        } else {
-                            tmp = load_reg(s, rm);
-                        }
-                        if (i != 32) {
-                            tmp2 = load_reg(s, rd);
-                            tcg_gen_deposit_i32(tmp, tmp2, tmp, shift, i);
-                            tcg_temp_free_i32(tmp2);
-                        }
-                        store_reg(s, rd, tmp);
-                        break;
-                    case 0x12: case 0x16: case 0x1a: case 0x1e: /* sbfx */
-                    case 0x32: case 0x36: case 0x3a: case 0x3e: /* ubfx */
-                        ARCH(6T2);
-                        tmp = load_reg(s, rm);
-                        shift = (insn >> 7) & 0x1f;
-                        i = ((insn >> 16) & 0x1f) + 1;
-                        if (shift + i > 32)
-                            goto illegal_op;
-                        if (i < 32) {
-                            if (op1 & 0x20) {
-                                tcg_gen_extract_i32(tmp, tmp, shift, i);
-                            } else {
-                                tcg_gen_sextract_i32(tmp, tmp, shift, i);
-                            }
-                        }
-                        store_reg(s, rd, tmp);
-                        break;
-                    default:
-                        goto illegal_op;
-                    }
-                    break;
+                    /* USAD, BFI, BFC, SBFX, UBFX */
+                    /* Done by decodetree */
+                    goto illegal_op;
                 }
                 break;
             }
@@ -10430,10 +10472,9 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
             case 0: /* 32 x 32 -> 32 */
             case 1: /* 16 x 16 -> 32 */
             case 3: /* 32 * 16 -> 32msb */
+            case 7: /* Unsigned sum of absolute differences.  */
                 /* in decodetree */
                 goto illegal_op;
-            case 7: /* Unsigned sum of absolute differences.  */
-                break;
             case 2: /* Dual multiply add.  */
             case 4: /* Dual multiply subtract.  */
             case 5: case 6: /* 32 * 32 -> 32msb (SMMUL, SMMLA, SMMLS) */
@@ -10487,15 +10528,6 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 tcg_gen_extrl_i64_i32(tmp, tmp64);
                 tcg_temp_free_i64(tmp64);
                 break;
-            case 7: /* Unsigned sum of absolute differences.  */
-                gen_helper_usad8(tmp, tmp, tmp2);
-                tcg_temp_free_i32(tmp2);
-                if (rs != 15) {
-                    tmp2 = load_reg(s, rs);
-                    tcg_gen_add_i32(tmp, tmp, tmp2);
-                    tcg_temp_free_i32(tmp2);
-                }
-                break;
             }
             store_reg(s, rd, tmp);
             break;
@@ -10806,32 +10838,9 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                         tmp = load_reg(s, rn);
                     }
                     switch (op) {
-                    case 2: /* Signed bitfield extract.  */
-                        imm++;
-                        if (shift + imm > 32)
-                            goto illegal_op;
-                        if (imm < 32) {
-                            tcg_gen_sextract_i32(tmp, tmp, shift, imm);
-                        }
-                        break;
-                    case 6: /* Unsigned bitfield extract.  */
-                        imm++;
-                        if (shift + imm > 32)
-                            goto illegal_op;
-                        if (imm < 32) {
-                            tcg_gen_extract_i32(tmp, tmp, shift, imm);
-                        }
-                        break;
-                    case 3: /* Bitfield insert/clear.  */
-                        if (imm < shift)
-                            goto illegal_op;
-                        imm = imm + 1 - shift;
-                        if (imm != 32) {
-                            tmp2 = load_reg(s, rd);
-                            tcg_gen_deposit_i32(tmp, tmp2, tmp, shift, imm);
-                            tcg_temp_free_i32(tmp2);
-                        }
-                        break;
+                    case 2: /* Signed bitfield extract, in decodetree */
+                    case 6: /* Unsigned bitfield extract, in decodetree */
+                    case 3: /* Bitfield insert/clear, in decodetree */
                     case 7:
                         goto illegal_op;
                     default: /* Saturate.  */
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index 1267cebaf4..7f51d04a91 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -41,6 +41,8 @@
 &ldst_ri         p w u rn rt imm
 &strex           rn rd rt rt2 imm
 &ldrex           rn rt rt2 imm
+&bfx             rd rn lsb widthm1
+&bfi             rd rn lsb msb
 
 # Data-processing (register)
 
@@ -390,3 +392,21 @@ LDAEXH           .... 0001 1111 .... .... 1110 1001 1111      @ldrex
 LDA              .... 0001 1001 .... .... 1100 1001 1111      @ldrex
 LDAB             .... 0001 1101 .... .... 1100 1001 1111      @ldrex
 LDAH             .... 0001 1111 .... .... 1100 1001 1111      @ldrex
+
+# Media instructions
+
+# usad8 is usada8 w/ ra=15
+USADA8           ---- 0111 1000 rd:4 ra:4 rm:4 0001 rn:4
+
+# ubfx and sbfx
+@bfx             ---- .... ... widthm1:5 rd:4 lsb:5 ... rn:4  &bfx
+
+SBFX             .... 0111 101 ..... .... ..... 101 ....      @bfx
+UBFX             .... 0111 111 ..... .... ..... 101 ....      @bfx
+
+# bfc is bfi w/ rn=15
+BFCI             ---- 0111 110 msb:5 rd:4 lsb:5 001 rn:4      &bfi
+
+# While we could get UDEF by not including this, add the pattern for
+# documentation and to conflict with any other typos in this file.
+UDF              1110 0111 1111 ---- ---- ---- 1111 ----
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 62bcf60d57..a4a69ad38f 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -38,6 +38,8 @@
 &ldst_ri         !extern p w u rn rt imm
 &strex           !extern rn rd rt rt2 imm
 &ldrex           !extern rn rt rt2 imm
+&bfx             !extern rd rn lsb widthm1
+&bfi             !extern rd rn lsb msb
 
 # Data-processing (register-shifted register)
 
@@ -144,6 +146,19 @@ RSB_rri          1111 0.0 1110 . .... 0 ... .... ........     @s_rri_rot
   SUB_rri        1111 0.1 0101 0 .... 0 ... .... ........     @s0_rri_12
 }
 
+# Saturate, bitfield
+
+@bfx             .... .... ... . rn:4 . ... rd:4 .. . widthm1:5 \
+                 &bfx lsb=%imm5_12_6
+@bfi             .... .... ... . rn:4 . ... rd:4 .. . msb:5 \
+                 &bfi lsb=%imm5_12_6
+
+SBFX             1111 0011 010 0 .... 0 ... .... ..0.....     @bfx
+UBFX             1111 0011 110 0 .... 0 ... .... ..0.....     @bfx
+
+# bfc is bfi w/ rn=15
+BFCI             1111 0011 011 0 .... 0 ... .... ..0.....     @bfi
+
 # Multiply and multiply accumulate
 
 @s0_rnadm        .... .... .... rn:4 ra:4 rd:4 .... rm:4      &s_rrrr s=0
@@ -192,6 +207,9 @@ SMLALBT          1111 1011 1100 .... .... .... 1001 ....      @rnadm
 SMLALTB          1111 1011 1100 .... .... .... 1010 ....      @rnadm
 SMLALTT          1111 1011 1100 .... .... .... 1011 ....      @rnadm
 
+# usad8 is usada8 w/ ra=15
+USADA8           1111 1011 0111 .... .... .... 0000 ....      @rnadm
+
 # Data-processing (two source registers)
 
 QADD             1111 1010 1000 .... 1111 .... 1000 ....      @rndm
@@ -254,6 +272,7 @@ CLZ              1111 1010 1011 ---- 1111 .... 1000 ....      @rdm
   SMC            1111 0111 1111 imm:4 1000 0000 0000 0000     &i
   HVC            1111 0111 1110 .... 1000 .... .... ....      \
                  &i imm=%imm16_16_0
+  UDF            1111 0111 1111 ---- 1010 ---- ---- ----
 }
 
 # Load/store (register, immediate, literal)
-- 
2.17.1


