Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7491E5AFEDF
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 10:21:22 +0200 (CEST)
Received: from localhost ([::1]:46078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVqJF-0007I1-9y
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 04:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq2t-0003cE-4o
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:04:31 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq2r-0004Nn-8u
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:04:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537864; x=1694073864;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ykb9+4I6LlgERVXc54UQtT5SYRq6VmazzFG6SSk9xT0=;
 b=SxhxL2uNc+jd14Iveou8ZNBJZ2cYjHdO7LDnXpeJVT20T+rJ+rHqJcfx
 n9Fg3NESHBT7ZIemYTdvbQpdPy7Tpcbv89We3WZYbwJp8xsROQY+es25h
 fVDDKW9IXukPeXHJvJGkqAytjE0xo+QuLDYM1etCFfll8X9UCyx7oxiom
 xf/Udt+A0sHL6/o+bJmufvdMRMcIOpJRaLWOu+xBybtUwAuPHn/q/dSNE
 XMpVyQDdekbOl+qZGOLxJp61HoSamIpaz52354ixhvLdlrR8p2r80OYWw
 2GIXxki6hJ2l1apRyeEaakzLJCtbcaTXKi1IQPLwEqO52TxHNs13Cd+U5 Q==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210714940"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:04:17 +0800
IronPort-SDR: rcg83WKInhBhiD5rpPn5dXjGUMpKgti9MvxtrHIbtFtqPcfjvkDexq6lSCGYLXlxIGS+u6VGwZ
 Fvhf7K5Mc1v4RGUTFhzGSPNFkSF9H/blR1KnS1UvF+IaQ9OzXeUJK0U/LaS/4lBOt04pzjT51p
 2x2Y0vBHAEZRjwjqPBLViySemGTGOpP83AfA0SIqqxj8IhlIbqjF3LPm4burEe/9bZ+GjVAWV1
 /uoaTHadcO1i4sLnXmYCMRwxKFK1DaE2FC2AR9Gv2RlZEaAjS2bfdhveH77Cj8Zgf0Niv39Wfp
 9wN9DkG/ZrSdzcKdIHhP8AVU
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:19:14 -0700
IronPort-SDR: hbIEeeV2in9qPneBzwLo6VvrYqBH4WhFnaCQXn5YImsvje2rXlLmaA/YUUCGE92zxIqLGcZFV3
 uk7nR7diVxgoI+yC+Pr4yYIF+eibtyMR3RtFl0oFuRaICulTAdEuwtlb53FJBifn8uJwAxQMec
 nfFOXZK7tSbLqXglNCR7XUIW2Bz6v9wfGGmRFyy8dHdKYMflYHRZTNZqJ/yboY6vhNq1MpbMye
 HaS5+1IKgMeGCVU4OIVN8fMfszocEC5H50DTWA4NYq0x69m4eSsoYOFweC4mVbsymSWSqsxW+D
 bfk=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:04:16 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 03/44] target/riscv: fix shifts shamt value for rv128c
Date: Wed,  7 Sep 2022 10:03:12 +0200
Message-Id: <20220907080353.111926-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220907080353.111926-1-alistair.francis@wdc.com>
References: <20220907080353.111926-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=242877ce7=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
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
Reply-to:  Alistair Francis <alistair.francis@wdc.com>
From:  Alistair Francis via <qemu-devel@nongnu.org>

From: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>

For rv128c shifts, a shamt of 0 is a shamt of 64, while for rv32c/rv64c
it stays 0 and is a hint instruction that does not change processor state.
For rv128c right shifts, the 6-bit shamt is in addition sign extended to
7 bits.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220710110451.245567-1-frederic.petrot@univ-grenoble-alpes.fr>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn16.decode |  7 ++++---
 disas/riscv.c              | 27 +++++++++++++++++++++------
 target/riscv/translate.c   | 20 ++++++++++++++++++--
 3 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index 02c8f61b48..ccfe59f294 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -31,7 +31,8 @@
 %imm_cb        12:s1 5:2 2:1 10:2 3:2 !function=ex_shift_1
 %imm_cj        12:s1 8:1 9:2 6:1 7:1 2:1 11:1 3:3 !function=ex_shift_1
 
-%shimm_6bit   12:1 2:5               !function=ex_rvc_shifti
+%shlimm_6bit  12:1 2:5               !function=ex_rvc_shiftli
+%shrimm_6bit  12:1 2:5               !function=ex_rvc_shiftri
 %uimm_6bit_lq 2:4 12:1 6:1           !function=ex_shift_4
 %uimm_6bit_ld 2:3 12:1 5:2           !function=ex_shift_3
 %uimm_6bit_lw 2:2 12:1 4:3           !function=ex_shift_2
@@ -82,9 +83,9 @@
 @c_addi16sp     ... .  ..... ..... .. &i imm=%imm_addi16sp rs1=2 rd=2
 
 @c_shift        ... . .. ... ..... .. \
-                &shift rd=%rs1_3 rs1=%rs1_3 shamt=%shimm_6bit
+                &shift rd=%rs1_3 rs1=%rs1_3 shamt=%shrimm_6bit
 @c_shift2       ... . .. ... ..... .. \
-                &shift rd=%rd rs1=%rd shamt=%shimm_6bit
+                &shift rd=%rd rs1=%rd shamt=%shlimm_6bit
 
 @c_andi         ... . .. ... ..... .. &i imm=%imm_ci rs1=%rs1_3 rd=%rs1_3
 
diff --git a/disas/riscv.c b/disas/riscv.c
index 7af6afc8fa..489c2ae5e8 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -2402,10 +2402,25 @@ static int32_t operand_sbimm12(rv_inst inst)
         ((inst << 56) >> 63) << 11;
 }
 
-static uint32_t operand_cimmsh6(rv_inst inst)
+static uint32_t operand_cimmshl6(rv_inst inst, rv_isa isa)
 {
-    return ((inst << 51) >> 63) << 5 |
+    int imm = ((inst << 51) >> 63) << 5 |
         (inst << 57) >> 59;
+    if (isa == rv128) {
+        imm = imm ? imm : 64;
+    }
+    return imm;
+}
+
+static uint32_t operand_cimmshr6(rv_inst inst, rv_isa isa)
+{
+    int imm = ((inst << 51) >> 63) << 5 |
+        (inst << 57) >> 59;
+    if (isa == rv128) {
+        imm = imm | (imm & 32) << 1;
+        imm = imm ? imm : 64;
+    }
+    return imm;
 }
 
 static int32_t operand_cimmi(rv_inst inst)
@@ -2529,7 +2544,7 @@ static uint32_t operand_rnum(rv_inst inst)
 
 /* decode operands */
 
-static void decode_inst_operands(rv_decode *dec)
+static void decode_inst_operands(rv_decode *dec, rv_isa isa)
 {
     rv_inst inst = dec->inst;
     dec->codec = opcode_data[dec->op].codec;
@@ -2652,7 +2667,7 @@ static void decode_inst_operands(rv_decode *dec)
     case rv_codec_cb_sh6:
         dec->rd = dec->rs1 = operand_crs1rdq(inst) + 8;
         dec->rs2 = rv_ireg_zero;
-        dec->imm = operand_cimmsh6(inst);
+        dec->imm = operand_cimmshr6(inst, isa);
         break;
     case rv_codec_ci:
         dec->rd = dec->rs1 = operand_crs1rd(inst);
@@ -2667,7 +2682,7 @@ static void decode_inst_operands(rv_decode *dec)
     case rv_codec_ci_sh6:
         dec->rd = dec->rs1 = operand_crs1rd(inst);
         dec->rs2 = rv_ireg_zero;
-        dec->imm = operand_cimmsh6(inst);
+        dec->imm = operand_cimmshl6(inst, isa);
         break;
     case rv_codec_ci_16sp:
         dec->rd = rv_ireg_sp;
@@ -3193,7 +3208,7 @@ disasm_inst(char *buf, size_t buflen, rv_isa isa, uint64_t pc, rv_inst inst)
     dec.pc = pc;
     dec.inst = inst;
     decode_inst_opcode(&dec, isa);
-    decode_inst_operands(&dec);
+    decode_inst_operands(&dec, isa);
     decode_inst_decompress(&dec, isa);
     decode_inst_lift_pseudo(&dec);
     format_inst(buf, buflen, 16, &dec);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f8af6daa70..6eeb728462 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -705,10 +705,26 @@ static int ex_rvc_register(DisasContext *ctx, int reg)
     return 8 + reg;
 }
 
-static int ex_rvc_shifti(DisasContext *ctx, int imm)
+static int ex_rvc_shiftli(DisasContext *ctx, int imm)
 {
     /* For RV128 a shamt of 0 means a shift by 64. */
-    return imm ? imm : 64;
+    if (get_ol(ctx) == MXL_RV128) {
+        imm = imm ? imm : 64;
+    }
+    return imm;
+}
+
+static int ex_rvc_shiftri(DisasContext *ctx, int imm)
+{
+    /*
+     * For RV128 a shamt of 0 means a shift by 64, furthermore, for right
+     * shifts, the shamt is sign-extended.
+     */
+    if (get_ol(ctx) == MXL_RV128) {
+        imm = imm | (imm & 32) << 1;
+        imm = imm ? imm : 64;
+    }
+    return imm;
 }
 
 /* Include the auto-generated decoder for 32 bit insn */
-- 
2.37.2


