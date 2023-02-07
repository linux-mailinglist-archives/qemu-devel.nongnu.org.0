Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 619C468D043
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:12:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI7z-0006ut-PS; Tue, 07 Feb 2023 02:10:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7y-0006uR-1i
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:54 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7w-0000FD-1E
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753851; x=1707289851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HxNdFIrfrIbT2zaILVCY9Z7JvLJT5NAftgeXNy0lQL4=;
 b=JoOrg11ehWiZO8kZ/JnbDwZkW66ygx1cS5BtTD92mqzQxLbnibUqTiCg
 JVjuRwm/au2EAx4/mDYSkXenGO/IrrWiTi4gFG+kPbKS8uDBopqGxNM37
 go56Gs03GeJwZfc1maBs2iVR3+RBGQ16NLjxgXekoKxo5mdSmwGBjA1qN
 VB+EfZu1Niafho9+9S930XQfpYgAxJcIzkipoHMrYKGH5qdgibeWWjlRR
 pavh1KbJ6XFrf1KozgWxJnZdJ7rMrDwlpqEGDT129np3IxWipEmTA+okM
 7NyHdlTDkSrufs2SCo03hEHrCef0lefbUK9Ol4HnwKuAmG6KfBnC6CnPp w==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657516"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:10:23 +0800
IronPort-SDR: xbXpiT2YfaTwkkvruTvK5bqKcaVLH01GeMWyELm3rRXX5CIVJ+/r2IxcDCxn9QYqjBUCZ9Irei
 7kOrRCtKXy2TNkQRpWUh+8MU4zAlBRG4evS3bJ4YKTpTAHOwQvG+OjjYR3ndjp1dwm6h7AGvsH
 8Leeq+UBuexIu1ty1NF2vs3zApv2KBF3VIXm6xYUan66bzyhy/V8GWc4vEc8qnFYuhXbPrE1RZ
 Ks+PtAo2+N5hrx3/QiU7smDuTBuVxgaBMDu5Ao4CbgURfoJ20/2tvhgvNLH9fx3qFIFocJFL15
 iFI=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:27:40 -0800
IronPort-SDR: c0GvaRNOF6FN6MqavAtxg9aNc5OoXmIYVcF2EmB05aJ1q9uDupnJRUcCB0+2vr0u+HtY8Oyoah
 Ui0xvr2ahyjN8ZS+ziU5Tt/TDYkU8hPiGyj8ReZ0rdWe4nb7UEQUfnKNWHWHjiFxfmhv7NzBxA
 /vZNIvKjO2YlGWhlO5BlaYD5dL+wfH8giTD8/Iw43WdhI99brHwnz1BACo8Q3/4LHT2iBl0d/g
 nZqeEaBw9xBGSbGEXmXBZuq6xDAWxWda/R6fnDXTK7jVsUONTI43gTlQ05iy4p1UBTgeL47cai
 3Pc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:10:23 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vR26Wjyz1Rwt8
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:10:22 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1675753821; x=1678345822; bh=HxNdFIr
 frIbT2zaILVCY9Z7JvLJT5NAftgeXNy0lQL4=; b=AwwpMHYFDY/3Q5WKOycQGS0
 JtrU2J6qd9/c3arNnHIkEdKzopvNqMOb6Ut/7rkwZpQHjBxvbF67n7/sifSjPy96
 ZxugWyxzKkZ+j281Q0sGAV+D0NAO/YVXOGp8UhXsx44YmHd3Ul3rH6r6Ht/tmjqb
 YhMfGo2zx95kV5+MevD/N/M09qKmFk+IjAVl65E6BIQDx1qcMGqoYiiy8G13GIGi
 4kGp8eLNIKpeSM1ReSawxV9+4cRRNKcPlremrkjXFlauVQWmMZLwy1ji2aI+AA5l
 4j16v3xlrEZLXOjS0dxCajgIiMBujoSGd7xk6S2pUlgtLo9QMvA6ARgBuNI+igw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id AJzP04ja5bVe for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:10:21 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vR015c6z1RvTp;
 Mon,  6 Feb 2023 23:10:19 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
 =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 17/32] RISC-V: Adding XTheadBa ISA extension
Date: Tue,  7 Feb 2023 17:09:28 +1000
Message-Id: <20230207070943.2558857-18-alistair.francis@opensource.wdc.com>
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

This patch adds support for the XTheadBa ISA extension.
The patch uses the T-Head specific decoder and translation.

Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
Message-Id: <20230131202013.2541053-4-christoph.muellner@vrull.eu>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                         |  1 +
 target/riscv/xthead.decode                 | 22 ++++++++++++
 target/riscv/cpu.c                         |  2 ++
 target/riscv/translate.c                   |  3 +-
 target/riscv/insn_trans/trans_xthead.c.inc | 39 ++++++++++++++++++++++
 5 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ea00586436..f1f7795bd5 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -473,6 +473,7 @@ struct RISCVCPUConfig {
     uint64_t mimpid;
=20
     /* Vendor-specific custom extensions */
+    bool ext_xtheadba;
     bool ext_xtheadcmo;
     bool ext_xtheadsync;
     bool ext_XVentanaCondOps;
diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
index 1d86f3a012..b149f13018 100644
--- a/target/riscv/xthead.decode
+++ b/target/riscv/xthead.decode
@@ -2,6 +2,7 @@
 # Translation routines for the instructions of the XThead* ISA extension=
s
 #
 # Copyright (c) 2022 Christoph Muellner, christoph.muellner@vrull.eu
+#                    Dr. Philipp Tomsich, philipp.tomsich@vrull.eu
 #
 # SPDX-License-Identifier: LGPL-2.1-or-later
 #
@@ -9,12 +10,33 @@
 #   https://github.com/T-head-Semi/thead-extension-spec/releases/latest
=20
 # Fields:
+%rd        7:5
 %rs1       15:5
 %rs2       20:5
=20
+# Argument sets
+&r         rd rs1 rs2                               !extern
+
 # Formats
 @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
 @rs2_s      ....... ..... ..... ... ..... .......   %rs2 %rs1
+@r          ....... ..... .....  ... ..... .......  &r %rs2 %rs1 %rd
+
+# XTheadBa
+# Instead of defining a new encoding, we simply use the decoder to
+# extract the imm[0:1] field and dispatch to separate translation
+# functions (mirroring the `sh[123]add` instructions from Zba and
+# the regular RVI `add` instruction.
+#
+# The only difference between sh[123]add and addsl is that the shift
+# is applied to rs1 (for addsl) instead of rs2 (for sh[123]add).
+#
+# Note that shift-by-0 is a valid operation according to the manual.
+# This will be equivalent to a regular add.
+add              0000000 ..... ..... 001 ..... 0001011 @r
+th_addsl1        0000001 ..... ..... 001 ..... 0001011 @r
+th_addsl2        0000010 ..... ..... 001 ..... 0001011 @r
+th_addsl3        0000011 ..... ..... 001 ..... 0001011 @r
=20
 # XTheadCmo
 th_dcache_call   0000000 00001 00000 000 00000 0001011
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f76639845d..dd5ff82f22 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -109,6 +109,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
     ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
     ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
     ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
+    ISA_EXT_DATA_ENTRY(xtheadba, true, PRIV_VERSION_1_11_0, ext_xtheadba=
),
     ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadc=
mo),
     ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xthead=
sync),
     ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_X=
VentanaCondOps),
@@ -1090,6 +1091,7 @@ static Property riscv_cpu_extensions[] =3D {
     DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
=20
     /* Vendor-specific custom extensions */
+    DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOp=
s, false),
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0657a4bea2..4683562ecf 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -132,7 +132,8 @@ static bool always_true_p(DisasContext *ctx  __attrib=
ute__((__unused__)))
=20
 static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
 {
-    return ctx->cfg_ptr->ext_xtheadcmo || ctx->cfg_ptr->ext_xtheadsync;
+    return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadcmo ||
+           ctx->cfg_ptr->ext_xtheadsync;
 }
=20
 #define MATERIALISE_EXT_PREDICATE(ext)  \
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/in=
sn_trans/trans_xthead.c.inc
index f35bf6ea89..a6fb8132a8 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -16,6 +16,12 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
=20
+#define REQUIRE_XTHEADBA(ctx) do {               \
+    if (!ctx->cfg_ptr->ext_xtheadba) {           \
+        return false;                            \
+    }                                            \
+} while (0)
+
 #define REQUIRE_XTHEADCMO(ctx) do {              \
     if (!ctx->cfg_ptr->ext_xtheadcmo) {          \
         return false;                            \
@@ -28,6 +34,39 @@
     }                                            \
 } while (0)
=20
+/* XTheadBa */
+
+/*
+ * th.addsl is similar to sh[123]add (from Zba), but not an
+ * alternative encoding: while sh[123] applies the shift to rs1,
+ * th.addsl shifts rs2.
+ */
+
+#define GEN_TH_ADDSL(SHAMT)                                     \
+static void gen_th_addsl##SHAMT(TCGv ret, TCGv arg1, TCGv arg2) \
+{                                                               \
+    TCGv t =3D tcg_temp_new();                                    \
+    tcg_gen_shli_tl(t, arg2, SHAMT);                            \
+    tcg_gen_add_tl(ret, t, arg1);                               \
+    tcg_temp_free(t);                                           \
+}
+
+GEN_TH_ADDSL(1)
+GEN_TH_ADDSL(2)
+GEN_TH_ADDSL(3)
+
+#define GEN_TRANS_TH_ADDSL(SHAMT)                                       =
\
+static bool trans_th_addsl##SHAMT(DisasContext *ctx,                    =
\
+                                  arg_th_addsl##SHAMT * a)              =
\
+{                                                                       =
\
+    REQUIRE_XTHEADBA(ctx);                                              =
\
+    return gen_arith(ctx, a, EXT_NONE, gen_th_addsl##SHAMT, NULL);      =
\
+}
+
+GEN_TRANS_TH_ADDSL(1)
+GEN_TRANS_TH_ADDSL(2)
+GEN_TRANS_TH_ADDSL(3)
+
 /* XTheadCmo */
=20
 static inline int priv_level(DisasContext *ctx)
--=20
2.39.1


