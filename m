Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA23F544016
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 01:49:05 +0200 (CEST)
Received: from localhost ([::1]:58482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz5Q8-0003wA-73
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 19:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=15114fb85=alistair.francis@opensource.wdc.com>)
 id 1nz5OQ-000321-Bt
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 19:47:18 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:36737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=15114fb85=alistair.francis@opensource.wdc.com>)
 id 1nz5OL-0001pF-Ot
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 19:47:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654732032; x=1686268032;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w2k3+yROqoHmbdWyCpcM38o625k+olDaN84e7SOgEas=;
 b=L9MA9blWxetMc3Wde6rUkjw8+CrNoBOiCTngd4fFZGXRdcsFlXyFcjVL
 YpS800YJVpUwbeReEnLHZTXJ1Xx4L2M0vROhxkiqFW46Re0z9MkVx4rUG
 7/Jep6IkhwSnWljOfA5rExx+z202vgP6Lpg9W/u3wzRvIx+DyQck5QUQA
 ouJxXkUE33j/CWpyzN4afYLDWd1Gzvgfj4JFfK180xxdGJ+7osL6WK0sz
 m1upf3bAR7eJSDvKCHFA3it6ezDtnl0JH5lhRq+8eH7NPZ4Kt2enmFKxb
 wtsiv7zi7BKlZgZOfqByo6U5ZyxWJsFvhnkhg83I9SzN9i3UQyUi+496G A==;
X-IronPort-AV: E=Sophos;i="5.91,287,1647273600"; d="scan'208";a="202644366"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jun 2022 07:47:10 +0800
IronPort-SDR: UNMcl29pK/FO/3rBIezjSsogl/UDTZ57xp8BOwiXLLGVdcyQb5jGf4Xy3WUeh7F4ps9PZNgKz7
 ey/V6lROyrpW01s6DeSF9o8zvbMUm3EfrA1V1Xhdxr4dI03KeQnm+fgvvNKAY+eCOKk0yUCcYn
 DTnqPD2lNbA70aqQfigtviWWvIIdnRcyeTrCrZEr5HAAQeLkaZe+MXVE7w+FIMOVFdhM+xAS4/
 7xx3tHAxgwCPjR9bJVTXq2GhynVqftfHkPLQsDkddNgpzR9Nnu/jah2XvKeaBmNndsnN5L4v3J
 Id2sSEqYBmB/kphh7JCBFlPn
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Jun 2022 16:10:24 -0700
IronPort-SDR: LIBvjGIRG2qzJaYRbRLuhm2H74lupA3MXpDL6c+FuNU8wrIbCUO0SGVqO2V6vZ/2Joyuccsv0N
 MMfq5oiukrjD5rnlmU2TgoaGPT+Yty6LsCrqTZx31WZUuI7po3pYPoIGhEVE07TBKTkc+XB1qb
 zS34lFQOZDSUZMBb+MxEgPAbPNzfERQIY+dTL9pnytfcTGVSNbiuQMApVVdmE5Ry8tqfaIcW22
 R7UOLCqIsaDBAA/KLSmwjDxvZMoCg9UheoW1GPM1DlgIf4VTkQNuOI0tditJp/nCim+t6sKNke
 LwE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Jun 2022 16:47:11 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LJP5p3l4nz1Rwrw
 for <qemu-devel@nongnu.org>; Wed,  8 Jun 2022 16:47:10 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1654732029;
 x=1657324030; bh=w2k3+yROqoHmbdWyCpcM38o625k+olDaN84e7SOgEas=; b=
 QQezmAb2Qa7FwVoq+HK5BOBtm+w33N6EJ+2PfTlNL96oYKpFUB0X/jKde9StXrVB
 Sg6AXA2QmuRbegL8llxE8D8HOaK+oMSy4xnMF7r7C/L5amZ/kQ0QxVeKfLB3UXtE
 ar6qMwLkpeai3i2hHNTkGmfOv0mSyR4HPYrXPAUP5dNLEFZH2Isr2JKqz780FVMf
 15ZGLs38NArS0jYg0gIb9wG1o7C47D1rPpFG1mShoM+vY9CV0HSVDWxy61Z2LGoO
 lY5yyC5VBKFaFAhn6wAxmjEX68A/GGcYFtqMXcvdV7ZAtqnr2Kjt6qQucDD4ecxQ
 45/4ZS5/ReEbT1MFXjCKIg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 8_gpW6g9vYWP for <qemu-devel@nongnu.org>;
 Wed,  8 Jun 2022 16:47:09 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.12])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LJP5k0njJz1Rvlc;
 Wed,  8 Jun 2022 16:47:05 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, bmeng.cn@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 Robert Bu <robert.bu@gmail.com>
Subject: [PATCH] target/riscv: trans_rvv: Avoid assert for RV32 and e64
Date: Thu,  9 Jun 2022 09:47:01 +1000
Message-Id: <20220608234701.369536-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=15114fb85=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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
---
 target/riscv/insn_trans/trans_rvv.c.inc | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 391c61fe93..6b27d8e91e 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2097,8 +2097,16 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv=
_v_x *a)
         s1 =3D get_gpr(s, a->rs1, EXT_SIGN);
=20
         if (s->vl_eq_vlmax) {
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


