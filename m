Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286C84385AB
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 00:00:03 +0200 (CEST)
Received: from localhost ([::1]:48544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meP3a-0007R6-0a
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 18:00:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOsd-0004O8-87
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:48:43 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOsb-0005Hl-EU
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:48:42 -0400
Received: by mail-wr1-x434.google.com with SMTP id u18so1391543wrg.5
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eWXKGvZTAb9QLzPIeZwjUz2cD0/0h0fiCLpbOFXLOpg=;
 b=AiY4uKLi6mnTYoxgVMGohV/YLuF0rrwE142gJX+MLAX3Vaq9cIREsEa/X2zibfr5MA
 CvJh/3KtuI2XTBx5gO6lolUGlkZZ8uPdICa9hr4r2aH2JYMQBLoDIwe8hPcQKPt2P2oS
 9hSmZt8jkNzDxl8V82wUsCDizxNOmk+3QwmaUE85qV1WqJZgDDe1Ie91F2RLwZy6ln/1
 42wLFyP189xEOn5srcQBFCkNDs2z1uowQiigGkRWavQCCvaBjVXHAEX2AJXXYH9DWfK9
 IzaLgE55n1baDq9xckFszWaSS8X9mYGWTo2BkIavwRNkHMAEaMhTVXEcAuO3OzWllQrX
 uXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eWXKGvZTAb9QLzPIeZwjUz2cD0/0h0fiCLpbOFXLOpg=;
 b=gZbYTwgeuHFfxQUni122pPbwcsUrxLUdJT84ryLfclqjWMhY728L+MB0/RPGczrCx/
 iRUD5hRR6LfQMILbwbEDRMwX/GWdJ+5vhefMqX9YO/F8sY/Ffb3O/ZQyHPX7KHB8l8cF
 SyzZcF9nXCHM3ipJ/F7NbdRrsTCEw6D5ZKLgNRNSVWWfZNezNDqqryqlR4rL0HhFCdi9
 zGiMvCkTyhwJr8IHIFeTzyFJpYGIMIb5rPkMD/tlSeYunLIro26Cor5GVlIylBLAQA9A
 5BF2jXbpxEVTZXNoRSaPJ9yldJXzLA5aNUL2QIsDX+5UGreLifcn3gm9ojGzsj0fCRRk
 SK7w==
X-Gm-Message-State: AOAM530n1hJS8C0+/wV0N/dRpThF25ItM5LT/QT7b/zqfHd1z+GAJ1uT
 lsLB1yUWNxF4NAC6IiUrfcbGAkvlKqM=
X-Google-Smtp-Source: ABdhPJyAmDkRRpGx6W2ZCSCfTJUrhg0xoVCkITmpw5QZKhkvIVjGx8zE5Vs/ELPkaRLi3s2F8t36bA==
X-Received: by 2002:adf:8919:: with SMTP id s25mr10560428wrs.185.1635025719845; 
 Sat, 23 Oct 2021 14:48:39 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 e9sm11908032wrn.2.2021.10.23.14.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:48:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/33] target/mips: Rename sa16 -> sa, bz_df -> bz -> bz_v
Date: Sat, 23 Oct 2021 23:47:37 +0200
Message-Id: <20211023214803.522078-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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

This 'shift amount' format is not always 16-bit, so name it
generically as 'sa'. This will help to unify the various
arg_msa decodetree generated structures.

Rename the @bz format -> @bz_v (specific @bz with df=3) and
@bz_df -> @bz (generic @bz).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      | 15 +++++++--------
 target/mips/tcg/msa_translate.c | 20 ++++++++++----------
 2 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 74d99f6862c..aa784cf12a9 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -13,19 +13,18 @@
 
 &r                  rs rt rd sa
 
-&msa_bz             df wt s16
+&msa_bz             df       wt sa
 
 @lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &r
-@bz                 ...... ... ..   wt:5 s16:16             &msa_bz df=3
-@bz_df              ...... ... df:2 wt:5 s16:16             &msa_bz
+@bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
+@bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
 
 LSA                 000000 ..... ..... ..... 000 .. 000101  @lsa
 DLSA                000000 ..... ..... ..... 000 .. 010101  @lsa
 
-BZ_V                010001 01011  ..... ................    @bz
-BNZ_V               010001 01111  ..... ................    @bz
-
-BZ_x                010001 110 .. ..... ................    @bz_df
-BNZ_x               010001 111 .. ..... ................    @bz_df
+BZ_V                010001 01011  ..... ................    @bz_v
+BNZ_V               010001 01111  ..... ................    @bz_v
+BZ                  010001 110 .. ..... ................    @bz
+BNZ                 010001 111 .. ..... ................    @bz
 
 MSA                 011110 --------------------------
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 1c4a802ff55..c2a48aecc46 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -350,7 +350,7 @@ static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt,
     tcg_temp_free_i64(t1);
 }
 
-static bool gen_msa_BxZ_V(DisasContext *ctx, int wt, int s16, TCGCond cond)
+static bool gen_msa_BxZ_V(DisasContext *ctx, int wt, int sa, TCGCond cond)
 {
     TCGv_i64 t0;
 
@@ -368,7 +368,7 @@ static bool gen_msa_BxZ_V(DisasContext *ctx, int wt, int s16, TCGCond cond)
     tcg_gen_trunc_i64_tl(bcond, t0);
     tcg_temp_free_i64(t0);
 
-    ctx->btarget = ctx->base.pc_next + (s16 << 2) + 4;
+    ctx->btarget = ctx->base.pc_next + (sa << 2) + 4;
 
     ctx->hflags |= MIPS_HFLAG_BC;
     ctx->hflags |= MIPS_HFLAG_BDS32;
@@ -378,15 +378,15 @@ static bool gen_msa_BxZ_V(DisasContext *ctx, int wt, int s16, TCGCond cond)
 
 static bool trans_BZ_V(DisasContext *ctx, arg_msa_bz *a)
 {
-    return gen_msa_BxZ_V(ctx, a->wt, a->s16, TCG_COND_EQ);
+    return gen_msa_BxZ_V(ctx, a->wt, a->sa, TCG_COND_EQ);
 }
 
 static bool trans_BNZ_V(DisasContext *ctx, arg_msa_bz *a)
 {
-    return gen_msa_BxZ_V(ctx, a->wt, a->s16, TCG_COND_NE);
+    return gen_msa_BxZ_V(ctx, a->wt, a->sa, TCG_COND_NE);
 }
 
-static bool gen_msa_BxZ(DisasContext *ctx, int df, int wt, int s16, bool if_not)
+static bool gen_msa_BxZ(DisasContext *ctx, int df, int wt, int sa, bool if_not)
 {
     if (!check_msa_access(ctx)) {
         return false;
@@ -399,21 +399,21 @@ static bool gen_msa_BxZ(DisasContext *ctx, int df, int wt, int s16, bool if_not)
 
     gen_check_zero_element(bcond, df, wt, if_not ? TCG_COND_EQ : TCG_COND_NE);
 
-    ctx->btarget = ctx->base.pc_next + (s16 << 2) + 4;
+    ctx->btarget = ctx->base.pc_next + (sa << 2) + 4;
     ctx->hflags |= MIPS_HFLAG_BC;
     ctx->hflags |= MIPS_HFLAG_BDS32;
 
     return true;
 }
 
-static bool trans_BZ_x(DisasContext *ctx, arg_msa_bz *a)
+static bool trans_BZ(DisasContext *ctx, arg_msa_bz *a)
 {
-    return gen_msa_BxZ(ctx, a->df, a->wt, a->s16, false);
+    return gen_msa_BxZ(ctx, a->df, a->wt, a->sa, false);
 }
 
-static bool trans_BNZ_x(DisasContext *ctx, arg_msa_bz *a)
+static bool trans_BNZ(DisasContext *ctx, arg_msa_bz *a)
 {
-    return gen_msa_BxZ(ctx, a->df, a->wt, a->s16, true);
+    return gen_msa_BxZ(ctx, a->df, a->wt, a->sa, true);
 }
 
 static void gen_msa_i8(DisasContext *ctx)
-- 
2.31.1


