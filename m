Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCB73E30AA
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 23:08:15 +0200 (CEST)
Received: from localhost ([::1]:44120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC74g-0007tt-LC
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 17:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mC72p-00044S-AW
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:06:20 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:43890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mC72m-0000FO-VS
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:06:18 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 l8-20020a05600c1d08b02902b5acf7d8b5so6251001wms.2
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 14:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P41NoBCFmIjrUKnPjTVcJYIn3MDzyRQ52HoMe1ehCTU=;
 b=qZTy/u2R0X8wspgt3tkqX8Qjx+Mb6MkbKaqV2yIS7cAyJLiR2VZ8NS2urNzga5k+GE
 +1DTCNi/49/8NkDFIJptfK2Ir86b9A2T9BsNdtlV+J9MdWYCFXkW5vRT9yQPh3KLcTSx
 RLeodIfcLjPA5exuoQ9i+s5hY3GEV2n2jKvsB4Pdbk7AO7fhS1F+Bwiq9+NdVm9xDGSC
 0Mmylqyy7h3TFxFi0sZ51ejT3qfgERgjSVm06eBgEdnSTsvf749N0I01k4vCpzK1uawF
 RERyg2AbfhZKuY8WSenlbXOKQManxjliSc1Vy0O9ZMt3AA9j4niOrccWXCWOnvqWlUKQ
 yqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=P41NoBCFmIjrUKnPjTVcJYIn3MDzyRQ52HoMe1ehCTU=;
 b=rBr9rg5GhI4fahz/NRjvG2G/N+W5+eIhUs0DLjVFETPWR6z0am8NRaYkoTi2bWnylj
 o61G7nFvAS182z8EESpyBxdQmKL/t5RlsKZ8f9s8jXDdxdEfgY+cJM4dbf/nQ15qRI02
 MglT33tsLw0N0xX2AI1Nhr/8qHZ7Tf+izXT2Jc3BhqUnfbsKKbVugqRFG4jMeBI0pPTQ
 0vcFmgPD6o+r8oyreudxlRa4e1sjq/KwHbjAsjWpERU1rtVVtmpkY95DkkF+tTGybEmv
 jbqp57C1ZyMlWq17RtAEnHdXNa8AC8BhcEyTwsBz31o2pIKXDgum9ebgOC3Lwy/OuSyc
 SpIQ==
X-Gm-Message-State: AOAM5323e4pBTnbU7AMVz6WNVd/XUh2csD8vxsKTYXxI4twM6tyll946
 o0TBZKl2U58Dup69kst4nJ00fHWApTnhTzfzZcQ=
X-Google-Smtp-Source: ABdhPJxtJ8HK33VKldevg7ullRtMXIOYpiotWoRanWVGFjmawv4abdgMhh6goWFSe3ppkdOLhFcQjg==
X-Received: by 2002:a1c:f314:: with SMTP id q20mr22418179wmq.154.1628283975430; 
 Fri, 06 Aug 2021 14:06:15 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 g5sm12817626wmh.31.2021.08.06.14.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 14:06:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v2 5/5] target/mips: Convert Vr54xx MSA* opcodes to
 decodetree
Date: Fri,  6 Aug 2021 23:05:48 +0200
Message-Id: <20210806210548.8568-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210806210548.8568-1-f4bug@amsat.org>
References: <20210806210548.8568-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the following Integer Multiply-Accumulate opcodes:

 * MSAC         Multiply, negate, accumulate, and move LO
 * MSACHI       Multiply, negate, accumulate, and move HI
 * MSACHIU      Unsigned multiply, negate, accumulate, and move HI
 * MSACU        Unsigned multiply, negate, accumulate, and move LO

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/vr54xx.decode      |  4 +++
 target/mips/tcg/translate.c        | 55 ++----------------------------
 target/mips/tcg/vr54xx_translate.c |  8 +++++
 3 files changed, 14 insertions(+), 53 deletions(-)

diff --git a/target/mips/tcg/vr54xx.decode b/target/mips/tcg/vr54xx.decode
index 79bb5175eab..4fc708d80ae 100644
--- a/target/mips/tcg/vr54xx.decode
+++ b/target/mips/tcg/vr54xx.decode
@@ -15,9 +15,13 @@ MULS            000000 ..... ..... ..... 00011011000    @rs_rt_rd
 MULSU           000000 ..... ..... ..... 00011011001    @rs_rt_rd
 MACC            000000 ..... ..... ..... 00101011000    @rs_rt_rd
 MACCU           000000 ..... ..... ..... 00101011001    @rs_rt_rd
+MSAC            000000 ..... ..... ..... 00111011000    @rs_rt_rd
+MSACU           000000 ..... ..... ..... 00111011001    @rs_rt_rd
 MULHI           000000 ..... ..... ..... 01001011000    @rs_rt_rd
 MULHIU          000000 ..... ..... ..... 01001011001    @rs_rt_rd
 MULSHI          000000 ..... ..... ..... 01011011000    @rs_rt_rd
 MULSHIU         000000 ..... ..... ..... 01011011001    @rs_rt_rd
 MACCHI          000000 ..... ..... ..... 01101011000    @rs_rt_rd
 MACCHIU         000000 ..... ..... ..... 01101011001    @rs_rt_rd
+MSACHI          000000 ..... ..... ..... 01111011000    @rs_rt_rd
+MSACHIU         000000 ..... ..... ..... 01111011001    @rs_rt_rd
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 864773faf80..6c9aaad6bf5 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -294,16 +294,6 @@ enum {
     R6_OPC_SDBBP    = 0x0e | OPC_SPECIAL,
 };
 
-/* Multiplication variants of the vr54xx. */
-#define MASK_MUL_VR54XX(op)         (MASK_SPECIAL(op) | (op & (0x1F << 6)))
-
-enum {
-    OPC_VR54XX_MSAC    = (0x07 << 6) | OPC_MULT,
-    OPC_VR54XX_MSACU   = (0x07 << 6) | OPC_MULTU,
-    OPC_VR54XX_MSACHI  = (0x0F << 6) | OPC_MULT,
-    OPC_VR54XX_MSACHIU = (0x0F << 6) | OPC_MULTU,
-};
-
 /* REGIMM (rt field) opcodes */
 #define MASK_REGIMM(op)             (MASK_OP_MAJOR(op) | (op & (0x1F << 16)))
 
@@ -3754,40 +3744,6 @@ static void gen_mul_txx9(DisasContext *ctx, uint32_t opc,
     tcg_temp_free(t1);
 }
 
-static void gen_mul_vr54xx(DisasContext *ctx, uint32_t opc,
-                           int rd, int rs, int rt)
-{
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    gen_load_gpr(t0, rs);
-    gen_load_gpr(t1, rt);
-
-    switch (opc) {
-    case OPC_VR54XX_MSAC:
-        gen_helper_msac(t0, cpu_env, t0, t1);
-        break;
-    case OPC_VR54XX_MSACU:
-        gen_helper_msacu(t0, cpu_env, t0, t1);
-        break;
-    case OPC_VR54XX_MSACHI:
-        gen_helper_msachi(t0, cpu_env, t0, t1);
-        break;
-    case OPC_VR54XX_MSACHIU:
-        gen_helper_msachiu(t0, cpu_env, t0, t1);
-        break;
-    default:
-        MIPS_INVAL("mul vr54xx");
-        gen_reserved_instruction(ctx);
-        goto out;
-    }
-    gen_store_gpr(t0, rd);
-
- out:
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-}
-
 static void gen_cl(DisasContext *ctx, uint32_t opc,
                    int rd, int rs)
 {
@@ -14104,13 +14060,12 @@ static void decode_opc_special_tx79(CPUMIPSState *env, DisasContext *ctx)
 
 static void decode_opc_special_legacy(CPUMIPSState *env, DisasContext *ctx)
 {
-    int rs, rt, rd, sa;
+    int rs, rt, rd;
     uint32_t op1;
 
     rs = (ctx->opcode >> 21) & 0x1f;
     rt = (ctx->opcode >> 16) & 0x1f;
     rd = (ctx->opcode >> 11) & 0x1f;
-    sa = (ctx->opcode >> 6) & 0x1f;
 
     op1 = MASK_SPECIAL(ctx->opcode);
     switch (op1) {
@@ -14140,13 +14095,7 @@ static void decode_opc_special_legacy(CPUMIPSState *env, DisasContext *ctx)
         break;
     case OPC_MULT:
     case OPC_MULTU:
-        if (sa) {
-            check_insn(ctx, INSN_VR54XX);
-            op1 = MASK_MUL_VR54XX(ctx->opcode);
-            gen_mul_vr54xx(ctx, op1, rd, rs, rt);
-        } else {
-            gen_muldiv(ctx, op1, rd & 3, rs, rt);
-        }
+        gen_muldiv(ctx, op1, rd & 3, rs, rt);
         break;
     case OPC_DIV:
     case OPC_DIVU:
diff --git a/target/mips/tcg/vr54xx_translate.c b/target/mips/tcg/vr54xx_translate.c
index d70641dee13..f668178d79d 100644
--- a/target/mips/tcg/vr54xx_translate.c
+++ b/target/mips/tcg/vr54xx_translate.c
@@ -25,6 +25,10 @@
  * MACCHI       Multiply, accumulate, and move HI
  * MACCHIU      Unsigned multiply, accumulate, and move HI
  * MACCU        Unsigned multiply, accumulate, and move LO
+ * MSAC         Multiply, negate, accumulate, and move LO
+ * MSACHI       Multiply, negate, accumulate, and move HI
+ * MSACHIU      Unsigned multiply, negate, accumulate, and move HI
+ * MSACU        Unsigned multiply, negate, accumulate, and move LO
  * MULHI        Multiply and move HI
  * MULHIU       Unsigned multiply and move HI
  * MULS         Multiply, negate, and move LO
@@ -66,6 +70,10 @@ TRANS(MACC,     trans_mult_acc, gen_helper_macc);
 TRANS(MACCHI,   trans_mult_acc, gen_helper_macchi);
 TRANS(MACCHIU,  trans_mult_acc, gen_helper_macchiu);
 TRANS(MACCU,    trans_mult_acc, gen_helper_maccu);
+TRANS(MSAC,     trans_mult_acc, gen_helper_msac);
+TRANS(MSACHI,   trans_mult_acc, gen_helper_msachi);
+TRANS(MSACHIU,  trans_mult_acc, gen_helper_msachiu);
+TRANS(MSACU,    trans_mult_acc, gen_helper_msacu);
 TRANS(MULHI,    trans_mult_acc, gen_helper_mulhi);
 TRANS(MULHIU,   trans_mult_acc, gen_helper_mulhiu);
 TRANS(MULS,     trans_mult_acc, gen_helper_muls);
-- 
2.31.1


