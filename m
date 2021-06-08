Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D82A39EAF0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:45:28 +0200 (CEST)
Received: from localhost ([::1]:57642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPrz-0001qR-3c
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:45:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPf9-0003rg-Rr
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:32:11 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPf7-0004dW-HK
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:32:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112327; x=1654648327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W0NBujW4Ye5wlqpW8FyyWw+1VX2zckzoGU9xcGXgHCU=;
 b=ECENC2HwZaQGI7XBEAPC6oCzeTRDQHniIbV9WmkD6Dq968STha5RNiKO
 1yMBBaMue9PXOf6gSHdn7RGa3JrlEuPGH/9AWwuU+wrTNcysblf0bio9e
 0AjddVMpX9mVp8NTLp8dTZPOhnmq9wWGVvseU9hXn9OzAjRWYZOzIRs7O
 lx1eDIHBZZw7/XSsNS223tochnbKtZSBeNCgek7EqsRbCiGaNkjotAYY0
 v6KCCYyDaoI7qeHVC9/8hahdX6ohHPzKAN3YARgxZiCAE0YfIAjze9SOQ
 Hwpi2MVOf0dDFBn0LRrjd7Kh4LEn3dOf6y8Mo07Xj59yokD4PSB4xBdXL Q==;
IronPort-SDR: 0Gmyk12Y/J3zxiJiii4+Dv0000x0/l882W5Ju2cxb1nmCJ6Qmbv3tDhprDro4F0A5BqSmqvbcL
 OqIKt8395gskYtWQvrlayiHFLSCEqpPa7XAAJ2L+1ZWDZiYEInUNODlBQrGQqLFT99pxnkaHsN
 J3HnWCsFD5SeX77uUFi6L5kwTF8hGhU6DZYN2PrU47SIyaU6E0aMz8eMcOo2UE+k1Rcgp+CHKk
 guz7ZkYlYKEoMhl/VU+3UA9ZIrT7waxW3F+R/MFivWk5Y2vwBfeC3CTYsqKXLmGRw7CLLJei8p
 otE=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087464"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:31:46 +0800
IronPort-SDR: 3OE4tRjAbZYjvqgtTwyOeMrz436Dl0oN8sAQ0ikk7B+yyW816CzplgEcZu0V0L468NpF6SD/Q3
 OhzTcya8csmt2kEQtDgnGhYfHUUG+Yj4fusO+RcoExklFT9zN8O/dVrijMtOerIIXO80y2fKLS
 SFLDtK22VsLeJfjGAd0KiMOvMfPLYUIbdY8h9CJkQRUpTwDQ9NRoaquddm8z3ipJqXWPu6AxNu
 7WF/7Mo9NVTGGjyiXS9PjUPDcrvFYEhCiqewt910dQyON8/+xHbHvkX/tchrROiQTeX7mR7Y6X
 0cIAUYhoD7xYw9ExEby+iFxY
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:10:53 -0700
IronPort-SDR: cS17CRSo1TH7FgVkYf+n7bAzSsfrKAbn+6DmXDr/GHmhxcQqIipcmGlNbb31Ls8HIEVFpUcmKp
 jH6++zXvy665ow8zQkagM/akIpDsemeN1nTICf4dFwJ5W6zHhkCPklzozJq7sso4vEy2HqrqHs
 Zbx02MMn1vymDVTqvqF/2kNJtWK2y9nuBNwg1fv66i+jCmBjwbVdMK7f3skyIQTIiR/Qk3FR+7
 dUt569xFrfErVRyoLeE8sFm3GYHdO4/vqyZWK+oSQG2KuVWnqm9u2DGaAKGkkYnY78DPBnQGQQ
 jZc=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:31:43 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 28/32] target/riscv: rvb: generalized or-combine
Date: Tue,  8 Jun 2021 10:29:43 +1000
Message-Id: <20210608002947.1649775-29-alistair.francis@wdc.com>
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
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210505160620.15723-14-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  2 ++
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/bitmanip_helper.c          | 26 +++++++++++++++++++++++++
 target/riscv/translate.c                |  6 ++++++
 target/riscv/insn_trans/trans_rvb.c.inc | 26 +++++++++++++++++++++++++
 5 files changed, 64 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index f81b8faf3b..415e37bc37 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -61,6 +61,8 @@ DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
 /* Bitmanip */
 DEF_HELPER_FLAGS_2(grev, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(grevw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(gorc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(gorcw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 
 /* Special functions */
 DEF_HELPER_3(csrrw, tl, env, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6b5e276a9f..e6dab8dbbc 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -685,6 +685,7 @@ sro        0010000 .......... 101 ..... 0110011 @r
 ror        0110000 .......... 101 ..... 0110011 @r
 rol        0110000 .......... 001 ..... 0110011 @r
 grev       0110100 .......... 101 ..... 0110011 @r
+gorc       0010100 .......... 101 ..... 0110011 @r
 
 bseti      00101. ........... 001 ..... 0010011 @sh
 bclri      01001. ........... 001 ..... 0010011 @sh
@@ -694,6 +695,7 @@ sloi       00100. ........... 001 ..... 0010011 @sh
 sroi       00100. ........... 101 ..... 0010011 @sh
 rori       01100. ........... 101 ..... 0010011 @sh
 grevi      01101. ........... 101 ..... 0010011 @sh
+gorci      00101. ........... 101 ..... 0010011 @sh
 
 # *** RV64B Standard Extension (in addition to RV32B) ***
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
@@ -711,6 +713,7 @@ srow       0010000 .......... 101 ..... 0111011 @r
 rorw       0110000 .......... 101 ..... 0111011 @r
 rolw       0110000 .......... 001 ..... 0111011 @r
 grevw      0110100 .......... 101 ..... 0111011 @r
+gorcw      0010100 .......... 101 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
@@ -719,3 +722,4 @@ sloiw      0010000 .......... 001 ..... 0011011 @sh5
 sroiw      0010000 .......... 101 ..... 0011011 @sh5
 roriw      0110000 .......... 101 ..... 0011011 @sh5
 greviw     0110100 .......... 101 ..... 0011011 @sh5
+gorciw     0010100 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
index c625adaded..5b2f795d03 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -62,3 +62,29 @@ target_ulong HELPER(grevw)(target_ulong rs1, target_ulong rs2)
 {
     return do_grev(rs1, rs2, 32);
 }
+
+static target_ulong do_gorc(target_ulong rs1,
+                            target_ulong rs2,
+                            int bits)
+{
+    target_ulong x = rs1;
+    int i, shift;
+
+    for (i = 0, shift = 1; shift < bits; i++, shift <<= 1) {
+        if (rs2 & shift) {
+            x |= do_swap(x, adjacent_masks[i], shift);
+        }
+    }
+
+    return x;
+}
+
+target_ulong HELPER(gorc)(target_ulong rs1, target_ulong rs2)
+{
+    return do_gorc(rs1, rs2, TARGET_LONG_BITS);
+}
+
+target_ulong HELPER(gorcw)(target_ulong rs1, target_ulong rs2)
+{
+    return do_gorc(rs1, rs2, 32);
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8deb05add4..35d4d36eef 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -727,6 +727,12 @@ static void gen_grevw(TCGv ret, TCGv arg1, TCGv arg2)
     gen_helper_grev(ret, arg1, arg2);
 }
 
+static void gen_gorcw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    gen_helper_gorcw(ret, arg1, arg2);
+}
+
 static bool gen_arith(DisasContext *ctx, arg_r *a,
                       void(*func)(TCGv, TCGv, TCGv))
 {
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 281e0ffae9..ec9f9d2ef2 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -214,6 +214,18 @@ static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
     return gen_grevi(ctx, a);
 }
 
+static bool trans_gorc(DisasContext *ctx, arg_gorc *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, gen_helper_gorc);
+}
+
+static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shifti(ctx, a, gen_helper_gorc);
+}
+
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -360,3 +372,17 @@ static bool trans_greviw(DisasContext *ctx, arg_greviw *a)
     REQUIRE_EXT(ctx, RVB);
     return gen_shiftiw(ctx, a, gen_grevw);
 }
+
+static bool trans_gorcw(DisasContext *ctx, arg_gorcw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_gorcw);
+}
+
+static bool trans_gorciw(DisasContext *ctx, arg_gorciw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, gen_gorcw);
+}
-- 
2.31.1


