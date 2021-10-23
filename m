Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A1A4385BD
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 00:11:36 +0200 (CEST)
Received: from localhost ([::1]:47724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mePEl-0000pI-DC
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 18:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOtQ-0005qt-P5
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:49:32 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOtO-0005eO-88
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:49:32 -0400
Received: by mail-wm1-x32b.google.com with SMTP id p21so6592166wmq.1
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rRWJ6DnX5aJmnlrbbx5eJIJj5UwX/8+gOkeXTZA3kHs=;
 b=DZmICpnTBpthHOnOOTwIBPFDdUGIqcGVOfLi0+J3/Sc/IrXzPhtpNLMTO1XSEAyRlb
 Ybo41l6SvXpTgqvYzqd3IXERNqywSqTpguLaQ8De1VzzH7y8ku4JEUZPlArzwxKOx/Yy
 Nm1g1+T2MYWyGN2c1r82f2ceAbZx3MO3VahOFMXVvao//ecDsdJUaS59t4CkFJlQTH69
 YG9xW8H+uAWqYliXa/h0a64OweQDsbmQ58RvxhEt7yRioT8nE6E1w/9Mc5aeJw/4L/+E
 sMtQGC9dIQ9b1LDgjk2X0rv6yYiZpJ/ubNPBdBQO/BwWMnbNoyyoXWou/t31E/1F7lcs
 ROLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rRWJ6DnX5aJmnlrbbx5eJIJj5UwX/8+gOkeXTZA3kHs=;
 b=WbckquQ/eHqq7a4Y7gH8l2AI3gK/8hJlPNoNh8NR1ITD+fV0I6Dnfd17aacV3EQE4/
 sRFb270AOurbw4B8uo2FJ/IcQY2a9jpVd6YIZUtlSiwfcPAX2Bxg5zM96vROHsQUGTAY
 LknbrVcbSB0hY4sj/gYOvctACYwGrWJpJQOyzGLPrcCyZ+Ipso7yP3EwnsIJeAhgCnt7
 Lskw3PQn9gnMO677J40JogkR/XVD2HSmK39hPCrFcjA7alOUuONngEU4YKUteKcaF7OC
 5wSyFo3CIwWnQ0vqO4npxUzrzcNLmd52wl7C0oos83XeJpRcc2TaIzBF9zzs9RVX5FL7
 hnTQ==
X-Gm-Message-State: AOAM532Y7pf+0AvJyM9c7baxsnhMJM6XhVBvfYSf0DuxsLzs56L/TUuZ
 xPyc8YAd/Hw29n2nLNQS1oeccXCVCHk=
X-Google-Smtp-Source: ABdhPJyBygAVnsy2ANdanKrJwkkp2dP1jUxjkKsqoN5IAR1NI8ZrcYj9A4nNVIjC9oBnSlZWM1kXtw==
X-Received: by 2002:a05:600c:4f81:: with SMTP id
 n1mr38335876wmq.63.1635025767732; 
 Sat, 23 Oct 2021 14:49:27 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 z1sm12187077wre.21.2021.10.23.14.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:49:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/33] target/mips: Convert MSA FILL opcode to decodetree
Date: Sat, 23 Oct 2021 23:47:47 +0200
Message-Id: <20211023214803.522078-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
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

Convert the FILL opcode (Vector Fill from GPR) to decodetree.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  2 ++
 target/mips/tcg/msa_translate.c | 40 +++++++++++++++++++++++----------
 2 files changed, 30 insertions(+), 12 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 2997bfa24e3..e97490cf880 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -21,6 +21,7 @@
 @ldst               ...... sa:s10 ws:5 wd:5 .... df:2       &msa_ldst
 @bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
 @bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
+@2r                 ...... ........  df:2 ws:5 wd:5 ......  &msa_r wt=0
 @2rf                ...... ......... df:1 ws:5 wd:5 ......  &msa_r wt=0
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_ldst
 @s5                 ...... ... df:2 sa:s5 ws:5 wd:5 ......  &msa_ldst
@@ -76,6 +77,7 @@ BNZ                 010001 111 .. ..... ................    @bz
   SRARI             011110 010 ....... ..... .....  001010  @bit
   SRLRI             011110 011 ....... ..... .....  001010  @bit
 
+  FILL              011110 11000000 .. ..... .....  011110  @2r
   FCLASS            011110 110010000 . ..... .....  011110  @2rf
   FTRUNC_S          011110 110010001 . ..... .....  011110  @2rf
   FTRUNC_U          011110 110010010 . ..... .....  011110  @2rf
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index c6a77381c0e..fc0b80f83ac 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -53,7 +53,6 @@ enum {
     OPC_MSA_2R      = (0x18 << 21) | OPC_MSA_VEC,
 
     /* 2R instruction df(bits 17..16) = _b, _h, _w, _d */
-    OPC_FILL_df     = (0x00 << 18) | OPC_MSA_2R,
     OPC_PCNT_df     = (0x01 << 18) | OPC_MSA_2R,
     OPC_NLOC_df     = (0x02 << 18) | OPC_MSA_2R,
     OPC_NLZC_df     = (0x03 << 18) | OPC_MSA_2R,
@@ -1844,17 +1843,6 @@ static void gen_msa_2r(DisasContext *ctx)
     TCGv_i32 tws = tcg_const_i32(ws);
 
     switch (MASK_MSA_2R(ctx->opcode)) {
-    case OPC_FILL_df:
-#if !defined(TARGET_MIPS64)
-        /* Double format valid only for MIPS64 */
-        if (df == DF_DOUBLE) {
-            gen_reserved_instruction(ctx);
-            break;
-        }
-#endif
-        gen_helper_msa_fill_df(cpu_env, tcg_constant_i32(df),
-                               twd, tws); /* trs */
-        break;
     case OPC_NLOC_df:
         switch (df) {
         case DF_BYTE:
@@ -1913,6 +1901,34 @@ static void gen_msa_2r(DisasContext *ctx)
     tcg_temp_free_i32(tws);
 }
 
+static bool trans_FILL(DisasContext *ctx, arg_msa_r *a)
+{
+    TCGv_i32 twd;
+    TCGv_i32 tws;
+    TCGv_i32 tdf;
+
+    if (!check_msa_access(ctx)) {
+        return false;
+    }
+
+    if (TARGET_LONG_BITS != 64 && a->df == DF_DOUBLE) {
+        /* Double format valid only for MIPS64 */
+        gen_reserved_instruction(ctx);
+        return true;
+    }
+
+    twd = tcg_const_i32(a->wd);
+    tws = tcg_const_i32(a->ws);
+    tdf = tcg_constant_i32(a->df);
+
+    gen_helper_msa_fill_df(cpu_env, tdf, twd, tws); /* trs */
+
+    tcg_temp_free_i32(twd);
+    tcg_temp_free_i32(tws);
+
+    return true;
+}
+
 static bool trans_msa_2rf(DisasContext *ctx, arg_msa_r *a,
                           void (*gen_msa_2rf)(TCGv_ptr, TCGv_i32,
                                               TCGv_i32, TCGv_i32))
-- 
2.31.1


