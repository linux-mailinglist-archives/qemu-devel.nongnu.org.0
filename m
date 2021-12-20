Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 800E347A42C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:01:52 +0100 (CET)
Received: from localhost ([::1]:60074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzAo1-0001xT-Vh
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:01:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAjo-0007hQ-7p
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:57:28 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:50595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAjk-0007zs-1p
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:57:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976244; x=1671512244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=46nYlQoJ0nKPn7GVOEd9Ogper9HVTEjryOF9Cs9xSXE=;
 b=DO5jwuhyeH/H3REb3Dta6BtRdIAZGCNSygvrBwiSfrSY0wm6GO9WA2Yc
 5EGcnKWCh0h+QCswjTs6WaTq7GViv8YXxgTDd1khbDgw/S8Bsx1xZw/QO
 ut+7sGdjvbxGy58r0rPo3OHAOZ6+tWiVqL/ulDGuZF5OChgZKe7i/+4An
 FQMRDGAyoLjzMPC3nKagU2S14666olumidemACDtq/bH2pP3YddcGg4F2
 EGE39HhKaePk5Oala1Z6LMm45EAQeqHIVv09bzS+lXWZfph0X/6AB5oI4
 jjtoahW9gNkfFgNAlIMHyJfwZL5aBCywD0l/BZs+YySOS9TOvu5Q+V5e9 A==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189679934"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:57:22 +0800
IronPort-SDR: HyQnOgh7QvcqB9Bj24HZLzHrCExVObSjKxQGxV3iAXfYFW8LP27wcynC2u5hewkhcJi/vnPXUR
 th+ehiMZy6pg/1x1nYkJG5ucVJAmls7Cy3ch+yk2E8ln0rLoEG0jq/fMz0OLYN7nIjLn5qVC8n
 uHXkl9Fa9kaV9dzD+3uUunXoraoCw7plk7bB+S7R8MgwvompcpzbBvaFR5LTyWwukXVYJYLtBy
 oXGyIsBlgwD1UpY72r+tSuilFcmGiZsYAtwKak51M/C3Po9pd8toI1mHST7Jv5LIend/2wjjC5
 jNXWjxyR6BM1t5DjN8fhXvEj
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:31:38 -0800
IronPort-SDR: 6/6U6SlZcOyDf/9DvPYqEk9VZPQc+EjPypaY2botMZm7J5yjWD+FP8LyqJKPfZwrCUE3LybslJ
 /TF9wiGZe4nUKp4JLP0gkMWG7Jduz8rWSeJ1GHDmM3PQlb12ATF74Qe3ZtHR1tzRcRP7elIj40
 KNk4E6JSe4SZNzm8taKQFKpuQoHcKt7r35/BSFo3GTRom73v9TcgqrdjcyrUhv3xcynWduxXTm
 +mkKpn6Af69zQTvFg1dkdM6LoHCwrmWEchp9B651Xs1RJCFyXhBxrbz3TeuEwXRS7dejFzz5sJ
 bH0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:57:23 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS4d69Qcz1Rvlf
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:57:21 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976240; x=1642568241; bh=46nYlQoJ0nKPn7GVOE
 d9Ogper9HVTEjryOF9Cs9xSXE=; b=PPIakUx83plqmZI3HI7uJzIkSXnr6XsO25
 XoUmBIRj7wk9TBXR1YiGwU0wOSiNKQXfY7ohNQAUCn9GUckcqcxuxEUUlSIvKFI0
 yaynqlPQnUzcApHr2IJ6Tmt/zhzSusOLvkSNrQ8W/6spoqcGThHuGZNuaTOqTs5X
 FEwUh9QnWsO0kKbCaS4TMLuPq9bjLrYcNEo6b3w9ly031+6tnw5fZVsleAeUJ70q
 VswynfGKSB0WG2jPLP07fmfMbMO2tHGS2PhUvWsO6CTAe5uYK+xrQerZYZtGVe8b
 QIKBZfVVfWl09atm3VX/P2W0pwy0PvRfKpbDOXzdbP9Uyj+FnxtQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id q5mmy5krDPYU for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:57:20 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS4X1HHFz1RvTg;
 Sun, 19 Dec 2021 20:57:15 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Kito Cheng <kito.cheng@sifive.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 01/88] target/riscv: zfh: half-precision load and store
Date: Mon, 20 Dec 2021 14:55:38 +1000
Message-Id: <20211220045705.62174-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20211210074329.5775-2-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                        |  1 +
 target/riscv/insn32.decode                |  4 ++
 target/riscv/translate.c                  |  8 +++
 target/riscv/insn_trans/trans_rvzfh.c.inc | 65 +++++++++++++++++++++++
 4 files changed, 78 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzfh.c.inc

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0760c0af93..570c49f365 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -312,6 +312,7 @@ struct RISCVCPU {
         bool ext_counters;
         bool ext_ifencei;
         bool ext_icsr;
+        bool ext_zfh;
=20
         char *priv_spec;
         char *user_spec;
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 2f251dac1b..b36a3d8dbf 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -726,3 +726,7 @@ binv       0110100 .......... 001 ..... 0110011 @r
 binvi      01101. ........... 001 ..... 0010011 @sh
 bset       0010100 .......... 001 ..... 0110011 @r
 bseti      00101. ........... 001 ..... 0010011 @sh
+
+# *** RV32 Zfh Extension ***
+flh        ............   ..... 001 ..... 0000111 @i
+fsh        .......  ..... ..... 001 ..... 0100111 @s
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 1d57bc97b5..bea87b31b5 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -73,6 +73,7 @@ typedef struct DisasContext {
     RISCVMXL ol;
     bool virt_enabled;
     bool ext_ifencei;
+    bool ext_zfh;
     bool hlsx;
     /* vector extension */
     bool vill;
@@ -134,6 +135,11 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
     tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(32, 32));
 }
=20
+static void gen_nanbox_h(TCGv_i64 out, TCGv_i64 in)
+{
+    tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(16, 48));
+}
+
 /*
  * A narrow n-bit operation, where n < FLEN, checks that input operands
  * are correctly Nan-boxed, i.e., all upper FLEN - n bits are 1.
@@ -574,6 +580,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, t=
arget_ulong pc)
 #include "insn_trans/trans_rvh.c.inc"
 #include "insn_trans/trans_rvv.c.inc"
 #include "insn_trans/trans_rvb.c.inc"
+#include "insn_trans/trans_rvzfh.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
=20
 /* Include the auto-generated decoder for 16 bit insn */
@@ -626,6 +633,7 @@ static void riscv_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
     ctx->misa_ext =3D env->misa_ext;
     ctx->frm =3D -1;  /* unknown rounding mode */
     ctx->ext_ifencei =3D cpu->cfg.ext_ifencei;
+    ctx->ext_zfh =3D cpu->cfg.ext_zfh;
     ctx->vlen =3D cpu->cfg.vlen;
     ctx->mstatus_hs_fs =3D FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS)=
;
     ctx->hlsx =3D FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/ins=
n_trans/trans_rvzfh.c.inc
new file mode 100644
index 0000000000..dad1d703d7
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -0,0 +1,65 @@
+/*
+ * RISC-V translation routines for the RV64Zfh Standard Extension.
+ *
+ * Copyright (c) 2020 Chih-Min Chao, chihmin.chao@sifive.com
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
+#define REQUIRE_ZFH(ctx) do { \
+    if (!ctx->ext_zfh) {      \
+        return false;         \
+    }                         \
+} while (0)
+
+static bool trans_flh(DisasContext *ctx, arg_flh *a)
+{
+    TCGv_i64 dest;
+    TCGv t0;
+
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    t0 =3D get_gpr(ctx, a->rs1, EXT_NONE);
+    if (a->imm) {
+        TCGv temp =3D temp_new(ctx);
+        tcg_gen_addi_tl(temp, t0, a->imm);
+        t0 =3D temp;
+    }
+
+    dest =3D cpu_fpr[a->rd];
+    tcg_gen_qemu_ld_i64(dest, t0, ctx->mem_idx, MO_TEUW);
+    gen_nanbox_h(dest, dest);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
+{
+    TCGv t0;
+
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    t0 =3D get_gpr(ctx, a->rs1, EXT_NONE);
+    if (a->imm) {
+        TCGv temp =3D tcg_temp_new();
+        tcg_gen_addi_tl(temp, t0, a->imm);
+        t0 =3D temp;
+    }
+
+    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEUW);
+
+    return true;
+}
--=20
2.31.1


