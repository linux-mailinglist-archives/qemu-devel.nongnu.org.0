Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1C416F8BB
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 08:47:16 +0100 (CET)
Received: from localhost ([::1]:39420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6rPX-00047q-B5
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 02:47:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46331)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1j6rIP-00016c-NL
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 02:39:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1j6rIO-0002yX-7p
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 02:39:53 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:56012)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1j6rIO-0002wC-1L
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 02:39:52 -0500
Received: by mail-wm1-x32a.google.com with SMTP id q9so1780596wmj.5
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 23:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oo1uiMU4weHOj8ZrNchtQRvpbKwMX83OT5bJ28vnSC8=;
 b=KaCA/TJFb5BAE1nwY2N8NQTOLYCCCQBHzqiIa9imCxOo3I6GbXHhTQ2GNU1YGP7L5k
 DUubDlkYQoiknw13ifdFJKf+zvbyRYTaPHp2I7YvJ8Omd/j1oKahhz3RGX/bZGUUfeT7
 HRXqwLIhmLIXuIdjpmj5Nz+U+8R+EuigeRL7Ulj9kswnE65tCXQFmPe/e975Z7JHIrV5
 Zy029S/bW9AX6YzfC+Bd5NO00MYfiNz/UtwWzEI13UYjrhuzo/FxErqf2PZ/xIcrUOvh
 OEhP5ocFrlSOdYvRDnKIcUsOI9VgBq/l/P6dzfkTwXFOEIE7QBc7rbcANvMtCFavsn6f
 9jhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oo1uiMU4weHOj8ZrNchtQRvpbKwMX83OT5bJ28vnSC8=;
 b=Y5zYINuJWo+DGIBOElCiG4R/8+OH3CYqpCvjVPxZI+UtMaQjYzIvGF9pQtUAZoUKa9
 +sQooLEiX8ikHlSudkRYKJNephAoR654JG+j5QJAWmA9Xdua7caOdQSx6VqQNegcf6kv
 FR1yVpgfAQwdxVkyaKUidkwNgo0NV3bFQtXeV0Ayz0GCAEJx1OfKb0vqg2NNLOjFP+ft
 0H6k2UgsQSa03iNeEdu+9nPPd8NPS21PlMonvy2fFFZNLGyodiBimXPKGfreW5J4uu2A
 6sPchKaOCeCaw2KIeMkQvJrAJZhtGBojwxjYBHN78C6KBtE5w+LOQwE9ijUgWWU4JKyY
 0z4A==
X-Gm-Message-State: APjAAAVt88MDDwWHL8p4PMHAPPePF1W1zJbmKVJR7ia8zrEW1Dwxx/4e
 4OTv76DA6v0+2xzZ0CsHesA1sw==
X-Google-Smtp-Source: APXvYqw47TWImi64jxuHfvThK5PFJFI6MCEdlqHU20ud2UIFU68k+1oVSWvXTnMJnajUfcCoyeZM5w==
X-Received: by 2002:a1c:6a15:: with SMTP id f21mr3724836wmc.126.1582702790893; 
 Tue, 25 Feb 2020 23:39:50 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n3sm2068217wrs.8.2020.02.25.23.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 23:39:45 -0800 (PST)
Received: from zen.home.arpa (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7DABD1FF9E;
 Wed, 26 Feb 2020 07:39:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 14/19] target/riscv: progressively load the instruction during
 decode
Date: Wed, 26 Feb 2020 07:39:24 +0000
Message-Id: <20200226073929.28237-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200226073929.28237-1-alex.bennee@linaro.org>
References: <20200226073929.28237-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32a
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
Cc: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Robert Foley <robert.foley@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The plugin system would throw up a harmless warning when it detected
that a disassembly of an instruction didn't use all it's bytes. Fix
the riscv decoder to only load the instruction bytes it needs as it
needs them.

This drops opcode from the ctx in favour if passing the appropriately
sized opcode down a few levels of the decode.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Robert Foley <robert.foley@linaro.org>

Message-Id: <20200225124710.14152-15-alex.bennee@linaro.org>

diff --git a/target/riscv/instmap.h b/target/riscv/instmap.h
index f8ad7d60fd5..40b6d2b64de 100644
--- a/target/riscv/instmap.h
+++ b/target/riscv/instmap.h
@@ -344,8 +344,8 @@ enum {
 #define GET_C_LW_IMM(inst)          ((extract32(inst, 6, 1) << 2) \
                                     | (extract32(inst, 10, 3) << 3) \
                                     | (extract32(inst, 5, 1) << 6))
-#define GET_C_LD_IMM(inst)          ((extract32(inst, 10, 3) << 3) \
-                                    | (extract32(inst, 5, 2) << 6))
+#define GET_C_LD_IMM(inst)          ((extract16(inst, 10, 3) << 3) \
+                                    | (extract16(inst, 5, 2) << 6))
 #define GET_C_J_IMM(inst)           ((extract32(inst, 3, 3) << 1) \
                                     | (extract32(inst, 11, 1) << 4) \
                                     | (extract32(inst, 2, 1) << 5) \
@@ -363,7 +363,7 @@ enum {
 #define GET_C_RD(inst)              GET_RD(inst)
 #define GET_C_RS1(inst)             GET_RD(inst)
 #define GET_C_RS2(inst)             extract32(inst, 2, 5)
-#define GET_C_RS1S(inst)            (8 + extract32(inst, 7, 3))
-#define GET_C_RS2S(inst)            (8 + extract32(inst, 2, 3))
+#define GET_C_RS1S(inst)            (8 + extract16(inst, 7, 3))
+#define GET_C_RS2S(inst)            (8 + extract16(inst, 2, 3))
 
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 14dc71156be..d5de7f468a7 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -44,7 +44,6 @@ typedef struct DisasContext {
     /* pc_succ_insn points to the instruction following base.pc_next */
     target_ulong pc_succ_insn;
     target_ulong priv_ver;
-    uint32_t opcode;
     uint32_t mstatus_fs;
     uint32_t misa;
     uint32_t mem_idx;
@@ -492,45 +491,45 @@ static void gen_set_rm(DisasContext *ctx, int rm)
     tcg_temp_free_i32(t0);
 }
 
-static void decode_RV32_64C0(DisasContext *ctx)
+static void decode_RV32_64C0(DisasContext *ctx, uint16_t opcode)
 {
-    uint8_t funct3 = extract32(ctx->opcode, 13, 3);
-    uint8_t rd_rs2 = GET_C_RS2S(ctx->opcode);
-    uint8_t rs1s = GET_C_RS1S(ctx->opcode);
+    uint8_t funct3 = extract16(opcode, 13, 3);
+    uint8_t rd_rs2 = GET_C_RS2S(opcode);
+    uint8_t rs1s = GET_C_RS1S(opcode);
 
     switch (funct3) {
     case 3:
 #if defined(TARGET_RISCV64)
         /* C.LD(RV64/128) -> ld rd', offset[7:3](rs1')*/
         gen_load_c(ctx, OPC_RISC_LD, rd_rs2, rs1s,
-                 GET_C_LD_IMM(ctx->opcode));
+                 GET_C_LD_IMM(opcode));
 #else
         /* C.FLW (RV32) -> flw rd', offset[6:2](rs1')*/
         gen_fp_load(ctx, OPC_RISC_FLW, rd_rs2, rs1s,
-                    GET_C_LW_IMM(ctx->opcode));
+                    GET_C_LW_IMM(opcode));
 #endif
         break;
     case 7:
 #if defined(TARGET_RISCV64)
         /* C.SD (RV64/128) -> sd rs2', offset[7:3](rs1')*/
         gen_store_c(ctx, OPC_RISC_SD, rs1s, rd_rs2,
-                  GET_C_LD_IMM(ctx->opcode));
+                  GET_C_LD_IMM(opcode));
 #else
         /* C.FSW (RV32) -> fsw rs2', offset[6:2](rs1')*/
         gen_fp_store(ctx, OPC_RISC_FSW, rs1s, rd_rs2,
-                     GET_C_LW_IMM(ctx->opcode));
+                     GET_C_LW_IMM(opcode));
 #endif
         break;
     }
 }
 
-static void decode_RV32_64C(DisasContext *ctx)
+static void decode_RV32_64C(DisasContext *ctx, uint16_t opcode)
 {
-    uint8_t op = extract32(ctx->opcode, 0, 2);
+    uint8_t op = extract16(opcode, 0, 2);
 
     switch (op) {
     case 0:
-        decode_RV32_64C0(ctx);
+        decode_RV32_64C0(ctx, opcode);
         break;
     }
 }
@@ -709,22 +708,25 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
 /* Include the auto-generated decoder for 16 bit insn */
 #include "decode_insn16.inc.c"
 
-static void decode_opc(DisasContext *ctx)
+static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
 {
     /* check for compressed insn */
-    if (extract32(ctx->opcode, 0, 2) != 3) {
+    if (extract16(opcode, 0, 2) != 3) {
         if (!has_ext(ctx, RVC)) {
             gen_exception_illegal(ctx);
         } else {
             ctx->pc_succ_insn = ctx->base.pc_next + 2;
-            if (!decode_insn16(ctx, ctx->opcode)) {
+            if (!decode_insn16(ctx, opcode)) {
                 /* fall back to old decoder */
-                decode_RV32_64C(ctx);
+                decode_RV32_64C(ctx, opcode);
             }
         }
     } else {
+        uint32_t opcode32 = opcode;
+        opcode32 = deposit32(opcode32, 16, 16,
+                             translator_lduw(env, ctx->base.pc_next + 2));
         ctx->pc_succ_insn = ctx->base.pc_next + 4;
-        if (!decode_insn32(ctx, ctx->opcode)) {
+        if (!decode_insn32(ctx, opcode32)) {
             gen_exception_illegal(ctx);
         }
     }
@@ -776,9 +778,9 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPURISCVState *env = cpu->env_ptr;
+    uint16_t opcode16 = translator_lduw(env, ctx->base.pc_next);
 
-    ctx->opcode = translator_ldl(env, ctx->base.pc_next);
-    decode_opc(ctx);
+    decode_opc(env, ctx, opcode16);
     ctx->base.pc_next = ctx->pc_succ_insn;
 
     if (ctx->base.is_jmp == DISAS_NEXT) {
-- 
2.20.1


