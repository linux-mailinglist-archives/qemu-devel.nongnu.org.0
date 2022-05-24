Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E835333B0
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 00:53:05 +0200 (CEST)
Received: from localhost ([::1]:54774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntdOi-0001em-DL
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 18:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdHc-0000Mf-I7
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:45:44 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:62510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdHa-0002sH-5D
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:45:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653432341; x=1684968341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=97ze1V/foFHLxGP9QD0ydPibxN4CgnPuVY9vtotPoGE=;
 b=I9IMPZ/ZxN+Rd23tGnO5vxeYQpyySAGHdlHvUZqc9q2s/kbqUj5mnb+k
 r63VFN7taWH8aZ/bG5u3sHkRREZu/veeb1MN3yd16SuDBgEKhrtr9Pe2n
 OTpjEk1CqVb6MbC+jHOwwYGvfM4Xvv2DEhZCRt6YqjEGr56rzgjHgHp7h
 wHJNTclza5l55lnMTqX+fTZf/pwhPs2upt8RJqUWmdJJKLRcxCGUvExuI
 How9LhDpSziWbPdsXApZU3rRkwZV544huXZZw+F3aHR43LTbo2bOkw/RP
 blUPt4Y2adT6O7ARA7DFEb+aoQCg3iEGlJgyNTO59vKd0EMVOO1hsW7e4 A==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305566708"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 06:45:25 +0800
IronPort-SDR: v/XHwLFV/FhW76V51EEYZe85pCovulVm8AnceKzOLKza9dW4Ozk9Rd65DkmaHorNhmkuC1ykHY
 2iCY9cS8D2LMq/O/N0eYmf1N99Ch0IiHIsK/WljDbo66OHhU5WhnB1EoaLa8AYTPoYJUbY9KNW
 0DzUV8+4EsZxlRTf4/WMJnssBr7uHv5HcjTLV0U9x9QHmRSJZDZvN+0JbbN6Sl7p3YIEM9YvCp
 pKyfpSDbxe+HyhHQN2FMIEH4gy5ig1ror1KvXy8vgTy1zQ6hV+8cfZBZ4b3ndKNnsaqHESmOMe
 IDY8lLkNAZsm2uwnnvn2elNR
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:04:57 -0700
IronPort-SDR: GDb0xU6JrraJxnNZZVyPJgzXmgTl/K/FSTIu6vf9FHjk791J9zp5JjTVwPzDXJsmYDmQGYkkwI
 qaqatjs2PDtH76g/cDW+bRhOYzWywJSKuupSQY+rlGSlPdhLLo6FYXAHpOFzsL+aFj9SMRWGvQ
 7kOlFp+0sWVFSQGcAlAopy0P5HKg0lF119sX1WUnSK8qHA7EJjPVzozbdkDynDDJO6V1omm6R8
 3Wyi8iI0JEyAy9nIx5I3cdxFFuBRSCDbyUZC1MYoy9Vni9VxKHAcuj2CpsA/3vudObpDs6e0vj
 oZQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:45:26 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L78RT4ZPCz1Rwrw
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:45:25 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1653432325; x=1656024326; bh=97ze1V/foFHLxGP9QD
 0ydPibxN4CgnPuVY9vtotPoGE=; b=AlWG+qDRptBE0Vq8L1rmd0Rdan7NTO8EW5
 aL8BLfN01zrq8rzYMjcTbh07vMEYHETI+tJEy7YAn+0LW15ElFTqhDU8QzFU6ONf
 YTRxScNqGQkiuaV7GgasuVHZysk/w0ZovM8xwrVhnbgEInoIUC5rbfyqYLbK1DWe
 r1YJVlQzmnuoQyg/wlBYnLmj5zIQKZPpvTFZ80IXrcDBgO6uPsGH7r/IdgauFUVs
 O/c/7zGWAYRy6I5jEas5yl6Bzjt52jVRrXIJKjiptd/rb4OivZGw9/o2nEkytLki
 0ISe3zfHW8xX+tNDix8cSPDJ5Y414lhGlOg54WRvIx7+/zrpUwuw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id J345bUTKQk3f for <qemu-devel@nongnu.org>;
 Tue, 24 May 2022 15:45:25 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.5])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L78RR0J3qz1Rvlc;
 Tue, 24 May 2022 15:45:22 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <apatel@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 19/23] target/riscv: Set [m|s]tval for both illegal and virtual
 instruction traps
Date: Wed, 25 May 2022 08:44:24 +1000
Message-Id: <20220524224428.552334-20-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
References: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1363756b6=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: Anup Patel <apatel@ventanamicro.com>

Currently, the [m|s]tval CSRs are set with trapping instruction encoding
only for illegal instruction traps taken at the time of instruction
decoding.

In RISC-V world, a valid instructions might also trap as illegal or
virtual instruction based to trapping bits in various CSRs (such as
mstatus.TVM or hstatus.VTVM).

We improve setting of [m|s]tval CSRs for all types of illegal and
virtual instruction traps.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220511144528.393530-4-apatel@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        |  8 +++++++-
 target/riscv/cpu.c        |  2 ++
 target/riscv/cpu_helper.c |  1 +
 target/riscv/translate.c  | 17 +++++++++++++----
 4 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 44975e3e5a..f08c3e8813 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -30,6 +30,12 @@
=20
 #define TCG_GUEST_DEFAULT_MO 0
=20
+/*
+ * RISC-V-specific extra insn start words:
+ * 1: Original instruction opcode
+ */
+#define TARGET_INSN_START_EXTRA_WORDS 1
+
 #define TYPE_RISCV_CPU "riscv-cpu"
=20
 #define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
@@ -140,7 +146,7 @@ struct CPUArchState {
     target_ulong frm;
=20
     target_ulong badaddr;
-    uint32_t bins;
+    target_ulong bins;
=20
     target_ulong guest_phys_fault_addr;
=20
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fe8ceb4133..ce1c257eef 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -406,6 +406,7 @@ void restore_state_to_opc(CPURISCVState *env, Transla=
tionBlock *tb,
     } else {
         env->pc =3D data[0];
     }
+    env->bins =3D data[1];
 }
=20
 static void riscv_cpu_reset(DeviceState *dev)
@@ -445,6 +446,7 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->mcause =3D 0;
     env->miclaim =3D MIP_SGEIP;
     env->pc =3D env->resetvec;
+    env->bins =3D 0;
     env->two_stage_lookup =3D false;
=20
     /* Initialized default priorities of local interrupts. */
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index b16bfe0182..d99fac9d2d 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1371,6 +1371,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
             tval =3D env->badaddr;
             break;
         case RISCV_EXCP_ILLEGAL_INST:
+        case RISCV_EXCP_VIRT_INSTRUCTION_FAULT:
             tval =3D env->bins;
             break;
         default:
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0cd1d9ee94..55a4713af2 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -107,6 +107,8 @@ typedef struct DisasContext {
     /* PointerMasking extension */
     bool pm_mask_enabled;
     bool pm_base_enabled;
+    /* TCG of the current insn_start */
+    TCGOp *insn_start;
 } DisasContext;
=20
 static inline bool has_ext(DisasContext *ctx, uint32_t ext)
@@ -236,9 +238,6 @@ static void generate_exception_mtval(DisasContext *ct=
x, int excp)
=20
 static void gen_exception_illegal(DisasContext *ctx)
 {
-    tcg_gen_st_i32(tcg_constant_i32(ctx->opcode), cpu_env,
-                   offsetof(CPURISCVState, bins));
-
     generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
 }
=20
@@ -1017,6 +1016,13 @@ static uint32_t opcode_at(DisasContextBase *dcbase=
, target_ulong pc)
 /* Include decoders for factored-out extensions */
 #include "decode-XVentanaCondOps.c.inc"
=20
+static inline void decode_save_opc(DisasContext *ctx, target_ulong opc)
+{
+    assert(ctx->insn_start !=3D NULL);
+    tcg_set_insn_start_param(ctx->insn_start, 1, opc);
+    ctx->insn_start =3D NULL;
+}
+
 static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t o=
pcode)
 {
     /*
@@ -1033,6 +1039,7 @@ static void decode_opc(CPURISCVState *env, DisasCon=
text *ctx, uint16_t opcode)
=20
     /* Check for compressed insn */
     if (extract16(opcode, 0, 2) !=3D 3) {
+        decode_save_opc(ctx, opcode);
         if (!has_ext(ctx, RVC)) {
             gen_exception_illegal(ctx);
         } else {
@@ -1047,6 +1054,7 @@ static void decode_opc(CPURISCVState *env, DisasCon=
text *ctx, uint16_t opcode)
         opcode32 =3D deposit32(opcode32, 16, 16,
                              translator_lduw(env, &ctx->base,
                                              ctx->base.pc_next + 2));
+        decode_save_opc(ctx, opcode32);
         ctx->opcode =3D opcode32;
         ctx->pc_succ_insn =3D ctx->base.pc_next + 4;
=20
@@ -1113,7 +1121,8 @@ static void riscv_tr_insn_start(DisasContextBase *d=
cbase, CPUState *cpu)
 {
     DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
=20
-    tcg_gen_insn_start(ctx->base.pc_next);
+    tcg_gen_insn_start(ctx->base.pc_next, 0);
+    ctx->insn_start =3D tcg_last_op();
 }
=20
 static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *=
cpu)
--=20
2.35.3


