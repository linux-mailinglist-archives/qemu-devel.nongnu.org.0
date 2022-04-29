Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7C7514181
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 06:42:42 +0200 (CEST)
Received: from localhost ([::1]:49584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkISn-0003Ka-G7
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 00:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIId-00070l-Uk
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:32:13 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:13469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIIZ-0002SM-Do
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:32:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651206725; x=1682742725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UECLh/IQ0urITnVgLelHEXlgxVyNyhMotEuczSu+y7s=;
 b=WS4TUEd9ALdIKxTwQUU/It7RVNwbqUwrvLXYypiZ4ElncprX8R5OrxTr
 h9bHnzBs0guadfeL8NqKeS5UzvqDZdzxJZ9CBClKDklwtt5HUJat33pcC
 uIoRfEd1+nFibDCjdbkWtfKVaVpZssXbKJdGxUDEkLKZU5tEmsfcFuHfU
 Arsm4sbQIJ0bH/Bg5M25SfoXsMlsWf9AjxEwE8YK2N4T22E242Rgh2P+d
 HMB5rDJodNrGnQcAukEFB7J/tP32gCFdYZPYmnauUBgtpSvrEUcnof3HB
 upew4vuao+eesAbOWfEwecvFwEMifikIrBwIacIhVeT2LElRVxYsafnm2 w==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647273600"; d="scan'208";a="203995927"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Apr 2022 12:32:04 +0800
IronPort-SDR: n20EAQRy9xtL+QcK1ollxJaRqp4SI+3ti7H6X73xWgiWSIxVBRXfzwVTt81vAaA7vLukDE5zzC
 T036kCH6qYQxbYcjCEYWdmbxBuDm3ApB3AzUHnymAydmJnBHVSFyDI2yfeWGmpCoXhdKZuxQCJ
 BevmYEaxcJVYHWIzb+J6sWrP6cPCXewVlSLHgPGSIGXeu9/gwk9E2rMhHn3VyBI8MP8XBU+tQm
 YMwuURpzVeBAHNbWNzgnpFzpkJcW1M5C8zPDT7qHxorT1elWJDVfPPnPt6zgMjVMNV++kXsfLz
 9dBqU3wytW6pP5wFo/MumZjY
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:02:13 -0700
IronPort-SDR: wJPg4uQHNuNR4BNMuoxqHssk7hVT2VhMwYEQA1wh87oHyBEvu3LE68CsuIwRDvm0VkNO3ZkmKO
 n7Q22E8OqUv9kGl0Pvj85NwvI7RhWn7NFk3ce2NRZVcZlUyQKGwg3tl4PaHhqt5q+lpgwSJXzX
 CeGsnGh0TbW4t8TYwTkkFnUJeS5Ld6fRR+RAhWLsl0IuvfyYxOuIJuLsnQFzvgCyZtu0jzb+Fj
 4yo4cdFQPAfPFCp/skuxsL79fb4tUSrIfXsVOgTpXGHolWJsPDytihOaGmGBPUQgFLQMIaQhep
 FcU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:32:06 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KqKMT4Ntbz1SHwl
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 21:32:05 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651206724; x=1653798725; bh=UECLh/IQ0urITnVgLe
 lHEXlgxVyNyhMotEuczSu+y7s=; b=JKCmqW4aPKqf4LtC96k65hqlWKK8Qbc1am
 2peaqR5QLYtm4vjVsPxe2fxpCX2cw/OtSPD3aLvJLFz2Q+73HX1YWbeQc0hqjAVy
 1e8qGCYwyqeeQako3tzuwf2kI8MX+NVuAM92w0up/8ygLriU1ONxdQlyHEUTFwsk
 SP/kmW2cPHjsSw9fwJMhUxlvvKEdD87uSt2qJXTx9Vo/mJDVmQ1GGq029/lu6CWs
 ey/W7a+s3iGPH00xV9SZv8AuMf4dFa6qWNTuGF/clM4Ir3Ti5ujYi4AEfpbMZ893
 uA5llou9+aG7B1cGGp/O18WdFHz4SzYy/FDFwQNb9wAUkemwoRPQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id cT630u4DgVFk for <qemu-devel@nongnu.org>;
 Thu, 28 Apr 2022 21:32:04 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KqKMP0RwRz1Rvlc;
 Thu, 28 Apr 2022 21:32:00 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Zewen Ye <lustrew@foxmail.com>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 09/25] target/riscv: rvk: add support for zknd/zkne extension
 in RV32
Date: Fri, 29 Apr 2022 14:31:03 +1000
Message-Id: <20220429043119.1478881-10-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
References: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=111bf31fc=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

 - add aes32esmi, aes32esi, aes32dsmi and aes32dsi instructions

Co-authored-by: Zewen Ye <lustrew@foxmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220423023510.30794-7-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |   6 ++
 target/riscv/insn32.decode              |  11 +++
 target/riscv/crypto_helper.c            | 105 ++++++++++++++++++++++++
 target/riscv/translate.c                |   1 +
 target/riscv/insn_trans/trans_rvk.c.inc |  71 ++++++++++++++++
 target/riscv/meson.build                |   3 +-
 6 files changed, 196 insertions(+), 1 deletion(-)
 create mode 100644 target/riscv/crypto_helper.c
 create mode 100644 target/riscv/insn_trans/trans_rvk.c.inc

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index cfead7abfc..3c4e7e6113 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1112,3 +1112,9 @@ DEF_HELPER_5(divu_i128, tl, env, tl, tl, tl, tl)
 DEF_HELPER_5(divs_i128, tl, env, tl, tl, tl, tl)
 DEF_HELPER_5(remu_i128, tl, env, tl, tl, tl, tl)
 DEF_HELPER_5(rems_i128, tl, env, tl, tl, tl, tl)
+
+/* Crypto functions */
+DEF_HELPER_FLAGS_3(aes32esmi, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+DEF_HELPER_FLAGS_3(aes32esi, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+DEF_HELPER_FLAGS_3(aes32dsmi, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+DEF_HELPER_FLAGS_3(aes32dsi, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 75ffac9c81..0f2e661583 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -35,6 +35,7 @@
 %imm_b    31:s1 7:1 25:6 8:4     !function=3Dex_shift_1
 %imm_j    31:s1 12:8 20:1 21:10  !function=3Dex_shift_1
 %imm_u    12:s20                 !function=3Dex_shift_12
+%imm_bs   30:2                   !function=3Dex_shift_3
=20
 # Argument sets:
 &empty
@@ -52,6 +53,7 @@
 &rmr       vm rd rs2
 &r2nfvm    vm rd rs1 nf
 &rnfvm     vm rd rs1 rs2 nf
+&k_aes     shamt rs2 rs1 rd
=20
 # Formats 32:
 @r       .......   ..... ..... ... ..... ....... &r                %rs2 =
%rs1 %rd
@@ -89,6 +91,8 @@
 @sfence_vma ....... ..... .....   ... ..... ....... %rs2 %rs1
 @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
=20
+@k_aes   .. ..... ..... .....  ... ..... ....... &k_aes  shamt=3D%imm_bs=
   %rs2 %rs1 %rd
+
 # Formats 64:
 @sh5     .......  ..... .....  ... ..... ....... &shift  shamt=3D%sh5   =
   %rs1 %rd
=20
@@ -834,3 +838,10 @@ sfence_w_inval    0001100 00000 00000 000 00000 1110=
011
 sfence_inval_ir   0001100 00001 00000 000 00000 1110011
 hinval_vvma       0010011 ..... ..... 000 00000 1110011 @hfence_vvma
 hinval_gvma       0110011 ..... ..... 000 00000 1110011 @hfence_gvma
+
+# *** RV32 Zknd Standard Extension ***
+aes32dsmi   .. 10111 ..... ..... 000 ..... 0110011 @k_aes
+aes32dsi    .. 10101 ..... ..... 000 ..... 0110011 @k_aes
+# *** RV32 Zkne Standard Extension ***
+aes32esmi   .. 10011 ..... ..... 000 ..... 0110011 @k_aes
+aes32esi    .. 10001 ..... ..... 000 ..... 0110011 @k_aes
diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
new file mode 100644
index 0000000000..220d51c742
--- /dev/null
+++ b/target/riscv/crypto_helper.c
@@ -0,0 +1,105 @@
+/*
+ * RISC-V Crypto Emulation Helpers for QEMU.
+ *
+ * Copyright (c) 2021 Ruibo Lu, luruibo2000@163.com
+ * Copyright (c) 2021 Zewen Ye, lustrew@foxmail.com
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
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/exec-all.h"
+#include "exec/helper-proto.h"
+#include "crypto/aes.h"
+#include "crypto/sm4.h"
+
+#define AES_XTIME(a) \
+    ((a << 1) ^ ((a & 0x80) ? 0x1b : 0))
+
+#define AES_GFMUL(a, b) (( \
+    (((b) & 0x1) ? (a) : 0) ^ \
+    (((b) & 0x2) ? AES_XTIME(a) : 0) ^ \
+    (((b) & 0x4) ? AES_XTIME(AES_XTIME(a)) : 0) ^ \
+    (((b) & 0x8) ? AES_XTIME(AES_XTIME(AES_XTIME(a))) : 0)) & 0xFF)
+
+static inline uint32_t aes_mixcolumn_byte(uint8_t x, bool fwd)
+{
+    uint32_t u;
+
+    if (fwd) {
+        u =3D (AES_GFMUL(x, 3) << 24) | (x << 16) | (x << 8) |
+            (AES_GFMUL(x, 2) << 0);
+    } else {
+        u =3D (AES_GFMUL(x, 0xb) << 24) | (AES_GFMUL(x, 0xd) << 16) |
+            (AES_GFMUL(x, 0x9) << 8) | (AES_GFMUL(x, 0xe) << 0);
+    }
+    return u;
+}
+
+#define sext32_xlen(x) (target_ulong)(int32_t)(x)
+
+static inline target_ulong aes32_operation(target_ulong shamt,
+                                           target_ulong rs1, target_ulon=
g rs2,
+                                           bool enc, bool mix)
+{
+    uint8_t si =3D rs2 >> shamt;
+    uint8_t so;
+    uint32_t mixed;
+    target_ulong res;
+
+    if (enc) {
+        so =3D AES_sbox[si];
+        if (mix) {
+            mixed =3D aes_mixcolumn_byte(so, true);
+        } else {
+            mixed =3D so;
+        }
+    } else {
+        so =3D AES_isbox[si];
+        if (mix) {
+            mixed =3D aes_mixcolumn_byte(so, false);
+        } else {
+            mixed =3D so;
+        }
+    }
+    mixed =3D rol32(mixed, shamt);
+    res =3D rs1 ^ mixed;
+
+    return sext32_xlen(res);
+}
+
+target_ulong HELPER(aes32esmi)(target_ulong rs1, target_ulong rs2,
+                               target_ulong shamt)
+{
+    return aes32_operation(shamt, rs1, rs2, true, true);
+}
+
+target_ulong HELPER(aes32esi)(target_ulong rs1, target_ulong rs2,
+                              target_ulong shamt)
+{
+    return aes32_operation(shamt, rs1, rs2, true, false);
+}
+
+target_ulong HELPER(aes32dsmi)(target_ulong rs1, target_ulong rs2,
+                               target_ulong shamt)
+{
+    return aes32_operation(shamt, rs1, rs2, false, true);
+}
+
+target_ulong HELPER(aes32dsi)(target_ulong rs1, target_ulong rs2,
+                              target_ulong shamt)
+{
+    return aes32_operation(shamt, rs1, rs2, false, false);
+}
+#undef sext32_xlen
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 121ead7cfe..0cd1d9ee94 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1007,6 +1007,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase,=
 target_ulong pc)
 #include "insn_trans/trans_rvv.c.inc"
 #include "insn_trans/trans_rvb.c.inc"
 #include "insn_trans/trans_rvzfh.c.inc"
+#include "insn_trans/trans_rvk.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
 #include "insn_trans/trans_svinval.c.inc"
 #include "insn_trans/trans_xventanacondops.c.inc"
diff --git a/target/riscv/insn_trans/trans_rvk.c.inc b/target/riscv/insn_=
trans/trans_rvk.c.inc
new file mode 100644
index 0000000000..8d0b42106f
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvk.c.inc
@@ -0,0 +1,71 @@
+/*
+ * RISC-V translation routines for the Zk[nd,ne,nh,sed,sh] Standard Exte=
nsion.
+ *
+ * Copyright (c) 2021 Ruibo Lu, luruibo2000@163.com
+ * Copyright (c) 2021 Zewen Ye, lustrew@foxmail.com
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
+#define REQUIRE_ZKND(ctx) do {                  \
+    if (!ctx->cfg_ptr->ext_zknd) {              \
+        return false;                           \
+    }                                           \
+} while (0)
+
+#define REQUIRE_ZKNE(ctx) do {                  \
+    if (!ctx->cfg_ptr->ext_zkne) {              \
+        return false;                           \
+    }                                           \
+} while (0)
+
+static bool gen_aes32_sm4(DisasContext *ctx, arg_k_aes *a,
+                          void (*func)(TCGv, TCGv, TCGv, TCGv))
+{
+    TCGv shamt =3D tcg_constant_tl(a->shamt);
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
+
+    func(dest, src1, src2, shamt);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_aes32esmi(DisasContext *ctx, arg_aes32esmi *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZKNE(ctx);
+    return gen_aes32_sm4(ctx, a, gen_helper_aes32esmi);
+}
+
+static bool trans_aes32esi(DisasContext *ctx, arg_aes32esi *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZKNE(ctx);
+    return gen_aes32_sm4(ctx, a, gen_helper_aes32esi);
+}
+
+static bool trans_aes32dsmi(DisasContext *ctx, arg_aes32dsmi *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZKND(ctx);
+    return gen_aes32_sm4(ctx, a, gen_helper_aes32dsmi);
+}
+
+static bool trans_aes32dsi(DisasContext *ctx, arg_aes32dsi *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZKND(ctx);
+    return gen_aes32_sm4(ctx, a, gen_helper_aes32dsi);
+}
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 2c20f3dd8e..096249f3a3 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -19,7 +19,8 @@ riscv_ss.add(files(
   'vector_helper.c',
   'bitmanip_helper.c',
   'translate.c',
-  'm128_helper.c'
+  'm128_helper.c',
+  'crypto_helper.c'
 ))
 riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: file=
s('kvm-stub.c'))
=20
--=20
2.35.1


