Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9204E3FD176
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:44:13 +0200 (CEST)
Received: from localhost ([::1]:42280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLGEW-00087P-Kw
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFkd-0008F6-L2
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:13:19 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:34420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFkW-00010Q-TJ
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:13:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462401; x=1661998401;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bq60etOujt67A50MJ0KRr7ZLPRi0VU4eZGFMugjbot4=;
 b=IwkjcmxvnFclMHKF9qwKUhVV58H8vpucegqQ/OS9wCsmb4lmvS0e560T
 DPL9nAYnsDFLNY8LNiBqvXtiJDrLD3AWM+B0cBQB5qYkREIe0V74VOlck
 z3hsCjCiCmhwZgS6whaRG4pvJnzI1E+frfXcmhbVHQlHAJ0I2ZVdGPaNj
 1yE3AYva0HGfl85esK6nFtvOLHHkRuKbnm36/p8620AOKUtezdZoiYz4I
 iE2MU53Uha3NyViv8r1nV5z/xsaVdCFnB34c4IcRyc/PYtsaJIKGgcRk8
 TWegnuyjN2wqhhscgcuhD7fQtOaEQsB0SmB5OtQOHZOrYtt2IWc5ndr5D Q==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="179452536"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:13:17 +0800
IronPort-SDR: cmVfVqGJIgm5egitg0RVYiO+5n4exvwJix4gKBZUpovw66Zn1JgVYlVwjaF8ATlbrVM9Ito4LD
 yHs6lQubmaEZjjsNEGIIXHUjedcCSvhKHWL886I9AICnyHmW2P/hoiAuEMt/mNYw8UIzA/pzlI
 fKj6eScVjLUD1vGX5aN2YeB9aOtuBgzzIlC1dl2cSE9Px6V4oSVKHU6U4gD1FX586eWqp/al9+
 KTV0SBhUrXyQO5+saiqdvtJPi3nfyWfijUFN5aH9zSZ7uBs1dhoLBSRtbE+/Gkcha08sJAD6+p
 SmRBOSPoeSAtAZNChUQTU469
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:48:14 -0700
IronPort-SDR: NtkWcpDu9a+o/Oa8Ti/43yVO0wmdpBqow18Xru/Kpifp3jC5DBjBicaHZhMAjXDi/PeY2LOErO
 qr7jf7OxQIr4HsJOss3uJjifqPIVqU/SkEkDCnO7d2Jnz6MN/kx03VJm2AQzRDc/G1oVAMrTH7
 Gf39dm8FT7T6rXXeMbn+kmWHRoN5fgYfGSYo6Hqm1PefMruJVCfnkP16oHzj2N/MrFBh2yRe7v
 0RVaLc3GR5N++jyCNDW5/+1t6KkZe4aS4tyFhqa8shzeLIORGgllENhS83kQJDzSvxK45Ndyk5
 ATw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:13:09 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Gzndw5tlWz1Rwrr
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:13:08 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630462383; x=1633054384; bh=bq60etOujt67A50MJ0
 KRr7ZLPRi0VU4eZGFMugjbot4=; b=WCzFC9veC5OBfli80B3YI+f8KVgx8OeB4F
 gmXBI/By1EUcCL64bDJfqvUeY3IREiPIcuMcmU5fOUOkD2nTLtExqttYjVJ8BloD
 8/baBZWnZhwIATm5J/mH1M42LNlHMM5qF87w+bn+0Hg67keVnChyqShvunIUg2UJ
 BpUGmxATt62GAyl7FVStO9fskI2iSRN1KBynfRXzgNaRY9wyN8lR7iDMkECx5QbF
 +ql62iKaaseLNRm1XrHeKRXE41+S0n2iTg0pISZ0hsy3ZqdOzUSQRu2BZNtTuqmw
 Mip1qeugvYmP25XtEcj9pW4BsVXIhAfZzHVOGfnpJJ2YgMXF5GRQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id qc8EQOG5-Oum for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:13:03 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Gzndl0Jghz1Rvl9;
 Tue, 31 Aug 2021 19:12:58 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 31/33] target/riscv: Use {get,dest}_gpr for RVD
Date: Wed,  1 Sep 2021 12:09:56 +1000
Message-Id: <20210901020958.458454-32-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=871df42ed=alistair.francis@opensource.wdc.com;
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
X-Mailman-Version: 2.1.23
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

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210823195529.560295-23-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvd.c.inc | 125 ++++++++++++------------
 1 file changed, 60 insertions(+), 65 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_=
trans/trans_rvd.c.inc
index 11b9b3f90b..db9ae15755 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -20,30 +20,40 @@
=20
 static bool trans_fld(DisasContext *ctx, arg_fld *a)
 {
+    TCGv addr;
+
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
-    TCGv t0 =3D tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
-    tcg_gen_addi_tl(t0, t0, a->imm);
=20
-    tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEQ);
+    addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
+    if (a->imm) {
+        TCGv temp =3D temp_new(ctx);
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr =3D temp;
+    }
+
+    tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], addr, ctx->mem_idx, MO_TEQ);
=20
     mark_fs_dirty(ctx);
-    tcg_temp_free(t0);
     return true;
 }
=20
 static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
 {
+    TCGv addr;
+
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
-    TCGv t0 =3D tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
-    tcg_gen_addi_tl(t0, t0, a->imm);
=20
-    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEQ);
+    addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
+    if (a->imm) {
+        TCGv temp =3D temp_new(ctx);
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr =3D temp;
+    }
+
+    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEQ);
=20
-    tcg_temp_free(t0);
     return true;
 }
=20
@@ -252,11 +262,10 @@ static bool trans_feq_d(DisasContext *ctx, arg_feq_=
d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
=20
-    TCGv t0 =3D tcg_temp_new();
-    gen_helper_feq_d(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    TCGv dest =3D dest_gpr(ctx, a->rd);
=20
+    gen_helper_feq_d(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
=20
@@ -265,11 +274,10 @@ static bool trans_flt_d(DisasContext *ctx, arg_flt_=
d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
=20
-    TCGv t0 =3D tcg_temp_new();
-    gen_helper_flt_d(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    TCGv dest =3D dest_gpr(ctx, a->rd);
=20
+    gen_helper_flt_d(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
=20
@@ -278,11 +286,10 @@ static bool trans_fle_d(DisasContext *ctx, arg_fle_=
d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
=20
-    TCGv t0 =3D tcg_temp_new();
-    gen_helper_fle_d(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    TCGv dest =3D dest_gpr(ctx, a->rd);
=20
+    gen_helper_fle_d(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
=20
@@ -291,10 +298,10 @@ static bool trans_fclass_d(DisasContext *ctx, arg_f=
class_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
=20
-    TCGv t0 =3D tcg_temp_new();
-    gen_helper_fclass_d(t0, cpu_fpr[a->rs1]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+
+    gen_helper_fclass_d(dest, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
=20
@@ -303,12 +310,11 @@ static bool trans_fcvt_w_d(DisasContext *ctx, arg_f=
cvt_w_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
=20
-    TCGv t0 =3D tcg_temp_new();
-    gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_w_d(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    TCGv dest =3D dest_gpr(ctx, a->rd);
=20
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_w_d(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
=20
@@ -317,12 +323,11 @@ static bool trans_fcvt_wu_d(DisasContext *ctx, arg_=
fcvt_wu_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
=20
-    TCGv t0 =3D tcg_temp_new();
-    gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_wu_d(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    TCGv dest =3D dest_gpr(ctx, a->rd);
=20
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_wu_d(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
=20
@@ -331,12 +336,10 @@ static bool trans_fcvt_d_w(DisasContext *ctx, arg_f=
cvt_d_w *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
=20
-    TCGv t0 =3D tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
+    TCGv src =3D get_gpr(ctx, a->rs1, EXT_SIGN);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_w(cpu_fpr[a->rd], cpu_env, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_d_w(cpu_fpr[a->rd], cpu_env, src);
=20
     mark_fs_dirty(ctx);
     return true;
@@ -347,12 +350,10 @@ static bool trans_fcvt_d_wu(DisasContext *ctx, arg_=
fcvt_d_wu *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
=20
-    TCGv t0 =3D tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
+    TCGv src =3D get_gpr(ctx, a->rs1, EXT_ZERO);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_wu(cpu_fpr[a->rd], cpu_env, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_d_wu(cpu_fpr[a->rd], cpu_env, src);
=20
     mark_fs_dirty(ctx);
     return true;
@@ -364,11 +365,11 @@ static bool trans_fcvt_l_d(DisasContext *ctx, arg_f=
cvt_l_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
=20
-    TCGv t0 =3D tcg_temp_new();
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_l_d(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_l_d(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
=20
@@ -378,11 +379,11 @@ static bool trans_fcvt_lu_d(DisasContext *ctx, arg_=
fcvt_lu_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
=20
-    TCGv t0 =3D tcg_temp_new();
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_lu_d(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_lu_d(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
=20
@@ -406,12 +407,11 @@ static bool trans_fcvt_d_l(DisasContext *ctx, arg_f=
cvt_d_l *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
=20
-    TCGv t0 =3D tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
+    TCGv src =3D get_gpr(ctx, a->rs1, EXT_SIGN);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_l(cpu_fpr[a->rd], cpu_env, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_d_l(cpu_fpr[a->rd], cpu_env, src);
+
     mark_fs_dirty(ctx);
     return true;
 }
@@ -422,12 +422,11 @@ static bool trans_fcvt_d_lu(DisasContext *ctx, arg_=
fcvt_d_lu *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
=20
-    TCGv t0 =3D tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
+    TCGv src =3D get_gpr(ctx, a->rs1, EXT_ZERO);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_lu(cpu_fpr[a->rd], cpu_env, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_d_lu(cpu_fpr[a->rd], cpu_env, src);
+
     mark_fs_dirty(ctx);
     return true;
 }
@@ -439,11 +438,7 @@ static bool trans_fmv_d_x(DisasContext *ctx, arg_fmv=
_d_x *a)
     REQUIRE_EXT(ctx, RVD);
=20
 #ifdef TARGET_RISCV64
-    TCGv t0 =3D tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
-
-    tcg_gen_mov_tl(cpu_fpr[a->rd], t0);
-    tcg_temp_free(t0);
+    tcg_gen_mov_tl(cpu_fpr[a->rd], get_gpr(ctx, a->rs1, EXT_NONE));
     mark_fs_dirty(ctx);
     return true;
 #else
--=20
2.31.1


