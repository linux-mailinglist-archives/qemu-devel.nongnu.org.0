Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F71424DA8
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 09:05:07 +0200 (CEST)
Received: from localhost ([::1]:47514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNSk-0000GL-HR
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 03:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNDp-0004iT-8G
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:49:42 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:53929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNDm-0006aO-TD
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:49:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633589378; x=1665125378;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=44EpuBfg38e46D5ZB2j6SjqVBChyFccP5t1uUs09tEA=;
 b=HYpqVSMYEG7cS1dePKTEM45ZzZiVjDYleO8LyigQVmytEofNEtW3cUiL
 cAEsKDYzHRnfaR+Xgql5SIRnGbJtyNXmjHJmBPChA5e6UTxS8IBOnAyZ0
 p5KpOp32yEOOEgqRYI13AqJQouNHpgFUo5eGDbmZ26YkXBuTVeGjdOlEb
 5D+Sw0dmEibhGX3m7omzvrk5mCs/HomI1j8bBSn7dN9oB3Iof9sB0DlVB
 rrsE58Y8arfcafU+emHwWkChU2ddNfgNOANHxN+MaiqJOInY1jxEZznpG
 eqEAxgbJpFy/8w+2JI055bRx5EUIxxBOr0BxytIlEGSSssqD5GLogj9HL g==;
X-IronPort-AV: E=Sophos;i="5.85,352,1624291200"; d="scan'208";a="293815502"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2021 14:49:37 +0800
IronPort-SDR: tI3jA7YRRilHDdgIfeq9uKJENaOTpSHUSHwcqoyExiY1wGzostPkqhG/WO512OG8ZInYqA6ARS
 2oOHK/uql3nNfWr3LoNL7Ziot3U89hfDnJTo/2WjcgUyUYi6U3NYgy8uG3tYSI8L3LhHTaN250
 KXZS7vQ6UB8XqMt5kI5aSJ1+f4XnkHtLYHISu+egUX+PZ6ovykrLh0sl57FJgDdE+q25NCQSEu
 WOzi2d38j7nd5G1cppwrVgPAMhUFrQgIhxNPjC8d8AyW7emlgGqQ68h9CDj0lEBiuX0hfFSzOw
 Hz+tfj4idtBK7V/kokYuCxn8
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:23:58 -0700
IronPort-SDR: oBAII0nrQoF2zKbzCMnRNl69WLPBM4cyipJ/9EMZF6vxWy2Zpub4GbayHFM3kThwgSNbZ8sHnz
 qTjVmS3wenIHj55DoSPQaYkNe/BMxKSOrzjJD02sybNUwM2mV7JHqxciOVU2Z9b3Pqde0jXh8A
 TnrCxUGk2HNJE/xM48/+gxwFAr7HB/v0PgPhBDtnzbEYZ23W5zRaVKoVyI6HlGoSy0NNBVh4aW
 m1bi8hNZo4RdQHEVWJTzq7v9BCNWROVadx1D0qNhtAMcMIThGcNNNAGl0PZpHEoUzbaoIFLUR6
 X+g=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:49:38 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HQ24K157dz1RvmK
 for <qemu-devel@nongnu.org>; Wed,  6 Oct 2021 23:49:37 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1633589376; x=1636181377; bh=44EpuBfg38e46D5ZB2
 j6SjqVBChyFccP5t1uUs09tEA=; b=M51woXci/yEaDenwPLviRV37UYnQkbPKFc
 +Ht1Gbg/FWjEKS9mB2HJwtepUBbr9RB4lg1FJ21BHszwTvAskF6/2NreV7BiWfWm
 BYZjUwcAzCv3aXx7khcAOr8+W9rBQQmMSWD35tzO60Toymv6psC28fWVbMUIS5o+
 R9mAggmkUG7el0ziehOGmpqHyvoQHXM0pWXCOjqD2iziw3NSEAprMDE5IRPb8GOK
 iI/vc73A2+D5geZVe1lvh6Ub9JcJNGQmNdScTV59nmiiEjQ9IKUj/1avkzxA8r5k
 b6fINzRqjvwI/9NdZjK+q7Co1gh2LL3T8LpTEITsEZ885+ux9UOw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id vs6GXMJ5oZ88 for <qemu-devel@nongnu.org>;
 Wed,  6 Oct 2021 23:49:36 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.32])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HQ24D3Gnxz1RvTg;
 Wed,  6 Oct 2021 23:49:31 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 16/26] disas/riscv: Add Zb[abcs] instructions
Date: Thu,  7 Oct 2021 16:47:41 +1000
Message-Id: <20211007064751.608580-17-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=907902f29=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philipp Tomsich <philipp.tomsich@vrull.eu>

With the addition of Zb[abcs], we also need to add disassembler
support for these new instructions.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210911140016.834071-17-philipp.tomsich@vrull.eu
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 disas/riscv.c | 157 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 154 insertions(+), 3 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 278d9be924..793ad14c27 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -478,6 +478,49 @@ typedef enum {
     rv_op_fsflags =3D 316,
     rv_op_fsrmi =3D 317,
     rv_op_fsflagsi =3D 318,
+    rv_op_bseti =3D 319,
+    rv_op_bclri =3D 320,
+    rv_op_binvi =3D 321,
+    rv_op_bexti =3D 322,
+    rv_op_rori =3D 323,
+    rv_op_clz =3D 324,
+    rv_op_ctz =3D 325,
+    rv_op_cpop =3D 326,
+    rv_op_sext_h =3D 327,
+    rv_op_sext_b =3D 328,
+    rv_op_xnor =3D 329,
+    rv_op_orn =3D 330,
+    rv_op_andn =3D 331,
+    rv_op_rol =3D 332,
+    rv_op_ror =3D 333,
+    rv_op_sh1add =3D 334,
+    rv_op_sh2add =3D 335,
+    rv_op_sh3add =3D 336,
+    rv_op_sh1add_uw =3D 337,
+    rv_op_sh2add_uw =3D 338,
+    rv_op_sh3add_uw =3D 339,
+    rv_op_clmul =3D 340,
+    rv_op_clmulr =3D 341,
+    rv_op_clmulh =3D 342,
+    rv_op_min =3D 343,
+    rv_op_minu =3D 344,
+    rv_op_max =3D 345,
+    rv_op_maxu =3D 346,
+    rv_op_clzw =3D 347,
+    rv_op_ctzw =3D 348,
+    rv_op_cpopw =3D 349,
+    rv_op_slli_uw =3D 350,
+    rv_op_add_uw =3D 351,
+    rv_op_rolw =3D 352,
+    rv_op_rorw =3D 353,
+    rv_op_rev8 =3D 354,
+    rv_op_zext_h =3D 355,
+    rv_op_roriw =3D 356,
+    rv_op_orc_b =3D 357,
+    rv_op_bset =3D 358,
+    rv_op_bclr =3D 359,
+    rv_op_binv =3D 360,
+    rv_op_bext =3D 361,
 } rv_op;
=20
 /* structures */
@@ -1117,6 +1160,49 @@ const rv_opcode_data opcode_data[] =3D {
     { "fsflags", rv_codec_i_csr, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "fsrmi", rv_codec_i_csr, rv_fmt_rd_zimm, NULL, 0, 0, 0 },
     { "fsflagsi", rv_codec_i_csr, rv_fmt_rd_zimm, NULL, 0, 0, 0 },
+    { "bseti", rv_codec_i_sh7, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
+    { "bclri", rv_codec_i_sh7, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
+    { "binvi", rv_codec_i_sh7, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
+    { "bexti", rv_codec_i_sh7, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
+    { "rori", rv_codec_i_sh7, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
+    { "clz", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "ctz", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "cpop", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "sext.h", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "sext.b", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "xnor", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "orn", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "andn", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "rol", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "ror", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sh1add", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sh2add", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sh3add", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sh1add.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sh2add.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sh3add.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "clmul", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "clmulr", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "clmulh", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "min", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "minu", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "max", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "maxu", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "cpopw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "slli.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "add.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "rolw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "rorw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "rev8", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "zext.h", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "roriw", rv_codec_i_sh5, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
+    { "orc.b", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "bset", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "bclr", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "binv", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "bext", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
 };
=20
 /* CSR names */
@@ -1507,7 +1593,20 @@ static void decode_inst_opcode(rv_decode *dec, rv_=
isa isa)
             case 0: op =3D rv_op_addi; break;
             case 1:
                 switch (((inst >> 27) & 0b11111)) {
-                case 0: op =3D rv_op_slli; break;
+                case 0b00000: op =3D rv_op_slli; break;
+                case 0b00101: op =3D rv_op_bseti; break;
+                case 0b01001: op =3D rv_op_bclri; break;
+                case 0b01101: op =3D rv_op_binvi; break;
+                case 0b01100:
+                    switch (((inst >> 20) & 0b1111111)) {
+                    case 0b0000000: op =3D rv_op_clz; break;
+                    case 0b0000001: op =3D rv_op_ctz; break;
+                    case 0b0000010: op =3D rv_op_cpop; break;
+                      /* 0b0000011 */
+                    case 0b0000100: op =3D rv_op_sext_b; break;
+                    case 0b0000101: op =3D rv_op_sext_h; break;
+                    }
+                    break;
                 }
                 break;
             case 2: op =3D rv_op_slti; break;
@@ -1515,8 +1614,16 @@ static void decode_inst_opcode(rv_decode *dec, rv_=
isa isa)
             case 4: op =3D rv_op_xori; break;
             case 5:
                 switch (((inst >> 27) & 0b11111)) {
-                case 0: op =3D rv_op_srli; break;
-                case 8: op =3D rv_op_srai; break;
+                case 0b00000: op =3D rv_op_srli; break;
+                case 0b00101: op =3D rv_op_orc_b; break;
+                case 0b01000: op =3D rv_op_srai; break;
+                case 0b01001: op =3D rv_op_bexti; break;
+                case 0b01100: op =3D rv_op_rori; break;
+                case 0b01101:
+                    switch ((inst >> 20) & 0b1111111) {
+                    case 0b0111000: op =3D rv_op_rev8; break;
+                    }
+                    break;
                 }
                 break;
             case 6: op =3D rv_op_ori; break;
@@ -1530,12 +1637,21 @@ static void decode_inst_opcode(rv_decode *dec, rv=
_isa isa)
             case 1:
                 switch (((inst >> 25) & 0b1111111)) {
                 case 0: op =3D rv_op_slliw; break;
+                case 4: op =3D rv_op_slli_uw; break;
+                case 48:
+                    switch ((inst >> 20) & 0b11111) {
+                    case 0b00000: op =3D rv_op_clzw; break;
+                    case 0b00001: op =3D rv_op_ctzw; break;
+                    case 0b00010: op =3D rv_op_cpopw; break;
+                    }
+                    break;
                 }
                 break;
             case 5:
                 switch (((inst >> 25) & 0b1111111)) {
                 case 0: op =3D rv_op_srliw; break;
                 case 32: op =3D rv_op_sraiw; break;
+                case 48: op =3D rv_op_roriw; break;
                 }
                 break;
             }
@@ -1623,8 +1739,32 @@ static void decode_inst_opcode(rv_decode *dec, rv_=
isa isa)
             case 13: op =3D rv_op_divu; break;
             case 14: op =3D rv_op_rem; break;
             case 15: op =3D rv_op_remu; break;
+            case 36:
+                switch ((inst >> 20) & 0b11111) {
+                case 0: op =3D rv_op_zext_h; break;
+                }
+                break;
+            case 41: op =3D rv_op_clmul; break;
+            case 42: op =3D rv_op_clmulr; break;
+            case 43: op =3D rv_op_clmulh; break;
+            case 44: op =3D rv_op_min; break;
+            case 45: op =3D rv_op_minu; break;
+            case 46: op =3D rv_op_max; break;
+            case 47: op =3D rv_op_maxu; break;
+            case 130: op =3D rv_op_sh1add; break;
+            case 132: op =3D rv_op_sh2add; break;
+            case 134: op =3D rv_op_sh3add; break;
+            case 161: op =3D rv_op_bset; break;
             case 256: op =3D rv_op_sub; break;
+            case 260: op =3D rv_op_xnor; break;
             case 261: op =3D rv_op_sra; break;
+            case 262: op =3D rv_op_orn; break;
+            case 263: op =3D rv_op_andn; break;
+            case 289: op =3D rv_op_bclr; break;
+            case 293: op =3D rv_op_bext; break;
+            case 385: op =3D rv_op_rol; break;
+            case 386: op =3D rv_op_ror; break;
+            case 417: op =3D rv_op_binv; break;
             }
             break;
         case 13: op =3D rv_op_lui; break;
@@ -1638,8 +1778,19 @@ static void decode_inst_opcode(rv_decode *dec, rv_=
isa isa)
             case 13: op =3D rv_op_divuw; break;
             case 14: op =3D rv_op_remw; break;
             case 15: op =3D rv_op_remuw; break;
+            case 32: op =3D rv_op_add_uw; break;
+            case 36:
+                switch ((inst >> 20) & 0b11111) {
+                case 0: op =3D rv_op_zext_h; break;
+                }
+                break;
+            case 130: op =3D rv_op_sh1add_uw; break;
+            case 132: op =3D rv_op_sh2add_uw; break;
+            case 134: op =3D rv_op_sh3add_uw; break;
             case 256: op =3D rv_op_subw; break;
             case 261: op =3D rv_op_sraw; break;
+            case 385: op =3D rv_op_rolw; break;
+            case 389: op =3D rv_op_rorw; break;
             }
             break;
         case 16:
--=20
2.31.1


