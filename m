Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E1F424D9B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 08:59:44 +0200 (CEST)
Received: from localhost ([::1]:37080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNNU-0001L2-P9
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 02:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNDT-0004Bc-EM
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:49:21 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:24054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNDR-0006EZ-F3
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:49:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633589357; x=1665125357;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ld+T7Gl5sVBi8Sj6L3Sw5JhQj5z67EqzDBRSWwaWaLs=;
 b=MH9deGlouXkUM3W74XcKNgXYL4bO8ooXUYXaKegltO6bUK5GYjIfzq6T
 GM0mtOnQanmqQic3/kJaXKkraPHf9Y3izUHzckrS7Ug3VwUXrr/YnvBB+
 6hDXgLI35PcYLh3qi17+Mi8TX/5CXaVM4FVJQH8USW133mDNbH9t4FR4t
 bv+fgvxemoIuJ9xDQhcTuxTQ+OL8EKkXWA8abJAem7vd1VSStTw79mjBr
 33Mnxv+5pIhAdywX1g3uoqCWFnalDtpgQ+WuB/pPOQrCBVDImZOhYNp0I
 eCUJvfrRV86Bquypg0fBR5CbMI4UxrRf+vMlNmeQvMfXKrSIVJKzri9l4 g==;
X-IronPort-AV: E=Sophos;i="5.85,352,1624291200"; d="scan'208";a="186894920"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2021 14:49:10 +0800
IronPort-SDR: o4rVtiiHFdB2GASLO7FvF8h7BQB4AwBgf7JU//U3S060ytBrlTzERbmtVknMgMD5JQKZmJEfnj
 biwVd2R+0oID2+VRt084FVr+TdwB8jbvG7Ft0iLiBwJskUa98wWau5ly07orha+hFU7D7zzwvv
 iKcEwyAbaPw4JV5NJU+veOMaezGf9c7ytR3WJ0Eh0KGVV8Niou16BMCNYKnag2MkCsEIGXL5aA
 nKqWf2jwZrJxmifyiCOIzyORwcmG8iGQ+ARB20F04Wmt1gZp9dqQi90zluNvJkvUQl1VKESNH3
 epFJ9bCGf4y2MmEk5iysmBZC
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:23:32 -0700
IronPort-SDR: hZlJ+2BwKG049AeSFxfl4cSk/iuT694cKk3i8avgLyxx0VSWb2TDSbvJFbMUdEFvpCrKyDWEjG
 oUBI/xeUGSMcED2Q4McJezZCqJXaiC3TkMhOg0BeudYKE2mhu3XknL5eqh0WlJcNQy8lt2J7vj
 MvuCA9ASq74Uf+OJUINqkmsBCdr1LDubQpeMC707Qmm9H//764x7uTXuGnDMybMH6GT4aq5Si2
 orPA2wJ4s3CsbPy21CdB+Th3+mo7k/lyPN0pnMIpwVg/JfrNHZNvZxYckhNjt+jRwlEyTwi0K/
 PnI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:49:11 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HQ23p4Wpdz1RvmK
 for <qemu-devel@nongnu.org>; Wed,  6 Oct 2021 23:49:10 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1633589349; x=1636181350; bh=Ld+T7Gl5sVBi8Sj6L3
 Sw5JhQj5z67EqzDBRSWwaWaLs=; b=asrsAxFC71n0dM8FTL6/f5I5YKjcYmNsGX
 yAAjovHS4m2MqRtcwAO1g/K4YjiahvE360c1FJOIrYbhzkH42c6Xt9NZIPd9T0cN
 XGgBHj3SUU/p63hbpi6S/HdQRa1BazR5zwcnN0P0OXzcSgBNQCOcH7oeNfHSqxNO
 0xJXUokszySpl2nl4604BJ5pK3vYTzrsvGNibSSoE+D1vrTkMCxB+uHsw/UFX1Wk
 R5kfwwSPe71jqOf2hLdEf5+jSxQzEuyNtVbWFFVp+8Loc7ZYqFFATbBa4BZcvbBz
 FmiurDRAco5+2rrHygvTx/zIx8cbMiZt8t1tpR1JoRqiVGC93TmA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id P0zFMSWLVL_z for <qemu-devel@nongnu.org>;
 Wed,  6 Oct 2021 23:49:09 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.32])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HQ23j1z00z1Rvll;
 Wed,  6 Oct 2021 23:49:04 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 11/26] target/riscv: Add orc.b instruction for Zbb,
 removing gorc/gorci
Date: Thu,  7 Oct 2021 16:47:36 +1000
Message-Id: <20211007064751.608580-12-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=907902f29=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

The 1.0.0 version of Zbb does not contain gorc/gorci.  Instead, a
orc.b instruction (equivalent to the orc.b pseudo-instruction built on
gorci from pre-0.93 draft-B) is available, mainly targeting
string-processing workloads.

This commit adds the new orc.b instruction and removed gorc/gorci.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210911140016.834071-12-philipp.tomsich@vrull.eu
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  2 --
 target/riscv/insn32.decode              |  6 +---
 target/riscv/bitmanip_helper.c          | 26 -----------------
 target/riscv/insn_trans/trans_rvb.c.inc | 39 +++++++++++--------------
 4 files changed, 18 insertions(+), 55 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 8a318a2dbc..a9bda2c8ac 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -61,8 +61,6 @@ DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i6=
4)
 /* Bitmanip */
 DEF_HELPER_FLAGS_2(grev, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(grevw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(gorc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(gorcw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(clmul, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, tl)
=20
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index a509cfee11..59202196dc 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -681,6 +681,7 @@ max        0000101 .......... 110 ..... 0110011 @r
 maxu       0000101 .......... 111 ..... 0110011 @r
 min        0000101 .......... 100 ..... 0110011 @r
 minu       0000101 .......... 101 ..... 0110011 @r
+orc_b      001010 000111 ..... 101 ..... 0010011 @r2
 orn        0100000 .......... 110 ..... 0110011 @r
 rol        0110000 .......... 001 ..... 0110011 @r
 ror        0110000 .......... 101 ..... 0110011 @r
@@ -702,19 +703,14 @@ pack       0000100 .......... 100 ..... 0110011 @r
 packu      0100100 .......... 100 ..... 0110011 @r
 packh      0000100 .......... 111 ..... 0110011 @r
 grev       0110100 .......... 101 ..... 0110011 @r
-gorc       0010100 .......... 101 ..... 0110011 @r
-
 grevi      01101. ........... 101 ..... 0010011 @sh
-gorci      00101. ........... 101 ..... 0010011 @sh
=20
 # *** RV64B Standard Extension (in addition to RV32B) ***
 packw      0000100 .......... 100 ..... 0111011 @r
 packuw     0100100 .......... 100 ..... 0111011 @r
 grevw      0110100 .......... 101 ..... 0111011 @r
-gorcw      0010100 .......... 101 ..... 0111011 @r
=20
 greviw     0110100 .......... 101 ..... 0011011 @sh5
-gorciw     0010100 .......... 101 ..... 0011011 @sh5
=20
 # *** RV32 Zbc Standard Extension ***
 clmul      0000101 .......... 001 ..... 0110011 @r
diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helpe=
r.c
index 73be5a81c7..bb48388fcd 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -64,32 +64,6 @@ target_ulong HELPER(grevw)(target_ulong rs1, target_ul=
ong rs2)
     return do_grev(rs1, rs2, 32);
 }
=20
-static target_ulong do_gorc(target_ulong rs1,
-                            target_ulong rs2,
-                            int bits)
-{
-    target_ulong x =3D rs1;
-    int i, shift;
-
-    for (i =3D 0, shift =3D 1; shift < bits; i++, shift <<=3D 1) {
-        if (rs2 & shift) {
-            x |=3D do_swap(x, adjacent_masks[i], shift);
-        }
-    }
-
-    return x;
-}
-
-target_ulong HELPER(gorc)(target_ulong rs1, target_ulong rs2)
-{
-    return do_gorc(rs1, rs2, TARGET_LONG_BITS);
-}
-
-target_ulong HELPER(gorcw)(target_ulong rs1, target_ulong rs2)
-{
-    return do_gorc(rs1, rs2, 32);
-}
-
 target_ulong HELPER(clmul)(target_ulong rs1, target_ulong rs2)
 {
     target_ulong result =3D 0;
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index bdfb495f24..d32af5915a 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -295,16 +295,27 @@ static bool trans_grevi(DisasContext *ctx, arg_grev=
i *a)
     return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_grevi);
 }
=20
-static bool trans_gorc(DisasContext *ctx, arg_gorc *a)
+static void gen_orc_b(TCGv ret, TCGv source1)
 {
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, EXT_ZERO, gen_helper_gorc);
+    TCGv  tmp =3D tcg_temp_new();
+    TCGv  ones =3D tcg_constant_tl(dup_const_tl(MO_8, 0x01));
+
+    /* Set lsb in each byte if the byte was zero. */
+    tcg_gen_sub_tl(tmp, source1, ones);
+    tcg_gen_andc_tl(tmp, tmp, source1);
+    tcg_gen_shri_tl(tmp, tmp, 7);
+    tcg_gen_andc_tl(tmp, ones, tmp);
+
+    /* Replicate the lsb of each byte across the byte. */
+    tcg_gen_muli_tl(ret, tmp, 0xff);
+
+    tcg_temp_free(tmp);
 }
=20
-static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
+static bool trans_orc_b(DisasContext *ctx, arg_orc_b *a)
 {
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_helper_gorc);
+    REQUIRE_ZBB(ctx);
+    return gen_unary(ctx, a, EXT_ZERO, gen_orc_b);
 }
=20
 #define GEN_SHADD(SHAMT)                                       \
@@ -476,22 +487,6 @@ static bool trans_greviw(DisasContext *ctx, arg_grev=
iw *a)
     return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_helper_grev);
 }
=20
-static bool trans_gorcw(DisasContext *ctx, arg_gorcw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w =3D true;
-    return gen_shift(ctx, a, EXT_ZERO, gen_helper_gorc);
-}
-
-static bool trans_gorciw(DisasContext *ctx, arg_gorciw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w =3D true;
-    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_helper_gorc);
-}
-
 #define GEN_SHADD_UW(SHAMT)                                       \
 static void gen_sh##SHAMT##add_uw(TCGv ret, TCGv arg1, TCGv arg2) \
 {                                                                 \
--=20
2.31.1


