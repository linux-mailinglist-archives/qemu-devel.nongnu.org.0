Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DE6488293
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:45:35 +0100 (CET)
Received: from localhost ([::1]:55012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n66KV-0003xp-Bn
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 02:39:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64fB-00019E-Na
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:53:14 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:63935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64f8-0006wZ-SF
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:53:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621189; x=1673157189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aPpbmxGXBLVZXdLHSgZrAmwm9Qpnbv/0CylDO/cJTNQ=;
 b=gE8wUnd/RSCKYCB6OlfkxIcyDV26ZibeJSvsm6TsdOpwaYmo2ZEhc+mZ
 yk7ABjSF/w8Dv3RwiI3q7pJ4zn7l2cIUJhJYBAy/s1yUMAyo9U4FL6D/O
 ljgrSapehahyvVbzOOTEiIbAtfPQ2Oh4cz35MIRc5GU8IXwGBgNqCSqJT
 9G2PhYi5RFBOt8ZWysEjIXJJ4vRrppwICgFoEVd+mhOfsjpnwPGM+v0vd
 0qhZ9cmSS6xJRwf4OI3GKLdqFpf+Cl24xXiF8nvTfjswEk3K91RJZILsb
 nCj0vxKLfIJ3rSr0H8VyD1dCzm90jOBo1CGugg10f11bUqN7AAB4sF2ob w==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="189984944"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:53:08 +0800
IronPort-SDR: j5GXp9WjN3YMLkxgFztYrhtRJM9EMOJXzr3bE1w+rzdbOR4ks67rYRBzR4y0GANmJXLxtwGn18
 NQPdY64mpLCMtL1AiIlrptxKc7QSEbMCF4Q9lL+j2IgsP0FUKyPhdW+1MSIzOIhusQhRJaV/5z
 MzaXevSLryVWcn3R0eJ4xUz3kFCS1RFe9iDwvNuEHiDbEoK5KPVUq8NpnV98ohCecaDgGFMCCp
 O0D8usX1FfJwfk66vlcXZNtDfxVt4uoNOC0tjSfn2svFzUy3DZZJzQw7IGYQqw3CRXLvW233Rr
 XS8hM/82T/CnZ2ydSCiTmZjy
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:25:36 -0800
IronPort-SDR: OBuoow02Vu6kpK0AHXoZoB1mInMgH/nYYD8VQpWp4gg1Cnni8xrFiSk61WSXl2d/2WemD8IKBI
 AVwIBrTXW2sHUw47xTS2qOuPHs2wBeAgyODYEB+qZDzIFuBuOUILeacxKRAzA8qqcyuynAoyj2
 JGr9TL8gbGMmaM7Zq+/3mQEYxL5Vgu9tBezaZezArNVa6JRveWjeWXnvN1khM1lBkHwrwMx9Fg
 5s+J6NyJA/jLmi+i46EWA4sY/bw8hAKBGfd2CunWlbOOfzuS4y6ub2nU9yG6eM5zVRbFZ7u00d
 t6g=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:53:11 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8QF5D4Sz1VSkY
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:53:09 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1641621188; x=1644213189; bh=aPpbmxG
 XBLVZXdLHSgZrAmwm9Qpnbv/0CylDO/cJTNQ=; b=lY5gN0WZcuziEGC+W/JLCCI
 4qJlEfTeHIZudaLRVBRGP/a8KVhBy31ym0ZvpoG9dexpbAedP8zEmZpp9aFY7wFz
 a46+lI55mQpCjN9kcBzKt0/a323Z/2nq9Od5Jv1+XTDwhxXFPHTqFzx6m+lPgthl
 PQ2Kc7ZOMu0/RBLaB16Rdkbm9DjUx72uxoRWZ8/E34aBYl4tUds9QIzmgRTpCPcP
 IbbI82ZAp+PzScN24cc5OAjr5eOA4ogE5OHT6mNjksz9LwNM43WqbHmOjzdE6+Sv
 jALBIxP6KaLcvCDr7K9pMDV287mKdfMJoZQSFhEYIbCRhszxwomG7kMBDOFDTwA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id WAYKn2e-2Fpc for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:53:08 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8Q921R3z1VSkW;
 Fri,  7 Jan 2022 21:53:04 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 28/37] target/riscv: support for 128-bit shift instructions
Date: Sat,  8 Jan 2022 15:50:39 +1000
Message-Id: <20220108055048.3512645-29-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
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

From: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-grenoble-alpes=
.fr>

Handling shifts for 32, 64 and 128 operation length for RV128, following =
the
general framework for handling various olens proposed by Richard.

Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220106210108.138226-13-frederic.petrot@univ-grenoble-alpes.=
fr
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  10 ++
 target/riscv/translate.c                |  58 ++++--
 target/riscv/insn_trans/trans_rvb.c.inc |  22 +--
 target/riscv/insn_trans/trans_rvi.c.inc | 224 ++++++++++++++++++++++--
 4 files changed, 270 insertions(+), 44 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index ddbf0da03c..a992c6d369 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -22,6 +22,7 @@
 %rs1       15:5
 %rd        7:5
 %sh5       20:5
+%sh6       20:6
=20
 %sh7    20:7
 %csr    20:12
@@ -91,6 +92,9 @@
 # Formats 64:
 @sh5     .......  ..... .....  ... ..... ....... &shift  shamt=3D%sh5   =
   %rs1 %rd
=20
+# Formats 128:
+@sh6       ...... ...... ..... ... ..... ....... &shift shamt=3D%sh6 %rs=
1 %rd
+
 # *** Privileged Instructions ***
 ecall       000000000000     00000 000 00000 1110011
 ebreak      000000000001     00000 000 00000 1110011
@@ -166,6 +170,12 @@ sraw     0100000 .....  ..... 101 ..... 0111011 @r
 ldu      ............   ..... 111 ..... 0000011 @i
 lq       ............   ..... 010 ..... 0001111 @i
 sq       ............   ..... 100 ..... 0100011 @s
+sllid    000000 ......  ..... 001 ..... 1011011 @sh6
+srlid    000000 ......  ..... 101 ..... 1011011 @sh6
+sraid    010000 ......  ..... 101 ..... 1011011 @sh6
+slld     0000000 ..... .....  001 ..... 1111011 @r
+srld     0000000 ..... .....  101 ..... 1111011 @r
+srad     0100000 ..... .....  101 ..... 1111011 @r
=20
 # *** RV32M Standard Extension ***
 mul      0000001 .....  ..... 000 ..... 0110011 @r
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index ba1ad1be5f..89220a5fae 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -635,7 +635,8 @@ static bool gen_arith_per_ol(DisasContext *ctx, arg_r=
 *a, DisasExtend ext,
 }
=20
 static bool gen_shift_imm_fn(DisasContext *ctx, arg_shift *a, DisasExten=
d ext,
-                             void (*func)(TCGv, TCGv, target_long))
+                             void (*func)(TCGv, TCGv, target_long),
+                             void (*f128)(TCGv, TCGv, TCGv, TCGv, target=
_long))
 {
     TCGv dest, src1;
     int max_len =3D get_olen(ctx);
@@ -647,26 +648,38 @@ static bool gen_shift_imm_fn(DisasContext *ctx, arg=
_shift *a, DisasExtend ext,
     dest =3D dest_gpr(ctx, a->rd);
     src1 =3D get_gpr(ctx, a->rs1, ext);
=20
-    func(dest, src1, a->shamt);
+    if (max_len < 128) {
+        func(dest, src1, a->shamt);
+        gen_set_gpr(ctx, a->rd, dest);
+    } else {
+        TCGv src1h =3D get_gprh(ctx, a->rs1);
+        TCGv desth =3D dest_gprh(ctx, a->rd);
=20
-    gen_set_gpr(ctx, a->rd, dest);
+        if (f128 =3D=3D NULL) {
+            return false;
+        }
+        f128(dest, desth, src1, src1h, a->shamt);
+        gen_set_gpr128(ctx, a->rd, dest, desth);
+    }
     return true;
 }
=20
 static bool gen_shift_imm_fn_per_ol(DisasContext *ctx, arg_shift *a,
                                     DisasExtend ext,
                                     void (*f_tl)(TCGv, TCGv, target_long=
),
-                                    void (*f_32)(TCGv, TCGv, target_long=
))
+                                    void (*f_32)(TCGv, TCGv, target_long=
),
+                                    void (*f_128)(TCGv, TCGv, TCGv, TCGv=
,
+                                                  target_long))
 {
     int olen =3D get_olen(ctx);
     if (olen !=3D TARGET_LONG_BITS) {
         if (olen =3D=3D 32) {
             f_tl =3D f_32;
-        } else {
+        } else if (olen !=3D 128) {
             g_assert_not_reached();
         }
     }
-    return gen_shift_imm_fn(ctx, a, ext, f_tl);
+    return gen_shift_imm_fn(ctx, a, ext, f_tl, f_128);
 }
=20
 static bool gen_shift_imm_tl(DisasContext *ctx, arg_shift *a, DisasExten=
d ext,
@@ -690,34 +703,49 @@ static bool gen_shift_imm_tl(DisasContext *ctx, arg=
_shift *a, DisasExtend ext,
 }
=20
 static bool gen_shift(DisasContext *ctx, arg_r *a, DisasExtend ext,
-                      void (*func)(TCGv, TCGv, TCGv))
+                      void (*func)(TCGv, TCGv, TCGv),
+                      void (*f128)(TCGv, TCGv, TCGv, TCGv, TCGv))
 {
-    TCGv dest =3D dest_gpr(ctx, a->rd);
-    TCGv src1 =3D get_gpr(ctx, a->rs1, ext);
     TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
     TCGv ext2 =3D tcg_temp_new();
+    int max_len =3D get_olen(ctx);
=20
-    tcg_gen_andi_tl(ext2, src2, get_olen(ctx) - 1);
-    func(dest, src1, ext2);
+    tcg_gen_andi_tl(ext2, src2, max_len - 1);
=20
-    gen_set_gpr(ctx, a->rd, dest);
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv src1 =3D get_gpr(ctx, a->rs1, ext);
+
+    if (max_len < 128) {
+        func(dest, src1, ext2);
+        gen_set_gpr(ctx, a->rd, dest);
+    } else {
+        TCGv src1h =3D get_gprh(ctx, a->rs1);
+        TCGv desth =3D dest_gprh(ctx, a->rd);
+
+        if (f128 =3D=3D NULL) {
+            return false;
+        }
+        f128(dest, desth, src1, src1h, ext2);
+        gen_set_gpr128(ctx, a->rd, dest, desth);
+    }
     tcg_temp_free(ext2);
     return true;
 }
=20
 static bool gen_shift_per_ol(DisasContext *ctx, arg_r *a, DisasExtend ex=
t,
                              void (*f_tl)(TCGv, TCGv, TCGv),
-                             void (*f_32)(TCGv, TCGv, TCGv))
+                             void (*f_32)(TCGv, TCGv, TCGv),
+                             void (*f_128)(TCGv, TCGv, TCGv, TCGv, TCGv)=
)
 {
     int olen =3D get_olen(ctx);
     if (olen !=3D TARGET_LONG_BITS) {
         if (olen =3D=3D 32) {
             f_tl =3D f_32;
-        } else {
+        } else if (olen !=3D 128) {
             g_assert_not_reached();
         }
     }
-    return gen_shift(ctx, a, ext, f_tl);
+    return gen_shift(ctx, a, ext, f_tl, f_128);
 }
=20
 static bool gen_unary(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index de2cd613b1..ad6548320f 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -156,7 +156,7 @@ static void gen_bset(TCGv ret, TCGv arg1, TCGv shamt)
 static bool trans_bset(DisasContext *ctx, arg_bset *a)
 {
     REQUIRE_ZBS(ctx);
-    return gen_shift(ctx, a, EXT_NONE, gen_bset);
+    return gen_shift(ctx, a, EXT_NONE, gen_bset, NULL);
 }
=20
 static bool trans_bseti(DisasContext *ctx, arg_bseti *a)
@@ -178,7 +178,7 @@ static void gen_bclr(TCGv ret, TCGv arg1, TCGv shamt)
 static bool trans_bclr(DisasContext *ctx, arg_bclr *a)
 {
     REQUIRE_ZBS(ctx);
-    return gen_shift(ctx, a, EXT_NONE, gen_bclr);
+    return gen_shift(ctx, a, EXT_NONE, gen_bclr, NULL);
 }
=20
 static bool trans_bclri(DisasContext *ctx, arg_bclri *a)
@@ -200,7 +200,7 @@ static void gen_binv(TCGv ret, TCGv arg1, TCGv shamt)
 static bool trans_binv(DisasContext *ctx, arg_binv *a)
 {
     REQUIRE_ZBS(ctx);
-    return gen_shift(ctx, a, EXT_NONE, gen_binv);
+    return gen_shift(ctx, a, EXT_NONE, gen_binv, NULL);
 }
=20
 static bool trans_binvi(DisasContext *ctx, arg_binvi *a)
@@ -218,7 +218,7 @@ static void gen_bext(TCGv ret, TCGv arg1, TCGv shamt)
 static bool trans_bext(DisasContext *ctx, arg_bext *a)
 {
     REQUIRE_ZBS(ctx);
-    return gen_shift(ctx, a, EXT_NONE, gen_bext);
+    return gen_shift(ctx, a, EXT_NONE, gen_bext, NULL);
 }
=20
 static bool trans_bexti(DisasContext *ctx, arg_bexti *a)
@@ -248,7 +248,7 @@ static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
 static bool trans_ror(DisasContext *ctx, arg_ror *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_shift_per_ol(ctx, a, EXT_NONE, tcg_gen_rotr_tl, gen_rorw)=
;
+    return gen_shift_per_ol(ctx, a, EXT_NONE, tcg_gen_rotr_tl, gen_rorw,=
 NULL);
 }
=20
 static void gen_roriw(TCGv ret, TCGv arg1, target_long shamt)
@@ -266,7 +266,7 @@ static bool trans_rori(DisasContext *ctx, arg_rori *a=
)
 {
     REQUIRE_ZBB(ctx);
     return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
-                                   tcg_gen_rotri_tl, gen_roriw);
+                                   tcg_gen_rotri_tl, gen_roriw, NULL);
 }
=20
 static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
@@ -290,7 +290,7 @@ static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
 static bool trans_rol(DisasContext *ctx, arg_rol *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_shift_per_ol(ctx, a, EXT_NONE, tcg_gen_rotl_tl, gen_rolw)=
;
+    return gen_shift_per_ol(ctx, a, EXT_NONE, tcg_gen_rotl_tl, gen_rolw,=
 NULL);
 }
=20
 static void gen_rev8_32(TCGv ret, TCGv src1)
@@ -405,7 +405,7 @@ static bool trans_rorw(DisasContext *ctx, arg_rorw *a=
)
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBB(ctx);
     ctx->ol =3D MXL_RV32;
-    return gen_shift(ctx, a, EXT_NONE, gen_rorw);
+    return gen_shift(ctx, a, EXT_NONE, gen_rorw, NULL);
 }
=20
 static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
@@ -413,7 +413,7 @@ static bool trans_roriw(DisasContext *ctx, arg_roriw =
*a)
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBB(ctx);
     ctx->ol =3D MXL_RV32;
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_roriw);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_roriw, NULL);
 }
=20
 static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
@@ -421,7 +421,7 @@ static bool trans_rolw(DisasContext *ctx, arg_rolw *a=
)
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBB(ctx);
     ctx->ol =3D MXL_RV32;
-    return gen_shift(ctx, a, EXT_NONE, gen_rolw);
+    return gen_shift(ctx, a, EXT_NONE, gen_rolw, NULL);
 }
=20
 #define GEN_SHADD_UW(SHAMT)                                       \
@@ -478,7 +478,7 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli=
_uw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBA(ctx);
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_slli_uw);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_slli_uw, NULL);
 }
=20
 static bool trans_clmul(DisasContext *ctx, arg_clmul *a)
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
index 6113acc669..2e3a6c6041 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -353,9 +353,22 @@ static bool trans_andi(DisasContext *ctx, arg_andi *=
a)
     return gen_logic_imm_fn(ctx, a, tcg_gen_andi_tl);
 }
=20
+static void gen_slli_i128(TCGv retl, TCGv reth,
+                          TCGv src1l, TCGv src1h,
+                          target_long shamt)
+{
+    if (shamt >=3D 64) {
+        tcg_gen_shli_tl(reth, src1l, shamt - 64);
+        tcg_gen_movi_tl(retl, 0);
+    } else {
+        tcg_gen_extract2_tl(reth, src1l, src1h, 64 - shamt);
+        tcg_gen_shli_tl(retl, src1l, shamt);
+    }
+}
+
 static bool trans_slli(DisasContext *ctx, arg_slli *a)
 {
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl, gen_slli_=
i128);
 }
=20
 static void gen_srliw(TCGv dst, TCGv src, target_long shamt)
@@ -363,10 +376,23 @@ static void gen_srliw(TCGv dst, TCGv src, target_lo=
ng shamt)
     tcg_gen_extract_tl(dst, src, shamt, 32 - shamt);
 }
=20
+static void gen_srli_i128(TCGv retl, TCGv reth,
+                          TCGv src1l, TCGv src1h,
+                          target_long shamt)
+{
+    if (shamt >=3D 64) {
+        tcg_gen_shri_tl(retl, src1h, shamt - 64);
+        tcg_gen_movi_tl(reth, 0);
+    } else {
+        tcg_gen_extract2_tl(retl, src1l, src1h, shamt);
+        tcg_gen_shri_tl(reth, src1h, shamt);
+    }
+}
+
 static bool trans_srli(DisasContext *ctx, arg_srli *a)
 {
     return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
-                                   tcg_gen_shri_tl, gen_srliw);
+                                   tcg_gen_shri_tl, gen_srliw, gen_srli_=
i128);
 }
=20
 static void gen_sraiw(TCGv dst, TCGv src, target_long shamt)
@@ -374,10 +400,23 @@ static void gen_sraiw(TCGv dst, TCGv src, target_lo=
ng shamt)
     tcg_gen_sextract_tl(dst, src, shamt, 32 - shamt);
 }
=20
+static void gen_srai_i128(TCGv retl, TCGv reth,
+                          TCGv src1l, TCGv src1h,
+                          target_long shamt)
+{
+    if (shamt >=3D 64) {
+        tcg_gen_sari_tl(retl, src1h, shamt - 64);
+        tcg_gen_sari_tl(reth, src1h, 63);
+    } else {
+        tcg_gen_extract2_tl(retl, src1l, src1h, shamt);
+        tcg_gen_sari_tl(reth, src1h, shamt);
+    }
+}
+
 static bool trans_srai(DisasContext *ctx, arg_srai *a)
 {
     return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
-                                   tcg_gen_sari_tl, gen_sraiw);
+                                   tcg_gen_sari_tl, gen_sraiw, gen_srai_=
i128);
 }
=20
 static bool trans_add(DisasContext *ctx, arg_add *a)
@@ -390,9 +429,44 @@ static bool trans_sub(DisasContext *ctx, arg_sub *a)
     return gen_arith(ctx, a, EXT_NONE, tcg_gen_sub_tl);
 }
=20
+static void gen_sll_i128(TCGv destl, TCGv desth,
+                         TCGv src1l, TCGv src1h, TCGv shamt)
+{
+    TCGv ls =3D tcg_temp_new();
+    TCGv rs =3D tcg_temp_new();
+    TCGv hs =3D tcg_temp_new();
+    TCGv ll =3D tcg_temp_new();
+    TCGv lr =3D tcg_temp_new();
+    TCGv h0 =3D tcg_temp_new();
+    TCGv h1 =3D tcg_temp_new();
+    TCGv zero =3D tcg_constant_tl(0);
+
+    tcg_gen_andi_tl(hs, shamt, 64);
+    tcg_gen_andi_tl(ls, shamt, 63);
+    tcg_gen_neg_tl(shamt, shamt);
+    tcg_gen_andi_tl(rs, shamt, 63);
+
+    tcg_gen_shl_tl(ll, src1l, ls);
+    tcg_gen_shl_tl(h0, src1h, ls);
+    tcg_gen_shr_tl(lr, src1l, rs);
+    tcg_gen_movcond_tl(TCG_COND_NE, lr, shamt, zero, lr, zero);
+    tcg_gen_or_tl(h1, h0, lr);
+
+    tcg_gen_movcond_tl(TCG_COND_NE, destl, hs, zero, zero, ll);
+    tcg_gen_movcond_tl(TCG_COND_NE, desth, hs, zero, ll, h1);
+
+    tcg_temp_free(ls);
+    tcg_temp_free(rs);
+    tcg_temp_free(hs);
+    tcg_temp_free(ll);
+    tcg_temp_free(lr);
+    tcg_temp_free(h0);
+    tcg_temp_free(h1);
+}
+
 static bool trans_sll(DisasContext *ctx, arg_sll *a)
 {
-    return gen_shift(ctx, a, EXT_NONE, tcg_gen_shl_tl);
+    return gen_shift(ctx, a, EXT_NONE, tcg_gen_shl_tl, gen_sll_i128);
 }
=20
 static bool trans_slt(DisasContext *ctx, arg_slt *a)
@@ -405,14 +479,85 @@ static bool trans_sltu(DisasContext *ctx, arg_sltu =
*a)
     return gen_arith(ctx, a, EXT_SIGN, gen_sltu);
 }
=20
+static void gen_srl_i128(TCGv destl, TCGv desth,
+                         TCGv src1l, TCGv src1h, TCGv shamt)
+{
+    TCGv ls =3D tcg_temp_new();
+    TCGv rs =3D tcg_temp_new();
+    TCGv hs =3D tcg_temp_new();
+    TCGv ll =3D tcg_temp_new();
+    TCGv lr =3D tcg_temp_new();
+    TCGv h0 =3D tcg_temp_new();
+    TCGv h1 =3D tcg_temp_new();
+    TCGv zero =3D tcg_constant_tl(0);
+
+    tcg_gen_andi_tl(hs, shamt, 64);
+    tcg_gen_andi_tl(rs, shamt, 63);
+    tcg_gen_neg_tl(shamt, shamt);
+    tcg_gen_andi_tl(ls, shamt, 63);
+
+    tcg_gen_shr_tl(lr, src1l, rs);
+    tcg_gen_shr_tl(h1, src1h, rs);
+    tcg_gen_shl_tl(ll, src1h, ls);
+    tcg_gen_movcond_tl(TCG_COND_NE, ll, shamt, zero, ll, zero);
+    tcg_gen_or_tl(h0, ll, lr);
+
+    tcg_gen_movcond_tl(TCG_COND_NE, destl, hs, zero, h1, h0);
+    tcg_gen_movcond_tl(TCG_COND_NE, desth, hs, zero, zero, h1);
+
+    tcg_temp_free(ls);
+    tcg_temp_free(rs);
+    tcg_temp_free(hs);
+    tcg_temp_free(ll);
+    tcg_temp_free(lr);
+    tcg_temp_free(h0);
+    tcg_temp_free(h1);
+}
+
 static bool trans_srl(DisasContext *ctx, arg_srl *a)
 {
-    return gen_shift(ctx, a, EXT_ZERO, tcg_gen_shr_tl);
+    return gen_shift(ctx, a, EXT_ZERO, tcg_gen_shr_tl, gen_srl_i128);
+}
+
+static void gen_sra_i128(TCGv destl, TCGv desth,
+                         TCGv src1l, TCGv src1h, TCGv shamt)
+{
+    TCGv ls =3D tcg_temp_new();
+    TCGv rs =3D tcg_temp_new();
+    TCGv hs =3D tcg_temp_new();
+    TCGv ll =3D tcg_temp_new();
+    TCGv lr =3D tcg_temp_new();
+    TCGv h0 =3D tcg_temp_new();
+    TCGv h1 =3D tcg_temp_new();
+    TCGv zero =3D tcg_constant_tl(0);
+
+    tcg_gen_andi_tl(hs, shamt, 64);
+    tcg_gen_andi_tl(rs, shamt, 63);
+    tcg_gen_neg_tl(shamt, shamt);
+    tcg_gen_andi_tl(ls, shamt, 63);
+
+    tcg_gen_shr_tl(lr, src1l, rs);
+    tcg_gen_sar_tl(h1, src1h, rs);
+    tcg_gen_shl_tl(ll, src1h, ls);
+    tcg_gen_movcond_tl(TCG_COND_NE, ll, shamt, zero, ll, zero);
+    tcg_gen_or_tl(h0, ll, lr);
+    tcg_gen_sari_tl(lr, src1h, 63);
+
+    tcg_gen_movcond_tl(TCG_COND_NE, destl, hs, zero, h1, h0);
+    tcg_gen_movcond_tl(TCG_COND_NE, desth, hs, zero, lr, h1);
+
+    tcg_temp_free(ls);
+    tcg_temp_free(rs);
+    tcg_temp_free(hs);
+    tcg_temp_free(ll);
+    tcg_temp_free(lr);
+    tcg_temp_free(h0);
+    tcg_temp_free(h1);
 }
=20
 static bool trans_sra(DisasContext *ctx, arg_sra *a)
 {
-    return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl);
+    return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl, gen_sra_i128);
 }
=20
 static bool trans_xor(DisasContext *ctx, arg_xor *a)
@@ -439,23 +584,44 @@ static bool trans_addiw(DisasContext *ctx, arg_addi=
w *a)
=20
 static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     ctx->ol =3D MXL_RV32;
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl, NULL);
 }
=20
 static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     ctx->ol =3D MXL_RV32;
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_srliw);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_srliw, NULL);
 }
=20
 static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     ctx->ol =3D MXL_RV32;
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_sraiw);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_sraiw, NULL);
+}
+
+static bool trans_sllid(DisasContext *ctx, arg_sllid *a)
+{
+    REQUIRE_128BIT(ctx);
+    ctx->ol =3D MXL_RV64;
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl, NULL);
+}
+
+static bool trans_srlid(DisasContext *ctx, arg_srlid *a)
+{
+    REQUIRE_128BIT(ctx);
+    ctx->ol =3D MXL_RV64;
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shri_tl, NULL);
+}
+
+static bool trans_sraid(DisasContext *ctx, arg_sraid *a)
+{
+    REQUIRE_128BIT(ctx);
+    ctx->ol =3D MXL_RV64;
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_sari_tl,  NULL);
 }
=20
 static bool trans_addw(DisasContext *ctx, arg_addw *a)
@@ -474,25 +640,47 @@ static bool trans_subw(DisasContext *ctx, arg_subw =
*a)
=20
 static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     ctx->ol =3D MXL_RV32;
-    return gen_shift(ctx, a, EXT_NONE, tcg_gen_shl_tl);
+    return gen_shift(ctx, a, EXT_NONE, tcg_gen_shl_tl, NULL);
 }
=20
 static bool trans_srlw(DisasContext *ctx, arg_srlw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     ctx->ol =3D MXL_RV32;
-    return gen_shift(ctx, a, EXT_ZERO, tcg_gen_shr_tl);
+    return gen_shift(ctx, a, EXT_ZERO, tcg_gen_shr_tl, NULL);
 }
=20
 static bool trans_sraw(DisasContext *ctx, arg_sraw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     ctx->ol =3D MXL_RV32;
-    return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl);
+    return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl, NULL);
+}
+
+static bool trans_slld(DisasContext *ctx, arg_slld *a)
+{
+    REQUIRE_128BIT(ctx);
+    ctx->ol =3D MXL_RV64;
+    return gen_shift(ctx, a, EXT_NONE, tcg_gen_shl_tl, NULL);
 }
=20
+static bool trans_srld(DisasContext *ctx, arg_srld *a)
+{
+    REQUIRE_128BIT(ctx);
+    ctx->ol =3D MXL_RV64;
+    return gen_shift(ctx, a, EXT_ZERO, tcg_gen_shr_tl, NULL);
+}
+
+static bool trans_srad(DisasContext *ctx, arg_srad *a)
+{
+    REQUIRE_128BIT(ctx);
+    ctx->ol =3D MXL_RV64;
+    return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl, NULL);
+}
+
+
 static bool trans_fence(DisasContext *ctx, arg_fence *a)
 {
     /* FENCE is a full memory barrier. */
--=20
2.31.1


