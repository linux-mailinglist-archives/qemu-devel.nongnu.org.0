Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EB147A4D7
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:06:07 +0100 (CET)
Received: from localhost ([::1]:57554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBoE-00041l-ND
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:06:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAn1-0004H1-5M
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:00:49 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAmx-0008G0-Uu
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:00:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976444; x=1671512444;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GS3D63LwLrcGMDNMyaUMG2Lno9DBrbusnIA97F5PEdk=;
 b=Md3b5leBlwnplQsZQJhwzXctUDVZ86TjqvNv7Gml+edvbX5RHiI7kkk3
 2mdZaZHVfB/OsWG06DpcxnhFd5CG+URJPHiS95iJjG16d13xXNkB2f+7j
 yTwTGEqZRfYZQAckvnXbaO5y41KV08eBCZY284vo0L8PdBhpfF3ALSsGj
 Efx7vTArmjXjA/LVQflMJ3fKwdDV2y0oDPWAi5GrDCe/ch/MiJl61/iyx
 m0J7jeBp8hoG2PvOR6Wadk2JraOBydpFFHBtLyfSIATmVcvshA8zI5/X2
 WGGwvIFznImKF2zMnO6d4AFHe5gjayIk+hY9GBZRacQLiJRvKS69p3PT7 w==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680109"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:00:27 +0800
IronPort-SDR: cNx1ZhmFHSA+W5i1RYA42xLxGfkM51JXmIHj7Fg3wCTb1TRmOZOkpAwg41VnZgewh4tytJDEvv
 ti/LVCpi6XlshhW5A7wvemFCK/On5jHNn7AaBrCexADe4xZKlmUmrokwjsUsiYH0vF9P1d8FUG
 bIRjeCYqbKI1rL/jw3yH3G38AKgglYyH6Qbsuk8aJgkjxX27x1vANNGzOFtAykClXaK5wjiDNK
 wpB81y6R4iqAm8o9pbqfGyNsh5bkCXDqBYq34VdvVVOk/xJoZGJFHxJLx+Ckqzj1+92x0CKpEX
 hbgN6ZoKMZqV3O/LTEaegPo4
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:33:16 -0800
IronPort-SDR: XUTn977Je7onc1rHbLyTo15XWicd/I1NIWgKi3oyPk7xfYC5U2Hq0fy7U56Flr7Uedq6ZNC4jX
 Mmt092aJnkvli2AwvfcIrl+zYv8i84hbCUit66h96VtcJtFs3nqNMeRIuKa0aID8ObxfppMaeV
 JiQU28JqlfBkTTzGjNAqcPvsKayBW9NaquH0JIEgaxRe+KGzbaJq+J2tX6PwowvRX2mN6vV6p/
 F+DLRJrInkBT+aiE6/M6cbhAtjTxfkoczl7pFy3EMQVpJSGSzyTSQjV5Oh9hwqgXIgo34R+i0g
 t40=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:00:27 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS8B2jqZz1RvTg
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:00:26 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976425; x=1642568426; bh=GS3D63LwLrcGMDNMya
 UMG2Lno9DBrbusnIA97F5PEdk=; b=Qh29z/NBQuSuLp9jjhNV52PX+MomxNzwUA
 Sl5nunAMUoNWm7zevuAk3VazR0fG9otOKFkn+rRHGyilEchif6YVib5DmMFLN7y3
 R54+SzkSOzB1EHbNzDF/SqBvzh6R6hUsxLngJM5vU+17V2fYKvKZ1HSGcs5uoFv3
 fns5JSkeAEw/QFrYWsrQVM5yiw/vZH1OXrOO3702f0Xx0gCvVKk41ukpq6lpDNu6
 oAD7E06MeHGn/Z26j7cWclgkXALoR1Anqvhk0tV2aKBTYUCn+KVKnU0jrzotGZgd
 s3sKAIO5OjrcYq4QJTa1U45uSw/9EP2HH6WNqIuqAp0dVnHaerZg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 9eFXhQWmoBp4 for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:00:25 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS8722m6z1RtVG;
 Sun, 19 Dec 2021 21:00:22 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 46/88] target/riscv: rvv-1.0: floating-point scalar move
 instructions
Date: Mon, 20 Dec 2021 14:56:23 +1000
Message-Id: <20211220045705.62174-47-alistair.francis@opensource.wdc.com>
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

NaN-boxed the scalar floating-point register based on RVV 1.0's rules.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-39-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/internals.h                |  5 ----
 target/riscv/insn32.decode              |  4 +--
 target/riscv/insn_trans/trans_rvv.c.inc | 38 ++++++++++++-------------
 3 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 81f5dfa477..ac062dc0b4 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -32,11 +32,6 @@ target_ulong fclass_h(uint64_t frs1);
 target_ulong fclass_s(uint64_t frs1);
 target_ulong fclass_d(uint64_t frs1);
=20
-#define SEW8  0
-#define SEW16 1
-#define SEW32 2
-#define SEW64 3
-
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_riscv_cpu;
 #endif
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index e33ec82fdf..ab5fdbf9be 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -637,8 +637,8 @@ vid_v           010100 . 00000 10001 010 ..... 101011=
1 @r1_vm
 vmv_x_s         010000 1 ..... 00000 010 ..... 1010111 @r2rd
 vmv_s_x         010000 1 00000 ..... 110 ..... 1010111 @r2
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
-vfmv_f_s        001100 1 ..... 00000 001 ..... 1010111 @r2rd
-vfmv_s_f        001101 1 00000 ..... 101 ..... 1010111 @r2
+vfmv_f_s        010000 1 ..... 00000 001 ..... 1010111 @r2rd
+vfmv_s_f        010000 1 00000 ..... 101 ..... 1010111 @r2
 vslideup_vx     001110 . ..... ..... 100 ..... 1010111 @r_vm
 vslideup_vi     001110 . ..... ..... 011 ..... 1010111 @r_vm
 vslide1up_vx    001110 . ..... ..... 110 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 2c8002af54..89f88a0ea7 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3047,14 +3047,19 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vm=
v_s_x *a)
 /* Floating-Point Scalar Move Instructions */
 static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
 {
-    if (!s->vill && has_ext(s, RVF) &&
-        (s->mstatus_fs !=3D 0) && (s->sew !=3D 0)) {
-        unsigned int len =3D 8 << s->sew;
+    if (require_rvv(s) &&
+        require_rvf(s) &&
+        vext_check_isa_ill(s)) {
+        unsigned int ofs =3D (8 << s->sew);
+        unsigned int len =3D 64 - ofs;
+        TCGv_i64 t_nan;
=20
         vec_element_loadi(s, cpu_fpr[a->rd], a->rs2, 0, false);
-        if (len < 64) {
-            tcg_gen_ori_i64(cpu_fpr[a->rd], cpu_fpr[a->rd],
-                            MAKE_64BIT_MASK(len, 64 - len));
+        /* NaN-box f[rd] as necessary for SEW */
+        if (len) {
+            t_nan =3D tcg_constant_i64(UINT64_MAX);
+            tcg_gen_deposit_i64(cpu_fpr[a->rd], cpu_fpr[a->rd],
+                                t_nan, ofs, len);
         }
=20
         mark_fs_dirty(s);
@@ -3066,25 +3071,20 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_v=
fmv_f_s *a)
 /* vfmv.s.f vd, rs1 # vd[0] =3D rs1 (vs2=3D0) */
 static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
 {
-    if (!s->vill && has_ext(s, RVF) && (s->sew !=3D 0)) {
-        TCGv_i64 t1;
+    if (require_rvv(s) &&
+        require_rvf(s) &&
+        vext_check_isa_ill(s)) {
         /* The instructions ignore LMUL and vector register group. */
-        uint32_t vlmax =3D s->vlen >> 3;
+        TCGv_i64 t1;
+        TCGLabel *over =3D gen_new_label();
=20
         /* if vl =3D=3D 0, skip vector register write back */
-        TCGLabel *over =3D gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
=20
-        /* zeroed all elements */
-        tcg_gen_gvec_dup_imm(SEW64, vreg_ofs(s, a->rd), vlmax, vlmax, 0)=
;
-
-        /* NaN-box f[rs1] as necessary for SEW */
+        /* NaN-box f[rs1] */
         t1 =3D tcg_temp_new_i64();
-        if (s->sew =3D=3D MO_64 && !has_ext(s, RVD)) {
-            tcg_gen_ori_i64(t1, cpu_fpr[a->rs1], MAKE_64BIT_MASK(32, 32)=
);
-        } else {
-            tcg_gen_mov_i64(t1, cpu_fpr[a->rs1]);
-        }
+        do_nanbox(s, t1, cpu_fpr[a->rs1]);
+
         vec_element_storei(s, a->rd, 0, t1);
         tcg_temp_free_i64(t1);
         mark_vs_dirty(s);
--=20
2.31.1


