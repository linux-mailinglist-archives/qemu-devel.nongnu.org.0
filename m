Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E48543785A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 15:49:30 +0200 (CEST)
Received: from localhost ([::1]:44966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mduvJ-0002TB-JW
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 09:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdumF-0001Cq-0p
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:40:07 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:36402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdumC-0001Id-41
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:40:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634910004; x=1666446004;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CD7GpwFieZlpWbU34RcvkwJja7SFwA9K9hD87Zyczec=;
 b=WVoAi1bIBmshsylH0Ktc/J01z/UZlXDUu7kvoyT1X0EsjtCm9kv7QkU5
 i4xj3CubuVC6fjaNfzkInq3Mv7si+JEW9lygocDlZ4SU9CJA2bSg4wQ+N
 z+XN8cbSdswPdL4N37OZNo7HbOwUHAE15ST7EjinFXFM3uDtvMY37OccF
 I/iKpzrN+A+Q6fucz6WvZajtobCgnPDRWfwlZ+kz5lU6XM5UJfiEe2ng+
 oj0XkBN0Am2k3jx6FF8WVzExEok4n97ewsoaSNiHU3uDuRnzOgYxKOeyF
 yvTci2qbUPXPyfHP2w+7iZ2OuEpnE8IelFL5VUgRIgvC1LGSYLgmnKfso w==;
X-IronPort-AV: E=Sophos;i="5.87,172,1631548800"; d="scan'208";a="184556313"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:40:02 +0800
IronPort-SDR: 9Lz0qTaOgQi/LwqeVFlHvQpJ4QMx5fBzvx8g1u/WkZHNLykkJ1ep9J51idNb2QbCx+I1axAwnm
 9gVWHz6sVwLJqKAu4dwotwhDuXBvhlVzjaJDUfANrswXnSDVdRIXRJTeh9lO1riF13PvTt2SIa
 cVcVhMp+NFVFBLhH2TIHOTTVPnGvy/jjiZGKYC0gqZIh80AhwJB876vtoa7nCRQkzoNxU4eS2X
 p8ETcZB+VdVf7aIBtKPDUKU7ZD69CWgMDunvtPYBWX0vfvByOHaqjSjAbJ/ZtOuM/Jj/9rJARW
 vWdf6MQ9zqoygCXuw1KgJpcI
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:15:36 -0700
IronPort-SDR: 29fApXyiiy7duCerSO/UdXyiU9QI9Rj2IjxU4mqSG0gIvf/yKRivTVJBjNa450q3/l05aGG4Ef
 VnXR9e+o20WCBzmgfpyYlAn45YTt/5QFU1UFq3EeLB/jfR7QpYLsgtAPa2btXBsGiRubMoE1+2
 nqoJtyV9anFAv1MXoUqSvU0K6cYBC6/0JFdtTcQIBNUmgK9TJ5uGbW31+GWvABCq6k6HetX7Ww
 u99Jh6OoKM/5lRREXShnJbA6PQVDF99c+7gdyo/G97P3ljIBm5mKSNUVzSXq0S3blEo4YVeFAH
 xso=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:40:02 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQSx3k4Xz1RtVm
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:40:01 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634910000; x=1637502001; bh=CD7GpwFieZlpWbU34R
 cvkwJja7SFwA9K9hD87Zyczec=; b=XrDrR0VLgKeaC/L6PR9OBZcOL3IqfkdLBE
 SgGvQXkDZ9RY6DI/Sdz/v1KV6UezP6hv9o6tZa4cr9m61N1UYpgE5Cq99ochJXfB
 9cFbwGtgGP6FpBcuO+emSM6nPyPM+opZ6rTbsELfu+w4mKTGX/m4TgsPxsfp15/q
 pmuT4BSAdVakU22fghV//7I5r0O56Xhpecjvz10N4i34QFl0V36dR3Y4+joSccwW
 D35ue7PEJVfdnc0bQD4ZTu13Byh9XR2M/GdiCkXVcWcjQJlH579lWDSXGZQq1DTY
 GnACKYyCej6Xi3zOzfvzp1cQAThkjuDq+x5O7c50cmUruO1OXyLw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Rnsdly6MaNz7 for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:40:00 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQSr4P50z1RtVl;
 Fri, 22 Oct 2021 06:39:55 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 16/33] target/riscv: Replace DisasContext.w with DisasContext.ol
Date: Fri, 22 Oct 2021 23:37:55 +1000
Message-Id: <20211022133812.3972903-17-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
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

In preparation for RV128, consider more than just "w" for
operand size modification.  This will be used for the "d"
insns from RV128 as well.

Rename oper_len to get_olen to better match get_xlen.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20211020031709.359469-10-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c                | 69 ++++++++++++++++---------
 target/riscv/insn_trans/trans_rvb.c.inc |  8 +--
 target/riscv/insn_trans/trans_rvi.c.inc | 18 +++----
 target/riscv/insn_trans/trans_rvm.c.inc | 10 ++--
 4 files changed, 62 insertions(+), 43 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d0ba54091e..afd59ef690 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -67,7 +67,7 @@ typedef struct DisasContext {
        to any system register, which includes CSR_FRM, so we do not have
        to reset this known value.  */
     int frm;
-    bool w;
+    RISCVMXL ol;
     bool virt_enabled;
     bool ext_ifencei;
     bool hlsx;
@@ -104,13 +104,18 @@ static inline int __attribute__((unused)) get_xlen(=
DisasContext *ctx)
     return 16 << get_xl(ctx);
 }
=20
-/* The word size for this operation. */
-static inline int oper_len(DisasContext *ctx)
+/* The operation length, as opposed to the xlen. */
+#ifdef TARGET_RISCV32
+#define get_ol(ctx)    MXL_RV32
+#else
+#define get_ol(ctx)    ((ctx)->ol)
+#endif
+
+static inline int get_olen(DisasContext *ctx)
 {
-    return ctx->w ? 32 : TARGET_LONG_BITS;
+    return 16 << get_ol(ctx);
 }
=20
-
 /*
  * RISC-V requires NaN-boxing of narrower width floating point values.
  * This applies when a 32-bit value is assigned to a 64-bit FP register.
@@ -197,24 +202,34 @@ static TCGv get_gpr(DisasContext *ctx, int reg_num,=
 DisasExtend ext)
         return ctx->zero;
     }
=20
-    switch (ctx->w ? ext : EXT_NONE) {
-    case EXT_NONE:
-        return cpu_gpr[reg_num];
-    case EXT_SIGN:
-        t =3D temp_new(ctx);
-        tcg_gen_ext32s_tl(t, cpu_gpr[reg_num]);
-        return t;
-    case EXT_ZERO:
-        t =3D temp_new(ctx);
-        tcg_gen_ext32u_tl(t, cpu_gpr[reg_num]);
-        return t;
+    switch (get_ol(ctx)) {
+    case MXL_RV32:
+        switch (ext) {
+        case EXT_NONE:
+            break;
+        case EXT_SIGN:
+            t =3D temp_new(ctx);
+            tcg_gen_ext32s_tl(t, cpu_gpr[reg_num]);
+            return t;
+        case EXT_ZERO:
+            t =3D temp_new(ctx);
+            tcg_gen_ext32u_tl(t, cpu_gpr[reg_num]);
+            return t;
+        default:
+            g_assert_not_reached();
+        }
+        break;
+    case MXL_RV64:
+        break;
+    default:
+        g_assert_not_reached();
     }
-    g_assert_not_reached();
+    return cpu_gpr[reg_num];
 }
=20
 static TCGv dest_gpr(DisasContext *ctx, int reg_num)
 {
-    if (reg_num =3D=3D 0 || ctx->w) {
+    if (reg_num =3D=3D 0 || get_olen(ctx) < TARGET_LONG_BITS) {
         return temp_new(ctx);
     }
     return cpu_gpr[reg_num];
@@ -223,10 +238,15 @@ static TCGv dest_gpr(DisasContext *ctx, int reg_num=
)
 static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
 {
     if (reg_num !=3D 0) {
-        if (ctx->w) {
+        switch (get_ol(ctx)) {
+        case MXL_RV32:
             tcg_gen_ext32s_tl(cpu_gpr[reg_num], t);
-        } else {
+            break;
+        case MXL_RV64:
             tcg_gen_mov_tl(cpu_gpr[reg_num], t);
+            break;
+        default:
+            g_assert_not_reached();
         }
     }
 }
@@ -387,7 +407,7 @@ static bool gen_shift_imm_fn(DisasContext *ctx, arg_s=
hift *a, DisasExtend ext,
                              void (*func)(TCGv, TCGv, target_long))
 {
     TCGv dest, src1;
-    int max_len =3D oper_len(ctx);
+    int max_len =3D get_olen(ctx);
=20
     if (a->shamt >=3D max_len) {
         return false;
@@ -406,7 +426,7 @@ static bool gen_shift_imm_tl(DisasContext *ctx, arg_s=
hift *a, DisasExtend ext,
                              void (*func)(TCGv, TCGv, TCGv))
 {
     TCGv dest, src1, src2;
-    int max_len =3D oper_len(ctx);
+    int max_len =3D get_olen(ctx);
=20
     if (a->shamt >=3D max_len) {
         return false;
@@ -430,7 +450,7 @@ static bool gen_shift(DisasContext *ctx, arg_r *a, Di=
sasExtend ext,
     TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
     TCGv ext2 =3D tcg_temp_new();
=20
-    tcg_gen_andi_tl(ext2, src2, oper_len(ctx) - 1);
+    tcg_gen_andi_tl(ext2, src2, get_olen(ctx) - 1);
     func(dest, src1, ext2);
=20
     gen_set_gpr(ctx, a->rd, dest);
@@ -530,7 +550,6 @@ static void riscv_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
     ctx->vl_eq_vlmax =3D FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
     ctx->xl =3D FIELD_EX32(tb_flags, TB_FLAGS, XL);
     ctx->cs =3D cs;
-    ctx->w =3D false;
     ctx->ntemp =3D 0;
     memset(ctx->temp, 0, sizeof(ctx->temp));
=20
@@ -554,9 +573,9 @@ static void riscv_tr_translate_insn(DisasContextBase =
*dcbase, CPUState *cpu)
     CPURISCVState *env =3D cpu->env_ptr;
     uint16_t opcode16 =3D translator_lduw(env, &ctx->base, ctx->base.pc_=
next);
=20
+    ctx->ol =3D ctx->xl;
     decode_opc(env, ctx, opcode16);
     ctx->base.pc_next =3D ctx->pc_succ_insn;
-    ctx->w =3D false;
=20
     for (int i =3D ctx->ntemp - 1; i >=3D 0; --i) {
         tcg_temp_free(ctx->temp[i]);
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index 3095624f32..9ef8ab94ad 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -344,7 +344,7 @@ static bool trans_cpopw(DisasContext *ctx, arg_cpopw =
*a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBB(ctx);
-    ctx->w =3D true;
+    ctx->ol =3D MXL_RV32;
     return gen_unary(ctx, a, EXT_ZERO, tcg_gen_ctpop_tl);
 }
=20
@@ -370,7 +370,7 @@ static bool trans_rorw(DisasContext *ctx, arg_rorw *a=
)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBB(ctx);
-    ctx->w =3D true;
+    ctx->ol =3D MXL_RV32;
     return gen_shift(ctx, a, EXT_NONE, gen_rorw);
 }
=20
@@ -378,7 +378,7 @@ static bool trans_roriw(DisasContext *ctx, arg_roriw =
*a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBB(ctx);
-    ctx->w =3D true;
+    ctx->ol =3D MXL_RV32;
     return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_rorw);
 }
=20
@@ -404,7 +404,7 @@ static bool trans_rolw(DisasContext *ctx, arg_rolw *a=
)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBB(ctx);
-    ctx->w =3D true;
+    ctx->ol =3D MXL_RV32;
     return gen_shift(ctx, a, EXT_NONE, gen_rolw);
 }
=20
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
index a6a57c94bb..9cf0383cfb 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -331,14 +331,14 @@ static bool trans_and(DisasContext *ctx, arg_and *a=
)
 static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
 {
     REQUIRE_64BIT(ctx);
-    ctx->w =3D true;
+    ctx->ol =3D MXL_RV32;
     return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_addi_tl);
 }
=20
 static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
 {
     REQUIRE_64BIT(ctx);
-    ctx->w =3D true;
+    ctx->ol =3D MXL_RV32;
     return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl);
 }
=20
@@ -350,7 +350,7 @@ static void gen_srliw(TCGv dst, TCGv src, target_long=
 shamt)
 static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
 {
     REQUIRE_64BIT(ctx);
-    ctx->w =3D true;
+    ctx->ol =3D MXL_RV32;
     return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_srliw);
 }
=20
@@ -362,42 +362,42 @@ static void gen_sraiw(TCGv dst, TCGv src, target_lo=
ng shamt)
 static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
 {
     REQUIRE_64BIT(ctx);
-    ctx->w =3D true;
+    ctx->ol =3D MXL_RV32;
     return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_sraiw);
 }
=20
 static bool trans_addw(DisasContext *ctx, arg_addw *a)
 {
     REQUIRE_64BIT(ctx);
-    ctx->w =3D true;
+    ctx->ol =3D MXL_RV32;
     return gen_arith(ctx, a, EXT_NONE, tcg_gen_add_tl);
 }
=20
 static bool trans_subw(DisasContext *ctx, arg_subw *a)
 {
     REQUIRE_64BIT(ctx);
-    ctx->w =3D true;
+    ctx->ol =3D MXL_RV32;
     return gen_arith(ctx, a, EXT_NONE, tcg_gen_sub_tl);
 }
=20
 static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
 {
     REQUIRE_64BIT(ctx);
-    ctx->w =3D true;
+    ctx->ol =3D MXL_RV32;
     return gen_shift(ctx, a, EXT_NONE, tcg_gen_shl_tl);
 }
=20
 static bool trans_srlw(DisasContext *ctx, arg_srlw *a)
 {
     REQUIRE_64BIT(ctx);
-    ctx->w =3D true;
+    ctx->ol =3D MXL_RV32;
     return gen_shift(ctx, a, EXT_ZERO, tcg_gen_shr_tl);
 }
=20
 static bool trans_sraw(DisasContext *ctx, arg_sraw *a)
 {
     REQUIRE_64BIT(ctx);
-    ctx->w =3D true;
+    ctx->ol =3D MXL_RV32;
     return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl);
 }
=20
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_=
trans/trans_rvm.c.inc
index b89a85ad3a..9a1fe3c799 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -214,7 +214,7 @@ static bool trans_mulw(DisasContext *ctx, arg_mulw *a=
)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
-    ctx->w =3D true;
+    ctx->ol =3D MXL_RV32;
     return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl);
 }
=20
@@ -222,7 +222,7 @@ static bool trans_divw(DisasContext *ctx, arg_divw *a=
)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
-    ctx->w =3D true;
+    ctx->ol =3D MXL_RV32;
     return gen_arith(ctx, a, EXT_SIGN, gen_div);
 }
=20
@@ -230,7 +230,7 @@ static bool trans_divuw(DisasContext *ctx, arg_divuw =
*a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
-    ctx->w =3D true;
+    ctx->ol =3D MXL_RV32;
     return gen_arith(ctx, a, EXT_ZERO, gen_divu);
 }
=20
@@ -238,7 +238,7 @@ static bool trans_remw(DisasContext *ctx, arg_remw *a=
)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
-    ctx->w =3D true;
+    ctx->ol =3D MXL_RV32;
     return gen_arith(ctx, a, EXT_SIGN, gen_rem);
 }
=20
@@ -246,6 +246,6 @@ static bool trans_remuw(DisasContext *ctx, arg_remuw =
*a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
-    ctx->w =3D true;
+    ctx->ol =3D MXL_RV32;
     return gen_arith(ctx, a, EXT_ZERO, gen_remu);
 }
--=20
2.31.1


