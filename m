Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DC24881D5
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 07:19:53 +0100 (CET)
Received: from localhost ([::1]:33906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n654x-0001Bj-JP
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 01:19:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64fF-0001Cu-UT
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:53:17 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:63935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64fD-0006wZ-31
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:53:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621193; x=1673157193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bzp7Y7CXbQHzPaXpz8bHDUZRpd9j80RiqTDtzeSxjho=;
 b=YjiHz2oy6JowM4gg2AUzbowp+PA7NRIgNpEoZgis0VYNuw4aWpdW4nwE
 dsFNzaTLfk/kUQ+yRbzrQ+SBZYOZmso5ObYQaU/mBtyxsKP2OeTKGfV39
 vJsjGylo3wDaG4GETO8CQ0RJjvFnprCDJ6wDoC69ENa4dfpA3VlnHwYHx
 4XHfo3wmzxT8RCnfYkwVjHq0f630RBdgQCO/I9O0DvQMqIgYGXXGuvGs1
 758nZMHd0mgBFuxSQK8X6WSFwUoPUmgumjZikZTpQbbSsyuBAyKpu050y
 TxtSAXQ3PNxCwEK9UzfOJ5dSyicpHFwcuICPT+reuVwsSZ9jr81Opn4f/ Q==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="189984948"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:53:13 +0800
IronPort-SDR: H5Ovo4gZvuOG2Fn+AZDpR0r7caGFK0DH49dD0rc0S5pFYv98mP4AAq8AEOhVuo/IOrONLwHRko
 Wt8schfDoevxf9o49T7x5PNJSj8iZTuq/5K55tMArH3wy19Z8uo2+noNCbtN0dFu0wFUi+Pc88
 n9Z2rsnFGeBUP13j9sWqg+Cd5X1cFePb5CGa+gYbA8vG+ST3etR75L77LD9jeWoqGKKZ8fc7ly
 qBc5VncV1qkDValddM6PZ5AiysTuZhPOAwFHFXqWYY2clmPs29MU5PzQ18GtaLqf97HoMRhIX+
 JHSFrXM1UVQolpMJe/Er6DH9
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:25:40 -0800
IronPort-SDR: GOZX6J2Gk2CjAk5lN/4bPgB2doggccoYUOvlzi1Bj0fRtJrrLvCbG287T2lsPUkWxAh8hM5MK2
 H122JNZCVd3DHOW/Crutipq23P/bJDb4WX24QNt9srv2CXXRH4j3NuZ6eAx15TSfYbS1y4bxO1
 UdSoIKezhqiFZNrOlfo0bq+mOBvWyd+hJHKn4nMkVrGOf6BRQuQ7Wa12k5w2H1RSgVkVdLGTyw
 B0iF9cA3VOgXYBNPUotA2D21TVinwPnTZHL+QL629gKZuczw5BCJ8mvdhnVbT7UnD6opGBy+hr
 VFI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:53:15 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8QL0Bkmz1VSkd
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:53:14 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1641621192; x=1644213193; bh=bzp7Y7C
 XbQHzPaXpz8bHDUZRpd9j80RiqTDtzeSxjho=; b=jMFEH0QVDHvlpvTG50C8jwa
 d/D1f0p4TlM/eFcY8a3MNFlfUmtHIlru1w01bYVoPm+JXRfApo8+sDGt6M62Eetx
 q3Gub0FVxnu+ir29G/Q5mxgwdhFpI+kGnwSGmwZNqi6gvQFt+TL+2HK97eMzHezl
 54y7OuK1znHxx0TO78j734uM/8y8uZ1fk1MA9xtcV8azJERTWMNwCxcwjqc+sig3
 H47JlCLahehx54iGDVzkyqPOUw1IW9zT7j1HJ6aB3e+FCF2MbcDp35VU5ox7ZzbR
 zkNl6i4i50FA7PCsRBa/Bz9LXrNOcfD4d9wsK3al0GQw8YOGmqoy6A8gTn0enMw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id k2M1l6nsuQwo for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:53:12 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8QF3s8Dz1VSkc;
 Fri,  7 Jan 2022 21:53:09 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 29/37] target/riscv: support for 128-bit arithmetic instructions
Date: Sat,  8 Jan 2022 15:50:40 +1000
Message-Id: <20220108055048.3512645-30-alistair.francis@opensource.wdc.com>
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

Addition of 128-bit adds and subs in their various sizes,
"set if less than"s and branches.
Refactored the code to have a comparison function used for both stls and
branches.

Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220106210108.138226-14-frederic.petrot@univ-grenoble-alpes.=
fr
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |   3 +
 target/riscv/translate.c                |  63 ++++++++--
 target/riscv/insn_trans/trans_rvb.c.inc |  20 +--
 target/riscv/insn_trans/trans_rvi.c.inc | 159 +++++++++++++++++++++---
 target/riscv/insn_trans/trans_rvm.c.inc |  26 ++--
 5 files changed, 222 insertions(+), 49 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index a992c6d369..42366d20fb 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -170,9 +170,12 @@ sraw     0100000 .....  ..... 101 ..... 0111011 @r
 ldu      ............   ..... 111 ..... 0000011 @i
 lq       ............   ..... 010 ..... 0001111 @i
 sq       ............   ..... 100 ..... 0100011 @s
+addid    ............  .....  000 ..... 1011011 @i
 sllid    000000 ......  ..... 001 ..... 1011011 @sh6
 srlid    000000 ......  ..... 101 ..... 1011011 @sh6
 sraid    010000 ......  ..... 101 ..... 1011011 @sh6
+addd     0000000 ..... .....  000 ..... 1111011 @r
+subd     0100000 ..... .....  000 ..... 1111011 @r
 slld     0000000 ..... .....  001 ..... 1111011 @r
 srld     0000000 ..... .....  101 ..... 1111011 @r
 srad     0100000 ..... .....  101 ..... 1111011 @r
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 89220a5fae..4ae4345691 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -581,57 +581,96 @@ static bool gen_logic(DisasContext *ctx, arg_r *a,
 }
=20
 static bool gen_arith_imm_fn(DisasContext *ctx, arg_i *a, DisasExtend ex=
t,
-                             void (*func)(TCGv, TCGv, target_long))
+                             void (*func)(TCGv, TCGv, target_long),
+                             void (*f128)(TCGv, TCGv, TCGv, TCGv, target=
_long))
 {
     TCGv dest =3D dest_gpr(ctx, a->rd);
     TCGv src1 =3D get_gpr(ctx, a->rs1, ext);
=20
-    func(dest, src1, a->imm);
+    if (get_ol(ctx) < MXL_RV128) {
+        func(dest, src1, a->imm);
+        gen_set_gpr(ctx, a->rd, dest);
+    } else {
+        if (f128 =3D=3D NULL) {
+            return false;
+        }
=20
-    gen_set_gpr(ctx, a->rd, dest);
+        TCGv src1h =3D get_gprh(ctx, a->rs1);
+        TCGv desth =3D dest_gprh(ctx, a->rd);
+
+        f128(dest, desth, src1, src1h, a->imm);
+        gen_set_gpr128(ctx, a->rd, dest, desth);
+    }
     return true;
 }
=20
 static bool gen_arith_imm_tl(DisasContext *ctx, arg_i *a, DisasExtend ex=
t,
-                             void (*func)(TCGv, TCGv, TCGv))
+                             void (*func)(TCGv, TCGv, TCGv),
+                             void (*f128)(TCGv, TCGv, TCGv, TCGv, TCGv, =
TCGv))
 {
     TCGv dest =3D dest_gpr(ctx, a->rd);
     TCGv src1 =3D get_gpr(ctx, a->rs1, ext);
     TCGv src2 =3D tcg_constant_tl(a->imm);
=20
-    func(dest, src1, src2);
+    if (get_ol(ctx) < MXL_RV128) {
+        func(dest, src1, src2);
+        gen_set_gpr(ctx, a->rd, dest);
+    } else {
+        if (f128 =3D=3D NULL) {
+            return false;
+        }
=20
-    gen_set_gpr(ctx, a->rd, dest);
+        TCGv src1h =3D get_gprh(ctx, a->rs1);
+        TCGv src2h =3D tcg_constant_tl(-(a->imm < 0));
+        TCGv desth =3D dest_gprh(ctx, a->rd);
+
+        f128(dest, desth, src1, src1h, src2, src2h);
+        gen_set_gpr128(ctx, a->rd, dest, desth);
+    }
     return true;
 }
=20
 static bool gen_arith(DisasContext *ctx, arg_r *a, DisasExtend ext,
-                      void (*func)(TCGv, TCGv, TCGv))
+                      void (*func)(TCGv, TCGv, TCGv),
+                      void (*f128)(TCGv, TCGv, TCGv, TCGv, TCGv, TCGv))
 {
     TCGv dest =3D dest_gpr(ctx, a->rd);
     TCGv src1 =3D get_gpr(ctx, a->rs1, ext);
     TCGv src2 =3D get_gpr(ctx, a->rs2, ext);
=20
-    func(dest, src1, src2);
+    if (get_ol(ctx) < MXL_RV128) {
+        func(dest, src1, src2);
+        gen_set_gpr(ctx, a->rd, dest);
+    } else {
+        if (f128 =3D=3D NULL) {
+            return false;
+        }
=20
-    gen_set_gpr(ctx, a->rd, dest);
+        TCGv src1h =3D get_gprh(ctx, a->rs1);
+        TCGv src2h =3D get_gprh(ctx, a->rs2);
+        TCGv desth =3D dest_gprh(ctx, a->rd);
+
+        f128(dest, desth, src1, src1h, src2, src2h);
+        gen_set_gpr128(ctx, a->rd, dest, desth);
+    }
     return true;
 }
=20
 static bool gen_arith_per_ol(DisasContext *ctx, arg_r *a, DisasExtend ex=
t,
                              void (*f_tl)(TCGv, TCGv, TCGv),
-                             void (*f_32)(TCGv, TCGv, TCGv))
+                             void (*f_32)(TCGv, TCGv, TCGv),
+                             void (*f_128)(TCGv, TCGv, TCGv, TCGv, TCGv,=
 TCGv))
 {
     int olen =3D get_olen(ctx);
=20
     if (olen !=3D TARGET_LONG_BITS) {
         if (olen =3D=3D 32) {
             f_tl =3D f_32;
-        } else {
+        } else if (olen !=3D 128) {
             g_assert_not_reached();
         }
     }
-    return gen_arith(ctx, a, ext, f_tl);
+    return gen_arith(ctx, a, ext, f_tl, f_128);
 }
=20
 static bool gen_shift_imm_fn(DisasContext *ctx, arg_shift *a, DisasExten=
d ext,
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index ad6548320f..810431a1d6 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -104,25 +104,25 @@ static bool trans_xnor(DisasContext *ctx, arg_xnor =
*a)
 static bool trans_min(DisasContext *ctx, arg_min *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_smin_tl);
+    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_smin_tl, NULL);
 }
=20
 static bool trans_max(DisasContext *ctx, arg_max *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_smax_tl);
+    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_smax_tl, NULL);
 }
=20
 static bool trans_minu(DisasContext *ctx, arg_minu *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_umin_tl);
+    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_umin_tl, NULL);
 }
=20
 static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_umax_tl);
+    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_umax_tl, NULL);
 }
=20
 static bool trans_sext_b(DisasContext *ctx, arg_sext_b *a)
@@ -357,7 +357,7 @@ GEN_SHADD(3)
 static bool trans_sh##SHAMT##add(DisasContext *ctx, arg_sh##SHAMT##add *=
a) \
 {                                                                       =
   \
     REQUIRE_ZBA(ctx);                                                   =
   \
-    return gen_arith(ctx, a, EXT_NONE, gen_sh##SHAMT##add);             =
   \
+    return gen_arith(ctx, a, EXT_NONE, gen_sh##SHAMT##add, NULL);       =
   \
 }
=20
 GEN_TRANS_SHADD(1)
@@ -447,7 +447,7 @@ static bool trans_sh##SHAMT##add_uw(DisasContext *ctx=
,        \
 {                                                             \
     REQUIRE_64BIT(ctx);                                       \
     REQUIRE_ZBA(ctx);                                         \
-    return gen_arith(ctx, a, EXT_NONE, gen_sh##SHAMT##add_uw);  \
+    return gen_arith(ctx, a, EXT_NONE, gen_sh##SHAMT##add_uw, NULL); \
 }
=20
 GEN_TRANS_SHADD_UW(1)
@@ -466,7 +466,7 @@ static bool trans_add_uw(DisasContext *ctx, arg_add_u=
w *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBA(ctx);
-    return gen_arith(ctx, a, EXT_NONE, gen_add_uw);
+    return gen_arith(ctx, a, EXT_NONE, gen_add_uw, NULL);
 }
=20
 static void gen_slli_uw(TCGv dest, TCGv src, target_long shamt)
@@ -484,7 +484,7 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli=
_uw *a)
 static bool trans_clmul(DisasContext *ctx, arg_clmul *a)
 {
     REQUIRE_ZBC(ctx);
-    return gen_arith(ctx, a, EXT_NONE, gen_helper_clmul);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_clmul, NULL);
 }
=20
 static void gen_clmulh(TCGv dst, TCGv src1, TCGv src2)
@@ -496,11 +496,11 @@ static void gen_clmulh(TCGv dst, TCGv src1, TCGv sr=
c2)
 static bool trans_clmulh(DisasContext *ctx, arg_clmulr *a)
 {
     REQUIRE_ZBC(ctx);
-    return gen_arith(ctx, a, EXT_NONE, gen_clmulh);
+    return gen_arith(ctx, a, EXT_NONE, gen_clmulh, NULL);
 }
=20
 static bool trans_clmulr(DisasContext *ctx, arg_clmulh *a)
 {
     REQUIRE_ZBC(ctx);
-    return gen_arith(ctx, a, EXT_NONE, gen_helper_clmulr);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_clmulr, NULL);
 }
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
index 2e3a6c6041..ca354130ec 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -82,13 +82,103 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *=
a)
     return true;
 }
=20
+static TCGCond gen_compare_i128(bool bz, TCGv rl,
+                                TCGv al, TCGv ah, TCGv bl, TCGv bh,
+                                TCGCond cond)
+{
+    TCGv rh =3D tcg_temp_new();
+    bool invert =3D false;
+
+    switch (cond) {
+    case TCG_COND_EQ:
+    case TCG_COND_NE:
+        if (bz) {
+            tcg_gen_or_tl(rl, al, ah);
+        } else {
+            tcg_gen_xor_tl(rl, al, bl);
+            tcg_gen_xor_tl(rh, ah, bh);
+            tcg_gen_or_tl(rl, rl, rh);
+        }
+        break;
+
+    case TCG_COND_GE:
+    case TCG_COND_LT:
+        if (bz) {
+            tcg_gen_mov_tl(rl, ah);
+        } else {
+            TCGv tmp =3D tcg_temp_new();
+
+            tcg_gen_sub2_tl(rl, rh, al, ah, bl, bh);
+            tcg_gen_xor_tl(rl, rh, ah);
+            tcg_gen_xor_tl(tmp, ah, bh);
+            tcg_gen_and_tl(rl, rl, tmp);
+            tcg_gen_xor_tl(rl, rh, rl);
+
+            tcg_temp_free(tmp);
+        }
+        break;
+
+    case TCG_COND_LTU:
+        invert =3D true;
+        /* fallthrough */
+    case TCG_COND_GEU:
+        {
+            TCGv tmp =3D tcg_temp_new();
+            TCGv zero =3D tcg_constant_tl(0);
+            TCGv one =3D tcg_constant_tl(1);
+
+            cond =3D TCG_COND_NE;
+            /* borrow in to second word */
+            tcg_gen_setcond_tl(TCG_COND_LTU, tmp, al, bl);
+            /* seed third word with 1, which will be result */
+            tcg_gen_sub2_tl(tmp, rh, ah, one, tmp, zero);
+            tcg_gen_sub2_tl(tmp, rl, tmp, rh, bh, zero);
+
+            tcg_temp_free(tmp);
+        }
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
+
+    if (invert) {
+        cond =3D tcg_invert_cond(cond);
+    }
+
+    tcg_temp_free(rh);
+    return cond;
+}
+
+static void gen_setcond_i128(TCGv rl, TCGv rh,
+                             TCGv src1l, TCGv src1h,
+                             TCGv src2l, TCGv src2h,
+                             TCGCond cond)
+{
+    cond =3D gen_compare_i128(false, rl, src1l, src1h, src2l, src2h, con=
d);
+    tcg_gen_setcondi_tl(cond, rl, rl, 0);
+    tcg_gen_movi_tl(rh, 0);
+}
+
 static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
 {
     TCGLabel *l =3D gen_new_label();
     TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_SIGN);
     TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_SIGN);
=20
-    tcg_gen_brcond_tl(cond, src1, src2, l);
+    if (get_xl(ctx) =3D=3D MXL_RV128) {
+        TCGv src1h =3D get_gprh(ctx, a->rs1);
+        TCGv src2h =3D get_gprh(ctx, a->rs2);
+        TCGv tmp =3D tcg_temp_new();
+
+        cond =3D gen_compare_i128(a->rs2 =3D=3D 0,
+                                tmp, src1, src1h, src2, src2h, cond);
+        tcg_gen_brcondi_tl(cond, tmp, 0, l);
+
+        tcg_temp_free(tmp);
+    } else {
+        tcg_gen_brcond_tl(cond, src1, src2, l);
+    }
     gen_goto_tb(ctx, 1, ctx->pc_succ_insn);
=20
     gen_set_label(l); /* branch taken */
@@ -313,9 +403,38 @@ static bool trans_sq(DisasContext *ctx, arg_sq *a)
     return gen_store(ctx, a, MO_TEUO);
 }
=20
+static bool trans_addd(DisasContext *ctx, arg_addd *a)
+{
+    REQUIRE_128BIT(ctx);
+    ctx->ol =3D MXL_RV64;
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_add_tl, NULL);
+}
+
+static bool trans_addid(DisasContext *ctx, arg_addid *a)
+{
+    REQUIRE_128BIT(ctx);
+    ctx->ol =3D MXL_RV64;
+    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_addi_tl, NULL);
+}
+
+static bool trans_subd(DisasContext *ctx, arg_subd *a)
+{
+    REQUIRE_128BIT(ctx);
+    ctx->ol =3D MXL_RV64;
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_sub_tl, NULL);
+}
+
+static void gen_addi2_i128(TCGv retl, TCGv reth,
+                           TCGv srcl, TCGv srch, target_long imm)
+{
+    TCGv imml  =3D tcg_constant_tl(imm);
+    TCGv immh  =3D tcg_constant_tl(-(imm < 0));
+    tcg_gen_add2_tl(retl, reth, srcl, srch, imml, immh);
+}
+
 static bool trans_addi(DisasContext *ctx, arg_addi *a)
 {
-    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_addi_tl);
+    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_addi_tl, gen_addi2=
_i128);
 }
=20
 static void gen_slt(TCGv ret, TCGv s1, TCGv s2)
@@ -323,19 +442,31 @@ static void gen_slt(TCGv ret, TCGv s1, TCGv s2)
     tcg_gen_setcond_tl(TCG_COND_LT, ret, s1, s2);
 }
=20
+static void gen_slt_i128(TCGv retl, TCGv reth,
+                         TCGv s1l, TCGv s1h, TCGv s2l, TCGv s2h)
+{
+    gen_setcond_i128(retl, reth, s1l, s1h, s2l, s2h, TCG_COND_LT);
+}
+
 static void gen_sltu(TCGv ret, TCGv s1, TCGv s2)
 {
     tcg_gen_setcond_tl(TCG_COND_LTU, ret, s1, s2);
 }
=20
+static void gen_sltu_i128(TCGv retl, TCGv reth,
+                          TCGv s1l, TCGv s1h, TCGv s2l, TCGv s2h)
+{
+    gen_setcond_i128(retl, reth, s1l, s1h, s2l, s2h, TCG_COND_LTU);
+}
+
 static bool trans_slti(DisasContext *ctx, arg_slti *a)
 {
-    return gen_arith_imm_tl(ctx, a, EXT_SIGN, gen_slt);
+    return gen_arith_imm_tl(ctx, a, EXT_SIGN, gen_slt, gen_slt_i128);
 }
=20
 static bool trans_sltiu(DisasContext *ctx, arg_sltiu *a)
 {
-    return gen_arith_imm_tl(ctx, a, EXT_SIGN, gen_sltu);
+    return gen_arith_imm_tl(ctx, a, EXT_SIGN, gen_sltu, gen_sltu_i128);
 }
=20
 static bool trans_xori(DisasContext *ctx, arg_xori *a)
@@ -421,12 +552,12 @@ static bool trans_srai(DisasContext *ctx, arg_srai =
*a)
=20
 static bool trans_add(DisasContext *ctx, arg_add *a)
 {
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_add_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_add_tl, tcg_gen_add2_tl);
 }
=20
 static bool trans_sub(DisasContext *ctx, arg_sub *a)
 {
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_sub_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_sub_tl, tcg_gen_sub2_tl);
 }
=20
 static void gen_sll_i128(TCGv destl, TCGv desth,
@@ -471,12 +602,12 @@ static bool trans_sll(DisasContext *ctx, arg_sll *a=
)
=20
 static bool trans_slt(DisasContext *ctx, arg_slt *a)
 {
-    return gen_arith(ctx, a, EXT_SIGN, gen_slt);
+    return gen_arith(ctx, a, EXT_SIGN, gen_slt, gen_slt_i128);
 }
=20
 static bool trans_sltu(DisasContext *ctx, arg_sltu *a)
 {
-    return gen_arith(ctx, a, EXT_SIGN, gen_sltu);
+    return gen_arith(ctx, a, EXT_SIGN, gen_sltu, gen_sltu_i128);
 }
=20
 static void gen_srl_i128(TCGv destl, TCGv desth,
@@ -577,9 +708,9 @@ static bool trans_and(DisasContext *ctx, arg_and *a)
=20
 static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     ctx->ol =3D MXL_RV32;
-    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_addi_tl);
+    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_addi_tl, NULL);
 }
=20
 static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
@@ -626,16 +757,16 @@ static bool trans_sraid(DisasContext *ctx, arg_srai=
d *a)
=20
 static bool trans_addw(DisasContext *ctx, arg_addw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     ctx->ol =3D MXL_RV32;
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_add_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_add_tl, NULL);
 }
=20
 static bool trans_subw(DisasContext *ctx, arg_subw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     ctx->ol =3D MXL_RV32;
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_sub_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_sub_tl, NULL);
 }
=20
 static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_=
trans/trans_rvm.c.inc
index 2af0e5c139..efe25dfc11 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -22,7 +22,7 @@
 static bool trans_mul(DisasContext *ctx, arg_mul *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, NULL);
 }
=20
 static void gen_mulh(TCGv ret, TCGv s1, TCGv s2)
@@ -42,7 +42,7 @@ static void gen_mulh_w(TCGv ret, TCGv s1, TCGv s2)
 static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith_per_ol(ctx, a, EXT_SIGN, gen_mulh, gen_mulh_w);
+    return gen_arith_per_ol(ctx, a, EXT_SIGN, gen_mulh, gen_mulh_w, NULL=
);
 }
=20
 static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
@@ -76,7 +76,7 @@ static void gen_mulhsu_w(TCGv ret, TCGv arg1, TCGv arg2=
)
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith_per_ol(ctx, a, EXT_NONE, gen_mulhsu, gen_mulhsu_w);
+    return gen_arith_per_ol(ctx, a, EXT_NONE, gen_mulhsu, gen_mulhsu_w, =
NULL);
 }
=20
 static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
@@ -91,7 +91,7 @@ static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a=
)
 {
     REQUIRE_EXT(ctx, RVM);
     /* gen_mulh_w works for either sign as input. */
-    return gen_arith_per_ol(ctx, a, EXT_ZERO, gen_mulhu, gen_mulh_w);
+    return gen_arith_per_ol(ctx, a, EXT_ZERO, gen_mulhu, gen_mulh_w, NUL=
L);
 }
=20
 static void gen_div(TCGv ret, TCGv source1, TCGv source2)
@@ -130,7 +130,7 @@ static void gen_div(TCGv ret, TCGv source1, TCGv sour=
ce2)
 static bool trans_div(DisasContext *ctx, arg_div *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_SIGN, gen_div);
+    return gen_arith(ctx, a, EXT_SIGN, gen_div, NULL);
 }
=20
 static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
@@ -158,7 +158,7 @@ static void gen_divu(TCGv ret, TCGv source1, TCGv sou=
rce2)
 static bool trans_divu(DisasContext *ctx, arg_divu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_ZERO, gen_divu);
+    return gen_arith(ctx, a, EXT_ZERO, gen_divu, NULL);
 }
=20
 static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
@@ -199,7 +199,7 @@ static void gen_rem(TCGv ret, TCGv source1, TCGv sour=
ce2)
 static bool trans_rem(DisasContext *ctx, arg_rem *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_SIGN, gen_rem);
+    return gen_arith(ctx, a, EXT_SIGN, gen_rem, NULL);
 }
=20
 static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
@@ -227,7 +227,7 @@ static void gen_remu(TCGv ret, TCGv source1, TCGv sou=
rce2)
 static bool trans_remu(DisasContext *ctx, arg_remu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_ZERO, gen_remu);
+    return gen_arith(ctx, a, EXT_ZERO, gen_remu, NULL);
 }
=20
 static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
@@ -235,7 +235,7 @@ static bool trans_mulw(DisasContext *ctx, arg_mulw *a=
)
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->ol =3D MXL_RV32;
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, NULL);
 }
=20
 static bool trans_divw(DisasContext *ctx, arg_divw *a)
@@ -243,7 +243,7 @@ static bool trans_divw(DisasContext *ctx, arg_divw *a=
)
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->ol =3D MXL_RV32;
-    return gen_arith(ctx, a, EXT_SIGN, gen_div);
+    return gen_arith(ctx, a, EXT_SIGN, gen_div, NULL);
 }
=20
 static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
@@ -251,7 +251,7 @@ static bool trans_divuw(DisasContext *ctx, arg_divuw =
*a)
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->ol =3D MXL_RV32;
-    return gen_arith(ctx, a, EXT_ZERO, gen_divu);
+    return gen_arith(ctx, a, EXT_ZERO, gen_divu, NULL);
 }
=20
 static bool trans_remw(DisasContext *ctx, arg_remw *a)
@@ -259,7 +259,7 @@ static bool trans_remw(DisasContext *ctx, arg_remw *a=
)
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->ol =3D MXL_RV32;
-    return gen_arith(ctx, a, EXT_SIGN, gen_rem);
+    return gen_arith(ctx, a, EXT_SIGN, gen_rem, NULL);
 }
=20
 static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
@@ -267,5 +267,5 @@ static bool trans_remuw(DisasContext *ctx, arg_remuw =
*a)
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->ol =3D MXL_RV32;
-    return gen_arith(ctx, a, EXT_ZERO, gen_remu);
+    return gen_arith(ctx, a, EXT_ZERO, gen_remu, NULL);
 }
--=20
2.31.1


