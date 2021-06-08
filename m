Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8211939EAEB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:43:45 +0200 (CEST)
Received: from localhost ([::1]:51348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPqK-00061K-Jc
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPey-0003RC-Oz
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:32:00 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPev-0004Zo-R3
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112316; x=1654648316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yv3iA5/UO5WIozGqrvfqNLp27TeYQN/BJAgt2OZC7dA=;
 b=Ry/B53FQPXGon5Wr8897HU0rFBK/BAYfgw10dAWCoeZSpO9DcIVIpfY7
 mIG3S0eRvCrUFnXwnpYJogIREmhK/+iNpRK/mlimIYRRSGFadBQQCDMhx
 ki/cyyxq2DTdPbMZtf53GpR/IqNvd38K/b5yTrXm8iz7pnd1tEXBnpH8h
 46iJtBQo/GPFC9XnUnsUWJgaGvBRaD+sIqhTvVZlTjf0oB1kA6zREoitV
 T+uIORXSFkeQUVB4Ip1Osgr5T9VYjGri4Z4npWHOiZEJrXtRr4cy9bA2M
 qTZXd6UFSHDmnWJbuw9ja800NwalrRtrzGmbVJYr32Pgb0mJ7IFuO20iL Q==;
IronPort-SDR: wA6dNiAfeEvTMaR968Bl9DKwhTdh61aF6B80CgmHEbQkoF5fcsDwDdQbl58a3eL7FkXVNOncId
 eN9GNNJrNY/8E+QIasv04XPjnZlgW2Tl2B5lmUwUcG5EYhJsxJItpfGs0i08Pkwh676RUXJO83
 4DUqi1cEZjdcjUpFKYDo0Kcg58IgWtgS1BX6D+Moqtol0toFFY9+kVhY8wmNyCsdxfKRGLcspB
 hgzeOWsquNDGEQYM9zWGe6kBUK7o+vCg1ma9Z/kwIRjqezC4aJAptmuVEl9KvYlLlvOfa/dzQj
 93Y=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087455"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:31:39 +0800
IronPort-SDR: 5FYQ1Gyr9Mxoa0C1iQq+fnYSwmqZxoVepwryx0yONVr1kdMiEGdyi4EeLpJm+ju+RYtAG13uj6
 7u/+hlGb0NhT875MWl79c4KHC05ApSFRCr7rwSbskhB2Hdp98F9QjNvVrWRU5MxReEWIeK2rhn
 ws+e2fM59lfBsJltI7uPM6VueAbCOzjktS9SybQ+psegc6FdLnyQfdmDDzK5xxFMGCGAfG0M9z
 O7nBuZSqfNAwQGT82oeXWyeYj/DyrGcR0o6uApKvavZj21PwQKIDNmOzHLjnxbRdr18HNfNQm/
 dIo59uEbHCyhuh9/16dYwD5F
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:10:46 -0700
IronPort-SDR: M6rrQktuJnTEJWsCj50RW3zZ2OQNMmvbeuFMwl4mzxm+DXrRqiOScVEmsOYo22jNLmtj4CtOYP
 z+pd3l2N4QXNk4oeglXlzt6yNgd1LXaM+/ZAoGa00N+HDBFZ1zHaCIYua7Kd75jD7hqF7eZRL5
 39NrRVywtXaGBlnHZCKRKw64gLLMqFS9/wqKK2b9a16YmefJlrYO7JuM5DjilmF8nx8/ejGN6V
 v1iItlvZEue7NAXpLN0yPESBlJZ1udpZtyR5aEjXjPtEERney6SCJC7iA/rUV5A00hRhh9iy6r
 +00=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:31:36 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 26/32] target/riscv: rvb: rotate (left/right)
Date: Tue,  8 Jun 2021 10:29:41 +1000
Message-Id: <20210608002947.1649775-27-alistair.francis@wdc.com>
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
Message-id: 20210505160620.15723-12-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  6 ++++
 target/riscv/translate.c                | 36 +++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvb.c.inc | 39 +++++++++++++++++++++++++
 3 files changed, 81 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6bc9bbae9e..71a9a182c0 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -682,6 +682,8 @@ binv       0110100 .......... 001 ..... 0110011 @r
 bext       0100100 .......... 101 ..... 0110011 @r
 slo        0010000 .......... 001 ..... 0110011 @r
 sro        0010000 .......... 101 ..... 0110011 @r
+ror        0110000 .......... 101 ..... 0110011 @r
+rol        0110000 .......... 001 ..... 0110011 @r
 
 bseti      00101. ........... 001 ..... 0010011 @sh
 bclri      01001. ........... 001 ..... 0010011 @sh
@@ -689,6 +691,7 @@ binvi      01101. ........... 001 ..... 0010011 @sh
 bexti      01001. ........... 101 ..... 0010011 @sh
 sloi       00100. ........... 001 ..... 0010011 @sh
 sroi       00100. ........... 101 ..... 0010011 @sh
+rori       01100. ........... 101 ..... 0010011 @sh
 
 # *** RV64B Standard Extension (in addition to RV32B) ***
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
@@ -703,9 +706,12 @@ binvw      0110100 .......... 001 ..... 0111011 @r
 bextw      0100100 .......... 101 ..... 0111011 @r
 slow       0010000 .......... 001 ..... 0111011 @r
 srow       0010000 .......... 101 ..... 0111011 @r
+rorw       0110000 .......... 101 ..... 0111011 @r
+rolw       0110000 .......... 001 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
 binviw     0110100 .......... 001 ..... 0011011 @sh5
 sloiw      0010000 .......... 001 ..... 0011011 @sh5
 sroiw      0010000 .......... 101 ..... 0011011 @sh5
+roriw      0110000 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 088cf9f767..c09b93f1b8 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -663,6 +663,42 @@ static void gen_packuw(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(t);
 }
 
+static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+
+    /* truncate to 32-bits */
+    tcg_gen_trunc_tl_i32(t1, arg1);
+    tcg_gen_trunc_tl_i32(t2, arg2);
+
+    tcg_gen_rotr_i32(t1, t1, t2);
+
+    /* sign-extend 64-bits */
+    tcg_gen_ext_i32_tl(ret, t1);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+}
+
+static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+
+    /* truncate to 32-bits */
+    tcg_gen_trunc_tl_i32(t1, arg1);
+    tcg_gen_trunc_tl_i32(t2, arg2);
+
+    tcg_gen_rotl_i32(t1, t1, t2);
+
+    /* sign-extend 64-bits */
+    tcg_gen_ext_i32_tl(ret, t1);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+}
+
 static bool gen_arith(DisasContext *ctx, arg_r *a,
                       void(*func)(TCGv, TCGv, TCGv))
 {
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 28640322c4..429738db15 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -179,6 +179,24 @@ static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
     return gen_shifti(ctx, a, gen_sro);
 }
 
+static bool trans_ror(DisasContext *ctx, arg_ror *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, tcg_gen_rotr_tl);
+}
+
+static bool trans_rori(DisasContext *ctx, arg_rori *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shifti(ctx, a, tcg_gen_rotr_tl);
+}
+
+static bool trans_rol(DisasContext *ctx, arg_rol *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, tcg_gen_rotl_tl);
+}
+
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -290,3 +308,24 @@ static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
     REQUIRE_EXT(ctx, RVB);
     return gen_shiftiw(ctx, a, gen_sro);
 }
+
+static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_rorw);
+}
+
+static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, gen_rorw);
+}
+
+static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_rolw);
+}
-- 
2.31.1


