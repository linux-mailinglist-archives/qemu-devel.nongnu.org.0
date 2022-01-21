Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD4D495A6D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 08:13:40 +0100 (CET)
Received: from localhost ([::1]:56796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAo79-00064L-H9
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 02:13:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmyW-00070z-55
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:00:40 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmyO-0004KU-4X
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:00:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744832; x=1674280832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=42qYG+O+e07DbEON443WWzoyeLU+jrt85FhS5UtrJ0I=;
 b=qP3bxoMJxIs+iZFpDVhzkOvS3Mh9lF+yJ5vXbNDJ8XvF0gkf/sbBdwOT
 qDXAwyFrbksdW2A/WX4KvSaTA52HSnY4CflMvcjJLtBA9wXFS02cqGVOQ
 nDhCsDgdg3ddFWIe5L0gqoAYb+65eJOePweepH7fb1ugV9kQAC8xePsaf
 3gNcfxX8iRes2TYNzN9nL2RjSxOnwpWPnSMvH2TLg3BOqlGfN2OnwUvIb
 N2T1siE6vxbZ2d9DwDQ6TKbYjV5a6n5/viK8eAhYY92rbaQOCiVPUvgJ8
 0KlTo2bd6oIRBWEpsfSPY5tpgD9cQwOEH73u95t1XBnfvf8oubH73dCwk Q==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295082934"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:00:27 +0800
IronPort-SDR: 7pETJHStUEmvD4oULU06ea1m249hhm1RITnziO5NaO5WrpkDy0RSCvds9KItG9iqjiA2SeB4qy
 23UjBwHrDYbdRwZ+DXM5tvfXRSBSdOWxuDPiWp8Si05WAjf3Kmovz2+bn8UPwGZO9s+PhQEFxS
 KayO5j4Pn4xQ8RHiLnqUCMQzk0J0WXtzI7dVGTkoP9gyYtTAQxn2VI+Z+gKUPpwvN3poho5Cn2
 ZiYjY2rI38tyrnePkCvY8l9I5Epfv3+pfs6dy4jhzRDJ+2LiFvIDprUD2fDsx8wQbzhu6p4DpQ
 QHQO5r17ODBl6tMnnZGt8abs
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:33:54 -0800
IronPort-SDR: DORH32hC4YO8VO8eYMugF8QSXVd0pnTDELw62rjNvMsRoVlSUS+2zVKtGZwPEFNg+hflDexr8F
 oizuGQCiO1+flTaItj0AZo5u7o9mnV93udbNJOE0K1tGXX8MF2vLHLPE7rVGoCoOmlbjPGAacT
 rf8wAi465oDvW9Yp4B7aw4e1Uiw7lO8OGdABamsO9Kw/FJvyubo308W767YjIA1B40rffZVdBW
 Q/3qbUFSg/mNDIwX38XNjaICW7i1Uy2adgbBVv0sFWfI9/LjqzqJB8aMp4DnimQpFZdwIkjcnA
 F+s=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:00:27 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7yf6Wryz1SVny
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:00:26 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744826; x=1645336827; bh=42qYG+O+e07DbEON44
 3WWzoyeLU+jrt85FhS5UtrJ0I=; b=Tw/p3KQJBf/7c1DvYuCm3HsKjgtyafj9cn
 fSQEsxbXTS2Qcdo4Q+edIXYHaAJcR+ks2lBDlxc1jz2fluvJF3IsNotFYiP8KMTt
 kF5EGlkp0vI4VcvXYkaBPxCUfmquROwYKWkxLqUqzInsTQ79TVyNHQHvwZd5yDva
 pVzRLAdt9HM2Z6EAhzWTKsbxEwbn7v6OSc/7/F8wufHuig5T8xNzZIQQrWH0nt4d
 4oibSlSbLASXuBRYmsXR66UFP2IXsTqF2CuzKT+7/fwwwvZhGiac/IEMsFA4Rz+H
 Qg80b7WMf2Njt3HM2C50UeTbdA0j8+m8vbWCU2qvXSxvOHvAzVPQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id V3GDvPvZ1O2r for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:00:26 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7yb60b7z1RvlN;
 Thu, 20 Jan 2022 22:00:23 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 24/61] target/riscv: rvv-1.0: Add Zve64f support for scalar fp
 insns
Date: Fri, 21 Jan 2022 15:57:53 +1000
Message-Id: <20220121055830.3164408-25-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
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

Zve64f extension requires the scalar processor to implement the F
extension and implement all vector floating-point instructions for
floating-point operands with EEW=3D32 (i.e., no widening floating-point
operations).

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220118014522.13613-7-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 41 +++++++++++++++++++------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 8e493b7933..56246a5d88 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -66,6 +66,17 @@ static bool require_scale_rvf(DisasContext *s)
     }
 }
=20
+static bool require_zve64f(DisasContext *s)
+{
+    /* RVV + Zve64f =3D RVV. */
+    if (has_ext(s, RVV)) {
+        return true;
+    }
+
+    /* Zve64f doesn't support FP64. (Section 18.2) */
+    return s->ext_zve64f ? s->sew <=3D MO_32 : true;
+}
+
 /* Destination vector register group cannot overlap source mask register=
. */
 static bool require_vm(int vm, int vd)
 {
@@ -2206,7 +2217,8 @@ static bool opfvv_check(DisasContext *s, arg_rmrr *=
a)
     return require_rvv(s) &&
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm);
+           vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm) &&
+           require_zve64f(s);
 }
=20
 /* OPFVV without GVEC IR */
@@ -2286,7 +2298,8 @@ static bool opfvf_check(DisasContext *s, arg_rmrr *=
a)
     return require_rvv(s) &&
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_ss(s, a->rd, a->rs2, a->vm);
+           vext_check_ss(s, a->rd, a->rs2, a->vm) &&
+           require_zve64f(s);
 }
=20
 /* OPFVF without GVEC IR */
@@ -2503,7 +2516,8 @@ static bool opfv_check(DisasContext *s, arg_rmr *a)
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
            /* OPFV instructions ignore vs1 check */
-           vext_check_ss(s, a->rd, a->rs2, a->vm);
+           vext_check_ss(s, a->rd, a->rs2, a->vm) &&
+           require_zve64f(s);
 }
=20
 static bool do_opfv(DisasContext *s, arg_rmr *a,
@@ -2568,7 +2582,8 @@ static bool opfvv_cmp_check(DisasContext *s, arg_rm=
rr *a)
     return require_rvv(s) &&
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_mss(s, a->rd, a->rs1, a->rs2);
+           vext_check_mss(s, a->rd, a->rs1, a->rs2) &&
+           require_zve64f(s);
 }
=20
 GEN_OPFVV_TRANS(vmfeq_vv, opfvv_cmp_check)
@@ -2581,7 +2596,8 @@ static bool opfvf_cmp_check(DisasContext *s, arg_rm=
rr *a)
     return require_rvv(s) &&
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_ms(s, a->rd, a->rs2);
+           vext_check_ms(s, a->rd, a->rs2) &&
+           require_zve64f(s);
 }
=20
 GEN_OPFVF_TRANS(vmfeq_vf, opfvf_cmp_check)
@@ -2602,7 +2618,8 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfm=
v_v_f *a)
     if (require_rvv(s) &&
         require_rvf(s) &&
         vext_check_isa_ill(s) &&
-        require_align(a->rd, s->lmul)) {
+        require_align(a->rd, s->lmul) &&
+        require_zve64f(s)) {
         gen_set_rm(s, RISCV_FRM_DYN);
=20
         TCGv_i64 t1;
@@ -3328,7 +3345,8 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfm=
v_f_s *a)
 {
     if (require_rvv(s) &&
         require_rvf(s) &&
-        vext_check_isa_ill(s)) {
+        vext_check_isa_ill(s) &&
+        require_zve64f(s)) {
         gen_set_rm(s, RISCV_FRM_DYN);
=20
         unsigned int ofs =3D (8 << s->sew);
@@ -3354,7 +3372,8 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfm=
v_s_f *a)
 {
     if (require_rvv(s) &&
         require_rvf(s) &&
-        vext_check_isa_ill(s)) {
+        vext_check_isa_ill(s) &&
+        require_zve64f(s)) {
         gen_set_rm(s, RISCV_FRM_DYN);
=20
         /* The instructions ignore LMUL and vector register group. */
@@ -3405,13 +3424,15 @@ GEN_OPIVI_TRANS(vslidedown_vi, IMM_ZX, vslidedown=
_vx, slidedown_check)
 static bool fslideup_check(DisasContext *s, arg_rmrr *a)
 {
     return slideup_check(s, a) &&
-           require_rvf(s);
+           require_rvf(s) &&
+           require_zve64f(s);
 }
=20
 static bool fslidedown_check(DisasContext *s, arg_rmrr *a)
 {
     return slidedown_check(s, a) &&
-           require_rvf(s);
+           require_rvf(s) &&
+           require_zve64f(s);
 }
=20
 GEN_OPFVF_TRANS(vfslide1up_vf, fslideup_check)
--=20
2.31.1


