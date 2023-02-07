Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE35968D05F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:16:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI8G-00071n-Nn; Tue, 07 Feb 2023 02:11:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI8A-0006yI-4X
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:11:06 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI88-0000FD-BJ
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:11:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753864; x=1707289864;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CJG68sqN+NrS8ipvIJI8JUUAihny2K3Z3e8O8vk1MTo=;
 b=oODTS8fEIKuxECrskWGmOmsAlzPHQfto+cB5T7tQR8wzqlT2KJGUQYTx
 DEifb1kD4g25Z6/TYz1oYKYxfowpKenGKRm1g60a6FDrpMD6h+ug5hq8f
 k0rj1bHHkaLj7SrOxMlcS2cUAoENwGm8nLbT6222B+Vv0SEZmNIiUZBdV
 xtVFv9uwvT4Oe2C31DMCixVFA8he5sC5nCIu9M3Ha6VxJicx0zQyDninL
 hVZnQqcQcn/bFZ+O1rZAiHkOOkmQ69QVGIaqB43lwbL0aeAtg9dL2A4G4
 IC+Xb+ksaawoC+wch7IlxHRcz9rQs7RB0XFHCYfvXNjgNnPBuXN+lCpaO g==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657538"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:10:29 +0800
IronPort-SDR: zhPvDN7EsOWEfFyANGqlssxkWe1QaG8zlOD/ROFmw4OnPap15cy3bxEubrqMBgL8ewQJNhj093
 NkMZUBPY2+ZO7HyJfjxrmjRYQE3wFeeep5CBwvD1YJU92PCjWa2ohXOrWBcI1lRYUV2g4cZi4c
 p06gqMW/ExhrnXuRF335fAV1Hulf56hYUs/VLwzE7dSfHBSHsJ9pQV4IqYYQU5KdOengsP0eSj
 jvf0hsZPfu7vvBhTrba0ahRUVntam37gVKelXZhZLVTNVeS2fxWQEYTlclM8gyExUhMoS7xlp3
 CH4=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:27:46 -0800
IronPort-SDR: iXv+7BsKwVhX2EDlyJ8Rp1/L89jo/Xzy030Mmf4S/etNiHUS+nwgMRgrzwqDREf6tOw3al4Nyj
 s2MGlKi1oXJoi4kkDCflOu8V5VEGOkgf6fNLQ4eb38fS4e62dy3Ff0vR6UkdHDQk5dUaxpzcv5
 fiQMhJp+GXd479yGOYURCF9C7BD8xUhS0NaFyz7EBNw/cis4OqulIq8fvzF5DItHushpjrVowZ
 ckFx6VJV21+L7M5MlxfQKCq5JPW3GuOyApezO0Hk0vUP59bXCEaMvgMnU8rWSTvKACTbxr1iF1
 J6o=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:10:29 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vR91G33z1RwtC
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:10:29 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1675753828; x=1678345829; bh=CJG68sq
 N+NrS8ipvIJI8JUUAihny2K3Z3e8O8vk1MTo=; b=EqmFTtH521QjvlCZV3/LW3a
 Ek2LIfNdlooNiYiwKdignGbT6yKYaMMcw3maM9mKY1Wez/2tw2z6m9jj49tAughX
 7WXnBXP7ErD8HPGQ4CCEFbiznk7fwd3mX5IW+83bJaZDAncpVF1+PLTpUrobtVnQ
 yvyplc6zYpb8EOX53HnvhAQwFa/870KXhvPrvDm9ezFdF//WH3QXzts0hlrN29Av
 Uafgi1OtkIgb4pC7iwB1JhoVuw6ATJ+/gcVGE4WblWNrz73xStxbKpaSNvv12Zlb
 3yc6sOVBSc6FIMLA0+I+v5lUDvfGXks/7jL3puovLtu5cxDQj8YluztdKCYF3Bw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 4aq4d5QoNvXX for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:10:28 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vR70S4Bz1RvLy;
 Mon,  6 Feb 2023 23:10:26 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
 =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 20/32] RISC-V: Adding XTheadCondMov ISA extension
Date: Tue,  7 Feb 2023 17:09:31 +1000
Message-Id: <20230207070943.2558857-21-alistair.francis@opensource.wdc.com>
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

This patch adds support for the XTheadCondMov ISA extension.
The patch uses the T-Head specific decoder and translation.

Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
Message-Id: <20230131202013.2541053-7-christoph.muellner@vrull.eu>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                         |  1 +
 target/riscv/xthead.decode                 |  4 +++
 target/riscv/cpu.c                         |  2 ++
 target/riscv/translate.c                   |  2 +-
 target/riscv/insn_trans/trans_xthead.c.inc | 35 ++++++++++++++++++++++
 5 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 876eaebd0e..a313e025e7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -477,6 +477,7 @@ struct RISCVCPUConfig {
     bool ext_xtheadbb;
     bool ext_xtheadbs;
     bool ext_xtheadcmo;
+    bool ext_xtheadcondmov;
     bool ext_xtheadsync;
     bool ext_XVentanaCondOps;
=20
diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
index 8494805611..a8ebd8a18b 100644
--- a/target/riscv/xthead.decode
+++ b/target/riscv/xthead.decode
@@ -84,6 +84,10 @@ th_l2cache_call  0000000 10101 00000 000 00000 0001011
 th_l2cache_ciall 0000000 10111 00000 000 00000 0001011
 th_l2cache_iall  0000000 10110 00000 000 00000 0001011
=20
+# XTheadCondMov
+th_mveqz         0100000 ..... .....  001 ..... 0001011 @r
+th_mvnez         0100001 ..... .....  001 ..... 0001011 @r
+
 # XTheadSync
 th_sfence_vmas   0000010 ..... ..... 000 00000 0001011 @rs2_s
 th_sync          0000000 11000 00000 000 00000 0001011
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c541924214..13b065bc68 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -113,6 +113,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
     ISA_EXT_DATA_ENTRY(xtheadbb, true, PRIV_VERSION_1_11_0, ext_xtheadbb=
),
     ISA_EXT_DATA_ENTRY(xtheadbs, true, PRIV_VERSION_1_11_0, ext_xtheadbs=
),
     ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadc=
mo),
+    ISA_EXT_DATA_ENTRY(xtheadcondmov, true, PRIV_VERSION_1_11_0, ext_xth=
eadcondmov),
     ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xthead=
sync),
     ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_X=
VentanaCondOps),
 };
@@ -1097,6 +1098,7 @@ static Property riscv_cpu_extensions[] =3D {
     DEFINE_PROP_BOOL("xtheadbb", RISCVCPU, cfg.ext_xtheadbb, false),
     DEFINE_PROP_BOOL("xtheadbs", RISCVCPU, cfg.ext_xtheadbs, false),
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
+    DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, f=
alse),
     DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOp=
s, false),
=20
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 880324e617..4f4c09cd68 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -134,7 +134,7 @@ static bool has_xthead_p(DisasContext *ctx  __attribu=
te__((__unused__)))
 {
     return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
            ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
-           ctx->cfg_ptr->ext_xtheadsync;
+           ctx->cfg_ptr->ext_xtheadcondmov || ctx->cfg_ptr->ext_xtheadsy=
nc;
 }
=20
 #define MATERIALISE_EXT_PREDICATE(ext)  \
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/in=
sn_trans/trans_xthead.c.inc
index bc1605445d..089b51f468 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -40,6 +40,12 @@
     }                                            \
 } while (0)
=20
+#define REQUIRE_XTHEADCONDMOV(ctx) do {          \
+    if (!ctx->cfg_ptr->ext_xtheadcondmov) {      \
+        return false;                            \
+    }                                            \
+} while (0)
+
 #define REQUIRE_XTHEADSYNC(ctx) do {             \
     if (!ctx->cfg_ptr->ext_xtheadsync) {         \
         return false;                            \
@@ -264,6 +270,35 @@ NOP_PRIVCHECK(th_l2cache_call, REQUIRE_XTHEADCMO, RE=
QUIRE_PRIV_MS)
 NOP_PRIVCHECK(th_l2cache_ciall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
 NOP_PRIVCHECK(th_l2cache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
=20
+/* XTheadCondMov */
+
+static bool gen_th_condmove(DisasContext *ctx, arg_r *a, TCGCond cond)
+{
+    TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
+    TCGv old =3D get_gpr(ctx, a->rd, EXT_NONE);
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+
+    tcg_gen_movcond_tl(cond, dest, src2, ctx->zero, src1, old);
+
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+/* th.mveqz: "if (rs2 =3D=3D 0) rd =3D rs1;" */
+static bool trans_th_mveqz(DisasContext *ctx, arg_th_mveqz *a)
+{
+    REQUIRE_XTHEADCONDMOV(ctx);
+    return gen_th_condmove(ctx, a, TCG_COND_EQ);
+}
+
+/* th.mvnez: "if (rs2 !=3D 0) rd =3D rs1;" */
+static bool trans_th_mvnez(DisasContext *ctx, arg_th_mveqz *a)
+{
+    REQUIRE_XTHEADCONDMOV(ctx);
+    return gen_th_condmove(ctx, a, TCG_COND_NE);
+}
+
 /* XTheadSync */
=20
 static bool trans_th_sfence_vmas(DisasContext *ctx, arg_th_sfence_vmas *=
a)
--=20
2.39.1


