Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 902AE424D8F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 08:56:24 +0200 (CEST)
Received: from localhost ([::1]:55914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNKJ-0003Ft-K7
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 02:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYND6-0003WD-Bb
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:48:57 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:36035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYND4-0004gx-GT
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:48:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633589334; x=1665125334;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1ZdEhU7r6L0bpJ3vQG0a6lUxe+r2D9ufx984WVmDeKM=;
 b=ZUu+I/w9i4xe1ddnJYdytsPMO0LBDm1W9g7nnze8DgKjeIfbnVKz3Vc/
 GpZJrFOLBoFbh7nv1QZR3ow+OOUVNFz0H8Sili+plyFju7IgCMoSSNfVI
 DspHyq1XHj+rZMN1a3xGSsHfqPn9e4OLCA+UC48snSiB4uwsp1f9iAnw4
 Xi0YTCQsPMg/YRdjJ5WpLxVYj3drDH5MJnD4gecNfl9gvJrzLS/Yuh9bZ
 NF/+xYVOw4KxMkX9XvZA/TMJmAtAKFMNWR/iNmdNI7oooOeMpvC+EsgUl
 eAEa69KAG92/ABjT/lYm4o3E2tu83fvyJV+pJBoHj/fpXeFNRCkqDCnod g==;
X-IronPort-AV: E=Sophos;i="5.85,352,1624291200"; d="scan'208";a="285950685"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2021 14:48:53 +0800
IronPort-SDR: cXpb1fMmjdTcpWYq+JxAXVrUMlwciAmDmDi/Hw/apDFbpZB3NCxybaJO7FBBk8kpaGsJKCgRHj
 aFCprmi/OwjbGkWbXkyJs/qHVpvLU9j+SV/mwydaTXpYaxpnWyeu4fr51FFuM5mcg/vkXUQPmy
 rr5IGEe1pdChwOHvfHg8Lxs+Ih6rAvYf/TqQ9vJOcbdz+wT1AUSKuvX/r7bSHdkeH50OYAqVdg
 +xXtJnkiPpUNBd7GZaNRnRelL8mAtxTB5KOiLi42X8//62TTBTEDkLahTpMuqn7vSbCXywd3TI
 Zjp5cLrHCnaFHVrQEZTfiXdv
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:24:47 -0700
IronPort-SDR: mteJsCsDbkYF8Q7KdW279dYCQNffzEQrffsVNZg2CWi1kc03NVQxEwK7x5SC3Q24aF2rMyj9Us
 GnwnETuWvsSmYu7Qhsn0ohnLRVO3s9Zw4fWYwwRPU5XfmXJ/jS79A+VTiBgKTNkV59Zeh7sf9u
 oYHGh2Di1NwEb8VsK13A0NvqQ01o4g+S2pjqhlnHFISBQgZmVhXpqqOh8PO2qis32pwGP6YCNz
 RtYvucJKKh74P13HBQIKhdTAY3+J0A6ZKywBRBiGHJOG7F0UCGKRPlAqhWwZE0VwBYY4y2/7pF
 vas=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:48:54 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HQ23T3ZrJz1Rvlt
 for <qemu-devel@nongnu.org>; Wed,  6 Oct 2021 23:48:53 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1633589332; x=1636181333; bh=1ZdEhU7r6L0bpJ3vQG
 0a6lUxe+r2D9ufx984WVmDeKM=; b=ffrJdmyFYjq84UAo1tw3ePjbU8qosJpg3B
 FhvgkDuDE4t+bfw4kabZxHByMwh7TLMqokdwqvanQQFO4w2somO7mxLvPLioFnr1
 +ELYhP+0tFPdx0mFmd6CLqdgDayANgi2S8X/YtDzkwKeXflXkvg+72SD0W5ubbBS
 O9bKUWDZa4YZgsjBOk8Kme5/LTHXAl4GfzlNFvD86QNYgybU+ttb7ehzPDrQxtMr
 gbqbpMYHhvs26PoUCmFaIwToD+vI0vEgVwrzA1xN/yRY1riXL2kx7Ql0do1zTU8B
 +n6sWEJXs9R9J8tihdxYdIXeGuK4liNb2m2XvlQL/f9zQA/S5ePQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id C0HE8fYZ028S for <qemu-devel@nongnu.org>;
 Wed,  6 Oct 2021 23:48:52 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.32])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HQ23M6lXQz1RvTg;
 Wed,  6 Oct 2021 23:48:47 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 08/26] target/riscv: Reassign instructions to the Zbs-extension
Date: Thu,  7 Oct 2021 16:47:33 +1000
Message-Id: <20211007064751.608580-9-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=907902f29=alistair.francis@opensource.wdc.com;
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

From: Philipp Tomsich <philipp.tomsich@vrull.eu>

The following instructions are part of Zbs:
 - b{set,clr,ext,inv}
 - b{set,clr,ext,inv}i

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20210911140016.834071-9-philipp.tomsich@vrull.eu
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              | 17 +++++++++--------
 target/riscv/insn_trans/trans_rvb.c.inc | 25 +++++++++++++++----------
 2 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index e0f6e315a2..35a3563ff4 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -689,19 +689,11 @@ min        0000101 .......... 100 ..... 0110011 @r
 minu       0000101 .......... 101 ..... 0110011 @r
 max        0000101 .......... 110 ..... 0110011 @r
 maxu       0000101 .......... 111 ..... 0110011 @r
-bset       0010100 .......... 001 ..... 0110011 @r
-bclr       0100100 .......... 001 ..... 0110011 @r
-binv       0110100 .......... 001 ..... 0110011 @r
-bext       0100100 .......... 101 ..... 0110011 @r
 ror        0110000 .......... 101 ..... 0110011 @r
 rol        0110000 .......... 001 ..... 0110011 @r
 grev       0110100 .......... 101 ..... 0110011 @r
 gorc       0010100 .......... 101 ..... 0110011 @r
=20
-bseti      00101. ........... 001 ..... 0010011 @sh
-bclri      01001. ........... 001 ..... 0010011 @sh
-binvi      01101. ........... 001 ..... 0010011 @sh
-bexti      01001. ........... 101 ..... 0010011 @sh
 rori       01100. ........... 101 ..... 0010011 @sh
 grevi      01101. ........... 101 ..... 0010011 @sh
 gorci      00101. ........... 101 ..... 0010011 @sh
@@ -722,3 +714,12 @@ roriw      0110000 .......... 101 ..... 0011011 @sh5
 greviw     0110100 .......... 101 ..... 0011011 @sh5
 gorciw     0010100 .......... 101 ..... 0011011 @sh5
=20
+# *** RV32 Zbs Standard Extension ***
+bclr       0100100 .......... 001 ..... 0110011 @r
+bclri      01001. ........... 001 ..... 0010011 @sh
+bext       0100100 .......... 101 ..... 0110011 @r
+bexti      01001. ........... 101 ..... 0010011 @sh
+binv       0110100 .......... 001 ..... 0110011 @r
+binvi      01101. ........... 001 ..... 0010011 @sh
+bset       0010100 .......... 001 ..... 0110011 @r
+bseti      00101. ........... 001 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index a5bf40f95b..861364e3e5 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -1,5 +1,5 @@
 /*
- * RISC-V translation routines for the RVB draft and Zba Standard Extens=
ion.
+ * RISC-V translation routines for the RVB draft Zb[as] Standard Extensi=
on.
  *
  * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
  * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
@@ -24,11 +24,16 @@
     }                                            \
 } while (0)
=20
+#define REQUIRE_ZBS(ctx) do {                    \
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbs) {      \
+        return false;                            \
+    }                                            \
+} while (0)
+
 static void gen_clz(TCGv ret, TCGv arg1)
 {
     tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
 }
-
 static bool trans_clz(DisasContext *ctx, arg_clz *a)
 {
     REQUIRE_EXT(ctx, RVB);
@@ -165,13 +170,13 @@ static void gen_bset(TCGv ret, TCGv arg1, TCGv sham=
t)
=20
 static bool trans_bset(DisasContext *ctx, arg_bset *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shift(ctx, a, EXT_NONE, gen_bset);
 }
=20
 static bool trans_bseti(DisasContext *ctx, arg_bseti *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bset);
 }
=20
@@ -187,13 +192,13 @@ static void gen_bclr(TCGv ret, TCGv arg1, TCGv sham=
t)
=20
 static bool trans_bclr(DisasContext *ctx, arg_bclr *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shift(ctx, a, EXT_NONE, gen_bclr);
 }
=20
 static bool trans_bclri(DisasContext *ctx, arg_bclri *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bclr);
 }
=20
@@ -209,13 +214,13 @@ static void gen_binv(TCGv ret, TCGv arg1, TCGv sham=
t)
=20
 static bool trans_binv(DisasContext *ctx, arg_binv *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shift(ctx, a, EXT_NONE, gen_binv);
 }
=20
 static bool trans_binvi(DisasContext *ctx, arg_binvi *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_binv);
 }
=20
@@ -227,13 +232,13 @@ static void gen_bext(TCGv ret, TCGv arg1, TCGv sham=
t)
=20
 static bool trans_bext(DisasContext *ctx, arg_bext *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shift(ctx, a, EXT_NONE, gen_bext);
 }
=20
 static bool trans_bexti(DisasContext *ctx, arg_bexti *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bext);
 }
=20
--=20
2.31.1


