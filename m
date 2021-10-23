Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A784385B0
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 00:03:32 +0200 (CEST)
Received: from localhost ([::1]:57226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meP6x-0004vK-Gg
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 18:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOtU-0005tB-6n
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:49:37 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOtS-0005gs-6z
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:49:35 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 b133-20020a1c808b000000b0032ca4d18aebso4495201wmd.2
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uEqIO2wOqp/xkdcCJeWEtzRHUYdaax9QNLinrvilNug=;
 b=JW3UZD09gk1Uc8F2x/EVRJ8BvMjLu1Z1Gjh0oJAOD6S3rUIHewk/XhaHCl97KCD+go
 Ebqp/x7wTowwrFiC8FYcEZZ0FRYWCGjo97LPp/45y7jWUD7Yfh7P2BVpxlXEavWoI42a
 URKgWTp1gDxj3Bnb3k/6hJRhGEq3TSgfHtkrIZnXFmKl0GxlhLp072L5XSnpM4CXQAfh
 1CmTWpSycOZL/3XbpXG7sBwKLH+lB3j3aCcvB569UgyPpKX0Wsvt4r/DWAf2x89MOf+W
 q6ueMBpGT8BoyJI3UU2YuvrmcCHLhGbD+eVyW6A/i1wrl2Eb2yb1toQ1wS6G3HXMQfDG
 Id2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uEqIO2wOqp/xkdcCJeWEtzRHUYdaax9QNLinrvilNug=;
 b=4KNOpugKkfY+9IsBMoD0nPjtxzCZuF+sJfEabOk+xmV2RjMOjWERqqiYFRpZPzadn/
 jdL52T3WXirNa7MGz/VneUgcquodrpzrPwHMhEFchJCCzsHetvCT9eE3/ZoGZEoazTs9
 BVnHjGhgBasqsJO8eUre7mmzC0wBkzaxgQyyp5R3VFD7NICAffLXRAyh8jDyorcHUzpX
 ggeUHrjvfeUbTyg8JM3z7X6CMUqVVzizIoy9ojqHOpKLIbv1/zn0pC63PSndeg+2JUoF
 /CdEYLfG6LyHqoZJIT4CogDsafOOP8Y4VLVGBKbw2N+/fNlyzI5bSHNrm9u9Pbq5majH
 EhvQ==
X-Gm-Message-State: AOAM533Ybzu8KUEtLmPIFSWSaPRbGpX8s7sYmpUfLiEhpZ2CX/P/cMS0
 lcfxh3VEuCO+xmihmO22OEgZmj9e4mE=
X-Google-Smtp-Source: ABdhPJxQQF2aPXkiNfvP/VJr4BGgOMJ8FaxpyY1narahwVNa9b2n9LIcCOUHo84hag28HmWBC9XwtA==
X-Received: by 2002:a1c:cc19:: with SMTP id h25mr10355724wmb.57.1635025772652; 
 Sat, 23 Oct 2021 14:49:32 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 j7sm15355785wmq.32.2021.10.23.14.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:49:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/33] target/mips: Convert MSA 2R instruction format to
 decodetree
Date: Sat, 23 Oct 2021 23:47:48 +0200
Message-Id: <20211023214803.522078-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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

Convert 2-register operations to decodetree.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  3 ++
 target/mips/tcg/msa_translate.c | 91 +++++++++------------------------
 2 files changed, 28 insertions(+), 66 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index e97490cf880..88757f547eb 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -78,6 +78,9 @@ BNZ                 010001 111 .. ..... ................    @bz
   SRLRI             011110 011 ....... ..... .....  001010  @bit
 
   FILL              011110 11000000 .. ..... .....  011110  @2r
+  PCNT              011110 11000001 .. ..... .....  011110  @2r
+  NLOC              011110 11000010 .. ..... .....  011110  @2r
+  NLZC              011110 11000011 .. ..... .....  011110  @2r
   FCLASS            011110 110010000 . ..... .....  011110  @2rf
   FTRUNC_S          011110 110010001 . ..... .....  011110  @2rf
   FTRUNC_U          011110 110010010 . ..... .....  011110  @2rf
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index fc0b80f83ac..f54e9d173ac 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -50,13 +50,6 @@ enum {
     OPC_BMZ_V       = (0x05 << 21) | OPC_MSA_VEC,
     OPC_BSEL_V      = (0x06 << 21) | OPC_MSA_VEC,
 
-    OPC_MSA_2R      = (0x18 << 21) | OPC_MSA_VEC,
-
-    /* 2R instruction df(bits 17..16) = _b, _h, _w, _d */
-    OPC_PCNT_df     = (0x01 << 18) | OPC_MSA_2R,
-    OPC_NLOC_df     = (0x02 << 18) | OPC_MSA_2R,
-    OPC_NLZC_df     = (0x03 << 18) | OPC_MSA_2R,
-
     /* 3R instruction df(bits 22..21) = _b, _h, _w, d */
     OPC_SLL_df      = (0x0 << 23) | OPC_MSA_3R_0D,
     OPC_ADDV_df     = (0x0 << 23) | OPC_MSA_3R_0E,
@@ -1832,75 +1825,44 @@ static void gen_msa_3rf(DisasContext *ctx)
     tcg_temp_free_i32(twt);
 }
 
-static void gen_msa_2r(DisasContext *ctx)
+static bool trans_msa_2r(DisasContext *ctx, arg_msa_r *a,
+                         void (*gen_msa_2r_b)(TCGv_ptr, TCGv_i32, TCGv_i32),
+                         void (*gen_msa_2r_h)(TCGv_ptr, TCGv_i32, TCGv_i32),
+                         void (*gen_msa_2r_w)(TCGv_ptr, TCGv_i32, TCGv_i32),
+                         void (*gen_msa_2r_d)(TCGv_ptr, TCGv_i32, TCGv_i32))
 {
-#define MASK_MSA_2R(op)     (MASK_MSA_MINOR(op) | (op & (0x1f << 21)) | \
-                            (op & (0x7 << 18)))
-    uint8_t ws = (ctx->opcode >> 11) & 0x1f;
-    uint8_t wd = (ctx->opcode >> 6) & 0x1f;
-    uint8_t df = (ctx->opcode >> 16) & 0x3;
-    TCGv_i32 twd = tcg_const_i32(wd);
-    TCGv_i32 tws = tcg_const_i32(ws);
+    TCGv_i32 twd = tcg_const_i32(a->wd);
+    TCGv_i32 tws = tcg_const_i32(a->ws);
 
-    switch (MASK_MSA_2R(ctx->opcode)) {
-    case OPC_NLOC_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_nloc_b(cpu_env, twd, tws);
-            break;
-        case DF_HALF:
-            gen_helper_msa_nloc_h(cpu_env, twd, tws);
-            break;
-        case DF_WORD:
-            gen_helper_msa_nloc_w(cpu_env, twd, tws);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_nloc_d(cpu_env, twd, tws);
-            break;
+    switch (a->df) {
+    case DF_BYTE:
+        if (gen_msa_2r_b == NULL) {
+            gen_reserved_instruction(ctx);
+        } else {
+            gen_msa_2r_b(cpu_env, twd, tws);
         }
         break;
-    case OPC_NLZC_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_nlzc_b(cpu_env, twd, tws);
-            break;
-        case DF_HALF:
-            gen_helper_msa_nlzc_h(cpu_env, twd, tws);
-            break;
-        case DF_WORD:
-            gen_helper_msa_nlzc_w(cpu_env, twd, tws);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_nlzc_d(cpu_env, twd, tws);
-            break;
-        }
+    case DF_HALF:
+        gen_msa_2r_h(cpu_env, twd, tws);
         break;
-    case OPC_PCNT_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_pcnt_b(cpu_env, twd, tws);
-            break;
-        case DF_HALF:
-            gen_helper_msa_pcnt_h(cpu_env, twd, tws);
-            break;
-        case DF_WORD:
-            gen_helper_msa_pcnt_w(cpu_env, twd, tws);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_pcnt_d(cpu_env, twd, tws);
-            break;
-        }
+    case DF_WORD:
+        gen_msa_2r_w(cpu_env, twd, tws);
         break;
-    default:
-        MIPS_INVAL("MSA instruction");
-        gen_reserved_instruction(ctx);
+    case DF_DOUBLE:
+        gen_msa_2r_d(cpu_env, twd, tws);
         break;
     }
 
     tcg_temp_free_i32(twd);
     tcg_temp_free_i32(tws);
+
+    return true;
 }
 
+TRANS_DF_E(PCNT, trans_msa_2r, gen_helper_msa_pcnt);
+TRANS_DF_E(NLOC, trans_msa_2r, gen_helper_msa_nloc);
+TRANS_DF_E(NLZC, trans_msa_2r, gen_helper_msa_nlzc);
+
 static bool trans_FILL(DisasContext *ctx, arg_msa_r *a)
 {
     TCGv_i32 twd;
@@ -2018,9 +1980,6 @@ static void gen_msa_vec(DisasContext *ctx)
     case OPC_BSEL_V:
         gen_msa_vec_v(ctx);
         break;
-    case OPC_MSA_2R:
-        gen_msa_2r(ctx);
-        break;
     default:
         MIPS_INVAL("MSA instruction");
         gen_reserved_instruction(ctx);
-- 
2.31.1


