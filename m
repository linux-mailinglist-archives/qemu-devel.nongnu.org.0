Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD4A3FD150
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:27:16 +0200 (CEST)
Received: from localhost ([::1]:59694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLFy7-0006nC-L2
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFjD-0006Y1-0T
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:11:51 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:10367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFjB-0000B3-50
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:11:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462308; x=1661998308;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2WlTrVAbj0SjSClXEjBSZtxaDgYclx08zJ0DTcYqRRs=;
 b=a1CVxf7YuGpYFVM9zonXs2V8KWKkduHPWHmxR3teUYiy5lTJqTD7N26M
 1mlmG11Mx/6Ynty90vF6X6TWVFDEs2K8AmL5eEA8bP5BLk16XHJcItBzy
 9mx0tQNXTnrbhvMn3zAJk2ZJItg4PGr1rvyfoJotBuejakRJq4sl3A0YH
 rs727Nz+rlarjGN5PnFnVyhh8kuI9wZOdrWr2yE2ipCakG6Gjc4leBk9B
 Ytszs/wtdwILcPTFXieGynyONiV/CnOfGk8hgzaj13eBdk49SUvqsPtAH
 AIf3pN3e1eNdCAcS6nmymO6WML8EIMRGQ26OxKKlERWRTbHB72aLtPxrY w==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="178011714"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:11:46 +0800
IronPort-SDR: Le6oMNoDEAMiBGa3iT4fU5nUDktdfEHqwomvgLZdsTXmfNAOIbinD0aGgEkPg6R8EPXsXsVxlZ
 f77cBYMYe3YQfglS1pPi4225e56cLOWheYTN57m4TfbYyL7RUeJI+fX8siUp6GUAzAea9MpbzN
 i9qYyTNM9QFjVccWuXgsoIJIDcJ6bHtw8XHzVfkXJ1fARSVyc9Frc7f6+zkVZ+W4OS9QL7Zxht
 b6PtYsKLfIHn94iL6M7F35oyi7s5cbaSBNsrlPtJH87WlORmnv+Rty7o2Z44RPeC8yRhY3O4S+
 iis4GIKjy02r0+qxKSXiZwO4
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:48:34 -0700
IronPort-SDR: JH55q+yoQzdziZhRIQU6fkqkD99+3YBlfuhEtJz1liEiHLwxYHScnFXuDGtHPiMYe3ynCUT/sN
 /iDLrXwd9MkKORQMjbd+9Al8bZ5QWTTyMfU4P8oi7AeQwepvA+oX8P3nW12KZeRmv2mG9mwYkk
 Wo9h/KShAkhcZkTUUvCwc3QC5jhimjxek1Fr1wji/yhtyrxefDjtx7PaJDpyBdlGszDno345Hy
 AAJPozDWgo+WfuE/Ywo3wNvGg3VeoDtZHjOGTlEXTNJaNwRqQPv7rG6u9oLpUknuCBUVCM1LW2
 pw8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:11:46 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4GzncL35dBz1RvlX
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:11:46 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630462305; x=1633054306; bh=2WlTrVAbj0SjSClXEj
 BSZtxaDgYclx08zJ0DTcYqRRs=; b=ZVyiEpmrCSX8W4+kUY+a7joTncbck8nOIP
 PPIH6l/GyTz5ZdMJIJYd6OsJfDuy2mO6BBDxf3hABkC1hnk91+X7NNdgArjOJKOq
 CAUinijSfgIbobXkg+6QWJAId92DtLpixeMmBtHYxkXO36gNP8gasNYYKF3vRQw4
 BfXB1IBQ8TtMj0CEaPIp1SmY6l15ta8ZOojTTnMzSYMna0fYv3DrBFCe/L4tKJ1K
 PINKH52tO5x3VD25ypbwBUGkzrkoYGapHd5ksHaV/EYS95ilDlXvSibhuQBZ7RxJ
 /l7JVgEYNaPtbkip00uRTe8pN03DP6F46m1aKVSXdQZVNaqcCxjA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id viR1YHHWncoa for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:11:45 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4GzncF19yRz1Rvl9;
 Tue, 31 Aug 2021 19:11:40 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 17/33] target/riscv: Use gen_arith for mulh and mulhu
Date: Wed,  1 Sep 2021 12:09:42 +1000
Message-Id: <20210901020958.458454-18-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=871df42ed=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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

Split out gen_mulh and gen_mulhu and use the common helper.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210823195529.560295-9-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvm.c.inc | 40 +++++++++++--------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_=
trans/trans_rvm.c.inc
index 3d93b24c25..80552be7a3 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -25,20 +25,18 @@ static bool trans_mul(DisasContext *ctx, arg_mul *a)
     return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl);
 }
=20
-static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
+static void gen_mulh(TCGv ret, TCGv s1, TCGv s2)
 {
-    REQUIRE_EXT(ctx, RVM);
-    TCGv source1 =3D tcg_temp_new();
-    TCGv source2 =3D tcg_temp_new();
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
+    TCGv discard =3D tcg_temp_new();
=20
-    tcg_gen_muls2_tl(source2, source1, source1, source2);
+    tcg_gen_muls2_tl(discard, ret, s1, s2);
+    tcg_temp_free(discard);
+}
=20
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
+static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
+{
+    REQUIRE_EXT(ctx, RVM);
+    return gen_arith(ctx, a, EXT_NONE, gen_mulh);
 }
=20
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
@@ -47,20 +45,18 @@ static bool trans_mulhsu(DisasContext *ctx, arg_mulhs=
u *a)
     return gen_arith(ctx, a, EXT_NONE, gen_mulhsu);
 }
=20
-static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
+static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
 {
-    REQUIRE_EXT(ctx, RVM);
-    TCGv source1 =3D tcg_temp_new();
-    TCGv source2 =3D tcg_temp_new();
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
+    TCGv discard =3D tcg_temp_new();
=20
-    tcg_gen_mulu2_tl(source2, source1, source1, source2);
+    tcg_gen_mulu2_tl(discard, ret, s1, s2);
+    tcg_temp_free(discard);
+}
=20
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
+static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
+{
+    REQUIRE_EXT(ctx, RVM);
+    return gen_arith(ctx, a, EXT_NONE, gen_mulhu);
 }
=20
 static bool trans_div(DisasContext *ctx, arg_div *a)
--=20
2.31.1


