Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D54A060B28F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 18:50:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omzJD-0003hf-LR; Mon, 24 Oct 2022 11:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1omzJB-0003gu-JT
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 11:24:09 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1omzJ8-0008H1-Ku
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 11:24:09 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 0BB923200645;
 Mon, 24 Oct 2022 11:24:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 24 Oct 2022 11:24:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1666625044; x=1666711444; bh=Jn
 N6ckhyHvg1hhYIM98Mcsqh5GRlzY5Jo27dbyH1B7E=; b=CUg4HRUmPaN1AbCrUH
 pFlw5Isrw+BqbfDHgF5SN7/plSYcWFbrEwKNtMmHOLWGGWNgfRYe0inZvp/V+pPj
 F7o4mfWKh7YpSOtGbRSWUydip9NmdWSfS8Iyqa+MOBcSE0RrOf1r5eeDXSVyRBUh
 bKY75w40fvwfwaUk5ompFgihhTYDeYMj6WQ8no66CYMeIYnnUFqtFRfzt5SCDBpF
 yEPOi0wNBDlXeD9NaNLEuSHNFMPrEO4HxcjMqaOF39ulPGUB+lRObnfecKFB2L6P
 4thtky5tnQ0dwm920HgHWBCKRpe/+1ASyBii1ty/RQwgu6hHVubztEEspsPEtQIi
 /jsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1666625044; x=1666711444; bh=JnN6ckhyHvg1h
 hYIM98Mcsqh5GRlzY5Jo27dbyH1B7E=; b=czO//2p7u1UMfLCifTFgJfquESf2M
 KyNkirJpnVIkjRDX3PLi0tkJozaYnCkEt3ObvPHF2GgRG+OyfeaDmlfRyliiirQG
 afzE1DN4eErvP+hBo+XfRMmA8fSYVG2Z9IncKksoz0S1oD04SoCWN+brQcBk9wfr
 HBHmaHhplrLHT2jjj9it7hkngRwBmbg9kFTCKjgAbOdHmc5mq+Jytp3h5RKxXw6b
 Hhi6BWxKIcSX7vZgLsGDUjOHxJhwuF0UsqcOuGhKuenwJq4VGdgvdTcIDA3kpZrv
 TzzI4NbypXsGei8IcmzL9NUIWDOTFpKCJPjOMOvJowUfFlT7ym161M8KQ==
X-ME-Sender: <xms:FK5WY2M9n0gt-ILMy5-RXQgbtxf0Ha0Yy8wziCV7D97SRPQH2x3Vpw>
 <xme:FK5WY08xLraeR3vpW-TsH_yj6pG6-XA4IZoMZcgAZEVraWevnOFS_4ni7b6tFozPy
 XcRz8vic5MfPVAC-00>
X-ME-Received: <xmr:FK5WY9RQLAA-mpeBBADCMPGgBqVF6kjVLOOQ5-8PQMRHiCwYxMOO15MHxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtgedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
 ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
 dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
 hgohgrthdrtghomh
X-ME-Proxy: <xmx:FK5WY2tO0IMzt846YfwdSTOn4zuyWr9QNIMUFmFkeh1koRUEQYv6Ig>
 <xmx:FK5WY-dJDZfasQzciN0u5de8Fq79YATEh-G2bcVXQNwh8oMWHEikgg>
 <xmx:FK5WY62d6DTq5N8X11XFfvGhP5hb1awS95sORoGlHcws1SaMw94qOA>
 <xmx:FK5WY_oMy50fkL37-6KkS8Ocl8CTjZfX3usQvd2qXKNEGf5WFdFu9g>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Oct 2022 11:24:03 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, richard.henderson@linaro.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 5/6] target/mips: Move all tx79 instructions to decodetree
Date: Mon, 24 Oct 2022 16:23:48 +0100
Message-Id: <20221024152349.215135-6-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024152349.215135-1-jiaxun.yang@flygoat.com>
References: <20221024152349.215135-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Move MUL family instructions into decodetree.
Also implement RDHWR emulation for user instructions in decodetree
SQ translation.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 target/mips/tcg/translate.c      | 410 +------------------------------
 target/mips/tcg/tx79.decode      |  14 ++
 target/mips/tcg/tx79_translate.c | 205 +++++++++++++++-
 3 files changed, 219 insertions(+), 410 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index d398b2f44d..c8a3f63203 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -956,82 +956,6 @@ enum {
     OPC_NMSUB_PS    = 0x3E | OPC_CP3,
 };
 
-/*
- *     MMI (MultiMedia Instruction) encodings
- *     ======================================
- *
- * MMI instructions encoding table keys:
- *
- *     *   This code is reserved for future use. An attempt to execute it
- *         causes a Reserved Instruction exception.
- *     %   This code indicates an instruction class. The instruction word
- *         must be further decoded by examining additional tables that show
- *         the values for other instruction fields.
- *     #   This code is reserved for the unsupported instructions DMULT,
- *         DMULTU, DDIV, DDIVU, LL, LLD, SC, SCD, LWC2 and SWC2. An attempt
- *         to execute it causes a Reserved Instruction exception.
- *
- * MMI instructions encoded by opcode field (MMI, LQ, SQ):
- *
- *  31    26                                        0
- * +--------+----------------------------------------+
- * | opcode |                                        |
- * +--------+----------------------------------------+
- *
- *   opcode  bits 28..26
- *     bits |   0   |   1   |   2   |   3   |   4   |   5   |   6   |   7
- *   31..29 |  000  |  001  |  010  |  011  |  100  |  101  |  110  |  111
- *   -------+-------+-------+-------+-------+-------+-------+-------+-------
- *    0 000 |SPECIAL| REGIMM|   J   |  JAL  |  BEQ  |  BNE  |  BLEZ |  BGTZ
- *    1 001 |  ADDI | ADDIU |  SLTI | SLTIU |  ANDI |  ORI  |  XORI |  LUI
- *    2 010 |  COP0 |  COP1 |   *   |   *   |  BEQL |  BNEL | BLEZL | BGTZL
- *    3 011 | DADDI | DADDIU|  LDL  |  LDR  |  MMI% |   *   |   LQ  |   SQ
- *    4 100 |   LB  |   LH  |  LWL  |   LW  |  LBU  |  LHU  |  LWR  |  LWU
- *    5 101 |   SB  |   SH  |  SWL  |   SW  |  SDL  |  SDR  |  SWR  | CACHE
- *    6 110 |   #   |  LWC1 |   #   |  PREF |   #   |  LDC1 |   #   |   LD
- *    7 111 |   #   |  SWC1 |   #   |   *   |   #   |  SDC1 |   #   |   SD
- */
-
-enum {
-    MMI_OPC_CLASS_MMI = 0x1C << 26,    /* Same as OPC_SPECIAL2 */
-    MMI_OPC_SQ        = 0x1F << 26,    /* Same as OPC_SPECIAL3 */
-};
-
-/*
- * MMI instructions with opcode field = MMI:
- *
- *  31    26                                 5      0
- * +--------+-------------------------------+--------+
- * |   MMI  |                               |function|
- * +--------+-------------------------------+--------+
- *
- * function  bits 2..0
- *     bits |   0   |   1   |   2   |   3   |   4   |   5   |   6   |   7
- *     5..3 |  000  |  001  |  010  |  011  |  100  |  101  |  110  |  111
- *   -------+-------+-------+-------+-------+-------+-------+-------+-------
- *    0 000 |  MADD | MADDU |   *   |   *   | PLZCW |   *   |   *   |   *
- *    1 001 | MMI0% | MMI2% |   *   |   *   |   *   |   *   |   *   |   *
- *    2 010 | MFHI1 | MTHI1 | MFLO1 | MTLO1 |   *   |   *   |   *   |   *
- *    3 011 | MULT1 | MULTU1|  DIV1 | DIVU1 |   *   |   *   |   *   |   *
- *    4 100 | MADD1 | MADDU1|   *   |   *   |   *   |   *   |   *   |   *
- *    5 101 | MMI1% | MMI3% |   *   |   *   |   *   |   *   |   *   |   *
- *    6 110 | PMFHL | PMTHL |   *   |   *   | PSLLH |   *   | PSRLH | PSRAH
- *    7 111 |   *   |   *   |   *   |   *   | PSLLW |   *   | PSRLW | PSRAW
- */
-
-#define MASK_MMI(op) (MASK_OP_MAJOR(op) | ((op) & 0x3F))
-enum {
-    MMI_OPC_MADD       = 0x00 | MMI_OPC_CLASS_MMI, /* Same as OPC_MADD */
-    MMI_OPC_MADDU      = 0x01 | MMI_OPC_CLASS_MMI, /* Same as OPC_MADDU */
-    MMI_OPC_MULT1      = 0x18 | MMI_OPC_CLASS_MMI, /* Same minor as OPC_MULT */
-    MMI_OPC_MULTU1     = 0x19 | MMI_OPC_CLASS_MMI, /* Same min. as OPC_MULTU */
-    MMI_OPC_DIV1       = 0x1A | MMI_OPC_CLASS_MMI, /* Same minor as OPC_DIV  */
-    MMI_OPC_DIVU1      = 0x1B | MMI_OPC_CLASS_MMI, /* Same minor as OPC_DIVU */
-    MMI_OPC_MADD1      = 0x20 | MMI_OPC_CLASS_MMI,
-    MMI_OPC_MADDU1     = 0x21 | MMI_OPC_CLASS_MMI,
-};
-
-
 /* global register indices */
 TCGv cpu_gpr[32], cpu_PC;
 /*
@@ -3270,65 +3194,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
     tcg_temp_free(t1);
 }
 
-#if defined(TARGET_MIPS64)
-static void gen_div1_tx79(DisasContext *ctx, uint32_t opc, int rs, int rt)
-{
-    TCGv t0, t1;
-
-    t0 = tcg_temp_new();
-    t1 = tcg_temp_new();
-
-    gen_load_gpr(t0, rs);
-    gen_load_gpr(t1, rt);
-
-    switch (opc) {
-    case MMI_OPC_DIV1:
-        {
-            TCGv t2 = tcg_temp_new();
-            TCGv t3 = tcg_temp_new();
-            tcg_gen_ext32s_tl(t0, t0);
-            tcg_gen_ext32s_tl(t1, t1);
-            tcg_gen_setcondi_tl(TCG_COND_EQ, t2, t0, INT_MIN);
-            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, -1);
-            tcg_gen_and_tl(t2, t2, t3);
-            tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, 0);
-            tcg_gen_or_tl(t2, t2, t3);
-            tcg_gen_movi_tl(t3, 0);
-            tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
-            tcg_gen_div_tl(cpu_LO[1], t0, t1);
-            tcg_gen_rem_tl(cpu_HI[1], t0, t1);
-            tcg_gen_ext32s_tl(cpu_LO[1], cpu_LO[1]);
-            tcg_gen_ext32s_tl(cpu_HI[1], cpu_HI[1]);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
-        }
-        break;
-    case MMI_OPC_DIVU1:
-        {
-            TCGv t2 = tcg_const_tl(0);
-            TCGv t3 = tcg_const_tl(1);
-            tcg_gen_ext32u_tl(t0, t0);
-            tcg_gen_ext32u_tl(t1, t1);
-            tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
-            tcg_gen_divu_tl(cpu_LO[1], t0, t1);
-            tcg_gen_remu_tl(cpu_HI[1], t0, t1);
-            tcg_gen_ext32s_tl(cpu_LO[1], cpu_LO[1]);
-            tcg_gen_ext32s_tl(cpu_HI[1], cpu_HI[1]);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
-        }
-        break;
-    default:
-        MIPS_INVAL("div1 TX79");
-        gen_reserved_instruction(ctx);
-        goto out;
-    }
- out:
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-}
-#endif
-
 static void gen_muldiv(DisasContext *ctx, uint32_t opc,
                        int acc, int rs, int rt)
 {
@@ -3521,138 +3386,6 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
     tcg_temp_free(t1);
 }
 
-/*
- * These MULT[U] and MADD[U] instructions implemented in for example
- * the Toshiba/Sony R5900 and the Toshiba TX19, TX39 and TX79 core
- * architectures are special three-operand variants with the syntax
- *
- *     MULT[U][1] rd, rs, rt
- *
- * such that
- *
- *     (rd, LO, HI) <- rs * rt
- *
- * and
- *
- *     MADD[U][1] rd, rs, rt
- *
- * such that
- *
- *     (rd, LO, HI) <- (LO, HI) + rs * rt
- *
- * where the low-order 32-bits of the result is placed into both the
- * GPR rd and the special register LO. The high-order 32-bits of the
- * result is placed into the special register HI.
- *
- * If the GPR rd is omitted in assembly language, it is taken to be 0,
- * which is the zero register that always reads as 0.
- */
-static void gen_mul_txx9(DisasContext *ctx, uint32_t opc,
-                         int rd, int rs, int rt)
-{
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-    int acc = 0;
-
-    gen_load_gpr(t0, rs);
-    gen_load_gpr(t1, rt);
-
-    switch (opc) {
-    case MMI_OPC_MULT1:
-        acc = 1;
-        /* Fall through */
-    case OPC_MULT:
-        {
-            TCGv_i32 t2 = tcg_temp_new_i32();
-            TCGv_i32 t3 = tcg_temp_new_i32();
-            tcg_gen_trunc_tl_i32(t2, t0);
-            tcg_gen_trunc_tl_i32(t3, t1);
-            tcg_gen_muls2_i32(t2, t3, t2, t3);
-            if (rd) {
-                tcg_gen_ext_i32_tl(cpu_gpr[rd], t2);
-            }
-            tcg_gen_ext_i32_tl(cpu_LO[acc], t2);
-            tcg_gen_ext_i32_tl(cpu_HI[acc], t3);
-            tcg_temp_free_i32(t2);
-            tcg_temp_free_i32(t3);
-        }
-        break;
-    case MMI_OPC_MULTU1:
-        acc = 1;
-        /* Fall through */
-    case OPC_MULTU:
-        {
-            TCGv_i32 t2 = tcg_temp_new_i32();
-            TCGv_i32 t3 = tcg_temp_new_i32();
-            tcg_gen_trunc_tl_i32(t2, t0);
-            tcg_gen_trunc_tl_i32(t3, t1);
-            tcg_gen_mulu2_i32(t2, t3, t2, t3);
-            if (rd) {
-                tcg_gen_ext_i32_tl(cpu_gpr[rd], t2);
-            }
-            tcg_gen_ext_i32_tl(cpu_LO[acc], t2);
-            tcg_gen_ext_i32_tl(cpu_HI[acc], t3);
-            tcg_temp_free_i32(t2);
-            tcg_temp_free_i32(t3);
-        }
-        break;
-    case MMI_OPC_MADD1:
-        acc = 1;
-        /* Fall through */
-    case MMI_OPC_MADD:
-        {
-            TCGv_i64 t2 = tcg_temp_new_i64();
-            TCGv_i64 t3 = tcg_temp_new_i64();
-
-            tcg_gen_ext_tl_i64(t2, t0);
-            tcg_gen_ext_tl_i64(t3, t1);
-            tcg_gen_mul_i64(t2, t2, t3);
-            tcg_gen_concat_tl_i64(t3, cpu_LO[acc], cpu_HI[acc]);
-            tcg_gen_add_i64(t2, t2, t3);
-            tcg_temp_free_i64(t3);
-            gen_move_low32(cpu_LO[acc], t2);
-            gen_move_high32(cpu_HI[acc], t2);
-            if (rd) {
-                gen_move_low32(cpu_gpr[rd], t2);
-            }
-            tcg_temp_free_i64(t2);
-        }
-        break;
-    case MMI_OPC_MADDU1:
-        acc = 1;
-        /* Fall through */
-    case MMI_OPC_MADDU:
-        {
-            TCGv_i64 t2 = tcg_temp_new_i64();
-            TCGv_i64 t3 = tcg_temp_new_i64();
-
-            tcg_gen_ext32u_tl(t0, t0);
-            tcg_gen_ext32u_tl(t1, t1);
-            tcg_gen_extu_tl_i64(t2, t0);
-            tcg_gen_extu_tl_i64(t3, t1);
-            tcg_gen_mul_i64(t2, t2, t3);
-            tcg_gen_concat_tl_i64(t3, cpu_LO[acc], cpu_HI[acc]);
-            tcg_gen_add_i64(t2, t2, t3);
-            tcg_temp_free_i64(t3);
-            gen_move_low32(cpu_LO[acc], t2);
-            gen_move_high32(cpu_HI[acc], t2);
-            if (rd) {
-                gen_move_low32(cpu_gpr[rd], t2);
-            }
-            tcg_temp_free_i64(t2);
-        }
-        break;
-    default:
-        MIPS_INVAL("mul/madd TXx9");
-        gen_reserved_instruction(ctx);
-        goto out;
-    }
-
- out:
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-}
-
 static void gen_cl(DisasContext *ctx, uint32_t opc,
                    int rd, int rs)
 {
@@ -12920,53 +12653,6 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
     }
 }
 
-static void decode_opc_special_tx79(CPUMIPSState *env, DisasContext *ctx)
-{
-    int rs = extract32(ctx->opcode, 21, 5);
-    int rt = extract32(ctx->opcode, 16, 5);
-    int rd = extract32(ctx->opcode, 11, 5);
-    uint32_t op1 = MASK_SPECIAL(ctx->opcode);
-
-    switch (op1) {
-    case OPC_MOVN:         /* Conditional move */
-    case OPC_MOVZ:
-        gen_cond_move(ctx, op1, rd, rs, rt);
-        break;
-    case OPC_MFHI:          /* Move from HI/LO */
-    case OPC_MFLO:
-        gen_HILO(ctx, op1, 0, rd);
-        break;
-    case OPC_MTHI:
-    case OPC_MTLO:          /* Move to HI/LO */
-        gen_HILO(ctx, op1, 0, rs);
-        break;
-    case OPC_MULT:
-    case OPC_MULTU:
-        gen_mul_txx9(ctx, op1, rd, rs, rt);
-        break;
-    case OPC_DIV:
-    case OPC_DIVU:
-        gen_muldiv(ctx, op1, 0, rs, rt);
-        break;
-#if defined(TARGET_MIPS64)
-    case OPC_DMULT:
-    case OPC_DMULTU:
-    case OPC_DDIV:
-    case OPC_DDIVU:
-        check_insn_opc_user_only(ctx, INSN_R5900);
-        gen_muldiv(ctx, op1, 0, rs, rt);
-        break;
-#endif
-    case OPC_JR:
-        gen_compute_branch(ctx, op1, 4, rs, 0, 0, 4);
-        break;
-    default:            /* Invalid */
-        MIPS_INVAL("special_tx79");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-}
-
 static void decode_opc_special_legacy(CPUMIPSState *env, DisasContext *ctx)
 {
     int rs, rt, rd;
@@ -13016,6 +12702,7 @@ static void decode_opc_special_legacy(CPUMIPSState *env, DisasContext *ctx)
     case OPC_DDIV:
     case OPC_DDIVU:
         check_insn(ctx, ISA_MIPS3);
+        check_insn_opc_user_only(ctx, INSN_R5900);
         check_mips_64(ctx);
         gen_muldiv(ctx, op1, 0, rs, rt);
         break;
@@ -13231,8 +12918,6 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
     default:
         if (ctx->insn_flags & ISA_MIPS_R6) {
             decode_opc_special_r6(env, ctx);
-        } else if (ctx->insn_flags & INSN_R5900) {
-            decode_opc_special_tx79(env, ctx);
         } else {
             decode_opc_special_legacy(env, ctx);
         }
@@ -13911,85 +13596,6 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
     }
 }
 
-
-#if defined(TARGET_MIPS64)
-
-static void decode_mmi(CPUMIPSState *env, DisasContext *ctx)
-{
-    uint32_t opc = MASK_MMI(ctx->opcode);
-    int rs = extract32(ctx->opcode, 21, 5);
-    int rt = extract32(ctx->opcode, 16, 5);
-    int rd = extract32(ctx->opcode, 11, 5);
-
-    switch (opc) {
-    case MMI_OPC_MULT1:
-    case MMI_OPC_MULTU1:
-    case MMI_OPC_MADD:
-    case MMI_OPC_MADDU:
-    case MMI_OPC_MADD1:
-    case MMI_OPC_MADDU1:
-        gen_mul_txx9(ctx, opc, rd, rs, rt);
-        break;
-    case MMI_OPC_DIV1:
-    case MMI_OPC_DIVU1:
-        gen_div1_tx79(ctx, opc, rs, rt);
-        break;
-    default:
-        MIPS_INVAL("TX79 MMI class");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-}
-
-static void gen_mmi_sq(DisasContext *ctx, int base, int rt, int offset)
-{
-    gen_reserved_instruction(ctx);    /* TODO: MMI_OPC_SQ */
-}
-
-/*
- * The TX79-specific instruction Store Quadword
- *
- * +--------+-------+-------+------------------------+
- * | 011111 |  base |   rt  |           offset       | SQ
- * +--------+-------+-------+------------------------+
- *      6       5       5                 16
- *
- * has the same opcode as the Read Hardware Register instruction
- *
- * +--------+-------+-------+-------+-------+--------+
- * | 011111 | 00000 |   rt  |   rd  | 00000 | 111011 | RDHWR
- * +--------+-------+-------+-------+-------+--------+
- *      6       5       5       5       5        6
- *
- * that is required, trapped and emulated by the Linux kernel. However, all
- * RDHWR encodings yield address error exceptions on the TX79 since the SQ
- * offset is odd. Therefore all valid SQ instructions can execute normally.
- * In user mode, QEMU must verify the upper and lower 11 bits to distinguish
- * between SQ and RDHWR, as the Linux kernel does.
- */
-static void decode_mmi_sq(CPUMIPSState *env, DisasContext *ctx)
-{
-    int base = extract32(ctx->opcode, 21, 5);
-    int rt = extract32(ctx->opcode, 16, 5);
-    int offset = extract32(ctx->opcode, 0, 16);
-
-#ifdef CONFIG_USER_ONLY
-    uint32_t op1 = MASK_SPECIAL3(ctx->opcode);
-    uint32_t op2 = extract32(ctx->opcode, 6, 5);
-
-    if (base == 0 && op2 == 0 && op1 == OPC_RDHWR) {
-        int rd = extract32(ctx->opcode, 11, 5);
-
-        gen_rdhwr(ctx, rt, rd, 0);
-        return;
-    }
-#endif
-
-    gen_mmi_sq(ctx, base, rt, offset);
-}
-
-#endif
-
 static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
 {
     int rs, rt, rd, sa;
@@ -14160,12 +13766,6 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
         decode_opc_special(env, ctx);
         break;
     case OPC_SPECIAL2:
-#if defined(TARGET_MIPS64)
-        if ((ctx->insn_flags & INSN_R5900) && (ctx->insn_flags & ASE_MMI)) {
-            decode_mmi(env, ctx);
-            break;
-        }
-#endif
         if (TARGET_LONG_BITS == 32 && (ctx->insn_flags & ASE_MXU)) {
             if (MASK_SPECIAL2(ctx->opcode) == OPC_MUL) {
                 gen_arith(ctx, OPC_MUL, rd, rs, rt);
@@ -14177,15 +13777,7 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
         decode_opc_special2_legacy(env, ctx);
         break;
     case OPC_SPECIAL3:
-#if defined(TARGET_MIPS64)
-        if (ctx->insn_flags & INSN_R5900) {
-            decode_mmi_sq(env, ctx);    /* MMI_OPC_SQ */
-        } else {
-            decode_opc_special3(env, ctx);
-        }
-#else
         decode_opc_special3(env, ctx);
-#endif
         break;
     case OPC_REGIMM:
         op1 = MASK_REGIMM(ctx->opcode);
diff --git a/target/mips/tcg/tx79.decode b/target/mips/tcg/tx79.decode
index 57d87a2076..8629b518bb 100644
--- a/target/mips/tcg/tx79.decode
+++ b/target/mips/tcg/tx79.decode
@@ -33,6 +33,20 @@ MTHI1           011100 .....  0000000000 00000 010001   @rs
 MFLO1           011100 0000000000  ..... 00000 010010   @rd
 MTLO1           011100 .....  0000000000 00000 010011   @rs
 
+# MUL
+# MULT/MULTU are reusing MIPS SPECIAL MAJOR_OP
+MULT            000000 ..... ..... ..... 00000 011000   @rs_rt_rd
+MULTU           000000 ..... ..... ..... 00000 011001   @rs_rt_rd
+# Rests are using SPECIAL2 encoding
+MADD            011100 ..... ..... ..... 00000 000000   @rs_rt_rd
+MADDU           011100 ..... ..... ..... 00000 000001   @rs_rt_rd
+MULT1           011100 ..... ..... ..... 00000 011000   @rs_rt_rd
+MULTU1          011100 ..... ..... ..... 00000 011001   @rs_rt_rd
+DIV1            011100 ..... ..... ..... 00000 011010   @rs_rt_rd
+DIVU1           011100 ..... ..... ..... 00000 011011   @rs_rt_rd
+MADD1           011100 ..... ..... ..... 00000 100000   @rs_rt_rd
+MADDU1          011100 ..... ..... ..... 00000 100001   @rs_rt_rd
+
 # MMI0
 
 PSUBW           011100 ..... ..... ..... 00001 001000   @rs_rt_rd
diff --git a/target/mips/tcg/tx79_translate.c b/target/mips/tcg/tx79_translate.c
index 4e479c2d10..434a1cf13e 100644
--- a/target/mips/tcg/tx79_translate.c
+++ b/target/mips/tcg/tx79_translate.c
@@ -369,7 +369,7 @@ static bool trans_LQ(DisasContext *ctx, arg_i *a)
     return true;
 }
 
-static bool trans_SQ(DisasContext *ctx, arg_i *a)
+static bool gen_SQ(DisasContext *ctx, arg_i *a)
 {
     TCGv_i64 t0 = tcg_temp_new_i64();
     TCGv addr = tcg_temp_new();
@@ -396,6 +396,32 @@ static bool trans_SQ(DisasContext *ctx, arg_i *a)
     return true;
 }
 
+#define RDHWR_MASK(op) (op & 0xffe0063f)
+#define OPC_RDHWR 0x7c00003b
+
+static bool trans_SQ(DisasContext *ctx, arg_i *a)
+{
+#ifdef CONFIG_USER_ONLY
+    /*
+    * that is required, trapped and emulated by the Linux kernel. However, all
+    * RDHWR encodings yield address error exceptions on the TX79 since the SQ
+    * offset is odd. Therefore all valid SQ instructions can execute normally.
+    * In user mode, QEMU must verify the upper and lower 11 bits to distinguish
+    * between SQ and RDHWR, as the Linux kernel does.
+    */
+    if (RDHWR_MASK(ctx->opcode) == OPC_RDHWR) {
+        int rd = extract32(ctx->opcode, 11, 5);
+        int rt = extract32(ctx->opcode, 16, 5);
+        int sel = extract32(ctx->opcode, 6, 3);
+
+        gen_rdhwr(ctx, rt, rd, sel);
+        return true;
+    }
+#endif
+
+    return gen_SQ(ctx, a);
+}
+
 /*
  *     Multiply and Divide (19 instructions)
  *     -------------------------------------
@@ -683,3 +709,180 @@ static bool trans_PROT3W(DisasContext *ctx, arg_r *a)
 
     return true;
 }
+
+/*
+ * These MULT[U] and MADD[U] instructions implemented in for example
+ * the Toshiba/Sony R5900 and the Toshiba TX19, TX39 and TX79 core
+ * architectures are special three-operand variants with the syntax
+ *
+ *     MULT[U][1] rd, rs, rt
+ *
+ * such that
+ *
+ *     (rd, LO, HI) <- rs * rt
+ *
+ * and
+ *
+ *     MADD[U][1] rd, rs, rt
+ *
+ * such that
+ *
+ *     (rd, LO, HI) <- (LO, HI) + rs * rt
+ *
+ * where the low-order 32-bits of the result is placed into both the
+ * GPR rd and the special register LO. The high-order 32-bits of the
+ * result is placed into the special register HI.
+ *
+ * If the GPR rd is omitted in assembly language, it is taken to be 0,
+ * which is the zero register that always reads as 0.
+ */
+
+static bool gen_mult(DisasContext *ctx, arg_r *a, int acc,
+                       void (*func)(TCGv_i32, TCGv_i32, TCGv_i32, TCGv_i32))
+{
+    TCGv src1 = get_gpr(ctx, a->rs, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rt, EXT_NONE);
+    TCGv dst_lo = dest_lo(ctx, acc);
+    TCGv dst_hi = dest_hi(ctx, acc);
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+
+    tcg_gen_trunc_tl_i32(t1, src1);
+    tcg_gen_trunc_tl_i32(t2, src2);
+
+    func(t1, t2, t1, t2);
+
+    tcg_gen_ext_i32_tl(dst_lo, t1);
+    tcg_gen_ext_i32_tl(dst_hi, t2);
+
+    gen_set_gpr(a->rd, dst_lo, EXT_NONE);
+    gen_set_lo(acc, dst_lo, EXT_NONE);
+    gen_set_hi(acc, dst_hi, EXT_NONE);
+
+    return true;
+}
+
+TRANS_6R(MULT, gen_mult, 0, tcg_gen_muls2_i32)
+TRANS_6R(MULTU, gen_mult, 0, tcg_gen_mulu2_i32)
+TRANS_6R(MULT1, gen_mult, 1, tcg_gen_muls2_i32)
+TRANS_6R(MULTU1, gen_mult, 1, tcg_gen_mulu2_i32)
+
+static bool gen_mul_addsub(DisasContext *ctx, arg_r *a, int acc, DisasExtend ext,
+                            void (*func)(TCGv_i64, TCGv_i64, TCGv_i64))
+{
+    TCGv src1 = get_gpr(ctx, a->rs, ext);
+    TCGv src2 = get_gpr(ctx, a->rt, ext);
+    TCGv_i64 src3 = get_hilo(ctx, acc);
+    TCGv_i64 dst = dest_hilo(ctx, acc);
+    TCGv_i64 t2 = tcg_temp_new_i64();
+    TCGv_i64 t3 = tcg_temp_new_i64();
+
+    switch (ext) {
+    case EXT_SIGN:
+        tcg_gen_ext_tl_i64(t2, src1);
+        tcg_gen_ext_tl_i64(t3, src2);
+        break;
+    case EXT_ZERO:
+        tcg_gen_extu_tl_i64(t2, src1);
+        tcg_gen_extu_tl_i64(t3, src2);
+        break;
+    default:
+        g_assert_not_reached();
+        break;
+    }
+
+    tcg_gen_mul_i64(dst, t2, t3);
+    tcg_temp_free_i64(t2);
+    tcg_temp_free_i64(t3);
+    func(dst, dst, src3);
+
+    gen_set_hilo(acc, dst);
+
+    return true;
+}
+
+TRANS(MADD, gen_mul_addsub, 0, EXT_SIGN, tcg_gen_add_i64)
+TRANS(MADDU, gen_mul_addsub, 0, EXT_ZERO, tcg_gen_add_i64)
+TRANS(MADD1, gen_mul_addsub, 1, EXT_SIGN, tcg_gen_add_i64)
+TRANS(MADDU1, gen_mul_addsub, 1, EXT_ZERO, tcg_gen_add_i64)
+
+static bool gen_div(DisasContext *ctx, arg_r *a, int acc,
+                    DisasExtend src_ext, DisasExtend dst_ext)
+{
+    TCGv temp1, temp2, zero, one, mone, min;
+    TCGv src1 = get_gpr(ctx, a->rs, src_ext);
+    TCGv src2 = get_gpr(ctx, a->rt, src_ext);
+    TCGv dst_lo = dest_lo(ctx, acc);
+    TCGv dst_hi = dest_hi(ctx, acc);
+
+    temp1 = tcg_temp_new();
+    temp2 = tcg_temp_new();
+    zero = tcg_constant_tl(0);
+    one = tcg_constant_tl(1);
+    mone = tcg_constant_tl(-1);
+    min = tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
+
+    /*
+     * If overflow, set temp2 to 1, else source2.
+     * This produces the required result of min.
+     */
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, src1, min);
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, src2, mone);
+    tcg_gen_and_tl(temp1, temp1, temp2);
+    tcg_gen_movcond_tl(TCG_COND_NE, temp2, temp1, zero, one, src2);
+
+    /*
+     * If div by zero, set temp1 to -1 and temp2 to 1 to
+     * produce the required result of -1.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, src2, zero, mone, src1);
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, src2, zero, one, src2);
+
+    tcg_gen_div_tl(dst_lo, temp1, temp2);
+    tcg_gen_rem_tl(dst_hi, temp1, temp2);
+
+    tcg_temp_free(temp1);
+    tcg_temp_free(temp2);
+
+    gen_set_lo(acc, dst_lo, dst_ext);
+    gen_set_hi(acc, dst_hi, dst_ext);
+
+    return true;
+}
+
+static bool gen_divu(DisasContext *ctx, arg_r *a, int acc,
+                    DisasExtend src_ext, DisasExtend dst_ext)
+{
+    TCGv temp1, temp2, zero, one, max;
+    TCGv src1 = get_gpr(ctx, a->rs, src_ext);
+    TCGv src2 = get_gpr(ctx, a->rt, src_ext);
+    TCGv dst_lo = dest_lo(ctx, acc);
+    TCGv dst_hi = dest_hi(ctx, acc);
+
+    temp1 = tcg_temp_new();
+    temp2 = tcg_temp_new();
+    zero = tcg_constant_tl(0);
+    one = tcg_constant_tl(1);
+    max = tcg_constant_tl(~0);
+
+    /*
+     * If div by zero, set temp1 to max and temp2 to 1 to
+     * produce the required result of max.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, src2, zero, max, src1);
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, src2, zero, one, src2);
+
+    tcg_gen_divu_tl(dst_lo, temp1, temp2);
+    tcg_gen_remu_tl(dst_hi, temp1, temp2);
+
+    tcg_temp_free(temp1);
+    tcg_temp_free(temp2);
+
+    gen_set_lo(acc, dst_lo, dst_ext);
+    gen_set_hi(acc, dst_hi, dst_ext);
+
+    return true;
+}
+
+TRANS(DIV1, gen_div, 1, EXT_SIGN, EXT_SIGN)
+TRANS(DIVU1, gen_divu, 1, EXT_ZERO, EXT_SIGN)
-- 
2.34.1


