Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F39C68D073
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:18:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI8H-0007AI-6k; Tue, 07 Feb 2023 02:11:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI8B-0006yS-81
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:11:07 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI89-0008RS-AU
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:11:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753865; x=1707289865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A1v/pG05ubo+ZOwc1+d1JMwgqF8kbKeWIn58LD7YHa4=;
 b=chGUHO1SdxteQ3eIejq1TuZlq+u0JiZYyaA1euHFurpqkNSVhhPqCSMR
 g6LPafiPikhB8tFmSBUaxqoQNaYx5Z0r41iQXQZ8zIowsLMH6TMGhry/x
 vdIE7HM5i+wfs072KFG1Z2Ty7HkccJAS4UUb6hwttnmgYNtTcjT9/wKEt
 99HgGKdjhb/BY8tbI7wK9htmYAqjTh72lanm/gvqE1bbUEpSg1RPlIvQU
 A0O+4+aXNDkHZQlrkRpQTf+etv5uxskG+iVs8X7mPRx+M4w1NDYY7VJo4
 2m400SkSImFvjXHl3s6Lzll88lWH1p/CzYKS0LIAXccgJLjXX4+cBJdAd g==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657541"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:10:31 +0800
IronPort-SDR: 9ib7ZaKIAI4R9TqsCQm1kmM8N5vTG6NY/V6M5z+8u8vGAgi4tsqag6DL0EEIsJ+7PRkXdiR07b
 ygCr+rnqt016Q49wwoGoYkkThbjJqOeVoL4/Mnk7COARLzXQgeUidV1In4EEI9mjgtuwilIAoi
 XWzrXZYNPSA0EHevcHc/BaTGA4krVybsweE68+aFqdjT+0bPD4vFfqe+T8dTsPEwFfMBcG+mEx
 yIciRa01JxsZyXGYRCeCIsGhFvBNeem9eVzi1Uazxh+DvigY23zFpYInyD2PdX2qnjIVy8PRGh
 zYo=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:27:48 -0800
IronPort-SDR: HJDx1YUEKUeh/vzYTGtHYtqxW0kZGnE7qTD9JgVumb8bLVHeIDB0dTrm0+7KAv6hqDgRB9+kk3
 pyVhhp/kPG5zOKxo65eSIVV0IUED5dRZ5gdfQx6LM0zpUe7XZdZwMGgcDcQRtscdPJiv6QGIFF
 i+Oyc5VYtWIsWE/Urdx48KzIdDrvnSAX2qD8WeDwaDfojfwodYEHDhwMFGFMkw2Mjn6uQ7dyrZ
 LdpPrvqhy2597J4D62KX1Y2MYIUN1pdnehgdYc5r0wBYnRXxRv6nh1vVdJPNAVl7qye/pqjsLR
 c3Y=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:10:31 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vRC0vfBz1RwtC
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:10:31 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1675753830; x=1678345831; bh=A1v/pG0
 5ubo+ZOwc1+d1JMwgqF8kbKeWIn58LD7YHa4=; b=YQ9V+PanpYFTmfSeC0c8VZ5
 DiV+WDn/bLEQkMaLvGsRWub/JS4yoHsXf5e3F+CZmFop+BRtRZIO9286ddiVY/gT
 K5S99kCjbw1/1vhSoj7cflcmOiYw7WQuiSLlxK0PGEOqJytZ3ImE5vMDybo6PrnN
 hyyG+d2N2pxgqodz0oYXgzcydNUAg3pJqSxtwin4joE+JpuXxQf1DpZseihaqeZ0
 zQFbno25b/A94LOddgp1ykduuMpSheps0EvtyQ2IFw3TI/q1Pbt43iIh0yc/ak0f
 JSsqdll084OH1nAtmf1FSHy6nOJ8yANsQLGCau6xGOkzbReALu2PoMEZH/YQoGA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 6AB_yJHgngEC for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:10:30 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vR86Wbwz1RvTp;
 Mon,  6 Feb 2023 23:10:28 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
 =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 21/32] RISC-V: Adding T-Head multiply-accumulate instructions
Date: Tue,  7 Feb 2023 17:09:32 +1000
Message-Id: <20230207070943.2558857-22-alistair.francis@opensource.wdc.com>
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

This patch adds support for the T-Head MAC instructions.
The patch uses the T-Head specific decoder and translation.

Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
Message-Id: <20230131202013.2541053-8-christoph.muellner@vrull.eu>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                         |  1 +
 target/riscv/xthead.decode                 |  8 +++
 target/riscv/cpu.c                         |  2 +
 target/riscv/translate.c                   |  3 +-
 target/riscv/insn_trans/trans_xthead.c.inc | 83 ++++++++++++++++++++++
 5 files changed, 96 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a313e025e7..830b20558c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -478,6 +478,7 @@ struct RISCVCPUConfig {
     bool ext_xtheadbs;
     bool ext_xtheadcmo;
     bool ext_xtheadcondmov;
+    bool ext_xtheadmac;
     bool ext_xtheadsync;
     bool ext_XVentanaCondOps;
=20
diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
index a8ebd8a18b..696de6cecf 100644
--- a/target/riscv/xthead.decode
+++ b/target/riscv/xthead.decode
@@ -88,6 +88,14 @@ th_l2cache_iall  0000000 10110 00000 000 00000 0001011
 th_mveqz         0100000 ..... .....  001 ..... 0001011 @r
 th_mvnez         0100001 ..... .....  001 ..... 0001011 @r
=20
+# XTheadMac
+th_mula          00100 00 ..... ..... 001 ..... 0001011 @r
+th_mulah         00101 00 ..... ..... 001 ..... 0001011 @r
+th_mulaw         00100 10 ..... ..... 001 ..... 0001011 @r
+th_muls          00100 01 ..... ..... 001 ..... 0001011 @r
+th_mulsh         00101 01 ..... ..... 001 ..... 0001011 @r
+th_mulsw         00100 11 ..... ..... 001 ..... 0001011 @r
+
 # XTheadSync
 th_sfence_vmas   0000010 ..... ..... 000 00000 0001011 @rs2_s
 th_sync          0000000 11000 00000 000 00000 0001011
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 13b065bc68..88da4de14d 100644
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
+    ISA_EXT_DATA_ENTRY(xtheadmac, true, PRIV_VERSION_1_11_0, ext_xtheadm=
ac),
     ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xthead=
sync),
     ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_X=
VentanaCondOps),
 };
@@ -1099,6 +1100,7 @@ static Property riscv_cpu_extensions[] =3D {
     DEFINE_PROP_BOOL("xtheadbs", RISCVCPU, cfg.ext_xtheadbs, false),
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, f=
alse),
+    DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
     DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOp=
s, false),
=20
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 4f4c09cd68..e5a57a8516 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -134,7 +134,8 @@ static bool has_xthead_p(DisasContext *ctx  __attribu=
te__((__unused__)))
 {
     return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
            ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
-           ctx->cfg_ptr->ext_xtheadcondmov || ctx->cfg_ptr->ext_xtheadsy=
nc;
+           ctx->cfg_ptr->ext_xtheadcondmov || ctx->cfg_ptr->ext_xtheadma=
c ||
+           ctx->cfg_ptr->ext_xtheadsync;
 }
=20
 #define MATERIALISE_EXT_PREDICATE(ext)  \
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/in=
sn_trans/trans_xthead.c.inc
index 089b51f468..31a4034927 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -46,6 +46,12 @@
     }                                            \
 } while (0)
=20
+#define REQUIRE_XTHEADMAC(ctx) do {              \
+    if (!ctx->cfg_ptr->ext_xtheadmac) {          \
+        return false;                            \
+    }                                            \
+} while (0)
+
 #define REQUIRE_XTHEADSYNC(ctx) do {             \
     if (!ctx->cfg_ptr->ext_xtheadsync) {         \
         return false;                            \
@@ -299,6 +305,83 @@ static bool trans_th_mvnez(DisasContext *ctx, arg_th=
_mveqz *a)
     return gen_th_condmove(ctx, a, TCG_COND_NE);
 }
=20
+/* XTheadMac */
+
+static bool gen_th_mac(DisasContext *ctx, arg_r *a,
+                       void (*accumulate_func)(TCGv, TCGv, TCGv),
+                       void (*extend_operand_func)(TCGv, TCGv))
+{
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv src0 =3D get_gpr(ctx, a->rd, EXT_NONE);
+    TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
+    TCGv tmp =3D tcg_temp_new();
+
+    if (extend_operand_func) {
+        TCGv tmp2 =3D tcg_temp_new();
+        extend_operand_func(tmp, src1);
+        extend_operand_func(tmp2, src2);
+        tcg_gen_mul_tl(tmp, tmp, tmp2);
+        tcg_temp_free(tmp2);
+    } else {
+        tcg_gen_mul_tl(tmp, src1, src2);
+    }
+
+    accumulate_func(dest, src0, tmp);
+    gen_set_gpr(ctx, a->rd, dest);
+    tcg_temp_free(tmp);
+
+    return true;
+}
+
+/* th.mula: "rd =3D rd + rs1 * rs2" */
+static bool trans_th_mula(DisasContext *ctx, arg_th_mula *a)
+{
+    REQUIRE_XTHEADMAC(ctx);
+    return gen_th_mac(ctx, a, tcg_gen_add_tl, NULL);
+}
+
+/* th.mulah: "rd =3D sext.w(rd + sext.w(rs1[15:0]) * sext.w(rs2[15:0]))"=
 */
+static bool trans_th_mulah(DisasContext *ctx, arg_th_mulah *a)
+{
+    REQUIRE_XTHEADMAC(ctx);
+    ctx->ol =3D MXL_RV32;
+    return gen_th_mac(ctx, a, tcg_gen_add_tl, tcg_gen_ext16s_tl);
+}
+
+/* th.mulaw: "rd =3D sext.w(rd + rs1 * rs2)" */
+static bool trans_th_mulaw(DisasContext *ctx, arg_th_mulaw *a)
+{
+    REQUIRE_XTHEADMAC(ctx);
+    REQUIRE_64BIT(ctx);
+    ctx->ol =3D MXL_RV32;
+    return gen_th_mac(ctx, a, tcg_gen_add_tl, NULL);
+}
+
+/* th.muls: "rd =3D rd - rs1 * rs2" */
+static bool trans_th_muls(DisasContext *ctx, arg_th_muls *a)
+{
+    REQUIRE_XTHEADMAC(ctx);
+    return gen_th_mac(ctx, a, tcg_gen_sub_tl, NULL);
+}
+
+/* th.mulsh: "rd =3D sext.w(rd - sext.w(rs1[15:0]) * sext.w(rs2[15:0]))"=
 */
+static bool trans_th_mulsh(DisasContext *ctx, arg_th_mulsh *a)
+{
+    REQUIRE_XTHEADMAC(ctx);
+    ctx->ol =3D MXL_RV32;
+    return gen_th_mac(ctx, a, tcg_gen_sub_tl, tcg_gen_ext16s_tl);
+}
+
+/* th.mulsw: "rd =3D sext.w(rd - rs1 * rs2)" */
+static bool trans_th_mulsw(DisasContext *ctx, arg_th_mulsw *a)
+{
+    REQUIRE_XTHEADMAC(ctx);
+    REQUIRE_64BIT(ctx);
+    ctx->ol =3D MXL_RV32;
+    return gen_th_mac(ctx, a, tcg_gen_sub_tl, NULL);
+}
+
 /* XTheadSync */
=20
 static bool trans_th_sfence_vmas(DisasContext *ctx, arg_th_sfence_vmas *=
a)
--=20
2.39.1


