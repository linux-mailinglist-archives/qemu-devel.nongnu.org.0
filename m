Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779AD39EAE9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:42:29 +0200 (CEST)
Received: from localhost ([::1]:46076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPp6-0002MA-Ir
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPeM-0001zO-Oa
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:31:22 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPeJ-0004Zo-EW
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:31:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112279; x=1654648279;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w9wnRpgTJLxPvI4203ozFZcMmpiesQfQ4tHDkHtJ7A0=;
 b=NRHF+bEAs/S2HjIVv0si2LRS0Clp4YwvIKTctJinapqPrFXrKeZ3t3Xy
 9g/fkutK66C2P1bxtG3vKZsHWeNtEHydSJ9okOTpbcmU3s1jDHaWDqBQG
 yNW9YpFg3fjU14ZCX6zIoEGX3OlgclNKuztDd8vwb/QQ6inmIToeizn1N
 TIQIxjm0nGSUXzTvUlvbequaG/7xuopcJhWH8kBsN7H7DzfSIKOwdxpK3
 +D+LhK8gt9wRglD1JOK5966ApFzU6RbCNuCqqT5ahve+5qgR4qcPbeq3x
 2Yi6Zd+QtMY7dnkfVY9yqqfp7PqK9aySh/Mbbe9VxdVbKDqw3GLcQuCVg g==;
IronPort-SDR: No6T6AKRgrJq4UWxqZKJg4a1PDErjyO6RW9OwHZam3GjoaejCPvl4uH3p0Pba3URFcS/427Mb8
 zuv36UUT6f73z1QpWY+soDxZhWGF6eOAchjo0ehs9EnJJuCZI7m+vRw5jJBIXKqG5d2Qs0dIcu
 qekCpGFuKXa+bMHQTiXGN8rLEdcwrWO5KgHuf7nMNh4LVwysxtl8xVA1ddrJtOiyXnDORsUctA
 wbkGKFzG3cNPmWo2P0QjKDTkmUfPRcEUJW+uw322NIIN+6yx5Nnrz08U8HVv+K9f5bq+YAXfaM
 AKs=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087401"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:31:06 +0800
IronPort-SDR: hsrI4iPd0F60bFy1lk4sRyufw19PZQBr9tMHSSs3QkJ3XatVVQkdad9Wbt7x4jdvSXFAgjunuC
 sh76l5BrHDCzDftGP0ZPe15ODv+pVo/XPnmUAGSer0pkQWZnzB5S3BbSSz8c/PZ619eSAEC8y/
 2zCUmCG4JKBTMQcuEOO6tlx2TYuw4mGqtRpfQCZtvS/RzhDzr7DQeT3r39BsHNjekt0kJKmQ0N
 yjxs4r1m5my1aGBjApkgstZwQpr0AH3GXRLuss1/qCrdi54iuV/a5gmloGAcCwSBm2Fs4s0Z+0
 e/6cGHP2M9dzzArkgPadcoKI
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:10:13 -0700
IronPort-SDR: 1bOS5+qItbiohY3IgQAHc43KNgDoM7iEkPUgYXLb+Ipgw6rQ2iljsy5qCm58vpGTkfMWwJtIZQ
 qvrwkHjoaIqF5mBsrBwve8PcDVcxfF7479sHrqT8eTqj51nLP91kA9GRU903KNIH4O+QCJNBZ0
 +ZOvXDs0q/6SPGSxWJZkTYJ6ND9Eib8oIC2JijW+C1+qemYh8ygD6kRWcgMvm4xKyWdh2YoYyV
 Ne3JvtzCuPKaPCCAdzQ7NmIQb3JKLHnSlqN0tmuIS5FmoUOAvvTbJlx6Q4Ks7ubsSqxMsLCUBf
 vR4=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:31:03 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 17/32] target/riscv: rvb: count leading/trailing zeros
Date: Tue,  8 Jun 2021 10:29:32 +1000
Message-Id: <20210608002947.1649775-18-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608002947.1649775-1-alistair.francis@wdc.com>
References: <20210608002947.1649775-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7863c9c60=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Frank Chang <frank.chang@sifive.com>, alistair23@gmail.com,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210505160620.15723-3-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                      |  1 +
 target/riscv/insn32.decode              | 11 ++++++-
 target/riscv/translate.c                | 38 +++++++++++++++++++++
 target/riscv/insn_trans/trans_rvb.c.inc | 44 +++++++++++++++++++++++++
 4 files changed, 93 insertions(+), 1 deletion(-)
 create mode 100644 target/riscv/insn_trans/trans_rvb.c.inc

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0b22b0a523..c0c99c3d8d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -67,6 +67,7 @@
 #define RVS RV('S')
 #define RVU RV('U')
 #define RVH RV('H')
+#define RVB RV('B')
 
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index f75642bb0d..9a2ffab150 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -41,6 +41,7 @@
 &i    imm rs1 rd
 &j    imm rd
 &r    rd rs1 rs2
+&r2   rd rs1
 &s    imm rs1 rs2
 &u    imm rd
 &shift     shamt rs1 rd
@@ -68,7 +69,7 @@
 @r4_rm   ..... ..  ..... ..... ... ..... ....... %rs3 %rs2 %rs1 %rm %rd
 @r_rm    .......   ..... ..... ... ..... ....... %rs2 %rs1 %rm %rd
 @r2_rm   .......   ..... ..... ... ..... ....... %rs1 %rm %rd
-@r2      .......   ..... ..... ... ..... ....... %rs1 %rd
+@r2      .......   ..... ..... ... ..... ....... &r2 %rs1 %rd
 @r2_nfvm ... ... vm:1 ..... ..... ... ..... ....... &r2nfvm %nf %rs1 %rd
 @r2_vm   ...... vm:1 ..... ..... ... ..... ....... &rmr %rs2 %rd
 @r1_vm   ...... vm:1 ..... ..... ... ..... ....... %rd
@@ -657,3 +658,11 @@ vamomind_v      10000 . . ..... ..... 111 ..... 0101111 @r_wdvm
 vamomaxd_v      10100 . . ..... ..... 111 ..... 0101111 @r_wdvm
 vamominud_v     11000 . . ..... ..... 111 ..... 0101111 @r_wdvm
 vamomaxud_v     11100 . . ..... ..... 111 ..... 0101111 @r_wdvm
+
+# *** RV32B Standard Extension ***
+clz        011000 000000 ..... 001 ..... 0010011 @r2
+ctz        011000 000001 ..... 001 ..... 0010011 @r2
+
+# *** RV64B Standard Extension (in addition to RV32B) ***
+clzw       0110000 00000 ..... 001 ..... 0011011 @r2
+ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index e945352bca..60fac0fe27 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -548,6 +548,19 @@ static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
     return true;
 }
 
+static void gen_ctzw(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ori_tl(ret, arg1, (target_ulong)MAKE_64BIT_MASK(32, 32));
+    tcg_gen_ctzi_tl(ret, ret, 64);
+}
+
+static void gen_clzw(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ext32u_tl(ret, arg1);
+    tcg_gen_clzi_tl(ret, ret, 64);
+    tcg_gen_subi_tl(ret, ret, 32);
+}
+
 static bool gen_arith(DisasContext *ctx, arg_r *a,
                       void(*func)(TCGv, TCGv, TCGv))
 {
@@ -593,6 +606,30 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
     return cpu_ldl_code(env, pc);
 }
 
+static void gen_ctz(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ctzi_tl(ret, arg1, TARGET_LONG_BITS);
+}
+
+static void gen_clz(TCGv ret, TCGv arg1)
+{
+    tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
+}
+
+static bool gen_unary(DisasContext *ctx, arg_r2 *a,
+                      void(*func)(TCGv, TCGv))
+{
+    TCGv source = tcg_temp_new();
+
+    gen_get_gpr(source, a->rs1);
+
+    (*func)(source, source);
+
+    gen_set_gpr(a->rd, source);
+    tcg_temp_free(source);
+    return true;
+}
+
 /* Include insn module translation function */
 #include "insn_trans/trans_rvi.c.inc"
 #include "insn_trans/trans_rvm.c.inc"
@@ -601,6 +638,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvd.c.inc"
 #include "insn_trans/trans_rvh.c.inc"
 #include "insn_trans/trans_rvv.c.inc"
+#include "insn_trans/trans_rvb.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
 
 /* Include the auto-generated decoder for 16 bit insn */
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
new file mode 100644
index 0000000000..157b4e3c41
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -0,0 +1,44 @@
+/*
+ * RISC-V translation routines for the RVB Standard Extension.
+ *
+ * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
+ * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+static bool trans_clz(DisasContext *ctx, arg_clz *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, gen_clz);
+}
+
+static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, gen_ctz);
+}
+
+static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, gen_clzw);
+}
+
+static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, gen_ctzw);
+}
-- 
2.31.1


