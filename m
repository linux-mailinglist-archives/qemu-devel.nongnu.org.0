Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E163564367
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 02:17:53 +0200 (CEST)
Received: from localhost ([::1]:55528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7nJA-0007Os-B1
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 20:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nEO-0008DG-8M
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:12:56 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:46148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nEJ-0001pG-HJ
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:12:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656807171; x=1688343171;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/hrKk5p20kxaD0zCjNEk9cveWwf20tx/Gzwy08mr1wY=;
 b=UlYL7Uce0gP4fpAzAOAab4BsVkL8yKotSCzhXCSRinNReeJlyn/7H9PG
 48jWi9x/WTTUyhKLsB64JNrAzJCfaZgc0X9rqACU8LLuLQbDzJNWdiMhh
 3a22IBMYujAyS78YkAWnGisctpqzS9WaXz3Th6BX0s0MPHu13x2c+k35l
 BT71hi0Us2iwwp6uVcuDdtTBe453ClD9Vq3bxt225YQbPrM+rZ1QaCBOv
 N+zluuhmsfI1W+tXDZO2MZHPUzCq+GMfm9QnEEbNyFfEI+a5It+Dw1zJK
 RCdJC3AK0LmGRYt2YE2hKVq3wDemfO3QXUVU0wDJ9TQnab5MH3hT/y+6/ Q==;
X-IronPort-AV: E=Sophos;i="5.92,241,1650902400"; d="scan'208";a="204667217"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2022 08:12:47 +0800
IronPort-SDR: qGGFeDr97wU1LQz/96u05Ob9H5QAyaR21LnPqo4cx05U4yvFWy0J2OlPBJPrDz8/73LEtAKnf5
 rjzukPf+8YOUmhWj05sedzxP07SGobrhHGx+f0blTni2n3d4xQ/XCU0/h6GQyab5bZU5j+Jycm
 IramQIZdDJ7cw4oR/VsOmmEqX9wHsCkL9TD9zyYs4hneWxYTEvqCTl5YRqA2/Ohp4ooTm426rJ
 bz2IgwMB/R2brDcFm0evvaD4i0ZQZ7wnfnKG3TVvb21vZ43iZo8khAMbaK/IYWFSV7rRCBRQf1
 22DT6/YiYvc/mdBuXPjpMWya
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 16:30:09 -0700
IronPort-SDR: 2IKWDGLk/wvxNtca1di8HqO98rL7yfkGsotNj86ss246CLIMVbQGxa3I2bqxhawavJQK2XYhLC
 r6XKqHfnwHNslbDfCZOdpwv96q6fp5YvpotvZjPuKOC57U72CWSch/GSsa0zhXboiet0A+uTS3
 Zao95H08QMArTjqRE6r6af9oXMRZj1r2ymFPgpAiUmeTVs2AsU8jfzt/ci5qFL3L8o300ChWz7
 r80uZXcvNAwXbPzL8hXe0Rw0xMF/0nMd9nkNqgOSc6pYesOVF4H0e8d1NVtrAa3Wr4AYi7yeCU
 qfA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 17:12:47 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lb8XH1mG8z1Rwnx
 for <qemu-devel@nongnu.org>; Sat,  2 Jul 2022 17:12:47 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1656807166; x=1659399167; bh=/hrKk5p20kxaD0zCjN
 Ek9cveWwf20tx/Gzwy08mr1wY=; b=K2qzhpYij4NdRHv+jpb6p4rXsW5HGH//f0
 Er9jEKmo2JMY/KGQsNpePcwLyIFlUyOg+jSMcbG2tl5GOuIcRs37BRlHd1c6QiHL
 d8bvBQeKKxEUPquf85CF+WE6XjAAlJOmG+EJbSRt3PX2pGzw60CLDyqCffFymWtF
 42jCrbWOb++VBPtMyo0cOkQcgS6NXGW02Lrt53bNHpvfEElohYRsgPCq7iXrIV8z
 TLBxtaeeaxcPB0XhhY1jAEu7wgQHj3WrZujiNRSeOIyOCqmQ3yAOivTWi4KB7oNn
 IVpSTXbnFp8A8R12OPQRcngZ1HSlBZHD+D9GWs/3OKmQlp3Uk1vw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 1S6PRXZ2UD2x for <qemu-devel@nongnu.org>;
 Sat,  2 Jul 2022 17:12:46 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lb8XF3wPjz1RwqM;
 Sat,  2 Jul 2022 17:12:45 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 04/19] target/riscv: Minimize the calls to decode_save_opc
Date: Sun,  3 Jul 2022 10:12:19 +1000
Message-Id: <20220703001234.439716-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
References: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=176813b30=alistair.francis@opensource.wdc.com;
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

From: Richard Henderson <richard.henderson@linaro.org>

The set of instructions that require decode_save_opc for
unwinding is really fairly small -- only insns that can
raise ILLEGAL_INSN at runtime.  This includes CSR, anything
that uses a *new* fp rounding mode, and many privileged insns.

Since unwind info is stored as the difference from the
previous insn, storing a 0 for most insns minimizes the
size of the unwind info.

Booting a debian kernel image to the missing rootfs panic yields

- gen code size       22226819/1026886656
+ gen code size       21601907/1026886656

on 41k TranslationBlocks, a savings of 610kB or a bit less than 3%.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220604231004.49990-4-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c                       | 18 +++++++++---------
 target/riscv/insn_trans/trans_privileged.c.inc |  4 ++++
 target/riscv/insn_trans/trans_rvh.c.inc        |  2 ++
 target/riscv/insn_trans/trans_rvi.c.inc        |  2 ++
 4 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 7205a29603..63b04e8a94 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -206,6 +206,13 @@ static void gen_check_nanbox_s(TCGv_i64 out, TCGv_i6=
4 in)
     tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in, t_nan);
 }
=20
+static void decode_save_opc(DisasContext *ctx)
+{
+    assert(ctx->insn_start !=3D NULL);
+    tcg_set_insn_start_param(ctx->insn_start, 1, ctx->opcode);
+    ctx->insn_start =3D NULL;
+}
+
 static void gen_set_pc_imm(DisasContext *ctx, target_ulong dest)
 {
     if (get_xl(ctx) =3D=3D MXL_RV32) {
@@ -635,6 +642,8 @@ static void gen_set_rm(DisasContext *ctx, int rm)
         return;
     }
=20
+    /* The helper may raise ILLEGAL_INSN -- record binv for unwind. */
+    decode_save_opc(ctx);
     gen_helper_set_rounding_mode(cpu_env, tcg_constant_i32(rm));
 }
=20
@@ -1013,13 +1022,6 @@ static uint32_t opcode_at(DisasContextBase *dcbase=
, target_ulong pc)
 /* Include decoders for factored-out extensions */
 #include "decode-XVentanaCondOps.c.inc"
=20
-static inline void decode_save_opc(DisasContext *ctx, target_ulong opc)
-{
-    assert(ctx->insn_start !=3D NULL);
-    tcg_set_insn_start_param(ctx->insn_start, 1, opc);
-    ctx->insn_start =3D NULL;
-}
-
 static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t o=
pcode)
 {
     /*
@@ -1036,7 +1038,6 @@ static void decode_opc(CPURISCVState *env, DisasCon=
text *ctx, uint16_t opcode)
=20
     /* Check for compressed insn */
     if (extract16(opcode, 0, 2) !=3D 3) {
-        decode_save_opc(ctx, opcode);
         if (!has_ext(ctx, RVC)) {
             gen_exception_illegal(ctx);
         } else {
@@ -1051,7 +1052,6 @@ static void decode_opc(CPURISCVState *env, DisasCon=
text *ctx, uint16_t opcode)
         opcode32 =3D deposit32(opcode32, 16, 16,
                              translator_lduw(env, &ctx->base,
                                              ctx->base.pc_next + 2));
-        decode_save_opc(ctx, opcode32);
         ctx->opcode =3D opcode32;
         ctx->pc_succ_insn =3D ctx->base.pc_next + 4;
=20
diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/risc=
v/insn_trans/trans_privileged.c.inc
index 53613682e8..46f96ad74d 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -75,6 +75,7 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
 {
 #ifndef CONFIG_USER_ONLY
     if (has_ext(ctx, RVS)) {
+        decode_save_opc(ctx);
         gen_helper_sret(cpu_pc, cpu_env);
         tcg_gen_exit_tb(NULL, 0); /* no chaining */
         ctx->base.is_jmp =3D DISAS_NORETURN;
@@ -90,6 +91,7 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
 static bool trans_mret(DisasContext *ctx, arg_mret *a)
 {
 #ifndef CONFIG_USER_ONLY
+    decode_save_opc(ctx);
     gen_helper_mret(cpu_pc, cpu_env);
     tcg_gen_exit_tb(NULL, 0); /* no chaining */
     ctx->base.is_jmp =3D DISAS_NORETURN;
@@ -102,6 +104,7 @@ static bool trans_mret(DisasContext *ctx, arg_mret *a=
)
 static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
 {
 #ifndef CONFIG_USER_ONLY
+    decode_save_opc(ctx);
     gen_set_pc_imm(ctx, ctx->pc_succ_insn);
     gen_helper_wfi(cpu_env);
     return true;
@@ -113,6 +116,7 @@ static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
 static bool trans_sfence_vma(DisasContext *ctx, arg_sfence_vma *a)
 {
 #ifndef CONFIG_USER_ONLY
+    decode_save_opc(ctx);
     gen_helper_tlb_flush(cpu_env);
     return true;
 #endif
diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_=
trans/trans_rvh.c.inc
index cebcb3f8f6..4f8aecddc7 100644
--- a/target/riscv/insn_trans/trans_rvh.c.inc
+++ b/target/riscv/insn_trans/trans_rvh.c.inc
@@ -169,6 +169,7 @@ static bool trans_hfence_gvma(DisasContext *ctx, arg_=
sfence_vma *a)
 {
     REQUIRE_EXT(ctx, RVH);
 #ifndef CONFIG_USER_ONLY
+    decode_save_opc(ctx);
     gen_helper_hyp_gvma_tlb_flush(cpu_env);
     return true;
 #endif
@@ -179,6 +180,7 @@ static bool trans_hfence_vvma(DisasContext *ctx, arg_=
sfence_vma *a)
 {
     REQUIRE_EXT(ctx, RVH);
 #ifndef CONFIG_USER_ONLY
+    decode_save_opc(ctx);
     gen_helper_hyp_tlb_flush(cpu_env);
     return true;
 #endif
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
index c190a59f22..ca8e3d1ea1 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -818,6 +818,8 @@ static bool trans_fence_i(DisasContext *ctx, arg_fenc=
e_i *a)
=20
 static bool do_csr_post(DisasContext *ctx)
 {
+    /* The helper may raise ILLEGAL_INSN -- record binv for unwind. */
+    decode_save_opc(ctx);
     /* We may have changed important cpu state -- exit to main loop. */
     gen_set_pc_imm(ctx, ctx->pc_succ_insn);
     tcg_gen_exit_tb(NULL, 0);
--=20
2.36.1


