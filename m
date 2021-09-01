Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D773FD15A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:31:49 +0200 (CEST)
Received: from localhost ([::1]:43110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLG2W-0006A7-AU
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFjd-0007OC-Q7
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:12:22 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:34349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFjb-0000TP-0A
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:12:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462336; x=1661998336;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fkim/Uv20ZPcmaaf0lgrDhqiCCAn/TuW2tC3ijlFooI=;
 b=IfBg8KkagvUtXirgluE7OTzprCzaASGmr7YI6sHoNncnchjyydNvSgD/
 KtkyMDJ9wIwSJ702JQrEyRSOTkQX/nnVAtFoZNW2CgvmRyXFr23awbq8i
 DG8dD8+xGBZXWeZvjimz5VN3RHf++Q7PIgtQfaHDMjWSAV4KNfZ3m5d1m
 MAzFbMza9Im7gnw8BaK2jZDfY/lD/8KfLhomGMwyPgFv9NphCpAIVvgQE
 fPqsE9Gq9qy8eUGi1YACtt9UOHFUljB7XqDXktJl1U9/TOBXdNXDIP//T
 sw5Y6CzjH5OPG94pu9FGlUlEMRf+u/JW6C0igUDK+O79SDmHGWrUJLnh9 g==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="179452466"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:12:14 +0800
IronPort-SDR: Ly3z4wp/5HcDZ6f8JTelJqimj3OF9vxlZ7E8+YfRKs0SxtVNVIv7UsK3Q1IxDnxS7QjX7HqXcr
 L6Ztr/WR0inw24xp4KctPU3q/Bj0EN1hoRsT2aOwuRJXg6ouPBagCfkA0pFfXo9Y3izgrWiNNo
 h+MqK85yR8OqxXbs5x8eOguMUWIx/0Mv/MDNTkafkwQgqbyoqxdc+8WqUE26izd56h8bjQSevP
 xzgWpCK9c2cKB+iCuzak5bqPbmexSNDgYAVw7SXR14iF1jMvDOkjdxm2UMfsoArRzVkroHNuVu
 Jsm5UXwYaDLgFtlDWZGBTU18
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:49:02 -0700
IronPort-SDR: cJn7bXwVuG5/jiHf42o9aqtXzZMEouSz1ctY2w24gGkHilWpE1rK+Gl6bW1qt5ceO1m3rh8S5F
 tquLUWWQMlUcN+WQuhu/URNr1arkeARl/LWV+TvcgjtYw1tztj6RGME7+l4bLuK/wf1wjFVJGY
 vyAFHFnEsxmOPN6HLwm4vKIDy9ZolGLY8b+0xEITIxjOesSmMER007CfvA8lce6ZAThoFW/3iJ
 ManOa6OQflkVcQWxFm7WKK+knqZH+nBih4ptr+923ulEFAMxtktEgXLKZfN8xox6bAh+c0lVct
 3Bg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:12:13 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Gzncs2rY8z1RvlZ
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:12:13 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630462328; x=1633054329; bh=Fkim/Uv20ZPcmaaf0l
 grDhqiCCAn/TuW2tC3ijlFooI=; b=QklJvDO0QssEjJuSwtv+gen8eg38EM2uwO
 zhE3MWHThyvZhaIeyWMrwKk/EuPLJxKTgji/pezCzCbq8zTHsFq9xFEcB5y8UGO5
 6/pgTKbLTSFfqR4eaMzGo/2vYmWSX7J77a3HUc0RlzcjPtKvhz1NZ82lQa+1wtJl
 mXjdCIQUk+OL2fk4+mGavs8cJqTyPN2pOK8dOR6+cmKjJxzQN1jIAYfFjsoxLI8x
 v8tg6eQaJuaxn9fapaEJ6e8VJoBt06kQ6ASUgZk5FOGnFDHrIhOI8cjWRuPH7vlx
 BOv2bP1hJZ+MlxgHGAb01NMg9d92TdSpR6Nwxrchgfs75tn+eOQA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id SViTZ-n0LH-o for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:12:08 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Gznch0Tbxz1Rvm1;
 Tue, 31 Aug 2021 19:12:03 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 21/33] target/riscv: Use DisasExtend in shift operations
Date: Wed,  1 Sep 2021 12:09:46 +1000
Message-Id: <20210901020958.458454-22-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=871df42ed=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

These operations are greatly simplified by ctx->w, which allows
us to fold gen_shiftw into gen_shift.  Split gen_shifti into
gen_shift_imm_{fn,tl} like we do for gen_arith_imm_{fn,tl}.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210823195529.560295-13-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c                | 110 +++++++++-----------
 target/riscv/insn_trans/trans_rvb.c.inc | 129 +++++++++++-------------
 target/riscv/insn_trans/trans_rvi.c.inc |  88 ++++------------
 3 files changed, 125 insertions(+), 202 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 785e9e58cc..e44254e878 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -99,6 +99,13 @@ static inline bool is_32bit(DisasContext *ctx)
 }
 #endif
=20
+/* The word size for this operation. */
+static inline int oper_len(DisasContext *ctx)
+{
+    return ctx->w ? 32 : TARGET_LONG_BITS;
+}
+
+
 /*
  * RISC-V requires NaN-boxing of narrower width floating point values.
  * This applies when a 32-bit value is assigned to a 64-bit FP register.
@@ -393,88 +400,58 @@ static bool gen_arith(DisasContext *ctx, arg_r *a, =
DisasExtend ext,
     return true;
 }
=20
-static bool gen_shift(DisasContext *ctx, arg_r *a,
-                        void(*func)(TCGv, TCGv, TCGv))
-{
-    TCGv source1 =3D tcg_temp_new();
-    TCGv source2 =3D tcg_temp_new();
-
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
-
-    tcg_gen_andi_tl(source2, source2, TARGET_LONG_BITS - 1);
-    (*func)(source1, source1, source2);
-
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
-}
-
-static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
+static bool gen_shift_imm_fn(DisasContext *ctx, arg_shift *a, DisasExten=
d ext,
+                             void (*func)(TCGv, TCGv, target_long))
 {
-    DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
-    CPUState *cpu =3D ctx->cs;
-    CPURISCVState *env =3D cpu->env_ptr;
+    TCGv dest, src1;
+    int max_len =3D oper_len(ctx);
=20
-    return cpu_ldl_code(env, pc);
-}
-
-static bool gen_shifti(DisasContext *ctx, arg_shift *a,
-                       void(*func)(TCGv, TCGv, TCGv))
-{
-    if (a->shamt >=3D TARGET_LONG_BITS) {
+    if (a->shamt >=3D max_len) {
         return false;
     }
=20
-    TCGv source1 =3D tcg_temp_new();
-    TCGv source2 =3D tcg_temp_new();
-
-    gen_get_gpr(ctx, source1, a->rs1);
+    dest =3D dest_gpr(ctx, a->rd);
+    src1 =3D get_gpr(ctx, a->rs1, ext);
=20
-    tcg_gen_movi_tl(source2, a->shamt);
-    (*func)(source1, source1, source2);
+    func(dest, src1, a->shamt);
=20
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
=20
-static bool gen_shiftw(DisasContext *ctx, arg_r *a,
-                       void(*func)(TCGv, TCGv, TCGv))
+static bool gen_shift_imm_tl(DisasContext *ctx, arg_shift *a, DisasExten=
d ext,
+                             void (*func)(TCGv, TCGv, TCGv))
 {
-    TCGv source1 =3D tcg_temp_new();
-    TCGv source2 =3D tcg_temp_new();
+    TCGv dest, src1, src2;
+    int max_len =3D oper_len(ctx);
+
+    if (a->shamt >=3D max_len) {
+        return false;
+    }
=20
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
+    dest =3D dest_gpr(ctx, a->rd);
+    src1 =3D get_gpr(ctx, a->rs1, ext);
+    src2 =3D tcg_constant_tl(a->shamt);
=20
-    tcg_gen_andi_tl(source2, source2, 31);
-    (*func)(source1, source1, source2);
-    tcg_gen_ext32s_tl(source1, source1);
+    func(dest, src1, src2);
=20
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
=20
-static bool gen_shiftiw(DisasContext *ctx, arg_shift *a,
-                        void(*func)(TCGv, TCGv, TCGv))
+static bool gen_shift(DisasContext *ctx, arg_r *a, DisasExtend ext,
+                      void (*func)(TCGv, TCGv, TCGv))
 {
-    TCGv source1 =3D tcg_temp_new();
-    TCGv source2 =3D tcg_temp_new();
-
-    gen_get_gpr(ctx, source1, a->rs1);
-    tcg_gen_movi_tl(source2, a->shamt);
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv src1 =3D get_gpr(ctx, a->rs1, ext);
+    TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
+    TCGv ext2 =3D tcg_temp_new();
=20
-    (*func)(source1, source1, source2);
-    tcg_gen_ext32s_tl(source1, source1);
+    tcg_gen_andi_tl(ext2, src2, oper_len(ctx) - 1);
+    func(dest, src1, ext2);
=20
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
+    gen_set_gpr(ctx, a->rd, dest);
+    tcg_temp_free(ext2);
     return true;
 }
=20
@@ -490,6 +467,15 @@ static bool gen_unary(DisasContext *ctx, arg_r2 *a, =
DisasExtend ext,
     return true;
 }
=20
+static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
+{
+    DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
+    CPUState *cpu =3D ctx->cs;
+    CPURISCVState *env =3D cpu->env_ptr;
+
+    return cpu_ldl_code(env, pc);
+}
+
 /* Include insn module translation function */
 #include "insn_trans/trans_rvi.c.inc"
 #include "insn_trans/trans_rvm.c.inc"
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index e255678fff..b97c3ca5da 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -160,13 +160,13 @@ static void gen_bset(TCGv ret, TCGv arg1, TCGv sham=
t)
 static bool trans_bset(DisasContext *ctx, arg_bset *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, gen_bset);
+    return gen_shift(ctx, a, EXT_NONE, gen_bset);
 }
=20
 static bool trans_bseti(DisasContext *ctx, arg_bseti *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shifti(ctx, a, gen_bset);
+    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bset);
 }
=20
 static void gen_bclr(TCGv ret, TCGv arg1, TCGv shamt)
@@ -182,13 +182,13 @@ static void gen_bclr(TCGv ret, TCGv arg1, TCGv sham=
t)
 static bool trans_bclr(DisasContext *ctx, arg_bclr *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, gen_bclr);
+    return gen_shift(ctx, a, EXT_NONE, gen_bclr);
 }
=20
 static bool trans_bclri(DisasContext *ctx, arg_bclri *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shifti(ctx, a, gen_bclr);
+    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bclr);
 }
=20
 static void gen_binv(TCGv ret, TCGv arg1, TCGv shamt)
@@ -204,13 +204,13 @@ static void gen_binv(TCGv ret, TCGv arg1, TCGv sham=
t)
 static bool trans_binv(DisasContext *ctx, arg_binv *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, gen_binv);
+    return gen_shift(ctx, a, EXT_NONE, gen_binv);
 }
=20
 static bool trans_binvi(DisasContext *ctx, arg_binvi *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shifti(ctx, a, gen_binv);
+    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_binv);
 }
=20
 static void gen_bext(TCGv ret, TCGv arg1, TCGv shamt)
@@ -222,13 +222,13 @@ static void gen_bext(TCGv ret, TCGv arg1, TCGv sham=
t)
 static bool trans_bext(DisasContext *ctx, arg_bext *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, gen_bext);
+    return gen_shift(ctx, a, EXT_NONE, gen_bext);
 }
=20
 static bool trans_bexti(DisasContext *ctx, arg_bexti *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shifti(ctx, a, gen_bext);
+    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bext);
 }
=20
 static void gen_slo(TCGv ret, TCGv arg1, TCGv arg2)
@@ -241,13 +241,13 @@ static void gen_slo(TCGv ret, TCGv arg1, TCGv arg2)
 static bool trans_slo(DisasContext *ctx, arg_slo *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, gen_slo);
+    return gen_shift(ctx, a, EXT_NONE, gen_slo);
 }
=20
 static bool trans_sloi(DisasContext *ctx, arg_sloi *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shifti(ctx, a, gen_slo);
+    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_slo);
 }
=20
 static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
@@ -260,82 +260,65 @@ static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
 static bool trans_sro(DisasContext *ctx, arg_sro *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, gen_sro);
+    return gen_shift(ctx, a, EXT_ZERO, gen_sro);
 }
=20
 static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shifti(ctx, a, gen_sro);
+    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_sro);
 }
=20
 static bool trans_ror(DisasContext *ctx, arg_ror *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, tcg_gen_rotr_tl);
+    return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotr_tl);
 }
=20
 static bool trans_rori(DisasContext *ctx, arg_rori *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shifti(ctx, a, tcg_gen_rotr_tl);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_rotri_tl);
 }
=20
 static bool trans_rol(DisasContext *ctx, arg_rol *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, tcg_gen_rotl_tl);
+    return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotl_tl);
 }
=20
 static bool trans_grev(DisasContext *ctx, arg_grev *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, gen_helper_grev);
+    return gen_shift(ctx, a, EXT_NONE, gen_helper_grev);
 }
=20
-static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
+static void gen_grevi(TCGv dest, TCGv src, target_long shamt)
 {
-    TCGv source1 =3D tcg_temp_new();
-    TCGv source2;
-
-    gen_get_gpr(ctx, source1, a->rs1);
-
-    if (a->shamt =3D=3D (TARGET_LONG_BITS - 8)) {
+    if (shamt =3D=3D TARGET_LONG_BITS - 8) {
         /* rev8, byte swaps */
-        tcg_gen_bswap_tl(source1, source1);
+        tcg_gen_bswap_tl(dest, src);
     } else {
-        source2 =3D tcg_temp_new();
-        tcg_gen_movi_tl(source2, a->shamt);
-        gen_helper_grev(source1, source1, source2);
-        tcg_temp_free(source2);
+        gen_helper_grev(dest, src, tcg_constant_tl(shamt));
     }
-
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    return true;
 }
=20
 static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
 {
     REQUIRE_EXT(ctx, RVB);
-
-    if (a->shamt >=3D TARGET_LONG_BITS) {
-        return false;
-    }
-
-    return gen_grevi(ctx, a);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_grevi);
 }
=20
 static bool trans_gorc(DisasContext *ctx, arg_gorc *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, gen_helper_gorc);
+    return gen_shift(ctx, a, EXT_ZERO, gen_helper_gorc);
 }
=20
 static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shifti(ctx, a, gen_helper_gorc);
+    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_helper_gorc);
 }
=20
 #define GEN_SHADD(SHAMT)                                       \
@@ -433,77 +416,88 @@ static bool trans_bsetw(DisasContext *ctx, arg_bset=
w *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_bset);
+    ctx->w =3D true;
+    return gen_shift(ctx, a, EXT_NONE, gen_bset);
 }
=20
 static bool trans_bsetiw(DisasContext *ctx, arg_bsetiw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_bset);
+    ctx->w =3D true;
+    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bset);
 }
=20
 static bool trans_bclrw(DisasContext *ctx, arg_bclrw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_bclr);
+    ctx->w =3D true;
+    return gen_shift(ctx, a, EXT_NONE, gen_bclr);
 }
=20
 static bool trans_bclriw(DisasContext *ctx, arg_bclriw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_bclr);
+    ctx->w =3D true;
+    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bclr);
 }
=20
 static bool trans_binvw(DisasContext *ctx, arg_binvw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_binv);
+    ctx->w =3D true;
+    return gen_shift(ctx, a, EXT_NONE, gen_binv);
 }
=20
 static bool trans_binviw(DisasContext *ctx, arg_binviw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_binv);
+    ctx->w =3D true;
+    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_binv);
 }
=20
 static bool trans_bextw(DisasContext *ctx, arg_bextw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_bext);
+    ctx->w =3D true;
+    return gen_shift(ctx, a, EXT_NONE, gen_bext);
 }
=20
 static bool trans_slow(DisasContext *ctx, arg_slow *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_slo);
+    ctx->w =3D true;
+    return gen_shift(ctx, a, EXT_NONE, gen_slo);
 }
=20
 static bool trans_sloiw(DisasContext *ctx, arg_sloiw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_slo);
+    ctx->w =3D true;
+    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_slo);
 }
=20
 static bool trans_srow(DisasContext *ctx, arg_srow *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_sro);
+    ctx->w =3D true;
+    return gen_shift(ctx, a, EXT_ZERO, gen_sro);
 }
=20
 static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_sro);
+    ctx->w =3D true;
+    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_sro);
 }
=20
 static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
@@ -528,14 +522,16 @@ static bool trans_rorw(DisasContext *ctx, arg_rorw =
*a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_rorw);
+    ctx->w =3D true;
+    return gen_shift(ctx, a, EXT_NONE, gen_rorw);
 }
=20
 static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_rorw);
+    ctx->w =3D true;
+    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_rorw);
 }
=20
 static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
@@ -560,47 +556,40 @@ static bool trans_rolw(DisasContext *ctx, arg_rolw =
*a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_rolw);
-}
-
-static void gen_grevw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_ext32u_tl(arg1, arg1);
-    gen_helper_grev(ret, arg1, arg2);
+    ctx->w =3D true;
+    return gen_shift(ctx, a, EXT_NONE, gen_rolw);
 }
=20
 static bool trans_grevw(DisasContext *ctx, arg_grevw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_grevw);
+    ctx->w =3D true;
+    return gen_shift(ctx, a, EXT_ZERO, gen_helper_grev);
 }
=20
 static bool trans_greviw(DisasContext *ctx, arg_greviw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_grevw);
-}
-
-static void gen_gorcw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_ext32u_tl(arg1, arg1);
-    gen_helper_gorcw(ret, arg1, arg2);
+    ctx->w =3D true;
+    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_helper_grev);
 }
=20
 static bool trans_gorcw(DisasContext *ctx, arg_gorcw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_gorcw);
+    ctx->w =3D true;
+    return gen_shift(ctx, a, EXT_ZERO, gen_helper_gorc);
 }
=20
 static bool trans_gorciw(DisasContext *ctx, arg_gorciw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_gorcw);
+    ctx->w =3D true;
+    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_helper_gorc);
 }
=20
 #define GEN_SHADD_UW(SHAMT)                                       \
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
index bd80476852..e4726e618c 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -270,17 +270,17 @@ static bool trans_andi(DisasContext *ctx, arg_andi =
*a)
=20
 static bool trans_slli(DisasContext *ctx, arg_slli *a)
 {
-    return gen_shifti(ctx, a, tcg_gen_shl_tl);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl);
 }
=20
 static bool trans_srli(DisasContext *ctx, arg_srli *a)
 {
-    return gen_shifti(ctx, a, tcg_gen_shr_tl);
+    return gen_shift_imm_fn(ctx, a, EXT_ZERO, tcg_gen_shri_tl);
 }
=20
 static bool trans_srai(DisasContext *ctx, arg_srai *a)
 {
-    return gen_shifti(ctx, a, tcg_gen_sar_tl);
+    return gen_shift_imm_fn(ctx, a, EXT_SIGN, tcg_gen_sari_tl);
 }
=20
 static bool trans_add(DisasContext *ctx, arg_add *a)
@@ -295,7 +295,7 @@ static bool trans_sub(DisasContext *ctx, arg_sub *a)
=20
 static bool trans_sll(DisasContext *ctx, arg_sll *a)
 {
-    return gen_shift(ctx, a, &tcg_gen_shl_tl);
+    return gen_shift(ctx, a, EXT_NONE, tcg_gen_shl_tl);
 }
=20
 static bool trans_slt(DisasContext *ctx, arg_slt *a)
@@ -315,12 +315,12 @@ static bool trans_xor(DisasContext *ctx, arg_xor *a=
)
=20
 static bool trans_srl(DisasContext *ctx, arg_srl *a)
 {
-    return gen_shift(ctx, a, &tcg_gen_shr_tl);
+    return gen_shift(ctx, a, EXT_ZERO, tcg_gen_shr_tl);
 }
=20
 static bool trans_sra(DisasContext *ctx, arg_sra *a)
 {
-    return gen_shift(ctx, a, &tcg_gen_sar_tl);
+    return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl);
 }
=20
 static bool trans_or(DisasContext *ctx, arg_or *a)
@@ -343,31 +343,22 @@ static bool trans_addiw(DisasContext *ctx, arg_addi=
w *a)
 static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
 {
     REQUIRE_64BIT(ctx);
-    return gen_shiftiw(ctx, a, tcg_gen_shl_tl);
+    ctx->w =3D true;
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl);
 }
=20
 static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
 {
     REQUIRE_64BIT(ctx);
-    TCGv t =3D tcg_temp_new();
-    gen_get_gpr(ctx, t, a->rs1);
-    tcg_gen_extract_tl(t, t, a->shamt, 32 - a->shamt);
-    /* sign-extend for W instructions */
-    tcg_gen_ext32s_tl(t, t);
-    gen_set_gpr(ctx, a->rd, t);
-    tcg_temp_free(t);
-    return true;
+    ctx->w =3D true;
+    return gen_shift_imm_fn(ctx, a, EXT_ZERO, tcg_gen_shri_tl);
 }
=20
 static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
 {
     REQUIRE_64BIT(ctx);
-    TCGv t =3D tcg_temp_new();
-    gen_get_gpr(ctx, t, a->rs1);
-    tcg_gen_sextract_tl(t, t, a->shamt, 32 - a->shamt);
-    gen_set_gpr(ctx, a->rd, t);
-    tcg_temp_free(t);
-    return true;
+    ctx->w =3D true;
+    return gen_shift_imm_fn(ctx, a, EXT_SIGN, tcg_gen_sari_tl);
 }
=20
 static bool trans_addw(DisasContext *ctx, arg_addw *a)
@@ -387,65 +378,22 @@ static bool trans_subw(DisasContext *ctx, arg_subw =
*a)
 static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
 {
     REQUIRE_64BIT(ctx);
-    TCGv source1 =3D tcg_temp_new();
-    TCGv source2 =3D tcg_temp_new();
-
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
-
-    tcg_gen_andi_tl(source2, source2, 0x1F);
-    tcg_gen_shl_tl(source1, source1, source2);
-
-    tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
+    ctx->w =3D true;
+    return gen_shift(ctx, a, EXT_NONE, tcg_gen_shl_tl);
 }
=20
 static bool trans_srlw(DisasContext *ctx, arg_srlw *a)
 {
     REQUIRE_64BIT(ctx);
-    TCGv source1 =3D tcg_temp_new();
-    TCGv source2 =3D tcg_temp_new();
-
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
-
-    /* clear upper 32 */
-    tcg_gen_ext32u_tl(source1, source1);
-    tcg_gen_andi_tl(source2, source2, 0x1F);
-    tcg_gen_shr_tl(source1, source1, source2);
-
-    tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
+    ctx->w =3D true;
+    return gen_shift(ctx, a, EXT_ZERO, tcg_gen_shr_tl);
 }
=20
 static bool trans_sraw(DisasContext *ctx, arg_sraw *a)
 {
     REQUIRE_64BIT(ctx);
-    TCGv source1 =3D tcg_temp_new();
-    TCGv source2 =3D tcg_temp_new();
-
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
-
-    /*
-     * first, trick to get it to act like working on 32 bits (get rid of
-     * upper 32, sign extend to fill space)
-     */
-    tcg_gen_ext32s_tl(source1, source1);
-    tcg_gen_andi_tl(source2, source2, 0x1F);
-    tcg_gen_sar_tl(source1, source1, source2);
-
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-
-    return true;
+    ctx->w =3D true;
+    return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl);
 }
=20
 static bool trans_fence(DisasContext *ctx, arg_fence *a)
--=20
2.31.1


