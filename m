Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D20EA3FD161
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:34:46 +0200 (CEST)
Received: from localhost ([::1]:47704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLG5N-0000v0-RQ
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFjW-0007BT-W9
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:12:11 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:3957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFjV-0000Nj-7N
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:12:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462328; x=1661998328;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UMvGT5HI8BBn/237WKoZV8oOW1OIUkNTSIPt6o4+VoU=;
 b=Rvrjw+7dz8JLB5r92sfhYRn8iR7515mm2Z9JU40Bb7tUzZd6IZdq0awa
 TIE+kkHOxGISNJOOd5j8iGVpB16pitDPdkEx1y3CDsdhAej77l+MKwl/I
 /JxChZKRaFM5u8amJlKDE/DRUG6Kom8UvaHCbxju7Ez6PfPEGSeoKhGkm
 loedF/79ljJnGFPFahHQeCTKn8mNAcR9wJuGMYVQLr52vYKJa8cNwh+kI
 4aW27jD6PkXtwFzTTNX1I7OFTcjpl9Vm3+35tnlhrXw4jO77AwqhhaHoi
 X92PwqMd6HeTGlAswSoQsE2r15iT97+e17hX5MFQySxn7i3o1yrT3lG3E A==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="178910822"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:12:07 +0800
IronPort-SDR: FjgXXMt719MGtb2hR3bjsxrlABakuy+Z6kyMCbfcpxRfOmTRBo+uQkTxL9SVCv+rMdHJhG4zsS
 8obVWnYK0ImMGg8On5nxIlDnU1Y5eBoSQO5xre9TCTtkWKVytPr2opwaAZWlz2+nzVkVrODMtP
 YYpXi0LF+A+q9Xbp/ou6LdR/uMXqUo1+oBRatu6eBXctJ3D1yZrLnblcFwU115cKxKHAaYIj9z
 8NgtptgP2WLlyo+NdXu8Fy7RG8ep/toak1k5eIbshlsYzMWyg7PBhUDZykUew1YBMc2CnSVW6x
 FbPEyNwB/ngcNFWADUDcVNlG
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:47:14 -0700
IronPort-SDR: pNmztnX5yVrnzNWk+sGoNyfZVZnvOr+FV2BiWX0Gt+8TfFrj/ZGe2/AMQTpYCXHIqvmiwvvPYz
 Iwv82FDbWR4bwErYVGOYIPQ3J8OapDI85cgWwhbFWfTZY2KTi62ORZYYm0/CJyycjDWwMCsBpW
 ecfFNgthSxGVzRLmNmf+geNg/ZAPj4lrebrMlNdU8fFMyU7MjTnetuiUlaW6G8ZUHssJxMqBVj
 8hLZq+TYuZVxZHS7ZJ7NhxtyUbDCewxXOu5je5aSN5zS3U99smAQ9vEWJCxWsm6Pnp0sZzEueq
 MQY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:12:08 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Gzncm12Wbz1RvmF
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:12:08 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630462322; x=1633054323; bh=UMvGT5HI8BBn/237WK
 oZV8oOW1OIUkNTSIPt6o4+VoU=; b=IDrs7uNHSqs/79aZZBAoToY5jLTfUm/RfZ
 pI99+bNRieV0rSbSFb6itV3VtsEotTP2sJLP1ysdyPNqtkffv7VV0SixvaPPjZAS
 wWXvzs9g9OLDTdywtov9Tjws1NfYAt5B9lZH2P4/4x1bbifuUMLC8DKTIih83U+V
 jolpzVkGZm4A84TssOUu5QLfdZczPlZ8a2ZQ00mLMNpu4ZnRrBoNqT5JiDNAoWED
 Kp4eVrynnv3npV0mwg1h/Nnau06nG1tpBLcCCa4au5ufvwt2TXqja/k8EGfpwDWX
 iVYh+3hyxR721HGezjjGOSRxRRIU2LXxJ+RRWavEv7iqJGO0HiQQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ZWwDPAR9b4TN for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:12:02 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Gzncb1Z8Sz1RvlX;
 Tue, 31 Aug 2021 19:11:58 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 20/33] target/riscv: Add DisasExtend to gen_unary
Date: Wed,  1 Sep 2021 12:09:45 +1000
Message-Id: <20210901020958.458454-21-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=871df42ed=alistair.francis@opensource.wdc.com;
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

Use ctx->w for ctpopw, which is the only one that can
re-use the generic algorithm for the narrow operation.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210823195529.560295-12-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c                | 14 ++++++--------
 target/riscv/insn_trans/trans_rvb.c.inc | 24 +++++++++---------------
 2 files changed, 15 insertions(+), 23 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 09853530c4..785e9e58cc 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -478,17 +478,15 @@ static bool gen_shiftiw(DisasContext *ctx, arg_shif=
t *a,
     return true;
 }
=20
-static bool gen_unary(DisasContext *ctx, arg_r2 *a,
-                      void(*func)(TCGv, TCGv))
+static bool gen_unary(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
+                      void (*func)(TCGv, TCGv))
 {
-    TCGv source =3D tcg_temp_new();
-
-    gen_get_gpr(ctx, source, a->rs1);
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv src1 =3D get_gpr(ctx, a->rs1, ext);
=20
-    (*func)(source, source);
+    func(dest, src1);
=20
-    gen_set_gpr(ctx, a->rd, source);
-    tcg_temp_free(source);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
=20
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index 73f088be23..e255678fff 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -26,7 +26,7 @@ static void gen_clz(TCGv ret, TCGv arg1)
 static bool trans_clz(DisasContext *ctx, arg_clz *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, gen_clz);
+    return gen_unary(ctx, a, EXT_ZERO, gen_clz);
 }
=20
 static void gen_ctz(TCGv ret, TCGv arg1)
@@ -37,13 +37,13 @@ static void gen_ctz(TCGv ret, TCGv arg1)
 static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, gen_ctz);
+    return gen_unary(ctx, a, EXT_ZERO, gen_ctz);
 }
=20
 static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, tcg_gen_ctpop_tl);
+    return gen_unary(ctx, a, EXT_ZERO, tcg_gen_ctpop_tl);
 }
=20
 static bool trans_andn(DisasContext *ctx, arg_andn *a)
@@ -132,13 +132,13 @@ static bool trans_maxu(DisasContext *ctx, arg_maxu =
*a)
 static bool trans_sext_b(DisasContext *ctx, arg_sext_b *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, tcg_gen_ext8s_tl);
+    return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext8s_tl);
 }
=20
 static bool trans_sext_h(DisasContext *ctx, arg_sext_h *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, tcg_gen_ext16s_tl);
+    return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext16s_tl);
 }
=20
 static void gen_sbop_mask(TCGv ret, TCGv shamt)
@@ -366,7 +366,6 @@ GEN_TRANS_SHADD(3)
=20
 static void gen_clzw(TCGv ret, TCGv arg1)
 {
-    tcg_gen_ext32u_tl(ret, arg1);
     tcg_gen_clzi_tl(ret, ret, 64);
     tcg_gen_subi_tl(ret, ret, 32);
 }
@@ -375,7 +374,7 @@ static bool trans_clzw(DisasContext *ctx, arg_clzw *a=
)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, gen_clzw);
+    return gen_unary(ctx, a, EXT_ZERO, gen_clzw);
 }
=20
 static void gen_ctzw(TCGv ret, TCGv arg1)
@@ -388,20 +387,15 @@ static bool trans_ctzw(DisasContext *ctx, arg_ctzw =
*a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, gen_ctzw);
-}
-
-static void gen_cpopw(TCGv ret, TCGv arg1)
-{
-    tcg_gen_ext32u_tl(arg1, arg1);
-    tcg_gen_ctpop_tl(ret, arg1);
+    return gen_unary(ctx, a, EXT_NONE, gen_ctzw);
 }
=20
 static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, gen_cpopw);
+    ctx->w =3D true;
+    return gen_unary(ctx, a, EXT_ZERO, tcg_gen_ctpop_tl);
 }
=20
 static void gen_packw(TCGv ret, TCGv arg1, TCGv arg2)
--=20
2.31.1


