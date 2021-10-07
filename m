Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4771424D70
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 08:53:15 +0200 (CEST)
Received: from localhost ([::1]:47306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNHG-00060c-M6
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 02:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNCr-0002wl-Ly
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:48:42 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:23669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNCn-0003ri-WC
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:48:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633589316; x=1665125316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C1TigUwwV8lk9liC+N2ASK3WXJmIzhJhZKd/SwA8+D0=;
 b=LUPwojBMBDCB7Wn30xh7ovb0iUMVto6/2cKl6faqDjRJelAudpEnCksl
 x/28j858wVFM3vEeUThQ9QyI0uR9uHuUi7traB+GDyWqD1+SM/7Xn1YGw
 2aHKdLhApFfdqchIR/Oy6VEknfft4h4WlsRFWyoOyT0msDiedTiRiZFvC
 xF5tcDjw0D9bNV7FmMiK52efmnB2YI3R5QZQJt178jhQmfzSe1pv9rpQ+
 dYIZw+e6NyREUo0OxI1+LMuY3HG45NAnaJb6gEG+wcY/WdviAJIM9J4Tf
 nPAc8N+tbLK10TozEOZOuKoyTX8jpbHPUhOxf0SwFylw9brEV9CqdU44d w==;
X-IronPort-AV: E=Sophos;i="5.85,352,1624291200"; d="scan'208";a="182122337"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2021 14:48:33 +0800
IronPort-SDR: WctOtkqU+IwBolS+34MixDkLM8nekQg03c+Mk9sNTyYNPpLCyOy0WighRuL0nUf8mJYB2wgkHz
 8/6PujslooTi9/7/aNMIinyMd/GuONPOoHsAZBJLgMsp1+BZAviYzANwl4jkVI7furm7dLQpgM
 tfYuX5DUhNz8xNfYGSbJ4IymLkVGMwlLDD5CmlGT6NB+ULdeo10+bZplK5jvPW7OnBuNEKBlI/
 fObQBK35l4dfFWToV7bGjyWgd7pQMUqlGQykvzOiX0lcd0XZ73Ljd2EacaptzWWhUrhhfGz7FP
 L5/jrcB61nE27ufyB/UeM4Tu
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:22:56 -0700
IronPort-SDR: IzajyWmAKOUFYqRmFVsHHAdZp4ALfbvFaCa9etxhFndCZ3DurUTpLJP6fMfloH9oRF1IXc1CJM
 rDHRO7JvX5pJZfbaaPO+qNw4CSuykU/oXYapWNkOXY4BynEyxgJvsQkdniueb4HCsGIbOFB1TZ
 rOVmTrmIVlU0CQds/53lezjnZ+1udnv4mxZLc2KV2zTEJdHhMfeDK5FG9QwRsTWMNWqr9wUzke
 Z0q+4WSU0mU6vQ4qfgY0rD3uXTFLMuYh+3uWYoe2O6lXu5yA9SXIrThcTtViMlu4SbxiY+AO/w
 qMo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:48:36 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HQ2371Hyqz1RvmK
 for <qemu-devel@nongnu.org>; Wed,  6 Oct 2021 23:48:35 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1633589314; x=1636181315; bh=C1TigUwwV8lk9liC+N
 2ASK3WXJmIzhJhZKd/SwA8+D0=; b=nixk0C/jwQoVfi7zH+XDJUS7d/QgXaMnot
 hpAmfY/HbayPMfP5izNx7scbaNb+lIa2CFn0o1PbTTQKTv2WD+mzO3/Za5BkxQlm
 0WenJdqbitMj5lqV0Uvx20q4opo0+2sl2rtIZzu7l4yq7Je9sC21kpqgNY56tali
 8M4tv1silGCuzwtv9TfuzGJichcTtJNhSdvSfvTXnsg5aiE3cqAVrKQzHZn/AZcX
 3vS1i3d5NYpWOwAE15f3pHK5439s7nX+KfruGLOTetRMMf/rLLKoe3Z0AEhnTlP6
 OLIBY+0CdNvtdSaKpycC8/tpE/O7NIiUMPnFKoUVWy4+BV/nRT4A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id nQFyKdgn-Q7L for <qemu-devel@nongnu.org>;
 Wed,  6 Oct 2021 23:48:34 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.32])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HQ2310tN4z1RvTg;
 Wed,  6 Oct 2021 23:48:28 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 05/26] target/riscv: Reassign instructions to the Zba-extension
Date: Thu,  7 Oct 2021 16:47:30 +1000
Message-Id: <20211007064751.608580-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=907902f29=alistair.francis@opensource.wdc.com;
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

From: Philipp Tomsich <philipp.tomsich@vrull.eu>

The following instructions are part of Zba:
 - add.uw (RV64 only)
 - sh[123]add (RV32 and RV64)
 - sh[123]add.uw (RV64-only)
 - slli.uw (RV64-only)

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20210911140016.834071-6-philipp.tomsich@vrull.eu
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              | 20 ++++++++++++--------
 target/riscv/insn_trans/trans_rvb.c.inc | 16 +++++++++++-----
 2 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 2cd921d51c..86f1166dab 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -660,6 +660,18 @@ vamomaxd_v      10100 . . ..... ..... 111 ..... 0101=
111 @r_wdvm
 vamominud_v     11000 . . ..... ..... 111 ..... 0101111 @r_wdvm
 vamomaxud_v     11100 . . ..... ..... 111 ..... 0101111 @r_wdvm
=20
+# *** RV32 Zba Standard Extension ***
+sh1add     0010000 .......... 010 ..... 0110011 @r
+sh2add     0010000 .......... 100 ..... 0110011 @r
+sh3add     0010000 .......... 110 ..... 0110011 @r
+
+# *** RV64 Zba Standard Extension (in addition to RV32 Zba) ***
+add_uw     0000100 .......... 000 ..... 0111011 @r
+sh1add_uw  0010000 .......... 010 ..... 0111011 @r
+sh2add_uw  0010000 .......... 100 ..... 0111011 @r
+sh3add_uw  0010000 .......... 110 ..... 0111011 @r
+slli_uw    00001 ............ 001 ..... 0011011 @sh
+
 # *** RV32B Standard Extension ***
 clz        011000 000000 ..... 001 ..... 0010011 @r2
 ctz        011000 000001 ..... 001 ..... 0010011 @r2
@@ -687,9 +699,6 @@ ror        0110000 .......... 101 ..... 0110011 @r
 rol        0110000 .......... 001 ..... 0110011 @r
 grev       0110100 .......... 101 ..... 0110011 @r
 gorc       0010100 .......... 101 ..... 0110011 @r
-sh1add     0010000 .......... 010 ..... 0110011 @r
-sh2add     0010000 .......... 100 ..... 0110011 @r
-sh3add     0010000 .......... 110 ..... 0110011 @r
=20
 bseti      00101. ........... 001 ..... 0010011 @sh
 bclri      01001. ........... 001 ..... 0010011 @sh
@@ -718,10 +727,6 @@ rorw       0110000 .......... 101 ..... 0111011 @r
 rolw       0110000 .......... 001 ..... 0111011 @r
 grevw      0110100 .......... 101 ..... 0111011 @r
 gorcw      0010100 .......... 101 ..... 0111011 @r
-sh1add_uw  0010000 .......... 010 ..... 0111011 @r
-sh2add_uw  0010000 .......... 100 ..... 0111011 @r
-sh3add_uw  0010000 .......... 110 ..... 0111011 @r
-add_uw     0000100 .......... 000 ..... 0111011 @r
=20
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
@@ -732,4 +737,3 @@ roriw      0110000 .......... 101 ..... 0011011 @sh5
 greviw     0110100 .......... 101 ..... 0011011 @sh5
 gorciw     0010100 .......... 101 ..... 0011011 @sh5
=20
-slli_uw    00001. ........... 001 ..... 0011011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index 73d1e45026..fd549c7b0f 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -1,8 +1,9 @@
 /*
- * RISC-V translation routines for the RVB Standard Extension.
+ * RISC-V translation routines for the RVB draft and Zba Standard Extens=
ion.
  *
  * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
  * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
+ * Copyright (c) 2021 Philipp Tomsich, philipp.tomsich@vrull.eu
  *
  * This program is free software; you can redistribute it and/or modify =
it
  * under the terms and conditions of the GNU General Public License,
@@ -17,6 +18,11 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
=20
+#define REQUIRE_ZBA(ctx) do {                    \
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_zba) {      \
+        return false;                            \
+    }                                            \
+} while (0)
=20
 static void gen_clz(TCGv ret, TCGv arg1)
 {
@@ -339,7 +345,7 @@ GEN_SHADD(3)
 #define GEN_TRANS_SHADD(SHAMT)                                          =
   \
 static bool trans_sh##SHAMT##add(DisasContext *ctx, arg_sh##SHAMT##add *=
a) \
 {                                                                       =
   \
-    REQUIRE_EXT(ctx, RVB);                                              =
   \
+    REQUIRE_ZBA(ctx);                                                   =
   \
     return gen_arith(ctx, a, EXT_NONE, gen_sh##SHAMT##add);             =
   \
 }
=20
@@ -616,7 +622,7 @@ static bool trans_sh##SHAMT##add_uw(DisasContext *ctx=
,        \
                                     arg_sh##SHAMT##add_uw *a) \
 {                                                             \
     REQUIRE_64BIT(ctx);                                       \
-    REQUIRE_EXT(ctx, RVB);                                    \
+    REQUIRE_ZBA(ctx);                                         \
     return gen_arith(ctx, a, EXT_NONE, gen_sh##SHAMT##add_uw);  \
 }
=20
@@ -635,7 +641,7 @@ static void gen_add_uw(TCGv ret, TCGv arg1, TCGv arg2=
)
 static bool trans_add_uw(DisasContext *ctx, arg_add_uw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBA(ctx);
     return gen_arith(ctx, a, EXT_NONE, gen_add_uw);
 }
=20
@@ -647,6 +653,6 @@ static void gen_slli_uw(TCGv dest, TCGv src, target_l=
ong shamt)
 static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBA(ctx);
     return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_slli_uw);
 }
--=20
2.31.1


