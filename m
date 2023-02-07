Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0925068D046
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:12:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI8I-0007Rv-Lj; Tue, 07 Feb 2023 02:11:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI8C-00071q-BJ
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:11:09 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI8A-0000FW-8d
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:11:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753866; x=1707289866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SAQoIIBfj/Nmb3gGhKAtbirA61pHQCopaGLFPGnNHos=;
 b=DAZcOtBqJKqah8zlcq3Q7rgvloCqzWiZB4tyKWAV6SxsFZDr4Nz/R8JI
 XrMDPc0D7MhdKDwK6kXu9de+13ZomaJWfK8VpC+nkSuwF7oRGhBHT2ZLf
 2ryRCE2ImNHyxfPrcmYOeVAm7QVJlymAr5jb2OX2mP3j0lDhQavlv8pw2
 0rih7OiVllqG9LDhZbYyYVZxmoeq3pxfQZWCcC/0skx9tUjHPjfvi15w2
 lFI4KT9ZNJVzQY9vQN5am49q1ikz0cPWrvZ2GNct6UOqh3BwAGDqkOs5m
 zjEok7l03f9JZ3dUk1/WdzOE8mKGG1ahhhvDOZteXmYpmVWaBgi1Ydtpt Q==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657550"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:10:33 +0800
IronPort-SDR: RRypEUlq7Q2oQJqCcAw5H4HVDgAAC69BZPbr+ONZRARGy4/I7xkx/wDYF6y4hwVIE2Sg2vnhvn
 jYN+ulM0Rbj7mMV++/eH8NJxJlwrXQdAw6DcZnmjdWthpCX3v0TYyljIjRAjcWP606pZ7Na4th
 V70lF9Q4giXaTtq5nwZdvBROQk/XFpri38HbI/penDpRE0fMNAtwn2g2763Sx0CCFgk02M/MmB
 82QqrS+uZf8uEUhkJ6n3y2wx7bzWaIw1dz1P3lkqoWsGFahkNKk8l1tAToiJzEsEso7UoMnipj
 Vbg=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:27:50 -0800
IronPort-SDR: GZEfj0a4NPQV+EvwkZ8XRB0SDzn3BHDmVROIl7o3d9ooTvM0m5yfNJwKOYDnRi3ZBRn8zi6uoC
 ilchPw5gOcDoCIWs4J1bgFz52RS/4+DzcFCHHCaMnsvM/sonIdgFAgRKhDCPZTGa7lEHL6h4iK
 dv0fGyDxqDvHmGvJeMnI2ZLFfcOwf1KNXWiU6GnlEifNxu7YgNq4P3gMbNazqA/fKDg5m0E97G
 nN/X22PINfyXhGP3C7osRnZE9k/JN0SQr3MVUzemwCq3ulzlv4ecnCH4gnh71AqNqVl4Wrkj2A
 SrQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:10:33 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vRF4Hycz1Rwrq
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:10:33 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1675753832; x=1678345833; bh=SAQoIIB
 fj/Nmb3gGhKAtbirA61pHQCopaGLFPGnNHos=; b=pFveMjiiaLsgzi3LgtWL6pI
 5Hjp2brjzsudiwKyUvB0z7C4nRDX1qx91rWKUQ48ouy/PSWsJgk3ZLMkfY+Ut2R6
 bE5RSF20UefXy5Eqy9qC88MCVe3DEBgXmPqL6fLx1CYhVr/VUxdHwHyuiY01t3OB
 jRjeDQB1pW9JEMaraGCW48HHRibySHepqG3O+oCFig0Gv9S1fVTGU27RtsEuN1/C
 8zZo7BaWvckKIxEvzvGai+NoDeOrzYPQKPa2j7rRuCVEnHeALNCwhpDv237mr3g7
 bnJMbJFtmCnqfBiirY/PzZ9yXhAn1kQ6WrX9Syuzsmbgc4QGVnHI1IALSWKoitg=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id EdOjaGQhigdJ for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:10:32 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vRB6qc1z1RvLy;
 Mon,  6 Feb 2023 23:10:30 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
 =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 22/32] RISC-V: Adding T-Head MemPair extension
Date: Tue,  7 Feb 2023 17:09:33 +1000
Message-Id: <20230207070943.2558857-23-alistair.francis@opensource.wdc.com>
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

This patch adds support for the T-Head MemPair instructions.
The patch uses the T-Head specific decoder and translation.

Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
Message-Id: <20230131202013.2541053-9-christoph.muellner@vrull.eu>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                         |  1 +
 target/riscv/xthead.decode                 | 13 +++
 target/riscv/cpu.c                         |  2 +
 target/riscv/translate.c                   |  2 +-
 target/riscv/insn_trans/trans_xthead.c.inc | 92 ++++++++++++++++++++++
 5 files changed, 109 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 830b20558c..38e80d44d5 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -479,6 +479,7 @@ struct RISCVCPUConfig {
     bool ext_xtheadcmo;
     bool ext_xtheadcondmov;
     bool ext_xtheadmac;
+    bool ext_xtheadmempair;
     bool ext_xtheadsync;
     bool ext_XVentanaCondOps;
=20
diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
index 696de6cecf..ff2a83b56d 100644
--- a/target/riscv/xthead.decode
+++ b/target/riscv/xthead.decode
@@ -11,16 +11,21 @@
=20
 # Fields:
 %rd        7:5
+%rd1       7:5
+%rs        15:5
 %rs1       15:5
+%rd2       20:5
 %rs2       20:5
 %sh5       20:5
 %sh6       20:6
+%sh2       25:2
=20
 # Argument sets
 &r         rd rs1 rs2                               !extern
 &r2        rd rs1                                   !extern
 &shift     shamt rs1 rd                             !extern
 &th_bfext  msb lsb rs1 rd
+&th_pair   rd1 rs rd2 sh2
=20
 # Formats
 @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
@@ -30,6 +35,7 @@
 @th_bfext   msb:6  lsb:6  .....  ... ..... .......  &th_bfext %rs1 %rd
 @sh5        ....... ..... .....  ... ..... .......  &shift  shamt=3D%sh5=
      %rs1 %rd
 @sh6        ...... ...... .....  ... ..... .......  &shift shamt=3D%sh6 =
%rs1 %rd
+@th_pair    ..... .. ..... ..... ... ..... .......  &th_pair %rd1 %rs %r=
d2 %sh2
=20
 # XTheadBa
 # Instead of defining a new encoding, we simply use the decoder to
@@ -96,6 +102,13 @@ th_muls          00100 01 ..... ..... 001 ..... 00010=
11 @r
 th_mulsh         00101 01 ..... ..... 001 ..... 0001011 @r
 th_mulsw         00100 11 ..... ..... 001 ..... 0001011 @r
=20
+# XTheadMemPair
+th_ldd           11111 .. ..... ..... 100 ..... 0001011 @th_pair
+th_lwd           11100 .. ..... ..... 100 ..... 0001011 @th_pair
+th_lwud          11110 .. ..... ..... 100 ..... 0001011 @th_pair
+th_sdd           11111 .. ..... ..... 101 ..... 0001011 @th_pair
+th_swd           11100 .. ..... ..... 101 ..... 0001011 @th_pair
+
 # XTheadSync
 th_sfence_vmas   0000010 ..... ..... 000 00000 0001011 @rs2_s
 th_sync          0000000 11000 00000 000 00000 0001011
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 88da4de14d..b7047d139d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -115,6 +115,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
     ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadc=
mo),
     ISA_EXT_DATA_ENTRY(xtheadcondmov, true, PRIV_VERSION_1_11_0, ext_xth=
eadcondmov),
     ISA_EXT_DATA_ENTRY(xtheadmac, true, PRIV_VERSION_1_11_0, ext_xtheadm=
ac),
+    ISA_EXT_DATA_ENTRY(xtheadmempair, true, PRIV_VERSION_1_11_0, ext_xth=
eadmempair),
     ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xthead=
sync),
     ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_X=
VentanaCondOps),
 };
@@ -1101,6 +1102,7 @@ static Property riscv_cpu_extensions[] =3D {
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, f=
alse),
     DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
+    DEFINE_PROP_BOOL("xtheadmempair", RISCVCPU, cfg.ext_xtheadmempair, f=
alse),
     DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOp=
s, false),
=20
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index e5a57a8516..f383e69db3 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -135,7 +135,7 @@ static bool has_xthead_p(DisasContext *ctx  __attribu=
te__((__unused__)))
     return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
            ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
            ctx->cfg_ptr->ext_xtheadcondmov || ctx->cfg_ptr->ext_xtheadma=
c ||
-           ctx->cfg_ptr->ext_xtheadsync;
+           ctx->cfg_ptr->ext_xtheadmempair || ctx->cfg_ptr->ext_xtheadsy=
nc;
 }
=20
 #define MATERIALISE_EXT_PREDICATE(ext)  \
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/in=
sn_trans/trans_xthead.c.inc
index 31a4034927..f1bd0dbad5 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -52,6 +52,12 @@
     }                                            \
 } while (0)
=20
+#define REQUIRE_XTHEADMEMPAIR(ctx) do {          \
+    if (!ctx->cfg_ptr->ext_xtheadmempair) {      \
+        return false;                            \
+    }                                            \
+} while (0)
+
 #define REQUIRE_XTHEADSYNC(ctx) do {             \
     if (!ctx->cfg_ptr->ext_xtheadsync) {         \
         return false;                            \
@@ -382,6 +388,92 @@ static bool trans_th_mulsw(DisasContext *ctx, arg_th=
_mulsw *a)
     return gen_th_mac(ctx, a, tcg_gen_sub_tl, NULL);
 }
=20
+/* XTheadMemPair */
+
+static bool gen_loadpair_tl(DisasContext *ctx, arg_th_pair *a, MemOp mem=
op,
+                            int shamt)
+{
+    if (a->rs =3D=3D a->rd1 || a->rs =3D=3D a->rd2 || a->rd1 =3D=3D a->r=
d2) {
+        return false;
+    }
+
+    TCGv t1 =3D tcg_temp_new();
+    TCGv t2 =3D tcg_temp_new();
+    TCGv addr1 =3D tcg_temp_new();
+    TCGv addr2 =3D tcg_temp_new();
+    int imm =3D a->sh2 << shamt;
+
+    addr1 =3D get_address(ctx, a->rs, imm);
+    addr2 =3D get_address(ctx, a->rs, memop_size(memop) + imm);
+
+    tcg_gen_qemu_ld_tl(t1, addr1, ctx->mem_idx, memop);
+    tcg_gen_qemu_ld_tl(t2, addr2, ctx->mem_idx, memop);
+    gen_set_gpr(ctx, a->rd1, t1);
+    gen_set_gpr(ctx, a->rd2, t2);
+
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+    tcg_temp_free(addr1);
+    tcg_temp_free(addr2);
+    return true;
+}
+
+static bool trans_th_ldd(DisasContext *ctx, arg_th_pair *a)
+{
+    REQUIRE_XTHEADMEMPAIR(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_loadpair_tl(ctx, a, MO_TESQ, 4);
+}
+
+static bool trans_th_lwd(DisasContext *ctx, arg_th_pair *a)
+{
+    REQUIRE_XTHEADMEMPAIR(ctx);
+    return gen_loadpair_tl(ctx, a, MO_TESL, 3);
+}
+
+static bool trans_th_lwud(DisasContext *ctx, arg_th_pair *a)
+{
+    REQUIRE_XTHEADMEMPAIR(ctx);
+    return gen_loadpair_tl(ctx, a, MO_TEUL, 3);
+}
+
+static bool gen_storepair_tl(DisasContext *ctx, arg_th_pair *a, MemOp me=
mop,
+                             int shamt)
+{
+    if (a->rs =3D=3D a->rd1 || a->rs =3D=3D a->rd2 || a->rd1 =3D=3D a->r=
d2) {
+        return false;
+    }
+
+    TCGv data1 =3D get_gpr(ctx, a->rd1, EXT_NONE);
+    TCGv data2 =3D get_gpr(ctx, a->rd2, EXT_NONE);
+    TCGv addr1 =3D tcg_temp_new();
+    TCGv addr2 =3D tcg_temp_new();
+    int imm =3D a->sh2 << shamt;
+
+    addr1 =3D get_address(ctx, a->rs, imm);
+    addr2 =3D get_address(ctx, a->rs, memop_size(memop) + imm);
+
+    tcg_gen_qemu_st_tl(data1, addr1, ctx->mem_idx, memop);
+    tcg_gen_qemu_st_tl(data2, addr2, ctx->mem_idx, memop);
+
+    tcg_temp_free(addr1);
+    tcg_temp_free(addr2);
+    return true;
+}
+
+static bool trans_th_sdd(DisasContext *ctx, arg_th_pair *a)
+{
+    REQUIRE_XTHEADMEMPAIR(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_storepair_tl(ctx, a, MO_TESQ, 4);
+}
+
+static bool trans_th_swd(DisasContext *ctx, arg_th_pair *a)
+{
+    REQUIRE_XTHEADMEMPAIR(ctx);
+    return gen_storepair_tl(ctx, a, MO_TESL, 3);
+}
+
 /* XTheadSync */
=20
 static bool trans_th_sfence_vmas(DisasContext *ctx, arg_th_sfence_vmas *=
a)
--=20
2.39.1


