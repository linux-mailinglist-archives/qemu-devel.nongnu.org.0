Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ADC4881DD
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 07:32:31 +0100 (CET)
Received: from localhost ([::1]:53528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n65HC-0008OJ-Nh
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 01:32:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64e8-0000IE-2b
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:52:08 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:63856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64e6-0006sW-Cw
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:52:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621124; x=1673157124;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HZGbLSQ+MdEnuDl+9NAhU5eovcvjqDrQqnltTSMlWP4=;
 b=VZ7vgBVn2v7Szr5esRwG6Hwiuys3kg1mv3c4o0b1FzYchlB7gyS/t1kA
 S8C/jmnhRlqS7Urh27Bud/RLrHjCnTM/3X8hzlNHafSk7G2KG2s5QTiGR
 tBoS0KjK+hkYXId7qB6DtavjT8oZeuGeYlfzDqNffzH1fL4Bhb3amPQIW
 YnQPR18bEUKb47xK/pleUE1sTY4VvN5cGte1x1srflOso7yA5czvRNQYy
 xXRFNp2UMefXGC5aZ3us3ew4HQk6mditbH86iMHLDKsRPze6Birpoz9wn
 6OVo0uKDNz05UWatojquD/bLv44Be6dqF6YU+cvkNgh4iHxpGgJqkYWMu g==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="189984909"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:52:03 +0800
IronPort-SDR: Q7ggcaSNccHx6mJxy8zluv1/55LSSHBm5I2ucnT8ga9uU/YuCweqvlxNNT0SG4PEM9HpUpwRsZ
 lTM99OwjzpzjyvDCy6Y8hg//FrljGY62BUJ7T0x9VVfBI7q01EX2eQeY9vJJ7MgkcJXoxPQkv6
 /hZW/dj1TJ/c0HKSLNwbRn8WCn5bZ64hVDYA0lfqRknU1iPiFxvhxSA6t1697LvDWOb7IXe1Nb
 /QhD1331FxAHCwhedgyyTNE6DNFGWwFS5MgwmszM3ms4I+yG753YuvvX/p7p2RG57Jj5iogfhl
 Qk3Ngb6bv4w7q1m0R35gUMpt
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:25:52 -0800
IronPort-SDR: NA2Ozw4tIRf57krx0jzPJ8PS21Ykqgz1+KEtn8HKRTRjO+1XsS2ot1caLUESszITdHULj5bTFO
 tbK4YUQaNo/jWPAj+aeqDJZ+V/007ZKuwi8gZ/aEpo9t6N1E/3QzcjHGr8DxAyFx2fhkO+fl8x
 fAVbgj2LfVLjj1g+cnLw07U3GJx3LCyJ7LcFMPII0KJv/4lCKIncR1a/vKiN5egGR7qMYCjqJY
 FDNmxfVWx167r1an9g0xf2jF0L6brNuBtsoavzhOnEfEQAEH7h+veWabmWSHkY9WP1Ao1nZznx
 NbE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:52:06 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8P067Vkz1VSkW
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:52:04 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1641621124; x=1644213125; bh=HZGbLSQ+MdEnuDl+9N
 AhU5eovcvjqDrQqnltTSMlWP4=; b=QJ9HjU8Elfk8bJA+s+94EfAW0Ah7ubvHS3
 HvTyFEDzGc/7h0Brm72A2OU19zxXiyPvJxR4CFZaiLQQpEdCQ+sgNdVVqGmxPMBH
 m5yDxyqH+35JZG2KonGTh/C/AqKyMyXBen+5eEuQNbskkSTyXyteNrK8ErRZYMZl
 3KfD83WWTRuduEbE9KWVgyq5xJtD1kzNLOx21i806aRGO8j5lNOtaPY+gXtSHgyt
 obDm4NAXm9peW7BOYNiOGHX/7oVL1HKIGGsLsoJVHNQ091CzeoPUhbZ00pc6q2y+
 djinqw1oOKPHmDQHFb9e3VJyhsz4F2bKgaFuSwfyYqqDmDt3dE1Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id UbYq2oDL683E for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:52:04 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8Nx3Q1vz1VSkV;
 Fri,  7 Jan 2022 21:52:01 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 14/37] target/riscv: rvv-1.0: Call the correct RVF/RVD check
 function for widening fp/int type-convert insns
Date: Sat,  8 Jan 2022 15:50:25 +1000
Message-Id: <20220108055048.3512645-15-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
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

From: Frank Chang <frank.chang@sifive.com>

vfwcvt.xu.f.v, vfwcvt.x.f.v, vfwcvt.rtz.xu.f.v and vfwcvt.rtz.x.f.v
convert single-width floating-point to double-width integer.
Therefore, should use require_rvf() to check whether RVF/RVD is enabled.

vfwcvt.f.xu.v, vfwcvt.f.x.v convert single-width integer to double-width
floating-point, and vfwcvt.f.f.v convert double-width floating-point to
single-width floating-point. Therefore, should use require_scale_rvf() to
check whether RVF/RVD is enabled.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220105022247.21131-3-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 34 ++++++++++++++++++-------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 8d92243f2b..f1b44ccad2 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2613,16 +2613,27 @@ GEN_OPFV_CVT_TRANS(vfcvt_rtz_x_f_v, vfcvt_x_f_v, =
RISCV_FRM_RTZ)
 static bool opfv_widen_check(DisasContext *s, arg_rmr *a)
 {
     return require_rvv(s) &&
-           require_scale_rvf(s) &&
-           (s->sew !=3D MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_ds(s, a->rd, a->rs2, a->vm);
 }
=20
-#define GEN_OPFV_WIDEN_TRANS(NAME, HELPER, FRM)                    \
+static bool opxfv_widen_check(DisasContext *s, arg_rmr *a)
+{
+    return opfv_widen_check(s, a) &&
+           require_rvf(s);
+}
+
+static bool opffv_widen_check(DisasContext *s, arg_rmr *a)
+{
+    return opfv_widen_check(s, a) &&
+           require_scale_rvf(s) &&
+           (s->sew !=3D MO_8);
+}
+
+#define GEN_OPFV_WIDEN_TRANS(NAME, CHECK, HELPER, FRM)             \
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
-    if (opfv_widen_check(s, a)) {                                  \
+    if (CHECK(s, a)) {                                             \
         if (FRM !=3D RISCV_FRM_DYN) {                                \
             gen_set_rm(s, RISCV_FRM_DYN);                          \
         }                                                          \
@@ -2649,12 +2660,17 @@ static bool trans_##NAME(DisasContext *s, arg_rmr=
 *a)              \
     return false;                                                  \
 }
=20
-GEN_OPFV_WIDEN_TRANS(vfwcvt_xu_f_v, vfwcvt_xu_f_v, RISCV_FRM_DYN)
-GEN_OPFV_WIDEN_TRANS(vfwcvt_x_f_v, vfwcvt_x_f_v, RISCV_FRM_DYN)
-GEN_OPFV_WIDEN_TRANS(vfwcvt_f_f_v, vfwcvt_f_f_v, RISCV_FRM_DYN)
+GEN_OPFV_WIDEN_TRANS(vfwcvt_xu_f_v, opxfv_widen_check, vfwcvt_xu_f_v,
+                     RISCV_FRM_DYN)
+GEN_OPFV_WIDEN_TRANS(vfwcvt_x_f_v, opxfv_widen_check, vfwcvt_x_f_v,
+                     RISCV_FRM_DYN)
+GEN_OPFV_WIDEN_TRANS(vfwcvt_f_f_v, opffv_widen_check, vfwcvt_f_f_v,
+                     RISCV_FRM_DYN)
 /* Reuse the helper functions from vfwcvt.xu.f.v and vfwcvt.x.f.v */
-GEN_OPFV_WIDEN_TRANS(vfwcvt_rtz_xu_f_v, vfwcvt_xu_f_v, RISCV_FRM_RTZ)
-GEN_OPFV_WIDEN_TRANS(vfwcvt_rtz_x_f_v, vfwcvt_x_f_v, RISCV_FRM_RTZ)
+GEN_OPFV_WIDEN_TRANS(vfwcvt_rtz_xu_f_v, opxfv_widen_check, vfwcvt_xu_f_v=
,
+                     RISCV_FRM_RTZ)
+GEN_OPFV_WIDEN_TRANS(vfwcvt_rtz_x_f_v, opxfv_widen_check, vfwcvt_x_f_v,
+                     RISCV_FRM_RTZ)
=20
 static bool opfxv_widen_check(DisasContext *s, arg_rmr *a)
 {
--=20
2.31.1


