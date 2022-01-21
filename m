Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 768B0495A71
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 08:14:23 +0100 (CET)
Received: from localhost ([::1]:57162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAo7q-0006LC-Aq
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 02:14:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0T-00084H-Vd
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:42 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:53953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn05-0005Cw-D2
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744936; x=1674280936;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VmOAzI2znzzQW/1LVSA8m7fnCBErlOCcnDBlzT/cH60=;
 b=fyzFhJQLtCtTmQOczAfgaXU7nYBrRjt3WX8To/Y6LOYbxMzZosU9ik8n
 Wd7hXVMQT50qZCM8HTkXDB+MV5Nv3ETr6U7xXdtkN+37KJiy53d0MUl2i
 9ZH2ctijVXC77Xb531QEHcKPh+QqnWxwHH6/QYyQwqS6WMCQSi0EhfNT6
 sbrjvfGrR6qOyHI8gi1yWLorEIpkgMBeyjMZPe1cdxwb7tgBrMriGPMJk
 4GFBgEJZKqEsa9KrxsmNpYhaSVUFG9egXWnLmdaoTs0tOR2A4Qbn/r/UE
 R9zZnmoRh/+K4sZJ+X2UOB/OmiB7Go61TdAUAiRpfk0U3d+Icy8yER7L1 w==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="195814217"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:02:15 +0800
IronPort-SDR: xi6eEPcpmehA0iTG8MqISu+tw0IsMpk2LqPq1p7c55jUn36LiIdEVZHdKT1yKVBIdvFFbJgyek
 1YrF7Vx/ehcJWa234kjyXQKGcbzrIT8z+8yy5qszgqZWTY/d6D1NJ7kQc94Kn46qefujIr4Ocm
 NmBPCA0DzGsEOafjBpjxNeOtTrgcIb+Wev52RTMakvb8B0crXqXcso0zkmayhHMtM8YwMZvdEp
 PH5K+IrRtuRcY1IC/8kal7QFWKcsp1r0lJE6mEMJOA7sSHeAtLamvLT+Afhvj6WQu+EiphFYnR
 YErEHM9xowNrsdKtC3HKQ8I3
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:35:43 -0800
IronPort-SDR: 8WM1YQHChdXIeCv/TcEVrDgGi05Ir5gwu5H2q4DA17WBbxvxEAhuaLr50I37zYEOeww6jwEyT7
 AUxM7Q3P4oiY8+oWZb4Y/lSs81Ugr4jlgnzuoWfUe/bNYAT8L82UvWqixu2TptDXqPJQ16Bu1F
 shyi9qkmWhJs7Ac3F2Y7wvhtz8DMsV49KR5IEo3lRBIhLAhtOv2o9OvfPtAdv3NNWYi6MO70/D
 B0q+s/BYtq6uU9FtEOAxIiXthKj3AgkVeZyE4dNGWRhozYguIsTi4L9v0LfsxNt5JKbm8vYXq0
 kb0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:02:15 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg80l53s2z1SVp3
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:02:15 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744935; x=1645336936; bh=VmOAzI2znzzQW/1LVS
 A8m7fnCBErlOCcnDBlzT/cH60=; b=I68HS4J8mhgRXmQ/AODJAh7pFWNZDSK1mx
 AwPI6qBBaiNl8i8kDtWn6OVDtFA1yda7JniDSqcNcACAUo4QSs0J78eAuJjEiavI
 Kz4tB/A2M3NrFGBjwvMpJIDXXnsu8kP8slY95EBvOLDsyla3LuNp6FVwciiSLk0G
 /Raqak/skm9NK/HZ4iPR8ivWuMrf85qtvLvW93vFUS45gbjDsW2WJpbTE3+IbeVA
 rE9cZAwOBglGWtvamk8WS0DcTPeR4DJCsBIHtRUXWsHQVTTpiu12KwINvNEqnzr+
 2C1Hp10sNufFfljt4Y/kPnMzDgQ6cYzUMeExEXTTg9bwHmqHQFxg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 15-NU9BHayW1 for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:02:15 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg80g3XwJz1RvlN;
 Thu, 20 Jan 2022 22:02:11 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 51/61] target/riscv: Calculate address according to XLEN
Date: Fri, 21 Jan 2022 15:58:20 +1000
Message-Id: <20220121055830.3164408-52-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Define one common function to compute a canonical address from a register
plus offset. Merge gen_pm_adjust_address into this function.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220120122050.41546-14-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c                | 25 ++++++++++++-------------
 target/riscv/insn_trans/trans_rva.c.inc |  9 +++------
 target/riscv/insn_trans/trans_rvd.c.inc | 19 ++-----------------
 target/riscv/insn_trans/trans_rvf.c.inc | 19 ++-----------------
 target/riscv/insn_trans/trans_rvi.c.inc | 18 ++----------------
 5 files changed, 21 insertions(+), 69 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 43e2ec6dce..33564d059d 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -390,21 +390,20 @@ static void gen_jal(DisasContext *ctx, int rd, targ=
et_ulong imm)
     ctx->base.is_jmp =3D DISAS_NORETURN;
 }
=20
-/*
- * Generates address adjustment for PointerMasking
- */
-static TCGv gen_pm_adjust_address(DisasContext *s, TCGv src)
+/* Compute a canonical address from a register plus offset. */
+static TCGv get_address(DisasContext *ctx, int rs1, int imm)
 {
-    TCGv temp;
-    if (!s->pm_enabled) {
-        /* Load unmodified address */
-        return src;
-    } else {
-        temp =3D temp_new(s);
-        tcg_gen_andc_tl(temp, src, pm_mask);
-        tcg_gen_or_tl(temp, temp, pm_base);
-        return temp;
+    TCGv addr =3D temp_new(ctx);
+    TCGv src1 =3D get_gpr(ctx, rs1, EXT_NONE);
+
+    tcg_gen_addi_tl(addr, src1, imm);
+    if (ctx->pm_enabled) {
+        tcg_gen_and_tl(addr, addr, pm_mask);
+        tcg_gen_or_tl(addr, addr, pm_base);
+    } else if (get_xl(ctx) =3D=3D MXL_RV32) {
+        tcg_gen_ext32u_tl(addr, addr);
     }
+    return addr;
 }
=20
 #ifndef CONFIG_USER_ONLY
diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_=
trans/trans_rva.c.inc
index 86032fa9a7..45db82c9be 100644
--- a/target/riscv/insn_trans/trans_rva.c.inc
+++ b/target/riscv/insn_trans/trans_rva.c.inc
@@ -20,12 +20,11 @@
=20
 static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
 {
-    TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_ZERO);
+    TCGv src1 =3D get_address(ctx, a->rs1, 0);
=20
     if (a->rl) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
     }
-    src1 =3D gen_pm_adjust_address(ctx, src1);
     tcg_gen_qemu_ld_tl(load_val, src1, ctx->mem_idx, mop);
     if (a->aq) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
@@ -44,8 +43,7 @@ static bool gen_sc(DisasContext *ctx, arg_atomic *a, Me=
mOp mop)
     TCGLabel *l1 =3D gen_new_label();
     TCGLabel *l2 =3D gen_new_label();
=20
-    src1 =3D get_gpr(ctx, a->rs1, EXT_ZERO);
-    src1 =3D gen_pm_adjust_address(ctx, src1);
+    src1 =3D get_address(ctx, a->rs1, 0);
     tcg_gen_brcond_tl(TCG_COND_NE, load_res, src1, l1);
=20
     /*
@@ -83,10 +81,9 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
                     MemOp mop)
 {
     TCGv dest =3D dest_gpr(ctx, a->rd);
-    TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src1 =3D get_address(ctx, a->rs1, 0);
     TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
=20
-    src1 =3D gen_pm_adjust_address(ctx, src1);
     func(dest, src1, src2, ctx->mem_idx, mop);
=20
     gen_set_gpr(ctx, a->rd, dest);
diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_=
trans/trans_rvd.c.inc
index ed444b042a..091ed3a8ad 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -25,14 +25,7 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
=20
-    addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
-    if (a->imm) {
-        TCGv temp =3D temp_new(ctx);
-        tcg_gen_addi_tl(temp, addr, a->imm);
-        addr =3D temp;
-    }
-    addr =3D gen_pm_adjust_address(ctx, addr);
-
+    addr =3D get_address(ctx, a->rs1, a->imm);
     tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], addr, ctx->mem_idx, MO_TEUQ);
=20
     mark_fs_dirty(ctx);
@@ -46,16 +39,8 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
=20
-    addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
-    if (a->imm) {
-        TCGv temp =3D temp_new(ctx);
-        tcg_gen_addi_tl(temp, addr, a->imm);
-        addr =3D temp;
-    }
-    addr =3D gen_pm_adjust_address(ctx, addr);
-
+    addr =3D get_address(ctx, a->rs1, a->imm);
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEUQ);
-
     return true;
 }
=20
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_=
trans/trans_rvf.c.inc
index b5459249c4..0aac87f7db 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -31,14 +31,7 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
=20
-    addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
-    if (a->imm) {
-        TCGv temp =3D temp_new(ctx);
-        tcg_gen_addi_tl(temp, addr, a->imm);
-        addr =3D temp;
-    }
-    addr =3D gen_pm_adjust_address(ctx, addr);
-
+    addr =3D get_address(ctx, a->rs1, a->imm);
     dest =3D cpu_fpr[a->rd];
     tcg_gen_qemu_ld_i64(dest, addr, ctx->mem_idx, MO_TEUL);
     gen_nanbox_s(dest, dest);
@@ -54,16 +47,8 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
=20
-    addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
-    if (a->imm) {
-        TCGv temp =3D tcg_temp_new();
-        tcg_gen_addi_tl(temp, addr, a->imm);
-        addr =3D temp;
-    }
-    addr =3D gen_pm_adjust_address(ctx, addr);
-
+    addr =3D get_address(ctx, a->rs1, a->imm);
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEUL);
-
     return true;
 }
=20
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
index 631bc1f09e..3cd1b3f877 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -226,14 +226,7 @@ static bool trans_bgeu(DisasContext *ctx, arg_bgeu *=
a)
 static bool gen_load_tl(DisasContext *ctx, arg_lb *a, MemOp memop)
 {
     TCGv dest =3D dest_gpr(ctx, a->rd);
-    TCGv addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
-
-    if (a->imm) {
-        TCGv temp =3D temp_new(ctx);
-        tcg_gen_addi_tl(temp, addr, a->imm);
-        addr =3D temp;
-    }
-    addr =3D gen_pm_adjust_address(ctx, addr);
+    TCGv addr =3D get_address(ctx, a->rs1, a->imm);
=20
     tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, memop);
     gen_set_gpr(ctx, a->rd, dest);
@@ -330,16 +323,9 @@ static bool trans_ldu(DisasContext *ctx, arg_ldu *a)
=20
 static bool gen_store_tl(DisasContext *ctx, arg_sb *a, MemOp memop)
 {
-    TCGv addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv addr =3D get_address(ctx, a->rs1, a->imm);
     TCGv data =3D get_gpr(ctx, a->rs2, EXT_NONE);
=20
-    if (a->imm) {
-        TCGv temp =3D temp_new(ctx);
-        tcg_gen_addi_tl(temp, addr, a->imm);
-        addr =3D temp;
-    }
-    addr =3D gen_pm_adjust_address(ctx, addr);
-
     tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
     return true;
 }
--=20
2.31.1


