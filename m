Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 849DD424DB8
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 09:08:59 +0200 (CEST)
Received: from localhost ([::1]:60304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNWU-0000Ox-Ig
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 03:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNDf-0004M9-On
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:49:32 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:53914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNDc-0006R5-L2
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:49:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633589368; x=1665125368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=atZuZvyi319thSSUWTro/5GAyHJXvG/Dh+TK2Y41ChA=;
 b=iLlWiemSLiRDMYptL06TvJOhRwYO3C64n+tFsl/U2PqiezFUX1ODq3tV
 TqvylPazqsZbKRF1fRYNiWP7ITz4aGPfgGMPheliAdz/OO334CATAcMNo
 SEIIW3CXDJGnBh3xyNGohSuFgmP4zq0GL/POHm8YG/T9C4+8s+6s6gJ5Y
 VXYkTsSI3IqtBGLHVniMeH2KU0KcrswwQWWdbMNFIspAECh7rOdFhhArs
 GRNaw9zXUm56Ng9ZucNEnvkKCMc4S1A+2IOeyIJLJdtwzmicsRXwV/Me8
 8mAx2b/mCmaRkXRo4Ga9unNQiBL+UEI66N2QLl+XkemOfreeIk46Z0iYi Q==;
X-IronPort-AV: E=Sophos;i="5.85,352,1624291200"; d="scan'208";a="293815494"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2021 14:49:26 +0800
IronPort-SDR: Eiypy/RjVR+1L+mbg7UOS0FXwl6GIdmunGMsk94/ALeh8600K0PW/CGmZsWEDFzEOHnkSVdzPc
 Wq4kSFmrD26g81QleBXTEurH0U8fyJ+XwHN2VoxliKg2NxuLCyJNwGCBOYPdQcwZVhoEN4sDka
 zZ5bfkGQiE1VSU8UZZVnnhNX2gp+Nmh0S+zEYSuNXgIaMvn0Q/tL5qeFThqF3QtGpSd6s/01R+
 +E1T+fvrewPiqh1CI3HQ2AS400FdrcQQNz5ojFUmF69NLWfdHdTwXqRTYloDMG8R6hvSrnFQyH
 ukOAbB5KsUrRZF6/VbSLHUWA
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:23:47 -0700
IronPort-SDR: Ni+9b2YOYac73DUZD59dho0t3ikuwTiehNr/qn1u3BkPe3QVZX1HAkjdwM1sDCOYN8reJfGQFr
 2MRQzLtHKTMriDmysNOvV2GyluSzadueAUdUejCizmA4MMBgwMExFuM86zicWDftmrO/BJtmEu
 stYUu/fkMnYtUwymIEGHTvvP0WwLbmMtlDOhk3TnmQqnscMe6B8dOmCl6VzK4Loghl4Lc5sRvx
 sBxYnL5l0bi5pg6N66pwe0XujY9D8zievyA4hR2vJspIYgVhu7Cv4JDEEBHeUBcrD0X0fX2Ou7
 0bI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:49:27 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HQ24622yfz1Rvlt
 for <qemu-devel@nongnu.org>; Wed,  6 Oct 2021 23:49:26 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1633589365; x=1636181366; bh=atZuZvyi319thSSUWT
 ro/5GAyHJXvG/Dh+TK2Y41ChA=; b=loJ8zAVZzQks30+SvlLQOOGNStMwV3XWq3
 cAanBaSVMc3e0p6GAQHJ0+zxIC6w/gVd50iar4sOpJqb55za36rQBAV7jPAQjl/v
 HvuCT6O3gr8NMDvPp4biD1Te0jrSKwLW/FGVnxCKepVortMRL2U+R8Z3yEu5M6ik
 5ws/c3e3/Q1nCBgNj6Wfg6Q7SbJ07oUGxMIe69clcBUbIh2e/uZusyiFCEhGZT9e
 4wNhJptqhunTJrme47aLnj6s95p939doHWk5tDZ50PaYhCMJ9PCennmHeOSAx4OV
 R9cxksk+NTBzXKjZVV49AzO48rTsgeeznhHhzsTDZiM20DeCybog==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id mT8H7PdRDN2k for <qemu-devel@nongnu.org>;
 Wed,  6 Oct 2021 23:49:25 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.32])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HQ2411Fclz1RvTg;
 Wed,  6 Oct 2021 23:49:20 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 14/26] target/riscv: Add zext.h instructions to Zbb,
 removing pack/packu/packh
Date: Thu,  7 Oct 2021 16:47:39 +1000
Message-Id: <20211007064751.608580-15-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=907902f29=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

The 1.0.0 version of Zbb does not contain pack/packu/packh. However, a
zext.h instruction is provided (built on pack/packh from pre-0.93
draft-B) is available.

This commit adds zext.h and removes the pack* instructions.

Note that the encodings for zext.h are different between RV32 and
RV64, which is handled through REQUIRE_32BIT.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210911140016.834071-15-philipp.tomsich@vrull.eu
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              | 12 ++--
 target/riscv/insn_trans/trans_rvb.c.inc | 86 ++++---------------------
 2 files changed, 21 insertions(+), 77 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 901a66c0f5..affb99b3e6 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -692,6 +692,9 @@ rori       01100 ............ 101 ..... 0010011 @sh
 sext_b     011000 000100 ..... 001 ..... 0010011 @r2
 sext_h     011000 000101 ..... 001 ..... 0010011 @r2
 xnor       0100000 .......... 100 ..... 0110011 @r
+# The encoding for zext.h differs between RV32 and RV64.
+# zext_h_32 denotes the RV32 variant.
+zext_h_32  0000100 00000 ..... 100 ..... 0110011 @r2
=20
 # *** RV64 Zbb Standard Extension (in addition to RV32 Zbb) ***
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
@@ -704,15 +707,14 @@ rev8_64    011010 111000 ..... 101 ..... 0010011 @r=
2
 rolw       0110000 .......... 001 ..... 0111011 @r
 roriw      0110000 .......... 101 ..... 0011011 @sh5
 rorw       0110000 .......... 101 ..... 0111011 @r
+# The encoding for zext.h differs between RV32 and RV64.
+# When executing on RV64, the encoding used in RV32 is an illegal
+# instruction, so we use different handler functions to differentiate.
+zext_h_64  0000100 00000 ..... 100 ..... 0111011 @r2
=20
 # *** RV32B Standard Extension ***
-pack       0000100 .......... 100 ..... 0110011 @r
-packu      0100100 .......... 100 ..... 0110011 @r
-packh      0000100 .......... 111 ..... 0110011 @r
=20
 # *** RV64B Standard Extension (in addition to RV32B) ***
-packw      0000100 .......... 100 ..... 0111011 @r
-packuw     0100100 .......... 100 ..... 0111011 @r
=20
 # *** RV32 Zbc Standard Extension ***
 clmul      0000101 .......... 001 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index 48a7c9ca5e..185c3e9a60 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -88,47 +88,6 @@ static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
     return gen_arith(ctx, a, EXT_NONE, tcg_gen_eqv_tl);
 }
=20
-static void gen_pack(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_deposit_tl(ret, arg1, arg2,
-                       TARGET_LONG_BITS / 2,
-                       TARGET_LONG_BITS / 2);
-}
-
-static bool trans_pack(DisasContext *ctx, arg_pack *a)
-{
-    REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, EXT_NONE, gen_pack);
-}
-
-static void gen_packu(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    TCGv t =3D tcg_temp_new();
-    tcg_gen_shri_tl(t, arg1, TARGET_LONG_BITS / 2);
-    tcg_gen_deposit_tl(ret, arg2, t, 0, TARGET_LONG_BITS / 2);
-    tcg_temp_free(t);
-}
-
-static bool trans_packu(DisasContext *ctx, arg_packu *a)
-{
-    REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, EXT_NONE, gen_packu);
-}
-
-static void gen_packh(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    TCGv t =3D tcg_temp_new();
-    tcg_gen_ext8u_tl(t, arg2);
-    tcg_gen_deposit_tl(ret, arg1, t, 8, TARGET_LONG_BITS - 8);
-    tcg_temp_free(t);
-}
-
-static bool trans_packh(DisasContext *ctx, arg_packh *a)
-{
-    REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, EXT_NONE, gen_packh);
-}
-
 static bool trans_min(DisasContext *ctx, arg_min *a)
 {
     REQUIRE_ZBB(ctx);
@@ -336,6 +295,20 @@ GEN_TRANS_SHADD(1)
 GEN_TRANS_SHADD(2)
 GEN_TRANS_SHADD(3)
=20
+static bool trans_zext_h_32(DisasContext *ctx, arg_zext_h_32 *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZBB(ctx);
+    return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext16u_tl);
+}
+
+static bool trans_zext_h_64(DisasContext *ctx, arg_zext_h_64 *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZBB(ctx);
+    return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext16u_tl);
+}
+
 static void gen_clzw(TCGv ret, TCGv arg1)
 {
     TCGv t =3D tcg_temp_new();
@@ -372,37 +345,6 @@ static bool trans_cpopw(DisasContext *ctx, arg_cpopw=
 *a)
     return gen_unary(ctx, a, EXT_ZERO, tcg_gen_ctpop_tl);
 }
=20
-static void gen_packw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    TCGv t =3D tcg_temp_new();
-    tcg_gen_ext16s_tl(t, arg2);
-    tcg_gen_deposit_tl(ret, arg1, t, 16, 48);
-    tcg_temp_free(t);
-}
-
-static bool trans_packw(DisasContext *ctx, arg_packw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, EXT_NONE, gen_packw);
-}
-
-static void gen_packuw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    TCGv t =3D tcg_temp_new();
-    tcg_gen_shri_tl(t, arg1, 16);
-    tcg_gen_deposit_tl(ret, arg2, t, 0, 16);
-    tcg_gen_ext32s_tl(ret, ret);
-    tcg_temp_free(t);
-}
-
-static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, EXT_NONE, gen_packuw);
-}
-
 static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
 {
     TCGv_i32 t1 =3D tcg_temp_new_i32();
--=20
2.31.1


