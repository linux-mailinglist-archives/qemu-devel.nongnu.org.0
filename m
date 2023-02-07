Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C1568D03A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:11:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI81-0006vN-7K; Tue, 07 Feb 2023 02:10:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7z-0006uj-0r
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:55 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7w-0008RS-S8
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753852; x=1707289852;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SPd7l1Q0Auz9vtTQN8UFne2otnriLq/q7MmdjRt6ErI=;
 b=XRTpd6bTpl4PnmB28iO+OKIT90L3yVKdP8RdPOLC2dPigQqnTXuu8fvT
 9DpeWJZMZ30WPO7HgsOwnDPqV2dvKox0L2beN4VWtBtmzG/cefU/FdJYY
 zJh5vnmdVLsz5C1BHZuHP5hLFA6IWG6tyQR+Fy91WCJKAgzPqk04tPNdR
 LhnKulrnIxZ5IfuF0xAIfNbPlH4L81wlSONq63Uywqm4qRWNVftScmaWB
 Pik8hnGolgfIvFWJlGvGG049u+hK8Olsi8espN4DCvjAYzI9HnIKasDKR
 xYsIp4HRYGkxnWGieCvhT/HNXlubPYwvgZ9Veor20u3neWidCOUqJl7jk w==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657524"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:10:25 +0800
IronPort-SDR: s32QCBfXjCxg9Y5A35XnOX0Y6xNdhFBbca+HCf4YTjc5+vfH1jn+kcw/7EBOzowpPSu8ElyDyH
 ZkW2BB+NT/bq68zHWgTjiXqwwE8ges0QRDZzP5w3XPSraEHLBkcdDiY1RGeib0uIHnEjOXhIyy
 spHVYjxyiCzwY7RKYRKBInVdP76XhhhYn8EzUBQKIYxuUb+df479usI7stkug1XFRCHkEuB1K/
 YSHknc2V0G4VOzVmdENfqkJXjAkJNnheMrUOI0FxmFenWXc1Zo4p7M1FQlH1eb6KNmoOHWvyFg
 pNc=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:27:42 -0800
IronPort-SDR: ZYGnIK/58wy7iBONfSOJHtcSt1pfJVPTOLzHDpasG5qyTEYe1xcxhouNQ85PJitPuPzQ16ef/M
 kaw0GLg9abilbvDnNFTiVCogF5xJJ1HynpTyUZN5NL+rw2sDPWXvjIMqBwPGrcsmIZUPQhW6BJ
 1qXFFTwEXgZ0ZEf8WIHcsT4MCAfIdEPsFroMNXz5adCHZIW9ZG++UpIZkNLxjzPbq0U+G0CbcZ
 hWcO0Koca6hNT1BO3+S3y4gTh+iw/4jMcNCbuD2XGfRcA7FyqRXz58Y8I8aYwxW8bCqA4cloDE
 lBM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:10:25 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vR51yhDz1Rwrq
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:10:25 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1675753824; x=1678345825; bh=SPd7l1Q
 0Auz9vtTQN8UFne2otnriLq/q7MmdjRt6ErI=; b=sWqNODdnAaKcWGprSwx0pkv
 0dINu8DK1szyz/jg0TUfWNSJpbm7FKfkEPY4+t7ih5llnkzx3n2y7Oc+hUxbeKIE
 PBRhp/AabCaH/3ZoQPSTfVRB5pd5ZKq3Q2OR2G8/e5Ttlu2tPHbkeqfaQllXwzrM
 dLOIz6q8yox1oiEUa9FzNaKZRW8GCCmGeqCEv214C6tkBSxVAWSCaKW/18OnqjSW
 v0ldBbzk7Ybu7Q5MAEDljGxjWXW2X7+nhQitlpCtUYFbSTUihJeD4V808M1vNx7r
 kgic2spq2YdSg2gAlWDrSriafclTGuIWTzh347M7AYl7YgeJXSbI1sbfY3kImXA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Pq16lgPn6cWN for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:10:24 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vR23fNhz1RvLy;
 Mon,  6 Feb 2023 23:10:22 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
 =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 18/32] RISC-V: Adding XTheadBb ISA extension
Date: Tue,  7 Feb 2023 17:09:29 +1000
Message-Id: <20230207070943.2558857-19-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
References: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=395dd5341=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

This patch adds support for the XTheadBb ISA extension.
The patch uses the T-Head specific decoder and translation.

Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
Message-Id: <20230131202013.2541053-5-christoph.muellner@vrull.eu>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                         |   1 +
 target/riscv/xthead.decode                 |  20 ++++
 target/riscv/cpu.c                         |   2 +
 target/riscv/translate.c                   |   4 +-
 target/riscv/insn_trans/trans_xthead.c.inc | 124 +++++++++++++++++++++
 5 files changed, 149 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f1f7795bd5..be86c2fb95 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -474,6 +474,7 @@ struct RISCVCPUConfig {
=20
     /* Vendor-specific custom extensions */
     bool ext_xtheadba;
+    bool ext_xtheadbb;
     bool ext_xtheadcmo;
     bool ext_xtheadsync;
     bool ext_XVentanaCondOps;
diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
index b149f13018..8cd140891b 100644
--- a/target/riscv/xthead.decode
+++ b/target/riscv/xthead.decode
@@ -13,14 +13,23 @@
 %rd        7:5
 %rs1       15:5
 %rs2       20:5
+%sh5       20:5
+%sh6       20:6
=20
 # Argument sets
 &r         rd rs1 rs2                               !extern
+&r2        rd rs1                                   !extern
+&shift     shamt rs1 rd                             !extern
+&th_bfext  msb lsb rs1 rd
=20
 # Formats
 @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
 @rs2_s      ....... ..... ..... ... ..... .......   %rs2 %rs1
 @r          ....... ..... .....  ... ..... .......  &r %rs2 %rs1 %rd
+@r2         ....... ..... .....  ... ..... .......  &r2 %rs1 %rd
+@th_bfext   msb:6  lsb:6  .....  ... ..... .......  &th_bfext %rs1 %rd
+@sh5        ....... ..... .....  ... ..... .......  &shift  shamt=3D%sh5=
      %rs1 %rd
+@sh6        ...... ...... .....  ... ..... .......  &shift shamt=3D%sh6 =
%rs1 %rd
=20
 # XTheadBa
 # Instead of defining a new encoding, we simply use the decoder to
@@ -38,6 +47,17 @@ th_addsl1        0000001 ..... ..... 001 ..... 0001011=
 @r
 th_addsl2        0000010 ..... ..... 001 ..... 0001011 @r
 th_addsl3        0000011 ..... ..... 001 ..... 0001011 @r
=20
+# XTheadBb
+th_ext           ...... ...... ..... 010 ..... 0001011 @th_bfext
+th_extu          ...... ...... ..... 011 ..... 0001011 @th_bfext
+th_ff0           1000010 00000 ..... 001 ..... 0001011 @r2
+th_ff1           1000011 00000 ..... 001 ..... 0001011 @r2
+th_srri          000100 ...... ..... 001 ..... 0001011 @sh6
+th_srriw         0001010 ..... ..... 001 ..... 0001011 @sh5
+th_rev           1000001 00000 ..... 001 ..... 0001011 @r2
+th_revw          1001000 00000 ..... 001 ..... 0001011 @r2
+th_tstnbz        1000000 00000 ..... 001 ..... 0001011 @r2
+
 # XTheadCmo
 th_dcache_call   0000000 00001 00000 000 00000 0001011
 th_dcache_ciall  0000000 00011 00000 000 00000 0001011
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index dd5ff82f22..def27a53f2 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -110,6 +110,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
     ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
     ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
     ISA_EXT_DATA_ENTRY(xtheadba, true, PRIV_VERSION_1_11_0, ext_xtheadba=
),
+    ISA_EXT_DATA_ENTRY(xtheadbb, true, PRIV_VERSION_1_11_0, ext_xtheadbb=
),
     ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadc=
mo),
     ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xthead=
sync),
     ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_X=
VentanaCondOps),
@@ -1092,6 +1093,7 @@ static Property riscv_cpu_extensions[] =3D {
=20
     /* Vendor-specific custom extensions */
     DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
+    DEFINE_PROP_BOOL("xtheadbb", RISCVCPU, cfg.ext_xtheadbb, false),
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOp=
s, false),
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 4683562ecf..387ef0ad8b 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -132,8 +132,8 @@ static bool always_true_p(DisasContext *ctx  __attrib=
ute__((__unused__)))
=20
 static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
 {
-    return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadcmo ||
-           ctx->cfg_ptr->ext_xtheadsync;
+    return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
+           ctx->cfg_ptr->ext_xtheadcmo || ctx->cfg_ptr->ext_xtheadsync;
 }
=20
 #define MATERIALISE_EXT_PREDICATE(ext)  \
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/in=
sn_trans/trans_xthead.c.inc
index a6fb8132a8..ebfab90dd9 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -22,6 +22,12 @@
     }                                            \
 } while (0)
=20
+#define REQUIRE_XTHEADBB(ctx) do {               \
+    if (!ctx->cfg_ptr->ext_xtheadbb) {           \
+        return false;                            \
+    }                                            \
+} while (0)
+
 #define REQUIRE_XTHEADCMO(ctx) do {              \
     if (!ctx->cfg_ptr->ext_xtheadcmo) {          \
         return false;                            \
@@ -67,6 +73,124 @@ GEN_TRANS_TH_ADDSL(1)
 GEN_TRANS_TH_ADDSL(2)
 GEN_TRANS_TH_ADDSL(3)
=20
+/* XTheadBb */
+
+/* th.srri is an alternate encoding for rori (from Zbb) */
+static bool trans_th_srri(DisasContext *ctx, arg_th_srri * a)
+{
+    REQUIRE_XTHEADBB(ctx);
+    return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
+                                   tcg_gen_rotri_tl, gen_roriw, NULL);
+}
+
+/* th.srriw is an alternate encoding for roriw (from Zbb) */
+static bool trans_th_srriw(DisasContext *ctx, arg_th_srriw *a)
+{
+    REQUIRE_XTHEADBB(ctx);
+    REQUIRE_64BIT(ctx);
+    ctx->ol =3D MXL_RV32;
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_roriw, NULL);
+}
+
+/* th.ext and th.extu perform signed/unsigned bitfield extraction */
+static bool gen_th_bfextract(DisasContext *ctx, arg_th_bfext *a,
+                             void (*f)(TCGv, TCGv, unsigned int, unsigne=
d int))
+{
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv source =3D get_gpr(ctx, a->rs1, EXT_ZERO);
+
+    if (a->lsb <=3D a->msb) {
+        f(dest, source, a->lsb, a->msb - a->lsb + 1);
+        gen_set_gpr(ctx, a->rd, dest);
+    }
+    return true;
+}
+
+static bool trans_th_ext(DisasContext *ctx, arg_th_ext *a)
+{
+    REQUIRE_XTHEADBB(ctx);
+    return gen_th_bfextract(ctx, a, tcg_gen_sextract_tl);
+}
+
+static bool trans_th_extu(DisasContext *ctx, arg_th_extu *a)
+{
+    REQUIRE_XTHEADBB(ctx);
+    return gen_th_bfextract(ctx, a, tcg_gen_extract_tl);
+}
+
+/* th.ff0: find first zero (clz on an inverted input) */
+static bool gen_th_ff0(DisasContext *ctx, arg_th_ff0 *a, DisasExtend ext=
)
+{
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv src1 =3D get_gpr(ctx, a->rs1, ext);
+
+    int olen =3D get_olen(ctx);
+    TCGv t =3D tcg_temp_new();
+
+    tcg_gen_not_tl(t, src1);
+    if (olen !=3D TARGET_LONG_BITS) {
+        if (olen =3D=3D 32) {
+            gen_clzw(dest, t);
+        } else {
+            g_assert_not_reached();
+        }
+    } else {
+        gen_clz(dest, t);
+    }
+
+    tcg_temp_free(t);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool trans_th_ff0(DisasContext *ctx, arg_th_ff0 *a)
+{
+    REQUIRE_XTHEADBB(ctx);
+    return gen_th_ff0(ctx, a, EXT_NONE);
+}
+
+/* th.ff1 is an alternate encoding for clz (from Zbb) */
+static bool trans_th_ff1(DisasContext *ctx, arg_th_ff1 *a)
+{
+    REQUIRE_XTHEADBB(ctx);
+    return gen_unary_per_ol(ctx, a, EXT_NONE, gen_clz, gen_clzw);
+}
+
+static void gen_th_revw(TCGv ret, TCGv arg1)
+{
+    tcg_gen_bswap32_tl(ret, arg1, TCG_BSWAP_OS);
+}
+
+/* th.rev is an alternate encoding for the RV64 rev8 (from Zbb) */
+static bool trans_th_rev(DisasContext *ctx, arg_th_rev *a)
+{
+    REQUIRE_XTHEADBB(ctx);
+
+    return gen_unary_per_ol(ctx, a, EXT_NONE, tcg_gen_bswap_tl, gen_th_r=
evw);
+}
+
+/* th.revw is a sign-extended byte-swap of the lower word */
+static bool trans_th_revw(DisasContext *ctx, arg_th_revw *a)
+{
+    REQUIRE_XTHEADBB(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_unary(ctx, a, EXT_NONE, gen_th_revw);
+}
+
+/* th.tstnbz is equivalent to an orc.b (from Zbb) with inverted result *=
/
+static void gen_th_tstnbz(TCGv ret, TCGv source1)
+{
+    gen_orc_b(ret, source1);
+    tcg_gen_not_tl(ret, ret);
+}
+
+static bool trans_th_tstnbz(DisasContext *ctx, arg_th_tstnbz *a)
+{
+    REQUIRE_XTHEADBB(ctx);
+    return gen_unary(ctx, a, EXT_ZERO, gen_th_tstnbz);
+}
+
 /* XTheadCmo */
=20
 static inline int priv_level(DisasContext *ctx)
--=20
2.39.1


