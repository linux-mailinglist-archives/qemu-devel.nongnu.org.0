Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA74543F1CC
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:33:01 +0200 (CEST)
Received: from localhost ([::1]:60022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgD1A-0005lg-Uf
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:33:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCg3-0001OE-IV
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:11:13 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCg1-0007V1-6r
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:11:11 -0400
Received: by mail-wr1-x42e.google.com with SMTP id p14so12423504wrd.10
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 14:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f1E6JGgXdT/fzSSFq3J8Cjq1ALD2D0n1p5NN75nfVXk=;
 b=FbiV6LYJpfgiYawKTqc0/RAKjxu2a69EPWDCl418Fz6tte+G05EUB+prFye5DRycUw
 GJIw05ZHPm5HRvmuVBokAQIPgsbJqU82+XPMOXyCaHjugGGM9Zl9VKITbY0SY1ygGgov
 1oMsTomuFz2SOqMu/MoAyXYWBF9cBGpAqOzkndBTSU1gWZacEIo9npk0JCuCfEMhha+r
 nUm3m5rGHcRKp90Y6w7CtGAo0J0JHrf5N1f64faqOOX3bemu0uLD1tYvb3NKK1Oyc6XI
 Ez93PvwNY1tr74irdJxTI8dKJQSl2bTZJ/uGy/8o06kD0nFO5AnhL8/XCB+maAXHz4V7
 dxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=f1E6JGgXdT/fzSSFq3J8Cjq1ALD2D0n1p5NN75nfVXk=;
 b=TcmuWpwhjoawNSSrU66zXCKkwffbDabGm1DKXBRy6zMkK+gkxaiIIjxi7waMCjUtoh
 DYo8b0CzSJbJmeVkTPL/ssqfOCtFs05HEZ7jWfuIzsjzwU+bnlW+AIVapLYAb+sF6emq
 XqAKKZkB2Z44wXtXMFcAUEeZXduYKKLrkFD3KWmHhkLi4GS+vxUkr+XQy9UbkEZRZa9b
 FEirZHk9ni9yZHQp9d4NTdb54nI27oHRj8ULUfbKV56D6xVpDHwYCHAcmaAwWgPe/l8D
 ggvGQZhOUCaeYq7gqV8nQ+5P44XBEh4w/r6+yMJLGKOdwT/r1bpBMX0iTE/PEDxqgxGG
 5qOQ==
X-Gm-Message-State: AOAM533G1Bq1vmIPsi+gh3DR8kql5VKrMATYT6nYadGTRJTFdHqxoMCJ
 P6cuAs/It6aH8bqq5BOJVyqtxaexj1s=
X-Google-Smtp-Source: ABdhPJyUzfPGWL19ffeXwOWnUQs09nIJnrH/Zx/cQAVZ0GPaeAJwW9+4pSWm9/vfNpAeWyZKGh3XTw==
X-Received: by 2002:a05:6000:11ce:: with SMTP id
 i14mr8750084wrx.102.1635455467738; 
 Thu, 28 Oct 2021 14:11:07 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id b18sm4588258wru.54.2021.10.28.14.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:11:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 29/32] target/mips: Convert CTCMSA opcode to decodetree
Date: Thu, 28 Oct 2021 23:08:40 +0200
Message-Id: <20211028210843.2120802-30-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028210843.2120802-1-f4bug@amsat.org>
References: <20211028210843.2120802-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the CTCMSA (Copy To Control MSA register) opcode
to decodetree. Since it overlaps with the SLDI opcode,
use a decodetree overlap group.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  5 ++-
 target/mips/tcg/msa_translate.c | 69 ++++++---------------------------
 2 files changed, 16 insertions(+), 58 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index de8153a89bf..a4c7cceb15f 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -167,7 +167,10 @@ BNZ                 010001 111 .. ..... ................    @bz
   HSUB_S            011110 110.. ..... ..... .....  010101  @3r
   HSUB_U            011110 111.. ..... ..... .....  010101  @3r
 
-  SLDI              011110 0000 ...... ..... .....  011001  @elm_df
+  {
+    CTCMSA          011110 0000111110  ..... .....  011001  @elm
+    SLDI            011110 0000 ...... ..... .....  011001  @elm_df
+  }
   {
     CFCMSA          011110 0001111110  ..... .....  011001  @elm
     SPLATI          011110 0001 ...... ..... .....  011001  @elm_df
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index b8439a2bd37..62aef43a6e7 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -35,18 +35,6 @@ static inline int plus_2(DisasContext *s, int x)
 /* Include the auto-generated decoder.  */
 #include "decode-msa.c.inc"
 
-#define OPC_MSA (0x1E << 26)
-
-#define MASK_MSA_MINOR(op)          (MASK_OP_MAJOR(op) | (op & 0x3F))
-enum {
-    OPC_MSA_ELM     = 0x19 | OPC_MSA,
-};
-
-enum {
-    /* ELM instructions df(bits 21..16) = _b, _h, _w, _d */
-    OPC_CTCMSA      = (0x0 << 22) | (0x3E << 16) | OPC_MSA_ELM,
-};
-
 static const char msaregnames[][6] = {
     "w0.d0",  "w0.d1",  "w1.d0",  "w1.d1",
     "w2.d0",  "w2.d1",  "w3.d0",  "w3.d1",
@@ -542,27 +530,22 @@ static bool trans_MOVE_V(DisasContext *ctx, arg_msa_elm *a)
     return true;
 }
 
-static void gen_msa_elm_3e(DisasContext *ctx)
+static bool trans_CTCMSA(DisasContext *ctx, arg_msa_elm *a)
 {
-#define MASK_MSA_ELM_DF3E(op)   (MASK_MSA_MINOR(op) | (op & (0x3FF << 16)))
-    uint8_t source = (ctx->opcode >> 11) & 0x1f;
-    uint8_t dest = (ctx->opcode >> 6) & 0x1f;
-    TCGv telm = tcg_temp_new();
-    TCGv_i32 tdt = tcg_const_i32(dest);
+    TCGv telm;
 
-    switch (MASK_MSA_ELM_DF3E(ctx->opcode)) {
-    case OPC_CTCMSA:
-        gen_load_gpr(telm, source);
-        gen_helper_msa_ctcmsa(cpu_env, telm, tdt);
-        break;
-    default:
-        MIPS_INVAL("MSA instruction");
-        gen_reserved_instruction(ctx);
-        break;
+    if (!check_msa_enabled(ctx)) {
+        return true;
     }
 
+    telm = tcg_temp_new();
+
+    gen_load_gpr(telm, a->ws);
+    gen_helper_msa_ctcmsa(cpu_env, telm, tcg_constant_i32(a->wd));
+
     tcg_temp_free(telm);
-    tcg_temp_free_i32(tdt);
+
+    return true;
 }
 
 static bool trans_CFCMSA(DisasContext *ctx, arg_msa_elm *a)
@@ -667,20 +650,6 @@ static bool trans_INSERT(DisasContext *ctx, arg_msa_elm_df *a)
     return trans_msa_elm_fn(ctx, a, gen_msa_insert);
 }
 
-static void gen_msa_elm(DisasContext *ctx)
-{
-    uint8_t dfn = (ctx->opcode >> 16) & 0x3f;
-
-    if (dfn == 0x3E) {
-        /* CTCMSA */
-        gen_msa_elm_3e(ctx);
-        return;
-    } else {
-        gen_reserved_instruction(ctx);
-        return;
-    }
-}
-
 TRANS(FCAF,     trans_msa_3rf, gen_helper_msa_fcaf_df);
 TRANS(FCUN,     trans_msa_3rf, gen_helper_msa_fcun_df);
 TRANS(FCEQ,     trans_msa_3rf, gen_helper_msa_fceq_df);
@@ -794,21 +763,7 @@ TRANS(FFINT_U,  trans_msa_2rf, gen_helper_msa_ffint_u_df);
 
 static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
 {
-    uint32_t opcode = ctx->opcode;
-
-    if (!check_msa_enabled(ctx)) {
-        return true;
-    }
-
-    switch (MASK_MSA_MINOR(opcode)) {
-    case OPC_MSA_ELM:
-        gen_msa_elm(ctx);
-        break;
-    default:
-        MIPS_INVAL("MSA instruction");
-        gen_reserved_instruction(ctx);
-        break;
-    }
+    gen_reserved_instruction(ctx);
 
     return true;
 }
-- 
2.31.1


