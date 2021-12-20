Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E00D947A452
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:24:15 +0100 (CET)
Received: from localhost ([::1]:39298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzB9i-0001kF-TU
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:24:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAlZ-0002FF-83
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:59:17 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAlX-0008Bi-F4
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:59:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976355; x=1671512355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XtfBzHaHh1lIhP4rVC6UO7ijF8P1Kf5q1alwEj6/TEc=;
 b=C6RwOIVfduEx0ez3gOOh6ksvu3EL2aPxxHNBoVEzw+Wv9AW1qYcQCiaH
 /tk4InE6dPNpb0uo4MAaEQEAECLHMLUvb44pCvKLRFcgLfD1L4VkwVect
 XV5xPHx7aTvDSdojlHSvDNyTOCzkCQ6diwM62rUE8d4BuY3vNHguBvsNy
 dbNca3l06nlv8HhQWAvjD8gdsj3hQqXczsQZ3SRPot7sDBYzdWxAmz6Tl
 2JClQ9fX3PRjaEfmafjsqWeVrtH2/IeGlanTlpvpl8MRzuKhScm5K78tD
 +3a+26rnwquuOVicj/PyCnO6tS8OSMuXQhNOcQUIyARRf5Mck4RKa+5rM Q==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292661955"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:59:14 +0800
IronPort-SDR: QAOA6/AooPxnaTny/L4IZsrjs4Ww2q3luMgM6H3qcl7awkagd9A0aihipA1I1JgOJ0raU2DjyP
 dvbMLqgWkDlkJWDLO5w8cHJejw+Xu4lJFgcY98ERK7e14BJzTLLN5wZjTp9IQxbAV0I7tvqoDk
 lQ+erCR917Fl6eOO2mmQendM3GzUNJQu1CNhypIWyng2woWTc+BjU6iHJloEx+bSu6VJspPM5C
 mTy7f0hLelB7oiZmMab/6ynAb+mL6ra3kn6x9IvgGd0/l8IYhK5WlsSXBIuFFTenSd2zxRMurk
 Y8Fc0R2EqIXWhb+zxnMzLcKq
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:32:03 -0800
IronPort-SDR: NrSEeXa4l8YMSsS4xC8vfNplcDmZlB8vfUXRaPrHpQc5jozW46AeNPlSsib1JQDH8/3mOZiJVC
 GZ4nFpIUVEV146HWjfzC0/AQXeEIo3dRw8g940F9lZygX1mdqazFG4qLYPHcmLlVMyw7yhcvtj
 U5lJXV9ERJKL8SJ0EcCcKiK9nKgFWJfBKrxv0/AyU6EimzqC1aFXnzuZuGDUZ1B4gJmPdnsh+d
 mZy4NgqBeh2ygIEpyCPEmKCES/v4MsmwjMznwDyJVeI1qjbnDdDgP46ELH3FEt6H1xbvNEwvcK
 3Vo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:59:15 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS6p0xp9z1RwFN
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:59:14 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976353; x=1642568354; bh=XtfBzHaHh1lIhP4rVC
 6UO7ijF8P1Kf5q1alwEj6/TEc=; b=W1y/HB01pFfhoHbQYq4B0TZHU7lncGF9r7
 F9FD/pnRnQCuOuwuRXQyXtIrYS+iQRrkizf6HzRM99kW8cSslOX22YycLBGEb2RK
 OpBvs/A6OKBvUcF+TCd0Qjy+imldyRmPLuAX3vLPtism8MOHLadH+KyWIfF+BFpR
 iqaKv6UqfH81oacKDCPuuxL15PaLsYElwu/obLJr/NnGo/QfkW+VIytnqBcQe23M
 Q7XNbiga1JMfp58OD2qtvZatdmcdv6tLZNzOCiOeRJ6X5WOdd9NZmykqX/z07Qd1
 bkaYDf8/H0etPVdLFbuj5hLfBMABumNzZoYza2BcEsVpPvsZa1SA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id WCglUzRI5TFT for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:59:13 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS6k3Svnz1RvTg;
 Sun, 19 Dec 2021 20:59:10 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 27/88] target/riscv: rvv-1.0: configure instructions
Date: Mon, 20 Dec 2021 14:56:04 +1000
Message-Id: <20211220045705.62174-28-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-20-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c            | 14 +++++-
 target/riscv/insn_trans/trans_rvv.c.inc | 62 +++++++++++--------------
 2 files changed, 40 insertions(+), 36 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index bf976d364f..78fae78284 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -31,12 +31,24 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, targe=
t_ulong s1,
 {
     int vlmax, vl;
     RISCVCPU *cpu =3D env_archcpu(env);
+    uint64_t lmul =3D FIELD_EX64(s2, VTYPE, VLMUL);
     uint16_t sew =3D 8 << FIELD_EX64(s2, VTYPE, VSEW);
     uint8_t ediv =3D FIELD_EX64(s2, VTYPE, VEDIV);
     bool vill =3D FIELD_EX64(s2, VTYPE, VILL);
     target_ulong reserved =3D FIELD_EX64(s2, VTYPE, RESERVED);
=20
-    if ((sew > cpu->cfg.elen) || vill || (ediv !=3D 0) || (reserved !=3D=
 0)) {
+    if (lmul & 4) {
+        /* Fractional LMUL. */
+        if (lmul =3D=3D 4 ||
+            cpu->cfg.elen >> (8 - lmul) < sew) {
+            vill =3D true;
+        }
+    }
+
+    if ((sew > cpu->cfg.elen)
+        || vill
+        || (ediv !=3D 0)
+        || (reserved !=3D 0)) {
         /* only set vill bit. */
         env->vtype =3D FIELD_DP64(0, VTYPE, VILL, 1);
         env->vl =3D 0;
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index afec187333..049688d83a 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -120,59 +120,51 @@ static bool require_noover(const int8_t dst, const =
int8_t dst_lmul,
     return !is_overlapped(dst, dst_size, src, src_size);
 }
=20
-static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
+static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
 {
-    TCGv s1, s2, dst;
+    TCGv s1, dst;
=20
-    if (!require_rvv(ctx) || !has_ext(ctx, RVV)) {
+    if (!require_rvv(s) || !has_ext(s, RVV)) {
         return false;
     }
=20
-    s2 =3D get_gpr(ctx, a->rs2, EXT_ZERO);
-    dst =3D dest_gpr(ctx, a->rd);
+    dst =3D dest_gpr(s, rd);
=20
-    /* Using x0 as the rs1 register specifier, encodes an infinite AVL *=
/
-    if (a->rs1 =3D=3D 0) {
+    if (rd =3D=3D 0 && rs1 =3D=3D 0) {
+        s1 =3D tcg_temp_new();
+        tcg_gen_mov_tl(s1, cpu_vl);
+    } else if (rs1 =3D=3D 0) {
         /* As the mask is at least one bit, RV_VLEN_MAX is >=3D VLMAX */
         s1 =3D tcg_constant_tl(RV_VLEN_MAX);
     } else {
-        s1 =3D get_gpr(ctx, a->rs1, EXT_ZERO);
+        s1 =3D get_gpr(s, rs1, EXT_ZERO);
     }
+
     gen_helper_vsetvl(dst, cpu_env, s1, s2);
-    gen_set_gpr(ctx, a->rd, dst);
-    mark_vs_dirty(ctx);
+    gen_set_gpr(s, rd, dst);
+    mark_vs_dirty(s);
=20
-    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
+    tcg_gen_movi_tl(cpu_pc, s->pc_succ_insn);
     tcg_gen_lookup_and_goto_ptr();
-    ctx->base.is_jmp =3D DISAS_NORETURN;
-    return true;
-}
+    s->base.is_jmp =3D DISAS_NORETURN;
=20
-static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
-{
-    TCGv s1, s2, dst;
-
-    if (!require_rvv(ctx) || !has_ext(ctx, RVV)) {
-        return false;
+    if (rd =3D=3D 0 && rs1 =3D=3D 0) {
+        tcg_temp_free(s1);
     }
=20
-    s2 =3D tcg_constant_tl(a->zimm);
-    dst =3D dest_gpr(ctx, a->rd);
+    return true;
+}
=20
-    /* Using x0 as the rs1 register specifier, encodes an infinite AVL *=
/
-    if (a->rs1 =3D=3D 0) {
-        /* As the mask is at least one bit, RV_VLEN_MAX is >=3D VLMAX */
-        s1 =3D tcg_constant_tl(RV_VLEN_MAX);
-    } else {
-        s1 =3D get_gpr(ctx, a->rs1, EXT_ZERO);
-    }
-    gen_helper_vsetvl(dst, cpu_env, s1, s2);
-    gen_set_gpr(ctx, a->rd, dst);
-    mark_vs_dirty(ctx);
+static bool trans_vsetvl(DisasContext *s, arg_vsetvl *a)
+{
+    TCGv s2 =3D get_gpr(s, a->rs2, EXT_ZERO);
+    return do_vsetvl(s, a->rd, a->rs1, s2);
+}
=20
-    gen_goto_tb(ctx, 0, ctx->pc_succ_insn);
-    ctx->base.is_jmp =3D DISAS_NORETURN;
-    return true;
+static bool trans_vsetvli(DisasContext *s, arg_vsetvli *a)
+{
+    TCGv s2 =3D tcg_constant_tl(a->zimm);
+    return do_vsetvl(s, a->rd, a->rs1, s2);
 }
=20
 /* vector register offset from env */
--=20
2.31.1


