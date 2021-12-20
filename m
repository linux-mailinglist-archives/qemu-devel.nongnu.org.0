Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3540F47A4B3
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:46:33 +0100 (CET)
Received: from localhost ([::1]:47344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBVI-0002HL-64
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:46:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAmv-0004Fo-WA
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:00:44 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAmh-0008MN-Kj
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:00:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976428; x=1671512428;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3IV3PsWVhoptm5K3lp4NDZJfGGxi0wXtqTwxZ5YAEow=;
 b=PoPknh2PvzwcDIOLZzxy5Qov+X/rHrNrOEED591n8X+ZP149GmWkXKnP
 ljO6yFLoauf1kxGvQUdhf0t1DPsbsCWF9t1GOY34cpCJf6LT5DlMkZl8h
 mkPNU9s0b6wvSyxyMgRQlKu4yTjxZ9xMT74KEcboWpNaKhj7wJ3XEvJ5A
 5q5RVunkka8ZJ+/+A2gUlBvALzUHQWe2sWZ3Ljb9+BItuSTNs7MQYSaL0
 /0sRRqupkXzOSWLezu+mmNj9atpGORWDV9AuV456WCB67kvR5Kw6ePNUn
 YPgAttkguSlc1xEGOWDMypKNEWCRoa4chKv6xwlH3hDZ3cSEtQOIOU4Ss w==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680093"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:00:17 +0800
IronPort-SDR: ryPnmLtwSUV/bqZJdJUeUU7alky6V9dyvGDslBWwtxLeXZaTim6Uus5ltxapPoTsjePfEv0qyQ
 gVFiZLeLFCWqYdQVLD5BLF4KGK9ZBgXpOzZN7XEX2LhJYs1nWwctl0b4Yo/VcTtrA1DfJe4jLS
 9mv2FDoWXjqnjob6ri0IdoQp9K568uNluSVRr3igbuV0m9rKhrshTbzwGmgUMKs50VyWjgJtVU
 AuAOLegcHJ1Kks24N4G6dDjIFpYN1+NjjFK6l1Lf5T7YY/gmAHriXuiQ5J6c+KosHY8+OjY0z+
 00SED5cB5g6FKTAAnpEhIBUB
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:33:05 -0800
IronPort-SDR: om7nT9/flY1hiyd8loFB5yb/hSK+KLFlVDnSy6s8m0R183V20POCFcIcvDq7jc0RxAsyYp1yIJ
 FH4psW6ziWYTvz1bKA0ntMIj57+MYRMa/ymme1VFMF9yUHSPWwyC0XmVtI5aD3IlodTRe0VxhI
 P6h4c2bjYfrhTq78fXd6QLXUgIgLi7+CKLAQe7nQRYV9LVAHT/6/FvoHpeceNmXljCPt9tAnJd
 hgZvnsUgSK8+v7G3/gOZxHV/xJcfBadevXbm8HhSNouEvw+m6HrYasmgc6MoQ8SZdxu5dB6XaH
 j2U=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:00:17 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS7z3rV7z1RvTh
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:00:15 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976415; x=1642568416; bh=3IV3PsWVhoptm5K3lp
 4NDZJfGGxi0wXtqTwxZ5YAEow=; b=mbhMocwksN69PpgxUk5jz7mBPjsxSju+Hf
 MQFT5NmyjQUcw8h0dKPbwjQ5OJUdgxhyEEyZgkhrT4uVcyxtTUtvPDMUYPJALygo
 JihsIuPPvlokx41mpNdFpOZlGt4zVbTsd4AA3OlBQz/+Tbri1ye99NlzNlUUepcL
 mKNqjSXkmedqr3MEG7lhHvmo44GioD3L8h8mT4d7/xBjGlczWZWfYvR+pWPPFkxB
 cfqsj6KGhHwSzwHSzTCMkYHiYz0r72tiAyBAUQ9KolUTT9fsiTBC4FhOCuAotC3g
 avEh7uoHxznY8UNerQ6kOF4ZtzQegsqsKt/2oZeDO2gp2zaDumSg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id X0I7XEo2grO7 for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:00:15 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS7w0Lbmz1RtVG;
 Sun, 19 Dec 2021 21:00:11 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 43/88] target/riscv: rvv-1.0: register gather instructions
Date: Mon, 20 Dec 2021 14:56:20 +1000
Message-Id: <20211220045705.62174-44-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
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

* Add vrgatherei16.vv instruction.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-36-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  4 ++++
 target/riscv/insn32.decode              |  1 +
 target/riscv/vector_helper.c            | 23 ++++++++++++---------
 target/riscv/insn_trans/trans_rvv.c.inc | 27 ++++++++++++++++++++++---
 4 files changed, 43 insertions(+), 12 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 7646567eb2..bd0768d048 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1059,6 +1059,10 @@ DEF_HELPER_6(vrgather_vv_b, void, ptr, ptr, ptr, p=
tr, env, i32)
 DEF_HELPER_6(vrgather_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vrgather_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vrgather_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vrgatherei16_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vrgatherei16_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vrgatherei16_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vrgatherei16_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vrgather_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vrgather_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vrgather_vx_w, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index ab274dcde1..4653a9679e 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -645,6 +645,7 @@ vslidedown_vx   001111 . ..... ..... 100 ..... 101011=
1 @r_vm
 vslidedown_vi   001111 . ..... ..... 011 ..... 1010111 @r_vm
 vslide1down_vx  001111 . ..... ..... 110 ..... 1010111 @r_vm
 vrgather_vv     001100 . ..... ..... 000 ..... 1010111 @r_vm
+vrgatherei16_vv 001110 . ..... ..... 000 ..... 1010111 @r_vm
 vrgather_vx     001100 . ..... ..... 100 ..... 1010111 @r_vm
 vrgather_vi     001100 . ..... ..... 011 ..... 1010111 @r_vm
 vcompress_vm    010111 - ..... ..... 010 ..... 1010111 @r
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index b0dc971a86..86d03d8e39 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4460,11 +4460,11 @@ GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_w, uint32_=
t, H4)
 GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_d, uint64_t, H8)
=20
 /* Vector Register Gather Instruction */
-#define GEN_VEXT_VRGATHER_VV(NAME, ETYPE, H)                            =
  \
+#define GEN_VEXT_VRGATHER_VV(NAME, TS1, TS2, HS1, HS2)                  =
  \
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,             =
  \
                   CPURISCVState *env, uint32_t desc)                    =
  \
 {                                                                       =
  \
-    uint32_t vlmax =3D vext_max_elems(desc, ctzl(sizeof(ETYPE)));       =
    \
+    uint32_t vlmax =3D vext_max_elems(desc, ctzl(sizeof(TS1)));         =
    \
     uint32_t vm =3D vext_vm(desc);                                      =
    \
     uint32_t vl =3D env->vl;                                            =
    \
     uint64_t index;                                                     =
  \
@@ -4474,20 +4474,25 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, =
void *vs2,               \
         if (!vm && !vext_elem_mask(v0, i)) {                            =
  \
             continue;                                                   =
  \
         }                                                               =
  \
-        index =3D *((ETYPE *)vs1 + H(i));                               =
    \
+        index =3D *((TS1 *)vs1 + HS1(i));                               =
    \
         if (index >=3D vlmax) {                                         =
    \
-            *((ETYPE *)vd + H(i)) =3D 0;                                =
    \
+            *((TS2 *)vd + HS2(i)) =3D 0;                                =
    \
         } else {                                                        =
  \
-            *((ETYPE *)vd + H(i)) =3D *((ETYPE *)vs2 + H(index));       =
    \
+            *((TS2 *)vd + HS2(i)) =3D *((TS2 *)vs2 + HS2(index));       =
    \
         }                                                               =
  \
     }                                                                   =
  \
 }
=20
 /* vd[i] =3D (vs1[i] >=3D VLMAX) ? 0 : vs2[vs1[i]]; */
-GEN_VEXT_VRGATHER_VV(vrgather_vv_b, uint8_t,  H1)
-GEN_VEXT_VRGATHER_VV(vrgather_vv_h, uint16_t, H2)
-GEN_VEXT_VRGATHER_VV(vrgather_vv_w, uint32_t, H4)
-GEN_VEXT_VRGATHER_VV(vrgather_vv_d, uint64_t, H8)
+GEN_VEXT_VRGATHER_VV(vrgather_vv_b, uint8_t,  uint8_t,  H1, H1)
+GEN_VEXT_VRGATHER_VV(vrgather_vv_h, uint16_t, uint16_t, H2, H2)
+GEN_VEXT_VRGATHER_VV(vrgather_vv_w, uint32_t, uint32_t, H4, H4)
+GEN_VEXT_VRGATHER_VV(vrgather_vv_d, uint64_t, uint64_t, H8, H8)
+
+GEN_VEXT_VRGATHER_VV(vrgatherei16_vv_b, uint16_t, uint8_t,  H2, H1)
+GEN_VEXT_VRGATHER_VV(vrgatherei16_vv_h, uint16_t, uint16_t, H2, H2)
+GEN_VEXT_VRGATHER_VV(vrgatherei16_vv_w, uint16_t, uint32_t, H2, H4)
+GEN_VEXT_VRGATHER_VV(vrgatherei16_vv_d, uint16_t, uint64_t, H2, H8)
=20
 #define GEN_VEXT_VRGATHER_VX(NAME, ETYPE, H)                            =
  \
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,       =
  \
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 4207cc4e6b..322fc5c4aa 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3090,7 +3090,25 @@ static bool vrgather_vv_check(DisasContext *s, arg=
_rmrr *a)
            require_vm(a->vm, a->rd);
 }
=20
+static bool vrgatherei16_vv_check(DisasContext *s, arg_rmrr *a)
+{
+    int8_t emul =3D MO_16 - s->sew + s->lmul;
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           (emul >=3D -3 && emul <=3D 3) &&
+           require_align(a->rd, s->lmul) &&
+           require_align(a->rs1, emul) &&
+           require_align(a->rs2, s->lmul) &&
+           (a->rd !=3D a->rs2 && a->rd !=3D a->rs1) &&
+           !is_overlapped(a->rd, 1 << MAX(s->lmul, 0),
+                          a->rs1, 1 << MAX(emul, 0)) &&
+           !is_overlapped(a->rd, 1 << MAX(s->lmul, 0),
+                          a->rs2, 1 << MAX(s->lmul, 0)) &&
+           require_vm(a->vm, a->rd);
+}
+
 GEN_OPIVV_TRANS(vrgather_vv, vrgather_vv_check)
+GEN_OPIVV_TRANS(vrgatherei16_vv, vrgatherei16_vv_check)
=20
 static bool vrgather_vx_check(DisasContext *s, arg_rmrr *a)
 {
@@ -3110,7 +3128,8 @@ static bool trans_vrgather_vx(DisasContext *s, arg_=
rmrr *a)
     }
=20
     if (a->vm && s->vl_eq_vlmax) {
-        int vlmax =3D s->vlen;
+        int scale =3D s->lmul - (s->sew + 3);
+        int vlmax =3D scale < 0 ? s->vlen >> -scale : s->vlen << scale;
         TCGv_i64 dest =3D tcg_temp_new_i64();
=20
         if (a->rs1 =3D=3D 0) {
@@ -3141,8 +3160,10 @@ static bool trans_vrgather_vi(DisasContext *s, arg=
_rmrr *a)
     }
=20
     if (a->vm && s->vl_eq_vlmax) {
-        if (a->rs1 >=3D s->vlen) {
-            tcg_gen_gvec_dup_imm(SEW64, vreg_ofs(s, a->rd),
+        int scale =3D s->lmul - (s->sew + 3);
+        int vlmax =3D scale < 0 ? s->vlen >> -scale : s->vlen << scale;
+        if (a->rs1 >=3D vlmax) {
+            tcg_gen_gvec_dup_imm(MO_64, vreg_ofs(s, a->rd),
                                  MAXSZ(s), MAXSZ(s), 0);
         } else {
             tcg_gen_gvec_dup_mem(s->sew, vreg_ofs(s, a->rd),
--=20
2.31.1


