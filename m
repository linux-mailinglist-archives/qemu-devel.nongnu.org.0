Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1AE4B82AE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 09:13:10 +0100 (CET)
Received: from localhost ([::1]:45890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKFQz-00018Z-4y
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 03:13:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDpF-0005Jj-6e
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:05 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:61649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDpC-0006K3-Om
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644993002; x=1676529002;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BHptb7kbEv714Dh/R5SnIIpNuw/wfBKBUjAPWBpglVs=;
 b=gAcwrZSaZhxlnNyO+b7Smezmfs+zaIqRM69GHUL9OKTph2HOl6mV+tBa
 VcHm9/Lq/P0nT0sTKAEY/9vsu5OBZPbltKAfQPLKVpRV2ewK5W3VyEw3H
 g9ev0yl1hHbumccLRSoYO/ztzWd/zWV972AnaDFd5E4SW3Ik4dX7OEfzd
 fk0Y0sMAUm1oZVZBUgHaahny9kAmfutxcMzsYA4VFvuyxTy/1Mh/7IhKO
 izs8tzzoTl3RzaH6k+i2099G5JpHPrgvZ2n9kRLCqcOkWgcAi8w/Vig0S
 57dSp4ll1OJPfCtVjPKrLNlUqHFLq9ISaidcCAJubkkTdMIIF0AbOiGPH Q==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="297181718"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:30:02 +0800
IronPort-SDR: 2BZUatzl82KZ342audCHh0m/qmOQGzvpcLos2MyUugg1S2rA+GBXxrWuGSkRwkyiMZbvkgE/uK
 nraH8DU9TT0u3JLZSEn5qM6qzDX0az7KPFfY4B5N3hjsBuXWej1KbsrwmAEPhtVmcX7EL4hLJH
 drWnmobcgLg/B4Nh5oSI4hJS9xz91L2KWgCySxKhVPlIlVjjEKE0EESoLzAIiDubIJABhiQHUk
 yAVEsdurcMulKYloKb+640tsR1kQFWArY2kagWEuUx+J8EoXDIqlB/3r58vrOhzl2UAzIm1PYL
 PkSVI08Rn/9RwpTL8YpSMXdX
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:02:50 -0800
IronPort-SDR: 0QQpJ3EyjkfR/5KfmPAZOQRvJq+ALyBoi3a0YvUyjFnKm3Chpt6KXQ/ZjMDH+Lawsx9U3FE49s
 5JIJ4omgdS58HptUDO8fQb2hUKksGNG+CLZDNZ9aBKuoHKIQJPdfp/a3ZNnxd6F2hI/pCfQ2bJ
 KxRaCrkwjJsKQFhpRyFLH/r4qo6YJ1Ln+J0v4Ke+DPZxqRif3qthN6J2UZJOJWVynKOzcyvnfo
 PM21p7ri94TPGMicuFdlmzti1fWlMQcybxC6dX51hofl3vH4A2gcCfW1gl2Dg0oAVyf8/l/rzI
 LDY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:30:02 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7Nn5l6gz1SVny
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:30:01 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644993000; x=1647585001; bh=BHptb7kbEv714Dh/R5
 SnIIpNuw/wfBKBUjAPWBpglVs=; b=eNBIVCrOsTEfdOOM2lXdWMdOPGAhvI1JGI
 u/q3vR4314xwNln8z6YrWcbBH3XGVlp7hq5muR9yfddFUO9WRgpr+0A8BlZNZiuT
 TJlY/gXj6KIMDv97ySXKZTgXxQd36DJIDOQCUZBWKEBP4ysCNxq3o41UG/YL3R5a
 TbyBBrqliq5PXt0A4P2kO5+ihsa64pUhT2qwzdxxjN++a/tSjbmgy7Gu5uxnAj/E
 5FhtC412IS66zjE15SS2y06Its4mHWvSBvqsRsjTQdeB4W+bHPMam6JfxmUbN+pM
 LrzPMpwZJALtUqs6h7t1oT4NS5gGK94+rOVfIZlKRtEXzWT38WjQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id gNTkv6q73XHf for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:30:00 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7Nj4Xgnz1Rwrw;
 Tue, 15 Feb 2022 22:29:57 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 09/35] target/riscv: Add XVentanaCondOps custom extension
Date: Wed, 16 Feb 2022 16:28:46 +1000
Message-Id: <20220216062912.319738-10-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philipp Tomsich <philipp.tomsich@vrull.eu>

This adds the decoder and translation for the XVentanaCondOps custom
extension (vendor-defined by Ventana Micro Systems), which is
documented at https://github.com/ventanamicro/ventana-custom-extensions/r=
eleases/download/v1.0.0/ventana-custom-extensions-v1.0.0.pdf

This commit then also adds a guard-function (has_XVentanaCondOps_p)
and the decoder function to the table of decoders, enabling the
support for the XVentanaCondOps extension.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220202005249.3566542-7-philipp.tomsich@vrull.eu>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                            |  3 ++
 target/riscv/XVentanaCondOps.decode           | 25 ++++++++++++
 target/riscv/cpu.c                            |  3 ++
 target/riscv/translate.c                      | 12 ++++++
 .../insn_trans/trans_xventanacondops.c.inc    | 39 +++++++++++++++++++
 target/riscv/meson.build                      |  1 +
 6 files changed, 83 insertions(+)
 create mode 100644 target/riscv/XVentanaCondOps.decode
 create mode 100644 target/riscv/insn_trans/trans_xventanacondops.c.inc

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 1175915c0d..aacc997d56 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -329,6 +329,9 @@ struct RISCVCPUConfig {
     bool ext_zve32f;
     bool ext_zve64f;
=20
+    /* Vendor-specific custom extensions */
+    bool ext_XVentanaCondOps;
+
     char *priv_spec;
     char *user_spec;
     char *bext_spec;
diff --git a/target/riscv/XVentanaCondOps.decode b/target/riscv/XVentanaC=
ondOps.decode
new file mode 100644
index 0000000000..5aef7c3d72
--- /dev/null
+++ b/target/riscv/XVentanaCondOps.decode
@@ -0,0 +1,25 @@
+#
+# RISC-V translation routines for the XVentanaCondOps extension
+#
+# Copyright (c) 2022 Dr. Philipp Tomsich, philipp.tomsich@vrull.eu
+#
+# SPDX-License-Identifier: LGPL-2.1-or-later
+#
+# Reference: VTx-family custom instructions
+#            Custom ISA extensions for Ventana Micro Systems RISC-V core=
s
+#            (https://github.com/ventanamicro/ventana-custom-extensions/=
releases/download/v1.0.0/ventana-custom-extensions-v1.0.0.pdf)
+
+# Fields
+%rs2  20:5
+%rs1  15:5
+%rd    7:5
+
+# Argument sets
+&r    rd rs1 rs2  !extern
+
+# Formats
+@r         .......  ..... ..... ... ..... ....... &r                %rs2=
 %rs1 %rd
+
+# *** RV64 Custom-3 Extension ***
+vt_maskc   0000000  ..... ..... 110 ..... 1111011 @r
+vt_maskcn  0000000  ..... ..... 111 ..... 1111011 @r
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5ada71e5bf..1238aabe3f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -733,6 +733,9 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
     DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
=20
+    /* Vendor-specific custom extensions */
+    DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOp=
s, false),
+
     /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     /* ePMP 0.9.3 */
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 30b1b68341..eaf5a72c81 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -116,6 +116,14 @@ static bool always_true_p(DisasContext *ctx  __attri=
bute__((__unused__)))
     return true;
 }
=20
+#define MATERIALISE_EXT_PREDICATE(ext)  \
+    static bool has_ ## ext ## _p(DisasContext *ctx)    \
+    { \
+        return ctx->cfg_ptr->ext_ ## ext ; \
+    }
+
+MATERIALISE_EXT_PREDICATE(XVentanaCondOps);
+
 #ifdef TARGET_RISCV32
 #define get_xl(ctx)    MXL_RV32
 #elif defined(CONFIG_USER_ONLY)
@@ -854,9 +862,12 @@ static uint32_t opcode_at(DisasContextBase *dcbase, =
target_ulong pc)
 #include "insn_trans/trans_rvb.c.inc"
 #include "insn_trans/trans_rvzfh.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
+#include "insn_trans/trans_xventanacondops.c.inc"
=20
 /* Include the auto-generated decoder for 16 bit insn */
 #include "decode-insn16.c.inc"
+/* Include decoders for factored-out extensions */
+#include "decode-XVentanaCondOps.c.inc"
=20
 static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t o=
pcode)
 {
@@ -869,6 +880,7 @@ static void decode_opc(CPURISCVState *env, DisasConte=
xt *ctx, uint16_t opcode)
         bool (*decode_func)(DisasContext *, uint32_t);
     } decoders[] =3D {
         { always_true_p,  decode_insn32 },
+        { has_XVentanaCondOps_p,  decode_XVentanaCodeOps },
     };
=20
     /* Check for compressed insn */
diff --git a/target/riscv/insn_trans/trans_xventanacondops.c.inc b/target=
/riscv/insn_trans/trans_xventanacondops.c.inc
new file mode 100644
index 0000000000..16849e6d4e
--- /dev/null
+++ b/target/riscv/insn_trans/trans_xventanacondops.c.inc
@@ -0,0 +1,39 @@
+/*
+ * RISC-V translation routines for the XVentanaCondOps extension.
+ *
+ * Copyright (c) 2021-2022 VRULL GmbH.
+ *
+ * This program is free software; you can redistribute it and/or modify =
it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOU=
T
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License alo=
ng with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+static bool gen_vt_condmask(DisasContext *ctx, arg_r *a, TCGCond cond)
+{
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
+
+    tcg_gen_movcond_tl(cond, dest, src2, ctx->zero, src1, ctx->zero);
+
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_vt_maskc(DisasContext *ctx, arg_r *a)
+{
+    return gen_vt_condmask(ctx, a, TCG_COND_NE);
+}
+
+static bool trans_vt_maskcn(DisasContext *ctx, arg_r *a)
+{
+    return gen_vt_condmask(ctx, a, TCG_COND_EQ);
+}
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index a3997ed580..91f0ac32ff 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -4,6 +4,7 @@ dir =3D meson.current_source_dir()
 gen =3D [
   decodetree.process('insn16.decode', extra_args: ['--static-decode=3Dde=
code_insn16', '--insnwidth=3D16']),
   decodetree.process('insn32.decode', extra_args: '--static-decode=3Ddec=
ode_insn32'),
+  decodetree.process('XVentanaCondOps.decode', extra_args: '--static-dec=
ode=3Ddecode_XVentanaCodeOps'),
 ]
=20
 riscv_ss =3D ss.source_set()
--=20
2.34.1


