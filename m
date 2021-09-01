Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CC33FD157
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:30:00 +0200 (CEST)
Received: from localhost ([::1]:39116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLG0g-0003WE-DJ
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFjU-00078T-Q1
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:12:10 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:3957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFjS-0000Nj-28
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:12:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462324; x=1661998324;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dKAFS3eheCBnbpb0TnFg9L92fvkeRa2KTdl87DgO4bM=;
 b=r3hM/3dzFffaAUWE+ihYdmm1nqgutT1znIbPUfipY/YGPyYj4VeF9wpf
 4AuI8B1acEz7bgQltjpHKysyUaVe0jeKjxyVMIw8Bh4iRhtOt4/qDKnKU
 rQkaiPFDZuaREJ+nILmdek66tlSnVaxl7PrQtenjLetAsVZnnmCsXCrQG
 97D7zK4JHx+aNssvQmXy4LHYyhsfxsQhWTtLyYWVpxkP+iwqU3p66ARAj
 nsf2kvZBIVkCUiX+m3LxGHHRibytmNV/ITaZ4kIYMaaCN0zU+R4KzFqcp
 /1xY3BdXZUO48gyMQs+LT7UJqy9tBKoza0jF5nQf9nxBI7NnlFQM2gONW w==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="178910814"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:12:03 +0800
IronPort-SDR: OAejA7qXRUmd6Rvasd2urT4+vGOlmynuPuNPw4R1IvgbyRYLf8KcP74EhO7UUcIZqNseLSAk3W
 G7yryK6Z1GQoLyo7hWvUMlnJTXvE1GJk9ojnE41e8juxQ4pBQ4QcIcCfiPZ0r42gsteKXG75Z9
 bEgyztP6j5U9cmCp6PCfxz0I5vfzw7DQp4n0gKSFXMAjqWWKM2jl+WOWTJfXxQQS5+9EoMJtQT
 9ecnYWsKrIt8xui275Gz5OWFvIMnF3CSwTpvyasy4QYJHbqDBhG7ZIbAAjisGeG57RzvNLJ8ae
 eAqSRp4KQQTLqVuuqJia45Za
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:47:10 -0700
IronPort-SDR: flzxiuK6pYs5WY+kfKeyqqgi7hVz1Zf79zTGILfG3p/4PJIXgLFTdAaITQxjOHoyRef86MmLkt
 taYIyqIBsNiZgwYAqZuLUNhRl8vQtXlZa+1eWyuU5Bi6ZQY9Ae8KD0kV2KWabbZtE21RyAsSap
 x5JI9v/7kc7SjLNR1BXrId4cNFE55yk4xVgHnRKH8mnsiyiTjwQUzoPooaK/9v3zwRtW7cUkf+
 60Zc6ouP37n93f/FDuv9FazpoDYf5uBbEUwzkrNiSCkHeAhqzQLqYB85PMOlEROT/Ne1QAh/on
 DIc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:12:04 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Gzncg6jJmz1RvmF
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:12:03 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1630462318; x=1633054319; bh=dKAFS3e
 heCBnbpb0TnFg9L92fvkeRa2KTdl87DgO4bM=; b=EL8qgNWGGjj59UhkG5bhCM+
 L1k4nIdy6yx62oJ1xP4Lr4RgpFWCVxxvS2e/x++0GhTe6cC8psSz+tBj/DviSeDZ
 XfyWQ+qSQtiP+azi4dhclR7f3PDpc/el/T1wV0bnb+HEJdEVx6tSqLBcv4igMFPh
 5+OlWA9i9CRus8K3AOVtKETC/QLjntuV/FPHTomfEl8eyYhOa6FxKbmnoKHO4gwT
 TdzwftkKZzstrpGDRnRpX7HX1Rxr4Udx2filiLJxXYQ9PX2xcESE7IT5gMn9NX1u
 ZptgiaiVCtATkAcG7pINgEnlViQQAwm3x6OMD7n3Jpd6GIfOukRUQd/11jNghAA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id n7OBV5HRJI8t for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:11:58 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4GzncS6BWYz1Rvm1;
 Tue, 31 Aug 2021 19:11:52 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 19/33] target/riscv: Move gen_* helpers for RVB
Date: Wed,  1 Sep 2021 12:09:44 +1000
Message-Id: <20210901020958.458454-20-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Move these helpers near their use by the trans_*
functions within insn_trans/trans_rvb.c.inc.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210823195529.560295-11-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c                | 233 -----------------------
 target/riscv/insn_trans/trans_rvb.c.inc | 234 ++++++++++++++++++++++++
 2 files changed, 234 insertions(+), 233 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 7fbacfa6ee..09853530c4 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -380,229 +380,6 @@ static bool gen_arith_imm_tl(DisasContext *ctx, arg=
_i *a, DisasExtend ext,
     return true;
 }
=20
-static void gen_pack(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_deposit_tl(ret, arg1, arg2,
-                       TARGET_LONG_BITS / 2,
-                       TARGET_LONG_BITS / 2);
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
-static void gen_packh(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    TCGv t =3D tcg_temp_new();
-    tcg_gen_ext8u_tl(t, arg2);
-    tcg_gen_deposit_tl(ret, arg1, t, 8, TARGET_LONG_BITS - 8);
-    tcg_temp_free(t);
-}
-
-static void gen_sbop_mask(TCGv ret, TCGv shamt)
-{
-    tcg_gen_movi_tl(ret, 1);
-    tcg_gen_shl_tl(ret, ret, shamt);
-}
-
-static void gen_bset(TCGv ret, TCGv arg1, TCGv shamt)
-{
-    TCGv t =3D tcg_temp_new();
-
-    gen_sbop_mask(t, shamt);
-    tcg_gen_or_tl(ret, arg1, t);
-
-    tcg_temp_free(t);
-}
-
-static void gen_bclr(TCGv ret, TCGv arg1, TCGv shamt)
-{
-    TCGv t =3D tcg_temp_new();
-
-    gen_sbop_mask(t, shamt);
-    tcg_gen_andc_tl(ret, arg1, t);
-
-    tcg_temp_free(t);
-}
-
-static void gen_binv(TCGv ret, TCGv arg1, TCGv shamt)
-{
-    TCGv t =3D tcg_temp_new();
-
-    gen_sbop_mask(t, shamt);
-    tcg_gen_xor_tl(ret, arg1, t);
-
-    tcg_temp_free(t);
-}
-
-static void gen_bext(TCGv ret, TCGv arg1, TCGv shamt)
-{
-    tcg_gen_shr_tl(ret, arg1, shamt);
-    tcg_gen_andi_tl(ret, ret, 1);
-}
-
-static void gen_slo(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_not_tl(ret, arg1);
-    tcg_gen_shl_tl(ret, ret, arg2);
-    tcg_gen_not_tl(ret, ret);
-}
-
-static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_not_tl(ret, arg1);
-    tcg_gen_shr_tl(ret, ret, arg2);
-    tcg_gen_not_tl(ret, ret);
-}
-
-static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
-{
-    TCGv source1 =3D tcg_temp_new();
-    TCGv source2;
-
-    gen_get_gpr(ctx, source1, a->rs1);
-
-    if (a->shamt =3D=3D (TARGET_LONG_BITS - 8)) {
-        /* rev8, byte swaps */
-        tcg_gen_bswap_tl(source1, source1);
-    } else {
-        source2 =3D tcg_temp_new();
-        tcg_gen_movi_tl(source2, a->shamt);
-        gen_helper_grev(source1, source1, source2);
-        tcg_temp_free(source2);
-    }
-
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    return true;
-}
-
-#define GEN_SHADD(SHAMT)                                       \
-static void gen_sh##SHAMT##add(TCGv ret, TCGv arg1, TCGv arg2) \
-{                                                              \
-    TCGv t =3D tcg_temp_new();                                   \
-                                                               \
-    tcg_gen_shli_tl(t, arg1, SHAMT);                           \
-    tcg_gen_add_tl(ret, t, arg2);                              \
-                                                               \
-    tcg_temp_free(t);                                          \
-}
-
-GEN_SHADD(1)
-GEN_SHADD(2)
-GEN_SHADD(3)
-
-static void gen_ctzw(TCGv ret, TCGv arg1)
-{
-    tcg_gen_ori_tl(ret, arg1, (target_ulong)MAKE_64BIT_MASK(32, 32));
-    tcg_gen_ctzi_tl(ret, ret, 64);
-}
-
-static void gen_clzw(TCGv ret, TCGv arg1)
-{
-    tcg_gen_ext32u_tl(ret, arg1);
-    tcg_gen_clzi_tl(ret, ret, 64);
-    tcg_gen_subi_tl(ret, ret, 32);
-}
-
-static void gen_cpopw(TCGv ret, TCGv arg1)
-{
-    tcg_gen_ext32u_tl(arg1, arg1);
-    tcg_gen_ctpop_tl(ret, arg1);
-}
-
-static void gen_packw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    TCGv t =3D tcg_temp_new();
-    tcg_gen_ext16s_tl(t, arg2);
-    tcg_gen_deposit_tl(ret, arg1, t, 16, 48);
-    tcg_temp_free(t);
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
-static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    TCGv_i32 t1 =3D tcg_temp_new_i32();
-    TCGv_i32 t2 =3D tcg_temp_new_i32();
-
-    /* truncate to 32-bits */
-    tcg_gen_trunc_tl_i32(t1, arg1);
-    tcg_gen_trunc_tl_i32(t2, arg2);
-
-    tcg_gen_rotr_i32(t1, t1, t2);
-
-    /* sign-extend 64-bits */
-    tcg_gen_ext_i32_tl(ret, t1);
-
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t2);
-}
-
-static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    TCGv_i32 t1 =3D tcg_temp_new_i32();
-    TCGv_i32 t2 =3D tcg_temp_new_i32();
-
-    /* truncate to 32-bits */
-    tcg_gen_trunc_tl_i32(t1, arg1);
-    tcg_gen_trunc_tl_i32(t2, arg2);
-
-    tcg_gen_rotl_i32(t1, t1, t2);
-
-    /* sign-extend 64-bits */
-    tcg_gen_ext_i32_tl(ret, t1);
-
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t2);
-}
-
-static void gen_grevw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_ext32u_tl(arg1, arg1);
-    gen_helper_grev(ret, arg1, arg2);
-}
-
-static void gen_gorcw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_ext32u_tl(arg1, arg1);
-    gen_helper_gorcw(ret, arg1, arg2);
-}
-
-#define GEN_SHADD_UW(SHAMT)                                       \
-static void gen_sh##SHAMT##add_uw(TCGv ret, TCGv arg1, TCGv arg2) \
-{                                                                 \
-    TCGv t =3D tcg_temp_new();                                      \
-                                                                  \
-    tcg_gen_ext32u_tl(t, arg1);                                   \
-                                                                  \
-    tcg_gen_shli_tl(t, t, SHAMT);                                 \
-    tcg_gen_add_tl(ret, t, arg2);                                 \
-                                                                  \
-    tcg_temp_free(t);                                             \
-}
-
-GEN_SHADD_UW(1)
-GEN_SHADD_UW(2)
-GEN_SHADD_UW(3)
-
-static void gen_add_uw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_ext32u_tl(arg1, arg1);
-    tcg_gen_add_tl(ret, arg1, arg2);
-}
-
 static bool gen_arith(DisasContext *ctx, arg_r *a, DisasExtend ext,
                       void (*func)(TCGv, TCGv, TCGv))
 {
@@ -701,16 +478,6 @@ static bool gen_shiftiw(DisasContext *ctx, arg_shift=
 *a,
     return true;
 }
=20
-static void gen_ctz(TCGv ret, TCGv arg1)
-{
-    tcg_gen_ctzi_tl(ret, arg1, TARGET_LONG_BITS);
-}
-
-static void gen_clz(TCGv ret, TCGv arg1)
-{
-    tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
-}
-
 static bool gen_unary(DisasContext *ctx, arg_r2 *a,
                       void(*func)(TCGv, TCGv))
 {
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index 217a7d1f26..73f088be23 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -17,12 +17,23 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
=20
+
+static void gen_clz(TCGv ret, TCGv arg1)
+{
+    tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
+}
+
 static bool trans_clz(DisasContext *ctx, arg_clz *a)
 {
     REQUIRE_EXT(ctx, RVB);
     return gen_unary(ctx, a, gen_clz);
 }
=20
+static void gen_ctz(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ctzi_tl(ret, arg1, TARGET_LONG_BITS);
+}
+
 static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
 {
     REQUIRE_EXT(ctx, RVB);
@@ -53,18 +64,41 @@ static bool trans_xnor(DisasContext *ctx, arg_xnor *a=
)
     return gen_arith(ctx, a, EXT_NONE, tcg_gen_eqv_tl);
 }
=20
+static void gen_pack(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_deposit_tl(ret, arg1, arg2,
+                       TARGET_LONG_BITS / 2,
+                       TARGET_LONG_BITS / 2);
+}
+
 static bool trans_pack(DisasContext *ctx, arg_pack *a)
 {
     REQUIRE_EXT(ctx, RVB);
     return gen_arith(ctx, a, EXT_NONE, gen_pack);
 }
=20
+static void gen_packu(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t =3D tcg_temp_new();
+    tcg_gen_shri_tl(t, arg1, TARGET_LONG_BITS / 2);
+    tcg_gen_deposit_tl(ret, arg2, t, 0, TARGET_LONG_BITS / 2);
+    tcg_temp_free(t);
+}
+
 static bool trans_packu(DisasContext *ctx, arg_packu *a)
 {
     REQUIRE_EXT(ctx, RVB);
     return gen_arith(ctx, a, EXT_NONE, gen_packu);
 }
=20
+static void gen_packh(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t =3D tcg_temp_new();
+    tcg_gen_ext8u_tl(t, arg2);
+    tcg_gen_deposit_tl(ret, arg1, t, 8, TARGET_LONG_BITS - 8);
+    tcg_temp_free(t);
+}
+
 static bool trans_packh(DisasContext *ctx, arg_packh *a)
 {
     REQUIRE_EXT(ctx, RVB);
@@ -107,6 +141,22 @@ static bool trans_sext_h(DisasContext *ctx, arg_sext=
_h *a)
     return gen_unary(ctx, a, tcg_gen_ext16s_tl);
 }
=20
+static void gen_sbop_mask(TCGv ret, TCGv shamt)
+{
+    tcg_gen_movi_tl(ret, 1);
+    tcg_gen_shl_tl(ret, ret, shamt);
+}
+
+static void gen_bset(TCGv ret, TCGv arg1, TCGv shamt)
+{
+    TCGv t =3D tcg_temp_new();
+
+    gen_sbop_mask(t, shamt);
+    tcg_gen_or_tl(ret, arg1, t);
+
+    tcg_temp_free(t);
+}
+
 static bool trans_bset(DisasContext *ctx, arg_bset *a)
 {
     REQUIRE_EXT(ctx, RVB);
@@ -119,6 +169,16 @@ static bool trans_bseti(DisasContext *ctx, arg_bseti=
 *a)
     return gen_shifti(ctx, a, gen_bset);
 }
=20
+static void gen_bclr(TCGv ret, TCGv arg1, TCGv shamt)
+{
+    TCGv t =3D tcg_temp_new();
+
+    gen_sbop_mask(t, shamt);
+    tcg_gen_andc_tl(ret, arg1, t);
+
+    tcg_temp_free(t);
+}
+
 static bool trans_bclr(DisasContext *ctx, arg_bclr *a)
 {
     REQUIRE_EXT(ctx, RVB);
@@ -131,6 +191,16 @@ static bool trans_bclri(DisasContext *ctx, arg_bclri=
 *a)
     return gen_shifti(ctx, a, gen_bclr);
 }
=20
+static void gen_binv(TCGv ret, TCGv arg1, TCGv shamt)
+{
+    TCGv t =3D tcg_temp_new();
+
+    gen_sbop_mask(t, shamt);
+    tcg_gen_xor_tl(ret, arg1, t);
+
+    tcg_temp_free(t);
+}
+
 static bool trans_binv(DisasContext *ctx, arg_binv *a)
 {
     REQUIRE_EXT(ctx, RVB);
@@ -143,6 +213,12 @@ static bool trans_binvi(DisasContext *ctx, arg_binvi=
 *a)
     return gen_shifti(ctx, a, gen_binv);
 }
=20
+static void gen_bext(TCGv ret, TCGv arg1, TCGv shamt)
+{
+    tcg_gen_shr_tl(ret, arg1, shamt);
+    tcg_gen_andi_tl(ret, ret, 1);
+}
+
 static bool trans_bext(DisasContext *ctx, arg_bext *a)
 {
     REQUIRE_EXT(ctx, RVB);
@@ -155,6 +231,13 @@ static bool trans_bexti(DisasContext *ctx, arg_bexti=
 *a)
     return gen_shifti(ctx, a, gen_bext);
 }
=20
+static void gen_slo(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_not_tl(ret, arg1);
+    tcg_gen_shl_tl(ret, ret, arg2);
+    tcg_gen_not_tl(ret, ret);
+}
+
 static bool trans_slo(DisasContext *ctx, arg_slo *a)
 {
     REQUIRE_EXT(ctx, RVB);
@@ -167,6 +250,13 @@ static bool trans_sloi(DisasContext *ctx, arg_sloi *=
a)
     return gen_shifti(ctx, a, gen_slo);
 }
=20
+static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_not_tl(ret, arg1);
+    tcg_gen_shr_tl(ret, ret, arg2);
+    tcg_gen_not_tl(ret, ret);
+}
+
 static bool trans_sro(DisasContext *ctx, arg_sro *a)
 {
     REQUIRE_EXT(ctx, RVB);
@@ -203,6 +293,28 @@ static bool trans_grev(DisasContext *ctx, arg_grev *=
a)
     return gen_shift(ctx, a, gen_helper_grev);
 }
=20
+static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
+{
+    TCGv source1 =3D tcg_temp_new();
+    TCGv source2;
+
+    gen_get_gpr(ctx, source1, a->rs1);
+
+    if (a->shamt =3D=3D (TARGET_LONG_BITS - 8)) {
+        /* rev8, byte swaps */
+        tcg_gen_bswap_tl(source1, source1);
+    } else {
+        source2 =3D tcg_temp_new();
+        tcg_gen_movi_tl(source2, a->shamt);
+        gen_helper_grev(source1, source1, source2);
+        tcg_temp_free(source2);
+    }
+
+    gen_set_gpr(ctx, a->rd, source1);
+    tcg_temp_free(source1);
+    return true;
+}
+
 static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
 {
     REQUIRE_EXT(ctx, RVB);
@@ -226,6 +338,21 @@ static bool trans_gorci(DisasContext *ctx, arg_gorci=
 *a)
     return gen_shifti(ctx, a, gen_helper_gorc);
 }
=20
+#define GEN_SHADD(SHAMT)                                       \
+static void gen_sh##SHAMT##add(TCGv ret, TCGv arg1, TCGv arg2) \
+{                                                              \
+    TCGv t =3D tcg_temp_new();                                   \
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
 #define GEN_TRANS_SHADD(SHAMT)                                          =
   \
 static bool trans_sh##SHAMT##add(DisasContext *ctx, arg_sh##SHAMT##add *=
a) \
 {                                                                       =
   \
@@ -237,6 +364,13 @@ GEN_TRANS_SHADD(1)
 GEN_TRANS_SHADD(2)
 GEN_TRANS_SHADD(3)
=20
+static void gen_clzw(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ext32u_tl(ret, arg1);
+    tcg_gen_clzi_tl(ret, ret, 64);
+    tcg_gen_subi_tl(ret, ret, 32);
+}
+
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -244,6 +378,12 @@ static bool trans_clzw(DisasContext *ctx, arg_clzw *=
a)
     return gen_unary(ctx, a, gen_clzw);
 }
=20
+static void gen_ctzw(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ori_tl(ret, arg1, (target_ulong)MAKE_64BIT_MASK(32, 32));
+    tcg_gen_ctzi_tl(ret, ret, 64);
+}
+
 static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -251,6 +391,12 @@ static bool trans_ctzw(DisasContext *ctx, arg_ctzw *=
a)
     return gen_unary(ctx, a, gen_ctzw);
 }
=20
+static void gen_cpopw(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    tcg_gen_ctpop_tl(ret, arg1);
+}
+
 static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -258,6 +404,14 @@ static bool trans_cpopw(DisasContext *ctx, arg_cpopw=
 *a)
     return gen_unary(ctx, a, gen_cpopw);
 }
=20
+static void gen_packw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t =3D tcg_temp_new();
+    tcg_gen_ext16s_tl(t, arg2);
+    tcg_gen_deposit_tl(ret, arg1, t, 16, 48);
+    tcg_temp_free(t);
+}
+
 static bool trans_packw(DisasContext *ctx, arg_packw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -265,6 +419,15 @@ static bool trans_packw(DisasContext *ctx, arg_packw=
 *a)
     return gen_arith(ctx, a, EXT_NONE, gen_packw);
 }
=20
+static void gen_packuw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t =3D tcg_temp_new();
+    tcg_gen_shri_tl(t, arg1, 16);
+    tcg_gen_deposit_tl(ret, arg2, t, 0, 16);
+    tcg_gen_ext32s_tl(ret, ret);
+    tcg_temp_free(t);
+}
+
 static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -349,6 +512,24 @@ static bool trans_sroiw(DisasContext *ctx, arg_sroiw=
 *a)
     return gen_shiftiw(ctx, a, gen_sro);
 }
=20
+static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv_i32 t1 =3D tcg_temp_new_i32();
+    TCGv_i32 t2 =3D tcg_temp_new_i32();
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
 static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -363,6 +544,24 @@ static bool trans_roriw(DisasContext *ctx, arg_roriw=
 *a)
     return gen_shiftiw(ctx, a, gen_rorw);
 }
=20
+static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv_i32 t1 =3D tcg_temp_new_i32();
+    TCGv_i32 t2 =3D tcg_temp_new_i32();
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
 static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -370,6 +569,12 @@ static bool trans_rolw(DisasContext *ctx, arg_rolw *=
a)
     return gen_shiftw(ctx, a, gen_rolw);
 }
=20
+static void gen_grevw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    gen_helper_grev(ret, arg1, arg2);
+}
+
 static bool trans_grevw(DisasContext *ctx, arg_grevw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -384,6 +589,12 @@ static bool trans_greviw(DisasContext *ctx, arg_grev=
iw *a)
     return gen_shiftiw(ctx, a, gen_grevw);
 }
=20
+static void gen_gorcw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    gen_helper_gorcw(ret, arg1, arg2);
+}
+
 static bool trans_gorcw(DisasContext *ctx, arg_gorcw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -398,6 +609,23 @@ static bool trans_gorciw(DisasContext *ctx, arg_gorc=
iw *a)
     return gen_shiftiw(ctx, a, gen_gorcw);
 }
=20
+#define GEN_SHADD_UW(SHAMT)                                       \
+static void gen_sh##SHAMT##add_uw(TCGv ret, TCGv arg1, TCGv arg2) \
+{                                                                 \
+    TCGv t =3D tcg_temp_new();                                      \
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
 #define GEN_TRANS_SHADD_UW(SHAMT)                             \
 static bool trans_sh##SHAMT##add_uw(DisasContext *ctx,        \
                                     arg_sh##SHAMT##add_uw *a) \
@@ -411,6 +639,12 @@ GEN_TRANS_SHADD_UW(1)
 GEN_TRANS_SHADD_UW(2)
 GEN_TRANS_SHADD_UW(3)
=20
+static void gen_add_uw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    tcg_gen_add_tl(ret, arg1, arg2);
+}
+
 static bool trans_add_uw(DisasContext *ctx, arg_add_uw *a)
 {
     REQUIRE_64BIT(ctx);
--=20
2.31.1


