Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A684385AE
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 00:02:15 +0200 (CEST)
Received: from localhost ([::1]:53720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meP5i-0002S0-9f
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 18:02:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOsw-0004kw-6X
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:49:02 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOsu-0005Qf-3P
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:49:01 -0400
Received: by mail-wr1-x433.google.com with SMTP id z14so3685109wrg.6
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7Twe1tKnuWtesTnk71X2V6F+BbjJ4TQgKol2D+Vvz98=;
 b=Hex5MOIbTKi1Zje7/On3X7aAcBD4ucfx4PfSBAbK9aBW4bIEskzrmfAIIufvT/2oey
 hUAKU37Xu2WAjIQKWKu4z3SPMqOsqlgUaYcJk3AY7nDbIV9d1IK3G/1+rzo9tkSeTXNQ
 bHOsC6A9nbmp8703Q6DwCCMYBFvDOc4E8UTN2YvqZMYIUNL7Ry8J1DmkWiYHJF2bPWzI
 jTq5MFl9rYrhLemRIOxCKCNEUghX+DqGpZOQJFSBbOCfMEsVy/12oHHwU4oOk5N1ra6P
 mOlpxpv2jT8c/LDtSxiPO0v1AdmxhFeC0oR6+V6OaCOnF0UhT3Ji0PTr/sThTF/8HF6u
 rDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7Twe1tKnuWtesTnk71X2V6F+BbjJ4TQgKol2D+Vvz98=;
 b=FM/yGpj80kOdM4JE+MUnRylBjO9o+ky4oBENQQWrBQ9JaQVH1dLV+6oRp+mZx99K+S
 hqZYobGtQ1uLqyS8UBIN4m2PJ0YkNuvLRYy3iVKmV2N3V8w+Xp62j+apOPx52kwMAUgb
 19MtPX0ax+KM6AjMLEvLGEHT+fB3ibX/nkUbKgIAWA74ovdXnDrQldMgvUvXphNUJLVg
 skw5bYT8JPJw8Bmg0HR0PamWudGxw7TcL2CqxbtudTb6sU12kwNqMGJhGDMxP/aP4NRh
 B/AW6gOa3XTPKRGRci78uElEytPIrS0sbSTznNEU4XDtyRDM95f/qJ75yN0D+JTSEkk9
 TLbA==
X-Gm-Message-State: AOAM532bT9HfF2U5F8+8DLbrKk7NZdUJ3mXP7GWDdb4XviwDHaANAUkK
 rn833ntJO76Q0lm1K2NAHrcoiQkqwmI=
X-Google-Smtp-Source: ABdhPJzoSAq9XsjF3ihflLJxgI9lHbsMLHMQbcqWRJnpTiP2iegX/umLs+p4DkI1OQlmQfHkOt1R0Q==
X-Received: by 2002:a5d:4a4d:: with SMTP id v13mr10441801wrs.353.1635025738685; 
 Sat, 23 Oct 2021 14:48:58 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 i24sm12150286wml.26.2021.10.23.14.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:48:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/33] target/mips: Convert MSA I5 instruction format to
 decodetree
Date: Sat, 23 Oct 2021 23:47:41 +0200
Message-Id: <20211023214803.522078-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
 Luis Pires <luis.pires@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert instructions with a 5-bit immediate value to decodetree.

Since the 'data format' field is a constant value, use
tcg_constant_i32() instead of a TCG temporary.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      | 15 +++++
 target/mips/tcg/msa_translate.c | 99 +++++++++------------------------
 2 files changed, 40 insertions(+), 74 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 86aa66f05b9..5aaa85456da 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -19,6 +19,8 @@
 @lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &r
 @bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
 @bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
+@u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_ldst
+@s5                 ...... ... df:2 sa:s5 ws:5 wd:5 ......  &msa_ldst
 @ldi                ...... ... df:2 sa:s10     wd:5 ......  &msa_ldst ws=0
 
 LSA                 000000 ..... ..... ..... 000 .. 000101  @lsa
@@ -30,6 +32,19 @@ BZ                  010001 110 .. ..... ................    @bz
 BNZ                 010001 111 .. ..... ................    @bz
 
 {
+  ADDVI             011110 000 .. ..... ..... ..... 000110  @u5
+  SUBVI             011110 001 .. ..... ..... ..... 000110  @u5
+  MAXI_S            011110 010 .. ..... ..... ..... 000110  @s5
+  MAXI_U            011110 011 .. ..... ..... ..... 000110  @u5
+  MINI_S            011110 100 .. ..... ..... ..... 000110  @s5
+  MINI_U            011110 101 .. ..... ..... ..... 000110  @u5
+
+  CEQI              011110 000 .. ..... ..... ..... 000111  @s5
+  CLTI_S            011110 010 .. ..... ..... ..... 000111  @s5
+  CLTI_U            011110 011 .. ..... ..... ..... 000111  @u5
+  CLEI_S            011110 100 .. ..... ..... ..... 000111  @s5
+  CLEI_U            011110 101 .. ..... ..... ..... 000111  @u5
+
   LDI               011110 110 .. ..........  ..... 000111  @ldi
 
   MSA               011110 --------------------------
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 7c1bbfaec61..962aef601cb 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -27,8 +27,6 @@ enum {
     OPC_MSA_I8_00   = 0x00 | OPC_MSA,
     OPC_MSA_I8_01   = 0x01 | OPC_MSA,
     OPC_MSA_I8_02   = 0x02 | OPC_MSA,
-    OPC_MSA_I5_06   = 0x06 | OPC_MSA,
-    OPC_MSA_I5_07   = 0x07 | OPC_MSA,
     OPC_MSA_BIT_09  = 0x09 | OPC_MSA,
     OPC_MSA_BIT_0A  = 0x0A | OPC_MSA,
     OPC_MSA_3R_0D   = 0x0D | OPC_MSA,
@@ -58,19 +56,6 @@ enum {
 };
 
 enum {
-    /* I5 instruction df(bits 22..21) = _b, _h, _w, _d */
-    OPC_ADDVI_df    = (0x0 << 23) | OPC_MSA_I5_06,
-    OPC_CEQI_df     = (0x0 << 23) | OPC_MSA_I5_07,
-    OPC_SUBVI_df    = (0x1 << 23) | OPC_MSA_I5_06,
-    OPC_MAXI_S_df   = (0x2 << 23) | OPC_MSA_I5_06,
-    OPC_CLTI_S_df   = (0x2 << 23) | OPC_MSA_I5_07,
-    OPC_MAXI_U_df   = (0x3 << 23) | OPC_MSA_I5_06,
-    OPC_CLTI_U_df   = (0x3 << 23) | OPC_MSA_I5_07,
-    OPC_MINI_S_df   = (0x4 << 23) | OPC_MSA_I5_06,
-    OPC_CLEI_S_df   = (0x4 << 23) | OPC_MSA_I5_07,
-    OPC_MINI_U_df   = (0x5 << 23) | OPC_MSA_I5_06,
-    OPC_CLEI_U_df   = (0x5 << 23) | OPC_MSA_I5_07,
-
     /* I8 instruction */
     OPC_ANDI_B      = (0x0 << 24) | OPC_MSA_I8_00,
     OPC_BMNZI_B     = (0x0 << 24) | OPC_MSA_I8_01,
@@ -341,6 +326,9 @@ static inline bool check_msa_access(DisasContext *ctx)
     return true;
 }
 
+#define TRANS_MSA(NAME, trans_func, gen_func) \
+        TRANS_CHECK(NAME, check_msa_access(ctx), trans_func, gen_func)
+
 static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt,
                                    TCGCond cond)
 {
@@ -507,69 +495,36 @@ static void gen_msa_i8(DisasContext *ctx)
     tcg_temp_free_i32(ti8);
 }
 
-static void gen_msa_i5(DisasContext *ctx)
+static bool trans_msa_i5(DisasContext *ctx, arg_msa_ldst *a,
+                         void (*gen_msa_i5)(TCGv_ptr, TCGv_i32, TCGv_i32,
+                                            TCGv_i32, TCGv_i32))
 {
-#define MASK_MSA_I5(op)    (MASK_MSA_MINOR(op) | (op & (0x7 << 23)))
-    int8_t s5 = (int8_t) sextract32(ctx->opcode, 16, 5);
-    uint8_t u5 = extract32(ctx->opcode, 16, 5);
+    TCGv_i32 tdf = tcg_constant_i32(a->df);
+    TCGv_i32 twd = tcg_const_i32(a->wd);
+    TCGv_i32 tws = tcg_const_i32(a->ws);
+    TCGv_i32 timm = tcg_const_i32(a->sa);
 
-    TCGv_i32 tdf = tcg_const_i32(extract32(ctx->opcode, 21, 2));
-    TCGv_i32 twd = tcg_const_i32(extract32(ctx->opcode, 11, 5));
-    TCGv_i32 tws = tcg_const_i32(extract32(ctx->opcode, 6, 5));
-    TCGv_i32 timm = tcg_temp_new_i32();
-    tcg_gen_movi_i32(timm, u5);
+    gen_msa_i5(cpu_env, tdf, twd, tws, timm);
 
-    switch (MASK_MSA_I5(ctx->opcode)) {
-    case OPC_ADDVI_df:
-        gen_helper_msa_addvi_df(cpu_env, tdf, twd, tws, timm);
-        break;
-    case OPC_SUBVI_df:
-        gen_helper_msa_subvi_df(cpu_env, tdf, twd, tws, timm);
-        break;
-    case OPC_MAXI_S_df:
-        tcg_gen_movi_i32(timm, s5);
-        gen_helper_msa_maxi_s_df(cpu_env, tdf, twd, tws, timm);
-        break;
-    case OPC_MAXI_U_df:
-        gen_helper_msa_maxi_u_df(cpu_env, tdf, twd, tws, timm);
-        break;
-    case OPC_MINI_S_df:
-        tcg_gen_movi_i32(timm, s5);
-        gen_helper_msa_mini_s_df(cpu_env, tdf, twd, tws, timm);
-        break;
-    case OPC_MINI_U_df:
-        gen_helper_msa_mini_u_df(cpu_env, tdf, twd, tws, timm);
-        break;
-    case OPC_CEQI_df:
-        tcg_gen_movi_i32(timm, s5);
-        gen_helper_msa_ceqi_df(cpu_env, tdf, twd, tws, timm);
-        break;
-    case OPC_CLTI_S_df:
-        tcg_gen_movi_i32(timm, s5);
-        gen_helper_msa_clti_s_df(cpu_env, tdf, twd, tws, timm);
-        break;
-    case OPC_CLTI_U_df:
-        gen_helper_msa_clti_u_df(cpu_env, tdf, twd, tws, timm);
-        break;
-    case OPC_CLEI_S_df:
-        tcg_gen_movi_i32(timm, s5);
-        gen_helper_msa_clei_s_df(cpu_env, tdf, twd, tws, timm);
-        break;
-    case OPC_CLEI_U_df:
-        gen_helper_msa_clei_u_df(cpu_env, tdf, twd, tws, timm);
-        break;
-    default:
-        MIPS_INVAL("MSA instruction");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-
-    tcg_temp_free_i32(tdf);
     tcg_temp_free_i32(twd);
     tcg_temp_free_i32(tws);
     tcg_temp_free_i32(timm);
+
+    return true;
 }
 
+TRANS_MSA(ADDVI,    trans_msa_i5, gen_helper_msa_addvi_df);
+TRANS_MSA(SUBVI,    trans_msa_i5, gen_helper_msa_subvi_df);
+TRANS_MSA(MAXI_S,   trans_msa_i5, gen_helper_msa_maxi_s_df);
+TRANS_MSA(MAXI_U,   trans_msa_i5, gen_helper_msa_maxi_u_df);
+TRANS_MSA(MINI_S,   trans_msa_i5, gen_helper_msa_mini_s_df);
+TRANS_MSA(MINI_U,   trans_msa_i5, gen_helper_msa_mini_u_df);
+TRANS_MSA(CLTI_S,   trans_msa_i5, gen_helper_msa_clti_s_df);
+TRANS_MSA(CLTI_U,   trans_msa_i5, gen_helper_msa_clti_u_df);
+TRANS_MSA(CLEI_S,   trans_msa_i5, gen_helper_msa_clei_s_df);
+TRANS_MSA(CLEI_U,   trans_msa_i5, gen_helper_msa_clei_u_df);
+TRANS_MSA(CEQI,     trans_msa_i5, gen_helper_msa_ceqi_df);
+
 static bool trans_LDI(DisasContext *ctx, arg_msa_ldst *a)
 {
     TCGv_i32 tdf;
@@ -2196,10 +2151,6 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
     case OPC_MSA_I8_02:
         gen_msa_i8(ctx);
         break;
-    case OPC_MSA_I5_06:
-    case OPC_MSA_I5_07:
-        gen_msa_i5(ctx);
-        break;
     case OPC_MSA_BIT_09:
     case OPC_MSA_BIT_0A:
         gen_msa_bit(ctx);
-- 
2.31.1


