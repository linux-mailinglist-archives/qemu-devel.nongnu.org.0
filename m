Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B52A63FD147
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:23:49 +0200 (CEST)
Received: from localhost ([::1]:49768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLFum-00009W-N5
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFj8-0006La-Gg
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:11:46 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:3906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFj3-0008Fb-FU
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:11:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462300; x=1661998300;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZjbTSWK/IeIR5M5RWh3ICCne55eYSA/5bCO0T8iapR8=;
 b=ljiG4X/41+rcXJYZlE1VDGGc2XOd16FQt5fUFl9+rvuU9l79ETFMnS+h
 WMLeyX9Sw/80Kv9PXnXhjaAW3TrU1kc7ewr2e6oofH1uDL/Sm/MKuaVfj
 nSYvaePxdYfiGx4zhX/P9MVylgaCGNoqliRuk7qCNOn+bta1pE0gJycz+
 kFSTsurreeLeViE6HmeangDvZWlnDJykil6cuvNb9+lnY3GrcewjmqTnb
 ZoNblVYIchH0f6/uPkmXfvHvDDkq8KZVN69T6DlCRT8Zb8iElY5vyo9NN
 /tZ8DOiFiXfb4OBU7m0FU/eWRcjc9EoW571wjVviy++/unW+ots/uyMXk g==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="178910785"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:11:39 +0800
IronPort-SDR: 61oX862I3LUE7lFXc/FmSoAQ7K2X5FKsA9b95LWbnanLdscUPiu/kahHhb5QU5MMLXiujIlTXp
 43j/saiNhWuYTGBnLvcN5nejiBbn2Zjtf0Hw8oLkz8cs0TynTgUuakLh8eA5d8PogY5l+era3y
 KwF88dFUYoLR4i0RYXGgUoXKKirgkYl/DzRHI1v/zbZFApK0LG9XhpAtfPld2Q2GjidmGX0GJZ
 B6NxhbsCKIeY3WJPqafJQ6dTC0fkY84nGytD5T2FzkfidS6h1BA50Upx3NWHnjP1PFrctQh+Os
 Nu33DkZEO78TnKCURTADiCN2
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:48:28 -0700
IronPort-SDR: rdxxa1beYBQn2MueYeKe2lTHuxazqa4VPSmniVUDiXw4kIDaiVLGYMDAGR0Rnpr7FFv959fzC9
 iIYYTAIl0CVzv1jkbgOC5bM6HIUGFqchVdO+RlaHhRXKlV7oBmm2Psay4A2pduoY9moloZaiEh
 f7uLONKz2OisK+zVCxtK6d3TZLYnEmKhqty1EzWmb+I1uwYkLKv4K4dQE5PWyGgswK2sFhu0f2
 ZobrgZEoqqHLaX+QYWrzkdywQkX4ZWOFIsvQUrnglqWwTgeL2q7Q2gbwhWl5lW3MuPyWO0ijZV
 Vk0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:11:40 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4GzncD17Fvz1RvmF
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:11:40 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630462295; x=1633054296; bh=ZjbTSWK/IeIR5M5RWh
 3ICCne55eYSA/5bCO0T8iapR8=; b=nAnMvp79k+h0z3CpR8G856CT2QAblvbhZu
 Wm2qVVTiQ7nPhbcJV8GBZCAH5urnO13fpwayEIbpB4a8fouemYPuiB2Iaz/aTNRL
 JdhyGMMRy7G8ROPlyg0aaFdbevhdQmNf8LjZp+H+CK/PONPWk0D02XCAQLSDYOz6
 NKn9ojdCIxSNQkCnNxTKYmBqdafSnZUWPaIrz58aN9Hc9oj1H9eG8x84xkjeMJdm
 yGG/yEXcy0nh56wGO32CjvLPhJgn/FBNgLSuQ5n0tcZMhNR9H/Dq9rcC2fbBeC4q
 6xpQ7MZW84NdYE7Q8LRXsrncLmGF+rC/XMeFSZRYB//VSoZy5MzQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id wK1lG-ysTyCi for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:11:35 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Gznc30zGYz1Rvl9;
 Tue, 31 Aug 2021 19:11:30 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 15/33] target/riscv: Add DisasExtend to gen_arith*
Date: Wed,  1 Sep 2021 12:09:40 +1000
Message-Id: <20210901020958.458454-16-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=871df42ed=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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

From: Richard Henderson <richard.henderson@linaro.org>

Most arithmetic does not require extending the inputs.
Exceptions include division, comparison and minmax.

Begin using ctx->w, which allows elimination of gen_addw,
gen_subw, gen_mulw.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210823195529.560295-7-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c                | 69 +++++++------------------
 target/riscv/insn_trans/trans_rvb.c.inc | 30 +++++------
 target/riscv/insn_trans/trans_rvi.c.inc | 39 ++++++++------
 target/riscv/insn_trans/trans_rvm.c.inc | 16 +++---
 4 files changed, 64 insertions(+), 90 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d7552dc377..7dd2839288 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -230,7 +230,7 @@ static void gen_get_gpr(DisasContext *ctx, TCGv t, in=
t reg_num)
     tcg_gen_mov_tl(t, get_gpr(ctx, reg_num, EXT_NONE));
 }
=20
-static TCGv __attribute__((unused)) dest_gpr(DisasContext *ctx, int reg_=
num)
+static TCGv dest_gpr(DisasContext *ctx, int reg_num)
 {
     if (reg_num =3D=3D 0 || ctx->w) {
         return temp_new(ctx);
@@ -482,57 +482,31 @@ static int ex_rvc_shifti(DisasContext *ctx, int imm=
)
 /* Include the auto-generated decoder for 32 bit insn */
 #include "decode-insn32.c.inc"
=20
-static bool gen_arith_imm_fn(DisasContext *ctx, arg_i *a,
+static bool gen_arith_imm_fn(DisasContext *ctx, arg_i *a, DisasExtend ex=
t,
                              void (*func)(TCGv, TCGv, target_long))
 {
-    TCGv source1;
-    source1 =3D tcg_temp_new();
-
-    gen_get_gpr(ctx, source1, a->rs1);
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv src1 =3D get_gpr(ctx, a->rs1, ext);
=20
-    (*func)(source1, source1, a->imm);
+    func(dest, src1, a->imm);
=20
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
=20
-static bool gen_arith_imm_tl(DisasContext *ctx, arg_i *a,
+static bool gen_arith_imm_tl(DisasContext *ctx, arg_i *a, DisasExtend ex=
t,
                              void (*func)(TCGv, TCGv, TCGv))
 {
-    TCGv source1, source2;
-    source1 =3D tcg_temp_new();
-    source2 =3D tcg_temp_new();
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv src1 =3D get_gpr(ctx, a->rs1, ext);
+    TCGv src2 =3D tcg_constant_tl(a->imm);
=20
-    gen_get_gpr(ctx, source1, a->rs1);
-    tcg_gen_movi_tl(source2, a->imm);
+    func(dest, src1, src2);
=20
-    (*func)(source1, source1, source2);
-
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
=20
-static void gen_addw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_add_tl(ret, arg1, arg2);
-    tcg_gen_ext32s_tl(ret, ret);
-}
-
-static void gen_subw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_sub_tl(ret, arg1, arg2);
-    tcg_gen_ext32s_tl(ret, ret);
-}
-
-static void gen_mulw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_mul_tl(ret, arg1, arg2);
-    tcg_gen_ext32s_tl(ret, ret);
-}
-
 static bool gen_arith_div_w(DisasContext *ctx, arg_r *a,
                             void(*func)(TCGv, TCGv, TCGv))
 {
@@ -798,21 +772,16 @@ static void gen_add_uw(TCGv ret, TCGv arg1, TCGv ar=
g2)
     tcg_gen_add_tl(ret, arg1, arg2);
 }
=20
-static bool gen_arith(DisasContext *ctx, arg_r *a,
-                      void(*func)(TCGv, TCGv, TCGv))
+static bool gen_arith(DisasContext *ctx, arg_r *a, DisasExtend ext,
+                      void (*func)(TCGv, TCGv, TCGv))
 {
-    TCGv source1, source2;
-    source1 =3D tcg_temp_new();
-    source2 =3D tcg_temp_new();
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv src1 =3D get_gpr(ctx, a->rs1, ext);
+    TCGv src2 =3D get_gpr(ctx, a->rs2, ext);
=20
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
+    func(dest, src1, src2);
=20
-    (*func)(source1, source1, source2);
-
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
=20
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index 260e15b47d..217a7d1f26 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -38,61 +38,61 @@ static bool trans_cpop(DisasContext *ctx, arg_cpop *a=
)
 static bool trans_andn(DisasContext *ctx, arg_andn *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, tcg_gen_andc_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_andc_tl);
 }
=20
 static bool trans_orn(DisasContext *ctx, arg_orn *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, tcg_gen_orc_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_orc_tl);
 }
=20
 static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, tcg_gen_eqv_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_eqv_tl);
 }
=20
 static bool trans_pack(DisasContext *ctx, arg_pack *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, gen_pack);
+    return gen_arith(ctx, a, EXT_NONE, gen_pack);
 }
=20
 static bool trans_packu(DisasContext *ctx, arg_packu *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, gen_packu);
+    return gen_arith(ctx, a, EXT_NONE, gen_packu);
 }
=20
 static bool trans_packh(DisasContext *ctx, arg_packh *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, gen_packh);
+    return gen_arith(ctx, a, EXT_NONE, gen_packh);
 }
=20
 static bool trans_min(DisasContext *ctx, arg_min *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, tcg_gen_smin_tl);
+    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_smin_tl);
 }
=20
 static bool trans_max(DisasContext *ctx, arg_max *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, tcg_gen_smax_tl);
+    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_smax_tl);
 }
=20
 static bool trans_minu(DisasContext *ctx, arg_minu *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, tcg_gen_umin_tl);
+    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_umin_tl);
 }
=20
 static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, tcg_gen_umax_tl);
+    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_umax_tl);
 }
=20
 static bool trans_sext_b(DisasContext *ctx, arg_sext_b *a)
@@ -230,7 +230,7 @@ static bool trans_gorci(DisasContext *ctx, arg_gorci =
*a)
 static bool trans_sh##SHAMT##add(DisasContext *ctx, arg_sh##SHAMT##add *=
a) \
 {                                                                       =
   \
     REQUIRE_EXT(ctx, RVB);                                              =
   \
-    return gen_arith(ctx, a, gen_sh##SHAMT##add);                       =
   \
+    return gen_arith(ctx, a, EXT_NONE, gen_sh##SHAMT##add);             =
   \
 }
=20
 GEN_TRANS_SHADD(1)
@@ -262,14 +262,14 @@ static bool trans_packw(DisasContext *ctx, arg_pack=
w *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, gen_packw);
+    return gen_arith(ctx, a, EXT_NONE, gen_packw);
 }
=20
 static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, gen_packuw);
+    return gen_arith(ctx, a, EXT_NONE, gen_packuw);
 }
=20
 static bool trans_bsetw(DisasContext *ctx, arg_bsetw *a)
@@ -404,7 +404,7 @@ static bool trans_sh##SHAMT##add_uw(DisasContext *ctx=
,        \
 {                                                             \
     REQUIRE_64BIT(ctx);                                       \
     REQUIRE_EXT(ctx, RVB);                                    \
-    return gen_arith(ctx, a, gen_sh##SHAMT##add_uw);          \
+    return gen_arith(ctx, a, EXT_NONE, gen_sh##SHAMT##add_uw);  \
 }
=20
 GEN_TRANS_SHADD_UW(1)
@@ -415,7 +415,7 @@ static bool trans_add_uw(DisasContext *ctx, arg_add_u=
w *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, gen_add_uw);
+    return gen_arith(ctx, a, EXT_NONE, gen_add_uw);
 }
=20
 static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
index f1a5d8de56..bd80476852 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -230,7 +230,7 @@ static bool trans_sd(DisasContext *ctx, arg_sd *a)
=20
 static bool trans_addi(DisasContext *ctx, arg_addi *a)
 {
-    return gen_arith_imm_fn(ctx, a, &tcg_gen_addi_tl);
+    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_addi_tl);
 }
=20
 static void gen_slt(TCGv ret, TCGv s1, TCGv s2)
@@ -243,29 +243,31 @@ static void gen_sltu(TCGv ret, TCGv s1, TCGv s2)
     tcg_gen_setcond_tl(TCG_COND_LTU, ret, s1, s2);
 }
=20
-
 static bool trans_slti(DisasContext *ctx, arg_slti *a)
 {
-    return gen_arith_imm_tl(ctx, a, &gen_slt);
+    return gen_arith_imm_tl(ctx, a, EXT_SIGN, gen_slt);
 }
=20
 static bool trans_sltiu(DisasContext *ctx, arg_sltiu *a)
 {
-    return gen_arith_imm_tl(ctx, a, &gen_sltu);
+    return gen_arith_imm_tl(ctx, a, EXT_SIGN, gen_sltu);
 }
=20
 static bool trans_xori(DisasContext *ctx, arg_xori *a)
 {
-    return gen_arith_imm_fn(ctx, a, &tcg_gen_xori_tl);
+    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_xori_tl);
 }
+
 static bool trans_ori(DisasContext *ctx, arg_ori *a)
 {
-    return gen_arith_imm_fn(ctx, a, &tcg_gen_ori_tl);
+    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_ori_tl);
 }
+
 static bool trans_andi(DisasContext *ctx, arg_andi *a)
 {
-    return gen_arith_imm_fn(ctx, a, &tcg_gen_andi_tl);
+    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_andi_tl);
 }
+
 static bool trans_slli(DisasContext *ctx, arg_slli *a)
 {
     return gen_shifti(ctx, a, tcg_gen_shl_tl);
@@ -283,12 +285,12 @@ static bool trans_srai(DisasContext *ctx, arg_srai =
*a)
=20
 static bool trans_add(DisasContext *ctx, arg_add *a)
 {
-    return gen_arith(ctx, a, &tcg_gen_add_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_add_tl);
 }
=20
 static bool trans_sub(DisasContext *ctx, arg_sub *a)
 {
-    return gen_arith(ctx, a, &tcg_gen_sub_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_sub_tl);
 }
=20
 static bool trans_sll(DisasContext *ctx, arg_sll *a)
@@ -298,17 +300,17 @@ static bool trans_sll(DisasContext *ctx, arg_sll *a=
)
=20
 static bool trans_slt(DisasContext *ctx, arg_slt *a)
 {
-    return gen_arith(ctx, a, &gen_slt);
+    return gen_arith(ctx, a, EXT_SIGN, gen_slt);
 }
=20
 static bool trans_sltu(DisasContext *ctx, arg_sltu *a)
 {
-    return gen_arith(ctx, a, &gen_sltu);
+    return gen_arith(ctx, a, EXT_SIGN, gen_sltu);
 }
=20
 static bool trans_xor(DisasContext *ctx, arg_xor *a)
 {
-    return gen_arith(ctx, a, &tcg_gen_xor_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_xor_tl);
 }
=20
 static bool trans_srl(DisasContext *ctx, arg_srl *a)
@@ -323,18 +325,19 @@ static bool trans_sra(DisasContext *ctx, arg_sra *a=
)
=20
 static bool trans_or(DisasContext *ctx, arg_or *a)
 {
-    return gen_arith(ctx, a, &tcg_gen_or_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_or_tl);
 }
=20
 static bool trans_and(DisasContext *ctx, arg_and *a)
 {
-    return gen_arith(ctx, a, &tcg_gen_and_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_and_tl);
 }
=20
 static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
 {
     REQUIRE_64BIT(ctx);
-    return gen_arith_imm_tl(ctx, a, &gen_addw);
+    ctx->w =3D true;
+    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_addi_tl);
 }
=20
 static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
@@ -370,13 +373,15 @@ static bool trans_sraiw(DisasContext *ctx, arg_srai=
w *a)
 static bool trans_addw(DisasContext *ctx, arg_addw *a)
 {
     REQUIRE_64BIT(ctx);
-    return gen_arith(ctx, a, &gen_addw);
+    ctx->w =3D true;
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_add_tl);
 }
=20
 static bool trans_subw(DisasContext *ctx, arg_subw *a)
 {
     REQUIRE_64BIT(ctx);
-    return gen_arith(ctx, a, &gen_subw);
+    ctx->w =3D true;
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_sub_tl);
 }
=20
 static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_=
trans/trans_rvm.c.inc
index 0a4318f18e..013b3f7009 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -22,7 +22,7 @@
 static bool trans_mul(DisasContext *ctx, arg_mul *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, &tcg_gen_mul_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl);
 }
=20
 static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
@@ -44,7 +44,7 @@ static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, &gen_mulhsu);
+    return gen_arith(ctx, a, EXT_NONE, gen_mulhsu);
 }
=20
 static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
@@ -66,33 +66,33 @@ static bool trans_mulhu(DisasContext *ctx, arg_mulhu =
*a)
 static bool trans_div(DisasContext *ctx, arg_div *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, &gen_div);
+    return gen_arith(ctx, a, EXT_SIGN, gen_div);
 }
=20
 static bool trans_divu(DisasContext *ctx, arg_divu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, &gen_divu);
+    return gen_arith(ctx, a, EXT_ZERO, gen_divu);
 }
=20
 static bool trans_rem(DisasContext *ctx, arg_rem *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, &gen_rem);
+    return gen_arith(ctx, a, EXT_SIGN, gen_rem);
 }
=20
 static bool trans_remu(DisasContext *ctx, arg_remu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, &gen_remu);
+    return gen_arith(ctx, a, EXT_ZERO, gen_remu);
 }
=20
 static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
-
-    return gen_arith(ctx, a, &gen_mulw);
+    ctx->w =3D true;
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl);
 }
=20
 static bool trans_divw(DisasContext *ctx, arg_divw *a)
--=20
2.31.1


