Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C9068D048
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:12:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI8Y-00006I-Co; Tue, 07 Feb 2023 02:11:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI8N-0008Li-BL
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:11:19 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI8K-0000FD-EX
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:11:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753876; x=1707289876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V+LHlu6s7jb1owQfBUt4oyXddXg+eB6Hs33DZKcQO+c=;
 b=WaHgL0tdljaF68mmBf0GzanXT04v82EbnjLzrnjKmvxTwMHmAQqKHnq+
 2DHKwg3dP+5QxYfVKWE3bewN3X8Zf1xgTGfkNRj/hjN3SwEM0slLDkm1C
 5kANXdhf2PIKxJWufnNIXAc3o0Xrk2m76kgmzP7d/vGpnUpjqx8H6JSJu
 hjzoN5mvHJe/1apU0S+1Ii8bmT9Uh4ZBFdxXj9ig7XgeqOP/twUj6sPRT
 IvxGBCzhyO62tLe1mAZLp0bOdE3GVL3r7sxrrkPVy1m3K5l5ntghKV77l
 Vr0UeeiLTU1A3e//T6L10W6L5WncfgdEbHy5RBVVcuBX7gErNImBNyj0n A==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657554"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:10:36 +0800
IronPort-SDR: nSQ9PeTzFyAQFa45Qp8y6C3CeFAxw78ahYYtCGzAuFfQdmkr4etLrcdWBduxpbtqBzDuN4JjE5
 7s03arxxpY0RdyrtkBIH+jG5ixn5rt+gI1+0CsHBMK5IVVMekIgLOL/i9WaRPnNe6lweBhQeRy
 AQxR62LcWZLnVUdv8AFmWdY3zhcajQbCxmb5poPjgguVb96ZPC7JKEajlxhHh9WIAb7eJSaUpV
 0zJ4sgASccqs7T3586AuTEIBEuhhZdVGuhAhAPIj+iG70cuSSh/rxsI9cS5vL7UCclQ/YU8GFZ
 4G4=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:27:53 -0800
IronPort-SDR: RtNptxRZ4IoVqi+em7TtXnAZ2KqyIKuYqSHXnsdssBq793JxJ+hb6/Zf/OKSR+/uxW7teAUzux
 1hCxTALofNt62NXjMmehbewnuq47JbA/KgYt9F+v80v9YS7xNDqlQ3Vt+53Vc+mQudgwUFkyt1
 RNcUo3FeAXiPWQvOmqHMPw1rRU0oPXo5tKt2BMURjykeEq6qnEkKRnaPWwgSP4nzcrEGgwPqBZ
 BYmWjHhRphO9LMCZAFAsmi5BUdhUrl5/tNmb84IBgyI6wdN0PhHPK8upQ5hD0pvQXJHC9/Fi4w
 qpA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:10:36 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vRJ39K7z1Rwrq
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:10:36 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1675753834; x=1678345835; bh=V+LHlu6
 s7jb1owQfBUt4oyXddXg+eB6Hs33DZKcQO+c=; b=I4KVfd3ax5AMYaZe8oXSmcH
 Fo1AjH+q2KzxEvYf5CE0hFFT3HIKNr7JHQC1dP38JD0FU6bq08rzcsdMxDYz9ezL
 VcIFvigt5Ea4h0uYyGHBo324XwByODuq1XhJ+2NwEWR8sSJfIpC1ZiOK0zFN9Dbk
 KgykIVUnWPYmBSlgaSTZI+nRXMZUPWsz31+H2a32wLtxjWfyPwI/P+ErsepCPmiZ
 IXOY2QlD3VTJ6SSQ68TQgl7I+xHqD5ocELXv9mdkJn3I+Tw6BjSrDYXwCwqsKQSu
 9yyw/smp9iNaesdxWVXcVVSjGiu5eDRU6b7f3k3H13hKbX9g6fuOTcXr6se0jdw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id jaS2Tj1sZ0IC for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:10:34 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vRF0WJvz1RvTp;
 Mon,  6 Feb 2023 23:10:32 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
 =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 23/32] RISC-V: Adding T-Head MemIdx extension
Date: Tue,  7 Feb 2023 17:09:34 +1000
Message-Id: <20230207070943.2558857-24-alistair.francis@opensource.wdc.com>
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

This patch adds support for the T-Head MemIdx instructions.
The patch uses the T-Head specific decoder and translation.

Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
Message-Id: <20230131202013.2541053-10-christoph.muellner@vrull.eu>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                         |   1 +
 target/riscv/xthead.decode                 |  54 +++
 target/riscv/cpu.c                         |   2 +
 target/riscv/translate.c                   |  21 +-
 target/riscv/insn_trans/trans_xthead.c.inc | 387 +++++++++++++++++++++
 5 files changed, 464 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 38e80d44d5..d776fea760 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -479,6 +479,7 @@ struct RISCVCPUConfig {
     bool ext_xtheadcmo;
     bool ext_xtheadcondmov;
     bool ext_xtheadmac;
+    bool ext_xtheadmemidx;
     bool ext_xtheadmempair;
     bool ext_xtheadsync;
     bool ext_XVentanaCondOps;
diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
index ff2a83b56d..69e40f22dc 100644
--- a/target/riscv/xthead.decode
+++ b/target/riscv/xthead.decode
@@ -17,8 +17,10 @@
 %rd2       20:5
 %rs2       20:5
 %sh5       20:5
+%imm5      20:s5
 %sh6       20:6
 %sh2       25:2
+%imm2      25:2
=20
 # Argument sets
 &r         rd rs1 rs2                               !extern
@@ -26,6 +28,8 @@
 &shift     shamt rs1 rd                             !extern
 &th_bfext  msb lsb rs1 rd
 &th_pair   rd1 rs rd2 sh2
+&th_memidx rd rs1 rs2 imm2
+&th_meminc rd rs1 imm5 imm2
=20
 # Formats
 @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
@@ -36,6 +40,8 @@
 @sh5        ....... ..... .....  ... ..... .......  &shift  shamt=3D%sh5=
      %rs1 %rd
 @sh6        ...... ...... .....  ... ..... .......  &shift shamt=3D%sh6 =
%rs1 %rd
 @th_pair    ..... .. ..... ..... ... ..... .......  &th_pair %rd1 %rs %r=
d2 %sh2
+@th_memidx  ..... .. ..... ..... ... ..... .......  &th_memidx %rd %rs1 =
%rs2 %imm2
+@th_meminc  ..... .. ..... ..... ... ..... .......  &th_meminc %rd %rs1 =
%imm5 %imm2
=20
 # XTheadBa
 # Instead of defining a new encoding, we simply use the decoder to
@@ -102,6 +108,54 @@ th_muls          00100 01 ..... ..... 001 ..... 0001=
011 @r
 th_mulsh         00101 01 ..... ..... 001 ..... 0001011 @r
 th_mulsw         00100 11 ..... ..... 001 ..... 0001011 @r
=20
+# XTheadMemIdx
+th_ldia          01111 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_ldib          01101 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lwia          01011 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lwib          01001 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lwuia         11011 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lwuib         11001 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lhia          00111 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lhib          00101 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lhuia         10111 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lhuib         10101 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lbia          00011 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lbib          00001 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lbuia         10011 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lbuib         10001 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_sdia          01111 .. ..... ..... 101 ..... 0001011 @th_meminc
+th_sdib          01101 .. ..... ..... 101 ..... 0001011 @th_meminc
+th_swia          01011 .. ..... ..... 101 ..... 0001011 @th_meminc
+th_swib          01001 .. ..... ..... 101 ..... 0001011 @th_meminc
+th_shia          00111 .. ..... ..... 101 ..... 0001011 @th_meminc
+th_shib          00101 .. ..... ..... 101 ..... 0001011 @th_meminc
+th_sbia          00011 .. ..... ..... 101 ..... 0001011 @th_meminc
+th_sbib          00001 .. ..... ..... 101 ..... 0001011 @th_meminc
+
+th_lrd           01100 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lrw           01000 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lrwu          11000 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lrh           00100 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lrhu          10100 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lrb           00000 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lrbu          10000 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_srd           01100 .. ..... ..... 101 ..... 0001011 @th_memidx
+th_srw           01000 .. ..... ..... 101 ..... 0001011 @th_memidx
+th_srh           00100 .. ..... ..... 101 ..... 0001011 @th_memidx
+th_srb           00000 .. ..... ..... 101 ..... 0001011 @th_memidx
+
+th_lurd          01110 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lurw          01010 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lurwu         11010 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lurh          00110 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lurhu         10110 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lurb          00010 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lurbu         10010 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_surd          01110 .. ..... ..... 101 ..... 0001011 @th_memidx
+th_surw          01010 .. ..... ..... 101 ..... 0001011 @th_memidx
+th_surh          00110 .. ..... ..... 101 ..... 0001011 @th_memidx
+th_surb          00010 .. ..... ..... 101 ..... 0001011 @th_memidx
+
 # XTheadMemPair
 th_ldd           11111 .. ..... ..... 100 ..... 0001011 @th_pair
 th_lwd           11100 .. ..... ..... 100 ..... 0001011 @th_pair
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b7047d139d..2d5a0881f1 100644
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
+    ISA_EXT_DATA_ENTRY(xtheadmemidx, true, PRIV_VERSION_1_11_0, ext_xthe=
admemidx),
     ISA_EXT_DATA_ENTRY(xtheadmempair, true, PRIV_VERSION_1_11_0, ext_xth=
eadmempair),
     ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xthead=
sync),
     ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_X=
VentanaCondOps),
@@ -1102,6 +1103,7 @@ static Property riscv_cpu_extensions[] =3D {
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, f=
alse),
     DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
+    DEFINE_PROP_BOOL("xtheadmemidx", RISCVCPU, cfg.ext_xtheadmemidx, fal=
se),
     DEFINE_PROP_BOOL("xtheadmempair", RISCVCPU, cfg.ext_xtheadmempair, f=
alse),
     DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOp=
s, false),
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f383e69db3..a979d43a6a 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -135,7 +135,8 @@ static bool has_xthead_p(DisasContext *ctx  __attribu=
te__((__unused__)))
     return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
            ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
            ctx->cfg_ptr->ext_xtheadcondmov || ctx->cfg_ptr->ext_xtheadma=
c ||
-           ctx->cfg_ptr->ext_xtheadmempair || ctx->cfg_ptr->ext_xtheadsy=
nc;
+           ctx->cfg_ptr->ext_xtheadmemidx || ctx->cfg_ptr->ext_xtheadmem=
pair ||
+           ctx->cfg_ptr->ext_xtheadsync;
 }
=20
 #define MATERIALISE_EXT_PREDICATE(ext)  \
@@ -597,6 +598,24 @@ static TCGv get_address(DisasContext *ctx, int rs1, =
int imm)
     return addr;
 }
=20
+/* Compute a canonical address from a register plus reg offset. */
+static TCGv get_address_indexed(DisasContext *ctx, int rs1, TCGv offs)
+{
+    TCGv addr =3D temp_new(ctx);
+    TCGv src1 =3D get_gpr(ctx, rs1, EXT_NONE);
+
+    tcg_gen_add_tl(addr, src1, offs);
+    if (ctx->pm_mask_enabled) {
+        tcg_gen_andc_tl(addr, addr, pm_mask);
+    } else if (get_xl(ctx) =3D=3D MXL_RV32) {
+        tcg_gen_ext32u_tl(addr, addr);
+    }
+    if (ctx->pm_base_enabled) {
+        tcg_gen_or_tl(addr, addr, pm_base);
+    }
+    return addr;
+}
+
 #ifndef CONFIG_USER_ONLY
 /* The states of mstatus_fs are:
  * 0 =3D disabled, 1 =3D initial, 2 =3D clean, 3 =3D dirty
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/in=
sn_trans/trans_xthead.c.inc
index f1bd0dbad5..8167de0393 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -52,6 +52,12 @@
     }                                            \
 } while (0)
=20
+#define REQUIRE_XTHEADMEMIDX(ctx) do {           \
+    if (!ctx->cfg_ptr->ext_xtheadmemidx) {       \
+        return false;                            \
+    }                                            \
+} while (0)
+
 #define REQUIRE_XTHEADMEMPAIR(ctx) do {          \
     if (!ctx->cfg_ptr->ext_xtheadmempair) {      \
         return false;                            \
@@ -64,6 +70,30 @@
     }                                            \
 } while (0)
=20
+/*
+ * Calculate and return the address for indexed mem operations:
+ * If !zext_offs, then the address is rs1 + (rs2 << imm2).
+ * If  zext_offs, then the address is rs1 + (zext(rs2[31:0]) << imm2).
+ */
+static TCGv get_th_address_indexed(DisasContext *ctx, int rs1, int rs2,
+                                   int imm2, bool zext_offs)
+{
+    TCGv src2 =3D get_gpr(ctx, rs2, EXT_NONE);
+    TCGv offs =3D tcg_temp_new();
+
+    if (zext_offs) {
+        tcg_gen_extract_tl(offs, src2, 0, 32);
+        tcg_gen_shli_tl(offs, offs, imm2);
+    } else {
+        tcg_gen_shli_tl(offs, src2, imm2);
+    }
+
+    TCGv addr =3D get_address_indexed(ctx, rs1, offs);
+
+    tcg_temp_free(offs);
+    return addr;
+}
+
 /* XTheadBa */
=20
 /*
@@ -388,6 +418,363 @@ static bool trans_th_mulsw(DisasContext *ctx, arg_t=
h_mulsw *a)
     return gen_th_mac(ctx, a, tcg_gen_sub_tl, NULL);
 }
=20
+/* XTheadMemIdx */
+
+/*
+ * Load with memop from indexed address and add (imm5 << imm2) to rs1.
+ * If !preinc, then the load address is rs1.
+ * If  preinc, then the load address is rs1 + (imm5) << imm2).
+ */
+static bool gen_load_inc(DisasContext *ctx, arg_th_meminc *a, MemOp memo=
p,
+                         bool preinc)
+{
+    if (a->rs1 =3D=3D a->rd) {
+        return false;
+    }
+
+    int imm =3D a->imm5 << a->imm2;
+    TCGv addr =3D get_address(ctx, a->rs1, preinc ? imm : 0);
+    TCGv rd =3D dest_gpr(ctx, a->rd);
+    TCGv rs1 =3D get_gpr(ctx, a->rs1, EXT_NONE);
+
+    tcg_gen_qemu_ld_tl(rd, addr, ctx->mem_idx, memop);
+    tcg_gen_addi_tl(rs1, rs1, imm);
+    gen_set_gpr(ctx, a->rd, rd);
+    gen_set_gpr(ctx, a->rs1, rs1);
+
+    tcg_temp_free(addr);
+    return true;
+}
+
+/*
+ * Store with memop to indexed address and add (imm5 << imm2) to rs1.
+ * If !preinc, then the store address is rs1.
+ * If  preinc, then the store address is rs1 + (imm5) << imm2).
+ */
+static bool gen_store_inc(DisasContext *ctx, arg_th_meminc *a, MemOp mem=
op,
+                          bool preinc)
+{
+    int imm =3D a->imm5 << a->imm2;
+    TCGv addr =3D get_address(ctx, a->rs1, preinc ? imm : 0);
+    TCGv data =3D get_gpr(ctx, a->rd, EXT_NONE);
+    TCGv rs1 =3D get_gpr(ctx, a->rs1, EXT_NONE);
+
+    tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
+    tcg_gen_addi_tl(rs1, rs1, imm);
+    gen_set_gpr(ctx, a->rs1, rs1);
+
+    tcg_temp_free(addr);
+    return true;
+}
+
+static bool trans_th_ldia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_load_inc(ctx, a, MO_TESQ, false);
+}
+
+static bool trans_th_ldib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_load_inc(ctx, a, MO_TESQ, true);
+}
+
+static bool trans_th_lwia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_TESL, false);
+}
+
+static bool trans_th_lwib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_TESL, true);
+}
+
+static bool trans_th_lwuia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_load_inc(ctx, a, MO_TEUL, false);
+}
+
+static bool trans_th_lwuib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_load_inc(ctx, a, MO_TEUL, true);
+}
+
+static bool trans_th_lhia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_TESW, false);
+}
+
+static bool trans_th_lhib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_TESW, true);
+}
+
+static bool trans_th_lhuia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_TEUW, false);
+}
+
+static bool trans_th_lhuib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_TEUW, true);
+}
+
+static bool trans_th_lbia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_SB, false);
+}
+
+static bool trans_th_lbib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_SB, true);
+}
+
+static bool trans_th_lbuia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_UB, false);
+}
+
+static bool trans_th_lbuib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_UB, true);
+}
+
+static bool trans_th_sdia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_store_inc(ctx, a, MO_TESQ, false);
+}
+
+static bool trans_th_sdib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_store_inc(ctx, a, MO_TESQ, true);
+}
+
+static bool trans_th_swia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_inc(ctx, a, MO_TESL, false);
+}
+
+static bool trans_th_swib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_inc(ctx, a, MO_TESL, true);
+}
+
+static bool trans_th_shia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_inc(ctx, a, MO_TESW, false);
+}
+
+static bool trans_th_shib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_inc(ctx, a, MO_TESW, true);
+}
+
+static bool trans_th_sbia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_inc(ctx, a, MO_SB, false);
+}
+
+static bool trans_th_sbib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_inc(ctx, a, MO_SB, true);
+}
+
+/*
+ * Load with memop from indexed address.
+ * If !zext_offs, then address is rs1 + (rs2 << imm2).
+ * If  zext_offs, then address is rs1 + (zext(rs2[31:0]) << imm2).
+ */
+static bool gen_load_idx(DisasContext *ctx, arg_th_memidx *a, MemOp memo=
p,
+                         bool zext_offs)
+{
+    TCGv rd =3D dest_gpr(ctx, a->rd);
+    TCGv addr =3D get_th_address_indexed(ctx, a->rs1, a->rs2, a->imm2, z=
ext_offs);
+
+    tcg_gen_qemu_ld_tl(rd, addr, ctx->mem_idx, memop);
+    gen_set_gpr(ctx, a->rd, rd);
+
+    return true;
+}
+
+/*
+ * Store with memop to indexed address.
+ * If !zext_offs, then address is rs1 + (rs2 << imm2).
+ * If  zext_offs, then address is rs1 + (zext(rs2[31:0]) << imm2).
+ */
+static bool gen_store_idx(DisasContext *ctx, arg_th_memidx *a, MemOp mem=
op,
+                          bool zext_offs)
+{
+    TCGv data =3D get_gpr(ctx, a->rd, EXT_NONE);
+    TCGv addr =3D get_th_address_indexed(ctx, a->rs1, a->rs2, a->imm2, z=
ext_offs);
+
+    tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
+
+    return true;
+}
+
+static bool trans_th_lrd(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_load_idx(ctx, a, MO_TESQ, false);
+}
+
+static bool trans_th_lrw(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_TESL, false);
+}
+
+static bool trans_th_lrwu(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_load_idx(ctx, a, MO_TEUL, false);
+}
+
+static bool trans_th_lrh(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_TESW, false);
+}
+
+static bool trans_th_lrhu(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_TEUW, false);
+}
+
+static bool trans_th_lrb(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_SB, false);
+}
+
+static bool trans_th_lrbu(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_UB, false);
+}
+
+static bool trans_th_srd(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_store_idx(ctx, a, MO_TESQ, false);
+}
+
+static bool trans_th_srw(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_idx(ctx, a, MO_TESL, false);
+}
+
+static bool trans_th_srh(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_idx(ctx, a, MO_TESW, false);
+}
+
+static bool trans_th_srb(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_idx(ctx, a, MO_SB, false);
+}
+static bool trans_th_lurd(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_load_idx(ctx, a, MO_TESQ, true);
+}
+
+static bool trans_th_lurw(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_TESL, true);
+}
+
+static bool trans_th_lurwu(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_load_idx(ctx, a, MO_TEUL, true);
+}
+
+static bool trans_th_lurh(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_TESW, true);
+}
+
+static bool trans_th_lurhu(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_TEUW, true);
+}
+
+static bool trans_th_lurb(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_SB, true);
+}
+
+static bool trans_th_lurbu(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_UB, true);
+}
+
+static bool trans_th_surd(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_store_idx(ctx, a, MO_TESQ, true);
+}
+
+static bool trans_th_surw(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_idx(ctx, a, MO_TESL, true);
+}
+
+static bool trans_th_surh(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_idx(ctx, a, MO_TESW, true);
+}
+
+static bool trans_th_surb(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_idx(ctx, a, MO_SB, true);
+}
+
 /* XTheadMemPair */
=20
 static bool gen_loadpair_tl(DisasContext *ctx, arg_th_pair *a, MemOp mem=
op,
--=20
2.39.1


