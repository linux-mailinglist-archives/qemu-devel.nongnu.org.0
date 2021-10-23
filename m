Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C9243859D
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 23:54:33 +0200 (CEST)
Received: from localhost ([::1]:58208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meOyG-0003SZ-Py
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 17:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOtZ-00066t-O9
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:49:41 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOtY-0005iR-3x
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:49:41 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 g201-20020a1c20d2000000b00327775075f7so126407wmg.5
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V2YNKMYkRLSbMPSCXijWN2U7P7p3cWA9eRMds81+W0U=;
 b=R0LB1uqQ4MWMkYp6R71QWzcRyJEWnt2arHEZpPEpHPe9sL7rVaZqdS/RxLPnPWoq8Y
 Q0nTyY1PW1tS8aPF0hVsfJTfIhD7AZ5MFUspJEUxCYd5nGGLqMmXurf+L/WYeCmLVJVe
 c9UhjKqZPwmbs3IZpn6eF1ohP3Bs5BD7A/5yqV5f5ggDlyBYeQvgp66DmyTnMtNH9wNk
 NI3iUiKdFwOvfLzRraauXeL/mTupNXe+CrSVDvyVK6XOa749MsDRZ3TsEgIqoflpEkBj
 Vgv3FS/DNykvJAyuctSZvy2BKNhmdBGhVfyMgxtALQ+NCZe3cYuxZK8f8BLBgZSUJE0U
 KTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=V2YNKMYkRLSbMPSCXijWN2U7P7p3cWA9eRMds81+W0U=;
 b=oR3OxKKQFlb9khSNO1GheAUxoqB47PR3D4A/qFmdJsMd4PwmXMY+73gJchP225g6xI
 a0bHB1cr5E0koIgtOkKgYbFQE5CmdrO7pCZLksm9SanvD8f/aYTdiBcdI2jKTNLUfmnH
 fe0UX4+xLR0dJbBi5xOH73BFbONiQFCqagJ+VjF2KlZ4vbpU38Ik5wm9fp31hSxjhh84
 KOP5JKv1kSy+wl4vPcN35hQUivhdwx9zBqAbtX1m05bFQE+1OciL0J5zuZsgIEFTgyrA
 Hzr4UMnF6LmHk7Gi/9uNjoOMeFgBT5rWqZiw6m72gXRJj5iorsP1wqyYvoAPIMF8g3Fd
 AiBQ==
X-Gm-Message-State: AOAM532Pfg7ldcnjJrmHvtKzuXhAHPG3urN9vrZFSrosYqeb7v+pUsv+
 zXWZuacoAZ+5QPviEbFqBFjz+zOjjNs=
X-Google-Smtp-Source: ABdhPJz5dRGwPZc7LkHZtG2qC48I5pTexe744dEl1UPOqSWkKYvoYb4+CX9xlnttuY5ppSUwjd2Sgg==
X-Received: by 2002:a05:600c:210a:: with SMTP id
 u10mr19890632wml.139.1635025777611; 
 Sat, 23 Oct 2021 14:49:37 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 u6sm6838413wmc.29.2021.10.23.14.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:49:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/33] target/mips: Convert MSA VEC instruction format to
 decodetree
Date: Sat, 23 Oct 2021 23:47:49 +0200
Message-Id: <20211023214803.522078-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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

Convert 3-register instructions with implicit data formats
to decodetree.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  8 ++++
 target/mips/tcg/msa_translate.c | 82 +++++++--------------------------
 2 files changed, 24 insertions(+), 66 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 88757f547eb..72447041fef 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -21,6 +21,7 @@
 @ldst               ...... sa:s10 ws:5 wd:5 .... df:2       &msa_ldst
 @bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
 @bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
+@vec                ...... .....     wt:5 ws:5 wd:5 ......  &msa_r df=0
 @2r                 ...... ........  df:2 ws:5 wd:5 ......  &msa_r wt=0
 @2rf                ...... ......... df:1 ws:5 wd:5 ......  &msa_r wt=0
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_ldst
@@ -77,6 +78,13 @@ BNZ                 010001 111 .. ..... ................    @bz
   SRARI             011110 010 ....... ..... .....  001010  @bit
   SRLRI             011110 011 ....... ..... .....  001010  @bit
 
+  AND_V             011110 00000 ..... ..... .....  011110  @vec
+  OR_V              011110 00001 ..... ..... .....  011110  @vec
+  NOR_V             011110 00010 ..... ..... .....  011110  @vec
+  XOR_V             011110 00011 ..... ..... .....  011110  @vec
+  BMNZ_V            011110 00100 ..... ..... .....  011110  @vec
+  BMZ_V             011110 00101 ..... ..... .....  011110  @vec
+  BSEL_V            011110 00110 ..... ..... .....  011110  @vec
   FILL              011110 11000000 .. ..... .....  011110  @2r
   PCNT              011110 11000001 .. ..... .....  011110  @2r
   NLOC              011110 11000010 .. ..... .....  011110  @2r
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index f54e9d173ac..461a427c9df 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -37,19 +37,9 @@ enum {
     OPC_MSA_3RF_1A  = 0x1A | OPC_MSA,
     OPC_MSA_3RF_1B  = 0x1B | OPC_MSA,
     OPC_MSA_3RF_1C  = 0x1C | OPC_MSA,
-    OPC_MSA_VEC     = 0x1E | OPC_MSA,
 };
 
 enum {
-    /* VEC/2R instruction */
-    OPC_AND_V       = (0x00 << 21) | OPC_MSA_VEC,
-    OPC_OR_V        = (0x01 << 21) | OPC_MSA_VEC,
-    OPC_NOR_V       = (0x02 << 21) | OPC_MSA_VEC,
-    OPC_XOR_V       = (0x03 << 21) | OPC_MSA_VEC,
-    OPC_BMNZ_V      = (0x04 << 21) | OPC_MSA_VEC,
-    OPC_BMZ_V       = (0x05 << 21) | OPC_MSA_VEC,
-    OPC_BSEL_V      = (0x06 << 21) | OPC_MSA_VEC,
-
     /* 3R instruction df(bits 22..21) = _b, _h, _w, d */
     OPC_SLL_df      = (0x0 << 23) | OPC_MSA_3R_0D,
     OPC_ADDV_df     = (0x0 << 23) | OPC_MSA_3R_0E,
@@ -1925,67 +1915,30 @@ TRANS_MSA(FTINT_U,  trans_msa_2rf, gen_helper_msa_ftint_u_df);
 TRANS_MSA(FFINT_S,  trans_msa_2rf, gen_helper_msa_ffint_s_df);
 TRANS_MSA(FFINT_U,  trans_msa_2rf, gen_helper_msa_ffint_u_df);
 
-static void gen_msa_vec_v(DisasContext *ctx)
+static bool trans_msa_vec(DisasContext *ctx, arg_msa_r *a,
+                          void (*gen_msa_vec)(TCGv_ptr, TCGv_i32,
+                                              TCGv_i32, TCGv_i32))
 {
-#define MASK_MSA_VEC(op)    (MASK_MSA_MINOR(op) | (op & (0x1f << 21)))
-    uint8_t wt = (ctx->opcode >> 16) & 0x1f;
-    uint8_t ws = (ctx->opcode >> 11) & 0x1f;
-    uint8_t wd = (ctx->opcode >> 6) & 0x1f;
-    TCGv_i32 twd = tcg_const_i32(wd);
-    TCGv_i32 tws = tcg_const_i32(ws);
-    TCGv_i32 twt = tcg_const_i32(wt);
+    TCGv_i32 twd = tcg_const_i32(a->wd);
+    TCGv_i32 tws = tcg_const_i32(a->ws);
+    TCGv_i32 twt = tcg_const_i32(a->wt);
 
-    switch (MASK_MSA_VEC(ctx->opcode)) {
-    case OPC_AND_V:
-        gen_helper_msa_and_v(cpu_env, twd, tws, twt);
-        break;
-    case OPC_OR_V:
-        gen_helper_msa_or_v(cpu_env, twd, tws, twt);
-        break;
-    case OPC_NOR_V:
-        gen_helper_msa_nor_v(cpu_env, twd, tws, twt);
-        break;
-    case OPC_XOR_V:
-        gen_helper_msa_xor_v(cpu_env, twd, tws, twt);
-        break;
-    case OPC_BMNZ_V:
-        gen_helper_msa_bmnz_v(cpu_env, twd, tws, twt);
-        break;
-    case OPC_BMZ_V:
-        gen_helper_msa_bmz_v(cpu_env, twd, tws, twt);
-        break;
-    case OPC_BSEL_V:
-        gen_helper_msa_bsel_v(cpu_env, twd, tws, twt);
-        break;
-    default:
-        MIPS_INVAL("MSA instruction");
-        gen_reserved_instruction(ctx);
-        break;
-    }
+    gen_msa_vec(cpu_env, twd, tws, twt);
 
     tcg_temp_free_i32(twd);
     tcg_temp_free_i32(tws);
     tcg_temp_free_i32(twt);
+
+    return true;
 }
 
-static void gen_msa_vec(DisasContext *ctx)
-{
-    switch (MASK_MSA_VEC(ctx->opcode)) {
-    case OPC_AND_V:
-    case OPC_OR_V:
-    case OPC_NOR_V:
-    case OPC_XOR_V:
-    case OPC_BMNZ_V:
-    case OPC_BMZ_V:
-    case OPC_BSEL_V:
-        gen_msa_vec_v(ctx);
-        break;
-    default:
-        MIPS_INVAL("MSA instruction");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-}
+TRANS_MSA(AND_V,    trans_msa_vec, gen_helper_msa_and_v);
+TRANS_MSA(OR_V,     trans_msa_vec, gen_helper_msa_or_v);
+TRANS_MSA(NOR_V,    trans_msa_vec, gen_helper_msa_nor_v);
+TRANS_MSA(XOR_V,    trans_msa_vec, gen_helper_msa_xor_v);
+TRANS_MSA(BMNZ_V,   trans_msa_vec, gen_helper_msa_bmnz_v);
+TRANS_MSA(BMZ_V,    trans_msa_vec, gen_helper_msa_bmz_v);
+TRANS_MSA(BSEL_V,   trans_msa_vec, gen_helper_msa_bsel_v);
 
 static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
 {
@@ -2015,9 +1968,6 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
     case OPC_MSA_3RF_1C:
         gen_msa_3rf(ctx);
         break;
-    case OPC_MSA_VEC:
-        gen_msa_vec(ctx);
-        break;
     default:
         MIPS_INVAL("MSA instruction");
         gen_reserved_instruction(ctx);
-- 
2.31.1


