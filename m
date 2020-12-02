Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB652CC5E0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 19:51:28 +0100 (CET)
Received: from localhost ([::1]:59922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkXDr-00052R-K8
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 13:51:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkX7g-0005kq-JV
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 13:45:04 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:46742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkX7e-0002g6-Sm
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 13:45:04 -0500
Received: by mail-ej1-x643.google.com with SMTP id bo9so5864024ejb.13
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 10:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eHXFXj870qIY4C/nWYXRi/ekP6hdOkoFn16uMxuOt10=;
 b=MOATcFxyWEXuIJOfCzgDGP/eo9oBYc/wwsOhQbE4b+OvOC1874QiVJXWDWt0x/vyop
 LwyMaNRD+fNKQMU3Xf5AN5Zg8HhoXohX2VnCiCWQDU9PepFqNbexMVRi/T2eHJRfnzAp
 ZDRWF6GupuD4xpKe3E8vEqEikkQUg4weSQ7ekH+iegJvqyljIqX6g4XdWFqoJT/b2hdu
 jCn0rg0XJMGotIJXVNGKX8Cgwex9acBzZKaQHQ4SWcEzX93Uhsy0PugTyo8qv8wMy5Cc
 JCUXdmgOtqdXxKJp9wEjIBH7pPoHuGe6sAg3jAyWUwdreWrSSf/YfCRL5mqcrLruZZJq
 TF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eHXFXj870qIY4C/nWYXRi/ekP6hdOkoFn16uMxuOt10=;
 b=hxwzYV3lN9dRwq0mPfgbaq7R2pE0ZiJssoxW5oJWPljsiwAYqnQHuFq8s4WdJl9qJk
 aCcccDDINm/eeOxUvtGn0Z5mkuQyXsvfWEsRpPYznRA3WHQ6Lx/9SQphOnO9NbQAgDTF
 Ltm3m1orzQFHo3YpR+BY5Vk3Z0+1NHLW1sJW0QUwl00EZFwGBiVA2hrUOAbu6pAxN/4x
 TkasIQgX/8zi+783FJD5aV3jEuVrvtYrME+4lZwcINLm2MslzU0V2AsR84J/VV+XWIO/
 9v1SRkg2abn0sQ86wn46Pfu6myHTUvgI0nHRvaqtZgC4UU57J+VeGhcI8YMv58wZJ+Ea
 SPQw==
X-Gm-Message-State: AOAM530CUr1lSPrd+JQbmBCovoA+4RD/0W2qorWRU8b1ehAqcTUSrGXD
 6alHG7ls4xUK5/lxb7WPtNJB3k5GIeY=
X-Google-Smtp-Source: ABdhPJzY357Mkj0Ye7EAR4HvTrZLd8oLHnF74RVnfog/mNjIQhygZUKsA+/cv185VPgcdjEsEiLMBw==
X-Received: by 2002:a17:907:210b:: with SMTP id
 qn11mr1141345ejb.41.1606934701182; 
 Wed, 02 Dec 2020 10:45:01 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id cb14sm449258ejb.105.2020.12.02.10.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 10:45:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/9] target/mips: Remove CPUMIPSState* argument from
 gen_msa*() methods
Date: Wed,  2 Dec 2020 19:44:14 +0100
Message-Id: <20201202184415.1434484-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201202184415.1434484-1-f4bug@amsat.org>
References: <20201202184415.1434484-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x643.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The gen_msa*() methods don't use the "CPUMIPSState *env"
argument. Remove it to simplify.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 57 ++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 29 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index a5112acc351..5311e6ced62 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28744,7 +28744,7 @@ static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt)
     tcg_temp_free_i64(t1);
 }
 
-static void gen_msa_branch(CPUMIPSState *env, DisasContext *ctx, uint32_t op1)
+static void gen_msa_branch(DisasContext *ctx, uint32_t op1)
 {
     uint8_t df = (ctx->opcode >> 21) & 0x3;
     uint8_t wt = (ctx->opcode >> 16) & 0x1f;
@@ -28789,7 +28789,7 @@ static void gen_msa_branch(CPUMIPSState *env, DisasContext *ctx, uint32_t op1)
     ctx->hflags |= MIPS_HFLAG_BDS32;
 }
 
-static void gen_msa_i8(CPUMIPSState *env, DisasContext *ctx)
+static void gen_msa_i8(DisasContext *ctx)
 {
 #define MASK_MSA_I8(op)    (MASK_MSA_MINOR(op) | (op & (0x03 << 24)))
     uint8_t i8 = (ctx->opcode >> 16) & 0xff;
@@ -28847,7 +28847,7 @@ static void gen_msa_i8(CPUMIPSState *env, DisasContext *ctx)
     tcg_temp_free_i32(ti8);
 }
 
-static void gen_msa_i5(CPUMIPSState *env, DisasContext *ctx)
+static void gen_msa_i5(DisasContext *ctx)
 {
 #define MASK_MSA_I5(op)    (MASK_MSA_MINOR(op) | (op & (0x7 << 23)))
     uint8_t df = (ctx->opcode >> 21) & 0x3;
@@ -28920,7 +28920,7 @@ static void gen_msa_i5(CPUMIPSState *env, DisasContext *ctx)
     tcg_temp_free_i32(timm);
 }
 
-static void gen_msa_bit(CPUMIPSState *env, DisasContext *ctx)
+static void gen_msa_bit(DisasContext *ctx)
 {
 #define MASK_MSA_BIT(op)    (MASK_MSA_MINOR(op) | (op & (0x7 << 23)))
     uint8_t dfm = (ctx->opcode >> 16) & 0x7f;
@@ -29004,7 +29004,7 @@ static void gen_msa_bit(CPUMIPSState *env, DisasContext *ctx)
     tcg_temp_free_i32(tws);
 }
 
-static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
+static void gen_msa_3r(DisasContext *ctx)
 {
 #define MASK_MSA_3R(op)    (MASK_MSA_MINOR(op) | (op & (0x7 << 23)))
     uint8_t df = (ctx->opcode >> 21) & 0x3;
@@ -29986,7 +29986,7 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
     tcg_temp_free_i32(tdf);
 }
 
-static void gen_msa_elm_3e(CPUMIPSState *env, DisasContext *ctx)
+static void gen_msa_elm_3e(DisasContext *ctx)
 {
 #define MASK_MSA_ELM_DF3E(op)   (MASK_MSA_MINOR(op) | (op & (0x3FF << 16)))
     uint8_t source = (ctx->opcode >> 11) & 0x1f;
@@ -30018,8 +30018,7 @@ static void gen_msa_elm_3e(CPUMIPSState *env, DisasContext *ctx)
     tcg_temp_free_i32(tsr);
 }
 
-static void gen_msa_elm_df(CPUMIPSState *env, DisasContext *ctx, uint32_t df,
-        uint32_t n)
+static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
 {
 #define MASK_MSA_ELM(op)    (MASK_MSA_MINOR(op) | (op & (0xf << 22)))
     uint8_t ws = (ctx->opcode >> 11) & 0x1f;
@@ -30129,7 +30128,7 @@ static void gen_msa_elm_df(CPUMIPSState *env, DisasContext *ctx, uint32_t df,
     tcg_temp_free_i32(tdf);
 }
 
-static void gen_msa_elm(CPUMIPSState *env, DisasContext *ctx)
+static void gen_msa_elm(DisasContext *ctx)
 {
     uint8_t dfn = (ctx->opcode >> 16) & 0x3f;
     uint32_t df = 0, n = 0;
@@ -30148,17 +30147,17 @@ static void gen_msa_elm(CPUMIPSState *env, DisasContext *ctx)
         df = DF_DOUBLE;
     } else if (dfn == 0x3E) {
         /* CTCMSA, CFCMSA, MOVE.V */
-        gen_msa_elm_3e(env, ctx);
+        gen_msa_elm_3e(ctx);
         return;
     } else {
         generate_exception_end(ctx, EXCP_RI);
         return;
     }
 
-    gen_msa_elm_df(env, ctx, df, n);
+    gen_msa_elm_df(ctx, df, n);
 }
 
-static void gen_msa_3rf(CPUMIPSState *env, DisasContext *ctx)
+static void gen_msa_3rf(DisasContext *ctx)
 {
 #define MASK_MSA_3RF(op)    (MASK_MSA_MINOR(op) | (op & (0xf << 22)))
     uint8_t df = (ctx->opcode >> 21) & 0x1;
@@ -30316,7 +30315,7 @@ static void gen_msa_3rf(CPUMIPSState *env, DisasContext *ctx)
     tcg_temp_free_i32(tdf);
 }
 
-static void gen_msa_2r(CPUMIPSState *env, DisasContext *ctx)
+static void gen_msa_2r(DisasContext *ctx)
 {
 #define MASK_MSA_2R(op)     (MASK_MSA_MINOR(op) | (op & (0x1f << 21)) | \
                             (op & (0x7 << 18)))
@@ -30400,7 +30399,7 @@ static void gen_msa_2r(CPUMIPSState *env, DisasContext *ctx)
     tcg_temp_free_i32(tdf);
 }
 
-static void gen_msa_2rf(CPUMIPSState *env, DisasContext *ctx)
+static void gen_msa_2rf(DisasContext *ctx)
 {
 #define MASK_MSA_2RF(op)    (MASK_MSA_MINOR(op) | (op & (0x1f << 21)) | \
                             (op & (0xf << 17)))
@@ -30471,7 +30470,7 @@ static void gen_msa_2rf(CPUMIPSState *env, DisasContext *ctx)
     tcg_temp_free_i32(tdf);
 }
 
-static void gen_msa_vec_v(CPUMIPSState *env, DisasContext *ctx)
+static void gen_msa_vec_v(DisasContext *ctx)
 {
 #define MASK_MSA_VEC(op)    (MASK_MSA_MINOR(op) | (op & (0x1f << 21)))
     uint8_t wt = (ctx->opcode >> 16) & 0x1f;
@@ -30514,7 +30513,7 @@ static void gen_msa_vec_v(CPUMIPSState *env, DisasContext *ctx)
     tcg_temp_free_i32(twt);
 }
 
-static void gen_msa_vec(CPUMIPSState *env, DisasContext *ctx)
+static void gen_msa_vec(DisasContext *ctx)
 {
     switch (MASK_MSA_VEC(ctx->opcode)) {
     case OPC_AND_V:
@@ -30524,13 +30523,13 @@ static void gen_msa_vec(CPUMIPSState *env, DisasContext *ctx)
     case OPC_BMNZ_V:
     case OPC_BMZ_V:
     case OPC_BSEL_V:
-        gen_msa_vec_v(env, ctx);
+        gen_msa_vec_v(ctx);
         break;
     case OPC_MSA_2R:
-        gen_msa_2r(env, ctx);
+        gen_msa_2r(ctx);
         break;
     case OPC_MSA_2RF:
-        gen_msa_2rf(env, ctx);
+        gen_msa_2rf(ctx);
         break;
     default:
         MIPS_INVAL("MSA instruction");
@@ -30539,7 +30538,7 @@ static void gen_msa_vec(CPUMIPSState *env, DisasContext *ctx)
     }
 }
 
-static void gen_msa(CPUMIPSState *env, DisasContext *ctx)
+static void gen_msa(DisasContext *ctx)
 {
     uint32_t opcode = ctx->opcode;
 
@@ -30549,15 +30548,15 @@ static void gen_msa(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MSA_I8_00:
     case OPC_MSA_I8_01:
     case OPC_MSA_I8_02:
-        gen_msa_i8(env, ctx);
+        gen_msa_i8(ctx);
         break;
     case OPC_MSA_I5_06:
     case OPC_MSA_I5_07:
-        gen_msa_i5(env, ctx);
+        gen_msa_i5(ctx);
         break;
     case OPC_MSA_BIT_09:
     case OPC_MSA_BIT_0A:
-        gen_msa_bit(env, ctx);
+        gen_msa_bit(ctx);
         break;
     case OPC_MSA_3R_0D:
     case OPC_MSA_3R_0E:
@@ -30568,18 +30567,18 @@ static void gen_msa(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MSA_3R_13:
     case OPC_MSA_3R_14:
     case OPC_MSA_3R_15:
-        gen_msa_3r(env, ctx);
+        gen_msa_3r(ctx);
         break;
     case OPC_MSA_ELM:
-        gen_msa_elm(env, ctx);
+        gen_msa_elm(ctx);
         break;
     case OPC_MSA_3RF_1A:
     case OPC_MSA_3RF_1B:
     case OPC_MSA_3RF_1C:
-        gen_msa_3rf(env, ctx);
+        gen_msa_3rf(ctx);
         break;
     case OPC_MSA_VEC:
-        gen_msa_vec(env, ctx);
+        gen_msa_vec(ctx);
         break;
     case OPC_LD_B:
     case OPC_LD_H:
@@ -31190,7 +31189,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
         case OPC_BNZ_W:
         case OPC_BNZ_D:
             if (ase_msa_available(env)) {
-                gen_msa_branch(env, ctx, op1);
+                gen_msa_branch(ctx, op1);
                 break;
             }
         default:
@@ -31382,7 +31381,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
         } else {
             /* MDMX: Not implemented. */
             if (ase_msa_available(env)) {
-                gen_msa(env, ctx);
+                gen_msa(ctx);
             }
         }
         break;
-- 
2.26.2


