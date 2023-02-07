Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6351B68D051
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:14:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI8c-0000Ei-UF; Tue, 07 Feb 2023 02:11:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI8O-0008Nu-9X
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:11:20 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI8L-0008RS-JI
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:11:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753877; x=1707289877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jsiZudhMl07/CIj4DOIavfuq95RZ2bFTHTfJ61j1iZA=;
 b=plCzRcA9bCACvjfmyfEOdJwyYgP7B00rdVHf8vFOkpBTFowQYnUkeDXA
 PzVd/FZex73T8OPGeoaHjSxSSjNy5nfm1LKE++avGvYJ7Yd8QUDHHRqQ6
 P2H+U22VcnLwRAV7Q+diX9C5lg2CVVWeRy1uX5xfB1AYv6ynBMO8bgJqL
 egjRrJwhzyQu4OnEM3ZK562cAxfI1zBvs665glRm9TMPXlCXvvpDIx4F0
 vAeRml0F/xnhq6A6YeLJexDrSeLO/Y7zUynDiBTZjfufSUSkY4SDHPHDj
 qYMP5s3SsHA43hYCFVLiTYR/UHo45OkMS4FO528QaTFTAkaWTLjS1kQo/ w==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657558"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:10:37 +0800
IronPort-SDR: wNLozE6H0+9e1bzERrZh73eAHWqnS/tbTn/jCpK2sNjwb6QJXT3hj9adusnCHlOJuhmn00vL9m
 nd84N1VDh+osXqwZpI9ITLfdqQFXD6ry6F+/fVnFQE8z626JRLCjrxdGx20WSK+SuHF7Vhywkb
 mDNNtd/CgmEpCVFfzDU5VJ1X8mOjiVpUmYmb/1HW5XuKoHzMYhV3n3C0cQBULUKUpj+cYjXeRu
 GKCeDGvyxt53SsGrhT2Ma7AxaYTyosPKtoARpVTKK1stS3qjEw43gWORccfvJWzAGQORoc9+z6
 mTU=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:27:54 -0800
IronPort-SDR: MDAvkXR1v+OPU0i5VWfVA1ZG2/VYLad5319GE9CxEAGRi+hXr52AWR47cu8EF3MrP97AkYfkf9
 n89CMIS3z8RfvOF8pLYfbv1KVWT2MimAL28XkZaHpxLQt/sXA+exyvv22S+VTy7er2aPkY8sk1
 fi3KUseBrzCHoNaORqrMRBvH7wzHVE4aXlbWi7XiO9gStkKw+Avw3Pp/yG8oaVadLfiD5cadcm
 12XSMW6qHTkidRG/WgfxjxG1H01bF4LG1UgsCWjtQ50i05703Nbh9/mNf6dpX15QV8HRS0CHFN
 HzA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:10:38 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vRK5Vyhz1RvTr
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:10:37 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1675753837; x=1678345838; bh=jsiZudh
 Ml07/CIj4DOIavfuq95RZ2bFTHTfJ61j1iZA=; b=Q/dMWjQ9QH3M3YztqdXsphk
 dziF+8+CNqWyAz0WVuAxRk715MbkLJJ57n20/BE6j10/vKuhExa/tQ2SuCsoJFWY
 deL3xrLQ/winVwIhM+QaRRecOx21AYdfx3kozkvE0YWwL2JtJwbY84sM+oj1DM9y
 Cx/cbQxr+IAXn0XQ7zbUr3xgyxfwV9e5DgpHMQ4ooRJsnMP1vbYwKSvfYnsQZyWA
 HnI+6SewGCVrzZlZAh4GhA+LobFa9S+cTKUT82kQXtYq9K66jM9ov8KJGpp04PJY
 VdWBox91erF0KCIQY2ldC+47vmkUmdAZZxVCcvTHiNlt7+o9grazN1K3ny6B+nA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id orUMrfJ0sWMO for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:10:37 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vRH2dLCz1RvLy;
 Mon,  6 Feb 2023 23:10:34 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
 =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 24/32] RISC-V: Adding T-Head FMemIdx extension
Date: Tue,  7 Feb 2023 17:09:35 +1000
Message-Id: <20230207070943.2558857-25-alistair.francis@opensource.wdc.com>
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

This patch adds support for the T-Head FMemIdx instructions.
The patch uses the T-Head specific decoder and translation.

Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
Message-Id: <20230131202013.2541053-11-christoph.muellner@vrull.eu>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                         |   1 +
 target/riscv/xthead.decode                 |  10 ++
 target/riscv/cpu.c                         |   2 +
 target/riscv/translate.c                   |   3 +-
 target/riscv/insn_trans/trans_xthead.c.inc | 108 +++++++++++++++++++++
 5 files changed, 123 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d776fea760..5cc3011529 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -478,6 +478,7 @@ struct RISCVCPUConfig {
     bool ext_xtheadbs;
     bool ext_xtheadcmo;
     bool ext_xtheadcondmov;
+    bool ext_xtheadfmemidx;
     bool ext_xtheadmac;
     bool ext_xtheadmemidx;
     bool ext_xtheadmempair;
diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
index 69e40f22dc..81daf1d694 100644
--- a/target/riscv/xthead.decode
+++ b/target/riscv/xthead.decode
@@ -100,6 +100,16 @@ th_l2cache_iall  0000000 10110 00000 000 00000 00010=
11
 th_mveqz         0100000 ..... .....  001 ..... 0001011 @r
 th_mvnez         0100001 ..... .....  001 ..... 0001011 @r
=20
+# XTheadFMemIdx
+th_flrd          01100 .. ..... ..... 110 ..... 0001011 @th_memidx
+th_flrw          01000 .. ..... ..... 110 ..... 0001011 @th_memidx
+th_flurd         01110 .. ..... ..... 110 ..... 0001011 @th_memidx
+th_flurw         01010 .. ..... ..... 110 ..... 0001011 @th_memidx
+th_fsrd          01100 .. ..... ..... 111 ..... 0001011 @th_memidx
+th_fsrw          01000 .. ..... ..... 111 ..... 0001011 @th_memidx
+th_fsurd         01110 .. ..... ..... 111 ..... 0001011 @th_memidx
+th_fsurw         01010 .. ..... ..... 111 ..... 0001011 @th_memidx
+
 # XTheadMac
 th_mula          00100 00 ..... ..... 001 ..... 0001011 @r
 th_mulah         00101 00 ..... ..... 001 ..... 0001011 @r
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2d5a0881f1..5679e2cb83 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -114,6 +114,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
     ISA_EXT_DATA_ENTRY(xtheadbs, true, PRIV_VERSION_1_11_0, ext_xtheadbs=
),
     ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadc=
mo),
     ISA_EXT_DATA_ENTRY(xtheadcondmov, true, PRIV_VERSION_1_11_0, ext_xth=
eadcondmov),
+    ISA_EXT_DATA_ENTRY(xtheadfmemidx, true, PRIV_VERSION_1_11_0, ext_xth=
eadfmemidx),
     ISA_EXT_DATA_ENTRY(xtheadmac, true, PRIV_VERSION_1_11_0, ext_xtheadm=
ac),
     ISA_EXT_DATA_ENTRY(xtheadmemidx, true, PRIV_VERSION_1_11_0, ext_xthe=
admemidx),
     ISA_EXT_DATA_ENTRY(xtheadmempair, true, PRIV_VERSION_1_11_0, ext_xth=
eadmempair),
@@ -1102,6 +1103,7 @@ static Property riscv_cpu_extensions[] =3D {
     DEFINE_PROP_BOOL("xtheadbs", RISCVCPU, cfg.ext_xtheadbs, false),
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, f=
alse),
+    DEFINE_PROP_BOOL("xtheadfmemidx", RISCVCPU, cfg.ext_xtheadfmemidx, f=
alse),
     DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
     DEFINE_PROP_BOOL("xtheadmemidx", RISCVCPU, cfg.ext_xtheadmemidx, fal=
se),
     DEFINE_PROP_BOOL("xtheadmempair", RISCVCPU, cfg.ext_xtheadmempair, f=
alse),
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index a979d43a6a..216eaf9d12 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -134,7 +134,8 @@ static bool has_xthead_p(DisasContext *ctx  __attribu=
te__((__unused__)))
 {
     return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
            ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
-           ctx->cfg_ptr->ext_xtheadcondmov || ctx->cfg_ptr->ext_xtheadma=
c ||
+           ctx->cfg_ptr->ext_xtheadcondmov ||
+           ctx->cfg_ptr->ext_xtheadfmemidx || ctx->cfg_ptr->ext_xtheadma=
c ||
            ctx->cfg_ptr->ext_xtheadmemidx || ctx->cfg_ptr->ext_xtheadmem=
pair ||
            ctx->cfg_ptr->ext_xtheadsync;
 }
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/in=
sn_trans/trans_xthead.c.inc
index 8167de0393..37373732f6 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -46,6 +46,12 @@
     }                                            \
 } while (0)
=20
+#define REQUIRE_XTHEADFMEMIDX(ctx) do {          \
+    if (!ctx->cfg_ptr->ext_xtheadfmemidx) {      \
+        return false;                            \
+    }                                            \
+} while (0)
+
 #define REQUIRE_XTHEADMAC(ctx) do {              \
     if (!ctx->cfg_ptr->ext_xtheadmac) {          \
         return false;                            \
@@ -341,6 +347,108 @@ static bool trans_th_mvnez(DisasContext *ctx, arg_t=
h_mveqz *a)
     return gen_th_condmove(ctx, a, TCG_COND_NE);
 }
=20
+/* XTheadFMem */
+
+/*
+ * Load 64-bit float from indexed address.
+ * If !zext_offs, then address is rs1 + (rs2 << imm2).
+ * If  zext_offs, then address is rs1 + (zext(rs2[31:0]) << imm2).
+ */
+static bool gen_fload_idx(DisasContext *ctx, arg_th_memidx *a, MemOp mem=
op,
+                          bool zext_offs)
+{
+    TCGv_i64 rd =3D cpu_fpr[a->rd];
+    TCGv addr =3D get_th_address_indexed(ctx, a->rs1, a->rs2, a->imm2, z=
ext_offs);
+
+    tcg_gen_qemu_ld_i64(rd, addr, ctx->mem_idx, memop);
+    if ((memop & MO_SIZE) =3D=3D MO_32) {
+        gen_nanbox_s(rd, rd);
+    }
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+/*
+ * Store 64-bit float to indexed address.
+ * If !zext_offs, then address is rs1 + (rs2 << imm2).
+ * If  zext_offs, then address is rs1 + (zext(rs2[31:0]) << imm2).
+ */
+static bool gen_fstore_idx(DisasContext *ctx, arg_th_memidx *a, MemOp me=
mop,
+                           bool zext_offs)
+{
+    TCGv_i64 rd =3D cpu_fpr[a->rd];
+    TCGv addr =3D get_th_address_indexed(ctx, a->rs1, a->rs2, a->imm2, z=
ext_offs);
+
+    tcg_gen_qemu_st_i64(rd, addr, ctx->mem_idx, memop);
+
+    return true;
+}
+
+static bool trans_th_flrd(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADFMEMIDX(ctx);
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+    return gen_fload_idx(ctx, a, MO_TEUQ, false);
+}
+
+static bool trans_th_flrw(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADFMEMIDX(ctx);
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+    return gen_fload_idx(ctx, a, MO_TEUL, false);
+}
+
+static bool trans_th_flurd(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADFMEMIDX(ctx);
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+    return gen_fload_idx(ctx, a, MO_TEUQ, true);
+}
+
+static bool trans_th_flurw(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADFMEMIDX(ctx);
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+    return gen_fload_idx(ctx, a, MO_TEUL, true);
+}
+
+static bool trans_th_fsrd(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADFMEMIDX(ctx);
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+    return gen_fstore_idx(ctx, a, MO_TEUQ, false);
+}
+
+static bool trans_th_fsrw(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADFMEMIDX(ctx);
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+    return gen_fstore_idx(ctx, a, MO_TEUL, false);
+}
+
+static bool trans_th_fsurd(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADFMEMIDX(ctx);
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+    return gen_fstore_idx(ctx, a, MO_TEUQ, true);
+}
+
+static bool trans_th_fsurw(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADFMEMIDX(ctx);
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+    return gen_fstore_idx(ctx, a, MO_TEUL, true);
+}
+
 /* XTheadMac */
=20
 static bool gen_th_mac(DisasContext *ctx, arg_r *a,
--=20
2.39.1


