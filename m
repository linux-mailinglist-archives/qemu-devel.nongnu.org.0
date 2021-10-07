Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8711D424DA4
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 09:02:58 +0200 (CEST)
Received: from localhost ([::1]:44052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNQf-0006PE-Ii
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 03:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNDY-0004F0-RV
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:49:24 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:14598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNDV-0006IC-Le
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:49:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633589362; x=1665125362;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oi5NmUScCwSuMReGSzJU2UC4FdFVR6J7RpXVFRRyjwQ=;
 b=bDCbmgn82YmkGUMRv1EZV30ShNAbAuOXfuZKXP8VZC/z/5mU1jqVpC/P
 dvurCwLhbFAI/HxOt7RYAtT5BqDwmVj90viCnkC8ExpgEFTI+wydg/c2V
 hyhXpuCisq53xV+4zfTeldfuHyuJxaPFg+ltXt4Q+e0UT0bZrO3tm6QKC
 WpkWGG1T9ic0XnvvKCzSwo2oaK7sGMIAAwdG/bGsf0aNqncQOVmWqBTNX
 teL/DPZ4fcObLMscF7YrZIeaof/8YsZAvGnnEBY+QbxMdZgPDkOqgAHsY
 gnhF6+kxWN+v1g+YUhd854Pvpp9LV9tzVeD5Pr8XoKQfv2+mXJBLQV5gh Q==;
X-IronPort-AV: E=Sophos;i="5.85,352,1624291200"; d="scan'208";a="182849377"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2021 14:49:21 +0800
IronPort-SDR: upDjBujjcsHSgepIncW6FOkrE5sNrZyahhvrXz0cNmG6Prn4FiVKWQfWfBuUy4XM+St7rzAzAD
 6EdnKyi/Ma8OgJlPzzJFUo+yGHRVbJFuyMMHlfseoMJeDTncH7OoGMsjHRUJHmt59JUxDXtoxR
 z3aOneOP/DLPEIfLU6PKZDPuiCU7gJPoBL6u9AcEwFxJjmp+2/MaLRKD/vdwGF5F+/WjxPD8Uq
 DkV0Pm+t7cFUKUOoesbalyARyyRPA3YfDKx/NZLX2/SW+zAvl3HQeLMyjGQ+CzllHJ+cyGnkSU
 n3cH6FOhQqb8COVOMUH42zIJ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:25:14 -0700
IronPort-SDR: pxMSNpWUBUgcTJCirTpBPFnk9NwOtyojN60zSmgvGQ+/Rh0gNhGrsdMgkciV/ZoK0DBKO/EfyV
 6VFrm02ftV4vOSDmRhW2/is1uaxOFue1lev4yYv/nS24W6Qwb5DSuVehMcvdf11dpTVllYyP+F
 veWNX5v7WwLXeqm/9gl5BUfIEf8FQ4RJC4Gne62uPRNE/05NIo08WnqkfMhiWJACtv3/rCg5dO
 RKltc039Nj9gbVjNn/B+YGNXeYZQesgtc7fgID3L5rz69y8UitZt+8KcIhGUXge3eBQPsdwAkU
 hm4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:49:21 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HQ2404sXYz1Rvll
 for <qemu-devel@nongnu.org>; Wed,  6 Oct 2021 23:49:20 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1633589360; x=1636181361; bh=oi5NmUScCwSuMReGSz
 JU2UC4FdFVR6J7RpXVFRRyjwQ=; b=mUyzMkt9ns6hDKVtHdLrVnGcURKJ84lXIc
 eh82DxBGk2XsNUT5ONxKgsijO5fgbmG8P5jBUNbp+Amlo2Ei6/tq+xLPBKAuex66
 T0uPSJhMTZ5fPOIdnQjAIuswRNTJY0FRb1ef30/rpa3B+m4QOro3NYmBlBhBlYjW
 UUWNQiaEURbxD2q66uiRtLCK24nfqWZ/2Uso+sT9+Znpu2jI2vZN1V8U+f/1VYBp
 nwgAtN13My4A/dfDr6uvuRBk8biBlxkn68zHWcn53zFvG+LZfu0UgTgWyw3QJUKc
 7vfbSUZorfBDrQZx1GSKHAELPzCyQm5S4Rb8ecNCpCcsUwdes0Jg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id F963aLNC1sFs for <qemu-devel@nongnu.org>;
 Wed,  6 Oct 2021 23:49:20 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.32])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HQ23w2N7Nz1RvTg;
 Wed,  6 Oct 2021 23:49:15 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 13/26] target/riscv: Add rev8 instruction, removing grev/grevi
Date: Thu,  7 Oct 2021 16:47:38 +1000
Message-Id: <20211007064751.608580-14-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=907902f29=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

The 1.0.0 version of Zbb does not contain grev/grevi.  Instead, a
rev8 instruction (equivalent to the rev8 pseudo-instruction built on
grevi from pre-0.93 draft-B) is available.

This commit adds the new rev8 instruction and removes grev/grevi.

Note that there is no W-form of this instruction (both a
sign-extending and zero-extending 32-bit version can easily be
synthesized by following rev8 with either a srai or srli instruction
on RV64) and that the opcode encodings for rev8 in RV32 and RV64 are
different.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210911140016.834071-14-philipp.tomsich@vrull.eu
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  2 --
 target/riscv/insn32.decode              | 12 ++++----
 target/riscv/bitmanip_helper.c          | 40 -------------------------
 target/riscv/insn_trans/trans_rvb.c.inc | 40 +++++--------------------
 4 files changed, 15 insertions(+), 79 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index a9bda2c8ac..c7a5376227 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -59,8 +59,6 @@ DEF_HELPER_FLAGS_2(fcvt_d_lu, TCG_CALL_NO_RWG, i64, env=
, tl)
 DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
=20
 /* Bitmanip */
-DEF_HELPER_FLAGS_2(grev, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(grevw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(clmul, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, tl)
=20
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 59202196dc..901a66c0f5 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -683,6 +683,9 @@ min        0000101 .......... 100 ..... 0110011 @r
 minu       0000101 .......... 101 ..... 0110011 @r
 orc_b      001010 000111 ..... 101 ..... 0010011 @r2
 orn        0100000 .......... 110 ..... 0110011 @r
+# The encoding for rev8 differs between RV32 and RV64.
+# rev8_32 denotes the RV32 variant.
+rev8_32    011010 011000 ..... 101 ..... 0010011 @r2
 rol        0110000 .......... 001 ..... 0110011 @r
 ror        0110000 .......... 101 ..... 0110011 @r
 rori       01100 ............ 101 ..... 0010011 @sh
@@ -694,6 +697,10 @@ xnor       0100000 .......... 100 ..... 0110011 @r
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
 ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
 cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
+# The encoding for rev8 differs between RV32 and RV64.
+# When executing on RV64, the encoding used in RV32 is an illegal
+# instruction, so we use different handler functions to differentiate.
+rev8_64    011010 111000 ..... 101 ..... 0010011 @r2
 rolw       0110000 .......... 001 ..... 0111011 @r
 roriw      0110000 .......... 101 ..... 0011011 @sh5
 rorw       0110000 .......... 101 ..... 0111011 @r
@@ -702,15 +709,10 @@ rorw       0110000 .......... 101 ..... 0111011 @r
 pack       0000100 .......... 100 ..... 0110011 @r
 packu      0100100 .......... 100 ..... 0110011 @r
 packh      0000100 .......... 111 ..... 0110011 @r
-grev       0110100 .......... 101 ..... 0110011 @r
-grevi      01101. ........... 101 ..... 0010011 @sh
=20
 # *** RV64B Standard Extension (in addition to RV32B) ***
 packw      0000100 .......... 100 ..... 0111011 @r
 packuw     0100100 .......... 100 ..... 0111011 @r
-grevw      0110100 .......... 101 ..... 0111011 @r
-
-greviw     0110100 .......... 101 ..... 0011011 @sh5
=20
 # *** RV32 Zbc Standard Extension ***
 clmul      0000101 .......... 001 ..... 0110011 @r
diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helpe=
r.c
index bb48388fcd..f1b5e5549f 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -24,46 +24,6 @@
 #include "exec/helper-proto.h"
 #include "tcg/tcg.h"
=20
-static const uint64_t adjacent_masks[] =3D {
-    dup_const(MO_8, 0x55),
-    dup_const(MO_8, 0x33),
-    dup_const(MO_8, 0x0f),
-    dup_const(MO_16, 0xff),
-    dup_const(MO_32, 0xffff),
-    UINT32_MAX
-};
-
-static inline target_ulong do_swap(target_ulong x, uint64_t mask, int sh=
ift)
-{
-    return ((x & mask) << shift) | ((x & ~mask) >> shift);
-}
-
-static target_ulong do_grev(target_ulong rs1,
-                            target_ulong rs2,
-                            int bits)
-{
-    target_ulong x =3D rs1;
-    int i, shift;
-
-    for (i =3D 0, shift =3D 1; shift < bits; i++, shift <<=3D 1) {
-        if (rs2 & shift) {
-            x =3D do_swap(x, adjacent_masks[i], shift);
-        }
-    }
-
-    return x;
-}
-
-target_ulong HELPER(grev)(target_ulong rs1, target_ulong rs2)
-{
-    return do_grev(rs1, rs2, TARGET_LONG_BITS);
-}
-
-target_ulong HELPER(grevw)(target_ulong rs1, target_ulong rs2)
-{
-    return do_grev(rs1, rs2, 32);
-}
-
 target_ulong HELPER(clmul)(target_ulong rs1, target_ulong rs2)
 {
     target_ulong result =3D 0;
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index d32af5915a..48a7c9ca5e 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -273,26 +273,18 @@ static bool trans_rol(DisasContext *ctx, arg_rol *a=
)
     return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotl_tl);
 }
=20
-static bool trans_grev(DisasContext *ctx, arg_grev *a)
+static bool trans_rev8_32(DisasContext *ctx, arg_rev8_32 *a)
 {
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, EXT_NONE, gen_helper_grev);
-}
-
-static void gen_grevi(TCGv dest, TCGv src, target_long shamt)
-{
-    if (shamt =3D=3D TARGET_LONG_BITS - 8) {
-        /* rev8, byte swaps */
-        tcg_gen_bswap_tl(dest, src);
-    } else {
-        gen_helper_grev(dest, src, tcg_constant_tl(shamt));
-    }
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZBB(ctx);
+    return gen_unary(ctx, a, EXT_NONE, tcg_gen_bswap_tl);
 }
=20
-static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
+static bool trans_rev8_64(DisasContext *ctx, arg_rev8_64 *a)
 {
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_grevi);
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZBB(ctx);
+    return gen_unary(ctx, a, EXT_NONE, tcg_gen_bswap_tl);
 }
=20
 static void gen_orc_b(TCGv ret, TCGv source1)
@@ -471,22 +463,6 @@ static bool trans_rolw(DisasContext *ctx, arg_rolw *=
a)
     return gen_shift(ctx, a, EXT_NONE, gen_rolw);
 }
=20
-static bool trans_grevw(DisasContext *ctx, arg_grevw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w =3D true;
-    return gen_shift(ctx, a, EXT_ZERO, gen_helper_grev);
-}
-
-static bool trans_greviw(DisasContext *ctx, arg_greviw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w =3D true;
-    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_helper_grev);
-}
-
 #define GEN_SHADD_UW(SHAMT)                                       \
 static void gen_sh##SHAMT##add_uw(TCGv ret, TCGv arg1, TCGv arg2) \
 {                                                                 \
--=20
2.31.1


