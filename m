Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788AD3FD153
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:28:56 +0200 (CEST)
Received: from localhost ([::1]:37644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLFzj-0002YL-Gt
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFjN-0006qr-AT
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:12:01 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:25392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFjK-0000Jx-Lg
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:12:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462318; x=1661998318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TWt63/u8YF6okTanwbatY3CCNWHmbgABvqGooWU9INQ=;
 b=le6ODp49WEmedClJdFqU/Wjkxppb3Pesv9NaG8v2lnLOr0VikibY76mJ
 y1QGcalo/umTASZGDzaJiIMllXoL9ibqeUUiTuK6ckqQvZySn1eF5GwjS
 yil8LZQT2SRo9TwC1gEx0qAoPM9IbGnWgHFpQG9GfbdrWjfMZYVGLBExa
 uaXRmJr0tUUrq+Bg9jKzaQ11WCbaCXF+fenbOJ5McYByMm2Lqg24DNjJ4
 rX2xWcY9Ces2LsKdX8tJuouHMbKGfFR1eT7peLqT27b2zXvqxfnpXImLi
 eh1WjNiu/oaz0OTQj2rds/4IjVwd7QwVgX6MhVWfwCUwykVyO9cOS2C+i Q==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="282698125"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:11:57 +0800
IronPort-SDR: dqRGrzdkwx4fqpKo/kQJ+VfyMEJM4Rub5NFnbQxjNHVQeOhEbKdGltZqGiIjMB44xxeQTR5T0n
 ovPZJ3b7g5aeD6xOTgLHnI5w/yW5EOcHKBwSinB221UEMWAGqaMny5ZcANveNJRuO67biFT0c9
 /EtY+7q5GnCRX1pKFB5wIl7Jv8mntdNtE+UKkMU35tuY9Tdwc2aa1KMH+Y/Pr5RzeZGeEAMPdp
 qCtniuf6v2ZilRic4+OyKcwRISOyzQAsy0RXuMa2qhj/8rQcSt9R4E1ZjSuLlGQL6AFiqL+Je3
 r6IcsvoWcYgavkXYYKF/mV8g
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:47:03 -0700
IronPort-SDR: u1Az2D/89CVFp9gt8q8NcX61qvdboshKC6AEw/MVN1A+uQAJ7wGaQSqfMozuFrqzJY5Fz4L4nK
 HLimDJ7CEQu6xd5WAQKDr0VIxB5GmxyW+suDl0K/nTKBBFM154tTsfrsJlWaaAzsrLFDYKucst
 Uy26OpFWqsh3a1hChdZiXu6DY6OS5tp2Sk0gPVg+6CRFA9AV9hAPCxzSYOxzdYHyj11rTxz1D+
 qzGt9PnQdfa5lywgysIrQthNE8d6m6RNCJH9bI/pfY7svrnLIhIZNpHxut44FSv3+JUzSOGJ+6
 O08=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:11:57 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4GzncY2DDlz1RvmD
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:11:57 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1630462311; x=1633054312; bh=TWt63/u
 8YF6okTanwbatY3CCNWHmbgABvqGooWU9INQ=; b=EtP0CAyZ0ZqZRsi77NR1ovc
 7yynTmVPU0J5rpe/A5EWbjTmSuu/nu18i2Ug45r++ODdzg+CuWSpwiDSNs/oHXfm
 L39V9Dx+cYB5RXZAPznivPvI5taKreAORYuZJFNykYQcqWSA8uU4zXefVaXG/cpW
 qrI4fP1tXkLJEHpsnha0VXGxeUm19jeu1CCP1ynynnv+XHltjQx9jmy0TgfTYqzT
 vTZyCYDlS1tCuQhv9pq1mJkOaTiT1WQtAGCbHynMbhAeYHJP15yH7jNB9jo9tSPE
 nLCL/Owx82dIMNdanY7ujtsGMgNuRx7eER/A4kn7d//JA65q5iigqHwmZQ/sPzw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id lWNglolrzean for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:11:51 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4GzncL6Ptbz1Rvl9;
 Tue, 31 Aug 2021 19:11:46 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 18/33] target/riscv: Move gen_* helpers for RVM
Date: Wed,  1 Sep 2021 12:09:43 +1000
Message-Id: <20210901020958.458454-19-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=871df42ed=alistair.francis@opensource.wdc.com;
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

Move these helpers near their use by the trans_*
functions within insn_trans/trans_rvm.c.inc.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210823195529.560295-10-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c                | 127 ------------------------
 target/riscv/insn_trans/trans_rvm.c.inc | 127 ++++++++++++++++++++++++
 2 files changed, 127 insertions(+), 127 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 1855eacbac..7fbacfa6ee 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -249,133 +249,6 @@ static void gen_set_gpr(DisasContext *ctx, int reg_=
num, TCGv t)
     }
 }
=20
-static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    TCGv rl =3D tcg_temp_new();
-    TCGv rh =3D tcg_temp_new();
-
-    tcg_gen_mulu2_tl(rl, rh, arg1, arg2);
-    /* fix up for one negative */
-    tcg_gen_sari_tl(rl, arg1, TARGET_LONG_BITS - 1);
-    tcg_gen_and_tl(rl, rl, arg2);
-    tcg_gen_sub_tl(ret, rh, rl);
-
-    tcg_temp_free(rl);
-    tcg_temp_free(rh);
-}
-
-static void gen_div(TCGv ret, TCGv source1, TCGv source2)
-{
-    TCGv temp1, temp2, zero, one, mone, min;
-
-    temp1 =3D tcg_temp_new();
-    temp2 =3D tcg_temp_new();
-    zero =3D tcg_constant_tl(0);
-    one =3D tcg_constant_tl(1);
-    mone =3D tcg_constant_tl(-1);
-    min =3D tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
-
-    /*
-     * If overflow, set temp2 to 1, else source2.
-     * This produces the required result of min.
-     */
-    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
-    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
-    tcg_gen_and_tl(temp1, temp1, temp2);
-    tcg_gen_movcond_tl(TCG_COND_NE, temp2, temp1, zero, one, source2);
-
-    /*
-     * If div by zero, set temp1 to -1 and temp2 to 1 to
-     * produce the required result of -1.
-     */
-    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, mone, source1)=
;
-    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, temp2);
-
-    tcg_gen_div_tl(ret, temp1, temp2);
-
-    tcg_temp_free(temp1);
-    tcg_temp_free(temp2);
-}
-
-static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
-{
-    TCGv temp1, temp2, zero, one, max;
-
-    temp1 =3D tcg_temp_new();
-    temp2 =3D tcg_temp_new();
-    zero =3D tcg_constant_tl(0);
-    one =3D tcg_constant_tl(1);
-    max =3D tcg_constant_tl(~0);
-
-    /*
-     * If div by zero, set temp1 to max and temp2 to 1 to
-     * produce the required result of max.
-     */
-    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, max, source1);
-    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
-    tcg_gen_divu_tl(ret, temp1, temp2);
-
-    tcg_temp_free(temp1);
-    tcg_temp_free(temp2);
-}
-
-static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
-{
-    TCGv temp1, temp2, zero, one, mone, min;
-
-    temp1 =3D tcg_temp_new();
-    temp2 =3D tcg_temp_new();
-    zero =3D tcg_constant_tl(0);
-    one =3D tcg_constant_tl(1);
-    mone =3D tcg_constant_tl(-1);
-    min =3D tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
-
-    /*
-     * If overflow, set temp1 to 0, else source1.
-     * This avoids a possible host trap, and produces the required resul=
t of 0.
-     */
-    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
-    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
-    tcg_gen_and_tl(temp1, temp1, temp2);
-    tcg_gen_movcond_tl(TCG_COND_NE, temp1, temp1, zero, zero, source1);
-
-    /*
-     * If div by zero, set temp2 to 1, else source2.
-     * This avoids a possible host trap, but produces an incorrect resul=
t.
-     */
-    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
-
-    tcg_gen_rem_tl(temp1, temp1, temp2);
-
-    /* If div by zero, the required result is the original dividend. */
-    tcg_gen_movcond_tl(TCG_COND_EQ, ret, source2, zero, source1, temp1);
-
-    tcg_temp_free(temp1);
-    tcg_temp_free(temp2);
-}
-
-static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
-{
-    TCGv temp, zero, one;
-
-    temp =3D tcg_temp_new();
-    zero =3D tcg_constant_tl(0);
-    one =3D tcg_constant_tl(1);
-
-    /*
-     * If div by zero, set temp to 1, else source2.
-     * This avoids a possible host trap, but produces an incorrect resul=
t.
-     */
-    tcg_gen_movcond_tl(TCG_COND_EQ, temp, source2, zero, one, source2);
-
-    tcg_gen_remu_tl(temp, source1, temp);
-
-    /* If div by zero, the required result is the original dividend. */
-    tcg_gen_movcond_tl(TCG_COND_EQ, ret, source2, zero, source1, temp);
-
-    tcg_temp_free(temp);
-}
-
 static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 {
     target_ulong next_pc;
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_=
trans/trans_rvm.c.inc
index 80552be7a3..b89a85ad3a 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -39,6 +39,21 @@ static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
     return gen_arith(ctx, a, EXT_NONE, gen_mulh);
 }
=20
+static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv rl =3D tcg_temp_new();
+    TCGv rh =3D tcg_temp_new();
+
+    tcg_gen_mulu2_tl(rl, rh, arg1, arg2);
+    /* fix up for one negative */
+    tcg_gen_sari_tl(rl, arg1, TARGET_LONG_BITS - 1);
+    tcg_gen_and_tl(rl, rl, arg2);
+    tcg_gen_sub_tl(ret, rh, rl);
+
+    tcg_temp_free(rl);
+    tcg_temp_free(rh);
+}
+
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 {
     REQUIRE_EXT(ctx, RVM);
@@ -59,24 +74,136 @@ static bool trans_mulhu(DisasContext *ctx, arg_mulhu=
 *a)
     return gen_arith(ctx, a, EXT_NONE, gen_mulhu);
 }
=20
+static void gen_div(TCGv ret, TCGv source1, TCGv source2)
+{
+    TCGv temp1, temp2, zero, one, mone, min;
+
+    temp1 =3D tcg_temp_new();
+    temp2 =3D tcg_temp_new();
+    zero =3D tcg_constant_tl(0);
+    one =3D tcg_constant_tl(1);
+    mone =3D tcg_constant_tl(-1);
+    min =3D tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
+
+    /*
+     * If overflow, set temp2 to 1, else source2.
+     * This produces the required result of min.
+     */
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
+    tcg_gen_and_tl(temp1, temp1, temp2);
+    tcg_gen_movcond_tl(TCG_COND_NE, temp2, temp1, zero, one, source2);
+
+    /*
+     * If div by zero, set temp1 to -1 and temp2 to 1 to
+     * produce the required result of -1.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, mone, source1)=
;
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, temp2);
+
+    tcg_gen_div_tl(ret, temp1, temp2);
+
+    tcg_temp_free(temp1);
+    tcg_temp_free(temp2);
+}
+
 static bool trans_div(DisasContext *ctx, arg_div *a)
 {
     REQUIRE_EXT(ctx, RVM);
     return gen_arith(ctx, a, EXT_SIGN, gen_div);
 }
=20
+static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
+{
+    TCGv temp1, temp2, zero, one, max;
+
+    temp1 =3D tcg_temp_new();
+    temp2 =3D tcg_temp_new();
+    zero =3D tcg_constant_tl(0);
+    one =3D tcg_constant_tl(1);
+    max =3D tcg_constant_tl(~0);
+
+    /*
+     * If div by zero, set temp1 to max and temp2 to 1 to
+     * produce the required result of max.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, max, source1);
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
+    tcg_gen_divu_tl(ret, temp1, temp2);
+
+    tcg_temp_free(temp1);
+    tcg_temp_free(temp2);
+}
+
 static bool trans_divu(DisasContext *ctx, arg_divu *a)
 {
     REQUIRE_EXT(ctx, RVM);
     return gen_arith(ctx, a, EXT_ZERO, gen_divu);
 }
=20
+static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
+{
+    TCGv temp1, temp2, zero, one, mone, min;
+
+    temp1 =3D tcg_temp_new();
+    temp2 =3D tcg_temp_new();
+    zero =3D tcg_constant_tl(0);
+    one =3D tcg_constant_tl(1);
+    mone =3D tcg_constant_tl(-1);
+    min =3D tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
+
+    /*
+     * If overflow, set temp1 to 0, else source1.
+     * This avoids a possible host trap, and produces the required resul=
t of 0.
+     */
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
+    tcg_gen_and_tl(temp1, temp1, temp2);
+    tcg_gen_movcond_tl(TCG_COND_NE, temp1, temp1, zero, zero, source1);
+
+    /*
+     * If div by zero, set temp2 to 1, else source2.
+     * This avoids a possible host trap, but produces an incorrect resul=
t.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
+
+    tcg_gen_rem_tl(temp1, temp1, temp2);
+
+    /* If div by zero, the required result is the original dividend. */
+    tcg_gen_movcond_tl(TCG_COND_EQ, ret, source2, zero, source1, temp1);
+
+    tcg_temp_free(temp1);
+    tcg_temp_free(temp2);
+}
+
 static bool trans_rem(DisasContext *ctx, arg_rem *a)
 {
     REQUIRE_EXT(ctx, RVM);
     return gen_arith(ctx, a, EXT_SIGN, gen_rem);
 }
=20
+static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
+{
+    TCGv temp, zero, one;
+
+    temp =3D tcg_temp_new();
+    zero =3D tcg_constant_tl(0);
+    one =3D tcg_constant_tl(1);
+
+    /*
+     * If div by zero, set temp to 1, else source2.
+     * This avoids a possible host trap, but produces an incorrect resul=
t.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp, source2, zero, one, source2);
+
+    tcg_gen_remu_tl(temp, source1, temp);
+
+    /* If div by zero, the required result is the original dividend. */
+    tcg_gen_movcond_tl(TCG_COND_EQ, ret, source2, zero, source1, temp);
+
+    tcg_temp_free(temp);
+}
+
 static bool trans_remu(DisasContext *ctx, arg_remu *a)
 {
     REQUIRE_EXT(ctx, RVM);
--=20
2.31.1


