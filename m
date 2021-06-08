Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6822839EAF3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:46:13 +0200 (CEST)
Received: from localhost ([::1]:59152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPsi-0002t3-FL
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:46:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPeZ-0002GL-4N
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:31:35 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPeX-0004Zo-3L
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:31:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112292; x=1654648292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/COe4yaQinmh04fbi+Fec/YZFHtRSoOmiTUUR/1ExDE=;
 b=Eg8grG9v0vnwBEqwGx+iXI5O/6LA/1T9vwK51oYa6aPf33NaB2vdZq+q
 fRR1Pp+ZfmA3Ufkux5KDu+q+TOI0YK+s3w3/RmQ1OClCj9/cyvqDHG8Jo
 I+0YAgQ/Vr7U4LV1cAZRV47STaEPj9UW5RutH9cOmuqW2ouZ6pGnY8Wm0
 312cpvtH6MGz0PKi6K4gKg82HkTN3PZGGUvFJprBtDmyeryQPVJ1P8+nD
 18OS2e2zGX3dkUTyonJaAPxdG/5uCx29jF4549IHg7SEPkYl5TNNSSTCk
 h10Rrpidb5cEJN7HrZIpbO8siDKNR7ROA+VGHoBcxIv/wVvRj1zuapzNs A==;
IronPort-SDR: jS6a6wBca80Aiqb13ULIIhWy87gAB4DAJojlJ7A8GeLrOIXfv9O+St+8zjMbaZbn+BiHbg1U5b
 xwHgBOcTu0ebuon4MOOAxsj9pi6hR4GpxwAdqUS+i2HnUElFrA5U45EsLIbVI5EZAqNFEg6zgE
 +WvIuk1xEQkzX0xtijQSCZ3mk1M7dKwShaHjfYYVBmPSsKOul3JFHqSSt1aAlt8VEXZblZlMIH
 tYSCQiiBXCe56oT/wHJ+uYDxnE3cu+NpLOCWqr2zmg33gvOT1rA8/5qjuZlG9xebFYaawF8M3m
 IQ0=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087418"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:31:18 +0800
IronPort-SDR: XgqMraUG7gLoINOyyZseWWtxhnIoX6QnE6YZDqR08XVRODV2hAEyFAP1PYXgv4bVGKvMfxKJmj
 pqqzoI11vMHywAbIv+xLfUkaXrTPaL6sxjcnRViu/bYyjiqvk2xg7huWvEnuNa5IGSewrOi6r5
 H1V5/YONran9HInCIcyUjOXo3dGXEz1vbeuBkR9m7N3jOoAMTR0ED6Bn0EhE1Q4xwYQc7A+p+s
 +j1BYtBVHp3/lFwIfmET7q9+ozyT4o7smeaYGqeWzPucKMa4oXHIHNfnuS4rddrwlB7bNU6ieB
 vFUxFsfQ3RLPROfZkguFHOQA
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:10:24 -0700
IronPort-SDR: t4BjmSCl+0umC4jL+eRAGdxpWoFHybg1/eKNYWlQmlsgJxKSQlJphko8AQYUzl30Hsgx29U6/C
 AGCxw0R+HyNFAOu0OtCtoPuUjGmgtCrM5py+n9GWMLuHw0GQv1JmjeeauBkl4N7b0CveE0PLrY
 7iXa3CQpk1jT9oFt5Atvk1SdVCW00ZUXx3KVGkCybrXijijCZgdncYg1lFQLKo0NBcI9eceJoT
 3X8U8SDNPnpw/ezUEaCY8+8W9mHgM8CbKQR+PjLruPoRw3HVU8+19qnklY0Co5Et3O+jYvx/f7
 t9E=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:31:15 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 20/32] target/riscv: rvb: pack two words into one register
Date: Tue,  8 Jun 2021 10:29:35 +1000
Message-Id: <20210608002947.1649775-21-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608002947.1649775-1-alistair.francis@wdc.com>
References: <20210608002947.1649775-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7863c9c60=alistair.francis@wdc.com;
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
Cc: Frank Chang <frank.chang@sifive.com>, alistair23@gmail.com,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210505160620.15723-6-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  6 ++++
 target/riscv/translate.c                | 40 +++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvb.c.inc | 32 ++++++++++++++++++++
 3 files changed, 78 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index a4d95ea621..9b2fd4b6fe 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -666,8 +666,14 @@ cpop       011000 000010 ..... 001 ..... 0010011 @r2
 andn       0100000 .......... 111 ..... 0110011 @r
 orn        0100000 .......... 110 ..... 0110011 @r
 xnor       0100000 .......... 100 ..... 0110011 @r
+pack       0000100 .......... 100 ..... 0110011 @r
+packu      0100100 .......... 100 ..... 0110011 @r
+packh      0000100 .......... 111 ..... 0110011 @r
 
 # *** RV64B Standard Extension (in addition to RV32B) ***
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
 ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
 cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
+
+packw      0000100 .......... 100 ..... 0111011 @r
+packuw     0100100 .......... 100 ..... 0111011 @r
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index c1a30c2172..5f1a3c694f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -548,6 +548,29 @@ static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
     return true;
 }
 
+static void gen_pack(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_deposit_tl(ret, arg1, arg2,
+                       TARGET_LONG_BITS / 2,
+                       TARGET_LONG_BITS / 2);
+}
+
+static void gen_packu(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_shri_tl(t, arg1, TARGET_LONG_BITS / 2);
+    tcg_gen_deposit_tl(ret, arg2, t, 0, TARGET_LONG_BITS / 2);
+    tcg_temp_free(t);
+}
+
+static void gen_packh(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_ext8u_tl(t, arg2);
+    tcg_gen_deposit_tl(ret, arg1, t, 8, TARGET_LONG_BITS - 8);
+    tcg_temp_free(t);
+}
+
 static void gen_ctzw(TCGv ret, TCGv arg1)
 {
     tcg_gen_ori_tl(ret, arg1, (target_ulong)MAKE_64BIT_MASK(32, 32));
@@ -567,6 +590,23 @@ static void gen_cpopw(TCGv ret, TCGv arg1)
     tcg_gen_ctpop_tl(ret, arg1);
 }
 
+static void gen_packw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_ext16s_tl(t, arg2);
+    tcg_gen_deposit_tl(ret, arg1, t, 16, 48);
+    tcg_temp_free(t);
+}
+
+static void gen_packuw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_shri_tl(t, arg1, 16);
+    tcg_gen_deposit_tl(ret, arg2, t, 0, 16);
+    tcg_gen_ext32s_tl(ret, ret);
+    tcg_temp_free(t);
+}
+
 static bool gen_arith(DisasContext *ctx, arg_r *a,
                       void(*func)(TCGv, TCGv, TCGv))
 {
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index b8676785c6..770205f96f 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -53,6 +53,24 @@ static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
     return gen_arith(ctx, a, tcg_gen_eqv_tl);
 }
 
+static bool trans_pack(DisasContext *ctx, arg_pack *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, gen_pack);
+}
+
+static bool trans_packu(DisasContext *ctx, arg_packu *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, gen_packu);
+}
+
+static bool trans_packh(DisasContext *ctx, arg_packh *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, gen_packh);
+}
+
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -73,3 +91,17 @@ static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
     REQUIRE_EXT(ctx, RVB);
     return gen_unary(ctx, a, gen_cpopw);
 }
+
+static bool trans_packw(DisasContext *ctx, arg_packw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, gen_packw);
+}
+
+static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, gen_packuw);
+}
-- 
2.31.1


