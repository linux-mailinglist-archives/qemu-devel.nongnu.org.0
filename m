Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E43883FD15E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:34:04 +0200 (CEST)
Received: from localhost ([::1]:46334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLG4h-0008PB-W5
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFkg-0008LW-Dt
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:13:22 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:4046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFke-00014E-38
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:13:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462398; x=1661998398;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f68pj3zRW2+3ElTjnKouroMiut64+yHKHm+jnF2hZtg=;
 b=Ny9bqdLZx0/k9WbrfiqiFp9NzsbeQrBhAgomuaThdo/ZulDvimN1VzqW
 CPDmxfB1tG0Q6OoM1vABErtVI4IUN5xSVQevDkP+Qmk//5GXp24HJP48k
 8UPD4QU8EG++mrLsnJqpFunYlEVnENPkbNaEbNDVTVLw8T7a9nECh0xlO
 9VF0likrwfD6TYgxtVqhmz0QSkr/eGSDfzN6JoyCI2LWS43t/pjNM5K54
 PBGKwbyPy/86exeYOnSOT975E7C4QHTy7HEvQSKG5xk/AiBWSFj4/Kt7I
 qmp3AbbE97yPRkOckv0fp4wyLSG0u2yk39BcQ8szrBIP6xAurr1tx86DM A==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="178910919"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:13:17 +0800
IronPort-SDR: BFV2TfIVlSVMCCgnBjz2nGaTkI80FJAQYwhiWQZiQ+85AqExLBuvPpi93ixRXYh9cF0fOAA/7G
 PGMQq+RQcNY0VdPc3Nb2PFhFm5wWiYXAueXI04JetZQIH0dpe8rcaYsSdVVYUKVvo+C9fun1qd
 LjaQuM8GjLDhAR2lSj6PVPmPeXhwmeCujepgCe7I72MyrfFQXM7/qN+OJ+Dbehl8zHIpjhhrrD
 GpkQTig0e/kzyaPUUEbOl3LJJ9NEV2QEMctOIlfFs+wEusTS3bL4RVmKEmidEAfyS1i8SUSDom
 BDHLaLt69X9RIs9nW7yjuvbc
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:48:24 -0700
IronPort-SDR: U9u+3Qa/1R/9pRas1kwFpvt9e96qFZ43mSDnuNPj1FUqQqS85JfnOak5N7cVxDQbZZWT5Zdkuq
 sSDlVcY6MpEgQDyasW7U/r/pAamHiL9iYGw7/TedsQuodMHZTKDr3RWyZz7GQH/lklGf6lSc0J
 jPNPcNIefN+OAYVlERTYUZAjIo/pX9/uyL0wzlOJibVZpIIAMT92ocXkiPOXMchZ88EeL2LUIk
 jNALyi/j4PNM7f6rXvl0yTq8hV7edb8QYQupUkPgxpSYOvGuV4jIx2P8k8eK3vn4ZKefRCcPr8
 zrI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:13:19 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Gznf65cx7z1RvlZ
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:13:18 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630462393; x=1633054394; bh=f68pj3zRW2+3ElTjnK
 ouroMiut64+yHKHm+jnF2hZtg=; b=edzpSodFURrLcBDdzr0LmDf6uzTkZdxg+V
 Q+/wzXhQvWBcOH4DDJWPlqRB8ysgcv9cNJI1Dq5IY/Cpat2ldv1qIvxmj7MtaslU
 T3lu39d0yYKX9jaJTYgaajmHD5ogNNw8+ZTMOKYzDAN9B0oH7M5mg6X2foognUsT
 FwIyCJ74bUSyKymvIIM2G5BVnxZTncnwTPGCx/25IbUpTeTv9gHI88mCaX4eGiZo
 4YX6lolbckwCfx7vs8o1Dj+MxujDwlqEWzli53BbcSv17AS7SEJfnmRIrWcacBJ5
 SkivuCMgTqmOsk17I3+hsAvMnwofe5QBu9KBM/yp69jV5CZTCFKA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Gq7WTwsJxybn for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:13:13 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Gzndx5sylz1RvmD;
 Tue, 31 Aug 2021 19:13:09 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 33/33] target/riscv: Use {get,dest}_gpr for RVV
Date: Wed,  1 Sep 2021 12:09:58 +1000
Message-Id: <20210901020958.458454-34-alistair.francis@opensource.wdc.com>
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

Remove gen_get_gpr, as the function becomes unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210823195529.560295-25-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c                | 13 ++---
 target/riscv/insn_trans/trans_rvv.c.inc | 74 +++++++------------------
 2 files changed, 26 insertions(+), 61 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index e44254e878..e356fc6c46 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -232,11 +232,6 @@ static TCGv get_gpr(DisasContext *ctx, int reg_num, =
DisasExtend ext)
     g_assert_not_reached();
 }
=20
-static void gen_get_gpr(DisasContext *ctx, TCGv t, int reg_num)
-{
-    tcg_gen_mov_tl(t, get_gpr(ctx, reg_num, EXT_NONE));
-}
-
 static TCGv dest_gpr(DisasContext *ctx, int reg_num)
 {
     if (reg_num =3D=3D 0 || ctx->w) {
@@ -637,9 +632,11 @@ void riscv_translate_init(void)
 {
     int i;
=20
-    /* cpu_gpr[0] is a placeholder for the zero register. Do not use it.=
 */
-    /* Use the gen_set_gpr and gen_get_gpr helper functions when accessi=
ng */
-    /* registers, unless you specifically block reads/writes to reg 0 */
+    /*
+     * cpu_gpr[0] is a placeholder for the zero register. Do not use it.
+     * Use the gen_set_gpr and get_gpr helper functions when accessing r=
egs,
+     * unless you specifically block reads/writes to reg 0.
+     */
     cpu_gpr[0] =3D NULL;
=20
     for (i =3D 1; i < 32; i++) {
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index de580c493c..fa451938f1 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -27,27 +27,22 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetv=
l *a)
         return false;
     }
=20
-    s2 =3D tcg_temp_new();
-    dst =3D tcg_temp_new();
+    s2 =3D get_gpr(ctx, a->rs2, EXT_ZERO);
+    dst =3D dest_gpr(ctx, a->rd);
=20
     /* Using x0 as the rs1 register specifier, encodes an infinite AVL *=
/
     if (a->rs1 =3D=3D 0) {
         /* As the mask is at least one bit, RV_VLEN_MAX is >=3D VLMAX */
         s1 =3D tcg_constant_tl(RV_VLEN_MAX);
     } else {
-        s1 =3D tcg_temp_new();
-        gen_get_gpr(ctx, s1, a->rs1);
+        s1 =3D get_gpr(ctx, a->rs1, EXT_ZERO);
     }
-    gen_get_gpr(ctx, s2, a->rs2);
     gen_helper_vsetvl(dst, cpu_env, s1, s2);
     gen_set_gpr(ctx, a->rd, dst);
+
     tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
     lookup_and_goto_ptr(ctx);
     ctx->base.is_jmp =3D DISAS_NORETURN;
-
-    tcg_temp_free(s1);
-    tcg_temp_free(s2);
-    tcg_temp_free(dst);
     return true;
 }
=20
@@ -60,23 +55,20 @@ static bool trans_vsetvli(DisasContext *ctx, arg_vset=
vli *a)
     }
=20
     s2 =3D tcg_constant_tl(a->zimm);
-    dst =3D tcg_temp_new();
+    dst =3D dest_gpr(ctx, a->rd);
=20
     /* Using x0 as the rs1 register specifier, encodes an infinite AVL *=
/
     if (a->rs1 =3D=3D 0) {
         /* As the mask is at least one bit, RV_VLEN_MAX is >=3D VLMAX */
         s1 =3D tcg_constant_tl(RV_VLEN_MAX);
     } else {
-        s1 =3D tcg_temp_new();
-        gen_get_gpr(ctx, s1, a->rs1);
+        s1 =3D get_gpr(ctx, a->rs1, EXT_ZERO);
     }
     gen_helper_vsetvl(dst, cpu_env, s1, s2);
     gen_set_gpr(ctx, a->rd, dst);
+
     gen_goto_tb(ctx, 0, ctx->pc_succ_insn);
     ctx->base.is_jmp =3D DISAS_NORETURN;
-
-    tcg_temp_free(s1);
-    tcg_temp_free(dst);
     return true;
 }
=20
@@ -173,7 +165,7 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, =
uint32_t data,
=20
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
-    base =3D tcg_temp_new();
+    base =3D get_gpr(s, rs1, EXT_NONE);
=20
     /*
      * As simd_desc supports at most 256 bytes, and in this implementati=
on,
@@ -184,7 +176,6 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, =
uint32_t data,
      */
     desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data))=
;
=20
-    gen_get_gpr(s, base, rs1);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
=20
@@ -192,7 +183,6 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, =
uint32_t data,
=20
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
-    tcg_temp_free(base);
     gen_set_label(over);
     return true;
 }
@@ -330,12 +320,10 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t=
 rs1, uint32_t rs2,
=20
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
-    base =3D tcg_temp_new();
-    stride =3D tcg_temp_new();
+    base =3D get_gpr(s, rs1, EXT_NONE);
+    stride =3D get_gpr(s, rs2, EXT_NONE);
     desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data))=
;
=20
-    gen_get_gpr(s, base, rs1);
-    gen_get_gpr(s, stride, rs2);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
=20
@@ -343,8 +331,6 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t r=
s1, uint32_t rs2,
=20
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
-    tcg_temp_free(base);
-    tcg_temp_free(stride);
     gen_set_label(over);
     return true;
 }
@@ -458,10 +444,9 @@ static bool ldst_index_trans(uint32_t vd, uint32_t r=
s1, uint32_t vs2,
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
     index =3D tcg_temp_new_ptr();
-    base =3D tcg_temp_new();
+    base =3D get_gpr(s, rs1, EXT_NONE);
     desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data))=
;
=20
-    gen_get_gpr(s, base, rs1);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(index, cpu_env, vreg_ofs(s, vs2));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
@@ -471,7 +456,6 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs=
1, uint32_t vs2,
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(index);
-    tcg_temp_free(base);
     gen_set_label(over);
     return true;
 }
@@ -589,10 +573,9 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, ui=
nt32_t data,
=20
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
-    base =3D tcg_temp_new();
+    base =3D get_gpr(s, rs1, EXT_NONE);
     desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data))=
;
=20
-    gen_get_gpr(s, base, rs1);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
=20
@@ -600,7 +583,6 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uin=
t32_t data,
=20
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
-    tcg_temp_free(base);
     gen_set_label(over);
     return true;
 }
@@ -665,10 +647,9 @@ static bool amo_trans(uint32_t vd, uint32_t rs1, uin=
t32_t vs2,
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
     index =3D tcg_temp_new_ptr();
-    base =3D tcg_temp_new();
+    base =3D get_gpr(s, rs1, EXT_NONE);
     desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data))=
;
=20
-    gen_get_gpr(s, base, rs1);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(index, cpu_env, vreg_ofs(s, vs2));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
@@ -678,7 +659,6 @@ static bool amo_trans(uint32_t vd, uint32_t rs1, uint=
32_t vs2,
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(index);
-    tcg_temp_free(base);
     gen_set_label(over);
     return true;
 }
@@ -862,8 +842,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, ui=
nt32_t vs2, uint32_t vm,
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
     src2 =3D tcg_temp_new_ptr();
-    src1 =3D tcg_temp_new();
-    gen_get_gpr(s, src1, rs1);
+    src1 =3D get_gpr(s, rs1, EXT_NONE);
=20
     data =3D FIELD_DP32(data, VDATA, MLEN, s->mlen);
     data =3D FIELD_DP32(data, VDATA, VM, vm);
@@ -879,7 +858,6 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, ui=
nt32_t vs2, uint32_t vm,
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(src2);
-    tcg_temp_free(src1);
     gen_set_label(over);
     return true;
 }
@@ -905,15 +883,12 @@ do_opivx_gvec(DisasContext *s, arg_rmrr *a, GVecGen=
2sFn *gvec_fn,
=20
     if (a->vm && s->vl_eq_vlmax) {
         TCGv_i64 src1 =3D tcg_temp_new_i64();
-        TCGv tmp =3D tcg_temp_new();
=20
-        gen_get_gpr(s, tmp, a->rs1);
-        tcg_gen_ext_tl_i64(src1, tmp);
+        tcg_gen_ext_tl_i64(src1, get_gpr(s, a->rs1, EXT_SIGN));
         gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
                 src1, MAXSZ(s), MAXSZ(s));
=20
         tcg_temp_free_i64(src1);
-        tcg_temp_free(tmp);
         return true;
     }
     return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
@@ -1398,16 +1373,13 @@ do_opivx_gvec_shift(DisasContext *s, arg_rmrr *a,=
 GVecGen2sFn32 *gvec_fn,
=20
     if (a->vm && s->vl_eq_vlmax) {
         TCGv_i32 src1 =3D tcg_temp_new_i32();
-        TCGv tmp =3D tcg_temp_new();
=20
-        gen_get_gpr(s, tmp, a->rs1);
-        tcg_gen_trunc_tl_i32(src1, tmp);
+        tcg_gen_trunc_tl_i32(src1, get_gpr(s, a->rs1, EXT_NONE));
         tcg_gen_extract_i32(src1, src1, 0, s->sew + 3);
         gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
                 src1, MAXSZ(s), MAXSZ(s));
=20
         tcg_temp_free_i32(src1);
-        tcg_temp_free(tmp);
         return true;
     }
     return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
@@ -1665,8 +1637,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_=
v_x *a)
         TCGLabel *over =3D gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
=20
-        s1 =3D tcg_temp_new();
-        gen_get_gpr(s, s1, a->rs1);
+        s1 =3D get_gpr(s, a->rs1, EXT_SIGN);
=20
         if (s->vl_eq_vlmax) {
             tcg_gen_gvec_dup_tl(s->sew, vreg_ofs(s, a->rd),
@@ -1690,7 +1661,6 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_=
v_x *a)
             tcg_temp_free_i64(s1_i64);
         }
=20
-        tcg_temp_free(s1);
         gen_set_label(over);
         return true;
     }
@@ -2412,7 +2382,7 @@ static bool trans_vmpopc_m(DisasContext *s, arg_rmr=
 *a)
=20
         mask =3D tcg_temp_new_ptr();
         src2 =3D tcg_temp_new_ptr();
-        dst =3D tcg_temp_new();
+        dst =3D dest_gpr(s, a->rd);
         desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, da=
ta));
=20
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
@@ -2423,7 +2393,6 @@ static bool trans_vmpopc_m(DisasContext *s, arg_rmr=
 *a)
=20
         tcg_temp_free_ptr(mask);
         tcg_temp_free_ptr(src2);
-        tcg_temp_free(dst);
         return true;
     }
     return false;
@@ -2443,7 +2412,7 @@ static bool trans_vmfirst_m(DisasContext *s, arg_rm=
r *a)
=20
         mask =3D tcg_temp_new_ptr();
         src2 =3D tcg_temp_new_ptr();
-        dst =3D tcg_temp_new();
+        dst =3D dest_gpr(s, a->rd);
         desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, da=
ta));
=20
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
@@ -2454,7 +2423,6 @@ static bool trans_vmfirst_m(DisasContext *s, arg_rm=
r *a)
=20
         tcg_temp_free_ptr(mask);
         tcg_temp_free_ptr(src2);
-        tcg_temp_free(dst);
         return true;
     }
     return false;
@@ -2638,7 +2606,7 @@ static void vec_element_loadi(DisasContext *s, TCGv=
_i64 dest,
 static bool trans_vext_x_v(DisasContext *s, arg_r *a)
 {
     TCGv_i64 tmp =3D tcg_temp_new_i64();
-    TCGv dest =3D tcg_temp_new();
+    TCGv dest =3D dest_gpr(s, a->rd);
=20
     if (a->rs1 =3D=3D 0) {
         /* Special case vmv.x.s rd, vs2. */
@@ -2648,10 +2616,10 @@ static bool trans_vext_x_v(DisasContext *s, arg_r=
 *a)
         int vlmax =3D s->vlen >> (3 + s->sew);
         vec_element_loadx(s, tmp, a->rs2, cpu_gpr[a->rs1], vlmax);
     }
+
     tcg_gen_trunc_i64_tl(dest, tmp);
     gen_set_gpr(s, a->rd, dest);
=20
-    tcg_temp_free(dest);
     tcg_temp_free_i64(tmp);
     return true;
 }
--=20
2.31.1


