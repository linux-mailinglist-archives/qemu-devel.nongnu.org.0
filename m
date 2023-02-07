Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CB468D075
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:18:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI9X-0000o6-6F; Tue, 07 Feb 2023 02:12:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI8a-0000Qi-Ir
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:11:32 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI8Y-0008RS-3i
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:11:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753890; x=1707289890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fZq8j/Z0sB8UQr9g3SVkvXP73yOPreTU5lG++Cj3Its=;
 b=Zjv9d4roYYkZ6ohRudFqlrd9qIFUWVvr3XTBflp9HUJ+OwZldWiYUFpC
 Wn8sEpqaqboWjData6YeM9qiz8pwieCE9sYP6aLX/oyrKBZnq35Vsm0x/
 QrcxFvLPstcyn62w7rs2GLX4ndR2eISEI30vfVv4dQ0+zBGxnJQdPMUg4
 87cPGfhUmR2+GgHa2uc4UPJVgU2HDY7K+OuHZRVxGoljipKwTEGl1GEnt
 sMlOw+rlZUYTd2natZBR/wh1T9FyRY5QQvyRTsjr5BBsh5MxyvjMgEHUJ
 rw/yLVMBmcdUVJyWv+WGtQEDdnIofUNj7p4zgKP9WKRZoTPMybYCONxKh A==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657566"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:10:43 +0800
IronPort-SDR: YeV9nqBzESnNBzzQC9yILUcqFwdG65cgUJMSxkofF3g1jOQRvLqkCnN9KTv4r2NYsnFcqJhtJC
 sO5AHDQb0YqBaWQY9qLfJ7wYNDsCRlglkXaQN89RMES3fZ0PV1ac4BXl+B4Aru1BxyR0Ysdxvr
 QNAJ7aFFIRdGDU1ad3Kfn7mEORT+vZVhOXCqMazltgQigS4bGE9CnxyjlT0VT63xjrk9TqN83p
 CZt/D9hIjBSco2Fkph17M3mwTucIn98ErBkI62ATi+iXJwBWLlHtiiAaY8srrjJBXpoKIICSAc
 dhM=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:28:00 -0800
IronPort-SDR: BUPYM7HIn5zpItkLWqGpimk+deScT7KwGo1HRucFPtQnDs50l/j6rR5oWOj6llnax8b8ib24lM
 xUEp2e63Rg0xrGu/Tm1WK9WSFZPcjeqy5ePCmzjP1usMXCQ1N2tkkDvXJZcVDQHuKX5R/r12t9
 zhroP5SNeE6cIl1RS/enD/A9E58Q0/FX+Fd5Y26fA1UPMn4uaZFZmy73UBgsGJJDl9bDNLXYLX
 Pcd1zsuaZYVvGdneFFH5AgxDeZNtCgY09sSIh41FT+cA8MOwI2OpUP1/3j3X7XjmdNS6gzq6D7
 Scg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:10:43 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vRR2PSyz1RwqL
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:10:43 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1675753842; x=1678345843; bh=fZq8j/Z
 0sB8UQr9g3SVkvXP73yOPreTU5lG++Cj3Its=; b=ppD5fzDdvfLb2UX9fdCoXun
 OsTdpIASraS4do5nqRoQI5fmIAEaQa2Aei6eJGpaNq18EyI+C+Jr9vT5fXMYR14P
 PG/jJUwu3UIQXx2tTcjbKkWJrltw2U83Sj32aUH2+gXKxC78D63v/jMgfsTx2mpr
 YsKaHV0iwX9HzYJ9VIyRIhK/8AEk9Vf1ehSXYCpY4ZkohRGeDxYyh90ldIAqE5TQ
 4bMrE/UtIump2YINmIwb+D7t/5JSZSpF1cMpfK0medSNcKO17QOw4W2+0ZDOxdTn
 bf/HCezPw27KJvrtPCI8JwuNAo3326QWdNulmulAHrnqeccAlU3HR5iO3c4vHJA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id dLCbQEl4vxdc for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:10:42 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vRP26zKz1RvLy;
 Mon,  6 Feb 2023 23:10:41 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
 =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 27/32] RISC-V: Adding XTheadFmv ISA extension
Date: Tue,  7 Feb 2023 17:09:38 +1000
Message-Id: <20230207070943.2558857-28-alistair.francis@opensource.wdc.com>
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

This patch adds support for the XTheadFmv ISA extension.
The patch uses the T-Head specific decoder and translation.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
Message-Id: <20230131202013.2541053-14-christoph.muellner@vrull.eu>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                         |  1 +
 target/riscv/xthead.decode                 |  4 ++
 target/riscv/cpu.c                         |  2 +
 target/riscv/translate.c                   |  6 +--
 target/riscv/insn_trans/trans_xthead.c.inc | 45 ++++++++++++++++++++++
 5 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 60478f4a9c..7128438d8e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -480,6 +480,7 @@ struct RISCVCPUConfig {
     bool ext_xtheadcmo;
     bool ext_xtheadcondmov;
     bool ext_xtheadfmemidx;
+    bool ext_xtheadfmv;
     bool ext_xtheadmac;
     bool ext_xtheadmemidx;
     bool ext_xtheadmempair;
diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
index 81daf1d694..d1d104bcf2 100644
--- a/target/riscv/xthead.decode
+++ b/target/riscv/xthead.decode
@@ -110,6 +110,10 @@ th_fsrw          01000 .. ..... ..... 111 ..... 0001=
011 @th_memidx
 th_fsurd         01110 .. ..... ..... 111 ..... 0001011 @th_memidx
 th_fsurw         01010 .. ..... ..... 111 ..... 0001011 @th_memidx
=20
+# XTheadFmv
+th_fmv_hw_x      1010000  00000 ..... 001 ..... 0001011 @r2
+th_fmv_x_hw      1100000  00000 ..... 001 ..... 0001011 @r2
+
 # XTheadMac
 th_mula          00100 00 ..... ..... 001 ..... 0001011 @r
 th_mulah         00101 00 ..... ..... 001 ..... 0001011 @r
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8cbc5c9c1b..0dd2f0c753 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -116,6 +116,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
     ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadc=
mo),
     ISA_EXT_DATA_ENTRY(xtheadcondmov, true, PRIV_VERSION_1_11_0, ext_xth=
eadcondmov),
     ISA_EXT_DATA_ENTRY(xtheadfmemidx, true, PRIV_VERSION_1_11_0, ext_xth=
eadfmemidx),
+    ISA_EXT_DATA_ENTRY(xtheadfmv, true, PRIV_VERSION_1_11_0, ext_xtheadf=
mv),
     ISA_EXT_DATA_ENTRY(xtheadmac, true, PRIV_VERSION_1_11_0, ext_xtheadm=
ac),
     ISA_EXT_DATA_ENTRY(xtheadmemidx, true, PRIV_VERSION_1_11_0, ext_xthe=
admemidx),
     ISA_EXT_DATA_ENTRY(xtheadmempair, true, PRIV_VERSION_1_11_0, ext_xth=
eadmempair),
@@ -1134,6 +1135,7 @@ static Property riscv_cpu_extensions[] =3D {
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, f=
alse),
     DEFINE_PROP_BOOL("xtheadfmemidx", RISCVCPU, cfg.ext_xtheadfmemidx, f=
alse),
+    DEFINE_PROP_BOOL("xtheadfmv", RISCVCPU, cfg.ext_xtheadfmv, false),
     DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
     DEFINE_PROP_BOOL("xtheadmemidx", RISCVCPU, cfg.ext_xtheadmemidx, fal=
se),
     DEFINE_PROP_BOOL("xtheadmempair", RISCVCPU, cfg.ext_xtheadmempair, f=
alse),
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 216eaf9d12..182649dcb6 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -135,9 +135,9 @@ static bool has_xthead_p(DisasContext *ctx  __attribu=
te__((__unused__)))
     return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
            ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
            ctx->cfg_ptr->ext_xtheadcondmov ||
-           ctx->cfg_ptr->ext_xtheadfmemidx || ctx->cfg_ptr->ext_xtheadma=
c ||
-           ctx->cfg_ptr->ext_xtheadmemidx || ctx->cfg_ptr->ext_xtheadmem=
pair ||
-           ctx->cfg_ptr->ext_xtheadsync;
+           ctx->cfg_ptr->ext_xtheadfmemidx || ctx->cfg_ptr->ext_xtheadfm=
v ||
+           ctx->cfg_ptr->ext_xtheadmac || ctx->cfg_ptr->ext_xtheadmemidx=
 ||
+           ctx->cfg_ptr->ext_xtheadmempair || ctx->cfg_ptr->ext_xtheadsy=
nc;
 }
=20
 #define MATERIALISE_EXT_PREDICATE(ext)  \
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/in=
sn_trans/trans_xthead.c.inc
index 37373732f6..be87c34f56 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -52,6 +52,12 @@
     }                                            \
 } while (0)
=20
+#define REQUIRE_XTHEADFMV(ctx) do {              \
+    if (!ctx->cfg_ptr->ext_xtheadfmv) {          \
+        return false;                            \
+    }                                            \
+} while (0)
+
 #define REQUIRE_XTHEADMAC(ctx) do {              \
     if (!ctx->cfg_ptr->ext_xtheadmac) {          \
         return false;                            \
@@ -449,6 +455,45 @@ static bool trans_th_fsurw(DisasContext *ctx, arg_th=
_memidx *a)
     return gen_fstore_idx(ctx, a, MO_TEUL, true);
 }
=20
+/* XTheadFmv */
+
+static bool trans_th_fmv_hw_x(DisasContext *ctx, arg_th_fmv_hw_x *a)
+{
+    REQUIRE_XTHEADFMV(ctx);
+    REQUIRE_32BIT(ctx);
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+
+    TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_ZERO);
+    TCGv_i64 t1 =3D tcg_temp_new_i64();
+
+    tcg_gen_extu_tl_i64(t1, src1);
+    tcg_gen_deposit_i64(cpu_fpr[a->rd], cpu_fpr[a->rd], t1, 32, 32);
+    tcg_temp_free_i64(t1);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_th_fmv_x_hw(DisasContext *ctx, arg_th_fmv_x_hw *a)
+{
+    REQUIRE_XTHEADFMV(ctx);
+    REQUIRE_32BIT(ctx);
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+    TCGv dst;
+    TCGv_i64 t1;
+
+    dst =3D dest_gpr(ctx, a->rd);
+    t1 =3D tcg_temp_new_i64();
+
+    tcg_gen_extract_i64(t1, cpu_fpr[a->rs1], 32, 32);
+    tcg_gen_trunc_i64_tl(dst, t1);
+    gen_set_gpr(ctx, a->rd, dst);
+    tcg_temp_free_i64(t1);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
 /* XTheadMac */
=20
 static bool gen_th_mac(DisasContext *ctx, arg_r *a,
--=20
2.39.1


