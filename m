Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F8068D037
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:11:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI83-0006w8-28; Tue, 07 Feb 2023 02:10:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7z-0006v3-UL
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:56 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7y-0000FW-0i
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753853; x=1707289853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pv9AFwkxigoQu4NgNguiFnSgS5fcipWBfy5BDeh7w/A=;
 b=nJQ7bmi5kEkWK0boQKjsvfHDT1afNHa7QeOo4d5uZ1Y1UxhfajGebxHw
 nWxcAWEwZoPIf3Rd9i0gizchJXAmVo3wn1Lm85/V3WNh181PgEz01gA2t
 ntbcmlMVAdX6TJEox6i7LYz5CYlJk4D06mrd+RiIJ1cA1KfL1RHhT8f//
 TliRS5/PI8QUHeN7RxUdl6PfOvk0EicFn82ultcPHeo0kqp/mj+fflVg+
 b+jPB0W5AZIKF2DA8OG+w3bONd16WfHG0a+RY5Iz4FwkH3F7lY4X/ugd4
 eldH6NCo4as3TNLHVDGbtAjeiFKdD1DrRNW3FnuDHVC4WeJn9YnMRoSKW Q==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657531"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:10:27 +0800
IronPort-SDR: 0A8hIpe/gHvxu14SpMzji+k5bRRZtKxlyBD2y/EK8RR2uFj1J09DXNICqcVZ5zaS0ODz13wAEI
 tXmex8QHdPGpql3Drmdz7opGtkkOgoheKtm2uCSZkJdAF9FTOQ4HW/imH2z23JQW1+YZV5HtGi
 dLct8qXNyCx9/QAgxPcSolYb72JRwbwLUV9E+4DPUOSxga0FixBcXKoGaRsbVvhnGGKWSwz34K
 z57cIkDkuQuGNszDk1iao6p4C2uXNLQv3pW3JGLBqoK5Gksb3jJ6MKKPAOQ8VS7wjgQ8ilECIv
 DLQ=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:27:44 -0800
IronPort-SDR: ysqrPL6dmZSKiu2O1Kn62cKPVOs2/Jv+r4NsnhDQatmHDropnglFcDXsu+E7RB6l2BThjMb4vH
 eQ4m0d/kXUhHcsIBRLtU4uAwGEmAzbb8M82M8xD8VXsTbofP7y2+11bcKBtts/aC/EqSpmx7Ij
 B0UsZlBSVUH6PWTdwGBD8Ya2BWQ9g9QWTEAlT55c6wKaBjmssyLXqAuwWKlpU7p8TXWugoIunZ
 NOBqFaqww9LvzCu/+gEsviEwdve4eECEPI1VwQs/KeCPrGaBc5ISuLhbQc6ugok6laIHI2UgoG
 QvQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:10:27 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vR71gGTz1RwqL
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:10:27 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1675753826; x=1678345827; bh=Pv9AFwk
 xigoQu4NgNguiFnSgS5fcipWBfy5BDeh7w/A=; b=NXs0JXQbki/S90lX/+dDtBq
 y/6GZKtop7R31S2e5qjOF4ZCQ4WiG1iLew6R5vRp7a7AEkJp7CbfnpQNy3bbszEt
 YtKM5+k4SMV9x2T2+Kgb53JtsiD5xjk/4VURhG4BTZKrfb4TbbDCs48X7VyTVZUP
 vRrsN1Hv+4jx2hIIje3pWw62pkNbGtGc+Y6A3dTSgrRLfxKTr+z3bZdeW+0vsLZH
 sELaMqkAyQjYqMdz51rTIAnr/xHLF+WanWsXZf9gwM3uy3qGh/G14rf8P8Pp3v2z
 m38HV4NAnDSE28HDU6DYeIjyXg6jLJ7Dvr/4JBXHzCDCFopNY1cJF2Y1BlRCFag=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Lz6evLAp8bJ3 for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:10:26 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vR4521lz1RvTp;
 Mon,  6 Feb 2023 23:10:24 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
 =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 19/32] RISC-V: Adding XTheadBs ISA extension
Date: Tue,  7 Feb 2023 17:09:30 +1000
Message-Id: <20230207070943.2558857-20-alistair.francis@opensource.wdc.com>
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

This patch adds support for the XTheadBs ISA extension.
The patch uses the T-Head specific decoder and translation.

Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
Message-Id: <20230131202013.2541053-6-christoph.muellner@vrull.eu>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                         |  1 +
 target/riscv/xthead.decode                 |  3 +++
 target/riscv/cpu.c                         |  2 ++
 target/riscv/translate.c                   |  3 ++-
 target/riscv/insn_trans/trans_xthead.c.inc | 15 +++++++++++++++
 5 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index be86c2fb95..876eaebd0e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -475,6 +475,7 @@ struct RISCVCPUConfig {
     /* Vendor-specific custom extensions */
     bool ext_xtheadba;
     bool ext_xtheadbb;
+    bool ext_xtheadbs;
     bool ext_xtheadcmo;
     bool ext_xtheadsync;
     bool ext_XVentanaCondOps;
diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
index 8cd140891b..8494805611 100644
--- a/target/riscv/xthead.decode
+++ b/target/riscv/xthead.decode
@@ -58,6 +58,9 @@ th_rev           1000001 00000 ..... 001 ..... 0001011 =
@r2
 th_revw          1001000 00000 ..... 001 ..... 0001011 @r2
 th_tstnbz        1000000 00000 ..... 001 ..... 0001011 @r2
=20
+# XTheadBs
+th_tst           100010 ...... ..... 001 ..... 0001011 @sh6
+
 # XTheadCmo
 th_dcache_call   0000000 00001 00000 000 00000 0001011
 th_dcache_ciall  0000000 00011 00000 000 00000 0001011
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index def27a53f2..c541924214 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -111,6 +111,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
     ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
     ISA_EXT_DATA_ENTRY(xtheadba, true, PRIV_VERSION_1_11_0, ext_xtheadba=
),
     ISA_EXT_DATA_ENTRY(xtheadbb, true, PRIV_VERSION_1_11_0, ext_xtheadbb=
),
+    ISA_EXT_DATA_ENTRY(xtheadbs, true, PRIV_VERSION_1_11_0, ext_xtheadbs=
),
     ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadc=
mo),
     ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xthead=
sync),
     ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_X=
VentanaCondOps),
@@ -1094,6 +1095,7 @@ static Property riscv_cpu_extensions[] =3D {
     /* Vendor-specific custom extensions */
     DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
     DEFINE_PROP_BOOL("xtheadbb", RISCVCPU, cfg.ext_xtheadbb, false),
+    DEFINE_PROP_BOOL("xtheadbs", RISCVCPU, cfg.ext_xtheadbs, false),
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOp=
s, false),
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 387ef0ad8b..880324e617 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -133,7 +133,8 @@ static bool always_true_p(DisasContext *ctx  __attrib=
ute__((__unused__)))
 static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
 {
     return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
-           ctx->cfg_ptr->ext_xtheadcmo || ctx->cfg_ptr->ext_xtheadsync;
+           ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
+           ctx->cfg_ptr->ext_xtheadsync;
 }
=20
 #define MATERIALISE_EXT_PREDICATE(ext)  \
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/in=
sn_trans/trans_xthead.c.inc
index ebfab90dd9..bc1605445d 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -28,6 +28,12 @@
     }                                            \
 } while (0)
=20
+#define REQUIRE_XTHEADBS(ctx) do {               \
+    if (!ctx->cfg_ptr->ext_xtheadbs) {           \
+        return false;                            \
+    }                                            \
+} while (0)
+
 #define REQUIRE_XTHEADCMO(ctx) do {              \
     if (!ctx->cfg_ptr->ext_xtheadcmo) {          \
         return false;                            \
@@ -191,6 +197,15 @@ static bool trans_th_tstnbz(DisasContext *ctx, arg_t=
h_tstnbz *a)
     return gen_unary(ctx, a, EXT_ZERO, gen_th_tstnbz);
 }
=20
+/* XTheadBs */
+
+/* th.tst is an alternate encoding for bexti (from Zbs) */
+static bool trans_th_tst(DisasContext *ctx, arg_th_tst *a)
+{
+    REQUIRE_XTHEADBS(ctx);
+    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bext);
+}
+
 /* XTheadCmo */
=20
 static inline int priv_level(DisasContext *ctx)
--=20
2.39.1


