Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE0A3BA14F
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:38:47 +0200 (CEST)
Received: from localhost ([::1]:36054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzJNW-00046R-NI
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJL7-0001NJ-5u
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:36:17 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:43719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJL3-0003u7-5t
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:36:16 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so6408001wmc.2
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DvVQ7fjUSpNJwtLTixLExXwdnvmo5vRNOUR78BWhF4U=;
 b=GKOCWFNY4Rw3bqy6sn6Ymu0EEYLykUOmlSPly08pb22hegfYB3QxKXOu74INUbiLQ7
 Day5wwECCSkojFddvzPrRDTkW0kl3C8fg5vruYDzpnu3UG6XyvF2b0OltoaFOmBrK7mw
 wFJZ2Ru46nHgNLGAyrbjLHt3X6Bc0IKjvPyqrx5jiBxUFh6BERLwjluLGJ4iM/qsTK9P
 45bjsPK4IKKdVxsQzggxOBCiZS8BqtQPpvBsteFFR424Hx3uZbwt3cdZGdAjqbrMS5yl
 F3CRh8Q4UlDzOaw/RewTG+hG3urgLy3arUkI2zl9by82mv1jeZMyc4sCMft8GuMyteUQ
 h/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DvVQ7fjUSpNJwtLTixLExXwdnvmo5vRNOUR78BWhF4U=;
 b=bov4A+L0FKY/5cGFpnUvP/9sZQUX3IGtv+zf5cbfOZ5gVtICupludSd2QTTKoGnBJY
 Lyt8QKIuo7fqb8oiZSDStQMy55qwBa7aUgJMIXy3YetIUJIwle2hu+qqYkFafVCqXpX3
 3VItp8VzvFSXxMLdiMJzksRzbN6HdS+WPL1T2NpDIZKVorbbpg9V+6CGKf7gqXmOLtNm
 XO5TAzf7SgdRwItfOKgKT4XV6EBsWZcUAUEZWp9yXM4OGxBqAbfNVCybv90iWsiUo+TY
 NoNdc0h41ntNkovOBVS14bv9wRuANivqukiWY0NpUI0XRchUYJgsWkc1T/EEWTaOBJDt
 m1mg==
X-Gm-Message-State: AOAM5316/rlxMFB+4D3Kx/pztTfb93RRjpwxcVEKrbctOcfmMXg2KxJ+
 o69kFoXV3CS6PbpTpPhH/HFxIczQK/9JW5JC
X-Google-Smtp-Source: ABdhPJxLjLLvJSYyj1fJFOxXvCk9csABGkEI6RxF91MZhNsM1FeM/GMgbXxkZJJg9sVGiOnoXhbBYA==
X-Received: by 2002:a1c:9d0b:: with SMTP id g11mr5717807wme.132.1625232970771; 
 Fri, 02 Jul 2021 06:36:10 -0700 (PDT)
Received: from x1w.Ascou-CH1 (pop.92-184-108-23.mobile.abo.orange.fr.
 [92.184.108.23])
 by smtp.gmail.com with ESMTPSA id d12sm3385624wri.77.2021.07.02.06.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:36:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/18] target/mips: Extract Code Compaction ASE translation
 routines
Date: Fri,  2 Jul 2021 15:35:41 +0200
Message-Id: <20210702133557.60317-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210702133557.60317-1-f4bug@amsat.org>
References: <20210702133557.60317-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract 1100+ lines from the huge translate.c to a new file,
'mips16e_translate.c.inc'. As there are too many inter-
dependencies we don't compile it as another object, but
keep including it in the big translate.o. We gain in code
maintainability.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201120210844.2625602-10-f4bug@amsat.org>
---
 target/mips/tcg/translate.c             | 1123 +----------------------
 target/mips/tcg/mips16e_translate.c.inc | 1123 +++++++++++++++++++++++
 2 files changed, 1129 insertions(+), 1117 deletions(-)
 create mode 100644 target/mips/tcg/mips16e_translate.c.inc

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 3e9945540fc..6690e50670d 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -12392,391 +12392,6 @@ out:
     tcg_temp_free(t1);
 }
 
-/* ISA extensions (ASEs) */
-/* MIPS16 extension to MIPS32 */
-
-/* MIPS16 major opcodes */
-enum {
-  M16_OPC_ADDIUSP = 0x00,
-  M16_OPC_ADDIUPC = 0x01,
-  M16_OPC_B = 0x02,
-  M16_OPC_JAL = 0x03,
-  M16_OPC_BEQZ = 0x04,
-  M16_OPC_BNEQZ = 0x05,
-  M16_OPC_SHIFT = 0x06,
-  M16_OPC_LD = 0x07,
-  M16_OPC_RRIA = 0x08,
-  M16_OPC_ADDIU8 = 0x09,
-  M16_OPC_SLTI = 0x0a,
-  M16_OPC_SLTIU = 0x0b,
-  M16_OPC_I8 = 0x0c,
-  M16_OPC_LI = 0x0d,
-  M16_OPC_CMPI = 0x0e,
-  M16_OPC_SD = 0x0f,
-  M16_OPC_LB = 0x10,
-  M16_OPC_LH = 0x11,
-  M16_OPC_LWSP = 0x12,
-  M16_OPC_LW = 0x13,
-  M16_OPC_LBU = 0x14,
-  M16_OPC_LHU = 0x15,
-  M16_OPC_LWPC = 0x16,
-  M16_OPC_LWU = 0x17,
-  M16_OPC_SB = 0x18,
-  M16_OPC_SH = 0x19,
-  M16_OPC_SWSP = 0x1a,
-  M16_OPC_SW = 0x1b,
-  M16_OPC_RRR = 0x1c,
-  M16_OPC_RR = 0x1d,
-  M16_OPC_EXTEND = 0x1e,
-  M16_OPC_I64 = 0x1f
-};
-
-/* I8 funct field */
-enum {
-  I8_BTEQZ = 0x0,
-  I8_BTNEZ = 0x1,
-  I8_SWRASP = 0x2,
-  I8_ADJSP = 0x3,
-  I8_SVRS = 0x4,
-  I8_MOV32R = 0x5,
-  I8_MOVR32 = 0x7
-};
-
-/* RRR f field */
-enum {
-  RRR_DADDU = 0x0,
-  RRR_ADDU = 0x1,
-  RRR_DSUBU = 0x2,
-  RRR_SUBU = 0x3
-};
-
-/* RR funct field */
-enum {
-  RR_JR = 0x00,
-  RR_SDBBP = 0x01,
-  RR_SLT = 0x02,
-  RR_SLTU = 0x03,
-  RR_SLLV = 0x04,
-  RR_BREAK = 0x05,
-  RR_SRLV = 0x06,
-  RR_SRAV = 0x07,
-  RR_DSRL = 0x08,
-  RR_CMP = 0x0a,
-  RR_NEG = 0x0b,
-  RR_AND = 0x0c,
-  RR_OR = 0x0d,
-  RR_XOR = 0x0e,
-  RR_NOT = 0x0f,
-  RR_MFHI = 0x10,
-  RR_CNVT = 0x11,
-  RR_MFLO = 0x12,
-  RR_DSRA = 0x13,
-  RR_DSLLV = 0x14,
-  RR_DSRLV = 0x16,
-  RR_DSRAV = 0x17,
-  RR_MULT = 0x18,
-  RR_MULTU = 0x19,
-  RR_DIV = 0x1a,
-  RR_DIVU = 0x1b,
-  RR_DMULT = 0x1c,
-  RR_DMULTU = 0x1d,
-  RR_DDIV = 0x1e,
-  RR_DDIVU = 0x1f
-};
-
-/* I64 funct field */
-enum {
-  I64_LDSP = 0x0,
-  I64_SDSP = 0x1,
-  I64_SDRASP = 0x2,
-  I64_DADJSP = 0x3,
-  I64_LDPC = 0x4,
-  I64_DADDIU5 = 0x5,
-  I64_DADDIUPC = 0x6,
-  I64_DADDIUSP = 0x7
-};
-
-/* RR ry field for CNVT */
-enum {
-  RR_RY_CNVT_ZEB = 0x0,
-  RR_RY_CNVT_ZEH = 0x1,
-  RR_RY_CNVT_ZEW = 0x2,
-  RR_RY_CNVT_SEB = 0x4,
-  RR_RY_CNVT_SEH = 0x5,
-  RR_RY_CNVT_SEW = 0x6,
-};
-
-static int xlat(int r)
-{
-  static int map[] = { 16, 17, 2, 3, 4, 5, 6, 7 };
-
-  return map[r];
-}
-
-static void gen_mips16_save(DisasContext *ctx,
-                            int xsregs, int aregs,
-                            int do_ra, int do_s0, int do_s1,
-                            int framesize)
-{
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-    TCGv t2 = tcg_temp_new();
-    int args, astatic;
-
-    switch (aregs) {
-    case 0:
-    case 1:
-    case 2:
-    case 3:
-    case 11:
-        args = 0;
-        break;
-    case 4:
-    case 5:
-    case 6:
-    case 7:
-        args = 1;
-        break;
-    case 8:
-    case 9:
-    case 10:
-        args = 2;
-        break;
-    case 12:
-    case 13:
-        args = 3;
-        break;
-    case 14:
-        args = 4;
-        break;
-    default:
-        gen_reserved_instruction(ctx);
-        return;
-    }
-
-    switch (args) {
-    case 4:
-        gen_base_offset_addr(ctx, t0, 29, 12);
-        gen_load_gpr(t1, 7);
-        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL);
-        /* Fall through */
-    case 3:
-        gen_base_offset_addr(ctx, t0, 29, 8);
-        gen_load_gpr(t1, 6);
-        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL);
-        /* Fall through */
-    case 2:
-        gen_base_offset_addr(ctx, t0, 29, 4);
-        gen_load_gpr(t1, 5);
-        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL);
-        /* Fall through */
-    case 1:
-        gen_base_offset_addr(ctx, t0, 29, 0);
-        gen_load_gpr(t1, 4);
-        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL);
-    }
-
-    gen_load_gpr(t0, 29);
-
-#define DECR_AND_STORE(reg) do {                                 \
-        tcg_gen_movi_tl(t2, -4);                                 \
-        gen_op_addr_add(ctx, t0, t0, t2);                        \
-        gen_load_gpr(t1, reg);                                   \
-        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL); \
-    } while (0)
-
-    if (do_ra) {
-        DECR_AND_STORE(31);
-    }
-
-    switch (xsregs) {
-    case 7:
-        DECR_AND_STORE(30);
-        /* Fall through */
-    case 6:
-        DECR_AND_STORE(23);
-        /* Fall through */
-    case 5:
-        DECR_AND_STORE(22);
-        /* Fall through */
-    case 4:
-        DECR_AND_STORE(21);
-        /* Fall through */
-    case 3:
-        DECR_AND_STORE(20);
-        /* Fall through */
-    case 2:
-        DECR_AND_STORE(19);
-        /* Fall through */
-    case 1:
-        DECR_AND_STORE(18);
-    }
-
-    if (do_s1) {
-        DECR_AND_STORE(17);
-    }
-    if (do_s0) {
-        DECR_AND_STORE(16);
-    }
-
-    switch (aregs) {
-    case 0:
-    case 4:
-    case 8:
-    case 12:
-    case 14:
-        astatic = 0;
-        break;
-    case 1:
-    case 5:
-    case 9:
-    case 13:
-        astatic = 1;
-        break;
-    case 2:
-    case 6:
-    case 10:
-        astatic = 2;
-        break;
-    case 3:
-    case 7:
-        astatic = 3;
-        break;
-    case 11:
-        astatic = 4;
-        break;
-    default:
-        gen_reserved_instruction(ctx);
-        return;
-    }
-
-    if (astatic > 0) {
-        DECR_AND_STORE(7);
-        if (astatic > 1) {
-            DECR_AND_STORE(6);
-            if (astatic > 2) {
-                DECR_AND_STORE(5);
-                if (astatic > 3) {
-                    DECR_AND_STORE(4);
-                }
-            }
-        }
-    }
-#undef DECR_AND_STORE
-
-    tcg_gen_movi_tl(t2, -framesize);
-    gen_op_addr_add(ctx, cpu_gpr[29], cpu_gpr[29], t2);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-}
-
-static void gen_mips16_restore(DisasContext *ctx,
-                               int xsregs, int aregs,
-                               int do_ra, int do_s0, int do_s1,
-                               int framesize)
-{
-    int astatic;
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-    TCGv t2 = tcg_temp_new();
-
-    tcg_gen_movi_tl(t2, framesize);
-    gen_op_addr_add(ctx, t0, cpu_gpr[29], t2);
-
-#define DECR_AND_LOAD(reg) do {                            \
-        tcg_gen_movi_tl(t2, -4);                           \
-        gen_op_addr_add(ctx, t0, t0, t2);                  \
-        tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TESL); \
-        gen_store_gpr(t1, reg);                            \
-    } while (0)
-
-    if (do_ra) {
-        DECR_AND_LOAD(31);
-    }
-
-    switch (xsregs) {
-    case 7:
-        DECR_AND_LOAD(30);
-        /* Fall through */
-    case 6:
-        DECR_AND_LOAD(23);
-        /* Fall through */
-    case 5:
-        DECR_AND_LOAD(22);
-        /* Fall through */
-    case 4:
-        DECR_AND_LOAD(21);
-        /* Fall through */
-    case 3:
-        DECR_AND_LOAD(20);
-        /* Fall through */
-    case 2:
-        DECR_AND_LOAD(19);
-        /* Fall through */
-    case 1:
-        DECR_AND_LOAD(18);
-    }
-
-    if (do_s1) {
-        DECR_AND_LOAD(17);
-    }
-    if (do_s0) {
-        DECR_AND_LOAD(16);
-    }
-
-    switch (aregs) {
-    case 0:
-    case 4:
-    case 8:
-    case 12:
-    case 14:
-        astatic = 0;
-        break;
-    case 1:
-    case 5:
-    case 9:
-    case 13:
-        astatic = 1;
-        break;
-    case 2:
-    case 6:
-    case 10:
-        astatic = 2;
-        break;
-    case 3:
-    case 7:
-        astatic = 3;
-        break;
-    case 11:
-        astatic = 4;
-        break;
-    default:
-        gen_reserved_instruction(ctx);
-        return;
-    }
-
-    if (astatic > 0) {
-        DECR_AND_LOAD(7);
-        if (astatic > 1) {
-            DECR_AND_LOAD(6);
-            if (astatic > 2) {
-                DECR_AND_LOAD(5);
-                if (astatic > 3) {
-                    DECR_AND_LOAD(4);
-                }
-            }
-        }
-    }
-#undef DECR_AND_LOAD
-
-    tcg_gen_movi_tl(t2, framesize);
-    gen_op_addr_add(ctx, cpu_gpr[29], cpu_gpr[29], t2);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-}
-
 void gen_addiupc(DisasContext *ctx, int rx, int imm,
                  int is_64_bit, int extended)
 {
@@ -12809,267 +12424,6 @@ static void gen_cache_operation(DisasContext *ctx, uint32_t op, int base,
     tcg_temp_free_i32(t0);
 }
 
-#if defined(TARGET_MIPS64)
-static void decode_i64_mips16(DisasContext *ctx,
-                              int ry, int funct, int16_t offset,
-                              int extended)
-{
-    switch (funct) {
-    case I64_LDSP:
-        check_insn(ctx, ISA_MIPS3);
-        check_mips_64(ctx);
-        offset = extended ? offset : offset << 3;
-        gen_ld(ctx, OPC_LD, ry, 29, offset);
-        break;
-    case I64_SDSP:
-        check_insn(ctx, ISA_MIPS3);
-        check_mips_64(ctx);
-        offset = extended ? offset : offset << 3;
-        gen_st(ctx, OPC_SD, ry, 29, offset);
-        break;
-    case I64_SDRASP:
-        check_insn(ctx, ISA_MIPS3);
-        check_mips_64(ctx);
-        offset = extended ? offset : (ctx->opcode & 0xff) << 3;
-        gen_st(ctx, OPC_SD, 31, 29, offset);
-        break;
-    case I64_DADJSP:
-        check_insn(ctx, ISA_MIPS3);
-        check_mips_64(ctx);
-        offset = extended ? offset : ((int8_t)ctx->opcode) << 3;
-        gen_arith_imm(ctx, OPC_DADDIU, 29, 29, offset);
-        break;
-    case I64_LDPC:
-        check_insn(ctx, ISA_MIPS3);
-        check_mips_64(ctx);
-        if (extended && (ctx->hflags & MIPS_HFLAG_BMASK)) {
-            gen_reserved_instruction(ctx);
-        } else {
-            offset = extended ? offset : offset << 3;
-            gen_ld(ctx, OPC_LDPC, ry, 0, offset);
-        }
-        break;
-    case I64_DADDIU5:
-        check_insn(ctx, ISA_MIPS3);
-        check_mips_64(ctx);
-        offset = extended ? offset : ((int8_t)(offset << 3)) >> 3;
-        gen_arith_imm(ctx, OPC_DADDIU, ry, ry, offset);
-        break;
-    case I64_DADDIUPC:
-        check_insn(ctx, ISA_MIPS3);
-        check_mips_64(ctx);
-        offset = extended ? offset : offset << 2;
-        gen_addiupc(ctx, ry, offset, 1, extended);
-        break;
-    case I64_DADDIUSP:
-        check_insn(ctx, ISA_MIPS3);
-        check_mips_64(ctx);
-        offset = extended ? offset : offset << 2;
-        gen_arith_imm(ctx, OPC_DADDIU, ry, 29, offset);
-        break;
-    }
-}
-#endif
-
-static int decode_extended_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
-{
-    int extend = translator_lduw(env, ctx->base.pc_next + 2);
-    int op, rx, ry, funct, sa;
-    int16_t imm, offset;
-
-    ctx->opcode = (ctx->opcode << 16) | extend;
-    op = (ctx->opcode >> 11) & 0x1f;
-    sa = (ctx->opcode >> 22) & 0x1f;
-    funct = (ctx->opcode >> 8) & 0x7;
-    rx = xlat((ctx->opcode >> 8) & 0x7);
-    ry = xlat((ctx->opcode >> 5) & 0x7);
-    offset = imm = (int16_t) (((ctx->opcode >> 16) & 0x1f) << 11
-                              | ((ctx->opcode >> 21) & 0x3f) << 5
-                              | (ctx->opcode & 0x1f));
-
-    /*
-     * The extended opcodes cleverly reuse the opcodes from their 16-bit
-     * counterparts.
-     */
-    switch (op) {
-    case M16_OPC_ADDIUSP:
-        gen_arith_imm(ctx, OPC_ADDIU, rx, 29, imm);
-        break;
-    case M16_OPC_ADDIUPC:
-        gen_addiupc(ctx, rx, imm, 0, 1);
-        break;
-    case M16_OPC_B:
-        gen_compute_branch(ctx, OPC_BEQ, 4, 0, 0, offset << 1, 0);
-        /* No delay slot, so just process as a normal instruction */
-        break;
-    case M16_OPC_BEQZ:
-        gen_compute_branch(ctx, OPC_BEQ, 4, rx, 0, offset << 1, 0);
-        /* No delay slot, so just process as a normal instruction */
-        break;
-    case M16_OPC_BNEQZ:
-        gen_compute_branch(ctx, OPC_BNE, 4, rx, 0, offset << 1, 0);
-        /* No delay slot, so just process as a normal instruction */
-        break;
-    case M16_OPC_SHIFT:
-        switch (ctx->opcode & 0x3) {
-        case 0x0:
-            gen_shift_imm(ctx, OPC_SLL, rx, ry, sa);
-            break;
-        case 0x1:
-#if defined(TARGET_MIPS64)
-            check_mips_64(ctx);
-            gen_shift_imm(ctx, OPC_DSLL, rx, ry, sa);
-#else
-            gen_reserved_instruction(ctx);
-#endif
-            break;
-        case 0x2:
-            gen_shift_imm(ctx, OPC_SRL, rx, ry, sa);
-            break;
-        case 0x3:
-            gen_shift_imm(ctx, OPC_SRA, rx, ry, sa);
-            break;
-        }
-        break;
-#if defined(TARGET_MIPS64)
-    case M16_OPC_LD:
-        check_insn(ctx, ISA_MIPS3);
-        check_mips_64(ctx);
-        gen_ld(ctx, OPC_LD, ry, rx, offset);
-        break;
-#endif
-    case M16_OPC_RRIA:
-        imm = ctx->opcode & 0xf;
-        imm = imm | ((ctx->opcode >> 20) & 0x7f) << 4;
-        imm = imm | ((ctx->opcode >> 16) & 0xf) << 11;
-        imm = (int16_t) (imm << 1) >> 1;
-        if ((ctx->opcode >> 4) & 0x1) {
-#if defined(TARGET_MIPS64)
-            check_mips_64(ctx);
-            gen_arith_imm(ctx, OPC_DADDIU, ry, rx, imm);
-#else
-            gen_reserved_instruction(ctx);
-#endif
-        } else {
-            gen_arith_imm(ctx, OPC_ADDIU, ry, rx, imm);
-        }
-        break;
-    case M16_OPC_ADDIU8:
-        gen_arith_imm(ctx, OPC_ADDIU, rx, rx, imm);
-        break;
-    case M16_OPC_SLTI:
-        gen_slt_imm(ctx, OPC_SLTI, 24, rx, imm);
-        break;
-    case M16_OPC_SLTIU:
-        gen_slt_imm(ctx, OPC_SLTIU, 24, rx, imm);
-        break;
-    case M16_OPC_I8:
-        switch (funct) {
-        case I8_BTEQZ:
-            gen_compute_branch(ctx, OPC_BEQ, 4, 24, 0, offset << 1, 0);
-            break;
-        case I8_BTNEZ:
-            gen_compute_branch(ctx, OPC_BNE, 4, 24, 0, offset << 1, 0);
-            break;
-        case I8_SWRASP:
-            gen_st(ctx, OPC_SW, 31, 29, imm);
-            break;
-        case I8_ADJSP:
-            gen_arith_imm(ctx, OPC_ADDIU, 29, 29, imm);
-            break;
-        case I8_SVRS:
-            check_insn(ctx, ISA_MIPS_R1);
-            {
-                int xsregs = (ctx->opcode >> 24) & 0x7;
-                int aregs = (ctx->opcode >> 16) & 0xf;
-                int do_ra = (ctx->opcode >> 6) & 0x1;
-                int do_s0 = (ctx->opcode >> 5) & 0x1;
-                int do_s1 = (ctx->opcode >> 4) & 0x1;
-                int framesize = (((ctx->opcode >> 20) & 0xf) << 4
-                                 | (ctx->opcode & 0xf)) << 3;
-
-                if (ctx->opcode & (1 << 7)) {
-                    gen_mips16_save(ctx, xsregs, aregs,
-                                    do_ra, do_s0, do_s1,
-                                    framesize);
-                } else {
-                    gen_mips16_restore(ctx, xsregs, aregs,
-                                       do_ra, do_s0, do_s1,
-                                       framesize);
-                }
-            }
-            break;
-        default:
-            gen_reserved_instruction(ctx);
-            break;
-        }
-        break;
-    case M16_OPC_LI:
-        tcg_gen_movi_tl(cpu_gpr[rx], (uint16_t) imm);
-        break;
-    case M16_OPC_CMPI:
-        tcg_gen_xori_tl(cpu_gpr[24], cpu_gpr[rx], (uint16_t) imm);
-        break;
-#if defined(TARGET_MIPS64)
-    case M16_OPC_SD:
-        check_insn(ctx, ISA_MIPS3);
-        check_mips_64(ctx);
-        gen_st(ctx, OPC_SD, ry, rx, offset);
-        break;
-#endif
-    case M16_OPC_LB:
-        gen_ld(ctx, OPC_LB, ry, rx, offset);
-        break;
-    case M16_OPC_LH:
-        gen_ld(ctx, OPC_LH, ry, rx, offset);
-        break;
-    case M16_OPC_LWSP:
-        gen_ld(ctx, OPC_LW, rx, 29, offset);
-        break;
-    case M16_OPC_LW:
-        gen_ld(ctx, OPC_LW, ry, rx, offset);
-        break;
-    case M16_OPC_LBU:
-        gen_ld(ctx, OPC_LBU, ry, rx, offset);
-        break;
-    case M16_OPC_LHU:
-        gen_ld(ctx, OPC_LHU, ry, rx, offset);
-        break;
-    case M16_OPC_LWPC:
-        gen_ld(ctx, OPC_LWPC, rx, 0, offset);
-        break;
-#if defined(TARGET_MIPS64)
-    case M16_OPC_LWU:
-        check_insn(ctx, ISA_MIPS3);
-        check_mips_64(ctx);
-        gen_ld(ctx, OPC_LWU, ry, rx, offset);
-        break;
-#endif
-    case M16_OPC_SB:
-        gen_st(ctx, OPC_SB, ry, rx, offset);
-        break;
-    case M16_OPC_SH:
-        gen_st(ctx, OPC_SH, ry, rx, offset);
-        break;
-    case M16_OPC_SWSP:
-        gen_st(ctx, OPC_SW, rx, 29, offset);
-        break;
-    case M16_OPC_SW:
-        gen_st(ctx, OPC_SW, ry, rx, offset);
-        break;
-#if defined(TARGET_MIPS64)
-    case M16_OPC_I64:
-        decode_i64_mips16(ctx, ry, funct, offset, 1);
-        break;
-#endif
-    default:
-        gen_reserved_instruction(ctx);
-        break;
-    }
-
-    return 4;
-}
-
 static inline bool is_uhi(int sdbbp_code)
 {
 #ifdef CONFIG_USER_ONLY
@@ -13087,476 +12441,6 @@ static inline void gen_helper_do_semihosting(void *env)
 }
 #endif
 
-static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
-{
-    int rx, ry;
-    int sa;
-    int op, cnvt_op, op1, offset;
-    int funct;
-    int n_bytes;
-
-    op = (ctx->opcode >> 11) & 0x1f;
-    sa = (ctx->opcode >> 2) & 0x7;
-    sa = sa == 0 ? 8 : sa;
-    rx = xlat((ctx->opcode >> 8) & 0x7);
-    cnvt_op = (ctx->opcode >> 5) & 0x7;
-    ry = xlat((ctx->opcode >> 5) & 0x7);
-    op1 = offset = ctx->opcode & 0x1f;
-
-    n_bytes = 2;
-
-    switch (op) {
-    case M16_OPC_ADDIUSP:
-        {
-            int16_t imm = ((uint8_t) ctx->opcode) << 2;
-
-            gen_arith_imm(ctx, OPC_ADDIU, rx, 29, imm);
-        }
-        break;
-    case M16_OPC_ADDIUPC:
-        gen_addiupc(ctx, rx, ((uint8_t) ctx->opcode) << 2, 0, 0);
-        break;
-    case M16_OPC_B:
-        offset = (ctx->opcode & 0x7ff) << 1;
-        offset = (int16_t)(offset << 4) >> 4;
-        gen_compute_branch(ctx, OPC_BEQ, 2, 0, 0, offset, 0);
-        /* No delay slot, so just process as a normal instruction */
-        break;
-    case M16_OPC_JAL:
-        offset = translator_lduw(env, ctx->base.pc_next + 2);
-        offset = (((ctx->opcode & 0x1f) << 21)
-                  | ((ctx->opcode >> 5) & 0x1f) << 16
-                  | offset) << 2;
-        op = ((ctx->opcode >> 10) & 0x1) ? OPC_JALX : OPC_JAL;
-        gen_compute_branch(ctx, op, 4, rx, ry, offset, 2);
-        n_bytes = 4;
-        break;
-    case M16_OPC_BEQZ:
-        gen_compute_branch(ctx, OPC_BEQ, 2, rx, 0,
-                           ((int8_t)ctx->opcode) << 1, 0);
-        /* No delay slot, so just process as a normal instruction */
-        break;
-    case M16_OPC_BNEQZ:
-        gen_compute_branch(ctx, OPC_BNE, 2, rx, 0,
-                           ((int8_t)ctx->opcode) << 1, 0);
-        /* No delay slot, so just process as a normal instruction */
-        break;
-    case M16_OPC_SHIFT:
-        switch (ctx->opcode & 0x3) {
-        case 0x0:
-            gen_shift_imm(ctx, OPC_SLL, rx, ry, sa);
-            break;
-        case 0x1:
-#if defined(TARGET_MIPS64)
-            check_insn(ctx, ISA_MIPS3);
-            check_mips_64(ctx);
-            gen_shift_imm(ctx, OPC_DSLL, rx, ry, sa);
-#else
-            gen_reserved_instruction(ctx);
-#endif
-            break;
-        case 0x2:
-            gen_shift_imm(ctx, OPC_SRL, rx, ry, sa);
-            break;
-        case 0x3:
-            gen_shift_imm(ctx, OPC_SRA, rx, ry, sa);
-            break;
-        }
-        break;
-#if defined(TARGET_MIPS64)
-    case M16_OPC_LD:
-        check_insn(ctx, ISA_MIPS3);
-        check_mips_64(ctx);
-        gen_ld(ctx, OPC_LD, ry, rx, offset << 3);
-        break;
-#endif
-    case M16_OPC_RRIA:
-        {
-            int16_t imm = (int8_t)((ctx->opcode & 0xf) << 4) >> 4;
-
-            if ((ctx->opcode >> 4) & 1) {
-#if defined(TARGET_MIPS64)
-                check_insn(ctx, ISA_MIPS3);
-                check_mips_64(ctx);
-                gen_arith_imm(ctx, OPC_DADDIU, ry, rx, imm);
-#else
-                gen_reserved_instruction(ctx);
-#endif
-            } else {
-                gen_arith_imm(ctx, OPC_ADDIU, ry, rx, imm);
-            }
-        }
-        break;
-    case M16_OPC_ADDIU8:
-        {
-            int16_t imm = (int8_t) ctx->opcode;
-
-            gen_arith_imm(ctx, OPC_ADDIU, rx, rx, imm);
-        }
-        break;
-    case M16_OPC_SLTI:
-        {
-            int16_t imm = (uint8_t) ctx->opcode;
-            gen_slt_imm(ctx, OPC_SLTI, 24, rx, imm);
-        }
-        break;
-    case M16_OPC_SLTIU:
-        {
-            int16_t imm = (uint8_t) ctx->opcode;
-            gen_slt_imm(ctx, OPC_SLTIU, 24, rx, imm);
-        }
-        break;
-    case M16_OPC_I8:
-        {
-            int reg32;
-
-            funct = (ctx->opcode >> 8) & 0x7;
-            switch (funct) {
-            case I8_BTEQZ:
-                gen_compute_branch(ctx, OPC_BEQ, 2, 24, 0,
-                                   ((int8_t)ctx->opcode) << 1, 0);
-                break;
-            case I8_BTNEZ:
-                gen_compute_branch(ctx, OPC_BNE, 2, 24, 0,
-                                   ((int8_t)ctx->opcode) << 1, 0);
-                break;
-            case I8_SWRASP:
-                gen_st(ctx, OPC_SW, 31, 29, (ctx->opcode & 0xff) << 2);
-                break;
-            case I8_ADJSP:
-                gen_arith_imm(ctx, OPC_ADDIU, 29, 29,
-                              ((int8_t)ctx->opcode) << 3);
-                break;
-            case I8_SVRS:
-                check_insn(ctx, ISA_MIPS_R1);
-                {
-                    int do_ra = ctx->opcode & (1 << 6);
-                    int do_s0 = ctx->opcode & (1 << 5);
-                    int do_s1 = ctx->opcode & (1 << 4);
-                    int framesize = ctx->opcode & 0xf;
-
-                    if (framesize == 0) {
-                        framesize = 128;
-                    } else {
-                        framesize = framesize << 3;
-                    }
-
-                    if (ctx->opcode & (1 << 7)) {
-                        gen_mips16_save(ctx, 0, 0,
-                                        do_ra, do_s0, do_s1, framesize);
-                    } else {
-                        gen_mips16_restore(ctx, 0, 0,
-                                           do_ra, do_s0, do_s1, framesize);
-                    }
-                }
-                break;
-            case I8_MOV32R:
-                {
-                    int rz = xlat(ctx->opcode & 0x7);
-
-                    reg32 = (((ctx->opcode >> 3) & 0x3) << 3) |
-                        ((ctx->opcode >> 5) & 0x7);
-                    gen_arith(ctx, OPC_ADDU, reg32, rz, 0);
-                }
-                break;
-            case I8_MOVR32:
-                reg32 = ctx->opcode & 0x1f;
-                gen_arith(ctx, OPC_ADDU, ry, reg32, 0);
-                break;
-            default:
-                gen_reserved_instruction(ctx);
-                break;
-            }
-        }
-        break;
-    case M16_OPC_LI:
-        {
-            int16_t imm = (uint8_t) ctx->opcode;
-
-            gen_arith_imm(ctx, OPC_ADDIU, rx, 0, imm);
-        }
-        break;
-    case M16_OPC_CMPI:
-        {
-            int16_t imm = (uint8_t) ctx->opcode;
-            gen_logic_imm(ctx, OPC_XORI, 24, rx, imm);
-        }
-        break;
-#if defined(TARGET_MIPS64)
-    case M16_OPC_SD:
-        check_insn(ctx, ISA_MIPS3);
-        check_mips_64(ctx);
-        gen_st(ctx, OPC_SD, ry, rx, offset << 3);
-        break;
-#endif
-    case M16_OPC_LB:
-        gen_ld(ctx, OPC_LB, ry, rx, offset);
-        break;
-    case M16_OPC_LH:
-        gen_ld(ctx, OPC_LH, ry, rx, offset << 1);
-        break;
-    case M16_OPC_LWSP:
-        gen_ld(ctx, OPC_LW, rx, 29, ((uint8_t)ctx->opcode) << 2);
-        break;
-    case M16_OPC_LW:
-        gen_ld(ctx, OPC_LW, ry, rx, offset << 2);
-        break;
-    case M16_OPC_LBU:
-        gen_ld(ctx, OPC_LBU, ry, rx, offset);
-        break;
-    case M16_OPC_LHU:
-        gen_ld(ctx, OPC_LHU, ry, rx, offset << 1);
-        break;
-    case M16_OPC_LWPC:
-        gen_ld(ctx, OPC_LWPC, rx, 0, ((uint8_t)ctx->opcode) << 2);
-        break;
-#if defined(TARGET_MIPS64)
-    case M16_OPC_LWU:
-        check_insn(ctx, ISA_MIPS3);
-        check_mips_64(ctx);
-        gen_ld(ctx, OPC_LWU, ry, rx, offset << 2);
-        break;
-#endif
-    case M16_OPC_SB:
-        gen_st(ctx, OPC_SB, ry, rx, offset);
-        break;
-    case M16_OPC_SH:
-        gen_st(ctx, OPC_SH, ry, rx, offset << 1);
-        break;
-    case M16_OPC_SWSP:
-        gen_st(ctx, OPC_SW, rx, 29, ((uint8_t)ctx->opcode) << 2);
-        break;
-    case M16_OPC_SW:
-        gen_st(ctx, OPC_SW, ry, rx, offset << 2);
-        break;
-    case M16_OPC_RRR:
-        {
-            int rz = xlat((ctx->opcode >> 2) & 0x7);
-            int mips32_op;
-
-            switch (ctx->opcode & 0x3) {
-            case RRR_ADDU:
-                mips32_op = OPC_ADDU;
-                break;
-            case RRR_SUBU:
-                mips32_op = OPC_SUBU;
-                break;
-#if defined(TARGET_MIPS64)
-            case RRR_DADDU:
-                mips32_op = OPC_DADDU;
-                check_insn(ctx, ISA_MIPS3);
-                check_mips_64(ctx);
-                break;
-            case RRR_DSUBU:
-                mips32_op = OPC_DSUBU;
-                check_insn(ctx, ISA_MIPS3);
-                check_mips_64(ctx);
-                break;
-#endif
-            default:
-                gen_reserved_instruction(ctx);
-                goto done;
-            }
-
-            gen_arith(ctx, mips32_op, rz, rx, ry);
-        done:
-            ;
-        }
-        break;
-    case M16_OPC_RR:
-        switch (op1) {
-        case RR_JR:
-            {
-                int nd = (ctx->opcode >> 7) & 0x1;
-                int link = (ctx->opcode >> 6) & 0x1;
-                int ra = (ctx->opcode >> 5) & 0x1;
-
-                if (nd) {
-                    check_insn(ctx, ISA_MIPS_R1);
-                }
-
-                if (link) {
-                    op = OPC_JALR;
-                } else {
-                    op = OPC_JR;
-                }
-
-                gen_compute_branch(ctx, op, 2, ra ? 31 : rx, 31, 0,
-                                   (nd ? 0 : 2));
-            }
-            break;
-        case RR_SDBBP:
-            if (is_uhi(extract32(ctx->opcode, 5, 6))) {
-                gen_helper_do_semihosting(cpu_env);
-            } else {
-                /*
-                 * XXX: not clear which exception should be raised
-                 *      when in debug mode...
-                 */
-                check_insn(ctx, ISA_MIPS_R1);
-                generate_exception_end(ctx, EXCP_DBp);
-            }
-            break;
-        case RR_SLT:
-            gen_slt(ctx, OPC_SLT, 24, rx, ry);
-            break;
-        case RR_SLTU:
-            gen_slt(ctx, OPC_SLTU, 24, rx, ry);
-            break;
-        case RR_BREAK:
-            generate_exception_end(ctx, EXCP_BREAK);
-            break;
-        case RR_SLLV:
-            gen_shift(ctx, OPC_SLLV, ry, rx, ry);
-            break;
-        case RR_SRLV:
-            gen_shift(ctx, OPC_SRLV, ry, rx, ry);
-            break;
-        case RR_SRAV:
-            gen_shift(ctx, OPC_SRAV, ry, rx, ry);
-            break;
-#if defined(TARGET_MIPS64)
-        case RR_DSRL:
-            check_insn(ctx, ISA_MIPS3);
-            check_mips_64(ctx);
-            gen_shift_imm(ctx, OPC_DSRL, ry, ry, sa);
-            break;
-#endif
-        case RR_CMP:
-            gen_logic(ctx, OPC_XOR, 24, rx, ry);
-            break;
-        case RR_NEG:
-            gen_arith(ctx, OPC_SUBU, rx, 0, ry);
-            break;
-        case RR_AND:
-            gen_logic(ctx, OPC_AND, rx, rx, ry);
-            break;
-        case RR_OR:
-            gen_logic(ctx, OPC_OR, rx, rx, ry);
-            break;
-        case RR_XOR:
-            gen_logic(ctx, OPC_XOR, rx, rx, ry);
-            break;
-        case RR_NOT:
-            gen_logic(ctx, OPC_NOR, rx, ry, 0);
-            break;
-        case RR_MFHI:
-            gen_HILO(ctx, OPC_MFHI, 0, rx);
-            break;
-        case RR_CNVT:
-            check_insn(ctx, ISA_MIPS_R1);
-            switch (cnvt_op) {
-            case RR_RY_CNVT_ZEB:
-                tcg_gen_ext8u_tl(cpu_gpr[rx], cpu_gpr[rx]);
-                break;
-            case RR_RY_CNVT_ZEH:
-                tcg_gen_ext16u_tl(cpu_gpr[rx], cpu_gpr[rx]);
-                break;
-            case RR_RY_CNVT_SEB:
-                tcg_gen_ext8s_tl(cpu_gpr[rx], cpu_gpr[rx]);
-                break;
-            case RR_RY_CNVT_SEH:
-                tcg_gen_ext16s_tl(cpu_gpr[rx], cpu_gpr[rx]);
-                break;
-#if defined(TARGET_MIPS64)
-            case RR_RY_CNVT_ZEW:
-                check_insn(ctx, ISA_MIPS_R1);
-                check_mips_64(ctx);
-                tcg_gen_ext32u_tl(cpu_gpr[rx], cpu_gpr[rx]);
-                break;
-            case RR_RY_CNVT_SEW:
-                check_insn(ctx, ISA_MIPS_R1);
-                check_mips_64(ctx);
-                tcg_gen_ext32s_tl(cpu_gpr[rx], cpu_gpr[rx]);
-                break;
-#endif
-            default:
-                gen_reserved_instruction(ctx);
-                break;
-            }
-            break;
-        case RR_MFLO:
-            gen_HILO(ctx, OPC_MFLO, 0, rx);
-            break;
-#if defined(TARGET_MIPS64)
-        case RR_DSRA:
-            check_insn(ctx, ISA_MIPS3);
-            check_mips_64(ctx);
-            gen_shift_imm(ctx, OPC_DSRA, ry, ry, sa);
-            break;
-        case RR_DSLLV:
-            check_insn(ctx, ISA_MIPS3);
-            check_mips_64(ctx);
-            gen_shift(ctx, OPC_DSLLV, ry, rx, ry);
-            break;
-        case RR_DSRLV:
-            check_insn(ctx, ISA_MIPS3);
-            check_mips_64(ctx);
-            gen_shift(ctx, OPC_DSRLV, ry, rx, ry);
-            break;
-        case RR_DSRAV:
-            check_insn(ctx, ISA_MIPS3);
-            check_mips_64(ctx);
-            gen_shift(ctx, OPC_DSRAV, ry, rx, ry);
-            break;
-#endif
-        case RR_MULT:
-            gen_muldiv(ctx, OPC_MULT, 0, rx, ry);
-            break;
-        case RR_MULTU:
-            gen_muldiv(ctx, OPC_MULTU, 0, rx, ry);
-            break;
-        case RR_DIV:
-            gen_muldiv(ctx, OPC_DIV, 0, rx, ry);
-            break;
-        case RR_DIVU:
-            gen_muldiv(ctx, OPC_DIVU, 0, rx, ry);
-            break;
-#if defined(TARGET_MIPS64)
-        case RR_DMULT:
-            check_insn(ctx, ISA_MIPS3);
-            check_mips_64(ctx);
-            gen_muldiv(ctx, OPC_DMULT, 0, rx, ry);
-            break;
-        case RR_DMULTU:
-            check_insn(ctx, ISA_MIPS3);
-            check_mips_64(ctx);
-            gen_muldiv(ctx, OPC_DMULTU, 0, rx, ry);
-            break;
-        case RR_DDIV:
-            check_insn(ctx, ISA_MIPS3);
-            check_mips_64(ctx);
-            gen_muldiv(ctx, OPC_DDIV, 0, rx, ry);
-            break;
-        case RR_DDIVU:
-            check_insn(ctx, ISA_MIPS3);
-            check_mips_64(ctx);
-            gen_muldiv(ctx, OPC_DDIVU, 0, rx, ry);
-            break;
-#endif
-        default:
-            gen_reserved_instruction(ctx);
-            break;
-        }
-        break;
-    case M16_OPC_EXTEND:
-        decode_extended_mips16_opc(env, ctx);
-        n_bytes = 4;
-        break;
-#if defined(TARGET_MIPS64)
-    case M16_OPC_I64:
-        funct = (ctx->opcode >> 8) & 0x7;
-        decode_i64_mips16(ctx, ry, funct, offset, 0);
-        break;
-#endif
-    default:
-        gen_reserved_instruction(ctx);
-        break;
-    }
-
-    return n_bytes;
-}
-
 /* microMIPS extension to MIPS32/MIPS64 */
 
 /*
@@ -16849,6 +15733,11 @@ static int decode_micromips_opc(CPUMIPSState *env, DisasContext *ctx)
     return 2;
 }
 
+/* ISA extensions (ASEs) */
+
+/* MIPS16 extension to MIPS32 */
+#include "mips16e_translate.c.inc"
+
 /*
  *
  * nanoMIPS opcodes
@@ -25491,7 +24380,7 @@ static void mips_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         insn_bytes = decode_micromips_opc(env, ctx);
     } else if (ctx->insn_flags & ASE_MIPS16) {
         ctx->opcode = translator_lduw(env, ctx->base.pc_next);
-        insn_bytes = decode_mips16_opc(env, ctx);
+        insn_bytes = decode_ase_mips16e(env, ctx);
     } else {
         gen_reserved_instruction(ctx);
         g_assert(ctx->base.is_jmp == DISAS_NORETURN);
diff --git a/target/mips/tcg/mips16e_translate.c.inc b/target/mips/tcg/mips16e_translate.c.inc
new file mode 100644
index 00000000000..54071813f12
--- /dev/null
+++ b/target/mips/tcg/mips16e_translate.c.inc
@@ -0,0 +1,1123 @@
+/*
+ *  MIPS16 extension (Code Compaction) ASE translation routines
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *  Copyright (c) 2006 Marius Groeger (FPU operations)
+ *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
+ *  Copyright (c) 2009 CodeSourcery (MIPS16 and microMIPS support)
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+/* MIPS16 major opcodes */
+enum {
+  M16_OPC_ADDIUSP = 0x00,
+  M16_OPC_ADDIUPC = 0x01,
+  M16_OPC_B = 0x02,
+  M16_OPC_JAL = 0x03,
+  M16_OPC_BEQZ = 0x04,
+  M16_OPC_BNEQZ = 0x05,
+  M16_OPC_SHIFT = 0x06,
+  M16_OPC_LD = 0x07,
+  M16_OPC_RRIA = 0x08,
+  M16_OPC_ADDIU8 = 0x09,
+  M16_OPC_SLTI = 0x0a,
+  M16_OPC_SLTIU = 0x0b,
+  M16_OPC_I8 = 0x0c,
+  M16_OPC_LI = 0x0d,
+  M16_OPC_CMPI = 0x0e,
+  M16_OPC_SD = 0x0f,
+  M16_OPC_LB = 0x10,
+  M16_OPC_LH = 0x11,
+  M16_OPC_LWSP = 0x12,
+  M16_OPC_LW = 0x13,
+  M16_OPC_LBU = 0x14,
+  M16_OPC_LHU = 0x15,
+  M16_OPC_LWPC = 0x16,
+  M16_OPC_LWU = 0x17,
+  M16_OPC_SB = 0x18,
+  M16_OPC_SH = 0x19,
+  M16_OPC_SWSP = 0x1a,
+  M16_OPC_SW = 0x1b,
+  M16_OPC_RRR = 0x1c,
+  M16_OPC_RR = 0x1d,
+  M16_OPC_EXTEND = 0x1e,
+  M16_OPC_I64 = 0x1f
+};
+
+/* I8 funct field */
+enum {
+  I8_BTEQZ = 0x0,
+  I8_BTNEZ = 0x1,
+  I8_SWRASP = 0x2,
+  I8_ADJSP = 0x3,
+  I8_SVRS = 0x4,
+  I8_MOV32R = 0x5,
+  I8_MOVR32 = 0x7
+};
+
+/* RRR f field */
+enum {
+  RRR_DADDU = 0x0,
+  RRR_ADDU = 0x1,
+  RRR_DSUBU = 0x2,
+  RRR_SUBU = 0x3
+};
+
+/* RR funct field */
+enum {
+  RR_JR = 0x00,
+  RR_SDBBP = 0x01,
+  RR_SLT = 0x02,
+  RR_SLTU = 0x03,
+  RR_SLLV = 0x04,
+  RR_BREAK = 0x05,
+  RR_SRLV = 0x06,
+  RR_SRAV = 0x07,
+  RR_DSRL = 0x08,
+  RR_CMP = 0x0a,
+  RR_NEG = 0x0b,
+  RR_AND = 0x0c,
+  RR_OR = 0x0d,
+  RR_XOR = 0x0e,
+  RR_NOT = 0x0f,
+  RR_MFHI = 0x10,
+  RR_CNVT = 0x11,
+  RR_MFLO = 0x12,
+  RR_DSRA = 0x13,
+  RR_DSLLV = 0x14,
+  RR_DSRLV = 0x16,
+  RR_DSRAV = 0x17,
+  RR_MULT = 0x18,
+  RR_MULTU = 0x19,
+  RR_DIV = 0x1a,
+  RR_DIVU = 0x1b,
+  RR_DMULT = 0x1c,
+  RR_DMULTU = 0x1d,
+  RR_DDIV = 0x1e,
+  RR_DDIVU = 0x1f
+};
+
+/* I64 funct field */
+enum {
+  I64_LDSP = 0x0,
+  I64_SDSP = 0x1,
+  I64_SDRASP = 0x2,
+  I64_DADJSP = 0x3,
+  I64_LDPC = 0x4,
+  I64_DADDIU5 = 0x5,
+  I64_DADDIUPC = 0x6,
+  I64_DADDIUSP = 0x7
+};
+
+/* RR ry field for CNVT */
+enum {
+  RR_RY_CNVT_ZEB = 0x0,
+  RR_RY_CNVT_ZEH = 0x1,
+  RR_RY_CNVT_ZEW = 0x2,
+  RR_RY_CNVT_SEB = 0x4,
+  RR_RY_CNVT_SEH = 0x5,
+  RR_RY_CNVT_SEW = 0x6,
+};
+
+static int xlat(int r)
+{
+  static int map[] = { 16, 17, 2, 3, 4, 5, 6, 7 };
+
+  return map[r];
+}
+
+static void gen_mips16_save(DisasContext *ctx,
+                            int xsregs, int aregs,
+                            int do_ra, int do_s0, int do_s1,
+                            int framesize)
+{
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+    TCGv t2 = tcg_temp_new();
+    int args, astatic;
+
+    switch (aregs) {
+    case 0:
+    case 1:
+    case 2:
+    case 3:
+    case 11:
+        args = 0;
+        break;
+    case 4:
+    case 5:
+    case 6:
+    case 7:
+        args = 1;
+        break;
+    case 8:
+    case 9:
+    case 10:
+        args = 2;
+        break;
+    case 12:
+    case 13:
+        args = 3;
+        break;
+    case 14:
+        args = 4;
+        break;
+    default:
+        gen_reserved_instruction(ctx);
+        return;
+    }
+
+    switch (args) {
+    case 4:
+        gen_base_offset_addr(ctx, t0, 29, 12);
+        gen_load_gpr(t1, 7);
+        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL);
+        /* Fall through */
+    case 3:
+        gen_base_offset_addr(ctx, t0, 29, 8);
+        gen_load_gpr(t1, 6);
+        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL);
+        /* Fall through */
+    case 2:
+        gen_base_offset_addr(ctx, t0, 29, 4);
+        gen_load_gpr(t1, 5);
+        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL);
+        /* Fall through */
+    case 1:
+        gen_base_offset_addr(ctx, t0, 29, 0);
+        gen_load_gpr(t1, 4);
+        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL);
+    }
+
+    gen_load_gpr(t0, 29);
+
+#define DECR_AND_STORE(reg) do {                                 \
+        tcg_gen_movi_tl(t2, -4);                                 \
+        gen_op_addr_add(ctx, t0, t0, t2);                        \
+        gen_load_gpr(t1, reg);                                   \
+        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL); \
+    } while (0)
+
+    if (do_ra) {
+        DECR_AND_STORE(31);
+    }
+
+    switch (xsregs) {
+    case 7:
+        DECR_AND_STORE(30);
+        /* Fall through */
+    case 6:
+        DECR_AND_STORE(23);
+        /* Fall through */
+    case 5:
+        DECR_AND_STORE(22);
+        /* Fall through */
+    case 4:
+        DECR_AND_STORE(21);
+        /* Fall through */
+    case 3:
+        DECR_AND_STORE(20);
+        /* Fall through */
+    case 2:
+        DECR_AND_STORE(19);
+        /* Fall through */
+    case 1:
+        DECR_AND_STORE(18);
+    }
+
+    if (do_s1) {
+        DECR_AND_STORE(17);
+    }
+    if (do_s0) {
+        DECR_AND_STORE(16);
+    }
+
+    switch (aregs) {
+    case 0:
+    case 4:
+    case 8:
+    case 12:
+    case 14:
+        astatic = 0;
+        break;
+    case 1:
+    case 5:
+    case 9:
+    case 13:
+        astatic = 1;
+        break;
+    case 2:
+    case 6:
+    case 10:
+        astatic = 2;
+        break;
+    case 3:
+    case 7:
+        astatic = 3;
+        break;
+    case 11:
+        astatic = 4;
+        break;
+    default:
+        gen_reserved_instruction(ctx);
+        return;
+    }
+
+    if (astatic > 0) {
+        DECR_AND_STORE(7);
+        if (astatic > 1) {
+            DECR_AND_STORE(6);
+            if (astatic > 2) {
+                DECR_AND_STORE(5);
+                if (astatic > 3) {
+                    DECR_AND_STORE(4);
+                }
+            }
+        }
+    }
+#undef DECR_AND_STORE
+
+    tcg_gen_movi_tl(t2, -framesize);
+    gen_op_addr_add(ctx, cpu_gpr[29], cpu_gpr[29], t2);
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+}
+
+static void gen_mips16_restore(DisasContext *ctx,
+                               int xsregs, int aregs,
+                               int do_ra, int do_s0, int do_s1,
+                               int framesize)
+{
+    int astatic;
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+    TCGv t2 = tcg_temp_new();
+
+    tcg_gen_movi_tl(t2, framesize);
+    gen_op_addr_add(ctx, t0, cpu_gpr[29], t2);
+
+#define DECR_AND_LOAD(reg) do {                            \
+        tcg_gen_movi_tl(t2, -4);                           \
+        gen_op_addr_add(ctx, t0, t0, t2);                  \
+        tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TESL); \
+        gen_store_gpr(t1, reg);                            \
+    } while (0)
+
+    if (do_ra) {
+        DECR_AND_LOAD(31);
+    }
+
+    switch (xsregs) {
+    case 7:
+        DECR_AND_LOAD(30);
+        /* Fall through */
+    case 6:
+        DECR_AND_LOAD(23);
+        /* Fall through */
+    case 5:
+        DECR_AND_LOAD(22);
+        /* Fall through */
+    case 4:
+        DECR_AND_LOAD(21);
+        /* Fall through */
+    case 3:
+        DECR_AND_LOAD(20);
+        /* Fall through */
+    case 2:
+        DECR_AND_LOAD(19);
+        /* Fall through */
+    case 1:
+        DECR_AND_LOAD(18);
+    }
+
+    if (do_s1) {
+        DECR_AND_LOAD(17);
+    }
+    if (do_s0) {
+        DECR_AND_LOAD(16);
+    }
+
+    switch (aregs) {
+    case 0:
+    case 4:
+    case 8:
+    case 12:
+    case 14:
+        astatic = 0;
+        break;
+    case 1:
+    case 5:
+    case 9:
+    case 13:
+        astatic = 1;
+        break;
+    case 2:
+    case 6:
+    case 10:
+        astatic = 2;
+        break;
+    case 3:
+    case 7:
+        astatic = 3;
+        break;
+    case 11:
+        astatic = 4;
+        break;
+    default:
+        gen_reserved_instruction(ctx);
+        return;
+    }
+
+    if (astatic > 0) {
+        DECR_AND_LOAD(7);
+        if (astatic > 1) {
+            DECR_AND_LOAD(6);
+            if (astatic > 2) {
+                DECR_AND_LOAD(5);
+                if (astatic > 3) {
+                    DECR_AND_LOAD(4);
+                }
+            }
+        }
+    }
+#undef DECR_AND_LOAD
+
+    tcg_gen_movi_tl(t2, framesize);
+    gen_op_addr_add(ctx, cpu_gpr[29], cpu_gpr[29], t2);
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+}
+
+#if defined(TARGET_MIPS64)
+static void decode_i64_mips16(DisasContext *ctx,
+                              int ry, int funct, int16_t offset,
+                              int extended)
+{
+    switch (funct) {
+    case I64_LDSP:
+        check_insn(ctx, ISA_MIPS3);
+        check_mips_64(ctx);
+        offset = extended ? offset : offset << 3;
+        gen_ld(ctx, OPC_LD, ry, 29, offset);
+        break;
+    case I64_SDSP:
+        check_insn(ctx, ISA_MIPS3);
+        check_mips_64(ctx);
+        offset = extended ? offset : offset << 3;
+        gen_st(ctx, OPC_SD, ry, 29, offset);
+        break;
+    case I64_SDRASP:
+        check_insn(ctx, ISA_MIPS3);
+        check_mips_64(ctx);
+        offset = extended ? offset : (ctx->opcode & 0xff) << 3;
+        gen_st(ctx, OPC_SD, 31, 29, offset);
+        break;
+    case I64_DADJSP:
+        check_insn(ctx, ISA_MIPS3);
+        check_mips_64(ctx);
+        offset = extended ? offset : ((int8_t)ctx->opcode) << 3;
+        gen_arith_imm(ctx, OPC_DADDIU, 29, 29, offset);
+        break;
+    case I64_LDPC:
+        check_insn(ctx, ISA_MIPS3);
+        check_mips_64(ctx);
+        if (extended && (ctx->hflags & MIPS_HFLAG_BMASK)) {
+            gen_reserved_instruction(ctx);
+        } else {
+            offset = extended ? offset : offset << 3;
+            gen_ld(ctx, OPC_LDPC, ry, 0, offset);
+        }
+        break;
+    case I64_DADDIU5:
+        check_insn(ctx, ISA_MIPS3);
+        check_mips_64(ctx);
+        offset = extended ? offset : ((int8_t)(offset << 3)) >> 3;
+        gen_arith_imm(ctx, OPC_DADDIU, ry, ry, offset);
+        break;
+    case I64_DADDIUPC:
+        check_insn(ctx, ISA_MIPS3);
+        check_mips_64(ctx);
+        offset = extended ? offset : offset << 2;
+        gen_addiupc(ctx, ry, offset, 1, extended);
+        break;
+    case I64_DADDIUSP:
+        check_insn(ctx, ISA_MIPS3);
+        check_mips_64(ctx);
+        offset = extended ? offset : offset << 2;
+        gen_arith_imm(ctx, OPC_DADDIU, ry, 29, offset);
+        break;
+    }
+}
+#endif
+
+static int decode_extended_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
+{
+    int extend = translator_lduw(env, ctx->base.pc_next + 2);
+    int op, rx, ry, funct, sa;
+    int16_t imm, offset;
+
+    ctx->opcode = (ctx->opcode << 16) | extend;
+    op = (ctx->opcode >> 11) & 0x1f;
+    sa = (ctx->opcode >> 22) & 0x1f;
+    funct = (ctx->opcode >> 8) & 0x7;
+    rx = xlat((ctx->opcode >> 8) & 0x7);
+    ry = xlat((ctx->opcode >> 5) & 0x7);
+    offset = imm = (int16_t) (((ctx->opcode >> 16) & 0x1f) << 11
+                              | ((ctx->opcode >> 21) & 0x3f) << 5
+                              | (ctx->opcode & 0x1f));
+
+    /*
+     * The extended opcodes cleverly reuse the opcodes from their 16-bit
+     * counterparts.
+     */
+    switch (op) {
+    case M16_OPC_ADDIUSP:
+        gen_arith_imm(ctx, OPC_ADDIU, rx, 29, imm);
+        break;
+    case M16_OPC_ADDIUPC:
+        gen_addiupc(ctx, rx, imm, 0, 1);
+        break;
+    case M16_OPC_B:
+        gen_compute_branch(ctx, OPC_BEQ, 4, 0, 0, offset << 1, 0);
+        /* No delay slot, so just process as a normal instruction */
+        break;
+    case M16_OPC_BEQZ:
+        gen_compute_branch(ctx, OPC_BEQ, 4, rx, 0, offset << 1, 0);
+        /* No delay slot, so just process as a normal instruction */
+        break;
+    case M16_OPC_BNEQZ:
+        gen_compute_branch(ctx, OPC_BNE, 4, rx, 0, offset << 1, 0);
+        /* No delay slot, so just process as a normal instruction */
+        break;
+    case M16_OPC_SHIFT:
+        switch (ctx->opcode & 0x3) {
+        case 0x0:
+            gen_shift_imm(ctx, OPC_SLL, rx, ry, sa);
+            break;
+        case 0x1:
+#if defined(TARGET_MIPS64)
+            check_mips_64(ctx);
+            gen_shift_imm(ctx, OPC_DSLL, rx, ry, sa);
+#else
+            gen_reserved_instruction(ctx);
+#endif
+            break;
+        case 0x2:
+            gen_shift_imm(ctx, OPC_SRL, rx, ry, sa);
+            break;
+        case 0x3:
+            gen_shift_imm(ctx, OPC_SRA, rx, ry, sa);
+            break;
+        }
+        break;
+#if defined(TARGET_MIPS64)
+    case M16_OPC_LD:
+        check_insn(ctx, ISA_MIPS3);
+        check_mips_64(ctx);
+        gen_ld(ctx, OPC_LD, ry, rx, offset);
+        break;
+#endif
+    case M16_OPC_RRIA:
+        imm = ctx->opcode & 0xf;
+        imm = imm | ((ctx->opcode >> 20) & 0x7f) << 4;
+        imm = imm | ((ctx->opcode >> 16) & 0xf) << 11;
+        imm = (int16_t) (imm << 1) >> 1;
+        if ((ctx->opcode >> 4) & 0x1) {
+#if defined(TARGET_MIPS64)
+            check_mips_64(ctx);
+            gen_arith_imm(ctx, OPC_DADDIU, ry, rx, imm);
+#else
+            gen_reserved_instruction(ctx);
+#endif
+        } else {
+            gen_arith_imm(ctx, OPC_ADDIU, ry, rx, imm);
+        }
+        break;
+    case M16_OPC_ADDIU8:
+        gen_arith_imm(ctx, OPC_ADDIU, rx, rx, imm);
+        break;
+    case M16_OPC_SLTI:
+        gen_slt_imm(ctx, OPC_SLTI, 24, rx, imm);
+        break;
+    case M16_OPC_SLTIU:
+        gen_slt_imm(ctx, OPC_SLTIU, 24, rx, imm);
+        break;
+    case M16_OPC_I8:
+        switch (funct) {
+        case I8_BTEQZ:
+            gen_compute_branch(ctx, OPC_BEQ, 4, 24, 0, offset << 1, 0);
+            break;
+        case I8_BTNEZ:
+            gen_compute_branch(ctx, OPC_BNE, 4, 24, 0, offset << 1, 0);
+            break;
+        case I8_SWRASP:
+            gen_st(ctx, OPC_SW, 31, 29, imm);
+            break;
+        case I8_ADJSP:
+            gen_arith_imm(ctx, OPC_ADDIU, 29, 29, imm);
+            break;
+        case I8_SVRS:
+            check_insn(ctx, ISA_MIPS_R1);
+            {
+                int xsregs = (ctx->opcode >> 24) & 0x7;
+                int aregs = (ctx->opcode >> 16) & 0xf;
+                int do_ra = (ctx->opcode >> 6) & 0x1;
+                int do_s0 = (ctx->opcode >> 5) & 0x1;
+                int do_s1 = (ctx->opcode >> 4) & 0x1;
+                int framesize = (((ctx->opcode >> 20) & 0xf) << 4
+                                 | (ctx->opcode & 0xf)) << 3;
+
+                if (ctx->opcode & (1 << 7)) {
+                    gen_mips16_save(ctx, xsregs, aregs,
+                                    do_ra, do_s0, do_s1,
+                                    framesize);
+                } else {
+                    gen_mips16_restore(ctx, xsregs, aregs,
+                                       do_ra, do_s0, do_s1,
+                                       framesize);
+                }
+            }
+            break;
+        default:
+            gen_reserved_instruction(ctx);
+            break;
+        }
+        break;
+    case M16_OPC_LI:
+        tcg_gen_movi_tl(cpu_gpr[rx], (uint16_t) imm);
+        break;
+    case M16_OPC_CMPI:
+        tcg_gen_xori_tl(cpu_gpr[24], cpu_gpr[rx], (uint16_t) imm);
+        break;
+#if defined(TARGET_MIPS64)
+    case M16_OPC_SD:
+        check_insn(ctx, ISA_MIPS3);
+        check_mips_64(ctx);
+        gen_st(ctx, OPC_SD, ry, rx, offset);
+        break;
+#endif
+    case M16_OPC_LB:
+        gen_ld(ctx, OPC_LB, ry, rx, offset);
+        break;
+    case M16_OPC_LH:
+        gen_ld(ctx, OPC_LH, ry, rx, offset);
+        break;
+    case M16_OPC_LWSP:
+        gen_ld(ctx, OPC_LW, rx, 29, offset);
+        break;
+    case M16_OPC_LW:
+        gen_ld(ctx, OPC_LW, ry, rx, offset);
+        break;
+    case M16_OPC_LBU:
+        gen_ld(ctx, OPC_LBU, ry, rx, offset);
+        break;
+    case M16_OPC_LHU:
+        gen_ld(ctx, OPC_LHU, ry, rx, offset);
+        break;
+    case M16_OPC_LWPC:
+        gen_ld(ctx, OPC_LWPC, rx, 0, offset);
+        break;
+#if defined(TARGET_MIPS64)
+    case M16_OPC_LWU:
+        check_insn(ctx, ISA_MIPS3);
+        check_mips_64(ctx);
+        gen_ld(ctx, OPC_LWU, ry, rx, offset);
+        break;
+#endif
+    case M16_OPC_SB:
+        gen_st(ctx, OPC_SB, ry, rx, offset);
+        break;
+    case M16_OPC_SH:
+        gen_st(ctx, OPC_SH, ry, rx, offset);
+        break;
+    case M16_OPC_SWSP:
+        gen_st(ctx, OPC_SW, rx, 29, offset);
+        break;
+    case M16_OPC_SW:
+        gen_st(ctx, OPC_SW, ry, rx, offset);
+        break;
+#if defined(TARGET_MIPS64)
+    case M16_OPC_I64:
+        decode_i64_mips16(ctx, ry, funct, offset, 1);
+        break;
+#endif
+    default:
+        gen_reserved_instruction(ctx);
+        break;
+    }
+
+    return 4;
+}
+
+static int decode_ase_mips16e(CPUMIPSState *env, DisasContext *ctx)
+{
+    int rx, ry;
+    int sa;
+    int op, cnvt_op, op1, offset;
+    int funct;
+    int n_bytes;
+
+    op = (ctx->opcode >> 11) & 0x1f;
+    sa = (ctx->opcode >> 2) & 0x7;
+    sa = sa == 0 ? 8 : sa;
+    rx = xlat((ctx->opcode >> 8) & 0x7);
+    cnvt_op = (ctx->opcode >> 5) & 0x7;
+    ry = xlat((ctx->opcode >> 5) & 0x7);
+    op1 = offset = ctx->opcode & 0x1f;
+
+    n_bytes = 2;
+
+    switch (op) {
+    case M16_OPC_ADDIUSP:
+        {
+            int16_t imm = ((uint8_t) ctx->opcode) << 2;
+
+            gen_arith_imm(ctx, OPC_ADDIU, rx, 29, imm);
+        }
+        break;
+    case M16_OPC_ADDIUPC:
+        gen_addiupc(ctx, rx, ((uint8_t) ctx->opcode) << 2, 0, 0);
+        break;
+    case M16_OPC_B:
+        offset = (ctx->opcode & 0x7ff) << 1;
+        offset = (int16_t)(offset << 4) >> 4;
+        gen_compute_branch(ctx, OPC_BEQ, 2, 0, 0, offset, 0);
+        /* No delay slot, so just process as a normal instruction */
+        break;
+    case M16_OPC_JAL:
+        offset = translator_lduw(env, ctx->base.pc_next + 2);
+        offset = (((ctx->opcode & 0x1f) << 21)
+                  | ((ctx->opcode >> 5) & 0x1f) << 16
+                  | offset) << 2;
+        op = ((ctx->opcode >> 10) & 0x1) ? OPC_JALX : OPC_JAL;
+        gen_compute_branch(ctx, op, 4, rx, ry, offset, 2);
+        n_bytes = 4;
+        break;
+    case M16_OPC_BEQZ:
+        gen_compute_branch(ctx, OPC_BEQ, 2, rx, 0,
+                           ((int8_t)ctx->opcode) << 1, 0);
+        /* No delay slot, so just process as a normal instruction */
+        break;
+    case M16_OPC_BNEQZ:
+        gen_compute_branch(ctx, OPC_BNE, 2, rx, 0,
+                           ((int8_t)ctx->opcode) << 1, 0);
+        /* No delay slot, so just process as a normal instruction */
+        break;
+    case M16_OPC_SHIFT:
+        switch (ctx->opcode & 0x3) {
+        case 0x0:
+            gen_shift_imm(ctx, OPC_SLL, rx, ry, sa);
+            break;
+        case 0x1:
+#if defined(TARGET_MIPS64)
+            check_insn(ctx, ISA_MIPS3);
+            check_mips_64(ctx);
+            gen_shift_imm(ctx, OPC_DSLL, rx, ry, sa);
+#else
+            gen_reserved_instruction(ctx);
+#endif
+            break;
+        case 0x2:
+            gen_shift_imm(ctx, OPC_SRL, rx, ry, sa);
+            break;
+        case 0x3:
+            gen_shift_imm(ctx, OPC_SRA, rx, ry, sa);
+            break;
+        }
+        break;
+#if defined(TARGET_MIPS64)
+    case M16_OPC_LD:
+        check_insn(ctx, ISA_MIPS3);
+        check_mips_64(ctx);
+        gen_ld(ctx, OPC_LD, ry, rx, offset << 3);
+        break;
+#endif
+    case M16_OPC_RRIA:
+        {
+            int16_t imm = (int8_t)((ctx->opcode & 0xf) << 4) >> 4;
+
+            if ((ctx->opcode >> 4) & 1) {
+#if defined(TARGET_MIPS64)
+                check_insn(ctx, ISA_MIPS3);
+                check_mips_64(ctx);
+                gen_arith_imm(ctx, OPC_DADDIU, ry, rx, imm);
+#else
+                gen_reserved_instruction(ctx);
+#endif
+            } else {
+                gen_arith_imm(ctx, OPC_ADDIU, ry, rx, imm);
+            }
+        }
+        break;
+    case M16_OPC_ADDIU8:
+        {
+            int16_t imm = (int8_t) ctx->opcode;
+
+            gen_arith_imm(ctx, OPC_ADDIU, rx, rx, imm);
+        }
+        break;
+    case M16_OPC_SLTI:
+        {
+            int16_t imm = (uint8_t) ctx->opcode;
+            gen_slt_imm(ctx, OPC_SLTI, 24, rx, imm);
+        }
+        break;
+    case M16_OPC_SLTIU:
+        {
+            int16_t imm = (uint8_t) ctx->opcode;
+            gen_slt_imm(ctx, OPC_SLTIU, 24, rx, imm);
+        }
+        break;
+    case M16_OPC_I8:
+        {
+            int reg32;
+
+            funct = (ctx->opcode >> 8) & 0x7;
+            switch (funct) {
+            case I8_BTEQZ:
+                gen_compute_branch(ctx, OPC_BEQ, 2, 24, 0,
+                                   ((int8_t)ctx->opcode) << 1, 0);
+                break;
+            case I8_BTNEZ:
+                gen_compute_branch(ctx, OPC_BNE, 2, 24, 0,
+                                   ((int8_t)ctx->opcode) << 1, 0);
+                break;
+            case I8_SWRASP:
+                gen_st(ctx, OPC_SW, 31, 29, (ctx->opcode & 0xff) << 2);
+                break;
+            case I8_ADJSP:
+                gen_arith_imm(ctx, OPC_ADDIU, 29, 29,
+                              ((int8_t)ctx->opcode) << 3);
+                break;
+            case I8_SVRS:
+                check_insn(ctx, ISA_MIPS_R1);
+                {
+                    int do_ra = ctx->opcode & (1 << 6);
+                    int do_s0 = ctx->opcode & (1 << 5);
+                    int do_s1 = ctx->opcode & (1 << 4);
+                    int framesize = ctx->opcode & 0xf;
+
+                    if (framesize == 0) {
+                        framesize = 128;
+                    } else {
+                        framesize = framesize << 3;
+                    }
+
+                    if (ctx->opcode & (1 << 7)) {
+                        gen_mips16_save(ctx, 0, 0,
+                                        do_ra, do_s0, do_s1, framesize);
+                    } else {
+                        gen_mips16_restore(ctx, 0, 0,
+                                           do_ra, do_s0, do_s1, framesize);
+                    }
+                }
+                break;
+            case I8_MOV32R:
+                {
+                    int rz = xlat(ctx->opcode & 0x7);
+
+                    reg32 = (((ctx->opcode >> 3) & 0x3) << 3) |
+                        ((ctx->opcode >> 5) & 0x7);
+                    gen_arith(ctx, OPC_ADDU, reg32, rz, 0);
+                }
+                break;
+            case I8_MOVR32:
+                reg32 = ctx->opcode & 0x1f;
+                gen_arith(ctx, OPC_ADDU, ry, reg32, 0);
+                break;
+            default:
+                gen_reserved_instruction(ctx);
+                break;
+            }
+        }
+        break;
+    case M16_OPC_LI:
+        {
+            int16_t imm = (uint8_t) ctx->opcode;
+
+            gen_arith_imm(ctx, OPC_ADDIU, rx, 0, imm);
+        }
+        break;
+    case M16_OPC_CMPI:
+        {
+            int16_t imm = (uint8_t) ctx->opcode;
+            gen_logic_imm(ctx, OPC_XORI, 24, rx, imm);
+        }
+        break;
+#if defined(TARGET_MIPS64)
+    case M16_OPC_SD:
+        check_insn(ctx, ISA_MIPS3);
+        check_mips_64(ctx);
+        gen_st(ctx, OPC_SD, ry, rx, offset << 3);
+        break;
+#endif
+    case M16_OPC_LB:
+        gen_ld(ctx, OPC_LB, ry, rx, offset);
+        break;
+    case M16_OPC_LH:
+        gen_ld(ctx, OPC_LH, ry, rx, offset << 1);
+        break;
+    case M16_OPC_LWSP:
+        gen_ld(ctx, OPC_LW, rx, 29, ((uint8_t)ctx->opcode) << 2);
+        break;
+    case M16_OPC_LW:
+        gen_ld(ctx, OPC_LW, ry, rx, offset << 2);
+        break;
+    case M16_OPC_LBU:
+        gen_ld(ctx, OPC_LBU, ry, rx, offset);
+        break;
+    case M16_OPC_LHU:
+        gen_ld(ctx, OPC_LHU, ry, rx, offset << 1);
+        break;
+    case M16_OPC_LWPC:
+        gen_ld(ctx, OPC_LWPC, rx, 0, ((uint8_t)ctx->opcode) << 2);
+        break;
+#if defined(TARGET_MIPS64)
+    case M16_OPC_LWU:
+        check_insn(ctx, ISA_MIPS3);
+        check_mips_64(ctx);
+        gen_ld(ctx, OPC_LWU, ry, rx, offset << 2);
+        break;
+#endif
+    case M16_OPC_SB:
+        gen_st(ctx, OPC_SB, ry, rx, offset);
+        break;
+    case M16_OPC_SH:
+        gen_st(ctx, OPC_SH, ry, rx, offset << 1);
+        break;
+    case M16_OPC_SWSP:
+        gen_st(ctx, OPC_SW, rx, 29, ((uint8_t)ctx->opcode) << 2);
+        break;
+    case M16_OPC_SW:
+        gen_st(ctx, OPC_SW, ry, rx, offset << 2);
+        break;
+    case M16_OPC_RRR:
+        {
+            int rz = xlat((ctx->opcode >> 2) & 0x7);
+            int mips32_op;
+
+            switch (ctx->opcode & 0x3) {
+            case RRR_ADDU:
+                mips32_op = OPC_ADDU;
+                break;
+            case RRR_SUBU:
+                mips32_op = OPC_SUBU;
+                break;
+#if defined(TARGET_MIPS64)
+            case RRR_DADDU:
+                mips32_op = OPC_DADDU;
+                check_insn(ctx, ISA_MIPS3);
+                check_mips_64(ctx);
+                break;
+            case RRR_DSUBU:
+                mips32_op = OPC_DSUBU;
+                check_insn(ctx, ISA_MIPS3);
+                check_mips_64(ctx);
+                break;
+#endif
+            default:
+                gen_reserved_instruction(ctx);
+                goto done;
+            }
+
+            gen_arith(ctx, mips32_op, rz, rx, ry);
+        done:
+            ;
+        }
+        break;
+    case M16_OPC_RR:
+        switch (op1) {
+        case RR_JR:
+            {
+                int nd = (ctx->opcode >> 7) & 0x1;
+                int link = (ctx->opcode >> 6) & 0x1;
+                int ra = (ctx->opcode >> 5) & 0x1;
+
+                if (nd) {
+                    check_insn(ctx, ISA_MIPS_R1);
+                }
+
+                if (link) {
+                    op = OPC_JALR;
+                } else {
+                    op = OPC_JR;
+                }
+
+                gen_compute_branch(ctx, op, 2, ra ? 31 : rx, 31, 0,
+                                   (nd ? 0 : 2));
+            }
+            break;
+        case RR_SDBBP:
+            if (is_uhi(extract32(ctx->opcode, 5, 6))) {
+                gen_helper_do_semihosting(cpu_env);
+            } else {
+                /*
+                 * XXX: not clear which exception should be raised
+                 *      when in debug mode...
+                 */
+                check_insn(ctx, ISA_MIPS_R1);
+                generate_exception_end(ctx, EXCP_DBp);
+            }
+            break;
+        case RR_SLT:
+            gen_slt(ctx, OPC_SLT, 24, rx, ry);
+            break;
+        case RR_SLTU:
+            gen_slt(ctx, OPC_SLTU, 24, rx, ry);
+            break;
+        case RR_BREAK:
+            generate_exception_end(ctx, EXCP_BREAK);
+            break;
+        case RR_SLLV:
+            gen_shift(ctx, OPC_SLLV, ry, rx, ry);
+            break;
+        case RR_SRLV:
+            gen_shift(ctx, OPC_SRLV, ry, rx, ry);
+            break;
+        case RR_SRAV:
+            gen_shift(ctx, OPC_SRAV, ry, rx, ry);
+            break;
+#if defined(TARGET_MIPS64)
+        case RR_DSRL:
+            check_insn(ctx, ISA_MIPS3);
+            check_mips_64(ctx);
+            gen_shift_imm(ctx, OPC_DSRL, ry, ry, sa);
+            break;
+#endif
+        case RR_CMP:
+            gen_logic(ctx, OPC_XOR, 24, rx, ry);
+            break;
+        case RR_NEG:
+            gen_arith(ctx, OPC_SUBU, rx, 0, ry);
+            break;
+        case RR_AND:
+            gen_logic(ctx, OPC_AND, rx, rx, ry);
+            break;
+        case RR_OR:
+            gen_logic(ctx, OPC_OR, rx, rx, ry);
+            break;
+        case RR_XOR:
+            gen_logic(ctx, OPC_XOR, rx, rx, ry);
+            break;
+        case RR_NOT:
+            gen_logic(ctx, OPC_NOR, rx, ry, 0);
+            break;
+        case RR_MFHI:
+            gen_HILO(ctx, OPC_MFHI, 0, rx);
+            break;
+        case RR_CNVT:
+            check_insn(ctx, ISA_MIPS_R1);
+            switch (cnvt_op) {
+            case RR_RY_CNVT_ZEB:
+                tcg_gen_ext8u_tl(cpu_gpr[rx], cpu_gpr[rx]);
+                break;
+            case RR_RY_CNVT_ZEH:
+                tcg_gen_ext16u_tl(cpu_gpr[rx], cpu_gpr[rx]);
+                break;
+            case RR_RY_CNVT_SEB:
+                tcg_gen_ext8s_tl(cpu_gpr[rx], cpu_gpr[rx]);
+                break;
+            case RR_RY_CNVT_SEH:
+                tcg_gen_ext16s_tl(cpu_gpr[rx], cpu_gpr[rx]);
+                break;
+#if defined(TARGET_MIPS64)
+            case RR_RY_CNVT_ZEW:
+                check_insn(ctx, ISA_MIPS_R1);
+                check_mips_64(ctx);
+                tcg_gen_ext32u_tl(cpu_gpr[rx], cpu_gpr[rx]);
+                break;
+            case RR_RY_CNVT_SEW:
+                check_insn(ctx, ISA_MIPS_R1);
+                check_mips_64(ctx);
+                tcg_gen_ext32s_tl(cpu_gpr[rx], cpu_gpr[rx]);
+                break;
+#endif
+            default:
+                gen_reserved_instruction(ctx);
+                break;
+            }
+            break;
+        case RR_MFLO:
+            gen_HILO(ctx, OPC_MFLO, 0, rx);
+            break;
+#if defined(TARGET_MIPS64)
+        case RR_DSRA:
+            check_insn(ctx, ISA_MIPS3);
+            check_mips_64(ctx);
+            gen_shift_imm(ctx, OPC_DSRA, ry, ry, sa);
+            break;
+        case RR_DSLLV:
+            check_insn(ctx, ISA_MIPS3);
+            check_mips_64(ctx);
+            gen_shift(ctx, OPC_DSLLV, ry, rx, ry);
+            break;
+        case RR_DSRLV:
+            check_insn(ctx, ISA_MIPS3);
+            check_mips_64(ctx);
+            gen_shift(ctx, OPC_DSRLV, ry, rx, ry);
+            break;
+        case RR_DSRAV:
+            check_insn(ctx, ISA_MIPS3);
+            check_mips_64(ctx);
+            gen_shift(ctx, OPC_DSRAV, ry, rx, ry);
+            break;
+#endif
+        case RR_MULT:
+            gen_muldiv(ctx, OPC_MULT, 0, rx, ry);
+            break;
+        case RR_MULTU:
+            gen_muldiv(ctx, OPC_MULTU, 0, rx, ry);
+            break;
+        case RR_DIV:
+            gen_muldiv(ctx, OPC_DIV, 0, rx, ry);
+            break;
+        case RR_DIVU:
+            gen_muldiv(ctx, OPC_DIVU, 0, rx, ry);
+            break;
+#if defined(TARGET_MIPS64)
+        case RR_DMULT:
+            check_insn(ctx, ISA_MIPS3);
+            check_mips_64(ctx);
+            gen_muldiv(ctx, OPC_DMULT, 0, rx, ry);
+            break;
+        case RR_DMULTU:
+            check_insn(ctx, ISA_MIPS3);
+            check_mips_64(ctx);
+            gen_muldiv(ctx, OPC_DMULTU, 0, rx, ry);
+            break;
+        case RR_DDIV:
+            check_insn(ctx, ISA_MIPS3);
+            check_mips_64(ctx);
+            gen_muldiv(ctx, OPC_DDIV, 0, rx, ry);
+            break;
+        case RR_DDIVU:
+            check_insn(ctx, ISA_MIPS3);
+            check_mips_64(ctx);
+            gen_muldiv(ctx, OPC_DDIVU, 0, rx, ry);
+            break;
+#endif
+        default:
+            gen_reserved_instruction(ctx);
+            break;
+        }
+        break;
+    case M16_OPC_EXTEND:
+        decode_extended_mips16_opc(env, ctx);
+        n_bytes = 4;
+        break;
+#if defined(TARGET_MIPS64)
+    case M16_OPC_I64:
+        funct = (ctx->opcode >> 8) & 0x7;
+        decode_i64_mips16(ctx, ry, funct, offset, 0);
+        break;
+#endif
+    default:
+        gen_reserved_instruction(ctx);
+        break;
+    }
+
+    return n_bytes;
+}
-- 
2.31.1


