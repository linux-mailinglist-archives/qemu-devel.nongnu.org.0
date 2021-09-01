Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 325343FD14C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:26:42 +0200 (CEST)
Received: from localhost ([::1]:57250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLFxP-00059M-5e
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFjD-0006aO-Ma
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:11:51 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:34281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFj9-0008Vd-HB
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:11:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462308; x=1661998308;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I0syDRJtV2wn16n8wBMLqUksv37eMsmpSz/469s9+9A=;
 b=dLnbRuslEOJf41vd5DDmRKYCYgS3cyjniXa3Td1tuQDeVG3WGvuzKG/o
 dYJa+VsqBWMd8Tq4aCzdHyJtGDNb5X1JxAy895ERoPmCEhXr8JStEplmj
 dbx40M2/05NMSFPUpIgtjiTAcZUrU2oOKTxYGL0qyyrEWOCmv+ReVtUJP
 zv4fBH7CwZwoV8TwQDgOnZdHmNIheGjBwOl4nYxqdMDBJGb/7mmeFTYYR
 D3Pig2gUtHcqctmYloRWPVHqSrr5kBFV60R72La3P0q0d7evBhB/VVyLu
 kGkXzaX/Cz0fKa1ZdYkbEhot+pQB8Eysbw1wrBSFmgMoeBV4pZGJ75LF4 w==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="179452404"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:11:30 +0800
IronPort-SDR: exhL6G8o6U0CVu3JknEe5oE2qNtTs3c+cITiKH49oFerK8grxZuvk35ehXd4gxpzBzxPG7mEig
 gbGClbcvfqbhkEjk740KRTAnZ8XVv/GGBTUkzMpf0+y+l8grpHF3AVjnLDMnexmflxmmIXUufS
 r9wpr/ZpxHG1mkipGXKQnLnsx7KnAww6mLrD06ckVTtGqnKUSbSia37YcExsTVprN0Pa4+69T4
 dMY3m2J6jEqG96ZvZnULbTFa6/EAEnhu692GLyYCnZrBlCeuBAgH5s1kLMm8iiG0gRPXhla+qp
 PVVo+wUx5hSYy+BdBvGGrOAK
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:46:36 -0700
IronPort-SDR: k7LdePXGTdzqEEIH2Nb3QxjPfTZSZ2jefJGh87fKIpb+SH7qYuAO+JAjFeOI/+OuMaETGnwdpo
 DtsrHxIFCz6pHdGyLhiCy42mV5y6UeME80lx1IyRgajHVI4YK+UXhdynfAFvnT7aie47G4wbcZ
 yHFWqUavJyMPwTNYENBkExJcjNTHsi5mnHcc0M3YXqAtCDUZ9okDhG7fnFVkhaQlHwYgvBAv+a
 8UV5RsfSJIt6w6fsC9IWgECIQTL2I4EAmxaTF6DEd+f2WI5uZ5rJ4U2+qLby30YBkJ/InNAoXk
 hlA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:11:30 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Gznc22s2Cz1RvlY
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:11:30 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630462289; x=1633054290; bh=I0syDRJtV2wn16n8wB
 MLqUksv37eMsmpSz/469s9+9A=; b=SmO1eJaijaBsGRjdjigK5Y0IlOVDG05/pn
 zL6cA6w1jKnaVZC58bc2CnNtiG1AQsxXshZ9qweOCnMsZgSmcBiD3QbgXiddsxb5
 7OSB8hBxKK9mBnEjITYigWuq8DF4hvq5EQX40z1VTyHWxjGfN5wNORPm2HGZF2Bs
 7wscUmauc96mfPXrKv+H7SkPPJaUVtR6QjG+ZK72zyVTlPJKCvwX5szGPwpoipyF
 xUQKnWpAn2rc8KZO4dNVoq9lP7xkc9iR5mt/d6ILa/POLd/vd2ZzZkM8ImQFfzYT
 II6Apo30c71QJGG9SGN42N0E4q2MmZ8nBVM4YUaFGT6nWsiGvVUw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id oykBLk7MnniN for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:11:29 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Gznbx1xynz1Rvl9;
 Tue, 31 Aug 2021 19:11:24 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 14/33] target/riscv: Introduce DisasExtend and new helpers
Date: Wed,  1 Sep 2021 12:09:39 +1000
Message-Id: <20210901020958.458454-15-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=871df42ed=alistair.francis@opensource.wdc.com;
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

From: Richard Henderson <richard.henderson@linaro.org>

Introduce get_gpr, dest_gpr, temp_new -- new helpers that do not force
tcg globals into temps, returning a constant 0 for $zero as source and
a new temp for $zero as destination.

Introduce ctx->w for simplifying word operations, such as addw.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210823195529.560295-6-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 97 +++++++++++++++++++++++++++++++++-------
 1 file changed, 81 insertions(+), 16 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index ce4c56c179..d7552dc377 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -39,15 +39,25 @@ static TCGv load_val;
=20
 #include "exec/gen-icount.h"
=20
+/*
+ * If an operation is being performed on less than TARGET_LONG_BITS,
+ * it may require the inputs to be sign- or zero-extended; which will
+ * depend on the exact operation being performed.
+ */
+typedef enum {
+    EXT_NONE,
+    EXT_SIGN,
+    EXT_ZERO,
+} DisasExtend;
+
 typedef struct DisasContext {
     DisasContextBase base;
     /* pc_succ_insn points to the instruction following base.pc_next */
     target_ulong pc_succ_insn;
     target_ulong priv_ver;
-    bool virt_enabled;
+    target_ulong misa;
     uint32_t opcode;
     uint32_t mstatus_fs;
-    target_ulong misa;
     uint32_t mem_idx;
     /* Remember the rounding mode encoded in the previous fp instruction=
,
        which we have already installed into env->fp_status.  Or -1 for
@@ -55,6 +65,8 @@ typedef struct DisasContext {
        to any system register, which includes CSR_FRM, so we do not have
        to reset this known value.  */
     int frm;
+    bool w;
+    bool virt_enabled;
     bool ext_ifencei;
     bool hlsx;
     /* vector extension */
@@ -64,7 +76,11 @@ typedef struct DisasContext {
     uint16_t vlen;
     uint16_t mlen;
     bool vl_eq_vlmax;
+    uint8_t ntemp;
     CPUState *cs;
+    TCGv zero;
+    /* Space for 3 operands plus 1 extra for address computation. */
+    TCGv temp[4];
 } DisasContext;
=20
 static inline bool has_ext(DisasContext *ctx, uint32_t ext)
@@ -172,27 +188,64 @@ static void gen_goto_tb(DisasContext *ctx, int n, t=
arget_ulong dest)
     }
 }
=20
-/* Wrapper for getting reg values - need to check of reg is zero since
- * cpu_gpr[0] is not actually allocated
+/*
+ * Wrappers for getting reg values.
+ *
+ * The $zero register does not have cpu_gpr[0] allocated -- we supply th=
e
+ * constant zero as a source, and an uninitialized sink as destination.
+ *
+ * Further, we may provide an extension for word operations.
  */
-static void gen_get_gpr(DisasContext *ctx, TCGv t, int reg_num)
+static TCGv temp_new(DisasContext *ctx)
+{
+    assert(ctx->ntemp < ARRAY_SIZE(ctx->temp));
+    return ctx->temp[ctx->ntemp++] =3D tcg_temp_new();
+}
+
+static TCGv get_gpr(DisasContext *ctx, int reg_num, DisasExtend ext)
 {
+    TCGv t;
+
     if (reg_num =3D=3D 0) {
-        tcg_gen_movi_tl(t, 0);
-    } else {
-        tcg_gen_mov_tl(t, cpu_gpr[reg_num]);
+        return ctx->zero;
     }
+
+    switch (ctx->w ? ext : EXT_NONE) {
+    case EXT_NONE:
+        return cpu_gpr[reg_num];
+    case EXT_SIGN:
+        t =3D temp_new(ctx);
+        tcg_gen_ext32s_tl(t, cpu_gpr[reg_num]);
+        return t;
+    case EXT_ZERO:
+        t =3D temp_new(ctx);
+        tcg_gen_ext32u_tl(t, cpu_gpr[reg_num]);
+        return t;
+    }
+    g_assert_not_reached();
 }
=20
-/* Wrapper for setting reg values - need to check of reg is zero since
- * cpu_gpr[0] is not actually allocated. this is more for safety purpose=
s,
- * since we usually avoid calling the OP_TYPE_gen function if we see a w=
rite to
- * $zero
- */
-static void gen_set_gpr(DisasContext *ctx, int reg_num_dst, TCGv t)
+static void gen_get_gpr(DisasContext *ctx, TCGv t, int reg_num)
+{
+    tcg_gen_mov_tl(t, get_gpr(ctx, reg_num, EXT_NONE));
+}
+
+static TCGv __attribute__((unused)) dest_gpr(DisasContext *ctx, int reg_=
num)
+{
+    if (reg_num =3D=3D 0 || ctx->w) {
+        return temp_new(ctx);
+    }
+    return cpu_gpr[reg_num];
+}
+
+static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
 {
-    if (reg_num_dst !=3D 0) {
-        tcg_gen_mov_tl(cpu_gpr[reg_num_dst], t);
+    if (reg_num !=3D 0) {
+        if (ctx->w) {
+            tcg_gen_ext32s_tl(cpu_gpr[reg_num], t);
+        } else {
+            tcg_gen_mov_tl(cpu_gpr[reg_num], t);
+        }
     }
 }
=20
@@ -940,6 +993,11 @@ static void riscv_tr_init_disas_context(DisasContext=
Base *dcbase, CPUState *cs)
     ctx->mlen =3D 1 << (ctx->sew  + 3 - ctx->lmul);
     ctx->vl_eq_vlmax =3D FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
     ctx->cs =3D cs;
+    ctx->w =3D false;
+    ctx->ntemp =3D 0;
+    memset(ctx->temp, 0, sizeof(ctx->temp));
+
+    ctx->zero =3D tcg_constant_tl(0);
 }
=20
 static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
@@ -961,6 +1019,13 @@ static void riscv_tr_translate_insn(DisasContextBas=
e *dcbase, CPUState *cpu)
=20
     decode_opc(env, ctx, opcode16);
     ctx->base.pc_next =3D ctx->pc_succ_insn;
+    ctx->w =3D false;
+
+    for (int i =3D ctx->ntemp - 1; i >=3D 0; --i) {
+        tcg_temp_free(ctx->temp[i]);
+        ctx->temp[i] =3D NULL;
+    }
+    ctx->ntemp =3D 0;
=20
     if (ctx->base.is_jmp =3D=3D DISAS_NEXT) {
         target_ulong page_start;
--=20
2.31.1


