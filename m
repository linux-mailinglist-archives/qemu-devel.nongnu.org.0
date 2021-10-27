Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF2743D0AC
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 20:24:12 +0200 (CEST)
Received: from localhost ([::1]:57872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfnat-00026p-PF
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 14:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnLj-0004Ky-Tw
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:08:31 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:38501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnLi-00041c-8B
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:08:31 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 a20-20020a1c7f14000000b003231d13ee3cso7027978wmd.3
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eRYjL84Pww6H/F8lZrKTTO88TzDQiTncI1tEGCPZPQM=;
 b=JfSdA/iDAKtL67Lh+AbzavPBgndB8MzLDKxRksthSpNJwLLe9vQ28DrLuMo3yMC3/8
 0PsxHXIHbogmSicH5t4k0257xS55B94zYyycRMj5I3vUoj1Egub0I7qMwCRIzHNCh1j8
 AZx1+JSsgyUzRSsAZyNCTxDAFMAh3FjuAPaaZTA3FCwcinFuaAfKpKDNw4IcocooO/tB
 JMt+ejCeyo8s6y3wZ3JNwetZ3bcwa92BGp3cGBKP86HZ0121vJCNrrjDNKejq39XLlC7
 ICXieYRGtEiHr3HUQaQ1GRV9Gk9n5ifAjsOvFO1/wbL41RAWcUL29SiDfRsZlMfhtHWp
 fYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eRYjL84Pww6H/F8lZrKTTO88TzDQiTncI1tEGCPZPQM=;
 b=eYEt+/uATPE8I23NCypItvI0lhrcxdqQTJ+RGHOxrJxuyYKSY0sDajWWIQRJjh0Dum
 AXoVPN3SqCGe2dunMEyQrRXM7N5nIvj6Ey2VZgOStW2PyDJxYIRlL1wUkl7xd/g5HTBJ
 2XUQ+rasKOoYj3z5k26VJfyuY9ClbyUKglB+c0CzOtH69pMlj/DfIOBYp4KT1HZavfW7
 BvbrPc4wxdIiUwBF/Njmq4All8JPHkmuPNOA8G12dirPf80NaZWJ688K+0Mk+8WYsWTC
 ctKh7XqyFhM5q8aWXaHW6UY2is6YYg3Iwai2Di4K6OvmGHbSyb4b6zMxDOvWHQsC4Y2a
 48vA==
X-Gm-Message-State: AOAM530NgZamYHVFwcJEqO2UBnEASI21+jnxhA3g+lXcLRvIu/sBhxwG
 xZuM+oDOtbJuFi1+eQqRSIFgrvJ7iHI=
X-Google-Smtp-Source: ABdhPJycmcRAscplLlxFOczUvu8PCegHXdBpHBGt+Urtyk7UQ3zTosTY6G4TIrc4ygVIxLZHTbthoQ==
X-Received: by 2002:a05:600c:198d:: with SMTP id
 t13mr7218333wmq.21.1635358108775; 
 Wed, 27 Oct 2021 11:08:28 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id c17sm504720wmk.23.2021.10.27.11.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:08:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/32] target/mips: Convert MSA I8 instruction format to
 decodetree
Date: Wed, 27 Oct 2021 20:07:10 +0200
Message-Id: <20211027180730.1551932-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027180730.1551932-1-f4bug@amsat.org>
References: <20211027180730.1551932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert instructions with an 8-bit immediate value and either
implicit data format or data format df to decodetree.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: TCG timm is constant
---
 target/mips/tcg/msa.decode      |  8 ++++
 target/mips/tcg/msa_translate.c | 73 ++++++++-------------------------
 2 files changed, 24 insertions(+), 57 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 7a4d7549258..af374f08969 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -28,6 +28,7 @@
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_i5
 @s5                 ...... ... df:2 sa:s5 ws:5 wd:5 ......  &msa_i5
 @i8_df              ......     df:2 sa:s8 ws:5 wd:5 ......  &msa_i8
+@i8                 ...... ..       sa:s8 ws:5 wd:5 ......  &msa_i8 df=0
 @ldi                ...... ... df:2 sa:s10     wd:5 ......  &msa_ldi
 @bit                ...... ... .......    ws:5 wd:5 ......  &msa_bit df=%dfm_df m=%dfm_m
 
@@ -40,6 +41,13 @@ BZ                  010001 110 .. ..... ................    @bz
 BNZ                 010001 111 .. ..... ................    @bz
 
 {
+  ANDI              011110 00 ........ ..... .....  000000  @i8
+  ORI               011110 01 ........ ..... .....  000000  @i8
+  NORI              011110 10 ........ ..... .....  000000  @i8
+  XORI              011110 11 ........ ..... .....  000000  @i8
+  BMNZI             011110 00 ........ ..... .....  000001  @i8
+  BMZI              011110 01 ........ ..... .....  000001  @i8
+  BSELI             011110 10 ........ ..... .....  000001  @i8
   SHF               011110 .. ........ ..... .....  000010  @i8_df
 
   ADDVI             011110 000 .. ..... ..... ..... 000110  @u5
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 76c40dc7126..d0b990a49f6 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -27,9 +27,6 @@ static int msa_bit_df(DisasContext *ctx, int x);
 
 #define MASK_MSA_MINOR(op)          (MASK_OP_MAJOR(op) | (op & 0x3F))
 enum {
-    OPC_MSA_I8_00   = 0x00 | OPC_MSA,
-    OPC_MSA_I8_01   = 0x01 | OPC_MSA,
-    OPC_MSA_I8_02   = 0x02 | OPC_MSA,
     OPC_MSA_3R_0D   = 0x0D | OPC_MSA,
     OPC_MSA_3R_0E   = 0x0E | OPC_MSA,
     OPC_MSA_3R_0F   = 0x0F | OPC_MSA,
@@ -57,15 +54,6 @@ enum {
 };
 
 enum {
-    /* I8 instruction */
-    OPC_ANDI_B      = (0x0 << 24) | OPC_MSA_I8_00,
-    OPC_BMNZI_B     = (0x0 << 24) | OPC_MSA_I8_01,
-    OPC_ORI_B       = (0x1 << 24) | OPC_MSA_I8_00,
-    OPC_BMZI_B      = (0x1 << 24) | OPC_MSA_I8_01,
-    OPC_NORI_B      = (0x2 << 24) | OPC_MSA_I8_00,
-    OPC_BSELI_B     = (0x2 << 24) | OPC_MSA_I8_01,
-    OPC_XORI_B      = (0x3 << 24) | OPC_MSA_I8_00,
-
     /* VEC/2R/2RF instruction */
     OPC_AND_V       = (0x00 << 21) | OPC_MSA_VEC,
     OPC_OR_V        = (0x01 << 21) | OPC_MSA_VEC,
@@ -334,6 +322,7 @@ static inline bool check_msa_enabled(DisasContext *ctx)
     return true;
 }
 
+typedef void gen_helper_piii(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32);
 typedef void gen_helper_piiii(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32, TCGv_i32);
 
 /*
@@ -441,50 +430,25 @@ static bool trans_BNZ(DisasContext *ctx, arg_msa_bz *a)
     return gen_msa_BxZ(ctx, a->df, a->wt, a->sa, true);
 }
 
-static void gen_msa_i8(DisasContext *ctx)
+static bool trans_msa_i8(DisasContext *ctx, arg_msa_i8 *a,
+                         gen_helper_piii *gen_msa_i8)
 {
-#define MASK_MSA_I8(op)    (MASK_MSA_MINOR(op) | (op & (0x03 << 24)))
-    uint8_t i8 = (ctx->opcode >> 16) & 0xff;
-    uint8_t ws = (ctx->opcode >> 11) & 0x1f;
-    uint8_t wd = (ctx->opcode >> 6) & 0x1f;
+    gen_msa_i8(cpu_env,
+               tcg_constant_i32(a->wd),
+               tcg_constant_i32(a->ws),
+               tcg_constant_i32(a->sa));
 
-    TCGv_i32 twd = tcg_const_i32(wd);
-    TCGv_i32 tws = tcg_const_i32(ws);
-    TCGv_i32 ti8 = tcg_const_i32(i8);
-
-    switch (MASK_MSA_I8(ctx->opcode)) {
-    case OPC_ANDI_B:
-        gen_helper_msa_andi_b(cpu_env, twd, tws, ti8);
-        break;
-    case OPC_ORI_B:
-        gen_helper_msa_ori_b(cpu_env, twd, tws, ti8);
-        break;
-    case OPC_NORI_B:
-        gen_helper_msa_nori_b(cpu_env, twd, tws, ti8);
-        break;
-    case OPC_XORI_B:
-        gen_helper_msa_xori_b(cpu_env, twd, tws, ti8);
-        break;
-    case OPC_BMNZI_B:
-        gen_helper_msa_bmnzi_b(cpu_env, twd, tws, ti8);
-        break;
-    case OPC_BMZI_B:
-        gen_helper_msa_bmzi_b(cpu_env, twd, tws, ti8);
-        break;
-    case OPC_BSELI_B:
-        gen_helper_msa_bseli_b(cpu_env, twd, tws, ti8);
-        break;
-    default:
-        MIPS_INVAL("MSA instruction");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-
-    tcg_temp_free_i32(twd);
-    tcg_temp_free_i32(tws);
-    tcg_temp_free_i32(ti8);
+    return true;
 }
 
+TRANS_MSA(ANDI,     trans_msa_i8, gen_helper_msa_andi_b);
+TRANS_MSA(ORI,      trans_msa_i8, gen_helper_msa_ori_b);
+TRANS_MSA(NORI,     trans_msa_i8, gen_helper_msa_nori_b);
+TRANS_MSA(XORI,     trans_msa_i8, gen_helper_msa_xori_b);
+TRANS_MSA(BMNZI,    trans_msa_i8, gen_helper_msa_bmnzi_b);
+TRANS_MSA(BMZI,     trans_msa_i8, gen_helper_msa_bmzi_b);
+TRANS_MSA(BSELI,    trans_msa_i8, gen_helper_msa_bseli_b);
+
 static bool trans_SHF(DisasContext *ctx, arg_msa_i8 *a)
 {
     if (a->df == DF_DOUBLE) {
@@ -2111,11 +2075,6 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
     }
 
     switch (MASK_MSA_MINOR(opcode)) {
-    case OPC_MSA_I8_00:
-    case OPC_MSA_I8_01:
-    case OPC_MSA_I8_02:
-        gen_msa_i8(ctx);
-        break;
     case OPC_MSA_3R_0D:
     case OPC_MSA_3R_0E:
     case OPC_MSA_3R_0F:
-- 
2.31.1


