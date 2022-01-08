Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6CD488219
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 08:18:49 +0100 (CET)
Received: from localhost ([::1]:38090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6600-0006my-89
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 02:18:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64f1-000159-2H
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:53:05 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:63920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64ey-0006v6-Mb
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:53:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621179; x=1673157179;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qow7RUy4n+7I1ICQlNnmygX4ffq0E998jg0dHVp2TuM=;
 b=JhoxRDrlYHpjS90QnXaOe9q00sO/EzTYNjFoFU7reqOE+HM5dauc7/TR
 3IqyP6+VXC74skN6zjtCkOngflf/IQCHqty76aCALUGoIX1Kdab0AyJXY
 QJNG64qWH/uHhOz9FmYBbJDv6uOBqDfqjoOfFp/Dk1GJx77kGOn4Kn0AI
 O/t207q1FDk9rFuY/oAExrVqlYgYbrLISUh31m9P79z7Y+mlpAWV59I3x
 hP11awdMhqZouhnxm51quojKOvJkDI7YmeTnUhDj+FZDfKJWQCr3Gzwj5
 75h6bI1oC2apBqqpo7Zz6tgnaztiHApDSl3/8VGHZSFThWUs+omP6g9IA g==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="189984935"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:52:55 +0800
IronPort-SDR: sPg+qACnqu30F4A4oNYgLDmemlOs+ypLTGCnzhyQACiGdw+fzPVr3T2CgCE/9InMO/+EFrKcE2
 ovIYPVT8cTR/+1oFC/DrWqhy6EYbjMR+SThgTzSXrUqfK819HwXcRwJYgjhaS0cF59G+i532kK
 9kKiGaRjEhP6h4J51T+YSD6iMd1DyESPk5HpOpsVb2XJItSimrSW54NgQijhYTz76sgYIRip+v
 NEKa8wfkmA8D9b+cswALqGdZ3j3KRY4v30K0EPzeZEhYvfD6DDmma9rxKPYakxtObOQU/35+9F
 nYoFLVHvF/fiXqS7g/ICK4EU
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:25:23 -0800
IronPort-SDR: 8rKsbVyPXz74c8Oa1P14bATAddlcqYNhKw+MeK/vHRTRnkCLDQ6QcRt+Uyc5QMAjOpBiM35D84
 5g+NRcWaVrp6F8ky60HXGzVuETiqWaLt5AwZp3lhWLVTxMWP1z4zSKnFN1VYSB8zOpdFAE6pX6
 8GjOseY+IyMLzW4BkSxgWnqh3v09Dr0Bur2ffAU63pNnuwUnSae1U1HmsjLRyAbaJ2W4wqajEE
 e4tFi9mWPzfJV+FJTZED4ykSD30/je9JwRbdUvWXfu4y74Sf1iPvPjOnHAwTVZvpCGEPSa/2Pg
 dm0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:52:57 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8Q01PqJz1VSkX
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:52:56 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1641621175; x=1644213176; bh=Qow7RUy
 4n+7I1ICQlNnmygX4ffq0E998jg0dHVp2TuM=; b=MK1SLFsAhTRNHAooJ0iJ0cF
 9BoFLvW53fUf7dl8jerYrAjmp99wWCNkVUHJwS/4pDeiv8jFyv4Vn+eUb67VuPO3
 lwAa9SAuiMaiss5AJgPL+3YBgctuqdVUSHIJbjxWRvIq+V7NCzUi7gkljdOdBr1V
 Qu3ewlWZ0dbeKcJnIAgR3yVwUbb+7MveJxQGxWY2jIwex5NCejHd6RmfbxrU63l4
 7R669KfFTgkFNYF0Qir45hFPjVmJc9xpaR/cv9Uc3CEmFissvWpWx0qM313BWWbe
 zJ2KLAwaWwxcSm4tD1R+fkGHIDZruobkKwgk5Inzxskckj21kog+dHkzCeBz1+g=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id N2TGvHsxQ5qi for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:52:55 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8Pv4Vysz1VSkW;
 Fri,  7 Jan 2022 21:52:51 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 25/37] target/riscv: accessors to registers upper part and
 128-bit load/store
Date: Sat,  8 Jan 2022 15:50:36 +1000
Message-Id: <20220108055048.3512645-26-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
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

From: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-grenoble-alpes=
.fr>

Get function to retrieve the 64 top bits of a register, stored in the gpr=
h
field of the cpu state. Set function that writes the 128-bit value at onc=
e.
The access to the gprh field can not be protected at compile time to make
sure it is accessed only in the 128-bit version of the processor because =
we
have no way to indicate that the misa_mxl_max field is const.

The 128-bit ISA adds ldu, lq and sq. We provide support for these
instructions. Note that (a) we compute only 64-bit addresses to actually
access memory, cowardly utilizing the existing address translation mechan=
ism
of QEMU, and (b) we assume for now little-endian memory accesses.

Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220106210108.138226-10-frederic.petrot@univ-grenoble-alpes.=
fr
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn16.decode              |  27 ++++++-
 target/riscv/insn32.decode              |   5 ++
 target/riscv/translate.c                |  41 ++++++++++
 target/riscv/insn_trans/trans_rvi.c.inc | 100 ++++++++++++++++++++++--
 4 files changed, 163 insertions(+), 10 deletions(-)

diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index 2e9212663c..02c8f61b48 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -25,14 +25,17 @@
 # Immediates:
 %imm_ci        12:s1 2:5
 %nzuimm_ciw    7:4 11:2 5:1 6:1   !function=3Dex_shift_2
+%uimm_cl_q     10:1 5:2 11:2      !function=3Dex_shift_4
 %uimm_cl_d     5:2 10:3           !function=3Dex_shift_3
 %uimm_cl_w     5:1 10:3 6:1       !function=3Dex_shift_2
 %imm_cb        12:s1 5:2 2:1 10:2 3:2 !function=3Dex_shift_1
 %imm_cj        12:s1 8:1 9:2 6:1 7:1 2:1 11:1 3:3 !function=3Dex_shift_1
=20
 %shimm_6bit   12:1 2:5               !function=3Dex_rvc_shifti
+%uimm_6bit_lq 2:4 12:1 6:1           !function=3Dex_shift_4
 %uimm_6bit_ld 2:3 12:1 5:2           !function=3Dex_shift_3
 %uimm_6bit_lw 2:2 12:1 4:3           !function=3Dex_shift_2
+%uimm_6bit_sq 7:4 11:2               !function=3Dex_shift_4
 %uimm_6bit_sd 7:3 10:3               !function=3Dex_shift_3
 %uimm_6bit_sw 7:2 9:4                !function=3Dex_shift_2
=20
@@ -54,16 +57,20 @@
 # Formats 16:
 @cr        ....  ..... .....  .. &r      rs2=3D%rs2_5       rs1=3D%rd   =
  %rd
 @ci        ... . ..... .....  .. &i      imm=3D%imm_ci      rs1=3D%rd   =
  %rd
+@cl_q      ... . .....  ..... .. &i      imm=3D%uimm_cl_q   rs1=3D%rs1_3=
  rd=3D%rs2_3
 @cl_d      ... ... ... .. ... .. &i      imm=3D%uimm_cl_d   rs1=3D%rs1_3=
  rd=3D%rs2_3
 @cl_w      ... ... ... .. ... .. &i      imm=3D%uimm_cl_w   rs1=3D%rs1_3=
  rd=3D%rs2_3
 @cs_2      ... ... ... .. ... .. &r      rs2=3D%rs2_3       rs1=3D%rs1_3=
  rd=3D%rs1_3
+@cs_q      ... ... ... .. ... .. &s      imm=3D%uimm_cl_q   rs1=3D%rs1_3=
  rs2=3D%rs2_3
 @cs_d      ... ... ... .. ... .. &s      imm=3D%uimm_cl_d   rs1=3D%rs1_3=
  rs2=3D%rs2_3
 @cs_w      ... ... ... .. ... .. &s      imm=3D%uimm_cl_w   rs1=3D%rs1_3=
  rs2=3D%rs2_3
 @cj        ...    ........... .. &j      imm=3D%imm_cj
 @cb_z      ... ... ... .. ... .. &b      imm=3D%imm_cb      rs1=3D%rs1_3=
  rs2=3D0
=20
+@c_lqsp    ... . .....  ..... .. &i      imm=3D%uimm_6bit_lq rs1=3D2 %rd
 @c_ldsp    ... . .....  ..... .. &i      imm=3D%uimm_6bit_ld rs1=3D2 %rd
 @c_lwsp    ... . .....  ..... .. &i      imm=3D%uimm_6bit_lw rs1=3D2 %rd
+@c_sqsp    ... . .....  ..... .. &s      imm=3D%uimm_6bit_sq rs1=3D2 rs2=
=3D%rs2_5
 @c_sdsp    ... . .....  ..... .. &s      imm=3D%uimm_6bit_sd rs1=3D2 rs2=
=3D%rs2_5
 @c_swsp    ... . .....  ..... .. &s      imm=3D%uimm_6bit_sw rs1=3D2 rs2=
=3D%rs2_5
 @c_li      ... . .....  ..... .. &i      imm=3D%imm_ci rs1=3D0 %rd
@@ -87,9 +94,15 @@
   illegal         000  000 000 00 --- 00
   addi            000  ... ... .. ... 00 @c_addi4spn
 }
-fld               001  ... ... .. ... 00 @cl_d
+{
+  lq              001  ... ... .. ... 00 @cl_q
+  fld             001  ... ... .. ... 00 @cl_d
+}
 lw                010  ... ... .. ... 00 @cl_w
-fsd               101  ... ... .. ... 00 @cs_d
+{
+  sq              101  ... ... .. ... 00 @cs_q
+  fsd             101  ... ... .. ... 00 @cs_d
+}
 sw                110  ... ... .. ... 00 @cs_w
=20
 # *** RV32C and RV64C specific Standard Extension (Quadrant 0) ***
@@ -132,7 +145,10 @@ addw              100 1 11 ... 01 ... 01 @cs_2
=20
 # *** RV32/64C Standard Extension (Quadrant 2) ***
 slli              000 .  .....  ..... 10 @c_shift2
-fld               001 .  .....  ..... 10 @c_ldsp
+{
+  lq              001  ... ... .. ... 10 @c_lqsp
+  fld             001 .  .....  ..... 10 @c_ldsp
+}
 {
   illegal         010 -  00000  ----- 10 # c.lwsp, RES rd=3D0
   lw              010 .  .....  ..... 10 @c_lwsp
@@ -147,7 +163,10 @@ fld               001 .  .....  ..... 10 @c_ldsp
   jalr            100 1  .....  00000 10 @c_jalr rd=3D1  # C.JALR
   add             100 1  .....  ..... 10 @cr
 }
-fsd               101   ......  ..... 10 @c_sdsp
+{
+  sq              101  ... ... .. ... 10 @c_sqsp
+  fsd             101   ......  ..... 10 @c_sdsp
+}
 sw                110 .  .....  ..... 10 @c_swsp
=20
 # *** RV32C and RV64C specific Standard Extension (Quadrant 2) ***
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 8617307b29..ddbf0da03c 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -162,6 +162,11 @@ sllw     0000000 .....  ..... 001 ..... 0111011 @r
 srlw     0000000 .....  ..... 101 ..... 0111011 @r
 sraw     0100000 .....  ..... 101 ..... 0111011 @r
=20
+# *** RV128I Base Instruction Set (in addition to RV64I) ***
+ldu      ............   ..... 111 ..... 0000011 @i
+lq       ............   ..... 010 ..... 0001111 @i
+sq       ............   ..... 100 ..... 0100011 @s
+
 # *** RV32M Standard Extension ***
 mul      0000001 .....  ..... 000 ..... 0110011 @r
 mulh     0000001 .....  ..... 001 ..... 0110011 @r
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6c400e8452..d4cf965c9e 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -59,6 +59,7 @@ typedef struct DisasContext {
     /* pc_succ_insn points to the instruction following base.pc_next */
     target_ulong pc_succ_insn;
     target_ulong priv_ver;
+    RISCVMXL misa_mxl_max;
     RISCVMXL xl;
     uint32_t misa_ext;
     uint32_t opcode;
@@ -141,6 +142,13 @@ static inline int get_olen(DisasContext *ctx)
     return 16 << get_ol(ctx);
 }
=20
+/* The maximum register length */
+#ifdef TARGET_RISCV32
+#define get_xl_max(ctx)    MXL_RV32
+#else
+#define get_xl_max(ctx)    ((ctx)->misa_mxl_max)
+#endif
+
 /*
  * RISC-V requires NaN-boxing of narrower width floating point values.
  * This applies when a 32-bit value is assigned to a 64-bit FP register.
@@ -260,6 +268,7 @@ static TCGv get_gpr(DisasContext *ctx, int reg_num, D=
isasExtend ext)
         }
         break;
     case MXL_RV64:
+    case MXL_RV128:
         break;
     default:
         g_assert_not_reached();
@@ -267,6 +276,15 @@ static TCGv get_gpr(DisasContext *ctx, int reg_num, =
DisasExtend ext)
     return cpu_gpr[reg_num];
 }
=20
+static TCGv get_gprh(DisasContext *ctx, int reg_num)
+{
+    assert(get_xl(ctx) =3D=3D MXL_RV128);
+    if (reg_num =3D=3D 0) {
+        return ctx->zero;
+    }
+    return cpu_gprh[reg_num];
+}
+
 static TCGv dest_gpr(DisasContext *ctx, int reg_num)
 {
     if (reg_num =3D=3D 0 || get_olen(ctx) < TARGET_LONG_BITS) {
@@ -275,6 +293,14 @@ static TCGv dest_gpr(DisasContext *ctx, int reg_num)
     return cpu_gpr[reg_num];
 }
=20
+static TCGv dest_gprh(DisasContext *ctx, int reg_num)
+{
+    if (reg_num =3D=3D 0) {
+        return temp_new(ctx);
+    }
+    return cpu_gprh[reg_num];
+}
+
 static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
 {
     if (reg_num !=3D 0) {
@@ -283,11 +309,25 @@ static void gen_set_gpr(DisasContext *ctx, int reg_=
num, TCGv t)
             tcg_gen_ext32s_tl(cpu_gpr[reg_num], t);
             break;
         case MXL_RV64:
+        case MXL_RV128:
             tcg_gen_mov_tl(cpu_gpr[reg_num], t);
             break;
         default:
             g_assert_not_reached();
         }
+
+        if (get_xl_max(ctx) =3D=3D MXL_RV128) {
+            tcg_gen_sari_tl(cpu_gprh[reg_num], cpu_gpr[reg_num], 63);
+        }
+    }
+}
+
+static void gen_set_gpr128(DisasContext *ctx, int reg_num, TCGv rl, TCGv=
 rh)
+{
+    assert(get_ol(ctx) =3D=3D MXL_RV128);
+    if (reg_num !=3D 0) {
+        tcg_gen_mov_tl(cpu_gpr[reg_num], rl);
+        tcg_gen_mov_tl(cpu_gprh[reg_num], rh);
     }
 }
=20
@@ -754,6 +794,7 @@ static void riscv_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
     ctx->lmul =3D sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3)=
;
     ctx->vstart =3D env->vstart;
     ctx->vl_eq_vlmax =3D FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
+    ctx->misa_mxl_max =3D env->misa_mxl_max;
     ctx->xl =3D FIELD_EX32(tb_flags, TB_FLAGS, XL);
     ctx->cs =3D cs;
     ctx->ntemp =3D 0;
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
index 710f5e6a85..e572976e88 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -134,7 +134,7 @@ static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a=
)
     return gen_branch(ctx, a, TCG_COND_GEU);
 }
=20
-static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
+static bool gen_load_tl(DisasContext *ctx, arg_lb *a, MemOp memop)
 {
     TCGv dest =3D dest_gpr(ctx, a->rd);
     TCGv addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
@@ -151,6 +151,45 @@ static bool gen_load(DisasContext *ctx, arg_lb *a, M=
emOp memop)
     return true;
 }
=20
+/* Compute only 64-bit addresses to use the address translation mechanis=
m */
+static bool gen_load_i128(DisasContext *ctx, arg_lb *a, MemOp memop)
+{
+    TCGv src1l =3D get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv destl =3D dest_gpr(ctx, a->rd);
+    TCGv desth =3D dest_gprh(ctx, a->rd);
+    TCGv addrl =3D tcg_temp_new();
+
+    tcg_gen_addi_tl(addrl, src1l, a->imm);
+
+    if ((memop & MO_SIZE) <=3D MO_64) {
+        tcg_gen_qemu_ld_tl(destl, addrl, ctx->mem_idx, memop);
+        if (memop & MO_SIGN) {
+            tcg_gen_sari_tl(desth, destl, 63);
+        } else {
+            tcg_gen_movi_tl(desth, 0);
+        }
+    } else {
+        /* assume little-endian memory access for now */
+        tcg_gen_qemu_ld_tl(destl, addrl, ctx->mem_idx, MO_TEUQ);
+        tcg_gen_addi_tl(addrl, addrl, 8);
+        tcg_gen_qemu_ld_tl(desth, addrl, ctx->mem_idx, MO_TEUQ);
+    }
+
+    gen_set_gpr128(ctx, a->rd, destl, desth);
+
+    tcg_temp_free(addrl);
+    return true;
+}
+
+static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
+{
+    if (get_xl(ctx) =3D=3D MXL_RV128) {
+        return gen_load_i128(ctx, a, memop);
+    } else {
+        return gen_load_tl(ctx, a, memop);
+    }
+}
+
 static bool trans_lb(DisasContext *ctx, arg_lb *a)
 {
     return gen_load(ctx, a, MO_SB);
@@ -166,6 +205,18 @@ static bool trans_lw(DisasContext *ctx, arg_lw *a)
     return gen_load(ctx, a, MO_TESL);
 }
=20
+static bool trans_ld(DisasContext *ctx, arg_ld *a)
+{
+    REQUIRE_64_OR_128BIT(ctx);
+    return gen_load(ctx, a, MO_TESQ);
+}
+
+static bool trans_lq(DisasContext *ctx, arg_lq *a)
+{
+    REQUIRE_128BIT(ctx);
+    return gen_load(ctx, a, MO_TEUO);
+}
+
 static bool trans_lbu(DisasContext *ctx, arg_lbu *a)
 {
     return gen_load(ctx, a, MO_UB);
@@ -178,17 +229,17 @@ static bool trans_lhu(DisasContext *ctx, arg_lhu *a=
)
=20
 static bool trans_lwu(DisasContext *ctx, arg_lwu *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     return gen_load(ctx, a, MO_TEUL);
 }
=20
-static bool trans_ld(DisasContext *ctx, arg_ld *a)
+static bool trans_ldu(DisasContext *ctx, arg_ldu *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_128BIT(ctx);
     return gen_load(ctx, a, MO_TEUQ);
 }
=20
-static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
+static bool gen_store_tl(DisasContext *ctx, arg_sb *a, MemOp memop)
 {
     TCGv addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
     TCGv data =3D get_gpr(ctx, a->rs2, EXT_NONE);
@@ -204,6 +255,37 @@ static bool gen_store(DisasContext *ctx, arg_sb *a, =
MemOp memop)
     return true;
 }
=20
+static bool gen_store_i128(DisasContext *ctx, arg_sb *a, MemOp memop)
+{
+    TCGv src1l =3D get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2l =3D get_gpr(ctx, a->rs2, EXT_NONE);
+    TCGv src2h =3D get_gprh(ctx, a->rs2);
+    TCGv addrl =3D tcg_temp_new();
+
+    tcg_gen_addi_tl(addrl, src1l, a->imm);
+
+    if ((memop & MO_SIZE) <=3D MO_64) {
+        tcg_gen_qemu_st_tl(src2l, addrl, ctx->mem_idx, memop);
+    } else {
+        /* little-endian memory access assumed for now */
+        tcg_gen_qemu_st_tl(src2l, addrl, ctx->mem_idx, MO_TEUQ);
+        tcg_gen_addi_tl(addrl, addrl, 8);
+        tcg_gen_qemu_st_tl(src2h, addrl, ctx->mem_idx, MO_TEUQ);
+    }
+
+    tcg_temp_free(addrl);
+    return true;
+}
+
+static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
+{
+    if (get_xl(ctx) =3D=3D MXL_RV128) {
+        return gen_store_i128(ctx, a, memop);
+    } else {
+        return gen_store_tl(ctx, a, memop);
+    }
+}
+
 static bool trans_sb(DisasContext *ctx, arg_sb *a)
 {
     return gen_store(ctx, a, MO_SB);
@@ -221,10 +303,16 @@ static bool trans_sw(DisasContext *ctx, arg_sw *a)
=20
 static bool trans_sd(DisasContext *ctx, arg_sd *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     return gen_store(ctx, a, MO_TEUQ);
 }
=20
+static bool trans_sq(DisasContext *ctx, arg_sq *a)
+{
+    REQUIRE_128BIT(ctx);
+    return gen_store(ctx, a, MO_TEUO);
+}
+
 static bool trans_addi(DisasContext *ctx, arg_addi *a)
 {
     return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_addi_tl);
--=20
2.31.1


