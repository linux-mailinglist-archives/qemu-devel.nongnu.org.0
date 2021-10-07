Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CF9424DA3
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 09:02:48 +0200 (CEST)
Received: from localhost ([::1]:43354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNQV-0005wy-Hj
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 03:02:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNDR-00046e-4c
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:49:17 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:24054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNDO-0006EZ-SE
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:49:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633589354; x=1665125354;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MxalhseLi36UKYAPd5ZRGgexP5PLsfw7Q5xkRkgPNTw=;
 b=iuChB8H0Of62Qs42KK4Ilew17BGqBw/Vt9qiFxClb/aefcEEThkaFDUh
 QuKgV8GraTuga74hoayRCPqImfD5KOU3XuQ5E3YRgvAUr2FZmt15+T9H0
 tSLXB/yAzlRVLgvYz7agQ1PmmRJqO+tWPKFF0RrnhXda1UPC3cV9xDD5T
 mOadpK0rJTF1n6TCWr76W2OS3EdpAQ5asaXTLErfiUMiyBzxPjUtSjAdd
 R9bF+NB5OjrmM8DYhSxQl+B+wggzOQDItIdmiavls0GXOvjRJdpXEkhpX
 Cp9JxbBSA+MPptZ35NWfnjspKf/NlXKkvdzCOe/tM46+Vzr6HisfLedvn A==;
X-IronPort-AV: E=Sophos;i="5.85,352,1624291200"; d="scan'208";a="186894897"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2021 14:49:08 +0800
IronPort-SDR: ZUPsROyFGoBknAyWI/PA/3H5Lc65VAdjPrEfQYMzXMPY6vb+xpbGPnvzEOUvS3QfarNJJ+VbHE
 EA4ZPvb1WErwzBgLko9Z+rEVHB3ebl1itiMUO4IB2W3dPeK2rBO3Qurb4LU6KxO1gsE0O9IAnv
 MDzScQyA0/kdL/b82YB26yqlSac8IE3FJx5My4ukJokgrhVGVAoMg1a41gTkRb1HojGbCLeRGC
 JjSaxA3LIpYtVfrs23o/HRXI7Dw7L8bNVcvuckZen+DmTd6d7gooatPubir4KYM/9G/vmMjEns
 V002U4/atPsX2Me9y1blrYpn
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:23:27 -0700
IronPort-SDR: 53Ircg2CpuwBboZ1oyvmTdQcWhz9lfpYsSfbrKlswOXOFBWiOxjrp8H6W77Zm3WwgtS5kvAgGq
 VOLWUl4Wpjn20yoUzBfVTxpcGWb9PcnmEy99a2uWu1TTC6gmc9TO8gNrpjRBewlHN09OAtcjoG
 /X2Zg3crBvX3I42m0a5cPHrd0scu2OEG6v4xO1hYpLcSxMkGepAnM97bcAVejUOB12yeBD7gO1
 I1YBPQeN3JHv6pmvWP9QHUf0Dw5fZOV5HJejAL93QkmuP+QVShABdbb4fDhxUTNqTEYvU41pXg
 XTU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:49:07 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HQ23j2yHlz1SHvt
 for <qemu-devel@nongnu.org>; Wed,  6 Oct 2021 23:49:05 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1633589344; x=1636181345; bh=MxalhseLi36UKYAPd5
 ZRGgexP5PLsfw7Q5xkRkgPNTw=; b=ljd8m6xQra80FLNVV/k1gUFSsvjTSEsP6D
 vd/ra3cmI/yxQtNgzNsetaFgrdfOA23CeSrVoFfCcSiEu5scjCK9k89I8znzR/Cx
 L50nD42Q+NkrSCD4V4+nxjMZRAdKr0iZes3KWwM9mPTAGQ+VxSBYwxJmugRwxqga
 dTDudzXrN8P3pgpelyk1q7QEBvQhA2Gzt2icc3SITF5++Mv3fWJxfEEH7PayjAja
 b2+i1ehi30i+nwmVTba6XnPrWg7M0sLzP9uhdBXjPoOCMv36bPb3Qlph4D9sX7la
 ZAUSF3PEUazX+Lf/+lZ7sGa8CAtg3I5PTGt0NG9/rLjs6c5uKqkQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 5EpOtt22vpCz for <qemu-devel@nongnu.org>;
 Wed,  6 Oct 2021 23:49:04 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.32])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HQ23b10KVz1RvTg;
 Wed,  6 Oct 2021 23:48:58 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 10/26] target/riscv: Reassign instructions to the Zbb-extension
Date: Thu,  7 Oct 2021 16:47:35 +1000
Message-Id: <20211007064751.608580-11-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=907902f29=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philipp Tomsich <philipp.tomsich@vrull.eu>

This reassigns the instructions that are part of Zbb into it, with the
notable exceptions of the instructions (rev8, zext.w and orc.b) that
changed due to gorci, grevi and pack not being part of Zb[abcs].

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20210911140016.834071-11-philipp.tomsich@vrull.eu
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              | 40 ++++++++++---------
 target/riscv/insn_trans/trans_rvb.c.inc | 51 ++++++++++++++-----------
 2 files changed, 50 insertions(+), 41 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 1658bb4217..a509cfee11 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -672,45 +672,47 @@ sh2add_uw  0010000 .......... 100 ..... 0111011 @r
 sh3add_uw  0010000 .......... 110 ..... 0111011 @r
 slli_uw    00001 ............ 001 ..... 0011011 @sh
=20
-# *** RV32B Standard Extension ***
+# *** RV32 Zbb Standard Extension ***
+andn       0100000 .......... 111 ..... 0110011 @r
 clz        011000 000000 ..... 001 ..... 0010011 @r2
-ctz        011000 000001 ..... 001 ..... 0010011 @r2
 cpop       011000 000010 ..... 001 ..... 0010011 @r2
+ctz        011000 000001 ..... 001 ..... 0010011 @r2
+max        0000101 .......... 110 ..... 0110011 @r
+maxu       0000101 .......... 111 ..... 0110011 @r
+min        0000101 .......... 100 ..... 0110011 @r
+minu       0000101 .......... 101 ..... 0110011 @r
+orn        0100000 .......... 110 ..... 0110011 @r
+rol        0110000 .......... 001 ..... 0110011 @r
+ror        0110000 .......... 101 ..... 0110011 @r
+rori       01100 ............ 101 ..... 0010011 @sh
 sext_b     011000 000100 ..... 001 ..... 0010011 @r2
 sext_h     011000 000101 ..... 001 ..... 0010011 @r2
-
-andn       0100000 .......... 111 ..... 0110011 @r
-orn        0100000 .......... 110 ..... 0110011 @r
 xnor       0100000 .......... 100 ..... 0110011 @r
+
+# *** RV64 Zbb Standard Extension (in addition to RV32 Zbb) ***
+clzw       0110000 00000 ..... 001 ..... 0011011 @r2
+ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
+cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
+rolw       0110000 .......... 001 ..... 0111011 @r
+roriw      0110000 .......... 101 ..... 0011011 @sh5
+rorw       0110000 .......... 101 ..... 0111011 @r
+
+# *** RV32B Standard Extension ***
 pack       0000100 .......... 100 ..... 0110011 @r
 packu      0100100 .......... 100 ..... 0110011 @r
 packh      0000100 .......... 111 ..... 0110011 @r
-min        0000101 .......... 100 ..... 0110011 @r
-minu       0000101 .......... 101 ..... 0110011 @r
-max        0000101 .......... 110 ..... 0110011 @r
-maxu       0000101 .......... 111 ..... 0110011 @r
-ror        0110000 .......... 101 ..... 0110011 @r
-rol        0110000 .......... 001 ..... 0110011 @r
 grev       0110100 .......... 101 ..... 0110011 @r
 gorc       0010100 .......... 101 ..... 0110011 @r
=20
-rori       01100. ........... 101 ..... 0010011 @sh
 grevi      01101. ........... 101 ..... 0010011 @sh
 gorci      00101. ........... 101 ..... 0010011 @sh
=20
 # *** RV64B Standard Extension (in addition to RV32B) ***
-clzw       0110000 00000 ..... 001 ..... 0011011 @r2
-ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
-cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
-
 packw      0000100 .......... 100 ..... 0111011 @r
 packuw     0100100 .......... 100 ..... 0111011 @r
-rorw       0110000 .......... 101 ..... 0111011 @r
-rolw       0110000 .......... 001 ..... 0111011 @r
 grevw      0110100 .......... 101 ..... 0111011 @r
 gorcw      0010100 .......... 101 ..... 0111011 @r
=20
-roriw      0110000 .......... 101 ..... 0011011 @sh5
 greviw     0110100 .......... 101 ..... 0011011 @sh5
 gorciw     0010100 .......... 101 ..... 0011011 @sh5
=20
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index 2eb5fa3640..bdfb495f24 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -1,5 +1,5 @@
 /*
- * RISC-V translation routines for the Zb[acs] Standard Extension.
+ * RISC-V translation routines for the Zb[abcs] Standard Extension.
  *
  * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
  * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
@@ -24,6 +24,12 @@
     }                                            \
 } while (0)
=20
+#define REQUIRE_ZBB(ctx) do {                    \
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbb) {      \
+        return false;                            \
+    }                                            \
+} while (0)
+
 #define REQUIRE_ZBC(ctx) do {                    \
     if (!RISCV_CPU(ctx->cs)->cfg.ext_zbc) {      \
         return false;                            \
@@ -40,9 +46,10 @@ static void gen_clz(TCGv ret, TCGv arg1)
 {
     tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
 }
+
 static bool trans_clz(DisasContext *ctx, arg_clz *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_unary(ctx, a, EXT_ZERO, gen_clz);
 }
=20
@@ -53,31 +60,31 @@ static void gen_ctz(TCGv ret, TCGv arg1)
=20
 static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_unary(ctx, a, EXT_ZERO, gen_ctz);
 }
=20
 static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_unary(ctx, a, EXT_ZERO, tcg_gen_ctpop_tl);
 }
=20
 static bool trans_andn(DisasContext *ctx, arg_andn *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_arith(ctx, a, EXT_NONE, tcg_gen_andc_tl);
 }
=20
 static bool trans_orn(DisasContext *ctx, arg_orn *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_arith(ctx, a, EXT_NONE, tcg_gen_orc_tl);
 }
=20
 static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_arith(ctx, a, EXT_NONE, tcg_gen_eqv_tl);
 }
=20
@@ -124,37 +131,37 @@ static bool trans_packh(DisasContext *ctx, arg_pack=
h *a)
=20
 static bool trans_min(DisasContext *ctx, arg_min *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_arith(ctx, a, EXT_SIGN, tcg_gen_smin_tl);
 }
=20
 static bool trans_max(DisasContext *ctx, arg_max *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_arith(ctx, a, EXT_SIGN, tcg_gen_smax_tl);
 }
=20
 static bool trans_minu(DisasContext *ctx, arg_minu *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_arith(ctx, a, EXT_SIGN, tcg_gen_umin_tl);
 }
=20
 static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_arith(ctx, a, EXT_SIGN, tcg_gen_umax_tl);
 }
=20
 static bool trans_sext_b(DisasContext *ctx, arg_sext_b *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext8s_tl);
 }
=20
 static bool trans_sext_h(DisasContext *ctx, arg_sext_h *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext16s_tl);
 }
=20
@@ -250,19 +257,19 @@ static bool trans_bexti(DisasContext *ctx, arg_bext=
i *a)
=20
 static bool trans_ror(DisasContext *ctx, arg_ror *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotr_tl);
 }
=20
 static bool trans_rori(DisasContext *ctx, arg_rori *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_rotri_tl);
 }
=20
 static bool trans_rol(DisasContext *ctx, arg_rol *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotl_tl);
 }
=20
@@ -337,7 +344,7 @@ static void gen_clzw(TCGv ret, TCGv arg1)
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_unary(ctx, a, EXT_NONE, gen_clzw);
 }
=20
@@ -350,14 +357,14 @@ static void gen_ctzw(TCGv ret, TCGv arg1)
 static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_unary(ctx, a, EXT_NONE, gen_ctzw);
 }
=20
 static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     ctx->w =3D true;
     return gen_unary(ctx, a, EXT_ZERO, tcg_gen_ctpop_tl);
 }
@@ -414,7 +421,7 @@ static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
 static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     ctx->w =3D true;
     return gen_shift(ctx, a, EXT_NONE, gen_rorw);
 }
@@ -422,7 +429,7 @@ static bool trans_rorw(DisasContext *ctx, arg_rorw *a=
)
 static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     ctx->w =3D true;
     return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_rorw);
 }
@@ -448,7 +455,7 @@ static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
 static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     ctx->w =3D true;
     return gen_shift(ctx, a, EXT_NONE, gen_rolw);
 }
--=20
2.31.1


