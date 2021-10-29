Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8381443F7CC
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 09:24:19 +0200 (CEST)
Received: from localhost ([::1]:45778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgMFO-00073h-HL
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 03:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM7B-0006lO-R2
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:15:52 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:18065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM73-0001ar-QR
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:15:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635491741; x=1667027741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/o5ylGtDG9WEJprAVtcrrZ+GBejGN7Ll5LX1ADFWUZs=;
 b=QV9kOOMpW7ZtaTYgGnUKbJGy17ZsQeedH51ANhFIW/keCsXiUr2Kn7Yq
 rpdKpkWttH6s5f2q76F1jXAKLlHeoXp6zfB1hGL0xIZRkHeyeG3mttv6d
 TZX2D1mhyJqO1ICC1QquwYseyERw0/prmF2mqf1C2rwb2WYT9aOP1+CF+
 74eUxDG2R3ZQPIPuUPELcVUuVEAtmuO8nZkQBdhTRKVA8HTCWCRazMoyk
 xVTwax1iORKckayQzNEzJUlUgfdycouSgphPELIsFmf5GhN3WvtJRUsP8
 ocUPGIS6SkTNveVc4A/r1mUlzqWEcP3Yb1f3oRAtmkzAdUmJVZifEKZue w==;
X-IronPort-AV: E=Sophos;i="5.87,191,1631548800"; d="scan'208";a="188934265"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Oct 2021 15:15:37 +0800
IronPort-SDR: TRJVou6lSEYz7QrnUHpBXlAx7CnBWC08JlXSF7y/tJTP1AZ69CzS+Gy7GFGv1AJoiNsv9RRLA/
 fDylIBgExfBPB+himwznCe5FOE8Fkd/ZtEE6s06xrtNWoGKevDFBNQqyjvzF4M5/vx5Tjt4ISK
 zovnZZp0KFDk9Cp+P73eg+oizHPLdaN6BXFNxO9BEjxVvv3wYARH60dHm9rFH3JQ3tCVnmSB4b
 n2fkW4X6EeouNXKQpiipTO59RaIwPpdvC0E+8psnhCPl+Q/hMuOHUC+lHjMKJczDe17oxgntpq
 XVcRSUt/1XERKrPgzv5JDz5/
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 23:49:31 -0700
IronPort-SDR: tlQAMlb6xcvDkJOVGzBWKj91pvF92iav9WgyZmii7P97xVglAzO15A246yBbQ/6EXwEgYl5Z61
 BSUaIT9fOWLSKZllFoHN7ZFuPD4oyusNAyt9jU4SRBO1oYXw3WmqDrIXczh9nCIFJNm5jmIJCH
 bO8rK+ouJj4xRS96CyexTrjDOPxgV4V/coKNRU1C9rxNRxam5O+QtTwUKqhNi5R1G5fthk8RJi
 Er7Yd6ZEUHr2G5EpfPckY4cJdhbjUHn/M6PaHMtfojl5uurKXS+UNchZ1uadzAppDnb/d4Yf50
 z2w=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 00:15:38 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HgYc94lN4z1RtVv
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 00:15:37 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1635491736; x=1638083737; bh=/o5ylGtDG9WEJprAVt
 crrZ+GBejGN7Ll5LX1ADFWUZs=; b=ko2SlEHL347BlnH8482DTSxtDIbf8KunT3
 xzlsEvQ3HyKxUzo3ZzlKxWN1fXuumQsbizezQrOtV3d1qxZfmd/uFcaylIFIOwKa
 /1eQj5Z90UQA+fy8QMzM0DbN0didkw6++9q2GvsIVTkKcsGDEdZY0kxWv8F3uvg+
 GrRtC+RQUArZzAkIaTmVQLnqkNUcXcnkIwLrRrwmw+dlAXUExNQ+BO/vpgJsoV+g
 sg1aZZzYlQ+aCZoYxC4trKQt1tc7HysKCeiBhR4KoBpqhrdWY1VtAuIaW+p80OTn
 tUsDrHuYvjB5CfikFokEcqi+SRL1TozohV8uzTOHQ5EujDBMeCxA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Q1KyTDSuBjrM for <qemu-devel@nongnu.org>;
 Fri, 29 Oct 2021 00:15:36 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.42])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HgYc35xJ2z1RtVl;
 Fri, 29 Oct 2021 00:15:31 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alexey Baturo <baturo.alexey@gmail.com>,
 Alexey Baturo <space.monkey.delivers@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 12/18] target/riscv: Support pointer masking for RISC-V for
 i/c/f/d/a types of instructions
Date: Fri, 29 Oct 2021 17:08:11 +1000
Message-Id: <20211029070817.100529-13-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
References: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=929275e61=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, GAPPY_SUBJECT=0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

From: Alexey Baturo <baturo.alexey@gmail.com>

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20211025173609.2724490-7-space.monkey.delivers@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c                | 8 ++++++++
 target/riscv/insn_trans/trans_rva.c.inc | 3 +++
 target/riscv/insn_trans/trans_rvd.c.inc | 2 ++
 target/riscv/insn_trans/trans_rvf.c.inc | 2 ++
 target/riscv/insn_trans/trans_rvi.c.inc | 2 ++
 5 files changed, 17 insertions(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d38f87d718..a5e6fa145d 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -271,6 +271,14 @@ static void gen_jal(DisasContext *ctx, int rd, targe=
t_ulong imm)
     ctx->base.is_jmp =3D DISAS_NORETURN;
 }
=20
+/*
+ * Temp stub: generates address adjustment for PointerMasking
+ */
+static TCGv gen_pm_adjust_address(DisasContext *s, TCGv src)
+{
+    return src;
+}
+
 #ifndef CONFIG_USER_ONLY
 /* The states of mstatus_fs are:
  * 0 =3D disabled, 1 =3D initial, 2 =3D clean, 3 =3D dirty
diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_=
trans/trans_rva.c.inc
index 6ea07d89b0..40fe132b04 100644
--- a/target/riscv/insn_trans/trans_rva.c.inc
+++ b/target/riscv/insn_trans/trans_rva.c.inc
@@ -25,6 +25,7 @@ static bool gen_lr(DisasContext *ctx, arg_atomic *a, Me=
mOp mop)
     if (a->rl) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
     }
+    src1 =3D gen_pm_adjust_address(ctx, src1);
     tcg_gen_qemu_ld_tl(load_val, src1, ctx->mem_idx, mop);
     if (a->aq) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
@@ -44,6 +45,7 @@ static bool gen_sc(DisasContext *ctx, arg_atomic *a, Me=
mOp mop)
     TCGLabel *l2 =3D gen_new_label();
=20
     src1 =3D get_gpr(ctx, a->rs1, EXT_ZERO);
+    src1 =3D gen_pm_adjust_address(ctx, src1);
     tcg_gen_brcond_tl(TCG_COND_NE, load_res, src1, l1);
=20
     /*
@@ -84,6 +86,7 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
     TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_NONE);
     TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
=20
+    src1 =3D gen_pm_adjust_address(ctx, src1);
     func(dest, src1, src2, ctx->mem_idx, mop);
=20
     gen_set_gpr(ctx, a->rd, dest);
diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_=
trans/trans_rvd.c.inc
index db9ae15755..64fb0046f7 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -31,6 +31,7 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr =3D temp;
     }
+    addr =3D gen_pm_adjust_address(ctx, addr);
=20
     tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], addr, ctx->mem_idx, MO_TEQ);
=20
@@ -51,6 +52,7 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr =3D temp;
     }
+    addr =3D gen_pm_adjust_address(ctx, addr);
=20
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEQ);
=20
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_=
trans/trans_rvf.c.inc
index bddbd418d9..b5459249c4 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -37,6 +37,7 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr =3D temp;
     }
+    addr =3D gen_pm_adjust_address(ctx, addr);
=20
     dest =3D cpu_fpr[a->rd];
     tcg_gen_qemu_ld_i64(dest, addr, ctx->mem_idx, MO_TEUL);
@@ -59,6 +60,7 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr =3D temp;
     }
+    addr =3D gen_pm_adjust_address(ctx, addr);
=20
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEUL);
=20
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
index 91dc438a3a..e51dbc41c5 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -144,6 +144,7 @@ static bool gen_load(DisasContext *ctx, arg_lb *a, Me=
mOp memop)
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr =3D temp;
     }
+    addr =3D gen_pm_adjust_address(ctx, addr);
=20
     tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, memop);
     gen_set_gpr(ctx, a->rd, dest);
@@ -185,6 +186,7 @@ static bool gen_store(DisasContext *ctx, arg_sb *a, M=
emOp memop)
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr =3D temp;
     }
+    addr =3D gen_pm_adjust_address(ctx, addr);
=20
     tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
     return true;
--=20
2.31.1


