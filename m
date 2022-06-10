Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FA9545B68
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 07:05:35 +0200 (CEST)
Received: from localhost ([::1]:52038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzWpy-0001Ci-UR
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 01:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWGj-0003yW-07
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:29:09 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:58584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWGh-0001AI-8X
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:29:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654835347; x=1686371347;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tIFbLVMkpa3z0ae0dzYBO6i/wyoIkc7BsmLEf6uNPa8=;
 b=jm+Xgqvh6UhTHauL4EWW0d6EhyOJmjurIfK8CsR4qbKTgEbBCmTgAqvj
 Izxj4icDNcm8ZLKVEO/Y1P/32fT8yKKCwLi1HIx4Ik7Sxq5jrxMHCsq7T
 xJjuyk8lRjtveq5iNGxVJaP6qsxugAuhF7BLZViL2r0cfLFOVIk4PeokP
 r9gnvLearZxLfRfjPelx9uf3t6BxHh+hMbXTz2IEGMR2xIacezbkKAgHQ
 LhekUYtif6Bd+/bfdp5O66SVky+458G34BOBrL8ZDyp5dSgOiHUSRevuf
 sTMDvMDkPwwwxPg7cowwJJD4+7i/j5yP183Qrh0QX2Qosp+q8uzXsUWHk g==;
X-IronPort-AV: E=Sophos;i="5.91,288,1647273600"; d="scan'208";a="203541934"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jun 2022 12:29:01 +0800
IronPort-SDR: qhgAbzCVz6OnhYyQ3q1kMfI1xlnKfI8nbnyclOrxQX3gS78goxZA44nrIDuc/34apr789Akl8U
 kbK1yAY+rvTGrX5Cjonb+UhgVFKYE9Dl9XmRTnkhspQU54xutFqoQBhuzY74rWXyojuZnG4ctC
 YFamlHN2bBdcECXIWOvlQgGxcMz8Gxl4aMPvTtnTzAcB0TxgzmUNYGVBtotPfMZ5+T6YG+jZXG
 BLA9tsygO668yvMIcys1dzrvJryo1kBYZ0RG0HoETQNbwbUT/uv1TGNg+EjhOdWGb3lrq0Zp44
 0Bx36k80G789nPOzTONX6wk9
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 20:52:09 -0700
IronPort-SDR: UG9zj9XA6WgYAgOm7NQKhIEyGq093fKNN8/dF+EGWBnzFlW2GH6vn3UUgvW3BesuXI619PA+fD
 S7QKu7GE9BFdTMmYOKPcKvXRHfFN783ZWDVQ8E+eIusm6VN1ePXtbRO+bWEl2HECdH0jTSNlEo
 C4jnJHkdMoNWHcdxioAULO+nqIT1tL5/WEAPim5WvJbkR24E//938MIyUANohJh3et20CjkJX3
 vP1mgFcM3NLhCQcGT+EB88BTZlMH0ray21xmSgwCgyMixE/J6UMsODkUe50F8ugpbqy4VWpE5Q
 LxM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 21:29:01 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LK7JX5Yw5z1Rvlc
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 21:29:00 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1654835340; x=1657427341; bh=tIFbLVMkpa3z0ae0dz
 YBO6i/wyoIkc7BsmLEf6uNPa8=; b=orFH+YK/1WGNAAFWM3D+9GIyw4Kt4u73qd
 GZV+wZlFmQtca8AEfY+CexKq0Sg22Yb2oI3JerYwGzTIV/bk0SzyEY03EV3Gadvf
 7I5LDh21+id1WtWyptyA/o73+r/0zLMMRQnQhEVTl8SWWQwAdpm+KB7rTlmM9Tea
 ToJ4282rh71370tVD1CyuRNcys5PnEu3Ezs0Hv0a4c0Ct+a9eJODrmjPpFH26Bie
 rRZX5T817j6Hq6lZuUGvUVtJwj1C9c/aMPadKxq+dIRqfODmaiUdWvZn0VBFWnbF
 vXY4jD3ncQqAVkvuBcfnG9nLUNaDfvqh/8oj6bQ4IoPVNdIUsKmw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id a20M8RtZWVlB for <qemu-devel@nongnu.org>;
 Thu,  9 Jun 2022 21:29:00 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.12])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LK7JT37cgz1Rvlx;
 Thu,  9 Jun 2022 21:28:57 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Robert Bu <robert.bu@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 25/25] target/riscv: trans_rvv: Avoid assert for RV32 and e64
Date: Fri, 10 Jun 2022 14:26:55 +1000
Message-Id: <20220610042655.2021686-26-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
References: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=1538de18e=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Alistair Francis <alistair.francis@wdc.com>

When running a 32-bit guest, with a e64 vmv.v.x and vl_eq_vlmax set to
true the `tcg_debug_assert(vece <=3D MO_32)` will be triggered inside
tcg_gen_gvec_dup_i32().

This patch checks that condition and instead uses tcg_gen_gvec_dup_i64()
is required.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1028
Suggested-by: Robert Bu <robert.bu@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220608234701.369536-1-alistair.francis@opensource.wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 4f84d4878a..6c091824b6 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2128,8 +2128,16 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv=
_v_x *a)
         s1 =3D get_gpr(s, a->rs1, EXT_SIGN);
=20
         if (s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
-            tcg_gen_gvec_dup_tl(s->sew, vreg_ofs(s, a->rd),
-                                MAXSZ(s), MAXSZ(s), s1);
+            if (get_xl(s) =3D=3D MXL_RV32 && s->sew =3D=3D MO_64) {
+                TCGv_i64 s1_i64 =3D tcg_temp_new_i64();
+                tcg_gen_ext_tl_i64(s1_i64, s1);
+                tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
+                                     MAXSZ(s), MAXSZ(s), s1_i64);
+                tcg_temp_free_i64(s1_i64);
+            } else {
+                tcg_gen_gvec_dup_tl(s->sew, vreg_ofs(s, a->rd),
+                                    MAXSZ(s), MAXSZ(s), s1);
+            }
         } else {
             TCGv_i32 desc;
             TCGv_i64 s1_i64 =3D tcg_temp_new_i64();
--=20
2.36.1


