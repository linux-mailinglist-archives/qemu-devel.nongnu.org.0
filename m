Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90697495BF6
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 09:33:06 +0100 (CET)
Received: from localhost ([::1]:49978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nApM0-0000jc-N7
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 03:33:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0k-0008VI-76
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:58 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0i-0004AK-1s
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744976; x=1674280976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N07AWP0wS69Tj0dLOFghNA6awyxx5Kz0GBENA1qs9bg=;
 b=qRVdGMbMlp/Q08+w7Cgg+9zG5zp4v+AqlFzVKeAdhDvvTZkDwHq4frtr
 SeMJvu5cZriPHKtxhngrr8TliPd1x2xVIka7oCCdwmQRn1NS86bM9y3wj
 MF9W1wh83CLEyJOO9fwuYnnZ7TYLl17CW3gjQ7v+6IAZ5c+MqXFRGqIwG
 jrXmvGC7bTALpQwGEUDslaWLYEfKXRLCynahg9a3Ckb7ag8/3ezVoCj0H
 tBQerp7ZIW5RXcEVXQpmEihzFdsZjjG477IpIp4zOCpoIPPB3dpRAi9+v
 HjalHl6VQGZt6aAqMijqjEfJwrzNp3OlfeTPGiWVvmczi9AoscMh9otlu Q==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295083058"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:01:37 +0800
IronPort-SDR: zI7UcqB+vtOULPYlzaP3vkNTKGZlmMZlG/OBQsYpeNF6LYKNP5q2TGGapgE70i1zlgFCasz5WI
 nc6aIF33ed/lDRCAPCZiu4aUqSOyVO8t5Ys13zQYs9OI0pWGc3ukY3JEIIhJ/qgVfqge3oE9Cy
 AZM5flvoTxHtJc4x5WprshVLc+0zeena5KFNqzCOkzw2WCC4llpJ+99/DLl4TWm4GXeFcMjkNV
 c3TDeWOYq4jRe9RjilTVnQh+iknuEKTl4NkNc8MF/o4klLCOHZrLi5ayMh4yKwQ1bdpWc/E558
 XXypAE1+z1O3LQNB6B+vJ3jY
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:35:05 -0800
IronPort-SDR: 6uygw3xQsP6OndpyU4yrMrloYmBgscuhwCL0+IjfL8aGxsP9iq1JjDSYRut3s/2cq25TKwVMNY
 1JxETkx2n1QpMP1fMg15LSQ9dd8LN457m78K2ojYSoDBQJIPLZg1jPL+fDEczZAw8FE/zmzapI
 MTFPizVtgasuxJ3TeYp4F/dHH+xNQ1htkXIJ4C46cQtaP+ro2E2Nx0AN4BpJeSwSMahhsBO3gt
 1p9TOMJ/MWOeYIhv10nkC4IqST8KAuFIj2PipWDY+GlQLg9h6gnxDCwXhxH1HosPxp8UgjBwh8
 PG4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:01:37 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg801391bz1SVny
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:01:37 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744896; x=1645336897; bh=N07AWP0wS69Tj0dLOF
 ghNA6awyxx5Kz0GBENA1qs9bg=; b=biWknnm54kQTjFyGZs53YLGUrdzTN9cdC6
 aOfcK6EDIDHgujQUyyOgM3ZhWkzUf/OhDAhL9nA67LqW2e3tq0Rh+0ShBScMPdF3
 BYXODAsM6tGsIQsy/z06HE2IxZ0/iAPEUQYCNvG6btnV5KmArzhbc61BXLMNK6eX
 Q2EREHQ+b0uoUjBFUC1g64b9eRm+5Mztyw3oOy0X8j/LE97OHOvcl/PGyFe50jIn
 1kSyiNfVy2dVDdi0GWsLjZUpXO5bNRIlOxSrsrSf0ruaeJb5cLnO5BEF4kkSCizC
 Zvf8C+f15flWjdqg1GT1aTFwaSuZz8R0KwrY4Deqeo4HZMgeACaw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id UrlXZkkKdIKe for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:01:36 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7zx5LN7z1RvlN;
 Thu, 20 Jan 2022 22:01:33 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 42/61] target/riscv: Sign extend pc for different XLEN
Date: Fri, 21 Jan 2022 15:58:11 +1000
Message-Id: <20220121055830.3164408-43-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

When pc is written, it is sign-extended to fill the widest supported XLEN=
.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220120122050.41546-5-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c                      | 25 ++++++++++++++++---
 .../riscv/insn_trans/trans_privileged.c.inc   |  2 +-
 target/riscv/insn_trans/trans_rvi.c.inc       |  5 ++--
 target/riscv/insn_trans/trans_rvv.c.inc       |  4 +--
 4 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 30c0e28778..2a88bd99dc 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -193,16 +193,33 @@ static void gen_check_nanbox_s(TCGv_i64 out, TCGv_i=
64 in)
     tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in, t_nan);
 }
=20
+static void gen_set_pc_imm(DisasContext *ctx, target_ulong dest)
+{
+    if (get_xl(ctx) =3D=3D MXL_RV32) {
+        dest =3D (int32_t)dest;
+    }
+    tcg_gen_movi_tl(cpu_pc, dest);
+}
+
+static void gen_set_pc(DisasContext *ctx, TCGv dest)
+{
+    if (get_xl(ctx) =3D=3D MXL_RV32) {
+        tcg_gen_ext32s_tl(cpu_pc, dest);
+    } else {
+        tcg_gen_mov_tl(cpu_pc, dest);
+    }
+}
+
 static void generate_exception(DisasContext *ctx, int excp)
 {
-    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
+    gen_set_pc_imm(ctx, ctx->base.pc_next);
     gen_helper_raise_exception(cpu_env, tcg_constant_i32(excp));
     ctx->base.is_jmp =3D DISAS_NORETURN;
 }
=20
 static void generate_exception_mtval(DisasContext *ctx, int excp)
 {
-    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
+    gen_set_pc_imm(ctx, ctx->base.pc_next);
     tcg_gen_st_tl(cpu_pc, cpu_env, offsetof(CPURISCVState, badaddr));
     gen_helper_raise_exception(cpu_env, tcg_constant_i32(excp));
     ctx->base.is_jmp =3D DISAS_NORETURN;
@@ -225,10 +242,10 @@ static void gen_goto_tb(DisasContext *ctx, int n, t=
arget_ulong dest)
 {
     if (translator_use_goto_tb(&ctx->base, dest)) {
         tcg_gen_goto_tb(n);
-        tcg_gen_movi_tl(cpu_pc, dest);
+        gen_set_pc_imm(ctx, dest);
         tcg_gen_exit_tb(ctx->base.tb, n);
     } else {
-        tcg_gen_movi_tl(cpu_pc, dest);
+        gen_set_pc_imm(ctx, dest);
         tcg_gen_lookup_and_goto_ptr();
     }
 }
diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/risc=
v/insn_trans/trans_privileged.c.inc
index 6077bbbf11..53613682e8 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -102,7 +102,7 @@ static bool trans_mret(DisasContext *ctx, arg_mret *a=
)
 static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
 {
 #ifndef CONFIG_USER_ONLY
-    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
+    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
     gen_helper_wfi(cpu_env);
     return true;
 #else
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
index b9ba57f266..04d3ea237f 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -59,6 +59,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
     tcg_gen_addi_tl(cpu_pc, get_gpr(ctx, a->rs1, EXT_NONE), a->imm);
     tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
=20
+    gen_set_pc(ctx, cpu_pc);
     if (!has_ext(ctx, RVC)) {
         TCGv t0 =3D tcg_temp_new();
=20
@@ -827,7 +828,7 @@ static bool trans_fence_i(DisasContext *ctx, arg_fenc=
e_i *a)
      * FENCE_I is a no-op in QEMU,
      * however we need to end the translation block
      */
-    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
+    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
     tcg_gen_exit_tb(NULL, 0);
     ctx->base.is_jmp =3D DISAS_NORETURN;
     return true;
@@ -836,7 +837,7 @@ static bool trans_fence_i(DisasContext *ctx, arg_fenc=
e_i *a)
 static bool do_csr_post(DisasContext *ctx)
 {
     /* We may have changed important cpu state -- exit to main loop. */
-    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
+    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
     tcg_gen_exit_tb(NULL, 0);
     ctx->base.is_jmp =3D DISAS_NORETURN;
     return true;
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 7a040b3089..e03959c46f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -194,7 +194,7 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs=
1, TCGv s2)
     gen_set_gpr(s, rd, dst);
     mark_vs_dirty(s);
=20
-    tcg_gen_movi_tl(cpu_pc, s->pc_succ_insn);
+    gen_set_pc_imm(s, s->pc_succ_insn);
     tcg_gen_lookup_and_goto_ptr();
     s->base.is_jmp =3D DISAS_NORETURN;
=20
@@ -219,7 +219,7 @@ static bool do_vsetivli(DisasContext *s, int rd, TCGv=
 s1, TCGv s2)
     gen_helper_vsetvl(dst, cpu_env, s1, s2);
     gen_set_gpr(s, rd, dst);
     mark_vs_dirty(s);
-    tcg_gen_movi_tl(cpu_pc, s->pc_succ_insn);
+    gen_set_pc_imm(s, s->pc_succ_insn);
     tcg_gen_lookup_and_goto_ptr();
     s->base.is_jmp =3D DISAS_NORETURN;
=20
--=20
2.31.1


