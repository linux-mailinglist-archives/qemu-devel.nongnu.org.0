Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFAB3FD178
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:45:54 +0200 (CEST)
Received: from localhost ([::1]:44428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLGG9-00017V-Qp
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:45:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFkd-0008Fi-ON
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:13:19 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:4046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFkZ-00014E-V9
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:13:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462395; x=1661998395;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eqvAQz0yt9ZA64gD7mwsbxLf6rZukeixkBbUSonaMRA=;
 b=qG0Wzb9YNQ9Db2UPKK0T5s8R7eFCQe2+02i7Ho2QvibHM0khkP6N83o3
 INXutCOW5ksdkzHbd8hxVKNf40MrU37IXcFUogLPcae751A/zt5gFDRHU
 oSsUOrZbq1qGaDvxZEmYuwKYLbj4INiW7AtT0gPZbZemPs5X4vBWJgEM7
 yhwd5vypMtuOuaM1Y2bz1lxqwHftZLc9S3Lp/Zy2k9qk9d5/sbFqks62Q
 5TqC36XLK+Syc5ulIpgS00GQRb5wpPN/x+fl1HuhUZNDwwsvvZV1VOk1W
 oeYYz8AZHLOjyjB6ph+VPG2WMYBp4QWZ1DYn5Snrxa//ykz1npnGmuiej A==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="178910914"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:13:14 +0800
IronPort-SDR: snvRpHQ3csfMBGgeYf/xLvqFxfZ9ZThzdtttgipuWOWgcm/vbrUAWKtrm6U63GFjrWbDjpoxoe
 JEWesjJAlNd2fxBT4L1dK14dR34KXxEdb8guaWcMbji7jP+RFBIDN4XA4T5nDJl7OSRjkUGIQx
 jlCvky8j8jpeL81czDEXh/Lwlv/AiKw7O3M1/tdlfeg+mFbVbsCemmohpdeZOEbybgr4Ag6l2n
 AOKUnY+9t8hYGQ/aZS5Y5Olhbzvj/WA/OaEzp3dNfIqn8KLACGR8Hb8Diup45eZwiwBqUYCgrn
 GnFA/yVLTEPCWVgBN/GjQSeq
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:48:20 -0700
IronPort-SDR: IgN4fxWVLz3JgSl57rnr4f46TFlD7d17xQesTJSWiq3qvUb2xbeuFlPLfATwIXplCugfB4dt4w
 n8dfA6iOMTaf8R+xwXCyVON5+igznUlcy4cNVg0Nkh9H/eHgRh4W1iTxS1Un+Q4L8vngen06o1
 0i0Upv+SGn+7dj1c/qDWJ1aZ/ls8zuEaUzxAp+ZS2TOoNYyGYFaKTRKXSmsw8Xw2PT7SueV40D
 YQi2zS8glAP+COwJRTX4BCuLZ8dGvvyU6BcTN3OnvfY6MjmcJd+yr2N0sdXcBDXM7A7xmJ6YYN
 9z4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:13:14 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Gznf225ndz1Rvl9
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:13:14 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1630462388; x=1633054389; bh=eqvAQz0
 yt9ZA64gD7mwsbxLf6rZukeixkBbUSonaMRA=; b=FuTzvIG12phCQuzkBL0KI/O
 id5cTejKdz0jlhDpogkvNU3aBicjSW8R30+bauriyDdKnSkjMYBdJe6pEzp1NLTg
 uN6kRxgsW6AdpQ0Zxo+7vAGjzkS0usHJhVpRpucbytGtldcE6sJGcJ3ITtwoAQDI
 1R+N9HOmSxUz9mz1dyJ/KKVsUQ9nOOn71bV+kscIEqfnWE6d60s0R6vCm+bfmpXA
 5I1XNsrsPSJDsamA2nR97/wmhgXnLtYRN8h0JGTPmkE9BE2uAMKSKXH0U1rL5O1y
 5LzxfhDeF5llpPCHAWjf1WOMi7DhLq/jNRsJsTZtCOjWg7oE2o87an+PInjykhg=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id qhTEE7MbgoGf for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:13:08 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Gzndr265Nz1RvlZ;
 Tue, 31 Aug 2021 19:13:03 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 32/33] target/riscv: Tidy trans_rvh.c.inc
Date: Wed,  1 Sep 2021 12:09:57 +1000
Message-Id: <20210901020958.458454-33-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=871df42ed=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Exit early if check_access fails.
Split out do_hlv, do_hsv, do_hlvx subroutines.
Use dest_gpr, get_gpr in the new subroutines.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210823195529.560295-24-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |   1 +
 target/riscv/insn_trans/trans_rvh.c.inc | 266 +++++-------------------
 2 files changed, 57 insertions(+), 210 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index f09f8d5faf..2cd921d51c 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -42,6 +42,7 @@
 &j    imm rd
 &r    rd rs1 rs2
 &r2   rd rs1
+&r2_s rs1 rs2
 &s    imm rs1 rs2
 &u    imm rd
 &shift     shamt rs1 rd
diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_=
trans/trans_rvh.c.inc
index 585eb1d87e..ecbf77ff9c 100644
--- a/target/riscv/insn_trans/trans_rvh.c.inc
+++ b/target/riscv/insn_trans/trans_rvh.c.inc
@@ -17,281 +17,139 @@
  */
=20
 #ifndef CONFIG_USER_ONLY
-static void check_access(DisasContext *ctx) {
+static bool check_access(DisasContext *ctx)
+{
     if (!ctx->hlsx) {
         if (ctx->virt_enabled) {
             generate_exception(ctx, RISCV_EXCP_VIRT_INSTRUCTION_FAULT);
         } else {
             generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
         }
+        return false;
     }
+    return true;
 }
 #endif
=20
-static bool trans_hlv_b(DisasContext *ctx, arg_hlv_b *a)
+static bool do_hlv(DisasContext *ctx, arg_r2 *a, MemOp mop)
 {
-    REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 =3D tcg_temp_new();
-    TCGv t1 =3D tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_M=
ASK, MO_SB);
-    gen_set_gpr(ctx, a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
+#ifdef CONFIG_USER_ONLY
     return false;
+#else
+    if (check_access(ctx)) {
+        TCGv dest =3D dest_gpr(ctx, a->rd);
+        TCGv addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
+        int mem_idx =3D ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+        tcg_gen_qemu_ld_tl(dest, addr, mem_idx, mop);
+        gen_set_gpr(ctx, a->rd, dest);
+    }
+    return true;
 #endif
 }
=20
-static bool trans_hlv_h(DisasContext *ctx, arg_hlv_h *a)
+static bool trans_hlv_b(DisasContext *ctx, arg_hlv_b *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 =3D tcg_temp_new();
-    TCGv t1 =3D tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_M=
ASK, MO_TESW);
-    gen_set_gpr(ctx, a->rd, t1);
+    return do_hlv(ctx, a, MO_SB);
+}
=20
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
-    return false;
-#endif
+static bool trans_hlv_h(DisasContext *ctx, arg_hlv_h *a)
+{
+    REQUIRE_EXT(ctx, RVH);
+    return do_hlv(ctx, a, MO_TESW);
 }
=20
 static bool trans_hlv_w(DisasContext *ctx, arg_hlv_w *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 =3D tcg_temp_new();
-    TCGv t1 =3D tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_M=
ASK, MO_TESL);
-    gen_set_gpr(ctx, a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
-    return false;
-#endif
+    return do_hlv(ctx, a, MO_TESL);
 }
=20
 static bool trans_hlv_bu(DisasContext *ctx, arg_hlv_bu *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 =3D tcg_temp_new();
-    TCGv t1 =3D tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_M=
ASK, MO_UB);
-    gen_set_gpr(ctx, a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
-    return false;
-#endif
+    return do_hlv(ctx, a, MO_UB);
 }
=20
 static bool trans_hlv_hu(DisasContext *ctx, arg_hlv_hu *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 =3D tcg_temp_new();
-    TCGv t1 =3D tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_M=
ASK, MO_TEUW);
-    gen_set_gpr(ctx, a->rd, t1);
+    return do_hlv(ctx, a, MO_TEUW);
+}
=20
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
+static bool do_hsv(DisasContext *ctx, arg_r2_s *a, MemOp mop)
+{
+#ifdef CONFIG_USER_ONLY
     return false;
+#else
+    if (check_access(ctx)) {
+        TCGv addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
+        TCGv data =3D get_gpr(ctx, a->rs2, EXT_NONE);
+        int mem_idx =3D ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+        tcg_gen_qemu_st_tl(data, addr, mem_idx, mop);
+    }
+    return true;
 #endif
 }
=20
 static bool trans_hsv_b(DisasContext *ctx, arg_hsv_b *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 =3D tcg_temp_new();
-    TCGv dat =3D tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-    gen_get_gpr(ctx, dat, a->rs2);
-
-    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_=
MASK, MO_SB);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(dat);
-    return true;
-#else
-    return false;
-#endif
+    return do_hsv(ctx, a, MO_SB);
 }
=20
 static bool trans_hsv_h(DisasContext *ctx, arg_hsv_h *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 =3D tcg_temp_new();
-    TCGv dat =3D tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-    gen_get_gpr(ctx, dat, a->rs2);
-
-    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_=
MASK, MO_TESW);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(dat);
-    return true;
-#else
-    return false;
-#endif
+    return do_hsv(ctx, a, MO_TESW);
 }
=20
 static bool trans_hsv_w(DisasContext *ctx, arg_hsv_w *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 =3D tcg_temp_new();
-    TCGv dat =3D tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-    gen_get_gpr(ctx, dat, a->rs2);
-
-    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_=
MASK, MO_TESL);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(dat);
-    return true;
-#else
-    return false;
-#endif
+    return do_hsv(ctx, a, MO_TESL);
 }
=20
 static bool trans_hlv_wu(DisasContext *ctx, arg_hlv_wu *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVH);
-
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 =3D tcg_temp_new();
-    TCGv t1 =3D tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_M=
ASK, MO_TEUL);
-    gen_set_gpr(ctx, a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
-    return false;
-#endif
+    return do_hlv(ctx, a, MO_TEUL);
 }
=20
 static bool trans_hlv_d(DisasContext *ctx, arg_hlv_d *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVH);
-
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 =3D tcg_temp_new();
-    TCGv t1 =3D tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_M=
ASK, MO_TEQ);
-    gen_set_gpr(ctx, a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
-    return false;
-#endif
+    return do_hlv(ctx, a, MO_TEQ);
 }
=20
 static bool trans_hsv_d(DisasContext *ctx, arg_hsv_d *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVH);
+    return do_hsv(ctx, a, MO_TEQ);
+}
=20
 #ifndef CONFIG_USER_ONLY
-    TCGv t0 =3D tcg_temp_new();
-    TCGv dat =3D tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-    gen_get_gpr(ctx, dat, a->rs2);
-
-    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_=
MASK, MO_TEQ);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(dat);
+static bool do_hlvx(DisasContext *ctx, arg_r2 *a,
+                    void (*func)(TCGv, TCGv_env, TCGv))
+{
+    if (check_access(ctx)) {
+        TCGv dest =3D dest_gpr(ctx, a->rd);
+        TCGv addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
+        func(dest, cpu_env, addr);
+        gen_set_gpr(ctx, a->rd, dest);
+    }
     return true;
-#else
-    return false;
-#endif
 }
+#endif
=20
 static bool trans_hlvx_hu(DisasContext *ctx, arg_hlvx_hu *a)
 {
     REQUIRE_EXT(ctx, RVH);
 #ifndef CONFIG_USER_ONLY
-    TCGv t0 =3D tcg_temp_new();
-    TCGv t1 =3D tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-
-    gen_helper_hyp_hlvx_hu(t1, cpu_env, t0);
-    gen_set_gpr(ctx, a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
+    return do_hlvx(ctx, a, gen_helper_hyp_hlvx_hu);
 #else
     return false;
 #endif
@@ -301,19 +159,7 @@ static bool trans_hlvx_wu(DisasContext *ctx, arg_hlv=
x_wu *a)
 {
     REQUIRE_EXT(ctx, RVH);
 #ifndef CONFIG_USER_ONLY
-    TCGv t0 =3D tcg_temp_new();
-    TCGv t1 =3D tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-
-    gen_helper_hyp_hlvx_wu(t1, cpu_env, t0);
-    gen_set_gpr(ctx, a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
+    return do_hlvx(ctx, a, gen_helper_hyp_hlvx_wu);
 #else
     return false;
 #endif
--=20
2.31.1


