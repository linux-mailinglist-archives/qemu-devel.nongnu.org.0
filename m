Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B80447A4E2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:14:45 +0100 (CET)
Received: from localhost ([::1]:47102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBwa-0007mf-DY
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:14:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAms-0004En-SB
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:00:39 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAmd-0008Lj-Ch
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:00:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976424; x=1671512424;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5SfEbCR2fLwoVvAp3xkPdFS33e5bzg7Bgm7kMVCVmg8=;
 b=GgDCYQgFYD7kMZ2iQ0ngP7ox+qTd5HJk0yayG3nwNjAvkEBd5478Cwcc
 L9fZufJwL9I1OHXsZk7pu94Sl8uuctzW+CQL700fR0e27D42vH9n4KpZs
 bQ5qlE7vLZrIUGPhePNlL2OhMptCmlOF/4IEmPbHkBsOzFBX1bFH9mpIn
 oizFqegR/iP/Ev7O9eMxL/EuA3JCy2k+sNCNlr9jJ1cCvVN+J9ASX9CE3
 h4l2S0P1HjQHo2yfNsPGJLsuuVdd43TxRsrnd6jWb5VbLbjemlQfkH+fF
 edaFVXcbstJVxQEpfxthVJFwnIy70oSLRhvC4qis4/ZXhhVZjZx6clYPN g==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680087"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:00:13 +0800
IronPort-SDR: qUk9azE1tQUa0DgeHOVbOfp/h8kCc00E6o6OSvIf7FdxZHzjNxFIfScAXVmrB0PTdjKii3nrqw
 r5HQL6szh/MXDLAevhBRm+oY8Q3VoTw2ZncHyBAf3hPxr4zoFGqOfyclFMsC5zkN5A/F1zSb3a
 9pfQesrYYj/Hx3ICov/NW0ImBrThuN5ruyz5hQWLp6PkITBzsHdafVQwnpPqECI+dD3LtKMPVn
 +GHW0q4e4SaxE+KtK8OKL1aPpomLxvKIw63mAFkw2V49qkjYrrqFecAvcMjSB5aBX5EffZyvWC
 MPXr/XfrXLQem9QQaYq79d/d
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:33:01 -0800
IronPort-SDR: sxoN2XTiDO3YppmicYAyJm/rouYdTA55Gmya5yEZjFwRcZXth0M8NIY8SQ/YDFFPrkhdHi5k7h
 dQ8JVpdLJDc2kwjGIPUUeYs/MzHAFlwhlC6MV7ocLZi6/l41kmGJ8WBFLMZJlMaFZza46GePty
 QxdNhBipDYpBzYM/MmJZVJe2zB9xpoR557cjJg4tKsQYUCA7ZaiC8APPrnJPuVLChqYnLMPmqN
 QmI37N/VnlL6TYrE3FbYUlAkFuK1d/69q7GU9nqZj2rBJU3syULFy6+TIEPzPbyP+7f7VE+WUp
 gW0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:00:13 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS7v4RmDz1RvTg
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:00:11 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976411; x=1642568412; bh=5SfEbCR2fLwoVvAp3x
 kPdFS33e5bzg7Bgm7kMVCVmg8=; b=Uj4wmuBWNwXaz7cnyx8TTeWQ5jzIYzfcVg
 G0lH0W5meFL7Tet2dOryYSRznsqfmf1MSuGV1z5eVsjdNOwSfYeH+5aUG6Kg1H7q
 aJ5WYN0M/aA0owh0fgwa9jkEtNqbeQZvyS4gAH7UIWYB+YEiR3ux3w6+eABlJ7On
 PM1ZN4uwZM8fWyB3vp4i3T5fmxWSXCrfSaD8yDJMLXpHwrI3YCD+dIgbVwp5C1pg
 9IeQv9jblPP4/v5CVGFDzBgr4nkPJzmFjhFaRAKhB3KmrsRJQIa4HU7TNVSwSwPM
 9FVnGcyJojh/0YRWpndDN6lakmLxgRF6F/w6wks9zw04xGfqhBgw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id msjtI6M7l5NK for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:00:11 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS7r1Xggz1RtVG;
 Sun, 19 Dec 2021 21:00:07 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 42/88] target/riscv: rvv-1.0: allow load element with
 sign-extended
Date: Mon, 20 Dec 2021 14:56:19 +1000
Message-Id: <20211220045705.62174-43-alistair.francis@opensource.wdc.com>
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

For some vector instructions (e.g. vmv.s.x), the element is loaded with
sign-extended.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-35-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 32 +++++++++++++++++--------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 80cbf0cadb..4207cc4e6b 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2825,17 +2825,29 @@ static bool trans_vid_v(DisasContext *s, arg_vid_=
v *a)
 /* Integer Extract Instruction */
=20
 static void load_element(TCGv_i64 dest, TCGv_ptr base,
-                         int ofs, int sew)
+                         int ofs, int sew, bool sign)
 {
     switch (sew) {
     case MO_8:
-        tcg_gen_ld8u_i64(dest, base, ofs);
+        if (!sign) {
+            tcg_gen_ld8u_i64(dest, base, ofs);
+        } else {
+            tcg_gen_ld8s_i64(dest, base, ofs);
+        }
         break;
     case MO_16:
-        tcg_gen_ld16u_i64(dest, base, ofs);
+        if (!sign) {
+            tcg_gen_ld16u_i64(dest, base, ofs);
+        } else {
+            tcg_gen_ld16s_i64(dest, base, ofs);
+        }
         break;
     case MO_32:
-        tcg_gen_ld32u_i64(dest, base, ofs);
+        if (!sign) {
+            tcg_gen_ld32u_i64(dest, base, ofs);
+        } else {
+            tcg_gen_ld32s_i64(dest, base, ofs);
+        }
         break;
     case MO_64:
         tcg_gen_ld_i64(dest, base, ofs);
@@ -2890,7 +2902,7 @@ static void vec_element_loadx(DisasContext *s, TCGv=
_i64 dest,
=20
     /* Perform the load. */
     load_element(dest, base,
-                 vreg_ofs(s, vreg), s->sew);
+                 vreg_ofs(s, vreg), s->sew, false);
     tcg_temp_free_ptr(base);
     tcg_temp_free_i32(ofs);
=20
@@ -2906,9 +2918,9 @@ static void vec_element_loadx(DisasContext *s, TCGv=
_i64 dest,
 }
=20
 static void vec_element_loadi(DisasContext *s, TCGv_i64 dest,
-                              int vreg, int idx)
+                              int vreg, int idx, bool sign)
 {
-    load_element(dest, cpu_env, endian_ofs(s, vreg, idx), s->sew);
+    load_element(dest, cpu_env, endian_ofs(s, vreg, idx), s->sew, sign);
 }
=20
 static bool trans_vext_x_v(DisasContext *s, arg_r *a)
@@ -2918,7 +2930,7 @@ static bool trans_vext_x_v(DisasContext *s, arg_r *=
a)
=20
     if (a->rs1 =3D=3D 0) {
         /* Special case vmv.x.s rd, vs2. */
-        vec_element_loadi(s, tmp, a->rs2, 0);
+        vec_element_loadi(s, tmp, a->rs2, 0, false);
     } else {
         /* This instruction ignores LMUL and vector register groups */
         int vlmax =3D s->vlen >> (3 + s->sew);
@@ -3000,7 +3012,7 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfm=
v_f_s *a)
         (s->mstatus_fs !=3D 0) && (s->sew !=3D 0)) {
         unsigned int len =3D 8 << s->sew;
=20
-        vec_element_loadi(s, cpu_fpr[a->rd], a->rs2, 0);
+        vec_element_loadi(s, cpu_fpr[a->rd], a->rs2, 0, false);
         if (len < 64) {
             tcg_gen_ori_i64(cpu_fpr[a->rd], cpu_fpr[a->rd],
                             MAKE_64BIT_MASK(len, 64 - len));
@@ -3102,7 +3114,7 @@ static bool trans_vrgather_vx(DisasContext *s, arg_=
rmrr *a)
         TCGv_i64 dest =3D tcg_temp_new_i64();
=20
         if (a->rs1 =3D=3D 0) {
-            vec_element_loadi(s, dest, a->rs2, 0);
+            vec_element_loadi(s, dest, a->rs2, 0, false);
         } else {
             vec_element_loadx(s, dest, a->rs2, cpu_gpr[a->rs1], vlmax);
         }
--=20
2.31.1


