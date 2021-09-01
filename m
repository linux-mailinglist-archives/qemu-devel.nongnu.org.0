Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAC53FD149
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:24:25 +0200 (CEST)
Received: from localhost ([::1]:51240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLFvM-0001A2-IV
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFjA-0006RA-SD
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:11:48 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:10367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFj9-0000B3-6R
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:11:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462307; x=1661998307;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=25RoiPJRUM8/nB8GGzlGW2EvzjClmiFmjR4KFnO3OfM=;
 b=HAPzo3G+UfJIayAgfu2jbY0azR5tXMhW6SsIN15kc0h7p3HLZCUxpY2X
 JgDR+CkG8p3cmvVfBMKzEu9rAA/VV2gXfOR1udgxAjFcbxHOwfiz6KwsI
 baCjffqcnewrxB/Qy8bhdVIYzJJyKKs8EnotaESm9jxYxryY1Q1X6Rfqq
 GKc9Q5wgHAcejofNVtaiO/YEKqZ1BMetLRH9UPzOobzJ6CHmX44lEyYqE
 BHZ46w6Wqp85joPaPLWqZLRGRUhu9ms5dTJFO0aybnr4ZEdFz8SLUK7US
 CrcZ6AtOMtJlHVUUJN6qk0xomLRfKq6msQBJOWtleA/r2TCEUSkfnyIkn g==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="178011713"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:11:45 +0800
IronPort-SDR: geREhs+aVlttSkI33DXGr30Wc7+GZT5JHAkmoRuTKQO0uDqSf7mfj/IBCDGag5aHCjVlZ3AJnv
 vDc84cSGQ3LUeyxRXQs/GBVenPRQiBJgkoNTsS9eLrK10BT0NgEdwz5dS+fykobBx09+ccRUft
 NYrBVxXptSj9te4CQoBPtC4U7jyKBpTbd79CM0LvopQeVFOVne82/cQOwVYLys17SpAWib/jYP
 /lUkvH+P+cVSsyU4GwoFB3hpg5twp0eNGP6FJ4TccAlPNOVgw4U5MbPGgJ605HNb4OyKtw2ty0
 0xvc0ZMxfMiQWgCb32N+WBPO
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:48:34 -0700
IronPort-SDR: Qsdar5e3JqPoiHaJiDk8WlXPbDl+d1fHQh+93RqRu7Kvnsh8ztMCGrxduNcvhOIJvnDkavv07l
 ScxMv7YW5fFgpYq5bFHfWTk8lXtVqUWmAGG6TjI2MWrfJ32JMAEIlY7FSfedOeWAG8KS0vAq19
 7Wmle1jcrbm4RdFJ3QUciMrSKMDlE/vWg8JaMUYc1BOTBgzbSahYddaNDQWjPF6iwHZIKxiobl
 ovu69+5SQl4wv0bOC9RCNM8q5w5Vxv2sa1VXd2a7MywBe3OMgpwGBpZCvqkWuQwl0TSIvuzfgX
 c90=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:11:46 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4GzncK4MwXz1RvlZ
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:11:45 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630462300; x=1633054301; bh=25RoiPJRUM8/nB8GGz
 lGW2EvzjClmiFmjR4KFnO3OfM=; b=Qdee+w3yF0NnQ1/YXYvFa+tYr5DVc+PcPo
 4ENUkD3ePNUYWoBYV1VY4pasBEOCpHD7SeA4xqwfajvowZJS1zjL5z5mSAeulCBM
 EvadoQYFroBXv0YykmH1Pgz4jGhmhWeoWzDaE/kZHSBkcBdheoFrHoQIy47MOo4i
 U9AtBvCzzjqU4Y76+4yZKpOvfz6N0e8q4e5Qpjv44CSdeS1Zb+9t1yk/CpgvfDZ5
 XaHaRTWibdLVF/XxqNrtDWC/V++09czNVrjpBqYnoBoJDi87LAzx04RzeARI/Ts0
 TGNpvwVzhqszDTdeKpG3FL+BdX0wp4KXkgosq5aQVhvOf4hev0rQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id VAismJe6l7nb for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:11:40 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Gznc828JFz1Rvm1;
 Tue, 31 Aug 2021 19:11:35 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 16/33] target/riscv: Remove gen_arith_div*
Date: Wed,  1 Sep 2021 12:09:41 +1000
Message-Id: <20210901020958.458454-17-alistair.francis@opensource.wdc.com>
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

Use ctx->w and the enhanced gen_arith function.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210823195529.560295-8-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c                | 42 -------------------------
 target/riscv/insn_trans/trans_rvm.c.inc | 16 +++++-----
 2 files changed, 8 insertions(+), 50 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 7dd2839288..1855eacbac 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -507,48 +507,6 @@ static bool gen_arith_imm_tl(DisasContext *ctx, arg_=
i *a, DisasExtend ext,
     return true;
 }
=20
-static bool gen_arith_div_w(DisasContext *ctx, arg_r *a,
-                            void(*func)(TCGv, TCGv, TCGv))
-{
-    TCGv source1, source2;
-    source1 =3D tcg_temp_new();
-    source2 =3D tcg_temp_new();
-
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
-    tcg_gen_ext32s_tl(source1, source1);
-    tcg_gen_ext32s_tl(source2, source2);
-
-    (*func)(source1, source1, source2);
-
-    tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
-}
-
-static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
-                            void(*func)(TCGv, TCGv, TCGv))
-{
-    TCGv source1, source2;
-    source1 =3D tcg_temp_new();
-    source2 =3D tcg_temp_new();
-
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
-    tcg_gen_ext32u_tl(source1, source1);
-    tcg_gen_ext32u_tl(source2, source2);
-
-    (*func)(source1, source1, source2);
-
-    tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
-}
-
 static void gen_pack(TCGv ret, TCGv arg1, TCGv arg2)
 {
     tcg_gen_deposit_tl(ret, arg1, arg2,
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_=
trans/trans_rvm.c.inc
index 013b3f7009..3d93b24c25 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -99,30 +99,30 @@ static bool trans_divw(DisasContext *ctx, arg_divw *a=
)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
-
-    return gen_arith_div_w(ctx, a, &gen_div);
+    ctx->w =3D true;
+    return gen_arith(ctx, a, EXT_SIGN, gen_div);
 }
=20
 static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
-
-    return gen_arith_div_uw(ctx, a, &gen_divu);
+    ctx->w =3D true;
+    return gen_arith(ctx, a, EXT_ZERO, gen_divu);
 }
=20
 static bool trans_remw(DisasContext *ctx, arg_remw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
-
-    return gen_arith_div_w(ctx, a, &gen_rem);
+    ctx->w =3D true;
+    return gen_arith(ctx, a, EXT_SIGN, gen_rem);
 }
=20
 static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
-
-    return gen_arith_div_uw(ctx, a, &gen_remu);
+    ctx->w =3D true;
+    return gen_arith(ctx, a, EXT_ZERO, gen_remu);
 }
--=20
2.31.1


