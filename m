Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA3439EB07
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:53:07 +0200 (CEST)
Received: from localhost ([::1]:51756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPzO-0000U6-5m
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPfB-0003y1-9Z
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:32:13 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPf9-0004Zo-3x
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:32:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112329; x=1654648329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n2o+fOSGEd+vwtDqZV9NKp4wsZ+S/thhV1VzPzzMW70=;
 b=N7OpKz2jCduCYUScwEpEuk1ByMBS71oL86uPcjVXn8MKr42qpgoGxk9D
 IOuVe5+imYWehvqjbjcw8iLQX8lloIYyNXfvjTr1Uhk5GM3SoMX2+Z3cw
 zqcYfNhdkS60OH+dTgmV3CHAMLF3Vw9P2Y4qx9aGswUG5hnq4tS8hThlD
 5M+zpQP+VVOym3EE9anYxyhKKKM/Gk7XpUvuXHPU+4YrDEuvaWbYu4oEZ
 Tiy2jnB7/x29uZ7aQGHW8cFSP1++sIZWwA/+Qx2SgV12xDv5VR/Y1P3FE
 +xhM0B+oXnuDt4pWfTONhaebfTB/I4WLRLNYWo9Zwvnf7s93w23YxbV/9 g==;
IronPort-SDR: ljnRigEwo4+0OlBEYcN88bJXLX/TlgjwF/maITH87X3tLYih9/zSFwMZE2s+WOJQMfwH9fdo+T
 SY/LQWAmRPiK8kMNTfdoMHzYe3t1cgi83IDw90MKHmmgBj33mErLdW8mXEpXTrb9kyAmcU9RZW
 gd1LMV9b/IjLL16+fxB4c6MdT8OGBchKbbh96+IeB7v1x/+5U1fbw7HZVXjRx5AUq2jLSXgZUQ
 ZtCv9TvtdBcxlmO7lbF6K/+/PUT2H9IyE2JjXGfF7LVTwy0r6L9cRDGz9pIYk8MeGYj5BrBtVi
 zNI=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087470"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:31:49 +0800
IronPort-SDR: xbTsSepBb09khrRbeFHtr9xRSccDme13fyHIq/tnhMHdwzMevggRdzfV8Lz2vgduA0UZP53pyV
 R7JjYA0fFTmKZjJhK8htjQNAEriBcWD1tWfszBnNJFLVVbjhoHRpNB5dngdjCkmTbyGLRJ/G/R
 Ls4lHrtQ7O06ktRLKsTIjRC92jymI5bee71FqtUNBHAt0QeToEPkc2XYW03vadEaSpGUAeTf31
 oTzVuUfnMf2ZDZZ0yGV2rLv9gA8lGh+K74r7fmEOx9xv2BNDylD3+fRoDMaMPkRkOAqoKwuo/T
 Svs8s0AH6Cxi8WhXftEkfGPH
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:10:57 -0700
IronPort-SDR: fAMahlho7UF9pSGqgKLnAzq8GLPvRMAh6OAaX628Yn7O0UKmwAtJ6iAXPOf3cVZzUBQNbKfTai
 c06Ka4DzfL+SbWIThvCrPEqOaoijuPiGgMJV2BedLFQws7uCZEiNLXDggtLFI5V7eIazfXtdnY
 PE0kGzpdfUiUofKVonzduro3MebFWgm6umapQUpz5mxRwNtz8+roz/da5i3/rzB2LXeo9bMxNS
 XPcjW/gU5hG42GCrarjSOJXM1/Lu2E+J+WofeVxsDCP9RlvHgvaLBjU60xcZF+MYdB1TX4Jh98
 ygE=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:31:47 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 29/32] target/riscv: rvb: address calculation
Date: Tue,  8 Jun 2021 10:29:44 +1000
Message-Id: <20210608002947.1649775-30-alistair.francis@wdc.com>
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
Message-id: 20210505160620.15723-15-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  6 +++++
 target/riscv/translate.c                | 32 +++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvb.c.inc | 24 +++++++++++++++++++
 3 files changed, 62 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index e6dab8dbbc..287920ee9b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -686,6 +686,9 @@ ror        0110000 .......... 101 ..... 0110011 @r
 rol        0110000 .......... 001 ..... 0110011 @r
 grev       0110100 .......... 101 ..... 0110011 @r
 gorc       0010100 .......... 101 ..... 0110011 @r
+sh1add     0010000 .......... 010 ..... 0110011 @r
+sh2add     0010000 .......... 100 ..... 0110011 @r
+sh3add     0010000 .......... 110 ..... 0110011 @r
 
 bseti      00101. ........... 001 ..... 0010011 @sh
 bclri      01001. ........... 001 ..... 0010011 @sh
@@ -714,6 +717,9 @@ rorw       0110000 .......... 101 ..... 0111011 @r
 rolw       0110000 .......... 001 ..... 0111011 @r
 grevw      0110100 .......... 101 ..... 0111011 @r
 gorcw      0010100 .......... 101 ..... 0111011 @r
+sh1add_uw  0010000 .......... 010 ..... 0111011 @r
+sh2add_uw  0010000 .......... 100 ..... 0111011 @r
+sh3add_uw  0010000 .......... 110 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 35d4d36eef..ae9b5f7a2e 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -649,6 +649,21 @@ static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
     return true;
 }
 
+#define GEN_SHADD(SHAMT)                                       \
+static void gen_sh##SHAMT##add(TCGv ret, TCGv arg1, TCGv arg2) \
+{                                                              \
+    TCGv t = tcg_temp_new();                                   \
+                                                               \
+    tcg_gen_shli_tl(t, arg1, SHAMT);                           \
+    tcg_gen_add_tl(ret, t, arg2);                              \
+                                                               \
+    tcg_temp_free(t);                                          \
+}
+
+GEN_SHADD(1)
+GEN_SHADD(2)
+GEN_SHADD(3)
+
 static void gen_ctzw(TCGv ret, TCGv arg1)
 {
     tcg_gen_ori_tl(ret, arg1, (target_ulong)MAKE_64BIT_MASK(32, 32));
@@ -733,6 +748,23 @@ static void gen_gorcw(TCGv ret, TCGv arg1, TCGv arg2)
     gen_helper_gorcw(ret, arg1, arg2);
 }
 
+#define GEN_SHADD_UW(SHAMT)                                       \
+static void gen_sh##SHAMT##add_uw(TCGv ret, TCGv arg1, TCGv arg2) \
+{                                                                 \
+    TCGv t = tcg_temp_new();                                      \
+                                                                  \
+    tcg_gen_ext32u_tl(t, arg1);                                   \
+                                                                  \
+    tcg_gen_shli_tl(t, t, SHAMT);                                 \
+    tcg_gen_add_tl(ret, t, arg2);                                 \
+                                                                  \
+    tcg_temp_free(t);                                             \
+}
+
+GEN_SHADD_UW(1)
+GEN_SHADD_UW(2)
+GEN_SHADD_UW(3)
+
 static bool gen_arith(DisasContext *ctx, arg_r *a,
                       void(*func)(TCGv, TCGv, TCGv))
 {
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index ec9f9d2ef2..b27114a068 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -226,6 +226,17 @@ static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
     return gen_shifti(ctx, a, gen_helper_gorc);
 }
 
+#define GEN_TRANS_SHADD(SHAMT)                                             \
+static bool trans_sh##SHAMT##add(DisasContext *ctx, arg_sh##SHAMT##add *a) \
+{                                                                          \
+    REQUIRE_EXT(ctx, RVB);                                                 \
+    return gen_arith(ctx, a, gen_sh##SHAMT##add);                          \
+}
+
+GEN_TRANS_SHADD(1)
+GEN_TRANS_SHADD(2)
+GEN_TRANS_SHADD(3)
+
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -386,3 +397,16 @@ static bool trans_gorciw(DisasContext *ctx, arg_gorciw *a)
     REQUIRE_EXT(ctx, RVB);
     return gen_shiftiw(ctx, a, gen_gorcw);
 }
+
+#define GEN_TRANS_SHADD_UW(SHAMT)                             \
+static bool trans_sh##SHAMT##add_uw(DisasContext *ctx,        \
+                                    arg_sh##SHAMT##add_uw *a) \
+{                                                             \
+    REQUIRE_64BIT(ctx);                                       \
+    REQUIRE_EXT(ctx, RVB);                                    \
+    return gen_arith(ctx, a, gen_sh##SHAMT##add_uw);          \
+}
+
+GEN_TRANS_SHADD_UW(1)
+GEN_TRANS_SHADD_UW(2)
+GEN_TRANS_SHADD_UW(3)
-- 
2.31.1


