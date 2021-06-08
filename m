Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EC339EAFD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:49:34 +0200 (CEST)
Received: from localhost ([::1]:42086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPvx-00029A-JS
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPex-0003L7-3r
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:31:59 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPev-0004dW-2T
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:31:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112316; x=1654648316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i99iDHcZNo0oVeOVNeTskhavG628wLwTWmHMO+xb1Mc=;
 b=XhGU3dAjmKwjYJr5x5vhuA05rc82+Qz/loZaCaVNM8x2cwxpA3hCmk9c
 HUXJcW/3wPloUecbg83MGp4c6XD/3A3GP/qZvDeD+PLUYOEYACOkt54xS
 IqocmgOrPMqIfEMquLXfDEUfr89gG2B2ZTuRUWBt6vqI8UeQtJS+LWN57
 aL7rzDr5IFJmJvy0wYFHA+6s+RATamJLf90F1Rv7Bh+gMydkMPr84KNIH
 9BlgxPO60CSjUKhjHOx2O2ArUyB9iXQ7RE/FQ2s0oOb2WvlatEbnecSUb
 +tqdWp0bU6sKrNwCspGL88JWP8Q9rpWUjDo4iZ3J682WXQJf2zW+p/Vg/ Q==;
IronPort-SDR: MvLe9BPxg+k924N7OZvVKBAIpMB9vHr1iYYls91CJJfm2FfQ7wVET3ivSnV3fj0E5jVRhPjLKm
 TC9Hr9UbZcwU0iXaUCMWMEnqeY42AhdlrhNVOBK32HtGVM6flfYKlz6jGfpav7ptRgUZYO6KmD
 VLzSBhAXmPxcSEbCSslukHj1I75cOqcHmmnPra/V/cLVI5N5pudMwdJZVKbIS+WYo4VxvJkNpx
 4vURGntjHJyVFu9oF0Bv+atLtkwb7nrtqGgxUCBn351x/CgUQwYsUH8/e7G3TppBDYUZLq1kV6
 pnA=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087447"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:31:35 +0800
IronPort-SDR: AP8M+IwJpfrSdM5fbcxBmunz8n2t15+gpfFhHFouXT2oUK5lTOpGDCbXl+3qp4e2KI7KUcA3U0
 rp5Hra0IRHf48t47vNIUiFE1sd6iPz3WZWmuYzP7YC0QojFNFHr5glpYXPfAu6qAbQPFrPEsSw
 K95NrePmVBA6NRJU5+lAhemQ6VMVg52taHamxR8Jn2o8T7OUt3ANvRaN1vJvE28e3DRm59YD0A
 ZJvmAqBi5cxNcpJCVIM+DUVYwJWWcPYGFPygq1V3RXfbBSKC6YqLqCjd/ANo3FIVuT2FWCF2sm
 lkV+bh0Wf9cF51dcoSEaXHKJ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:10:42 -0700
IronPort-SDR: 2y7NZ4RjWqHiCUHWylSNSBeksI9e5ZWgtgXCI9CKDlBiRVmE7cdaWCc/5yWg2rl/s6+9OUDtxh
 SMAT6xHG6eYhi8eoX/mFdAiesn+mI4BvO9qdc0azlgFYtYrsXdV4JUmL8EEsciPTO/+hPLvAKV
 gtf4S447UE5R1uPuq9+qrVarSy146O++OCgLWJW+BSQwRFkZUxSJDzYEPmxmRzW4QzX5TU/ZcT
 MdgfetQlC1utAGc+agSUTfaJ4qphSoXBfv/V/PyLPygS0oxojG+GM67GjHn2DFuP5SsejxAeXL
 iIk=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:31:33 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 25/32] target/riscv: rvb: shift ones
Date: Tue,  8 Jun 2021 10:29:40 +1000
Message-Id: <20210608002947.1649775-26-alistair.francis@wdc.com>
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
Message-id: 20210505160620.15723-11-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  8 ++++
 target/riscv/translate.c                | 14 +++++++
 target/riscv/insn_trans/trans_rvb.c.inc | 52 +++++++++++++++++++++++++
 3 files changed, 74 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 433b601b93..6bc9bbae9e 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -680,11 +680,15 @@ bset       0010100 .......... 001 ..... 0110011 @r
 bclr       0100100 .......... 001 ..... 0110011 @r
 binv       0110100 .......... 001 ..... 0110011 @r
 bext       0100100 .......... 101 ..... 0110011 @r
+slo        0010000 .......... 001 ..... 0110011 @r
+sro        0010000 .......... 101 ..... 0110011 @r
 
 bseti      00101. ........... 001 ..... 0010011 @sh
 bclri      01001. ........... 001 ..... 0010011 @sh
 binvi      01101. ........... 001 ..... 0010011 @sh
 bexti      01001. ........... 101 ..... 0010011 @sh
+sloi       00100. ........... 001 ..... 0010011 @sh
+sroi       00100. ........... 101 ..... 0010011 @sh
 
 # *** RV64B Standard Extension (in addition to RV32B) ***
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
@@ -697,7 +701,11 @@ bsetw      0010100 .......... 001 ..... 0111011 @r
 bclrw      0100100 .......... 001 ..... 0111011 @r
 binvw      0110100 .......... 001 ..... 0111011 @r
 bextw      0100100 .......... 101 ..... 0111011 @r
+slow       0010000 .......... 001 ..... 0111011 @r
+srow       0010000 .......... 101 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
 binviw     0110100 .......... 001 ..... 0011011 @sh5
+sloiw      0010000 .......... 001 ..... 0011011 @sh5
+sroiw      0010000 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index e12240d125..088cf9f767 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -613,6 +613,20 @@ static void gen_bext(TCGv ret, TCGv arg1, TCGv shamt)
     tcg_gen_andi_tl(ret, ret, 1);
 }
 
+static void gen_slo(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_not_tl(ret, arg1);
+    tcg_gen_shl_tl(ret, ret, arg2);
+    tcg_gen_not_tl(ret, ret);
+}
+
+static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_not_tl(ret, arg1);
+    tcg_gen_shr_tl(ret, ret, arg2);
+    tcg_gen_not_tl(ret, ret);
+}
+
 static void gen_ctzw(TCGv ret, TCGv arg1)
 {
     tcg_gen_ori_tl(ret, arg1, (target_ulong)MAKE_64BIT_MASK(32, 32));
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 69e5af44a1..28640322c4 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -155,6 +155,30 @@ static bool trans_bexti(DisasContext *ctx, arg_bexti *a)
     return gen_shifti(ctx, a, gen_bext);
 }
 
+static bool trans_slo(DisasContext *ctx, arg_slo *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, gen_slo);
+}
+
+static bool trans_sloi(DisasContext *ctx, arg_sloi *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shifti(ctx, a, gen_slo);
+}
+
+static bool trans_sro(DisasContext *ctx, arg_sro *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, gen_sro);
+}
+
+static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shifti(ctx, a, gen_sro);
+}
+
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -238,3 +262,31 @@ static bool trans_bextw(DisasContext *ctx, arg_bextw *a)
     REQUIRE_EXT(ctx, RVB);
     return gen_shiftw(ctx, a, gen_bext);
 }
+
+static bool trans_slow(DisasContext *ctx, arg_slow *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_slo);
+}
+
+static bool trans_sloiw(DisasContext *ctx, arg_sloiw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, gen_slo);
+}
+
+static bool trans_srow(DisasContext *ctx, arg_srow *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_sro);
+}
+
+static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, gen_sro);
+}
-- 
2.31.1


