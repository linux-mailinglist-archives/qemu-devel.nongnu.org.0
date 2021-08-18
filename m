Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 753D93F0CED
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:45:58 +0200 (CEST)
Received: from localhost ([::1]:40578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSRh-00062f-FS
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mGSEz-0001fL-An
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:32:49 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:41759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mGSEr-0006xt-JL
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:32:45 -0400
Received: by mail-lf1-x12e.google.com with SMTP id y34so7304507lfa.8
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fMs67KfcAvPmYfhAWFaX3ksBcbetMAqCxF+jCYHJJ4U=;
 b=zAv9KJNgj8s/sj+l0fFx1Li2PaB6YgssdR3XNAaRBU0xw3Ox42JfIUzUai93VqscRE
 YJW2RMT33u7af9B6xwn+qQMJ4yUxXtQSadeBYDaGToHoUja4gAP8DvPF8S64zmR6MrMn
 9LcTSRUsswZMyvmXe7YaSk+SyKlFL+Ej5vAL1pSRWu3FC0EaitZLVZc3QtAn+Vh7/+bl
 7L3xuO1g2DWpQAovRqY8m4eeA80ppx8c+NsEnTfaRXUCXdAUhcPM7gKm62RkN6bZEUnT
 fJTFm5v4FZSQukA/B6jkgJ6xqXlJat9ITbNfPcjCFs6FZGB2i2IH2q6zJZsGI2ZoobQ5
 6BKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fMs67KfcAvPmYfhAWFaX3ksBcbetMAqCxF+jCYHJJ4U=;
 b=NRVnAucVQYH4cfBKOlX0OzjvJ0OM9DnbAJChsJYCTk/37p8AWisrFUB0LdPTkGiKUj
 REk+PyIAUrxOTPTSWHIRKP0JfXucoBL2O0QjgRYhs93ytgQmqa1mhw+oFPivAiFtKGZk
 8bSuZP9hhpfHWtbzlVdrWfKNaTTvTyb1bdh7waI0PIjqZ6sC3fI0zQwQar5LoQnpp/9M
 NzVuqFzqQVd4XKbmNBZyyHO/rsT03sxjYk7q8A+Aik0M/4xdqlGKF+LuH/oMgM6zNfmd
 hQz90CBgbRj/0RUU1UurbNH6DB8hUe8cbV96UtH/4l4stauYYRq5dS/5KamqTkdvD354
 1cfQ==
X-Gm-Message-State: AOAM531vs0DxqfNZhbzRpH+LtMv1tALIpLk2WpTuJ28J5eU0RrPLyhcq
 ZEED53143HnZE7Wjr8CM7fsJ3CI2dkAenBAEtSc=
X-Google-Smtp-Source: ABdhPJxqkL8GS0/IcA5vJFyASA6BkQmpcJrsoEnj+VY2MXujqkmpCD81ngMuM+IpvPi41dLXnSI5Uw==
X-Received: by 2002:a05:6512:139c:: with SMTP id
 p28mr7609247lfa.523.1629318759541; 
 Wed, 18 Aug 2021 13:32:39 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id c2sm92831lji.57.2021.08.18.13.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:32:39 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] target/riscv: update Zb[abcs] to 1.0.0 (public review)
 specification
Date: Wed, 18 Aug 2021 22:32:32 +0200
Message-Id: <20210818203233.791599-3-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818203233.791599-1-philipp.tomsich@vrull.eu>
References: <20210818203233.791599-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 18 Aug 2021 16:43:43 -0400
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ratification package for Zb[abcs] does not contain all instructions
that have been added to QEmu and don't define misa.B for these: the
individual extensions are now Zba, Zbb, Zbc and Zbs.

Some of the instructions that had previously been added and now need to
be dropped are:
 - shift-one instructions
 - generalized reverse and or-combine
 - w-forms of single-bit instructions
 - w-form of rev8

The following have been adjusted:
 - rori and slli.uw only accept a 6-bit shamt field
   (if the bit that is reserved for a future 7-bit shamt for RV128 is
    set, the encoding is illegal on RV64)

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

---

(no changes since v1)

 target/riscv/insn32.decode              | 119 ++++----
 target/riscv/insn_trans/trans_rvb.c.inc | 357 ++++++++++--------------
 target/riscv/translate.c                | 128 +++------
 3 files changed, 238 insertions(+), 366 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index f09f8d5faf..75fa1e45a3 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -22,6 +22,7 @@
 %rs1       15:5
 %rd        7:5
 %sh5       20:5
+%sh6       20:6
 
 %sh7    20:7
 %csr    20:12
@@ -60,7 +61,9 @@
 @u       ....................      ..... ....... &u      imm=%imm_u          %rd
 @j       ....................      ..... ....... &j      imm=%imm_j          %rd
 
-@sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh7     %rs1 %rd
+@sh      .....  ....... .....  ... ..... ....... &shift  shamt=%sh7     %rs1 %rd
+@sh6     ......  ...... .....  ... ..... ....... &shift  shamt=%sh6     %rs1 %rd
+
 @csr     ............   .....  ... ..... .......               %csr     %rs1 %rd
 
 @atom_ld ..... aq:1 rl:1 ..... ........ ..... ....... &atomic rs2=0     %rs1 %rd
@@ -659,76 +662,68 @@ vamomaxd_v      10100 . . ..... ..... 111 ..... 0101111 @r_wdvm
 vamominud_v     11000 . . ..... ..... 111 ..... 0101111 @r_wdvm
 vamomaxud_v     11100 . . ..... ..... 111 ..... 0101111 @r_wdvm
 
-# *** RV32B Standard Extension ***
-clz        011000 000000 ..... 001 ..... 0010011 @r2
-ctz        011000 000001 ..... 001 ..... 0010011 @r2
-cpop       011000 000010 ..... 001 ..... 0010011 @r2
-sext_b     011000 000100 ..... 001 ..... 0010011 @r2
-sext_h     011000 000101 ..... 001 ..... 0010011 @r2
+# *** RV32 Zba Standard Extension ***
+sh1add     0010000 .......... 010 ..... 0110011 @r
+sh2add     0010000 .......... 100 ..... 0110011 @r
+sh3add     0010000 .......... 110 ..... 0110011 @r
+
+# *** RV64 Zba Standard Extension (in addition to RV32 Zba) ***
+add_uw     0000100 .......... 000 ..... 0111011 @r
+sh1add_uw  0010000 .......... 010 ..... 0111011 @r
+sh2add_uw  0010000 .......... 100 ..... 0111011 @r
+sh3add_uw  0010000 .......... 110 ..... 0111011 @r
+slli_uw    000010 ........... 001 ..... 0011011 @sh6
 
+# *** RV32 Zbb Standard Extension ***
 andn       0100000 .......... 111 ..... 0110011 @r
-orn        0100000 .......... 110 ..... 0110011 @r
-xnor       0100000 .......... 100 ..... 0110011 @r
-pack       0000100 .......... 100 ..... 0110011 @r
-packu      0100100 .......... 100 ..... 0110011 @r
-packh      0000100 .......... 111 ..... 0110011 @r
-min        0000101 .......... 100 ..... 0110011 @r
-minu       0000101 .......... 101 ..... 0110011 @r
+clz        011000 000000 ..... 001 ..... 0010011 @r2
+cpop       011000 000010 ..... 001 ..... 0010011 @r2
+ctz        011000 000001 ..... 001 ..... 0010011 @r2
 max        0000101 .......... 110 ..... 0110011 @r
 maxu       0000101 .......... 111 ..... 0110011 @r
-bset       0010100 .......... 001 ..... 0110011 @r
-bclr       0100100 .......... 001 ..... 0110011 @r
-binv       0110100 .......... 001 ..... 0110011 @r
-bext       0100100 .......... 101 ..... 0110011 @r
-slo        0010000 .......... 001 ..... 0110011 @r
-sro        0010000 .......... 101 ..... 0110011 @r
-ror        0110000 .......... 101 ..... 0110011 @r
+min        0000101 .......... 100 ..... 0110011 @r
+minu       0000101 .......... 101 ..... 0110011 @r
+orc_b      001010 000111 ..... 101 ..... 0010011 @r2
+orn        0100000 .......... 110 ..... 0110011 @r
+rev8       011010 011000 ..... 101 ..... 0010011 @r2
 rol        0110000 .......... 001 ..... 0110011 @r
-grev       0110100 .......... 101 ..... 0110011 @r
-gorc       0010100 .......... 101 ..... 0110011 @r
-sh1add     0010000 .......... 010 ..... 0110011 @r
-sh2add     0010000 .......... 100 ..... 0110011 @r
-sh3add     0010000 .......... 110 ..... 0110011 @r
-
-bseti      00101. ........... 001 ..... 0010011 @sh
-bclri      01001. ........... 001 ..... 0010011 @sh
-binvi      01101. ........... 001 ..... 0010011 @sh
-bexti      01001. ........... 101 ..... 0010011 @sh
-sloi       00100. ........... 001 ..... 0010011 @sh
-sroi       00100. ........... 101 ..... 0010011 @sh
-rori       01100. ........... 101 ..... 0010011 @sh
-grevi      01101. ........... 101 ..... 0010011 @sh
-gorci      00101. ........... 101 ..... 0010011 @sh
+ror        0110000 .......... 101 ..... 0110011 @r
+rori       011000 ........... 101 ..... 0010011 @sh6
+sext_b     011000 000100 ..... 001 ..... 0010011 @r2
+sext_h     011000 000101 ..... 001 ..... 0010011 @r2
+xnor       0100000 .......... 100 ..... 0110011 @r
+zext_h     0000100 00000 ..... 100 ..... 0110011 @r2
 
-# *** RV64B Standard Extension (in addition to RV32B) ***
+# *** RV64 Zbb Standard Extension (in addition to RV32 Zbb) ***
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
 ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
 cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
-
-packw      0000100 .......... 100 ..... 0111011 @r
-packuw     0100100 .......... 100 ..... 0111011 @r
-bsetw      0010100 .......... 001 ..... 0111011 @r
-bclrw      0100100 .......... 001 ..... 0111011 @r
-binvw      0110100 .......... 001 ..... 0111011 @r
-bextw      0100100 .......... 101 ..... 0111011 @r
-slow       0010000 .......... 001 ..... 0111011 @r
-srow       0010000 .......... 101 ..... 0111011 @r
-rorw       0110000 .......... 101 ..... 0111011 @r
+# The encoding for rev8 differs between RV32 and RV64.
+# When executing on RV64, the encoding used in RV32 is an illegal
+# instruction, so we use different handler functions to differentiate.
+rev8_64    011010 111000 ..... 101 ..... 0010011 @r2
 rolw       0110000 .......... 001 ..... 0111011 @r
-grevw      0110100 .......... 101 ..... 0111011 @r
-gorcw      0010100 .......... 101 ..... 0111011 @r
-sh1add_uw  0010000 .......... 010 ..... 0111011 @r
-sh2add_uw  0010000 .......... 100 ..... 0111011 @r
-sh3add_uw  0010000 .......... 110 ..... 0111011 @r
-add_uw     0000100 .......... 000 ..... 0111011 @r
-
-bsetiw     0010100 .......... 001 ..... 0011011 @sh5
-bclriw     0100100 .......... 001 ..... 0011011 @sh5
-binviw     0110100 .......... 001 ..... 0011011 @sh5
-sloiw      0010000 .......... 001 ..... 0011011 @sh5
-sroiw      0010000 .......... 101 ..... 0011011 @sh5
 roriw      0110000 .......... 101 ..... 0011011 @sh5
-greviw     0110100 .......... 101 ..... 0011011 @sh5
-gorciw     0010100 .......... 101 ..... 0011011 @sh5
+rorw       0110000 .......... 101 ..... 0111011 @r
+# The encoding for zext.h differs between RV32 and RV64.
+# When executing on RV64, the encoding used in RV32 is an illegal
+# instruction, so we use different handler functions to differentiate.
+zext_h_64  0000100 00000 ..... 100 ..... 0111011 @r2
+
+# *** RV32 Zbc Standard Extension ***
+clmul      0000101 .......... 001 ..... 0110011 @r
+clmulh     0000101 .......... 011 ..... 0110011 @r
+clmulr     0000101 .......... 010 ..... 0110011 @r
+
+# *** RV32 Zbs Standard Extension ***
+bclr       0100100 .......... 001 ..... 0110011 @r
+bclri      01001. ........... 001 ..... 0010011 @sh
+bext       0100100 .......... 101 ..... 0110011 @r
+bexti      01001. ........... 101 ..... 0010011 @sh
+binv       0110100 .......... 001 ..... 0110011 @r
+binvi      01101. ........... 001 ..... 0010011 @sh
+bset       0010100 .......... 001 ..... 0110011 @r
+bseti      00101. ........... 001 ..... 0010011 @sh
+
+
 
-slli_uw    00001. ........... 001 ..... 0011011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 9e81f6e3de..acb10d89be 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -1,8 +1,9 @@
 /*
- * RISC-V translation routines for the RVB Standard Extension.
+ * RISC-V translation routines for the Zb[abcs] Standard Extension.
  *
  * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
  * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
+ * Copyright (c) 2021 Philipp Tomsich, philipp.tomsich@vrull.eu
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -17,219 +18,221 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#define REQUIRE_ZBA(ctx) do {                    \
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_zba) {      \
+        return false;                            \
+    }                                            \
+} while (0)
+
+#define REQUIRE_ZBB(ctx) do {                    \
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbb) {      \
+        return false;                            \
+    }                                            \
+} while (0)
+
+#define REQUIRE_ZBC(ctx) do {                    \
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbc) {      \
+        return false;                            \
+    }                                            \
+} while (0)
+
+#define REQUIRE_ZBS(ctx) do {                    \
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbs) {      \
+        return false;                            \
+    }                                            \
+} while (0)
+
 static bool trans_clz(DisasContext *ctx, arg_clz *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_unary(ctx, a, gen_clz);
 }
 
 static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_unary(ctx, a, gen_ctz);
 }
 
 static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_unary(ctx, a, tcg_gen_ctpop_tl);
 }
 
 static bool trans_andn(DisasContext *ctx, arg_andn *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_arith(ctx, a, tcg_gen_andc_tl);
 }
 
 static bool trans_orn(DisasContext *ctx, arg_orn *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_arith(ctx, a, tcg_gen_orc_tl);
 }
 
 static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_arith(ctx, a, tcg_gen_eqv_tl);
 }
 
-static bool trans_pack(DisasContext *ctx, arg_pack *a)
-{
-    REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, gen_pack);
-}
-
-static bool trans_packu(DisasContext *ctx, arg_packu *a)
-{
-    REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, gen_packu);
-}
-
-static bool trans_packh(DisasContext *ctx, arg_packh *a)
-{
-    REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, gen_packh);
-}
-
 static bool trans_min(DisasContext *ctx, arg_min *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_arith(ctx, a, tcg_gen_smin_tl);
 }
 
 static bool trans_max(DisasContext *ctx, arg_max *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_arith(ctx, a, tcg_gen_smax_tl);
 }
 
 static bool trans_minu(DisasContext *ctx, arg_minu *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_arith(ctx, a, tcg_gen_umin_tl);
 }
 
 static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_arith(ctx, a, tcg_gen_umax_tl);
 }
 
 static bool trans_sext_b(DisasContext *ctx, arg_sext_b *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_unary(ctx, a, tcg_gen_ext8s_tl);
 }
 
 static bool trans_sext_h(DisasContext *ctx, arg_sext_h *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_unary(ctx, a, tcg_gen_ext16s_tl);
 }
 
 static bool trans_bset(DisasContext *ctx, arg_bset *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shift(ctx, a, gen_bset);
 }
 
 static bool trans_bseti(DisasContext *ctx, arg_bseti *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shifti(ctx, a, gen_bset);
 }
 
 static bool trans_bclr(DisasContext *ctx, arg_bclr *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shift(ctx, a, gen_bclr);
 }
 
 static bool trans_bclri(DisasContext *ctx, arg_bclri *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shifti(ctx, a, gen_bclr);
 }
 
 static bool trans_binv(DisasContext *ctx, arg_binv *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shift(ctx, a, gen_binv);
 }
 
 static bool trans_binvi(DisasContext *ctx, arg_binvi *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shifti(ctx, a, gen_binv);
 }
 
 static bool trans_bext(DisasContext *ctx, arg_bext *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_shift(ctx, a, gen_bext);
 }
 
 static bool trans_bexti(DisasContext *ctx, arg_bexti *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_shifti(ctx, a, gen_bext);
 }
 
-static bool trans_slo(DisasContext *ctx, arg_slo *a)
-{
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, gen_slo);
-}
-
-static bool trans_sloi(DisasContext *ctx, arg_sloi *a)
-{
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shifti(ctx, a, gen_slo);
-}
-
-static bool trans_sro(DisasContext *ctx, arg_sro *a)
-{
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, gen_sro);
-}
-
-static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
-{
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shifti(ctx, a, gen_sro);
-}
-
 static bool trans_ror(DisasContext *ctx, arg_ror *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_shift(ctx, a, tcg_gen_rotr_tl);
 }
 
 static bool trans_rori(DisasContext *ctx, arg_rori *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_shifti(ctx, a, tcg_gen_rotr_tl);
 }
 
 static bool trans_rol(DisasContext *ctx, arg_rol *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_shift(ctx, a, tcg_gen_rotl_tl);
 }
 
-static bool trans_grev(DisasContext *ctx, arg_grev *a)
+static bool trans_rev8(DisasContext *ctx, arg_rev8 *a)
 {
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, gen_helper_grev);
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZBB(ctx);
+    return gen_unary(ctx, a, &tcg_gen_bswap_tl);
 }
 
-static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
+static void gen_orc_b(TCGv ret, TCGv source1)
 {
-    REQUIRE_EXT(ctx, RVB);
-
-    if (a->shamt >= TARGET_LONG_BITS) {
-        return false;
-    }
-
-    return gen_grevi(ctx, a);
+    TCGv  tmp = tcg_temp_new();
+    tcg_gen_andi_tl(tmp, source1, (TARGET_LONG_BITS == 64) ? 0x5555555555555555LL
+                                                           : 0x55555555);
+    tcg_gen_shli_tl(tmp, tmp, 1);
+    tcg_gen_or_tl(source1, source1, tmp);
+    tcg_gen_andi_tl(tmp, source1, (TARGET_LONG_BITS == 64) ? 0xaaaaaaaaaaaaaaaaLL
+                                                           : 0xaaaaaaaa);
+    tcg_gen_shri_tl(tmp, tmp, 1);
+    tcg_gen_or_tl(source1, source1, tmp);
+    tcg_gen_andi_tl(tmp, source1, (TARGET_LONG_BITS == 64) ? 0x3333333333333333LL
+                                                           : 0x33333333);
+    tcg_gen_shli_tl(tmp, tmp, 2);
+    tcg_gen_or_tl(source1, source1, tmp);
+    tcg_gen_andi_tl(tmp, source1, (TARGET_LONG_BITS == 64) ? 0xccccccccccccccccLL
+                                                           : 0xcccccccc);
+    tcg_gen_shri_tl(tmp, tmp, 2);
+    tcg_gen_or_tl(source1, source1, tmp);
+    tcg_gen_andi_tl(tmp, source1, (TARGET_LONG_BITS == 64) ? 0x0f0f0f0f0f0f0f0fLL
+                                                           : 0x0f0f0f0f);
+    tcg_gen_shli_tl(tmp, tmp, 4);
+    tcg_gen_or_tl(source1, source1, tmp);
+    tcg_gen_andi_tl(tmp, source1, (TARGET_LONG_BITS == 64) ? 0xf0f0f0f0f0f0f0f0LL
+                                                           : 0xf0f0f0f0);
+    tcg_gen_shri_tl(tmp, tmp, 4);
+    tcg_gen_or_tl(ret, source1, tmp);
 }
 
-static bool trans_gorc(DisasContext *ctx, arg_gorc *a)
+static bool trans_orc_b(DisasContext *ctx, arg_orc_b *a)
 {
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, gen_helper_gorc);
+    REQUIRE_ZBB(ctx);
+    return gen_unary(ctx, a, &gen_orc_b);
 }
 
-static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
+static bool trans_zext_h(DisasContext *ctx, arg_sext_h *a)
 {
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shifti(ctx, a, gen_helper_gorc);
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZBB(ctx);
+    return gen_unary(ctx, a, &tcg_gen_ext16u_tl);
 }
 
 #define GEN_TRANS_SHADD(SHAMT)                                             \
 static bool trans_sh##SHAMT##add(DisasContext *ctx, arg_sh##SHAMT##add *a) \
 {                                                                          \
-    REQUIRE_EXT(ctx, RVB);                                                 \
+    REQUIRE_ZBB(ctx);                                                      \
     return gen_arith(ctx, a, gen_sh##SHAMT##add);                          \
 }
 
@@ -240,162 +243,50 @@ GEN_TRANS_SHADD(3)
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_unary(ctx, a, gen_clzw);
 }
 
 static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_unary(ctx, a, gen_ctzw);
 }
 
 static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_unary(ctx, a, gen_cpopw);
 }
 
-static bool trans_packw(DisasContext *ctx, arg_packw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, gen_packw);
-}
-
-static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, gen_packuw);
-}
-
-static bool trans_bsetw(DisasContext *ctx, arg_bsetw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_bset);
-}
-
-static bool trans_bsetiw(DisasContext *ctx, arg_bsetiw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_bset);
-}
-
-static bool trans_bclrw(DisasContext *ctx, arg_bclrw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_bclr);
-}
-
-static bool trans_bclriw(DisasContext *ctx, arg_bclriw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_bclr);
-}
-
-static bool trans_binvw(DisasContext *ctx, arg_binvw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_binv);
-}
-
-static bool trans_binviw(DisasContext *ctx, arg_binviw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_binv);
-}
-
-static bool trans_bextw(DisasContext *ctx, arg_bextw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_bext);
-}
-
-static bool trans_slow(DisasContext *ctx, arg_slow *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_slo);
-}
-
-static bool trans_sloiw(DisasContext *ctx, arg_sloiw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_slo);
-}
-
-static bool trans_srow(DisasContext *ctx, arg_srow *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_sro);
-}
-
-static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_sro);
-}
-
 static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_shiftw(ctx, a, gen_rorw);
 }
 
 static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_shiftiw(ctx, a, gen_rorw);
 }
 
 static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_shiftw(ctx, a, gen_rolw);
 }
 
-static bool trans_grevw(DisasContext *ctx, arg_grevw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_grevw);
-}
-
-static bool trans_greviw(DisasContext *ctx, arg_greviw *a)
+static bool trans_rev8_64(DisasContext *ctx, arg_rev8 *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_grevw);
-}
-
-static bool trans_gorcw(DisasContext *ctx, arg_gorcw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_gorcw);
-}
-
-static bool trans_gorciw(DisasContext *ctx, arg_gorciw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_gorcw);
+    REQUIRE_ZBB(ctx);
+    return gen_unary(ctx, a, &tcg_gen_bswap_tl);
 }
 
 #define GEN_TRANS_SHADD_UW(SHAMT)                             \
@@ -403,7 +294,7 @@ static bool trans_sh##SHAMT##add_uw(DisasContext *ctx,        \
                                     arg_sh##SHAMT##add_uw *a) \
 {                                                             \
     REQUIRE_64BIT(ctx);                                       \
-    REQUIRE_EXT(ctx, RVB);                                    \
+    REQUIRE_ZBA(ctx);                                         \
     return gen_arith(ctx, a, gen_sh##SHAMT##add_uw);          \
 }
 
@@ -414,25 +305,59 @@ GEN_TRANS_SHADD_UW(3)
 static bool trans_add_uw(DisasContext *ctx, arg_add_uw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBA(ctx);
     return gen_arith(ctx, a, gen_add_uw);
 }
 
 static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-
-    TCGv source1 = tcg_temp_new();
-    gen_get_gpr(source1, a->rs1);
+    REQUIRE_ZBA(ctx);
 
+    TCGv source = tcg_temp_new();
+    gen_get_gpr(source, a->rs1);
     if (a->shamt < 32) {
-        tcg_gen_deposit_z_tl(source1, source1, a->shamt, 32);
-    } else {
-        tcg_gen_shli_tl(source1, source1, a->shamt);
+        tcg_gen_ext32u_tl(source, source);
     }
+    tcg_gen_shli_tl(source, source, a->shamt);
+    gen_set_gpr(a->rd, source);
+    tcg_temp_free(source);
+    return true;
+}
+
+static bool trans_zext_h_64(DisasContext *ctx, arg_sext_h *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZBB(ctx);
+    return gen_unary(ctx, a, &tcg_gen_ext16u_tl);
+}
+
+static bool trans_clmul(DisasContext *ctx, arg_clmul *a)
+{
+    REQUIRE_ZBC(ctx);
+
+    gen_clmulx(ctx, a, false);
+    return true;
+}
 
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
+static bool trans_clmulh(DisasContext *ctx, arg_clmulr *a)
+{
+    REQUIRE_ZBC(ctx);
+
+    /* Perform a clmulr ... */
+    gen_clmulx(ctx, a, true);
+    /* ... then shift the result 1 bit to the right. */
+    TCGv dst = tcg_temp_new();
+    gen_get_gpr(dst, a->rd);
+    tcg_gen_shri_tl(dst, dst, 1);
+    gen_set_gpr(a->rd, dst);
+    tcg_temp_free(dst);
+    return true;
+}
+
+static bool trans_clmulr(DisasContext *ctx, arg_clmulh *a)
+{
+    REQUIRE_ZBC(ctx);
+    gen_clmulx(ctx, a, true);
     return true;
 }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6983be5723..2579643fa9 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -417,6 +417,12 @@ EX_SH(12)
     }                              \
 } while (0)
 
+#define REQUIRE_32BIT(ctx) do { \
+    if (!is_32bit(ctx)) {       \
+        return false;           \
+    }                           \
+} while (0)
+
 #define REQUIRE_64BIT(ctx) do { \
     if (is_32bit(ctx)) {        \
         return false;           \
@@ -530,29 +536,6 @@ static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
     return true;
 }
 
-static void gen_pack(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_deposit_tl(ret, arg1, arg2,
-                       TARGET_LONG_BITS / 2,
-                       TARGET_LONG_BITS / 2);
-}
-
-static void gen_packu(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    TCGv t = tcg_temp_new();
-    tcg_gen_shri_tl(t, arg1, TARGET_LONG_BITS / 2);
-    tcg_gen_deposit_tl(ret, arg2, t, 0, TARGET_LONG_BITS / 2);
-    tcg_temp_free(t);
-}
-
-static void gen_packh(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    TCGv t = tcg_temp_new();
-    tcg_gen_ext8u_tl(t, arg2);
-    tcg_gen_deposit_tl(ret, arg1, t, 8, TARGET_LONG_BITS - 8);
-    tcg_temp_free(t);
-}
-
 static void gen_sbop_mask(TCGv ret, TCGv shamt)
 {
     tcg_gen_movi_tl(ret, 1);
@@ -595,42 +578,6 @@ static void gen_bext(TCGv ret, TCGv arg1, TCGv shamt)
     tcg_gen_andi_tl(ret, ret, 1);
 }
 
-static void gen_slo(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_not_tl(ret, arg1);
-    tcg_gen_shl_tl(ret, ret, arg2);
-    tcg_gen_not_tl(ret, ret);
-}
-
-static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_not_tl(ret, arg1);
-    tcg_gen_shr_tl(ret, ret, arg2);
-    tcg_gen_not_tl(ret, ret);
-}
-
-static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
-{
-    TCGv source1 = tcg_temp_new();
-    TCGv source2;
-
-    gen_get_gpr(source1, a->rs1);
-
-    if (a->shamt == (TARGET_LONG_BITS - 8)) {
-        /* rev8, byte swaps */
-        tcg_gen_bswap_tl(source1, source1);
-    } else {
-        source2 = tcg_temp_new();
-        tcg_gen_movi_tl(source2, a->shamt);
-        gen_helper_grev(source1, source1, source2);
-        tcg_temp_free(source2);
-    }
-
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    return true;
-}
-
 #define GEN_SHADD(SHAMT)                                       \
 static void gen_sh##SHAMT##add(TCGv ret, TCGv arg1, TCGv arg2) \
 {                                                              \
@@ -665,23 +612,6 @@ static void gen_cpopw(TCGv ret, TCGv arg1)
     tcg_gen_ctpop_tl(ret, arg1);
 }
 
-static void gen_packw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    TCGv t = tcg_temp_new();
-    tcg_gen_ext16s_tl(t, arg2);
-    tcg_gen_deposit_tl(ret, arg1, t, 16, 48);
-    tcg_temp_free(t);
-}
-
-static void gen_packuw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    TCGv t = tcg_temp_new();
-    tcg_gen_shri_tl(t, arg1, 16);
-    tcg_gen_deposit_tl(ret, arg2, t, 0, 16);
-    tcg_gen_ext32s_tl(ret, ret);
-    tcg_temp_free(t);
-}
-
 static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
 {
     TCGv_i32 t1 = tcg_temp_new_i32();
@@ -718,18 +648,6 @@ static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free_i32(t2);
 }
 
-static void gen_grevw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_ext32u_tl(arg1, arg1);
-    gen_helper_grev(ret, arg1, arg2);
-}
-
-static void gen_gorcw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_ext32u_tl(arg1, arg1);
-    gen_helper_gorcw(ret, arg1, arg2);
-}
-
 #define GEN_SHADD_UW(SHAMT)                                       \
 static void gen_sh##SHAMT##add_uw(TCGv ret, TCGv arg1, TCGv arg2) \
 {                                                                 \
@@ -753,6 +671,40 @@ static void gen_add_uw(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_gen_add_tl(ret, arg1, arg2);
 }
 
+static void gen_clmulx(DisasContext *ctx, arg_r *a, bool reverse)
+{
+    TCGv source1 = tcg_temp_new();
+    TCGv source2 = tcg_temp_new();
+    TCGv zeroreg = tcg_const_tl(0);
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+    TCGv result = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+    gen_get_gpr(source2, a->rs2);
+    tcg_gen_movi_tl(result, 0);
+
+    for (int i = 0; i < TARGET_LONG_BITS; i++) {
+        tcg_gen_shri_tl(t0, source2, i);
+        if (reverse) {
+            tcg_gen_shri_tl(t1, source1, TARGET_LONG_BITS - i - 1);
+        } else {
+            tcg_gen_shli_tl(t1, source1, i);
+        }
+        tcg_gen_andi_tl(t0, t0, 1);
+        tcg_gen_xor_tl(t1, result, t1);
+        tcg_gen_movcond_tl(TCG_COND_NE, result, t0, zeroreg, t1, result);
+    }
+
+    gen_set_gpr(a->rd, result);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    tcg_temp_free(zeroreg);
+    tcg_temp_free(result);
+}
+
 static bool gen_arith(DisasContext *ctx, arg_r *a,
                       void(*func)(TCGv, TCGv, TCGv))
 {
-- 
2.25.1


