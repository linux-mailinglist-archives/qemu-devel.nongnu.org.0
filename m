Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3328D4881CC
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 07:14:35 +0100 (CET)
Received: from localhost ([::1]:53460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n64zq-0003Ms-A0
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 01:14:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64f7-00015k-5g
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:53:10 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:63935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64f4-0006wZ-Fk
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:53:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621185; x=1673157185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FXK0rLmqYwsU0aFZ/l33MA/0FUIMOsH/LnU+YDPKz6I=;
 b=m3BtL/cTb5zQsO9lxvKAHGGl5qCAMS9quKG+NdQMnqoB+TyqEki9tXxj
 3ZIiKHn8+cUalr+a2g+R3ONPopNA//OvNc8Oo4C8kXEPsK3SNMS2X5NZ0
 dE9VUZbz2ciKMG1Tqunv+dd57LI24bYgHbwQQYFVj6/SxtPn1AcC1jvNy
 vxhnua9mqIasbUSSybvNguVPxNIAL/hzikSOhQo94Pw8bPTEwxtq9hS7/
 nLMcpJSGWmo17y/VxLBYbjQr9XL13nKYitaV6yWsH8PHRFGMxMc0aeKJC
 M8jFBIOATTUI7quIjfv+nOTJSynpP4ULO9y50pBTH4vTbBcqIUt2+Qyg2 w==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="189984943"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:53:04 +0800
IronPort-SDR: hcIKym61vMpWvfHcj/O+2dMclBBOKeMRU1vB1m2IrQA1PsFxz816xVLNyNPb+DdxQRUtEJBoI2
 j/Gcc/Rgp3lLhOtttYmLal25+IueeEf/z9V0oMPMICkZjoehoWaQiGThC8zymB2nm1jPc8dsMC
 s52QUlh7LUn0JuyslS2IzZRBoXzIGKsbBdWF1glzdQmd99xteYrSkKGz1cT6gbNkFQI3sx3kbQ
 rWGVa6yFE9sDdXDbQR2e/HTi/+6v2udaMbCzyH3HV7o11Ojd+RFLKHqtZi/Q8RDsY8miC+5cO+
 yh2KzA62RJznTdqgx7OE8m9j
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:25:31 -0800
IronPort-SDR: 7R6fQDbhLEGZVDmu8hdQ9fGFU6HKVjG/+4n0QLWzZIIJvchyOUmagsntFLUaI1Ty+AehVUK3fu
 veMyAoesAiKPdhrZjVYIR0uOZb+8NSjyvK0mz6Dp5HzDA82B4hs8dFZA0LsVZfDxSOmOa8Ao92
 k9addVvCOjnjAdeJ5RNzJi0v9FYTagwj6q9BMgN5x7YugwS5ye/rzIaWRYGaX6hOA7kV2CYbQJ
 aL1wXBmNhmgtc6C/JARF9KwhA9BJkOIfL5CbSAOsB5VE1FTd3uvTWpY0hOwPkI9LhXm7HWk5iZ
 1t8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:53:06 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8Q86GX2z1VSkf
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:53:04 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1641621184; x=1644213185; bh=FXK0rLm
 qYwsU0aFZ/l33MA/0FUIMOsH/LnU+YDPKz6I=; b=RWR+c/dj5AuEhrpwwbDxkKE
 W9RUZoLS16thyb1GSboHXeYzruZtAs3ylNIuuFpZb0mLPhJVboMGycjQP2qF+uWy
 Nh8v3wLa6DKADB1YllZC2gfbNhd/E7ZLc+DY2am/dc8uTz9qguFPsnNDvXhV2W91
 nPGgAI+KvtSP8+NHq79I8r3abvFoYlf8LWMMZktXsbAQgj2Yf/Irax5RmbFiVkKx
 BNUzW+Gx5v74sPh+FjcKFHil0eWnpkG7Fwxs85RP/DrtCFm/7cRZ9r2LgwJXjvrc
 wlhqVgDH6iVOVAkKLT8GyC3wf5nfJcV4oqbzd9F4wDyDrS2wU2EJd/x5vbHdO4w=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ImDNzHicTi0X for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:53:04 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8Q44f58z1VSkW;
 Fri,  7 Jan 2022 21:53:00 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 27/37] target/riscv: support for 128-bit U-type instructions
Date: Sat,  8 Jan 2022 15:50:38 +1000
Message-Id: <20220108055048.3512645-28-alistair.francis@opensource.wdc.com>
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

Adding the 128-bit version of lui and auipc, and introducing to that end
a "set register with immediat" function to handle extension on 128 bits.

Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220106210108.138226-12-frederic.petrot@univ-grenoble-alpes.=
fr
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c                | 21 +++++++++++++++++++++
 target/riscv/insn_trans/trans_rvi.c.inc |  8 ++++----
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index b43efc9bc3..ba1ad1be5f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -322,6 +322,27 @@ static void gen_set_gpr(DisasContext *ctx, int reg_n=
um, TCGv t)
     }
 }
=20
+static void gen_set_gpri(DisasContext *ctx, int reg_num, target_long imm=
)
+{
+    if (reg_num !=3D 0) {
+        switch (get_ol(ctx)) {
+        case MXL_RV32:
+            tcg_gen_movi_tl(cpu_gpr[reg_num], (int32_t)imm);
+            break;
+        case MXL_RV64:
+        case MXL_RV128:
+            tcg_gen_movi_tl(cpu_gpr[reg_num], imm);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
+        if (get_xl_max(ctx) =3D=3D MXL_RV128) {
+            tcg_gen_movi_tl(cpu_gprh[reg_num], -(imm < 0));
+        }
+    }
+}
+
 static void gen_set_gpr128(DisasContext *ctx, int reg_num, TCGv rl, TCGv=
 rh)
 {
     assert(get_ol(ctx) =3D=3D MXL_RV128);
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
index e572976e88..6113acc669 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -26,14 +26,14 @@ static bool trans_illegal(DisasContext *ctx, arg_empt=
y *a)
=20
 static bool trans_c64_illegal(DisasContext *ctx, arg_empty *a)
 {
-     REQUIRE_64BIT(ctx);
-     return trans_illegal(ctx, a);
+    REQUIRE_64_OR_128BIT(ctx);
+    return trans_illegal(ctx, a);
 }
=20
 static bool trans_lui(DisasContext *ctx, arg_lui *a)
 {
     if (a->rd !=3D 0) {
-        tcg_gen_movi_tl(cpu_gpr[a->rd], a->imm);
+        gen_set_gpri(ctx, a->rd, a->imm);
     }
     return true;
 }
@@ -41,7 +41,7 @@ static bool trans_lui(DisasContext *ctx, arg_lui *a)
 static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
 {
     if (a->rd !=3D 0) {
-        tcg_gen_movi_tl(cpu_gpr[a->rd], a->imm + ctx->base.pc_next);
+        gen_set_gpri(ctx, a->rd, a->imm + ctx->base.pc_next);
     }
     return true;
 }
--=20
2.31.1


